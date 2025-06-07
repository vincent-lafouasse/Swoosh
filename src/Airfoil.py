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

    def toGeo(self):
        path = "./aux/naca0012.geo"

        pointIndex = 1
        with open(path, "w") as outfile:
            for i in range(len(self.upper)):
                x, y = self.upper[i]
                outfile.write(f"Point({pointIndex}) = {{{x}, {y}, 0, 1.0}};\n")
                pointIndex += 1

            for i in reversed(range(len(self.lower))):
                x, y = self.lower[i]
                outfile.write(f"Point({pointIndex}) = {{{x}, {y}, 0, 1.0}};\n")
                pointIndex += 1

            nPoints = pointIndex - 1
            for i in range(1, nPoints):
                outfile.write(f"Line({i}) = {{{i}, {i + 1}}};\n")
            outfile.write(f"Line({nPoints}) = {{{1}, {nPoints}}};\n")

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

    def toGeo(self):
        path = "./aux/s9104.geo"

        with open(path, "w") as outfile:
            nPoints = len(self.points)
            for i in range(nPoints):
                x, y = self.points[i]
                outfile.write(f"Point({i + 1}) = {{{x}, {y}, 0, 1.0}};\n")

            for i in range(1, nPoints):
                outfile.write(f"Line({i}) = {{{i}, {i + 1}}};\n")
            outfile.write(f"Line({nPoints}) = {{{1}, {nPoints}}};\n")

    def plot(self):
        x = np.array([point[0] for point in self.points])
        y = np.array([point[1] for point in self.points])
        plt.plot(x, y)
        plt.axis("equal")
        plt.show()


if __name__ == "__main__":
    airfoil = S9104()
    # airfoil.plot()
    airfoil.toGeo()
