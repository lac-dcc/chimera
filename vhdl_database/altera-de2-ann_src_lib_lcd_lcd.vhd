library ieee;
use ieee.std_logic_1164.all;

package lcd_types is
	subtype char is std_logic_vector(7 downto 0);
	type char_vector is array(natural range <>) of char;
	subtype char_graphics is std_logic_vector(39 downto 0);
	type char_graphics_vector is array(natural range <>) of char_graphics;
end package lcd_types;

library ieee;
use ieee.std_logic_1164.all;
use work.lcd_types.all;

package lcd_components is
	component lcd is
		port(
			reset, clock : IN STD_LOGIC;
			dd : IN CHAR_VECTOR(0 to 31);
			cg : IN CHAR_GRAPHICS_VECTOR(0 to 7);
			LCD_ON : OUT STD_LOGIC;							--	LCD Power ON/OFF
			LCD_BLON : OUT STD_LOGIC;						--	LCD Back Light ON/OFF
			LCD_RW : OUT STD_LOGIC;							--	LCD Read/Write Select; 0 = Write; 1 = Read
			LCD_EN : OUT STD_LOGIC;							--	LCD Enable
			LCD_RS : OUT STD_LOGIC;							--	LCD Command/Data Select; 0 = Command; 1 = Data
			LCD_DATA : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)	--	LCD Data bus 8 bits
		);
	end component lcd;
end package lcd_components;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.lcd_types.all;

ENTITY lcd IS
	PORT(
		reset, clock : IN STD_LOGIC;
		dd : IN CHAR_VECTOR(0 to 31);
		cg : IN CHAR_GRAPHICS_VECTOR(0 to 7);
		LCD_ON : OUT STD_LOGIC;							--	LCD Power ON/OFF
		LCD_BLON : OUT STD_LOGIC;						--	LCD Back Light ON/OFF
		LCD_RW : OUT STD_LOGIC;							--	LCD Read/Write Select; 0 = Write; 1 = Read
		LCD_EN : OUT STD_LOGIC;							--	LCD Enable
		LCD_RS : OUT STD_LOGIC;							--	LCD Command/Data Select; 0 = Command; 1 = Data
		LCD_DATA : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)	--	LCD Data bus 8 bits
	);
END ENTITY lcd;

ARCHITECTURE lcd of lcd is
	SIGNAL wait_counter : INTEGER := 0;


	SIGNAL timing_counter : INTEGER := 0;
	TYPE timing_states IS (idle, setup, hold);
	SIGNAL timing_state : timing_states := idle;
	TYPE timing_modes IS (idle, read_cmd, read_data, write_cmd, write_data);
	SIGNAL timing_mode : timing_modes := idle;
	SIGNAL timing_done : STD_LOGIC := '1';

	CONSTANT init_cmds_count : INTEGER := 4;
	CONSTANT init_cmds : CHAR_VECTOR(0 to init_cmds_count - 1) := (
		x"38",	-- set up interface
		x"0C",	-- set up display
		x"01",	-- clear screen
		x"06"	-- set up entry mode
	);
	CONSTANT init_cmds_wait : INTEGER := 100000; -- wait 2 ms for each init command

	TYPE states IS (
		init,
		init_cmd,
		init_cmd_complete,
		update_cg,
		update_cg_addr,
		update_cg_addr_complete,
		update_cg_data,
		update_cg_data_complete,
		update_dd,
		update_dd_addr,
		update_dd_addr_complete,
		update_dd_data,
		update_dd_data_complete
	);
	SIGNAL state : states := init;

	SIGNAL i, j : INTEGER := 0;
BEGIN

LCD_ON <= '1';
LCD_BLON <= '1';

timing: PROCESS(clock, reset) IS
BEGIN
	IF (reset = '1') THEN
		timing_state <= idle;
		timing_counter <= 0;
		timing_done <= '1';
	ELSIF (clock = '1' AND clock'event) THEN
		IF (timing_counter > 0) THEN
			timing_counter <= timing_counter - 1;
		ELSE
			CASE timing_state IS
			WHEN idle =>
				CASE timing_mode IS
					WHEN idle =>
						LCD_RS <= '0';
						LCD_RW <= '1';
						timing_done <= '1';
						timing_state <= idle;
					WHEN read_cmd =>
						LCD_RS <= '0';
						LCD_RW <= '1';
						timing_done <= '0';
						timing_counter <= 3;
						timing_state <= setup;
					WHEN read_data =>
						LCD_RS <= '1';
						LCD_RW <= '1';
						timing_done <= '0';
						timing_counter <= 3;
						timing_state <= setup;
					WHEN write_cmd =>
						LCD_RS <= '0';
						LCD_RW <= '0';
						timing_done <= '0';
						timing_counter <= 3;
						timing_state <= setup;
					WHEN write_data =>
						LCD_RS <= '1';
						LCD_RW <= '0';
						timing_done <= '0';
						timing_counter <= 3;
						timing_state <= setup;
				END CASE;
			WHEN setup =>
				LCD_EN <= '1';
				timing_counter <= 30;
				timing_state <= hold;
			WHEN hold =>
				LCD_EN <= '0';
				timing_counter <= 3000; -- a 60 microsecond wait guarantees operation execution
				timing_state <= idle;
			WHEN others =>
				timing_state <= idle;
			END CASE;
		END IF;
	END IF;
END PROCESS;

fsm: PROCESS(clock, reset) IS
BEGIN
	IF (reset = '1') THEN
		timing_mode <= idle;
		state <= init;
	ELSIF (clock = '1' AND clock'event) THEN
		IF (timing_mode /= idle) THEN
			timing_mode <= idle;
		ELSIF (timing_done /= '1') THEN
		ELSIF (wait_counter > 0) THEN
			wait_counter <= wait_counter - 1;
		ELSE
			CASE state IS
			WHEN init =>
				i <= 0;
				timing_mode <= idle;
				wait_counter <= init_cmds_wait;			
				state <= init_cmd;
			WHEN init_cmd =>
				LCD_DATA <= init_cmds(i);
				timing_mode <= write_cmd;
				wait_counter <= init_cmds_wait;
				state <= init_cmd_complete;
			WHEN init_cmd_complete =>
				IF (i = init_cmds_count - 1) THEN
					state <= update_cg;
				ELSE
					i <= i + 1;
					state <= init_cmd;
				END IF;

			WHEN update_cg =>
				i <= 0;
				j <= 0;
				state <= update_cg_addr;
			WHEN update_cg_addr =>
				LCD_DATA <= "01" & std_logic_vector(to_unsigned(i, 3)) & std_logic_vector(to_unsigned(j, 3));
				timing_mode <= write_cmd;
				state <= update_cg_addr_complete;
			WHEN update_cg_addr_complete =>
				state <= update_cg_data;
			WHEN update_cg_data =>
				LCD_DATA <= "000" & cg(i)(39 - j * 5 downto 35 - j * 5);
				timing_mode <= write_data;
				state <= update_cg_data_complete;
			WHEN update_cg_data_complete =>
				IF (j = 7) THEN
					IF (i = 7) THEN
						state <= update_dd;
					ELSE
						j <= 0;
						i <= i + 1;
						state <= update_cg_addr;
					END IF;
				ELSE
					j <= j + 1;
					state <= update_cg_addr;
				END IF;

			WHEN update_dd =>
				i <= 0;
				j <= 0;
				state <= update_dd_addr;
			WHEN update_dd_addr =>
				LCD_DATA <= "1" & std_logic_vector(to_unsigned(i, 1)) & "00" & std_logic_vector(to_unsigned(j, 4));
				timing_mode <= write_cmd;
				state <= update_dd_addr_complete;
			WHEN update_dd_addr_complete =>
				state <= update_dd_data;
			WHEN update_dd_data =>
				LCD_DATA <= dd(i * 16 + j);
				timing_mode <= write_data;
				state <= update_dd_data_complete;
			WHEN update_dd_data_complete =>
				IF (j = 15) THEN
					IF (i = 1) THEN
						state <= update_cg;
					ELSE
						j <= 0;
						i <= i + 1;
						state <= update_dd_addr;
					END IF;
				ELSE
					j <= j + 1;
					state <= update_dd_addr;
				END IF;

			WHEN others =>
				state <= init;
			END CASE;
		END IF;
	END IF;
END PROCESS;

END ARCHITECTURE lcd;



