import pandas as pd
import matplotlib.pyplot as plt


def main():
    prefix = "syntax"
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
            df["line_coverage"],
            label=label,
            color=color,
            linestyle=linestyle,
        )

    plt.title(
        "Coverage for Verible's syntactic analyzer per number of programs used",
        fontsize=17,
    )
    plt.xticks(fontsize=13)
    plt.yticks(fontsize=13)
    plt.xlabel("Number of programs", fontsize=15)
    plt.ylabel("Line coverage (%)", fontsize=15)
    plt.grid(zorder=0)
    fig.legend(loc="outside center right", prop={"size": 13})
    plt.savefig("syntax_coverage_line.png", dpi=800)


if __name__ == "__main__":
    main()
