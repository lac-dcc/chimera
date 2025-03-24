#ifndef CHIMERA_REACHING_DEFS_H
#define CHIMERA_REACHING_DEFS_H

#include "AST.h"
#include "IdentifierRenamingVisitor.h"
#include "TypeInference.h"
#include "Visitor.h"
#include <set>
#include <stack>
#include <vector>

class ProgramPoint {
public:
  Node *programPoint;
  std::set<std::string> defs;
  std::string scope = "";
};

class Module {
public:
  std::shared_ptr<Node> moduleHead;
  Node *moduleName;
  std::unordered_map<std::string, std::pair<Node *, PortDir>> directionMap;
  std::vector<std::pair<std::string, PortDir>> portList;
  std::vector<ProgramPoint> programPoints;
  std::unordered_map<std::string, CanonicalTypes> idToType;
  bool isSelected = false;
};

/**
 * @class ReachingDefsVisitor
 * @brief Visitor for Reaching Definitions analysis.
 */
class ReachingDefsVisitor : public Visitor<void> {
public:
  std::vector<std::string> identifiersInScope;
  std::stack<size_t> scopeLimit;
  std::vector<ProgramPoint> &programPoints;
  std::stack<IdentifierRenamingVisitor::ContextType> context;
  std::vector<std::string> labelContext;

  ReachingDefsVisitor(std::vector<ProgramPoint> &PP) : programPoints(PP) {
    programPoints.clear();
  }
  void startNewScope();
  void finishScope();

  void defaultVisitor(Node *node);

  virtual void visit(Terminal *node) override;

  virtual void visit(Genericidentifier *node) override;

  virtual void visit(Any_port_list_opt *node) override;

  virtual void visit(Udp_port_decls *node) override;

  virtual void visit(Expression *node) override;

  virtual void visit(Function_declaration *node) override;

  virtual void visit(End *node) override;

  virtual void visit(Net_declaration *node) override;

  virtual void visit(Module_item *node) override;

  virtual void visit(Label_opt *node) override;
};

#endif