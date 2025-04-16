#include "ConstantsReplacerVisitor.h"

void ReplaceConstantsVisitor::visit(Terminal *node) {
  if (node->getElement() == " <<`define-tokens>> ") { // fix timescale_unit
    node->setElement(" 0\n");
  } else if (node->getElement() == " (timescale_unit) ") {
    node->setElement(" ps\n");
  } else if (node->getElement() == " <<default-text>> ") {
    node->setElement(" \"\" \n");
  }

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_decnumber *node) {
  std::vector<std::string> options = {" -1 ", " 1 "};
  node->setElement(options[rand() % options.size()]);

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_realtime *node) {
  auto el = node->getParent()->type == NodeType::EXPR_PRIMARY_NO_GROUPS ? std::to_string(rand()%100) : "$realtime";
  node->setElement(el);

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_timeliteral *node) {
  node->setElement("1ps");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_unbasednumber *node) {
  node->setElement("'0");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_binbase *node) {
  node->setElement("'b");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_bindigits *node) {
  node->setElement("0");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Macronumericwidth *node) {
  node->setElement(" 1");
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_decbase *node) {
  node->setElement("'d");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_decdigits *node) {
  node->setElement("0");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_xzdigits *node) {
  std::vector<std::string> digits = {"'x", "'Z", "'?"};
  node->setElement(digits[rand() % digits.size()]);

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_hexbase *node) {
  node->setElement("'h");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_ls_eq *node) {
  node->setElement("<<=");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_hexdigits *node) {
  node->setElement("0");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_stringliteral *node) {
  node->setElement("\"\"");
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_evalstringliteral *node) {
  node->setElement("`\"`hello`\"");
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_octbase *node) {
  node->setElement("'o");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}

void ReplaceConstantsVisitor::visit(Tk_octdigits *node) {
  node->setElement("0");

  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    this->applyVisit(child.get());
  }
}
