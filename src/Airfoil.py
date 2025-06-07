import numpy as np
import matplotlib.pyplot as plt


class Naca0012:
    def __init__(self):
        path = "./aux/naca0012.txt"
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
        plt.axis("equal")
        plt.show()


class S9104:
    def __init__(self):
        path = "./aux/s9104.txt"
        self.load(path)

    def load(self, path):
        points = []

        lines = []
        with open(path, "r") as file:
            for line in file:
                lines += [line.strip()]

        assert lines[0][0:5] == "S9104"
        self.name = lines[0]

        for line in lines[1:]:
            if line == "":
                break

            point = line.split()
            point = [float(s) for s in point]
            assert len(point) == 2
            points.append(point)

        self.points = np.array(points)

    def plot(self):
        x = np.array([point[0] for point in self.points])
        y = np.array([point[1] for point in self.points])
        plt.plot(x, y)
        plt.axis("equal")
        plt.show()


if __name__ == "__main__":
    airfoil = S9104()
    airfoil.plot()
