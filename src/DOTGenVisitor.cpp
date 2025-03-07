#include "DOTGenVisitor.h"
#include <fstream>
#include <iostream>

std::string DOTGenVisitor::generateNodeName() {
  return "n_" + std::to_string(this->nodeCounter++);
}

DotNode DOTGenVisitor::visit(Node *node) {
  if (node->getChildren().empty()) {
    auto nodeName = this->generateNodeName();
    DotNode dotNode;
    dotNode.name = nodeName;
    dotNode.label =
        (node->getElement().empty() ? "_empty" : node->getElement());
    this->terminals.push_back(dotNode);
    return dotNode;
  } else {
    auto nodeName = this->generateNodeName();
    DotNode dotNode;
    dotNode.name = nodeName;
    dotNode.label = node->getElement();
    this->nonTerminals.push_back(dotNode);
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      auto childNode = this->visit(child.get());
      this->edges.push_back(dotNode.name + " -> " + childNode.name);
    }
    return dotNode;
  }
}

std::string DOTGenVisitor::generateDOT() {
  std::string dotSrc = "digraph G {\n";
  dotSrc += "\tnode [shape=circle];\n";
  dotSrc += "\tedge [color=\"#333333\"];\n\n";

  if (!this->nonTerminals.empty()) {
    for (size_t i = 0; i < this->nonTerminals.size() - 1; i++) {
      dotSrc += "\t" + this->nonTerminals[i].name + "[label=\"" +
                this->nonTerminals[i].label + "\"];\n";
    }
    auto lastIndex = this->nonTerminals.size() - 1;
    dotSrc += "\t" + this->nonTerminals[lastIndex].name + "[label=\"" +
              this->nonTerminals[lastIndex].label + "\"];\n";
  }

  if (!this->terminals.empty()) {
    for (size_t i = 0; i < this->terminals.size() - 1; i++) {
      dotSrc += "\t" + this->terminals[i].name + "[label=\"" +
                this->terminals[i].label + "\"];\n";
    }
    auto lastIndex = this->terminals.size() - 1;
    dotSrc += "\t" + this->terminals[lastIndex].name + "[label=\"" +
              this->terminals[lastIndex].label + "\"];\n";
  }

  for (const std::string &edge : this->edges) {
    dotSrc += "\t" + edge + ";\n";
  }
  dotSrc += "}\n";
  return dotSrc;
}

void DOTGenVisitor::writeToFile(const std::string &fileName) {
  std::ofstream file(fileName);
  if (file.is_open()) {
    file << this->generateDOT();
    file.close();
  } else {
    std::cerr << "Error: Unable to open file for writing DOT: " << fileName
              << std::endl;
  }
}