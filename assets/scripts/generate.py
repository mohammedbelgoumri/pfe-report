import os
import time

import openai
from yaml import Dumper, dump

openai.api_key = os.getenv("openai")

system_prompt = """You are a linguisitics researcher. 
you are trying to understand the speaking patterns of people with aphasia. 
You will be given a french word. You must try to modify it in the same way a french speaker with aphasia would.
Your response should be a single word, with no punctuation, nor line breaks.
"""
num_errors_per_word = 10
errors = {}
for word in words:
    prompt = f'Deforme le mot "{word}" a la facon dont le ferait un aphasique de Broca. Repond avec un seul mot.'
    success = False
    ntries = 0
    while not success:
        try:
            responses = openai.ChatCompletion.create(
                model="gpt-3.5-turbo",
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": prompt},
                ],
                timeout=100,
                n=num_errors_per_word,
            )
        except openai.error.RateLimitError:
            ntries += 1
            print(f"Retry {ntries}")
            time.sleep(1)
            continue
        success = True
    variants = [response["message"]["content"] for response in responses["choices"]]
    errors[word] = variants

with open("errors.yaml", "x", encoding="utf-8") as f:
    dump(errors, f, Dumper, allow_unicode=True)
