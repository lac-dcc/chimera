import argparse
import glob
import os
import csv

from subprocess import run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('verible_parser_executable', type=str,
                        help='local path to Verible\'s parser executable (verible-verilog-syntax)')
    parser.add_argument('--database_dir', type=str,
                        help='(%(type)s) directory with Verilog programs (default: "%(default)s")',
                        default='../database')
    parser.add_argument('--output', type=str,
                        help='(%(type)s) path for the CSV output file (default: "%(default)s")',
                        default='./results.csv')
    args = parser.parse_args()

    header = ['file', 'num_tokens']

    results = []
    for file in glob.iglob(os.path.join(args.database_dir, '*.v')):
        print(f'Running for {file}')
        proc = run([args.verible_parser_executable,
                   '--printtokens', file], capture_output=True)
        results.append(
            {'file': file, 'num_tokens': len(proc.stdout.splitlines()[2:])})

    with open(args.output, 'w') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=header)
        writer.writeheader()
        writer.writerows(results)


if __name__ == '__main__':
    main()
