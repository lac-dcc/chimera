--
--  ZPUINO IO pads
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

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package pad is


component iopad is
  port(
    I: in std_logic;
    O: out std_logic;
    T: in std_logic;
    C: in std_logic;
    PAD: inout std_logic
  );
end component iopad;

component ipad is
  port  (
    O: out std_logic;
    C: in std_logic;
    PAD: in std_logic
  );
end component ipad;

component opad is
  port  (
    I: in std_logic;
    O: out std_logic;
    PAD: out std_logic
  );
end component opad;

component isync is
  port  (
    I: in std_logic;
    O: out std_logic;
    C: in std_logic
  );
end component isync;

end package pad;
--
-- Start
--
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity isync is
  port  (
    I: in std_logic;
    O: out std_logic;
    C: in std_logic
  );
end entity isync;

architecture behave of isync is

  signal s: std_logic;
begin

  process(C)
  begin
    if rising_edge(C) then
      s<=I;
      O<=s;
    end if;
  end process;

end behave;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.pad.all;

entity iopad is
  port (
    I: in std_logic;
    O: out std_logic;
    T: in std_logic;
    C: in std_logic;
    PAD: inout std_logic
  );
end entity iopad;

architecture behave of iopad is
begin

  sync: isync
  port map (
    I => PAD,
    O => O,
    C => C
  );

  -- Tristate generator

  process(I,T)
  begin
    if T='1' then
      PAD<='Z';
    else
      PAD<=I;
    end if;
  end process;

end behave;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.pad.all;

entity ipad is
  port  (
    O: out std_logic;
    C: in std_logic;
    PAD: in std_logic
  );
end entity ipad;

architecture behave of ipad is
signal s: std_logic;
begin

  sync: isync
  port map (
    I => PAD,
    O => O,
    C => C
  );

end behave;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.pad.all;

entity opad is
  port  (
    I: in std_logic;
    O: out std_logic;
    PAD: out std_logic
  );
end entity opad;

architecture behave of opad is
begin

  PAD <= I;
  O<=I;

end behave;
