from matplotlib import pyplot as plt
import seaborn as sns
import pandas as pd


def main():
    df = pd.read_csv("assets/data/plot.csv")
    epoch = df["epoch"]
    bleu = df["eternal-cherry-61 - val/bleu_score"]
    sns.set(style="whitegrid", palette="muted")
    fig, ax = plt.subplots(figsize=(10, 5))
    ax.plot(epoch, bleu, label="validation BLEU Score")
    ax.set_xlabel("Epoch")
    ax.set_ylabel("BLEU Score")
    ax.legend()
    plt.tight_layout()
    fig.savefig("assets/python/bleu.pdf")

    df = pd.read_csv("assets/data/plot.csv")
    epoch = df["epoch"]
    accuracy = df["eternal-cherry-61 - val/bleu_score"]
    sns.set(style="whitegrid", palette="muted")
    fig, ax = plt.subplots(figsize=(10, 5))
    ax.plot(epoch, bleu, label="validation accuracy")
    ax.set_xlabel("Epoch")
    ax.set_ylabel("Accuracy")
    ax.legend()
    plt.tight_layout()
    fig.savefig("assets/python/accuracy.pdf")


if __name__ == "__main__":
    main()
