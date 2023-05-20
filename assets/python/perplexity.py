from matplotlib import pyplot as plt
import seaborn as sns
import numpy as np
import pandas as pd


def main():
    df = {
        "french": {
            "gpt-2": 392.07,
            "gpt-2-large": 182.20,
            "gpt-fr-cased-small": 147.84,
            "gpt-fr-cased-base": 123.93,
        },
        "aphasia": {
            "gpt-2": 566.07,
            "gpt-2-large": 417.30,
            "gpt-fr-cased-small": 1357.31,
            "gpt-fr-cased-base": 1023.12,
        },
    }

    df = pd.DataFrame(df)
    x = np.arange(len(df.index))
    sns.set(style="whitegrid", palette="colorblind")
    plt.bar(x - 0.2, df["french"], 0.4, label="Français")
    plt.bar(x + 0.2, df["aphasia"], 0.4, label="Aphasie")
    plt.xticks(x, df.index, rotation=90)
    plt.ylabel("Perplexité")
    plt.legend()
    plt.tight_layout()
    plt.savefig("assets/python/perplexity.pdf")


if __name__ == "__main__":
    main()
