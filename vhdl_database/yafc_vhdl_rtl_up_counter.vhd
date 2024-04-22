--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

-- binary up-counter
--  async reset, sync load, ce

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

entity up_counter is

  generic (
    g_width : integer;
    g_reset_value : std_logic_vector
  );

  port (
    clk		  : in std_logic;
    rst_n	  : in std_logic;
    inc	    : in std_logic;
    load    : in std_logic;
    d       : in std_logic_vector( g_width-1 downto 0 );
    q		    : out std_logic_vector( g_width-1 downto 0 )
  );

end entity;

architecture rtl of up_counter is
  signal cntr : unsigned( g_width-1 downto 0 ) := unsigned( g_reset_value );
begin

  -- Assign outputs
  q <= std_logic_vector( cntr );
  
  -- create the counter
  process( clk, rst_n )
  begin
    if rst_n = '0' then
      cntr <= unsigned( g_reset_value );
    elsif( rising_edge( clk ) ) then
      if load = '1' then
        cntr <= unsigned( d );
      elsif inc = '1' then
        cntr <= cntr + 1;
      end if;
    end if;
  end process;

end rtl;
