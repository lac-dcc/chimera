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

use std.textio.ALL;
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

entity SCRAMBLE_TOP_TB is
end;

architecture Sim of SCRAMBLE_TOP_TB is

  signal button      : std_logic_vector(3 downto 0);
  signal sw          : std_logic_vector(3 downto 0);
  signal video_r     : std_logic_vector(3 downto 0);
  signal video_g     : std_logic_vector(3 downto 0);
  signal video_b     : std_logic_vector(3 downto 0);
  signal hsync       : std_logic;
  signal vsync       : std_logic;
  signal clk_ref     : std_logic;
  signal reset       : std_logic;

  constant CLKPERIOD : time := 25 ns;

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

  button <= (others => 'L');
  sw     <= (others => 'L');

  u0 : entity work.SCRAMBLE_TOP
    port map(
      O_STRATAFLASH_ADDR    => open,
      B_STRATAFLASH_DATA    => "HHHHHHHH",
      O_STRATAFLASH_CE_L    => open,
      O_STRATAFLASH_OE_L    => open,
      O_STRATAFLASH_WE_L    => open,
      O_STRATAFLASH_BYTE    => open,
      -- disable other onboard devices
      O_LCD_RW              => open,
      O_LCD_E               => open,
      O_SPI_ROM_CS          => open,
      O_SPI_ADC_CONV        => open,
      O_SPI_DAC_CS          => open,
      O_PLATFORMFLASH_OE    => open,
      --
      O_VIDEO_R             => video_r,
      O_VIDEO_G             => video_g,
      O_VIDEO_B             => video_b,
      O_HSYNC               => hsync,
      O_VSYNC               => vsync,
      --
      O_AUDIO_L             => open,
      O_AUDIO_R             => open,
      --
      I_SW                  => sw,
      I_BUTTON              => button,
      O_LED                 => open,
      --
      I_RESET               => reset,
      I_CLK_REF             => clk_ref
      );

end Sim;

