import numpy as np
import matplotlib.pyplot as plt


class Airfoil:
    def __init__(self, path):
        self.load(path)

    def load(self, path):
        upper = []
        lower = []

        lines = []

        with open(path, "r") as file:
            for line in file:
                lines += [line.strip()]

        assert lines[0][0:4] == "NACA"
        self.name = lines[0]

        dimension = lines[1].split()
        dimension = [s.rstrip(".") for s in dimension]
        upperSize, lowerSize = [int(s) for s in dimension]

        # skip header and blank lins
        i = 2
        while lines[i] == "":
            i += 1

        for _ in range(upperSize):
            point = lines[i].split()
            assert len(point) == 2
            point = [float(s) for s in point]
            upper.append(point)
            i += 1

        assert lines[i] == ""  # we should be done with the upper part
        while lines[i] == "":
            i += 1

        for _ in range(lowerSize):
            point = lines[i].split()
            assert len(point) == 2
            point = [float(s) for s in point]
            lower.append(point)
            i += 1

        self.upper = np.array(upper)
        self.lower = np.array(lower)

    def plot(self):
        upper_x = np.array([point[0] for point in self.upper])
        upper_y = np.array([point[1] for point in self.upper])
        lower_x = np.array([point[0] for point in self.lower])
        lower_y = np.array([point[1] for point in self.lower])
        plt.plot(upper_x, upper_y)
        plt.plot(lower_x, lower_y)
        plt.show()


if __name__ == "__main__":
    airfoil = Airfoil("./aux/naca0012.txt")
    airfoil.plot()
