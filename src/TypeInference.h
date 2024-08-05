#ifndef TYPE_INFERENCE_H
#define TYPE_INFERENCE_H

#include "Visitor.h"
#include <unordered_set>
#include <string>
#include <utility>

using constraintSet = std::unordered_set<std::pair<std::string&, std::string&>>;

class TypeInferenceVisitor : public Visitor<constraintSet>{
public:

  virtual constraintSet visit(Node *node) override;

  virtual constraintSet visit(Terminal *node) override;

  virtual constraintSet visit(Sequence_delay_range_expr *node) override;

  virtual constraintSet visit(Port *node) override;

  virtual constraintSet visit(Specify_simple_path *node) override;

  virtual constraintSet visit(Event_control *node) override;

  virtual constraintSet visit(String_literal *node) override;

  virtual constraintSet visit(Charge_strength_opt *node) override;

  virtual constraintSet visit(Dpi_import_export *node) override;

  virtual constraintSet visit(For_initialization_opt *node) override;

  virtual constraintSet visit(List_of_port_identifiers *node) override;

  virtual constraintSet visit(Non_integer_type *node) override;

  virtual constraintSet visit(Parameter_value_ranges_opt *node) override;

  virtual constraintSet visit(Package_item_no_pp *node) override;

  virtual constraintSet visit(Sequence_delay_repetition_list *node) override;

  virtual constraintSet visit(Add_expr *node) override;

  virtual constraintSet visit(Dpi_import_item *node) override;

  virtual constraintSet visit(Tk_realtime *node) override;

  virtual constraintSet visit(Case_item *node) override;

  virtual constraintSet visit(Property_if_else_expr *node) override;

  virtual constraintSet visit(Non_anonymous_instantiation_base *node) override;

  virtual constraintSet visit(Unary_expr *node) override;

  virtual constraintSet visit(Unary_op *node) override;

  virtual constraintSet visit(Class_id *node) override;

  virtual constraintSet visit(Reference *node) override;

  virtual constraintSet visit(Cast *node) override;

  virtual constraintSet visit(Tf_variable_identifier_first *node) override;

  virtual constraintSet
  visit(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
            *node) override;

  virtual constraintSet visit(Type_or_id_root *node) override;

  virtual constraintSet visit(Module_or_generate_item *node) override;

  virtual constraintSet visit(Module_parameter_port_list_trailing_comma *node) override;

  virtual constraintSet visit(Instantiation_type *node) override;

  virtual constraintSet visit(Parameters *node) override;

  virtual constraintSet visit(Reference_or_call_base *node) override;

  virtual constraintSet visit(Param_type_followed_by_id_and_dimensions_opt *node) override;

  virtual constraintSet visit(Structure_or_array_pattern_key *node) override;

  virtual constraintSet visit(Parameter_assign_list *node) override;

  virtual constraintSet visit(Defparam_assign_list *node) override;

  virtual constraintSet visit(Generate_item_list_opt *node) override;

  virtual constraintSet visit(Tk_octdigits *node) override;

  virtual constraintSet visit(Sequence_expr_primary *node) override;

  virtual constraintSet visit(Lpvalue *node) override;

  virtual constraintSet visit(Label_opt *node) override;

  virtual constraintSet visit(Escapedidentifier *node) override;

  virtual constraintSet visit(Generate_item *node) override;

  virtual constraintSet visit(Data_type_primitive *node) override;

  virtual constraintSet visit(Spec_reference_event *node) override;

  virtual constraintSet visit(Udp_input_declaration_list *node) override;

  virtual constraintSet visit(Non_port_module_item *node) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi *node) override;

  virtual constraintSet visit(Module_parameter_port_list_opt *node) override;

  virtual constraintSet visit(Property_prefix_expr *node) override;

  virtual constraintSet visit(Expr_primary_braces *node) override;

  virtual constraintSet visit(Pow_expr *node) override;

  virtual constraintSet visit(For_init_decl_or_assign *node) override;

  virtual constraintSet visit(Udp_initial *node) override;

  virtual constraintSet visit(Tf_port_list_paren_opt *node) override;

  virtual constraintSet visit(Struct_data_type *node) override;

  virtual constraintSet visit(Udp_sequ_entry *node) override;

  virtual constraintSet visit(Net_variable_or_decl_assign *node) override;

  virtual constraintSet visit(Parameter_value_byname_list_trailing_comma *node) override;

  virtual constraintSet visit(Inc_or_dec_expression *node) override;

  virtual constraintSet visit(Net_type *node) override;

  virtual constraintSet visit(Select_dimensions_opt *node) override;

  virtual constraintSet visit(Spec_polarity *node) override;

  virtual constraintSet visit(Macro_formal_parameter *node) override;

  virtual constraintSet visit(Structure_or_array_pattern_expression *node) override;

  virtual constraintSet visit(For_step *node) override;

  virtual constraintSet visit(Specparam_list *node) override;

  virtual constraintSet visit(Tk_binbase *node) override;

  virtual constraintSet visit(Tk_stringliteral *node) override;

  virtual constraintSet visit(Var_opt *node) override;

  virtual constraintSet visit(Identifier_optional_unpacked_dimensions *node) override;

  virtual constraintSet visit(Function_item_list *node) override;

  virtual constraintSet visit(Type_declaration *node) override;

  virtual constraintSet visit(Udp_body *node) override;

  virtual constraintSet visit(Mul_expr *node) override;

  virtual constraintSet visit(Par_block *node) override;

  virtual constraintSet visit(Keywordidentifier *node) override;

  virtual constraintSet visit(Logeq_expr *node) override;

  virtual constraintSet visit(Module_common_item *node) override;

  virtual constraintSet visit(Primitive_gate_instance *node) override;

  virtual constraintSet visit(Data_type_or_implicit *node) override;

  virtual constraintSet visit(Tk_octbase *node) override;

  virtual constraintSet visit(Sequence_expr *node) override;

  virtual constraintSet visit(Tk_hexbase *node) override;

  virtual constraintSet visit(Property_expr *node) override;

  virtual constraintSet visit(Seq_block *node) override;

  virtual constraintSet visit(Task_item *node) override;

  virtual constraintSet
  visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node) override;

  virtual constraintSet visit(Specify_block *node) override;

  virtual constraintSet visit(Tk_decnumber *node) override;

  virtual constraintSet visit(Tk_decbase *node) override;

  virtual constraintSet visit(Property_implication_expr *node) override;

  virtual constraintSet visit(Bit_logic_opt *node) override;

  virtual constraintSet visit(Integer_atom_type *node) override;

  virtual constraintSet visit(Lifetime *node) override;

  virtual constraintSet visit(Any_argument_list *node) override;

  virtual constraintSet visit(Delay_value_list *node) override;

  virtual constraintSet visit(Module_port_declaration *node) override;

  virtual constraintSet visit(Jump_statement *node) override;

  virtual constraintSet visit(Delay_value *node) override;

  virtual constraintSet visit(Sequence_or_expr *node) override;

  virtual constraintSet visit(Module_attribute_foreign_opt *node) override;

  virtual constraintSet visit(Tf_port_direction_opt *node) override;

  virtual constraintSet visit(Tf_port_item_expr_opt *node) override;

  virtual constraintSet visit(Cont_assign_list *node) override;

  virtual constraintSet visit(Any_argument_list_trailing_comma *node) override;

  virtual constraintSet visit(Procedural_continuous_assignment *node) override;

  virtual constraintSet visit(Expression_or_dist *node) override;

  virtual constraintSet visit(Module_start *node) override;

  virtual constraintSet visit(Expr_primary_parens *node) override;

  virtual constraintSet visit(Open_range_list *node) override;

  virtual constraintSet visit(Unary_prefix_expr *node) override;

  virtual constraintSet visit(Delay_identifier *node) override;

  virtual constraintSet visit(List_of_identifiers_unpacked_dimensions *node) override;

  virtual constraintSet visit(Delay_scope *node) override;

  virtual constraintSet visit(Action_block *node) override;

  virtual constraintSet visit(Trailing_assign_opt *node) override;

  virtual constraintSet visit(Class_item *node) override;

  virtual constraintSet visit(Enum_name_list_trailing_comma *node) override;

  virtual constraintSet visit(Udp_port_list *node) override;

  virtual constraintSet visit(Equiv_impl_expr *node) override;

  virtual constraintSet visit(Class_new *node) override;

  virtual constraintSet visit(Port_net_type *node) override;

  virtual constraintSet visit(Unqualified_id *node) override;

  virtual constraintSet visit(Begin *node) override;

  virtual constraintSet visit(System_tf_call *node) override;

  virtual constraintSet visit(Parameter_value_byname_list_item_last *node) override;

  virtual constraintSet visit(Conditional_generate_construct *node) override;

  virtual constraintSet visit(Timescale_directive *node) override;

  virtual constraintSet visit(Port_expression *node) override;

  virtual constraintSet visit(Udp_sequ_entry_list *node) override;

  virtual constraintSet visit(Symbol_or_label *node) override;

  virtual constraintSet visit(Simple_sequence_expr *node) override;

  virtual constraintSet visit(Systemtfidentifier *node) override;

  virtual constraintSet visit(Tk_unbasednumber *node) override;

  virtual constraintSet visit(Decl_dimensions_opt *node) override;

  virtual constraintSet visit(Class_items_opt *node) override;

  virtual constraintSet visit(Enum_name *node) override;

  virtual constraintSet visit(Parameter_value_opt *node) override;

  virtual constraintSet visit(Specify_edge_path *node) override;

  virtual constraintSet visit(Implicit_class_handle *node) override;

  virtual constraintSet visit(Module_item *node) override;

  virtual constraintSet visit(Statement_item *node) override;

  virtual constraintSet visit(Type_identifier_followed_by_id *node) override;

  virtual constraintSet visit(Method_prototype *node) override;

  virtual constraintSet visit(Tf_port_item *node) override;

  virtual constraintSet visit(Block_item_or_statement_or_null_list *node) override;

  virtual constraintSet visit(Endnew_opt *node) override;

  virtual constraintSet visit(Specify_item_list_opt *node) override;

  virtual constraintSet visit(Specify_simple_path_decl *node) override;

  virtual constraintSet visit(Tk_rs_eq *node) override;

  virtual constraintSet visit(Package_import_item_list *node) override;

  virtual constraintSet visit(Udp_port_decl *node) override;

  virtual constraintSet visit(With_exprs_suffix *node) override;

  virtual constraintSet visit(Generate_region *node) override;

  virtual constraintSet visit(Call_base *node) override;

  virtual constraintSet visit(Array_locator_method *node) override;

  virtual constraintSet visit(Port_declaration_ansi *node) override;

  virtual constraintSet visit(Bitand_expr *node) override;

  virtual constraintSet visit(Range_list_in_braces *node) override;

  virtual constraintSet visit(Module_parameter_port_list_item_last *node) override;

  virtual constraintSet visit(Hex_based_number *node) override;

  virtual constraintSet visit(Hierarchy_event_identifier *node) override;

  virtual constraintSet visit(List_of_variable_decl_assignments *node) override;

  virtual constraintSet visit(Random_qualifier_opt *node) override;

  virtual constraintSet visit(Drive_strength_opt *node) override;

  virtual constraintSet visit(Tk_timeliteral *node) override;

  virtual constraintSet visit(Value_range *node) override;

  virtual constraintSet visit(Expr_mintypmax_generalized *node) override;

  virtual constraintSet visit(Polarity_operator *node) override;

  virtual constraintSet visit(Package_item *node) override;

  virtual constraintSet visit(For_initialization *node) override;

  virtual constraintSet visit(Enum_data_type *node) override;

  virtual constraintSet visit(Blocking_assignment *node) override;

  virtual constraintSet visit(Delay1 *node) override;

  virtual constraintSet visit(Based_number *node) override;

  virtual constraintSet visit(Procedural_timing_control_statement *node) override;

  virtual constraintSet visit(Block_item_decl *node) override;

  virtual constraintSet visit(Net_variable_or_decl_assigns *node) override;

  virtual constraintSet visit(Time_literal *node) override;

  virtual constraintSet visit(Function_item_data_declaration *node) override;

  virtual constraintSet visit(Decl_variable_dimension *node) override;

  virtual constraintSet visit(Tf_port_list_opt *node) override;

  virtual constraintSet visit(Endfunction_label_opt *node) override;

  virtual constraintSet visit(Qualified_id *node) override;

  virtual constraintSet visit(Immediate_assertion_statement *node) override;

  virtual constraintSet visit(Join_keyword *node) override;

  virtual constraintSet visit(Tk_bindigits *node) override;

  virtual constraintSet visit(Event_trigger *node) override;

  virtual constraintSet visit(Dynamic_array_new *node) override;

  virtual constraintSet visit(Matches_expr *node) override;

  virtual constraintSet visit(Port_reference_list *node) override;

  virtual constraintSet visit(Array_reduction_method *node) override;

  virtual constraintSet visit(Builtin_array_method *node) override;

  virtual constraintSet visit(Package_declaration *node) override;

  virtual constraintSet visit(Assignment_pattern_expression *node) override;

  virtual constraintSet visit(Drive_strength *node) override;

  virtual constraintSet visit(Port_declaration_non_ansi *node) override;

  virtual constraintSet visit(Module_parameter_port_list *node) override;

  virtual constraintSet visit(Var_type *node) override;

  virtual constraintSet visit(Parameter_opt *node) override;

  virtual constraintSet visit(Module_item_list *node) override;

  virtual constraintSet visit(Genericidentifier *node) override;

  virtual constraintSet visit(Package_item_list_opt *node) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_item_last_ansi *node) override;

  virtual constraintSet
  visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node) override;

  virtual constraintSet visit(Xor_expr *node) override;

  virtual constraintSet visit(Dec_based_number *node) override;

  virtual constraintSet visit(Loop_statement *node) override;

  virtual constraintSet visit(Data_declaration_or_module_instantiation *node) override;

  virtual constraintSet visit(Udp_comb_entry_list *node) override;

  virtual constraintSet visit(Bit_logic *node) override;

  virtual constraintSet visit(Reference_or_call *node) override;

  virtual constraintSet visit(Local_root *node) override;

  virtual constraintSet visit(Port_direction *node) override;

  virtual constraintSet visit(Variable_decl_assignment *node) override;

  virtual constraintSet visit(Specify_edge_path_decl *node) override;

  virtual constraintSet visit(Function_prototype *node) override;

  virtual constraintSet visit(Sequence_within_expr *node) override;

  virtual constraintSet visit(Expr_primary_no_groups *node) override;

  virtual constraintSet visit(Parameter_value_byname *node) override;

  virtual constraintSet visit(Case_any *node) override;

  virtual constraintSet visit(Spec_notifier *node) override;

  virtual constraintSet visit(Block_item_or_statement_or_null *node) override;

  virtual constraintSet visit(Specify_item *node) override;

  virtual constraintSet visit(Any_param_declaration *node) override;

  virtual constraintSet visit(Tf_port_list_trailing_comma *node) override;

  virtual constraintSet visit(Struct_union_member *node) override;

  virtual constraintSet visit(Any_port_list_positional *node) override;

  virtual constraintSet visit(Dir *node) override;

  virtual constraintSet visit(Lifetime_opt *node) override;

  virtual constraintSet visit(List_of_identifiers *node) override;

  virtual constraintSet visit(Edge_operator *node) override;

  virtual constraintSet visit(Tk_virtual_opt *node) override;

  virtual constraintSet visit(Timeunits_declaration *node) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null *node) override;

  virtual constraintSet visit(Package_import_list *node) override;

  virtual constraintSet visit(Expr_primary *node) override;

  virtual constraintSet visit(Signed_unsigned_opt *node) override;

  virtual constraintSet visit(Non_anonymous_gate_instance_or_register_variable_list *node) override;

  virtual constraintSet visit(Udp_comb_entry *node) override;

  virtual constraintSet visit(Delay3 *node) override;

  virtual constraintSet visit(Inc_or_dec_or_primary_expr *node) override;

  virtual constraintSet visit(Procedural_assertion_statement *node) override;

  virtual constraintSet visit(Struct_union_member_list *node) override;

  virtual constraintSet visit(Comp_expr *node) override;

  virtual constraintSet visit(Postfix_expression *node) override;

  virtual constraintSet visit(Symbolidentifier *node) override;

  virtual constraintSet visit(Udp_input_sym *node) override;

  virtual constraintSet visit(Pos_neg_number *node) override;

  virtual constraintSet visit(Specify_terminal_descriptor *node) override;

  virtual constraintSet visit(Select_variable_dimension *node) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_ansi *node) override;

  virtual constraintSet visit(Generate_case_items *node) override;

  virtual constraintSet visit(Data_type_primitive_scalar *node) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null_list *node) override;

  virtual constraintSet visit(Conditional_statement *node) override;

  virtual constraintSet visit(Specparam_decl *node) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_non_ansi *node) override;

  virtual constraintSet visit(Statement_or_null_list *node) override;

  virtual constraintSet visit(Task_declaration *node) override;

  virtual constraintSet visit(Data_declaration_base *node) override;

  virtual constraintSet visit(Any_port_list_opt *node) override;

  virtual constraintSet visit(Macronumericwidth *node) override;

  virtual constraintSet visit(Trailing_decl_assignment_opt *node) override;

  virtual constraintSet visit(Gate_instance_or_register_variable *node) override;

  virtual constraintSet visit(Bind_instantiation *node) override;

  virtual constraintSet visit(Package_import_declaration *node) override;

  virtual constraintSet visit(Module_package_import_list_opt *node) override;

  virtual constraintSet visit(Structure_or_array_pattern_expression_list *node) override;

  virtual constraintSet visit(Event_expression_list *node) override;

  virtual constraintSet visit(Tk_rss_eq *node) override;

  virtual constraintSet visit(Implements_interface_list_opt *node) override;

  virtual constraintSet visit(Delay3_opt *node) override;

  virtual constraintSet visit(Expr_mintypmax_trans_set *node) override;

  virtual constraintSet visit(Statement_or_null *node) override;

  virtual constraintSet visit(Enum_name_list *node) override;

  virtual constraintSet visit(Sequence_unary_expr *node) override;

  virtual constraintSet visit(Pp_identifier *node) override;

  virtual constraintSet visit(Shift_expr *node) override;

  virtual constraintSet visit(Oct_based_number *node) override;

  virtual constraintSet visit(Hierarchy_segment *node) override;

  virtual constraintSet visit(Nonblocking_assignment *node) override;

  virtual constraintSet visit(Expression_list_proper *node) override;

  virtual constraintSet visit(Generate_if *node) override;

  virtual constraintSet visit(Function_item *node) override;

  virtual constraintSet visit(Scope_prefix *node) override;

  virtual constraintSet visit(Primitive_gate_instance_list *node) override;

  virtual constraintSet visit(Simple_immediate_assertion_statement *node) override;

  virtual constraintSet visit(Description_list *node) override;

  virtual constraintSet visit(Dr_strength0 *node) override;

  virtual constraintSet visit(Unique_priority_opt *node) override;

  virtual constraintSet visit(Specparam *node) override;

  virtual constraintSet visit(Port_expression_opt *node) override;

  virtual constraintSet visit(Cond_expr *node) override;

  virtual constraintSet visit(Tk_reg_opt *node) override;

  virtual constraintSet visit(Logor_expr *node) override;

  virtual constraintSet visit(Delay3_or_drive_opt *node) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null_list_opt *node) override;

  virtual constraintSet visit(Net_decl_assign *node) override;

  virtual constraintSet visit(Always_any *node) override;

  virtual constraintSet visit(List_of_tf_variable_identifiers *node) override;

  virtual constraintSet visit(Var_or_net_type_opt *node) override;

  virtual constraintSet visit(Tf_port_list_item_last *node) override;

  virtual constraintSet visit(Task_declaration_id *node) override;

  virtual constraintSet visit(Instantiation_base *node) override;

  virtual constraintSet visit(Sequence_repetition_expr *node) override;

  virtual constraintSet visit(Tk_hexdigits *node) override;

  virtual constraintSet visit(Non_anonymous_gate_instance_or_register_variable *node) override;

  virtual constraintSet visit(Localparam_assign *node) override;

  virtual constraintSet visit(Class_items *node) override;

  virtual constraintSet visit(Expression_in_parens *node) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node) override;

  virtual constraintSet visit(Port_reference *node) override;

  virtual constraintSet visit(Dist_opt *node) override;

  virtual constraintSet visit(Caseeq_expr *node) override;

  virtual constraintSet visit(Generate_block *node) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_item_last_non_ansi *node) override;

  virtual constraintSet visit(Any_argument_list_item_last *node) override;

  virtual constraintSet visit(Gate_instantiation *node) override;

  virtual constraintSet visit(Casting_type *node) override;

  virtual constraintSet visit(Expr_mintypmax *node) override;

  virtual constraintSet visit(Continuous_assign *node) override;

  virtual constraintSet visit(Parameter_assign *node) override;

  virtual constraintSet visit(Delay_value_simple *node) override;

  virtual constraintSet visit(Switchtype *node) override;

  virtual constraintSet visit(Package_or_generate_item_declaration *node) override;

  virtual constraintSet visit(Bin_based_number *node) override;

  virtual constraintSet visit(Loop_generate_construct *node) override;

  virtual constraintSet visit(Parameter_override *node) override;

  virtual constraintSet visit(Udp_primitive *node) override;

  virtual constraintSet visit(Parameter_expr *node) override;

  virtual constraintSet visit(Repeat_control *node) override;

  virtual constraintSet visit(Packed_signing_opt *node) override;

  virtual constraintSet visit(Expression_or_null_list_opt *node) override;

  virtual constraintSet visit(Enum_name_list_item_last *node) override;

  virtual constraintSet visit(Macro_formals_list_opt *node) override;

  virtual constraintSet visit(Spec_notifier_opt *node) override;

  virtual constraintSet visit(Hierarchy_extension *node) override;

  virtual constraintSet visit(Generate_item_list *node) override;

  virtual constraintSet visit(Data_declaration_modifiers_opt *node) override;

  virtual constraintSet visit(Sequence_throughout_expr *node) override;

  virtual constraintSet visit(Property_expr_or_assignment_list *node) override;

  virtual constraintSet visit(Bitor_expr *node) override;

  virtual constraintSet visit(Tf_port_list *node) override;

  virtual constraintSet visit(Any_port_list_trailing_comma_named *node) override;

  virtual constraintSet visit(Function_return_type_and_id *node) override;

  virtual constraintSet visit(Statement *node) override;

  virtual constraintSet visit(Dr_strength1 *node) override;

  virtual constraintSet visit(Assign_modify_statement *node) override;

  virtual constraintSet visit(Udp_port_decls *node) override;

  virtual constraintSet visit(Integer_vector_type *node) override;

  virtual constraintSet visit(Assignment_pattern *node) override;

  virtual constraintSet visit(Class_constructor *node) override;

  virtual constraintSet visit(Module_parameter_port *node) override;

  virtual constraintSet visit(Module_or_generate_item_declaration *node) override;

  virtual constraintSet visit(Final_construct *node) override;

  virtual constraintSet visit(Member_name *node) override;

  virtual constraintSet visit(Class_declaration *node) override;

  virtual constraintSet visit(Package_import_item *node) override;

  virtual constraintSet visit(Signing *node) override;

  virtual constraintSet visit(Class_constructor_prototype *node) override;

  virtual constraintSet visit(Generate_case_item *node) override;

  virtual constraintSet visit(Data_declaration *node) override;

  virtual constraintSet visit(Expression *node) override;

  virtual constraintSet visit(Cont_assign *node) override;

  virtual constraintSet visit(Delay_or_event_control_opt *node) override;

  virtual constraintSet visit(Bind_directive *node) override;

  virtual constraintSet visit(Misc_directive *node) override;

  virtual constraintSet visit(Udp_initial_expr_opt *node) override;

  virtual constraintSet visit(Description *node) override;

  virtual constraintSet visit(Data_type_base *node) override;

  virtual constraintSet visit(Trailing_assign *node) override;

  virtual constraintSet visit(Module_end *node) override;

  virtual constraintSet visit(Wait_statement *node) override;

  virtual constraintSet visit(Package_item_list *node) override;

  virtual constraintSet visit(Case_items *node) override;

  virtual constraintSet visit(Statement_or_null_list_opt *node) override;

  virtual constraintSet visit(Port_named *node) override;

  virtual constraintSet visit(Udp_output_sym *node) override;

  virtual constraintSet visit(Assignment_statement_no_expr *node) override;

  virtual constraintSet visit(Any_port_list_item_last_positional *node) override;

  virtual constraintSet visit(Module_item_list_opt *node) override;

  virtual constraintSet visit(Sequence_and_expr *node) override;

  virtual constraintSet visit(Data_type *node) override;

  virtual constraintSet visit(Argument_list_opt *node) override;

  virtual constraintSet visit(For_step_opt *node) override;

  virtual constraintSet visit(Sequence_intersect_expr *node) override;

  virtual constraintSet visit(Function_declaration *node) override;

  virtual constraintSet visit(Net_type_or_none *node) override;

  virtual constraintSet visit(Class_declaration_extends_opt *node) override;

  virtual constraintSet visit(Boolean_abbrev_opt *node) override;

  virtual constraintSet visit(Specify_path_identifiers *node) override;

  virtual constraintSet visit(Tf_port_direction *node) override;

  virtual constraintSet visit(Tk_decdigits *node) override;

  virtual constraintSet visit(End *node) override;

  virtual constraintSet visit(Net_declaration *node) override;

  virtual constraintSet visit(Tk_tagged_opt *node) override;

  virtual constraintSet visit(Tk_xzdigits *node) override;

  virtual constraintSet visit(Gatetype *node) override;

  virtual constraintSet visit(Preprocess_include_argument *node) override;

  virtual constraintSet visit(Macro_formals_list *node) override;

  virtual constraintSet visit(Const_opt *node) override;

  virtual constraintSet visit(Logand_expr *node) override;

  virtual constraintSet visit(Event_expression *node) override;

  virtual constraintSet visit(Udp_entry_list *node) override;

  virtual constraintSet visit(Preprocessor_action *node) override;

  virtual constraintSet visit(Tf_port_declaration *node) override;

  virtual constraintSet visit(Udp_init_opt *node) override;

  virtual constraintSet
  visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node) override;

  virtual constraintSet visit(Source_text *node) override;

  virtual constraintSet visit(Defparam_assign *node) override;

  virtual constraintSet visit(Decl_dimensions *node) override;

  virtual constraintSet visit(Constant_dec_number *node) override;

  virtual constraintSet visit(Case_statement *node) override;

  virtual constraintSet visit(Assignment_statement *node) override;

  virtual constraintSet visit(Dpi_import_property_opt *node) override;

  virtual constraintSet visit(Dpi_spec_string *node) override;

  virtual constraintSet visit(Trailing_decl_assignment *node) override;

  virtual constraintSet visit(Always_construct *node) override;

  virtual constraintSet visit(Genvar_opt *node) override;

  virtual constraintSet visit(Any_port_list_named *node) override;

  virtual constraintSet visit(Subroutine_call *node) override;

  virtual constraintSet visit(Property_expr_or_assignment *node) override;

  virtual constraintSet visit(Any_argument *node) override;

  virtual constraintSet visit(Module_or_interface_declaration *node) override;

  virtual constraintSet visit(Expression_opt *node) override;

  virtual constraintSet visit(Gate_instance_or_register_variable_list *node) override;

  virtual constraintSet visit(Tk_evalstringliteral *node) override;

  virtual constraintSet visit(Delay_or_event_control *node) override;

  virtual constraintSet visit(Udp_input_list *node) override;

  virtual constraintSet visit(Parameter_value_byname_list *node) override;

  virtual constraintSet visit(Module_port_list_opt *node) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_opt *node) override;

  virtual constraintSet visit(Any_port_list_trailing_comma_positional *node) override;

  virtual constraintSet visit(Block_item_or_statement_or_null_list_opt *node) override;

  virtual constraintSet visit(Genvar_declaration *node) override;

  virtual constraintSet visit(Number *node) override;

  virtual constraintSet visit(Specify_item_list *node) override;

  virtual constraintSet visit(Tk_ls_eq *node) override;

  virtual constraintSet visit(Tf_variable_identifier *node) override;

  virtual constraintSet visit(Initial_construct *node) override;

  virtual constraintSet visit(Localparam_assign_list *node) override;

  virtual constraintSet visit(Disable_statement *node) override;

  virtual constraintSet visit(List_of_module_item_identifiers *node) override;

  virtual constraintSet visit(Any_port_list_item_last_named *node) override;

  virtual constraintSet visit(Net_variable *node) override;

  virtual constraintSet visit(Parameter_expr_list *node) override;

  virtual constraintSet visit(Specparam_declaration *node) override;

  virtual constraintSet visit(Deferred_immediate_assertion_statement *node) override;

  virtual constraintSet visit(Slice_size_opt *node) override;

  virtual constraintSet visit(Concurrent_assertion_item *node) override;

  virtual constraintSet visit(Clocking_item_list_opt *node) override;

  virtual constraintSet visit(Cycle_delay *node) override;

  virtual constraintSet visit(Macroiditem *node) override;

  virtual constraintSet visit(Assume_property_statement *node) override;

  virtual constraintSet visit(Pull01 *node) override;

  virtual constraintSet visit(Preprocessor_directive *node) override;

  virtual constraintSet visit(Module_item_directive *node) override;

  virtual constraintSet visit(Assert_property_statement *node) override;

  virtual constraintSet visit(Scope_or_if_res *node) override;

  virtual constraintSet visit(Task_prototype *node) override;

  virtual constraintSet visit(Clocking_declaration *node) override;

  virtual constraintSet visit(Block_identifier_opt *node) override;

  virtual constraintSet visit(Macroidentifier *node) override;

  virtual constraintSet visit(Property_spec_disable_iff_opt *node) override;

  virtual constraintSet visit(Macrogenericitem *node) override;

  virtual constraintSet visit(Module_block *node) override;

  virtual constraintSet visit(Stream_expression *node) override;

  virtual constraintSet visit(Final_or_zero *node) override;

  virtual constraintSet visit(Tk_edge_descriptor *node) override;

  virtual constraintSet
  visit(Method_property_qualifier_list_not_starting_with_virtual *node) override;

  virtual constraintSet visit(Identifier_opt *node) override;

  virtual constraintSet visit(Module_parameter_port_list_preprocessor_last *node) override;

  virtual constraintSet visit(Type_assignment *node) override;

  virtual constraintSet visit(Type_assignment_list *node) override;

  virtual constraintSet visit(Method_qualifier_list_opt *node) override;

  virtual constraintSet visit(Stream_operator *node) override;

  virtual constraintSet visit(Assertion_item *node) override;

  virtual constraintSet visit(Property_spec *node) override;

  virtual constraintSet visit(Streaming_concatenation *node) override;

  virtual constraintSet visit(Edge_descriptor_list *node) override;

  virtual constraintSet visit(Property_qualifier *node) override;

  virtual constraintSet visit(Event_control_opt *node) override;

  virtual constraintSet visit(Class_item_qualifier *node) override;

  virtual constraintSet visit(Concurrent_assertion_statement *node) override;

  virtual constraintSet visit(Cover_property_statement *node) override;

  virtual constraintSet visit(Stream_expression_list *node) override;

  virtual constraintSet visit(Class_item_qualifier_list_opt *node) override;
};
#endif
