#ifndef CHIMERA_AST_H
#define CHIMERA_AST_H
#include <functional>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

/**
 * @enum PortDir
 * @brief Enumeration of the direction of the ports.
 */
enum class PortDir : unsigned short {
  INPUT = 0,
  OUTPUT = 1,
  INOUT = 2,
  NONE = 3
};

/**
 * @enum NodeType
 * @brief Enumeration of node types used in the AST.
 */
enum class NodeType {
  TERMINAL,
  BASE_NODE,
  SEQUENCE_DELAY_RANGE_EXPR,
  PORT,
  SPECIFY_SIMPLE_PATH,
  EVENT_CONTROL,
  STRING_LITERAL,
  CHARGE_STRENGTH_OPT,
  DPI_IMPORT_EXPORT,
  FOR_INITIALIZATION_OPT,
  LIST_OF_PORT_IDENTIFIERS,
  NON_INTEGER_TYPE,
  PARAMETER_VALUE_RANGES_OPT,
  PACKAGE_ITEM_NO_PP,
  SEQUENCE_DELAY_REPETITION_LIST,
  ADD_EXPR,
  DPI_IMPORT_ITEM,
  TK_REALTIME,
  CASE_ITEM,
  PROPERTY_IF_ELSE_EXPR,
  NON_ANONYMOUS_INSTANTIATION_BASE,
  UNARY_EXPR,
  UNARY_OP,
  CLASS_ID,
  REFERENCE,
  CAST,
  TF_VARIABLE_IDENTIFIER_FIRST,
  TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  TYPE_OR_ID_ROOT,
  MODULE_OR_GENERATE_ITEM,
  MODULE_PARAMETER_PORT_LIST_TRAILING_COMMA,
  INSTANTIATION_TYPE,
  PARAMETERS,
  REFERENCE_OR_CALL_BASE,
  PARAM_TYPE_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  STRUCTURE_OR_ARRAY_PATTERN_KEY,
  PARAMETER_ASSIGN_LIST,
  DEFPARAM_ASSIGN_LIST,
  GENERATE_ITEM_LIST_OPT,
  TK_OCTDIGITS,
  SEQUENCE_EXPR_PRIMARY,
  LPVALUE,
  LABEL_OPT,
  ESCAPEDIDENTIFIER,
  GENERATE_ITEM,
  DATA_TYPE_PRIMITIVE,
  SPEC_REFERENCE_EVENT,
  UDP_INPUT_DECLARATION_LIST,
  NON_PORT_MODULE_ITEM,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_NON_ANSI,
  MODULE_PARAMETER_PORT_LIST_OPT,
  PROPERTY_PREFIX_EXPR,
  EXPR_PRIMARY_BRACES,
  POW_EXPR,
  FOR_INIT_DECL_OR_ASSIGN,
  UDP_INITIAL,
  TF_PORT_LIST_PAREN_OPT,
  STRUCT_DATA_TYPE,
  UDP_SEQU_ENTRY,
  NET_VARIABLE_OR_DECL_ASSIGN,
  PARAMETER_VALUE_BYNAME_LIST_TRAILING_COMMA,
  INC_OR_DEC_EXPRESSION,
  NET_TYPE,
  SELECT_DIMENSIONS_OPT,
  SPEC_POLARITY,
  MACRO_FORMAL_PARAMETER,
  STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION,
  FOR_STEP,
  SPECPARAM_LIST,
  TK_BINBASE,
  TK_STRINGLITERAL,
  VAR_OPT,
  IDENTIFIER_OPTIONAL_UNPACKED_DIMENSIONS,
  FUNCTION_ITEM_LIST,
  TYPE_DECLARATION,
  UDP_BODY,
  MUL_EXPR,
  PAR_BLOCK,
  KEYWORDIDENTIFIER,
  LOGEQ_EXPR,
  MODULE_COMMON_ITEM,
  PRIMITIVE_GATE_INSTANCE,
  DATA_TYPE_OR_IMPLICIT,
  TK_OCTBASE,
  SEQUENCE_EXPR,
  TK_HEXBASE,
  PROPERTY_EXPR,
  SEQ_BLOCK,
  TASK_ITEM,
  DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  SPECIFY_BLOCK,
  TK_DECNUMBER,
  TK_DECBASE,
  PROPERTY_IMPLICATION_EXPR,
  BIT_LOGIC_OPT,
  INTEGER_ATOM_TYPE,
  LIFETIME,
  ANY_ARGUMENT_LIST,
  DELAY_VALUE_LIST,
  MODULE_PORT_DECLARATION,
  JUMP_STATEMENT,
  DELAY_VALUE,
  SEQUENCE_OR_EXPR,
  MODULE_ATTRIBUTE_FOREIGN_OPT,
  TF_PORT_DIRECTION_OPT,
  TF_PORT_ITEM_EXPR_OPT,
  CONT_ASSIGN_LIST,
  ANY_ARGUMENT_LIST_TRAILING_COMMA,
  PROCEDURAL_CONTINUOUS_ASSIGNMENT,
  EXPRESSION_OR_DIST,
  MODULE_START,
  EXPR_PRIMARY_PARENS,
  OPEN_RANGE_LIST,
  UNARY_PREFIX_EXPR,
  DELAY_IDENTIFIER,
  LIST_OF_IDENTIFIERS_UNPACKED_DIMENSIONS,
  DELAY_SCOPE,
  ACTION_BLOCK,
  TRAILING_ASSIGN_OPT,
  CLASS_ITEM,
  ENUM_NAME_LIST_TRAILING_COMMA,
  UDP_PORT_LIST,
  EQUIV_IMPL_EXPR,
  CLASS_NEW,
  PORT_NET_TYPE,
  UNQUALIFIED_ID,
  BEGIN,
  SYSTEM_TF_CALL,
  PARAMETER_VALUE_BYNAME_LIST_ITEM_LAST,
  CONDITIONAL_GENERATE_CONSTRUCT,
  TIMESCALE_DIRECTIVE,
  PORT_EXPRESSION,
  UDP_SEQU_ENTRY_LIST,
  SYMBOL_OR_LABEL,
  SIMPLE_SEQUENCE_EXPR,
  SYSTEMTFIDENTIFIER,
  TK_UNBASEDNUMBER,
  DECL_DIMENSIONS_OPT,
  CLASS_ITEMS_OPT,
  ENUM_NAME,
  PARAMETER_VALUE_OPT,
  SPECIFY_EDGE_PATH,
  IMPLICIT_CLASS_HANDLE,
  MODULE_ITEM,
  STATEMENT_ITEM,
  TYPE_IDENTIFIER_FOLLOWED_BY_ID,
  METHOD_PROTOTYPE,
  TF_PORT_ITEM,
  BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST,
  ENDNEW_OPT,
  SPECIFY_ITEM_LIST_OPT,
  SPECIFY_SIMPLE_PATH_DECL,
  TK_RS_EQ,
  PACKAGE_IMPORT_ITEM_LIST,
  UDP_PORT_DECL,
  WITH_EXPRS_SUFFIX,
  GENERATE_REGION,
  CALL_BASE,
  ARRAY_LOCATOR_METHOD,
  PORT_DECLARATION_ANSI,
  BITAND_EXPR,
  RANGE_LIST_IN_BRACES,
  MODULE_PARAMETER_PORT_LIST_ITEM_LAST,
  HEX_BASED_NUMBER,
  HIERARCHY_EVENT_IDENTIFIER,
  LIST_OF_VARIABLE_DECL_ASSIGNMENTS,
  RANDOM_QUALIFIER_OPT,
  DRIVE_STRENGTH_OPT,
  TK_TIMELITERAL,
  VALUE_RANGE,
  EXPR_MINTYPMAX_GENERALIZED,
  POLARITY_OPERATOR,
  PACKAGE_ITEM,
  FOR_INITIALIZATION,
  ENUM_DATA_TYPE,
  BLOCKING_ASSIGNMENT,
  DELAY1,
  BASED_NUMBER,
  PROCEDURAL_TIMING_CONTROL_STATEMENT,
  BLOCK_ITEM_DECL,
  NET_VARIABLE_OR_DECL_ASSIGNS,
  TIME_LITERAL,
  FUNCTION_ITEM_DATA_DECLARATION,
  DECL_VARIABLE_DIMENSION,
  TF_PORT_LIST_OPT,
  ENDFUNCTION_LABEL_OPT,
  QUALIFIED_ID,
  IMMEDIATE_ASSERTION_STATEMENT,
  JOIN_KEYWORD,
  TK_BINDIGITS,
  EVENT_TRIGGER,
  DYNAMIC_ARRAY_NEW,
  MATCHES_EXPR,
  PORT_REFERENCE_LIST,
  ARRAY_REDUCTION_METHOD,
  BUILTIN_ARRAY_METHOD,
  PACKAGE_DECLARATION,
  ASSIGNMENT_PATTERN_EXPRESSION,
  DRIVE_STRENGTH,
  PORT_DECLARATION_NON_ANSI,
  MODULE_PARAMETER_PORT_LIST,
  VAR_TYPE,
  PARAMETER_OPT,
  MODULE_ITEM_LIST,
  GENERICIDENTIFIER,
  PACKAGE_ITEM_LIST_OPT,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_ANSI,
  DATA_TYPE_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  XOR_EXPR,
  DEC_BASED_NUMBER,
  LOOP_STATEMENT,
  DATA_DECLARATION_OR_MODULE_INSTANTIATION,
  UDP_COMB_ENTRY_LIST,
  BIT_LOGIC,
  REFERENCE_OR_CALL,
  LOCAL_ROOT,
  PORT_DIRECTION,
  VARIABLE_DECL_ASSIGNMENT,
  SPECIFY_EDGE_PATH_DECL,
  FUNCTION_PROTOTYPE,
  SEQUENCE_WITHIN_EXPR,
  EXPR_PRIMARY_NO_GROUPS,
  PARAMETER_VALUE_BYNAME,
  CASE_ANY,
  SPEC_NOTIFIER,
  BLOCK_ITEM_OR_STATEMENT_OR_NULL,
  SPECIFY_ITEM,
  ANY_PARAM_DECLARATION,
  TF_PORT_LIST_TRAILING_COMMA,
  STRUCT_UNION_MEMBER,
  ANY_PORT_LIST_POSITIONAL,
  DIR,
  LIFETIME_OPT,
  LIST_OF_IDENTIFIERS,
  EDGE_OPERATOR,
  TK_VIRTUAL_OPT,
  TIMEUNITS_DECLARATION,
  TF_ITEM_OR_STATEMENT_OR_NULL,
  PACKAGE_IMPORT_LIST,
  EXPR_PRIMARY,
  SIGNED_UNSIGNED_OPT,
  NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST,
  UDP_COMB_ENTRY,
  DELAY3,
  INC_OR_DEC_OR_PRIMARY_EXPR,
  PROCEDURAL_ASSERTION_STATEMENT,
  STRUCT_UNION_MEMBER_LIST,
  COMP_EXPR,
  POSTFIX_EXPRESSION,
  SYMBOLIDENTIFIER,
  UDP_INPUT_SYM,
  POS_NEG_NUMBER,
  SPECIFY_TERMINAL_DESCRIPTOR,
  SELECT_VARIABLE_DIMENSION,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_ANSI,
  GENERATE_CASE_ITEMS,
  DATA_TYPE_PRIMITIVE_SCALAR,
  TF_ITEM_OR_STATEMENT_OR_NULL_LIST,
  CONDITIONAL_STATEMENT,
  SPECPARAM_DECL,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_NON_ANSI,
  STATEMENT_OR_NULL_LIST,
  TASK_DECLARATION,
  DATA_DECLARATION_BASE,
  ANY_PORT_LIST_OPT,
  MACRONUMERICWIDTH,
  TRAILING_DECL_ASSIGNMENT_OPT,
  GATE_INSTANCE_OR_REGISTER_VARIABLE,
  BIND_INSTANTIATION,
  PACKAGE_IMPORT_DECLARATION,
  MODULE_PACKAGE_IMPORT_LIST_OPT,
  STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION_LIST,
  EVENT_EXPRESSION_LIST,
  TK_RSS_EQ,
  IMPLEMENTS_INTERFACE_LIST_OPT,
  DELAY3_OPT,
  EXPR_MINTYPMAX_TRANS_SET,
  STATEMENT_OR_NULL,
  ENUM_NAME_LIST,
  SEQUENCE_UNARY_EXPR,
  PP_IDENTIFIER,
  SHIFT_EXPR,
  OCT_BASED_NUMBER,
  HIERARCHY_SEGMENT,
  NONBLOCKING_ASSIGNMENT,
  EXPRESSION_LIST_PROPER,
  GENERATE_IF,
  FUNCTION_ITEM,
  SCOPE_PREFIX,
  PRIMITIVE_GATE_INSTANCE_LIST,
  SIMPLE_IMMEDIATE_ASSERTION_STATEMENT,
  DESCRIPTION_LIST,
  DR_STRENGTH0,
  UNIQUE_PRIORITY_OPT,
  SPECPARAM,
  PORT_EXPRESSION_OPT,
  COND_EXPR,
  TK_REG_OPT,
  LOGOR_EXPR,
  DELAY3_OR_DRIVE_OPT,
  TF_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT,
  NET_DECL_ASSIGN,
  ALWAYS_ANY,
  LIST_OF_TF_VARIABLE_IDENTIFIERS,
  VAR_OR_NET_TYPE_OPT,
  TF_PORT_LIST_ITEM_LAST,
  TASK_DECLARATION_ID,
  INSTANTIATION_BASE,
  SEQUENCE_REPETITION_EXPR,
  TK_HEXDIGITS,
  NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE,
  LOCALPARAM_ASSIGN,
  CLASS_ITEMS,
  EXPRESSION_IN_PARENS,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_ANSI,
  PORT_REFERENCE,
  DIST_OPT,
  CASEEQ_EXPR,
  GENERATE_BLOCK,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_NON_ANSI,
  ANY_ARGUMENT_LIST_ITEM_LAST,
  GATE_INSTANTIATION,
  CASTING_TYPE,
  EXPR_MINTYPMAX,
  CONTINUOUS_ASSIGN,
  PARAMETER_ASSIGN,
  DELAY_VALUE_SIMPLE,
  SWITCHTYPE,
  PACKAGE_OR_GENERATE_ITEM_DECLARATION,
  BIN_BASED_NUMBER,
  LOOP_GENERATE_CONSTRUCT,
  PARAMETER_OVERRIDE,
  UDP_PRIMITIVE,
  PARAMETER_EXPR,
  REPEAT_CONTROL,
  PACKED_SIGNING_OPT,
  EXPRESSION_OR_NULL_LIST_OPT,
  ENUM_NAME_LIST_ITEM_LAST,
  MACRO_FORMALS_LIST_OPT,
  SPEC_NOTIFIER_OPT,
  HIERARCHY_EXTENSION,
  GENERATE_ITEM_LIST,
  DATA_DECLARATION_MODIFIERS_OPT,
  SEQUENCE_THROUGHOUT_EXPR,
  PROPERTY_EXPR_OR_ASSIGNMENT_LIST,
  BITOR_EXPR,
  TF_PORT_LIST,
  ANY_PORT_LIST_TRAILING_COMMA_NAMED,
  FUNCTION_RETURN_TYPE_AND_ID,
  STATEMENT,
  DR_STRENGTH1,
  ASSIGN_MODIFY_STATEMENT,
  UDP_PORT_DECLS,
  INTEGER_VECTOR_TYPE,
  ASSIGNMENT_PATTERN,
  CLASS_CONSTRUCTOR,
  MODULE_PARAMETER_PORT,
  MODULE_OR_GENERATE_ITEM_DECLARATION,
  FINAL_CONSTRUCT,
  MEMBER_NAME,
  CLASS_DECLARATION,
  PACKAGE_IMPORT_ITEM,
  SIGNING,
  CLASS_CONSTRUCTOR_PROTOTYPE,
  GENERATE_CASE_ITEM,
  DATA_DECLARATION,
  EXPRESSION,
  CONT_ASSIGN,
  DELAY_OR_EVENT_CONTROL_OPT,
  BIND_DIRECTIVE,
  MISC_DIRECTIVE,
  UDP_INITIAL_EXPR_OPT,
  DESCRIPTION,
  DATA_TYPE_BASE,
  TRAILING_ASSIGN,
  MODULE_END,
  WAIT_STATEMENT,
  PACKAGE_ITEM_LIST,
  CASE_ITEMS,
  STATEMENT_OR_NULL_LIST_OPT,
  PORT_NAMED,
  UDP_OUTPUT_SYM,
  ASSIGNMENT_STATEMENT_NO_EXPR,
  ANY_PORT_LIST_ITEM_LAST_POSITIONAL,
  MODULE_ITEM_LIST_OPT,
  SEQUENCE_AND_EXPR,
  DATA_TYPE,
  ARGUMENT_LIST_OPT,
  FOR_STEP_OPT,
  SEQUENCE_INTERSECT_EXPR,
  FUNCTION_DECLARATION,
  NET_TYPE_OR_NONE,
  CLASS_DECLARATION_EXTENDS_OPT,
  BOOLEAN_ABBREV_OPT,
  SPECIFY_PATH_IDENTIFIERS,
  TF_PORT_DIRECTION,
  TK_DECDIGITS,
  END,
  NET_DECLARATION,
  TK_TAGGED_OPT,
  TK_XZDIGITS,
  GATETYPE,
  PREPROCESS_INCLUDE_ARGUMENT,
  MACRO_FORMALS_LIST,
  CONST_OPT,
  LOGAND_EXPR,
  EVENT_EXPRESSION,
  UDP_ENTRY_LIST,
  PREPROCESSOR_ACTION,
  TF_PORT_DECLARATION,
  UDP_INIT_OPT,
  TYPE_IDENTIFIER_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  SOURCE_TEXT,
  DEFPARAM_ASSIGN,
  DECL_DIMENSIONS,
  CONSTANT_DEC_NUMBER,
  CASE_STATEMENT,
  ASSIGNMENT_STATEMENT,
  DPI_IMPORT_PROPERTY_OPT,
  DPI_SPEC_STRING,
  TRAILING_DECL_ASSIGNMENT,
  ALWAYS_CONSTRUCT,
  GENVAR_OPT,
  ANY_PORT_LIST_NAMED,
  SUBROUTINE_CALL,
  PROPERTY_EXPR_OR_ASSIGNMENT,
  ANY_ARGUMENT,
  MODULE_OR_INTERFACE_DECLARATION,
  EXPRESSION_OPT,
  GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST,
  TK_EVALSTRINGLITERAL,
  DELAY_OR_EVENT_CONTROL,
  UDP_INPUT_LIST,
  PARAMETER_VALUE_BYNAME_LIST,
  MODULE_PORT_LIST_OPT,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_OPT,
  ANY_PORT_LIST_TRAILING_COMMA_POSITIONAL,
  BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT,
  GENVAR_DECLARATION,
  NUMBER,
  SPECIFY_ITEM_LIST,
  TK_LS_EQ,
  TF_VARIABLE_IDENTIFIER,
  INITIAL_CONSTRUCT,
  LOCALPARAM_ASSIGN_LIST,
  DISABLE_STATEMENT,
  LIST_OF_MODULE_ITEM_IDENTIFIERS,
  ANY_PORT_LIST_ITEM_LAST_NAMED,
  NET_VARIABLE,
  PARAMETER_EXPR_LIST,
  SPECPARAM_DECLARATION,
  DEFERRED_IMMEDIATE_ASSERTION_STATEMENT,
  SLICE_SIZE_OPT,
  CONCURRENT_ASSERTION_ITEM,
  CLOCKING_ITEM_LIST_OPT,
  CYCLE_DELAY,
  MACROIDITEM,
  ASSUME_PROPERTY_STATEMENT,
  PULL01,
  PREPROCESSOR_DIRECTIVE,
  MODULE_ITEM_DIRECTIVE,
  ASSERT_PROPERTY_STATEMENT,
  SCOPE_OR_IF_RES,
  TASK_PROTOTYPE,
  CLOCKING_DECLARATION,
  BLOCK_IDENTIFIER_OPT,
  MACROIDENTIFIER,
  PROPERTY_SPEC_DISABLE_IFF_OPT,
  MACROGENERICITEM,
  MODULE_BLOCK,
  STREAM_EXPRESSION,
  FINAL_OR_ZERO,
  TK_EDGE_DESCRIPTOR,
  METHOD_PROPERTY_QUALIFIER_LIST_NOT_STARTING_WITH_VIRTUAL,
  IDENTIFIER_OPT,
  MODULE_PARAMETER_PORT_LIST_PREPROCESSOR_LAST,
  TYPE_ASSIGNMENT,
  TYPE_ASSIGNMENT_LIST,
  METHOD_QUALIFIER_LIST_OPT,
  STREAM_OPERATOR,
  ASSERTION_ITEM,
  PROPERTY_SPEC,
  STREAMING_CONCATENATION,
  EDGE_DESCRIPTOR_LIST,
  PROPERTY_QUALIFIER,
  EVENT_CONTROL_OPT,
  CLASS_ITEM_QUALIFIER,
  CONCURRENT_ASSERTION_STATEMENT,
  COVER_PROPERTY_STATEMENT,
  STREAM_EXPRESSION_LIST,
  CLASS_ITEM_QUALIFIER_LIST_OPT,
  ASSERTION_ITEM_DECLARATION,
  BOOLEAN_ABBREV,
  CYCLE_DELAY_RANGE,
  PROPERTY_OPERATOR,
  PROPERTY_SPEC_DISABLE_IFF,
  CONFIG_DECLARATION,
  WITH_CONSTRAINT_BLOCK_OPT,
  RANDOM_QUALIFIER,
  BIND_TARGET_INSTANCE_LIST,
  CLOCKING_ITEM_LIST,
  MODPORT_DECLARATION,
  CLASS_CONSTRAINT,
  NET_ALIAS,
  TYPE_REFERENCE,
  METHOD_QUALIFIER_LIST,
  INTERFACE_TYPE,
  PACKAGE_EXPORT_DECLARATION,
  INTERFACE_OPT,
  DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID,
  COVERAGE_SPEC_OR_OPTION_LIST_OPT,
  MODPORT_ITEM_LIST,
  EXPECT_PROPERTY_STATEMENT,
  LIB_CELL_IDENTIFIERS_OPT,
  SEQUENCE_PORT_LIST_IN_PARENS_OPT,
  CLOCKING_DIRECTION,
  GOTO_REPETITION,
  CONSTRAINT_BLOCK_ITEM,
  ASSERTION_VARIABLE_DECLARATION,
  TK_STATIC_OPT,
  DESIGN_STATEMENT,
  SEQUENCE_DECLARATION,
  CLOCKING_ITEM,
  PROPERTY_PORT_ITEM,
  LIST_OF_CONFIG_RULE_STATEMENTS,
  CYCLE_RANGE,
  BIND_TARGET_INSTANCE,
  LIB_CELL_ID,
  PROPERTY_DECLARATION,
  PROPERTY_FORMAL_TYPE_FOLLOWED_BY_ID,
  MODPORT_SIMPLE_PORTS_DECLARATION_LAST,
  COVERGROUP_DECLARATION,
  COVERAGE_SPEC,
  CONSECUTIVE_REPETITION,
  LIST_OF_LIBRARIES_OPT,
  IDENTIFIER_LIST_IN_PARENS_OPT,
  LIST_OF_CLOCKING_DECL_ASSIGN,
  COVERAGE_EVENT,
  CONFIG_RULE_STATEMENT,
  TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID,
  ASSERTION_VARIABLE_DECLARATION_LIST,
  CONSTRAINT_EXPRESSION_NO_PREPROCESSOR,
  CLOCKING_DECL_ASSIGN,
  WITH_CONSTRAINT_BLOCK,
  OPTIONAL_SEMICOLON,
  PROPERTY_PORT_LIST_IN_PARENS_OPT,
  MODPORT_SIMPLE_PORTS_DECLARATION_BEGIN,
  MODPORT_SIMPLE_PORT,
  CLOCKING_SKEW_OPT,
  IMPLICATION_OPERATOR,
  NET_ALIAS_ASSIGN_LVALUE_LIST,
  NONCONSECUTIVE_REPETITION,
  BINS_OR_OPTIONS_LIST_OPT,
  SEQUENCE_PORT_LIST_OPT,
  PROPERTY_PORT_MODIFIERS_OPT,
  LIBLIST_CLAUSE,
  CONSTRAINT_DECLARATION,
  PROPERTY_ACTUAL_ARG_OPT,
  LIST_OF_CONFIG_RULE_STATEMENTS_OPT,
  MODPORT_PORTS_LIST,
  COVER_POINT,
  MODPORT_ITEM,
  CONSTRAINT_BLOCK_ITEM_LIST_OPT,
  LIB_CELL_IDENTIFIERS,
  METHOD_QUALIFIER,
  PROPERTY_PORT_LIST,
  LIST_OF_LIBRARIES,
  CONSTRAINT_BLOCK_ITEM_LIST,
  COVERAGE_SPEC_OR_OPTION_LIST,
  CONSTRAINT_BLOCK,
  HIERARCHY_OR_CALL_EXTENSION,
  COVERAGE_EVENT_OPT,
  CYCLE_RANGE_OR_EXPR,
  COVERAGE_SPEC_OR_OPTION,
  UNTIL_OPERATOR,
  COVER_SEQUENCE_STATEMENT,
  WITH_COVERGROUP_EXPRESSION_IN_PARENS,
  DECLARATION_EXTENDS_LIST_OPT,
  RS_IF_ELSE,
  FOLLOWED_BY_OPERATOR,
  LOCAL_SEQUENCE_LVAR_PORT_DIRECTION_OPT,
  BINS_EXPRESSION,
  PROPERTY_ACTUAL_ARG,
  SELECT_EXPRESSION,
  SLICE_SIZE,
  PROPERTY_CASE_ITEM,
  DEFAULT_SKEW,
  CONSTRAINT_EXPRESSION_LIST,
  MODPORT_CLOCKING_DECLARATION_BEGIN,
  PROPERTY_CASE_ITEM_LIST,
  RANDOMIZE_CALL,
  CROSS_ITEM_LIST,
  PRODUCTION_ITEM,
  DATA_TYPE_OR_VOID_WITH_ID,
  LB_STAR_RB,
  MODPORT_CLOCKING_DECLARATION_LAST,
  UNIQUENESS_CONSTRAINT,
  ANY_PORT_LIST_PREPROCESSOR_LAST_NAMED,
  MODPORT_TF_PORTS_DECLARATION_TRAILING_COMMA,
  INTERFACE_DATA_DECLARATION,
  METHOD_PROPERTY_QUALIFIER,
  BINS_OR_OPTIONS_LIST,
  OPT_CONFIG,
  PATTERN_LIST,
  BINS_OR_OPTIONS,
  PATTERN_OPT,
  INTERFACE_CLASS_ITEM_LIST,
  CROSS_BODY_ITEM_LIST,
  MODPORT_TF_PORTS_DECLARATION_BEGIN,
  RS_RULE_LIST,
  CELL_CLAUSE,
  SEQUENCE_PORT_LIST,
  LET_PORT_LIST,
  PRODUCTION_LIST,
  RS_PRODUCTION_LIST_OR_RAND_JOIN,
  RS_CODE_BLOCK,
  LET_DECLARATION,
  EXPRESSION_IN_PARENS_OPT,
  ARRAY_METHOD_WITH_PREDICATE_OPT,
  CROSS_ITEM,
  MODPORT_TF_PORTS_DECLARATION_LAST,
  CASE_PATTERN_ITEM,
  INST_CLAUSE,
  RS_REPEAT,
  COVERGROUP_EXPRESSION_BRACKETED_OPT,
  CLOCKING_DRIVE_ONLY,
  CONSTRAINT_PRIMARY,
  CONSTRAINT_EXPRESSION,
  SEQUENCE_MATCH_ITEM_LIST,
  SEQUENCE_SPEC,
  COVER_CROSS,
  WILDCARD_OPT,
  CASE_INSIDE_ITEMS,
  MODPORT_TF_PORT,
  WEIGHT_SPECIFICATION,
  SELECT_CONDITION,
  DEFERRED_IMMEDIATE_ASSERTION_ITEM,
  LET_FORMAL_TYPE_FOLLOWED_BY_ID,
  COVERAGE_BIN_RHS,
  PRODUCTION_ITEMS_LIST,
  PREPROCESSOR_BALANCED_PORT_DECLARATIONS,
  SIMPLE_TYPE,
  RS_PRODUCTION_LIST,
  DPI_EXPORT_ITEM,
  PRODUCTION,
  MODPORT_CLOCKING_DECLARATION_TRAILING_COMMA,
  LET_PORT_LIST_IN_PARENS_OPT,
  CROSS_BODY,
  USE_CLAUSE,
  SEQUENCE_MATCH_ITEM,
  COVERAGE_BIN,
  SEQUENCE_PORT_TYPE_FOLLOWED_BY_ID,
  INTERFACE_CLASS_DECLARATION,
  IDENTIFIER_LIST,
  SEQUENCE_PORT_ITEM,
  DIST_ITEM,
  DIST_WEIGHT,
  BINS_KEYWORD,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_PREPROCESSOR_LAST_ANSI,
  IMPLEMENTS_INTERFACE_LIST,
  LET_PORT_ITEM,
  ARRAY_METHOD_WITH_PREDICATE,
  COVERAGE_OPTION,
  CONSTRAINT_SET,
  PATTERN,
  NET_TYPE_DECLARATION,
  BINS_SELECTION,
  EXPRESSION_OR_DIST_LIST,
  CLOCKING_SKEW,
  INTERFACE_CLASS_ITEM,
  SEQUENCE_EXPR_MATCH_ITEM_LIST,
  TK_ANGLEBRACKETINCLUDE,
  INTERFACE_CLASS_ITEM_LIST_OPT,
  IMPORT_EXPORT,
  WITH_COVERGROUP_EXPRESSION,
  CONSTRAINT_PRIMARY_LIST,
  PROPERTY_CASE_STATEMENT,
  CHARGE_STRENGTH,
  DPI_IMPORT_PROPERTY,
  IFF_EXPR_OPT,
  RS_RULE,
  INTERFACE_CLASS_METHOD,
  MODPORT_SIMPLE_PORTS_DECLARATION_TRAILING_COMMA,
  CASE_INSIDE_ITEM,
  RESTRICT_PROPERTY_STATEMENT,
  DIST_LIST,
  RS_PROD,
  ARRAY_ORDERING_METHOD,
  RANDSEQUENCE_STATEMENT,
  CROSS_BODY_ITEM,
  CASE_PATTERN_ITEMS,
  CROSS_BODY_ITEM_LIST_OPT,
  MODPORT_PORTS_DECLARATION_TRAILING_COMMA,
  SET_COVERGROUP_EXPRESSION_OR_COVERGROUP_RANGE_LIST_OR_TRANS_LIST,

};

/**
 * @class Node
 * @brief Represents a node in the abstract syntax tree (AST).
 *
 * This class defines the basic properties and operations for a node in a tree.
 * It includes methods to manage its children, parent, and element data.
 */
class Node {
public:
  NodeType type = NodeType::BASE_NODE;

  virtual ~Node() = default;
  Node() = default;
  Node(Node &&) = default;
  Node &operator=(Node &&) = default;

  const std::vector<std::unique_ptr<Node>> &getChildren();
  void insertChildToBegin(std::unique_ptr<Node>);
  void insertChildToEnd(std::unique_ptr<Node>);
  void insertChild(std::unique_ptr<Node>,
                   std::vector<std::unique_ptr<Node>>::const_iterator);

  // Deletes the children of the node
  void clearChildren();

  void setChildren(std::vector<std::unique_ptr<Node>> &&children);

  Node *getParent();

  void setParent(Node *parent);

  std::string getElement();

  void setElement(std::string element);

  std::unique_ptr<Node> extractChild(Node *);

private:
  std::vector<std::unique_ptr<Node>> children;

  Node *parent;

  std::string element;
};

/**
 * @class Terminal
 * @brief Represents a terminal node in abstract syntax tree.
 *
 * This class extends the `Node` class to represent a terminal node, which has
 * no children.
 *
 * @see Node
 */
class Terminal : public Node {
public:
  Terminal(std::string element);
};

class Sequence_delay_range_expr : public Node {
public:
  Sequence_delay_range_expr(std::string element);
  Sequence_delay_range_expr(Sequence_delay_range_expr &&) = default;
  Sequence_delay_range_expr &operator=(Sequence_delay_range_expr &&) = default;
};

class Port : public Node {
public:
  Port(std::string element);
  Port(Port &&) = default;
  Port &operator=(Port &&) = default;
};

class Specify_simple_path : public Node {
public:
  Specify_simple_path(std::string element);
  Specify_simple_path(Specify_simple_path &&) = default;
  Specify_simple_path &operator=(Specify_simple_path &&) = default;
};

class Event_control : public Node {
public:
  Event_control(std::string element);
  Event_control(Event_control &&) = default;
  Event_control &operator=(Event_control &&) = default;
};

class String_literal : public Node {
public:
  String_literal(std::string element);
  String_literal(String_literal &&) = default;
  String_literal &operator=(String_literal &&) = default;
};

class Charge_strength_opt : public Node {
public:
  Charge_strength_opt(std::string element);
  Charge_strength_opt(Charge_strength_opt &&) = default;
  Charge_strength_opt &operator=(Charge_strength_opt &&) = default;
};

class Dpi_import_export : public Node {
public:
  Dpi_import_export(std::string element);
  Dpi_import_export(Dpi_import_export &&) = default;
  Dpi_import_export &operator=(Dpi_import_export &&) = default;
};

class For_initialization_opt : public Node {
public:
  For_initialization_opt(std::string element);
  For_initialization_opt(For_initialization_opt &&) = default;
  For_initialization_opt &operator=(For_initialization_opt &&) = default;
};

class List_of_port_identifiers : public Node {
public:
  List_of_port_identifiers(std::string element);
  List_of_port_identifiers(List_of_port_identifiers &&) = default;
  List_of_port_identifiers &operator=(List_of_port_identifiers &&) = default;
};

class Non_integer_type : public Node {
public:
  Non_integer_type(std::string element);
  Non_integer_type(Non_integer_type &&) = default;
  Non_integer_type &operator=(Non_integer_type &&) = default;
};

class Parameter_value_ranges_opt : public Node {
public:
  Parameter_value_ranges_opt(std::string element);
  Parameter_value_ranges_opt(Parameter_value_ranges_opt &&) = default;
  Parameter_value_ranges_opt &
  operator=(Parameter_value_ranges_opt &&) = default;
};

class Package_item_no_pp : public Node {
public:
  Package_item_no_pp(std::string element);
  Package_item_no_pp(Package_item_no_pp &&) = default;
  Package_item_no_pp &operator=(Package_item_no_pp &&) = default;
};

class Sequence_delay_repetition_list : public Node {
public:
  Sequence_delay_repetition_list(std::string element);
  Sequence_delay_repetition_list(Sequence_delay_repetition_list &&) = default;
  Sequence_delay_repetition_list &
  operator=(Sequence_delay_repetition_list &&) = default;
};

class Add_expr : public Node {
public:
  Add_expr(std::string element);
  Add_expr(Add_expr &&) = default;
  Add_expr &operator=(Add_expr &&) = default;
};

class Dpi_import_item : public Node {
public:
  Dpi_import_item(std::string element);
  Dpi_import_item(Dpi_import_item &&) = default;
  Dpi_import_item &operator=(Dpi_import_item &&) = default;
};

class Tk_realtime : public Node {
public:
  Tk_realtime(std::string element);
  Tk_realtime(Tk_realtime &&) = default;
  Tk_realtime &operator=(Tk_realtime &&) = default;
};

class Case_item : public Node {
public:
  Case_item(std::string element);
  Case_item(Case_item &&) = default;
  Case_item &operator=(Case_item &&) = default;
};

class Property_if_else_expr : public Node {
public:
  Property_if_else_expr(std::string element);
  Property_if_else_expr(Property_if_else_expr &&) = default;
  Property_if_else_expr &operator=(Property_if_else_expr &&) = default;
};

class Non_anonymous_instantiation_base : public Node {
public:
  Non_anonymous_instantiation_base(std::string element);
  Non_anonymous_instantiation_base(Non_anonymous_instantiation_base &&) =
      default;
  Non_anonymous_instantiation_base &
  operator=(Non_anonymous_instantiation_base &&) = default;
};

class Unary_expr : public Node {
public:
  Unary_expr(std::string element);
  Unary_expr(Unary_expr &&) = default;
  Unary_expr &operator=(Unary_expr &&) = default;
};

class Unary_op : public Node {
public:
  Unary_op(std::string element);
  Unary_op(Unary_op &&) = default;
  Unary_op &operator=(Unary_op &&) = default;
};

class Class_id : public Node {
public:
  Class_id(std::string element);
  Class_id(Class_id &&) = default;
  Class_id &operator=(Class_id &&) = default;
};

class Reference : public Node {
public:
  Reference(std::string element);
  Reference(Reference &&) = default;
  Reference &operator=(Reference &&) = default;
};

class Cast : public Node {
public:
  Cast(std::string element);
  Cast(Cast &&) = default;
  Cast &operator=(Cast &&) = default;
};

class Tf_variable_identifier_first : public Node {
public:
  Tf_variable_identifier_first(std::string element);
  Tf_variable_identifier_first(Tf_variable_identifier_first &&) = default;
  Tf_variable_identifier_first &
  operator=(Tf_variable_identifier_first &&) = default;
};

class Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
    : public Node {
public:
  Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt(
      std::string element);
  Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt(
      Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt &&) =
      default;
  Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt &
  operator=(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
                &&) = default;
};

class Type_or_id_root : public Node {
public:
  Type_or_id_root(std::string element);
  Type_or_id_root(Type_or_id_root &&) = default;
  Type_or_id_root &operator=(Type_or_id_root &&) = default;
};

class Module_or_generate_item : public Node {
public:
  Module_or_generate_item(std::string element);
  Module_or_generate_item(Module_or_generate_item &&) = default;
  Module_or_generate_item &operator=(Module_or_generate_item &&) = default;
};

class Module_parameter_port_list_trailing_comma : public Node {
public:
  Module_parameter_port_list_trailing_comma(std::string element);
  Module_parameter_port_list_trailing_comma(
      Module_parameter_port_list_trailing_comma &&) = default;
  Module_parameter_port_list_trailing_comma &
  operator=(Module_parameter_port_list_trailing_comma &&) = default;
};

class Instantiation_type : public Node {
public:
  Instantiation_type(std::string element);
  Instantiation_type(Instantiation_type &&) = default;
  Instantiation_type &operator=(Instantiation_type &&) = default;
};

class Parameters : public Node {
public:
  Parameters(std::string element);
  Parameters(Parameters &&) = default;
  Parameters &operator=(Parameters &&) = default;
};

class Reference_or_call_base : public Node {
public:
  Reference_or_call_base(std::string element);
  Reference_or_call_base(Reference_or_call_base &&) = default;
  Reference_or_call_base &operator=(Reference_or_call_base &&) = default;
};

class Param_type_followed_by_id_and_dimensions_opt : public Node {
public:
  Param_type_followed_by_id_and_dimensions_opt(std::string element);
  Param_type_followed_by_id_and_dimensions_opt(
      Param_type_followed_by_id_and_dimensions_opt &&) = default;
  Param_type_followed_by_id_and_dimensions_opt &
  operator=(Param_type_followed_by_id_and_dimensions_opt &&) = default;
};

class Structure_or_array_pattern_key : public Node {
public:
  Structure_or_array_pattern_key(std::string element);
  Structure_or_array_pattern_key(Structure_or_array_pattern_key &&) = default;
  Structure_or_array_pattern_key &
  operator=(Structure_or_array_pattern_key &&) = default;
};

class Parameter_assign_list : public Node {
public:
  Parameter_assign_list(std::string element);
  Parameter_assign_list(Parameter_assign_list &&) = default;
  Parameter_assign_list &operator=(Parameter_assign_list &&) = default;
};

class Defparam_assign_list : public Node {
public:
  Defparam_assign_list(std::string element);
  Defparam_assign_list(Defparam_assign_list &&) = default;
  Defparam_assign_list &operator=(Defparam_assign_list &&) = default;
};

class Generate_item_list_opt : public Node {
public:
  Generate_item_list_opt(std::string element);
  Generate_item_list_opt(Generate_item_list_opt &&) = default;
  Generate_item_list_opt &operator=(Generate_item_list_opt &&) = default;
};

class Tk_octdigits : public Node {
public:
  Tk_octdigits(std::string element);
  Tk_octdigits(Tk_octdigits &&) = default;
  Tk_octdigits &operator=(Tk_octdigits &&) = default;
};

class Sequence_expr_primary : public Node {
public:
  Sequence_expr_primary(std::string element);
  Sequence_expr_primary(Sequence_expr_primary &&) = default;
  Sequence_expr_primary &operator=(Sequence_expr_primary &&) = default;
};

class Lpvalue : public Node {
public:
  Lpvalue(std::string element);
  Lpvalue(Lpvalue &&) = default;
  Lpvalue &operator=(Lpvalue &&) = default;
};

class Label_opt : public Node {
public:
  Label_opt(std::string element);
  Label_opt(Label_opt &&) = default;
  Label_opt &operator=(Label_opt &&) = default;
};

class Escapedidentifier : public Node {
public:
  Escapedidentifier(std::string element);
  Escapedidentifier(Escapedidentifier &&) = default;
  Escapedidentifier &operator=(Escapedidentifier &&) = default;
};

class Generate_item : public Node {
public:
  Generate_item(std::string element);
  Generate_item(Generate_item &&) = default;
  Generate_item &operator=(Generate_item &&) = default;
};

class Data_type_primitive : public Node {
public:
  Data_type_primitive(std::string element);
  Data_type_primitive(Data_type_primitive &&) = default;
  Data_type_primitive &operator=(Data_type_primitive &&) = default;
};

class Spec_reference_event : public Node {
public:
  Spec_reference_event(std::string element);
  Spec_reference_event(Spec_reference_event &&) = default;
  Spec_reference_event &operator=(Spec_reference_event &&) = default;
};

class Udp_input_declaration_list : public Node {
public:
  Udp_input_declaration_list(std::string element);
  Udp_input_declaration_list(Udp_input_declaration_list &&) = default;
  Udp_input_declaration_list &
  operator=(Udp_input_declaration_list &&) = default;
};

class Non_port_module_item : public Node {
public:
  Non_port_module_item(std::string element);
  Non_port_module_item(Non_port_module_item &&) = default;
  Non_port_module_item &operator=(Non_port_module_item &&) = default;
};

class List_of_ports_or_port_declarations_trailing_comma_non_ansi : public Node {
public:
  List_of_ports_or_port_declarations_trailing_comma_non_ansi(
      std::string element);
  List_of_ports_or_port_declarations_trailing_comma_non_ansi(
      List_of_ports_or_port_declarations_trailing_comma_non_ansi &&) = default;
  List_of_ports_or_port_declarations_trailing_comma_non_ansi &operator=(
      List_of_ports_or_port_declarations_trailing_comma_non_ansi &&) = default;
};

class Module_parameter_port_list_opt : public Node {
public:
  Module_parameter_port_list_opt(std::string element);
  Module_parameter_port_list_opt(Module_parameter_port_list_opt &&) = default;
  Module_parameter_port_list_opt &
  operator=(Module_parameter_port_list_opt &&) = default;
};

class Property_prefix_expr : public Node {
public:
  Property_prefix_expr(std::string element);
  Property_prefix_expr(Property_prefix_expr &&) = default;
  Property_prefix_expr &operator=(Property_prefix_expr &&) = default;
};

class Expr_primary_braces : public Node {
public:
  Expr_primary_braces(std::string element);
  Expr_primary_braces(Expr_primary_braces &&) = default;
  Expr_primary_braces &operator=(Expr_primary_braces &&) = default;
};

class Pow_expr : public Node {
public:
  Pow_expr(std::string element);
  Pow_expr(Pow_expr &&) = default;
  Pow_expr &operator=(Pow_expr &&) = default;
};

class For_init_decl_or_assign : public Node {
public:
  For_init_decl_or_assign(std::string element);
  For_init_decl_or_assign(For_init_decl_or_assign &&) = default;
  For_init_decl_or_assign &operator=(For_init_decl_or_assign &&) = default;
};

class Udp_initial : public Node {
public:
  Udp_initial(std::string element);
  Udp_initial(Udp_initial &&) = default;
  Udp_initial &operator=(Udp_initial &&) = default;
};

class Tf_port_list_paren_opt : public Node {
public:
  Tf_port_list_paren_opt(std::string element);
  Tf_port_list_paren_opt(Tf_port_list_paren_opt &&) = default;
  Tf_port_list_paren_opt &operator=(Tf_port_list_paren_opt &&) = default;
};

class Struct_data_type : public Node {
public:
  Struct_data_type(std::string element);
  Struct_data_type(Struct_data_type &&) = default;
  Struct_data_type &operator=(Struct_data_type &&) = default;
};

class Udp_sequ_entry : public Node {
public:
  Udp_sequ_entry(std::string element);
  Udp_sequ_entry(Udp_sequ_entry &&) = default;
  Udp_sequ_entry &operator=(Udp_sequ_entry &&) = default;
};

class Net_variable_or_decl_assign : public Node {
public:
  Net_variable_or_decl_assign(std::string element);
  Net_variable_or_decl_assign(Net_variable_or_decl_assign &&) = default;
  Net_variable_or_decl_assign &
  operator=(Net_variable_or_decl_assign &&) = default;
};

class Parameter_value_byname_list_trailing_comma : public Node {
public:
  Parameter_value_byname_list_trailing_comma(std::string element);
  Parameter_value_byname_list_trailing_comma(
      Parameter_value_byname_list_trailing_comma &&) = default;
  Parameter_value_byname_list_trailing_comma &
  operator=(Parameter_value_byname_list_trailing_comma &&) = default;
};

class Inc_or_dec_expression : public Node {
public:
  Inc_or_dec_expression(std::string element);
  Inc_or_dec_expression(Inc_or_dec_expression &&) = default;
  Inc_or_dec_expression &operator=(Inc_or_dec_expression &&) = default;
};

class Net_type : public Node {
public:
  Net_type(std::string element);
  Net_type(Net_type &&) = default;
  Net_type &operator=(Net_type &&) = default;
};

class Select_dimensions_opt : public Node {
public:
  Select_dimensions_opt(std::string element);
  Select_dimensions_opt(Select_dimensions_opt &&) = default;
  Select_dimensions_opt &operator=(Select_dimensions_opt &&) = default;
};

class Spec_polarity : public Node {
public:
  Spec_polarity(std::string element);
  Spec_polarity(Spec_polarity &&) = default;
  Spec_polarity &operator=(Spec_polarity &&) = default;
};

class Macro_formal_parameter : public Node {
public:
  Macro_formal_parameter(std::string element);
  Macro_formal_parameter(Macro_formal_parameter &&) = default;
  Macro_formal_parameter &operator=(Macro_formal_parameter &&) = default;
};

class Structure_or_array_pattern_expression : public Node {
public:
  Structure_or_array_pattern_expression(std::string element);
  Structure_or_array_pattern_expression(
      Structure_or_array_pattern_expression &&) = default;
  Structure_or_array_pattern_expression &
  operator=(Structure_or_array_pattern_expression &&) = default;
};

class For_step : public Node {
public:
  For_step(std::string element);
  For_step(For_step &&) = default;
  For_step &operator=(For_step &&) = default;
};

class Specparam_list : public Node {
public:
  Specparam_list(std::string element);
  Specparam_list(Specparam_list &&) = default;
  Specparam_list &operator=(Specparam_list &&) = default;
};

class Tk_binbase : public Node {
public:
  Tk_binbase(std::string element);
  Tk_binbase(Tk_binbase &&) = default;
  Tk_binbase &operator=(Tk_binbase &&) = default;
};

class Tk_stringliteral : public Node {
public:
  Tk_stringliteral(std::string element);
  Tk_stringliteral(Tk_stringliteral &&) = default;
  Tk_stringliteral &operator=(Tk_stringliteral &&) = default;
};

class Var_opt : public Node {
public:
  Var_opt(std::string element);
  Var_opt(Var_opt &&) = default;
  Var_opt &operator=(Var_opt &&) = default;
};

class Identifier_optional_unpacked_dimensions : public Node {
public:
  Identifier_optional_unpacked_dimensions(std::string element);
  Identifier_optional_unpacked_dimensions(
      Identifier_optional_unpacked_dimensions &&) = default;
  Identifier_optional_unpacked_dimensions &
  operator=(Identifier_optional_unpacked_dimensions &&) = default;
};

class Function_item_list : public Node {
public:
  Function_item_list(std::string element);
  Function_item_list(Function_item_list &&) = default;
  Function_item_list &operator=(Function_item_list &&) = default;
};

class Type_declaration : public Node {
public:
  Type_declaration(std::string element);
  Type_declaration(Type_declaration &&) = default;
  Type_declaration &operator=(Type_declaration &&) = default;
};

class Udp_body : public Node {
public:
  Udp_body(std::string element);
  Udp_body(Udp_body &&) = default;
  Udp_body &operator=(Udp_body &&) = default;
};

class Mul_expr : public Node {
public:
  Mul_expr(std::string element);
  Mul_expr(Mul_expr &&) = default;
  Mul_expr &operator=(Mul_expr &&) = default;
};

class Par_block : public Node {
public:
  Par_block(std::string element);
  Par_block(Par_block &&) = default;
  Par_block &operator=(Par_block &&) = default;
};

class Keywordidentifier : public Node {
public:
  Keywordidentifier(std::string element);
  Keywordidentifier(Keywordidentifier &&) = default;
  Keywordidentifier &operator=(Keywordidentifier &&) = default;
};

class Logeq_expr : public Node {
public:
  Logeq_expr(std::string element);
  Logeq_expr(Logeq_expr &&) = default;
  Logeq_expr &operator=(Logeq_expr &&) = default;
};

class Module_common_item : public Node {
public:
  Module_common_item(std::string element);
  Module_common_item(Module_common_item &&) = default;
  Module_common_item &operator=(Module_common_item &&) = default;
};

class Primitive_gate_instance : public Node {
public:
  Primitive_gate_instance(std::string element);
  Primitive_gate_instance(Primitive_gate_instance &&) = default;
  Primitive_gate_instance &operator=(Primitive_gate_instance &&) = default;
};

class Data_type_or_implicit : public Node {
public:
  Data_type_or_implicit(std::string element);
  Data_type_or_implicit(Data_type_or_implicit &&) = default;
  Data_type_or_implicit &operator=(Data_type_or_implicit &&) = default;
};

class Tk_octbase : public Node {
public:
  Tk_octbase(std::string element);
  Tk_octbase(Tk_octbase &&) = default;
  Tk_octbase &operator=(Tk_octbase &&) = default;
};

class Sequence_expr : public Node {
public:
  Sequence_expr(std::string element);
  Sequence_expr(Sequence_expr &&) = default;
  Sequence_expr &operator=(Sequence_expr &&) = default;
};

class Tk_hexbase : public Node {
public:
  Tk_hexbase(std::string element);
  Tk_hexbase(Tk_hexbase &&) = default;
  Tk_hexbase &operator=(Tk_hexbase &&) = default;
};

class Property_expr : public Node {
public:
  Property_expr(std::string element);
  Property_expr(Property_expr &&) = default;
  Property_expr &operator=(Property_expr &&) = default;
};

class Seq_block : public Node {
public:
  Seq_block(std::string element);
  Seq_block(Seq_block &&) = default;
  Seq_block &operator=(Seq_block &&) = default;
};

class Task_item : public Node {
public:
  Task_item(std::string element);
  Task_item(Task_item &&) = default;
  Task_item &operator=(Task_item &&) = default;
};

class Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt
    : public Node {
public:
  Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt(
      std::string element);
  Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt(
      Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt &&) =
      default;
  Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt &
  operator=(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt &&) =
      default;
};

class Specify_block : public Node {
public:
  Specify_block(std::string element);
  Specify_block(Specify_block &&) = default;
  Specify_block &operator=(Specify_block &&) = default;
};

class Tk_decnumber : public Node {
public:
  Tk_decnumber(std::string element);
  Tk_decnumber(Tk_decnumber &&) = default;
  Tk_decnumber &operator=(Tk_decnumber &&) = default;
};

class Tk_decbase : public Node {
public:
  Tk_decbase(std::string element);
  Tk_decbase(Tk_decbase &&) = default;
  Tk_decbase &operator=(Tk_decbase &&) = default;
};

class Property_implication_expr : public Node {
public:
  Property_implication_expr(std::string element);
  Property_implication_expr(Property_implication_expr &&) = default;
  Property_implication_expr &operator=(Property_implication_expr &&) = default;
};

class Bit_logic_opt : public Node {
public:
  Bit_logic_opt(std::string element);
  Bit_logic_opt(Bit_logic_opt &&) = default;
  Bit_logic_opt &operator=(Bit_logic_opt &&) = default;
};

class Integer_atom_type : public Node {
public:
  Integer_atom_type(std::string element);
  Integer_atom_type(Integer_atom_type &&) = default;
  Integer_atom_type &operator=(Integer_atom_type &&) = default;
};

class Lifetime : public Node {
public:
  Lifetime(std::string element);
  Lifetime(Lifetime &&) = default;
  Lifetime &operator=(Lifetime &&) = default;
};

class Any_argument_list : public Node {
public:
  Any_argument_list(std::string element);
  Any_argument_list(Any_argument_list &&) = default;
  Any_argument_list &operator=(Any_argument_list &&) = default;
};

class Delay_value_list : public Node {
public:
  Delay_value_list(std::string element);
  Delay_value_list(Delay_value_list &&) = default;
  Delay_value_list &operator=(Delay_value_list &&) = default;
};

class Module_port_declaration : public Node {
public:
  Module_port_declaration(std::string element);
  Module_port_declaration(Module_port_declaration &&) = default;
  Module_port_declaration &operator=(Module_port_declaration &&) = default;
};

class Jump_statement : public Node {
public:
  Jump_statement(std::string element);
  Jump_statement(Jump_statement &&) = default;
  Jump_statement &operator=(Jump_statement &&) = default;
};

class Delay_value : public Node {
public:
  Delay_value(std::string element);
  Delay_value(Delay_value &&) = default;
  Delay_value &operator=(Delay_value &&) = default;
};

class Sequence_or_expr : public Node {
public:
  Sequence_or_expr(std::string element);
  Sequence_or_expr(Sequence_or_expr &&) = default;
  Sequence_or_expr &operator=(Sequence_or_expr &&) = default;
};

class Module_attribute_foreign_opt : public Node {
public:
  Module_attribute_foreign_opt(std::string element);
  Module_attribute_foreign_opt(Module_attribute_foreign_opt &&) = default;
  Module_attribute_foreign_opt &
  operator=(Module_attribute_foreign_opt &&) = default;
};

class Tf_port_direction_opt : public Node {
public:
  Tf_port_direction_opt(std::string element);
  Tf_port_direction_opt(Tf_port_direction_opt &&) = default;
  Tf_port_direction_opt &operator=(Tf_port_direction_opt &&) = default;
};

class Tf_port_item_expr_opt : public Node {
public:
  Tf_port_item_expr_opt(std::string element);
  Tf_port_item_expr_opt(Tf_port_item_expr_opt &&) = default;
  Tf_port_item_expr_opt &operator=(Tf_port_item_expr_opt &&) = default;
};

class Cont_assign_list : public Node {
public:
  Cont_assign_list(std::string element);
  Cont_assign_list(Cont_assign_list &&) = default;
  Cont_assign_list &operator=(Cont_assign_list &&) = default;
};

class Any_argument_list_trailing_comma : public Node {
public:
  Any_argument_list_trailing_comma(std::string element);
  Any_argument_list_trailing_comma(Any_argument_list_trailing_comma &&) =
      default;
  Any_argument_list_trailing_comma &
  operator=(Any_argument_list_trailing_comma &&) = default;
};

class Procedural_continuous_assignment : public Node {
public:
  Procedural_continuous_assignment(std::string element);
  Procedural_continuous_assignment(Procedural_continuous_assignment &&) =
      default;
  Procedural_continuous_assignment &
  operator=(Procedural_continuous_assignment &&) = default;
};

class Expression_or_dist : public Node {
public:
  Expression_or_dist(std::string element);
  Expression_or_dist(Expression_or_dist &&) = default;
  Expression_or_dist &operator=(Expression_or_dist &&) = default;
};

class Module_start : public Node {
public:
  Module_start(std::string element);
  Module_start(Module_start &&) = default;
  Module_start &operator=(Module_start &&) = default;
};

class Expr_primary_parens : public Node {
public:
  Expr_primary_parens(std::string element);
  Expr_primary_parens(Expr_primary_parens &&) = default;
  Expr_primary_parens &operator=(Expr_primary_parens &&) = default;
};

class Open_range_list : public Node {
public:
  Open_range_list(std::string element);
  Open_range_list(Open_range_list &&) = default;
  Open_range_list &operator=(Open_range_list &&) = default;
};

class Unary_prefix_expr : public Node {
public:
  Unary_prefix_expr(std::string element);
  Unary_prefix_expr(Unary_prefix_expr &&) = default;
  Unary_prefix_expr &operator=(Unary_prefix_expr &&) = default;
};

class Delay_identifier : public Node {
public:
  Delay_identifier(std::string element);
  Delay_identifier(Delay_identifier &&) = default;
  Delay_identifier &operator=(Delay_identifier &&) = default;
};

class List_of_identifiers_unpacked_dimensions : public Node {
public:
  List_of_identifiers_unpacked_dimensions(std::string element);
  List_of_identifiers_unpacked_dimensions(
      List_of_identifiers_unpacked_dimensions &&) = default;
  List_of_identifiers_unpacked_dimensions &
  operator=(List_of_identifiers_unpacked_dimensions &&) = default;
};

class Delay_scope : public Node {
public:
  Delay_scope(std::string element);
  Delay_scope(Delay_scope &&) = default;
  Delay_scope &operator=(Delay_scope &&) = default;
};

class Action_block : public Node {
public:
  Action_block(std::string element);
  Action_block(Action_block &&) = default;
  Action_block &operator=(Action_block &&) = default;
};

class Trailing_assign_opt : public Node {
public:
  Trailing_assign_opt(std::string element);
  Trailing_assign_opt(Trailing_assign_opt &&) = default;
  Trailing_assign_opt &operator=(Trailing_assign_opt &&) = default;
};

class Class_item : public Node {
public:
  Class_item(std::string element);
  Class_item(Class_item &&) = default;
  Class_item &operator=(Class_item &&) = default;
};

class Enum_name_list_trailing_comma : public Node {
public:
  Enum_name_list_trailing_comma(std::string element);
  Enum_name_list_trailing_comma(Enum_name_list_trailing_comma &&) = default;
  Enum_name_list_trailing_comma &
  operator=(Enum_name_list_trailing_comma &&) = default;
};

class Udp_port_list : public Node {
public:
  Udp_port_list(std::string element);
  Udp_port_list(Udp_port_list &&) = default;
  Udp_port_list &operator=(Udp_port_list &&) = default;
};

class Equiv_impl_expr : public Node {
public:
  Equiv_impl_expr(std::string element);
  Equiv_impl_expr(Equiv_impl_expr &&) = default;
  Equiv_impl_expr &operator=(Equiv_impl_expr &&) = default;
};

class Class_new : public Node {
public:
  Class_new(std::string element);
  Class_new(Class_new &&) = default;
  Class_new &operator=(Class_new &&) = default;
};

class Port_net_type : public Node {
public:
  Port_net_type(std::string element);
  Port_net_type(Port_net_type &&) = default;
  Port_net_type &operator=(Port_net_type &&) = default;
};

class Unqualified_id : public Node {
public:
  Unqualified_id(std::string element);
  Unqualified_id(Unqualified_id &&) = default;
  Unqualified_id &operator=(Unqualified_id &&) = default;
};

class Begin : public Node {
public:
  Begin(std::string element);
  Begin(Begin &&) = default;
  Begin &operator=(Begin &&) = default;
};

class System_tf_call : public Node {
public:
  System_tf_call(std::string element);
  System_tf_call(System_tf_call &&) = default;
  System_tf_call &operator=(System_tf_call &&) = default;
};

class Parameter_value_byname_list_item_last : public Node {
public:
  Parameter_value_byname_list_item_last(std::string element);
  Parameter_value_byname_list_item_last(
      Parameter_value_byname_list_item_last &&) = default;
  Parameter_value_byname_list_item_last &
  operator=(Parameter_value_byname_list_item_last &&) = default;
};

class Conditional_generate_construct : public Node {
public:
  Conditional_generate_construct(std::string element);
  Conditional_generate_construct(Conditional_generate_construct &&) = default;
  Conditional_generate_construct &
  operator=(Conditional_generate_construct &&) = default;
};

class Timescale_directive : public Node {
public:
  Timescale_directive(std::string element);
  Timescale_directive(Timescale_directive &&) = default;
  Timescale_directive &operator=(Timescale_directive &&) = default;
};

class Port_expression : public Node {
public:
  Port_expression(std::string element);
  Port_expression(Port_expression &&) = default;
  Port_expression &operator=(Port_expression &&) = default;
};

class Udp_sequ_entry_list : public Node {
public:
  Udp_sequ_entry_list(std::string element);
  Udp_sequ_entry_list(Udp_sequ_entry_list &&) = default;
  Udp_sequ_entry_list &operator=(Udp_sequ_entry_list &&) = default;
};

class Symbol_or_label : public Node {
public:
  Symbol_or_label(std::string element);
  Symbol_or_label(Symbol_or_label &&) = default;
  Symbol_or_label &operator=(Symbol_or_label &&) = default;
};

class Simple_sequence_expr : public Node {
public:
  Simple_sequence_expr(std::string element);
  Simple_sequence_expr(Simple_sequence_expr &&) = default;
  Simple_sequence_expr &operator=(Simple_sequence_expr &&) = default;
};

class Systemtfidentifier : public Node {
public:
  Systemtfidentifier(std::string element);
  Systemtfidentifier(Systemtfidentifier &&) = default;
  Systemtfidentifier &operator=(Systemtfidentifier &&) = default;
};

class Tk_unbasednumber : public Node {
public:
  Tk_unbasednumber(std::string element);
  Tk_unbasednumber(Tk_unbasednumber &&) = default;
  Tk_unbasednumber &operator=(Tk_unbasednumber &&) = default;
};

class Decl_dimensions_opt : public Node {
public:
  Decl_dimensions_opt(std::string element);
  Decl_dimensions_opt(Decl_dimensions_opt &&) = default;
  Decl_dimensions_opt &operator=(Decl_dimensions_opt &&) = default;
};

class Class_items_opt : public Node {
public:
  Class_items_opt(std::string element);
  Class_items_opt(Class_items_opt &&) = default;
  Class_items_opt &operator=(Class_items_opt &&) = default;
};

class Enum_name : public Node {
public:
  Enum_name(std::string element);
  Enum_name(Enum_name &&) = default;
  Enum_name &operator=(Enum_name &&) = default;
};

class Parameter_value_opt : public Node {
public:
  Parameter_value_opt(std::string element);
  Parameter_value_opt(Parameter_value_opt &&) = default;
  Parameter_value_opt &operator=(Parameter_value_opt &&) = default;
};

class Specify_edge_path : public Node {
public:
  Specify_edge_path(std::string element);
  Specify_edge_path(Specify_edge_path &&) = default;
  Specify_edge_path &operator=(Specify_edge_path &&) = default;
};

class Implicit_class_handle : public Node {
public:
  Implicit_class_handle(std::string element);
  Implicit_class_handle(Implicit_class_handle &&) = default;
  Implicit_class_handle &operator=(Implicit_class_handle &&) = default;
};

class Module_item : public Node {
public:
  Module_item(std::string element);
  Module_item(Module_item &&) = default;
  Module_item &operator=(Module_item &&) = default;
};

class Statement_item : public Node {
public:
  Statement_item(std::string element);
  Statement_item(Statement_item &&) = default;
  Statement_item &operator=(Statement_item &&) = default;
};

class Type_identifier_followed_by_id : public Node {
public:
  Type_identifier_followed_by_id(std::string element);
  Type_identifier_followed_by_id(Type_identifier_followed_by_id &&) = default;
  Type_identifier_followed_by_id &
  operator=(Type_identifier_followed_by_id &&) = default;
};

class Method_prototype : public Node {
public:
  Method_prototype(std::string element);
  Method_prototype(Method_prototype &&) = default;
  Method_prototype &operator=(Method_prototype &&) = default;
};

class Tf_port_item : public Node {
public:
  Tf_port_item(std::string element);
  Tf_port_item(Tf_port_item &&) = default;
  Tf_port_item &operator=(Tf_port_item &&) = default;
};

class Block_item_or_statement_or_null_list : public Node {
public:
  Block_item_or_statement_or_null_list(std::string element);
  Block_item_or_statement_or_null_list(
      Block_item_or_statement_or_null_list &&) = default;
  Block_item_or_statement_or_null_list &
  operator=(Block_item_or_statement_or_null_list &&) = default;
};

class Endnew_opt : public Node {
public:
  Endnew_opt(std::string element);
  Endnew_opt(Endnew_opt &&) = default;
  Endnew_opt &operator=(Endnew_opt &&) = default;
};

class Specify_item_list_opt : public Node {
public:
  Specify_item_list_opt(std::string element);
  Specify_item_list_opt(Specify_item_list_opt &&) = default;
  Specify_item_list_opt &operator=(Specify_item_list_opt &&) = default;
};

class Specify_simple_path_decl : public Node {
public:
  Specify_simple_path_decl(std::string element);
  Specify_simple_path_decl(Specify_simple_path_decl &&) = default;
  Specify_simple_path_decl &operator=(Specify_simple_path_decl &&) = default;
};

class Tk_rs_eq : public Node {
public:
  Tk_rs_eq(std::string element);
  Tk_rs_eq(Tk_rs_eq &&) = default;
  Tk_rs_eq &operator=(Tk_rs_eq &&) = default;
};

class Package_import_item_list : public Node {
public:
  Package_import_item_list(std::string element);
  Package_import_item_list(Package_import_item_list &&) = default;
  Package_import_item_list &operator=(Package_import_item_list &&) = default;
};

class Udp_port_decl : public Node {
public:
  Udp_port_decl(std::string element);
  Udp_port_decl(Udp_port_decl &&) = default;
  Udp_port_decl &operator=(Udp_port_decl &&) = default;
};

class With_exprs_suffix : public Node {
public:
  With_exprs_suffix(std::string element);
  With_exprs_suffix(With_exprs_suffix &&) = default;
  With_exprs_suffix &operator=(With_exprs_suffix &&) = default;
};

class Generate_region : public Node {
public:
  Generate_region(std::string element);
  Generate_region(Generate_region &&) = default;
  Generate_region &operator=(Generate_region &&) = default;
};

class Call_base : public Node {
public:
  Call_base(std::string element);
  Call_base(Call_base &&) = default;
  Call_base &operator=(Call_base &&) = default;
};

class Array_locator_method : public Node {
public:
  Array_locator_method(std::string element);
  Array_locator_method(Array_locator_method &&) = default;
  Array_locator_method &operator=(Array_locator_method &&) = default;
};

class Port_declaration_ansi : public Node {
public:
  Port_declaration_ansi(std::string element);
  Port_declaration_ansi(Port_declaration_ansi &&) = default;
  Port_declaration_ansi &operator=(Port_declaration_ansi &&) = default;
};

class Bitand_expr : public Node {
public:
  Bitand_expr(std::string element);
  Bitand_expr(Bitand_expr &&) = default;
  Bitand_expr &operator=(Bitand_expr &&) = default;
};

class Range_list_in_braces : public Node {
public:
  Range_list_in_braces(std::string element);
  Range_list_in_braces(Range_list_in_braces &&) = default;
  Range_list_in_braces &operator=(Range_list_in_braces &&) = default;
};

class Module_parameter_port_list_item_last : public Node {
public:
  Module_parameter_port_list_item_last(std::string element);
  Module_parameter_port_list_item_last(
      Module_parameter_port_list_item_last &&) = default;
  Module_parameter_port_list_item_last &
  operator=(Module_parameter_port_list_item_last &&) = default;
};

class Hex_based_number : public Node {
public:
  Hex_based_number(std::string element);
  Hex_based_number(Hex_based_number &&) = default;
  Hex_based_number &operator=(Hex_based_number &&) = default;
};

class Hierarchy_event_identifier : public Node {
public:
  Hierarchy_event_identifier(std::string element);
  Hierarchy_event_identifier(Hierarchy_event_identifier &&) = default;
  Hierarchy_event_identifier &
  operator=(Hierarchy_event_identifier &&) = default;
};

class List_of_variable_decl_assignments : public Node {
public:
  List_of_variable_decl_assignments(std::string element);
  List_of_variable_decl_assignments(List_of_variable_decl_assignments &&) =
      default;
  List_of_variable_decl_assignments &
  operator=(List_of_variable_decl_assignments &&) = default;
};

class Random_qualifier_opt : public Node {
public:
  Random_qualifier_opt(std::string element);
  Random_qualifier_opt(Random_qualifier_opt &&) = default;
  Random_qualifier_opt &operator=(Random_qualifier_opt &&) = default;
};

class Drive_strength_opt : public Node {
public:
  Drive_strength_opt(std::string element);
  Drive_strength_opt(Drive_strength_opt &&) = default;
  Drive_strength_opt &operator=(Drive_strength_opt &&) = default;
};

class Tk_timeliteral : public Node {
public:
  Tk_timeliteral(std::string element);
  Tk_timeliteral(Tk_timeliteral &&) = default;
  Tk_timeliteral &operator=(Tk_timeliteral &&) = default;
};

class Value_range : public Node {
public:
  Value_range(std::string element);
  Value_range(Value_range &&) = default;
  Value_range &operator=(Value_range &&) = default;
};

class Expr_mintypmax_generalized : public Node {
public:
  Expr_mintypmax_generalized(std::string element);
  Expr_mintypmax_generalized(Expr_mintypmax_generalized &&) = default;
  Expr_mintypmax_generalized &
  operator=(Expr_mintypmax_generalized &&) = default;
};

class Polarity_operator : public Node {
public:
  Polarity_operator(std::string element);
  Polarity_operator(Polarity_operator &&) = default;
  Polarity_operator &operator=(Polarity_operator &&) = default;
};

class Package_item : public Node {
public:
  Package_item(std::string element);
  Package_item(Package_item &&) = default;
  Package_item &operator=(Package_item &&) = default;
};

class For_initialization : public Node {
public:
  For_initialization(std::string element);
  For_initialization(For_initialization &&) = default;
  For_initialization &operator=(For_initialization &&) = default;
};

class Enum_data_type : public Node {
public:
  Enum_data_type(std::string element);
  Enum_data_type(Enum_data_type &&) = default;
  Enum_data_type &operator=(Enum_data_type &&) = default;
};

class Blocking_assignment : public Node {
public:
  Blocking_assignment(std::string element);
  Blocking_assignment(Blocking_assignment &&) = default;
  Blocking_assignment &operator=(Blocking_assignment &&) = default;
};

class Delay1 : public Node {
public:
  Delay1(std::string element);
  Delay1(Delay1 &&) = default;
  Delay1 &operator=(Delay1 &&) = default;
};

class Based_number : public Node {
public:
  Based_number(std::string element);
  Based_number(Based_number &&) = default;
  Based_number &operator=(Based_number &&) = default;
};

class Procedural_timing_control_statement : public Node {
public:
  Procedural_timing_control_statement(std::string element);
  Procedural_timing_control_statement(Procedural_timing_control_statement &&) =
      default;
  Procedural_timing_control_statement &
  operator=(Procedural_timing_control_statement &&) = default;
};

class Block_item_decl : public Node {
public:
  Block_item_decl(std::string element);
  Block_item_decl(Block_item_decl &&) = default;
  Block_item_decl &operator=(Block_item_decl &&) = default;
};

class Net_variable_or_decl_assigns : public Node {
public:
  Net_variable_or_decl_assigns(std::string element);
  Net_variable_or_decl_assigns(Net_variable_or_decl_assigns &&) = default;
  Net_variable_or_decl_assigns &
  operator=(Net_variable_or_decl_assigns &&) = default;
};

class Time_literal : public Node {
public:
  Time_literal(std::string element);
  Time_literal(Time_literal &&) = default;
  Time_literal &operator=(Time_literal &&) = default;
};

class Function_item_data_declaration : public Node {
public:
  Function_item_data_declaration(std::string element);
  Function_item_data_declaration(Function_item_data_declaration &&) = default;
  Function_item_data_declaration &
  operator=(Function_item_data_declaration &&) = default;
};

class Decl_variable_dimension : public Node {
public:
  Decl_variable_dimension(std::string element);
  Decl_variable_dimension(Decl_variable_dimension &&) = default;
  Decl_variable_dimension &operator=(Decl_variable_dimension &&) = default;
};

class Tf_port_list_opt : public Node {
public:
  Tf_port_list_opt(std::string element);
  Tf_port_list_opt(Tf_port_list_opt &&) = default;
  Tf_port_list_opt &operator=(Tf_port_list_opt &&) = default;
};

class Endfunction_label_opt : public Node {
public:
  Endfunction_label_opt(std::string element);
  Endfunction_label_opt(Endfunction_label_opt &&) = default;
  Endfunction_label_opt &operator=(Endfunction_label_opt &&) = default;
};

class Qualified_id : public Node {
public:
  Qualified_id(std::string element);
  Qualified_id(Qualified_id &&) = default;
  Qualified_id &operator=(Qualified_id &&) = default;
};

class Immediate_assertion_statement : public Node {
public:
  Immediate_assertion_statement(std::string element);
  Immediate_assertion_statement(Immediate_assertion_statement &&) = default;
  Immediate_assertion_statement &
  operator=(Immediate_assertion_statement &&) = default;
};

class Join_keyword : public Node {
public:
  Join_keyword(std::string element);
  Join_keyword(Join_keyword &&) = default;
  Join_keyword &operator=(Join_keyword &&) = default;
};

class Tk_bindigits : public Node {
public:
  Tk_bindigits(std::string element);
  Tk_bindigits(Tk_bindigits &&) = default;
  Tk_bindigits &operator=(Tk_bindigits &&) = default;
};

class Event_trigger : public Node {
public:
  Event_trigger(std::string element);
  Event_trigger(Event_trigger &&) = default;
  Event_trigger &operator=(Event_trigger &&) = default;
};

class Dynamic_array_new : public Node {
public:
  Dynamic_array_new(std::string element);
  Dynamic_array_new(Dynamic_array_new &&) = default;
  Dynamic_array_new &operator=(Dynamic_array_new &&) = default;
};

class Matches_expr : public Node {
public:
  Matches_expr(std::string element);
  Matches_expr(Matches_expr &&) = default;
  Matches_expr &operator=(Matches_expr &&) = default;
};

class Port_reference_list : public Node {
public:
  Port_reference_list(std::string element);
  Port_reference_list(Port_reference_list &&) = default;
  Port_reference_list &operator=(Port_reference_list &&) = default;
};

class Array_reduction_method : public Node {
public:
  Array_reduction_method(std::string element);
  Array_reduction_method(Array_reduction_method &&) = default;
  Array_reduction_method &operator=(Array_reduction_method &&) = default;
};

class Builtin_array_method : public Node {
public:
  Builtin_array_method(std::string element);
  Builtin_array_method(Builtin_array_method &&) = default;
  Builtin_array_method &operator=(Builtin_array_method &&) = default;
};

class Package_declaration : public Node {
public:
  Package_declaration(std::string element);
  Package_declaration(Package_declaration &&) = default;
  Package_declaration &operator=(Package_declaration &&) = default;
};

class Assignment_pattern_expression : public Node {
public:
  Assignment_pattern_expression(std::string element);
  Assignment_pattern_expression(Assignment_pattern_expression &&) = default;
  Assignment_pattern_expression &
  operator=(Assignment_pattern_expression &&) = default;
};

class Drive_strength : public Node {
public:
  Drive_strength(std::string element);
  Drive_strength(Drive_strength &&) = default;
  Drive_strength &operator=(Drive_strength &&) = default;
};

class Port_declaration_non_ansi : public Node {
public:
  Port_declaration_non_ansi(std::string element);
  Port_declaration_non_ansi(Port_declaration_non_ansi &&) = default;
  Port_declaration_non_ansi &operator=(Port_declaration_non_ansi &&) = default;
};

class Module_parameter_port_list : public Node {
public:
  Module_parameter_port_list(std::string element);
  Module_parameter_port_list(Module_parameter_port_list &&) = default;
  Module_parameter_port_list &
  operator=(Module_parameter_port_list &&) = default;
};

class Var_type : public Node {
public:
  Var_type(std::string element);
  Var_type(Var_type &&) = default;
  Var_type &operator=(Var_type &&) = default;
};

class Parameter_opt : public Node {
public:
  Parameter_opt(std::string element);
  Parameter_opt(Parameter_opt &&) = default;
  Parameter_opt &operator=(Parameter_opt &&) = default;
};

class Module_item_list : public Node {
public:
  Module_item_list(std::string element);
  Module_item_list(Module_item_list &&) = default;
  Module_item_list &operator=(Module_item_list &&) = default;
};

class Genericidentifier : public Node {
public:
  Genericidentifier(std::string element);
  Genericidentifier(Genericidentifier &&) = default;
  Genericidentifier &operator=(Genericidentifier &&) = default;
};

class Package_item_list_opt : public Node {
public:
  Package_item_list_opt(std::string element);
  Package_item_list_opt(Package_item_list_opt &&) = default;
  Package_item_list_opt &operator=(Package_item_list_opt &&) = default;
};

class List_of_ports_or_port_declarations_item_last_ansi : public Node {
public:
  List_of_ports_or_port_declarations_item_last_ansi(std::string element);
  List_of_ports_or_port_declarations_item_last_ansi(
      List_of_ports_or_port_declarations_item_last_ansi &&) = default;
  List_of_ports_or_port_declarations_item_last_ansi &
  operator=(List_of_ports_or_port_declarations_item_last_ansi &&) = default;
};

class Data_type_or_implicit_followed_by_id_and_dimensions_opt : public Node {
public:
  Data_type_or_implicit_followed_by_id_and_dimensions_opt(std::string element);
  Data_type_or_implicit_followed_by_id_and_dimensions_opt(
      Data_type_or_implicit_followed_by_id_and_dimensions_opt &&) = default;
  Data_type_or_implicit_followed_by_id_and_dimensions_opt &operator=(
      Data_type_or_implicit_followed_by_id_and_dimensions_opt &&) = default;
};

class Xor_expr : public Node {
public:
  Xor_expr(std::string element);
  Xor_expr(Xor_expr &&) = default;
  Xor_expr &operator=(Xor_expr &&) = default;
};

class Dec_based_number : public Node {
public:
  Dec_based_number(std::string element);
  Dec_based_number(Dec_based_number &&) = default;
  Dec_based_number &operator=(Dec_based_number &&) = default;
};

class Loop_statement : public Node {
public:
  Loop_statement(std::string element);
  Loop_statement(Loop_statement &&) = default;
  Loop_statement &operator=(Loop_statement &&) = default;
};

class Data_declaration_or_module_instantiation : public Node {
public:
  Data_declaration_or_module_instantiation(std::string element);
  Data_declaration_or_module_instantiation(
      Data_declaration_or_module_instantiation &&) = default;
  Data_declaration_or_module_instantiation &
  operator=(Data_declaration_or_module_instantiation &&) = default;
};

class Udp_comb_entry_list : public Node {
public:
  Udp_comb_entry_list(std::string element);
  Udp_comb_entry_list(Udp_comb_entry_list &&) = default;
  Udp_comb_entry_list &operator=(Udp_comb_entry_list &&) = default;
};

class Bit_logic : public Node {
public:
  Bit_logic(std::string element);
  Bit_logic(Bit_logic &&) = default;
  Bit_logic &operator=(Bit_logic &&) = default;
};

class Reference_or_call : public Node {
public:
  Reference_or_call(std::string element);
  Reference_or_call(Reference_or_call &&) = default;
  Reference_or_call &operator=(Reference_or_call &&) = default;
};

class Local_root : public Node {
public:
  Local_root(std::string element);
  Local_root(Local_root &&) = default;
  Local_root &operator=(Local_root &&) = default;
};

class Port_direction : public Node {
public:
  Port_direction(std::string element);
  Port_direction(Port_direction &&) = default;
  Port_direction &operator=(Port_direction &&) = default;
};

class Variable_decl_assignment : public Node {
public:
  Variable_decl_assignment(std::string element);
  Variable_decl_assignment(Variable_decl_assignment &&) = default;
  Variable_decl_assignment &operator=(Variable_decl_assignment &&) = default;
};

class Specify_edge_path_decl : public Node {
public:
  Specify_edge_path_decl(std::string element);
  Specify_edge_path_decl(Specify_edge_path_decl &&) = default;
  Specify_edge_path_decl &operator=(Specify_edge_path_decl &&) = default;
};

class Function_prototype : public Node {
public:
  Function_prototype(std::string element);
  Function_prototype(Function_prototype &&) = default;
  Function_prototype &operator=(Function_prototype &&) = default;
};

class Sequence_within_expr : public Node {
public:
  Sequence_within_expr(std::string element);
  Sequence_within_expr(Sequence_within_expr &&) = default;
  Sequence_within_expr &operator=(Sequence_within_expr &&) = default;
};

class Expr_primary_no_groups : public Node {
public:
  Expr_primary_no_groups(std::string element);
  Expr_primary_no_groups(Expr_primary_no_groups &&) = default;
  Expr_primary_no_groups &operator=(Expr_primary_no_groups &&) = default;
};

class Parameter_value_byname : public Node {
public:
  Parameter_value_byname(std::string element);
  Parameter_value_byname(Parameter_value_byname &&) = default;
  Parameter_value_byname &operator=(Parameter_value_byname &&) = default;
};

class Case_any : public Node {
public:
  Case_any(std::string element);
  Case_any(Case_any &&) = default;
  Case_any &operator=(Case_any &&) = default;
};

class Spec_notifier : public Node {
public:
  Spec_notifier(std::string element);
  Spec_notifier(Spec_notifier &&) = default;
  Spec_notifier &operator=(Spec_notifier &&) = default;
};

class Block_item_or_statement_or_null : public Node {
public:
  Block_item_or_statement_or_null(std::string element);
  Block_item_or_statement_or_null(Block_item_or_statement_or_null &&) = default;
  Block_item_or_statement_or_null &
  operator=(Block_item_or_statement_or_null &&) = default;
};

class Specify_item : public Node {
public:
  Specify_item(std::string element);
  Specify_item(Specify_item &&) = default;
  Specify_item &operator=(Specify_item &&) = default;
};

class Any_param_declaration : public Node {
public:
  Any_param_declaration(std::string element);
  Any_param_declaration(Any_param_declaration &&) = default;
  Any_param_declaration &operator=(Any_param_declaration &&) = default;
};

class Tf_port_list_trailing_comma : public Node {
public:
  Tf_port_list_trailing_comma(std::string element);
  Tf_port_list_trailing_comma(Tf_port_list_trailing_comma &&) = default;
  Tf_port_list_trailing_comma &
  operator=(Tf_port_list_trailing_comma &&) = default;
};

class Struct_union_member : public Node {
public:
  Struct_union_member(std::string element);
  Struct_union_member(Struct_union_member &&) = default;
  Struct_union_member &operator=(Struct_union_member &&) = default;
};

class Any_port_list_positional : public Node {
public:
  Any_port_list_positional(std::string element);
  Any_port_list_positional(Any_port_list_positional &&) = default;
  Any_port_list_positional &operator=(Any_port_list_positional &&) = default;
};

class Dir : public Node {
public:
  Dir(std::string element);
  Dir(Dir &&) = default;
  Dir &operator=(Dir &&) = default;
};

class Lifetime_opt : public Node {
public:
  Lifetime_opt(std::string element);
  Lifetime_opt(Lifetime_opt &&) = default;
  Lifetime_opt &operator=(Lifetime_opt &&) = default;
};

class List_of_identifiers : public Node {
public:
  List_of_identifiers(std::string element);
  List_of_identifiers(List_of_identifiers &&) = default;
  List_of_identifiers &operator=(List_of_identifiers &&) = default;
};

class Edge_operator : public Node {
public:
  Edge_operator(std::string element);
  Edge_operator(Edge_operator &&) = default;
  Edge_operator &operator=(Edge_operator &&) = default;
};

class Tk_virtual_opt : public Node {
public:
  Tk_virtual_opt(std::string element);
  Tk_virtual_opt(Tk_virtual_opt &&) = default;
  Tk_virtual_opt &operator=(Tk_virtual_opt &&) = default;
};

class Timeunits_declaration : public Node {
public:
  Timeunits_declaration(std::string element);
  Timeunits_declaration(Timeunits_declaration &&) = default;
  Timeunits_declaration &operator=(Timeunits_declaration &&) = default;
};

class Tf_item_or_statement_or_null : public Node {
public:
  Tf_item_or_statement_or_null(std::string element);
  Tf_item_or_statement_or_null(Tf_item_or_statement_or_null &&) = default;
  Tf_item_or_statement_or_null &
  operator=(Tf_item_or_statement_or_null &&) = default;
};

class Package_import_list : public Node {
public:
  Package_import_list(std::string element);
  Package_import_list(Package_import_list &&) = default;
  Package_import_list &operator=(Package_import_list &&) = default;
};

class Expr_primary : public Node {
public:
  Expr_primary(std::string element);
  Expr_primary(Expr_primary &&) = default;
  Expr_primary &operator=(Expr_primary &&) = default;
};

class Signed_unsigned_opt : public Node {
public:
  Signed_unsigned_opt(std::string element);
  Signed_unsigned_opt(Signed_unsigned_opt &&) = default;
  Signed_unsigned_opt &operator=(Signed_unsigned_opt &&) = default;
};

class Non_anonymous_gate_instance_or_register_variable_list : public Node {
public:
  Non_anonymous_gate_instance_or_register_variable_list(std::string element);
  Non_anonymous_gate_instance_or_register_variable_list(
      Non_anonymous_gate_instance_or_register_variable_list &&) = default;
  Non_anonymous_gate_instance_or_register_variable_list &
  operator=(Non_anonymous_gate_instance_or_register_variable_list &&) = default;
};

class Udp_comb_entry : public Node {
public:
  Udp_comb_entry(std::string element);
  Udp_comb_entry(Udp_comb_entry &&) = default;
  Udp_comb_entry &operator=(Udp_comb_entry &&) = default;
};

class Delay3 : public Node {
public:
  Delay3(std::string element);
  Delay3(Delay3 &&) = default;
  Delay3 &operator=(Delay3 &&) = default;
};

class Inc_or_dec_or_primary_expr : public Node {
public:
  Inc_or_dec_or_primary_expr(std::string element);
  Inc_or_dec_or_primary_expr(Inc_or_dec_or_primary_expr &&) = default;
  Inc_or_dec_or_primary_expr &
  operator=(Inc_or_dec_or_primary_expr &&) = default;
};

class Procedural_assertion_statement : public Node {
public:
  Procedural_assertion_statement(std::string element);
  Procedural_assertion_statement(Procedural_assertion_statement &&) = default;
  Procedural_assertion_statement &
  operator=(Procedural_assertion_statement &&) = default;
};

class Struct_union_member_list : public Node {
public:
  Struct_union_member_list(std::string element);
  Struct_union_member_list(Struct_union_member_list &&) = default;
  Struct_union_member_list &operator=(Struct_union_member_list &&) = default;
};

class Comp_expr : public Node {
public:
  Comp_expr(std::string element);
  Comp_expr(Comp_expr &&) = default;
  Comp_expr &operator=(Comp_expr &&) = default;
};

class Postfix_expression : public Node {
public:
  Postfix_expression(std::string element);
  Postfix_expression(Postfix_expression &&) = default;
  Postfix_expression &operator=(Postfix_expression &&) = default;
};

class Symbolidentifier : public Node {
public:
  Symbolidentifier(std::string element);
  Symbolidentifier(Symbolidentifier &&) = default;
  Symbolidentifier &operator=(Symbolidentifier &&) = default;
};

class Udp_input_sym : public Node {
public:
  Udp_input_sym(std::string element);
  Udp_input_sym(Udp_input_sym &&) = default;
  Udp_input_sym &operator=(Udp_input_sym &&) = default;
};

class Pos_neg_number : public Node {
public:
  Pos_neg_number(std::string element);
  Pos_neg_number(Pos_neg_number &&) = default;
  Pos_neg_number &operator=(Pos_neg_number &&) = default;
};

class Specify_terminal_descriptor : public Node {
public:
  Specify_terminal_descriptor(std::string element);
  Specify_terminal_descriptor(Specify_terminal_descriptor &&) = default;
  Specify_terminal_descriptor &
  operator=(Specify_terminal_descriptor &&) = default;
};

class Select_variable_dimension : public Node {
public:
  Select_variable_dimension(std::string element);
  Select_variable_dimension(Select_variable_dimension &&) = default;
  Select_variable_dimension &operator=(Select_variable_dimension &&) = default;
};

class List_of_ports_or_port_declarations_ansi : public Node {
public:
  List_of_ports_or_port_declarations_ansi(std::string element);
  List_of_ports_or_port_declarations_ansi(
      List_of_ports_or_port_declarations_ansi &&) = default;
  List_of_ports_or_port_declarations_ansi &
  operator=(List_of_ports_or_port_declarations_ansi &&) = default;
};

class Generate_case_items : public Node {
public:
  Generate_case_items(std::string element);
  Generate_case_items(Generate_case_items &&) = default;
  Generate_case_items &operator=(Generate_case_items &&) = default;
};

class Data_type_primitive_scalar : public Node {
public:
  Data_type_primitive_scalar(std::string element);
  Data_type_primitive_scalar(Data_type_primitive_scalar &&) = default;
  Data_type_primitive_scalar &
  operator=(Data_type_primitive_scalar &&) = default;
};

class Tf_item_or_statement_or_null_list : public Node {
public:
  Tf_item_or_statement_or_null_list(std::string element);
  Tf_item_or_statement_or_null_list(Tf_item_or_statement_or_null_list &&) =
      default;
  Tf_item_or_statement_or_null_list &
  operator=(Tf_item_or_statement_or_null_list &&) = default;
};

class Conditional_statement : public Node {
public:
  Conditional_statement(std::string element);
  Conditional_statement(Conditional_statement &&) = default;
  Conditional_statement &operator=(Conditional_statement &&) = default;
};

class Specparam_decl : public Node {
public:
  Specparam_decl(std::string element);
  Specparam_decl(Specparam_decl &&) = default;
  Specparam_decl &operator=(Specparam_decl &&) = default;
};

class List_of_ports_or_port_declarations_non_ansi : public Node {
public:
  List_of_ports_or_port_declarations_non_ansi(std::string element);
  List_of_ports_or_port_declarations_non_ansi(
      List_of_ports_or_port_declarations_non_ansi &&) = default;
  List_of_ports_or_port_declarations_non_ansi &
  operator=(List_of_ports_or_port_declarations_non_ansi &&) = default;
};

class Statement_or_null_list : public Node {
public:
  Statement_or_null_list(std::string element);
  Statement_or_null_list(Statement_or_null_list &&) = default;
  Statement_or_null_list &operator=(Statement_or_null_list &&) = default;
};

class Task_declaration : public Node {
public:
  Task_declaration(std::string element);
  Task_declaration(Task_declaration &&) = default;
  Task_declaration &operator=(Task_declaration &&) = default;
};

class Data_declaration_base : public Node {
public:
  Data_declaration_base(std::string element);
  Data_declaration_base(Data_declaration_base &&) = default;
  Data_declaration_base &operator=(Data_declaration_base &&) = default;
};

class Any_port_list_opt : public Node {
public:
  Any_port_list_opt(std::string element);
  Any_port_list_opt(Any_port_list_opt &&) = default;
  Any_port_list_opt &operator=(Any_port_list_opt &&) = default;
};

class Macronumericwidth : public Node {
public:
  Macronumericwidth(std::string element);
  Macronumericwidth(Macronumericwidth &&) = default;
  Macronumericwidth &operator=(Macronumericwidth &&) = default;
};

class Trailing_decl_assignment_opt : public Node {
public:
  Trailing_decl_assignment_opt(std::string element);
  Trailing_decl_assignment_opt(Trailing_decl_assignment_opt &&) = default;
  Trailing_decl_assignment_opt &
  operator=(Trailing_decl_assignment_opt &&) = default;
};

class Gate_instance_or_register_variable : public Node {
public:
  Gate_instance_or_register_variable(std::string element);
  Gate_instance_or_register_variable(Gate_instance_or_register_variable &&) =
      default;
  Gate_instance_or_register_variable &
  operator=(Gate_instance_or_register_variable &&) = default;
};

class Bind_instantiation : public Node {
public:
  Bind_instantiation(std::string element);
  Bind_instantiation(Bind_instantiation &&) = default;
  Bind_instantiation &operator=(Bind_instantiation &&) = default;
};

class Package_import_declaration : public Node {
public:
  Package_import_declaration(std::string element);
  Package_import_declaration(Package_import_declaration &&) = default;
  Package_import_declaration &
  operator=(Package_import_declaration &&) = default;
};

class Module_package_import_list_opt : public Node {
public:
  Module_package_import_list_opt(std::string element);
  Module_package_import_list_opt(Module_package_import_list_opt &&) = default;
  Module_package_import_list_opt &
  operator=(Module_package_import_list_opt &&) = default;
};

class Structure_or_array_pattern_expression_list : public Node {
public:
  Structure_or_array_pattern_expression_list(std::string element);
  Structure_or_array_pattern_expression_list(
      Structure_or_array_pattern_expression_list &&) = default;
  Structure_or_array_pattern_expression_list &
  operator=(Structure_or_array_pattern_expression_list &&) = default;
};

class Event_expression_list : public Node {
public:
  Event_expression_list(std::string element);
  Event_expression_list(Event_expression_list &&) = default;
  Event_expression_list &operator=(Event_expression_list &&) = default;
};

class Tk_rss_eq : public Node {
public:
  Tk_rss_eq(std::string element);
  Tk_rss_eq(Tk_rss_eq &&) = default;
  Tk_rss_eq &operator=(Tk_rss_eq &&) = default;
};

class Implements_interface_list_opt : public Node {
public:
  Implements_interface_list_opt(std::string element);
  Implements_interface_list_opt(Implements_interface_list_opt &&) = default;
  Implements_interface_list_opt &
  operator=(Implements_interface_list_opt &&) = default;
};

class Delay3_opt : public Node {
public:
  Delay3_opt(std::string element);
  Delay3_opt(Delay3_opt &&) = default;
  Delay3_opt &operator=(Delay3_opt &&) = default;
};

class Expr_mintypmax_trans_set : public Node {
public:
  Expr_mintypmax_trans_set(std::string element);
  Expr_mintypmax_trans_set(Expr_mintypmax_trans_set &&) = default;
  Expr_mintypmax_trans_set &operator=(Expr_mintypmax_trans_set &&) = default;
};

class Statement_or_null : public Node {
public:
  Statement_or_null(std::string element);
  Statement_or_null(Statement_or_null &&) = default;
  Statement_or_null &operator=(Statement_or_null &&) = default;
};

class Enum_name_list : public Node {
public:
  Enum_name_list(std::string element);
  Enum_name_list(Enum_name_list &&) = default;
  Enum_name_list &operator=(Enum_name_list &&) = default;
};

class Sequence_unary_expr : public Node {
public:
  Sequence_unary_expr(std::string element);
  Sequence_unary_expr(Sequence_unary_expr &&) = default;
  Sequence_unary_expr &operator=(Sequence_unary_expr &&) = default;
};

class Pp_identifier : public Node {
public:
  Pp_identifier(std::string element);
  Pp_identifier(Pp_identifier &&) = default;
  Pp_identifier &operator=(Pp_identifier &&) = default;
};

class Shift_expr : public Node {
public:
  Shift_expr(std::string element);
  Shift_expr(Shift_expr &&) = default;
  Shift_expr &operator=(Shift_expr &&) = default;
};

class Oct_based_number : public Node {
public:
  Oct_based_number(std::string element);
  Oct_based_number(Oct_based_number &&) = default;
  Oct_based_number &operator=(Oct_based_number &&) = default;
};

class Hierarchy_segment : public Node {
public:
  Hierarchy_segment(std::string element);
  Hierarchy_segment(Hierarchy_segment &&) = default;
  Hierarchy_segment &operator=(Hierarchy_segment &&) = default;
};

class Nonblocking_assignment : public Node {
public:
  Nonblocking_assignment(std::string element);
  Nonblocking_assignment(Nonblocking_assignment &&) = default;
  Nonblocking_assignment &operator=(Nonblocking_assignment &&) = default;
};

class Expression_list_proper : public Node {
public:
  Expression_list_proper(std::string element);
  Expression_list_proper(Expression_list_proper &&) = default;
  Expression_list_proper &operator=(Expression_list_proper &&) = default;
};

class Generate_if : public Node {
public:
  Generate_if(std::string element);
  Generate_if(Generate_if &&) = default;
  Generate_if &operator=(Generate_if &&) = default;
};

class Function_item : public Node {
public:
  Function_item(std::string element);
  Function_item(Function_item &&) = default;
  Function_item &operator=(Function_item &&) = default;
};

class Scope_prefix : public Node {
public:
  Scope_prefix(std::string element);
  Scope_prefix(Scope_prefix &&) = default;
  Scope_prefix &operator=(Scope_prefix &&) = default;
};

class Primitive_gate_instance_list : public Node {
public:
  Primitive_gate_instance_list(std::string element);
  Primitive_gate_instance_list(Primitive_gate_instance_list &&) = default;
  Primitive_gate_instance_list &
  operator=(Primitive_gate_instance_list &&) = default;
};

class Simple_immediate_assertion_statement : public Node {
public:
  Simple_immediate_assertion_statement(std::string element);
  Simple_immediate_assertion_statement(
      Simple_immediate_assertion_statement &&) = default;
  Simple_immediate_assertion_statement &
  operator=(Simple_immediate_assertion_statement &&) = default;
};

class Description_list : public Node {
public:
  Description_list(std::string element);
  Description_list(Description_list &&) = default;
  Description_list &operator=(Description_list &&) = default;
};

class Dr_strength0 : public Node {
public:
  Dr_strength0(std::string element);
  Dr_strength0(Dr_strength0 &&) = default;
  Dr_strength0 &operator=(Dr_strength0 &&) = default;
};

class Unique_priority_opt : public Node {
public:
  Unique_priority_opt(std::string element);
  Unique_priority_opt(Unique_priority_opt &&) = default;
  Unique_priority_opt &operator=(Unique_priority_opt &&) = default;
};

class Specparam : public Node {
public:
  Specparam(std::string element);
  Specparam(Specparam &&) = default;
  Specparam &operator=(Specparam &&) = default;
};

class Port_expression_opt : public Node {
public:
  Port_expression_opt(std::string element);
  Port_expression_opt(Port_expression_opt &&) = default;
  Port_expression_opt &operator=(Port_expression_opt &&) = default;
};

class Cond_expr : public Node {
public:
  Cond_expr(std::string element);
  Cond_expr(Cond_expr &&) = default;
  Cond_expr &operator=(Cond_expr &&) = default;
};

class Tk_reg_opt : public Node {
public:
  Tk_reg_opt(std::string element);
  Tk_reg_opt(Tk_reg_opt &&) = default;
  Tk_reg_opt &operator=(Tk_reg_opt &&) = default;
};

class Logor_expr : public Node {
public:
  Logor_expr(std::string element);
  Logor_expr(Logor_expr &&) = default;
  Logor_expr &operator=(Logor_expr &&) = default;
};

class Delay3_or_drive_opt : public Node {
public:
  Delay3_or_drive_opt(std::string element);
  Delay3_or_drive_opt(Delay3_or_drive_opt &&) = default;
  Delay3_or_drive_opt &operator=(Delay3_or_drive_opt &&) = default;
};

class Tf_item_or_statement_or_null_list_opt : public Node {
public:
  Tf_item_or_statement_or_null_list_opt(std::string element);
  Tf_item_or_statement_or_null_list_opt(
      Tf_item_or_statement_or_null_list_opt &&) = default;
  Tf_item_or_statement_or_null_list_opt &
  operator=(Tf_item_or_statement_or_null_list_opt &&) = default;
};

class Net_decl_assign : public Node {
public:
  Net_decl_assign(std::string element);
  Net_decl_assign(Net_decl_assign &&) = default;
  Net_decl_assign &operator=(Net_decl_assign &&) = default;
};

class Always_any : public Node {
public:
  Always_any(std::string element);
  Always_any(Always_any &&) = default;
  Always_any &operator=(Always_any &&) = default;
};

class List_of_tf_variable_identifiers : public Node {
public:
  List_of_tf_variable_identifiers(std::string element);
  List_of_tf_variable_identifiers(List_of_tf_variable_identifiers &&) = default;
  List_of_tf_variable_identifiers &
  operator=(List_of_tf_variable_identifiers &&) = default;
};

class Var_or_net_type_opt : public Node {
public:
  Var_or_net_type_opt(std::string element);
  Var_or_net_type_opt(Var_or_net_type_opt &&) = default;
  Var_or_net_type_opt &operator=(Var_or_net_type_opt &&) = default;
};

class Tf_port_list_item_last : public Node {
public:
  Tf_port_list_item_last(std::string element);
  Tf_port_list_item_last(Tf_port_list_item_last &&) = default;
  Tf_port_list_item_last &operator=(Tf_port_list_item_last &&) = default;
};

class Task_declaration_id : public Node {
public:
  Task_declaration_id(std::string element);
  Task_declaration_id(Task_declaration_id &&) = default;
  Task_declaration_id &operator=(Task_declaration_id &&) = default;
};

class Instantiation_base : public Node {
public:
  Instantiation_base(std::string element);
  Instantiation_base(Instantiation_base &&) = default;
  Instantiation_base &operator=(Instantiation_base &&) = default;
};

class Sequence_repetition_expr : public Node {
public:
  Sequence_repetition_expr(std::string element);
  Sequence_repetition_expr(Sequence_repetition_expr &&) = default;
  Sequence_repetition_expr &operator=(Sequence_repetition_expr &&) = default;
};

class Tk_hexdigits : public Node {
public:
  Tk_hexdigits(std::string element);
  Tk_hexdigits(Tk_hexdigits &&) = default;
  Tk_hexdigits &operator=(Tk_hexdigits &&) = default;
};

class Non_anonymous_gate_instance_or_register_variable : public Node {
public:
  Non_anonymous_gate_instance_or_register_variable(std::string element);
  Non_anonymous_gate_instance_or_register_variable(
      Non_anonymous_gate_instance_or_register_variable &&) = default;
  Non_anonymous_gate_instance_or_register_variable &
  operator=(Non_anonymous_gate_instance_or_register_variable &&) = default;
};

class Localparam_assign : public Node {
public:
  Localparam_assign(std::string element);
  Localparam_assign(Localparam_assign &&) = default;
  Localparam_assign &operator=(Localparam_assign &&) = default;
};

class Class_items : public Node {
public:
  Class_items(std::string element);
  Class_items(Class_items &&) = default;
  Class_items &operator=(Class_items &&) = default;
};

class Expression_in_parens : public Node {
public:
  Expression_in_parens(std::string element);
  Expression_in_parens(Expression_in_parens &&) = default;
  Expression_in_parens &operator=(Expression_in_parens &&) = default;
};

class List_of_ports_or_port_declarations_trailing_comma_ansi : public Node {
public:
  List_of_ports_or_port_declarations_trailing_comma_ansi(std::string element);
  List_of_ports_or_port_declarations_trailing_comma_ansi(
      List_of_ports_or_port_declarations_trailing_comma_ansi &&) = default;
  List_of_ports_or_port_declarations_trailing_comma_ansi &operator=(
      List_of_ports_or_port_declarations_trailing_comma_ansi &&) = default;
};

class Port_reference : public Node {
public:
  Port_reference(std::string element);
  Port_reference(Port_reference &&) = default;
  Port_reference &operator=(Port_reference &&) = default;
};

class Dist_opt : public Node {
public:
  Dist_opt(std::string element);
  Dist_opt(Dist_opt &&) = default;
  Dist_opt &operator=(Dist_opt &&) = default;
};

class Caseeq_expr : public Node {
public:
  Caseeq_expr(std::string element);
  Caseeq_expr(Caseeq_expr &&) = default;
  Caseeq_expr &operator=(Caseeq_expr &&) = default;
};

class Generate_block : public Node {
public:
  Generate_block(std::string element);
  Generate_block(Generate_block &&) = default;
  Generate_block &operator=(Generate_block &&) = default;
};

class List_of_ports_or_port_declarations_item_last_non_ansi : public Node {
public:
  List_of_ports_or_port_declarations_item_last_non_ansi(std::string element);
  List_of_ports_or_port_declarations_item_last_non_ansi(
      List_of_ports_or_port_declarations_item_last_non_ansi &&) = default;
  List_of_ports_or_port_declarations_item_last_non_ansi &
  operator=(List_of_ports_or_port_declarations_item_last_non_ansi &&) = default;
};

class Any_argument_list_item_last : public Node {
public:
  Any_argument_list_item_last(std::string element);
  Any_argument_list_item_last(Any_argument_list_item_last &&) = default;
  Any_argument_list_item_last &
  operator=(Any_argument_list_item_last &&) = default;
};

class Gate_instantiation : public Node {
public:
  Gate_instantiation(std::string element);
  Gate_instantiation(Gate_instantiation &&) = default;
  Gate_instantiation &operator=(Gate_instantiation &&) = default;
};

class Casting_type : public Node {
public:
  Casting_type(std::string element);
  Casting_type(Casting_type &&) = default;
  Casting_type &operator=(Casting_type &&) = default;
};

class Expr_mintypmax : public Node {
public:
  Expr_mintypmax(std::string element);
  Expr_mintypmax(Expr_mintypmax &&) = default;
  Expr_mintypmax &operator=(Expr_mintypmax &&) = default;
};

class Continuous_assign : public Node {
public:
  Continuous_assign(std::string element);
  Continuous_assign(Continuous_assign &&) = default;
  Continuous_assign &operator=(Continuous_assign &&) = default;
};

class Parameter_assign : public Node {
public:
  Parameter_assign(std::string element);
  Parameter_assign(Parameter_assign &&) = default;
  Parameter_assign &operator=(Parameter_assign &&) = default;
};

class Delay_value_simple : public Node {
public:
  Delay_value_simple(std::string element);
  Delay_value_simple(Delay_value_simple &&) = default;
  Delay_value_simple &operator=(Delay_value_simple &&) = default;
};

class Switchtype : public Node {
public:
  Switchtype(std::string element);
  Switchtype(Switchtype &&) = default;
  Switchtype &operator=(Switchtype &&) = default;
};

class Package_or_generate_item_declaration : public Node {
public:
  Package_or_generate_item_declaration(std::string element);
  Package_or_generate_item_declaration(
      Package_or_generate_item_declaration &&) = default;
  Package_or_generate_item_declaration &
  operator=(Package_or_generate_item_declaration &&) = default;
};

class Bin_based_number : public Node {
public:
  Bin_based_number(std::string element);
  Bin_based_number(Bin_based_number &&) = default;
  Bin_based_number &operator=(Bin_based_number &&) = default;
};

class Loop_generate_construct : public Node {
public:
  Loop_generate_construct(std::string element);
  Loop_generate_construct(Loop_generate_construct &&) = default;
  Loop_generate_construct &operator=(Loop_generate_construct &&) = default;
};

class Parameter_override : public Node {
public:
  Parameter_override(std::string element);
  Parameter_override(Parameter_override &&) = default;
  Parameter_override &operator=(Parameter_override &&) = default;
};

class Udp_primitive : public Node {
public:
  Udp_primitive(std::string element);
  Udp_primitive(Udp_primitive &&) = default;
  Udp_primitive &operator=(Udp_primitive &&) = default;
};

class Parameter_expr : public Node {
public:
  Parameter_expr(std::string element);
  Parameter_expr(Parameter_expr &&) = default;
  Parameter_expr &operator=(Parameter_expr &&) = default;
};

class Repeat_control : public Node {
public:
  Repeat_control(std::string element);
  Repeat_control(Repeat_control &&) = default;
  Repeat_control &operator=(Repeat_control &&) = default;
};

class Packed_signing_opt : public Node {
public:
  Packed_signing_opt(std::string element);
  Packed_signing_opt(Packed_signing_opt &&) = default;
  Packed_signing_opt &operator=(Packed_signing_opt &&) = default;
};

class Expression_or_null_list_opt : public Node {
public:
  Expression_or_null_list_opt(std::string element);
  Expression_or_null_list_opt(Expression_or_null_list_opt &&) = default;
  Expression_or_null_list_opt &
  operator=(Expression_or_null_list_opt &&) = default;
};

class Enum_name_list_item_last : public Node {
public:
  Enum_name_list_item_last(std::string element);
  Enum_name_list_item_last(Enum_name_list_item_last &&) = default;
  Enum_name_list_item_last &operator=(Enum_name_list_item_last &&) = default;
};

class Macro_formals_list_opt : public Node {
public:
  Macro_formals_list_opt(std::string element);
  Macro_formals_list_opt(Macro_formals_list_opt &&) = default;
  Macro_formals_list_opt &operator=(Macro_formals_list_opt &&) = default;
};

class Spec_notifier_opt : public Node {
public:
  Spec_notifier_opt(std::string element);
  Spec_notifier_opt(Spec_notifier_opt &&) = default;
  Spec_notifier_opt &operator=(Spec_notifier_opt &&) = default;
};

class Hierarchy_extension : public Node {
public:
  Hierarchy_extension(std::string element);
  Hierarchy_extension(Hierarchy_extension &&) = default;
  Hierarchy_extension &operator=(Hierarchy_extension &&) = default;
};

class Generate_item_list : public Node {
public:
  Generate_item_list(std::string element);
  Generate_item_list(Generate_item_list &&) = default;
  Generate_item_list &operator=(Generate_item_list &&) = default;
};

class Data_declaration_modifiers_opt : public Node {
public:
  Data_declaration_modifiers_opt(std::string element);
  Data_declaration_modifiers_opt(Data_declaration_modifiers_opt &&) = default;
  Data_declaration_modifiers_opt &
  operator=(Data_declaration_modifiers_opt &&) = default;
};

class Sequence_throughout_expr : public Node {
public:
  Sequence_throughout_expr(std::string element);
  Sequence_throughout_expr(Sequence_throughout_expr &&) = default;
  Sequence_throughout_expr &operator=(Sequence_throughout_expr &&) = default;
};

class Property_expr_or_assignment_list : public Node {
public:
  Property_expr_or_assignment_list(std::string element);
  Property_expr_or_assignment_list(Property_expr_or_assignment_list &&) =
      default;
  Property_expr_or_assignment_list &
  operator=(Property_expr_or_assignment_list &&) = default;
};

class Bitor_expr : public Node {
public:
  Bitor_expr(std::string element);
  Bitor_expr(Bitor_expr &&) = default;
  Bitor_expr &operator=(Bitor_expr &&) = default;
};

class Tf_port_list : public Node {
public:
  Tf_port_list(std::string element);
  Tf_port_list(Tf_port_list &&) = default;
  Tf_port_list &operator=(Tf_port_list &&) = default;
};

class Any_port_list_trailing_comma_named : public Node {
public:
  Any_port_list_trailing_comma_named(std::string element);
  Any_port_list_trailing_comma_named(Any_port_list_trailing_comma_named &&) =
      default;
  Any_port_list_trailing_comma_named &
  operator=(Any_port_list_trailing_comma_named &&) = default;
};

class Function_return_type_and_id : public Node {
public:
  Function_return_type_and_id(std::string element);
  Function_return_type_and_id(Function_return_type_and_id &&) = default;
  Function_return_type_and_id &
  operator=(Function_return_type_and_id &&) = default;
};

class Statement : public Node {
public:
  Statement(std::string element);
  Statement(Statement &&) = default;
  Statement &operator=(Statement &&) = default;
};

class Dr_strength1 : public Node {
public:
  Dr_strength1(std::string element);
  Dr_strength1(Dr_strength1 &&) = default;
  Dr_strength1 &operator=(Dr_strength1 &&) = default;
};

class Assign_modify_statement : public Node {
public:
  Assign_modify_statement(std::string element);
  Assign_modify_statement(Assign_modify_statement &&) = default;
  Assign_modify_statement &operator=(Assign_modify_statement &&) = default;
};

class Udp_port_decls : public Node {
public:
  Udp_port_decls(std::string element);
  Udp_port_decls(Udp_port_decls &&) = default;
  Udp_port_decls &operator=(Udp_port_decls &&) = default;
};

class Integer_vector_type : public Node {
public:
  Integer_vector_type(std::string element);
  Integer_vector_type(Integer_vector_type &&) = default;
  Integer_vector_type &operator=(Integer_vector_type &&) = default;
};

class Assignment_pattern : public Node {
public:
  Assignment_pattern(std::string element);
  Assignment_pattern(Assignment_pattern &&) = default;
  Assignment_pattern &operator=(Assignment_pattern &&) = default;
};

class Class_constructor : public Node {
public:
  Class_constructor(std::string element);
  Class_constructor(Class_constructor &&) = default;
  Class_constructor &operator=(Class_constructor &&) = default;
};

class Module_parameter_port : public Node {
public:
  Module_parameter_port(std::string element);
  Module_parameter_port(Module_parameter_port &&) = default;
  Module_parameter_port &operator=(Module_parameter_port &&) = default;
};

class Module_or_generate_item_declaration : public Node {
public:
  Module_or_generate_item_declaration(std::string element);
  Module_or_generate_item_declaration(Module_or_generate_item_declaration &&) =
      default;
  Module_or_generate_item_declaration &
  operator=(Module_or_generate_item_declaration &&) = default;
};

class Final_construct : public Node {
public:
  Final_construct(std::string element);
  Final_construct(Final_construct &&) = default;
  Final_construct &operator=(Final_construct &&) = default;
};

class Member_name : public Node {
public:
  Member_name(std::string element);
  Member_name(Member_name &&) = default;
  Member_name &operator=(Member_name &&) = default;
};

class Class_declaration : public Node {
public:
  Class_declaration(std::string element);
  Class_declaration(Class_declaration &&) = default;
  Class_declaration &operator=(Class_declaration &&) = default;
};

class Package_import_item : public Node {
public:
  Package_import_item(std::string element);
  Package_import_item(Package_import_item &&) = default;
  Package_import_item &operator=(Package_import_item &&) = default;
};

class Signing : public Node {
public:
  Signing(std::string element);
  Signing(Signing &&) = default;
  Signing &operator=(Signing &&) = default;
};

class Class_constructor_prototype : public Node {
public:
  Class_constructor_prototype(std::string element);
  Class_constructor_prototype(Class_constructor_prototype &&) = default;
  Class_constructor_prototype &
  operator=(Class_constructor_prototype &&) = default;
};

class Generate_case_item : public Node {
public:
  Generate_case_item(std::string element);
  Generate_case_item(Generate_case_item &&) = default;
  Generate_case_item &operator=(Generate_case_item &&) = default;
};

class Data_declaration : public Node {
public:
  Data_declaration(std::string element);
  Data_declaration(Data_declaration &&) = default;
  Data_declaration &operator=(Data_declaration &&) = default;
};

class Expression : public Node {
public:
  Expression(std::string element);
  Expression(Expression &&) = default;
  Expression &operator=(Expression &&) = default;
};

class Cont_assign : public Node {
public:
  Cont_assign(std::string element);
  Cont_assign(Cont_assign &&) = default;
  Cont_assign &operator=(Cont_assign &&) = default;
};

class Delay_or_event_control_opt : public Node {
public:
  Delay_or_event_control_opt(std::string element);
  Delay_or_event_control_opt(Delay_or_event_control_opt &&) = default;
  Delay_or_event_control_opt &
  operator=(Delay_or_event_control_opt &&) = default;
};

class Bind_directive : public Node {
public:
  Bind_directive(std::string element);
  Bind_directive(Bind_directive &&) = default;
  Bind_directive &operator=(Bind_directive &&) = default;
};

class Misc_directive : public Node {
public:
  Misc_directive(std::string element);
  Misc_directive(Misc_directive &&) = default;
  Misc_directive &operator=(Misc_directive &&) = default;
};

class Udp_initial_expr_opt : public Node {
public:
  Udp_initial_expr_opt(std::string element);
  Udp_initial_expr_opt(Udp_initial_expr_opt &&) = default;
  Udp_initial_expr_opt &operator=(Udp_initial_expr_opt &&) = default;
};

class Description : public Node {
public:
  Description(std::string element);
  Description(Description &&) = default;
  Description &operator=(Description &&) = default;
};

class Data_type_base : public Node {
public:
  Data_type_base(std::string element);
  Data_type_base(Data_type_base &&) = default;
  Data_type_base &operator=(Data_type_base &&) = default;
};

class Trailing_assign : public Node {
public:
  Trailing_assign(std::string element);
  Trailing_assign(Trailing_assign &&) = default;
  Trailing_assign &operator=(Trailing_assign &&) = default;
};

class Module_end : public Node {
public:
  Module_end(std::string element);
  Module_end(Module_end &&) = default;
  Module_end &operator=(Module_end &&) = default;
};

class Wait_statement : public Node {
public:
  Wait_statement(std::string element);
  Wait_statement(Wait_statement &&) = default;
  Wait_statement &operator=(Wait_statement &&) = default;
};

class Package_item_list : public Node {
public:
  Package_item_list(std::string element);
  Package_item_list(Package_item_list &&) = default;
  Package_item_list &operator=(Package_item_list &&) = default;
};

class Case_items : public Node {
public:
  Case_items(std::string element);
  Case_items(Case_items &&) = default;
  Case_items &operator=(Case_items &&) = default;
};

class Statement_or_null_list_opt : public Node {
public:
  Statement_or_null_list_opt(std::string element);
  Statement_or_null_list_opt(Statement_or_null_list_opt &&) = default;
  Statement_or_null_list_opt &
  operator=(Statement_or_null_list_opt &&) = default;
};

class Port_named : public Node {
public:
  Port_named(std::string element);
  Port_named(Port_named &&) = default;
  Port_named &operator=(Port_named &&) = default;
};

class Udp_output_sym : public Node {
public:
  Udp_output_sym(std::string element);
  Udp_output_sym(Udp_output_sym &&) = default;
  Udp_output_sym &operator=(Udp_output_sym &&) = default;
};

class Assignment_statement_no_expr : public Node {
public:
  Assignment_statement_no_expr(std::string element);
  Assignment_statement_no_expr(Assignment_statement_no_expr &&) = default;
  Assignment_statement_no_expr &
  operator=(Assignment_statement_no_expr &&) = default;
};

class Any_port_list_item_last_positional : public Node {
public:
  Any_port_list_item_last_positional(std::string element);
  Any_port_list_item_last_positional(Any_port_list_item_last_positional &&) =
      default;
  Any_port_list_item_last_positional &
  operator=(Any_port_list_item_last_positional &&) = default;
};

class Module_item_list_opt : public Node {
public:
  Module_item_list_opt(std::string element);
  Module_item_list_opt(Module_item_list_opt &&) = default;
  Module_item_list_opt &operator=(Module_item_list_opt &&) = default;
};

class Sequence_and_expr : public Node {
public:
  Sequence_and_expr(std::string element);
  Sequence_and_expr(Sequence_and_expr &&) = default;
  Sequence_and_expr &operator=(Sequence_and_expr &&) = default;
};

class Data_type : public Node {
public:
  Data_type(std::string element);
  Data_type(Data_type &&) = default;
  Data_type &operator=(Data_type &&) = default;
};

class Argument_list_opt : public Node {
public:
  Argument_list_opt(std::string element);
  Argument_list_opt(Argument_list_opt &&) = default;
  Argument_list_opt &operator=(Argument_list_opt &&) = default;
};

class For_step_opt : public Node {
public:
  For_step_opt(std::string element);
  For_step_opt(For_step_opt &&) = default;
  For_step_opt &operator=(For_step_opt &&) = default;
};

class Sequence_intersect_expr : public Node {
public:
  Sequence_intersect_expr(std::string element);
  Sequence_intersect_expr(Sequence_intersect_expr &&) = default;
  Sequence_intersect_expr &operator=(Sequence_intersect_expr &&) = default;
};

class Function_declaration : public Node {
public:
  Function_declaration(std::string element);
  Function_declaration(Function_declaration &&) = default;
  Function_declaration &operator=(Function_declaration &&) = default;
};

class Net_type_or_none : public Node {
public:
  Net_type_or_none(std::string element);
  Net_type_or_none(Net_type_or_none &&) = default;
  Net_type_or_none &operator=(Net_type_or_none &&) = default;
};

class Class_declaration_extends_opt : public Node {
public:
  Class_declaration_extends_opt(std::string element);
  Class_declaration_extends_opt(Class_declaration_extends_opt &&) = default;
  Class_declaration_extends_opt &
  operator=(Class_declaration_extends_opt &&) = default;
};

class Boolean_abbrev_opt : public Node {
public:
  Boolean_abbrev_opt(std::string element);
  Boolean_abbrev_opt(Boolean_abbrev_opt &&) = default;
  Boolean_abbrev_opt &operator=(Boolean_abbrev_opt &&) = default;
};

class Specify_path_identifiers : public Node {
public:
  Specify_path_identifiers(std::string element);
  Specify_path_identifiers(Specify_path_identifiers &&) = default;
  Specify_path_identifiers &operator=(Specify_path_identifiers &&) = default;
};

class Tf_port_direction : public Node {
public:
  Tf_port_direction(std::string element);
  Tf_port_direction(Tf_port_direction &&) = default;
  Tf_port_direction &operator=(Tf_port_direction &&) = default;
};

class Tk_decdigits : public Node {
public:
  Tk_decdigits(std::string element);
  Tk_decdigits(Tk_decdigits &&) = default;
  Tk_decdigits &operator=(Tk_decdigits &&) = default;
};

class End : public Node {
public:
  End(std::string element);
  End(End &&) = default;
  End &operator=(End &&) = default;
};

class Net_declaration : public Node {
public:
  Net_declaration(std::string element);
  Net_declaration(Net_declaration &&) = default;
  Net_declaration &operator=(Net_declaration &&) = default;
};

class Tk_tagged_opt : public Node {
public:
  Tk_tagged_opt(std::string element);
  Tk_tagged_opt(Tk_tagged_opt &&) = default;
  Tk_tagged_opt &operator=(Tk_tagged_opt &&) = default;
};

class Tk_xzdigits : public Node {
public:
  Tk_xzdigits(std::string element);
  Tk_xzdigits(Tk_xzdigits &&) = default;
  Tk_xzdigits &operator=(Tk_xzdigits &&) = default;
};

class Gatetype : public Node {
public:
  Gatetype(std::string element);
  Gatetype(Gatetype &&) = default;
  Gatetype &operator=(Gatetype &&) = default;
};

class Preprocess_include_argument : public Node {
public:
  Preprocess_include_argument(std::string element);
  Preprocess_include_argument(Preprocess_include_argument &&) = default;
  Preprocess_include_argument &
  operator=(Preprocess_include_argument &&) = default;
};

class Macro_formals_list : public Node {
public:
  Macro_formals_list(std::string element);
  Macro_formals_list(Macro_formals_list &&) = default;
  Macro_formals_list &operator=(Macro_formals_list &&) = default;
};

class Const_opt : public Node {
public:
  Const_opt(std::string element);
  Const_opt(Const_opt &&) = default;
  Const_opt &operator=(Const_opt &&) = default;
};

class Logand_expr : public Node {
public:
  Logand_expr(std::string element);
  Logand_expr(Logand_expr &&) = default;
  Logand_expr &operator=(Logand_expr &&) = default;
};

class Event_expression : public Node {
public:
  Event_expression(std::string element);
  Event_expression(Event_expression &&) = default;
  Event_expression &operator=(Event_expression &&) = default;
};

class Udp_entry_list : public Node {
public:
  Udp_entry_list(std::string element);
  Udp_entry_list(Udp_entry_list &&) = default;
  Udp_entry_list &operator=(Udp_entry_list &&) = default;
};

class Preprocessor_action : public Node {
public:
  Preprocessor_action(std::string element);
  Preprocessor_action(Preprocessor_action &&) = default;
  Preprocessor_action &operator=(Preprocessor_action &&) = default;
};

class Tf_port_declaration : public Node {
public:
  Tf_port_declaration(std::string element);
  Tf_port_declaration(Tf_port_declaration &&) = default;
  Tf_port_declaration &operator=(Tf_port_declaration &&) = default;
};

class Udp_init_opt : public Node {
public:
  Udp_init_opt(std::string element);
  Udp_init_opt(Udp_init_opt &&) = default;
  Udp_init_opt &operator=(Udp_init_opt &&) = default;
};

class Type_identifier_or_implicit_followed_by_id_and_dimensions_opt
    : public Node {
public:
  Type_identifier_or_implicit_followed_by_id_and_dimensions_opt(
      std::string element);
  Type_identifier_or_implicit_followed_by_id_and_dimensions_opt(
      Type_identifier_or_implicit_followed_by_id_and_dimensions_opt &&) =
      default;
  Type_identifier_or_implicit_followed_by_id_and_dimensions_opt &
  operator=(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt &&) =
      default;
};

class Source_text : public Node {
public:
  Source_text(std::string element);
  Source_text(Source_text &&) = default;
  Source_text &operator=(Source_text &&) = default;
};

class Defparam_assign : public Node {
public:
  Defparam_assign(std::string element);
  Defparam_assign(Defparam_assign &&) = default;
  Defparam_assign &operator=(Defparam_assign &&) = default;
};

class Decl_dimensions : public Node {
public:
  Decl_dimensions(std::string element);
  Decl_dimensions(Decl_dimensions &&) = default;
  Decl_dimensions &operator=(Decl_dimensions &&) = default;
};

class Constant_dec_number : public Node {
public:
  Constant_dec_number(std::string element);
  Constant_dec_number(Constant_dec_number &&) = default;
  Constant_dec_number &operator=(Constant_dec_number &&) = default;
};

class Case_statement : public Node {
public:
  Case_statement(std::string element);
  Case_statement(Case_statement &&) = default;
  Case_statement &operator=(Case_statement &&) = default;
};

class Assignment_statement : public Node {
public:
  Assignment_statement(std::string element);
  Assignment_statement(Assignment_statement &&) = default;
  Assignment_statement &operator=(Assignment_statement &&) = default;
};

class Dpi_import_property_opt : public Node {
public:
  Dpi_import_property_opt(std::string element);
  Dpi_import_property_opt(Dpi_import_property_opt &&) = default;
  Dpi_import_property_opt &operator=(Dpi_import_property_opt &&) = default;
};

class Dpi_spec_string : public Node {
public:
  Dpi_spec_string(std::string element);
  Dpi_spec_string(Dpi_spec_string &&) = default;
  Dpi_spec_string &operator=(Dpi_spec_string &&) = default;
};

class Trailing_decl_assignment : public Node {
public:
  Trailing_decl_assignment(std::string element);
  Trailing_decl_assignment(Trailing_decl_assignment &&) = default;
  Trailing_decl_assignment &operator=(Trailing_decl_assignment &&) = default;
};

class Always_construct : public Node {
public:
  Always_construct(std::string element);
  Always_construct(Always_construct &&) = default;
  Always_construct &operator=(Always_construct &&) = default;
};

class Genvar_opt : public Node {
public:
  Genvar_opt(std::string element);
  Genvar_opt(Genvar_opt &&) = default;
  Genvar_opt &operator=(Genvar_opt &&) = default;
};

class Any_port_list_named : public Node {
public:
  Any_port_list_named(std::string element);
  Any_port_list_named(Any_port_list_named &&) = default;
  Any_port_list_named &operator=(Any_port_list_named &&) = default;
};

class Subroutine_call : public Node {
public:
  Subroutine_call(std::string element);
  Subroutine_call(Subroutine_call &&) = default;
  Subroutine_call &operator=(Subroutine_call &&) = default;
};

class Property_expr_or_assignment : public Node {
public:
  Property_expr_or_assignment(std::string element);
  Property_expr_or_assignment(Property_expr_or_assignment &&) = default;
  Property_expr_or_assignment &
  operator=(Property_expr_or_assignment &&) = default;
};

class Any_argument : public Node {
public:
  Any_argument(std::string element);
  Any_argument(Any_argument &&) = default;
  Any_argument &operator=(Any_argument &&) = default;
};

class Module_or_interface_declaration : public Node {
public:
  Module_or_interface_declaration(std::string element);
  Module_or_interface_declaration(Module_or_interface_declaration &&) = default;
  Module_or_interface_declaration &
  operator=(Module_or_interface_declaration &&) = default;
};

class Expression_opt : public Node {
public:
  Expression_opt(std::string element);
  Expression_opt(Expression_opt &&) = default;
  Expression_opt &operator=(Expression_opt &&) = default;
};

class Gate_instance_or_register_variable_list : public Node {
public:
  Gate_instance_or_register_variable_list(std::string element);
  Gate_instance_or_register_variable_list(
      Gate_instance_or_register_variable_list &&) = default;
  Gate_instance_or_register_variable_list &
  operator=(Gate_instance_or_register_variable_list &&) = default;
};

class Tk_evalstringliteral : public Node {
public:
  Tk_evalstringliteral(std::string element);
  Tk_evalstringliteral(Tk_evalstringliteral &&) = default;
  Tk_evalstringliteral &operator=(Tk_evalstringliteral &&) = default;
};

class Delay_or_event_control : public Node {
public:
  Delay_or_event_control(std::string element);
  Delay_or_event_control(Delay_or_event_control &&) = default;
  Delay_or_event_control &operator=(Delay_or_event_control &&) = default;
};

class Udp_input_list : public Node {
public:
  Udp_input_list(std::string element);
  Udp_input_list(Udp_input_list &&) = default;
  Udp_input_list &operator=(Udp_input_list &&) = default;
};

class Parameter_value_byname_list : public Node {
public:
  Parameter_value_byname_list(std::string element);
  Parameter_value_byname_list(Parameter_value_byname_list &&) = default;
  Parameter_value_byname_list &
  operator=(Parameter_value_byname_list &&) = default;
};

class Module_port_list_opt : public Node {
public:
  Module_port_list_opt(std::string element);
  Module_port_list_opt(Module_port_list_opt &&) = default;
  Module_port_list_opt &operator=(Module_port_list_opt &&) = default;
};

class List_of_ports_or_port_declarations_opt : public Node {
public:
  List_of_ports_or_port_declarations_opt(std::string element);
  List_of_ports_or_port_declarations_opt(
      List_of_ports_or_port_declarations_opt &&) = default;
  List_of_ports_or_port_declarations_opt &
  operator=(List_of_ports_or_port_declarations_opt &&) = default;
};

class Any_port_list_trailing_comma_positional : public Node {
public:
  Any_port_list_trailing_comma_positional(std::string element);
  Any_port_list_trailing_comma_positional(
      Any_port_list_trailing_comma_positional &&) = default;
  Any_port_list_trailing_comma_positional &
  operator=(Any_port_list_trailing_comma_positional &&) = default;
};

class Block_item_or_statement_or_null_list_opt : public Node {
public:
  Block_item_or_statement_or_null_list_opt(std::string element);
  Block_item_or_statement_or_null_list_opt(
      Block_item_or_statement_or_null_list_opt &&) = default;
  Block_item_or_statement_or_null_list_opt &
  operator=(Block_item_or_statement_or_null_list_opt &&) = default;
};

class Genvar_declaration : public Node {
public:
  Genvar_declaration(std::string element);
  Genvar_declaration(Genvar_declaration &&) = default;
  Genvar_declaration &operator=(Genvar_declaration &&) = default;
};

class Number : public Node {
public:
  Number(std::string element);
  Number(Number &&) = default;
  Number &operator=(Number &&) = default;
};

class Specify_item_list : public Node {
public:
  Specify_item_list(std::string element);
  Specify_item_list(Specify_item_list &&) = default;
  Specify_item_list &operator=(Specify_item_list &&) = default;
};

class Tk_ls_eq : public Node {
public:
  Tk_ls_eq(std::string element);
  Tk_ls_eq(Tk_ls_eq &&) = default;
  Tk_ls_eq &operator=(Tk_ls_eq &&) = default;
};

class Tf_variable_identifier : public Node {
public:
  Tf_variable_identifier(std::string element);
  Tf_variable_identifier(Tf_variable_identifier &&) = default;
  Tf_variable_identifier &operator=(Tf_variable_identifier &&) = default;
};

class Initial_construct : public Node {
public:
  Initial_construct(std::string element);
  Initial_construct(Initial_construct &&) = default;
  Initial_construct &operator=(Initial_construct &&) = default;
};

class Localparam_assign_list : public Node {
public:
  Localparam_assign_list(std::string element);
  Localparam_assign_list(Localparam_assign_list &&) = default;
  Localparam_assign_list &operator=(Localparam_assign_list &&) = default;
};

class Disable_statement : public Node {
public:
  Disable_statement(std::string element);
  Disable_statement(Disable_statement &&) = default;
  Disable_statement &operator=(Disable_statement &&) = default;
};

class List_of_module_item_identifiers : public Node {
public:
  List_of_module_item_identifiers(std::string element);
  List_of_module_item_identifiers(List_of_module_item_identifiers &&) = default;
  List_of_module_item_identifiers &
  operator=(List_of_module_item_identifiers &&) = default;
};

class Any_port_list_item_last_named : public Node {
public:
  Any_port_list_item_last_named(std::string element);
  Any_port_list_item_last_named(Any_port_list_item_last_named &&) = default;
  Any_port_list_item_last_named &
  operator=(Any_port_list_item_last_named &&) = default;
};

class Net_variable : public Node {
public:
  Net_variable(std::string element);
  Net_variable(Net_variable &&) = default;
  Net_variable &operator=(Net_variable &&) = default;
};

class Parameter_expr_list : public Node {
public:
  Parameter_expr_list(std::string element);
  Parameter_expr_list(Parameter_expr_list &&) = default;
  Parameter_expr_list &operator=(Parameter_expr_list &&) = default;
};

class Specparam_declaration : public Node {
public:
  Specparam_declaration(std::string element);
  Specparam_declaration(Specparam_declaration &&) = default;
  Specparam_declaration &operator=(Specparam_declaration &&) = default;
};

class Deferred_immediate_assertion_statement : public Node {
public:
  Deferred_immediate_assertion_statement(std::string element);
  Deferred_immediate_assertion_statement(
      Deferred_immediate_assertion_statement &&) = default;
  Deferred_immediate_assertion_statement &
  operator=(Deferred_immediate_assertion_statement &&) = default;
};

class Slice_size_opt : public Node {
public:
  Slice_size_opt(std::string element);
  Slice_size_opt(Slice_size_opt &&) = default;
  Slice_size_opt &operator=(Slice_size_opt &&) = default;
};

class Concurrent_assertion_item : public Node {
public:
  Concurrent_assertion_item(std::string element);
  Concurrent_assertion_item(Concurrent_assertion_item &&) = default;
  Concurrent_assertion_item &operator=(Concurrent_assertion_item &&) = default;
};

class Clocking_item_list_opt : public Node {
public:
  Clocking_item_list_opt(std::string element);
  Clocking_item_list_opt(Clocking_item_list_opt &&) = default;
  Clocking_item_list_opt &operator=(Clocking_item_list_opt &&) = default;
};

class Cycle_delay : public Node {
public:
  Cycle_delay(std::string element);
  Cycle_delay(Cycle_delay &&) = default;
  Cycle_delay &operator=(Cycle_delay &&) = default;
};

class Macroiditem : public Node {
public:
  Macroiditem(std::string element);
  Macroiditem(Macroiditem &&) = default;
  Macroiditem &operator=(Macroiditem &&) = default;
};

class Assume_property_statement : public Node {
public:
  Assume_property_statement(std::string element);
  Assume_property_statement(Assume_property_statement &&) = default;
  Assume_property_statement &operator=(Assume_property_statement &&) = default;
};

class Pull01 : public Node {
public:
  Pull01(std::string element);
  Pull01(Pull01 &&) = default;
  Pull01 &operator=(Pull01 &&) = default;
};

class Preprocessor_directive : public Node {
public:
  Preprocessor_directive(std::string element);
  Preprocessor_directive(Preprocessor_directive &&) = default;
  Preprocessor_directive &operator=(Preprocessor_directive &&) = default;
};

class Module_item_directive : public Node {
public:
  Module_item_directive(std::string element);
  Module_item_directive(Module_item_directive &&) = default;
  Module_item_directive &operator=(Module_item_directive &&) = default;
};

class Assert_property_statement : public Node {
public:
  Assert_property_statement(std::string element);
  Assert_property_statement(Assert_property_statement &&) = default;
  Assert_property_statement &operator=(Assert_property_statement &&) = default;
};

class Scope_or_if_res : public Node {
public:
  Scope_or_if_res(std::string element);
  Scope_or_if_res(Scope_or_if_res &&) = default;
  Scope_or_if_res &operator=(Scope_or_if_res &&) = default;
};

class Task_prototype : public Node {
public:
  Task_prototype(std::string element);
  Task_prototype(Task_prototype &&) = default;
  Task_prototype &operator=(Task_prototype &&) = default;
};

class Clocking_declaration : public Node {
public:
  Clocking_declaration(std::string element);
  Clocking_declaration(Clocking_declaration &&) = default;
  Clocking_declaration &operator=(Clocking_declaration &&) = default;
};

class Block_identifier_opt : public Node {
public:
  Block_identifier_opt(std::string element);
  Block_identifier_opt(Block_identifier_opt &&) = default;
  Block_identifier_opt &operator=(Block_identifier_opt &&) = default;
};

class Macroidentifier : public Node {
public:
  Macroidentifier(std::string element);
  Macroidentifier(Macroidentifier &&) = default;
  Macroidentifier &operator=(Macroidentifier &&) = default;
};

class Property_spec_disable_iff_opt : public Node {
public:
  Property_spec_disable_iff_opt(std::string element);
  Property_spec_disable_iff_opt(Property_spec_disable_iff_opt &&) = default;
  Property_spec_disable_iff_opt &
  operator=(Property_spec_disable_iff_opt &&) = default;
};

class Macrogenericitem : public Node {
public:
  Macrogenericitem(std::string element);
  Macrogenericitem(Macrogenericitem &&) = default;
  Macrogenericitem &operator=(Macrogenericitem &&) = default;
};

class Module_block : public Node {
public:
  Module_block(std::string element);
  Module_block(Module_block &&) = default;
  Module_block &operator=(Module_block &&) = default;
};

class Stream_expression : public Node {
public:
  Stream_expression(std::string element);
  Stream_expression(Stream_expression &&) = default;
  Stream_expression &operator=(Stream_expression &&) = default;
};

class Final_or_zero : public Node {
public:
  Final_or_zero(std::string element);
  Final_or_zero(Final_or_zero &&) = default;
  Final_or_zero &operator=(Final_or_zero &&) = default;
};

class Tk_edge_descriptor : public Node {
public:
  Tk_edge_descriptor(std::string element);
  Tk_edge_descriptor(Tk_edge_descriptor &&) = default;
  Tk_edge_descriptor &operator=(Tk_edge_descriptor &&) = default;
};

class Method_property_qualifier_list_not_starting_with_virtual : public Node {
public:
  Method_property_qualifier_list_not_starting_with_virtual(std::string element);
  Method_property_qualifier_list_not_starting_with_virtual(
      Method_property_qualifier_list_not_starting_with_virtual &&) = default;
  Method_property_qualifier_list_not_starting_with_virtual &operator=(
      Method_property_qualifier_list_not_starting_with_virtual &&) = default;
};

class Identifier_opt : public Node {
public:
  Identifier_opt(std::string element);
  Identifier_opt(Identifier_opt &&) = default;
  Identifier_opt &operator=(Identifier_opt &&) = default;
};

class Module_parameter_port_list_preprocessor_last : public Node {
public:
  Module_parameter_port_list_preprocessor_last(std::string element);
  Module_parameter_port_list_preprocessor_last(
      Module_parameter_port_list_preprocessor_last &&) = default;
  Module_parameter_port_list_preprocessor_last &
  operator=(Module_parameter_port_list_preprocessor_last &&) = default;
};

class Type_assignment : public Node {
public:
  Type_assignment(std::string element);
  Type_assignment(Type_assignment &&) = default;
  Type_assignment &operator=(Type_assignment &&) = default;
};

class Type_assignment_list : public Node {
public:
  Type_assignment_list(std::string element);
  Type_assignment_list(Type_assignment_list &&) = default;
  Type_assignment_list &operator=(Type_assignment_list &&) = default;
};

class Method_qualifier_list_opt : public Node {
public:
  Method_qualifier_list_opt(std::string element);
  Method_qualifier_list_opt(Method_qualifier_list_opt &&) = default;
  Method_qualifier_list_opt &operator=(Method_qualifier_list_opt &&) = default;
};

class Stream_operator : public Node {
public:
  Stream_operator(std::string element);
  Stream_operator(Stream_operator &&) = default;
  Stream_operator &operator=(Stream_operator &&) = default;
};

class Assertion_item : public Node {
public:
  Assertion_item(std::string element);
  Assertion_item(Assertion_item &&) = default;
  Assertion_item &operator=(Assertion_item &&) = default;
};

class Property_spec : public Node {
public:
  Property_spec(std::string element);
  Property_spec(Property_spec &&) = default;
  Property_spec &operator=(Property_spec &&) = default;
};

class Streaming_concatenation : public Node {
public:
  Streaming_concatenation(std::string element);
  Streaming_concatenation(Streaming_concatenation &&) = default;
  Streaming_concatenation &operator=(Streaming_concatenation &&) = default;
};

class Edge_descriptor_list : public Node {
public:
  Edge_descriptor_list(std::string element);
  Edge_descriptor_list(Edge_descriptor_list &&) = default;
  Edge_descriptor_list &operator=(Edge_descriptor_list &&) = default;
};

class Property_qualifier : public Node {
public:
  Property_qualifier(std::string element);
  Property_qualifier(Property_qualifier &&) = default;
  Property_qualifier &operator=(Property_qualifier &&) = default;
};

class Event_control_opt : public Node {
public:
  Event_control_opt(std::string element);
  Event_control_opt(Event_control_opt &&) = default;
  Event_control_opt &operator=(Event_control_opt &&) = default;
};

class Class_item_qualifier : public Node {
public:
  Class_item_qualifier(std::string element);
  Class_item_qualifier(Class_item_qualifier &&) = default;
  Class_item_qualifier &operator=(Class_item_qualifier &&) = default;
};

class Concurrent_assertion_statement : public Node {
public:
  Concurrent_assertion_statement(std::string element);
  Concurrent_assertion_statement(Concurrent_assertion_statement &&) = default;
  Concurrent_assertion_statement &
  operator=(Concurrent_assertion_statement &&) = default;
};

class Cover_property_statement : public Node {
public:
  Cover_property_statement(std::string element);
  Cover_property_statement(Cover_property_statement &&) = default;
  Cover_property_statement &operator=(Cover_property_statement &&) = default;
};

class Stream_expression_list : public Node {
public:
  Stream_expression_list(std::string element);
  Stream_expression_list(Stream_expression_list &&) = default;
  Stream_expression_list &operator=(Stream_expression_list &&) = default;
};

class Class_item_qualifier_list_opt : public Node {
public:
  Class_item_qualifier_list_opt(std::string element);
  Class_item_qualifier_list_opt(Class_item_qualifier_list_opt &&) = default;
  Class_item_qualifier_list_opt &
  operator=(Class_item_qualifier_list_opt &&) = default;
};

class Assertion_item_declaration : public Node {
public:
  Assertion_item_declaration(std::string element);
  Assertion_item_declaration(Assertion_item_declaration &&) = default;
  Assertion_item_declaration &
  operator=(Assertion_item_declaration &&) = default;
};

class Boolean_abbrev : public Node {
public:
  Boolean_abbrev(std::string element);
  Boolean_abbrev(Boolean_abbrev &&) = default;
  Boolean_abbrev &operator=(Boolean_abbrev &&) = default;
};

class Cycle_delay_range : public Node {
public:
  Cycle_delay_range(std::string element);
  Cycle_delay_range(Cycle_delay_range &&) = default;
  Cycle_delay_range &operator=(Cycle_delay_range &&) = default;
};

class Property_operator : public Node {
public:
  Property_operator(std::string element);
  Property_operator(Property_operator &&) = default;
  Property_operator &operator=(Property_operator &&) = default;
};

class Property_spec_disable_iff : public Node {
public:
  Property_spec_disable_iff(std::string element);
  Property_spec_disable_iff(Property_spec_disable_iff &&) = default;
  Property_spec_disable_iff &operator=(Property_spec_disable_iff &&) = default;
};

class Config_declaration : public Node {
public:
  Config_declaration(std::string element);
  Config_declaration(Config_declaration &&) = default;
  Config_declaration &operator=(Config_declaration &&) = default;
};

class With_constraint_block_opt : public Node {
public:
  With_constraint_block_opt(std::string element);
  With_constraint_block_opt(With_constraint_block_opt &&) = default;
  With_constraint_block_opt &operator=(With_constraint_block_opt &&) = default;
};

class Random_qualifier : public Node {
public:
  Random_qualifier(std::string element);
  Random_qualifier(Random_qualifier &&) = default;
  Random_qualifier &operator=(Random_qualifier &&) = default;
};

class Bind_target_instance_list : public Node {
public:
  Bind_target_instance_list(std::string element);
  Bind_target_instance_list(Bind_target_instance_list &&) = default;
  Bind_target_instance_list &operator=(Bind_target_instance_list &&) = default;
};

class Hierarchy_or_call_extension : public Node {
public:
  Hierarchy_or_call_extension(std::string element);
  Hierarchy_or_call_extension(Hierarchy_or_call_extension &&) = default;
  Hierarchy_or_call_extension &
  operator=(Hierarchy_or_call_extension &&) = default;
};

class Clocking_item_list : public Node {
public:
  Clocking_item_list(std::string element);
  Clocking_item_list(Clocking_item_list &&) = default;
  Clocking_item_list &operator=(Clocking_item_list &&) = default;
};

class Modport_declaration : public Node {
public:
  Modport_declaration(std::string element);
  Modport_declaration(Modport_declaration &&) = default;
  Modport_declaration &operator=(Modport_declaration &&) = default;
};

class Class_constraint : public Node {
public:
  Class_constraint(std::string element);
  Class_constraint(Class_constraint &&) = default;
  Class_constraint &operator=(Class_constraint &&) = default;
};

class Net_alias : public Node {
public:
  Net_alias(std::string element);
  Net_alias(Net_alias &&) = default;
  Net_alias &operator=(Net_alias &&) = default;
};

class Type_reference : public Node {
public:
  Type_reference(std::string element);
  Type_reference(Type_reference &&) = default;
  Type_reference &operator=(Type_reference &&) = default;
};

class Method_qualifier_list : public Node {
public:
  Method_qualifier_list(std::string element);
  Method_qualifier_list(Method_qualifier_list &&) = default;
  Method_qualifier_list &operator=(Method_qualifier_list &&) = default;
};

class Interface_type : public Node {
public:
  Interface_type(std::string element);
  Interface_type(Interface_type &&) = default;
  Interface_type &operator=(Interface_type &&) = default;
};

class Package_export_declaration : public Node {
public:
  Package_export_declaration(std::string element);
  Package_export_declaration(Package_export_declaration &&) = default;
  Package_export_declaration &
  operator=(Package_export_declaration &&) = default;
};

class Constraint_block_item_list_opt : public Node {
public:
  Constraint_block_item_list_opt(std::string element);
  Constraint_block_item_list_opt(Constraint_block_item_list_opt &&) = default;
  Constraint_block_item_list_opt &
  operator=(Constraint_block_item_list_opt &&) = default;
};

class Constraint_block_item_list : public Node {
public:
  Constraint_block_item_list(std::string element);
  Constraint_block_item_list(Constraint_block_item_list &&) = default;
  Constraint_block_item_list &
  operator=(Constraint_block_item_list &&) = default;
};

class List_of_libraries_opt : public Node {
public:
  List_of_libraries_opt(std::string element);
  List_of_libraries_opt(List_of_libraries_opt &&) = default;
  List_of_libraries_opt &operator=(List_of_libraries_opt &&) = default;
};

class Lib_cell_id : public Node {
public:
  Lib_cell_id(std::string element);
  Lib_cell_id(Lib_cell_id &&) = default;
  Lib_cell_id &operator=(Lib_cell_id &&) = default;
};

class Expect_property_statement : public Node {
public:
  Expect_property_statement(std::string element);
  Expect_property_statement(Expect_property_statement &&) = default;
  Expect_property_statement &operator=(Expect_property_statement &&) = default;
};

class Optional_semicolon : public Node {
public:
  Optional_semicolon(std::string element);
  Optional_semicolon(Optional_semicolon &&) = default;
  Optional_semicolon &operator=(Optional_semicolon &&) = default;
};

class Identifier_list_in_parens_opt : public Node {
public:
  Identifier_list_in_parens_opt(std::string element);
  Identifier_list_in_parens_opt(Identifier_list_in_parens_opt &&) = default;
  Identifier_list_in_parens_opt &
  operator=(Identifier_list_in_parens_opt &&) = default;
};

class Sequence_port_list_in_parens_opt : public Node {
public:
  Sequence_port_list_in_parens_opt(std::string element);
  Sequence_port_list_in_parens_opt(Sequence_port_list_in_parens_opt &&) =
      default;
  Sequence_port_list_in_parens_opt &
  operator=(Sequence_port_list_in_parens_opt &&) = default;
};

class Data_type_or_implicit_basic_followed_by_id : public Node {
public:
  Data_type_or_implicit_basic_followed_by_id(std::string element);
  Data_type_or_implicit_basic_followed_by_id(
      Data_type_or_implicit_basic_followed_by_id &&) = default;
  Data_type_or_implicit_basic_followed_by_id &
  operator=(Data_type_or_implicit_basic_followed_by_id &&) = default;
};

class Modport_simple_ports_declaration_last : public Node {
public:
  Modport_simple_ports_declaration_last(std::string element);
  Modport_simple_ports_declaration_last(
      Modport_simple_ports_declaration_last &&) = default;
  Modport_simple_ports_declaration_last &
  operator=(Modport_simple_ports_declaration_last &&) = default;
};

class Goto_repetition : public Node {
public:
  Goto_repetition(std::string element);
  Goto_repetition(Goto_repetition &&) = default;
  Goto_repetition &operator=(Goto_repetition &&) = default;
};

class Modport_ports_list : public Node {
public:
  Modport_ports_list(std::string element);
  Modport_ports_list(Modport_ports_list &&) = default;
  Modport_ports_list &operator=(Modport_ports_list &&) = default;
};

class Coverage_spec_or_option_list : public Node {
public:
  Coverage_spec_or_option_list(std::string element);
  Coverage_spec_or_option_list(Coverage_spec_or_option_list &&) = default;
  Coverage_spec_or_option_list &
  operator=(Coverage_spec_or_option_list &&) = default;
};

class Assertion_variable_declaration : public Node {
public:
  Assertion_variable_declaration(std::string element);
  Assertion_variable_declaration(Assertion_variable_declaration &&) = default;
  Assertion_variable_declaration &
  operator=(Assertion_variable_declaration &&) = default;
};

class Interface_opt : public Node {
public:
  Interface_opt(std::string element);
  Interface_opt(Interface_opt &&) = default;
  Interface_opt &operator=(Interface_opt &&) = default;
};

class List_of_libraries : public Node {
public:
  List_of_libraries(std::string element);
  List_of_libraries(List_of_libraries &&) = default;
  List_of_libraries &operator=(List_of_libraries &&) = default;
};

class Type_identifier_or_implicit_basic_followed_by_id : public Node {
public:
  Type_identifier_or_implicit_basic_followed_by_id(std::string element);
  Type_identifier_or_implicit_basic_followed_by_id(
      Type_identifier_or_implicit_basic_followed_by_id &&) = default;
  Type_identifier_or_implicit_basic_followed_by_id &
  operator=(Type_identifier_or_implicit_basic_followed_by_id &&) = default;
};

class Bind_target_instance : public Node {
public:
  Bind_target_instance(std::string element);
  Bind_target_instance(Bind_target_instance &&) = default;
  Bind_target_instance &operator=(Bind_target_instance &&) = default;
};

class Property_actual_arg_opt : public Node {
public:
  Property_actual_arg_opt(std::string element);
  Property_actual_arg_opt(Property_actual_arg_opt &&) = default;
  Property_actual_arg_opt &operator=(Property_actual_arg_opt &&) = default;
};

class Method_qualifier : public Node {
public:
  Method_qualifier(std::string element);
  Method_qualifier(Method_qualifier &&) = default;
  Method_qualifier &operator=(Method_qualifier &&) = default;
};

class Design_statement : public Node {
public:
  Design_statement(std::string element);
  Design_statement(Design_statement &&) = default;
  Design_statement &operator=(Design_statement &&) = default;
};

class Modport_simple_ports_declaration_begin : public Node {
public:
  Modport_simple_ports_declaration_begin(std::string element);
  Modport_simple_ports_declaration_begin(
      Modport_simple_ports_declaration_begin &&) = default;
  Modport_simple_ports_declaration_begin &
  operator=(Modport_simple_ports_declaration_begin &&) = default;
};

class Sequence_port_list_opt : public Node {
public:
  Sequence_port_list_opt(std::string element);
  Sequence_port_list_opt(Sequence_port_list_opt &&) = default;
  Sequence_port_list_opt &operator=(Sequence_port_list_opt &&) = default;
};

class Clocking_item : public Node {
public:
  Clocking_item(std::string element);
  Clocking_item(Clocking_item &&) = default;
  Clocking_item &operator=(Clocking_item &&) = default;
};

class Constraint_declaration : public Node {
public:
  Constraint_declaration(std::string element);
  Constraint_declaration(Constraint_declaration &&) = default;
  Constraint_declaration &operator=(Constraint_declaration &&) = default;
};

class Clocking_direction : public Node {
public:
  Clocking_direction(std::string element);
  Clocking_direction(Clocking_direction &&) = default;
  Clocking_direction &operator=(Clocking_direction &&) = default;
};

class Modport_item : public Node {
public:
  Modport_item(std::string element);
  Modport_item(Modport_item &&) = default;
  Modport_item &operator=(Modport_item &&) = default;
};

class Clocking_decl_assign : public Node {
public:
  Clocking_decl_assign(std::string element);
  Clocking_decl_assign(Clocking_decl_assign &&) = default;
  Clocking_decl_assign &operator=(Clocking_decl_assign &&) = default;
};

class Consecutive_repetition : public Node {
public:
  Consecutive_repetition(std::string element);
  Consecutive_repetition(Consecutive_repetition &&) = default;
  Consecutive_repetition &operator=(Consecutive_repetition &&) = default;
};

class Bins_or_options_list_opt : public Node {
public:
  Bins_or_options_list_opt(std::string element);
  Bins_or_options_list_opt(Bins_or_options_list_opt &&) = default;
  Bins_or_options_list_opt &operator=(Bins_or_options_list_opt &&) = default;
};

class Cycle_range : public Node {
public:
  Cycle_range(std::string element);
  Cycle_range(Cycle_range &&) = default;
  Cycle_range &operator=(Cycle_range &&) = default;
};

class Clocking_skew_opt : public Node {
public:
  Clocking_skew_opt(std::string element);
  Clocking_skew_opt(Clocking_skew_opt &&) = default;
  Clocking_skew_opt &operator=(Clocking_skew_opt &&) = default;
};

class Nonconsecutive_repetition : public Node {
public:
  Nonconsecutive_repetition(std::string element);
  Nonconsecutive_repetition(Nonconsecutive_repetition &&) = default;
  Nonconsecutive_repetition &operator=(Nonconsecutive_repetition &&) = default;
};

class Constraint_expression_no_preprocessor : public Node {
public:
  Constraint_expression_no_preprocessor(std::string element);
  Constraint_expression_no_preprocessor(
      Constraint_expression_no_preprocessor &&) = default;
  Constraint_expression_no_preprocessor &
  operator=(Constraint_expression_no_preprocessor &&) = default;
};

class List_of_clocking_decl_assign : public Node {
public:
  List_of_clocking_decl_assign(std::string element);
  List_of_clocking_decl_assign(List_of_clocking_decl_assign &&) = default;
  List_of_clocking_decl_assign &
  operator=(List_of_clocking_decl_assign &&) = default;
};

class Property_port_list : public Node {
public:
  Property_port_list(std::string element);
  Property_port_list(Property_port_list &&) = default;
  Property_port_list &operator=(Property_port_list &&) = default;
};

class Net_alias_assign_lvalue_list : public Node {
public:
  Net_alias_assign_lvalue_list(std::string element);
  Net_alias_assign_lvalue_list(Net_alias_assign_lvalue_list &&) = default;
  Net_alias_assign_lvalue_list &
  operator=(Net_alias_assign_lvalue_list &&) = default;
};

class Assertion_variable_declaration_list : public Node {
public:
  Assertion_variable_declaration_list(std::string element);
  Assertion_variable_declaration_list(Assertion_variable_declaration_list &&) =
      default;
  Assertion_variable_declaration_list &
  operator=(Assertion_variable_declaration_list &&) = default;
};

class List_of_config_rule_statements : public Node {
public:
  List_of_config_rule_statements(std::string element);
  List_of_config_rule_statements(List_of_config_rule_statements &&) = default;
  List_of_config_rule_statements &
  operator=(List_of_config_rule_statements &&) = default;
};

class Constraint_block : public Node {
public:
  Constraint_block(std::string element);
  Constraint_block(Constraint_block &&) = default;
  Constraint_block &operator=(Constraint_block &&) = default;
};

class List_of_config_rule_statements_opt : public Node {
public:
  List_of_config_rule_statements_opt(std::string element);
  List_of_config_rule_statements_opt(List_of_config_rule_statements_opt &&) =
      default;
  List_of_config_rule_statements_opt &
  operator=(List_of_config_rule_statements_opt &&) = default;
};

class Property_port_modifiers_opt : public Node {
public:
  Property_port_modifiers_opt(std::string element);
  Property_port_modifiers_opt(Property_port_modifiers_opt &&) = default;
  Property_port_modifiers_opt &
  operator=(Property_port_modifiers_opt &&) = default;
};

class With_constraint_block : public Node {
public:
  With_constraint_block(std::string element);
  With_constraint_block(With_constraint_block &&) = default;
  With_constraint_block &operator=(With_constraint_block &&) = default;
};

class Property_declaration : public Node {
public:
  Property_declaration(std::string element);
  Property_declaration(Property_declaration &&) = default;
  Property_declaration &operator=(Property_declaration &&) = default;
};

class Implication_operator : public Node {
public:
  Implication_operator(std::string element);
  Implication_operator(Implication_operator &&) = default;
  Implication_operator &operator=(Implication_operator &&) = default;
};

class Cover_point : public Node {
public:
  Cover_point(std::string element);
  Cover_point(Cover_point &&) = default;
  Cover_point &operator=(Cover_point &&) = default;
};

class Coverage_event : public Node {
public:
  Coverage_event(std::string element);
  Coverage_event(Coverage_event &&) = default;
  Coverage_event &operator=(Coverage_event &&) = default;
};

class Property_formal_type_followed_by_id : public Node {
public:
  Property_formal_type_followed_by_id(std::string element);
  Property_formal_type_followed_by_id(Property_formal_type_followed_by_id &&) =
      default;
  Property_formal_type_followed_by_id &
  operator=(Property_formal_type_followed_by_id &&) = default;
};

class Config_rule_statement : public Node {
public:
  Config_rule_statement(std::string element);
  Config_rule_statement(Config_rule_statement &&) = default;
  Config_rule_statement &operator=(Config_rule_statement &&) = default;
};

class Modport_item_list : public Node {
public:
  Modport_item_list(std::string element);
  Modport_item_list(Modport_item_list &&) = default;
  Modport_item_list &operator=(Modport_item_list &&) = default;
};

class Property_port_item : public Node {
public:
  Property_port_item(std::string element);
  Property_port_item(Property_port_item &&) = default;
  Property_port_item &operator=(Property_port_item &&) = default;
};

class Liblist_clause : public Node {
public:
  Liblist_clause(std::string element);
  Liblist_clause(Liblist_clause &&) = default;
  Liblist_clause &operator=(Liblist_clause &&) = default;
};

class Lib_cell_identifiers_opt : public Node {
public:
  Lib_cell_identifiers_opt(std::string element);
  Lib_cell_identifiers_opt(Lib_cell_identifiers_opt &&) = default;
  Lib_cell_identifiers_opt &operator=(Lib_cell_identifiers_opt &&) = default;
};

class Covergroup_declaration : public Node {
public:
  Covergroup_declaration(std::string element);
  Covergroup_declaration(Covergroup_declaration &&) = default;
  Covergroup_declaration &operator=(Covergroup_declaration &&) = default;
};

class Modport_simple_port : public Node {
public:
  Modport_simple_port(std::string element);
  Modport_simple_port(Modport_simple_port &&) = default;
  Modport_simple_port &operator=(Modport_simple_port &&) = default;
};

class Sequence_declaration : public Node {
public:
  Sequence_declaration(std::string element);
  Sequence_declaration(Sequence_declaration &&) = default;
  Sequence_declaration &operator=(Sequence_declaration &&) = default;
};

class Coverage_event_opt : public Node {
public:
  Coverage_event_opt(std::string element);
  Coverage_event_opt(Coverage_event_opt &&) = default;
  Coverage_event_opt &operator=(Coverage_event_opt &&) = default;
};

class Lib_cell_identifiers : public Node {
public:
  Lib_cell_identifiers(std::string element);
  Lib_cell_identifiers(Lib_cell_identifiers &&) = default;
  Lib_cell_identifiers &operator=(Lib_cell_identifiers &&) = default;
};

class Cycle_range_or_expr : public Node {
public:
  Cycle_range_or_expr(std::string element);
  Cycle_range_or_expr(Cycle_range_or_expr &&) = default;
  Cycle_range_or_expr &operator=(Cycle_range_or_expr &&) = default;
};

class Property_port_list_in_parens_opt : public Node {
public:
  Property_port_list_in_parens_opt(std::string element);
  Property_port_list_in_parens_opt(Property_port_list_in_parens_opt &&) =
      default;
  Property_port_list_in_parens_opt &
  operator=(Property_port_list_in_parens_opt &&) = default;
};

class Coverage_spec_or_option_list_opt : public Node {
public:
  Coverage_spec_or_option_list_opt(std::string element);
  Coverage_spec_or_option_list_opt(Coverage_spec_or_option_list_opt &&) =
      default;
  Coverage_spec_or_option_list_opt &
  operator=(Coverage_spec_or_option_list_opt &&) = default;
};

class Coverage_spec_or_option : public Node {
public:
  Coverage_spec_or_option(std::string element);
  Coverage_spec_or_option(Coverage_spec_or_option &&) = default;
  Coverage_spec_or_option &operator=(Coverage_spec_or_option &&) = default;
};

class Coverage_spec : public Node {
public:
  Coverage_spec(std::string element);
  Coverage_spec(Coverage_spec &&) = default;
  Coverage_spec &operator=(Coverage_spec &&) = default;
};

class Constraint_block_item : public Node {
public:
  Constraint_block_item(std::string element);
  Constraint_block_item(Constraint_block_item &&) = default;
  Constraint_block_item &operator=(Constraint_block_item &&) = default;
};

class Tk_static_opt : public Node {
public:
  Tk_static_opt(std::string element);
  Tk_static_opt(Tk_static_opt &&) = default;
  Tk_static_opt &operator=(Tk_static_opt &&) = default;
};

class Until_Operator : public Node {
public:
  Until_Operator(std::string element);
  Until_Operator(Until_Operator &&) = default;
  Until_Operator &operator=(Until_Operator &&) = default;
};
class Cover_Sequence_Statement : public Node {
public:
  Cover_Sequence_Statement(std::string element);
  Cover_Sequence_Statement(Cover_Sequence_Statement &&) = default;
  Cover_Sequence_Statement &operator=(Cover_Sequence_Statement &&) = default;
};
class With_Covergroup_Expression_In_Parens : public Node {
public:
  With_Covergroup_Expression_In_Parens(std::string element);
  With_Covergroup_Expression_In_Parens(
      With_Covergroup_Expression_In_Parens &&) = default;
  With_Covergroup_Expression_In_Parens &
  operator=(With_Covergroup_Expression_In_Parens &&) = default;
};
class Declaration_Extends_List_Opt : public Node {
public:
  Declaration_Extends_List_Opt(std::string element);
  Declaration_Extends_List_Opt(Declaration_Extends_List_Opt &&) = default;
  Declaration_Extends_List_Opt &
  operator=(Declaration_Extends_List_Opt &&) = default;
};
class Rs_If_Else : public Node {
public:
  Rs_If_Else(std::string element);
  Rs_If_Else(Rs_If_Else &&) = default;
  Rs_If_Else &operator=(Rs_If_Else &&) = default;
};
class Followed_By_Operator : public Node {
public:
  Followed_By_Operator(std::string element);
  Followed_By_Operator(Followed_By_Operator &&) = default;
  Followed_By_Operator &operator=(Followed_By_Operator &&) = default;
};
class Local_Sequence_Lvar_Port_Direction_Opt : public Node {
public:
  Local_Sequence_Lvar_Port_Direction_Opt(std::string element);
  Local_Sequence_Lvar_Port_Direction_Opt(
      Local_Sequence_Lvar_Port_Direction_Opt &&) = default;
  Local_Sequence_Lvar_Port_Direction_Opt &
  operator=(Local_Sequence_Lvar_Port_Direction_Opt &&) = default;
};
class Bins_Expression : public Node {
public:
  Bins_Expression(std::string element);
  Bins_Expression(Bins_Expression &&) = default;
  Bins_Expression &operator=(Bins_Expression &&) = default;
};
class Property_Actual_Arg : public Node {
public:
  Property_Actual_Arg(std::string element);
  Property_Actual_Arg(Property_Actual_Arg &&) = default;
  Property_Actual_Arg &operator=(Property_Actual_Arg &&) = default;
};
class Select_Expression : public Node {
public:
  Select_Expression(std::string element);
  Select_Expression(Select_Expression &&) = default;
  Select_Expression &operator=(Select_Expression &&) = default;
};
class Slice_Size : public Node {
public:
  Slice_Size(std::string element);
  Slice_Size(Slice_Size &&) = default;
  Slice_Size &operator=(Slice_Size &&) = default;
};
class Property_Case_Item : public Node {
public:
  Property_Case_Item(std::string element);
  Property_Case_Item(Property_Case_Item &&) = default;
  Property_Case_Item &operator=(Property_Case_Item &&) = default;
};
class Default_Skew : public Node {
public:
  Default_Skew(std::string element);
  Default_Skew(Default_Skew &&) = default;
  Default_Skew &operator=(Default_Skew &&) = default;
};
class Constraint_Expression_List : public Node {
public:
  Constraint_Expression_List(std::string element);
  Constraint_Expression_List(Constraint_Expression_List &&) = default;
  Constraint_Expression_List &
  operator=(Constraint_Expression_List &&) = default;
};
class Modport_Clocking_Declaration_Begin : public Node {
public:
  Modport_Clocking_Declaration_Begin(std::string element);
  Modport_Clocking_Declaration_Begin(Modport_Clocking_Declaration_Begin &&) =
      default;
  Modport_Clocking_Declaration_Begin &
  operator=(Modport_Clocking_Declaration_Begin &&) = default;
};
class Property_Case_Item_List : public Node {
public:
  Property_Case_Item_List(std::string element);
  Property_Case_Item_List(Property_Case_Item_List &&) = default;
  Property_Case_Item_List &operator=(Property_Case_Item_List &&) = default;
};
class Randomize_Call : public Node {
public:
  Randomize_Call(std::string element);
  Randomize_Call(Randomize_Call &&) = default;
  Randomize_Call &operator=(Randomize_Call &&) = default;
};
class Cross_Item_List : public Node {
public:
  Cross_Item_List(std::string element);
  Cross_Item_List(Cross_Item_List &&) = default;
  Cross_Item_List &operator=(Cross_Item_List &&) = default;
};
class Production_Item : public Node {
public:
  Production_Item(std::string element);
  Production_Item(Production_Item &&) = default;
  Production_Item &operator=(Production_Item &&) = default;
};
class Data_Type_Or_Void_With_Id : public Node {
public:
  Data_Type_Or_Void_With_Id(std::string element);
  Data_Type_Or_Void_With_Id(Data_Type_Or_Void_With_Id &&) = default;
  Data_Type_Or_Void_With_Id &operator=(Data_Type_Or_Void_With_Id &&) = default;
};
class Lb_Star_Rb : public Node {
public:
  Lb_Star_Rb(std::string element);
  Lb_Star_Rb(Lb_Star_Rb &&) = default;
  Lb_Star_Rb &operator=(Lb_Star_Rb &&) = default;
};
class Modport_Clocking_Declaration_Last : public Node {
public:
  Modport_Clocking_Declaration_Last(std::string element);
  Modport_Clocking_Declaration_Last(Modport_Clocking_Declaration_Last &&) =
      default;
  Modport_Clocking_Declaration_Last &
  operator=(Modport_Clocking_Declaration_Last &&) = default;
};
class Uniqueness_Constraint : public Node {
public:
  Uniqueness_Constraint(std::string element);
  Uniqueness_Constraint(Uniqueness_Constraint &&) = default;
  Uniqueness_Constraint &operator=(Uniqueness_Constraint &&) = default;
};
class Any_Port_List_Preprocessor_Last_Named : public Node {
public:
  Any_Port_List_Preprocessor_Last_Named(std::string element);
  Any_Port_List_Preprocessor_Last_Named(
      Any_Port_List_Preprocessor_Last_Named &&) = default;
  Any_Port_List_Preprocessor_Last_Named &
  operator=(Any_Port_List_Preprocessor_Last_Named &&) = default;
};
class Modport_Tf_Ports_Declaration_Trailing_Comma : public Node {
public:
  Modport_Tf_Ports_Declaration_Trailing_Comma(std::string element);
  Modport_Tf_Ports_Declaration_Trailing_Comma(
      Modport_Tf_Ports_Declaration_Trailing_Comma &&) = default;
  Modport_Tf_Ports_Declaration_Trailing_Comma &
  operator=(Modport_Tf_Ports_Declaration_Trailing_Comma &&) = default;
};
class Interface_Data_Declaration : public Node {
public:
  Interface_Data_Declaration(std::string element);
  Interface_Data_Declaration(Interface_Data_Declaration &&) = default;
  Interface_Data_Declaration &
  operator=(Interface_Data_Declaration &&) = default;
};
class Method_Property_Qualifier : public Node {
public:
  Method_Property_Qualifier(std::string element);
  Method_Property_Qualifier(Method_Property_Qualifier &&) = default;
  Method_Property_Qualifier &operator=(Method_Property_Qualifier &&) = default;
};
class Bins_Or_Options_List : public Node {
public:
  Bins_Or_Options_List(std::string element);
  Bins_Or_Options_List(Bins_Or_Options_List &&) = default;
  Bins_Or_Options_List &operator=(Bins_Or_Options_List &&) = default;
};
class Opt_Config : public Node {
public:
  Opt_Config(std::string element);
  Opt_Config(Opt_Config &&) = default;
  Opt_Config &operator=(Opt_Config &&) = default;
};
class Pattern_List : public Node {
public:
  Pattern_List(std::string element);
  Pattern_List(Pattern_List &&) = default;
  Pattern_List &operator=(Pattern_List &&) = default;
};
class Bins_Or_Options : public Node {
public:
  Bins_Or_Options(std::string element);
  Bins_Or_Options(Bins_Or_Options &&) = default;
  Bins_Or_Options &operator=(Bins_Or_Options &&) = default;
};
class Pattern_Opt : public Node {
public:
  Pattern_Opt(std::string element);
  Pattern_Opt(Pattern_Opt &&) = default;
  Pattern_Opt &operator=(Pattern_Opt &&) = default;
};
class Interface_Class_Item_List : public Node {
public:
  Interface_Class_Item_List(std::string element);
  Interface_Class_Item_List(Interface_Class_Item_List &&) = default;
  Interface_Class_Item_List &operator=(Interface_Class_Item_List &&) = default;
};
class Cross_Body_Item_List : public Node {
public:
  Cross_Body_Item_List(std::string element);
  Cross_Body_Item_List(Cross_Body_Item_List &&) = default;
  Cross_Body_Item_List &operator=(Cross_Body_Item_List &&) = default;
};
class Modport_Tf_Ports_Declaration_Begin : public Node {
public:
  Modport_Tf_Ports_Declaration_Begin(std::string element);
  Modport_Tf_Ports_Declaration_Begin(Modport_Tf_Ports_Declaration_Begin &&) =
      default;
  Modport_Tf_Ports_Declaration_Begin &
  operator=(Modport_Tf_Ports_Declaration_Begin &&) = default;
};
class Rs_Rule_List : public Node {
public:
  Rs_Rule_List(std::string element);
  Rs_Rule_List(Rs_Rule_List &&) = default;
  Rs_Rule_List &operator=(Rs_Rule_List &&) = default;
};
class Cell_Clause : public Node {
public:
  Cell_Clause(std::string element);
  Cell_Clause(Cell_Clause &&) = default;
  Cell_Clause &operator=(Cell_Clause &&) = default;
};
class Sequence_Port_List : public Node {
public:
  Sequence_Port_List(std::string element);
  Sequence_Port_List(Sequence_Port_List &&) = default;
  Sequence_Port_List &operator=(Sequence_Port_List &&) = default;
};
class Let_Port_List : public Node {
public:
  Let_Port_List(std::string element);
  Let_Port_List(Let_Port_List &&) = default;
  Let_Port_List &operator=(Let_Port_List &&) = default;
};
class Production_List : public Node {
public:
  Production_List(std::string element);
  Production_List(Production_List &&) = default;
  Production_List &operator=(Production_List &&) = default;
};
class Rs_Production_List_Or_Rand_Join : public Node {
public:
  Rs_Production_List_Or_Rand_Join(std::string element);
  Rs_Production_List_Or_Rand_Join(Rs_Production_List_Or_Rand_Join &&) = default;
  Rs_Production_List_Or_Rand_Join &
  operator=(Rs_Production_List_Or_Rand_Join &&) = default;
};
class Rs_Code_Block : public Node {
public:
  Rs_Code_Block(std::string element);
  Rs_Code_Block(Rs_Code_Block &&) = default;
  Rs_Code_Block &operator=(Rs_Code_Block &&) = default;
};
class Let_Declaration : public Node {
public:
  Let_Declaration(std::string element);
  Let_Declaration(Let_Declaration &&) = default;
  Let_Declaration &operator=(Let_Declaration &&) = default;
};
class Expression_In_Parens_Opt : public Node {
public:
  Expression_In_Parens_Opt(std::string element);
  Expression_In_Parens_Opt(Expression_In_Parens_Opt &&) = default;
  Expression_In_Parens_Opt &operator=(Expression_In_Parens_Opt &&) = default;
};
class Array_Method_With_Predicate_Opt : public Node {
public:
  Array_Method_With_Predicate_Opt(std::string element);
  Array_Method_With_Predicate_Opt(Array_Method_With_Predicate_Opt &&) = default;
  Array_Method_With_Predicate_Opt &
  operator=(Array_Method_With_Predicate_Opt &&) = default;
};
class Cross_Item : public Node {
public:
  Cross_Item(std::string element);
  Cross_Item(Cross_Item &&) = default;
  Cross_Item &operator=(Cross_Item &&) = default;
};
class Modport_Tf_Ports_Declaration_Last : public Node {
public:
  Modport_Tf_Ports_Declaration_Last(std::string element);
  Modport_Tf_Ports_Declaration_Last(Modport_Tf_Ports_Declaration_Last &&) =
      default;
  Modport_Tf_Ports_Declaration_Last &
  operator=(Modport_Tf_Ports_Declaration_Last &&) = default;
};
class Case_Pattern_Item : public Node {
public:
  Case_Pattern_Item(std::string element);
  Case_Pattern_Item(Case_Pattern_Item &&) = default;
  Case_Pattern_Item &operator=(Case_Pattern_Item &&) = default;
};
class Inst_Clause : public Node {
public:
  Inst_Clause(std::string element);
  Inst_Clause(Inst_Clause &&) = default;
  Inst_Clause &operator=(Inst_Clause &&) = default;
};
class Rs_Repeat : public Node {
public:
  Rs_Repeat(std::string element);
  Rs_Repeat(Rs_Repeat &&) = default;
  Rs_Repeat &operator=(Rs_Repeat &&) = default;
};
class Covergroup_Expression_Bracketed_Opt : public Node {
public:
  Covergroup_Expression_Bracketed_Opt(std::string element);
  Covergroup_Expression_Bracketed_Opt(Covergroup_Expression_Bracketed_Opt &&) =
      default;
  Covergroup_Expression_Bracketed_Opt &
  operator=(Covergroup_Expression_Bracketed_Opt &&) = default;
};
class Clocking_Drive_Only : public Node {
public:
  Clocking_Drive_Only(std::string element);
  Clocking_Drive_Only(Clocking_Drive_Only &&) = default;
  Clocking_Drive_Only &operator=(Clocking_Drive_Only &&) = default;
};
class Constraint_Primary : public Node {
public:
  Constraint_Primary(std::string element);
  Constraint_Primary(Constraint_Primary &&) = default;
  Constraint_Primary &operator=(Constraint_Primary &&) = default;
};
class Constraint_Expression : public Node {
public:
  Constraint_Expression(std::string element);
  Constraint_Expression(Constraint_Expression &&) = default;
  Constraint_Expression &operator=(Constraint_Expression &&) = default;
};
class Tk_Evalstringliteral : public Node {
public:
  Tk_Evalstringliteral(std::string element);
  Tk_Evalstringliteral(Tk_Evalstringliteral &&) = default;
  Tk_Evalstringliteral &operator=(Tk_Evalstringliteral &&) = default;
};
class Sequence_Match_Item_List : public Node {
public:
  Sequence_Match_Item_List(std::string element);
  Sequence_Match_Item_List(Sequence_Match_Item_List &&) = default;
  Sequence_Match_Item_List &operator=(Sequence_Match_Item_List &&) = default;
};
class Sequence_Spec : public Node {
public:
  Sequence_Spec(std::string element);
  Sequence_Spec(Sequence_Spec &&) = default;
  Sequence_Spec &operator=(Sequence_Spec &&) = default;
};
class Cover_Cross : public Node {
public:
  Cover_Cross(std::string element);
  Cover_Cross(Cover_Cross &&) = default;
  Cover_Cross &operator=(Cover_Cross &&) = default;
};
class Wildcard_Opt : public Node {
public:
  Wildcard_Opt(std::string element);
  Wildcard_Opt(Wildcard_Opt &&) = default;
  Wildcard_Opt &operator=(Wildcard_Opt &&) = default;
};
class Case_Inside_Items : public Node {
public:
  Case_Inside_Items(std::string element);
  Case_Inside_Items(Case_Inside_Items &&) = default;
  Case_Inside_Items &operator=(Case_Inside_Items &&) = default;
};
class Modport_Tf_Port : public Node {
public:
  Modport_Tf_Port(std::string element);
  Modport_Tf_Port(Modport_Tf_Port &&) = default;
  Modport_Tf_Port &operator=(Modport_Tf_Port &&) = default;
};
class Weight_Specification : public Node {
public:
  Weight_Specification(std::string element);
  Weight_Specification(Weight_Specification &&) = default;
  Weight_Specification &operator=(Weight_Specification &&) = default;
};
class Select_Condition : public Node {
public:
  Select_Condition(std::string element);
  Select_Condition(Select_Condition &&) = default;
  Select_Condition &operator=(Select_Condition &&) = default;
};
class Deferred_Immediate_Assertion_Item : public Node {
public:
  Deferred_Immediate_Assertion_Item(std::string element);
  Deferred_Immediate_Assertion_Item(Deferred_Immediate_Assertion_Item &&) =
      default;
  Deferred_Immediate_Assertion_Item &
  operator=(Deferred_Immediate_Assertion_Item &&) = default;
};
class Let_Formal_Type_Followed_By_Id : public Node {
public:
  Let_Formal_Type_Followed_By_Id(std::string element);
  Let_Formal_Type_Followed_By_Id(Let_Formal_Type_Followed_By_Id &&) = default;
  Let_Formal_Type_Followed_By_Id &
  operator=(Let_Formal_Type_Followed_By_Id &&) = default;
};
class Coverage_Bin_Rhs : public Node {
public:
  Coverage_Bin_Rhs(std::string element);
  Coverage_Bin_Rhs(Coverage_Bin_Rhs &&) = default;
  Coverage_Bin_Rhs &operator=(Coverage_Bin_Rhs &&) = default;
};
class Production_Items_List : public Node {
public:
  Production_Items_List(std::string element);
  Production_Items_List(Production_Items_List &&) = default;
  Production_Items_List &operator=(Production_Items_List &&) = default;
};
class Preprocessor_Balanced_Port_Declarations : public Node {
public:
  Preprocessor_Balanced_Port_Declarations(std::string element);
  Preprocessor_Balanced_Port_Declarations(
      Preprocessor_Balanced_Port_Declarations &&) = default;
  Preprocessor_Balanced_Port_Declarations &
  operator=(Preprocessor_Balanced_Port_Declarations &&) = default;
};
class Simple_Type : public Node {
public:
  Simple_Type(std::string element);
  Simple_Type(Simple_Type &&) = default;
  Simple_Type &operator=(Simple_Type &&) = default;
};
class Rs_Production_List : public Node {
public:
  Rs_Production_List(std::string element);
  Rs_Production_List(Rs_Production_List &&) = default;
  Rs_Production_List &operator=(Rs_Production_List &&) = default;
};
class Dpi_Export_Item : public Node {
public:
  Dpi_Export_Item(std::string element);
  Dpi_Export_Item(Dpi_Export_Item &&) = default;
  Dpi_Export_Item &operator=(Dpi_Export_Item &&) = default;
};
class Production : public Node {
public:
  Production(std::string element);
  Production(Production &&) = default;
  Production &operator=(Production &&) = default;
};
class Modport_Clocking_Declaration_Trailing_Comma : public Node {
public:
  Modport_Clocking_Declaration_Trailing_Comma(std::string element);
  Modport_Clocking_Declaration_Trailing_Comma(
      Modport_Clocking_Declaration_Trailing_Comma &&) = default;
  Modport_Clocking_Declaration_Trailing_Comma &
  operator=(Modport_Clocking_Declaration_Trailing_Comma &&) = default;
};
class Let_Port_List_In_Parens_Opt : public Node {
public:
  Let_Port_List_In_Parens_Opt(std::string element);
  Let_Port_List_In_Parens_Opt(Let_Port_List_In_Parens_Opt &&) = default;
  Let_Port_List_In_Parens_Opt &
  operator=(Let_Port_List_In_Parens_Opt &&) = default;
};
class Cross_Body : public Node {
public:
  Cross_Body(std::string element);
  Cross_Body(Cross_Body &&) = default;
  Cross_Body &operator=(Cross_Body &&) = default;
};
class Use_Clause : public Node {
public:
  Use_Clause(std::string element);
  Use_Clause(Use_Clause &&) = default;
  Use_Clause &operator=(Use_Clause &&) = default;
};
class Sequence_Match_Item : public Node {
public:
  Sequence_Match_Item(std::string element);
  Sequence_Match_Item(Sequence_Match_Item &&) = default;
  Sequence_Match_Item &operator=(Sequence_Match_Item &&) = default;
};
class Coverage_Bin : public Node {
public:
  Coverage_Bin(std::string element);
  Coverage_Bin(Coverage_Bin &&) = default;
  Coverage_Bin &operator=(Coverage_Bin &&) = default;
};
class Sequence_Port_Type_Followed_By_Id : public Node {
public:
  Sequence_Port_Type_Followed_By_Id(std::string element);
  Sequence_Port_Type_Followed_By_Id(Sequence_Port_Type_Followed_By_Id &&) =
      default;
  Sequence_Port_Type_Followed_By_Id &
  operator=(Sequence_Port_Type_Followed_By_Id &&) = default;
};
class Interface_Class_Declaration : public Node {
public:
  Interface_Class_Declaration(std::string element);
  Interface_Class_Declaration(Interface_Class_Declaration &&) = default;
  Interface_Class_Declaration &
  operator=(Interface_Class_Declaration &&) = default;
};
class Identifier_List : public Node {
public:
  Identifier_List(std::string element);
  Identifier_List(Identifier_List &&) = default;
  Identifier_List &operator=(Identifier_List &&) = default;
};
class Sequence_Port_Item : public Node {
public:
  Sequence_Port_Item(std::string element);
  Sequence_Port_Item(Sequence_Port_Item &&) = default;
  Sequence_Port_Item &operator=(Sequence_Port_Item &&) = default;
};
class Dist_Item : public Node {
public:
  Dist_Item(std::string element);
  Dist_Item(Dist_Item &&) = default;
  Dist_Item &operator=(Dist_Item &&) = default;
};
class Dist_Weight : public Node {
public:
  Dist_Weight(std::string element);
  Dist_Weight(Dist_Weight &&) = default;
  Dist_Weight &operator=(Dist_Weight &&) = default;
};
class Bins_Keyword : public Node {
public:
  Bins_Keyword(std::string element);
  Bins_Keyword(Bins_Keyword &&) = default;
  Bins_Keyword &operator=(Bins_Keyword &&) = default;
};
class List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi : public Node {
public:
  List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi(
      std::string element);
  List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi(
      List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi &&) = default;
  List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi &operator=(
      List_Of_Ports_Or_Port_Declarations_Preprocessor_Last_Ansi &&) = default;
};
class Implements_Interface_List : public Node {
public:
  Implements_Interface_List(std::string element);
  Implements_Interface_List(Implements_Interface_List &&) = default;
  Implements_Interface_List &operator=(Implements_Interface_List &&) = default;
};
class Let_Port_Item : public Node {
public:
  Let_Port_Item(std::string element);
  Let_Port_Item(Let_Port_Item &&) = default;
  Let_Port_Item &operator=(Let_Port_Item &&) = default;
};
class Array_Method_With_Predicate : public Node {
public:
  Array_Method_With_Predicate(std::string element);
  Array_Method_With_Predicate(Array_Method_With_Predicate &&) = default;
  Array_Method_With_Predicate &
  operator=(Array_Method_With_Predicate &&) = default;
};
class Coverage_Option : public Node {
public:
  Coverage_Option(std::string element);
  Coverage_Option(Coverage_Option &&) = default;
  Coverage_Option &operator=(Coverage_Option &&) = default;
};
class Constraint_Set : public Node {
public:
  Constraint_Set(std::string element);
  Constraint_Set(Constraint_Set &&) = default;
  Constraint_Set &operator=(Constraint_Set &&) = default;
};
class Pattern : public Node {
public:
  Pattern(std::string element);
  Pattern(Pattern &&) = default;
  Pattern &operator=(Pattern &&) = default;
};
class Net_Type_Declaration : public Node {
public:
  Net_Type_Declaration(std::string element);
  Net_Type_Declaration(Net_Type_Declaration &&) = default;
  Net_Type_Declaration &operator=(Net_Type_Declaration &&) = default;
};
class Bins_Selection : public Node {
public:
  Bins_Selection(std::string element);
  Bins_Selection(Bins_Selection &&) = default;
  Bins_Selection &operator=(Bins_Selection &&) = default;
};
class Expression_Or_Dist_List : public Node {
public:
  Expression_Or_Dist_List(std::string element);
  Expression_Or_Dist_List(Expression_Or_Dist_List &&) = default;
  Expression_Or_Dist_List &operator=(Expression_Or_Dist_List &&) = default;
};
class Clocking_Skew : public Node {
public:
  Clocking_Skew(std::string element);
  Clocking_Skew(Clocking_Skew &&) = default;
  Clocking_Skew &operator=(Clocking_Skew &&) = default;
};
class Interface_Class_Item : public Node {
public:
  Interface_Class_Item(std::string element);
  Interface_Class_Item(Interface_Class_Item &&) = default;
  Interface_Class_Item &operator=(Interface_Class_Item &&) = default;
};
class Sequence_Expr_Match_Item_List : public Node {
public:
  Sequence_Expr_Match_Item_List(std::string element);
  Sequence_Expr_Match_Item_List(Sequence_Expr_Match_Item_List &&) = default;
  Sequence_Expr_Match_Item_List &
  operator=(Sequence_Expr_Match_Item_List &&) = default;
};
class Tk_Anglebracketinclude : public Node {
public:
  Tk_Anglebracketinclude(std::string element);
  Tk_Anglebracketinclude(Tk_Anglebracketinclude &&) = default;
  Tk_Anglebracketinclude &operator=(Tk_Anglebracketinclude &&) = default;
};
class Interface_Class_Item_List_Opt : public Node {
public:
  Interface_Class_Item_List_Opt(std::string element);
  Interface_Class_Item_List_Opt(Interface_Class_Item_List_Opt &&) = default;
  Interface_Class_Item_List_Opt &
  operator=(Interface_Class_Item_List_Opt &&) = default;
};
class Import_Export : public Node {
public:
  Import_Export(std::string element);
  Import_Export(Import_Export &&) = default;
  Import_Export &operator=(Import_Export &&) = default;
};
class With_Covergroup_Expression : public Node {
public:
  With_Covergroup_Expression(std::string element);
  With_Covergroup_Expression(With_Covergroup_Expression &&) = default;
  With_Covergroup_Expression &
  operator=(With_Covergroup_Expression &&) = default;
};
class Constraint_Primary_List : public Node {
public:
  Constraint_Primary_List(std::string element);
  Constraint_Primary_List(Constraint_Primary_List &&) = default;
  Constraint_Primary_List &operator=(Constraint_Primary_List &&) = default;
};
class Property_Case_Statement : public Node {
public:
  Property_Case_Statement(std::string element);
  Property_Case_Statement(Property_Case_Statement &&) = default;
  Property_Case_Statement &operator=(Property_Case_Statement &&) = default;
};
class Charge_Strength : public Node {
public:
  Charge_Strength(std::string element);
  Charge_Strength(Charge_Strength &&) = default;
  Charge_Strength &operator=(Charge_Strength &&) = default;
};
class Dpi_Import_Property : public Node {
public:
  Dpi_Import_Property(std::string element);
  Dpi_Import_Property(Dpi_Import_Property &&) = default;
  Dpi_Import_Property &operator=(Dpi_Import_Property &&) = default;
};
class Iff_Expr_Opt : public Node {
public:
  Iff_Expr_Opt(std::string element);
  Iff_Expr_Opt(Iff_Expr_Opt &&) = default;
  Iff_Expr_Opt &operator=(Iff_Expr_Opt &&) = default;
};
class Rs_Rule : public Node {
public:
  Rs_Rule(std::string element);
  Rs_Rule(Rs_Rule &&) = default;
  Rs_Rule &operator=(Rs_Rule &&) = default;
};
class Interface_Class_Method : public Node {
public:
  Interface_Class_Method(std::string element);
  Interface_Class_Method(Interface_Class_Method &&) = default;
  Interface_Class_Method &operator=(Interface_Class_Method &&) = default;
};
class Modport_Simple_Ports_Declaration_Trailing_Comma : public Node {
public:
  Modport_Simple_Ports_Declaration_Trailing_Comma(std::string element);
  Modport_Simple_Ports_Declaration_Trailing_Comma(
      Modport_Simple_Ports_Declaration_Trailing_Comma &&) = default;
  Modport_Simple_Ports_Declaration_Trailing_Comma &
  operator=(Modport_Simple_Ports_Declaration_Trailing_Comma &&) = default;
};
class Case_Inside_Item : public Node {
public:
  Case_Inside_Item(std::string element);
  Case_Inside_Item(Case_Inside_Item &&) = default;
  Case_Inside_Item &operator=(Case_Inside_Item &&) = default;
};
class Restrict_Property_Statement : public Node {
public:
  Restrict_Property_Statement(std::string element);
  Restrict_Property_Statement(Restrict_Property_Statement &&) = default;
  Restrict_Property_Statement &
  operator=(Restrict_Property_Statement &&) = default;
};
class Dist_List : public Node {
public:
  Dist_List(std::string element);
  Dist_List(Dist_List &&) = default;
  Dist_List &operator=(Dist_List &&) = default;
};
class Rs_Prod : public Node {
public:
  Rs_Prod(std::string element);
  Rs_Prod(Rs_Prod &&) = default;
  Rs_Prod &operator=(Rs_Prod &&) = default;
};
class Array_Ordering_Method : public Node {
public:
  Array_Ordering_Method(std::string element);
  Array_Ordering_Method(Array_Ordering_Method &&) = default;
  Array_Ordering_Method &operator=(Array_Ordering_Method &&) = default;
};
class Randsequence_Statement : public Node {
public:
  Randsequence_Statement(std::string element);
  Randsequence_Statement(Randsequence_Statement &&) = default;
  Randsequence_Statement &operator=(Randsequence_Statement &&) = default;
};
class Cross_Body_Item : public Node {
public:
  Cross_Body_Item(std::string element);
  Cross_Body_Item(Cross_Body_Item &&) = default;
  Cross_Body_Item &operator=(Cross_Body_Item &&) = default;
};
class Case_Pattern_Items : public Node {
public:
  Case_Pattern_Items(std::string element);
  Case_Pattern_Items(Case_Pattern_Items &&) = default;
  Case_Pattern_Items &operator=(Case_Pattern_Items &&) = default;
};
class Cross_Body_Item_List_Opt : public Node {
public:
  Cross_Body_Item_List_Opt(std::string element);
  Cross_Body_Item_List_Opt(Cross_Body_Item_List_Opt &&) = default;
  Cross_Body_Item_List_Opt &operator=(Cross_Body_Item_List_Opt &&) = default;
};
class Modport_Ports_Declaration_Trailing_Comma : public Node {
public:
  Modport_Ports_Declaration_Trailing_Comma(std::string element);
  Modport_Ports_Declaration_Trailing_Comma(
      Modport_Ports_Declaration_Trailing_Comma &&) = default;
  Modport_Ports_Declaration_Trailing_Comma &
  operator=(Modport_Ports_Declaration_Trailing_Comma &&) = default;
};
class Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List
    : public Node {
public:
  Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List(
      std::string element);
  Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List(
      Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List &&) =
      default;
  Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List &operator=(
      Set_Covergroup_Expression_Or_Covergroup_Range_List_Or_Trans_List &&) =
      default;
};

using ClassMap =
    std::unordered_map<std::string,
                       std::function<std::unique_ptr<Node>(std::string &&)>>;
extern ClassMap classMap;

#endif
