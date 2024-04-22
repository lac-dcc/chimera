--
--  Dual-port RAM (asymmetric)
-- 
--  Copyright 2016 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--

library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all; 
use ieee.numeric_std.all;
library unisim;

use unisim.vcomponents.ramb16_s9_s36;

entity dp_ram_2k_8_32 is
  port (
    clka:             in std_logic;
    ena:              in std_logic;
    wea:              in std_logic;
    addra:            in std_logic_vector(10 downto 0);
    dia:              in std_logic_vector(7 downto 0);
    doa:              out std_logic_vector(7 downto 0);
    clkb:             in std_logic;
    enb:              in std_logic;
    web:              in std_logic;
    addrb:            in std_logic_vector(8 downto 0);
    dib:              in std_logic_vector(31 downto 0);
    dob:              out std_logic_vector(31 downto 0)
  );

end entity dp_ram_2k_8_32;

architecture behave of dp_ram_2k_8_32 is

  signal dpa: std_logic_vector(0 downto 0) := (others=>'X');
  signal dpb: std_logic_vector(3 downto 0) := (others=>'X');

begin

  ram: RAMB16_S9_S36
    port map (
      DOA   => doa,
      DOB   => dob,
      DOPA  => open,
      DOPB  => open,
  
      ADDRA => addra,
      ADDRB => addrb,
      CLKA  => clka,
      CLKB  => clkb,
      DIA   => dia,
      DIB   => dib,
      DIPA  => dpa,
      DIPB  => dpb,
      ENA   => ena,
      ENB   => enb,
      SSRA  => '0',
      SSRB  => '0',
      WEA   => wea,
      WEB   => web
    );

end behave;
