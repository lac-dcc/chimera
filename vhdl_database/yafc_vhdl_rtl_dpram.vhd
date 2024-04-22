--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

-- Based on the Quartus II VHDL Template for True Dual-Port RAM with single clock
-- Read-during-write on port A or B returns newly written data

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

use std.textio.all;

entity dpram is

  generic(
      g_data_width    : natural := 16;
      g_addr_width    : natural := 10;
      g_init          : boolean := false;
      g_init_file     : string  := ""
      );

  port(
      clk		: in std_logic;
      addr_a	: in std_logic_vector( g_addr_width-1 downto 0 );
      addr_b	: in std_logic_vector( g_addr_width-1 downto 0 );
      data_a	: in std_logic_vector((g_data_width-1) downto 0);
      data_b	: in std_logic_vector((g_data_width-1) downto 0);
      we_a	    : in std_logic := '1';
      we_b	    : in std_logic := '1';
      q_a		: out std_logic_vector((g_data_width -1) downto 0);
      q_b		: out std_logic_vector((g_data_width -1) downto 0)
      );

end dpram;

architecture rtl of dpram is

  -- Build a 2-D array type for the RAM
  subtype word_t is std_logic_vector((g_data_width-1) downto 0);
  type ram_t is array( 0 to 2**g_addr_width-1 ) of word_t;

  -- function to initialize the RAM from a file
  impure function init_ram( fn : in string ) return ram_t is                                                   
    file f : text;
    variable l : line;
    variable ram : ram_t;
  begin                    
    if g_init then
      file_open( f, fn, READ_MODE );
      for i in ram_t'range loop                                  
        readline( f, l );
        read( l, ram( i ) );                                  
      end loop;
      file_close( f );
    else
      ram := ( others => ( others => '0' ) );
    end if;
    
    return ram;
  end function;
  
  -- Declare the RAM 
  shared variable ram : ram_t := init_ram( g_init_file );

begin
    -- Port A
    process (clk)
        variable addr : natural range 0 to 2**g_addr_width-1;
    begin
        if (rising_edge(clk)) then 
            addr := to_integer( unsigned( addr_a ) );
            if (we_a = '1') then
                ram(addr) := data_a;
            end if;
            
            q_a <= ram(addr);
        end if;
    end process;

    -- Port B 
    process (clk)
        variable addr : natural range 0 to 2**g_addr_width-1;
    begin
        if (rising_edge(clk)) then 
            addr := to_integer( unsigned( addr_b ) );
            if (we_b = '1') then
                ram(addr) := data_b;
            end if;
            
            q_b <= ram(addr);
        end if;
    end process;

end rtl;
