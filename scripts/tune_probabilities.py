"""Update JSON with probabilities

This script updates the JSON file with the probabilistic context-free grammar
to avoid having production rules with very small probabilities. The
normalization through a sigmoid with temperature. For high temperatures, the
distribution will be more spread out. However the relative order between
probabilities for a production rule will be respected during normalization.

The counts for a production rule will only be normalized if the log of the
maximum count divided by the minimum count for this rule is greater than a
constant threshold, which can be set as an argument.

Usage:
    tune_probabilities.py [-h] [--output_file OUTPUT_FILE]
                          [--threshold THRESHOLD] [--temp TEMP]
                          probabilities_path

Arguments:
    probabilities_path
        (str) Path to the JSON with probabilities.
    --output_file OUTPUT_FILE
        (str) Output path for the JSON with updated probabilities (default: ./updated_probabilities.json).
    --threshold THRESHOLD, -c THRESHOLD
        (int) Threshold that defines if the counts for rule will be normalized (default: 3).
    --temp TEMP
        (float) Temperature for the normalization function (default: 1).
    -h, --help
        show help message and exit
"""

import argparse
import json
import numpy as np
import numpy.typing as npt
import os
import sys


def convert_float_array_to_int(normalized_counts: npt.NDArray) -> npt.NDArray:
    min_exponent = abs(np.floor(np.log10(normalized_counts)).min())
    # The base exponent is used to guarantee that counts won't be too small
    base_exponent = 3
    scaling_factor = 10 ** (min_exponent + base_exponent)
    return np.round(normalized_counts * scaling_factor).astype(int).tolist()


def z_score_scaling(counts: npt.NDArray) -> npt.NDArray:
    return (counts - np.mean(counts)) / np.std(counts)


def sigmoid(counts: npt.NDArray, temperature: float) -> npt.NDArray:
    counts = z_score_scaling(counts)
    counts = counts / temperature
    return 1 / (1 + np.exp(-counts))


def update_counts(probabilities: dict, threshold: int, temperature: float) -> list:
    updated_rules = []
    for rule, productions in probabilities.items():
        counts = np.array(list(productions.values()))
        max_count = counts.max()
        min_count = counts.min()

        if np.log2(max_count / min_count) > threshold:
            updated_rules.append(rule)
            normalized_counts = convert_float_array_to_int(sigmoid(counts, temperature))
            for key, count in zip(productions.keys(), normalized_counts):
                productions[key] = count

    return updated_rules


def read_json(probabilities_path: str) -> dict:
    with open(probabilities_path, "r", encoding="utf-8") as input_json:
        json_content = input_json.read()

    return json.loads(json_content if json_content != "" else "{}")


def save_json(probabilities: dict, output_file: str) -> None:
    with open(output_file, "w", encoding="utf-8") as file:
        json.dump(probabilities, file)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "probabilities_path",
        type=str,
        help="(%(type)s) Path to the JSON with probabilities.",
    )
    parser.add_argument(
        "--output_file",
        type=str,
        help="(%(type)s) Output path for the JSON with updated probabilities (default: %(default)s).",
        default="./updated_probabilities.json",
    )
    parser.add_argument(
        "--threshold",
        "-c",
        type=int,
        help="(%(type)s) Threshold that defines if the counts for rule will be normalized (default: %(default)s).",
        default=3,
    )
    parser.add_argument(
        "--temp",
        type=float,
        help="(%(type)s) Temperature for the normalization function (default: %(default)s).",
        default=1,
    )
    args = parser.parse_args()

    if not os.path.isfile(args.probabilities_path):
        print(f"Invalid file '{args.probabilities_path}'.", file=sys.stderr)
        exit(1)

    return args


def main() -> None:
    args = parse_args()

    probabilities = read_json(args.probabilities_path)
    updated_rules = update_counts(probabilities, args.threshold, args.temp)
    save_json(probabilities, args.output_file)

    print("Updated production rules:")
    for rule in updated_rules:
        print(rule)


if __name__ == "__main__":
    main()
