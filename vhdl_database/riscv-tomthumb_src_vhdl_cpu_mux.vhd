library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package mux_types_pkg is
	type mux_input_t is array(natural range <>) of std_logic_vector;
end package;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.constants.all;
use work.mux_types_pkg.all;

entity mux is
	generic(
		WIDTH: integer := XLEN;
		PORTS: integer := 2
	);

	port(
		I_inputs: in mux_input_t(PORTS-1 downto 0)(WIDTH-1 downto 0);
		I_sel: in integer range 0 to PORTS-1;
		O_output: out std_logic_vector(WIDTH-1 downto 0)
	);
end mux;

architecture Behavioral of mux is
begin
	O_output <= I_inputs(I_sel);
end Behavioral;