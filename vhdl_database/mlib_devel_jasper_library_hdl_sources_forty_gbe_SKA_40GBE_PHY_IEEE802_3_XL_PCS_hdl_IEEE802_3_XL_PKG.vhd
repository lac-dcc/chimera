----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 01.08.2014 13:07:59
-- Design Name: 
-- Module Name: IEEE802_3_XL_PKG - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


package IEEE802_3_XL_PKG is

	--Type declarations for standard computing types
	subtype BYTE_t is std_logic_vector(7 downto 0); -- Equivalent to an Octet
	type BYTE_ARRAY_t is array (natural range <>) of BYTE_t;
	subtype NIBBLE_t is std_logic_vector(3 downto 0);
	type NIBBLE_ARRAY_t is array (natural range <>) of NIBBLE_t;

	-- NB: A unit of PCS encoded data is referred to as a BLOCK in this design
	-- This would include variables such as tx_coded, rx_coded, etc

	-- This design uses a custom type called BLOCK
	-- A BLOCK is the type used for all data which has been encoded into 66 bit Blocks in the PCS
	type BLOCK_t is record
		H : std_logic_vector(1 downto 0); --Header
		P : std_logic_vector(63 downto 0); --Payload
	end record;

	--Since we have multiple lanes in the PCS a BLOCK ARRAY type is defined
	--Expected usage is (0 to 3) for 40GbE PCS
	type BLOCK_ARRAY_t is array (natural range <>) of BLOCK_t;

	-- This design uses a custom type called BLOCK
	-- A BLOCK is the type used for all data which has been encoded into 66 bit Blocks in the PCS
	type XLGMII_t is record
		C : std_logic_vector(7 downto 0); --Header
		D : std_logic_vector(63 downto 0); --Payload
	end record;

	--Since we have multiple lanes in the PCS a BLOCK ARRAY type is defined
	--Expected usage is (0 to 3) for 40GbE PCS
	type XLGMII_ARRAY_t is array (natural range <>) of XLGMII_t;

	-- BLOCK TYPE FIELD LIST
	-- IEEE802_3 CL82 defines 11 BLOCK type fields 
	constant bCX : std_logic_vector(7 downto 0) := x"1E";
	constant bS0 : std_logic_vector(7 downto 0) := x"78";
	constant bO0 : std_logic_vector(7 downto 0) := x"4B";
	constant bT0 : std_logic_vector(7 downto 0) := x"87";
	constant bT1 : std_logic_vector(7 downto 0) := x"99";
	constant bT2 : std_logic_vector(7 downto 0) := x"AA";
	constant bT3 : std_logic_vector(7 downto 0) := x"B4";
	constant bT4 : std_logic_vector(7 downto 0) := x"CC";
	constant bT5 : std_logic_vector(7 downto 0) := x"D2";
	constant bT6 : std_logic_vector(7 downto 0) := x"E1";
	constant bT7 : std_logic_vector(7 downto 0) := x"FF";

	-- The Control BLOCKs then include control characters from this list
	-- NB: Control Characters used in BLOCKS are 7 bit
	constant cI : std_logic_vector(6 downto 0) := "0000000";
	constant cE : std_logic_vector(6 downto 0) := "0011110";

	-- A list of common control blocks is defined here
	constant IBLOCK_T : BLOCK_t := (H => "01", P => cI & cI & cI & cI & cI & cI & cI & cI & bCX);
	constant EBLOCK_T : BLOCK_t := (H => "01", P => cE & cE & cE & cE & cE & cE & cE & cE & bCX);
	constant LBLOCK_T : BLOCK_t := (H => "01", P => x"0000000" & x"0" & x"01" & x"00" & x"00" & bO0);

	type BLOCK_TYPE_t is (DX, IX, S0, O0, TX, EX);
	type RAW_TYPE_t is (DX, IX, S0, O0, TX, EX);

	constant rI : std_logic_vector(7 downto 0) := x"07";
	constant rO : std_logic_vector(7 downto 0) := x"9C";
	constant rS : std_logic_vector(7 downto 0) := x"FB";
	constant rT : std_logic_vector(7 downto 0) := x"FD";
	constant rE : std_logic_vector(7 downto 0) := x"FE";

	constant IBLOCK_R : XLGMII_t := (C => x"FF", D => rI & rI & rI & rI & rI & rI & rI & rI);
	constant EBLOCK_R : XLGMII_t := (C => x"FF", D => rE & rE & rE & rE & rE & rE & rE & rE);
	constant LBLOCK_R : XLGMII_t := (C => x"01", D => x"00000000" & x"01" & x"00" & x"00" & x"9C");

	--constant EBLOCK_R : std_logic_vector(71 downto 0) := cE & cE & cE & cE & cE & cE & cE & cE & x"FF";
	--constant LBLOCK_R : std_logic_vector(71 downto 0) := x"00000000" & x"02" & x"00" & x"00" & x"9C" & x"01";


	constant AM_BLOCKs : BLOCK_ARRAY_t := (
		0 => (H => "01", P => x"FF" & x"B8" & x"89" & x"6F" & x"00" & x"47" & x"76" & x"90"),
		1 => (H => "01", P => x"FF" & x"19" & x"3B" & x"0F" & x"00" & x"E6" & x"C4" & x"F0"),
		2 => (H => "01", P => x"FF" & x"64" & x"9A" & x"3A" & x"00" & x"9B" & x"65" & x"C5"),
		3 => (H => "01", P => x"FF" & x"C2" & x"86" & x"5D" & x"00" & x"3D" & x"79" & x"A2")
	);

	--IEEE802_3_XL_PHY (12-OCT-2015)
	component IEEE802_3_XL_PHY is
		Generic(
			TX_POLARITY_INVERT : std_logic_vector(3 downto 0) := "0000";
			USE_CHIPSCOPE      : integer                      := 0 -- Set to 1 to use Chipscope to drive resets and monitor status
		);
		Port(
			SYS_CLK_I                  : in  std_logic;
			SYS_CLK_RST_I              : in  std_logic;

			GTREFCLK_PAD_N_I           : in  std_logic;
			GTREFCLK_PAD_P_I           : in  std_logic;

			GTREFCLK_O                 : out std_logic;

			TXN_O                      : out std_logic_vector(3 downto 0);
			TXP_O                      : out std_logic_vector(3 downto 0);
			RXN_I                      : in  std_logic_vector(3 downto 0);
			RXP_I                      : in  std_logic_vector(3 downto 0);

			SOFT_RESET_I               : in  std_logic;

			GT_TX_READY_O              : out std_logic_vector(3 downto 0);
			GT_RX_READY_O              : out std_logic_vector(3 downto 0);

			-- XLGMII INPUT Interface
			-- Transmitter Interface
			XLGMII_X4_TX_I             : in  XLGMII_ARRAY_t(3 downto 0);

			-- XLGMII Output Interface
			-- Receiver Interface
			XLGMII_X4_RX_O             : out XLGMII_ARRAY_t(3 downto 0);

			BLOCK_LOCK_O               : out std_logic_vector(3 downto 0);
			AM_LOCK_O                  : out std_logic_vector(3 downto 0);
			ALIGN_STATUS_O             : out std_logic;

			TEST_PATTERN_EN_I          : in  std_logic;
			TEST_PATTERN_ERROR_COUNT_O : out std_logic_vector(15 downto 0)
		);
	end component IEEE802_3_XL_PHY;

	--IEEE802_3_XL_PMA (06-AUG-2015)
	component IEEE802_3_XL_PMA is
		generic(
			TX_POLARITY_INVERT          : std_logic_vector(3 downto 0) := "0000";
			EXAMPLE_SIM_GTRESET_SPEEDUP : string                       := "TRUE"; -- simulation setting for GT SecureIP model
			STABLE_CLOCK_PERIOD         : integer                      := 7;
			EXAMPLE_USE_CHIPSCOPE       : integer                      := 0 -- Set to 1 to use Chipscope to drive resets
		);
		port(
			SYS_CLK_I               : in  std_logic;

			SOFT_RESET_IN           : in  std_logic;

			GTREFCLK_PAD_N_I        : in  std_logic;
			GTREFCLK_PAD_P_I        : in  std_logic;

			GTREFCLK_O              : out std_logic;

			GT0_TXOUTCLK_OUT        : out std_logic;
			GT_TXUSRCLK2_IN         : in  std_logic;
			GT_TXUSRCLK_IN          : in  std_logic;
			GT_TXUSRCLK_LOCKED_IN   : in  std_logic;
			GT_TXUSRCLK_RESET_OUT   : out std_logic;

			GT0_RXOUTCLK_OUT        : out std_logic;
			GT_RXUSRCLK2_IN         : in  std_logic;
			GT_RXUSRCLK_IN          : in  std_logic;
			GT_RXUSRCLK_LOCKED_IN   : in  std_logic;
			GT_RXUSRCLK_RESET_OUT   : out std_logic;

			TX_READ_EN_O            : out std_logic;

			LANE0_TX_HEADER_I       : in  std_logic_vector(1 downto 0);
			LANE0_TX_DATA_I         : in  std_logic_vector(63 downto 0);
			LANE1_TX_HEADER_I       : in  std_logic_vector(1 downto 0);
			LANE1_TX_DATA_I         : in  std_logic_vector(63 downto 0);
			LANE2_TX_HEADER_I       : in  std_logic_vector(1 downto 0);
			LANE2_TX_DATA_I         : in  std_logic_vector(63 downto 0);
			LANE3_TX_HEADER_I       : in  std_logic_vector(1 downto 0);
			LANE3_TX_DATA_I         : in  std_logic_vector(63 downto 0);

			LANE0_RX_HEADER_VALID_O : out std_logic;
			LANE0_RX_HEADER_O       : out std_logic_vector(1 downto 0);
			LANE0_RX_DATA_VALID_O   : out std_logic;
			LANE0_RX_DATA_O         : out std_logic_vector(63 downto 0);
			LANE0_RX_GEARBOXSLIP_I  : in  std_logic;
			LANE0_RX_DATA_VALID_I   : in  std_logic;
			LANE1_RX_HEADER_VALID_O : out std_logic;
			LANE1_RX_HEADER_O       : out std_logic_vector(1 downto 0);
			LANE1_RX_DATA_VALID_O   : out std_logic;
			LANE1_RX_DATA_O         : out std_logic_vector(63 downto 0);
			LANE1_RX_GEARBOXSLIP_I  : in  std_logic;
			LANE1_RX_DATA_VALID_I   : in  std_logic;
			LANE2_RX_HEADER_VALID_O : out std_logic;
			LANE2_RX_HEADER_O       : out std_logic_vector(1 downto 0);
			LANE2_RX_DATA_VALID_O   : out std_logic;
			LANE2_RX_DATA_O         : out std_logic_vector(63 downto 0);
			LANE2_RX_GEARBOXSLIP_I  : in  std_logic;
			LANE2_RX_DATA_VALID_I   : in  std_logic;
			LANE3_RX_HEADER_VALID_O : out std_logic;
			LANE3_RX_HEADER_O       : out std_logic_vector(1 downto 0);
			LANE3_RX_DATA_VALID_O   : out std_logic;
			LANE3_RX_DATA_O         : out std_logic_vector(63 downto 0);
			LANE3_RX_GEARBOXSLIP_I  : in  std_logic;
			LANE3_RX_DATA_VALID_I   : in  std_logic;

			TXN_O                   : out std_logic_vector(3 downto 0);
			TXP_O                   : out std_logic_vector(3 downto 0);
			RXN_I                   : in  std_logic_vector(3 downto 0);
			RXP_I                   : in  std_logic_vector(3 downto 0);

			GT_TX_READY_O           : out std_logic_vector(3 downto 0);
			GT_RX_READY_O           : out std_logic_vector(3 downto 0);

			gt0_txbufstatus_out     : out std_logic_vector(1 downto 0);
			gt0_rxbufstatus_out     : out std_logic_vector(2 downto 0);
			gt1_txbufstatus_out     : out std_logic_vector(1 downto 0);
			gt1_rxbufstatus_out     : out std_logic_vector(2 downto 0);
			gt2_txbufstatus_out     : out std_logic_vector(1 downto 0);
			gt2_rxbufstatus_out     : out std_logic_vector(2 downto 0);
			gt3_txbufstatus_out     : out std_logic_vector(1 downto 0);
			gt3_rxbufstatus_out     : out std_logic_vector(2 downto 0)
		);
	end component IEEE802_3_XL_PMA;

	--IEEE802_3_XL_PCS (13-FEB-2015)
	component IEEE802_3_XL_PCS is
		Port(
			SYS_CLK_I                          : in  std_logic;
			SYS_RST_I                          : in  std_logic;

			XL_TX_CLK_156M25_I                 : in  std_logic;
			XL_TX_CLK_161M133_I                : in  std_logic;
			XL_TX_CLK_625M_I                   : in  std_logic;
			XL_TX_CLK_RST_I                    : in  std_logic;

			-- XLGMII INPUT Interface
			-- Transmitter Interface
			XLGMII_TX_I                        : in  XLGMII_t;

			TX_ENABLE_I                        : in  std_logic;

			LANE0_TX_HEADER_O                  : out std_logic_vector(1 downto 0);
			LANE0_TX_DATA_O                    : out std_logic_vector(63 downto 0);
			LANE1_TX_HEADER_O                  : out std_logic_vector(1 downto 0);
			LANE1_TX_DATA_O                    : out std_logic_vector(63 downto 0);
			LANE2_TX_HEADER_O                  : out std_logic_vector(1 downto 0);
			LANE2_TX_DATA_O                    : out std_logic_vector(63 downto 0);
			LANE3_TX_HEADER_O                  : out std_logic_vector(1 downto 0);
			LANE3_TX_DATA_O                    : out std_logic_vector(63 downto 0);

			XL_RX_CLK_156M25_I                 : in  std_logic;
			XL_RX_CLK_161M133_I                : in  std_logic;
			XL_RX_CLK_625M_I                   : in  std_logic;
			XL_RX_CLK_RST_I                    : in  std_logic;

			-- XLGMII Output Interface
			-- Receiver Interface
			XLGMII_RX_O                        : out XLGMII_t;

			LANE0_RX_HEADER_VALID_I            : in  std_logic;
			LANE0_RX_HEADER_I                  : in  std_logic_vector(1 downto 0);
			LANE0_RX_DATA_VALID_I              : in  std_logic;
			LANE0_RX_DATA_I                    : in  std_logic_vector(63 downto 0);
			LANE0_RX_GEARBOXSLIP_O             : out std_logic;
			LANE1_RX_HEADER_VALID_I            : in  std_logic;
			LANE1_RX_HEADER_I                  : in  std_logic_vector(1 downto 0);
			LANE1_RX_DATA_VALID_I              : in  std_logic;
			LANE1_RX_DATA_I                    : in  std_logic_vector(63 downto 0);
			LANE1_RX_GEARBOXSLIP_O             : out std_logic;
			LANE2_RX_HEADER_VALID_I            : in  std_logic;
			LANE2_RX_HEADER_I                  : in  std_logic_vector(1 downto 0);
			LANE2_RX_DATA_VALID_I              : in  std_logic;
			LANE2_RX_DATA_I                    : in  std_logic_vector(63 downto 0);
			LANE2_RX_GEARBOXSLIP_O             : out std_logic;
			LANE3_RX_HEADER_VALID_I            : in  std_logic;
			LANE3_RX_HEADER_I                  : in  std_logic_vector(1 downto 0);
			LANE3_RX_DATA_VALID_I              : in  std_logic;
			LANE3_RX_DATA_I                    : in  std_logic_vector(63 downto 0);
			LANE3_RX_GEARBOXSLIP_O             : out std_logic;

			BLOCK_LOCK_O                       : out std_logic_vector(3 downto 0);
			AM_LOCK_O                          : out std_logic_vector(3 downto 0);
			ALIGN_STATUS_O                     : out std_logic;
			BIP_ERROR_O                        : out std_logic;

			TEST_PATTERN_EN_I                  : in  std_logic;
			TEST_PATTERN_ERROR_QUAD_O          : out std_logic_vector(3 downto 0);

			ENCODER_START_DETECTED_COUNT_O     : out std_logic_vector(31 downto 0);
			ENCODER_TERMINATE_DETECTED_COUNT_O : out std_logic_vector(31 downto 0);
			DECODER_START_DETECTED_COUNT_O     : out std_logic_vector(31 downto 0);
			DECODER_TERMINATE_DETECTED_COUNT_O : out std_logic_vector(31 downto 0);
			ENC_DEC_COUNT_RST_I                : in  std_logic
		);
	end component IEEE802_3_XL_PCS;

	--IEEE802_3_XL_RS (09-DEC-2015)
	component IEEE802_3_XL_RS is
		Port(
			SYS_CLK_I              : in  std_logic;
			SYS_RST_I              : in  std_logic;

			XL_TX_CLK_156M25_I     : in  std_logic;
			XL_TX_CLK_625M_I       : in  std_logic;
			XL_TX_CLK_RST_I        : in  std_logic;

			-- XLGMII INPUT Interface
			-- Transmitter Interface
			XLGMII_TX_O            : out XLGMII_t;
			XLGMII_X4_TX_I         : in  XLGMII_ARRAY_t(3 downto 0);

			XL_RX_CLK_156M25_I     : in  std_logic;
			XL_RX_CLK_625M_I       : in  std_logic;
			XL_RX_CLK_RST_I        : in  std_logic;

			-- XLGMII Output Interface
			-- Receiver Interface
			XLGMII_RX_I            : in  XLGMII_t;
			XLGMII_X4_RX_O         : out XLGMII_ARRAY_t(3 downto 0);

			RX_FRAME_COUNT_O       : out std_logic_vector(31 downto 0);
			RX_FRAME_ERROR_COUNT_O : out std_logic_vector(31 downto 0)
		);
	end component IEEE802_3_XL_RS;

	--IEEE802_3_XL_PCS_ENCODER (30-JAN-2015)
	component IEEE802_3_XL_PCS_ENCODER
		Port(
			CLK_I                      : in  std_logic;
			RST_I                      : in  std_logic;
			-- XLGMII INPUT Interface
			-- Transmitter Interface
			XLGMII_TX_I                : in  XLGMII_t;

			BLOCK_VALID_O              : out std_logic;
			PCS_BLOCK_O                : out BLOCK_t;

			FRAME_START_DETECTED_O     : out std_logic;
			FRAME_TERMINATE_DETECTED_O : out std_logic
		);
	end component IEEE802_3_XL_PCS_ENCODER;

	--IEEE802_3_XL_PCS_DECODER (30-JAN-2015)
	component IEEE802_3_XL_PCS_DECODER
		Port(
			CLK_I                      : in  std_logic;
			RST_I                      : in  std_logic;

			PCS_BLOCK_I                : in  BLOCK_t;

			BLOCK_IDLE_I               : in  std_logic;

			-- XLGMII Output Interface
			-- Receiver Interface
			XLGMII_RX_O                : out XLGMII_t;

			FRAME_START_DETECTED_O     : out std_logic;
			FRAME_TERMINATE_DETECTED_O : out std_logic
		);
	end component IEEE802_3_XL_PCS_DECODER;

	--IEEE802_3_XL_PCS_SCRAMBLER (14-OCT-2015)
	component IEEE802_3_XL_PCS_SCRAMBLER is
		Port(
			CLK_I         : in  std_logic;
			RST_I         : in  std_logic;

			BLOCK_VALID_I : in  std_logic;
			PCS_BLOCK_I   : in  BLOCK_t;
			BLOCK_VALID_O : out std_logic;
			PCS_BLOCK_O   : out BLOCK_t
		);
	end component IEEE802_3_XL_PCS_SCRAMBLER;

	--IEEE802_3_XL_PCS_DESCRAMBLER (13-APR-2015)
	component IEEE802_3_XL_PCS_DESCRAMBLER is
		Port(
			CLK_I         : in  std_logic;
			RST_I         : in  std_logic;

			PCS_BLOCK_I   : in  BLOCK_t;
			BLOCK_VALID_I : in  std_logic;
			PCS_BLOCK_O   : out BLOCK_t;
			BLOCK_VALID_O : out std_logic
		);
	end component IEEE802_3_XL_PCS_DESCRAMBLER;

	--IEEE802_3_XL_PCS_AM_INSERTER (29-SEPT-2014)
	component IEEE802_3_XL_PCS_AM_INSERTER is
		Port(
			CLK_I              : in  std_logic;
			RST_I              : in  std_logic;

			TX_ENABLE_I        : in  std_logic;
			THROTTLE_REQUEST_O : out std_logic;

			--BLOCKs_VALID_I     : in  std_logic;
			PCS_BLOCKs_I       : in  BLOCK_ARRAY_t(3 downto 0);
			PCS_BLOCKs_O       : out BLOCK_ARRAY_t(3 downto 0)
		);
	end component IEEE802_3_XL_PCS_AM_INSERTER;

	--IEEE802_3_XL_PCS_AM_LOCK (24-APR-2015)
	component IEEE802_3_XL_PCS_AM_LOCK is
		Port(
			CLK_I        : in  std_logic;
			RST_I        : in  std_logic;

			BLOCK_LOCK_I : in  NIBBLE_t;

			PCS_BLOCKs_I : in  BLOCK_ARRAY_t(3 downto 0);
			PCS_BLOCKs_O : out BLOCK_ARRAY_t(3 downto 0);
			AM_VALID_O   : out NIBBLE_t;

			AM_LOCK_O    : out NIBBLE_t;
			LANE_MAP_O   : out NIBBLE_ARRAY_t(3 downto 0)
		);
	end component IEEE802_3_XL_PCS_AM_LOCK;

	--IEEE802_3_XL_PCS_AM_REMOVER (30-JUN-2015)
	component IEEE802_3_XL_PCS_AM_REMOVER is
		Port(
			CLK_I          : in  std_logic;

			ALIGN_STATUS_I : in  std_logic;

			PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
			AM_VALID_I     : in  std_logic;
			BLOCKs_VALID_O : out std_logic;
			PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0);

			BIP_ERROR_O    : out std_logic
		);
	end component IEEE802_3_XL_PCS_AM_REMOVER;

	--IEEE802_3_XL_PCS_LANE_DESKEW (24-APR-2015)
	component IEEE802_3_XL_PCS_LANE_DESKEW is
		Port(
			CLK_I          : in  std_logic;

			AM_STATUS_I    : in  std_logic;

			PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
			AM_VALID_I     : in  NIBBLE_t;
			PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0);
			AM_VALID_O     : out std_logic;

			ALIGN_STATUS_O : out std_logic
		);
	end component IEEE802_3_XL_PCS_LANE_DESKEW;

	--IEEE802_3_XL_PCS_LANE_REORDER (13-AUG-2014)
	component IEEE802_3_XL_PCS_LANE_REORDER is
		Port(
			PCS_BLOCKs_I : in  BLOCK_ARRAY_t(3 downto 0);
			PCS_BLOCK_O  : out BLOCK_t;

			LANE_EN_I    : in  NIBBLE_t
		);
	end component IEEE802_3_XL_PCS_LANE_REORDER;

	--IEEE802_3_XL_PCS_BLK_DIST (13-APR-2015)
	component IEEE802_3_XL_PCS_BLK_DIST is
		Port(
			CLK_I         : in  std_logic;
			RST_I         : in  std_logic;

			BLOCK_VALID_I : in  std_logic;
			PCS_BLOCK_I   : in  BLOCK_t;
			BLOCK_VALID_O : out NIBBLE_t;
			PCS_BLOCKs_O  : out BLOCK_ARRAY_t(3 downto 0)
		);
	end component IEEE802_3_XL_PCS_BLK_DIST;

	--(24-APR-2015)
	component IEEE802_3_XL_PCS_BLOCK_LOCK is
		Port(
			CLK_I          : in  std_logic;
			RST_I          : in  std_logic;

			HEADER_VALID_I : in  std_logic;
			HEADER_I       : in  std_logic_vector(1 downto 0);

			SLIP_O         : out std_logic;
			BLOCK_LOCK_O   : out std_logic
		);
	end component IEEE802_3_XL_PCS_BLOCK_LOCK;

	--IEEE802_3_XL_PCS_BLK_MERGE (16-JUL-2015)
	component IEEE802_3_XL_PCS_BLK_MERGE is
		Port(
			CLK_I         : in  std_logic;

			BLOCK_VALID_I : in  NIBBLE_t;
			PCS_BLOCKs_I  : in  BLOCK_ARRAY_t(3 downto 0);
			BLOCK_VALID_O : out std_logic;
			PCS_BLOCK_O   : out BLOCK_t
		);
	end component IEEE802_3_XL_PCS_BLK_MERGE;

	--PCS_BLOCK_THROTTLE (20-AUG-2014)
	component PCS_BLOCK_THROTTLE is
		Port(
			CLK_I         : in  std_logic;
			RST_I         : in  std_logic;

			THROTTLE_I    : in  std_logic;

			PCS_BLOCK_I   : in  BLOCK_t;
			BLOCK_VALID_I : in  std_logic;
			PCS_BLOCK_O   : out BLOCK_t;
			BLOCK_VALID_O : out std_logic
		);
	end component PCS_BLOCK_THROTTLE;

	--PCS_IDLE_BLOCK_FILTER (13-APR-2015)
	component PCS_IDLE_BLOCK_FILTER is
		Port(
			CLK_I         : in  std_logic;
			RST_I         : in  std_logic;

			PCS_BLOCK_I   : in  BLOCK_t;
			BLOCK_VALID_I : in  std_logic;
			PCS_BLOCK_O   : out BLOCK_t;

			BLOCK_VALID_O : out std_logic;
			BLOCK_IDLE_O  : out std_logic
		);
	end component PCS_IDLE_BLOCK_FILTER;

	component PCS_BLOCKs_FIFO is
		port(
			--System Control Inputs:
			RST_I          : in  STD_LOGIC;
			--WRITE PORT
			WR_CLK_I       : in  STD_LOGIC;
			PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
			BLOCKS_VALID_I : in  STD_LOGIC;
			--READ PORT
			RD_CLK_I       : in  STD_LOGIC;
			RD_EN_I        : in  STD_LOGIC;
			PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0);
			BLOCKs_VALID_O : out std_logic;
			--STATUS SIGNALS
			FULL           : out STD_LOGIC;
			EMPTY          : out STD_LOGIC
		);
	end component PCS_BLOCKs_FIFO;

	--PCS_DATA_FREQUENCY_DIVIDER (13-APR-2015)
	component PCS_DATA_FREQUENCY_DIVIDER is
		Port(
			CLK_I          : in  std_logic;
			CLK_DIV_I      : in  std_logic;

			BLOCK_VALID_I  : in  NIBBLE_t;
			PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
			BLOCKs_VALID_O : out std_logic;
			PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0)
		);
	end component PCS_DATA_FREQUENCY_DIVIDER;

	--PCS_DATA_FREQUENCY_MULTIPLIER (15-APR-2015)
	component PCS_DATA_FREQUENCY_MULTIPLIER is
		Port(
			CLK_I          : in  std_logic;
			CLK_MULT_I     : in  std_logic;

			BLOCKs_VALID_I : in  std_logic;
			PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
			BLOCK_VALID_O  : out NIBBLE_t;
			PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0)
		);
	end component PCS_DATA_FREQUENCY_MULTIPLIER;

	--(24-APR-2015)
	component PCS_BLOCKs_REALIGN is
		Port(
			CLK_I          : in  std_logic;

			BLOCK_LOCK_I   : in  std_logic_vector(3 downto 0);

			BLOCK_VALID_I  : in  std_logic_vector(3 downto 0);
			PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
			BLOCKs_VALID_O : out std_logic;
			PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0)
		);
	end component PCS_BLOCKs_REALIGN;

end IEEE802_3_XL_PKG;

package body IEEE802_3_XL_PKG is
end package body;
