# ChiGen source

This directory contains ChiGen's source code. The main file is `Chimera.cpp`,
which produces ChiGen's binary. The code in this file is responsible for
producing random Verilog syntax trees, and then calling appropriate passes which
will refine the synthesized tree and eventually produce Verilog source code.

## Syntax tree

The syntax tree structure that we adopt is based on
[Verible](https://github.com/chipsalliance/verible/tree/master)'s Verilog
grammar. Non-terminals and terminal symbols in Verible's grammar were translated
to nodes in our syntax tree.

All nodes in ChiGen's syntax tree are defined in `AST.h`. The `Node` class
defines the basic attributes and actions of a syntax tree, such as its children.
Nodes in the syntax tree are subclasses of `Node` and thus can use its public
interface. 

## Passes and Visitors

A **pass** is a traversal through ChiGen's syntax tree which applies some kind of
analysis, action or transformation. ChiGen passes are implemented using the
[Visitor design pattern](https://en.wikipedia.org/wiki/Visitor_pattern). The
basic structure of a visitor class is defined by the `Visitor` generic class in
`Visitor.h`. All ChiGen passes are subclasses of `Visitor`.

The `visit` method is used to define an operation for a given syntax tree node.
The `Visitor` allows you to define both a return type and an additional
parameter type for the `visit` method.

```cpp
template <typename R, typename T = void *> class Visitor {
  // ...
  virtual R visit(Node *node) {
    // ...
  }

  virtual R visit(Node *node, T arg) {
    // ...
  }
  // ...
};
```

### Implementing a pass

To implement your own ChiGen pass, you need to create a new class which is a
subclass of `Visitor`. You should then override the `visit` method for all
syntax tree nodes that are of interest to you. Note that `visit` has a default
implementation which may be reused. However, if the default implementation
doesn't fit your use case, you should override it.

```cpp
class MyVisitor : public Visitor<void> {
public:
  virtual void visit(Node *node) override;
  virtual void visit(Terminal *node) override;
  // ...
}
```

It's important to note that inside the `visit` method you should always call
`applyVisit` instead of `visit` when trying to visit children of the current
node. This is needed to redirect the call to the correct implementation of
`visit`, since C++ can't do dynamic dispatch.
