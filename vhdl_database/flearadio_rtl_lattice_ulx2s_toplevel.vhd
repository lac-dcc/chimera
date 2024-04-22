----------------------------------------------------------------------------------
-- ********* ULX2S-FPGA Platform example - Digital FM Radio ********
-- 
-- Top-level wrapper for linking the FM Radio example to the 
-- ULX2S Platform.
--
-- Creation Date: 25th Dec 2015
-- Author: Emard
--
-- Copyright (C) 2015 Emard
-- 
-- This source file may be used and distributed without 
-- restriction provided that this copyright statement is not 
-- removed from the file and that any derivative work contains 
-- the original copyright notice and the associated disclaimer.
-- 
-- This source file is free software; you can redistribute it 
-- and/or modify it under the terms of the GNU Lesser General 
-- Public License as published by the Free Software Foundation;
-- either version 2.1 of the License, or (at your option) any 
-- later version. 
-- 
-- This source is distributed in the hope that it will be 
-- useful, but WITHOUT ANY WARRANTY; without even the implied 
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
-- PURPOSE. See the GNU Lesser General Public License for more 
-- details. 
-- 
-- You should have received a copy of the GNU Lesser General 
-- Public License along with this source; if not, download it 
-- from http://www.opencores.org/lgpl.shtml 
-- 
----------------------------------------------------------------------------------/
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity ulx2s_fm_radio is
    port (
	clk_25m: in std_logic;
	rs232_tx: out std_logic;
	rs232_rx: in std_logic;
	flash_so: in std_logic;
	flash_cen, flash_sck, flash_si: out std_logic;
	sdcard_so: in std_logic;
	sdcard_cen, sdcard_sck, sdcard_si: out std_logic;
	p_ring: out std_logic;
	p_tip: out std_logic_vector(3 downto 0);
	led: out std_logic_vector(7 downto 0);
	btn_left, btn_right, btn_up, btn_down, btn_center: in std_logic;
	sw: in std_logic_vector(3 downto 0);
	j1_2, j1_3, j1_4, j1_8, j1_9, j1_13, j1_14, j1_15: inout std_logic;
	j1_16, j1_17, j1_18, j1_19, j1_20, j1_21, j1_22, j1_23: inout std_logic;
	j2_2, j2_3, j2_4, j2_5, j2_6, j2_7, j2_8, j2_9: inout std_logic;
	j2_10, j2_11, j2_12, j2_13, j2_16: inout std_logic;
	sram_a: out std_logic_vector(18 downto 0);
	sram_d: inout std_logic_vector(15 downto 0);
	sram_wel, sram_lbl, sram_ubl: out std_logic
	-- sram_oel: out std_logic -- XXX the old ULXP2 board needs this!
    );
end ulx2s_fm_radio;
   
architecture arch of ulx2s_fm_radio is
  signal both_audio_channels: std_logic;
  signal n_pb1: std_logic;
  signal n_pb2: std_logic;
  signal n_led: std_logic_vector(7 downto 0);
  signal fm_antenna: std_logic;
begin
  -- invert ulx2s buttons to fit FleaFPGA inverted logic
  n_pb1 <= not btn_right;
  n_pb2 <= not btn_left;

  led <= n_led;

  fm_antenna <= j2_16; -- external pin, FM signal enters here
  digital_fm_radio: entity work.FleaFPGA_FM_Radio
  port map (
      rst => btn_center,
      clk => clk_25m,
      LED => n_led,
      PWM_Q => both_audio_channels, -- Mono Audio out
      Sampler_D => fm_antenna, -- FM in
      push_button1 => n_pb1, -- frequency up
      push_button2 => n_pb2  -- frequency down
  );
  -- output audio to 3.5mm jack
  p_ring   <= both_audio_channels;
  p_tip(0) <= both_audio_channels;
  p_tip(1) <= both_audio_channels;
  p_tip(2) <= both_audio_channels;
  p_tip(3) <= both_audio_channels;
end architecture;
