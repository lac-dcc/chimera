----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 11.08.2014 14:31:22
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_LANE_DESKEW - Behavioral
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

entity IEEE802_3_XL_PCS_LANE_DESKEW is
	Port(
		CLK_I          : in  std_logic;

		AM_STATUS_I    : in  std_logic;

		PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
		AM_VALID_I     : in  NIBBLE_t;
		PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0);
		AM_VALID_O     : out std_logic;

		ALIGN_STATUS_O : out std_logic
	);
end IEEE802_3_XL_PCS_LANE_DESKEW;

architecture Behavioral of IEEE802_3_XL_PCS_LANE_DESKEW is
	signal LANE0_SR32 : BLOCK_ARRAY_t(0 to 33);

	signal LANE0_AM_VALID_SR32 : std_logic_vector(0 to 33) := (others => '0');

	signal LANE1_DSRL : BLOCK_ARRAY_t(63 downto 0);
	signal LANE2_DSRL : BLOCK_ARRAY_t(63 downto 0);
	signal LANE3_DSRL : BLOCK_ARRAY_t(63 downto 0);

	signal LANE1_AM_VALID_DSRL : std_logic_vector(63 downto 0);
	signal LANE2_AM_VALID_DSRL : std_logic_vector(63 downto 0);
	signal LANE3_AM_VALID_DSRL : std_logic_vector(63 downto 0);

	signal LANE1 : BLOCK_t;
	signal LANE2 : BLOCK_t;
	signal LANE3 : BLOCK_t;

	signal LANE1_AM_VALID : std_logic;
	signal LANE2_AM_VALID : std_logic;
	signal LANE3_AM_VALID : std_logic;

	subtype PTR_t is unsigned(5 downto 0);
	type PTR_ARRAY_t is array (1 to 3) of PTR_t;
	signal LANE_COUNT : PTR_ARRAY_t;
	signal COUNTER_EN : std_logic_vector(1 to 3) := (others => '0');
	signal LANE_PTR   : PTR_ARRAY_t              := (others => (others => '0'));

	signal LANES_ALIGNED   : std_logic := '0';
	signal ALIGNMENT_VALID : std_logic := '0';

begin
	LANE0_SR32(0)          <= PCS_BLOCKs_I(0);
	LANE0_AM_VALID_SR32(0) <= AM_VALID_I(0);

	name : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			LANE0_SR32(1 to 33)          <= LANE0_SR32(0 to 32);
			LANE0_AM_VALID_SR32(1 to 33) <= LANE0_AM_VALID_SR32(0 to 32);
		end if;
	end process name;

	DYNAMIC_SHIFT_REG_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			LANE1_DSRL(63 downto 0)          <= LANE1_DSRL(62 downto 0) & PCS_BLOCKs_I(1);
			LANE2_DSRL(63 downto 0)          <= LANE2_DSRL(62 downto 0) & PCS_BLOCKs_I(2);
			LANE3_DSRL(63 downto 0)          <= LANE3_DSRL(62 downto 0) & PCS_BLOCKs_I(3);
			LANE1_AM_VALID_DSRL(63 downto 0) <= LANE1_AM_VALID_DSRL(62 downto 0) & AM_VALID_I(1);
			LANE2_AM_VALID_DSRL(63 downto 0) <= LANE2_AM_VALID_DSRL(62 downto 0) & AM_VALID_I(2);
			LANE3_AM_VALID_DSRL(63 downto 0) <= LANE3_AM_VALID_DSRL(62 downto 0) & AM_VALID_I(3);

			LANE1          <= LANE1_DSRL(to_integer(LANE_PTR(1)));
			LANE2          <= LANE2_DSRL(to_integer(LANE_PTR(2)));
			LANE3          <= LANE3_DSRL(to_integer(LANE_PTR(3)));
			LANE1_AM_VALID <= LANE1_AM_VALID_DSRL(to_integer(LANE_PTR(1)));
			LANE2_AM_VALID <= LANE2_AM_VALID_DSRL(to_integer(LANE_PTR(2)));
			LANE3_AM_VALID <= LANE3_AM_VALID_DSRL(to_integer(LANE_PTR(3)));
		end if;
	end process DYNAMIC_SHIFT_REG_proc;

	generate_label3 : for i in 1 to 3 generate
		name : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				if (LANE0_AM_VALID_SR32(32) = '1') then
					LANE_PTR(i) <= LANE_COUNT(i);
				end if;

				if (LANE0_AM_VALID_SR32(32) = '1') then
					COUNTER_EN(i) <= '0';
				else
					if (AM_VALID_I(i) = '1') then
						COUNTER_EN(i) <= '1';
					end if;
				end if;

				if (COUNTER_EN(i) = '0') then
					LANE_COUNT(i) <= (others => '0');
				else
					LANE_COUNT(i) <= LANE_COUNT(i) + 1;
				end if;
			end if;
		end process name;

	end generate generate_label3;

	ALIGN_STATUS_DETECT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (LANE0_AM_VALID_SR32(33) = '1') then
				if ((LANE1_AM_VALID and LANE2_AM_VALID and LANE3_AM_VALID) = '1') then
					LANES_ALIGNED <= '1';
				else
					LANES_ALIGNED <= '0';
				end if;
			end if;

			if (AM_STATUS_I = '0') then
				ALIGNMENT_VALID <= '0';
			else
				ALIGNMENT_VALID <= LANES_ALIGNED;
			end if;

		end if;
	end process ALIGN_STATUS_DETECT_proc;

	AM_VALID_O      <= LANE0_AM_VALID_SR32(33);
	PCS_BLOCKs_O(0) <= LANE0_SR32(33);
	PCS_BLOCKs_O(1) <= LANE1;
	PCS_BLOCKs_O(2) <= LANE2;
	PCS_BLOCKs_O(3) <= LANE3;

	ALIGN_STATUS_OUTPUT_REG_proc : process(AM_STATUS_I, CLK_I) is
	begin
		if (AM_STATUS_I = '0') then
			ALIGN_STATUS_O <= '0';
		else
			if rising_edge(CLK_I) then
				ALIGN_STATUS_O <= ALIGNMENT_VALID;
			end if;
		end if;
	end process ALIGN_STATUS_OUTPUT_REG_proc;

end Behavioral;
