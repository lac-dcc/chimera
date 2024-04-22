-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package fp_func is

	function and_reduce(arg: std_logic_vector) return ux01;
	function nand_reduce(arg: std_logic_vector) return ux01;
	function or_reduce(arg: std_logic_vector) return ux01;
	function nor_reduce(arg: std_logic_vector) return ux01;
	function xor_reduce(arg: std_logic_vector) return ux01;
	function xnor_reduce(arg: std_logic_vector) return ux01;

end fp_func;

package body fp_func is

	function and_reduce(arg: std_logic_vector) return ux01 is
		variable result: std_logic;
	begin
		result := '1';
		for i in arg'range loop
			result := result and arg(i);
		end loop;
		return result;
	end;

	function nand_reduce(arg: std_logic_vector) return ux01 is
	begin
		return not and_reduce(arg);
	end;

	function or_reduce(arg: std_logic_vector) return ux01 is
		variable result: std_logic;
	begin
		result := '0';
		for i in arg'range loop
			result := result or arg(i);
		end loop;
		return result;
	end;

	function nor_reduce(arg: std_logic_vector) return ux01 is
	begin
		return not or_reduce(arg);
	end;

	function xor_reduce(arg: std_logic_vector) return ux01 is
		variable result: std_logic;
	begin
		result := '0';
		for i in arg'range loop
			result := result xor arg(i);
		end loop;
		return result;
	end;

	function xnor_reduce(arg: std_logic_vector) return ux01 is
	begin
		return not xor_reduce(arg);
	end;

end fp_func;
