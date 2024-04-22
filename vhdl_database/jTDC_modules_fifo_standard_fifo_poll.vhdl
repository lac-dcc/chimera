-------------------------------------------------------------------------
----                                                                 ----
---- Company:  University of Bonn                                    ----
---- Engineer: John Bieling                                          ----
----                                                                 ----
-------------------------------------------------------------------------
----                                                                 ----
---- Copyright (C) 2015 John Bieling                                 ----
----                                                                 ----
---- This program is free software; you can redistribute it and/or   ----
---- modify it under the terms of the GNU General Public License as  ----
---- published by the Free Software Foundation; either version 3 of  ----
---- the License, or (at your option) any later version.             ----
----                                                                 ----
---- This program is distributed in the hope that it will be useful, ----
---- but WITHOUT ANY WARRANTY; without even the implied warranty of  ----
---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the    ----
---- GNU General Public License for more details.                    ----
----                                                                 ----
---- You should have received a copy of the GNU General Public       ----
---- License along with this program; if not, see                    ----
---- <http://www.gnu.org/licenses>.                                  ----
----                                                                 ----
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity standard_fifo_poll is
   Port (readrequest : in STD_LOGIC;
			CLK : in  STD_LOGIC;
			fifo_data : in  STD_LOGIC_VECTOR (31 downto 0);
			fifo_read : out STD_LOGIC;
			fifo_valid : in  STD_LOGIC;
			reset : in  STD_LOGIC;
			fifo_value : out  STD_LOGIC_VECTOR (31 downto 0));
end standard_fifo_poll;

architecture Behavioral of standard_fifo_poll is

	signal fifo_read_was_invalid : STD_LOGIC;
	signal buffered_value : STD_LOGIC_VECTOR (31 downto 0);
	signal pollstage : STD_LOGIC_VECTOR (3 downto 0);

begin

	process (CLK) begin
		if (rising_edge(CLK)) then


			-- only in pollstage 0001 and if we need to get a new fifo value, we set fifo_read to 1, otherwise always 0
			fifo_read <= '0';

				
			if (reset = '1') then 
				pollstage <= "0000";
			else
				case pollstage is

					-- idle state, initiate fifo_read if requested
					when "0001" => if (readrequest = '1' OR fifo_read_was_invalid = '1') then 
													fifo_read <= '1';
													pollstage <= "0010";
										end if;


					-- waitstate
					when "0010" => pollstage <= "0100";

					
					-- evaluate, if the read was valid
					-- if so, put the read value into the output buffer
					-- otherwise set the output buffer to zero
					-- the fifo_read_was_invalid flag will cause the system to re-read the fifo
					when "0100" => pollstage <= "1000";
									   if (fifo_valid = '1') then 
													buffered_value <= fifo_data;
													fifo_read_was_invalid <= '0';
										else 	
													buffered_value <= (others => '0');
													fifo_read_was_invalid <= '1';
										end if;
					

					-- buffered value contains the current fifo value (or empty if no value could be read)
					--	we only overwrite the readout register, if there is no active read
					when "1000" => if (readrequest = '0') then 
													fifo_value <= buffered_value;			
													pollstage <= "0001"; 
										end if;
										
										
					when others => pollstage <= "0001";
										fifo_value <= (others => '0');				
										fifo_read_was_invalid <= '1';

				end case;
			end if;

		end if;
	end process;
	
end Behavioral;
