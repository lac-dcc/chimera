"""Run coverage experiments

This script runs coverage experiments by using programs in different datasets
as input for different target tools. The coverage is assumed to be obtained by
compiling the target tools with Clang's source-based coverage
(https://clang.llvm.org/docs/SourceBasedCodeCoverage.html#compiling-with-coverage-enabled).

A separate bash script is used to run the target tools and obtain a CSV output,
which specifies line and branch coverage for programs in each dataset. This
script can be specified as an argument.

Additionally, this script produces charts with results for line and branch
coverage for all tested tools.

The datasets and tools that will be used for the experiment can be specified in
a separate YAML configuration file. This file also allows the user to control
other aspects, such as the colors that will be used in the charts.

Usage: run_coverage_experiments.py [-h] [--coverage_script COVERAGE_SCRIPT]
                                   [--output_path OUTPUT_PATH]
                                   [--debug_path DEBUG_PATH]
                                   [--results_path RESULTS_PATH]
                                   [--config_path CONFIG_PATH]

Arguments:
  --coverage_script COVERAGE_SCRIPT
                        (str) Coverage script to be used (default: ./scripts/run_coverage.sh).
  --output_path OUTPUT_PATH
                        (str) Path where CSV results are saved (default: ./output).
  --debug_path DEBUG_PATH
                        (str) Path where debug information is saved (default: ./debug).
  --results_path RESULTS_PATH
                        (str) Path where charts with results are saved (default: ./results).
  --config_path CONFIG_PATH
                        (str) Path to the YAML config file with information about datasets and EDA tools (default:
                        ./scripts/config/coverage_config.yaml).
  -h, --help            Show help message and exit
"""

import argparse
import datetime
import matplotlib.pyplot as plt
import pandas as pd
import yaml

from dataclasses import dataclass
from os import makedirs, path
from shutil import rmtree
from subprocess import run
from typing import Iterable, Tuple


@dataclass
class Dataset:
    """Represents a dataset to be used in experiments.

    Attributes:
        label (str): Short identifier for the dataset.
        name (str): Human-readable name of the dataset.
        path (str): Path to the dataset's directory.
        line_color (str): Color used to represent the dataset in visualizations.
        line_style (str): Style of the line (e.g., solid, dashed) used in visualizations.
    """

    label: str
    name: str
    path: str
    line_color: str
    line_style: str


@dataclass
class Tool:
    """Represents a Verilog EDA tool that will be tested in these experiments.

    Attributes:
        label (str): A short identifier for the tool.
        name (str): The human-readable name of the tool.
        binary_path (str): The file path to the tool's binary.
    """

    label: str
    name: str
    binary_path: str


def load_config(config_path: str):
    with open(config_path, "r") as yaml_file:
        raw_config = yaml.safe_load(yaml_file)

    datasets = [Dataset(**dataset_dict) for dataset_dict in raw_config["datasets"]]
    tools = [Tool(**tool_dict) for tool_dict in raw_config["tools"]]
    return datasets, tools


def plot_results(
    tool: Tool,
    datasets: Iterable[Tuple[str, Dataset]],
    results_path: str,
    figure_format: str,
):
    coverage_types = ["branch", "line"]
    fig, axs = plt.subplots(nrows=1, ncols=2, figsize=(18, 6), layout="constrained")
    for idx, coverage_type in enumerate(coverage_types):
        axs[idx].set_title(
            f"{coverage_type.capitalize()} coverage",
            fontsize=15,
        )
        axs[idx].tick_params(axis="both", which="major", labelsize=13)
        axs[idx].set_xlabel("Number of programs", fontsize=15)
        axs[idx].set_ylabel(f"{coverage_type.capitalize()} coverage (%)", fontsize=15)
        axs[idx].grid(zorder=0)

    for output_path, dataset in datasets:
        df = pd.read_csv(output_path)
        for idx, coverage_type in enumerate(coverage_types):
            axs[idx].plot(
                df["num_files"],
                df[f"{coverage_type}_coverage"],
                label=dataset.name,
                color=dataset.line_color,
                linestyle=dataset.line_style,
            )

    fig.suptitle(f"Coverage for {tool.name} per number of programs used", fontsize=20)
    handles, labels = axs[1].get_legend_handles_labels()
    fig.legend(handles, labels, loc="outside center right", prop={"size": 13})
    timestamp = datetime.datetime.now().replace(microsecond=0).isoformat()

    fig_path = path.join(
        results_path, f"{tool.label}_coverage_{timestamp}.{figure_format}"
    )
    plt.savefig(fig_path, dpi=800, format=figure_format)
    plt.close(fig)


def run_experiments(
    tools: Iterable[Tool],
    datasets: Iterable[Dataset],
    output_path: str,
    debug_path: str,
    results_path: str,
    coverage_script: str,
    figure_format: str,
):
    for tool in tools:
        tool_results = []
        for dataset in datasets:
            stdout_path = path.join(
                output_path, f"{tool.label}_{dataset.label}_coverage.csv"
            )
            tool_results.append(stdout_path)

            stderr_path = path.join(
                debug_path,
                f"{tool.label}_{dataset.label}_coverage.error",
            )
            with open(stdout_path, "w") as output_file:
                with open(stderr_path, "w") as error_file:
                    run(
                        [
                            coverage_script,
                            tool.binary_path,
                            "-i",
                            "-d",
                            dataset.path,
                        ],
                        stdout=output_file,
                        stderr=error_file,
                    )

        plot_results(tool, zip(tool_results, datasets), results_path, figure_format)


def prepare_directory(dir_path: str):
    if path.exists(dir_path):
        rmtree(dir_path)

    makedirs(dir_path)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--coverage_script",
        type=str,
        default="./scripts/run_coverage.sh",
        help="(%(type)s) Coverage script to be used (default: %(default)s).",
    )
    parser.add_argument(
        "--output_path",
        type=str,
        default="./output",
        help="(%(type)s) Path where CSV results are saved (default: %(default)s).",
    )
    parser.add_argument(
        "--debug_path",
        type=str,
        default="./debug",
        help="(%(type)s) Path where debug information is saved (default: %(default)s).",
    )
    parser.add_argument(
        "--results_path",
        type=str,
        default="./results",
        help="(%(type)s) Path where charts with results are saved (default: %(default)s).",
    )
    parser.add_argument(
        "--config_path",
        type=str,
        default="./scripts/config/coverage_config.yaml",
        help="(%(type)s) Path to the YAML config file with information about datasets and EDA tools (default: %(default)s).",
    )
    parser.add_argument(
        "--figure_format",
        type=str,
        choices=["png", "pdf"],
        default="png",
        help="(%(type)s) Output format for the output figures. (default: %(default)s).",
    )
    args = parser.parse_args()

    datasets, tools = load_config(args.config_path)

    prepare_directory(args.output_path)
    prepare_directory(args.debug_path)
    makedirs(args.results_path, exist_ok=True)

    run_experiments(
        tools,
        datasets,
        args.output_path,
        args.debug_path,
        args.results_path,
        args.coverage_script,
        args.figure_format,
    )


if __name__ == "__main__":
    main()
