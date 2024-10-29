#include "LivenessVisitor.h"
static bool isStartingToken(const std::string &t) {
  return t == " begin " || t == " module ";
}

static bool isFinishingToken(const std::string &t) {
  return t == " end " || t == " endmodule ";
}

void LivenessVisitor::defaultVisitor(Node *node) {
  for (auto &c : node->getChildren()) {
    applyVisit(c.get());
  }
};

void LivenessVisitor::visit(Terminal *node) {
  if (isStartingToken(node->getElement())) {

    scopeLimit.push(identifiersInScope.size());

  } else if (isFinishingToken(node->getElement())) {

    while (!scopeLimit.empty() &&
           identifiersInScope.size() > scopeLimit.top()) {

      identifiersInScope.pop_back();
    }
    if (!scopeLimit.empty())
      scopeLimit.pop();
  }
}

void LivenessVisitor::visit(Module_item *node) {
  defaultVisitor(node);
  ProgramPoint pp;
  pp.programPoint = node;
  pp.liveness = std::set<std::string>(identifiersInScope.begin(),
                                      identifiersInScope.end());

  programPoints.push_back(std::move(pp));
};

void LivenessVisitor::visit(Genericidentifier *node) {
  if (node->getChildren()[0]->type != NodeType::KEYWORDIDENTIFIER &&
      node->getChildren()[0]->getElement().find("id") != std::string::npos && 
      node->getChildren()[0]->getElement().size() > 2 &&
      node->getChildren()[0]->getElement()[1] != '_') {//"_" means excluded identifier
    identifiersInScope.push_back(node->getChildren()[0]->getElement());
  }
}

void LivenessVisitor::visit(Node *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_delay_range_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_simple_path *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Event_control *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(String_literal *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Charge_strength_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dpi_import_export *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(For_initialization_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_port_identifiers *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Non_integer_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_value_ranges_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_item_no_pp *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_delay_repetition_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Add_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dpi_import_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_realtime *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Case_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_if_else_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Non_anonymous_instantiation_base *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Unary_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Unary_op *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_id *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Reference *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Cast *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_variable_identifier_first *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Type_or_id_root *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_or_generate_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_parameter_port_list_trailing_comma *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Instantiation_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameters *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Reference_or_call_base *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Param_type_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Structure_or_array_pattern_key *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_assign_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Defparam_assign_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Generate_item_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_octdigits *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_expr_primary *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Lpvalue *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Label_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Escapedidentifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Generate_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_type_primitive *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Spec_reference_event *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_input_declaration_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Non_port_module_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    List_of_ports_or_port_declarations_trailing_comma_non_ansi *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_parameter_port_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_prefix_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expr_primary_braces *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Pow_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(For_init_decl_or_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_initial *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_list_paren_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Struct_data_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_sequ_entry *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Net_variable_or_decl_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_value_byname_list_trailing_comma *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Inc_or_dec_expression *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Net_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Select_dimensions_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Spec_polarity *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Macro_formal_parameter *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Structure_or_array_pattern_expression *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(For_step *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specparam_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_binbase *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_stringliteral *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Var_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Identifier_optional_unpacked_dimensions *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Function_item_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Type_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_body *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Mul_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Par_block *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Keywordidentifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Logeq_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_common_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Primitive_gate_instance *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_type_or_implicit *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_octbase *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_hexbase *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Seq_block *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Task_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_block *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_decnumber *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_decbase *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_implication_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Bit_logic_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Integer_atom_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Lifetime *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_argument_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay_value_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_port_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Jump_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay_value *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_or_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_attribute_foreign_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_direction_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_item_expr_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Cont_assign_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_argument_list_trailing_comma *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Procedural_continuous_assignment *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expression_or_dist *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_start *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expr_primary_parens *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Open_range_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Unary_prefix_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay_identifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_identifiers_unpacked_dimensions *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay_scope *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Action_block *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Trailing_assign_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Enum_name_list_trailing_comma *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_port_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Equiv_impl_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_new *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_net_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Unqualified_id *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Begin *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(System_tf_call *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_value_byname_list_item_last *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Conditional_generate_construct *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Timescale_directive *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_expression *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_sequ_entry_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Symbol_or_label *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Simple_sequence_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Systemtfidentifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_unbasednumber *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Decl_dimensions_opt *){};

void LivenessVisitor::visit(Class_items_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Enum_name *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_value_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_edge_path *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Implicit_class_handle *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Statement_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Type_identifier_followed_by_id *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Method_prototype *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Block_item_or_statement_or_null_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Endnew_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_item_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_simple_path_decl *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_rs_eq *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_import_item_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_port_decl *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(With_exprs_suffix *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Generate_region *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Call_base *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Array_locator_method *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_declaration_ansi *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Bitand_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Range_list_in_braces *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_parameter_port_list_item_last *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Hex_based_number *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Hierarchy_event_identifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_variable_decl_assignments *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Random_qualifier_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Drive_strength_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_timeliteral *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Value_range *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expr_mintypmax_generalized *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Polarity_operator *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(For_initialization *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Enum_data_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Blocking_assignment *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay1 *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Based_number *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Procedural_timing_control_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Block_item_decl *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Net_variable_or_decl_assigns *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Time_literal *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Function_item_data_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Decl_variable_dimension *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Endfunction_label_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Qualified_id *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Immediate_assertion_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Join_keyword *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_bindigits *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Event_trigger *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dynamic_array_new *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Matches_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_reference_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Array_reduction_method *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Builtin_array_method *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Assignment_pattern_expression *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Drive_strength *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_declaration_non_ansi *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_parameter_port_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Var_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_item_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_item_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    List_of_ports_or_port_declarations_item_last_ansi *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Data_type_or_implicit_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Xor_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dec_based_number *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Loop_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_declaration_or_module_instantiation *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_comb_entry_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Bit_logic *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Reference_or_call *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Local_root *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_direction *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Variable_decl_assignment *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_edge_path_decl *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Function_prototype *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_within_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expr_primary_no_groups *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_value_byname *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Case_any *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Spec_notifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Block_item_or_statement_or_null *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_param_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_list_trailing_comma *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Struct_union_member *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_port_list_positional *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dir *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Lifetime_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_identifiers *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Edge_operator *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_virtual_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Timeunits_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_item_or_statement_or_null *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_import_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expr_primary *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Signed_unsigned_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_comb_entry *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay3 *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Inc_or_dec_or_primary_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Procedural_assertion_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Struct_union_member_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Comp_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Postfix_expression *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Symbolidentifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_input_sym *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Pos_neg_number *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_terminal_descriptor *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Select_variable_dimension *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_ports_or_port_declarations_ansi *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Generate_case_items *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_type_primitive_scalar *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_item_or_statement_or_null_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Conditional_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specparam_decl *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_ports_or_port_declarations_non_ansi *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Statement_or_null_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Task_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_declaration_base *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_port_list_opt *){};

void LivenessVisitor::visit(Macronumericwidth *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Trailing_decl_assignment_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Gate_instance_or_register_variable *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Bind_instantiation *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_import_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_package_import_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Structure_or_array_pattern_expression_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Event_expression_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_rss_eq *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Implements_interface_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay3_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expr_mintypmax_trans_set *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Statement_or_null *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Enum_name_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_unary_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Pp_identifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Shift_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Oct_based_number *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Hierarchy_segment *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Nonblocking_assignment *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expression_list_proper *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Generate_if *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Function_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Scope_prefix *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Primitive_gate_instance_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Simple_immediate_assertion_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Description_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dr_strength0 *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Unique_priority_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specparam *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_expression_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Cond_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_reg_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Logor_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay3_or_drive_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_item_or_statement_or_null_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Net_decl_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Always_any *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_tf_variable_identifiers *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Var_or_net_type_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_list_item_last *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Task_declaration_id *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Instantiation_base *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_repetition_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_hexdigits *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Localparam_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_items *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expression_in_parens *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    List_of_ports_or_port_declarations_trailing_comma_ansi *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_reference *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dist_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Caseeq_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Generate_block *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    List_of_ports_or_port_declarations_item_last_non_ansi *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_argument_list_item_last *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Gate_instantiation *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Casting_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expr_mintypmax *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Continuous_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay_value_simple *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Switchtype *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_or_generate_item_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Bin_based_number *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Loop_generate_construct *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_override *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_primitive *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Repeat_control *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Packed_signing_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expression_or_null_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Enum_name_list_item_last *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Macro_formals_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Spec_notifier_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Hierarchy_extension *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Generate_item_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_declaration_modifiers_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_throughout_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_expr_or_assignment_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Bitor_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_port_list_trailing_comma_named *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Function_return_type_and_id *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dr_strength1 *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Assign_modify_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_port_decls *node) {
  context.push(IdentifierRenamingVisitor::ContextType::DECL);
  defaultVisitor(node);
  context.pop();
};

void LivenessVisitor::visit(Integer_vector_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Assignment_pattern *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_constructor *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_parameter_port *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_or_generate_item_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Final_construct *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Member_name *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_import_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Signing *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_constructor_prototype *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Generate_case_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expression *){};

void LivenessVisitor::visit(Cont_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay_or_event_control_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Bind_directive *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Misc_directive *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_initial_expr_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Description *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_type_base *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Trailing_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_end *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Wait_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Package_item_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Case_items *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Statement_or_null_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Port_named *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_output_sym *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Assignment_statement_no_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_port_list_item_last_positional *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_item_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_and_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Data_type *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Argument_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(For_step_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Sequence_intersect_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Function_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Net_type_or_none *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_declaration_extends_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Boolean_abbrev_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_path_identifiers *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_direction *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_decdigits *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(End *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Net_declaration *node) {
  context.push(IdentifierRenamingVisitor::ContextType::DECL);
  defaultVisitor(node);
  context.pop();
};

void LivenessVisitor::visit(Tk_tagged_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_xzdigits *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Gatetype *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Preprocess_include_argument *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Macro_formals_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Const_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Logand_expr *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Event_expression *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_entry_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Preprocessor_action *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_port_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_init_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Source_text *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Defparam_assign *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Decl_dimensions *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Constant_dec_number *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Case_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Assignment_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dpi_import_property_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Dpi_spec_string *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Trailing_decl_assignment *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Always_construct *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Genvar_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_port_list_named *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Subroutine_call *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_expr_or_assignment *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_argument *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_or_interface_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Expression_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Gate_instance_or_register_variable_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_evalstringliteral *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Delay_or_event_control *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Udp_input_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_value_byname_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_port_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_ports_or_port_declarations_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_port_list_trailing_comma_positional *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Block_item_or_statement_or_null_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Genvar_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Number *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specify_item_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_ls_eq *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tf_variable_identifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Initial_construct *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Localparam_assign_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Disable_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(List_of_module_item_identifiers *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Any_port_list_item_last_named *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Net_variable *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Parameter_expr_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Specparam_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Deferred_immediate_assertion_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Slice_size_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Concurrent_assertion_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Clocking_item_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Cycle_delay *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Macroiditem *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Assume_property_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Pull01 *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Preprocessor_directive *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_item_directive *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Assert_property_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Scope_or_if_res *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Task_prototype *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Clocking_declaration *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Block_identifier_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Macroidentifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_spec_disable_iff_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Macrogenericitem *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Module_block *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Stream_expression *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Final_or_zero *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Tk_edge_descriptor *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Method_property_qualifier_list_not_starting_with_virtual *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Identifier_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(
    Module_parameter_port_list_preprocessor_last *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Type_assignment *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Type_assignment_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Method_qualifier_list_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Stream_operator *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Assertion_item *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_spec *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Streaming_concatenation *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Edge_descriptor_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Property_qualifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Event_control_opt *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_item_qualifier *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Concurrent_assertion_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Cover_property_statement *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Stream_expression_list *node) {
  defaultVisitor(node);
};

void LivenessVisitor::visit(Class_item_qualifier_list_opt *node) {
  defaultVisitor(node);
};