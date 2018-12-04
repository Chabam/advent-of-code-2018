#!/usr/bin/python3

import re

def main():
    textile = []
    for i in range(1000):
        line = []
        for j in range(1000):
            line.append(0)
        textile.append(line)

    input_raw = open("input", "r")
    input_lines = input_raw.readlines()

    for line in input_lines:
        m = re.search("#[0-9]+ @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)", line)
        left_offset = int(m.group(1))
        top_offset = int(m.group(2))
        width = int(m.group(3))
        height = int(m.group(4))

        for i in range(top_offset, top_offset + height):
            for j in range(left_offset, left_offset + width):
                textile[i][j] += 1
    overlapping = 0
    for i in range(1000):
        for j in range(1000):
            if textile[i][j] > 1:
                overlapping += 1
    print(overlapping)

if __name__ == "__main__":
    main()