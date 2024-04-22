--
-- fifo.vhd
-- TBBlue / ZX Spectrum Next project
--
-- FIFO - Victor Trucco
--
-- All rights reserved
--
-- Rev 01 by Oduvaldo Pavan Junior
-- When HEAD hit top of memory, this is not buffer full
-- Buffer Full is when HEAD meet TAIL after a byte is pushed
-- This was causing false Buffer Full reporting when head hit top of memory
-- but TAIL was not in the bottom of memory
-- Changed signal name from loop_s to full_s in order to identify it better
--
-- Now it works more like a real FIFO, you don't need to read data up to the
-- top so it is free again. If there is one byte free, you can push again even
-- if not all bytes have been pushed.
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
        constant DATA_WIDTH : positive := 8;
        constant FIFO_DEPTH : positive := 512
    );
    Port
    (
        clock_i             : in  STD_LOGIC;
        reset_i             : in  STD_LOGIC;

        -- input
        fifo_we_i           : in  STD_LOGIC;
        fifo_data_i         : in  STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);

        -- output
        fifo_read_i         : in  STD_LOGIC;
        fifo_data_o         : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);

        -- flags
        fifo_empty_o        : out STD_LOGIC;
        fifo_full_o         : out STD_LOGIC
    );
end FIFO;

architecture Behavioral of FIFO is
        type fifo_mem_t is array (0 to FIFO_DEPTH - 1) of STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
        signal memory       : fifo_mem_t;

        signal head_s       : natural range 0 to FIFO_DEPTH - 1;
        signal tail_s       : natural range 0 to FIFO_DEPTH - 1;

        signal full_s : boolean := false;
        signal read_edge    : std_logic_vector(1 downto 0) := "00";
        signal write_edge   : std_logic_vector(1 downto 0) := "00";
begin

    -- Memory Pointer Process
    fifo_proc : process (clock_i)
    begin

        if rising_edge(clock_i) then

            if reset_i = '1' then

                    head_s <= 0;
                    tail_s <= 0;

                    full_s <= false;

                    fifo_full_o  <= '0';
                    fifo_empty_o <= '1';

            else

            read_edge <= read_edge(0) & fifo_read_i;
            if (read_edge = "01") then
            --if (fifo_read_i = '1') then

              if ((full_s = true) or (head_s /= tail_s)) then
                    -- Update data output
                    fifo_data_o <= memory(tail_s);

                    -- Update tail_s pointer as needed
                    if (tail_s = FIFO_DEPTH - 1) then
                        tail_s <= 0;
                    else
                        tail_s <= tail_s + 1;
                    end if;
                    full_s <= false;
                end if;

            end if;

            write_edge <= write_edge(0) & fifo_we_i;
            if (write_edge = "01") then
            --if (fifo_we_i = '1') then
                if (full_s = false) then
                    -- Write Data to memory
                    memory(head_s) <= fifo_data_i;
                    -- Increment head pointer as needed
                    if (head_s = FIFO_DEPTH - 1) then
                        head_s <= 0;
                    else
                        head_s <= head_s + 1;
                    end if;
                    -- Full?
                    if ( ((tail_s /= 0) and (head_s = tail_s -1)) or
                            ((tail_s = 0) and (head_s = FIFO_DEPTH - 1)) )then
                        full_s <= true;
                    end if;
                end if;
            end if;

            -- Update empty and full flags
            if (full_s = true) then
                fifo_full_o <= '1';
            else
                fifo_full_o <= '0';
            end if;

            if ( (head_s = tail_s) and (full_s = false) ) then
                fifo_empty_o <= '1';
            else
                fifo_empty_o <= '0';
            end if;

        end if;
    end if;
  end process;

end Behavioral;
