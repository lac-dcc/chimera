#ifndef CHIMERA_IDENTIFIER_RENAMING_H
#define CHIMERA_IDENTIFIER_RENAMING_H
#include "AST.h"
#include "Visitor.h"
#include <memory>
#include <stack>
#include <string>
#include <vector>

extern bool debug;

struct Var {
  std::string name;
  std::string type;
  PortDir dir;
};

/**
 * @class IdentifierRenamingVisitor
 * @brief Visitor for renaming identifiers in the AST.
 */
class IdentifierRenamingVisitor : public Visitor<void> {
public:
  enum ContextType {
    EXPR = 0,
    CONSTANT_EXPR,
    DECL,
    DECL_CONSTANT,
    MODULE,
    DEFINING_ID,
    DEFINING_TYPE,
    TYPE_DECL,
    ASSIGNMENT
  };

  std::vector<std::shared_ptr<Var>> to_define; // vars used but not declared

private:
  std::string defId = "";
  std::string defType = "";

  std::stack<ContextType> contexts;
  std::vector<std::shared_ptr<Var>> identifiers; // vars declared
  std::stack<std::size_t> scopeLimit;
  bool isStartingToken(std::string t);
  bool isFinishingToken(std::string t);
  void startNewScope();
  void finishScope();
  Var createNewID(std::string t, bool isEscaped = false);
  void createIDContext(ContextType t, bool force = false);
  void finishIDContext(bool force = false);
  std::string findID(std::string type);
  std::string placeID(std::string type, bool isEscaped = false);
  std::unordered_map<std::string, Node *> *declMap;
  std::unordered_map<std::string, std::unique_ptr<Var>> *typeMap;

public:
  int varID = 0;
  int moduleID = 0;
  int typeID = 0;
  int labelID = 0;

  IdentifierRenamingVisitor(
      int modID, std::unordered_map<std::string, Node *> &declMap,
      std::unordered_map<std::string, std::pair<Node *, PortDir>>
          &directionMap);

  virtual void visit(Terminal *node) override;

  virtual void visit(Module_or_interface_declaration *node) override;

  virtual void visit(Module_start *node) override;

  virtual void visit(Module_or_generate_item *node) override;

  virtual void visit(Lpvalue *node) override;

  virtual void visit(Expression *node) override;

  virtual void visit(Symbolidentifier *node) override;

  virtual void visit(Macroidentifier *node) override;

  virtual void visit(Escapedidentifier *node) override;

  virtual void visit(Systemtfidentifier *node) override;

  virtual void visit(Instantiation_type *node) override;

  virtual void visit(Decl_dimensions_opt *node) override;

  virtual void visit(Any_port_list_opt *node) override;

  virtual void visit(Delay_or_event_control_opt *node) override;

  virtual void visit(Net_declaration *node) override;

  virtual void visit(Net_type *node) override;

  virtual void visit(Port_expression_opt *node) override;

  virtual void visit(Tk_binbase *node) override;

  virtual void visit(Tk_decbase *node) override;

  virtual void visit(Tk_hexbase *node) override;

  virtual void visit(Pp_identifier *node) override;

  virtual void visit(Tk_octbase *node) override;

  virtual void visit(Udp_port_decls *node) override;

  virtual void visit(Label_opt *node) override;

  virtual void visit(Function_declaration *node) override;

  virtual void visit(Any_param_declaration *node) override;

  virtual void visit(Parameter_expr *node) override;

  virtual void visit(Parameter_override *node) override;
};
#endif
