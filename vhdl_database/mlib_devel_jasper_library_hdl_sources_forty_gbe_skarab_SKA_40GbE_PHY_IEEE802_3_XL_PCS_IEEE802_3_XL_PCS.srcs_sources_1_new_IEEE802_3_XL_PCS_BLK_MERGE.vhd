----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 05.08.2014 12:06:04
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_BLK_MERGE - Behavioral
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

entity IEEE802_3_XL_PCS_BLK_MERGE is
	Port(
		CLK_I         : in  std_logic;

		BLOCK_VALID_I : in  NIBBLE_t;
		PCS_BLOCKs_I  : in  BLOCK_ARRAY_t(3 downto 0);
		BLOCK_VALID_O : out std_logic;
		PCS_BLOCK_O   : out BLOCK_t
	);
end IEEE802_3_XL_PCS_BLK_MERGE;

architecture Behavioral of IEEE802_3_XL_PCS_BLK_MERGE is
	signal block_valid : NIBBLE_t                  := (others => '0');
	signal pcs_blocks  : BLOCK_ARRAY_t(3 downto 0) := (others => LBLOCK_T);

	-- Counter to point to lane (Round-Robin)
	signal lane_counter : unsigned(1 downto 0) := "00";

begin
	REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			block_valid(3) <= BLOCK_VALID_I(3);
			pcs_blocks(3)  <= PCS_BLOCKs_I(3);
		end if;
	end process REGISTER_proc;

	lanes : for i in 0 to 2 generate
	begin
		REGISTER_proc : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				if (BLOCK_VALID_I(i) = '1') then
					block_valid(i) <= BLOCK_VALID_I(i);
					pcs_blocks(i)  <= PCS_BLOCKs_I(i);
				else
					block_valid(i) <= block_valid(i + 1);
					pcs_blocks(i)  <= pcs_blocks(i + 1);
				end if;
			end if;
		end process REGISTER_proc;
	end generate lanes;

	BLOCK_VALID_O <= block_valid(0);
	PCS_BLOCK_O   <= pcs_blocks(0);
end Behavioral;
