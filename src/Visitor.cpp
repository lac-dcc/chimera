#include "Visitor.h"
#include "AST.h"




void CodeGenVisitor::visit(Tf_port_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Endfunction_label_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_list_trailing_comma *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_or_generate_item_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_param_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Net_type_or_none *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Timeunits_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Non_anonymous_gate_instance_or_register_variable *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Type_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_import_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Timescale_directive *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Macro_formal_parameter *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Description_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_or_interface_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Function_item_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Statement_or_null_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Time_literal *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Preprocessor_action *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Pull01 *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_timeliteral *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_primitive *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_decnumber *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Macro_formals_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_item_no_pp *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_variable_identifier_first *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Description *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_start *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Lifetime_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Misc_directive *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Cont_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Switchtype *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dr_strength0 *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dr_strength1 *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Bit_logic_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Drive_strength *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expression_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_input_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Cont_assign_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Function_prototype *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Edge_operator *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay_scope *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Bit_logic *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Param_type_followed_by_id_and_dimensions_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Hierarchy_segment *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Event_expression *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Join_keyword *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Select_dimensions_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_value_ranges_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_item_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Generate_case_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Event_expression_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dpi_spec_string *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dpi_import_property_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_assign_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_output_sym *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dpi_import_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_sequ_entry *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Hierarchy_event_identifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Function_return_type_and_id *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Packed_signing_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_ls_eq *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Unique_priority_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_direction *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expression_in_parens *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_sequ_entry_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Macronumericwidth *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_direction_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_list_item_last *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_entry_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_comb_entry_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Hex_based_number *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay_or_event_control_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_item_expr_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Localparam_assign_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_comb_entry *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_attribute_foreign_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_body *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay_or_event_control *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Type_assignment_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Decl_dimensions *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_ports_or_port_declarations *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_ports_or_port_declarations_trailing_comma *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_item_or_statement_or_null_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Var_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dir *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Array_reduction_method *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Array_locator_method *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_port_identifiers *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Gatetype *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_tf_variable_identifiers *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Primitive_gate_instance *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_module_item_identifiers *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Drive_strength_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_direction *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Identifier_optional_unpacked_dimensions *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_identifiers_unpacked_dimensions *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_net_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Primitive_gate_instance_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Postfix_expression *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expr_primary_parens *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_new *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_constructor *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expr_primary_braces *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Defparam_assign_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dynamic_array_new *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Assignment_pattern_expression *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Method_qualifier_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Casting_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Method_prototype *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Assert_property_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_item_qualifier_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Concurrent_assertion_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Defparam_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Inc_or_dec_or_primary_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Reference_or_call *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_argument *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Concurrent_assertion_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_items *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Polarity_operator *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Cover_property_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Method_property_qualifier_list_not_starting_with_virtual *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Unary_prefix_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_argument_list_item_last *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_argument_list_trailing_comma *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Inc_or_dec_expression *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Assume_property_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_argument_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_constructor_prototype *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Unary_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Endnew_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_declaration_extends_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Unary_op *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_edge_path *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_virtual_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Argument_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_initial *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_items_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_port_decls *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Task_declaration_id *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Implements_interface_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Pow_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_list_paren_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Shift_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Scope_or_if_res *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_item_or_statement_or_null_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_item_or_statement_or_null *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_item_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Mul_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Task_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Variable_decl_assignment *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_input_sym *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_init_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_port_decl *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_variable_decl_assignments *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_port_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Add_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Task_prototype *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_parameter_port_list_preprocessor_last *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Type_assignment *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_end *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Comp_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Generate_if *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Source_text *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_value_byname_list_item_last *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_reference *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Logeq_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_expression *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Trailing_assign_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_reference_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_value_byname_list_trailing_comma *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Open_range_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Trailing_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Localparam_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Var_or_net_type_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_declaration_noattr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Caseeq_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Generate_case_items *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Bitand_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Xor_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Type_identifier_followed_by_id *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_or_port_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_ports_or_port_declarations_item_last *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Bitor_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_expression_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specparam_decl *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_stringliteral *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_intersect_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_declaration_modifiers_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Var_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_unary_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Deferred_immediate_assertion_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Preprocess_include_argument *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_and_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_evalstringliteral *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Statement_or_null *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_or_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Systemtfidentifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Repeat_control *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay_value *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Simple_sequence_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_declaration_base *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_if_else_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_prefix_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Event_control *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_spec *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Pp_identifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specparam_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Cycle_delay *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specparam *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_implication_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_expr_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_parameter_port *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_value_byname *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Block_item_or_statement_or_null_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Macro_formals_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Call_base *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_value_byname_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Always_any *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_expr_or_assignment *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(End *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_parameter_port_list_trailing_comma *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_expr_or_assignment_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expr_mintypmax_generalized *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_item_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expr_mintypmax_trans_set *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expr_mintypmax *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Block_identifier_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_spec_disable_iff_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_parameter_port_list_item_last *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Event_control_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Case_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Edge_descriptor_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Conditional_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Scope_prefix *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Identifier_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_id *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Non_port_module_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Type_or_id_root *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_type_base *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Const_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Qualified_id *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Case_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Preprocessor_directive *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_variable_identifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_common_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tf_port_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Value_range *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Loop_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Structure_or_array_pattern_expression *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Net_variable_or_decl_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Genvar_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Reference *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Net_variable *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Case_items *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Par_block *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Instantiation_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dist_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expression_or_dist *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Clocking_item_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_override *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Local_root *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_item_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_import_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Implicit_class_handle *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Blocking_assignment *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Non_anonymous_instantiation_base *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Gate_instantiation *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Net_variable_or_decl_assigns *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Function_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_binbase *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_edge_descriptor *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Net_decl_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(For_step *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expr_primary_no_groups *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_bindigits *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Trailing_decl_assignment_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Trailing_decl_assignment *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Wait_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Streaming_concatenation *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Constant_dec_number *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Statement_or_null_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_import_item_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Function_item_data_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Generate_region *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Based_number *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Member_name *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(For_step_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Net_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Procedural_assertion_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_item_qualifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Select_variable_dimension *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Boolean_abbrev_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_or_generate_item_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_repetition_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Generate_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Procedural_continuous_assignment *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Generate_block *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_block *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_unbasednumber *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Spec_reference_event *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Charge_strength_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Non_anonymous_gate_instance_or_register_variable_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Builtin_array_method *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay_value_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Hierarchy_extension *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_edge_path_decl *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Generate_item_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Event_trigger *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Instantiation_base *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_port_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expr_primary *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_simple_path_decl *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Final_or_zero *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Gate_instance_or_register_variable *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Disable_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Spec_notifier_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(System_tf_call *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_item_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Property_qualifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_port_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay3_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_octdigits *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_path_identifiers *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(String_literal *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_identifiers *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Port_named *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Reference_or_call_base *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Jump_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_expr_primary *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Task_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_delay_repetition_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Generate_item_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Spec_polarity *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_block *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Stream_operator *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_realtime *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_octbase *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Block_item_or_statement_or_null_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_item_directive *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_simple_path *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Slice_size_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_port_list_item_last *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_port_list_trailing_comma *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(For_initialization_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_item_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Cast *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Function_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_delay_range_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_declaration_or_module_instantiation *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(For_init_decl_or_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specify_terminal_descriptor *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Spec_notifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Stream_expression *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Block_item_decl *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Stream_expression_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_port_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_throughout_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Net_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Any_port *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay_value_simple *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Class_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay_identifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Sequence_within_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(For_initialization *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Number *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_or_generate_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay1 *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dpi_import_export *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(List_of_ports_or_port_declarations_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Lpvalue *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(With_exprs_suffix *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_hexbase *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Specparam_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Enum_name *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_hexdigits *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Matches_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Label_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Genericidentifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Begin *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Lifetime *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_rs_eq *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Genvar_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Dec_based_number *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Signed_unsigned_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Random_qualifier_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Clocking_declaration *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_rss_eq *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Logand_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Bin_based_number *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Symbol_or_label *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Cond_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Symbolidentifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Range_list_in_braces *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameter_value_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Assignment_statement_no_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Logor_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Oct_based_number *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_type_primitive_scalar *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Escapedidentifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Initial_construct *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Signing *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Equiv_impl_expr *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Always_construct *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_decbase *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_reg_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Keywordidentifier *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Assignment_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_initial_expr_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Continuous_assign *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Struct_union_member *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Decl_dimensions_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Udp_input_declaration_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Assign_modify_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Integer_atom_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Loop_generate_construct *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_package_import_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Package_import_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expression *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_decdigits *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Non_integer_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Pos_neg_number *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Struct_union_member_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Statement_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Conditional_generate_construct *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Enum_name_list_item_last *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Decl_variable_dimension *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Case_any *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Enum_data_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Procedural_timing_control_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_parameter_port_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Structure_or_array_pattern_expression_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Assertion_item *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Simple_immediate_assertion_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_tagged_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Enum_name_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Block_item_or_statement_or_null *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expression_list_proper *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Tk_xzdigits *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_type_or_implicit *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Action_block *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Final_construct *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Subroutine_call *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_port_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Struct_data_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Enum_name_list_trailing_comma *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Structure_or_array_pattern_key *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay3 *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Module_parameter_port_list *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Seq_block *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Unqualified_id *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Assignment_pattern *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Data_type_primitive *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Delay3_or_drive_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Parameters *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Nonblocking_assignment *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Immediate_assertion_statement *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Integer_vector_type *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Expression_or_null_list_opt *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

void CodeGenVisitor::visit(Terminal *node)
{
	for(std::shared_ptr<Node> child: node->getChildren()){
child->accept(*this);
}
}

