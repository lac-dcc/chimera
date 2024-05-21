import argparse
import glob
import os
import sys

from subprocess import run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('verible_parser_executable', type=str,
                        help='local path to Verible\'s parser executable (verible-verilog-syntax)')
    parser.add_argument('--database_dir', type=str,
                        help='(%(type)s) directory with Verilog programs (default: "%(default)s")',
                        default='../database')
    args = parser.parse_args()

    print('file,num_tokens', flush=False)
    for i, file in enumerate(glob.iglob(os.path.join(args.database_dir, '*.v'))):
        print(f'{i}: Running for {file}', file=sys.stderr)
        proc = run([args.verible_parser_executable,
                   '--printtokens', file], capture_output=True)
        print(f'{file},{len(proc.stdout.splitlines()[2:])}', flush=False)


if __name__ == '__main__':
    main()
