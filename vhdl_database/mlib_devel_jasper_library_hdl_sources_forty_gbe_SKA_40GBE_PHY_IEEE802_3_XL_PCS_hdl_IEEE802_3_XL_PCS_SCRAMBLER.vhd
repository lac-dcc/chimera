----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 04.08.2014 12:10:41
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_SCRAMBLER - Behavioral
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

entity IEEE802_3_XL_PCS_SCRAMBLER is
	Port(
		CLK_I         : in  std_logic;
		RST_I         : in  std_logic;

		BLOCK_VALID_I : in  std_logic;
		PCS_BLOCK_I   : in  BLOCK_t;
		BLOCK_VALID_O : out std_logic;
		PCS_BLOCK_O   : out BLOCK_t
	);
end IEEE802_3_XL_PCS_SCRAMBLER;

architecture Behavioral of IEEE802_3_XL_PCS_SCRAMBLER is
	signal block_valid_d1 : std_logic := '0';
	signal pcs_block_d1   : BLOCK_t   := LBLOCK_T;

	signal block_valid_d2 : std_logic := '0';
	signal pcs_block_d2   : BLOCK_t   := LBLOCK_T;

	signal X : std_logic_vector(63 downto 0) := (others => '0');
	signal S : std_logic_vector(57 downto 0) := (others => '0');
	signal Y : std_logic_vector(63 downto 0) := (others => '0');
begin
	INPUT_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			pcs_block_d1 <= PCS_BLOCK_I;
			if RST_I = '1' then
				block_valid_d1 <= '0';
			else
				block_valid_d1 <= BLOCK_VALID_I;
			end if;
		end if;
	end process INPUT_REGISTER_proc;

	X <= pcs_block_d1.P;

	S_bits : for i in 0 to 57 generate
		S(i) <= pcs_block_d2.P(63 - i);
	end generate S_bits;

	bits_A_Section : for i in 0 to 38 generate
	begin
		Y(i) <= X(i) xor (S(38 - i) xor S(57 - i));
	end generate bits_A_Section;

	bits_B_Section : for i in 39 to 57 generate
	begin
		Y(i) <= X(i) xor (Y(i - 39) xor S(57 - i));
	end generate bits_B_Section;

	bits_C_Section : for i in 58 to 63 generate
	begin
		Y(i) <= X(i) xor (Y(i - 39) xor Y(i - 58));
	end generate bits_C_Section;

	OUTPUT_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			block_valid_d2 <= block_valid_d1;
			if (block_valid_d1 = '1') then
				pcs_block_d2.P <= Y;
				pcs_block_d2.H <= pcs_block_d1.H;
			end if;
		end if;
	end process OUTPUT_REGISTER_proc;

	PCS_BLOCK_O   <= pcs_block_d2;
	BLOCK_VALID_O <= block_valid_d2;

end Behavioral;
