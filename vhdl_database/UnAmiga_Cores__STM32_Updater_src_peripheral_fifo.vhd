--
-- TBBlue / ZX Spectrum Next project
--
-- FIFO - Victor Trucco
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--

library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity FIFO is
	Generic 
	(
		constant DATA_WIDTH  : positive := 8;
		constant FIFO_DEPTH	: positive := 256
	);
	Port 
	( 
		clock_i			: in  STD_LOGIC;
		reset_i			: in  STD_LOGIC;
		
		-- input
		fifo_we_i		: in  STD_LOGIC;
		fifo_data_i		: in  STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
		
		-- output
		fifo_read_i		: in  STD_LOGIC;
		fifo_data_o		: out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);

		-- flags
		fifo_empty_o	: out STD_LOGIC;
		fifo_full_o		: out STD_LOGIC;
		
		-- debug
		fifo_head_o		: out unsigned(7 downto 0)
	);
end FIFO;

architecture Behavioral of FIFO is
		type fifo_mem_t is array (0 to FIFO_DEPTH - 1) of STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
		signal memory : fifo_mem_t;
		
		signal head_s : natural range 0 to FIFO_DEPTH - 1;
		signal tail_s : natural range 0 to FIFO_DEPTH - 1;
		
		signal loop_s : boolean;
		signal read_edge : std_logic_vector(1 downto 0) :="00";
		signal write_edge : std_logic_vector(1 downto 0) :="00";
begin

	-- Memory Pointer Process
	fifo_proc : process (clock_i)
	begin
	
		if rising_edge(clock_i) then
		
			if reset_i = '1' then
			
					head_s <= 0;
					tail_s <= 0;
					
					loop_s <= false;
					
					fifo_full_o  <= '0';
					fifo_empty_o <= '1';
					
			else
			
					fifo_head_o <= to_unsigned(head_s,8);
					
					read_edge <= read_edge(0) & fifo_read_i;
					
					if (read_edge = "01") then
					
							if ((loop_s = true) or (head_s /= tail_s)) then
							
									-- Update data output
									fifo_data_o <= memory(tail_s);
									
									-- Update tail_s pointer as needed
									if (tail_s = FIFO_DEPTH - 1) then
										tail_s <= 0;
										
										loop_s <= false;
									else
										tail_s <= tail_s + 1;
									end if;
								
							end if;
						
					end if;
					
					write_edge <= write_edge(0) & fifo_we_i;
					
	--				if (fifo_we_i = '1') then
					if (write_edge = "01") then
						if ((loop_s = false) or (head_s /= tail_s)) then
						
							-- Write Data to memory
							memory(head_s) <= fifo_data_i;
							
							-- Increment head pointer as needed
							if (head_s = FIFO_DEPTH - 1) then
								head_s <= 0;
								
								loop_s <= true;
							else
								head_s <= head_s + 1;
							end if;
							
						end if;
					end if;
					
					-- Update empty and full flags
					if (head_s = tail_s) then
						if loop_s then
							fifo_full_o <= '1';
						else
							fifo_empty_o <= '1';
						end if;
					else
						fifo_empty_o	<= '0';
						fifo_full_o	<= '0';
					end if;
				end if;
		end if;
	end process;
	
	
		
end Behavioral;