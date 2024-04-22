----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 30.07.2014 10:47:44
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_BLK_DIST - Behavioral
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

entity IEEE802_3_XL_PCS_BLK_DIST is
	Port(
		CLK_I         : in  std_logic;
		RST_I         : in  std_logic;

		BLOCK_VALID_I : in  std_logic;
		PCS_BLOCK_I   : in  BLOCK_t;
		BLOCK_VALID_O : out NIBBLE_t;
		PCS_BLOCKs_O  : out BLOCK_ARRAY_t(3 downto 0)
	);
end IEEE802_3_XL_PCS_BLK_DIST;

architecture Behavioral of IEEE802_3_XL_PCS_BLK_DIST is
	-- Counter to point to lane (Round-Robin)
	signal lane_en_sr : unsigned(3 downto 0);

	signal pcs_block_valid_d1 : NIBBLE_t;
	signal pcs_block_d1       : BLOCK_t;

	signal lane_en_sr_d1 : unsigned(3 downto 0);

	signal pcs_block_valid_d2 : NIBBLE_t;
	signal pcs_blocks_d2      : BLOCK_ARRAY_t(3 downto 0);

begin
	SHIFT_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if RST_I = '1' then
				lane_en_sr <= "0001";
			elsif (BLOCK_VALID_I = '1') then
				lane_en_sr(0)          <= lane_en_sr(3);
				lane_en_sr(3 downto 1) <= lane_en_sr(2 downto 0);
			end if;
		end if;
	end process SHIFT_REGISTER_proc;

	INPUT_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			pcs_block_d1  <= PCS_BLOCK_I;
			lane_en_sr_d1 <= lane_en_sr;
		end if;
	end process INPUT_REGISTER_proc;

	lanes : for i in 0 to 3 generate
	begin
		ROUND_ROBIN_BLOCK_DISTRIBUTION_PROC : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				if RST_I = '1' then
					pcs_block_valid_d1(i) <= '0';
				else
					if (lane_en_sr(i) = '1') then
						pcs_block_valid_d1(i) <= BLOCK_VALID_I;
					end if;
				end if;

				if (lane_en_sr_d1(i) = '1') then
					pcs_blocks_d2(i) <= pcs_block_d1;
				end if;

				if (lane_en_sr_d1(0) = '1') then
					pcs_block_valid_d2(i) <= '0';
				elsif (lane_en_sr(0) = '1') then
					pcs_block_valid_d2(i) <= pcs_block_valid_d1(i);
				end if;

				--BLOCK_VALID_O(i) <= pcs_block_valid_d2(i);

				--if (pcs_block_valid_d2(i) = '1') then
				--	PCS_BLOCKs_O(i) <= pcs_blocks_d2(i);
				--end if;
			end if;
		end process ROUND_ROBIN_BLOCK_DISTRIBUTION_PROC;
	end generate lanes;
	
	BLOCK_VALID_O <= pcs_block_valid_d2;
	PCS_BLOCKs_O <= pcs_blocks_d2;

end Behavioral;
