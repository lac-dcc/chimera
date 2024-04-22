-- Version : 0300
--
-- Copyright (c) 2006 MikeJ
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
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-- The latest version of this file can be found at:
--      http://www.fpgaarcade.com

-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 0300 June 2006 release - initial release of this module

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity INVADERS_CLOCKS is
  port (
    I_CLK_REF         : in    std_logic;
    I_RESET_L         : in    std_logic;
    --
    O_CLK             : out   std_logic;
    O_CLK_X2          : out   std_logic
    );
end;

architecture RTL of INVADERS_CLOCKS is

  signal reset_dcm_h            : std_logic;
  signal clk_ref_ibuf           : std_logic;
  signal clk_dcm_op_0           : std_logic;
  signal clk_dcm_op_dv          : std_logic;
  signal clk_dcm_op_fx          : std_logic;
  signal clk_dcm_0_bufg         : std_logic;
  signal clk_dcm_dv_bufg        : std_logic;
  signal clk_dcm_fx_bufg        : std_logic;
  signal dcm_locked             : std_logic;
  signal oclk                   : std_logic;

  -- The original uses a 9.984 MHz clock
  --
  -- Here we are taking in 32MHz clock
  -- Using the CLKFX we divide by 32 and multiply by 20 to get 20MHz
  -- which is used as the x2 scan doubler VGA clock
  -- We further divide that clock /2 to run the game at 10 MHz (~0.16% fast).
  --

begin

  reset_dcm_h <= not I_RESET_L;
  IBUFG0 : IBUFG port map (I=> I_CLK_REF, O => clk_ref_ibuf);

    dcm_inst : DCM_SP
      generic map (
        DLL_FREQUENCY_MODE    => "LOW",
        DUTY_CYCLE_CORRECTION => TRUE,
        CLKOUT_PHASE_SHIFT    => "NONE",
        PHASE_SHIFT           => 0,
        CLKFX_MULTIPLY        => 20,
        CLKFX_DIVIDE          => 32,
        CLKDV_DIVIDE          => 2.0,
        STARTUP_WAIT          => FALSE,
--		  CLKIN_DIVIDE_BY_2     => FALSE,
        CLKIN_PERIOD          => 31.25
       )
      port map (
        CLKIN    => clk_ref_ibuf,
        CLKFB    => clk_dcm_0_bufg,
        DSSEN    => '0',
        PSINCDEC => '0',
        PSEN     => '0',
        PSCLK    => '0',
        RST      => reset_dcm_h,
        CLK0     => clk_dcm_op_0,
        CLK90    => open,
        CLK180   => open,
        CLK270   => open,
        CLK2X    => open,
        CLK2X180 => open,
        CLKDV    => clk_dcm_op_dv,
        CLKFX    => clk_dcm_op_fx,
        CLKFX180 => open,
        LOCKED   => dcm_locked,
        PSDONE   => open
       );

	halver : process
	begin
		wait until rising_edge (clk_dcm_fx_bufg);
		oclk <= NOT oclk;
	end process;


  BUFG0 : BUFG port map (I=> clk_dcm_op_0,  O => clk_dcm_0_bufg);
--  BUFG1 : BUFG port map (I=> clk_dcm_op_dv, O => clk_dcm_dv_bufg);
  BUFG2 : BUFG port map (I=> clk_dcm_op_fx, O => clk_dcm_fx_bufg);
  --
  O_CLK    <= oclk;
  O_CLK_x2 <= clk_dcm_fx_bufg;
  --
end RTL;
