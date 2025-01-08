#ifndef CHIMERA_CONSTANTS_REPLACER_H
#define CHIMERA_CONSTANTS_REPLACER_H
#include "AST.h"
#include "Visitor.h"

/**
 * @class ReplaceConstantsVisitor
 * @brief Visitor for replacing constants in the AST.
 */
class ReplaceConstantsVisitor : public Visitor<void> {
public:
  virtual void visit(Terminal *node) override;

  virtual void visit(Tk_decnumber *node) override;

  virtual void visit(Tk_realtime *node) override;

  virtual void visit(Tk_timeliteral *node) override;

  virtual void visit(Tk_unbasednumber *node) override;

  virtual void visit(Tk_binbase *node) override;

  virtual void visit(Tk_bindigits *node) override;

  virtual void visit(Macronumericwidth *node) override;

  virtual void visit(Tk_ls_eq *node) override;

  virtual void visit(Tk_decbase *node) override;

  virtual void visit(Tk_decdigits *node) override;

  virtual void visit(Tk_xzdigits *node) override;

  virtual void visit(Tk_hexbase *node) override;

  virtual void visit(Tk_hexdigits *node) override;

  virtual void visit(Tk_stringliteral *node) override;

  virtual void visit(Tk_evalstringliteral *node) override;

  virtual void visit(Tk_octbase *node) override;

  virtual void visit(Tk_octdigits *node) override;
};
#endif
