#include "Visitor.h"
#include "AST.h"




void Terminal::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Terminal::Terminal(std::string element)
{
	this->element = element;
}

std::string Terminal::getElement()
{
	return this->element;
}

void Terminal::setElement(std::string element)
{
	this->element = element;
}



void Time_literal::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Time_literal::Time_literal(std::string element)
{
	this->element = element;
}



void Tk_timeliteral::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_timeliteral::Tk_timeliteral(std::string element)
{
	this->element = element;
}



void Tk_decnumber::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_decnumber::Tk_decnumber(std::string element)
{
	this->element = element;
}



void Timescale_directive::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Timescale_directive::Timescale_directive(std::string element)
{
	this->element = element;
}



void Package_item_no_pp::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_item_no_pp::Package_item_no_pp(std::string element)
{
	this->element = element;
}



void Misc_directive::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Misc_directive::Misc_directive(std::string element)
{
	this->element = element;
}



void Package_or_generate_item_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_or_generate_item_declaration::Package_or_generate_item_declaration(std::string element)
{
	this->element = element;
}



void Data_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_declaration::Data_declaration(std::string element)
{
	this->element = element;
}



void Any_param_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_param_declaration::Any_param_declaration(std::string element)
{
	this->element = element;
}



void Timeunits_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Timeunits_declaration::Timeunits_declaration(std::string element)
{
	this->element = element;
}



void Type_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Type_declaration::Type_declaration(std::string element)
{
	this->element = element;
}



void Package_import_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_import_declaration::Package_import_declaration(std::string element)
{
	this->element = element;
}



void Description::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Description::Description(std::string element)
{
	this->element = element;
}



void Module_or_interface_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_or_interface_declaration::Module_or_interface_declaration(std::string element)
{
	this->element = element;
}



void Preprocessor_action::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Preprocessor_action::Preprocessor_action(std::string element)
{
	this->element = element;
}



void Udp_primitive::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_primitive::Udp_primitive(std::string element)
{
	this->element = element;
}



void Package_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_declaration::Package_declaration(std::string element)
{
	this->element = element;
}



void Description_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Description_list::Description_list(std::string element)
{
	this->element = element;
}



void Module_start::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_start::Module_start(std::string element)
{
	this->element = element;
}



void Lifetime_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Lifetime_opt::Lifetime_opt(std::string element)
{
	this->element = element;
}



void Lifetime::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Lifetime::Lifetime(std::string element)
{
	this->element = element;
}



void Genericidentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Genericidentifier::Genericidentifier(std::string element)
{
	this->element = element;
}



void Symbolidentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Symbolidentifier::Symbolidentifier(std::string element)
{
	this->element = element;
}



void Escapedidentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Escapedidentifier::Escapedidentifier(std::string element)
{
	this->element = element;
}



void Keywordidentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Keywordidentifier::Keywordidentifier(std::string element)
{
	this->element = element;
}



void Symbol_or_label::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Symbol_or_label::Symbol_or_label(std::string element)
{
	this->element = element;
}



void Module_package_import_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_package_import_list_opt::Module_package_import_list_opt(std::string element)
{
	this->element = element;
}



void Package_import_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_import_list::Package_import_list(std::string element)
{
	this->element = element;
}



void Module_parameter_port_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_parameter_port_list_opt::Module_parameter_port_list_opt(std::string element)
{
	this->element = element;
}



void Module_parameter_port_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_parameter_port_list::Module_parameter_port_list(std::string element)
{
	this->element = element;
}



void Module_port_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_port_list_opt::Module_port_list_opt(std::string element)
{
	this->element = element;
}



void List_of_ports_or_port_declarations_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_ports_or_port_declarations_opt::List_of_ports_or_port_declarations_opt(std::string element)
{
	this->element = element;
}



void Module_attribute_foreign_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_attribute_foreign_opt::Module_attribute_foreign_opt(std::string element)
{
	this->element = element;
}



void Integer_vector_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Integer_vector_type::Integer_vector_type(std::string element)
{
	this->element = element;
}



void Signed_unsigned_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Signed_unsigned_opt::Signed_unsigned_opt(std::string element)
{
	this->element = element;
}



void Signing::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Signing::Signing(std::string element)
{
	this->element = element;
}



void Data_type_primitive_scalar::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_type_primitive_scalar::Data_type_primitive_scalar(std::string element)
{
	this->element = element;
}



void Integer_atom_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Integer_atom_type::Integer_atom_type(std::string element)
{
	this->element = element;
}



void Non_integer_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Non_integer_type::Non_integer_type(std::string element)
{
	this->element = element;
}



void Enum_data_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Enum_data_type::Enum_data_type(std::string element)
{
	this->element = element;
}



void Struct_data_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Struct_data_type::Struct_data_type(std::string element)
{
	this->element = element;
}



void Decl_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Decl_dimensions_opt::Decl_dimensions_opt(std::string element)
{
	this->element = element;
}



void Decl_dimensions::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Decl_dimensions::Decl_dimensions(std::string element)
{
	this->element = element;
}



void Data_type_primitive::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_type_primitive::Data_type_primitive(std::string element)
{
	this->element = element;
}



void Data_type_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_type_base::Data_type_base(std::string element)
{
	this->element = element;
}



void Data_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_type::Data_type(std::string element)
{
	this->element = element;
}



void Reference::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Reference::Reference(std::string element)
{
	this->element = element;
}



void Instantiation_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Instantiation_type::Instantiation_type(std::string element)
{
	this->element = element;
}



void Trailing_decl_assignment_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Trailing_decl_assignment_opt::Trailing_decl_assignment_opt(std::string element)
{
	this->element = element;
}



void Trailing_decl_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Trailing_decl_assignment::Trailing_decl_assignment(std::string element)
{
	this->element = element;
}



void Non_anonymous_gate_instance_or_register_variable::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Non_anonymous_gate_instance_or_register_variable::Non_anonymous_gate_instance_or_register_variable(std::string element)
{
	this->element = element;
}



void Any_port_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_port_list_opt::Any_port_list_opt(std::string element)
{
	this->element = element;
}



void Non_anonymous_gate_instance_or_register_variable_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Non_anonymous_gate_instance_or_register_variable_list::Non_anonymous_gate_instance_or_register_variable_list(std::string element)
{
	this->element = element;
}



void Gate_instance_or_register_variable::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Gate_instance_or_register_variable::Gate_instance_or_register_variable(std::string element)
{
	this->element = element;
}



void Instantiation_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Instantiation_base::Instantiation_base(std::string element)
{
	this->element = element;
}



void Reference_or_call_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Reference_or_call_base::Reference_or_call_base(std::string element)
{
	this->element = element;
}



void Data_declaration_or_module_instantiation::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_declaration_or_module_instantiation::Data_declaration_or_module_instantiation(std::string element)
{
	this->element = element;
}



void Const_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Const_opt::Const_opt(std::string element)
{
	this->element = element;
}



void Module_or_generate_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_or_generate_item::Module_or_generate_item(std::string element)
{
	this->element = element;
}



void Module_common_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_common_item::Module_common_item(std::string element)
{
	this->element = element;
}



void Parameter_override::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_override::Parameter_override(std::string element)
{
	this->element = element;
}



void Gate_instantiation::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Gate_instantiation::Gate_instantiation(std::string element)
{
	this->element = element;
}



void Non_port_module_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Non_port_module_item::Non_port_module_item(std::string element)
{
	this->element = element;
}



void Generate_region::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Generate_region::Generate_region(std::string element)
{
	this->element = element;
}



void Specify_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_block::Specify_block(std::string element)
{
	this->element = element;
}



void Module_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_item::Module_item(std::string element)
{
	this->element = element;
}



void Module_port_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_port_declaration::Module_port_declaration(std::string element)
{
	this->element = element;
}



void Module_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_block::Module_block(std::string element)
{
	this->element = element;
}



void Module_item_directive::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_item_directive::Module_item_directive(std::string element)
{
	this->element = element;
}



void Module_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_item_list::Module_item_list(std::string element)
{
	this->element = element;
}



void Net_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Net_type::Net_type(std::string element)
{
	this->element = element;
}



void Number::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Number::Number(std::string element)
{
	this->element = element;
}



void Constant_dec_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Constant_dec_number::Constant_dec_number(std::string element)
{
	this->element = element;
}



void Based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Based_number::Based_number(std::string element)
{
	this->element = element;
}



void Tk_unbasednumber::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_unbasednumber::Tk_unbasednumber(std::string element)
{
	this->element = element;
}



void Expr_primary_no_groups::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expr_primary_no_groups::Expr_primary_no_groups(std::string element)
{
	this->element = element;
}



void System_tf_call::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 System_tf_call::System_tf_call(std::string element)
{
	this->element = element;
}



void String_literal::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 String_literal::String_literal(std::string element)
{
	this->element = element;
}



void Tk_realtime::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_realtime::Tk_realtime(std::string element)
{
	this->element = element;
}



void Cast::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Cast::Cast(std::string element)
{
	this->element = element;
}



void Expr_primary::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expr_primary::Expr_primary(std::string element)
{
	this->element = element;
}



void Expr_primary_parens::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expr_primary_parens::Expr_primary_parens(std::string element)
{
	this->element = element;
}



void Expr_primary_braces::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expr_primary_braces::Expr_primary_braces(std::string element)
{
	this->element = element;
}



void Assignment_pattern_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Assignment_pattern_expression::Assignment_pattern_expression(std::string element)
{
	this->element = element;
}



void Postfix_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Postfix_expression::Postfix_expression(std::string element)
{
	this->element = element;
}



void Reference_or_call::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Reference_or_call::Reference_or_call(std::string element)
{
	this->element = element;
}



void Inc_or_dec_or_primary_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Inc_or_dec_or_primary_expr::Inc_or_dec_or_primary_expr(std::string element)
{
	this->element = element;
}



void Inc_or_dec_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Inc_or_dec_expression::Inc_or_dec_expression(std::string element)
{
	this->element = element;
}



void Unary_prefix_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Unary_prefix_expr::Unary_prefix_expr(std::string element)
{
	this->element = element;
}



void Unary_op::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Unary_op::Unary_op(std::string element)
{
	this->element = element;
}



void Unary_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Unary_expr::Unary_expr(std::string element)
{
	this->element = element;
}



void Pow_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Pow_expr::Pow_expr(std::string element)
{
	this->element = element;
}



void Mul_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Mul_expr::Mul_expr(std::string element)
{
	this->element = element;
}



void Add_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Add_expr::Add_expr(std::string element)
{
	this->element = element;
}



void Shift_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Shift_expr::Shift_expr(std::string element)
{
	this->element = element;
}



void Comp_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Comp_expr::Comp_expr(std::string element)
{
	this->element = element;
}



void Open_range_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Open_range_list::Open_range_list(std::string element)
{
	this->element = element;
}



void Logeq_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Logeq_expr::Logeq_expr(std::string element)
{
	this->element = element;
}



void Caseeq_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Caseeq_expr::Caseeq_expr(std::string element)
{
	this->element = element;
}



void Bitand_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Bitand_expr::Bitand_expr(std::string element)
{
	this->element = element;
}



void Xor_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Xor_expr::Xor_expr(std::string element)
{
	this->element = element;
}



void Bitor_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Bitor_expr::Bitor_expr(std::string element)
{
	this->element = element;
}



void With_exprs_suffix::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 With_exprs_suffix::With_exprs_suffix(std::string element)
{
	this->element = element;
}



void Matches_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Matches_expr::Matches_expr(std::string element)
{
	this->element = element;
}



void Logand_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Logand_expr::Logand_expr(std::string element)
{
	this->element = element;
}



void Logor_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Logor_expr::Logor_expr(std::string element)
{
	this->element = element;
}



void Cond_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Cond_expr::Cond_expr(std::string element)
{
	this->element = element;
}



void Expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expression::Expression(std::string element)
{
	this->element = element;
}



void Equiv_impl_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Equiv_impl_expr::Equiv_impl_expr(std::string element)
{
	this->element = element;
}



void Decl_variable_dimension::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Decl_variable_dimension::Decl_variable_dimension(std::string element)
{
	this->element = element;
}



void Expression_or_null_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expression_or_null_list_opt::Expression_or_null_list_opt(std::string element)
{
	this->element = element;
}



void Delay3_or_drive_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay3_or_drive_opt::Delay3_or_drive_opt(std::string element)
{
	this->element = element;
}



void Delay3::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay3::Delay3(std::string element)
{
	this->element = element;
}



void Data_type_or_implicit::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_type_or_implicit::Data_type_or_implicit(std::string element)
{
	this->element = element;
}



void Net_variable::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Net_variable::Net_variable(std::string element)
{
	this->element = element;
}



void Net_variable_or_decl_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Net_variable_or_decl_assign::Net_variable_or_decl_assign(std::string element)
{
	this->element = element;
}



void Net_decl_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Net_decl_assign::Net_decl_assign(std::string element)
{
	this->element = element;
}



void Net_variable_or_decl_assigns::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Net_variable_or_decl_assigns::Net_variable_or_decl_assigns(std::string element)
{
	this->element = element;
}



void Net_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Net_declaration::Net_declaration(std::string element)
{
	this->element = element;
}



void Charge_strength_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Charge_strength_opt::Charge_strength_opt(std::string element)
{
	this->element = element;
}



void Delay3_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay3_opt::Delay3_opt(std::string element)
{
	this->element = element;
}



void List_of_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_identifiers::List_of_identifiers(std::string element)
{
	this->element = element;
}



void Task_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Task_declaration::Task_declaration(std::string element)
{
	this->element = element;
}



void Function_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Function_declaration::Function_declaration(std::string element)
{
	this->element = element;
}



void Class_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_declaration::Class_declaration(std::string element)
{
	this->element = element;
}



void Dpi_import_export::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dpi_import_export::Dpi_import_export(std::string element)
{
	this->element = element;
}



void Specparam_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specparam_declaration::Specparam_declaration(std::string element)
{
	this->element = element;
}



void Module_or_generate_item_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_or_generate_item_declaration::Module_or_generate_item_declaration(std::string element)
{
	this->element = element;
}



void Genvar_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Genvar_declaration::Genvar_declaration(std::string element)
{
	this->element = element;
}



void Clocking_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Clocking_declaration::Clocking_declaration(std::string element)
{
	this->element = element;
}



void Initial_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Initial_construct::Initial_construct(std::string element)
{
	this->element = element;
}



void Always_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Always_construct::Always_construct(std::string element)
{
	this->element = element;
}



void Continuous_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Continuous_assign::Continuous_assign(std::string element)
{
	this->element = element;
}



void Loop_generate_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Loop_generate_construct::Loop_generate_construct(std::string element)
{
	this->element = element;
}



void Conditional_generate_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Conditional_generate_construct::Conditional_generate_construct(std::string element)
{
	this->element = element;
}



void Assertion_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Assertion_item::Assertion_item(std::string element)
{
	this->element = element;
}



void Final_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Final_construct::Final_construct(std::string element)
{
	this->element = element;
}



void Parameter_value_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_value_opt::Parameter_value_opt(std::string element)
{
	this->element = element;
}



void Parameters::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameters::Parameters(std::string element)
{
	this->element = element;
}



void Unqualified_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Unqualified_id::Unqualified_id(std::string element)
{
	this->element = element;
}



void Class_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_id::Class_id(std::string element)
{
	this->element = element;
}



void Qualified_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Qualified_id::Qualified_id(std::string element)
{
	this->element = element;
}



void Type_or_id_root::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Type_or_id_root::Type_or_id_root(std::string element)
{
	this->element = element;
}



void Implicit_class_handle::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Implicit_class_handle::Implicit_class_handle(std::string element)
{
	this->element = element;
}



void Local_root::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Local_root::Local_root(std::string element)
{
	this->element = element;
}



void Select_variable_dimension::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Select_variable_dimension::Select_variable_dimension(std::string element)
{
	this->element = element;
}



void Hierarchy_extension::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Hierarchy_extension::Hierarchy_extension(std::string element)
{
	this->element = element;
}



void Member_name::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Member_name::Member_name(std::string element)
{
	this->element = element;
}



void Builtin_array_method::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Builtin_array_method::Builtin_array_method(std::string element)
{
	this->element = element;
}



void Port_named::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_named::Port_named(std::string element)
{
	this->element = element;
}



void Any_port::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_port::Any_port(std::string element)
{
	this->element = element;
}



void Any_port_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_port_list_item_last::Any_port_list_item_last(std::string element)
{
	this->element = element;
}



void Any_port_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_port_list_trailing_comma::Any_port_list_trailing_comma(std::string element)
{
	this->element = element;
}



void Any_port_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_port_list::Any_port_list(std::string element)
{
	this->element = element;
}



void Label_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Label_opt::Label_opt(std::string element)
{
	this->element = element;
}



void Begin::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Begin::Begin(std::string element)
{
	this->element = element;
}



void Lpvalue::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Lpvalue::Lpvalue(std::string element)
{
	this->element = element;
}



void Range_list_in_braces::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Range_list_in_braces::Range_list_in_braces(std::string element)
{
	this->element = element;
}



void Assignment_statement_no_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Assignment_statement_no_expr::Assignment_statement_no_expr(std::string element)
{
	this->element = element;
}



void Assign_modify_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Assign_modify_statement::Assign_modify_statement(std::string element)
{
	this->element = element;
}



void Assignment_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Assignment_statement::Assignment_statement(std::string element)
{
	this->element = element;
}



void Statement_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Statement_item::Statement_item(std::string element)
{
	this->element = element;
}



void Procedural_timing_control_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Procedural_timing_control_statement::Procedural_timing_control_statement(std::string element)
{
	this->element = element;
}



void Subroutine_call::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Subroutine_call::Subroutine_call(std::string element)
{
	this->element = element;
}



void Seq_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Seq_block::Seq_block(std::string element)
{
	this->element = element;
}



void Nonblocking_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Nonblocking_assignment::Nonblocking_assignment(std::string element)
{
	this->element = element;
}



void Conditional_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Conditional_statement::Conditional_statement(std::string element)
{
	this->element = element;
}



void Case_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Case_statement::Case_statement(std::string element)
{
	this->element = element;
}



void Loop_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Loop_statement::Loop_statement(std::string element)
{
	this->element = element;
}



void Par_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Par_block::Par_block(std::string element)
{
	this->element = element;
}



void Blocking_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Blocking_assignment::Blocking_assignment(std::string element)
{
	this->element = element;
}



void Wait_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Wait_statement::Wait_statement(std::string element)
{
	this->element = element;
}



void Procedural_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Procedural_assertion_statement::Procedural_assertion_statement(std::string element)
{
	this->element = element;
}



void Procedural_continuous_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Procedural_continuous_assignment::Procedural_continuous_assignment(std::string element)
{
	this->element = element;
}



void Event_trigger::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Event_trigger::Event_trigger(std::string element)
{
	this->element = element;
}



void Disable_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Disable_statement::Disable_statement(std::string element)
{
	this->element = element;
}



void Jump_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Jump_statement::Jump_statement(std::string element)
{
	this->element = element;
}



void Block_item_or_statement_or_null::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Block_item_or_statement_or_null::Block_item_or_statement_or_null(std::string element)
{
	this->element = element;
}



void Block_item_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Block_item_decl::Block_item_decl(std::string element)
{
	this->element = element;
}



void Block_item_or_statement_or_null_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Block_item_or_statement_or_null_list::Block_item_or_statement_or_null_list(std::string element)
{
	this->element = element;
}



void Delay_value_simple::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay_value_simple::Delay_value_simple(std::string element)
{
	this->element = element;
}



void Delay_identifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay_identifier::Delay_identifier(std::string element)
{
	this->element = element;
}



void Delay1::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay1::Delay1(std::string element)
{
	this->element = element;
}



void Delay_value::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay_value::Delay_value(std::string element)
{
	this->element = element;
}



void Statement_or_null::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Statement_or_null::Statement_or_null(std::string element)
{
	this->element = element;
}



void Statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Statement::Statement(std::string element)
{
	this->element = element;
}



void Event_control::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Event_control::Event_control(std::string element)
{
	this->element = element;
}



void Cycle_delay::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Cycle_delay::Cycle_delay(std::string element)
{
	this->element = element;
}



void Systemtfidentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Systemtfidentifier::Systemtfidentifier(std::string element)
{
	this->element = element;
}



void Call_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Call_base::Call_base(std::string element)
{
	this->element = element;
}



void Block_item_or_statement_or_null_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Block_item_or_statement_or_null_list_opt::Block_item_or_statement_or_null_list_opt(std::string element)
{
	this->element = element;
}



void End::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 End::End(std::string element)
{
	this->element = element;
}



void Always_any::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Always_any::Always_any(std::string element)
{
	this->element = element;
}



void Module_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_item_list_opt::Module_item_list_opt(std::string element)
{
	this->element = element;
}



void Module_end::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_end::Module_end(std::string element)
{
	this->element = element;
}



void Source_text::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Source_text::Source_text(std::string element)
{
	this->element = element;
}



void Port_reference::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_reference::Port_reference(std::string element)
{
	this->element = element;
}



void Port_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_expression::Port_expression(std::string element)
{
	this->element = element;
}



void Port_reference_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_reference_list::Port_reference_list(std::string element)
{
	this->element = element;
}



void Trailing_assign_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Trailing_assign_opt::Trailing_assign_opt(std::string element)
{
	this->element = element;
}



void Trailing_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Trailing_assign::Trailing_assign(std::string element)
{
	this->element = element;
}



void Port::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port::Port(std::string element)
{
	this->element = element;
}



void Port_expression_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_expression_opt::Port_expression_opt(std::string element)
{
	this->element = element;
}



void Port_or_port_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_or_port_declaration::Port_or_port_declaration(std::string element)
{
	this->element = element;
}



void Port_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_declaration::Port_declaration(std::string element)
{
	this->element = element;
}



void List_of_ports_or_port_declarations_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_ports_or_port_declarations_item_last::List_of_ports_or_port_declarations_item_last(std::string element)
{
	this->element = element;
}



void List_of_ports_or_port_declarations_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_ports_or_port_declarations_trailing_comma::List_of_ports_or_port_declarations_trailing_comma(std::string element)
{
	this->element = element;
}



void List_of_ports_or_port_declarations::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_ports_or_port_declarations::List_of_ports_or_port_declarations(std::string element)
{
	this->element = element;
}



void Dir::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dir::Dir(std::string element)
{
	this->element = element;
}



void Var_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Var_type::Var_type(std::string element)
{
	this->element = element;
}



void List_of_port_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_port_identifiers::List_of_port_identifiers(std::string element)
{
	this->element = element;
}



void Port_direction::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_direction::Port_direction(std::string element)
{
	this->element = element;
}



void List_of_module_item_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_module_item_identifiers::List_of_module_item_identifiers(std::string element)
{
	this->element = element;
}



void List_of_identifiers_unpacked_dimensions::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_identifiers_unpacked_dimensions::List_of_identifiers_unpacked_dimensions(std::string element)
{
	this->element = element;
}



void Port_net_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_net_type::Port_net_type(std::string element)
{
	this->element = element;
}



void Identifier_optional_unpacked_dimensions::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Identifier_optional_unpacked_dimensions::Identifier_optional_unpacked_dimensions(std::string element)
{
	this->element = element;
}



void Drive_strength_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Drive_strength_opt::Drive_strength_opt(std::string element)
{
	this->element = element;
}



void Drive_strength::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Drive_strength::Drive_strength(std::string element)
{
	this->element = element;
}



void Cont_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Cont_assign::Cont_assign(std::string element)
{
	this->element = element;
}



void Cont_assign_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Cont_assign_list::Cont_assign_list(std::string element)
{
	this->element = element;
}



void Edge_operator::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Edge_operator::Edge_operator(std::string element)
{
	this->element = element;
}



void Event_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Event_expression::Event_expression(std::string element)
{
	this->element = element;
}



void Event_expression_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Event_expression_list::Event_expression_list(std::string element)
{
	this->element = element;
}



void Hierarchy_event_identifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Hierarchy_event_identifier::Hierarchy_event_identifier(std::string element)
{
	this->element = element;
}



void Unique_priority_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Unique_priority_opt::Unique_priority_opt(std::string element)
{
	this->element = element;
}



void Expression_in_parens::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expression_in_parens::Expression_in_parens(std::string element)
{
	this->element = element;
}



void Delay_or_event_control_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay_or_event_control_opt::Delay_or_event_control_opt(std::string element)
{
	this->element = element;
}



void Delay_or_event_control::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay_or_event_control::Delay_or_event_control(std::string element)
{
	this->element = element;
}



void Expression_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expression_opt::Expression_opt(std::string element)
{
	this->element = element;
}



void Bit_logic_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Bit_logic_opt::Bit_logic_opt(std::string element)
{
	this->element = element;
}



void Bit_logic::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Bit_logic::Bit_logic(std::string element)
{
	this->element = element;
}



void Param_type_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Param_type_followed_by_id_and_dimensions_opt::Param_type_followed_by_id_and_dimensions_opt(std::string element)
{
	this->element = element;
}



void Parameter_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_expr::Parameter_expr(std::string element)
{
	this->element = element;
}



void Parameter_value_ranges_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_value_ranges_opt::Parameter_value_ranges_opt(std::string element)
{
	this->element = element;
}



void Parameter_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_assign::Parameter_assign(std::string element)
{
	this->element = element;
}



void Parameter_assign_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_assign_list::Parameter_assign_list(std::string element)
{
	this->element = element;
}



void Localparam_assign_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Localparam_assign_list::Localparam_assign_list(std::string element)
{
	this->element = element;
}



void Type_assignment_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Type_assignment_list::Type_assignment_list(std::string element)
{
	this->element = element;
}



void Macronumericwidth::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Macronumericwidth::Macronumericwidth(std::string element)
{
	this->element = element;
}



void Hex_based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Hex_based_number::Hex_based_number(std::string element)
{
	this->element = element;
}



void Tk_hexbase::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_hexbase::Tk_hexbase(std::string element)
{
	this->element = element;
}



void Tk_hexdigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_hexdigits::Tk_hexdigits(std::string element)
{
	this->element = element;
}



void Dec_based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dec_based_number::Dec_based_number(std::string element)
{
	this->element = element;
}



void Bin_based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Bin_based_number::Bin_based_number(std::string element)
{
	this->element = element;
}



void Oct_based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Oct_based_number::Oct_based_number(std::string element)
{
	this->element = element;
}



void Tk_decbase::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_decbase::Tk_decbase(std::string element)
{
	this->element = element;
}



void Tk_decdigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_decdigits::Tk_decdigits(std::string element)
{
	this->element = element;
}



void Tk_xzdigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_xzdigits::Tk_xzdigits(std::string element)
{
	this->element = element;
}



void Case_any::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Case_any::Case_any(std::string element)
{
	this->element = element;
}



void Expression_list_proper::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expression_list_proper::Expression_list_proper(std::string element)
{
	this->element = element;
}



void Case_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Case_item::Case_item(std::string element)
{
	this->element = element;
}



void Preprocessor_directive::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Preprocessor_directive::Preprocessor_directive(std::string element)
{
	this->element = element;
}



void Case_items::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Case_items::Case_items(std::string element)
{
	this->element = element;
}



void Tk_binbase::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_binbase::Tk_binbase(std::string element)
{
	this->element = element;
}



void Tk_bindigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_bindigits::Tk_bindigits(std::string element)
{
	this->element = element;
}



void Dist_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dist_opt::Dist_opt(std::string element)
{
	this->element = element;
}



void Expression_or_dist::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expression_or_dist::Expression_or_dist(std::string element)
{
	this->element = element;
}



void Boolean_abbrev_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Boolean_abbrev_opt::Boolean_abbrev_opt(std::string element)
{
	this->element = element;
}



void Sequence_repetition_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_repetition_expr::Sequence_repetition_expr(std::string element)
{
	this->element = element;
}



void Sequence_expr_primary::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_expr_primary::Sequence_expr_primary(std::string element)
{
	this->element = element;
}



void Sequence_delay_repetition_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_delay_repetition_list::Sequence_delay_repetition_list(std::string element)
{
	this->element = element;
}



void Sequence_delay_range_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_delay_range_expr::Sequence_delay_range_expr(std::string element)
{
	this->element = element;
}



void Sequence_throughout_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_throughout_expr::Sequence_throughout_expr(std::string element)
{
	this->element = element;
}



void Sequence_within_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_within_expr::Sequence_within_expr(std::string element)
{
	this->element = element;
}



void Sequence_intersect_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_intersect_expr::Sequence_intersect_expr(std::string element)
{
	this->element = element;
}



void Sequence_unary_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_unary_expr::Sequence_unary_expr(std::string element)
{
	this->element = element;
}



void Sequence_and_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_and_expr::Sequence_and_expr(std::string element)
{
	this->element = element;
}



void Sequence_or_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_or_expr::Sequence_or_expr(std::string element)
{
	this->element = element;
}



void Simple_sequence_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Simple_sequence_expr::Simple_sequence_expr(std::string element)
{
	this->element = element;
}



void Property_if_else_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_if_else_expr::Property_if_else_expr(std::string element)
{
	this->element = element;
}



void Property_prefix_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_prefix_expr::Property_prefix_expr(std::string element)
{
	this->element = element;
}



void Property_implication_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_implication_expr::Property_implication_expr(std::string element)
{
	this->element = element;
}



void Sequence_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Sequence_expr::Sequence_expr(std::string element)
{
	this->element = element;
}



void Property_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_expr::Property_expr(std::string element)
{
	this->element = element;
}



void Property_expr_or_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_expr_or_assignment::Property_expr_or_assignment(std::string element)
{
	this->element = element;
}



void Property_expr_or_assignment_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_expr_or_assignment_list::Property_expr_or_assignment_list(std::string element)
{
	this->element = element;
}



void Expr_mintypmax_generalized::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expr_mintypmax_generalized::Expr_mintypmax_generalized(std::string element)
{
	this->element = element;
}



void Expr_mintypmax_trans_set::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expr_mintypmax_trans_set::Expr_mintypmax_trans_set(std::string element)
{
	this->element = element;
}



void Expr_mintypmax::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Expr_mintypmax::Expr_mintypmax(std::string element)
{
	this->element = element;
}



void Value_range::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Value_range::Value_range(std::string element)
{
	this->element = element;
}



void Streaming_concatenation::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Streaming_concatenation::Streaming_concatenation(std::string element)
{
	this->element = element;
}



void Genvar_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Genvar_opt::Genvar_opt(std::string element)
{
	this->element = element;
}



void For_step::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 For_step::For_step(std::string element)
{
	this->element = element;
}



void For_step_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 For_step_opt::For_step_opt(std::string element)
{
	this->element = element;
}



void Generate_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Generate_item::Generate_item(std::string element)
{
	this->element = element;
}



void Generate_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Generate_block::Generate_block(std::string element)
{
	this->element = element;
}



void Generate_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Generate_item_list::Generate_item_list(std::string element)
{
	this->element = element;
}



void Generate_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Generate_item_list_opt::Generate_item_list_opt(std::string element)
{
	this->element = element;
}



void For_init_decl_or_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 For_init_decl_or_assign::For_init_decl_or_assign(std::string element)
{
	this->element = element;
}



void For_initialization::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 For_initialization::For_initialization(std::string element)
{
	this->element = element;
}



void For_initialization_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 For_initialization_opt::For_initialization_opt(std::string element)
{
	this->element = element;
}



void Repeat_control::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Repeat_control::Repeat_control(std::string element)
{
	this->element = element;
}



void Tk_stringliteral::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_stringliteral::Tk_stringliteral(std::string element)
{
	this->element = element;
}



void Tk_evalstringliteral::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_evalstringliteral::Tk_evalstringliteral(std::string element)
{
	this->element = element;
}



void Preprocess_include_argument::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Preprocess_include_argument::Preprocess_include_argument(std::string element)
{
	this->element = element;
}



void Pp_identifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Pp_identifier::Pp_identifier(std::string element)
{
	this->element = element;
}



void Macro_formals_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Macro_formals_list_opt::Macro_formals_list_opt(std::string element)
{
	this->element = element;
}



void Parameter_expr_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_expr_list::Parameter_expr_list(std::string element)
{
	this->element = element;
}



void Parameter_value_byname_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_value_byname_list::Parameter_value_byname_list(std::string element)
{
	this->element = element;
}



void Parameter_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_opt::Parameter_opt(std::string element)
{
	this->element = element;
}



void Module_parameter_port::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_parameter_port::Module_parameter_port(std::string element)
{
	this->element = element;
}



void Type_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Type_assignment::Type_assignment(std::string element)
{
	this->element = element;
}



void Module_parameter_port_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_parameter_port_list_item_last::Module_parameter_port_list_item_last(std::string element)
{
	this->element = element;
}



void Module_parameter_port_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_parameter_port_list_trailing_comma::Module_parameter_port_list_trailing_comma(std::string element)
{
	this->element = element;
}



void Module_parameter_port_list_preprocessor_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Module_parameter_port_list_preprocessor_last::Module_parameter_port_list_preprocessor_last(std::string element)
{
	this->element = element;
}



void Parameter_value_byname::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_value_byname::Parameter_value_byname(std::string element)
{
	this->element = element;
}



void Parameter_value_byname_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_value_byname_list_item_last::Parameter_value_byname_list_item_last(std::string element)
{
	this->element = element;
}



void Parameter_value_byname_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Parameter_value_byname_list_trailing_comma::Parameter_value_byname_list_trailing_comma(std::string element)
{
	this->element = element;
}



void Generate_if::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Generate_if::Generate_if(std::string element)
{
	this->element = element;
}



void Generate_case_items::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Generate_case_items::Generate_case_items(std::string element)
{
	this->element = element;
}



void Var_or_net_type_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Var_or_net_type_opt::Var_or_net_type_opt(std::string element)
{
	this->element = element;
}



void Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt::Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt(std::string element)
{
	this->element = element;
}



void Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt::Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt(std::string element)
{
	this->element = element;
}



void Port_declaration_noattr::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Port_declaration_noattr::Port_declaration_noattr(std::string element)
{
	this->element = element;
}



void Type_identifier_followed_by_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Type_identifier_followed_by_id::Type_identifier_followed_by_id(std::string element)
{
	this->element = element;
}



void Class_new::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_new::Class_new(std::string element)
{
	this->element = element;
}



void Dynamic_array_new::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dynamic_array_new::Dynamic_array_new(std::string element)
{
	this->element = element;
}



void Localparam_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Localparam_assign::Localparam_assign(std::string element)
{
	this->element = element;
}



void Defparam_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Defparam_assign::Defparam_assign(std::string element)
{
	this->element = element;
}



void Defparam_assign_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Defparam_assign_list::Defparam_assign_list(std::string element)
{
	this->element = element;
}



void Any_argument::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_argument::Any_argument(std::string element)
{
	this->element = element;
}



void Any_argument_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_argument_list_item_last::Any_argument_list_item_last(std::string element)
{
	this->element = element;
}



void Any_argument_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_argument_list_trailing_comma::Any_argument_list_trailing_comma(std::string element)
{
	this->element = element;
}



void Any_argument_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Any_argument_list::Any_argument_list(std::string element)
{
	this->element = element;
}



void Argument_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Argument_list_opt::Argument_list_opt(std::string element)
{
	this->element = element;
}



void Task_declaration_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Task_declaration_id::Task_declaration_id(std::string element)
{
	this->element = element;
}



void Scope_or_if_res::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Scope_or_if_res::Scope_or_if_res(std::string element)
{
	this->element = element;
}



void Tf_port_list_paren_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_list_paren_opt::Tf_port_list_paren_opt(std::string element)
{
	this->element = element;
}



void Tf_port_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_list_opt::Tf_port_list_opt(std::string element)
{
	this->element = element;
}



void Tf_item_or_statement_or_null::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_item_or_statement_or_null::Tf_item_or_statement_or_null(std::string element)
{
	this->element = element;
}



void Task_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Task_item::Task_item(std::string element)
{
	this->element = element;
}



void Tf_item_or_statement_or_null_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_item_or_statement_or_null_list::Tf_item_or_statement_or_null_list(std::string element)
{
	this->element = element;
}



void Tf_item_or_statement_or_null_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_item_or_statement_or_null_list_opt::Tf_item_or_statement_or_null_list_opt(std::string element)
{
	this->element = element;
}



void Array_reduction_method::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Array_reduction_method::Array_reduction_method(std::string element)
{
	this->element = element;
}



void Array_locator_method::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Array_locator_method::Array_locator_method(std::string element)
{
	this->element = element;
}



void Gatetype::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Gatetype::Gatetype(std::string element)
{
	this->element = element;
}



void Primitive_gate_instance::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Primitive_gate_instance::Primitive_gate_instance(std::string element)
{
	this->element = element;
}



void Primitive_gate_instance_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Primitive_gate_instance_list::Primitive_gate_instance_list(std::string element)
{
	this->element = element;
}



void Switchtype::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Switchtype::Switchtype(std::string element)
{
	this->element = element;
}



void Dr_strength1::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dr_strength1::Dr_strength1(std::string element)
{
	this->element = element;
}



void Dr_strength0::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dr_strength0::Dr_strength0(std::string element)
{
	this->element = element;
}



void Delay_scope::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay_scope::Delay_scope(std::string element)
{
	this->element = element;
}



void Join_keyword::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Join_keyword::Join_keyword(std::string element)
{
	this->element = element;
}



void Generate_case_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Generate_case_item::Generate_case_item(std::string element)
{
	this->element = element;
}



void Function_return_type_and_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Function_return_type_and_id::Function_return_type_and_id(std::string element)
{
	this->element = element;
}



void Tf_port_direction::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_direction::Tf_port_direction(std::string element)
{
	this->element = element;
}



void Tf_port_direction_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_direction_opt::Tf_port_direction_opt(std::string element)
{
	this->element = element;
}



void Tf_port_item_expr_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_item_expr_opt::Tf_port_item_expr_opt(std::string element)
{
	this->element = element;
}



void Tf_port_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_item::Tf_port_item(std::string element)
{
	this->element = element;
}



void Tf_port_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_list_item_last::Tf_port_list_item_last(std::string element)
{
	this->element = element;
}



void Tf_port_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_list_trailing_comma::Tf_port_list_trailing_comma(std::string element)
{
	this->element = element;
}



void Tf_port_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_list::Tf_port_list(std::string element)
{
	this->element = element;
}



void Endfunction_label_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Endfunction_label_opt::Endfunction_label_opt(std::string element)
{
	this->element = element;
}



void Function_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Function_item_list::Function_item_list(std::string element)
{
	this->element = element;
}



void Statement_or_null_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Statement_or_null_list_opt::Statement_or_null_list_opt(std::string element)
{
	this->element = element;
}



void Net_type_or_none::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Net_type_or_none::Net_type_or_none(std::string element)
{
	this->element = element;
}



void Pull01::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Pull01::Pull01(std::string element)
{
	this->element = element;
}



void Macro_formal_parameter::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Macro_formal_parameter::Macro_formal_parameter(std::string element)
{
	this->element = element;
}



void Macro_formals_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Macro_formals_list::Macro_formals_list(std::string element)
{
	this->element = element;
}



void Tf_variable_identifier_first::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_variable_identifier_first::Tf_variable_identifier_first(std::string element)
{
	this->element = element;
}



void List_of_tf_variable_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_tf_variable_identifiers::List_of_tf_variable_identifiers(std::string element)
{
	this->element = element;
}



void Tf_variable_identifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_variable_identifier::Tf_variable_identifier(std::string element)
{
	this->element = element;
}



void Tf_port_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tf_port_declaration::Tf_port_declaration(std::string element)
{
	this->element = element;
}



void Function_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Function_item::Function_item(std::string element)
{
	this->element = element;
}



void Function_item_data_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Function_item_data_declaration::Function_item_data_declaration(std::string element)
{
	this->element = element;
}



void Non_anonymous_instantiation_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Non_anonymous_instantiation_base::Non_anonymous_instantiation_base(std::string element)
{
	this->element = element;
}



void Statement_or_null_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Statement_or_null_list::Statement_or_null_list(std::string element)
{
	this->element = element;
}



void Tk_octbase::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_octbase::Tk_octbase(std::string element)
{
	this->element = element;
}



void Tk_octdigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_octdigits::Tk_octdigits(std::string element)
{
	this->element = element;
}



void Specify_terminal_descriptor::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_terminal_descriptor::Specify_terminal_descriptor(std::string element)
{
	this->element = element;
}



void Spec_reference_event::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Spec_reference_event::Spec_reference_event(std::string element)
{
	this->element = element;
}



void Edge_descriptor_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Edge_descriptor_list::Edge_descriptor_list(std::string element)
{
	this->element = element;
}



void Spec_notifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Spec_notifier::Spec_notifier(std::string element)
{
	this->element = element;
}



void Spec_notifier_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Spec_notifier_opt::Spec_notifier_opt(std::string element)
{
	this->element = element;
}



void Specify_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_item::Specify_item(std::string element)
{
	this->element = element;
}



void Specify_simple_path_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_simple_path_decl::Specify_simple_path_decl(std::string element)
{
	this->element = element;
}



void Specify_edge_path_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_edge_path_decl::Specify_edge_path_decl(std::string element)
{
	this->element = element;
}



void Specparam_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specparam_decl::Specparam_decl(std::string element)
{
	this->element = element;
}



void Specify_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_item_list::Specify_item_list(std::string element)
{
	this->element = element;
}



void Specify_path_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_path_identifiers::Specify_path_identifiers(std::string element)
{
	this->element = element;
}



void Spec_polarity::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Spec_polarity::Spec_polarity(std::string element)
{
	this->element = element;
}



void Specify_simple_path::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_simple_path::Specify_simple_path(std::string element)
{
	this->element = element;
}



void Delay_value_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Delay_value_list::Delay_value_list(std::string element)
{
	this->element = element;
}



void Specify_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_item_list_opt::Specify_item_list_opt(std::string element)
{
	this->element = element;
}



void Casting_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Casting_type::Casting_type(std::string element)
{
	this->element = element;
}



void Polarity_operator::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Polarity_operator::Polarity_operator(std::string element)
{
	this->element = element;
}



void Specify_edge_path::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specify_edge_path::Specify_edge_path(std::string element)
{
	this->element = element;
}



void Udp_port_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_port_list::Udp_port_list(std::string element)
{
	this->element = element;
}



void Udp_port_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_port_decl::Udp_port_decl(std::string element)
{
	this->element = element;
}



void Udp_port_decls::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_port_decls::Udp_port_decls(std::string element)
{
	this->element = element;
}



void Udp_init_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_init_opt::Udp_init_opt(std::string element)
{
	this->element = element;
}



void Udp_initial::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_initial::Udp_initial(std::string element)
{
	this->element = element;
}



void Udp_input_sym::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_input_sym::Udp_input_sym(std::string element)
{
	this->element = element;
}



void Udp_input_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_input_list::Udp_input_list(std::string element)
{
	this->element = element;
}



void Udp_output_sym::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_output_sym::Udp_output_sym(std::string element)
{
	this->element = element;
}



void Udp_sequ_entry::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_sequ_entry::Udp_sequ_entry(std::string element)
{
	this->element = element;
}



void Udp_sequ_entry_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_sequ_entry_list::Udp_sequ_entry_list(std::string element)
{
	this->element = element;
}



void Udp_entry_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_entry_list::Udp_entry_list(std::string element)
{
	this->element = element;
}



void Udp_comb_entry_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_comb_entry_list::Udp_comb_entry_list(std::string element)
{
	this->element = element;
}



void Udp_body::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_body::Udp_body(std::string element)
{
	this->element = element;
}



void Tk_reg_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_reg_opt::Tk_reg_opt(std::string element)
{
	this->element = element;
}



void Udp_initial_expr_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_initial_expr_opt::Udp_initial_expr_opt(std::string element)
{
	this->element = element;
}



void Udp_input_declaration_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_input_declaration_list::Udp_input_declaration_list(std::string element)
{
	this->element = element;
}



void Enum_name::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Enum_name::Enum_name(std::string element)
{
	this->element = element;
}



void Pos_neg_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Pos_neg_number::Pos_neg_number(std::string element)
{
	this->element = element;
}



void Enum_name_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Enum_name_list_item_last::Enum_name_list_item_last(std::string element)
{
	this->element = element;
}



void Enum_name_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Enum_name_list_trailing_comma::Enum_name_list_trailing_comma(std::string element)
{
	this->element = element;
}



void Enum_name_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Enum_name_list::Enum_name_list(std::string element)
{
	this->element = element;
}



void Action_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Action_block::Action_block(std::string element)
{
	this->element = element;
}



void Simple_immediate_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Simple_immediate_assertion_statement::Simple_immediate_assertion_statement(std::string element)
{
	this->element = element;
}



void Immediate_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Immediate_assertion_statement::Immediate_assertion_statement(std::string element)
{
	this->element = element;
}



void Deferred_immediate_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Deferred_immediate_assertion_statement::Deferred_immediate_assertion_statement(std::string element)
{
	this->element = element;
}



void Var_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Var_opt::Var_opt(std::string element)
{
	this->element = element;
}



void Data_declaration_modifiers_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_declaration_modifiers_opt::Data_declaration_modifiers_opt(std::string element)
{
	this->element = element;
}



void Data_declaration_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_declaration_base::Data_declaration_base(std::string element)
{
	this->element = element;
}



void Specparam::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specparam::Specparam(std::string element)
{
	this->element = element;
}



void Specparam_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Specparam_list::Specparam_list(std::string element)
{
	this->element = element;
}



void Block_identifier_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Block_identifier_opt::Block_identifier_opt(std::string element)
{
	this->element = element;
}



void Event_control_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Event_control_opt::Event_control_opt(std::string element)
{
	this->element = element;
}



void Property_spec_disable_iff_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_spec_disable_iff_opt::Property_spec_disable_iff_opt(std::string element)
{
	this->element = element;
}



void Property_spec::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_spec::Property_spec(std::string element)
{
	this->element = element;
}



void Assert_property_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Assert_property_statement::Assert_property_statement(std::string element)
{
	this->element = element;
}



void Concurrent_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Concurrent_assertion_statement::Concurrent_assertion_statement(std::string element)
{
	this->element = element;
}



void Assume_property_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Assume_property_statement::Assume_property_statement(std::string element)
{
	this->element = element;
}



void Cover_property_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Cover_property_statement::Cover_property_statement(std::string element)
{
	this->element = element;
}



void Concurrent_assertion_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Concurrent_assertion_item::Concurrent_assertion_item(std::string element)
{
	this->element = element;
}



void Tk_virtual_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_virtual_opt::Tk_virtual_opt(std::string element)
{
	this->element = element;
}



void Class_declaration_extends_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_declaration_extends_opt::Class_declaration_extends_opt(std::string element)
{
	this->element = element;
}



void Implements_interface_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Implements_interface_list_opt::Implements_interface_list_opt(std::string element)
{
	this->element = element;
}



void Variable_decl_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Variable_decl_assignment::Variable_decl_assignment(std::string element)
{
	this->element = element;
}



void List_of_variable_decl_assignments::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 List_of_variable_decl_assignments::List_of_variable_decl_assignments(std::string element)
{
	this->element = element;
}



void Class_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_item::Class_item(std::string element)
{
	this->element = element;
}



void Class_constructor::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_constructor::Class_constructor(std::string element)
{
	this->element = element;
}



void Method_qualifier_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Method_qualifier_list_opt::Method_qualifier_list_opt(std::string element)
{
	this->element = element;
}



void Method_prototype::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Method_prototype::Method_prototype(std::string element)
{
	this->element = element;
}



void Class_item_qualifier_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_item_qualifier_list_opt::Class_item_qualifier_list_opt(std::string element)
{
	this->element = element;
}



void Method_property_qualifier_list_not_starting_with_virtual::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Method_property_qualifier_list_not_starting_with_virtual::Method_property_qualifier_list_not_starting_with_virtual(std::string element)
{
	this->element = element;
}



void Class_items::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_items::Class_items(std::string element)
{
	this->element = element;
}



void Class_constructor_prototype::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_constructor_prototype::Class_constructor_prototype(std::string element)
{
	this->element = element;
}



void Endnew_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Endnew_opt::Endnew_opt(std::string element)
{
	this->element = element;
}



void Class_items_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_items_opt::Class_items_opt(std::string element)
{
	this->element = element;
}



void Package_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_item::Package_item(std::string element)
{
	this->element = element;
}



void Package_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_item_list::Package_item_list(std::string element)
{
	this->element = element;
}



void Task_prototype::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Task_prototype::Task_prototype(std::string element)
{
	this->element = element;
}



void Function_prototype::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Function_prototype::Function_prototype(std::string element)
{
	this->element = element;
}



void Package_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_item_list_opt::Package_item_list_opt(std::string element)
{
	this->element = element;
}



void Select_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Select_dimensions_opt::Select_dimensions_opt(std::string element)
{
	this->element = element;
}



void Hierarchy_segment::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Hierarchy_segment::Hierarchy_segment(std::string element)
{
	this->element = element;
}



void Dpi_spec_string::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dpi_spec_string::Dpi_spec_string(std::string element)
{
	this->element = element;
}



void Dpi_import_property_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dpi_import_property_opt::Dpi_import_property_opt(std::string element)
{
	this->element = element;
}



void Dpi_import_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Dpi_import_item::Dpi_import_item(std::string element)
{
	this->element = element;
}



void Udp_comb_entry::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Udp_comb_entry::Udp_comb_entry(std::string element)
{
	this->element = element;
}



void Tk_ls_eq::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_ls_eq::Tk_ls_eq(std::string element)
{
	this->element = element;
}



void Tk_rs_eq::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_rs_eq::Tk_rs_eq(std::string element)
{
	this->element = element;
}



void Tk_rss_eq::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_rss_eq::Tk_rss_eq(std::string element)
{
	this->element = element;
}



void Packed_signing_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Packed_signing_opt::Packed_signing_opt(std::string element)
{
	this->element = element;
}



void Random_qualifier_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Random_qualifier_opt::Random_qualifier_opt(std::string element)
{
	this->element = element;
}



void Data_type_or_implicit_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Data_type_or_implicit_followed_by_id_and_dimensions_opt::Data_type_or_implicit_followed_by_id_and_dimensions_opt(std::string element)
{
	this->element = element;
}



void Type_identifier_or_implicit_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Type_identifier_or_implicit_followed_by_id_and_dimensions_opt::Type_identifier_or_implicit_followed_by_id_and_dimensions_opt(std::string element)
{
	this->element = element;
}



void Struct_union_member::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Struct_union_member::Struct_union_member(std::string element)
{
	this->element = element;
}



void Struct_union_member_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Struct_union_member_list::Struct_union_member_list(std::string element)
{
	this->element = element;
}



void Tk_tagged_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_tagged_opt::Tk_tagged_opt(std::string element)
{
	this->element = element;
}



void Assignment_pattern::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Assignment_pattern::Assignment_pattern(std::string element)
{
	this->element = element;
}



void Structure_or_array_pattern_expression_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Structure_or_array_pattern_expression_list::Structure_or_array_pattern_expression_list(std::string element)
{
	this->element = element;
}



void Structure_or_array_pattern_key::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Structure_or_array_pattern_key::Structure_or_array_pattern_key(std::string element)
{
	this->element = element;
}



void Structure_or_array_pattern_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Structure_or_array_pattern_expression::Structure_or_array_pattern_expression(std::string element)
{
	this->element = element;
}



void Scope_prefix::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Scope_prefix::Scope_prefix(std::string element)
{
	this->element = element;
}



void Package_import_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_import_item::Package_import_item(std::string element)
{
	this->element = element;
}



void Package_import_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Package_import_item_list::Package_import_item_list(std::string element)
{
	this->element = element;
}



void Tk_edge_descriptor::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Tk_edge_descriptor::Tk_edge_descriptor(std::string element)
{
	this->element = element;
}



void Class_item_qualifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Class_item_qualifier::Class_item_qualifier(std::string element)
{
	this->element = element;
}



void Property_qualifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Property_qualifier::Property_qualifier(std::string element)
{
	this->element = element;
}



void Final_or_zero::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Final_or_zero::Final_or_zero(std::string element)
{
	this->element = element;
}



void Stream_operator::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Stream_operator::Stream_operator(std::string element)
{
	this->element = element;
}



void Slice_size_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Slice_size_opt::Slice_size_opt(std::string element)
{
	this->element = element;
}



void Stream_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Stream_expression::Stream_expression(std::string element)
{
	this->element = element;
}



void Stream_expression_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Stream_expression_list::Stream_expression_list(std::string element)
{
	this->element = element;
}



void Identifier_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Identifier_opt::Identifier_opt(std::string element)
{
	this->element = element;
}



void Clocking_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}

 Clocking_item_list_opt::Clocking_item_list_opt(std::string element)
{
	this->element = element;
}

std::shared_ptr<Node> map_class(std::string c)
{
	if(c == "terminal")
 return std::make_shared<Terminal>(c);
else if(c == "time_literal")
 return std::make_shared<Time_literal>(c);
else if(c == "tk_timeliteral")
 return std::make_shared<Tk_timeliteral>(c);
else if(c == "tk_decnumber")
 return std::make_shared<Tk_decnumber>(c);
else if(c == "timescale_directive")
 return std::make_shared<Timescale_directive>(c);
else if(c == "package_item_no_pp")
 return std::make_shared<Package_item_no_pp>(c);
else if(c == "misc_directive")
 return std::make_shared<Misc_directive>(c);
else if(c == "package_or_generate_item_declaration")
 return std::make_shared<Package_or_generate_item_declaration>(c);
else if(c == "data_declaration")
 return std::make_shared<Data_declaration>(c);
else if(c == "any_param_declaration")
 return std::make_shared<Any_param_declaration>(c);
else if(c == "timeunits_declaration")
 return std::make_shared<Timeunits_declaration>(c);
else if(c == "type_declaration")
 return std::make_shared<Type_declaration>(c);
else if(c == "package_import_declaration")
 return std::make_shared<Package_import_declaration>(c);
else if(c == "description")
 return std::make_shared<Description>(c);
else if(c == "module_or_interface_declaration")
 return std::make_shared<Module_or_interface_declaration>(c);
else if(c == "preprocessor_action")
 return std::make_shared<Preprocessor_action>(c);
else if(c == "udp_primitive")
 return std::make_shared<Udp_primitive>(c);
else if(c == "package_declaration")
 return std::make_shared<Package_declaration>(c);
else if(c == "description_list")
 return std::make_shared<Description_list>(c);
else if(c == "module_start")
 return std::make_shared<Module_start>(c);
else if(c == "lifetime_opt")
 return std::make_shared<Lifetime_opt>(c);
else if(c == "lifetime")
 return std::make_shared<Lifetime>(c);
else if(c == "genericidentifier")
 return std::make_shared<Genericidentifier>(c);
else if(c == "symbolidentifier")
 return std::make_shared<Symbolidentifier>(c);
else if(c == "escapedidentifier")
 return std::make_shared<Escapedidentifier>(c);
else if(c == "keywordidentifier")
 return std::make_shared<Keywordidentifier>(c);
else if(c == "symbol_or_label")
 return std::make_shared<Symbol_or_label>(c);
else if(c == "module_package_import_list_opt")
 return std::make_shared<Module_package_import_list_opt>(c);
else if(c == "package_import_list")
 return std::make_shared<Package_import_list>(c);
else if(c == "module_parameter_port_list_opt")
 return std::make_shared<Module_parameter_port_list_opt>(c);
else if(c == "module_parameter_port_list")
 return std::make_shared<Module_parameter_port_list>(c);
else if(c == "module_port_list_opt")
 return std::make_shared<Module_port_list_opt>(c);
else if(c == "list_of_ports_or_port_declarations_opt")
 return std::make_shared<List_of_ports_or_port_declarations_opt>(c);
else if(c == "module_attribute_foreign_opt")
 return std::make_shared<Module_attribute_foreign_opt>(c);
else if(c == "integer_vector_type")
 return std::make_shared<Integer_vector_type>(c);
else if(c == "signed_unsigned_opt")
 return std::make_shared<Signed_unsigned_opt>(c);
else if(c == "signing")
 return std::make_shared<Signing>(c);
else if(c == "data_type_primitive_scalar")
 return std::make_shared<Data_type_primitive_scalar>(c);
else if(c == "integer_atom_type")
 return std::make_shared<Integer_atom_type>(c);
else if(c == "non_integer_type")
 return std::make_shared<Non_integer_type>(c);
else if(c == "enum_data_type")
 return std::make_shared<Enum_data_type>(c);
else if(c == "struct_data_type")
 return std::make_shared<Struct_data_type>(c);
else if(c == "decl_dimensions_opt")
 return std::make_shared<Decl_dimensions_opt>(c);
else if(c == "decl_dimensions")
 return std::make_shared<Decl_dimensions>(c);
else if(c == "data_type_primitive")
 return std::make_shared<Data_type_primitive>(c);
else if(c == "data_type_base")
 return std::make_shared<Data_type_base>(c);
else if(c == "data_type")
 return std::make_shared<Data_type>(c);
else if(c == "reference")
 return std::make_shared<Reference>(c);
else if(c == "instantiation_type")
 return std::make_shared<Instantiation_type>(c);
else if(c == "trailing_decl_assignment_opt")
 return std::make_shared<Trailing_decl_assignment_opt>(c);
else if(c == "trailing_decl_assignment")
 return std::make_shared<Trailing_decl_assignment>(c);
else if(c == "non_anonymous_gate_instance_or_register_variable")
 return std::make_shared<Non_anonymous_gate_instance_or_register_variable>(c);
else if(c == "any_port_list_opt")
 return std::make_shared<Any_port_list_opt>(c);
else if(c == "non_anonymous_gate_instance_or_register_variable_list")
 return std::make_shared<Non_anonymous_gate_instance_or_register_variable_list>(c);
else if(c == "gate_instance_or_register_variable")
 return std::make_shared<Gate_instance_or_register_variable>(c);
else if(c == "instantiation_base")
 return std::make_shared<Instantiation_base>(c);
else if(c == "reference_or_call_base")
 return std::make_shared<Reference_or_call_base>(c);
else if(c == "data_declaration_or_module_instantiation")
 return std::make_shared<Data_declaration_or_module_instantiation>(c);
else if(c == "const_opt")
 return std::make_shared<Const_opt>(c);
else if(c == "module_or_generate_item")
 return std::make_shared<Module_or_generate_item>(c);
else if(c == "module_common_item")
 return std::make_shared<Module_common_item>(c);
else if(c == "parameter_override")
 return std::make_shared<Parameter_override>(c);
else if(c == "gate_instantiation")
 return std::make_shared<Gate_instantiation>(c);
else if(c == "non_port_module_item")
 return std::make_shared<Non_port_module_item>(c);
else if(c == "generate_region")
 return std::make_shared<Generate_region>(c);
else if(c == "specify_block")
 return std::make_shared<Specify_block>(c);
else if(c == "module_item")
 return std::make_shared<Module_item>(c);
else if(c == "module_port_declaration")
 return std::make_shared<Module_port_declaration>(c);
else if(c == "module_block")
 return std::make_shared<Module_block>(c);
else if(c == "module_item_directive")
 return std::make_shared<Module_item_directive>(c);
else if(c == "module_item_list")
 return std::make_shared<Module_item_list>(c);
else if(c == "net_type")
 return std::make_shared<Net_type>(c);
else if(c == "number")
 return std::make_shared<Number>(c);
else if(c == "constant_dec_number")
 return std::make_shared<Constant_dec_number>(c);
else if(c == "based_number")
 return std::make_shared<Based_number>(c);
else if(c == "tk_unbasednumber")
 return std::make_shared<Tk_unbasednumber>(c);
else if(c == "expr_primary_no_groups")
 return std::make_shared<Expr_primary_no_groups>(c);
else if(c == "system_tf_call")
 return std::make_shared<System_tf_call>(c);
else if(c == "string_literal")
 return std::make_shared<String_literal>(c);
else if(c == "tk_realtime")
 return std::make_shared<Tk_realtime>(c);
else if(c == "cast")
 return std::make_shared<Cast>(c);
else if(c == "expr_primary")
 return std::make_shared<Expr_primary>(c);
else if(c == "expr_primary_parens")
 return std::make_shared<Expr_primary_parens>(c);
else if(c == "expr_primary_braces")
 return std::make_shared<Expr_primary_braces>(c);
else if(c == "assignment_pattern_expression")
 return std::make_shared<Assignment_pattern_expression>(c);
else if(c == "postfix_expression")
 return std::make_shared<Postfix_expression>(c);
else if(c == "reference_or_call")
 return std::make_shared<Reference_or_call>(c);
else if(c == "inc_or_dec_or_primary_expr")
 return std::make_shared<Inc_or_dec_or_primary_expr>(c);
else if(c == "inc_or_dec_expression")
 return std::make_shared<Inc_or_dec_expression>(c);
else if(c == "unary_prefix_expr")
 return std::make_shared<Unary_prefix_expr>(c);
else if(c == "unary_op")
 return std::make_shared<Unary_op>(c);
else if(c == "unary_expr")
 return std::make_shared<Unary_expr>(c);
else if(c == "pow_expr")
 return std::make_shared<Pow_expr>(c);
else if(c == "mul_expr")
 return std::make_shared<Mul_expr>(c);
else if(c == "add_expr")
 return std::make_shared<Add_expr>(c);
else if(c == "shift_expr")
 return std::make_shared<Shift_expr>(c);
else if(c == "comp_expr")
 return std::make_shared<Comp_expr>(c);
else if(c == "open_range_list")
 return std::make_shared<Open_range_list>(c);
else if(c == "logeq_expr")
 return std::make_shared<Logeq_expr>(c);
else if(c == "caseeq_expr")
 return std::make_shared<Caseeq_expr>(c);
else if(c == "bitand_expr")
 return std::make_shared<Bitand_expr>(c);
else if(c == "xor_expr")
 return std::make_shared<Xor_expr>(c);
else if(c == "bitor_expr")
 return std::make_shared<Bitor_expr>(c);
else if(c == "with_exprs_suffix")
 return std::make_shared<With_exprs_suffix>(c);
else if(c == "matches_expr")
 return std::make_shared<Matches_expr>(c);
else if(c == "logand_expr")
 return std::make_shared<Logand_expr>(c);
else if(c == "logor_expr")
 return std::make_shared<Logor_expr>(c);
else if(c == "cond_expr")
 return std::make_shared<Cond_expr>(c);
else if(c == "expression")
 return std::make_shared<Expression>(c);
else if(c == "equiv_impl_expr")
 return std::make_shared<Equiv_impl_expr>(c);
else if(c == "decl_variable_dimension")
 return std::make_shared<Decl_variable_dimension>(c);
else if(c == "expression_or_null_list_opt")
 return std::make_shared<Expression_or_null_list_opt>(c);
else if(c == "delay3_or_drive_opt")
 return std::make_shared<Delay3_or_drive_opt>(c);
else if(c == "delay3")
 return std::make_shared<Delay3>(c);
else if(c == "data_type_or_implicit")
 return std::make_shared<Data_type_or_implicit>(c);
else if(c == "net_variable")
 return std::make_shared<Net_variable>(c);
else if(c == "net_variable_or_decl_assign")
 return std::make_shared<Net_variable_or_decl_assign>(c);
else if(c == "net_decl_assign")
 return std::make_shared<Net_decl_assign>(c);
else if(c == "net_variable_or_decl_assigns")
 return std::make_shared<Net_variable_or_decl_assigns>(c);
else if(c == "net_declaration")
 return std::make_shared<Net_declaration>(c);
else if(c == "charge_strength_opt")
 return std::make_shared<Charge_strength_opt>(c);
else if(c == "delay3_opt")
 return std::make_shared<Delay3_opt>(c);
else if(c == "list_of_identifiers")
 return std::make_shared<List_of_identifiers>(c);
else if(c == "task_declaration")
 return std::make_shared<Task_declaration>(c);
else if(c == "function_declaration")
 return std::make_shared<Function_declaration>(c);
else if(c == "class_declaration")
 return std::make_shared<Class_declaration>(c);
else if(c == "dpi_import_export")
 return std::make_shared<Dpi_import_export>(c);
else if(c == "specparam_declaration")
 return std::make_shared<Specparam_declaration>(c);
else if(c == "module_or_generate_item_declaration")
 return std::make_shared<Module_or_generate_item_declaration>(c);
else if(c == "genvar_declaration")
 return std::make_shared<Genvar_declaration>(c);
else if(c == "clocking_declaration")
 return std::make_shared<Clocking_declaration>(c);
else if(c == "initial_construct")
 return std::make_shared<Initial_construct>(c);
else if(c == "always_construct")
 return std::make_shared<Always_construct>(c);
else if(c == "continuous_assign")
 return std::make_shared<Continuous_assign>(c);
else if(c == "loop_generate_construct")
 return std::make_shared<Loop_generate_construct>(c);
else if(c == "conditional_generate_construct")
 return std::make_shared<Conditional_generate_construct>(c);
else if(c == "assertion_item")
 return std::make_shared<Assertion_item>(c);
else if(c == "final_construct")
 return std::make_shared<Final_construct>(c);
else if(c == "parameter_value_opt")
 return std::make_shared<Parameter_value_opt>(c);
else if(c == "parameters")
 return std::make_shared<Parameters>(c);
else if(c == "unqualified_id")
 return std::make_shared<Unqualified_id>(c);
else if(c == "class_id")
 return std::make_shared<Class_id>(c);
else if(c == "qualified_id")
 return std::make_shared<Qualified_id>(c);
else if(c == "type_or_id_root")
 return std::make_shared<Type_or_id_root>(c);
else if(c == "implicit_class_handle")
 return std::make_shared<Implicit_class_handle>(c);
else if(c == "local_root")
 return std::make_shared<Local_root>(c);
else if(c == "select_variable_dimension")
 return std::make_shared<Select_variable_dimension>(c);
else if(c == "hierarchy_extension")
 return std::make_shared<Hierarchy_extension>(c);
else if(c == "member_name")
 return std::make_shared<Member_name>(c);
else if(c == "builtin_array_method")
 return std::make_shared<Builtin_array_method>(c);
else if(c == "port_named")
 return std::make_shared<Port_named>(c);
else if(c == "any_port")
 return std::make_shared<Any_port>(c);
else if(c == "any_port_list_item_last")
 return std::make_shared<Any_port_list_item_last>(c);
else if(c == "any_port_list_trailing_comma")
 return std::make_shared<Any_port_list_trailing_comma>(c);
else if(c == "any_port_list")
 return std::make_shared<Any_port_list>(c);
else if(c == "label_opt")
 return std::make_shared<Label_opt>(c);
else if(c == "begin")
 return std::make_shared<Begin>(c);
else if(c == "lpvalue")
 return std::make_shared<Lpvalue>(c);
else if(c == "range_list_in_braces")
 return std::make_shared<Range_list_in_braces>(c);
else if(c == "assignment_statement_no_expr")
 return std::make_shared<Assignment_statement_no_expr>(c);
else if(c == "assign_modify_statement")
 return std::make_shared<Assign_modify_statement>(c);
else if(c == "assignment_statement")
 return std::make_shared<Assignment_statement>(c);
else if(c == "statement_item")
 return std::make_shared<Statement_item>(c);
else if(c == "procedural_timing_control_statement")
 return std::make_shared<Procedural_timing_control_statement>(c);
else if(c == "subroutine_call")
 return std::make_shared<Subroutine_call>(c);
else if(c == "seq_block")
 return std::make_shared<Seq_block>(c);
else if(c == "nonblocking_assignment")
 return std::make_shared<Nonblocking_assignment>(c);
else if(c == "conditional_statement")
 return std::make_shared<Conditional_statement>(c);
else if(c == "case_statement")
 return std::make_shared<Case_statement>(c);
else if(c == "loop_statement")
 return std::make_shared<Loop_statement>(c);
else if(c == "par_block")
 return std::make_shared<Par_block>(c);
else if(c == "blocking_assignment")
 return std::make_shared<Blocking_assignment>(c);
else if(c == "wait_statement")
 return std::make_shared<Wait_statement>(c);
else if(c == "procedural_assertion_statement")
 return std::make_shared<Procedural_assertion_statement>(c);
else if(c == "procedural_continuous_assignment")
 return std::make_shared<Procedural_continuous_assignment>(c);
else if(c == "event_trigger")
 return std::make_shared<Event_trigger>(c);
else if(c == "disable_statement")
 return std::make_shared<Disable_statement>(c);
else if(c == "jump_statement")
 return std::make_shared<Jump_statement>(c);
else if(c == "block_item_or_statement_or_null")
 return std::make_shared<Block_item_or_statement_or_null>(c);
else if(c == "block_item_decl")
 return std::make_shared<Block_item_decl>(c);
else if(c == "block_item_or_statement_or_null_list")
 return std::make_shared<Block_item_or_statement_or_null_list>(c);
else if(c == "delay_value_simple")
 return std::make_shared<Delay_value_simple>(c);
else if(c == "delay_identifier")
 return std::make_shared<Delay_identifier>(c);
else if(c == "delay1")
 return std::make_shared<Delay1>(c);
else if(c == "delay_value")
 return std::make_shared<Delay_value>(c);
else if(c == "statement_or_null")
 return std::make_shared<Statement_or_null>(c);
else if(c == "statement")
 return std::make_shared<Statement>(c);
else if(c == "event_control")
 return std::make_shared<Event_control>(c);
else if(c == "cycle_delay")
 return std::make_shared<Cycle_delay>(c);
else if(c == "systemtfidentifier")
 return std::make_shared<Systemtfidentifier>(c);
else if(c == "call_base")
 return std::make_shared<Call_base>(c);
else if(c == "block_item_or_statement_or_null_list_opt")
 return std::make_shared<Block_item_or_statement_or_null_list_opt>(c);
else if(c == "end")
 return std::make_shared<End>(c);
else if(c == "always_any")
 return std::make_shared<Always_any>(c);
else if(c == "module_item_list_opt")
 return std::make_shared<Module_item_list_opt>(c);
else if(c == "module_end")
 return std::make_shared<Module_end>(c);
else if(c == "source_text")
 return std::make_shared<Source_text>(c);
else if(c == "port_reference")
 return std::make_shared<Port_reference>(c);
else if(c == "port_expression")
 return std::make_shared<Port_expression>(c);
else if(c == "port_reference_list")
 return std::make_shared<Port_reference_list>(c);
else if(c == "trailing_assign_opt")
 return std::make_shared<Trailing_assign_opt>(c);
else if(c == "trailing_assign")
 return std::make_shared<Trailing_assign>(c);
else if(c == "port")
 return std::make_shared<Port>(c);
else if(c == "port_expression_opt")
 return std::make_shared<Port_expression_opt>(c);
else if(c == "port_or_port_declaration")
 return std::make_shared<Port_or_port_declaration>(c);
else if(c == "port_declaration")
 return std::make_shared<Port_declaration>(c);
else if(c == "list_of_ports_or_port_declarations_item_last")
 return std::make_shared<List_of_ports_or_port_declarations_item_last>(c);
else if(c == "list_of_ports_or_port_declarations_trailing_comma")
 return std::make_shared<List_of_ports_or_port_declarations_trailing_comma>(c);
else if(c == "list_of_ports_or_port_declarations")
 return std::make_shared<List_of_ports_or_port_declarations>(c);
else if(c == "dir")
 return std::make_shared<Dir>(c);
else if(c == "var_type")
 return std::make_shared<Var_type>(c);
else if(c == "list_of_port_identifiers")
 return std::make_shared<List_of_port_identifiers>(c);
else if(c == "port_direction")
 return std::make_shared<Port_direction>(c);
else if(c == "list_of_module_item_identifiers")
 return std::make_shared<List_of_module_item_identifiers>(c);
else if(c == "list_of_identifiers_unpacked_dimensions")
 return std::make_shared<List_of_identifiers_unpacked_dimensions>(c);
else if(c == "port_net_type")
 return std::make_shared<Port_net_type>(c);
else if(c == "identifier_optional_unpacked_dimensions")
 return std::make_shared<Identifier_optional_unpacked_dimensions>(c);
else if(c == "drive_strength_opt")
 return std::make_shared<Drive_strength_opt>(c);
else if(c == "drive_strength")
 return std::make_shared<Drive_strength>(c);
else if(c == "cont_assign")
 return std::make_shared<Cont_assign>(c);
else if(c == "cont_assign_list")
 return std::make_shared<Cont_assign_list>(c);
else if(c == "edge_operator")
 return std::make_shared<Edge_operator>(c);
else if(c == "event_expression")
 return std::make_shared<Event_expression>(c);
else if(c == "event_expression_list")
 return std::make_shared<Event_expression_list>(c);
else if(c == "hierarchy_event_identifier")
 return std::make_shared<Hierarchy_event_identifier>(c);
else if(c == "unique_priority_opt")
 return std::make_shared<Unique_priority_opt>(c);
else if(c == "expression_in_parens")
 return std::make_shared<Expression_in_parens>(c);
else if(c == "delay_or_event_control_opt")
 return std::make_shared<Delay_or_event_control_opt>(c);
else if(c == "delay_or_event_control")
 return std::make_shared<Delay_or_event_control>(c);
else if(c == "expression_opt")
 return std::make_shared<Expression_opt>(c);
else if(c == "bit_logic_opt")
 return std::make_shared<Bit_logic_opt>(c);
else if(c == "bit_logic")
 return std::make_shared<Bit_logic>(c);
else if(c == "param_type_followed_by_id_and_dimensions_opt")
 return std::make_shared<Param_type_followed_by_id_and_dimensions_opt>(c);
else if(c == "parameter_expr")
 return std::make_shared<Parameter_expr>(c);
else if(c == "parameter_value_ranges_opt")
 return std::make_shared<Parameter_value_ranges_opt>(c);
else if(c == "parameter_assign")
 return std::make_shared<Parameter_assign>(c);
else if(c == "parameter_assign_list")
 return std::make_shared<Parameter_assign_list>(c);
else if(c == "localparam_assign_list")
 return std::make_shared<Localparam_assign_list>(c);
else if(c == "type_assignment_list")
 return std::make_shared<Type_assignment_list>(c);
else if(c == "macronumericwidth")
 return std::make_shared<Macronumericwidth>(c);
else if(c == "hex_based_number")
 return std::make_shared<Hex_based_number>(c);
else if(c == "tk_hexbase")
 return std::make_shared<Tk_hexbase>(c);
else if(c == "tk_hexdigits")
 return std::make_shared<Tk_hexdigits>(c);
else if(c == "dec_based_number")
 return std::make_shared<Dec_based_number>(c);
else if(c == "bin_based_number")
 return std::make_shared<Bin_based_number>(c);
else if(c == "oct_based_number")
 return std::make_shared<Oct_based_number>(c);
else if(c == "tk_decbase")
 return std::make_shared<Tk_decbase>(c);
else if(c == "tk_decdigits")
 return std::make_shared<Tk_decdigits>(c);
else if(c == "tk_xzdigits")
 return std::make_shared<Tk_xzdigits>(c);
else if(c == "case_any")
 return std::make_shared<Case_any>(c);
else if(c == "expression_list_proper")
 return std::make_shared<Expression_list_proper>(c);
else if(c == "case_item")
 return std::make_shared<Case_item>(c);
else if(c == "preprocessor_directive")
 return std::make_shared<Preprocessor_directive>(c);
else if(c == "case_items")
 return std::make_shared<Case_items>(c);
else if(c == "tk_binbase")
 return std::make_shared<Tk_binbase>(c);
else if(c == "tk_bindigits")
 return std::make_shared<Tk_bindigits>(c);
else if(c == "dist_opt")
 return std::make_shared<Dist_opt>(c);
else if(c == "expression_or_dist")
 return std::make_shared<Expression_or_dist>(c);
else if(c == "boolean_abbrev_opt")
 return std::make_shared<Boolean_abbrev_opt>(c);
else if(c == "sequence_repetition_expr")
 return std::make_shared<Sequence_repetition_expr>(c);
else if(c == "sequence_expr_primary")
 return std::make_shared<Sequence_expr_primary>(c);
else if(c == "sequence_delay_repetition_list")
 return std::make_shared<Sequence_delay_repetition_list>(c);
else if(c == "sequence_delay_range_expr")
 return std::make_shared<Sequence_delay_range_expr>(c);
else if(c == "sequence_throughout_expr")
 return std::make_shared<Sequence_throughout_expr>(c);
else if(c == "sequence_within_expr")
 return std::make_shared<Sequence_within_expr>(c);
else if(c == "sequence_intersect_expr")
 return std::make_shared<Sequence_intersect_expr>(c);
else if(c == "sequence_unary_expr")
 return std::make_shared<Sequence_unary_expr>(c);
else if(c == "sequence_and_expr")
 return std::make_shared<Sequence_and_expr>(c);
else if(c == "sequence_or_expr")
 return std::make_shared<Sequence_or_expr>(c);
else if(c == "simple_sequence_expr")
 return std::make_shared<Simple_sequence_expr>(c);
else if(c == "property_if_else_expr")
 return std::make_shared<Property_if_else_expr>(c);
else if(c == "property_prefix_expr")
 return std::make_shared<Property_prefix_expr>(c);
else if(c == "property_implication_expr")
 return std::make_shared<Property_implication_expr>(c);
else if(c == "sequence_expr")
 return std::make_shared<Sequence_expr>(c);
else if(c == "property_expr")
 return std::make_shared<Property_expr>(c);
else if(c == "property_expr_or_assignment")
 return std::make_shared<Property_expr_or_assignment>(c);
else if(c == "property_expr_or_assignment_list")
 return std::make_shared<Property_expr_or_assignment_list>(c);
else if(c == "expr_mintypmax_generalized")
 return std::make_shared<Expr_mintypmax_generalized>(c);
else if(c == "expr_mintypmax_trans_set")
 return std::make_shared<Expr_mintypmax_trans_set>(c);
else if(c == "expr_mintypmax")
 return std::make_shared<Expr_mintypmax>(c);
else if(c == "value_range")
 return std::make_shared<Value_range>(c);
else if(c == "streaming_concatenation")
 return std::make_shared<Streaming_concatenation>(c);
else if(c == "genvar_opt")
 return std::make_shared<Genvar_opt>(c);
else if(c == "for_step")
 return std::make_shared<For_step>(c);
else if(c == "for_step_opt")
 return std::make_shared<For_step_opt>(c);
else if(c == "generate_item")
 return std::make_shared<Generate_item>(c);
else if(c == "generate_block")
 return std::make_shared<Generate_block>(c);
else if(c == "generate_item_list")
 return std::make_shared<Generate_item_list>(c);
else if(c == "generate_item_list_opt")
 return std::make_shared<Generate_item_list_opt>(c);
else if(c == "for_init_decl_or_assign")
 return std::make_shared<For_init_decl_or_assign>(c);
else if(c == "for_initialization")
 return std::make_shared<For_initialization>(c);
else if(c == "for_initialization_opt")
 return std::make_shared<For_initialization_opt>(c);
else if(c == "repeat_control")
 return std::make_shared<Repeat_control>(c);
else if(c == "tk_stringliteral")
 return std::make_shared<Tk_stringliteral>(c);
else if(c == "tk_evalstringliteral")
 return std::make_shared<Tk_evalstringliteral>(c);
else if(c == "preprocess_include_argument")
 return std::make_shared<Preprocess_include_argument>(c);
else if(c == "pp_identifier")
 return std::make_shared<Pp_identifier>(c);
else if(c == "macro_formals_list_opt")
 return std::make_shared<Macro_formals_list_opt>(c);
else if(c == "parameter_expr_list")
 return std::make_shared<Parameter_expr_list>(c);
else if(c == "parameter_value_byname_list")
 return std::make_shared<Parameter_value_byname_list>(c);
else if(c == "parameter_opt")
 return std::make_shared<Parameter_opt>(c);
else if(c == "module_parameter_port")
 return std::make_shared<Module_parameter_port>(c);
else if(c == "type_assignment")
 return std::make_shared<Type_assignment>(c);
else if(c == "module_parameter_port_list_item_last")
 return std::make_shared<Module_parameter_port_list_item_last>(c);
else if(c == "module_parameter_port_list_trailing_comma")
 return std::make_shared<Module_parameter_port_list_trailing_comma>(c);
else if(c == "module_parameter_port_list_preprocessor_last")
 return std::make_shared<Module_parameter_port_list_preprocessor_last>(c);
else if(c == "parameter_value_byname")
 return std::make_shared<Parameter_value_byname>(c);
else if(c == "parameter_value_byname_list_item_last")
 return std::make_shared<Parameter_value_byname_list_item_last>(c);
else if(c == "parameter_value_byname_list_trailing_comma")
 return std::make_shared<Parameter_value_byname_list_trailing_comma>(c);
else if(c == "generate_if")
 return std::make_shared<Generate_if>(c);
else if(c == "generate_case_items")
 return std::make_shared<Generate_case_items>(c);
else if(c == "var_or_net_type_opt")
 return std::make_shared<Var_or_net_type_opt>(c);
else if(c == "type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt")
 return std::make_shared<Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt>(c);
else if(c == "data_type_or_implicit_basic_followed_by_id_and_dimensions_opt")
 return std::make_shared<Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt>(c);
else if(c == "port_declaration_noattr")
 return std::make_shared<Port_declaration_noattr>(c);
else if(c == "type_identifier_followed_by_id")
 return std::make_shared<Type_identifier_followed_by_id>(c);
else if(c == "class_new")
 return std::make_shared<Class_new>(c);
else if(c == "dynamic_array_new")
 return std::make_shared<Dynamic_array_new>(c);
else if(c == "localparam_assign")
 return std::make_shared<Localparam_assign>(c);
else if(c == "defparam_assign")
 return std::make_shared<Defparam_assign>(c);
else if(c == "defparam_assign_list")
 return std::make_shared<Defparam_assign_list>(c);
else if(c == "any_argument")
 return std::make_shared<Any_argument>(c);
else if(c == "any_argument_list_item_last")
 return std::make_shared<Any_argument_list_item_last>(c);
else if(c == "any_argument_list_trailing_comma")
 return std::make_shared<Any_argument_list_trailing_comma>(c);
else if(c == "any_argument_list")
 return std::make_shared<Any_argument_list>(c);
else if(c == "argument_list_opt")
 return std::make_shared<Argument_list_opt>(c);
else if(c == "task_declaration_id")
 return std::make_shared<Task_declaration_id>(c);
else if(c == "scope_or_if_res")
 return std::make_shared<Scope_or_if_res>(c);
else if(c == "tf_port_list_paren_opt")
 return std::make_shared<Tf_port_list_paren_opt>(c);
else if(c == "tf_port_list_opt")
 return std::make_shared<Tf_port_list_opt>(c);
else if(c == "tf_item_or_statement_or_null")
 return std::make_shared<Tf_item_or_statement_or_null>(c);
else if(c == "task_item")
 return std::make_shared<Task_item>(c);
else if(c == "tf_item_or_statement_or_null_list")
 return std::make_shared<Tf_item_or_statement_or_null_list>(c);
else if(c == "tf_item_or_statement_or_null_list_opt")
 return std::make_shared<Tf_item_or_statement_or_null_list_opt>(c);
else if(c == "array_reduction_method")
 return std::make_shared<Array_reduction_method>(c);
else if(c == "array_locator_method")
 return std::make_shared<Array_locator_method>(c);
else if(c == "gatetype")
 return std::make_shared<Gatetype>(c);
else if(c == "primitive_gate_instance")
 return std::make_shared<Primitive_gate_instance>(c);
else if(c == "primitive_gate_instance_list")
 return std::make_shared<Primitive_gate_instance_list>(c);
else if(c == "switchtype")
 return std::make_shared<Switchtype>(c);
else if(c == "dr_strength1")
 return std::make_shared<Dr_strength1>(c);
else if(c == "dr_strength0")
 return std::make_shared<Dr_strength0>(c);
else if(c == "delay_scope")
 return std::make_shared<Delay_scope>(c);
else if(c == "join_keyword")
 return std::make_shared<Join_keyword>(c);
else if(c == "generate_case_item")
 return std::make_shared<Generate_case_item>(c);
else if(c == "function_return_type_and_id")
 return std::make_shared<Function_return_type_and_id>(c);
else if(c == "tf_port_direction")
 return std::make_shared<Tf_port_direction>(c);
else if(c == "tf_port_direction_opt")
 return std::make_shared<Tf_port_direction_opt>(c);
else if(c == "tf_port_item_expr_opt")
 return std::make_shared<Tf_port_item_expr_opt>(c);
else if(c == "tf_port_item")
 return std::make_shared<Tf_port_item>(c);
else if(c == "tf_port_list_item_last")
 return std::make_shared<Tf_port_list_item_last>(c);
else if(c == "tf_port_list_trailing_comma")
 return std::make_shared<Tf_port_list_trailing_comma>(c);
else if(c == "tf_port_list")
 return std::make_shared<Tf_port_list>(c);
else if(c == "endfunction_label_opt")
 return std::make_shared<Endfunction_label_opt>(c);
else if(c == "function_item_list")
 return std::make_shared<Function_item_list>(c);
else if(c == "statement_or_null_list_opt")
 return std::make_shared<Statement_or_null_list_opt>(c);
else if(c == "net_type_or_none")
 return std::make_shared<Net_type_or_none>(c);
else if(c == "pull01")
 return std::make_shared<Pull01>(c);
else if(c == "macro_formal_parameter")
 return std::make_shared<Macro_formal_parameter>(c);
else if(c == "macro_formals_list")
 return std::make_shared<Macro_formals_list>(c);
else if(c == "tf_variable_identifier_first")
 return std::make_shared<Tf_variable_identifier_first>(c);
else if(c == "list_of_tf_variable_identifiers")
 return std::make_shared<List_of_tf_variable_identifiers>(c);
else if(c == "tf_variable_identifier")
 return std::make_shared<Tf_variable_identifier>(c);
else if(c == "tf_port_declaration")
 return std::make_shared<Tf_port_declaration>(c);
else if(c == "function_item")
 return std::make_shared<Function_item>(c);
else if(c == "function_item_data_declaration")
 return std::make_shared<Function_item_data_declaration>(c);
else if(c == "non_anonymous_instantiation_base")
 return std::make_shared<Non_anonymous_instantiation_base>(c);
else if(c == "statement_or_null_list")
 return std::make_shared<Statement_or_null_list>(c);
else if(c == "tk_octbase")
 return std::make_shared<Tk_octbase>(c);
else if(c == "tk_octdigits")
 return std::make_shared<Tk_octdigits>(c);
else if(c == "specify_terminal_descriptor")
 return std::make_shared<Specify_terminal_descriptor>(c);
else if(c == "spec_reference_event")
 return std::make_shared<Spec_reference_event>(c);
else if(c == "edge_descriptor_list")
 return std::make_shared<Edge_descriptor_list>(c);
else if(c == "spec_notifier")
 return std::make_shared<Spec_notifier>(c);
else if(c == "spec_notifier_opt")
 return std::make_shared<Spec_notifier_opt>(c);
else if(c == "specify_item")
 return std::make_shared<Specify_item>(c);
else if(c == "specify_simple_path_decl")
 return std::make_shared<Specify_simple_path_decl>(c);
else if(c == "specify_edge_path_decl")
 return std::make_shared<Specify_edge_path_decl>(c);
else if(c == "specparam_decl")
 return std::make_shared<Specparam_decl>(c);
else if(c == "specify_item_list")
 return std::make_shared<Specify_item_list>(c);
else if(c == "specify_path_identifiers")
 return std::make_shared<Specify_path_identifiers>(c);
else if(c == "spec_polarity")
 return std::make_shared<Spec_polarity>(c);
else if(c == "specify_simple_path")
 return std::make_shared<Specify_simple_path>(c);
else if(c == "delay_value_list")
 return std::make_shared<Delay_value_list>(c);
else if(c == "specify_item_list_opt")
 return std::make_shared<Specify_item_list_opt>(c);
else if(c == "casting_type")
 return std::make_shared<Casting_type>(c);
else if(c == "polarity_operator")
 return std::make_shared<Polarity_operator>(c);
else if(c == "specify_edge_path")
 return std::make_shared<Specify_edge_path>(c);
else if(c == "udp_port_list")
 return std::make_shared<Udp_port_list>(c);
else if(c == "udp_port_decl")
 return std::make_shared<Udp_port_decl>(c);
else if(c == "udp_port_decls")
 return std::make_shared<Udp_port_decls>(c);
else if(c == "udp_init_opt")
 return std::make_shared<Udp_init_opt>(c);
else if(c == "udp_initial")
 return std::make_shared<Udp_initial>(c);
else if(c == "udp_input_sym")
 return std::make_shared<Udp_input_sym>(c);
else if(c == "udp_input_list")
 return std::make_shared<Udp_input_list>(c);
else if(c == "udp_output_sym")
 return std::make_shared<Udp_output_sym>(c);
else if(c == "udp_sequ_entry")
 return std::make_shared<Udp_sequ_entry>(c);
else if(c == "udp_sequ_entry_list")
 return std::make_shared<Udp_sequ_entry_list>(c);
else if(c == "udp_entry_list")
 return std::make_shared<Udp_entry_list>(c);
else if(c == "udp_comb_entry_list")
 return std::make_shared<Udp_comb_entry_list>(c);
else if(c == "udp_body")
 return std::make_shared<Udp_body>(c);
else if(c == "tk_reg_opt")
 return std::make_shared<Tk_reg_opt>(c);
else if(c == "udp_initial_expr_opt")
 return std::make_shared<Udp_initial_expr_opt>(c);
else if(c == "udp_input_declaration_list")
 return std::make_shared<Udp_input_declaration_list>(c);
else if(c == "enum_name")
 return std::make_shared<Enum_name>(c);
else if(c == "pos_neg_number")
 return std::make_shared<Pos_neg_number>(c);
else if(c == "enum_name_list_item_last")
 return std::make_shared<Enum_name_list_item_last>(c);
else if(c == "enum_name_list_trailing_comma")
 return std::make_shared<Enum_name_list_trailing_comma>(c);
else if(c == "enum_name_list")
 return std::make_shared<Enum_name_list>(c);
else if(c == "action_block")
 return std::make_shared<Action_block>(c);
else if(c == "simple_immediate_assertion_statement")
 return std::make_shared<Simple_immediate_assertion_statement>(c);
else if(c == "immediate_assertion_statement")
 return std::make_shared<Immediate_assertion_statement>(c);
else if(c == "deferred_immediate_assertion_statement")
 return std::make_shared<Deferred_immediate_assertion_statement>(c);
else if(c == "var_opt")
 return std::make_shared<Var_opt>(c);
else if(c == "data_declaration_modifiers_opt")
 return std::make_shared<Data_declaration_modifiers_opt>(c);
else if(c == "data_declaration_base")
 return std::make_shared<Data_declaration_base>(c);
else if(c == "specparam")
 return std::make_shared<Specparam>(c);
else if(c == "specparam_list")
 return std::make_shared<Specparam_list>(c);
else if(c == "block_identifier_opt")
 return std::make_shared<Block_identifier_opt>(c);
else if(c == "event_control_opt")
 return std::make_shared<Event_control_opt>(c);
else if(c == "property_spec_disable_iff_opt")
 return std::make_shared<Property_spec_disable_iff_opt>(c);
else if(c == "property_spec")
 return std::make_shared<Property_spec>(c);
else if(c == "assert_property_statement")
 return std::make_shared<Assert_property_statement>(c);
else if(c == "concurrent_assertion_statement")
 return std::make_shared<Concurrent_assertion_statement>(c);
else if(c == "assume_property_statement")
 return std::make_shared<Assume_property_statement>(c);
else if(c == "cover_property_statement")
 return std::make_shared<Cover_property_statement>(c);
else if(c == "concurrent_assertion_item")
 return std::make_shared<Concurrent_assertion_item>(c);
else if(c == "tk_virtual_opt")
 return std::make_shared<Tk_virtual_opt>(c);
else if(c == "class_declaration_extends_opt")
 return std::make_shared<Class_declaration_extends_opt>(c);
else if(c == "implements_interface_list_opt")
 return std::make_shared<Implements_interface_list_opt>(c);
else if(c == "variable_decl_assignment")
 return std::make_shared<Variable_decl_assignment>(c);
else if(c == "list_of_variable_decl_assignments")
 return std::make_shared<List_of_variable_decl_assignments>(c);
else if(c == "class_item")
 return std::make_shared<Class_item>(c);
else if(c == "class_constructor")
 return std::make_shared<Class_constructor>(c);
else if(c == "method_qualifier_list_opt")
 return std::make_shared<Method_qualifier_list_opt>(c);
else if(c == "method_prototype")
 return std::make_shared<Method_prototype>(c);
else if(c == "class_item_qualifier_list_opt")
 return std::make_shared<Class_item_qualifier_list_opt>(c);
else if(c == "method_property_qualifier_list_not_starting_with_virtual")
 return std::make_shared<Method_property_qualifier_list_not_starting_with_virtual>(c);
else if(c == "class_items")
 return std::make_shared<Class_items>(c);
else if(c == "class_constructor_prototype")
 return std::make_shared<Class_constructor_prototype>(c);
else if(c == "endnew_opt")
 return std::make_shared<Endnew_opt>(c);
else if(c == "class_items_opt")
 return std::make_shared<Class_items_opt>(c);
else if(c == "package_item")
 return std::make_shared<Package_item>(c);
else if(c == "package_item_list")
 return std::make_shared<Package_item_list>(c);
else if(c == "task_prototype")
 return std::make_shared<Task_prototype>(c);
else if(c == "function_prototype")
 return std::make_shared<Function_prototype>(c);
else if(c == "package_item_list_opt")
 return std::make_shared<Package_item_list_opt>(c);
else if(c == "select_dimensions_opt")
 return std::make_shared<Select_dimensions_opt>(c);
else if(c == "hierarchy_segment")
 return std::make_shared<Hierarchy_segment>(c);
else if(c == "dpi_spec_string")
 return std::make_shared<Dpi_spec_string>(c);
else if(c == "dpi_import_property_opt")
 return std::make_shared<Dpi_import_property_opt>(c);
else if(c == "dpi_import_item")
 return std::make_shared<Dpi_import_item>(c);
else if(c == "udp_comb_entry")
 return std::make_shared<Udp_comb_entry>(c);
else if(c == "tk_ls_eq")
 return std::make_shared<Tk_ls_eq>(c);
else if(c == "tk_rs_eq")
 return std::make_shared<Tk_rs_eq>(c);
else if(c == "tk_rss_eq")
 return std::make_shared<Tk_rss_eq>(c);
else if(c == "packed_signing_opt")
 return std::make_shared<Packed_signing_opt>(c);
else if(c == "random_qualifier_opt")
 return std::make_shared<Random_qualifier_opt>(c);
else if(c == "data_type_or_implicit_followed_by_id_and_dimensions_opt")
 return std::make_shared<Data_type_or_implicit_followed_by_id_and_dimensions_opt>(c);
else if(c == "type_identifier_or_implicit_followed_by_id_and_dimensions_opt")
 return std::make_shared<Type_identifier_or_implicit_followed_by_id_and_dimensions_opt>(c);
else if(c == "struct_union_member")
 return std::make_shared<Struct_union_member>(c);
else if(c == "struct_union_member_list")
 return std::make_shared<Struct_union_member_list>(c);
else if(c == "tk_tagged_opt")
 return std::make_shared<Tk_tagged_opt>(c);
else if(c == "assignment_pattern")
 return std::make_shared<Assignment_pattern>(c);
else if(c == "structure_or_array_pattern_expression_list")
 return std::make_shared<Structure_or_array_pattern_expression_list>(c);
else if(c == "structure_or_array_pattern_key")
 return std::make_shared<Structure_or_array_pattern_key>(c);
else if(c == "structure_or_array_pattern_expression")
 return std::make_shared<Structure_or_array_pattern_expression>(c);
else if(c == "scope_prefix")
 return std::make_shared<Scope_prefix>(c);
else if(c == "package_import_item")
 return std::make_shared<Package_import_item>(c);
else if(c == "package_import_item_list")
 return std::make_shared<Package_import_item_list>(c);
else if(c == "tk_edge_descriptor")
 return std::make_shared<Tk_edge_descriptor>(c);
else if(c == "class_item_qualifier")
 return std::make_shared<Class_item_qualifier>(c);
else if(c == "property_qualifier")
 return std::make_shared<Property_qualifier>(c);
else if(c == "final_or_zero")
 return std::make_shared<Final_or_zero>(c);
else if(c == "stream_operator")
 return std::make_shared<Stream_operator>(c);
else if(c == "slice_size_opt")
 return std::make_shared<Slice_size_opt>(c);
else if(c == "stream_expression")
 return std::make_shared<Stream_expression>(c);
else if(c == "stream_expression_list")
 return std::make_shared<Stream_expression_list>(c);
else if(c == "identifier_opt")
 return std::make_shared<Identifier_opt>(c);
else if(c == "clocking_item_list_opt")
 return std::make_shared<Clocking_item_list_opt>(c);
else return std::make_shared<Terminal>(c);
}
