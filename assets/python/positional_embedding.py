from matplotlib import pyplot as plt
from mpl_toolkits.axes_grid1 import make_axes_locatable
from numpy import arange, cos, sin, zeros
from pathlib import Path

root = Path("./assets/python/")


A = 10 ** 4
d = 512
max_len = 300

x = arange(0, d, 2)
div_term = A ** (x / d)
pos = arange(0, max_len).reshape(-1, 1)
pe = zeros((max_len, d))
pe[:, 0::2] = sin(pos / div_term)
pe[:, 1::2] = cos(pos / div_term)

fig, ax = plt.subplots()
im = ax.imshow(pe, cmap="RdBu")

# colorbar height
divider = make_axes_locatable(ax)
cax = divider.append_axes("right", size="5%", pad=0.25)
fig.colorbar(im, cax, ax=ax)
plt.savefig(root / "positional_embedding.pdf", bbox_inches="tight")
