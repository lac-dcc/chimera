#include "IdentifierRenamingVisitor.h"
#include <iostream>

IdentifierRenamingVisitor::IdentifierRenamingVisitor(
    int modID, std::unordered_map<std::string, Node *> &declMap,
    std::unordered_map<std::string, std::pair<Node *, PortDir>> &directionMap) {
  this->varID = directionMap.size() + 1;
  this->typeID = directionMap.size() + 1;

  this->moduleID = modID;
  this->declMap = &declMap;

  if (debug)
    std::cerr << "varID: " << varID << std::endl;

  for (auto &c : directionMap) {
    Var var;
    var.name = std::move(c.first);
    var.type = "";
    var.dir = c.second.second;
    this->identifiers.push_back(std::make_shared<Var>(var));
  }
}

bool IdentifierRenamingVisitor::isStartingToken(std::string t) {
  return t == " begin " || t == " module ";
}

bool IdentifierRenamingVisitor::isFinishingToken(std::string t) {
  return t == " end " || t == " endmodule ";
}

void IdentifierRenamingVisitor::startNewScope() {
  scopeLimit.push(identifiers.size()); // start of new context
}

void IdentifierRenamingVisitor::finishScope() {
  if (debug)
    std::cerr << "finishing scope" << std::endl;
  if (!scopeLimit.empty()) {
    if (debug) {
      std::cerr << "scope not empty" << std::endl;
      std::cerr << "limit: " << scopeLimit.top()
                << "scope size: " << scopeLimit.size()
                << " size identifiers: " << identifiers.size() << std::endl;
    }

    while (identifiers.size() > scopeLimit.top()) {
      if (debug)
        std::cerr << "Removing: " << identifiers.back()->name << std::endl;
      identifiers.pop_back();
    }
    scopeLimit.pop();
  }
}

Var IdentifierRenamingVisitor::createNewID(std::string t,
                                           bool isEscaped = false) {
  Var v;
  for (auto c = this->to_define.begin(); c != to_define.end(); c++) {

    if ((*c).get()->name == t) {

      to_define.erase(c);

      identifiers.push_back(*c);
      return *(*c);
    }
  }
  if (t == "type") {
    v.name = "type_" + std::to_string(typeID++);
  } else if (t == "module") {
    v.name = " module_" + std::to_string(moduleID++);

  } else if (t == "PP") {
    v.name = " `pp_" + std::to_string(varID++) + " ";
  } else {
    if (isEscaped) {
      v.name = " \\id_" + std::to_string(varID++) + " ";
    } else {
      v.name = " id_" + std::to_string(varID++) + " ";
    }
  }
  if (debug)
    std::cerr << "Var name: " << v.name << std::endl;
  v.type = t;

  if (debug)
    std::cerr << "ID name: " << v.name << " type: " << v.type << std::endl;

  v.dir = PortDir::NONE;

  auto r = std::make_shared<Var>(v);
  identifiers.push_back(r);

  return *r.get();
}

void IdentifierRenamingVisitor::createIDContext(ContextType t, bool force) {
  if (contexts.empty() ||
      (contexts.top() != ContextType::DEFINING_ID || force)) {
    if (debug)
      std::cerr << "Creating context: " << t << std::endl;

    contexts.push(t);
  }
}

void IdentifierRenamingVisitor::finishIDContext(bool force) {
  if (contexts.empty())
    return;

  if (contexts.top() != ContextType::DEFINING_ID || force) {
    if (debug)
      std::cerr << "Removing Context" << std::endl;
    contexts.pop();
  }
}

std::string IdentifierRenamingVisitor::findID(std::string type) {
  if (debug) {
    if (!contexts.empty())
      std::cerr << "Context: " << contexts.top()
                << " Context Size: " << (int)contexts.size() << std::endl;
  }

  if (debug)
    std::cerr << "Trying to use previous created ID" << std::endl;

  auto isAssign = false;
  auto isExpr = !contexts.empty() && contexts.top() == ContextType::EXPR;

  if (!contexts.empty() && contexts.top() == ContextType::ASSIGNMENT) {
    contexts.pop();
    isAssign = true;
  }

  std::vector<std::string> options;
  for (auto id = identifiers.rbegin(); id != identifiers.rend(); id++) {

    if (((type == "" && (*id)->type != "module" && (*id)->type != "type") ||
         (*id)->type == type) &&
        ((isAssign && (*id)->dir != PortDir::INPUT) ||
         (isExpr && (*id)->dir != PortDir::OUTPUT) || (!isAssign && !isExpr))) {

      options.push_back((*id)->name);
    }
  }

  if (options.empty()) {
    auto id = createNewID(type);
    to_define.push_back(std::make_shared<Var>(id));

    return id.name;
  }

  auto c = rand() % options.size();

  if (!contexts.empty() && contexts.top() == ContextType::DEFINING_ID) {
    if (debug)
      std::cerr << "should not use: " << this->defId << "or " << this->defType
                << std::endl;
    if (options[c] == defId || options[c] == defType) {
      if (debug)
        std::cerr << "prev C: " << c;
      c = rand() % options.size();
      if (debug)
        std::cerr << "new C: " << c << std::endl;
    }

    if (options[c] == defId || options[c] == defType) {
      auto ne = createNewID(type);
      to_define.push_back(std::make_shared<Var>(ne));
      return ne.name;
    }
  }
  if (debug)
    std::cerr << "Using var: " << options[c] << std::endl;

  return options[c];
}

std::string IdentifierRenamingVisitor::placeID(
    std::string type,
    bool isEscaped = false) { // SymbolIdentifier, EscapedIdentifier
  if (debug)
    std::cerr << "Placing id" << std::endl;

  if (type == "PP") { // pre-processor TODO: map to enum
    auto id = createNewID("PP");
    auto name = id.name;
    name.erase(0, 2);
    return " " + name;
  }

  if (!contexts.empty() && contexts.top() == ContextType::DEFINING_TYPE)
    return createNewID("type").name;

  if (!contexts.empty() && contexts.top() == ContextType::MODULE) {

    contexts.pop();
    createIDContext(ContextType::DECL);
    return createNewID("module").name;
  }

  if (!contexts.empty() && contexts.top() == ContextType::DECL) {
    std::string t;

    auto id = createNewID(type, isEscaped);

    return id.name;
  }

  return findID(type);
}

void IdentifierRenamingVisitor::visit(Terminal *node) {
  if (node->getElement() == " [ ") {
    createIDContext(ContextType::EXPR);
  }

  if (node->getElement() == " ] ") {
    finishIDContext();
  } else if (node->getElement() == " <<`define-tokens>> ") {
    node->setElement("<<`define-tokens>>\n");
  } else if (isStartingToken(node->getElement())) {

    startNewScope();

  } else if (isFinishingToken(node->getElement())) {

    finishScope();
  }

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Module_or_interface_declaration *node) {
  createIDContext(ContextType::MODULE);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Module_start *node) {
  createIDContext(ContextType::MODULE);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Module_or_generate_item *node) {
  createIDContext(ContextType::DECL);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Lpvalue *node) {
  createIDContext(ContextType::EXPR);
  createIDContext(ContextType::ASSIGNMENT);

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }

  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Expression *node) {

  createIDContext(ContextType::EXPR);

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }

  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Symbolidentifier *node) {
  // discover possible type of symbol
  if (node->getElement() == " SymbolIdentifier ") {
    auto id = placeID("");

    if (!contexts.empty() && contexts.top() == ContextType::DECL) {
      (*this->declMap)[id] = node;
    }

    node->setElement(id);
  }

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Macroidentifier *node) {
  if (node->getElement() == " MacroIdentifier ")
    node->setElement(placeID(""));
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Escapedidentifier *node) {
  if (node->getElement() == " EscapedIdentifier ") {
    auto id = placeID("", true);

    if (!contexts.empty() && contexts.top() == ContextType::DECL) {
      (*this->declMap)[id] = node;
    }

    node->setElement(id);
  }

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Systemtfidentifier *node) {
  if (node->getElement() == " SystemtfIdentifier ")
    node->setElement(placeID(""));
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Instantiation_type *node) {
  createIDContext(ContextType::DEFINING_TYPE);

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Decl_dimensions_opt *node) {
  createIDContext(ContextType::DEFINING_ID);
  if (!identifiers.empty()) {

    this->defId = this->identifiers.back()->name;
    this->defType = this->identifiers.back()->type;
  }
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext(true);
}

void IdentifierRenamingVisitor::visit(Any_port_list_opt *node) {
  createIDContext(ContextType::DEFINING_ID);
  if (!identifiers.empty()) {
    this->defId = this->identifiers.back()->name;
    this->defType = this->identifiers.back()->type;
  }

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext(true);
}

void IdentifierRenamingVisitor::visit(Delay_or_event_control_opt *node) {
  createIDContext(ContextType::EXPR);

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext(true);
}

void IdentifierRenamingVisitor::visit(Net_declaration *node) {
  createIDContext(ContextType::DECL);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Net_type *node) {
  contexts.push(ContextType::TYPE_DECL);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  contexts.pop();
}

void IdentifierRenamingVisitor::visit(Port_expression_opt *node) {
  createIDContext(ContextType::DEFINING_ID);
  if (!identifiers.empty()) {
    this->defId = this->identifiers.back()->name;
    this->defType = this->identifiers.back()->type;
  }

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext(true);
}

void IdentifierRenamingVisitor::visit(Tk_binbase *node) {
  node->setElement("'b");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Tk_decbase *node) {
  node->setElement("'d");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Tk_hexbase *node) {
  node->setElement("'h");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Pp_identifier *node) {
  node->setElement(placeID("PP"));
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Tk_octbase *node) {
  node->setElement("'o");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Udp_port_decls *node) {
  createIDContext(ContextType::DECL);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}
