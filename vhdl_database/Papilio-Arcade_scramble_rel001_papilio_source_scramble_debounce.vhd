--
-- A simulation model of Scramble hardware
-- Copyright (c) MikeJ - Feb 2007
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

library UNISIM;
  use UNISIM.Vcomponents.all;

entity SCRAMBLE_DEBOUNCE is
  generic (
    G_WIDTH           : in    integer
    );
  port (
    I_BUTTON          : in    std_logic_vector(G_WIDTH-1 downto 0); -- active high
    O_BUTTON          : out   std_logic_vector(G_WIDTH-1 downto 0);
    CLK               : in    std_logic
    );
end;

architecture RTL of SCRAMBLE_DEBOUNCE is

  signal tick_counter : std_logic_vector(12 downto 0);
  signal button_reg   : std_logic_vector(G_WIDTH-1 downto 0);
  signal button       : std_logic_vector(G_WIDTH-1 downto 0);
begin

  p_debounce : process
    variable tick : boolean;
  begin
    wait until rising_edge(CLK);
    button_reg <= I_BUTTON;

    tick := (tick_counter(12) = '1');
    -- pragma translate_off
    -- synopsys translate_off
    tick := true;
    -- synopsys translate_on
    -- pragma translate_on
    if tick then
      tick_counter <= '0' & x"FFE";
    else
      tick_counter <= tick_counter - "1";
    end if;
    -- tick approx 1.5KHz

    for i in 0 to G_WIDTH-1 loop
      if (button_reg(i) = '1') then
        button(i) <= '1';
      elsif tick then
        button(i) <= '0';
      end if;
    end loop;
  end process;

  O_BUTTON <= button;

end architecture RTL;
