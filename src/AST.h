#ifndef CHIMERA_AST_H
#define CHIMERA_AST_H
#include <functional>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

class Visitor;

class Node {
public:
  virtual void accept(Visitor &visitor) = 0;

  const std::vector<std::unique_ptr<Node>> &getChildren();
  void insertChildToBegin(std::unique_ptr<Node>);
  void insertChildToEnd(std::unique_ptr<Node>);
  void insertChild(std::unique_ptr<Node>,
                   std::vector<std::unique_ptr<Node>>::const_iterator);

  void clearChildren();

  void setChildren(std::vector<std::unique_ptr<Node>> &&children);

  Node *getParent();

  void setParent(Node *parent);

  std::string getElement();

  void setElement(std::string element);

private:
  std::vector<std::unique_ptr<Node>> children;

  Node *parent;

  std::string element;
};
class Terminal : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Terminal(std::string element);

private:
};
class Source_text : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Source_text(std::string element);

private:
};
class Description_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Description_list(std::string element);

private:
};
class Description : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Description(std::string element);

private:
};
class Module_or_interface_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_or_interface_declaration(std::string element);

private:
};
class Package_item_no_pp : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_item_no_pp(std::string element);

private:
};
class Preprocessor_action : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Preprocessor_action(std::string element);

private:
};
class Udp_primitive : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_primitive(std::string element);

private:
};
class Package_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_declaration(std::string element);

private:
};
class Module_start : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_start(std::string element);

private:
};
class Lifetime_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Lifetime_opt(std::string element);

private:
};
class Symbol_or_label : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Symbol_or_label(std::string element);

private:
};
class Module_package_import_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_package_import_list_opt(std::string element);

private:
};
class Module_parameter_port_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_parameter_port_list_opt(std::string element);

private:
};
class Module_port_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_port_list_opt(std::string element);

private:
};
class Module_attribute_foreign_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_attribute_foreign_opt(std::string element);

private:
};
class Module_item_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_item_list_opt(std::string element);

private:
};
class Module_end : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_end(std::string element);

private:
};
class Label_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Label_opt(std::string element);

private:
};
class Module_item_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_item_list(std::string element);

private:
};
class Module_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_item(std::string element);

private:
};
class Non_port_module_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Non_port_module_item(std::string element);

private:
};
class Module_port_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_port_declaration(std::string element);

private:
};
class Module_block : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_block(std::string element);

private:
};
class Module_item_directive : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_item_directive(std::string element);

private:
};
class Module_or_generate_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_or_generate_item(std::string element);

private:
};
class Generate_region : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Generate_region(std::string element);

private:
};
class Specify_block : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_block(std::string element);

private:
};
class Timeunits_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Timeunits_declaration(std::string element);

private:
};
class Module_common_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_common_item(std::string element);

private:
};
class Data_declaration_or_module_instantiation : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_declaration_or_module_instantiation(std::string element);

private:
};
class Any_param_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_param_declaration(std::string element);

private:
};
class Parameter_override : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_override(std::string element);

private:
};
class Gate_instantiation : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Gate_instantiation(std::string element);

private:
};
class Type_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Type_declaration(std::string element);

private:
};
class Package_import_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_import_declaration(std::string element);

private:
};
class Always_construct : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Always_construct(std::string element);

private:
};
class Initial_construct : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Initial_construct(std::string element);

private:
};
class Module_or_generate_item_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_or_generate_item_declaration(std::string element);

private:
};
class Continuous_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Continuous_assign(std::string element);

private:
};
class Loop_generate_construct : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Loop_generate_construct(std::string element);

private:
};
class Conditional_generate_construct : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Conditional_generate_construct(std::string element);

private:
};
class Assertion_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Assertion_item(std::string element);

private:
};
class Final_construct : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Final_construct(std::string element);

private:
};
class Always_any : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Always_any(std::string element);

private:
};
class Statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Statement(std::string element);

private:
};
class Statement_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Statement_item(std::string element);

private:
};
class Reference_or_call : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Reference_or_call(std::string element);

private:
};
class Unqualified_id : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Unqualified_id(std::string element);

private:
};
class Procedural_timing_control_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Procedural_timing_control_statement(std::string element);

private:
};
class Assignment_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Assignment_statement(std::string element);

private:
};
class Seq_block : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Seq_block(std::string element);

private:
};
class Subroutine_call : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Subroutine_call(std::string element);

private:
};
class Conditional_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Conditional_statement(std::string element);

private:
};
class Nonblocking_assignment : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Nonblocking_assignment(std::string element);

private:
};
class Case_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Case_statement(std::string element);

private:
};
class Loop_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Loop_statement(std::string element);

private:
};
class Par_block : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Par_block(std::string element);

private:
};
class Blocking_assignment : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Blocking_assignment(std::string element);

private:
};
class Wait_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Wait_statement(std::string element);

private:
};
class Procedural_assertion_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Procedural_assertion_statement(std::string element);

private:
};
class Procedural_continuous_assignment : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Procedural_continuous_assignment(std::string element);

private:
};
class Event_trigger : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Event_trigger(std::string element);

private:
};
class Disable_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Disable_statement(std::string element);

private:
};
class Jump_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Jump_statement(std::string element);

private:
};
class Macrogenericitem : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Macrogenericitem(std::string element);

private:
};
class Delay1 : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay1(std::string element);

private:
};
class Statement_or_null : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Statement_or_null(std::string element);

private:
};
class Event_control : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Event_control(std::string element);

private:
};
class Cycle_delay : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Cycle_delay(std::string element);

private:
};
class Assignment_statement_no_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Assignment_statement_no_expr(std::string element);

private:
};
class Inc_or_dec_expression : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Inc_or_dec_expression(std::string element);

private:
};
class Lpvalue : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Lpvalue(std::string element);

private:
};
class Expression : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expression(std::string element);

private:
};
class Assign_modify_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Assign_modify_statement(std::string element);

private:
};
class Equiv_impl_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Equiv_impl_expr(std::string element);

private:
};
class Cond_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Cond_expr(std::string element);

private:
};
class Logor_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Logor_expr(std::string element);

private:
};
class Logand_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Logand_expr(std::string element);

private:
};
class Matches_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Matches_expr(std::string element);

private:
};
class Bitor_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Bitor_expr(std::string element);

private:
};
class With_exprs_suffix : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  With_exprs_suffix(std::string element);

private:
};
class Xor_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Xor_expr(std::string element);

private:
};
class Bitand_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Bitand_expr(std::string element);

private:
};
class Caseeq_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Caseeq_expr(std::string element);

private:
};
class Logeq_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Logeq_expr(std::string element);

private:
};
class Comp_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Comp_expr(std::string element);

private:
};
class Shift_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Shift_expr(std::string element);

private:
};
class Open_range_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Open_range_list(std::string element);

private:
};
class Add_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Add_expr(std::string element);

private:
};
class Mul_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Mul_expr(std::string element);

private:
};
class Pow_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Pow_expr(std::string element);

private:
};
class Unary_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Unary_expr(std::string element);

private:
};
class Unary_prefix_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Unary_prefix_expr(std::string element);

private:
};
class Unary_op : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Unary_op(std::string element);

private:
};
class Inc_or_dec_or_primary_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Inc_or_dec_or_primary_expr(std::string element);

private:
};
class Postfix_expression : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Postfix_expression(std::string element);

private:
};
class Expr_primary : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expr_primary(std::string element);

private:
};
class Reference : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Reference(std::string element);

private:
};
class Reference_or_call_base : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Reference_or_call_base(std::string element);

private:
};
class Builtin_array_method : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Builtin_array_method(std::string element);

private:
};
class Local_root : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Local_root(std::string element);

private:
};
class Select_variable_dimension : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Select_variable_dimension(std::string element);

private:
};
class Hierarchy_extension : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Hierarchy_extension(std::string element);

private:
};
class Type_or_id_root : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Type_or_id_root(std::string element);

private:
};
class Class_id : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_id(std::string element);

private:
};
class Implicit_class_handle : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Implicit_class_handle(std::string element);

private:
};
class Qualified_id : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Qualified_id(std::string element);

private:
};
class Genericidentifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Genericidentifier(std::string element);

private:
};
class Parameter_value_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_value_opt(std::string element);

private:
};
class Parameters : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameters(std::string element);

private:
};
class Symbolidentifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Symbolidentifier(std::string element);

private:
};
class Macroidentifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Macroidentifier(std::string element);

private:
};
class Escapedidentifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Escapedidentifier(std::string element);

private:
};
class Keywordidentifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Keywordidentifier(std::string element);

private:
};
class Range_list_in_braces : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Range_list_in_braces(std::string element);

private:
};
class Delay_value_simple : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay_value_simple(std::string element);

private:
};
class Delay_value : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay_value(std::string element);

private:
};
class Tk_decnumber : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_decnumber(std::string element);

private:
};
class Tk_realtime : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_realtime(std::string element);

private:
};
class Delay_identifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay_identifier(std::string element);

private:
};
class Tk_timeliteral : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_timeliteral(std::string element);

private:
};
class Begin : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Begin(std::string element);

private:
};
class Block_item_or_statement_or_null_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Block_item_or_statement_or_null_list_opt(std::string element);

private:
};
class End : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  End(std::string element);

private:
};
class Block_item_or_statement_or_null_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Block_item_or_statement_or_null_list(std::string element);

private:
};
class Block_item_or_statement_or_null : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Block_item_or_statement_or_null(std::string element);

private:
};
class Block_item_decl : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Block_item_decl(std::string element);

private:
};
class System_tf_call : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  System_tf_call(std::string element);

private:
};
class Systemtfidentifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Systemtfidentifier(std::string element);

private:
};
class Call_base : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Call_base(std::string element);

private:
};
class Expr_primary_no_groups : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expr_primary_no_groups(std::string element);

private:
};
class Expr_primary_parens : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expr_primary_parens(std::string element);

private:
};
class Expr_primary_braces : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expr_primary_braces(std::string element);

private:
};
class Assignment_pattern_expression : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Assignment_pattern_expression(std::string element);

private:
};
class Number : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Number(std::string element);

private:
};
class String_literal : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  String_literal(std::string element);

private:
};
class Cast : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Cast(std::string element);

private:
};
class Constant_dec_number : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Constant_dec_number(std::string element);

private:
};
class Based_number : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Based_number(std::string element);

private:
};
class Tk_unbasednumber : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_unbasednumber(std::string element);

private:
};
class Instantiation_base : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Instantiation_base(std::string element);

private:
};
class Lifetime : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Lifetime(std::string element);

private:
};
class Const_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Const_opt(std::string element);

private:
};
class Instantiation_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Instantiation_type(std::string element);

private:
};
class Non_anonymous_gate_instance_or_register_variable_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Non_anonymous_gate_instance_or_register_variable_list(std::string element);

private:
};
class Non_anonymous_gate_instance_or_register_variable : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Non_anonymous_gate_instance_or_register_variable(std::string element);

private:
};
class Gate_instance_or_register_variable : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Gate_instance_or_register_variable(std::string element);

private:
};
class Decl_dimensions_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Decl_dimensions_opt(std::string element);

private:
};
class Any_port_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_port_list_opt(std::string element);

private:
};
class Trailing_decl_assignment_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Trailing_decl_assignment_opt(std::string element);

private:
};
class Any_port_list_named : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_port_list_named(std::string element);

private:
};
class Any_port_list_item_last_named : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_port_list_item_last_named(std::string element);

private:
};
class Any_port_list_trailing_comma_named : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_port_list_trailing_comma_named(std::string element);

private:
};
class Any_port_list_positional : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_port_list_positional(std::string element);

private:
};
class Any_port_list_item_last_positional : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_port_list_item_last_positional(std::string element);

private:
};
class Any_port_list_trailing_comma_positional : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_port_list_trailing_comma_positional(std::string element);

private:
};
class Port_named : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_named(std::string element);

private:
};
class Member_name : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Member_name(std::string element);

private:
};
class Decl_dimensions : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Decl_dimensions(std::string element);

private:
};
class Data_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_type(std::string element);

private:
};
class Data_type_base : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_type_base(std::string element);

private:
};
class Package_or_generate_item_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_or_generate_item_declaration(std::string element);

private:
};
class Genvar_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Genvar_declaration(std::string element);

private:
};
class Clocking_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Clocking_declaration(std::string element);

private:
};
class Net_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Net_declaration(std::string element);

private:
};
class Task_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Task_declaration(std::string element);

private:
};
class Function_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Function_declaration(std::string element);

private:
};
class Class_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_declaration(std::string element);

private:
};
class Dpi_import_export : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dpi_import_export(std::string element);

private:
};
class Specparam_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specparam_declaration(std::string element);

private:
};
class Net_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Net_type(std::string element);

private:
};
class Data_type_or_implicit : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_type_or_implicit(std::string element);

private:
};
class Net_variable_or_decl_assigns : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Net_variable_or_decl_assigns(std::string element);

private:
};
class Delay3 : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay3(std::string element);

private:
};
class Charge_strength_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Charge_strength_opt(std::string element);

private:
};
class Delay3_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay3_opt(std::string element);

private:
};
class List_of_identifiers : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_identifiers(std::string element);

private:
};
class Net_variable_or_decl_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Net_variable_or_decl_assign(std::string element);

private:
};
class Net_variable : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Net_variable(std::string element);

private:
};
class Net_decl_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Net_decl_assign(std::string element);

private:
};
class Delay3_or_drive_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay3_or_drive_opt(std::string element);

private:
};
class Signing : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Signing(std::string element);

private:
};
class Decl_variable_dimension : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Decl_variable_dimension(std::string element);

private:
};
class Expression_or_null_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expression_or_null_list_opt(std::string element);

private:
};
class Data_type_primitive : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_type_primitive(std::string element);

private:
};
class Trailing_decl_assignment : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Trailing_decl_assignment(std::string element);

private:
};
class Data_type_primitive_scalar : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_type_primitive_scalar(std::string element);

private:
};
class Integer_vector_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Integer_vector_type(std::string element);

private:
};
class Signed_unsigned_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Signed_unsigned_opt(std::string element);

private:
};
class Integer_atom_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Integer_atom_type(std::string element);

private:
};
class Enum_data_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Enum_data_type(std::string element);

private:
};
class Non_integer_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Non_integer_type(std::string element);

private:
};
class Struct_data_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Struct_data_type(std::string element);

private:
};
class List_of_ports_or_port_declarations_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_ports_or_port_declarations_opt(std::string element);

private:
};
class Module_parameter_port_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_parameter_port_list(std::string element);

private:
};
class Package_import_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_import_list(std::string element);

private:
};
class Timescale_directive : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Timescale_directive(std::string element);

private:
};
class Misc_directive : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Misc_directive(std::string element);

private:
};
class Data_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_declaration(std::string element);

private:
};
class Time_literal : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Time_literal(std::string element);

private:
};
class Expression_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expression_opt(std::string element);

private:
};
class Port_direction : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_direction(std::string element);

private:
};
class List_of_identifiers_unpacked_dimensions : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_identifiers_unpacked_dimensions(std::string element);

private:
};
class List_of_module_item_identifiers : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_module_item_identifiers(std::string element);

private:
};
class Dir : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dir(std::string element);

private:
};
class Var_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Var_type(std::string element);

private:
};
class List_of_port_identifiers : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_port_identifiers(std::string element);

private:
};
class Port_net_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_net_type(std::string element);

private:
};
class Identifier_optional_unpacked_dimensions : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Identifier_optional_unpacked_dimensions(std::string element);

private:
};
class List_of_ports_or_port_declarations_ansi : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_ports_or_port_declarations_ansi(std::string element);

private:
};
class List_of_ports_or_port_declarations_non_ansi : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_ports_or_port_declarations_non_ansi(std::string element);

private:
};
class List_of_ports_or_port_declarations_item_last_ansi : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_ports_or_port_declarations_item_last_ansi(std::string element);

private:
};
class List_of_ports_or_port_declarations_item_last_non_ansi : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_ports_or_port_declarations_item_last_non_ansi(std::string element);

private:
};
class List_of_ports_or_port_declarations_trailing_comma_ansi : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_ports_or_port_declarations_trailing_comma_ansi(std::string element);

private:
};
class List_of_ports_or_port_declarations_trailing_comma_non_ansi : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_ports_or_port_declarations_trailing_comma_non_ansi(
      std::string element);

private:
};
class Port : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port(std::string element);

private:
};
class Port_declaration_ansi : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_declaration_ansi(std::string element);

private:
};
class Port_declaration_non_ansi : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_declaration_non_ansi(std::string element);

private:
};
class Port_expression : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_expression(std::string element);

private:
};
class Trailing_assign_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Trailing_assign_opt(std::string element);

private:
};
class Port_expression_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_expression_opt(std::string element);

private:
};
class Trailing_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Trailing_assign(std::string element);

private:
};
class Port_reference : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_reference(std::string element);

private:
};
class Port_reference_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Port_reference_list(std::string element);

private:
};
class Unique_priority_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Unique_priority_opt(std::string element);

private:
};
class Expression_in_parens : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expression_in_parens(std::string element);

private:
};
class Delay_or_event_control_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay_or_event_control_opt(std::string element);

private:
};
class Delay_or_event_control : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay_or_event_control(std::string element);

private:
};
class Event_expression_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Event_expression_list(std::string element);

private:
};
class Hierarchy_event_identifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Hierarchy_event_identifier(std::string element);

private:
};
class Event_expression : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Event_expression(std::string element);

private:
};
class Edge_operator : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Edge_operator(std::string element);

private:
};
class Drive_strength_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Drive_strength_opt(std::string element);

private:
};
class Cont_assign_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Cont_assign_list(std::string element);

private:
};
class Cont_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Cont_assign(std::string element);

private:
};
class Drive_strength : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Drive_strength(std::string element);

private:
};
class Expr_mintypmax : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expr_mintypmax(std::string element);

private:
};
class Expr_mintypmax_trans_set : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expr_mintypmax_trans_set(std::string element);

private:
};
class Expr_mintypmax_generalized : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expr_mintypmax_generalized(std::string element);

private:
};
class Property_expr_or_assignment_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_expr_or_assignment_list(std::string element);

private:
};
class Property_expr_or_assignment : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_expr_or_assignment(std::string element);

private:
};
class Property_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_expr(std::string element);

private:
};
class Sequence_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_expr(std::string element);

private:
};
class Property_implication_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_implication_expr(std::string element);

private:
};
class Property_prefix_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_prefix_expr(std::string element);

private:
};
class Property_if_else_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_if_else_expr(std::string element);

private:
};
class Simple_sequence_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Simple_sequence_expr(std::string element);

private:
};
class Sequence_or_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_or_expr(std::string element);

private:
};
class Sequence_and_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_and_expr(std::string element);

private:
};
class Sequence_unary_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_unary_expr(std::string element);

private:
};
class Sequence_intersect_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_intersect_expr(std::string element);

private:
};
class Sequence_within_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_within_expr(std::string element);

private:
};
class Sequence_throughout_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_throughout_expr(std::string element);

private:
};
class Sequence_delay_range_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_delay_range_expr(std::string element);

private:
};
class Sequence_delay_repetition_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_delay_repetition_list(std::string element);

private:
};
class Sequence_expr_primary : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_expr_primary(std::string element);

private:
};
class Sequence_repetition_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Sequence_repetition_expr(std::string element);

private:
};
class Expression_or_dist : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expression_or_dist(std::string element);

private:
};
class Boolean_abbrev_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Boolean_abbrev_opt(std::string element);

private:
};
class Dist_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dist_opt(std::string element);

private:
};
class Value_range : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Value_range(std::string element);

private:
};
class Expression_list_proper : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Expression_list_proper(std::string element);

private:
};
class Streaming_concatenation : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Streaming_concatenation(std::string element);

private:
};
class Bin_based_number : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Bin_based_number(std::string element);

private:
};
class Dec_based_number : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dec_based_number(std::string element);

private:
};
class Hex_based_number : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Hex_based_number(std::string element);

private:
};
class Oct_based_number : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Oct_based_number(std::string element);

private:
};
class Tk_binbase : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_binbase(std::string element);

private:
};
class Tk_bindigits : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_bindigits(std::string element);

private:
};
class Macronumericwidth : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Macronumericwidth(std::string element);

private:
};
class Tk_decbase : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_decbase(std::string element);

private:
};
class Tk_decdigits : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_decdigits(std::string element);

private:
};
class Tk_xzdigits : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_xzdigits(std::string element);

private:
};
class Case_any : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Case_any(std::string element);

private:
};
class Case_items : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Case_items(std::string element);

private:
};
class Case_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Case_item(std::string element);

private:
};
class Preprocessor_directive : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Preprocessor_directive(std::string element);

private:
};
class Param_type_followed_by_id_and_dimensions_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Param_type_followed_by_id_and_dimensions_opt(std::string element);

private:
};
class Parameter_assign_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_assign_list(std::string element);

private:
};
class Localparam_assign_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Localparam_assign_list(std::string element);

private:
};
class Type_assignment_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Type_assignment_list(std::string element);

private:
};
class Parameter_expr : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_expr(std::string element);

private:
};
class Parameter_value_ranges_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_value_ranges_opt(std::string element);

private:
};
class Bit_logic_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Bit_logic_opt(std::string element);

private:
};
class Bit_logic : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Bit_logic(std::string element);

private:
};
class Parameter_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_assign(std::string element);

private:
};
class Tk_hexbase : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_hexbase(std::string element);

private:
};
class Tk_hexdigits : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_hexdigits(std::string element);

private:
};
class Generate_item_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Generate_item_list_opt(std::string element);

private:
};
class Generate_item_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Generate_item_list(std::string element);

private:
};
class Generate_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Generate_item(std::string element);

private:
};
class Generate_block : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Generate_block(std::string element);

private:
};
class Genvar_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Genvar_opt(std::string element);

private:
};
class For_step_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  For_step_opt(std::string element);

private:
};
class For_step : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  For_step(std::string element);

private:
};
class For_initialization_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  For_initialization_opt(std::string element);

private:
};
class Repeat_control : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Repeat_control(std::string element);

private:
};
class For_initialization : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  For_initialization(std::string element);

private:
};
class For_init_decl_or_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  For_init_decl_or_assign(std::string element);

private:
};
class Parameter_expr_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_expr_list(std::string element);

private:
};
class Parameter_value_byname_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_value_byname_list(std::string element);

private:
};
class Preprocess_include_argument : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Preprocess_include_argument(std::string element);

private:
};
class Pp_identifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Pp_identifier(std::string element);

private:
};
class Macro_formals_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Macro_formals_list_opt(std::string element);

private:
};
class Tk_stringliteral : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_stringliteral(std::string element);

private:
};
class Parameter_value_byname_list_item_last : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_value_byname_list_item_last(std::string element);

private:
};
class Parameter_value_byname_list_trailing_comma : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_value_byname_list_trailing_comma(std::string element);

private:
};
class Parameter_value_byname : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_value_byname(std::string element);

private:
};
class Module_parameter_port_list_item_last : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_parameter_port_list_item_last(std::string element);

private:
};
class Module_parameter_port_list_preprocessor_last : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_parameter_port_list_preprocessor_last(std::string element);

private:
};
class Module_parameter_port_list_trailing_comma : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_parameter_port_list_trailing_comma(std::string element);

private:
};
class Module_parameter_port : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Module_parameter_port(std::string element);

private:
};
class Parameter_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Parameter_opt(std::string element);

private:
};
class Type_assignment : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Type_assignment(std::string element);

private:
};
class Generate_if : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Generate_if(std::string element);

private:
};
class Generate_case_items : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Generate_case_items(std::string element);

private:
};
class Class_new : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_new(std::string element);

private:
};
class Dynamic_array_new : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dynamic_array_new(std::string element);

private:
};
class Var_or_net_type_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Var_or_net_type_opt(std::string element);

private:
};
class Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt
    : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt(
      std::string element);

private:
};
class Type_identifier_followed_by_id : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Type_identifier_followed_by_id(std::string element);

private:
};
class Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
    : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt(
      std::string element);

private:
};
class Defparam_assign_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Defparam_assign_list(std::string element);

private:
};
class Defparam_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Defparam_assign(std::string element);

private:
};
class Localparam_assign : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Localparam_assign(std::string element);

private:
};
class Argument_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Argument_list_opt(std::string element);

private:
};
class Any_argument_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_argument_list(std::string element);

private:
};
class Any_argument_list_item_last : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_argument_list_item_last(std::string element);

private:
};
class Any_argument_list_trailing_comma : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_argument_list_trailing_comma(std::string element);

private:
};
class Any_argument : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Any_argument(std::string element);

private:
};
class Task_declaration_id : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Task_declaration_id(std::string element);

private:
};
class Tf_port_list_paren_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_list_paren_opt(std::string element);

private:
};
class Tf_item_or_statement_or_null_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_item_or_statement_or_null_list_opt(std::string element);

private:
};
class Tf_item_or_statement_or_null_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_item_or_statement_or_null_list(std::string element);

private:
};
class Tf_item_or_statement_or_null : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_item_or_statement_or_null(std::string element);

private:
};
class Task_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Task_item(std::string element);

private:
};
class Tf_port_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_list_opt(std::string element);

private:
};
class Scope_or_if_res : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Scope_or_if_res(std::string element);

private:
};
class Array_reduction_method : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Array_reduction_method(std::string element);

private:
};
class Array_locator_method : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Array_locator_method(std::string element);

private:
};
class Gatetype : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Gatetype(std::string element);

private:
};
class Primitive_gate_instance_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Primitive_gate_instance_list(std::string element);

private:
};
class Switchtype : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Switchtype(std::string element);

private:
};
class Dr_strength1 : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dr_strength1(std::string element);

private:
};
class Dr_strength0 : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dr_strength0(std::string element);

private:
};
class Primitive_gate_instance : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Primitive_gate_instance(std::string element);

private:
};
class Delay_scope : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay_scope(std::string element);

private:
};
class Join_keyword : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Join_keyword(std::string element);

private:
};
class Function_return_type_and_id : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Function_return_type_and_id(std::string element);

private:
};
class Endfunction_label_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Endfunction_label_opt(std::string element);

private:
};
class Function_item_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Function_item_list(std::string element);

private:
};
class Statement_or_null_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Statement_or_null_list_opt(std::string element);

private:
};
class Tf_port_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_list(std::string element);

private:
};
class Tf_port_list_item_last : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_list_item_last(std::string element);

private:
};
class Tf_port_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_item(std::string element);

private:
};
class Tf_port_list_trailing_comma : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_list_trailing_comma(std::string element);

private:
};
class Tf_port_direction_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_direction_opt(std::string element);

private:
};
class Tf_port_item_expr_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_item_expr_opt(std::string element);

private:
};
class Tf_port_direction : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_direction(std::string element);

private:
};
class Generate_case_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Generate_case_item(std::string element);

private:
};
class Net_type_or_none : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Net_type_or_none(std::string element);

private:
};
class Pull01 : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Pull01(std::string element);

private:
};
class Statement_or_null_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Statement_or_null_list(std::string element);

private:
};
class Function_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Function_item(std::string element);

private:
};
class Function_item_data_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Function_item_data_declaration(std::string element);

private:
};
class Tf_port_declaration : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_port_declaration(std::string element);

private:
};
class Non_anonymous_instantiation_base : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Non_anonymous_instantiation_base(std::string element);

private:
};
class List_of_tf_variable_identifiers : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_tf_variable_identifiers(std::string element);

private:
};
class Tf_variable_identifier_first : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_variable_identifier_first(std::string element);

private:
};
class Tf_variable_identifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tf_variable_identifier(std::string element);

private:
};
class Tk_octbase : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_octbase(std::string element);

private:
};
class Tk_octdigits : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_octdigits(std::string element);

private:
};
class Specify_item_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_item_list_opt(std::string element);

private:
};
class Specify_item_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_item_list(std::string element);

private:
};
class Specify_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_item(std::string element);

private:
};
class Specify_simple_path_decl : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_simple_path_decl(std::string element);

private:
};
class Spec_reference_event : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Spec_reference_event(std::string element);

private:
};
class Spec_notifier_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Spec_notifier_opt(std::string element);

private:
};
class Specify_edge_path_decl : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_edge_path_decl(std::string element);

private:
};
class Specparam_decl : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specparam_decl(std::string element);

private:
};
class Specify_simple_path : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_simple_path(std::string element);

private:
};
class Delay_value_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Delay_value_list(std::string element);

private:
};
class Specify_path_identifiers : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_path_identifiers(std::string element);

private:
};
class Spec_polarity : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Spec_polarity(std::string element);

private:
};
class Spec_notifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Spec_notifier(std::string element);

private:
};
class Specify_terminal_descriptor : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_terminal_descriptor(std::string element);

private:
};
class Edge_descriptor_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Edge_descriptor_list(std::string element);

private:
};
class Casting_type : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Casting_type(std::string element);

private:
};
class Udp_port_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_port_list(std::string element);

private:
};
class Udp_port_decls : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_port_decls(std::string element);

private:
};
class Udp_init_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_init_opt(std::string element);

private:
};
class Udp_body : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_body(std::string element);

private:
};
class Tk_reg_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_reg_opt(std::string element);

private:
};
class Udp_initial_expr_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_initial_expr_opt(std::string element);

private:
};
class Udp_input_declaration_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_input_declaration_list(std::string element);

private:
};
class Udp_entry_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_entry_list(std::string element);

private:
};
class Udp_sequ_entry_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_sequ_entry_list(std::string element);

private:
};
class Udp_comb_entry_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_comb_entry_list(std::string element);

private:
};
class Udp_sequ_entry : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_sequ_entry(std::string element);

private:
};
class Udp_input_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_input_list(std::string element);

private:
};
class Udp_input_sym : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_input_sym(std::string element);

private:
};
class Udp_output_sym : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_output_sym(std::string element);

private:
};
class Udp_initial : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_initial(std::string element);

private:
};
class Udp_port_decl : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_port_decl(std::string element);

private:
};
class Specify_edge_path : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specify_edge_path(std::string element);

private:
};
class Polarity_operator : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Polarity_operator(std::string element);

private:
};
class Immediate_assertion_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Immediate_assertion_statement(std::string element);

private:
};
class Simple_immediate_assertion_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Simple_immediate_assertion_statement(std::string element);

private:
};
class Deferred_immediate_assertion_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Deferred_immediate_assertion_statement(std::string element);

private:
};
class Action_block : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Action_block(std::string element);

private:
};
class Enum_name_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Enum_name_list(std::string element);

private:
};
class Enum_name_list_item_last : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Enum_name_list_item_last(std::string element);

private:
};
class Enum_name_list_trailing_comma : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Enum_name_list_trailing_comma(std::string element);

private:
};
class Enum_name : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Enum_name(std::string element);

private:
};
class Pos_neg_number : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Pos_neg_number(std::string element);

private:
};
class Macroiditem : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Macroiditem(std::string element);

private:
};
class Data_declaration_modifiers_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_declaration_modifiers_opt(std::string element);

private:
};
class Data_declaration_base : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_declaration_base(std::string element);

private:
};
class Var_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Var_opt(std::string element);

private:
};
class Specparam_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specparam_list(std::string element);

private:
};
class Specparam : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Specparam(std::string element);

private:
};
class Concurrent_assertion_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Concurrent_assertion_item(std::string element);

private:
};
class Block_identifier_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Block_identifier_opt(std::string element);

private:
};
class Concurrent_assertion_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Concurrent_assertion_statement(std::string element);

private:
};
class Assert_property_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Assert_property_statement(std::string element);

private:
};
class Assume_property_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Assume_property_statement(std::string element);

private:
};
class Cover_property_statement : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Cover_property_statement(std::string element);

private:
};
class Property_spec : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_spec(std::string element);

private:
};
class Event_control_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Event_control_opt(std::string element);

private:
};
class Property_spec_disable_iff_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_spec_disable_iff_opt(std::string element);

private:
};
class Package_item_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_item_list_opt(std::string element);

private:
};
class Package_item_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_item_list(std::string element);

private:
};
class Package_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_item(std::string element);

private:
};
class Tk_virtual_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_virtual_opt(std::string element);

private:
};
class Class_declaration_extends_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_declaration_extends_opt(std::string element);

private:
};
class Implements_interface_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Implements_interface_list_opt(std::string element);

private:
};
class Class_items_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_items_opt(std::string element);

private:
};
class Class_items : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_items(std::string element);

private:
};
class Class_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_item(std::string element);

private:
};
class Method_qualifier_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Method_qualifier_list_opt(std::string element);

private:
};
class Method_prototype : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Method_prototype(std::string element);

private:
};
class Class_constructor : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_constructor(std::string element);

private:
};
class List_of_variable_decl_assignments : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  List_of_variable_decl_assignments(std::string element);

private:
};
class Class_item_qualifier_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_item_qualifier_list_opt(std::string element);

private:
};
class Method_property_qualifier_list_not_starting_with_virtual : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Method_property_qualifier_list_not_starting_with_virtual(std::string element);

private:
};
class Task_prototype : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Task_prototype(std::string element);

private:
};
class Function_prototype : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Function_prototype(std::string element);

private:
};
class Class_constructor_prototype : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_constructor_prototype(std::string element);

private:
};
class Endnew_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Endnew_opt(std::string element);

private:
};
class Variable_decl_assignment : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Variable_decl_assignment(std::string element);

private:
};
class Macro_formals_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Macro_formals_list(std::string element);

private:
};
class Macro_formal_parameter : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Macro_formal_parameter(std::string element);

private:
};
class Hierarchy_segment : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Hierarchy_segment(std::string element);

private:
};
class Select_dimensions_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Select_dimensions_opt(std::string element);

private:
};
class Dpi_import_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dpi_import_item(std::string element);

private:
};
class Dpi_spec_string : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dpi_spec_string(std::string element);

private:
};
class Dpi_import_property_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Dpi_import_property_opt(std::string element);

private:
};
class Udp_comb_entry : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Udp_comb_entry(std::string element);

private:
};
class Tk_ls_eq : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_ls_eq(std::string element);

private:
};
class Tk_rss_eq : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_rss_eq(std::string element);

private:
};
class Tk_rs_eq : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_rs_eq(std::string element);

private:
};
class Packed_signing_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Packed_signing_opt(std::string element);

private:
};
class Struct_union_member_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Struct_union_member_list(std::string element);

private:
};
class Tk_tagged_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_tagged_opt(std::string element);

private:
};
class Struct_union_member : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Struct_union_member(std::string element);

private:
};
class Random_qualifier_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Random_qualifier_opt(std::string element);

private:
};
class Data_type_or_implicit_followed_by_id_and_dimensions_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Data_type_or_implicit_followed_by_id_and_dimensions_opt(std::string element);

private:
};
class Type_identifier_or_implicit_followed_by_id_and_dimensions_opt
    : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Type_identifier_or_implicit_followed_by_id_and_dimensions_opt(
      std::string element);

private:
};
class Assignment_pattern : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Assignment_pattern(std::string element);

private:
};
class Structure_or_array_pattern_expression_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Structure_or_array_pattern_expression_list(std::string element);

private:
};
class Structure_or_array_pattern_expression : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Structure_or_array_pattern_expression(std::string element);

private:
};
class Structure_or_array_pattern_key : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Structure_or_array_pattern_key(std::string element);

private:
};
class Package_import_item_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_import_item_list(std::string element);

private:
};
class Package_import_item : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Package_import_item(std::string element);

private:
};
class Scope_prefix : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Scope_prefix(std::string element);

private:
};
class Tk_edge_descriptor : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Tk_edge_descriptor(std::string element);

private:
};
class Property_qualifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Property_qualifier(std::string element);

private:
};
class Class_item_qualifier : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Class_item_qualifier(std::string element);

private:
};
class Final_or_zero : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Final_or_zero(std::string element);

private:
};
class Stream_operator : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Stream_operator(std::string element);

private:
};
class Slice_size_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Slice_size_opt(std::string element);

private:
};
class Stream_expression_list : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Stream_expression_list(std::string element);

private:
};
class Stream_expression : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Stream_expression(std::string element);

private:
};
class Identifier_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Identifier_opt(std::string element);

private:
};
class Clocking_item_list_opt : public Node {
public:
  virtual void accept(Visitor &visitor) override;

  Clocking_item_list_opt(std::string element);

private:
};

using ClassMap =
    std::unordered_map<std::string,
                       std::function<std::unique_ptr<Node>(std::string &&)>>;
extern ClassMap classMap;

#endif
