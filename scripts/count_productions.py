import json
import argparse
import sys
import os
import subprocess

def treat_rule(rule: str):

    rule = rule.split(" ")

    if "$$" in rule:
        
        rule = rule[4]
    else:
        rule = rule[3]
    
    return rule
    

def process_reduction(reduction:list, reduction_map:dict):

    l = treat_rule(reduction[-1])
    r = ""

    for i in range(len(reduction) -1):
        r +=  treat_rule(reduction[i]) + " "

    r = r.strip()
    
    if r == "":
        r = "%empty"

    if l in reduction_map.keys():

        if r in reduction_map[l].keys():
            reduction_map[l][r] += 1
        else:
            reduction_map[l][r] = 1

    else:
        reduction_map[l] = {r:1}


def load_map(filename):
    if os.path.isfile(filename):
        with open(filename, 'r', encoding="utf-8") as f:
            t = f.read()
        
        return json.loads(t if t != ""else "{}")
    else:
        return dict(dict())


def save_map(reduction_map, output_filename):
    with open(output_filename, 'w', encoding="utf-8") as file:
        json.dump(reduction_map, file)


def process_trace(out_file):
    reduction = list()
    append_next_lines = False

    reduction_map = load_map(out_file)

    line = sys.stdin.readline()

    while line != '':
        line = line.strip()
        #print("LINE", line)
        if append_next_lines:
            reduction.append(line.strip())

            if line.rstrip().startswith('-> $$'):
                append_next_lines = False
                process_reduction(reduction, reduction_map)
                reduction.clear()

        if line.strip().startswith('Reducing'):
            append_next_lines = True
        line = sys.stdin.readline()

    save_map(reduction_map, out_file)
        




def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--output_file", type=str, help="File to save the output in json format.")
    args = parser.parse_args()

    process_trace(args.output_file)


    

if __name__ == '__main__':
    main()
    