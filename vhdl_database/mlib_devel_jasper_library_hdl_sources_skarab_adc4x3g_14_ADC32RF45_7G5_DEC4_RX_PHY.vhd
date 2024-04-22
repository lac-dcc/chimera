------------------------------------------------------------------------------
-- FILE NAME            : ADC32RF45_7G5_DEC4_RX_PHY.vhd
------------------------------------------------------------------------------
-- COMPANY              : PERALEX ELECTRONICS (PTY) LTD
------------------------------------------------------------------------------
-- COPYRIGHT NOTICE :
--
-- The copyright, manufacturing and patent rights stemming from this document
-- in any form are vested in PERALEX ELECTRONICS (PTY) LTD.
--
-- (c) PERALEX ELECTRONICS (PTY) LTD 2021
--
-- PERALEX ELECTRONICS (PTY) LTD has ceded these rights to its clients
-- where contractually agreed.
------------------------------------------------------------------------------
-- DESCRIPTION :
--	 This component is a JESD204B receiver PHY for the DC32RF45/ADC32RF80
--   (LMFS=8422, 3 GSPS)
--   Target Device: xc7vx690tffg1927-2
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity ADC32RF45_7G5_DEC4_RX_PHY is
generic(
	RX_POLARITY_INVERT  : std_logic_vector(3 downto 0) := "0000");
port(
	GTREFCLK_IN          : in  std_logic;
	SYSCLK_IN             : in  std_logic;
	SOFT_RESET_IN         : in  std_logic;
	RXP_IN                : in  std_logic_vector(3 downto 0);
	RXN_IN                : in  std_logic_vector(3 downto 0);
	LANE0_RX_DATA_O       : out std_logic_vector(31 downto 0);
	LANE1_RX_DATA_O       : out std_logic_vector(31 downto 0);
	LANE2_RX_DATA_O       : out std_logic_vector(31 downto 0);
	LANE3_RX_DATA_O       : out std_logic_vector(31 downto 0);
	LANE0_RX_DATA_IS_K_O  : out std_logic_vector(3 downto 0);
	LANE1_RX_DATA_IS_K_O  : out std_logic_vector(3 downto 0);
	LANE2_RX_DATA_IS_K_O  : out std_logic_vector(3 downto 0);
	LANE3_RX_DATA_IS_K_O  : out std_logic_vector(3 downto 0);
	GT_RXUSRCLK2_O        : out std_logic;
	GT_RXFSMRESETDONE_O   : out std_logic_vector(3 downto 0);
	GT_RXBUFSTATUS_O      : out std_logic_vector(11 downto 0);
	GT_RXDISPERR_O        : out std_logic_vector(15 downto 0);
	GT_RXNOTINTABLE_O     : out std_logic_vector(15 downto 0);
	GT_RXBYTEISALIGNED_O  : out std_logic_vector(3 downto 0);
	GT_CPLLLOCK_O         : out std_logic_vector(3 downto 0));
end ADC32RF45_7G5_DEC4_RX_PHY;
    
architecture RTL of ADC32RF45_7G5_DEC4_RX_PHY is
	
	--------------------------------------------
	-- COMPONENTS
	--------------------------------------------
	component JESD204B_4LaneRX_7500MHz_support is
	generic(
		EXAMPLE_SIM_GTRESET_SPEEDUP : string  := "TRUE"; -- simulation setting for GT SecureIP model
		STABLE_CLOCK_PERIOD         : integer := 10
	);
	port(
		--____________________________COMMON PORTS________________________________
		SYS_CLK_I                   : in  std_logic;

		SOFT_RESET_IN               : in  std_logic;
		DONT_RESET_ON_DATA_ERROR_IN : in  std_logic;

		GTREFCLK_IN                 : in  std_logic;

		GT_RXUSRCLK2_OUT            : out std_logic;

		GT0_RX_FSM_RESET_DONE_OUT   : out std_logic;
		GT0_DATA_VALID_IN           : in  std_logic;
		GT1_RX_FSM_RESET_DONE_OUT   : out std_logic;
		GT1_DATA_VALID_IN           : in  std_logic;
		GT2_RX_FSM_RESET_DONE_OUT   : out std_logic;
		GT2_DATA_VALID_IN           : in  std_logic;
		GT3_RX_FSM_RESET_DONE_OUT   : out std_logic;
		GT3_DATA_VALID_IN           : in  std_logic;

		--_________________________________________________________________________
		--GT0
		--____________________________CHANNEL PORTS________________________________
		--------------------------------- CPLL Ports -------------------------------
		gt0_cplllock_out            : out std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		gt0_rxdata_out              : out std_logic_vector(31 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		gt0_rxdisperr_out           : out std_logic_vector(3 downto 0);
		gt0_rxnotintable_out        : out std_logic_vector(3 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		gt0_gthrxn_in               : in  std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		gt0_rxbufreset_in           : in  std_logic;
		gt0_rxbufstatus_out         : out std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		gt0_rxbyteisaligned_out     : out std_logic;
		gt0_rxbyterealign_out       : out std_logic;
		gt0_rxcommadet_out          : out std_logic;
		gt0_rxmcommaalignen_in      : in  std_logic;
		gt0_rxpcommaalignen_in      : in  std_logic;
		------------------ Receive Ports - RX Channel Bonding Ports ----------------
		gt0_rxchanbondseq_out       : out std_logic;
		gt0_rxchbonden_in           : in  std_logic;
		gt0_rxchbondlevel_in        : in  std_logic_vector(2 downto 0);
		gt0_rxchbondmaster_in       : in  std_logic;
		gt0_rxchbondo_out           : out std_logic_vector(4 downto 0);
		gt0_rxchbondslave_in        : in  std_logic;
		----------------- Receive Ports - RX Channel Bonding Ports  ----------------
		gt0_rxchanisaligned_out     : out std_logic;
		gt0_rxchanrealign_out       : out std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		gt0_rxchariscomma_out       : out std_logic_vector(3 downto 0);
		gt0_rxcharisk_out           : out std_logic_vector(3 downto 0);
		------------------ Receive Ports - Rx Channel Bonding Ports ----------------
		gt0_rxchbondi_in            : in  std_logic_vector(4 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		gt0_gthrxp_in               : in  std_logic;
		----------------- Receive Ports - RX Polarity Control Ports ----------------
		gt0_rxpolarity_in           : in  std_logic;

		--GT1
		--____________________________CHANNEL PORTS________________________________
		--------------------------------- CPLL Ports -------------------------------
		gt1_cplllock_out            : out std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		gt1_rxdata_out              : out std_logic_vector(31 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		gt1_rxdisperr_out           : out std_logic_vector(3 downto 0);
		gt1_rxnotintable_out        : out std_logic_vector(3 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		gt1_gthrxn_in               : in  std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		gt1_rxbufreset_in           : in  std_logic;
		gt1_rxbufstatus_out         : out std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		gt1_rxbyteisaligned_out     : out std_logic;
		gt1_rxbyterealign_out       : out std_logic;
		gt1_rxcommadet_out          : out std_logic;
		gt1_rxmcommaalignen_in      : in  std_logic;
		gt1_rxpcommaalignen_in      : in  std_logic;
		------------------ Receive Ports - RX Channel Bonding Ports ----------------
		gt1_rxchanbondseq_out       : out std_logic;
		gt1_rxchbonden_in           : in  std_logic;
		gt1_rxchbondlevel_in        : in  std_logic_vector(2 downto 0);
		gt1_rxchbondmaster_in       : in  std_logic;
		gt1_rxchbondo_out           : out std_logic_vector(4 downto 0);
		gt1_rxchbondslave_in        : in  std_logic;
		----------------- Receive Ports - RX Channel Bonding Ports  ----------------
		gt1_rxchanisaligned_out     : out std_logic;
		gt1_rxchanrealign_out       : out std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		gt1_rxchariscomma_out       : out std_logic_vector(3 downto 0);
		gt1_rxcharisk_out           : out std_logic_vector(3 downto 0);
		------------------ Receive Ports - Rx Channel Bonding Ports ----------------
		gt1_rxchbondi_in            : in  std_logic_vector(4 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		gt1_gthrxp_in               : in  std_logic;
		----------------- Receive Ports - RX Polarity Control Ports ----------------
		gt1_rxpolarity_in           : in  std_logic;
		
		--GT2
		--____________________________CHANNEL PORTS________________________________
		--------------------------------- CPLL Ports -------------------------------
		gt2_cplllock_out            : out std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		gt2_rxdata_out              : out std_logic_vector(31 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		gt2_rxdisperr_out           : out std_logic_vector(3 downto 0);
		gt2_rxnotintable_out        : out std_logic_vector(3 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		gt2_gthrxn_in               : in  std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		gt2_rxbufreset_in           : in  std_logic;
		gt2_rxbufstatus_out         : out std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		gt2_rxbyteisaligned_out     : out std_logic;
		gt2_rxbyterealign_out       : out std_logic;
		gt2_rxcommadet_out          : out std_logic;
		gt2_rxmcommaalignen_in      : in  std_logic;
		gt2_rxpcommaalignen_in      : in  std_logic;
		------------------ Receive Ports - RX Channel Bonding Ports ----------------
		gt2_rxchanbondseq_out       : out std_logic;
		gt2_rxchbonden_in           : in  std_logic;
		gt2_rxchbondlevel_in        : in  std_logic_vector(2 downto 0);
		gt2_rxchbondmaster_in       : in  std_logic;
		gt2_rxchbondo_out           : out std_logic_vector(4 downto 0);
		gt2_rxchbondslave_in        : in  std_logic;
		----------------- Receive Ports - RX Channel Bonding Ports  ----------------
		gt2_rxchanisaligned_out     : out std_logic;
		gt2_rxchanrealign_out       : out std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		gt2_rxchariscomma_out       : out std_logic_vector(3 downto 0);
		gt2_rxcharisk_out           : out std_logic_vector(3 downto 0);
		------------------ Receive Ports - Rx Channel Bonding Ports ----------------
		gt2_rxchbondi_in            : in  std_logic_vector(4 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		gt2_gthrxp_in               : in  std_logic;
		----------------- Receive Ports - RX Polarity Control Ports ----------------
		gt2_rxpolarity_in           : in  std_logic;
		
		--GT3
		--____________________________CHANNEL PORTS________________________________
		--------------------------------- CPLL Ports -------------------------------
		gt3_cplllock_out            : out std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		gt3_rxdata_out              : out std_logic_vector(31 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		gt3_rxdisperr_out           : out std_logic_vector(3 downto 0);
		gt3_rxnotintable_out        : out std_logic_vector(3 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		gt3_gthrxn_in               : in  std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		gt3_rxbufreset_in           : in  std_logic;
		gt3_rxbufstatus_out         : out std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		gt3_rxbyteisaligned_out     : out std_logic;
		gt3_rxbyterealign_out       : out std_logic;
		gt3_rxcommadet_out          : out std_logic;
		gt3_rxmcommaalignen_in      : in  std_logic;
		gt3_rxpcommaalignen_in      : in  std_logic;
		------------------ Receive Ports - RX Channel Bonding Ports ----------------
		gt3_rxchanbondseq_out       : out std_logic;
		gt3_rxchbonden_in           : in  std_logic;
		gt3_rxchbondlevel_in        : in  std_logic_vector(2 downto 0);
		gt3_rxchbondmaster_in       : in  std_logic;
		gt3_rxchbondo_out           : out std_logic_vector(4 downto 0);
		gt3_rxchbondslave_in        : in  std_logic;
		----------------- Receive Ports - RX Channel Bonding Ports  ----------------
		gt3_rxchanisaligned_out     : out std_logic;
		gt3_rxchanrealign_out       : out std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		gt3_rxchariscomma_out       : out std_logic_vector(3 downto 0);
		gt3_rxcharisk_out           : out std_logic_vector(3 downto 0);
		------------------ Receive Ports - Rx Channel Bonding Ports ----------------
		gt3_rxchbondi_in            : in  std_logic_vector(4 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		gt3_gthrxp_in               : in  std_logic;
		----------------- Receive Ports - RX Polarity Control Ports ----------------
		gt3_rxpolarity_in           : in  std_logic);
	end component JESD204B_4LaneRX_7500MHz_support;

	--------------------------------------------
	-- SIGNALS
	--------------------------------------------
	signal gt0_cplllock_out_i    : std_logic;
    signal gt1_cplllock_out_i    : std_logic;
    signal gt2_cplllock_out_i    : std_logic;
    signal gt3_cplllock_out_i    : std_logic;
    signal gt0_rxbufstatus_i     : std_logic_vector(2 downto 0); 
    signal gt1_rxbufstatus_i     : std_logic_vector(2 downto 0); 
    signal gt2_rxbufstatus_i     : std_logic_vector(2 downto 0); 
    signal gt3_rxbufstatus_i     : std_logic_vector(2 downto 0); 
    signal gt0_rxbyteisaligned_i : std_logic;
    signal gt1_rxbyteisaligned_i : std_logic;
    signal gt2_rxbyteisaligned_i : std_logic;
    signal gt3_rxbyteisaligned_i : std_logic;
    signal gt0_rxcharisk_i       : std_logic_vector(3 downto 0);
    signal gt1_rxcharisk_i       : std_logic_vector(3 downto 0);
    signal gt2_rxcharisk_i       : std_logic_vector(3 downto 0);
    signal gt3_rxcharisk_i       : std_logic_vector(3 downto 0);
    signal gt0_rxdata_i          : std_logic_vector(31 downto 0);
    signal gt1_rxdata_i          : std_logic_vector(31 downto 0);
    signal gt2_rxdata_i          : std_logic_vector(31 downto 0);
    signal gt3_rxdata_i          : std_logic_vector(31 downto 0);
    signal gt0_rxdisperr_i       : std_logic_vector(3 downto 0);
    signal gt1_rxdisperr_i       : std_logic_vector(3 downto 0);
    signal gt2_rxdisperr_i       : std_logic_vector(3 downto 0);
    signal gt3_rxdisperr_i       : std_logic_vector(3 downto 0);
    signal gt0_rxfsmresetdone_i  : std_logic;
    signal gt1_rxfsmresetdone_i  : std_logic;
    signal gt2_rxfsmresetdone_i  : std_logic;
    signal gt3_rxfsmresetdone_i  : std_logic;
    signal gt0_rxnotintable_i    : std_logic_vector(3 downto 0);
    signal gt1_rxnotintable_i    : std_logic_vector(3 downto 0);
    signal gt2_rxnotintable_i    : std_logic_vector(3 downto 0);
    signal gt3_rxnotintable_i    : std_logic_vector(3 downto 0);
    signal gt_rxusrclk2_i : std_logic;
begin

	--------------------------------------------
	-- COMPONENTS
	--------------------------------------------
	ADC_GT_SUPPPORT_inst : component JESD204B_4LaneRX_7500MHz_support
	generic map(
		EXAMPLE_SIM_GTRESET_SPEEDUP => "TRUE",
		STABLE_CLOCK_PERIOD         => 8)
	port map(
		SYS_CLK_I                   => SYSCLK_IN,
		SOFT_RESET_IN               => SOFT_RESET_IN,
		DONT_RESET_ON_DATA_ERROR_IN => '0',
		GTREFCLK_IN                 => GTREFCLK_IN,
		GT_RXUSRCLK2_OUT            => gt_rxusrclk2_i,
		GT0_RX_FSM_RESET_DONE_OUT   => gt0_rxfsmresetdone_i,
		GT0_DATA_VALID_IN           => '1',
		GT1_RX_FSM_RESET_DONE_OUT   => gt1_rxfsmresetdone_i,
		GT1_DATA_VALID_IN           => '1',
		GT2_RX_FSM_RESET_DONE_OUT   => gt2_rxfsmresetdone_i,
		GT2_DATA_VALID_IN           => '1',
		GT3_RX_FSM_RESET_DONE_OUT   => gt3_rxfsmresetdone_i,
		GT3_DATA_VALID_IN           => '1',
		gt0_cplllock_out            => gt0_cplllock_out_i,
		gt0_rxdata_out              => gt0_rxdata_i,
		gt0_rxdisperr_out           => gt0_rxdisperr_i,
		gt0_rxnotintable_out        => gt0_rxnotintable_i,
		gt0_gthrxn_in               => RXN_IN(0),
		gt0_rxbufreset_in           => '0',
		gt0_rxbufstatus_out         => gt0_rxbufstatus_i,
		gt0_rxbyteisaligned_out     => gt0_rxbyteisaligned_i,
		gt0_rxbyterealign_out       => open,
		gt0_rxcommadet_out          => open,
		gt0_rxmcommaalignen_in      => '1',
		gt0_rxpcommaalignen_in      => '1',
		gt0_rxchanbondseq_out       => open, 
		gt0_rxchbonden_in           => '0',  
		gt0_rxchbondlevel_in        => "000",
		gt0_rxchbondmaster_in       => '0',  
		gt0_rxchbondo_out           => open, 
		gt0_rxchbondslave_in        => '0',  
		gt0_rxchanisaligned_out     => open, 
		gt0_rxchanrealign_out       => open, 
		gt0_rxchariscomma_out       => open,
		gt0_rxcharisk_out           => gt0_rxcharisk_i,
		gt0_rxchbondi_in            => "00000",
		gt0_gthrxp_in               => RXP_IN(0),
		gt0_rxpolarity_in           => RX_POLARITY_INVERT(0),
		gt1_cplllock_out            => gt1_cplllock_out_i,
		gt1_rxdata_out              => gt1_rxdata_i,
		gt1_rxdisperr_out           => gt1_rxdisperr_i,
		gt1_rxnotintable_out        => gt1_rxnotintable_i,
		gt1_gthrxn_in               => RXN_IN(1),
		gt1_rxbufreset_in           => '0',
		gt1_rxbufstatus_out         => gt1_rxbufstatus_i,
		gt1_rxbyteisaligned_out     => gt1_rxbyteisaligned_i,
		gt1_rxbyterealign_out       => open,
		gt1_rxcommadet_out          => open,
		gt1_rxmcommaalignen_in      => '1',
		gt1_rxpcommaalignen_in      => '1',
		gt1_rxchanbondseq_out       => open, 
		gt1_rxchbonden_in           => '0',  
		gt1_rxchbondlevel_in        => "000",
		gt1_rxchbondmaster_in       => '0',  
		gt1_rxchbondo_out           => open, 
		gt1_rxchbondslave_in        => '0',  
		gt1_rxchanisaligned_out     => open, 
		gt1_rxchanrealign_out       => open, 
		gt1_rxchariscomma_out       => open,
		gt1_rxcharisk_out           => gt1_rxcharisk_i,
		gt1_rxchbondi_in            => "00000",
		gt1_gthrxp_in               => RXP_IN(1),
		gt1_rxpolarity_in           => RX_POLARITY_INVERT(1),
		gt2_cplllock_out            => gt2_cplllock_out_i,
		gt2_rxdata_out              => gt2_rxdata_i,
		gt2_rxdisperr_out           => gt2_rxdisperr_i,
		gt2_rxnotintable_out        => gt2_rxnotintable_i,
		gt2_gthrxn_in               => RXN_IN(2),
		gt2_rxbufreset_in           => '0',
		gt2_rxbufstatus_out         => gt2_rxbufstatus_i,
		gt2_rxbyteisaligned_out     => gt2_rxbyteisaligned_i,
		gt2_rxbyterealign_out       => open,
		gt2_rxcommadet_out          => open,
		gt2_rxmcommaalignen_in      => '1',
		gt2_rxpcommaalignen_in      => '1',
		gt2_rxchanbondseq_out       => open, 
		gt2_rxchbonden_in           => '0',  
		gt2_rxchbondlevel_in        => "000",
		gt2_rxchbondmaster_in       => '0',  
		gt2_rxchbondo_out           => open, 
		gt2_rxchbondslave_in        => '0',  
		gt2_rxchanisaligned_out     => open, 
		gt2_rxchanrealign_out       => open, 
		gt2_rxchariscomma_out       => open,
		gt2_rxcharisk_out           => gt2_rxcharisk_i,
		gt2_rxchbondi_in            => "00000",
		gt2_gthrxp_in               => RXP_IN(2),
		gt2_rxpolarity_in           => RX_POLARITY_INVERT(2),
		gt3_cplllock_out            => gt3_cplllock_out_i,
		gt3_rxdata_out              => gt3_rxdata_i,
		gt3_rxdisperr_out           => gt3_rxdisperr_i,
		gt3_rxnotintable_out        => gt3_rxnotintable_i,
		gt3_gthrxn_in               => RXN_IN(3),
		gt3_rxbufreset_in           => '0',
		gt3_rxbufstatus_out         => gt3_rxbufstatus_i,
		gt3_rxbyteisaligned_out     => gt3_rxbyteisaligned_i,
		gt3_rxbyterealign_out       => open,
		gt3_rxcommadet_out          => open,
		gt3_rxmcommaalignen_in      => '1',
		gt3_rxpcommaalignen_in      => '1',
		gt3_rxchanbondseq_out       => open, 
		gt3_rxchbonden_in           => '0',  
		gt3_rxchbondlevel_in        => "000",
		gt3_rxchbondmaster_in       => '0',  
		gt3_rxchbondo_out           => open, 
		gt3_rxchbondslave_in        => '0',  
		gt3_rxchanisaligned_out     => open, 
		gt3_rxchanrealign_out       => open, 
		gt3_rxchariscomma_out       => open,
		gt3_rxcharisk_out           => gt3_rxcharisk_i,
		gt3_rxchbondi_in            => "00000",
		gt3_gthrxp_in               => RXP_IN(3),
		gt3_rxpolarity_in           => RX_POLARITY_INVERT(3));

	--------------------------------------------
	-- OUTPUT PORT CONNECTIONS
	--------------------------------------------
	-- RXUSRCLK2
	GT_RXUSRCLK2_O <= gt_rxusrclk2_i;

	-- DATA SIGNALS
	LANE0_RX_DATA_O       <= gt0_rxdata_i;
	LANE1_RX_DATA_O       <= gt1_rxdata_i;
	LANE2_RX_DATA_O       <= gt2_rxdata_i;
	LANE3_RX_DATA_O       <= gt3_rxdata_i;
	LANE0_RX_DATA_IS_K_O  <= gt0_rxcharisk_i;
	LANE1_RX_DATA_IS_K_O  <= gt1_rxcharisk_i;
	LANE2_RX_DATA_IS_K_O  <= gt2_rxcharisk_i;
	LANE3_RX_DATA_IS_K_O  <= gt3_rxcharisk_i;

	-- STATUS/ERROR SIGNALS
	GT_RXFSMRESETDONE_O   <= gt3_rxfsmresetdone_i   & gt2_rxfsmresetdone_i   & gt1_rxfsmresetdone_i   & gt0_rxfsmresetdone_i;   -- Should be "1111"  after successful reset
	GT_RXBUFSTATUS_O      <= gt3_rxbufstatus_i      & gt2_rxbufstatus_i      & gt1_rxbufstatus_i      & gt0_rxbufstatus_i;      -- Should be x"000"  after successful reset
	GT_RXDISPERR_O        <= gt3_rxdisperr_i        & gt2_rxdisperr_i        & gt1_rxdisperr_i        & gt0_rxdisperr_i;        -- Should be x"0000" after successful reset
	GT_RXNOTINTABLE_O     <= gt3_rxnotintable_i     & gt2_rxnotintable_i     & gt1_rxnotintable_i     & gt0_rxnotintable_i;     -- Should be x"0000" after successful reset
	GT_RXBYTEISALIGNED_O  <= gt3_rxbyteisaligned_i  & gt2_rxbyteisaligned_i  & gt1_rxbyteisaligned_i  & gt0_rxbyteisaligned_i;  -- Should be "1111"  after successful reset
	GT_CPLLLOCK_O         <= gt3_cplllock_out_i     & gt2_cplllock_out_i     & gt1_cplllock_out_i     & gt0_cplllock_out_i;     -- Should be "1111"  after successful reset

end RTL;