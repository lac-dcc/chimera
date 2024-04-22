
-- Version : 0300
-- The latest version of this file can be found at:
--      http://www.fpgaarcade.com
-- minor tidy up by MikeJ
-------------------------------------------------------------------------------
-- Company:
-- Engineer:    PaulWalsh
--
-- Create Date:    08:45:29 11/04/05
-- Design Name:
-- Module Name:    Invaders Audio
-- Project Name:   Space Invaders
-- Target Device:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity invaders_audio is
	Port (
	  Clk : in  std_logic;
	  S0  : in  std_logic_vector(5 downto 0);
	  S1  : in  std_logic_vector(5 downto 0);
	  S2  : in  std_logic_vector(5 downto 0);
	  S3  : in  std_logic_vector(5 downto 0);
	  Aud : out std_logic_vector(7 downto 0)
	  );
end;
 --* Port 3: (S0)
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

  signal ClkDiv       : unsigned(10 downto 0) := (others => '0');
  signal ClkDiv2      : std_logic_vector(7 downto 0) := (others => '0');
  signal Clk7680_ena  : std_logic;
  signal Clk480_ena   : std_logic;
  signal Clk240_ena   : std_logic;
  signal Clk60_ena    : std_logic;

  signal s0_t1        : std_logic_vector(5 downto 0);
  signal s2_t1        : std_logic_vector(5 downto 0);
  signal tempsum      : std_logic_vector(7 downto 0);

  signal vco_cnt      : std_logic_vector(3 downto 0);

  signal TriDir1      : std_logic;
  signal Fnum         : std_logic_vector(3 downto 0);
  signal comp         : std_logic;

  signal SS           : std_logic;

  signal TrigSH       : std_logic;
  signal SHCnt        : std_logic_vector(8 downto 0);
  signal SH           : std_logic_vector(7 downto 0);
  signal SauHit       : std_logic_vector(8 downto 0);
  signal SHitTri      : std_logic_vector(5 downto 0);

  signal TrigIH       : std_logic;
  signal IHDir        : std_logic;
  signal IHDir1       : std_logic;
  signal IHCnt        : std_logic_vector(8 downto 0);
  signal IH           : std_logic_vector(7 downto 0);
  signal InHit        : std_logic_vector(8 downto 0);
  signal IHitTri      : std_logic_vector(5 downto 0);

  signal TrigEx       : std_logic;
  signal Excnt        : std_logic_vector(9 downto 0);
  signal ExShift      : std_logic_vector(15 downto 0);
  signal Ex           : std_logic_vector(2 downto 0);
  signal Explo        : std_logic;

  signal TrigMis      : std_logic;
  signal MisShift     : std_logic_vector(15 downto 0);
  signal MisCnt       : std_logic_vector(8 downto 0);
  signal miscnt1      : unsigned(7 downto 0);
  signal Mis          : std_logic_vector(2 downto 0);
  signal Missile      : std_logic;

  signal EnBG         : std_logic;
  signal BGFnum       : std_logic_vector(7 downto 0);
  signal BGCnum       : std_logic_vector(7 downto 0);
  signal bg_cnt       : unsigned(7 downto 0);
  signal BG           : std_logic;

begin

  -- do a crude addition of all sound samples
	p_audio_mix : process
	  variable IHVol : std_logic_vector(6 downto 0);
	  variable SHVol : std_logic_vector(6 downto 0);
	begin
	  wait until rising_edge(Clk);

	  IHVol(6 downto 0) := InHit(6 downto 0) and IH(6 downto 0);
	  SHVol(6 downto 0) := SauHit(6 downto 0) and SH(6 downto 0);

	  tempsum(7 downto 0) <= ('0' & IHVol) + ('0' & SHVol);

	  Aud(7) <= tempsum (7);
	  Aud(6) <= tempsum (6) xor (Mis(2) and Missile) xor  (Ex(2) and Explo) xor BG;
	  Aud(5) <= tempsum (5) xor (Mis(1) and Missile) xor  (Ex(1) and Explo) xor SS;
	  Aud(4) <= tempsum (4) xor (Mis(0) and Missile) xor  (Ex(0) and Explo);
	  Aud(3 downto 0) <= tempsum (3 downto 0);

	end process;

	p_clkdiv : process
	begin
	  wait until rising_edge(Clk);
	  Clk7680_ena <= '0';
	  if ClkDiv =  1277 then
		Clk7680_ena <= '1';
		ClkDiv <= (others => '0');
	  else
		ClkDiv <= ClkDiv + 1;
	  end if;
	end process;

	p_clkdiv2 : process
	begin
	  wait until rising_edge(Clk);
	  Clk480_ena <= '0';
	  Clk240_ena <= '0';
	  Clk60_ena  <= '0';

	  if (Clk7680_ena = '1') then
		ClkDiv2 <= ClkDiv2 + 1;

		if (ClkDiv2(3 downto 0) = "0000") then
		  Clk480_ena <= '1';
		end if;

		if (ClkDiv2(4 downto 0) = "00000") then
		  Clk240_ena <= '1';
		end if;

		if (ClkDiv2(7 downto 0) = "00000000") then
		  Clk60_ena <= '1';
		end if;

	  end if;
	end process;

   p_delay : process
   begin
	 wait until rising_edge(Clk);
	 s0_t1 <= S0;
	 s2_t1 <= S2;
   end process;
--*************************Saucer Sound***************************************

-- Implement a VCOscilator: frequency is set using counter end point(Fnum)
	p_saucer_vco : process
	  variable term : std_logic_vector(3 downto 0);
	begin
	  wait until rising_edge(Clk);
	  term := 8 + Fnum;
	  if (S0(0) = '1') and (Clk7680_ena = '1') then
		if vco_cnt = term then

		  vco_cnt <= (others => '0');
		  SS <= not SS;
		else
		  vco_cnt <= vco_cnt + 1;
		end if;
	  end if;
	end process;

-- Implement a 5.3Hz trianglular wave LFO control the Variable oscilator
	-- this is 6Hz ?? 0123454321
	p_saucer_lfo : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk60_ena = '1') then
		if Fnum = 4 then -- 5 -1
		  Comp <= '1';
		elsif Fnum = 1 then -- 0 +1
		  Comp <= '0';
		end if;

		if comp = '1' then
		  Fnum <= Fnum - 1 ;
		else
		  Fnum <= Fnum + 1 ;
		end if;
	  end if;
	end process;

--**********************SAUCER HIT Sound**************************

-- Implement a 10Hz saw tooth LFO to control the Saucer Hit VCO
	p_saucer_hit_vco : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk480_ena = '1') then
		if SHitTri = 48 then
		  SHitTri <= "000000";
		else
		  SHitTri <= SHitTri+1;
		end if;
	  end if;
	end process;

-- Implement a trianglular wave VCO for Saucer Hit      200Hz to 1kHz approx
	p_saucer_hit_lfo : process
	begin
	 wait until rising_edge(Clk);
	 if (Clk7680_ena = '1') then
			if TriDir1 = '1' then
				if (SauHit +58 - SHitTri) < 190 + 256 then
					SauHit <= SauHit +58 - SHitTri;
				else
					SauHit <= "110111110";
					TriDir1 <= '0';
				end if;
			else
				if (SauHit -58 + SHitTri) > 256 then
					SauHit <= SauHit -58 + SHitTri;
				else
					SauHit <= "100000000";
					TriDir1 <= '1';
				end if;
			end if;
	end if;
  end process;

-- Implement the ADSR for Saucer Hit Sound
	p_saucer_adsr : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk480_ena = '1') then
		if (TrigSH = '1') then
		  SHCnt <= "100000000";
		  SH <= "11111111";
		elsif (SHCnt(8) = '1') then
		  SHCnt <= SHCnt + "1";
		  if SHCnt(7 downto 0) = x"60" then -- 96
			SH <= "01111111";
		  elsif SHCnt(7 downto 0) = x"90" then -- 144
			SH <= "00111111";
		  elsif SHCnt(7 downto 0) = x"C0" then -- 192
			SH <= "00000000";
		  end if;
		end if;
	  end if;
	end process;

 -- Implement the trigger for The Saucer Hit Sound
	p_saucer_hit : process
	begin
	  wait until rising_edge(Clk);
	  if (S2(4) = '1') and (s2_t1(4) = '0') then -- rising_edge
		TrigSH <= '1';
	  elsif (Clk480_ena = '1') then
		TrigSH <= '0';
	  end if;
	end process;

--***********************Invader Hit Sound*****************************
-- Implement a 5Hz Triangular Wave LFO to control the Invaders Hit VCO
	p_invader_hit_lfo : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk480_ena = '1') then
		if IHitTri = 48-2 then
		  IHDir <= '0';
		elsif IHitTri =0+2 then
		  IHDir <= '1';
		end if;

		if IHDir ='1' then
		  IHitTri <= IHitTri + 2;
		else
		  IHitTri <= IHitTri - 2;
		end if;
	  end if;
	end process;

-- Implement a trianglular wave VCO for Invader Hit     700Hz to 3kHz approx
	p_invader_hit_vco : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk7680_ena = '1') then
		if IHDir1 = '1' then
		  if (InHit +10 + IHitTri) < 110 + 256 then
			 InHit <= InHit +10 + IHitTri;
		   else
			 InHit <= "101101110";
			 IHDir1 <= '0';
		   end if;
		else
		  if (InHit -10 - IHitTri) > 256 then
			 InHit <= InHit -10 - IHitTri;
		  else
			 InHit <= "100000000";
			 IHDir1 <= '1';
		  end if;
		end if;
	  end if;
	end process;

-- Implement the ADSR for Invader Hit Sound
	p_invader_adsr : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk480_ena = '1') then
		if (TrigIH = '1') then
		  IHCnt <= "100000000";
		  IH <= "11111111";
		elsif (IHCnt(8) = '1') then
		  IHCnt <= IHCnt + "1";
		  if IHCnt(7 downto 0) = x"14" then -- 20
			IH <= "01111111";
		  elsif IHCnt(7 downto 0) = x"1C" then -- 28
			IH <= "11111111";
		  elsif IHCnt(7 downto 0) = x"30" then -- 48
			IH <= "00000000";
		  end if;
		end if;
	  end if;
	end process;

  -- Implement the trigger for The Invader Hit Sound
	p_invader_hit : process
	begin
	  wait until rising_edge(Clk);
	  if (S0(3) = '1') and (s0_t1(3) = '0') then -- rising_edge
		TrigIH <= '1';
	  elsif (Clk480_ena = '1') then
		TrigIH <= '0';
	  end if;
	end process;

--***********************Explosion*****************************
-- Implement a Pseudo Random Noise Generator
	p_explosion_pseudo : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk480_ena = '1') then
		if (ExShift = x"0000") then
		  ExShift <= "0000000010101001";
		else
		  ExShift(0) <= Exshift(14) xor ExShift(15);
		  ExShift(15 downto 1)  <= ExShift (14 downto 0);
		end if;
	  end if;
	end process;
	Explo <= ExShift(0);

	p_explosion_adsr : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk480_ena = '1') then
		if (TrigEx = '1') then
		  ExCnt <= "1000000000";
		  Ex <= "100";
		elsif (ExCnt(9) = '1') then
		  ExCnt <= ExCnt + "1";
		  if ExCnt(8 downto 0) = '0' & x"64" then -- 100
			Ex <= "010";
		  elsif ExCnt(8 downto 0) = '0' & x"c8" then -- 200
			Ex <= "001";
		  elsif ExCnt(8 downto 0) = '1' & x"2c" then -- 300
			Ex <= "000";
		  end if;
		end if;
	  end if;
	end process;

-- Implement the trigger for The Explosion Sound
	p_explosion_trig : process
	begin
	  wait until rising_edge(Clk);
	  if (S0(2) = '1') and (s0_t1(2) = '0') then -- rising_edge
		TrigEx <= '1';
	  elsif (Clk480_ena = '1') then
		TrigEx <= '0';
	  end if;
	end process;

--***********************Missile*****************************
-- Implement a Pseudo Random Noise Generator
	p_missile_pseudo : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk7680_ena = '1') then
		if (MisShift = x"0000") then
		  MisShift <= "0000000010101001";
		else
		  MisShift(0) <= MisShift(14) xor MisShift(15);
		  MisShift(15 downto 1)  <= MisShift (14 downto 0);
		end if;

		miscnt1 <= miscnt1 + 20 + unsigned(MisShift(2 downto 0));
		if miscnt1 > 60 then
		  miscnt1 <= "00000000";
		  Missile <= not Missile;
		end if;

	  end if;
	end process;

-- Implement the ADSR for The Missile Sound
	p_missile_adsr : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk480_ena = '1') then
		if (TrigMis = '1') then
		  MisCnt <= "100000000";
		  Mis <= "100";
		elsif (MisCnt(8) = '1') then
		  MisCnt <= MisCnt + "1";
		  if MisCnt(7 downto 0) = x"4b" then -- 75
			Mis <= "010";
		  elsif MisCnt(7 downto 0) = x"70" then -- 112
			Mis <= "001";
		  elsif MisCnt(7 downto 0) = x"96" then -- 150
			Mis <= "000";
		  end if;
		end if;
	  end if;
	end process;

-- Implement the trigger for The Missile Sound
	p_missile_trig : process
	begin
	  wait until rising_edge(Clk);
	  if (S0(1) = '1') and (s0_t1(1) = '0') then -- rising_edge
		TrigMis <= '1';
	  elsif (Clk480_ena = '1') then
		TrigMis <= '0';
	  end if;
	end process;

-- ******************************** Background invader moving tones **************************
	EnBG <= S2(0) or S2(1) or S2(2) or S2(3);

	with S2(3 downto 0) select
		BGFnum <= x"66" when "0001",
				  x"74" when "0010",
				  x"7C" when "0100",
				  x"87" when "1000",
				  x"87" when others;

	with S2(3 downto 0) select
		BGCnum <= x"33" when "0001",
				  x"3A" when "0010",
				  x"3E" when "0100",
				  x"43" when "1000",
				  x"43" when others;

-- Implement a Variable Oscilator: set frequency using counter mid(Cnum) and end points(Fnum)

	p_background : process
	begin
	  wait until rising_edge(Clk);
	  if (Clk7680_ena = '1') then
		if EnBG = '0' then
		  bg_cnt <= x"00";
		  BG <= '0';
		else
		  bg_cnt <= bg_cnt + 1;

		  if bg_cnt = unsigned(BGfnum) then
			bg_cnt <= x"00";
			BG  <= '0';
		  elsif bg_cnt=unsigned(BGCnum) then
			BG <='1';
		  end if;
		end if;
	  end if;
	end process;

end Behavioral;
