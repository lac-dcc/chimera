#include "AST.h"
#include "Visitor.h"

std::vector<std::shared_ptr<Node>> Node::getChildren() {
  return this->children;
}

void Node::setChildren(std::vector<std::shared_ptr<Node>> children) {
  this->children = children;
}

std::shared_ptr<Node> Node::getParent() {
  return this->parent;
}

void Node::setParent(std::shared_ptr<Node> children) {
  this->parent = parent;
}

std::string Node::getElement() {
  return this->element;
}

void Node::setElement(std::string element) {
  this->element = element;
}

void Terminal::accept(Visitor &visitor) {
  visitor.visit(this);
}

Terminal::Terminal(std::string element) {
  this->setElement(element);
}

void Time_literal::accept(Visitor &visitor) {
  visitor.visit(this);
}

Time_literal::Time_literal(std::string element) {
  this->setElement(element);
}

void Tk_timeliteral::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_timeliteral::Tk_timeliteral(std::string element) {
  this->setElement(element);
}

void Tk_decnumber::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_decnumber::Tk_decnumber(std::string element) {
  this->setElement(element);
}

void Timescale_directive::accept(Visitor &visitor) {
  visitor.visit(this);
}

Timescale_directive::Timescale_directive(std::string element) {
  this->setElement(element);
}

void Package_item_no_pp::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_item_no_pp::Package_item_no_pp(std::string element) {
  this->setElement(element);
}

void Misc_directive::accept(Visitor &visitor) {
  visitor.visit(this);
}

Misc_directive::Misc_directive(std::string element) {
  this->setElement(element);
}

void Package_or_generate_item_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_or_generate_item_declaration::Package_or_generate_item_declaration(
    std::string element) {
  this->setElement(element);
}

void Data_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_declaration::Data_declaration(std::string element) {
  this->setElement(element);
}

void Any_param_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_param_declaration::Any_param_declaration(std::string element) {
  this->setElement(element);
}

void Timeunits_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Timeunits_declaration::Timeunits_declaration(std::string element) {
  this->setElement(element);
}

void Type_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Type_declaration::Type_declaration(std::string element) {
  this->setElement(element);
}

void Package_import_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_import_declaration::Package_import_declaration(std::string element) {
  this->setElement(element);
}

void Description::accept(Visitor &visitor) {
  visitor.visit(this);
}

Description::Description(std::string element) {
  this->setElement(element);
}

void Module_or_interface_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_or_interface_declaration::Module_or_interface_declaration(
    std::string element) {
  this->setElement(element);
}

void Preprocessor_action::accept(Visitor &visitor) {
  visitor.visit(this);
}

Preprocessor_action::Preprocessor_action(std::string element) {
  this->setElement(element);
}

void Udp_primitive::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_primitive::Udp_primitive(std::string element) {
  this->setElement(element);
}

void Package_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_declaration::Package_declaration(std::string element) {
  this->setElement(element);
}

void Description_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Description_list::Description_list(std::string element) {
  this->setElement(element);
}

void Module_start::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_start::Module_start(std::string element) {
  this->setElement(element);
}

void Lifetime_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Lifetime_opt::Lifetime_opt(std::string element) {
  this->setElement(element);
}

void Lifetime::accept(Visitor &visitor) {
  visitor.visit(this);
}

Lifetime::Lifetime(std::string element) {
  this->setElement(element);
}

void Genericidentifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Genericidentifier::Genericidentifier(std::string element) {
  this->setElement(element);
}

void Symbolidentifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Symbolidentifier::Symbolidentifier(std::string element) {
  this->setElement(element);
}

void Escapedidentifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Escapedidentifier::Escapedidentifier(std::string element) {
  this->setElement(element);
}

void Keywordidentifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Keywordidentifier::Keywordidentifier(std::string element) {
  this->setElement(element);
}

void Symbol_or_label::accept(Visitor &visitor) {
  visitor.visit(this);
}

Symbol_or_label::Symbol_or_label(std::string element) {
  this->setElement(element);
}

void Module_package_import_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_package_import_list_opt::Module_package_import_list_opt(
    std::string element) {
  this->setElement(element);
}

void Package_import_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_import_list::Package_import_list(std::string element) {
  this->setElement(element);
}

void Module_parameter_port_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_parameter_port_list_opt::Module_parameter_port_list_opt(
    std::string element) {
  this->setElement(element);
}

void Module_parameter_port_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_parameter_port_list::Module_parameter_port_list(std::string element) {
  this->setElement(element);
}

void Module_port_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_port_list_opt::Module_port_list_opt(std::string element) {
  this->setElement(element);
}

void List_of_ports_or_port_declarations_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_ports_or_port_declarations_opt::List_of_ports_or_port_declarations_opt(
    std::string element) {
  this->setElement(element);
}

void Module_attribute_foreign_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_attribute_foreign_opt::Module_attribute_foreign_opt(
    std::string element) {
  this->setElement(element);
}

void Integer_vector_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Integer_vector_type::Integer_vector_type(std::string element) {
  this->setElement(element);
}

void Signed_unsigned_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Signed_unsigned_opt::Signed_unsigned_opt(std::string element) {
  this->setElement(element);
}

void Signing::accept(Visitor &visitor) {
  visitor.visit(this);
}

Signing::Signing(std::string element) {
  this->setElement(element);
}

void Data_type_primitive_scalar::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_type_primitive_scalar::Data_type_primitive_scalar(std::string element) {
  this->setElement(element);
}

void Integer_atom_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Integer_atom_type::Integer_atom_type(std::string element) {
  this->setElement(element);
}

void Non_integer_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Non_integer_type::Non_integer_type(std::string element) {
  this->setElement(element);
}

void Enum_data_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Enum_data_type::Enum_data_type(std::string element) {
  this->setElement(element);
}

void Struct_data_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Struct_data_type::Struct_data_type(std::string element) {
  this->setElement(element);
}

void Decl_dimensions_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Decl_dimensions_opt::Decl_dimensions_opt(std::string element) {
  this->setElement(element);
}

void Decl_dimensions::accept(Visitor &visitor) {
  visitor.visit(this);
}

Decl_dimensions::Decl_dimensions(std::string element) {
  this->setElement(element);
}

void Data_type_primitive::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_type_primitive::Data_type_primitive(std::string element) {
  this->setElement(element);
}

void Data_type_base::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_type_base::Data_type_base(std::string element) {
  this->setElement(element);
}

void Data_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_type::Data_type(std::string element) {
  this->setElement(element);
}

void Reference::accept(Visitor &visitor) {
  visitor.visit(this);
}

Reference::Reference(std::string element) {
  this->setElement(element);
}

void Instantiation_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Instantiation_type::Instantiation_type(std::string element) {
  this->setElement(element);
}

void Trailing_decl_assignment_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Trailing_decl_assignment_opt::Trailing_decl_assignment_opt(
    std::string element) {
  this->setElement(element);
}

void Trailing_decl_assignment::accept(Visitor &visitor) {
  visitor.visit(this);
}

Trailing_decl_assignment::Trailing_decl_assignment(std::string element) {
  this->setElement(element);
}

void Non_anonymous_gate_instance_or_register_variable::accept(
    Visitor &visitor) {
  visitor.visit(this);
}

Non_anonymous_gate_instance_or_register_variable::
    Non_anonymous_gate_instance_or_register_variable(std::string element) {
  this->setElement(element);
}

void Any_port_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_port_list_opt::Any_port_list_opt(std::string element) {
  this->setElement(element);
}

void Non_anonymous_gate_instance_or_register_variable_list::accept(
    Visitor &visitor) {
  visitor.visit(this);
}

Non_anonymous_gate_instance_or_register_variable_list::
    Non_anonymous_gate_instance_or_register_variable_list(std::string element) {
  this->setElement(element);
}

void Gate_instance_or_register_variable::accept(Visitor &visitor) {
  visitor.visit(this);
}

Gate_instance_or_register_variable::Gate_instance_or_register_variable(
    std::string element) {
  this->setElement(element);
}

void Instantiation_base::accept(Visitor &visitor) {
  visitor.visit(this);
}

Instantiation_base::Instantiation_base(std::string element) {
  this->setElement(element);
}

void Reference_or_call_base::accept(Visitor &visitor) {
  visitor.visit(this);
}

Reference_or_call_base::Reference_or_call_base(std::string element) {
  this->setElement(element);
}

void Data_declaration_or_module_instantiation::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_declaration_or_module_instantiation::
    Data_declaration_or_module_instantiation(std::string element) {
  this->setElement(element);
}

void Const_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Const_opt::Const_opt(std::string element) {
  this->setElement(element);
}

void Module_or_generate_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_or_generate_item::Module_or_generate_item(std::string element) {
  this->setElement(element);
}

void Module_common_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_common_item::Module_common_item(std::string element) {
  this->setElement(element);
}

void Parameter_override::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_override::Parameter_override(std::string element) {
  this->setElement(element);
}

void Gate_instantiation::accept(Visitor &visitor) {
  visitor.visit(this);
}

Gate_instantiation::Gate_instantiation(std::string element) {
  this->setElement(element);
}

void Non_port_module_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Non_port_module_item::Non_port_module_item(std::string element) {
  this->setElement(element);
}

void Generate_region::accept(Visitor &visitor) {
  visitor.visit(this);
}

Generate_region::Generate_region(std::string element) {
  this->setElement(element);
}

void Specify_block::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_block::Specify_block(std::string element) {
  this->setElement(element);
}

void Module_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_item::Module_item(std::string element) {
  this->setElement(element);
}

void Module_port_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_port_declaration::Module_port_declaration(std::string element) {
  this->setElement(element);
}

void Module_block::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_block::Module_block(std::string element) {
  this->setElement(element);
}

void Module_item_directive::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_item_directive::Module_item_directive(std::string element) {
  this->setElement(element);
}

void Module_item_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_item_list::Module_item_list(std::string element) {
  this->setElement(element);
}

void Net_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Net_type::Net_type(std::string element) {
  this->setElement(element);
}

void Number::accept(Visitor &visitor) {
  visitor.visit(this);
}

Number::Number(std::string element) {
  this->setElement(element);
}

void Constant_dec_number::accept(Visitor &visitor) {
  visitor.visit(this);
}

Constant_dec_number::Constant_dec_number(std::string element) {
  this->setElement(element);
}

void Based_number::accept(Visitor &visitor) {
  visitor.visit(this);
}

Based_number::Based_number(std::string element) {
  this->setElement(element);
}

void Tk_unbasednumber::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_unbasednumber::Tk_unbasednumber(std::string element) {
  this->setElement(element);
}

void Expr_primary_no_groups::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expr_primary_no_groups::Expr_primary_no_groups(std::string element) {
  this->setElement(element);
}

void System_tf_call::accept(Visitor &visitor) {
  visitor.visit(this);
}

System_tf_call::System_tf_call(std::string element) {
  this->setElement(element);
}

void String_literal::accept(Visitor &visitor) {
  visitor.visit(this);
}

String_literal::String_literal(std::string element) {
  this->setElement(element);
}

void Tk_realtime::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_realtime::Tk_realtime(std::string element) {
  this->setElement(element);
}

void Cast::accept(Visitor &visitor) {
  visitor.visit(this);
}

Cast::Cast(std::string element) {
  this->setElement(element);
}

void Expr_primary::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expr_primary::Expr_primary(std::string element) {
  this->setElement(element);
}

void Expr_primary_parens::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expr_primary_parens::Expr_primary_parens(std::string element) {
  this->setElement(element);
}

void Expr_primary_braces::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expr_primary_braces::Expr_primary_braces(std::string element) {
  this->setElement(element);
}

void Assignment_pattern_expression::accept(Visitor &visitor) {
  visitor.visit(this);
}

Assignment_pattern_expression::Assignment_pattern_expression(
    std::string element) {
  this->setElement(element);
}

void Postfix_expression::accept(Visitor &visitor) {
  visitor.visit(this);
}

Postfix_expression::Postfix_expression(std::string element) {
  this->setElement(element);
}

void Reference_or_call::accept(Visitor &visitor) {
  visitor.visit(this);
}

Reference_or_call::Reference_or_call(std::string element) {
  this->setElement(element);
}

void Inc_or_dec_or_primary_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Inc_or_dec_or_primary_expr::Inc_or_dec_or_primary_expr(std::string element) {
  this->setElement(element);
}

void Inc_or_dec_expression::accept(Visitor &visitor) {
  visitor.visit(this);
}

Inc_or_dec_expression::Inc_or_dec_expression(std::string element) {
  this->setElement(element);
}

void Unary_prefix_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Unary_prefix_expr::Unary_prefix_expr(std::string element) {
  this->setElement(element);
}

void Unary_op::accept(Visitor &visitor) {
  visitor.visit(this);
}

Unary_op::Unary_op(std::string element) {
  this->setElement(element);
}

void Unary_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Unary_expr::Unary_expr(std::string element) {
  this->setElement(element);
}

void Pow_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Pow_expr::Pow_expr(std::string element) {
  this->setElement(element);
}

void Mul_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Mul_expr::Mul_expr(std::string element) {
  this->setElement(element);
}

void Add_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Add_expr::Add_expr(std::string element) {
  this->setElement(element);
}

void Shift_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Shift_expr::Shift_expr(std::string element) {
  this->setElement(element);
}

void Comp_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Comp_expr::Comp_expr(std::string element) {
  this->setElement(element);
}

void Open_range_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Open_range_list::Open_range_list(std::string element) {
  this->setElement(element);
}

void Logeq_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Logeq_expr::Logeq_expr(std::string element) {
  this->setElement(element);
}

void Caseeq_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Caseeq_expr::Caseeq_expr(std::string element) {
  this->setElement(element);
}

void Bitand_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Bitand_expr::Bitand_expr(std::string element) {
  this->setElement(element);
}

void Xor_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Xor_expr::Xor_expr(std::string element) {
  this->setElement(element);
}

void Bitor_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Bitor_expr::Bitor_expr(std::string element) {
  this->setElement(element);
}

void With_exprs_suffix::accept(Visitor &visitor) {
  visitor.visit(this);
}

With_exprs_suffix::With_exprs_suffix(std::string element) {
  this->setElement(element);
}

void Matches_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Matches_expr::Matches_expr(std::string element) {
  this->setElement(element);
}

void Logand_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Logand_expr::Logand_expr(std::string element) {
  this->setElement(element);
}

void Logor_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Logor_expr::Logor_expr(std::string element) {
  this->setElement(element);
}

void Cond_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Cond_expr::Cond_expr(std::string element) {
  this->setElement(element);
}

void Expression::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expression::Expression(std::string element) {
  this->setElement(element);
}

void Equiv_impl_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Equiv_impl_expr::Equiv_impl_expr(std::string element) {
  this->setElement(element);
}

void Decl_variable_dimension::accept(Visitor &visitor) {
  visitor.visit(this);
}

Decl_variable_dimension::Decl_variable_dimension(std::string element) {
  this->setElement(element);
}

void Expression_or_null_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expression_or_null_list_opt::Expression_or_null_list_opt(std::string element) {
  this->setElement(element);
}

void Delay3_or_drive_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay3_or_drive_opt::Delay3_or_drive_opt(std::string element) {
  this->setElement(element);
}

void Delay3::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay3::Delay3(std::string element) {
  this->setElement(element);
}

void Data_type_or_implicit::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_type_or_implicit::Data_type_or_implicit(std::string element) {
  this->setElement(element);
}

void Net_variable::accept(Visitor &visitor) {
  visitor.visit(this);
}

Net_variable::Net_variable(std::string element) {
  this->setElement(element);
}

void Net_variable_or_decl_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

Net_variable_or_decl_assign::Net_variable_or_decl_assign(std::string element) {
  this->setElement(element);
}

void Net_decl_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

Net_decl_assign::Net_decl_assign(std::string element) {
  this->setElement(element);
}

void Net_variable_or_decl_assigns::accept(Visitor &visitor) {
  visitor.visit(this);
}

Net_variable_or_decl_assigns::Net_variable_or_decl_assigns(
    std::string element) {
  this->setElement(element);
}

void Net_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Net_declaration::Net_declaration(std::string element) {
  this->setElement(element);
}

void Charge_strength_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Charge_strength_opt::Charge_strength_opt(std::string element) {
  this->setElement(element);
}

void Delay3_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay3_opt::Delay3_opt(std::string element) {
  this->setElement(element);
}

void List_of_identifiers::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_identifiers::List_of_identifiers(std::string element) {
  this->setElement(element);
}

void Task_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Task_declaration::Task_declaration(std::string element) {
  this->setElement(element);
}

void Function_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Function_declaration::Function_declaration(std::string element) {
  this->setElement(element);
}

void Class_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_declaration::Class_declaration(std::string element) {
  this->setElement(element);
}

void Dpi_import_export::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dpi_import_export::Dpi_import_export(std::string element) {
  this->setElement(element);
}

void Specparam_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specparam_declaration::Specparam_declaration(std::string element) {
  this->setElement(element);
}

void Module_or_generate_item_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_or_generate_item_declaration::Module_or_generate_item_declaration(
    std::string element) {
  this->setElement(element);
}

void Genvar_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Genvar_declaration::Genvar_declaration(std::string element) {
  this->setElement(element);
}

void Clocking_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Clocking_declaration::Clocking_declaration(std::string element) {
  this->setElement(element);
}

void Initial_construct::accept(Visitor &visitor) {
  visitor.visit(this);
}

Initial_construct::Initial_construct(std::string element) {
  this->setElement(element);
}

void Always_construct::accept(Visitor &visitor) {
  visitor.visit(this);
}

Always_construct::Always_construct(std::string element) {
  this->setElement(element);
}

void Continuous_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

Continuous_assign::Continuous_assign(std::string element) {
  this->setElement(element);
}

void Loop_generate_construct::accept(Visitor &visitor) {
  visitor.visit(this);
}

Loop_generate_construct::Loop_generate_construct(std::string element) {
  this->setElement(element);
}

void Conditional_generate_construct::accept(Visitor &visitor) {
  visitor.visit(this);
}

Conditional_generate_construct::Conditional_generate_construct(
    std::string element) {
  this->setElement(element);
}

void Assertion_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Assertion_item::Assertion_item(std::string element) {
  this->setElement(element);
}

void Final_construct::accept(Visitor &visitor) {
  visitor.visit(this);
}

Final_construct::Final_construct(std::string element) {
  this->setElement(element);
}

void Parameter_value_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_value_opt::Parameter_value_opt(std::string element) {
  this->setElement(element);
}

void Parameters::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameters::Parameters(std::string element) {
  this->setElement(element);
}

void Unqualified_id::accept(Visitor &visitor) {
  visitor.visit(this);
}

Unqualified_id::Unqualified_id(std::string element) {
  this->setElement(element);
}

void Class_id::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_id::Class_id(std::string element) {
  this->setElement(element);
}

void Qualified_id::accept(Visitor &visitor) {
  visitor.visit(this);
}

Qualified_id::Qualified_id(std::string element) {
  this->setElement(element);
}

void Type_or_id_root::accept(Visitor &visitor) {
  visitor.visit(this);
}

Type_or_id_root::Type_or_id_root(std::string element) {
  this->setElement(element);
}

void Implicit_class_handle::accept(Visitor &visitor) {
  visitor.visit(this);
}

Implicit_class_handle::Implicit_class_handle(std::string element) {
  this->setElement(element);
}

void Local_root::accept(Visitor &visitor) {
  visitor.visit(this);
}

Local_root::Local_root(std::string element) {
  this->setElement(element);
}

void Select_variable_dimension::accept(Visitor &visitor) {
  visitor.visit(this);
}

Select_variable_dimension::Select_variable_dimension(std::string element) {
  this->setElement(element);
}

void Hierarchy_extension::accept(Visitor &visitor) {
  visitor.visit(this);
}

Hierarchy_extension::Hierarchy_extension(std::string element) {
  this->setElement(element);
}

void Member_name::accept(Visitor &visitor) {
  visitor.visit(this);
}

Member_name::Member_name(std::string element) {
  this->setElement(element);
}

void Builtin_array_method::accept(Visitor &visitor) {
  visitor.visit(this);
}

Builtin_array_method::Builtin_array_method(std::string element) {
  this->setElement(element);
}

void Port_named::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_named::Port_named(std::string element) {
  this->setElement(element);
}

void Any_port::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_port::Any_port(std::string element) {
  this->setElement(element);
}

void Any_port_list_item_last::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_port_list_item_last::Any_port_list_item_last(std::string element) {
  this->setElement(element);
}

void Any_port_list_trailing_comma::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_port_list_trailing_comma::Any_port_list_trailing_comma(
    std::string element) {
  this->setElement(element);
}

void Any_port_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_port_list::Any_port_list(std::string element) {
  this->setElement(element);
}

void Label_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Label_opt::Label_opt(std::string element) {
  this->setElement(element);
}

void Begin::accept(Visitor &visitor) {
  visitor.visit(this);
}

Begin::Begin(std::string element) {
  this->setElement(element);
}

void Lpvalue::accept(Visitor &visitor) {
  visitor.visit(this);
}

Lpvalue::Lpvalue(std::string element) {
  this->setElement(element);
}

void Range_list_in_braces::accept(Visitor &visitor) {
  visitor.visit(this);
}

Range_list_in_braces::Range_list_in_braces(std::string element) {
  this->setElement(element);
}

void Assignment_statement_no_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Assignment_statement_no_expr::Assignment_statement_no_expr(
    std::string element) {
  this->setElement(element);
}

void Assign_modify_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Assign_modify_statement::Assign_modify_statement(std::string element) {
  this->setElement(element);
}

void Assignment_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Assignment_statement::Assignment_statement(std::string element) {
  this->setElement(element);
}

void Statement_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Statement_item::Statement_item(std::string element) {
  this->setElement(element);
}

void Procedural_timing_control_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Procedural_timing_control_statement::Procedural_timing_control_statement(
    std::string element) {
  this->setElement(element);
}

void Subroutine_call::accept(Visitor &visitor) {
  visitor.visit(this);
}

Subroutine_call::Subroutine_call(std::string element) {
  this->setElement(element);
}

void Seq_block::accept(Visitor &visitor) {
  visitor.visit(this);
}

Seq_block::Seq_block(std::string element) {
  this->setElement(element);
}

void Nonblocking_assignment::accept(Visitor &visitor) {
  visitor.visit(this);
}

Nonblocking_assignment::Nonblocking_assignment(std::string element) {
  this->setElement(element);
}

void Conditional_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Conditional_statement::Conditional_statement(std::string element) {
  this->setElement(element);
}

void Case_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Case_statement::Case_statement(std::string element) {
  this->setElement(element);
}

void Loop_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Loop_statement::Loop_statement(std::string element) {
  this->setElement(element);
}

void Par_block::accept(Visitor &visitor) {
  visitor.visit(this);
}

Par_block::Par_block(std::string element) {
  this->setElement(element);
}

void Blocking_assignment::accept(Visitor &visitor) {
  visitor.visit(this);
}

Blocking_assignment::Blocking_assignment(std::string element) {
  this->setElement(element);
}

void Wait_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Wait_statement::Wait_statement(std::string element) {
  this->setElement(element);
}

void Procedural_assertion_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Procedural_assertion_statement::Procedural_assertion_statement(
    std::string element) {
  this->setElement(element);
}

void Procedural_continuous_assignment::accept(Visitor &visitor) {
  visitor.visit(this);
}

Procedural_continuous_assignment::Procedural_continuous_assignment(
    std::string element) {
  this->setElement(element);
}

void Event_trigger::accept(Visitor &visitor) {
  visitor.visit(this);
}

Event_trigger::Event_trigger(std::string element) {
  this->setElement(element);
}

void Disable_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Disable_statement::Disable_statement(std::string element) {
  this->setElement(element);
}

void Jump_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Jump_statement::Jump_statement(std::string element) {
  this->setElement(element);
}

void Block_item_or_statement_or_null::accept(Visitor &visitor) {
  visitor.visit(this);
}

Block_item_or_statement_or_null::Block_item_or_statement_or_null(
    std::string element) {
  this->setElement(element);
}

void Block_item_decl::accept(Visitor &visitor) {
  visitor.visit(this);
}

Block_item_decl::Block_item_decl(std::string element) {
  this->setElement(element);
}

void Block_item_or_statement_or_null_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Block_item_or_statement_or_null_list::Block_item_or_statement_or_null_list(
    std::string element) {
  this->setElement(element);
}

void Delay_value_simple::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay_value_simple::Delay_value_simple(std::string element) {
  this->setElement(element);
}

void Delay_identifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay_identifier::Delay_identifier(std::string element) {
  this->setElement(element);
}

void Delay1::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay1::Delay1(std::string element) {
  this->setElement(element);
}

void Delay_value::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay_value::Delay_value(std::string element) {
  this->setElement(element);
}

void Statement_or_null::accept(Visitor &visitor) {
  visitor.visit(this);
}

Statement_or_null::Statement_or_null(std::string element) {
  this->setElement(element);
}

void Statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Statement::Statement(std::string element) {
  this->setElement(element);
}

void Event_control::accept(Visitor &visitor) {
  visitor.visit(this);
}

Event_control::Event_control(std::string element) {
  this->setElement(element);
}

void Cycle_delay::accept(Visitor &visitor) {
  visitor.visit(this);
}

Cycle_delay::Cycle_delay(std::string element) {
  this->setElement(element);
}

void Systemtfidentifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Systemtfidentifier::Systemtfidentifier(std::string element) {
  this->setElement(element);
}

void Call_base::accept(Visitor &visitor) {
  visitor.visit(this);
}

Call_base::Call_base(std::string element) {
  this->setElement(element);
}

void Block_item_or_statement_or_null_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Block_item_or_statement_or_null_list_opt::
    Block_item_or_statement_or_null_list_opt(std::string element) {
  this->setElement(element);
}

void End::accept(Visitor &visitor) {
  visitor.visit(this);
}

End::End(std::string element) {
  this->setElement(element);
}

void Always_any::accept(Visitor &visitor) {
  visitor.visit(this);
}

Always_any::Always_any(std::string element) {
  this->setElement(element);
}

void Module_item_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_item_list_opt::Module_item_list_opt(std::string element) {
  this->setElement(element);
}

void Module_end::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_end::Module_end(std::string element) {
  this->setElement(element);
}

void Source_text::accept(Visitor &visitor) {
  visitor.visit(this);
}

Source_text::Source_text(std::string element) {
  this->setElement(element);
}

void Port_reference::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_reference::Port_reference(std::string element) {
  this->setElement(element);
}

void Port_expression::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_expression::Port_expression(std::string element) {
  this->setElement(element);
}

void Port_reference_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_reference_list::Port_reference_list(std::string element) {
  this->setElement(element);
}

void Trailing_assign_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Trailing_assign_opt::Trailing_assign_opt(std::string element) {
  this->setElement(element);
}

void Trailing_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

Trailing_assign::Trailing_assign(std::string element) {
  this->setElement(element);
}

void Port::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port::Port(std::string element) {
  this->setElement(element);
}

void Port_expression_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_expression_opt::Port_expression_opt(std::string element) {
  this->setElement(element);
}

void Port_or_port_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_or_port_declaration::Port_or_port_declaration(std::string element) {
  this->setElement(element);
}

void Port_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_declaration::Port_declaration(std::string element) {
  this->setElement(element);
}

void List_of_ports_or_port_declarations_item_last::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_ports_or_port_declarations_item_last::
    List_of_ports_or_port_declarations_item_last(std::string element) {
  this->setElement(element);
}

void List_of_ports_or_port_declarations_trailing_comma::accept(
    Visitor &visitor) {
  visitor.visit(this);
}

List_of_ports_or_port_declarations_trailing_comma::
    List_of_ports_or_port_declarations_trailing_comma(std::string element) {
  this->setElement(element);
}

void List_of_ports_or_port_declarations::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_ports_or_port_declarations::List_of_ports_or_port_declarations(
    std::string element) {
  this->setElement(element);
}

void Dir::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dir::Dir(std::string element) {
  this->setElement(element);
}

void Var_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Var_type::Var_type(std::string element) {
  this->setElement(element);
}

void List_of_port_identifiers::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_port_identifiers::List_of_port_identifiers(std::string element) {
  this->setElement(element);
}

void Port_direction::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_direction::Port_direction(std::string element) {
  this->setElement(element);
}

void List_of_module_item_identifiers::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_module_item_identifiers::List_of_module_item_identifiers(
    std::string element) {
  this->setElement(element);
}

void List_of_identifiers_unpacked_dimensions::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_identifiers_unpacked_dimensions::
    List_of_identifiers_unpacked_dimensions(std::string element) {
  this->setElement(element);
}

void Port_net_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_net_type::Port_net_type(std::string element) {
  this->setElement(element);
}

void Identifier_optional_unpacked_dimensions::accept(Visitor &visitor) {
  visitor.visit(this);
}

Identifier_optional_unpacked_dimensions::
    Identifier_optional_unpacked_dimensions(std::string element) {
  this->setElement(element);
}

void Drive_strength_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Drive_strength_opt::Drive_strength_opt(std::string element) {
  this->setElement(element);
}

void Drive_strength::accept(Visitor &visitor) {
  visitor.visit(this);
}

Drive_strength::Drive_strength(std::string element) {
  this->setElement(element);
}

void Cont_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

Cont_assign::Cont_assign(std::string element) {
  this->setElement(element);
}

void Cont_assign_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Cont_assign_list::Cont_assign_list(std::string element) {
  this->setElement(element);
}

void Edge_operator::accept(Visitor &visitor) {
  visitor.visit(this);
}

Edge_operator::Edge_operator(std::string element) {
  this->setElement(element);
}

void Event_expression::accept(Visitor &visitor) {
  visitor.visit(this);
}

Event_expression::Event_expression(std::string element) {
  this->setElement(element);
}

void Event_expression_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Event_expression_list::Event_expression_list(std::string element) {
  this->setElement(element);
}

void Hierarchy_event_identifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Hierarchy_event_identifier::Hierarchy_event_identifier(std::string element) {
  this->setElement(element);
}

void Unique_priority_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Unique_priority_opt::Unique_priority_opt(std::string element) {
  this->setElement(element);
}

void Expression_in_parens::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expression_in_parens::Expression_in_parens(std::string element) {
  this->setElement(element);
}

void Delay_or_event_control_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay_or_event_control_opt::Delay_or_event_control_opt(std::string element) {
  this->setElement(element);
}

void Delay_or_event_control::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay_or_event_control::Delay_or_event_control(std::string element) {
  this->setElement(element);
}

void Expression_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expression_opt::Expression_opt(std::string element) {
  this->setElement(element);
}

void Bit_logic_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Bit_logic_opt::Bit_logic_opt(std::string element) {
  this->setElement(element);
}

void Bit_logic::accept(Visitor &visitor) {
  visitor.visit(this);
}

Bit_logic::Bit_logic(std::string element) {
  this->setElement(element);
}

void Param_type_followed_by_id_and_dimensions_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Param_type_followed_by_id_and_dimensions_opt::
    Param_type_followed_by_id_and_dimensions_opt(std::string element) {
  this->setElement(element);
}

void Parameter_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_expr::Parameter_expr(std::string element) {
  this->setElement(element);
}

void Parameter_value_ranges_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_value_ranges_opt::Parameter_value_ranges_opt(std::string element) {
  this->setElement(element);
}

void Parameter_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_assign::Parameter_assign(std::string element) {
  this->setElement(element);
}

void Parameter_assign_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_assign_list::Parameter_assign_list(std::string element) {
  this->setElement(element);
}

void Localparam_assign_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Localparam_assign_list::Localparam_assign_list(std::string element) {
  this->setElement(element);
}

void Type_assignment_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Type_assignment_list::Type_assignment_list(std::string element) {
  this->setElement(element);
}

void Macronumericwidth::accept(Visitor &visitor) {
  visitor.visit(this);
}

Macronumericwidth::Macronumericwidth(std::string element) {
  this->setElement(element);
}

void Hex_based_number::accept(Visitor &visitor) {
  visitor.visit(this);
}

Hex_based_number::Hex_based_number(std::string element) {
  this->setElement(element);
}

void Tk_hexbase::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_hexbase::Tk_hexbase(std::string element) {
  this->setElement(element);
}

void Tk_hexdigits::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_hexdigits::Tk_hexdigits(std::string element) {
  this->setElement(element);
}

void Dec_based_number::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dec_based_number::Dec_based_number(std::string element) {
  this->setElement(element);
}

void Bin_based_number::accept(Visitor &visitor) {
  visitor.visit(this);
}

Bin_based_number::Bin_based_number(std::string element) {
  this->setElement(element);
}

void Oct_based_number::accept(Visitor &visitor) {
  visitor.visit(this);
}

Oct_based_number::Oct_based_number(std::string element) {
  this->setElement(element);
}

void Tk_decbase::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_decbase::Tk_decbase(std::string element) {
  this->setElement(element);
}

void Tk_decdigits::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_decdigits::Tk_decdigits(std::string element) {
  this->setElement(element);
}

void Tk_xzdigits::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_xzdigits::Tk_xzdigits(std::string element) {
  this->setElement(element);
}

void Case_any::accept(Visitor &visitor) {
  visitor.visit(this);
}

Case_any::Case_any(std::string element) {
  this->setElement(element);
}

void Expression_list_proper::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expression_list_proper::Expression_list_proper(std::string element) {
  this->setElement(element);
}

void Case_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Case_item::Case_item(std::string element) {
  this->setElement(element);
}

void Preprocessor_directive::accept(Visitor &visitor) {
  visitor.visit(this);
}

Preprocessor_directive::Preprocessor_directive(std::string element) {
  this->setElement(element);
}

void Case_items::accept(Visitor &visitor) {
  visitor.visit(this);
}

Case_items::Case_items(std::string element) {
  this->setElement(element);
}

void Tk_binbase::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_binbase::Tk_binbase(std::string element) {
  this->setElement(element);
}

void Tk_bindigits::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_bindigits::Tk_bindigits(std::string element) {
  this->setElement(element);
}

void Dist_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dist_opt::Dist_opt(std::string element) {
  this->setElement(element);
}

void Expression_or_dist::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expression_or_dist::Expression_or_dist(std::string element) {
  this->setElement(element);
}

void Boolean_abbrev_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Boolean_abbrev_opt::Boolean_abbrev_opt(std::string element) {
  this->setElement(element);
}

void Sequence_repetition_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_repetition_expr::Sequence_repetition_expr(std::string element) {
  this->setElement(element);
}

void Sequence_expr_primary::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_expr_primary::Sequence_expr_primary(std::string element) {
  this->setElement(element);
}

void Sequence_delay_repetition_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_delay_repetition_list::Sequence_delay_repetition_list(
    std::string element) {
  this->setElement(element);
}

void Sequence_delay_range_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_delay_range_expr::Sequence_delay_range_expr(std::string element) {
  this->setElement(element);
}

void Sequence_throughout_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_throughout_expr::Sequence_throughout_expr(std::string element) {
  this->setElement(element);
}

void Sequence_within_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_within_expr::Sequence_within_expr(std::string element) {
  this->setElement(element);
}

void Sequence_intersect_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_intersect_expr::Sequence_intersect_expr(std::string element) {
  this->setElement(element);
}

void Sequence_unary_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_unary_expr::Sequence_unary_expr(std::string element) {
  this->setElement(element);
}

void Sequence_and_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_and_expr::Sequence_and_expr(std::string element) {
  this->setElement(element);
}

void Sequence_or_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_or_expr::Sequence_or_expr(std::string element) {
  this->setElement(element);
}

void Simple_sequence_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Simple_sequence_expr::Simple_sequence_expr(std::string element) {
  this->setElement(element);
}

void Property_if_else_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_if_else_expr::Property_if_else_expr(std::string element) {
  this->setElement(element);
}

void Property_prefix_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_prefix_expr::Property_prefix_expr(std::string element) {
  this->setElement(element);
}

void Property_implication_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_implication_expr::Property_implication_expr(std::string element) {
  this->setElement(element);
}

void Sequence_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Sequence_expr::Sequence_expr(std::string element) {
  this->setElement(element);
}

void Property_expr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_expr::Property_expr(std::string element) {
  this->setElement(element);
}

void Property_expr_or_assignment::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_expr_or_assignment::Property_expr_or_assignment(std::string element) {
  this->setElement(element);
}

void Property_expr_or_assignment_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_expr_or_assignment_list::Property_expr_or_assignment_list(
    std::string element) {
  this->setElement(element);
}

void Expr_mintypmax_generalized::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expr_mintypmax_generalized::Expr_mintypmax_generalized(std::string element) {
  this->setElement(element);
}

void Expr_mintypmax_trans_set::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expr_mintypmax_trans_set::Expr_mintypmax_trans_set(std::string element) {
  this->setElement(element);
}

void Expr_mintypmax::accept(Visitor &visitor) {
  visitor.visit(this);
}

Expr_mintypmax::Expr_mintypmax(std::string element) {
  this->setElement(element);
}

void Value_range::accept(Visitor &visitor) {
  visitor.visit(this);
}

Value_range::Value_range(std::string element) {
  this->setElement(element);
}

void Streaming_concatenation::accept(Visitor &visitor) {
  visitor.visit(this);
}

Streaming_concatenation::Streaming_concatenation(std::string element) {
  this->setElement(element);
}

void Genvar_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Genvar_opt::Genvar_opt(std::string element) {
  this->setElement(element);
}

void For_step::accept(Visitor &visitor) {
  visitor.visit(this);
}

For_step::For_step(std::string element) {
  this->setElement(element);
}

void For_step_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

For_step_opt::For_step_opt(std::string element) {
  this->setElement(element);
}

void Generate_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Generate_item::Generate_item(std::string element) {
  this->setElement(element);
}

void Generate_block::accept(Visitor &visitor) {
  visitor.visit(this);
}

Generate_block::Generate_block(std::string element) {
  this->setElement(element);
}

void Generate_item_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Generate_item_list::Generate_item_list(std::string element) {
  this->setElement(element);
}

void Generate_item_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Generate_item_list_opt::Generate_item_list_opt(std::string element) {
  this->setElement(element);
}

void For_init_decl_or_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

For_init_decl_or_assign::For_init_decl_or_assign(std::string element) {
  this->setElement(element);
}

void For_initialization::accept(Visitor &visitor) {
  visitor.visit(this);
}

For_initialization::For_initialization(std::string element) {
  this->setElement(element);
}

void For_initialization_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

For_initialization_opt::For_initialization_opt(std::string element) {
  this->setElement(element);
}

void Repeat_control::accept(Visitor &visitor) {
  visitor.visit(this);
}

Repeat_control::Repeat_control(std::string element) {
  this->setElement(element);
}

void Tk_stringliteral::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_stringliteral::Tk_stringliteral(std::string element) {
  this->setElement(element);
}

void Tk_evalstringliteral::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_evalstringliteral::Tk_evalstringliteral(std::string element) {
  this->setElement(element);
}

void Preprocess_include_argument::accept(Visitor &visitor) {
  visitor.visit(this);
}

Preprocess_include_argument::Preprocess_include_argument(std::string element) {
  this->setElement(element);
}

void Pp_identifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Pp_identifier::Pp_identifier(std::string element) {
  this->setElement(element);
}

void Macro_formals_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Macro_formals_list_opt::Macro_formals_list_opt(std::string element) {
  this->setElement(element);
}

void Parameter_expr_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_expr_list::Parameter_expr_list(std::string element) {
  this->setElement(element);
}

void Parameter_value_byname_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_value_byname_list::Parameter_value_byname_list(std::string element) {
  this->setElement(element);
}

void Parameter_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_opt::Parameter_opt(std::string element) {
  this->setElement(element);
}

void Module_parameter_port::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_parameter_port::Module_parameter_port(std::string element) {
  this->setElement(element);
}

void Type_assignment::accept(Visitor &visitor) {
  visitor.visit(this);
}

Type_assignment::Type_assignment(std::string element) {
  this->setElement(element);
}

void Module_parameter_port_list_item_last::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_parameter_port_list_item_last::Module_parameter_port_list_item_last(
    std::string element) {
  this->setElement(element);
}

void Module_parameter_port_list_trailing_comma::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_parameter_port_list_trailing_comma::
    Module_parameter_port_list_trailing_comma(std::string element) {
  this->setElement(element);
}

void Module_parameter_port_list_preprocessor_last::accept(Visitor &visitor) {
  visitor.visit(this);
}

Module_parameter_port_list_preprocessor_last::
    Module_parameter_port_list_preprocessor_last(std::string element) {
  this->setElement(element);
}

void Parameter_value_byname::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_value_byname::Parameter_value_byname(std::string element) {
  this->setElement(element);
}

void Parameter_value_byname_list_item_last::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_value_byname_list_item_last::Parameter_value_byname_list_item_last(
    std::string element) {
  this->setElement(element);
}

void Parameter_value_byname_list_trailing_comma::accept(Visitor &visitor) {
  visitor.visit(this);
}

Parameter_value_byname_list_trailing_comma::
    Parameter_value_byname_list_trailing_comma(std::string element) {
  this->setElement(element);
}

void Generate_if::accept(Visitor &visitor) {
  visitor.visit(this);
}

Generate_if::Generate_if(std::string element) {
  this->setElement(element);
}

void Generate_case_items::accept(Visitor &visitor) {
  visitor.visit(this);
}

Generate_case_items::Generate_case_items(std::string element) {
  this->setElement(element);
}

void Var_or_net_type_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Var_or_net_type_opt::Var_or_net_type_opt(std::string element) {
  this->setElement(element);
}

void Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt::
    accept(Visitor &visitor) {
  visitor.visit(this);
}

Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt::
    Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt(
        std::string element) {
  this->setElement(element);
}

void Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt::accept(
    Visitor &visitor) {
  visitor.visit(this);
}

Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt::
    Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt(
        std::string element) {
  this->setElement(element);
}

void Port_declaration_noattr::accept(Visitor &visitor) {
  visitor.visit(this);
}

Port_declaration_noattr::Port_declaration_noattr(std::string element) {
  this->setElement(element);
}

void Type_identifier_followed_by_id::accept(Visitor &visitor) {
  visitor.visit(this);
}

Type_identifier_followed_by_id::Type_identifier_followed_by_id(
    std::string element) {
  this->setElement(element);
}

void Class_new::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_new::Class_new(std::string element) {
  this->setElement(element);
}

void Dynamic_array_new::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dynamic_array_new::Dynamic_array_new(std::string element) {
  this->setElement(element);
}

void Localparam_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

Localparam_assign::Localparam_assign(std::string element) {
  this->setElement(element);
}

void Defparam_assign::accept(Visitor &visitor) {
  visitor.visit(this);
}

Defparam_assign::Defparam_assign(std::string element) {
  this->setElement(element);
}

void Defparam_assign_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Defparam_assign_list::Defparam_assign_list(std::string element) {
  this->setElement(element);
}

void Any_argument::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_argument::Any_argument(std::string element) {
  this->setElement(element);
}

void Any_argument_list_item_last::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_argument_list_item_last::Any_argument_list_item_last(std::string element) {
  this->setElement(element);
}

void Any_argument_list_trailing_comma::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_argument_list_trailing_comma::Any_argument_list_trailing_comma(
    std::string element) {
  this->setElement(element);
}

void Any_argument_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Any_argument_list::Any_argument_list(std::string element) {
  this->setElement(element);
}

void Argument_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Argument_list_opt::Argument_list_opt(std::string element) {
  this->setElement(element);
}

void Task_declaration_id::accept(Visitor &visitor) {
  visitor.visit(this);
}

Task_declaration_id::Task_declaration_id(std::string element) {
  this->setElement(element);
}

void Scope_or_if_res::accept(Visitor &visitor) {
  visitor.visit(this);
}

Scope_or_if_res::Scope_or_if_res(std::string element) {
  this->setElement(element);
}

void Tf_port_list_paren_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_list_paren_opt::Tf_port_list_paren_opt(std::string element) {
  this->setElement(element);
}

void Tf_port_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_list_opt::Tf_port_list_opt(std::string element) {
  this->setElement(element);
}

void Tf_item_or_statement_or_null::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_item_or_statement_or_null::Tf_item_or_statement_or_null(
    std::string element) {
  this->setElement(element);
}

void Task_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Task_item::Task_item(std::string element) {
  this->setElement(element);
}

void Tf_item_or_statement_or_null_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_item_or_statement_or_null_list::Tf_item_or_statement_or_null_list(
    std::string element) {
  this->setElement(element);
}

void Tf_item_or_statement_or_null_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_item_or_statement_or_null_list_opt::Tf_item_or_statement_or_null_list_opt(
    std::string element) {
  this->setElement(element);
}

void Array_reduction_method::accept(Visitor &visitor) {
  visitor.visit(this);
}

Array_reduction_method::Array_reduction_method(std::string element) {
  this->setElement(element);
}

void Array_locator_method::accept(Visitor &visitor) {
  visitor.visit(this);
}

Array_locator_method::Array_locator_method(std::string element) {
  this->setElement(element);
}

void Gatetype::accept(Visitor &visitor) {
  visitor.visit(this);
}

Gatetype::Gatetype(std::string element) {
  this->setElement(element);
}

void Primitive_gate_instance::accept(Visitor &visitor) {
  visitor.visit(this);
}

Primitive_gate_instance::Primitive_gate_instance(std::string element) {
  this->setElement(element);
}

void Primitive_gate_instance_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Primitive_gate_instance_list::Primitive_gate_instance_list(
    std::string element) {
  this->setElement(element);
}

void Switchtype::accept(Visitor &visitor) {
  visitor.visit(this);
}

Switchtype::Switchtype(std::string element) {
  this->setElement(element);
}

void Dr_strength1::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dr_strength1::Dr_strength1(std::string element) {
  this->setElement(element);
}

void Dr_strength0::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dr_strength0::Dr_strength0(std::string element) {
  this->setElement(element);
}

void Delay_scope::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay_scope::Delay_scope(std::string element) {
  this->setElement(element);
}

void Join_keyword::accept(Visitor &visitor) {
  visitor.visit(this);
}

Join_keyword::Join_keyword(std::string element) {
  this->setElement(element);
}

void Generate_case_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Generate_case_item::Generate_case_item(std::string element) {
  this->setElement(element);
}

void Function_return_type_and_id::accept(Visitor &visitor) {
  visitor.visit(this);
}

Function_return_type_and_id::Function_return_type_and_id(std::string element) {
  this->setElement(element);
}

void Tf_port_direction::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_direction::Tf_port_direction(std::string element) {
  this->setElement(element);
}

void Tf_port_direction_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_direction_opt::Tf_port_direction_opt(std::string element) {
  this->setElement(element);
}

void Tf_port_item_expr_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_item_expr_opt::Tf_port_item_expr_opt(std::string element) {
  this->setElement(element);
}

void Tf_port_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_item::Tf_port_item(std::string element) {
  this->setElement(element);
}

void Tf_port_list_item_last::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_list_item_last::Tf_port_list_item_last(std::string element) {
  this->setElement(element);
}

void Tf_port_list_trailing_comma::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_list_trailing_comma::Tf_port_list_trailing_comma(std::string element) {
  this->setElement(element);
}

void Tf_port_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_list::Tf_port_list(std::string element) {
  this->setElement(element);
}

void Endfunction_label_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Endfunction_label_opt::Endfunction_label_opt(std::string element) {
  this->setElement(element);
}

void Function_item_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Function_item_list::Function_item_list(std::string element) {
  this->setElement(element);
}

void Statement_or_null_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Statement_or_null_list_opt::Statement_or_null_list_opt(std::string element) {
  this->setElement(element);
}

void Net_type_or_none::accept(Visitor &visitor) {
  visitor.visit(this);
}

Net_type_or_none::Net_type_or_none(std::string element) {
  this->setElement(element);
}

void Pull01::accept(Visitor &visitor) {
  visitor.visit(this);
}

Pull01::Pull01(std::string element) {
  this->setElement(element);
}

void Macro_formal_parameter::accept(Visitor &visitor) {
  visitor.visit(this);
}

Macro_formal_parameter::Macro_formal_parameter(std::string element) {
  this->setElement(element);
}

void Macro_formals_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Macro_formals_list::Macro_formals_list(std::string element) {
  this->setElement(element);
}

void Tf_variable_identifier_first::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_variable_identifier_first::Tf_variable_identifier_first(
    std::string element) {
  this->setElement(element);
}

void List_of_tf_variable_identifiers::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_tf_variable_identifiers::List_of_tf_variable_identifiers(
    std::string element) {
  this->setElement(element);
}

void Tf_variable_identifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_variable_identifier::Tf_variable_identifier(std::string element) {
  this->setElement(element);
}

void Tf_port_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tf_port_declaration::Tf_port_declaration(std::string element) {
  this->setElement(element);
}

void Function_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Function_item::Function_item(std::string element) {
  this->setElement(element);
}

void Function_item_data_declaration::accept(Visitor &visitor) {
  visitor.visit(this);
}

Function_item_data_declaration::Function_item_data_declaration(
    std::string element) {
  this->setElement(element);
}

void Non_anonymous_instantiation_base::accept(Visitor &visitor) {
  visitor.visit(this);
}

Non_anonymous_instantiation_base::Non_anonymous_instantiation_base(
    std::string element) {
  this->setElement(element);
}

void Statement_or_null_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Statement_or_null_list::Statement_or_null_list(std::string element) {
  this->setElement(element);
}

void Tk_octbase::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_octbase::Tk_octbase(std::string element) {
  this->setElement(element);
}

void Tk_octdigits::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_octdigits::Tk_octdigits(std::string element) {
  this->setElement(element);
}

void Specify_terminal_descriptor::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_terminal_descriptor::Specify_terminal_descriptor(std::string element) {
  this->setElement(element);
}

void Spec_reference_event::accept(Visitor &visitor) {
  visitor.visit(this);
}

Spec_reference_event::Spec_reference_event(std::string element) {
  this->setElement(element);
}

void Edge_descriptor_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Edge_descriptor_list::Edge_descriptor_list(std::string element) {
  this->setElement(element);
}

void Spec_notifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Spec_notifier::Spec_notifier(std::string element) {
  this->setElement(element);
}

void Spec_notifier_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Spec_notifier_opt::Spec_notifier_opt(std::string element) {
  this->setElement(element);
}

void Specify_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_item::Specify_item(std::string element) {
  this->setElement(element);
}

void Specify_simple_path_decl::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_simple_path_decl::Specify_simple_path_decl(std::string element) {
  this->setElement(element);
}

void Specify_edge_path_decl::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_edge_path_decl::Specify_edge_path_decl(std::string element) {
  this->setElement(element);
}

void Specparam_decl::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specparam_decl::Specparam_decl(std::string element) {
  this->setElement(element);
}

void Specify_item_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_item_list::Specify_item_list(std::string element) {
  this->setElement(element);
}

void Specify_path_identifiers::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_path_identifiers::Specify_path_identifiers(std::string element) {
  this->setElement(element);
}

void Spec_polarity::accept(Visitor &visitor) {
  visitor.visit(this);
}

Spec_polarity::Spec_polarity(std::string element) {
  this->setElement(element);
}

void Specify_simple_path::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_simple_path::Specify_simple_path(std::string element) {
  this->setElement(element);
}

void Delay_value_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Delay_value_list::Delay_value_list(std::string element) {
  this->setElement(element);
}

void Specify_item_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_item_list_opt::Specify_item_list_opt(std::string element) {
  this->setElement(element);
}

void Casting_type::accept(Visitor &visitor) {
  visitor.visit(this);
}

Casting_type::Casting_type(std::string element) {
  this->setElement(element);
}

void Polarity_operator::accept(Visitor &visitor) {
  visitor.visit(this);
}

Polarity_operator::Polarity_operator(std::string element) {
  this->setElement(element);
}

void Specify_edge_path::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specify_edge_path::Specify_edge_path(std::string element) {
  this->setElement(element);
}

void Udp_port_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_port_list::Udp_port_list(std::string element) {
  this->setElement(element);
}

void Udp_port_decl::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_port_decl::Udp_port_decl(std::string element) {
  this->setElement(element);
}

void Udp_port_decls::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_port_decls::Udp_port_decls(std::string element) {
  this->setElement(element);
}

void Udp_init_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_init_opt::Udp_init_opt(std::string element) {
  this->setElement(element);
}

void Udp_initial::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_initial::Udp_initial(std::string element) {
  this->setElement(element);
}

void Udp_input_sym::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_input_sym::Udp_input_sym(std::string element) {
  this->setElement(element);
}

void Udp_input_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_input_list::Udp_input_list(std::string element) {
  this->setElement(element);
}

void Udp_output_sym::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_output_sym::Udp_output_sym(std::string element) {
  this->setElement(element);
}

void Udp_sequ_entry::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_sequ_entry::Udp_sequ_entry(std::string element) {
  this->setElement(element);
}

void Udp_sequ_entry_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_sequ_entry_list::Udp_sequ_entry_list(std::string element) {
  this->setElement(element);
}

void Udp_entry_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_entry_list::Udp_entry_list(std::string element) {
  this->setElement(element);
}

void Udp_comb_entry_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_comb_entry_list::Udp_comb_entry_list(std::string element) {
  this->setElement(element);
}

void Udp_body::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_body::Udp_body(std::string element) {
  this->setElement(element);
}

void Tk_reg_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_reg_opt::Tk_reg_opt(std::string element) {
  this->setElement(element);
}

void Udp_initial_expr_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_initial_expr_opt::Udp_initial_expr_opt(std::string element) {
  this->setElement(element);
}

void Udp_input_declaration_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_input_declaration_list::Udp_input_declaration_list(std::string element) {
  this->setElement(element);
}

void Enum_name::accept(Visitor &visitor) {
  visitor.visit(this);
}

Enum_name::Enum_name(std::string element) {
  this->setElement(element);
}

void Pos_neg_number::accept(Visitor &visitor) {
  visitor.visit(this);
}

Pos_neg_number::Pos_neg_number(std::string element) {
  this->setElement(element);
}

void Enum_name_list_item_last::accept(Visitor &visitor) {
  visitor.visit(this);
}

Enum_name_list_item_last::Enum_name_list_item_last(std::string element) {
  this->setElement(element);
}

void Enum_name_list_trailing_comma::accept(Visitor &visitor) {
  visitor.visit(this);
}

Enum_name_list_trailing_comma::Enum_name_list_trailing_comma(
    std::string element) {
  this->setElement(element);
}

void Enum_name_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Enum_name_list::Enum_name_list(std::string element) {
  this->setElement(element);
}

void Action_block::accept(Visitor &visitor) {
  visitor.visit(this);
}

Action_block::Action_block(std::string element) {
  this->setElement(element);
}

void Simple_immediate_assertion_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Simple_immediate_assertion_statement::Simple_immediate_assertion_statement(
    std::string element) {
  this->setElement(element);
}

void Immediate_assertion_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Immediate_assertion_statement::Immediate_assertion_statement(
    std::string element) {
  this->setElement(element);
}

void Deferred_immediate_assertion_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Deferred_immediate_assertion_statement::Deferred_immediate_assertion_statement(
    std::string element) {
  this->setElement(element);
}

void Var_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Var_opt::Var_opt(std::string element) {
  this->setElement(element);
}

void Data_declaration_modifiers_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_declaration_modifiers_opt::Data_declaration_modifiers_opt(
    std::string element) {
  this->setElement(element);
}

void Data_declaration_base::accept(Visitor &visitor) {
  visitor.visit(this);
}

Data_declaration_base::Data_declaration_base(std::string element) {
  this->setElement(element);
}

void Specparam::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specparam::Specparam(std::string element) {
  this->setElement(element);
}

void Specparam_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Specparam_list::Specparam_list(std::string element) {
  this->setElement(element);
}

void Block_identifier_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Block_identifier_opt::Block_identifier_opt(std::string element) {
  this->setElement(element);
}

void Event_control_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Event_control_opt::Event_control_opt(std::string element) {
  this->setElement(element);
}

void Property_spec_disable_iff_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_spec_disable_iff_opt::Property_spec_disable_iff_opt(
    std::string element) {
  this->setElement(element);
}

void Property_spec::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_spec::Property_spec(std::string element) {
  this->setElement(element);
}

void Assert_property_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Assert_property_statement::Assert_property_statement(std::string element) {
  this->setElement(element);
}

void Concurrent_assertion_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Concurrent_assertion_statement::Concurrent_assertion_statement(
    std::string element) {
  this->setElement(element);
}

void Assume_property_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Assume_property_statement::Assume_property_statement(std::string element) {
  this->setElement(element);
}

void Cover_property_statement::accept(Visitor &visitor) {
  visitor.visit(this);
}

Cover_property_statement::Cover_property_statement(std::string element) {
  this->setElement(element);
}

void Concurrent_assertion_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Concurrent_assertion_item::Concurrent_assertion_item(std::string element) {
  this->setElement(element);
}

void Tk_virtual_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_virtual_opt::Tk_virtual_opt(std::string element) {
  this->setElement(element);
}

void Class_declaration_extends_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_declaration_extends_opt::Class_declaration_extends_opt(
    std::string element) {
  this->setElement(element);
}

void Implements_interface_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Implements_interface_list_opt::Implements_interface_list_opt(
    std::string element) {
  this->setElement(element);
}

void Variable_decl_assignment::accept(Visitor &visitor) {
  visitor.visit(this);
}

Variable_decl_assignment::Variable_decl_assignment(std::string element) {
  this->setElement(element);
}

void List_of_variable_decl_assignments::accept(Visitor &visitor) {
  visitor.visit(this);
}

List_of_variable_decl_assignments::List_of_variable_decl_assignments(
    std::string element) {
  this->setElement(element);
}

void Class_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_item::Class_item(std::string element) {
  this->setElement(element);
}

void Class_constructor::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_constructor::Class_constructor(std::string element) {
  this->setElement(element);
}

void Method_qualifier_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Method_qualifier_list_opt::Method_qualifier_list_opt(std::string element) {
  this->setElement(element);
}

void Method_prototype::accept(Visitor &visitor) {
  visitor.visit(this);
}

Method_prototype::Method_prototype(std::string element) {
  this->setElement(element);
}

void Class_item_qualifier_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_item_qualifier_list_opt::Class_item_qualifier_list_opt(
    std::string element) {
  this->setElement(element);
}

void Method_property_qualifier_list_not_starting_with_virtual::accept(
    Visitor &visitor) {
  visitor.visit(this);
}

Method_property_qualifier_list_not_starting_with_virtual::
    Method_property_qualifier_list_not_starting_with_virtual(
        std::string element) {
  this->setElement(element);
}

void Class_items::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_items::Class_items(std::string element) {
  this->setElement(element);
}

void Class_constructor_prototype::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_constructor_prototype::Class_constructor_prototype(std::string element) {
  this->setElement(element);
}

void Endnew_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Endnew_opt::Endnew_opt(std::string element) {
  this->setElement(element);
}

void Class_items_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_items_opt::Class_items_opt(std::string element) {
  this->setElement(element);
}

void Package_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_item::Package_item(std::string element) {
  this->setElement(element);
}

void Package_item_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_item_list::Package_item_list(std::string element) {
  this->setElement(element);
}

void Task_prototype::accept(Visitor &visitor) {
  visitor.visit(this);
}

Task_prototype::Task_prototype(std::string element) {
  this->setElement(element);
}

void Function_prototype::accept(Visitor &visitor) {
  visitor.visit(this);
}

Function_prototype::Function_prototype(std::string element) {
  this->setElement(element);
}

void Package_item_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_item_list_opt::Package_item_list_opt(std::string element) {
  this->setElement(element);
}

void Select_dimensions_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Select_dimensions_opt::Select_dimensions_opt(std::string element) {
  this->setElement(element);
}

void Hierarchy_segment::accept(Visitor &visitor) {
  visitor.visit(this);
}

Hierarchy_segment::Hierarchy_segment(std::string element) {
  this->setElement(element);
}

void Dpi_spec_string::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dpi_spec_string::Dpi_spec_string(std::string element) {
  this->setElement(element);
}

void Dpi_import_property_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dpi_import_property_opt::Dpi_import_property_opt(std::string element) {
  this->setElement(element);
}

void Dpi_import_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Dpi_import_item::Dpi_import_item(std::string element) {
  this->setElement(element);
}

void Udp_comb_entry::accept(Visitor &visitor) {
  visitor.visit(this);
}

Udp_comb_entry::Udp_comb_entry(std::string element) {
  this->setElement(element);
}

void Tk_ls_eq::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_ls_eq::Tk_ls_eq(std::string element) {
  this->setElement(element);
}

void Tk_rs_eq::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_rs_eq::Tk_rs_eq(std::string element) {
  this->setElement(element);
}

void Tk_rss_eq::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_rss_eq::Tk_rss_eq(std::string element) {
  this->setElement(element);
}

void Packed_signing_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Packed_signing_opt::Packed_signing_opt(std::string element) {
  this->setElement(element);
}

void Random_qualifier_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Random_qualifier_opt::Random_qualifier_opt(std::string element) {
  this->setElement(element);
}

void Data_type_or_implicit_followed_by_id_and_dimensions_opt::accept(
    Visitor &visitor) {
  visitor.visit(this);
}

Data_type_or_implicit_followed_by_id_and_dimensions_opt::
    Data_type_or_implicit_followed_by_id_and_dimensions_opt(
        std::string element) {
  this->setElement(element);
}

void Type_identifier_or_implicit_followed_by_id_and_dimensions_opt::accept(
    Visitor &visitor) {
  visitor.visit(this);
}

Type_identifier_or_implicit_followed_by_id_and_dimensions_opt::
    Type_identifier_or_implicit_followed_by_id_and_dimensions_opt(
        std::string element) {
  this->setElement(element);
}

void Struct_union_member::accept(Visitor &visitor) {
  visitor.visit(this);
}

Struct_union_member::Struct_union_member(std::string element) {
  this->setElement(element);
}

void Struct_union_member_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Struct_union_member_list::Struct_union_member_list(std::string element) {
  this->setElement(element);
}

void Tk_tagged_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_tagged_opt::Tk_tagged_opt(std::string element) {
  this->setElement(element);
}

void Assignment_pattern::accept(Visitor &visitor) {
  visitor.visit(this);
}

Assignment_pattern::Assignment_pattern(std::string element) {
  this->setElement(element);
}

void Structure_or_array_pattern_expression_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Structure_or_array_pattern_expression_list::
    Structure_or_array_pattern_expression_list(std::string element) {
  this->setElement(element);
}

void Structure_or_array_pattern_key::accept(Visitor &visitor) {
  visitor.visit(this);
}

Structure_or_array_pattern_key::Structure_or_array_pattern_key(
    std::string element) {
  this->setElement(element);
}

void Structure_or_array_pattern_expression::accept(Visitor &visitor) {
  visitor.visit(this);
}

Structure_or_array_pattern_expression::Structure_or_array_pattern_expression(
    std::string element) {
  this->setElement(element);
}

void Scope_prefix::accept(Visitor &visitor) {
  visitor.visit(this);
}

Scope_prefix::Scope_prefix(std::string element) {
  this->setElement(element);
}

void Package_import_item::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_import_item::Package_import_item(std::string element) {
  this->setElement(element);
}

void Package_import_item_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Package_import_item_list::Package_import_item_list(std::string element) {
  this->setElement(element);
}

void Tk_edge_descriptor::accept(Visitor &visitor) {
  visitor.visit(this);
}

Tk_edge_descriptor::Tk_edge_descriptor(std::string element) {
  this->setElement(element);
}

void Class_item_qualifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Class_item_qualifier::Class_item_qualifier(std::string element) {
  this->setElement(element);
}

void Property_qualifier::accept(Visitor &visitor) {
  visitor.visit(this);
}

Property_qualifier::Property_qualifier(std::string element) {
  this->setElement(element);
}

void Final_or_zero::accept(Visitor &visitor) {
  visitor.visit(this);
}

Final_or_zero::Final_or_zero(std::string element) {
  this->setElement(element);
}

void Stream_operator::accept(Visitor &visitor) {
  visitor.visit(this);
}

Stream_operator::Stream_operator(std::string element) {
  this->setElement(element);
}

void Slice_size_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Slice_size_opt::Slice_size_opt(std::string element) {
  this->setElement(element);
}

void Stream_expression::accept(Visitor &visitor) {
  visitor.visit(this);
}

Stream_expression::Stream_expression(std::string element) {
  this->setElement(element);
}

void Stream_expression_list::accept(Visitor &visitor) {
  visitor.visit(this);
}

Stream_expression_list::Stream_expression_list(std::string element) {
  this->setElement(element);
}

void Identifier_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Identifier_opt::Identifier_opt(std::string element) {
  this->setElement(element);
}

void Clocking_item_list_opt::accept(Visitor &visitor) {
  visitor.visit(this);
}

Clocking_item_list_opt::Clocking_item_list_opt(std::string element) {
  this->setElement(element);
}

std::map<std::string, std::function<std::shared_ptr<Node>(const std::string &)>>
    classMap = {
        {"terminal",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Terminal>(f);
         }},
        {"time_literal",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Time_literal>(f);
         }},
        {"tk_timeliteral",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tk_timeliteral>(f);
         }},
        {"tk_decnumber",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tk_decnumber>(f);
         }},
        {"timescale_directive",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Timescale_directive>(f);
         }},
        {"package_item_no_pp",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_item_no_pp>(f);
         }},
        {"misc_directive",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Misc_directive>(f);
         }},
        {"package_or_generate_item_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_or_generate_item_declaration>(f);
         }},
        {"data_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Data_declaration>(f);
         }},
        {"any_param_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Any_param_declaration>(f);
         }},
        {"timeunits_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Timeunits_declaration>(f);
         }},
        {"type_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Type_declaration>(f);
         }},
        {"package_import_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_import_declaration>(f);
         }},
        {"description",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Description>(f);
         }},
        {"module_or_interface_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_or_interface_declaration>(f);
         }},
        {"preprocessor_action",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Preprocessor_action>(f);
         }},
        {"udp_primitive",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Udp_primitive>(f);
         }},
        {"package_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_declaration>(f);
         }},
        {"description_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Description_list>(f);
         }},
        {"module_start",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_start>(f);
         }},
        {"lifetime_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Lifetime_opt>(f);
         }},
        {"lifetime",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Lifetime>(f);
         }},
        {"genericidentifier",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Genericidentifier>(f);
         }},
        {"symbolidentifier",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Symbolidentifier>(f);
         }},
        {"escapedidentifier",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Escapedidentifier>(f);
         }},
        {"keywordidentifier",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Keywordidentifier>(f);
         }},
        {"symbol_or_label",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Symbol_or_label>(f);
         }},
        {"module_package_import_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_package_import_list_opt>(f);
         }},
        {"package_import_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_import_list>(f);
         }},
        {"module_parameter_port_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_parameter_port_list_opt>(f);
         }},
        {"module_parameter_port_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_parameter_port_list>(f);
         }},
        {"module_port_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_port_list_opt>(f);
         }},
        {"list_of_ports_or_port_declarations_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<List_of_ports_or_port_declarations_opt>(f);
         }},
        {"module_attribute_foreign_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_attribute_foreign_opt>(f);
         }},
        {"integer_vector_type",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Integer_vector_type>(f);
         }},
        {"signed_unsigned_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Signed_unsigned_opt>(f);
         }},
        {"signing",
         [](const std::string &f)
             -> std::shared_ptr<Node> { return std::make_shared<Signing>(f); }},
        {"data_type_primitive_scalar",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Data_type_primitive_scalar>(f);
         }},
        {"integer_atom_type",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Integer_atom_type>(f);
         }},
        {"non_integer_type",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Non_integer_type>(f); }},
        {"enum_data_type",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Enum_data_type>(f); }},
        {"struct_data_type",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Struct_data_type>(f); }},
        {"decl_dimensions_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Decl_dimensions_opt>(f);
         }},
        {"decl_dimensions",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Decl_dimensions>(f);
                 }},
        {"data_type_primitive",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Data_type_primitive>(f);
         }},
        {"data_type_base",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Data_type_base>(
                                            f);
                                      }},
        {"data_type",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Data_type>(f);
                                      }},
        {"reference",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Reference>(f);
                                      }},
        {"instantiation_type",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Instantiation_type>(f);
         }},
        {"trailing_decl_assignment_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Trailing_decl_assignment_opt>(f);
         }},
        {"trailing_decl_assignment",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Trailing_decl_assignment>(f);
         }},
        {"non_anonymous_gate_instance_or_register_variable",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Non_anonymous_gate_instance_or_register_variable>(f);
         }},
        {"any_port_list_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Any_port_list_opt>(f);
         }},
        {"non_anonymous_gate_instance_or_register_variable_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Non_anonymous_gate_instance_or_register_variable_list>(f);
         }},
        {"gate_instance_or_register_variable",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Gate_instance_or_register_variable>(f);
         }},
        {"instantiation_base",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Instantiation_base>(f);
         }},
        {"reference_or_call_base",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Reference_or_call_base>(f);
         }},
        {"data_declaration_or_module_instantiation",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Data_declaration_or_module_instantiation>(f);
         }},
        {"const_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Const_opt>(f);
                                      }},
        {"module_or_generate_item",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_or_generate_item>(f);
         }},
        {"module_common_item",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_common_item>(f);
         }},
        {"parameter_override",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_override>(f);
         }},
        {"gate_instantiation",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Gate_instantiation>(f);
         }},
        {"non_port_module_item",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Non_port_module_item>(f);
         }},
        {"generate_region",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Generate_region>(f);
                 }},
        {"specify_block",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Specify_block>(
                                            f);
                                      }},
        {"module_item",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Module_item>(f);
                                      }},
        {"module_port_declaration",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_port_declaration>(f);
         }},
        {"module_block",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Module_block>(
                                            f);
                                      }},
        {"module_item_directive",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_item_directive>(f);
         }},
        {"module_item_list",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Module_item_list>(f);
                 }},
        {"net_type",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Net_type>(f);
                                      }},
        {"number",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Number>(f);
                                      }},
        {"constant_dec_number",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Constant_dec_number>(f);
         }},
        {"based_number",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Based_number>(
                                            f);
                                      }},
        {"tk_unbasednumber",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Tk_unbasednumber>(f);
                 }},
        {"expr_primary_no_groups",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expr_primary_no_groups>(f);
         }},
        {"system_tf_call",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<System_tf_call>(
                                            f);
                                      }},
        {"string_literal",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<String_literal>(
                                            f);
                                      }},
        {"tk_realtime",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Tk_realtime>(f);
                                      }},
        {"cast",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Cast>(f);
                                      }},
        {"expr_primary",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Expr_primary>(
                                            f);
                                      }},
        {"expr_primary_parens",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expr_primary_parens>(f);
         }},
        {"expr_primary_braces",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expr_primary_braces>(f);
         }},
        {"assignment_pattern_expression",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Assignment_pattern_expression>(f);
         }},
        {"postfix_expression",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Postfix_expression>(f);
         }},
        {"reference_or_call",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Reference_or_call>(f);
         }},
        {"inc_or_dec_or_primary_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Inc_or_dec_or_primary_expr>(f);
         }},
        {"inc_or_dec_expression",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Inc_or_dec_expression>(f);
         }},
        {"unary_prefix_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Unary_prefix_expr>(f);
         }},
        {"unary_op",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Unary_op>(f);
                                      }},
        {"unary_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Unary_expr>(f);
                                      }},
        {"pow_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Pow_expr>(f);
                                      }},
        {"mul_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Mul_expr>(f);
                                      }},
        {"add_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Add_expr>(f);
                                      }},
        {"shift_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Shift_expr>(f);
                                      }},
        {"comp_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Comp_expr>(f);
                                      }},
        {"open_range_list",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Open_range_list>(f);
                 }},
        {"logeq_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Logeq_expr>(f);
                                      }},
        {"caseeq_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Caseeq_expr>(f);
                                      }},
        {"bitand_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Bitand_expr>(f);
                                      }},
        {"xor_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Xor_expr>(f);
                                      }},
        {"bitor_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Bitor_expr>(f);
                                      }},
        {"with_exprs_suffix",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<With_exprs_suffix>(f);
         }},
        {"matches_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Matches_expr>(
                                            f);
                                      }},
        {"logand_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Logand_expr>(f);
                                      }},
        {"logor_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Logor_expr>(f);
                                      }},
        {"cond_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Cond_expr>(f);
                                      }},
        {"expression",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Expression>(f);
                                      }},
        {"equiv_impl_expr",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Equiv_impl_expr>(f);
                 }},
        {"decl_variable_dimension",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Decl_variable_dimension>(f);
         }},
        {"expression_or_null_list_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expression_or_null_list_opt>(f);
         }},
        {"delay3_or_drive_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Delay3_or_drive_opt>(f);
         }},
        {"delay3",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Delay3>(f);
                                      }},
        {"data_type_or_implicit",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Data_type_or_implicit>(f);
         }},
        {"net_variable",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Net_variable>(
                                            f);
                                      }},
        {"net_variable_or_decl_assign",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Net_variable_or_decl_assign>(f);
         }},
        {"net_decl_assign",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Net_decl_assign>(f);
                 }},
        {"net_variable_or_decl_assigns",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Net_variable_or_decl_assigns>(f);
         }},
        {"net_declaration",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Net_declaration>(f);
                 }},
        {"charge_strength_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Charge_strength_opt>(f);
         }},
        {"delay3_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Delay3_opt>(f);
                                      }},
        {"list_of_identifiers",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<List_of_identifiers>(f);
         }},
        {"task_declaration",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Task_declaration>(f);
                 }},
        {"function_declaration",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Function_declaration>(f);
         }},
        {"class_declaration",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Class_declaration>(f);
         }},
        {"dpi_import_export",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Dpi_import_export>(f);
         }},
        {"specparam_declaration",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specparam_declaration>(f);
         }},
        {"module_or_generate_item_declaration",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_or_generate_item_declaration>(f);
         }},
        {"genvar_declaration",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Genvar_declaration>(f);
         }},
        {"clocking_declaration",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Clocking_declaration>(f);
         }},
        {"initial_construct",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Initial_construct>(f);
         }},
        {"always_construct",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Always_construct>(f);
                 }},
        {"continuous_assign",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Continuous_assign>(f);
         }},
        {"loop_generate_construct",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Loop_generate_construct>(f);
         }},
        {"conditional_generate_construct",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Conditional_generate_construct>(f);
         }},
        {"assertion_item",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Assertion_item>(
                                            f);
                                      }},
        {"final_construct",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Final_construct>(f);
                 }},
        {"parameter_value_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_value_opt>(f);
         }},
        {"parameters",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Parameters>(f);
                                      }},
        {"unqualified_id",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Unqualified_id>(
                                            f);
                                      }},
        {"class_id",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Class_id>(f);
                                      }},
        {"qualified_id",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Qualified_id>(
                                            f);
                                      }},
        {"type_or_id_root",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Type_or_id_root>(f);
                 }},
        {"implicit_class_handle",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Implicit_class_handle>(f);
         }},
        {"local_root",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Local_root>(f);
                                      }},
        {"select_variable_dimension",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Select_variable_dimension>(f);
         }},
        {"hierarchy_extension",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Hierarchy_extension>(f);
         }},
        {"member_name",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Member_name>(f);
                                      }},
        {"builtin_array_method",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Builtin_array_method>(f);
         }},
        {"port_named",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Port_named>(f);
                                      }},
        {"any_port",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Any_port>(f);
                                      }},
        {"any_port_list_item_last",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Any_port_list_item_last>(f);
         }},
        {"any_port_list_trailing_comma",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Any_port_list_trailing_comma>(f);
         }},
        {"any_port_list",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Any_port_list>(
                                            f);
                                      }},
        {"label_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Label_opt>(f);
                                      }},
        {"begin",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Begin>(f);
                                      }},
        {"lpvalue",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Lpvalue>(f);
                                      }},
        {"range_list_in_braces",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Range_list_in_braces>(f);
         }},
        {"assignment_statement_no_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Assignment_statement_no_expr>(f);
         }},
        {"assign_modify_statement",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Assign_modify_statement>(f);
         }},
        {"assignment_statement",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Assignment_statement>(f);
         }},
        {"statement_item",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Statement_item>(
                                            f);
                                      }},
        {"procedural_timing_control_statement",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Procedural_timing_control_statement>(f);
         }},
        {"subroutine_call",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Subroutine_call>(f);
                 }},
        {"seq_block",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Seq_block>(f);
                                      }},
        {"nonblocking_assignment",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Nonblocking_assignment>(f);
         }},
        {"conditional_statement",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Conditional_statement>(f);
         }},
        {"case_statement",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Case_statement>(
                                            f);
                                      }},
        {"loop_statement",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Loop_statement>(
                                            f);
                                      }},
        {"par_block",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Par_block>(f);
                                      }},
        {"blocking_assignment",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Blocking_assignment>(f);
         }},
        {"wait_statement",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Wait_statement>(
                                            f);
                                      }},
        {"procedural_assertion_statement",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Procedural_assertion_statement>(f);
         }},
        {"procedural_continuous_assignment",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Procedural_continuous_assignment>(f);
         }},
        {"event_trigger",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Event_trigger>(
                                            f);
                                      }},
        {"disable_statement",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Disable_statement>(f);
         }},
        {"jump_statement",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Jump_statement>(
                                            f);
                                      }},
        {"block_item_or_statement_or_null",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Block_item_or_statement_or_null>(f);
         }},
        {"block_item_decl",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Block_item_decl>(f);
                 }},
        {"block_item_or_statement_or_null_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Block_item_or_statement_or_null_list>(f);
         }},
        {"delay_value_simple",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Delay_value_simple>(f);
         }},
        {"delay_identifier",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Delay_identifier>(f);
                 }},
        {"delay1",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Delay1>(f);
                                      }},
        {"delay_value",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Delay_value>(f);
                                      }},
        {"statement_or_null",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Statement_or_null>(f);
         }},
        {"statement",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Statement>(f);
                                      }},
        {"event_control",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Event_control>(
                                            f);
                                      }},
        {"cycle_delay",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Cycle_delay>(f);
                                      }},
        {"systemtfidentifier",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Systemtfidentifier>(f);
         }},
        {"call_base",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Call_base>(f);
                                      }},
        {"block_item_or_statement_or_null_list_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Block_item_or_statement_or_null_list_opt>(f);
         }},
        {"end",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<End>(f);
                                      }},
        {"always_any",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Always_any>(f);
                                      }},
        {"module_item_list_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_item_list_opt>(f);
         }},
        {"module_end",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Module_end>(f);
                                      }},
        {"source_text",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Source_text>(f);
                                      }},
        {"port_reference",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Port_reference>(
                                            f);
                                      }},
        {"port_expression",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Port_expression>(f);
                 }},
        {"port_reference_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Port_reference_list>(f);
         }},
        {"trailing_assign_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Trailing_assign_opt>(f);
         }},
        {"trailing_assign",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Trailing_assign>(f);
                 }},
        {"port",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Port>(f);
                                      }},
        {"port_expression_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Port_expression_opt>(f);
         }},
        {"port_or_port_declaration",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Port_or_port_declaration>(f);
         }},
        {"port_declaration",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Port_declaration>(f);
                 }},
        {"list_of_ports_or_port_declarations_item_last",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               List_of_ports_or_port_declarations_item_last>(f);
         }},
        {"list_of_ports_or_port_declarations_trailing_comma",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               List_of_ports_or_port_declarations_trailing_comma>(f);
         }},
        {"list_of_ports_or_port_declarations",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<List_of_ports_or_port_declarations>(f);
         }},
        {"dir",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Dir>(f);
                                      }},
        {"var_type",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Var_type>(f);
                                      }},
        {"list_of_port_identifiers",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<List_of_port_identifiers>(f);
         }},
        {"port_direction",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Port_direction>(
                                            f);
                                      }},
        {"list_of_module_item_identifiers",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<List_of_module_item_identifiers>(f);
         }},
        {"list_of_identifiers_unpacked_dimensions",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<List_of_identifiers_unpacked_dimensions>(f);
         }},
        {"port_net_type",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Port_net_type>(
                                            f);
                                      }},
        {"identifier_optional_unpacked_dimensions",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Identifier_optional_unpacked_dimensions>(f);
         }},
        {"drive_strength_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Drive_strength_opt>(f);
         }},
        {"drive_strength",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Drive_strength>(
                                            f);
                                      }},
        {"cont_assign",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Cont_assign>(f);
                                      }},
        {"cont_assign_list",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Cont_assign_list>(f);
                 }},
        {"edge_operator",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Edge_operator>(
                                            f);
                                      }},
        {"event_expression",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Event_expression>(f);
                 }},
        {"event_expression_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Event_expression_list>(f);
         }},
        {"hierarchy_event_identifier",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Hierarchy_event_identifier>(f);
         }},
        {"unique_priority_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Unique_priority_opt>(f);
         }},
        {"expression_in_parens",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expression_in_parens>(f);
         }},
        {"delay_or_event_control_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Delay_or_event_control_opt>(f);
         }},
        {"delay_or_event_control",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Delay_or_event_control>(f);
         }},
        {"expression_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Expression_opt>(
                                            f);
                                      }},
        {"bit_logic_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Bit_logic_opt>(
                                            f);
                                      }},
        {"bit_logic",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Bit_logic>(f);
                                      }},
        {"param_type_followed_by_id_and_dimensions_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Param_type_followed_by_id_and_dimensions_opt>(f);
         }},
        {"parameter_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Parameter_expr>(
                                            f);
                                      }},
        {"parameter_value_ranges_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_value_ranges_opt>(f);
         }},
        {"parameter_assign",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Parameter_assign>(f);
                 }},
        {"parameter_assign_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_assign_list>(f);
         }},
        {"localparam_assign_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Localparam_assign_list>(f);
         }},
        {"type_assignment_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Type_assignment_list>(f);
         }},
        {"macronumericwidth",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Macronumericwidth>(f);
         }},
        {"hex_based_number",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Hex_based_number>(f);
                 }},
        {"tk_hexbase",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Tk_hexbase>(f);
                                      }},
        {"tk_hexdigits",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Tk_hexdigits>(
                                            f);
                                      }},
        {"dec_based_number",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Dec_based_number>(f);
                 }},
        {"bin_based_number",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Bin_based_number>(f);
                 }},
        {"oct_based_number",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Oct_based_number>(f);
                 }},
        {"tk_decbase",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Tk_decbase>(f);
                                      }},
        {"tk_decdigits",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Tk_decdigits>(
                                            f);
                                      }},
        {"tk_xzdigits",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Tk_xzdigits>(f);
                                      }},
        {"case_any",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Case_any>(f);
                                      }},
        {"expression_list_proper",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expression_list_proper>(f);
         }},
        {"case_item",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Case_item>(f);
                                      }},
        {"preprocessor_directive",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Preprocessor_directive>(f);
         }},
        {"case_items",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Case_items>(f);
                                      }},
        {"tk_binbase",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Tk_binbase>(f);
                                      }},
        {"tk_bindigits",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Tk_bindigits>(
                                            f);
                                      }},
        {"dist_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Dist_opt>(f);
                                      }},
        {"expression_or_dist",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expression_or_dist>(f);
         }},
        {"boolean_abbrev_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Boolean_abbrev_opt>(f);
         }},
        {"sequence_repetition_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_repetition_expr>(f);
         }},
        {"sequence_expr_primary",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_expr_primary>(f);
         }},
        {"sequence_delay_repetition_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_delay_repetition_list>(f);
         }},
        {"sequence_delay_range_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_delay_range_expr>(f);
         }},
        {"sequence_throughout_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_throughout_expr>(f);
         }},
        {"sequence_within_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_within_expr>(f);
         }},
        {"sequence_intersect_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_intersect_expr>(f);
         }},
        {"sequence_unary_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_unary_expr>(f);
         }},
        {"sequence_and_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Sequence_and_expr>(f);
         }},
        {"sequence_or_expr",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Sequence_or_expr>(f);
                 }},
        {"simple_sequence_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Simple_sequence_expr>(f);
         }},
        {"property_if_else_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Property_if_else_expr>(f);
         }},
        {"property_prefix_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Property_prefix_expr>(f);
         }},
        {"property_implication_expr",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Property_implication_expr>(f);
         }},
        {"sequence_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Sequence_expr>(
                                            f);
                                      }},
        {"property_expr",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Property_expr>(
                                            f);
                                      }},
        {"property_expr_or_assignment",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Property_expr_or_assignment>(f);
         }},
        {"property_expr_or_assignment_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Property_expr_or_assignment_list>(f);
         }},
        {"expr_mintypmax_generalized",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expr_mintypmax_generalized>(f);
         }},
        {"expr_mintypmax_trans_set",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Expr_mintypmax_trans_set>(f);
         }},
        {"expr_mintypmax",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Expr_mintypmax>(
                                            f);
                                      }},
        {"value_range",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Value_range>(f);
                                      }},
        {"streaming_concatenation",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Streaming_concatenation>(f);
         }},
        {"genvar_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Genvar_opt>(f);
                                      }},
        {"for_step",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<For_step>(f);
                                      }},
        {"for_step_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<For_step_opt>(
                                            f);
                                      }},
        {"generate_item",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Generate_item>(
                                            f);
                                      }},
        {"generate_block",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Generate_block>(
                                            f);
                                      }},
        {"generate_item_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Generate_item_list>(f);
         }},
        {"generate_item_list_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Generate_item_list_opt>(f);
         }},
        {"for_init_decl_or_assign",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<For_init_decl_or_assign>(f);
         }},
        {"for_initialization",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<For_initialization>(f);
         }},
        {"for_initialization_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<For_initialization_opt>(f);
         }},
        {"repeat_control",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Repeat_control>(
                                            f);
                                      }},
        {"tk_stringliteral",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Tk_stringliteral>(f);
                 }},
        {"tk_evalstringliteral",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tk_evalstringliteral>(f);
         }},
        {"preprocess_include_argument",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Preprocess_include_argument>(f);
         }},
        {"pp_identifier",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Pp_identifier>(
                                            f);
                                      }},
        {"macro_formals_list_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Macro_formals_list_opt>(f);
         }},
        {"parameter_expr_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_expr_list>(f);
         }},
        {"parameter_value_byname_list",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_value_byname_list>(f);
         }},
        {"parameter_opt",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Parameter_opt>(
                                            f);
                                      }},
        {"module_parameter_port",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_parameter_port>(f);
         }},
        {"type_assignment",
         [](const std::string &f)
             -> std::
                 shared_ptr<Node> {
                   return std::make_shared<Type_assignment>(f);
                 }},
        {"module_parameter_port_list_item_last",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_parameter_port_list_item_last>(f);
         }},
        {"module_parameter_port_list_trailing_comma",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Module_parameter_port_list_trailing_comma>(
               f);
         }},
        {"module_parameter_port_list_preprocessor_last",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Module_parameter_port_list_preprocessor_last>(f);
         }},
        {"parameter_value_byname",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_value_byname>(f);
         }},
        {"parameter_value_byname_list_item_last",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_value_byname_list_item_last>(f);
         }},
        {"parameter_value_byname_list_trailing_comma",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Parameter_value_byname_list_trailing_comma>(
               f);
         }},
        {"generate_if",
         [](const std::string &f) -> std::
                                      shared_ptr<Node> {
                                        return std::make_shared<Generate_if>(f);
                                      }},
        {"generate_case_items",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Generate_case_items>(f);
         }},
        {"var_or_net_type_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Var_or_net_type_opt>(f);
         }},
        {"type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt",
         [](
             const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt>(
               f);
         }},
        {"data_type_or_implicit_basic_followed_by_id_and_dimensions_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt>(
               f);
         }},
        {"port_declaration_noattr",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Port_declaration_noattr>(f);
         }},
        {"type_identifier_followed_by_id",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Type_identifier_followed_by_id>(f);
         }},
        {"class_new",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Class_new>(f); }},
        {"dynamic_array_new",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Dynamic_array_new>(f);
         }},
        {"localparam_assign",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Localparam_assign>(f);
         }},
        {"defparam_assign",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Defparam_assign>(f); }},
        {"defparam_assign_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Defparam_assign_list>(f);
         }},
        {"any_argument",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Any_argument>(f); }},
        {"any_argument_list_item_last",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Any_argument_list_item_last>(f);
         }},
        {"any_argument_list_trailing_comma",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Any_argument_list_trailing_comma>(f);
         }},
        {"any_argument_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Any_argument_list>(f);
         }},
        {"argument_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Argument_list_opt>(f);
         }},
        {"task_declaration_id",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Task_declaration_id>(f);
         }},
        {"scope_or_if_res",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Scope_or_if_res>(f); }},
        {"tf_port_list_paren_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_port_list_paren_opt>(f);
         }},
        {"tf_port_list_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tf_port_list_opt>(f); }},
        {"tf_item_or_statement_or_null",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_item_or_statement_or_null>(f);
         }},
        {"task_item",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Task_item>(f); }},
        {"tf_item_or_statement_or_null_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_item_or_statement_or_null_list>(f);
         }},
        {"tf_item_or_statement_or_null_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_item_or_statement_or_null_list_opt>(f);
         }},
        {"array_reduction_method",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Array_reduction_method>(f);
         }},
        {"array_locator_method",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Array_locator_method>(f);
         }},
        {"gatetype",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Gatetype>(f); }},
        {"primitive_gate_instance",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Primitive_gate_instance>(f);
         }},
        {"primitive_gate_instance_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Primitive_gate_instance_list>(f);
         }},
        {"switchtype",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Switchtype>(f); }},
        {"dr_strength1",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Dr_strength1>(f); }},
        {"dr_strength0",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Dr_strength0>(f); }},
        {"delay_scope",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Delay_scope>(f); }},
        {"join_keyword",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Join_keyword>(f); }},
        {"generate_case_item",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Generate_case_item>(f);
         }},
        {"function_return_type_and_id",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Function_return_type_and_id>(f);
         }},
        {"tf_port_direction",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_port_direction>(f);
         }},
        {"tf_port_direction_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_port_direction_opt>(f);
         }},
        {"tf_port_item_expr_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_port_item_expr_opt>(f);
         }},
        {"tf_port_item",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tf_port_item>(f); }},
        {"tf_port_list_item_last",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_port_list_item_last>(f);
         }},
        {"tf_port_list_trailing_comma",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_port_list_trailing_comma>(f);
         }},
        {"tf_port_list",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tf_port_list>(f); }},
        {"endfunction_label_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Endfunction_label_opt>(f);
         }},
        {"function_item_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Function_item_list>(f);
         }},
        {"statement_or_null_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Statement_or_null_list_opt>(f);
         }},
        {"net_type_or_none",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Net_type_or_none>(f); }},
        {"pull01",
         [](const std::string &f)
             -> std::shared_ptr<Node> { return std::make_shared<Pull01>(f); }},
        {"macro_formal_parameter",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Macro_formal_parameter>(f);
         }},
        {"macro_formals_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Macro_formals_list>(f);
         }},
        {"tf_variable_identifier_first",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_variable_identifier_first>(f);
         }},
        {"list_of_tf_variable_identifiers",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<List_of_tf_variable_identifiers>(f);
         }},
        {"tf_variable_identifier",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_variable_identifier>(f);
         }},
        {"tf_port_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tf_port_declaration>(f);
         }},
        {"function_item",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Function_item>(f); }},
        {"function_item_data_declaration",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Function_item_data_declaration>(f);
         }},
        {"non_anonymous_instantiation_base",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Non_anonymous_instantiation_base>(f);
         }},
        {"statement_or_null_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Statement_or_null_list>(f);
         }},
        {"tk_octbase",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tk_octbase>(f); }},
        {"tk_octdigits",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tk_octdigits>(f); }},
        {"specify_terminal_descriptor",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specify_terminal_descriptor>(f);
         }},
        {"spec_reference_event",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Spec_reference_event>(f);
         }},
        {"edge_descriptor_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Edge_descriptor_list>(f);
         }},
        {"spec_notifier",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Spec_notifier>(f); }},
        {"spec_notifier_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Spec_notifier_opt>(f);
         }},
        {"specify_item",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Specify_item>(f); }},
        {"specify_simple_path_decl",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specify_simple_path_decl>(f);
         }},
        {"specify_edge_path_decl",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specify_edge_path_decl>(f);
         }},
        {"specparam_decl",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Specparam_decl>(f); }},
        {"specify_item_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specify_item_list>(f);
         }},
        {"specify_path_identifiers",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specify_path_identifiers>(f);
         }},
        {"spec_polarity",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Spec_polarity>(f); }},
        {"specify_simple_path",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specify_simple_path>(f);
         }},
        {"delay_value_list",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Delay_value_list>(f); }},
        {"specify_item_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specify_item_list_opt>(f);
         }},
        {"casting_type",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Casting_type>(f); }},
        {"polarity_operator",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Polarity_operator>(f);
         }},
        {"specify_edge_path",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Specify_edge_path>(f);
         }},
        {"udp_port_list",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_port_list>(f); }},
        {"udp_port_decl",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_port_decl>(f); }},
        {"udp_port_decls",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_port_decls>(f); }},
        {"udp_init_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_init_opt>(f); }},
        {"udp_initial",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_initial>(f); }},
        {"udp_input_sym",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_input_sym>(f); }},
        {"udp_input_list",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_input_list>(f); }},
        {"udp_output_sym",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_output_sym>(f); }},
        {"udp_sequ_entry",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_sequ_entry>(f); }},
        {"udp_sequ_entry_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Udp_sequ_entry_list>(f);
         }},
        {"udp_entry_list",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_entry_list>(f); }},
        {"udp_comb_entry_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Udp_comb_entry_list>(f);
         }},
        {"udp_body",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_body>(f); }},
        {"tk_reg_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tk_reg_opt>(f); }},
        {"udp_initial_expr_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Udp_initial_expr_opt>(f);
         }},
        {"udp_input_declaration_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Udp_input_declaration_list>(f);
         }},
        {"enum_name",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Enum_name>(f); }},
        {"pos_neg_number",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Pos_neg_number>(f); }},
        {"enum_name_list_item_last",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Enum_name_list_item_last>(f);
         }},
        {"enum_name_list_trailing_comma",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Enum_name_list_trailing_comma>(f);
         }},
        {"enum_name_list",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Enum_name_list>(f); }},
        {"action_block",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Action_block>(f); }},
        {"simple_immediate_assertion_statement",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Simple_immediate_assertion_statement>(f);
         }},
        {"immediate_assertion_statement",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Immediate_assertion_statement>(f);
         }},
        {"deferred_immediate_assertion_statement",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Deferred_immediate_assertion_statement>(f);
         }},
        {"var_opt",
         [](const std::string &f)
             -> std::shared_ptr<Node> { return std::make_shared<Var_opt>(f); }},
        {"data_declaration_modifiers_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Data_declaration_modifiers_opt>(f);
         }},
        {"data_declaration_base",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Data_declaration_base>(f);
         }},
        {"specparam",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Specparam>(f); }},
        {"specparam_list",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Specparam_list>(f); }},
        {"block_identifier_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Block_identifier_opt>(f);
         }},
        {"event_control_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Event_control_opt>(f);
         }},
        {"property_spec_disable_iff_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Property_spec_disable_iff_opt>(f);
         }},
        {"property_spec",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Property_spec>(f); }},
        {"assert_property_statement",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Assert_property_statement>(f);
         }},
        {"concurrent_assertion_statement",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Concurrent_assertion_statement>(f);
         }},
        {"assume_property_statement",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Assume_property_statement>(f);
         }},
        {"cover_property_statement",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Cover_property_statement>(f);
         }},
        {"concurrent_assertion_item",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Concurrent_assertion_item>(f);
         }},
        {"tk_virtual_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tk_virtual_opt>(f); }},
        {"class_declaration_extends_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Class_declaration_extends_opt>(f);
         }},
        {"implements_interface_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Implements_interface_list_opt>(f);
         }},
        {"variable_decl_assignment",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Variable_decl_assignment>(f);
         }},
        {"list_of_variable_decl_assignments",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<List_of_variable_decl_assignments>(f);
         }},
        {"class_item",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Class_item>(f); }},
        {"class_constructor",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Class_constructor>(f);
         }},
        {"method_qualifier_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Method_qualifier_list_opt>(f);
         }},
        {"method_prototype",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Method_prototype>(f); }},
        {"class_item_qualifier_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Class_item_qualifier_list_opt>(f);
         }},
        {"method_property_qualifier_list_not_starting_with_virtual",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Method_property_qualifier_list_not_starting_with_virtual>(f);
         }},
        {"class_items",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Class_items>(f); }},
        {"class_constructor_prototype",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Class_constructor_prototype>(f);
         }},
        {"endnew_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Endnew_opt>(f); }},
        {"class_items_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Class_items_opt>(f); }},
        {"package_item",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Package_item>(f); }},
        {"package_item_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_item_list>(f);
         }},
        {"task_prototype",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Task_prototype>(f); }},
        {"function_prototype",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Function_prototype>(f);
         }},
        {"package_item_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_item_list_opt>(f);
         }},
        {"select_dimensions_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Select_dimensions_opt>(f);
         }},
        {"hierarchy_segment",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Hierarchy_segment>(f);
         }},
        {"dpi_spec_string",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Dpi_spec_string>(f); }},
        {"dpi_import_property_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Dpi_import_property_opt>(f);
         }},
        {"dpi_import_item",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Dpi_import_item>(f); }},
        {"udp_comb_entry",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Udp_comb_entry>(f); }},
        {"tk_ls_eq",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tk_ls_eq>(f); }},
        {"tk_rs_eq",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tk_rs_eq>(f); }},
        {"tk_rss_eq",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tk_rss_eq>(f); }},
        {"packed_signing_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Packed_signing_opt>(f);
         }},
        {"random_qualifier_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Random_qualifier_opt>(f);
         }},
        {"data_type_or_implicit_followed_by_id_and_dimensions_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Data_type_or_implicit_followed_by_id_and_dimensions_opt>(f);
         }},
        {"type_identifier_or_implicit_followed_by_id_and_dimensions_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<
               Type_identifier_or_implicit_followed_by_id_and_dimensions_opt>(
               f);
         }},
        {"struct_union_member",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Struct_union_member>(f);
         }},
        {"struct_union_member_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Struct_union_member_list>(f);
         }},
        {"tk_tagged_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Tk_tagged_opt>(f); }},
        {"assignment_pattern",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Assignment_pattern>(f);
         }},
        {"structure_or_array_pattern_expression_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Structure_or_array_pattern_expression_list>(
               f);
         }},
        {"structure_or_array_pattern_key",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Structure_or_array_pattern_key>(f);
         }},
        {"structure_or_array_pattern_expression",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Structure_or_array_pattern_expression>(f);
         }},
        {"scope_prefix",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Scope_prefix>(f); }},
        {"package_import_item",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_import_item>(f);
         }},
        {"package_import_item_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Package_import_item_list>(f);
         }},
        {"tk_edge_descriptor",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Tk_edge_descriptor>(f);
         }},
        {"class_item_qualifier",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Class_item_qualifier>(f);
         }},
        {"property_qualifier",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Property_qualifier>(f);
         }},
        {"final_or_zero",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Final_or_zero>(f); }},
        {"stream_operator",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Stream_operator>(f); }},
        {"slice_size_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Slice_size_opt>(f); }},
        {"stream_expression",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Stream_expression>(f);
         }},
        {"stream_expression_list",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Stream_expression_list>(f);
         }},
        {"identifier_opt",
         [](const std::string &f)
             -> std::shared_ptr<
                 Node> { return std::make_shared<Identifier_opt>(f); }},
        {"clocking_item_list_opt",
         [](const std::string &f) -> std::shared_ptr<Node> {
           return std::make_shared<Clocking_item_list_opt>(f);
         }},
};
