--
-- A simulation model of Lunar Lander hardware 
-- James Sweet 2019
-- This is not endorsed by fpgaarcade, please do not bother MikeJ with support requests
--
-- Built upon model of Asteroids Deluxe hardware
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

entity LLANDER_TOP is
  port (
		ROT_LEFT_L			: in	std_logic;
		ROT_RIGHT_L			: in	std_logic;
		ABORT_L				: in	std_logic;
		GAME_SEL_L			: in	std_logic;
		START_L				: in	std_logic;
		COIN1_L				: in	std_logic;
		COIN2_L				: in	std_logic;
		-- 
		THRUST 				: in	std_logic_vector(7 downto 0);
		-- 
		DIAG_STEP_L			: in	std_logic;
		SLAM_L				: in	std_logic;
		SELF_TEST_L			: in	std_logic;
		-- 
		START_SEL_L			: out std_logic;
		LAMP2					: out std_logic;
		LAMP3					: out std_logic;
		LAMP4					: out std_logic;
		LAMP5					: out std_logic;


		AUDIO_OUT         : out   std_logic_vector(7 downto 0);    
		VIDEO_R_OUT       : out   std_logic_vector(3 downto 0);
		VIDEO_G_OUT       : out   std_logic_vector(3 downto 0);
		VIDEO_B_OUT       : out   std_logic_vector(3 downto 0);

		HSYNC_OUT         : out   std_logic;
		VSYNC_OUT         : out   std_logic;
		VGA_DE				: out std_logic;
		VID_HBLANK			: out std_logic;
		VID_VBLANK			: out std_logic;

		DIP					: in std_logic_vector(7 downto 0);
	 
		RESET_L           : in    std_logic;

		-- ref clock in
		clk_6           : in  std_logic;
		clk_50          : in  std_logic;

		cpu_rom_addr    : out   std_logic_vector(12 downto 0);   
		cpu_rom_data    : in std_logic_vector(7 downto 0);

		vector_rom_addr : out   std_logic_vector(12 downto 0);   
		vector_rom_data	: in std_logic_vector(7 downto 0);
		vector_ram_addr : out std_logic_vector( 9 downto 0);
		vector_ram_dout : in  std_logic_vector(15 downto 0);
		vector_ram_din  : out std_logic_vector(15 downto 0);
		vector_ram_we   : out std_logic;
		vector_ram_cs1  : out std_logic;
		vector_ram_cs2  : out std_logic

	);
end;

architecture RTL of LLANDER_TOP is
  signal reset_dll_h          : std_logic;
  signal delay_count          : std_logic_vector(7 downto 0) := (others => '0');
  signal reset_6_l            : std_logic;
  signal reset_6              : std_logic;
  signal clk_cnt              : std_logic_vector(2 downto 0) := "000";
  signal x_vector             : std_logic_vector(9 downto 0);
  signal y_vector             : std_logic_vector(9 downto 0);
  signal y_vector_w_offset    : std_logic_vector(9 downto 0);
  signal z_vector             : std_logic_vector(3 downto 0);
  signal beam_on              : std_logic;
  signal beam_ena             : std_logic;

begin

  --
  -- Note about clocks
  --
  -- (the original uses a 6.048 MHz clock, so 40 / 6  - slightly slower)
  --

  reset_dll_h <= not RESET_L;
  reset_6 <= reset_dll_h;

  p_delay : process(RESET_L, clk_6)
  begin
    if (RESET_L = '0') then
      delay_count <= x"00"; -- longer delay for cpu
      reset_6_l <= '0';
    elsif rising_edge(clk_6) then
      if (delay_count(7 downto 0) = (x"FF")) then
        delay_count <= (x"FF");
        reset_6_l <= '1';
      else
        delay_count <= delay_count + "1";
        reset_6_l <= '0';
      end if;
    end if;
  end process;

  LLander: entity work.llander 
port map(
		clk_6 				=> clk_6,
		reset_6_l 			=> reset_6_l,
		dip => DIP,
		rot_left_l 			=> rot_left_l,
		rot_right_l 		=> rot_right_l,
		abort_l 				=> abort_l,
		game_sel_l 			=> game_sel_l,
		start_l 				=> start_l,
		coin1_l 				=> coin1_l,
		coin2_l 				=> coin2_l,
		thrust 				=> thrust,
		diag_step_l 		=> diag_step_l,
		slam_l 				=> '1', --switches(15),
		self_test_l 		=> self_test_l,
		start_sel_l 		=> start_sel_l,
		lamp2 				=> lamp2,
		lamp3 				=> lamp3,
		lamp4 				=> lamp4,
		lamp5 				=> lamp5,
		coin_ctr 			=> open,			
		audio_out 			=> AUDIO_OUT,
		x_vector 			=> x_vector,
		y_vector 			=> y_vector,
		z_vector 			=> z_vector,
		beam_on 				=> beam_on,
      BEAM_ENA  			=> beam_ena,
		cpu_rom_addr  		=> cpu_rom_addr,
		cpu_rom_data  		=> cpu_rom_data,
		vector_rom_addr  	=> vector_rom_addr, 
		vector_rom_data  	=> vector_rom_data,
		vector_ram_addr   => vector_ram_addr,
		vector_ram_din    => vector_ram_din,
		vector_ram_dout   => vector_ram_dout,
		vector_ram_we     => vector_ram_we,
		vector_ram_cs1    => vector_ram_cs1,
		vector_ram_cs2    => vector_ram_cs2
		);

	y_vector_w_offset<= y_vector+100;
		
  u_SB : entity work.LLANDER_SB
    port map (
			RESET            	=> reset_6,
			clk_vidx2         => clk_50,
			clk_6             => clk_6,

			X_VECTOR         	=> x_vector,
			Y_VECTOR         	=> y_vector_w_offset,-- AJS move up y_vector,
			Z_VECTOR         	=> z_vector,

			BEAM_ON         	=> beam_on,
			BEAM_ENA         	=> beam_ena,

			VIDEO_R_OUT      	=> VIDEO_R_OUT,
			VIDEO_G_OUT      	=> VIDEO_G_OUT,
			VIDEO_B_OUT      	=> VIDEO_B_OUT,
			HSYNC_OUT        	=> HSYNC_OUT,
			VSYNC_OUT        	=> VSYNC_OUT,
			VID_DE            => VGA_DE,
			VID_HBLANK        => VID_HBLANK,
			VID_VBLANK        => VID_VBLANK
		);

end RTL;
