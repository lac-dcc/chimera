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

entity IEEE802_3_XL_PHY_top is
	Port(
		SYS_CLK_I            : in  std_logic;
		SYS_CLK_RST_I        : in  std_logic;

		GTREFCLK_PAD_N_I     : in  std_logic;
		GTREFCLK_PAD_P_I     : in  std_logic;

		GTREFCLK_O           : out std_logic;

		TXN_O                : out std_logic_vector(3 downto 0);
		TXP_O                : out std_logic_vector(3 downto 0);
		RXN_I                : in  std_logic_vector(3 downto 0);
		RXP_I                : in  std_logic_vector(3 downto 0);

		SOFT_RESET_I         : in  std_logic;

		LINK_UP_O            : out std_logic;

		-- XLGMII INPUT Interface
		-- Transmitter Interface
		XLGMII_X4_TXC_I      : in  std_logic_vector(31 downto 0);
		XLGMII_X4_TXD_I      : in  std_logic_vector(255 downto 0);

		-- XLGMII Output Interface
		-- Receiver Interface
		XLGMII_X4_RXC_O      : out std_logic_vector(31 downto 0);
		XLGMII_X4_RXD_O      : out std_logic_vector(255 downto 0);

		TEST_PATTERN_EN_I    : in  std_logic;
		TEST_PATTERN_ERROR_O : out std_logic
	);
end IEEE802_3_XL_PHY_top;

architecture Behavioral of IEEE802_3_XL_PHY_top is
	
	attribute ASYNC_REG : string;
	signal TX_READ_EN : std_logic;

	signal GT_TX_READY : std_logic_vector(3 downto 0);
	signal GT_RX_READY : std_logic_vector(3 downto 0);

	-- XLGMII INPUT Interface
	-- Transmitter Interface
	signal XLGMII_X4_TX : XLGMII_ARRAY_t(3 downto 0);

	-- XLGMII Output Interface
	-- Receiver Interface
	signal XLGMII_X4_RX : XLGMII_ARRAY_t(3 downto 0);

	signal block_lock   : std_logic_vector(3 downto 0);
	signal am_lock      : std_logic_vector(3 downto 0);
	signal align_status : std_logic;

	signal link_up_check1 : std_logic;
	signal link_up_check2 : std_logic;
	signal link_up_check3 : std_logic;

	signal test_pattern_error_count    : std_logic_vector(15 downto 0);
	signal test_pattern_error_count_d1 : std_logic_vector(15 downto 0);
	--signal sSoftRstD1 : std_logic;
	--signal sSoftRstD2 : std_logic;
	--attribute ASYNC_REG of sSoftRstD1 : signal is "TRUE";
	--attribute ASYNC_REG of sSoftRstD2 : signal is "TRUE"; 	

begin

-----------------------------------------------------------------------------------
-- CDC Synchronisation
-----------------------------------------------------------------------------------

	--pCDCSoftRstSynchroniser : process(SYS_CLK_I)
	--begin
	--if (rising_edge(SYS_CLK_I))then
	--  sSoftRstD2 <= sSoftRstD1;
	--  sSoftRstD1 <= SOFT_RESET_I;
	--end if;
	--end process pCDCSoftRstSynchroniser; 



	PHY_inst : component IEEE802_3_XL_PHY
		generic map(
			TX_POLARITY_INVERT => "0001",
			USE_CHIPSCOPE      => 0
		)
		port map(
			SYS_CLK_I                  => SYS_CLK_I,
			SYS_CLK_RST_I              => SYS_CLK_RST_I,
			GTREFCLK_PAD_N_I           => GTREFCLK_PAD_N_I,
			GTREFCLK_PAD_P_I           => GTREFCLK_PAD_P_I,
			GTREFCLK_O                 => GTREFCLK_O,
			TXN_O                      => TXN_O,
			TXP_O                      => TXP_O,
			RXN_I                      => RXN_I,
			RXP_I                      => RXP_I,
			SOFT_RESET_I               => SOFT_RESET_I,
			GT_TX_READY_O              => GT_TX_READY,
			GT_RX_READY_O              => GT_RX_READY,
			XLGMII_X4_TX_I             => XLGMII_X4_TX,
			XLGMII_X4_RX_O             => XLGMII_X4_RX,
			BLOCK_LOCK_O               => block_lock,
			AM_LOCK_O                  => am_lock,
			ALIGN_STATUS_O             => align_status,
			TEST_PATTERN_EN_I          => TEST_PATTERN_EN_I,
			TEST_PATTERN_ERROR_COUNT_O => test_pattern_error_count
		);

	XLGMII_X4_TX(0).C <= XLGMII_X4_TXC_I(7 downto 0);
	XLGMII_X4_TX(1).C <= XLGMII_X4_TXC_I(15 downto 8);
	XLGMII_X4_TX(2).C <= XLGMII_X4_TXC_I(23 downto 16);
	XLGMII_X4_TX(3).C <= XLGMII_X4_TXC_I(31 downto 24);

	XLGMII_X4_TX(0).D <= XLGMII_X4_TXD_I(63 downto 0);
	XLGMII_X4_TX(1).D <= XLGMII_X4_TXD_I(127 downto 64);
	XLGMII_X4_TX(2).D <= XLGMII_X4_TXD_I(191 downto 128);
	XLGMII_X4_TX(3).D <= XLGMII_X4_TXD_I(255 downto 192);

	XLGMII_X4_RXC_O(7 downto 0)   <= XLGMII_X4_RX(0).C;
	XLGMII_X4_RXC_O(15 downto 8)  <= XLGMII_X4_RX(1).C;
	XLGMII_X4_RXC_O(23 downto 16) <= XLGMII_X4_RX(2).C;
	XLGMII_X4_RXC_O(31 downto 24) <= XLGMII_X4_RX(3).C;

	XLGMII_X4_RXD_O(63 downto 0)    <= XLGMII_X4_RX(0).D;
	XLGMII_X4_RXD_O(127 downto 64)  <= XLGMII_X4_RX(1).D;
	XLGMII_X4_RXD_O(191 downto 128) <= XLGMII_X4_RX(2).D;
	XLGMII_X4_RXD_O(255 downto 192) <= XLGMII_X4_RX(3).D;

	TEST_PATTERN_ERROR_DETECT_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			test_pattern_error_count_d1 <= test_pattern_error_count;
			if SYS_CLK_RST_I = '1' then
				TEST_PATTERN_ERROR_O <= '0';
			else
				if (test_pattern_error_count /= test_pattern_error_count_d1) then
					TEST_PATTERN_ERROR_O <= '1';
				else
					TEST_PATTERN_ERROR_O <= '0';
				end if;
			end if;
		end if;
	end process TEST_PATTERN_ERROR_DETECT_proc;

	LINK_UP_DETECT_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if SYS_CLK_RST_I = '1' then
				link_up_check1 <= '0';
				link_up_check2 <= '0';
				link_up_check3 <= '0';
				LINK_UP_O      <= '0';
			else
				if ((GT_TX_READY = "1111") and (GT_RX_READY = "1111")) then
					link_up_check1 <= '1';
				else
					link_up_check1 <= '0';
				end if;

				if (block_lock = "1111") then
					link_up_check2 <= '1';
				else
					link_up_check3 <= '0';
				end if;

				if (am_lock = "1111") then
					link_up_check3 <= '1';
				else
					link_up_check3 <= '0';
				end if;

				if ((link_up_check1 and link_up_check2 and link_up_check3) = '1') then
					LINK_UP_O <= align_status;
				else
					LINK_UP_O <= '0';
				end if;
			end if;
		end if;
	end process LINK_UP_DETECT_proc;

end Behavioral;
