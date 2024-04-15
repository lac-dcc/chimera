#include "AST.h"
#include "Visitor.h"
#include "lib/json.hpp"
#include <algorithm>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <random>
#include <stack>
#include <vector>

using json = nlohmann::json;

/**
 * ler json
 * percorrer começando em source_text
 * definir pesos para cada possivel produção
 *
 */

std::vector<std::string> break_rule_in_prods(const std::string &rule) {

  std::istringstream iss(rule);
  std::string token;

  std::vector<std::string> result;

  while (std::getline(iss, token, ' ')) {
    result.push_back(token);
  }

  return result;
}

void code_gen(std::shared_ptr<Node> head) {
  CodeGenVisitor visitor;
  visitor.visit(head.get());
}

void pp(std::shared_ptr<Node> head) {
  std::cout << head.get()->getElement() << " ->";

  for (auto &c : head.get()->getChildren()) {
    pp(c);
  }
  std::cout << std::endl;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    std::cout << "Usage:\n" << argv[0] << " [path to json file]" << std::endl;
  }

  std::ifstream f(argv[1]);

  std::string json_str((std::istreambuf_iterator<char>(f)),
                       std::istreambuf_iterator<char>());

  json data = json::parse(json_str);
  f.close();

  std::map<std::string, std::map<std::string, int>> map =
      data.get<std::map<std::string, std::map<std::string, int>>>();

  std::stack<std::shared_ptr<Node>> stack;

  auto head = class_map["source_text"]("source_text");

  stack.push(head);

  std::random_device rd;
  std::mt19937 gen(rd());

  while (!stack.empty()) {
    auto curr = stack.top();
    stack.pop();

    std::vector<std::string> productions_str;
    std::vector<double> productions_count;

    auto element = (*curr).getElement();

    int sum = 0;

    for (auto &e : map[element]) {
      productions_str.push_back(e.first);
      productions_count.push_back(e.second);
      sum += e.second;
    }

    for (auto &c : productions_count) {
      c /= sum;
    }
    std::discrete_distribution<> d(productions_count.begin(),
                                   productions_count.end());

    auto choosen_prod = productions_str[d(gen)];

    auto prods = break_rule_in_prods(choosen_prod);

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

          c = class_map[aux](" " + p + " ");
        } else {
          auto aux = p;
          std::transform(aux.begin(), aux.end(), aux.begin(), tolower);

          c = class_map[aux](p);

          stack.push(c);
        }
      }

      children.push_back(c);
    }

    (*curr).setChildren(children);
  }

  // pp(head);
  code_gen(head);
}
