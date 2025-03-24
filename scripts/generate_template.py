class_names = [#Add set of productions here
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


# Example usage
if __name__ == "__main__":
    template_string = """{"{lower}",
   [](std::string &&f){
      return std::make_unique<{capitalized}>(f);
   }},"""
    placeholders = ["{lower}", "{capitalized}"]
    for c in class_names:
        result = insert_strings(template_string, placeholders, [c.lower(), c])
        print(result)