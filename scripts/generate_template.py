"""
This script generate the basic code to add more productions to ChiGen.

The visitor files should be customized accordingly to specific needs of each new production.
""" 
class_names = []

def insert_strings(template: str, placeholders: list, values: list) -> str:
    """
    Inserts values into the template string at the positions of placeholders.

    :param template: The template string containing placeholders.
    :param placeholders: A list of placeholder strings to replace.
    :param values: A list of values to insert in place of the placeholders.
    :return: The resulting string with values inserted.
    """
    if len(placeholders) != len(values):
        raise ValueError("The number of placeholders must match the number of values.")

    for placeholder, value in zip(placeholders, values):
        template = template.replace(placeholder, value)

    return template

def generate_enum_entries():
    """Generates the entries to add to the NodeType enum in AST.h"""
    with open("enum_entries.txt", "w") as out:
        for c in class_names:
            out.write(f"{c.upper()},\n")
            

def generate_AST_classes():
    """Generates the basic classes for the new nodes, each node must have its own class to be used in the visitors. The output should be placed inside AST.h"""
    template = """ class {capitalized} : public Node {
    public:
    {capitalized}(std::string element);
    {capitalized}({capitalized} &&) = default;
    {capitalized} &operator=({capitalized} &&) = default;
    }; """

    placeholders = ["{capitalized}"]

    with open("ast_classes.txt", "w") as out:
        for c in class_names:
            result = insert_strings(template, placeholders, [c.capitalize()])
            out.write(f"{result}\n")


def generate_AST_implementations():
    """Generates the implementation for the classes created in generate_AST_classes(). The output should be placed in AST.cpp"""
    template = """{capitalized}::{capitalized}(std::string element) {
  this->type = NodeType::{upper};
  this->setElement(element);
} """

    placeholders = ["{capitalized}", "{upper}"]

    with open("ast_implementations.txt", "w") as out:
        for c in class_names:
            result = insert_strings(template, placeholders, [c.capitalize(), c.upper()])
            out.write(f"{result}\n")

def generate_map_entries():
    """Generates the entries for the classMap inside AST.cpp"""
    template = """
 {"{lower}",
   [](std::string &&f){
      return std::make_unique<{capitalized}>(f);
   }}"""

    placeholders = ["{lower}", "{capitalized}"]

    with open("map_entries.txt", "w") as out:
        for c in class_names:
            result = insert_strings(template, placeholders, [c.lower(), c.capitalize()])
            out.write(f",{result}\n")

def generate_type_inference_std_visitor():
    """Generates the entries for the classMap inside AST.cpp"""
    template = """
 constraintSet TypeInferenceVisitor::visit({capitalized} *node, typeId type) {
  return defaultVisitor(node, type);
}"""

    placeholders = ["{capitalized}"]

    with open("type_inference.txt", "w") as out:
        for c in class_names:
            result = insert_strings(template, placeholders, [c.capitalize()])
            out.write(f"{result}\n")

def generate_type_inference_std_visitor_decl():
    """Generates the entries for the classMap inside AST.cpp"""
    template = """virtual constraintSet visit({capitalized} *node, typeId type) override;"""

    placeholders = ["{capitalized}"]

    with open("type_inference_h.txt", "w") as out:
        for c in class_names:
            result = insert_strings(template, placeholders, [c.capitalize()])
            out.write(f"  {result}\n\n")

def generate_visitor_switch_entries():
    """Generates the entries for the switch with arguments inside Visitor.h"""
    template = """case NodeType::{upper}:
      return visit(dynamic_cast<{capitalized} *>(node));"""

    placeholders = ["{capitalized}", "{upper}"]

    with open("switch_entries_no_arg.txt", "w") as out:
        for c in class_names:
            result = insert_strings(template, placeholders, [c.capitalize(), c.upper()])
            out.write(f"  {result}\n\n")

def generate_visitor_switch_entries_with_arg():
    """Generates the entries for the switch without arguments inside Visitor.h"""
    template = """case NodeType::{upper}:
      return visit(dynamic_cast<{capitalized} *>(node), arg);"""

    placeholders = ["{capitalized}", "{upper}"]

    with open("switch_entries_arg.txt", "w") as out:
        for c in class_names:
            result = insert_strings(template, placeholders, [c.capitalize(), c.upper()])
            out.write(f"  {result}\n\n")

def generate_visitor_default_methods():
    """Generates the entries for the visitor methods inside Visitor.h"""
    template = """virtual R visit({capitalized} *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit({capitalized} *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }"""

    placeholders = ["{capitalized}"]

    with open("visitor_default.txt", "w") as out:
        for c in class_names:
            result = insert_strings(template, placeholders, [c.capitalize()])
            out.write(f"  {result}\n\n")



if __name__ == "__main__":
    generate_enum_entries()
    generate_AST_classes()
    generate_AST_implementations()
    generate_map_entries()
    generate_type_inference_std_visitor()
    generate_type_inference_std_visitor_decl()
    generate_visitor_switch_entries()
    generate_visitor_switch_entries_with_arg()
    generate_visitor_default_methods()