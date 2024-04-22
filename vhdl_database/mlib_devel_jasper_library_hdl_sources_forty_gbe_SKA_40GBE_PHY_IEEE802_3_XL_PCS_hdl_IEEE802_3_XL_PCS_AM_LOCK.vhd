----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 30.07.2014 15:24:59
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_AM_LOCK - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.IEEE802_3_XL_PKG.all;

entity IEEE802_3_XL_PCS_AM_LOCK is
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
end IEEE802_3_XL_PCS_AM_LOCK;

architecture Behavioral of IEEE802_3_XL_PCS_AM_LOCK is
	component IEEE802_3_XL_PCS_AM_LOCK_LANE is
		Generic(
			DEFAULT_LANE_MAP : NIBBLE_t := "0001"
		);
		Port(
			CLK_I        : in  std_logic;
			RST_I        : in  std_logic;

			BLOCK_LOCK_I : in  std_logic;

			PCS_BLOCK_I  : in  BLOCK_t;
			PCS_BLOCK_O  : out BLOCK_t;
			AM_VALID_O   : out std_logic;

			AM_LOCK_O    : out std_logic;
			LANE_MAP_O   : out NIBBLE_t
		);
	end component IEEE802_3_XL_PCS_AM_LOCK_LANE;

	constant LANE_MAPPING : NIBBLE_ARRAY_t := (
		0 => "0001",
		1 => "0010",
		2 => "0100",
		3 => "1000"
	);

begin
	lanes : for i in 0 to 3 generate
	begin
		inst : component IEEE802_3_XL_PCS_AM_LOCK_LANE
			generic map(
				DEFAULT_LANE_MAP => LANE_MAPPING(i)
			)
			port map(
				CLK_I        => CLK_I,
				RST_I        => RST_I,
				BLOCK_LOCK_I => BLOCK_LOCK_I(i),
				PCS_BLOCK_I  => PCS_BLOCKs_I(i),
				PCS_BLOCK_O  => PCS_BLOCKs_O(i),
				AM_VALID_O   => AM_VALID_O(i),
				AM_LOCK_O    => AM_LOCK_O(i),
				LANE_MAP_O   => LANE_MAP_O(i)
			);
	end generate lanes;

end Behavioral;
