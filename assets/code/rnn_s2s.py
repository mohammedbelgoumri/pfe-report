from typing import Sequence


class Vector:
    pass

class RNN:
     pass

eos = None

def rnn_s2s(xs:Sequence) -> Sequence:
    encoder = RNN() # encodeur recurrent
    decoder = RNN() # decodeur recurrent
    ys = [] # sequence de sortie initialement vide
    h = encoder(xs) # encode la sequence d'entree

    while True:
        # decoder sequentiellement
        h = decoder(0, h) 
        ys.append(h) 
        if h == eos: # si on a genere le symbole de fin
            # on arrete la generation
            break
    return ys
        