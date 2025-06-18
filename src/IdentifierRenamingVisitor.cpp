#include "IdentifierRenamingVisitor.h"
#include <iostream>
#include <set>

std::string last_id_name_created = "";

std::set<std::string> constant_names;
std::string curr_genvar;
bool prevAssign = false;
bool is_inside_loop = false;
std::string prevAssignId = "";

IdentifierRenamingVisitor::IdentifierRenamingVisitor(
    int modID, int packageID, std::unordered_map<std::string, Node *> &declMap,
    std::unordered_map<std::string, std::pair<Node *, PortDir>> &directionMap) {
  this->varID = directionMap.size() + 1;
  this->typeID = directionMap.size() + 1;

  this->moduleID = modID;
  this->packageID = packageID;
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

void IdentifierRenamingVisitor::defineStruct(std::shared_ptr<Var> var) {
  for (auto &v : structIds) {
    v->parent = var;
    identifiers.push_back(v);
  }

  structIds.clear();
}

Var IdentifierRenamingVisitor::addId(std::string t, bool isEscaped) {

  if (!contexts.empty() && contexts.top() == ContextType::DECL_STRUCT) {
    getNextIdAsStructIdentifier = true;
    auto id = std::make_shared<Var>(createNewID(t, isEscaped));

    structIds.push_back(id);
    return *id;
  }

  for (auto c = this->to_define.begin(); c != to_define.end(); c++) {

    if ((*c).get()->name == t) {

      to_define.erase(c);

      identifiers.push_back(*c);
      return *(*c);
    }
  }
  auto v = std::make_shared<Var>(createNewID(t, isEscaped));

  if (getNextIdAsStructIdentifier) {
    getNextIdAsStructIdentifier = false;
    defineStruct(v);
  }

  identifiers.push_back(v);
  return *v;
}

Var IdentifierRenamingVisitor::createNewID(std::string t, bool isEscaped) {
  Var v;
  if (t == "type") {
    v.name = "type_" + std::to_string(typeID++);
  } else if (t == "module") {
    v.name = " module_" + std::to_string(moduleID++);
  } else if (t == "PP") {
    v.name = " `pp_" + std::to_string(varID++) + " ";
  } else if (t == "package") {
    v.name = " package_" + std::to_string(packageID++);
  } else {
    if (isEscaped) {
      v.name = " \\id_" + std::to_string(varID++) + " ";
    } else {
      v.name = " id_" + std::to_string(varID++) + " ";
    }
  }
  v.type = t;

  if (debug)
    std::cerr << "ID name: " << v.name << " type: " << v.type << std::endl;

  v.dir = PortDir::NONE;
  if (is_inside_loop) {
    curr_genvar = v.name;
  }

  last_id_name_created = v.name;
  v.parent = nullptr;

  return v;
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

  if (!contexts.empty() && (contexts.top() == ContextType::ASSIGNMENT)) {
    contexts.pop();
    isAssign = true;
  }
  if (isAssign && is_inside_loop) {
    return curr_genvar;
  }

  std::vector<std::string> options;
  for (auto id = identifiers.rbegin(); id != identifiers.rend(); id++) {

    // constant variables can only be assigned to another constant variables
    // in its declaration
    if (!contexts.empty() && contexts.top() == ContextType::CONSTANT_EXPR &&
        (!constant_names.count((*id)->name) ||
         (*id)->name == last_id_name_created)) {
      continue;
    }

    if (((type == "" && (*id)->type != "module" && (*id)->type != "type" &&
          (*id)->type != "package") ||
         (*id)->type == type) &&
        ((isAssign && (*id)->dir != PortDir::INPUT) ||
         (isExpr && (*id)->dir != PortDir::OUTPUT) || (!isAssign && !isExpr))) {

      if (isAssign && constant_names.count((*id)->name)) {
        continue;
      }

      // constant variables can only be assigned to another constant variables
      // in its declaration
      if (!contexts.empty() && contexts.top() == ContextType::CONSTANT_EXPR &&
          (!constant_names.count((*id)->name) ||
           (*id)->name == last_id_name_created)) {
        continue;
      }
      if (isExpr && (*id)->name == last_id_name_created)
        continue;

      if (prevAssign && (*id)->name == prevAssignId) {
        prevAssign = false;
        prevAssignId = "";
        continue;
      }

      std::stack<std::string> stackName;
      auto curr = *id;
      stackName.push(curr->name);
      while (curr->parent) {
        stackName.push(curr->parent->name);
        curr = curr->parent;
      }
      std::string name = stackName.top();
      stackName.pop();
      while (!stackName.empty()) {
        name += "." + stackName.top();
        stackName.pop();
      }
      options.push_back(name);
    }
  }

  if (options.empty()) {
    auto id = addId(type);
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
      auto ne = addId(type);
      to_define.push_back(std::make_shared<Var>(ne));
      return ne.name;
    }
  }
  if (debug)
    std::cerr << "Using var: " << options[c] << std::endl;

  if (isAssign) {
    prevAssign = true;
    prevAssignId = options[c];
  }
  return options[c];
}

std::string IdentifierRenamingVisitor::placeID(
    std::string type,
    bool isEscaped) { // SymbolIdentifier, EscapedIdentifier
  if (debug)
    std::cerr << "Placing id" << std::endl;

  if (type == "PP") { // pre-processor TODO: map to enum
    auto id = addId("PP");
    auto name = id.name;
    name.erase(0, 2);
    return " " + name;
  }

  // TODO: implement a way to return types. The renaming phase was returning
  // non-declared IDs as types
  if (!contexts.empty() && contexts.top() == ContextType::TYPE) {
    return "";
  }

  if (!contexts.empty() && contexts.top() == ContextType::DEFINING_TYPE)
    return addId("type").name;

  if (!contexts.empty() && contexts.top() == ContextType::MODULE) {

    contexts.pop();
    createIDContext(ContextType::DECL);
    return addId("module").name;
  }
  if (!contexts.empty() && contexts.top() == ContextType::PACKAGE) {
    contexts.pop();
    createIDContext(ContextType::DECL);
    return addId("package").name;
  }
  if (!contexts.empty() && (contexts.top() == ContextType::DECL ||
                            contexts.top() == ContextType::DECL_CONSTANT ||
                            contexts.top() == ContextType::DECL_STRUCT)) {
    std::string t;

    auto id = addId(type, isEscaped);

    if (contexts.top() == ContextType::DECL_CONSTANT) {
      constant_names.insert(id.name);
    }

    return id.name;
  }

  return findID(type);
}

void IdentifierRenamingVisitor::visit(Terminal *node) {
  if (node->getElement() == " [ ") {
    createIDContext(ContextType::CONSTANT_EXPR);
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
  constant_names.clear();
  createIDContext(ContextType::MODULE);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Package_declaration *node) {
  createIDContext(ContextType::PACKAGE);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  node->getChildren()[4]->setElement("; endpackage ");
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Module_start *node) {
  createIDContext(ContextType::MODULE);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    if (child->getElement() == " program ") {
      this->module_or_interface_end = " endprogram ";
    } else {
      this->module_or_interface_end = " endmodule ";
    }
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Module_end *node) {
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    child->setElement(this->module_or_interface_end);
    this->applyVisit(child.get());
  }
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

  is_inside_loop = node->getParent()->type == NodeType::LOOP_GENERATE_CONSTRUCT;
  if (is_inside_loop) {
    createIDContext(ContextType::CONSTANT_EXPR);
  }

  if (!contexts.empty() && contexts.top() != ContextType::CONSTANT_EXPR) {
    createIDContext(ContextType::EXPR);
  }

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }

  if (!contexts.empty() && contexts.top() != ContextType::CONSTANT_EXPR) {
    finishIDContext();
  }
  if (is_inside_loop) {
    finishIDContext();
    is_inside_loop = false;
  }
}

void IdentifierRenamingVisitor::visit(Symbolidentifier *node) {

  if (!contexts.empty() && contexts.top() == ContextType::SCOPE) {
    node->setElement("SCOPE");
    return;
  } else if (!contexts.empty() &&
             contexts.top() == ContextType::SCOPE_ELEMENT) {
    node->setElement("SCOPE_ELEMENT");
    return;
  }

  if (!contexts.empty() && contexts.top() == ContextType::BLOCK) {
    node->setElement("BLOCK_" + std::to_string(blockID++));
    return;
  }

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
  createIDContext(ContextType::TYPE);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
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

// forces begin nodes to have a label
void IdentifierRenamingVisitor::visit(Label_opt *node) {
  if (node->getParent()->type == NodeType::BEGIN) {
    node->clearChildren();
    node->insertChildToEnd(std::make_unique<Terminal>(":"));
    auto label = std::make_unique<Symbol_or_label>("Symbol_or_label");
    auto genId = std::make_unique<Genericidentifier>("Genericidentifier");
    genId->insertChildToEnd(std::make_unique<Symbolidentifier>(
        "LABEL_" + std::to_string(labelID++)));

    label->insertChildToEnd(std::move(genId));

    node->insertChildToEnd(std::move(label));
  }
}

void IdentifierRenamingVisitor::visit(Function_declaration *node) {
  startNewScope();

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishScope();
}

void IdentifierRenamingVisitor::visit(Any_param_declaration *node) {
  createIDContext(ContextType::DECL_CONSTANT);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Parameter_expr *node) {
  createIDContext(ContextType::CONSTANT_EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Parameter_override *node) {
  createIDContext(ContextType::CONSTANT_EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Expression_in_parens *node) {
  createIDContext(ContextType::CONSTANT_EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Struct_data_type *node) {
  createIDContext(ContextType::DECL_STRUCT);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(
    Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node) {
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    if (child->getElement() == " void " &&
        node->getParent()->type != NodeType::FUNCTION_RETURN_TYPE_AND_ID) {
      child->setElement("");
    }
    this->applyVisit(child.get());
  }
}

void IdentifierRenamingVisitor::visit(Modport_declaration *node) {
  createIDContext(ContextType::EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Package_export_declaration *node) {
  createIDContext(ContextType::EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Package_import_declaration *node) {
  createIDContext(ContextType::EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Qualified_id *node) {
  int count = 0;
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    if (count == 0) {
      createIDContext(ContextType::SCOPE);
      this->applyVisit(child.get());
      finishIDContext();
    } else if (count == 2) {
      createIDContext(ContextType::SCOPE_ELEMENT);
      this->applyVisit(child.get());
      finishIDContext();
    }
    count += 1;
  }
}
void IdentifierRenamingVisitor::visit(Scope_prefix *node) {
  int count = 0;
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    if (count == 0) {
      createIDContext(ContextType::SCOPE);
      this->applyVisit(child.get());
      finishIDContext();
    }
    count += 1;
  }
}

void IdentifierRenamingVisitor::visit(Decl_variable_dimension *node) {
  createIDContext(ContextType::CONSTANT_EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Select_variable_dimension *node) {

  if (!contexts.empty() && (contexts.top() == ContextType::DECL ||
                            contexts.top() == ContextType::CONSTANT_EXPR)) {
    node->clearChildren();
    node->insertChildToEnd(std::make_unique<Terminal>(""));
    return;
  }
  createIDContext(ContextType::CONSTANT_EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Specify_path_identifiers *node) {
  createIDContext(ContextType::EXPR);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Type_identifier_followed_by_id *node) {
  createIDContext(ContextType::TYPE);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Type_declaration *node) {
  createIDContext(ContextType::DECL);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(Reference *node) {

  if (node->getParent()->type == NodeType::DEFPARAM_ASSIGN) {
    createIDContext(ContextType::DECL);
  }

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  if (node->getParent()->type == NodeType::DEFPARAM_ASSIGN) {
    finishIDContext();
  }
}

void IdentifierRenamingVisitor::visit(Block_identifier_opt *node) {
  createIDContext(ContextType::BLOCK);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}

void IdentifierRenamingVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable *node) {
  createIDContext(ContextType::DECL);
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
  finishIDContext();
}
