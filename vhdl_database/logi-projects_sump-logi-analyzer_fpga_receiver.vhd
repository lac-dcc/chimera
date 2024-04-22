----------------------------------------------------------------------------------
-- receiver.vhd
--
-- Copyright (C) 2006 Michael Poppitz
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- Receives commands from the serial port. The first byte is the commands
-- opcode, the following (optional) four byte are the command data.
-- Commands that do not have the highest bit in their opcode set are
-- considered short commands without data (1 byte long). All other commands are
-- long commands which are 5 bytes long.
--
-- After a full command has been received it will be kept available for 10 cycles
-- on the op and data outputs. A valid command can be detected by checking if the
-- execute output is set. After 10 cycles the registers will be cleared
-- automatically and the receiver waits for new data from the serial port.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity receiver is
	generic (
		FREQ : integer;
		RATE : integer
	);

   Port ( rx : in STD_LOGIC;
           clock : in STD_LOGIC;
			  trxClock : IN std_logic;
			  reset : in STD_LOGIC;
           op : out STD_LOGIC_VECTOR (7 downto 0);
           data : out STD_LOGIC_VECTOR (31 downto 0);
           execute : out STD_LOGIC
	);
end receiver;

architecture Behavioral of receiver is

	type UART_STATES is (INIT, WAITSTOP, WAITSTART, WAITBEGIN, READBYTE, ANALYZE, READY);

	constant BITLENGTH : integer := FREQ / RATE;

	signal counter, ncounter : integer range 0 to BITLENGTH;	-- clock prescaling counter
	signal bitcount, nbitcount : integer range 0 to 8; 		-- count rxed bits of current byte
	signal bytecount, nbytecount : integer range 0 to 5;		-- count rxed bytes of current command
	signal state, nstate : UART_STATES;								-- receiver state
	signal opcode, nopcode : std_logic_vector (7 downto 0);	-- opcode byte
	signal dataBuf, ndataBuf : std_logic_vector (31 downto 0); -- data dword

begin
	op <= opcode;
	data <= dataBuf;
	
	process(clock, reset)
	begin
		if reset = '1' then
			state <= INIT;
		elsif rising_edge(clock) then
			counter <= ncounter;
			bitcount <= nbitcount;
			bytecount <= nbytecount;
			dataBuf <= ndataBuf;
			opcode <= nopcode;
			state <= nstate;
		end if;
	end process;

	process(trxClock, state, counter, bitcount, bytecount, dataBuf, opcode, rx)
	begin
		case state is

			-- reset uart
			when INIT =>
				ncounter <= 0;
				nbitcount <= 0;
				nbytecount <= 0;
				nopcode <= (others => '0');
				ndataBuf <= (others => '0');
				nstate <= WAITSTOP;

			-- wait for stop bit
			when WAITSTOP =>
				ncounter <= 0; 
				nbitcount <= 0;
				nbytecount <= bytecount;
				nopcode <= opcode;
				ndataBuf <= dataBuf;
				if rx = '1' then
					nstate <= WAITSTART;
				else
					nstate <= state;
				end if;

			-- wait for start bit
			when WAITSTART =>
				ncounter <= 0; 
				nbitcount <= 0;
				nbytecount <= bytecount;
				nopcode <= opcode;
				ndataBuf <= dataBuf;
				if rx = '0' then
					nstate <= WAITBEGIN;
				else
					nstate <= state;
				end if;

			-- wait for first half of start bit
			when WAITBEGIN =>
				nbitcount <= 0;
				nbytecount <= bytecount;
				nopcode <= opcode;
				ndataBuf <= dataBuf;
				if counter = BITLENGTH / 2 then
					ncounter <= 0; 
					nstate <= READBYTE;
				else
					if trxClock = '1' then
						ncounter <= counter + 1;
					else
						ncounter <= counter;
					end if;
					nstate <= state;
				end if;
				
			-- receive byte
			when READBYTE =>
				if counter = BITLENGTH then
					ncounter <= 0;
					nbitcount <= bitcount + 1;
					if bitcount = 8 then
						nbytecount <= bytecount + 1;
						nstate <= ANALYZE;
						nopcode <= opcode;
						ndataBuf <= dataBuf;
					else
						nbytecount <= bytecount;
						if bytecount = 0 then
							nopcode <= rx & opcode(7 downto 1);
							ndataBuf <= dataBuf;
						else
							nopcode <= opcode;
							ndataBuf <= rx & dataBuf(31 downto 1);
						end if;
						nstate <= state;
					end if;
				else
					if trxClock = '1' then
						ncounter <= counter + 1;
					else
						ncounter <= counter;
					end if;
					nbitcount <= bitcount;
					nbytecount <= bytecount;
					nopcode <= opcode;
					ndataBuf <= dataBuf;
					nstate <= state;
				end if;
				
			-- check if long or short command has been fully received
			when ANALYZE =>
				ncounter <= 0; 
				nbitcount <= 0;
				nbytecount <= bytecount;
				nopcode <= opcode;
				ndataBuf <= dataBuf;
				-- long command when 5 bytes have been received
				if bytecount = 5 then
					nstate <= READY;
				-- short command when set flag not set
				elsif opcode(7) = '0' then
					nstate <= READY;
				-- otherwise continue receiving
				else
					nstate <= WAITSTOP;
				end if;
				
			-- done, give 10 cycles for processing
			when READY =>
				ncounter <= counter + 1;
				nbitcount <= 0;
				nbytecount <= 0;
				nopcode <= opcode;
				ndataBuf <= dataBuf;
				if counter = 10 then
					nstate <= INIT;
				else
					nstate <= state;
				end if;
					
		end case;

	end process;

	-- set execute flag properly
	process(state)
	begin
		if state = READY then
			execute <= '1';
		else
			execute <= '0';
		end if;
	end process;

end Behavioral;
