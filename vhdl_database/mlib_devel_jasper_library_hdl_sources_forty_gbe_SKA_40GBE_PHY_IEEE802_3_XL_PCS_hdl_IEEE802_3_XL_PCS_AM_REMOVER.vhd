----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 01.08.2014 13:02:34
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_AM_REMOVER - Behavioral
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

entity IEEE802_3_XL_PCS_AM_REMOVER is
	Port(
		CLK_I          : in  std_logic;

		ALIGN_STATUS_I : in  std_logic;

		PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
		AM_VALID_I     : in  std_logic;
		BLOCKs_VALID_O : out std_logic;
		PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0);

		BIP_ERROR_O    : out std_logic
	);
end IEEE802_3_XL_PCS_AM_REMOVER;

architecture Behavioral of IEEE802_3_XL_PCS_AM_REMOVER is
	signal pcs_block_valid : std_logic_vector(3 downto 0);
	signal pcs_blocks      : BLOCK_ARRAY_t(3 downto 0);

	signal bip_error : std_logic_vector(3 downto 0);
begin
	lanes : for i in 0 to 3 generate
		signal L : std_logic_vector(65 downto 0);

		signal BIP_current : std_logic_vector(7 downto 0);
		signal BIP3        : std_logic_vector(7 downto 0);

		signal reset_BIP3 : boolean;
	begin
		AM_REMOVER_PROC : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				pcs_blocks(i) <= PCS_BLOCKs_I(i);
				if (AM_VALID_I = '1') then
					pcs_block_valid(i) <= '0';
					reset_BIP3         <= true;
				else
					pcs_block_valid(i) <= ALIGN_STATUS_I;
					reset_BIP3         <= false;
				end if;

				if (reset_BIP3) then
					BIP3 <= BIP_current;
					if (BIP3 /= pcs_blocks(i).P(31 downto 24)) then
						bip_error(i) <= '1';
					else
						bip_error(i) <= '0';
					end if;
				else
					BIP3         <= BIP3 xor BIP_current;
					bip_error(i) <= '0';
				end if;
			end if;
		end process AM_REMOVER_PROC;

		L <= pcs_blocks(i).P & pcs_blocks(i).H;

		BIP_current(0) <= L(2) xor L(10) xor L(18) xor L(26) xor L(34) xor L(42) xor L(50) xor L(58);
		BIP_current(1) <= L(3) xor L(11) xor L(19) xor L(27) xor L(35) xor L(43) xor L(51) xor L(59);
		BIP_current(2) <= L(4) xor L(12) xor L(20) xor L(28) xor L(36) xor L(44) xor L(52) xor L(60);
		BIP_current(3) <= L(0) xor L(5) xor L(13) xor L(21) xor L(29) xor L(37) xor L(45) xor L(53) xor L(61);
		BIP_current(4) <= L(1) xor L(6) xor L(14) xor L(22) xor L(30) xor L(38) xor L(46) xor L(54) xor L(62);
		BIP_current(5) <= L(7) xor L(15) xor L(23) xor L(31) xor L(39) xor L(47) xor L(55) xor L(63);
		BIP_current(6) <= L(8) xor L(16) xor L(24) xor L(32) xor L(40) xor L(48) xor L(56) xor L(64);
		BIP_current(7) <= L(9) xor L(17) xor L(25) xor L(33) xor L(41) xor L(49) xor L(57) xor L(65);

	end generate;

	BIP_ERROR_OUTPUT_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			BIP_ERROR_O    <= bip_error(0) or bip_error(1) or bip_error(2) or bip_error(3);
		end if;
	end process BIP_ERROR_OUTPUT_REGISTER_proc;
	
	BLOCKs_VALID_O <= pcs_block_valid(0) and pcs_block_valid(1) and pcs_block_valid(2) and pcs_block_valid(3);
	PCS_BLOCKs_O   <= pcs_blocks;

end Behavioral;
