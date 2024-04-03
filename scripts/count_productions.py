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


def process_trace(p:subprocess.Popen, reduction_map):
    reduction = list()
    append_next_lines = False
    

    for line in p.stderr:
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

    return reduction_map
        

def save_map(reduction_map, output_filename):
    with open(output_filename, 'w', encoding="utf-8") as file:
        json.dump(reduction_map, file)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--output_file", type=str, help="File to save the output in json format.")
    parser.add_argument("--parser_executable", type=str, help="Filepath to the parser_executable.")
    parser.add_argument("--dir", type=str, help="Directory with files to be analyzed.")
    args = parser.parse_args()

    files = os.listdir(args.dir)
    total = len(files)
    count = 1
    for file in files:

        print(f"Analyzing file {count}/{total}: {file}", flush=True)
        count+=1

        filename = os.path.join(args.dir, file)

        if os.path.isfile(os.path.join(args.dir, filename)):

            command = f"{args.parser_executable} --verilog_trace_parser {filename}"
            
            p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

            map = process_trace(p, load_map(args.output_file))
            p.wait()

            if p.returncode != 1:
                save_map(map, args.output_file)
            else:
                print("error in file:", file)


    

if __name__ == '__main__':
    main()
    