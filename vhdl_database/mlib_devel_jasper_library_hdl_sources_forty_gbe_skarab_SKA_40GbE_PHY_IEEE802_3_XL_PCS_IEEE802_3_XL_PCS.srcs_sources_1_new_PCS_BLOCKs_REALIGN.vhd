----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 25.09.2014 09:08:30
-- Design Name: 
-- Module Name: PCS_BLOCKs_REALIGN - Behavioral
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

entity PCS_BLOCKs_REALIGN is
	Port(
		CLK_I          : in  std_logic;

		BLOCK_LOCK_I   : in  std_logic_vector(3 downto 0);

		BLOCK_VALID_I  : in  std_logic_vector(3 downto 0);
		PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
		BLOCKs_VALID_O : out std_logic;
		PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0)
	);
end PCS_BLOCKs_REALIGN;

architecture Behavioral of PCS_BLOCKs_REALIGN is
	signal lanes_not_locked : std_logic := '1';

	signal pcs_block_d1 : BLOCK_ARRAY_t(3 downto 0);

	signal buffer_empty : std_logic_vector(3 downto 0) := (others => '1');
	signal reset_buffer : std_logic;
begin
	LANE_LOCK_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			lanes_not_locked <= not (BLOCK_LOCK_I(0) and BLOCK_LOCK_I(1) and BLOCK_LOCK_I(2) and BLOCK_LOCK_I(3));
		end if;
	end process LANE_LOCK_REGISTER_proc;

	REGISTER_INPUT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			pcs_block_d1 <= PCS_BLOCKs_I;
		end if;
	end process REGISTER_INPUT_proc;

	RX_GEARBOX_OUT_LANES : for i in 0 to 3 generate
		buffer_proc : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				if (lanes_not_locked = '1') then
					buffer_empty(i) <= '1';
				else
					if (BLOCK_VALID_I(i) = '0') then
						buffer_empty(i) <= '1';
					elsif reset_buffer = '1' then
						buffer_empty(i) <= '0';
					else
						buffer_empty(i) <= buffer_empty(i);
					end if;
				end if;
			end if;
		end process buffer_proc;

		OUTPUT_SELECT_proc : process(buffer_empty(i), PCS_BLOCKs_I(i), pcs_block_d1(i)) is
		begin
			if (buffer_empty(i) = '1') then
				PCS_BLOCKs_O(i) <= PCS_BLOCKs_I(i);
			else
				PCS_BLOCKs_O(i) <= pcs_block_d1(i);
			end if;
		end process OUTPUT_SELECT_proc;

	end generate RX_GEARBOX_OUT_LANES;

	reset_buffer <= buffer_empty(0) and buffer_empty(1) and buffer_empty(2) and buffer_empty(3);

	BLOCKs_VALID_O <= not reset_buffer;

end Behavioral;
