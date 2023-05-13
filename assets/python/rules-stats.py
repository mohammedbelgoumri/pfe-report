from matplotlib import pyplot as plt
import seaborn as sns
import numpy as np


def main():
    freqs = np.array([0.51, 0.25, 0.13, 0.11]) * 100
    labels = ["Suppression", "Substitution", "Transposition", "Insertion"]
    sns.set_style("whitegrid")
    sns.set_palette("colorblind")
    sns.barplot(x=labels, y=freqs)
    plt.xlabel("Type d'erreur")
    plt.ylabel("Fréquence (%)")
    plt.tight_layout()
    plt.savefig("./assets/python/rules-stats.pdf")


if __name__ == "__main__":
    main()
