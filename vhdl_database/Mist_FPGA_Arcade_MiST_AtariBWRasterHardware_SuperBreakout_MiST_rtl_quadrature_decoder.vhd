--------------------------------------------------------------------------------
--
--   FileName:         quadrature_decoder.vhd
--   Dependencies:     None
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
--   Version 1.0 9/7/2017 Scott Larson
--     Initial Public Release
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY quadrature_decoder IS
	GENERIC(
		positions						:	INTEGER := 16; 		--size of the position counter (i.e. number of positions counted)
		debounce_time					:	INTEGER := 50_000; 	--number of clock cycles required to register a new position = debounce_time + 2
		set_origin_debounce_time	:	INTEGER := 500_000);	--number of clock cycles required to register a new set_origin_n value = set_origin_debounce_time + 2
	PORT(
		clk				:	IN			STD_LOGIC;										--system clock
		a					:	IN			STD_LOGIC;										--quadrature encoded signal a
		b					:	IN			STD_LOGIC;  									--quadrature encoded signal b
		set_origin_n	:	IN			STD_LOGIC;  									--active-low synchronous clear of position counter
		direction		:	OUT		STD_LOGIC;										--direction of last change, 1 = positive, 0 = negative
		position			:	BUFFER	INTEGER RANGE 0 TO positions-1 := 0);	--current position relative to index or initial value
END quadrature_decoder;

ARCHITECTURE logic OF quadrature_decoder IS
	SIGNAL	a_new 				:	STD_LOGIC_VECTOR(1 DOWNTO 0);						--synchronizer/debounce registers for encoded signal a
	SIGNAL	b_new					:	STD_LOGIC_VECTOR(1 DOWNTO 0); 					--synchronizer/debounce registers for encoded signal b
	SIGNAL	a_prev				:	STD_LOGIC;												--last previous stable value of encoded signal a
	SIGNAL	b_prev				:	STD_LOGIC;												--last previous stable value of encoded signal b
	SIGNAL	debounce_cnt		:	INTEGER RANGE 0 TO debounce_time;				--timer to remove glitches and validate stable values of inputs
	SIGNAL	set_origin_n_new	:	STD_LOGIC_VECTOR(1 DOWNTO 0);						--synchronizer/debounce registers for the set_origin_n input
	SIGNAL	set_origin_n_int	:	STD_LOGIC;												--last debounced value of set_origin_n signal
	SIGNAL	set_origin_cnt		:	INTEGER RANGE 0 TO set_origin_debounce_time;	--debounce counter for set_origin_n signal
BEGIN

	PROCESS(clk)
	BEGIN
		IF(clk'EVENT AND clk = '1') THEN													--rising edge of system clock
		
			--synchronize and debounce a and b inputs
			a_new <= a_new(0) & a;																--shift in new values of 'a'	
			b_new <= b_new(0) & b;																--shift in new values of 'b'
			IF(((a_new(0) XOR a_new(1)) OR (b_new(0) XOR b_new(1))) = '1') THEN	--a input or b input is changing
				debounce_cnt <= 0;																	--clear debounce counter
			ELSIF(debounce_cnt = debounce_time) THEN										--debounce time is met
				a_prev <= a_new(1);																	--update value of a_prev
				b_prev <= b_new(1);																	--update value of b_prev
			ELSE																						--debounce time is not yet met		
				debounce_cnt <= debounce_cnt + 1;												--increment debounce counter
			END IF;
			
			--synchronize and debounce set_origin_n input
			set_origin_n_new <= set_origin_n_new(0) & set_origin_n;					--shift in new values of set_origin_n	
			IF((set_origin_n_new(0) XOR set_origin_n_new(1)) = '1') THEN			--set_origin_n input is changing
				set_origin_cnt <= 0;																	--clear debounce counter
			ELSIF(set_origin_cnt = set_origin_debounce_time) THEN						--debounce time is met
				set_origin_n_int <= set_origin_n_new(1);										--update value of set_origin_n_int
			ELSE																						--debounce time is not yet met		
				set_origin_cnt <= set_origin_cnt + 1;											--increment debounce counter
			END IF;
			
			--determine direction and position
			IF(set_origin_n_int = '0') THEN														--inital position is being set
				position <= 0;																				--clear position counter
			ELSIF(debounce_cnt = debounce_time													--debounce time for a and b is met
					AND ((a_prev XOR a_new(1)) OR (b_prev XOR b_new(1))) = '1') THEN	--AND the new value is different than the previous value
				direction <= b_prev XOR a_new(1);													--update the direction
				IF((b_prev XOR a_new(1)) = '1') THEN												--clockwise direction
					IF(position < positions-1) THEN														--not at position limit
						position <= position + 1;																--advance position counter
					ELSE																							--at position limit
						--position <= 0;																				--roll over position counter to zero
						null;
					END IF;
				ELSE																							--counter-clockwise direction
					IF(position > 0) THEN																	--not at position limit
						position <= position - 1;																--decrement position counter
					ELSE																							--at position limit
						--position <= positions-1;																--roll over position counter maximum
						null;
					END IF;
				END IF;
			END IF;
			
		END IF;
	END PROCESS;

END logic;