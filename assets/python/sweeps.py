from matplotlib import pyplot as plt
from matplotlib.ticker import FuncFormatter
import seaborn as sns
import pandas as pd
import numpy as np


def main():
    df = pd.read_csv("assets/data/sweeps.csv")
    bleu = df["val/bleu_score"]
    name = df["Name"]
    time = df["Created"]
    maxs = bleu.cummax()
    index = np.arange(1, len(time) + 1, dtype=np.uint8)

    sns.set(style="whitegrid", palette="colorblind")
    graph = sns.scatterplot(
        x=index, y=bleu, hue=index, legend=False, palette="colorblind"
    )
    sns.lineplot(x=index, y=maxs)
    graph.xaxis.set_major_formatter(FuncFormatter(lambda x, _: int(x)))

    plt.xlabel("Numéro de l'essai")
    plt.ylabel("Score bleu de validation (%)")
    plt.tight_layout()
    plt.savefig("assets/python/sweeps.pdf")


if __name__ == "__main__":
    main()
