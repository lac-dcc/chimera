----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 30.09.2014 16:04:44
-- Design Name: 
-- Module Name: PCS_DATA_FREQUENCY_DIVIDER - Behavioral
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

use work.IEEE802_3_XL_PKG.all;

entity PCS_DATA_FREQUENCY_DIVIDER is
	Port(
		CLK_I          : in  std_logic;
		CLK_DIV_I      : in  std_logic;

		BLOCK_VALID_I  : in  NIBBLE_t;
		PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
		BLOCKs_VALID_O : out std_logic;
		PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0)
	);
end PCS_DATA_FREQUENCY_DIVIDER;

architecture Behavioral of PCS_DATA_FREQUENCY_DIVIDER is
	component DUAL_CLOCK_STROBE_GENERATOR is
		Port(
			CLK_SLOW_I : in  STD_LOGIC;
			CLK_FAST_I : in  STD_LOGIC;
			STROBE_O   : out STD_LOGIC
		);
	end component DUAL_CLOCK_STROBE_GENERATOR;

	component DATA_FREQUENCY_DIVIDER is
		Generic(
			DATA_WIDTH : integer := 64
		);
		Port(
			CLK_I        : in  std_logic;
			CLK_DIV_I    : in  std_logic;
			STROBE_I     : in  std_logic;

			DATA_VALID_I : in  std_logic;
			DATA_I       : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
			DATA_VALID_O : out std_logic;
			DATA_O       : out std_logic_vector(DATA_WIDTH - 1 downto 0)
		);
	end component DATA_FREQUENCY_DIVIDER;

	signal wr_data0     : std_logic_vector(65 downto 0);
	signal rd_data0     : std_logic_vector(65 downto 0);
	signal block_valid0 : std_logic;

	signal wr_data1     : std_logic_vector(65 downto 0);
	signal rd_data1     : std_logic_vector(65 downto 0);
	signal block_valid1 : std_logic;

	signal wr_data2     : std_logic_vector(65 downto 0);
	signal rd_data2     : std_logic_vector(65 downto 0);
	signal block_valid2 : std_logic;

	signal wr_data3     : std_logic_vector(65 downto 0);
	signal rd_data3     : std_logic_vector(65 downto 0);
	signal block_valid3 : std_logic;

	signal strobe : std_logic;

begin
	wr_data0 <= PCS_BLOCKs_I(0).P & PCS_BLOCKs_I(0).H;
	wr_data1 <= PCS_BLOCKs_I(1).P & PCS_BLOCKs_I(1).H;
	wr_data2 <= PCS_BLOCKs_I(2).P & PCS_BLOCKs_I(2).H;
	wr_data3 <= PCS_BLOCKs_I(3).P & PCS_BLOCKs_I(3).H;

	PCS_BLOCKs_O <= (
			0 => (H => rd_data0(1 downto 0), P => rd_data0(65 downto 2)),
			1 => (H => rd_data1(1 downto 0), P => rd_data1(65 downto 2)),
			2 => (H => rd_data2(1 downto 0), P => rd_data2(65 downto 2)),
			3 => (H => rd_data3(1 downto 0), P => rd_data3(65 downto 2))
		);

	BLOCKs_VALID_O <= block_valid0 and block_valid1 and block_valid2 and block_valid3;

	DUAL_CLK_STROBE_inst : component DUAL_CLOCK_STROBE_GENERATOR
		port map(
			CLK_SLOW_I => CLK_DIV_I,
			CLK_FAST_I => CLK_I,
			STROBE_O   => strobe
		);

	FREQ_DIV_inst0 : component DATA_FREQUENCY_DIVIDER
		generic map(
			DATA_WIDTH => 66
		)
		port map(
			CLK_I        => CLK_I,
			CLK_DIV_I    => CLK_DIV_I,
			STROBE_I     => strobe,
			DATA_VALID_I => BLOCK_VALID_I(0),
			DATA_I       => wr_data0,
			DATA_VALID_O => block_valid0,
			DATA_O       => rd_data0
		);

	FREQ_DIV_inst1 : component DATA_FREQUENCY_DIVIDER
		generic map(
			DATA_WIDTH => 66
		)
		port map(
			CLK_I        => CLK_I,
			CLK_DIV_I    => CLK_DIV_I,
			STROBE_I     => strobe,
			DATA_VALID_I => BLOCK_VALID_I(1),
			DATA_I       => wr_data1,
			DATA_VALID_O => block_valid1,
			DATA_O       => rd_data1
		);

	FREQ_DIV_inst2 : component DATA_FREQUENCY_DIVIDER
		generic map(
			DATA_WIDTH => 66
		)
		port map(
			CLK_I        => CLK_I,
			CLK_DIV_I    => CLK_DIV_I,
			STROBE_I     => strobe,
			DATA_VALID_I => BLOCK_VALID_I(2),
			DATA_I       => wr_data2,
			DATA_VALID_O => block_valid2,
			DATA_O       => rd_data2
		);

	FREQ_DIV_inst3 : component DATA_FREQUENCY_DIVIDER
		generic map(
			DATA_WIDTH => 66
		)
		port map(
			CLK_I        => CLK_I,
			CLK_DIV_I    => CLK_DIV_I,
			STROBE_I     => strobe,
			DATA_VALID_I => BLOCK_VALID_I(3),
			DATA_I       => wr_data3,
			DATA_VALID_O => block_valid3,
			DATA_O       => rd_data3
		);

end Behavioral;