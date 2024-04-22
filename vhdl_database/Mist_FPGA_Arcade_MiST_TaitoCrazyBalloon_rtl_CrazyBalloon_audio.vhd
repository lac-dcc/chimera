--
-- A simulation of Crazy Balloon
--
-- Mike Coates
--
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity CRAZYBALLOON_AUDIO is
  port (
    I_HCNT            : in  std_logic;
    --
    I_MUSIC_ON        : in  std_logic;
	 I_TONE				 : in  std_logic_vector(7 downto 0);
	 I_LAUGH           : in  std_logic;
	 I_EXPLODE         : in  std_logic;
	 I_BREATH          : in  std_logic;
	 I_APPEAR          : in  std_logic;
    --
	 I_RESET           : in  std_logic;
	 --
    O_AUDIO           : out std_logic_vector(15 downto 0);
    CLK               : in  std_logic
    );
end;

architecture RTL of CRAZYBALLOON_AUDIO is

	-- global
	signal AUDIO_CLK    : std_logic := '0';
	signal LAUGH_OUT    : std_logic_vector(7 downto 0) := (others => '0');
	signal WAVE_CLK     : std_logic := '0';
	-- Music --
	signal W_2CD_LDn    : std_logic := '0';
	signal W_2CD_Q      : std_logic_vector(7 downto 0) := (others => '0');
	signal W_4E_Q       : std_logic_vector(2 downto 0) := (others => '0');
	signal W_SDAT1      : std_logic_vector(7 downto 0) := (others => '0');
	signal W_SDAT2      : std_logic_vector(7 downto 0) := (others => '0');
	signal MUSIC_OUT    : std_logic_vector(7 downto 0) := (others => '0');
	-- Laugh 
	signal L_COUNT      : natural range 150 to 810 := 150;
	signal L_STOP       : natural range 150 to 810 := 150;
	signal W_4J_L_OUT   : std_logic := '0';
	signal R_COUNT      : natural range 0 to 480 := 0;
	signal W_4J_R_OUT   : std_logic := '0';
	-- SN74677 (Samples)	
--	signal SAMPLE_OUT   : std_logic_vector(15 downto 0) := (others => '0');
--	signal SAMPLE_DATA  : std_logic_vector(15 downto 0) := (others => '0');
   signal SAMPLE_OUT   : std_logic_vector(7 downto 0) := (others => '0');
	signal SAMPLE_DATA  : std_logic_vector(7 downto 0) := (others => '0');
--	signal SAMPLE_ADDR  : std_logic_vector(15 downto 0) := (others => '1');
	signal SAMPLE_ADDR  : std_logic_vector(13 downto 0) := (others => '1');
	signal SAMPLE_END   : std_logic_vector(13 downto 0) := (others => '0');
	signal SAMPLE_PLAY  : std_logic := '0';

begin
	--
	-- Generate work clock for audio (48Khz)
	--
	AudioClock : work.NE555V
	generic map(
	 freq_in  	=> 9987000,
	 freq_out 	=> 48000.0
	)
	port map(
		reset 	=> '1',
		clk_in 	=> CLK,
		clk_out 	=> AUDIO_CLK
	);

	--
	-- Output final wave at this speed 
	--
	WaveClock : work.NE555V
	generic map(
	 freq_in  	=> 9987000,
	 freq_out 	=> 22050.0
	)
	port map(
		reset 	=> '1',
		clk_in 	=> CLK,
		clk_out 	=> WAVE_CLK
	);

	--
	-- Music circuit (74LS273, 2 x 74LS161 & 74LS93)
	-- similar to one in galaxian, different divider chip
	--
	
	process (CLK)
	begin
		if rising_edge(CLK)  then
			if (W_2CD_Q = x"ff") then
				W_2CD_LDn <= '0' ;
			else
				W_2CD_LDn <= '1' ;
			end if;
		end if;
	end process;

	process (I_HCNT)
	begin
		if rising_edge(I_HCNT) then  
			if (W_2CD_LDn = '0') then
				W_2CD_Q <= I_TONE;
			else
				W_2CD_Q <= W_2CD_Q + 1;
			end if;
		end if;
	end process;

	process (W_2CD_LDn)
	begin
		if falling_edge(W_2CD_LDn) then
			W_4E_Q <= W_4E_Q + 1;
		end if;
	end process;

	process (AUDIO_CLK)
	begin
		if rising_edge(AUDIO_CLK) then
			if I_MUSIC_ON='1' then
				MUSIC_OUT <= (W_SDAT1 + W_SDAT2);
			else
				MUSIC_OUT <= (others => '0');
			end if;

			if W_4E_Q(1)='1' then
				W_SDAT1 <= x"2a";
			else
				W_SDAT1 <= (others => '0');
			end if;

			if W_4E_Q(2)='1' then
				W_SDAT2 <= x"69";
			else
				W_SDAT2 <= (others => '0');
			end if;

		end if;
	end process;

	--
	-- Laugh circuit ( 2 x NE555V, first feeds reverse clipped sawtooth to second to act as VCO from about 80Hz to 320hz)
	--	
	-- left feeds 6.8hz square wave to 10uF cap and uses 100k resistor to discharge, high retains charge, drops to 0v when low. (over .01 second)
	-- we use counter to feed delay count to second NE555 to control frequency
	--
	-- original freq is 6.8hz, we want the count to loop that many times a second, so 4488Hz instead (660 count x 6.8 times a second)
	--
	
	left4J : work.NE555V
	generic map(
	 freq_out 	=> 4488.0
	)
	port map(
		reset 	=> '1',
		clk_in 	=> AUDIO_CLK,
		clk_out 	=> W_4J_L_OUT
	);

	process (W_4J_L_OUT)
	begin
		if rising_edge(W_4J_L_OUT) then
			if L_COUNT = 150 then
				L_COUNT <= 810;
			else
				L_COUNT <= L_COUNT - 1;
			end if;
		end if;
	end process;

	-- feed this second NE555 (change the count, change the frequency)
	process (WAVE_CLK)
	begin
		if rising_edge(WAVE_CLK) then			
			if I_LAUGH='0' then				-- I_LAUGH connected to reset
				R_COUNT    <= 0;
				W_4J_R_OUT <= '0';
			elsif R_COUNT = L_STOP then
				R_COUNT <= 0;
				if L_COUNT > 480 then		-- Update stop point for next pass
					L_STOP <= 480;
				else 
					L_STOP <= L_COUNT;
				end if;
				W_4J_R_OUT <= not W_4J_R_OUT;
			else
				R_COUNT <= R_COUNT + 1;
			end if;
		end if;
	end process;
	
	process (WAVE_CLK)
	begin
		if rising_edge(WAVE_CLK) then
			-- 4J right feeds to audio output
			if W_4J_R_OUT='1' then
				LAUGH_OUT <= x"99";
			else
				LAUGH_OUT <= (others => '0');
			end if;
		end if;
	end process;
	
	-- SN74677 (done using samples from my cab)
	
	-- 1 - Appear.wav          1 22050 0000-32A6
	-- 2 - Breath.wav          1 22050 32A7-7340
	-- 3 - Explode.wav         1 22050 7341-893E

--	SN74677_data : work.SAMPLE
--	port map(
--		clk   => WAVE_CLK,
--		addr 	=> SAMPLE_ADDR,
--		data 	=> SAMPLE_DATA
--	);

SN74677_data : work.sfx3
port map(
	clk   => WAVE_CLK,
	addr 	=> SAMPLE_ADDR,
	data 	=> SAMPLE_DATA
);
	
	-- Sample trigger and output
	process (WAVE_CLK)
	begin
		if rising_edge(WAVE_CLK) then
			if I_RESET='0' then
				SAMPLE_PLAY <= '0';
			else
				if SAMPLE_PLAY='0' then
					-- select sample to play (order of priority, it sometimes overlaps them, but only one plays)
--					if I_BREATH='1' then
--						SAMPLE_PLAY <= '1';
--						SAMPLE_ADDR <= x"32A7";
--						SAMPLE_END  <= x"7340";						
--					elsif I_APPEAR='1' then
--						SAMPLE_PLAY <= '1';
--						SAMPLE_ADDR <= x"0000";
--						SAMPLE_END  <= x"32A6";
--					elsif I_EXPLODE='1' then
					if I_EXPLODE='1' then
						SAMPLE_PLAY <= '1';
						SAMPLE_ADDR <= "00000000000000";
						SAMPLE_END  <= "11001100000101";
--						SAMPLE_ADDR <= x"7341";
--						SAMPLE_END  <= x"893E";
					end if;
					SAMPLE_OUT <= (others => '0');
				else
					SAMPLE_OUT <= SAMPLE_DATA;
					
					if SAMPLE_ADDR=SAMPLE_END then
						SAMPLE_PLAY <= '0';
					else
						SAMPLE_ADDR <= SAMPLE_ADDR + '1';
					end if;				
				end if;
			end if;
		end if;
	end process;
		
	-- Audio Output - max 2 at once, so just add them together
	process (WAVE_CLK,MUSIC_OUT,LAUGH_OUT,SAMPLE_OUT)
	variable Music, Laugh, Sample : integer;
	begin
		if rising_edge(WAVE_CLK) then			
			Music  := to_integer(unsigned(MUSIC_OUT & "0000000"));
			Laugh  := to_integer(unsigned(LAUGH_OUT & "0000000"));
			Sample := to_integer(signed(SAMPLE_OUT & SAMPLE_OUT));
		
			O_AUDIO <= std_logic_vector(to_signed(Music + Laugh + Sample,16));
		end if;
	end process;

end architecture RTL;
