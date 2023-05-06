import numpy as np
import matplotlib.pyplot as plt
import itertools

PARAMS = True


# Define the cross-entropy function
def cross_entropy(target, prediction):
    eps = 1e-15  # Add small value to prevent log(0)
    return -np.mean(
        target * np.log(prediction + eps) + (1 - target) * np.log(1 - prediction + eps)
    )


def ditsribution_plots():
    # Create a meshgrid of input values for the function

    xs = np.linspace(0.01, 0.99, 100)
    ys = np.linspace(0.01, 0.99, 100)
    p, q = np.meshgrid(xs, ys)

    # Calculate the cross-entropy for each combination of input values
    h = np.zeros((100, 100))
    for i, j in itertools.product(range(100), range(100)):
        h[i, j] = cross_entropy(np.array([0, 1]), np.array([p[i, j], q[i, j]]))

    plt.tight_layout()

    # Create the 3D plot
    fig = plt.figure(figsize=(12, 9))
    ax = fig.add_subplot(111, projection="3d")
    surf = ax.plot_surface(p, q, h, cmap="coolwarm", linewidth=0, antialiased=False)
    ax.set_xlabel("$q$")
    ax.set_ylabel("$p$")
    ax.set_zlabel("Entropie croisée")

    # Add a colorbar
    fig.colorbar(surf, shrink=0.5, aspect=5)

    # Rotate the plot
    ax.view_init(20, 60)

    fig.tight_layout()
    plt.savefig("./assets/python/cross-entropy3D.pdf")

    # Create a 2D plot
    fig = plt.figure()
    ax = fig.add_subplot(111)
    # p = 0
    ax.plot(xs, h[-1, :], label="$p=0$")
    # p = 1
    ax.plot(xs, h[-1, ::-1], label="$p=1$")
    ax.set_xlabel("$q$")
    ax.set_ylabel("Entropie croisée")
    ax.legend()
    plt.savefig("./assets/python/cross-entropy-2D.pdf")


def param_plots():
    # create data
    np.random.seed(42)
    x1, x2 = np.random.normal(size=(2, 100))
    y = np.random.binomial(1, 1 / (1 + np.exp(x1 - x2)))

    # create cross-entropy loss surface
    w1s = np.linspace(-5, 5, 100)
    w2s = np.linspace(-5, 5, 100)
    w1, w2 = np.meshgrid(w1s, w2s)

    losses = np.zeros((100, 100))
    for i, j in itertools.product(range(100), range(100)):
        pred = 1 / (1 + np.exp(-(w1[i, j] * x1 + w2[i, j] * x2)))
        losses[i, j] = cross_entropy(y, pred)

    # plot
    fig = plt.figure(figsize=(12, 9))
    ax = fig.add_subplot(111, projection="3d")
    surf = ax.plot_surface(
        w1, w2, losses, cmap="coolwarm", linewidth=0, antialiased=False
    )
    ax.set_xlabel("$w_1$")
    ax.set_ylabel("$w_2$")
    ax.set_zlabel("Entropie croisée")
    fig.colorbar(surf, shrink=0.5, aspect=5)

    # Rotate the plot
    ax.view_init(20, 60)

    fig.tight_layout()
    plt.savefig("./assets/python/cross-entropy.pdf")


if __name__ == "__main__":
    if PARAMS:
        param_plots()
    else:
        ditsribution_plots()
