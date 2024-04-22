----------------
-- Wave player --
-----------------

-- Congo samples - start/stop addresses as stored in memory

-- bass.wav    e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:  2005 start:    44(x   2C) stop:  2050(x  802)
-- congal.wav  e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:  2003 start:  2094(x  82E) stop:  4098(x 1002)
-- congah.wav  e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:  1970 start:  4142(x 102E) stop:  6112(x 17E0)
-- rim.wav     e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:   373 start:  6156(x 180C) stop:  6530(x 1982)
-- gorilla.wav e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:  4991 start:  6574(x 19AE) stop: 11566(x 2D2E)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity samples_player is
port(
 clock_24    : in std_logic;
 reset       : in std_logic;

 port_b      : in std_logic_vector(7 downto 0);
 port_c      : in std_logic_vector(7 downto 0);

 audio_out   : out std_logic_vector(15 downto 0);

 wave_addr   : buffer std_logic_vector(15 downto 0);
 wave_rd     : out std_logic;
 wave_data   : in std_logic_vector(7 downto 0)
 );
end samples_player;

architecture struct of samples_player is

 signal wav_clk_cnt : std_logic_vector(11 downto 0); -- 11kHz divider / sound# counter

 subtype snd_id_t is integer range 0 to 4;
 signal snd_id : snd_id_t;

 type snd_addr_t is array(snd_id_t) of std_logic_vector(15 downto 0);

 -- wave current addresses in memory
 signal snd_addrs : snd_addr_t;  

-- bass.wav    e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:  2005 start:    44(x   2C) stop:  2050(x  802)
-- congal.wav  e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:  2003 start:  2094(x  82E) stop:  4098(x 1002)
-- congah.wav  e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:  1970 start:  4142(x 102E) stop:  6112(x 17E0)
-- rim.wav     e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:   373 start:  6156(x 180C) stop:  6530(x 1982)
-- gorilla.wav e:RIFF n:1 sr:11025 br:11025 al:1 bps:8 lg:  4991 start:  6574(x 19AE) stop: 11566(x 2D2E)
 
 -- wave start addresses in memory 
 signal snd_starts : snd_addr_t := (x"002C",x"082E",x"102E",x"180C",x"19AE");

 -- wave end addresses in memory 
 signal snd_stops  : snd_addr_t := (x"0800",x"1000",x"17DE",x"1980",x"2D2C");

 type snd_flag_t is array(snd_id_t) of std_logic;

  -- sound playing (once)
 signal snd_starteds : snd_flag_t := ('0','0','0','0','0');
 -- sound to be restarted
 signal snd_restarts : snd_flag_t := ('0','0','0','0','0');
 -- sound playing (loop)
 signal snd_continus : snd_flag_t := ('0','0','0','0','0');

 signal port_b_r : std_logic_vector(7 downto 0);
 signal port_c_r : std_logic_vector(7 downto 0);

 -- sum all sound
 signal audio_r, audio_sum : signed(18 downto 0);
 signal audio_vol          : signed(15 downto 0);

-- signal wave_addr          : std_logic_vector(15 downto 0);
-- signal wave_data          : std_logic_vector( 7 downto 0);

begin

-- scan sound# from 0-4
snd_id <= to_integer(unsigned(wav_clk_cnt(7 downto 5))) when wav_clk_cnt(11 downto 5) <= 4 else 0;

audio_vol <= (signed('0'&wave_data)-to_signed(128,9))&"0000000"; -- congo samples memory is uint8

-- wave player
process (clock_24, reset)
begin
	if reset='1' then
		wav_clk_cnt <= (others=>'0');
	else
		if rising_edge(clock_24) then
		
			port_b_r <= port_b;
			port_c_r <= port_c;

			-- sound triggers
			
			-- snd_continus : play loop as long as set
			-- snd_starteds : edge trigger start playing when currently stopped 
			-- snd_restarts : edge trigger restart from beginning 

			snd_starteds( 0) <= snd_starteds( 0) or (not(port_c(0)) and port_c_r(0)); -- bass
--			snd_restarts( 0) <= snd_restarts( 0) or (not(port_c(0)) and port_c_r(0));

			snd_starteds( 1) <= snd_starteds( 1) or (not(port_c(1)) and port_c_r(1)); -- congal

			snd_starteds( 2) <= snd_starteds( 2) or (not(port_c(2)) and port_c_r(2)); -- congah

			snd_starteds( 3) <= snd_starteds( 3) or (not(port_c(3)) and port_c_r(3)); -- rim

			snd_starteds( 4) <= snd_starteds( 4) or (not(port_b(1)) and port_b_r(1)); -- gorilla

			-- 11.025kHz base tempo / high bits for scanning sound#
			if wav_clk_cnt = x"880" then  -- divide 24MHz by 2176 => 11.025kHz
				wav_clk_cnt <= (others=>'0');

				-- latch final audio / reset sum
				audio_r <= audio_sum;
				audio_sum <= (others => '0');
			else
				wav_clk_cnt <= wav_clk_cnt + 1;
			end if;

			-- clip audio
			if  audio_r(18 downto 1) > 32767 then
				audio_out <= x"7FFF";
			elsif audio_r(18 downto 1) < -32767 then
				audio_out <= x"8001";
			else
				audio_out <= std_logic_vector(audio_r(16 downto 1)+to_signed(32767,16));
			end if;

			-- sdram read trigger (and auto refresh period)
			if wav_clk_cnt(4 downto 0) = "00000" then wave_rd <= '1';end if;
			if wav_clk_cnt(4 downto 0) = "00010" then wave_rd <= '0';end if;

			-- select only useful cycles (0-4)
			-- remaing cycles unsued
			if wav_clk_cnt(11 downto 5) <= 4 then

				-- set sdram addr at begining of cycle
				if wav_clk_cnt(4 downto 0) = "00000" then
					wave_addr <= snd_addrs(snd_id);
				end if;

				-- sound# currently playing
				if (snd_starteds(snd_id) = '1' or snd_continus(snd_id) = '1' ) then

					-- get sound# sample and update next sound# address
					-- (next / restart)
					if wav_clk_cnt(4 downto 0) = "10000" then

						audio_sum <= audio_sum + audio_vol;

						if snd_restarts(snd_id) = '1' then
							snd_addrs(snd_id) <= snd_starts(snd_id);
							snd_restarts(snd_id) <= '0';
						else
							snd_addrs(snd_id) <= snd_addrs(snd_id) + 1;
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


-- samples data --
--samples : entity work.congo_samples
--port map(
-- clk  => clock_24,
-- addr => wave_addr(13 downto 0),
-- data => wave_data
--);


end struct;