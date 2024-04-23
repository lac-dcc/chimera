from code_generation.code_generator import *
from code_generation.cpp_function import *
from code_generation.cpp_variable import *
from code_generation.cpp_class import *
import json
import argparse
import subprocess
import os

from constants_replacer_visitor import replace_constants
    
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
            op1 = op[1:-1]
            e = ProdElement(op1, isTerminal=True)
            
            
            line.append(e)
        else:
            line.append(ProdElement(op, False))
    return line
    



def create_function_visitor_base_class(e:ProdElement):
    
    
    f = CppClass.CppMethod(name="visit", ret_type="void", is_pure_virtual=True, is_virtual=True)
    f.add_argument(f"{e.element.capitalize()} *node")
   
    
    return f

def create_function_gen_class(e):
    
    f = CppClass.CppMethod(name="visit", ret_type="void", is_virtual=True,
                           implementation_handle=lambda s,cpp: cpp('\nif(node->getChildren().empty()){\nstd::cout << node->getElement();\n}else{\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}}'))
    
    f.add_argument(f"{e.element.capitalize()} *node")
    return f
    

    
def create_visitor_classes(elements, ast_classes):
    v = CppFile("Visitor.cpp")
    vh = CppFile("Visitor.h")

    
    vh.append("#ifndef VISITOR_H\n")
    vh.append("#define VISITOR_H\n")

    vh.append("#include <iostream>\n")
    vh.append("#include <memory>\n")
    vh.append("#include <string>\n")
    vh.append("#include <vector>\n")

    v.append("#include \"Visitor.h\"\n")
    v.append("#include \"AST.h\"\n")
    vh.newline(2)

    vh.append("")

    for c in ast_classes:
        
        vh.append(f"class {c.name};\n")


    c = CppClass(name="Visitor")

    
    code_gen = CppClass(name="CodeGenVisitor")
    code_gen.parent_class = "Visitor"

    f = CppClass.CppMethod(name="visit", ret_type="void", is_virtual=True,
                           implementation_handle=lambda s,cpp: cpp('if(node->getChildren().empty()){\nstd::cout << node->getElement();\n}else{\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}}'))

    f.add_argument("Node* node")
    code_gen.add_method(f)


    
    for e in elements:
        if not e.isTerminal and e.element != "%empty":
            
            c.add_method(create_function_visitor_base_class(e))
            code_gen.add_method(create_function_gen_class(e))
    
    f = CppClass.CppMethod(name="visit", ret_type="void", is_pure_virtual=True, is_virtual=True)
    f.add_argument(f"Terminal *node")

    c.add_method(f)

    f = CppClass.CppMethod(name="visit", ret_type="void", is_virtual=True,
                           implementation_handle=lambda s,cpp: cpp('if(node->getChildren().empty()){\nstd::cout << node->getElement();\n}else{\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}}'))
    
    f.add_argument(f"Terminal *node")

    code_gen.add_method(f)
    
    c.render_to_string_declaration(vh)
    code_gen.render_to_string_declaration(vh)

    c.render_to_string_implementation(v)
    code_gen.render_to_string_implementation(v)
    vh.append("#endif")



def create_std_classes():

    c = CppClass(name="Node")
    c.add_variable(CppVariable(type='std::vector<std::shared_ptr<Node>>', name="children"))
    f = CppClass.CppMethod(name="accept", ret_type="void", is_pure_virtual=True, is_virtual=True)
    f.add_argument("Visitor &visitor")

    c.add_method(f)

    g = CppClass.CppMethod(name="getChildren", ret_type="std::vector<std::shared_ptr<Node>>",
    implementation_handle=lambda s,cpp: cpp('return this->children;'))

    s = CppClass.CppMethod(name="setChildren", ret_type="void",
    implementation_handle=lambda s,cpp: cpp('this->children = children;'))

    s.add_argument("std::vector<std::shared_ptr<Node>> children")

    c.add_variable(CppVariable(name="element", type="std::string"))

    c.add_method(g)
    c.add_method(s)

    get = CppClass.CppMethod(name="getElement", ret_type="std::string",
    implementation_handle=lambda s,cpp: cpp('return this->element;'))

    set = CppClass.CppMethod(name="setElement", ret_type="void",
    implementation_handle=lambda s,cpp: cpp('this->element = element;'))
    set.add_argument("std::string element")

    c.add_method(get)
    c.add_method(set)

    
    d = CppClass(name="Terminal")
    f = CppClass.CppMethod(name="accept", ret_type="void", 
                           implementation_handle=lambda s,cpp: cpp('visitor.visit(this);'), 
                           is_virtual=True)

    const = CppClass.CppMethod(name="Terminal", ret_type="",
    implementation_handle=lambda s,cpp: cpp('this->setElement(element);'))
    const.add_argument("std::string element")
    
    f.add_argument("Visitor &visitor")
    

    
    d.add_method(f)
    d.add_method(const)
    
    
    d.parent_class="Node"

    return [c,d]
    

def add_classes(class_list, cpp:CppFile, h:CppFile):
    
    h.newline(2)
    for c in class_list:
        c.render_to_string_declaration(h)
        c.render_to_string_implementation(cpp)

    
def create_AST_file(prod_dict):
    cpp = CppFile("AST.cpp")
    h = CppFile("AST.h")
    
    cpp.append("#include \"Visitor.h\"\n")

    cpp.append("#include \"AST.h\"\n")

    h.append("#ifndef AST_H\n")
    h.append("#define AST_H\n")

    h.append("#include <iostream>\n")
    h.append("#include <memory>\n")
    h.append("#include <string>\n")
    h.append("#include <vector>\n")
    h.append("#include <map>\n")
    h.append("#include <functional>\n")
    h.newline(2)

    h.append("class Visitor;\n\n")
    

    std = create_std_classes()
    
    classes, elements_in_gram = create_AST_classes(prod_dict)

    for c in std[::-1]:
        classes.insert(0, c)
    
    add_classes(classes, cpp, h)

    create_visitor_classes(set(elements_in_gram), classes)
    replace_constants(classes)


    m = ""
    for c in classes:
        if c.name.lower() !="node":
            m += f'{{"{c.name.lower()}", [](const std::string& f) -> std::shared_ptr<Node> {{return std::make_shared<{c.name.capitalize()}>(f);}}}}, '
    
    h.append("extern std::map<std::string,std::function<std::shared_ptr<Node>(const std::string&)>> classMap;\n");
    cpp.append(f"std::map<std::string,std::function<std::shared_ptr<Node>(const std::string&)>> classMap ={{{m}}};\n")

    h.append("#endif\n")




    #create_AST_classes()


def create_AST_class(prod:ProdElement):
    f = CppClass.CppMethod(name="accept", ret_type="void", 
                           implementation_handle=lambda s,cpp: cpp('visitor.visit(this);'), 
                           is_virtual=True)
    
    f.add_argument("Visitor &visitor")

    const = CppClass.CppMethod(name=f"{prod.element.capitalize()}", ret_type="",
    implementation_handle=lambda s,cpp: cpp('this->setElement(element);'))
    const.add_argument("std::string element")

    

    
    if not prod.isTerminal and prod.element != "%empty":
    
        c = CppClass(name=prod.element.capitalize())
        
            
        c.add_method(f)
        c.add_method(const)
        
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
    elements = set()
    for k,v in prod_dict.items(): #outside dict
        curr = ProdElement(k)
        curr.isToken = True

        if (curr.element,curr.isTerminal, curr.isToken) not in analyzed_items:
            elements.add(curr)
            
            
            classes.append(create_AST_class(curr))
            analyzed_items.append((curr.element,curr.isTerminal, curr.isToken))
        
        for p,_ in v.items(): #inside dict

            r = breaK_rule_in_ops(p)
            
            for x in r:
                if not x.isTerminal and x not in prod_dict.keys():
                        x.isToken = True

                
                
                if (x.element, x.isTerminal, x.isToken) not in analyzed_items:
                    
                    elements.add(x)
                    
                        
                    
                    c = create_AST_class(x)
                    if c is not None:
                        classes.append(c)
                    analyzed_items.append((x.element, x.isTerminal, x.isToken))
    
    return classes, elements

        
def main():
    #######flags
    parser = argparse.ArgumentParser()
    parser.add_argument("--json_file", type=str, 
                      default="number_of_productions.json", 
                      help="Filepath to json file containing the productions count")
    
    parser.add_argument("--format",
                      action="store_true",
                      help="Use to format generated files, uses clang-format.")


    args = parser.parse_args()
    
    #######flags
    
    productions = read_json(args.json_file)
    create_AST_file(productions)

    

    if args.format:
            os.system("clang-format -i -style=file *.cpp *.h")
            

     

    

if __name__ == "__main__":
    main()


