-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lzc_wire.all;
use work.fp_wire.all;

entity fp_cmp is
	port(
		fp_cmp_i : in  fp_cmp_in_type;
		fp_cmp_o : out fp_cmp_out_type
	);
end fp_cmp;

architecture behavior of fp_cmp is

begin

	process(fp_cmp_i)
		variable data1  : std_logic_vector(64 downto 0);
		variable data2  : std_logic_vector(64 downto 0);
		variable rm     : std_logic_vector(2 downto 0);
		variable class1 : std_logic_vector(9 downto 0);
		variable class2 : std_logic_vector(9 downto 0);

		variable cmp_lt : std_logic;
		variable cmp_le : std_logic;

		variable result : std_logic_vector(63 downto 0);
		variable flags  : std_logic_vector(4 downto 0);

	begin
		data1 := fp_cmp_i.data1;
		data2 := fp_cmp_i.data2;
		rm := fp_cmp_i.rm;
		class1 := fp_cmp_i.class1;
		class2 := fp_cmp_i.class2;

		cmp_lt := '0';
		cmp_le := '0';

		result := (others => '0');
		flags := (others => '0');

		if rm = "000" or rm = "001" or rm = "010" then
			cmp_lt := to_std_logic(unsigned(data1(63 downto 0)) < unsigned(data2(63 downto 0)));
			cmp_le := to_std_logic(unsigned(data1(63 downto 0)) <= unsigned(data2(63 downto 0)));
		end if;

		--FEQ
		if rm = "010" then

			if (class1(8) or class2(8)) = '1' then
				flags(4) := '1';
			elsif (class1(9) or class2(9)) = '1' then
				flags(4) := '0';
			elsif ((class1(3) or class1(4)) and (class2(3) or class2(4))) = '1' then
				result(0) := '1';
			elsif data1 = data2 then
				result(0) := '1';
			end if;

		--FLT
		elsif rm = "001" then

			if (class1(8) or class2(8) or class1(9) or class2(9)) = '1' then
				flags(4) := '1';
			elsif ((class1(3) or class1(4)) and (class2(3) or class2(4))) = '1' then
				result(0) := '0';
			elsif (data1(64) xor data2(64)) = '1' then
				result(0) := data1(64);
			else
				if data1(64) = '1' then
					result(0) := not cmp_le;
				else
					result(0) := cmp_lt;
				end if;
			end if;

		--FLE
		elsif rm = "000" then

			if (class1(8) or class2(8) or class1(9) or class2(9)) = '1' then
				flags(4) := '1';
			elsif ((class1(3) or class1(4)) and (class2(3) or class2(4))) = '1' then
				result(0) := '1';
			elsif (data1(64) xor data2(64)) = '1' then
				result(0) := data1(64);
			else
				if data1(64) = '1' then
					result(0) := not cmp_lt;
				else
					result(0) := cmp_le;
				end if;
			end if;

		end if;

		fp_cmp_o.result <= result;
		fp_cmp_o.flags <= flags;

	end process;

end behavior;
