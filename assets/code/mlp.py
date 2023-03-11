from typing import Sequence
embedding = None


def mlp_sequence(input: Sequence):
    output = []
    for element in input:
        e = embedding(element)
        output.append(e)
    return output
