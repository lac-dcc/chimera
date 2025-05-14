#include "AST.h"
#include <string>
#include <utility>
#include <vector>

struct Function {

  std::string name;
  std::string funcType;
  std::string prefix;
  std::vector<std::pair<std::string, PortDir>> portList;
};