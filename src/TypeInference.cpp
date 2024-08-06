#include "TypeInference.h"


std::string TypeInferenceVisitor::freshType(){
    return "TV_" + std::to_string(this->typeCounter++);
}

constraintSet TypeInferenceVisitor::visit(Node *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Terminal *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_delay_range_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port *node, std::string& type){
    auto t = freshType();

    constraintSet constraintsPortExpression;
    constraintSet constraintsTrailingAssignOpt;
    if(node->getChildren().size() == 2){
        constraintsPortExpression = applyVisit(node->getChildren()[0].get(), t);
        constraintsTrailingAssignOpt = applyVisit(node->getChildren()[1].get(), t);
        constraintsPortExpression.insert(constraintsTrailingAssignOpt.begin(), constraintsTrailingAssignOpt.end());
        return constraintsPortExpression;
    }
    else{
        return applyVisit(node->getChildren()[3].get(), t);
    }
}

constraintSet TypeInferenceVisitor::visit(Specify_simple_path *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Event_control *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(String_literal *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Charge_strength_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dpi_import_export *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(For_initialization_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_port_identifiers *node, std::string& type){

    if(node->getChildren().size() > 1){
        if( node->getChildren()[1]->getElement() == " = "){
            auto constraintsGenericIdentifier = applyVisit(node->getChildren()[0].get(), type);
            auto constraintsExpression = applyVisit(node->getChildren()[2].get(), type);

            constraintsGenericIdentifier.insert(constraintsExpression.begin(), constraintsExpression.end());

            return constraintsGenericIdentifier;
        }else{
            auto constraintsListOfPortIdentifiers = applyVisit(node->getChildren()[1].get(), type);
            auto constraintsGenericIdentifier = applyVisit(node->getChildren()[2].get(), type);
            
            constraintsListOfPortIdentifiers.insert(constraintsGenericIdentifier.begin(), constraintsGenericIdentifier.end());

            return constraintsListOfPortIdentifiers;
        }
    }else{
        return applyVisit(node->getChildren()[0].get());
    }
}

constraintSet TypeInferenceVisitor::visit(Non_integer_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_value_ranges_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_item_no_pp *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_delay_repetition_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Add_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dpi_import_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_realtime *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Case_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_if_else_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Non_anonymous_instantiation_base *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Unary_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Unary_op *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_id *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Reference *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Cast *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_variable_identifier_first *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
        *node, std::string& type){};

constraintSet TypeInferenceVisitor::visit(Type_or_id_root *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_or_generate_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port_list_trailing_comma *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Instantiation_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameters *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Reference_or_call_base *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Param_type_followed_by_id_and_dimensions_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Structure_or_array_pattern_key *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_assign_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Defparam_assign_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Generate_item_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_octdigits *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_expr_primary *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Lpvalue *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Label_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Escapedidentifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Generate_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_type_primitive *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Spec_reference_event *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_input_declaration_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Non_port_module_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_trailing_comma_non_ansi *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_prefix_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expr_primary_braces *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Pow_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(For_init_decl_or_assign *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_initial *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_list_paren_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Struct_data_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_sequ_entry *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Net_variable_or_decl_assign *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_value_byname_list_trailing_comma *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Inc_or_dec_expression *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Net_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Select_dimensions_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Spec_polarity *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Macro_formal_parameter *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Structure_or_array_pattern_expression *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(For_step *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specparam_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_binbase *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_stringliteral *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Var_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Identifier_optional_unpacked_dimensions *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Function_item_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Type_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_body *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Mul_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Par_block *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Keywordidentifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Logeq_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_common_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Primitive_gate_instance *node, std::string& type){
    auto t = freshType();

    if(node->getChildren().size() == 3){
        
        std::string x("anonymous gate");
        
        auto constraintsAnyPortList = applyVisit(node->getChildren()[1].get(), t);
        constraintsAnyPortList.insert({type, x});

        return constraintsAnyPortList;
    }else{
        std::string x("gate");
        std::string y("integer");
        auto constraintsGenericIdentifier = applyVisit(node->getChildren()[0].get(), x);
        auto constraintsDeclDimensions = applyVisit(node->getChildren()[1].get(), y);
        auto constraintsAnyPortList = applyVisit(node->getChildren()[3].get(), t);

        constraintsGenericIdentifier.insert(constraintsDeclDimensions.begin(), constraintsDeclDimensions.end());
        constraintsGenericIdentifier.insert(constraintsAnyPortList.begin(), constraintsAnyPortList.end());

        return constraintsGenericIdentifier;
    }
}

constraintSet TypeInferenceVisitor::visit(Data_type_or_implicit *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_octbase *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_hexbase *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Seq_block *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Task_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_block *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_decnumber *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_decbase *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_implication_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Bit_logic_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Integer_atom_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Lifetime *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_argument_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay_value_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_port_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Jump_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay_value *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_or_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_attribute_foreign_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_direction_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_item_expr_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Cont_assign_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_argument_list_trailing_comma *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Procedural_continuous_assignment *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expression_or_dist *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_start *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expr_primary_parens *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Open_range_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Unary_prefix_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay_identifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_identifiers_unpacked_dimensions *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay_scope *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Action_block *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Trailing_assign_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Enum_name_list_trailing_comma *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_port_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Equiv_impl_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_new *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_net_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Unqualified_id *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Begin *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(System_tf_call *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_value_byname_list_item_last *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Conditional_generate_construct *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Timescale_directive *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_expression *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_sequ_entry_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Symbol_or_label *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Simple_sequence_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Systemtfidentifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_unbasednumber *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Decl_dimensions_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_items_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Enum_name *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_value_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_edge_path *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Implicit_class_handle *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Statement_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Type_identifier_followed_by_id *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Method_prototype *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Block_item_or_statement_or_null_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Endnew_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_item_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_simple_path_decl *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_rs_eq *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_import_item_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_port_decl *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(With_exprs_suffix *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Generate_region *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Call_base *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Array_locator_method *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_declaration_ansi *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Bitand_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Range_list_in_braces *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port_list_item_last *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Hex_based_number *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Hierarchy_event_identifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_variable_decl_assignments *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Random_qualifier_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Drive_strength_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_timeliteral *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Value_range *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expr_mintypmax_generalized *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Polarity_operator *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(For_initialization *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Enum_data_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Blocking_assignment *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay1 *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Based_number *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Procedural_timing_control_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Block_item_decl *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Net_variable_or_decl_assigns *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Time_literal *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Function_item_data_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Decl_variable_dimension *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Endfunction_label_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Qualified_id *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Immediate_assertion_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Join_keyword *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_bindigits *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Event_trigger *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dynamic_array_new *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Matches_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_reference_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Array_reduction_method *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Builtin_array_method *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Assignment_pattern_expression *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Drive_strength *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_declaration_non_ansi *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Var_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_item_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Genericidentifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_item_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_item_last_ansi *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_type_or_implicit_followed_by_id_and_dimensions_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Xor_expr *node, std::string& type) {
    const auto& children = node->getChildren();
    std::string t = "scalar";
    if (children.size() == 1) {
        auto constraintsBitAndExpr = applyVisit(children[0].get(), t);
        constraintsBitAndExpr.insert({t, type});
        return constraintsBitAndExpr;
    } else {
        auto constraintsXorExpr = applyVisit(children[0].get(), t);
        auto constraintsBitAndExpr = applyVisit(children[2].get(), t);
        constraintsXorExpr.insert(constraintsBitAndExpr.begin(), constraintsBitAndExpr.end());
        constraintsXorExpr.insert({t, type});

        return constraintsXorExpr;
    }
}

constraintSet TypeInferenceVisitor::visit(Dec_based_number *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Loop_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_declaration_or_module_instantiation *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_comb_entry_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Bit_logic *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Reference_or_call *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Local_root *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_direction *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Variable_decl_assignment *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_edge_path_decl *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Function_prototype *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_within_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expr_primary_no_groups *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_value_byname *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Case_any *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Spec_notifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Block_item_or_statement_or_null *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_param_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_list_trailing_comma *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Struct_union_member *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_port_list_positional *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dir *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Lifetime_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_identifiers *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Edge_operator *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_virtual_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Timeunits_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_item_or_statement_or_null *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_import_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expr_primary *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Signed_unsigned_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Non_anonymous_gate_instance_or_register_variable_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_comb_entry *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay3 *node, std::string& type){
    auto t = freshType();
    
    constraintSet d;
    std::string x("const scalar");
    if(node->getChildren().size() == 2){
        
        d = applyVisit(node->getChildren()[1].get(), x);
        
    }else if(node->getChildren().size() >= 4){
        d = applyVisit(node->getChildren()[2].get(), x);

        if(node->getChildren().size() > 4){
            auto d1 = applyVisit(node->getChildren()[4].get(), x);
            d.insert(d1.begin(), d1.end());
        }
        
    }
    return d;
}

constraintSet TypeInferenceVisitor::visit(Inc_or_dec_or_primary_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Procedural_assertion_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Struct_union_member_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Comp_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Postfix_expression *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Symbolidentifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_input_sym *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Pos_neg_number *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_terminal_descriptor *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Select_variable_dimension *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_ansi *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Generate_case_items *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_type_primitive_scalar *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_item_or_statement_or_null_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Conditional_statement *node , std::string& type){
    
    auto t = freshType();

    auto constraintsUniquePriorityOpt = applyVisit(node->getChildren()[0].get(), t);
    std::string x("scalar");
    auto constraintsExpressionInParens = applyVisit(node->getChildren()[2].get(),x);
    constraintsUniquePriorityOpt.insert(constraintsExpressionInParens.begin(), constraintsExpressionInParens.end());
    auto constraintsStatement =  applyVisit(node->getChildren()[3].get(), t);
    constraintsUniquePriorityOpt.insert(constraintsStatement.begin(), constraintsStatement.end());

    if(node->getChildren().size() > 4){
        auto constraintsStatementElse =  applyVisit(node->getChildren()[5].get(), t);
    constraintsUniquePriorityOpt.insert(constraintsStatementElse.begin(), constraintsStatementElse.end());
    }

    return constraintsUniquePriorityOpt;
}

constraintSet TypeInferenceVisitor::visit(Specparam_decl *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_non_ansi *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Statement_or_null_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Task_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_declaration_base *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_port_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Macronumericwidth *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Trailing_decl_assignment_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Gate_instance_or_register_variable *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Bind_instantiation *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_import_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_package_import_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Structure_or_array_pattern_expression_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Event_expression_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_rss_eq *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Implements_interface_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay3_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expr_mintypmax_trans_set *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Statement_or_null *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Enum_name_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_unary_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Pp_identifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Shift_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Oct_based_number *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Hierarchy_segment *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Nonblocking_assignment *node, std::string& type){
    auto t = freshType();

    auto constraintsLpvalue = applyVisit(node->getChildren()[0].get(), t);
    auto constraintsExpression = applyVisit(node->getChildren()[3].get(), t);

    constraintsLpvalue.insert(constraintsExpression.begin(), constraintsExpression.end());

    return constraintsLpvalue;

}

constraintSet TypeInferenceVisitor::visit(Expression_list_proper *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Generate_if *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Function_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Scope_prefix *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Primitive_gate_instance_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Simple_immediate_assertion_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Description_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dr_strength0 *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Unique_priority_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specparam *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_expression_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Cond_expr *node, std::string& type) {
    const auto& children = node->getChildren();
    if (children.size() == 1) {
        return applyVisit(children[0].get(), type);
    } else {
        std::string s = "scalar";
        auto constraintsLogOrExpr = applyVisit(children[0].get(), s);

        auto t = this->freshType();
        auto constraintsExpression = applyVisit(children[2].get(), t);
        auto constraintsCondExpr = applyVisit(children[4].get(), t); 

        constraintsLogOrExpr.insert(constraintsExpression.begin(), constraintsExpression.end());
        constraintsLogOrExpr.insert(constraintsCondExpr.begin(), constraintsCondExpr.end());
        constraintsLogOrExpr.insert({t, type});

        return constraintsLogOrExpr;
    }
}

constraintSet TypeInferenceVisitor::visit(Tk_reg_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Logor_expr *node, std::string& type) {
    const auto& children = node->getChildren();
    std::string t = "scalar";
    if (children.size() == 1) {
        auto constraintsLogAndExpr = applyVisit(children[0].get(), t);
        constraintsLogAndExpr.insert({t, type});
        return ;
    } else {
        auto constraintsLogOrExpr = applyVisit(children[0].get(), t);
        auto constraintsLogAndExpr = applyVisit(children[2].get(), t);
        constraintsLogOrExpr.insert(constraintsLogAndExpr.begin(), constraintsLogAndExpr.end());
        constraintsLogOrExpr.insert({t, type});

        return constraintsLogOrExpr;
    }
}

constraintSet TypeInferenceVisitor::visit(Delay3_or_drive_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_item_or_statement_or_null_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Net_decl_assign *node, std::string& type){
    auto t = freshType();

    auto constraintsGenericIdentifier = applyVisit(node->getChildren()[0].get(), t);
    auto constraintsExpression = applyVisit(node->getChildren()[2].get(), t);

    constraintsGenericIdentifier.insert(constraintsExpression.begin(), constraintsExpression.end());

    return constraintsGenericIdentifier;

}

constraintSet TypeInferenceVisitor::visit(Always_any *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_tf_variable_identifiers *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Var_or_net_type_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_list_item_last *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Task_declaration_id *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Instantiation_base *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_repetition_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_hexdigits *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Non_anonymous_gate_instance_or_register_variable *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Localparam_assign *node, std::string& type){
    std::string x("const scalar");
    auto constraintsGenericIdentifier = applyVisit(node->getChildren()[0].get(), x);
    auto constraintsExpression = applyVisit(node->getChildren()[2].get(), x);
    constraintsGenericIdentifier.insert(constraintsExpression.begin(), constraintsExpression.end());

    return constraintsGenericIdentifier;
}

constraintSet TypeInferenceVisitor::visit(Class_items *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expression_in_parens *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_trailing_comma_ansi *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_reference *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dist_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Caseeq_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Generate_block *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_item_last_non_ansi *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_argument_list_item_last *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Gate_instantiation *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Casting_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expr_mintypmax *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Continuous_assign *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_assign *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay_value_simple *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Switchtype *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_or_generate_item_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Bin_based_number *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Loop_generate_construct *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_override *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_primitive *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Repeat_control *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Packed_signing_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expression_or_null_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Enum_name_list_item_last *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Macro_formals_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Spec_notifier_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Hierarchy_extension *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Generate_item_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_declaration_modifiers_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_throughout_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_expr_or_assignment_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Bitor_expr *node, std::string& type) {
    const auto& children = node->getChildren();
    std::string t = "scalar";
    if (children.size() == 1) {
        auto constraintsXorExpr = applyVisit(children[0].get(), t);
        constraintsXorExpr.insert({t, type});
        return constraintsXorExpr;
    } else {
        auto constraintsBitOrExpr = applyVisit(children[0].get(), t);
        auto constraintsXorExpr = applyVisit(children[2].get(), t);
        constraintsBitOrExpr.insert(constraintsXorExpr.begin(), constraintsXorExpr.end());
        constraintsBitOrExpr.insert({t, type});
        return constraintsBitOrExpr;
    }
}

constraintSet TypeInferenceVisitor::visit(Tf_port_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_port_list_trailing_comma_named *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Function_return_type_and_id *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dr_strength1 *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Assign_modify_statement *node, std::string& type) {
    const auto& children = node->getChildren();
    auto t = this->freshType();
    auto constraintsLpValue = applyVisit(children[0].get(), t);
    std::string s = "scalar";
    auto constraintsExpression = applyVisit(children[2].get(), s);
    
    constraintsLpValue.insert(constraintsExpression.begin(), constraintsExpression.end());
    return constraintsLpValue;
}

constraintSet TypeInferenceVisitor::visit(Udp_port_decls *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Integer_vector_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Assignment_pattern *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_constructor *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_or_generate_item_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Final_construct *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Member_name *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_import_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Signing *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_constructor_prototype *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Generate_case_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expression *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Cont_assign *node, std::string& type){
    auto f = freshType();
    auto constraintsLpvalue = applyVisit(node->getChildren()[0].get(), f);
    auto constraintsExpression = applyVisit(node->getChildren()[2].get(), f);
    constraintsLpvalue.insert(constraintsExpression.begin(), constraintsExpression.end());
    return constraintsLpvalue;
}

constraintSet TypeInferenceVisitor::visit(Delay_or_event_control_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Bind_directive *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Misc_directive *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_initial_expr_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Description *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_type_base *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Trailing_assign *node, std::string& type){
    auto t = this->freshType();

    auto constraintsParameterExpr = applyVisit(node->getChildren()[1].get(), type);
    auto constraintsParameterValueRangesOpt = applyVisit(node->getChildren()[2].get(), t);
    constraintsParameterExpr.insert(constraintsParameterValueRangesOpt.begin(), constraintsParameterValueRangesOpt.end());
    return constraintsParameterExpr;
}

constraintSet TypeInferenceVisitor::visit(Module_end *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Wait_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Package_item_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Case_items *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Statement_or_null_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Port_named *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_output_sym *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Assignment_statement_no_expr *node, std::string& type) {
    const auto& children = node->getChildren();
    if (children.size() == 1) {
        return applyVisit(children[0].get(), type);
    } else {
        auto t = this->freshType();
        auto constraintsLpValue = applyVisit(children[0].get(), t);
        auto constraintsExpression = applyVisit(children[2].get(), t);
        constraintsLpValue.insert(constraintsExpression.begin(), constraintsExpression.end());
        return constraintsLpValue;
    }
}

constraintSet TypeInferenceVisitor::visit(Any_port_list_item_last_positional *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_item_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_and_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Data_type *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Argument_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(For_step_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Sequence_intersect_expr *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Function_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Net_type_or_none *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_declaration_extends_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Boolean_abbrev_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_path_identifiers *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_direction *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_decdigits *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(End *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Net_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_tagged_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_xzdigits *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Gatetype *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Preprocess_include_argument *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Macro_formals_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Const_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Logand_expr *node, std::string& type) {
    const auto& children = node->getChildren();
    std::string t = "scalar";
    if (children.size() == 1) {
        auto constraintsMatchesExpr = applyVisit(children[0].get(), t);
        constraintsMatchesExpr.insert({t, type});
        return constraintsMatchesExpr;
    } else {
        auto constraintsLogAndExpr = applyVisit(children[0].get(), t);
        auto constraintsBitOrExpr = applyVisit(children[2].get(), t);
        constraintsLogAndExpr.insert(constraintsBitOrExpr.begin(), constraintsBitOrExpr.end());
        constraintsLogAndExpr.insert({t, type});

        return constraintsLogAndExpr;
    }
}

constraintSet TypeInferenceVisitor::visit(Event_expression *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_entry_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Preprocessor_action *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_port_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_init_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Source_text *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Defparam_assign *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Decl_dimensions *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Constant_dec_number *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Case_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Assignment_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dpi_import_property_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Dpi_spec_string *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Trailing_decl_assignment *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Always_construct *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Genvar_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_port_list_named *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Subroutine_call *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_expr_or_assignment *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_argument *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_or_interface_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Expression_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Gate_instance_or_register_variable_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_evalstringliteral *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Delay_or_event_control *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Udp_input_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_value_byname_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_port_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_ports_or_port_declarations_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_port_list_trailing_comma_positional *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Block_item_or_statement_or_null_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Genvar_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Number *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specify_item_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_ls_eq *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tf_variable_identifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Initial_construct *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Localparam_assign_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Disable_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(List_of_module_item_identifiers *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Any_port_list_item_last_named *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Net_variable *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Parameter_expr_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Specparam_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Deferred_immediate_assertion_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Slice_size_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Concurrent_assertion_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Clocking_item_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Cycle_delay *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Macroiditem *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Assume_property_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Pull01 *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Preprocessor_directive *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_item_directive *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Assert_property_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Scope_or_if_res *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Task_prototype *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Clocking_declaration *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Block_identifier_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Macroidentifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_spec_disable_iff_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Macrogenericitem *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_block *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Stream_expression *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Final_or_zero *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Tk_edge_descriptor *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Method_property_qualifier_list_not_starting_with_virtual*node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Identifier_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Module_parameter_port_list_preprocessor_last *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Type_assignment *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Type_assignment_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Method_qualifier_list_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Stream_operator *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Assertion_item *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_spec *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Streaming_concatenation *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Edge_descriptor_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Property_qualifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Event_control_opt *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_item_qualifier *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Concurrent_assertion_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Cover_property_statement *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Stream_expression_list *node, std::string& type){}

constraintSet TypeInferenceVisitor::visit(Class_item_qualifier_list_opt *node, std::string& type){}
