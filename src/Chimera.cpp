#include "AST.h"
#include "ConstantsReplacerVisitor.h"
#include "IdentifierRenamingVisitor.h"
#include "Visitor.h"
#include <algorithm>
#include <cxxopts.hpp>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <nlohmann/json.hpp>
#include <random>
#include <stack>
#include <unordered_map>
#include <vector>

using json = nlohmann::json;
bool debug = false;

static constexpr char separator = '~';

static std::vector<std::string> breakRuleInProds(const std::string &rule) {
  std::istringstream iss(rule);
  std::vector<std::string> result;

  std::string token;
  while (std::getline(iss, token, ' ')) {
    result.push_back(token);
  }

  return result;
}

static std::vector<std::string> chooseProds(
    const std::unordered_map<std::string, std::unordered_map<std::string, int>>
        &map,
    const std::string &context, std::mt19937 &gen) {
  std::vector<std::string> productionsStr;
  std::vector<double> productionsCount;

  int sum = 0;
  for (const auto &[prod, prodCount] : map.at(context)) {
    productionsStr.push_back(prod);
    productionsCount.push_back(prodCount);
    sum += prodCount;
  }

  for (double &count : productionsCount) {
    count /= sum;
  }

  std::discrete_distribution<> d(productionsCount.begin(),
                                 productionsCount.end());
  return breakRuleInProds(productionsStr[d(gen)]);
}

static std::string getNodeContext(Node *node, const int n) {
  std::string context = "";

  int depth = 0;
  while (depth < n && node != nullptr) {
    context.insert(0, node->getElement() + separator);
    ++depth;
    node = node->getParent();
  }

  if (context.size() > 0) {
    // Remove last separator
    context.pop_back();
  }

  return context;
}

static std::unique_ptr<Node> buildSyntaxTree(
    const std::unordered_map<std::string, std::unordered_map<std::string, int>>
        &map,
    const int n) {
  auto head = classMap["source_text"]("source_text");
  head->setParent(nullptr);

  std::stack<Node *> stack;
  stack.push(head.get());

  std::random_device rd;
  std::mt19937 gen(rd());

  while (!stack.empty()) {
    auto curr = stack.top();
    stack.pop();

    std::string context = getNodeContext(curr, n);
    auto prods = chooseProds(map, context, gen);

    std::vector<std::unique_ptr<Node>> children;
    context = getNodeContext(curr, n - 1);
    if (!context.empty())
      context += separator;
    for (std::string prod : prods) {
      std::unique_ptr<Node> child;

      if (prod[0] == '\'' || prod[0] == '\"') {
        prod.erase(0, 1);
        prod.erase(prod.size() - 1);

        child = std::make_unique<Terminal>(" " + prod + " ");
      } else if (prod == "%empty") {
        child = std::make_unique<Terminal>("");
      } else {
        auto aux = prod;
        std::transform(aux.begin(), aux.end(), aux.begin(), tolower);

        if (map.find(context + prod) == map.end()) {
          child = classMap[aux](" " + prod + " ");
        } else {
          child = classMap[aux](prod);
          stack.push(child.get());
        }
      }

      child->setParent(curr);
      children.push_back(std::move(child));
    }

    curr->setChildren(std::move(children));
  }

  return head;
}

static void codeGen(Node *head) {
  CodeGenVisitor visitor;
  head->accept(visitor);
}

static void replaceConstants(Node *head) {
  ReplaceConstantsVisitor visitor;
  head->accept(visitor);
}

static void renameVars(Node *head) {
  IdentifierRenamingVisitor visitor;
  head->accept(visitor);
}

static void dumpSyntaxTree(Node *head) {
  std::cerr << head->getElement() << " ->";
  for (auto &child : head->getChildren()) {
    dumpSyntaxTree(child.get());
  }
  std::cerr << "\n";
}

static cxxopts::ParseResult parseArgs(int argc, char **argv) {
  // clang-format off
  cxxopts::Options options("Chimera", "Generates SystemVerilog based on a json file of probabilities.");
  options.positional_help("<file> <n-value>");

  options.add_options()
    ("file", "JSON file with n-gram probabilities", cxxopts::value<std::string>())
    ("n-value", "Number of n-grams to be used", cxxopts::value<int>()->default_value("1"))
    ("p,printtree", "Prints productions chains.")
    ("d,debug", "Prints debug messages.") // Needs to improve
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

  if (flags["n-value"].as<int>() < 0) {
    std::cerr << "'n' must be greater than 0." << std::endl;
    exit(1);
  }

  return flags;
}

int main(int argc, char **argv) {
  auto flags = parseArgs(argc, argv);

  if (flags.count("debug"))
    debug = true;

  std::ifstream f(flags["file"].as<std::string>());

  std::string json_str((std::istreambuf_iterator<char>(f)),
                       std::istreambuf_iterator<char>());
  json data = json::parse(json_str);
  f.close();
  auto map = data.get<
      std::unordered_map<std::string, std::unordered_map<std::string, int>>>();

  auto head = buildSyntaxTree(map, flags["n-value"].as<int>());

  replaceConstants(head.get());

  renameVars(head.get());

  if (flags.count("printtree"))
    dumpSyntaxTree(head.get());
  codeGen(head.get());

  return 0;
}
