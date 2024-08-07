#ifndef TYPE_INFERENCE_H
#define TYPE_INFERENCE_H

#include "Visitor.h"
#include <cstdint>
#include <set>
#include <string>

using typeId = std::uint64_t;
using constraintSet = std::set<std::pair<typeId, typeId>>;

enum class CanonicalTypes : typeId {
  SCALAR,
  CONST_SCALAR,
  BIT,
  LOGIC,
  ANONYMOUS_GATE,
  GATE,
  INTEGER,
  FIRST_FRESH_TYPE // Marks the size of CanonicalTypes. Not meant to be used.
};

class TypeInferenceVisitor : public Visitor<constraintSet, typeId> {
private:
  typeId typeCounter =
      static_cast<uint64_t>(CanonicalTypes::FIRST_FRESH_TYPE);

  typeId TypeInferenceVisitor::freshType();

public:
  virtual constraintSet visit(Node *node, typeId type) override;

  virtual constraintSet visit(Terminal *node, typeId type) override;

  virtual constraintSet visit(Sequence_delay_range_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Port *node, typeId type) override;

  virtual constraintSet visit(Specify_simple_path *node,
                              typeId type) override;

  virtual constraintSet visit(Event_control *node, typeId type) override;

  virtual constraintSet visit(String_literal *node,
                              typeId type) override;

  virtual constraintSet visit(Charge_strength_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Dpi_import_export *node,
                              typeId type) override;

  virtual constraintSet visit(For_initialization_opt *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_port_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Non_integer_type *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_value_ranges_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Package_item_no_pp *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_delay_repetition_list *node,
                              typeId type) override;

  virtual constraintSet visit(Add_expr *node, typeId type) override;

  virtual constraintSet visit(Dpi_import_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_realtime *node, typeId type) override;

  virtual constraintSet visit(Case_item *node, typeId type) override;

  virtual constraintSet visit(Property_if_else_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Non_anonymous_instantiation_base *node,
                              typeId type) override;

  virtual constraintSet visit(Unary_expr *node, typeId type) override;

  virtual constraintSet visit(Unary_op *node, typeId type) override;

  virtual constraintSet visit(Class_id *node, typeId type) override;

  virtual constraintSet visit(Reference *node, typeId type) override;

  virtual constraintSet visit(Cast *node, typeId type) override;

  virtual constraintSet visit(Tf_variable_identifier_first *node,
                              typeId type) override;

  virtual constraintSet visit(
      Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt *node,
      typeId type) override;

  virtual constraintSet visit(Type_or_id_root *node,
                              typeId type) override;

  virtual constraintSet visit(Module_or_generate_item *node,
                              typeId type) override;

  virtual constraintSet visit(Module_parameter_port_list_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Instantiation_type *node,
                              typeId type) override;

  virtual constraintSet visit(Parameters *node, typeId type) override;

  virtual constraintSet visit(Reference_or_call_base *node,
                              typeId type) override;

  virtual constraintSet
  visit(Param_type_followed_by_id_and_dimensions_opt *node,
        typeId type) override;

  virtual constraintSet visit(Structure_or_array_pattern_key *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_assign_list *node,
                              typeId type) override;

  virtual constraintSet visit(Defparam_assign_list *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_octdigits *node, typeId type) override;

  virtual constraintSet visit(Sequence_expr_primary *node,
                              typeId type) override;

  virtual constraintSet visit(Lpvalue *node, typeId type) override;

  virtual constraintSet visit(Label_opt *node, typeId type) override;

  virtual constraintSet visit(Escapedidentifier *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_item *node, typeId type) override;

  virtual constraintSet visit(Data_type_primitive *node,
                              typeId type) override;

  virtual constraintSet visit(Spec_reference_event *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_input_declaration_list *node,
                              typeId type) override;

  virtual constraintSet visit(Non_port_module_item *node,
                              typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi *node,
        typeId type) override;

  virtual constraintSet visit(Module_parameter_port_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Property_prefix_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Expr_primary_braces *node,
                              typeId type) override;

  virtual constraintSet visit(Pow_expr *node, typeId type) override;

  virtual constraintSet visit(For_init_decl_or_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_initial *node, typeId type) override;

  virtual constraintSet visit(Tf_port_list_paren_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Struct_data_type *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_sequ_entry *node,
                              typeId type) override;

  virtual constraintSet visit(Net_variable_or_decl_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_value_byname_list_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Inc_or_dec_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Net_type *node, typeId type) override;

  virtual constraintSet visit(Select_dimensions_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Spec_polarity *node, typeId type) override;

  virtual constraintSet visit(Macro_formal_parameter *node,
                              typeId type) override;

  virtual constraintSet visit(Structure_or_array_pattern_expression *node,
                              typeId type) override;

  virtual constraintSet visit(For_step *node, typeId type) override;

  virtual constraintSet visit(Specparam_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_binbase *node, typeId type) override;

  virtual constraintSet visit(Tk_stringliteral *node,
                              typeId type) override;

  virtual constraintSet visit(Var_opt *node, typeId type) override;

  virtual constraintSet visit(Identifier_optional_unpacked_dimensions *node,
                              typeId type) override;

  virtual constraintSet visit(Function_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Type_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_body *node, typeId type) override;

  virtual constraintSet visit(Mul_expr *node, typeId type) override;

  virtual constraintSet visit(Par_block *node, typeId type) override;

  virtual constraintSet visit(Keywordidentifier *node,
                              typeId type) override;

  virtual constraintSet visit(Logeq_expr *node, typeId type) override;

  virtual constraintSet visit(Module_common_item *node,
                              typeId type) override;

  virtual constraintSet visit(Primitive_gate_instance *node,
                              typeId type) override;

  virtual constraintSet visit(Data_type_or_implicit *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_octbase *node, typeId type) override;

  virtual constraintSet visit(Sequence_expr *node, typeId type) override;

  virtual constraintSet visit(Tk_hexbase *node, typeId type) override;

  virtual constraintSet visit(Property_expr *node, typeId type) override;

  virtual constraintSet visit(Seq_block *node, typeId type) override;

  virtual constraintSet visit(Task_item *node, typeId type) override;

  virtual constraintSet
  visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node,
        typeId type) override;

  virtual constraintSet visit(Specify_block *node, typeId type) override;

  virtual constraintSet visit(Tk_decnumber *node, typeId type) override;

  virtual constraintSet visit(Tk_decbase *node, typeId type) override;

  virtual constraintSet visit(Property_implication_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Bit_logic_opt *node, typeId type) override;

  virtual constraintSet visit(Integer_atom_type *node,
                              typeId type) override;

  virtual constraintSet visit(Lifetime *node, typeId type) override;

  virtual constraintSet visit(Any_argument_list *node,
                              typeId type) override;

  virtual constraintSet visit(Delay_value_list *node,
                              typeId type) override;

  virtual constraintSet visit(Module_port_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Jump_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Delay_value *node, typeId type) override;

  virtual constraintSet visit(Sequence_or_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Module_attribute_foreign_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_direction_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_item_expr_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Cont_assign_list *node,
                              typeId type) override;

  virtual constraintSet visit(Any_argument_list_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Procedural_continuous_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Expression_or_dist *node,
                              typeId type) override;

  virtual constraintSet visit(Module_start *node, typeId type) override;

  virtual constraintSet visit(Expr_primary_parens *node,
                              typeId type) override;

  virtual constraintSet visit(Open_range_list *node,
                              typeId type) override;

  virtual constraintSet visit(Unary_prefix_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Delay_identifier *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_identifiers_unpacked_dimensions *node,
                              typeId type) override;

  virtual constraintSet visit(Delay_scope *node, typeId type) override;

  virtual constraintSet visit(Action_block *node, typeId type) override;

  virtual constraintSet visit(Trailing_assign_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Class_item *node, typeId type) override;

  virtual constraintSet visit(Enum_name_list_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_port_list *node, typeId type) override;

  virtual constraintSet visit(Equiv_impl_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Class_new *node, typeId type) override;

  virtual constraintSet visit(Port_net_type *node, typeId type) override;

  virtual constraintSet visit(Unqualified_id *node,
                              typeId type) override;

  virtual constraintSet visit(Begin *node, typeId type) override;

  virtual constraintSet visit(System_tf_call *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_value_byname_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Conditional_generate_construct *node,
                              typeId type) override;

  virtual constraintSet visit(Timescale_directive *node,
                              typeId type) override;

  virtual constraintSet visit(Port_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_sequ_entry_list *node,
                              typeId type) override;

  virtual constraintSet visit(Symbol_or_label *node,
                              typeId type) override;

  virtual constraintSet visit(Simple_sequence_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Systemtfidentifier *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_unbasednumber *node,
                              typeId type) override;

  virtual constraintSet visit(Decl_dimensions_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Class_items_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Enum_name *node, typeId type) override;

  virtual constraintSet visit(Parameter_value_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Specify_edge_path *node,
                              typeId type) override;

  virtual constraintSet visit(Implicit_class_handle *node,
                              typeId type) override;

  virtual constraintSet visit(Module_item *node, typeId type) override;

  virtual constraintSet visit(Statement_item *node,
                              typeId type) override;

  virtual constraintSet visit(Type_identifier_followed_by_id *node,
                              typeId type) override;

  virtual constraintSet visit(Method_prototype *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_item *node, typeId type) override;

  virtual constraintSet visit(Block_item_or_statement_or_null_list *node,
                              typeId type) override;

  virtual constraintSet visit(Endnew_opt *node, typeId type) override;

  virtual constraintSet visit(Specify_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Specify_simple_path_decl *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_rs_eq *node, typeId type) override;

  virtual constraintSet visit(Package_import_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_port_decl *node, typeId type) override;

  virtual constraintSet visit(With_exprs_suffix *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_region *node,
                              typeId type) override;

  virtual constraintSet visit(Call_base *node, typeId type) override;

  virtual constraintSet visit(Array_locator_method *node,
                              typeId type) override;

  virtual constraintSet visit(Port_declaration_ansi *node,
                              typeId type) override;

  virtual constraintSet visit(Bitand_expr *node, typeId type) override;

  virtual constraintSet visit(Range_list_in_braces *node,
                              typeId type) override;

  virtual constraintSet visit(Module_parameter_port_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Hex_based_number *node,
                              typeId type) override;

  virtual constraintSet visit(Hierarchy_event_identifier *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_variable_decl_assignments *node,
                              typeId type) override;

  virtual constraintSet visit(Random_qualifier_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Drive_strength_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_timeliteral *node,
                              typeId type) override;

  virtual constraintSet visit(Value_range *node, typeId type) override;

  virtual constraintSet visit(Expr_mintypmax_generalized *node,
                              typeId type) override;

  virtual constraintSet visit(Polarity_operator *node,
                              typeId type) override;

  virtual constraintSet visit(Package_item *node, typeId type) override;

  virtual constraintSet visit(For_initialization *node,
                              typeId type) override;

  virtual constraintSet visit(Enum_data_type *node,
                              typeId type) override;

  virtual constraintSet visit(Blocking_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Delay1 *node, typeId type) override;

  virtual constraintSet visit(Based_number *node, typeId type) override;

  virtual constraintSet visit(Procedural_timing_control_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Block_item_decl *node,
                              typeId type) override;

  virtual constraintSet visit(Net_variable_or_decl_assigns *node,
                              typeId type) override;

  virtual constraintSet visit(Time_literal *node, typeId type) override;

  virtual constraintSet visit(Function_item_data_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Decl_variable_dimension *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Endfunction_label_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Qualified_id *node, typeId type) override;

  virtual constraintSet visit(Immediate_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Join_keyword *node, typeId type) override;

  virtual constraintSet visit(Tk_bindigits *node, typeId type) override;

  virtual constraintSet visit(Event_trigger *node, typeId type) override;

  virtual constraintSet visit(Dynamic_array_new *node,
                              typeId type) override;

  virtual constraintSet visit(Matches_expr *node, typeId type) override;

  virtual constraintSet visit(Port_reference_list *node,
                              typeId type) override;

  virtual constraintSet visit(Array_reduction_method *node,
                              typeId type) override;

  virtual constraintSet visit(Builtin_array_method *node,
                              typeId type) override;

  virtual constraintSet visit(Package_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Assignment_pattern_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Drive_strength *node,
                              typeId type) override;

  virtual constraintSet visit(Port_declaration_non_ansi *node,
                              typeId type) override;

  virtual constraintSet visit(Module_parameter_port_list *node,
                              typeId type) override;

  virtual constraintSet visit(Var_type *node, typeId type) override;

  virtual constraintSet visit(Parameter_opt *node, typeId type) override;

  virtual constraintSet visit(Module_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Genericidentifier *node,
                              typeId type) override;

  virtual constraintSet visit(Package_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_item_last_ansi *node,
        typeId type) override;

  virtual constraintSet
  visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node,
        typeId type) override;

  virtual constraintSet visit(Xor_expr *node, typeId type) override;

  virtual constraintSet visit(Dec_based_number *node,
                              typeId type) override;

  virtual constraintSet visit(Loop_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Data_declaration_or_module_instantiation *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_comb_entry_list *node,
                              typeId type) override;

  virtual constraintSet visit(Bit_logic *node, typeId type) override;

  virtual constraintSet visit(Reference_or_call *node,
                              typeId type) override;

  virtual constraintSet visit(Local_root *node, typeId type) override;

  virtual constraintSet visit(Port_direction *node,
                              typeId type) override;

  virtual constraintSet visit(Variable_decl_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Specify_edge_path_decl *node,
                              typeId type) override;

  virtual constraintSet visit(Function_prototype *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_within_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Expr_primary_no_groups *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_value_byname *node,
                              typeId type) override;

  virtual constraintSet visit(Case_any *node, typeId type) override;

  virtual constraintSet visit(Spec_notifier *node, typeId type) override;

  virtual constraintSet visit(Block_item_or_statement_or_null *node,
                              typeId type) override;

  virtual constraintSet visit(Specify_item *node, typeId type) override;

  virtual constraintSet visit(Any_param_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_list_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Struct_union_member *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_positional *node,
                              typeId type) override;

  virtual constraintSet visit(Dir *node, typeId type) override;

  virtual constraintSet visit(Lifetime_opt *node, typeId type) override;

  virtual constraintSet visit(List_of_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Edge_operator *node, typeId type) override;

  virtual constraintSet visit(Tk_virtual_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Timeunits_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null *node,
                              typeId type) override;

  virtual constraintSet visit(Package_import_list *node,
                              typeId type) override;

  virtual constraintSet visit(Expr_primary *node, typeId type) override;

  virtual constraintSet visit(Signed_unsigned_opt *node,
                              typeId type) override;

  virtual constraintSet
  visit(Non_anonymous_gate_instance_or_register_variable_list *node,
        typeId type) override;

  virtual constraintSet visit(Udp_comb_entry *node,
                              typeId type) override;

  virtual constraintSet visit(Delay3 *node, typeId type) override;

  virtual constraintSet visit(Inc_or_dec_or_primary_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Procedural_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Struct_union_member_list *node,
                              typeId type) override;

  virtual constraintSet visit(Comp_expr *node, typeId type) override;

  virtual constraintSet visit(Postfix_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Symbolidentifier *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_input_sym *node, typeId type) override;

  virtual constraintSet visit(Pos_neg_number *node,
                              typeId type) override;

  virtual constraintSet visit(Specify_terminal_descriptor *node,
                              typeId type) override;

  virtual constraintSet visit(Select_variable_dimension *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_ansi *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_case_items *node,
                              typeId type) override;

  virtual constraintSet visit(Data_type_primitive_scalar *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null_list *node,
                              typeId type) override;

  virtual constraintSet visit(Conditional_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Specparam_decl *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_non_ansi *node,
                              typeId type) override;

  virtual constraintSet visit(Statement_or_null_list *node,
                              typeId type) override;

  virtual constraintSet visit(Task_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Data_declaration_base *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Macronumericwidth *node,
                              typeId type) override;

  virtual constraintSet visit(Trailing_decl_assignment_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Gate_instance_or_register_variable *node,
                              typeId type) override;

  virtual constraintSet visit(Bind_instantiation *node,
                              typeId type) override;

  virtual constraintSet visit(Package_import_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Module_package_import_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Structure_or_array_pattern_expression_list *node,
                              typeId type) override;

  virtual constraintSet visit(Event_expression_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_rss_eq *node, typeId type) override;

  virtual constraintSet visit(Implements_interface_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Delay3_opt *node, typeId type) override;

  virtual constraintSet visit(Expr_mintypmax_trans_set *node,
                              typeId type) override;

  virtual constraintSet visit(Statement_or_null *node,
                              typeId type) override;

  virtual constraintSet visit(Enum_name_list *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_unary_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Pp_identifier *node, typeId type) override;

  virtual constraintSet visit(Shift_expr *node, typeId type) override;

  virtual constraintSet visit(Oct_based_number *node,
                              typeId type) override;

  virtual constraintSet visit(Hierarchy_segment *node,
                              typeId type) override;

  virtual constraintSet visit(Nonblocking_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Expression_list_proper *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_if *node, typeId type) override;

  virtual constraintSet visit(Function_item *node, typeId type) override;

  virtual constraintSet visit(Scope_prefix *node, typeId type) override;

  virtual constraintSet visit(Primitive_gate_instance_list *node,
                              typeId type) override;

  virtual constraintSet visit(Simple_immediate_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Description_list *node,
                              typeId type) override;

  virtual constraintSet visit(Dr_strength0 *node, typeId type) override;

  virtual constraintSet visit(Unique_priority_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Specparam *node, typeId type) override;

  virtual constraintSet visit(Port_expression_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Cond_expr *node, typeId type) override;

  virtual constraintSet visit(Tk_reg_opt *node, typeId type) override;

  virtual constraintSet visit(Logor_expr *node, typeId type) override;

  virtual constraintSet visit(Delay3_or_drive_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Net_decl_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Always_any *node, typeId type) override;

  virtual constraintSet visit(List_of_tf_variable_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Var_or_net_type_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Task_declaration_id *node,
                              typeId type) override;

  virtual constraintSet visit(Instantiation_base *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_repetition_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_hexdigits *node, typeId type) override;

  virtual constraintSet
  visit(Non_anonymous_gate_instance_or_register_variable *node,
        typeId type) override;

  virtual constraintSet visit(Localparam_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Class_items *node, typeId type) override;

  virtual constraintSet visit(Expression_in_parens *node,
                              typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node,
        typeId type) override;

  virtual constraintSet visit(Port_reference *node,
                              typeId type) override;

  virtual constraintSet visit(Dist_opt *node, typeId type) override;

  virtual constraintSet visit(Caseeq_expr *node, typeId type) override;

  virtual constraintSet visit(Generate_block *node,
                              typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_item_last_non_ansi *node,
        typeId type) override;

  virtual constraintSet visit(Any_argument_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Gate_instantiation *node,
                              typeId type) override;

  virtual constraintSet visit(Casting_type *node, typeId type) override;

  virtual constraintSet visit(Expr_mintypmax *node,
                              typeId type) override;

  virtual constraintSet visit(Continuous_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Delay_value_simple *node,
                              typeId type) override;

  virtual constraintSet visit(Switchtype *node, typeId type) override;

  virtual constraintSet visit(Package_or_generate_item_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Bin_based_number *node,
                              typeId type) override;

  virtual constraintSet visit(Loop_generate_construct *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_override *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_primitive *node, typeId type) override;

  virtual constraintSet visit(Parameter_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Repeat_control *node,
                              typeId type) override;

  virtual constraintSet visit(Packed_signing_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Expression_or_null_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Enum_name_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Macro_formals_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Spec_notifier_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Hierarchy_extension *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Data_declaration_modifiers_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_throughout_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Property_expr_or_assignment_list *node,
                              typeId type) override;

  virtual constraintSet visit(Bitor_expr *node, typeId type) override;

  virtual constraintSet visit(Tf_port_list *node, typeId type) override;

  virtual constraintSet visit(Any_port_list_trailing_comma_named *node,
                              typeId type) override;

  virtual constraintSet visit(Function_return_type_and_id *node,
                              typeId type) override;

  virtual constraintSet visit(Statement *node, typeId type) override;

  virtual constraintSet visit(Dr_strength1 *node, typeId type) override;

  virtual constraintSet visit(Assign_modify_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_port_decls *node,
                              typeId type) override;

  virtual constraintSet visit(Integer_vector_type *node,
                              typeId type) override;

  virtual constraintSet visit(Assignment_pattern *node,
                              typeId type) override;

  virtual constraintSet visit(Class_constructor *node,
                              typeId type) override;

  virtual constraintSet visit(Module_parameter_port *node,
                              typeId type) override;

  virtual constraintSet visit(Module_or_generate_item_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Final_construct *node,
                              typeId type) override;

  virtual constraintSet visit(Member_name *node, typeId type) override;

  virtual constraintSet visit(Class_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Package_import_item *node,
                              typeId type) override;

  virtual constraintSet visit(Signing *node, typeId type) override;

  virtual constraintSet visit(Class_constructor_prototype *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_case_item *node,
                              typeId type) override;

  virtual constraintSet visit(Data_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Expression *node, typeId type) override;

  virtual constraintSet visit(Cont_assign *node, typeId type) override;

  virtual constraintSet visit(Delay_or_event_control_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Bind_directive *node,
                              typeId type) override;

  virtual constraintSet visit(Misc_directive *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_initial_expr_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Description *node, typeId type) override;

  virtual constraintSet visit(Data_type_base *node,
                              typeId type) override;

  virtual constraintSet visit(Trailing_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Module_end *node, typeId type) override;

  virtual constraintSet visit(Wait_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Package_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Case_items *node, typeId type) override;

  virtual constraintSet visit(Statement_or_null_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Port_named *node, typeId type) override;

  virtual constraintSet visit(Udp_output_sym *node,
                              typeId type) override;

  virtual constraintSet visit(Assignment_statement_no_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_item_last_positional *node,
                              typeId type) override;

  virtual constraintSet visit(Module_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_and_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Data_type *node, typeId type) override;

  virtual constraintSet visit(Argument_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(For_step_opt *node, typeId type) override;

  virtual constraintSet visit(Sequence_intersect_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Function_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Net_type_or_none *node,
                              typeId type) override;

  virtual constraintSet visit(Class_declaration_extends_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Boolean_abbrev_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Specify_path_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_direction *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_decdigits *node, typeId type) override;

  virtual constraintSet visit(End *node, typeId type) override;

  virtual constraintSet visit(Net_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_tagged_opt *node, typeId type) override;

  virtual constraintSet visit(Tk_xzdigits *node, typeId type) override;

  virtual constraintSet visit(Gatetype *node, typeId type) override;

  virtual constraintSet visit(Preprocess_include_argument *node,
                              typeId type) override;

  virtual constraintSet visit(Macro_formals_list *node,
                              typeId type) override;

  virtual constraintSet visit(Const_opt *node, typeId type) override;

  virtual constraintSet visit(Logand_expr *node, typeId type) override;

  virtual constraintSet visit(Event_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_entry_list *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_action *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_init_opt *node, typeId type) override;

  virtual constraintSet
  visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node,
        typeId type) override;

  virtual constraintSet visit(Source_text *node, typeId type) override;

  virtual constraintSet visit(Defparam_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Decl_dimensions *node,
                              typeId type) override;

  virtual constraintSet visit(Constant_dec_number *node,
                              typeId type) override;

  virtual constraintSet visit(Case_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Assignment_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Dpi_import_property_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Dpi_spec_string *node,
                              typeId type) override;

  virtual constraintSet visit(Trailing_decl_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Always_construct *node,
                              typeId type) override;

  virtual constraintSet visit(Genvar_opt *node, typeId type) override;

  virtual constraintSet visit(Any_port_list_named *node,
                              typeId type) override;

  virtual constraintSet visit(Subroutine_call *node,
                              typeId type) override;

  virtual constraintSet visit(Property_expr_or_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Any_argument *node, typeId type) override;

  virtual constraintSet visit(Module_or_interface_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Expression_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Gate_instance_or_register_variable_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_evalstringliteral *node,
                              typeId type) override;

  virtual constraintSet visit(Delay_or_event_control *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_input_list *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_value_byname_list *node,
                              typeId type) override;

  virtual constraintSet visit(Module_port_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_trailing_comma_positional *node,
                              typeId type) override;

  virtual constraintSet visit(Block_item_or_statement_or_null_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Genvar_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Number *node, typeId type) override;

  virtual constraintSet visit(Specify_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_ls_eq *node, typeId type) override;

  virtual constraintSet visit(Tf_variable_identifier *node,
                              typeId type) override;

  virtual constraintSet visit(Initial_construct *node,
                              typeId type) override;

  virtual constraintSet visit(Localparam_assign_list *node,
                              typeId type) override;

  virtual constraintSet visit(Disable_statement *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_module_item_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_item_last_named *node,
                              typeId type) override;

  virtual constraintSet visit(Net_variable *node, typeId type) override;

  virtual constraintSet visit(Parameter_expr_list *node,
                              typeId type) override;

  virtual constraintSet visit(Specparam_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Deferred_immediate_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Slice_size_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Concurrent_assertion_item *node,
                              typeId type) override;

  virtual constraintSet visit(Clocking_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Cycle_delay *node, typeId type) override;

  virtual constraintSet visit(Macroiditem *node, typeId type) override;

  virtual constraintSet visit(Assume_property_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Pull01 *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_directive *node,
                              typeId type) override;

  virtual constraintSet visit(Module_item_directive *node,
                              typeId type) override;

  virtual constraintSet visit(Assert_property_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Scope_or_if_res *node,
                              typeId type) override;

  virtual constraintSet visit(Task_prototype *node,
                              typeId type) override;

  virtual constraintSet visit(Clocking_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Block_identifier_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Macroidentifier *node,
                              typeId type) override;

  virtual constraintSet visit(Property_spec_disable_iff_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Macrogenericitem *node,
                              typeId type) override;

  virtual constraintSet visit(Module_block *node, typeId type) override;

  virtual constraintSet visit(Stream_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Final_or_zero *node, typeId type) override;

  virtual constraintSet visit(Tk_edge_descriptor *node,
                              typeId type) override;

  virtual constraintSet
  visit(Method_property_qualifier_list_not_starting_with_virtual *node,
        typeId type) override;

  virtual constraintSet visit(Identifier_opt *node,
                              typeId type) override;

  virtual constraintSet
  visit(Module_parameter_port_list_preprocessor_last *node,
        typeId type) override;

  virtual constraintSet visit(Type_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Type_assignment_list *node,
                              typeId type) override;

  virtual constraintSet visit(Method_qualifier_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Stream_operator *node,
                              typeId type) override;

  virtual constraintSet visit(Assertion_item *node,
                              typeId type) override;

  virtual constraintSet visit(Property_spec *node, typeId type) override;

  virtual constraintSet visit(Streaming_concatenation *node,
                              typeId type) override;

  virtual constraintSet visit(Edge_descriptor_list *node,
                              typeId type) override;

  virtual constraintSet visit(Property_qualifier *node,
                              typeId type) override;

  virtual constraintSet visit(Event_control_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Class_item_qualifier *node,
                              typeId type) override;

  virtual constraintSet visit(Concurrent_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Cover_property_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Stream_expression_list *node,
                              typeId type) override;

  virtual constraintSet visit(Class_item_qualifier_list_opt *node,
                              typeId type) override;
};
#endif
