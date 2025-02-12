#ifndef CHIMERA_DOT_GEN_VISITOR_H
#define CHIMERA_DOT_GEN_VISITOR_H
#include "AST.h"
#include "Visitor.h"

class DotNode {
  public:
    std::string name;
    std::string label;
};

/**
 * @class DOTGenVisitor
 * @brief Visitor for generating DOT representation from the AST.
 */
class DOTGenVisitor : public Visitor<DotNode> {
private:
  std::string dotSrc;
  std::vector<DotNode> nonTerminals, terminals;
  std::vector<std::string> edges;

  int nodeCounter = 0;
  std::string generateNodeName();
public:
  virtual void writeToFile(const std::string &fileName);
  virtual std::string generateDOT();
  virtual DotNode visit(Node *node) override;
};
#endif
