----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 18.02.2015 11:51:29
-- Design Name: 
-- Module Name: DUAL_CLOCK_STROBE_GENERATOR - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DUAL_CLOCK_STROBE_GENERATOR is
	Port(
		CLK_SLOW_I : in  STD_LOGIC;
		CLK_FAST_I : in  STD_LOGIC;
		STROBE_O   : out STD_LOGIC
	);
end DUAL_CLOCK_STROBE_GENERATOR;

architecture Behavioral of DUAL_CLOCK_STROBE_GENERATOR is
	signal strobe_flag_slow  : std_logic_vector(1 downto 0) := (others => '0');
	signal strobe_flag_async : std_logic_vector(2 downto 0) := (others => '0');
	signal strobe_flag_fast  : std_logic_vector(5 downto 0) := (others => '0');

	attribute ASYNC_REG : string;
	attribute ASYNC_REG of strobe_flag_async : signal is "true";

	attribute shreg_extract : string;
	attribute shreg_extract of strobe_flag_fast : signal is "no";

begin
	STROBE_proc : process(CLK_SLOW_I) is
	begin
		if rising_edge(CLK_SLOW_I) then
			strobe_flag_slow(0) <= not strobe_flag_slow(0);
			strobe_flag_slow(1) <= strobe_flag_slow(0);
		end if;
	end process STROBE_proc;

	ACKNOWLEDGE_PROC : process(CLK_FAST_I) is
	begin
		if rising_edge(CLK_FAST_I) then
			strobe_flag_async(0)          <= strobe_flag_slow(1);
			strobe_flag_async(2 downto 1) <= strobe_flag_async(1 downto 0);

			strobe_flag_fast(0)          <= strobe_flag_async(2);
			strobe_flag_fast(2 downto 1) <= strobe_flag_fast(1 downto 0);
			if (strobe_flag_fast(2) /= strobe_flag_fast(1)) then
				strobe_flag_fast(3) <= '1';
			else
				strobe_flag_fast(3) <= '0';
			end if;
			strobe_flag_fast(5 downto 4) <= strobe_flag_fast(4 downto 3);

		end if;
	end process ACKNOWLEDGE_PROC;

	STROBE_O <= strobe_flag_fast(5);

end Behavioral;
