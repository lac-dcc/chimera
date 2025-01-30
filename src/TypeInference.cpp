#include "TypeInference.h"
#include <iostream>

static bool isCanonicalType(typeId type) {
  return type < static_cast<typeId>(CanonicalTypes::FIRST_FRESH_TYPE);
}

static void canonicalize(equivalenceMap &eq) {
  for (auto &[_, eqClass] : eq) {
    for (auto it = eqClass.begin(), end = eqClass.end(); it != end;) {
      if (!isCanonicalType(*it)) {
        it = eqClass.erase(it);
      } else {
        ++it;
      }
    }
  }
}

static void unify(constraintVector &constraints, equivalenceMap &eq) {
  for (auto &[type0, type1] : constraints) {
    if (type0 == type1)
      continue;

    auto &constraints0 = eq[type0];
    auto &constraints1 = eq[type1];

    std::unordered_set<typeId> newSet(constraints0.begin(), constraints0.end());
    newSet.insert(constraints1.begin(), constraints1.end());
    newSet.insert(type0);
    newSet.insert(type1);

    for (auto &type : newSet) {
      if (type >= static_cast<typeId>(CanonicalTypes::FIRST_FRESH_TYPE)) {
        eq[type].insert(newSet.begin(), newSet.end());
      }
    }
  }
}

void printTypeInferenceDebug(equivalenceMap &eq,
                             TypeInferenceVisitor &visitor) {
  if (!debug) {
    return;
  }
  for (const auto &[type, eqTypes] : eq) {
    std::cerr << type;
    if (visitor.typeIdToIdMap.find(type) != visitor.typeIdToIdMap.end()) {
      std::cerr << " (" << visitor.typeIdToIdMap.at(type) << ")";
    }

    std::cerr << ": { ";
    for (const auto &otherType : eqTypes) {
      std::cerr << otherType << " ";
    }
    std::cerr << "}\n";
  }
}

void unifyScalarOperations(std::unordered_set<typeId> &eqTypes) {
  if (eqTypes.count(static_cast<typeId>(CanonicalTypes::SCALAR)) &&
      eqTypes.count(static_cast<typeId>(CanonicalTypes::REG))) {
    eqTypes.erase(static_cast<typeId>(CanonicalTypes::SCALAR));
  }

  if (eqTypes.count(static_cast<typeId>(CanonicalTypes::SCALAR)) &&
      eqTypes.count(static_cast<typeId>(CanonicalTypes::WIRE))) {
    eqTypes.erase(static_cast<typeId>(CanonicalTypes::SCALAR));
  }
  if (eqTypes.count(static_cast<typeId>(CanonicalTypes::REG)) &&
      eqTypes.count(static_cast<typeId>(CanonicalTypes::WIRE))) {

    eqTypes.erase(static_cast<typeId>(CanonicalTypes::REG));
    eqTypes.erase(static_cast<typeId>(CanonicalTypes::WIRE));
    eqTypes.insert(static_cast<typeId>(CanonicalTypes::LOGIC));
  }
}

std::string getType(CanonicalTypes t) {
  std::vector<std::string> wireEquivalents = {
      " wire ",    " tri ", " tri0 ", " tri1 ", " supply0 ",
      " supply1 ", " wor ", " wand ", " uwire "};

  std::vector<std::string> integerEquivalents = {
      " integer ", " int ", " shortint ", " longint ", " byte ", " time ",
  };

  std::vector<std::string> realEquivalents = {" real ", " shortreal ",
                                              " realtime "};

  // bit is equivalent to reg (both are used in procedural assignments)
  std::vector<std::string> regEquivalents = {" reg ", " bit "};

  std::string idType = "";
  switch (t) {

  case CanonicalTypes::VECTOR:
    idType = " logic [7:0] ";
    break;
  case CanonicalTypes::WIRE:
    // selecting a random net_type
    idType = wireEquivalents[rand() % wireEquivalents.size()];
    break;
  case CanonicalTypes::BIT:
    idType = " bit ";
    break;
  case CanonicalTypes::SCALAR:
  case CanonicalTypes::CONST_SCALAR:
    idType = wireEquivalents[rand() % wireEquivalents.size()];
    break;
  case CanonicalTypes::LOGIC:
    idType = " logic ";
    break;

  case CanonicalTypes::FLOAT_SCALAR:
    idType = realEquivalents[rand() % realEquivalents.size()];
    break;

  case CanonicalTypes::STRING:
    idType = " string ";
    break;

  case CanonicalTypes::GATE:
  case CanonicalTypes::ANONYMOUS_GATE:

    break;
  case CanonicalTypes::REG:
    idType = regEquivalents[rand() % regEquivalents.size()];
    break;
  case CanonicalTypes::INTEGER:
    idType = integerEquivalents[rand() % integerEquivalents.size()];
    break;
  default:
    idType = " wire ";
    break;
  }

  return idType;
}

bool inferTypes(Node *head,
                std::unordered_map<std::string, CanonicalTypes> &idToType) {
  TypeInferenceVisitor visitor;
  auto constraints = visitor.applyVisit(head, visitor.freshType());
  constraintVector constraintVec(constraints.begin(), constraints.end());
  std::set<typeId> addedIds;
  equivalenceMap eq;
  unify(constraintVec, eq);
  canonicalize(eq);

  // replace infered types

  bool isCorrect = true;
  printTypeInferenceDebug(eq, visitor);

  for (auto &[type, eqTypes] : eq) {

    unifyScalarOperations(eqTypes);
    auto isType =
        visitor.typeIdToIdMap.find(type) != visitor.typeIdToIdMap.end() &&
        visitor.typeIdToIdMap.at(type).find("type") != std::string::npos;

    auto isId =
        visitor.typeIdToIdMap.find(type) != visitor.typeIdToIdMap.end() &&
        visitor.typeIdToIdMap.at(type).find("id") != std::string::npos;

    if ((isType || isId) && eqTypes.size() > 1) {
      isCorrect = false;
    }

    if (isId) {
      auto id = visitor.typeIdToIdMap.at(type);
      auto idType =
          (eqTypes.empty())
              ? CanonicalTypes::DEFAULT_TYPE
              : static_cast<CanonicalTypes>(*std::next(eqTypes.begin(), 0));

      idToType[id] = idType;
    }

    if (isType) { // means it is a type_X identifier
      auto id = visitor.typeIdToIdMap.at(type);

      if (!eqTypes.empty()) {
        auto t = static_cast<CanonicalTypes>(*std::next(eqTypes.begin(), 0));
        idToType[id] = t;
        if (visitor.varMap.find(id) != visitor.varMap.end()) {
          auto n = visitor.varMap.at(id);

          auto idType = getType(t);

          n->setElement(idType);
        }
      } else if (visitor.varMap.find(id) != visitor.varMap.end()) {
        auto n = visitor.varMap.at(id);
        n->setElement(" wire ");
      }
    }
  }

  return isCorrect;
}

typeId TypeInferenceVisitor::freshType() {
  if (this->typeCounter == UINT64_MAX) {
    std::cerr << "Too many types\n";
    exit(1);
  }

  return this->typeCounter++;
}

constraintSet TypeInferenceVisitor::defaultVisitor(Node *node, typeId type) {
  constraintSet d = {{}};
  for (auto &c : node->getChildren()) {
    auto d1 = applyVisit(c.get(), type);
    d.insert(d1.begin(), d1.end());
  }
  return d;
}

void TypeInferenceVisitor::addToMap(typeId t, const std::string &id) {

  this->typeIdToIdMap[t] = id;
  this->idToTypeIdMap[id] = t;
}

constraintSet TypeInferenceVisitor::identifierVisitor(Node *node, typeId type) {
  constraintSet d;
  typeId t;
  if (idToTypeIdMap.find(node->getElement()) != idToTypeIdMap.end()) {
    t = idToTypeIdMap[node->getElement()];
  } else {
    t = freshType();
    addToMap(t, node->getElement());
  }
  varMap[node->getElement()] = node;

  d.insert({t, type});

  return d;
}

constraintSet TypeInferenceVisitor::binaryExpr(Node *lhs, Node *rhs,
                                               typeId operandType,
                                               typeId exprType,
                                               typeId actualType) {
  auto constraintsLhs = applyVisit(lhs, operandType);
  auto constraintsRhs = applyVisit(rhs, operandType);
  constraintsLhs.insert(constraintsRhs.begin(), constraintsRhs.end());

  constraintsLhs.insert({exprType, actualType});

  return constraintsLhs;
}

constraintSet TypeInferenceVisitor::visit(Node *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Terminal *node, typeId type) {
  if (node->getElement().find("type") != std::string::npos) {
    constraintSet d;
    auto t = freshType();

    addToMap(t, node->getElement());
    varMap[node->getElement()] = node;

    d.insert({t, type});

    return d;
  }

  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_delay_range_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Port *node, typeId) {
  auto t = freshType();

  constraintSet constraintsPortExpression;
  constraintSet constraintsTrailingAssignOpt;
  if (node->getChildren().size() == 2) {
    constraintsPortExpression = applyVisit(node->getChildren()[0].get(), t);
    constraintsTrailingAssignOpt = applyVisit(node->getChildren()[1].get(), t);
    constraintsPortExpression.insert(constraintsTrailingAssignOpt.begin(),
                                     constraintsTrailingAssignOpt.end());
    return constraintsPortExpression;
  } else {
    return applyVisit(node->getChildren()[3].get(), t);
  }
}

constraintSet TypeInferenceVisitor::visit(Specify_simple_path *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Event_control *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(String_literal *node, typeId type) {
  auto literal = defaultVisitor(node, type);
  literal.insert({{type, static_cast<typeId>(CanonicalTypes::STRING)}});

  return literal;
}

constraintSet TypeInferenceVisitor::visit(Charge_strength_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Dpi_import_export *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(For_initialization_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(List_of_port_identifiers *node,
                                          typeId type) {
  if (node->getChildren().size() > 1) {
    if (node->getChildren()[1]->getElement() == " = ") {
      auto constraintsGenericIdentifier =
          applyVisit(node->getChildren()[0].get(), type);
      auto constraintsExpression =
          applyVisit(node->getChildren()[2].get(), type);

      constraintsGenericIdentifier.insert(constraintsExpression.begin(),
                                          constraintsExpression.end());

      return constraintsGenericIdentifier;
    } else {
      auto constraintsListOfPortIdentifiers =
          applyVisit(node->getChildren()[1].get(), type);
      auto constraintsGenericIdentifier =
          applyVisit(node->getChildren()[2].get(), type);

      constraintsListOfPortIdentifiers.insert(
          constraintsGenericIdentifier.begin(),
          constraintsGenericIdentifier.end());

      return constraintsListOfPortIdentifiers;
    }
  } else {
    return applyVisit(node->getChildren()[0].get(), type);
  }
}

constraintSet TypeInferenceVisitor::visit(Non_integer_type *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::FLOAT_SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Parameter_value_ranges_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_item_no_pp *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_delay_repetition_list *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Add_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Dpi_import_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_realtime *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Case_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Property_if_else_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet
TypeInferenceVisitor::visit(Non_anonymous_instantiation_base *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Unary_expr *node, typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Unary_op *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_id *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Reference *node, typeId type) {

  if (node->getChildren().size() == 2) {
    if (node->getChildren()[1]->type == NodeType::SELECT_VARIABLE_DIMENSION) {
      return defaultVisitor(node, static_cast<typeId>(CanonicalTypes::VECTOR));
    }
  }

  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Cast *node, typeId) {
  auto t = freshType();
  auto t1 = freshType();
  auto constraintsCast = applyVisit(node->getChildren()[0].get(), t);
  auto constraintsExp = applyVisit(node->getChildren()[3].get(), t1);

  constraintsCast.insert(constraintsExp.begin(), constraintsExp.end());
  return constraintsCast;
}

constraintSet TypeInferenceVisitor::visit(Tf_variable_identifier_first *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt *node,
    typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Type_or_id_root *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_or_generate_item *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Module_parameter_port_list_trailing_comma *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Instantiation_type *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Parameters *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Reference_or_call_base *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Param_type_followed_by_id_and_dimensions_opt *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Structure_or_array_pattern_key *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Parameter_assign_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Defparam_assign_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Generate_item_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_octdigits *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_expr_primary *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Lpvalue *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Label_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Escapedidentifier *node,
                                          typeId type) {
  return identifierVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Generate_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Data_type_primitive *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Spec_reference_event *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_input_declaration_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Non_port_module_item *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    List_of_ports_or_port_declarations_trailing_comma_non_ansi *node,
    typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port_list_opt *node,
                                          typeId) {
  return defaultVisitor(node,
                        static_cast<typeId>(CanonicalTypes::CONST_SCALAR));
}

constraintSet TypeInferenceVisitor::visit(Property_prefix_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Expr_primary_braces *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Pow_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(For_init_decl_or_assign *node,
                                          typeId type) {
  if (node->getChildren().size() == 3) {
    auto constraintsLpValue = applyVisit(node->getChildren()[0].get(), type);
    auto constraintsExp = applyVisit(node->getChildren()[2].get(), type);

    constraintsLpValue.insert(constraintsExp.begin(), constraintsExp.end());

    return constraintsLpValue;
  } else {
    auto constraintsGenId = applyVisit(node->getChildren()[1].get(), type);
    auto constraintsExp = applyVisit(node->getChildren()[3].get(), type);

    constraintsGenId.insert(constraintsExp.begin(), constraintsExp.end());

    return constraintsGenId;
  }
}

constraintSet TypeInferenceVisitor::visit(Udp_initial *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tf_port_list_paren_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Struct_data_type *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_sequ_entry *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Net_variable_or_decl_assign *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Parameter_value_byname_list_trailing_comma *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Inc_or_dec_expression *node, typeId) {
  const auto &children = node->getChildren();
  auto operandType = static_cast<typeId>(CanonicalTypes::SCALAR);
  if (children[0].get()->type == NodeType::TERMINAL) {
    return applyVisit(children[1].get(), operandType);
  }

  return applyVisit(children[0].get(), operandType);
}

constraintSet TypeInferenceVisitor::visit(Net_type *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Select_dimensions_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Spec_polarity *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Macro_formal_parameter *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Structure_or_array_pattern_expression *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(For_step *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specparam_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_binbase *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Tk_stringliteral *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::STRING);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Var_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Identifier_optional_unpacked_dimensions *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Function_item_list *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Type_declaration *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_body *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Mul_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Par_block *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Keywordidentifier *node,
                                          typeId type) {
  return identifierVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Logeq_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Module_common_item *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Primitive_gate_instance *node,
                                          typeId type) {
  auto t = freshType();

  if (node->getChildren().size() == 3) {
    auto x = static_cast<typeId>(CanonicalTypes::ANONYMOUS_GATE);
    auto constraintsAnyPortList = applyVisit(node->getChildren()[1].get(), t);
    constraintsAnyPortList.insert({type, x});

    return constraintsAnyPortList;
  } else {
    auto x = static_cast<typeId>(CanonicalTypes::GATE);
    auto y = static_cast<typeId>(CanonicalTypes::SCALAR);
    auto constraintsGenericIdentifier =
        applyVisit(node->getChildren()[0].get(), x);
    auto constraintsDeclDimensions =
        applyVisit(node->getChildren()[1].get(), y);
    auto constraintsAnyPortList = applyVisit(node->getChildren()[3].get(), t);

    constraintsGenericIdentifier.insert(constraintsDeclDimensions.begin(),
                                        constraintsDeclDimensions.end());
    constraintsGenericIdentifier.insert(constraintsAnyPortList.begin(),
                                        constraintsAnyPortList.end());

    return constraintsGenericIdentifier;
  }
}

constraintSet TypeInferenceVisitor::visit(Data_type_or_implicit *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_octbase *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_expr *node, typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Tk_hexbase *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Property_expr *node, typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Seq_block *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Task_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node,
    typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specify_block *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_decnumber *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);

  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Tk_decbase *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Property_implication_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Bit_logic_opt *node, typeId) {
  return defaultVisitor(node, static_cast<typeId>(CanonicalTypes::BIT));
}

constraintSet TypeInferenceVisitor::visit(Integer_atom_type *node, typeId) {
  return defaultVisitor(node, static_cast<typeId>(CanonicalTypes::INTEGER));
}

constraintSet TypeInferenceVisitor::visit(Lifetime *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Any_argument_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Delay_value_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_port_declaration *node,
                                          typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Jump_statement *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Delay_value *node, typeId type) {
  auto constraintsExpression1 = applyVisit(node->getChildren()[0].get(), type);

  if (node->getChildren().size() > 1) {
    auto cE2 = applyVisit(node->getChildren()[2].get(), type);
    auto cE3 = applyVisit(node->getChildren()[4].get(), type);
    constraintsExpression1.insert(cE2.begin(), cE2.end());
    constraintsExpression1.insert(cE3.begin(), cE3.end());
  }

  return constraintsExpression1;
}

constraintSet TypeInferenceVisitor::visit(Sequence_or_expr *node, typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Module_attribute_foreign_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tf_port_direction_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tf_port_item_expr_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Cont_assign_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Any_argument_list_trailing_comma *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Procedural_continuous_assignment *node, typeId) {
  typeId type = static_cast<typeId>(CanonicalTypes::REG);

  auto constraintsLpValue = applyVisit(node->getChildren()[0].get(), type);

  if (node->getChildren().size() == 5) {
    auto constraintsExpression = applyVisit(node->getChildren()[3].get(), type);
    constraintsLpValue.insert(constraintsExpression.begin(),
                              constraintsExpression.end());
  }

  return constraintsLpValue;
}

constraintSet TypeInferenceVisitor::visit(Expression_or_dist *node,
                                          typeId type) {
  const auto &children = node->getChildren();
  auto constraintsExpression = applyVisit(children[0].get(), type);
  auto constraintsDistOpt = applyVisit(children[1].get(), type);

  constraintsExpression.insert(constraintsDistOpt.begin(),
                               constraintsDistOpt.end());

  return constraintsExpression;
}

constraintSet TypeInferenceVisitor::visit(Module_start *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expr_primary_parens *node,
                                          typeId type) {
  const auto &children = node->getChildren();
  return applyVisit(children[1].get(), type);
}

constraintSet TypeInferenceVisitor::visit(Open_range_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Unary_prefix_expr *node,
                                          typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  }

  return applyVisit(children[1].get(),
                    static_cast<typeId>(CanonicalTypes::SCALAR));
}

constraintSet TypeInferenceVisitor::visit(Delay_identifier *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(List_of_identifiers_unpacked_dimensions *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Delay_scope *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Action_block *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Trailing_assign_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Enum_name_list_trailing_comma *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_port_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Equiv_impl_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Class_new *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Port_net_type *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Unqualified_id *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Begin *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(System_tf_call *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Parameter_value_byname_list_item_last *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Conditional_generate_construct *node,
                                          typeId type) {
  if (node->getChildren().size() == 6) {
    auto constraintsExp =
        applyVisit(node->getChildren()[2].get(),
                   static_cast<typeId>(CanonicalTypes::SCALAR));
    auto constraintsItems =
        applyVisit(node->getChildren()[4].get(), freshType());

    constraintsExp.insert(constraintsItems.begin(), constraintsItems.end());
    return constraintsExp;
  }
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Timescale_directive *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Port_expression *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_sequ_entry_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Symbol_or_label *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Simple_sequence_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Systemtfidentifier *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_unbasednumber *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Decl_dimensions_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_items_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Enum_name *node, typeId type) {
  auto t = freshType();
  if (node->getChildren().size() == 1) {

    return applyVisit(node->getChildren().front().get(), type);
  } else if (node->getChildren().size() == 3) {

    auto constraintsId = applyVisit(node->getChildren()[0].get(), t);
    auto constraintsExp = applyVisit(node->getChildren()[2].get(), t);

    constraintsId.insert(constraintsExp.begin(), constraintsExp.end());
    return constraintsId;
  } else if (node->getChildren().size() == 4) {

    auto constraintsId = applyVisit(node->getChildren()[0].get(), t);
    auto constraintsNum =
        applyVisit(node->getChildren()[2].get(),
                   static_cast<typeId>(CanonicalTypes::SCALAR));

    constraintsId.insert(constraintsNum.begin(), constraintsNum.end());
    return constraintsId;
  } else if (node->getChildren().size() == 6 &&
             node->getChildren()[4]->getElement() == " = ") {

    auto constraintsId = applyVisit(node->getChildren()[0].get(), t);
    auto constraintsNum =
        applyVisit(node->getChildren()[2].get(),
                   static_cast<typeId>(CanonicalTypes::SCALAR));
    auto constraintsExp = applyVisit(node->getChildren()[5].get(), t);

    constraintsId.insert(constraintsNum.begin(), constraintsNum.end());
    constraintsId.insert(constraintsExp.begin(), constraintsExp.end());
    return constraintsId;

  } else if (node->getChildren().size() == 8) {

    auto constraintsId = applyVisit(node->getChildren()[0].get(), t);
    auto constraintsNum1 =
        applyVisit(node->getChildren()[2].get(),
                   static_cast<typeId>(CanonicalTypes::SCALAR));
    auto constraintsNum2 =
        applyVisit(node->getChildren()[4].get(),
                   static_cast<typeId>(CanonicalTypes::SCALAR));
    auto constraintsExp = applyVisit(node->getChildren()[7].get(), t);

    constraintsId.insert(constraintsNum1.begin(), constraintsNum1.end());
    constraintsId.insert(constraintsNum2.begin(), constraintsNum2.end());
    constraintsId.insert(constraintsExp.begin(), constraintsExp.end());

    return constraintsId;
  } else {

    auto constraintsId = applyVisit(node->getChildren()[0].get(), t);
    auto constraintsNum1 =
        applyVisit(node->getChildren()[2].get(),
                   static_cast<typeId>(CanonicalTypes::SCALAR));
    auto constraintsNum2 =
        applyVisit(node->getChildren()[4].get(),
                   static_cast<typeId>(CanonicalTypes::SCALAR));

    constraintsId.insert(constraintsNum1.begin(), constraintsNum1.end());
    constraintsId.insert(constraintsNum2.begin(), constraintsNum2.end());

    return constraintsId;
  }
}

constraintSet TypeInferenceVisitor::visit(Parameter_value_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specify_edge_path *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Implicit_class_handle *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_item *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Statement_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Type_identifier_followed_by_id *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Method_prototype *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tf_port_item *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet
TypeInferenceVisitor::visit(Block_item_or_statement_or_null_list *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Endnew_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specify_item_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specify_simple_path_decl *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_rs_eq *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_import_item_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_port_decl *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(With_exprs_suffix *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Generate_region *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Call_base *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Array_locator_method *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Port_declaration_ansi *node, typeId) {

  auto t = freshType();
  if (node->getChildren()[0]->type == NodeType::PORT_DIRECTION) {

    auto portDir = applyVisit(node->getChildren()[0].get(), t);
    auto vType = applyVisit(node->getChildren()[1].get(), t);

    auto dType = applyVisit(node->getChildren()[2].get(), t);
    auto assign = applyVisit(node->getChildren()[3].get(), t);

    portDir.insert(vType.begin(), vType.end());
    portDir.insert(dType.begin(), dType.end());
    portDir.insert(assign.begin(), assign.end());
    portDir.insert({t, static_cast<typeId>(CanonicalTypes::WIRE)});

    return portDir;

  } else if (node->getChildren().size() == 3) {
    auto constraintsTypeId = applyVisit(node->getChildren()[0].get(), t);
    auto dimensions = applyVisit(node->getChildren()[1].get(),
                                 static_cast<typeId>(CanonicalTypes::SCALAR));
    auto assign = applyVisit(node->getChildren()[2].get(), t);
    constraintsTypeId.insert(dimensions.begin(), dimensions.end());
    constraintsTypeId.insert(assign.begin(), assign.end());
    return constraintsTypeId;
  } else {
    auto dPrimitive = applyVisit(node->getChildren()[0].get(), t);
    auto GenId = applyVisit(node->getChildren()[1].get(), t);
    auto dimensions = applyVisit(node->getChildren()[2].get(),
                                 static_cast<typeId>(CanonicalTypes::SCALAR));
    auto assign = applyVisit(node->getChildren()[3].get(), t);

    dPrimitive.insert(GenId.begin(), GenId.end());
    dPrimitive.insert(dimensions.begin(), dimensions.end());
    dPrimitive.insert(assign.begin(), assign.end());
    return dPrimitive;
  }
  return constraintSet();
}

constraintSet TypeInferenceVisitor::visit(Bitand_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Range_list_in_braces *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Module_parameter_port_list_item_last *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Hex_based_number *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Hierarchy_event_identifier *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(List_of_variable_decl_assignments *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Random_qualifier_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Drive_strength_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_timeliteral *, typeId) {
  return constraintSet();
}

constraintSet TypeInferenceVisitor::visit(Value_range *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expr_mintypmax_generalized *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Polarity_operator *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(For_initialization *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Enum_data_type *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Blocking_assignment *node, typeId) {
  auto type = static_cast<typeId>(CanonicalTypes::REG);

  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Delay1 *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Based_number *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Procedural_timing_control_statement *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Block_item_decl *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Net_variable_or_decl_assigns *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Time_literal *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Function_item_data_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Decl_variable_dimension *node,
                                          typeId) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return defaultVisitor(node, t);
}

constraintSet TypeInferenceVisitor::visit(Tf_port_list_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Endfunction_label_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Qualified_id *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Immediate_assertion_statement *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Join_keyword *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_bindigits *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Event_trigger *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Dynamic_array_new *node, typeId) {
  auto t = static_cast<typeId>(CanonicalTypes::VECTOR);
  return defaultVisitor(node, t);
}

constraintSet TypeInferenceVisitor::visit(Matches_expr *node, typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Port_reference_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Array_reduction_method *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Builtin_array_method *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assignment_pattern_expression *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Drive_strength *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Port_declaration_non_ansi *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Var_type *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Parameter_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_item_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Genericidentifier *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_item_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    List_of_ports_or_port_declarations_item_last_ansi *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    Data_type_or_implicit_followed_by_id_and_dimensions_opt *node,
    typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Xor_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Dec_based_number *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Loop_statement *node, typeId type) {
  auto x = static_cast<typeId>(CanonicalTypes::SCALAR);
  auto y = freshType();

  if (node->getChildren()[0]->getElement() == " for ") {

    auto constraintsInit = applyVisit(node->getChildren()[2].get(), x);
    auto constraintsExpr = applyVisit(node->getChildren()[4].get(), x);
    auto constraintsStep = applyVisit(node->getChildren()[6].get(), x);
    auto constraintsStat = applyVisit(node->getChildren()[8].get(), y);

    constraintsInit.insert(constraintsExpr.begin(), constraintsExpr.end());
    constraintsInit.insert(constraintsStep.begin(), constraintsStep.end());
    constraintsInit.insert(constraintsStat.begin(), constraintsStat.end());

    return constraintsInit;

  } else if (node->getChildren().size() == 2) {
    return applyVisit(node->getChildren()[1].get(), y);

  } else if (node->getChildren()[0].get()->getElement() == " while ") {
    auto constraintsExpr = applyVisit(node->getChildren()[2].get(), x);
    auto constraintsStat = applyVisit(node->getChildren()[4].get(), y);

    constraintsExpr.insert(constraintsStat.begin(), constraintsStat.end());
    return constraintsExpr;

  } else if (node->getChildren()[0].get()->getElement() == " do ") {
    auto constraintsStat = applyVisit(node->getChildren()[1].get(), y);
    auto constraintsExpr = applyVisit(node->getChildren()[4].get(), x);

    constraintsExpr.insert(constraintsStat.begin(), constraintsStat.end());
    return constraintsExpr;
  } else if (node->getChildren()[0].get()->getElement() == " foreach ") {
    auto z = freshType();

    auto constraintsRef = applyVisit(node->getChildren()[2].get(), y);
    auto constraintsStat = applyVisit(node->getChildren()[4].get(), z);

    constraintsRef.insert(constraintsStat.begin(), constraintsStat.end());
    return constraintsRef;
  }
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Data_declaration_or_module_instantiation *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_comb_entry_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Bit_logic *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Reference_or_call *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Local_root *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Port_direction *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Variable_decl_assignment *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specify_edge_path_decl *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Function_prototype *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_within_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Expr_primary_no_groups *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Parameter_value_byname *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Case_any *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Spec_notifier *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Block_item_or_statement_or_null *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specify_item *node, typeId type) {
  if (node->getChildren().size() == 2) {
    return applyVisit(node->getChildren()[0].get(), type);
  } else if (node->getChildren()[0]->getElement() == " if ") {
    auto t1 = freshType();
    auto t2 = static_cast<typeId>(CanonicalTypes::SCALAR);
    auto constraintsExpression = applyVisit(node->getChildren()[2].get(), t2);
    auto constraintPath = applyVisit(node->getChildren()[4].get(), t1);
    constraintsExpression.insert(constraintPath.begin(), constraintPath.end());
    return constraintsExpression;

  } else if (node->getChildren()[0]->getElement() == " specparam ") {
    return applyVisit(node->getChildren()[1].get(), type);

  } else if (node->getChildren().size() == 7) {
    auto t1 = freshType();
    auto constraintsSpecReferenceEvent =
        applyVisit(node->getChildren()[2].get(), t1);
    auto constraintDelayValue = applyVisit(node->getChildren()[4].get(), t1);
    constraintsSpecReferenceEvent.insert(constraintDelayValue.begin(),
                                         constraintDelayValue.end());
    return constraintsSpecReferenceEvent;

  } else {
    auto t1 = freshType();
    auto constraintsSpecReferenceEvent1 =
        applyVisit(node->getChildren()[2].get(), t1);
    auto constraintsSpecReferenceEvent2 =
        applyVisit(node->getChildren()[4].get(), t1);
    auto constraintDelayValue = applyVisit(node->getChildren()[6].get(), t1);
    constraintsSpecReferenceEvent1.insert(constraintDelayValue.begin(),
                                          constraintDelayValue.end());
    constraintsSpecReferenceEvent1.insert(
        constraintsSpecReferenceEvent2.begin(),
        constraintsSpecReferenceEvent2.end());
    return constraintsSpecReferenceEvent1;
  }
}

constraintSet TypeInferenceVisitor::visit(Any_param_declaration *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Tf_port_list_trailing_comma *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Struct_union_member *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Any_port_list_positional *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Dir *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Lifetime_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(List_of_identifiers *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Edge_operator *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_virtual_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Timeunits_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tf_item_or_statement_or_null *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_import_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expr_primary *node, typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Signed_unsigned_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_comb_entry *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Delay3 *node, typeId) {
  constraintSet d;
  auto x = static_cast<typeId>(CanonicalTypes::CONST_SCALAR);
  if (node->getChildren().size() == 2) {

    d = applyVisit(node->getChildren()[1].get(), x);

  } else if (node->getChildren().size() >= 4) {
    d = applyVisit(node->getChildren()[2].get(), x);

    if (node->getChildren().size() > 4) {
      auto d1 = applyVisit(node->getChildren()[4].get(), x);
      d.insert(d1.begin(), d1.end());
    }
  }
  return d;
}

constraintSet TypeInferenceVisitor::visit(Inc_or_dec_or_primary_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Procedural_assertion_statement *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Struct_union_member_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Comp_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Postfix_expression *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Symbolidentifier *node,
                                          typeId type) { // id
  return identifierVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_input_sym *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Pos_neg_number *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specify_terminal_descriptor *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Select_variable_dimension *node,
                                          typeId) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return defaultVisitor(node, t);
}

constraintSet
TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_ansi *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Generate_case_items *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Data_type_primitive_scalar *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Tf_item_or_statement_or_null_list *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Conditional_statement *node, typeId) {

  auto t = freshType();

  auto constraintsUniquePriorityOpt =
      applyVisit(node->getChildren()[0].get(), t);
  auto x = static_cast<typeId>(CanonicalTypes::SCALAR);
  auto constraintsExpressionInParens =
      applyVisit(node->getChildren()[2].get(), x);
  constraintsUniquePriorityOpt.insert(constraintsExpressionInParens.begin(),
                                      constraintsExpressionInParens.end());
  auto constraintsStatement = applyVisit(node->getChildren()[3].get(), t);
  constraintsUniquePriorityOpt.insert(constraintsStatement.begin(),
                                      constraintsStatement.end());

  if (node->getChildren().size() > 4) {
    auto constraintsStatementElse = applyVisit(node->getChildren()[5].get(), t);
    constraintsUniquePriorityOpt.insert(constraintsStatementElse.begin(),
                                        constraintsStatementElse.end());
  }

  return constraintsUniquePriorityOpt;
}

constraintSet TypeInferenceVisitor::visit(Specparam_decl *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_non_ansi *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Statement_or_null_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Task_declaration *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Data_declaration_base *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Any_port_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Macronumericwidth *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Trailing_decl_assignment_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Gate_instance_or_register_variable *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Bind_instantiation *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_import_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_package_import_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Structure_or_array_pattern_expression_list *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Event_expression_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_rss_eq *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Implements_interface_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Delay3_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expr_mintypmax_trans_set *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Statement_or_null *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Enum_name_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_unary_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Pp_identifier *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Shift_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Oct_based_number *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Hierarchy_segment *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Nonblocking_assignment *node,
                                          typeId) {
  auto type = static_cast<typeId>(CanonicalTypes::REG);

  auto constraintsLpvalue = applyVisit(node->getChildren()[0].get(), type);
  auto constraintsExpression = applyVisit(node->getChildren()[3].get(), type);

  constraintsLpvalue.insert(constraintsExpression.begin(),
                            constraintsExpression.end());

  return constraintsLpvalue;
}

constraintSet TypeInferenceVisitor::visit(Expression_list_proper *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Generate_if *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Function_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Scope_prefix *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Primitive_gate_instance_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Simple_immediate_assertion_statement *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Description_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Dr_strength0 *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Unique_priority_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specparam *node, typeId type) {
  auto constraintsGenericId = applyVisit(node->getChildren()[0].get(), type);
  auto constraintsExpression = applyVisit(node->getChildren()[2].get(), type);

  constraintsGenericId.insert(constraintsExpression.begin(),
                              constraintsExpression.end());

  return constraintsGenericId;
}

constraintSet TypeInferenceVisitor::visit(Port_expression_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Cond_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto constraintsLogOrExpr = applyVisit(
        children[0].get(), static_cast<typeId>(CanonicalTypes::SCALAR));

    auto t = this->freshType();
    auto constraintsExpression = applyVisit(children[2].get(), t);
    auto constraintsCondExpr = applyVisit(children[4].get(), t);

    constraintsLogOrExpr.insert(constraintsExpression.begin(),
                                constraintsExpression.end());
    constraintsLogOrExpr.insert(constraintsCondExpr.begin(),
                                constraintsCondExpr.end());
    constraintsLogOrExpr.insert({t, type});

    return constraintsLogOrExpr;
  }
}

constraintSet TypeInferenceVisitor::visit(Tk_reg_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Logor_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Delay3_or_drive_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Tf_item_or_statement_or_null_list_opt *node,
                            typeId) {
  return defaultVisitor(node, static_cast<typeId>(CanonicalTypes::LOGIC));
}

constraintSet TypeInferenceVisitor::visit(Net_decl_assign *node, typeId type) {

  auto constraintsGenericIdentifier =
      applyVisit(node->getChildren()[0].get(), type);
  auto constraintsExpression = applyVisit(node->getChildren()[2].get(), type);

  constraintsGenericIdentifier.insert(constraintsExpression.begin(),
                                      constraintsExpression.end());

  return constraintsGenericIdentifier;
}

constraintSet TypeInferenceVisitor::visit(Always_any *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(List_of_tf_variable_identifiers *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Var_or_net_type_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tf_port_list_item_last *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Task_declaration_id *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Instantiation_base *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Sequence_repetition_expr *node,
                                          typeId type) {
  const auto &children = node->getChildren();
  auto constraintsExpressionOrDist = applyVisit(children[0].get(), type);
  auto constraintsBooleanAbbrevOpt = applyVisit(children[1].get(), type);

  constraintsExpressionOrDist.insert(constraintsBooleanAbbrevOpt.begin(),
                                     constraintsBooleanAbbrevOpt.end());

  return constraintsExpressionOrDist;
}

constraintSet TypeInferenceVisitor::visit(Tk_hexdigits *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable *node, typeId type) {

  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  auto t1 = static_cast<typeId>(CanonicalTypes::GATE);

  auto constraintsId = applyVisit(node->getChildren()[0].get(), type);
  auto constraintsDimensions = applyVisit(node->getChildren()[1].get(), t);
  if (node->getChildren().size() == 3) {
    auto constraintsAssignment = applyVisit(node->getChildren()[2].get(), type);
    constraintsId.insert(constraintsAssignment.begin(),
                         constraintsAssignment.end());
  } else {
    auto f = freshType();
    auto portList = applyVisit(node->getChildren()[3].get(), f);
    constraintsId.insert(portList.begin(), portList.end());
    constraintsId.insert({{t1, type}});
  }

  constraintsId.insert(constraintsDimensions.begin(),
                       constraintsDimensions.end());

  return constraintsId;
}

constraintSet TypeInferenceVisitor::visit(Localparam_assign *node, typeId) {
  auto x = static_cast<typeId>(CanonicalTypes::CONST_SCALAR);
  auto constraintsGenericIdentifier =
      applyVisit(node->getChildren()[0].get(), x);
  auto constraintsExpression = applyVisit(node->getChildren()[2].get(), x);
  constraintsGenericIdentifier.insert(constraintsExpression.begin(),
                                      constraintsExpression.end());

  return constraintsGenericIdentifier;
}

constraintSet TypeInferenceVisitor::visit(Class_items *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expression_in_parens *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    List_of_ports_or_port_declarations_trailing_comma_ansi *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Port_reference *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Dist_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Caseeq_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Generate_block *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    List_of_ports_or_port_declarations_item_last_non_ansi *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Any_argument_list_item_last *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Gate_instantiation *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Casting_type *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expr_mintypmax *node, typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Continuous_assign *node, typeId) {
  auto type = static_cast<typeId>(CanonicalTypes::WIRE);

  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Parameter_assign *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Delay_value_simple *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Switchtype *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Package_or_generate_item_declaration *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Bin_based_number *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Loop_generate_construct *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Parameter_override *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_primitive *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Parameter_expr *node, typeId) {
  return defaultVisitor(node,
                        static_cast<typeId>(CanonicalTypes::CONST_SCALAR));
}

constraintSet TypeInferenceVisitor::visit(Repeat_control *node, typeId) {
  return applyVisit(node->getChildren()[2].get(),
                    static_cast<typeId>(CanonicalTypes::SCALAR));
}

constraintSet TypeInferenceVisitor::visit(Packed_signing_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expression_or_null_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Enum_name_list_item_last *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Macro_formals_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Spec_notifier_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Hierarchy_extension *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Generate_item_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Data_declaration_modifiers_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_throughout_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet
TypeInferenceVisitor::visit(Property_expr_or_assignment_list *node,
                            typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Bitor_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Tf_port_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Any_port_list_trailing_comma_named *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Function_return_type_and_id *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Statement *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Dr_strength1 *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assign_modify_statement *node,
                                          typeId) {
  const auto &children = node->getChildren();
  auto t = this->freshType();
  auto constraintsLpValue = applyVisit(children[0].get(), t);
  auto s = static_cast<typeId>(CanonicalTypes::SCALAR);
  auto constraintsExpression = applyVisit(children[2].get(), s);

  constraintsLpValue.insert(constraintsExpression.begin(),
                            constraintsExpression.end());
  return constraintsLpValue;
}

constraintSet TypeInferenceVisitor::visit(Udp_port_decls *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Integer_vector_type *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assignment_pattern *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_constructor *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Module_or_generate_item_declaration *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Final_construct *node, typeId) {
  return defaultVisitor(node,
                        static_cast<typeId>(CanonicalTypes::CONST_SCALAR));
}

constraintSet TypeInferenceVisitor::visit(Member_name *, typeId) {
  return constraintSet();
}

constraintSet TypeInferenceVisitor::visit(Class_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_import_item *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Signing *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_constructor_prototype *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Generate_case_item *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Data_declaration *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expression *node, typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Cont_assign *node, typeId) {
  auto f = freshType();
  auto constraintsLpvalue = applyVisit(node->getChildren()[0].get(), f);
  auto constraintsExpression = applyVisit(node->getChildren()[2].get(), f);
  constraintsLpvalue.insert(constraintsExpression.begin(),
                            constraintsExpression.end());
  return constraintsLpvalue;
}

constraintSet TypeInferenceVisitor::visit(Delay_or_event_control_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Bind_directive *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Misc_directive *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_initial_expr_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Description *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Data_type_base *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Trailing_assign *node, typeId type) {
  auto t = this->freshType();

  auto constraintsParameterExpr =
      applyVisit(node->getChildren()[1].get(), type);
  auto constraintsParameterValueRangesOpt =
      applyVisit(node->getChildren()[2].get(), t);
  constraintsParameterExpr.insert(constraintsParameterValueRangesOpt.begin(),
                                  constraintsParameterValueRangesOpt.end());
  return constraintsParameterExpr;
}

constraintSet TypeInferenceVisitor::visit(Module_end *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Wait_statement *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_item_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Case_items *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Statement_or_null_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Port_named *node, typeId) {
  auto t = freshType();
  return defaultVisitor(node, t);
}

constraintSet TypeInferenceVisitor::visit(Udp_output_sym *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assignment_statement_no_expr *node,
                                          typeId) {
  const auto &children = node->getChildren();
  auto t = this->freshType();

  if (children.size() == 1) {
    return applyVisit(children[0].get(), t);
  } else {

    auto constraintsLpValue = applyVisit(children[0].get(), t);
    auto constraintsExpression = applyVisit(children[2].get(), t);
    constraintsLpValue.insert(constraintsExpression.begin(),
                              constraintsExpression.end());
    return constraintsLpValue;
  }
}

constraintSet
TypeInferenceVisitor::visit(Any_port_list_item_last_positional *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_item_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_and_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Data_type *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Argument_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(For_step_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Sequence_intersect_expr *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Function_declaration *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Net_type_or_none *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_declaration_extends_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Boolean_abbrev_opt *, typeId) {
  return constraintSet();
}

constraintSet TypeInferenceVisitor::visit(Specify_path_identifiers *node,
                                          typeId type) {
  if (node->getChildren().size() == 4) {
    auto x = static_cast<typeId>(CanonicalTypes::VECTOR);
    auto y = static_cast<typeId>(CanonicalTypes::SCALAR);
    auto constraintsGenericId = applyVisit(node->getChildren()[0].get(), x);
    auto constraintsExpPrimary = applyVisit(node->getChildren()[2].get(), y);
    constraintsGenericId.insert(constraintsExpPrimary.begin(),
                                constraintsExpPrimary.end());
    return constraintsGenericId;
  } else {
    auto t = freshType();
    auto d1 = applyVisit(node->getChildren()[0].get(), t);

    if (node->getChildren().size() > 1) {
      auto t1 = freshType();
      auto d2 = applyVisit(node->getChildren()[0].get(), t1);
      d1.insert(d2.begin(), d2.end());
      return d1;
    }
  }
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tf_port_direction *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_decdigits *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(End *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Net_declaration *node, typeId) {
  return defaultVisitor(node, freshType());
}

constraintSet TypeInferenceVisitor::visit(Tk_tagged_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_xzdigits *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Gatetype *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Preprocess_include_argument *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Macro_formals_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Const_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Logand_expr *node, typeId type) {
  const auto &children = node->getChildren();
  if (children.size() == 1) {
    return applyVisit(children[0].get(), type);
  } else {
    auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
    return binaryExpr(children[0].get(), children[2].get(), t, t, type);
  }
}

constraintSet TypeInferenceVisitor::visit(Event_expression *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_entry_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Preprocessor_action *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tf_port_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_init_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node,
    typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Source_text *node, typeId) {
  auto t = freshType();
  return applyVisit(node->getChildren().front().get(), t);
}

constraintSet TypeInferenceVisitor::visit(Defparam_assign *node, typeId) {
  return defaultVisitor(node,
                        static_cast<typeId>(CanonicalTypes::CONST_SCALAR));
}

constraintSet TypeInferenceVisitor::visit(Decl_dimensions *node, typeId) {
  auto t = static_cast<typeId>(CanonicalTypes::VECTOR);
  return defaultVisitor(node, t);
}

constraintSet TypeInferenceVisitor::visit(Constant_dec_number *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Case_statement *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assignment_statement *node, typeId) {
  auto type = static_cast<typeId>(CanonicalTypes::REG);
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Dpi_import_property_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Dpi_spec_string *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Trailing_decl_assignment *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Always_construct *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Genvar_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Any_port_list_named *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Subroutine_call *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Property_expr_or_assignment *node,
                                          typeId type) {
  return applyVisit(node->getChildren().front().get(), type);
}

constraintSet TypeInferenceVisitor::visit(Any_argument *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_or_interface_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Expression_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Gate_instance_or_register_variable_list *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_evalstringliteral *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::STRING);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Delay_or_event_control *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Udp_input_list *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Parameter_value_byname_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_port_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_opt *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Any_port_list_trailing_comma_positional *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Block_item_or_statement_or_null_list_opt *node,
                            typeId) {
  return defaultVisitor(node, static_cast<typeId>(CanonicalTypes::LOGIC));
}

constraintSet TypeInferenceVisitor::visit(Genvar_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Number *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specify_item_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_ls_eq *, typeId type) {
  auto t = static_cast<typeId>(CanonicalTypes::SCALAR);
  return constraintSet({{t, type}});
}

constraintSet TypeInferenceVisitor::visit(Tf_variable_identifier *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Initial_construct *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Localparam_assign_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Disable_statement *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(List_of_module_item_identifiers *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Any_port_list_item_last_named *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Net_variable *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Parameter_expr_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Specparam_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Deferred_immediate_assertion_statement *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Slice_size_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Concurrent_assertion_item *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Clocking_item_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Cycle_delay *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Macroiditem *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assume_property_statement *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Pull01 *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Preprocessor_directive *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_item_directive *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assert_property_statement *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Scope_or_if_res *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Task_prototype *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Clocking_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Block_identifier_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Macroidentifier *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Property_spec_disable_iff_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Macrogenericitem *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Module_block *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Stream_expression *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Final_or_zero *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Tk_edge_descriptor *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(
    Method_property_qualifier_list_not_starting_with_virtual *node,
    typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Identifier_opt *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet
TypeInferenceVisitor::visit(Module_parameter_port_list_preprocessor_last *node,
                            typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Type_assignment *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Type_assignment_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Method_qualifier_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Stream_operator *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assertion_item *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Property_spec *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Streaming_concatenation *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Edge_descriptor_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Property_qualifier *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Event_control_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_item_qualifier *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Concurrent_assertion_statement *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Cover_property_statement *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Stream_expression_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_item_qualifier_list_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Assertion_item_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Boolean_abbrev *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Cycle_delay_range *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Property_operator *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Property_spec_disable_iff *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Config_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(With_constraint_block_opt *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Random_qualifier *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Bind_target_instance_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Hierarchy_or_call_extension *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Clocking_item_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Modport_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Class_constraint *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Net_alias *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Type_reference *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Method_qualifier_list *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Interface_type *node, typeId type) {
  return defaultVisitor(node, type);
}

constraintSet TypeInferenceVisitor::visit(Package_export_declaration *node,
                                          typeId type) {
  return defaultVisitor(node, type);
}