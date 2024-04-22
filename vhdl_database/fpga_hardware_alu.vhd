library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.defines.all;
use work.alu_defines.all;

entity alu is
    Port ( operand_a_in    : in  word_t
         ; operand_b_in    : in  word_t
         ; shamt_in        : in shamt_t
         ; alu_function_in : in  alu_funct_t
         ; result_out      : out word_t
         );
end alu;

architecture Behavioral of alu is
begin

  process (operand_a_in, operand_b_in, alu_function_in, shamt_in)
    variable alu_result : signed (WORD_WIDTH - 1 downto 0);
  begin

    case alu_function_in is
      when ALU_FUNCTION_ADD =>
        alu_result := signed(operand_a_in) + signed(operand_b_in);
      when ALU_FUNCTION_SUBTRACT =>
        alu_result := signed(operand_a_in) - signed(operand_b_in);
      when ALU_FUNCTION_MULTIPLY =>
        alu_result := resize(signed(operand_a_in) * signed(operand_b_in), WORD_WIDTH);
      when ALU_FUNCTION_AND =>
        alu_result := signed(operand_a_in) and signed(operand_b_in);
      when ALU_FUNCTION_OR =>
        alu_result := signed(operand_a_in) or signed(operand_b_in);
      when ALU_FUNCTION_XOR =>
        alu_result := signed(unsigned(operand_a_in) xor unsigned(operand_b_in));
      when ALU_FUNCTION_SLT =>
        if signed(operand_a_in) < signed(operand_b_in) then
          alu_result := x"0001";
        else
          alu_result := x"0000";
        end if;
      when ALU_FUNCTION_EQUAL =>
        if signed(operand_a_in) = signed(operand_b_in) then
          alu_result := x"0001";
        else
          alu_result := x"0000";
        end if;
      when ALU_FUNCTION_SRL =>
        alu_result := signed(shift_right(unsigned(operand_b_in), to_integer(unsigned(shamt_in))));
      when ALU_FUNCTION_SRA =>
        alu_result := signed(shift_right(signed(operand_b_in), to_integer(unsigned(shamt_in))));
      when others => -- ALU_FUNCTION_SLL
        alu_result := signed(shift_left(unsigned(operand_b_in), to_integer(unsigned(shamt_in))));
    end case;

    result_out <= std_logic_vector(alu_result);
  end process;

end Behavioral;

