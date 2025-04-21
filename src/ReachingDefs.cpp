#include "ReachingDefs.h"

void ReachingDefsVisitor::defaultVisitor(Node *node) {
  for (auto &c : node->getChildren()) {
    applyVisit(c.get());
  }
};

// should be called by label_opt node
// returns the label string referent to that label node
static std::string getLabel(Node *head) {
  if (head->type != NodeType::LABEL_OPT)
    return NULL;

  return head->getChildren()[1]
      ->getChildren()[0]
      ->getChildren()[0]
      ->getElement(); // label_opt -> symbol_or_label -> GenericIdentifier ->
                      // value
}

static std::string getScope(std::vector<std::string> &labelContext) {
  std::string scope = "";

  for (auto const &s : labelContext) {
    scope += s + ".";
  }
  return scope;
}

void ReachingDefsVisitor::startNewScope() {
  scopeLimit.push(identifiersInScope.size());
}

void ReachingDefsVisitor::finishScope() {
  while (!scopeLimit.empty() && identifiersInScope.size() > scopeLimit.top()) {

    identifiersInScope.pop_back();
  }

  if (!scopeLimit.empty())
    scopeLimit.pop();
}

void ReachingDefsVisitor::visit(Terminal *node) {
  defaultVisitor(node);
}

void ReachingDefsVisitor::visit(Module_item *node) {
  defaultVisitor(node);
  ProgramPoint pp;
  pp.programPoint = node;
  pp.defs = std::set<std::string>(identifiersInScope.begin(),
                                  identifiersInScope.end());

  pp.scope = getScope(labelContext);

  programPoints.push_back(std::move(pp));
};

void ReachingDefsVisitor::visit(Genericidentifier *node) {
  if (node->getChildren()[0]->type != NodeType::KEYWORDIDENTIFIER &&
      node->getChildren()[0]->getElement().find("id") != std::string::npos &&
      node->getChildren()[0]->getElement().size() > 2 &&
      node->getChildren()[0]->getElement()[1] !=
          '_') { //"_" means excluded identifier
    identifiersInScope.push_back(node->getChildren()[0]->getElement());
  }
}
void ReachingDefsVisitor::visit(Label_opt *node) {
  if (node->getChildren().size() > 1) {
    labelContext.push_back(getLabel(node));
  }
};

void ReachingDefsVisitor::visit(Any_port_list_opt *) {};

void ReachingDefsVisitor::visit(Udp_port_decls *node) {
  context.push(IdentifierRenamingVisitor::ContextType::DECL);
  defaultVisitor(node);
  context.pop();
};

void ReachingDefsVisitor::visit(Expression *) {};

void ReachingDefsVisitor::visit(Function_declaration *node) {
  startNewScope();
  defaultVisitor(node);
  finishScope();
};

void ReachingDefsVisitor::visit(End *) {
  finishScope();
  labelContext.pop_back();
};

void ReachingDefsVisitor::visit(Net_declaration *node) {
  context.push(IdentifierRenamingVisitor::ContextType::DECL);
  defaultVisitor(node);
  context.pop();
};