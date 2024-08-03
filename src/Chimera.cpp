#include "AST.h"
#include "CodeGenVisitor.h"
#include "ConstantsReplacerVisitor.h"
#include "IdentifierRenamingVisitor.h"
#include "Visitor.h"
#include <algorithm>
#include <cxxopts.hpp>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <nlohmann/json.hpp>
#include <random>
#include <set>
#include <stack>
#include <unordered_map>
#include <vector>

using json = nlohmann::json;
bool debug = false;
bool printSeed = false;

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

static std::unique_ptr<Node> getNodeOrFail(const std::string &productionName,
                                           std::string &&element) {
  auto it = classMap.find(productionName);
  if (it == classMap.end()) {
    std::cerr << "Unkown production '" << productionName << "'\n";
    std::cerr << "Aborting\n";
    exit(1);
  }

  return it->second(std::move(element));
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

    if (printSeed) {
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
          child = getNodeOrFail(aux, " " + prod + " ");
        } else {
          child = getNodeOrFail(aux, std::move(prod));
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

static void findNodes(Node *head, std::vector<Node *> &modules,
                      std::vector<Node *> &portDeclarations) {
  if (head->getElement() == "module_or_interface_declaration") {
    modules.push_back(head);
  } else if (head->getElement() == "module_port_declaration") {
    portDeclarations.push_back(head);
  }

  for (const auto &c : head->getChildren()) {
    findNodes(c.get(), modules, portDeclarations);
  }
}

static void removePortDeclarations(std::vector<Node *> &portDeclarations) {
  for (auto *decl : portDeclarations) {
    decl->getParent()->clearChildren();
  }
}

static void codeGen(Node *head) {
  CodeGenVisitor visitor;
  visitor.applyVisit(head);
}

static void replaceConstants(Node *head) {
  ReplaceConstantsVisitor visitor;
  visitor.applyVisit(head);
}

static int renameVars(Node *head, int n, int modID,
                      std::unordered_map<std::string, Node *> &declMap) {
  IdentifierRenamingVisitor visitor(n, modID, declMap);
  visitor.applyVisit(head);
  return visitor.varID;
}

static bool isAnsi(Node *head) {
  bool ansi = false;
  if (head->getElement() == "list_of_ports_or_port_declarations_ansi")
    ansi = true;

  for (int i = 0; i < (int)head->getChildren().size() && !ansi; i++) {
    ansi |= isAnsi(head->getChildren()[i].get());
  }
  return ansi;
}

static int countNumberPorts(Node *head) {
  int count = 0;

  if (head->getElement() == "port_declaration_non_ansi")
    count += 1;

  for (auto const &c : head->getChildren()) {
    count += countNumberPorts(c.get());
  }
  return count;
}

static int renameNonAnsiPorts(Node *head, int counter, int n,
                              std::unordered_map<std::string, Node *> &decl_map,
                              bool isdecl = false, bool isDimension = false) {
  isdecl |= head->getElement() == "port_reference";
  isDimension |= head->getElement() == "decl_dimensions_opt";

  if ((head->getElement() == " SymbolIdentifier " ||
       head->getElement() == " EscapedIdentifier " ||
       head->getElement() == " KeywordIdentifier ") &&
      counter == 0) {
    counter++;

  } else if (isdecl && !isDimension &&
             (head->getElement() == " SymbolIdentifier " ||
              head->getElement() == " EscapedIdentifier " ||
              head->getElement() == " KeywordIdentifier ")) {
    auto s = " id_" + std::to_string(counter) + " ";
    decl_map[s] = head;
    if (debug)
      std::cerr << "Renaming ID to " << s << std::endl;
    head->setElement(std::move(s));

    counter++;
  }

  if (counter <= n) {
    for (const auto &c : head->getChildren()) {
      counter = renameNonAnsiPorts(c.get(), counter, n, decl_map, isdecl,
                                   isDimension);
    }
  }

  return counter;
}

static bool
matchNonAnsiPorts(Node *head, int n,
                  std::unordered_map<std::string, Node *> &dir_map) {
  bool done = false;

  if (head->getElement() == "module_item_list_opt") {
    if (debug)
      std::cerr << "Matching non ansi ports" << std::endl;

    for (int i = 1; i <= n; i++) {
      int choice = rand() % 2;

      auto id = " id_" + std::to_string(i) + " ";

      auto dir = (choice) ? "input" : "output";

      auto childId = std::make_unique<Terminal>(id);
      dir_map[id] = childId.get();

      auto childDir = std::make_unique<Terminal>(dir);
      head->insertChildToBegin(std::make_unique<Terminal>("; "));
      head->insertChildToBegin(std::move(childId));
      head->insertChildToBegin(std::move(childDir));
    }
    done = true;
  }

  for (int i = 0; i < (int)head->getChildren().size() && !done; i++) {
    done |= matchNonAnsiPorts(head->getChildren()[i].get(), n, dir_map);
  }

  return done;
}

static int
declareNonAnsiPorts(Node *head,
                    std::unordered_map<std::string, Node *> &decl_map,
                    std::unordered_map<std::string, Node *> &dir_map) {
  auto count = 0;
  if (debug)
    std::cerr << "Code is not ansi" << std::endl;
  count = countNumberPorts(head);
  if (debug)
    std::cerr << count << " vars found" << std::endl;
  renameNonAnsiPorts(head, 0, count, decl_map);
  matchNonAnsiPorts(head, count, dir_map);

  return count;
}

static void replaceTypes(Node *head, int &id) {
  if (head->getElement() == "decl_variable_dimension") {
    head->clearChildren();
    head->insertChildToBegin(std::make_unique<Terminal>(""));
  }
  if (head->getElement() == "integer_vector_type") { // removes reg, logic ...
    head->getChildren()[0]->setElement("type_" + std::to_string(id++));
  } else if (head->getElement() == "udp_port_decl" and
             head->getChildren()[0]->getElement() == " reg ") {
    head->getChildren()[0]->setElement("type_" + std::to_string(id++));

  } else if (head->getElement() == "gatetype" ||
             head->getElement() == "net_type" ||
             head->getElement() == "var_type") // removes wire ...
    head->getChildren()[0]->setElement("type_" + std::to_string(id++));
  else if (head->getElement() == " signed " ||
           head->getElement() == " unsigned ") {
    head->setElement("");
  }

  else {
    for (const auto &c : head->getChildren()) {
      replaceTypes(c.get(), id);
    }
  }
}

static Node *findParameterList(Node *moduleHead) {
  for (const auto &c : moduleHead->getChildren()) {
    if (c->getElement() == "module_parameter_port_list_opt")
      return c.get();
  }

  return nullptr;
}

static bool isId(const std::string &name) {
  return name == " SymbolIdentifier " || name == " EscapedIdentifier ";
}
static void renamePositionalPort(Node *curr, int &id,
                                 bool ismemberName = false) {
  ismemberName |= curr->getElement() == "member_name";
  // std::cerr << "MEMBER: " << ismemberName << std::endl;

  for (auto &c : curr->getChildren()) {
    renamePositionalPort(c.get(), id, ismemberName);
  }

  if (isId(curr->getElement()) && ismemberName) {
    curr->setElement(" id_" + std::to_string(id++));
  }
}

static void renamePositionalPorts(Node *head) {
  if (head->getElement() == "any_port_list_named") {
    int i = 0;
    for (auto &c : head->getChildren()) {
      renamePositionalPort(c.get(), i);
    }
  }
  for (auto &c : head->getChildren()) {
    renamePositionalPorts(c.get());
  }
}

// find ids used in a place where their value should be constant
static void findConstantIDs(Node *head, std::set<std::string> &idsFound,
                            bool isIndex = false) {
  if (head->getElement() == "decl_variable_dimension" ||
      head->getElement() == "select_variable_dimension")
    isIndex = true;

  else if (isIndex && head->getElement().find("id") != std::string::npos &&
           head->getChildren().size() == 0) {
    idsFound.insert(head->getElement());
  }

  for (const auto &c : head->getChildren())
    findConstantIDs(c.get(), idsFound, isIndex);
}

static void createParameterList(Node *parameterList) {
  std::vector<std::unique_ptr<Node>> children;

  children.push_back(std::make_unique<Terminal>(" #( "));
  children.push_back(std::make_unique<Terminal>(" ) "));

  parameterList->setChildren(std::move(children));
}

static void addParametersToList(Node *parameterList,
                                const std::set<std::string> &constantIds) {
  std::string list = "";
  for (auto id : constantIds) {
    list += "parameter " + id + " = 32'd" + std::to_string(rand() % 100) + ",";
  }
  list.pop_back();
  list += " ) ";

  parameterList->getChildren()[parameterList->getChildren().size() - 1]
      .get()
      ->setElement(list);
}

static void
renameConstantIDsDeclarations(std::unordered_map<std::string, Node *> &declMap,
                              std::unordered_map<std::string, Node *> &dirMap,
                              std::set<std::string> &constantIDs) {
  for (auto &id : constantIDs) {
    if (declMap.find(id) != declMap.end()) {
      std::string newId = id;
      if (newId[0] == ' ') {
        newId[0] = '_';
        declMap[id]->setElement(" " + newId);
      } else {
        declMap[id]->setElement(" _" + newId);
      }
    }

    if (dirMap.find(id) != dirMap.end()) {
      std::string newId = id;
      newId[0] = '_';
      dirMap[id]->setElement(" " + newId);
    }
  }
}

static void
addConstantIDsToParameterList(Node *head,
                              std::unordered_map<std::string, Node *> &declMap,
                              std::unordered_map<std::string, Node *> &dirMap) {
  std::set<std::string> constantIDs;
  findConstantIDs(head, constantIDs);

  if (constantIDs.empty())
    return;

  auto parameterList = findParameterList(head); // Can't be null
  assert(parameterList != nullptr);

  if (parameterList->getChildren().size() <= 1) {
    createParameterList(parameterList);
  } else if (parameterList->getChildren().size() > 3) {
    parameterList->insertChild(
        std::make_unique<Terminal>(" , "),
        std::next(parameterList->getChildren().begin(),
                  parameterList->getChildren().size() - 1));
  }

  addParametersToList(parameterList, constantIDs);

  renameConstantIDsDeclarations(declMap, dirMap, constantIDs);
}

static void removeParameters(Node *head) {
  auto param = findParameterList(head);
  param->clearChildren();
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
    ("printseed", "Prints the randomization seed.")
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

  auto jsonFile = flags["file"].as<std::string>();
  if (!std::filesystem::exists(jsonFile)) {
    std::cerr << "'" << jsonFile << "' is not a valid file." << std::endl;
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

  if (flags.count("printseed"))
    printSeed = true;

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

  std::vector<Node *> modules, portDeclarations;

  findNodes(head.get(), modules, portDeclarations);

  removePortDeclarations(portDeclarations);

  replaceConstants(head.get());
  renamePositionalPorts(head.get());
  int modID = 0;
  std::unordered_map<std::string, Node *> declMap;
  std::unordered_map<std::string, Node *> dirMap;
  for (const auto &m : modules) {
    declMap.clear();
    dirMap.clear();
    auto ansi = isAnsi(m);
    int n = 0;
    if (!ansi) {
      n = declareNonAnsiPorts(m, declMap, dirMap);
    }
    removeParameters(m);
    int lastID = renameVars(m, n, modID++, declMap);

    addConstantIDsToParameterList(m, declMap, dirMap);
    replaceTypes(m, lastID);
  }

  declMap.clear();
  renameVars(head.get(), 0, 0, declMap);

  if (flags.count("printtree"))
    dumpSyntaxTree(head.get());

  codeGen(head.get());

  return 0;
}
