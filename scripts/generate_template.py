"""
This script generate the basic code to add more productions to ChiGen.

The visitor files should be customized accordingly to specific needs of each new production.
""" 
class_names = [#add name of classes here
    ]

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

if __name__ == "__main__":
    generate_enum_entries()
    generate_AST_classes()
    generate_AST_implementations()
    generate_map_entries()