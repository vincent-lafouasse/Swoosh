import numpy as np
import matplotlib.pyplot as plt


class Naca0012:
    DAT_PATH = "./aux/naca0012.dat"
    GEO_PATH = "./aux/naca0012.geo"

    def __init__(self):
        self.load(self.DAT_PATH)

    def load(self, path):
        lines = []
        with open(path, "r") as file:
            for line in file:
                lines += [line.strip()]

        id = "NACA 0012"
        assert lines[0][0:len(id)] == id
        self.name = lines[0]

        points = []
        for line in lines[1:]:
            point = line.split()
            assert len(point) == 2
            point = [float(s) for s in point]
            points.append(point)

        self.points = np.array(points)

    def toGeo(self):
        with open(self.GEO_PATH, "w") as outfile:
            for i in range(len(self.points)):
                x, y = self.points[i]
                outfile.write(f"Point({i + 1}) = {{{x}, {y}, 0, 1.0}};\n")

            # nPoints = pointIndex - 1
            # outfile.write(f"Line(1) = {{")
            # for i in range(1, nPoints + 1):
            #     outfile.write(f"{i}, ")
            # outfile.write(f"1}};\n")

    def plot(self):
        x = np.array([point[0] for point in self.points])
        y = np.array([point[1] for point in self.points])

        plt.plot(x, y)
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


            # outfile.write(f"Line(1) = {{")
            # for i in range(1, nPoints + 1):
            #     outfile.write(f"{i}, ")
            # outfile.write(f"1}};\n")

    def plot(self):
        x = np.array([point[0] for point in self.points])
        y = np.array([point[1] for point in self.points])
        plt.plot(x, y)
        plt.axis("equal")
        plt.show()


if __name__ == "__main__":
    airfoil = Naca0012()
    airfoil.plot()
    airfoil.toGeo()
