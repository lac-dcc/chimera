--
-- A simulation model of Asteroids Deluxe hardware
-- Copyright (c) MikeJ - May 2004
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

    --
    -- Notes :
    --
    -- Button shorts input to ground when pressed
	 -- 
	 -- ToDo:
			-- Model sound effects for thump-thump, ship and saucer fire and saucer warble 
			-- Add player control switching and screen flip for cocktail mode 
			-- General cleanup



library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

entity BWIDOW_TOP is
	port (
		clk_12       : in  std_logic;
		clk_50       : in  std_logic;
    RESET_L      : in  std_logic;

		BUTTON       : in  std_logic_vector(14 downto 0); -- active low
	 
		SW_B4				 : in  std_logic_vector(7 downto 0);
		SW_D4				 : in  std_logic_vector(7 downto 0);
		AUDIO_OUT    : out std_logic_vector(7 downto 0);
		SELF_TEST_SWITCH_L: in		std_logic; 
    
		VIDEO_R_OUT  : out   std_logic_vector(3 downto 0);
		VIDEO_G_OUT  : out   std_logic_vector(3 downto 0);
		VIDEO_B_OUT  : out   std_logic_vector(3 downto 0);

		HSYNC_OUT    : out   std_logic;
		VSYNC_OUT    : out   std_logic;
		VGA_DE       : out std_logic;
		VID_HBLANK   : out std_logic;
		VID_VBLANK   : out std_logic;

		cpu_rom_addr    : out std_logic_vector(14 downto 0);
		cpu_rom_data    : in  std_logic_vector( 7 downto 0);
		vector_rom_addr : out std_logic_vector(13 downto 0);
		vector_rom_data : in  std_logic_vector( 7 downto 0);
		vector_ram_addr : out std_logic_vector(10 downto 0);
		vector_ram_dout : in  std_logic_vector(15 downto 0);
		vector_ram_din  : out std_logic_vector(15 downto 0);
		vector_ram_we   : out std_logic;
		vector_ram_cs1  : out std_logic;
		vector_ram_cs2  : out std_logic
    );
end;

architecture RTL of BWIDOW_TOP is

  signal clk_cnt              : std_logic_vector(2 downto 0) := "000";

  signal x_vector             : std_logic_vector(9 downto 0);
  signal y_vector             : std_logic_vector(9 downto 0);
  signal z_vector             : std_logic_vector(7 downto 0);
  signal beam_on              : std_logic;
  signal beam_ena             : std_logic;

  signal rgb	:			STD_LOGIC_VECTOR(2 downto 0);

begin

  --
  -- Note about clocks
  --
  -- (the original uses a 6.048 MHz clock, so 40 / 6  - slightly slower)
  --

	mybwidow: entity work.bwidow
		port map (
			clk => clk_12,
			reset_h => not RESET_L,
			analog_sound_out => AUDIO_OUT,
			analog_x_out => x_vector,
			analog_y_out => y_vector,
			analog_z_out => z_vector,
			BEAM_ENA          => beam_ena,
			rgb_out => rgb,
			dbg => open,
			buttons => button,
			SW_B4 => SW_B4,
			SW_D4 => SW_D4,

			cpu_rom_addr      => cpu_rom_addr,
			cpu_rom_data      => cpu_rom_data,
			vector_rom_addr   => vector_rom_addr,
			vector_rom_data   => vector_rom_data,
			vector_ram_addr   => vector_ram_addr,
			vector_ram_din    => vector_ram_din,
			vector_ram_dout   => vector_ram_dout,
			vector_ram_we     => vector_ram_we,
			vector_ram_cs1    => vector_ram_cs1,
			vector_ram_cs2    => vector_ram_cs2
		);

	u_SB : entity work.BWIDOW_SB
		port map (
			RESET            => not RESET_L,
			clk_vidx2        => clk_50,
			clk_12           => clk_12,

			X_VECTOR         => not x_vector(9) & x_vector(8 downto 0),
			Y_VECTOR         => not y_vector(9) & y_vector(8 downto 0),
			Z_VECTOR         =>  z_vector,
--			RGB	             => rgb,
			BEAM_ON          => rgb(0) or rgb(1) or rgb(2),
			BEAM_ENA         => beam_ena,

      VIDEO_R_OUT      => VIDEO_R_OUT,
      VIDEO_G_OUT      => VIDEO_G_OUT,
      VIDEO_B_OUT      => VIDEO_B_OUT,
      HSYNC_OUT        => HSYNC_OUT,
      VSYNC_OUT        => VSYNC_OUT,
			VID_DE           => VGA_DE,
			VID_HBLANK       => VID_HBLANK,
			VID_VBLANK       => VID_VBLANK
	);

end RTL;
