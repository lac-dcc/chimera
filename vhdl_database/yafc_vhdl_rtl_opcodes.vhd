--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.common.all;

package opcodes is

  -- literal
  -- jump
  -- 0branch
  -- 1branch
  -- function

  subtype mcode is std_logic_vector( 1 downto 0 );
  constant m_func : mcode := "00";
  constant m_jump : mcode := "01";
  constant m_0bra : mcode := "10";
  constant m_call : mcode := "11";

  -- TODO: reorganize these
  subtype fcode is std_logic_vector( 4 downto 0 );
  constant f_nop : fcode := "00000";    -- NOP
  constant f_add : fcode := "00001";       -- +
  constant f_sub : fcode := "00010";       -- -
--  constant AVAILABLE : fcode := "00011";
  constant f_sla : fcode := "00100";       -- 2* (arithmetic)
  constant f_sra : fcode := "00101";       -- 2/ (arithmetic)
  constant f_dup : fcode := "00110";       -- dup
  constant f_not : fcode := "00111";       -- not
  constant f_ftc : fcode := "01000";       -- @
  constant f_str : fcode := "01001";       -- !
  constant f_dtr : fcode := "01010";       -- >R
  constant f_pop : fcode := "01011";       -- drop
  constant f_rtd : fcode := "01100";       -- <R
  constant f_rot : fcode := "01101";		  -- rot
  constant f_nrt : fcode := "01110";		  -- -rot (nrot)
  constant f_swp : fcode := "01111";		  -- swap
  constant f_nip : fcode := "10000";		  -- nip
  constant f_tck : fcode := "10001";		  -- tuck
  constant f_ovr : fcode := "10010";		  -- over
  constant f_equ : fcode := "10011";      -- equals (=)
  
  -- I/O bus
  constant f_ioo : fcode := "10100";      -- IO!
  constant f_ioi : fcode := "10101";      -- IO@
  
  -- stuff I haven't needed yet, but I'm too lazy to reorganize these right now :-)
  constant f_or  : fcode := "10110";      -- or
  constant f_and : fcode := "10111";      -- and

  -- Subcodes (single bit in an instruction word - function master codes)
  constant s_ret : integer range 0 to word'length := 7;

end opcodes;

package body opcodes is
end opcodes;
