----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 13.08.2014 13:19:42
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_LANE_REORDER - Behavioral
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

entity IEEE802_3_XL_PCS_LANE_REORDER is
	Port(
		PCS_BLOCKs_I : in  BLOCK_ARRAY_t(3 downto 0);
		PCS_BLOCK_O  : out BLOCK_t;

		LANE_EN_I    : in  NIBBLE_t
	);
end IEEE802_3_XL_PCS_LANE_REORDER;

architecture Behavioral of IEEE802_3_XL_PCS_LANE_REORDER is
	signal lane_sel : std_logic_vector(1 downto 0);
begin
	LANE_DECODE_PROC : process(LANE_EN_I) is
	begin
		case LANE_EN_I is
			when "0001" => lane_sel <= "00";
			when "0010" => lane_sel <= "01";
			when "0100" => lane_sel <= "10";
			when "1000" => lane_sel <= "11";
			when others => lane_sel <= "00";
		end case;

	end process LANE_DECODE_PROC;

	LANE_SELECT_PROC : process(lane_sel, PCS_BLOCKs_I) is
	begin
		case lane_sel is
			when "00"   => PCS_BLOCK_O <= PCS_BLOCKs_I(0);
			when "01"   => PCS_BLOCK_O <= PCS_BLOCKs_I(1);
			when "10"   => PCS_BLOCK_O <= PCS_BLOCKs_I(2);
			when "11"   => PCS_BLOCK_O <= PCS_BLOCKs_I(3);
			when others => PCS_BLOCK_O <= PCS_BLOCKs_I(0);
		end case;
	end process LANE_SELECT_PROC;

end Behavioral;
