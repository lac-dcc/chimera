------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
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
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity BinaryEncoder is
  generic (name:string; iwidth: integer := 3; owidth: integer := 3);
  port(din: in std_logic_vector(iwidth-1 downto 0);
       dout: out std_logic_vector(owidth-1 downto 0));
end BinaryEncoder;


architecture LowLevel of BinaryEncoder is
  signal ival : integer range 0 to iwidth-1;
  constant awidth : integer := Minimum(Maximum(Ceil_Log2(iwidth),1),owidth);
begin  -- LowLevel

  process(din)
    variable ivar : integer range 0 to iwidth-1;
  begin
    ivar := 0;
    for I in 0 to iwidth-1 loop
      if(din(I) = '1') then
        ivar := I;
        exit;
      end if;
    end loop;
    ival <= ivar;
  end process;

  process(ival)
    variable doutvar : std_logic_vector(owidth-1 downto 0);
  begin
    doutvar := (others => '0');
    doutvar(awidth-1 downto 0) := To_SLV(To_Unsigned(ival,awidth));
    dout <= doutvar;
  end process;
    

end LowLevel;
