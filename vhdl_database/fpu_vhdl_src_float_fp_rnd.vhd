-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lzc_wire.all;
use work.fp_wire.all;
use work.fp_func.all;

entity fp_rnd is
	port(
		fp_rnd_i : in  fp_rnd_in_type;
		fp_rnd_o : out fp_rnd_out_type
	);
end fp_rnd;

architecture behavior of fp_rnd is

begin

	process(fp_rnd_i)
		variable sig  : std_logic;
		variable expo : integer range -8191 to 8191;
		variable mant : std_logic_vector(53 downto 0);
		variable rema : std_logic_vector(1 downto 0);
		variable fmt  : std_logic_vector(1 downto 0);
		variable rm   : std_logic_vector(2 downto 0);
		variable grs  : std_logic_vector(2 downto 0);
		variable snan : std_logic;
		variable qnan : std_logic;
		variable dbz  : std_logic;
		variable inf  : std_logic;
		variable zero : std_logic;
		variable diff : std_logic;

		variable odd : std_logic;

		variable rnddn : natural range 0 to 1;
		variable rndup : natural range 0 to 1;
		variable shift : natural range 0 to 1;

		variable result : std_logic_vector(63 downto 0);
		variable flags  : std_logic_vector(4 downto 0);

	begin
		sig := fp_rnd_i.sig;
		expo := fp_rnd_i.expo;
		mant := fp_rnd_i.mant;
		rema := fp_rnd_i.rema;
		fmt := fp_rnd_i.fmt;
		rm := fp_rnd_i.rm;
		grs := fp_rnd_i.grs;
		snan := fp_rnd_i.snan;
		qnan := fp_rnd_i.qnan;
		dbz := fp_rnd_i.dbz;
		inf := fp_rnd_i.inf;
		zero := fp_rnd_i.zero;
		diff := fp_rnd_i.diff;

		result := X"0000000000000000";
		flags := "00000";

		odd := mant(0) or or_reduce(grs(1 downto 0)) or to_std_logic(rema = "01");
		flags(0) := to_std_logic(rema /= "00") or or_reduce(grs);

		rndup := 0;
		rnddn := 0;
		case rm is
			when "000" =>               --rne--
				if (grs(2) and odd) = '1' then
					rndup := 1;
				end if;
			when "001" =>               --rtz--
				rnddn := 1;
			when "010" =>               --rdn--
				if (sig and flags(0)) = '1' then
					rndup := 1;
				elsif (not sig and diff and zero) = '1' then
					sig := not sig;
				elsif (not sig) = '1' then
					rnddn := 1;
				end if;
			when "011" =>               --rup--
				if (not sig and flags(0)) = '1' then
					rndup := 1;
				elsif (sig) = '1' then
					rnddn := 1;
				end if;
			when "100" =>               --rmm--
				if (grs(2) and flags(0)) = '1' then
					rndup := 1;
				end if;
			when others =>
				null;
		end case;

		--if expo = 0 then
		--	flags(1) := flags(0);
		--end if;

		mant := std_logic_vector(unsigned(mant) + rndup);

		if rndup = 1 then
			if fmt = "00" then
				if expo = 0 then
					if mant(23) = '1' then
						expo := 1;
					end if;
				end if;
			elsif fmt = "01" then
				if expo = 0 then
					if mant(52) = '1' then
						expo := 1;
					end if;
				end if;
			end if;
		end if;

		if rnddn = 1 then
			if fmt = "00" then
				if expo >= 255 then
					expo := 254;
					mant := "000" & X"0000000" & "111" & X"FFFFF";
					flags := "00101";
				end if;
			elsif fmt = "01" then
				if expo >= 2047 then
					expo := 2046;
					mant := "00" & X"FFFFFFFFFFFFF";
					flags := "00101";
				end if;
			end if;
		end if;

		shift := 0;
		if fmt = "00" then
			if mant(24) = '1' then
				shift := 1;
			end if;
		elsif fmt = "01" then
			if mant(53) = '1' then
				shift := 1;
			end if;
		end if;

		expo := expo + shift;
		mant := std_logic_vector(shift_right(unsigned(mant),shift));

		if expo = 0 then
			flags(1) := flags(0);
		end if;

		if rndup = 1 then
			if expo = 1 then
				if fmt = "00" and or_reduce(mant(22 downto 0)) = '0' then
					if rm = "010" or rm = "011" then
						if grs = "001" or grs = "010" or grs = "011" or grs = "100" then
							flags(1) := '1';
						else
							flags(1) := '0';
						end if;
					else
						if grs = "100" or grs = "101" then
							flags(1) := '1';
						else
							flags(1) := '0';
						end if;
					end if;
				elsif fmt = "01" and or_reduce(mant(51 downto 0)) = '0' then
					if rm = "010" or rm = "011" then
						if grs = "001" or grs = "010" or grs = "011" or grs = "100" then
							flags(1) := '1';
						else
							flags(1) := '0';
						end if;
					else
						if grs = "100" or grs = "101" then
							flags(1) := '1';
						else
							flags(1) := '0';
						end if;
					end if;
				end if;
			end if;
		end if;

		if snan = '1' then
			flags := "10000";
		elsif qnan = '1' then
			flags := "00000";
		elsif dbz = '1' then
			flags := "01000";
		elsif inf = '1' then
			flags := "00000";
		elsif zero = '1' then
			flags := "00000";
		end if;

		if fmt = "00" then
			if (snan or qnan) = '1' then
				result := X"00000000" & "01" & X"FF" & "00" & X"00000";
			elsif (dbz or inf) = '1' then
				result := X"00000000" & sig & X"FF" & "000" & X"00000";
			elsif zero = '1' then
				result := X"00000000" & sig & X"00" & "000" & X"00000";
			elsif expo = 0 then
				result := X"00000000" & sig & X"00" & mant(22 downto 0);
			elsif expo > 254 then
				flags := "00101";
				result := X"00000000" & sig & X"FF" & "000" & X"00000";
			else
				result := X"00000000" & sig & std_logic_vector(to_unsigned(expo, 8)) & mant(22 downto 0);
			end if;
		elsif fmt = "01" then
			if (snan or qnan) = '1' then
				result := '0' & X"FFF" & "000" & X"000000000000";
			elsif (dbz or inf) = '1' then
				result := sig & "111" & X"FF" & X"0000000000000";
			elsif zero = '1' then
				result := sig & "000" & X"00" & X"0000000000000";
			elsif expo = 0 then
				result := sig & "000" & X"00" & mant(51 downto 0);
			elsif expo > 2046 then
				flags := "00101";
				result := sig & "111" & X"FF" & X"0000000000000";
			else
				result := sig & std_logic_vector(to_unsigned(expo, 11)) & mant(51 downto 0);
			end if;
		end if;

		fp_rnd_o.result <= result;
		fp_rnd_o.flags <= flags;

	end process;

end behavior;
