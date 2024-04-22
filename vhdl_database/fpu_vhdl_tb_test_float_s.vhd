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

entity test_float_s is
end entity test_float_s;

architecture behavior of test_float_s is

	component fp_unit
		port(
			reset     : in  std_logic;
			clock     : in  std_logic;
			fp_unit_i : in  fp_unit_in_type;
			fp_unit_o : out fp_unit_out_type
		);
	end component;

	type test_state_type is (IDLE, TEST0, TEST1, TEST2);

	type fpu_test_reg_type is record
		state       : test_state_type;
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
		state       => IDLE,
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

	signal r   : fpu_test_reg_type;
	signal rin : fpu_test_reg_type;

	signal fpu_i : fp_unit_in_type;
	signal fpu_o : fp_unit_out_type;

	type fmt_type is array (0 to 3) of std_logic_vector(1 downto 0);

	type mode_type is array (0 to 4) of string(1 to 3);
	type rnd_type is array (0 to 4) of std_logic_vector(2 downto 0);

	signal fmt : fmt_type := ("00","00","01","01");

	signal mode : mode_type := ("rne","rtz","rdn","rup","rmm");
	signal rm : rnd_type := ("000","001","010","011","100");

	function operation(
		index : in integer) return string is
	begin
			case index is
					when 0 => return("f32_div");
					when 1 => return("f32_sqrt");
					when 2 => return("f64_div");
					when 3 => return("f64_sqrt");
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

	process(r,fpu_o)
		file infile     : text;
  	variable status : file_open_status;
		variable inline : line;

		variable data1  : string(1 to 16) := "0000000000000000";
		variable data2  : string(1 to 16) := "0000000000000000";
		variable data3  : string(1 to 16) := "0000000000000000";
		variable result : string(1 to 16) := "0000000000000000";
		variable flags  : string(1 to 2) := "00";

		variable v : fpu_test_reg_type;

	begin

		v := r;

		if v.load = '0' then
			file_open(status, infile, (operation(v.i) & '_' & mode(v.j) & ".hex"), read_mode);
			if status /= open_ok then
				print(operation(v.i) & '_' & mode(v.j) & ".hex" & " is not available!");
				finish;
			end if;
			v.load := '1';
		end if;

		case r.state is
			when IDLE =>
				v.state := TEST0;
				v.enable := '0';
			when TEST0 =>
				if not endfile(infile) then
					v.state := TEST1;
					v.enable := '1';
				else
					v.state := TEST0;
					v.enable := '0';
				end if;
			when TEST1 =>
				if fpu_o.fp_exe_o.ready = '1' then
					v.state := TEST2;
				end if;
				v.enable := '0';
			when TEST2 =>
				v.state := TEST0;
				v.enable := '0';
			when others =>
				v.state := TEST0;
				v.enable := '0';
		end case;

		case r.state is

			when IDLE =>

				v.op := init_fp_operation;
				v.enable := '0';

			when TEST0 =>

				if endfile(infile) then
					v.terminate := '1';
					v.enable := '0';
					data1 := "0000000000000000";
					data2 := "0000000000000000";
					data3 := "0000000000000000";
					result := "0000000000000000";
					flags := "00";
				else
					v.terminate := '0';
					v.enable := '1';
					readline(infile, inline);
					if operation(v.i) = "f32_div" then
						data1 := "00000000" & inline.all(1 to 8);
						data2 := "00000000" & inline.all(10 to 17);
						data3 := "0000000000000000";
						result := "00000000" & inline.all(19 to 26);
						flags := inline.all(28 to 29);
					elsif operation(v.i) = "f32_sqrt" then
						data1 := "00000000" & inline.all(1 to 8);
						data2 := "0000000000000000";
						data3 := "0000000000000000";
						result := "00000000" & inline.all(10 to 17);
						flags := inline.all(19 to 20);
					elsif operation(v.i) = "f64_div" then
						data1 := inline.all(1 to 16);
						data2 := inline.all(18 to 33);
						data3 := "0000000000000000";
						result := inline.all(35 to 50);
						flags := inline.all(52 to 53);
					else
						data1 := inline.all(1 to 16);
						data2 := "0000000000000000";
						data3 := "0000000000000000";
						result := inline.all(18 to 33);
						flags := inline.all(35 to 36);
					end if;
				end if;

				if (v.terminate = '1') then
					print(character'val(27) & "[1;34m" & (operation(v.i) & '_' & mode(v.j)) & character'val(27) & "[0m");
					print(character'val(27) & "[1;32m" & "TEST SUCCEEDED" & character'val(27) & "[0m");
					if (v.j = 4 and v.i = 3) then
						finish;
					end if;
					v.i := v.i + 1 when v.j = 4 else v.i;
					v.j := 0 when v.j = 4 else v.j + 1;
					v.load := '0';
					file_close(infile);
				end if;

				v.data1 := read(data1);
				v.data2 := read(data2);
				v.data3 := read(data3);
				v.result := read(result);
				v.flags := read(flags)(4 downto 0);
				v.fmt := fmt(v.i);
				v.rm := rm(v.j);
				v.op.fmadd := '0';
				v.op.fadd := '0';
				v.op.fsub := '0';
				v.op.fmul := '0';
				v.op.fdiv := '1' when operation(v.i) = "f32_div" or operation(v.i) = "f64_div" else '0';
				v.op.fsqrt := '1' when operation(v.i) = "f32_sqrt" or operation(v.i) = "f64_sqrt" else '0';
				v.op.fcmp := '0';
				v.op.fcvt_f2f := '0';
				v.op.fcvt_i2f := '0';
				v.op.fcvt_f2i := '0';
				v.op.fcvt_op := "00";

				if reset = '0' then
					v.op := init_fp_operation;
					v.enable := '0';
				end if;

			when TEST1 =>

				v.result_orig := v.result;
				v.flags_orig := v.flags;

				v.result_calc := fpu_o.fp_exe_o.result;
				v.flags_calc := fpu_o.fp_exe_o.flags;
				v.ready_calc := fpu_o.fp_exe_o.ready;

				v.result_diff := v.result_orig xor v.result_calc;
				v.flags_diff := v.flags_orig xor v.flags_calc;

				if ((v.op.fcvt_f2i and v.op.fcmp) = '0') then
					if (v.fmt = "00" and v.result_calc = x"000000007FC00000") then
						v.result_diff(21 downto 0) := (others => '0');
						v.result_diff(63 downto 31) := (others => '0');
					elsif (v.fmt = "01" and v.result_calc = x"7FF8000000000000") then
						v.result_diff(50 downto 0) := (others => '0');
						v.result_diff(63) := '0';
					end if;
				end if;

				v.op := init_fp_operation;
				v.enable := '0';

			when TEST2 =>

				if (v.ready_calc = '1') then
					if (or v.result_diff = '1') or (or v.flags_diff = '1') then
						print(character'val(27) & "[1;34m" & (operation(v.i) & '_' & mode(v.j)) & character'val(27) & "[0m");
						print(character'val(27) & "[1;31m" & "TEST FAILED");
						print("A                 = 0x" & to_hstring(v.data1));
						print("B                 = 0x" & to_hstring(v.data2));
						print("RESULT DIFFERENCE = 0x" & to_hstring(v.result_diff));
						print("RESULT REFERENCE  = 0x" & to_hstring(v.result_orig));
						print("RESULT CALCULATED = 0x" & to_hstring(v.result_calc));
						print("FLAGS DIFFERENCE  = 0x" & to_hstring(v.flags_diff));
						print("FLAGS REFERENCE   = 0x" & to_hstring(v.flags_orig));
						print("FLAGS CALCULATED  = 0x" & to_hstring(v.flags_calc) & character'val(27) & "[0m");
						finish;
					end if;
				end if;

				v.op := init_fp_operation;
				v.enable := '0';

			when others =>

				v.op := init_fp_operation;
				v.enable := '0';

		end case;

		fpu_i.fp_exe_i.data1 <= v.data1;
		fpu_i.fp_exe_i.data2 <= v.data2;
		fpu_i.fp_exe_i.data3 <= v.data3;
		fpu_i.fp_exe_i.op <= v.op;
		fpu_i.fp_exe_i.fmt <= v.fmt;
		fpu_i.fp_exe_i.rm <= v.rm;
		fpu_i.fp_exe_i.enable <= v.enable;

		rin <= v;

	end process;

	process(clock)
	begin
		if rising_edge(clock) then

			if reset = '0' then

				r <= init_fpu_test_reg;

			else

				r <= rin;

			end if;

		end if;

	end process;

end architecture;
