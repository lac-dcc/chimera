import argparse
import json
import os
import sys

from collections import deque


def treat_rule(rule: str):
    rule = rule.split(' ')
    is_terminal = False

    if rule[1] == '$$':
        rule = rule[4]
    else:
        is_terminal = rule[2] == 'token'
        rule = rule[3]

    return (rule, is_terminal)


def process_reduction(reductions: list, context_stack: list, reduction_map: dict, n: int):
    current_context = context_stack.pop()

    if len(current_context) == n:
        current_context.popleft()
    current_context.append(treat_rule(reductions[-1])[0])

    rhs = ''
    for reduction in reductions[:-1]:
        rule, is_terminal = treat_rule(reduction)
        rhs += rule + ' '

        if not is_terminal:
            context_stack.append(current_context.copy())

    rhs = rhs.strip()
    if rhs == '':
        rhs = '%empty'

    lhs = '~'.join(current_context)
    if lhs in reduction_map:
        if rhs in reduction_map[lhs]:
            reduction_map[lhs][rhs] += 1
        else:
            reduction_map[lhs][rhs] = 1
    else:
        reduction_map[lhs] = {rhs: 1}


def load_map(filename):
    if os.path.isfile(filename):
        with open(filename, 'r', encoding='utf-8') as f:
            t = f.read()

        return json.loads(t if t != '' else '{}')
    else:
        return dict(dict())


def save_map(reduction_map, output_filename):
    with open(output_filename, 'w', encoding='utf-8') as file:
        json.dump(reduction_map, file)


def process_trace(out_file: str, n: int):
    reductions = []
    current_reduction = []
    append_next_lines = False

    for line in sys.stdin:
        line = line.strip()

        if append_next_lines:
            current_reduction.append(line)

            if line.startswith('-> $$'):
                append_next_lines = False
                reductions.append(current_reduction)
                current_reduction = []

        if line.startswith('Reducing'):
            append_next_lines = True

    reduction_map = load_map(out_file)
    context_stack = [deque()]
    while reductions:
        current_reduction = reductions.pop()
        process_reduction(current_reduction, context_stack, reduction_map, n)

    save_map(reduction_map, out_file)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('output_file', type=str,
                        help='File to save the output in json format.')
    parser.add_argument('-n', type=int, default=2,
                        help='Size of the n-gram sequence.')
    args = parser.parse_args()

    process_trace(args.output_file, args.n)


if __name__ == '__main__':
    main()
