--
--  General-purpose FIFO for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all; 


entity fifo is
  generic (
    bits: integer := 11;
    datawidth: integer := 8
  );
  port (
    clk:      in std_logic;
    rst:      in std_logic;
    wr:       in std_logic;
    rd:       in std_logic;
    write:    in std_logic_vector(datawidth-1 downto 0);
    read :    out std_logic_vector(datawidth-1 downto 0);
    full:     out std_logic;
    empty:    out std_logic
  );
end entity fifo;

architecture behave of fifo is

  type mem_t is array (0 to ((2**bits)-1)) of std_logic_vector(datawidth-1 downto 0);

  signal memory:  mem_t;

  signal wraddr: unsigned(bits-1 downto 0);
  signal rdaddr: unsigned(bits-1 downto 0);

begin

  process(clk)
  begin
    if rising_edge(clk) then
      read <= memory( conv_integer(std_logic_vector(rdaddr)) );
    end if;
  end process;

  process(clk,rdaddr,wraddr,rst)
    variable full_v: std_logic;
    variable empty_v: std_logic;
  begin
  
    if rdaddr=wraddr then
      empty_v:='1';
    else
      empty_v:='0';
    end if;

    if wraddr=rdaddr-1 then
      full_v:='1';
    else
      full_v:='0';
    end if;

    if rising_edge(clk) then
      if rst='1' then
        wraddr <= (others => '0');
        rdaddr <= (others => '0');
      else
  
        if wr='1' and full_v='0' then
          memory(conv_integer(std_logic_vector(wraddr) ) ) <= write;
          wraddr <= wraddr+1;
        end if;
  
        if rd='1' and empty_v='0' then
          rdaddr <= rdaddr+1;
        end if;
      end if;

      full <= full_v;
      empty <= empty_v;

    end if;


  end process;
end behave;

