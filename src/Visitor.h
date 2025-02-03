#ifndef VISITOR_H
#define VISITOR_H

#include "AST.h"

/**
 * @brief A generic visitor for traversing and processing nodes in an abstract
 * syntax tree (AST).
 *
 * This template class defines a `visit` function that takes a `Node` pointer
 * and dispatches it to the appropriate virtual `visit` function based on the
 * node's type. This allows visitors to implement specific actions for different
 * node types without requiring knowledge of the exact node hierarchy.
 *
 * @tparam R The return type of the visitor's `visit` functions.
 * @tparam T The type of the data associated with the nodes. This is optional
 * and defaults to `void*`.
 */
template <typename R, typename T = void *> class Visitor {
public:
  virtual R applyVisit(Node *node) {
    switch (node->type) {
    case NodeType::TERMINAL:
      return visit(dynamic_cast<Terminal *>(node));
    case NodeType::SEQUENCE_DELAY_RANGE_EXPR:
      return visit(dynamic_cast<Sequence_delay_range_expr *>(node));
    case NodeType::PORT:
      return visit(dynamic_cast<Port *>(node));
    case NodeType::SPECIFY_SIMPLE_PATH:
      return visit(dynamic_cast<Specify_simple_path *>(node));
    case NodeType::EVENT_CONTROL:
      return visit(dynamic_cast<Event_control *>(node));
    case NodeType::STRING_LITERAL:
      return visit(dynamic_cast<String_literal *>(node));
    case NodeType::CHARGE_STRENGTH_OPT:
      return visit(dynamic_cast<Charge_strength_opt *>(node));
    case NodeType::DPI_IMPORT_EXPORT:
      return visit(dynamic_cast<Dpi_import_export *>(node));
    case NodeType::FOR_INITIALIZATION_OPT:
      return visit(dynamic_cast<For_initialization_opt *>(node));
    case NodeType::LIST_OF_PORT_IDENTIFIERS:
      return visit(dynamic_cast<List_of_port_identifiers *>(node));
    case NodeType::NON_INTEGER_TYPE:
      return visit(dynamic_cast<Non_integer_type *>(node));
    case NodeType::PARAMETER_VALUE_RANGES_OPT:
      return visit(dynamic_cast<Parameter_value_ranges_opt *>(node));
    case NodeType::PACKAGE_ITEM_NO_PP:
      return visit(dynamic_cast<Package_item_no_pp *>(node));
    case NodeType::SEQUENCE_DELAY_REPETITION_LIST:
      return visit(dynamic_cast<Sequence_delay_repetition_list *>(node));
    case NodeType::ADD_EXPR:
      return visit(dynamic_cast<Add_expr *>(node));
    case NodeType::DPI_IMPORT_ITEM:
      return visit(dynamic_cast<Dpi_import_item *>(node));
    case NodeType::TK_REALTIME:
      return visit(dynamic_cast<Tk_realtime *>(node));
    case NodeType::CASE_ITEM:
      return visit(dynamic_cast<Case_item *>(node));
    case NodeType::PROPERTY_IF_ELSE_EXPR:
      return visit(dynamic_cast<Property_if_else_expr *>(node));
    case NodeType::NON_ANONYMOUS_INSTANTIATION_BASE:
      return visit(dynamic_cast<Non_anonymous_instantiation_base *>(node));
    case NodeType::UNARY_EXPR:
      return visit(dynamic_cast<Unary_expr *>(node));
    case NodeType::UNARY_OP:
      return visit(dynamic_cast<Unary_op *>(node));
    case NodeType::CLASS_ID:
      return visit(dynamic_cast<Class_id *>(node));
    case NodeType::REFERENCE:
      return visit(dynamic_cast<Reference *>(node));
    case NodeType::CAST:
      return visit(dynamic_cast<Cast *>(node));
    case NodeType::TF_VARIABLE_IDENTIFIER_FIRST:
      return visit(dynamic_cast<Tf_variable_identifier_first *>(node));
    case NodeType::
        TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<
              Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
                  *>(node));
    case NodeType::TYPE_OR_ID_ROOT:
      return visit(dynamic_cast<Type_or_id_root *>(node));
    case NodeType::MODULE_OR_GENERATE_ITEM:
      return visit(dynamic_cast<Module_or_generate_item *>(node));
    case NodeType::MODULE_PARAMETER_PORT_LIST_TRAILING_COMMA:
      return visit(
          dynamic_cast<Module_parameter_port_list_trailing_comma *>(node));
    case NodeType::INSTANTIATION_TYPE:
      return visit(dynamic_cast<Instantiation_type *>(node));
    case NodeType::PARAMETERS:
      return visit(dynamic_cast<Parameters *>(node));
    case NodeType::REFERENCE_OR_CALL_BASE:
      return visit(dynamic_cast<Reference_or_call_base *>(node));
    case NodeType::PARAM_TYPE_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<Param_type_followed_by_id_and_dimensions_opt *>(node));
    case NodeType::STRUCTURE_OR_ARRAY_PATTERN_KEY:
      return visit(dynamic_cast<Structure_or_array_pattern_key *>(node));
    case NodeType::PARAMETER_ASSIGN_LIST:
      return visit(dynamic_cast<Parameter_assign_list *>(node));
    case NodeType::DEFPARAM_ASSIGN_LIST:
      return visit(dynamic_cast<Defparam_assign_list *>(node));
    case NodeType::GENERATE_ITEM_LIST_OPT:
      return visit(dynamic_cast<Generate_item_list_opt *>(node));
    case NodeType::TK_OCTDIGITS:
      return visit(dynamic_cast<Tk_octdigits *>(node));
    case NodeType::SEQUENCE_EXPR_PRIMARY:
      return visit(dynamic_cast<Sequence_expr_primary *>(node));
    case NodeType::LPVALUE:
      return visit(dynamic_cast<Lpvalue *>(node));
    case NodeType::LABEL_OPT:
      return visit(dynamic_cast<Label_opt *>(node));
    case NodeType::ESCAPEDIDENTIFIER:
      return visit(dynamic_cast<Escapedidentifier *>(node));
    case NodeType::GENERATE_ITEM:
      return visit(dynamic_cast<Generate_item *>(node));
    case NodeType::DATA_TYPE_PRIMITIVE:
      return visit(dynamic_cast<Data_type_primitive *>(node));
    case NodeType::SPEC_REFERENCE_EVENT:
      return visit(dynamic_cast<Spec_reference_event *>(node));
    case NodeType::UDP_INPUT_DECLARATION_LIST:
      return visit(dynamic_cast<Udp_input_declaration_list *>(node));
    case NodeType::NON_PORT_MODULE_ITEM:
      return visit(dynamic_cast<Non_port_module_item *>(node));
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_NON_ANSI:
      return visit(
          dynamic_cast<
              List_of_ports_or_port_declarations_trailing_comma_non_ansi *>(
              node));
    case NodeType::MODULE_PARAMETER_PORT_LIST_OPT:
      return visit(dynamic_cast<Module_parameter_port_list_opt *>(node));
    case NodeType::PROPERTY_PREFIX_EXPR:
      return visit(dynamic_cast<Property_prefix_expr *>(node));
    case NodeType::EXPR_PRIMARY_BRACES:
      return visit(dynamic_cast<Expr_primary_braces *>(node));
    case NodeType::POW_EXPR:
      return visit(dynamic_cast<Pow_expr *>(node));
    case NodeType::FOR_INIT_DECL_OR_ASSIGN:
      return visit(dynamic_cast<For_init_decl_or_assign *>(node));
    case NodeType::UDP_INITIAL:
      return visit(dynamic_cast<Udp_initial *>(node));
    case NodeType::TF_PORT_LIST_PAREN_OPT:
      return visit(dynamic_cast<Tf_port_list_paren_opt *>(node));
    case NodeType::STRUCT_DATA_TYPE:
      return visit(dynamic_cast<Struct_data_type *>(node));
    case NodeType::UDP_SEQU_ENTRY:
      return visit(dynamic_cast<Udp_sequ_entry *>(node));
    case NodeType::NET_VARIABLE_OR_DECL_ASSIGN:
      return visit(dynamic_cast<Net_variable_or_decl_assign *>(node));
    case NodeType::PARAMETER_VALUE_BYNAME_LIST_TRAILING_COMMA:
      return visit(
          dynamic_cast<Parameter_value_byname_list_trailing_comma *>(node));
    case NodeType::INC_OR_DEC_EXPRESSION:
      return visit(dynamic_cast<Inc_or_dec_expression *>(node));
    case NodeType::NET_TYPE:
      return visit(dynamic_cast<Net_type *>(node));
    case NodeType::SELECT_DIMENSIONS_OPT:
      return visit(dynamic_cast<Select_dimensions_opt *>(node));
    case NodeType::SPEC_POLARITY:
      return visit(dynamic_cast<Spec_polarity *>(node));
    case NodeType::MACRO_FORMAL_PARAMETER:
      return visit(dynamic_cast<Macro_formal_parameter *>(node));
    case NodeType::STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION:
      return visit(dynamic_cast<Structure_or_array_pattern_expression *>(node));
    case NodeType::FOR_STEP:
      return visit(dynamic_cast<For_step *>(node));
    case NodeType::SPECPARAM_LIST:
      return visit(dynamic_cast<Specparam_list *>(node));
    case NodeType::TK_BINBASE:
      return visit(dynamic_cast<Tk_binbase *>(node));
    case NodeType::TK_STRINGLITERAL:
      return visit(dynamic_cast<Tk_stringliteral *>(node));
    case NodeType::VAR_OPT:
      return visit(dynamic_cast<Var_opt *>(node));
    case NodeType::IDENTIFIER_OPTIONAL_UNPACKED_DIMENSIONS:
      return visit(
          dynamic_cast<Identifier_optional_unpacked_dimensions *>(node));
    case NodeType::FUNCTION_ITEM_LIST:
      return visit(dynamic_cast<Function_item_list *>(node));
    case NodeType::TYPE_DECLARATION:
      return visit(dynamic_cast<Type_declaration *>(node));
    case NodeType::UDP_BODY:
      return visit(dynamic_cast<Udp_body *>(node));
    case NodeType::MUL_EXPR:
      return visit(dynamic_cast<Mul_expr *>(node));
    case NodeType::PAR_BLOCK:
      return visit(dynamic_cast<Par_block *>(node));
    case NodeType::KEYWORDIDENTIFIER:
      return visit(dynamic_cast<Keywordidentifier *>(node));
    case NodeType::LOGEQ_EXPR:
      return visit(dynamic_cast<Logeq_expr *>(node));
    case NodeType::MODULE_COMMON_ITEM:
      return visit(dynamic_cast<Module_common_item *>(node));
    case NodeType::PRIMITIVE_GATE_INSTANCE:
      return visit(dynamic_cast<Primitive_gate_instance *>(node));
    case NodeType::DATA_TYPE_OR_IMPLICIT:
      return visit(dynamic_cast<Data_type_or_implicit *>(node));
    case NodeType::TK_OCTBASE:
      return visit(dynamic_cast<Tk_octbase *>(node));
    case NodeType::SEQUENCE_EXPR:
      return visit(dynamic_cast<Sequence_expr *>(node));
    case NodeType::TK_HEXBASE:
      return visit(dynamic_cast<Tk_hexbase *>(node));
    case NodeType::PROPERTY_EXPR:
      return visit(dynamic_cast<Property_expr *>(node));
    case NodeType::SEQ_BLOCK:
      return visit(dynamic_cast<Seq_block *>(node));
    case NodeType::TASK_ITEM:
      return visit(dynamic_cast<Task_item *>(node));
    case NodeType::
        DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<
              Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *>(
              node));
    case NodeType::SPECIFY_BLOCK:
      return visit(dynamic_cast<Specify_block *>(node));
    case NodeType::TK_DECNUMBER:
      return visit(dynamic_cast<Tk_decnumber *>(node));
    case NodeType::TK_DECBASE:
      return visit(dynamic_cast<Tk_decbase *>(node));
    case NodeType::PROPERTY_IMPLICATION_EXPR:
      return visit(dynamic_cast<Property_implication_expr *>(node));
    case NodeType::BIT_LOGIC_OPT:
      return visit(dynamic_cast<Bit_logic_opt *>(node));
    case NodeType::INTEGER_ATOM_TYPE:
      return visit(dynamic_cast<Integer_atom_type *>(node));
    case NodeType::LIFETIME:
      return visit(dynamic_cast<Lifetime *>(node));
    case NodeType::ANY_ARGUMENT_LIST:
      return visit(dynamic_cast<Any_argument_list *>(node));
    case NodeType::DELAY_VALUE_LIST:
      return visit(dynamic_cast<Delay_value_list *>(node));
    case NodeType::MODULE_PORT_DECLARATION:
      return visit(dynamic_cast<Module_port_declaration *>(node));
    case NodeType::JUMP_STATEMENT:
      return visit(dynamic_cast<Jump_statement *>(node));
    case NodeType::DELAY_VALUE:
      return visit(dynamic_cast<Delay_value *>(node));
    case NodeType::SEQUENCE_OR_EXPR:
      return visit(dynamic_cast<Sequence_or_expr *>(node));
    case NodeType::MODULE_ATTRIBUTE_FOREIGN_OPT:
      return visit(dynamic_cast<Module_attribute_foreign_opt *>(node));
    case NodeType::TF_PORT_DIRECTION_OPT:
      return visit(dynamic_cast<Tf_port_direction_opt *>(node));
    case NodeType::TF_PORT_ITEM_EXPR_OPT:
      return visit(dynamic_cast<Tf_port_item_expr_opt *>(node));
    case NodeType::CONT_ASSIGN_LIST:
      return visit(dynamic_cast<Cont_assign_list *>(node));
    case NodeType::ANY_ARGUMENT_LIST_TRAILING_COMMA:
      return visit(dynamic_cast<Any_argument_list_trailing_comma *>(node));
    case NodeType::PROCEDURAL_CONTINUOUS_ASSIGNMENT:
      return visit(dynamic_cast<Procedural_continuous_assignment *>(node));
    case NodeType::EXPRESSION_OR_DIST:
      return visit(dynamic_cast<Expression_or_dist *>(node));
    case NodeType::MODULE_START:
      return visit(dynamic_cast<Module_start *>(node));
    case NodeType::EXPR_PRIMARY_PARENS:
      return visit(dynamic_cast<Expr_primary_parens *>(node));
    case NodeType::OPEN_RANGE_LIST:
      return visit(dynamic_cast<Open_range_list *>(node));
    case NodeType::UNARY_PREFIX_EXPR:
      return visit(dynamic_cast<Unary_prefix_expr *>(node));
    case NodeType::DELAY_IDENTIFIER:
      return visit(dynamic_cast<Delay_identifier *>(node));
    case NodeType::LIST_OF_IDENTIFIERS_UNPACKED_DIMENSIONS:
      return visit(
          dynamic_cast<List_of_identifiers_unpacked_dimensions *>(node));
    case NodeType::DELAY_SCOPE:
      return visit(dynamic_cast<Delay_scope *>(node));
    case NodeType::ACTION_BLOCK:
      return visit(dynamic_cast<Action_block *>(node));
    case NodeType::TRAILING_ASSIGN_OPT:
      return visit(dynamic_cast<Trailing_assign_opt *>(node));
    case NodeType::CLASS_ITEM:
      return visit(dynamic_cast<Class_item *>(node));
    case NodeType::ENUM_NAME_LIST_TRAILING_COMMA:
      return visit(dynamic_cast<Enum_name_list_trailing_comma *>(node));
    case NodeType::UDP_PORT_LIST:
      return visit(dynamic_cast<Udp_port_list *>(node));
    case NodeType::EQUIV_IMPL_EXPR:
      return visit(dynamic_cast<Equiv_impl_expr *>(node));
    case NodeType::CLASS_NEW:
      return visit(dynamic_cast<Class_new *>(node));
    case NodeType::PORT_NET_TYPE:
      return visit(dynamic_cast<Port_net_type *>(node));
    case NodeType::UNQUALIFIED_ID:
      return visit(dynamic_cast<Unqualified_id *>(node));
    case NodeType::BEGIN:
      return visit(dynamic_cast<Begin *>(node));
    case NodeType::SYSTEM_TF_CALL:
      return visit(dynamic_cast<System_tf_call *>(node));
    case NodeType::PARAMETER_VALUE_BYNAME_LIST_ITEM_LAST:
      return visit(dynamic_cast<Parameter_value_byname_list_item_last *>(node));
    case NodeType::CONDITIONAL_GENERATE_CONSTRUCT:
      return visit(dynamic_cast<Conditional_generate_construct *>(node));
    case NodeType::TIMESCALE_DIRECTIVE:
      return visit(dynamic_cast<Timescale_directive *>(node));
    case NodeType::PORT_EXPRESSION:
      return visit(dynamic_cast<Port_expression *>(node));
    case NodeType::UDP_SEQU_ENTRY_LIST:
      return visit(dynamic_cast<Udp_sequ_entry_list *>(node));
    case NodeType::SYMBOL_OR_LABEL:
      return visit(dynamic_cast<Symbol_or_label *>(node));
    case NodeType::SIMPLE_SEQUENCE_EXPR:
      return visit(dynamic_cast<Simple_sequence_expr *>(node));
    case NodeType::SYSTEMTFIDENTIFIER:
      return visit(dynamic_cast<Systemtfidentifier *>(node));
    case NodeType::TK_UNBASEDNUMBER:
      return visit(dynamic_cast<Tk_unbasednumber *>(node));
    case NodeType::DECL_DIMENSIONS_OPT:
      return visit(dynamic_cast<Decl_dimensions_opt *>(node));
    case NodeType::CLASS_ITEMS_OPT:
      return visit(dynamic_cast<Class_items_opt *>(node));
    case NodeType::ENUM_NAME:
      return visit(dynamic_cast<Enum_name *>(node));
    case NodeType::PARAMETER_VALUE_OPT:
      return visit(dynamic_cast<Parameter_value_opt *>(node));
    case NodeType::SPECIFY_EDGE_PATH:
      return visit(dynamic_cast<Specify_edge_path *>(node));
    case NodeType::IMPLICIT_CLASS_HANDLE:
      return visit(dynamic_cast<Implicit_class_handle *>(node));
    case NodeType::MODULE_ITEM:
      return visit(dynamic_cast<Module_item *>(node));
    case NodeType::STATEMENT_ITEM:
      return visit(dynamic_cast<Statement_item *>(node));
    case NodeType::TYPE_IDENTIFIER_FOLLOWED_BY_ID:
      return visit(dynamic_cast<Type_identifier_followed_by_id *>(node));
    case NodeType::METHOD_PROTOTYPE:
      return visit(dynamic_cast<Method_prototype *>(node));
    case NodeType::TF_PORT_ITEM:
      return visit(dynamic_cast<Tf_port_item *>(node));
    case NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST:
      return visit(dynamic_cast<Block_item_or_statement_or_null_list *>(node));
    case NodeType::ENDNEW_OPT:
      return visit(dynamic_cast<Endnew_opt *>(node));
    case NodeType::SPECIFY_ITEM_LIST_OPT:
      return visit(dynamic_cast<Specify_item_list_opt *>(node));
    case NodeType::SPECIFY_SIMPLE_PATH_DECL:
      return visit(dynamic_cast<Specify_simple_path_decl *>(node));
    case NodeType::TK_RS_EQ:
      return visit(dynamic_cast<Tk_rs_eq *>(node));
    case NodeType::PACKAGE_IMPORT_ITEM_LIST:
      return visit(dynamic_cast<Package_import_item_list *>(node));
    case NodeType::UDP_PORT_DECL:
      return visit(dynamic_cast<Udp_port_decl *>(node));
    case NodeType::WITH_EXPRS_SUFFIX:
      return visit(dynamic_cast<With_exprs_suffix *>(node));
    case NodeType::GENERATE_REGION:
      return visit(dynamic_cast<Generate_region *>(node));
    case NodeType::CALL_BASE:
      return visit(dynamic_cast<Call_base *>(node));
    case NodeType::ARRAY_LOCATOR_METHOD:
      return visit(dynamic_cast<Array_locator_method *>(node));
    case NodeType::PORT_DECLARATION_ANSI:
      return visit(dynamic_cast<Port_declaration_ansi *>(node));
    case NodeType::BITAND_EXPR:
      return visit(dynamic_cast<Bitand_expr *>(node));
    case NodeType::RANGE_LIST_IN_BRACES:
      return visit(dynamic_cast<Range_list_in_braces *>(node));
    case NodeType::MODULE_PARAMETER_PORT_LIST_ITEM_LAST:
      return visit(dynamic_cast<Module_parameter_port_list_item_last *>(node));
    case NodeType::HEX_BASED_NUMBER:
      return visit(dynamic_cast<Hex_based_number *>(node));
    case NodeType::HIERARCHY_EVENT_IDENTIFIER:
      return visit(dynamic_cast<Hierarchy_event_identifier *>(node));
    case NodeType::LIST_OF_VARIABLE_DECL_ASSIGNMENTS:
      return visit(dynamic_cast<List_of_variable_decl_assignments *>(node));
    case NodeType::RANDOM_QUALIFIER_OPT:
      return visit(dynamic_cast<Random_qualifier_opt *>(node));
    case NodeType::DRIVE_STRENGTH_OPT:
      return visit(dynamic_cast<Drive_strength_opt *>(node));
    case NodeType::TK_TIMELITERAL:
      return visit(dynamic_cast<Tk_timeliteral *>(node));
    case NodeType::VALUE_RANGE:
      return visit(dynamic_cast<Value_range *>(node));
    case NodeType::EXPR_MINTYPMAX_GENERALIZED:
      return visit(dynamic_cast<Expr_mintypmax_generalized *>(node));
    case NodeType::POLARITY_OPERATOR:
      return visit(dynamic_cast<Polarity_operator *>(node));
    case NodeType::PACKAGE_ITEM:
      return visit(dynamic_cast<Package_item *>(node));
    case NodeType::FOR_INITIALIZATION:
      return visit(dynamic_cast<For_initialization *>(node));
    case NodeType::ENUM_DATA_TYPE:
      return visit(dynamic_cast<Enum_data_type *>(node));
    case NodeType::BLOCKING_ASSIGNMENT:
      return visit(dynamic_cast<Blocking_assignment *>(node));
    case NodeType::DELAY1:
      return visit(dynamic_cast<Delay1 *>(node));
    case NodeType::BASED_NUMBER:
      return visit(dynamic_cast<Based_number *>(node));
    case NodeType::PROCEDURAL_TIMING_CONTROL_STATEMENT:
      return visit(dynamic_cast<Procedural_timing_control_statement *>(node));
    case NodeType::BLOCK_ITEM_DECL:
      return visit(dynamic_cast<Block_item_decl *>(node));
    case NodeType::NET_VARIABLE_OR_DECL_ASSIGNS:
      return visit(dynamic_cast<Net_variable_or_decl_assigns *>(node));
    case NodeType::TIME_LITERAL:
      return visit(dynamic_cast<Time_literal *>(node));
    case NodeType::FUNCTION_ITEM_DATA_DECLARATION:
      return visit(dynamic_cast<Function_item_data_declaration *>(node));
    case NodeType::DECL_VARIABLE_DIMENSION:
      return visit(dynamic_cast<Decl_variable_dimension *>(node));
    case NodeType::TF_PORT_LIST_OPT:
      return visit(dynamic_cast<Tf_port_list_opt *>(node));
    case NodeType::ENDFUNCTION_LABEL_OPT:
      return visit(dynamic_cast<Endfunction_label_opt *>(node));
    case NodeType::QUALIFIED_ID:
      return visit(dynamic_cast<Qualified_id *>(node));
    case NodeType::IMMEDIATE_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Immediate_assertion_statement *>(node));
    case NodeType::JOIN_KEYWORD:
      return visit(dynamic_cast<Join_keyword *>(node));
    case NodeType::TK_BINDIGITS:
      return visit(dynamic_cast<Tk_bindigits *>(node));
    case NodeType::EVENT_TRIGGER:
      return visit(dynamic_cast<Event_trigger *>(node));
    case NodeType::DYNAMIC_ARRAY_NEW:
      return visit(dynamic_cast<Dynamic_array_new *>(node));
    case NodeType::MATCHES_EXPR:
      return visit(dynamic_cast<Matches_expr *>(node));
    case NodeType::PORT_REFERENCE_LIST:
      return visit(dynamic_cast<Port_reference_list *>(node));
    case NodeType::ARRAY_REDUCTION_METHOD:
      return visit(dynamic_cast<Array_reduction_method *>(node));
    case NodeType::BUILTIN_ARRAY_METHOD:
      return visit(dynamic_cast<Builtin_array_method *>(node));
    case NodeType::PACKAGE_DECLARATION:
      return visit(dynamic_cast<Package_declaration *>(node));
    case NodeType::ASSIGNMENT_PATTERN_EXPRESSION:
      return visit(dynamic_cast<Assignment_pattern_expression *>(node));
    case NodeType::DRIVE_STRENGTH:
      return visit(dynamic_cast<Drive_strength *>(node));
    case NodeType::PORT_DECLARATION_NON_ANSI:
      return visit(dynamic_cast<Port_declaration_non_ansi *>(node));
    case NodeType::MODULE_PARAMETER_PORT_LIST:
      return visit(dynamic_cast<Module_parameter_port_list *>(node));
    case NodeType::VAR_TYPE:
      return visit(dynamic_cast<Var_type *>(node));
    case NodeType::PARAMETER_OPT:
      return visit(dynamic_cast<Parameter_opt *>(node));
    case NodeType::MODULE_ITEM_LIST:
      return visit(dynamic_cast<Module_item_list *>(node));
    case NodeType::GENERICIDENTIFIER:
      return visit(dynamic_cast<Genericidentifier *>(node));
    case NodeType::PACKAGE_ITEM_LIST_OPT:
      return visit(dynamic_cast<Package_item_list_opt *>(node));
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_ANSI:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_item_last_ansi *>(
              node));
    case NodeType::DATA_TYPE_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<
              Data_type_or_implicit_followed_by_id_and_dimensions_opt *>(node));
    case NodeType::XOR_EXPR:
      return visit(dynamic_cast<Xor_expr *>(node));
    case NodeType::DEC_BASED_NUMBER:
      return visit(dynamic_cast<Dec_based_number *>(node));
    case NodeType::LOOP_STATEMENT:
      return visit(dynamic_cast<Loop_statement *>(node));
    case NodeType::DATA_DECLARATION_OR_MODULE_INSTANTIATION:
      return visit(
          dynamic_cast<Data_declaration_or_module_instantiation *>(node));
    case NodeType::UDP_COMB_ENTRY_LIST:
      return visit(dynamic_cast<Udp_comb_entry_list *>(node));
    case NodeType::BIT_LOGIC:
      return visit(dynamic_cast<Bit_logic *>(node));
    case NodeType::REFERENCE_OR_CALL:
      return visit(dynamic_cast<Reference_or_call *>(node));
    case NodeType::LOCAL_ROOT:
      return visit(dynamic_cast<Local_root *>(node));
    case NodeType::PORT_DIRECTION:
      return visit(dynamic_cast<Port_direction *>(node));
    case NodeType::VARIABLE_DECL_ASSIGNMENT:
      return visit(dynamic_cast<Variable_decl_assignment *>(node));
    case NodeType::SPECIFY_EDGE_PATH_DECL:
      return visit(dynamic_cast<Specify_edge_path_decl *>(node));
    case NodeType::FUNCTION_PROTOTYPE:
      return visit(dynamic_cast<Function_prototype *>(node));
    case NodeType::SEQUENCE_WITHIN_EXPR:
      return visit(dynamic_cast<Sequence_within_expr *>(node));
    case NodeType::EXPR_PRIMARY_NO_GROUPS:
      return visit(dynamic_cast<Expr_primary_no_groups *>(node));
    case NodeType::PARAMETER_VALUE_BYNAME:
      return visit(dynamic_cast<Parameter_value_byname *>(node));
    case NodeType::CASE_ANY:
      return visit(dynamic_cast<Case_any *>(node));
    case NodeType::SPEC_NOTIFIER:
      return visit(dynamic_cast<Spec_notifier *>(node));
    case NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL:
      return visit(dynamic_cast<Block_item_or_statement_or_null *>(node));
    case NodeType::SPECIFY_ITEM:
      return visit(dynamic_cast<Specify_item *>(node));
    case NodeType::ANY_PARAM_DECLARATION:
      return visit(dynamic_cast<Any_param_declaration *>(node));
    case NodeType::TF_PORT_LIST_TRAILING_COMMA:
      return visit(dynamic_cast<Tf_port_list_trailing_comma *>(node));
    case NodeType::STRUCT_UNION_MEMBER:
      return visit(dynamic_cast<Struct_union_member *>(node));
    case NodeType::ANY_PORT_LIST_POSITIONAL:
      return visit(dynamic_cast<Any_port_list_positional *>(node));
    case NodeType::DIR:
      return visit(dynamic_cast<Dir *>(node));
    case NodeType::LIFETIME_OPT:
      return visit(dynamic_cast<Lifetime_opt *>(node));
    case NodeType::LIST_OF_IDENTIFIERS:
      return visit(dynamic_cast<List_of_identifiers *>(node));
    case NodeType::EDGE_OPERATOR:
      return visit(dynamic_cast<Edge_operator *>(node));
    case NodeType::TK_VIRTUAL_OPT:
      return visit(dynamic_cast<Tk_virtual_opt *>(node));
    case NodeType::TIMEUNITS_DECLARATION:
      return visit(dynamic_cast<Timeunits_declaration *>(node));
    case NodeType::TF_ITEM_OR_STATEMENT_OR_NULL:
      return visit(dynamic_cast<Tf_item_or_statement_or_null *>(node));
    case NodeType::PACKAGE_IMPORT_LIST:
      return visit(dynamic_cast<Package_import_list *>(node));
    case NodeType::EXPR_PRIMARY:
      return visit(dynamic_cast<Expr_primary *>(node));
    case NodeType::SIGNED_UNSIGNED_OPT:
      return visit(dynamic_cast<Signed_unsigned_opt *>(node));
    case NodeType::NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST:
      return visit(
          dynamic_cast<Non_anonymous_gate_instance_or_register_variable_list *>(
              node));
    case NodeType::UDP_COMB_ENTRY:
      return visit(dynamic_cast<Udp_comb_entry *>(node));
    case NodeType::DELAY3:
      return visit(dynamic_cast<Delay3 *>(node));
    case NodeType::INC_OR_DEC_OR_PRIMARY_EXPR:
      return visit(dynamic_cast<Inc_or_dec_or_primary_expr *>(node));
    case NodeType::PROCEDURAL_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Procedural_assertion_statement *>(node));
    case NodeType::STRUCT_UNION_MEMBER_LIST:
      return visit(dynamic_cast<Struct_union_member_list *>(node));
    case NodeType::COMP_EXPR:
      return visit(dynamic_cast<Comp_expr *>(node));
    case NodeType::POSTFIX_EXPRESSION:
      return visit(dynamic_cast<Postfix_expression *>(node));
    case NodeType::SYMBOLIDENTIFIER:
      return visit(dynamic_cast<Symbolidentifier *>(node));
    case NodeType::UDP_INPUT_SYM:
      return visit(dynamic_cast<Udp_input_sym *>(node));
    case NodeType::POS_NEG_NUMBER:
      return visit(dynamic_cast<Pos_neg_number *>(node));
    case NodeType::SPECIFY_TERMINAL_DESCRIPTOR:
      return visit(dynamic_cast<Specify_terminal_descriptor *>(node));
    case NodeType::SELECT_VARIABLE_DIMENSION:
      return visit(dynamic_cast<Select_variable_dimension *>(node));
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ANSI:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_ansi *>(node));
    case NodeType::GENERATE_CASE_ITEMS:
      return visit(dynamic_cast<Generate_case_items *>(node));
    case NodeType::DATA_TYPE_PRIMITIVE_SCALAR:
      return visit(dynamic_cast<Data_type_primitive_scalar *>(node));
    case NodeType::TF_ITEM_OR_STATEMENT_OR_NULL_LIST:
      return visit(dynamic_cast<Tf_item_or_statement_or_null_list *>(node));
    case NodeType::CONDITIONAL_STATEMENT:
      return visit(dynamic_cast<Conditional_statement *>(node));
    case NodeType::SPECPARAM_DECL:
      return visit(dynamic_cast<Specparam_decl *>(node));
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_NON_ANSI:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_non_ansi *>(node));
    case NodeType::STATEMENT_OR_NULL_LIST:
      return visit(dynamic_cast<Statement_or_null_list *>(node));
    case NodeType::TASK_DECLARATION:
      return visit(dynamic_cast<Task_declaration *>(node));
    case NodeType::DATA_DECLARATION_BASE:
      return visit(dynamic_cast<Data_declaration_base *>(node));
    case NodeType::ANY_PORT_LIST_OPT:
      return visit(dynamic_cast<Any_port_list_opt *>(node));
    case NodeType::MACRONUMERICWIDTH:
      return visit(dynamic_cast<Macronumericwidth *>(node));
    case NodeType::TRAILING_DECL_ASSIGNMENT_OPT:
      return visit(dynamic_cast<Trailing_decl_assignment_opt *>(node));
    case NodeType::GATE_INSTANCE_OR_REGISTER_VARIABLE:
      return visit(dynamic_cast<Gate_instance_or_register_variable *>(node));
    case NodeType::BIND_INSTANTIATION:
      return visit(dynamic_cast<Bind_instantiation *>(node));
    case NodeType::PACKAGE_IMPORT_DECLARATION:
      return visit(dynamic_cast<Package_import_declaration *>(node));
    case NodeType::MODULE_PACKAGE_IMPORT_LIST_OPT:
      return visit(dynamic_cast<Module_package_import_list_opt *>(node));
    case NodeType::STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION_LIST:
      return visit(
          dynamic_cast<Structure_or_array_pattern_expression_list *>(node));
    case NodeType::EVENT_EXPRESSION_LIST:
      return visit(dynamic_cast<Event_expression_list *>(node));
    case NodeType::TK_RSS_EQ:
      return visit(dynamic_cast<Tk_rss_eq *>(node));
    case NodeType::IMPLEMENTS_INTERFACE_LIST_OPT:
      return visit(dynamic_cast<Implements_interface_list_opt *>(node));
    case NodeType::DELAY3_OPT:
      return visit(dynamic_cast<Delay3_opt *>(node));
    case NodeType::EXPR_MINTYPMAX_TRANS_SET:
      return visit(dynamic_cast<Expr_mintypmax_trans_set *>(node));
    case NodeType::STATEMENT_OR_NULL:
      return visit(dynamic_cast<Statement_or_null *>(node));
    case NodeType::ENUM_NAME_LIST:
      return visit(dynamic_cast<Enum_name_list *>(node));
    case NodeType::SEQUENCE_UNARY_EXPR:
      return visit(dynamic_cast<Sequence_unary_expr *>(node));
    case NodeType::PP_IDENTIFIER:
      return visit(dynamic_cast<Pp_identifier *>(node));
    case NodeType::SHIFT_EXPR:
      return visit(dynamic_cast<Shift_expr *>(node));
    case NodeType::OCT_BASED_NUMBER:
      return visit(dynamic_cast<Oct_based_number *>(node));
    case NodeType::HIERARCHY_SEGMENT:
      return visit(dynamic_cast<Hierarchy_segment *>(node));
    case NodeType::NONBLOCKING_ASSIGNMENT:
      return visit(dynamic_cast<Nonblocking_assignment *>(node));
    case NodeType::EXPRESSION_LIST_PROPER:
      return visit(dynamic_cast<Expression_list_proper *>(node));
    case NodeType::GENERATE_IF:
      return visit(dynamic_cast<Generate_if *>(node));
    case NodeType::FUNCTION_ITEM:
      return visit(dynamic_cast<Function_item *>(node));
    case NodeType::SCOPE_PREFIX:
      return visit(dynamic_cast<Scope_prefix *>(node));
    case NodeType::PRIMITIVE_GATE_INSTANCE_LIST:
      return visit(dynamic_cast<Primitive_gate_instance_list *>(node));
    case NodeType::SIMPLE_IMMEDIATE_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Simple_immediate_assertion_statement *>(node));
    case NodeType::DESCRIPTION_LIST:
      return visit(dynamic_cast<Description_list *>(node));
    case NodeType::DR_STRENGTH0:
      return visit(dynamic_cast<Dr_strength0 *>(node));
    case NodeType::UNIQUE_PRIORITY_OPT:
      return visit(dynamic_cast<Unique_priority_opt *>(node));
    case NodeType::SPECPARAM:
      return visit(dynamic_cast<Specparam *>(node));
    case NodeType::PORT_EXPRESSION_OPT:
      return visit(dynamic_cast<Port_expression_opt *>(node));
    case NodeType::COND_EXPR:
      return visit(dynamic_cast<Cond_expr *>(node));
    case NodeType::TK_REG_OPT:
      return visit(dynamic_cast<Tk_reg_opt *>(node));
    case NodeType::LOGOR_EXPR:
      return visit(dynamic_cast<Logor_expr *>(node));
    case NodeType::DELAY3_OR_DRIVE_OPT:
      return visit(dynamic_cast<Delay3_or_drive_opt *>(node));
    case NodeType::TF_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT:
      return visit(dynamic_cast<Tf_item_or_statement_or_null_list_opt *>(node));
    case NodeType::NET_DECL_ASSIGN:
      return visit(dynamic_cast<Net_decl_assign *>(node));
    case NodeType::ALWAYS_ANY:
      return visit(dynamic_cast<Always_any *>(node));
    case NodeType::LIST_OF_TF_VARIABLE_IDENTIFIERS:
      return visit(dynamic_cast<List_of_tf_variable_identifiers *>(node));
    case NodeType::VAR_OR_NET_TYPE_OPT:
      return visit(dynamic_cast<Var_or_net_type_opt *>(node));
    case NodeType::TF_PORT_LIST_ITEM_LAST:
      return visit(dynamic_cast<Tf_port_list_item_last *>(node));
    case NodeType::TASK_DECLARATION_ID:
      return visit(dynamic_cast<Task_declaration_id *>(node));
    case NodeType::INSTANTIATION_BASE:
      return visit(dynamic_cast<Instantiation_base *>(node));
    case NodeType::SEQUENCE_REPETITION_EXPR:
      return visit(dynamic_cast<Sequence_repetition_expr *>(node));
    case NodeType::TK_HEXDIGITS:
      return visit(dynamic_cast<Tk_hexdigits *>(node));
    case NodeType::NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE:
      return visit(
          dynamic_cast<Non_anonymous_gate_instance_or_register_variable *>(
              node));
    case NodeType::LOCALPARAM_ASSIGN:
      return visit(dynamic_cast<Localparam_assign *>(node));
    case NodeType::CLASS_ITEMS:
      return visit(dynamic_cast<Class_items *>(node));
    case NodeType::EXPRESSION_IN_PARENS:
      return visit(dynamic_cast<Expression_in_parens *>(node));
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_ANSI:
      return visit(
          dynamic_cast<
              List_of_ports_or_port_declarations_trailing_comma_ansi *>(node));
    case NodeType::PORT_REFERENCE:
      return visit(dynamic_cast<Port_reference *>(node));
    case NodeType::DIST_OPT:
      return visit(dynamic_cast<Dist_opt *>(node));
    case NodeType::CASEEQ_EXPR:
      return visit(dynamic_cast<Caseeq_expr *>(node));
    case NodeType::GENERATE_BLOCK:
      return visit(dynamic_cast<Generate_block *>(node));
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_NON_ANSI:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_item_last_non_ansi *>(
              node));
    case NodeType::ANY_ARGUMENT_LIST_ITEM_LAST:
      return visit(dynamic_cast<Any_argument_list_item_last *>(node));
    case NodeType::GATE_INSTANTIATION:
      return visit(dynamic_cast<Gate_instantiation *>(node));
    case NodeType::CASTING_TYPE:
      return visit(dynamic_cast<Casting_type *>(node));
    case NodeType::EXPR_MINTYPMAX:
      return visit(dynamic_cast<Expr_mintypmax *>(node));
    case NodeType::CONTINUOUS_ASSIGN:
      return visit(dynamic_cast<Continuous_assign *>(node));
    case NodeType::PARAMETER_ASSIGN:
      return visit(dynamic_cast<Parameter_assign *>(node));
    case NodeType::DELAY_VALUE_SIMPLE:
      return visit(dynamic_cast<Delay_value_simple *>(node));
    case NodeType::SWITCHTYPE:
      return visit(dynamic_cast<Switchtype *>(node));
    case NodeType::PACKAGE_OR_GENERATE_ITEM_DECLARATION:
      return visit(dynamic_cast<Package_or_generate_item_declaration *>(node));
    case NodeType::BIN_BASED_NUMBER:
      return visit(dynamic_cast<Bin_based_number *>(node));
    case NodeType::LOOP_GENERATE_CONSTRUCT:
      return visit(dynamic_cast<Loop_generate_construct *>(node));
    case NodeType::PARAMETER_OVERRIDE:
      return visit(dynamic_cast<Parameter_override *>(node));
    case NodeType::UDP_PRIMITIVE:
      return visit(dynamic_cast<Udp_primitive *>(node));
    case NodeType::PARAMETER_EXPR:
      return visit(dynamic_cast<Parameter_expr *>(node));
    case NodeType::REPEAT_CONTROL:
      return visit(dynamic_cast<Repeat_control *>(node));
    case NodeType::PACKED_SIGNING_OPT:
      return visit(dynamic_cast<Packed_signing_opt *>(node));
    case NodeType::EXPRESSION_OR_NULL_LIST_OPT:
      return visit(dynamic_cast<Expression_or_null_list_opt *>(node));
    case NodeType::ENUM_NAME_LIST_ITEM_LAST:
      return visit(dynamic_cast<Enum_name_list_item_last *>(node));
    case NodeType::MACRO_FORMALS_LIST_OPT:
      return visit(dynamic_cast<Macro_formals_list_opt *>(node));
    case NodeType::SPEC_NOTIFIER_OPT:
      return visit(dynamic_cast<Spec_notifier_opt *>(node));
    case NodeType::HIERARCHY_EXTENSION:
      return visit(dynamic_cast<Hierarchy_extension *>(node));
    case NodeType::GENERATE_ITEM_LIST:
      return visit(dynamic_cast<Generate_item_list *>(node));
    case NodeType::DATA_DECLARATION_MODIFIERS_OPT:
      return visit(dynamic_cast<Data_declaration_modifiers_opt *>(node));
    case NodeType::SEQUENCE_THROUGHOUT_EXPR:
      return visit(dynamic_cast<Sequence_throughout_expr *>(node));
    case NodeType::PROPERTY_EXPR_OR_ASSIGNMENT_LIST:
      return visit(dynamic_cast<Property_expr_or_assignment_list *>(node));
    case NodeType::BITOR_EXPR:
      return visit(dynamic_cast<Bitor_expr *>(node));
    case NodeType::TF_PORT_LIST:
      return visit(dynamic_cast<Tf_port_list *>(node));
    case NodeType::ANY_PORT_LIST_TRAILING_COMMA_NAMED:
      return visit(dynamic_cast<Any_port_list_trailing_comma_named *>(node));
    case NodeType::FUNCTION_RETURN_TYPE_AND_ID:
      return visit(dynamic_cast<Function_return_type_and_id *>(node));
    case NodeType::STATEMENT:
      return visit(dynamic_cast<Statement *>(node));
    case NodeType::DR_STRENGTH1:
      return visit(dynamic_cast<Dr_strength1 *>(node));
    case NodeType::ASSIGN_MODIFY_STATEMENT:
      return visit(dynamic_cast<Assign_modify_statement *>(node));
    case NodeType::UDP_PORT_DECLS:
      return visit(dynamic_cast<Udp_port_decls *>(node));
    case NodeType::INTEGER_VECTOR_TYPE:
      return visit(dynamic_cast<Integer_vector_type *>(node));
    case NodeType::ASSIGNMENT_PATTERN:
      return visit(dynamic_cast<Assignment_pattern *>(node));
    case NodeType::CLASS_CONSTRUCTOR:
      return visit(dynamic_cast<Class_constructor *>(node));
    case NodeType::MODULE_PARAMETER_PORT:
      return visit(dynamic_cast<Module_parameter_port *>(node));
    case NodeType::MODULE_OR_GENERATE_ITEM_DECLARATION:
      return visit(dynamic_cast<Module_or_generate_item_declaration *>(node));
    case NodeType::FINAL_CONSTRUCT:
      return visit(dynamic_cast<Final_construct *>(node));
    case NodeType::MEMBER_NAME:
      return visit(dynamic_cast<Member_name *>(node));
    case NodeType::CLASS_DECLARATION:
      return visit(dynamic_cast<Class_declaration *>(node));
    case NodeType::PACKAGE_IMPORT_ITEM:
      return visit(dynamic_cast<Package_import_item *>(node));
    case NodeType::SIGNING:
      return visit(dynamic_cast<Signing *>(node));
    case NodeType::CLASS_CONSTRUCTOR_PROTOTYPE:
      return visit(dynamic_cast<Class_constructor_prototype *>(node));
    case NodeType::GENERATE_CASE_ITEM:
      return visit(dynamic_cast<Generate_case_item *>(node));
    case NodeType::DATA_DECLARATION:
      return visit(dynamic_cast<Data_declaration *>(node));
    case NodeType::EXPRESSION:
      return visit(dynamic_cast<Expression *>(node));
    case NodeType::CONT_ASSIGN:
      return visit(dynamic_cast<Cont_assign *>(node));
    case NodeType::DELAY_OR_EVENT_CONTROL_OPT:
      return visit(dynamic_cast<Delay_or_event_control_opt *>(node));
    case NodeType::BIND_DIRECTIVE:
      return visit(dynamic_cast<Bind_directive *>(node));
    case NodeType::MISC_DIRECTIVE:
      return visit(dynamic_cast<Misc_directive *>(node));
    case NodeType::UDP_INITIAL_EXPR_OPT:
      return visit(dynamic_cast<Udp_initial_expr_opt *>(node));
    case NodeType::DESCRIPTION:
      return visit(dynamic_cast<Description *>(node));
    case NodeType::DATA_TYPE_BASE:
      return visit(dynamic_cast<Data_type_base *>(node));
    case NodeType::TRAILING_ASSIGN:
      return visit(dynamic_cast<Trailing_assign *>(node));
    case NodeType::MODULE_END:
      return visit(dynamic_cast<Module_end *>(node));
    case NodeType::WAIT_STATEMENT:
      return visit(dynamic_cast<Wait_statement *>(node));
    case NodeType::PACKAGE_ITEM_LIST:
      return visit(dynamic_cast<Package_item_list *>(node));
    case NodeType::CASE_ITEMS:
      return visit(dynamic_cast<Case_items *>(node));
    case NodeType::STATEMENT_OR_NULL_LIST_OPT:
      return visit(dynamic_cast<Statement_or_null_list_opt *>(node));
    case NodeType::PORT_NAMED:
      return visit(dynamic_cast<Port_named *>(node));
    case NodeType::UDP_OUTPUT_SYM:
      return visit(dynamic_cast<Udp_output_sym *>(node));
    case NodeType::ASSIGNMENT_STATEMENT_NO_EXPR:
      return visit(dynamic_cast<Assignment_statement_no_expr *>(node));
    case NodeType::ANY_PORT_LIST_ITEM_LAST_POSITIONAL:
      return visit(dynamic_cast<Any_port_list_item_last_positional *>(node));
    case NodeType::MODULE_ITEM_LIST_OPT:
      return visit(dynamic_cast<Module_item_list_opt *>(node));
    case NodeType::SEQUENCE_AND_EXPR:
      return visit(dynamic_cast<Sequence_and_expr *>(node));
    case NodeType::DATA_TYPE:
      return visit(dynamic_cast<Data_type *>(node));
    case NodeType::ARGUMENT_LIST_OPT:
      return visit(dynamic_cast<Argument_list_opt *>(node));
    case NodeType::FOR_STEP_OPT:
      return visit(dynamic_cast<For_step_opt *>(node));
    case NodeType::SEQUENCE_INTERSECT_EXPR:
      return visit(dynamic_cast<Sequence_intersect_expr *>(node));
    case NodeType::FUNCTION_DECLARATION:
      return visit(dynamic_cast<Function_declaration *>(node));
    case NodeType::NET_TYPE_OR_NONE:
      return visit(dynamic_cast<Net_type_or_none *>(node));
    case NodeType::CLASS_DECLARATION_EXTENDS_OPT:
      return visit(dynamic_cast<Class_declaration_extends_opt *>(node));
    case NodeType::BOOLEAN_ABBREV_OPT:
      return visit(dynamic_cast<Boolean_abbrev_opt *>(node));
    case NodeType::SPECIFY_PATH_IDENTIFIERS:
      return visit(dynamic_cast<Specify_path_identifiers *>(node));
    case NodeType::TF_PORT_DIRECTION:
      return visit(dynamic_cast<Tf_port_direction *>(node));
    case NodeType::TK_DECDIGITS:
      return visit(dynamic_cast<Tk_decdigits *>(node));
    case NodeType::END:
      return visit(dynamic_cast<End *>(node));
    case NodeType::NET_DECLARATION:
      return visit(dynamic_cast<Net_declaration *>(node));
    case NodeType::TK_TAGGED_OPT:
      return visit(dynamic_cast<Tk_tagged_opt *>(node));
    case NodeType::TK_XZDIGITS:
      return visit(dynamic_cast<Tk_xzdigits *>(node));
    case NodeType::GATETYPE:
      return visit(dynamic_cast<Gatetype *>(node));
    case NodeType::PREPROCESS_INCLUDE_ARGUMENT:
      return visit(dynamic_cast<Preprocess_include_argument *>(node));
    case NodeType::MACRO_FORMALS_LIST:
      return visit(dynamic_cast<Macro_formals_list *>(node));
    case NodeType::CONST_OPT:
      return visit(dynamic_cast<Const_opt *>(node));
    case NodeType::LOGAND_EXPR:
      return visit(dynamic_cast<Logand_expr *>(node));
    case NodeType::EVENT_EXPRESSION:
      return visit(dynamic_cast<Event_expression *>(node));
    case NodeType::UDP_ENTRY_LIST:
      return visit(dynamic_cast<Udp_entry_list *>(node));
    case NodeType::PREPROCESSOR_ACTION:
      return visit(dynamic_cast<Preprocessor_action *>(node));
    case NodeType::TF_PORT_DECLARATION:
      return visit(dynamic_cast<Tf_port_declaration *>(node));
    case NodeType::UDP_INIT_OPT:
      return visit(dynamic_cast<Udp_init_opt *>(node));
    case NodeType::
        TYPE_IDENTIFIER_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<
              Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *>(
              node));
    case NodeType::SOURCE_TEXT:
      return visit(dynamic_cast<Source_text *>(node));
    case NodeType::DEFPARAM_ASSIGN:
      return visit(dynamic_cast<Defparam_assign *>(node));
    case NodeType::DECL_DIMENSIONS:
      return visit(dynamic_cast<Decl_dimensions *>(node));
    case NodeType::CONSTANT_DEC_NUMBER:
      return visit(dynamic_cast<Constant_dec_number *>(node));
    case NodeType::CASE_STATEMENT:
      return visit(dynamic_cast<Case_statement *>(node));
    case NodeType::ASSIGNMENT_STATEMENT:
      return visit(dynamic_cast<Assignment_statement *>(node));
    case NodeType::DPI_IMPORT_PROPERTY_OPT:
      return visit(dynamic_cast<Dpi_import_property_opt *>(node));
    case NodeType::DPI_SPEC_STRING:
      return visit(dynamic_cast<Dpi_spec_string *>(node));
    case NodeType::TRAILING_DECL_ASSIGNMENT:
      return visit(dynamic_cast<Trailing_decl_assignment *>(node));
    case NodeType::ALWAYS_CONSTRUCT:
      return visit(dynamic_cast<Always_construct *>(node));
    case NodeType::GENVAR_OPT:
      return visit(dynamic_cast<Genvar_opt *>(node));
    case NodeType::ANY_PORT_LIST_NAMED:
      return visit(dynamic_cast<Any_port_list_named *>(node));
    case NodeType::SUBROUTINE_CALL:
      return visit(dynamic_cast<Subroutine_call *>(node));
    case NodeType::PROPERTY_EXPR_OR_ASSIGNMENT:
      return visit(dynamic_cast<Property_expr_or_assignment *>(node));
    case NodeType::ANY_ARGUMENT:
      return visit(dynamic_cast<Any_argument *>(node));
    case NodeType::MODULE_OR_INTERFACE_DECLARATION:
      return visit(dynamic_cast<Module_or_interface_declaration *>(node));
    case NodeType::EXPRESSION_OPT:
      return visit(dynamic_cast<Expression_opt *>(node));
    case NodeType::GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST:
      return visit(
          dynamic_cast<Gate_instance_or_register_variable_list *>(node));
    case NodeType::TK_EVALSTRINGLITERAL:
      return visit(dynamic_cast<Tk_evalstringliteral *>(node));
    case NodeType::DELAY_OR_EVENT_CONTROL:
      return visit(dynamic_cast<Delay_or_event_control *>(node));
    case NodeType::UDP_INPUT_LIST:
      return visit(dynamic_cast<Udp_input_list *>(node));
    case NodeType::PARAMETER_VALUE_BYNAME_LIST:
      return visit(dynamic_cast<Parameter_value_byname_list *>(node));
    case NodeType::MODULE_PORT_LIST_OPT:
      return visit(dynamic_cast<Module_port_list_opt *>(node));
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_OPT:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_opt *>(node));
    case NodeType::ANY_PORT_LIST_TRAILING_COMMA_POSITIONAL:
      return visit(
          dynamic_cast<Any_port_list_trailing_comma_positional *>(node));
    case NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT:
      return visit(
          dynamic_cast<Block_item_or_statement_or_null_list_opt *>(node));
    case NodeType::GENVAR_DECLARATION:
      return visit(dynamic_cast<Genvar_declaration *>(node));
    case NodeType::NUMBER:
      return visit(dynamic_cast<Number *>(node));
    case NodeType::SPECIFY_ITEM_LIST:
      return visit(dynamic_cast<Specify_item_list *>(node));
    case NodeType::TK_LS_EQ:
      return visit(dynamic_cast<Tk_ls_eq *>(node));
    case NodeType::TF_VARIABLE_IDENTIFIER:
      return visit(dynamic_cast<Tf_variable_identifier *>(node));
    case NodeType::INITIAL_CONSTRUCT:
      return visit(dynamic_cast<Initial_construct *>(node));
    case NodeType::LOCALPARAM_ASSIGN_LIST:
      return visit(dynamic_cast<Localparam_assign_list *>(node));
    case NodeType::DISABLE_STATEMENT:
      return visit(dynamic_cast<Disable_statement *>(node));
    case NodeType::LIST_OF_MODULE_ITEM_IDENTIFIERS:
      return visit(dynamic_cast<List_of_module_item_identifiers *>(node));
    case NodeType::ANY_PORT_LIST_ITEM_LAST_NAMED:
      return visit(dynamic_cast<Any_port_list_item_last_named *>(node));
    case NodeType::NET_VARIABLE:
      return visit(dynamic_cast<Net_variable *>(node));
    case NodeType::PARAMETER_EXPR_LIST:
      return visit(dynamic_cast<Parameter_expr_list *>(node));
    case NodeType::SPECPARAM_DECLARATION:
      return visit(dynamic_cast<Specparam_declaration *>(node));
    case NodeType::DEFERRED_IMMEDIATE_ASSERTION_STATEMENT:
      return visit(
          dynamic_cast<Deferred_immediate_assertion_statement *>(node));
    case NodeType::SLICE_SIZE_OPT:
      return visit(dynamic_cast<Slice_size_opt *>(node));
    case NodeType::CONCURRENT_ASSERTION_ITEM:
      return visit(dynamic_cast<Concurrent_assertion_item *>(node));
    case NodeType::CLOCKING_ITEM_LIST_OPT:
      return visit(dynamic_cast<Clocking_item_list_opt *>(node));
    case NodeType::CYCLE_DELAY:
      return visit(dynamic_cast<Cycle_delay *>(node));
    case NodeType::MACROIDITEM:
      return visit(dynamic_cast<Macroiditem *>(node));
    case NodeType::ASSUME_PROPERTY_STATEMENT:
      return visit(dynamic_cast<Assume_property_statement *>(node));
    case NodeType::PULL01:
      return visit(dynamic_cast<Pull01 *>(node));
    case NodeType::PREPROCESSOR_DIRECTIVE:
      return visit(dynamic_cast<Preprocessor_directive *>(node));
    case NodeType::MODULE_ITEM_DIRECTIVE:
      return visit(dynamic_cast<Module_item_directive *>(node));
    case NodeType::ASSERT_PROPERTY_STATEMENT:
      return visit(dynamic_cast<Assert_property_statement *>(node));
    case NodeType::SCOPE_OR_IF_RES:
      return visit(dynamic_cast<Scope_or_if_res *>(node));
    case NodeType::TASK_PROTOTYPE:
      return visit(dynamic_cast<Task_prototype *>(node));
    case NodeType::CLOCKING_DECLARATION:
      return visit(dynamic_cast<Clocking_declaration *>(node));
    case NodeType::BLOCK_IDENTIFIER_OPT:
      return visit(dynamic_cast<Block_identifier_opt *>(node));
    case NodeType::MACROIDENTIFIER:
      return visit(dynamic_cast<Macroidentifier *>(node));
    case NodeType::PROPERTY_SPEC_DISABLE_IFF_OPT:
      return visit(dynamic_cast<Property_spec_disable_iff_opt *>(node));
    case NodeType::MACROGENERICITEM:
      return visit(dynamic_cast<Macrogenericitem *>(node));
    case NodeType::MODULE_BLOCK:
      return visit(dynamic_cast<Module_block *>(node));
    case NodeType::STREAM_EXPRESSION:
      return visit(dynamic_cast<Stream_expression *>(node));
    case NodeType::FINAL_OR_ZERO:
      return visit(dynamic_cast<Final_or_zero *>(node));
    case NodeType::TK_EDGE_DESCRIPTOR:
      return visit(dynamic_cast<Tk_edge_descriptor *>(node));
    case NodeType::METHOD_PROPERTY_QUALIFIER_LIST_NOT_STARTING_WITH_VIRTUAL:
      return visit(dynamic_cast<
                   Method_property_qualifier_list_not_starting_with_virtual *>(
          node));
    case NodeType::IDENTIFIER_OPT:
      return visit(dynamic_cast<Identifier_opt *>(node));
    case NodeType::MODULE_PARAMETER_PORT_LIST_PREPROCESSOR_LAST:
      return visit(
          dynamic_cast<Module_parameter_port_list_preprocessor_last *>(node));
    case NodeType::TYPE_ASSIGNMENT:
      return visit(dynamic_cast<Type_assignment *>(node));
    case NodeType::TYPE_ASSIGNMENT_LIST:
      return visit(dynamic_cast<Type_assignment_list *>(node));
    case NodeType::METHOD_QUALIFIER_LIST_OPT:
      return visit(dynamic_cast<Method_qualifier_list_opt *>(node));
    case NodeType::STREAM_OPERATOR:
      return visit(dynamic_cast<Stream_operator *>(node));
    case NodeType::ASSERTION_ITEM:
      return visit(dynamic_cast<Assertion_item *>(node));
    case NodeType::PROPERTY_SPEC:
      return visit(dynamic_cast<Property_spec *>(node));
    case NodeType::STREAMING_CONCATENATION:
      return visit(dynamic_cast<Streaming_concatenation *>(node));
    case NodeType::EDGE_DESCRIPTOR_LIST:
      return visit(dynamic_cast<Edge_descriptor_list *>(node));
    case NodeType::PROPERTY_QUALIFIER:
      return visit(dynamic_cast<Property_qualifier *>(node));
    case NodeType::EVENT_CONTROL_OPT:
      return visit(dynamic_cast<Event_control_opt *>(node));
    case NodeType::CLASS_ITEM_QUALIFIER:
      return visit(dynamic_cast<Class_item_qualifier *>(node));
    case NodeType::CONCURRENT_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Concurrent_assertion_statement *>(node));
    case NodeType::COVER_PROPERTY_STATEMENT:
      return visit(dynamic_cast<Cover_property_statement *>(node));
    case NodeType::STREAM_EXPRESSION_LIST:
      return visit(dynamic_cast<Stream_expression_list *>(node));
    case NodeType::CLASS_ITEM_QUALIFIER_LIST_OPT:
      return visit(dynamic_cast<Class_item_qualifier_list_opt *>(node));
    case NodeType::ASSERTION_ITEM_DECLARATION:
      return visit(dynamic_cast<Assertion_item_declaration *>(node));
    case NodeType::BOOLEAN_ABBREV:
      return visit(dynamic_cast<Boolean_abbrev *>(node));
    case NodeType::CYCLE_DELAY_RANGE:
      return visit(dynamic_cast<Cycle_delay_range *>(node));
    case NodeType::PROPERTY_OPERATOR:
      return visit(dynamic_cast<Property_operator *>(node));
    case NodeType::PROPERTY_SPEC_DISABLE_IFF:
      return visit(dynamic_cast<Property_spec_disable_iff *>(node));
    case NodeType::CONFIG_DECLARATION:
      return visit(dynamic_cast<Config_declaration *>(node));
    case NodeType::WITH_CONSTRAINT_BLOCK_OPT:
      return visit(dynamic_cast<With_constraint_block_opt *>(node));
    case NodeType::RANDOM_QUALIFIER:
      return visit(dynamic_cast<Random_qualifier *>(node));
    case NodeType::BIND_TARGET_INSTANCE_LIST:
      return visit(dynamic_cast<Bind_target_instance_list *>(node));
    case NodeType::HIERARCHY_OR_CALL_EXTENSION:
      return visit(dynamic_cast<Hierarchy_or_call_extension *>(node));
    case NodeType::CLOCKING_ITEM_LIST:
      return visit(dynamic_cast<Clocking_item_list *>(node));
    case NodeType::MODPORT_DECLARATION:
      return visit(dynamic_cast<Modport_declaration *>(node));
    case NodeType::CLASS_CONSTRAINT:
      return visit(dynamic_cast<Class_constraint *>(node));
    case NodeType::NET_ALIAS:
      return visit(dynamic_cast<Net_alias *>(node));
    case NodeType::TYPE_REFERENCE:
      return visit(dynamic_cast<Type_reference *>(node));
    case NodeType::METHOD_QUALIFIER_LIST:
      return visit(dynamic_cast<Method_qualifier_list *>(node));
    case NodeType::INTERFACE_TYPE:
      return visit(dynamic_cast<Interface_type *>(node));
    case NodeType::PACKAGE_EXPORT_DECLARATION:
      return visit(dynamic_cast<Package_export_declaration *>(node));
case NodeType::INTERFACE_OPT: 
  return visit(dynamic_cast<Interface_opt *>(node));

case NodeType::DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID: 
  return visit(dynamic_cast<Data_type_or_implicit_basic_followed_by_id *>(node));

case NodeType::COVERAGE_SPEC_OR_OPTION_LIST_OPT: 
  return visit(dynamic_cast<Coverage_spec_or_option_list_opt *>(node));

case NodeType::MODPORT_ITEM_LIST: 
  return visit(dynamic_cast<Modport_item_list *>(node));

case NodeType::EXPECT_PROPERTY_STATEMENT: 
  return visit(dynamic_cast<Expect_property_statement *>(node));

case NodeType::LIB_CELL_IDENTIFIERS_OPT: 
  return visit(dynamic_cast<Lib_cell_identifiers_opt *>(node));

case NodeType::SEQUENCE_PORT_LIST_IN_PARENS_OPT: 
  return visit(dynamic_cast<Sequence_port_list_in_parens_opt *>(node));

case NodeType::CLOCKING_DIRECTION: 
  return visit(dynamic_cast<Clocking_direction *>(node));

case NodeType::GOTO_REPETITION: 
  return visit(dynamic_cast<Goto_repetition *>(node));

case NodeType::CONSTRAINT_BLOCK_ITEM: 
  return visit(dynamic_cast<Constraint_block_item *>(node));

case NodeType::ASSERTION_VARIABLE_DECLARATION: 
  return visit(dynamic_cast<Assertion_variable_declaration *>(node));

case NodeType::TK_STATIC_OPT: 
  return visit(dynamic_cast<TK_static_opt *>(node));

case NodeType::DESIGN_STATEMENT: 
  return visit(dynamic_cast<Design_statement *>(node));

case NodeType::SEQUENCE_DECLARATION: 
  return visit(dynamic_cast<Sequence_declaration *>(node));

case NodeType::CLOCKING_ITEM: 
  return visit(dynamic_cast<Clocking_item *>(node));

case NodeType::PROPERTY_PORT_ITEM: 
  return visit(dynamic_cast<Property_port_item *>(node));

case NodeType::LIST_OF_CONFIG_RULE_STATEMENTS: 
  return visit(dynamic_cast<List_of_config_rule_statements *>(node));

case NodeType::CYCLE_RANGE: 
  return visit(dynamic_cast<Cycle_range *>(node));

case NodeType::BIND_TARGET_INSTANCE: 
  return visit(dynamic_cast<Bind_target_instance *>(node));

case NodeType::LIB_CELL_ID: 
  return visit(dynamic_cast<Lib_cell_id *>(node));

case NodeType::PROPERTY_DECLARATION: 
  return visit(dynamic_cast<Property_declaration *>(node));

case NodeType::PROPERTY_FORMAL_TYPE_FOLLOWED_BY_ID: 
  return visit(dynamic_cast<Property_formal_type_followed_by_id *>(node));

case NodeType::MODPORT_SIMPLE_PORTS_DECLARATION_LAST: 
  return visit(dynamic_cast<Modport_simple_ports_declaration_last *>(node));

case NodeType::COVERGROUP_DECLARATION: 
  return visit(dynamic_cast<Covergroup_declaration *>(node));

case NodeType::COVERAGE_SPEC: 
  return visit(dynamic_cast<Coverage_spec *>(node));

case NodeType::CONSECUTIVE_REPETITION: 
  return visit(dynamic_cast<Consecutive_repetition *>(node));

case NodeType::LIST_OF_LIBRARIES_OPT: 
  return visit(dynamic_cast<List_of_libraries_opt *>(node));

case NodeType::IDENTIFIER_LIST_IN_PARENS_OPT: 
  return visit(dynamic_cast<Identifier_list_in_parens_opt *>(node));

case NodeType::LIST_OF_CLOCKING_DECL_ASSIGN: 
  return visit(dynamic_cast<List_of_clocking_decl_assign *>(node));

case NodeType::COVERAGE_EVENT: 
  return visit(dynamic_cast<Coverage_event *>(node));

case NodeType::CONFIG_RULE_STATEMENT: 
  return visit(dynamic_cast<Config_rule_statement *>(node));

case NodeType::TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID: 
  return visit(dynamic_cast<Type_identifier_or_implicit_basic_followed_by_id *>(node));

case NodeType::ASSERTION_VARIABLE_DECLARATION_LIST: 
  return visit(dynamic_cast<Assertion_variable_declaration_list *>(node));

case NodeType::CONSTRAINT_EXPRESSION_NO_PREPROCESSOR: 
  return visit(dynamic_cast<Constraint_expression_no_preprocessor *>(node));

case NodeType::CLOCKING_DECL_ASSIGN: 
  return visit(dynamic_cast<Clocking_decl_assign *>(node));

case NodeType::WITH_CONSTRAINT_BLOCK: 
  return visit(dynamic_cast<With_constraint_block *>(node));

case NodeType::OPTIONAL_SEMICOLON: 
  return visit(dynamic_cast<Optional_semicolon *>(node));

case NodeType::PROPERTY_PORT_LIST_IN_PARENS_OPT: 
  return visit(dynamic_cast<Property_port_list_in_parens_opt *>(node));

case NodeType::MODPORT_SIMPLE_PORTS_DECLARATION_BEGIN: 
  return visit(dynamic_cast<Modport_simple_ports_declaration_begin *>(node));

case NodeType::MODPORT_SIMPLE_PORT: 
  return visit(dynamic_cast<Modport_simple_port *>(node));

case NodeType::CLOCKING_SKEW_OPT: 
  return visit(dynamic_cast<Clocking_skew_opt *>(node));

case NodeType::IMPLICATION_OPERATOR: 
  return visit(dynamic_cast<Implication_operator *>(node));

case NodeType::NET_ALIAS_ASSIGN_LVALUE_LIST: 
  return visit(dynamic_cast<Net_alias_assign_lvalue_list *>(node));

case NodeType::NONCONSECUTIVE_REPETITION: 
  return visit(dynamic_cast<Nonconsecutive_repetition *>(node));

case NodeType::BINS_OR_OPTIONS_LIST_OPT: 
  return visit(dynamic_cast<Bins_or_options_list_opt *>(node));

case NodeType::SEQUENCE_PORT_LIST_OPT: 
  return visit(dynamic_cast<Sequence_port_list_opt *>(node));

case NodeType::PROPERTY_PORT_MODIFIERS_OPT: 
  return visit(dynamic_cast<Property_port_modifiers_opt *>(node));

case NodeType::LIBLIST_CLAUSE: 
  return visit(dynamic_cast<Liblist_clause *>(node));

case NodeType::CONSTRAINT_DECLARATION: 
  return visit(dynamic_cast<Constraint_declaration *>(node));

case NodeType::PROPERTY_ACTUAL_ARG_OPT: 
  return visit(dynamic_cast<Property_actual_arg_opt *>(node));

case NodeType::LIST_OF_CONFIG_RULE_STATEMENTS_OPT: 
  return visit(dynamic_cast<List_of_config_rule_statements_opt *>(node));

case NodeType::MODPORT_PORTS_LIST: 
  return visit(dynamic_cast<Modport_ports_list *>(node));

case NodeType::COVER_POINT: 
  return visit(dynamic_cast<Cover_point *>(node));

case NodeType::MODPORT_ITEM: 
  return visit(dynamic_cast<Modport_item *>(node));

case NodeType::CONSTRAINT_BLOCK_ITEM_LIST_OPT: 
  return visit(dynamic_cast<Constraint_block_item_list_opt *>(node));

case NodeType::LIB_CELL_IDENTIFIERS: 
  return visit(dynamic_cast<Lib_cell_identifiers *>(node));

case NodeType::METHOD_QUALIFIER: 
  return visit(dynamic_cast<Method_qualifier *>(node));

case NodeType::PROPERTY_PORT_LIST: 
  return visit(dynamic_cast<Property_port_list *>(node));

case NodeType::LIST_OF_LIBRARIES: 
  return visit(dynamic_cast<List_of_libraries *>(node));

case NodeType::CONSTRAINT_BLOCK_ITEM_LIST: 
  return visit(dynamic_cast<Constraint_block_item_list *>(node));

case NodeType::COVERAGE_SPEC_OR_OPTION_LIST: 
  return visit(dynamic_cast<Coverage_spec_or_option_list *>(node));

case NodeType::CONSTRAINT_BLOCK: 
  return visit(dynamic_cast<Constraint_block *>(node));

case NodeType::COVERAGE_EVENT_OPT: 
  return visit(dynamic_cast<Coverage_event_opt *>(node));

case NodeType::CYCLE_RANGE_OR_EXPR: 
  return visit(dynamic_cast<Cycle_range_or_expr *>(node));

case NodeType::COVERAGE_SPEC_OR_OPTION: 
  return visit(dynamic_cast<Coverage_spec_or_option *>(node));

    case NodeType::TK_STATIC_OPT:
      return visit(dynamic_cast<Tk_static_opt *>(node));
    default:
      return R();
    }
  }

  virtual R applyVisit(Node *node, T arg) {
    switch (node->type) {
    case NodeType::TERMINAL:
      return visit(dynamic_cast<Terminal *>(node), arg);
    case NodeType::SEQUENCE_DELAY_RANGE_EXPR:
      return visit(dynamic_cast<Sequence_delay_range_expr *>(node), arg);
    case NodeType::PORT:
      return visit(dynamic_cast<Port *>(node), arg);
    case NodeType::SPECIFY_SIMPLE_PATH:
      return visit(dynamic_cast<Specify_simple_path *>(node), arg);
    case NodeType::EVENT_CONTROL:
      return visit(dynamic_cast<Event_control *>(node), arg);
    case NodeType::STRING_LITERAL:
      return visit(dynamic_cast<String_literal *>(node), arg);
    case NodeType::CHARGE_STRENGTH_OPT:
      return visit(dynamic_cast<Charge_strength_opt *>(node), arg);
    case NodeType::DPI_IMPORT_EXPORT:
      return visit(dynamic_cast<Dpi_import_export *>(node), arg);
    case NodeType::FOR_INITIALIZATION_OPT:
      return visit(dynamic_cast<For_initialization_opt *>(node), arg);
    case NodeType::LIST_OF_PORT_IDENTIFIERS:
      return visit(dynamic_cast<List_of_port_identifiers *>(node), arg);
    case NodeType::NON_INTEGER_TYPE:
      return visit(dynamic_cast<Non_integer_type *>(node), arg);
    case NodeType::PARAMETER_VALUE_RANGES_OPT:
      return visit(dynamic_cast<Parameter_value_ranges_opt *>(node), arg);
    case NodeType::PACKAGE_ITEM_NO_PP:
      return visit(dynamic_cast<Package_item_no_pp *>(node), arg);
    case NodeType::SEQUENCE_DELAY_REPETITION_LIST:
      return visit(dynamic_cast<Sequence_delay_repetition_list *>(node), arg);
    case NodeType::ADD_EXPR:
      return visit(dynamic_cast<Add_expr *>(node), arg);
    case NodeType::DPI_IMPORT_ITEM:
      return visit(dynamic_cast<Dpi_import_item *>(node), arg);
    case NodeType::TK_REALTIME:
      return visit(dynamic_cast<Tk_realtime *>(node), arg);
    case NodeType::CASE_ITEM:
      return visit(dynamic_cast<Case_item *>(node), arg);
    case NodeType::PROPERTY_IF_ELSE_EXPR:
      return visit(dynamic_cast<Property_if_else_expr *>(node), arg);
    case NodeType::NON_ANONYMOUS_INSTANTIATION_BASE:
      return visit(dynamic_cast<Non_anonymous_instantiation_base *>(node), arg);
    case NodeType::UNARY_EXPR:
      return visit(dynamic_cast<Unary_expr *>(node), arg);
    case NodeType::UNARY_OP:
      return visit(dynamic_cast<Unary_op *>(node), arg);
    case NodeType::CLASS_ID:
      return visit(dynamic_cast<Class_id *>(node), arg);
    case NodeType::REFERENCE:
      return visit(dynamic_cast<Reference *>(node), arg);
    case NodeType::CAST:
      return visit(dynamic_cast<Cast *>(node), arg);
    case NodeType::TF_VARIABLE_IDENTIFIER_FIRST:
      return visit(dynamic_cast<Tf_variable_identifier_first *>(node), arg);
    case NodeType::
        TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<
              Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
                  *>(node),
          arg);
    case NodeType::TYPE_OR_ID_ROOT:
      return visit(dynamic_cast<Type_or_id_root *>(node), arg);
    case NodeType::MODULE_OR_GENERATE_ITEM:
      return visit(dynamic_cast<Module_or_generate_item *>(node), arg);
    case NodeType::MODULE_PARAMETER_PORT_LIST_TRAILING_COMMA:
      return visit(
          dynamic_cast<Module_parameter_port_list_trailing_comma *>(node), arg);
    case NodeType::INSTANTIATION_TYPE:
      return visit(dynamic_cast<Instantiation_type *>(node), arg);
    case NodeType::PARAMETERS:
      return visit(dynamic_cast<Parameters *>(node), arg);
    case NodeType::REFERENCE_OR_CALL_BASE:
      return visit(dynamic_cast<Reference_or_call_base *>(node), arg);
    case NodeType::PARAM_TYPE_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<Param_type_followed_by_id_and_dimensions_opt *>(node),
          arg);
    case NodeType::STRUCTURE_OR_ARRAY_PATTERN_KEY:
      return visit(dynamic_cast<Structure_or_array_pattern_key *>(node), arg);
    case NodeType::PARAMETER_ASSIGN_LIST:
      return visit(dynamic_cast<Parameter_assign_list *>(node), arg);
    case NodeType::DEFPARAM_ASSIGN_LIST:
      return visit(dynamic_cast<Defparam_assign_list *>(node), arg);
    case NodeType::GENERATE_ITEM_LIST_OPT:
      return visit(dynamic_cast<Generate_item_list_opt *>(node), arg);
    case NodeType::TK_OCTDIGITS:
      return visit(dynamic_cast<Tk_octdigits *>(node), arg);
    case NodeType::SEQUENCE_EXPR_PRIMARY:
      return visit(dynamic_cast<Sequence_expr_primary *>(node), arg);
    case NodeType::LPVALUE:
      return visit(dynamic_cast<Lpvalue *>(node), arg);
    case NodeType::LABEL_OPT:
      return visit(dynamic_cast<Label_opt *>(node), arg);
    case NodeType::ESCAPEDIDENTIFIER:
      return visit(dynamic_cast<Escapedidentifier *>(node), arg);
    case NodeType::GENERATE_ITEM:
      return visit(dynamic_cast<Generate_item *>(node), arg);
    case NodeType::DATA_TYPE_PRIMITIVE:
      return visit(dynamic_cast<Data_type_primitive *>(node), arg);
    case NodeType::SPEC_REFERENCE_EVENT:
      return visit(dynamic_cast<Spec_reference_event *>(node), arg);
    case NodeType::UDP_INPUT_DECLARATION_LIST:
      return visit(dynamic_cast<Udp_input_declaration_list *>(node), arg);
    case NodeType::NON_PORT_MODULE_ITEM:
      return visit(dynamic_cast<Non_port_module_item *>(node), arg);
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_NON_ANSI:
      return visit(
          dynamic_cast<
              List_of_ports_or_port_declarations_trailing_comma_non_ansi *>(
              node),
          arg);
    case NodeType::MODULE_PARAMETER_PORT_LIST_OPT:
      return visit(dynamic_cast<Module_parameter_port_list_opt *>(node), arg);
    case NodeType::PROPERTY_PREFIX_EXPR:
      return visit(dynamic_cast<Property_prefix_expr *>(node), arg);
    case NodeType::EXPR_PRIMARY_BRACES:
      return visit(dynamic_cast<Expr_primary_braces *>(node), arg);
    case NodeType::POW_EXPR:
      return visit(dynamic_cast<Pow_expr *>(node), arg);
    case NodeType::FOR_INIT_DECL_OR_ASSIGN:
      return visit(dynamic_cast<For_init_decl_or_assign *>(node), arg);
    case NodeType::UDP_INITIAL:
      return visit(dynamic_cast<Udp_initial *>(node), arg);
    case NodeType::TF_PORT_LIST_PAREN_OPT:
      return visit(dynamic_cast<Tf_port_list_paren_opt *>(node), arg);
    case NodeType::STRUCT_DATA_TYPE:
      return visit(dynamic_cast<Struct_data_type *>(node), arg);
    case NodeType::UDP_SEQU_ENTRY:
      return visit(dynamic_cast<Udp_sequ_entry *>(node), arg);
    case NodeType::NET_VARIABLE_OR_DECL_ASSIGN:
      return visit(dynamic_cast<Net_variable_or_decl_assign *>(node), arg);
    case NodeType::PARAMETER_VALUE_BYNAME_LIST_TRAILING_COMMA:
      return visit(
          dynamic_cast<Parameter_value_byname_list_trailing_comma *>(node),
          arg);
    case NodeType::INC_OR_DEC_EXPRESSION:
      return visit(dynamic_cast<Inc_or_dec_expression *>(node), arg);
    case NodeType::NET_TYPE:
      return visit(dynamic_cast<Net_type *>(node), arg);
    case NodeType::SELECT_DIMENSIONS_OPT:
      return visit(dynamic_cast<Select_dimensions_opt *>(node), arg);
    case NodeType::SPEC_POLARITY:
      return visit(dynamic_cast<Spec_polarity *>(node), arg);
    case NodeType::MACRO_FORMAL_PARAMETER:
      return visit(dynamic_cast<Macro_formal_parameter *>(node), arg);
    case NodeType::STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION:
      return visit(dynamic_cast<Structure_or_array_pattern_expression *>(node),
                   arg);
    case NodeType::FOR_STEP:
      return visit(dynamic_cast<For_step *>(node), arg);
    case NodeType::SPECPARAM_LIST:
      return visit(dynamic_cast<Specparam_list *>(node), arg);
    case NodeType::TK_BINBASE:
      return visit(dynamic_cast<Tk_binbase *>(node), arg);
    case NodeType::TK_STRINGLITERAL:
      return visit(dynamic_cast<Tk_stringliteral *>(node), arg);
    case NodeType::VAR_OPT:
      return visit(dynamic_cast<Var_opt *>(node), arg);
    case NodeType::IDENTIFIER_OPTIONAL_UNPACKED_DIMENSIONS:
      return visit(
          dynamic_cast<Identifier_optional_unpacked_dimensions *>(node), arg);
    case NodeType::FUNCTION_ITEM_LIST:
      return visit(dynamic_cast<Function_item_list *>(node), arg);
    case NodeType::TYPE_DECLARATION:
      return visit(dynamic_cast<Type_declaration *>(node), arg);
    case NodeType::UDP_BODY:
      return visit(dynamic_cast<Udp_body *>(node), arg);
    case NodeType::MUL_EXPR:
      return visit(dynamic_cast<Mul_expr *>(node), arg);
    case NodeType::PAR_BLOCK:
      return visit(dynamic_cast<Par_block *>(node), arg);
    case NodeType::KEYWORDIDENTIFIER:
      return visit(dynamic_cast<Keywordidentifier *>(node), arg);
    case NodeType::LOGEQ_EXPR:
      return visit(dynamic_cast<Logeq_expr *>(node), arg);
    case NodeType::MODULE_COMMON_ITEM:
      return visit(dynamic_cast<Module_common_item *>(node), arg);
    case NodeType::PRIMITIVE_GATE_INSTANCE:
      return visit(dynamic_cast<Primitive_gate_instance *>(node), arg);
    case NodeType::DATA_TYPE_OR_IMPLICIT:
      return visit(dynamic_cast<Data_type_or_implicit *>(node), arg);
    case NodeType::TK_OCTBASE:
      return visit(dynamic_cast<Tk_octbase *>(node), arg);
    case NodeType::SEQUENCE_EXPR:
      return visit(dynamic_cast<Sequence_expr *>(node), arg);
    case NodeType::TK_HEXBASE:
      return visit(dynamic_cast<Tk_hexbase *>(node), arg);
    case NodeType::PROPERTY_EXPR:
      return visit(dynamic_cast<Property_expr *>(node), arg);
    case NodeType::SEQ_BLOCK:
      return visit(dynamic_cast<Seq_block *>(node), arg);
    case NodeType::TASK_ITEM:
      return visit(dynamic_cast<Task_item *>(node), arg);
    case NodeType::
        DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<
              Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *>(
              node),
          arg);
    case NodeType::SPECIFY_BLOCK:
      return visit(dynamic_cast<Specify_block *>(node), arg);
    case NodeType::TK_DECNUMBER:
      return visit(dynamic_cast<Tk_decnumber *>(node), arg);
    case NodeType::TK_DECBASE:
      return visit(dynamic_cast<Tk_decbase *>(node), arg);
    case NodeType::PROPERTY_IMPLICATION_EXPR:
      return visit(dynamic_cast<Property_implication_expr *>(node), arg);
    case NodeType::BIT_LOGIC_OPT:
      return visit(dynamic_cast<Bit_logic_opt *>(node), arg);
    case NodeType::INTEGER_ATOM_TYPE:
      return visit(dynamic_cast<Integer_atom_type *>(node), arg);
    case NodeType::LIFETIME:
      return visit(dynamic_cast<Lifetime *>(node), arg);
    case NodeType::ANY_ARGUMENT_LIST:
      return visit(dynamic_cast<Any_argument_list *>(node), arg);
    case NodeType::DELAY_VALUE_LIST:
      return visit(dynamic_cast<Delay_value_list *>(node), arg);
    case NodeType::MODULE_PORT_DECLARATION:
      return visit(dynamic_cast<Module_port_declaration *>(node), arg);
    case NodeType::JUMP_STATEMENT:
      return visit(dynamic_cast<Jump_statement *>(node), arg);
    case NodeType::DELAY_VALUE:
      return visit(dynamic_cast<Delay_value *>(node), arg);
    case NodeType::SEQUENCE_OR_EXPR:
      return visit(dynamic_cast<Sequence_or_expr *>(node), arg);
    case NodeType::MODULE_ATTRIBUTE_FOREIGN_OPT:
      return visit(dynamic_cast<Module_attribute_foreign_opt *>(node), arg);
    case NodeType::TF_PORT_DIRECTION_OPT:
      return visit(dynamic_cast<Tf_port_direction_opt *>(node), arg);
    case NodeType::TF_PORT_ITEM_EXPR_OPT:
      return visit(dynamic_cast<Tf_port_item_expr_opt *>(node), arg);
    case NodeType::CONT_ASSIGN_LIST:
      return visit(dynamic_cast<Cont_assign_list *>(node), arg);
    case NodeType::ANY_ARGUMENT_LIST_TRAILING_COMMA:
      return visit(dynamic_cast<Any_argument_list_trailing_comma *>(node), arg);
    case NodeType::PROCEDURAL_CONTINUOUS_ASSIGNMENT:
      return visit(dynamic_cast<Procedural_continuous_assignment *>(node), arg);
    case NodeType::EXPRESSION_OR_DIST:
      return visit(dynamic_cast<Expression_or_dist *>(node), arg);
    case NodeType::MODULE_START:
      return visit(dynamic_cast<Module_start *>(node), arg);
    case NodeType::EXPR_PRIMARY_PARENS:
      return visit(dynamic_cast<Expr_primary_parens *>(node), arg);
    case NodeType::OPEN_RANGE_LIST:
      return visit(dynamic_cast<Open_range_list *>(node), arg);
    case NodeType::UNARY_PREFIX_EXPR:
      return visit(dynamic_cast<Unary_prefix_expr *>(node), arg);
    case NodeType::DELAY_IDENTIFIER:
      return visit(dynamic_cast<Delay_identifier *>(node), arg);
    case NodeType::LIST_OF_IDENTIFIERS_UNPACKED_DIMENSIONS:
      return visit(
          dynamic_cast<List_of_identifiers_unpacked_dimensions *>(node), arg);
    case NodeType::DELAY_SCOPE:
      return visit(dynamic_cast<Delay_scope *>(node), arg);
    case NodeType::ACTION_BLOCK:
      return visit(dynamic_cast<Action_block *>(node), arg);
    case NodeType::TRAILING_ASSIGN_OPT:
      return visit(dynamic_cast<Trailing_assign_opt *>(node), arg);
    case NodeType::CLASS_ITEM:
      return visit(dynamic_cast<Class_item *>(node), arg);
    case NodeType::ENUM_NAME_LIST_TRAILING_COMMA:
      return visit(dynamic_cast<Enum_name_list_trailing_comma *>(node), arg);
    case NodeType::UDP_PORT_LIST:
      return visit(dynamic_cast<Udp_port_list *>(node), arg);
    case NodeType::EQUIV_IMPL_EXPR:
      return visit(dynamic_cast<Equiv_impl_expr *>(node), arg);
    case NodeType::CLASS_NEW:
      return visit(dynamic_cast<Class_new *>(node), arg);
    case NodeType::PORT_NET_TYPE:
      return visit(dynamic_cast<Port_net_type *>(node), arg);
    case NodeType::UNQUALIFIED_ID:
      return visit(dynamic_cast<Unqualified_id *>(node), arg);
    case NodeType::BEGIN:
      return visit(dynamic_cast<Begin *>(node), arg);
    case NodeType::SYSTEM_TF_CALL:
      return visit(dynamic_cast<System_tf_call *>(node), arg);
    case NodeType::PARAMETER_VALUE_BYNAME_LIST_ITEM_LAST:
      return visit(dynamic_cast<Parameter_value_byname_list_item_last *>(node),
                   arg);
    case NodeType::CONDITIONAL_GENERATE_CONSTRUCT:
      return visit(dynamic_cast<Conditional_generate_construct *>(node), arg);
    case NodeType::TIMESCALE_DIRECTIVE:
      return visit(dynamic_cast<Timescale_directive *>(node), arg);
    case NodeType::PORT_EXPRESSION:
      return visit(dynamic_cast<Port_expression *>(node), arg);
    case NodeType::UDP_SEQU_ENTRY_LIST:
      return visit(dynamic_cast<Udp_sequ_entry_list *>(node), arg);
    case NodeType::SYMBOL_OR_LABEL:
      return visit(dynamic_cast<Symbol_or_label *>(node), arg);
    case NodeType::SIMPLE_SEQUENCE_EXPR:
      return visit(dynamic_cast<Simple_sequence_expr *>(node), arg);
    case NodeType::SYSTEMTFIDENTIFIER:
      return visit(dynamic_cast<Systemtfidentifier *>(node), arg);
    case NodeType::TK_UNBASEDNUMBER:
      return visit(dynamic_cast<Tk_unbasednumber *>(node), arg);
    case NodeType::DECL_DIMENSIONS_OPT:
      return visit(dynamic_cast<Decl_dimensions_opt *>(node), arg);
    case NodeType::CLASS_ITEMS_OPT:
      return visit(dynamic_cast<Class_items_opt *>(node), arg);
    case NodeType::ENUM_NAME:
      return visit(dynamic_cast<Enum_name *>(node), arg);
    case NodeType::PARAMETER_VALUE_OPT:
      return visit(dynamic_cast<Parameter_value_opt *>(node), arg);
    case NodeType::SPECIFY_EDGE_PATH:
      return visit(dynamic_cast<Specify_edge_path *>(node), arg);
    case NodeType::IMPLICIT_CLASS_HANDLE:
      return visit(dynamic_cast<Implicit_class_handle *>(node), arg);
    case NodeType::MODULE_ITEM:
      return visit(dynamic_cast<Module_item *>(node), arg);
    case NodeType::STATEMENT_ITEM:
      return visit(dynamic_cast<Statement_item *>(node), arg);
    case NodeType::TYPE_IDENTIFIER_FOLLOWED_BY_ID:
      return visit(dynamic_cast<Type_identifier_followed_by_id *>(node), arg);
    case NodeType::METHOD_PROTOTYPE:
      return visit(dynamic_cast<Method_prototype *>(node), arg);
    case NodeType::TF_PORT_ITEM:
      return visit(dynamic_cast<Tf_port_item *>(node), arg);
    case NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST:
      return visit(dynamic_cast<Block_item_or_statement_or_null_list *>(node),
                   arg);
    case NodeType::ENDNEW_OPT:
      return visit(dynamic_cast<Endnew_opt *>(node), arg);
    case NodeType::SPECIFY_ITEM_LIST_OPT:
      return visit(dynamic_cast<Specify_item_list_opt *>(node), arg);
    case NodeType::SPECIFY_SIMPLE_PATH_DECL:
      return visit(dynamic_cast<Specify_simple_path_decl *>(node), arg);
    case NodeType::TK_RS_EQ:
      return visit(dynamic_cast<Tk_rs_eq *>(node), arg);
    case NodeType::PACKAGE_IMPORT_ITEM_LIST:
      return visit(dynamic_cast<Package_import_item_list *>(node), arg);
    case NodeType::UDP_PORT_DECL:
      return visit(dynamic_cast<Udp_port_decl *>(node), arg);
    case NodeType::WITH_EXPRS_SUFFIX:
      return visit(dynamic_cast<With_exprs_suffix *>(node), arg);
    case NodeType::GENERATE_REGION:
      return visit(dynamic_cast<Generate_region *>(node), arg);
    case NodeType::CALL_BASE:
      return visit(dynamic_cast<Call_base *>(node), arg);
    case NodeType::ARRAY_LOCATOR_METHOD:
      return visit(dynamic_cast<Array_locator_method *>(node), arg);
    case NodeType::PORT_DECLARATION_ANSI:
      return visit(dynamic_cast<Port_declaration_ansi *>(node), arg);
    case NodeType::BITAND_EXPR:
      return visit(dynamic_cast<Bitand_expr *>(node), arg);
    case NodeType::RANGE_LIST_IN_BRACES:
      return visit(dynamic_cast<Range_list_in_braces *>(node), arg);
    case NodeType::MODULE_PARAMETER_PORT_LIST_ITEM_LAST:
      return visit(dynamic_cast<Module_parameter_port_list_item_last *>(node),
                   arg);
    case NodeType::HEX_BASED_NUMBER:
      return visit(dynamic_cast<Hex_based_number *>(node), arg);
    case NodeType::HIERARCHY_EVENT_IDENTIFIER:
      return visit(dynamic_cast<Hierarchy_event_identifier *>(node), arg);
    case NodeType::LIST_OF_VARIABLE_DECL_ASSIGNMENTS:
      return visit(dynamic_cast<List_of_variable_decl_assignments *>(node),
                   arg);
    case NodeType::RANDOM_QUALIFIER_OPT:
      return visit(dynamic_cast<Random_qualifier_opt *>(node), arg);
    case NodeType::DRIVE_STRENGTH_OPT:
      return visit(dynamic_cast<Drive_strength_opt *>(node), arg);
    case NodeType::TK_TIMELITERAL:
      return visit(dynamic_cast<Tk_timeliteral *>(node), arg);
    case NodeType::VALUE_RANGE:
      return visit(dynamic_cast<Value_range *>(node), arg);
    case NodeType::EXPR_MINTYPMAX_GENERALIZED:
      return visit(dynamic_cast<Expr_mintypmax_generalized *>(node), arg);
    case NodeType::POLARITY_OPERATOR:
      return visit(dynamic_cast<Polarity_operator *>(node), arg);
    case NodeType::PACKAGE_ITEM:
      return visit(dynamic_cast<Package_item *>(node), arg);
    case NodeType::FOR_INITIALIZATION:
      return visit(dynamic_cast<For_initialization *>(node), arg);
    case NodeType::ENUM_DATA_TYPE:
      return visit(dynamic_cast<Enum_data_type *>(node), arg);
    case NodeType::BLOCKING_ASSIGNMENT:
      return visit(dynamic_cast<Blocking_assignment *>(node), arg);
    case NodeType::DELAY1:
      return visit(dynamic_cast<Delay1 *>(node), arg);
    case NodeType::BASED_NUMBER:
      return visit(dynamic_cast<Based_number *>(node), arg);
    case NodeType::PROCEDURAL_TIMING_CONTROL_STATEMENT:
      return visit(dynamic_cast<Procedural_timing_control_statement *>(node),
                   arg);
    case NodeType::BLOCK_ITEM_DECL:
      return visit(dynamic_cast<Block_item_decl *>(node), arg);
    case NodeType::NET_VARIABLE_OR_DECL_ASSIGNS:
      return visit(dynamic_cast<Net_variable_or_decl_assigns *>(node), arg);
    case NodeType::TIME_LITERAL:
      return visit(dynamic_cast<Time_literal *>(node), arg);
    case NodeType::FUNCTION_ITEM_DATA_DECLARATION:
      return visit(dynamic_cast<Function_item_data_declaration *>(node), arg);
    case NodeType::DECL_VARIABLE_DIMENSION:
      return visit(dynamic_cast<Decl_variable_dimension *>(node), arg);
    case NodeType::TF_PORT_LIST_OPT:
      return visit(dynamic_cast<Tf_port_list_opt *>(node), arg);
    case NodeType::ENDFUNCTION_LABEL_OPT:
      return visit(dynamic_cast<Endfunction_label_opt *>(node), arg);
    case NodeType::QUALIFIED_ID:
      return visit(dynamic_cast<Qualified_id *>(node), arg);
    case NodeType::IMMEDIATE_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Immediate_assertion_statement *>(node), arg);
    case NodeType::JOIN_KEYWORD:
      return visit(dynamic_cast<Join_keyword *>(node), arg);
    case NodeType::TK_BINDIGITS:
      return visit(dynamic_cast<Tk_bindigits *>(node), arg);
    case NodeType::EVENT_TRIGGER:
      return visit(dynamic_cast<Event_trigger *>(node), arg);
    case NodeType::DYNAMIC_ARRAY_NEW:
      return visit(dynamic_cast<Dynamic_array_new *>(node), arg);
    case NodeType::MATCHES_EXPR:
      return visit(dynamic_cast<Matches_expr *>(node), arg);
    case NodeType::PORT_REFERENCE_LIST:
      return visit(dynamic_cast<Port_reference_list *>(node), arg);
    case NodeType::ARRAY_REDUCTION_METHOD:
      return visit(dynamic_cast<Array_reduction_method *>(node), arg);
    case NodeType::BUILTIN_ARRAY_METHOD:
      return visit(dynamic_cast<Builtin_array_method *>(node), arg);
    case NodeType::PACKAGE_DECLARATION:
      return visit(dynamic_cast<Package_declaration *>(node), arg);
    case NodeType::ASSIGNMENT_PATTERN_EXPRESSION:
      return visit(dynamic_cast<Assignment_pattern_expression *>(node), arg);
    case NodeType::DRIVE_STRENGTH:
      return visit(dynamic_cast<Drive_strength *>(node), arg);
    case NodeType::PORT_DECLARATION_NON_ANSI:
      return visit(dynamic_cast<Port_declaration_non_ansi *>(node), arg);
    case NodeType::MODULE_PARAMETER_PORT_LIST:
      return visit(dynamic_cast<Module_parameter_port_list *>(node), arg);
    case NodeType::VAR_TYPE:
      return visit(dynamic_cast<Var_type *>(node), arg);
    case NodeType::PARAMETER_OPT:
      return visit(dynamic_cast<Parameter_opt *>(node), arg);
    case NodeType::MODULE_ITEM_LIST:
      return visit(dynamic_cast<Module_item_list *>(node), arg);
    case NodeType::GENERICIDENTIFIER:
      return visit(dynamic_cast<Genericidentifier *>(node), arg);
    case NodeType::PACKAGE_ITEM_LIST_OPT:
      return visit(dynamic_cast<Package_item_list_opt *>(node), arg);
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_ANSI:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_item_last_ansi *>(
              node),
          arg);
    case NodeType::DATA_TYPE_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<
              Data_type_or_implicit_followed_by_id_and_dimensions_opt *>(node),
          arg);
    case NodeType::XOR_EXPR:
      return visit(dynamic_cast<Xor_expr *>(node), arg);
    case NodeType::DEC_BASED_NUMBER:
      return visit(dynamic_cast<Dec_based_number *>(node), arg);
    case NodeType::LOOP_STATEMENT:
      return visit(dynamic_cast<Loop_statement *>(node), arg);
    case NodeType::DATA_DECLARATION_OR_MODULE_INSTANTIATION:
      return visit(
          dynamic_cast<Data_declaration_or_module_instantiation *>(node), arg);
    case NodeType::UDP_COMB_ENTRY_LIST:
      return visit(dynamic_cast<Udp_comb_entry_list *>(node), arg);
    case NodeType::BIT_LOGIC:
      return visit(dynamic_cast<Bit_logic *>(node), arg);
    case NodeType::REFERENCE_OR_CALL:
      return visit(dynamic_cast<Reference_or_call *>(node), arg);
    case NodeType::LOCAL_ROOT:
      return visit(dynamic_cast<Local_root *>(node), arg);
    case NodeType::PORT_DIRECTION:
      return visit(dynamic_cast<Port_direction *>(node), arg);
    case NodeType::VARIABLE_DECL_ASSIGNMENT:
      return visit(dynamic_cast<Variable_decl_assignment *>(node), arg);
    case NodeType::SPECIFY_EDGE_PATH_DECL:
      return visit(dynamic_cast<Specify_edge_path_decl *>(node), arg);
    case NodeType::FUNCTION_PROTOTYPE:
      return visit(dynamic_cast<Function_prototype *>(node), arg);
    case NodeType::SEQUENCE_WITHIN_EXPR:
      return visit(dynamic_cast<Sequence_within_expr *>(node), arg);
    case NodeType::EXPR_PRIMARY_NO_GROUPS:
      return visit(dynamic_cast<Expr_primary_no_groups *>(node), arg);
    case NodeType::PARAMETER_VALUE_BYNAME:
      return visit(dynamic_cast<Parameter_value_byname *>(node), arg);
    case NodeType::CASE_ANY:
      return visit(dynamic_cast<Case_any *>(node), arg);
    case NodeType::SPEC_NOTIFIER:
      return visit(dynamic_cast<Spec_notifier *>(node), arg);
    case NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL:
      return visit(dynamic_cast<Block_item_or_statement_or_null *>(node), arg);
    case NodeType::SPECIFY_ITEM:
      return visit(dynamic_cast<Specify_item *>(node), arg);
    case NodeType::ANY_PARAM_DECLARATION:
      return visit(dynamic_cast<Any_param_declaration *>(node), arg);
    case NodeType::TF_PORT_LIST_TRAILING_COMMA:
      return visit(dynamic_cast<Tf_port_list_trailing_comma *>(node), arg);
    case NodeType::STRUCT_UNION_MEMBER:
      return visit(dynamic_cast<Struct_union_member *>(node), arg);
    case NodeType::ANY_PORT_LIST_POSITIONAL:
      return visit(dynamic_cast<Any_port_list_positional *>(node), arg);
    case NodeType::DIR:
      return visit(dynamic_cast<Dir *>(node), arg);
    case NodeType::LIFETIME_OPT:
      return visit(dynamic_cast<Lifetime_opt *>(node), arg);
    case NodeType::LIST_OF_IDENTIFIERS:
      return visit(dynamic_cast<List_of_identifiers *>(node), arg);
    case NodeType::EDGE_OPERATOR:
      return visit(dynamic_cast<Edge_operator *>(node), arg);
    case NodeType::TK_VIRTUAL_OPT:
      return visit(dynamic_cast<Tk_virtual_opt *>(node), arg);
    case NodeType::TIMEUNITS_DECLARATION:
      return visit(dynamic_cast<Timeunits_declaration *>(node), arg);
    case NodeType::TF_ITEM_OR_STATEMENT_OR_NULL:
      return visit(dynamic_cast<Tf_item_or_statement_or_null *>(node), arg);
    case NodeType::PACKAGE_IMPORT_LIST:
      return visit(dynamic_cast<Package_import_list *>(node), arg);
    case NodeType::EXPR_PRIMARY:
      return visit(dynamic_cast<Expr_primary *>(node), arg);
    case NodeType::SIGNED_UNSIGNED_OPT:
      return visit(dynamic_cast<Signed_unsigned_opt *>(node), arg);
    case NodeType::NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST:
      return visit(
          dynamic_cast<Non_anonymous_gate_instance_or_register_variable_list *>(
              node),
          arg);
    case NodeType::UDP_COMB_ENTRY:
      return visit(dynamic_cast<Udp_comb_entry *>(node), arg);
    case NodeType::DELAY3:
      return visit(dynamic_cast<Delay3 *>(node), arg);
    case NodeType::INC_OR_DEC_OR_PRIMARY_EXPR:
      return visit(dynamic_cast<Inc_or_dec_or_primary_expr *>(node), arg);
    case NodeType::PROCEDURAL_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Procedural_assertion_statement *>(node), arg);
    case NodeType::STRUCT_UNION_MEMBER_LIST:
      return visit(dynamic_cast<Struct_union_member_list *>(node), arg);
    case NodeType::COMP_EXPR:
      return visit(dynamic_cast<Comp_expr *>(node), arg);
    case NodeType::POSTFIX_EXPRESSION:
      return visit(dynamic_cast<Postfix_expression *>(node), arg);
    case NodeType::SYMBOLIDENTIFIER:
      return visit(dynamic_cast<Symbolidentifier *>(node), arg);
    case NodeType::UDP_INPUT_SYM:
      return visit(dynamic_cast<Udp_input_sym *>(node), arg);
    case NodeType::POS_NEG_NUMBER:
      return visit(dynamic_cast<Pos_neg_number *>(node), arg);
    case NodeType::SPECIFY_TERMINAL_DESCRIPTOR:
      return visit(dynamic_cast<Specify_terminal_descriptor *>(node), arg);
    case NodeType::SELECT_VARIABLE_DIMENSION:
      return visit(dynamic_cast<Select_variable_dimension *>(node), arg);
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ANSI:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_ansi *>(node), arg);
    case NodeType::GENERATE_CASE_ITEMS:
      return visit(dynamic_cast<Generate_case_items *>(node), arg);
    case NodeType::DATA_TYPE_PRIMITIVE_SCALAR:
      return visit(dynamic_cast<Data_type_primitive_scalar *>(node), arg);
    case NodeType::TF_ITEM_OR_STATEMENT_OR_NULL_LIST:
      return visit(dynamic_cast<Tf_item_or_statement_or_null_list *>(node),
                   arg);
    case NodeType::CONDITIONAL_STATEMENT:
      return visit(dynamic_cast<Conditional_statement *>(node), arg);
    case NodeType::SPECPARAM_DECL:
      return visit(dynamic_cast<Specparam_decl *>(node), arg);
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_NON_ANSI:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_non_ansi *>(node),
          arg);
    case NodeType::STATEMENT_OR_NULL_LIST:
      return visit(dynamic_cast<Statement_or_null_list *>(node), arg);
    case NodeType::TASK_DECLARATION:
      return visit(dynamic_cast<Task_declaration *>(node), arg);
    case NodeType::DATA_DECLARATION_BASE:
      return visit(dynamic_cast<Data_declaration_base *>(node), arg);
    case NodeType::ANY_PORT_LIST_OPT:
      return visit(dynamic_cast<Any_port_list_opt *>(node), arg);
    case NodeType::MACRONUMERICWIDTH:
      return visit(dynamic_cast<Macronumericwidth *>(node), arg);
    case NodeType::TRAILING_DECL_ASSIGNMENT_OPT:
      return visit(dynamic_cast<Trailing_decl_assignment_opt *>(node), arg);
    case NodeType::GATE_INSTANCE_OR_REGISTER_VARIABLE:
      return visit(dynamic_cast<Gate_instance_or_register_variable *>(node),
                   arg);
    case NodeType::BIND_INSTANTIATION:
      return visit(dynamic_cast<Bind_instantiation *>(node), arg);
    case NodeType::PACKAGE_IMPORT_DECLARATION:
      return visit(dynamic_cast<Package_import_declaration *>(node), arg);
    case NodeType::MODULE_PACKAGE_IMPORT_LIST_OPT:
      return visit(dynamic_cast<Module_package_import_list_opt *>(node), arg);
    case NodeType::STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION_LIST:
      return visit(
          dynamic_cast<Structure_or_array_pattern_expression_list *>(node),
          arg);
    case NodeType::EVENT_EXPRESSION_LIST:
      return visit(dynamic_cast<Event_expression_list *>(node), arg);
    case NodeType::TK_RSS_EQ:
      return visit(dynamic_cast<Tk_rss_eq *>(node), arg);
    case NodeType::IMPLEMENTS_INTERFACE_LIST_OPT:
      return visit(dynamic_cast<Implements_interface_list_opt *>(node), arg);
    case NodeType::DELAY3_OPT:
      return visit(dynamic_cast<Delay3_opt *>(node), arg);
    case NodeType::EXPR_MINTYPMAX_TRANS_SET:
      return visit(dynamic_cast<Expr_mintypmax_trans_set *>(node), arg);
    case NodeType::STATEMENT_OR_NULL:
      return visit(dynamic_cast<Statement_or_null *>(node), arg);
    case NodeType::ENUM_NAME_LIST:
      return visit(dynamic_cast<Enum_name_list *>(node), arg);
    case NodeType::SEQUENCE_UNARY_EXPR:
      return visit(dynamic_cast<Sequence_unary_expr *>(node), arg);
    case NodeType::PP_IDENTIFIER:
      return visit(dynamic_cast<Pp_identifier *>(node), arg);
    case NodeType::SHIFT_EXPR:
      return visit(dynamic_cast<Shift_expr *>(node), arg);
    case NodeType::OCT_BASED_NUMBER:
      return visit(dynamic_cast<Oct_based_number *>(node), arg);
    case NodeType::HIERARCHY_SEGMENT:
      return visit(dynamic_cast<Hierarchy_segment *>(node), arg);
    case NodeType::NONBLOCKING_ASSIGNMENT:
      return visit(dynamic_cast<Nonblocking_assignment *>(node), arg);
    case NodeType::EXPRESSION_LIST_PROPER:
      return visit(dynamic_cast<Expression_list_proper *>(node), arg);
    case NodeType::GENERATE_IF:
      return visit(dynamic_cast<Generate_if *>(node), arg);
    case NodeType::FUNCTION_ITEM:
      return visit(dynamic_cast<Function_item *>(node), arg);
    case NodeType::SCOPE_PREFIX:
      return visit(dynamic_cast<Scope_prefix *>(node), arg);
    case NodeType::PRIMITIVE_GATE_INSTANCE_LIST:
      return visit(dynamic_cast<Primitive_gate_instance_list *>(node), arg);
    case NodeType::SIMPLE_IMMEDIATE_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Simple_immediate_assertion_statement *>(node),
                   arg);
    case NodeType::DESCRIPTION_LIST:
      return visit(dynamic_cast<Description_list *>(node), arg);
    case NodeType::DR_STRENGTH0:
      return visit(dynamic_cast<Dr_strength0 *>(node), arg);
    case NodeType::UNIQUE_PRIORITY_OPT:
      return visit(dynamic_cast<Unique_priority_opt *>(node), arg);
    case NodeType::SPECPARAM:
      return visit(dynamic_cast<Specparam *>(node), arg);
    case NodeType::PORT_EXPRESSION_OPT:
      return visit(dynamic_cast<Port_expression_opt *>(node), arg);
    case NodeType::COND_EXPR:
      return visit(dynamic_cast<Cond_expr *>(node), arg);
    case NodeType::TK_REG_OPT:
      return visit(dynamic_cast<Tk_reg_opt *>(node), arg);
    case NodeType::LOGOR_EXPR:
      return visit(dynamic_cast<Logor_expr *>(node), arg);
    case NodeType::DELAY3_OR_DRIVE_OPT:
      return visit(dynamic_cast<Delay3_or_drive_opt *>(node), arg);
    case NodeType::TF_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT:
      return visit(dynamic_cast<Tf_item_or_statement_or_null_list_opt *>(node),
                   arg);
    case NodeType::NET_DECL_ASSIGN:
      return visit(dynamic_cast<Net_decl_assign *>(node), arg);
    case NodeType::ALWAYS_ANY:
      return visit(dynamic_cast<Always_any *>(node), arg);
    case NodeType::LIST_OF_TF_VARIABLE_IDENTIFIERS:
      return visit(dynamic_cast<List_of_tf_variable_identifiers *>(node), arg);
    case NodeType::VAR_OR_NET_TYPE_OPT:
      return visit(dynamic_cast<Var_or_net_type_opt *>(node), arg);
    case NodeType::TF_PORT_LIST_ITEM_LAST:
      return visit(dynamic_cast<Tf_port_list_item_last *>(node), arg);
    case NodeType::TASK_DECLARATION_ID:
      return visit(dynamic_cast<Task_declaration_id *>(node), arg);
    case NodeType::INSTANTIATION_BASE:
      return visit(dynamic_cast<Instantiation_base *>(node), arg);
    case NodeType::SEQUENCE_REPETITION_EXPR:
      return visit(dynamic_cast<Sequence_repetition_expr *>(node), arg);
    case NodeType::TK_HEXDIGITS:
      return visit(dynamic_cast<Tk_hexdigits *>(node), arg);
    case NodeType::NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE:
      return visit(
          dynamic_cast<Non_anonymous_gate_instance_or_register_variable *>(
              node),
          arg);
    case NodeType::LOCALPARAM_ASSIGN:
      return visit(dynamic_cast<Localparam_assign *>(node), arg);
    case NodeType::CLASS_ITEMS:
      return visit(dynamic_cast<Class_items *>(node), arg);
    case NodeType::EXPRESSION_IN_PARENS:
      return visit(dynamic_cast<Expression_in_parens *>(node), arg);
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_ANSI:
      return visit(
          dynamic_cast<
              List_of_ports_or_port_declarations_trailing_comma_ansi *>(node),
          arg);
    case NodeType::PORT_REFERENCE:
      return visit(dynamic_cast<Port_reference *>(node), arg);
    case NodeType::DIST_OPT:
      return visit(dynamic_cast<Dist_opt *>(node), arg);
    case NodeType::CASEEQ_EXPR:
      return visit(dynamic_cast<Caseeq_expr *>(node), arg);
    case NodeType::GENERATE_BLOCK:
      return visit(dynamic_cast<Generate_block *>(node), arg);
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_NON_ANSI:
      return visit(
          dynamic_cast<List_of_ports_or_port_declarations_item_last_non_ansi *>(
              node),
          arg);
    case NodeType::ANY_ARGUMENT_LIST_ITEM_LAST:
      return visit(dynamic_cast<Any_argument_list_item_last *>(node), arg);
    case NodeType::GATE_INSTANTIATION:
      return visit(dynamic_cast<Gate_instantiation *>(node), arg);
    case NodeType::CASTING_TYPE:
      return visit(dynamic_cast<Casting_type *>(node), arg);
    case NodeType::EXPR_MINTYPMAX:
      return visit(dynamic_cast<Expr_mintypmax *>(node), arg);
    case NodeType::CONTINUOUS_ASSIGN:
      return visit(dynamic_cast<Continuous_assign *>(node), arg);
    case NodeType::PARAMETER_ASSIGN:
      return visit(dynamic_cast<Parameter_assign *>(node), arg);
    case NodeType::DELAY_VALUE_SIMPLE:
      return visit(dynamic_cast<Delay_value_simple *>(node), arg);
    case NodeType::SWITCHTYPE:
      return visit(dynamic_cast<Switchtype *>(node), arg);
    case NodeType::PACKAGE_OR_GENERATE_ITEM_DECLARATION:
      return visit(dynamic_cast<Package_or_generate_item_declaration *>(node),
                   arg);
    case NodeType::BIN_BASED_NUMBER:
      return visit(dynamic_cast<Bin_based_number *>(node), arg);
    case NodeType::LOOP_GENERATE_CONSTRUCT:
      return visit(dynamic_cast<Loop_generate_construct *>(node), arg);
    case NodeType::PARAMETER_OVERRIDE:
      return visit(dynamic_cast<Parameter_override *>(node), arg);
    case NodeType::UDP_PRIMITIVE:
      return visit(dynamic_cast<Udp_primitive *>(node), arg);
    case NodeType::PARAMETER_EXPR:
      return visit(dynamic_cast<Parameter_expr *>(node), arg);
    case NodeType::REPEAT_CONTROL:
      return visit(dynamic_cast<Repeat_control *>(node), arg);
    case NodeType::PACKED_SIGNING_OPT:
      return visit(dynamic_cast<Packed_signing_opt *>(node), arg);
    case NodeType::EXPRESSION_OR_NULL_LIST_OPT:
      return visit(dynamic_cast<Expression_or_null_list_opt *>(node), arg);
    case NodeType::ENUM_NAME_LIST_ITEM_LAST:
      return visit(dynamic_cast<Enum_name_list_item_last *>(node), arg);
    case NodeType::MACRO_FORMALS_LIST_OPT:
      return visit(dynamic_cast<Macro_formals_list_opt *>(node), arg);
    case NodeType::SPEC_NOTIFIER_OPT:
      return visit(dynamic_cast<Spec_notifier_opt *>(node), arg);
    case NodeType::HIERARCHY_EXTENSION:
      return visit(dynamic_cast<Hierarchy_extension *>(node), arg);
    case NodeType::GENERATE_ITEM_LIST:
      return visit(dynamic_cast<Generate_item_list *>(node), arg);
    case NodeType::DATA_DECLARATION_MODIFIERS_OPT:
      return visit(dynamic_cast<Data_declaration_modifiers_opt *>(node), arg);
    case NodeType::SEQUENCE_THROUGHOUT_EXPR:
      return visit(dynamic_cast<Sequence_throughout_expr *>(node), arg);
    case NodeType::PROPERTY_EXPR_OR_ASSIGNMENT_LIST:
      return visit(dynamic_cast<Property_expr_or_assignment_list *>(node), arg);
    case NodeType::BITOR_EXPR:
      return visit(dynamic_cast<Bitor_expr *>(node), arg);
    case NodeType::TF_PORT_LIST:
      return visit(dynamic_cast<Tf_port_list *>(node), arg);
    case NodeType::ANY_PORT_LIST_TRAILING_COMMA_NAMED:
      return visit(dynamic_cast<Any_port_list_trailing_comma_named *>(node),
                   arg);
    case NodeType::FUNCTION_RETURN_TYPE_AND_ID:
      return visit(dynamic_cast<Function_return_type_and_id *>(node), arg);
    case NodeType::STATEMENT:
      return visit(dynamic_cast<Statement *>(node), arg);
    case NodeType::DR_STRENGTH1:
      return visit(dynamic_cast<Dr_strength1 *>(node), arg);
    case NodeType::ASSIGN_MODIFY_STATEMENT:
      return visit(dynamic_cast<Assign_modify_statement *>(node), arg);
    case NodeType::UDP_PORT_DECLS:
      return visit(dynamic_cast<Udp_port_decls *>(node), arg);
    case NodeType::INTEGER_VECTOR_TYPE:
      return visit(dynamic_cast<Integer_vector_type *>(node), arg);
    case NodeType::ASSIGNMENT_PATTERN:
      return visit(dynamic_cast<Assignment_pattern *>(node), arg);
    case NodeType::CLASS_CONSTRUCTOR:
      return visit(dynamic_cast<Class_constructor *>(node), arg);
    case NodeType::MODULE_PARAMETER_PORT:
      return visit(dynamic_cast<Module_parameter_port *>(node), arg);
    case NodeType::MODULE_OR_GENERATE_ITEM_DECLARATION:
      return visit(dynamic_cast<Module_or_generate_item_declaration *>(node),
                   arg);
    case NodeType::FINAL_CONSTRUCT:
      return visit(dynamic_cast<Final_construct *>(node), arg);
    case NodeType::MEMBER_NAME:
      return visit(dynamic_cast<Member_name *>(node), arg);
    case NodeType::CLASS_DECLARATION:
      return visit(dynamic_cast<Class_declaration *>(node), arg);
    case NodeType::PACKAGE_IMPORT_ITEM:
      return visit(dynamic_cast<Package_import_item *>(node), arg);
    case NodeType::SIGNING:
      return visit(dynamic_cast<Signing *>(node), arg);
    case NodeType::CLASS_CONSTRUCTOR_PROTOTYPE:
      return visit(dynamic_cast<Class_constructor_prototype *>(node), arg);
    case NodeType::GENERATE_CASE_ITEM:
      return visit(dynamic_cast<Generate_case_item *>(node), arg);
    case NodeType::DATA_DECLARATION:
      return visit(dynamic_cast<Data_declaration *>(node), arg);
    case NodeType::EXPRESSION:
      return visit(dynamic_cast<Expression *>(node), arg);
    case NodeType::CONT_ASSIGN:
      return visit(dynamic_cast<Cont_assign *>(node), arg);
    case NodeType::DELAY_OR_EVENT_CONTROL_OPT:
      return visit(dynamic_cast<Delay_or_event_control_opt *>(node), arg);
    case NodeType::BIND_DIRECTIVE:
      return visit(dynamic_cast<Bind_directive *>(node), arg);
    case NodeType::MISC_DIRECTIVE:
      return visit(dynamic_cast<Misc_directive *>(node), arg);
    case NodeType::UDP_INITIAL_EXPR_OPT:
      return visit(dynamic_cast<Udp_initial_expr_opt *>(node), arg);
    case NodeType::DESCRIPTION:
      return visit(dynamic_cast<Description *>(node), arg);
    case NodeType::DATA_TYPE_BASE:
      return visit(dynamic_cast<Data_type_base *>(node), arg);
    case NodeType::TRAILING_ASSIGN:
      return visit(dynamic_cast<Trailing_assign *>(node), arg);
    case NodeType::MODULE_END:
      return visit(dynamic_cast<Module_end *>(node), arg);
    case NodeType::WAIT_STATEMENT:
      return visit(dynamic_cast<Wait_statement *>(node), arg);
    case NodeType::PACKAGE_ITEM_LIST:
      return visit(dynamic_cast<Package_item_list *>(node), arg);
    case NodeType::CASE_ITEMS:
      return visit(dynamic_cast<Case_items *>(node), arg);
    case NodeType::STATEMENT_OR_NULL_LIST_OPT:
      return visit(dynamic_cast<Statement_or_null_list_opt *>(node), arg);
    case NodeType::PORT_NAMED:
      return visit(dynamic_cast<Port_named *>(node), arg);
    case NodeType::UDP_OUTPUT_SYM:
      return visit(dynamic_cast<Udp_output_sym *>(node), arg);
    case NodeType::ASSIGNMENT_STATEMENT_NO_EXPR:
      return visit(dynamic_cast<Assignment_statement_no_expr *>(node), arg);
    case NodeType::ANY_PORT_LIST_ITEM_LAST_POSITIONAL:
      return visit(dynamic_cast<Any_port_list_item_last_positional *>(node),
                   arg);
    case NodeType::MODULE_ITEM_LIST_OPT:
      return visit(dynamic_cast<Module_item_list_opt *>(node), arg);
    case NodeType::SEQUENCE_AND_EXPR:
      return visit(dynamic_cast<Sequence_and_expr *>(node), arg);
    case NodeType::DATA_TYPE:
      return visit(dynamic_cast<Data_type *>(node), arg);
    case NodeType::ARGUMENT_LIST_OPT:
      return visit(dynamic_cast<Argument_list_opt *>(node), arg);
    case NodeType::FOR_STEP_OPT:
      return visit(dynamic_cast<For_step_opt *>(node), arg);
    case NodeType::SEQUENCE_INTERSECT_EXPR:
      return visit(dynamic_cast<Sequence_intersect_expr *>(node), arg);
    case NodeType::FUNCTION_DECLARATION:
      return visit(dynamic_cast<Function_declaration *>(node), arg);
    case NodeType::NET_TYPE_OR_NONE:
      return visit(dynamic_cast<Net_type_or_none *>(node), arg);
    case NodeType::CLASS_DECLARATION_EXTENDS_OPT:
      return visit(dynamic_cast<Class_declaration_extends_opt *>(node), arg);
    case NodeType::BOOLEAN_ABBREV_OPT:
      return visit(dynamic_cast<Boolean_abbrev_opt *>(node), arg);
    case NodeType::SPECIFY_PATH_IDENTIFIERS:
      return visit(dynamic_cast<Specify_path_identifiers *>(node), arg);
    case NodeType::TF_PORT_DIRECTION:
      return visit(dynamic_cast<Tf_port_direction *>(node), arg);
    case NodeType::TK_DECDIGITS:
      return visit(dynamic_cast<Tk_decdigits *>(node), arg);
    case NodeType::END:
      return visit(dynamic_cast<End *>(node), arg);
    case NodeType::NET_DECLARATION:
      return visit(dynamic_cast<Net_declaration *>(node), arg);
    case NodeType::TK_TAGGED_OPT:
      return visit(dynamic_cast<Tk_tagged_opt *>(node), arg);
    case NodeType::TK_XZDIGITS:
      return visit(dynamic_cast<Tk_xzdigits *>(node), arg);
    case NodeType::GATETYPE:
      return visit(dynamic_cast<Gatetype *>(node), arg);
    case NodeType::PREPROCESS_INCLUDE_ARGUMENT:
      return visit(dynamic_cast<Preprocess_include_argument *>(node), arg);
    case NodeType::MACRO_FORMALS_LIST:
      return visit(dynamic_cast<Macro_formals_list *>(node), arg);
    case NodeType::CONST_OPT:
      return visit(dynamic_cast<Const_opt *>(node), arg);
    case NodeType::LOGAND_EXPR:
      return visit(dynamic_cast<Logand_expr *>(node), arg);
    case NodeType::EVENT_EXPRESSION:
      return visit(dynamic_cast<Event_expression *>(node), arg);
    case NodeType::UDP_ENTRY_LIST:
      return visit(dynamic_cast<Udp_entry_list *>(node), arg);
    case NodeType::PREPROCESSOR_ACTION:
      return visit(dynamic_cast<Preprocessor_action *>(node), arg);
    case NodeType::TF_PORT_DECLARATION:
      return visit(dynamic_cast<Tf_port_declaration *>(node), arg);
    case NodeType::UDP_INIT_OPT:
      return visit(dynamic_cast<Udp_init_opt *>(node), arg);
    case NodeType::
        TYPE_IDENTIFIER_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT:
      return visit(
          dynamic_cast<
              Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *>(
              node),
          arg);
    case NodeType::SOURCE_TEXT:
      return visit(dynamic_cast<Source_text *>(node), arg);
    case NodeType::DEFPARAM_ASSIGN:
      return visit(dynamic_cast<Defparam_assign *>(node), arg);
    case NodeType::DECL_DIMENSIONS:
      return visit(dynamic_cast<Decl_dimensions *>(node), arg);
    case NodeType::CONSTANT_DEC_NUMBER:
      return visit(dynamic_cast<Constant_dec_number *>(node), arg);
    case NodeType::CASE_STATEMENT:
      return visit(dynamic_cast<Case_statement *>(node), arg);
    case NodeType::ASSIGNMENT_STATEMENT:
      return visit(dynamic_cast<Assignment_statement *>(node), arg);
    case NodeType::DPI_IMPORT_PROPERTY_OPT:
      return visit(dynamic_cast<Dpi_import_property_opt *>(node), arg);
    case NodeType::DPI_SPEC_STRING:
      return visit(dynamic_cast<Dpi_spec_string *>(node), arg);
    case NodeType::TRAILING_DECL_ASSIGNMENT:
      return visit(dynamic_cast<Trailing_decl_assignment *>(node), arg);
    case NodeType::ALWAYS_CONSTRUCT:
      return visit(dynamic_cast<Always_construct *>(node), arg);
    case NodeType::GENVAR_OPT:
      return visit(dynamic_cast<Genvar_opt *>(node), arg);
    case NodeType::ANY_PORT_LIST_NAMED:
      return visit(dynamic_cast<Any_port_list_named *>(node), arg);
    case NodeType::SUBROUTINE_CALL:
      return visit(dynamic_cast<Subroutine_call *>(node), arg);
    case NodeType::PROPERTY_EXPR_OR_ASSIGNMENT:
      return visit(dynamic_cast<Property_expr_or_assignment *>(node), arg);
    case NodeType::ANY_ARGUMENT:
      return visit(dynamic_cast<Any_argument *>(node), arg);
    case NodeType::MODULE_OR_INTERFACE_DECLARATION:
      return visit(dynamic_cast<Module_or_interface_declaration *>(node), arg);
    case NodeType::EXPRESSION_OPT:
      return visit(dynamic_cast<Expression_opt *>(node), arg);
    case NodeType::GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST:
      return visit(
          dynamic_cast<Gate_instance_or_register_variable_list *>(node), arg);
    case NodeType::TK_EVALSTRINGLITERAL:
      return visit(dynamic_cast<Tk_evalstringliteral *>(node), arg);
    case NodeType::DELAY_OR_EVENT_CONTROL:
      return visit(dynamic_cast<Delay_or_event_control *>(node), arg);
    case NodeType::UDP_INPUT_LIST:
      return visit(dynamic_cast<Udp_input_list *>(node), arg);
    case NodeType::PARAMETER_VALUE_BYNAME_LIST:
      return visit(dynamic_cast<Parameter_value_byname_list *>(node), arg);
    case NodeType::MODULE_PORT_LIST_OPT:
      return visit(dynamic_cast<Module_port_list_opt *>(node), arg);
    case NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_OPT:
      return visit(dynamic_cast<List_of_ports_or_port_declarations_opt *>(node),
                   arg);
    case NodeType::ANY_PORT_LIST_TRAILING_COMMA_POSITIONAL:
      return visit(
          dynamic_cast<Any_port_list_trailing_comma_positional *>(node), arg);
    case NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT:
      return visit(
          dynamic_cast<Block_item_or_statement_or_null_list_opt *>(node), arg);
    case NodeType::GENVAR_DECLARATION:
      return visit(dynamic_cast<Genvar_declaration *>(node), arg);
    case NodeType::NUMBER:
      return visit(dynamic_cast<Number *>(node), arg);
    case NodeType::SPECIFY_ITEM_LIST:
      return visit(dynamic_cast<Specify_item_list *>(node), arg);
    case NodeType::TK_LS_EQ:
      return visit(dynamic_cast<Tk_ls_eq *>(node), arg);
    case NodeType::TF_VARIABLE_IDENTIFIER:
      return visit(dynamic_cast<Tf_variable_identifier *>(node), arg);
    case NodeType::INITIAL_CONSTRUCT:
      return visit(dynamic_cast<Initial_construct *>(node), arg);
    case NodeType::LOCALPARAM_ASSIGN_LIST:
      return visit(dynamic_cast<Localparam_assign_list *>(node), arg);
    case NodeType::DISABLE_STATEMENT:
      return visit(dynamic_cast<Disable_statement *>(node), arg);
    case NodeType::LIST_OF_MODULE_ITEM_IDENTIFIERS:
      return visit(dynamic_cast<List_of_module_item_identifiers *>(node), arg);
    case NodeType::ANY_PORT_LIST_ITEM_LAST_NAMED:
      return visit(dynamic_cast<Any_port_list_item_last_named *>(node), arg);
    case NodeType::NET_VARIABLE:
      return visit(dynamic_cast<Net_variable *>(node), arg);
    case NodeType::PARAMETER_EXPR_LIST:
      return visit(dynamic_cast<Parameter_expr_list *>(node), arg);
    case NodeType::SPECPARAM_DECLARATION:
      return visit(dynamic_cast<Specparam_declaration *>(node), arg);
    case NodeType::DEFERRED_IMMEDIATE_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Deferred_immediate_assertion_statement *>(node),
                   arg);
    case NodeType::SLICE_SIZE_OPT:
      return visit(dynamic_cast<Slice_size_opt *>(node), arg);
    case NodeType::CONCURRENT_ASSERTION_ITEM:
      return visit(dynamic_cast<Concurrent_assertion_item *>(node), arg);
    case NodeType::CLOCKING_ITEM_LIST_OPT:
      return visit(dynamic_cast<Clocking_item_list_opt *>(node), arg);
    case NodeType::CYCLE_DELAY:
      return visit(dynamic_cast<Cycle_delay *>(node), arg);
    case NodeType::MACROIDITEM:
      return visit(dynamic_cast<Macroiditem *>(node), arg);
    case NodeType::ASSUME_PROPERTY_STATEMENT:
      return visit(dynamic_cast<Assume_property_statement *>(node), arg);
    case NodeType::PULL01:
      return visit(dynamic_cast<Pull01 *>(node), arg);
    case NodeType::PREPROCESSOR_DIRECTIVE:
      return visit(dynamic_cast<Preprocessor_directive *>(node), arg);
    case NodeType::MODULE_ITEM_DIRECTIVE:
      return visit(dynamic_cast<Module_item_directive *>(node), arg);
    case NodeType::ASSERT_PROPERTY_STATEMENT:
      return visit(dynamic_cast<Assert_property_statement *>(node), arg);
    case NodeType::SCOPE_OR_IF_RES:
      return visit(dynamic_cast<Scope_or_if_res *>(node), arg);
    case NodeType::TASK_PROTOTYPE:
      return visit(dynamic_cast<Task_prototype *>(node), arg);
    case NodeType::CLOCKING_DECLARATION:
      return visit(dynamic_cast<Clocking_declaration *>(node), arg);
    case NodeType::BLOCK_IDENTIFIER_OPT:
      return visit(dynamic_cast<Block_identifier_opt *>(node), arg);
    case NodeType::MACROIDENTIFIER:
      return visit(dynamic_cast<Macroidentifier *>(node), arg);
    case NodeType::PROPERTY_SPEC_DISABLE_IFF_OPT:
      return visit(dynamic_cast<Property_spec_disable_iff_opt *>(node), arg);
    case NodeType::MACROGENERICITEM:
      return visit(dynamic_cast<Macrogenericitem *>(node), arg);
    case NodeType::MODULE_BLOCK:
      return visit(dynamic_cast<Module_block *>(node), arg);
    case NodeType::STREAM_EXPRESSION:
      return visit(dynamic_cast<Stream_expression *>(node), arg);
    case NodeType::FINAL_OR_ZERO:
      return visit(dynamic_cast<Final_or_zero *>(node), arg);
    case NodeType::TK_EDGE_DESCRIPTOR:
      return visit(dynamic_cast<Tk_edge_descriptor *>(node), arg);
    case NodeType::METHOD_PROPERTY_QUALIFIER_LIST_NOT_STARTING_WITH_VIRTUAL:
      return visit(
          dynamic_cast<
              Method_property_qualifier_list_not_starting_with_virtual *>(node),
          arg);
    case NodeType::IDENTIFIER_OPT:
      return visit(dynamic_cast<Identifier_opt *>(node), arg);
    case NodeType::MODULE_PARAMETER_PORT_LIST_PREPROCESSOR_LAST:
      return visit(
          dynamic_cast<Module_parameter_port_list_preprocessor_last *>(node),
          arg);
    case NodeType::TYPE_ASSIGNMENT:
      return visit(dynamic_cast<Type_assignment *>(node), arg);
    case NodeType::TYPE_ASSIGNMENT_LIST:
      return visit(dynamic_cast<Type_assignment_list *>(node), arg);
    case NodeType::METHOD_QUALIFIER_LIST_OPT:
      return visit(dynamic_cast<Method_qualifier_list_opt *>(node), arg);
    case NodeType::STREAM_OPERATOR:
      return visit(dynamic_cast<Stream_operator *>(node), arg);
    case NodeType::ASSERTION_ITEM:
      return visit(dynamic_cast<Assertion_item *>(node), arg);
    case NodeType::PROPERTY_SPEC:
      return visit(dynamic_cast<Property_spec *>(node), arg);
    case NodeType::STREAMING_CONCATENATION:
      return visit(dynamic_cast<Streaming_concatenation *>(node), arg);
    case NodeType::EDGE_DESCRIPTOR_LIST:
      return visit(dynamic_cast<Edge_descriptor_list *>(node), arg);
    case NodeType::PROPERTY_QUALIFIER:
      return visit(dynamic_cast<Property_qualifier *>(node), arg);
    case NodeType::EVENT_CONTROL_OPT:
      return visit(dynamic_cast<Event_control_opt *>(node), arg);
    case NodeType::CLASS_ITEM_QUALIFIER:
      return visit(dynamic_cast<Class_item_qualifier *>(node), arg);
    case NodeType::CONCURRENT_ASSERTION_STATEMENT:
      return visit(dynamic_cast<Concurrent_assertion_statement *>(node), arg);
    case NodeType::COVER_PROPERTY_STATEMENT:
      return visit(dynamic_cast<Cover_property_statement *>(node), arg);
    case NodeType::STREAM_EXPRESSION_LIST:
      return visit(dynamic_cast<Stream_expression_list *>(node), arg);
    case NodeType::CLASS_ITEM_QUALIFIER_LIST_OPT:
      return visit(dynamic_cast<Class_item_qualifier_list_opt *>(node), arg);
    case NodeType::ASSERTION_ITEM_DECLARATION:
      return visit(dynamic_cast<Assertion_item_declaration *>(node), arg);
    case NodeType::BOOLEAN_ABBREV:
      return visit(dynamic_cast<Boolean_abbrev *>(node), arg);
    case NodeType::CYCLE_DELAY_RANGE:
      return visit(dynamic_cast<Cycle_delay_range *>(node), arg);
    case NodeType::PROPERTY_OPERATOR:
      return visit(dynamic_cast<Property_operator *>(node), arg);
    case NodeType::PROPERTY_SPEC_DISABLE_IFF:
      return visit(dynamic_cast<Property_spec_disable_iff *>(node), arg);
    case NodeType::CONFIG_DECLARATION:
      return visit(dynamic_cast<Config_declaration *>(node), arg);
    case NodeType::WITH_CONSTRAINT_BLOCK_OPT:
      return visit(dynamic_cast<With_constraint_block_opt *>(node), arg);
    case NodeType::RANDOM_QUALIFIER:
      return visit(dynamic_cast<Random_qualifier *>(node), arg);
    case NodeType::BIND_TARGET_INSTANCE_LIST:
      return visit(dynamic_cast<Bind_target_instance_list *>(node), arg);
    case NodeType::HIERARCHY_OR_CALL_EXTENSION:
      return visit(dynamic_cast<Hierarchy_or_call_extension *>(node), arg);
    case NodeType::CLOCKING_ITEM_LIST:
      return visit(dynamic_cast<Clocking_item_list *>(node), arg);
    case NodeType::MODPORT_DECLARATION:
      return visit(dynamic_cast<Modport_declaration *>(node), arg);
    case NodeType::CLASS_CONSTRAINT:
      return visit(dynamic_cast<Class_constraint *>(node), arg);
    case NodeType::NET_ALIAS:
      return visit(dynamic_cast<Net_alias *>(node), arg);
    case NodeType::TYPE_REFERENCE:
      return visit(dynamic_cast<Type_reference *>(node), arg);
    case NodeType::METHOD_QUALIFIER_LIST:
      return visit(dynamic_cast<Method_qualifier_list *>(node), arg);
    case NodeType::INTERFACE_TYPE:
      return visit(dynamic_cast<Interface_type *>(node), arg);
    case NodeType::PACKAGE_EXPORT_DECLARATION:
      return visit(dynamic_cast<Package_export_declaration *>(node), arg);
    case NodeType::INTERFACE_OPT: 
      return visit(dynamic_cast<Interface_opt *>(node), arg);
    case NodeType::DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID: 
      return visit(dynamic_cast<Data_type_or_implicit_basic_followed_by_id *>(node), arg);
    case NodeType::COVERAGE_SPEC_OR_OPTION_LIST_OPT: 
      return visit(dynamic_cast<Coverage_spec_or_option_list_opt *>(node), arg);
    case NodeType::MODPORT_ITEM_LIST: 
      return visit(dynamic_cast<Modport_item_list *>(node), arg);

    case NodeType::EXPECT_PROPERTY_STATEMENT: 
      return visit(dynamic_cast<Expect_property_statement *>(node), arg);

    case NodeType::LIB_CELL_IDENTIFIERS_OPT: 
      return visit(dynamic_cast<Lib_cell_identifiers_opt *>(node), arg);

    case NodeType::SEQUENCE_PORT_LIST_IN_PARENS_OPT: 
      return visit(dynamic_cast<Sequence_port_list_in_parens_opt *>(node), arg);

    case NodeType::CLOCKING_DIRECTION: 
      return visit(dynamic_cast<Clocking_direction *>(node), arg);

    case NodeType::GOTO_REPETITION: 
      return visit(dynamic_cast<Goto_repetition *>(node), arg);

    case NodeType::CONSTRAINT_BLOCK_ITEM: 
      return visit(dynamic_cast<Constraint_block_item *>(node), arg);

    case NodeType::ASSERTION_VARIABLE_DECLARATION: 
      return visit(dynamic_cast<Assertion_variable_declaration *>(node), arg);

    case NodeType::TK_STATIC_OPT: 
      return visit(dynamic_cast<TK_static_opt *>(node), arg);

    case NodeType::DESIGN_STATEMENT: 
      return visit(dynamic_cast<Design_statement *>(node), arg);

    case NodeType::SEQUENCE_DECLARATION: 
      return visit(dynamic_cast<Sequence_declaration *>(node), arg);

    case NodeType::CLOCKING_ITEM: 
      return visit(dynamic_cast<Clocking_item *>(node), arg);

    case NodeType::PROPERTY_PORT_ITEM: 
      return visit(dynamic_cast<Property_port_item *>(node), arg);

    case NodeType::LIST_OF_CONFIG_RULE_STATEMENTS: 
      return visit(dynamic_cast<List_of_config_rule_statements *>(node), arg);

    case NodeType::CYCLE_RANGE: 
      return visit(dynamic_cast<Cycle_range *>(node), arg);

    case NodeType::BIND_TARGET_INSTANCE: 
      return visit(dynamic_cast<Bind_target_instance *>(node), arg);

    case NodeType::LIB_CELL_ID: 
      return visit(dynamic_cast<Lib_cell_id *>(node), arg);

    case NodeType::PROPERTY_DECLARATION: 
      return visit(dynamic_cast<Property_declaration *>(node), arg);

    case NodeType::PROPERTY_FORMAL_TYPE_FOLLOWED_BY_ID: 
      return visit(dynamic_cast<Property_formal_type_followed_by_id *>(node), arg);

    case NodeType::MODPORT_SIMPLE_PORTS_DECLARATION_LAST: 
      return visit(dynamic_cast<Modport_simple_ports_declaration_last *>(node), arg);

    case NodeType::COVERGROUP_DECLARATION: 
      return visit(dynamic_cast<Covergroup_declaration *>(node), arg);

    case NodeType::COVERAGE_SPEC: 
      return visit(dynamic_cast<Coverage_spec *>(node), arg);

    case NodeType::CONSECUTIVE_REPETITION: 
      return visit(dynamic_cast<Consecutive_repetition *>(node), arg);

    case NodeType::LIST_OF_LIBRARIES_OPT: 
      return visit(dynamic_cast<List_of_libraries_opt *>(node), arg);

    case NodeType::IDENTIFIER_LIST_IN_PARENS_OPT: 
      return visit(dynamic_cast<Identifier_list_in_parens_opt *>(node), arg);

    case NodeType::LIST_OF_CLOCKING_DECL_ASSIGN: 
      return visit(dynamic_cast<List_of_clocking_decl_assign *>(node), arg);

    case NodeType::COVERAGE_EVENT: 
      return visit(dynamic_cast<Coverage_event *>(node), arg);

    case NodeType::CONFIG_RULE_STATEMENT: 
      return visit(dynamic_cast<Config_rule_statement *>(node), arg);

    case NodeType::TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID: 
      return visit(dynamic_cast<Type_identifier_or_implicit_basic_followed_by_id *>(node), arg);

    case NodeType::ASSERTION_VARIABLE_DECLARATION_LIST: 
      return visit(dynamic_cast<Assertion_variable_declaration_list *>(node), arg);

    case NodeType::CONSTRAINT_EXPRESSION_NO_PREPROCESSOR: 
      return visit(dynamic_cast<Constraint_expression_no_preprocessor *>(node), arg);

    case NodeType::CLOCKING_DECL_ASSIGN: 
      return visit(dynamic_cast<Clocking_decl_assign *>(node), arg);

    case NodeType::WITH_CONSTRAINT_BLOCK: 
      return visit(dynamic_cast<With_constraint_block *>(node), arg);

    case NodeType::OPTIONAL_SEMICOLON: 
      return visit(dynamic_cast<Optional_semicolon *>(node), arg);

    case NodeType::PROPERTY_PORT_LIST_IN_PARENS_OPT: 
      return visit(dynamic_cast<Property_port_list_in_parens_opt *>(node), arg);

    case NodeType::MODPORT_SIMPLE_PORTS_DECLARATION_BEGIN: 
      return visit(dynamic_cast<Modport_simple_ports_declaration_begin *>(node), arg);

    case NodeType::MODPORT_SIMPLE_PORT: 
      return visit(dynamic_cast<Modport_simple_port *>(node), arg);

    case NodeType::CLOCKING_SKEW_OPT: 
      return visit(dynamic_cast<Clocking_skew_opt *>(node), arg);

    case NodeType::IMPLICATION_OPERATOR: 
      return visit(dynamic_cast<Implication_operator *>(node), arg);

    case NodeType::NET_ALIAS_ASSIGN_LVALUE_LIST: 
      return visit(dynamic_cast<Net_alias_assign_lvalue_list *>(node), arg);

    case NodeType::NONCONSECUTIVE_REPETITION: 
      return visit(dynamic_cast<Nonconsecutive_repetition *>(node), arg);

    case NodeType::BINS_OR_OPTIONS_LIST_OPT: 
      return visit(dynamic_cast<Bins_or_options_list_opt *>(node), arg);

    case NodeType::SEQUENCE_PORT_LIST_OPT: 
      return visit(dynamic_cast<Sequence_port_list_opt *>(node), arg);

    case NodeType::PROPERTY_PORT_MODIFIERS_OPT: 
      return visit(dynamic_cast<Property_port_modifiers_opt *>(node), arg);

    case NodeType::LIBLIST_CLAUSE: 
      return visit(dynamic_cast<Liblist_clause *>(node), arg);

    case NodeType::CONSTRAINT_DECLARATION: 
      return visit(dynamic_cast<Constraint_declaration *>(node), arg);

    case NodeType::PROPERTY_ACTUAL_ARG_OPT: 
      return visit(dynamic_cast<Property_actual_arg_opt *>(node), arg);

    case NodeType::LIST_OF_CONFIG_RULE_STATEMENTS_OPT: 
      return visit(dynamic_cast<List_of_config_rule_statements_opt *>(node), arg);

    case NodeType::MODPORT_PORTS_LIST: 
      return visit(dynamic_cast<Modport_ports_list *>(node), arg);

    case NodeType::COVER_POINT: 
      return visit(dynamic_cast<Cover_point *>(node), arg);

    case NodeType::MODPORT_ITEM: 
      return visit(dynamic_cast<Modport_item *>(node), arg);

    case NodeType::CONSTRAINT_BLOCK_ITEM_LIST_OPT: 
      return visit(dynamic_cast<Constraint_block_item_list_opt *>(node), arg);

    case NodeType::LIB_CELL_IDENTIFIERS: 
      return visit(dynamic_cast<Lib_cell_identifiers *>(node), arg);

    case NodeType::METHOD_QUALIFIER: 
      return visit(dynamic_cast<Method_qualifier *>(node), arg);

    case NodeType::PROPERTY_PORT_LIST: 
      return visit(dynamic_cast<Property_port_list *>(node), arg);

    case NodeType::LIST_OF_LIBRARIES: 
      return visit(dynamic_cast<List_of_libraries *>(node), arg);

    case NodeType::CONSTRAINT_BLOCK_ITEM_LIST: 
      return visit(dynamic_cast<Constraint_block_item_list *>(node), arg);


    case NodeType::COVERAGE_SPEC_OR_OPTION_LIST: 
      return visit(dynamic_cast<Coverage_spec_or_option_list *>(node), arg);

    case NodeType::CONSTRAINT_BLOCK: 
      return visit(dynamic_cast<Constraint_block *>(node), arg);

    case NodeType::COVERAGE_EVENT_OPT: 
      return visit(dynamic_cast<Coverage_event_opt *>(node), arg);

    case NodeType::CYCLE_RANGE_OR_EXPR: 
      return visit(dynamic_cast<Cycle_range_or_expr *>(node), arg);

    case NodeType::COVERAGE_SPEC_OR_OPTION: 
      return visit(dynamic_cast<Coverage_spec_or_option *>(node), arg);

    case NodeType::TK_STATIC_OPT:
      return visit(dynamic_cast<Tk_static_opt *>(node), arg);
    default:
      return R();
    }
  }

  virtual R visit(Node *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Node *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Terminal *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Terminal *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_delay_range_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_delay_range_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_simple_path *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_simple_path *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Event_control *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Event_control *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(String_literal *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(String_literal *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Charge_strength_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Charge_strength_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dpi_import_export *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dpi_import_export *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(For_initialization_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(For_initialization_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_port_identifiers *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_port_identifiers *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Non_integer_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Non_integer_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_value_ranges_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_value_ranges_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_item_no_pp *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_item_no_pp *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_delay_repetition_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_delay_repetition_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Add_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Add_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dpi_import_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dpi_import_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_realtime *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_realtime *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Case_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Case_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_if_else_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_if_else_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Non_anonymous_instantiation_base *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Non_anonymous_instantiation_base *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Unary_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Unary_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Unary_op *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Unary_op *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_id *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_id *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Reference *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Reference *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Cast *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Cast *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_variable_identifier_first *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_variable_identifier_first *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R
  visit(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
            *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(
      Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt *node,
      T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Type_or_id_root *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Type_or_id_root *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_or_generate_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_or_generate_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list_trailing_comma *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list_trailing_comma *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Instantiation_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Instantiation_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameters *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameters *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Reference_or_call_base *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Reference_or_call_base *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Param_type_followed_by_id_and_dimensions_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Param_type_followed_by_id_and_dimensions_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Structure_or_array_pattern_key *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Structure_or_array_pattern_key *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_assign_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_assign_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Defparam_assign_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Defparam_assign_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Generate_item_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Generate_item_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_octdigits *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_octdigits *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_expr_primary *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_expr_primary *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Lpvalue *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Lpvalue *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Label_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Label_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Escapedidentifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Escapedidentifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Generate_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Generate_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_type_primitive *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_type_primitive *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Spec_reference_event *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Spec_reference_event *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_input_declaration_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_input_declaration_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Non_port_module_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Non_port_module_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R
  visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R
  visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi *node,
        T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_prefix_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_prefix_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expr_primary_braces *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expr_primary_braces *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Pow_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Pow_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(For_init_decl_or_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(For_init_decl_or_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_initial *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_initial *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_list_paren_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_list_paren_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Struct_data_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Struct_data_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_sequ_entry *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_sequ_entry *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Net_variable_or_decl_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Net_variable_or_decl_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_value_byname_list_trailing_comma *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_value_byname_list_trailing_comma *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Inc_or_dec_expression *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Inc_or_dec_expression *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Net_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Net_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Select_dimensions_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Select_dimensions_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Spec_polarity *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Spec_polarity *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Macro_formal_parameter *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Macro_formal_parameter *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Structure_or_array_pattern_expression *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Structure_or_array_pattern_expression *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(For_step *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(For_step *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specparam_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specparam_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_binbase *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_binbase *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_stringliteral *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_stringliteral *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Var_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Var_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Identifier_optional_unpacked_dimensions *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Identifier_optional_unpacked_dimensions *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Function_item_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Function_item_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Type_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Type_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_body *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_body *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Mul_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Mul_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Par_block *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Par_block *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Keywordidentifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Keywordidentifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Logeq_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Logeq_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_common_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_common_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Primitive_gate_instance *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Primitive_gate_instance *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_type_or_implicit *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_type_or_implicit *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_octbase *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_octbase *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_hexbase *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_hexbase *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Seq_block *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Seq_block *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Task_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Task_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R
  visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R
  visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node,
        T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_block *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_block *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_decnumber *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_decnumber *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_decbase *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_decbase *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_implication_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_implication_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Bit_logic_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Bit_logic_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Integer_atom_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Integer_atom_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Lifetime *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Lifetime *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_argument_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_argument_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay_value_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay_value_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_port_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_port_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Jump_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Jump_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay_value *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay_value *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_or_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_or_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_attribute_foreign_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_attribute_foreign_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_direction_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_direction_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_item_expr_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_item_expr_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Cont_assign_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Cont_assign_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_argument_list_trailing_comma *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_argument_list_trailing_comma *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Procedural_continuous_assignment *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Procedural_continuous_assignment *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expression_or_dist *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expression_or_dist *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_start *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_start *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expr_primary_parens *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expr_primary_parens *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Open_range_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Open_range_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Unary_prefix_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Unary_prefix_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay_identifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay_identifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_identifiers_unpacked_dimensions *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_identifiers_unpacked_dimensions *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay_scope *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay_scope *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Action_block *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Action_block *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Trailing_assign_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Trailing_assign_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Enum_name_list_trailing_comma *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Enum_name_list_trailing_comma *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_port_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_port_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Equiv_impl_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Equiv_impl_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_new *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_new *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_net_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_net_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Unqualified_id *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Unqualified_id *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Begin *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Begin *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(System_tf_call *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(System_tf_call *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_value_byname_list_item_last *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_value_byname_list_item_last *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Conditional_generate_construct *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Conditional_generate_construct *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Timescale_directive *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Timescale_directive *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_expression *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_expression *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_sequ_entry_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_sequ_entry_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Symbol_or_label *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Symbol_or_label *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Simple_sequence_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Simple_sequence_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Systemtfidentifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Systemtfidentifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_unbasednumber *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_unbasednumber *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Decl_dimensions_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Decl_dimensions_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_items_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_items_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Enum_name *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Enum_name *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_value_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_value_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_edge_path *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_edge_path *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Implicit_class_handle *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Implicit_class_handle *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Statement_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Statement_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Type_identifier_followed_by_id *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Type_identifier_followed_by_id *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Method_prototype *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Method_prototype *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Block_item_or_statement_or_null_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Block_item_or_statement_or_null_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Endnew_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Endnew_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_item_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_item_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_simple_path_decl *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_simple_path_decl *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_rs_eq *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_rs_eq *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_import_item_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_import_item_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_port_decl *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_port_decl *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(With_exprs_suffix *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(With_exprs_suffix *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Generate_region *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Generate_region *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Call_base *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Call_base *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Array_locator_method *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Array_locator_method *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_declaration_ansi *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_declaration_ansi *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Bitand_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Bitand_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Range_list_in_braces *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Range_list_in_braces *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list_item_last *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list_item_last *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Hex_based_number *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Hex_based_number *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Hierarchy_event_identifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Hierarchy_event_identifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_variable_decl_assignments *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_variable_decl_assignments *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Random_qualifier_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Random_qualifier_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Drive_strength_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Drive_strength_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_timeliteral *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_timeliteral *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Value_range *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Value_range *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expr_mintypmax_generalized *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expr_mintypmax_generalized *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Polarity_operator *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Polarity_operator *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(For_initialization *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(For_initialization *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Enum_data_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Enum_data_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Blocking_assignment *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Blocking_assignment *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay1 *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay1 *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Based_number *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Based_number *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Procedural_timing_control_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Procedural_timing_control_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Block_item_decl *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Block_item_decl *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Net_variable_or_decl_assigns *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Net_variable_or_decl_assigns *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Time_literal *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Time_literal *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Function_item_data_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Function_item_data_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Decl_variable_dimension *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Decl_variable_dimension *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Endfunction_label_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Endfunction_label_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Qualified_id *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Qualified_id *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Immediate_assertion_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Immediate_assertion_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Join_keyword *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Join_keyword *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_bindigits *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_bindigits *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Event_trigger *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Event_trigger *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dynamic_array_new *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dynamic_array_new *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Matches_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Matches_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_reference_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_reference_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Array_reduction_method *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Array_reduction_method *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Builtin_array_method *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Builtin_array_method *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assignment_pattern_expression *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Assignment_pattern_expression *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Drive_strength *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Drive_strength *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_declaration_non_ansi *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_declaration_non_ansi *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Var_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Var_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_item_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_item_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Genericidentifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Genericidentifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_item_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_item_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_item_last_ansi *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_item_last_ansi *node,
                  T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R
  visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node,
                  T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Xor_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Xor_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dec_based_number *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dec_based_number *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Loop_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Loop_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_declaration_or_module_instantiation *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_declaration_or_module_instantiation *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_comb_entry_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_comb_entry_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Bit_logic *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Bit_logic *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Reference_or_call *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Reference_or_call *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Local_root *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Local_root *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_direction *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_direction *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Variable_decl_assignment *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Variable_decl_assignment *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_edge_path_decl *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_edge_path_decl *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Function_prototype *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Function_prototype *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_within_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_within_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expr_primary_no_groups *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expr_primary_no_groups *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_value_byname *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_value_byname *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Case_any *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Case_any *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Spec_notifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Spec_notifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Block_item_or_statement_or_null *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Block_item_or_statement_or_null *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_param_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_param_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_list_trailing_comma *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_list_trailing_comma *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Struct_union_member *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Struct_union_member *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_port_list_positional *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_port_list_positional *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dir *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dir *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Lifetime_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Lifetime_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_identifiers *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_identifiers *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Edge_operator *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Edge_operator *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_virtual_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_virtual_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Timeunits_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Timeunits_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_item_or_statement_or_null *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_item_or_statement_or_null *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_import_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_import_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expr_primary *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expr_primary *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Signed_unsigned_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Signed_unsigned_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Non_anonymous_gate_instance_or_register_variable_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Non_anonymous_gate_instance_or_register_variable_list *node,
                  T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_comb_entry *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_comb_entry *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay3 *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay3 *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Inc_or_dec_or_primary_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Inc_or_dec_or_primary_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Procedural_assertion_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Procedural_assertion_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Struct_union_member_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Struct_union_member_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Comp_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Comp_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Postfix_expression *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Postfix_expression *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Symbolidentifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Symbolidentifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_input_sym *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_input_sym *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Pos_neg_number *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Pos_neg_number *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_terminal_descriptor *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_terminal_descriptor *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Select_variable_dimension *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Select_variable_dimension *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_ansi *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_ansi *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Generate_case_items *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Generate_case_items *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_type_primitive_scalar *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_type_primitive_scalar *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_item_or_statement_or_null_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_item_or_statement_or_null_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Conditional_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Conditional_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specparam_decl *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specparam_decl *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_non_ansi *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_non_ansi *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Statement_or_null_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Statement_or_null_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Task_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Task_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_declaration_base *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_declaration_base *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_port_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_port_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Macronumericwidth *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Macronumericwidth *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Trailing_decl_assignment_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Trailing_decl_assignment_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Gate_instance_or_register_variable *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Gate_instance_or_register_variable *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Bind_instantiation *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Bind_instantiation *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_import_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_import_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_package_import_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_package_import_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Structure_or_array_pattern_expression_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Structure_or_array_pattern_expression_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Event_expression_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Event_expression_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_rss_eq *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_rss_eq *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Implements_interface_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Implements_interface_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay3_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay3_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expr_mintypmax_trans_set *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expr_mintypmax_trans_set *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Statement_or_null *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Statement_or_null *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Enum_name_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Enum_name_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_unary_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_unary_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Pp_identifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Pp_identifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Shift_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Shift_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Oct_based_number *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Oct_based_number *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Hierarchy_segment *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Hierarchy_segment *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Nonblocking_assignment *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Nonblocking_assignment *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expression_list_proper *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expression_list_proper *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Generate_if *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Generate_if *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Function_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Function_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Scope_prefix *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Scope_prefix *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Primitive_gate_instance_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Primitive_gate_instance_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Simple_immediate_assertion_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Simple_immediate_assertion_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Description_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Description_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dr_strength0 *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dr_strength0 *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Unique_priority_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Unique_priority_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specparam *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specparam *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_expression_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_expression_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Cond_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Cond_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_reg_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_reg_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Logor_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Logor_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay3_or_drive_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay3_or_drive_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_item_or_statement_or_null_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_item_or_statement_or_null_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Net_decl_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Net_decl_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Always_any *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Always_any *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_tf_variable_identifiers *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_tf_variable_identifiers *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Var_or_net_type_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Var_or_net_type_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_list_item_last *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_list_item_last *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Task_declaration_id *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Task_declaration_id *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Instantiation_base *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Instantiation_base *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_repetition_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_repetition_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_hexdigits *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_hexdigits *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Non_anonymous_gate_instance_or_register_variable *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Non_anonymous_gate_instance_or_register_variable *node,
                  T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Localparam_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Localparam_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_items *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_items *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expression_in_parens *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expression_in_parens *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R
  visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node,
                  T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_reference *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_reference *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dist_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dist_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Caseeq_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Caseeq_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Generate_block *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Generate_block *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_item_last_non_ansi *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_item_last_non_ansi *node,
                  T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_argument_list_item_last *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_argument_list_item_last *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Gate_instantiation *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Gate_instantiation *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Casting_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Casting_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expr_mintypmax *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expr_mintypmax *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Continuous_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Continuous_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay_value_simple *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay_value_simple *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Switchtype *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Switchtype *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_or_generate_item_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_or_generate_item_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Bin_based_number *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Bin_based_number *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Loop_generate_construct *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Loop_generate_construct *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_override *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_override *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_primitive *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_primitive *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Repeat_control *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Repeat_control *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Packed_signing_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Packed_signing_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expression_or_null_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expression_or_null_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Enum_name_list_item_last *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Enum_name_list_item_last *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Macro_formals_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Macro_formals_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Spec_notifier_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Spec_notifier_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Hierarchy_extension *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Hierarchy_extension *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Generate_item_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Generate_item_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_declaration_modifiers_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_declaration_modifiers_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_throughout_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_throughout_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_expr_or_assignment_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_expr_or_assignment_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Bitor_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Bitor_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_port_list_trailing_comma_named *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_port_list_trailing_comma_named *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Function_return_type_and_id *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Function_return_type_and_id *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dr_strength1 *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dr_strength1 *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assign_modify_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Assign_modify_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_port_decls *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_port_decls *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Integer_vector_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Integer_vector_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assignment_pattern *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Assignment_pattern *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_constructor *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_constructor *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_parameter_port *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_parameter_port *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_or_generate_item_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_or_generate_item_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Final_construct *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Final_construct *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Member_name *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Member_name *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_import_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_import_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Signing *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Signing *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_constructor_prototype *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_constructor_prototype *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Generate_case_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Generate_case_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expression *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expression *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Cont_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Cont_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay_or_event_control_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay_or_event_control_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Bind_directive *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Bind_directive *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Misc_directive *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Misc_directive *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_initial_expr_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_initial_expr_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Description *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Description *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_type_base *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_type_base *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Trailing_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Trailing_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_end *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_end *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Wait_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Wait_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Package_item_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Package_item_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Case_items *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Case_items *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Statement_or_null_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Statement_or_null_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Port_named *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Port_named *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_output_sym *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_output_sym *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assignment_statement_no_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Assignment_statement_no_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_port_list_item_last_positional *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_port_list_item_last_positional *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_item_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_item_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_and_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_and_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Data_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Data_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Argument_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Argument_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(For_step_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(For_step_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Sequence_intersect_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Sequence_intersect_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Function_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Function_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Net_type_or_none *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Net_type_or_none *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_declaration_extends_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_declaration_extends_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Boolean_abbrev_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Boolean_abbrev_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_path_identifiers *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_path_identifiers *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_direction *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_direction *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_decdigits *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_decdigits *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(End *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(End *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Net_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Net_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_tagged_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_tagged_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_xzdigits *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_xzdigits *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Gatetype *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Gatetype *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Preprocess_include_argument *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Preprocess_include_argument *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Macro_formals_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Macro_formals_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Const_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Const_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Logand_expr *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Logand_expr *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Event_expression *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Event_expression *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_entry_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_entry_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Preprocessor_action *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Preprocessor_action *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_port_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_port_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_init_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_init_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R
  visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R
  visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node,
        T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Source_text *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Source_text *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Defparam_assign *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Defparam_assign *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Decl_dimensions *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Decl_dimensions *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Constant_dec_number *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Constant_dec_number *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Case_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Case_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assignment_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Assignment_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dpi_import_property_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dpi_import_property_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Dpi_spec_string *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Dpi_spec_string *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Trailing_decl_assignment *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Trailing_decl_assignment *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Always_construct *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Always_construct *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Genvar_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Genvar_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_port_list_named *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_port_list_named *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Subroutine_call *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Subroutine_call *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_expr_or_assignment *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_expr_or_assignment *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_argument *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_argument *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_or_interface_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_or_interface_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Expression_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Expression_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Gate_instance_or_register_variable_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Gate_instance_or_register_variable_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_evalstringliteral *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_evalstringliteral *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Delay_or_event_control *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Delay_or_event_control *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Udp_input_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Udp_input_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_value_byname_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_value_byname_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_port_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_port_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_ports_or_port_declarations_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_port_list_trailing_comma_positional *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_port_list_trailing_comma_positional *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Block_item_or_statement_or_null_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Block_item_or_statement_or_null_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Genvar_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Genvar_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Number *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Number *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specify_item_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specify_item_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_ls_eq *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_ls_eq *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tf_variable_identifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tf_variable_identifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Initial_construct *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Initial_construct *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Localparam_assign_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Localparam_assign_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Disable_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Disable_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(List_of_module_item_identifiers *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(List_of_module_item_identifiers *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Any_port_list_item_last_named *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Any_port_list_item_last_named *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Net_variable *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Net_variable *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Parameter_expr_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Parameter_expr_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Specparam_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Specparam_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Deferred_immediate_assertion_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Deferred_immediate_assertion_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Slice_size_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Slice_size_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Concurrent_assertion_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Concurrent_assertion_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Clocking_item_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Clocking_item_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Cycle_delay *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Cycle_delay *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Macroiditem *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Macroiditem *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assume_property_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Assume_property_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Pull01 *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Pull01 *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Preprocessor_directive *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Preprocessor_directive *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_item_directive *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_item_directive *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assert_property_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Assert_property_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Scope_or_if_res *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Scope_or_if_res *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Task_prototype *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Task_prototype *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Clocking_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Clocking_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Block_identifier_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Block_identifier_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Macroidentifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Macroidentifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_spec_disable_iff_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_spec_disable_iff_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Macrogenericitem *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Macrogenericitem *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_block *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_block *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Stream_expression *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Stream_expression *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Final_or_zero *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Final_or_zero *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Tk_edge_descriptor *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_edge_descriptor *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R
  visit(Method_property_qualifier_list_not_starting_with_virtual *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R
  visit(Method_property_qualifier_list_not_starting_with_virtual *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Identifier_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Identifier_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list_preprocessor_last *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Module_parameter_port_list_preprocessor_last *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Type_assignment *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Type_assignment *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Type_assignment_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Type_assignment_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Method_qualifier_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Method_qualifier_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Stream_operator *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Stream_operator *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assertion_item *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Assertion_item *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_spec *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_spec *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Streaming_concatenation *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Streaming_concatenation *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Edge_descriptor_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Edge_descriptor_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Property_qualifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Property_qualifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Event_control_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Event_control_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_item_qualifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_item_qualifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Concurrent_assertion_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Concurrent_assertion_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Cover_property_statement *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Cover_property_statement *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Stream_expression_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Stream_expression_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Class_item_qualifier_list_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Class_item_qualifier_list_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }

  virtual R visit(Assertion_item_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Assertion_item_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Boolean_abbrev *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Boolean_abbrev *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Cycle_delay_range *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Cycle_delay_range *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Property_operator *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Property_operator *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Property_spec_disable_iff *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Property_spec_disable_iff *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Config_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Config_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(With_constraint_block_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(With_constraint_block_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Random_qualifier *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Random_qualifier *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Bind_target_instance_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Bind_target_instance_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Hierarchy_or_call_extension *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Hierarchy_or_call_extension *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Clocking_item_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Clocking_item_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Modport_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Modport_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Class_constraint *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Class_constraint *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Net_alias *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Net_alias *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Type_reference *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Type_reference *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Method_qualifier_list *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Method_qualifier_list *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Interface_type *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Interface_type *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

  virtual R visit(Package_export_declaration *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }
    return R();
  }

  virtual R visit(Package_export_declaration *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }
    return R();
  }

virtual R visit(Interface_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Interface_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Data_type_or_implicit_basic_followed_by_id *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Data_type_or_implicit_basic_followed_by_id *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Coverage_spec_or_option_list_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Coverage_spec_or_option_list_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Modport_item_list *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Modport_item_list *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Expect_property_statement *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Expect_property_statement *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Lib_cell_identifiers_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Lib_cell_identifiers_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Sequence_port_list_in_parens_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Sequence_port_list_in_parens_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Clocking_direction *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Clocking_direction *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Goto_repetition *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Goto_repetition *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Constraint_block_item *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Constraint_block_item *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Assertion_variable_declaration *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Assertion_variable_declaration *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(TK_static_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(TK_static_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Design_statement *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Design_statement *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Sequence_declaration *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Sequence_declaration *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Clocking_item *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Clocking_item *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Property_port_item *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Property_port_item *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(List_of_config_rule_statements *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(List_of_config_rule_statements *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Cycle_range *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Cycle_range *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Bind_target_instance *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Bind_target_instance *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Lib_cell_id *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Lib_cell_id *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Property_declaration *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Property_declaration *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Property_formal_type_followed_by_id *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Property_formal_type_followed_by_id *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Modport_simple_ports_declaration_last *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Modport_simple_ports_declaration_last *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Covergroup_declaration *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Covergroup_declaration *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Coverage_spec *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Coverage_spec *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Consecutive_repetition *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Consecutive_repetition *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(List_of_libraries_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(List_of_libraries_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Identifier_list_in_parens_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Identifier_list_in_parens_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(List_of_clocking_decl_assign *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(List_of_clocking_decl_assign *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Coverage_event *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Coverage_event *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Config_rule_statement *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Config_rule_statement *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Type_identifier_or_implicit_basic_followed_by_id *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Type_identifier_or_implicit_basic_followed_by_id *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Assertion_variable_declaration_list *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Assertion_variable_declaration_list *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Constraint_expression_no_preprocessor *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Constraint_expression_no_preprocessor *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Clocking_decl_assign *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Clocking_decl_assign *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(With_constraint_block *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(With_constraint_block *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Optional_semicolon *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Optional_semicolon *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Property_port_list_in_parens_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Property_port_list_in_parens_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Modport_simple_ports_declaration_begin *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Modport_simple_ports_declaration_begin *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Modport_simple_port *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Modport_simple_port *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Clocking_skew_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Clocking_skew_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Implication_operator *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Implication_operator *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Net_alias_assign_lvalue_list *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Net_alias_assign_lvalue_list *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Nonconsecutive_repetition *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Nonconsecutive_repetition *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Bins_or_options_list_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Bins_or_options_list_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Sequence_port_list_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Sequence_port_list_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Property_port_modifiers_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Property_port_modifiers_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Liblist_clause *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Liblist_clause *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Constraint_declaration *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Constraint_declaration *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Property_actual_arg_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Property_actual_arg_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(List_of_config_rule_statements_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(List_of_config_rule_statements_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Modport_ports_list *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Modport_ports_list *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Cover_point *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Cover_point *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Modport_item *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Modport_item *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Constraint_block_item_list_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Constraint_block_item_list_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Lib_cell_identifiers *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Lib_cell_identifiers *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Method_qualifier *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Method_qualifier *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Property_port_list *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Property_port_list *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(List_of_libraries *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(List_of_libraries *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Constraint_block_item_list *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Constraint_block_item_list *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Coverage_spec_or_option_list *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Coverage_spec_or_option_list *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Constraint_block *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Constraint_block *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Coverage_event_opt *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Coverage_event_opt *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Cycle_range_or_expr *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Cycle_range_or_expr *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}

virtual R visit(Coverage_spec_or_option *node) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get());
  }
  return R();
}

virtual R visit(Coverage_spec_or_option *node, T arg) { 
  for (const std::unique_ptr<Node> &child : node->getChildren()) {
    applyVisit(child.get(), arg);
  }
  return R();
}


  virtual R visit(Tk_static_opt *node) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get());
    }

    return R();
  }

  virtual R visit(Tk_static_opt *node, T arg) {
    for (const std::unique_ptr<Node> &child : node->getChildren()) {
      applyVisit(child.get(), arg);
    }

    return R();
  }
};
#endif
