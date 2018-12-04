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

    pieces = []
    for line in input_lines:
        m = re.search("#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)", line)
        id = int(m.group(1))
        left_offset = int(m.group(2))
        top_offset = int(m.group(3))
        width = int(m.group(4))
        height = int(m.group(5))
        pieces.append((id, left_offset, top_offset, width, height))

        for i in range(top_offset, top_offset + height):
            for j in range(left_offset, left_offset + width):
                textile[i][j] += 1

    non_overlapped = None

    for piece in pieces:
        found = True
        for i in range(piece[2], piece[2] + piece[4]):
            for j in range(piece[1], piece[1] + piece[3]):
                if textile[i][j] != 1:
                    found = False
                    break
        if found:
            non_overlapped = piece[0]
            break
    print(non_overlapped)

if __name__ == "__main__":
    main()