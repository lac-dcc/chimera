------------------------------------------------------------------------------
-- FPGA GALAXIAN TOP
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

use work.pkg_galaxian.all;

entity galaxian_top is
	port(
		--    FPGA_USE
		CLK     : in  std_logic;

		--    INPORT SW IF
		I_SW         : in  std_logic_vector(8 downto 0);
		JOYSTICK_GND			  : out	 std_logic;
		I_RESET_SWn		 : in std_logic;

		--    SOUND OUT
		O_AUDIO_L : out std_logic;
		O_AUDIO_R : out std_logic;

		--    VGA (VIDEO) IF
		O_VIDEO_R       : out std_logic_vector(3 downto 0);
		O_VIDEO_G       : out std_logic_vector(3 downto 0);
		O_VIDEO_B       : out std_logic_vector(3 downto 0);
		O_HSYNC : out std_logic;
		O_VSYNC : out std_logic
	);
end;

architecture RTL of galaxian_top is
	--
	-- 	HARDWARE SELECTOR
	--		TRUE = galaxian hardware
	-- 	FALSE = mrdo's nightmare
	--
	constant HWSEL_GALAXIAN : 	boolean := TRUE;

	--    CPU ADDRESS BUS
	signal W_A                : std_logic_vector(15 downto 0) := (others => '0');
	--    CPU IF
	signal W_CPU_CLK          : std_logic := '0';
	signal W_CPU_MREQn        : std_logic := '0';
	signal W_CPU_NMIn         : std_logic := '0';
	signal W_CPU_RDn          : std_logic := '0';
	signal W_CPU_RESETn       : std_logic := '0';
	signal W_CPU_RFSHn        : std_logic := '0';
	signal W_CPU_WAITn        : std_logic := '0';
	signal W_CPU_WRn          : std_logic := '0';
	signal W_RESETn           : std_logic := '0';
	-------- CLOCK GEN ---------------------------
	signal W_CLK_12M          : std_logic := '0';
	signal W_CLK_18M          : std_logic := '0';
	signal W_CLK_36M          : std_logic := '0';
	signal W_CLK_6M           : std_logic := '0';
	signal W_CLK_6Mn          : std_logic := '0';
	signal WB_CLK_12M         : std_logic := '0';
	signal WB_CLK_6M          : std_logic := '0';
	-------- H and V COUNTER -------------------------
	signal W_C_BLn            : std_logic := '0';
	signal W_C_BLnX           : std_logic := '0';
	signal W_C_BLX            : std_logic := '0';
	signal W_H_BL             : std_logic := '0';
	signal W_H_SYNC           : std_logic := '0';
	signal W_V_BLn            : std_logic := '0';
	signal W_V_BL2n           : std_logic := '0';
	signal W_V_SYNC           : std_logic := '0';
	signal W_H_CNT            : std_logic_vector(8 downto 0) := (others => '0');
	signal W_V_CNT            : std_logic_vector(7 downto 0) := (others => '0');
	-------- CPU RAM  ----------------------------
	signal W_CPU_RAM_DO       : std_logic_vector(7 downto 0) := (others => '0');
	-------- ADDRESS DECDER ----------------------
	signal W_BD_G             : std_logic := '0';
	signal W_CPU_RAM_CSn      : std_logic := '0';
	signal W_CPU_RAM_RDn      : std_logic := '0';
	signal W_CPU_RAM_WRn      : std_logic := '0';
	signal W_CPU_ROM_CSn      : std_logic := '0';
	signal W_DIP_OEn          : std_logic := '0';
	signal W_H_FLIP           : std_logic := '0';
	signal W_LAMP_WEn         : std_logic := '0';
	signal W_OBJ_RAM_RDn      : std_logic := '0';
	signal W_OBJ_RAM_RQn      : std_logic := '0';
	signal W_OBJ_RAM_WRn      : std_logic := '0';
	signal W_PITCHn           : std_logic := '0';
	signal W_SOUND_WEn        : std_logic := '0';
	signal W_STARS_ON         : std_logic := '0';
	signal W_STARS_OFFn       : std_logic := '0';
	signal W_SW0_OEn          : std_logic := '0';
	signal W_SW1_OEn          : std_logic := '0';
	signal W_V_FLIP           : std_logic := '0';
	signal W_VID_RAM_RDn      : std_logic := '0';
	signal W_VID_RAM_WRn      : std_logic := '0';
	signal W_WDR_OEn          : std_logic := '0';
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
	signal W_FS3              : std_logic := '0';
	signal W_FS2              : std_logic := '0';
	signal W_FS1              : std_logic := '0';
	-----  BTTONS  -------------------------------------
	signal C1                 : std_logic := '0';
	signal C2                 : std_logic := '0';
	signal D1                 : std_logic := '0';
	signal D2                 : std_logic := '0';
	signal J1                 : std_logic := '0';
	signal J2                 : std_logic := '0';
	signal L1                 : std_logic := '0';
	signal L2                 : std_logic := '0';
	signal R1                 : std_logic := '0';
	signal R2                 : std_logic := '0';
	signal S1                 : std_logic := '0';
	signal S2                 : std_logic := '0';
	signal U1                 : std_logic := '0';
	signal U2                 : std_logic := '0';

	signal blx_comb           : std_logic := '0';
	signal W_1VF              : std_logic := '0';
	signal W_256HnX           : std_logic := '0';
	signal W_8HF              : std_logic := '0';
	signal W_DAC_A            : std_logic := '0';
	signal W_DAC_B            : std_logic := '0';
	signal W_MISSILEn         : std_logic := '0';
	signal W_SHELLn           : std_logic := '0';
	signal ZMWR               : std_logic := '0';

	signal new_sw             : std_logic_vector( 2 downto 0) := (others => '0');
	signal on_game            : std_logic_vector( 1 downto 0) := (others => '0');
	signal ROM_D              : std_logic_vector( 7 downto 0) := (others => '0');
	signal rst_count          : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_9L_Q             : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_COL              : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_B                : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_G                : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_R                : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_SDAT_A           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_SDAT_B           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_STARS_B          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_STARS_G          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_STARS_R          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VGA_B            : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VGA_G            : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VGA_R            : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VID              : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VIDEO_B          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VIDEO_G          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VIDEO_R          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_WAV_A0           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_A1           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_A2           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_D0           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_WAV_D1           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_WAV_D2           : std_logic_vector( 7 downto 0) := (others => '0');
--
--	component MC_VIDEO
--	port (
--		I_CLK_18M     : in  std_logic;
--		I_CLK_12M     : in  std_logic;
--		I_CLK_6M      : in  std_logic;
--		I_CLK_6Mn     : in  std_logic;
--		I_H_CNT       : in  std_logic_vector(8 downto 0);
--		I_V_CNT       : in  std_logic_vector(7 downto 0);
--		I_H_FLIP      : in  std_logic;
--		I_V_FLIP      : in  std_logic;
--		I_V_BLn       : in  std_logic;
--		I_C_BLn       : in  std_logic;
--		I_A           : in  std_logic_vector(9 downto 0);
--		I_OBJ_SUB_A   : in  std_logic_vector(2 downto 0);
--		I_BD          : in  std_logic_vector(7 downto 0);
--		I_OBJ_RAM_RQn : in  std_logic;
--		I_OBJ_RAM_RDn : in  std_logic;
--		I_OBJ_RAM_WRn : in  std_logic;
--		I_VID_RAM_RDn : in  std_logic;
--		I_VID_RAM_WRn : in  std_logic;
--		O_C_BLnX      : out std_logic;
--		O_8HF         : out std_logic;
--		O_256HnX      : out std_logic;
--		O_1VF         : out std_logic;
--		O_MISSILEn    : out std_logic;
--		O_SHELLn      : out std_logic;
--		O_BD          : out std_logic_vector(7 downto 0);
--		O_VID         : out std_logic_vector(1 downto 0);
--		O_COL         : out std_logic_vector(2 downto 0)
--	);
--	end component;

begin

	JOYSTICK_GND <= '0';

	mc_clocks : entity work.CLOCKGEN
	port map(
		CLKIN_IN   => CLK,
		RST_IN     => not W_RESETn,
		O_CLK_36M  => W_CLK_36M,
		O_CLK_18M  => W_CLK_18M,
		O_CLK_12M  => WB_CLK_12M,
		O_CLK_06M  => WB_CLK_6M,
		O_CLK_06Mn => W_CLK_6Mn
	);

	cpu : entity work.T80as
		port map (
			RESET_n => W_CPU_RESETn,
			CLK_n   => W_CPU_CLK,
			WAIT_n  => W_CPU_WAITn,
			INT_n   => '1',
			NMI_n   => W_CPU_NMIn,
			BUSRQ_n => '1',
			M1_n    => open,
			MREQ_n  => W_CPU_MREQn,
			IORQ_n  => open,
			RD_n    => W_CPU_RDn,
			WR_n    => W_CPU_WRn,
			RFSH_n  => W_CPU_RFSHn,
			HALT_n  => open,
			BUSAK_n => open,
			A       => W_A,
			DI      => W_BDO,
			DO      => W_BDI,
			DOE     => open
		);

	mc_cpu_ram : entity work.MC_CPU_RAM
	port map (
		I_CLK  => W_CPU_RAM_CLK,
		I_ADDR => W_A(9 downto 0),
		I_D    => W_BDI,
		I_WE   => not W_CPU_WRn,
		I_OE   => not W_CPU_RAM_RDn,
		O_D    => W_CPU_RAM_DO
	);

	mc_adec : entity work.MC_ADEC
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_CPU_CLK     => W_H_CNT(0),
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
		O_CPU_ROM_CSn => W_CPU_ROM_CSn,
		O_CPU_RAM_RDn => W_CPU_RAM_RDn,
		O_CPU_RAM_WRn => W_CPU_RAM_WRn,
		O_CPU_RAM_CSn => W_CPU_RAM_CSn,
		O_OBJ_RAM_RDn => W_OBJ_RAM_RDn,
		O_OBJ_RAM_WRn => W_OBJ_RAM_WRn,
		O_OBJ_RAM_RQn => W_OBJ_RAM_RQn,
		O_VID_RAM_RDn => W_VID_RAM_RDn,
		O_VID_RAM_WRn => W_VID_RAM_WRn,
		O_SW0_OEn     => W_SW0_OEn,
		O_SW1_OEn     => W_SW1_OEn,
		O_DIP_OEn     => W_DIP_OEn,
		O_WDR_OEn     => W_WDR_OEn,
		O_LAMP_WEn    => W_LAMP_WEn,
		O_SOUND_WEn   => W_SOUND_WEn,
		O_PITCHn      => W_PITCHn,
		O_H_FLIP      => W_H_FLIP,
		O_V_FLIP      => W_V_FLIP,
		O_BD_G        => W_BD_G,
		O_STARS_ON    => W_STARS_ON
	);

	mc_inport : entity work.MC_INPORT
	port map (
		I_COIN1    => not C1,   --  ACTIVE HI
		I_COIN2    => not C2,   --  ACTIVE HI
		I_1P_LE    => not L1,   --  ACTIVE HI
		I_1P_RI    => not R1,   --  ACTIVE HI
		I_1P_SH    => not J1,   --  ACTIVE HI
		I_2P_LE    => not L2,   --  ACTIVE HI
		I_2P_RI    => not R2,   --  ACTIVE HI
		I_2P_SH    => not J2,   --  ACTIVE HI
		I_1P_START => not S1,   --  ACTIVE HI
		I_2P_START => not S2,   --  ACTIVE HI
		I_SW0_OEn  => W_SW0_OEn,
		I_SW1_OEn  => W_SW1_OEn,
		I_DIP_OEn  => W_DIP_OEn,
		O_D        => W_SW_DO
	);

	roms : entity work.GALAXIAN_ROMS
	port map(
		I_ROM_CLK            => W_CLK_12M,
		I_ADDR(18 downto 16) => "000",
		I_ADDR(15 downto 0)  => W_A(15 downto 0),
		O_DATA               => ROM_D
	);

	mc_hv : entity work.MC_HV_COUNT
	port map(
		I_CLK    => WB_CLK_6M,
		I_RSTn   => W_RESETn,
		O_H_CNT  => W_H_CNT,
		O_H_SYNC => W_H_SYNC,
		O_H_BL   => W_H_BL,
		O_V_CNT  => W_V_CNT,
		O_V_SYNC => W_V_SYNC,
		O_V_BL2n => W_V_BL2n,
		O_V_BLn  => W_V_BLn,
		O_C_BLn  => W_C_BLn
	);

	mc_vid : entity work.MC_VIDEO
	port map(
		I_CLK_18M     => W_CLK_18M,
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_CLK_6Mn     => W_CLK_6Mn,
		I_H_CNT       => W_H_CNT,
		I_V_CNT       => W_V_CNT,
		I_H_FLIP      => W_H_FLIP,
		I_V_FLIP      => W_V_FLIP,
		I_V_BLn       => W_V_BLn,
		I_C_BLn       => W_C_BLn,
		I_A           => W_A(9 downto 0),
		I_OBJ_SUB_A   => "000",
		I_BD          => W_BDI,
		I_OBJ_RAM_RQn => W_OBJ_RAM_RQn,
		I_OBJ_RAM_RDn => W_OBJ_RAM_RDn,
		I_OBJ_RAM_WRn => W_OBJ_RAM_WRn,
		I_VID_RAM_RDn => W_VID_RAM_RDn,
		I_VID_RAM_WRn => W_VID_RAM_WRn,
		O_C_BLnX      => W_C_BLnX,
		O_8HF         => W_8HF,
		O_256HnX      => W_256HnX,
		O_1VF         => W_1VF,
		O_MISSILEn    => W_MISSILEn,
		O_SHELLn      => W_SHELLn,
		O_BD          => W_VID_DO,
		O_VID         => W_VID,
		O_COL         => W_COL
	);

	mc_col_pal : entity work.MC_COL_PAL
	port map(
		I_CLK_12M    => W_CLK_12M,
		I_CLK_6M     => W_CLK_6M,
		I_VID        => W_VID,
		I_COL        => W_COL,
		I_C_BLnX     => W_C_BLnX,
		O_C_BLX      => W_C_BLX,
		O_STARS_OFFn => W_STARS_OFFn,
		O_R          => W_VIDEO_R,
		O_G          => W_VIDEO_G,
		O_B          => W_VIDEO_B
	);

	mc_stars : entity work.MC_STARS
	port map (
		I_CLK_18M    => W_CLK_18M,
		I_CLK_6M     => WB_CLK_6M,
		I_H_FLIP     => W_H_FLIP,
		I_V_SYNC     => W_V_SYNC,
		I_8HF        => W_8HF,
		I_256HnX     => W_256HnX,
		I_1VF        => W_1VF,
		I_2V         => W_V_CNT(1),
		I_STARS_ON   => W_STARS_ON,
		I_STARS_OFFn => W_STARS_OFFn,
		O_R          => W_STARS_R,
		O_G          => W_STARS_G,
		O_B          => W_STARS_B,
		O_NOISE      => open
	);

	mix : entity work.MC_VIDEO_MIX
	port map(
		I_VID_R    => W_VIDEO_R,
		I_VID_G    => W_VIDEO_G,
		I_VID_B    => W_VIDEO_B,
		I_STR_R    => W_STARS_R,
		I_STR_G    => W_STARS_G,
		I_STR_B    => W_STARS_B,
		I_C_BLnXX  => not W_C_BLX,
		I_C_BLX    => blx_comb,
		I_MISSILEn => W_MISSILEn,
		I_SHELLn   => W_SHELLn,
		O_R        => W_R,
		O_G        => W_G,
		O_B        => W_B
	);

	-- VGA scan doubler
	vga_scandbl : entity work.VGA_SCANDBL
	port map(
		-- input
		CLK     => W_CLK_6M,
		CLK_X2  => W_CLK_12M,
		I_R     => W_R,
		I_G     => W_G,
		I_B     => W_B,
		I_HSYNC => W_H_SYNC,
		I_VSYNC => W_V_SYNC,
		-- output
		O_R     => W_VGA_R,
		O_G     => W_VGA_G,
		O_B     => W_VGA_B,
		O_HSYNC => O_HSYNC,
		O_VSYNC => O_VSYNC
	);

	mc_sound_a : entity work.MC_SOUND_A
	port map(
		I_CLK_12M => W_CLK_12M,
		I_CLK_6M  => W_CLK_6M,
		I_H_CNT1  => W_H_CNT(1),
		I_BD      => W_BDI,
		I_PITCHn  => W_PITCHn,
		I_VOL1    => W_VOL1,
		I_VOL2    => W_VOL2,
		O_SDAT    => W_SDAT_A,
		O_DO      => open
	);

	vmc_sound_b : entity work.MC_SOUND_B
	port map(
		I_CLK1   => W_CLK_18M,
		I_CLK2   => W_CLK_6M,
		I_RSTn   => rst_count(3),
		I_SW     => new_sw ,
		O_WAV_A0 => W_WAV_A0,
		O_WAV_A1 => W_WAV_A1,
		O_WAV_A2 => W_WAV_A2,
		I_WAV_D0 => W_WAV_D0,
		I_WAV_D1 => W_WAV_D1,
		I_WAV_D2 => W_WAV_D2,
		O_SDAT   => W_SDAT_B
	);

	wav_dac_a : entity work.dac
	port map(
		clk_i   => W_CLK_18M,
		res_n_i => W_RESETn,
		dac_i   => W_SDAT_A,
		dac_o   => W_DAC_A
	);

	wav_dac_b : entity work.dac
	port map(
		clk_i   => W_CLK_18M,
		res_n_i => W_RESETn,
		dac_i   => W_SDAT_B,
		dac_o   => W_DAC_B
	);

--------- BUTTONS       ---------------------
	U1 <= not I_SW(0) when HWSEL_GALAXIAN  else I_SW(0);
   D1 <= not I_SW(1) when HWSEL_GALAXIAN  else I_SW(1);
   L1 <= not I_SW(2) when HWSEL_GALAXIAN  else I_SW(3);
   R1 <= not I_SW(3) when HWSEL_GALAXIAN  else I_SW(2);
   J1 <= not I_SW(4) when HWSEL_GALAXIAN  else I_SW(4);
	
	S1 <= not I_SW(5);
	S2 <= not I_SW(7);

	C1 <= not I_SW(6);
	C2 <= not I_SW(8);	

--	S1 <= not I_SW(5);
--	S2 <= not I_SW(7);
--
--	C1 <= not I_SW(6);
--	C2 <= not I_SW(8);

	U2 <= U1;
	D2 <= D1;
	L2 <= L1 when HWSEL_GALAXIAN  else U1;
	R2 <= R1 when HWSEL_GALAXIAN  else D1;
	J2 <= J1;

-------- VIDEO  -----------------------------

	blx_comb <= W_C_BLX or (not W_V_BL2n);

	O_VIDEO_R(3 downto 0) <= W_VGA_R(0) & W_VGA_R(1) & W_VGA_R(2) & "0";
	O_VIDEO_G(3 downto 0) <= W_VGA_G(0) & W_VGA_G(1) & W_VGA_G(2) & "0";
	O_VIDEO_B(3 downto 0) <= W_VGA_B(0) & W_VGA_B(1) & "00";

-----  CPU I/F  -------------------------------------

	W_CPU_RESETn  <= W_RESETn;
	W_CPU_CLK     <= W_H_CNT(0);
	W_CPU_RAM_CLK <= W_CLK_12M and (not W_CPU_RAM_CSn);

	W_CPU_ROM_DOB <= x"00" when W_CPU_ROM_CSn = '1' else W_CPU_ROM_DO ;

	W_CLK_12M <= WB_CLK_12M;
	W_CLK_6M  <= WB_CLK_6M;
--	W_RESETn  <= I_SW(8) or I_SW(7) or I_SW(6)     or I_SW(5);
--	W_RESETn  <= '1';
	W_RESETn  <= not I_RESET_SWn;
	W_BDO     <= W_SW_DO  or W_VID_DO or W_CPU_RAM_DO or W_CPU_ROM_DOB ;


---------- SOUND I/F -----------------------------
	O_AUDIO_L <= W_DAC_A;
	O_AUDIO_R <= W_DAC_B;

	new_sw <= (on_game(1) and on_game(0)) & W_HIT & W_FIRE;

	process(W_H_CNT(0), W_RESETn)
	begin
		if (W_RESETn = '0') then
			rst_count <= (others => '0');
		elsif rising_edge( W_H_CNT(0)) then
			if ( rst_count /= x"f") then
				rst_count <= rst_count + 1;
			end if;
		end if;
	end process;

-----  Parts 9L ---------

	process(W_CLK_12M, W_RESETn)
	begin
		if (W_RESETn = '0') then
			W_9L_Q <= (others => '0');
		elsif rising_edge(W_CLK_12M) then
			if (W_SOUND_WEn = '0') then
				case(W_A(2 downto 0)) is
					when "000" => W_9L_Q(0) <= W_BDI(0);
					when "001" => W_9L_Q(1) <= W_BDI(0);
					when "010" => W_9L_Q(2) <= W_BDI(0);
					when "011" => W_9L_Q(3) <= W_BDI(0);
					when "100" => W_9L_Q(4) <= W_BDI(0);
					when "101" => W_9L_Q(5) <= W_BDI(0);
					when "110" => W_9L_Q(6) <= W_BDI(0);
					when "111" => W_9L_Q(7) <= W_BDI(0);
					when others => null;
				end case;
			end if;
		end if;
	end process;

	W_VOL1 <= W_9L_Q(6);
	W_VOL2 <= W_9L_Q(7);
	W_FIRE <= W_9L_Q(5);
	W_HIT  <= W_9L_Q(3);
	W_FS3  <= W_9L_Q(2);
	W_FS2  <= W_9L_Q(1);
	W_FS1  <= W_9L_Q(0);

------ CPU DATA WATCH -------------------------------
	ZMWR <= W_CPU_MREQn or W_CPU_WRn ;

	process(W_CPU_CLK)
	begin
		if rising_edge(W_CPU_CLK) then
			if (ZMWR = '0') then
				if (W_A = x"4007") then
					if (W_BDI = x"00") then
						on_game(0) <= '1';
					else
						on_game(0) <= '0';
					end if;
					if (W_A = x"4005") then
						if (W_BDI = x"03" or W_BDI = x"04") then
							on_game(1) <= '1';
						else
							on_game(1) <= '0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

--------- ROM           -------------------------------------------------------
	process(W_CLK_12M)
	begin
		if rising_edge(W_CLK_12M) then
			W_CPU_ROM_DO <= ROM_D;
		end if;
	end process;

-------------------------------------------------------------------------------

end RTL;
