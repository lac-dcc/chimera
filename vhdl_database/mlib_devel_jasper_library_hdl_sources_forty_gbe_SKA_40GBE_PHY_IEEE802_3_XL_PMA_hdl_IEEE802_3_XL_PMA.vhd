----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 12.09.2014 15:36:12
-- Design Name: 
-- Module Name: IEEE802_3_XL_PMA - Behavioral
-- Project Name: 
-- Target Devices:	Virtex 7
-- Tool Versions:	Vivado 2014.3 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IEEE802_3_XL_PMA is
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

		RXN_I                   : in  std_logic_vector(3 downto 0);
		RXP_I                   : in  std_logic_vector(3 downto 0);
		TXN_O                   : out std_logic_vector(3 downto 0);
		TXP_O                   : out std_logic_vector(3 downto 0);

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
end IEEE802_3_XL_PMA;

architecture Behavioral of IEEE802_3_XL_PMA is
	component XLAUI_support
		generic(
			EXAMPLE_SIM_GTRESET_SPEEDUP : string  := "TRUE"; -- simulation setting for GT SecureIP model
			STABLE_CLOCK_PERIOD         : integer := 7
		);
		port(
			--____________________________COMMON PORTS________________________________
			SYS_CLK_I                   : in  std_logic;

			SOFT_RESET_IN               : in  std_logic;
			DONT_RESET_ON_DATA_ERROR_IN : in  std_logic;

			GTREFCLK_PAD_N_IN           : in  std_logic;
			GTREFCLK_PAD_P_IN           : in  std_logic;

			GTREFCLK_O                  : out std_logic;

			GT0_TXOUTCLK_OUT            : out std_logic;
			GT_TXUSRCLK2_IN             : in  std_logic;
			GT_TXUSRCLK_IN              : in  std_logic;
			GT_TXUSRCLK_LOCKED_IN       : in  std_logic;
			GT_TXUSRCLK_RESET_OUT       : out std_logic;

			GT0_RXOUTCLK_OUT            : out std_logic;
			GT_RXUSRCLK2_IN             : in  std_logic;
			GT_RXUSRCLK_IN              : in  std_logic;
			GT_RXUSRCLK_LOCKED_IN       : in  std_logic;
			GT_RXUSRCLK_RESET_OUT       : out std_logic;

			GT0_TX_FSM_RESET_DONE_OUT   : out std_logic;
			GT0_RX_FSM_RESET_DONE_OUT   : out std_logic;
			GT0_DATA_VALID_IN           : in  std_logic;
			GT1_TX_FSM_RESET_DONE_OUT   : out std_logic;
			GT1_RX_FSM_RESET_DONE_OUT   : out std_logic;
			GT1_DATA_VALID_IN           : in  std_logic;
			GT2_TX_FSM_RESET_DONE_OUT   : out std_logic;
			GT2_RX_FSM_RESET_DONE_OUT   : out std_logic;
			GT2_DATA_VALID_IN           : in  std_logic;
			GT3_TX_FSM_RESET_DONE_OUT   : out std_logic;
			GT3_RX_FSM_RESET_DONE_OUT   : out std_logic;
			GT3_DATA_VALID_IN           : in  std_logic;

			--_________________________________________________________________________
			--GT0  (X0Y36)
			--____________________________CHANNEL PORTS________________________________
			---------------------------- Channel - DRP Ports  --------------------------
			gt0_drpaddr_in              : in  std_logic_vector(8 downto 0);
			gt0_drpdi_in                : in  std_logic_vector(15 downto 0);
			gt0_drpdo_out               : out std_logic_vector(15 downto 0);
			gt0_drpen_in                : in  std_logic;
			gt0_drprdy_out              : out std_logic;
			gt0_drpwe_in                : in  std_logic;
			------------------------------- Loopback Ports -----------------------------
			gt0_loopback_in             : in  std_logic_vector(2 downto 0);
			--------------------- RX Initialization and Reset Ports --------------------
			gt0_eyescanreset_in         : in  std_logic;
			gt0_rxuserrdy_in            : in  std_logic;
			-------------------------- RX Margin Analysis Ports ------------------------
			gt0_eyescandataerror_out    : out std_logic;
			gt0_eyescantrigger_in       : in  std_logic;
			------------------- Receive Ports - Digital Monitor Ports ------------------
			gt0_dmonitorout_out         : out std_logic_vector(14 downto 0);
			------------------ Receive Ports - FPGA RX interface Ports -----------------
			gt0_rxdata_out              : out std_logic_vector(63 downto 0);
			------------------- Receive Ports - Pattern Checker Ports ------------------
			gt0_rxprbserr_out           : out std_logic;
			gt0_rxprbssel_in            : in  std_logic_vector(2 downto 0);
			------------------- Receive Ports - Pattern Checker ports ------------------
			gt0_rxprbscntreset_in       : in  std_logic;
			------------------------ Receive Ports - RX AFE Ports ----------------------
			gt0_gthrxn_in               : in  std_logic;
			------------------- Receive Ports - RX Buffer Bypass Ports -----------------
			gt0_rxbufreset_in           : in  std_logic;
			gt0_rxbufstatus_out         : out std_logic_vector(2 downto 0);
			--------------------- Receive Ports - RX Equalizer Ports -------------------
			gt0_rxmonitorout_out        : out std_logic_vector(6 downto 0);
			gt0_rxmonitorsel_in         : in  std_logic_vector(1 downto 0);
			---------------------- Receive Ports - RX Gearbox Ports --------------------
			gt0_rxdatavalid_out         : out std_logic;
			gt0_rxheader_out            : out std_logic_vector(1 downto 0);
			gt0_rxheadervalid_out       : out std_logic;
			--------------------- Receive Ports - RX Gearbox Ports  --------------------
			gt0_rxgearboxslip_in        : in  std_logic;
			------------- Receive Ports - RX Initialization and Reset Ports ------------
			gt0_gtrxreset_in            : in  std_logic;
			gt0_rxpcsreset_in           : in  std_logic;
			------------------------ Receive Ports -RX AFE Ports -----------------------
			gt0_gthrxp_in               : in  std_logic;
			-------------- Receive Ports -RX Initialization and Reset Ports ------------
			gt0_rxresetdone_out         : out std_logic;
			--------------------- TX Initialization and Reset Ports --------------------
			gt0_gttxreset_in            : in  std_logic;
			gt0_txuserrdy_in            : in  std_logic;
			-------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
			gt0_txheader_in             : in  std_logic_vector(1 downto 0);
			--------------------- Transmit Ports - PCI Express Ports -------------------
			gt0_txelecidle_in           : in  std_logic;
			------------------ Transmit Ports - Pattern Generator Ports ----------------
			gt0_txprbsforceerr_in       : in  std_logic;
			---------------------- Transmit Ports - TX Buffer Ports --------------------
			gt0_txbufstatus_out         : out std_logic_vector(1 downto 0);
			------------------ Transmit Ports - TX Data Path interface -----------------
			gt0_txdata_in               : in  std_logic_vector(63 downto 0);
			---------------- Transmit Ports - TX Driver and OOB signaling --------------
			gt0_gthtxn_out              : out std_logic;
			gt0_gthtxp_out              : out std_logic;
			--------------------- Transmit Ports - TX Gearbox Ports --------------------
			gt0_txsequence_in           : in  std_logic_vector(6 downto 0);
			------------- Transmit Ports - TX Initialization and Reset Ports -----------
			gt0_txpcsreset_in           : in  std_logic;
			gt0_txresetdone_out         : out std_logic;
			----------------- Transmit Ports - TX Polarity Control Ports ---------------
			gt0_txpolarity_in           : in  std_logic;
			------------------ Transmit Ports - pattern Generator Ports ----------------
			gt0_txprbssel_in            : in  std_logic_vector(2 downto 0);

			--GT1  (X0Y37)
			--____________________________CHANNEL PORTS________________________________
			---------------------------- Channel - DRP Ports  --------------------------
			gt1_drpaddr_in              : in  std_logic_vector(8 downto 0);
			gt1_drpdi_in                : in  std_logic_vector(15 downto 0);
			gt1_drpdo_out               : out std_logic_vector(15 downto 0);
			gt1_drpen_in                : in  std_logic;
			gt1_drprdy_out              : out std_logic;
			gt1_drpwe_in                : in  std_logic;
			------------------------------- Loopback Ports -----------------------------
			gt1_loopback_in             : in  std_logic_vector(2 downto 0);
			--------------------- RX Initialization and Reset Ports --------------------
			gt1_eyescanreset_in         : in  std_logic;
			gt1_rxuserrdy_in            : in  std_logic;
			-------------------------- RX Margin Analysis Ports ------------------------
			gt1_eyescandataerror_out    : out std_logic;
			gt1_eyescantrigger_in       : in  std_logic;
			------------------- Receive Ports - Digital Monitor Ports ------------------
			gt1_dmonitorout_out         : out std_logic_vector(14 downto 0);
			------------------ Receive Ports - FPGA RX interface Ports -----------------
			gt1_rxdata_out              : out std_logic_vector(63 downto 0);
			------------------- Receive Ports - Pattern Checker Ports ------------------
			gt1_rxprbserr_out           : out std_logic;
			gt1_rxprbssel_in            : in  std_logic_vector(2 downto 0);
			------------------- Receive Ports - Pattern Checker ports ------------------
			gt1_rxprbscntreset_in       : in  std_logic;
			------------------------ Receive Ports - RX AFE Ports ----------------------
			gt1_gthrxn_in               : in  std_logic;
			------------------- Receive Ports - RX Buffer Bypass Ports -----------------
			gt1_rxbufreset_in           : in  std_logic;
			gt1_rxbufstatus_out         : out std_logic_vector(2 downto 0);
			--------------------- Receive Ports - RX Equalizer Ports -------------------
			gt1_rxmonitorout_out        : out std_logic_vector(6 downto 0);
			gt1_rxmonitorsel_in         : in  std_logic_vector(1 downto 0);
			---------------------- Receive Ports - RX Gearbox Ports --------------------
			gt1_rxdatavalid_out         : out std_logic;
			gt1_rxheader_out            : out std_logic_vector(1 downto 0);
			gt1_rxheadervalid_out       : out std_logic;
			--------------------- Receive Ports - RX Gearbox Ports  --------------------
			gt1_rxgearboxslip_in        : in  std_logic;
			------------- Receive Ports - RX Initialization and Reset Ports ------------
			gt1_gtrxreset_in            : in  std_logic;
			gt1_rxpcsreset_in           : in  std_logic;
			------------------------ Receive Ports -RX AFE Ports -----------------------
			gt1_gthrxp_in               : in  std_logic;
			-------------- Receive Ports -RX Initialization and Reset Ports ------------
			gt1_rxresetdone_out         : out std_logic;
			--------------------- TX Initialization and Reset Ports --------------------
			gt1_gttxreset_in            : in  std_logic;
			gt1_txuserrdy_in            : in  std_logic;
			-------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
			gt1_txheader_in             : in  std_logic_vector(1 downto 0);
			--------------------- Transmit Ports - PCI Express Ports -------------------
			gt1_txelecidle_in           : in  std_logic;
			------------------ Transmit Ports - Pattern Generator Ports ----------------
			gt1_txprbsforceerr_in       : in  std_logic;
			---------------------- Transmit Ports - TX Buffer Ports --------------------
			gt1_txbufstatus_out         : out std_logic_vector(1 downto 0);
			------------------ Transmit Ports - TX Data Path interface -----------------
			gt1_txdata_in               : in  std_logic_vector(63 downto 0);
			---------------- Transmit Ports - TX Driver and OOB signaling --------------
			gt1_gthtxn_out              : out std_logic;
			gt1_gthtxp_out              : out std_logic;
			--------------------- Transmit Ports - TX Gearbox Ports --------------------
			gt1_txsequence_in           : in  std_logic_vector(6 downto 0);
			------------- Transmit Ports - TX Initialization and Reset Ports -----------
			gt1_txpcsreset_in           : in  std_logic;
			gt1_txresetdone_out         : out std_logic;
			----------------- Transmit Ports - TX Polarity Control Ports ---------------
			gt1_txpolarity_in           : in  std_logic;
			------------------ Transmit Ports - pattern Generator Ports ----------------
			gt1_txprbssel_in            : in  std_logic_vector(2 downto 0);

			--GT2  (X0Y38)
			--____________________________CHANNEL PORTS________________________________
			---------------------------- Channel - DRP Ports  --------------------------
			gt2_drpaddr_in              : in  std_logic_vector(8 downto 0);
			gt2_drpdi_in                : in  std_logic_vector(15 downto 0);
			gt2_drpdo_out               : out std_logic_vector(15 downto 0);
			gt2_drpen_in                : in  std_logic;
			gt2_drprdy_out              : out std_logic;
			gt2_drpwe_in                : in  std_logic;
			------------------------------- Loopback Ports -----------------------------
			gt2_loopback_in             : in  std_logic_vector(2 downto 0);
			--------------------- RX Initialization and Reset Ports --------------------
			gt2_eyescanreset_in         : in  std_logic;
			gt2_rxuserrdy_in            : in  std_logic;
			-------------------------- RX Margin Analysis Ports ------------------------
			gt2_eyescandataerror_out    : out std_logic;
			gt2_eyescantrigger_in       : in  std_logic;
			------------------- Receive Ports - Digital Monitor Ports ------------------
			gt2_dmonitorout_out         : out std_logic_vector(14 downto 0);
			------------------ Receive Ports - FPGA RX interface Ports -----------------
			gt2_rxdata_out              : out std_logic_vector(63 downto 0);
			------------------- Receive Ports - Pattern Checker Ports ------------------
			gt2_rxprbserr_out           : out std_logic;
			gt2_rxprbssel_in            : in  std_logic_vector(2 downto 0);
			------------------- Receive Ports - Pattern Checker ports ------------------
			gt2_rxprbscntreset_in       : in  std_logic;
			------------------------ Receive Ports - RX AFE Ports ----------------------
			gt2_gthrxn_in               : in  std_logic;
			------------------- Receive Ports - RX Buffer Bypass Ports -----------------
			gt2_rxbufreset_in           : in  std_logic;
			gt2_rxbufstatus_out         : out std_logic_vector(2 downto 0);
			--------------------- Receive Ports - RX Equalizer Ports -------------------
			gt2_rxmonitorout_out        : out std_logic_vector(6 downto 0);
			gt2_rxmonitorsel_in         : in  std_logic_vector(1 downto 0);
			---------------------- Receive Ports - RX Gearbox Ports --------------------
			gt2_rxdatavalid_out         : out std_logic;
			gt2_rxheader_out            : out std_logic_vector(1 downto 0);
			gt2_rxheadervalid_out       : out std_logic;
			--------------------- Receive Ports - RX Gearbox Ports  --------------------
			gt2_rxgearboxslip_in        : in  std_logic;
			------------- Receive Ports - RX Initialization and Reset Ports ------------
			gt2_gtrxreset_in            : in  std_logic;
			gt2_rxpcsreset_in           : in  std_logic;
			------------------------ Receive Ports -RX AFE Ports -----------------------
			gt2_gthrxp_in               : in  std_logic;
			-------------- Receive Ports -RX Initialization and Reset Ports ------------
			gt2_rxresetdone_out         : out std_logic;
			--------------------- TX Initialization and Reset Ports --------------------
			gt2_gttxreset_in            : in  std_logic;
			gt2_txuserrdy_in            : in  std_logic;
			-------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
			gt2_txheader_in             : in  std_logic_vector(1 downto 0);
			--------------------- Transmit Ports - PCI Express Ports -------------------
			gt2_txelecidle_in           : in  std_logic;
			------------------ Transmit Ports - Pattern Generator Ports ----------------
			gt2_txprbsforceerr_in       : in  std_logic;
			---------------------- Transmit Ports - TX Buffer Ports --------------------
			gt2_txbufstatus_out         : out std_logic_vector(1 downto 0);
			------------------ Transmit Ports - TX Data Path interface -----------------
			gt2_txdata_in               : in  std_logic_vector(63 downto 0);
			---------------- Transmit Ports - TX Driver and OOB signaling --------------
			gt2_gthtxn_out              : out std_logic;
			gt2_gthtxp_out              : out std_logic;
			--------------------- Transmit Ports - TX Gearbox Ports --------------------
			gt2_txsequence_in           : in  std_logic_vector(6 downto 0);
			------------- Transmit Ports - TX Initialization and Reset Ports -----------
			gt2_txpcsreset_in           : in  std_logic;
			gt2_txresetdone_out         : out std_logic;
			----------------- Transmit Ports - TX Polarity Control Ports ---------------
			gt2_txpolarity_in           : in  std_logic;
			------------------ Transmit Ports - pattern Generator Ports ----------------
			gt2_txprbssel_in            : in  std_logic_vector(2 downto 0);

			--GT3  (X0Y39)
			--____________________________CHANNEL PORTS________________________________
			---------------------------- Channel - DRP Ports  --------------------------
			gt3_drpaddr_in              : in  std_logic_vector(8 downto 0);
			gt3_drpdi_in                : in  std_logic_vector(15 downto 0);
			gt3_drpdo_out               : out std_logic_vector(15 downto 0);
			gt3_drpen_in                : in  std_logic;
			gt3_drprdy_out              : out std_logic;
			gt3_drpwe_in                : in  std_logic;
			------------------------------- Loopback Ports -----------------------------
			gt3_loopback_in             : in  std_logic_vector(2 downto 0);
			--------------------- RX Initialization and Reset Ports --------------------
			gt3_eyescanreset_in         : in  std_logic;
			gt3_rxuserrdy_in            : in  std_logic;
			-------------------------- RX Margin Analysis Ports ------------------------
			gt3_eyescandataerror_out    : out std_logic;
			gt3_eyescantrigger_in       : in  std_logic;
			------------------- Receive Ports - Digital Monitor Ports ------------------
			gt3_dmonitorout_out         : out std_logic_vector(14 downto 0);
			------------------ Receive Ports - FPGA RX interface Ports -----------------
			gt3_rxdata_out              : out std_logic_vector(63 downto 0);
			------------------- Receive Ports - Pattern Checker Ports ------------------
			gt3_rxprbserr_out           : out std_logic;
			gt3_rxprbssel_in            : in  std_logic_vector(2 downto 0);
			------------------- Receive Ports - Pattern Checker ports ------------------
			gt3_rxprbscntreset_in       : in  std_logic;
			------------------------ Receive Ports - RX AFE Ports ----------------------
			gt3_gthrxn_in               : in  std_logic;
			------------------- Receive Ports - RX Buffer Bypass Ports -----------------
			gt3_rxbufreset_in           : in  std_logic;
			gt3_rxbufstatus_out         : out std_logic_vector(2 downto 0);
			--------------------- Receive Ports - RX Equalizer Ports -------------------
			gt3_rxmonitorout_out        : out std_logic_vector(6 downto 0);
			gt3_rxmonitorsel_in         : in  std_logic_vector(1 downto 0);
			---------------------- Receive Ports - RX Gearbox Ports --------------------
			gt3_rxdatavalid_out         : out std_logic;
			gt3_rxheader_out            : out std_logic_vector(1 downto 0);
			gt3_rxheadervalid_out       : out std_logic;
			--------------------- Receive Ports - RX Gearbox Ports  --------------------
			gt3_rxgearboxslip_in        : in  std_logic;
			------------- Receive Ports - RX Initialization and Reset Ports ------------
			gt3_gtrxreset_in            : in  std_logic;
			gt3_rxpcsreset_in           : in  std_logic;
			------------------------ Receive Ports -RX AFE Ports -----------------------
			gt3_gthrxp_in               : in  std_logic;
			-------------- Receive Ports -RX Initialization and Reset Ports ------------
			gt3_rxresetdone_out         : out std_logic;
			--------------------- TX Initialization and Reset Ports --------------------
			gt3_gttxreset_in            : in  std_logic;
			gt3_txuserrdy_in            : in  std_logic;
			-------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
			gt3_txheader_in             : in  std_logic_vector(1 downto 0);
			--------------------- Transmit Ports - PCI Express Ports -------------------
			gt3_txelecidle_in           : in  std_logic;
			------------------ Transmit Ports - Pattern Generator Ports ----------------
			gt3_txprbsforceerr_in       : in  std_logic;
			---------------------- Transmit Ports - TX Buffer Ports --------------------
			gt3_txbufstatus_out         : out std_logic_vector(1 downto 0);
			------------------ Transmit Ports - TX Data Path interface -----------------
			gt3_txdata_in               : in  std_logic_vector(63 downto 0);
			---------------- Transmit Ports - TX Driver and OOB signaling --------------
			gt3_gthtxn_out              : out std_logic;
			gt3_gthtxp_out              : out std_logic;
			--------------------- Transmit Ports - TX Gearbox Ports --------------------
			gt3_txsequence_in           : in  std_logic_vector(6 downto 0);
			------------- Transmit Ports - TX Initialization and Reset Ports -----------
			gt3_txpcsreset_in           : in  std_logic;
			gt3_txresetdone_out         : out std_logic;
			----------------- Transmit Ports - TX Polarity Control Ports ---------------
			gt3_txpolarity_in           : in  std_logic;
			------------------ Transmit Ports - pattern Generator Ports ----------------
			gt3_txprbssel_in            : in  std_logic_vector(2 downto 0)
		);
	end component;

	component ARRAY_REVERSE_ORDER is
		Generic(
			NUMBER_OF_BITS : Natural := 32
		);
		Port(
			DATA_IN  : in  std_logic_vector(NUMBER_OF_BITS - 1 downto 0);
			DATA_OUT : out std_logic_vector(NUMBER_OF_BITS - 1 downto 0)
		);
	end component ARRAY_REVERSE_ORDER;

	component IEEE802_3_XL_PMA_AN is
		Port(
			CLK_I          : in  std_logic;
			RST_I          : in  std_logic;

			HEADER_VALID_I : in  std_logic;
			HEADER_I       : in  std_logic_vector(1 downto 0);
			DATA_VALID_I   : in  std_logic;
			DATA_I         : in  std_logic_vector(63 downto 0);

			SLIP_O         : out std_logic
		);
	end component IEEE802_3_XL_PMA_AN;

	signal tied_to_ground_i : std_logic;
	signal tied_to_vcc_i    : std_logic;

	--GT0
	signal LANE0_RX_DATA         : std_logic_vector(63 downto 0);
	signal LANE0_RX_DATA_VALID   : std_logic;
	signal LANE0_RX_HEADER       : std_logic_vector(1 downto 0);
	signal LANE0_RX_HEADER_VALID : std_logic;
	signal LANE0_RX_GEARBOXSLIP  : std_logic;
	signal LANE0_TX_HEADER       : std_logic_vector(1 downto 0);
	signal LANE0_TX_DATA         : std_logic_vector(63 downto 0);
	--GT1 
	signal LANE1_RX_DATA         : std_logic_vector(63 downto 0);
	signal LANE1_RX_DATA_VALID   : std_logic;
	signal LANE1_RX_HEADER       : std_logic_vector(1 downto 0);
	signal LANE1_RX_HEADER_VALID : std_logic;
	signal LANE1_RX_GEARBOXSLIP  : std_logic;
	signal LANE1_TX_HEADER       : std_logic_vector(1 downto 0);
	signal LANE1_TX_DATA         : std_logic_vector(63 downto 0);
	--GT2
	signal LANE2_RX_DATA         : std_logic_vector(63 downto 0);
	signal LANE2_RX_DATA_VALID   : std_logic;
	signal LANE2_RX_HEADER       : std_logic_vector(1 downto 0);
	signal LANE2_RX_HEADER_VALID : std_logic;
	signal LANE2_RX_GEARBOXSLIP  : std_logic;
	signal LANE2_TX_HEADER       : std_logic_vector(1 downto 0);
	signal LANE2_TX_DATA         : std_logic_vector(63 downto 0);
	--GT3
	signal LANE3_RX_DATA         : std_logic_vector(63 downto 0);
	signal LANE3_RX_DATA_VALID   : std_logic;
	signal LANE3_RX_HEADER       : std_logic_vector(1 downto 0);
	signal LANE3_RX_HEADER_VALID : std_logic;
	signal LANE3_RX_GEARBOXSLIP  : std_logic;
	signal LANE3_TX_HEADER       : std_logic_vector(1 downto 0);
	signal LANE3_TX_DATA         : std_logic_vector(63 downto 0);

	signal gt_tx_ready : std_logic_vector(3 downto 0);
	signal gt_rx_ready : std_logic_vector(3 downto 0);

	signal gt0_rxbufstatus : std_logic_vector(2 downto 0);
	signal gt1_rxbufstatus : std_logic_vector(2 downto 0);
	signal gt2_rxbufstatus : std_logic_vector(2 downto 0);
	signal gt3_rxbufstatus : std_logic_vector(2 downto 0);

	signal gt0_rxbuffault : std_logic;
	signal gt1_rxbuffault : std_logic;
	signal gt2_rxbuffault : std_logic;
	signal gt3_rxbuffault : std_logic;

	signal gt0_rxdatavalid_in_d1 : std_logic;
	signal gt1_rxdatavalid_in_d1 : std_logic;
	signal gt2_rxdatavalid_in_d1 : std_logic;
	signal gt3_rxdatavalid_in_d1 : std_logic;

	signal gt0_rxvalidfault : std_logic;
	signal gt1_rxvalidfault : std_logic;
	signal gt2_rxvalidfault : std_logic;
	signal gt3_rxvalidfault : std_logic;
	
	signal gt0_rxbufreset  : std_logic;
	signal gt1_rxbufreset  : std_logic;
	signal gt2_rxbufreset  : std_logic;
	signal gt3_rxbufreset  : std_logic;

	signal txseq_counter   : unsigned(5 downto 0) := (5 => '1', others => '0');
	signal txseq_counter_i : std_logic_vector(6 downto 0);

	signal fixed_delay_strobe_sr : std_logic_vector(130 downto 0);
	signal start_RXBUF_reset     : std_logic;

begin

	--  Static signal Assigments
	tied_to_ground_i <= '0';
	tied_to_vcc_i    <= '1';

	--$$$~~ BIT ORDER REVERSAL START ~~$$$--
	--LANE0
	LANE0_RX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
		generic map(NUMBER_OF_BITS => 64)
		port map(DATA_IN  => LANE0_RX_DATA,
			     DATA_OUT => LANE0_RX_DATA_O);

	LANE0_RX_DATA_VALID_O   <= LANE0_RX_DATA_VALID;
	LANE0_RX_HEADER_O(0)    <= LANE0_RX_HEADER(1);
	LANE0_RX_HEADER_O(1)    <= LANE0_RX_HEADER(0);
	LANE0_RX_HEADER_VALID_O <= LANE0_RX_HEADER_VALID;
	LANE0_RX_GEARBOXSLIP    <= LANE0_RX_GEARBOXSLIP_I;

	LANE0_TX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
		generic map(NUMBER_OF_BITS => 64)
		port map(DATA_IN  => LANE0_TX_DATA_I,
			     DATA_OUT => LANE0_TX_DATA);

	LANE0_TX_HEADER(0) <= LANE0_TX_HEADER_I(1);
	LANE0_TX_HEADER(1) <= LANE0_TX_HEADER_I(0);
	--LANE1
	LANE1_RX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
		generic map(NUMBER_OF_BITS => 64)
		port map(DATA_IN  => LANE1_RX_DATA,
			     DATA_OUT => LANE1_RX_DATA_O);

	LANE1_RX_DATA_VALID_O   <= LANE1_RX_DATA_VALID;
	LANE1_RX_HEADER_O(0)    <= LANE1_RX_HEADER(1);
	LANE1_RX_HEADER_O(1)    <= LANE1_RX_HEADER(0);
	LANE1_RX_HEADER_VALID_O <= LANE1_RX_HEADER_VALID;
	LANE1_RX_GEARBOXSLIP    <= LANE1_RX_GEARBOXSLIP_I;

	LANE1_TX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
		generic map(NUMBER_OF_BITS => 64)
		port map(DATA_IN  => LANE1_TX_DATA_I,
			     DATA_OUT => LANE1_TX_DATA);

	LANE1_TX_HEADER(0) <= LANE1_TX_HEADER_I(1);
	LANE1_TX_HEADER(1) <= LANE1_TX_HEADER_I(0);
	--LANE2
	LANE2_RX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
		generic map(NUMBER_OF_BITS => 64)
		port map(DATA_IN  => LANE2_RX_DATA,
			     DATA_OUT => LANE2_RX_DATA_O);

	LANE2_RX_DATA_VALID_O   <= LANE2_RX_DATA_VALID;
	LANE2_RX_HEADER_O(0)    <= LANE2_RX_HEADER(1);
	LANE2_RX_HEADER_O(1)    <= LANE2_RX_HEADER(0);
	LANE2_RX_HEADER_VALID_O <= LANE2_RX_HEADER_VALID;
	LANE2_RX_GEARBOXSLIP    <= LANE2_RX_GEARBOXSLIP_I;

	LANE2_TX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
		generic map(NUMBER_OF_BITS => 64)
		port map(DATA_IN  => LANE2_TX_DATA_I,
			     DATA_OUT => LANE2_TX_DATA);

	LANE2_TX_HEADER(0) <= LANE2_TX_HEADER_I(1);
	LANE2_TX_HEADER(1) <= LANE2_TX_HEADER_I(0);
	--LANE3
	LANE3_RX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
		generic map(NUMBER_OF_BITS => 64)
		port map(DATA_IN  => LANE3_RX_DATA,
			     DATA_OUT => LANE3_RX_DATA_O);

	LANE3_RX_DATA_VALID_O   <= LANE3_RX_DATA_VALID;
	LANE3_RX_HEADER_O(0)    <= LANE3_RX_HEADER(1);
	LANE3_RX_HEADER_O(1)    <= LANE3_RX_HEADER(0);
	LANE3_RX_HEADER_VALID_O <= LANE3_RX_HEADER_VALID;
	LANE3_RX_GEARBOXSLIP    <= LANE3_RX_GEARBOXSLIP_I;

	LANE3_TX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
		generic map(NUMBER_OF_BITS => 64)
		port map(DATA_IN  => LANE3_TX_DATA_I,
			     DATA_OUT => LANE3_TX_DATA);

	LANE3_TX_HEADER(0) <= LANE3_TX_HEADER_I(1);
	LANE3_TX_HEADER(1) <= LANE3_TX_HEADER_I(0);
	--$$$~~ BIT ORDER REVERSAL END ~~$$$--

	XLAUI_support_i : XLAUI_support
		generic map(
			EXAMPLE_SIM_GTRESET_SPEEDUP => EXAMPLE_SIM_GTRESET_SPEEDUP,
			STABLE_CLOCK_PERIOD         => STABLE_CLOCK_PERIOD
		)
		port map(
			SYS_CLK_I                   => SYS_CLK_I,
			SOFT_RESET_IN               => SOFT_RESET_IN,
			DONT_RESET_ON_DATA_ERROR_IN => tied_to_ground_i,
			GTREFCLK_PAD_N_IN           => GTREFCLK_PAD_N_I,
			GTREFCLK_PAD_P_IN           => GTREFCLK_PAD_P_I,
			GTREFCLK_O                  => GTREFCLK_O,
			GT0_TXOUTCLK_OUT            => GT0_TXOUTCLK_OUT,
			GT_TXUSRCLK2_IN             => GT_TXUSRCLK2_IN,
			GT_TXUSRCLK_IN              => GT_TXUSRCLK_IN,
			GT_TXUSRCLK_LOCKED_IN       => GT_TXUSRCLK_LOCKED_IN,
			GT_TXUSRCLK_RESET_OUT       => GT_TXUSRCLK_RESET_OUT,
			GT0_RXOUTCLK_OUT            => GT0_RXOUTCLK_OUT,
			GT_RXUSRCLK2_IN             => GT_RXUSRCLK2_IN,
			GT_RXUSRCLK_IN              => GT_RXUSRCLK_IN,
			GT_RXUSRCLK_LOCKED_IN       => GT_RXUSRCLK_LOCKED_IN,
			GT_RXUSRCLK_RESET_OUT       => GT_RXUSRCLK_RESET_OUT,
			GT0_TX_FSM_RESET_DONE_OUT   => gt_tx_ready(0),
			GT0_RX_FSM_RESET_DONE_OUT   => gt_rx_ready(0),
			GT0_DATA_VALID_IN           => LANE0_RX_DATA_VALID_I,
			GT1_TX_FSM_RESET_DONE_OUT   => gt_tx_ready(1),
			GT1_RX_FSM_RESET_DONE_OUT   => gt_rx_ready(1),
			GT1_DATA_VALID_IN           => LANE1_RX_DATA_VALID_I,
			GT2_TX_FSM_RESET_DONE_OUT   => gt_tx_ready(2),
			GT2_RX_FSM_RESET_DONE_OUT   => gt_rx_ready(2),
			GT2_DATA_VALID_IN           => LANE2_RX_DATA_VALID_I,
			GT3_TX_FSM_RESET_DONE_OUT   => gt_tx_ready(3),
			GT3_RX_FSM_RESET_DONE_OUT   => gt_rx_ready(3),
			GT3_DATA_VALID_IN           => LANE3_RX_DATA_VALID_I,
			--_____________________________________________________________________
			--_____________________________________________________________________
			--GT0  (X0Y36)

			---------------------------- Channel - DRP Ports  --------------------------
			gt0_drpaddr_in              => (others => '0'),
			gt0_drpdi_in                => (others => '0'),
			gt0_drpdo_out               => open,
			gt0_drpen_in                => '0',
			gt0_drprdy_out              => open,
			gt0_drpwe_in                => '0',
			------------------------------- Loopback Ports -----------------------------
			gt0_loopback_in             => (others => '0'),
			--------------------- RX Initialization and Reset Ports --------------------
			gt0_eyescanreset_in         => tied_to_ground_i,
			gt0_rxuserrdy_in            => tied_to_ground_i,
			-------------------------- RX Margin Analysis Ports ------------------------
			gt0_eyescandataerror_out    => open,
			gt0_eyescantrigger_in       => tied_to_ground_i,
			------------------- Receive Ports - Digital Monitor Ports ------------------
			gt0_dmonitorout_out         => open,
			------------------ Receive Ports - FPGA RX interface Ports -----------------
			gt0_rxdata_out              => LANE0_RX_DATA,
			------------------- Receive Ports - Pattern Checker Ports ------------------
			gt0_rxprbserr_out           => open,
			gt0_rxprbssel_in            => "000",
			------------------- Receive Ports - Pattern Checker ports ------------------
			gt0_rxprbscntreset_in       => tied_to_ground_i,
			------------------------ Receive Ports - RX AFE Ports ----------------------
			gt0_gthrxn_in               => RXN_I(0),
			------------------- Receive Ports - RX Buffer Bypass Ports -----------------
			gt0_rxbufreset_in           => gt0_rxbufreset,
			gt0_rxbufstatus_out         => gt0_rxbufstatus,
			--------------------- Receive Ports - RX Equalizer Ports -------------------
			gt0_rxmonitorout_out        => open,
			gt0_rxmonitorsel_in         => "00",
			---------------------- Receive Ports - RX Gearbox Ports --------------------
			gt0_rxdatavalid_out         => LANE0_RX_DATA_VALID,
			gt0_rxheader_out            => LANE0_RX_HEADER,
			gt0_rxheadervalid_out       => LANE0_RX_HEADER_VALID,
			--------------------- Receive Ports - RX Gearbox Ports  --------------------
			gt0_rxgearboxslip_in        => LANE0_RX_GEARBOXSLIP,
			------------- Receive Ports - RX Initialization and Reset Ports ------------
			gt0_gtrxreset_in            => tied_to_ground_i,
			gt0_rxpcsreset_in           => tied_to_ground_i,
			------------------------ Receive Ports -RX AFE Ports -----------------------
			gt0_gthrxp_in               => RXP_I(0),
			-------------- Receive Ports -RX Initialization and Reset Ports ------------
			gt0_rxresetdone_out         => open,
			--------------------- TX Initialization and Reset Ports --------------------
			gt0_gttxreset_in            => tied_to_ground_i,
			gt0_txuserrdy_in            => tied_to_ground_i,
			-------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
			gt0_txheader_in             => LANE0_TX_HEADER,
			--------------------- Transmit Ports - PCI Express Ports -------------------
			gt0_txelecidle_in           => tied_to_ground_i,
			------------------ Transmit Ports - Pattern Generator Ports ----------------
			gt0_txprbsforceerr_in       => tied_to_ground_i,
			---------------------- Transmit Ports - TX Buffer Ports --------------------
			gt0_txbufstatus_out         => gt0_txbufstatus_out,
			------------------ Transmit Ports - TX Data Path interface -----------------
			gt0_txdata_in               => LANE0_TX_DATA,
			---------------- Transmit Ports - TX Driver and OOB signaling --------------
			gt0_gthtxn_out              => TXN_O(0),
			gt0_gthtxp_out              => TXP_O(0),
			--------------------- Transmit Ports - TX Gearbox Ports --------------------
			gt0_txsequence_in           => txseq_counter_i,
			------------- Transmit Ports - TX Initialization and Reset Ports -----------
			gt0_txpcsreset_in           => tied_to_ground_i,
			gt0_txresetdone_out         => open,
			----------------- Transmit Ports - TX Polarity Control Ports ---------------
			gt0_txpolarity_in           => TX_POLARITY_INVERT(0),
			------------------ Transmit Ports - pattern Generator Ports ----------------
			gt0_txprbssel_in            => "000",

			--_____________________________________________________________________
			--_____________________________________________________________________
			--GT1  (X0Y37)

			---------------------------- Channel - DRP Ports  --------------------------
			gt1_drpaddr_in              => (others => '0'),
			gt1_drpdi_in                => (others => '0'),
			gt1_drpdo_out               => open,
			gt1_drpen_in                => '0',
			gt1_drprdy_out              => open,
			gt1_drpwe_in                => '0',
			------------------------------- Loopback Ports -----------------------------
			gt1_loopback_in             => (others => '0'),
			--------------------- RX Initialization and Reset Ports --------------------
			gt1_eyescanreset_in         => tied_to_ground_i,
			gt1_rxuserrdy_in            => tied_to_ground_i,
			-------------------------- RX Margin Analysis Ports ------------------------
			gt1_eyescandataerror_out    => open,
			gt1_eyescantrigger_in       => tied_to_ground_i,
			------------------- Receive Ports - Digital Monitor Ports ------------------
			gt1_dmonitorout_out         => open,
			------------------ Receive Ports - FPGA RX interface Ports -----------------
			gt1_rxdata_out              => LANE1_RX_DATA,
			------------------- Receive Ports - Pattern Checker Ports ------------------
			gt1_rxprbserr_out           => open,
			gt1_rxprbssel_in            => "000",
			------------------- Receive Ports - Pattern Checker ports ------------------
			gt1_rxprbscntreset_in       => tied_to_ground_i,
			------------------------ Receive Ports - RX AFE Ports ----------------------
			gt1_gthrxn_in               => RXN_I(1),
			------------------- Receive Ports - RX Buffer Bypass Ports -----------------
			gt1_rxbufreset_in           => gt1_rxbufreset,
			gt1_rxbufstatus_out         => gt1_rxbufstatus,
			--------------------- Receive Ports - RX Equalizer Ports -------------------
			gt1_rxmonitorout_out        => open,
			gt1_rxmonitorsel_in         => "00",
			---------------------- Receive Ports - RX Gearbox Ports --------------------
			gt1_rxdatavalid_out         => LANE1_RX_DATA_VALID,
			gt1_rxheader_out            => LANE1_RX_HEADER,
			gt1_rxheadervalid_out       => LANE1_RX_HEADER_VALID,
			--------------------- Receive Ports - RX Gearbox Ports  --------------------
			gt1_rxgearboxslip_in        => LANE1_RX_GEARBOXSLIP,
			------------- Receive Ports - RX Initialization and Reset Ports ------------
			gt1_gtrxreset_in            => tied_to_ground_i,
			gt1_rxpcsreset_in           => tied_to_ground_i,
			------------------------ Receive Ports -RX AFE Ports -----------------------
			gt1_gthrxp_in               => RXP_I(1),
			-------------- Receive Ports -RX Initialization and Reset Ports ------------
			gt1_rxresetdone_out         => open,
			--------------------- TX Initialization and Reset Ports --------------------
			gt1_gttxreset_in            => tied_to_ground_i,
			gt1_txuserrdy_in            => tied_to_ground_i,
			-------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
			gt1_txheader_in             => LANE1_TX_HEADER,
			--------------------- Transmit Ports - PCI Express Ports -------------------
			gt1_txelecidle_in           => tied_to_ground_i,
			------------------ Transmit Ports - Pattern Generator Ports ----------------
			gt1_txprbsforceerr_in       => tied_to_ground_i,
			---------------------- Transmit Ports - TX Buffer Ports --------------------
			gt1_txbufstatus_out         => gt1_txbufstatus_out,
			------------------ Transmit Ports - TX Data Path interface -----------------
			gt1_txdata_in               => LANE1_TX_DATA,
			---------------- Transmit Ports - TX Driver and OOB signaling --------------
			gt1_gthtxn_out              => TXN_O(1),
			gt1_gthtxp_out              => TXP_O(1),
			--------------------- Transmit Ports - TX Gearbox Ports --------------------
			gt1_txsequence_in           => txseq_counter_i,
			------------- Transmit Ports - TX Initialization and Reset Ports -----------
			gt1_txpcsreset_in           => tied_to_ground_i,
			gt1_txresetdone_out         => open,
			----------------- Transmit Ports - TX Polarity Control Ports ---------------
			gt1_txpolarity_in           => TX_POLARITY_INVERT(1),
			------------------ Transmit Ports - pattern Generator Ports ----------------
			gt1_txprbssel_in            => "000",

			--_____________________________________________________________________
			--_____________________________________________________________________
			--GT2  (X0Y38)

			---------------------------- Channel - DRP Ports  --------------------------
			gt2_drpaddr_in              => (others => '0'),
			gt2_drpdi_in                => (others => '0'),
			gt2_drpdo_out               => open,
			gt2_drpen_in                => '0',
			gt2_drprdy_out              => open,
			gt2_drpwe_in                => '0',
			------------------------------- Loopback Ports -----------------------------
			gt2_loopback_in             => (others => '0'),
			--------------------- RX Initialization and Reset Ports --------------------
			gt2_eyescanreset_in         => tied_to_ground_i,
			gt2_rxuserrdy_in            => tied_to_ground_i,
			-------------------------- RX Margin Analysis Ports ------------------------
			gt2_eyescandataerror_out    => open,
			gt2_eyescantrigger_in       => tied_to_ground_i,
			------------------- Receive Ports - Digital Monitor Ports ------------------
			gt2_dmonitorout_out         => open,
			------------------ Receive Ports - FPGA RX interface Ports -----------------
			gt2_rxdata_out              => LANE2_RX_DATA,
			------------------- Receive Ports - Pattern Checker Ports ------------------
			gt2_rxprbserr_out           => open,
			gt2_rxprbssel_in            => "000",
			------------------- Receive Ports - Pattern Checker ports ------------------
			gt2_rxprbscntreset_in       => tied_to_ground_i,
			------------------------ Receive Ports - RX AFE Ports ----------------------
			gt2_gthrxn_in               => RXN_I(2),
			------------------- Receive Ports - RX Buffer Bypass Ports -----------------
			gt2_rxbufreset_in           => gt2_rxbufreset,
			gt2_rxbufstatus_out         => gt2_rxbufstatus,
			--------------------- Receive Ports - RX Equalizer Ports -------------------
			gt2_rxmonitorout_out        => open,
			gt2_rxmonitorsel_in         => "00",
			---------------------- Receive Ports - RX Gearbox Ports --------------------
			gt2_rxdatavalid_out         => LANE2_RX_DATA_VALID,
			gt2_rxheader_out            => LANE2_RX_HEADER,
			gt2_rxheadervalid_out       => LANE2_RX_HEADER_VALID,
			--------------------- Receive Ports - RX Gearbox Ports  --------------------
			gt2_rxgearboxslip_in        => LANE2_RX_GEARBOXSLIP,
			------------- Receive Ports - RX Initialization and Reset Ports ------------
			gt2_gtrxreset_in            => tied_to_ground_i,
			gt2_rxpcsreset_in           => tied_to_ground_i,
			------------------------ Receive Ports -RX AFE Ports -----------------------
			gt2_gthrxp_in               => RXP_I(2),
			-------------- Receive Ports -RX Initialization and Reset Ports ------------
			gt2_rxresetdone_out         => open,
			--------------------- TX Initialization and Reset Ports --------------------
			gt2_gttxreset_in            => tied_to_ground_i,
			gt2_txuserrdy_in            => tied_to_ground_i,
			-------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
			gt2_txheader_in             => LANE2_TX_HEADER,
			--------------------- Transmit Ports - PCI Express Ports -------------------
			gt2_txelecidle_in           => tied_to_ground_i,
			------------------ Transmit Ports - Pattern Generator Ports ----------------
			gt2_txprbsforceerr_in       => tied_to_ground_i,
			---------------------- Transmit Ports - TX Buffer Ports --------------------
			gt2_txbufstatus_out         => gt2_txbufstatus_out,
			------------------ Transmit Ports - TX Data Path interface -----------------
			gt2_txdata_in               => LANE2_TX_DATA,
			---------------- Transmit Ports - TX Driver and OOB signaling --------------
			gt2_gthtxn_out              => TXN_O(2),
			gt2_gthtxp_out              => TXP_O(2),
			--------------------- Transmit Ports - TX Gearbox Ports --------------------
			gt2_txsequence_in           => txseq_counter_i,
			------------- Transmit Ports - TX Initialization and Reset Ports -----------
			gt2_txpcsreset_in           => tied_to_ground_i,
			gt2_txresetdone_out         => open,
			----------------- Transmit Ports - TX Polarity Control Ports ---------------
			gt2_txpolarity_in           => TX_POLARITY_INVERT(2),
			------------------ Transmit Ports - pattern Generator Ports ----------------
			gt2_txprbssel_in            => "000",

			--_____________________________________________________________________
			--_____________________________________________________________________
			--GT3  (X0Y39)

			---------------------------- Channel - DRP Ports  --------------------------
			gt3_drpaddr_in              => (others => '0'),
			gt3_drpdi_in                => (others => '0'),
			gt3_drpdo_out               => open,
			gt3_drpen_in                => '0',
			gt3_drprdy_out              => open,
			gt3_drpwe_in                => '0',
			------------------------------- Loopback Ports -----------------------------
			gt3_loopback_in             => (others => '0'),
			--------------------- RX Initialization and Reset Ports --------------------
			gt3_eyescanreset_in         => tied_to_ground_i,
			gt3_rxuserrdy_in            => tied_to_ground_i,
			-------------------------- RX Margin Analysis Ports ------------------------
			gt3_eyescandataerror_out    => open,
			gt3_eyescantrigger_in       => tied_to_ground_i,
			------------------- Receive Ports - Digital Monitor Ports ------------------
			gt3_dmonitorout_out         => open,
			------------------ Receive Ports - FPGA RX interface Ports -----------------
			gt3_rxdata_out              => LANE3_RX_DATA,
			------------------- Receive Ports - Pattern Checker Ports ------------------
			gt3_rxprbserr_out           => open,
			gt3_rxprbssel_in            => "000",
			------------------- Receive Ports - Pattern Checker ports ------------------
			gt3_rxprbscntreset_in       => tied_to_ground_i,
			------------------------ Receive Ports - RX AFE Ports ----------------------
			gt3_gthrxn_in               => RXN_I(3),
			------------------- Receive Ports - RX Buffer Bypass Ports -----------------
			gt3_rxbufreset_in           => gt3_rxbufreset,
			gt3_rxbufstatus_out         => gt3_rxbufstatus,
			--------------------- Receive Ports - RX Equalizer Ports -------------------
			gt3_rxmonitorout_out        => open,
			gt3_rxmonitorsel_in         => "00",
			---------------------- Receive Ports - RX Gearbox Ports --------------------
			gt3_rxdatavalid_out         => LANE3_RX_DATA_VALID,
			gt3_rxheader_out            => LANE3_RX_HEADER,
			gt3_rxheadervalid_out       => LANE3_RX_HEADER_VALID,
			--------------------- Receive Ports - RX Gearbox Ports  --------------------
			gt3_rxgearboxslip_in        => LANE3_RX_GEARBOXSLIP,
			------------- Receive Ports - RX Initialization and Reset Ports ------------
			gt3_gtrxreset_in            => tied_to_ground_i,
			gt3_rxpcsreset_in           => tied_to_ground_i,
			------------------------ Receive Ports -RX AFE Ports -----------------------
			gt3_gthrxp_in               => RXP_I(3),
			-------------- Receive Ports -RX Initialization and Reset Ports ------------
			gt3_rxresetdone_out         => open,
			--------------------- TX Initialization and Reset Ports --------------------
			gt3_gttxreset_in            => tied_to_ground_i,
			gt3_txuserrdy_in            => tied_to_ground_i,
			-------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
			gt3_txheader_in             => LANE3_TX_HEADER,
			--------------------- Transmit Ports - PCI Express Ports -------------------
			gt3_txelecidle_in           => tied_to_ground_i,
			------------------ Transmit Ports - Pattern Generator Ports ----------------
			gt3_txprbsforceerr_in       => tied_to_ground_i,
			---------------------- Transmit Ports - TX Buffer Ports --------------------
			gt3_txbufstatus_out         => gt3_txbufstatus_out,
			------------------ Transmit Ports - TX Data Path interface -----------------
			gt3_txdata_in               => LANE3_TX_DATA,
			---------------- Transmit Ports - TX Driver and OOB signaling --------------
			gt3_gthtxn_out              => TXN_O(3),
			gt3_gthtxp_out              => TXP_O(3),
			--------------------- Transmit Ports - TX Gearbox Ports --------------------
			gt3_txsequence_in           => txseq_counter_i,
			------------- Transmit Ports - TX Initialization and Reset Ports -----------
			gt3_txpcsreset_in           => tied_to_ground_i,
			gt3_txresetdone_out         => open,
			----------------- Transmit Ports - TX Polarity Control Ports ---------------
			gt3_txpolarity_in           => TX_POLARITY_INVERT(3),
			------------------ Transmit Ports - pattern Generator Ports ----------------
			gt3_txprbssel_in            => "000"
		);

	--____________________________ TXSEQUENCE counter to GT __________________________    
	process(GT_TXUSRCLK2_IN)
	begin
		if rising_edge(GT_TXUSRCLK2_IN) then
			if (GT_TXUSRCLK_LOCKED_IN = '0') or (txseq_counter(5) = '1') then
				txseq_counter <= (others => '0');
			else
				txseq_counter <= txseq_counter + 1;
			end if;
		end if;
	end process;

	txseq_counter_i(5 downto 0) <= std_logic_vector(txseq_counter);
	txseq_counter_i(6)          <= '0';

	GT_TX_READY_O <= gt_tx_ready;
	GT_RX_READY_O <= gt_rx_ready;

	TX_READ_EN_O <= not txseq_counter(5);

	gt0_rxbufstatus_out <= gt0_rxbufstatus;
	gt1_rxbufstatus_out <= gt1_rxbufstatus;
	gt2_rxbufstatus_out <= gt2_rxbufstatus;
	gt3_rxbufstatus_out <= gt3_rxbufstatus;

	RX_BUF_RESET_proc : process(GT_RXUSRCLK2_IN) is
	begin
		if rising_edge(GT_RXUSRCLK2_IN) then
			if (GT_RXUSRCLK_LOCKED_IN = '0') then
				fixed_delay_strobe_sr(0) <= '1';
				fixed_delay_strobe_sr(1) <= '0';
				gt0_rxbuffault <= '0';
				gt1_rxbuffault <= '0';
				gt2_rxbuffault <= '0';
				gt3_rxbuffault <= '0';
			else
				fixed_delay_strobe_sr(0) <= fixed_delay_strobe_sr(130);
				fixed_delay_strobe_sr(1) <= fixed_delay_strobe_sr(0);

				if (fixed_delay_strobe_sr(130) = '1') then
					gt0_rxbuffault <= gt0_rxbufstatus(2);
					gt1_rxbuffault <= gt1_rxbufstatus(2);
					gt2_rxbuffault <= gt2_rxbufstatus(2);
					gt3_rxbuffault <= gt3_rxbufstatus(2);
				else
					gt0_rxbuffault <= '0';
					gt1_rxbuffault <= '0';
					gt2_rxbuffault <= '0';
					gt3_rxbuffault <= '0';
				end if;
			end if;
			fixed_delay_strobe_sr(130 downto 2) <= fixed_delay_strobe_sr(129 downto 1);
		end if;
	end process RX_BUF_RESET_proc;
	
	RX_BUF_RESET2_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			gt0_rxdatavalid_in_d1 <= LANE0_RX_DATA_VALID_I;
			gt1_rxdatavalid_in_d1 <= LANE1_RX_DATA_VALID_I;
			gt2_rxdatavalid_in_d1 <= LANE2_RX_DATA_VALID_I;
			gt3_rxdatavalid_in_d1 <= LANE3_RX_DATA_VALID_I;

			gt0_rxvalidfault <= (not LANE0_RX_DATA_VALID_I) and gt0_rxdatavalid_in_d1;
			gt1_rxvalidfault <= (not LANE1_RX_DATA_VALID_I) and gt1_rxdatavalid_in_d1;
			gt2_rxvalidfault <= (not LANE2_RX_DATA_VALID_I) and gt2_rxdatavalid_in_d1;
			gt3_rxvalidfault <= (not LANE3_RX_DATA_VALID_I) and gt3_rxdatavalid_in_d1;
		end if;
	end process RX_BUF_RESET2_proc;

	gt0_rxbufreset <= gt0_rxbuffault or gt0_rxvalidfault;
	gt1_rxbufreset <= gt1_rxbuffault or gt1_rxvalidfault;
	gt2_rxbufreset <= gt2_rxbuffault or gt2_rxvalidfault;
	gt3_rxbufreset <= gt3_rxbuffault or gt3_rxvalidfault;

end Behavioral;


