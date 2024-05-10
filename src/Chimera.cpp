#include "AST.h"
#include "ConstantsReplacerVisitor.h"
#include "Visitor.h"
#include <algorithm>
#include <cxxopts.hpp>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <nlohmann/json.hpp>
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

cxxopts::ParseResult parseArgs(int argc, char **argv) {
  // clang-format off
  cxxopts::Options options("Chimera", "Generates SystemVerilog based on a json file of probabilities.");
  options.positional_help("<file> <n-value>");

  options.add_options()
    ("file", "JSON file with n-gram probabilities", cxxopts::value<std::string>())
    ("n-value", "Number of n-grams to be used", cxxopts::value<int>()->default_value("1"))
    ("d,debug", "Prints productions chains.") // Needs to improve
    ("v,verbose", "Verbose output")//Needs to implement
    ("h,help", "Display usage");
  // clang-format on

  options.parse_positional({"file", "n-value"});
  auto flags = options.parse(argc, argv);

  if (flags.count("help")) {
    std::cerr << options.help() << std::endl;
    exit(0);
  }

  if (!flags.count("file")) {
    std::cerr << "Missing JSON file with probabilities." << std::endl;
    std::cerr << "Use --help for more information." << std::endl;
    exit(1);
  }

  if (!flags.count("n-value")) {
    std::cerr << "Missing value of 'n'." << std::endl;
    std::cerr << "Use --help for more information." << std::endl;
    exit(1);
  }

  return flags;
}

int main(int argc, char **argv) {
  auto flags = parseArgs(argc, argv);

  std::ifstream f(flags["file"].as<std::string>());

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
