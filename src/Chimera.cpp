#include "AST.h"
#include "CodeGenVisitor.h"
#include "ConstantsReplacerVisitor.h"
#include "DOTGenVisitor.h"
#include "Functions.h"
#include "IdentifierRenamingVisitor.h"
#include "ReachingDefs.h"
#include "TypeInference.h"
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

static constexpr char separator = '~';

std::vector<int> declared_modules;

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
    std::cerr << "Unknown production '" << productionName << "'\n";
    std::cerr << "Aborting\n";
    exit(1);
  }

  return it->second(std::move(element));
}

static void isnetdecl(std::vector<std::string> &prods, bool &is_first_netassign,
                      bool &is_first_netvariable) {
  if (prods[0] == "net_variable") {
    if (!is_first_netassign) {
      is_first_netvariable = true;
    } else {
      prods.clear();
      prods.push_back("net_decl_assign");
    }
  } else if (prods[0] == "net_decl_assign") {
    if (!is_first_netvariable) {
      is_first_netassign = true;
    } else {
      prods.clear();
      prods.push_back("net_variable");
    }
  }
}

static std::unique_ptr<Node> buildSyntaxTree(
    const std::unordered_map<std::string, std::unordered_map<std::string, int>>
        &map,
    const int n, std::mt19937 &gen) {

  bool is_first_netassign = false;
  bool is_first_netvariable = false;
  auto head = classMap["source_text"]("source_text");
  head->setParent(nullptr);

  std::stack<Node *> stack;
  stack.push(head.get());

  while (!stack.empty()) {
    auto curr = stack.top();
    stack.pop();

    std::string context = getNodeContext(curr, n);
    auto prods = chooseProds(map, context, gen);

    isnetdecl(prods, is_first_netassign, is_first_netvariable);
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

static void findModulePorts(Node *head, std::vector<Node *> &modules,
                            std::vector<Node *> &portDeclarations) {
  if (head->type == NodeType::MODULE_OR_INTERFACE_DECLARATION) {
    modules.push_back(head);
  } else if (head->type == NodeType::MODULE_PORT_DECLARATION) {
    portDeclarations.push_back(head);
  }

  for (const auto &c : head->getChildren()) {
    findModulePorts(c.get(), modules, portDeclarations);
  }
}

static void removePortDeclarations(std::vector<Node *> &portDeclarations) {
  for (auto *decl : portDeclarations) {
    decl->getParent()->clearChildren();
  }
}

static PortDir getPortFromString(std::string port) {
  auto p = PortDir::INPUT;
  if (port == " output ") {
    p = PortDir::OUTPUT;
  } else if (port == " inout ") {
    p = PortDir::INOUT;
  }

  return p;
}

static void codeGen(Node *head) {
  CodeGenVisitor visitor;
  visitor.applyVisit(head);
}

static void replaceConstants(Node *head) {
  ReplaceConstantsVisitor visitor;
  visitor.applyVisit(head);
}

static int renameVars(
    Node *head, int modID, std::unordered_map<std::string, Node *> &declMap,
    std::unordered_map<std::string, std::pair<Node *, PortDir>> &directionMap) {
  IdentifierRenamingVisitor visitor(modID, declMap, directionMap);
  visitor.applyVisit(head);
  if (visitor.to_define.size() > 0) {
    return -1;
  }
  declared_modules.push_back(modID);
  return visitor.varID;
}

static bool isAnsi(Node *head) {
  bool ansi = false;
  if (head->type == NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ANSI)
    ansi = true;

  for (int i = 0; i < (int)head->getChildren().size() && !ansi; i++) {
    ansi |= isAnsi(head->getChildren()[i].get());
  }
  return ansi;
}

static int countNumberPorts(Node *head) {
  int count = 0;

  if (head->type == NodeType::PORT_DECLARATION_NON_ANSI)
    count += 1;

  for (auto const &c : head->getChildren()) {
    count += countNumberPorts(c.get());
  }
  return count;
}

static int renameNonAnsiPorts(Node *head, int counter, int n,
                              std::unordered_map<std::string, Node *> &decl_map,
                              bool isdecl = false, bool isDimension = false) {
  isdecl |= head->type == NodeType::PORT_REFERENCE;
  isDimension |= head->type == NodeType::DECL_DIMENSIONS_OPT;

  if ((head->type == NodeType::SYMBOLIDENTIFIER ||
       head->type == NodeType::ESCAPEDIDENTIFIER ||
       head->type == NodeType::KEYWORDIDENTIFIER) &&
      counter == 0) {
    counter++;

  } else if (isdecl && !isDimension &&
             (head->type == NodeType::SYMBOLIDENTIFIER ||
              head->type == NodeType::ESCAPEDIDENTIFIER ||
              head->type == NodeType::KEYWORDIDENTIFIER)) {
    auto s = " id_" + std::to_string(counter) + " ";
    decl_map[s] = head;
    if (debug)
      std::cerr << "Renaming ID to " << s << std::endl;
    head->setElement(s);

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

static bool matchNonAnsiPorts(
    Node *head, int n, std::unordered_map<std::string, Node *> &dir_map,
    std::unordered_map<std::string, std::pair<Node *, PortDir>> &directionMap,
    std::vector<std::pair<std::string, PortDir>> &portList) {
  bool done = false;

  if (head->type == NodeType::MODULE_ITEM_LIST_OPT) {
    if (debug)
      std::cerr << "Matching non ansi ports" << std::endl;

    for (int i = 1; i <= n; i++) {
      PortDir choice = static_cast<PortDir>((unsigned short)rand() % 3);
      std::string iStr = std::to_string(i);

      auto id = " id_" + iStr + " ";
      auto type = " type_" + iStr + " ";

      std::string dir = "";

      switch (choice) {
      case PortDir::INPUT:
        dir = "input";
        break;
      case PortDir::OUTPUT:
        dir = "output";
        break;
      case PortDir::INOUT:
      default:
        dir = "inout";
        break;
      }

      auto childId = std::make_unique<Symbolidentifier>(id);
      dir_map[id] = childId.get();

      auto childDir = std::make_unique<Terminal>(dir);
      directionMap[id] = {childDir.get(), choice};
      portList.push_back({id, choice});

      auto childType = std::make_unique<Terminal>(type);
      auto module_item = std::make_unique<Module_item>("module_item");
      module_item->setParent(head);

      auto t1 = std::make_unique<Terminal>("; ");
      t1->setParent(module_item.get());
      module_item->insertChildToBegin(std::move(t1));

      childId->setParent(module_item.get());
      module_item->insertChildToBegin(std::move(childId));

      childType->setParent(module_item.get());
      module_item->insertChildToBegin(std::move(childType));

      childDir->setParent(module_item.get());
      module_item->insertChildToBegin(std::move(childDir));

      head->insertChildToBegin(std::move(module_item));
    }
    done = true;
  }

  for (int i = 0; i < (int)head->getChildren().size() && !done; i++) {
    done |= matchNonAnsiPorts(head->getChildren()[i].get(), n, dir_map,
                              directionMap, portList);
  }

  return done;
}

static void declareNonAnsiPorts(
    Node *head, std::unordered_map<std::string, Node *> &decl_map,
    std::unordered_map<std::string, Node *> &dir_map,
    std::unordered_map<std::string, std::pair<Node *, PortDir>> &directionMap,
    std::vector<std::pair<std::string, PortDir>> &portList) {
  auto count = 0;
  if (debug)
    std::cerr << "Code is not ansi" << std::endl;
  count = countNumberPorts(head);
  if (debug)
    std::cerr << count << " vars found" << std::endl;
  renameNonAnsiPorts(head, 0, count, decl_map);
  matchNonAnsiPorts(head, count, dir_map, directionMap, portList);
}

static void replaceTypes(Node *head, int &id) {
  /* if (head->type == NodeType::DECL_VARIABLE_DIMENSION) {
    head->clearChildren();
    head->insertChildToBegin(std::make_unique<Terminal>(""));
  } else  */
  if (head->type == NodeType::INTEGER_VECTOR_TYPE) { // removes reg, logic ...
    head->getChildren()[0]->setElement("type_" + std::to_string(id++));
  } else if (head->type == NodeType::UDP_PORT_DECL &&
             head->getChildren()[0]->getElement() == " reg ") {
    head->getChildren()[0]->setElement("type_" + std::to_string(id++));

  } else if (head->type == NodeType::GATETYPE ||
             head->type == NodeType::NET_TYPE ||
             head->type == NodeType::VAR_TYPE) { // removes wire ...
    head->getChildren()[0]->setElement("type_" + std::to_string(id++));
  }

  else if (head->getElement() == " signed " ||
           head->getElement() == " unsigned ") {

    head->setElement("");

  } else if (head->getElement() == " string ") {

    head->setElement("type_" + std::to_string(id++));
  } else {
    for (const auto &c : head->getChildren()) {
      replaceTypes(c.get(), id);
    }
  }
}

static Node *findParameterList(Node *moduleHead) {
  for (const auto &c : moduleHead->getChildren()) {
    if (c->type == NodeType::MODULE_PARAMETER_PORT_LIST_OPT)
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
static void findConstantIDs(Node *head,
                            std::set<std::pair<std::string, bool>> &idsFound,
                            bool isIndex = false, bool isParam = false) {
  if (head->type == NodeType::DECL_VARIABLE_DIMENSION ||
      head->type == NodeType::SELECT_VARIABLE_DIMENSION)
    isIndex = true;

  else if ((isIndex || isParam) &&
           head->getElement().find("id") != std::string::npos &&
           head->getChildren().size() == 0) {
    bool shouldRename = true;

    if (isParam)
      shouldRename = false;

    idsFound.insert({head->getElement(), shouldRename});
  }

  for (const auto &c : head->getChildren()) {

    if (head->type == NodeType::DEFPARAM_ASSIGN &&
        c->type == NodeType::REFERENCE)
      findConstantIDs(c.get(), idsFound, isIndex, true);
    else
      findConstantIDs(c.get(), idsFound, isIndex, isParam);
  }
}

static void createParameterList(Node *parameterList) {
  std::vector<std::unique_ptr<Node>> children;

  children.push_back(std::make_unique<Terminal>(" #( "));

  parameterList->setChildren(std::move(children));
}

static void removeNodes(Node *head, NodeType t) {
  if (head->type == t) {
    head->getParent()->extractChild(head);
    return;
  }

  for (size_t i = 0; i < head->getChildren().size(); i++) {
    removeNodes(head->getChildren()[i].get(), t);
  }
}

// finds the first occurrence of a node with type t
Node *findNode(Node *head, NodeType t) {
  if (head->type == t)
    return head;

  for (const auto &c : head->getChildren()) {
    if (auto ret = findNode(c.get(), t))
      return ret;
  }

  return nullptr;
}

// populates the vector nodes with all the occurrence of nodes with type t
void findNodes(Node *head, std::vector<Node *> &nodes, NodeType t) {
  if (head->type == t)
    nodes.push_back(head);

  for (const auto &c : head->getChildren())
    findNodes(c.get(), nodes, t);
}

Node *getChild(std::vector<std::unique_ptr<Node>> const &children, NodeType t) {
  for (auto &c : children) {
    if (c->type == t)
      return c.get();
  }
  return nullptr;
}

static void
addParametersToList(Node *parameterList,
                    const std::set<std::pair<std::string, bool>> &constantIds) {
  for (auto &[id, _] : constantIds) {
    auto node = std::make_unique<Terminal>("parameter");
    parameterList->insertChildToEnd(std::move(node));
    auto node2 = std::make_unique<Symbolidentifier>(id);
    parameterList->insertChildToEnd(std::move(node2));
    node = std::make_unique<Terminal>("=");
    parameterList->insertChildToEnd(std::move(node));
    node = std::make_unique<Terminal>("32'd" + std::to_string(rand() % 100));
    parameterList->insertChildToEnd(std::move(node));
    node = std::make_unique<Terminal>(",");
    parameterList->insertChildToEnd(std::move(node));
  }

  parameterList->getChildren()[parameterList->getChildren().size() - 1]
      .get()
      ->setElement(")");
}

static void renameConstantIDsDeclarations(
    std::unordered_map<std::string, Node *> &declMap,
    std::unordered_map<std::string, Node *> &dirMap,
    std::set<std::pair<std::string, bool>> &constantIDs) {
  for (auto &[id, shouldRename] : constantIDs) {

    if (shouldRename && declMap.find(id) != declMap.end()) {
      std::string newId = id;
      if (newId[0] == ' ') {
        newId[0] = '_';
        declMap.at(id)->setElement(" " + newId);

      } else {
        declMap.at(id)->setElement(" _" + newId);
      }
    }

    if (dirMap.find(id) != dirMap.end()) {
      std::string newId = id;
      newId[0] = '_';
      dirMap[id]->setElement(" " + newId);
    }
  }
}

static void removeAssignmentsInPorts(Node *head) {
  if (head->type == NodeType::PORT_DECLARATION_ANSI ||
      head->type == NodeType::PORT) {

    for (auto &c : head->getChildren()) {
      if (c->type == NodeType::TRAILING_ASSIGN_OPT) {
        c->clearChildren();
      }
    }

  } else {
    for (auto &c : head->getChildren())
      removeAssignmentsInPorts(c.get());
  }
}

static void
addConstantIDsToParameterList(Node *head,
                              std::unordered_map<std::string, Node *> &declMap,
                              std::unordered_map<std::string, Node *> &dirMap) {
  std::set<std::pair<std::string, bool>> constantIDs;
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

static void writeSyntaxTreeToDOT(Node *head, const std::string &fileName) {
  DOTGenVisitor visitor;
  visitor.visit(head);
  visitor.writeToFile(fileName);
}

static cxxopts::ParseResult parseArgs(int argc, char **argv) {
  // clang-format off
  cxxopts::Options options("Chimera", "Generates SystemVerilog Programs based on a json file of probabilities.");
  options.positional_help("[options] <file> <n-value>");

  options.add_options()
    ("file", "JSON file with n-gram probabilities", cxxopts::value<std::string>())
    ("n-value", "Number of n-grams to be used", cxxopts::value<int>()->default_value("1"))
    ("t,target-size", "Target size for the generated programs", cxxopts::value<int>()->default_value("100"))
    ("p,printtree", "Prints productions chains.")
    ("visualisetree", "Generates a DOT file with the syntax tree.")
    ("printseed", "Prints the randomization seed.")
    ("printcfg","Generates call graph dot file.")
    ("d,debug", "Prints debug messages.")
    ("b,addbind", "Enables bind statements (not supported in many EDA tools)")
    //("a,allow-ambiguous", "Force the inference analyses to allow programs with ambiguous types.")
    ("v,verbose", "Verbose output.") //Needs to implement
    ("addasserts", "Adds assert constructions.")
    ("s,seed", "Set the seed for randomization.", cxxopts::value<std::random_device::result_type>())
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
PortDir currentDir = PortDir::INPUT;

static void setDir(Node *head) {

  if (head->getChildren()[0]->type != NodeType::DIR)
    return;

  auto currPort = head->getChildren()[0]->getChildren()[0]->getElement();

  if (currPort == " output ")
    currentDir = PortDir::OUTPUT;
  else if (currPort == " input ")
    currentDir = PortDir::INPUT;
  else if (currPort == " inout ")
    currentDir = PortDir::INOUT;
}

// get id from data_type_or_implicit_basic_followed_by_id_and_dimensions_opt
// node
static Node *getID(Node *head) {

  if (head->type == NodeType::GENERICIDENTIFIER) {
    return head->getChildren()[0].get();

  } else if (head->type == NodeType::CLASS_ID) {

    return getID(head->getChildren()[0]
                     ->getChildren()[0]
                     .get()); // accesses GenericIdentifier directly

  } else if (head->type == NodeType::UNQUALIFIED_ID) {
    return getID(head->getChildren()[0].get());

  } else if (head->type == NodeType::PORT_DECLARATION_ANSI) {

    if (head->getChildren()[0]->type == NodeType::PORT_DIRECTION) {
      return getID(head->getChildren()[2].get());
    } else if (head->getChildren()[0]->type ==
               NodeType::TYPE_IDENTIFIER_FOLLOWED_BY_ID) {
      return getID(head->getChildren()[0].get());
    } else if (head->getChildren()[0]->type == NodeType::DATA_TYPE_PRIMITIVE) {
      return getID(head->getChildren()[1].get());
    }

  } else if (
      head->type ==
      NodeType::DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT) {

    if (head->getChildren().size() == 1) {
      return getID(head->getChildren()[0]
                       ->getChildren()[0]
                       .get()); // accesses unqualified_id directly
    } else if (head->getChildren()[0]->type ==
               NodeType::SIGNING) { // id is in class_id in third position
      return getID(head->getChildren()[2].get());
    } else { // id is in class_id production in the second position
      return getID(head->getChildren()[1].get());
    }
  }
  return NULL;
}

static void findAnsiDeclarations(
    std::unordered_map<std::string, std::pair<Node *, PortDir>> &directionMap,
    Node *head, std::unordered_map<std::string, Node *> &decl_map, int &counter,
    int &typeCounter, std::vector<std::pair<std::string, PortDir>> &portList) {

  if (head->type == NodeType::PORT_DECLARATION_ANSI) {
    if (head->getChildren()[0].get()->type == NodeType::PORT_DIRECTION) {

      setDir(head->getChildren()[0].get());

      auto id = getID(head);
      if (id) {
        auto s = " id_" + std::to_string(counter++) + " ";

        decl_map[s] = id;

        if (debug)
          std::cerr << "Renaming ID to " << s << std::endl;

        id->setElement(s);

        directionMap[s] = {head, currentDir};
        portList.push_back({s, currentDir});
      }

      auto netType = head->getChildren()[1].get();

      if (netType->getChildren()[0]->getElement().empty()) {
        netType->getChildren()[0]->setElement(
            " type_" + std::to_string(typeCounter++) + " ");
      }
      auto dataType = head->getChildren()[2].get();

      for (auto &c : dataType->getChildren()) {
        if (c->type == NodeType::DECL_DIMENSIONS ||
            c->type == NodeType::DECL_DIMENSIONS_OPT ||
            c->type == NodeType::DATA_TYPE_PRIMITIVE) {
          c->clearChildren();
          c->insertChildToBegin(std::make_unique<Terminal>(""));
        }
      }
    }
  }

  for (const auto &c : head->getChildren()) {
    findAnsiDeclarations(directionMap, c.get(), decl_map, counter, typeCounter,
                         portList);
  }
}

static void findModuleName(Node *head, Node *&name) {

  if (head->type == NodeType::GENERICIDENTIFIER &&
      !head->getChildren().empty()) {
    if (head->getChildren()[0]->getElement().find("module") !=
        std::string::npos) {
      name = head->getChildren()[0].get();
    } else if (head->getChildren()[0]->type == NodeType::KEYWORDIDENTIFIER) {
      name = head->getChildren()[0]
                 ->getChildren()[0]
                 .get(); // accesses the terminal child of keywordIdentifier
    }
  } else {
    for (const auto &c : head->getChildren()) {
      findModuleName(c.get(), name);
    }
  }
}

static void removeEmptyGateTypes(Node *head) {
  if (head->type == NodeType::GATETYPE &&
      head->getChildren()[0]->getElement().empty()) {
    auto parent = head->getParent();
    parent->clearChildren();
    parent->insertChildToEnd(std::make_unique<Terminal>(""));
  } else {
    for (size_t i = 0; i < head->getChildren().size(); i++) {
      removeEmptyGateTypes(head->getChildren()[i].get());
    }
  }
}

static void removeIncorrectGates(Node *head) {
  // Remove gates declarations from the generated module
  if (head->type ==
      NodeType::NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE) {
    if (head->getChildren()[2]->getElement() == " ( ") {
      head->extractChild(head->getChildren()[2].get());
      head->extractChild(head->getChildren()[2].get());
      head->getChildren()[2]->setElement(" ; ");
    }
  }

  for (size_t i = 0; i < head->getChildren().size(); i++) {
    removeIncorrectGates(head->getChildren()[i].get());
  }
}

static std::string findIdFromNode(Node *head) {

  // head is a terminal node
  if (head->getChildren().size() == 0) {
    return head->getElement();
  }
  std::string id;
  for (size_t i = 0; i < head->getChildren().size(); i++) {
    id += findIdFromNode(head->getChildren()[i].get());
  }
  return id;
}

static void
findAssignments(Node *head,
                std::vector<std::pair<std::string, std::string>> &assignments) {
  if (head->type == NodeType::CONT_ASSIGN) {
    std::string lhs = findIdFromNode(head->getChildren()[0].get());
    std::string rhs = findIdFromNode(head->getChildren()[2].get());
    assignments.push_back({lhs, rhs});
  }
  for (size_t i = 0; i < head->getChildren().size(); i++) {
    findAssignments(head->getChildren()[i].get(), assignments);
  }
}

static void
addAsserts(Node *head,
           std::vector<std::pair<std::string, std::string>> &assignments,
           long unsigned int index) {
  if (index >= assignments.size()) {
    return;
  }
  if (head->type == NodeType::CONT_ASSIGN) {
    head->insertChildToEnd(std::make_unique<Terminal>(";"));
    head->insertChildToEnd(std::make_unique<Terminal>("assert ("));
    head->insertChildToEnd(
        std::make_unique<Terminal>(assignments[index].first));
    head->insertChildToEnd(std::make_unique<Terminal>("=="));
    head->insertChildToEnd(
        std::make_unique<Terminal>(assignments[index].second));
    head->insertChildToEnd(std::make_unique<Terminal>(");"));
    index += 1;
  }
  for (size_t i = 0; i < head->getChildren().size(); i++) {
    addAsserts(head->getChildren()[i].get(), assignments, index);
  }
}

static void removeIncorrectParameters(Node *head) {
  // Remove gates declarations from the generated module
  if (head->type == NodeType::PARAMETER_VALUE_OPT) {
    head->clearChildren();
    head->insertChildToEnd(std::make_unique<Terminal>(""));
  }

  for (size_t i = 0; i < head->getChildren().size(); i++) {
    removeIncorrectParameters(head->getChildren()[i].get());
  }
}

static void
renameQualifiedIds(Node *head,
                   std::vector<std::pair<std::string, PortDir>> &portList) {
  if (portList.size() == 0) {
    return;
  }
  if (head->getElement() == "SCOPE") {
    head->setElement(" module_" + std::to_string(declared_modules[0]));
  }
  if (head->getElement() == "SCOPE_ELEMENT") {
    head->setElement(portList[0].first);
  }
  for (size_t i = 0; i < head->getChildren().size(); i++) {
    renameQualifiedIds(head->getChildren()[i].get(), portList);
  }
}

static void generateModules(
    int n,
    std::unordered_map<std::string, std::unordered_map<std::string, int>> map,
    std::unique_ptr<Node> &head, std::mt19937 &gen,
    std::vector<std::shared_ptr<Module>> &modules) {

  head = buildSyntaxTree(map, n, gen);

  removeIncorrectGates(head.get());
  removeIncorrectParameters(head.get());

  std::vector<Node *> moduleHeads, portDeclarations;
  findModulePorts(head.get(), moduleHeads, portDeclarations);

  removePortDeclarations(portDeclarations);
  bool isCorrect = true;

  replaceConstants(head.get());
  renamePositionalPorts(head.get());
  int modID = 0;
  std::unordered_map<std::string, Node *> declMap; //
  std::unordered_map<std::string, Node *> dirMap;  // maps an id to its
                                                   // definition
  std::unordered_map<std::string, std::pair<Node *, PortDir>>
      directionMap; // maps the direction(in, out, inout) of the ids
  std::vector<std::pair<std::string, PortDir>>
      portList; // list of ports for a module
  std::vector<std::pair<std::string, PortDir>> previousPortList;
  for (auto &m : moduleHeads) {

    declMap.clear();
    dirMap.clear();
    directionMap.clear();
    portList.clear();
    auto ansi = isAnsi(m);

    if (!ansi) {
      declareNonAnsiPorts(m, declMap, dirMap, directionMap, portList);
    } else {
      int counter = 0;
      int typeCounter = 0;
      findAnsiDeclarations(directionMap, m, declMap, counter, typeCounter,
                           portList);
    }
    removeParameters(m);
    removeAssignmentsInPorts(m);

    // Rename SymbolIdentifier placeholders
    int lastID = renameVars(m, modID++, declMap, directionMap);

    // Discard programs that use variables not declared
    if (lastID == -1) {
      isCorrect = false;
    }

    // Replace real generated types for placeholders
    // Prepares for type inference
    replaceTypes(m, lastID);
    addConstantIDsToParameterList(m, declMap, dirMap);

    std::unordered_map<std::string, CanonicalTypes>
        idToType; // maps an id to its inferred type

    isCorrect = inferTypes(m, idToType) && isCorrect;

    if (isCorrect) {

      // Removes not replaced gate types
      removeEmptyGateTypes(m);

      auto mod = std::make_shared<Module>();

      mod->moduleHead = m->getParent()->extractChild(m);
      mod->directionMap = std::move(directionMap);
      mod->portList = std::move(portList);
      mod->idToType = idToType;

      // Get the name of the module
      findModuleName(m, mod->moduleName);
      if (previousPortList.size() == 0) {
        previousPortList = mod->portList;
      }
      renameQualifiedIds(mod->moduleHead.get(), previousPortList);

      // Map live vars to each program point
      ReachingDefsVisitor rd(mod->programPoints);
      rd.applyVisit(mod->moduleHead.get());

      modules.push_back(std::move(mod));
    }
    previousPortList = portList;
  }
  declMap.clear();
  dirMap.clear();
  directionMap.clear();

  // Rename what is left of the generated program, e.g. global vars
  renameVars(head.get(), 0, declMap, directionMap);
}

static void measureSize(Node *head, int &size) {
  if (head->getChildren().empty() && !head->getElement().empty()) {

    size++;
  } else {
    for (const auto &c : head->getChildren()) {
      measureSize(c.get(), size);
    }
  }
}

static int measureSize(std::vector<std::shared_ptr<Module>> &heads) {
  int size = 0;
  for (const auto &h : heads) {
    measureSize(h->moduleHead.get(), size);
  }
  return size;
}

static bool isCompatible(CanonicalTypes t1, CanonicalTypes t2) {
  auto isWireAndDefault =
      (t1 == CanonicalTypes::SCALAR || t1 == CanonicalTypes::DEFAULT_TYPE) &&
      (t2 == CanonicalTypes::SCALAR || t2 == CanonicalTypes::DEFAULT_TYPE);

  return t1 == t2 || isWireAndDefault;
}

static std::string
findCompatibleId(const std::vector<std::string> &idsCallerModule,
                 std::unordered_map<std::string, std::pair<Node *, PortDir>>
                     &directionMapCaller,
                 std::unordered_map<std::string, CanonicalTypes> &typeMapCaller,
                 CanonicalTypes type, PortDir dir) {
  for (const auto &id : idsCallerModule) {

    if (typeMapCaller.find(id) != typeMapCaller.end() &&
        isCompatible(typeMapCaller[id], type) &&
        (directionMapCaller.find(id) == directionMapCaller.end() ||
         directionMapCaller[id].second == dir ||
         directionMapCaller[id].second == PortDir::INOUT))
      return id;
  }
  return "";
}

static std::string getDefaultValue(CanonicalTypes t) {
  switch (t) {
  case CanonicalTypes::SCALAR:
  case CanonicalTypes::CONST_SCALAR:
  case CanonicalTypes::BIT:
  case CanonicalTypes::LOGIC:
  case CanonicalTypes::REG:
  case CanonicalTypes::WIRE:
  case CanonicalTypes::INTEGER:
    return "0";

  case CanonicalTypes::FLOAT_SCALAR:
    return "0.0";
  case CanonicalTypes::STRING:
    return "\"\"";
  default:
    if (debug)
      std::cerr << "Type " << static_cast<typeId>(t) << " has no default value"
                << std::endl;
  }
  return "";
}

std::string getStringfromType(CanonicalTypes t) {
  switch (t) {

  case CanonicalTypes::BIT:
    return " bit ";
  case CanonicalTypes::SCALAR:
  case CanonicalTypes::CONST_SCALAR:
  case CanonicalTypes::LOGIC:
    return " logic ";
  case CanonicalTypes::REG:
    return " reg ";

  case CanonicalTypes::WIRE:
    return " wire ";
  case CanonicalTypes::INTEGER:
    return " int ";

  case CanonicalTypes::FLOAT_SCALAR:
    return " float ";
  case CanonicalTypes::STRING:
    return " string ";
  default:
    if (debug)
      std::cerr << "Type " << static_cast<typeId>(t)
                << " has no defined type as string" << std::endl;
  }
  return "";
}

static size_t getPosFromPP(ProgramPoint &pp) {
  Node *parent = pp.programPoint->getParent();
  size_t pos = 0;

  while (pos < parent->getChildren().size() &&
         parent->getChildren()[pos].get() != pp.programPoint)
    pos++;

  return pos;
}

// creates assignment for an hierarchical reference and place it just after the
// program point indicated
static void hierarchicalReference(Node *parent, size_t pos,
                                  const std::string &id,
                                  const std::string &value, std::string &scope,
                                  const std::string &callName) {

  const auto reference =
      "assign " + callName + "." + scope + id + " = " + value + ";";
  parent->insertChild(std::make_unique<Terminal>(reference),
                      std::next(parent->getChildren().begin(), pos));
}

static void callModule(ProgramPoint &caller, const std::string &callee,
                       std::vector<std::string> &chosenIds,
                       std::string callName) {

  std::string call = callee + " " + callName + " (";

  for (size_t i = 0; i < chosenIds.size(); i++) {
    call += chosenIds[i] + ((i < chosenIds.size() - 1) ? "," : "");
  }
  call += ");";
  auto parent = caller.programPoint->getParent();
  auto pos = getPosFromPP(caller) +
             1; // the new child must be after the caller program point

  parent->insertChild(std::make_unique<Terminal>(call),
                      std::next(parent->getChildren().begin(), pos));
}

static bool endsWith(const std::string &str, const std::string &pattern) {
  // Check if the string is shorter than the pattern
  if (str.length() < pattern.length()) {
    return false;
  }
  // Compare the substring from the end of the string
  return str.rfind(pattern) == (str.length() - pattern.length());
}

static double estimatePrimitiveModuleProbability(
    int n_gram,
    std::unordered_map<std::string, std::unordered_map<std::string, int>>
        &grammar) {

  double sum = 0;
  double prob = 0;

  if (n_gram == 1) {

    for (auto &[p1, p2] : grammar["module_or_generate_item"]) {
      if (p1 == "gate_instantiation") {
        prob = p2;
      }
      sum += p2;
    }

  } else {
    for (auto &[p1, p2] : grammar) {
      if (endsWith(p1, "module_or_generate_item")) {
        for (auto &[p3, p4] : p2) {
          if (p3 == "gate_instantiation") {
            prob += p4;
          }
          sum += p4;
        }
      }
    }
  }

  return prob / sum;
}

static void callPrimitiveModule(Module *m,
                                std::vector<std::string> &availableIds,
                                ProgramPoint &pp) {
  std::vector<std::string> chosenIds;
  std::string name = "";
  PortDir currentPortDir = PortDir::OUTPUT;

  for (const auto &id : availableIds) {
    if (m->directionMap[id].second == currentPortDir ||
        m->directionMap[id].second == PortDir::INOUT) {
      chosenIds.push_back(id);
      currentPortDir = PortDir::INPUT;
    }
  }

  std::vector<std::string> primitiveNames;

  switch (chosenIds.size()) {
  case 2:
    primitiveNames = {"not", "buf"};
    break;
  case 3:
    primitiveNames = {"and",  "or",     "xor",    "nand",   "nor",
                      "xnor", "bufif1", "bufif0", "notif1", "notif0"};

    break;
  default:

    if (chosenIds.size() >= 3) {
      primitiveNames = {"and", "or", "xor", "nand", "nor", "xnor"};
    } else {

      return;
    }

    break;
  }
  name = primitiveNames[rand() % primitiveNames.size()];
  callModule(pp, name, chosenIds, "primCall");
}

static void
addPrimitiveFunctionCalls(std::vector<std::shared_ptr<Module>> &modules) {
  std::vector<std::string> primitiveFunctions = {"clog2", "signed", "unsigned"};

  for (auto &m : modules) {
    for (auto &pp : m->programPoints) {
      if (auto pf = findNode(pp.programPoint, NodeType::SYSTEM_TF_CALL)) {
        pf->clearChildren(); // remove placeholder

        auto primitiveF =
            primitiveFunctions[rand() % primitiveFunctions.size()];

        std::string selected_id = "";

        for (auto &id : pp.defs) {
          if (m->idToType[id] == CanonicalTypes::CONST_SCALAR) {
            selected_id = id;
            break;
          }
        }
        if (selected_id.empty())
          selected_id = std::to_string(rand() % 100);

        pf->insertChildToBegin(
            std::make_unique<Terminal>(" $" + primitiveF + " "));
        pf->insertChildToEnd(std::make_unique<Terminal>(" ( "));
        pf->insertChildToEnd(std::make_unique<Terminal>(selected_id));
        pf->insertChildToEnd(std::make_unique<Terminal>(" ) "));
        pf->insertChildToEnd(std::make_unique<Terminal>(" ; "));
      }
    }
  }
}

static void addBindStatement(std::vector<std::shared_ptr<Module>> &modules) {
  if (modules.size() == 0 || modules.size() == 1)
    return;

  auto topModule = modules[0];
  std::shared_ptr<Module> targetModule, boundModule;
  if (modules.size() == 3) {
    targetModule = modules[1];
    boundModule = modules[2];
  } else {
    targetModule = modules[rand() % modules.size()];
    boundModule = modules[rand() % modules.size()];
  }

  if (targetModule == boundModule)
    return;

  auto rng = std::default_random_engine{};
  auto idsSet =
      boundModule->programPoints[boundModule->programPoints.size() - 1].defs;

  std::vector<std::string> availableIds(idsSet.begin(), idsSet.end());
  std::vector<std::string> chosenIds;

  for (auto [x, y] : targetModule->portList) {
    std::shuffle(availableIds.begin(), availableIds.end(), rng);

    // find possible ids to add call to m2 in m
    auto id =
        findCompatibleId(availableIds, boundModule->directionMap,
                         boundModule->idToType, targetModule->idToType[x], y);
    if (id == "")
      return;

    chosenIds.push_back(id);
  }
  auto bind = std::make_unique<Bind_directive>("bind_directive");
  bind->insertChildToEnd(std::make_unique<Terminal>(" bind "));
  bind->insertChildToEnd(std::make_unique<Terminal>(
      " " + targetModule->moduleName->getElement() + " "));
  bind->insertChildToEnd(std::make_unique<Terminal>(
      " " + boundModule->moduleName->getElement() + " "));
  bind->insertChildToEnd(std::make_unique<Terminal>(" bind_inst "));
  bind->insertChildToEnd(std::make_unique<Terminal>(" ( "));
  for (auto const &id : chosenIds) {
    bind->insertChildToEnd(std::make_unique<Terminal>(id));
    bind->insertChildToEnd(std::make_unique<Terminal>(" , "));
  }
  bind->getChildren()[bind->getChildren().size() - 1]->setElement(" ); ");

  topModule->programPoints[topModule->programPoints.size() - 1]
      .programPoint->getParent()
      ->insertChildToEnd(std::move(bind));
}

static void getParametersFromFunction(
    Node *head, std::vector<std::pair<std::string, PortDir>> &parameterList,
    bool fromSignature = true) {
  std::vector<Node *> ports;

  if (fromSignature) {
    findNodes(head, ports, NodeType::TF_PORT_ITEM);
  } else {
    findNodes(head, ports, NodeType::TF_PORT_DECLARATION);
  }

  PortDir currDir = PortDir::INPUT;
  for (auto const &port : ports) {

    if (auto portDir = findNode(port, NodeType::DIR)) {
      currDir = getPortFromString(portDir->getChildren()[0]->getElement());
    }
    std::vector<Node *> ids;
    if (auto idNode = findNode(port, NodeType::TF_VARIABLE_IDENTIFIER_FIRST)) {
      // there's only one id
      auto id = getID(idNode->getChildren()[0].get());
      parameterList.push_back({id->getElement(), currDir});

    } else {
      std::vector<Node *> ids;
      findNodes(port, ids, NodeType::TF_VARIABLE_IDENTIFIER);
      for (auto const &id : ids) {

        parameterList.push_back({getID(id)->getElement(), currDir});
      }
    }
  }
}

static void callFunction(Module &mod, Function *func) {
  auto rng = std::default_random_engine{};
  std::vector<std::string> selectedIds;
  for (auto const &[id, dir] : func->portList) {
    auto availableIds = std::vector(
        mod.programPoints[mod.programPoints.size() - 1].defs.begin(),
        mod.programPoints[mod.programPoints.size() - 1].defs.end());
    std::shuffle(availableIds.begin(), availableIds.end(), rng);

    auto selectedId = findCompatibleId(availableIds, mod.directionMap,
                                       mod.idToType, mod.idToType[id], dir);
    if (selectedId.empty())
      return;

    selectedIds.push_back(selectedId);
  }
  auto procBlock = std::make_unique<Always_construct>("always_construct");
  procBlock->insertChildToEnd(std::make_unique<Terminal>(" always @* "));

  auto callNode = std::make_unique<System_tf_call>("system_tf_call");
  auto nameNode = std::make_unique<Terminal>(func->name);
  callNode->insertChildToEnd(std::move(nameNode));
  callNode->insertChildToEnd(std::make_unique<Terminal>(" ( "));

  for (auto const &id : selectedIds) {
    callNode->insertChildToEnd(std::make_unique<Terminal>(id));
    callNode->insertChildToEnd(std::make_unique<Terminal>(" , "));
  }
  if (selectedIds.size() > 0)
    callNode->getChildren()[callNode->getChildren().size() - 1]->setElement(
        ")");
  else
    callNode->insertChildToEnd(std::make_unique<Terminal>(" )"));
  callNode->insertChildToEnd(std::make_unique<Terminal>(";"));
  procBlock->insertChildToEnd(std::move(callNode));
  auto it = mod.moduleHead->getChildren().begin();

  mod.moduleHead->insertChild(std::move(procBlock), std::next(it, 9));
}

static void
formatandCallCustomFunctions(std::vector<std::shared_ptr<Module>> &modules) {
  for (auto &m : modules) {
    std::vector<Node *> functionNodes;
    findNodes(m->moduleHead.get(), functionNodes,
              NodeType::FUNCTION_DECLARATION);

    for (auto &node : functionNodes) {

      auto func = std::make_unique<Function>();

      auto tfPortList = getChild(node->getChildren(), NodeType::TF_PORT_LIST);
      bool parametersInSignature =
          tfPortList &&
          tfPortList->getChildren()[0]->type !=
              NodeType::TF_PORT_LIST; // if true the function has parameters in
                                      // the signature
      getParametersFromFunction(node, func->portList, parametersInSignature);

      // get function name and type
      auto funcNameNode = getID(node->getChildren()[2]->getChildren()[0].get());

      std::string funcType = "";

      if (m->idToType.find(funcNameNode->getElement()) != m->idToType.end())
        funcType = getStringfromType(m->idToType[funcNameNode->getElement()]);

      if (funcType.empty())
        funcType = " void ";
      func->funcType = funcType;
      func->name = funcNameNode->getElement();

      // adding function type
      auto typeNode = std::make_unique<Terminal>(funcType);
      auto it = node->getChildren().begin();
      node->insertChild(std::move(typeNode), std::next(it, 2));

      callFunction(*m, func.get());
    }
  }
}

int main(int argc, char **argv) {
  auto flags = parseArgs(argc, argv);

  if (flags.count("debug"))
    debug = true;

  bool printSeed = flags.count("printseed") != 0;
  bool verbose = flags.count("verbose") != 0;
  bool pcfg = flags.count("printcfg") != 0;
  bool hasAsserts = flags.count("addasserts") != 0;
  bool bind = flags.count("addbind") != 0;

  std::ostringstream dotcfg;
  if (pcfg) {
    dotcfg << "digraph {\n label=\"Generated verilog cfg\" \n";
  }
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
  auto n = flags["n-value"].as<int>();

  std::unique_ptr<Node> head;
  std::random_device rd;

  if (seed == 0) {
    seed = rd();
  }

  unsigned int finalSeed = seed;
  std::mt19937 gen(seed);

  std::vector<std::shared_ptr<Module>>
      createdModules; // modules that were created
  std::vector<std::shared_ptr<Module>>
      usedModules; // modules already processed that will be in the output
                   // program

  int TARGET_SIZE = flags["target-size"].as<int>();

  double PRIMITIVE_MODULE_PROBABILITY =
      estimatePrimitiveModuleProbability(n, map);
  if (debug)
    std::cerr << "Probability of adding a primitive module: "
              << PRIMITIVE_MODULE_PROBABILITY << std::endl;

  if (verbose && printSeed) {
    std::cerr << "Seed: " << seed << std::endl;
  }

  int callCounter = 1; // id to use when calling a method
  if (printSeed)
    std::cout << "// Seed: " << finalSeed << std::endl;
  do {
    do {
      generateModules(n, map, head, gen,
                      createdModules); // populates createdModules with type
                                       // inference checked modules
    } while (createdModules.empty());

    auto &m =
        createdModules[rand() % createdModules.size()]; // pick a random module
    if (!m->programPoints.empty()) {
      auto pp =
          m->programPoints[rand() %
                           m->programPoints.size()]; // pick a random program
                                                     // point inside m

      for (auto it = createdModules.begin(); it != createdModules.end();) {
        auto &m2 = *it;
        auto rng = std::default_random_engine{};
        std::vector<std::string> availableIds(pp.defs.begin(), pp.defs.end());
        if (m2 != m) {
          bool compatible = true;
          std::vector<std::string> chosenIds;

          for (auto [x, y] : m2->portList) {
            std::shuffle(availableIds.begin(), availableIds.end(), rng);

            // find possible ids to add call to m2 in m
            auto id = findCompatibleId(availableIds, m->directionMap,
                                       m->idToType, m2->idToType[x], y);
            if (id != "") {
              chosenIds.push_back(id);
            } else {
              compatible = false;
              break;
            }
          }

          if (compatible) {
            // Find the iterator for `m`
            auto m_it =
                std::find(createdModules.begin(), createdModules.end(), m);

            if (!m2->isSelected) { // If not in usedModules rename and add it
              m2->isSelected = true;
              m2->moduleName->setElement("module_" +
                                         std::to_string(usedModules.size()));
              if (pcfg)
                dotcfg << m2->moduleName->getElement()
                       << "[ label = " << m2->moduleName->getElement() << "]"
                       << std::endl;
              usedModules.push_back(m2);
            }
            std::string callName = "modCall_" + std::to_string(callCounter);
            callModule(pp, m2->moduleName->getElement(), chosenIds, callName);

            if (!m->isSelected) {
              m->moduleName->setElement("module_" +
                                        std::to_string(usedModules.size()));
              if (pcfg)
                dotcfg << m->moduleName->getElement()
                       << "[label =" << m->moduleName->getElement() << "]\n";
            }
            if (pcfg)
              dotcfg << m->moduleName->getElement() << " -> "
                     << m2->moduleName->getElement() << "[label =  " << callName
                     << " ]\n";

            // adds hierarchical reference
            if (rand() % 2 == 0 &&
                !m2->idToType.empty()) { // reference will be on caller
              std::unordered_map<std::string, CanonicalTypes>::iterator m2It;
              std::size_t counter = 0;

              std::string id = "";
              do {
                m2It = m2->idToType.begin();
                std::advance(m2It, std::abs(rand()) % m2->idToType.size());
                id = m2It->first;
                counter++;
              } while (id.find("id") == std::string::npos &&
                       counter < m2It->first.size());

              auto val = getDefaultValue(m2It->second);
              if (!val.empty()) {
                hierarchicalReference(pp.programPoint->getParent(),
                                      getPosFromPP(pp) + 2, id, val, pp.scope,
                                      callName);
              }
            } else if (!m->idToType.empty() && !m2->idToType.empty()) {
              if (m->idToType.size() > 0) {
                std::unordered_map<std::string, CanonicalTypes>::iterator mIt;
                std::size_t counter = 0;
                std::string id_call = "";

                do {
                  mIt = m->idToType.begin();
                  std::advance(mIt, std::abs(rand()) % m->idToType.size());

                  id_call = mIt->first;
                  counter++;
                } while (id_call.find("id") == std::string::npos &&
                         counter < mIt->first.size());

                auto val = getDefaultValue(mIt->second);
                if (m2->programPoints.size() > 0) {
                  auto pp2 =
                      m2->programPoints[rand() % m2->programPoints.size()];

                  if (!val.empty()) {
                    if (pcfg)
                      dotcfg << m2->moduleName->getElement() << " -> "
                             << m->moduleName->getElement() << "[ label = "
                             << " " << m->moduleName->getElement() << " ]\n";
                    hierarchicalReference(
                        pp2.programPoint->getParent(), getPosFromPP(pp2) + 1,
                        id_call, val, pp2.scope, m->moduleName->getElement());
                  }
                }
              }
            }

            // adds a call to a primitive module
            if (rand() / (double)RAND_MAX < PRIMITIVE_MODULE_PROBABILITY) {
              auto primitiveProgramPoint =
                  m->programPoints[rand() % m->programPoints.size()];
              callPrimitiveModule(m.get(), availableIds, primitiveProgramPoint);
            }

            if (!m->isSelected) {
              m->isSelected = true;

              if (m_it != createdModules.end()) {
                // Move m to usedModules
                usedModules.push_back(std::move(*m_it));
              }
            }

            createdModules.erase(m_it);
            break;
          }
        }

        ++it;
      }
    }
  } while (measureSize(usedModules) < TARGET_SIZE);

  addPrimitiveFunctionCalls(usedModules);
  formatandCallCustomFunctions(usedModules);
  if (bind)
    addBindStatement(usedModules);

  if (pcfg) {
    dotcfg << "}\n";
    std::ofstream dotfile("chimera.cfg.dot", std::ios::trunc);
    if (!dotfile) {
      std::cerr << "can't open output file" << std::endl;
    } else {
      dotfile << dotcfg.str();
      dotfile.close();
    }
  }

  for (const auto &m : usedModules) {
    if (hasAsserts) {
      std::vector<std::pair<std::string, std::string>> assignments;
      findAssignments(m->moduleHead.get(), assignments);
      addAsserts(m->moduleHead.get(), assignments, 0);
    }
    if (flags.count("printtree"))
      dumpSyntaxTree(m->moduleHead.get());
    if (flags.count("visualisetree"))
      writeSyntaxTreeToDOT(m->moduleHead.get(),
                           m->moduleName->getElement() + ".dot");
    codeGen(m->moduleHead.get());
    std::cout << std::endl;
  }

  return 0;
}
