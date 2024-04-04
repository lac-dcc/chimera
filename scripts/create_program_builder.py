from code_generation.code_generator import *
from code_generation.cpp_function import *
from code_generation.cpp_variable import *
from code_generation.cpp_class import *
import json
import argparse
from typing import List
    
class ProdElement:
    def __init__(self, element:str, isTerminal:bool=False, isToken:bool=False) -> None:
        self.element = element
        self.isTerminal = isTerminal
        self.isToken= isToken


def read_json(filename):

    with open(filename, "r", encoding='utf-8') as file:
        text = file.read()
    
    return json.loads(text)


def breaK_rule_in_ops(rule:str):
    ops = rule.split(" ")
    line = []

    for op in ops:
        if op.startswith('\'') or op.startswith('"'):
            
            e = ProdElement(op[1:-1], isTerminal=True)
            
            line.append(e)
        else:
            line.append(ProdElement(op, False))
    return line
    

    
def create_visitor_class():
    print("working")


def create_std_classes():

    c = CppClass(name="Node")
    c.add_variable(CppVariable(type='std::vector<std::shared_ptr<Node>>', name="children"))
    f = CppClass.CppMethod(name="accept", ret_type="void", is_pure_virtual=True, is_virtual=True)
    f.add_argument("Visitor &visitor")

    c.add_method(f)


    d = CppClass(name="Terminal")
    f = CppClass.CppMethod(name="accept", ret_type="void", 
                           implementation_handle=lambda s,cpp: cpp('visitor.visit(this);'), 
                           is_virtual=True)
    
    f.add_argument("Visitor &visitor")
    
    
    c.add_variable(CppVariable(name="element", type="string", initialization_value=""))

    c.add_method(f)
    c.parent_class="Node"

    return [c,d]
    

def add_classes(class_list, cpp:CppFile, h:CppFile):
    
    
    for c in class_list:
        #print("Creating class:",c.name)
        h.append(f"class {c.name};")
        h.newline()

    
    for c in class_list:
        c.render_to_string(cpp)
        cpp.newline(2)

    
def create_AST_file(prod_dict):
    cpp = CppFile("AST.cpp")
    h = CppFile("AST.h")
    cpp.append("#include <iostream>\n")
    cpp.append("#include <memory>\n")
    cpp.append("#include <string>\n")
    cpp.append("#include <vector>\n")
    cpp.append("#include \"Visitor.h\"\n")
    cpp.append("#include \"AST.h\"\n")
    cpp.newline(2)

    std = create_std_classes()
    
    classes = create_AST_classes(prod_dict)

    
    classes.extend(std)

    add_classes(classes, cpp, h)


    #create_AST_classes()


def create_AST_class(prod:ProdElement):
    f = CppClass.CppMethod(name="accept", ret_type="void", 
                           implementation_handle=lambda s,cpp: cpp('visitor.visit(this);'), 
                           is_virtual=True)
    
    f.add_argument("Visitor &visitor")

    
    if not prod.isTerminal and prod.element != "%empty":
    
        c = CppClass(name=prod.element)


        if prod.isToken:
            c.add_variable(CppVariable(name="element", type="string", initialization_value=prod.element))

        c.add_method(f)
        c.parent_class="Node"
        return c
    
    

def create_AST_classes(prod_dict:dict):
    
    '''
        goes through all the productions on the json
            for each prod
                identify its type
                create a class with its name
                add relevant attr
    '''
    analyzed_items = []
    classes = []
    for k,v in prod_dict.items(): #outside dict
        if k not in analyzed_items:
            curr = ProdElement(k)
            classes.append(create_AST_class(curr))
            analyzed_items.append(k)
        
        for p,b in v.items(): #inside dict

            r = breaK_rule_in_ops(p)
            for x in r:
                if x not in analyzed_items:
                    if not x.isTerminal and x not in prod_dict.keys():
                        x.isToken = True
                    c = create_AST_class(x)
                    if c is not None:
                        classes.append(c)
    
    return classes

        



def create_start():
    #Where the verilog build starts, first 
    print("working")
def main():
    #######flags
    parser = argparse.ArgumentParser()
    parser.add_argument("--json_file", type=str, 
                      default="number_of_productions.json", 
                      help="Filepath to json file containing the productions count")

    args = parser.parse_args()
    
    #######flags
    productions = read_json(args.json_file)
    create_AST_file(productions)
    

if __name__ == "__main__":
    main()
    
    #create_AST_node_class()

