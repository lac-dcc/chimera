#ifndef TYPE_INFERENCE_H
#define TYPE_INFERENCE_H

#include "Visitor.h"
#include <unordered_set>
#include <string>
#include <set>

using constraintSet = std::set<std::pair<std::string, std::string>>;

class TypeInferenceVisitor : public Visitor<constraintSet, std::string&>{
public:
  uint typeCounter = 0;
  std::string TypeInferenceVisitor::freshType();
  virtual constraintSet visit(Node *node, std::string& type) override;

  virtual constraintSet visit(Terminal *node, std::string& type) override;

  virtual constraintSet visit(Sequence_delay_range_expr *node, std::string& type) override;

  virtual constraintSet visit(Port *node, std::string& type) override;

  virtual constraintSet visit(Specify_simple_path *node, std::string& type) override;

  virtual constraintSet visit(Event_control *node, std::string& type) override;

  virtual constraintSet visit(String_literal *node, std::string& type) override;

  virtual constraintSet visit(Charge_strength_opt *node, std::string& type) override;

  virtual constraintSet visit(Dpi_import_export *node, std::string& type) override;

  virtual constraintSet visit(For_initialization_opt *node, std::string& type) override;

  virtual constraintSet visit(List_of_port_identifiers *node, std::string& type) override;

  virtual constraintSet visit(Non_integer_type *node, std::string& type) override;

  virtual constraintSet visit(Parameter_value_ranges_opt *node, std::string& type) override;

  virtual constraintSet visit(Package_item_no_pp *node, std::string& type) override;

  virtual constraintSet visit(Sequence_delay_repetition_list *node, std::string& type) override;

  virtual constraintSet visit(Add_expr *node, std::string& type) override;

  virtual constraintSet visit(Dpi_import_item *node, std::string& type) override;

  virtual constraintSet visit(Tk_realtime *node, std::string& type) override;

  virtual constraintSet visit(Case_item *node, std::string& type) override;

  virtual constraintSet visit(Property_if_else_expr *node, std::string& type) override;

  virtual constraintSet visit(Non_anonymous_instantiation_base *node, std::string& type) override;

  virtual constraintSet visit(Unary_expr *node, std::string& type) override;

  virtual constraintSet visit(Unary_op *node, std::string& type) override;

  virtual constraintSet visit(Class_id *node, std::string& type) override;

  virtual constraintSet visit(Reference *node, std::string& type) override;

  virtual constraintSet visit(Cast *node, std::string& type) override;

  virtual constraintSet visit(Tf_variable_identifier_first *node, std::string& type) override;

  virtual constraintSet
  visit(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
            *node, std::string& type) override;

  virtual constraintSet visit(Type_or_id_root *node, std::string& type) override;

  virtual constraintSet visit(Module_or_generate_item *node, std::string& type) override;

  virtual constraintSet visit(Module_parameter_port_list_trailing_comma *node, std::string& type) override;

  virtual constraintSet visit(Instantiation_type *node, std::string& type) override;

  virtual constraintSet visit(Parameters *node, std::string& type) override;

  virtual constraintSet visit(Reference_or_call_base *node, std::string& type) override;

  virtual constraintSet visit(Param_type_followed_by_id_and_dimensions_opt *node, std::string& type) override;

  virtual constraintSet visit(Structure_or_array_pattern_key *node, std::string& type) override;

  virtual constraintSet visit(Parameter_assign_list *node, std::string& type) override;

  virtual constraintSet visit(Defparam_assign_list *node, std::string& type) override;

  virtual constraintSet visit(Generate_item_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Tk_octdigits *node, std::string& type) override;

  virtual constraintSet visit(Sequence_expr_primary *node, std::string& type) override;

  virtual constraintSet visit(Lpvalue *node, std::string& type) override;

  virtual constraintSet visit(Label_opt *node, std::string& type) override;

  virtual constraintSet visit(Escapedidentifier *node, std::string& type) override;

  virtual constraintSet visit(Generate_item *node, std::string& type) override;

  virtual constraintSet visit(Data_type_primitive *node, std::string& type) override;

  virtual constraintSet visit(Spec_reference_event *node, std::string& type) override;

  virtual constraintSet visit(Udp_input_declaration_list *node, std::string& type) override;

  virtual constraintSet visit(Non_port_module_item *node, std::string& type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi *node, std::string& type) override;

  virtual constraintSet visit(Module_parameter_port_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Property_prefix_expr *node, std::string& type) override;

  virtual constraintSet visit(Expr_primary_braces *node, std::string& type) override;

  virtual constraintSet visit(Pow_expr *node, std::string& type) override;

  virtual constraintSet visit(For_init_decl_or_assign *node, std::string& type) override;

  virtual constraintSet visit(Udp_initial *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_list_paren_opt *node, std::string& type) override;

  virtual constraintSet visit(Struct_data_type *node, std::string& type) override;

  virtual constraintSet visit(Udp_sequ_entry *node, std::string& type) override;

  virtual constraintSet visit(Net_variable_or_decl_assign *node, std::string& type) override;

  virtual constraintSet visit(Parameter_value_byname_list_trailing_comma *node, std::string& type) override;

  virtual constraintSet visit(Inc_or_dec_expression *node, std::string& type) override;

  virtual constraintSet visit(Net_type *node, std::string& type) override;

  virtual constraintSet visit(Select_dimensions_opt *node, std::string& type) override;

  virtual constraintSet visit(Spec_polarity *node, std::string& type) override;

  virtual constraintSet visit(Macro_formal_parameter *node, std::string& type) override;

  virtual constraintSet visit(Structure_or_array_pattern_expression *node, std::string& type) override;

  virtual constraintSet visit(For_step *node, std::string& type) override;

  virtual constraintSet visit(Specparam_list *node, std::string& type) override;

  virtual constraintSet visit(Tk_binbase *node, std::string& type) override;

  virtual constraintSet visit(Tk_stringliteral *node, std::string& type) override;

  virtual constraintSet visit(Var_opt *node, std::string& type) override;

  virtual constraintSet visit(Identifier_optional_unpacked_dimensions *node, std::string& type) override;

  virtual constraintSet visit(Function_item_list *node, std::string& type) override;

  virtual constraintSet visit(Type_declaration *node, std::string& type) override;

  virtual constraintSet visit(Udp_body *node, std::string& type) override;

  virtual constraintSet visit(Mul_expr *node, std::string& type) override;

  virtual constraintSet visit(Par_block *node, std::string& type) override;

  virtual constraintSet visit(Keywordidentifier *node, std::string& type) override;

  virtual constraintSet visit(Logeq_expr *node, std::string& type) override;

  virtual constraintSet visit(Module_common_item *node, std::string& type) override;

  virtual constraintSet visit(Primitive_gate_instance *node, std::string& type) override;

  virtual constraintSet visit(Data_type_or_implicit *node, std::string& type) override;

  virtual constraintSet visit(Tk_octbase *node, std::string& type) override;

  virtual constraintSet visit(Sequence_expr *node, std::string& type) override;

  virtual constraintSet visit(Tk_hexbase *node, std::string& type) override;

  virtual constraintSet visit(Property_expr *node, std::string& type) override;

  virtual constraintSet visit(Seq_block *node, std::string& type) override;

  virtual constraintSet visit(Task_item *node, std::string& type) override;

  virtual constraintSet
  visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node, std::string& type) override;

  virtual constraintSet visit(Specify_block *node, std::string& type) override;

  virtual constraintSet visit(Tk_decnumber *node, std::string& type) override;

  virtual constraintSet visit(Tk_decbase *node, std::string& type) override;

  virtual constraintSet visit(Property_implication_expr *node, std::string& type) override;

  virtual constraintSet visit(Bit_logic_opt *node, std::string& type) override;

  virtual constraintSet visit(Integer_atom_type *node, std::string& type) override;

  virtual constraintSet visit(Lifetime *node, std::string& type) override;

  virtual constraintSet visit(Any_argument_list *node, std::string& type) override;

  virtual constraintSet visit(Delay_value_list *node, std::string& type) override;

  virtual constraintSet visit(Module_port_declaration *node, std::string& type) override;

  virtual constraintSet visit(Jump_statement *node, std::string& type) override;

  virtual constraintSet visit(Delay_value *node, std::string& type) override;

  virtual constraintSet visit(Sequence_or_expr *node, std::string& type) override;

  virtual constraintSet visit(Module_attribute_foreign_opt *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_direction_opt *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_item_expr_opt *node, std::string& type) override;

  virtual constraintSet visit(Cont_assign_list *node, std::string& type) override;

  virtual constraintSet visit(Any_argument_list_trailing_comma *node, std::string& type) override;

  virtual constraintSet visit(Procedural_continuous_assignment *node, std::string& type) override;

  virtual constraintSet visit(Expression_or_dist *node, std::string& type) override;

  virtual constraintSet visit(Module_start *node, std::string& type) override;

  virtual constraintSet visit(Expr_primary_parens *node, std::string& type) override;

  virtual constraintSet visit(Open_range_list *node, std::string& type) override;

  virtual constraintSet visit(Unary_prefix_expr *node, std::string& type) override;

  virtual constraintSet visit(Delay_identifier *node, std::string& type) override;

  virtual constraintSet visit(List_of_identifiers_unpacked_dimensions *node, std::string& type) override;

  virtual constraintSet visit(Delay_scope *node, std::string& type) override;

  virtual constraintSet visit(Action_block *node, std::string& type) override;

  virtual constraintSet visit(Trailing_assign_opt *node, std::string& type) override;

  virtual constraintSet visit(Class_item *node, std::string& type) override;

  virtual constraintSet visit(Enum_name_list_trailing_comma *node, std::string& type) override;

  virtual constraintSet visit(Udp_port_list *node, std::string& type) override;

  virtual constraintSet visit(Equiv_impl_expr *node, std::string& type) override;

  virtual constraintSet visit(Class_new *node, std::string& type) override;

  virtual constraintSet visit(Port_net_type *node, std::string& type) override;

  virtual constraintSet visit(Unqualified_id *node, std::string& type) override;

  virtual constraintSet visit(Begin *node, std::string& type) override;

  virtual constraintSet visit(System_tf_call *node, std::string& type) override;

  virtual constraintSet visit(Parameter_value_byname_list_item_last *node, std::string& type) override;

  virtual constraintSet visit(Conditional_generate_construct *node, std::string& type) override;

  virtual constraintSet visit(Timescale_directive *node, std::string& type) override;

  virtual constraintSet visit(Port_expression *node, std::string& type) override;

  virtual constraintSet visit(Udp_sequ_entry_list *node, std::string& type) override;

  virtual constraintSet visit(Symbol_or_label *node, std::string& type) override;

  virtual constraintSet visit(Simple_sequence_expr *node, std::string& type) override;

  virtual constraintSet visit(Systemtfidentifier *node, std::string& type) override;

  virtual constraintSet visit(Tk_unbasednumber *node, std::string& type) override;

  virtual constraintSet visit(Decl_dimensions_opt *node, std::string& type) override;

  virtual constraintSet visit(Class_items_opt *node, std::string& type) override;

  virtual constraintSet visit(Enum_name *node, std::string& type) override;

  virtual constraintSet visit(Parameter_value_opt *node, std::string& type) override;

  virtual constraintSet visit(Specify_edge_path *node, std::string& type) override;

  virtual constraintSet visit(Implicit_class_handle *node, std::string& type) override;

  virtual constraintSet visit(Module_item *node, std::string& type) override;

  virtual constraintSet visit(Statement_item *node, std::string& type) override;

  virtual constraintSet visit(Type_identifier_followed_by_id *node, std::string& type) override;

  virtual constraintSet visit(Method_prototype *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_item *node, std::string& type) override;

  virtual constraintSet visit(Block_item_or_statement_or_null_list *node, std::string& type) override;

  virtual constraintSet visit(Endnew_opt *node, std::string& type) override;

  virtual constraintSet visit(Specify_item_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Specify_simple_path_decl *node, std::string& type) override;

  virtual constraintSet visit(Tk_rs_eq *node, std::string& type) override;

  virtual constraintSet visit(Package_import_item_list *node, std::string& type) override;

  virtual constraintSet visit(Udp_port_decl *node, std::string& type) override;

  virtual constraintSet visit(With_exprs_suffix *node, std::string& type) override;

  virtual constraintSet visit(Generate_region *node, std::string& type) override;

  virtual constraintSet visit(Call_base *node, std::string& type) override;

  virtual constraintSet visit(Array_locator_method *node, std::string& type) override;

  virtual constraintSet visit(Port_declaration_ansi *node, std::string& type) override;

  virtual constraintSet visit(Bitand_expr *node, std::string& type) override;

  virtual constraintSet visit(Range_list_in_braces *node, std::string& type) override;

  virtual constraintSet visit(Module_parameter_port_list_item_last *node, std::string& type) override;

  virtual constraintSet visit(Hex_based_number *node, std::string& type) override;

  virtual constraintSet visit(Hierarchy_event_identifier *node, std::string& type) override;

  virtual constraintSet visit(List_of_variable_decl_assignments *node, std::string& type) override;

  virtual constraintSet visit(Random_qualifier_opt *node, std::string& type) override;

  virtual constraintSet visit(Drive_strength_opt *node, std::string& type) override;

  virtual constraintSet visit(Tk_timeliteral *node, std::string& type) override;

  virtual constraintSet visit(Value_range *node, std::string& type) override;

  virtual constraintSet visit(Expr_mintypmax_generalized *node, std::string& type) override;

  virtual constraintSet visit(Polarity_operator *node, std::string& type) override;

  virtual constraintSet visit(Package_item *node, std::string& type) override;

  virtual constraintSet visit(For_initialization *node, std::string& type) override;

  virtual constraintSet visit(Enum_data_type *node, std::string& type) override;

  virtual constraintSet visit(Blocking_assignment *node, std::string& type) override;

  virtual constraintSet visit(Delay1 *node, std::string& type) override;

  virtual constraintSet visit(Based_number *node, std::string& type) override;

  virtual constraintSet visit(Procedural_timing_control_statement *node, std::string& type) override;

  virtual constraintSet visit(Block_item_decl *node, std::string& type) override;

  virtual constraintSet visit(Net_variable_or_decl_assigns *node, std::string& type) override;

  virtual constraintSet visit(Time_literal *node, std::string& type) override;

  virtual constraintSet visit(Function_item_data_declaration *node, std::string& type) override;

  virtual constraintSet visit(Decl_variable_dimension *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Endfunction_label_opt *node, std::string& type) override;

  virtual constraintSet visit(Qualified_id *node, std::string& type) override;

  virtual constraintSet visit(Immediate_assertion_statement *node, std::string& type) override;

  virtual constraintSet visit(Join_keyword *node, std::string& type) override;

  virtual constraintSet visit(Tk_bindigits *node, std::string& type) override;

  virtual constraintSet visit(Event_trigger *node, std::string& type) override;

  virtual constraintSet visit(Dynamic_array_new *node, std::string& type) override;

  virtual constraintSet visit(Matches_expr *node, std::string& type) override;

  virtual constraintSet visit(Port_reference_list *node, std::string& type) override;

  virtual constraintSet visit(Array_reduction_method *node, std::string& type) override;

  virtual constraintSet visit(Builtin_array_method *node, std::string& type) override;

  virtual constraintSet visit(Package_declaration *node, std::string& type) override;

  virtual constraintSet visit(Assignment_pattern_expression *node, std::string& type) override;

  virtual constraintSet visit(Drive_strength *node, std::string& type) override;

  virtual constraintSet visit(Port_declaration_non_ansi *node, std::string& type) override;

  virtual constraintSet visit(Module_parameter_port_list *node, std::string& type) override;

  virtual constraintSet visit(Var_type *node, std::string& type) override;

  virtual constraintSet visit(Parameter_opt *node, std::string& type) override;

  virtual constraintSet visit(Module_item_list *node, std::string& type) override;

  virtual constraintSet visit(Genericidentifier *node, std::string& type) override;

  virtual constraintSet visit(Package_item_list_opt *node, std::string& type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_item_last_ansi *node, std::string& type) override;

  virtual constraintSet
  visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node, std::string& type) override;

  virtual constraintSet visit(Xor_expr *node, std::string& type) override;

  virtual constraintSet visit(Dec_based_number *node, std::string& type) override;

  virtual constraintSet visit(Loop_statement *node, std::string& type) override;

  virtual constraintSet visit(Data_declaration_or_module_instantiation *node, std::string& type) override;

  virtual constraintSet visit(Udp_comb_entry_list *node, std::string& type) override;

  virtual constraintSet visit(Bit_logic *node, std::string& type) override;

  virtual constraintSet visit(Reference_or_call *node, std::string& type) override;

  virtual constraintSet visit(Local_root *node, std::string& type) override;

  virtual constraintSet visit(Port_direction *node, std::string& type) override;

  virtual constraintSet visit(Variable_decl_assignment *node, std::string& type) override;

  virtual constraintSet visit(Specify_edge_path_decl *node, std::string& type) override;

  virtual constraintSet visit(Function_prototype *node, std::string& type) override;

  virtual constraintSet visit(Sequence_within_expr *node, std::string& type) override;

  virtual constraintSet visit(Expr_primary_no_groups *node, std::string& type) override;

  virtual constraintSet visit(Parameter_value_byname *node, std::string& type) override;

  virtual constraintSet visit(Case_any *node, std::string& type) override;

  virtual constraintSet visit(Spec_notifier *node, std::string& type) override;

  virtual constraintSet visit(Block_item_or_statement_or_null *node, std::string& type) override;

  virtual constraintSet visit(Specify_item *node, std::string& type) override;

  virtual constraintSet visit(Any_param_declaration *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_list_trailing_comma *node, std::string& type) override;

  virtual constraintSet visit(Struct_union_member *node, std::string& type) override;

  virtual constraintSet visit(Any_port_list_positional *node, std::string& type) override;

  virtual constraintSet visit(Dir *node, std::string& type) override;

  virtual constraintSet visit(Lifetime_opt *node, std::string& type) override;

  virtual constraintSet visit(List_of_identifiers *node, std::string& type) override;

  virtual constraintSet visit(Edge_operator *node, std::string& type) override;

  virtual constraintSet visit(Tk_virtual_opt *node, std::string& type) override;

  virtual constraintSet visit(Timeunits_declaration *node, std::string& type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null *node, std::string& type) override;

  virtual constraintSet visit(Package_import_list *node, std::string& type) override;

  virtual constraintSet visit(Expr_primary *node, std::string& type) override;

  virtual constraintSet visit(Signed_unsigned_opt *node, std::string& type) override;

  virtual constraintSet visit(Non_anonymous_gate_instance_or_register_variable_list *node, std::string& type) override;

  virtual constraintSet visit(Udp_comb_entry *node, std::string& type) override;

  virtual constraintSet visit(Delay3 *node, std::string& type) override;

  virtual constraintSet visit(Inc_or_dec_or_primary_expr *node, std::string& type) override;

  virtual constraintSet visit(Procedural_assertion_statement *node, std::string& type) override;

  virtual constraintSet visit(Struct_union_member_list *node, std::string& type) override;

  virtual constraintSet visit(Comp_expr *node, std::string& type) override;

  virtual constraintSet visit(Postfix_expression *node, std::string& type) override;

  virtual constraintSet visit(Symbolidentifier *node, std::string& type) override;

  virtual constraintSet visit(Udp_input_sym *node, std::string& type) override;

  virtual constraintSet visit(Pos_neg_number *node, std::string& type) override;

  virtual constraintSet visit(Specify_terminal_descriptor *node, std::string& type) override;

  virtual constraintSet visit(Select_variable_dimension *node, std::string& type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_ansi *node, std::string& type) override;

  virtual constraintSet visit(Generate_case_items *node, std::string& type) override;

  virtual constraintSet visit(Data_type_primitive_scalar *node, std::string& type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null_list *node, std::string& type) override;

  virtual constraintSet visit(Conditional_statement *node, std::string& type) override;

  virtual constraintSet visit(Specparam_decl *node, std::string& type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_non_ansi *node, std::string& type) override;

  virtual constraintSet visit(Statement_or_null_list *node, std::string& type) override;

  virtual constraintSet visit(Task_declaration *node, std::string& type) override;

  virtual constraintSet visit(Data_declaration_base *node, std::string& type) override;

  virtual constraintSet visit(Any_port_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Macronumericwidth *node, std::string& type) override;

  virtual constraintSet visit(Trailing_decl_assignment_opt *node, std::string& type) override;

  virtual constraintSet visit(Gate_instance_or_register_variable *node, std::string& type) override;

  virtual constraintSet visit(Bind_instantiation *node, std::string& type) override;

  virtual constraintSet visit(Package_import_declaration *node, std::string& type) override;

  virtual constraintSet visit(Module_package_import_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Structure_or_array_pattern_expression_list *node, std::string& type) override;

  virtual constraintSet visit(Event_expression_list *node, std::string& type) override;

  virtual constraintSet visit(Tk_rss_eq *node, std::string& type) override;

  virtual constraintSet visit(Implements_interface_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Delay3_opt *node, std::string& type) override;

  virtual constraintSet visit(Expr_mintypmax_trans_set *node, std::string& type) override;

  virtual constraintSet visit(Statement_or_null *node, std::string& type) override;

  virtual constraintSet visit(Enum_name_list *node, std::string& type) override;

  virtual constraintSet visit(Sequence_unary_expr *node, std::string& type) override;

  virtual constraintSet visit(Pp_identifier *node, std::string& type) override;

  virtual constraintSet visit(Shift_expr *node, std::string& type) override;

  virtual constraintSet visit(Oct_based_number *node, std::string& type) override;

  virtual constraintSet visit(Hierarchy_segment *node, std::string& type) override;

  virtual constraintSet visit(Nonblocking_assignment *node, std::string& type) override;

  virtual constraintSet visit(Expression_list_proper *node, std::string& type) override;

  virtual constraintSet visit(Generate_if *node, std::string& type) override;

  virtual constraintSet visit(Function_item *node, std::string& type) override;

  virtual constraintSet visit(Scope_prefix *node, std::string& type) override;

  virtual constraintSet visit(Primitive_gate_instance_list *node, std::string& type) override;

  virtual constraintSet visit(Simple_immediate_assertion_statement *node, std::string& type) override;

  virtual constraintSet visit(Description_list *node, std::string& type) override;

  virtual constraintSet visit(Dr_strength0 *node, std::string& type) override;

  virtual constraintSet visit(Unique_priority_opt *node, std::string& type) override;

  virtual constraintSet visit(Specparam *node, std::string& type) override;

  virtual constraintSet visit(Port_expression_opt *node, std::string& type) override;

  virtual constraintSet visit(Cond_expr *node, std::string& type) override;

  virtual constraintSet visit(Tk_reg_opt *node, std::string& type) override;

  virtual constraintSet visit(Logor_expr *node, std::string& type) override;

  virtual constraintSet visit(Delay3_or_drive_opt *node, std::string& type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Net_decl_assign *node, std::string& type) override;

  virtual constraintSet visit(Always_any *node, std::string& type) override;

  virtual constraintSet visit(List_of_tf_variable_identifiers *node, std::string& type) override;

  virtual constraintSet visit(Var_or_net_type_opt *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_list_item_last *node, std::string& type) override;

  virtual constraintSet visit(Task_declaration_id *node, std::string& type) override;

  virtual constraintSet visit(Instantiation_base *node, std::string& type) override;

  virtual constraintSet visit(Sequence_repetition_expr *node, std::string& type) override;

  virtual constraintSet visit(Tk_hexdigits *node, std::string& type) override;

  virtual constraintSet visit(Non_anonymous_gate_instance_or_register_variable *node, std::string& type) override;

  virtual constraintSet visit(Localparam_assign *node, std::string& type) override;

  virtual constraintSet visit(Class_items *node, std::string& type) override;

  virtual constraintSet visit(Expression_in_parens *node, std::string& type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node, std::string& type) override;

  virtual constraintSet visit(Port_reference *node, std::string& type) override;

  virtual constraintSet visit(Dist_opt *node, std::string& type) override;

  virtual constraintSet visit(Caseeq_expr *node, std::string& type) override;

  virtual constraintSet visit(Generate_block *node, std::string& type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_item_last_non_ansi *node, std::string& type) override;

  virtual constraintSet visit(Any_argument_list_item_last *node, std::string& type) override;

  virtual constraintSet visit(Gate_instantiation *node, std::string& type) override;

  virtual constraintSet visit(Casting_type *node, std::string& type) override;

  virtual constraintSet visit(Expr_mintypmax *node, std::string& type) override;

  virtual constraintSet visit(Continuous_assign *node, std::string& type) override;

  virtual constraintSet visit(Parameter_assign *node, std::string& type) override;

  virtual constraintSet visit(Delay_value_simple *node, std::string& type) override;

  virtual constraintSet visit(Switchtype *node, std::string& type) override;

  virtual constraintSet visit(Package_or_generate_item_declaration *node, std::string& type) override;

  virtual constraintSet visit(Bin_based_number *node, std::string& type) override;

  virtual constraintSet visit(Loop_generate_construct *node, std::string& type) override;

  virtual constraintSet visit(Parameter_override *node, std::string& type) override;

  virtual constraintSet visit(Udp_primitive *node, std::string& type) override;

  virtual constraintSet visit(Parameter_expr *node, std::string& type) override;

  virtual constraintSet visit(Repeat_control *node, std::string& type) override;

  virtual constraintSet visit(Packed_signing_opt *node, std::string& type) override;

  virtual constraintSet visit(Expression_or_null_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Enum_name_list_item_last *node, std::string& type) override;

  virtual constraintSet visit(Macro_formals_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Spec_notifier_opt *node, std::string& type) override;

  virtual constraintSet visit(Hierarchy_extension *node, std::string& type) override;

  virtual constraintSet visit(Generate_item_list *node, std::string& type) override;

  virtual constraintSet visit(Data_declaration_modifiers_opt *node, std::string& type) override;

  virtual constraintSet visit(Sequence_throughout_expr *node, std::string& type) override;

  virtual constraintSet visit(Property_expr_or_assignment_list *node, std::string& type) override;

  virtual constraintSet visit(Bitor_expr *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_list *node, std::string& type) override;

  virtual constraintSet visit(Any_port_list_trailing_comma_named *node, std::string& type) override;

  virtual constraintSet visit(Function_return_type_and_id *node, std::string& type) override;

  virtual constraintSet visit(Statement *node, std::string& type) override;

  virtual constraintSet visit(Dr_strength1 *node, std::string& type) override;

  virtual constraintSet visit(Assign_modify_statement *node, std::string& type) override;

  virtual constraintSet visit(Udp_port_decls *node, std::string& type) override;

  virtual constraintSet visit(Integer_vector_type *node, std::string& type) override;

  virtual constraintSet visit(Assignment_pattern *node, std::string& type) override;

  virtual constraintSet visit(Class_constructor *node, std::string& type) override;

  virtual constraintSet visit(Module_parameter_port *node, std::string& type) override;

  virtual constraintSet visit(Module_or_generate_item_declaration *node, std::string& type) override;

  virtual constraintSet visit(Final_construct *node, std::string& type) override;

  virtual constraintSet visit(Member_name *node, std::string& type) override;

  virtual constraintSet visit(Class_declaration *node, std::string& type) override;

  virtual constraintSet visit(Package_import_item *node, std::string& type) override;

  virtual constraintSet visit(Signing *node, std::string& type) override;

  virtual constraintSet visit(Class_constructor_prototype *node, std::string& type) override;

  virtual constraintSet visit(Generate_case_item *node, std::string& type) override;

  virtual constraintSet visit(Data_declaration *node, std::string& type) override;

  virtual constraintSet visit(Expression *node, std::string& type) override;

  virtual constraintSet visit(Cont_assign *node, std::string& type) override;

  virtual constraintSet visit(Delay_or_event_control_opt *node, std::string& type) override;

  virtual constraintSet visit(Bind_directive *node, std::string& type) override;

  virtual constraintSet visit(Misc_directive *node, std::string& type) override;

  virtual constraintSet visit(Udp_initial_expr_opt *node, std::string& type) override;

  virtual constraintSet visit(Description *node, std::string& type) override;

  virtual constraintSet visit(Data_type_base *node, std::string& type) override;

  virtual constraintSet visit(Trailing_assign *node, std::string& type) override;

  virtual constraintSet visit(Module_end *node, std::string& type) override;

  virtual constraintSet visit(Wait_statement *node, std::string& type) override;

  virtual constraintSet visit(Package_item_list *node, std::string& type) override;

  virtual constraintSet visit(Case_items *node, std::string& type) override;

  virtual constraintSet visit(Statement_or_null_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Port_named *node, std::string& type) override;

  virtual constraintSet visit(Udp_output_sym *node, std::string& type) override;

  virtual constraintSet visit(Assignment_statement_no_expr *node, std::string& type) override;

  virtual constraintSet visit(Any_port_list_item_last_positional *node, std::string& type) override;

  virtual constraintSet visit(Module_item_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Sequence_and_expr *node, std::string& type) override;

  virtual constraintSet visit(Data_type *node, std::string& type) override;

  virtual constraintSet visit(Argument_list_opt *node, std::string& type) override;

  virtual constraintSet visit(For_step_opt *node, std::string& type) override;

  virtual constraintSet visit(Sequence_intersect_expr *node, std::string& type) override;

  virtual constraintSet visit(Function_declaration *node, std::string& type) override;

  virtual constraintSet visit(Net_type_or_none *node, std::string& type) override;

  virtual constraintSet visit(Class_declaration_extends_opt *node, std::string& type) override;

  virtual constraintSet visit(Boolean_abbrev_opt *node, std::string& type) override;

  virtual constraintSet visit(Specify_path_identifiers *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_direction *node, std::string& type) override;

  virtual constraintSet visit(Tk_decdigits *node, std::string& type) override;

  virtual constraintSet visit(End *node, std::string& type) override;

  virtual constraintSet visit(Net_declaration *node, std::string& type) override;

  virtual constraintSet visit(Tk_tagged_opt *node, std::string& type) override;

  virtual constraintSet visit(Tk_xzdigits *node, std::string& type) override;

  virtual constraintSet visit(Gatetype *node, std::string& type) override;

  virtual constraintSet visit(Preprocess_include_argument *node, std::string& type) override;

  virtual constraintSet visit(Macro_formals_list *node, std::string& type) override;

  virtual constraintSet visit(Const_opt *node, std::string& type) override;

  virtual constraintSet visit(Logand_expr *node, std::string& type) override;

  virtual constraintSet visit(Event_expression *node, std::string& type) override;

  virtual constraintSet visit(Udp_entry_list *node, std::string& type) override;

  virtual constraintSet visit(Preprocessor_action *node, std::string& type) override;

  virtual constraintSet visit(Tf_port_declaration *node, std::string& type) override;

  virtual constraintSet visit(Udp_init_opt *node, std::string& type) override;

  virtual constraintSet
  visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node, std::string& type) override;

  virtual constraintSet visit(Source_text *node, std::string& type) override;

  virtual constraintSet visit(Defparam_assign *node, std::string& type) override;

  virtual constraintSet visit(Decl_dimensions *node, std::string& type) override;

  virtual constraintSet visit(Constant_dec_number *node, std::string& type) override;

  virtual constraintSet visit(Case_statement *node, std::string& type) override;

  virtual constraintSet visit(Assignment_statement *node, std::string& type) override;

  virtual constraintSet visit(Dpi_import_property_opt *node, std::string& type) override;

  virtual constraintSet visit(Dpi_spec_string *node, std::string& type) override;

  virtual constraintSet visit(Trailing_decl_assignment *node, std::string& type) override;

  virtual constraintSet visit(Always_construct *node, std::string& type) override;

  virtual constraintSet visit(Genvar_opt *node, std::string& type) override;

  virtual constraintSet visit(Any_port_list_named *node, std::string& type) override;

  virtual constraintSet visit(Subroutine_call *node, std::string& type) override;

  virtual constraintSet visit(Property_expr_or_assignment *node, std::string& type) override;

  virtual constraintSet visit(Any_argument *node, std::string& type) override;

  virtual constraintSet visit(Module_or_interface_declaration *node, std::string& type) override;

  virtual constraintSet visit(Expression_opt *node, std::string& type) override;

  virtual constraintSet visit(Gate_instance_or_register_variable_list *node, std::string& type) override;

  virtual constraintSet visit(Tk_evalstringliteral *node, std::string& type) override;

  virtual constraintSet visit(Delay_or_event_control *node, std::string& type) override;

  virtual constraintSet visit(Udp_input_list *node, std::string& type) override;

  virtual constraintSet visit(Parameter_value_byname_list *node, std::string& type) override;

  virtual constraintSet visit(Module_port_list_opt *node, std::string& type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_opt *node, std::string& type) override;

  virtual constraintSet visit(Any_port_list_trailing_comma_positional *node, std::string& type) override;

  virtual constraintSet visit(Block_item_or_statement_or_null_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Genvar_declaration *node, std::string& type) override;

  virtual constraintSet visit(Number *node, std::string& type) override;

  virtual constraintSet visit(Specify_item_list *node, std::string& type) override;

  virtual constraintSet visit(Tk_ls_eq *node, std::string& type) override;

  virtual constraintSet visit(Tf_variable_identifier *node, std::string& type) override;

  virtual constraintSet visit(Initial_construct *node, std::string& type) override;

  virtual constraintSet visit(Localparam_assign_list *node, std::string& type) override;

  virtual constraintSet visit(Disable_statement *node, std::string& type) override;

  virtual constraintSet visit(List_of_module_item_identifiers *node, std::string& type) override;

  virtual constraintSet visit(Any_port_list_item_last_named *node, std::string& type) override;

  virtual constraintSet visit(Net_variable *node, std::string& type) override;

  virtual constraintSet visit(Parameter_expr_list *node, std::string& type) override;

  virtual constraintSet visit(Specparam_declaration *node, std::string& type) override;

  virtual constraintSet visit(Deferred_immediate_assertion_statement *node, std::string& type) override;

  virtual constraintSet visit(Slice_size_opt *node, std::string& type) override;

  virtual constraintSet visit(Concurrent_assertion_item *node, std::string& type) override;

  virtual constraintSet visit(Clocking_item_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Cycle_delay *node, std::string& type) override;

  virtual constraintSet visit(Macroiditem *node, std::string& type) override;

  virtual constraintSet visit(Assume_property_statement *node, std::string& type) override;

  virtual constraintSet visit(Pull01 *node, std::string& type) override;

  virtual constraintSet visit(Preprocessor_directive *node, std::string& type) override;

  virtual constraintSet visit(Module_item_directive *node, std::string& type) override;

  virtual constraintSet visit(Assert_property_statement *node, std::string& type) override;

  virtual constraintSet visit(Scope_or_if_res *node, std::string& type) override;

  virtual constraintSet visit(Task_prototype *node, std::string& type) override;

  virtual constraintSet visit(Clocking_declaration *node, std::string& type) override;

  virtual constraintSet visit(Block_identifier_opt *node, std::string& type) override;

  virtual constraintSet visit(Macroidentifier *node, std::string& type) override;

  virtual constraintSet visit(Property_spec_disable_iff_opt *node, std::string& type) override;

  virtual constraintSet visit(Macrogenericitem *node, std::string& type) override;

  virtual constraintSet visit(Module_block *node, std::string& type) override;

  virtual constraintSet visit(Stream_expression *node, std::string& type) override;

  virtual constraintSet visit(Final_or_zero *node, std::string& type) override;

  virtual constraintSet visit(Tk_edge_descriptor *node, std::string& type) override;

  virtual constraintSet
  visit(Method_property_qualifier_list_not_starting_with_virtual *node, std::string& type) override;

  virtual constraintSet visit(Identifier_opt *node, std::string& type) override;

  virtual constraintSet visit(Module_parameter_port_list_preprocessor_last *node, std::string& type) override;

  virtual constraintSet visit(Type_assignment *node, std::string& type) override;

  virtual constraintSet visit(Type_assignment_list *node, std::string& type) override;

  virtual constraintSet visit(Method_qualifier_list_opt *node, std::string& type) override;

  virtual constraintSet visit(Stream_operator *node, std::string& type) override;

  virtual constraintSet visit(Assertion_item *node, std::string& type) override;

  virtual constraintSet visit(Property_spec *node, std::string& type) override;

  virtual constraintSet visit(Streaming_concatenation *node, std::string& type) override;

  virtual constraintSet visit(Edge_descriptor_list *node, std::string& type) override;

  virtual constraintSet visit(Property_qualifier *node, std::string& type) override;

  virtual constraintSet visit(Event_control_opt *node, std::string& type) override;

  virtual constraintSet visit(Class_item_qualifier *node, std::string& type) override;

  virtual constraintSet visit(Concurrent_assertion_statement *node, std::string& type) override;

  virtual constraintSet visit(Cover_property_statement *node, std::string& type) override;

  virtual constraintSet visit(Stream_expression_list *node, std::string& type) override;

  virtual constraintSet visit(Class_item_qualifier_list_opt *node, std::string& type) override;
};
#endif
