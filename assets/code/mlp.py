from typing import Sequence
from numpy import array_split as blocks


def mlp(x):
    pass


def mlp_s2s(xs: Sequence, k: int) -> Sequence:
    ys = []  # Initialiser la sortie
    for x in blocks(xs, k):  # Parcourir les blocs
        y = mlp(x)  # Traiter chaque bloc
        ys.append(y)  # Concatener les resultats
    return ys
