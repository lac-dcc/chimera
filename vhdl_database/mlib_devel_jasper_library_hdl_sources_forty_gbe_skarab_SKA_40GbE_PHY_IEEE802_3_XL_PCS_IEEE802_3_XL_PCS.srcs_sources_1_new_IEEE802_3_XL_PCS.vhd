----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 04.08.2014 10:57:45
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS - Behavioral
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

entity IEEE802_3_XL_PCS is
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
end IEEE802_3_XL_PCS;

architecture Behavioral of IEEE802_3_XL_PCS is
	attribute ASYNC_REG : string;
	attribute shreg_extract : string;
	attribute DONT_TOUCH : string;

	-- ####~~TX~~####
	-- TX1 Outputs (ENCODER)
	signal BLOCK_VALID_TX1 : std_logic;
	signal PCS_BLOCK_TX1   : BLOCK_t;

	signal BLOCK_VALID_TX1_2 : std_logic;
	signal PCS_BLOCK_TX1_2   : BLOCK_t;

	-- TX2 Outputs (THROTTLE)
	signal BLOCK_VALID_TX2 : std_logic;
	signal PCS_BLOCK_TX2   : BLOCK_t;

	--TX3 Outputs (SCRAMBLER)
	signal BLOCK_VALID_TX3 : std_logic;
	signal PCS_BLOCK_TX3   : BLOCK_t;

	--TX4 Outputs (BLOCK_DIST)
	signal BLOCK_VALID_TX4 : NIBBLE_t;
	signal PCS_BLOCKs_TX4  : BLOCK_ARRAY_t(3 downto 0);

	--TX5 Outputs (PCS_DATA_FREQ_DIV)
	signal BLOCKs_VALID_TX5 : std_logic;
	signal PCS_BLOCKs_TX5   : BLOCK_ARRAY_t(3 downto 0);

	--TX6 Outputs (FIFO)
	signal BLOCKs_VALID_TX6 : std_logic;
	signal PCS_BLOCKs_TX6   : BLOCK_ARRAY_t(3 downto 0);

	--TX6 Outputs (AM_INSERTER)
	signal XL_TX_CLK_161M133_RST : std_logic;
	signal PCS_BLOCKs_TX7        : BLOCK_ARRAY_t(3 downto 0);

	-- ####~~RX~~####
	--RX0
	signal BLOCK_VALID_RX0  : NIBBLE_t;
	signal HEADER_VALID_RX0 : NIBBLE_t;
	signal PCS_BLOCKs_RX0   : BLOCK_ARRAY_t(3 downto 0);

	--RX1
	signal BLOCKs_VALID_RX1  : std_logic;
	signal PCS_BLOCKs_RX1    : BLOCK_ARRAY_t(3 downto 0);
	signal BLOCK_LOCK_RX1    : NIBBLE_t;
	signal BLOCK_LOCK_RX1_SR : NIBBLE_ARRAY_t(3 downto 0);
	signal SLIP_RX1          : NIBBLE_t;

	--RX2
	signal PCS_BLOCKs_RX2 : BLOCK_ARRAY_t(3 downto 0);

	--RX3
	signal PCS_BLOCKs_RX3 : BLOCK_ARRAY_t(3 downto 0);
	signal AM_VALID_RX3   : NIBBLE_t;
	signal AM_LOCK_RX3    : NIBBLE_t;
	signal LANE_MAP_RX3   : NIBBLE_ARRAY_t(3 downto 0);
	signal AM_STATUS_RX3  : std_logic;

	--RX4
	signal PCS_BLOCKs_RX4   : BLOCK_ARRAY_t(3 downto 0);
	signal AM_VALID_RX4     : std_logic;
	signal ALIGN_STATUS_RX4 : std_logic;

	--RX5
	signal PCS_BLOCKs_RX5 : BLOCK_ARRAY_t(3 downto 0);

	--RX6
	signal BLOCKs_VALID_RX6 : std_logic;
	signal PCS_BLOCKs_RX6   : BLOCK_ARRAY_t(3 downto 0);
	signal BIP_ERROR_RX6    : std_logic;

	--RX7
	signal BLOCK_VALID_RX7 : NIBBLE_t;
	signal PCS_BLOCKs_RX7  : BLOCK_ARRAY_t(3 downto 0);

	--RX8
	signal BLOCK_VALID_RX8 : std_logic;
	signal PCS_BLOCK_RX8   : BLOCK_t;

	--RX9
	signal BLOCK_VALID_RX9 : std_logic;
	signal PCS_BLOCK_RX9   : BLOCK_t;

	--RX10
	signal PCS_BLOCK_RX10  : BLOCK_t;
	signal BLOCK_IDLE_RX10 : std_logic;

	-- ####~~TX~~####
	--THROTTLE
	signal THROTTLE_REQUEST        : std_logic;
	signal THROTTLE_STROBE         : std_logic := '0';
	signal THROTTLE_STROBE_SR      : std_logic_vector(3 downto 0);
	signal THROTTLE_STROBE_current : std_logic := '0';
	signal THROTTLE_STROBE_old     : std_logic := '0';
	signal throttle_en_sr          : std_logic_vector(3 downto 0);
	signal throttle_en             : std_logic;

	attribute ASYNC_REG of THROTTLE_STROBE_SR : signal is "true";
	attribute shreg_extract of THROTTLE_STROBE_SR : signal is "no";

	--FIFO
	signal TX_FIFO_RD_EN : std_logic := '0';

	signal TX_FIFO_EMPTY    : std_logic;
	signal TX_FIFO_EMPTY_SR : std_logic_vector(2 downto 0) := (others => '1');
	signal TX_FIFO_PAUSE    : std_logic                    := '1';

	signal ENCODER_START_DETECTED    : std_logic;
	signal ENCODER_START_DETECTED_SR : std_logic_vector(3 downto 0);

	signal ENCODER_START_COUNT_INC : std_logic;
	signal ENCODER_START_COUNT     : unsigned(31 downto 0);

	signal ENCODER_TERMINATE_DETECTED    : std_logic;
	signal ENCODER_TERMINATE_DETECTED_SR : std_logic_vector(3 downto 0);

	signal ENCODER_TERMINATE_COUNT_INC : std_logic;
	signal ENCODER_TERMINATE_COUNT     : unsigned(31 downto 0);

	-- ####~~RX~~####
	signal TEST_PATTERN_ERROR      : std_logic;
	signal TEST_PATTERN_ERROR_QUAD : std_logic_vector(3 downto 0);

	signal DECODER_START_DETECTED    : std_logic;
	signal DECODER_START_DETECTED_SR : std_logic_vector(3 downto 0);

	signal DECODER_START_COUNT_INC : std_logic;
	signal DECODER_START_COUNT     : unsigned(31 downto 0);

	signal DECODER_TERMINATE_DETECTED    : std_logic;
	signal DECODER_TERMINATE_DETECTED_SR : std_logic_vector(3 downto 0);

	signal DECODER_TERMINATE_COUNT_INC : std_logic;
	signal DECODER_TERMINATE_COUNT     : unsigned(31 downto 0);

	attribute ASYNC_REG of ENCODER_START_DETECTED_SR : signal is "true";
	attribute ASYNC_REG of ENCODER_TERMINATE_DETECTED_SR : signal is "true";
	attribute ASYNC_REG of DECODER_START_DETECTED_SR : signal is "true";
	attribute ASYNC_REG of DECODER_TERMINATE_DETECTED_SR : signal is "true";

	signal ENC_DEC_COUNT_RST_d1 : std_logic;

	-- ##~~STATUS_SIGNALS~~##

	signal BLOCK_LOCK_SR   : NIBBLE_ARRAY_t(3 downto 0);
	signal AM_LOCK_SR      : NIBBLE_ARRAY_t(3 downto 0);
	signal ALIGN_STATUS_SR : std_logic_vector(3 downto 0);
	signal BIP_ERROR_SR    : std_logic_vector(3 downto 0);

	signal TEST_PATTERN_ERROR_QUAD_SR : NIBBLE_ARRAY_t(3 downto 0);
	signal TEST_PATTERN_EN_SR         : std_logic_vector(3 downto 0);
	signal TEST_PATTERN_EN_ARRAY      : std_logic_vector(8 downto 0);

	attribute DONT_TOUCH of TEST_PATTERN_EN_ARRAY : signal is "true";

	attribute ASYNC_REG of BLOCK_LOCK_SR : signal is "true";
	attribute ASYNC_REG of AM_LOCK_SR : signal is "true";
	attribute ASYNC_REG of ALIGN_STATUS_SR : signal is "true";
	attribute ASYNC_REG of BIP_ERROR_SR : signal is "true";
	attribute ASYNC_REG of TEST_PATTERN_ERROR_QUAD_SR : signal is "true";
	attribute ASYNC_REG of TEST_PATTERN_EN_SR : signal is "true";
	attribute shreg_extract of TEST_PATTERN_EN_SR : signal is "no";

	attribute ASYNC_REG of BLOCK_LOCK_RX1_SR : signal is "true";

	signal lane_en : NIBBLE_ARRAY_t(3 downto 0);

	signal RX_FIFO_RD_EN    : std_logic;
	signal RX_FIFO_FULL     : std_logic;
	signal RX_FIFO_EMPTY    : std_logic;
	signal RX_FIFO_EMPTY_SR : std_logic_vector(2 downto 0) := (others => '1');
	signal RX_FIFO_PAUSE    : std_logic                    := '1';

	signal tied_to_ground_i : std_logic;

begin
	tied_to_ground_i <= '0';

	TX1 : component IEEE802_3_XL_PCS_ENCODER
		port map(
			CLK_I                      => XL_TX_CLK_625M_I,
			RST_I                      => XL_TX_CLK_RST_I,
			XLGMII_TX_I                => XLGMII_TX_I,
			BLOCK_VALID_O              => BLOCK_VALID_TX1,
			PCS_BLOCK_O                => PCS_BLOCK_TX1,
			FRAME_START_DETECTED_O     => ENCODER_START_DETECTED,
			FRAME_TERMINATE_DETECTED_O => ENCODER_TERMINATE_DETECTED
		);

	CROSS_CLK_proc : process(XL_TX_CLK_625M_I) is
	begin
		if rising_edge(XL_TX_CLK_625M_I) then
			THROTTLE_STROBE_SR(0)          <= THROTTLE_STROBE;
			THROTTLE_STROBE_SR(3 downto 1) <= THROTTLE_STROBE_SR(2 downto 0);
			TEST_PATTERN_EN_SR(0)          <= TEST_PATTERN_EN_I;
			TEST_PATTERN_EN_SR(3 downto 1) <= TEST_PATTERN_EN_SR(2 downto 0);
		end if;
	end process CROSS_CLK_proc;

	TEST_PATTERN_generate : for i in 0 to 7 generate
	begin
		TEST_PATTERN_proc1 : process(XL_TX_CLK_625M_I) is
		begin
			if rising_edge(XL_TX_CLK_625M_I) then
				TEST_PATTERN_EN_ARRAY(i) <= TEST_PATTERN_EN_SR(3);

				if (TEST_PATTERN_EN_ARRAY(i) = '1') then
					PCS_BLOCK_TX1_2.P((i + 1) * 8 - 1 downto i * 8) <= IBLOCK_t.P((i + 1) * 8 - 1 downto i * 8);
				else
					PCS_BLOCK_TX1_2.P((i + 1) * 8 - 1 downto i * 8) <= PCS_BLOCK_TX1.P((i + 1) * 8 - 1 downto i * 8);
				end if;
			end if;
		end process TEST_PATTERN_proc1;
	end generate TEST_PATTERN_generate;

	TEST_PATTERN_proc2 : process(XL_TX_CLK_625M_I) is
	begin
		if rising_edge(XL_TX_CLK_625M_I) then
			TEST_PATTERN_EN_ARRAY(8) <= TEST_PATTERN_EN_SR(3);

			if TEST_PATTERN_EN_ARRAY(8) = '1' then
				BLOCK_VALID_TX1_2 <= '0';
				PCS_BLOCK_TX1_2.H <= IBLOCK_t.H;
			else
				BLOCK_VALID_TX1_2 <= BLOCK_VALID_TX1;
				PCS_BLOCK_TX1_2.H <= PCS_BLOCK_TX1.H;
			end if;
		end if;
	end process TEST_PATTERN_proc2;

	TX2 : component PCS_BLOCK_THROTTLE
		port map(
			CLK_I         => XL_TX_CLK_625M_I,
			RST_I         => XL_TX_CLK_RST_I,
			THROTTLE_I    => throttle_en,
			PCS_BLOCK_I   => PCS_BLOCK_TX1_2,
			BLOCK_VALID_I => BLOCK_VALID_TX1_2,
			PCS_BLOCK_O   => PCS_BLOCK_TX2,
			BLOCK_VALID_O => BLOCK_VALID_TX2
		);

	THROTTLE_EN_proc : process(XL_TX_CLK_625M_I) is
	begin
		if rising_edge(XL_TX_CLK_625M_I) then
			if (XL_TX_CLK_RST_I = '1') then
				THROTTLE_STROBE_current <= '0';
				THROTTLE_STROBE_old     <= '0';
				throttle_en_sr(0)       <= '0';
			else
				THROTTLE_STROBE_current <= THROTTLE_STROBE_SR(3);
				THROTTLE_STROBE_old     <= THROTTLE_STROBE_current;

				if (THROTTLE_STROBE_current /= THROTTLE_STROBE_old) then
					throttle_en_sr(0) <= '1';
				else
					throttle_en_sr(0) <= '0';
				end if;

			end if;

			throttle_en_sr(3 downto 1) <= throttle_en_sr(2 downto 0);

			throttle_en <= throttle_en_sr(3) or throttle_en_sr(2) or throttle_en_sr(1) or throttle_en_sr(0);
		end if;
	end process THROTTLE_EN_proc;

	TX3 : component IEEE802_3_XL_PCS_SCRAMBLER
		port map(
			CLK_I         => XL_TX_CLK_625M_I,
			RST_I         => XL_TX_CLK_RST_I,
			PCS_BLOCK_I   => PCS_BLOCK_TX2,
			BLOCK_VALID_I => BLOCK_VALID_TX2,
			PCS_BLOCK_O   => PCS_BLOCK_TX3,
			BLOCK_VALID_O => BLOCK_VALID_TX3
		);

	TX4 : component IEEE802_3_XL_PCS_BLK_DIST
		port map(
			CLK_I         => XL_TX_CLK_625M_I,
			RST_I         => XL_TX_CLK_RST_I,
			BLOCK_VALID_I => BLOCK_VALID_TX3,
			PCS_BLOCK_I   => PCS_BLOCK_TX3,
			BLOCK_VALID_O => BLOCK_VALID_TX4,
			PCS_BLOCKs_O  => PCS_BLOCKs_TX4
		);

	TX5 : component PCS_DATA_FREQUENCY_DIVIDER
		port map(
			CLK_I          => XL_TX_CLK_625M_I,
			CLK_DIV_I      => XL_TX_CLK_156M25_I,
			BLOCK_VALID_I  => BLOCK_VALID_TX4,
			PCS_BLOCKs_I   => PCS_BLOCKs_TX4,
			BLOCKs_VALID_O => BLOCKs_VALID_TX5,
			PCS_BLOCKs_O   => PCS_BLOCKs_TX5
		);

	TX6 : component PCS_BLOCKs_FIFO
		port map(
			RST_I          => XL_TX_CLK_RST_I,
			WR_CLK_I       => XL_TX_CLK_156M25_I,
			PCS_BLOCKs_I   => PCS_BLOCKs_TX5,
			BLOCKS_VALID_I => BLOCKS_VALID_TX5,
			RD_CLK_I       => XL_TX_CLK_161M133_I,
			RD_EN_I        => TX_FIFO_RD_EN,
			PCS_BLOCKs_O   => PCS_BLOCKs_TX6,
			BLOCKs_VALID_O => BLOCKs_VALID_TX6,
			FULL           => open,
			EMPTY          => TX_FIFO_EMPTY
		);

	TX_FIFO_EMPTY_SR(0) <= TX_FIFO_EMPTY;

	TX_FIFO_RD_EN <= TX_ENABLE_I and (not THROTTLE_REQUEST) and (not TX_FIFO_PAUSE);

	TX_FIFO_CTRL_proc : process(XL_TX_CLK_161M133_I) is
	begin
		if rising_edge(XL_TX_CLK_161M133_I) then
			if (THROTTLE_REQUEST = '1') then
				THROTTLE_STROBE <= not THROTTLE_STROBE;
			else
				THROTTLE_STROBE <= THROTTLE_STROBE;
			end if;

			TX_FIFO_EMPTY_SR(2 downto 1) <= TX_FIFO_EMPTY_SR(1 downto 0);
			if (TX_FIFO_EMPTY_SR = "000") then
				TX_FIFO_PAUSE <= '0';
			else
				TX_FIFO_PAUSE <= '1';
			end if;

		end if;
	end process TX_FIFO_CTRL_proc;

	XL_TX_CLK_161M133_RST_REGISTER_proc : process(XL_TX_CLK_161M133_I, XL_TX_CLK_RST_I) is
	begin
		if XL_TX_CLK_RST_I = '1' then
			XL_TX_CLK_161M133_RST <= '1';
		elsif rising_edge(XL_TX_CLK_161M133_I) then
			XL_TX_CLK_161M133_RST <= '0';
		end if;
	end process XL_TX_CLK_161M133_RST_REGISTER_proc;

	TX7 : component IEEE802_3_XL_PCS_AM_INSERTER
		port map(
			CLK_I              => XL_TX_CLK_161M133_I,
			RST_I              => XL_TX_CLK_161M133_RST,
			TX_ENABLE_I        => TX_ENABLE_I,
			THROTTLE_REQUEST_O => THROTTLE_REQUEST,
			--BLOCKs_VALID_I     => BLOCKs_VALID_TX6,
			PCS_BLOCKs_I       => PCS_BLOCKs_TX6,
			PCS_BLOCKs_O       => PCS_BLOCKs_TX7
		);

	LANE0_TX_HEADER_O <= PCS_BLOCKs_TX7(0).H;
	LANE0_TX_DATA_O   <= PCS_BLOCKs_TX7(0).P;
	LANE1_TX_HEADER_O <= PCS_BLOCKs_TX7(1).H;
	LANE1_TX_DATA_O   <= PCS_BLOCKs_TX7(1).P;
	LANE2_TX_HEADER_O <= PCS_BLOCKs_TX7(2).H;
	LANE2_TX_DATA_O   <= PCS_BLOCKs_TX7(2).P;
	LANE3_TX_HEADER_O <= PCS_BLOCKs_TX7(3).H;
	LANE3_TX_DATA_O   <= PCS_BLOCKs_TX7(3).P;

	-- ########~~~PCS RECEIVER~~~########

	BLOCK_VALID_RX0 <= (
			0 => LANE0_RX_DATA_VALID_I,
			1 => LANE1_RX_DATA_VALID_I,
			2 => LANE2_RX_DATA_VALID_I,
			3 => LANE3_RX_DATA_VALID_I
		);

	PCS_BLOCKs_RX0 <= (
			0 => (H => LANE0_RX_HEADER_I, P => LANE0_RX_DATA_I),
			1 => (H => LANE1_RX_HEADER_I, P => LANE1_RX_DATA_I),
			2 => (H => LANE2_RX_HEADER_I, P => LANE2_RX_DATA_I),
			3 => (H => LANE3_RX_HEADER_I, P => LANE3_RX_DATA_I)
		);

	RX1 : component PCS_BLOCKs_REALIGN
		port map(
			CLK_I          => XL_RX_CLK_161M133_I,
			BLOCK_LOCK_I   => BLOCK_LOCK_RX1,
			BLOCK_VALID_I  => BLOCK_VALID_RX0,
			PCS_BLOCKs_I   => PCS_BLOCKs_RX0,
			BLOCKs_VALID_O => BLOCKs_VALID_RX1,
			PCS_BLOCKs_O   => PCS_BLOCKs_RX1
		);

	HEADER_VALID_RX0 <= (
			0 => LANE0_RX_HEADER_VALID_I,
			1 => LANE1_RX_HEADER_VALID_I,
			2 => LANE2_RX_HEADER_VALID_I,
			3 => LANE3_RX_HEADER_VALID_I
		);

	lanes_RX1 : for i in 0 to 3 generate
	begin
		RX1_ctrl : component IEEE802_3_XL_PCS_BLOCK_LOCK
			port map(
				CLK_I          => XL_RX_CLK_161M133_I,
				RST_I          => XL_RX_CLK_RST_I,
				HEADER_VALID_I => HEADER_VALID_RX0(i),
				HEADER_I       => PCS_BLOCKs_RX0(i).H,
				SLIP_O         => SLIP_RX1(i),
				BLOCK_LOCK_O   => BLOCK_LOCK_RX1(i)
			);
	end generate lanes_RX1;

	LANE0_RX_GEARBOXSLIP_O <= SLIP_RX1(0);
	LANE1_RX_GEARBOXSLIP_O <= SLIP_RX1(1);
	LANE2_RX_GEARBOXSLIP_O <= SLIP_RX1(2);
	LANE3_RX_GEARBOXSLIP_O <= SLIP_RX1(3);

	RX2 : component PCS_BLOCKs_FIFO
		port map(
			RST_I          => XL_RX_CLK_RST_I,
			WR_CLK_I       => XL_RX_CLK_161M133_I,
			PCS_BLOCKs_I   => PCS_BLOCKs_RX1,
			BLOCKS_VALID_I => BLOCKS_VALID_RX1,
			RD_CLK_I       => XL_RX_CLK_156M25_I,
			RD_EN_I        => RX_FIFO_RD_EN,
			PCS_BLOCKs_O   => PCS_BLOCKs_RX2,
			BLOCKs_VALID_O => open,
			FULL           => open,
			EMPTY          => RX_FIFO_EMPTY
		);

	RX_FIFO_EMPTY_SR(0) <= RX_FIFO_EMPTY;

	RX_FIFO_RD_EN <= (not RX_FIFO_PAUSE);

	RX_FIFO_CTRL_proc : process(XL_RX_CLK_RST_I, XL_RX_CLK_156M25_I) is
	begin
		if XL_RX_CLK_RST_I = '1' then
			RX_FIFO_EMPTY_SR(2 downto 1) <= (others => '1');
			RX_FIFO_PAUSE                <= '1';
		else
			if rising_edge(XL_RX_CLK_156M25_I) then
				RX_FIFO_EMPTY_SR(2 downto 1) <= RX_FIFO_EMPTY_SR(1 downto 0);
				if (RX_FIFO_EMPTY_SR = "000") then
					RX_FIFO_PAUSE <= '0';
				else
					RX_FIFO_PAUSE <= '1';
				end if;
			end if;
		end if;
	end process RX_FIFO_CTRL_proc;

	BLOCK_LOCK_CROSS_CLOCK_proc : process(XL_RX_CLK_RST_I, XL_RX_CLK_156M25_I) is
	begin
		if XL_RX_CLK_RST_I = '1' then
			BLOCK_LOCK_RX1_SR <= (others => (others => '0'));
		else
			if rising_edge(XL_RX_CLK_156M25_I) then
				BLOCK_LOCK_RX1_SR(0)          <= BLOCK_LOCK_RX1;
				BLOCK_LOCK_RX1_SR(3 downto 1) <= BLOCK_LOCK_RX1_SR(2 downto 0);
			end if;
		end if;
	end process BLOCK_LOCK_CROSS_CLOCK_proc;

	RX3 : component IEEE802_3_XL_PCS_AM_LOCK
		port map(
			CLK_I        => XL_RX_CLK_156M25_I,
			RST_I        => XL_RX_CLK_RST_I,
			BLOCK_LOCK_I => BLOCK_LOCK_RX1_SR(3),
			PCS_BLOCKs_I => PCS_BLOCKs_RX2,
			PCS_BLOCKs_O => PCS_BLOCKs_RX3,
			AM_VALID_O   => AM_VALID_RX3,
			AM_LOCK_O    => AM_LOCK_RX3,
			LANE_MAP_O   => LANE_MAP_RX3
		);

	AM_STATUS_REGISTER_proc : process(XL_RX_CLK_156M25_I, XL_RX_CLK_RST_I) is
	begin
		if XL_RX_CLK_RST_I = '1' then
			AM_STATUS_RX3 <= '0';
		elsif rising_edge(XL_RX_CLK_156M25_I) then
			AM_STATUS_RX3 <= AM_LOCK_RX3(3) and AM_LOCK_RX3(2) and AM_LOCK_RX3(1) and AM_LOCK_RX3(0);
		end if;
	end process AM_STATUS_REGISTER_proc;

	RX4 : component IEEE802_3_XL_PCS_LANE_DESKEW
		port map(
			CLK_I          => XL_RX_CLK_156M25_I,
			AM_STATUS_I    => AM_STATUS_RX3,
			PCS_BLOCKs_I   => PCS_BLOCKs_RX3,
			AM_VALID_I     => AM_VALID_RX3,
			PCS_BLOCKs_O   => PCS_BLOCKs_RX4,
			AM_VALID_O     => AM_VALID_RX4,
			ALIGN_STATUS_O => ALIGN_STATUS_RX4
		);

	lanes : for i in 0 to 3 generate
	begin
		lane_en(i) <= LANE_MAP_RX3(3)(i) & LANE_MAP_RX3(2)(i) & LANE_MAP_RX3(1)(i) & LANE_MAP_RX3(0)(i);

		RX5 : component IEEE802_3_XL_PCS_LANE_REORDER
			port map(
				PCS_BLOCKs_I => PCS_BLOCKs_RX4,
				PCS_BLOCK_O  => PCS_BLOCKs_RX5(i),
				LANE_EN_I    => lane_en(i)
			);

	end generate lanes;

	RX6 : component IEEE802_3_XL_PCS_AM_REMOVER
		port map(
			CLK_I          => XL_RX_CLK_156M25_I,
			ALIGN_STATUS_I => ALIGN_STATUS_RX4,
			PCS_BLOCKs_I   => PCS_BLOCKs_RX5,
			AM_VALID_I     => AM_VALID_RX4,
			BLOCKs_VALID_O => BLOCKs_VALID_RX6,
			PCS_BLOCKs_O   => PCS_BLOCKs_RX6,
			BIP_ERROR_O    => BIP_ERROR_RX6
		);

	RX7 : component PCS_DATA_FREQUENCY_MULTIPLIER
		port map(
			CLK_I          => XL_RX_CLK_156M25_I,
			CLK_MULT_I     => XL_RX_CLK_625M_I,
			BLOCKs_VALID_I => BLOCKs_VALID_RX6,
			PCS_BLOCKs_I   => PCS_BLOCKs_RX6,
			BLOCK_VALID_O  => BLOCK_VALID_RX7,
			PCS_BLOCKs_O   => PCS_BLOCKs_RX7
		);

	RX8 : component IEEE802_3_XL_PCS_BLK_MERGE
		port map(
			CLK_I         => XL_RX_CLK_625M_I,
			BLOCK_VALID_I => BLOCK_VALID_RX7,
			PCS_BLOCKs_I  => PCS_BLOCKs_RX7,
			BLOCK_VALID_O => BLOCK_VALID_RX8,
			PCS_BLOCK_O   => PCS_BLOCK_RX8
		);

	RX9 : component IEEE802_3_XL_PCS_DESCRAMBLER
		port map(
			CLK_I         => XL_RX_CLK_625M_I,
			RST_I         => XL_RX_CLK_RST_I,
			PCS_BLOCK_I   => PCS_BLOCK_RX8,
			BLOCK_VALID_I => BLOCK_VALID_RX8,
			PCS_BLOCK_O   => PCS_BLOCK_RX9,
			BLOCK_VALID_O => BLOCK_VALID_RX9
		);

	RX10 : component PCS_IDLE_BLOCK_FILTER
		port map(
			CLK_I         => XL_RX_CLK_625M_I,
			RST_I         => XL_RX_CLK_RST_I,
			PCS_BLOCK_I   => PCS_BLOCK_RX9,
			BLOCK_VALID_I => BLOCK_VALID_RX9,
			PCS_BLOCK_O   => PCS_BLOCK_RX10,
			BLOCK_VALID_O => open,
			BLOCK_IDLE_O  => BLOCK_IDLE_RX10
		);

	TEST_PATTERN_ERROR_QUAD_proc : process(XL_RX_CLK_625M_I) is
	begin
		if rising_edge(XL_RX_CLK_625M_I) then
			if XL_RX_CLK_RST_I = '1' then
				TEST_PATTERN_ERROR_QUAD <= (others => '0');
			else
				TEST_PATTERN_ERROR_QUAD(0)          <= not BLOCK_IDLE_RX10;
				TEST_PATTERN_ERROR_QUAD(3 downto 1) <= TEST_PATTERN_ERROR_QUAD(2 downto 0);
			end if;
		end if;
	end process TEST_PATTERN_ERROR_QUAD_proc;

	RX11 : component IEEE802_3_XL_PCS_DECODER
		port map(
			CLK_I                      => XL_RX_CLK_625M_I,
			RST_I                      => XL_RX_CLK_RST_I,
			PCS_BLOCK_I                => PCS_BLOCK_RX10,
			BLOCK_IDLE_I               => BLOCK_IDLE_RX10,
			XLGMII_RX_O                => XLGMII_RX_O,
			FRAME_START_DETECTED_O     => DECODER_START_DETECTED,
			FRAME_TERMINATE_DETECTED_O => DECODER_TERMINATE_DETECTED
		);

	STATUS_SIGNAL_CROSS_CLOCK_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if SYS_RST_I = '1' then
				BLOCK_LOCK_SR                 <= (others => (others => '0'));
				AM_LOCK_SR                    <= (others => (others => '0'));
				ALIGN_STATUS_SR               <= (others => '0');
				BIP_ERROR_SR                  <= (others => '0');
				TEST_PATTERN_ERROR_QUAD_SR    <= (others => (others => '0'));
				ENCODER_START_DETECTED_SR     <= (others => '0');
				ENCODER_TERMINATE_DETECTED_SR <= (others => '0');
				DECODER_START_DETECTED_SR     <= (others => '0');
				DECODER_TERMINATE_DETECTED_SR <= (others => '0');
			else
				BLOCK_LOCK_SR(0)                          <= BLOCK_LOCK_RX1_SR(3);
				BLOCK_LOCK_SR(3 downto 1)                 <= BLOCK_LOCK_SR(2 downto 0);
				AM_LOCK_SR(0)                             <= AM_LOCK_RX3;
				AM_LOCK_SR(3 downto 1)                    <= AM_LOCK_SR(2 downto 0);
				ALIGN_STATUS_SR(0)                        <= ALIGN_STATUS_RX4;
				ALIGN_STATUS_SR(3 downto 1)               <= ALIGN_STATUS_SR(2 downto 0);
				BIP_ERROR_SR(0)                           <= BIP_ERROR_RX6;
				BIP_ERROR_SR(3 downto 1)                  <= BIP_ERROR_SR(2 downto 0);
				TEST_PATTERN_ERROR_QUAD_SR(0)             <= TEST_PATTERN_ERROR_QUAD;
				TEST_PATTERN_ERROR_QUAD_SR(3 downto 1)    <= TEST_PATTERN_ERROR_QUAD_SR(2 downto 0);
				ENCODER_START_DETECTED_SR(0)              <= ENCODER_START_DETECTED;
				ENCODER_START_DETECTED_SR(3 downto 1)     <= ENCODER_START_DETECTED_SR(2 downto 0);
				ENCODER_TERMINATE_DETECTED_SR(0)          <= ENCODER_TERMINATE_DETECTED;
				ENCODER_TERMINATE_DETECTED_SR(3 downto 1) <= ENCODER_TERMINATE_DETECTED_SR(2 downto 0);
				DECODER_START_DETECTED_SR(0)              <= DECODER_START_DETECTED;
				DECODER_START_DETECTED_SR(3 downto 1)     <= DECODER_START_DETECTED_SR(2 downto 0);
				DECODER_TERMINATE_DETECTED_SR(0)          <= DECODER_TERMINATE_DETECTED;
				DECODER_TERMINATE_DETECTED_SR(3 downto 1) <= DECODER_TERMINATE_DETECTED_SR(2 downto 0);
			end if;
		end if;
	end process STATUS_SIGNAL_CROSS_CLOCK_proc;

	BLOCK_LOCK_O              <= BLOCK_LOCK_SR(3);
	AM_LOCK_O                 <= AM_LOCK_SR(3);
	ALIGN_STATUS_O            <= ALIGN_STATUS_SR(3);
	BIP_ERROR_O               <= BIP_ERROR_SR(3);
	TEST_PATTERN_ERROR_QUAD_O <= TEST_PATTERN_ERROR_QUAD_SR(3);

	ENC_DEC_COUNT_RST_d1_proc : process(SYS_CLK_I, SYS_RST_I) is
	begin
		if SYS_RST_I = '1' then
			ENC_DEC_COUNT_RST_d1 <= '1';
		elsif rising_edge(SYS_CLK_I) then
			ENC_DEC_COUNT_RST_d1 <= ENC_DEC_COUNT_RST_I;
		end if;
	end process ENC_DEC_COUNT_RST_d1_proc;

	START_TERM_COUNT_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if (ENC_DEC_COUNT_RST_d1 = '1') then
				ENCODER_START_COUNT_INC     <= '0';
				ENCODER_START_COUNT         <= (others => '0');
				ENCODER_TERMINATE_COUNT_INC <= '0';
				ENCODER_TERMINATE_COUNT     <= (others => '0');
				DECODER_START_COUNT_INC     <= '0';
				DECODER_START_COUNT         <= (others => '0');
				DECODER_TERMINATE_COUNT_INC <= '0';
				DECODER_TERMINATE_COUNT     <= (others => '0');
			else
				ENCODER_START_COUNT_INC <= (ENCODER_START_DETECTED_SR(3) xor ENCODER_START_DETECTED_SR(2));
				if (ENCODER_START_COUNT_INC = '1') then
					ENCODER_START_COUNT <= ENCODER_START_COUNT + 1;
				end if;
				ENCODER_TERMINATE_COUNT_INC <= (ENCODER_TERMINATE_DETECTED_SR(3) xor ENCODER_TERMINATE_DETECTED_SR(2));
				if (ENCODER_TERMINATE_COUNT_INC = '1') then
					ENCODER_TERMINATE_COUNT <= ENCODER_TERMINATE_COUNT + 1;
				end if;
				DECODER_START_COUNT_INC <= (DECODER_START_DETECTED_SR(3) xor DECODER_START_DETECTED_SR(2));
				if (DECODER_START_COUNT_INC = '1') then
					DECODER_START_COUNT <= DECODER_START_COUNT + 1;
				end if;
				DECODER_TERMINATE_COUNT_INC <= (DECODER_TERMINATE_DETECTED_SR(3) xor DECODER_TERMINATE_DETECTED_SR(2));
				if (DECODER_TERMINATE_COUNT_INC = '1') then
					DECODER_TERMINATE_COUNT <= DECODER_TERMINATE_COUNT + 1;
				end if;
			end if;
		end if;
	end process START_TERM_COUNT_proc;

	ENCODER_START_DETECTED_COUNT_O     <= std_logic_vector(ENCODER_START_COUNT);
	ENCODER_TERMINATE_DETECTED_COUNT_O <= std_logic_vector(ENCODER_TERMINATE_COUNT);
	DECODER_START_DETECTED_COUNT_O     <= std_logic_vector(DECODER_START_COUNT);
	DECODER_TERMINATE_DETECTED_COUNT_O <= std_logic_vector(DECODER_TERMINATE_COUNT);

end Behavioral;
