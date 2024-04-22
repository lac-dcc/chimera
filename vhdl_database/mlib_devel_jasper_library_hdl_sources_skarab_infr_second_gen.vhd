----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: second_gen - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Generates a pulse that toggles once a second. Used for clock frequency 
-- measurement.
--
-- Assumes clock frequency of 39.0625MHz
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity second_gen is
	port(
		clk : in std_logic;
		rst : in std_logic;
        
        second_toggle : out std_logic);
end second_gen;

--}} End of automatically maintained section

architecture arch_second_gen of second_gen is

    constant C_MILLISECOND_PERIOD : std_logic_vector(17 downto 0) := 
        "001001100010010111"; -- 39063
        
    constant C_SECOND_PERIOD : std_logic_vector(9 downto 0) :=
        "1111100111"; -- 999

    signal millisecond_count : std_logic_vector(17 downto 0);
    signal millisecond_count_over : std_logic;
    
    signal second_count : std_logic_vector(9 downto 0);
    signal second_toggle_i : std_logic;
    
begin

    second_toggle <= second_toggle_i;

    gen_millisecond_count : process(rst, clk)
    begin
        if (rst = '1')then
            millisecond_count <= (others => '0');
            millisecond_count_over <= '0';
        elsif (rising_edge(clk))then
            millisecond_count_over <= '0';

            if (millisecond_count = C_MILLISECOND_PERIOD)then
                millisecond_count <= (others => '0');
                millisecond_count_over <= '1';
            else
                millisecond_count <= millisecond_count + "000000000000000001";        
            end if;
        end if;
    end process;

    gen_second_count : process(rst, clk)
    begin
        if (rst = '1')then
            second_count <= (others => '0');
            second_toggle_i <= '0';
        elsif (rising_edge(clk))then
            if (millisecond_count_over = '1')then
                if (second_count = C_SECOND_PERIOD)then
                    second_count <= (others => '0');
                    second_toggle_i <= not second_toggle_i;
                else
                    second_count <= second_count + "0000000001";
                end if;
            end if;
        end if;
    end process;
    
end arch_second_gen;
