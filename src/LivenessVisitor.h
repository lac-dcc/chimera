#ifndef CHIMERA_LIVENESS_H
#define CHIMERA_LIVENESS_H

#include "AST.h"
#include "IdentifierRenamingVisitor.h"
#include "TypeInference.h"
#include "Visitor.h"
#include <set>
#include <stack>
#include <vector>

class ProgramPoint {
public:
  Node *programPoint;
  std::set<std::string> liveness;
  std::string scope = "";
};

class Module {
public:
  std::shared_ptr<Node> moduleHead;
  Node *moduleName;
  std::unordered_map<std::string, std::pair<Node *, PortDir>> directionMap;
  std::vector<std::pair<std::string, PortDir>> portList;
  std::vector<ProgramPoint> programPoints;
  std::unordered_map<std::string, CanonicalTypes> idToType;
  bool isSelected = false;
};

/**
 * @class LivenessVisitor
 * @brief Visitor for liveness analysis.
 */
class LivenessVisitor : public Visitor<void> {
public:
  std::vector<std::string> identifiersInScope;
  std::stack<size_t> scopeLimit;
  std::vector<ProgramPoint> &programPoints;
  std::stack<IdentifierRenamingVisitor::ContextType> context;
  std::vector<std::string> labelContext;

  LivenessVisitor(std::vector<ProgramPoint> &PP) : programPoints(PP) {
    programPoints.clear();
  }
  void startNewScope();
  void finishScope();

  void defaultVisitor(Node *node);

  virtual void visit(Terminal *node) override;

  virtual void visit(Genericidentifier *node) override;

  virtual void visit(Node *node) override;

  virtual void visit(Sequence_delay_range_expr *node) override;

  virtual void visit(Port *node) override;

  virtual void visit(Specify_simple_path *node) override;

  virtual void visit(Event_control *node) override;

  virtual void visit(String_literal *node) override;

  virtual void visit(Charge_strength_opt *node) override;

  virtual void visit(Dpi_import_export *node) override;

  virtual void visit(For_initialization_opt *node) override;

  virtual void visit(List_of_port_identifiers *node) override;

  virtual void visit(Non_integer_type *node) override;

  virtual void visit(Parameter_value_ranges_opt *node) override;

  virtual void visit(Package_item_no_pp *node) override;

  virtual void visit(Sequence_delay_repetition_list *node) override;

  virtual void visit(Add_expr *node) override;

  virtual void visit(Dpi_import_item *node) override;

  virtual void visit(Tk_realtime *node) override;

  virtual void visit(Case_item *node) override;

  virtual void visit(Property_if_else_expr *node) override;

  virtual void visit(Non_anonymous_instantiation_base *node) override;

  virtual void visit(Unary_expr *node) override;

  virtual void visit(Unary_op *node) override;

  virtual void visit(Class_id *node) override;

  virtual void visit(Reference *node) override;

  virtual void visit(Cast *node) override;

  virtual void visit(Tf_variable_identifier_first *node) override;

  virtual void visit(
      Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt *node)
      override;

  virtual void visit(Type_or_id_root *node) override;

  virtual void visit(Module_or_generate_item *node) override;

  virtual void visit(Module_parameter_port_list_trailing_comma *node) override;

  virtual void visit(Instantiation_type *node) override;

  virtual void visit(Parameters *node) override;

  virtual void visit(Reference_or_call_base *node) override;

  virtual void
  visit(Param_type_followed_by_id_and_dimensions_opt *node) override;

  virtual void visit(Structure_or_array_pattern_key *node) override;

  virtual void visit(Parameter_assign_list *node) override;

  virtual void visit(Defparam_assign_list *node) override;

  virtual void visit(Generate_item_list_opt *node) override;

  virtual void visit(Tk_octdigits *node) override;

  virtual void visit(Sequence_expr_primary *node) override;

  virtual void visit(Lpvalue *node) override;

  virtual void visit(Label_opt *node) override;

  virtual void visit(Escapedidentifier *node) override;

  virtual void visit(Generate_item *node) override;

  virtual void visit(Data_type_primitive *node) override;

  virtual void visit(Spec_reference_event *node) override;

  virtual void visit(Udp_input_declaration_list *node) override;

  virtual void visit(Non_port_module_item *node) override;

  virtual void visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi
                         *node) override;

  virtual void visit(Module_parameter_port_list_opt *node) override;

  virtual void visit(Property_prefix_expr *node) override;

  virtual void visit(Expr_primary_braces *node) override;

  virtual void visit(Pow_expr *node) override;

  virtual void visit(For_init_decl_or_assign *node) override;

  virtual void visit(Udp_initial *node) override;

  virtual void visit(Tf_port_list_paren_opt *node) override;

  virtual void visit(Struct_data_type *node) override;

  virtual void visit(Udp_sequ_entry *node) override;

  virtual void visit(Net_variable_or_decl_assign *node) override;

  virtual void visit(Parameter_value_byname_list_trailing_comma *node) override;

  virtual void visit(Inc_or_dec_expression *node) override;

  virtual void visit(Net_type *node) override;

  virtual void visit(Select_dimensions_opt *node) override;

  virtual void visit(Spec_polarity *node) override;

  virtual void visit(Macro_formal_parameter *node) override;

  virtual void visit(Structure_or_array_pattern_expression *node) override;

  virtual void visit(For_step *node) override;

  virtual void visit(Specparam_list *node) override;

  virtual void visit(Tk_binbase *node) override;

  virtual void visit(Tk_stringliteral *node) override;

  virtual void visit(Var_opt *node) override;

  virtual void visit(Identifier_optional_unpacked_dimensions *node) override;

  virtual void visit(Function_item_list *node) override;

  virtual void visit(Type_declaration *node) override;

  virtual void visit(Udp_body *node) override;

  virtual void visit(Mul_expr *node) override;

  virtual void visit(Par_block *node) override;

  virtual void visit(Keywordidentifier *node) override;

  virtual void visit(Logeq_expr *node) override;

  virtual void visit(Module_common_item *node) override;

  virtual void visit(Primitive_gate_instance *node) override;

  virtual void visit(Data_type_or_implicit *node) override;

  virtual void visit(Tk_octbase *node) override;

  virtual void visit(Sequence_expr *node) override;

  virtual void visit(Tk_hexbase *node) override;

  virtual void visit(Property_expr *node) override;

  virtual void visit(Seq_block *node) override;

  virtual void visit(Task_item *node) override;

  virtual void
  visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node)
      override;

  virtual void visit(Specify_block *node) override;

  virtual void visit(Tk_decnumber *node) override;

  virtual void visit(Tk_decbase *node) override;

  virtual void visit(Property_implication_expr *node) override;

  virtual void visit(Bit_logic_opt *node) override;

  virtual void visit(Integer_atom_type *node) override;

  virtual void visit(Lifetime *node) override;

  virtual void visit(Any_argument_list *node) override;

  virtual void visit(Delay_value_list *node) override;

  virtual void visit(Module_port_declaration *node) override;

  virtual void visit(Jump_statement *node) override;

  virtual void visit(Delay_value *node) override;

  virtual void visit(Sequence_or_expr *node) override;

  virtual void visit(Module_attribute_foreign_opt *node) override;

  virtual void visit(Tf_port_direction_opt *node) override;

  virtual void visit(Tf_port_item_expr_opt *node) override;

  virtual void visit(Cont_assign_list *node) override;

  virtual void visit(Any_argument_list_trailing_comma *node) override;

  virtual void visit(Procedural_continuous_assignment *node) override;

  virtual void visit(Expression_or_dist *node) override;

  virtual void visit(Module_start *node) override;

  virtual void visit(Expr_primary_parens *node) override;

  virtual void visit(Open_range_list *node) override;

  virtual void visit(Unary_prefix_expr *node) override;

  virtual void visit(Delay_identifier *node) override;

  virtual void visit(List_of_identifiers_unpacked_dimensions *node) override;

  virtual void visit(Delay_scope *node) override;

  virtual void visit(Action_block *node) override;

  virtual void visit(Trailing_assign_opt *node) override;

  virtual void visit(Class_item *node) override;

  virtual void visit(Enum_name_list_trailing_comma *node) override;

  virtual void visit(Udp_port_list *node) override;

  virtual void visit(Equiv_impl_expr *node) override;

  virtual void visit(Class_new *node) override;

  virtual void visit(Port_net_type *node) override;

  virtual void visit(Unqualified_id *node) override;

  virtual void visit(Begin *node) override;

  virtual void visit(System_tf_call *node) override;

  virtual void visit(Parameter_value_byname_list_item_last *node) override;

  virtual void visit(Conditional_generate_construct *node) override;

  virtual void visit(Timescale_directive *node) override;

  virtual void visit(Port_expression *node) override;

  virtual void visit(Udp_sequ_entry_list *node) override;

  virtual void visit(Symbol_or_label *node) override;

  virtual void visit(Simple_sequence_expr *node) override;

  virtual void visit(Systemtfidentifier *node) override;

  virtual void visit(Tk_unbasednumber *node) override;

  virtual void visit(Decl_dimensions_opt *node) override;

  virtual void visit(Class_items_opt *node) override;

  virtual void visit(Enum_name *node) override;

  virtual void visit(Parameter_value_opt *node) override;

  virtual void visit(Specify_edge_path *node) override;

  virtual void visit(Implicit_class_handle *node) override;

  virtual void visit(Module_item *node) override;

  virtual void visit(Statement_item *node) override;

  virtual void visit(Type_identifier_followed_by_id *node) override;

  virtual void visit(Method_prototype *node) override;

  virtual void visit(Tf_port_item *node) override;

  virtual void visit(Block_item_or_statement_or_null_list *node) override;

  virtual void visit(Endnew_opt *node) override;

  virtual void visit(Specify_item_list_opt *node) override;

  virtual void visit(Specify_simple_path_decl *node) override;

  virtual void visit(Tk_rs_eq *node) override;

  virtual void visit(Package_import_item_list *node) override;

  virtual void visit(Udp_port_decl *node) override;

  virtual void visit(With_exprs_suffix *node) override;

  virtual void visit(Generate_region *node) override;

  virtual void visit(Call_base *node) override;

  virtual void visit(Array_locator_method *node) override;

  virtual void visit(Port_declaration_ansi *node) override;

  virtual void visit(Bitand_expr *node) override;

  virtual void visit(Range_list_in_braces *node) override;

  virtual void visit(Module_parameter_port_list_item_last *node) override;

  virtual void visit(Hex_based_number *node) override;

  virtual void visit(Hierarchy_event_identifier *node) override;

  virtual void visit(List_of_variable_decl_assignments *node) override;

  virtual void visit(Random_qualifier_opt *node) override;

  virtual void visit(Drive_strength_opt *node) override;

  virtual void visit(Tk_timeliteral *node) override;

  virtual void visit(Value_range *node) override;

  virtual void visit(Expr_mintypmax_generalized *node) override;

  virtual void visit(Polarity_operator *node) override;

  virtual void visit(Package_item *node) override;

  virtual void visit(For_initialization *node) override;

  virtual void visit(Enum_data_type *node) override;

  virtual void visit(Blocking_assignment *node) override;

  virtual void visit(Delay1 *node) override;

  virtual void visit(Based_number *node) override;

  virtual void visit(Procedural_timing_control_statement *node) override;

  virtual void visit(Block_item_decl *node) override;

  virtual void visit(Net_variable_or_decl_assigns *node) override;

  virtual void visit(Time_literal *node) override;

  virtual void visit(Function_item_data_declaration *node) override;

  virtual void visit(Decl_variable_dimension *node) override;

  virtual void visit(Tf_port_list_opt *node) override;

  virtual void visit(Endfunction_label_opt *node) override;

  virtual void visit(Qualified_id *node) override;

  virtual void visit(Immediate_assertion_statement *node) override;

  virtual void visit(Join_keyword *node) override;

  virtual void visit(Tk_bindigits *node) override;

  virtual void visit(Event_trigger *node) override;

  virtual void visit(Dynamic_array_new *node) override;

  virtual void visit(Matches_expr *node) override;

  virtual void visit(Port_reference_list *node) override;

  virtual void visit(Array_reduction_method *node) override;

  virtual void visit(Builtin_array_method *node) override;

  virtual void visit(Package_declaration *node) override;

  virtual void visit(Assignment_pattern_expression *node) override;

  virtual void visit(Drive_strength *node) override;

  virtual void visit(Port_declaration_non_ansi *node) override;

  virtual void visit(Module_parameter_port_list *node) override;

  virtual void visit(Var_type *node) override;

  virtual void visit(Parameter_opt *node) override;

  virtual void visit(Module_item_list *node) override;

  virtual void visit(Package_item_list_opt *node) override;

  virtual void
  visit(List_of_ports_or_port_declarations_item_last_ansi *node) override;

  virtual void
  visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node) override;

  virtual void visit(Xor_expr *node) override;

  virtual void visit(Dec_based_number *node) override;

  virtual void visit(Loop_statement *node) override;

  virtual void visit(Data_declaration_or_module_instantiation *node) override;

  virtual void visit(Udp_comb_entry_list *node) override;

  virtual void visit(Bit_logic *node) override;

  virtual void visit(Reference_or_call *node) override;

  virtual void visit(Local_root *node) override;

  virtual void visit(Port_direction *node) override;

  virtual void visit(Variable_decl_assignment *node) override;

  virtual void visit(Specify_edge_path_decl *node) override;

  virtual void visit(Function_prototype *node) override;

  virtual void visit(Sequence_within_expr *node) override;

  virtual void visit(Expr_primary_no_groups *node) override;

  virtual void visit(Parameter_value_byname *node) override;

  virtual void visit(Case_any *node) override;

  virtual void visit(Spec_notifier *node) override;

  virtual void visit(Block_item_or_statement_or_null *node) override;

  virtual void visit(Specify_item *node) override;

  virtual void visit(Any_param_declaration *node) override;

  virtual void visit(Tf_port_list_trailing_comma *node) override;

  virtual void visit(Struct_union_member *node) override;

  virtual void visit(Any_port_list_positional *node) override;

  virtual void visit(Dir *node) override;

  virtual void visit(Lifetime_opt *node) override;

  virtual void visit(List_of_identifiers *node) override;

  virtual void visit(Edge_operator *node) override;

  virtual void visit(Tk_virtual_opt *node) override;

  virtual void visit(Timeunits_declaration *node) override;

  virtual void visit(Tf_item_or_statement_or_null *node) override;

  virtual void visit(Package_import_list *node) override;

  virtual void visit(Expr_primary *node) override;

  virtual void visit(Signed_unsigned_opt *node) override;

  virtual void
  visit(Non_anonymous_gate_instance_or_register_variable_list *node) override;

  virtual void visit(Udp_comb_entry *node) override;

  virtual void visit(Delay3 *node) override;

  virtual void visit(Inc_or_dec_or_primary_expr *node) override;

  virtual void visit(Procedural_assertion_statement *node) override;

  virtual void visit(Struct_union_member_list *node) override;

  virtual void visit(Comp_expr *node) override;

  virtual void visit(Postfix_expression *node) override;

  virtual void visit(Symbolidentifier *node) override;

  virtual void visit(Udp_input_sym *node) override;

  virtual void visit(Pos_neg_number *node) override;

  virtual void visit(Specify_terminal_descriptor *node) override;

  virtual void visit(Select_variable_dimension *node) override;

  virtual void visit(List_of_ports_or_port_declarations_ansi *node) override;

  virtual void visit(Generate_case_items *node) override;

  virtual void visit(Data_type_primitive_scalar *node) override;

  virtual void visit(Tf_item_or_statement_or_null_list *node) override;

  virtual void visit(Conditional_statement *node) override;

  virtual void visit(Specparam_decl *node) override;

  virtual void
  visit(List_of_ports_or_port_declarations_non_ansi *node) override;

  virtual void visit(Statement_or_null_list *node) override;

  virtual void visit(Task_declaration *node) override;

  virtual void visit(Data_declaration_base *node) override;

  virtual void visit(Any_port_list_opt *node) override;

  virtual void visit(Macronumericwidth *node) override;

  virtual void visit(Trailing_decl_assignment_opt *node) override;

  virtual void visit(Gate_instance_or_register_variable *node) override;

  virtual void visit(Bind_instantiation *node) override;

  virtual void visit(Package_import_declaration *node) override;

  virtual void visit(Module_package_import_list_opt *node) override;

  virtual void visit(Structure_or_array_pattern_expression_list *node) override;

  virtual void visit(Event_expression_list *node) override;

  virtual void visit(Tk_rss_eq *node) override;

  virtual void visit(Implements_interface_list_opt *node) override;

  virtual void visit(Delay3_opt *node) override;

  virtual void visit(Expr_mintypmax_trans_set *node) override;

  virtual void visit(Statement_or_null *node) override;

  virtual void visit(Enum_name_list *node) override;

  virtual void visit(Sequence_unary_expr *node) override;

  virtual void visit(Pp_identifier *node) override;

  virtual void visit(Shift_expr *node) override;

  virtual void visit(Oct_based_number *node) override;

  virtual void visit(Hierarchy_segment *node) override;

  virtual void visit(Nonblocking_assignment *node) override;

  virtual void visit(Expression_list_proper *node) override;

  virtual void visit(Generate_if *node) override;

  virtual void visit(Function_item *node) override;

  virtual void visit(Scope_prefix *node) override;

  virtual void visit(Primitive_gate_instance_list *node) override;

  virtual void visit(Simple_immediate_assertion_statement *node) override;

  virtual void visit(Description_list *node) override;

  virtual void visit(Dr_strength0 *node) override;

  virtual void visit(Unique_priority_opt *node) override;

  virtual void visit(Specparam *node) override;

  virtual void visit(Port_expression_opt *node) override;

  virtual void visit(Cond_expr *node) override;

  virtual void visit(Tk_reg_opt *node) override;

  virtual void visit(Logor_expr *node) override;

  virtual void visit(Delay3_or_drive_opt *node) override;

  virtual void visit(Tf_item_or_statement_or_null_list_opt *node) override;

  virtual void visit(Net_decl_assign *node) override;

  virtual void visit(Always_any *node) override;

  virtual void visit(List_of_tf_variable_identifiers *node) override;

  virtual void visit(Var_or_net_type_opt *node) override;

  virtual void visit(Tf_port_list_item_last *node) override;

  virtual void visit(Task_declaration_id *node) override;

  virtual void visit(Instantiation_base *node) override;

  virtual void visit(Sequence_repetition_expr *node) override;

  virtual void visit(Tk_hexdigits *node) override;

  virtual void
  visit(Non_anonymous_gate_instance_or_register_variable *node) override;

  virtual void visit(Localparam_assign *node) override;

  virtual void visit(Class_items *node) override;

  virtual void visit(Expression_in_parens *node) override;

  virtual void
  visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node) override;

  virtual void visit(Port_reference *node) override;

  virtual void visit(Dist_opt *node) override;

  virtual void visit(Caseeq_expr *node) override;

  virtual void visit(Generate_block *node) override;

  virtual void
  visit(List_of_ports_or_port_declarations_item_last_non_ansi *node) override;

  virtual void visit(Any_argument_list_item_last *node) override;

  virtual void visit(Gate_instantiation *node) override;

  virtual void visit(Casting_type *node) override;

  virtual void visit(Expr_mintypmax *node) override;

  virtual void visit(Continuous_assign *node) override;

  virtual void visit(Parameter_assign *node) override;

  virtual void visit(Delay_value_simple *node) override;

  virtual void visit(Switchtype *node) override;

  virtual void visit(Package_or_generate_item_declaration *node) override;

  virtual void visit(Bin_based_number *node) override;

  virtual void visit(Loop_generate_construct *node) override;

  virtual void visit(Parameter_override *node) override;

  virtual void visit(Udp_primitive *node) override;

  virtual void visit(Parameter_expr *node) override;

  virtual void visit(Repeat_control *node) override;

  virtual void visit(Packed_signing_opt *node) override;

  virtual void visit(Expression_or_null_list_opt *node) override;

  virtual void visit(Enum_name_list_item_last *node) override;

  virtual void visit(Macro_formals_list_opt *node) override;

  virtual void visit(Spec_notifier_opt *node) override;

  virtual void visit(Hierarchy_extension *node) override;

  virtual void visit(Generate_item_list *node) override;

  virtual void visit(Data_declaration_modifiers_opt *node) override;

  virtual void visit(Sequence_throughout_expr *node) override;

  virtual void visit(Property_expr_or_assignment_list *node) override;

  virtual void visit(Bitor_expr *node) override;

  virtual void visit(Tf_port_list *node) override;

  virtual void visit(Any_port_list_trailing_comma_named *node) override;

  virtual void visit(Function_return_type_and_id *node) override;

  virtual void visit(Statement *node) override;

  virtual void visit(Dr_strength1 *node) override;

  virtual void visit(Assign_modify_statement *node) override;

  virtual void visit(Udp_port_decls *node) override;

  virtual void visit(Integer_vector_type *node) override;

  virtual void visit(Assignment_pattern *node) override;

  virtual void visit(Class_constructor *node) override;

  virtual void visit(Module_parameter_port *node) override;

  virtual void visit(Module_or_generate_item_declaration *node) override;

  virtual void visit(Final_construct *node) override;

  virtual void visit(Member_name *node) override;

  virtual void visit(Class_declaration *node) override;

  virtual void visit(Package_import_item *node) override;

  virtual void visit(Signing *node) override;

  virtual void visit(Class_constructor_prototype *node) override;

  virtual void visit(Generate_case_item *node) override;

  virtual void visit(Data_declaration *node) override;

  virtual void visit(Expression *node) override;

  virtual void visit(Cont_assign *node) override;

  virtual void visit(Delay_or_event_control_opt *node) override;

  virtual void visit(Bind_directive *node) override;

  virtual void visit(Misc_directive *node) override;

  virtual void visit(Udp_initial_expr_opt *node) override;

  virtual void visit(Description *node) override;

  virtual void visit(Data_type_base *node) override;

  virtual void visit(Trailing_assign *node) override;

  virtual void visit(Module_end *node) override;

  virtual void visit(Wait_statement *node) override;

  virtual void visit(Package_item_list *node) override;

  virtual void visit(Case_items *node) override;

  virtual void visit(Statement_or_null_list_opt *node) override;

  virtual void visit(Port_named *node) override;

  virtual void visit(Udp_output_sym *node) override;

  virtual void visit(Assignment_statement_no_expr *node) override;

  virtual void visit(Any_port_list_item_last_positional *node) override;

  virtual void visit(Module_item_list_opt *node) override;

  virtual void visit(Sequence_and_expr *node) override;

  virtual void visit(Data_type *node) override;

  virtual void visit(Argument_list_opt *node) override;

  virtual void visit(For_step_opt *node) override;

  virtual void visit(Sequence_intersect_expr *node) override;

  virtual void visit(Function_declaration *node) override;

  virtual void visit(Net_type_or_none *node) override;

  virtual void visit(Class_declaration_extends_opt *node) override;

  virtual void visit(Boolean_abbrev_opt *node) override;

  virtual void visit(Specify_path_identifiers *node) override;

  virtual void visit(Tf_port_direction *node) override;

  virtual void visit(Tk_decdigits *node) override;

  virtual void visit(End *node) override;

  virtual void visit(Net_declaration *node) override;

  virtual void visit(Tk_tagged_opt *node) override;

  virtual void visit(Tk_xzdigits *node) override;

  virtual void visit(Gatetype *node) override;

  virtual void visit(Preprocess_include_argument *node) override;

  virtual void visit(Macro_formals_list *node) override;

  virtual void visit(Const_opt *node) override;

  virtual void visit(Logand_expr *node) override;

  virtual void visit(Event_expression *node) override;

  virtual void visit(Udp_entry_list *node) override;

  virtual void visit(Preprocessor_action *node) override;

  virtual void visit(Tf_port_declaration *node) override;

  virtual void visit(Udp_init_opt *node) override;

  virtual void
  visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node)
      override;

  virtual void visit(Source_text *node) override;

  virtual void visit(Defparam_assign *node) override;

  virtual void visit(Decl_dimensions *node) override;

  virtual void visit(Constant_dec_number *node) override;

  virtual void visit(Case_statement *node) override;

  virtual void visit(Assignment_statement *node) override;

  virtual void visit(Dpi_import_property_opt *node) override;

  virtual void visit(Dpi_spec_string *node) override;

  virtual void visit(Trailing_decl_assignment *node) override;

  virtual void visit(Always_construct *node) override;

  virtual void visit(Genvar_opt *node) override;

  virtual void visit(Any_port_list_named *node) override;

  virtual void visit(Subroutine_call *node) override;

  virtual void visit(Property_expr_or_assignment *node) override;

  virtual void visit(Any_argument *node) override;

  virtual void visit(Module_or_interface_declaration *node) override;

  virtual void visit(Expression_opt *node) override;

  virtual void visit(Gate_instance_or_register_variable_list *node) override;

  virtual void visit(Tk_evalstringliteral *node) override;

  virtual void visit(Delay_or_event_control *node) override;

  virtual void visit(Udp_input_list *node) override;

  virtual void visit(Parameter_value_byname_list *node) override;

  virtual void visit(Module_port_list_opt *node) override;

  virtual void visit(List_of_ports_or_port_declarations_opt *node) override;

  virtual void visit(Any_port_list_trailing_comma_positional *node) override;

  virtual void visit(Block_item_or_statement_or_null_list_opt *node) override;

  virtual void visit(Genvar_declaration *node) override;

  virtual void visit(Number *node) override;

  virtual void visit(Specify_item_list *node) override;

  virtual void visit(Tk_ls_eq *node) override;

  virtual void visit(Tf_variable_identifier *node) override;

  virtual void visit(Initial_construct *node) override;

  virtual void visit(Localparam_assign_list *node) override;

  virtual void visit(Disable_statement *node) override;

  virtual void visit(List_of_module_item_identifiers *node) override;

  virtual void visit(Any_port_list_item_last_named *node) override;

  virtual void visit(Net_variable *node) override;

  virtual void visit(Parameter_expr_list *node) override;

  virtual void visit(Specparam_declaration *node) override;

  virtual void visit(Deferred_immediate_assertion_statement *node) override;

  virtual void visit(Slice_size_opt *node) override;

  virtual void visit(Concurrent_assertion_item *node) override;

  virtual void visit(Clocking_item_list_opt *node) override;

  virtual void visit(Cycle_delay *node) override;

  virtual void visit(Macroiditem *node) override;

  virtual void visit(Assume_property_statement *node) override;

  virtual void visit(Pull01 *node) override;

  virtual void visit(Preprocessor_directive *node) override;

  virtual void visit(Module_item_directive *node) override;

  virtual void visit(Assert_property_statement *node) override;

  virtual void visit(Scope_or_if_res *node) override;

  virtual void visit(Task_prototype *node) override;

  virtual void visit(Clocking_declaration *node) override;

  virtual void visit(Block_identifier_opt *node) override;

  virtual void visit(Macroidentifier *node) override;

  virtual void visit(Property_spec_disable_iff_opt *node) override;

  virtual void visit(Macrogenericitem *node) override;

  virtual void visit(Module_block *node) override;

  virtual void visit(Stream_expression *node) override;

  virtual void visit(Final_or_zero *node) override;

  virtual void visit(Tk_edge_descriptor *node) override;

  virtual void visit(
      Method_property_qualifier_list_not_starting_with_virtual *node) override;

  virtual void visit(Identifier_opt *node) override;

  virtual void
  visit(Module_parameter_port_list_preprocessor_last *node) override;

  virtual void visit(Type_assignment *node) override;

  virtual void visit(Type_assignment_list *node) override;

  virtual void visit(Method_qualifier_list_opt *node) override;

  virtual void visit(Stream_operator *node) override;

  virtual void visit(Assertion_item *node) override;

  virtual void visit(Property_spec *node) override;

  virtual void visit(Streaming_concatenation *node) override;

  virtual void visit(Edge_descriptor_list *node) override;

  virtual void visit(Property_qualifier *node) override;

  virtual void visit(Event_control_opt *node) override;

  virtual void visit(Class_item_qualifier *node) override;

  virtual void visit(Concurrent_assertion_statement *node) override;

  virtual void visit(Cover_property_statement *node) override;

  virtual void visit(Stream_expression_list *node) override;

  virtual void visit(Class_item_qualifier_list_opt *node) override;
  virtual void visit(Tk_static_opt *node) override;
};

#endif