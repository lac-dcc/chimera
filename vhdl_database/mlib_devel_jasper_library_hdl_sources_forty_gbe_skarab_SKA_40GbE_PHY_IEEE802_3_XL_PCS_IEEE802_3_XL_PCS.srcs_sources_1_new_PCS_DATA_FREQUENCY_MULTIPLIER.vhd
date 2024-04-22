----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 06.10.2014 14:02:13
-- Design Name: 
-- Module Name: PCS_DATA_FREQUENCY_MULTIPLIER - Behavioral
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

entity PCS_DATA_FREQUENCY_MULTIPLIER is
	Port(
		CLK_I          : in  std_logic;
		CLK_MULT_I     : in  std_logic;

		BLOCKs_VALID_I : in  std_logic;
		PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
		BLOCK_VALID_O  : out NIBBLE_t;
		PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0)
	);
end PCS_DATA_FREQUENCY_MULTIPLIER;

architecture Behavioral of PCS_DATA_FREQUENCY_MULTIPLIER is
	component DUAL_CLOCK_STROBE_GENERATOR is
		Port(
			CLK_SLOW_I : in  STD_LOGIC;
			CLK_FAST_I : in  STD_LOGIC;
			STROBE_O   : out STD_LOGIC
		);
	end component DUAL_CLOCK_STROBE_GENERATOR;

	component DATA_FREQUENCY_MULTIPLIER is
		Generic(
			DATA_WIDTH : integer := 64
		);
		Port(
			CLK_I        : in  std_logic;
			CLK_MULT_I   : in  std_logic;
			STROBE_I     : in  std_logic;

			DATA_VALID_I : in  std_logic;
			DATA_I       : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
			DATA_VALID_O : out std_logic;
			DATA_O       : out std_logic_vector(DATA_WIDTH - 1 downto 0)
		);
	end component DATA_FREQUENCY_MULTIPLIER;

	signal wr_data0 : std_logic_vector(65 downto 0);
	signal rd_data0 : std_logic_vector(65 downto 0);

	signal wr_data1 : std_logic_vector(65 downto 0);
	signal rd_data1 : std_logic_vector(65 downto 0);

	signal wr_data2 : std_logic_vector(65 downto 0);
	signal rd_data2 : std_logic_vector(65 downto 0);

	signal wr_data3 : std_logic_vector(65 downto 0);
	signal rd_data3 : std_logic_vector(65 downto 0);

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

	DUAL_CLK_STROBE_inst : component DUAL_CLOCK_STROBE_GENERATOR
		port map(
			CLK_SLOW_I => CLK_I,
			CLK_FAST_I => CLK_MULT_I,
			STROBE_O   => strobe
		);

	FREQ_MULT_inst0 : component DATA_FREQUENCY_MULTIPLIER
		generic map(
			DATA_WIDTH => 66
		)
		port map(
			CLK_I        => CLK_I,
			CLK_MULT_I   => CLK_MULT_I,
			STROBE_I     => strobe,
			DATA_VALID_I => BLOCKs_VALID_I,
			DATA_I       => wr_data0,
			DATA_VALID_O => BLOCK_VALID_O(0),
			DATA_O       => rd_data0
		);

	FREQ_MULT_inst1 : component DATA_FREQUENCY_MULTIPLIER
		generic map(
			DATA_WIDTH => 66
		)
		port map(
			CLK_I        => CLK_I,
			CLK_MULT_I   => CLK_MULT_I,
			STROBE_I     => strobe,
			DATA_VALID_I => BLOCKs_VALID_I,
			DATA_I       => wr_data1,
			DATA_VALID_O => BLOCK_VALID_O(1),
			DATA_O       => rd_data1
		);

	FREQ_MULT_inst2 : component DATA_FREQUENCY_MULTIPLIER
		generic map(
			DATA_WIDTH => 66
		)
		port map(
			CLK_I        => CLK_I,
			CLK_MULT_I   => CLK_MULT_I,
			STROBE_I     => strobe,
			DATA_VALID_I => BLOCKs_VALID_I,
			DATA_I       => wr_data2,
			DATA_VALID_O => BLOCK_VALID_O(2),
			DATA_O       => rd_data2
		);

	FREQ_MULT_inst3 : component DATA_FREQUENCY_MULTIPLIER
		generic map(
			DATA_WIDTH => 66
		)
		port map(
			CLK_I        => CLK_I,
			CLK_MULT_I   => CLK_MULT_I,
			STROBE_I     => strobe,
			DATA_VALID_I => BLOCKs_VALID_I,
			DATA_I       => wr_data3,
			DATA_VALID_O => BLOCK_VALID_O(3),
			DATA_O       => rd_data3
		);

end Behavioral;
