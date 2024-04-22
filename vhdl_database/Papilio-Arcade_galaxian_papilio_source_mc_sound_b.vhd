--------------------------------------------------------------------------------
---- FPGA MOONCRESTA WAVE SOUND
----
---- Version : 1.00
----
---- Copyright(c) 2004 Katsumi Degawa , All rights reserved
----
---- Important !
----
---- This program is freeware for non-commercial use. 
---- The author does no guarantee this program.
---- You can use this at your own risk.
----
--------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity MC_SOUND_B is
	port(
		I_CLK1    : in  std_logic;   --  18MHz
		I_CLK2    : in  std_logic;   --   6MHz
		I_RSTn    : in  std_logic;
		I_SW      : in  std_logic_vector( 2 downto 0);
		I_WAV_D0  : in  std_logic_vector( 7 downto 0);
		I_WAV_D1  : in  std_logic_vector( 7 downto 0);
		I_WAV_D2  : in  std_logic_vector( 7 downto 0);
		O_SDAT    : out std_logic_vector( 7 downto 0);
		O_WAV_A0  : out std_logic_vector(18 downto 0);
		O_WAV_A1  : out std_logic_vector(18 downto 0);
		O_WAV_A2  : out std_logic_vector(18 downto 0)
	);
end;

architecture RTL of MC_SOUND_B is

constant sample_time : integer := 1670;    -- sample time : 1670 = 11025Hz, 1670/2 = 22050Hz
constant fire_cnt    : std_logic_vector(13 downto 0) := "11"& x"FF0"; --14'h3FF0;
constant hit_cnt     : std_logic_vector(15 downto 0) := x"A830";
constant effect_cnt  : std_logic_vector(15 downto 0) := x"BFC0";

signal sample     : std_logic_vector(9 downto 0) := (others => '0');
signal sample_pls : std_logic := '0';
signal fire_ad    : std_logic_vector(13 downto 0) := (others => '0');
signal s0_trg_ff  : std_logic_vector( 1 downto 0) := (others => '0');
signal s0_trg     : std_logic := '0';
signal s0_play    : std_logic := '0';
signal hit_ad     : std_logic_vector(15 downto 0) := (others => '0');
signal s1_trg_ff  : std_logic_vector( 1 downto 0) := (others => '0');
signal s1_trg     : std_logic := '0';
signal s1_play    : std_logic := '0';
signal effect_ad  : std_logic_vector(15 downto 0) := (others => '0');
signal mix_1      : std_logic_vector( 8 downto 0) := (others => '0');
signal mix0       : std_logic_vector( 8 downto 0) := (others => '0');
signal mix_0      : std_logic_vector( 8 downto 0) := (others => '0');
signal W_WAV_D0   : std_logic_vector( 7 downto 0) := (others => '0');
signal W_WAV_D1   : std_logic_vector( 7 downto 0) := (others => '0');
signal W_WAV_D2   : std_logic_vector( 7 downto 0) := (others => '0');
signal mix1       : std_logic_vector( 8 downto 0) := (others => '0');

begin
	W_WAV_D0 <= I_WAV_D0;
	W_WAV_D1 <= I_WAV_D1;
	W_WAV_D2 <= I_WAV_D2;
	mix1     <= mix0(7 downto 0) + W_WAV_D2 & '0'; 

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			sample     <= (others => '0');
			sample_pls <= '0';
		elsif rising_edge(I_CLK1) then
			if (sample = sample_time - 1) then
				sample     <= (others => '0');
				sample_pls <= '1';
			else
				sample     <= sample + 1;
				sample_pls <= '0';
			end if;
		end if;
	end process;

-------------  FIRE SOUND ------------------------------------------

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			s0_trg_ff    <= (others => '0');
			s0_trg       <= '0';
		elsif rising_edge(I_CLK1) then
			s0_trg_ff(0) <= I_SW(0);
			s0_trg_ff(1) <= s0_trg_ff(0);
			s0_trg       <= not s0_trg_ff(1) and s0_trg_ff(0) and not s0_play;
		end if;
	end process;

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			s0_play <= '0';
		elsif rising_edge(I_CLK1) then
			if (fire_ad = fire_cnt - 1) then
				s0_play <= '1';
			else
				s0_play <= '0';
			end if;
		end if;
	end process;

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			fire_ad <= fire_cnt;
		elsif rising_edge(I_CLK1) then
			if (s0_trg = '1') then
				fire_ad <= (others => '0');
			else
				if(sample_pls = '1') then
					if(fire_ad <= fire_cnt) then
						fire_ad <= fire_ad + 1;
					else
						fire_ad <= fire_ad ;
					end if;
				end if;
			end if;
		end if;
	end process;

-------------  HIT SOUND ------------------------------------------

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			s1_trg_ff    <= (others => '0');
			s1_trg       <= '0';
		elsif rising_edge(I_CLK1) then
			s1_trg_ff(0) <= I_SW(1);
			s1_trg_ff(1) <= s1_trg_ff(0);
			s1_trg       <= not s1_trg_ff(1) and s1_trg_ff(0) and not s1_play;
		end if;
	end process;

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			s1_play <= '0';
		elsif rising_edge(I_CLK1) then
			if(hit_ad <= hit_cnt - 1) then
				s1_play <= '1';
			else
				s1_play <= '0';
			end if;
		end if;
	end process;

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			hit_ad <= hit_cnt;
		elsif rising_edge(I_CLK1) then
			if (s1_trg = '1') then
				hit_ad <= (others => '0');
			else
				if (sample_pls = '1') then
					if (hit_ad <= hit_cnt) then
						hit_ad <= hit_ad + 1 ;
					else
						hit_ad <= hit_ad ;
					end if;
				end if;
			end if;
		end if;
	end process;

-------------  EFFECT SOUND ---------------------------------------

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			effect_ad <= effect_cnt;
		elsif rising_edge(I_CLK1) then
			if (I_SW(2) = '1') then
				if (sample_pls = '1') then
					if (effect_ad >= effect_cnt) then
						effect_ad <= (others => '0');
					else
						effect_ad <= effect_ad + 1;
					end if;
				end if;
			else
				effect_ad <= effect_cnt;
			end if;     
		end if;     
	end process;

	O_WAV_A0 <= "00100" & fire_ad;
--FIXME: assign O_WAV_A1 = {3'h1,4'h4+hit_ad[15:12],hit_ad[11:0]};
	O_WAV_A1 <= "100"   & hit_ad(15 downto 12) & hit_ad(11 downto 0);
	O_WAV_A2 <= "010"   & effect_ad;

--   sound mix
	mix0 <= W_WAV_D0 + W_WAV_D1 & '0';

	process(I_CLK1)
	begin
		if rising_edge(I_CLK1) then
			if(mix0 >= 383) then    -- POS Limiter
				mix_0 <= "0" &x"FF";
			else
				if(mix0 <= 128) then  -- NEG Limiter
					mix_0 <= (others => '0');
				else
					mix_0 <= mix0 - 128; 
				end if;
			end if;
		end if;
	end process;

	process(I_CLK1)
	begin
		if rising_edge(I_CLK1) then
			if(mix1 >= 383) then    -- POS Limiter
				mix_1 <= '0' & x"FF";
			else
				if(mix1 <= 128) then  -- NEG Limiter
					mix_1 <= (others => '0');
				else
					mix_1 <= mix1 - 128; 
				end if;
			end if;
		end if;
	end process;

	O_SDAT <= mix_1(7 downto 0);

end RTL;
