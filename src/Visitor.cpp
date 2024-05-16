#include "Visitor.h"
#include "AST.h"

void CodeGenVisitor::visit(Node *node) {
  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Trailing_decl_assignment_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_port_list_trailing_comma *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_items_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Function_item_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_named *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Statement_or_null_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_declaration_extends_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_port *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_item_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Implements_interface_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Block_identifier_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_tf_variable_identifiers *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_direction_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_variable_identifier_first *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Assert_property_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Concurrent_assertion_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_list_trailing_comma *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Member_name *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_item_expr_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_variable_identifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_or_generate_item_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_item_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_type_base *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Decl_dimensions *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_direction *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Assume_property_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_octdigits *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Task_prototype *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_simple_path *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Method_qualifier_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Generate_case_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Cover_property_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Method_prototype *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Net_type_or_none *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Event_control_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Net_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_constructor *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Genvar_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_spec *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_octbase *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_item_qualifier_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_simple_path_decl *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_variable_decl_assignments *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Clocking_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Net_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(
    Method_property_qualifier_list_not_starting_with_virtual *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_spec_disable_iff_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Pull01 *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Task_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Spec_reference_event *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Macro_formals_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Function_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_item_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Statement_or_null_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Function_prototype *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_item_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Non_anonymous_instantiation_base *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Spec_notifier_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dpi_import_export *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Variable_decl_assignment *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Function_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_constructor_prototype *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specparam_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Function_item_data_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_virtual_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_value_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_expr_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Generate_if *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Cast *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Type_assignment *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Symbolidentifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameters *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dynamic_array_new *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Constant_dec_number *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Based_number *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_value_byname_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Macroidentifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Generate_case_items *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_unbasednumber *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_declaration_noattr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Escapedidentifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Preprocess_include_argument *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Instantiation_base *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Pp_identifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_new *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Keywordidentifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(
    Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Instantiation_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Var_or_net_type_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(
    Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Lifetime *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_value_byname_list_item_last *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Const_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_value_byname *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Macro_formals_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Type_identifier_followed_by_id *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Range_list_in_braces *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_value_byname_list_trailing_comma *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_decnumber *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_stringliteral *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay_value_simple *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(
    Non_anonymous_gate_instance_or_register_variable_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Defparam_assign_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay_value *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Gate_instance_or_register_variable *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_parameter_port *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Defparam_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_realtime *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_parameter_port_list_item_last *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_argument_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Decl_dimensions_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_parameter_port_list_preprocessor_last *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_port_list_item_last *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Localparam_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_port_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay_identifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_port_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_parameter_port_list_trailing_comma *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_argument_list_item_last *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Argument_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_timeliteral *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_argument_list_trailing_comma *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Non_port_module_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Enum_name *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Postfix_expression *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_argument *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Enum_name_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_declaration_modifiers_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_port_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Unary_op *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_item_or_statement_or_null_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_block *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Inc_or_dec_or_primary_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_item_directive *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Task_declaration_id *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_list_paren_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_common_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expr_primary *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_item_or_statement_or_null_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Reference *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Generate_region *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Pos_neg_number *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Local_root *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_block *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Reference_or_call_base *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_item_or_statement_or_null *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Macroiditem *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Timeunits_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_declaration_base *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Task_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Builtin_array_method *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Always_construct *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Scope_or_if_res *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_declaration_or_module_instantiation *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Type_or_id_root *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Array_locator_method *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Any_param_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Array_reduction_method *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Select_variable_dimension *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specparam_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Var_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_override *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Hierarchy_extension *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Gate_instantiation *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_id *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Gatetype *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Type_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Primitive_gate_instance *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Primitive_gate_instance_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Implicit_class_handle *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_import_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specparam *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Genericidentifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Always_any *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Qualified_id *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Concurrent_assertion_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Switchtype *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Initial_construct *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dr_strength1 *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Inc_or_dec_expression *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Preprocessor_action *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_or_generate_item_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Equiv_impl_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dr_strength0 *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_primitive *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Continuous_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expression *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_hexdigits *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Loop_generate_construct *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Assign_modify_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Conditional_generate_construct *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Generate_item_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Lifetime_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Generate_item_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Symbol_or_label *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Cond_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Assertion_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_package_import_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_parameter_port_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Logor_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_port_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Final_construct *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Generate_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_attribute_foreign_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Statement_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_item_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_end *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Label_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Logand_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Generate_block *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay_scope *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Procedural_timing_control_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Reference_or_call *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Genvar_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Matches_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(For_initialization_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Join_keyword *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(With_exprs_suffix *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Unqualified_id *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Bitor_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Assignment_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Function_return_type_and_id *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay1 *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(For_step_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Xor_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Bitand_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_list_item_last *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Seq_block *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tf_port_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_item_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(For_step *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Subroutine_call *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(For_initialization *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(For_init_decl_or_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Endfunction_label_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Caseeq_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Conditional_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Repeat_control *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Logeq_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Nonblocking_assignment *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Case_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Identifier_optional_unpacked_dimensions *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Case_items *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(
    List_of_ports_or_port_declarations_trailing_comma *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_implication_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_ports_or_port_declarations *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Loop_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Comp_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_prefix_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Par_block *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Shift_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Case_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_or_port_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_if_else_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Blocking_assignment *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Preprocessor_directive *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Simple_sequence_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Wait_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_expression *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_or_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Param_type_followed_by_id_and_dimensions_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Procedural_assertion_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Add_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_and_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Immediate_assertion_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_value_ranges_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Procedural_continuous_assignment *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Trailing_assign_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_unary_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Localparam_assign_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_initial *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Event_trigger *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_port_decl *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_intersect_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_assign_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Disable_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_items *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_within_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Jump_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Open_range_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_expression_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_throughout_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Trailing_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_edge_path *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Mul_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Macrogenericitem *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_delay_range_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Type_assignment_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Action_block *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_reference *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Lpvalue *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_reference_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_delay_repetition_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Statement_or_null *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Unique_priority_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Deferred_immediate_assertion_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Pow_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_expr_primary *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Enum_name_list_trailing_comma *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Event_control *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Parameter_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Unary_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Sequence_repetition_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Polarity_operator *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Unary_prefix_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expression_in_parens *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Cycle_delay *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expression_or_dist *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_hexbase *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Assignment_statement_no_expr *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_parameter_port_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Boolean_abbrev_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_import_item_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay_or_event_control_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Timescale_directive *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dist_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Event_expression_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Misc_directive *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_port_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Edge_operator *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Hex_based_number *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Value_range *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Hierarchy_event_identifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_binbase *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_sequ_entry_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expression_list_proper *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_port_decls *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Class_item_qualifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_edge_descriptor *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_init_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Event_expression *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Streaming_concatenation *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_body *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Time_literal *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_qualifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dir *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Stream_operator *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dec_based_number *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Final_or_zero *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expression_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Bin_based_number *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Cont_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_direction *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Drive_strength_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Oct_based_number *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Stream_expression *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Var_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Cont_assign_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Slice_size_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_comb_entry_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_reg_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_bindigits *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Stream_expression_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_identifiers_unpacked_dimensions *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_initial_expr_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_input_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_input_declaration_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expr_mintypmax_generalized *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_decbase *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expr_mintypmax *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Macronumericwidth *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_sequ_entry *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Clocking_item_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_module_item_identifiers *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_decdigits *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Drive_strength *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Identifier_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay_or_event_control *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_expr_or_assignment *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_entry_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_port_identifiers *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Bit_logic_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Enum_name_list_item_last *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expr_mintypmax_trans_set *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_xzdigits *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Simple_immediate_assertion_statement *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Property_expr_or_assignment_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_input_sym *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_ports_or_port_declarations_item_last *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Bit_logic *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_output_sym *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Port_net_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Case_any *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_rss_eq *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Packed_signing_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_rs_eq *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(
    Type_identifier_or_implicit_followed_by_id_and_dimensions_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Random_qualifier_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Struct_union_member_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Trailing_decl_assignment *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_type_primitive_scalar *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_tagged_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Integer_vector_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(
    Data_type_or_implicit_followed_by_id_and_dimensions_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Signed_unsigned_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Struct_union_member *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Integer_atom_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Enum_data_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_import_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Non_integer_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Structure_or_array_pattern_expression_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Assignment_pattern *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Struct_data_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Structure_or_array_pattern_expression *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_import_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Structure_or_array_pattern_key *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_ports_or_port_declarations_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Scope_prefix *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dpi_import_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specparam_decl *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Net_variable_or_decl_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Endnew_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_type_or_implicit *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Begin *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Net_variable_or_decl_assigns *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Block_item_or_statement_or_null_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Spec_polarity *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(End *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_edge_path_decl *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Macro_formal_parameter *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Block_item_or_statement_or_null_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Charge_strength_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay3 *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(System_tf_call *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Hierarchy_segment *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Block_item_or_statement_or_null *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay3_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Select_dimensions_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay_value_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(List_of_identifiers *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Block_item_decl *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dpi_spec_string *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expr_primary_no_groups *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Dpi_import_property_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Net_variable *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Systemtfidentifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Package_item_no_pp *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Net_decl_assign *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Spec_notifier *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Call_base *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_path_identifiers *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Source_text *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Number *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Signing *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Specify_terminal_descriptor *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Udp_comb_entry *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expr_primary_parens *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Delay3_or_drive_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Edge_descriptor_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Tk_ls_eq *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expr_primary_braces *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Description_list *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Decl_variable_dimension *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Assignment_pattern_expression *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Casting_type *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Data_type_primitive *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Expression_or_null_list_opt *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_or_interface_declaration *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_or_generate_item *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Module_start *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Description *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(String_literal *node) {

  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}

void CodeGenVisitor::visit(Terminal *node) {
  if (node->getChildren().empty()) {
    std::cout << node->getElement();
  } else {
    for (std::shared_ptr<Node> &child : node->getChildren()) {
      child->accept(*this);
    }
  }
}
