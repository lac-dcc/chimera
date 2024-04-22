-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lzc_wire.all;
use work.fp_wire.all;

entity fp_sgnj is
	port(
		fp_sgnj_i : in  fp_sgnj_in_type;
		fp_sgnj_o : out fp_sgnj_out_type
	);
end fp_sgnj;

architecture behavior of fp_sgnj is

begin

	process(fp_sgnj_i)
		variable data1 : std_logic_vector(63 downto 0);
		variable data2 : std_logic_vector(63 downto 0);
		variable fmt   : std_logic_vector(1 downto 0);
		variable rm    : std_logic_vector(2 downto 0);

		variable result : std_logic_vector(63 downto 0);

	begin
		data1 := fp_sgnj_i.data1;
		data2 := fp_sgnj_i.data2;
		fmt := fp_sgnj_i.fmt;
		rm := fp_sgnj_i.rm;

		result := (others => '0');

		if fmt = "00" then

			result(30 downto 0) := data1(30 downto 0);
			if rm = "000" then
				result(31) := data2(31);
			elsif rm = "001" then
				result(31) := not data2(31);
			elsif rm = "010" then
				result(31) := data1(31) xor data2(31);
			end if;

		elsif fmt = "01" then

			result(62 downto 0) := data1(62 downto 0);
			if rm = "000" then
				result(63) := data2(63);
			elsif rm = "001" then
				result(63) := not data2(63);
			elsif rm = "010" then
				result(63) := data1(63) xor data2(63);
			end if;

		end if;

		fp_sgnj_o.result <= result;

	end process;

end behavior;
