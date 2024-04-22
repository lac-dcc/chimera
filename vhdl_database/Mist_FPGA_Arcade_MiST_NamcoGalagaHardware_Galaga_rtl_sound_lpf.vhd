---------------------------------------------------------------------------------
-- Implementation of audio LPF filters
-- derived from Burnin' Rubber / Bump'n'Jump sources
---------------------------------------------------------------------------------
--
--                 ----------o------------
--            u4^  |         |           |
--              | --- C4    | | R5       |
--              | ---       | |          |
--              |  |    C3   |           |
--     --| R1 |----o----||---o------|\   |
--     ^           |  ------> u3    | \__o---
--     |           |                | /     ^
--     |uin       | | R2          --|/      |
--     |          | |             |         | uout
--     |           |              |         |
--     ------------o--------------o----------
--
-- i1 = (sin+u3)/R1
-- i2 = -u3/R2
-- i3 = (u4-u3)/R5
-- i4 = i2-i1-i3
--
-- u3(t+dt) = u3(t) + i3(t)*dt/C3;
-- u4(t+dt) = u4(t) + i4(t)*dt/C4;
-- uout = u4-u3
--
-- (i3(t)*dt/C3)*scale = du3*scale = ((u4-u3)/R5*dt/C3)*scale
-- (i4(t)*dt/C4)*scale = du4*scale = (-u3/R2 -(uin+u3)/R1 -(u4-u3)/R5)*dt/C4*scale

library ieee;
use ieee.std_logic_1164.all,
    ieee.std_logic_1164.all,
    ieee.std_logic_unsigned.all,
    ieee.numeric_std.all;

entity lpf is
port(
	clock      : in std_logic;
	reset      : in std_logic;

	div        : in integer;
	audio_in   : in std_logic_vector(9 downto 0);

	gain_in    : in integer;
	r1         : in integer;
	r2         : in integer;
	dt_over_c3 : in integer;
	dt_over_c4 : in integer;
	r5         : in integer;

	audio_out  : out std_logic_vector(15 downto 0)
);
end lpf;

architecture rtl of lpf is
signal clock_div : std_logic_vector(9 downto 0) := (others =>'0');
signal uin       : integer;
signal u3        : integer;
signal u4        : integer;
signal du3       : integer;
signal du4       : integer;
signal uout      : integer;
signal uout_ltd  : integer;

-- integer scale for fixed point
constant scale   : integer := 8192;

begin

uin <= to_integer(unsigned(audio_in)-256)*gain_in;

process (clock, reset)
begin
	if reset = '1' then
		clock_div <= (others => '0');
	else
		if rising_edge(clock) then
			-- divide main clock for downsampling
			if clock_div = div-1 then
				clock_div <= "0000000000";
			else
				clock_div <= clock_div + '1';
			end if;

			if clock_div = "0000000000" then
				du3 <= scale*dt_over_c3/r5*(u4-u3);
				du4 <= (scale*dt_over_c4/r2 + scale*dt_over_c4/r1 - scale*dt_over_c4/r5)*u3
				     + scale*dt_over_c4/r5*u4
				     + scale*dt_over_c4/r1*uin;
			end if;

			if clock_div = "0000000001" then
				u3 <= u3 + du3/scale;
				u4 <= u4 - du4/scale;
			end if;

			if clock_div = "0000000010" then
				uout <= u4 - u3;
			end if;

			-- clamp
			if clock_div = "0000000011" then
				if uout > 255 then
					uout_ltd <= 255;
				elsif uout < -255 then
					uout_ltd <= -255;
				else
					uout_ltd <= uout;
				end if;
			end if;

			if clock_div = "0000000100" then
				audio_out <= std_logic_vector(to_unsigned(uout_ltd+256,9)) & "0000000";
			end if;
		end if;
	end if;
end process;

end architecture;
