library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Common.all;

entity ALU is
  port (
    -- Interface --
    aluop: in  AluOpType;
    operand1: in Int32;
    operand2: in Int32;
    result: out Int32;
    result_ext: out Int32
  );
end ALU;

architecture Behavioral of ALU is
begin
  process(aluop, operand1, operand2)
    variable op1_s, op2_s   : Signed32;
    variable op1_us, op2_us : Unsigned32;
    variable sham           : integer;
    variable mul_result     : signed(63 downto 0);
    variable mulu_result    : unsigned(63 downto 0);
  begin
    op1_s  := signed(operand1);
    op2_s  := signed(operand2);
    op1_us := unsigned(operand1);
    op2_us := unsigned(operand2);
    sham   := to_integer(op1_us(4 downto 0));

    case aluop is
      -- logical
      when ALU_AND =>
        result <= operand1 and operand2;
      when ALU_OR =>
        result <= operand1 or operand2;
      when ALU_XOR =>
        result <= operand1 xor operand2;
      when ALU_NOR =>
        result <= operand1 nor operand2;

        -- arithmetic
      when ALU_ADD =>                   -- plus
        result <= std_logic_vector(op1_us + op2_us);
      when ALU_SUB =>                   -- minus
        result <= std_logic_vector(op1_us - op2_us);
      when ALU_MUL =>
        mul_result := op1_s * op2_s;
        result <= std_logic_vector(mul_result(31 downto 0));
        result_ext <= std_logic_vector(mul_result(63 downto 32));
      when ALU_MULU =>
        mulu_result := op1_us * op2_us;
        result <= std_logic_vector(mulu_result(31 downto 0));
        result_ext <= std_logic_vector(mulu_result(63 downto 32));

        -- shift
      when ALU_SRL =>                   -- shift right logic
        result <= std_logic_vector(shift_right(op2_us, sham));
      when ALU_SRA =>                   -- shift right arithmetic
        result <= std_logic_vector(shift_right(op2_s, sham));
      when ALU_SLL =>                   -- shift left logic
        result <= std_logic_vector(shift_left(op2_us, sham));

        -- compare
      when ALU_EQ =>                    -- equal
        result <= Int31_Zero & boolean_to_std_logic(operand1 = operand2);
      when ALU_NE =>                   -- not equal
        result <= Int31_Zero & boolean_to_std_logic(operand1 /= operand2);
      when ALU_LTU =>                   -- less than (unsigned)
        result <= Int31_Zero & boolean_to_std_logic(op1_us < op2_us);
      when ALU_LT =>                    -- less than (signed)
        result <= Int31_Zero & boolean_to_std_logic(op1_s < op2_s);
      when ALU_GTZ =>                   -- greater than zero
        result <= Int31_Zero & boolean_to_std_logic(op1_s > signed(Int32_Zero));
      when ALU_LEZ =>                   -- less than or equal to zero
        result <= Int31_Zero & boolean_to_std_logic(op1_s <= signed(Int32_Zero));
      when ALU_GEZ =>                   -- greater than or equal to zero
        result <= Int31_Zero & boolean_to_std_logic(op1_s >= signed(Int32_Zero));
        
      when ALU_NOP =>
        -- do nothing
        result <= Int32_Zero;

        -- not needed now      
        --when ALU_NOT =>
        --  result <= not operand1;
        --when ALU_GTU =>                   -- greater than (unsigned)
        --  result <= Int31_Zero & boolean_to_std_logic(op1_us > op2_us);
        --when ALU_GT =>                    -- greater than (signed)
        --  result <= Int31_Zero & boolean_to_std_logic(op1_s > op2_s);
        --when ALU_LEU =>                   -- less than or equal (unsigned)
        --  result <= Int31_Zero & boolean_to_std_logic(op1_us <= op2_us);
        --when ALU_LE =>                    -- less than or equal (signed)
        --  result <= Int31_Zero & boolean_to_std_logic(op1_s <= op2_s);
        --when ALU_GEU =>                   -- greater than or equal (unsigned)
        --  result <= Int31_Zero & boolean_to_std_logic(op1_us >= op2_us);
        --when ALU_GE =>                    -- greater than or equal (signed)
        --  result <= Int31_Zero & boolean_to_std_logic(op1_s >= op2_s);
    end case;
  end process;
end Behavioral;
