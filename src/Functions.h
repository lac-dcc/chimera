#include <string>
#include <vector>
#include <utility>
#include "AST.h"

struct Function{

    std::string name;
    std::string funcType;
    std::vector<std::pair<std::string, PortDir>> portList;
};