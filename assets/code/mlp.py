from typing import Sequence, Callable


def embedding(input):
    pass


def mlp_sequence(input: Sequence) -> Sequence:
    output = []
    for element in input:
        e = embedding(element)
        output.append(e)
    return output
