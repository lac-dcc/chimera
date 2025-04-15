#ifndef TYPE_INFERENCE_H
#define TYPE_INFERENCE_H

#include "Visitor.h"
#include <cstdint>
#include <set>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

extern bool debug;

using typeId = std::uint64_t;
using constraintSet = std::set<std::pair<typeId, typeId>>;
using constraintVector = std::vector<std::pair<typeId, typeId>>;
using equivalenceMap = std::unordered_map<typeId, std::unordered_set<typeId>>;

enum class CanonicalTypes : typeId {
  DEFAULT_TYPE,
  SCALAR,
  CONST_SCALAR,
  BIT,
  LOGIC,
  ANONYMOUS_GATE,
  GATE,
  VECTOR,
  FLOAT_SCALAR,
  STRING,
  REG,
  WIRE,
  INTEGER,
  FIRST_FRESH_TYPE // Marks the size of CanonicalTypes. Not meant to be used.
};

bool inferTypes(Node *head,
                std::unordered_map<std::string, CanonicalTypes> &idToType);

/**
 * @brief A visitor for performing type inference on an abstract syntax tree
 * (AST).
 *
 * This class extends the `Visitor` template class and implements `visit`
 * functions for various node types. It keeps track of type identifiers,
 * constraints, and variable mappings during the traversal.
 */
class TypeInferenceVisitor : public Visitor<constraintSet, typeId> {
private:
  /**
   * A counter for generating fresh type identifiers.
   */
  typeId typeCounter = static_cast<typeId>(CanonicalTypes::FIRST_FRESH_TYPE);

  /**
   * Processes binary expressions and generates constraints based on the
   * operands and expected types.
   *
   * @param lhs The left-hand side operand.
   * @param rhs The right-hand side operand.
   * @param operandType The expected type of the operands.
   * @param exprType The expected type of the expression.
   * @param actualType The actual type of the expression.
   * @return A constraint set representing the type constraints derived from the
   * binary expression.
   */
  constraintSet binaryExpr(Node *lhs, Node *rhs, typeId operandType,
                           typeId exprType, typeId actualType);

  /**
   * The default visitor implementation for nodes that don't have specific
   * `visit` functions.
   *
   * @param node The node to visit.
   * @param type The expected type of the node.
   * @return A constraint set representing the type constraints derived from the
   * node.
   */
  constraintSet defaultVisitor(Node *node, typeId type);

  /**
   * The visitor implementation for identifier nodes.
   *
   * @param node The identifier node.
   * @param type The expected type of the identifier.
   * @return A constraint set representing the type constraints derived from the
   * identifier.
   */
  constraintSet identifierVisitor(Node *node, typeId type);

public:
  /**
   * @brief
   * A map from type identifiers to their corresponding string representations.
   */
  std::unordered_map<typeId, std::string> typeIdToIdMap;

  /**
   * @brief
   * A map from string representations to their corresponding type identifiers.
   */
  std::unordered_map<std::string, typeId> idToTypeIdMap;

  /**
   * @brief A map from variable names to their corresponding nodes.
   */
  std::unordered_map<std::string, Node *> varMap;

  /**
   * @brief Adds a type identifier and its corresponding string representation
   * to the maps.
   *
   * @param t The type identifier.
   * @param id The string representation.
   */
  void addToMap(typeId t, const std::string id);

  /**
   * @brief Generates a fresh type identifier.
   *
   * @return A new type identifier.
   */
  typeId freshType();

  virtual constraintSet visit(Node *node, typeId type) override;

  virtual constraintSet visit(Terminal *node, typeId type) override;

  virtual constraintSet visit(Sequence_delay_range_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Port *node, typeId type) override;

  virtual constraintSet visit(Specify_simple_path *node, typeId type) override;

  virtual constraintSet visit(Event_control *node, typeId type) override;

  virtual constraintSet visit(String_literal *node, typeId type) override;

  virtual constraintSet visit(Charge_strength_opt *node, typeId type) override;

  virtual constraintSet visit(Dpi_import_export *node, typeId type) override;

  virtual constraintSet visit(For_initialization_opt *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_port_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Non_integer_type *node, typeId type) override;

  virtual constraintSet visit(Parameter_value_ranges_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Package_item_no_pp *node, typeId type) override;

  virtual constraintSet visit(Sequence_delay_repetition_list *node,
                              typeId type) override;

  virtual constraintSet visit(Add_expr *node, typeId type) override;

  virtual constraintSet visit(Dpi_import_item *node, typeId type) override;

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

  virtual constraintSet visit(Type_or_id_root *node, typeId type) override;

  virtual constraintSet visit(Module_or_generate_item *node,
                              typeId type) override;

  virtual constraintSet visit(Module_parameter_port_list_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Instantiation_type *node, typeId type) override;

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

  virtual constraintSet visit(Defparam_assign_list *node, typeId type) override;

  virtual constraintSet visit(Generate_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_octdigits *node, typeId type) override;

  virtual constraintSet visit(Sequence_expr_primary *node,
                              typeId type) override;

  virtual constraintSet visit(Lpvalue *node, typeId type) override;

  virtual constraintSet visit(Label_opt *node, typeId type) override;

  virtual constraintSet visit(Escapedidentifier *node, typeId type) override;

  virtual constraintSet visit(Generate_item *node, typeId type) override;

  virtual constraintSet visit(Data_type_primitive *node, typeId type) override;

  virtual constraintSet visit(Spec_reference_event *node, typeId type) override;

  virtual constraintSet visit(Udp_input_declaration_list *node,
                              typeId type) override;

  virtual constraintSet visit(Non_port_module_item *node, typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi *node,
        typeId type) override;

  virtual constraintSet visit(Module_parameter_port_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Property_prefix_expr *node, typeId type) override;

  virtual constraintSet visit(Expr_primary_braces *node, typeId type) override;

  virtual constraintSet visit(Pow_expr *node, typeId type) override;

  virtual constraintSet visit(For_init_decl_or_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_initial *node, typeId type) override;

  virtual constraintSet visit(Tf_port_list_paren_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Struct_data_type *node, typeId type) override;

  virtual constraintSet visit(Udp_sequ_entry *node, typeId type) override;

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

  virtual constraintSet visit(Specparam_list *node, typeId type) override;

  virtual constraintSet visit(Tk_binbase *node, typeId type) override;

  virtual constraintSet visit(Tk_stringliteral *node, typeId type) override;

  virtual constraintSet visit(Var_opt *node, typeId type) override;

  virtual constraintSet visit(Identifier_optional_unpacked_dimensions *node,
                              typeId type) override;

  virtual constraintSet visit(Function_item_list *node, typeId type) override;

  virtual constraintSet visit(Type_declaration *node, typeId type) override;

  virtual constraintSet visit(Udp_body *node, typeId type) override;

  virtual constraintSet visit(Mul_expr *node, typeId type) override;

  virtual constraintSet visit(Par_block *node, typeId type) override;

  virtual constraintSet visit(Keywordidentifier *node, typeId type) override;

  virtual constraintSet visit(Logeq_expr *node, typeId type) override;

  virtual constraintSet visit(Module_common_item *node, typeId type) override;

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

  virtual constraintSet visit(Integer_atom_type *node, typeId type) override;

  virtual constraintSet visit(Lifetime *node, typeId type) override;

  virtual constraintSet visit(Any_argument_list *node, typeId type) override;

  virtual constraintSet visit(Delay_value_list *node, typeId type) override;

  virtual constraintSet visit(Module_port_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Jump_statement *node, typeId type) override;

  virtual constraintSet visit(Delay_value *node, typeId type) override;

  virtual constraintSet visit(Sequence_or_expr *node, typeId type) override;

  virtual constraintSet visit(Module_attribute_foreign_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_direction_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_item_expr_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Cont_assign_list *node, typeId type) override;

  virtual constraintSet visit(Any_argument_list_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Procedural_continuous_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Expression_or_dist *node, typeId type) override;

  virtual constraintSet visit(Module_start *node, typeId type) override;

  virtual constraintSet visit(Expr_primary_parens *node, typeId type) override;

  virtual constraintSet visit(Open_range_list *node, typeId type) override;

  virtual constraintSet visit(Unary_prefix_expr *node, typeId type) override;

  virtual constraintSet visit(Delay_identifier *node, typeId type) override;

  virtual constraintSet visit(List_of_identifiers_unpacked_dimensions *node,
                              typeId type) override;

  virtual constraintSet visit(Delay_scope *node, typeId type) override;

  virtual constraintSet visit(Action_block *node, typeId type) override;

  virtual constraintSet visit(Trailing_assign_opt *node, typeId type) override;

  virtual constraintSet visit(Class_item *node, typeId type) override;

  virtual constraintSet visit(Enum_name_list_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_port_list *node, typeId type) override;

  virtual constraintSet visit(Equiv_impl_expr *node, typeId type) override;

  virtual constraintSet visit(Class_new *node, typeId type) override;

  virtual constraintSet visit(Port_net_type *node, typeId type) override;

  virtual constraintSet visit(Unqualified_id *node, typeId type) override;

  virtual constraintSet visit(Begin *node, typeId type) override;

  virtual constraintSet visit(System_tf_call *node, typeId type) override;

  virtual constraintSet visit(Parameter_value_byname_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Conditional_generate_construct *node,
                              typeId type) override;

  virtual constraintSet visit(Timescale_directive *node, typeId type) override;

  virtual constraintSet visit(Port_expression *node, typeId type) override;

  virtual constraintSet visit(Udp_sequ_entry_list *node, typeId type) override;

  virtual constraintSet visit(Symbol_or_label *node, typeId type) override;

  virtual constraintSet visit(Simple_sequence_expr *node, typeId type) override;

  virtual constraintSet visit(Systemtfidentifier *node, typeId type) override;

  virtual constraintSet visit(Tk_unbasednumber *node, typeId type) override;

  virtual constraintSet visit(Decl_dimensions_opt *node, typeId type) override;

  virtual constraintSet visit(Class_items_opt *node, typeId type) override;

  virtual constraintSet visit(Enum_name *node, typeId type) override;

  virtual constraintSet visit(Parameter_value_opt *node, typeId type) override;

  virtual constraintSet visit(Specify_edge_path *node, typeId type) override;

  virtual constraintSet visit(Implicit_class_handle *node,
                              typeId type) override;

  virtual constraintSet visit(Module_item *node, typeId type) override;

  virtual constraintSet visit(Statement_item *node, typeId type) override;

  virtual constraintSet visit(Type_identifier_followed_by_id *node,
                              typeId type) override;

  virtual constraintSet visit(Method_prototype *node, typeId type) override;

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

  virtual constraintSet visit(With_exprs_suffix *node, typeId type) override;

  virtual constraintSet visit(Generate_region *node, typeId type) override;

  virtual constraintSet visit(Call_base *node, typeId type) override;

  virtual constraintSet visit(Array_locator_method *node, typeId type) override;

  virtual constraintSet visit(Port_declaration_ansi *node,
                              typeId type) override;

  virtual constraintSet visit(Bitand_expr *node, typeId type) override;

  virtual constraintSet visit(Range_list_in_braces *node, typeId type) override;

  virtual constraintSet visit(Module_parameter_port_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Hex_based_number *node, typeId type) override;

  virtual constraintSet visit(Hierarchy_event_identifier *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_variable_decl_assignments *node,
                              typeId type) override;

  virtual constraintSet visit(Random_qualifier_opt *node, typeId type) override;

  virtual constraintSet visit(Drive_strength_opt *node, typeId type) override;

  virtual constraintSet visit(Tk_timeliteral *node, typeId type) override;

  virtual constraintSet visit(Value_range *node, typeId type) override;

  virtual constraintSet visit(Expr_mintypmax_generalized *node,
                              typeId type) override;

  virtual constraintSet visit(Polarity_operator *node, typeId type) override;

  virtual constraintSet visit(Package_item *node, typeId type) override;

  virtual constraintSet visit(For_initialization *node, typeId type) override;

  virtual constraintSet visit(Enum_data_type *node, typeId type) override;

  virtual constraintSet visit(Blocking_assignment *node, typeId type) override;

  virtual constraintSet visit(Delay1 *node, typeId type) override;

  virtual constraintSet visit(Based_number *node, typeId type) override;

  virtual constraintSet visit(Procedural_timing_control_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Block_item_decl *node, typeId type) override;

  virtual constraintSet visit(Net_variable_or_decl_assigns *node,
                              typeId type) override;

  virtual constraintSet visit(Time_literal *node, typeId type) override;

  virtual constraintSet visit(Function_item_data_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Decl_variable_dimension *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_list_opt *node, typeId type) override;

  virtual constraintSet visit(Endfunction_label_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Qualified_id *node, typeId type) override;

  virtual constraintSet visit(Immediate_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Join_keyword *node, typeId type) override;

  virtual constraintSet visit(Tk_bindigits *node, typeId type) override;

  virtual constraintSet visit(Event_trigger *node, typeId type) override;

  virtual constraintSet visit(Dynamic_array_new *node, typeId type) override;

  virtual constraintSet visit(Matches_expr *node, typeId type) override;

  virtual constraintSet visit(Port_reference_list *node, typeId type) override;

  virtual constraintSet visit(Array_reduction_method *node,
                              typeId type) override;

  virtual constraintSet visit(Builtin_array_method *node, typeId type) override;

  virtual constraintSet visit(Package_declaration *node, typeId type) override;

  virtual constraintSet visit(Assignment_pattern_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Drive_strength *node, typeId type) override;

  virtual constraintSet visit(Port_declaration_non_ansi *node,
                              typeId type) override;

  virtual constraintSet visit(Module_parameter_port_list *node,
                              typeId type) override;

  virtual constraintSet visit(Var_type *node, typeId type) override;

  virtual constraintSet visit(Parameter_opt *node, typeId type) override;

  virtual constraintSet visit(Module_item_list *node, typeId type) override;

  virtual constraintSet visit(Genericidentifier *node, typeId type) override;

  virtual constraintSet visit(Package_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_item_last_ansi *node,
        typeId type) override;

  virtual constraintSet
  visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node,
        typeId type) override;

  virtual constraintSet visit(Xor_expr *node, typeId type) override;

  virtual constraintSet visit(Dec_based_number *node, typeId type) override;

  virtual constraintSet visit(Loop_statement *node, typeId type) override;

  virtual constraintSet visit(Data_declaration_or_module_instantiation *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_comb_entry_list *node, typeId type) override;

  virtual constraintSet visit(Bit_logic *node, typeId type) override;

  virtual constraintSet visit(Reference_or_call *node, typeId type) override;

  virtual constraintSet visit(Local_root *node, typeId type) override;

  virtual constraintSet visit(Port_direction *node, typeId type) override;

  virtual constraintSet visit(Variable_decl_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Specify_edge_path_decl *node,
                              typeId type) override;

  virtual constraintSet visit(Function_prototype *node, typeId type) override;

  virtual constraintSet visit(Sequence_within_expr *node, typeId type) override;

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

  virtual constraintSet visit(Struct_union_member *node, typeId type) override;

  virtual constraintSet visit(Any_port_list_positional *node,
                              typeId type) override;

  virtual constraintSet visit(Dir *node, typeId type) override;

  virtual constraintSet visit(Lifetime_opt *node, typeId type) override;

  virtual constraintSet visit(List_of_identifiers *node, typeId type) override;

  virtual constraintSet visit(Edge_operator *node, typeId type) override;

  virtual constraintSet visit(Tk_virtual_opt *node, typeId type) override;

  virtual constraintSet visit(Timeunits_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null *node,
                              typeId type) override;

  virtual constraintSet visit(Package_import_list *node, typeId type) override;

  virtual constraintSet visit(Expr_primary *node, typeId type) override;

  virtual constraintSet visit(Signed_unsigned_opt *node, typeId type) override;

  virtual constraintSet
  visit(Non_anonymous_gate_instance_or_register_variable_list *node,
        typeId type) override;

  virtual constraintSet visit(Udp_comb_entry *node, typeId type) override;

  virtual constraintSet visit(Delay3 *node, typeId type) override;

  virtual constraintSet visit(Inc_or_dec_or_primary_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Procedural_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Struct_union_member_list *node,
                              typeId type) override;

  virtual constraintSet visit(Comp_expr *node, typeId type) override;

  virtual constraintSet visit(Postfix_expression *node, typeId type) override;

  virtual constraintSet visit(Symbolidentifier *node, typeId type) override;

  virtual constraintSet visit(Udp_input_sym *node, typeId type) override;

  virtual constraintSet visit(Pos_neg_number *node, typeId type) override;

  virtual constraintSet visit(Specify_terminal_descriptor *node,
                              typeId type) override;

  virtual constraintSet visit(Select_variable_dimension *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_ansi *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_case_items *node, typeId type) override;

  virtual constraintSet visit(Data_type_primitive_scalar *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null_list *node,
                              typeId type) override;

  virtual constraintSet visit(Conditional_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Specparam_decl *node, typeId type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_non_ansi *node,
                              typeId type) override;

  virtual constraintSet visit(Statement_or_null_list *node,
                              typeId type) override;

  virtual constraintSet visit(Task_declaration *node, typeId type) override;

  virtual constraintSet visit(Data_declaration_base *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_opt *node, typeId type) override;

  virtual constraintSet visit(Macronumericwidth *node, typeId type) override;

  virtual constraintSet visit(Trailing_decl_assignment_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Gate_instance_or_register_variable *node,
                              typeId type) override;

  virtual constraintSet visit(Bind_instantiation *node, typeId type) override;

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

  virtual constraintSet visit(Statement_or_null *node, typeId type) override;

  virtual constraintSet visit(Enum_name_list *node, typeId type) override;

  virtual constraintSet visit(Sequence_unary_expr *node, typeId type) override;

  virtual constraintSet visit(Pp_identifier *node, typeId type) override;

  virtual constraintSet visit(Shift_expr *node, typeId type) override;

  virtual constraintSet visit(Oct_based_number *node, typeId type) override;

  virtual constraintSet visit(Hierarchy_segment *node, typeId type) override;

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

  virtual constraintSet visit(Description_list *node, typeId type) override;

  virtual constraintSet visit(Dr_strength0 *node, typeId type) override;

  virtual constraintSet visit(Unique_priority_opt *node, typeId type) override;

  virtual constraintSet visit(Specparam *node, typeId type) override;

  virtual constraintSet visit(Port_expression_opt *node, typeId type) override;

  virtual constraintSet visit(Cond_expr *node, typeId type) override;

  virtual constraintSet visit(Tk_reg_opt *node, typeId type) override;

  virtual constraintSet visit(Logor_expr *node, typeId type) override;

  virtual constraintSet visit(Delay3_or_drive_opt *node, typeId type) override;

  virtual constraintSet visit(Tf_item_or_statement_or_null_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Net_decl_assign *node, typeId type) override;

  virtual constraintSet visit(Always_any *node, typeId type) override;

  virtual constraintSet visit(List_of_tf_variable_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Var_or_net_type_opt *node, typeId type) override;

  virtual constraintSet visit(Tf_port_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Task_declaration_id *node, typeId type) override;

  virtual constraintSet visit(Instantiation_base *node, typeId type) override;

  virtual constraintSet visit(Sequence_repetition_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_hexdigits *node, typeId type) override;

  virtual constraintSet
  visit(Non_anonymous_gate_instance_or_register_variable *node,
        typeId type) override;

  virtual constraintSet visit(Localparam_assign *node, typeId type) override;

  virtual constraintSet visit(Class_items *node, typeId type) override;

  virtual constraintSet visit(Expression_in_parens *node, typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node,
        typeId type) override;

  virtual constraintSet visit(Port_reference *node, typeId type) override;

  virtual constraintSet visit(Dist_opt *node, typeId type) override;

  virtual constraintSet visit(Caseeq_expr *node, typeId type) override;

  virtual constraintSet visit(Generate_block *node, typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_item_last_non_ansi *node,
        typeId type) override;

  virtual constraintSet visit(Any_argument_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Gate_instantiation *node, typeId type) override;

  virtual constraintSet visit(Casting_type *node, typeId type) override;

  virtual constraintSet visit(Expr_mintypmax *node, typeId type) override;

  virtual constraintSet visit(Continuous_assign *node, typeId type) override;

  virtual constraintSet visit(Parameter_assign *node, typeId type) override;

  virtual constraintSet visit(Delay_value_simple *node, typeId type) override;

  virtual constraintSet visit(Switchtype *node, typeId type) override;

  virtual constraintSet visit(Package_or_generate_item_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Bin_based_number *node, typeId type) override;

  virtual constraintSet visit(Loop_generate_construct *node,
                              typeId type) override;

  virtual constraintSet visit(Parameter_override *node, typeId type) override;

  virtual constraintSet visit(Udp_primitive *node, typeId type) override;

  virtual constraintSet visit(Parameter_expr *node, typeId type) override;

  virtual constraintSet visit(Repeat_control *node, typeId type) override;

  virtual constraintSet visit(Packed_signing_opt *node, typeId type) override;

  virtual constraintSet visit(Expression_or_null_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Enum_name_list_item_last *node,
                              typeId type) override;

  virtual constraintSet visit(Macro_formals_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Spec_notifier_opt *node, typeId type) override;

  virtual constraintSet visit(Hierarchy_extension *node, typeId type) override;

  virtual constraintSet visit(Generate_item_list *node, typeId type) override;

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

  virtual constraintSet visit(Udp_port_decls *node, typeId type) override;

  virtual constraintSet visit(Integer_vector_type *node, typeId type) override;

  virtual constraintSet visit(Assignment_pattern *node, typeId type) override;

  virtual constraintSet visit(Class_constructor *node, typeId type) override;

  virtual constraintSet visit(Module_parameter_port *node,
                              typeId type) override;

  virtual constraintSet visit(Module_or_generate_item_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Final_construct *node, typeId type) override;

  virtual constraintSet visit(Member_name *node, typeId type) override;

  virtual constraintSet visit(Class_declaration *node, typeId type) override;

  virtual constraintSet visit(Package_import_item *node, typeId type) override;

  virtual constraintSet visit(Signing *node, typeId type) override;

  virtual constraintSet visit(Class_constructor_prototype *node,
                              typeId type) override;

  virtual constraintSet visit(Generate_case_item *node, typeId type) override;

  virtual constraintSet visit(Data_declaration *node, typeId type) override;

  virtual constraintSet visit(Expression *node, typeId type) override;

  virtual constraintSet visit(Cont_assign *node, typeId type) override;

  virtual constraintSet visit(Delay_or_event_control_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Bind_directive *node, typeId type) override;

  virtual constraintSet visit(Misc_directive *node, typeId type) override;

  virtual constraintSet visit(Udp_initial_expr_opt *node, typeId type) override;

  virtual constraintSet visit(Description *node, typeId type) override;

  virtual constraintSet visit(Data_type_base *node, typeId type) override;

  virtual constraintSet visit(Trailing_assign *node, typeId type) override;

  virtual constraintSet visit(Module_end *node, typeId type) override;

  virtual constraintSet visit(Wait_statement *node, typeId type) override;

  virtual constraintSet visit(Package_item_list *node, typeId type) override;

  virtual constraintSet visit(Case_items *node, typeId type) override;

  virtual constraintSet visit(Statement_or_null_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Port_named *node, typeId type) override;

  virtual constraintSet visit(Udp_output_sym *node, typeId type) override;

  virtual constraintSet visit(Assignment_statement_no_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_item_last_positional *node,
                              typeId type) override;

  virtual constraintSet visit(Module_item_list_opt *node, typeId type) override;

  virtual constraintSet visit(Sequence_and_expr *node, typeId type) override;

  virtual constraintSet visit(Data_type *node, typeId type) override;

  virtual constraintSet visit(Argument_list_opt *node, typeId type) override;

  virtual constraintSet visit(For_step_opt *node, typeId type) override;

  virtual constraintSet visit(Sequence_intersect_expr *node,
                              typeId type) override;

  virtual constraintSet visit(Function_declaration *node, typeId type) override;

  virtual constraintSet visit(Net_type_or_none *node, typeId type) override;

  virtual constraintSet visit(Class_declaration_extends_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Boolean_abbrev_opt *node, typeId type) override;

  virtual constraintSet visit(Specify_path_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Tf_port_direction *node, typeId type) override;

  virtual constraintSet visit(Tk_decdigits *node, typeId type) override;

  virtual constraintSet visit(End *node, typeId type) override;

  virtual constraintSet visit(Net_declaration *node, typeId type) override;

  virtual constraintSet visit(Tk_tagged_opt *node, typeId type) override;

  virtual constraintSet visit(Tk_xzdigits *node, typeId type) override;

  virtual constraintSet visit(Gatetype *node, typeId type) override;

  virtual constraintSet visit(Preprocess_include_argument *node,
                              typeId type) override;

  virtual constraintSet visit(Macro_formals_list *node, typeId type) override;

  virtual constraintSet visit(Const_opt *node, typeId type) override;

  virtual constraintSet visit(Logand_expr *node, typeId type) override;

  virtual constraintSet visit(Event_expression *node, typeId type) override;

  virtual constraintSet visit(Udp_entry_list *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_action *node, typeId type) override;

  virtual constraintSet visit(Tf_port_declaration *node, typeId type) override;

  virtual constraintSet visit(Udp_init_opt *node, typeId type) override;

  virtual constraintSet
  visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node,
        typeId type) override;

  virtual constraintSet visit(Source_text *node, typeId type) override;

  virtual constraintSet visit(Defparam_assign *node, typeId type) override;

  virtual constraintSet visit(Decl_dimensions *node, typeId type) override;

  virtual constraintSet visit(Constant_dec_number *node, typeId type) override;

  virtual constraintSet visit(Case_statement *node, typeId type) override;

  virtual constraintSet visit(Assignment_statement *node, typeId type) override;

  virtual constraintSet visit(Dpi_import_property_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Dpi_spec_string *node, typeId type) override;

  virtual constraintSet visit(Trailing_decl_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Always_construct *node, typeId type) override;

  virtual constraintSet visit(Genvar_opt *node, typeId type) override;

  virtual constraintSet visit(Any_port_list_named *node, typeId type) override;

  virtual constraintSet visit(Subroutine_call *node, typeId type) override;

  virtual constraintSet visit(Property_expr_or_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Any_argument *node, typeId type) override;

  virtual constraintSet visit(Module_or_interface_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Expression_opt *node, typeId type) override;

  virtual constraintSet visit(Gate_instance_or_register_variable_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_evalstringliteral *node, typeId type) override;

  virtual constraintSet visit(Delay_or_event_control *node,
                              typeId type) override;

  virtual constraintSet visit(Udp_input_list *node, typeId type) override;

  virtual constraintSet visit(Parameter_value_byname_list *node,
                              typeId type) override;

  virtual constraintSet visit(Module_port_list_opt *node, typeId type) override;

  virtual constraintSet visit(List_of_ports_or_port_declarations_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_trailing_comma_positional *node,
                              typeId type) override;

  virtual constraintSet visit(Block_item_or_statement_or_null_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Genvar_declaration *node, typeId type) override;

  virtual constraintSet visit(Number *node, typeId type) override;

  virtual constraintSet visit(Specify_item_list *node, typeId type) override;

  virtual constraintSet visit(Tk_ls_eq *node, typeId type) override;

  virtual constraintSet visit(Tf_variable_identifier *node,
                              typeId type) override;

  virtual constraintSet visit(Initial_construct *node, typeId type) override;

  virtual constraintSet visit(Localparam_assign_list *node,
                              typeId type) override;

  virtual constraintSet visit(Disable_statement *node, typeId type) override;

  virtual constraintSet visit(List_of_module_item_identifiers *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_item_last_named *node,
                              typeId type) override;

  virtual constraintSet visit(Net_variable *node, typeId type) override;

  virtual constraintSet visit(Parameter_expr_list *node, typeId type) override;

  virtual constraintSet visit(Specparam_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Deferred_immediate_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Slice_size_opt *node, typeId type) override;

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

  virtual constraintSet visit(Scope_or_if_res *node, typeId type) override;

  virtual constraintSet visit(Task_prototype *node, typeId type) override;

  virtual constraintSet visit(Clocking_declaration *node, typeId type) override;

  virtual constraintSet visit(Block_identifier_opt *node, typeId type) override;

  virtual constraintSet visit(Macroidentifier *node, typeId type) override;

  virtual constraintSet visit(Property_spec_disable_iff_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Macrogenericitem *node, typeId type) override;

  virtual constraintSet visit(Module_block *node, typeId type) override;

  virtual constraintSet visit(Stream_expression *node, typeId type) override;

  virtual constraintSet visit(Final_or_zero *node, typeId type) override;

  virtual constraintSet visit(Tk_edge_descriptor *node, typeId type) override;

  virtual constraintSet
  visit(Method_property_qualifier_list_not_starting_with_virtual *node,
        typeId type) override;

  virtual constraintSet visit(Identifier_opt *node, typeId type) override;

  virtual constraintSet
  visit(Module_parameter_port_list_preprocessor_last *node,
        typeId type) override;

  virtual constraintSet visit(Type_assignment *node, typeId type) override;

  virtual constraintSet visit(Type_assignment_list *node, typeId type) override;

  virtual constraintSet visit(Method_qualifier_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Stream_operator *node, typeId type) override;

  virtual constraintSet visit(Assertion_item *node, typeId type) override;

  virtual constraintSet visit(Property_spec *node, typeId type) override;

  virtual constraintSet visit(Streaming_concatenation *node,
                              typeId type) override;

  virtual constraintSet visit(Edge_descriptor_list *node, typeId type) override;

  virtual constraintSet visit(Property_qualifier *node, typeId type) override;

  virtual constraintSet visit(Event_control_opt *node, typeId type) override;

  virtual constraintSet visit(Class_item_qualifier *node, typeId type) override;

  virtual constraintSet visit(Concurrent_assertion_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Cover_property_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Stream_expression_list *node,
                              typeId type) override;

  virtual constraintSet visit(Class_item_qualifier_list_opt *node,
                              typeId type) override;
  virtual constraintSet visit(Assertion_item_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Boolean_abbrev *node, typeId type) override;

  virtual constraintSet visit(Cycle_delay_range *node, typeId type) override;

  virtual constraintSet visit(Property_operator *node, typeId type) override;

  virtual constraintSet visit(Property_spec_disable_iff *node,
                              typeId type) override;

  virtual constraintSet visit(Config_declaration *node, typeId type) override;

  virtual constraintSet visit(With_constraint_block_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Random_qualifier *node, typeId type) override;

  virtual constraintSet visit(Bind_target_instance_list *node,
                              typeId type) override;

  virtual constraintSet visit(Hierarchy_or_call_extension *node,
                              typeId type) override;

  virtual constraintSet visit(Clocking_item_list *node, typeId type) override;

  virtual constraintSet visit(Modport_declaration *node, typeId type) override;

  virtual constraintSet visit(Class_constraint *node, typeId type) override;

  virtual constraintSet visit(Net_alias *node, typeId type) override;

  virtual constraintSet visit(Type_reference *node, typeId type) override;

  virtual constraintSet visit(Method_qualifier_list *node,
                              typeId type) override;

  virtual constraintSet visit(Interface_type *node, typeId type) override;

  virtual constraintSet visit(Package_export_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Interface_opt *node, typeId type) override;

  virtual constraintSet visit(Data_type_or_implicit_basic_followed_by_id *node,
                              typeId type) override;

  virtual constraintSet visit(Coverage_spec_or_option_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Modport_item_list *node, typeId type) override;

  virtual constraintSet visit(Expect_property_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Lib_cell_identifiers_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_port_list_in_parens_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Clocking_direction *node, typeId type) override;

  virtual constraintSet visit(Goto_repetition *node, typeId type) override;

  virtual constraintSet visit(Constraint_block_item *node,
                              typeId type) override;

  virtual constraintSet visit(Assertion_variable_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Design_statement *node, typeId type) override;

  virtual constraintSet visit(Sequence_declaration *node, typeId type) override;

  virtual constraintSet visit(Clocking_item *node, typeId type) override;

  virtual constraintSet visit(Property_port_item *node, typeId type) override;

  virtual constraintSet visit(List_of_config_rule_statements *node,
                              typeId type) override;

  virtual constraintSet visit(Cycle_range *node, typeId type) override;

  virtual constraintSet visit(Bind_target_instance *node, typeId type) override;

  virtual constraintSet visit(Lib_cell_id *node, typeId type) override;

  virtual constraintSet visit(Property_declaration *node, typeId type) override;

  virtual constraintSet visit(Property_formal_type_followed_by_id *node,
                              typeId type) override;

  virtual constraintSet visit(Modport_simple_ports_declaration_last *node,
                              typeId type) override;

  virtual constraintSet visit(Covergroup_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Coverage_spec *node, typeId type) override;

  virtual constraintSet visit(Consecutive_repetition *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_libraries_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Identifier_list_in_parens_opt *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_clocking_decl_assign *node,
                              typeId type) override;

  virtual constraintSet visit(Coverage_event *node, typeId type) override;

  virtual constraintSet visit(Config_rule_statement *node,
                              typeId type) override;

  virtual constraintSet
  visit(Type_identifier_or_implicit_basic_followed_by_id *node,
        typeId type) override;

  virtual constraintSet visit(Assertion_variable_declaration_list *node,
                              typeId type) override;

  virtual constraintSet visit(Constraint_expression_no_preprocessor *node,
                              typeId type) override;

  virtual constraintSet visit(Clocking_decl_assign *node, typeId type) override;

  virtual constraintSet visit(With_constraint_block *node,
                              typeId type) override;

  virtual constraintSet visit(Optional_semicolon *node, typeId type) override;

  virtual constraintSet visit(Property_port_list_in_parens_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Modport_simple_ports_declaration_begin *node,
                              typeId type) override;

  virtual constraintSet visit(Modport_simple_port *node, typeId type) override;

  virtual constraintSet visit(Clocking_skew_opt *node, typeId type) override;

  virtual constraintSet visit(Implication_operator *node, typeId type) override;

  virtual constraintSet visit(Net_alias_assign_lvalue_list *node,
                              typeId type) override;

  virtual constraintSet visit(Nonconsecutive_repetition *node,
                              typeId type) override;

  virtual constraintSet visit(Bins_or_options_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_port_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Property_port_modifiers_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Liblist_clause *node, typeId type) override;

  virtual constraintSet visit(Constraint_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Property_actual_arg_opt *node,
                              typeId type) override;

  virtual constraintSet visit(List_of_config_rule_statements_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Modport_ports_list *node, typeId type) override;

  virtual constraintSet visit(Cover_point *node, typeId type) override;

  virtual constraintSet visit(Modport_item *node, typeId type) override;

  virtual constraintSet visit(Constraint_block_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Lib_cell_identifiers *node, typeId type) override;

  virtual constraintSet visit(Property_port_list *node, typeId type) override;

  virtual constraintSet visit(List_of_libraries *node, typeId type) override;

  virtual constraintSet visit(Constraint_block_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Coverage_spec_or_option_list *node,
                              typeId type) override;

  virtual constraintSet visit(Constraint_block *node, typeId type) override;

  virtual constraintSet visit(Coverage_event_opt *node, typeId type) override;

  virtual constraintSet visit(Cycle_range_or_expr *node, typeId type) override;

  virtual constraintSet visit(Coverage_spec_or_option *node,
                              typeId type) override;
  virtual constraintSet visit(Method_qualifier *node, typeId type) override;

  virtual constraintSet visit(Tk_static_opt *node, typeId type) override;

  virtual constraintSet visit(Until_operator *node, typeId type) override;

  virtual constraintSet visit(Cover_sequence_statement *node,
                              typeId type) override;

  virtual constraintSet visit(With_covergroup_expression_in_parens *node,
                              typeId type) override;

  virtual constraintSet visit(Declaration_extends_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Rs_if_else *node, typeId type) override;

  virtual constraintSet visit(Followed_by_operator *node, typeId type) override;

  virtual constraintSet visit(Local_sequence_lvar_port_direction_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Bins_expression *node, typeId type) override;

  virtual constraintSet visit(Property_actual_arg *node, typeId type) override;

  virtual constraintSet visit(Select_expression *node, typeId type) override;

  virtual constraintSet visit(Slice_size *node, typeId type) override;

  virtual constraintSet visit(Property_case_item *node, typeId type) override;

  virtual constraintSet visit(Default_skew *node, typeId type) override;

  virtual constraintSet visit(Constraint_expression_list *node,
                              typeId type) override;

  virtual constraintSet visit(Modport_clocking_declaration_begin *node,
                              typeId type) override;

  virtual constraintSet visit(Property_case_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Randomize_call *node, typeId type) override;

  virtual constraintSet visit(Cross_item_list *node, typeId type) override;

  virtual constraintSet visit(Production_item *node, typeId type) override;

  virtual constraintSet visit(Data_type_or_void_with_id *node,
                              typeId type) override;

  virtual constraintSet visit(Lb_star_rb *node, typeId type) override;

  virtual constraintSet visit(Modport_clocking_declaration_last *node,
                              typeId type) override;

  virtual constraintSet visit(Uniqueness_constraint *node,
                              typeId type) override;

  virtual constraintSet visit(Any_port_list_preprocessor_last_named *node,
                              typeId type) override;

  virtual constraintSet visit(Modport_tf_ports_declaration_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Interface_data_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Method_property_qualifier *node,
                              typeId type) override;

  virtual constraintSet visit(Bins_or_options_list *node, typeId type) override;

  virtual constraintSet visit(Opt_config *node, typeId type) override;

  virtual constraintSet visit(Pattern_list *node, typeId type) override;

  virtual constraintSet visit(Bins_or_options *node, typeId type) override;

  virtual constraintSet visit(Pattern_opt *node, typeId type) override;

  virtual constraintSet visit(Interface_class_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Cross_body_item_list *node, typeId type) override;

  virtual constraintSet visit(Modport_tf_ports_declaration_begin *node,
                              typeId type) override;

  virtual constraintSet visit(Rs_rule_list *node, typeId type) override;

  virtual constraintSet visit(Cell_clause *node, typeId type) override;

  virtual constraintSet visit(Sequence_port_list *node, typeId type) override;

  virtual constraintSet visit(Let_port_list *node, typeId type) override;

  virtual constraintSet visit(Production_list *node, typeId type) override;

  virtual constraintSet visit(Rs_production_list_or_rand_join *node,
                              typeId type) override;

  virtual constraintSet visit(Rs_code_block *node, typeId type) override;

  virtual constraintSet visit(Let_declaration *node, typeId type) override;

  virtual constraintSet visit(Expression_in_parens_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Array_method_with_predicate_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Cross_item *node, typeId type) override;

  virtual constraintSet visit(Modport_tf_ports_declaration_last *node,
                              typeId type) override;

  virtual constraintSet visit(Case_pattern_item *node, typeId type) override;

  virtual constraintSet visit(Inst_clause *node, typeId type) override;

  virtual constraintSet visit(Rs_repeat *node, typeId type) override;

  virtual constraintSet visit(Covergroup_expression_bracketed_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Clocking_drive_only *node, typeId type) override;

  virtual constraintSet visit(Constraint_primary *node, typeId type) override;

  virtual constraintSet visit(Constraint_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_match_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Sequence_spec *node, typeId type) override;

  virtual constraintSet visit(Cover_cross *node, typeId type) override;

  virtual constraintSet visit(Wildcard_opt *node, typeId type) override;

  virtual constraintSet visit(Case_inside_items *node, typeId type) override;

  virtual constraintSet visit(Modport_tf_port *node, typeId type) override;

  virtual constraintSet visit(Weight_specification *node, typeId type) override;

  virtual constraintSet visit(Select_condition *node, typeId type) override;

  virtual constraintSet visit(Deferred_immediate_assertion_item *node,
                              typeId type) override;

  virtual constraintSet visit(Let_formal_type_followed_by_id *node,
                              typeId type) override;

  virtual constraintSet visit(Coverage_bin_rhs *node, typeId type) override;

  virtual constraintSet visit(Production_items_list *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_port_declarations *node,
                              typeId type) override;

  virtual constraintSet visit(Simple_type *node, typeId type) override;

  virtual constraintSet visit(Rs_production_list *node, typeId type) override;

  virtual constraintSet visit(Dpi_export_item *node, typeId type) override;

  virtual constraintSet visit(Production *node, typeId type) override;

  virtual constraintSet visit(Modport_clocking_declaration_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet visit(Let_port_list_in_parens_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Cross_body *node, typeId type) override;

  virtual constraintSet visit(Use_clause *node, typeId type) override;

  virtual constraintSet visit(Sequence_match_item *node, typeId type) override;

  virtual constraintSet visit(Coverage_bin *node, typeId type) override;

  virtual constraintSet visit(Sequence_port_type_followed_by_id *node,
                              typeId type) override;

  virtual constraintSet visit(Interface_class_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Identifier_list *node, typeId type) override;

  virtual constraintSet visit(Sequence_port_item *node, typeId type) override;

  virtual constraintSet visit(Dist_item *node, typeId type) override;

  virtual constraintSet visit(Dist_weight *node, typeId type) override;

  virtual constraintSet visit(Bins_keyword *node, typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_preprocessor_last_ansi *node,
        typeId type) override;

  virtual constraintSet visit(Implements_interface_list *node,
                              typeId type) override;

  virtual constraintSet visit(Let_port_item *node, typeId type) override;

  virtual constraintSet visit(Array_method_with_predicate *node,
                              typeId type) override;

  virtual constraintSet visit(Coverage_option *node, typeId type) override;

  virtual constraintSet visit(Constraint_set *node, typeId type) override;

  virtual constraintSet visit(Pattern *node, typeId type) override;

  virtual constraintSet visit(Net_type_declaration *node, typeId type) override;

  virtual constraintSet visit(Bins_selection *node, typeId type) override;

  virtual constraintSet visit(Expression_or_dist_list *node,
                              typeId type) override;

  virtual constraintSet visit(Clocking_skew *node, typeId type) override;

  virtual constraintSet visit(Interface_class_item *node, typeId type) override;

  virtual constraintSet visit(Sequence_expr_match_item_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_anglebracketinclude *node,
                              typeId type) override;

  virtual constraintSet visit(Interface_class_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Import_export *node, typeId type) override;

  virtual constraintSet visit(With_covergroup_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Constraint_primary_list *node,
                              typeId type) override;

  virtual constraintSet visit(Property_case_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Charge_strength *node, typeId type) override;

  virtual constraintSet visit(Dpi_import_property *node, typeId type) override;

  virtual constraintSet visit(Iff_expr_opt *node, typeId type) override;

  virtual constraintSet visit(Rs_rule *node, typeId type) override;

  virtual constraintSet visit(Interface_class_method *node,
                              typeId type) override;

  virtual constraintSet
  visit(Modport_simple_ports_declaration_trailing_comma *node,
        typeId type) override;

  virtual constraintSet visit(Case_inside_item *node, typeId type) override;

  virtual constraintSet visit(Restrict_property_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Dist_list *node, typeId type) override;

  virtual constraintSet visit(Rs_prod *node, typeId type) override;

  virtual constraintSet visit(Array_ordering_method *node,
                              typeId type) override;

  virtual constraintSet visit(Randsequence_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Cross_body_item *node, typeId type) override;

  virtual constraintSet visit(Case_pattern_items *node, typeId type) override;

  virtual constraintSet visit(Cross_body_item_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Modport_ports_declaration_trailing_comma *node,
                              typeId type) override;

  virtual constraintSet
  visit(Set_covergroup_expression_or_covergroup_range_list_or_trans_list *node,
        typeId type) override;

  virtual constraintSet visit(Tk_strong *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_class_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_genvar *node, typeId type) override;

  virtual constraintSet visit(File_path_spec_list *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_description_item *node,
                              typeId type) override;

  virtual constraintSet visit(Branch_probe_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_rcmos *node, typeId type) override;

  virtual constraintSet visit(Tk_pipearrow2 *node, typeId type) override;

  virtual constraintSet visit(Tk_ssetup *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_generate_items *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_sskew *node, typeId type) override;

  virtual constraintSet visit(Tk_new *node, typeId type) override;

  virtual constraintSet visit(Library_source *node, typeId type) override;

  virtual constraintSet visit(Tk_localparam *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_port_declarations_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_union *node, typeId type) override;

  virtual constraintSet visit(Tk_showcancelled *node, typeId type) override;

  virtual constraintSet visit(Tk_wand *node, typeId type) override;

  virtual constraintSet visit(Dr_begin_keywords *node, typeId type) override;

  virtual constraintSet visit(Member_pattern_list *node, typeId type) override;

  virtual constraintSet visit(Tk_strong0 *node, typeId type) override;

  virtual constraintSet visit(Analog_construct *node, typeId type) override;

  virtual constraintSet visit(Tk_wreal *node, typeId type) override;

  virtual constraintSet visit(Tk_rand *node, typeId type) override;

  virtual constraintSet visit(Tk_poundpound *node, typeId type) override;

  virtual constraintSet visit(Nature_items *node, typeId type) override;

  virtual constraintSet visit(Dr_suppress_faults *node, typeId type) override;

  virtual constraintSet visit(Tk_repeat *node, typeId type) override;

  virtual constraintSet visit(Tk_time *node, typeId type) override;

  virtual constraintSet visit(Dr_resetall *node, typeId type) override;

  virtual constraintSet visit(Tk_clocking *node, typeId type) override;

  virtual constraintSet visit(Tk_parameter *node, typeId type) override;

  virtual constraintSet visit(Tk_initial *node, typeId type) override;

  virtual constraintSet visit(Tk_pulsestyle_ondetect *node,
                              typeId type) override;

  virtual constraintSet visit(Discipline_items *node, typeId type) override;

  virtual constraintSet visit(Tk_global *node, typeId type) override;

  virtual constraintSet visit(Dr_end_keywords *node, typeId type) override;

  virtual constraintSet visit(Tk_sample *node, typeId type) override;

  virtual constraintSet visit(Tk_unique_index *node, typeId type) override;

  virtual constraintSet visit(Tk_cmos *node, typeId type) override;

  virtual constraintSet visit(Tk_pstar *node, typeId type) override;

  virtual constraintSet visit(Tk_extern *node, typeId type) override;

  virtual constraintSet visit(Module_attribute_foreign *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_constraint *node, typeId type) override;

  virtual constraintSet visit(Tk_solve *node, typeId type) override;

  virtual constraintSet visit(Tk_triand *node, typeId type) override;

  virtual constraintSet visit(Tk_join_none *node, typeId type) override;

  virtual constraintSet visit(Tk_static *node, typeId type) override;

  virtual constraintSet visit(Pp_define *node, typeId type) override;

  virtual constraintSet visit(Discipline_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_disable *node, typeId type) override;

  virtual constraintSet visit(Tk_reverse *node, typeId type) override;

  virtual constraintSet visit(Tk_shortreal *node, typeId type) override;

  virtual constraintSet visit(Tk_find_last_index *node, typeId type) override;

  virtual constraintSet visit(Tk_expect *node, typeId type) override;

  virtual constraintSet visit(Analog_statement *node, typeId type) override;

  virtual constraintSet visit(Udp_unknown_list *node, typeId type) override;

  virtual constraintSet visit(Tk_lbstarrb *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_module_items *node,
                              typeId type) override;

  virtual constraintSet visit(Rs_case *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_class_items *node,
                              typeId type) override;

  virtual constraintSet visit(Named_parameter_assignment_list *node,
                              typeId type) override;

  virtual constraintSet visit(Rs_case_item_list *node, typeId type) override;

  virtual constraintSet visit(Dr_pragma *node, typeId type) override;

  virtual constraintSet visit(Tk_discrete *node, typeId type) override;

  virtual constraintSet visit(Tk_flow *node, typeId type) override;

  virtual constraintSet visit(Tk_ref *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_statements *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_xnor *node, typeId type) override;

  virtual constraintSet visit(Tk_supply1 *node, typeId type) override;

  virtual constraintSet visit(Tk_const *node, typeId type) override;

  virtual constraintSet visit(Tk_local_scope *node, typeId type) override;

  virtual constraintSet visit(Tk_strong1 *node, typeId type) override;

  virtual constraintSet visit(Tk_release *node, typeId type) override;

  virtual constraintSet visit(Discipline_items_opt *node, typeId type) override;

  virtual constraintSet visit(Tk_program *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_module_item *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_else_statement_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_always *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_class_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_table *node, typeId type) override;

  virtual constraintSet visit(Tk_trigger *node, typeId type) override;

  virtual constraintSet visit(Tk_liblist *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_header *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_pure *node, typeId type) override;

  virtual constraintSet visit(Tk_case *node, typeId type) override;

  virtual constraintSet visit(Tk_shold *node, typeId type) override;

  virtual constraintSet visit(Tk_lbrarrow *node, typeId type) override;

  virtual constraintSet visit(Tk_package *node, typeId type) override;

  virtual constraintSet visit(Tk_always_ff *node, typeId type) override;

  virtual constraintSet visit(Tk_filepath *node, typeId type) override;

  virtual constraintSet visit(Tk_colon_eq *node, typeId type) override;

  virtual constraintSet
  visit(Preprocessor_elsif_config_rule_statements_opt *node,
        typeId type) override;

  virtual constraintSet visit(Tk_pulldown *node, typeId type) override;

  virtual constraintSet visit(Tk_rpmos *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_generate_item_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_bit *node, typeId type) override;

  virtual constraintSet visit(Tk_chandle *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_bins_or_options_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_binsof *node, typeId type) override;

  virtual constraintSet visit(Macro_args_opt *node, typeId type) override;

  virtual constraintSet visit(Tk_srecovery *node, typeId type) override;

  virtual constraintSet visit(Tk_config *node, typeId type) override;

  virtual constraintSet visit(Tk_nonblocking_trigger *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_shuffle *node, typeId type) override;

  virtual constraintSet visit(Tk_signed *node, typeId type) override;

  virtual constraintSet visit(Tk_incr *node, typeId type) override;

  virtual constraintSet visit(Tk_always_latch *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_generate_items *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_product *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_module_item_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_input *node, typeId type) override;

  virtual constraintSet visit(Tk_assign *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_description_items_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Dr_delay_mode_distributed *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_else_package_item *node,
                              typeId type) override;

  virtual constraintSet visit(Bins_or_options_list_opt_pp *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_package_items_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_s_until_with *node, typeId type) override;

  virtual constraintSet visit(Rs_case_item *node, typeId type) override;

  virtual constraintSet visit(Any_port_list_preprocessor_last_positional *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_ignore_bins *node, typeId type) override;

  virtual constraintSet visit(Tk_sum *node, typeId type) override;

  virtual constraintSet visit(Tkk_attribute *node, typeId type) override;

  virtual constraintSet visit(Tk_max *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_constraint_block_item_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_nexttime *node, typeId type) override;

  virtual constraintSet visit(Tk_sequence *node, typeId type) override;

  virtual constraintSet visit(Tk_automatic *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_pullup *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_description_items *node,
                              typeId type) override;

  virtual constraintSet visit(Enum_name_list_preprocessor_last *node,
                              typeId type) override;

  virtual constraintSet visit(From_exclude *node, typeId type) override;

  virtual constraintSet visit(Tk_int *node, typeId type) override;

  virtual constraintSet visit(Tk_join *node, typeId type) override;

  virtual constraintSet visit(Tk_find_first_index *node, typeId type) override;

  virtual constraintSet visit(Tk_implements *node, typeId type) override;

  virtual constraintSet visit(Discipline_item *node, typeId type) override;

  virtual constraintSet visit(Block_event_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_discipline *node, typeId type) override;

  virtual constraintSet visit(Include_statement *node, typeId type) override;

  virtual constraintSet visit(Tk_lbstar *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_bins_or_options_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_lbeq *node, typeId type) override;

  virtual constraintSet visit(Tk_void *node, typeId type) override;

  virtual constraintSet visit(Tk_exclude *node, typeId type) override;

  virtual constraintSet visit(Tk_randc *node, typeId type) override;

  virtual constraintSet visit(Tk_weak *node, typeId type) override;

  virtual constraintSet visit(Tk_instance *node, typeId type) override;

  virtual constraintSet visit(Tk_type_option *node, typeId type) override;

  virtual constraintSet visit(Tk_wait *node, typeId type) override;

  virtual constraintSet visit(Tk_abstol *node, typeId type) override;

  virtual constraintSet visit(Tk_decr *node, typeId type) override;

  virtual constraintSet visit(Tk_xor *node, typeId type) override;

  virtual constraintSet visit(Tk_timeprecision *node, typeId type) override;

  virtual constraintSet visit(Dr_delay_mode_zero *node, typeId type) override;

  virtual constraintSet visit(Tk_find_first *node, typeId type) override;

  virtual constraintSet visit(Tk_pulsestyle_onevent *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_covergroup *node, typeId type) override;

  virtual constraintSet
  visit(Preprocessor_elsif_constraint_block_items_opt *node,
        typeId type) override;

  virtual constraintSet visit(Macro_digits *node, typeId type) override;

  virtual constraintSet visit(Tk_units *node, typeId type) override;

  virtual constraintSet visit(Tk_tran *node, typeId type) override;

  virtual constraintSet visit(Tk_wildcard *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_bins_or_options_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_final *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_package_item_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_class_items *node,
                              typeId type) override;

  virtual constraintSet visit(Any_argument_list_preprocessor_last *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_sort *node, typeId type) override;

  virtual constraintSet visit(Incdir_spec *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_if_header *node,
                              typeId type) override;

  virtual constraintSet visit(Dr_disable_portfaults *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_s_nexttime *node, typeId type) override;

  virtual constraintSet visit(Tk_with *node, typeId type) override;

  virtual constraintSet visit(Dr_unconnected_drive *node, typeId type) override;

  virtual constraintSet visit(Tk_snochange *node, typeId type) override;

  virtual constraintSet visit(Macro_call_or_item *node, typeId type) override;

  virtual constraintSet visit(Library_description_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_port_declaration *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_context *node, typeId type) override;

  virtual constraintSet visit(Tk_include *node, typeId type) override;

  virtual constraintSet visit(Tk_var *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_constraint_block_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_module *node, typeId type) override;

  virtual constraintSet visit(Dr_uselib *node, typeId type) override;

  virtual constraintSet visit(Constraint_declaration_package_item *node,
                              typeId type) override;

  virtual constraintSet visit(Dr_nounconnected_drive *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_event *node, typeId type) override;

  virtual constraintSet visit(Tk_access *node, typeId type) override;

  virtual constraintSet visit(Tk_typedef *node, typeId type) override;

  virtual constraintSet visit(Library_description *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_description_items *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_port_declarations *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_else_bins_or_options_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_else_port_declarations *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_until_with *node, typeId type) override;

  virtual constraintSet visit(Tk_atat *node, typeId type) override;

  virtual constraintSet visit(Tk_option *node, typeId type) override;

  virtual constraintSet visit(Tk_negedge *node, typeId type) override;

  virtual constraintSet visit(Tk_until *node, typeId type) override;

  virtual constraintSet visit(Tk_po_neg *node, typeId type) override;

  virtual constraintSet
  visit(Preprocessor_balanced_config_rule_statements *node,
        typeId type) override;

  virtual constraintSet visit(Member_pattern *node, typeId type) override;

  virtual constraintSet visit(Tk_weak1 *node, typeId type) override;

  virtual constraintSet visit(Tk_1step *node, typeId type) override;

  virtual constraintSet
  visit(Parameter_value_byname_list_preprocessor_last *node,
        typeId type) override;

  virtual constraintSet visit(Tk_unsigned *node, typeId type) override;

  virtual constraintSet visit(Macro_arg_opt *node, typeId type) override;

  virtual constraintSet visit(Tk_tagged *node, typeId type) override;

  virtual constraintSet visit(Tk_scope_res *node, typeId type) override;

  virtual constraintSet visit(Dr_endprotect *node, typeId type) override;

  virtual constraintSet visit(Dr_delay_mode_unit *node, typeId type) override;

  virtual constraintSet visit(Parameter_value_ranges *node,
                              typeId type) override;

  virtual constraintSet visit(Nature_item *node, typeId type) override;

  virtual constraintSet visit(Tk_virtual *node, typeId type) override;

  virtual constraintSet visit(Tk_with__covergroup *node, typeId type) override;

  virtual constraintSet visit(Error *node, typeId type) override;

  virtual constraintSet visit(Tk_specparam *node, typeId type) override;

  virtual constraintSet visit(Tk_assume *node, typeId type) override;

  virtual constraintSet visit(Tk_uwire *node, typeId type) override;

  virtual constraintSet visit(Tk_rtran *node, typeId type) override;

  virtual constraintSet
  visit(Preprocessor_elsif_constraint_expressions_opt *node,
        typeId type) override;

  virtual constraintSet visit(Tk_sync_accept_on *node, typeId type) override;

  virtual constraintSet visit(Tk_coverpoint *node, typeId type) override;

  virtual constraintSet visit(Tk_rnmos *node, typeId type) override;

  virtual constraintSet visit(Tk_eventually *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_description_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_this *node, typeId type) override;

  virtual constraintSet visit(Tk_do *node, typeId type) override;

  virtual constraintSet visit(Tk_modport *node, typeId type) override;

  virtual constraintSet visit(Tk_soft *node, typeId type) override;

  virtual constraintSet visit(Dr_default_trireg_strength *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_trireg *node, typeId type) override;

  virtual constraintSet visit(Description_list_opt *node, typeId type) override;

  virtual constraintSet visit(Tk_edge *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_statements_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Case_item_expression *node, typeId type) override;

  virtual constraintSet visit(Tk_infinite *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_config_rule_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_nature *node, typeId type) override;

  virtual constraintSet visit(Tk_analog *node, typeId type) override;

  virtual constraintSet visit(Tk_macromodule *node, typeId type) override;

  virtual constraintSet visit(Tk_s_eventually *node, typeId type) override;

  virtual constraintSet visit(Tk_srecrem *node, typeId type) override;

  virtual constraintSet visit(Tk_null *node, typeId type) override;

  virtual constraintSet visit(Tk_lp *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_class_item_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Named_parameter_assignment *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_min *node, typeId type) override;

  virtual constraintSet visit(Tk_unique0 *node, typeId type) override;

  virtual constraintSet visit(Tk_or *node, typeId type) override;

  virtual constraintSet visit(Tk_wone *node, typeId type) override;

  virtual constraintSet visit(Tk_rs *node, typeId type) override;

  virtual constraintSet visit(Tk_find *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_config_rule_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_end *node, typeId type) override;

  virtual constraintSet visit(Tk_bind *node, typeId type) override;

  virtual constraintSet visit(Incdir_spec_opt *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_constraint_expressions *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_else_constraint_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_continue *node, typeId type) override;

  virtual constraintSet visit(Tk_cross *node, typeId type) override;

  virtual constraintSet visit(Dr_timescale *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_constraint_block_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_alias *node, typeId type) override;

  virtual constraintSet
  visit(Preprocessor_balanced_constraint_expressions *node,
        typeId type) override;

  virtual constraintSet visit(Tk_integer *node, typeId type) override;

  virtual constraintSet visit(Tk_join_any *node, typeId type) override;

  virtual constraintSet visit(Tk_interface *node, typeId type) override;

  virtual constraintSet visit(Tf_port_list_preprocessor_last *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_export *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_statement *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_else_config_rule_statement_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_nxor *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_generate_items_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_supply0 *node, typeId type) override;

  virtual constraintSet visit(Tk_s_always *node, typeId type) override;

  virtual constraintSet visit(Tk_reg *node, typeId type) override;

  virtual constraintSet visit(File_path_spec *node, typeId type) override;

  virtual constraintSet visit(Dr_endcelldefine *node, typeId type) override;

  virtual constraintSet
  visit(Preprocessor_list_of_ports_or_port_declarations_opt *node,
        typeId type) override;

  virtual constraintSet visit(Tk_implies *node, typeId type) override;

  virtual constraintSet visit(Tk_first_match *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_package_items *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_pmos *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_module_items *node,
                              typeId type) override;

  virtual constraintSet visit(Block_event_expr_primary *node,
                              typeId type) override;

  virtual constraintSet visit(Constraint_prototype *node, typeId type) override;

  virtual constraintSet visit(Tk_ls *node, typeId type) override;

  virtual constraintSet visit(Tk_cell *node, typeId type) override;

  virtual constraintSet visit(Tk_weak0 *node, typeId type) override;

  virtual constraintSet visit(Dr_enable_portfaults *node, typeId type) override;

  virtual constraintSet visit(Tk_noshowcancelled *node, typeId type) override;

  virtual constraintSet visit(Tk_not *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_bins_or_options *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_cover *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_control_flow *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_output *node, typeId type) override;

  virtual constraintSet visit(Tk_tri1 *node, typeId type) override;

  virtual constraintSet visit(Tk_dotstar *node, typeId type) override;

  virtual constraintSet visit(Tk_timeunit *node, typeId type) override;

  virtual constraintSet visit(Tk_tri *node, typeId type) override;

  virtual constraintSet visit(Macrocall *node, typeId type) override;

  virtual constraintSet visit(Tk_inout *node, typeId type) override;

  virtual constraintSet visit(Tk_casex *node, typeId type) override;

  virtual constraintSet visit(Tk_potential *node, typeId type) override;

  virtual constraintSet visit(Tk_poundeqpound *node, typeId type) override;

  virtual constraintSet visit(Tk_let *node, typeId type) override;

  virtual constraintSet visit(Dr_default_nettype *node, typeId type) override;

  virtual constraintSet visit(Tk_begin *node, typeId type) override;

  virtual constraintSet visit(Tk_casez *node, typeId type) override;

  virtual constraintSet visit(Tk_nettype *node, typeId type) override;

  virtual constraintSet visit(Tk_pull0 *node, typeId type) override;

  virtual constraintSet visit(Tk_illegal_bins *node, typeId type) override;

  virtual constraintSet visit(Decay_value_simple *node, typeId type) override;

  virtual constraintSet visit(Tk_enum *node, typeId type) override;

  virtual constraintSet visit(Tk_wor *node, typeId type) override;

  virtual constraintSet visit(Tk_inf *node, typeId type) override;

  virtual constraintSet visit(Tk_sroot *node, typeId type) override;

  virtual constraintSet visit(Tk_interconnect *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_package_items *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_shortint *node, typeId type) override;

  virtual constraintSet visit(Tk_struct *node, typeId type) override;

  virtual constraintSet visit(Tk_break *node, typeId type) override;

  virtual constraintSet visit(Tk_nmos *node, typeId type) override;

  virtual constraintSet visit(Tk_string *node, typeId type) override;

  virtual constraintSet visit(Tk_sync_reject_on *node, typeId type) override;

  virtual constraintSet visit(Tk_wire *node, typeId type) override;

  virtual constraintSet visit(Tk_po_pos *node, typeId type) override;

  virtual constraintSet visit(Tk_return *node, typeId type) override;

  virtual constraintSet visit(Tk_pipearrow *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_description_item_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Dr_protect *node, typeId type) override;

  virtual constraintSet visit(Macrocallitem *node, typeId type) override;

  virtual constraintSet visit(Tk_domain *node, typeId type) override;

  virtual constraintSet visit(Tk_stimeskew *node, typeId type) override;

  virtual constraintSet visit(Macroarg *node, typeId type) override;

  virtual constraintSet visit(Tk_timeprecision_check *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_bins *node, typeId type) override;

  virtual constraintSet visit(Tk_deassign *node, typeId type) override;

  virtual constraintSet visit(Tk_nor *node, typeId type) override;

  virtual constraintSet visit(Tk_packed *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_port_declarations_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_primitive *node, typeId type) override;

  virtual constraintSet visit(Tk_nand *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_constraint_block_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_priority *node, typeId type) override;

  virtual constraintSet visit(Nature_declaration *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_config_rule_statements *node,
                              typeId type) override;

  virtual constraintSet visit(Dr_celldefine *node, typeId type) override;

  virtual constraintSet visit(Tk_accept_on *node, typeId type) override;

  virtual constraintSet visit(Tk_swidth *node, typeId type) override;

  virtual constraintSet visit(Tk_byte *node, typeId type) override;

  virtual constraintSet visit(Tk_lbplusrb *node, typeId type) override;

  virtual constraintSet visit(Tk_randsequence *node, typeId type) override;

  virtual constraintSet visit(Tk_dist *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_generate_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_continuous *node, typeId type) override;

  virtual constraintSet visit(Macrocallid *node, typeId type) override;

  virtual constraintSet visit(Dr_nosuppress_faults *node, typeId type) override;

  virtual constraintSet visit(Tk_defparam *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_package_item *node,
                              typeId type) override;

  virtual constraintSet visit(Case_item_expression_list *node,
                              typeId type) override;

  virtual constraintSet visit(Class_item_qualifier_list *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_assert *node, typeId type) override;

  virtual constraintSet visit(Tk_default *node, typeId type) override;

  virtual constraintSet visit(Pp_undef *node, typeId type) override;

  virtual constraintSet visit(Pp_endif *node, typeId type) override;

  virtual constraintSet visit(Tk_protected *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_constraint_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Value_range_expression *node,
                              typeId type) override;

  virtual constraintSet visit(Dr_default_decay_time *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_library *node, typeId type) override;

  virtual constraintSet visit(Tk_local *node, typeId type) override;

  virtual constraintSet visit(Tk_untyped *node, typeId type) override;

  virtual constraintSet visit(Tk_unique *node, typeId type) override;

  virtual constraintSet visit(Tk_ssetuphold *node, typeId type) override;

  virtual constraintSet visit(Tk_use *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_module_item *node,
                              typeId type) override;

  virtual constraintSet
  visit(List_of_ports_or_port_declarations_preprocessor_last_non_ansi *node,
        typeId type) override;

  virtual constraintSet visit(Tk_sfullskew *node, typeId type) override;

  virtual constraintSet visit(Tk_buf *node, typeId type) override;

  virtual constraintSet visit(Tk_property *node, typeId type) override;

  virtual constraintSet visit(Tk_pull1 *node, typeId type) override;

  virtual constraintSet visit(Tk_speriod *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_else_constraint_expression_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Select_dimensions *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_module_items_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_timeunit_check *node, typeId type) override;

  virtual constraintSet visit(Parameter_value_range *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_extends *node, typeId type) override;

  virtual constraintSet visit(Tk_trior *node, typeId type) override;

  virtual constraintSet visit(Tk_s_until *node, typeId type) override;

  virtual constraintSet visit(Library_declaration *node, typeId type) override;

  virtual constraintSet visit(Tk_rsort *node, typeId type) override;

  virtual constraintSet visit(Tk_posedge *node, typeId type) override;

  virtual constraintSet visit(Tk_generate *node, typeId type) override;

  virtual constraintSet visit(Tk_design *node, typeId type) override;

  virtual constraintSet visit(Tk_always_comb *node, typeId type) override;

  virtual constraintSet visit(Library_description_list *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_else_generate_item *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_tri0 *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_balanced_statements *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_real *node, typeId type) override;

  virtual constraintSet visit(Tk_from *node, typeId type) override;

  virtual constraintSet visit(Dr_delay_mode_path *node, typeId type) override;

  virtual constraintSet visit(Tk_randomize *node, typeId type) override;

  virtual constraintSet visit(Tk_and *node, typeId type) override;

  virtual constraintSet visit(Tk_logic *node, typeId type) override;

  virtual constraintSet visit(Tk_ddt_nature *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_bins_or_options *node,
                              typeId type) override;

  virtual constraintSet visit(Constraint_expression_list_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Declaration_extends_list *node,
                              typeId type) override;

  virtual constraintSet visit(Pp_include *node, typeId type) override;

  virtual constraintSet visit(Tk_super *node, typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_constraint_block_items *node,
                              typeId type) override;

  virtual constraintSet visit(Preprocessor_elsif_class_items_opt *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_poundminuspound *node, typeId type) override;

  virtual constraintSet visit(Tk_reject_on *node, typeId type) override;

  virtual constraintSet visit(Tk_function *node, typeId type) override;

  virtual constraintSet visit(Tk_sunit *node, typeId type) override;

  virtual constraintSet visit(Tk_restrict *node, typeId type) override;

  virtual constraintSet visit(Tk_task *node, typeId type) override;

  virtual constraintSet visit(Tk_find_last *node, typeId type) override;

  virtual constraintSet visit(Tk_sremoval *node, typeId type) override;

  virtual constraintSet visit(Tk_longint *node, typeId type) override;

  virtual constraintSet visit(Tk_type *node, typeId type) override;

  virtual constraintSet visit(Pd_library_syntax_begin *node,
                              typeId type) override;

  virtual constraintSet visit(Tk_find_index *node, typeId type) override;

  virtual constraintSet visit(Tk_idt_nature *node, typeId type) override;

  virtual constraintSet visit(Tk_import *node, typeId type) override;

  virtual constraintSet visit(Tk_colon_div *node, typeId type) override;

  virtual constraintSet visit(Block_event_or_expr *node, typeId type) override;
};
#endif
