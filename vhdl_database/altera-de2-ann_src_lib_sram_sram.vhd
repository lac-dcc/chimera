LIBRARY ieee;
USE ieee.std_logic_1164.all;
package sram_types is
	subtype sram_address is std_logic_vector(16 downto 0);
	subtype sram_data is std_logic_vector(31 downto 0);
	type sram_mode is ( idle, read, write );
end package sram_types;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.sram_types.all;

package sram_components is

component sram is
	PORT (
		reset, clock : IN STD_LOGIC;
		addr : IN sram_address;
		input : IN sram_data;
		output : OUT sram_data;
		mode : IN sram_mode;
		ready : OUT STD_LOGIC;
		SRAM_DQ : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);	--	SRAM Data bus 16 Bits
		SRAM_ADDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);	--	SRAM Address bus 18 Bits
		SRAM_UB_N : OUT STD_LOGIC;						--	SRAM High-byte Data Mask
		SRAM_LB_N : OUT STD_LOGIC;						--	SRAM Low-byte Data Mask  
		SRAM_WE_N : OUT STD_LOGIC;						--	SRAM Write Enable
		SRAM_CE_N : OUT STD_LOGIC;						--	SRAM Chip Enable
		SRAM_OE_N : OUT STD_LOGIC						--	SRAM Output Enable
	);
end component;

end package sram_components;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.sram_types.all;

ENTITY sram IS
	PORT (
		reset, clock : IN STD_LOGIC;
		addr : IN sram_address;
		input : IN sram_data;
		output : OUT sram_data;
		mode : IN sram_mode;
		ready : OUT STD_LOGIC;
		SRAM_DQ : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);	--	SRAM Data bus 16 Bits
		SRAM_ADDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);	--	SRAM Address bus 18 Bits
		SRAM_UB_N : OUT STD_LOGIC;						--	SRAM High-byte Data Mask
		SRAM_LB_N : OUT STD_LOGIC;						--	SRAM Low-byte Data Mask  
		SRAM_WE_N : OUT STD_LOGIC;						--	SRAM Write Enable
		SRAM_CE_N : OUT STD_LOGIC;						--	SRAM Chip Enable
		SRAM_OE_N : OUT STD_LOGIC						--	SRAM Output Enable
	);
END ENTITY sram;

ARCHITECTURE sram OF sram IS
	TYPE states IS (init, idle, read_low, read_high, write_low, write_high, write_complete);
	SIGNAL state : states := idle;
	SIGNAL sram_address : sram_address := (others => '0');
	SIGNAL sram_word, sram_we : std_logic := '0';
	SIGNAL sram_input : sram_data := (others => '0');
	SIGNAL sram_output : sram_data := (others => '0');
BEGIN

output <= sram_output;

SRAM_UB_N <= not sram_word;
SRAM_LB_N <= not sram_word;
SRAM_WE_N <= not sram_we;
SRAM_CE_N <= '0';
SRAM_OE_N <= '0';

fsm: PROCESS(clock, reset) IS
BEGIN
	IF (reset = '1') THEN
		ready <= '0';
		sram_we <= '0'; sram_word <= '0';
		state <= init;
	ELSIF (clock = '1' AND clock'event) THEN
		CASE state IS
		WHEN init =>
			ready <= '0';
			sram_we <= '0'; sram_word <= '0';
			state <= idle;


		WHEN idle =>
			CASE mode IS
			WHEN idle =>
				ready <= '1';
				sram_we <= '0'; sram_word <= '0';
				state <= idle;
			WHEN read =>
				ready <= '0';
				sram_address <= addr;
				SRAM_ADDR <= sram_address & "0";
				sram_word <= '1';
				state <= read_low;
			WHEN write =>
				ready <= '0';
				sram_input <= input;
				sram_address <= addr;
				SRAM_ADDR <= sram_address & "0";
				SRAM_DQ <= sram_input(15 downto 0);
				sram_we <= '1'; sram_word <= '1';
				state <= write_low;
			WHEN others =>
				state <= idle;
			END CASE;


		WHEN read_low =>
			SRAM_DQ <= (others => 'Z');
			sram_output(15 downto 0) <= SRAM_DQ;
			SRAM_ADDR <= sram_address & "1";
			state <= read_high;
		WHEN read_high =>
			SRAM_DQ <= (others => 'Z');
			sram_output(31 downto 16) <= SRAM_DQ;
			sram_word <= '0';
			ready <= '1';
			state <= idle;

		WHEN write_low =>
			sram_word <= '0';
			state <= write_high;
		WHEN write_high =>
			SRAM_ADDR <= sram_address & "1";
			SRAM_DQ <= sram_input(31 downto 16);
			sram_word <= '1';
			state <= write_complete;
		WHEN write_complete =>
			sram_word <= '0';
			sram_we <= '0';
			ready <= '1';
			state <= idle;

		WHEN others =>
			state <= init;
		END CASE;
	END IF;
END PROCESS;

END ARCHITECTURE sram;




