----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 13.04.2015 11:41:35
-- Design Name: 
-- Module Name: PCS_IDLE_BLOCK_FILTER - Behavioral
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

entity PCS_IDLE_BLOCK_FILTER is
	Port(
		CLK_I         : in  std_logic;
		RST_I         : in  std_logic;

		PCS_BLOCK_I   : in  BLOCK_t;
		BLOCK_VALID_I : in  std_logic;
		PCS_BLOCK_O   : out BLOCK_t;

		BLOCK_VALID_O : out std_logic;
		BLOCK_IDLE_O  : out std_logic
	);
end PCS_IDLE_BLOCK_FILTER;

architecture Behavioral of PCS_IDLE_BLOCK_FILTER is
	signal block_valid_d1 : std_logic;
	signal pcs_block_d1   : BLOCK_t;
	signal rx_control_d1  : std_logic;

	signal idle_char_detected : std_logic_vector(7 downto 0);

	signal idle_block_detected : std_logic;

	signal block_valid_d2 : std_logic;
	signal pcs_block_d2   : BLOCK_t;

	signal block_idle : std_logic_vector(15 downto 0);
	signal pcs_block  : BLOCK_ARRAY_t(15 downto 0);

	subtype PTR_t is unsigned(3 downto 0);
	signal pcs_block_ptr : PTR_t;

	signal fill_buffer_disable : std_logic;

	signal buffer_empty : std_logic;
	signal buffer_full  : std_logic;

begin
	REGISTER_INPUT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			block_valid_d1 <= BLOCK_VALID_I;
			pcs_block_d1   <= PCS_BLOCK_I;
			rx_control_d1  <= (not PCS_BLOCK_I.H(1)) and PCS_BLOCK_I.H(0);
		end if;
	end process REGISTER_INPUT_proc;

	PCS_BLOCK_CHARS : for i in 0 to 7 generate
	begin
		IDLE_CHAR_DETECT_proc : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				if (PCS_BLOCK_I.P(((i + 1) * 8) - 1 downto i * 8) = IBLOCK_T.P(((i + 1) * 8) - 1 downto i * 8)) then
					idle_char_detected(i) <= '1';
				else
					idle_char_detected(i) <= '0';
				end if;
			end if;
		end process IDLE_CHAR_DETECT_proc;
	end generate PCS_BLOCK_CHARS;

	IDLE_BLOCK_DETECT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				idle_block_detected <= '0';
			else
				if (idle_char_detected = x"FF") then
					idle_block_detected <= rx_control_d1;
				else
					idle_block_detected <= '0';
				end if;
			end if;
		end if;
	end process IDLE_BLOCK_DETECT_proc;

	--Insert
	IFG_IDLE_INSERT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				block_valid_d2 <= '1';
				pcs_block_d2   <= LBLOCK_T;
			else
				block_valid_d2 <= block_valid_d1 or idle_block_detected;
				pcs_block_d2   <= pcs_block_d1;
			end if;
		end if;
	end process IFG_IDLE_INSERT_proc;

	DELAY_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (block_valid_d2 = '1') then
				block_idle(0)           <= idle_block_detected;
				block_idle(15 downto 1) <= block_idle(14 downto 0);
				pcs_block(0)            <= pcs_block_d2;
				pcs_block(15 downto 1)  <= pcs_block(14 downto 0);
			end if;
		end if;
	end process DELAY_REGISTER_proc;

	REGISTER_OUTPUT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				pcs_block_ptr <= (others => '0');
			else
				if (block_valid_d2 = '0') then
					if (fill_buffer_disable = '1') then
						if (buffer_empty = '0') then
							pcs_block_ptr <= pcs_block_ptr - 1;
						end if;
					end if;
				else
					if (fill_buffer_disable = '0') then
						pcs_block_ptr <= pcs_block_ptr + 1;
					end if;
				end if;
			end if;
			
			if (buffer_full = '1') then
				fill_buffer_disable <= '1';
			else
				fill_buffer_disable <= not block_idle(to_integer(pcs_block_ptr));
			end if;

			if (pcs_block_ptr = 0) then
				buffer_empty <= '1';
			elsif (pcs_block_ptr = 1) then
				if (block_valid_d2 = '0') and (fill_buffer_disable = '1') then
					buffer_empty <= '1';
				else
					buffer_empty <= '0';
				end if;
			else
				buffer_empty <= '0';
			end if;

			buffer_full <= pcs_block_ptr(3) and pcs_block_ptr(2);

			if (fill_buffer_disable = '1') then
				PCS_BLOCK_O  <= pcs_block(to_integer(pcs_block_ptr));
				BLOCK_IDLE_O <= block_idle(to_integer(pcs_block_ptr));
			end if;
		end if;
	end process REGISTER_OUTPUT_proc;

	BLOCK_VALID_O <= '1';

end Behavioral;
