class Airfoil:
    def __init__(self, path):
        self.load(path)

    def load(self, path):
        self.upper = []
        self.lower = []

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
            self.upper.append(point)
            i += 1

        assert lines[i] == ""  # we should be done with the upper part
        while lines[i] == "":
            i += 1

        for _ in range(lowerSize):
            point = lines[i].split()
            assert len(point) == 2
            point = [float(s) for s in point]
            self.lower.append(point)
            i += 1


if __name__ == "__main__":
    airfoil = Airfoil("./aux/naca0012.txt")
    print(airfoil.name)
    print(airfoil.upper)
    print(airfoil.lower)
