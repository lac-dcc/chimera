----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date:		29.09.2014 16:26:53
-- Design Name: 
-- Module Name: 	IEEE802_3_XL_PHY - Behavioral
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

use work.IEEE802_3_XL_PKG.all;

entity IEEE802_3_XL_PHY is
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
end IEEE802_3_XL_PHY;

architecture Behavioral of IEEE802_3_XL_PHY is
	component XL_PMA_TX_RESET_CLOCKING_CONTROLLER is
		Port(
			REFCLK_I            : in  std_logic;
			REFCLK_RST_I        : in  std_logic;

			GTREFCLK_I          : in  std_logic;

			XL_TX_CLK_156M25_O  : out std_logic;
			XL_TX_CLK_161M133_O : out std_logic;
			XL_TX_CLK_322M266_O : out std_logic;
			XL_TX_CLK_625M_O    : out std_logic;
			XL_TX_CLK_RST_O     : out std_logic;
			XL_TX_CLK_LOCKED_O  : out std_logic
		);
	end component XL_PMA_TX_RESET_CLOCKING_CONTROLLER;

	component XL_PMA_RX_RESET_CLOCKING_CONTROLLER is
		Port(
			REFCLK_I            : in  std_logic;
			REFCLK_RST_I        : in  std_logic;

			XL_RX_CLK_156M25_O  : out std_logic;
			XL_RX_CLK_161M133_O : out std_logic;
			XL_RX_CLK_322M266_O : out std_logic;
			XL_RX_CLK_625M_O    : out std_logic;
			XL_RX_CLK_RST_O     : out std_logic;
			XL_RX_CLK_LOCKED_O  : out std_logic
		);
	end component XL_PMA_RX_RESET_CLOCKING_CONTROLLER;

	--component IEEE802_3_XL_VIO
	--	port(
	--		clk        : in  std_logic;
	--		probe_in0  : in  std_logic_vector(3 downto 0);
	--		probe_in1  : in  std_logic_vector(3 downto 0);
	--		probe_in2  : in  std_logic_vector(3 downto 0);
	--		probe_in3  : in  std_logic_vector(3 downto 0);
	--		probe_in4  : in  std_logic_vector(0 downto 0);
	--		probe_in5  : in  std_logic_vector(15 downto 0);
	--		probe_in6  : in  std_logic_vector(31 downto 0);
	--		probe_in7  : in  std_logic_vector(31 downto 0);
	--		probe_in8  : in  std_logic_vector(31 downto 0);
	--		probe_in9  : in  std_logic_vector(31 downto 0);
	--		probe_in10 : in  std_logic_vector(3 downto 0);
	--		probe_in11 : in  std_logic_vector(3 downto 0);
	--		probe_in12 : in  std_logic_vector(3 downto 0);
	--		probe_in13 : in  std_logic_vector(3 downto 0);
	--		probe_in14 : in  std_logic_vector(31 downto 0);
	--		probe_in15 : in  std_logic_vector(31 downto 0);
	--		probe_out0 : out std_logic_vector(0 downto 0);
	--		probe_out1 : out std_logic_vector(0 downto 0);
	--		probe_out2 : out std_logic_vector(0 downto 0);
	--		probe_out3 : out std_logic_vector(0 downto 0)
	--	);
	--end component;

	signal PMA_soft_reset_cpu          : std_logic;
	signal PMA_soft_reset_chipscope    : std_logic;
	signal PMA_soft_reset_cpu_d1       : std_logic;
	signal PMA_soft_reset_chipscope_d1 : std_logic;
	signal PMA_soft_reset              : std_logic;
	signal PMA_soft_reset_d1           : std_logic;

	signal GTREFCLK : std_logic;

	signal GT0_TXOUTCLK    : std_logic;
	signal GT_TXOUTCLK_RST : std_logic;

	signal XL_TX_CLK_156M25  : std_logic;
	signal XL_TX_CLK_161M133 : std_logic;
	signal XL_TX_CLK_322M266 : std_logic;
	signal XL_TX_CLK_625M    : std_logic;
	signal XL_TX_CLK_RST     : std_logic;
	signal XL_TX_CLK_LOCKED  : std_logic;

	signal GT0_RXOUTCLK    : std_logic;
	signal GT_RXOUTCLK_RST : std_logic;

	signal XL_RX_CLK_156M25  : std_logic;
	signal XL_RX_CLK_161M133 : std_logic;
	signal XL_RX_CLK_322M266 : std_logic;
	signal XL_RX_CLK_625M    : std_logic;
	signal XL_RX_CLK_RST     : std_logic;
	signal XL_RX_CLK_LOCKED  : std_logic;

	signal TX_READ_EN : std_logic;

	signal GT_TX_READY : std_logic_vector(3 downto 0);
	signal GT_RX_READY : std_logic_vector(3 downto 0);

	signal gt0_txbufstatus_out : std_logic_vector(1 downto 0);
	signal gt0_rxbufstatus_out : std_logic_vector(2 downto 0);
	signal gt1_txbufstatus_out : std_logic_vector(1 downto 0);
	signal gt1_rxbufstatus_out : std_logic_vector(2 downto 0);
	signal gt2_txbufstatus_out : std_logic_vector(1 downto 0);
	signal gt2_rxbufstatus_out : std_logic_vector(2 downto 0);
	signal gt3_txbufstatus_out : std_logic_vector(1 downto 0);
	signal gt3_rxbufstatus_out : std_logic_vector(2 downto 0);

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

	-- XLGMII INPUT Interface
	-- Transmitter Interface
	signal XLGMII_TX : XLGMII_t;

	-- XLGMII Output Interface
	-- Receiver Interface
	signal XLGMII_RX : XLGMII_t;

	signal block_lock   : std_logic_vector(3 downto 0);
	signal am_lock      : std_logic_vector(3 downto 0);
	signal align_status : std_logic;

	signal reset_faults     : std_logic := '1';
	signal tx_ready_fault   : std_logic_vector(3 downto 0);
	signal rx_ready_fault   : std_logic_vector(3 downto 0);
	signal block_lock_fault : std_logic_vector(3 downto 0);
	signal am_lock_fault    : std_logic_vector(3 downto 0);

	signal test_pattern_en_chipscope : std_logic := '0';
	signal test_pattern_en_d1        : std_logic := '0';
	signal test_pattern_en_d2        : std_logic := '0';

	signal test_pattern_error_quad           : std_logic_vector(3 downto 0);
	signal test_pattern_error_count_per_quad : std_logic_vector(2 downto 0);

	signal test_pattern_error_count_rst_chipscope : std_logic             := '0';
	signal test_pattern_error_count_rst           : std_logic             := '1';
	signal test_pattern_error_count               : unsigned(15 downto 0) := (others => '0');

	signal start_terminate_detected_count_rst : std_logic;

	signal encoder_start_detected_count     : std_logic_vector(31 downto 0);
	signal encoder_terminate_detected_count : std_logic_vector(31 downto 0);
	signal decoder_start_detected_count     : std_logic_vector(31 downto 0);
	signal decoder_terminate_detected_count : std_logic_vector(31 downto 0);
	
	signal rx_frame_count       : std_logic_vector(31 downto 0);
	signal rx_frame_error_count : std_logic_vector(31 downto 0);

begin
	TX_CLK_RCC : component XL_PMA_TX_RESET_CLOCKING_CONTROLLER
		port map(
			GTREFCLK_I          => GTREFCLK,
			REFCLK_I            => GT0_TXOUTCLK,
			REFCLK_RST_I        => GT_TXOUTCLK_RST,
			XL_TX_CLK_156M25_O  => XL_TX_CLK_156M25,
			XL_TX_CLK_161M133_O => XL_TX_CLK_161M133,
			XL_TX_CLK_322M266_O => XL_TX_CLK_322M266,
			XL_TX_CLK_625M_O    => XL_TX_CLK_625M,
			XL_TX_CLK_RST_O     => XL_TX_CLK_RST,
			XL_TX_CLK_LOCKED_O  => XL_TX_CLK_LOCKED
		);

	RX_CLK_RCC : component XL_PMA_RX_RESET_CLOCKING_CONTROLLER
		port map(
			REFCLK_I            => GT0_RXOUTCLK,
			REFCLK_RST_I        => GT_RXOUTCLK_RST,
			XL_RX_CLK_156M25_O  => XL_RX_CLK_156M25,
			XL_RX_CLK_161M133_O => XL_RX_CLK_161M133,
			XL_RX_CLK_322M266_O => XL_RX_CLK_322M266,
			XL_RX_CLK_625M_O    => XL_RX_CLK_625M,
			XL_RX_CLK_RST_O     => XL_RX_CLK_RST,
			XL_RX_CLK_LOCKED_O  => XL_RX_CLK_LOCKED
		);

	PMA_inst : component IEEE802_3_XL_PMA
		generic map(
			TX_POLARITY_INVERT => TX_POLARITY_INVERT
		)
		port map(
			SYS_CLK_I               => SYS_CLK_I,
			SOFT_RESET_IN           => PMA_soft_reset_d1,
			GTREFCLK_PAD_N_I        => GTREFCLK_PAD_N_I,
			GTREFCLK_PAD_P_I        => GTREFCLK_PAD_P_I,
			GTREFCLK_O              => GTREFCLK,
			GT0_TXOUTCLK_OUT        => GT0_TXOUTCLK,
			GT_TXUSRCLK2_IN         => XL_TX_CLK_161M133,
			GT_TXUSRCLK_IN          => XL_TX_CLK_322M266,
			GT_TXUSRCLK_LOCKED_IN   => XL_TX_CLK_LOCKED,
			GT_TXUSRCLK_RESET_OUT   => GT_TXOUTCLK_RST,
			GT0_RXOUTCLK_OUT        => GT0_RXOUTCLK,
			GT_RXUSRCLK2_IN         => XL_RX_CLK_161M133,
			GT_RXUSRCLK_IN          => XL_RX_CLK_322M266,
			GT_RXUSRCLK_LOCKED_IN   => XL_RX_CLK_LOCKED,
			GT_RXUSRCLK_RESET_OUT   => GT_RXOUTCLK_RST,
			TX_READ_EN_O            => TX_READ_EN,
			LANE0_TX_HEADER_I       => LANE0_TX_HEADER,
			LANE0_TX_DATA_I         => LANE0_TX_DATA,
			LANE1_TX_HEADER_I       => LANE1_TX_HEADER,
			LANE1_TX_DATA_I         => LANE1_TX_DATA,
			LANE2_TX_HEADER_I       => LANE2_TX_HEADER,
			LANE2_TX_DATA_I         => LANE2_TX_DATA,
			LANE3_TX_HEADER_I       => LANE3_TX_HEADER,
			LANE3_TX_DATA_I         => LANE3_TX_DATA,
			LANE0_RX_HEADER_VALID_O => LANE0_RX_HEADER_VALID,
			LANE0_RX_HEADER_O       => LANE0_RX_HEADER,
			LANE0_RX_DATA_VALID_O   => LANE0_RX_DATA_VALID,
			LANE0_RX_DATA_O         => LANE0_RX_DATA,
			LANE0_RX_GEARBOXSLIP_I  => LANE0_RX_GEARBOXSLIP,
			LANE0_RX_DATA_VALID_I   => am_lock(0),
			LANE1_RX_HEADER_VALID_O => LANE1_RX_HEADER_VALID,
			LANE1_RX_HEADER_O       => LANE1_RX_HEADER,
			LANE1_RX_DATA_VALID_O   => LANE1_RX_DATA_VALID,
			LANE1_RX_DATA_O         => LANE1_RX_DATA,
			LANE1_RX_GEARBOXSLIP_I  => LANE1_RX_GEARBOXSLIP,
			LANE1_RX_DATA_VALID_I   => am_lock(1),
			LANE2_RX_HEADER_VALID_O => LANE2_RX_HEADER_VALID,
			LANE2_RX_HEADER_O       => LANE2_RX_HEADER,
			LANE2_RX_DATA_VALID_O   => LANE2_RX_DATA_VALID,
			LANE2_RX_DATA_O         => LANE2_RX_DATA,
			LANE2_RX_GEARBOXSLIP_I  => LANE2_RX_GEARBOXSLIP,
			LANE2_RX_DATA_VALID_I   => am_lock(2),
			LANE3_RX_HEADER_VALID_O => LANE3_RX_HEADER_VALID,
			LANE3_RX_HEADER_O       => LANE3_RX_HEADER,
			LANE3_RX_DATA_VALID_O   => LANE3_RX_DATA_VALID,
			LANE3_RX_DATA_O         => LANE3_RX_DATA,
			LANE3_RX_GEARBOXSLIP_I  => LANE3_RX_GEARBOXSLIP,
			LANE3_RX_DATA_VALID_I   => am_lock(3),
			RXN_I                   => RXN_I,
			RXP_I                   => RXP_I,
			TXN_O                   => TXN_O,
			TXP_O                   => TXP_O,
			GT_TX_READY_O           => GT_TX_READY,
			GT_RX_READY_O           => GT_RX_READY,
			gt0_txbufstatus_out     => gt0_txbufstatus_out,
			gt0_rxbufstatus_out     => gt0_rxbufstatus_out,
			gt1_txbufstatus_out     => gt1_txbufstatus_out,
			gt1_rxbufstatus_out     => gt1_rxbufstatus_out,
			gt2_txbufstatus_out     => gt2_txbufstatus_out,
			gt2_rxbufstatus_out     => gt2_rxbufstatus_out,
			gt3_txbufstatus_out     => gt3_txbufstatus_out,
			gt3_rxbufstatus_out     => gt3_rxbufstatus_out
		);

	GTREFCLK_O <= GTREFCLK;

	GT_TX_READY_O <= GT_TX_READY;
	GT_RX_READY_O <= GT_RX_READY;
	
	PMA_soft_reset_cpu <= SOFT_RESET_I;

	SOFT_RESET_REGISTER_proc : process(SYS_CLK_I, SYS_CLK_RST_I) is
	begin
		if SYS_CLK_RST_I = '1' then
			PMA_soft_reset_cpu_d1       <= '1';
			PMA_soft_reset_chipscope_d1 <= '1';
			PMA_soft_reset              <= '1';
			PMA_soft_reset_d1           <= '1';
			reset_faults                <= '1';
		elsif rising_edge(SYS_CLK_I) then
			PMA_soft_reset_cpu_d1       <= PMA_soft_reset_cpu;
			PMA_soft_reset_chipscope_d1 <= PMA_soft_reset_chipscope;
			PMA_soft_reset              <= PMA_soft_reset_chipscope_d1 or PMA_soft_reset_cpu_d1;
			PMA_soft_reset_d1           <= PMA_soft_reset;
			if ((PMA_soft_reset = '0') and (PMA_soft_reset_d1 = '1')) then
				reset_faults <= '1';
			else
				reset_faults <= '0';
			end if;
		end if;
	end process SOFT_RESET_REGISTER_proc;

	PCS_inst : component IEEE802_3_XL_PCS
		port map(
			SYS_CLK_I                          => SYS_CLK_I,
			SYS_RST_I                          => SYS_CLK_RST_I,
			XL_TX_CLK_156M25_I                 => XL_TX_CLK_156M25,
			XL_TX_CLK_161M133_I                => XL_TX_CLK_161M133,
			XL_TX_CLK_625M_I                   => XL_TX_CLK_625M,
			XL_TX_CLK_RST_I                    => XL_TX_CLK_RST,
			XLGMII_TX_I                        => XLGMII_TX,
			TX_ENABLE_I                        => TX_READ_EN,
			LANE0_TX_HEADER_O                  => LANE0_TX_HEADER,
			LANE0_TX_DATA_O                    => LANE0_TX_DATA,
			LANE1_TX_HEADER_O                  => LANE1_TX_HEADER,
			LANE1_TX_DATA_O                    => LANE1_TX_DATA,
			LANE2_TX_HEADER_O                  => LANE2_TX_HEADER,
			LANE2_TX_DATA_O                    => LANE2_TX_DATA,
			LANE3_TX_HEADER_O                  => LANE3_TX_HEADER,
			LANE3_TX_DATA_O                    => LANE3_TX_DATA,
			XL_RX_CLK_156M25_I                 => XL_RX_CLK_156M25,
			XL_RX_CLK_161M133_I                => XL_RX_CLK_161M133,
			XL_RX_CLK_625M_I                   => XL_RX_CLK_625M,
			XL_RX_CLK_RST_I                    => XL_RX_CLK_RST,
			XLGMII_RX_O                        => XLGMII_RX,
			LANE0_RX_HEADER_VALID_I            => LANE0_RX_HEADER_VALID,
			LANE0_RX_HEADER_I                  => LANE0_RX_HEADER,
			LANE0_RX_DATA_VALID_I              => LANE0_RX_DATA_VALID,
			LANE0_RX_DATA_I                    => LANE0_RX_DATA,
			LANE0_RX_GEARBOXSLIP_O             => LANE0_RX_GEARBOXSLIP,
			LANE1_RX_HEADER_VALID_I            => LANE1_RX_HEADER_VALID,
			LANE1_RX_HEADER_I                  => LANE1_RX_HEADER,
			LANE1_RX_DATA_VALID_I              => LANE1_RX_DATA_VALID,
			LANE1_RX_DATA_I                    => LANE1_RX_DATA,
			LANE1_RX_GEARBOXSLIP_O             => LANE1_RX_GEARBOXSLIP,
			LANE2_RX_HEADER_VALID_I            => LANE2_RX_HEADER_VALID,
			LANE2_RX_HEADER_I                  => LANE2_RX_HEADER,
			LANE2_RX_DATA_VALID_I              => LANE2_RX_DATA_VALID,
			LANE2_RX_DATA_I                    => LANE2_RX_DATA,
			LANE2_RX_GEARBOXSLIP_O             => LANE2_RX_GEARBOXSLIP,
			LANE3_RX_HEADER_VALID_I            => LANE3_RX_HEADER_VALID,
			LANE3_RX_HEADER_I                  => LANE3_RX_HEADER,
			LANE3_RX_DATA_VALID_I              => LANE3_RX_DATA_VALID,
			LANE3_RX_DATA_I                    => LANE3_RX_DATA,
			LANE3_RX_GEARBOXSLIP_O             => LANE3_RX_GEARBOXSLIP,
			BLOCK_LOCK_O                       => block_lock,
			AM_LOCK_O                          => am_lock,
			ALIGN_STATUS_O                     => align_status,
			TEST_PATTERN_EN_I                  => test_pattern_en_d1,
			TEST_PATTERN_ERROR_QUAD_O          => test_pattern_error_quad,
			ENCODER_START_DETECTED_COUNT_O     => encoder_start_detected_count,
			ENCODER_TERMINATE_DETECTED_COUNT_O => encoder_terminate_detected_count,
			DECODER_START_DETECTED_COUNT_O     => decoder_start_detected_count,
			DECODER_TERMINATE_DETECTED_COUNT_O => decoder_terminate_detected_count,
			ENC_DEC_COUNT_RST_I                => start_terminate_detected_count_rst
		);

	BLOCK_LOCK_O   <= block_lock;
	AM_LOCK_O      <= am_lock;
	ALIGN_STATUS_O <= align_status;

	RS_inst : component IEEE802_3_XL_RS
		port map(
			SYS_CLK_I              => SYS_CLK_I,
			SYS_RST_I              => SYS_CLK_RST_I,
			XL_TX_CLK_156M25_I     => XL_TX_CLK_156M25,
			XL_TX_CLK_625M_I       => XL_TX_CLK_625M,
			XL_TX_CLK_RST_I        => XL_TX_CLK_RST,
			XLGMII_TX_O            => XLGMII_TX,
			XLGMII_X4_TX_I         => XLGMII_X4_TX_I,
			XL_RX_CLK_156M25_I     => XL_RX_CLK_156M25,
			XL_RX_CLK_625M_I       => XL_RX_CLK_625M,
			XL_RX_CLK_RST_I        => XL_RX_CLK_RST,
			XLGMII_RX_I            => XLGMII_RX,
			XLGMII_X4_RX_O         => XLGMII_X4_RX_O,
			RX_FRAME_COUNT_O       => rx_frame_count,
			RX_FRAME_ERROR_COUNT_O => rx_frame_error_count
		);

	TEST_PATTERN_ERROR_COUNTER_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if (SYS_CLK_RST_I = '1') then
				test_pattern_en_d1 <= '0';
				test_pattern_en_d2 <= '0';

				test_pattern_error_count_per_quad <= (others => '0');

				test_pattern_error_count_rst <= '1';
			else
				test_pattern_en_d1 <= test_pattern_en_chipscope or TEST_PATTERN_EN_I;
				test_pattern_en_d2 <= test_pattern_en_d1;

				case test_pattern_error_quad is
					when "0000" => test_pattern_error_count_per_quad <= "000";
					when "0001" => test_pattern_error_count_per_quad <= "001";
					when "0010" => test_pattern_error_count_per_quad <= "001";
					when "0011" => test_pattern_error_count_per_quad <= "010";
					when "0100" => test_pattern_error_count_per_quad <= "001";
					when "0101" => test_pattern_error_count_per_quad <= "010";
					when "0110" => test_pattern_error_count_per_quad <= "010";
					when "0111" => test_pattern_error_count_per_quad <= "011";
					when "1000" => test_pattern_error_count_per_quad <= "001";
					when "1001" => test_pattern_error_count_per_quad <= "010";
					when "1010" => test_pattern_error_count_per_quad <= "010";
					when "1011" => test_pattern_error_count_per_quad <= "011";
					when "1100" => test_pattern_error_count_per_quad <= "010";
					when "1101" => test_pattern_error_count_per_quad <= "011";
					when "1110" => test_pattern_error_count_per_quad <= "011";
					when others => test_pattern_error_count_per_quad <= "111";
				end case;

				test_pattern_error_count_rst <= test_pattern_error_count_rst_chipscope;
			end if;

			if (test_pattern_error_count_rst = '1') then
				test_pattern_error_count <= (others => '0');
			else
				if (test_pattern_en_d2 = '1') then
					test_pattern_error_count <= test_pattern_error_count + unsigned(test_pattern_error_count_per_quad);
				end if;
			end if;
		end if;
	end process TEST_PATTERN_ERROR_COUNTER_proc;

	TEST_PATTERN_ERROR_COUNT_O <= std_logic_vector(test_pattern_error_count);

	--generate_DEBUG_VIO_inst : if USE_CHIPSCOPE = 1 generate

	--DEBUG_VIO_inst : IEEE802_3_XL_VIO
	--	port map(
	--		clk           => SYS_CLK_I,
	--		probe_in0     => GT_TX_READY,
	--		probe_in1     => GT_RX_READY,
	--		probe_in2     => block_lock,
	--		probe_in3     => am_lock,
	--		probe_in4(0)  => align_status,
	--		probe_in5     => std_logic_vector(test_pattern_error_count),
	--		probe_in6     => encoder_start_detected_count,
	--		probe_in7     => encoder_terminate_detected_count,
	--		probe_in8     => decoder_start_detected_count,
	--		probe_in9     => decoder_terminate_detected_count,
	--		probe_in10    => tx_ready_fault,
	--		probe_in11    => rx_ready_fault,
	--		probe_in12    => block_lock_fault,
	--		probe_in13    => am_lock_fault,
	--		probe_in14    => rx_frame_count,
	--		probe_in15    => rx_frame_error_count,
	--		probe_out0(0) => test_pattern_en_chipscope,
	--		probe_out1(0) => test_pattern_error_count_rst_chipscope,
	--		probe_out2(0) => start_terminate_detected_count_rst,
	--		probe_out3(0) => PMA_soft_reset_chipscope
	--	);

	--end generate generate_DEBUG_VIO_inst;

	--not_generate_DEBUG_VIO_inst : if USE_CHIPSCOPE = 0 generate
	test_pattern_en_chipscope              <= '0';
	test_pattern_error_count_rst_chipscope <= '0';
	start_terminate_detected_count_rst     <= '0';
	PMA_soft_reset_chipscope               <= '0';
	--end generate not_generate_DEBUG_VIO_inst;

	lanes : for i in 0 to 3 generate
	begin
		LATCH_DEBUG_proc : process(SYS_CLK_I) is
		begin
			if rising_edge(SYS_CLK_I) then
				if reset_faults = '1' then
					tx_ready_fault(i)   <= '0';
					rx_ready_fault(i)   <= '0';
					block_lock_fault(i) <= '0';
					am_lock_fault(i)    <= '0';
				else
					if (align_status = '1') then
						if (GT_TX_READY(i) = '0') then
							tx_ready_fault(i) <= '1';
						end if;
						if (GT_RX_READY(i) = '0') then
							rx_ready_fault(i) <= '1';
						end if;
						if (block_lock(i) = '0') then
							block_lock_fault(i) <= '1';
						end if;
						if (am_lock(i) = '0') then
							am_lock_fault(i) <= '1';
						end if;
					end if;
				end if;
			end if;
		end process LATCH_DEBUG_proc;
	end generate lanes;
end Behavioral;
