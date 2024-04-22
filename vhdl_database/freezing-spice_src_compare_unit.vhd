library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;
use work.id_pkg.all;

entity compare_unit is
    port (
        branch_type    : in  branch_type_t;
        op1            : in  word;
        op2            : in  word;
        compare_result : out std_logic);
end entity compare_unit;

architecture behavioral of compare_unit is
    signal compare : std_logic;
begin  -- architecture behavioral

    -- assign output
    compare_result <= compare;
    
    -- purpose: compares two numbers according to branch_type
    -- type   : combinational
    -- inputs : branch_type, op1, op2
    -- outputs: compare_result
    compare_proc: process (branch_type, op1, op2) is
        variable ou1, ou2 : unsigned(31 downto 0);
        variable os1, os2 : signed(31 downto 0);
    begin  -- process compare_proc
        ou1 := unsigned(op1);
        os1 := signed(op1);

        ou2 := unsigned(op2);
        os2 := signed(op2);

        compare <= '0';
        
        case (branch_type) is
            when BEQ =>
                if op1 = op2 then
                    compare <= '1';
                else
                    compare <= '0';
                end if;

            when BNE =>
                if op1 /= op2 then
                    compare <= '1';
                else
                    compare <= '0';
                end if;

            when BLT =>
                if os1 < os2 then
                    compare <= '1';
                else
                    compare <= '0';
                end if;

            when BGE =>
                if os1 >= os2 then
                    compare <= '1';
                else
                    compare <= '0';
                end if;

            when BLTU =>
                if ou1 < ou2 then
                    compare <= '1';
                else
                    compare <= '0';
                end if;

            when BGEU =>
                if ou1 >= ou2 then
                    compare <= '1';
                else
                    compare <= '0';
                end if;
                
            when others => compare <= '0';
        end case;
    end process compare_proc;

end architecture behavioral;
