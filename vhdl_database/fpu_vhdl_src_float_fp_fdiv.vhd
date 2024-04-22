-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lzc_wire.all;
use work.fp_wire.all;
use work.fp_func.all;

entity fp_fdiv is
	generic(
		PERFORMANCE : integer := 0
	);
	port(
		reset     : in  std_logic;
		clock     : in  std_logic;
		fp_fdiv_i : in  fp_fdiv_in_type;
		fp_fdiv_o : out fp_fdiv_out_type;
		fp_mac_i  : out fp_mac_in_type;
		fp_mac_o  : in  fp_mac_out_type
	);
end fp_fdiv;

architecture behavior of fp_fdiv is

	signal r   : fp_fdiv_functional_reg_type := init_fp_fdiv_functional_reg;
	signal rin : fp_fdiv_functional_reg_type := init_fp_fdiv_functional_reg;

	signal r_fix   : fp_fdiv_fixed_reg_type := init_fp_fdiv_fixed_reg;
	signal rin_fix : fp_fdiv_fixed_reg_type := init_fp_fdiv_fixed_reg;

	type lut_type is array (0 to 127) of signed(7 downto 0);
	type lut_root_type is array (0 to 95) of signed(7 downto 0);

	constant reciprocal_lut : lut_type := (
		"00000000", "11111110", "11111100", "11111010", "11111000", "11110110", "11110100", "11110010",
		"11110000", "11101111", "11101101", "11101011", "11101010", "11101000", "11100110", "11100101",
		"11100011", "11100001", "11100000", "11011110", "11011101", "11011011", "11011010", "11011001",
		"11010111", "11010110", "11010100", "11010011", "11010010", "11010000", "11001111", "11001110",
		"11001100", "11001011", "11001010", "11001001", "11000111", "11000110", "11000101", "11000100",
		"11000011", "11000001", "11000000", "10111111", "10111110", "10111101", "10111100", "10111011",
		"10111010", "10111001", "10111000", "10110111", "10110110", "10110101", "10110100", "10110011",
		"10110010", "10110001", "10110000", "10101111", "10101110", "10101101", "10101100", "10101011",
		"10101010", "10101001", "10101000", "10101000", "10100111", "10100110", "10100101", "10100100",
		"10100011", "10100011", "10100010", "10100001", "10100000", "10011111", "10011111", "10011110",
		"10011101", "10011100", "10011100", "10011011", "10011010", "10011001", "10011001", "10011000",
		"10010111", "10010111", "10010110", "10010101", "10010100", "10010100", "10010011", "10010010",
		"10010010", "10010001", "10010000", "10010000", "10001111", "10001111", "10001110", "10001101",
		"10001101", "10001100", "10001100", "10001011", "10001010", "10001010", "10001001", "10001001",
		"10001000", "10000111", "10000111", "10000110", "10000110", "10000101", "10000101", "10000100",
		"10000100", "10000011", "10000011", "10000010", "10000010", "10000001", "10000001", "10000000");

	constant reciprocal_root_lut : lut_root_type := (
		"10110101", "10110010", "10101111", "10101101", "10101010", "10101000", "10100110", "10100011",
		"10100001", "10011111", "10011110", "10011100", "10011010", "10011000", "10010110", "10010101",
		"10010011", "10010010", "10010000", "10001111", "10001110", "10001100", "10001011", "10001010",
		"10001000", "10000111", "10000110", "10000101", "10000100", "10000011", "10000010", "10000001",
		"10000000", "01111111", "01111110", "01111101", "01111100", "01111011", "01111010", "01111001",
		"01111000", "01110111", "01110111", "01110110", "01110101", "01110100", "01110011", "01110011",
		"01110010", "01110001", "01110001", "01110000", "01101111", "01101111", "01101110", "01101101",
		"01101101", "01101100", "01101011", "01101011", "01101010", "01101010", "01101001", "01101001",
		"01101000", "01100111", "01100111", "01100110", "01100110", "01100101", "01100101", "01100100",
		"01100100", "01100011", "01100011", "01100010", "01100010", "01100010", "01100001", "01100001",
		"01100000", "01100000", "01011111", "01011111", "01011111", "01011110", "01011110", "01011101",
		"01011101", "01011101", "01011100", "01011100", "01011011", "01011011", "01011011", "01011010");

begin

	FUNCTIONAL : if PERFORMANCE = 1 generate

		process(r, fp_fdiv_i, fp_mac_o)
			variable v : fp_fdiv_functional_reg_type;

		begin
			v := r;

			case r.state is
				when F0 =>
					if fp_fdiv_i.op.fdiv = '1' then
						v.state := F1;
					elsif fp_fdiv_i.op.fsqrt = '1' then
						v.state := F2;
					end if;
					v.istate := 0;
					v.ready := '0';
				when F1 =>
					if v.istate = 10 then
						v.state := F3;
					end if;
					v.istate := v.istate + 1;
					v.ready := '0';
				when F2 =>
					if v.istate = 13 then
						v.state := F3;
					end if;
					v.istate := v.istate + 1;
					v.ready := '0';
				when F3 =>
					v.state := F4;
					v.ready := '0';
				when others =>
					v.state := F0;
					v.ready := '1';
			end case;

			case r.state is
				when F0 =>

					v.a := fp_fdiv_i.data1;
					v.b := fp_fdiv_i.data2;
					v.class_a := fp_fdiv_i.class1;
					v.class_b := fp_fdiv_i.class2;
					v.fmt := fp_fdiv_i.fmt;
					v.rm := fp_fdiv_i.rm;
					v.snan := '0';
					v.qnan := '0';
					v.dbz := '0';
					v.inf := '0';
					v.zero := '0';

					if fp_fdiv_i.op.fsqrt = '1' then
						v.b := (62 downto 52 => '1', others => '0');
						v.class_b := (others => '0');
					end if;

					if (v.class_a(8) or v.class_b(8)) = '1' then
						v.snan := '1';
					elsif (((v.class_a(3) or v.class_a(4))) and ((v.class_b(3) or v.class_b(4)))) = '1' then
						v.snan := '1';
					elsif (((v.class_a(0) or v.class_a(7))) and ((v.class_b(0) or v.class_b(7)))) = '1' then
						v.snan := '1';
					elsif ((v.class_a(9) or v.class_b(9))) = '1' then
						v.qnan := '1';
					end if;

					if (((v.class_a(0) or v.class_a(7))) and ((v.class_b(1) or v.class_b(2) or v.class_b(3) or v.class_b(4) or v.class_b(5) or v.class_b(6)))) = '1' then
						v.inf := '1';
					elsif (((v.class_b(3) or v.class_b(4))) and ((v.class_a(1) or v.class_a(2) or v.class_a(5) or v.class_a(6)))) = '1' then
						v.dbz := '1';
					end if;

					if (((v.class_a(3) or v.class_a(4))) or ((v.class_b(0) or v.class_b(7)))) = '1' then
						v.zero := '1';
					end if;

					if fp_fdiv_i.op.fsqrt = '1' then
						if v.class_a(7) = '1' then
							v.inf := '1';
						end if;
						if (v.class_a(0) or v.class_a(1) or v.class_a(2)) = '1' then
							v.snan := '1';
						end if;
					end if;

					v.qa := "01" & signed(v.a(51 downto 0)) & "00";
					v.qb := "01" & signed(v.b(51 downto 0)) & "00";

					v.sign_fdiv := v.a(64) xor v.b(64);
					v.exponent_fdiv := to_integer(signed("0" & v.a(63 downto 52)) - signed("0" & v.b(63 downto 52)));
					v.y := "0" & nor_reduce(v.b(51 downto 45)) & reciprocal_lut(to_integer(unsigned(v.b(51 downto 45)))) & "00" & X"00000000000";
					v.op := '0';

					if fp_fdiv_i.op.fsqrt = '1' then
						v.qa := "01" & signed(v.a(51 downto 0)) & "00";
						if v.a(52) = '0' then
							v.qa := v.qa srl 1;
						end if;
						v.index := to_integer(unsigned(v.qa(54 downto 48)) - 32);
						v.exponent_fdiv := to_integer(shift_right((signed("0" & v.a(63 downto 52)) - 2045), 1));
						v.y := "0" & reciprocal_root_lut(v.index) & "000" & X"00000000000";
						v.op := '1';
					end if;

					fp_mac_i.a <= (others => '0');
					fp_mac_i.b <= (others => '0');
					fp_mac_i.c <= (others => '0');
					fp_mac_i.op <= '0';
				when F1 =>
					case r.istate is
						when 0 =>
							fp_mac_i.a <= X"40000000000000";
							fp_mac_i.b <= v.qb;
							fp_mac_i.c <= v.y;
							fp_mac_i.op <= '1';
							v.e0 := fp_mac_o.d(109 downto 54);
						when 1 =>
							fp_mac_i.a <= v.y;
							fp_mac_i.b <= v.y;
							fp_mac_i.c <= v.e0;
							fp_mac_i.op <= '0';
							v.y0 := fp_mac_o.d(109 downto 54);
						when 2 =>
							fp_mac_i.a <= X"00000000000000";
							fp_mac_i.b <= v.e0;
							fp_mac_i.c <= v.e0;
							fp_mac_i.op <= '0';
							v.e1 := fp_mac_o.d(109 downto 54);
						when 3 =>
							fp_mac_i.a <= v.y0;
							fp_mac_i.b <= v.y0;
							fp_mac_i.c <= v.e1;
							fp_mac_i.op <= '0';
							v.y1 := fp_mac_o.d(109 downto 54);
						when 4 =>
							fp_mac_i.a <= X"00000000000000";
							fp_mac_i.b <= v.e1;
							fp_mac_i.c <= v.e1;
							fp_mac_i.op <= '0';
							v.e2 := fp_mac_o.d(109 downto 54);
						when 5 =>
							fp_mac_i.a <= v.y1;
							fp_mac_i.b <= v.y1;
							fp_mac_i.c <= v.e2;
							fp_mac_i.op <= '0';
							v.y2 := fp_mac_o.d(109 downto 54);
						when 6 =>
							fp_mac_i.a <= X"00000000000000";
							fp_mac_i.b <= v.qa;
							fp_mac_i.c <= v.y2;
							fp_mac_i.op <= '0';
							v.q0 := fp_mac_o.d(109 downto 54);
						when 7 =>
							fp_mac_i.a <= v.qa;
							fp_mac_i.b <= v.qb;
							fp_mac_i.c <= v.q0;
							fp_mac_i.op <= '1';
							v.r0 := fp_mac_o.d;
						when 8 =>
							fp_mac_i.a <= v.q0;
							fp_mac_i.b <= v.r0(109 downto 54);
							fp_mac_i.c <= v.y2;
							fp_mac_i.op <= '0';
							v.q0 := fp_mac_o.d(109 downto 54);
						when 9 =>
							fp_mac_i.a <= v.qa;
							fp_mac_i.b <= v.qb;
							fp_mac_i.c <= v.q0;
							fp_mac_i.op <= '1';
							v.r1 := fp_mac_o.d;
							v.q1 := v.q0;
							if v.r1(109 downto 54) > 0 then
								v.q1 := v.q1 + "01";
							end if;
						when 10 =>
							fp_mac_i.a <= v.qa;
							fp_mac_i.b <= v.qb;
							fp_mac_i.c <= v.q1;
							fp_mac_i.op <= '1';
							v.r0 := fp_mac_o.d;
							if v.r0(109 downto 54) = 0 then
								v.q0 := v.q1;
								v.r1 := v.r0;
							end if;
						when others =>
							fp_mac_i.a <= (others => '0');
							fp_mac_i.b <= (others => '0');
							fp_mac_i.c <= (others => '0');
							fp_mac_i.op <= '0';
					end case;
				when F2 =>
					case r.istate is
						when 0 =>
							fp_mac_i.a <= X"00000000000000";
							fp_mac_i.b <= v.qa;
							fp_mac_i.c <= v.y;
							fp_mac_i.op <= '0';
							v.y0 := fp_mac_o.d(109 downto 54);
						when 1 =>
							fp_mac_i.a <= X"00000000000000";
							fp_mac_i.b <= X"20000000000000";
							fp_mac_i.c <= v.y;
							fp_mac_i.op <= '0';
							v.h0 := fp_mac_o.d(109 downto 54);
						when 2 =>
							fp_mac_i.a <= X"20000000000000";
							fp_mac_i.b <= v.h0;
							fp_mac_i.c <= v.y0;
							fp_mac_i.op <= '1';
							v.e0 := fp_mac_o.d(109 downto 54);
						when 3 =>
							fp_mac_i.a <= v.y0;
							fp_mac_i.b <= v.y0;
							fp_mac_i.c <= v.e0;
							fp_mac_i.op <= '0';
							v.y1 := fp_mac_o.d(109 downto 54);
						when 4 =>
							fp_mac_i.a <= v.h0;
							fp_mac_i.b <= v.h0;
							fp_mac_i.c <= v.e0;
							fp_mac_i.op <= '0';
							v.h1 := fp_mac_o.d(109 downto 54);
						when 5 =>
							fp_mac_i.a <= X"20000000000000";
							fp_mac_i.b <= v.h1;
							fp_mac_i.c <= v.y1;
							fp_mac_i.op <= '1';
							v.e1 := fp_mac_o.d(109 downto 54);
						when 6 =>
							fp_mac_i.a <= v.y1;
							fp_mac_i.b <= v.y1;
							fp_mac_i.c <= v.e1;
							fp_mac_i.op <= '0';
							v.y2 := fp_mac_o.d(109 downto 54);
						when 7 =>
							fp_mac_i.a <= v.h1;
							fp_mac_i.b <= v.h1;
							fp_mac_i.c <= v.e1;
							fp_mac_i.op <= '0';
							v.h2 := fp_mac_o.d(109 downto 54);
						when 8 =>
							fp_mac_i.a <= v.qa;
							fp_mac_i.b <= v.y2;
							fp_mac_i.c <= v.y2;
							fp_mac_i.op <= '1';
							v.r0 := fp_mac_o.d;
						when 9 =>
							fp_mac_i.a <= v.y2;
							fp_mac_i.b <= v.h2;
							fp_mac_i.c <= v.r0(109 downto 54);
							fp_mac_i.op <= '0';
							v.y3 := fp_mac_o.d(109 downto 54);
						when 10 =>
							fp_mac_i.a <= v.qa;
							fp_mac_i.b <= v.y3;
							fp_mac_i.c <= v.y3;
							fp_mac_i.op <= '1';
							v.r0 := fp_mac_o.d;
						when 11 =>
							fp_mac_i.a <= v.y3;
							fp_mac_i.b <= v.h2;
							fp_mac_i.c <= v.r0(109 downto 54);
							fp_mac_i.op <= '0';
							v.q0 := fp_mac_o.d(109 downto 54);
						when 12 =>
							fp_mac_i.a <= v.qa;
							fp_mac_i.b <= v.q0;
							fp_mac_i.c <= v.q0;
							fp_mac_i.op <= '1';
							v.r1 := fp_mac_o.d;
							v.q1 := v.q0;
							if v.r1(109 downto 54) > 0 then
								v.q1 := v.q1 + "01";
							end if;
						when 13 =>
							fp_mac_i.a <= v.qa;
							fp_mac_i.b <= v.q1;
							fp_mac_i.c <= v.q1;
							fp_mac_i.op <= '1';
							v.r0 := fp_mac_o.d;
							if v.r0(109 downto 54) = 0 then
								v.q0 := v.q1;
								v.r1 := v.r0;
							end if;
						when others =>
							fp_mac_i.a <= (others => '0');
							fp_mac_i.b <= (others => '0');
							fp_mac_i.c <= (others => '0');
							fp_mac_i.op <= '0';
					end case;
				when F3 =>
					fp_mac_i.a <= (others => '0');
					fp_mac_i.b <= (others => '0');
					fp_mac_i.c <= (others => '0');
					fp_mac_i.op <= '0';

					v.mantissa_fdiv := std_logic_vector(v.q0(54 downto 0)) & "000" & X"00000000000000";

					v.remainder_rnd := "10";
					if v.r1 > 0 then
						v.remainder_rnd := "01";
					elsif v.r1 = 0 then
						v.remainder_rnd := "00";
					end if;

					v.counter_fdiv := 0;
					if v.mantissa_fdiv(113) = '0' then
						v.mantissa_fdiv := v.mantissa_fdiv(112 downto 0) & "0";
						v.counter_fdiv := 1;
					end if;
					if v.op = '1' then
						v.counter_fdiv := 1;
						if v.mantissa_fdiv(113) = '0' then
							v.mantissa_fdiv := v.mantissa_fdiv(112 downto 0) & "0";
							v.counter_fdiv := 0;
						end if;
					end if;

					v.exponent_bias := 127;
					if v.fmt = "01" then
						v.exponent_bias := 1023;
					end if;

					v.sign_rnd := v.sign_fdiv;
					v.exponent_rnd := v.exponent_fdiv + v.exponent_bias - v.counter_fdiv;

					v.counter_rnd := 0;
					if v.exponent_rnd <= 0 then
						v.counter_rnd := 54;
						if v.exponent_rnd > -54 then
							v.counter_rnd := 1 - v.exponent_rnd;
						end if;
						v.exponent_rnd := 0;
					end if;

					v.mantissa_fdiv := std_logic_vector(shift_right(unsigned(v.mantissa_fdiv),v.counter_rnd));

					v.mantissa_rnd := "00" & X"0000000" & v.mantissa_fdiv(113 downto 90);
					v.grs := v.mantissa_fdiv(89 downto 88) & or_reduce(v.mantissa_fdiv(87 downto 0));
					if v.fmt = "01" then
						v.mantissa_rnd := "0" & v.mantissa_fdiv(113 downto 61);
						v.grs := v.mantissa_fdiv(60 downto 59) & or_reduce(v.mantissa_fdiv(58 downto 0));
					end if;

				when others =>
					fp_mac_i.a <= (others => '0');
					fp_mac_i.b <= (others => '0');
					fp_mac_i.c <= (others => '0');
					fp_mac_i.op <= '0';

			end case;

			fp_fdiv_o.fp_rnd.sig <= v.sign_rnd;
			fp_fdiv_o.fp_rnd.expo <= v.exponent_rnd;
			fp_fdiv_o.fp_rnd.mant <= v.mantissa_rnd;
			fp_fdiv_o.fp_rnd.rema <= v.remainder_rnd;
			fp_fdiv_o.fp_rnd.fmt <= v.fmt;
			fp_fdiv_o.fp_rnd.rm <= v.rm;
			fp_fdiv_o.fp_rnd.grs <= v.grs;
			fp_fdiv_o.fp_rnd.snan <= v.snan;
			fp_fdiv_o.fp_rnd.qnan <= v.qnan;
			fp_fdiv_o.fp_rnd.dbz <= v.dbz;
			fp_fdiv_o.fp_rnd.inf <= v.inf;
			fp_fdiv_o.fp_rnd.zero <= v.zero;
			fp_fdiv_o.fp_rnd.diff <= '0';
			fp_fdiv_o.ready <= v.ready;

			rin <= v;

		end process;

		process(clock)
		begin
			if rising_edge(clock) then

				if reset = '0' then

					r <= init_fp_fdiv_functional_reg;

				else

					r <= rin;

				end if;

			end if;

		end process;

	end generate FUNCTIONAL;

	FIXED : if PERFORMANCE = 0 generate

		fp_mac_i.a <= (others => '0');
		fp_mac_i.b <= (others => '0');
		fp_mac_i.c <= (others => '0');
		fp_mac_i.op <= '0';

		process(r_fix, fp_fdiv_i)
			variable v : fp_fdiv_fixed_reg_type;

		begin
			v := r_fix;

			case r_fix.state is
				when F0 =>
					if fp_fdiv_i.op.fdiv = '1' then
						v.state := F1;
						v.istate := 54;
					elsif fp_fdiv_i.op.fsqrt = '1' then
						v.state := F1;
						v.istate := 53;
					end if;
					v.ready := '0';
				when F1 =>
					if (v.fmt = "00") and (v.istate = 29) then
						v.state := F2;
					elsif v.istate = 0 then
						v.state := F2;
					else
						v.istate := v.istate - 1;
					end if;
					v.ready := '0';
				when F2 =>
					v.state := F3;
					v.ready := '0';
				when others =>
					v.state := F0;
					v.ready := '1';
			end case;

			case r_fix.state is

				when F0 =>

					v.a := fp_fdiv_i.data1;
					v.b := fp_fdiv_i.data2;
					v.class_a := fp_fdiv_i.class1;
					v.class_b := fp_fdiv_i.class2;
					v.fmt := fp_fdiv_i.fmt;
					v.rm := fp_fdiv_i.rm;
					v.snan := '0';
					v.qnan := '0';
					v.dbz := '0';
					v.inf := '0';
					v.zero := '0';

					if fp_fdiv_i.op.fsqrt = '1' then
						v.b := (62 downto 52 => '1', others => '0');
						v.class_b := (others => '0');
					end if;

					if (v.class_a(8) or v.class_b(8)) = '1' then
						v.snan := '1';
					elsif (((v.class_a(3) or v.class_a(4))) and ((v.class_b(3) or v.class_b(4)))) = '1' then
						v.snan := '1';
					elsif (((v.class_a(0) or v.class_a(7))) and ((v.class_b(0) or v.class_b(7)))) = '1' then
						v.snan := '1';
					elsif (v.class_a(9) or v.class_b(9)) = '1' then
						v.qnan := '1';
					end if;

					if (((v.class_a(0) or v.class_a(7))) and ((v.class_b(1) or v.class_b(2) or v.class_b(3) or v.class_b(4) or v.class_b(5) or v.class_b(6)))) = '1' then
						v.inf := '1';
					elsif (((v.class_b(3) or v.class_b(4))) and ((v.class_a(1) or v.class_a(2) or v.class_a(5) or v.class_a(6)))) = '1' then
						v.dbz := '1';
					end if;

					if (((v.class_a(3) or v.class_a(4))) or ((v.class_b(0) or v.class_b(7)))) = '1' then
						v.zero := '1';
					end if;

					if fp_fdiv_i.op.fsqrt = '1' then
						if v.class_a(7) = '1' then
							v.inf := '1';
						end if;
						if (v.class_a(0) or v.class_a(1) or v.class_a(2)) = '1' then
							v.snan := '1';
						end if;
					end if;

					v.sign_fdiv := v.a(64) xor v.b(64);

					v.exponent_fdiv := to_integer(signed("0" & v.a(63 downto 52)) - signed("0" & v.b(63 downto 52)));
					if fp_fdiv_i.op.fsqrt = '1' then
						v.exponent_fdiv := to_integer(shift_right((signed("0" & v.a(63 downto 52)) - 2045), 1));
					end if;

					v.q := (others => '0');

					v.m := X"1" & v.b(51 downto 0) & "0";
					v.r := "0" & X"1" & v.a(51 downto 0);
					v.op := '0';
					if fp_fdiv_i.op.fsqrt = '1' then
						v.m := (others => '0');
						if v.a(52) = '0' then
							v.r := v.r(55 downto 0) & '0';
						end if;
						v.op := '1';
					end if;

				when F1 =>

					if v.op = '1' then
						v.m := '0' & v.q & '0';
						v.m(r_fix.istate) := '1';
					end if;
					v.r := v.r(55 downto 0) & '0';
					v.e := std_logic_vector(signed(v.r) - signed(v.m));
					if v.e(56) = '0' then
						v.q(r_fix.istate) := '1';
						v.r := v.e;
					end if;

				when F2 =>

					v.mantissa_fdiv := v.q & v.r(55 downto 0) & "00" & X"0000000000000";

					v.counter_fdiv := 0;
					if v.mantissa_fdiv(164) = '0' then
						v.counter_fdiv := 1;
					end if;

					v.mantissa_fdiv := std_logic_vector(shift_left(unsigned(v.mantissa_fdiv),v.counter_fdiv));

					v.sign_rnd := v.sign_fdiv;

					v.exponent_bias := 127;
					if v.fmt = "01" then
						v.exponent_bias := 1023;
					end if;

					v.exponent_rnd := v.exponent_fdiv + v.exponent_bias - v.counter_fdiv;

					v.counter_rnd := 0;
					if v.exponent_rnd <= 0 then
						v.counter_rnd := 54;
						if v.exponent_rnd > -54 then
							v.counter_rnd := 1 - v.exponent_rnd;
						end if;
						v.exponent_rnd := 0;
					end if;

					v.mantissa_fdiv := std_logic_vector(shift_right(unsigned(v.mantissa_fdiv),v.counter_rnd));

					v.mantissa_rnd := "00" & X"0000000" & v.mantissa_fdiv(164 downto 141);
					v.grs := v.mantissa_fdiv(140 downto 139) & or_reduce(v.mantissa_fdiv(138 downto 0));
					if v.fmt = "01" then
						v.mantissa_rnd := "0" & v.mantissa_fdiv(164 downto 112);
						v.grs := v.mantissa_fdiv(111 downto 110) & or_reduce(v.mantissa_fdiv(109 downto 0));
					end if;

				when others =>

			end case;

			fp_fdiv_o.fp_rnd.sig <= v.sign_rnd;
			fp_fdiv_o.fp_rnd.expo <= v.exponent_rnd;
			fp_fdiv_o.fp_rnd.mant <= v.mantissa_rnd;
			fp_fdiv_o.fp_rnd.rema <= "00";
			fp_fdiv_o.fp_rnd.fmt <= v.fmt;
			fp_fdiv_o.fp_rnd.rm <= v.rm;
			fp_fdiv_o.fp_rnd.grs <= v.grs;
			fp_fdiv_o.fp_rnd.snan <= v.snan;
			fp_fdiv_o.fp_rnd.qnan <= v.qnan;
			fp_fdiv_o.fp_rnd.dbz <= v.dbz;
			fp_fdiv_o.fp_rnd.inf <= v.inf;
			fp_fdiv_o.fp_rnd.zero <= v.zero;
			fp_fdiv_o.fp_rnd.diff <= '0';
			fp_fdiv_o.ready <= v.ready;

			rin_fix <= v;

		end process;

		process(clock)
		begin
			if rising_edge(clock) then

				if reset = '0' then

					r_fix <= init_fp_fdiv_fixed_reg;

				else

					r_fix <= rin_fix;

				end if;

			end if;

		end process;

	end generate FIXED;

end behavior;
