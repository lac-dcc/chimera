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

--pragma translate_off
--	use ieee.std_logic_textio.all;
--	use std.textio.all;
--pragma translate_on

entity MC_SOUND_B is
	port(
		I_CLK1    : in  std_logic;   --  6MHz
		I_RSTn    : in  std_logic;
		I_SW      : in  std_logic_vector( 2 downto 0);
		I_DAC     : in  std_logic_vector( 3 downto 0);
		I_FS      : in  std_logic_vector( 2 downto 0);
		O_SDAT    : out std_logic_vector( 7 downto 0)
	);
end;

architecture RTL of MC_SOUND_B is
constant sample_time : integer := 557;    -- sample time : 557 = 11025Hz, 557/2 = 22050Hz
constant fire_cnt    : std_logic_vector(15 downto 0) := x"2000";
constant hit_cnt     : std_logic_vector(15 downto 0) := x"2000";

signal sample     : std_logic_vector(10 downto 0) := (others => '0');
signal sample_pls : std_logic := '0';
signal s0_trg_ff  : std_logic_vector( 1 downto 0) := (others => '0');
signal s0_trg     : std_logic := '0';
signal s1_trg_ff  : std_logic_vector( 1 downto 0) := (others => '0');
signal s1_trg     : std_logic := '0';
signal fire_addr  : std_logic_vector(15 downto 0) := (others => '0');
signal hit_addr   : std_logic_vector(15 downto 0) := (others => '0');

signal WAV_D0     : std_logic_vector( 7 downto 0) := (others => '0');
signal WAV_D1     : std_logic_vector( 7 downto 0) := (others => '0');

signal W_VCO1_STEP: std_logic_vector( 7 downto 0) := (others => '0');
signal W_VCO2_STEP: std_logic_vector( 7 downto 0) := (others => '0');
signal W_VCO3_STEP: std_logic_vector( 7 downto 0) := (others => '0');
signal W_VCO1_OUT : std_logic_vector( 7 downto 0) := (others => '0');
signal W_VCO2_OUT : std_logic_vector( 7 downto 0) := (others => '0');
signal W_VCO3_OUT : std_logic_vector( 7 downto 0) := (others => '0');
signal VCO_CTR    : std_logic_vector(24 downto 0) := (others => '0');

signal SDAT      : std_logic_vector(10 downto 0) := (others => '0');

begin
	-- ideally we should divide by 5 because this is the sum of 5 channels
	-- but in practice we divide by 4 and just clip sounds that are too loud.
	O_SDAT <= SDAT(9 downto 2) when SDAT(10) = '0' else (others=>'1'); -- clip overrange sounds

	process(I_CLK1)
	begin
		if rising_edge(I_CLK1) then
			SDAT <=  ("000" & W_VCO3_OUT) + ( ( ("000" & W_VCO2_OUT) + ("000" & W_VCO1_OUT) ) + ( ("000" & WAV_D0) + ("000" & WAV_D1) ) );
		end if;
	end process;

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
	mc_roms_fire : entity work.GAL_FIR
	port map (
		CLK  => I_CLK1,
		ADDR => fire_addr(12 downto 0),
		DATA => WAV_D0
	);

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			s0_trg_ff    <= (others => '0');
			s0_trg       <= '0';
		elsif rising_edge(I_CLK1) then
			s0_trg_ff(0) <= I_SW(0);
			s0_trg_ff(1) <= s0_trg_ff(0);
			s0_trg       <= not s0_trg_ff(1) and s0_trg_ff(0);
		end if;
	end process;

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			fire_addr <= fire_cnt;
		elsif rising_edge(I_CLK1) then
			if (s0_trg = '1') then
				fire_addr <= (others => '0');
			else
				if(sample_pls = '1') then
					if(fire_addr <= fire_cnt) then
						fire_addr <= fire_addr + 1;
					else
						fire_addr <= fire_addr ;
					end if;
				end if;
			end if;
		end if;
	end process;

-------------  HIT SOUND ------------------------------------------
	mc_roms_hit : entity work.GAL_HIT
	port map (
		CLK  => I_CLK1,
		ADDR => hit_addr(12 downto 0),
		DATA => WAV_D1
	);

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			s1_trg_ff    <= (others => '0');
			s1_trg       <= '0';
		elsif rising_edge(I_CLK1) then
			s1_trg_ff(0) <= I_SW(1);
			s1_trg_ff(1) <= s1_trg_ff(0);
			s1_trg       <= not s1_trg_ff(1) and s1_trg_ff(0);
		end if;
	end process;

	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
			hit_addr <= hit_cnt;
		elsif rising_edge(I_CLK1) then
			if (s1_trg = '1') then
				hit_addr <= (others => '0');
			else
				if (sample_pls = '1') then
					if (hit_addr <= hit_cnt) then
						hit_addr <= hit_addr + 1 ;
					else
						hit_addr <= hit_addr ;
					end if;
				end if;
			end if;
		end if;
	end process;

---------------  EFFECT SOUND ---------------------------------------

--	9R modulator voltage generator based on DAC value
	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
		  VCO_CTR <= (others=>'0');
		elsif rising_edge(I_CLK1) then
			VCO_CTR <= VCO_CTR + (not I_DAC);
		end if;
	end process;

	-- modulator frequency lookup tables for the three VCOs
	process(I_CLK1, I_RSTn)
	begin
		if (I_RSTn = '0') then
		elsif rising_edge(I_CLK1) then
			case VCO_CTR(23 downto 19) is
				when "00000" => W_VCO1_STEP <= x"2A"; W_VCO2_STEP <= x"3A"; W_VCO3_STEP <= x"54";
				when "00001" => W_VCO1_STEP <= x"29"; W_VCO2_STEP <= x"39"; W_VCO3_STEP <= x"53"; 
				when "00010" => W_VCO1_STEP <= x"29"; W_VCO2_STEP <= x"38"; W_VCO3_STEP <= x"52";
				when "00011" => W_VCO1_STEP <= x"28"; W_VCO2_STEP <= x"37"; W_VCO3_STEP <= x"50";
				when "00100" => W_VCO1_STEP <= x"28"; W_VCO2_STEP <= x"37"; W_VCO3_STEP <= x"4F";
				when "00101" => W_VCO1_STEP <= x"27"; W_VCO2_STEP <= x"36"; W_VCO3_STEP <= x"4E";
				when "00110" => W_VCO1_STEP <= x"27"; W_VCO2_STEP <= x"35"; W_VCO3_STEP <= x"4D";
				when "00111" => W_VCO1_STEP <= x"26"; W_VCO2_STEP <= x"34"; W_VCO3_STEP <= x"4C";
				when "01000" => W_VCO1_STEP <= x"25"; W_VCO2_STEP <= x"33"; W_VCO3_STEP <= x"4A";
				when "01001" => W_VCO1_STEP <= x"25"; W_VCO2_STEP <= x"33"; W_VCO3_STEP <= x"49";
				when "01010" => W_VCO1_STEP <= x"24"; W_VCO2_STEP <= x"32"; W_VCO3_STEP <= x"48";
				when "01011" => W_VCO1_STEP <= x"24"; W_VCO2_STEP <= x"31"; W_VCO3_STEP <= x"47";
				when "01100" => W_VCO1_STEP <= x"23"; W_VCO2_STEP <= x"30"; W_VCO3_STEP <= x"46";
				when "01101" => W_VCO1_STEP <= x"23"; W_VCO2_STEP <= x"2F"; W_VCO3_STEP <= x"44";
				when "01110" => W_VCO1_STEP <= x"22"; W_VCO2_STEP <= x"2F"; W_VCO3_STEP <= x"43";
				when "01111" => W_VCO1_STEP <= x"21"; W_VCO2_STEP <= x"2E"; W_VCO3_STEP <= x"42";
				when "10000" => W_VCO1_STEP <= x"21"; W_VCO2_STEP <= x"2D"; W_VCO3_STEP <= x"41";
				when "10001" => W_VCO1_STEP <= x"20"; W_VCO2_STEP <= x"2C"; W_VCO3_STEP <= x"40"; 
				when "10010" => W_VCO1_STEP <= x"20"; W_VCO2_STEP <= x"2B"; W_VCO3_STEP <= x"3F";
				when "10011" => W_VCO1_STEP <= x"1F"; W_VCO2_STEP <= x"2B"; W_VCO3_STEP <= x"3D";
				when "10100" => W_VCO1_STEP <= x"1F"; W_VCO2_STEP <= x"2A"; W_VCO3_STEP <= x"3C";
				when "10101" => W_VCO1_STEP <= x"1E"; W_VCO2_STEP <= x"29"; W_VCO3_STEP <= x"3B";
				when "10110" => W_VCO1_STEP <= x"1E"; W_VCO2_STEP <= x"28"; W_VCO3_STEP <= x"3A";
				when "10111" => W_VCO1_STEP <= x"1D"; W_VCO2_STEP <= x"28"; W_VCO3_STEP <= x"39";
				when "11000" => W_VCO1_STEP <= x"1C"; W_VCO2_STEP <= x"27"; W_VCO3_STEP <= x"37";
				when "11001" => W_VCO1_STEP <= x"1C"; W_VCO2_STEP <= x"26"; W_VCO3_STEP <= x"36";
				when "11010" => W_VCO1_STEP <= x"1B"; W_VCO2_STEP <= x"25"; W_VCO3_STEP <= x"35";
				when "11011" => W_VCO1_STEP <= x"1B"; W_VCO2_STEP <= x"24"; W_VCO3_STEP <= x"34";
				when "11100" => W_VCO1_STEP <= x"1A"; W_VCO2_STEP <= x"24"; W_VCO3_STEP <= x"33";
				when "11101" => W_VCO1_STEP <= x"1A"; W_VCO2_STEP <= x"23"; W_VCO3_STEP <= x"32";
				when "11110" => W_VCO1_STEP <= x"19"; W_VCO2_STEP <= x"22"; W_VCO3_STEP <= x"30";
				when "11111" => W_VCO1_STEP <= x"18"; W_VCO2_STEP <= x"21"; W_VCO3_STEP <= x"2F";
				when others => null;
			end case;
		end if;     
	end process;

--	8R VCO 240Hz - 140Hz (8)
	mc_vco1 : entity work.MC_SOUND_VCO
	port map (
		I_CLK   => I_CLK1,
		I_RSTn  => I_RSTn,
		I_FS    => I_FS(0),
		I_STEP  => W_VCO1_STEP,
		O_WAV   => W_VCO1_OUT
	);

--	8S VCO 330Hz - 190Hz (11)
	mc_vco2 : entity work.MC_SOUND_VCO
	port map (
		I_CLK   => I_CLK1,
		I_RSTn  => I_RSTn,
		I_FS    => I_FS(1),
		I_STEP  => W_VCO2_STEP,
		O_WAV   => W_VCO2_OUT
	);

--	8T VCO 480Hz - 270Hz (16)
	mc_vco3 : entity work.MC_SOUND_VCO
	port map (
		I_CLK   => I_CLK1,
		I_RSTn  => I_RSTn,
		I_FS    => I_FS(2),
		I_STEP  => W_VCO3_STEP,
		O_WAV   => W_VCO3_OUT
	);
end RTL;
