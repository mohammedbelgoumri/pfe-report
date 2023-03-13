from typing import Sequence


class Vector:
    pass


def process(x: Vector) -> Vector:
    pass


def rnn_pass(xs: Sequence, h=0) -> Vector:
    for x in xs:  # pour chaque element de la sequence
        # traitement de l'element + mise a jour de l'etat
        h = process(x, h)
    return h  # retourne l'etat final
