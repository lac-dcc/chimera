--
-- A simulation model of invaders hardware
-- Copyright (c) MikeJ - January 2006
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
-- version 300 initial release of this file
--
use std.textio.ALL;
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity INVADERS_TOP_TB is
end;

architecture Sim of INVADERS_TOP_TB is

  signal button      : std_logic_vector(9 downto 0); -- active low
  signal video_r     : std_logic;
  signal video_g     : std_logic;
  signal video_b     : std_logic;
  signal hsync       : std_logic;
  signal vsync       : std_logic;
  signal clk_ref     : std_logic;
  signal reset       : std_logic;

  constant CLKPERIOD : time := 20 ns;

begin

  p_clk_ref  : process
  begin
    clk_ref <= '0';
    wait for CLKPERIOD / 2;
    clk_ref <= '1';
    wait for CLKPERIOD - (CLKPERIOD / 2);
  end process;

  p_rst : process
  begin
    reset <= '1';
    wait for 100 ns;
    reset <= '0';
    wait;
  end process;

  button <= (others => 'H');

  u0 : entity work.invaders_top
    port map(
      STRATAFLASH_OE    => open,
      STRATAFLASH_CE    => open,
      STRATAFLASH_WE    => open,
      --
      O_VIDEO_R         => video_r,
      O_VIDEO_G         => video_g,
      O_VIDEO_B         => video_b,
      O_HSYNC           => hsync,
      O_VSYNC           => vsync,
      --
      O_AUDIO_L         => open,
      O_AUDIO_R         => open,
      --
      I_RESET           => reset,
      I_CLK_REF         => clk_ref
      );

end Sim;

