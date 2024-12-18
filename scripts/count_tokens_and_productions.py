from itertools import count
import json
import os

# json_files = [
#     "1gram.json", "2gram.json", "3gram.json", "4gram.json", "5gram.json", "6gram.json",
#     "1gram_size_test.json", "2gram_size_test.json", "3gram_size_test.json", "4gram_size_test.json", "5gram_size_test.json", "6gram_size_test.json",
#     "1gram_test.json", "2gram_test.json", "3gram_test.json", "4gram_test.json", "5gram_test.json", "6gram_test.json",
#     "1gram_test_only_logic.json", "2gram_test_only_logic.json", "3gram_test_only_logic.json", "4gram_test_only_logic.json", "5gram_test_only_logic.json", "6gram_test_only_logic.json"
# ]

# json_files = [
#     "json100.txt", "json2.txt"
# ]

json_files = [
    "json_verismith.txt"
    # "json_chigen_1gram_1024.txt", "json_chigen_2gram_1024.txt", "json_chigen_3gram_1024.txt", 
    # "json_chigen_4gram_1024.txt", "json_chigen_5gram_1024.txt", "json_chigen_6gram_1024.txt",
    # "json_chigen_1gram_16000.txt", "json_chigen_2gram_16000.txt", "json_chigen_3gram_16000.txt", 
    # "json_chigen_4gram_16000.txt", "json_chigen_5gram_16000.txt", "json_chigen_6gram_16000.txt",
    # "json_chigen_1gram_2048.txt", "json_chigen_2gram_2048.txt", "json_chigen_3gram_2048.txt", 
    # "json_chigen_4gram_2048.txt", "json_chigen_5gram_2048.txt", "json_chigen_6gram_2048.txt",
    # "json_chigen_1gram_4096.txt", "json_chigen_2gram_4096.txt", "json_chigen_3gram_4096.txt", 
    # "json_chigen_4gram_4096.txt", "json_chigen_5gram_4096.txt", "json_chigen_6gram_4096.txt",
    # "json_chigen_1gram_8192.txt", "json_chigen_2gram_8192.txt", "json_chigen_3gram_8192.txt", 
    # "json_chigen_4gram_8192.txt", "json_chigen_5gram_8192.txt", "json_chigen_6gram_8192.txt", "json_chibench.txt"
    # "json_verismith.txt", "vloghammer.txt", "../json/1gram_size_test.json", "../json/1gram.json", "../json/1gram_test.json"
]

# directory_path = "~/chimera/*.v"

# grammar_file = "json_verismith.txt"

tokens_chibench = set()
tokens_chigen = set()
diff_tokens = set()
tokens_chigen1 = set()
tokens_chigen2 = set()
tokens_chigen3 = set()
tokens_chigen4 = set()
tokens_chigen5 = set()
tokens_chigen6 = set()
def load_grammar(filename): 
    grammar = {}
    # filename = 'json/' + filename
    if os.path.isfile(filename): 
        with open(filename, 'r') as file: 
            grammar = json.load(file)
    else: 
        print("file not found")
    # print(grammar)
    return grammar

def get_productions(grammar): 
    productions = set()
    
    for production in grammar: 
        productions.add(production)
    
    return productions

def get_tokens(grammar, productions): 
    tokens = set()

    for prod in grammar: 
        for result in grammar[prod]: 
            result_list = result.split(" ")
            for token in result_list: 
                if token not in productions: 
                    tokens.add(token)
    return tokens


if __name__ == '__main__': 
    json_files.sort()
    for grammar_file in json_files: 
    
        grammar = load_grammar(grammar_file)
        productions = get_productions(grammar)
        tokens = get_tokens(grammar, productions)
        print("Summary of " + grammar_file)
        print("Total productions: " + str(len(productions)))
        print("Total tokens: " + str(len(tokens)))
        print()
        
    #     if grammar_file == 'json_chibench.txt': 
    #         tokens_chibench = tokens 
    #     else: 
    #         for t in tokens: 
    #             tokens_chigen.add(t)
              
            
    # for t in tokens_chibench: 
    #     if t not in tokens_chigen: 
    #         print(t)