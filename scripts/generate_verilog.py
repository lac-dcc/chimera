from random import random, choices
import json
from typing import List
import sys

def read_json(filename):
    with open(filename, "r", encoding='utf-8') as file:
        text = file.read()
    
    return json.loads(text)


def generate_verilog(prob: dict):
    stack = list()
    stack.append("source_text")

    rules_followed = list()
    rules_followed.append("source_text")

    program = ""
    while stack:
        curr = stack.pop()
        if curr.startswith('\'') or curr.startswith('"'):
            program +=  curr[1:-1] + " " 
        
        elif curr == '%empty':
            pass

        else:
            if curr in prob.keys():
                #print("Entrou aqui")
                probs = prob[curr]
                s = sum(probs.values())

                c,p = zip(*[ (k, (v/s)) for k,v in probs.items()])

                next = choices(c, p)[0]

                rules_followed.append(next)
                
                next = next.split(" ")
                stack.extend(next[::-1])
            else:
                program += curr + " "
    print(rules_followed, file=sys.stderr)
    return program


def main():
    prob_dict  = read_json("scripts/number_of_productions.json")
    #print("teste")
    print(generate_verilog(prob_dict))
    #print("teste")

if __name__ == "__main__":
    main()