-------------------------------------------------------------------------------
-- Title      : MC613
-- Project    : PS2 Basic Protocol
-- Details    : www.ic.unicamp.br/~corte/mc613/
--							www.computer-engineering.org/ps2protocol/
-------------------------------------------------------------------------------
-- File       : ps2_base.vhd
-- Author     : Thiago Borges Abdnur
-- Company    : IC - UNICAMP
-- Last update: 2010/04/12
-------------------------------------------------------------------------------
-- Description: 
-- PS2 basic control
-------------------------------------------------------------------------------

-- FOR SIMULATION ONLY!!!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ps2_iobase is
	port(
		enable_i		: in    std_logic;
		clock_i			: in    std_logic;
		reset_i			: in    std_logic;
		ps2_data_io		: inout std_logic;
		ps2_clk_io		: inout std_logic;
		data_rdy_i		: in    std_logic;
		data_i			: in    std_logic_vector(7 downto 0);
		send_rdy_o		: out   std_logic;
		data_rdy_o		: out   std_logic;
		data_o			: out   std_logic_vector(7 downto 0)
	);
end;

architecture rtl of ps2_iobase is

	procedure keyp (
		scancode_i			: in  std_logic_vector(7 downto 0);
		signal data_o		: out std_logic_vector(7 downto 0);
		signal data_rdy_o	: out std_logic
	) is
	begin
		data_o		<= scancode_i;
		data_rdy_o	<= '1';
		wait until( rising_edge(clock_i) );
		data_rdy_o	<= '0';
		--
		for i in 0 to 10 loop
			wait until( rising_edge(clock_i) );
		end loop;
	end procedure;

begin

	process
	begin
		data_o		<= X"00";
		data_rdy_o	<= '0';
		wait until (reset_i = '0');
		for i in 0 to 10 loop
			wait until( rising_edge(clock_i) );
		end loop;

		keyp(X"12", data_o, data_rdy_o);		-- SHIFT

		keyp(X"52", data_o, data_rdy_o);		-- ^ ~

		keyp(X"F0", data_o, data_rdy_o);		-- BREAK
		keyp(X"52", data_o, data_rdy_o);		-- ^ ~

		keyp(X"F0", data_o, data_rdy_o);		-- BREAK
		keyp(X"12", data_o, data_rdy_o);		-- SHIFT

		wait;

	end process;

end rtl;