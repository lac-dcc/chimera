--------------------------------------------------------------------------------
--
--   FileName:         ps2_mouse.vhd
--   Dependencies:     ps2_transceiver.vhd, debounce.vhd
--   Design Software:  Quartus II 64-bit Version 13.1.0 Build 162 SJ Web Edition
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 2/16/2018 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ps2_mouse IS
	GENERIC(
			clk_freq							:	INTEGER := 50_000_000;	--system clock frequency in Hz
			ps2_debounce_counter_size	:	INTEGER := 8);				--set such that 2^size/clk_freq = 5us (size = 8 for 50MHz)
	PORT(
			clk				:	IN			STD_LOGIC;								--system clock input
			reset_n			:	IN			STD_LOGIC;								--active low asynchronous reset
			ps2_clk			:	INOUT		STD_LOGIC;								--clock signal from PS2 mouse
			ps2_data			:	INOUT		STD_LOGIC;								--data signal from PS2 mouse
			mouse_data		:	OUT		STD_LOGIC_VECTOR(23 DOWNTO 0);	--data received from mouse
			mouse_data_new	:	OUT		STD_LOGIC);								--new data packet available flag
END ps2_mouse;

ARCHITECTURE logic OF ps2_mouse IS
	TYPE machine IS(reset, rx_ack1, rx_bat, rx_id, ena_reporting, rx_ack2, stream);	--needed states
	SIGNAL state 					:	machine := reset;												--state machine	
	SIGNAL tx_ena					: 	STD_LOGIC := '0';												--transmit enable for ps2_transceiver
	SIGNAL tx_cmd					:	STD_LOGIC_VECTOR(8 DOWNTO 0);								--command to transmit
	SIGNAL tx_busy					:	STD_LOGIC;														--ps2_transceiver busy signal
	SIGNAL ps2_code				:	STD_LOGIC_VECTOR(7 DOWNTO 0);								--PS/2 code received from ps2_transceiver
	SIGNAL ps2_code_new			:	STD_LOGIC;														--new PS/2 code available flag from ps2_transceiver
	SIGNAL ps2_code_new_prev	:	STD_LOGIC;														--previous value of ps2_code_new
	SIGNAL packet_byte			:	INTEGER RANGE 0 TO 2 := 2;									--counter to track which packet byte is being received
	SIGNAL mouse_data_int		:	STD_LOGIC_VECTOR(23 DOWNTO 0);							--internal mouse data register
	
	--component to control PS/2 bus interface to the mouse
	COMPONENT ps2_transceiver IS
		GENERIC(
			clk_freq						:	INTEGER;					--system clock frequency in Hz
			debounce_counter_size	:	INTEGER);				--set such that (2^size)/clk_freq = 5us (size = 8 for 50MHz)
		PORT(
			clk				:	IN			STD_LOGIC;								--system clock
			reset_n			:	IN			STD_LOGIC;								--active low asynchronous reset
			tx_ena			:	IN			STD_LOGIC;								--enable transmit
			tx_cmd			:	IN			STD_LOGIC_VECTOR(8 DOWNTO 0);		--8-bit command to transmit, MSB is parity bit
			tx_busy			:	OUT		STD_LOGIC;								--indicates transmit in progress
			ack_error		:	OUT		STD_LOGIC;								--device acknowledge from transmit, '1' is error
			ps2_code			:	OUT		STD_LOGIC_VECTOR(7 DOWNTO 0);		--code received from PS/2 bus
			ps2_code_new	:	OUT		STD_LOGIC;								--flag that new PS/2 code is available on ps2_code bus
			rx_error			:	OUT		STD_LOGIC;								--start, stop, or parity receive error detected, '1' is error
			ps2_clk			:	INOUT		STD_LOGIC;								--PS/2 port clock signal
			ps2_data			:	INOUT		STD_LOGIC);								--PS/2 port data signal
	END COMPONENT;

BEGIN

	--PS/2 transceiver to control transactions with mouse
	ps2_transceiver_0:  ps2_transceiver
	GENERIC MAP(clk_freq => clk_freq, debounce_counter_size => ps2_debounce_counter_size)
	PORT MAP(clk => clk, reset_n => reset_n, tx_ena => tx_ena, tx_cmd => tx_cmd, tx_busy => tx_busy, ack_error => OPEN,
				ps2_code => ps2_code, ps2_code_new => ps2_code_new, rx_error => OPEN, ps2_clk => ps2_clk, ps2_data => ps2_data);


	PROCESS(clk, reset_n)
	BEGIN
		IF(reset_n = '0') THEN							--asynchronous reset
			mouse_data_new <= '0';							--clear new mouse data available flag
			mouse_data <= (OTHERS => '0');				--clear last mouse data packet received
			state <= reset;									--set state machine to reset the mouse
		ELSIF(clk'EVENT AND clk = '1') THEN
			ps2_code_new_prev <= ps2_code_new;		--store previous value of the new PS/2 code flag

			CASE state IS

				WHEN reset =>
					IF(tx_busy = '0') THEN				--transmit to mouse not yet in process
						tx_ena <= '1';							--enable transmit to PS/2 mouse
						tx_cmd <= "111111111";				--send reset command (0xFF)
						state <= reset;						--remain in reset state
					ELSIF(tx_busy = '1') THEN			--transmit to mouse is in process
						tx_ena <= '0';							--clear transmit enable
						state <= rx_ack1;						--wait to receive an acknowledge from mouse
					END IF;
				
				WHEN rx_ack1 =>
					IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN	--new PS/2 code received
						IF(ps2_code = "11111010") THEN									--new PS/2 code is acknowledge (0xFA)
							state <= rx_bat;														--wait to receive new BAT completion code
						ELSE																		--new PS/2 code was not an acknowledge
							state <= reset;														--reset mouse again
						END IF;
					ELSE																		--new PS/2 code not yet received
						state <= rx_ack1;														--wait to receive a code from mouse
					END IF;
				
				WHEN rx_bat =>					
					IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN	--new PS/2 code received
						IF(ps2_code = "10101010") THEN									--new PS/2 code is BAT completion (0xAA)
							state <= rx_id;														--wait to receive device ID code
						ELSE																		--new PS/2 code was not BAT completion
							state <= reset;														--reset mouse again
						END IF;
					ELSE																		--new PS/2 code not yet received
						state <= rx_bat;														--wait to receive a code from mouse
					END IF;
				
				WHEN rx_id =>
					IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN	--new PS/2 code received
						IF(ps2_code = "00000000") THEN									--new PS/2 code is a mouse device ID (0x00)
							state <= ena_reporting;												--send command to enable data reporting
						ELSE																		--new PS/2 code is not a mouse device ID
							state <= reset;														--reset mouse again
						END IF;
					ELSE																		--new PS/2 code not yet received
						state <= rx_id;														--wait to receive a code from mouse
					END IF;
				
				WHEN ena_reporting =>
					IF(tx_busy = '0') THEN												--transmit to mouse not yet in process
						tx_ena <= '1';															--enable transmit to PS/2 mouse
						tx_cmd <= "011110100";												--send enable reporting command (0xF4)
						state <= ena_reporting;												--remain in ena_reporting state
					ELSIF(tx_busy = '1') THEN											--transmit to mouse is in process
						tx_ena <= '0';															--clear transmit enable
						state <= rx_ack2;														--wait to receive an acknowledge from mouse
					END IF;
				
				WHEN rx_ack2 =>
					IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN	--new PS/2 code received
						IF(ps2_code = "11111010") THEN									--new PS/2 code is acknowledge (0xFA)
							state <= stream;														--proceed to collect and output data from mouse
						ELSE																		--new PS/2 code was not an acknowledge
							state <= reset;														--reset mouse again
						END IF;
					ELSE																		--new PS/2 code not yet received
						state <= rx_ack2;														--wait to receive a code from mouse
					END IF;
				
				WHEN stream =>
					IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN								--new PS/2 code received
						mouse_data_new <= '0';																			--clear new data packet available flag
						mouse_data_int(7+packet_byte*8 DOWNTO packet_byte*8) <= ps2_code;					--store new mouse data byte
						IF(packet_byte = 0) THEN																		--all bytes in packet received and presented
							packet_byte <= 2;																					--clear packet byte counter
						ELSE																									--not all bytes in packet received yet
							packet_byte <= packet_byte - 1;																--increment packet byte counter
						END IF;
					END IF;
					IF(ps2_code_new_prev = '1' AND ps2_code_new = '1' AND packet_byte = 2) THEN	--mouse data receive is complete
						mouse_data <= mouse_data_int;																	--present new mouse data at output
						mouse_data_new <= '1';																			--set new data packet available flag
					END IF;
					
			END CASE;		
		END IF;	
	END PROCESS;			
				
END logic;