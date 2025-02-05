#include "AST.h"
#include <string>
#include <utility>
#include <vector>

struct Function {

  std::string name;
  std::string funcType;
  std::vector<std::pair<std::string, PortDir>> portList;
};