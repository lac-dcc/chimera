#include "CodeGenVisitor.h"
#include "AST.h"
#include <iostream>

void CodeGenVisitor::visit(Tk_octdigits *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_octbase *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_virtual_opt *node) {
  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      this->applyVisit(child.get());
    }
  }
}

void CodeGenVisitor::visit(Symbolidentifier *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_unbasednumber *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Escapedidentifier *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Pp_identifier *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_decnumber *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_stringliteral *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_realtime *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_timeliteral *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_hexdigits *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_hexbase *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_binbase *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_edge_descriptor *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_reg_opt *node) {
  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      this->applyVisit(child.get());
    }
  }
}

void CodeGenVisitor::visit(Tk_bindigits *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_decbase *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Macronumericwidth *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_decdigits *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_xzdigits *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_rss_eq *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_rs_eq *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_tagged_opt *node) {
  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      this->applyVisit(child.get());
    }
  }
}

void CodeGenVisitor::visit(Systemtfidentifier *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Tk_ls_eq *node) {
  std::cout << node->getElement();
}

void CodeGenVisitor::visit(Terminal *node) {
  std::cout << node->getElement();
}
