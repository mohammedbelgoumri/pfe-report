from matplotlib import pyplot as plt
from numpy import arange, cos, sin
from pathlib import Path

root = Path("./assets/matplotlib")


A = 10 ** 4
d = 256
max_len = 100

x = arange(0, d, 2)
div_term = A ** (x / d)
pos = arange(0, max_len).reshape(-1, 1)
pe = pos / div_term

pe[:, 0::2] = sin(pe[:, 0::2])
pe[:, 1::2] = cos(pe[:, 1::2])

fig, ax = plt.subplots()
cax = ax.matshow(pe, cmap="RdBu")
fig.colorbar(cax)
fig.tight_layout()
plt.savefig(root / "positional_embedding.pdf")
