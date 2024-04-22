--
--  Generic dual-port RAM read-first (symmetric)
-- 
--  Copyright 2011 Alvaro Lopes <alvieboy@alvie.com>
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

entity generic_dp_ram_rf is
  generic (
    address_bits: integer := 8;
    data_bits: integer := 32
  );
  port (
    clka:             in std_logic;
    ena:              in std_logic;
    wea:              in std_logic;
    addra:            in std_logic_vector(address_bits-1 downto 0);
    dia:              in std_logic_vector(data_bits-1 downto 0);
    doa:              out std_logic_vector(data_bits-1 downto 0);
    clkb:             in std_logic;
    enb:              in std_logic;
    web:              in std_logic;
    addrb:            in std_logic_vector(address_bits-1 downto 0);
    dib:              in std_logic_vector(data_bits-1 downto 0);
    dob:              out std_logic_vector(data_bits-1 downto 0)
  );

end entity generic_dp_ram_rf;

architecture behave of generic_dp_ram_rf is


  subtype RAM_WORD is STD_LOGIC_VECTOR (data_bits-1 downto 0);

  type RAM_TABLE is array (0 to (2**address_bits) - 1) of RAM_WORD;
  shared variable RAM: RAM_TABLE;

  signal clkb_dly: std_logic;
  signal enb_dly: std_logic;
  signal addrb_dly: std_logic_vector(address_bits-1 downto 0);
  signal dib_dly:  std_logic_vector(data_bits-1 downto 0);
  signal web_dly: std_logic;
begin

  clkb_dly <=  transport clkb after 50 ps;
  addrb_dly <= transport addrb after 100 ps;
  dib_dly   <= transport dib after 100 ps;
  web_dly   <= transport web after 100 ps;
  enb_dly   <= transport enb after 100 ps;

  process (clka)
  begin
    if rising_edge(clka) then
      if ena='1' then
        doa <= RAM(conv_integer(addra)) ;
        if wea='1' then
          RAM( conv_integer(addra) ) := dia;
        end if;
      end if;
    end if;
  end process;

  process (clkb_dly)
  begin
    if rising_edge(clkb_dly) then
      if enb_dly='1' then
        dob <= RAM(conv_integer(addrb_dly)) ;
        if web_dly='1' then
          RAM( conv_integer(addrb_dly) ) := dib_dly;
        end if;
      end if;
    end if;
  end process;

end behave; 
