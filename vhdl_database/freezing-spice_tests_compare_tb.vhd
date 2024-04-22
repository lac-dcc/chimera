library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

use work.common.all;
use work.id_pkg.all;

entity compare_tb is
end entity compare_tb;

architecture test of compare_tb is
    signal branch_type : branch_type_t;
    signal op1 : word;
    signal op2 : word;
    signal compare_result : std_logic;
begin  -- architecture test

    uut : entity work.compare_unit(behavioral)
        port map (
            branch_type    => branch_type,
            op1            => op1,
            op2            => op2,
            compare_result => compare_result);
    
    process
    begin
        ----------------------------------------------------------------
        -- BEQ
        ----------------------------------------------------------------
        println("BEQ");
        
        branch_type <= BEQ;
        op1 <= "00010001000100010001000100010001";
        op2 <= "00010001000100010001000100010001";
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BEQ" severity error;

        op2 <= "00010001000100010001000100010000";
        wait for 1 ns;
        assert compare_result = '0' report "Invalid BEQ" severity error;

        ----------------------------------------------------------------
        -- BNE
        ----------------------------------------------------------------
        println("BNE");
        
        branch_type <= BNE;
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BNE" severity error;

        op2 <= "00010001000100010001000100010001";
        wait for 1 ns;
        assert compare_result = '0' report "Invalid BNE" severity error;

        ----------------------------------------------------------------
        -- BLT
        ----------------------------------------------------------------
        println("BLT");

        branch_type <= BLT;
        op1 <= "00000000000000000000000000000001";
        op2 <= "00000000000000000000000000000000";
        wait for 1 ns;
        assert compare_result = '0' report "Invalid BLT" severity error;

        op1 <= "00000000000000000000000000000010";
        wait for 1 ns;
        assert compare_result = '0' report "Invalid BLT" severity error;

        op2 <= "01111111111111111111111111111111";
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BLT" severity error;
        
        ----------------------------------------------------------------
        -- BGE
        ----------------------------------------------------------------
        println("BGE");

        branch_type <= BGE;
        wait for 1 ns;
        assert compare_result = '0' report "Invalid BGE" severity error;

        op1 <= "00000000000000000000000000000010";
        op2 <= "00000000000000000000000000000010";
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BGE" severity error;

        op1 <= "11111111111111111111111111111111";
        wait for 1 ns;
        assert compare_result = '0' report "Invalid BGE" severity error;

        op2 <= "11111111111111111111111111111110";
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BGE" severity error;

        ----------------------------------------------------------------
        -- BLTU
        ----------------------------------------------------------------
        println("BLTU");
        
        branch_type <= BLTU;
        wait for 1 ns;
        assert compare_result = '0' report "Invalid BLTU" severity error;

        op1 <= "11111111111111111111111111111100";
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BLTU" severity error;

        op2 <= "11111111111111111111111111111100";
        wait for 1 ns;
        assert compare_result = '0' report "Invalid BLTU" severity error;

        ----------------------------------------------------------------
        -- BGEU
        ----------------------------------------------------------------
        println("BGEU");
        
        branch_type <= BGEU;
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BGEU" severity error;

        op1 <= "00000000000000000000000000000000";
        op2 <= "00000000000000000000000000000000";
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BGEU" severity error;
        
        op1 <= "00000000000000000000000000000001";
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BGEU" severity error;

        op1 <= "11111111111111111111111111111111";
        op2 <= "11111111111111111111111111111110";
        wait for 1 ns;
        assert compare_result = '1' report "Invalid BGEU" severity error;        
        
        ----------------------------------------------------------------
        println("Simulation complete");
        ----------------------------------------------------------------
        
        wait;
        
    end process;

end architecture test;
