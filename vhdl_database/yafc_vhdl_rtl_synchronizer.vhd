--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library ieee;
use ieee.std_logic_1164.all;

entity synchronizer is
  port (
    clk   : in  std_logic;
    rst_n : in  std_logic;
    ain   : in  std_logic;
    sout  : out std_logic
  );
end synchronizer;

architecture rtl of synchronizer is
  signal sync0, sync1 : std_logic := '0';
begin  -- rtl

  -----------------------------------------------------------------------------
  -- assign outputs
  -----------------------------------------------------------------------------
  sout <= sync1;
  
  -- purpose: synchronizes an asynchronous input using 2 D FFs
  -- type   : sequential
  -- inputs : clk, rst_n
  -- outputs: sout
  sync: process (clk, rst_n)
  begin  -- process sync
    if rst_n = '0' then                 -- asynchronous reset (active low)
      sync0 <= '0';
      sync1 <= '0';
    elsif rising_edge( clk ) then  -- rising clock edge
      sync0 <= ain;
      sync1 <= sync0;
    end if;
  end process sync;

end rtl;
