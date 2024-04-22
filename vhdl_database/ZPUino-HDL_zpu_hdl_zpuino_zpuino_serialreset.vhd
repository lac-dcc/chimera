--
--  Serial reset for ZPUINO
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

--
--  This module causes a synchronous reset when we receive 0xFF at 300 baud.
--  Hopefully no other speed setting will cause this.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity zpuino_serialreset is
  generic (
    SYSTEM_CLOCK_MHZ: integer := 100
  );
  port (
    clk:      in std_logic;
    rx:       in std_logic;
    rstin:    in std_logic;
    rstout:   out std_logic
  );
end entity zpuino_serialreset;


architecture behave of zpuino_serialreset is

constant rstcount_val: integer := ((SYSTEM_CLOCK_MHZ*1000000)/300)*8;

signal rstcount: integer;
signal rstcount_zero_q: std_logic;

begin

  rstout<='1' when rstin='1' or rstcount_zero_q='1' else '0';

  process(clk)
  begin
    if rising_edge(clk) then
      if rstin='1' then
        rstcount <= rstcount_val;
        rstcount_zero_q <= '0';
      else
        if rx='1' then
          rstcount <= rstcount_val;
        else
          if rstcount/=0 then
            rstcount <= rstcount - 1;
            rstcount_zero_q<='0';
          else
            rstcount_zero_q<='1';
          end if;
        end if;
      end if;
    end if;
  end process;

end behave;
