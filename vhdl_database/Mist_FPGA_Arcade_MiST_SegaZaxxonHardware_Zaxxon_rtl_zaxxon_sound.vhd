----------------
-- Wave player --
-----------------

-- Zaxxon sample wav files info header - start/stop addresses as loaded in SDRAM

--00.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg: 29970 start:    44 (x0002C) stop: 30014 (x0753E)
--01.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg: 17798 start: 30058 (x0756A) stop: 47856 (x0BAF0)
--02.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg: 63596 start: 47900 (x0BB1C) stop:111496 (x1B388)
--03.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg: 40420 start:111540 (x1B3B4) stop:151960 (x25198)
--04.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg: 66294 start:152004 (x251C4) stop:218298 (x354BA)
--05.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg: 56038 start:218342 (x354E6) stop:274380 (x42FCC)
--08.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg:104692 start:274424 (x42FF8) stop:379116 (x5C8EC)
--10.wav e:RIFF n:1 sr:22050 br:44100 al:2 bps:16 lg:168970 start:379160 (x5C918) stop:548130 (x85D22)
--11.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg:154144 start:548174 (x85D4E) stop:702318 (xAB76E)
--20.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg:  4128 start:702362 (xAB79A) stop:706490 (xAC7BA)
--21.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg:  6854 start:706534 (xAC7E6) stop:713388 (xAE2AC)
--23.wav e:RIFF n:1 sr:44100 br:88200 al:2 bps:16 lg: 86978 start:713432 (xAE2D8) stop:800410 (xC369A)

-- 8255 PIA port A B C

-- PA1/PA0 PLAYER SHIP A/B       - Volume 04/05.wav 
--
--#0  - PA7 loop      BATTLESHIP     00.wav - boss
--#1  - PA6 loop      LASER          01.wav - electric field
--#2  - PA5 retrig    BASE MISSILE   02.wav - missile engine
--#3  - PA4 loop      HOMING MISSILE 03.wav - homing missile
--#4  - PA3 loop      PLAYER SHIP D  04.wav - shuttle engine
--#5  - PA2 loop      PLAYER SHIP C  05.wav - within space
--#6  - PB7 retrig    CANNON         08.wav - player shot
--#7  - PB5 no retrig M-EXP          10.wav - final explode
--#8  - PB4 retrig    S-EXP          11.wav - explode
--#9  - PC3 no retrig ALARM3         20.wav - low fuel
--#10 - PC2 retrig    ALARM2         21.wav - enemy locked
--#11 - PC0 retrig    SHOT           23.wav - coin / tourelle shot

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity zaxxon_sound is
port(
 clock_24       : in std_logic;
 reset          : in std_logic;

 port_a         : in std_logic_vector(7 downto 0);
 port_a_r       : in std_logic_vector(7 downto 0); -- i8255 ports
 port_b         : in std_logic_vector(7 downto 0);
 port_b_r       : in std_logic_vector(7 downto 0);
 port_c         : in std_logic_vector(7 downto 0);
 port_c_r       : in std_logic_vector(7 downto 0);

 audio_out_l    : out std_logic_vector(15 downto 0);
 audio_out_r    : out std_logic_vector(15 downto 0);

 wave_addr      : buffer std_logic_vector(19 downto 0);
 wave_rd        : out std_logic;
 wave_data      : in std_logic_vector(15 downto 0)
 );
end zaxxon_sound;

architecture struct of zaxxon_sound is

 signal wav_clk_cnt : std_logic_vector(11 downto 0); -- 44kHz divider / sound# counter

 subtype snd_id_t is integer range 0 to 11;
 signal snd_id : snd_id_t;

 type snd_addr_t is array(snd_id_t) of std_logic_vector(19 downto 0);

 -- wave current addresses in sdram
 signal snd_addrs : snd_addr_t;  

 -- wave start addresses in sdram 
 signal snd_starts : snd_addr_t := (
   x"0002C",x"0756A",x"0BB1C",x"1B3B4",x"251C4",x"354E6",
   x"42FF8",x"5C918",x"85D4E",x"AB79A",x"AC7E6",x"AE2D8");

 -- wave end addresses in sdram 
 signal snd_stops : snd_addr_t := (
   x"0753E",x"0BAF0",x"1B388",x"25198",x"354BA",x"42FCC",
   x"5C8EC",x"85D22",x"AB76E",x"AC7BA",x"AE2AC",x"C369A");

 type snd_flag_t is array(snd_id_t) of std_logic;

  -- sound playing (once)
 signal snd_starteds : snd_flag_t := (
   '0','0','0','0','0','0','0','0','0','0','0','0');
 -- sound to be restarted
 signal snd_restarts : snd_flag_t := (
   '0','0','0','0','0','0','0','0','0','0','0','0');
 -- sound playing (loop)
 signal snd_continus : snd_flag_t := (
   '0','0','0','0','0','0','0','0','0','0','0','0');
 -- sound sample rate 44/22kHz
 signal snd_44k : snd_flag_t := (
   '1','1','1','1','1','1','1','0','1','1','1','1');

 -- divide 44kHz flag
 signal snd_22k_flag : std_logic := '0';

 -- sum all sound
 signal audio_r, audio_sum : signed(19 downto 0);
 signal ship_vol, volume   : signed( 7 downto 0);
 signal audio_vol          : signed(23 downto 0);


begin

-- scan sound# from 0-11
snd_id <= to_integer(unsigned(wav_clk_cnt(8 downto 5)));

-- apply volume to sdram (wav file) data w.r.t port_a and snd_id
with port_a(1 downto 0) select
ship_vol <= x"10" when "00",
            x"20" when "01",
            x"30" when "10",
            x"40" when others;

with snd_id select
volume <= ship_vol when 4,
          ship_vol when 5,
          x"7F" when others;

audio_vol <= (signed(wave_data) * volume) / 128;

-- wave player
process (clock_24, reset)
begin
	if reset='1' then
		wav_clk_cnt <= (others=>'0');
	else
		if rising_edge(clock_24) then

			-- sound triggers
			snd_continus( 0) <= not port_a(7); -- boss
			snd_continus( 1) <= not port_a(6); -- electric field

			snd_starteds( 2) <= snd_starteds( 2) or (not(port_a(5)) and port_a_r(5)); -- missile engine
			snd_restarts( 2) <= snd_restarts( 2) or (not(port_a(5)) and port_a_r(5));

			snd_continus( 3) <= not port_a(4); -- homing missile
			snd_continus( 4) <= not port_a(3); -- shuttle engine
			snd_continus( 5) <= not port_a(2); -- within space

			snd_starteds( 6) <= snd_starteds( 6) or (not(port_b(7)) and port_b_r(7)); -- player shot
			snd_restarts( 6) <= snd_restarts( 6) or (not(port_b(7)) and port_b_r(7));

			snd_starteds( 7) <= snd_starteds( 7) or (not(port_b(5)) and port_b_r(5)); -- final explode

			snd_starteds( 8) <= snd_starteds( 8) or (not(port_b(4)) and port_b_r(4)); -- explode
			snd_restarts( 8) <= snd_restarts( 8) or (not(port_b(4)) and port_b_r(4));

			snd_starteds( 9) <= snd_starteds( 9) or (not(port_c(3)) and port_c_r(3)); -- low fuel

			snd_starteds(10) <= snd_starteds(10) or (not(port_c(2)) and port_c_r(2)); -- enemy locked
			snd_restarts(10) <= snd_restarts(10) or (not(port_c(2)) and port_c_r(2));

			snd_starteds(11) <= snd_starteds(11) or (not(port_c(0)) and port_c_r(0)); -- coin / tourelle shot
			snd_restarts(11) <= snd_restarts(11) or (not(port_c(0)) and port_c_r(0));

			-- 44.1kHz base tempo / high bits for scanning sound#
			if wav_clk_cnt = x"21F" then  -- divide 24MHz by 544 => 44.117kHz
				wav_clk_cnt <= (others=>'0');
				snd_22k_flag <= not snd_22k_flag; -- divide by 2 => 22.05kHz

				-- latch final audio / reset sum
				audio_r <= audio_sum;
				audio_sum <= (others => '0');
			else
				wav_clk_cnt <= wav_clk_cnt + 1;
			end if;

			-- clip audio
			if  audio_r(19 downto 2) > 32767 then
				audio_out_l <= x"7FFF";
			elsif audio_r(19 downto 2) < -32768 then
				audio_out_l <= x"8000";
			else
				audio_out_l <= std_logic_vector(audio_r(17 downto 2));
			end if;

			-- sdram read trigger (and auto refresh period)
			if wav_clk_cnt(4 downto 0) = "00000" then wave_rd <= '1';end if;
			if wav_clk_cnt(4 downto 0) = "00010" then wave_rd <= '0';end if;

			-- select only useful cycles (0-11)
			-- remaing cycles unsued
			if wav_clk_cnt(11 downto 5) <= 11 then

				-- set sdram addr at begining of cycle
				if wav_clk_cnt(4 downto 0) = "00000" then
					wave_addr <= snd_addrs(snd_id);
				end if;

				-- sound# currently playing
				if (snd_starteds(snd_id) = '1' or snd_continus(snd_id) = '1' ) then

					-- get sound# sample and update next sound# address
					-- (next / restart)
					if wav_clk_cnt(4 downto 0) = "10000" then

						audio_sum <= audio_sum + audio_vol(15 downto 0);

						if snd_restarts(snd_id) = '1' then
							snd_addrs(snd_id) <= snd_starts(snd_id);
							snd_restarts(snd_id) <= '0';
						else
							if (snd_44k(snd_id) = '1' or snd_22k_flag = '1') then
								snd_addrs(snd_id) <= snd_addrs(snd_id) + 2;
							end if;
						end if;
					end if;

					-- update next sound# address
					-- (stop / loop)
					if snd_addrs(snd_id) >= snd_stops(snd_id) then
						if snd_continus(snd_id) = '1' then
							snd_addrs(snd_id) <= snd_starts(snd_id);
						else
							snd_starteds(snd_id) <= '0';
						end if;
					end if;

				else
					-- sound# stopped set begin address
					snd_addrs(snd_id) <= snd_starts(snd_id);
				end if;

			end if;

		end if;
	end if;
end process;

end struct;