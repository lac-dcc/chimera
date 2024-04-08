import argparse
import csv
import glob
import os

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
                        default='./verible_time.csv')
    parser.add_argument('--num_runs', type=int,
                        help='(%(type)s) number of times each program will be run in order to measure execution time (default: "%(default)s")',
                        default=3)
    args = parser.parse_args()

    header = ['file', 'avg_time']
    results = []
    for file in glob.iglob(os.path.join(args.database_dir, '*.v')):
        print(f'Running for {file}')

        sum_times = 0
        for _ in range(args.num_runs):
            proc = run([args.verible_parser_executable,
                        '--measure_time', file], capture_output=True)
            sum_times += int(proc.stdout.split(b' ')[0])

        results.append({'file': file, 'avg_time': sum_times/args.num_runs})

    with open(args.output, 'w') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=header)
        writer.writeheader()
        writer.writerows(results)


if __name__ == '__main__':
    main()
