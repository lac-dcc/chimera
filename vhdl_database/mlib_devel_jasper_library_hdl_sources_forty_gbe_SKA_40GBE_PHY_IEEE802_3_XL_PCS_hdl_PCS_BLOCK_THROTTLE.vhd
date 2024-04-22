----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 06.08.2014 13:12:28
-- Design Name: 
-- Module Name: PCS_BLOCK_THROTTLE - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.IEEE802_3_XL_PKG.all;

entity PCS_BLOCK_THROTTLE is
	Port(
		CLK_I         : in  std_logic;
		RST_I         : in  std_logic;

		THROTTLE_I    : in  std_logic;

		BLOCK_VALID_I : in  std_logic;
		PCS_BLOCK_I   : in  BLOCK_t;
		BLOCK_VALID_O : out std_logic;
		PCS_BLOCK_O   : out BLOCK_t
	);
end PCS_BLOCK_THROTTLE;

architecture Behavioral of PCS_BLOCK_THROTTLE is
	signal excess_counter_INC_NOT_DEC : boolean := true;
	signal excess_counter_ENABLE      : boolean := true;
	signal excess_counter_RESET       : boolean := true;
	signal excess_counter             : unsigned(4 downto 0); -- := (others => '0');

begin
	DATA_RATE_THROTTLE_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			PCS_BLOCK_O <= PCS_BLOCK_I;

			if RST_I = '1' then
				excess_counter_INC_NOT_DEC <= true;
				excess_counter_ENABLE      <= false;
				excess_counter_RESET       <= true;
				BLOCK_VALID_O              <= '0';
			else
				excess_counter_RESET <= false;
				if (BLOCK_VALID_I = '1') then
					excess_counter_INC_NOT_DEC <= true;
					if (THROTTLE_I = '0') then
						-- DEFAULT STATE
						excess_counter_ENABLE <= false;
					else
						-- THROTTLE with VALID DATA
						excess_counter_ENABLE      <= true;
					end if;
					BLOCK_VALID_O <= '1';
				else
					excess_counter_INC_NOT_DEC <= false;
					if (THROTTLE_I = '1') then
						-- THROTTLE with IDLE DATA
						excess_counter_ENABLE <= false;
						BLOCK_VALID_O         <= '0';
					else
						-- IDLE DATA (CHECK FOR EXCESS)
						if (excess_counter <= 1) then
							excess_counter_ENABLE <= false;
							BLOCK_VALID_O         <= '1';
						else
							excess_counter_ENABLE      <= true;
							BLOCK_VALID_O              <= '0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process DATA_RATE_THROTTLE_PROC;

	UP_DOWN_COUNTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (excess_counter_RESET) then
				excess_counter <= (others => '0');
			else
				if (excess_counter_ENABLE) then
					if (excess_counter_INC_NOT_DEC) then
						excess_counter <= excess_counter + 1;
					else
						excess_counter <= excess_counter - 1;
					end if;
				end if;
			end if;
		end if;
	end process UP_DOWN_COUNTER_proc;

end Behavioral;
