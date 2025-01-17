import argparse
import glob
import json
import numpy as np
import os
import sys
import re

from numpy.typing import NDArray
from subprocess import run
from typing import Dict


def load_grammar(filename: str) -> Dict[str, Dict[str, int]]:
    if not os.path.isfile(filename):
        print("Invalid grammar file.", file=sys.stderr)
        exit(1)

    with open(filename, "r") as file:
        grammar = json.load(file)

    return grammar


def get_token_to_index_map(grammar: Dict[str, Dict[str, int]]) -> Dict[str, int]:
    productions = set()

    for production in grammar:
        productions.add(production)

    tokens = set()

    for rule in grammar.values():
        for rhs in rule:
            for symbol in rhs.split(" "):
                if symbol not in productions:
                    tokens.add(symbol)

    tokens.remove("%empty")
    token_to_index = {token: i for i, token in enumerate(tokens)}
    return token_to_index


def compute_histograms(
    dir_path: str, verible_path: str, token_to_index: Dict[str, int]
) -> NDArray[np.float32]:
    histograms = []
    for file in glob.iglob(os.path.join(dir_path, "*.*v")):
        print(f"Analyzing {file}", file=sys.stderr)

        proc = run(
            [verible_path, "--printtokens", file], encoding="utf-8", capture_output=True
        )

        out = proc.stdout.splitlines()
        start_offset = 2
        for line in out:
            if line == "":
                break
            start_offset += 1

        histogram = np.zeros(shape=len(token_to_index), dtype=np.float32)
        for line in out[start_offset:-1]:
            token = re.search(r"#(.*?) @", line).group(1)
            histogram[token_to_index[token]] += 1

        histograms.append(histogram)

    return np.array(histograms, dtype=np.float32)


def avg_distance_to_centroid(
    histograms: NDArray[np.float32], centroid: NDArray[np.float32]
):
    return np.linalg.norm(histograms - centroid, axis=1).mean()


def distinct_number_of_tokens(centroid: NDArray[np.float32]):
    return np.count_nonzero(centroid)


def average_number_of_tokens(histograms: NDArray[np.float32]):
    return histograms.sum(axis=1).mean()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "grammar_json",
        type=str,
        help="Local path to the JSON grammar",
    )
    parser.add_argument(
        "verible_parser_binary",
        type=str,
        help="Local path to Verible's parser binary (verible-verilog-syntax)",
    )
    parser.add_argument(
        "target_directory",
        type=str,
        help="Local path to directory with Verilog programs",
    )
    args = parser.parse_args()

    token_to_index = get_token_to_index_map(load_grammar(args.grammar_json))
    histograms = compute_histograms(
        args.target_directory, args.verible_parser_binary, token_to_index
    )
    centroid = histograms.mean(axis=0)
    print("--------------------- Centroid -------------------")
    print(centroid, end="\n\n")

    print("---------- Average distance to centroid ----------")
    print(avg_distance_to_centroid(histograms, centroid), end="\n\n")

    print("------------ Distinct number of tokens -----------")
    print(distinct_number_of_tokens(centroid), end="\n\n")

    print("------------ Average number of tokens ------------")
    print(average_number_of_tokens(histograms))


if __name__ == "__main__":
    main()
