import argparse
import glob
import os
import sys
import pandas as pd

from subprocess import run

def get_num_tokens(database, verible_exe, csv_file):
    with open(csv_file, 'a') as csv:
        for i, file in enumerate(glob.iglob(os.path.join(database, '*.v'))):
            print(f'{i}: Running for {file}', file=sys.stderr)
            proc = run([verible_exe, '--printtokens', file], capture_output=True)

            # Subtract one token to ignore the EOF token
            print(f'{file},{len(proc.stdout.splitlines()[2:]) - 1}', file=csv)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('results_csv', type=str,
                        help='local path to CSV with results.')
    parser.add_argument('verible_parser_executable', type=str,
                        help='local path to Verible\'s parser executable (verible-verilog-syntax)')
    parser.add_argument('--database_dir', type=str,
                        help='(%(type)s) directory with Verilog programs (default: "%(default)s")',
                        default='../generated_programs')
    args = parser.parse_args()

    with open(args.results_csv, 'w') as file:
        print('n_gram,valid_ratio,valid_sum,valid_avg,valid_median,valid_max,valid_min,invalid_avg,invalid_median,invalid_max,invalid_min, invalid_elaborate_ratio, invalid_elaborate_sum,invalid_elaborate_avg, invalid_elaborate_median, invalid_elaborate_max, invalid_elaborate_min ', file=file)

    for n in range(1, 7):
        print(f'---------------{n}GRAM---------------', file=sys.stderr)
        csv_file = f'./{n}gram_tokens.csv'
        with open(csv_file, 'w') as csv:
            print('file,num_tokens', file=csv)

        base_dir = os.path.join(args.database_dir, f'{n}gram')
        get_num_tokens(base_dir, args.verible_parser_executable, csv_file)

        invalid_dir = os.path.join(base_dir, f'invalid_programs')
        get_num_tokens(invalid_dir, args.verible_parser_executable, csv_file)
        
        invalid_elaborate_dir = os.path.join(base_dir, f'invalid_elaborate_programs')
        get_num_tokens(invalid_elaborate_dir, args.verible_parser_executable, csv_file)

        df = pd.read_csv(csv_file)
        df['invalid'] = df.apply(lambda row: row['file'].find('invalid') != -1, axis=1)
        df['invalid_analyze'] = df.apply(lambda row: row['file'].find('invalid_programs') != -1, axis=1)
        df['invalid_elaborate'] = df.apply(lambda row: row['file'].find('invalid_elaborate') != -1, axis=1)

        valid = df[df['invalid'] == False]['num_tokens']
        invalid_analyze = df[df['invalid_analyze'] == True]['num_tokens']
        invalid_elaborate = df[df['invalid_elaborate'] == True]['num_tokens']
        
        invalid_elaborate_percentage = len(invalid_elaborate) / (len(valid) + len(invalid_elaborate))

        with open(args.results_csv, 'a') as file:
            print(f'{n},{100*(len(valid)/len(df)):.4f},{valid.sum():.2f},{valid.mean():.2f},{valid.median()},{valid.max()},{valid.min()},{invalid_analyze.mean():.2f},{invalid_analyze.median()},{invalid_analyze.max()},{invalid_analyze.min()},{invalid_elaborate_percentage:.2f}, {invalid_elaborate.sum():.2f}, {invalid_elaborate.mean():.2f}, {invalid_elaborate.median():.2f}, {invalid_elaborate.max()}, {invalid_elaborate.min()}', file=file)


if __name__ == '__main__':
    main()
