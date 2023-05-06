from matplotlib import pyplot as plt
import numpy as np

ox = np.array([1, 0])

theta = np.pi / 20
rot = np.array([[np.cos(theta), -np.sin(theta)], [np.sin(theta), np.cos(theta)]])

cat = rot @ ox
dog = np.linalg.matrix_power(rot, 3) @ cat
puppy = rot @ dog
houses = np.linalg.matrix_power(rot, 4) @ puppy

embeddings = [cat, dog, puppy, houses]
words = ["chat", "chien", "chiot", "maisons"]
colors = ["blue", "red", "green", "gray"]

plt.xlim(0, 1.1)
plt.ylim(0, 1.1)
plt.margins(x=0, y=0)
for word, embedding, color in zip(words, embeddings, colors):
    plt.arrow(0, 0, embedding[0], embedding[1], color=color, head_width=0.02)
    plt.text(embedding[0] + 0.02, embedding[1] + 0.02, word, color=color)
plt.savefig("./assets/python/word-embeddings.pdf")
