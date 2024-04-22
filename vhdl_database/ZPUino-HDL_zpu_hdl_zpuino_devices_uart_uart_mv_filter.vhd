--
--  UART for ZPUINO - Majority voting filter
-- 
--  Copyright 2011 Alvaro Lopes <alvieboy@alvie.com>
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

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity uart_mv_filter is
  generic (
    bits: natural;
    threshold: natural
  );
  port (
    clk:      in std_logic;
	 	rst:      in std_logic;
    sin:      in std_logic;
    sout:     out std_logic;
    clear:    in std_logic;
    enable:   in std_logic
  );
end entity uart_mv_filter;

architecture behave of uart_mv_filter is

signal count_q: unsigned(bits-1 downto 0);

begin

process(clk)
begin
  if rising_edge(clk) then
    if rst='1' then
      count_q <= (others => '0');
      sout <= '0';
    else
      if clear='1' then
        count_q <= (others => '0');
        sout <= '0';
      else
        if enable='1' then
          if sin='1' then
            count_q <= count_q + 1;
          end if;
        end if;
        if (count_q >= threshold) then
          sout<='1';
        end if;
      end if;
    end if;
  end if;
end process;

end behave;
