------------------------------------------------------------------------------
-- FPGA ZigZag
--
-- Version  downto  2.50
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important  not
--
-- This program is freeware for non-commercial use.
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
-- 2004- 4-30  galaxian modify by K.DEGAWA
-- 2004- 5- 6  first release.
-- 2004- 8-23  Improvement with T80-IP.
-- 2004- 9-22  The problem which missile didn't sometimes come out from was improved.
------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity ZigZag is
	port(
		W_CLK_12M  : in  std_logic;
		W_CLK_6M   : in  std_logic;

		I_COIN1    : in  std_logic;   --  active high
		I_COIN2    : in  std_logic;   --  active high
		I_LEFT     : in  std_logic;   --  active high
		I_RIGHT    : in  std_logic;   --  active high
		I_UP       : in  std_logic;   --  active high
		I_DOWN     : in  std_logic;   --  active high
		I_FIRE     : in  std_logic;   --  active high
		I_1P_START : in  std_logic;   --  active high
		I_2P_START : in  std_logic;   --  active high
		I_RESET    : in  std_logic;

		W_R        : out std_logic_vector(2 downto 0);
		W_G        : out std_logic_vector(2 downto 0);
		W_B        : out std_logic_vector(2 downto 0);
		HBLANK     : out std_logic;
		VBLANK     : out std_logic;
		W_H_SYNC   : out std_logic;
		W_V_SYNC   : out std_logic;
		O_AUDIO    : out std_logic_vector(9 downto 0)
	);
end;

architecture RTL of ZigZag is
	--    CPU ADDRESS BUS
	signal W_A                : std_logic_vector(15 downto 0) := (others => '0');
	--    CPU IF
	signal W_CPU_CLK          : std_logic := '0';
	signal W_CPU_MREQn        : std_logic := '0';
	signal W_CPU_NMIn         : std_logic := '0';
	signal W_CPU_RDn          : std_logic := '0';
	signal W_CPU_RFSHn        : std_logic := '0';
	signal W_CPU_WAITn        : std_logic := '0';
	signal W_CPU_WRn          : std_logic := '0';
	signal W_CPU_WR           : std_logic := '0';
	signal W_RESETn           : std_logic := '0';
	signal W_ROM_SWP          : std_logic := '0';
	-------- H and V COUNTER -------------------------
	signal W_C_BLn            : std_logic := '0';
	signal W_C_BLnX           : std_logic := '0';
	signal W_C_BLXn           : std_logic := '0';
	signal W_H_BL             : std_logic := '0';
	signal W_H_SYNC_int       : std_logic := '0';
	signal W_V_BLn            : std_logic := '0';
	signal W_V_BL2n           : std_logic := '0';
	signal W_V_SYNC_int       : std_logic := '0';
	signal W_H_CNT            : std_logic_vector(8 downto 0) := (others => '0');
	signal W_V_CNT            : std_logic_vector(7 downto 0) := (others => '0');
	-------- CPU RAM  ----------------------------
	signal W_CPU_RAM_DO       : std_logic_vector(7 downto 0) := (others => '0');
	-------- ADDRESS DECDER ----------------------
	signal W_BD_G             : std_logic := '0';
	signal W_CPU_RAM_CS       : std_logic := '0';
	signal W_CPU_RAM_RD       : std_logic := '0';
--	signal W_CPU_RAM_WR       : std_logic := '0';
	signal W_CPU_ROM_CS       : std_logic := '0';
	signal W_DIP_OE           : std_logic := '0';
	signal W_H_FLIP           : std_logic := '0';
	signal W_DRIVER_WE        : std_logic := '0';
	signal W_OBJ_RAM_RD       : std_logic := '0';
	signal W_OBJ_RAM_RQ       : std_logic := '0';
	signal W_OBJ_RAM_WR       : std_logic := '0';
	signal W_PITCH            : std_logic := '0';
	signal W_SOUND_WE         : std_logic := '0';
	signal W_STARS_ON         : std_logic := '0';
	signal W_STARS_OFFn       : std_logic := '0';
	signal W_SW0_OE           : std_logic := '0';
	signal W_SW1_OE           : std_logic := '0';
	signal W_V_FLIP           : std_logic := '0';
	signal W_VID_RAM_RD       : std_logic := '0';
	signal W_VID_RAM_WR       : std_logic := '0';
	signal W_WDR_OE           : std_logic := '0';
	--------- INPORT -----------------------------
	signal W_SW_DO            : std_logic_vector( 7 downto 0) := (others => '0');
	--------- VIDEO  -----------------------------
	signal W_VID_DO           : std_logic_vector( 7 downto 0) := (others => '0');
	-----  DATA I/F -------------------------------------
	signal W_CPU_ROM_DO       : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_CPU_ROM_DOB      : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_BDO              : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_BDI              : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_CPU_RAM_CLK      : std_logic := '0';
	signal W_VOL1             : std_logic := '0';
	signal W_VOL2             : std_logic := '0';
	signal W_FIRE             : std_logic := '0';
	signal W_HIT              : std_logic := '0';
	signal W_FS               : std_logic_vector( 2 downto 0) := (others => '0');

	signal blx_comb           : std_logic := '0';
	signal W_1VF              : std_logic := '0';
	signal W_256HnX           : std_logic := '0';
	signal W_8HF              : std_logic := '0';
	signal W_DAC_A            : std_logic := '0';
	signal W_DAC_B            : std_logic := '0';
	signal W_MISSILEn         : std_logic := '0';
	signal W_SHELLn           : std_logic := '0';
	signal W_MS_D             : std_logic := '0';
	signal W_MS_R             : std_logic := '0';
	signal W_MS_G             : std_logic := '0';
	signal W_MS_B             : std_logic := '0';

	signal new_sw             : std_logic_vector( 2 downto 0) := (others => '0');
	signal in_game            : std_logic_vector( 1 downto 0) := (others => '0');
	signal ROM_D              : std_logic_vector( 7 downto 0) := (others => '0');
	signal rst_count          : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_COL              : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_STARS_B          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_STARS_G          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_STARS_R          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VID              : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VIDEO_B          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VIDEO_G          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VIDEO_R          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_WAV_A0           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_A1           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_A2           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_D0           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_WAV_D1           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_WAV_D2           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_DAC              : std_logic_vector( 3 downto 0) := (others => '0');
	signal PSG_EN             : std_logic;
	signal PSG_D              : std_logic_vector(7 downto 0);
	signal PSG_A,PSG_B,PSG_C  : std_logic_vector(7 downto 0);
	
	component ym2149
	port (
		CLK       : in  std_logic;
		CE        : in  std_logic;
		RESET     : in  std_logic;
		BDIR      : in  std_logic;
		BC        : in  std_logic;
		DI        : in  std_logic_vector(7 downto 0);
		DO        : out std_logic_vector(7 downto 0);
		CHANNEL_A : out std_logic_vector(7 downto 0);
		CHANNEL_B : out std_logic_vector(7 downto 0);
		CHANNEL_C : out std_logic_vector(7 downto 0)
	);
	end component;
	
begin

mc_vid : entity work.MC_VIDEO
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_H_CNT       => W_H_CNT,
		I_V_CNT       => W_V_CNT,
		I_H_FLIP      => W_H_FLIP,
		I_V_FLIP      => W_V_FLIP,
		I_V_BLn       => W_V_BLn,
		I_C_BLn       => W_C_BLn,
		I_A           => W_A(9 downto 0),
		I_BD          => W_BDI,
		I_OBJ_RAM_RQ  => W_OBJ_RAM_RQ,
		I_OBJ_RAM_RD  => W_OBJ_RAM_RD,
		I_OBJ_RAM_WR  => W_OBJ_RAM_WR,
		I_VID_RAM_RD  => W_VID_RAM_RD,
		I_VID_RAM_WR  => W_VID_RAM_WR,
		O_C_BLnX      => W_C_BLnX,
		O_BD          => W_VID_DO,
		O_VID         => W_VID,
		O_COL         => W_COL
	);


	cpu : entity work.T80as
	port map (
		RESET_n       => W_RESETn,
		CLK_n         => W_CPU_CLK,
		WAIT_n        => W_CPU_WAITn,
		INT_n         => '1',
		NMI_n         => W_CPU_NMIn,
		BUSRQ_n       => '1',
		MREQ_n        => W_CPU_MREQn,
		RD_n          => W_CPU_RDn,
		WR_n          => W_CPU_WRn,
		RFSH_n        => W_CPU_RFSHn,
		A             => W_A,
		DI            => W_BDO,
		DO            => W_BDI,
		M1_n          => open,
		IORQ_n        => open,
		HALT_n        => open,
		BUSAK_n       => open,
		DOE           => open
	);

	mc_cpu_ram : entity work.MC_CPU_RAM
	port map (
		I_CLK         => W_CPU_RAM_CLK,
		I_ADDR        => W_A(9 downto 0),
		I_D           => W_BDI,
		I_WE          => W_CPU_WR,
		I_OE          => W_CPU_RAM_RD,
		O_D           => W_CPU_RAM_DO
	);

mc_adec : entity work.MC_ADEC
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_CPU_CLK     => W_CPU_CLK,
		I_RSTn        => W_RESETn,

		I_CPU_A       => W_A,
		I_CPU_D       => W_BDI(0),
		I_MREQn       => W_CPU_MREQn,
		I_RFSHn       => W_CPU_RFSHn,
		I_RDn         => W_CPU_RDn,
		I_WRn         => W_CPU_WRn,
		I_H_BL        => W_H_BL,
		I_V_BLn       => W_V_BLn,

		O_WAITn       => W_CPU_WAITn,
		O_NMIn        => W_CPU_NMIn,
		O_CPU_ROM_CS  => W_CPU_ROM_CS,
		O_CPU_RAM_RD  => W_CPU_RAM_RD,
		O_CPU_RAM_CS  => W_CPU_RAM_CS,
		O_OBJ_RAM_RD  => W_OBJ_RAM_RD,
		O_OBJ_RAM_WR  => W_OBJ_RAM_WR,
		O_OBJ_RAM_RQ  => W_OBJ_RAM_RQ,
		O_VID_RAM_RD  => W_VID_RAM_RD,
		O_VID_RAM_WR  => W_VID_RAM_WR,
		O_SW0_OE      => W_SW0_OE,
		O_SW1_OE      => W_SW1_OE,
		O_DIP_OE      => W_DIP_OE,
		O_H_FLIP      => W_H_FLIP,
		O_V_FLIP      => W_V_FLIP,
		O_ROM_SWP     => W_ROM_SWP
	);

-- active high buttons
	mc_inport : entity work.MC_INPORT
	port map (
		I_COIN1       => I_COIN1,
		I_COIN2       => I_COIN2,
		I_1P_START    => I_1P_START,
		I_2P_START    => I_2P_START,
		I_LEFT        => I_LEFT,
		I_RIGHT       => I_RIGHT,
		I_UP          => I_UP,
		I_DOWN        => I_DOWN,
		I_FIRE        => I_FIRE,

		I_SW0_OE      => W_SW0_OE,
		I_SW1_OE      => W_SW1_OE,
		I_DIP_OE      => W_DIP_OE,
		O_D           => W_SW_DO
	);

	mc_hv : entity work.MC_HV_COUNT
	port map(
		I_CLK         => W_CLK_6M,
		I_RSTn        => W_RESETn,
		O_H_CNT       => W_H_CNT,
		O_H_SYNC      => W_H_SYNC_int,
		O_H_BL        => W_H_BL,
		O_V_CNT       => W_V_CNT,
		O_V_SYNC      => W_V_SYNC_int,
		O_V_BL2n      => W_V_BL2n,
		O_V_BLn       => W_V_BLn,
		O_C_BLn       => W_C_BLn
	);

	mc_col_pal : entity work.MC_COL_PAL
	port map(
		I_CLK_6M      => W_CLK_6M,
		I_VID         => W_VID,
		I_COL         => W_COL,
		O_R           => W_R,
		O_G           => W_G,
		O_B           => W_B
	);

mc_roms1 : entity work.prog
	port map (
		clk		=> W_CLK_12M, 
		addr	=>  W_A(13) & (W_A(12) xor (W_ROM_SWP and W_A(13))) & W_A(11 downto 0),
		data			=> W_CPU_ROM_DO
	);

-------- VIDEO  -----------------------------
	W_V_SYNC <= not W_V_SYNC_int;
	W_H_SYNC <= not W_H_SYNC_int;

	process(W_CLK_6M)
	begin
		if rising_edge(W_CLK_6M) then
			HBLANK   <= not W_C_BLnX;
			VBLANK   <= not W_V_BL2n;
		end if;
	end process;


-----  CPU I/F  -------------------------------------

	W_CPU_CLK     <= W_H_CNT(0);
	W_CPU_RAM_CLK <= W_CLK_12M and W_CPU_RAM_CS;

	W_CPU_ROM_DOB <= W_CPU_ROM_DO when W_CPU_ROM_CS = '1' else (others=>'0');

	W_RESETn  <= not I_RESET;
	W_BDO     <= W_SW_DO  or W_VID_DO or W_CPU_RAM_DO or W_CPU_ROM_DOB ;
	W_CPU_WR  <= not W_CPU_WRn;

-------------------------------------------------------------------------------

	PSG_EN <= '1' when W_A(15 downto 11) = "01001" and W_A(9) = '0' and W_CPU_MREQn = '0' and W_CPU_WRn = '0' else '0';
	
	process(W_CPU_CLK)
	begin
		if rising_edge(W_CPU_CLK) then
			if PSG_EN = '1' and W_A(8) = '1' then
				PSG_D <= W_A(7 downto 0);
			end if;
		end if;
	end process;

	O_AUDIO <= ("00" & PSG_A) + ("00" & PSG_B) + ("00" & PSG_C);

	psg : ym2149
	port map
	(
		CLK       => W_CPU_CLK,
		CE        => '1',
		RESET     => I_RESET,

		BDIR      => PSG_EN and W_A(0) and not W_A(8),
		BC        => W_A(1),
		DI        => PSG_D,

		CHANNEL_A => PSG_A,
		CHANNEL_B => PSG_B,
		CHANNEL_C => PSG_C
	);

end RTL;