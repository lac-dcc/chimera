--
-- A simulation model of Lunar Lander hardware 
-- James Sweet 2019
-- This is not endorsed by fpgaarcade, please do not bother MikeJ with support requests
--
-- Built upon model of Asteroids Deluxe hardware
-- Copyright (c) MikeJ - May 2004
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
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;
  

entity LLANDER_RAM is
  port (
  ADDR   : in  std_logic_vector(9 downto 0);
  DIN    : in  std_logic_vector(7 downto 0);
  DOUT   : out std_logic_vector(7 downto 0);
  RW_L   : in  std_logic;
  CS_L   : in  std_logic; -- used for write enable gate only
  ENA    : in  std_logic; -- ditto
  CLK    : in  std_logic
  );
end;

architecture RTL of LLANDER_RAM is

  signal we : std_logic;

begin
r1 : entity work.ram_1k
  PORT MAP (
    clock => clk,
    wren => we,
    address => ADDR(9 downto 0),
    data => DIN(7 downto 4),
    q => DOUT(7 downto 4)
  );
  
  
  
  r0 : entity work.ram_1k
  PORT MAP (
    clock => clk,
    wren => we,
    address => ADDR(9 downto 0),
    data => DIN(3 downto 0),
    q => DOUT(3 downto 0)
  );


  p_we : process(RW_L, CS_L, ENA)
  begin
    we <= (not CS_L) and (not RW_L) and ENA;
  end process;

end architecture RTL;
