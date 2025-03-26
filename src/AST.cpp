#include "AST.h"
#include <utility>

const std::vector<std::unique_ptr<Node>> &Node::getChildren() {
  return this->children;
}

void Node::clearChildren() {
  this->children.clear();
}

std::unique_ptr<Node> Node::extractChild(Node *child) {
  for (auto it = children.begin(); it != children.end(); ++it) {
    if (it->get() == child) {
      std::unique_ptr<Node> extractedNode = std::move(*it);
      children.erase(it);
      return extractedNode;
    }
  }
  return nullptr;
}

void Node::insertChildToBegin(std::unique_ptr<Node> child) {
  this->children.insert(children.begin(), std::move(child));
}

void Node::insertChildToEnd(std::unique_ptr<Node> child) {
  this->children.insert(children.end(), std::move(child));
}

void Node::insertChild(std::unique_ptr<Node> child,
                       std::vector<std::unique_ptr<Node>>::const_iterator it) {
  this->children.insert(it, std::move(child));
}

void Node::setChildren(std::vector<std::unique_ptr<Node>> &&children) {
  this->children = std::move(children);
}

Node *Node::getParent() {
  return this->parent;
}

void Node::setParent(Node *parent) {
  this->parent = parent;
}

std::string Node::getElement() {
  return this->element;
}

void Node::setElement(std::string element) {
  this->element = element;
}

Terminal::Terminal(std::string element) {
  this->type = NodeType::TERMINAL;
  this->setElement(element);
}

Sequence_delay_range_expr::Sequence_delay_range_expr(std::string element) {
  this->type = NodeType::SEQUENCE_DELAY_RANGE_EXPR;
  this->setElement(element);
}

Port::Port(std::string element) {
  this->type = NodeType::PORT;
  this->setElement(element);
}

Specify_simple_path::Specify_simple_path(std::string element) {
  this->type = NodeType::SPECIFY_SIMPLE_PATH;
  this->setElement(element);
}

Event_control::Event_control(std::string element) {
  this->type = NodeType::EVENT_CONTROL;
  this->setElement(element);
}

String_literal::String_literal(std::string element) {
  this->type = NodeType::STRING_LITERAL;
  this->setElement(element);
}

Charge_strength_opt::Charge_strength_opt(std::string element) {
  this->type = NodeType::CHARGE_STRENGTH_OPT;
  this->setElement(element);
}

Dpi_import_export::Dpi_import_export(std::string element) {
  this->type = NodeType::DPI_IMPORT_EXPORT;
  this->setElement(element);
}

For_initialization_opt::For_initialization_opt(std::string element) {
  this->type = NodeType::FOR_INITIALIZATION_OPT;
  this->setElement(element);
}

List_of_port_identifiers::List_of_port_identifiers(std::string element) {
  this->type = NodeType::LIST_OF_PORT_IDENTIFIERS;
  this->setElement(element);
}

Non_integer_type::Non_integer_type(std::string element) {
  this->type = NodeType::NON_INTEGER_TYPE;
  this->setElement(element);
}

Parameter_value_ranges_opt::Parameter_value_ranges_opt(std::string element) {
  this->type = NodeType::PARAMETER_VALUE_RANGES_OPT;
  this->setElement(element);
}

Package_item_no_pp::Package_item_no_pp(std::string element) {
  this->type = NodeType::PACKAGE_ITEM_NO_PP;
  this->setElement(element);
}

Sequence_delay_repetition_list::Sequence_delay_repetition_list(
    std::string element) {
  this->type = NodeType::SEQUENCE_DELAY_REPETITION_LIST;
  this->setElement(element);
}

Add_expr::Add_expr(std::string element) {
  this->type = NodeType::ADD_EXPR;
  this->setElement(element);
}

Dpi_import_item::Dpi_import_item(std::string element) {
  this->type = NodeType::DPI_IMPORT_ITEM;
  this->setElement(element);
}

Tk_realtime::Tk_realtime(std::string element) {
  this->type = NodeType::TK_REALTIME;
  this->setElement(element);
}

Case_item::Case_item(std::string element) {
  this->type = NodeType::CASE_ITEM;
  this->setElement(element);
}

Property_if_else_expr::Property_if_else_expr(std::string element) {
  this->type = NodeType::PROPERTY_IF_ELSE_EXPR;
  this->setElement(element);
}

Non_anonymous_instantiation_base::Non_anonymous_instantiation_base(
    std::string element) {
  this->type = NodeType::NON_ANONYMOUS_INSTANTIATION_BASE;
  this->setElement(element);
}

Unary_expr::Unary_expr(std::string element) {
  this->type = NodeType::UNARY_EXPR;
  this->setElement(element);
}

Unary_op::Unary_op(std::string element) {
  this->type = NodeType::UNARY_OP;
  this->setElement(element);
}

Class_id::Class_id(std::string element) {
  this->type = NodeType::CLASS_ID;
  this->setElement(element);
}

Reference::Reference(std::string element) {
  this->type = NodeType::REFERENCE;
  this->setElement(element);
}

Cast::Cast(std::string element) {
  this->type = NodeType::CAST;
  this->setElement(element);
}

Tf_variable_identifier_first::Tf_variable_identifier_first(
    std::string element) {
  this->type = NodeType::TF_VARIABLE_IDENTIFIER_FIRST;
  this->setElement(element);
}

Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt::
    Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt(
        std::string element) {
  this->type = NodeType::
      TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT;
  this->setElement(element);
}

Type_or_id_root::Type_or_id_root(std::string element) {
  this->type = NodeType::TYPE_OR_ID_ROOT;
  this->setElement(element);
}

Module_or_generate_item::Module_or_generate_item(std::string element) {
  this->type = NodeType::MODULE_OR_GENERATE_ITEM;
  this->setElement(element);
}

Module_parameter_port_list_trailing_comma::
    Module_parameter_port_list_trailing_comma(std::string element) {
  this->type = NodeType::MODULE_PARAMETER_PORT_LIST_TRAILING_COMMA;
  this->setElement(element);
}

Instantiation_type::Instantiation_type(std::string element) {
  this->type = NodeType::INSTANTIATION_TYPE;
  this->setElement(element);
}

Parameters::Parameters(std::string element) {
  this->type = NodeType::PARAMETERS;
  this->setElement(element);
}

Reference_or_call_base::Reference_or_call_base(std::string element) {
  this->type = NodeType::REFERENCE_OR_CALL_BASE;
  this->setElement(element);
}

Param_type_followed_by_id_and_dimensions_opt::
    Param_type_followed_by_id_and_dimensions_opt(std::string element) {
  this->type = NodeType::PARAM_TYPE_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT;
  this->setElement(element);
}

Structure_or_array_pattern_key::Structure_or_array_pattern_key(
    std::string element) {
  this->type = NodeType::STRUCTURE_OR_ARRAY_PATTERN_KEY;
  this->setElement(element);
}

Parameter_assign_list::Parameter_assign_list(std::string element) {
  this->type = NodeType::PARAMETER_ASSIGN_LIST;
  this->setElement(element);
}

Defparam_assign_list::Defparam_assign_list(std::string element) {
  this->type = NodeType::DEFPARAM_ASSIGN_LIST;
  this->setElement(element);
}

Generate_item_list_opt::Generate_item_list_opt(std::string element) {
  this->type = NodeType::GENERATE_ITEM_LIST_OPT;
  this->setElement(element);
}

Tk_octdigits::Tk_octdigits(std::string element) {
  this->type = NodeType::TK_OCTDIGITS;
  this->setElement(element);
}

Sequence_expr_primary::Sequence_expr_primary(std::string element) {
  this->type = NodeType::SEQUENCE_EXPR_PRIMARY;
  this->setElement(element);
}

Lpvalue::Lpvalue(std::string element) {
  this->type = NodeType::LPVALUE;
  this->setElement(element);
}

Label_opt::Label_opt(std::string element) {
  this->type = NodeType::LABEL_OPT;
  this->setElement(element);
}

Escapedidentifier::Escapedidentifier(std::string element) {
  this->type = NodeType::ESCAPEDIDENTIFIER;
  this->setElement(element);
}

Generate_item::Generate_item(std::string element) {
  this->type = NodeType::GENERATE_ITEM;
  this->setElement(element);
}

Data_type_primitive::Data_type_primitive(std::string element) {
  this->type = NodeType::DATA_TYPE_PRIMITIVE;
  this->setElement(element);
}

Spec_reference_event::Spec_reference_event(std::string element) {
  this->type = NodeType::SPEC_REFERENCE_EVENT;
  this->setElement(element);
}

Udp_input_declaration_list::Udp_input_declaration_list(std::string element) {
  this->type = NodeType::UDP_INPUT_DECLARATION_LIST;
  this->setElement(element);
}

Non_port_module_item::Non_port_module_item(std::string element) {
  this->type = NodeType::NON_PORT_MODULE_ITEM;
  this->setElement(element);
}

List_of_ports_or_port_declarations_trailing_comma_non_ansi::
    List_of_ports_or_port_declarations_trailing_comma_non_ansi(
        std::string element) {
  this->type =
      NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_NON_ANSI;
  this->setElement(element);
}

Module_parameter_port_list_opt::Module_parameter_port_list_opt(
    std::string element) {
  this->type = NodeType::MODULE_PARAMETER_PORT_LIST_OPT;
  this->setElement(element);
}

Property_prefix_expr::Property_prefix_expr(std::string element) {
  this->type = NodeType::PROPERTY_PREFIX_EXPR;
  this->setElement(element);
}

Expr_primary_braces::Expr_primary_braces(std::string element) {
  this->type = NodeType::EXPR_PRIMARY_BRACES;
  this->setElement(element);
}

Pow_expr::Pow_expr(std::string element) {
  this->type = NodeType::POW_EXPR;
  this->setElement(element);
}

For_init_decl_or_assign::For_init_decl_or_assign(std::string element) {
  this->type = NodeType::FOR_INIT_DECL_OR_ASSIGN;
  this->setElement(element);
}

Udp_initial::Udp_initial(std::string element) {
  this->type = NodeType::UDP_INITIAL;
  this->setElement(element);
}

Tf_port_list_paren_opt::Tf_port_list_paren_opt(std::string element) {
  this->type = NodeType::TF_PORT_LIST_PAREN_OPT;
  this->setElement(element);
}

Struct_data_type::Struct_data_type(std::string element) {
  this->type = NodeType::STRUCT_DATA_TYPE;
  this->setElement(element);
}

Udp_sequ_entry::Udp_sequ_entry(std::string element) {
  this->type = NodeType::UDP_SEQU_ENTRY;
  this->setElement(element);
}

Net_variable_or_decl_assign::Net_variable_or_decl_assign(std::string element) {
  this->type = NodeType::NET_VARIABLE_OR_DECL_ASSIGN;
  this->setElement(element);
}

Parameter_value_byname_list_trailing_comma::
    Parameter_value_byname_list_trailing_comma(std::string element) {
  this->type = NodeType::PARAMETER_VALUE_BYNAME_LIST_TRAILING_COMMA;
  this->setElement(element);
}

Inc_or_dec_expression::Inc_or_dec_expression(std::string element) {
  this->type = NodeType::INC_OR_DEC_EXPRESSION;
  this->setElement(element);
}

Net_type::Net_type(std::string element) {
  this->type = NodeType::NET_TYPE;
  this->setElement(element);
}

Select_dimensions_opt::Select_dimensions_opt(std::string element) {
  this->type = NodeType::SELECT_DIMENSIONS_OPT;
  this->setElement(element);
}

Spec_polarity::Spec_polarity(std::string element) {
  this->type = NodeType::SPEC_POLARITY;
  this->setElement(element);
}

Macro_formal_parameter::Macro_formal_parameter(std::string element) {
  this->type = NodeType::MACRO_FORMAL_PARAMETER;
  this->setElement(element);
}

Structure_or_array_pattern_expression::Structure_or_array_pattern_expression(
    std::string element) {
  this->type = NodeType::STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION;
  this->setElement(element);
}

For_step::For_step(std::string element) {
  this->type = NodeType::FOR_STEP;
  this->setElement(element);
}

Specparam_list::Specparam_list(std::string element) {
  this->type = NodeType::SPECPARAM_LIST;
  this->setElement(element);
}

Tk_binbase::Tk_binbase(std::string element) {
  this->type = NodeType::TK_BINBASE;
  this->setElement(element);
}

Tk_stringliteral::Tk_stringliteral(std::string element) {
  this->type = NodeType::TK_STRINGLITERAL;
  this->setElement(element);
}

Var_opt::Var_opt(std::string element) {
  this->type = NodeType::VAR_OPT;
  this->setElement(element);
}

Identifier_optional_unpacked_dimensions::
    Identifier_optional_unpacked_dimensions(std::string element) {
  this->type = NodeType::IDENTIFIER_OPTIONAL_UNPACKED_DIMENSIONS;
  this->setElement(element);
}

Function_item_list::Function_item_list(std::string element) {
  this->type = NodeType::FUNCTION_ITEM_LIST;
  this->setElement(element);
}

Type_declaration::Type_declaration(std::string element) {
  this->type = NodeType::TYPE_DECLARATION;
  this->setElement(element);
}

Udp_body::Udp_body(std::string element) {
  this->type = NodeType::UDP_BODY;
  this->setElement(element);
}

Mul_expr::Mul_expr(std::string element) {
  this->type = NodeType::MUL_EXPR;
  this->setElement(element);
}

Par_block::Par_block(std::string element) {
  this->type = NodeType::PAR_BLOCK;
  this->setElement(element);
}

Keywordidentifier::Keywordidentifier(std::string element) {
  this->type = NodeType::KEYWORDIDENTIFIER;
  this->setElement(element);
}

Logeq_expr::Logeq_expr(std::string element) {
  this->type = NodeType::LOGEQ_EXPR;
  this->setElement(element);
}

Module_common_item::Module_common_item(std::string element) {
  this->type = NodeType::MODULE_COMMON_ITEM;
  this->setElement(element);
}

Primitive_gate_instance::Primitive_gate_instance(std::string element) {
  this->type = NodeType::PRIMITIVE_GATE_INSTANCE;
  this->setElement(element);
}

Data_type_or_implicit::Data_type_or_implicit(std::string element) {
  this->type = NodeType::DATA_TYPE_OR_IMPLICIT;
  this->setElement(element);
}

Tk_octbase::Tk_octbase(std::string element) {
  this->type = NodeType::TK_OCTBASE;
  this->setElement(element);
}

Sequence_expr::Sequence_expr(std::string element) {
  this->type = NodeType::SEQUENCE_EXPR;
  this->setElement(element);
}

Tk_hexbase::Tk_hexbase(std::string element) {
  this->type = NodeType::TK_HEXBASE;
  this->setElement(element);
}

Property_expr::Property_expr(std::string element) {
  this->type = NodeType::PROPERTY_EXPR;
  this->setElement(element);
}

Seq_block::Seq_block(std::string element) {
  this->type = NodeType::SEQ_BLOCK;
  this->setElement(element);
}

Task_item::Task_item(std::string element) {
  this->type = NodeType::TASK_ITEM;
  this->setElement(element);
}

Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt::
    Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt(
        std::string element) {
  this->type =
      NodeType::DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT;
  this->setElement(element);
}

Specify_block::Specify_block(std::string element) {
  this->type = NodeType::SPECIFY_BLOCK;
  this->setElement(element);
}

Tk_decnumber::Tk_decnumber(std::string element) {
  this->type = NodeType::TK_DECNUMBER;
  this->setElement(element);
}

Tk_decbase::Tk_decbase(std::string element) {
  this->type = NodeType::TK_DECBASE;
  this->setElement(element);
}

Property_implication_expr::Property_implication_expr(std::string element) {
  this->type = NodeType::PROPERTY_IMPLICATION_EXPR;
  this->setElement(element);
}

Bit_logic_opt::Bit_logic_opt(std::string element) {
  this->type = NodeType::BIT_LOGIC_OPT;
  this->setElement(element);
}

Integer_atom_type::Integer_atom_type(std::string element) {
  this->type = NodeType::INTEGER_ATOM_TYPE;
  this->setElement(element);
}

Lifetime::Lifetime(std::string element) {
  this->type = NodeType::LIFETIME;
  this->setElement(element);
}

Any_argument_list::Any_argument_list(std::string element) {
  this->type = NodeType::ANY_ARGUMENT_LIST;
  this->setElement(element);
}

Delay_value_list::Delay_value_list(std::string element) {
  this->type = NodeType::DELAY_VALUE_LIST;
  this->setElement(element);
}

Module_port_declaration::Module_port_declaration(std::string element) {
  this->type = NodeType::MODULE_PORT_DECLARATION;
  this->setElement(element);
}

Jump_statement::Jump_statement(std::string element) {
  this->type = NodeType::JUMP_STATEMENT;
  this->setElement(element);
}

Delay_value::Delay_value(std::string element) {
  this->type = NodeType::DELAY_VALUE;
  this->setElement(element);
}

Sequence_or_expr::Sequence_or_expr(std::string element) {
  this->type = NodeType::SEQUENCE_OR_EXPR;
  this->setElement(element);
}

Module_attribute_foreign_opt::Module_attribute_foreign_opt(
    std::string element) {
  this->type = NodeType::MODULE_ATTRIBUTE_FOREIGN_OPT;
  this->setElement(element);
}

Tf_port_direction_opt::Tf_port_direction_opt(std::string element) {
  this->type = NodeType::TF_PORT_DIRECTION_OPT;
  this->setElement(element);
}

Tf_port_item_expr_opt::Tf_port_item_expr_opt(std::string element) {
  this->type = NodeType::TF_PORT_ITEM_EXPR_OPT;
  this->setElement(element);
}

Cont_assign_list::Cont_assign_list(std::string element) {
  this->type = NodeType::CONT_ASSIGN_LIST;
  this->setElement(element);
}

Any_argument_list_trailing_comma::Any_argument_list_trailing_comma(
    std::string element) {
  this->type = NodeType::ANY_ARGUMENT_LIST_TRAILING_COMMA;
  this->setElement(element);
}

Procedural_continuous_assignment::Procedural_continuous_assignment(
    std::string element) {
  this->type = NodeType::PROCEDURAL_CONTINUOUS_ASSIGNMENT;
  this->setElement(element);
}

Expression_or_dist::Expression_or_dist(std::string element) {
  this->type = NodeType::EXPRESSION_OR_DIST;
  this->setElement(element);
}

Module_start::Module_start(std::string element) {
  this->type = NodeType::MODULE_START;
  this->setElement(element);
}

Expr_primary_parens::Expr_primary_parens(std::string element) {
  this->type = NodeType::EXPR_PRIMARY_PARENS;
  this->setElement(element);
}

Open_range_list::Open_range_list(std::string element) {
  this->type = NodeType::OPEN_RANGE_LIST;
  this->setElement(element);
}

Unary_prefix_expr::Unary_prefix_expr(std::string element) {
  this->type = NodeType::UNARY_PREFIX_EXPR;
  this->setElement(element);
}

Delay_identifier::Delay_identifier(std::string element) {
  this->type = NodeType::DELAY_IDENTIFIER;
  this->setElement(element);
}

List_of_identifiers_unpacked_dimensions::
    List_of_identifiers_unpacked_dimensions(std::string element) {
  this->type = NodeType::LIST_OF_IDENTIFIERS_UNPACKED_DIMENSIONS;
  this->setElement(element);
}

Delay_scope::Delay_scope(std::string element) {
  this->type = NodeType::DELAY_SCOPE;
  this->setElement(element);
}

Action_block::Action_block(std::string element) {
  this->type = NodeType::ACTION_BLOCK;
  this->setElement(element);
}

Trailing_assign_opt::Trailing_assign_opt(std::string element) {
  this->type = NodeType::TRAILING_ASSIGN_OPT;
  this->setElement(element);
}

Class_item::Class_item(std::string element) {
  this->type = NodeType::CLASS_ITEM;
  this->setElement(element);
}

Enum_name_list_trailing_comma::Enum_name_list_trailing_comma(
    std::string element) {
  this->type = NodeType::ENUM_NAME_LIST_TRAILING_COMMA;
  this->setElement(element);
}

Udp_port_list::Udp_port_list(std::string element) {
  this->type = NodeType::UDP_PORT_LIST;
  this->setElement(element);
}

Equiv_impl_expr::Equiv_impl_expr(std::string element) {
  this->type = NodeType::EQUIV_IMPL_EXPR;
  this->setElement(element);
}

Class_new::Class_new(std::string element) {
  this->type = NodeType::CLASS_NEW;
  this->setElement(element);
}

Port_net_type::Port_net_type(std::string element) {
  this->type = NodeType::PORT_NET_TYPE;
  this->setElement(element);
}

Unqualified_id::Unqualified_id(std::string element) {
  this->type = NodeType::UNQUALIFIED_ID;
  this->setElement(element);
}

Begin::Begin(std::string element) {
  this->type = NodeType::BEGIN;
  this->setElement(element);
}

System_tf_call::System_tf_call(std::string element) {
  this->type = NodeType::SYSTEM_TF_CALL;
  this->setElement(element);
}

Parameter_value_byname_list_item_last::Parameter_value_byname_list_item_last(
    std::string element) {
  this->type = NodeType::PARAMETER_VALUE_BYNAME_LIST_ITEM_LAST;
  this->setElement(element);
}

Conditional_generate_construct::Conditional_generate_construct(
    std::string element) {
  this->type = NodeType::CONDITIONAL_GENERATE_CONSTRUCT;
  this->setElement(element);
}

Timescale_directive::Timescale_directive(std::string element) {
  this->type = NodeType::TIMESCALE_DIRECTIVE;
  this->setElement(element);
}

Port_expression::Port_expression(std::string element) {
  this->type = NodeType::PORT_EXPRESSION;
  this->setElement(element);
}

Udp_sequ_entry_list::Udp_sequ_entry_list(std::string element) {
  this->type = NodeType::UDP_SEQU_ENTRY_LIST;
  this->setElement(element);
}

Symbol_or_label::Symbol_or_label(std::string element) {
  this->type = NodeType::SYMBOL_OR_LABEL;
  this->setElement(element);
}

Simple_sequence_expr::Simple_sequence_expr(std::string element) {
  this->type = NodeType::SIMPLE_SEQUENCE_EXPR;
  this->setElement(element);
}

Systemtfidentifier::Systemtfidentifier(std::string element) {
  this->type = NodeType::SYSTEMTFIDENTIFIER;
  this->setElement(element);
}

Tk_unbasednumber::Tk_unbasednumber(std::string element) {
  this->type = NodeType::TK_UNBASEDNUMBER;
  this->setElement(element);
}

Decl_dimensions_opt::Decl_dimensions_opt(std::string element) {
  this->type = NodeType::DECL_DIMENSIONS_OPT;
  this->setElement(element);
}

Class_items_opt::Class_items_opt(std::string element) {
  this->type = NodeType::CLASS_ITEMS_OPT;
  this->setElement(element);
}

Enum_name::Enum_name(std::string element) {
  this->type = NodeType::ENUM_NAME;
  this->setElement(element);
}

Parameter_value_opt::Parameter_value_opt(std::string element) {
  this->type = NodeType::PARAMETER_VALUE_OPT;
  this->setElement(element);
}

Specify_edge_path::Specify_edge_path(std::string element) {
  this->type = NodeType::SPECIFY_EDGE_PATH;
  this->setElement(element);
}

Implicit_class_handle::Implicit_class_handle(std::string element) {
  this->type = NodeType::IMPLICIT_CLASS_HANDLE;
  this->setElement(element);
}

Module_item::Module_item(std::string element) {
  this->type = NodeType::MODULE_ITEM;
  this->setElement(element);
}

Statement_item::Statement_item(std::string element) {
  this->type = NodeType::STATEMENT_ITEM;
  this->setElement(element);
}

Type_identifier_followed_by_id::Type_identifier_followed_by_id(
    std::string element) {
  this->type = NodeType::TYPE_IDENTIFIER_FOLLOWED_BY_ID;
  this->setElement(element);
}

Method_prototype::Method_prototype(std::string element) {
  this->type = NodeType::METHOD_PROTOTYPE;
  this->setElement(element);
}

Tf_port_item::Tf_port_item(std::string element) {
  this->type = NodeType::TF_PORT_ITEM;
  this->setElement(element);
}

Block_item_or_statement_or_null_list::Block_item_or_statement_or_null_list(
    std::string element) {
  this->type = NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST;
  this->setElement(element);
}

Endnew_opt::Endnew_opt(std::string element) {
  this->type = NodeType::ENDNEW_OPT;
  this->setElement(element);
}

Specify_item_list_opt::Specify_item_list_opt(std::string element) {
  this->type = NodeType::SPECIFY_ITEM_LIST_OPT;
  this->setElement(element);
}

Specify_simple_path_decl::Specify_simple_path_decl(std::string element) {
  this->type = NodeType::SPECIFY_SIMPLE_PATH_DECL;
  this->setElement(element);
}

Tk_rs_eq::Tk_rs_eq(std::string element) {
  this->type = NodeType::TK_RS_EQ;
  this->setElement(element);
}

Package_import_item_list::Package_import_item_list(std::string element) {
  this->type = NodeType::PACKAGE_IMPORT_ITEM_LIST;
  this->setElement(element);
}

Udp_port_decl::Udp_port_decl(std::string element) {
  this->type = NodeType::UDP_PORT_DECL;
  this->setElement(element);
}

With_exprs_suffix::With_exprs_suffix(std::string element) {
  this->type = NodeType::WITH_EXPRS_SUFFIX;
  this->setElement(element);
}

Generate_region::Generate_region(std::string element) {
  this->type = NodeType::GENERATE_REGION;
  this->setElement(element);
}

Call_base::Call_base(std::string element) {
  this->type = NodeType::CALL_BASE;
  this->setElement(element);
}

Array_locator_method::Array_locator_method(std::string element) {
  this->type = NodeType::ARRAY_LOCATOR_METHOD;
  this->setElement(element);
}

Port_declaration_ansi::Port_declaration_ansi(std::string element) {
  this->type = NodeType::PORT_DECLARATION_ANSI;
  this->setElement(element);
}

Bitand_expr::Bitand_expr(std::string element) {
  this->type = NodeType::BITAND_EXPR;
  this->setElement(element);
}

Range_list_in_braces::Range_list_in_braces(std::string element) {
  this->type = NodeType::RANGE_LIST_IN_BRACES;
  this->setElement(element);
}

Module_parameter_port_list_item_last::Module_parameter_port_list_item_last(
    std::string element) {
  this->type = NodeType::MODULE_PARAMETER_PORT_LIST_ITEM_LAST;
  this->setElement(element);
}

Hex_based_number::Hex_based_number(std::string element) {
  this->type = NodeType::HEX_BASED_NUMBER;
  this->setElement(element);
}

Hierarchy_event_identifier::Hierarchy_event_identifier(std::string element) {
  this->type = NodeType::HIERARCHY_EVENT_IDENTIFIER;
  this->setElement(element);
}

List_of_variable_decl_assignments::List_of_variable_decl_assignments(
    std::string element) {
  this->type = NodeType::LIST_OF_VARIABLE_DECL_ASSIGNMENTS;
  this->setElement(element);
}

Random_qualifier_opt::Random_qualifier_opt(std::string element) {
  this->type = NodeType::RANDOM_QUALIFIER_OPT;
  this->setElement(element);
}

Drive_strength_opt::Drive_strength_opt(std::string element) {
  this->type = NodeType::DRIVE_STRENGTH_OPT;
  this->setElement(element);
}

Tk_timeliteral::Tk_timeliteral(std::string element) {
  this->type = NodeType::TK_TIMELITERAL;
  this->setElement(element);
}

Value_range::Value_range(std::string element) {
  this->type = NodeType::VALUE_RANGE;
  this->setElement(element);
}

Expr_mintypmax_generalized::Expr_mintypmax_generalized(std::string element) {
  this->type = NodeType::EXPR_MINTYPMAX_GENERALIZED;
  this->setElement(element);
}

Polarity_operator::Polarity_operator(std::string element) {
  this->type = NodeType::POLARITY_OPERATOR;
  this->setElement(element);
}

Package_item::Package_item(std::string element) {
  this->type = NodeType::PACKAGE_ITEM;
  this->setElement(element);
}

For_initialization::For_initialization(std::string element) {
  this->type = NodeType::FOR_INITIALIZATION;
  this->setElement(element);
}

Enum_data_type::Enum_data_type(std::string element) {
  this->type = NodeType::ENUM_DATA_TYPE;
  this->setElement(element);
}

Blocking_assignment::Blocking_assignment(std::string element) {
  this->type = NodeType::BLOCKING_ASSIGNMENT;
  this->setElement(element);
}

Delay1::Delay1(std::string element) {
  this->type = NodeType::DELAY1;
  this->setElement(element);
}

Based_number::Based_number(std::string element) {
  this->type = NodeType::BASED_NUMBER;
  this->setElement(element);
}

Procedural_timing_control_statement::Procedural_timing_control_statement(
    std::string element) {
  this->type = NodeType::PROCEDURAL_TIMING_CONTROL_STATEMENT;
  this->setElement(element);
}

Block_item_decl::Block_item_decl(std::string element) {
  this->type = NodeType::BLOCK_ITEM_DECL;
  this->setElement(element);
}

Net_variable_or_decl_assigns::Net_variable_or_decl_assigns(
    std::string element) {
  this->type = NodeType::NET_VARIABLE_OR_DECL_ASSIGNS;
  this->setElement(element);
}

Time_literal::Time_literal(std::string element) {
  this->type = NodeType::TIME_LITERAL;
  this->setElement(element);
}

Function_item_data_declaration::Function_item_data_declaration(
    std::string element) {
  this->type = NodeType::FUNCTION_ITEM_DATA_DECLARATION;
  this->setElement(element);
}

Decl_variable_dimension::Decl_variable_dimension(std::string element) {
  this->type = NodeType::DECL_VARIABLE_DIMENSION;
  this->setElement(element);
}

Tf_port_list_opt::Tf_port_list_opt(std::string element) {
  this->type = NodeType::TF_PORT_LIST_OPT;
  this->setElement(element);
}

Endfunction_label_opt::Endfunction_label_opt(std::string element) {
  this->type = NodeType::ENDFUNCTION_LABEL_OPT;
  this->setElement(element);
}

Qualified_id::Qualified_id(std::string element) {
  this->type = NodeType::QUALIFIED_ID;
  this->setElement(element);
}

Immediate_assertion_statement::Immediate_assertion_statement(
    std::string element) {
  this->type = NodeType::IMMEDIATE_ASSERTION_STATEMENT;
  this->setElement(element);
}

Join_keyword::Join_keyword(std::string element) {
  this->type = NodeType::JOIN_KEYWORD;
  this->setElement(element);
}

Tk_bindigits::Tk_bindigits(std::string element) {
  this->type = NodeType::TK_BINDIGITS;
  this->setElement(element);
}

Event_trigger::Event_trigger(std::string element) {
  this->type = NodeType::EVENT_TRIGGER;
  this->setElement(element);
}

Dynamic_array_new::Dynamic_array_new(std::string element) {
  this->type = NodeType::DYNAMIC_ARRAY_NEW;
  this->setElement(element);
}

Matches_expr::Matches_expr(std::string element) {
  this->type = NodeType::MATCHES_EXPR;
  this->setElement(element);
}

Port_reference_list::Port_reference_list(std::string element) {
  this->type = NodeType::PORT_REFERENCE_LIST;
  this->setElement(element);
}

Array_reduction_method::Array_reduction_method(std::string element) {
  this->type = NodeType::ARRAY_REDUCTION_METHOD;
  this->setElement(element);
}

Builtin_array_method::Builtin_array_method(std::string element) {
  this->type = NodeType::BUILTIN_ARRAY_METHOD;
  this->setElement(element);
}

Package_declaration::Package_declaration(std::string element) {
  this->type = NodeType::PACKAGE_DECLARATION;
  this->setElement(element);
}

Assignment_pattern_expression::Assignment_pattern_expression(
    std::string element) {
  this->type = NodeType::ASSIGNMENT_PATTERN_EXPRESSION;
  this->setElement(element);
}

Drive_strength::Drive_strength(std::string element) {
  this->type = NodeType::DRIVE_STRENGTH;
  this->setElement(element);
}

Port_declaration_non_ansi::Port_declaration_non_ansi(std::string element) {
  this->type = NodeType::PORT_DECLARATION_NON_ANSI;
  this->setElement(element);
}

Module_parameter_port_list::Module_parameter_port_list(std::string element) {
  this->type = NodeType::MODULE_PARAMETER_PORT_LIST;
  this->setElement(element);
}

Var_type::Var_type(std::string element) {
  this->type = NodeType::VAR_TYPE;
  this->setElement(element);
}

Parameter_opt::Parameter_opt(std::string element) {
  this->type = NodeType::PARAMETER_OPT;
  this->setElement(element);
}

Module_item_list::Module_item_list(std::string element) {
  this->type = NodeType::MODULE_ITEM_LIST;
  this->setElement(element);
}

Genericidentifier::Genericidentifier(std::string element) {
  this->type = NodeType::GENERICIDENTIFIER;
  this->setElement(element);
}

Package_item_list_opt::Package_item_list_opt(std::string element) {
  this->type = NodeType::PACKAGE_ITEM_LIST_OPT;
  this->setElement(element);
}

List_of_ports_or_port_declarations_item_last_ansi::
    List_of_ports_or_port_declarations_item_last_ansi(std::string element) {
  this->type = NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_ANSI;
  this->setElement(element);
}

Data_type_or_implicit_followed_by_id_and_dimensions_opt::
    Data_type_or_implicit_followed_by_id_and_dimensions_opt(
        std::string element) {
  this->type =
      NodeType::DATA_TYPE_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT;
  this->setElement(element);
}

Xor_expr::Xor_expr(std::string element) {
  this->type = NodeType::XOR_EXPR;
  this->setElement(element);
}

Dec_based_number::Dec_based_number(std::string element) {
  this->type = NodeType::DEC_BASED_NUMBER;
  this->setElement(element);
}

Loop_statement::Loop_statement(std::string element) {
  this->type = NodeType::LOOP_STATEMENT;
  this->setElement(element);
}

Data_declaration_or_module_instantiation::
    Data_declaration_or_module_instantiation(std::string element) {
  this->type = NodeType::DATA_DECLARATION_OR_MODULE_INSTANTIATION;
  this->setElement(element);
}

Udp_comb_entry_list::Udp_comb_entry_list(std::string element) {
  this->type = NodeType::UDP_COMB_ENTRY_LIST;
  this->setElement(element);
}

Bit_logic::Bit_logic(std::string element) {
  this->type = NodeType::BIT_LOGIC;
  this->setElement(element);
}

Reference_or_call::Reference_or_call(std::string element) {
  this->type = NodeType::REFERENCE_OR_CALL;
  this->setElement(element);
}

Local_root::Local_root(std::string element) {
  this->type = NodeType::LOCAL_ROOT;
  this->setElement(element);
}

Port_direction::Port_direction(std::string element) {
  this->type = NodeType::PORT_DIRECTION;
  this->setElement(element);
}

Variable_decl_assignment::Variable_decl_assignment(std::string element) {
  this->type = NodeType::VARIABLE_DECL_ASSIGNMENT;
  this->setElement(element);
}

Specify_edge_path_decl::Specify_edge_path_decl(std::string element) {
  this->type = NodeType::SPECIFY_EDGE_PATH_DECL;
  this->setElement(element);
}

Function_prototype::Function_prototype(std::string element) {
  this->type = NodeType::FUNCTION_PROTOTYPE;
  this->setElement(element);
}

Sequence_within_expr::Sequence_within_expr(std::string element) {
  this->type = NodeType::SEQUENCE_WITHIN_EXPR;
  this->setElement(element);
}

Expr_primary_no_groups::Expr_primary_no_groups(std::string element) {
  this->type = NodeType::EXPR_PRIMARY_NO_GROUPS;
  this->setElement(element);
}

Parameter_value_byname::Parameter_value_byname(std::string element) {
  this->type = NodeType::PARAMETER_VALUE_BYNAME;
  this->setElement(element);
}

Case_any::Case_any(std::string element) {
  this->type = NodeType::CASE_ANY;
  this->setElement(element);
}

Spec_notifier::Spec_notifier(std::string element) {
  this->type = NodeType::SPEC_NOTIFIER;
  this->setElement(element);
}

Block_item_or_statement_or_null::Block_item_or_statement_or_null(
    std::string element) {
  this->type = NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL;
  this->setElement(element);
}

Specify_item::Specify_item(std::string element) {
  this->type = NodeType::SPECIFY_ITEM;
  this->setElement(element);
}

Any_param_declaration::Any_param_declaration(std::string element) {
  this->type = NodeType::ANY_PARAM_DECLARATION;
  this->setElement(element);
}

Tf_port_list_trailing_comma::Tf_port_list_trailing_comma(std::string element) {
  this->type = NodeType::TF_PORT_LIST_TRAILING_COMMA;
  this->setElement(element);
}

Struct_union_member::Struct_union_member(std::string element) {
  this->type = NodeType::STRUCT_UNION_MEMBER;
  this->setElement(element);
}

Any_port_list_positional::Any_port_list_positional(std::string element) {
  this->type = NodeType::ANY_PORT_LIST_POSITIONAL;
  this->setElement(element);
}

Dir::Dir(std::string element) {
  this->type = NodeType::DIR;
  this->setElement(element);
}

Lifetime_opt::Lifetime_opt(std::string element) {
  this->type = NodeType::LIFETIME_OPT;
  this->setElement(element);
}

List_of_identifiers::List_of_identifiers(std::string element) {
  this->type = NodeType::LIST_OF_IDENTIFIERS;
  this->setElement(element);
}

Edge_operator::Edge_operator(std::string element) {
  this->type = NodeType::EDGE_OPERATOR;
  this->setElement(element);
}

Tk_virtual_opt::Tk_virtual_opt(std::string element) {
  this->type = NodeType::TK_VIRTUAL_OPT;
  this->setElement(element);
}

Timeunits_declaration::Timeunits_declaration(std::string element) {
  this->type = NodeType::TIMEUNITS_DECLARATION;
  this->setElement(element);
}

Tf_item_or_statement_or_null::Tf_item_or_statement_or_null(
    std::string element) {
  this->type = NodeType::TF_ITEM_OR_STATEMENT_OR_NULL;
  this->setElement(element);
}

Package_import_list::Package_import_list(std::string element) {
  this->type = NodeType::PACKAGE_IMPORT_LIST;
  this->setElement(element);
}

Expr_primary::Expr_primary(std::string element) {
  this->type = NodeType::EXPR_PRIMARY;
  this->setElement(element);
}

Signed_unsigned_opt::Signed_unsigned_opt(std::string element) {
  this->type = NodeType::SIGNED_UNSIGNED_OPT;
  this->setElement(element);
}

Non_anonymous_gate_instance_or_register_variable_list::
    Non_anonymous_gate_instance_or_register_variable_list(std::string element) {
  this->type = NodeType::NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST;
  this->setElement(element);
}

Udp_comb_entry::Udp_comb_entry(std::string element) {
  this->type = NodeType::UDP_COMB_ENTRY;
  this->setElement(element);
}

Delay3::Delay3(std::string element) {
  this->type = NodeType::DELAY3;
  this->setElement(element);
}

Inc_or_dec_or_primary_expr::Inc_or_dec_or_primary_expr(std::string element) {
  this->type = NodeType::INC_OR_DEC_OR_PRIMARY_EXPR;
  this->setElement(element);
}

Procedural_assertion_statement::Procedural_assertion_statement(
    std::string element) {
  this->type = NodeType::PROCEDURAL_ASSERTION_STATEMENT;
  this->setElement(element);
}

Struct_union_member_list::Struct_union_member_list(std::string element) {
  this->type = NodeType::STRUCT_UNION_MEMBER_LIST;
  this->setElement(element);
}

Comp_expr::Comp_expr(std::string element) {
  this->type = NodeType::COMP_EXPR;
  this->setElement(element);
}

Postfix_expression::Postfix_expression(std::string element) {
  this->type = NodeType::POSTFIX_EXPRESSION;
  this->setElement(element);
}

Symbolidentifier::Symbolidentifier(std::string element) {
  this->type = NodeType::SYMBOLIDENTIFIER;
  this->setElement(element);
}

Udp_input_sym::Udp_input_sym(std::string element) {
  this->type = NodeType::UDP_INPUT_SYM;
  this->setElement(element);
}

Pos_neg_number::Pos_neg_number(std::string element) {
  this->type = NodeType::POS_NEG_NUMBER;
  this->setElement(element);
}

Specify_terminal_descriptor::Specify_terminal_descriptor(std::string element) {
  this->type = NodeType::SPECIFY_TERMINAL_DESCRIPTOR;
  this->setElement(element);
}

Select_variable_dimension::Select_variable_dimension(std::string element) {
  this->type = NodeType::SELECT_VARIABLE_DIMENSION;
  this->setElement(element);
}

List_of_ports_or_port_declarations_ansi::
    List_of_ports_or_port_declarations_ansi(std::string element) {
  this->type = NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ANSI;
  this->setElement(element);
}

Generate_case_items::Generate_case_items(std::string element) {
  this->type = NodeType::GENERATE_CASE_ITEMS;
  this->setElement(element);
}

Data_type_primitive_scalar::Data_type_primitive_scalar(std::string element) {
  this->type = NodeType::DATA_TYPE_PRIMITIVE_SCALAR;
  this->setElement(element);
}

Tf_item_or_statement_or_null_list::Tf_item_or_statement_or_null_list(
    std::string element) {
  this->type = NodeType::TF_ITEM_OR_STATEMENT_OR_NULL_LIST;
  this->setElement(element);
}

Conditional_statement::Conditional_statement(std::string element) {
  this->type = NodeType::CONDITIONAL_STATEMENT;
  this->setElement(element);
}

Specparam_decl::Specparam_decl(std::string element) {
  this->type = NodeType::SPECPARAM_DECL;
  this->setElement(element);
}

List_of_ports_or_port_declarations_non_ansi::
    List_of_ports_or_port_declarations_non_ansi(std::string element) {
  this->type = NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_NON_ANSI;
  this->setElement(element);
}

Statement_or_null_list::Statement_or_null_list(std::string element) {
  this->type = NodeType::STATEMENT_OR_NULL_LIST;
  this->setElement(element);
}

Task_declaration::Task_declaration(std::string element) {
  this->type = NodeType::TASK_DECLARATION;
  this->setElement(element);
}

Data_declaration_base::Data_declaration_base(std::string element) {
  this->type = NodeType::DATA_DECLARATION_BASE;
  this->setElement(element);
}

Any_port_list_opt::Any_port_list_opt(std::string element) {
  this->type = NodeType::ANY_PORT_LIST_OPT;
  this->setElement(element);
}

Macronumericwidth::Macronumericwidth(std::string element) {
  this->type = NodeType::MACRONUMERICWIDTH;
  this->setElement(element);
}

Trailing_decl_assignment_opt::Trailing_decl_assignment_opt(
    std::string element) {
  this->type = NodeType::TRAILING_DECL_ASSIGNMENT_OPT;
  this->setElement(element);
}

Gate_instance_or_register_variable::Gate_instance_or_register_variable(
    std::string element) {
  this->type = NodeType::GATE_INSTANCE_OR_REGISTER_VARIABLE;
  this->setElement(element);
}

Bind_instantiation::Bind_instantiation(std::string element) {
  this->type = NodeType::BIND_INSTANTIATION;
  this->setElement(element);
}

Package_import_declaration::Package_import_declaration(std::string element) {
  this->type = NodeType::PACKAGE_IMPORT_DECLARATION;
  this->setElement(element);
}

Module_package_import_list_opt::Module_package_import_list_opt(
    std::string element) {
  this->type = NodeType::MODULE_PACKAGE_IMPORT_LIST_OPT;
  this->setElement(element);
}

Structure_or_array_pattern_expression_list::
    Structure_or_array_pattern_expression_list(std::string element) {
  this->type = NodeType::STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION_LIST;
  this->setElement(element);
}

Event_expression_list::Event_expression_list(std::string element) {
  this->type = NodeType::EVENT_EXPRESSION_LIST;
  this->setElement(element);
}

Tk_rss_eq::Tk_rss_eq(std::string element) {
  this->type = NodeType::TK_RSS_EQ;
  this->setElement(element);
}

Implements_interface_list_opt::Implements_interface_list_opt(
    std::string element) {
  this->type = NodeType::IMPLEMENTS_INTERFACE_LIST_OPT;
  this->setElement(element);
}

Delay3_opt::Delay3_opt(std::string element) {
  this->type = NodeType::DELAY3_OPT;
  this->setElement(element);
}

Expr_mintypmax_trans_set::Expr_mintypmax_trans_set(std::string element) {
  this->type = NodeType::EXPR_MINTYPMAX_TRANS_SET;
  this->setElement(element);
}

Statement_or_null::Statement_or_null(std::string element) {
  this->type = NodeType::STATEMENT_OR_NULL;
  this->setElement(element);
}

Enum_name_list::Enum_name_list(std::string element) {
  this->type = NodeType::ENUM_NAME_LIST;
  this->setElement(element);
}

Sequence_unary_expr::Sequence_unary_expr(std::string element) {
  this->type = NodeType::SEQUENCE_UNARY_EXPR;
  this->setElement(element);
}

Pp_identifier::Pp_identifier(std::string element) {
  this->type = NodeType::PP_IDENTIFIER;
  this->setElement(element);
}

Shift_expr::Shift_expr(std::string element) {
  this->type = NodeType::SHIFT_EXPR;
  this->setElement(element);
}

Oct_based_number::Oct_based_number(std::string element) {
  this->type = NodeType::OCT_BASED_NUMBER;
  this->setElement(element);
}

Hierarchy_segment::Hierarchy_segment(std::string element) {
  this->type = NodeType::HIERARCHY_SEGMENT;
  this->setElement(element);
}

Nonblocking_assignment::Nonblocking_assignment(std::string element) {
  this->type = NodeType::NONBLOCKING_ASSIGNMENT;
  this->setElement(element);
}

Expression_list_proper::Expression_list_proper(std::string element) {
  this->type = NodeType::EXPRESSION_LIST_PROPER;
  this->setElement(element);
}

Generate_if::Generate_if(std::string element) {
  this->type = NodeType::GENERATE_IF;
  this->setElement(element);
}

Function_item::Function_item(std::string element) {
  this->type = NodeType::FUNCTION_ITEM;
  this->setElement(element);
}

Scope_prefix::Scope_prefix(std::string element) {
  this->type = NodeType::SCOPE_PREFIX;
  this->setElement(element);
}

Primitive_gate_instance_list::Primitive_gate_instance_list(
    std::string element) {
  this->type = NodeType::PRIMITIVE_GATE_INSTANCE_LIST;
  this->setElement(element);
}

Simple_immediate_assertion_statement::Simple_immediate_assertion_statement(
    std::string element) {
  this->type = NodeType::SIMPLE_IMMEDIATE_ASSERTION_STATEMENT;
  this->setElement(element);
}

Description_list::Description_list(std::string element) {
  this->type = NodeType::DESCRIPTION_LIST;
  this->setElement(element);
}

Dr_strength0::Dr_strength0(std::string element) {
  this->type = NodeType::DR_STRENGTH0;
  this->setElement(element);
}

Unique_priority_opt::Unique_priority_opt(std::string element) {
  this->type = NodeType::UNIQUE_PRIORITY_OPT;
  this->setElement(element);
}

Specparam::Specparam(std::string element) {
  this->type = NodeType::SPECPARAM;
  this->setElement(element);
}

Port_expression_opt::Port_expression_opt(std::string element) {
  this->type = NodeType::PORT_EXPRESSION_OPT;
  this->setElement(element);
}

Cond_expr::Cond_expr(std::string element) {
  this->type = NodeType::COND_EXPR;
  this->setElement(element);
}

Tk_reg_opt::Tk_reg_opt(std::string element) {
  this->type = NodeType::TK_REG_OPT;
  this->setElement(element);
}

Logor_expr::Logor_expr(std::string element) {
  this->type = NodeType::LOGOR_EXPR;
  this->setElement(element);
}

Delay3_or_drive_opt::Delay3_or_drive_opt(std::string element) {
  this->type = NodeType::DELAY3_OR_DRIVE_OPT;
  this->setElement(element);
}

Tf_item_or_statement_or_null_list_opt::Tf_item_or_statement_or_null_list_opt(
    std::string element) {
  this->type = NodeType::TF_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT;
  this->setElement(element);
}

Net_decl_assign::Net_decl_assign(std::string element) {
  this->type = NodeType::NET_DECL_ASSIGN;
  this->setElement(element);
}

Always_any::Always_any(std::string element) {
  this->type = NodeType::ALWAYS_ANY;
  this->setElement(element);
}

List_of_tf_variable_identifiers::List_of_tf_variable_identifiers(
    std::string element) {
  this->type = NodeType::LIST_OF_TF_VARIABLE_IDENTIFIERS;
  this->setElement(element);
}

Var_or_net_type_opt::Var_or_net_type_opt(std::string element) {
  this->type = NodeType::VAR_OR_NET_TYPE_OPT;
  this->setElement(element);
}

Tf_port_list_item_last::Tf_port_list_item_last(std::string element) {
  this->type = NodeType::TF_PORT_LIST_ITEM_LAST;
  this->setElement(element);
}

Task_declaration_id::Task_declaration_id(std::string element) {
  this->type = NodeType::TASK_DECLARATION_ID;
  this->setElement(element);
}

Instantiation_base::Instantiation_base(std::string element) {
  this->type = NodeType::INSTANTIATION_BASE;
  this->setElement(element);
}

Sequence_repetition_expr::Sequence_repetition_expr(std::string element) {
  this->type = NodeType::SEQUENCE_REPETITION_EXPR;
  this->setElement(element);
}

Tk_hexdigits::Tk_hexdigits(std::string element) {
  this->type = NodeType::TK_HEXDIGITS;
  this->setElement(element);
}

Non_anonymous_gate_instance_or_register_variable::
    Non_anonymous_gate_instance_or_register_variable(std::string element) {
  this->type = NodeType::NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE;
  this->setElement(element);
}

Localparam_assign::Localparam_assign(std::string element) {
  this->type = NodeType::LOCALPARAM_ASSIGN;
  this->setElement(element);
}

Class_items::Class_items(std::string element) {
  this->type = NodeType::CLASS_ITEMS;
  this->setElement(element);
}

Expression_in_parens::Expression_in_parens(std::string element) {
  this->type = NodeType::EXPRESSION_IN_PARENS;
  this->setElement(element);
}

List_of_ports_or_port_declarations_trailing_comma_ansi::
    List_of_ports_or_port_declarations_trailing_comma_ansi(
        std::string element) {
  this->type = NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_ANSI;
  this->setElement(element);
}

Port_reference::Port_reference(std::string element) {
  this->type = NodeType::PORT_REFERENCE;
  this->setElement(element);
}

Dist_opt::Dist_opt(std::string element) {
  this->type = NodeType::DIST_OPT;
  this->setElement(element);
}

Caseeq_expr::Caseeq_expr(std::string element) {
  this->type = NodeType::CASEEQ_EXPR;
  this->setElement(element);
}

Generate_block::Generate_block(std::string element) {
  this->type = NodeType::GENERATE_BLOCK;
  this->setElement(element);
}

List_of_ports_or_port_declarations_item_last_non_ansi::
    List_of_ports_or_port_declarations_item_last_non_ansi(std::string element) {
  this->type = NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_NON_ANSI;
  this->setElement(element);
}

Any_argument_list_item_last::Any_argument_list_item_last(std::string element) {
  this->type = NodeType::ANY_ARGUMENT_LIST_ITEM_LAST;
  this->setElement(element);
}

Gate_instantiation::Gate_instantiation(std::string element) {
  this->type = NodeType::GATE_INSTANTIATION;
  this->setElement(element);
}

Casting_type::Casting_type(std::string element) {
  this->type = NodeType::CASTING_TYPE;
  this->setElement(element);
}

Expr_mintypmax::Expr_mintypmax(std::string element) {
  this->type = NodeType::EXPR_MINTYPMAX;
  this->setElement(element);
}

Continuous_assign::Continuous_assign(std::string element) {
  this->type = NodeType::CONTINUOUS_ASSIGN;
  this->setElement(element);
}

Parameter_assign::Parameter_assign(std::string element) {
  this->type = NodeType::PARAMETER_ASSIGN;
  this->setElement(element);
}

Delay_value_simple::Delay_value_simple(std::string element) {
  this->type = NodeType::DELAY_VALUE_SIMPLE;
  this->setElement(element);
}

Switchtype::Switchtype(std::string element) {
  this->type = NodeType::SWITCHTYPE;
  this->setElement(element);
}

Package_or_generate_item_declaration::Package_or_generate_item_declaration(
    std::string element) {
  this->type = NodeType::PACKAGE_OR_GENERATE_ITEM_DECLARATION;
  this->setElement(element);
}

Bin_based_number::Bin_based_number(std::string element) {
  this->type = NodeType::BIN_BASED_NUMBER;
  this->setElement(element);
}

Loop_generate_construct::Loop_generate_construct(std::string element) {
  this->type = NodeType::LOOP_GENERATE_CONSTRUCT;
  this->setElement(element);
}

Parameter_override::Parameter_override(std::string element) {
  this->type = NodeType::PARAMETER_OVERRIDE;
  this->setElement(element);
}

Udp_primitive::Udp_primitive(std::string element) {
  this->type = NodeType::UDP_PRIMITIVE;
  this->setElement(element);
}

Parameter_expr::Parameter_expr(std::string element) {
  this->type = NodeType::PARAMETER_EXPR;
  this->setElement(element);
}

Repeat_control::Repeat_control(std::string element) {
  this->type = NodeType::REPEAT_CONTROL;
  this->setElement(element);
}

Packed_signing_opt::Packed_signing_opt(std::string element) {
  this->type = NodeType::PACKED_SIGNING_OPT;
  this->setElement(element);
}

Expression_or_null_list_opt::Expression_or_null_list_opt(std::string element) {
  this->type = NodeType::EXPRESSION_OR_NULL_LIST_OPT;
  this->setElement(element);
}

Enum_name_list_item_last::Enum_name_list_item_last(std::string element) {
  this->type = NodeType::ENUM_NAME_LIST_ITEM_LAST;
  this->setElement(element);
}

Macro_formals_list_opt::Macro_formals_list_opt(std::string element) {
  this->type = NodeType::MACRO_FORMALS_LIST_OPT;
  this->setElement(element);
}

Spec_notifier_opt::Spec_notifier_opt(std::string element) {
  this->type = NodeType::SPEC_NOTIFIER_OPT;
  this->setElement(element);
}

Hierarchy_extension::Hierarchy_extension(std::string element) {
  this->type = NodeType::HIERARCHY_EXTENSION;
  this->setElement(element);
}

Generate_item_list::Generate_item_list(std::string element) {
  this->type = NodeType::GENERATE_ITEM_LIST;
  this->setElement(element);
}

Data_declaration_modifiers_opt::Data_declaration_modifiers_opt(
    std::string element) {
  this->type = NodeType::DATA_DECLARATION_MODIFIERS_OPT;
  this->setElement(element);
}

Sequence_throughout_expr::Sequence_throughout_expr(std::string element) {
  this->type = NodeType::SEQUENCE_THROUGHOUT_EXPR;
  this->setElement(element);
}

Property_expr_or_assignment_list::Property_expr_or_assignment_list(
    std::string element) {
  this->type = NodeType::PROPERTY_EXPR_OR_ASSIGNMENT_LIST;
  this->setElement(element);
}

Bitor_expr::Bitor_expr(std::string element) {
  this->type = NodeType::BITOR_EXPR;
  this->setElement(element);
}

Tf_port_list::Tf_port_list(std::string element) {
  this->type = NodeType::TF_PORT_LIST;
  this->setElement(element);
}

Any_port_list_trailing_comma_named::Any_port_list_trailing_comma_named(
    std::string element) {
  this->type = NodeType::ANY_PORT_LIST_TRAILING_COMMA_NAMED;
  this->setElement(element);
}

Function_return_type_and_id::Function_return_type_and_id(std::string element) {
  this->type = NodeType::FUNCTION_RETURN_TYPE_AND_ID;
  this->setElement(element);
}

Statement::Statement(std::string element) {
  this->type = NodeType::STATEMENT;
  this->setElement(element);
}

Dr_strength1::Dr_strength1(std::string element) {
  this->type = NodeType::DR_STRENGTH1;
  this->setElement(element);
}

Assign_modify_statement::Assign_modify_statement(std::string element) {
  this->type = NodeType::ASSIGN_MODIFY_STATEMENT;
  this->setElement(element);
}

Udp_port_decls::Udp_port_decls(std::string element) {
  this->type = NodeType::UDP_PORT_DECLS;
  this->setElement(element);
}

Integer_vector_type::Integer_vector_type(std::string element) {
  this->type = NodeType::INTEGER_VECTOR_TYPE;
  this->setElement(element);
}

Assignment_pattern::Assignment_pattern(std::string element) {
  this->type = NodeType::ASSIGNMENT_PATTERN;
  this->setElement(element);
}

Class_constructor::Class_constructor(std::string element) {
  this->type = NodeType::CLASS_CONSTRUCTOR;
  this->setElement(element);
}

Module_parameter_port::Module_parameter_port(std::string element) {
  this->type = NodeType::MODULE_PARAMETER_PORT;
  this->setElement(element);
}

Module_or_generate_item_declaration::Module_or_generate_item_declaration(
    std::string element) {
  this->type = NodeType::MODULE_OR_GENERATE_ITEM_DECLARATION;
  this->setElement(element);
}

Final_construct::Final_construct(std::string element) {
  this->type = NodeType::FINAL_CONSTRUCT;
  this->setElement(element);
}

Member_name::Member_name(std::string element) {
  this->type = NodeType::MEMBER_NAME;
  this->setElement(element);
}

Class_declaration::Class_declaration(std::string element) {
  this->type = NodeType::CLASS_DECLARATION;
  this->setElement(element);
}

Package_import_item::Package_import_item(std::string element) {
  this->type = NodeType::PACKAGE_IMPORT_ITEM;
  this->setElement(element);
}

Signing::Signing(std::string element) {
  this->type = NodeType::SIGNING;
  this->setElement(element);
}

Class_constructor_prototype::Class_constructor_prototype(std::string element) {
  this->type = NodeType::CLASS_CONSTRUCTOR_PROTOTYPE;
  this->setElement(element);
}

Generate_case_item::Generate_case_item(std::string element) {
  this->type = NodeType::GENERATE_CASE_ITEM;
  this->setElement(element);
}

Data_declaration::Data_declaration(std::string element) {
  this->type = NodeType::DATA_DECLARATION;
  this->setElement(element);
}

Expression::Expression(std::string element) {
  this->type = NodeType::EXPRESSION;
  this->setElement(element);
}

Cont_assign::Cont_assign(std::string element) {
  this->type = NodeType::CONT_ASSIGN;
  this->setElement(element);
}

Delay_or_event_control_opt::Delay_or_event_control_opt(std::string element) {
  this->type = NodeType::DELAY_OR_EVENT_CONTROL_OPT;
  this->setElement(element);
}

Bind_directive::Bind_directive(std::string element) {
  this->type = NodeType::BIND_DIRECTIVE;
  this->setElement(element);
}

Misc_directive::Misc_directive(std::string element) {
  this->type = NodeType::MISC_DIRECTIVE;
  this->setElement(element);
}

Udp_initial_expr_opt::Udp_initial_expr_opt(std::string element) {
  this->type = NodeType::UDP_INITIAL_EXPR_OPT;
  this->setElement(element);
}

Description::Description(std::string element) {
  this->type = NodeType::DESCRIPTION;
  this->setElement(element);
}

Data_type_base::Data_type_base(std::string element) {
  this->type = NodeType::DATA_TYPE_BASE;
  this->setElement(element);
}

Trailing_assign::Trailing_assign(std::string element) {
  this->type = NodeType::TRAILING_ASSIGN;
  this->setElement(element);
}

Module_end::Module_end(std::string element) {
  this->type = NodeType::MODULE_END;
  this->setElement(element);
}

Wait_statement::Wait_statement(std::string element) {
  this->type = NodeType::WAIT_STATEMENT;
  this->setElement(element);
}

Package_item_list::Package_item_list(std::string element) {
  this->type = NodeType::PACKAGE_ITEM_LIST;
  this->setElement(element);
}

Case_items::Case_items(std::string element) {
  this->type = NodeType::CASE_ITEMS;
  this->setElement(element);
}

Statement_or_null_list_opt::Statement_or_null_list_opt(std::string element) {
  this->type = NodeType::STATEMENT_OR_NULL_LIST_OPT;
  this->setElement(element);
}

Port_named::Port_named(std::string element) {
  this->type = NodeType::PORT_NAMED;
  this->setElement(element);
}

Udp_output_sym::Udp_output_sym(std::string element) {
  this->type = NodeType::UDP_OUTPUT_SYM;
  this->setElement(element);
}

Assignment_statement_no_expr::Assignment_statement_no_expr(
    std::string element) {
  this->type = NodeType::ASSIGNMENT_STATEMENT_NO_EXPR;
  this->setElement(element);
}

Any_port_list_item_last_positional::Any_port_list_item_last_positional(
    std::string element) {
  this->type = NodeType::ANY_PORT_LIST_ITEM_LAST_POSITIONAL;
  this->setElement(element);
}

Module_item_list_opt::Module_item_list_opt(std::string element) {
  this->type = NodeType::MODULE_ITEM_LIST_OPT;
  this->setElement(element);
}

Sequence_and_expr::Sequence_and_expr(std::string element) {
  this->type = NodeType::SEQUENCE_AND_EXPR;
  this->setElement(element);
}

Data_type::Data_type(std::string element) {
  this->type = NodeType::DATA_TYPE;
  this->setElement(element);
}

Argument_list_opt::Argument_list_opt(std::string element) {
  this->type = NodeType::ARGUMENT_LIST_OPT;
  this->setElement(element);
}

For_step_opt::For_step_opt(std::string element) {
  this->type = NodeType::FOR_STEP_OPT;
  this->setElement(element);
}

Sequence_intersect_expr::Sequence_intersect_expr(std::string element) {
  this->type = NodeType::SEQUENCE_INTERSECT_EXPR;
  this->setElement(element);
}

Function_declaration::Function_declaration(std::string element) {
  this->type = NodeType::FUNCTION_DECLARATION;
  this->setElement(element);
}

Net_type_or_none::Net_type_or_none(std::string element) {
  this->type = NodeType::NET_TYPE_OR_NONE;
  this->setElement(element);
}

Class_declaration_extends_opt::Class_declaration_extends_opt(
    std::string element) {
  this->type = NodeType::CLASS_DECLARATION_EXTENDS_OPT;
  this->setElement(element);
}

Boolean_abbrev_opt::Boolean_abbrev_opt(std::string element) {
  this->type = NodeType::BOOLEAN_ABBREV_OPT;
  this->setElement(element);
}

Specify_path_identifiers::Specify_path_identifiers(std::string element) {
  this->type = NodeType::SPECIFY_PATH_IDENTIFIERS;
  this->setElement(element);
}

Tf_port_direction::Tf_port_direction(std::string element) {
  this->type = NodeType::TF_PORT_DIRECTION;
  this->setElement(element);
}

Tk_decdigits::Tk_decdigits(std::string element) {
  this->type = NodeType::TK_DECDIGITS;
  this->setElement(element);
}

End::End(std::string element) {
  this->type = NodeType::END;
  this->setElement(element);
}

Net_declaration::Net_declaration(std::string element) {
  this->type = NodeType::NET_DECLARATION;
  this->setElement(element);
}

Tk_tagged_opt::Tk_tagged_opt(std::string element) {
  this->type = NodeType::TK_TAGGED_OPT;
  this->setElement(element);
}

Tk_xzdigits::Tk_xzdigits(std::string element) {
  this->type = NodeType::TK_XZDIGITS;
  this->setElement(element);
}

Gatetype::Gatetype(std::string element) {
  this->type = NodeType::GATETYPE;
  this->setElement(element);
}

Preprocess_include_argument::Preprocess_include_argument(std::string element) {
  this->type = NodeType::PREPROCESS_INCLUDE_ARGUMENT;
  this->setElement(element);
}

Macro_formals_list::Macro_formals_list(std::string element) {
  this->type = NodeType::MACRO_FORMALS_LIST;
  this->setElement(element);
}

Const_opt::Const_opt(std::string element) {
  this->type = NodeType::CONST_OPT;
  this->setElement(element);
}

Logand_expr::Logand_expr(std::string element) {
  this->type = NodeType::LOGAND_EXPR;
  this->setElement(element);
}

Event_expression::Event_expression(std::string element) {
  this->type = NodeType::EVENT_EXPRESSION;
  this->setElement(element);
}

Udp_entry_list::Udp_entry_list(std::string element) {
  this->type = NodeType::UDP_ENTRY_LIST;
  this->setElement(element);
}

Preprocessor_action::Preprocessor_action(std::string element) {
  this->type = NodeType::PREPROCESSOR_ACTION;
  this->setElement(element);
}

Tf_port_declaration::Tf_port_declaration(std::string element) {
  this->type = NodeType::TF_PORT_DECLARATION;
  this->setElement(element);
}

Udp_init_opt::Udp_init_opt(std::string element) {
  this->type = NodeType::UDP_INIT_OPT;
  this->setElement(element);
}

Type_identifier_or_implicit_followed_by_id_and_dimensions_opt::
    Type_identifier_or_implicit_followed_by_id_and_dimensions_opt(
        std::string element) {
  this->type =
      NodeType::TYPE_IDENTIFIER_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT;
  this->setElement(element);
}

Source_text::Source_text(std::string element) {
  this->type = NodeType::SOURCE_TEXT;
  this->setElement(element);
}

Defparam_assign::Defparam_assign(std::string element) {
  this->type = NodeType::DEFPARAM_ASSIGN;
  this->setElement(element);
}

Decl_dimensions::Decl_dimensions(std::string element) {
  this->type = NodeType::DECL_DIMENSIONS;
  this->setElement(element);
}

Constant_dec_number::Constant_dec_number(std::string element) {
  this->type = NodeType::CONSTANT_DEC_NUMBER;
  this->setElement(element);
}

Case_statement::Case_statement(std::string element) {
  this->type = NodeType::CASE_STATEMENT;
  this->setElement(element);
}

Assignment_statement::Assignment_statement(std::string element) {
  this->type = NodeType::ASSIGNMENT_STATEMENT;
  this->setElement(element);
}

Dpi_import_property_opt::Dpi_import_property_opt(std::string element) {
  this->type = NodeType::DPI_IMPORT_PROPERTY_OPT;
  this->setElement(element);
}

Dpi_spec_string::Dpi_spec_string(std::string element) {
  this->type = NodeType::DPI_SPEC_STRING;
  this->setElement(element);
}

Trailing_decl_assignment::Trailing_decl_assignment(std::string element) {
  this->type = NodeType::TRAILING_DECL_ASSIGNMENT;
  this->setElement(element);
}

Always_construct::Always_construct(std::string element) {
  this->type = NodeType::ALWAYS_CONSTRUCT;
  this->setElement(element);
}

Genvar_opt::Genvar_opt(std::string element) {
  this->type = NodeType::GENVAR_OPT;
  this->setElement(element);
}

Any_port_list_named::Any_port_list_named(std::string element) {
  this->type = NodeType::ANY_PORT_LIST_NAMED;
  this->setElement(element);
}

Subroutine_call::Subroutine_call(std::string element) {
  this->type = NodeType::SUBROUTINE_CALL;
  this->setElement(element);
}

Property_expr_or_assignment::Property_expr_or_assignment(std::string element) {
  this->type = NodeType::PROPERTY_EXPR_OR_ASSIGNMENT;
  this->setElement(element);
}

Any_argument::Any_argument(std::string element) {
  this->type = NodeType::ANY_ARGUMENT;
  this->setElement(element);
}

Module_or_interface_declaration::Module_or_interface_declaration(
    std::string element) {
  this->type = NodeType::MODULE_OR_INTERFACE_DECLARATION;
  this->setElement(element);
}

Expression_opt::Expression_opt(std::string element) {
  this->type = NodeType::EXPRESSION_OPT;
  this->setElement(element);
}

Gate_instance_or_register_variable_list::
    Gate_instance_or_register_variable_list(std::string element) {
  this->type = NodeType::GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST;
  this->setElement(element);
}

Tk_evalstringliteral::Tk_evalstringliteral(std::string element) {
  this->type = NodeType::TK_EVALSTRINGLITERAL;
  this->setElement(element);
}

Delay_or_event_control::Delay_or_event_control(std::string element) {
  this->type = NodeType::DELAY_OR_EVENT_CONTROL;
  this->setElement(element);
}

Udp_input_list::Udp_input_list(std::string element) {
  this->type = NodeType::UDP_INPUT_LIST;
  this->setElement(element);
}

Parameter_value_byname_list::Parameter_value_byname_list(std::string element) {
  this->type = NodeType::PARAMETER_VALUE_BYNAME_LIST;
  this->setElement(element);
}

Module_port_list_opt::Module_port_list_opt(std::string element) {
  this->type = NodeType::MODULE_PORT_LIST_OPT;
  this->setElement(element);
}

List_of_ports_or_port_declarations_opt::List_of_ports_or_port_declarations_opt(
    std::string element) {
  this->type = NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_OPT;
  this->setElement(element);
}

Any_port_list_trailing_comma_positional::
    Any_port_list_trailing_comma_positional(std::string element) {
  this->type = NodeType::ANY_PORT_LIST_TRAILING_COMMA_POSITIONAL;
  this->setElement(element);
}

Block_item_or_statement_or_null_list_opt::
    Block_item_or_statement_or_null_list_opt(std::string element) {
  this->type = NodeType::BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT;
  this->setElement(element);
}

Genvar_declaration::Genvar_declaration(std::string element) {
  this->type = NodeType::GENVAR_DECLARATION;
  this->setElement(element);
}

Number::Number(std::string element) {
  this->type = NodeType::NUMBER;
  this->setElement(element);
}

Specify_item_list::Specify_item_list(std::string element) {
  this->type = NodeType::SPECIFY_ITEM_LIST;
  this->setElement(element);
}

Tk_ls_eq::Tk_ls_eq(std::string element) {
  this->type = NodeType::TK_LS_EQ;
  this->setElement(element);
}

Tf_variable_identifier::Tf_variable_identifier(std::string element) {
  this->type = NodeType::TF_VARIABLE_IDENTIFIER;
  this->setElement(element);
}

Initial_construct::Initial_construct(std::string element) {
  this->type = NodeType::INITIAL_CONSTRUCT;
  this->setElement(element);
}

Localparam_assign_list::Localparam_assign_list(std::string element) {
  this->type = NodeType::LOCALPARAM_ASSIGN_LIST;
  this->setElement(element);
}

Disable_statement::Disable_statement(std::string element) {
  this->type = NodeType::DISABLE_STATEMENT;
  this->setElement(element);
}

List_of_module_item_identifiers::List_of_module_item_identifiers(
    std::string element) {
  this->type = NodeType::LIST_OF_MODULE_ITEM_IDENTIFIERS;
  this->setElement(element);
}

Any_port_list_item_last_named::Any_port_list_item_last_named(
    std::string element) {
  this->type = NodeType::ANY_PORT_LIST_ITEM_LAST_NAMED;
  this->setElement(element);
}

Net_variable::Net_variable(std::string element) {
  this->type = NodeType::NET_VARIABLE;
  this->setElement(element);
}

Parameter_expr_list::Parameter_expr_list(std::string element) {
  this->type = NodeType::PARAMETER_EXPR_LIST;
  this->setElement(element);
}

Specparam_declaration::Specparam_declaration(std::string element) {
  this->type = NodeType::SPECPARAM_DECLARATION;
  this->setElement(element);
}

Deferred_immediate_assertion_statement::Deferred_immediate_assertion_statement(
    std::string element) {
  this->type = NodeType::DEFERRED_IMMEDIATE_ASSERTION_STATEMENT;
  this->setElement(element);
}

Slice_size_opt::Slice_size_opt(std::string element) {
  this->type = NodeType::SLICE_SIZE_OPT;
  this->setElement(element);
}

Concurrent_assertion_item::Concurrent_assertion_item(std::string element) {
  this->type = NodeType::CONCURRENT_ASSERTION_ITEM;
  this->setElement(element);
}

Clocking_item_list_opt::Clocking_item_list_opt(std::string element) {
  this->type = NodeType::CLOCKING_ITEM_LIST_OPT;
  this->setElement(element);
}

Cycle_delay::Cycle_delay(std::string element) {
  this->type = NodeType::CYCLE_DELAY;
  this->setElement(element);
}

Macroiditem::Macroiditem(std::string element) {
  this->type = NodeType::MACROIDITEM;
  this->setElement(element);
}

Assume_property_statement::Assume_property_statement(std::string element) {
  this->type = NodeType::ASSUME_PROPERTY_STATEMENT;
  this->setElement(element);
}

Pull01::Pull01(std::string element) {
  this->type = NodeType::PULL01;
  this->setElement(element);
}

Preprocessor_directive::Preprocessor_directive(std::string element) {
  this->type = NodeType::PREPROCESSOR_DIRECTIVE;
  this->setElement(element);
}

Module_item_directive::Module_item_directive(std::string element) {
  this->type = NodeType::MODULE_ITEM_DIRECTIVE;
  this->setElement(element);
}

Assert_property_statement::Assert_property_statement(std::string element) {
  this->type = NodeType::ASSERT_PROPERTY_STATEMENT;
  this->setElement(element);
}

Scope_or_if_res::Scope_or_if_res(std::string element) {
  this->type = NodeType::SCOPE_OR_IF_RES;
  this->setElement(element);
}

Task_prototype::Task_prototype(std::string element) {
  this->type = NodeType::TASK_PROTOTYPE;
  this->setElement(element);
}

Clocking_declaration::Clocking_declaration(std::string element) {
  this->type = NodeType::CLOCKING_DECLARATION;
  this->setElement(element);
}

Block_identifier_opt::Block_identifier_opt(std::string element) {
  this->type = NodeType::BLOCK_IDENTIFIER_OPT;
  this->setElement(element);
}

Macroidentifier::Macroidentifier(std::string element) {
  this->type = NodeType::MACROIDENTIFIER;
  this->setElement(element);
}

Property_spec_disable_iff_opt::Property_spec_disable_iff_opt(
    std::string element) {
  this->type = NodeType::PROPERTY_SPEC_DISABLE_IFF_OPT;
  this->setElement(element);
}

Macrogenericitem::Macrogenericitem(std::string element) {
  this->type = NodeType::MACROGENERICITEM;
  this->setElement(element);
}

Module_block::Module_block(std::string element) {
  this->type = NodeType::MODULE_BLOCK;
  this->setElement(element);
}

Stream_expression::Stream_expression(std::string element) {
  this->type = NodeType::STREAM_EXPRESSION;
  this->setElement(element);
}

Final_or_zero::Final_or_zero(std::string element) {
  this->type = NodeType::FINAL_OR_ZERO;
  this->setElement(element);
}

Tk_edge_descriptor::Tk_edge_descriptor(std::string element) {
  this->type = NodeType::TK_EDGE_DESCRIPTOR;
  this->setElement(element);
}

Method_property_qualifier_list_not_starting_with_virtual::
    Method_property_qualifier_list_not_starting_with_virtual(
        std::string element) {
  this->type =
      NodeType::METHOD_PROPERTY_QUALIFIER_LIST_NOT_STARTING_WITH_VIRTUAL;
  this->setElement(element);
}

Identifier_opt::Identifier_opt(std::string element) {
  this->type = NodeType::IDENTIFIER_OPT;
  this->setElement(element);
}

Module_parameter_port_list_preprocessor_last::
    Module_parameter_port_list_preprocessor_last(std::string element) {
  this->type = NodeType::MODULE_PARAMETER_PORT_LIST_PREPROCESSOR_LAST;
  this->setElement(element);
}

Type_assignment::Type_assignment(std::string element) {
  this->type = NodeType::TYPE_ASSIGNMENT;
  this->setElement(element);
}

Type_assignment_list::Type_assignment_list(std::string element) {
  this->type = NodeType::TYPE_ASSIGNMENT_LIST;
  this->setElement(element);
}

Method_qualifier_list_opt::Method_qualifier_list_opt(std::string element) {
  this->type = NodeType::METHOD_QUALIFIER_LIST_OPT;
  this->setElement(element);
}

Stream_operator::Stream_operator(std::string element) {
  this->type = NodeType::STREAM_OPERATOR;
  this->setElement(element);
}

Assertion_item::Assertion_item(std::string element) {
  this->type = NodeType::ASSERTION_ITEM;
  this->setElement(element);
}

Property_spec::Property_spec(std::string element) {
  this->type = NodeType::PROPERTY_SPEC;
  this->setElement(element);
}

Streaming_concatenation::Streaming_concatenation(std::string element) {
  this->type = NodeType::STREAMING_CONCATENATION;
  this->setElement(element);
}

Edge_descriptor_list::Edge_descriptor_list(std::string element) {
  this->type = NodeType::EDGE_DESCRIPTOR_LIST;
  this->setElement(element);
}

Property_qualifier::Property_qualifier(std::string element) {
  this->type = NodeType::PROPERTY_QUALIFIER;
  this->setElement(element);
}

Event_control_opt::Event_control_opt(std::string element) {
  this->type = NodeType::EVENT_CONTROL_OPT;
  this->setElement(element);
}

Class_item_qualifier::Class_item_qualifier(std::string element) {
  this->type = NodeType::CLASS_ITEM_QUALIFIER;
  this->setElement(element);
}

Concurrent_assertion_statement::Concurrent_assertion_statement(
    std::string element) {
  this->type = NodeType::CONCURRENT_ASSERTION_STATEMENT;
  this->setElement(element);
}

Cover_property_statement::Cover_property_statement(std::string element) {
  this->type = NodeType::COVER_PROPERTY_STATEMENT;
  this->setElement(element);
}

Stream_expression_list::Stream_expression_list(std::string element) {
  this->type = NodeType::STREAM_EXPRESSION_LIST;
  this->setElement(element);
}

Class_item_qualifier_list_opt::Class_item_qualifier_list_opt(
    std::string element) {
  this->type = NodeType::CLASS_ITEM_QUALIFIER_LIST_OPT;
  this->setElement(element);
}

Assertion_item_declaration::Assertion_item_declaration(std::string element) {
  this->type = NodeType::ASSERTION_ITEM_DECLARATION;
  this->setElement(element);
}

Boolean_abbrev::Boolean_abbrev(std::string element) {
  this->type = NodeType::BOOLEAN_ABBREV;
  this->setElement(element);
}

Cycle_delay_range::Cycle_delay_range(std::string element) {
  this->type = NodeType::CYCLE_DELAY_RANGE;
  this->setElement(element);
}

Property_operator::Property_operator(std::string element) {
  this->type = NodeType::PROPERTY_OPERATOR;
  this->setElement(element);
}

Property_spec_disable_iff::Property_spec_disable_iff(std::string element) {
  this->type = NodeType::PROPERTY_SPEC_DISABLE_IFF;
  this->setElement(element);
}

Config_declaration::Config_declaration(std::string element) {
  this->type = NodeType::CONFIG_DECLARATION;
  this->setElement(element);
}

With_constraint_block_opt::With_constraint_block_opt(std::string element) {
  this->type = NodeType::WITH_CONSTRAINT_BLOCK_OPT;
  this->setElement(element);
}

Random_qualifier::Random_qualifier(std::string element) {
  this->type = NodeType::RANDOM_QUALIFIER;
  this->setElement(element);
}

Bind_target_instance_list::Bind_target_instance_list(std::string element) {
  this->type = NodeType::BIND_TARGET_INSTANCE_LIST;
  this->setElement(element);
}

Hierarchy_or_call_extension::Hierarchy_or_call_extension(std::string element) {
  this->type = NodeType::HIERARCHY_OR_CALL_EXTENSION;
  this->setElement(element);
}

Clocking_item_list::Clocking_item_list(std::string element) {
  this->type = NodeType::CLOCKING_ITEM_LIST;
  this->setElement(element);
}

Modport_declaration::Modport_declaration(std::string element) {
  this->type = NodeType::MODPORT_DECLARATION;
  this->setElement(element);
}

Class_constraint::Class_constraint(std::string element) {
  this->type = NodeType::CLASS_CONSTRAINT;
  this->setElement(element);
}

Net_alias::Net_alias(std::string element) {
  this->type = NodeType::NET_ALIAS;
  this->setElement(element);
}

Type_reference::Type_reference(std::string element) {
  this->type = NodeType::TYPE_REFERENCE;
  this->setElement(element);
}

Method_qualifier_list::Method_qualifier_list(std::string element) {
  this->type = NodeType::METHOD_QUALIFIER_LIST;
  this->setElement(element);
}

Interface_type::Interface_type(std::string element) {
  this->type = NodeType::INTERFACE_TYPE;
  this->setElement(element);
}

Package_export_declaration::Package_export_declaration(std::string element) {
  this->type = NodeType::PACKAGE_EXPORT_DECLARATION;
  this->setElement(element);
}

Constraint_block_item_list_opt::Constraint_block_item_list_opt(
    std::string element) {
  this->type = NodeType::CONSTRAINT_BLOCK_ITEM_LIST_OPT;
  this->setElement(element);
}

Constraint_block_item_list::Constraint_block_item_list(std::string element) {
  this->type = NodeType::CONSTRAINT_BLOCK_ITEM_LIST;
  this->setElement(element);
}

List_of_libraries_opt::List_of_libraries_opt(std::string element) {
  this->type = NodeType::LIST_OF_LIBRARIES_OPT;
  this->setElement(element);
}

Lib_cell_id::Lib_cell_id(std::string element) {
  this->type = NodeType::LIB_CELL_ID;
  this->setElement(element);
}

Expect_property_statement::Expect_property_statement(std::string element) {
  this->type = NodeType::EXPECT_PROPERTY_STATEMENT;
  this->setElement(element);
}

Optional_semicolon::Optional_semicolon(std::string element) {
  this->type = NodeType::OPTIONAL_SEMICOLON;
  this->setElement(element);
}

Identifier_list_in_parens_opt::Identifier_list_in_parens_opt(
    std::string element) {
  this->type = NodeType::IDENTIFIER_LIST_IN_PARENS_OPT;
  this->setElement(element);
}

Sequence_port_list_in_parens_opt::Sequence_port_list_in_parens_opt(
    std::string element) {
  this->type = NodeType::SEQUENCE_PORT_LIST_IN_PARENS_OPT;
  this->setElement(element);
}

Data_type_or_implicit_basic_followed_by_id::
    Data_type_or_implicit_basic_followed_by_id(std::string element) {
  this->type = NodeType::DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID;
  this->setElement(element);
}

Modport_simple_ports_declaration_last::Modport_simple_ports_declaration_last(
    std::string element) {
  this->type = NodeType::MODPORT_SIMPLE_PORTS_DECLARATION_LAST;
  this->setElement(element);
}

Goto_repetition::Goto_repetition(std::string element) {
  this->type = NodeType::GOTO_REPETITION;
  this->setElement(element);
}

Modport_ports_list::Modport_ports_list(std::string element) {
  this->type = NodeType::MODPORT_PORTS_LIST;
  this->setElement(element);
}

Coverage_spec_or_option_list::Coverage_spec_or_option_list(
    std::string element) {
  this->type = NodeType::COVERAGE_SPEC_OR_OPTION_LIST;
  this->setElement(element);
}

Assertion_variable_declaration::Assertion_variable_declaration(
    std::string element) {
  this->type = NodeType::ASSERTION_VARIABLE_DECLARATION;
  this->setElement(element);
}

Interface_opt::Interface_opt(std::string element) {
  this->type = NodeType::INTERFACE_OPT;
  this->setElement(element);
}

List_of_libraries::List_of_libraries(std::string element) {
  this->type = NodeType::LIST_OF_LIBRARIES;
  this->setElement(element);
}

Type_identifier_or_implicit_basic_followed_by_id::
    Type_identifier_or_implicit_basic_followed_by_id(std::string element) {
  this->type = NodeType::TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID;
  this->setElement(element);
}

Bind_target_instance::Bind_target_instance(std::string element) {
  this->type = NodeType::BIND_TARGET_INSTANCE;
  this->setElement(element);
}

Property_actual_arg_opt::Property_actual_arg_opt(std::string element) {
  this->type = NodeType::PROPERTY_ACTUAL_ARG_OPT;
  this->setElement(element);
}

Method_qualifier::Method_qualifier(std::string element) {
  this->type = NodeType::METHOD_QUALIFIER;
  this->setElement(element);
}

Design_statement::Design_statement(std::string element) {
  this->type = NodeType::DESIGN_STATEMENT;
  this->setElement(element);
}

Modport_simple_ports_declaration_begin::Modport_simple_ports_declaration_begin(
    std::string element) {
  this->type = NodeType::MODPORT_SIMPLE_PORTS_DECLARATION_BEGIN;
  this->setElement(element);
}

Sequence_port_list_opt::Sequence_port_list_opt(std::string element) {
  this->type = NodeType::SEQUENCE_PORT_LIST_OPT;
  this->setElement(element);
}

Clocking_item::Clocking_item(std::string element) {
  this->type = NodeType::CLOCKING_ITEM;
  this->setElement(element);
}

Constraint_declaration::Constraint_declaration(std::string element) {
  this->type = NodeType::CONSTRAINT_DECLARATION;
  this->setElement(element);
}

Clocking_direction::Clocking_direction(std::string element) {
  this->type = NodeType::CLOCKING_DIRECTION;
  this->setElement(element);
}

Modport_item::Modport_item(std::string element) {
  this->type = NodeType::MODPORT_ITEM;
  this->setElement(element);
}

Clocking_decl_assign::Clocking_decl_assign(std::string element) {
  this->type = NodeType::CLOCKING_DECL_ASSIGN;
  this->setElement(element);
}

Consecutive_repetition::Consecutive_repetition(std::string element) {
  this->type = NodeType::CONSECUTIVE_REPETITION;
  this->setElement(element);
}

Bins_or_options_list_opt::Bins_or_options_list_opt(std::string element) {
  this->type = NodeType::BINS_OR_OPTIONS_LIST_OPT;
  this->setElement(element);
}

Cycle_range::Cycle_range(std::string element) {
  this->type = NodeType::CYCLE_RANGE;
  this->setElement(element);
}

Clocking_skew_opt::Clocking_skew_opt(std::string element) {
  this->type = NodeType::CLOCKING_SKEW_OPT;
  this->setElement(element);
}

Nonconsecutive_repetition::Nonconsecutive_repetition(std::string element) {
  this->type = NodeType::NONCONSECUTIVE_REPETITION;
  this->setElement(element);
}

Constraint_expression_no_preprocessor::Constraint_expression_no_preprocessor(
    std::string element) {
  this->type = NodeType::CONSTRAINT_EXPRESSION_NO_PREPROCESSOR;
  this->setElement(element);
}

List_of_clocking_decl_assign::List_of_clocking_decl_assign(
    std::string element) {
  this->type = NodeType::LIST_OF_CLOCKING_DECL_ASSIGN;
  this->setElement(element);
}

Property_port_list::Property_port_list(std::string element) {
  this->type = NodeType::PROPERTY_PORT_LIST;
  this->setElement(element);
}

Net_alias_assign_lvalue_list::Net_alias_assign_lvalue_list(
    std::string element) {
  this->type = NodeType::NET_ALIAS_ASSIGN_LVALUE_LIST;
  this->setElement(element);
}

Assertion_variable_declaration_list::Assertion_variable_declaration_list(
    std::string element) {
  this->type = NodeType::ASSERTION_VARIABLE_DECLARATION_LIST;
  this->setElement(element);
}

List_of_config_rule_statements::List_of_config_rule_statements(
    std::string element) {
  this->type = NodeType::LIST_OF_CONFIG_RULE_STATEMENTS;
  this->setElement(element);
}

Constraint_block::Constraint_block(std::string element) {
  this->type = NodeType::CONSTRAINT_BLOCK;
  this->setElement(element);
}

List_of_config_rule_statements_opt::List_of_config_rule_statements_opt(
    std::string element) {
  this->type = NodeType::LIST_OF_CONFIG_RULE_STATEMENTS_OPT;
  this->setElement(element);
}

Property_port_modifiers_opt::Property_port_modifiers_opt(std::string element) {
  this->type = NodeType::PROPERTY_PORT_MODIFIERS_OPT;
  this->setElement(element);
}

With_constraint_block::With_constraint_block(std::string element) {
  this->type = NodeType::WITH_CONSTRAINT_BLOCK;
  this->setElement(element);
}

Property_declaration::Property_declaration(std::string element) {
  this->type = NodeType::PROPERTY_DECLARATION;
  this->setElement(element);
}

Implication_operator::Implication_operator(std::string element) {
  this->type = NodeType::IMPLICATION_OPERATOR;
  this->setElement(element);
}

Cover_point::Cover_point(std::string element) {
  this->type = NodeType::COVER_POINT;
  this->setElement(element);
}

Coverage_event::Coverage_event(std::string element) {
  this->type = NodeType::COVERAGE_EVENT;
  this->setElement(element);
}

Property_formal_type_followed_by_id::Property_formal_type_followed_by_id(
    std::string element) {
  this->type = NodeType::PROPERTY_FORMAL_TYPE_FOLLOWED_BY_ID;
  this->setElement(element);
}

Config_rule_statement::Config_rule_statement(std::string element) {
  this->type = NodeType::CONFIG_RULE_STATEMENT;
  this->setElement(element);
}

Modport_item_list::Modport_item_list(std::string element) {
  this->type = NodeType::MODPORT_ITEM_LIST;
  this->setElement(element);
}

Property_port_item::Property_port_item(std::string element) {
  this->type = NodeType::PROPERTY_PORT_ITEM;
  this->setElement(element);
}

Liblist_clause::Liblist_clause(std::string element) {
  this->type = NodeType::LIBLIST_CLAUSE;
  this->setElement(element);
}

Lib_cell_identifiers_opt::Lib_cell_identifiers_opt(std::string element) {
  this->type = NodeType::LIB_CELL_IDENTIFIERS_OPT;
  this->setElement(element);
}

Covergroup_declaration::Covergroup_declaration(std::string element) {
  this->type = NodeType::COVERGROUP_DECLARATION;
  this->setElement(element);
}

Modport_simple_port::Modport_simple_port(std::string element) {
  this->type = NodeType::MODPORT_SIMPLE_PORT;
  this->setElement(element);
}

Sequence_declaration::Sequence_declaration(std::string element) {
  this->type = NodeType::SEQUENCE_DECLARATION;
  this->setElement(element);
}

Coverage_event_opt::Coverage_event_opt(std::string element) {
  this->type = NodeType::COVERAGE_EVENT_OPT;
  this->setElement(element);
}

Lib_cell_identifiers::Lib_cell_identifiers(std::string element) {
  this->type = NodeType::LIB_CELL_IDENTIFIERS;
  this->setElement(element);
}

Cycle_range_or_expr::Cycle_range_or_expr(std::string element) {
  this->type = NodeType::CYCLE_RANGE_OR_EXPR;
  this->setElement(element);
}

Property_port_list_in_parens_opt::Property_port_list_in_parens_opt(
    std::string element) {
  this->type = NodeType::PROPERTY_PORT_LIST_IN_PARENS_OPT;
  this->setElement(element);
}

Coverage_spec_or_option_list_opt::Coverage_spec_or_option_list_opt(
    std::string element) {
  this->type = NodeType::COVERAGE_SPEC_OR_OPTION_LIST_OPT;
  this->setElement(element);
}

Coverage_spec_or_option::Coverage_spec_or_option(std::string element) {
  this->type = NodeType::COVERAGE_SPEC_OR_OPTION;
  this->setElement(element);
}

Coverage_spec::Coverage_spec(std::string element) {
  this->type = NodeType::COVERAGE_SPEC;
  this->setElement(element);
}

Constraint_block_item::Constraint_block_item(std::string element) {
  this->type = NodeType::CONSTRAINT_BLOCK_ITEM;
  this->setElement(element);
}

Tk_static_opt::Tk_static_opt(std::string element) {
  this->type = NodeType::TK_STATIC_OPT;
  this->setElement(element);
}

Until_Operator::Until_Operator(std::string element) {
  this->type = NodeType::UNTIL_OPERATOR;
  this->setElement(element);
}
Cover_Sequence_Statement::Cover_Sequence_Statement(std::string element) {
  this->type = NodeType::COVER_SEQUENCE_STATEMENT;
  this->setElement(element);
}
With_Covergroup_Expression_In_Parens::With_Covergroup_Expression_In_Parens(
    std::string element) {
  this->type = NodeType::WITH_COVERGROUP_EXPRESSION_IN_PARENS;
  this->setElement(element);
}
Declaration_Extends_List_Opt::Declaration_Extends_List_Opt(
    std::string element) {
  this->type = NodeType::DECLARATION_EXTENDS_LIST_OPT;
  this->setElement(element);
}
Rs_If_Else::Rs_If_Else(std::string element) {
  this->type = NodeType::RS_IF_ELSE;
  this->setElement(element);
}
Followed_By_Operator::Followed_By_Operator(std::string element) {
  this->type = NodeType::FOLLOWED_BY_OPERATOR;
  this->setElement(element);
}
Local_Sequence_Lvar_Port_Direction_Opt::Local_Sequence_Lvar_Port_Direction_Opt(
    std::string element) {
  this->type = NodeType::LOCAL_SEQUENCE_LVAR_PORT_DIRECTION_OPT;
  this->setElement(element);
}
Bins_Expression::Bins_Expression(std::string element) {
  this->type = NodeType::BINS_EXPRESSION;
  this->setElement(element);
}
Property_Actual_Arg::Property_Actual_Arg(std::string element) {
  this->type = NodeType::PROPERTY_ACTUAL_ARG;
  this->setElement(element);
}
Select_Expression::Select_Expression(std::string element) {
  this->type = NodeType::SELECT_EXPRESSION;
  this->setElement(element);
}
Slice_Size::Slice_Size(std::string element) {
  this->type = NodeType::SLICE_SIZE;
  this->setElement(element);
}
Property_Case_Item::Property_Case_Item(std::string element) {
  this->type = NodeType::PROPERTY_CASE_ITEM;
  this->setElement(element);
}
Default_Skew::Default_Skew(std::string element) {
  this->type = NodeType::DEFAULT_SKEW;
  this->setElement(element);
}
Constraint_Expression_List::Constraint_Expression_List(std::string element) {
  this->type = NodeType::CONSTRAINT_EXPRESSION_LIST;
  this->setElement(element);
}
Modport_Clocking_Declaration_Begin::Modport_Clocking_Declaration_Begin(
    std::string element) {
  this->type = NodeType::MODPORT_CLOCKING_DECLARATION_BEGIN;
  this->setElement(element);
}
Property_Case_Item_List::Property_Case_Item_List(std::string element) {
  this->type = NodeType::PROPERTY_CASE_ITEM_LIST;
  this->setElement(element);
}
Randomize_Call::Randomize_Call(std::string element) {
  this->type = NodeType::RANDOMIZE_CALL;
  this->setElement(element);
}
Cross_Item_List::Cross_Item_List(std::string element) {
  this->type = NodeType::CROSS_ITEM_LIST;
  this->setElement(element);
}
Production_Item::Production_Item(std::string element) {
  this->type = NodeType::PRODUCTION_ITEM;
  this->setElement(element);
}
Data_Type_Or_Void_With_Id::Data_Type_Or_Void_With_Id(std::string element) {
  this->type = NodeType::DATA_TYPE_OR_VOID_WITH_ID;
  this->setElement(element);
}
Lb_Star_Rb::Lb_Star_Rb(std::string element) {
  this->type = NodeType::LB_STAR_RB;
  this->setElement(element);
}
Modport_Clocking_Declaration_Last::Modport_Clocking_Declaration_Last(
    std::string element) {
  this->type = NodeType::MODPORT_CLOCKING_DECLARATION_LAST;
  this->setElement(element);
}
Uniqueness_Constraint::Uniqueness_Constraint(std::string element) {
  this->type = NodeType::UNIQUENESS_CONSTRAINT;
  this->setElement(element);
}
Any_Port_List_Preprocessor_Last_Named::Any_Port_List_Preprocessor_Last_Named(
    std::string element) {
  this->type = NodeType::ANY_PORT_LIST_PREPROCESSOR_LAST_NAMED;
  this->setElement(element);
}
Modport_Tf_Ports_Declaration_Trailing_Comma::
    Modport_Tf_Ports_Declaration_Trailing_Comma(std::string element) {
  this->type = NodeType::MODPORT_TF_PORTS_DECLARATION_TRAILING_COMMA;
  this->setElement(element);
}
Interface_Data_Declaration::Interface_Data_Declaration(std::string element) {
  this->type = NodeType::INTERFACE_DATA_DECLARATION;
  this->setElement(element);
}
Method_Property_Qualifier::Method_Property_Qualifier(std::string element) {
  this->type = NodeType::METHOD_PROPERTY_QUALIFIER;
  this->setElement(element);
}
Bins_Or_Options_List::Bins_Or_Options_List(std::string element) {
  this->type = NodeType::BINS_OR_OPTIONS_LIST;
  this->setElement(element);
}
Opt_Config::Opt_Config(std::string element) {
  this->type = NodeType::OPT_CONFIG;
  this->setElement(element);
}
Pattern_List::Pattern_List(std::string element) {
  this->type = NodeType::PATTERN_LIST;
  this->setElement(element);
}
Bins_Or_Options::Bins_Or_Options(std::string element) {
  this->type = NodeType::BINS_OR_OPTIONS;
  this->setElement(element);
}
Pattern_Opt::Pattern_Opt(std::string element) {
  this->type = NodeType::PATTERN_OPT;
  this->setElement(element);
}
Interface_Class_Item_List::Interface_Class_Item_List(std::string element) {
  this->type = NodeType::INTERFACE_CLASS_ITEM_LIST;
  this->setElement(element);
}
Cross_Body_Item_List::Cross_Body_Item_List(std::string element) {
  this->type = NodeType::CROSS_BODY_ITEM_LIST;
  this->setElement(element);
}
Modport_Tf_Ports_Declaration_Begin::Modport_Tf_Ports_Declaration_Begin(
    std::string element) {
  this->type = NodeType::MODPORT_TF_PORTS_DECLARATION_BEGIN;
  this->setElement(element);
}
Rs_Rule_List::Rs_Rule_List(std::string element) {
  this->type = NodeType::RS_RULE_LIST;
  this->setElement(element);
}
Cell_Clause::Cell_Clause(std::string element) {
  this->type = NodeType::CELL_CLAUSE;
  this->setElement(element);
}
Sequence_Port_List::Sequence_Port_List(std::string element) {
  this->type = NodeType::SEQUENCE_PORT_LIST;
  this->setElement(element);
}
Let_Port_List::Let_Port_List(std::string element) {
  this->type = NodeType::LET_PORT_LIST;
  this->setElement(element);
}
Production_List::Production_List(std::string element) {
  this->type = NodeType::PRODUCTION_LIST;
  this->setElement(element);
}
Rs_Production_List_Or_Rand_Join::Rs_Production_List_Or_Rand_Join(
    std::string element) {
  this->type = NodeType::RS_PRODUCTION_LIST_OR_RAND_JOIN;
  this->setElement(element);
}
Rs_Code_Block::Rs_Code_Block(std::string element) {
  this->type = NodeType::RS_CODE_BLOCK;
  this->setElement(element);
}
Let_Declaration::Let_Declaration(std::string element) {
  this->type = NodeType::LET_DECLARATION;
  this->setElement(element);
}
Expression_In_Parens_Opt::Expression_In_Parens_Opt(std::string element) {
  this->type = NodeType::EXPRESSION_IN_PARENS_OPT;
  this->setElement(element);
}
Array_Method_With_Predicate_Opt::Array_Method_With_Predicate_Opt(
    std::string element) {
  this->type = NodeType::ARRAY_METHOD_WITH_PREDICATE_OPT;
  this->setElement(element);
}
Cross_Item::Cross_Item(std::string element) {
  this->type = NodeType::CROSS_ITEM;
  this->setElement(element);
}
Modport_Tf_Ports_Declaration_Last::Modport_Tf_Ports_Declaration_Last(
    std::string element) {
  this->type = NodeType::MODPORT_TF_PORTS_DECLARATION_LAST;
  this->setElement(element);
}
Case_Pattern_Item::Case_Pattern_Item(std::string element) {
  this->type = NodeType::CASE_PATTERN_ITEM;
  this->setElement(element);
}
Inst_Clause::Inst_Clause(std::string element) {
  this->type = NodeType::INST_CLAUSE;
  this->setElement(element);
}
Rs_Repeat::Rs_Repeat(std::string element) {
  this->type = NodeType::RS_REPEAT;
  this->setElement(element);
}
Covergroup_Expression_Bracketed_Opt::Covergroup_Expression_Bracketed_Opt(
    std::string element) {
  this->type = NodeType::COVERGROUP_EXPRESSION_BRACKETED_OPT;
  this->setElement(element);
}
Clocking_Drive_Only::Clocking_Drive_Only(std::string element) {
  this->type = NodeType::CLOCKING_DRIVE_ONLY;
  this->setElement(element);
}
Constraint_Primary::Constraint_Primary(std::string element) {
  this->type = NodeType::CONSTRAINT_PRIMARY;
  this->setElement(element);
}
Constraint_Expression::Constraint_Expression(std::string element) {
  this->type = NodeType::CONSTRAINT_EXPRESSION;
  this->setElement(element);
}
Tk_Evalstringliteral::Tk_Evalstringliteral(std::string element) {
  this->type = NodeType::TK_EVALSTRINGLITERAL;
  this->setElement(element);
}
Sequence_Match_Item_List::Sequence_Match_Item_List(std::string element) {
  this->type = NodeType::SEQUENCE_MATCH_ITEM_LIST;
  this->setElement(element);
}
Sequence_Spec::Sequence_Spec(std::string element) {
  this->type = NodeType::SEQUENCE_SPEC;
  this->setElement(element);
}
Cover_Cross::Cover_Cross(std::string element) {
  this->type = NodeType::COVER_CROSS;
  this->setElement(element);
}
Wildcard_Opt::Wildcard_Opt(std::string element) {
  this->type = NodeType::WILDCARD_OPT;
  this->setElement(element);
}
Case_Inside_Items::Case_Inside_Items(std::string element) {
  this->type = NodeType::CASE_INSIDE_ITEMS;
  this->setElement(element);
}
Modport_Tf_Port::Modport_Tf_Port(std::string element) {
  this->type = NodeType::MODPORT_TF_PORT;
  this->setElement(element);
}
Weight_Specification::Weight_Specification(std::string element) {
  this->type = NodeType::WEIGHT_SPECIFICATION;
  this->setElement(element);
}
Select_Condition::Select_Condition(std::string element) {
  this->type = NodeType::SELECT_CONDITION;
  this->setElement(element);
}
Deferred_Immediate_Assertion_Item::Deferred_Immediate_Assertion_Item(
    std::string element) {
  this->type = NodeType::DEFERRED_IMMEDIATE_ASSERTION_ITEM;
  this->setElement(element);
}
Let_Formal_Type_Followed_By_Id::Let_Formal_Type_Followed_By_Id(
    std::string element) {
  this->type = NodeType::LET_FORMAL_TYPE_FOLLOWED_BY_ID;
  this->setElement(element);
}
Coverage_Bin_Rhs::Coverage_Bin_Rhs(std::string element) {
  this->type = NodeType::COVERAGE_BIN_RHS;
  this->setElement(element);
}
Production_Items_List::Production_Items_List(std::string element) {
  this->type = NodeType::PRODUCTION_ITEMS_LIST;
  this->setElement(element);
}
Preprocessor_Balanced_Port_Declarations::
    Preprocessor_Balanced_Port_Declarations(std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_PORT_DECLARATIONS;
  this->setElement(element);
}
Simple_Type::Simple_Type(std::string element) {
  this->type = NodeType::SIMPLE_TYPE;
  this->setElement(element);
}
Rs_Production_List::Rs_Production_List(std::string element) {
  this->type = NodeType::RS_PRODUCTION_LIST;
  this->setElement(element);
}
Dpi_Export_Item::Dpi_Export_Item(std::string element) {
  this->type = NodeType::DPI_EXPORT_ITEM;
  this->setElement(element);
}
Production::Production(std::string element) {
  this->type = NodeType::PRODUCTION;
  this->setElement(element);
}
Modport_Clocking_Declaration_Trailing_Comma::
    Modport_Clocking_Declaration_Trailing_Comma(std::string element) {
  this->type = NodeType::MODPORT_CLOCKING_DECLARATION_TRAILING_COMMA;
  this->setElement(element);
}
Let_Port_List_In_Parens_Opt::Let_Port_List_In_Parens_Opt(std::string element) {
  this->type = NodeType::LET_PORT_LIST_IN_PARENS_OPT;
  this->setElement(element);
}
Cross_Body::Cross_Body(std::string element) {
  this->type = NodeType::CROSS_BODY;
  this->setElement(element);
}
Use_Clause::Use_Clause(std::string element) {
  this->type = NodeType::USE_CLAUSE;
  this->setElement(element);
}
Sequence_Match_Item::Sequence_Match_Item(std::string element) {
  this->type = NodeType::SEQUENCE_MATCH_ITEM;
  this->setElement(element);
}
Coverage_Bin::Coverage_Bin(std::string element) {
  this->type = NodeType::COVERAGE_BIN;
  this->setElement(element);
}
Sequence_Port_Type_Followed_By_Id::Sequence_Port_Type_Followed_By_Id(
    std::string element) {
  this->type = NodeType::SEQUENCE_PORT_TYPE_FOLLOWED_BY_ID;
  this->setElement(element);
}
Interface_Class_Declaration::Interface_Class_Declaration(std::string element) {
  this->type = NodeType::INTERFACE_CLASS_DECLARATION;
  this->setElement(element);
}
Identifier_List::Identifier_List(std::string element) {
  this->type = NodeType::IDENTIFIER_LIST;
  this->setElement(element);
}
Sequence_Port_Item::Sequence_Port_Item(std::string element) {
  this->type = NodeType::SEQUENCE_PORT_ITEM;
  this->setElement(element);
}
Dist_Item::Dist_Item(std::string element) {
  this->type = NodeType::DIST_ITEM;
  this->setElement(element);
}
Dist_Weight::Dist_Weight(std::string element) {
  this->type = NodeType::DIST_WEIGHT;
  this->setElement(element);
}
Bins_Keyword::Bins_Keyword(std::string element) {
  this->type = NodeType::BINS_KEYWORD;
  this->setElement(element);
}
List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi::
    List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi(
        std::string element) {
  this->type =
      NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_PREPROCESSOR_LAST_ANSI;
  this->setElement(element);
}
Implements_Interface_List::Implements_Interface_List(std::string element) {
  this->type = NodeType::IMPLEMENTS_INTERFACE_LIST;
  this->setElement(element);
}
Let_Port_Item::Let_Port_Item(std::string element) {
  this->type = NodeType::LET_PORT_ITEM;
  this->setElement(element);
}
Array_Method_With_Predicate::Array_Method_With_Predicate(std::string element) {
  this->type = NodeType::ARRAY_METHOD_WITH_PREDICATE;
  this->setElement(element);
}
Coverage_Option::Coverage_Option(std::string element) {
  this->type = NodeType::COVERAGE_OPTION;
  this->setElement(element);
}
Constraint_Set::Constraint_Set(std::string element) {
  this->type = NodeType::CONSTRAINT_SET;
  this->setElement(element);
}
Pattern::Pattern(std::string element) {
  this->type = NodeType::PATTERN;
  this->setElement(element);
}
Net_Type_Declaration::Net_Type_Declaration(std::string element) {
  this->type = NodeType::NET_TYPE_DECLARATION;
  this->setElement(element);
}
Bins_Selection::Bins_Selection(std::string element) {
  this->type = NodeType::BINS_SELECTION;
  this->setElement(element);
}
Expression_Or_Dist_List::Expression_Or_Dist_List(std::string element) {
  this->type = NodeType::EXPRESSION_OR_DIST_LIST;
  this->setElement(element);
}
Clocking_Skew::Clocking_Skew(std::string element) {
  this->type = NodeType::CLOCKING_SKEW;
  this->setElement(element);
}
Interface_Class_Item::Interface_Class_Item(std::string element) {
  this->type = NodeType::INTERFACE_CLASS_ITEM;
  this->setElement(element);
}
Sequence_Expr_Match_Item_List::Sequence_Expr_Match_Item_List(
    std::string element) {
  this->type = NodeType::SEQUENCE_EXPR_MATCH_ITEM_LIST;
  this->setElement(element);
}
Tk_Anglebracketinclude::Tk_Anglebracketinclude(std::string element) {
  this->type = NodeType::TK_ANGLEBRACKETINCLUDE;
  this->setElement(element);
}
Interface_Class_Item_List_Opt::Interface_Class_Item_List_Opt(
    std::string element) {
  this->type = NodeType::INTERFACE_CLASS_ITEM_LIST_OPT;
  this->setElement(element);
}
Import_Export::Import_Export(std::string element) {
  this->type = NodeType::IMPORT_EXPORT;
  this->setElement(element);
}
With_Covergroup_Expression::With_Covergroup_Expression(std::string element) {
  this->type = NodeType::WITH_COVERGROUP_EXPRESSION;
  this->setElement(element);
}
Constraint_Primary_List::Constraint_Primary_List(std::string element) {
  this->type = NodeType::CONSTRAINT_PRIMARY_LIST;
  this->setElement(element);
}
Property_Case_Statement::Property_Case_Statement(std::string element) {
  this->type = NodeType::PROPERTY_CASE_STATEMENT;
  this->setElement(element);
}
Charge_Strength::Charge_Strength(std::string element) {
  this->type = NodeType::CHARGE_STRENGTH;
  this->setElement(element);
}
Dpi_Import_Property::Dpi_Import_Property(std::string element) {
  this->type = NodeType::DPI_IMPORT_PROPERTY;
  this->setElement(element);
}
Iff_Expr_Opt::Iff_Expr_Opt(std::string element) {
  this->type = NodeType::IFF_EXPR_OPT;
  this->setElement(element);
}
Rs_Rule::Rs_Rule(std::string element) {
  this->type = NodeType::RS_RULE;
  this->setElement(element);
}
Interface_Class_Method::Interface_Class_Method(std::string element) {
  this->type = NodeType::INTERFACE_CLASS_METHOD;
  this->setElement(element);
}
Modport_Simple_Ports_Declaration_Trailing_Comma::
    Modport_Simple_Ports_Declaration_Trailing_Comma(std::string element) {
  this->type = NodeType::MODPORT_SIMPLE_PORTS_DECLARATION_TRAILING_COMMA;
  this->setElement(element);
}
Case_Inside_Item::Case_Inside_Item(std::string element) {
  this->type = NodeType::CASE_INSIDE_ITEM;
  this->setElement(element);
}
Restrict_Property_Statement::Restrict_Property_Statement(std::string element) {
  this->type = NodeType::RESTRICT_PROPERTY_STATEMENT;
  this->setElement(element);
}
Dist_List::Dist_List(std::string element) {
  this->type = NodeType::DIST_LIST;
  this->setElement(element);
}
Rs_Prod::Rs_Prod(std::string element) {
  this->type = NodeType::RS_PROD;
  this->setElement(element);
}
Array_Ordering_Method::Array_Ordering_Method(std::string element) {
  this->type = NodeType::ARRAY_ORDERING_METHOD;
  this->setElement(element);
}
Randsequence_Statement::Randsequence_Statement(std::string element) {
  this->type = NodeType::RANDSEQUENCE_STATEMENT;
  this->setElement(element);
}
Cross_Body_Item::Cross_Body_Item(std::string element) {
  this->type = NodeType::CROSS_BODY_ITEM;
  this->setElement(element);
}
Case_Pattern_Items::Case_Pattern_Items(std::string element) {
  this->type = NodeType::CASE_PATTERN_ITEMS;
  this->setElement(element);
}
Cross_Body_Item_List_Opt::Cross_Body_Item_List_Opt(std::string element) {
  this->type = NodeType::CROSS_BODY_ITEM_LIST_OPT;
  this->setElement(element);
}
Modport_Ports_Declaration_Trailing_Comma::
    Modport_Ports_Declaration_Trailing_Comma(std::string element) {
  this->type = NodeType::MODPORT_PORTS_DECLARATION_TRAILING_COMMA;
  this->setElement(element);
}
Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List::
    Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List(
        std::string element) {
  this->type = NodeType::
      SET_COVERGROUP_EXPRESSION_OR_COVERGROUP_RANGE_LIST_OR_TRANS_LIST;
  this->setElement(element);
}
Tk_strong::Tk_strong(std::string element) {
  this->type = NodeType::TK_STRONG;
  this->setElement(element);
}
Preprocessor_else_class_item::Preprocessor_else_class_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_CLASS_ITEM;
  this->setElement(element);
}
Tk_genvar::Tk_genvar(std::string element) {
  this->type = NodeType::TK_GENVAR;
  this->setElement(element);
}
File_path_spec_list::File_path_spec_list(std::string element) {
  this->type = NodeType::FILE_PATH_SPEC_LIST;
  this->setElement(element);
}
Preprocessor_elsif_description_item::Preprocessor_elsif_description_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_DESCRIPTION_ITEM;
  this->setElement(element);
}
Branch_probe_expression::Branch_probe_expression(std::string element) {
  this->type = NodeType::BRANCH_PROBE_EXPRESSION;
  this->setElement(element);
}
Tk_rcmos::Tk_rcmos(std::string element) {
  this->type = NodeType::TK_RCMOS;
  this->setElement(element);
}
Tk_pipearrow2::Tk_pipearrow2(std::string element) {
  this->type = NodeType::TK_PIPEARROW2;
  this->setElement(element);
}
Tk_ssetup::Tk_ssetup(std::string element) {
  this->type = NodeType::TK_SSETUP;
  this->setElement(element);
}
Preprocessor_elsif_generate_items::Preprocessor_elsif_generate_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_GENERATE_ITEMS;
  this->setElement(element);
}
Tk_sskew::Tk_sskew(std::string element) {
  this->type = NodeType::TK_SSKEW;
  this->setElement(element);
}
Tk_new::Tk_new(std::string element) {
  this->type = NodeType::TK_NEW;
  this->setElement(element);
}
Library_source::Library_source(std::string element) {
  this->type = NodeType::LIBRARY_SOURCE;
  this->setElement(element);
}
Tk_localparam::Tk_localparam(std::string element) {
  this->type = NodeType::TK_LOCALPARAM;
  this->setElement(element);
}
Preprocessor_elsif_port_declarations_opt::
    Preprocessor_elsif_port_declarations_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_PORT_DECLARATIONS_OPT;
  this->setElement(element);
}
Tk_union::Tk_union(std::string element) {
  this->type = NodeType::TK_UNION;
  this->setElement(element);
}
Tk_showcancelled::Tk_showcancelled(std::string element) {
  this->type = NodeType::TK_SHOWCANCELLED;
  this->setElement(element);
}
Tk_wand::Tk_wand(std::string element) {
  this->type = NodeType::TK_WAND;
  this->setElement(element);
}
Dr_begin_keywords::Dr_begin_keywords(std::string element) {
  this->type = NodeType::DR_BEGIN_KEYWORDS;
  this->setElement(element);
}
Member_pattern_list::Member_pattern_list(std::string element) {
  this->type = NodeType::MEMBER_PATTERN_LIST;
  this->setElement(element);
}
Tk_strong0::Tk_strong0(std::string element) {
  this->type = NodeType::TK_STRONG0;
  this->setElement(element);
}
Analog_construct::Analog_construct(std::string element) {
  this->type = NodeType::ANALOG_CONSTRUCT;
  this->setElement(element);
}
Tk_wreal::Tk_wreal(std::string element) {
  this->type = NodeType::TK_WREAL;
  this->setElement(element);
}
Tk_rand::Tk_rand(std::string element) {
  this->type = NodeType::TK_RAND;
  this->setElement(element);
}
Tk_poundpound::Tk_poundpound(std::string element) {
  this->type = NodeType::TK_POUNDPOUND;
  this->setElement(element);
}
Nature_items::Nature_items(std::string element) {
  this->type = NodeType::NATURE_ITEMS;
  this->setElement(element);
}
Dr_suppress_faults::Dr_suppress_faults(std::string element) {
  this->type = NodeType::DR_SUPPRESS_FAULTS;
  this->setElement(element);
}
Tk_repeat::Tk_repeat(std::string element) {
  this->type = NodeType::TK_REPEAT;
  this->setElement(element);
}
Tk_time::Tk_time(std::string element) {
  this->type = NodeType::TK_TIME;
  this->setElement(element);
}
Dr_resetall::Dr_resetall(std::string element) {
  this->type = NodeType::DR_RESETALL;
  this->setElement(element);
}
Tk_clocking::Tk_clocking(std::string element) {
  this->type = NodeType::TK_CLOCKING;
  this->setElement(element);
}
Tk_parameter::Tk_parameter(std::string element) {
  this->type = NodeType::TK_PARAMETER;
  this->setElement(element);
}
Tk_initial::Tk_initial(std::string element) {
  this->type = NodeType::TK_INITIAL;
  this->setElement(element);
}
Tk_pulsestyle_ondetect::Tk_pulsestyle_ondetect(std::string element) {
  this->type = NodeType::TK_PULSESTYLE_ONDETECT;
  this->setElement(element);
}
Discipline_items::Discipline_items(std::string element) {
  this->type = NodeType::DISCIPLINE_ITEMS;
  this->setElement(element);
}
Tk_global::Tk_global(std::string element) {
  this->type = NodeType::TK_GLOBAL;
  this->setElement(element);
}
Dr_end_keywords::Dr_end_keywords(std::string element) {
  this->type = NodeType::DR_END_KEYWORDS;
  this->setElement(element);
}
Tk_sample::Tk_sample(std::string element) {
  this->type = NodeType::TK_SAMPLE;
  this->setElement(element);
}
Tk_unique_index::Tk_unique_index(std::string element) {
  this->type = NodeType::TK_UNIQUE_INDEX;
  this->setElement(element);
}
Tk_cmos::Tk_cmos(std::string element) {
  this->type = NodeType::TK_CMOS;
  this->setElement(element);
}
Tk_pstar::Tk_pstar(std::string element) {
  this->type = NodeType::TK_PSTAR;
  this->setElement(element);
}
Tk_extern::Tk_extern(std::string element) {
  this->type = NodeType::TK_EXTERN;
  this->setElement(element);
}
Module_attribute_foreign::Module_attribute_foreign(std::string element) {
  this->type = NodeType::MODULE_ATTRIBUTE_FOREIGN;
  this->setElement(element);
}
Tk_constraint::Tk_constraint(std::string element) {
  this->type = NodeType::TK_CONSTRAINT;
  this->setElement(element);
}
Tk_solve::Tk_solve(std::string element) {
  this->type = NodeType::TK_SOLVE;
  this->setElement(element);
}
Tk_triand::Tk_triand(std::string element) {
  this->type = NodeType::TK_TRIAND;
  this->setElement(element);
}
Tk_join_none::Tk_join_none(std::string element) {
  this->type = NodeType::TK_JOIN_NONE;
  this->setElement(element);
}
Tk_static::Tk_static(std::string element) {
  this->type = NodeType::TK_STATIC;
  this->setElement(element);
}
Pp_define::Pp_define(std::string element) {
  this->type = NodeType::PP_DEFINE;
  this->setElement(element);
}
Discipline_declaration::Discipline_declaration(std::string element) {
  this->type = NodeType::DISCIPLINE_DECLARATION;
  this->setElement(element);
}
Tk_disable::Tk_disable(std::string element) {
  this->type = NodeType::TK_DISABLE;
  this->setElement(element);
}
Tk_reverse::Tk_reverse(std::string element) {
  this->type = NodeType::TK_REVERSE;
  this->setElement(element);
}
Tk_shortreal::Tk_shortreal(std::string element) {
  this->type = NodeType::TK_SHORTREAL;
  this->setElement(element);
}
Tk_find_last_index::Tk_find_last_index(std::string element) {
  this->type = NodeType::TK_FIND_LAST_INDEX;
  this->setElement(element);
}
Tk_expect::Tk_expect(std::string element) {
  this->type = NodeType::TK_EXPECT;
  this->setElement(element);
}
Analog_statement::Analog_statement(std::string element) {
  this->type = NodeType::ANALOG_STATEMENT;
  this->setElement(element);
}
Udp_unknown_list::Udp_unknown_list(std::string element) {
  this->type = NodeType::UDP_UNKNOWN_LIST;
  this->setElement(element);
}
Tk_lbstarrb::Tk_lbstarrb(std::string element) {
  this->type = NodeType::TK_LBSTARRB;
  this->setElement(element);
}
Preprocessor_elsif_module_items::Preprocessor_elsif_module_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_MODULE_ITEMS;
  this->setElement(element);
}
Rs_case::Rs_case(std::string element) {
  this->type = NodeType::RS_CASE;
  this->setElement(element);
}
Preprocessor_balanced_class_items::Preprocessor_balanced_class_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_CLASS_ITEMS;
  this->setElement(element);
}
Named_parameter_assignment_list::Named_parameter_assignment_list(
    std::string element) {
  this->type = NodeType::NAMED_PARAMETER_ASSIGNMENT_LIST;
  this->setElement(element);
}
Rs_case_item_list::Rs_case_item_list(std::string element) {
  this->type = NodeType::RS_CASE_ITEM_LIST;
  this->setElement(element);
}
Dr_pragma::Dr_pragma(std::string element) {
  this->type = NodeType::DR_PRAGMA;
  this->setElement(element);
}
Tk_discrete::Tk_discrete(std::string element) {
  this->type = NodeType::TK_DISCRETE;
  this->setElement(element);
}
Tk_flow::Tk_flow(std::string element) {
  this->type = NodeType::TK_FLOW;
  this->setElement(element);
}
Tk_ref::Tk_ref(std::string element) {
  this->type = NodeType::TK_REF;
  this->setElement(element);
}
Preprocessor_elsif_statements::Preprocessor_elsif_statements(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_STATEMENTS;
  this->setElement(element);
}
Tk_xnor::Tk_xnor(std::string element) {
  this->type = NodeType::TK_XNOR;
  this->setElement(element);
}
Tk_supply1::Tk_supply1(std::string element) {
  this->type = NodeType::TK_SUPPLY1;
  this->setElement(element);
}
Tk_const::Tk_const(std::string element) {
  this->type = NodeType::TK_CONST;
  this->setElement(element);
}
Tk_local_scope::Tk_local_scope(std::string element) {
  this->type = NodeType::TK_LOCAL_SCOPE;
  this->setElement(element);
}
Tk_strong1::Tk_strong1(std::string element) {
  this->type = NodeType::TK_STRONG1;
  this->setElement(element);
}
Tk_release::Tk_release(std::string element) {
  this->type = NodeType::TK_RELEASE;
  this->setElement(element);
}
Discipline_items_opt::Discipline_items_opt(std::string element) {
  this->type = NodeType::DISCIPLINE_ITEMS_OPT;
  this->setElement(element);
}
Tk_program::Tk_program(std::string element) {
  this->type = NodeType::TK_PROGRAM;
  this->setElement(element);
}
Preprocessor_elsif_module_item::Preprocessor_elsif_module_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_MODULE_ITEM;
  this->setElement(element);
}
Preprocessor_else_statement_opt::Preprocessor_else_statement_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_STATEMENT_OPT;
  this->setElement(element);
}
Tk_always::Tk_always(std::string element) {
  this->type = NodeType::TK_ALWAYS;
  this->setElement(element);
}
Preprocessor_elsif_class_item::Preprocessor_elsif_class_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CLASS_ITEM;
  this->setElement(element);
}
Tk_table::Tk_table(std::string element) {
  this->type = NodeType::TK_TABLE;
  this->setElement(element);
}
Tk_trigger::Tk_trigger(std::string element) {
  this->type = NodeType::TK_TRIGGER;
  this->setElement(element);
}
Tk_liblist::Tk_liblist(std::string element) {
  this->type = NodeType::TK_LIBLIST;
  this->setElement(element);
}
Preprocessor_elsif_header::Preprocessor_elsif_header(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_HEADER;
  this->setElement(element);
}
Tk_pure::Tk_pure(std::string element) {
  this->type = NodeType::TK_PURE;
  this->setElement(element);
}
Tk_case::Tk_case(std::string element) {
  this->type = NodeType::TK_CASE;
  this->setElement(element);
}
Tk_shold::Tk_shold(std::string element) {
  this->type = NodeType::TK_SHOLD;
  this->setElement(element);
}
Tk_lbrarrow::Tk_lbrarrow(std::string element) {
  this->type = NodeType::TK_LBRARROW;
  this->setElement(element);
}
Tk_package::Tk_package(std::string element) {
  this->type = NodeType::TK_PACKAGE;
  this->setElement(element);
}
Tk_always_ff::Tk_always_ff(std::string element) {
  this->type = NodeType::TK_ALWAYS_FF;
  this->setElement(element);
}
Tk_filepath::Tk_filepath(std::string element) {
  this->type = NodeType::TK_FILEPATH;
  this->setElement(element);
}
Tk_colon_eq::Tk_colon_eq(std::string element) {
  this->type = NodeType::TK_COLON_EQ;
  this->setElement(element);
}
Preprocessor_elsif_config_rule_statements_opt::
    Preprocessor_elsif_config_rule_statements_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONFIG_RULE_STATEMENTS_OPT;
  this->setElement(element);
}
Tk_pulldown::Tk_pulldown(std::string element) {
  this->type = NodeType::TK_PULLDOWN;
  this->setElement(element);
}
Tk_rpmos::Tk_rpmos(std::string element) {
  this->type = NodeType::TK_RPMOS;
  this->setElement(element);
}
Preprocessor_else_generate_item_opt::Preprocessor_else_generate_item_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_GENERATE_ITEM_OPT;
  this->setElement(element);
}
Tk_bit::Tk_bit(std::string element) {
  this->type = NodeType::TK_BIT;
  this->setElement(element);
}
Tk_chandle::Tk_chandle(std::string element) {
  this->type = NodeType::TK_CHANDLE;
  this->setElement(element);
}
Preprocessor_elsif_bins_or_options_list::
    Preprocessor_elsif_bins_or_options_list(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_BINS_OR_OPTIONS_LIST;
  this->setElement(element);
}
Tk_binsof::Tk_binsof(std::string element) {
  this->type = NodeType::TK_BINSOF;
  this->setElement(element);
}
Macro_args_opt::Macro_args_opt(std::string element) {
  this->type = NodeType::MACRO_ARGS_OPT;
  this->setElement(element);
}
Tk_srecovery::Tk_srecovery(std::string element) {
  this->type = NodeType::TK_SRECOVERY;
  this->setElement(element);
}
Tk_config::Tk_config(std::string element) {
  this->type = NodeType::TK_CONFIG;
  this->setElement(element);
}
Tk_nonblocking_trigger::Tk_nonblocking_trigger(std::string element) {
  this->type = NodeType::TK_NONBLOCKING_TRIGGER;
  this->setElement(element);
}
Tk_shuffle::Tk_shuffle(std::string element) {
  this->type = NodeType::TK_SHUFFLE;
  this->setElement(element);
}
Tk_signed::Tk_signed(std::string element) {
  this->type = NodeType::TK_SIGNED;
  this->setElement(element);
}
Tk_incr::Tk_incr(std::string element) {
  this->type = NodeType::TK_INCR;
  this->setElement(element);
}
Tk_always_latch::Tk_always_latch(std::string element) {
  this->type = NodeType::TK_ALWAYS_LATCH;
  this->setElement(element);
}
Preprocessor_balanced_generate_items::Preprocessor_balanced_generate_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_GENERATE_ITEMS;
  this->setElement(element);
}
Tk_product::Tk_product(std::string element) {
  this->type = NodeType::TK_PRODUCT;
  this->setElement(element);
}
Preprocessor_else_module_item_opt::Preprocessor_else_module_item_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_MODULE_ITEM_OPT;
  this->setElement(element);
}
Tk_input::Tk_input(std::string element) {
  this->type = NodeType::TK_INPUT;
  this->setElement(element);
}
Tk_assign::Tk_assign(std::string element) {
  this->type = NodeType::TK_ASSIGN;
  this->setElement(element);
}
Preprocessor_elsif_description_items_opt::
    Preprocessor_elsif_description_items_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_DESCRIPTION_ITEMS_OPT;
  this->setElement(element);
}
Dr_delay_mode_distributed::Dr_delay_mode_distributed(std::string element) {
  this->type = NodeType::DR_DELAY_MODE_DISTRIBUTED;
  this->setElement(element);
}
Preprocessor_else_package_item::Preprocessor_else_package_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_PACKAGE_ITEM;
  this->setElement(element);
}
Bins_or_options_list_opt_pp::Bins_or_options_list_opt_pp(std::string element) {
  this->type = NodeType::BINS_OR_OPTIONS_LIST_OPT_PP;
  this->setElement(element);
}
Preprocessor_elsif_package_items_opt::Preprocessor_elsif_package_items_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_PACKAGE_ITEMS_OPT;
  this->setElement(element);
}
Tk_s_until_with::Tk_s_until_with(std::string element) {
  this->type = NodeType::TK_S_UNTIL_WITH;
  this->setElement(element);
}
Rs_case_item::Rs_case_item(std::string element) {
  this->type = NodeType::RS_CASE_ITEM;
  this->setElement(element);
}
Any_port_list_preprocessor_last_positional::
    Any_port_list_preprocessor_last_positional(std::string element) {
  this->type = NodeType::ANY_PORT_LIST_PREPROCESSOR_LAST_POSITIONAL;
  this->setElement(element);
}
Tk_ignore_bins::Tk_ignore_bins(std::string element) {
  this->type = NodeType::TK_IGNORE_BINS;
  this->setElement(element);
}
Tk_sum::Tk_sum(std::string element) {
  this->type = NodeType::TK_SUM;
  this->setElement(element);
}
Tkk_attribute::Tkk_attribute(std::string element) {
  this->type = NodeType::TKK_ATTRIBUTE;
  this->setElement(element);
}
Tk_max::Tk_max(std::string element) {
  this->type = NodeType::TK_MAX;
  this->setElement(element);
}
Preprocessor_else_constraint_block_item_opt::
    Preprocessor_else_constraint_block_item_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_CONSTRAINT_BLOCK_ITEM_OPT;
  this->setElement(element);
}
Tk_nexttime::Tk_nexttime(std::string element) {
  this->type = NodeType::TK_NEXTTIME;
  this->setElement(element);
}
Tk_sequence::Tk_sequence(std::string element) {
  this->type = NodeType::TK_SEQUENCE;
  this->setElement(element);
}
Tk_automatic::Tk_automatic(std::string element) {
  this->type = NodeType::TK_AUTOMATIC;
  this->setElement(element);
}
Preprocessor_else_statement::Preprocessor_else_statement(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_STATEMENT;
  this->setElement(element);
}
Tk_pullup::Tk_pullup(std::string element) {
  this->type = NodeType::TK_PULLUP;
  this->setElement(element);
}
Preprocessor_elsif_description_items::Preprocessor_elsif_description_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_DESCRIPTION_ITEMS;
  this->setElement(element);
}
Enum_name_list_preprocessor_last::Enum_name_list_preprocessor_last(
    std::string element) {
  this->type = NodeType::ENUM_NAME_LIST_PREPROCESSOR_LAST;
  this->setElement(element);
}
From_exclude::From_exclude(std::string element) {
  this->type = NodeType::FROM_EXCLUDE;
  this->setElement(element);
}
Tk_int::Tk_int(std::string element) {
  this->type = NodeType::TK_INT;
  this->setElement(element);
}
Tk_join::Tk_join(std::string element) {
  this->type = NodeType::TK_JOIN;
  this->setElement(element);
}
Tk_find_first_index::Tk_find_first_index(std::string element) {
  this->type = NodeType::TK_FIND_FIRST_INDEX;
  this->setElement(element);
}
Tk_implements::Tk_implements(std::string element) {
  this->type = NodeType::TK_IMPLEMENTS;
  this->setElement(element);
}
Discipline_item::Discipline_item(std::string element) {
  this->type = NodeType::DISCIPLINE_ITEM;
  this->setElement(element);
}
Block_event_expression::Block_event_expression(std::string element) {
  this->type = NodeType::BLOCK_EVENT_EXPRESSION;
  this->setElement(element);
}
Tk_discipline::Tk_discipline(std::string element) {
  this->type = NodeType::TK_DISCIPLINE;
  this->setElement(element);
}
Include_statement::Include_statement(std::string element) {
  this->type = NodeType::INCLUDE_STATEMENT;
  this->setElement(element);
}
Tk_lbstar::Tk_lbstar(std::string element) {
  this->type = NodeType::TK_LBSTAR;
  this->setElement(element);
}
Preprocessor_elsif_bins_or_options_list_opt::
    Preprocessor_elsif_bins_or_options_list_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_BINS_OR_OPTIONS_LIST_OPT;
  this->setElement(element);
}
Tk_lbeq::Tk_lbeq(std::string element) {
  this->type = NodeType::TK_LBEQ;
  this->setElement(element);
}
Tk_void::Tk_void(std::string element) {
  this->type = NodeType::TK_VOID;
  this->setElement(element);
}
Tk_exclude::Tk_exclude(std::string element) {
  this->type = NodeType::TK_EXCLUDE;
  this->setElement(element);
}
Tk_randc::Tk_randc(std::string element) {
  this->type = NodeType::TK_RANDC;
  this->setElement(element);
}
Tk_weak::Tk_weak(std::string element) {
  this->type = NodeType::TK_WEAK;
  this->setElement(element);
}
Tk_instance::Tk_instance(std::string element) {
  this->type = NodeType::TK_INSTANCE;
  this->setElement(element);
}
Tk_type_option::Tk_type_option(std::string element) {
  this->type = NodeType::TK_TYPE_OPTION;
  this->setElement(element);
}
Tk_wait::Tk_wait(std::string element) {
  this->type = NodeType::TK_WAIT;
  this->setElement(element);
}
Tk_abstol::Tk_abstol(std::string element) {
  this->type = NodeType::TK_ABSTOL;
  this->setElement(element);
}
Tk_decr::Tk_decr(std::string element) {
  this->type = NodeType::TK_DECR;
  this->setElement(element);
}
Tk_xor::Tk_xor(std::string element) {
  this->type = NodeType::TK_XOR;
  this->setElement(element);
}
Tk_timeprecision::Tk_timeprecision(std::string element) {
  this->type = NodeType::TK_TIMEPRECISION;
  this->setElement(element);
}
Dr_delay_mode_zero::Dr_delay_mode_zero(std::string element) {
  this->type = NodeType::DR_DELAY_MODE_ZERO;
  this->setElement(element);
}
Tk_find_first::Tk_find_first(std::string element) {
  this->type = NodeType::TK_FIND_FIRST;
  this->setElement(element);
}
Tk_pulsestyle_onevent::Tk_pulsestyle_onevent(std::string element) {
  this->type = NodeType::TK_PULSESTYLE_ONEVENT;
  this->setElement(element);
}
Tk_covergroup::Tk_covergroup(std::string element) {
  this->type = NodeType::TK_COVERGROUP;
  this->setElement(element);
}
Preprocessor_elsif_constraint_block_items_opt::
    Preprocessor_elsif_constraint_block_items_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONSTRAINT_BLOCK_ITEMS_OPT;
  this->setElement(element);
}
Macro_digits::Macro_digits(std::string element) {
  this->type = NodeType::MACRO_DIGITS;
  this->setElement(element);
}
Tk_units::Tk_units(std::string element) {
  this->type = NodeType::TK_UNITS;
  this->setElement(element);
}
Tk_tran::Tk_tran(std::string element) {
  this->type = NodeType::TK_TRAN;
  this->setElement(element);
}
Tk_wildcard::Tk_wildcard(std::string element) {
  this->type = NodeType::TK_WILDCARD;
  this->setElement(element);
}
Preprocessor_balanced_bins_or_options_list::
    Preprocessor_balanced_bins_or_options_list(std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_BINS_OR_OPTIONS_LIST;
  this->setElement(element);
}
Tk_final::Tk_final(std::string element) {
  this->type = NodeType::TK_FINAL;
  this->setElement(element);
}
Preprocessor_else_package_item_opt::Preprocessor_else_package_item_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_PACKAGE_ITEM_OPT;
  this->setElement(element);
}
Preprocessor_elsif_class_items::Preprocessor_elsif_class_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CLASS_ITEMS;
  this->setElement(element);
}
Any_argument_list_preprocessor_last::Any_argument_list_preprocessor_last(
    std::string element) {
  this->type = NodeType::ANY_ARGUMENT_LIST_PREPROCESSOR_LAST;
  this->setElement(element);
}
Tk_sort::Tk_sort(std::string element) {
  this->type = NodeType::TK_SORT;
  this->setElement(element);
}
Incdir_spec::Incdir_spec(std::string element) {
  this->type = NodeType::INCDIR_SPEC;
  this->setElement(element);
}
Preprocessor_if_header::Preprocessor_if_header(std::string element) {
  this->type = NodeType::PREPROCESSOR_IF_HEADER;
  this->setElement(element);
}
Dr_disable_portfaults::Dr_disable_portfaults(std::string element) {
  this->type = NodeType::DR_DISABLE_PORTFAULTS;
  this->setElement(element);
}
Tk_s_nexttime::Tk_s_nexttime(std::string element) {
  this->type = NodeType::TK_S_NEXTTIME;
  this->setElement(element);
}
Tk_with::Tk_with(std::string element) {
  this->type = NodeType::TK_WITH;
  this->setElement(element);
}
Dr_unconnected_drive::Dr_unconnected_drive(std::string element) {
  this->type = NodeType::DR_UNCONNECTED_DRIVE;
  this->setElement(element);
}
Tk_snochange::Tk_snochange(std::string element) {
  this->type = NodeType::TK_SNOCHANGE;
  this->setElement(element);
}
Macro_call_or_item::Macro_call_or_item(std::string element) {
  this->type = NodeType::MACRO_CALL_OR_ITEM;
  this->setElement(element);
}
Library_description_list_opt::Library_description_list_opt(
    std::string element) {
  this->type = NodeType::LIBRARY_DESCRIPTION_LIST_OPT;
  this->setElement(element);
}
Preprocessor_elsif_port_declaration::Preprocessor_elsif_port_declaration(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_PORT_DECLARATION;
  this->setElement(element);
}
Tk_context::Tk_context(std::string element) {
  this->type = NodeType::TK_CONTEXT;
  this->setElement(element);
}
Tk_include::Tk_include(std::string element) {
  this->type = NodeType::TK_INCLUDE;
  this->setElement(element);
}
Tk_var::Tk_var(std::string element) {
  this->type = NodeType::TK_VAR;
  this->setElement(element);
}
Preprocessor_balanced_constraint_block_item::
    Preprocessor_balanced_constraint_block_item(std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_CONSTRAINT_BLOCK_ITEM;
  this->setElement(element);
}
Tk_module::Tk_module(std::string element) {
  this->type = NodeType::TK_MODULE;
  this->setElement(element);
}
Dr_uselib::Dr_uselib(std::string element) {
  this->type = NodeType::DR_USELIB;
  this->setElement(element);
}
Constraint_declaration_package_item::Constraint_declaration_package_item(
    std::string element) {
  this->type = NodeType::CONSTRAINT_DECLARATION_PACKAGE_ITEM;
  this->setElement(element);
}
Dr_nounconnected_drive::Dr_nounconnected_drive(std::string element) {
  this->type = NodeType::DR_NOUNCONNECTED_DRIVE;
  this->setElement(element);
}
Tk_event::Tk_event(std::string element) {
  this->type = NodeType::TK_EVENT;
  this->setElement(element);
}
Tk_access::Tk_access(std::string element) {
  this->type = NodeType::TK_ACCESS;
  this->setElement(element);
}
Tk_typedef::Tk_typedef(std::string element) {
  this->type = NodeType::TK_TYPEDEF;
  this->setElement(element);
}
Library_description::Library_description(std::string element) {
  this->type = NodeType::LIBRARY_DESCRIPTION;
  this->setElement(element);
}
Preprocessor_balanced_description_items::
    Preprocessor_balanced_description_items(std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_DESCRIPTION_ITEMS;
  this->setElement(element);
}
Preprocessor_elsif_port_declarations::Preprocessor_elsif_port_declarations(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_PORT_DECLARATIONS;
  this->setElement(element);
}
Preprocessor_else_bins_or_options_opt::Preprocessor_else_bins_or_options_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_BINS_OR_OPTIONS_OPT;
  this->setElement(element);
}
Preprocessor_else_port_declarations::Preprocessor_else_port_declarations(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_PORT_DECLARATIONS;
  this->setElement(element);
}
Tk_until_with::Tk_until_with(std::string element) {
  this->type = NodeType::TK_UNTIL_WITH;
  this->setElement(element);
}
Tk_atat::Tk_atat(std::string element) {
  this->type = NodeType::TK_ATAT;
  this->setElement(element);
}
Tk_option::Tk_option(std::string element) {
  this->type = NodeType::TK_OPTION;
  this->setElement(element);
}
Tk_negedge::Tk_negedge(std::string element) {
  this->type = NodeType::TK_NEGEDGE;
  this->setElement(element);
}
Tk_until::Tk_until(std::string element) {
  this->type = NodeType::TK_UNTIL;
  this->setElement(element);
}
Tk_po_neg::Tk_po_neg(std::string element) {
  this->type = NodeType::TK_PO_NEG;
  this->setElement(element);
}
Preprocessor_balanced_config_rule_statements::
    Preprocessor_balanced_config_rule_statements(std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_CONFIG_RULE_STATEMENTS;
  this->setElement(element);
}
Member_pattern::Member_pattern(std::string element) {
  this->type = NodeType::MEMBER_PATTERN;
  this->setElement(element);
}
Tk_weak1::Tk_weak1(std::string element) {
  this->type = NodeType::TK_WEAK1;
  this->setElement(element);
}
Tk_1step::Tk_1step(std::string element) {
  this->type = NodeType::TK_1STEP;
  this->setElement(element);
}
Parameter_value_byname_list_preprocessor_last::
    Parameter_value_byname_list_preprocessor_last(std::string element) {
  this->type = NodeType::PARAMETER_VALUE_BYNAME_LIST_PREPROCESSOR_LAST;
  this->setElement(element);
}
Tk_unsigned::Tk_unsigned(std::string element) {
  this->type = NodeType::TK_UNSIGNED;
  this->setElement(element);
}
Macro_arg_opt::Macro_arg_opt(std::string element) {
  this->type = NodeType::MACRO_ARG_OPT;
  this->setElement(element);
}
Tk_tagged::Tk_tagged(std::string element) {
  this->type = NodeType::TK_TAGGED;
  this->setElement(element);
}
Tk_scope_res::Tk_scope_res(std::string element) {
  this->type = NodeType::TK_SCOPE_RES;
  this->setElement(element);
}
Dr_endprotect::Dr_endprotect(std::string element) {
  this->type = NodeType::DR_ENDPROTECT;
  this->setElement(element);
}
Dr_delay_mode_unit::Dr_delay_mode_unit(std::string element) {
  this->type = NodeType::DR_DELAY_MODE_UNIT;
  this->setElement(element);
}
Parameter_value_ranges::Parameter_value_ranges(std::string element) {
  this->type = NodeType::PARAMETER_VALUE_RANGES;
  this->setElement(element);
}
Nature_item::Nature_item(std::string element) {
  this->type = NodeType::NATURE_ITEM;
  this->setElement(element);
}
Tk_virtual::Tk_virtual(std::string element) {
  this->type = NodeType::TK_VIRTUAL;
  this->setElement(element);
}
Tk_with__covergroup::Tk_with__covergroup(std::string element) {
  this->type = NodeType::TK_WITH__COVERGROUP;
  this->setElement(element);
}
Error::Error(std::string element) {
  this->type = NodeType::ERROR;
  this->setElement(element);
}
Tk_specparam::Tk_specparam(std::string element) {
  this->type = NodeType::TK_SPECPARAM;
  this->setElement(element);
}
Tk_assume::Tk_assume(std::string element) {
  this->type = NodeType::TK_ASSUME;
  this->setElement(element);
}
Tk_uwire::Tk_uwire(std::string element) {
  this->type = NodeType::TK_UWIRE;
  this->setElement(element);
}
Tk_rtran::Tk_rtran(std::string element) {
  this->type = NodeType::TK_RTRAN;
  this->setElement(element);
}
Preprocessor_elsif_constraint_expressions_opt::
    Preprocessor_elsif_constraint_expressions_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONSTRAINT_EXPRESSIONS_OPT;
  this->setElement(element);
}
Tk_sync_accept_on::Tk_sync_accept_on(std::string element) {
  this->type = NodeType::TK_SYNC_ACCEPT_ON;
  this->setElement(element);
}
Tk_coverpoint::Tk_coverpoint(std::string element) {
  this->type = NodeType::TK_COVERPOINT;
  this->setElement(element);
}
Tk_rnmos::Tk_rnmos(std::string element) {
  this->type = NodeType::TK_RNMOS;
  this->setElement(element);
}
Tk_eventually::Tk_eventually(std::string element) {
  this->type = NodeType::TK_EVENTUALLY;
  this->setElement(element);
}
Preprocessor_else_description_item::Preprocessor_else_description_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_DESCRIPTION_ITEM;
  this->setElement(element);
}
Tk_this::Tk_this(std::string element) {
  this->type = NodeType::TK_THIS;
  this->setElement(element);
}
Tk_do::Tk_do(std::string element) {
  this->type = NodeType::TK_DO;
  this->setElement(element);
}
Tk_modport::Tk_modport(std::string element) {
  this->type = NodeType::TK_MODPORT;
  this->setElement(element);
}
Tk_soft::Tk_soft(std::string element) {
  this->type = NodeType::TK_SOFT;
  this->setElement(element);
}
Dr_default_trireg_strength::Dr_default_trireg_strength(std::string element) {
  this->type = NodeType::DR_DEFAULT_TRIREG_STRENGTH;
  this->setElement(element);
}
Tk_trireg::Tk_trireg(std::string element) {
  this->type = NodeType::TK_TRIREG;
  this->setElement(element);
}
Description_list_opt::Description_list_opt(std::string element) {
  this->type = NodeType::DESCRIPTION_LIST_OPT;
  this->setElement(element);
}
Tk_edge::Tk_edge(std::string element) {
  this->type = NodeType::TK_EDGE;
  this->setElement(element);
}
Preprocessor_elsif_statements_opt::Preprocessor_elsif_statements_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_STATEMENTS_OPT;
  this->setElement(element);
}
Case_item_expression::Case_item_expression(std::string element) {
  this->type = NodeType::CASE_ITEM_EXPRESSION;
  this->setElement(element);
}
Tk_infinite::Tk_infinite(std::string element) {
  this->type = NodeType::TK_INFINITE;
  this->setElement(element);
}
Preprocessor_else_config_rule_statement::
    Preprocessor_else_config_rule_statement(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_CONFIG_RULE_STATEMENT;
  this->setElement(element);
}
Tk_nature::Tk_nature(std::string element) {
  this->type = NodeType::TK_NATURE;
  this->setElement(element);
}
Tk_analog::Tk_analog(std::string element) {
  this->type = NodeType::TK_ANALOG;
  this->setElement(element);
}
Tk_macromodule::Tk_macromodule(std::string element) {
  this->type = NodeType::TK_MACROMODULE;
  this->setElement(element);
}
Tk_s_eventually::Tk_s_eventually(std::string element) {
  this->type = NodeType::TK_S_EVENTUALLY;
  this->setElement(element);
}
Tk_srecrem::Tk_srecrem(std::string element) {
  this->type = NodeType::TK_SRECREM;
  this->setElement(element);
}
Tk_null::Tk_null(std::string element) {
  this->type = NodeType::TK_NULL;
  this->setElement(element);
}
Tk_lp::Tk_lp(std::string element) {
  this->type = NodeType::TK_LP;
  this->setElement(element);
}
Preprocessor_else_class_item_opt::Preprocessor_else_class_item_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_CLASS_ITEM_OPT;
  this->setElement(element);
}
Named_parameter_assignment::Named_parameter_assignment(std::string element) {
  this->type = NodeType::NAMED_PARAMETER_ASSIGNMENT;
  this->setElement(element);
}
Tk_min::Tk_min(std::string element) {
  this->type = NodeType::TK_MIN;
  this->setElement(element);
}
Tk_unique0::Tk_unique0(std::string element) {
  this->type = NodeType::TK_UNIQUE0;
  this->setElement(element);
}
Tk_or::Tk_or(std::string element) {
  this->type = NodeType::TK_OR;
  this->setElement(element);
}
Tk_wone::Tk_wone(std::string element) {
  this->type = NodeType::TK_WONE;
  this->setElement(element);
}
Tk_rs::Tk_rs(std::string element) {
  this->type = NodeType::TK_RS;
  this->setElement(element);
}
Tk_find::Tk_find(std::string element) {
  this->type = NodeType::TK_FIND;
  this->setElement(element);
}
Preprocessor_elsif_config_rule_statement::
    Preprocessor_elsif_config_rule_statement(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONFIG_RULE_STATEMENT;
  this->setElement(element);
}
Tk_end::Tk_end(std::string element) {
  this->type = NodeType::TK_END;
  this->setElement(element);
}
Tk_bind::Tk_bind(std::string element) {
  this->type = NodeType::TK_BIND;
  this->setElement(element);
}
Incdir_spec_opt::Incdir_spec_opt(std::string element) {
  this->type = NodeType::INCDIR_SPEC_OPT;
  this->setElement(element);
}
Preprocessor_elsif_constraint_expressions::
    Preprocessor_elsif_constraint_expressions(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONSTRAINT_EXPRESSIONS;
  this->setElement(element);
}
Preprocessor_else_constraint_expression::
    Preprocessor_else_constraint_expression(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_CONSTRAINT_EXPRESSION;
  this->setElement(element);
}
Tk_continue::Tk_continue(std::string element) {
  this->type = NodeType::TK_CONTINUE;
  this->setElement(element);
}
Tk_cross::Tk_cross(std::string element) {
  this->type = NodeType::TK_CROSS;
  this->setElement(element);
}
Dr_timescale::Dr_timescale(std::string element) {
  this->type = NodeType::DR_TIMESCALE;
  this->setElement(element);
}
Preprocessor_elsif_constraint_block_item::
    Preprocessor_elsif_constraint_block_item(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONSTRAINT_BLOCK_ITEM;
  this->setElement(element);
}
Tk_alias::Tk_alias(std::string element) {
  this->type = NodeType::TK_ALIAS;
  this->setElement(element);
}
Preprocessor_balanced_constraint_expressions::
    Preprocessor_balanced_constraint_expressions(std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_CONSTRAINT_EXPRESSIONS;
  this->setElement(element);
}
Tk_integer::Tk_integer(std::string element) {
  this->type = NodeType::TK_INTEGER;
  this->setElement(element);
}
Tk_join_any::Tk_join_any(std::string element) {
  this->type = NodeType::TK_JOIN_ANY;
  this->setElement(element);
}
Tk_interface::Tk_interface(std::string element) {
  this->type = NodeType::TK_INTERFACE;
  this->setElement(element);
}
Tf_port_list_preprocessor_last::Tf_port_list_preprocessor_last(
    std::string element) {
  this->type = NodeType::TF_PORT_LIST_PREPROCESSOR_LAST;
  this->setElement(element);
}
Tk_export::Tk_export(std::string element) {
  this->type = NodeType::TK_EXPORT;
  this->setElement(element);
}
Preprocessor_elsif_statement::Preprocessor_elsif_statement(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_STATEMENT;
  this->setElement(element);
}
Preprocessor_else_config_rule_statement_opt::
    Preprocessor_else_config_rule_statement_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_CONFIG_RULE_STATEMENT_OPT;
  this->setElement(element);
}
Tk_nxor::Tk_nxor(std::string element) {
  this->type = NodeType::TK_NXOR;
  this->setElement(element);
}
Preprocessor_elsif_generate_items_opt::Preprocessor_elsif_generate_items_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_GENERATE_ITEMS_OPT;
  this->setElement(element);
}
Tk_supply0::Tk_supply0(std::string element) {
  this->type = NodeType::TK_SUPPLY0;
  this->setElement(element);
}
Tk_s_always::Tk_s_always(std::string element) {
  this->type = NodeType::TK_S_ALWAYS;
  this->setElement(element);
}
Tk_reg::Tk_reg(std::string element) {
  this->type = NodeType::TK_REG;
  this->setElement(element);
}
File_path_spec::File_path_spec(std::string element) {
  this->type = NodeType::FILE_PATH_SPEC;
  this->setElement(element);
}
Dr_endcelldefine::Dr_endcelldefine(std::string element) {
  this->type = NodeType::DR_ENDCELLDEFINE;
  this->setElement(element);
}
Preprocessor_list_of_ports_or_port_declarations_opt::
    Preprocessor_list_of_ports_or_port_declarations_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_LIST_OF_PORTS_OR_PORT_DECLARATIONS_OPT;
  this->setElement(element);
}
Tk_implies::Tk_implies(std::string element) {
  this->type = NodeType::TK_IMPLIES;
  this->setElement(element);
}
Tk_first_match::Tk_first_match(std::string element) {
  this->type = NodeType::TK_FIRST_MATCH;
  this->setElement(element);
}
Preprocessor_elsif_package_items::Preprocessor_elsif_package_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_PACKAGE_ITEMS;
  this->setElement(element);
}
Tk_pmos::Tk_pmos(std::string element) {
  this->type = NodeType::TK_PMOS;
  this->setElement(element);
}
Preprocessor_balanced_module_items::Preprocessor_balanced_module_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_MODULE_ITEMS;
  this->setElement(element);
}
Block_event_expr_primary::Block_event_expr_primary(std::string element) {
  this->type = NodeType::BLOCK_EVENT_EXPR_PRIMARY;
  this->setElement(element);
}
Constraint_prototype::Constraint_prototype(std::string element) {
  this->type = NodeType::CONSTRAINT_PROTOTYPE;
  this->setElement(element);
}
Tk_ls::Tk_ls(std::string element) {
  this->type = NodeType::TK_LS;
  this->setElement(element);
}
Tk_cell::Tk_cell(std::string element) {
  this->type = NodeType::TK_CELL;
  this->setElement(element);
}
Tk_weak0::Tk_weak0(std::string element) {
  this->type = NodeType::TK_WEAK0;
  this->setElement(element);
}
Dr_enable_portfaults::Dr_enable_portfaults(std::string element) {
  this->type = NodeType::DR_ENABLE_PORTFAULTS;
  this->setElement(element);
}
Tk_noshowcancelled::Tk_noshowcancelled(std::string element) {
  this->type = NodeType::TK_NOSHOWCANCELLED;
  this->setElement(element);
}
Tk_not::Tk_not(std::string element) {
  this->type = NodeType::TK_NOT;
  this->setElement(element);
}
Preprocessor_else_bins_or_options::Preprocessor_else_bins_or_options(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_BINS_OR_OPTIONS;
  this->setElement(element);
}
Tk_cover::Tk_cover(std::string element) {
  this->type = NodeType::TK_COVER;
  this->setElement(element);
}
Preprocessor_control_flow::Preprocessor_control_flow(std::string element) {
  this->type = NodeType::PREPROCESSOR_CONTROL_FLOW;
  this->setElement(element);
}
Tk_output::Tk_output(std::string element) {
  this->type = NodeType::TK_OUTPUT;
  this->setElement(element);
}
Tk_tri1::Tk_tri1(std::string element) {
  this->type = NodeType::TK_TRI1;
  this->setElement(element);
}
Tk_dotstar::Tk_dotstar(std::string element) {
  this->type = NodeType::TK_DOTSTAR;
  this->setElement(element);
}
Tk_timeunit::Tk_timeunit(std::string element) {
  this->type = NodeType::TK_TIMEUNIT;
  this->setElement(element);
}
Tk_tri::Tk_tri(std::string element) {
  this->type = NodeType::TK_TRI;
  this->setElement(element);
}
Macrocall::Macrocall(std::string element) {
  this->type = NodeType::MACROCALL;
  this->setElement(element);
}
Tk_inout::Tk_inout(std::string element) {
  this->type = NodeType::TK_INOUT;
  this->setElement(element);
}
Tk_casex::Tk_casex(std::string element) {
  this->type = NodeType::TK_CASEX;
  this->setElement(element);
}
Tk_potential::Tk_potential(std::string element) {
  this->type = NodeType::TK_POTENTIAL;
  this->setElement(element);
}
Tk_poundeqpound::Tk_poundeqpound(std::string element) {
  this->type = NodeType::TK_POUNDEQPOUND;
  this->setElement(element);
}
Tk_let::Tk_let(std::string element) {
  this->type = NodeType::TK_LET;
  this->setElement(element);
}
Dr_default_nettype::Dr_default_nettype(std::string element) {
  this->type = NodeType::DR_DEFAULT_NETTYPE;
  this->setElement(element);
}
Tk_begin::Tk_begin(std::string element) {
  this->type = NodeType::TK_BEGIN;
  this->setElement(element);
}
Tk_casez::Tk_casez(std::string element) {
  this->type = NodeType::TK_CASEZ;
  this->setElement(element);
}
Tk_nettype::Tk_nettype(std::string element) {
  this->type = NodeType::TK_NETTYPE;
  this->setElement(element);
}
Tk_pull0::Tk_pull0(std::string element) {
  this->type = NodeType::TK_PULL0;
  this->setElement(element);
}
Tk_illegal_bins::Tk_illegal_bins(std::string element) {
  this->type = NodeType::TK_ILLEGAL_BINS;
  this->setElement(element);
}
Decay_value_simple::Decay_value_simple(std::string element) {
  this->type = NodeType::DECAY_VALUE_SIMPLE;
  this->setElement(element);
}
Tk_enum::Tk_enum(std::string element) {
  this->type = NodeType::TK_ENUM;
  this->setElement(element);
}
Tk_wor::Tk_wor(std::string element) {
  this->type = NodeType::TK_WOR;
  this->setElement(element);
}
Tk_inf::Tk_inf(std::string element) {
  this->type = NodeType::TK_INF;
  this->setElement(element);
}
Tk_sroot::Tk_sroot(std::string element) {
  this->type = NodeType::TK_SROOT;
  this->setElement(element);
}
Tk_interconnect::Tk_interconnect(std::string element) {
  this->type = NodeType::TK_INTERCONNECT;
  this->setElement(element);
}
Preprocessor_balanced_package_items::Preprocessor_balanced_package_items(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_PACKAGE_ITEMS;
  this->setElement(element);
}
Tk_shortint::Tk_shortint(std::string element) {
  this->type = NodeType::TK_SHORTINT;
  this->setElement(element);
}
Tk_struct::Tk_struct(std::string element) {
  this->type = NodeType::TK_STRUCT;
  this->setElement(element);
}
Tk_break::Tk_break(std::string element) {
  this->type = NodeType::TK_BREAK;
  this->setElement(element);
}
Tk_nmos::Tk_nmos(std::string element) {
  this->type = NodeType::TK_NMOS;
  this->setElement(element);
}
Tk_string::Tk_string(std::string element) {
  this->type = NodeType::TK_STRING;
  this->setElement(element);
}
Tk_sync_reject_on::Tk_sync_reject_on(std::string element) {
  this->type = NodeType::TK_SYNC_REJECT_ON;
  this->setElement(element);
}
Tk_wire::Tk_wire(std::string element) {
  this->type = NodeType::TK_WIRE;
  this->setElement(element);
}
Tk_po_pos::Tk_po_pos(std::string element) {
  this->type = NodeType::TK_PO_POS;
  this->setElement(element);
}
Tk_return::Tk_return(std::string element) {
  this->type = NodeType::TK_RETURN;
  this->setElement(element);
}
Tk_pipearrow::Tk_pipearrow(std::string element) {
  this->type = NodeType::TK_PIPEARROW;
  this->setElement(element);
}
Preprocessor_else_description_item_opt::Preprocessor_else_description_item_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_DESCRIPTION_ITEM_OPT;
  this->setElement(element);
}
Dr_protect::Dr_protect(std::string element) {
  this->type = NodeType::DR_PROTECT;
  this->setElement(element);
}
Macrocallitem::Macrocallitem(std::string element) {
  this->type = NodeType::MACROCALLITEM;
  this->setElement(element);
}
Tk_domain::Tk_domain(std::string element) {
  this->type = NodeType::TK_DOMAIN;
  this->setElement(element);
}
Tk_stimeskew::Tk_stimeskew(std::string element) {
  this->type = NodeType::TK_STIMESKEW;
  this->setElement(element);
}
Macroarg::Macroarg(std::string element) {
  this->type = NodeType::MACROARG;
  this->setElement(element);
}
Tk_timeprecision_check::Tk_timeprecision_check(std::string element) {
  this->type = NodeType::TK_TIMEPRECISION_CHECK;
  this->setElement(element);
}
Tk_bins::Tk_bins(std::string element) {
  this->type = NodeType::TK_BINS;
  this->setElement(element);
}
Tk_deassign::Tk_deassign(std::string element) {
  this->type = NodeType::TK_DEASSIGN;
  this->setElement(element);
}
Tk_nor::Tk_nor(std::string element) {
  this->type = NodeType::TK_NOR;
  this->setElement(element);
}
Tk_packed::Tk_packed(std::string element) {
  this->type = NodeType::TK_PACKED;
  this->setElement(element);
}
Preprocessor_else_port_declarations_opt::
    Preprocessor_else_port_declarations_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_PORT_DECLARATIONS_OPT;
  this->setElement(element);
}
Tk_primitive::Tk_primitive(std::string element) {
  this->type = NodeType::TK_PRIMITIVE;
  this->setElement(element);
}
Tk_nand::Tk_nand(std::string element) {
  this->type = NodeType::TK_NAND;
  this->setElement(element);
}
Preprocessor_else_constraint_block_item::
    Preprocessor_else_constraint_block_item(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_CONSTRAINT_BLOCK_ITEM;
  this->setElement(element);
}
Tk_priority::Tk_priority(std::string element) {
  this->type = NodeType::TK_PRIORITY;
  this->setElement(element);
}
Nature_declaration::Nature_declaration(std::string element) {
  this->type = NodeType::NATURE_DECLARATION;
  this->setElement(element);
}
Preprocessor_elsif_config_rule_statements::
    Preprocessor_elsif_config_rule_statements(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONFIG_RULE_STATEMENTS;
  this->setElement(element);
}
Dr_celldefine::Dr_celldefine(std::string element) {
  this->type = NodeType::DR_CELLDEFINE;
  this->setElement(element);
}
Tk_accept_on::Tk_accept_on(std::string element) {
  this->type = NodeType::TK_ACCEPT_ON;
  this->setElement(element);
}
Tk_swidth::Tk_swidth(std::string element) {
  this->type = NodeType::TK_SWIDTH;
  this->setElement(element);
}
Tk_byte::Tk_byte(std::string element) {
  this->type = NodeType::TK_BYTE;
  this->setElement(element);
}
Tk_lbplusrb::Tk_lbplusrb(std::string element) {
  this->type = NodeType::TK_LBPLUSRB;
  this->setElement(element);
}
Tk_randsequence::Tk_randsequence(std::string element) {
  this->type = NodeType::TK_RANDSEQUENCE;
  this->setElement(element);
}
Tk_dist::Tk_dist(std::string element) {
  this->type = NodeType::TK_DIST;
  this->setElement(element);
}
Preprocessor_elsif_generate_item::Preprocessor_elsif_generate_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_GENERATE_ITEM;
  this->setElement(element);
}
Tk_continuous::Tk_continuous(std::string element) {
  this->type = NodeType::TK_CONTINUOUS;
  this->setElement(element);
}
Macrocallid::Macrocallid(std::string element) {
  this->type = NodeType::MACROCALLID;
  this->setElement(element);
}
Dr_nosuppress_faults::Dr_nosuppress_faults(std::string element) {
  this->type = NodeType::DR_NOSUPPRESS_FAULTS;
  this->setElement(element);
}
Tk_defparam::Tk_defparam(std::string element) {
  this->type = NodeType::TK_DEFPARAM;
  this->setElement(element);
}
Preprocessor_elsif_package_item::Preprocessor_elsif_package_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_PACKAGE_ITEM;
  this->setElement(element);
}
Case_item_expression_list::Case_item_expression_list(std::string element) {
  this->type = NodeType::CASE_ITEM_EXPRESSION_LIST;
  this->setElement(element);
}
Class_item_qualifier_list::Class_item_qualifier_list(std::string element) {
  this->type = NodeType::CLASS_ITEM_QUALIFIER_LIST;
  this->setElement(element);
}
Tk_assert::Tk_assert(std::string element) {
  this->type = NodeType::TK_ASSERT;
  this->setElement(element);
}
Tk_default::Tk_default(std::string element) {
  this->type = NodeType::TK_DEFAULT;
  this->setElement(element);
}
Pp_undef::Pp_undef(std::string element) {
  this->type = NodeType::PP_UNDEF;
  this->setElement(element);
}
Pp_endif::Pp_endif(std::string element) {
  this->type = NodeType::PP_ENDIF;
  this->setElement(element);
}
Tk_protected::Tk_protected(std::string element) {
  this->type = NodeType::TK_PROTECTED;
  this->setElement(element);
}
Preprocessor_elsif_constraint_expression::
    Preprocessor_elsif_constraint_expression(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONSTRAINT_EXPRESSION;
  this->setElement(element);
}
Value_range_expression::Value_range_expression(std::string element) {
  this->type = NodeType::VALUE_RANGE_EXPRESSION;
  this->setElement(element);
}
Dr_default_decay_time::Dr_default_decay_time(std::string element) {
  this->type = NodeType::DR_DEFAULT_DECAY_TIME;
  this->setElement(element);
}
Tk_library::Tk_library(std::string element) {
  this->type = NodeType::TK_LIBRARY;
  this->setElement(element);
}
Tk_local::Tk_local(std::string element) {
  this->type = NodeType::TK_LOCAL;
  this->setElement(element);
}
Tk_untyped::Tk_untyped(std::string element) {
  this->type = NodeType::TK_UNTYPED;
  this->setElement(element);
}
Tk_unique::Tk_unique(std::string element) {
  this->type = NodeType::TK_UNIQUE;
  this->setElement(element);
}
Tk_ssetuphold::Tk_ssetuphold(std::string element) {
  this->type = NodeType::TK_SSETUPHOLD;
  this->setElement(element);
}
Tk_use::Tk_use(std::string element) {
  this->type = NodeType::TK_USE;
  this->setElement(element);
}
Preprocessor_else_module_item::Preprocessor_else_module_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_MODULE_ITEM;
  this->setElement(element);
}
List_of_ports_or_port_declarations_preprocessor_last_non_ansi::
    List_of_ports_or_port_declarations_preprocessor_last_non_ansi(
        std::string element) {
  this->type =
      NodeType::LIST_OF_PORTS_OR_PORT_DECLARATIONS_PREPROCESSOR_LAST_NON_ANSI;
  this->setElement(element);
}
Tk_sfullskew::Tk_sfullskew(std::string element) {
  this->type = NodeType::TK_SFULLSKEW;
  this->setElement(element);
}
Tk_buf::Tk_buf(std::string element) {
  this->type = NodeType::TK_BUF;
  this->setElement(element);
}
Tk_property::Tk_property(std::string element) {
  this->type = NodeType::TK_PROPERTY;
  this->setElement(element);
}
Tk_pull1::Tk_pull1(std::string element) {
  this->type = NodeType::TK_PULL1;
  this->setElement(element);
}
Tk_speriod::Tk_speriod(std::string element) {
  this->type = NodeType::TK_SPERIOD;
  this->setElement(element);
}
Preprocessor_else_constraint_expression_opt::
    Preprocessor_else_constraint_expression_opt(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_CONSTRAINT_EXPRESSION_OPT;
  this->setElement(element);
}
Select_dimensions::Select_dimensions(std::string element) {
  this->type = NodeType::SELECT_DIMENSIONS;
  this->setElement(element);
}
Preprocessor_elsif_module_items_opt::Preprocessor_elsif_module_items_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_MODULE_ITEMS_OPT;
  this->setElement(element);
}
Tk_timeunit_check::Tk_timeunit_check(std::string element) {
  this->type = NodeType::TK_TIMEUNIT_CHECK;
  this->setElement(element);
}
Parameter_value_range::Parameter_value_range(std::string element) {
  this->type = NodeType::PARAMETER_VALUE_RANGE;
  this->setElement(element);
}
Tk_extends::Tk_extends(std::string element) {
  this->type = NodeType::TK_EXTENDS;
  this->setElement(element);
}
Tk_trior::Tk_trior(std::string element) {
  this->type = NodeType::TK_TRIOR;
  this->setElement(element);
}
Tk_s_until::Tk_s_until(std::string element) {
  this->type = NodeType::TK_S_UNTIL;
  this->setElement(element);
}
Library_declaration::Library_declaration(std::string element) {
  this->type = NodeType::LIBRARY_DECLARATION;
  this->setElement(element);
}
Tk_rsort::Tk_rsort(std::string element) {
  this->type = NodeType::TK_RSORT;
  this->setElement(element);
}
Tk_posedge::Tk_posedge(std::string element) {
  this->type = NodeType::TK_POSEDGE;
  this->setElement(element);
}
Tk_generate::Tk_generate(std::string element) {
  this->type = NodeType::TK_GENERATE;
  this->setElement(element);
}
Tk_design::Tk_design(std::string element) {
  this->type = NodeType::TK_DESIGN;
  this->setElement(element);
}
Tk_always_comb::Tk_always_comb(std::string element) {
  this->type = NodeType::TK_ALWAYS_COMB;
  this->setElement(element);
}
Library_description_list::Library_description_list(std::string element) {
  this->type = NodeType::LIBRARY_DESCRIPTION_LIST;
  this->setElement(element);
}
Preprocessor_else_generate_item::Preprocessor_else_generate_item(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSE_GENERATE_ITEM;
  this->setElement(element);
}
Tk_tri0::Tk_tri0(std::string element) {
  this->type = NodeType::TK_TRI0;
  this->setElement(element);
}
Preprocessor_balanced_statements::Preprocessor_balanced_statements(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_BALANCED_STATEMENTS;
  this->setElement(element);
}
Tk_real::Tk_real(std::string element) {
  this->type = NodeType::TK_REAL;
  this->setElement(element);
}
Tk_from::Tk_from(std::string element) {
  this->type = NodeType::TK_FROM;
  this->setElement(element);
}
Dr_delay_mode_path::Dr_delay_mode_path(std::string element) {
  this->type = NodeType::DR_DELAY_MODE_PATH;
  this->setElement(element);
}
Tk_randomize::Tk_randomize(std::string element) {
  this->type = NodeType::TK_RANDOMIZE;
  this->setElement(element);
}
Tk_and::Tk_and(std::string element) {
  this->type = NodeType::TK_AND;
  this->setElement(element);
}
Tk_logic::Tk_logic(std::string element) {
  this->type = NodeType::TK_LOGIC;
  this->setElement(element);
}
Tk_ddt_nature::Tk_ddt_nature(std::string element) {
  this->type = NodeType::TK_DDT_NATURE;
  this->setElement(element);
}
Preprocessor_elsif_bins_or_options::Preprocessor_elsif_bins_or_options(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_BINS_OR_OPTIONS;
  this->setElement(element);
}
Constraint_expression_list_opt::Constraint_expression_list_opt(
    std::string element) {
  this->type = NodeType::CONSTRAINT_EXPRESSION_LIST_OPT;
  this->setElement(element);
}
Declaration_extends_list::Declaration_extends_list(std::string element) {
  this->type = NodeType::DECLARATION_EXTENDS_LIST;
  this->setElement(element);
}
Pp_include::Pp_include(std::string element) {
  this->type = NodeType::PP_INCLUDE;
  this->setElement(element);
}
Tk_super::Tk_super(std::string element) {
  this->type = NodeType::TK_SUPER;
  this->setElement(element);
}
Preprocessor_elsif_constraint_block_items::
    Preprocessor_elsif_constraint_block_items(std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CONSTRAINT_BLOCK_ITEMS;
  this->setElement(element);
}
Preprocessor_elsif_class_items_opt::Preprocessor_elsif_class_items_opt(
    std::string element) {
  this->type = NodeType::PREPROCESSOR_ELSIF_CLASS_ITEMS_OPT;
  this->setElement(element);
}
Tk_poundminuspound::Tk_poundminuspound(std::string element) {
  this->type = NodeType::TK_POUNDMINUSPOUND;
  this->setElement(element);
}
Tk_reject_on::Tk_reject_on(std::string element) {
  this->type = NodeType::TK_REJECT_ON;
  this->setElement(element);
}
Tk_function::Tk_function(std::string element) {
  this->type = NodeType::TK_FUNCTION;
  this->setElement(element);
}
Tk_sunit::Tk_sunit(std::string element) {
  this->type = NodeType::TK_SUNIT;
  this->setElement(element);
}
Tk_restrict::Tk_restrict(std::string element) {
  this->type = NodeType::TK_RESTRICT;
  this->setElement(element);
}
Tk_task::Tk_task(std::string element) {
  this->type = NodeType::TK_TASK;
  this->setElement(element);
}
Tk_find_last::Tk_find_last(std::string element) {
  this->type = NodeType::TK_FIND_LAST;
  this->setElement(element);
}
Tk_sremoval::Tk_sremoval(std::string element) {
  this->type = NodeType::TK_SREMOVAL;
  this->setElement(element);
}
Tk_longint::Tk_longint(std::string element) {
  this->type = NodeType::TK_LONGINT;
  this->setElement(element);
}
Tk_type::Tk_type(std::string element) {
  this->type = NodeType::TK_TYPE;
  this->setElement(element);
}
Pd_library_syntax_begin::Pd_library_syntax_begin(std::string element) {
  this->type = NodeType::PD_LIBRARY_SYNTAX_BEGIN;
  this->setElement(element);
}
Tk_find_index::Tk_find_index(std::string element) {
  this->type = NodeType::TK_FIND_INDEX;
  this->setElement(element);
}
Tk_idt_nature::Tk_idt_nature(std::string element) {
  this->type = NodeType::TK_IDT_NATURE;
  this->setElement(element);
}
Tk_import::Tk_import(std::string element) {
  this->type = NodeType::TK_IMPORT;
  this->setElement(element);
}
Tk_colon_div::Tk_colon_div(std::string element) {
  this->type = NodeType::TK_COLON_DIV;
  this->setElement(element);
}
Block_event_or_expr::Block_event_or_expr(std::string element) {
  this->type = NodeType::BLOCK_EVENT_OR_EXPR;
  this->setElement(element);
}

ClassMap classMap = {
  {"terminal",
   [](std::string &&f) {
     return std::make_unique<Terminal>(f);
   }},
  {"sequence_delay_range_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_delay_range_expr>(f);
   }},
  {"port",
   [](std::string &&f) {
      return std::make_unique<Port>(f);
   }},
  {"specify_simple_path",
   [](std::string &&f) {
      return std::make_unique<Specify_simple_path>(f);
   }},
  {"event_control",
   [](std::string &&f) {
      return std::make_unique<Event_control>(f);
   }},
  {"string_literal",
   [](std::string &&f) {
      return std::make_unique<String_literal>(f);
   }},
  {"charge_strength_opt",
   [](std::string &&f) {
      return std::make_unique<Charge_strength_opt>(f);
   }},
  {"dpi_import_export",
   [](std::string &&f) {
      return std::make_unique<Dpi_import_export>(f);
   }},
  {"for_initialization_opt",
   [](std::string &&f) {
      return std::make_unique<For_initialization_opt>(f);
   }},
  {"list_of_port_identifiers",
   [](std::string &&f) {
      return std::make_unique<List_of_port_identifiers>(f);
   }},
  {"non_integer_type",
   [](std::string &&f) {
      return std::make_unique<Non_integer_type>(f);
   }},
  {"parameter_value_ranges_opt",
   [](std::string &&f) {
      return std::make_unique<Parameter_value_ranges_opt>(f);
   }},
  {"package_item_no_pp",
   [](std::string &&f) {
      return std::make_unique<Package_item_no_pp>(f);
   }},
  {"sequence_delay_repetition_list",
   [](std::string &&f) {
      return std::make_unique<Sequence_delay_repetition_list>(f);
   }},
  {"add_expr",
   [](std::string &&f) {
      return std::make_unique<Add_expr>(f);
   }},
  {"dpi_import_item",
   [](std::string &&f) {
      return std::make_unique<Dpi_import_item>(f);
   }},
  {"tk_realtime",
   [](std::string &&f) {
      return std::make_unique<Tk_realtime>(f);
   }},
  {"case_item",
   [](std::string &&f) {
      return std::make_unique<Case_item>(f);
   }},
  {"property_if_else_expr",
   [](std::string &&f) {
      return std::make_unique<Property_if_else_expr>(f);
   }},
  {"non_anonymous_instantiation_base",
   [](std::string &&f) {
      return std::make_unique<Non_anonymous_instantiation_base>(f);
   }},
  {"unary_expr",
   [](std::string &&f) {
      return std::make_unique<Unary_expr>(f);
   }},
  {"unary_op",
   [](std::string &&f) {
      return std::make_unique<Unary_op>(f);
   }},
  {"class_id",
   [](std::string &&f) {
      return std::make_unique<Class_id>(f);
   }},
  {"reference",
   [](std::string &&f) {
      return std::make_unique<Reference>(f);
   }},
  {"cast",
   [](std::string &&f) {
      return std::make_unique<Cast>(f);
   }},
  {"tf_variable_identifier_first",
   [](std::string &&f) {
      return std::make_unique<Tf_variable_identifier_first>(f);
   }},
  {"type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt",
   [](std::string &&f) {
      return std::make_unique<Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt>(f);
   }},
  {"type_or_id_root",
   [](std::string &&f) {
      return std::make_unique<Type_or_id_root>(f);
   }},
  {"module_or_generate_item",
   [](std::string &&f) {
      return std::make_unique<Module_or_generate_item>(f);
   }},
  {"module_parameter_port_list_trailing_comma",
   [](std::string &&f) {
      return std::make_unique<Module_parameter_port_list_trailing_comma>(f);
   }},
  {"instantiation_type",
   [](std::string &&f) {
      return std::make_unique<Instantiation_type>(f);
   }},
  {"parameters",
   [](std::string &&f) {
      return std::make_unique<Parameters>(f);
   }},
  {"reference_or_call_base",
   [](std::string &&f) {
      return std::make_unique<Reference_or_call_base>(f);
   }},
  {"param_type_followed_by_id_and_dimensions_opt",
   [](std::string &&f) {
      return std::make_unique<Param_type_followed_by_id_and_dimensions_opt>(f);
   }},
  {"structure_or_array_pattern_key",
   [](std::string &&f) {
      return std::make_unique<Structure_or_array_pattern_key>(f);
   }},
  {"parameter_assign_list",
   [](std::string &&f) {
      return std::make_unique<Parameter_assign_list>(f);
   }},
  {"defparam_assign_list",
   [](std::string &&f) {
      return std::make_unique<Defparam_assign_list>(f);
   }},
  {"generate_item_list_opt",
   [](std::string &&f) {
      return std::make_unique<Generate_item_list_opt>(f);
   }},
  {"tk_octdigits",
   [](std::string &&f) {
      return std::make_unique<Tk_octdigits>(f);
   }},
  {"sequence_expr_primary",
   [](std::string &&f) {
      return std::make_unique<Sequence_expr_primary>(f);
   }},
  {"lpvalue",
   [](std::string &&f) {
      return std::make_unique<Lpvalue>(f);
   }},
  {"label_opt",
   [](std::string &&f) {
      return std::make_unique<Label_opt>(f);
   }},
  {"escapedidentifier",
   [](std::string &&f) {
      return std::make_unique<Escapedidentifier>(f);
   }},
  {"generate_item",
   [](std::string &&f) {
      return std::make_unique<Generate_item>(f);
   }},
  {"data_type_primitive",
   [](std::string &&f) {
      return std::make_unique<Data_type_primitive>(f);
   }},
  {"spec_reference_event",
   [](std::string &&f) {
      return std::make_unique<Spec_reference_event>(f);
   }},
  {"udp_input_declaration_list",
   [](std::string &&f) {
      return std::make_unique<Udp_input_declaration_list>(f);
   }},
  {"non_port_module_item",
   [](std::string &&f) {
      return std::make_unique<Non_port_module_item>(f);
   }},
  {"list_of_ports_or_port_declarations_trailing_comma_non_ansi",
   [](std::string &&f) {
      return std::make_unique<List_of_ports_or_port_declarations_trailing_comma_non_ansi>(f);
   }},
  {"module_parameter_port_list_opt",
   [](std::string &&f) {
      return std::make_unique<Module_parameter_port_list_opt>(f);
   }},
  {"property_prefix_expr",
   [](std::string &&f) {
      return std::make_unique<Property_prefix_expr>(f);
   }},
  {"expr_primary_braces",
   [](std::string &&f) {
      return std::make_unique<Expr_primary_braces>(f);
   }},
  {"pow_expr",
   [](std::string &&f) {
      return std::make_unique<Pow_expr>(f);
   }},
  {"for_init_decl_or_assign",
   [](std::string &&f) {
      return std::make_unique<For_init_decl_or_assign>(f);
   }},
  {"udp_initial",
   [](std::string &&f) {
      return std::make_unique<Udp_initial>(f);
   }},
  {"tf_port_list_paren_opt",
   [](std::string &&f) {
      return std::make_unique<Tf_port_list_paren_opt>(f);
   }},
  {"struct_data_type",
   [](std::string &&f) {
      return std::make_unique<Struct_data_type>(f);
   }},
  {"udp_sequ_entry",
   [](std::string &&f) {
      return std::make_unique<Udp_sequ_entry>(f);
   }},
  {"net_variable_or_decl_assign",
   [](std::string &&f) {
      return std::make_unique<Net_variable_or_decl_assign>(f);
   }},
  {"parameter_value_byname_list_trailing_comma",
   [](std::string &&f) {
      return std::make_unique<Parameter_value_byname_list_trailing_comma>(f);
   }},
  {"inc_or_dec_expression",
   [](std::string &&f) {
      return std::make_unique<Inc_or_dec_expression>(f);
   }},
  {"net_type",
   [](std::string &&f) {
      return std::make_unique<Net_type>(f);
   }},
  {"select_dimensions_opt",
   [](std::string &&f) {
      return std::make_unique<Select_dimensions_opt>(f);
   }},
  {"spec_polarity",
   [](std::string &&f) {
      return std::make_unique<Spec_polarity>(f);
   }},
  {"macro_formal_parameter",
   [](std::string &&f) {
      return std::make_unique<Macro_formal_parameter>(f);
   }},
  {"structure_or_array_pattern_expression",
   [](std::string &&f) {
      return std::make_unique<Structure_or_array_pattern_expression>(f);
   }},
  {"for_step",
   [](std::string &&f) {
      return std::make_unique<For_step>(f);
   }},
  {"specparam_list",
   [](std::string &&f) {
      return std::make_unique<Specparam_list>(f);
   }},
  {"tk_binbase",
   [](std::string &&f) {
      return std::make_unique<Tk_binbase>(f);
   }},
  {"tk_stringliteral",
   [](std::string &&f) {
      return std::make_unique<Tk_stringliteral>(f);
   }},
  {"var_opt",
   [](std::string &&f) {
      return std::make_unique<Var_opt>(f);
   }},
  {"identifier_optional_unpacked_dimensions",
   [](std::string &&f) {
      return std::make_unique<Identifier_optional_unpacked_dimensions>(f);
   }},
  {"function_item_list",
   [](std::string &&f) {
      return std::make_unique<Function_item_list>(f);
   }},
  {"type_declaration",
   [](std::string &&f) {
      return std::make_unique<Type_declaration>(f);
   }},
  {"udp_body",
   [](std::string &&f) {
      return std::make_unique<Udp_body>(f);
   }},
  {"mul_expr",
   [](std::string &&f) {
      return std::make_unique<Mul_expr>(f);
   }},
  {"par_block",
   [](std::string &&f) {
      return std::make_unique<Par_block>(f);
   }},
  {"keywordidentifier",
   [](std::string &&f) {
      return std::make_unique<Keywordidentifier>(f);
   }},
  {"logeq_expr",
   [](std::string &&f) {
      return std::make_unique<Logeq_expr>(f);
   }},
  {"module_common_item",
   [](std::string &&f) {
      return std::make_unique<Module_common_item>(f);
   }},
  {"primitive_gate_instance",
   [](std::string &&f) {
      return std::make_unique<Primitive_gate_instance>(f);
   }},
  {"data_type_or_implicit",
   [](std::string &&f) {
      return std::make_unique<Data_type_or_implicit>(f);
   }},
  {"tk_octbase",
   [](std::string &&f) {
      return std::make_unique<Tk_octbase>(f);
   }},
  {"sequence_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_expr>(f);
   }},
  {"tk_hexbase",
   [](std::string &&f) {
      return std::make_unique<Tk_hexbase>(f);
   }},
  {"property_expr",
   [](std::string &&f) {
      return std::make_unique<Property_expr>(f);
   }},
  {"seq_block",
   [](std::string &&f) {
      return std::make_unique<Seq_block>(f);
   }},
  {"task_item",
   [](std::string &&f) {
      return std::make_unique<Task_item>(f);
   }},
  {"data_type_or_implicit_basic_followed_by_id_and_dimensions_opt",
   [](std::string &&f) {
      return std::make_unique<Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt>(f);
   }},
  {"specify_block",
   [](std::string &&f) {
      return std::make_unique<Specify_block>(f);
   }},
  {"tk_decnumber",
   [](std::string &&f) {
      return std::make_unique<Tk_decnumber>(f);
   }},
  {"tk_decbase",
   [](std::string &&f) {
      return std::make_unique<Tk_decbase>(f);
   }},
  {"property_implication_expr",
   [](std::string &&f) {
      return std::make_unique<Property_implication_expr>(f);
   }},
  {"bit_logic_opt",
   [](std::string &&f) {
      return std::make_unique<Bit_logic_opt>(f);
   }},
  {"integer_atom_type",
   [](std::string &&f) {
      return std::make_unique<Integer_atom_type>(f);
   }},
  {"lifetime",
   [](std::string &&f) {
      return std::make_unique<Lifetime>(f);
   }},
  {"any_argument_list",
   [](std::string &&f) {
      return std::make_unique<Any_argument_list>(f);
   }},
  {"delay_value_list",
   [](std::string &&f) {
      return std::make_unique<Delay_value_list>(f);
   }},
  {"module_port_declaration",
   [](std::string &&f) {
      return std::make_unique<Module_port_declaration>(f);
   }},
  {"jump_statement",
   [](std::string &&f) {
      return std::make_unique<Jump_statement>(f);
   }},
  {"delay_value",
   [](std::string &&f) {
      return std::make_unique<Delay_value>(f);
   }},
  {"sequence_or_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_or_expr>(f);
   }},
  {"module_attribute_foreign_opt",
   [](std::string &&f) {
      return std::make_unique<Module_attribute_foreign_opt>(f);
   }},
  {"tf_port_direction_opt",
   [](std::string &&f) {
      return std::make_unique<Tf_port_direction_opt>(f);
   }},
  {"tf_port_item_expr_opt",
   [](std::string &&f) {
      return std::make_unique<Tf_port_item_expr_opt>(f);
   }},
  {"cont_assign_list",
   [](std::string &&f) {
      return std::make_unique<Cont_assign_list>(f);
   }},
  {"any_argument_list_trailing_comma",
   [](std::string &&f) {
      return std::make_unique<Any_argument_list_trailing_comma>(f);
   }},
  {"procedural_continuous_assignment",
   [](std::string &&f) {
      return std::make_unique<Procedural_continuous_assignment>(f);
   }},
  {"expression_or_dist",
   [](std::string &&f) {
      return std::make_unique<Expression_or_dist>(f);
   }},
  {"module_start",
   [](std::string &&f) {
      return std::make_unique<Module_start>(f);
   }},
  {"expr_primary_parens",
   [](std::string &&f) {
      return std::make_unique<Expr_primary_parens>(f);
   }},
  {"open_range_list",
   [](std::string &&f) {
      return std::make_unique<Open_range_list>(f);
   }},
  {"unary_prefix_expr",
   [](std::string &&f) {
      return std::make_unique<Unary_prefix_expr>(f);
   }},
  {"delay_identifier",
   [](std::string &&f) {
      return std::make_unique<Delay_identifier>(f);
   }},
  {"list_of_identifiers_unpacked_dimensions",
   [](std::string &&f) {
      return std::make_unique<List_of_identifiers_unpacked_dimensions>(f);
   }},
  {"delay_scope",
   [](std::string &&f) {
      return std::make_unique<Delay_scope>(f);
   }},
  {"action_block",
   [](std::string &&f) {
      return std::make_unique<Action_block>(f);
   }},
  {"trailing_assign_opt",
   [](std::string &&f) {
      return std::make_unique<Trailing_assign_opt>(f);
   }},
  {"class_item",
   [](std::string &&f) {
      return std::make_unique<Class_item>(f);
   }},
  {"enum_name_list_trailing_comma",
   [](std::string &&f) {
      return std::make_unique<Enum_name_list_trailing_comma>(f);
   }},
  {"udp_port_list",
   [](std::string &&f) {
      return std::make_unique<Udp_port_list>(f);
   }},
  {"equiv_impl_expr",
   [](std::string &&f) {
      return std::make_unique<Equiv_impl_expr>(f);
   }},
  {"class_new",
   [](std::string &&f) {
      return std::make_unique<Class_new>(f);
   }},
  {"port_net_type",
   [](std::string &&f) {
      return std::make_unique<Port_net_type>(f);
   }},
  {"unqualified_id",
   [](std::string &&f) {
      return std::make_unique<Unqualified_id>(f);
   }},
  {"begin",
   [](std::string &&f) {
      return std::make_unique<Begin>(f);
   }},
  {"system_tf_call",
   [](std::string &&f) {
      return std::make_unique<System_tf_call>(f);
   }},
  {"parameter_value_byname_list_item_last",
   [](std::string &&f) {
      return std::make_unique<Parameter_value_byname_list_item_last>(f);
   }},
  {"conditional_generate_construct",
   [](std::string &&f) {
      return std::make_unique<Conditional_generate_construct>(f);
   }},
  {"timescale_directive",
   [](std::string &&f) {
      return std::make_unique<Timescale_directive>(f);
   }},
  {"port_expression",
   [](std::string &&f) {
      return std::make_unique<Port_expression>(f);
   }},
  {"udp_sequ_entry_list",
   [](std::string &&f) {
      return std::make_unique<Udp_sequ_entry_list>(f);
   }},
  {"symbol_or_label",
   [](std::string &&f) {
      return std::make_unique<Symbol_or_label>(f);
   }},
  {"simple_sequence_expr",
   [](std::string &&f) {
      return std::make_unique<Simple_sequence_expr>(f);
   }},
  {"systemtfidentifier",
   [](std::string &&f) {
      return std::make_unique<Systemtfidentifier>(f);
   }},
  {"tk_unbasednumber",
   [](std::string &&f) {
      return std::make_unique<Tk_unbasednumber>(f);
   }},
  {"decl_dimensions_opt",
   [](std::string &&f) {
      return std::make_unique<Decl_dimensions_opt>(f);
   }},
  {"class_items_opt",
   [](std::string &&f) {
      return std::make_unique<Class_items_opt>(f);
   }},
  {"enum_name",
   [](std::string &&f) {
      return std::make_unique<Enum_name>(f);
   }},
  {"parameter_value_opt",
   [](std::string &&f) {
      return std::make_unique<Parameter_value_opt>(f);
   }},
  {"specify_edge_path",
   [](std::string &&f) {
      return std::make_unique<Specify_edge_path>(f);
   }},
  {"implicit_class_handle",
   [](std::string &&f) {
      return std::make_unique<Implicit_class_handle>(f);
   }},
  {"module_item",
   [](std::string &&f) {
      return std::make_unique<Module_item>(f);
   }},
  {"statement_item",
   [](std::string &&f) {
      return std::make_unique<Statement_item>(f);
   }},
  {"type_identifier_followed_by_id",
   [](std::string &&f) {
      return std::make_unique<Type_identifier_followed_by_id>(f);
   }},
  {"method_prototype",
   [](std::string &&f) {
      return std::make_unique<Method_prototype>(f);
   }},
  {"tf_port_item",
   [](std::string &&f) {
      return std::make_unique<Tf_port_item>(f);
   }},
  {"block_item_or_statement_or_null_list",
   [](std::string &&f) {
      return std::make_unique<Block_item_or_statement_or_null_list>(f);
   }},
  {"endnew_opt",
   [](std::string &&f) {
      return std::make_unique<Endnew_opt>(f);
   }},
  {"specify_item_list_opt",
   [](std::string &&f) {
      return std::make_unique<Specify_item_list_opt>(f);
   }},
  {"specify_simple_path_decl",
   [](std::string &&f) {
      return std::make_unique<Specify_simple_path_decl>(f);
   }},
  {"tk_rs_eq",
   [](std::string &&f) {
      return std::make_unique<Tk_rs_eq>(f);
   }},
  {"package_import_item_list",
   [](std::string &&f) {
      return std::make_unique<Package_import_item_list>(f);
   }},
  {"udp_port_decl",
   [](std::string &&f) {
      return std::make_unique<Udp_port_decl>(f);
   }},
  {"with_exprs_suffix",
   [](std::string &&f) {
      return std::make_unique<With_exprs_suffix>(f);
   }},
  {"generate_region",
   [](std::string &&f) {
      return std::make_unique<Generate_region>(f);
   }},
  {"call_base",
   [](std::string &&f) {
      return std::make_unique<Call_base>(f);
   }},
  {"array_locator_method",
   [](std::string &&f) {
      return std::make_unique<Array_locator_method>(f);
   }},
  {"port_declaration_ansi",
   [](std::string &&f) {
      return std::make_unique<Port_declaration_ansi>(f);
   }},
  {"bitand_expr",
   [](std::string &&f) {
      return std::make_unique<Bitand_expr>(f);
   }},
  {"range_list_in_braces",
   [](std::string &&f) {
      return std::make_unique<Range_list_in_braces>(f);
   }},
  {"module_parameter_port_list_item_last",
   [](std::string &&f) {
      return std::make_unique<Module_parameter_port_list_item_last>(f);
   }},
  {"hex_based_number",
   [](std::string &&f) {
      return std::make_unique<Hex_based_number>(f);
   }},
  {"hierarchy_event_identifier",
   [](std::string &&f) {
      return std::make_unique<Hierarchy_event_identifier>(f);
   }},
  {"list_of_variable_decl_assignments",
   [](std::string &&f) {
      return std::make_unique<List_of_variable_decl_assignments>(f);
   }},
  {"random_qualifier_opt",
   [](std::string &&f) {
      return std::make_unique<Random_qualifier_opt>(f);
   }},
  {"drive_strength_opt",
   [](std::string &&f) {
      return std::make_unique<Drive_strength_opt>(f);
   }},
  {"tk_timeliteral",
   [](std::string &&f) {
      return std::make_unique<Tk_timeliteral>(f);
   }},
  {"value_range",
   [](std::string &&f) {
      return std::make_unique<Value_range>(f);
   }},
  {"expr_mintypmax_generalized",
   [](std::string &&f) {
      return std::make_unique<Expr_mintypmax_generalized>(f);
   }},
  {"polarity_operator",
   [](std::string &&f) {
      return std::make_unique<Polarity_operator>(f);
   }},
  {"package_item",
   [](std::string &&f) {
      return std::make_unique<Package_item>(f);
   }},
  {"for_initialization",
   [](std::string &&f) {
      return std::make_unique<For_initialization>(f);
   }},
  {"enum_data_type",
   [](std::string &&f) {
      return std::make_unique<Enum_data_type>(f);
   }},
  {"blocking_assignment",
   [](std::string &&f) {
      return std::make_unique<Blocking_assignment>(f);
   }},
  {"delay1",
   [](std::string &&f) {
      return std::make_unique<Delay1>(f);
   }},
  {"based_number",
   [](std::string &&f) {
      return std::make_unique<Based_number>(f);
   }},
  {"procedural_timing_control_statement",
   [](std::string &&f) {
      return std::make_unique<Procedural_timing_control_statement>(f);
   }},
  {"block_item_decl",
   [](std::string &&f) {
      return std::make_unique<Block_item_decl>(f);
   }},
  {"net_variable_or_decl_assigns",
   [](std::string &&f) {
      return std::make_unique<Net_variable_or_decl_assigns>(f);
   }},
  {"time_literal",
   [](std::string &&f) {
      return std::make_unique<Time_literal>(f);
   }},
  {"function_item_data_declaration",
   [](std::string &&f) {
      return std::make_unique<Function_item_data_declaration>(f);
   }},
  {"decl_variable_dimension",
   [](std::string &&f) {
      return std::make_unique<Decl_variable_dimension>(f);
   }},
  {"tf_port_list_opt",
   [](std::string &&f) {
      return std::make_unique<Tf_port_list_opt>(f);
   }},
  {"endfunction_label_opt",
   [](std::string &&f) {
      return std::make_unique<Endfunction_label_opt>(f);
   }},
  {"qualified_id",
   [](std::string &&f) {
      return std::make_unique<Qualified_id>(f);
   }},
  {"immediate_assertion_statement",
   [](std::string &&f) {
      return std::make_unique<Immediate_assertion_statement>(f);
   }},
  {"join_keyword",
   [](std::string &&f) {
      return std::make_unique<Join_keyword>(f);
   }},
  {"tk_bindigits",
   [](std::string &&f) {
      return std::make_unique<Tk_bindigits>(f);
   }},
  {"event_trigger",
   [](std::string &&f) {
      return std::make_unique<Event_trigger>(f);
   }},
  {"dynamic_array_new",
   [](std::string &&f) {
      return std::make_unique<Dynamic_array_new>(f);
   }},
  {"matches_expr",
   [](std::string &&f) {
      return std::make_unique<Matches_expr>(f);
   }},
  {"port_reference_list",
   [](std::string &&f) {
      return std::make_unique<Port_reference_list>(f);
   }},
  {"array_reduction_method",
   [](std::string &&f) {
      return std::make_unique<Array_reduction_method>(f);
   }},
  {"builtin_array_method",
   [](std::string &&f) {
      return std::make_unique<Builtin_array_method>(f);
   }},
  {"package_declaration",
   [](std::string &&f) {
      return std::make_unique<Package_declaration>(f);
   }},
  {"assignment_pattern_expression",
   [](std::string &&f) {
      return std::make_unique<Assignment_pattern_expression>(f);
   }},
  {"drive_strength",
   [](std::string &&f) {
      return std::make_unique<Drive_strength>(f);
   }},
  {"port_declaration_non_ansi",
   [](std::string &&f) {
      return std::make_unique<Port_declaration_non_ansi>(f);
   }},
  {"module_parameter_port_list",
   [](std::string &&f) {
      return std::make_unique<Module_parameter_port_list>(f);
   }},
  {"var_type",
   [](std::string &&f) {
      return std::make_unique<Var_type>(f);
   }},
  {"parameter_opt",
   [](std::string &&f) {
      return std::make_unique<Parameter_opt>(f);
   }},
  {"module_item_list",
   [](std::string &&f) {
      return std::make_unique<Module_item_list>(f);
   }},
  {"genericidentifier",
   [](std::string &&f) {
      return std::make_unique<Genericidentifier>(f);
   }},
  {"package_item_list_opt",
   [](std::string &&f) {
      return std::make_unique<Package_item_list_opt>(f);
   }},
  {"list_of_ports_or_port_declarations_item_last_ansi",
   [](std::string &&f) {
      return std::make_unique<List_of_ports_or_port_declarations_item_last_ansi>(f);
   }},
  {"data_type_or_implicit_followed_by_id_and_dimensions_opt",
   [](std::string &&f) {
      return std::make_unique<Data_type_or_implicit_followed_by_id_and_dimensions_opt>(f);
   }},
  {"xor_expr",
   [](std::string &&f) {
      return std::make_unique<Xor_expr>(f);
   }},
  {"dec_based_number",
   [](std::string &&f) {
      return std::make_unique<Dec_based_number>(f);
   }},
  {"loop_statement",
   [](std::string &&f) {
      return std::make_unique<Loop_statement>(f);
   }},
  {"data_declaration_or_module_instantiation",
   [](std::string &&f) {
      return std::make_unique<Data_declaration_or_module_instantiation>(f);
   }},
  {"udp_comb_entry_list",
   [](std::string &&f) {
      return std::make_unique<Udp_comb_entry_list>(f);
   }},
  {"bit_logic",
   [](std::string &&f) {
      return std::make_unique<Bit_logic>(f);
   }},
  {"reference_or_call",
   [](std::string &&f) {
      return std::make_unique<Reference_or_call>(f);
   }},
  {"local_root",
   [](std::string &&f) {
      return std::make_unique<Local_root>(f);
   }},
  {"port_direction",
   [](std::string &&f) {
      return std::make_unique<Port_direction>(f);
   }},
  {"variable_decl_assignment",
   [](std::string &&f) {
      return std::make_unique<Variable_decl_assignment>(f);
   }},
  {"specify_edge_path_decl",
   [](std::string &&f) {
      return std::make_unique<Specify_edge_path_decl>(f);
   }},
  {"function_prototype",
   [](std::string &&f) {
      return std::make_unique<Function_prototype>(f);
   }},
  {"sequence_within_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_within_expr>(f);
   }},
  {"expr_primary_no_groups",
   [](std::string &&f) {
      return std::make_unique<Expr_primary_no_groups>(f);
   }},
  {"parameter_value_byname",
   [](std::string &&f) {
      return std::make_unique<Parameter_value_byname>(f);
   }},
  {"case_any",
   [](std::string &&f) {
      return std::make_unique<Case_any>(f);
   }},
  {"spec_notifier",
   [](std::string &&f) {
      return std::make_unique<Spec_notifier>(f);
   }},
  {"block_item_or_statement_or_null",
   [](std::string &&f) {
      return std::make_unique<Block_item_or_statement_or_null>(f);
   }},
  {"specify_item",
   [](std::string &&f) {
      return std::make_unique<Specify_item>(f);
   }},
  {"any_param_declaration",
   [](std::string &&f) {
      return std::make_unique<Any_param_declaration>(f);
   }},
  {"tf_port_list_trailing_comma",
   [](std::string &&f) {
      return std::make_unique<Tf_port_list_trailing_comma>(f);
   }},
  {"struct_union_member",
   [](std::string &&f) {
      return std::make_unique<Struct_union_member>(f);
   }},
  {"any_port_list_positional",
   [](std::string &&f) {
      return std::make_unique<Any_port_list_positional>(f);
   }},
  {"dir",
   [](std::string &&f) {
      return std::make_unique<Dir>(f);
   }},
  {"lifetime_opt",
   [](std::string &&f) {
      return std::make_unique<Lifetime_opt>(f);
   }},
  {"list_of_identifiers",
   [](std::string &&f) {
      return std::make_unique<List_of_identifiers>(f);
   }},
  {"edge_operator",
   [](std::string &&f) {
      return std::make_unique<Edge_operator>(f);
   }},
  {"tk_virtual_opt",
   [](std::string &&f) {
      return std::make_unique<Tk_virtual_opt>(f);
   }},
  {"timeunits_declaration",
   [](std::string &&f) {
      return std::make_unique<Timeunits_declaration>(f);
   }},
  {"tf_item_or_statement_or_null",
   [](std::string &&f) {
      return std::make_unique<Tf_item_or_statement_or_null>(f);
   }},
  {"package_import_list",
   [](std::string &&f) {
      return std::make_unique<Package_import_list>(f);
   }},
  {"expr_primary",
   [](std::string &&f) {
      return std::make_unique<Expr_primary>(f);
   }},
  {"signed_unsigned_opt",
   [](std::string &&f) {
      return std::make_unique<Signed_unsigned_opt>(f);
   }},
  {"non_anonymous_gate_instance_or_register_variable_list",
   [](std::string &&f) {
      return std::make_unique<Non_anonymous_gate_instance_or_register_variable_list>(f);
   }},
  {"udp_comb_entry",
   [](std::string &&f) {
      return std::make_unique<Udp_comb_entry>(f);
   }},
  {"delay3",
   [](std::string &&f) {
      return std::make_unique<Delay3>(f);
   }},
  {"inc_or_dec_or_primary_expr",
   [](std::string &&f) {
      return std::make_unique<Inc_or_dec_or_primary_expr>(f);
   }},
  {"procedural_assertion_statement",
   [](std::string &&f) {
      return std::make_unique<Procedural_assertion_statement>(f);
   }},
  {"struct_union_member_list",
   [](std::string &&f) {
      return std::make_unique<Struct_union_member_list>(f);
   }},
  {"comp_expr",
   [](std::string &&f) {
      return std::make_unique<Comp_expr>(f);
   }},
  {"postfix_expression",
   [](std::string &&f) {
      return std::make_unique<Postfix_expression>(f);
   }},
  {"symbolidentifier",
   [](std::string &&f) {
      return std::make_unique<Symbolidentifier>(f);
   }},
  {"udp_input_sym",
   [](std::string &&f) {
      return std::make_unique<Udp_input_sym>(f);
   }},
  {"pos_neg_number",
   [](std::string &&f) {
      return std::make_unique<Pos_neg_number>(f);
   }},
  {"specify_terminal_descriptor",
   [](std::string &&f) {
      return std::make_unique<Specify_terminal_descriptor>(f);
   }},
  {"select_variable_dimension",
   [](std::string &&f) {
      return std::make_unique<Select_variable_dimension>(f);
   }},
  {"list_of_ports_or_port_declarations_ansi",
   [](std::string &&f) {
      return std::make_unique<List_of_ports_or_port_declarations_ansi>(f);
   }},
  {"generate_case_items",
   [](std::string &&f) {
      return std::make_unique<Generate_case_items>(f);
   }},
  {"data_type_primitive_scalar",
   [](std::string &&f) {
      return std::make_unique<Data_type_primitive_scalar>(f);
   }},
  {"tf_item_or_statement_or_null_list",
   [](std::string &&f) {
      return std::make_unique<Tf_item_or_statement_or_null_list>(f);
   }},
  {"conditional_statement",
   [](std::string &&f) {
      return std::make_unique<Conditional_statement>(f);
   }},
  {"specparam_decl",
   [](std::string &&f) {
      return std::make_unique<Specparam_decl>(f);
   }},
  {"list_of_ports_or_port_declarations_non_ansi",
   [](std::string &&f) {
      return std::make_unique<List_of_ports_or_port_declarations_non_ansi>(f);
   }},
  {"statement_or_null_list",
   [](std::string &&f) {
      return std::make_unique<Statement_or_null_list>(f);
   }},
  {"task_declaration",
   [](std::string &&f) {
      return std::make_unique<Task_declaration>(f);
   }},
  {"data_declaration_base",
   [](std::string &&f) {
      return std::make_unique<Data_declaration_base>(f);
   }},
  {"any_port_list_opt",
   [](std::string &&f) {
      return std::make_unique<Any_port_list_opt>(f);
   }},
  {"macronumericwidth",
   [](std::string &&f) {
      return std::make_unique<Macronumericwidth>(f);
   }},
  {"trailing_decl_assignment_opt",
   [](std::string &&f) {
      return std::make_unique<Trailing_decl_assignment_opt>(f);
   }},
  {"gate_instance_or_register_variable",
   [](std::string &&f) {
      return std::make_unique<Gate_instance_or_register_variable>(f);
   }},
  {"bind_instantiation",
   [](std::string &&f) {
      return std::make_unique<Bind_instantiation>(f);
   }},
  {"package_import_declaration",
   [](std::string &&f) {
      return std::make_unique<Package_import_declaration>(f);
   }},
  {"module_package_import_list_opt",
   [](std::string &&f) {
      return std::make_unique<Module_package_import_list_opt>(f);
   }},
  {"structure_or_array_pattern_expression_list",
   [](std::string &&f) {
      return std::make_unique<Structure_or_array_pattern_expression_list>(f);
   }},
  {"event_expression_list",
   [](std::string &&f) {
      return std::make_unique<Event_expression_list>(f);
   }},
  {"tk_rss_eq",
   [](std::string &&f) {
      return std::make_unique<Tk_rss_eq>(f);
   }},
  {"implements_interface_list_opt",
   [](std::string &&f) {
      return std::make_unique<Implements_interface_list_opt>(f);
   }},
  {"delay3_opt",
   [](std::string &&f) {
      return std::make_unique<Delay3_opt>(f);
   }},
  {"expr_mintypmax_trans_set",
   [](std::string &&f) {
      return std::make_unique<Expr_mintypmax_trans_set>(f);
   }},
  {"statement_or_null",
   [](std::string &&f) {
      return std::make_unique<Statement_or_null>(f);
   }},
  {"enum_name_list",
   [](std::string &&f) {
      return std::make_unique<Enum_name_list>(f);
   }},
  {"sequence_unary_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_unary_expr>(f);
   }},
  {"pp_identifier",
   [](std::string &&f) {
      return std::make_unique<Pp_identifier>(f);
   }},
  {"shift_expr",
   [](std::string &&f) {
      return std::make_unique<Shift_expr>(f);
   }},
  {"oct_based_number",
   [](std::string &&f) {
      return std::make_unique<Oct_based_number>(f);
   }},
  {"hierarchy_segment",
   [](std::string &&f) {
      return std::make_unique<Hierarchy_segment>(f);
   }},
  {"nonblocking_assignment",
   [](std::string &&f) {
      return std::make_unique<Nonblocking_assignment>(f);
   }},
  {"expression_list_proper",
   [](std::string &&f) {
      return std::make_unique<Expression_list_proper>(f);
   }},
  {"generate_if",
   [](std::string &&f) {
      return std::make_unique<Generate_if>(f);
   }},
  {"function_item",
   [](std::string &&f) {
      return std::make_unique<Function_item>(f);
   }},
  {"scope_prefix",
   [](std::string &&f) {
      return std::make_unique<Scope_prefix>(f);
   }},
  {"primitive_gate_instance_list",
   [](std::string &&f) {
      return std::make_unique<Primitive_gate_instance_list>(f);
   }},
  {"simple_immediate_assertion_statement",
   [](std::string &&f) {
      return std::make_unique<Simple_immediate_assertion_statement>(f);
   }},
  {"description_list",
   [](std::string &&f) {
      return std::make_unique<Description_list>(f);
   }},
  {"dr_strength0",
   [](std::string &&f) {
      return std::make_unique<Dr_strength0>(f);
   }},
  {"unique_priority_opt",
   [](std::string &&f) {
      return std::make_unique<Unique_priority_opt>(f);
   }},
  {"specparam",
   [](std::string &&f) {
      return std::make_unique<Specparam>(f);
   }},
  {"port_expression_opt",
   [](std::string &&f) {
      return std::make_unique<Port_expression_opt>(f);
   }},
  {"cond_expr",
   [](std::string &&f) {
      return std::make_unique<Cond_expr>(f);
   }},
  {"tk_reg_opt",
   [](std::string &&f) {
      return std::make_unique<Tk_reg_opt>(f);
   }},
  {"logor_expr",
   [](std::string &&f) {
      return std::make_unique<Logor_expr>(f);
   }},
  {"delay3_or_drive_opt",
   [](std::string &&f) {
      return std::make_unique<Delay3_or_drive_opt>(f);
   }},
  {"tf_item_or_statement_or_null_list_opt",
   [](std::string &&f) {
      return std::make_unique<Tf_item_or_statement_or_null_list_opt>(f);
   }},
  {"net_decl_assign",
   [](std::string &&f) {
      return std::make_unique<Net_decl_assign>(f);
   }},
  {"always_any",
   [](std::string &&f) {
      return std::make_unique<Always_any>(f);
   }},
  {"list_of_tf_variable_identifiers",
   [](std::string &&f) {
      return std::make_unique<List_of_tf_variable_identifiers>(f);
   }},
  {"var_or_net_type_opt",
   [](std::string &&f) {
      return std::make_unique<Var_or_net_type_opt>(f);
   }},
  {"tf_port_list_item_last",
   [](std::string &&f) {
      return std::make_unique<Tf_port_list_item_last>(f);
   }},
  {"task_declaration_id",
   [](std::string &&f) {
      return std::make_unique<Task_declaration_id>(f);
   }},
  {"instantiation_base",
   [](std::string &&f) {
      return std::make_unique<Instantiation_base>(f);
   }},
  {"sequence_repetition_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_repetition_expr>(f);
   }},
  {"tk_hexdigits",
   [](std::string &&f) {
      return std::make_unique<Tk_hexdigits>(f);
   }},
  {"non_anonymous_gate_instance_or_register_variable",
   [](std::string &&f) {
      return std::make_unique<Non_anonymous_gate_instance_or_register_variable>(f);
   }},
  {"localparam_assign",
   [](std::string &&f) {
      return std::make_unique<Localparam_assign>(f);
   }},
  {"class_items",
   [](std::string &&f) {
      return std::make_unique<Class_items>(f);
   }},
  {"expression_in_parens",
   [](std::string &&f) {
      return std::make_unique<Expression_in_parens>(f);
   }},
  {"list_of_ports_or_port_declarations_trailing_comma_ansi",
   [](std::string &&f) {
      return std::make_unique<List_of_ports_or_port_declarations_trailing_comma_ansi>(f);
   }},
  {"port_reference",
   [](std::string &&f) {
      return std::make_unique<Port_reference>(f);
   }},
  {"dist_opt",
   [](std::string &&f) {
      return std::make_unique<Dist_opt>(f);
   }},
  {"caseeq_expr",
   [](std::string &&f) {
      return std::make_unique<Caseeq_expr>(f);
   }},
  {"generate_block",
   [](std::string &&f) {
      return std::make_unique<Generate_block>(f);
   }},
  {"list_of_ports_or_port_declarations_item_last_non_ansi",
   [](std::string &&f) {
      return std::make_unique<List_of_ports_or_port_declarations_item_last_non_ansi>(f);
   }},
  {"any_argument_list_item_last",
   [](std::string &&f) {
      return std::make_unique<Any_argument_list_item_last>(f);
   }},
  {"gate_instantiation",
   [](std::string &&f) {
      return std::make_unique<Gate_instantiation>(f);
   }},
  {"casting_type",
   [](std::string &&f) {
      return std::make_unique<Casting_type>(f);
   }},
  {"expr_mintypmax",
   [](std::string &&f) {
      return std::make_unique<Expr_mintypmax>(f);
   }},
  {"continuous_assign",
   [](std::string &&f) {
      return std::make_unique<Continuous_assign>(f);
   }},
  {"parameter_assign",
   [](std::string &&f) {
      return std::make_unique<Parameter_assign>(f);
   }},
  {"delay_value_simple",
   [](std::string &&f) {
      return std::make_unique<Delay_value_simple>(f);
   }},
  {"switchtype",
   [](std::string &&f) {
      return std::make_unique<Switchtype>(f);
   }},
  {"package_or_generate_item_declaration",
   [](std::string &&f) {
      return std::make_unique<Package_or_generate_item_declaration>(f);
   }},
  {"bin_based_number",
   [](std::string &&f) {
      return std::make_unique<Bin_based_number>(f);
   }},
  {"loop_generate_construct",
   [](std::string &&f) {
      return std::make_unique<Loop_generate_construct>(f);
   }},
  {"parameter_override",
   [](std::string &&f) {
      return std::make_unique<Parameter_override>(f);
   }},
  {"udp_primitive",
   [](std::string &&f) {
      return std::make_unique<Udp_primitive>(f);
   }},
  {"parameter_expr",
   [](std::string &&f) {
      return std::make_unique<Parameter_expr>(f);
   }},
  {"repeat_control",
   [](std::string &&f) {
      return std::make_unique<Repeat_control>(f);
   }},
  {"packed_signing_opt",
   [](std::string &&f) {
      return std::make_unique<Packed_signing_opt>(f);
   }},
  {"expression_or_null_list_opt",
   [](std::string &&f) {
      return std::make_unique<Expression_or_null_list_opt>(f);
   }},
  {"enum_name_list_item_last",
   [](std::string &&f) {
      return std::make_unique<Enum_name_list_item_last>(f);
   }},
  {"macro_formals_list_opt",
   [](std::string &&f) {
      return std::make_unique<Macro_formals_list_opt>(f);
   }},
  {"spec_notifier_opt",
   [](std::string &&f) {
      return std::make_unique<Spec_notifier_opt>(f);
   }},
  {"hierarchy_extension",
   [](std::string &&f) {
      return std::make_unique<Hierarchy_extension>(f);
   }},
  {"generate_item_list",
   [](std::string &&f) {
      return std::make_unique<Generate_item_list>(f);
   }},
  {"data_declaration_modifiers_opt",
   [](std::string &&f) {
      return std::make_unique<Data_declaration_modifiers_opt>(f);
   }},
  {"sequence_throughout_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_throughout_expr>(f);
   }},
  {"property_expr_or_assignment_list",
   [](std::string &&f) {
      return std::make_unique<Property_expr_or_assignment_list>(f);
   }},
  {"bitor_expr",
   [](std::string &&f) {
      return std::make_unique<Bitor_expr>(f);
   }},
  {"tf_port_list",
   [](std::string &&f) {
      return std::make_unique<Tf_port_list>(f);
   }},
  {"any_port_list_trailing_comma_named",
   [](std::string &&f) {
      return std::make_unique<Any_port_list_trailing_comma_named>(f);
   }},
  {"function_return_type_and_id",
   [](std::string &&f) {
      return std::make_unique<Function_return_type_and_id>(f);
   }},
  {"statement",
   [](std::string &&f) {
      return std::make_unique<Statement>(f);
   }},
  {"dr_strength1",
   [](std::string &&f) {
      return std::make_unique<Dr_strength1>(f);
   }},
  {"assign_modify_statement",
   [](std::string &&f) {
      return std::make_unique<Assign_modify_statement>(f);
   }},
  {"udp_port_decls",
   [](std::string &&f) {
      return std::make_unique<Udp_port_decls>(f);
   }},
  {"integer_vector_type",
   [](std::string &&f) {
      return std::make_unique<Integer_vector_type>(f);
   }},
  {"assignment_pattern",
   [](std::string &&f) {
      return std::make_unique<Assignment_pattern>(f);
   }},
  {"class_constructor",
   [](std::string &&f) {
      return std::make_unique<Class_constructor>(f);
   }},
  {"module_parameter_port",
   [](std::string &&f) {
      return std::make_unique<Module_parameter_port>(f);
   }},
  {"module_or_generate_item_declaration",
   [](std::string &&f) {
      return std::make_unique<Module_or_generate_item_declaration>(f);
   }},
  {"final_construct",
   [](std::string &&f) {
      return std::make_unique<Final_construct>(f);
   }},
  {"member_name",
   [](std::string &&f) {
      return std::make_unique<Member_name>(f);
   }},
  {"class_declaration",
   [](std::string &&f) {
      return std::make_unique<Class_declaration>(f);
   }},
  {"package_import_item",
   [](std::string &&f) {
      return std::make_unique<Package_import_item>(f);
   }},
  {"signing",
   [](std::string &&f) {
      return std::make_unique<Signing>(f);
   }},
  {"class_constructor_prototype",
   [](std::string &&f) {
      return std::make_unique<Class_constructor_prototype>(f);
   }},
  {"generate_case_item",
   [](std::string &&f) {
      return std::make_unique<Generate_case_item>(f);
   }},
  {"data_declaration",
   [](std::string &&f) {
      return std::make_unique<Data_declaration>(f);
   }},
  {"expression",
   [](std::string &&f) {
      return std::make_unique<Expression>(f);
   }},
  {"cont_assign",
   [](std::string &&f) {
      return std::make_unique<Cont_assign>(f);
   }},
  {"delay_or_event_control_opt",
   [](std::string &&f) {
      return std::make_unique<Delay_or_event_control_opt>(f);
   }},
  {"bind_directive",
   [](std::string &&f) {
      return std::make_unique<Bind_directive>(f);
   }},
  {"misc_directive",
   [](std::string &&f) {
      return std::make_unique<Misc_directive>(f);
   }},
  {"udp_initial_expr_opt",
   [](std::string &&f) {
      return std::make_unique<Udp_initial_expr_opt>(f);
   }},
  {"description",
   [](std::string &&f) {
      return std::make_unique<Description>(f);
   }},
  {"data_type_base",
   [](std::string &&f) {
      return std::make_unique<Data_type_base>(f);
   }},
  {"trailing_assign",
   [](std::string &&f) {
      return std::make_unique<Trailing_assign>(f);
   }},
  {"module_end",
   [](std::string &&f) {
      return std::make_unique<Module_end>(f);
   }},
  {"wait_statement",
   [](std::string &&f) {
      return std::make_unique<Wait_statement>(f);
   }},
  {"package_item_list",
   [](std::string &&f) {
      return std::make_unique<Package_item_list>(f);
   }},
  {"case_items",
   [](std::string &&f) {
      return std::make_unique<Case_items>(f);
   }},
  {"statement_or_null_list_opt",
   [](std::string &&f) {
      return std::make_unique<Statement_or_null_list_opt>(f);
   }},
  {"port_named",
   [](std::string &&f) {
      return std::make_unique<Port_named>(f);
   }},
  {"udp_output_sym",
   [](std::string &&f) {
      return std::make_unique<Udp_output_sym>(f);
   }},
  {"assignment_statement_no_expr",
   [](std::string &&f) {
      return std::make_unique<Assignment_statement_no_expr>(f);
   }},
  {"any_port_list_item_last_positional",
   [](std::string &&f) {
      return std::make_unique<Any_port_list_item_last_positional>(f);
   }},
  {"module_item_list_opt",
   [](std::string &&f) {
      return std::make_unique<Module_item_list_opt>(f);
   }},
  {"sequence_and_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_and_expr>(f);
   }},
  {"data_type",
   [](std::string &&f) {
      return std::make_unique<Data_type>(f);
   }},
  {"argument_list_opt",
   [](std::string &&f) {
      return std::make_unique<Argument_list_opt>(f);
   }},
  {"for_step_opt",
   [](std::string &&f) {
      return std::make_unique<For_step_opt>(f);
   }},
  {"sequence_intersect_expr",
   [](std::string &&f) {
      return std::make_unique<Sequence_intersect_expr>(f);
   }},
  {"function_declaration",
   [](std::string &&f) {
      return std::make_unique<Function_declaration>(f);
   }},
  {"net_type_or_none",
   [](std::string &&f) {
      return std::make_unique<Net_type_or_none>(f);
   }},
  {"class_declaration_extends_opt",
   [](std::string &&f) {
      return std::make_unique<Class_declaration_extends_opt>(f);
   }},
  {"boolean_abbrev_opt",
   [](std::string &&f) {
      return std::make_unique<Boolean_abbrev_opt>(f);
   }},
  {"specify_path_identifiers",
   [](std::string &&f) {
      return std::make_unique<Specify_path_identifiers>(f);
   }},
  {"tf_port_direction",
   [](std::string &&f) {
      return std::make_unique<Tf_port_direction>(f);
   }},
  {"tk_decdigits",
   [](std::string &&f) {
      return std::make_unique<Tk_decdigits>(f);
   }},
  {"end",
   [](std::string &&f) {
      return std::make_unique<End>(f);
   }},
  {"net_declaration",
   [](std::string &&f) {
      return std::make_unique<Net_declaration>(f);
   }},
  {"tk_tagged_opt",
   [](std::string &&f) {
      return std::make_unique<Tk_tagged_opt>(f);
   }},
  {"tk_xzdigits",
   [](std::string &&f) {
      return std::make_unique<Tk_xzdigits>(f);
   }},
  {"gatetype",
   [](std::string &&f) {
      return std::make_unique<Gatetype>(f);
   }},
  {"preprocess_include_argument",
   [](std::string &&f) {
      return std::make_unique<Preprocess_include_argument>(f);
   }},
  {"macro_formals_list",
   [](std::string &&f) {
      return std::make_unique<Macro_formals_list>(f);
   }},
  {"const_opt",
   [](std::string &&f) {
      return std::make_unique<Const_opt>(f);
   }},
  {"logand_expr",
   [](std::string &&f) {
      return std::make_unique<Logand_expr>(f);
   }},
  {"event_expression",
   [](std::string &&f) {
      return std::make_unique<Event_expression>(f);
   }},
  {"udp_entry_list",
   [](std::string &&f) {
      return std::make_unique<Udp_entry_list>(f);
   }},
  {"preprocessor_action",
   [](std::string &&f) {
      return std::make_unique<Preprocessor_action>(f);
   }},
  {"tf_port_declaration",
   [](std::string &&f) {
      return std::make_unique<Tf_port_declaration>(f);
   }},
  {"udp_init_opt",
   [](std::string &&f) {
      return std::make_unique<Udp_init_opt>(f);
   }},
  {"type_identifier_or_implicit_followed_by_id_and_dimensions_opt",
   [](std::string &&f) {
      return std::make_unique<Type_identifier_or_implicit_followed_by_id_and_dimensions_opt>(f);
   }},
  {"source_text",
   [](std::string &&f) {
      return std::make_unique<Source_text>(f);
   }},
  {"defparam_assign",
   [](std::string &&f) {
      return std::make_unique<Defparam_assign>(f);
   }},
  {"decl_dimensions",
   [](std::string &&f) {
      return std::make_unique<Decl_dimensions>(f);
   }},
  {"constant_dec_number",
   [](std::string &&f) {
      return std::make_unique<Constant_dec_number>(f);
   }},
  {"case_statement",
   [](std::string &&f) {
      return std::make_unique<Case_statement>(f);
   }},
  {"assignment_statement",
   [](std::string &&f) {
      return std::make_unique<Assignment_statement>(f);
   }},
  {"dpi_import_property_opt",
   [](std::string &&f) {
      return std::make_unique<Dpi_import_property_opt>(f);
   }},
  {"dpi_spec_string",
   [](std::string &&f) {
      return std::make_unique<Dpi_spec_string>(f);
   }},
  {"trailing_decl_assignment",
   [](std::string &&f) {
      return std::make_unique<Trailing_decl_assignment>(f);
   }},
  {"always_construct",
   [](std::string &&f) {
      return std::make_unique<Always_construct>(f);
   }},
  {"genvar_opt",
   [](std::string &&f) {
      return std::make_unique<Genvar_opt>(f);
   }},
  {"any_port_list_named",
   [](std::string &&f) {
      return std::make_unique<Any_port_list_named>(f);
   }},
  {"subroutine_call",
   [](std::string &&f) {
      return std::make_unique<Subroutine_call>(f);
   }},
  {"property_expr_or_assignment",
   [](std::string &&f) {
      return std::make_unique<Property_expr_or_assignment>(f);
   }},
  {"any_argument",
   [](std::string &&f) {
      return std::make_unique<Any_argument>(f);
   }},
  {"module_or_interface_declaration",
   [](std::string &&f) {
      return std::make_unique<Module_or_interface_declaration>(f);
   }},
  {"expression_opt",
   [](std::string &&f) {
      return std::make_unique<Expression_opt>(f);
   }},
  {"gate_instance_or_register_variable_list",
   [](std::string &&f) {
      return std::make_unique<Gate_instance_or_register_variable_list>(f);
   }},
  {"tk_evalstringliteral",
   [](std::string &&f) {
      return std::make_unique<Tk_evalstringliteral>(f);
   }},
  {"delay_or_event_control",
   [](std::string &&f) {
      return std::make_unique<Delay_or_event_control>(f);
   }},
  {"udp_input_list",
   [](std::string &&f) {
      return std::make_unique<Udp_input_list>(f);
   }},
  {"parameter_value_byname_list",
   [](std::string &&f) {
      return std::make_unique<Parameter_value_byname_list>(f);
   }},
  {"module_port_list_opt",
   [](std::string &&f) {
      return std::make_unique<Module_port_list_opt>(f);
   }},
  {"list_of_ports_or_port_declarations_opt",
   [](std::string &&f) {
      return std::make_unique<List_of_ports_or_port_declarations_opt>(f);
   }},
  {"any_port_list_trailing_comma_positional",
   [](std::string &&f) {
      return std::make_unique<Any_port_list_trailing_comma_positional>(f);
   }},
  {"block_item_or_statement_or_null_list_opt",
   [](std::string &&f) {
      return std::make_unique<Block_item_or_statement_or_null_list_opt>(f);
   }},
  {"genvar_declaration",
   [](std::string &&f) {
      return std::make_unique<Genvar_declaration>(f);
   }},
  {"number",
   [](std::string &&f) {
      return std::make_unique<Number>(f);
   }},
  {"specify_item_list",
   [](std::string &&f) {
      return std::make_unique<Specify_item_list>(f);
   }},
  {"tk_ls_eq",
   [](std::string &&f) {
      return std::make_unique<Tk_ls_eq>(f);
   }},
  {"tf_variable_identifier",
   [](std::string &&f) {
      return std::make_unique<Tf_variable_identifier>(f);
   }},
  {"initial_construct",
   [](std::string &&f) {
      return std::make_unique<Initial_construct>(f);
   }},
  {"localparam_assign_list",
   [](std::string &&f) {
      return std::make_unique<Localparam_assign_list>(f);
   }},
  {"disable_statement",
   [](std::string &&f) {
      return std::make_unique<Disable_statement>(f);
   }},
  {"list_of_module_item_identifiers",
   [](std::string &&f) {
      return std::make_unique<List_of_module_item_identifiers>(f);
   }},
  {"any_port_list_item_last_named",
   [](std::string &&f) {
      return std::make_unique<Any_port_list_item_last_named>(f);
   }},
  {"net_variable",
   [](std::string &&f) {
      return std::make_unique<Net_variable>(f);
   }},
  {"parameter_expr_list",
   [](std::string &&f) {
      return std::make_unique<Parameter_expr_list>(f);
   }},
  {"specparam_declaration",
   [](std::string &&f) {
      return std::make_unique<Specparam_declaration>(f);
   }},
  {"deferred_immediate_assertion_statement",
   [](std::string &&f) {
      return std::make_unique<Deferred_immediate_assertion_statement>(f);
   }},
  {"slice_size_opt",
   [](std::string &&f) {
      return std::make_unique<Slice_size_opt>(f);
   }},
  {"concurrent_assertion_item",
   [](std::string &&f) {
      return std::make_unique<Concurrent_assertion_item>(f);
   }},
  {"clocking_item_list_opt",
   [](std::string &&f) {
      return std::make_unique<Clocking_item_list_opt>(f);
   }},
  {"cycle_delay",
   [](std::string &&f) {
      return std::make_unique<Cycle_delay>(f);
   }},
  {"macroiditem",
   [](std::string &&f) {
      return std::make_unique<Macroiditem>(f);
   }},
  {"assume_property_statement",
   [](std::string &&f) {
      return std::make_unique<Assume_property_statement>(f);
   }},
  {"pull01",
   [](std::string &&f) {
      return std::make_unique<Pull01>(f);
   }},
  {"preprocessor_directive",
   [](std::string &&f) {
      return std::make_unique<Preprocessor_directive>(f);
   }},
  {"module_item_directive",
   [](std::string &&f) {
      return std::make_unique<Module_item_directive>(f);
   }},
  {"assert_property_statement",
   [](std::string &&f) {
      return std::make_unique<Assert_property_statement>(f);
   }},
  {"scope_or_if_res",
   [](std::string &&f) {
      return std::make_unique<Scope_or_if_res>(f);
   }},
  {"task_prototype",
   [](std::string &&f) {
      return std::make_unique<Task_prototype>(f);
   }},
  {"clocking_declaration",
   [](std::string &&f) {
      return std::make_unique<Clocking_declaration>(f);
   }},
  {"block_identifier_opt",
   [](std::string &&f) {
      return std::make_unique<Block_identifier_opt>(f);
   }},
  {"macroidentifier",
   [](std::string &&f) {
      return std::make_unique<Macroidentifier>(f);
   }},
  {"property_spec_disable_iff_opt",
   [](std::string &&f) {
      return std::make_unique<Property_spec_disable_iff_opt>(f);
   }},
  {"macrogenericitem",
   [](std::string &&f) {
      return std::make_unique<Macrogenericitem>(f);
   }},
  {"module_block",
   [](std::string &&f) {
      return std::make_unique<Module_block>(f);
   }},
  {"stream_expression",
   [](std::string &&f) {
      return std::make_unique<Stream_expression>(f);
   }},
  {"final_or_zero",
   [](std::string &&f) {
      return std::make_unique<Final_or_zero>(f);
   }},
  {"tk_edge_descriptor",
   [](std::string &&f) {
      return std::make_unique<Tk_edge_descriptor>(f);
   }},
  {"method_property_qualifier_list_not_starting_with_virtual",
   [](std::string &&f) {
      return std::make_unique<Method_property_qualifier_list_not_starting_with_virtual>(f);
   }},
  {"identifier_opt",
   [](std::string &&f) {
      return std::make_unique<Identifier_opt>(f);
   }},
  {"module_parameter_port_list_preprocessor_last",
   [](std::string &&f) {
      return std::make_unique<Module_parameter_port_list_preprocessor_last>(f);
   }},
  {"type_assignment",
   [](std::string &&f) {
      return std::make_unique<Type_assignment>(f);
   }},
  {"type_assignment_list",
   [](std::string &&f) {
      return std::make_unique<Type_assignment_list>(f);
   }},
  {"method_qualifier_list_opt",
   [](std::string &&f) {
      return std::make_unique<Method_qualifier_list_opt>(f);
   }},
  {"stream_operator",
   [](std::string &&f) {
      return std::make_unique<Stream_operator>(f);
   }},
  {"assertion_item",
   [](std::string &&f) {
      return std::make_unique<Assertion_item>(f);
   }},
  {"property_spec",
   [](std::string &&f) {
      return std::make_unique<Property_spec>(f);
   }},
  {"streaming_concatenation",
   [](std::string &&f) {
      return std::make_unique<Streaming_concatenation>(f);
   }},
  {"edge_descriptor_list",
   [](std::string &&f) {
      return std::make_unique<Edge_descriptor_list>(f);
   }},
  {"property_qualifier",
   [](std::string &&f) {
      return std::make_unique<Property_qualifier>(f);
   }},
  {"event_control_opt",
   [](std::string &&f) {
      return std::make_unique<Event_control_opt>(f);
   }},
  {"class_item_qualifier",
   [](std::string &&f) {
      return std::make_unique<Class_item_qualifier>(f);
   }},
  {"concurrent_assertion_statement",
   [](std::string &&f) {
      return std::make_unique<Concurrent_assertion_statement>(f);
   }},
  {"cover_property_statement",
   [](std::string &&f) {
      return std::make_unique<Cover_property_statement>(f);
   }},
  {"stream_expression_list",
   [](std::string &&f) {
      return std::make_unique<Stream_expression_list>(f);
   }},
  {"class_item_qualifier_list_opt",
   [](std::string &&f) {
      return std::make_unique<Class_item_qualifier_list_opt>(f);
   }},
   {"assertion_item_declaration",
   [](std::string &&f) {
      return std::make_unique<Assertion_item_declaration>(f);
   }},
  {"boolean_abbrev",
    [](std::string &&f) {
        return std::make_unique<Boolean_abbrev>(f);
    }},
  {"cycle_delay_range",
    [](std::string &&f) {
        return std::make_unique<Cycle_delay_range>(f);
    }},
  {"property_operator",
    [](std::string &&f) {
        return std::make_unique<Property_operator>(f);
    }},
  {"property_spec_disable_iff",
    [](std::string &&f) {
        return std::make_unique<Property_spec_disable_iff>(f);
    }},
  {"config_declaration",
    [](std::string &&f) {
        return std::make_unique<Config_declaration>(f);
    }},
  {"with_constraint_block_opt",
    [](std::string &&f) {
        return std::make_unique<With_constraint_block_opt>(f);
    }},
  {"random_qualifier",
    [](std::string &&f) {
        return std::make_unique<Random_qualifier>(f);
    }},
  {"bind_target_instance_list",
    [](std::string &&f) {
        return std::make_unique<Bind_target_instance_list>(f);
    }},
  {"hierarchy_or_call_extension",
    [](std::string &&f) {
        return std::make_unique<Hierarchy_or_call_extension>(f);
    }},
  {"clocking_item_list",
    [](std::string &&f) {
        return std::make_unique<Clocking_item_list>(f);
    }},
  {"modport_declaration",
    [](std::string &&f) {
        return std::make_unique<Modport_declaration>(f);
    }},
  {"class_constraint",
    [](std::string &&f) {
        return std::make_unique<Class_constraint>(f);
    }},
  {"net_alias",
    [](std::string &&f) {
        return std::make_unique<Net_alias>(f);
    }},
  {"type_reference",
    [](std::string &&f) {
        return std::make_unique<Type_reference>(f);
    }},
  {"method_qualifier_list",
    [](std::string &&f) {
        return std::make_unique<Method_qualifier_list>(f);
    }},
  {"interface_type",
    [](std::string &&f) {
        return std::make_unique<Interface_type>(f);
    }},
  {"package_export_declaration",
    [](std::string &&f) {
        return std::make_unique<Package_export_declaration>(f);
    }},
  {
    "random_qualifier", 
    [](std::string &&f) {
        return std::make_unique<Random_qualifier>(f);
    }},
  {"interface_opt", 
      [](std::string &&f) {
          return std::make_unique<Interface_opt>(f);
      }},
  {"data_type_or_implicit_basic_followed_by_id", 
      [](std::string &&f) {
          return std::make_unique<Data_type_or_implicit_basic_followed_by_id>(f);
      }},
  {"any_port_list_trailing_comma_positional", 
      [](std::string &&f) {
          return std::make_unique<Any_port_list_trailing_comma_positional>(f);
      }},
  {"coverage_spec_or_option_list_opt", 
      [](std::string &&f) {
          return std::make_unique<Coverage_spec_or_option_list_opt>(f);
      }},
  {"modport_item_list", 
      [](std::string &&f) {
          return std::make_unique<Modport_item_list>(f);
      }},
  {"expect_property_statement", 
      [](std::string &&f) {
          return std::make_unique<Expect_property_statement>(f);
      }},
  {"lib_cell_identifiers_opt", 
      [](std::string &&f) {
          return std::make_unique<Lib_cell_identifiers_opt>(f);
      }},
  {"sequence_port_list_in_parens_opt", 
      [](std::string &&f) {
          return std::make_unique<Sequence_port_list_in_parens_opt>(f);
      }},
  {"clocking_direction", 
      [](std::string &&f) {
          return std::make_unique<Clocking_direction>(f);
      }},
  {"goto_repetition", 
      [](std::string &&f) {
          return std::make_unique<Goto_repetition>(f);
      }},
  {"assertion_item_declaration", 
      [](std::string &&f) {
          return std::make_unique<Assertion_item_declaration>(f);
      }},
  {"constraint_block_item", 
      [](std::string &&f) {
          return std::make_unique<Constraint_block_item>(f);
      }},
  {"interface_type", 
      [](std::string &&f) {
          return std::make_unique<Interface_type>(f);
      }},
  {"any_port_list_trailing_comma_named", 
      [](std::string &&f) {
          return std::make_unique<Any_port_list_trailing_comma_named>(f);
      }},
  {"net_alias", 
      [](std::string &&f) {
          return std::make_unique<Net_alias>(f);
      }},
  {"bind_target_instance_list", 
      [](std::string &&f) {
          return std::make_unique<Bind_target_instance_list>(f);
      }},
  {"assertion_variable_declaration", 
      [](std::string &&f) {
          return std::make_unique<Assertion_variable_declaration>(f);
      }},
  {"property_operator", 
      [](std::string &&f) {
          return std::make_unique<Property_operator>(f);
      }},
  {"design_statement", 
      [](std::string &&f) {
          return std::make_unique<Design_statement>(f);
      }},
  {"sequence_declaration", 
      [](std::string &&f) {
          return std::make_unique<Sequence_declaration>(f);
      }},
  {"clocking_item", 
      [](std::string &&f) {
          return std::make_unique<Clocking_item>(f);
      }},
  {"property_port_item", 
      [](std::string &&f) {
          return std::make_unique<Property_port_item>(f);
      }},
  {"list_of_config_rule_statements", 
      [](std::string &&f) {
          return std::make_unique<List_of_config_rule_statements>(f);
      }},
  {"cycle_range", 
      [](std::string &&f) {
          return std::make_unique<Cycle_range>(f);
      }},
  {"bind_target_instance", 
      [](std::string &&f) {
          return std::make_unique<Bind_target_instance>(f);
      }},
  {"lib_cell_id", 
      [](std::string &&f) {
          return std::make_unique<Lib_cell_id>(f);
      }},
  {"property_declaration", 
      [](std::string &&f) {
          return std::make_unique<Property_declaration>(f);
      }},
  {"property_formal_type_followed_by_id", 
      [](std::string &&f) {
          return std::make_unique<Property_formal_type_followed_by_id>(f);
      }},
  {"bind_instantiation", 
      [](std::string &&f) {
          return std::make_unique<Bind_instantiation>(f);
      }},
  {"modport_simple_ports_declaration_last", 
      [](std::string &&f) {
          return std::make_unique<Modport_simple_ports_declaration_last>(f);
      }},
  {"covergroup_declaration", 
      [](std::string &&f) {
          return std::make_unique<Covergroup_declaration>(f);
      }},
  {"property_spec_disable_iff", 
      [](std::string &&f) {
          return std::make_unique<Property_spec_disable_iff>(f);
      }},
  {"cycle_delay_range", 
      [](std::string &&f) {
          return std::make_unique<Cycle_delay_range>(f);
      }},
  {"coverage_spec", 
      [](std::string &&f) {
          return std::make_unique<Coverage_spec>(f);
      }},
  {"consecutive_repetition", 
      [](std::string &&f) {
          return std::make_unique<Consecutive_repetition>(f);
      }},
  {"method_qualifier_list", 
      [](std::string &&f) {
          return std::make_unique<Method_qualifier_list>(f);
      }},
  {"boolean_abbrev", 
      [](std::string &&f) {
          return std::make_unique<Boolean_abbrev>(f);
      }},
  {"list_of_libraries_opt", 
      [](std::string &&f) {
          return std::make_unique<List_of_libraries_opt>(f);
      }},
  {"identifier_list_in_parens_opt", 
      [](std::string &&f) {
          return std::make_unique<Identifier_list_in_parens_opt>(f);
      }},
  {"list_of_clocking_decl_assign", 
      [](std::string &&f) {
          return std::make_unique<List_of_clocking_decl_assign>(f);
      }},
  {"coverage_event", 
      [](std::string &&f) {
          return std::make_unique<Coverage_event>(f);
      }},
  {"class_constraint", 
      [](std::string &&f) {
          return std::make_unique<Class_constraint>(f);
      }},
  {"config_rule_statement", 
      [](std::string &&f) {
          return std::make_unique<Config_rule_statement>(f);
      }},
  {"type_identifier_or_implicit_basic_followed_by_id", 
      [](std::string &&f) {
          return std::make_unique<Type_identifier_or_implicit_basic_followed_by_id>(f);
      }},
  {"assertion_variable_declaration_list", 
      [](std::string &&f) {
          return std::make_unique<Assertion_variable_declaration_list>(f);
      }},
  {"bind_directive", 
      [](std::string &&f) {
          return std::make_unique<Bind_directive>(f);
      }},
  {"clocking_item_list", 
      [](std::string &&f) {
          return std::make_unique<Clocking_item_list>(f);
      }},
  {"constraint_expression_no_preprocessor", 
      [](std::string &&f) {
          return std::make_unique<Constraint_expression_no_preprocessor>(f);
      }},
  {"clocking_decl_assign", 
      [](std::string &&f) {
          return std::make_unique<Clocking_decl_assign>(f);
      }},
  {"with_constraint_block", 
      [](std::string &&f) {
          return std::make_unique<With_constraint_block>(f);
      }},
  {"any_port_list_item_last_named", 
      [](std::string &&f) {
          return std::make_unique<Any_port_list_item_last_named>(f);
      }},
  {"optional_semicolon", 
      [](std::string &&f) {
          return std::make_unique<Optional_semicolon>(f);
      }},
  {"property_port_list_in_parens_opt", 
      [](std::string &&f) {
          return std::make_unique<Property_port_list_in_parens_opt>(f);
      }},
  {"package_export_declaration", 
      [](std::string &&f) {
          return std::make_unique<Package_export_declaration>(f);
      }},
  {"modport_simple_ports_declaration_begin", 
      [](std::string &&f) {
          return std::make_unique<Modport_simple_ports_declaration_begin>(f);
      }},
  {"modport_simple_port", 
      [](std::string &&f) {
          return std::make_unique<Modport_simple_port>(f);
      }},
  {"type_reference", 
      [](std::string &&f) {
          return std::make_unique<Type_reference>(f);
      }},
  {"clocking_skew_opt", 
      [](std::string &&f) {
          return std::make_unique<Clocking_skew_opt>(f);
      }},
  {"modport_declaration", 
      [](std::string &&f) {
          return std::make_unique<Modport_declaration>(f);
      }},
  {"implication_operator", 
      [](std::string &&f) {
          return std::make_unique<Implication_operator>(f);
      }},
  {"net_alias_assign_lvalue_list", 
      [](std::string &&f) {
          return std::make_unique<Net_alias_assign_lvalue_list>(f);
      }},
  {"with_constraint_block_opt", 
      [](std::string &&f) {
          return std::make_unique<With_constraint_block_opt>(f);
      }},
  {"nonconsecutive_repetition", 
      [](std::string &&f) {
          return std::make_unique<Nonconsecutive_repetition>(f);
      }},
  {"bins_or_options_list_opt", 
      [](std::string &&f) {
          return std::make_unique<Bins_or_options_list_opt>(f);
      }},
  {"sequence_port_list_opt", 
      [](std::string &&f) {
          return std::make_unique<Sequence_port_list_opt>(f);
      }},
  {"any_port_list_positional", 
      [](std::string &&f) {
          return std::make_unique<Any_port_list_positional>(f);
      }},
  {"property_port_modifiers_opt", 
      [](std::string &&f) {
          return std::make_unique<Property_port_modifiers_opt>(f);
      }},
  {"liblist_clause", 
      [](std::string &&f) {
          return std::make_unique<Liblist_clause>(f);
      }},
  {"constraint_declaration", 
      [](std::string &&f) {
          return std::make_unique<Constraint_declaration>(f);
      }},
  {"property_actual_arg_opt", 
      [](std::string &&f) {
          return std::make_unique<Property_actual_arg_opt>(f);
      }},
  {"config_declaration", 
      [](std::string &&f) {
          return std::make_unique<Config_declaration>(f);
      }},
  {"list_of_config_rule_statements_opt", 
      [](std::string &&f) {
          return std::make_unique<List_of_config_rule_statements_opt>(f);
      }},
  {"modport_ports_list", 
      [](std::string &&f) {
          return std::make_unique<Modport_ports_list>(f);
      }},
  {"gate_instance_or_register_variable_list", 
      [](std::string &&f) {
          return std::make_unique<Gate_instance_or_register_variable_list>(f);
      }},
  {"cover_point", 
      [](std::string &&f) {
          return std::make_unique<Cover_point>(f);
      }},
  {"modport_item", 
      [](std::string &&f) {
          return std::make_unique<Modport_item>(f);
      }},
  {"constraint_block_item_list_opt", 
      [](std::string &&f) {
          return std::make_unique<Constraint_block_item_list_opt>(f);
      }},
  {"lib_cell_identifiers", 
      [](std::string &&f) {
          return std::make_unique<Lib_cell_identifiers>(f);
      }},
  {"method_qualifier", 
      [](std::string &&f) {
          return std::make_unique<Method_qualifier>(f);
      }},
  {"property_port_list", 
      [](std::string &&f) {
          return std::make_unique<Property_port_list>(f);
      }},
  {"list_of_libraries", 
      [](std::string &&f) {
          return std::make_unique<List_of_libraries>(f);
      }},
  {"constraint_block_item_list", 
      [](std::string &&f) {
          return std::make_unique<Constraint_block_item_list>(f);
      }},
  {"any_port_list_named", 
      [](std::string &&f) {
          return std::make_unique<Any_port_list_named>(f);
      }},
  {"coverage_spec_or_option_list", 
      [](std::string &&f) {
          return std::make_unique<Coverage_spec_or_option_list>(f);
      }},
  {"constraint_block", 
      [](std::string &&f) {
          return std::make_unique<Constraint_block>(f);
      }},
  {"hierarchy_or_call_extension", 
      [](std::string &&f) {
          return std::make_unique<Hierarchy_or_call_extension>(f);
      }},
  {"coverage_event_opt", 
      [](std::string &&f) {
          return std::make_unique<Coverage_event_opt>(f);
      }},
  {"cycle_range_or_expr", 
      [](std::string &&f) {
          return std::make_unique<Cycle_range_or_expr>(f);
      }},
  {"coverage_spec_or_option", 
      [](std::string &&f) {
          return std::make_unique<Coverage_spec_or_option>(f);
      }},
  {"tk_static_opt",
   [](std::string &&f){
      return std::make_unique<Tk_static_opt>(f);
   }},
   {"until_operator",
    [](std::string &&f){
       return std::make_unique<Until_Operator>(f);
    }},
 {"cover_sequence_statement",
    [](std::string &&f){
       return std::make_unique<Cover_Sequence_Statement>(f);
    }},
 {"with_covergroup_expression_in_parens",
    [](std::string &&f){
       return std::make_unique<With_Covergroup_Expression_In_Parens>(f);
    }},
 {"declaration_extends_list_opt",
    [](std::string &&f){
       return std::make_unique<Declaration_Extends_List_Opt>(f);
    }},
 {"rs_if_else",
    [](std::string &&f){
       return std::make_unique<Rs_If_Else>(f);
    }},
 {"followed_by_operator",
    [](std::string &&f){
       return std::make_unique<Followed_By_Operator>(f);
    }},
 {"local_sequence_lvar_port_direction_opt",
    [](std::string &&f){
       return std::make_unique<Local_Sequence_Lvar_Port_Direction_Opt>(f);
    }},
 {"bins_expression",
    [](std::string &&f){
       return std::make_unique<Bins_Expression>(f);
    }},
 {"property_actual_arg",
    [](std::string &&f){
       return std::make_unique<Property_Actual_Arg>(f);
    }},
 {"select_expression",
    [](std::string &&f){
       return std::make_unique<Select_Expression>(f);
    }},
 {"slice_size",
    [](std::string &&f){
       return std::make_unique<Slice_Size>(f);
    }},
 {"property_case_item",
    [](std::string &&f){
       return std::make_unique<Property_Case_Item>(f);
    }},
 {"default_skew",
    [](std::string &&f){
       return std::make_unique<Default_Skew>(f);
    }},
 {"constraint_expression_list",
    [](std::string &&f){
       return std::make_unique<Constraint_Expression_List>(f);
    }},
 {"modport_clocking_declaration_begin",
    [](std::string &&f){
       return std::make_unique<Modport_Clocking_Declaration_Begin>(f);
    }},
 {"property_case_item_list",
    [](std::string &&f){
       return std::make_unique<Property_Case_Item_List>(f);
    }},
 {"randomize_call",
    [](std::string &&f){
       return std::make_unique<Randomize_Call>(f);
    }},
 {"cross_item_list",
    [](std::string &&f){
       return std::make_unique<Cross_Item_List>(f);
    }},
 {"production_item",
    [](std::string &&f){
       return std::make_unique<Production_Item>(f);
    }},
 {"data_type_or_void_with_id",
    [](std::string &&f){
       return std::make_unique<Data_Type_Or_Void_With_Id>(f);
    }},
 {"lb_star_rb",
    [](std::string &&f){
       return std::make_unique<Lb_Star_Rb>(f);
    }},
 {"modport_clocking_declaration_last",
    [](std::string &&f){
       return std::make_unique<Modport_Clocking_Declaration_Last>(f);
    }},
 {"uniqueness_constraint",
    [](std::string &&f){
       return std::make_unique<Uniqueness_Constraint>(f);
    }},
 {"any_port_list_preprocessor_last_named",
    [](std::string &&f){
       return std::make_unique<Any_Port_List_Preprocessor_Last_Named>(f);
    }},
 {"modport_tf_ports_declaration_trailing_comma",
    [](std::string &&f){
       return std::make_unique<Modport_Tf_Ports_Declaration_Trailing_Comma>(f);
    }},
 {"interface_data_declaration",
    [](std::string &&f){
       return std::make_unique<Interface_Data_Declaration>(f);
    }},
 {"method_property_qualifier",
    [](std::string &&f){
       return std::make_unique<Method_Property_Qualifier>(f);
    }},
 {"bins_or_options_list",
    [](std::string &&f){
       return std::make_unique<Bins_Or_Options_List>(f);
    }},
 {"opt_config",
    [](std::string &&f){
       return std::make_unique<Opt_Config>(f);
    }},
 {"pattern_list",
    [](std::string &&f){
       return std::make_unique<Pattern_List>(f);
    }},
 {"bins_or_options",
    [](std::string &&f){
       return std::make_unique<Bins_Or_Options>(f);
    }},
 {"pattern_opt",
    [](std::string &&f){
       return std::make_unique<Pattern_Opt>(f);
    }},
 {"interface_class_item_list",
    [](std::string &&f){
       return std::make_unique<Interface_Class_Item_List>(f);
    }},
 {"cross_body_item_list",
    [](std::string &&f){
       return std::make_unique<Cross_Body_Item_List>(f);
    }},
 {"modport_tf_ports_declaration_begin",
    [](std::string &&f){
       return std::make_unique<Modport_Tf_Ports_Declaration_Begin>(f);
    }},
 {"rs_rule_list",
    [](std::string &&f){
       return std::make_unique<Rs_Rule_List>(f);
    }},
 {"cell_clause",
    [](std::string &&f){
       return std::make_unique<Cell_Clause>(f);
    }},
 {"sequence_port_list",
    [](std::string &&f){
       return std::make_unique<Sequence_Port_List>(f);
    }},
 {"let_port_list",
    [](std::string &&f){
       return std::make_unique<Let_Port_List>(f);
    }},
 {"production_list",
    [](std::string &&f){
       return std::make_unique<Production_List>(f);
    }},
 {"rs_production_list_or_rand_join",
    [](std::string &&f){
       return std::make_unique<Rs_Production_List_Or_Rand_Join>(f);
    }},
 {"rs_code_block",
    [](std::string &&f){
       return std::make_unique<Rs_Code_Block>(f);
    }},
 {"let_declaration",
    [](std::string &&f){
       return std::make_unique<Let_Declaration>(f);
    }},
 {"expression_in_parens_opt",
    [](std::string &&f){
       return std::make_unique<Expression_In_Parens_Opt>(f);
    }},
 {"array_method_with_predicate_opt",
    [](std::string &&f){
       return std::make_unique<Array_Method_With_Predicate_Opt>(f);
    }},
 {"cross_item",
    [](std::string &&f){
       return std::make_unique<Cross_Item>(f);
    }},
 {"modport_tf_ports_declaration_last",
    [](std::string &&f){
       return std::make_unique<Modport_Tf_Ports_Declaration_Last>(f);
    }},
 {"case_pattern_item",
    [](std::string &&f){
       return std::make_unique<Case_Pattern_Item>(f);
    }},
 {"inst_clause",
    [](std::string &&f){
       return std::make_unique<Inst_Clause>(f);
    }},
 {"rs_repeat",
    [](std::string &&f){
       return std::make_unique<Rs_Repeat>(f);
    }},
 {"covergroup_expression_bracketed_opt",
    [](std::string &&f){
       return std::make_unique<Covergroup_Expression_Bracketed_Opt>(f);
    }},
 {"clocking_drive_only",
    [](std::string &&f){
       return std::make_unique<Clocking_Drive_Only>(f);
    }},
 {"constraint_primary",
    [](std::string &&f){
       return std::make_unique<Constraint_Primary>(f);
    }},
 {"constraint_expression",
    [](std::string &&f){
       return std::make_unique<Constraint_Expression>(f);
    }},
 {"tk_evalstringliteral",
    [](std::string &&f){
       return std::make_unique<Tk_Evalstringliteral>(f);
    }},
 {"sequence_match_item_list",
    [](std::string &&f){
       return std::make_unique<Sequence_Match_Item_List>(f);
    }},
 {"sequence_spec",
    [](std::string &&f){
       return std::make_unique<Sequence_Spec>(f);
    }},
 {"cover_cross",
    [](std::string &&f){
       return std::make_unique<Cover_Cross>(f);
    }},
 {"wildcard_opt",
    [](std::string &&f){
       return std::make_unique<Wildcard_Opt>(f);
    }},
 {"case_inside_items",
    [](std::string &&f){
       return std::make_unique<Case_Inside_Items>(f);
    }},
 {"modport_tf_port",
    [](std::string &&f){
       return std::make_unique<Modport_Tf_Port>(f);
    }},
 {"weight_specification",
    [](std::string &&f){
       return std::make_unique<Weight_Specification>(f);
    }},
 {"select_condition",
    [](std::string &&f){
       return std::make_unique<Select_Condition>(f);
    }},
 {"deferred_immediate_assertion_item",
    [](std::string &&f){
       return std::make_unique<Deferred_Immediate_Assertion_Item>(f);
    }},
 {"let_formal_type_followed_by_id",
    [](std::string &&f){
       return std::make_unique<Let_Formal_Type_Followed_By_Id>(f);
    }},
 {"coverage_bin_rhs",
    [](std::string &&f){
       return std::make_unique<Coverage_Bin_Rhs>(f);
    }},
 {"production_items_list",
    [](std::string &&f){
       return std::make_unique<Production_Items_List>(f);
    }},
 {"preprocessor_balanced_port_declarations",
    [](std::string &&f){
       return std::make_unique<Preprocessor_Balanced_Port_Declarations>(f);
    }},
 {"simple_type",
    [](std::string &&f){
       return std::make_unique<Simple_Type>(f);
    }},
 {"rs_production_list",
    [](std::string &&f){
       return std::make_unique<Rs_Production_List>(f);
    }},
 {"dpi_export_item",
    [](std::string &&f){
       return std::make_unique<Dpi_Export_Item>(f);
    }},
 {"production",
    [](std::string &&f){
       return std::make_unique<Production>(f);
    }},
 {"modport_clocking_declaration_trailing_comma",
    [](std::string &&f){
       return std::make_unique<Modport_Clocking_Declaration_Trailing_Comma>(f);
    }},
 {"let_port_list_in_parens_opt",
    [](std::string &&f){
       return std::make_unique<Let_Port_List_In_Parens_Opt>(f);
    }},
 {"cross_body",
    [](std::string &&f){
       return std::make_unique<Cross_Body>(f);
    }},
 {"use_clause",
    [](std::string &&f){
       return std::make_unique<Use_Clause>(f);
    }},
 {"sequence_match_item",
    [](std::string &&f){
       return std::make_unique<Sequence_Match_Item>(f);
    }},
 {"coverage_bin",
    [](std::string &&f){
       return std::make_unique<Coverage_Bin>(f);
    }},
 {"sequence_port_type_followed_by_id",
    [](std::string &&f){
       return std::make_unique<Sequence_Port_Type_Followed_By_Id>(f);
    }},
 {"interface_class_declaration",
    [](std::string &&f){
       return std::make_unique<Interface_Class_Declaration>(f);
    }},
 {"identifier_list",
    [](std::string &&f){
       return std::make_unique<Identifier_List>(f);
    }},
 {"sequence_port_item",
    [](std::string &&f){
       return std::make_unique<Sequence_Port_Item>(f);
    }},
 {"dist_item",
    [](std::string &&f){
       return std::make_unique<Dist_Item>(f);
    }},
 {"dist_weight",
    [](std::string &&f){
       return std::make_unique<Dist_Weight>(f);
    }},
 {"bins_keyword",
    [](std::string &&f){
       return std::make_unique<Bins_Keyword>(f);
    }},
 {"list_of_ports_or_port_declarations_preprocessor_last_ansi",
    [](std::string &&f){
       return std::make_unique<List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi>(f);
    }},
 {"implements_interface_list",
    [](std::string &&f){
       return std::make_unique<Implements_Interface_List>(f);
    }},
 {"let_port_item",
    [](std::string &&f){
       return std::make_unique<Let_Port_Item>(f);
    }},
 {"array_method_with_predicate",
    [](std::string &&f){
       return std::make_unique<Array_Method_With_Predicate>(f);
    }},
 {"coverage_option",
    [](std::string &&f){
       return std::make_unique<Coverage_Option>(f);
    }},
 {"constraint_set",
    [](std::string &&f){
       return std::make_unique<Constraint_Set>(f);
    }},
 {"pattern",
    [](std::string &&f){
       return std::make_unique<Pattern>(f);
    }},
 {"net_type_declaration",
    [](std::string &&f){
       return std::make_unique<Net_Type_Declaration>(f);
    }},
 {"bins_selection",
    [](std::string &&f){
       return std::make_unique<Bins_Selection>(f);
    }},
 {"expression_or_dist_list",
    [](std::string &&f){
       return std::make_unique<Expression_Or_Dist_List>(f);
    }},
 {"clocking_skew",
    [](std::string &&f){
       return std::make_unique<Clocking_Skew>(f);
    }},
 {"interface_class_item",
    [](std::string &&f){
       return std::make_unique<Interface_Class_Item>(f);
    }},
 {"sequence_expr_match_item_list",
    [](std::string &&f){
       return std::make_unique<Sequence_Expr_Match_Item_List>(f);
    }},
 {"tk_anglebracketinclude",
    [](std::string &&f){
       return std::make_unique<Tk_Anglebracketinclude>(f);
    }},
 {"interface_class_item_list_opt",
    [](std::string &&f){
       return std::make_unique<Interface_Class_Item_List_Opt>(f);
    }},
 {"import_export",
    [](std::string &&f){
       return std::make_unique<Import_Export>(f);
    }},
 {"with_covergroup_expression",
    [](std::string &&f){
       return std::make_unique<With_Covergroup_Expression>(f);
    }},
 {"constraint_primary_list",
    [](std::string &&f){
       return std::make_unique<Constraint_Primary_List>(f);
    }},
 {"property_case_statement",
    [](std::string &&f){
       return std::make_unique<Property_Case_Statement>(f);
    }},
 {"charge_strength",
    [](std::string &&f){
       return std::make_unique<Charge_Strength>(f);
    }},
 {"dpi_import_property",
    [](std::string &&f){
       return std::make_unique<Dpi_Import_Property>(f);
    }},
 {"iff_expr_opt",
    [](std::string &&f){
       return std::make_unique<Iff_Expr_Opt>(f);
    }},
 {"rs_rule",
    [](std::string &&f){
       return std::make_unique<Rs_Rule>(f);
    }},
 {"interface_class_method",
    [](std::string &&f){
       return std::make_unique<Interface_Class_Method>(f);
    }},
 {"modport_simple_ports_declaration_trailing_comma",
    [](std::string &&f){
       return std::make_unique<Modport_Simple_Ports_Declaration_Trailing_Comma>(f);
    }},
 {"case_inside_item",
    [](std::string &&f){
       return std::make_unique<Case_Inside_Item>(f);
    }},
 {"restrict_property_statement",
    [](std::string &&f){
       return std::make_unique<Restrict_Property_Statement>(f);
    }},
 {"dist_list",
    [](std::string &&f){
       return std::make_unique<Dist_List>(f);
    }},
 {"rs_prod",
    [](std::string &&f){
       return std::make_unique<Rs_Prod>(f);
    }},
 {"array_ordering_method",
    [](std::string &&f){
       return std::make_unique<Array_Ordering_Method>(f);
    }},
 {"randsequence_statement",
    [](std::string &&f){
       return std::make_unique<Randsequence_Statement>(f);
    }},
 {"cross_body_item",
    [](std::string &&f){
       return std::make_unique<Cross_Body_Item>(f);
    }},
 {"case_pattern_items",
    [](std::string &&f){
       return std::make_unique<Case_Pattern_Items>(f);
    }},
 {"cross_body_item_list_opt",
    [](std::string &&f){
       return std::make_unique<Cross_Body_Item_List_Opt>(f);
    }},
 {"modport_ports_declaration_trailing_comma",
    [](std::string &&f){
       return std::make_unique<Modport_Ports_Declaration_Trailing_Comma>(f);
    }},
 {"set_covergroup_expression_or_covergroup_range_list_or_trans_list",
    [](std::string &&f){
       return std::make_unique<Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List>(f);
    }},
    {"tk_strong",
      [](std::string &&f){
         return std::make_unique<Tk_strong>(f);
      }}
   ,
    {"preprocessor_else_class_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_class_item>(f);
      }}
   ,
    {"tk_genvar",
      [](std::string &&f){
         return std::make_unique<Tk_genvar>(f);
      }}
   ,
    {"file_path_spec_list",
      [](std::string &&f){
         return std::make_unique<File_path_spec_list>(f);
      }}
   ,
    {"preprocessor_elsif_description_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_description_item>(f);
      }}
   ,
    {"branch_probe_expression",
      [](std::string &&f){
         return std::make_unique<Branch_probe_expression>(f);
      }}
   ,
    {"tk_rcmos",
      [](std::string &&f){
         return std::make_unique<Tk_rcmos>(f);
      }}
   ,
    {"tk_pipearrow2",
      [](std::string &&f){
         return std::make_unique<Tk_pipearrow2>(f);
      }}
   ,
    {"tk_ssetup",
      [](std::string &&f){
         return std::make_unique<Tk_ssetup>(f);
      }}
   ,
    {"preprocessor_elsif_generate_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_generate_items>(f);
      }}
   ,
    {"tk_sskew",
      [](std::string &&f){
         return std::make_unique<Tk_sskew>(f);
      }}
   ,
    {"tk_new",
      [](std::string &&f){
         return std::make_unique<Tk_new>(f);
      }}
   ,
    {"library_source",
      [](std::string &&f){
         return std::make_unique<Library_source>(f);
      }}
   ,
    {"tk_localparam",
      [](std::string &&f){
         return std::make_unique<Tk_localparam>(f);
      }}
   ,
    {"preprocessor_elsif_port_declarations_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_port_declarations_opt>(f);
      }}
   ,
    {"tk_union",
      [](std::string &&f){
         return std::make_unique<Tk_union>(f);
      }}
   ,
    {"tk_showcancelled",
      [](std::string &&f){
         return std::make_unique<Tk_showcancelled>(f);
      }}
   ,
    {"tk_wand",
      [](std::string &&f){
         return std::make_unique<Tk_wand>(f);
      }}
   ,
    {"dr_begin_keywords",
      [](std::string &&f){
         return std::make_unique<Dr_begin_keywords>(f);
      }}
   ,
    {"member_pattern_list",
      [](std::string &&f){
         return std::make_unique<Member_pattern_list>(f);
      }}
   ,
    {"tk_strong0",
      [](std::string &&f){
         return std::make_unique<Tk_strong0>(f);
      }}
   ,
    {"analog_construct",
      [](std::string &&f){
         return std::make_unique<Analog_construct>(f);
      }}
   ,
    {"tk_wreal",
      [](std::string &&f){
         return std::make_unique<Tk_wreal>(f);
      }}
   ,
    {"tk_rand",
      [](std::string &&f){
         return std::make_unique<Tk_rand>(f);
      }}
   ,
    {"tk_poundpound",
      [](std::string &&f){
         return std::make_unique<Tk_poundpound>(f);
      }}
   ,
    {"nature_items",
      [](std::string &&f){
         return std::make_unique<Nature_items>(f);
      }}
   ,
    {"dr_suppress_faults",
      [](std::string &&f){
         return std::make_unique<Dr_suppress_faults>(f);
      }}
   ,
    {"tk_repeat",
      [](std::string &&f){
         return std::make_unique<Tk_repeat>(f);
      }}
   ,
    {"tk_time",
      [](std::string &&f){
         return std::make_unique<Tk_time>(f);
      }}
   ,
    {"dr_resetall",
      [](std::string &&f){
         return std::make_unique<Dr_resetall>(f);
      }}
   ,
    {"tk_clocking",
      [](std::string &&f){
         return std::make_unique<Tk_clocking>(f);
      }}
   ,
    {"tk_parameter",
      [](std::string &&f){
         return std::make_unique<Tk_parameter>(f);
      }}
   ,
    {"tk_initial",
      [](std::string &&f){
         return std::make_unique<Tk_initial>(f);
      }}
   ,
    {"tk_pulsestyle_ondetect",
      [](std::string &&f){
         return std::make_unique<Tk_pulsestyle_ondetect>(f);
      }}
   ,
    {"discipline_items",
      [](std::string &&f){
         return std::make_unique<Discipline_items>(f);
      }}
   ,
    {"tk_global",
      [](std::string &&f){
         return std::make_unique<Tk_global>(f);
      }}
   ,
    {"dr_end_keywords",
      [](std::string &&f){
         return std::make_unique<Dr_end_keywords>(f);
      }}
   ,
    {"tk_sample",
      [](std::string &&f){
         return std::make_unique<Tk_sample>(f);
      }}
   ,
    {"tk_unique_index",
      [](std::string &&f){
         return std::make_unique<Tk_unique_index>(f);
      }}
   ,
    {"tk_cmos",
      [](std::string &&f){
         return std::make_unique<Tk_cmos>(f);
      }}
   ,
    {"tk_pstar",
      [](std::string &&f){
         return std::make_unique<Tk_pstar>(f);
      }}
   ,
    {"tk_extern",
      [](std::string &&f){
         return std::make_unique<Tk_extern>(f);
      }}
   ,
    {"module_attribute_foreign",
      [](std::string &&f){
         return std::make_unique<Module_attribute_foreign>(f);
      }}
   ,
    {"tk_constraint",
      [](std::string &&f){
         return std::make_unique<Tk_constraint>(f);
      }}
   ,
    {"tk_solve",
      [](std::string &&f){
         return std::make_unique<Tk_solve>(f);
      }}
   ,
    {"tk_triand",
      [](std::string &&f){
         return std::make_unique<Tk_triand>(f);
      }}
   ,
    {"tk_join_none",
      [](std::string &&f){
         return std::make_unique<Tk_join_none>(f);
      }}
   ,
    {"tk_static",
      [](std::string &&f){
         return std::make_unique<Tk_static>(f);
      }}
   ,
    {"pp_define",
      [](std::string &&f){
         return std::make_unique<Pp_define>(f);
      }}
   ,
    {"discipline_declaration",
      [](std::string &&f){
         return std::make_unique<Discipline_declaration>(f);
      }}
   ,
    {"tk_disable",
      [](std::string &&f){
         return std::make_unique<Tk_disable>(f);
      }}
   ,
    {"tk_reverse",
      [](std::string &&f){
         return std::make_unique<Tk_reverse>(f);
      }}
   ,
    {"tk_shortreal",
      [](std::string &&f){
         return std::make_unique<Tk_shortreal>(f);
      }}
   ,
    {"tk_find_last_index",
      [](std::string &&f){
         return std::make_unique<Tk_find_last_index>(f);
      }}
   ,
    {"tk_expect",
      [](std::string &&f){
         return std::make_unique<Tk_expect>(f);
      }}
   ,
    {"analog_statement",
      [](std::string &&f){
         return std::make_unique<Analog_statement>(f);
      }}
   ,
    {"udp_unknown_list",
      [](std::string &&f){
         return std::make_unique<Udp_unknown_list>(f);
      }}
   ,
    {"tk_lbstarrb",
      [](std::string &&f){
         return std::make_unique<Tk_lbstarrb>(f);
      }}
   ,
    {"preprocessor_elsif_module_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_module_items>(f);
      }}
   ,
    {"rs_case",
      [](std::string &&f){
         return std::make_unique<Rs_case>(f);
      }}
   ,
    {"preprocessor_balanced_class_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_class_items>(f);
      }}
   ,
    {"named_parameter_assignment_list",
      [](std::string &&f){
         return std::make_unique<Named_parameter_assignment_list>(f);
      }}
   ,
    {"rs_case_item_list",
      [](std::string &&f){
         return std::make_unique<Rs_case_item_list>(f);
      }}
   ,
    {"dr_pragma",
      [](std::string &&f){
         return std::make_unique<Dr_pragma>(f);
      }}
   ,
    {"tk_discrete",
      [](std::string &&f){
         return std::make_unique<Tk_discrete>(f);
      }}
   ,
    {"tk_flow",
      [](std::string &&f){
         return std::make_unique<Tk_flow>(f);
      }}
   ,
    {"tk_ref",
      [](std::string &&f){
         return std::make_unique<Tk_ref>(f);
      }}
   ,
    {"preprocessor_elsif_statements",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_statements>(f);
      }}
   ,
    {"tk_xnor",
      [](std::string &&f){
         return std::make_unique<Tk_xnor>(f);
      }}
   ,
    {"tk_supply1",
      [](std::string &&f){
         return std::make_unique<Tk_supply1>(f);
      }}
   ,
    {"tk_const",
      [](std::string &&f){
         return std::make_unique<Tk_const>(f);
      }}
   ,
    {"tk_local_scope",
      [](std::string &&f){
         return std::make_unique<Tk_local_scope>(f);
      }}
   ,
    {"tk_strong1",
      [](std::string &&f){
         return std::make_unique<Tk_strong1>(f);
      }}
   ,
    {"tk_release",
      [](std::string &&f){
         return std::make_unique<Tk_release>(f);
      }}
   ,
    {"discipline_items_opt",
      [](std::string &&f){
         return std::make_unique<Discipline_items_opt>(f);
      }}
   ,
    {"tk_program",
      [](std::string &&f){
         return std::make_unique<Tk_program>(f);
      }}
   ,
    {"preprocessor_elsif_module_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_module_item>(f);
      }}
   ,
    {"preprocessor_else_statement_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_statement_opt>(f);
      }}
   ,
    {"tk_always",
      [](std::string &&f){
         return std::make_unique<Tk_always>(f);
      }}
   ,
    {"preprocessor_elsif_class_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_class_item>(f);
      }}
   ,
    {"tk_table",
      [](std::string &&f){
         return std::make_unique<Tk_table>(f);
      }}
   ,
    {"tk_trigger",
      [](std::string &&f){
         return std::make_unique<Tk_trigger>(f);
      }}
   ,
    {"tk_liblist",
      [](std::string &&f){
         return std::make_unique<Tk_liblist>(f);
      }}
   ,
    {"preprocessor_elsif_header",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_header>(f);
      }}
   ,
    {"tk_pure",
      [](std::string &&f){
         return std::make_unique<Tk_pure>(f);
      }}
   ,
    {"tk_case",
      [](std::string &&f){
         return std::make_unique<Tk_case>(f);
      }}
   ,
    {"tk_shold",
      [](std::string &&f){
         return std::make_unique<Tk_shold>(f);
      }}
   ,
    {"tk_lbrarrow",
      [](std::string &&f){
         return std::make_unique<Tk_lbrarrow>(f);
      }}
   ,
    {"tk_package",
      [](std::string &&f){
         return std::make_unique<Tk_package>(f);
      }}
   ,
    {"tk_always_ff",
      [](std::string &&f){
         return std::make_unique<Tk_always_ff>(f);
      }}
   ,
    {"tk_filepath",
      [](std::string &&f){
         return std::make_unique<Tk_filepath>(f);
      }}
   ,
    {"tk_colon_eq",
      [](std::string &&f){
         return std::make_unique<Tk_colon_eq>(f);
      }}
   ,
    {"preprocessor_elsif_config_rule_statements_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_config_rule_statements_opt>(f);
      }}
   ,
    {"tk_pulldown",
      [](std::string &&f){
         return std::make_unique<Tk_pulldown>(f);
      }}
   ,
    {"tk_rpmos",
      [](std::string &&f){
         return std::make_unique<Tk_rpmos>(f);
      }}
   ,
    {"preprocessor_else_generate_item_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_generate_item_opt>(f);
      }}
   ,
    {"tk_bit",
      [](std::string &&f){
         return std::make_unique<Tk_bit>(f);
      }}
   ,
    {"tk_chandle",
      [](std::string &&f){
         return std::make_unique<Tk_chandle>(f);
      }}
   ,
    {"preprocessor_elsif_bins_or_options_list",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_bins_or_options_list>(f);
      }}
   ,
    {"tk_binsof",
      [](std::string &&f){
         return std::make_unique<Tk_binsof>(f);
      }}
   ,
    {"macro_args_opt",
      [](std::string &&f){
         return std::make_unique<Macro_args_opt>(f);
      }}
   ,
    {"tk_srecovery",
      [](std::string &&f){
         return std::make_unique<Tk_srecovery>(f);
      }}
   ,
    {"tk_config",
      [](std::string &&f){
         return std::make_unique<Tk_config>(f);
      }}
   ,
    {"tk_nonblocking_trigger",
      [](std::string &&f){
         return std::make_unique<Tk_nonblocking_trigger>(f);
      }}
   ,
    {"tk_shuffle",
      [](std::string &&f){
         return std::make_unique<Tk_shuffle>(f);
      }}
   ,
    {"tk_signed",
      [](std::string &&f){
         return std::make_unique<Tk_signed>(f);
      }}
   ,
    {"tk_incr",
      [](std::string &&f){
         return std::make_unique<Tk_incr>(f);
      }}
   ,
    {"tk_always_latch",
      [](std::string &&f){
         return std::make_unique<Tk_always_latch>(f);
      }}
   ,
    {"preprocessor_balanced_generate_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_generate_items>(f);
      }}
   ,
    {"tk_product",
      [](std::string &&f){
         return std::make_unique<Tk_product>(f);
      }}
   ,
    {"preprocessor_else_module_item_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_module_item_opt>(f);
      }}
   ,
    {"tk_input",
      [](std::string &&f){
         return std::make_unique<Tk_input>(f);
      }}
   ,
    {"tk_assign",
      [](std::string &&f){
         return std::make_unique<Tk_assign>(f);
      }}
   ,
    {"preprocessor_elsif_description_items_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_description_items_opt>(f);
      }}
   ,
    {"dr_delay_mode_distributed",
      [](std::string &&f){
         return std::make_unique<Dr_delay_mode_distributed>(f);
      }}
   ,
    {"preprocessor_else_package_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_package_item>(f);
      }}
   ,
    {"bins_or_options_list_opt_pp",
      [](std::string &&f){
         return std::make_unique<Bins_or_options_list_opt_pp>(f);
      }}
   ,
    {"preprocessor_elsif_package_items_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_package_items_opt>(f);
      }}
   ,
    {"tk_s_until_with",
      [](std::string &&f){
         return std::make_unique<Tk_s_until_with>(f);
      }}
   ,
    {"rs_case_item",
      [](std::string &&f){
         return std::make_unique<Rs_case_item>(f);
      }}
   ,
    {"any_port_list_preprocessor_last_positional",
      [](std::string &&f){
         return std::make_unique<Any_port_list_preprocessor_last_positional>(f);
      }}
   ,
    {"tk_ignore_bins",
      [](std::string &&f){
         return std::make_unique<Tk_ignore_bins>(f);
      }}
   ,
    {"tk_sum",
      [](std::string &&f){
         return std::make_unique<Tk_sum>(f);
      }}
   ,
    {"tkk_attribute",
      [](std::string &&f){
         return std::make_unique<Tkk_attribute>(f);
      }}
   ,
    {"tk_max",
      [](std::string &&f){
         return std::make_unique<Tk_max>(f);
      }}
   ,
    {"preprocessor_else_constraint_block_item_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_constraint_block_item_opt>(f);
      }}
   ,
    {"tk_nexttime",
      [](std::string &&f){
         return std::make_unique<Tk_nexttime>(f);
      }}
   ,
    {"tk_sequence",
      [](std::string &&f){
         return std::make_unique<Tk_sequence>(f);
      }}
   ,
    {"tk_automatic",
      [](std::string &&f){
         return std::make_unique<Tk_automatic>(f);
      }}
   ,
    {"preprocessor_else_statement",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_statement>(f);
      }}
   ,
    {"tk_pullup",
      [](std::string &&f){
         return std::make_unique<Tk_pullup>(f);
      }}
   ,
    {"preprocessor_elsif_description_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_description_items>(f);
      }}
   ,
    {"enum_name_list_preprocessor_last",
      [](std::string &&f){
         return std::make_unique<Enum_name_list_preprocessor_last>(f);
      }}
   ,
    {"from_exclude",
      [](std::string &&f){
         return std::make_unique<From_exclude>(f);
      }}
   ,
    {"tk_int",
      [](std::string &&f){
         return std::make_unique<Tk_int>(f);
      }}
   ,
    {"tk_join",
      [](std::string &&f){
         return std::make_unique<Tk_join>(f);
      }}
   ,
    {"tk_find_first_index",
      [](std::string &&f){
         return std::make_unique<Tk_find_first_index>(f);
      }}
   ,
    {"tk_implements",
      [](std::string &&f){
         return std::make_unique<Tk_implements>(f);
      }}
   ,
    {"discipline_item",
      [](std::string &&f){
         return std::make_unique<Discipline_item>(f);
      }}
   ,
    {"block_event_expression",
      [](std::string &&f){
         return std::make_unique<Block_event_expression>(f);
      }}
   ,
    {"tk_discipline",
      [](std::string &&f){
         return std::make_unique<Tk_discipline>(f);
      }}
   ,
    {"include_statement",
      [](std::string &&f){
         return std::make_unique<Include_statement>(f);
      }}
   ,
    {"tk_lbstar",
      [](std::string &&f){
         return std::make_unique<Tk_lbstar>(f);
      }}
   ,
    {"preprocessor_elsif_bins_or_options_list_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_bins_or_options_list_opt>(f);
      }}
   ,
    {"tk_lbeq",
      [](std::string &&f){
         return std::make_unique<Tk_lbeq>(f);
      }}
   ,
    {"tk_void",
      [](std::string &&f){
         return std::make_unique<Tk_void>(f);
      }}
   ,
    {"tk_exclude",
      [](std::string &&f){
         return std::make_unique<Tk_exclude>(f);
      }}
   ,
    {"tk_randc",
      [](std::string &&f){
         return std::make_unique<Tk_randc>(f);
      }}
   ,
    {"tk_weak",
      [](std::string &&f){
         return std::make_unique<Tk_weak>(f);
      }}
   ,
    {"tk_instance",
      [](std::string &&f){
         return std::make_unique<Tk_instance>(f);
      }}
   ,
    {"tk_type_option",
      [](std::string &&f){
         return std::make_unique<Tk_type_option>(f);
      }}
   ,
    {"tk_wait",
      [](std::string &&f){
         return std::make_unique<Tk_wait>(f);
      }}
   ,
    {"tk_abstol",
      [](std::string &&f){
         return std::make_unique<Tk_abstol>(f);
      }}
   ,
    {"tk_decr",
      [](std::string &&f){
         return std::make_unique<Tk_decr>(f);
      }}
   ,
    {"tk_xor",
      [](std::string &&f){
         return std::make_unique<Tk_xor>(f);
      }}
   ,
    {"tk_timeprecision",
      [](std::string &&f){
         return std::make_unique<Tk_timeprecision>(f);
      }}
   ,
    {"dr_delay_mode_zero",
      [](std::string &&f){
         return std::make_unique<Dr_delay_mode_zero>(f);
      }}
   ,
    {"tk_find_first",
      [](std::string &&f){
         return std::make_unique<Tk_find_first>(f);
      }}
   ,
    {"tk_pulsestyle_onevent",
      [](std::string &&f){
         return std::make_unique<Tk_pulsestyle_onevent>(f);
      }}
   ,
    {"tk_covergroup",
      [](std::string &&f){
         return std::make_unique<Tk_covergroup>(f);
      }}
   ,
    {"preprocessor_elsif_constraint_block_items_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_constraint_block_items_opt>(f);
      }}
   ,
    {"macro_digits",
      [](std::string &&f){
         return std::make_unique<Macro_digits>(f);
      }}
   ,
    {"tk_units",
      [](std::string &&f){
         return std::make_unique<Tk_units>(f);
      }}
   ,
    {"tk_tran",
      [](std::string &&f){
         return std::make_unique<Tk_tran>(f);
      }}
   ,
    {"tk_wildcard",
      [](std::string &&f){
         return std::make_unique<Tk_wildcard>(f);
      }}
   ,
    {"preprocessor_balanced_bins_or_options_list",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_bins_or_options_list>(f);
      }}
   ,
    {"tk_final",
      [](std::string &&f){
         return std::make_unique<Tk_final>(f);
      }}
   ,
    {"preprocessor_else_package_item_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_package_item_opt>(f);
      }}
   ,
    {"preprocessor_elsif_class_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_class_items>(f);
      }}
   ,
    {"any_argument_list_preprocessor_last",
      [](std::string &&f){
         return std::make_unique<Any_argument_list_preprocessor_last>(f);
      }}
   ,
    {"tk_sort",
      [](std::string &&f){
         return std::make_unique<Tk_sort>(f);
      }}
   ,
    {"incdir_spec",
      [](std::string &&f){
         return std::make_unique<Incdir_spec>(f);
      }}
   ,
    {"preprocessor_if_header",
      [](std::string &&f){
         return std::make_unique<Preprocessor_if_header>(f);
      }}
   ,
    {"dr_disable_portfaults",
      [](std::string &&f){
         return std::make_unique<Dr_disable_portfaults>(f);
      }}
   ,
    {"tk_s_nexttime",
      [](std::string &&f){
         return std::make_unique<Tk_s_nexttime>(f);
      }}
   ,
    {"tk_with",
      [](std::string &&f){
         return std::make_unique<Tk_with>(f);
      }}
   ,
    {"dr_unconnected_drive",
      [](std::string &&f){
         return std::make_unique<Dr_unconnected_drive>(f);
      }}
   ,
    {"tk_snochange",
      [](std::string &&f){
         return std::make_unique<Tk_snochange>(f);
      }}
   ,
    {"macro_call_or_item",
      [](std::string &&f){
         return std::make_unique<Macro_call_or_item>(f);
      }}
   ,
    {"library_description_list_opt",
      [](std::string &&f){
         return std::make_unique<Library_description_list_opt>(f);
      }}
   ,
    {"preprocessor_elsif_port_declaration",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_port_declaration>(f);
      }}
   ,
    {"tk_context",
      [](std::string &&f){
         return std::make_unique<Tk_context>(f);
      }}
   ,
    {"tk_include",
      [](std::string &&f){
         return std::make_unique<Tk_include>(f);
      }}
   ,
    {"tk_var",
      [](std::string &&f){
         return std::make_unique<Tk_var>(f);
      }}
   ,
    {"preprocessor_balanced_constraint_block_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_constraint_block_item>(f);
      }}
   ,
    {"tk_module",
      [](std::string &&f){
         return std::make_unique<Tk_module>(f);
      }}
   ,
    {"dr_uselib",
      [](std::string &&f){
         return std::make_unique<Dr_uselib>(f);
      }}
   ,
    {"constraint_declaration_package_item",
      [](std::string &&f){
         return std::make_unique<Constraint_declaration_package_item>(f);
      }}
   ,
    {"dr_nounconnected_drive",
      [](std::string &&f){
         return std::make_unique<Dr_nounconnected_drive>(f);
      }}
   ,
    {"tk_event",
      [](std::string &&f){
         return std::make_unique<Tk_event>(f);
      }}
   ,
    {"tk_access",
      [](std::string &&f){
         return std::make_unique<Tk_access>(f);
      }}
   ,
    {"tk_typedef",
      [](std::string &&f){
         return std::make_unique<Tk_typedef>(f);
      }}
   ,
    {"library_description",
      [](std::string &&f){
         return std::make_unique<Library_description>(f);
      }}
   ,
    {"preprocessor_balanced_description_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_description_items>(f);
      }}
   ,
    {"preprocessor_elsif_port_declarations",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_port_declarations>(f);
      }}
   ,
    {"preprocessor_else_bins_or_options_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_bins_or_options_opt>(f);
      }}
   ,
    {"preprocessor_else_port_declarations",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_port_declarations>(f);
      }}
   ,
    {"tk_until_with",
      [](std::string &&f){
         return std::make_unique<Tk_until_with>(f);
      }}
   ,
    {"tk_atat",
      [](std::string &&f){
         return std::make_unique<Tk_atat>(f);
      }}
   ,
    {"tk_option",
      [](std::string &&f){
         return std::make_unique<Tk_option>(f);
      }}
   ,
    {"tk_negedge",
      [](std::string &&f){
         return std::make_unique<Tk_negedge>(f);
      }}
   ,
    {"tk_until",
      [](std::string &&f){
         return std::make_unique<Tk_until>(f);
      }}
   ,
    {"tk_po_neg",
      [](std::string &&f){
         return std::make_unique<Tk_po_neg>(f);
      }}
   ,
    {"preprocessor_balanced_config_rule_statements",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_config_rule_statements>(f);
      }}
   ,
    {"member_pattern",
      [](std::string &&f){
         return std::make_unique<Member_pattern>(f);
      }}
   ,
    {"tk_weak1",
      [](std::string &&f){
         return std::make_unique<Tk_weak1>(f);
      }}
   ,
    {"tk_1step",
      [](std::string &&f){
         return std::make_unique<Tk_1step>(f);
      }}
   ,
    {"parameter_value_byname_list_preprocessor_last",
      [](std::string &&f){
         return std::make_unique<Parameter_value_byname_list_preprocessor_last>(f);
      }}
   ,
    {"tk_unsigned",
      [](std::string &&f){
         return std::make_unique<Tk_unsigned>(f);
      }}
   ,
    {"macro_arg_opt",
      [](std::string &&f){
         return std::make_unique<Macro_arg_opt>(f);
      }}
   ,
    {"tk_tagged",
      [](std::string &&f){
         return std::make_unique<Tk_tagged>(f);
      }}
   ,
    {"tk_scope_res",
      [](std::string &&f){
         return std::make_unique<Tk_scope_res>(f);
      }}
   ,
    {"dr_endprotect",
      [](std::string &&f){
         return std::make_unique<Dr_endprotect>(f);
      }}
   ,
    {"dr_delay_mode_unit",
      [](std::string &&f){
         return std::make_unique<Dr_delay_mode_unit>(f);
      }}
   ,
    {"parameter_value_ranges",
      [](std::string &&f){
         return std::make_unique<Parameter_value_ranges>(f);
      }}
   ,
    {"nature_item",
      [](std::string &&f){
         return std::make_unique<Nature_item>(f);
      }}
   ,
    {"tk_virtual",
      [](std::string &&f){
         return std::make_unique<Tk_virtual>(f);
      }}
   ,
    {"tk_with__covergroup",
      [](std::string &&f){
         return std::make_unique<Tk_with__covergroup>(f);
      }}
   ,
    {"error",
      [](std::string &&f){
         return std::make_unique<Error>(f);
      }}
   ,
    {"tk_specparam",
      [](std::string &&f){
         return std::make_unique<Tk_specparam>(f);
      }}
   ,
    {"tk_assume",
      [](std::string &&f){
         return std::make_unique<Tk_assume>(f);
      }}
   ,
    {"tk_uwire",
      [](std::string &&f){
         return std::make_unique<Tk_uwire>(f);
      }}
   ,
    {"tk_rtran",
      [](std::string &&f){
         return std::make_unique<Tk_rtran>(f);
      }}
   ,
    {"preprocessor_elsif_constraint_expressions_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_constraint_expressions_opt>(f);
      }}
   ,
    {"tk_sync_accept_on",
      [](std::string &&f){
         return std::make_unique<Tk_sync_accept_on>(f);
      }}
   ,
    {"tk_coverpoint",
      [](std::string &&f){
         return std::make_unique<Tk_coverpoint>(f);
      }}
   ,
    {"tk_rnmos",
      [](std::string &&f){
         return std::make_unique<Tk_rnmos>(f);
      }}
   ,
    {"tk_eventually",
      [](std::string &&f){
         return std::make_unique<Tk_eventually>(f);
      }}
   ,
    {"preprocessor_else_description_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_description_item>(f);
      }}
   ,
    {"tk_this",
      [](std::string &&f){
         return std::make_unique<Tk_this>(f);
      }}
   ,
    {"tk_do",
      [](std::string &&f){
         return std::make_unique<Tk_do>(f);
      }}
   ,
    {"tk_modport",
      [](std::string &&f){
         return std::make_unique<Tk_modport>(f);
      }}
   ,
    {"tk_soft",
      [](std::string &&f){
         return std::make_unique<Tk_soft>(f);
      }}
   ,
    {"dr_default_trireg_strength",
      [](std::string &&f){
         return std::make_unique<Dr_default_trireg_strength>(f);
      }}
   ,
    {"tk_trireg",
      [](std::string &&f){
         return std::make_unique<Tk_trireg>(f);
      }}
   ,
    {"description_list_opt",
      [](std::string &&f){
         return std::make_unique<Description_list_opt>(f);
      }}
   ,
    {"tk_edge",
      [](std::string &&f){
         return std::make_unique<Tk_edge>(f);
      }}
   ,
    {"preprocessor_elsif_statements_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_statements_opt>(f);
      }}
   ,
    {"case_item_expression",
      [](std::string &&f){
         return std::make_unique<Case_item_expression>(f);
      }}
   ,
    {"tk_infinite",
      [](std::string &&f){
         return std::make_unique<Tk_infinite>(f);
      }}
   ,
    {"preprocessor_else_config_rule_statement",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_config_rule_statement>(f);
      }}
   ,
    {"tk_nature",
      [](std::string &&f){
         return std::make_unique<Tk_nature>(f);
      }}
   ,
    {"tk_analog",
      [](std::string &&f){
         return std::make_unique<Tk_analog>(f);
      }}
   ,
    {"tk_macromodule",
      [](std::string &&f){
         return std::make_unique<Tk_macromodule>(f);
      }}
   ,
    {"tk_s_eventually",
      [](std::string &&f){
         return std::make_unique<Tk_s_eventually>(f);
      }}
   ,
    {"tk_srecrem",
      [](std::string &&f){
         return std::make_unique<Tk_srecrem>(f);
      }}
   ,
    {"tk_null",
      [](std::string &&f){
         return std::make_unique<Tk_null>(f);
      }}
   ,
    {"tk_lp",
      [](std::string &&f){
         return std::make_unique<Tk_lp>(f);
      }}
   ,
    {"preprocessor_else_class_item_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_class_item_opt>(f);
      }}
   ,
    {"named_parameter_assignment",
      [](std::string &&f){
         return std::make_unique<Named_parameter_assignment>(f);
      }}
   ,
    {"tk_min",
      [](std::string &&f){
         return std::make_unique<Tk_min>(f);
      }}
   ,
    {"tk_unique0",
      [](std::string &&f){
         return std::make_unique<Tk_unique0>(f);
      }}
   ,
    {"tk_or",
      [](std::string &&f){
         return std::make_unique<Tk_or>(f);
      }}
   ,
    {"tk_wone",
      [](std::string &&f){
         return std::make_unique<Tk_wone>(f);
      }}
   ,
    {"tk_rs",
      [](std::string &&f){
         return std::make_unique<Tk_rs>(f);
      }}
   ,
    {"tk_find",
      [](std::string &&f){
         return std::make_unique<Tk_find>(f);
      }}
   ,
    {"preprocessor_elsif_config_rule_statement",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_config_rule_statement>(f);
      }}
   ,
    {"tk_end",
      [](std::string &&f){
         return std::make_unique<Tk_end>(f);
      }}
   ,
    {"tk_bind",
      [](std::string &&f){
         return std::make_unique<Tk_bind>(f);
      }}
   ,
    {"incdir_spec_opt",
      [](std::string &&f){
         return std::make_unique<Incdir_spec_opt>(f);
      }}
   ,
    {"preprocessor_elsif_constraint_expressions",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_constraint_expressions>(f);
      }}
   ,
    {"preprocessor_else_constraint_expression",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_constraint_expression>(f);
      }}
   ,
    {"tk_continue",
      [](std::string &&f){
         return std::make_unique<Tk_continue>(f);
      }}
   ,
    {"tk_cross",
      [](std::string &&f){
         return std::make_unique<Tk_cross>(f);
      }}
   ,
    {"dr_timescale",
      [](std::string &&f){
         return std::make_unique<Dr_timescale>(f);
      }}
   ,
    {"preprocessor_elsif_constraint_block_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_constraint_block_item>(f);
      }}
   ,
    {"tk_alias",
      [](std::string &&f){
         return std::make_unique<Tk_alias>(f);
      }}
   ,
    {"preprocessor_balanced_constraint_expressions",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_constraint_expressions>(f);
      }}
   ,
    {"tk_integer",
      [](std::string &&f){
         return std::make_unique<Tk_integer>(f);
      }}
   ,
    {"tk_join_any",
      [](std::string &&f){
         return std::make_unique<Tk_join_any>(f);
      }}
   ,
    {"tk_interface",
      [](std::string &&f){
         return std::make_unique<Tk_interface>(f);
      }}
   ,
    {"tf_port_list_preprocessor_last",
      [](std::string &&f){
         return std::make_unique<Tf_port_list_preprocessor_last>(f);
      }}
   ,
    {"tk_export",
      [](std::string &&f){
         return std::make_unique<Tk_export>(f);
      }}
   ,
    {"preprocessor_elsif_statement",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_statement>(f);
      }}
   ,
    {"preprocessor_else_config_rule_statement_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_config_rule_statement_opt>(f);
      }}
   ,
    {"tk_nxor",
      [](std::string &&f){
         return std::make_unique<Tk_nxor>(f);
      }}
   ,
    {"preprocessor_elsif_generate_items_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_generate_items_opt>(f);
      }}
   ,
    {"tk_supply0",
      [](std::string &&f){
         return std::make_unique<Tk_supply0>(f);
      }}
   ,
    {"tk_s_always",
      [](std::string &&f){
         return std::make_unique<Tk_s_always>(f);
      }}
   ,
    {"tk_reg",
      [](std::string &&f){
         return std::make_unique<Tk_reg>(f);
      }}
   ,
    {"file_path_spec",
      [](std::string &&f){
         return std::make_unique<File_path_spec>(f);
      }}
   ,
    {"dr_endcelldefine",
      [](std::string &&f){
         return std::make_unique<Dr_endcelldefine>(f);
      }}
   ,
    {"preprocessor_list_of_ports_or_port_declarations_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_list_of_ports_or_port_declarations_opt>(f);
      }}
   ,
    {"tk_implies",
      [](std::string &&f){
         return std::make_unique<Tk_implies>(f);
      }}
   ,
    {"tk_first_match",
      [](std::string &&f){
         return std::make_unique<Tk_first_match>(f);
      }}
   ,
    {"preprocessor_elsif_package_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_package_items>(f);
      }}
   ,
    {"tk_pmos",
      [](std::string &&f){
         return std::make_unique<Tk_pmos>(f);
      }}
   ,
    {"preprocessor_balanced_module_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_module_items>(f);
      }}
   ,
    {"block_event_expr_primary",
      [](std::string &&f){
         return std::make_unique<Block_event_expr_primary>(f);
      }}
   ,
    {"constraint_prototype",
      [](std::string &&f){
         return std::make_unique<Constraint_prototype>(f);
      }}
   ,
    {"tk_ls",
      [](std::string &&f){
         return std::make_unique<Tk_ls>(f);
      }}
   ,
    {"tk_cell",
      [](std::string &&f){
         return std::make_unique<Tk_cell>(f);
      }}
   ,
    {"tk_weak0",
      [](std::string &&f){
         return std::make_unique<Tk_weak0>(f);
      }}
   ,
    {"dr_enable_portfaults",
      [](std::string &&f){
         return std::make_unique<Dr_enable_portfaults>(f);
      }}
   ,
    {"tk_noshowcancelled",
      [](std::string &&f){
         return std::make_unique<Tk_noshowcancelled>(f);
      }}
   ,
    {"tk_not",
      [](std::string &&f){
         return std::make_unique<Tk_not>(f);
      }}
   ,
    {"preprocessor_else_bins_or_options",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_bins_or_options>(f);
      }}
   ,
    {"tk_cover",
      [](std::string &&f){
         return std::make_unique<Tk_cover>(f);
      }}
   ,
    {"preprocessor_control_flow",
      [](std::string &&f){
         return std::make_unique<Preprocessor_control_flow>(f);
      }}
   ,
    {"tk_output",
      [](std::string &&f){
         return std::make_unique<Tk_output>(f);
      }}
   ,
    {"tk_tri1",
      [](std::string &&f){
         return std::make_unique<Tk_tri1>(f);
      }}
   ,
    {"tk_dotstar",
      [](std::string &&f){
         return std::make_unique<Tk_dotstar>(f);
      }}
   ,
    {"tk_timeunit",
      [](std::string &&f){
         return std::make_unique<Tk_timeunit>(f);
      }}
   ,
    {"tk_tri",
      [](std::string &&f){
         return std::make_unique<Tk_tri>(f);
      }}
   ,
    {"macrocall",
      [](std::string &&f){
         return std::make_unique<Macrocall>(f);
      }}
   ,
    {"tk_inout",
      [](std::string &&f){
         return std::make_unique<Tk_inout>(f);
      }}
   ,
    {"tk_casex",
      [](std::string &&f){
         return std::make_unique<Tk_casex>(f);
      }}
   ,
    {"tk_potential",
      [](std::string &&f){
         return std::make_unique<Tk_potential>(f);
      }}
   ,
    {"tk_poundeqpound",
      [](std::string &&f){
         return std::make_unique<Tk_poundeqpound>(f);
      }}
   ,
    {"tk_let",
      [](std::string &&f){
         return std::make_unique<Tk_let>(f);
      }}
   ,
    {"dr_default_nettype",
      [](std::string &&f){
         return std::make_unique<Dr_default_nettype>(f);
      }}
   ,
    {"tk_begin",
      [](std::string &&f){
         return std::make_unique<Tk_begin>(f);
      }}
   ,
    {"tk_casez",
      [](std::string &&f){
         return std::make_unique<Tk_casez>(f);
      }}
   ,
    {"tk_nettype",
      [](std::string &&f){
         return std::make_unique<Tk_nettype>(f);
      }}
   ,
    {"tk_pull0",
      [](std::string &&f){
         return std::make_unique<Tk_pull0>(f);
      }}
   ,
    {"tk_illegal_bins",
      [](std::string &&f){
         return std::make_unique<Tk_illegal_bins>(f);
      }}
   ,
    {"decay_value_simple",
      [](std::string &&f){
         return std::make_unique<Decay_value_simple>(f);
      }}
   ,
    {"tk_enum",
      [](std::string &&f){
         return std::make_unique<Tk_enum>(f);
      }}
   ,
    {"tk_wor",
      [](std::string &&f){
         return std::make_unique<Tk_wor>(f);
      }}
   ,
    {"tk_inf",
      [](std::string &&f){
         return std::make_unique<Tk_inf>(f);
      }}
   ,
    {"tk_sroot",
      [](std::string &&f){
         return std::make_unique<Tk_sroot>(f);
      }}
   ,
    {"tk_interconnect",
      [](std::string &&f){
         return std::make_unique<Tk_interconnect>(f);
      }}
   ,
    {"preprocessor_balanced_package_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_package_items>(f);
      }}
   ,
    {"tk_shortint",
      [](std::string &&f){
         return std::make_unique<Tk_shortint>(f);
      }}
   ,
    {"tk_struct",
      [](std::string &&f){
         return std::make_unique<Tk_struct>(f);
      }}
   ,
    {"tk_break",
      [](std::string &&f){
         return std::make_unique<Tk_break>(f);
      }}
   ,
    {"tk_nmos",
      [](std::string &&f){
         return std::make_unique<Tk_nmos>(f);
      }}
   ,
    {"tk_string",
      [](std::string &&f){
         return std::make_unique<Tk_string>(f);
      }}
   ,
    {"tk_sync_reject_on",
      [](std::string &&f){
         return std::make_unique<Tk_sync_reject_on>(f);
      }}
   ,
    {"tk_wire",
      [](std::string &&f){
         return std::make_unique<Tk_wire>(f);
      }}
   ,
    {"tk_po_pos",
      [](std::string &&f){
         return std::make_unique<Tk_po_pos>(f);
      }}
   ,
    {"tk_return",
      [](std::string &&f){
         return std::make_unique<Tk_return>(f);
      }}
   ,
    {"tk_pipearrow",
      [](std::string &&f){
         return std::make_unique<Tk_pipearrow>(f);
      }}
   ,
    {"preprocessor_else_description_item_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_description_item_opt>(f);
      }}
   ,
    {"dr_protect",
      [](std::string &&f){
         return std::make_unique<Dr_protect>(f);
      }}
   ,
    {"macrocallitem",
      [](std::string &&f){
         return std::make_unique<Macrocallitem>(f);
      }}
   ,
    {"tk_domain",
      [](std::string &&f){
         return std::make_unique<Tk_domain>(f);
      }}
   ,
    {"tk_stimeskew",
      [](std::string &&f){
         return std::make_unique<Tk_stimeskew>(f);
      }}
   ,
    {"macroarg",
      [](std::string &&f){
         return std::make_unique<Macroarg>(f);
      }}
   ,
    {"tk_timeprecision_check",
      [](std::string &&f){
         return std::make_unique<Tk_timeprecision_check>(f);
      }}
   ,
    {"tk_bins",
      [](std::string &&f){
         return std::make_unique<Tk_bins>(f);
      }}
   ,
    {"tk_deassign",
      [](std::string &&f){
         return std::make_unique<Tk_deassign>(f);
      }}
   ,
    {"tk_nor",
      [](std::string &&f){
         return std::make_unique<Tk_nor>(f);
      }}
   ,
    {"tk_packed",
      [](std::string &&f){
         return std::make_unique<Tk_packed>(f);
      }}
   ,
    {"preprocessor_else_port_declarations_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_port_declarations_opt>(f);
      }}
   ,
    {"tk_primitive",
      [](std::string &&f){
         return std::make_unique<Tk_primitive>(f);
      }}
   ,
    {"tk_nand",
      [](std::string &&f){
         return std::make_unique<Tk_nand>(f);
      }}
   ,
    {"preprocessor_else_constraint_block_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_constraint_block_item>(f);
      }}
   ,
    {"tk_priority",
      [](std::string &&f){
         return std::make_unique<Tk_priority>(f);
      }}
   ,
    {"nature_declaration",
      [](std::string &&f){
         return std::make_unique<Nature_declaration>(f);
      }}
   ,
    {"preprocessor_elsif_config_rule_statements",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_config_rule_statements>(f);
      }}
   ,
    {"dr_celldefine",
      [](std::string &&f){
         return std::make_unique<Dr_celldefine>(f);
      }}
   ,
    {"tk_accept_on",
      [](std::string &&f){
         return std::make_unique<Tk_accept_on>(f);
      }}
   ,
    {"tk_swidth",
      [](std::string &&f){
         return std::make_unique<Tk_swidth>(f);
      }}
   ,
    {"tk_byte",
      [](std::string &&f){
         return std::make_unique<Tk_byte>(f);
      }}
   ,
    {"tk_lbplusrb",
      [](std::string &&f){
         return std::make_unique<Tk_lbplusrb>(f);
      }}
   ,
    {"tk_randsequence",
      [](std::string &&f){
         return std::make_unique<Tk_randsequence>(f);
      }}
   ,
    {"tk_dist",
      [](std::string &&f){
         return std::make_unique<Tk_dist>(f);
      }}
   ,
    {"preprocessor_elsif_generate_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_generate_item>(f);
      }}
   ,
    {"tk_continuous",
      [](std::string &&f){
         return std::make_unique<Tk_continuous>(f);
      }}
   ,
    {"macrocallid",
      [](std::string &&f){
         return std::make_unique<Macrocallid>(f);
      }}
   ,
    {"dr_nosuppress_faults",
      [](std::string &&f){
         return std::make_unique<Dr_nosuppress_faults>(f);
      }}
   ,
    {"tk_defparam",
      [](std::string &&f){
         return std::make_unique<Tk_defparam>(f);
      }}
   ,
    {"preprocessor_elsif_package_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_package_item>(f);
      }}
   ,
    {"case_item_expression_list",
      [](std::string &&f){
         return std::make_unique<Case_item_expression_list>(f);
      }}
   ,
    {"class_item_qualifier_list",
      [](std::string &&f){
         return std::make_unique<Class_item_qualifier_list>(f);
      }}
   ,
    {"tk_assert",
      [](std::string &&f){
         return std::make_unique<Tk_assert>(f);
      }}
   ,
    {"tk_default",
      [](std::string &&f){
         return std::make_unique<Tk_default>(f);
      }}
   ,
    {"pp_undef",
      [](std::string &&f){
         return std::make_unique<Pp_undef>(f);
      }}
   ,
    {"pp_endif",
      [](std::string &&f){
         return std::make_unique<Pp_endif>(f);
      }}
   ,
    {"tk_protected",
      [](std::string &&f){
         return std::make_unique<Tk_protected>(f);
      }}
   ,
    {"preprocessor_elsif_constraint_expression",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_constraint_expression>(f);
      }}
   ,
    {"value_range_expression",
      [](std::string &&f){
         return std::make_unique<Value_range_expression>(f);
      }}
   ,
    {"dr_default_decay_time",
      [](std::string &&f){
         return std::make_unique<Dr_default_decay_time>(f);
      }}
   ,
    {"tk_library",
      [](std::string &&f){
         return std::make_unique<Tk_library>(f);
      }}
   ,
    {"tk_local",
      [](std::string &&f){
         return std::make_unique<Tk_local>(f);
      }}
   ,
    {"tk_untyped",
      [](std::string &&f){
         return std::make_unique<Tk_untyped>(f);
      }}
   ,
    {"tk_unique",
      [](std::string &&f){
         return std::make_unique<Tk_unique>(f);
      }}
   ,
    {"tk_ssetuphold",
      [](std::string &&f){
         return std::make_unique<Tk_ssetuphold>(f);
      }}
   ,
    {"tk_use",
      [](std::string &&f){
         return std::make_unique<Tk_use>(f);
      }}
   ,
    {"preprocessor_else_module_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_module_item>(f);
      }}
   ,
    {"list_of_ports_or_port_declarations_preprocessor_last_non_ansi",
      [](std::string &&f){
         return std::make_unique<List_of_ports_or_port_declarations_preprocessor_last_non_ansi>(f);
      }}
   ,
    {"tk_sfullskew",
      [](std::string &&f){
         return std::make_unique<Tk_sfullskew>(f);
      }}
   ,
    {"tk_buf",
      [](std::string &&f){
         return std::make_unique<Tk_buf>(f);
      }}
   ,
    {"tk_property",
      [](std::string &&f){
         return std::make_unique<Tk_property>(f);
      }}
   ,
    {"tk_pull1",
      [](std::string &&f){
         return std::make_unique<Tk_pull1>(f);
      }}
   ,
    {"tk_speriod",
      [](std::string &&f){
         return std::make_unique<Tk_speriod>(f);
      }}
   ,
    {"preprocessor_else_constraint_expression_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_constraint_expression_opt>(f);
      }}
   ,
    {"select_dimensions",
      [](std::string &&f){
         return std::make_unique<Select_dimensions>(f);
      }}
   ,
    {"preprocessor_elsif_module_items_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_module_items_opt>(f);
      }}
   ,
    {"tk_timeunit_check",
      [](std::string &&f){
         return std::make_unique<Tk_timeunit_check>(f);
      }}
   ,
    {"parameter_value_range",
      [](std::string &&f){
         return std::make_unique<Parameter_value_range>(f);
      }}
   ,
    {"tk_extends",
      [](std::string &&f){
         return std::make_unique<Tk_extends>(f);
      }}
   ,
    {"tk_trior",
      [](std::string &&f){
         return std::make_unique<Tk_trior>(f);
      }}
   ,
    {"tk_s_until",
      [](std::string &&f){
         return std::make_unique<Tk_s_until>(f);
      }}
   ,
    {"library_declaration",
      [](std::string &&f){
         return std::make_unique<Library_declaration>(f);
      }}
   ,
    {"tk_rsort",
      [](std::string &&f){
         return std::make_unique<Tk_rsort>(f);
      }}
   ,
    {"tk_posedge",
      [](std::string &&f){
         return std::make_unique<Tk_posedge>(f);
      }}
   ,
    {"tk_generate",
      [](std::string &&f){
         return std::make_unique<Tk_generate>(f);
      }}
   ,
    {"tk_design",
      [](std::string &&f){
         return std::make_unique<Tk_design>(f);
      }}
   ,
    {"tk_always_comb",
      [](std::string &&f){
         return std::make_unique<Tk_always_comb>(f);
      }}
   ,
    {"library_description_list",
      [](std::string &&f){
         return std::make_unique<Library_description_list>(f);
      }}
   ,
    {"preprocessor_else_generate_item",
      [](std::string &&f){
         return std::make_unique<Preprocessor_else_generate_item>(f);
      }}
   ,
    {"tk_tri0",
      [](std::string &&f){
         return std::make_unique<Tk_tri0>(f);
      }}
   ,
    {"preprocessor_balanced_statements",
      [](std::string &&f){
         return std::make_unique<Preprocessor_balanced_statements>(f);
      }}
   ,
    {"tk_real",
      [](std::string &&f){
         return std::make_unique<Tk_real>(f);
      }}
   ,
    {"tk_from",
      [](std::string &&f){
         return std::make_unique<Tk_from>(f);
      }}
   ,
    {"dr_delay_mode_path",
      [](std::string &&f){
         return std::make_unique<Dr_delay_mode_path>(f);
      }}
   ,
    {"tk_randomize",
      [](std::string &&f){
         return std::make_unique<Tk_randomize>(f);
      }}
   ,
    {"tk_and",
      [](std::string &&f){
         return std::make_unique<Tk_and>(f);
      }}
   ,
    {"tk_logic",
      [](std::string &&f){
         return std::make_unique<Tk_logic>(f);
      }}
   ,
    {"tk_ddt_nature",
      [](std::string &&f){
         return std::make_unique<Tk_ddt_nature>(f);
      }}
   ,
    {"preprocessor_elsif_bins_or_options",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_bins_or_options>(f);
      }}
   ,
    {"constraint_expression_list_opt",
      [](std::string &&f){
         return std::make_unique<Constraint_expression_list_opt>(f);
      }}
   ,
    {"declaration_extends_list",
      [](std::string &&f){
         return std::make_unique<Declaration_extends_list>(f);
      }}
   ,
    {"pp_include",
      [](std::string &&f){
         return std::make_unique<Pp_include>(f);
      }}
   ,
    {"tk_super",
      [](std::string &&f){
         return std::make_unique<Tk_super>(f);
      }}
   ,
    {"preprocessor_elsif_constraint_block_items",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_constraint_block_items>(f);
      }}
   ,
    {"preprocessor_elsif_class_items_opt",
      [](std::string &&f){
         return std::make_unique<Preprocessor_elsif_class_items_opt>(f);
      }}
   ,
    {"tk_poundminuspound",
      [](std::string &&f){
         return std::make_unique<Tk_poundminuspound>(f);
      }}
   ,
    {"tk_reject_on",
      [](std::string &&f){
         return std::make_unique<Tk_reject_on>(f);
      }}
   ,
    {"tk_function",
      [](std::string &&f){
         return std::make_unique<Tk_function>(f);
      }}
   ,
    {"tk_sunit",
      [](std::string &&f){
         return std::make_unique<Tk_sunit>(f);
      }}
   ,
    {"tk_restrict",
      [](std::string &&f){
         return std::make_unique<Tk_restrict>(f);
      }}
   ,
    {"tk_task",
      [](std::string &&f){
         return std::make_unique<Tk_task>(f);
      }}
   ,
    {"tk_find_last",
      [](std::string &&f){
         return std::make_unique<Tk_find_last>(f);
      }}
   ,
    {"tk_sremoval",
      [](std::string &&f){
         return std::make_unique<Tk_sremoval>(f);
      }}
   ,
    {"tk_longint",
      [](std::string &&f){
         return std::make_unique<Tk_longint>(f);
      }}
   ,
    {"tk_type",
      [](std::string &&f){
         return std::make_unique<Tk_type>(f);
      }}
   ,
    {"pd_library_syntax_begin",
      [](std::string &&f){
         return std::make_unique<Pd_library_syntax_begin>(f);
      }}
   ,
    {"tk_find_index",
      [](std::string &&f){
         return std::make_unique<Tk_find_index>(f);
      }}
   ,
    {"tk_idt_nature",
      [](std::string &&f){
         return std::make_unique<Tk_idt_nature>(f);
      }}
   ,
    {"tk_import",
      [](std::string &&f){
         return std::make_unique<Tk_import>(f);
      }}
   ,
    {"tk_colon_div",
      [](std::string &&f){
         return std::make_unique<Tk_colon_div>(f);
      }}
   ,
    {"block_event_or_expr",
      [](std::string &&f){
         return std::make_unique<Block_event_or_expr>(f);
      }}
   
};
