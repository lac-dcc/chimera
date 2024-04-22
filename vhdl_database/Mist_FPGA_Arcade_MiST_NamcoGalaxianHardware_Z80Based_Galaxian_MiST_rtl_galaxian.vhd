------------------------------------------------------------------------------
-- FPGA GALAXIAN
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
--
-- 2019-12 Multi-machine support added (see mc_pack.vhd)

------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;
  use work.mc_pack.all;

entity galaxian is
	port(
		W_CLK_12M  : in  std_logic;
		W_CLK_6M   : in  std_logic;
		I_RESET    : in  std_logic;
		I_HWSEL    : in  integer;
		I_DL_ADDR  : in  std_logic_vector(15 downto 0);
		I_DL_DATA  : in  std_logic_vector(7 downto 0);
		I_DL_WR    : in  std_logic;

		I_TABLE    : in  std_logic;   -- UP = 0
		I_TEST     : in  std_logic;
		I_SERVICE  : in  std_logic;
		I_DIP      : in  std_logic_vector(7 downto 0);
		I_SW1_67   : in  std_logic_vector(1 downto 0);
		P1_CSJUDLR : in  std_logic_vector(6 downto 0);
		P2_CSJUDLR : in  std_logic_vector(6 downto 0);

		W_R        : out std_logic_vector(2 downto 0);
		W_G        : out std_logic_vector(2 downto 0);
		W_B        : out std_logic_vector(2 downto 0);
		HBLANK     : out std_logic;
		VBLANK     : out std_logic;
		W_H_SYNC   : out std_logic;
		W_V_SYNC   : out std_logic;
		W_SDAT_A   : out std_logic_vector( 7 downto 0) := (others => '0');
		W_SDAT_B   : out std_logic_vector( 7 downto 0) := (others => '0');
		W_SDAT_C   : out std_logic_vector( 7 downto 0) := (others => '0');
		O_CMPBL    : out std_logic
	);
end;

architecture RTL of galaxian is
	--    CPU ADDRESS BUS
	signal W_A                : std_logic_vector(15 downto 0) := (others => '0');
	--    CPU IF
	signal W_CPU_CLK_EN       : std_logic := '0';
	signal W_CPU_MREQn        : std_logic := '0';
	signal W_CPU_NMIn         : std_logic := '0';
	signal W_CPU_RDn          : std_logic := '0';
	signal W_CPU_RFSHn        : std_logic := '0';
	signal W_CPU_WAITn        : std_logic := '0';
	signal W_CPU_WRn          : std_logic := '0';
	signal W_CPU_WR           : std_logic := '0';
	signal W_RESETn           : std_logic := '0';
	signal CPU_INT_n          : std_logic;
	signal CPU_NMI_n          : std_logic;

	-------- H and V COUNTER -------------------------
	signal W_C_BLn            : std_logic := '0';
	signal W_C_BLnX           : std_logic := '0';
	signal W_H_BLn            : std_logic := '0';
	signal W_H_BLnX           : std_logic := '0';
	signal W_H_BLXn           : std_logic := '0';
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
  signal W_MOONCR           : std_logic := '0';
	signal W_BD_G             : std_logic := '0';
	signal W_CPU_RAM_CS       : std_logic := '0';
	signal W_CPU_RAM_RD       : std_logic := '0';
	signal W_CPU_ROM_ADDR     : std_logic_vector(13 downto 0);
--	signal W_CPU_RAM_WR       : std_logic := '0';
	signal W_CPU_ROM_WR       : std_logic := '0'; -- rom upload
	signal W_CPU_ROM_CS       : std_logic := '0';
	signal W_DIP_OE           : std_logic := '0';
	signal W_H_FLIP           : std_logic := '0';
	signal W_DRIVER_WE        : std_logic := '0';
	signal W_OBJ_RAM_RD       : std_logic := '0';
	signal W_OBJ_RAM_RQ       : std_logic := '0';
	signal W_OBJ_RAM_WR       : std_logic := '0';
	signal W_PITCH            : std_logic := '0';
	signal W_SOUND_WE         : std_logic := '0';
	signal W_MISC_WE          : std_logic := '0';
	signal W_SPEECH_IN        : std_logic_vector(1 downto 0);
	signal W_SPEECH_OUT       : std_logic_vector(7 downto 0);
	signal W_SPEECH_DIP       : std_logic := '0';
	signal W_STARS_ON         : std_logic := '0';
	signal W_STARS_ON_ADJ     : std_logic := '0';
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
	signal W_ROM_SWP          : std_logic := '0'; -- ZigZag
	signal W_BDO              : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_BDI              : std_logic_vector( 7 downto 0) := (others => '0');
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
	signal PSG_OUT            : std_logic_vector(9 downto 0);

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
		I_HWSEL       => I_HWSEL,
		I_H_CNT       => W_H_CNT,
		I_V_CNT       => W_V_CNT,
		I_H_FLIP      => W_H_FLIP,
		I_V_FLIP      => W_V_FLIP,
		I_V_BLn       => W_V_BLn,
		I_C_BLn       => W_C_BLn,
		I_H_BLn       => W_H_BLn,
		I_A           => W_A(9 downto 0),
		I_OBJ_SUB_A   => "000",
		I_BD          => W_BDI,
		I_OBJ_RAM_RQ  => W_OBJ_RAM_RQ,
		I_OBJ_RAM_RD  => W_OBJ_RAM_RD,
		I_OBJ_RAM_WR  => W_OBJ_RAM_WR,
		I_VID_RAM_RD  => W_VID_RAM_RD,
		I_VID_RAM_WR  => W_VID_RAM_WR,
		I_DRIVER_WR   => W_DRIVER_WE,

		I_DL_ADDR     => I_DL_ADDR,
		I_DL_DATA     => I_DL_DATA,
		I_DL_WR       => I_DL_WR,

		O_C_BLnX      => W_C_BLnX,
		O_H_BLnX      => W_H_BLnX,
		O_8HF         => W_8HF,
		O_256HnX      => W_256HnX,
		O_1VF         => W_1VF,
		O_MISSILEn    => W_MISSILEn,
		O_SHELLn      => W_SHELLn,
		O_BD          => W_VID_DO,
		O_VID         => W_VID,
		O_COL         => W_COL
	);

	cpu_int : process(I_HWSEL, W_CPU_NMIn)
	begin
		if I_HWSEL = HW_DEVILFSH then
			CPU_INT_n <= W_CPU_NMIn;
			CPU_NMI_n <= '1';
		else
			CPU_INT_n <= '1';
			CPU_NMI_n <= W_CPU_NMIn;
		end if;
	end process;

	cpu : entity work.T80se
	port map (
		RESET_n       => W_RESETn,
		CLK_n         => W_CLK_6M,
		CLKEN         => W_CPU_CLK_EN,
		WAIT_n        => W_CPU_WAITn,
		INT_n         => CPU_INT_n,
		NMI_n         => CPU_NMI_n,
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
		BUSAK_n       => open--,
--		DOE           => open
	);

	mc_cpu_ram : entity work.MC_CPU_RAM
	port map (
		I_CLK         => W_CLK_12M,
		I_CS          => W_CPU_RAM_CS,
		I_ADDR        => W_A(9 downto 0),
		I_D           => W_BDI,
		I_WE          => W_CPU_WR,
		I_OE          => W_CPU_RAM_RD,
		O_D           => W_CPU_RAM_DO
	);

	-- Kingball only now, original Moon Cresta ROM is scrambled
  W_MOONCR <= '1' when I_HWSEL = HW_KINGBAL else '0';

	mc_adec : entity work.MC_ADEC
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_RSTn        => W_RESETn,
		I_MOONCR      => W_MOONCR,

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
--		O_CPU_RAM_WR  => W_CPU_RAM_WR,
		O_CPU_RAM_CS  => W_CPU_RAM_CS,
		O_OBJ_RAM_RD  => W_OBJ_RAM_RD,
		O_OBJ_RAM_WR  => W_OBJ_RAM_WR,
		O_OBJ_RAM_RQ  => W_OBJ_RAM_RQ,
		O_VID_RAM_RD  => W_VID_RAM_RD,
		O_VID_RAM_WR  => W_VID_RAM_WR,
		O_SW0_OE      => W_SW0_OE,
		O_SW1_OE      => W_SW1_OE,
		O_DIP_OE      => W_DIP_OE,
		O_WDR_OE      => W_WDR_OE,
		O_DRIVER_WE   => W_DRIVER_WE,
		O_SOUND_WE    => W_SOUND_WE,
		O_MISC_WE     => W_MISC_WE,
		O_PITCH       => W_PITCH,
		O_H_FLIP      => W_H_FLIP,
		O_V_FLIP      => W_V_FLIP,
		O_SPEECH      => W_SPEECH_IN,
		O_SPEECH_DIP  => W_SPEECH_DIP,
		O_BD_G        => W_BD_G,
		O_STARS_ON    => W_STARS_ON,
		O_ROM_SWP     => W_ROM_SWP
	);

	-- active high buttons
	mc_inport : entity work.MC_INPORT
	port map (
		I_HWSEL       => I_HWSEL,
		I_TABLE       => I_TABLE,
		I_TEST        => I_TEST,
		I_SERVICE     => I_SERVICE,
		I_SW1_67      => I_SW1_67,
		I_COIN1       => P1_CSJUDLR(6),
		I_COIN2       => P2_CSJUDLR(6),
		I_1P_START    => P1_CSJUDLR(5),
		I_2P_START    => P2_CSJUDLR(5),
		I_1P_SH       => P1_CSJUDLR(4),
		I_2P_SH       => P2_CSJUDLR(4),
		I_1P_LE       => P1_CSJUDLR(1),
		I_2P_LE       => P2_CSJUDLR(1),
		I_1P_RI       => P1_CSJUDLR(0),
		I_2P_RI       => P2_CSJUDLR(0),
		I_1P_UP       => P1_CSJUDLR(3),
		I_2P_UP       => P2_CSJUDLR(3),
		I_1P_DN       => P1_CSJUDLR(2),
		I_2P_DN       => P2_CSJUDLR(2),
		I_SW0_OE      => W_SW0_OE,
		I_SW1_OE      => W_SW1_OE,
		I_DIP_OE      => W_DIP_OE,
		I_DIP         => I_DIP,
		I_SPEECH_DIP  => W_SPEECH_DIP,
		I_RAND        => W_V_CNT(0),
		O_D           => W_SW_DO
	);

	mc_hv : entity work.MC_HV_COUNT
	port map(
		I_CLK         => W_CLK_6M,
		I_RSTn        => W_RESETn,
		O_H_CNT       => W_H_CNT,
		O_H_SYNC      => W_H_SYNC_int,
		O_H_BL        => W_H_BL,
		O_H_BLn       => W_H_BLn,
		O_V_CNT       => W_V_CNT,
		O_V_SYNC      => W_V_SYNC_int,
		O_V_BL2n      => W_V_BL2n,
		O_V_BLn       => W_V_BLn,
		O_C_BLn       => W_C_BLn
	);

	mc_col_pal : entity work.MC_COL_PAL
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_VID         => W_VID,
		I_COL         => W_COL,
		I_C_BLnX      => W_C_BLnX,
		I_H_BLnX      => W_H_BLnX,

		I_DL_ADDR     => I_DL_ADDR,
		I_DL_DATA     => I_DL_DATA,
		I_DL_WR       => I_DL_WR,

		O_C_BLXn      => W_C_BLXn,
		O_H_BLXn      => W_H_BLXn,
		O_STARS_OFFn  => W_STARS_OFFn,
		O_R           => W_VIDEO_R,
		O_G           => W_VIDEO_G,
		O_B           => W_VIDEO_B
	);

	mc_stars : entity work.MC_STARS
	port map (
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_H_FLIP      => W_H_FLIP,
		I_V_SYNC      => W_V_SYNC_int,
		I_8HF         => W_8HF,
		I_256HnX      => W_256HnX,
		I_1VF         => W_1VF,
		I_2V          => W_V_CNT(1),
		I_STARS_ON    => W_STARS_ON_ADJ,
		I_STARS_OFFn  => W_STARS_OFFn,
		O_R           => W_STARS_R,
		O_G           => W_STARS_G,
		O_B           => W_STARS_B,
		O_NOISE       => open
	);

	mc_sound_a : entity work.MC_SOUND_A
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_H_CNT1      => W_H_CNT(1),
		I_BD          => W_BDI,
		I_PITCH       => W_PITCH,
		I_VOL1        => W_VOL1,
		I_VOL2        => W_VOL2,
		O_SDAT        => W_SDAT_A,
		O_DO          => open
	);

	vmc_sound_b : entity work.MC_SOUND_B
	port map(
		I_CLK1        => W_CLK_6M,
		I_RSTn        => rst_count(3),
		I_SW          => new_sw,
		I_DAC         => W_DAC,
		I_FS          => W_FS,
		O_SDAT        => W_SDAT_B
	);

--------- ROM           -------------------------------------------------------

--	mc_roms : entity work.ROM_PGM_0
--	port map (
--		CLK  => W_CLK_12M,
--		ADDR => W_CPU_ROM_ADDR,
--		DATA => W_CPU_ROM_DO
--	);

	mc_roms : work.dpram generic map (14,8)
	port map
	(
		clock_a   => W_CLK_12M,
		wren_a    => W_CPU_ROM_WR,
		address_a => I_DL_ADDR(13 downto 0),
		data_a    => I_DL_DATA,

		clock_b   => W_CLK_12M,
		address_b => W_CPU_ROM_ADDR(13 downto 0),
		q_b       => W_CPU_ROM_DO
	);

	W_CPU_ROM_WR <= '1' when I_DL_WR = '1' and I_DL_ADDR(15 downto 14) = "00" else '0'; -- 0000-3FFF
	W_CPU_ROM_ADDR <=  W_A(13) & (W_A(12) xor (W_ROM_SWP and W_A(13))) & W_A(11 downto 0) when I_HWSEL = HW_ZIGZAG else
	                   W_A(13 downto 11) & (W_A(10) xor (not W_A(13))) & (W_A(9) xor (not W_A(13))) & W_A(8 downto 0) when I_HWSEL = HW_ORBITRON else
	                   W_A(12) & W_A(11) & not W_A(13) & W_A(10 downto 0) when I_HWSEL = HW_DEVILFSH else
	                   W_A(13 downto 0);

-------- VIDEO  -----------------------------
	blx_comb <= not ( W_C_BLXn and W_V_BL2n );
	W_V_SYNC <= not W_V_SYNC_int;
	W_H_SYNC <= not W_H_SYNC_int;
	O_CMPBL  <= W_C_BLnX;
	
	-- MISSILE => Yellow ;
	-- SHELL   => White  ;
	W_MS_D <= not (W_MISSILEn and W_SHELLn);
	W_MS_R <= not   blx_comb  and W_MS_D;
	W_MS_G <= not   blx_comb  and W_MS_D;
	W_MS_B <= not   blx_comb  and W_MS_D and not W_SHELLn ;

	W_R <= W_VIDEO_R or (W_STARS_R & "0") or (W_MS_R & W_MS_R & "0");
	W_G <= W_VIDEO_G or (W_STARS_G & "0") or (W_MS_G & W_MS_G & "0");
	W_B <= W_VIDEO_B or (W_STARS_B & "0") or (W_MS_B & W_MS_B & "0");

	process(W_CLK_6M)
	begin
		if rising_edge(W_CLK_6M) then
			HBLANK   <= not W_H_BLXn;
			VBLANK   <= not W_V_BL2n;
		end if;
	end process;


-----  CPU I/F  -------------------------------------

	W_CPU_CLK_EN  <= not W_H_CNT(0); -- CPU clock enable in the 6MHz domain
--	W_CPU_CLK     <= W_H_CNT(0);

	W_CPU_ROM_DOB <= W_CPU_ROM_DO when W_CPU_ROM_CS = '1' else (others=>'0');

	W_RESETn  <= not I_RESET;
	W_BDO     <= W_SW_DO  or W_VID_DO or W_CPU_RAM_DO or W_CPU_ROM_DOB ;
	W_CPU_WR  <= not W_CPU_WRn;

	new_sw <= (W_FS(2) or W_FS(1) or W_FS(0)) & W_HIT & W_FIRE;

	process(W_CLK_6M, I_RESET)
	begin
		if (I_RESET = '1') then
			rst_count <= (others => '0');
		elsif rising_edge( W_CLK_6M) then
			if ( W_CPU_CLK_EN = '1' and rst_count /= x"f") then
				rst_count <= rst_count + 1;
			end if;
		end if;
	end process;

-----  Parts 9L ---------
	process(W_CLK_12M, I_RESET)
	begin
		if (I_RESET = '1') then
			W_FS   <= (others=>'0');
			W_HIT  <= '0';
			W_FIRE <= '0';
			W_VOL1 <= '0';
			W_VOL2 <= '0';
		elsif rising_edge(W_CLK_12M) then
			if (W_SOUND_WE = '1') then
				case(W_A(2 downto 0)) is
					when "000" => W_FS(0) <= W_BDI(0);
					when "001" => W_FS(1) <= W_BDI(0);
					when "010" => W_FS(2) <= W_BDI(0);
					when "011" => W_HIT   <= W_BDI(0);
--					when "100" => UNUSED  <= W_BDI(0);
					when "101" => W_FIRE  <= W_BDI(0);
					when "110" => W_VOL1  <= W_BDI(0);
					when "111" => W_VOL2  <= W_BDI(0);
					when others => null;
				end case;
			end if;
		end if;
	end process;

-----  Parts 9M ---------
	process(W_CLK_12M, I_RESET)
	begin
		if (I_RESET = '1') then
			W_DAC   <= (others=>'0');
		elsif rising_edge(W_CLK_12M) then
			if (W_DRIVER_WE = '1') then
				case(W_A(2 downto 0)) is
					-- next 4 outputs go off board via ULN2075 buffer
--					when "000" => 1P START  <= W_BDI(0);
--					when "001" => 2P START  <= W_BDI(0);
--					when "010" => COIN LOCK <= W_BDI(0);
--					when "011" => COIN CTR  <= W_BDI(0);
					when "100" => W_DAC(0)  <= W_BDI(0); --   1M
					when "101" => W_DAC(1)  <= W_BDI(0); -- 470K
					when "110" => W_DAC(2)  <= W_BDI(0); -- 220K
					when "111" => W_DAC(3)  <= W_BDI(0); -- 100K
					when others => null;
				end case;
			end if;
		end if;
	end process;

-------------------------------------------------------------------------------

	-- King & Balloon speech board
	speech : entity work.kb_synth
	port map(
		reset_n       => W_RESETn,
		clk           => W_CLK_12M,
		in0           => W_SPEECH_IN(0),
		in1           => W_SPEECH_IN(1),
		in2           => '0', -- GND
		in3           => '0', -- GND
		speech_out    => W_SPEECH_OUT
	);

	-- AY8910 for ZigZag
	PSG_EN <= '1' when I_HWSEL = HW_ZIGZAG and W_A(15 downto 11) = "01001" and W_A(9) = '0' and W_CPU_MREQn = '0' and W_CPU_WRn = '0' else '0';

	process(W_CLK_6M)
	begin
		if rising_edge(W_CLK_6M) then
			if PSG_EN = '1' and W_A(8) = '1' then
				PSG_D <= W_A(7 downto 0);
			end if;
		end if;
	end process;

	psg : ym2149
	port map (
		CLK       => W_CLK_6M,
		CE        => W_CPU_CLK_EN,
		RESET     => I_RESET,

		BDIR      => PSG_EN and W_A(0) and not W_A(8),
		BC        => W_A(1),
		DI        => PSG_D,

		CHANNEL_A => PSG_A,
		CHANNEL_B => PSG_B,
		CHANNEL_C => PSG_C
	);

	PSG_OUT <= ("00" & PSG_A) + ("00" & PSG_B) + ("00" & PSG_C);

	process(I_HWSEL, W_SPEECH_OUT, PSG_OUT, W_STARS_ON)
	begin
		if I_HWSEL = HW_KINGBAL then
			W_STARS_ON_ADJ <= '0'; -- no stars in this game
			W_SDAT_C <= W_SPEECH_OUT;
		elsif I_HWSEL = HW_ZIGZAG then
			W_STARS_ON_ADJ <= '0';
			W_SDAT_C <= PSG_OUT(9 downto 2);
		elsif I_HWSEL = HW_VICTORY then
			W_STARS_ON_ADJ <= '0';
			W_SDAT_C <= (others => '0');
		else
			W_STARS_ON_ADJ <= W_STARS_ON;
			W_SDAT_C <= (others => '0');
		end if;
	end process;

end RTL;
