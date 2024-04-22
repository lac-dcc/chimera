-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lzc_wire.all;
use work.fp_wire.all;

entity fp_max is
	port(
		fp_max_i : in  fp_max_in_type;
		fp_max_o : out fp_max_out_type
	);
end fp_max;

architecture behavior of fp_max is

begin

	process(fp_max_i)
		variable data1  : std_logic_vector(63 downto 0);
		variable data2  : std_logic_vector(63 downto 0);
		variable ext1   : std_logic_vector(64 downto 0);
		variable ext2   : std_logic_vector(64 downto 0);
		variable fmt    : std_logic_vector(1 downto 0);
		variable rm     : std_logic_vector(2 downto 0);
		variable class1 : std_logic_vector(9 downto 0);
		variable class2 : std_logic_vector(9 downto 0);

		variable nan  : std_logic_vector(63 downto 0);
		variable comp : std_logic;

		variable result : std_logic_vector(63 downto 0);
		variable flags  : std_logic_vector(4 downto 0);

	begin
		data1 := fp_max_i.data1;
		data2 := fp_max_i.data2;
		ext1 := fp_max_i.ext1;
		ext2 := fp_max_i.ext2;
		fmt := fp_max_i.fmt;
		rm := fp_max_i.rm;
		class1 := fp_max_i.class1;
		class2 := fp_max_i.class2;

		nan := X"7FF8000000000000";
		comp := '0';

		result := (others => '0');
		flags := (others => '0');

		if fmt = "00" then
			nan := X"000000007FC00000";
		end if;

		if rm = "000" or rm = "001" then
			comp := to_std_logic(unsigned(ext1(63 downto 0)) > unsigned(ext2(63 downto 0)));
		end if;

		if rm = "000" then

			if (class1(8) and class2(8)) = '1' then
				result := nan;
				flags(4) := '1';
			elsif class1(8) = '1' then
				result := data2;
				flags(4) := '1';
			elsif class2(8) = '1' then
				result := data1;
				flags(4) := '1';
			elsif (class1(9) and class2(9)) = '1' then
				result := nan;
			elsif class1(9) = '1' then
				result := data2;
			elsif class2(9) = '1' then
				result := data1;
			elsif (ext1(64) xor ext2(64)) = '1' then
				if ext1(64) = '1' then
					result := data1;
				else
					result := data2;
				end if;
			else
				if ext1(64) = '1' then
					if comp = '1' then
						result := data1;
					else
						result := data2;
					end if;
				else
					if comp = '1' then
						result := data2;
					else
						result := data1;
					end if;
				end if;
			end if;

		elsif rm = "001" then

			if (class1(8) and class2(8)) = '1' then
				result := nan;
				flags(4) := '1';
			elsif class1(8) = '1' then
				result := data2;
				flags(4) := '1';
			elsif class2(8) = '1' then
				result := data1;
				flags(4) := '1';
			elsif (class1(9) and class2(9)) = '1' then
				result := nan;
			elsif class1(9) = '1' then
				result := data2;
			elsif class2(9) = '1' then
				result := data1;
			elsif (ext1(64) xor ext2(64)) = '1' then
				if ext1(64) = '1' then
					result := data2;
				else
					result := data1;
				end if;
			else
				if ext1(64) = '1' then
					if comp = '1' then
						result := data2;
					else
						result := data1;
					end if;
				else
					if comp = '1' then
						result := data1;
					else
						result := data2;
					end if;
				end if;
			end if;

		end if;

		fp_max_o.result <= result;
		fp_max_o.flags <= flags;

	end process;

end behavior;
