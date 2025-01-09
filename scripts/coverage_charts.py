import argparse
import datetime
import pandas as pd
import matplotlib.pyplot as plt


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "target_tool",
        type=str,
        help="(%(type)s) Label of the tool.",
    )
    parser.add_argument(
        "tool_name",
        type=str,
        help="(%(type)s) Name of the tool to be used in the chart's title.",
    )
    parser.add_argument(
        "coverage_type",
        type=str,
        choices=["branch", "line"],
        help="(%(type)s) Type of coverage to be used.",
    )
    args = parser.parse_args()

    prefix = args.target_tool
    program_sets = [
        ("1gram", "1 gram", "tab:blue", "solid"),
        ("2gram", "2 gram", "tab:orange", "solid"),
        ("3gram", "3 gram", "tab:green", "solid"),
        ("4gram", "4 gram", "tab:red", "solid"),
        ("5gram", "5 gram", "tab:purple", "solid"),
        ("6gram", "6 gram", "tab:brown", "solid"),
        ("chibench", "Chibench", "r", "dashdot"),
        ("vloghammer", "VlogHammer", "b", "dashdot"),
        ("verismith", "Verismith", "g", "dashdot"),
        ("transfuzz", "TransFuzz", "brown", "dashdot"),
    ]

    fig = plt.figure(figsize=(10, 6), layout="constrained")
    for program_set, label, color, linestyle in program_sets:
        df = pd.read_csv(f"{prefix}_{program_set}_coverage.csv")
        plt.plot(
            df["num_files"],
            df[f"{args.coverage_type}_coverage"],
            label=label,
            color=color,
            linestyle=linestyle,
        )

    plt.title(
        f"Coverage for {args.tool_name} per number of programs used",
        fontsize=17,
    )
    plt.xticks(fontsize=13)
    plt.yticks(fontsize=13)
    plt.xlabel("Number of programs", fontsize=15)
    plt.ylabel(f"{args.coverage_type.capitalize()} coverage (%)", fontsize=15)
    plt.grid(zorder=0)
    fig.legend(loc="outside center right", prop={"size": 13})
    timestamp = datetime.datetime.now().replace(microsecond=0).isoformat()
    plt.savefig(f"{prefix}_{args.coverage_type}_coverage_{timestamp}.png", dpi=800)


if __name__ == "__main__":
    main()
