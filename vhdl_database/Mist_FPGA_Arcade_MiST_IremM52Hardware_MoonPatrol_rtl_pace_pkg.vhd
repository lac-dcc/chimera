library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

package pace_pkg is

	--  
	-- PACE constants which *MUST* be defined
	--

  type PACETargetType is
  (
    PACE_TARGET_NANOBOARD_NB1,
    PACE_TARGET_DE0,
    PACE_TARGET_DE0_CV,		-- 5CEBA4
    PACE_TARGET_DE0_NANO,	-- EP4CE22
    PACE_TARGET_DE1,
    PACE_TARGET_DE2,
    PACE_TARGET_DE2_70,		-- EP2C70
    PACE_TARGET_DE2_115,	-- EP4CE115
    PACE_TARGET_P2,		-- A02 build
    PACE_TARGET_P2A,		-- A04/A build (SRAM byte selects)
    PACE_TARGET_P3M,
    PACE_TARGET_S3A_700,	-- Spartan 3A/N Starter Kit
    PACE_TARGET_RC10,
    PACE_TARGET_NX2_12,
    PACE_TARGET_NEXYS_3,	-- Digilent S6 board
    PACE_TARGET_CYC3DEV,
    PACE_TARGET_CYC5GXDEV,
    PACE_TARGET_COCO3PLUS,
    PACE_TARGET_S5A,
    PACE_TARGET_CARTEBLANCHE_250,
    PACE_TARGET_CARTEBLANCHE_500,
    PACE_TARGET_BEMICRO,
    PACE_TARGET_OPENEP3C16,
    PACE_TARGET_MIST,
    PACE_TARGET_CHAMELEON64,
    PACE_TARGET_RETRORAMBLINGS_CYC3,  -- Generic EP3C25 board with custom io boards
    PACE_TARGET_S5A_R2_EP4C,
    PACE_TARGET_S5A_R2_EP3SL,
    PACE_TARGET_S5A_R2B0_EP4C,
    PACE_TARGET_S5A_R2B0_EP3SL,
    PACE_TARGET_S5A_R2C0_EP4C,
    PACE_TARGET_S5A_R2C0_EP3SL,
    PACE_TARGET_S5L_A0_EP4C,
    PACE_TARGET_S5L_A0_EP3SL,
    PACE_TARGET_NAVICO_ROCKY,
    PACE_TARGET_NGPACE,
    PACE_TARGET_S6M_A0
  );

	type PACEFpgaVendor_t is
	(
		PACE_FPGA_VENDOR_ALTERA,
		PACE_FPGA_VENDOR_XILINX,
		PACE_FPGA_VENDOR_LATTICE
	);

	type PACEFpgaFamily_t is
	(
		PACE_FPGA_FAMILY_CYCLONE1,
		PACE_FPGA_FAMILY_CYCLONE2,
		PACE_FPGA_FAMILY_CYCLONE3,
		PACE_FPGA_FAMILY_CYCLONE4,
		PACE_FPGA_FAMILY_CYCLONE5,
		PACE_FPGA_FAMILY_CYCLONE6,
		PACE_FPGA_FAMILY_STRATIX_III,
		PACE_FPGA_FAMILY_SPARTAN3,
		PACE_FPGA_FAMILY_SPARTAN3A,
		PACE_FPGA_FAMILY_SPARTAN3E
	);

  type PACEJamma_t is
  (
    PACE_JAMMA_NONE,
    PACE_JAMMA_MAPLE,
    PACE_JAMMA_NGC,
    PACE_JAMMA_PS2
  );

  -- Types

	type ByteArrayType is array (natural range <>) of std_logic_vector(7 downto 0);

  type from_CLKRST_t is record
    arst      : std_logic;
    arst_n    : std_logic;
    rst       : std_logic_vector(0 to 3);
    clk_ref   : std_logic;                  --reference clock
    clk       : std_logic_vector(0 to 3);
  end record;
  
  -- maximums from the DE2 target

  constant PACE_NUM_SWITCHES  : natural := 18;
  subtype from_SWITCHES_t is std_logic_vector(PACE_NUM_SWITCHES-1 downto 0);
  
  constant PACE_NUM_BUTTONS   : natural := 4;
  subtype from_BUTTONS_t is std_logic_vector(PACE_NUM_BUTTONS-1 downto 0);
  
  constant PACE_NUM_LEDS      : natural := 18;
  subtype to_LEDS_t is std_logic_vector(PACE_NUM_LEDS-1 downto 0);
  
	--
	-- JAMMA interface data structures
	-- - note: all signals are active LOW
	--

	type from_JAMMA_player_t is record
		start			: std_logic;
		up				: std_logic;
		down			: std_logic;
		left			: std_logic;
		right			: std_logic;
		button		: std_logic_vector(1 to 5);
	end record;

	type from_JAMMA_player_a is array (natural range <>) of from_JAMMA_player_t;
	
	type from_JAMMA_t is record
		coin_cnt	: std_logic_vector(1 to 2);
		service		: std_logic;
		tilt			: std_logic;
		test			: std_logic;
		coin			: std_logic_vector(1 to 2);
		p					: from_JAMMA_player_a(1 to 2);
	end record;

  --
  -- INPUTS
  --
  subtype analogue_in_t is std_logic_vector(9 downto 0);
  type analogue_in_a is array (natural range <>) of analogue_in_t;
  
	type from_INPUTS_t is record
    ps2_kclk  : std_logic;
    ps2_kdat  : std_logic;
    ps2_mclk  : std_logic;
    ps2_mdat  : std_logic;
    jamma_n   : from_JAMMA_t;
    -- up to 4 10-bit analgue inputs
    analogue  : analogue_in_a(1 to 4);
  end record;

  type in8_t is record
    d         : std_logic_vector(7 downto 0);
  end record;
  
  type from_MAPPED_INPUTS_t is array (natural range <>) of in8_t;
  
	-- create a constant that automatically determines 
	-- whether this is simulation or synthesis
	constant IN_SIMULATION : BOOLEAN := false
	-- synthesis translate_off
	or true
	-- synthesis translate_on
	;
	constant IN_SYNTHESIS : boolean := not IN_SIMULATION;
	
end;
