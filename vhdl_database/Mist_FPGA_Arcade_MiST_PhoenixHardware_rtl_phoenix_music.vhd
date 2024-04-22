---------------------------------------------------------------------------------
-- Phoenix music by Dar (darfpga@aol.fr) (April 2016)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity phoenix_music is
generic(
	C_clk_freq: real := 11.0 -- MHz
);
port(
	clk    : in std_logic;
	reset    : in std_logic;
	trigger  : in std_logic;
	sel_song : in std_logic;
	snd      : out std_logic_vector(7 downto 0)
);
end phoenix_music;

architecture struct of phoenix_music is

constant C_voice_attack: integer := integer(230.0 * C_clk_freq); -- larger value is faster
constant C_song0_tempo: integer := integer(2200.0 * C_clk_freq); -- larger value is faster
constant C_song1_tempo: integer := integer(1700.0 * C_clk_freq); -- larger value is faster
constant C_voice_down_rate: integer := integer(4000.0 / C_clk_freq); -- larger value is slower

type voice_array is array (0 to 94) of integer range 0 to 127;
-- main voice1 (Jeux Interdits)
constant voice1 : voice_array := (
32,96,32,96,32,96,32,96,26,90,24,88,24,88,23,87,21,85,21,85,24,88,32,96,37,101,101,101,101,101,37,101,35,99,33,97,33,97,32,96,26,90,26,90,32,96,33,97,32,96,33,97,32,96,36,100,33,97,32,96,32,96,26,90,24,88,24,88,23,87,21,85,23,87,23,87,23,87,23,87,24,88,23,87,21,85,24,88,32,96,37,101,101,101,101);
-- accompagnement voice1
constant voice2 : voice_array := (
5,69,69,69,69,69,16,80,80,80,80,80,8,72,8,72,8,72,16,80,80,80,80,80,5,69,5,8,16,21,5,69,69,69,69,69,17,81,81,81,81,81,10,74,74,74,74,74,16,80,80,80,80,80,16,80,80,80,80,80,8,72,72,72,72,72,5,69,69,69,69,69,7,71,71,71,71,71,17,81,81,81,8,72,5,69,16,80,8,72,5,69,69,69,69);

-- voice1, voice2 and voice3 value description
-- bit3-bit0 : tone from 0(La/A) to 11(Sol/G#)
-- bit5-bit4 : octave from 0(220Hz)to 2(880Hz)
--      bit6 : 0 = strike (restart) the tone, 1 = don't strike (hold) the tone

type voice_array2 is array (0 to 45) of integer range 0 to 127;
-- main voice3 (La lettre a Elise)
constant voice3 : voice_array2 := (
37,36,37,36,37,32,35,33,26,5,10,17,21,26,32,5,16,21,25,32,33,5,10,17,37,36,37,36,37,32,35,33,26,5,10,17,21,26,32,5,16,21,33,32,26,90);

type period_array is array (0 to 11) of integer range 0 to 65535;
-- Octave 220Hz @ 10MHz
constant tone_period : period_array := (
	45455, -- ton 0  La   (A )
	42903, -- ton 1  La#  (A#)
	40495, -- ton 2  Si   (B )
	38223, -- ton 3  Do   (C )
	36077, -- ton 4  Do#  (C#) 
	34052, -- ton 5  Re   (D )
	32141, -- ton 6  Re#  (D#)
	30337, -- ton 7  Mi   (E )
	28635, -- ton 8  Fa   (F )
	27027, -- ton 9  Fa#  (F#)
	25511, -- ton 10 Sol  (G )
	24079  -- ton 11 Sol# (G#)
);

signal tempo_period    : integer range 0 to C_song0_tempo := C_song1_tempo; --0.19s @ 100kHz 

signal voice1_tone     : integer range 0 to 65535 := 0;
signal voice1_tone_div : integer range 0 to 65535 := 0;
signal voice1_code     : unsigned(6 downto 0) := "0000000";
signal voice1_vol      : unsigned(7 downto 0) := "00000000";
signal voice1_snd      : std_logic := '0';

signal voice2_tone     : integer range 0 to 65535 := 0;
signal voice2_tone_div : integer range 0 to 65535 := 0;
signal voice2_code     : unsigned(6 downto 0) := "0000000";
signal voice2_vol      : unsigned(7 downto 0) := "00000000";
signal voice2_snd      : std_logic := '0';

signal snd1 : unsigned(7 downto 0) := "00000000";
signal snd2 : unsigned(7 downto 0) := "00000000";

signal trigger_r : std_logic := '0';
signal max_step  : integer range 0 to 94 := 94;
signal sel_song_r: std_logic := '1';
 
begin

process (clk)
	variable cnt              : integer range 0 to 127   := 0;
	variable step             : integer range 0 to 94    := 94;
	variable tempo            : integer range 0 to C_song0_tempo := 0;
	variable voice1_code_v    : unsigned(6 downto 0) := "0000000";
	variable voice2_code_v    : unsigned(6 downto 0) := "0000000";
	variable voice1_down_rate : integer range 0 to C_voice_down_rate := 0;
	variable voice2_down_rate : integer range 0 to C_voice_down_rate := 0;
begin
	if rising_edge(clk) then
		trigger_r <= trigger;
 
		if reset = '1' then
			cnt  := 0;
			step := 94;
			voice1_vol <= X"00";
			voice2_vol <= X"00";
		elsif trigger ='1' and trigger_r ='0' and step = 94 then -- restart music on edge trigger if not already playing
			cnt  := 0;
			step := 0;  
			voice1_vol <= X"00";
			voice2_vol <= X"00";
			sel_song_r <= sel_song;
			if sel_song = '1' then 
				max_step     <= 94;
				tempo_period <= C_song1_tempo; 
			else 
				max_step     <= 46;
				tempo_period <= C_song0_tempo;
			end if;
		else
			cnt  := cnt +1;
			if cnt >= 100 then
				cnt := 0;
				tempo := tempo +1;
				if tempo >= tempo_period then  -- next beat
					tempo   := 0;
					if step < max_step  then -- if not end of music get next note
						if sel_song_r = '1' then 
							voice1_code_v := to_unsigned(voice1(step),7);
							voice2_code_v := to_unsigned(voice2(step),7);
						else
							voice1_code_v := to_unsigned(voice3(step),7);
							voice2_code_v := to_unsigned(voice3(step),7);
						end if;
						voice1_code <= voice1_code_v;
						voice2_code <= voice2_code_v;
						step := step + 1;
					else              -- if end cut-off volume 
						voice1_vol <= X"00";
						voice2_vol <= X"00";
						step := 94;
					end if;
				end if;
				if (step < 94) then -- if not end of music
					-- manage voice1 volume
					--   ramp up fast to xF0 at begining of beat when new strike 
					if (tempo < C_voice_attack) and (voice1_code_v(6)='0') then
						if voice1_vol < X"F0" then voice1_vol <= voice1_vol + X"01"; end if;
						voice1_down_rate := 0;
						--  ramp down slowly after a while, down to x80
					else
						if voice1_vol > X"80" then
							voice1_down_rate := voice1_down_rate+1;
							if voice1_down_rate >= C_voice_down_rate then 
								voice1_down_rate := 0;
								voice1_vol <= voice1_vol - X"01";
							end if;
						end if;
					end if;
					-- manage voice2 volume
					if (tempo < C_voice_attack) and (voice2_code_v(6)='0') then
						if voice2_vol < X"F0" then voice2_vol <= voice2_vol + X"01"; end if;
						voice2_down_rate := 0;
					else
						if voice2_vol > X"80" then
							voice2_down_rate := voice2_down_rate+1;
							if voice2_down_rate >= C_voice_down_rate then 
								voice2_down_rate := 0;
								voice2_vol <= voice2_vol - X"01";
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

-- get voice1 raw tone
voice1_tone <= tone_period(to_integer(voice1_code(3 downto 0)));

-- get voice1 tone w.r.t octave
with voice1_code(5 downto 4) select
voice1_tone_div <= voice1_tone   when "00",
                   voice1_tone/2 when "01",
                   voice1_tone/4 when others;

-- generate voice1 frequency
voice1_frequency: process (clk)
	variable cnt  : integer range 0 to 65535 := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
		else
			cnt  := cnt+1;
			if cnt >= voice1_tone_div then
				cnt := 0;
				voice1_snd <= not voice1_snd;
			end if;
		end if;
	end if;
end process;

-- get voice2 raw tone
voice2_tone <= tone_period(to_integer(voice2_code(3 downto 0)));

-- get voice2 tone w.r.t octave
with voice2_code(5 downto 4) select
voice2_tone_div <= voice2_tone   when "00",
                   voice2_tone/2 when "01",
                   voice2_tone/4 when others;

-- generate voice2 frequency
voice2_frequency: process (clk)
	variable cnt  : integer range 0 to 65535 := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
		else
			cnt  := cnt+1;
			if cnt >= voice2_tone_div then
				cnt := 0;
				voice2_snd <= not voice2_snd;
			end if;
		end if;
	end if;
end process;

-- modulate voice1 volume with voice1 frequency
with voice1_snd select snd1 <= voice1_vol when '1', X"00" when others;

-- modulate voice2 volume with voice2 frequency
with voice2_snd select snd2 <= voice2_vol when '1', X"00" when others;
 
-- mix voice1 and voice 2 
snd <= std_logic_vector(('0'&snd1(7 downto 1)) + ('0'&snd2(7 downto 1))); 
 
end struct;

