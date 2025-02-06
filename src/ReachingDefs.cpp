#include "ReachingDefs.h"

void ReachingDefsVisitor::defaultVisitor(Node *node) {
  for (auto &c : node->getChildren()) {
    applyVisit(c.get());
  }
};

// should be called by label_opt node
// returns the label string referent to that label node
static std::string getLabel(Node *head) {
  if (head->type != NodeType::LABEL_OPT)
    return NULL;

  return head->getChildren()[1]
      ->getChildren()[0]
      ->getChildren()[0]
      ->getElement(); // label_opt -> symbol_or_label -> GenericIdentifier ->
                      // value
}

static std::string getScope(std::vector<std::string> &labelContext) {
  std::string scope = "";

  for (auto const &s : labelContext) {
    scope += s + ".";
  }
  return scope;
}

void ReachingDefsVisitor::startNewScope() {
  scopeLimit.push(identifiersInScope.size());
}

void ReachingDefsVisitor::finishScope() {
  while (!scopeLimit.empty() && identifiersInScope.size() > scopeLimit.top()) {

    identifiersInScope.pop_back();
  }

  if (!scopeLimit.empty())
    scopeLimit.pop();
}

void ReachingDefsVisitor::visit(Terminal *node) {
  defaultVisitor(node);
}

void ReachingDefsVisitor::visit(Module_item *node) {
  defaultVisitor(node);
  ProgramPoint pp;
  pp.programPoint = node;
  pp.defs = std::set<std::string>(identifiersInScope.begin(),
                                  identifiersInScope.end());

  pp.scope = getScope(labelContext);

  programPoints.push_back(std::move(pp));
};

void ReachingDefsVisitor::visit(Genericidentifier *node) {
  if (node->getChildren()[0]->type != NodeType::KEYWORDIDENTIFIER &&
      node->getChildren()[0]->getElement().find("id") != std::string::npos &&
      node->getChildren()[0]->getElement().size() > 2 &&
      node->getChildren()[0]->getElement()[1] !=
          '_') { //"_" means excluded identifier
    identifiersInScope.push_back(node->getChildren()[0]->getElement());
  }
}

void ReachingDefsVisitor::visit(Node *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_delay_range_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_simple_path *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Event_control *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(String_literal *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Charge_strength_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dpi_import_export *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(For_initialization_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(List_of_port_identifiers *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Non_integer_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_value_ranges_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_item_no_pp *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_delay_repetition_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Add_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dpi_import_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_realtime *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Case_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_if_else_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Non_anonymous_instantiation_base *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Unary_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Unary_op *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_id *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Reference *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Cast *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_variable_identifier_first *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Type_or_id_root *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_or_generate_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Module_parameter_port_list_trailing_comma *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Instantiation_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameters *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Reference_or_call_base *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Param_type_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Structure_or_array_pattern_key *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_assign_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Defparam_assign_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Generate_item_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_octdigits *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_expr_primary *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Lpvalue *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Label_opt *node) {
  if (node->getChildren().size() > 1) {
    labelContext.push_back(getLabel(node));
  }
};

void ReachingDefsVisitor::visit(Escapedidentifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Generate_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Data_type_primitive *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Spec_reference_event *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_input_declaration_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Non_port_module_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    List_of_ports_or_port_declarations_trailing_comma_non_ansi *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_parameter_port_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_prefix_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expr_primary_braces *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Pow_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(For_init_decl_or_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_initial *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_list_paren_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Struct_data_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_sequ_entry *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Net_variable_or_decl_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Parameter_value_byname_list_trailing_comma *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Inc_or_dec_expression *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Net_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Select_dimensions_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Spec_polarity *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Macro_formal_parameter *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Structure_or_array_pattern_expression *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(For_step *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specparam_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_binbase *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_stringliteral *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Var_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Identifier_optional_unpacked_dimensions *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Function_item_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Type_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_body *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Mul_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Par_block *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Keywordidentifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Logeq_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_common_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Primitive_gate_instance *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Data_type_or_implicit *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_octbase *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_hexbase *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Seq_block *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Task_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_block *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_decnumber *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_decbase *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_implication_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Bit_logic_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Integer_atom_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Lifetime *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_argument_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay_value_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_port_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Jump_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay_value *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_or_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_attribute_foreign_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_direction_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_item_expr_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Cont_assign_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_argument_list_trailing_comma *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Procedural_continuous_assignment *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expression_or_dist *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_start *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expr_primary_parens *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Open_range_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Unary_prefix_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay_identifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(List_of_identifiers_unpacked_dimensions *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay_scope *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Action_block *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Trailing_assign_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Enum_name_list_trailing_comma *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_port_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Equiv_impl_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_new *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_net_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Unqualified_id *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Begin *node) {
  startNewScope();
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(System_tf_call *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_value_byname_list_item_last *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Conditional_generate_construct *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Timescale_directive *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_expression *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_sequ_entry_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Symbol_or_label *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Simple_sequence_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Systemtfidentifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_unbasednumber *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Decl_dimensions_opt *){};

void ReachingDefsVisitor::visit(Class_items_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Enum_name *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_value_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_edge_path *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Implicit_class_handle *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Statement_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Type_identifier_followed_by_id *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Method_prototype *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Block_item_or_statement_or_null_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Endnew_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_item_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_simple_path_decl *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_rs_eq *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_import_item_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_port_decl *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(With_exprs_suffix *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Generate_region *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Call_base *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Array_locator_method *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_declaration_ansi *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Bitand_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Range_list_in_braces *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_parameter_port_list_item_last *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Hex_based_number *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Hierarchy_event_identifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(List_of_variable_decl_assignments *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Random_qualifier_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Drive_strength_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_timeliteral *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Value_range *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expr_mintypmax_generalized *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Polarity_operator *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(For_initialization *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Enum_data_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Blocking_assignment *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay1 *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Based_number *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Procedural_timing_control_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Block_item_decl *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Net_variable_or_decl_assigns *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Time_literal *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Function_item_data_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Decl_variable_dimension *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Endfunction_label_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Qualified_id *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Immediate_assertion_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Join_keyword *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_bindigits *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Event_trigger *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dynamic_array_new *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Matches_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_reference_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Array_reduction_method *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Builtin_array_method *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assignment_pattern_expression *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Drive_strength *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_declaration_non_ansi *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_parameter_port_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Var_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_item_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_item_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    List_of_ports_or_port_declarations_item_last_ansi *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Data_type_or_implicit_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Xor_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dec_based_number *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Loop_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Data_declaration_or_module_instantiation *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_comb_entry_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Bit_logic *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Reference_or_call *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Local_root *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_direction *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Variable_decl_assignment *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_edge_path_decl *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Function_prototype *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_within_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expr_primary_no_groups *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_value_byname *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Case_any *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Spec_notifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Block_item_or_statement_or_null *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_param_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_list_trailing_comma *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Struct_union_member *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_port_list_positional *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dir *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Lifetime_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(List_of_identifiers *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Edge_operator *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_virtual_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Timeunits_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_item_or_statement_or_null *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_import_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expr_primary *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Signed_unsigned_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_comb_entry *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay3 *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Inc_or_dec_or_primary_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Procedural_assertion_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Struct_union_member_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Comp_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Postfix_expression *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Symbolidentifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_input_sym *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Pos_neg_number *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_terminal_descriptor *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Select_variable_dimension *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(List_of_ports_or_port_declarations_ansi *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Generate_case_items *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Data_type_primitive_scalar *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_item_or_statement_or_null_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Conditional_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specparam_decl *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    List_of_ports_or_port_declarations_non_ansi *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Statement_or_null_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Task_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Data_declaration_base *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_port_list_opt *){};

void ReachingDefsVisitor::visit(Macronumericwidth *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Trailing_decl_assignment_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Gate_instance_or_register_variable *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Bind_instantiation *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_import_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_package_import_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Structure_or_array_pattern_expression_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Event_expression_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_rss_eq *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Implements_interface_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay3_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expr_mintypmax_trans_set *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Statement_or_null *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Enum_name_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_unary_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Pp_identifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Shift_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Oct_based_number *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Hierarchy_segment *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Nonblocking_assignment *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expression_list_proper *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Generate_if *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Function_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Scope_prefix *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Primitive_gate_instance_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Simple_immediate_assertion_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Description_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dr_strength0 *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Unique_priority_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specparam *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_expression_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Cond_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_reg_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Logor_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay3_or_drive_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_item_or_statement_or_null_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Net_decl_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Always_any *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(List_of_tf_variable_identifiers *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Var_or_net_type_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_list_item_last *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Task_declaration_id *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Instantiation_base *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_repetition_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_hexdigits *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Localparam_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_items *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expression_in_parens *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    List_of_ports_or_port_declarations_trailing_comma_ansi *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_reference *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dist_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Caseeq_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Generate_block *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    List_of_ports_or_port_declarations_item_last_non_ansi *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_argument_list_item_last *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Gate_instantiation *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Casting_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expr_mintypmax *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Continuous_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay_value_simple *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Switchtype *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_or_generate_item_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Bin_based_number *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Loop_generate_construct *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_override *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_primitive *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Repeat_control *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Packed_signing_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expression_or_null_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Enum_name_list_item_last *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Macro_formals_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Spec_notifier_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Hierarchy_extension *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Generate_item_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Data_declaration_modifiers_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_throughout_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_expr_or_assignment_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Bitor_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_port_list_trailing_comma_named *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Function_return_type_and_id *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dr_strength1 *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assign_modify_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_port_decls *node) {
  context.push(IdentifierRenamingVisitor::ContextType::DECL);
  defaultVisitor(node);
  context.pop();
};

void ReachingDefsVisitor::visit(Integer_vector_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assignment_pattern *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_constructor *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_parameter_port *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_or_generate_item_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Final_construct *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Member_name *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_import_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Signing *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_constructor_prototype *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Generate_case_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Data_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expression *){};

void ReachingDefsVisitor::visit(Cont_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay_or_event_control_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Bind_directive *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Misc_directive *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_initial_expr_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Description *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Data_type_base *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Trailing_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_end *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Wait_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_item_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Case_items *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Statement_or_null_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Port_named *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_output_sym *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assignment_statement_no_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_port_list_item_last_positional *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_item_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_and_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Data_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Argument_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(For_step_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Sequence_intersect_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Function_declaration *node) {
  startNewScope();
  defaultVisitor(node);
  finishScope();
};

void ReachingDefsVisitor::visit(Net_type_or_none *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_declaration_extends_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Boolean_abbrev_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_path_identifiers *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_direction *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_decdigits *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(End *) {
  finishScope();
  labelContext.pop_back();
};

void ReachingDefsVisitor::visit(Net_declaration *node) {
  context.push(IdentifierRenamingVisitor::ContextType::DECL);
  defaultVisitor(node);
  context.pop();
};

void ReachingDefsVisitor::visit(Tk_tagged_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_xzdigits *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Gatetype *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Preprocess_include_argument *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Macro_formals_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Const_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Logand_expr *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Event_expression *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_entry_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Preprocessor_action *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_port_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_init_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Source_text *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Defparam_assign *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Decl_dimensions *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Constant_dec_number *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Case_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assignment_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dpi_import_property_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Dpi_spec_string *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Trailing_decl_assignment *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Always_construct *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Genvar_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_port_list_named *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Subroutine_call *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_expr_or_assignment *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_argument *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_or_interface_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Expression_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Gate_instance_or_register_variable_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_evalstringliteral *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Delay_or_event_control *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Udp_input_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_value_byname_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_port_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(List_of_ports_or_port_declarations_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_port_list_trailing_comma_positional *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Block_item_or_statement_or_null_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Genvar_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Number *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specify_item_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_ls_eq *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tf_variable_identifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Initial_construct *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Localparam_assign_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Disable_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(List_of_module_item_identifiers *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Any_port_list_item_last_named *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Net_variable *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Parameter_expr_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Specparam_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Deferred_immediate_assertion_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Slice_size_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Concurrent_assertion_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Clocking_item_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Cycle_delay *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Macroiditem *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assume_property_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Pull01 *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Preprocessor_directive *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_item_directive *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assert_property_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Scope_or_if_res *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Task_prototype *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Clocking_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Block_identifier_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Macroidentifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_spec_disable_iff_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Macrogenericitem *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Module_block *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Stream_expression *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Final_or_zero *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Tk_edge_descriptor *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Method_property_qualifier_list_not_starting_with_virtual *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Identifier_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(
    Module_parameter_port_list_preprocessor_last *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Type_assignment *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Type_assignment_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Method_qualifier_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Stream_operator *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assertion_item *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_spec *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Streaming_concatenation *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Edge_descriptor_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_qualifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Event_control_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_item_qualifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Concurrent_assertion_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Cover_property_statement *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Stream_expression_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_item_qualifier_list_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Assertion_item_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Boolean_abbrev *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Cycle_delay_range *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_operator *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Property_spec_disable_iff *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Config_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(With_constraint_block_opt *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Random_qualifier *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Bind_target_instance_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Hierarchy_or_call_extension *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Clocking_item_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Modport_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Class_constraint *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Net_alias *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Type_reference *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Method_qualifier_list *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Interface_type *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Package_export_declaration *node) {
  defaultVisitor(node);
};

void ReachingDefsVisitor::visit(Interface_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(
    Data_type_or_implicit_basic_followed_by_id *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Coverage_spec_or_option_list_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Modport_item_list *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Expect_property_statement *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Lib_cell_identifiers_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Sequence_port_list_in_parens_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Clocking_direction *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Goto_repetition *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Constraint_block_item *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Assertion_variable_declaration *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(TK_static_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Design_statement *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Sequence_declaration *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Clocking_item *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Property_port_item *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(List_of_config_rule_statements *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Cycle_range *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Bind_target_instance *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Lib_cell_id *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Property_declaration *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Property_formal_type_followed_by_id *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Modport_simple_ports_declaration_last *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Covergroup_declaration *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Coverage_spec *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Consecutive_repetition *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(List_of_libraries_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Identifier_list_in_parens_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(List_of_clocking_decl_assign *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Coverage_event *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Config_rule_statement *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(
    Type_identifier_or_implicit_basic_followed_by_id *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Assertion_variable_declaration_list *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Constraint_expression_no_preprocessor *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Clocking_decl_assign *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(With_constraint_block *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Optional_semicolon *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Property_port_list_in_parens_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Modport_simple_ports_declaration_begin *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Modport_simple_port *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Clocking_skew_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Implication_operator *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Net_alias_assign_lvalue_list *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Nonconsecutive_repetition *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Bins_or_options_list_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Sequence_port_list_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Property_port_modifiers_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Liblist_clause *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Constraint_declaration *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Property_actual_arg_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(List_of_config_rule_statements_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Modport_ports_list *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Cover_point *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Modport_item *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Constraint_block_item_list_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Lib_cell_identifiers *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Property_port_list *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(List_of_libraries *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Constraint_block_item_list *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Coverage_spec_or_option_list *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Constraint_block *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Coverage_event_opt *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Cycle_range_or_expr *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Coverage_spec_or_option *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Method_qualifier *node) {
  defaultVisitor(node);
};
void ReachingDefsVisitor::visit(Tk_static_opt *node) {
  defaultVisitor(node);
}