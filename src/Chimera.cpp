#include "AST.h"
#include "ConstantsReplacerVisitor.h"
#include "Visitor.h"
#include <algorithm>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <nlohmann/json.hpp>
#include <cxxopts.hpp>
#include <random>
#include <stack>
#include <vector>

using json = nlohmann::json;

std::vector<std::string> breakRuleInProds(const std::string &rule) {
  std::istringstream iss(rule);
  std::string token;

  std::vector<std::string> result;

  while (std::getline(iss, token, ' ')) {
    result.push_back(token);
  }

  return result;
}

void codeGen(std::shared_ptr<Node> head) {
  CodeGenVisitor visitor;
  head.get()->accept(visitor);
}

void replaceConstants(std::shared_ptr<Node> head) {
  ReplaceConstantsVisitor visitor;
  head.get()->accept(visitor);
}

void pp(std::shared_ptr<Node> head) {

  std::cerr << head.get()->getElement() << " ->";

  for (auto &c : head.get()->getChildren()) {
    pp(c);
  }
  std::cerr << std::endl;
}

int main(int argc, char **argv) {
  cxxopts::Options options("Chimera", "Generates SystemVerilog based on a json file of probabilities.");

  options.add_options()
  ("d,debug", "Prints productions chains.",cxxopts::value<bool>()->default_value("false")) // Needs to improve
  ("file", "The script file to execute", cxxopts::value<std::string>())
  ("v,verbose", "Verbose output", cxxopts::value<bool>()->default_value("false"));//Needs to implement

  options.parse_positional({"file"});

  auto flags = options.parse(argc, argv);

  if( flags.count("file") == 0){
    std::cerr << "json file with probabilities not provided" << std::endl;
    exit(1);
  }
  
  std::ifstream f(argv[1]);

  std::string json_str((std::istreambuf_iterator<char>(f)),
                       std::istreambuf_iterator<char>());

  json data = json::parse(json_str);
  f.close();

  std::map<std::string, std::map<std::string, int>> map =
      data.get<std::map<std::string, std::map<std::string, int>>>();

  std::stack<std::shared_ptr<Node>> stack;

  auto head = classMap["source_text"]("source_text");

  stack.push(head);

  std::random_device rd;
  std::mt19937 gen(rd());

  while (!stack.empty()) {
    auto curr = stack.top();
    stack.pop();

    std::vector<std::string> productionsStr;
    std::vector<double> productionsCount;

    auto element = (*curr).getElement();

    int sum = 0;

    for (auto &e : map[element]) {
      productionsStr.push_back(e.first);
      productionsCount.push_back(e.second);
      sum += e.second;
    }

    for (auto &c : productionsCount) {
      c /= sum;
    }
    std::discrete_distribution<> d(productionsCount.begin(),
                                   productionsCount.end());

    auto chosenProd = productionsStr[d(gen)];

    auto prods = breakRuleInProds(chosenProd);

    std::vector<std::shared_ptr<Node>> children;

    for (std::string p : prods) {
      std::shared_ptr<Node> c;

      if (p[0] == '\'' || p[0] == '\"') {
        p.erase(0, 1);
        p.erase(p.size() - 1);

        c = std::make_shared<Terminal>(" " + p + " ");

      } else if (p == "%empty") {
        c = std::make_shared<Terminal>("");
      } else {

        if (map.count(p) == 0) {

          auto aux = p;
          std::transform(aux.begin(), aux.end(), aux.begin(), tolower);

          c = classMap[aux](" " + p + " ");
        } else {
          auto aux = p;
          std::transform(aux.begin(), aux.end(), aux.begin(), tolower);

          c = classMap[aux](p);

          stack.push(c);
        }
      }

      children.push_back(c);
    }

    (*curr).setChildren(children);
  }
  replaceConstants(head);

  if (flags.count("debug"))
    pp(head);


  codeGen(head);
  return 0;
}
