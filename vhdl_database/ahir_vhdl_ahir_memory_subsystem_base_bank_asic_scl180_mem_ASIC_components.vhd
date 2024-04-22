------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai, Ch. V. Kalyani
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
--------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.types.all;
use ahir.utilities.all;

package mem_ASIC_components is

  component dpram_5X4 is
   port(       AB,A2  : in std_logic_vector(4 downto 0);
      I1,I2  : in std_logic_vector(3 downto 0);
      CE1,CE2,CSB1,CSB2,WEBB,WEB2: in std_logic;
      O1,O2 : out std_logic_vector(3 downto 0));
  end component;
  component obc11_dpram_4X8 is
   port(       AB,A2  : in std_logic_vector(3 downto 0);
      I1,I2  : in std_logic_vector(7 downto 0);
      CE1,CE2,CSB1,CSB2,WEBB,WEB2: in std_logic;
      O1,O2 : out std_logic_vector(7 downto 0));
  end component;
  component dpram_5X8 is
   port(       AB,A2  : in std_logic_vector(4 downto 0);
      I1,I2  : in std_logic_vector(7 downto 0);
      CE1,CE2,CSB1,CSB2,WEBB,WEB2: in std_logic;
      O1,O2 : out std_logic_vector(7 downto 0));
  end component;
  component spram_4X4 is
   port(       A : in std_logic_vector(3 downto 0);
      I  : in std_logic_vector(3 downto 0);
      CE, CSB, WEB: in std_logic;
      O  : out std_logic_vector(3 downto 0));
  end component;
  component spram_5X16 is
   port(       A : in std_logic_vector(4 downto 0);
      I  : in std_logic_vector(15 downto 0);
      CE, CSB, WEB: in std_logic;
      O  : out std_logic_vector(15 downto 0));
  end component;
  component obc11_8X8 is
   port(       A : in std_logic_vector(7 downto 0);
      I  : in std_logic_vector(7 downto 0);
      CE, CSB, WEB: in std_logic;
      O  : out std_logic_vector(7 downto 0));
  end component;
  component spram_9X24 is
   port(       A : in std_logic_vector(8 downto 0);
      I  : in std_logic_vector(23 downto 0);
      CE, CSB, WEB: in std_logic;
      O  : out std_logic_vector(23 downto 0));
  end component;
  component fake_1r1w_1X1 is
   port(   FAKEIN:in std_logic; FAKEOUT: out std_logic );
  end component;
  component fake_1r1w_2X2 is
   port(   FAKEIN:in std_logic; FAKEOUT: out std_logic );
  end component;
end package;

