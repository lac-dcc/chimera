-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2010 by Peter Wendrich (pwsoft@syntiac.com)
-- All Rights Reserved.
--
-- http://www.syntiac.com/chameleon.html
-- -----------------------------------------------------------------------
--
-- Joystick autofire logic
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_autofire is
	generic (
		autofire_period : integer := 75000
	);
	port (
		clk : in std_logic;
		ena_1mhz : in std_logic;

		button_n : in std_logic;
		autofire_n : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_autofire is
	signal counter : integer range 0 to autofire_period;
	signal autofire_reg : std_logic := '1';
begin
	autofire_n <= autofire_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			if button_n = '1' then
				counter <= 0;
				autofire_reg <= '1';
			elsif counter = 0 then
				counter <= autofire_period;
				autofire_reg <= not autofire_reg;
			elsif ena_1mhz = '1' then
				counter <= counter - 1;
			end if;
		end if;
	end process;
end architecture;

