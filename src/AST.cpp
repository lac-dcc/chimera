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
  this->element = std::move(element);
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
  this->type = NodeType::CYCLE_DELAY_RANGE;
  this->setElement(element);
}

Property_spec_disable_iff::Property_spec_disable_iff(std::string element) {
  this->type = NodeType::CYCLE_DELAY_RANGE;
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
};
