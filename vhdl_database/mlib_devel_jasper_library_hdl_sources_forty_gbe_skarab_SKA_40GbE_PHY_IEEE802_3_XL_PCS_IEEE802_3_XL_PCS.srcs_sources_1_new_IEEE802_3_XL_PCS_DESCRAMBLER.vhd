----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 04.08.2014 15:08:50
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_DESCRAMBLER - Behavioral
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

entity IEEE802_3_XL_PCS_DESCRAMBLER is
	Port(
		CLK_I         : in  std_logic;
		RST_I         : in  std_logic;

		PCS_BLOCK_I   : in  BLOCK_t;
		BLOCK_VALID_I : in  std_logic;
		PCS_BLOCK_O   : out BLOCK_t;
		BLOCK_VALID_O : out std_logic
	);
end IEEE802_3_XL_PCS_DESCRAMBLER;

architecture Behavioral of IEEE802_3_XL_PCS_DESCRAMBLER is
	signal pcs_block   : BLOCK_t;
	signal block_valid : std_logic;

	signal pcs_block_d1 : BLOCK_t;

	signal descrambler        : std_logic_vector(57 downto 0) := "0101010101010101010101010101010101010101010101010101010101";
	signal poly               : std_logic_vector(57 downto 0);
	signal tempdata           : std_logic_vector(63 downto 0);
	signal unscrambled_data_i : std_logic_vector(63 downto 0);

begin
	pcs_block <= PCS_BLOCK_I;

	process(descrambler, pcs_block.P)
		variable poly_i     : std_logic_vector(57 downto 0);
		variable tempData_i : std_logic_vector(63 downto 0);
		variable xorBit     : std_logic;
		variable i          : std_logic;
	begin
		poly_i := descrambler;
		for i in 0 to 63 loop
			xorBit        := pcs_block.P(i) xor poly_i(38) xor poly_i(57);
			poly_i        := (poly_i(56 downto 0) & pcs_block.P(i));
			tempData_i(i) := xorBit;
		end loop;
		poly     <= poly_i;
		tempdata <= tempdata_i;
	end process;

	name : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (BLOCK_VALID_I = '1') then
				descrambler    <= poly;
				pcs_block_d1.P <= tempdata;
				pcs_block_d1.H <= pcs_block.H;
				block_valid    <= '1';
			else
				descrambler  <= descrambler;
				pcs_block_d1 <= pcs_block_d1;
				block_valid  <= '0';
			end if;
		end if;
	end process name;

	PCS_BLOCK_O   <= pcs_block_d1;
	BLOCK_VALID_O <= block_valid;

end Behavioral;
