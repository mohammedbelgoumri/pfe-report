from matplotlib import pyplot as plt
import seaborn as sns
import pandas as pd


def bleu():
    df = pd.read_csv("assets/data/pre/bleu.csv")
    epoch = df["epoch"]
    val = df["toasty-shape-289 - val/bleu_score"]
    train = df["toasty-shape-289 - train_epoch/bleu_score"]
    sns.set(style="whitegrid", palette="colorblind")
    fig, ax = plt.subplots(figsize=(10, 5))
    ax.plot(epoch, val, label="validation")
    ax.plot(epoch, train, label="Entraînement")
    ax.set_xlabel("Epoch")
    ax.set_ylabel("Score BLEU")
    ax.legend()
    plt.tight_layout()
    fig.savefig("assets/python/bleu.pdf")


def accuracy():
    df = pd.read_csv("assets/data/pre/accuracy.csv")
    epoch = df["epoch"]
    val = df["toasty-shape-289 - val/accuracy"]
    train = df["toasty-shape-289 - train_epoch/accuracy"]
    sns.set(style="whitegrid", palette="colorblind")
    fig, ax = plt.subplots(figsize=(10, 5))
    ax.plot(epoch, val, label="validation")
    ax.plot(epoch, train, label="Entraînement")
    ax.set_xlabel("Epoch")
    ax.set_ylabel("Exactitude")
    ax.legend()
    plt.tight_layout()
    fig.savefig("assets/python/accuracy.pdf")


def loss():
    df = pd.read_csv("assets/data/pre/loss.csv")
    epoch = df["epoch"]
    val = df["toasty-shape-289 - val/loss"]
    train = df["toasty-shape-289 - train_epoch/loss"]
    sns.set(style="whitegrid", palette="colorblind")
    fig, ax = plt.subplots(figsize=(10, 5))
    ax.plot(epoch, val, label="Perte")
    ax.plot(epoch, train, label="Perte")
    ax.set_xlabel("Epoch")
    ax.set_ylabel("Perte")
    ax.legend()
    plt.tight_layout()
    fig.savefig("assets/python/loss.pdf")


def main():
    bleu()
    accuracy()
    loss()


if __name__ == "__main__":
    main()
