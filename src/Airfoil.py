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

        print(i)


if __name__ == "__main__":
    airfoil = Airfoil("./aux/naca0012.txt")
    print(airfoil.name)
