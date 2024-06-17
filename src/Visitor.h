#ifndef VISITOR_H
#define VISITOR_H

class Node;
class Terminal;
class Source_text;
class Description_list;
class Description;
class Module_or_interface_declaration;
class Package_item_no_pp;
class Preprocessor_action;
class Udp_primitive;
class Package_declaration;
class Module_start;
class Lifetime_opt;
class Symbol_or_label;
class Module_package_import_list_opt;
class Module_parameter_port_list_opt;
class Module_port_list_opt;
class Module_attribute_foreign_opt;
class Module_item_list_opt;
class Module_end;
class Label_opt;
class Module_item_list;
class Module_item;
class Non_port_module_item;
class Module_port_declaration;
class Module_block;
class Module_item_directive;
class Module_or_generate_item;
class Generate_region;
class Specify_block;
class Timeunits_declaration;
class Module_common_item;
class Data_declaration_or_module_instantiation;
class Any_param_declaration;
class Parameter_override;
class Gate_instantiation;
class Type_declaration;
class Package_import_declaration;
class Always_construct;
class Initial_construct;
class Module_or_generate_item_declaration;
class Continuous_assign;
class Loop_generate_construct;
class Conditional_generate_construct;
class Assertion_item;
class Final_construct;
class Always_any;
class Statement;
class Statement_item;
class Reference_or_call;
class Unqualified_id;
class Procedural_timing_control_statement;
class Assignment_statement;
class Seq_block;
class Subroutine_call;
class Conditional_statement;
class Nonblocking_assignment;
class Case_statement;
class Loop_statement;
class Par_block;
class Blocking_assignment;
class Wait_statement;
class Procedural_assertion_statement;
class Procedural_continuous_assignment;
class Event_trigger;
class Disable_statement;
class Jump_statement;
class Macrogenericitem;
class Delay1;
class Statement_or_null;
class Event_control;
class Cycle_delay;
class Assignment_statement_no_expr;
class Inc_or_dec_expression;
class Lpvalue;
class Expression;
class Assign_modify_statement;
class Equiv_impl_expr;
class Cond_expr;
class Logor_expr;
class Logand_expr;
class Matches_expr;
class Bitor_expr;
class With_exprs_suffix;
class Xor_expr;
class Bitand_expr;
class Caseeq_expr;
class Logeq_expr;
class Comp_expr;
class Shift_expr;
class Open_range_list;
class Add_expr;
class Mul_expr;
class Pow_expr;
class Unary_expr;
class Unary_prefix_expr;
class Unary_op;
class Inc_or_dec_or_primary_expr;
class Postfix_expression;
class Expr_primary;
class Reference;
class Reference_or_call_base;
class Builtin_array_method;
class Local_root;
class Select_variable_dimension;
class Hierarchy_extension;
class Type_or_id_root;
class Class_id;
class Implicit_class_handle;
class Qualified_id;
class Genericidentifier;
class Parameter_value_opt;
class Parameters;
class Symbolidentifier;
class Macroidentifier;
class Escapedidentifier;
class Keywordidentifier;
class Range_list_in_braces;
class Delay_value_simple;
class Delay_value;
class Tk_decnumber;
class Tk_realtime;
class Delay_identifier;
class Tk_timeliteral;
class Begin;
class Block_item_or_statement_or_null_list_opt;
class End;
class Block_item_or_statement_or_null_list;
class Block_item_or_statement_or_null;
class Block_item_decl;
class System_tf_call;
class Systemtfidentifier;
class Call_base;
class Expr_primary_no_groups;
class Expr_primary_parens;
class Expr_primary_braces;
class Assignment_pattern_expression;
class Number;
class String_literal;
class Cast;
class Constant_dec_number;
class Based_number;
class Tk_unbasednumber;
class Instantiation_base;
class Lifetime;
class Const_opt;
class Instantiation_type;
class Non_anonymous_gate_instance_or_register_variable_list;
class Non_anonymous_gate_instance_or_register_variable;
class Gate_instance_or_register_variable;
class Decl_dimensions_opt;
class Any_port_list_opt;
class Trailing_decl_assignment_opt;
class Any_port_list_named;
class Any_port_list_item_last_named;
class Any_port_list_trailing_comma_named;
class Any_port_list_positional;
class Any_port_list_item_last_positional;
class Any_port_list_trailing_comma_positional;
class Port_named;
class Member_name;
class Decl_dimensions;
class Data_type;
class Data_type_base;
class Package_or_generate_item_declaration;
class Genvar_declaration;
class Clocking_declaration;
class Net_declaration;
class Task_declaration;
class Function_declaration;
class Class_declaration;
class Dpi_import_export;
class Specparam_declaration;
class Net_type;
class Data_type_or_implicit;
class Net_variable_or_decl_assigns;
class Delay3;
class Charge_strength_opt;
class Delay3_opt;
class List_of_identifiers;
class Net_variable_or_decl_assign;
class Net_variable;
class Net_decl_assign;
class Delay3_or_drive_opt;
class Signing;
class Decl_variable_dimension;
class Expression_or_null_list_opt;
class Data_type_primitive;
class Trailing_decl_assignment;
class Data_type_primitive_scalar;
class Integer_vector_type;
class Signed_unsigned_opt;
class Integer_atom_type;
class Enum_data_type;
class Non_integer_type;
class Struct_data_type;
class List_of_ports_or_port_declarations_opt;
class Module_parameter_port_list;
class Package_import_list;
class Timescale_directive;
class Misc_directive;
class Data_declaration;
class Time_literal;
class Expression_opt;
class Port_direction;
class List_of_identifiers_unpacked_dimensions;
class List_of_module_item_identifiers;
class Dir;
class Var_type;
class List_of_port_identifiers;
class Port_net_type;
class Identifier_optional_unpacked_dimensions;
class List_of_ports_or_port_declarations_ansi;
class List_of_ports_or_port_declarations_non_ansi;
class List_of_ports_or_port_declarations_item_last_ansi;
class List_of_ports_or_port_declarations_item_last_non_ansi;
class List_of_ports_or_port_declarations_trailing_comma_ansi;
class List_of_ports_or_port_declarations_trailing_comma_non_ansi;
class Port;
class Port_declaration_ansi;
class Port_declaration_non_ansi;
class Port_expression;
class Trailing_assign_opt;
class Port_expression_opt;
class Trailing_assign;
class Port_reference;
class Port_reference_list;
class Unique_priority_opt;
class Expression_in_parens;
class Delay_or_event_control_opt;
class Delay_or_event_control;
class Event_expression_list;
class Hierarchy_event_identifier;
class Event_expression;
class Edge_operator;
class Drive_strength_opt;
class Cont_assign_list;
class Cont_assign;
class Drive_strength;
class Expr_mintypmax;
class Expr_mintypmax_trans_set;
class Expr_mintypmax_generalized;
class Property_expr_or_assignment_list;
class Property_expr_or_assignment;
class Property_expr;
class Sequence_expr;
class Property_implication_expr;
class Property_prefix_expr;
class Property_if_else_expr;
class Simple_sequence_expr;
class Sequence_or_expr;
class Sequence_and_expr;
class Sequence_unary_expr;
class Sequence_intersect_expr;
class Sequence_within_expr;
class Sequence_throughout_expr;
class Sequence_delay_range_expr;
class Sequence_delay_repetition_list;
class Sequence_expr_primary;
class Sequence_repetition_expr;
class Expression_or_dist;
class Boolean_abbrev_opt;
class Dist_opt;
class Value_range;
class Expression_list_proper;
class Streaming_concatenation;
class Bin_based_number;
class Dec_based_number;
class Hex_based_number;
class Oct_based_number;
class Tk_binbase;
class Tk_bindigits;
class Macronumericwidth;
class Tk_decbase;
class Tk_decdigits;
class Tk_xzdigits;
class Case_any;
class Case_items;
class Case_item;
class Preprocessor_directive;
class Param_type_followed_by_id_and_dimensions_opt;
class Parameter_assign_list;
class Localparam_assign_list;
class Type_assignment_list;
class Parameter_expr;
class Parameter_value_ranges_opt;
class Bit_logic_opt;
class Bit_logic;
class Parameter_assign;
class Tk_hexbase;
class Tk_hexdigits;
class Generate_item_list_opt;
class Generate_item_list;
class Generate_item;
class Generate_block;
class Genvar_opt;
class For_step_opt;
class For_step;
class For_initialization_opt;
class Repeat_control;
class For_initialization;
class For_init_decl_or_assign;
class Parameter_expr_list;
class Parameter_value_byname_list;
class Preprocess_include_argument;
class Pp_identifier;
class Macro_formals_list_opt;
class Tk_stringliteral;
class Parameter_value_byname_list_item_last;
class Parameter_value_byname_list_trailing_comma;
class Parameter_value_byname;
class Module_parameter_port_list_item_last;
class Module_parameter_port_list_preprocessor_last;
class Module_parameter_port_list_trailing_comma;
class Module_parameter_port;
class Parameter_opt;
class Type_assignment;
class Generate_if;
class Generate_case_items;
class Class_new;
class Dynamic_array_new;
class Var_or_net_type_opt;
class Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt;
class Type_identifier_followed_by_id;
class Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt;
class Defparam_assign_list;
class Defparam_assign;
class Localparam_assign;
class Argument_list_opt;
class Any_argument_list;
class Any_argument_list_item_last;
class Any_argument_list_trailing_comma;
class Any_argument;
class Task_declaration_id;
class Tf_port_list_paren_opt;
class Tf_item_or_statement_or_null_list_opt;
class Tf_item_or_statement_or_null_list;
class Tf_item_or_statement_or_null;
class Task_item;
class Tf_port_list_opt;
class Scope_or_if_res;
class Array_reduction_method;
class Array_locator_method;
class Gatetype;
class Primitive_gate_instance_list;
class Switchtype;
class Dr_strength1;
class Dr_strength0;
class Primitive_gate_instance;
class Delay_scope;
class Join_keyword;
class Function_return_type_and_id;
class Endfunction_label_opt;
class Function_item_list;
class Statement_or_null_list_opt;
class Tf_port_list;
class Tf_port_list_item_last;
class Tf_port_item;
class Tf_port_list_trailing_comma;
class Tf_port_direction_opt;
class Tf_port_item_expr_opt;
class Tf_port_direction;
class Generate_case_item;
class Net_type_or_none;
class Pull01;
class Statement_or_null_list;
class Function_item;
class Function_item_data_declaration;
class Tf_port_declaration;
class Non_anonymous_instantiation_base;
class List_of_tf_variable_identifiers;
class Tf_variable_identifier_first;
class Tf_variable_identifier;
class Tk_octbase;
class Tk_octdigits;
class Specify_item_list_opt;
class Specify_item_list;
class Specify_item;
class Specify_simple_path_decl;
class Spec_reference_event;
class Spec_notifier_opt;
class Specify_edge_path_decl;
class Specparam_decl;
class Specify_simple_path;
class Delay_value_list;
class Specify_path_identifiers;
class Spec_polarity;
class Spec_notifier;
class Specify_terminal_descriptor;
class Edge_descriptor_list;
class Casting_type;
class Udp_port_list;
class Udp_port_decls;
class Udp_init_opt;
class Udp_body;
class Tk_reg_opt;
class Udp_initial_expr_opt;
class Udp_input_declaration_list;
class Udp_entry_list;
class Udp_sequ_entry_list;
class Udp_comb_entry_list;
class Udp_sequ_entry;
class Udp_input_list;
class Udp_input_sym;
class Udp_output_sym;
class Udp_initial;
class Udp_port_decl;
class Specify_edge_path;
class Polarity_operator;
class Immediate_assertion_statement;
class Simple_immediate_assertion_statement;
class Deferred_immediate_assertion_statement;
class Action_block;
class Enum_name_list;
class Enum_name_list_item_last;
class Enum_name_list_trailing_comma;
class Enum_name;
class Pos_neg_number;
class Macroiditem;
class Data_declaration_modifiers_opt;
class Data_declaration_base;
class Var_opt;
class Specparam_list;
class Specparam;
class Concurrent_assertion_item;
class Block_identifier_opt;
class Concurrent_assertion_statement;
class Assert_property_statement;
class Assume_property_statement;
class Cover_property_statement;
class Property_spec;
class Event_control_opt;
class Property_spec_disable_iff_opt;
class Package_item_list_opt;
class Package_item_list;
class Package_item;
class Tk_virtual_opt;
class Class_declaration_extends_opt;
class Implements_interface_list_opt;
class Class_items_opt;
class Class_items;
class Class_item;
class Method_qualifier_list_opt;
class Method_prototype;
class Class_constructor;
class List_of_variable_decl_assignments;
class Class_item_qualifier_list_opt;
class Method_property_qualifier_list_not_starting_with_virtual;
class Task_prototype;
class Function_prototype;
class Class_constructor_prototype;
class Endnew_opt;
class Variable_decl_assignment;
class Macro_formals_list;
class Macro_formal_parameter;
class Hierarchy_segment;
class Select_dimensions_opt;
class Dpi_import_item;
class Dpi_spec_string;
class Dpi_import_property_opt;
class Udp_comb_entry;
class Tk_ls_eq;
class Tk_rss_eq;
class Tk_rs_eq;
class Packed_signing_opt;
class Struct_union_member_list;
class Tk_tagged_opt;
class Struct_union_member;
class Random_qualifier_opt;
class Data_type_or_implicit_followed_by_id_and_dimensions_opt;
class Type_identifier_or_implicit_followed_by_id_and_dimensions_opt;
class Assignment_pattern;
class Structure_or_array_pattern_expression_list;
class Structure_or_array_pattern_expression;
class Structure_or_array_pattern_key;
class Package_import_item_list;
class Package_import_item;
class Scope_prefix;
class Tk_edge_descriptor;
class Property_qualifier;
class Class_item_qualifier;
class Final_or_zero;
class Stream_operator;
class Slice_size_opt;
class Stream_expression_list;
class Stream_expression;
class Identifier_opt;
class Clocking_item_list_opt;
class Visitor {
public:
  virtual void visit(Node *node) = 0;

  virtual void visit(Trailing_decl_assignment_opt *node) = 0;

  virtual void visit(Any_port_list_trailing_comma_named *node) = 0;

  virtual void visit(Any_port_list_trailing_comma_positional *node) = 0;

  virtual void visit(Class_items_opt *node) = 0;

  virtual void visit(Function_item_list *node) = 0;

  virtual void visit(Class_item *node) = 0;

  virtual void visit(Port_named *node) = 0;

  virtual void visit(Statement_or_null_list_opt *node) = 0;

  virtual void visit(Class_declaration_extends_opt *node) = 0;

  virtual void visit(Specify_item_list *node) = 0;

  virtual void visit(Implements_interface_list_opt *node) = 0;

  virtual void visit(Block_identifier_opt *node) = 0;

  virtual void visit(Tf_port_item *node) = 0;

  virtual void visit(List_of_tf_variable_identifiers *node) = 0;

  virtual void visit(Tf_port_direction_opt *node) = 0;

  virtual void visit(Tf_variable_identifier_first *node) = 0;

  virtual void visit(Assert_property_statement *node) = 0;

  virtual void visit(Concurrent_assertion_statement *node) = 0;

  virtual void visit(Tf_port_list_trailing_comma *node) = 0;

  virtual void visit(Member_name *node) = 0;

  virtual void visit(Tf_port_item_expr_opt *node) = 0;

  virtual void visit(Tf_variable_identifier *node) = 0;

  virtual void visit(Package_or_generate_item_declaration *node) = 0;

  virtual void visit(Specify_item_list_opt *node) = 0;

  virtual void visit(Data_type_base *node) = 0;

  virtual void visit(Decl_dimensions *node) = 0;

  virtual void visit(Tf_port_direction *node) = 0;

  virtual void visit(Assume_property_statement *node) = 0;

  virtual void visit(Data_type *node) = 0;

  virtual void visit(Tk_octdigits *node) = 0;

  virtual void visit(Task_prototype *node) = 0;

  virtual void visit(Specify_simple_path *node) = 0;

  virtual void visit(Method_qualifier_list_opt *node) = 0;

  virtual void visit(Generate_case_item *node) = 0;

  virtual void visit(Cover_property_statement *node) = 0;

  virtual void visit(Method_prototype *node) = 0;

  virtual void visit(Net_type_or_none *node) = 0;

  virtual void visit(Event_control_opt *node) = 0;

  virtual void visit(Net_declaration *node) = 0;

  virtual void visit(Class_constructor *node) = 0;

  virtual void visit(Genvar_declaration *node) = 0;

  virtual void visit(Property_spec *node) = 0;

  virtual void visit(Tk_octbase *node) = 0;

  virtual void visit(Class_item_qualifier_list_opt *node) = 0;

  virtual void visit(Specify_simple_path_decl *node) = 0;

  virtual void visit(List_of_variable_decl_assignments *node) = 0;

  virtual void visit(Clocking_declaration *node) = 0;

  virtual void visit(Specify_item *node) = 0;

  virtual void visit(Net_type *node) = 0;

  virtual void
  visit(Method_property_qualifier_list_not_starting_with_virtual *node) = 0;

  virtual void visit(Property_spec_disable_iff_opt *node) = 0;

  virtual void visit(Pull01 *node) = 0;

  virtual void visit(Task_declaration *node) = 0;

  virtual void visit(Spec_reference_event *node) = 0;

  virtual void visit(Macro_formals_list *node) = 0;

  virtual void visit(Function_declaration *node) = 0;

  virtual void visit(Package_item *node) = 0;

  virtual void visit(Package_item_list_opt *node) = 0;

  virtual void visit(Statement_or_null_list *node) = 0;

  virtual void visit(Function_prototype *node) = 0;

  virtual void visit(Package_item_list *node) = 0;

  virtual void visit(Class_declaration *node) = 0;

  virtual void visit(Non_anonymous_instantiation_base *node) = 0;

  virtual void visit(Spec_notifier_opt *node) = 0;

  virtual void visit(Dpi_import_export *node) = 0;

  virtual void visit(Variable_decl_assignment *node) = 0;

  virtual void visit(Function_item *node) = 0;

  virtual void visit(Class_constructor_prototype *node) = 0;

  virtual void visit(Specparam_declaration *node) = 0;

  virtual void visit(Function_item_data_declaration *node) = 0;

  virtual void visit(Tk_virtual_opt *node) = 0;

  virtual void visit(Parameter_value_opt *node) = 0;

  virtual void visit(Parameter_expr_list *node) = 0;

  virtual void visit(Generate_if *node) = 0;

  virtual void visit(Cast *node) = 0;

  virtual void visit(Type_assignment *node) = 0;

  virtual void visit(Symbolidentifier *node) = 0;

  virtual void visit(Parameters *node) = 0;

  virtual void visit(Dynamic_array_new *node) = 0;

  virtual void visit(Constant_dec_number *node) = 0;

  virtual void visit(Based_number *node) = 0;

  virtual void visit(Parameter_value_byname_list *node) = 0;

  virtual void visit(Macroidentifier *node) = 0;

  virtual void visit(Generate_case_items *node) = 0;

  virtual void visit(Tk_unbasednumber *node) = 0;

  virtual void visit(Escapedidentifier *node) = 0;

  virtual void visit(Preprocess_include_argument *node) = 0;

  virtual void visit(Instantiation_base *node) = 0;

  virtual void visit(Pp_identifier *node) = 0;

  virtual void visit(Class_new *node) = 0;

  virtual void visit(Keywordidentifier *node) = 0;

  virtual void
  visit(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
            *node) = 0;

  virtual void visit(Instantiation_type *node) = 0;

  virtual void visit(Var_or_net_type_opt *node) = 0;

  virtual void visit(
      Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node) = 0;

  virtual void visit(Lifetime *node) = 0;

  virtual void visit(Parameter_value_byname_list_item_last *node) = 0;

  virtual void visit(Const_opt *node) = 0;

  virtual void visit(Parameter_value_byname *node) = 0;

  virtual void visit(Macro_formals_list_opt *node) = 0;

  virtual void visit(Type_identifier_followed_by_id *node) = 0;

  virtual void visit(Range_list_in_braces *node) = 0;

  virtual void visit(Parameter_value_byname_list_trailing_comma *node) = 0;

  virtual void visit(Tk_decnumber *node) = 0;

  virtual void
  visit(Non_anonymous_gate_instance_or_register_variable *node) = 0;

  virtual void visit(Tk_stringliteral *node) = 0;

  virtual void visit(Delay_value_simple *node) = 0;

  virtual void
  visit(Non_anonymous_gate_instance_or_register_variable_list *node) = 0;

  virtual void visit(Defparam_assign_list *node) = 0;

  virtual void visit(Delay_value *node) = 0;

  virtual void visit(Gate_instance_or_register_variable *node) = 0;

  virtual void visit(Module_parameter_port *node) = 0;

  virtual void visit(Defparam_assign *node) = 0;

  virtual void visit(Tk_realtime *node) = 0;

  virtual void visit(Module_parameter_port_list_item_last *node) = 0;

  virtual void visit(Any_argument_list *node) = 0;

  virtual void visit(Decl_dimensions_opt *node) = 0;

  virtual void visit(Module_parameter_port_list_preprocessor_last *node) = 0;

  virtual void visit(Any_port_list_item_last_named *node) = 0;

  virtual void visit(Any_port_list_item_last_positional *node) = 0;

  virtual void visit(Localparam_assign *node) = 0;

  virtual void visit(Any_port_list_named *node) = 0;

  virtual void visit(Any_port_list_positional *node) = 0;

  virtual void visit(Parameter_opt *node) = 0;

  virtual void visit(Delay_identifier *node) = 0;

  virtual void visit(Any_port_list_opt *node) = 0;

  virtual void visit(Module_parameter_port_list_trailing_comma *node) = 0;

  virtual void visit(Any_argument_list_item_last *node) = 0;

  virtual void visit(Argument_list_opt *node) = 0;

  virtual void visit(Tk_timeliteral *node) = 0;

  virtual void visit(Any_argument_list_trailing_comma *node) = 0;

  virtual void visit(Non_port_module_item *node) = 0;

  virtual void visit(Enum_name *node) = 0;

  virtual void visit(Module_item *node) = 0;

  virtual void visit(Postfix_expression *node) = 0;

  virtual void visit(Any_argument *node) = 0;

  virtual void visit(Enum_name_list *node) = 0;

  virtual void visit(Data_declaration_modifiers_opt *node) = 0;

  virtual void visit(Module_port_declaration *node) = 0;

  virtual void visit(Unary_op *node) = 0;

  virtual void visit(Tf_item_or_statement_or_null_list *node) = 0;

  virtual void visit(Module_block *node) = 0;

  virtual void visit(Inc_or_dec_or_primary_expr *node) = 0;

  virtual void visit(Module_item_directive *node) = 0;

  virtual void visit(Task_declaration_id *node) = 0;

  virtual void visit(Tf_port_list_paren_opt *node) = 0;

  virtual void visit(Module_common_item *node) = 0;

  virtual void visit(Expr_primary *node) = 0;

  virtual void visit(Tf_item_or_statement_or_null_list_opt *node) = 0;

  virtual void visit(Reference *node) = 0;

  virtual void visit(Generate_region *node) = 0;

  virtual void visit(Pos_neg_number *node) = 0;

  virtual void visit(Local_root *node) = 0;

  virtual void visit(Specify_block *node) = 0;

  virtual void visit(Reference_or_call_base *node) = 0;

  virtual void visit(Tf_item_or_statement_or_null *node) = 0;

  virtual void visit(Macroiditem *node) = 0;

  virtual void visit(Timeunits_declaration *node) = 0;

  virtual void visit(Data_declaration_base *node) = 0;

  virtual void visit(Task_item *node) = 0;

  virtual void visit(Builtin_array_method *node) = 0;

  virtual void visit(Always_construct *node) = 0;

  virtual void visit(Scope_or_if_res *node) = 0;

  virtual void visit(Data_declaration_or_module_instantiation *node) = 0;

  virtual void visit(Tf_port_list_opt *node) = 0;

  virtual void visit(Type_or_id_root *node) = 0;

  virtual void visit(Array_locator_method *node) = 0;

  virtual void visit(Any_param_declaration *node) = 0;

  virtual void visit(Array_reduction_method *node) = 0;

  virtual void visit(Select_variable_dimension *node) = 0;

  virtual void visit(Specparam_list *node) = 0;

  virtual void visit(Var_opt *node) = 0;

  virtual void visit(Parameter_override *node) = 0;

  virtual void visit(Hierarchy_extension *node) = 0;

  virtual void visit(Gate_instantiation *node) = 0;

  virtual void visit(Class_id *node) = 0;

  virtual void visit(Gatetype *node) = 0;

  virtual void visit(Type_declaration *node) = 0;

  virtual void visit(Primitive_gate_instance *node) = 0;

  virtual void visit(Primitive_gate_instance_list *node) = 0;

  virtual void visit(Implicit_class_handle *node) = 0;

  virtual void visit(Package_import_declaration *node) = 0;

  virtual void visit(Specparam *node) = 0;

  virtual void visit(Genericidentifier *node) = 0;

  virtual void visit(Always_any *node) = 0;

  virtual void visit(Qualified_id *node) = 0;

  virtual void visit(Concurrent_assertion_item *node) = 0;

  virtual void visit(Switchtype *node) = 0;

  virtual void visit(Initial_construct *node) = 0;

  virtual void visit(Dr_strength1 *node) = 0;

  virtual void visit(Inc_or_dec_expression *node) = 0;

  virtual void visit(Preprocessor_action *node) = 0;

  virtual void visit(Module_or_generate_item_declaration *node) = 0;

  virtual void visit(Equiv_impl_expr *node) = 0;

  virtual void visit(Dr_strength0 *node) = 0;

  virtual void visit(Udp_primitive *node) = 0;

  virtual void visit(Continuous_assign *node) = 0;

  virtual void visit(Expression *node) = 0;

  virtual void visit(Tk_hexdigits *node) = 0;

  virtual void visit(Package_declaration *node) = 0;

  virtual void visit(Loop_generate_construct *node) = 0;

  virtual void visit(Assign_modify_statement *node) = 0;

  virtual void visit(Conditional_generate_construct *node) = 0;

  virtual void visit(Generate_item_list *node) = 0;

  virtual void visit(Lifetime_opt *node) = 0;

  virtual void visit(Generate_item_list_opt *node) = 0;

  virtual void visit(Symbol_or_label *node) = 0;

  virtual void visit(Cond_expr *node) = 0;

  virtual void visit(Assertion_item *node) = 0;

  virtual void visit(Module_package_import_list_opt *node) = 0;

  virtual void visit(Module_parameter_port_list_opt *node) = 0;

  virtual void visit(Logor_expr *node) = 0;

  virtual void visit(Module_port_list_opt *node) = 0;

  virtual void visit(Final_construct *node) = 0;

  virtual void visit(Generate_item *node) = 0;

  virtual void visit(Module_attribute_foreign_opt *node) = 0;

  virtual void visit(Statement_item *node) = 0;

  virtual void visit(Module_item_list_opt *node) = 0;

  virtual void visit(Statement *node) = 0;

  virtual void visit(Module_end *node) = 0;

  virtual void visit(Label_opt *node) = 0;

  virtual void visit(Logand_expr *node) = 0;

  virtual void visit(Generate_block *node) = 0;

  virtual void visit(Delay_scope *node) = 0;

  virtual void visit(Procedural_timing_control_statement *node) = 0;

  virtual void visit(Reference_or_call *node) = 0;

  virtual void visit(Genvar_opt *node) = 0;

  virtual void visit(Matches_expr *node) = 0;

  virtual void visit(For_initialization_opt *node) = 0;

  virtual void visit(Join_keyword *node) = 0;

  virtual void visit(With_exprs_suffix *node) = 0;

  virtual void visit(Unqualified_id *node) = 0;

  virtual void visit(Bitor_expr *node) = 0;

  virtual void visit(Assignment_statement *node) = 0;

  virtual void visit(Function_return_type_and_id *node) = 0;

  virtual void visit(Delay1 *node) = 0;

  virtual void visit(For_step_opt *node) = 0;

  virtual void visit(Xor_expr *node) = 0;

  virtual void visit(Bitand_expr *node) = 0;

  virtual void visit(Tf_port_declaration *node) = 0;

  virtual void visit(Tf_port_list_item_last *node) = 0;

  virtual void visit(Seq_block *node) = 0;

  virtual void visit(Tf_port_list *node) = 0;

  virtual void visit(Module_item_list *node) = 0;

  virtual void visit(For_step *node) = 0;

  virtual void visit(Subroutine_call *node) = 0;

  virtual void visit(For_initialization *node) = 0;

  virtual void visit(For_init_decl_or_assign *node) = 0;

  virtual void visit(Endfunction_label_opt *node) = 0;

  virtual void visit(Caseeq_expr *node) = 0;

  virtual void visit(Conditional_statement *node) = 0;

  virtual void visit(Repeat_control *node) = 0;

  virtual void visit(Logeq_expr *node) = 0;

  virtual void visit(Nonblocking_assignment *node) = 0;

  virtual void visit(Sequence_expr *node) = 0;

  virtual void visit(Property_expr *node) = 0;

  virtual void visit(Port *node) = 0;

  virtual void visit(Case_statement *node) = 0;

  virtual void visit(Identifier_optional_unpacked_dimensions *node) = 0;

  virtual void visit(Case_items *node) = 0;

  virtual void
  visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node) = 0;

  virtual void
  visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi *node) = 0;

  virtual void visit(Property_implication_expr *node) = 0;

  virtual void visit(List_of_ports_or_port_declarations_ansi *node) = 0;

  virtual void visit(List_of_ports_or_port_declarations_non_ansi *node) = 0;

  virtual void visit(Loop_statement *node) = 0;

  virtual void visit(Comp_expr *node) = 0;

  virtual void visit(Property_prefix_expr *node) = 0;

  virtual void visit(Par_block *node) = 0;

  virtual void visit(Shift_expr *node) = 0;

  virtual void visit(Case_item *node) = 0;

  virtual void visit(Property_if_else_expr *node) = 0;

  virtual void visit(Blocking_assignment *node) = 0;

  virtual void visit(Preprocessor_directive *node) = 0;

  virtual void visit(Simple_sequence_expr *node) = 0;

  virtual void visit(Wait_statement *node) = 0;

  virtual void visit(Port_expression *node) = 0;

  virtual void visit(Sequence_or_expr *node) = 0;

  virtual void visit(Param_type_followed_by_id_and_dimensions_opt *node) = 0;

  virtual void visit(Procedural_assertion_statement *node) = 0;

  virtual void visit(Port_declaration_ansi *node) = 0;

  virtual void visit(Port_declaration_non_ansi *node) = 0;

  virtual void visit(Add_expr *node) = 0;

  virtual void visit(Sequence_and_expr *node) = 0;

  virtual void visit(Parameter_expr *node) = 0;

  virtual void visit(Immediate_assertion_statement *node) = 0;

  virtual void visit(Parameter_value_ranges_opt *node) = 0;

  virtual void visit(Procedural_continuous_assignment *node) = 0;

  virtual void visit(Trailing_assign_opt *node) = 0;

  virtual void visit(Sequence_unary_expr *node) = 0;

  virtual void visit(Localparam_assign_list *node) = 0;

  virtual void visit(Udp_initial *node) = 0;

  virtual void visit(Event_trigger *node) = 0;

  virtual void visit(Udp_port_decl *node) = 0;

  virtual void visit(Sequence_intersect_expr *node) = 0;

  virtual void visit(Parameter_assign_list *node) = 0;

  virtual void visit(Disable_statement *node) = 0;

  virtual void visit(Class_items *node) = 0;

  virtual void visit(Sequence_within_expr *node) = 0;

  virtual void visit(Jump_statement *node) = 0;

  virtual void visit(Open_range_list *node) = 0;

  virtual void visit(Port_expression_opt *node) = 0;

  virtual void visit(Sequence_throughout_expr *node) = 0;

  virtual void visit(Trailing_assign *node) = 0;

  virtual void visit(Specify_edge_path *node) = 0;

  virtual void visit(Mul_expr *node) = 0;

  virtual void visit(Macrogenericitem *node) = 0;

  virtual void visit(Sequence_delay_range_expr *node) = 0;

  virtual void visit(Type_assignment_list *node) = 0;

  virtual void visit(Action_block *node) = 0;

  virtual void visit(Port_reference *node) = 0;

  virtual void visit(Lpvalue *node) = 0;

  virtual void visit(Port_reference_list *node) = 0;

  virtual void visit(Sequence_delay_repetition_list *node) = 0;

  virtual void visit(Statement_or_null *node) = 0;

  virtual void visit(Unique_priority_opt *node) = 0;

  virtual void visit(Deferred_immediate_assertion_statement *node) = 0;

  virtual void visit(Pow_expr *node) = 0;

  virtual void visit(Sequence_expr_primary *node) = 0;

  virtual void visit(Enum_name_list_trailing_comma *node) = 0;

  virtual void visit(Event_control *node) = 0;

  virtual void visit(Parameter_assign *node) = 0;

  virtual void visit(Unary_expr *node) = 0;

  virtual void visit(Sequence_repetition_expr *node) = 0;

  virtual void visit(Polarity_operator *node) = 0;

  virtual void visit(Unary_prefix_expr *node) = 0;

  virtual void visit(Expression_in_parens *node) = 0;

  virtual void visit(Cycle_delay *node) = 0;

  virtual void visit(Expression_or_dist *node) = 0;

  virtual void visit(Tk_hexbase *node) = 0;

  virtual void visit(Assignment_statement_no_expr *node) = 0;

  virtual void visit(Module_parameter_port_list *node) = 0;

  virtual void visit(Boolean_abbrev_opt *node) = 0;

  virtual void visit(Package_import_item_list *node) = 0;

  virtual void visit(Delay_or_event_control_opt *node) = 0;

  virtual void visit(Timescale_directive *node) = 0;

  virtual void visit(Dist_opt *node) = 0;

  virtual void visit(Event_expression_list *node) = 0;

  virtual void visit(Misc_directive *node) = 0;

  virtual void visit(Udp_port_list *node) = 0;

  virtual void visit(Edge_operator *node) = 0;

  virtual void visit(Hex_based_number *node) = 0;

  virtual void visit(Value_range *node) = 0;

  virtual void visit(Hierarchy_event_identifier *node) = 0;

  virtual void visit(Tk_binbase *node) = 0;

  virtual void visit(Udp_sequ_entry_list *node) = 0;

  virtual void visit(Expression_list_proper *node) = 0;

  virtual void visit(Udp_port_decls *node) = 0;

  virtual void visit(Class_item_qualifier *node) = 0;

  virtual void visit(Data_declaration *node) = 0;

  virtual void visit(Tk_edge_descriptor *node) = 0;

  virtual void visit(Udp_init_opt *node) = 0;

  virtual void visit(Event_expression *node) = 0;

  virtual void visit(Streaming_concatenation *node) = 0;

  virtual void visit(Udp_body *node) = 0;

  virtual void visit(Time_literal *node) = 0;

  virtual void visit(Property_qualifier *node) = 0;

  virtual void visit(Dir *node) = 0;

  virtual void visit(Stream_operator *node) = 0;

  virtual void visit(Dec_based_number *node) = 0;

  virtual void visit(Final_or_zero *node) = 0;

  virtual void visit(Expression_opt *node) = 0;

  virtual void visit(Bin_based_number *node) = 0;

  virtual void visit(Cont_assign *node) = 0;

  virtual void visit(Port_direction *node) = 0;

  virtual void visit(Drive_strength_opt *node) = 0;

  virtual void visit(Oct_based_number *node) = 0;

  virtual void visit(Stream_expression *node) = 0;

  virtual void visit(Var_type *node) = 0;

  virtual void visit(Cont_assign_list *node) = 0;

  virtual void visit(Slice_size_opt *node) = 0;

  virtual void visit(Udp_comb_entry_list *node) = 0;

  virtual void visit(Tk_reg_opt *node) = 0;

  virtual void visit(Tk_bindigits *node) = 0;

  virtual void visit(Stream_expression_list *node) = 0;

  virtual void visit(List_of_identifiers_unpacked_dimensions *node) = 0;

  virtual void visit(Udp_initial_expr_opt *node) = 0;

  virtual void visit(Udp_input_list *node) = 0;

  virtual void visit(Udp_input_declaration_list *node) = 0;

  virtual void visit(Expr_mintypmax_generalized *node) = 0;

  virtual void visit(Tk_decbase *node) = 0;

  virtual void visit(Expr_mintypmax *node) = 0;

  virtual void visit(Macronumericwidth *node) = 0;

  virtual void visit(Udp_sequ_entry *node) = 0;

  virtual void visit(Clocking_item_list_opt *node) = 0;

  virtual void visit(List_of_module_item_identifiers *node) = 0;

  virtual void visit(Tk_decdigits *node) = 0;

  virtual void visit(Drive_strength *node) = 0;

  virtual void visit(Identifier_opt *node) = 0;

  virtual void visit(Delay_or_event_control *node) = 0;

  virtual void visit(Property_expr_or_assignment *node) = 0;

  virtual void visit(Udp_entry_list *node) = 0;

  virtual void visit(List_of_port_identifiers *node) = 0;

  virtual void visit(Bit_logic_opt *node) = 0;

  virtual void visit(Enum_name_list_item_last *node) = 0;

  virtual void visit(Expr_mintypmax_trans_set *node) = 0;

  virtual void visit(Tk_xzdigits *node) = 0;

  virtual void visit(Simple_immediate_assertion_statement *node) = 0;

  virtual void visit(Property_expr_or_assignment_list *node) = 0;

  virtual void visit(Udp_input_sym *node) = 0;

  virtual void
  visit(List_of_ports_or_port_declarations_item_last_ansi *node) = 0;

  virtual void
  visit(List_of_ports_or_port_declarations_item_last_non_ansi *node) = 0;

  virtual void visit(Bit_logic *node) = 0;

  virtual void visit(Udp_output_sym *node) = 0;

  virtual void visit(Port_net_type *node) = 0;

  virtual void visit(Case_any *node) = 0;

  virtual void visit(Tk_rss_eq *node) = 0;

  virtual void visit(Packed_signing_opt *node) = 0;

  virtual void visit(Tk_rs_eq *node) = 0;

  virtual void visit(
      Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node) = 0;

  virtual void visit(Random_qualifier_opt *node) = 0;

  virtual void visit(Struct_union_member_list *node) = 0;

  virtual void visit(Trailing_decl_assignment *node) = 0;

  virtual void visit(Data_type_primitive_scalar *node) = 0;

  virtual void visit(Tk_tagged_opt *node) = 0;

  virtual void visit(Integer_vector_type *node) = 0;

  virtual void
  visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node) = 0;

  virtual void visit(Signed_unsigned_opt *node) = 0;

  virtual void visit(Struct_union_member *node) = 0;

  virtual void visit(Integer_atom_type *node) = 0;

  virtual void visit(Enum_data_type *node) = 0;

  virtual void visit(Package_import_item *node) = 0;

  virtual void visit(Non_integer_type *node) = 0;

  virtual void visit(Structure_or_array_pattern_expression_list *node) = 0;

  virtual void visit(Assignment_pattern *node) = 0;

  virtual void visit(Struct_data_type *node) = 0;

  virtual void visit(Structure_or_array_pattern_expression *node) = 0;

  virtual void visit(Package_import_list *node) = 0;

  virtual void visit(Structure_or_array_pattern_key *node) = 0;

  virtual void visit(List_of_ports_or_port_declarations_opt *node) = 0;

  virtual void visit(Scope_prefix *node) = 0;

  virtual void visit(Dpi_import_item *node) = 0;

  virtual void visit(Specparam_decl *node) = 0;

  virtual void visit(Net_variable_or_decl_assign *node) = 0;

  virtual void visit(Endnew_opt *node) = 0;

  virtual void visit(Data_type_or_implicit *node) = 0;

  virtual void visit(Begin *node) = 0;

  virtual void visit(Net_variable_or_decl_assigns *node) = 0;

  virtual void visit(Block_item_or_statement_or_null_list_opt *node) = 0;

  virtual void visit(Spec_polarity *node) = 0;

  virtual void visit(End *node) = 0;

  virtual void visit(Specify_edge_path_decl *node) = 0;

  virtual void visit(Macro_formal_parameter *node) = 0;

  virtual void visit(Block_item_or_statement_or_null_list *node) = 0;

  virtual void visit(Charge_strength_opt *node) = 0;

  virtual void visit(Delay3 *node) = 0;

  virtual void visit(System_tf_call *node) = 0;

  virtual void visit(Hierarchy_segment *node) = 0;

  virtual void visit(Block_item_or_statement_or_null *node) = 0;

  virtual void visit(Delay3_opt *node) = 0;

  virtual void visit(Select_dimensions_opt *node) = 0;

  virtual void visit(Delay_value_list *node) = 0;

  virtual void visit(List_of_identifiers *node) = 0;

  virtual void visit(Block_item_decl *node) = 0;

  virtual void visit(Dpi_spec_string *node) = 0;

  virtual void visit(Expr_primary_no_groups *node) = 0;

  virtual void visit(Dpi_import_property_opt *node) = 0;

  virtual void visit(Net_variable *node) = 0;

  virtual void visit(Systemtfidentifier *node) = 0;

  virtual void visit(Package_item_no_pp *node) = 0;

  virtual void visit(Net_decl_assign *node) = 0;

  virtual void visit(Spec_notifier *node) = 0;

  virtual void visit(Call_base *node) = 0;

  virtual void visit(Specify_path_identifiers *node) = 0;

  virtual void visit(Source_text *node) = 0;

  virtual void visit(Number *node) = 0;

  virtual void visit(Signing *node) = 0;

  virtual void visit(Specify_terminal_descriptor *node) = 0;

  virtual void visit(Udp_comb_entry *node) = 0;

  virtual void visit(Expr_primary_parens *node) = 0;

  virtual void visit(Delay3_or_drive_opt *node) = 0;

  virtual void visit(Edge_descriptor_list *node) = 0;

  virtual void visit(Tk_ls_eq *node) = 0;

  virtual void visit(Expr_primary_braces *node) = 0;

  virtual void visit(Description_list *node) = 0;

  virtual void visit(Decl_variable_dimension *node) = 0;

  virtual void visit(Assignment_pattern_expression *node) = 0;

  virtual void visit(Casting_type *node) = 0;

  virtual void visit(Data_type_primitive *node) = 0;

  virtual void visit(Expression_or_null_list_opt *node) = 0;

  virtual void visit(Module_or_interface_declaration *node) = 0;

  virtual void visit(Module_or_generate_item *node) = 0;

  virtual void visit(Module_start *node) = 0;

  virtual void visit(Description *node) = 0;

  virtual void visit(String_literal *node) = 0;

  virtual void visit(Terminal *node) = 0;

private:
};
#endif
