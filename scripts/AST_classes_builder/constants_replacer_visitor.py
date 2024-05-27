from typing import List
from code_generation.code_generator import *
from code_generation.cpp_function import *
from code_generation.cpp_variable import *
from code_generation.cpp_class import *






def replace_constants(classes):
    h = CppFile("ConstantsReplacerVisitor.h")
    cpp = CppFile("ConstantsReplacerVisitor.cpp")

    h.append("#ifndef CONSTANTS_REPLACER\n")
    h.append("#define CONSTANTS_REPLACER\n")
    h.append("#include \"Visitor.h\"\n")
    h.append("#include \"AST.h\"\n")
    h.append("#include <iostream>\n#include <memory>\n#include <string>\n#include <vector>\n")

    for c in classes:
        h.append("class "+c.name+" ;\n")
    
    h.append("class Visitor;\n")


    replacer = CppClass(name="ReplaceConstantsVisitor")
    replacer.parent_class = "Visitor"
    
    cpp.append("#include \"ConstantsReplacerVisitor.h\"")
    

    visitor_funcs = __build_funcs(classes)
    for v in visitor_funcs:
        replacer.add_method(v)
    
    replacer.render_to_string_declaration(h)
    replacer.render_to_string_implementation(cpp)

    h.append("#endif\n")




# TK_DecNumber
# TK_RealTime
# TK_TimeLiteral
# TK_UnBasedNumber
# TK_HexBase
# TK_HexDigits
# TK_DecDigits
# TK_XZDigits
# TK_BinBase
# TK_BinDigits
# TK_OctBase
# TK_OctDigits


def __build_funcs(ast_classes):

    funcs = []

    for e in ast_classes:

       funcs.append(__create_func_visitor(e))
       
       
    return funcs


terms_to_replace = [ "Tk_decnumber", "Tk_realtime", "Tk_timeliteral","Tk_unbasednumber","Tk_hexbase","Tk_hexdigits",
                        "Tk_decdigits","Tk_xzdigits","Tk_binbase","Tk_bindigits","Tk_octbase","Tk_octdigits", "TK_StringLiteral",
                        "TK_EvalStringLiteral"]


def __create_func_visitor(e:CppClass):

    f = CppClass.CppMethod(name="visit", ret_type="void", is_virtual=True)
    

    if e.name == "Tk_hexbase":
        f.implementation_handle = lambda s,cpp: cpp('\nnode->setElement("\'h");\n\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}')
    elif e.name == "Tk_octbase":
        f.implementation_handle = lambda s,cpp: cpp('\nnode->setElement("\'o");\n\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}')
    elif e.name == "Tk_binbase":
        f.implementation_handle = lambda s,cpp: cpp('\nnode->setElement("\'b");\n\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}')
    elif e.name == "Tk_decbase":
        f.implementation_handle = lambda s,cpp: cpp('\nnode->setElement("\'d");\n\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}')
    elif e.name == "Tk_timeliteral":
        f.implementation_handle = lambda s,cpp: cpp('\nnode->setElement("\'0ps");\n\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}')
    elif e.name == "TK_StringLiteral" or e.name == "TK_EvalStringLiteral":
        f.implementation_handle = lambda s,cpp: cpp('\nnode->setElement("\"\"");\n\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}')
    elif e.name in terms_to_replace:
        f.implementation_handle = lambda s,cpp: cpp('\nnode->setElement("0");\n\nfor(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}')
    else:
        f.implementation_handle = lambda s,cpp: cpp('for(std::shared_ptr<Node>& child: node->getChildren()){\nchild->accept(*this);\n}')
    
    f.add_argument(f"{e.name}* node")
    
    return f
