#ifndef CHIMERA_CODE_GEN_H
#define CHIMERA_CODE_GEN_H

#include "AST.h"
#include "Visitor.h"

/**
 * @brief This class is a visitor that traverses the abstract syntax tree (AST)
 * representing the source code. It defines virtual member functions for each
 * type of node in the AST, allowing subclasses to implement specific actions
 * for each node type.
 *
 * The visitor pattern is used to decouple the traversal logic from the actual
 * node implementations. This makes it easier to add new node types or modify
 * the traversal behavior without affecting the underlying AST structure.
 */
class CodeGenVisitor : public Visitor<void> {
public:
  virtual void visit(Tk_octdigits *node) override;

  virtual void visit(Tk_octbase *node) override;

  virtual void visit(Tk_virtual_opt *node) override;

  virtual void visit(Symbolidentifier *node) override;

  virtual void visit(Tk_unbasednumber *node) override;

  virtual void visit(Escapedidentifier *node) override;

  virtual void visit(Pp_identifier *node) override;

  virtual void visit(Tk_decnumber *node) override;

  virtual void visit(Tk_stringliteral *node) override;

  virtual void visit(Tk_realtime *node) override;

  virtual void visit(Tk_timeliteral *node) override;

  virtual void visit(Tk_hexdigits *node) override;

  virtual void visit(Tk_hexbase *node) override;

  virtual void visit(Tk_binbase *node) override;

  virtual void visit(Tk_edge_descriptor *node) override;

  virtual void visit(Tk_reg_opt *node) override;

  virtual void visit(Tk_bindigits *node) override;

  virtual void visit(Tk_decbase *node) override;

  virtual void visit(Macronumericwidth *node) override;

  virtual void visit(Tk_decdigits *node) override;

  virtual void visit(Tk_xzdigits *node) override;

  virtual void visit(Tk_rss_eq *node) override;

  virtual void visit(Tk_rs_eq *node) override;

  virtual void visit(Tk_tagged_opt *node) override;

  virtual void visit(Systemtfidentifier *node) override;

  virtual void visit(Tk_ls_eq *node) override;

  virtual void visit(Terminal *node) override;
};

#endif
