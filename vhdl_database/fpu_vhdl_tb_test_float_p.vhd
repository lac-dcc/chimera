-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.lzc_wire.all;
use work.fp_wire.all;
use work.all;

library std;
use std.textio.all;
use std.env.all;

entity test_float_p is
end entity test_float_p;

architecture behavior of test_float_p is

	component fp_unit
		port(
			reset     : in  std_logic;
			clock     : in  std_logic;
			fp_unit_i : in  fp_unit_in_type;
			fp_unit_o : out fp_unit_out_type
		);
	end component;

	type fpu_test_reg_type is record
		data1       : std_logic_vector(63 downto 0);
		data2       : std_logic_vector(63 downto 0);
		data3       : std_logic_vector(63 downto 0);
		result      : std_logic_vector(63 downto 0);
		flags       : std_logic_vector(4 downto 0);
		fmt         : std_logic_vector(1 downto 0);
		rm          : std_logic_vector(2 downto 0);
		op          : fp_operation_type;
		enable      : std_logic;
		result_orig : std_logic_vector(63 downto 0);
		result_calc : std_logic_vector(63 downto 0);
		result_diff : std_logic_vector(63 downto 0);
		flags_orig  : std_logic_vector(4 downto 0);
		flags_calc  : std_logic_vector(4 downto 0);
		flags_diff  : std_logic_vector(4 downto 0);
		ready_calc  : std_logic;
		terminate   : std_logic;
		load        : std_logic;
		i           : integer;
		j           : integer;
	end record;

	constant init_fpu_test_reg : fpu_test_reg_type := (
		data1       => (others => '0'),
		data2       => (others => '0'),
		data3       => (others => '0'),
		result      => (others => '0'),
		flags       => (others => '0'),
		fmt         => (others => '0'),
		rm          => (others => '0'),
		op          => init_fp_operation,
		enable      => '0',
		result_orig => (others => '0'),
		result_calc => (others => '0'),
		result_diff => (others => '0'),
		flags_orig  => (others => '0'),
		flags_calc  => (others => '0'),
		flags_diff  => (others => '0'),
		ready_calc  => '0',
		terminate   => '0',
		load        => '0',
		i           => 0,
		j           => 0
	);

	signal reset : std_logic := '0';
	signal clock : std_logic := '0';

	signal r_1 : fpu_test_reg_type;
	signal r_2 : fpu_test_reg_type;
	signal r_3 : fpu_test_reg_type;

	signal fpu_i : fp_unit_in_type;
	signal fpu_o : fp_unit_out_type;

	type fmt_type is array (0 to 7) of std_logic_vector(1 downto 0);

	type mode_type is array (0 to 4) of string(1 to 3);
	type rnd_type is array (0 to 4) of std_logic_vector(2 downto 0);

	signal fmt : fmt_type := ("00","00","00","00","01","01","01","01");

	signal mode : mode_type := ("rne","rtz","rdn","rup","rmm");
	signal rm : rnd_type := ("000","001","010","011","100");

	function operation(
		index : in integer) return string is
	begin
			case index is
					when 0 => return("f32_mulAdd");
					when 1 => return("f32_add");
					when 2 => return("f32_sub");
					when 3 => return("f32_mul");
					when 4 => return("f64_mulAdd");
					when 5 => return("f64_add");
					when 6 => return("f64_sub");
					when 7 => return("f64_mul");
					when others => return("");
			end case;
	end function operation;

	procedure print(
		msg : in string) is
		variable buf : line;
	begin
		write(buf, msg);
		writeline(output, buf);
	end procedure print;

	function read(
		a : in string) return std_logic_vector is
		variable ret : std_logic_vector(a'length*4-1 downto 0);
		variable val : std_logic_vector(7 downto 0);
	begin
			for i in a'range loop
					if (character'pos(a(i)) >= 48 and character'pos(a(i)) <= 57) then
						val := std_logic_vector(to_unsigned(character'pos(a(i)), 8)-48);
					elsif (character'pos(a(i)) >= 65 and character'pos(a(i)) <= 70) then
						val := std_logic_vector(to_unsigned(character'pos(a(i)), 8)-55);
					else
						val := (others => '0');
					end if;
					ret((a'length-i)*4+3 downto (a'length-i)*4) := val(3 downto 0);
			end loop;
			return ret;
	end function read;

begin

	reset <= '1' after 10 ps;
	clock <= not clock after 1 ps;

	fp_unit_comp : fp_unit
		port map(
			reset     => reset,
			clock     => clock,
			fp_unit_i => fpu_i,
			fp_unit_o => fpu_o
		);

	process(clock)
		file infile     : text;
  	variable status : file_open_status;
		variable inline : line;

		variable data1  : string(1 to 16) := "0000000000000000";
		variable data2  : string(1 to 16) := "0000000000000000";
		variable data3  : string(1 to 16) := "0000000000000000";
		variable result : string(1 to 16) := "0000000000000000";
		variable flags  : string(1 to 2) := "00";

		variable initial : fpu_test_reg_type;
		variable final   : fpu_test_reg_type;

	begin
		if rising_edge(clock) then

			if reset = '0' then

				initial := init_fpu_test_reg;

				r_1 <= init_fpu_test_reg;
				r_2 <= init_fpu_test_reg;
				r_3 <= init_fpu_test_reg;

			else

				initial := init_fpu_test_reg;

				initial.load := r_1.load;
				initial.i := r_1.i;
				initial.j := r_1.j;

				if initial.load = '0' then
					file_open(status, infile, (operation(initial.i) & '_' & mode(initial.j) & ".hex"),  read_mode);
					if status /= open_ok then
						print(operation(initial.i) & '_' & mode(initial.j) & ".hex" & " is not available!");
						finish;
					end if;
					initial.load := '1';
				end if;

				if endfile(infile) then
					initial.terminate := '1';
					initial.enable := '0';
					data1 := "0000000000000000";
					data2 := "0000000000000000";
					data3 := "0000000000000000";
					result := "0000000000000000";
					flags := "00";
				else
					initial.terminate := '0';
					initial.enable := '1';
					readline(infile, inline);
					if operation(initial.i) = "f32_mulAdd" then
						data1 := "00000000" & inline.all(1 to 8);
						data2 := "00000000" & inline.all(10 to 17);
						data3 := "00000000" & inline.all(19 to 26);
						result := "00000000" & inline.all(28 to 35);
						flags := inline.all(37 to 38);
					elsif operation(initial.i) = "f64_mulAdd" then
						data1 := inline.all(1 to 16);
						data2 := inline.all(18 to 33);
						data3 := inline.all(35 to 50);
						result := inline.all(52 to 67);
						flags := inline.all(69 to 70);
					else
						if fmt(initial.i) = "00" then
							data1 := "00000000" & inline.all(1 to 8);
							data2 := "00000000" & inline.all(10 to 17);
							data3 := "0000000000000000";
							result := "00000000" & inline.all(19 to 26);
							flags := inline.all(28 to 29);
						else
							data1 := inline.all(1 to 16);
							data2 := inline.all(18 to 33);
							data3 := "0000000000000000";
							result := inline.all(35 to 50);
							flags := inline.all(52 to 53);
						end if;
					end if;
				end if;

				if (initial.terminate = '1') then
					print(character'val(27) & "[1;34m" & (operation(initial.i) & '_' & mode(initial.j)) & character'val(27) & "[0m");
					print(character'val(27) & "[1;32m" & "TEST SUCCEEDED" & character'val(27) & "[0m");
					file_close(infile);
					if (initial.j = 4 and initial.i = 7) then
						finish;
					end if;
					initial.i := initial.i + 1 when initial.j = 4 else initial.i;
					initial.j := 0 when initial.j = 4 else initial.j + 1;
					initial.load := '0';
				end if;

				initial.data1 := read(data1);
				initial.data2 := read(data2);
				initial.data3 := read(data3);
				initial.result := read(result);
				initial.flags := read(flags)(4 downto 0);
				initial.fmt := fmt(initial.i);
				initial.rm := rm(initial.j);
				initial.op.fmadd := '1' when operation(initial.i) = "f32_mulAdd" or operation(initial.i) = "f64_mulAdd" else '0';
				initial.op.fadd := '1' when operation(initial.i) = "f32_add" or operation(initial.i) = "f64_add" else '0';
				initial.op.fsub := '1' when operation(initial.i) = "f32_sub" or operation(initial.i) = "f64_sub" else '0';
				initial.op.fmul := '1' when operation(initial.i) = "f32_mul" or operation(initial.i) = "f64_mul" else '0';
				initial.op.fdiv := '0';
				initial.op.fsqrt := '0';
				initial.op.fcmp := '0';
				initial.op.fcvt_i2f := '0';
				initial.op.fcvt_f2i := '0';
				initial.op.fcvt_op := "00";

			end if;

			fpu_i.fp_exe_i.data1 <= initial.data1;
			fpu_i.fp_exe_i.data2 <= initial.data2;
			fpu_i.fp_exe_i.data3 <= initial.data3;
			fpu_i.fp_exe_i.op <= initial.op;
			fpu_i.fp_exe_i.fmt <= initial.fmt;
			fpu_i.fp_exe_i.rm <= initial.rm;
			fpu_i.fp_exe_i.enable <= initial.enable;

			if fpu_o.fp_exe_o.ready = '1' then

				final := r_3;

				final.flags_orig := final.flags;
				final.result_orig := final.result;

				final.result_calc := fpu_o.fp_exe_o.result;
				final.flags_calc := fpu_o.fp_exe_o.flags;
				final.ready_calc := fpu_o.fp_exe_o.ready;

				final.result_diff := final.result_orig xor final.result_calc;
				final.flags_diff := final.flags_orig xor final.flags_calc;

				if ((final.op.fcvt_f2i and final.op.fcmp) = '0') then
					if (final.fmt = "00" and final.result_calc = x"000000007FC00000") then
						final.result_diff(21 downto 0) := (others => '0');
						final.result_diff(63 downto 31) := (others => '0');
					elsif (final.fmt = "01" and final.result_calc = x"7FF8000000000000") then
						final.result_diff(50 downto 0) := (others => '0');
						final.result_diff(63) := '0';
					end if;
				end if;

			end if;

			if (final.ready_calc = '1') then
				if (or final.result_diff = '1') or (or final.flags_diff = '1') then
					print(character'val(27) & "[1;34m" & (operation(final.i) & '_' & mode(final.j)) & character'val(27) & "[0m");
					print(character'val(27) & "[1;31m" & "TEST FAILED");
					print("A                 = 0x" & to_hstring(final.data1));
					print("B                 = 0x" & to_hstring(final.data2));
					print("C                 = 0x" & to_hstring(final.data3));
					print("RESULT DIFFERENCE = 0x" & to_hstring(final.result_diff));
					print("RESULT REFERENCE  = 0x" & to_hstring(final.result_orig));
					print("RESULT CALCULATED = 0x" & to_hstring(final.result_calc));
					print("FLAGS DIFFERENCE  = 0x" & to_hstring(final.flags_diff));
					print("FLAGS REFERENCE   = 0x" & to_hstring(final.flags_orig));
					print("FLAGS CALCULATED  = 0x" & to_hstring(final.flags_calc) & character'val(27) & "[0m");
					finish;
				end if;
			end if;

			r_1 <= initial;
			r_2 <= r_1;
			r_3 <= r_2;

		end if;

	end process;

end architecture;
