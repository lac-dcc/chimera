import argparse

from subprocess import run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "coverage_script",
        type=str,
        help="(%(type)s) Coverage script to be used.",
    )
    parser.add_argument(
        "target_tool",
        type=str,
        help="(%(type)s) Tool to be used in the coverage experiment.",
    )
    parser.add_argument(
        "experiment_label",
        type=str,
        help="(%(type)s) Label to be used for this experiment.",
    )
    args = parser.parse_args()

    datasets = [
        ("1gram", "../chigen_programs/10k_programs_per_k/1gram"),
        ("2gram", "../chigen_programs/10k_programs_per_k/2gram"),
        ("3gram", "../chigen_programs/10k_programs_per_k/3gram"),
        ("4gram", "../chigen_programs/10k_programs_per_k/4gram"),
        ("5gram", "../chigen_programs/10k_programs_per_k/5gram"),
        ("6gram", "../chigen_programs/10k_programs_per_k/6gram"),
        ("chibench", "../sample_database"),
        ("verismith", "../verismith_10k_programs/"),
        ("vloghammer", "../vloghammer_programs/"),
        ("transfuzz", "../transFuzz"),
    ]

    for name, path in datasets:
        stdout_path = f"./{args.experiment_label}_{name}_coverage.csv"
        stderr_path = f"./{args.experiment_label}_{name}_coverage.error"
        with open(stdout_path, "w") as output_file:
            with open(stderr_path, "w") as error_file:
                run(
                    [
                        args.coverage_script,
                        args.target_tool,
                        "-i",
                        "-d",
                        path,
                    ],
                    stdout=output_file,
                    stderr=error_file,
                )


if __name__ == "__main__":
    main()
