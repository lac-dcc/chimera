#ifndef VARIABLE_RENAMER
#define VARIABLE_RENAMER
#include "AST.h"
#include "Visitor.h"
#include <iostream>
#include <memory>
#include <queue>
#include <stack>
#include <string>
#include <vector>
class Node;
class Terminal;
class Time_literal;
class Tk_timeliteral;
class Tk_decnumber;
class Timescale_directive;
class Package_item_no_pp;
class Misc_directive;
class Package_or_generate_item_declaration;
class Data_declaration;
class Any_param_declaration;
class Timeunits_declaration;
class Type_declaration;
class Package_import_declaration;
class Description;
class Module_or_interface_declaration;
class Preprocessor_action;
class Udp_primitive;
class Package_declaration;
class Description_list;
class Module_start;
class Lifetime_opt;
class Lifetime;
class Genericidentifier;
class Symbolidentifier;
class Escapedidentifier;
class Keywordidentifier;
class Symbol_or_label;
class Module_package_import_list_opt;
class Package_import_list;
class Module_parameter_port_list_opt;
class Module_parameter_port_list;
class Module_port_list_opt;
class List_of_ports_or_port_declarations_opt;
class Module_attribute_foreign_opt;
class Integer_vector_type;
class Signed_unsigned_opt;
class Signing;
class Data_type_primitive_scalar;
class Integer_atom_type;
class Non_integer_type;
class Enum_data_type;
class Struct_data_type;
class Decl_dimensions_opt;
class Decl_dimensions;
class Data_type_primitive;
class Data_type_base;
class Data_type;
class Reference;
class Instantiation_type;
class Trailing_decl_assignment_opt;
class Trailing_decl_assignment;
class Non_anonymous_gate_instance_or_register_variable;
class Any_port_list_opt;
class Non_anonymous_gate_instance_or_register_variable_list;
class Gate_instance_or_register_variable;
class Instantiation_base;
class Reference_or_call_base;
class Data_declaration_or_module_instantiation;
class Const_opt;
class Module_or_generate_item;
class Module_common_item;
class Parameter_override;
class Gate_instantiation;
class Non_port_module_item;
class Generate_region;
class Specify_block;
class Module_item;
class Module_port_declaration;
class Module_block;
class Module_item_directive;
class Module_item_list;
class Net_type;
class Number;
class Constant_dec_number;
class Based_number;
class Tk_unbasednumber;
class Expr_primary_no_groups;
class System_tf_call;
class String_literal;
class Tk_realtime;
class Cast;
class Expr_primary;
class Expr_primary_parens;
class Expr_primary_braces;
class Assignment_pattern_expression;
class Postfix_expression;
class Reference_or_call;
class Inc_or_dec_or_primary_expr;
class Inc_or_dec_expression;
class Unary_prefix_expr;
class Unary_op;
class Unary_expr;
class Pow_expr;
class Mul_expr;
class Add_expr;
class Shift_expr;
class Comp_expr;
class Open_range_list;
class Logeq_expr;
class Caseeq_expr;
class Bitand_expr;
class Xor_expr;
class Bitor_expr;
class With_exprs_suffix;
class Matches_expr;
class Logand_expr;
class Logor_expr;
class Cond_expr;
class Expression;
class Equiv_impl_expr;
class Decl_variable_dimension;
class Expression_or_null_list_opt;
class Delay3_or_drive_opt;
class Delay3;
class Data_type_or_implicit;
class Net_variable;
class Net_variable_or_decl_assign;
class Net_decl_assign;
class Net_variable_or_decl_assigns;
class Net_declaration;
class Charge_strength_opt;
class Delay3_opt;
class List_of_identifiers;
class Task_declaration;
class Function_declaration;
class Class_declaration;
class Dpi_import_export;
class Specparam_declaration;
class Module_or_generate_item_declaration;
class Genvar_declaration;
class Clocking_declaration;
class Initial_construct;
class Always_construct;
class Continuous_assign;
class Loop_generate_construct;
class Conditional_generate_construct;
class Assertion_item;
class Final_construct;
class Parameter_value_opt;
class Parameters;
class Unqualified_id;
class Class_id;
class Qualified_id;
class Type_or_id_root;
class Implicit_class_handle;
class Local_root;
class Select_variable_dimension;
class Hierarchy_extension;
class Member_name;
class Builtin_array_method;
class Port_named;
class Any_port;
class Any_port_list_item_last;
class Any_port_list_trailing_comma;
class Any_port_list;
class Label_opt;
class Begin;
class Lpvalue;
class Range_list_in_braces;
class Assignment_statement_no_expr;
class Assign_modify_statement;
class Assignment_statement;
class Statement_item;
class Procedural_timing_control_statement;
class Subroutine_call;
class Seq_block;
class Nonblocking_assignment;
class Conditional_statement;
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
class Block_item_or_statement_or_null;
class Block_item_decl;
class Block_item_or_statement_or_null_list;
class Delay_value_simple;
class Delay_identifier;
class Delay1;
class Delay_value;
class Statement_or_null;
class Statement;
class Event_control;
class Cycle_delay;
class Systemtfidentifier;
class Call_base;
class Block_item_or_statement_or_null_list_opt;
class End;
class Always_any;
class Module_item_list_opt;
class Module_end;
class Source_text;
class Port_reference;
class Port_expression;
class Port_reference_list;
class Trailing_assign_opt;
class Trailing_assign;
class Port;
class Port_expression_opt;
class Port_or_port_declaration;
class Port_declaration;
class List_of_ports_or_port_declarations_item_last;
class List_of_ports_or_port_declarations_trailing_comma;
class List_of_ports_or_port_declarations;
class Dir;
class Var_type;
class List_of_port_identifiers;
class Port_direction;
class List_of_module_item_identifiers;
class List_of_identifiers_unpacked_dimensions;
class Port_net_type;
class Identifier_optional_unpacked_dimensions;
class Drive_strength_opt;
class Drive_strength;
class Cont_assign;
class Cont_assign_list;
class Edge_operator;
class Event_expression;
class Event_expression_list;
class Hierarchy_event_identifier;
class Unique_priority_opt;
class Expression_in_parens;
class Delay_or_event_control_opt;
class Delay_or_event_control;
class Expression_opt;
class Bit_logic_opt;
class Bit_logic;
class Param_type_followed_by_id_and_dimensions_opt;
class Parameter_expr;
class Parameter_value_ranges_opt;
class Parameter_assign;
class Parameter_assign_list;
class Localparam_assign_list;
class Type_assignment_list;
class Macronumericwidth;
class Hex_based_number;
class Tk_hexbase;
class Tk_hexdigits;
class Dec_based_number;
class Bin_based_number;
class Oct_based_number;
class Tk_decbase;
class Tk_decdigits;
class Tk_xzdigits;
class Case_any;
class Expression_list_proper;
class Case_item;
class Preprocessor_directive;
class Case_items;
class Tk_binbase;
class Tk_bindigits;
class Dist_opt;
class Expression_or_dist;
class Boolean_abbrev_opt;
class Sequence_repetition_expr;
class Sequence_expr_primary;
class Sequence_delay_repetition_list;
class Sequence_delay_range_expr;
class Sequence_throughout_expr;
class Sequence_within_expr;
class Sequence_intersect_expr;
class Sequence_unary_expr;
class Sequence_and_expr;
class Sequence_or_expr;
class Simple_sequence_expr;
class Property_if_else_expr;
class Property_prefix_expr;
class Property_implication_expr;
class Sequence_expr;
class Property_expr;
class Property_expr_or_assignment;
class Property_expr_or_assignment_list;
class Expr_mintypmax_generalized;
class Expr_mintypmax_trans_set;
class Expr_mintypmax;
class Value_range;
class Streaming_concatenation;
class Genvar_opt;
class For_step;
class For_step_opt;
class Generate_item;
class Generate_block;
class Generate_item_list;
class Generate_item_list_opt;
class For_init_decl_or_assign;
class For_initialization;
class For_initialization_opt;
class Repeat_control;
class Tk_stringliteral;
class Tk_evalstringliteral;
class Preprocess_include_argument;
class Pp_identifier;
class Macro_formals_list_opt;
class Parameter_expr_list;
class Parameter_value_byname_list;
class Parameter_opt;
class Module_parameter_port;
class Type_assignment;
class Module_parameter_port_list_item_last;
class Module_parameter_port_list_trailing_comma;
class Module_parameter_port_list_preprocessor_last;
class Parameter_value_byname;
class Parameter_value_byname_list_item_last;
class Parameter_value_byname_list_trailing_comma;
class Generate_if;
class Generate_case_items;
class Var_or_net_type_opt;
class Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt;
class Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt;
class Port_declaration_noattr;
class Type_identifier_followed_by_id;
class Class_new;
class Dynamic_array_new;
class Localparam_assign;
class Defparam_assign;
class Defparam_assign_list;
class Any_argument;
class Any_argument_list_item_last;
class Any_argument_list_trailing_comma;
class Any_argument_list;
class Argument_list_opt;
class Task_declaration_id;
class Scope_or_if_res;
class Tf_port_list_paren_opt;
class Tf_port_list_opt;
class Tf_item_or_statement_or_null;
class Task_item;
class Tf_item_or_statement_or_null_list;
class Tf_item_or_statement_or_null_list_opt;
class Array_reduction_method;
class Array_locator_method;
class Gatetype;
class Primitive_gate_instance;
class Primitive_gate_instance_list;
class Switchtype;
class Dr_strength1;
class Dr_strength0;
class Delay_scope;
class Join_keyword;
class Generate_case_item;
class Function_return_type_and_id;
class Tf_port_direction;
class Tf_port_direction_opt;
class Tf_port_item_expr_opt;
class Tf_port_item;
class Tf_port_list_item_last;
class Tf_port_list_trailing_comma;
class Tf_port_list;
class Endfunction_label_opt;
class Function_item_list;
class Statement_or_null_list_opt;
class Net_type_or_none;
class Pull01;
class Macro_formal_parameter;
class Macro_formals_list;
class Tf_variable_identifier_first;
class List_of_tf_variable_identifiers;
class Tf_variable_identifier;
class Tf_port_declaration;
class Function_item;
class Function_item_data_declaration;
class Non_anonymous_instantiation_base;
class Statement_or_null_list;
class Tk_octbase;
class Tk_octdigits;
class Specify_terminal_descriptor;
class Spec_reference_event;
class Edge_descriptor_list;
class Spec_notifier;
class Spec_notifier_opt;
class Specify_item;
class Specify_simple_path_decl;
class Specify_edge_path_decl;
class Specparam_decl;
class Specify_item_list;
class Specify_path_identifiers;
class Spec_polarity;
class Specify_simple_path;
class Delay_value_list;
class Specify_item_list_opt;
class Casting_type;
class Polarity_operator;
class Specify_edge_path;
class Udp_port_list;
class Udp_port_decl;
class Udp_port_decls;
class Udp_init_opt;
class Udp_initial;
class Udp_input_sym;
class Udp_input_list;
class Udp_output_sym;
class Udp_sequ_entry;
class Udp_sequ_entry_list;
class Udp_entry_list;
class Udp_comb_entry_list;
class Udp_body;
class Tk_reg_opt;
class Udp_initial_expr_opt;
class Udp_input_declaration_list;
class Enum_name;
class Pos_neg_number;
class Enum_name_list_item_last;
class Enum_name_list_trailing_comma;
class Enum_name_list;
class Action_block;
class Simple_immediate_assertion_statement;
class Immediate_assertion_statement;
class Deferred_immediate_assertion_statement;
class Var_opt;
class Data_declaration_modifiers_opt;
class Data_declaration_base;
class Specparam;
class Specparam_list;
class Block_identifier_opt;
class Event_control_opt;
class Property_spec_disable_iff_opt;
class Property_spec;
class Assert_property_statement;
class Concurrent_assertion_statement;
class Assume_property_statement;
class Cover_property_statement;
class Concurrent_assertion_item;
class Tk_virtual_opt;
class Class_declaration_extends_opt;
class Implements_interface_list_opt;
class Variable_decl_assignment;
class List_of_variable_decl_assignments;
class Class_item;
class Class_constructor;
class Method_qualifier_list_opt;
class Method_prototype;
class Class_item_qualifier_list_opt;
class Method_property_qualifier_list_not_starting_with_virtual;
class Class_items;
class Class_constructor_prototype;
class Endnew_opt;
class Class_items_opt;
class Package_item;
class Package_item_list;
class Task_prototype;
class Function_prototype;
class Package_item_list_opt;
class Select_dimensions_opt;
class Hierarchy_segment;
class Dpi_spec_string;
class Dpi_import_property_opt;
class Dpi_import_item;
class Udp_comb_entry;
class Tk_ls_eq;
class Tk_rs_eq;
class Tk_rss_eq;
class Packed_signing_opt;
class Random_qualifier_opt;
class Data_type_or_implicit_followed_by_id_and_dimensions_opt;
class Type_identifier_or_implicit_followed_by_id_and_dimensions_opt;
class Struct_union_member;
class Struct_union_member_list;
class Tk_tagged_opt;
class Assignment_pattern;
class Structure_or_array_pattern_expression_list;
class Structure_or_array_pattern_key;
class Structure_or_array_pattern_expression;
class Scope_prefix;
class Package_import_item;
class Package_import_item_list;
class Tk_edge_descriptor;
class Class_item_qualifier;
class Property_qualifier;
class Final_or_zero;
class Stream_operator;
class Slice_size_opt;
class Stream_expression;
class Stream_expression_list;
class Identifier_opt;
class Clocking_item_list_opt;
class Visitor;
class IdentifierRenamingVisitor : public Visitor {
private:
  int varID = 0;

  class Var {
  public:
    std::string name;
    std::string t;
  };

  enum ContextType { expr = 0, decl, module };

  std::stack<ContextType> contexts;
  std::vector<std::shared_ptr<Var>> identifiers;
  std::stack<int> scopeLimit;

  bool isStartingToken(std::string t) {

    return t == " begin " || t == " module ";
  }

  bool isFnishingToken(std::string t) {
    return t == " end " || t == " endmodule ";
  }

  void startNewScope() {
    scopeLimit.push(identifiers.size()); // start of new context
  }

  void finishScope() {
    std::cerr << "finishing scope" << std::endl;
    if (!scopeLimit.empty()) {
      std::cerr << "scope not empty" << std::endl;
      std::cerr << "limit: " << scopeLimit.top()
                << "scope size: " << scopeLimit.size()
                << " size identifiers: " << identifiers.size() << std::endl;

      for (int i = 0; i < scopeLimit.top() && !identifiers.empty(); i++) {
        std::cerr << "Removing: " << identifiers.back() << std::endl;
        identifiers.pop_back();
      }
      scopeLimit.pop();
    }
  }

  std::string createNewID(std::string t) {

    Var v;
    if (t == "module") {
      v.name = " module_" + std::to_string(varID++);
    } else {
      v.name = " id_" + std::to_string(varID++);
    }

    std::cerr << "Var name: " << v.name << std::endl;
    v.t = t;
    identifiers.push_back(std::make_shared<Var>(v));

    return v.name;
  }

  void createIDContext(ContextType t) {
    std::cerr << "Creating context: " << t << std::endl;
    contexts.push(t);
  }

  std::string placeID(std::string type) { // SymbolIdentifier, EscapedIdentifier
    std::cerr << "Context: " << contexts.top()
              << " Context Size: " << contexts.size() << std::endl;

    if (contexts.top() == ContextType::module) {

      std::cerr << "entrou em mod" << std::endl;
      contexts.pop();
      contexts.push(ContextType::decl);
      return createNewID("module");
    }
    if (contexts.top() == ContextType::decl) {
      std::cerr << "Creating new ID for type: " << type << std::endl;
      return createNewID(type);
    }

    std::cerr << "Trying to use previous created ID" << std::endl;

    std::vector<std::string> options;
    for (auto id = identifiers.rbegin(); id != identifiers.rend(); id++) {
      if ((*id).get()->t == type)
        options.push_back((*id).get()->name);
    }
    if (options.size() == 0)
      return createNewID(type);

    auto c = rand() % options.size();
    std::cerr << "Using var: " << options[c] << std::endl;
    return options[c];
  }

public:
  virtual void visit(Node *node);

  virtual void visit(Terminal *node);

  virtual void visit(Time_literal *node);

  virtual void visit(Tk_timeliteral *node);

  virtual void visit(Tk_decnumber *node);

  virtual void visit(Timescale_directive *node);

  virtual void visit(Package_item_no_pp *node);

  virtual void visit(Misc_directive *node);

  virtual void visit(Package_or_generate_item_declaration *node);

  virtual void visit(Data_declaration *node);

  virtual void visit(Any_param_declaration *node);

  virtual void visit(Timeunits_declaration *node);

  virtual void visit(Type_declaration *node);

  virtual void visit(Package_import_declaration *node);

  virtual void visit(Description *node);

  virtual void visit(Module_or_interface_declaration *node);

  virtual void visit(Preprocessor_action *node);

  virtual void visit(Udp_primitive *node);

  virtual void visit(Package_declaration *node);

  virtual void visit(Description_list *node);

  virtual void visit(Module_start *node);

  virtual void visit(Lifetime_opt *node);

  virtual void visit(Lifetime *node);

  virtual void visit(Genericidentifier *node);

  virtual void visit(Symbolidentifier *node);

  virtual void visit(Escapedidentifier *node);

  virtual void visit(Keywordidentifier *node);

  virtual void visit(Symbol_or_label *node);

  virtual void visit(Module_package_import_list_opt *node);

  virtual void visit(Package_import_list *node);

  virtual void visit(Module_parameter_port_list_opt *node);

  virtual void visit(Module_parameter_port_list *node);

  virtual void visit(Module_port_list_opt *node);

  virtual void visit(List_of_ports_or_port_declarations_opt *node);

  virtual void visit(Module_attribute_foreign_opt *node);

  virtual void visit(Integer_vector_type *node);

  virtual void visit(Signed_unsigned_opt *node);

  virtual void visit(Signing *node);

  virtual void visit(Data_type_primitive_scalar *node);

  virtual void visit(Integer_atom_type *node);

  virtual void visit(Non_integer_type *node);

  virtual void visit(Enum_data_type *node);

  virtual void visit(Struct_data_type *node);

  virtual void visit(Decl_dimensions_opt *node);

  virtual void visit(Decl_dimensions *node);

  virtual void visit(Data_type_primitive *node);

  virtual void visit(Data_type_base *node);

  virtual void visit(Data_type *node);

  virtual void visit(Reference *node);

  virtual void visit(Instantiation_type *node);

  virtual void visit(Trailing_decl_assignment_opt *node);

  virtual void visit(Trailing_decl_assignment *node);

  virtual void visit(Non_anonymous_gate_instance_or_register_variable *node);

  virtual void visit(Any_port_list_opt *node);

  virtual void
  visit(Non_anonymous_gate_instance_or_register_variable_list *node);

  virtual void visit(Gate_instance_or_register_variable *node);

  virtual void visit(Instantiation_base *node);

  virtual void visit(Reference_or_call_base *node);

  virtual void visit(Data_declaration_or_module_instantiation *node);

  virtual void visit(Const_opt *node);

  virtual void visit(Module_or_generate_item *node);

  virtual void visit(Module_common_item *node);

  virtual void visit(Parameter_override *node);

  virtual void visit(Gate_instantiation *node);

  virtual void visit(Non_port_module_item *node);

  virtual void visit(Generate_region *node);

  virtual void visit(Specify_block *node);

  virtual void visit(Module_item *node);

  virtual void visit(Module_port_declaration *node);

  virtual void visit(Module_block *node);

  virtual void visit(Module_item_directive *node);

  virtual void visit(Module_item_list *node);

  virtual void visit(Net_type *node);

  virtual void visit(Number *node);

  virtual void visit(Constant_dec_number *node);

  virtual void visit(Based_number *node);

  virtual void visit(Tk_unbasednumber *node);

  virtual void visit(Expr_primary_no_groups *node);

  virtual void visit(System_tf_call *node);

  virtual void visit(String_literal *node);

  virtual void visit(Tk_realtime *node);

  virtual void visit(Cast *node);

  virtual void visit(Expr_primary *node);

  virtual void visit(Expr_primary_parens *node);

  virtual void visit(Expr_primary_braces *node);

  virtual void visit(Assignment_pattern_expression *node);

  virtual void visit(Postfix_expression *node);

  virtual void visit(Reference_or_call *node);

  virtual void visit(Inc_or_dec_or_primary_expr *node);

  virtual void visit(Inc_or_dec_expression *node);

  virtual void visit(Unary_prefix_expr *node);

  virtual void visit(Unary_op *node);

  virtual void visit(Unary_expr *node);

  virtual void visit(Pow_expr *node);

  virtual void visit(Mul_expr *node);

  virtual void visit(Add_expr *node);

  virtual void visit(Shift_expr *node);

  virtual void visit(Comp_expr *node);

  virtual void visit(Open_range_list *node);

  virtual void visit(Logeq_expr *node);

  virtual void visit(Caseeq_expr *node);

  virtual void visit(Bitand_expr *node);

  virtual void visit(Xor_expr *node);

  virtual void visit(Bitor_expr *node);

  virtual void visit(With_exprs_suffix *node);

  virtual void visit(Matches_expr *node);

  virtual void visit(Logand_expr *node);

  virtual void visit(Logor_expr *node);

  virtual void visit(Cond_expr *node);

  virtual void visit(Expression *node);

  virtual void visit(Equiv_impl_expr *node);

  virtual void visit(Decl_variable_dimension *node);

  virtual void visit(Expression_or_null_list_opt *node);

  virtual void visit(Delay3_or_drive_opt *node);

  virtual void visit(Delay3 *node);

  virtual void visit(Data_type_or_implicit *node);

  virtual void visit(Net_variable *node);

  virtual void visit(Net_variable_or_decl_assign *node);

  virtual void visit(Net_decl_assign *node);

  virtual void visit(Net_variable_or_decl_assigns *node);

  virtual void visit(Net_declaration *node);

  virtual void visit(Charge_strength_opt *node);

  virtual void visit(Delay3_opt *node);

  virtual void visit(List_of_identifiers *node);

  virtual void visit(Task_declaration *node);

  virtual void visit(Function_declaration *node);

  virtual void visit(Class_declaration *node);

  virtual void visit(Dpi_import_export *node);

  virtual void visit(Specparam_declaration *node);

  virtual void visit(Module_or_generate_item_declaration *node);

  virtual void visit(Genvar_declaration *node);

  virtual void visit(Clocking_declaration *node);

  virtual void visit(Initial_construct *node);

  virtual void visit(Always_construct *node);

  virtual void visit(Continuous_assign *node);

  virtual void visit(Loop_generate_construct *node);

  virtual void visit(Conditional_generate_construct *node);

  virtual void visit(Assertion_item *node);

  virtual void visit(Final_construct *node);

  virtual void visit(Parameter_value_opt *node);

  virtual void visit(Parameters *node);

  virtual void visit(Unqualified_id *node);

  virtual void visit(Class_id *node);

  virtual void visit(Qualified_id *node);

  virtual void visit(Type_or_id_root *node);

  virtual void visit(Implicit_class_handle *node);

  virtual void visit(Local_root *node);

  virtual void visit(Select_variable_dimension *node);

  virtual void visit(Hierarchy_extension *node);

  virtual void visit(Member_name *node);

  virtual void visit(Builtin_array_method *node);

  virtual void visit(Port_named *node);

  virtual void visit(Any_port *node);

  virtual void visit(Any_port_list_item_last *node);

  virtual void visit(Any_port_list_trailing_comma *node);

  virtual void visit(Any_port_list *node);

  virtual void visit(Label_opt *node);

  virtual void visit(Begin *node);

  virtual void visit(Lpvalue *node);

  virtual void visit(Range_list_in_braces *node);

  virtual void visit(Assignment_statement_no_expr *node);

  virtual void visit(Assign_modify_statement *node);

  virtual void visit(Assignment_statement *node);

  virtual void visit(Statement_item *node);

  virtual void visit(Procedural_timing_control_statement *node);

  virtual void visit(Subroutine_call *node);

  virtual void visit(Seq_block *node);

  virtual void visit(Nonblocking_assignment *node);

  virtual void visit(Conditional_statement *node);

  virtual void visit(Case_statement *node);

  virtual void visit(Loop_statement *node);

  virtual void visit(Par_block *node);

  virtual void visit(Blocking_assignment *node);

  virtual void visit(Wait_statement *node);

  virtual void visit(Procedural_assertion_statement *node);

  virtual void visit(Procedural_continuous_assignment *node);

  virtual void visit(Event_trigger *node);

  virtual void visit(Disable_statement *node);

  virtual void visit(Jump_statement *node);

  virtual void visit(Block_item_or_statement_or_null *node);

  virtual void visit(Block_item_decl *node);

  virtual void visit(Block_item_or_statement_or_null_list *node);

  virtual void visit(Delay_value_simple *node);

  virtual void visit(Delay_identifier *node);

  virtual void visit(Delay1 *node);

  virtual void visit(Delay_value *node);

  virtual void visit(Statement_or_null *node);

  virtual void visit(Statement *node);

  virtual void visit(Event_control *node);

  virtual void visit(Cycle_delay *node);

  virtual void visit(Systemtfidentifier *node);

  virtual void visit(Call_base *node);

  virtual void visit(Block_item_or_statement_or_null_list_opt *node);

  virtual void visit(End *node);

  virtual void visit(Always_any *node);

  virtual void visit(Module_item_list_opt *node);

  virtual void visit(Module_end *node);

  virtual void visit(Source_text *node);

  virtual void visit(Port_reference *node);

  virtual void visit(Port_expression *node);

  virtual void visit(Port_reference_list *node);

  virtual void visit(Trailing_assign_opt *node);

  virtual void visit(Trailing_assign *node);

  virtual void visit(Port *node);

  virtual void visit(Port_expression_opt *node);

  virtual void visit(Port_or_port_declaration *node);

  virtual void visit(Port_declaration *node);

  virtual void visit(List_of_ports_or_port_declarations_item_last *node);

  virtual void visit(List_of_ports_or_port_declarations_trailing_comma *node);

  virtual void visit(List_of_ports_or_port_declarations *node);

  virtual void visit(Dir *node);

  virtual void visit(Var_type *node);

  virtual void visit(List_of_port_identifiers *node);

  virtual void visit(Port_direction *node);

  virtual void visit(List_of_module_item_identifiers *node);

  virtual void visit(List_of_identifiers_unpacked_dimensions *node);

  virtual void visit(Port_net_type *node);

  virtual void visit(Identifier_optional_unpacked_dimensions *node);

  virtual void visit(Drive_strength_opt *node);

  virtual void visit(Drive_strength *node);

  virtual void visit(Cont_assign *node);

  virtual void visit(Cont_assign_list *node);

  virtual void visit(Edge_operator *node);

  virtual void visit(Event_expression *node);

  virtual void visit(Event_expression_list *node);

  virtual void visit(Hierarchy_event_identifier *node);

  virtual void visit(Unique_priority_opt *node);

  virtual void visit(Expression_in_parens *node);

  virtual void visit(Delay_or_event_control_opt *node);

  virtual void visit(Delay_or_event_control *node);

  virtual void visit(Expression_opt *node);

  virtual void visit(Bit_logic_opt *node);

  virtual void visit(Bit_logic *node);

  virtual void visit(Param_type_followed_by_id_and_dimensions_opt *node);

  virtual void visit(Parameter_expr *node);

  virtual void visit(Parameter_value_ranges_opt *node);

  virtual void visit(Parameter_assign *node);

  virtual void visit(Parameter_assign_list *node);

  virtual void visit(Localparam_assign_list *node);

  virtual void visit(Type_assignment_list *node);

  virtual void visit(Macronumericwidth *node);

  virtual void visit(Hex_based_number *node);

  virtual void visit(Tk_hexbase *node);

  virtual void visit(Tk_hexdigits *node);

  virtual void visit(Dec_based_number *node);

  virtual void visit(Bin_based_number *node);

  virtual void visit(Oct_based_number *node);

  virtual void visit(Tk_decbase *node);

  virtual void visit(Tk_decdigits *node);

  virtual void visit(Tk_xzdigits *node);

  virtual void visit(Case_any *node);

  virtual void visit(Expression_list_proper *node);

  virtual void visit(Case_item *node);

  virtual void visit(Preprocessor_directive *node);

  virtual void visit(Case_items *node);

  virtual void visit(Tk_binbase *node);

  virtual void visit(Tk_bindigits *node);

  virtual void visit(Dist_opt *node);

  virtual void visit(Expression_or_dist *node);

  virtual void visit(Boolean_abbrev_opt *node);

  virtual void visit(Sequence_repetition_expr *node);

  virtual void visit(Sequence_expr_primary *node);

  virtual void visit(Sequence_delay_repetition_list *node);

  virtual void visit(Sequence_delay_range_expr *node);

  virtual void visit(Sequence_throughout_expr *node);

  virtual void visit(Sequence_within_expr *node);

  virtual void visit(Sequence_intersect_expr *node);

  virtual void visit(Sequence_unary_expr *node);

  virtual void visit(Sequence_and_expr *node);

  virtual void visit(Sequence_or_expr *node);

  virtual void visit(Simple_sequence_expr *node);

  virtual void visit(Property_if_else_expr *node);

  virtual void visit(Property_prefix_expr *node);

  virtual void visit(Property_implication_expr *node);

  virtual void visit(Sequence_expr *node);

  virtual void visit(Property_expr *node);

  virtual void visit(Property_expr_or_assignment *node);

  virtual void visit(Property_expr_or_assignment_list *node);

  virtual void visit(Expr_mintypmax_generalized *node);

  virtual void visit(Expr_mintypmax_trans_set *node);

  virtual void visit(Expr_mintypmax *node);

  virtual void visit(Value_range *node);

  virtual void visit(Streaming_concatenation *node);

  virtual void visit(Genvar_opt *node);

  virtual void visit(For_step *node);

  virtual void visit(For_step_opt *node);

  virtual void visit(Generate_item *node);

  virtual void visit(Generate_block *node);

  virtual void visit(Generate_item_list *node);

  virtual void visit(Generate_item_list_opt *node);

  virtual void visit(For_init_decl_or_assign *node);

  virtual void visit(For_initialization *node);

  virtual void visit(For_initialization_opt *node);

  virtual void visit(Repeat_control *node);

  virtual void visit(Tk_stringliteral *node);

  virtual void visit(Tk_evalstringliteral *node);

  virtual void visit(Preprocess_include_argument *node);

  virtual void visit(Pp_identifier *node);

  virtual void visit(Macro_formals_list_opt *node);

  virtual void visit(Parameter_expr_list *node);

  virtual void visit(Parameter_value_byname_list *node);

  virtual void visit(Parameter_opt *node);

  virtual void visit(Module_parameter_port *node);

  virtual void visit(Type_assignment *node);

  virtual void visit(Module_parameter_port_list_item_last *node);

  virtual void visit(Module_parameter_port_list_trailing_comma *node);

  virtual void visit(Module_parameter_port_list_preprocessor_last *node);

  virtual void visit(Parameter_value_byname *node);

  virtual void visit(Parameter_value_byname_list_item_last *node);

  virtual void visit(Parameter_value_byname_list_trailing_comma *node);

  virtual void visit(Generate_if *node);

  virtual void visit(Generate_case_items *node);

  virtual void visit(Var_or_net_type_opt *node);

  virtual void
  visit(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
            *node);

  virtual void
  visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node);

  virtual void visit(Port_declaration_noattr *node);

  virtual void visit(Type_identifier_followed_by_id *node);

  virtual void visit(Class_new *node);

  virtual void visit(Dynamic_array_new *node);

  virtual void visit(Localparam_assign *node);

  virtual void visit(Defparam_assign *node);

  virtual void visit(Defparam_assign_list *node);

  virtual void visit(Any_argument *node);

  virtual void visit(Any_argument_list_item_last *node);

  virtual void visit(Any_argument_list_trailing_comma *node);

  virtual void visit(Any_argument_list *node);

  virtual void visit(Argument_list_opt *node);

  virtual void visit(Task_declaration_id *node);

  virtual void visit(Scope_or_if_res *node);

  virtual void visit(Tf_port_list_paren_opt *node);

  virtual void visit(Tf_port_list_opt *node);

  virtual void visit(Tf_item_or_statement_or_null *node);

  virtual void visit(Task_item *node);

  virtual void visit(Tf_item_or_statement_or_null_list *node);

  virtual void visit(Tf_item_or_statement_or_null_list_opt *node);

  virtual void visit(Array_reduction_method *node);

  virtual void visit(Array_locator_method *node);

  virtual void visit(Gatetype *node);

  virtual void visit(Primitive_gate_instance *node);

  virtual void visit(Primitive_gate_instance_list *node);

  virtual void visit(Switchtype *node);

  virtual void visit(Dr_strength1 *node);

  virtual void visit(Dr_strength0 *node);

  virtual void visit(Delay_scope *node);

  virtual void visit(Join_keyword *node);

  virtual void visit(Generate_case_item *node);

  virtual void visit(Function_return_type_and_id *node);

  virtual void visit(Tf_port_direction *node);

  virtual void visit(Tf_port_direction_opt *node);

  virtual void visit(Tf_port_item_expr_opt *node);

  virtual void visit(Tf_port_item *node);

  virtual void visit(Tf_port_list_item_last *node);

  virtual void visit(Tf_port_list_trailing_comma *node);

  virtual void visit(Tf_port_list *node);

  virtual void visit(Endfunction_label_opt *node);

  virtual void visit(Function_item_list *node);

  virtual void visit(Statement_or_null_list_opt *node);

  virtual void visit(Net_type_or_none *node);

  virtual void visit(Pull01 *node);

  virtual void visit(Macro_formal_parameter *node);

  virtual void visit(Macro_formals_list *node);

  virtual void visit(Tf_variable_identifier_first *node);

  virtual void visit(List_of_tf_variable_identifiers *node);

  virtual void visit(Tf_variable_identifier *node);

  virtual void visit(Tf_port_declaration *node);

  virtual void visit(Function_item *node);

  virtual void visit(Function_item_data_declaration *node);

  virtual void visit(Non_anonymous_instantiation_base *node);

  virtual void visit(Statement_or_null_list *node);

  virtual void visit(Tk_octbase *node);

  virtual void visit(Tk_octdigits *node);

  virtual void visit(Specify_terminal_descriptor *node);

  virtual void visit(Spec_reference_event *node);

  virtual void visit(Edge_descriptor_list *node);

  virtual void visit(Spec_notifier *node);

  virtual void visit(Spec_notifier_opt *node);

  virtual void visit(Specify_item *node);

  virtual void visit(Specify_simple_path_decl *node);

  virtual void visit(Specify_edge_path_decl *node);

  virtual void visit(Specparam_decl *node);

  virtual void visit(Specify_item_list *node);

  virtual void visit(Specify_path_identifiers *node);

  virtual void visit(Spec_polarity *node);

  virtual void visit(Specify_simple_path *node);

  virtual void visit(Delay_value_list *node);

  virtual void visit(Specify_item_list_opt *node);

  virtual void visit(Casting_type *node);

  virtual void visit(Polarity_operator *node);

  virtual void visit(Specify_edge_path *node);

  virtual void visit(Udp_port_list *node);

  virtual void visit(Udp_port_decl *node);

  virtual void visit(Udp_port_decls *node);

  virtual void visit(Udp_init_opt *node);

  virtual void visit(Udp_initial *node);

  virtual void visit(Udp_input_sym *node);

  virtual void visit(Udp_input_list *node);

  virtual void visit(Udp_output_sym *node);

  virtual void visit(Udp_sequ_entry *node);

  virtual void visit(Udp_sequ_entry_list *node);

  virtual void visit(Udp_entry_list *node);

  virtual void visit(Udp_comb_entry_list *node);

  virtual void visit(Udp_body *node);

  virtual void visit(Tk_reg_opt *node);

  virtual void visit(Udp_initial_expr_opt *node);

  virtual void visit(Udp_input_declaration_list *node);

  virtual void visit(Enum_name *node);

  virtual void visit(Pos_neg_number *node);

  virtual void visit(Enum_name_list_item_last *node);

  virtual void visit(Enum_name_list_trailing_comma *node);

  virtual void visit(Enum_name_list *node);

  virtual void visit(Action_block *node);

  virtual void visit(Simple_immediate_assertion_statement *node);

  virtual void visit(Immediate_assertion_statement *node);

  virtual void visit(Deferred_immediate_assertion_statement *node);

  virtual void visit(Var_opt *node);

  virtual void visit(Data_declaration_modifiers_opt *node);

  virtual void visit(Data_declaration_base *node);

  virtual void visit(Specparam *node);

  virtual void visit(Specparam_list *node);

  virtual void visit(Block_identifier_opt *node);

  virtual void visit(Event_control_opt *node);

  virtual void visit(Property_spec_disable_iff_opt *node);

  virtual void visit(Property_spec *node);

  virtual void visit(Assert_property_statement *node);

  virtual void visit(Concurrent_assertion_statement *node);

  virtual void visit(Assume_property_statement *node);

  virtual void visit(Cover_property_statement *node);

  virtual void visit(Concurrent_assertion_item *node);

  virtual void visit(Tk_virtual_opt *node);

  virtual void visit(Class_declaration_extends_opt *node);

  virtual void visit(Implements_interface_list_opt *node);

  virtual void visit(Variable_decl_assignment *node);

  virtual void visit(List_of_variable_decl_assignments *node);

  virtual void visit(Class_item *node);

  virtual void visit(Class_constructor *node);

  virtual void visit(Method_qualifier_list_opt *node);

  virtual void visit(Method_prototype *node);

  virtual void visit(Class_item_qualifier_list_opt *node);

  virtual void
  visit(Method_property_qualifier_list_not_starting_with_virtual *node);

  virtual void visit(Class_items *node);

  virtual void visit(Class_constructor_prototype *node);

  virtual void visit(Endnew_opt *node);

  virtual void visit(Class_items_opt *node);

  virtual void visit(Package_item *node);

  virtual void visit(Package_item_list *node);

  virtual void visit(Task_prototype *node);

  virtual void visit(Function_prototype *node);

  virtual void visit(Package_item_list_opt *node);

  virtual void visit(Select_dimensions_opt *node);

  virtual void visit(Hierarchy_segment *node);

  virtual void visit(Dpi_spec_string *node);

  virtual void visit(Dpi_import_property_opt *node);

  virtual void visit(Dpi_import_item *node);

  virtual void visit(Udp_comb_entry *node);

  virtual void visit(Tk_ls_eq *node);

  virtual void visit(Tk_rs_eq *node);

  virtual void visit(Tk_rss_eq *node);

  virtual void visit(Packed_signing_opt *node);

  virtual void visit(Random_qualifier_opt *node);

  virtual void
  visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node);

  virtual void
  visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node);

  virtual void visit(Struct_union_member *node);

  virtual void visit(Struct_union_member_list *node);

  virtual void visit(Tk_tagged_opt *node);

  virtual void visit(Assignment_pattern *node);

  virtual void visit(Structure_or_array_pattern_expression_list *node);

  virtual void visit(Structure_or_array_pattern_key *node);

  virtual void visit(Structure_or_array_pattern_expression *node);

  virtual void visit(Scope_prefix *node);

  virtual void visit(Package_import_item *node);

  virtual void visit(Package_import_item_list *node);

  virtual void visit(Tk_edge_descriptor *node);

  virtual void visit(Class_item_qualifier *node);

  virtual void visit(Property_qualifier *node);

  virtual void visit(Final_or_zero *node);

  virtual void visit(Stream_operator *node);

  virtual void visit(Slice_size_opt *node);

  virtual void visit(Stream_expression *node);

  virtual void visit(Stream_expression_list *node);

  virtual void visit(Identifier_opt *node);

  virtual void visit(Clocking_item_list_opt *node);

private:
};
#endif
