library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

entity alu is
    port (alu_func : in  alu_func_t;
          op1      : in  word;
          op2      : in  word;
          result   : out word);
end entity alu;

architecture behavioral of alu is

begin  -- architecture behavioral

    -- purpose: arithmetic and logic
    -- type   : combinational
    -- inputs : alu_func, op1, op2
    -- outputs: result
    alu_proc : process (alu_func, op1, op2) is
        variable so1, so2 : signed(31 downto 0);
        variable uo1, uo2 : unsigned(31 downto 0);
    begin  -- process alu_proc
        so1 := signed(op1);
        so2 := signed(op2);
        uo1 := unsigned(op1);
        uo2 := unsigned(op2);
        
        case (alu_func) is
            when ALU_ADD  => result <= std_logic_vector(so1 + so2);
            when ALU_ADDU => result <= std_logic_vector(uo1 + uo2);
            when ALU_SUB  => result <= std_logic_vector(so1 - so2);
            when ALU_SUBU => result <= std_logic_vector(uo1 - uo2);
            when ALU_SLT =>
                if so1 < so2 then
                    result <= "00000000000000000000000000000001";
                else
                    result <= (others => '0');
                end if;
            when ALU_SLTU =>
                if uo1 < uo2 then
                    result <= "00000000000000000000000000000001";
                else
                    result <= (others => '0');
                end if;

            when ALU_AND => result <= op1 and op2;
            when ALU_OR  => result <= op1 or op2;
            when ALU_XOR => result <= op1 xor op2;
            when ALU_SLL => result <= std_logic_vector(shift_left(uo1, to_integer(uo2(4 downto 0))));
            when ALU_SRA => result <= std_logic_vector(shift_right(so1, to_integer(uo2(4 downto 0))));
            when ALU_SRL => result <= std_logic_vector(shift_right(uo1, to_integer(uo2(4 downto 0))));
            when others  => result <= op1;
        end case;
    end process alu_proc;

end architecture behavioral;
