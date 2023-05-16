import numpy as np
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt


def main():
    df = {
        "dropout": {"Importance": 0.639, "Corrélation": -0.899},
        "lr": {"Importance": 0.361, "Corrélation": -0.647},
    }

    df = {
        "metric": ["dropout", "lr", "dropout", "lr"],
        "type": ["Importance", "Importance", "Corrélation", "Corrélation"],
        "value": [0.639, 0.361, -0.899, -0.647],
    }

    df = pd.DataFrame(df)

    sns.set(style="whitegrid", palette="colorblind")
    fig, ax = plt.subplots(figsize=(6, 3))
    sns.barplot(data=df, y="metric", x="value", hue="type", width=0.5, ax=ax)
    ax.set_xlabel("")
    ax.set_ylabel("")
    plt.legend()
    plt.tight_layout()
    fig.savefig("assets/python/importance.pdf")

    # fig, ax = plt.subplots(1, 2, sharey=True)
    # x = np.arange(len(df.index))
    # sns.set(style="whitegrid", palette="colorblind")
    # ax[0].barh(df.loc["dropout", "Importance"], width=0.2, label="Importance")
    # ax[0].barh(df.loc["dropout", "Corrélation"], width=0.2, label="Corrélation")
    # ax[1].barh(df.loc["lr", "Importance"], width=0.2, label="Importance")
    # ax[1].barh(df.loc["lr", "Corrélation"], width=0.2, label="Corrélation")
    # ax[0].set_title("Dropout")
    # ax[1].set_title("Learning rate")
    # plt.legend()
    # plt.tight_layout()
    # plt.show()


if __name__ == "__main__":
    main()
