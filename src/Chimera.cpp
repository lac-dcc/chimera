#include "AST.h"
#include "CodeGenVisitor.h"
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
    const int n, std::random_device::result_type seed) {
  auto head = classMap["source_text"]("source_text");
  head->setParent(nullptr);

  std::stack<Node *> stack;
  stack.push(head.get());

  if (seed == 0) {
    std::random_device rd;
    seed = rd();

    if (debug) {
      std::cerr << "Seed: " << seed << std::endl;
    }
  }
  std::mt19937 gen(seed);

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

static void renameVars(Node *head, int n) {
  IdentifierRenamingVisitor visitor;
  visitor.initialize(n);
  head->accept(visitor);
}

static bool isAnsi(Node * head){
  bool ansi = false;
  if(head->getElement() == "list_of_ports_or_port_declarations_ansi")
    ansi = true;

  for(int i = 0; i < (int) head->getChildren().size() && !ansi; i++){
    ansi |= isAnsi(head->getChildren()[i].get());
  }
  return ansi;
}

static int countNumberPorts(Node * head){
  int count = 0;

  if(head->getElement() == "port_declaration_non_ansi")
    count += 1;

  for(auto const& c: head->getChildren()){
    count += countNumberPorts(c.get());
  }
  return count;
}

static int renameNonAnsiPorts(Node * head, int counter, int n){
  if(head->getElement() == " SymbolIdentifier " && counter == 0){
    counter++;

  }else if(head->getElement() == " SymbolIdentifier "){
    auto s = " id_" + std::to_string(counter) + " ";
    if(debug)
      std::cerr << "Renaming ID to " << s << std::endl;
    head->setElement(s);
    counter++;
  }

  if(counter <= n){
    for(const auto & c: head->getChildren()){
      counter = renameNonAnsiPorts(c.get(), counter, n);
    }
  }
  return counter;
}

static bool matchNonAnsiPorts(Node * head, int n){
  bool done = false;
  
  if(head->getElement() == "module_item_list_opt"){
    if(debug)
      std::cerr << "Matching non ansi ports" << std::endl;
    
    for(int i = 1; i <= n; i++){
      int choice = rand() % 2;

      std::string prod;

      prod = (choice) ? "input id_" + std::to_string(i) + "; " : "output id_" + std::to_string(i) + "; ";
      if(debug)
        std::cerr << "Creating child: " << prod;
      auto child = std::make_unique<Terminal>(prod);
      head->insertChildToBegin(std::move(child));
    }
    done = true;
  }

  for(int i = 0; i<(int) head->getChildren().size() && ! done; i++){
      done |= matchNonAnsiPorts(head->getChildren()[i].get(), n);
    }

  return done;
}

static int declareNonAnsiPorts(Node * head){
  auto count = 0;
  if(!isAnsi(head)){
    if(debug)
      std::cerr << "Code is not ansi" << std::endl;
    count = countNumberPorts(head);
    renameNonAnsiPorts(head, 0, count);
    matchNonAnsiPorts(head,count);
  }
  return count;
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
    ("d,debug", "Prints debug messages.")
    ("v,verbose", "Verbose output") //Needs to implement
    ("s,seed", "Set the seed for randomization", cxxopts::value<std::random_device::result_type>())
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

  auto seed = flags.count("seed")
                  ? flags["seed"].as<std::random_device::result_type>()
                  : 0;
  auto head = buildSyntaxTree(map, flags["n-value"].as<int>(), seed);

  replaceConstants(head.get());
  int n = declareNonAnsiPorts(head.get());
  renameVars(head.get(), n);

  if (flags.count("printtree"))
    dumpSyntaxTree(head.get());
  codeGen(head.get());

  return 0;
}
