
-- Version : 0300
-- The latest version of this file can be found at:
--      http://www.fpgaarcade.com
-- minor tidy up by MikeJ
-------------------------------------------------------------------------------
-- Major re-write by Grant Searle to make the sounds accurate with real hardware
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity invaders_audio is
	Port (
	  Clk : in  std_logic;
	  P3  : in  std_logic_vector(5 downto 0);
	  P5  : in  std_logic_vector(5 downto 0);
	  Aud : out std_logic_vector(7 downto 0)
	  );
end;
 --* Port 3: (S1)
 --* bit 0=UFO  (repeats)
 --* bit 1=Shot
 --* bit 2=Base hit
 --* bit 3=Invader hit
 --* bit 4=Bonus base
 --*
 --* Port 5: (S2)
 --* bit 0=Fleet movement 1
 --* bit 1=Fleet movement 2
 --* bit 2=Fleet movement 3
 --* bit 3=Fleet movement 4
 --* bit 4=UFO 2

architecture Behavioral of invaders_audio is

	signal tempsum      : std_logic_vector(7 downto 0);

	signal aud_mix		: std_logic_vector(9 downto 0);

	signal noiseShift   : std_logic_vector(16 downto 0) := (others => '1');
  
	signal noiseClockCount : std_logic_vector(9 downto 0);
	signal noiseClk : std_logic;
	signal noise : std_logic;
	signal lfNoise : std_logic;

	signal saucerClkCount : std_logic_vector(15 downto 0) := (others => '0');
	signal saucerClkInc : std_logic_vector(7 downto 0):= (others => '0');
	signal saucerVol : std_logic_vector(7 downto 0):= (others => '0');
	signal saucerSound : std_logic_vector(7 downto 0):= (others => '0');
	signal saucerLFODir : std_logic;

	signal saucerHitClkCount : std_logic_vector(15 downto 0) := (others => '0');
	signal saucerHitClkInc : std_logic_vector(7 downto 0):= (others => '0');
	signal saucerHitVol : std_logic_vector(7 downto 0):= (others => '0');
	signal saucerHitSound : std_logic_vector(7 downto 0):= (others => '0');
	signal saucerHitLFODir : std_logic := '1';
	
	signal invaderHitClkCount : std_logic_vector(15 downto 0) := (others => '0');
	signal invaderHitClkInc : std_logic_vector(7 downto 0):= (others => '0');
	signal invaderHitVol : std_logic_vector(7 downto 0):= (others => '0');
	signal invaderHitSound : std_logic_vector(7 downto 0):= (others => '0');
	signal invaderHitLFODir : std_logic := '1';

	signal invaderMoveClkCount : std_logic_vector(17 downto 0) := (others => '0'); --18 bit
	signal invaderMoveClkInc : std_logic_vector(7 downto 0):= (others => '0');
	signal invaderMoveVol : std_logic_vector(7 downto 0):= (others => '0');
	signal invaderMoveSound : std_logic_vector(7 downto 0):= (others => '0');

	signal explosionVol : std_logic_vector(7 downto 0):= (others => '0');
	signal explosionSound : std_logic_vector(7 downto 0):= (others => '0');
	signal missileVol : std_logic_vector(7 downto 0):= (others => '0');
	signal missileSound : std_logic_vector(7 downto 0):= (others => '0');
	
	signal extraBaseClkCount : std_logic_vector(15 downto 0) := (others => '0');
	signal extraBaseClkInc : std_logic_vector(7 downto 0):= (others => '0');
	signal extraBaseVol : std_logic_vector(7 downto 0):= (others => '0');
	signal extraBaseSound : std_logic_vector(7 downto 0):= (others => '0');

	signal extraBaseClk : std_logic_vector(3 downto 0) := (others => '0');
	
   signal div666667 : std_logic_vector(4 downto 0):= (others => '0');
	signal clk666667 : std_logic;
	
   signal div10ms : std_logic_vector(16 downto 0):= (others => '0');
	signal clk10ms : std_logic; -- 100 Hz
	
	signal p3_1_prev : std_logic  := '0';
	signal p3_2_prev : std_logic  := '0';
	signal p3_3_prev : std_logic  := '0';
	signal p3_4_prev : std_logic  := '0';
	
begin

	-- Master clock for NCOs etc
	-- NCOs will use 16 bit counters so
	-- frequency = 10 * increment (within 10%)
	-- (18 bit, f=2.5*inc for low-freq invader moves)
	-- range 0 to 2.5KHz with 8 bit increment
	-- noise clock is 10KHz
	process (clk) -- 10MHz input clock
	begin
		if rising_edge(clk) then
			if div666667<14 then
				div666667 <= div666667+1;
			else
				div666667 <= (others => '0');
			end if;
			if div666667 < 7 then
				clk666667 <= '0';
			else
				clk666667 <= '1';
			end if;

			if noiseClockCount < 999 then
				noiseClockCount <= noiseClockCount+1;
			else
				noiseClockCount <= (others => '0');
			end if;
			if (noiseClockCount<500) then
				noiseClk <= '0';
			else
				noiseClk <= '1';
			end if;

			if div10ms < 99998 then
				div10ms <= div10ms+1;
			else
				div10ms <= (others => '0');
			end if;
			if (div10ms<50000) then
				clk10ms <= '0';
			else
				clk10ms <= '1';
			end if;	
		end if;

	end process;

	-- NCO's
	-- Frequency out is top bit of each
	process (clk666667)
	begin
		if rising_edge(clk666667) then
			saucerClkCount <= saucerClkCount+saucerClkInc;
			saucerHitClkCount <= saucerHitClkCount+saucerHitClkInc;
			invaderHitClkCount <= invaderHitClkCount+invaderHitClkInc;
			invaderMoveClkCount <= invaderMoveClkCount+invaderMoveClkInc;
			extraBaseClkCount <= extraBaseClkCount+extraBaseClkInc;
		end if;
	end process;

	extraBaseClkInc <= "00110000"; -- 48 = 480Hz
	
	saucerVol <= "01100100" when P3(0) = '1' else (others=>'0');
	
	saucerSound <= saucerVol when saucerClkCount(15)='1' else (others=>'0');
	saucerHitSound <= saucerHitVol when saucerHitClkCount(15)='1' else (others=>'0');
	invaderHitSound <= invaderHitVol when invaderHitClkCount(15)='1' else (others=>'0');
	invaderMoveSound <= invaderMoveVol when invaderMoveClkCount(17)='1' else (others=>'0');
	extraBaseSound <= extraBaseVol when extraBaseClkCount(15)='1' else (others=>'0');

	missileSound <= missileVol when noise='1' else (others=>'0');
	explosionSound <= explosionVol when lfNoise='1' else (others=>'0');
	
	-- max 6 sounds active at once
    Aud_mix <= ("00" & saucerSound) + ("00" & saucerHitSound) + ("00" & invaderHitSound) 
	      + ("00" & invaderMoveSound) + ("00" & missileSound) + ("00" & explosionSound) + ("00" & extraBaseSound);

	 aud <= aud_mix(9 downto 2); -- Keep the output width the same as the original audio code	
	
	-- Implement a Pseudo Random Noise Generator - same as schematic
	process (noiseClk)
	begin
	  if rising_edge(noiseClk) then
		  noiseShift <= (noiseShift(12) xor noiseShift(0)) & noiseShift (16 downto 1);
		  noise <= noiseShift(4);
		  if noiseShift(4)='1' and noiseShift(3) = '1' and noiseShift(2)='1' then
			lfNoise <= '1';
		  end if;
		  if noiseShift(4)='0' and noiseShift(3) = '0' and noiseShift(2)='0' then
			lfNoise <= '0';
		  end if;
		end if;
	end process;
	

	-- Triangular LFOs for the main oscillators
	process (clk10ms)
	begin
		if rising_edge(clk10ms) then

		-- Saucer high=1khz, low=250Hz, duration = 180ms
		-- inc/dec = (1000-250)/90 = 8.3
			if saucerLFODir = '1' then
				saucerClkInc <= saucerClkInc + 8;
			else
				saucerClkInc <= saucerClkInc - 8;
			end if;
			if saucerClkInc < 25 then
				saucerClkInc <= "00011001";
				saucerLFODir <= '1';
			end if;
			if saucerClkInc > 100 then
				saucerClkInc <= "01100100";
				saucerLFODir <= '0';
			end if;

		-- Saucer hit high=1.25khz, low=220Hz, duration = 130ms
		-- inc/dec = (1250-220)/65 = 15.8
			if saucerHitLFODir = '1' then
				saucerHitClkInc <= saucerHitClkInc + 16;
			else
				saucerHitClkInc <= saucerHitClkInc - 16;
			end if;
			if saucerHitClkInc < 22 then
				saucerHitClkInc <= "00010110";
				saucerHitLFODir <= '1';
			end if;
			if saucerHitClkInc > 125 then
				saucerHitClkInc <= "01111101";
				saucerHitLFODir <= '0';
			end if;

			-- Sawtooth for invader hit
			-- 60ms duration, high=1.7KHz, low = 300Hz
			-- decrement = (1700-300)/60x10=23
			if invaderHitClkInc > 30  then
				invaderHitClkInc <= invaderHitClkInc - 23;
			else
				invaderHitClkInc <= "10110100";
			end if;

		end if;
	end process;


	-- Saucer hit decay time = 400ms
	-- decay val = 100 x 10/400 = 2.5
	process(P5(4),clk10ms)
	begin
	  if (P5(4) = '1') then
			saucerHitVol <= "01100100"; --100
		elsif rising_edge(clk10ms) then
			if saucerHitVol>3 then
				saucerHitVol<=saucerHitVol-3;
			else
				saucerHitVol<= (others =>'0');
			end if;
		end if;
	end process;

	-- Invader hit decay time = 300ms
	-- decay val = 100 x 10/300 = 3.3
	process(P3(3),clk10ms)
	begin
	  if (P3(3) = '1' and p3_3_prev = '0') then
			invaderHitVol <= "01100100"; --100
			p3_3_prev <= '1';
		elsif rising_edge(clk10ms) then
			if invaderHitVol>3 then
				invaderHitVol<=invaderHitVol-3;
			else
				invaderHitVol<= (others =>'0');
			end if;
			p3_3_prev <= P3(3);
		end if;
	end process;
	
	-- Explosion decay time = 1000ms
	-- decay val = 100 x 10/1000 = 1
	process(P3(2),clk10ms)
	begin
	  if (P3(2) = '1' and p3_2_prev = '0') then
			explosionVol <= "01100100"; --100
			p3_2_prev <= '1';
		elsif rising_edge(clk10ms) then
			if explosionVol>1 then
				explosionVol<=explosionVol-1;
			else
				explosionVol<= (others =>'0');
			end if;
			p3_2_prev <= P3(2);
		end if;
		
	end process;

	-- Missile decay time = 1000ms
	-- decay val = 100 x 10/1000 = 1
	process(P3(1),clk10ms)
	begin
	  if (P3(1) = '1' and p3_1_prev = '0') then
			missileVol <= "01100100"; --100
			p3_1_prev <= '1';
		elsif rising_edge(clk10ms) then
			if missileVol>1 then
				missileVol<=missileVol-1;
			else
				missileVol<= (others =>'0');
			end if;
			p3_1_prev <= P3(1);
		end if;
		
	end process;

	-- bonus base - pulsed 100ms on, 30ms off
	process(P3(4),clk10ms)
	begin
	  if (P3(4) = '1' and p3_4_prev = '0') then
			extraBaseClk <= "0000";
			p3_4_prev <= '1';
		elsif rising_edge(clk10ms) then
			if P3(4) = '1' then
				extraBaseClk <= extraBaseClk+1;

				if extraBaseClk < 10 then -- tone for first 100ms then silence
					extraBaseVol  <= "01100100"; --100
				else
					extraBaseVol<= (others =>'0');
				end if;

				if extraBaseClk > 12 then -- reset every 130ms
					extraBaseClk <= "0000";
				end if;
			else
				extraBaseVol<= (others =>'0');
			end if;
			p3_4_prev <= P3(4);
		end if;
		
	end process;
	
	
	invaderMoveVol <= "01100100" when P5 /= "0000" else (others=>'0');

	-- invaders = 68,75,80,93Hz
	with P5(3 downto 0) select
		invaderMoveClkInc <= x"25" when "0001",
				  x"20" when "0010",
				  x"1E" when "0100",
				  x"1B" when "1000",
				  x"00" when others;


end Behavioral;
