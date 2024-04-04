#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include "Visitor.h"
#include "AST.h"


class time_literal  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void time_literal::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_TimeLiteral  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_TimeLiteral::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_DecNumber  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_DecNumber::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class timescale_directive  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void timescale_directive::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_item_no_pp  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void package_item_no_pp::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class misc_directive  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void misc_directive::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_or_generate_item_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void package_or_generate_item_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void data_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_param_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void any_param_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class timeunits_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void timeunits_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class type_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void type_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_import_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void package_import_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class macro_call_or_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void macro_call_or_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class description  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void description::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_or_interface_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void module_or_interface_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class preprocessor_action  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void preprocessor_action::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_primitive  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void udp_primitive::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void package_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class description_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void description_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_start  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_start::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class lifetime_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void lifetime_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class lifetime  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void lifetime::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class GenericIdentifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void GenericIdentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class SymbolIdentifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void SymbolIdentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroIdentifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroIdentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class EscapedIdentifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void EscapedIdentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class KeywordIdentifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void KeywordIdentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class symbol_or_label  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void symbol_or_label::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_package_import_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_package_import_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_import_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void package_import_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_parameter_port_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_parameter_port_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_parameter_port_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void module_parameter_port_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_port_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_port_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_ports_or_port_declarations_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void list_of_ports_or_port_declarations_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_attribute_foreign_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_attribute_foreign_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class integer_vector_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void integer_vector_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class signed_unsigned_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void signed_unsigned_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class signing  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void signing::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_type_primitive_scalar  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_type_primitive_scalar::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class integer_atom_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void integer_atom_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class non_integer_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void non_integer_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class enum_data_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void enum_data_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class struct_data_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void struct_data_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class decl_dimensions_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void decl_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class decl_dimensions  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void decl_dimensions::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_type_primitive  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_type_primitive::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_type_base  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_type_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class reference  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void reference::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class instantiation_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void instantiation_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class trailing_decl_assignment_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void trailing_decl_assignment_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class trailing_decl_assignment  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void trailing_decl_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class non_anonymous_gate_instance_or_register_variable  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void non_anonymous_gate_instance_or_register_variable::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_port_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void any_port_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class non_anonymous_gate_instance_or_register_variable_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void non_anonymous_gate_instance_or_register_variable_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class gate_instance_or_register_variable  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void gate_instance_or_register_variable::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class instantiation_base  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void instantiation_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class reference_or_call_base  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void reference_or_call_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_declaration_or_module_instantiation  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_declaration_or_module_instantiation::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class const_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void const_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_or_generate_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_or_generate_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_common_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void module_common_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_override  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void parameter_override::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class gate_instantiation  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void gate_instantiation::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class non_port_module_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void non_port_module_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class generate_region  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void generate_region::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_block  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void specify_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_port_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void module_port_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_block  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void module_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_item_directive  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void module_item_directive::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_item_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class net_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void net_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class number  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void number::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class constant_dec_number  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void constant_dec_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class based_number  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_UnBasedNumber  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_UnBasedNumber::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expr_primary_no_groups  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expr_primary_no_groups::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_RealTime  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_RealTime::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class string_literal  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void string_literal::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class system_tf_call  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void system_tf_call::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class cast  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void cast::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroGenericItem  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroGenericItem::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expr_primary  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expr_primary::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expr_primary_parens  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void expr_primary_parens::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expr_primary_braces  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void expr_primary_braces::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assignment_pattern_expression  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void assignment_pattern_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class postfix_expression  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void postfix_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class reference_or_call  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void reference_or_call::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class inc_or_dec_or_primary_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void inc_or_dec_or_primary_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class inc_or_dec_expression  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void inc_or_dec_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class unary_prefix_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void unary_prefix_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class unary_op  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void unary_op::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class unary_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void unary_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class pow_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void pow_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class mul_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void mul_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class add_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void add_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class shift_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void shift_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class comp_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void comp_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class open_range_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void open_range_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class logeq_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void logeq_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class caseeq_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void caseeq_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class bitand_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void bitand_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class xor_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void xor_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class bitor_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void bitor_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class with_exprs_suffix  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void with_exprs_suffix::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class matches_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void matches_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class logand_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void logand_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class logor_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void logor_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class cond_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void cond_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expression  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class equiv_impl_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void equiv_impl_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class decl_variable_dimension  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void decl_variable_dimension::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expression_or_null_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void expression_or_null_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay3_or_drive_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void delay3_or_drive_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay3  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void delay3::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_type_or_implicit  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_type_or_implicit::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class net_variable  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void net_variable::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class net_variable_or_decl_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void net_variable_or_decl_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class net_decl_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void net_decl_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class net_variable_or_decl_assigns  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void net_variable_or_decl_assigns::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class net_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void net_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class charge_strength_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void charge_strength_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay3_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void delay3_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_identifiers  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void list_of_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class task_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void task_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class function_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void function_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void class_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dpi_import_export  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void dpi_import_export::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specparam_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void specparam_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assertion_item_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void assertion_item_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_or_generate_item_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_or_generate_item_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class genvar_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void genvar_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class clocking_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void clocking_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class initial_construct  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void initial_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class always_construct  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void always_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class continuous_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void continuous_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class loop_generate_construct  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void loop_generate_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class conditional_generate_construct  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void conditional_generate_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assertion_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void assertion_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class final_construct  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void final_construct::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_value_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_value_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameters  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void parameters::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class unqualified_id  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void unqualified_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_id  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void class_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class qualified_id  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void qualified_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class type_or_id_root  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void type_or_id_root::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class implicit_class_handle  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void implicit_class_handle::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class local_root  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void local_root::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class select_variable_dimension  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void select_variable_dimension::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class hierarchy_extension  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void hierarchy_extension::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroCall  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroCall::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class member_name  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void member_name::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class builtin_array_method  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void builtin_array_method::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_named  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void port_named::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_port  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void any_port::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_port_list_item_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void any_port_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_port_list_trailing_comma  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void any_port_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_port_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void any_port_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class label_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void label_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class begin  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void begin::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class lpvalue  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void lpvalue::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class range_list_in_braces  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void range_list_in_braces::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assignment_statement_no_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void assignment_statement_no_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assign_modify_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void assign_modify_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assignment_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void assignment_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class statement_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void statement_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class procedural_timing_control_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void procedural_timing_control_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class subroutine_call  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void subroutine_call::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class seq_block  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void seq_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class nonblocking_assignment  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void nonblocking_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class conditional_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void conditional_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class case_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void case_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class loop_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void loop_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class procedural_continuous_assignment  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void procedural_continuous_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class blocking_assignment  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void blocking_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class par_block  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void par_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class wait_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void wait_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class procedural_assertion_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void procedural_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class event_trigger  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void event_trigger::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class disable_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void disable_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class jump_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void jump_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class block_item_or_statement_or_null  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void block_item_or_statement_or_null::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class block_item_decl  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void block_item_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class block_item_or_statement_or_null_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void block_item_or_statement_or_null_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay_value_simple  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void delay_value_simple::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay_identifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void delay_identifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay1  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void delay1::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay_value  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void delay_value::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class statement_or_null  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void statement_or_null::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class event_control  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void event_control::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class cycle_delay  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void cycle_delay::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class SystemTFIdentifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void SystemTFIdentifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class call_base  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void call_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class block_item_or_statement_or_null_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void block_item_or_statement_or_null_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class end  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void end::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class always_any  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void always_any::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_item_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_end  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_end::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class source_text  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void source_text::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_reference  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void port_reference::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_expression  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void port_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_reference_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void port_reference_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class trailing_assign_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void trailing_assign_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class trailing_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void trailing_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void port::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_expression_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void port_expression_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_or_port_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void port_or_port_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void port_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_ports_or_port_declarations_item_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void list_of_ports_or_port_declarations_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_ports_or_port_declarations_trailing_comma  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void list_of_ports_or_port_declarations_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_ports_or_port_declarations  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void list_of_ports_or_port_declarations::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_ports_or_port_declarations_preprocessor_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void list_of_ports_or_port_declarations_preprocessor_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dir  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void dir::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class var_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void var_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_port_identifiers  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void list_of_port_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_direction  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void port_direction::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_module_item_identifiers  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void list_of_module_item_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_identifiers_unpacked_dimensions  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void list_of_identifiers_unpacked_dimensions::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_net_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void port_net_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class identifier_optional_unpacked_dimensions  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void identifier_optional_unpacked_dimensions::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class drive_strength_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void drive_strength_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class drive_strength  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void drive_strength::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class cont_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void cont_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class cont_assign_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void cont_assign_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class edge_operator  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void edge_operator::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class event_expression  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void event_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class event_expression_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void event_expression_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class hierarchy_event_identifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void hierarchy_event_identifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class unique_priority_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void unique_priority_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expression_in_parens  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expression_in_parens::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay_or_event_control_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void delay_or_event_control_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay_or_event_control  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void delay_or_event_control::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expression_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expression_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class bit_logic_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void bit_logic_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class bit_logic  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void bit_logic::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class param_type_followed_by_id_and_dimensions_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void param_type_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_value_ranges_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_value_ranges_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_assign_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_assign_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class localparam_assign_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void localparam_assign_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class type_assignment_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void type_assignment_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroNumericWidth  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroNumericWidth::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class hex_based_number  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void hex_based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_HexBase  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_HexBase::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_HexDigits  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_HexDigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dec_based_number  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void dec_based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class bin_based_number  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void bin_based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class oct_based_number  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void oct_based_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_DecBase  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_DecBase::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_DecDigits  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_DecDigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_XZDigits  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_XZDigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class case_any  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void case_any::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expression_list_proper  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expression_list_proper::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class case_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void case_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class preprocessor_directive  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void preprocessor_directive::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class case_items  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void case_items::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_BinBase  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_BinBase::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_BinDigits  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_BinDigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dist_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void dist_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expression_or_dist  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expression_or_dist::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class boolean_abbrev_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void boolean_abbrev_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_repetition_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_repetition_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_expr_primary  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_expr_primary::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_delay_repetition_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_delay_repetition_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_delay_range_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_delay_range_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_throughout_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_throughout_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_within_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_within_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_intersect_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_intersect_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_unary_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_unary_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_and_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_and_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_or_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_or_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class simple_sequence_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void simple_sequence_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_if_else_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_if_else_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_prefix_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_prefix_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_implication_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_implication_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class sequence_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void sequence_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_expr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_expr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_expr_or_assignment  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_expr_or_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_expr_or_assignment_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_expr_or_assignment_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expr_mintypmax_generalized  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expr_mintypmax_generalized::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expr_mintypmax_trans_set  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expr_mintypmax_trans_set::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class expr_mintypmax  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void expr_mintypmax::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class value_range  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void value_range::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class streaming_concatenation  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void streaming_concatenation::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class genvar_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void genvar_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class for_step  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void for_step::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class for_step_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void for_step_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class generate_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void generate_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class generate_block  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void generate_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class generate_item_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void generate_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class generate_item_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void generate_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class for_init_decl_or_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void for_init_decl_or_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class for_initialization  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void for_initialization::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class for_initialization_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void for_initialization_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class repeat_control  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void repeat_control::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_StringLiteral  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_StringLiteral::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class preprocess_include_argument  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void preprocess_include_argument::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class PP_Identifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void PP_Identifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class macro_formals_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void macro_formals_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_expr_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_expr_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_value_byname_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void parameter_value_byname_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_parameter_port  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_parameter_port::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class type_assignment  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void type_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_parameter_port_list_item_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void module_parameter_port_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_parameter_port_list_trailing_comma  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void module_parameter_port_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class module_parameter_port_list_preprocessor_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void module_parameter_port_list_preprocessor_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_value_byname  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_value_byname::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_value_byname_list_item_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void parameter_value_byname_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class parameter_value_byname_list_trailing_comma  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void parameter_value_byname_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class generate_if  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void generate_if::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class generate_case_items  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void generate_case_items::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_new  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void class_new::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dynamic_array_new  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void dynamic_array_new::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_argument  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void any_argument::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_argument_list_item_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void any_argument_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_argument_list_trailing_comma  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void any_argument_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class any_argument_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void any_argument_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class argument_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void argument_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class task_declaration_id  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void task_declaration_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class scope_or_if_res  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void scope_or_if_res::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_list_paren_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_port_list_paren_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void tf_port_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_item_or_statement_or_null  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_item_or_statement_or_null::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class task_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void task_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_item_or_statement_or_null_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_item_or_statement_or_null_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_item_or_statement_or_null_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_item_or_statement_or_null_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class var_or_net_type_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void var_or_net_type_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_type_or_implicit_basic_followed_by_id_and_dimensions_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_type_or_implicit_basic_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class port_declaration_noattr  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void port_declaration_noattr::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class type_identifier_followed_by_id  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void type_identifier_followed_by_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class localparam_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void localparam_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class defparam_assign  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void defparam_assign::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class defparam_assign_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void defparam_assign_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class array_reduction_method  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void array_reduction_method::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class array_locator_method  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void array_locator_method::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class array_ordering_method  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void array_ordering_method::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class gatetype  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void gatetype::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class primitive_gate_instance  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void primitive_gate_instance::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class primitive_gate_instance_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void primitive_gate_instance_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class switchtype  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void switchtype::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dr_strength1  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void dr_strength1::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dr_strength0  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void dr_strength0::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay_scope  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void delay_scope::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_direction  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_port_direction::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_direction_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_port_direction_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_item_expr_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_port_item_expr_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_port_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_list_item_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_port_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_list_trailing_comma  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void tf_port_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_port_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class join_keyword  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void join_keyword::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class generate_case_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void generate_case_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class function_return_type_and_id  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void function_return_type_and_id::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class endfunction_label_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void endfunction_label_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class function_item_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void function_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class statement_or_null_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void statement_or_null_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class net_type_or_none  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void net_type_or_none::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class pull01  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void pull01::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class macro_formal_parameter  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void macro_formal_parameter::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class macro_formals_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void macro_formals_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class macro_arg_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void macro_arg_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroArg  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroArg::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class macro_args_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void macro_args_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroCallId  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroCallId::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_variable_identifier_first  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_variable_identifier_first::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_tf_variable_identifiers  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void list_of_tf_variable_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_variable_identifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void tf_variable_identifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class tf_port_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void tf_port_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class function_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void function_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class function_item_data_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void function_item_data_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class non_anonymous_instantiation_base  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void non_anonymous_instantiation_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class statement_or_null_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void statement_or_null_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_OctBase  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_OctBase::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_OctDigits  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_OctDigits::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_terminal_descriptor  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void specify_terminal_descriptor::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class spec_reference_event  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void spec_reference_event::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class edge_descriptor_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void edge_descriptor_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class spec_notifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void spec_notifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class spec_notifier_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void spec_notifier_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void specify_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_simple_path_decl  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void specify_simple_path_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_edge_path_decl  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void specify_edge_path_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specparam_decl  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void specparam_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_item_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void specify_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_path_identifiers  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void specify_path_identifiers::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class spec_polarity  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void spec_polarity::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_simple_path  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void specify_simple_path::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class delay_value_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void delay_value_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_item_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void specify_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class casting_type  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void casting_type::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class polarity_operator  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void polarity_operator::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specify_edge_path  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void specify_edge_path::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_port_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_port_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_port_decl  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_port_decl::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_port_decls  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_port_decls::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_init_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_init_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_initial  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void udp_initial::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_input_sym  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_input_sym::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_input_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_input_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_output_sym  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_output_sym::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_sequ_entry  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_sequ_entry::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_sequ_entry_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_sequ_entry_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_entry_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_entry_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_comb_entry_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void udp_comb_entry_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_body  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_body::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_reg_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_reg_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_initial_expr_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void udp_initial_expr_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_input_declaration_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void udp_input_declaration_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class enum_name  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void enum_name::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class pos_neg_number  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void pos_neg_number::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class enum_name_list_item_last  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void enum_name_list_item_last::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class enum_name_list_trailing_comma  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void enum_name_list_trailing_comma::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class enum_name_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void enum_name_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class action_block  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void action_block::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class simple_immediate_assertion_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void simple_immediate_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class immediate_assertion_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void immediate_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class deferred_immediate_assertion_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void deferred_immediate_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class udp_comb_entry  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void udp_comb_entry::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class specparam_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void specparam_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroIdItem  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroIdItem::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroCallItem  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroCallItem::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class var_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void var_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_declaration_modifiers_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_declaration_modifiers_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_declaration_base  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_declaration_base::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class block_identifier_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void block_identifier_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class event_control_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void event_control_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_spec_disable_iff_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_spec_disable_iff_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_spec  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_spec::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assert_property_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void assert_property_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class concurrent_assertion_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void concurrent_assertion_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assume_property_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void assume_property_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class cover_property_statement  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void cover_property_statement::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class concurrent_assertion_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void concurrent_assertion_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class MacroCallCloseToEndLine  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void MacroCallCloseToEndLine::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_virtual_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void TK_virtual_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_declaration_extends_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void class_declaration_extends_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class implements_interface_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void implements_interface_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class variable_decl_assignment  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void variable_decl_assignment::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class list_of_variable_decl_assignments  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void list_of_variable_decl_assignments::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void class_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_constructor  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void class_constructor::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class method_qualifier_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void method_qualifier_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class method_prototype  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void method_prototype::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_item_qualifier_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void class_item_qualifier_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class method_property_qualifier_list_not_starting_with_virtual  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void method_property_qualifier_list_not_starting_with_virtual::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_items  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void class_items::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_constructor_prototype  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void class_constructor_prototype::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class endnew_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void endnew_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_items_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void class_items_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void package_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_item_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void package_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class task_prototype  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void task_prototype::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class function_prototype  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void function_prototype::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_item_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void package_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class select_dimensions_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void select_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class hierarchy_segment  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void hierarchy_segment::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dpi_spec_string  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void dpi_spec_string::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dpi_import_property_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void dpi_import_property_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class dpi_import_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void dpi_import_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_LS_EQ  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_LS_EQ::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_RS_EQ  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_RS_EQ::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_RSS_EQ  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_RSS_EQ::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class packed_signing_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void packed_signing_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class random_qualifier_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void random_qualifier_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class data_type_or_implicit_followed_by_id_and_dimensions_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void data_type_or_implicit_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class type_identifier_or_implicit_followed_by_id_and_dimensions_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void type_identifier_or_implicit_followed_by_id_and_dimensions_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class struct_union_member  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void struct_union_member::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class struct_union_member_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void struct_union_member_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_tagged_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_tagged_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class assignment_pattern  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void assignment_pattern::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class structure_or_array_pattern_expression_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void structure_or_array_pattern_expression_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class structure_or_array_pattern_key  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void structure_or_array_pattern_key::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class structure_or_array_pattern_expression  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void structure_or_array_pattern_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class scope_prefix  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void scope_prefix::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_import_item  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void package_import_item::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class package_import_item_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void package_import_item_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class TK_edge_descriptor  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void TK_edge_descriptor::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class class_item_qualifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void class_item_qualifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_qualifier  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_qualifier::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class final_or_zero  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void final_or_zero::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_port_list_in_parens_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_port_list_in_parens_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class optional_semicolon  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void optional_semicolon::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class stream_operator  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void stream_operator::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class slice_size_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void slice_size_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class stream_expression  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void stream_expression::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class stream_expression_list  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void stream_expression_list::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class preprocessor_balanced_port_declarations  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void preprocessor_balanced_port_declarations::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class property_declaration  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void property_declaration::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class identifier_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void identifier_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class clocking_item_list_opt  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
};


virtual void clocking_item_list_opt::accept(Visitor &visitor)
{
	visitor.visit(this);
}



class Node  : public 
{
public:
	virtual void accept(Visitor &visitor) = 0;
	
	
private:
	std::vector<std::shared_ptr<Node>> children;
	
};




class Terminal  : public Node
{
public:
	virtual void accept(Visitor &visitor);
	
	
private:
	string element;
	
};


virtual void Terminal::accept(Visitor &visitor)
{
	visitor.visit(this);
}



