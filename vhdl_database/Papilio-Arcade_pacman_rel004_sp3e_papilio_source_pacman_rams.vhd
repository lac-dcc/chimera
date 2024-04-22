--
-- A simulation model of Pacman hardware
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
-- Email pacman@fpgaarcade.com
--
-- Revision list
--
-- version 003 Jan 2006 release, general tidy up
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

use work.pkg_pacman.all;

entity PACMAN_RAMS is
  port (
    I_AB              : in    std_logic_vector(11 downto 0);
    I_DATA            : in    std_logic_vector( 7 downto 0);
    O_DATA            : out   std_logic_vector( 7 downto 0);
    I_R_W_L           : in    std_logic;
    I_VRAM_L          : in    std_logic;
    ENA_6             : in    std_logic;
    CLK               : in    std_logic
    );
end;

architecture RTL of PACMAN_RAMS is

  signal ram_addr : std_logic_vector(11 downto 0);
  signal dout_ram : std_logic_vector(7 downto 0);
  signal we_ram   : std_logic;

begin
	-- combined rams, simplified decoding logic
  ram_addr <= I_AB(11 downto 0);
  we_ram <= not I_R_W_L and not I_VRAM_L;
  o_data <= dout_ram;

	-- combined vram, cram and wram
	--	vram  1K at I_AB(11 downto 10) = 00
	--	cram  1K at I_AB(11 downto 10) = 01
	--	spare 1K at I_AB(11 downto 10) = 10
	--	wram  1K at I_AB(11 downto 10) = 11

  ramhi : component RAMB16_S4
    port map (
      do   => dout_ram(7 downto 4),
      addr => ram_addr,
      clk  => CLK,
      di   => I_DATA(7 downto 4),
      en   => ENA_6,
      ssr  => '0',
      we   => we_ram
      );

  ramlo : component RAMB16_S4
    port map (
      do   => dout_ram(3 downto 0),
      addr => ram_addr,
      clk  => CLK,
      di   => I_DATA(3 downto 0),
      en   => ENA_6,
      ssr  => '0',
      we   => we_ram
      );

end architecture RTL;
