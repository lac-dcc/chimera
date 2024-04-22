----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 30.07.2014 11:16:42
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_AM_INSERTER - Behavioral
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

entity IEEE802_3_XL_PCS_AM_INSERTER is
	Port(
		CLK_I              : in  std_logic;
		RST_I              : in  std_logic;

		TX_ENABLE_I        : in  std_logic;
		THROTTLE_REQUEST_O : out std_logic;

		--BLOCKs_VALID_I     : in  std_logic;
		PCS_BLOCKs_I       : in  BLOCK_ARRAY_t(3 downto 0);
		PCS_BLOCKs_O       : out BLOCK_ARRAY_t(3 downto 0)
	);
end IEEE802_3_XL_PCS_AM_INSERTER;

architecture Behavioral of IEEE802_3_XL_PCS_AM_INSERTER is
	signal pcs_blocks : BLOCK_ARRAY_t(3 downto 0);

	signal insert_am : boolean;

	signal reset_BIP3 : boolean;

	--AM to AM Block Counter
	signal am_counter       : unsigned(14 downto 0) := (others => '0');
	signal start_am_counter : boolean;
	signal am_counter_done  : boolean;

begin
	AM_COUNTER_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				am_counter <= (others => '0');
				insert_am  <= false;
				reset_BIP3 <= true;
			else
				if (TX_ENABLE_I = '1') then
					if (am_counter_done) then
						insert_am  <= true;
						am_counter <= (others => '0');
					else
						insert_am  <= false;
						am_counter <= am_counter + 1;
					end if;
					if (insert_am) then
						reset_BIP3 <= true;
					else
						reset_BIP3 <= false;
					end if;
				end if;
			end if;
		end if;
	end process AM_COUNTER_PROC;

	am_counter_done <= (am_counter = 16383);

	THROTTLE_REQUEST_O <= TX_ENABLE_I when am_counter_done else '0';

	lanes : for i in 0 to 3 generate
		signal alignment_marker_block : BLOCK_t;

		signal L : std_logic_vector(65 downto 0);

		signal BIP_current : std_logic_vector(7 downto 0);
		signal BIP3        : std_logic_vector(7 downto 0);
		signal BIP7        : std_logic_vector(7 downto 0);
	begin
		PCS_LANE_PROC : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				if (TX_ENABLE_I = '1') then
					if (insert_am) then
						pcs_blocks(i) <= alignment_marker_block;
					else
						pcs_blocks(i) <= PCS_BLOCKs_I(i);
					end if;

					if (reset_BIP3) then
						BIP3 <= BIP_current;
					else
						BIP3 <= BIP3 xor BIP_current;
					end if;
				end if;
			end if;
		end process PCS_LANE_PROC;

		BIP7 <= not (BIP3 xor BIP_current);

		alignment_marker_block.H <= AM_BLOCKs(i).H;
		alignment_marker_block.P <= BIP7 & AM_BLOCKs(i).P(55 downto 32) & (BIP3 xor BIP_current) & AM_BLOCKs(i).P(23 downto 0);

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

	PCS_BLOCKs_O <= pcs_blocks;

end Behavioral;
