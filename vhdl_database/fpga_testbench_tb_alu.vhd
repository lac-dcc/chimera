LIBRARY ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.defines.all;
use work.alu_defines.all;
use work.test_utils.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tb_alu IS
  END tb_alu; 
ARCHITECTURE behavior OF tb_alu IS

  --Inputs
  signal operand_a_in : word_t := (others => '0');
  signal operand_b_in : word_t := (others => '0');
  signal shamt_in : shamt_t := (others => '0');
  signal alu_function_in : alu_funct_t := (others => '0');

  --Outputs
  signal result_out : word_t;

  constant clock_period : time := 10 ns;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut: entity work.alu PORT MAP (
                      operand_a_in => operand_a_in,
                      operand_b_in => operand_b_in,
                      shamt_in => shamt_in,
                      alu_function_in => alu_function_in,
                      result_out => result_out
                    );

  -- Stimulus process
  stim_proc: process
    procedure test_op(
                       alu_function: in alu_funct_t;
                       operand_a: word_t;
                       operand_b: word_t;
                       shamt: in integer;
                       expected_result: in word_t;
                       message: in string) is
    begin
      operand_a_in <= operand_a;
      operand_b_in <= operand_b;
      shamt_in <= std_logic_vector(to_signed(shamt, ALU_SHAMT_WIDTH));
      alu_function_in <= alu_function;
      wait for clock_period/2;
      assert_equals(expected_result, result_out, message);
    end test_op;

    procedure test_op(
                       alu_function: in alu_funct_t;
                       operand_a: integer;
                       operand_b: integer;
                       shamt: in integer;
                       expected_result: in integer;
                       message: in string) is
    begin
      test_op( alu_function,
               std_logic_vector(to_signed(operand_a, WORD_WIDTH)),
               std_logic_vector(to_signed(operand_b, WORD_WIDTH)),
               shamt,
               std_logic_vector(to_signed(expected_result, WORD_WIDTH)),
               message );
    end test_op;

    constant max_int : integer := 32767;
    constant min_int : integer := -32768;
  begin
    wait for 100 ns;

    report "Testing add";
    test_op(ALU_FUNCTION_ADD, 0, 0, 0, 0, "0+0 should be 0");
    test_op(ALU_FUNCTION_ADD, 30, 20, 10, 50, "SHAMT should be ignored for adds");

    test_op(ALU_FUNCTION_ADD, 0, 0, 0, 0, "Test add");
    test_op(ALU_FUNCTION_ADD, 1, 0, 0, 1, "Test add");
    test_op(ALU_FUNCTION_ADD, 0, 1, 0, 1, "Test add");
    test_op(ALU_FUNCTION_ADD, 1, 1, 0, 2, "Test add");
    test_op(ALU_FUNCTION_ADD, 314, 1337, 0, 1651, "Test add");
    test_op(ALU_FUNCTION_ADD, -1, 0, 0, -1, "Test add");
    test_op(ALU_FUNCTION_ADD, 0, -3487, 0, -3487, "Test add");
    test_op(ALU_FUNCTION_ADD, 5342, -5342, 0, 0, "Test add");
    test_op(ALU_FUNCTION_ADD, -314, -1337, 0, -1651, "Test add");

    test_op(ALU_FUNCTION_ADD, max_int, 1, 0, min_int, "Test wraparound");

    report "Testing subtraction";
    test_op(ALU_FUNCTION_SUBTRACT, 0, 0, 0, 0, "Test sub");
    test_op(ALU_FUNCTION_SUBTRACT, 2, 3, 0, -1, "Test sub");
    test_op(ALU_FUNCTION_SUBTRACT, 5, 8, 0, -3, "Test sub");
    test_op(ALU_FUNCTION_SUBTRACT, 5, 5, 0, 0, "Test sub");
    test_op(ALU_FUNCTION_SUBTRACT, max_int, max_int, 0, 0, "Test sub");

    report "Testing shift instructions";
    test_op(ALU_FUNCTION_SLL, 0, 8, 1, 16, "SLL 1 should equal *2");
    test_op(ALU_FUNCTION_SRL, 0, 8, 1, 4, "SRL 1 should fill top bit with zero");
    test_op(ALU_FUNCTION_SRL, 0, -32768, 1, 16384, "SRL 1 should fill top bit with zero");

    test_op(ALU_FUNCTION_SRA, x"0000", x"6000", 1, x"3000", "SRA should keep sign bit, divide towards zero");
    test_op(ALU_FUNCTION_SRA, x"0000", x"e000", 1, x"f000", "SRA should keep sign bit, divide towards zero");

    test_op(ALU_FUNCTION_SLT, 16, 20, 0, 1, "SLT should set 1 when less than");
    test_op(ALU_FUNCTION_SLT, 16, -20, 0, 0, "SLT should set 0 when greater than");
    test_op(ALU_FUNCTION_SLT, 16, 16, 0, 0, "SLT should set 0 when equal");

    report "Testing bitwise instructions";
    test_op(ALU_FUNCTION_AND, "0000111100000000", "0000100100000000", 0, "0000100100000000", "Test ANDing");
    test_op(ALU_FUNCTION_AND, "0000000000000000", "1111111111111111", 0, "0000000000000000", "Test ANDing");

    test_op(ALU_FUNCTION_OR, "0000000000000000", "1111111111111111", 0, "1111111111111111", "Test ORing");
    test_op(ALU_FUNCTION_OR, "1100000000000011", "0000001111000000", 0, "1100001111000011", "Test ORing");

    test_op(ALU_FUNCTION_XOR, "1111000000000000", "0000000011110000", 0, "1111000011110000", "Test XORing");
    test_op(ALU_FUNCTION_XOR, "0000000000011111", "0000000000011111", 0, "0000000000000000", "Test XORing");

    report "Testing completed";

    wait;
  end process;

END;
