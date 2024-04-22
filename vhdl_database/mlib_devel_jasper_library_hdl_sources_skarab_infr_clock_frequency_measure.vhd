----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: clock_frequency_measure - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Measures the frequency of an input signal.
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

entity clock_frequency_measure is
	port(
		clk : in std_logic;
		rst : in std_logic;
        
        second_toggle   : in std_logic;
        measure_freq    : out std_logic_vector(31 downto 0));
end clock_frequency_measure;

--}} End of automatically maintained section

architecture arch_clock_frequency_measure of clock_frequency_measure is

    signal second_toggle_z : std_logic;
    signal second_toggle_z2 : std_logic;
    signal second_toggle_z3 : std_logic;
    signal second_toggle_z4 : std_logic;
    
    signal clk_count_low : std_logic_vector(15 downto 0);
    signal clk_count_low_reg : std_logic_vector(15 downto 0);
    signal clk_count_low_over : std_logic;
    signal clk_count_high : std_logic_vector(15 downto 0);
    signal clk_count_high_reg : std_logic_vector(15 downto 0);
    
begin

    gen_second_toggle_z : process(rst, clk)
    begin
        if (rst = '1')then
            second_toggle_z <= '0';
            second_toggle_z2 <= '0';
            second_toggle_z3 <= '0';
            second_toggle_z4 <= '0';
        elsif (rising_edge(clk))then
            second_toggle_z <= second_toggle;
            second_toggle_z2 <= second_toggle_z;
            second_toggle_z3 <= second_toggle_z2;
            second_toggle_z4 <= second_toggle_z3;
        end if;
    end process;

    gen_clk_count_low : process(rst, clk)
    begin
        if (rst = '1')then
            clk_count_low <= (others => '0');
            clk_count_low_over <= '0';
        elsif (rising_edge(clk))then
            clk_count_low_over <= '0';
            if (second_toggle_z4 = second_toggle_z3)then
                if (clk_count_low = "1111111111111111")then
                    clk_count_low <= (others => '0');
                    clk_count_low_over <= '1';
                else
                    clk_count_low <= clk_count_low + "0000000000000001";
                end if;
            else									 
                clk_count_low_reg <= clk_count_low;
                clk_count_low <= (others => '0');
            end if;
        end if;
    end process;  
	
    gen_clk_count_high : process(rst, clk)
    begin	  
        if (rst = '1')then
            clk_count_high <= (others => '0');
        elsif (rising_edge(clk))then
            if (second_toggle_z4 = second_toggle_z3)then
                if (clk_count_low_over = '1')then
                    clk_count_high <= clk_count_high + "0000000000000001";
                end if;
            else
                clk_count_high_reg <= clk_count_high;
                clk_count_high <= (others => '0');
            end if;
        end if;
    end process;
    
    measure_freq <= clk_count_high_reg & clk_count_low_reg;
    
end arch_clock_frequency_measure;
