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

entity SCRAMBLE_TOP is
port (
	O_VIDEO_R        : out std_logic_vector(2 downto 0);
	O_VIDEO_G        : out std_logic_vector(2 downto 0);
	O_VIDEO_B        : out std_logic_vector(2 downto 0);
	O_HSYNC          : out std_logic;
	O_VSYNC          : out std_logic;
   O_HBLANK         : out std_logic;
   O_VBLANK         : out std_logic;

	O_AUDIO          : out std_logic_vector(9 downto 0);

	button_in        : in  std_logic_vector(7 downto 0);

	RESET            : in  std_logic;
	clk              : in  std_logic; -- 25
	ena_star         : in  std_logic;
	ena_6            : in  std_logic; -- 6.25
	ena_1_79         : in  std_logic  -- 1.786          
);
end;

architecture RTL of SCRAMBLE_TOP is
-- this MUST be set true for frogger
-- this MUST be set false for scramble, the_end, amidar
constant I_HWSEL_FROGGER  : boolean := false;

-- ip registers
signal ip_1p            : std_logic_vector(6 downto 0);
signal ip_2p            : std_logic_vector(6 downto 0);
signal ip_service       : std_logic;
signal ip_coin1         : std_logic;
signal ip_coin2         : std_logic;
signal ip_dip_switch    : std_logic_vector(5 downto 1);

-- ties to audio board
signal audio_addr       : std_logic_vector(15 downto 0);
signal audio_data_out   : std_logic_vector(7 downto 0);
signal audio_data_in    : std_logic_vector(7 downto 0);
signal audio_data_oe_l  : std_logic;
signal audio_rd_l       : std_logic;
signal audio_wr_l       : std_logic;
signal audio_iopc7      : std_logic;
signal audio_reset_l    : std_logic;

begin

u_scramble : entity work.SCRAMBLE
port map (
	I_HWSEL_FROGGER       => I_HWSEL_FROGGER,
	--
	O_VIDEO_R             => O_VIDEO_R,
	O_VIDEO_G             => O_VIDEO_G,
	O_VIDEO_B             => O_VIDEO_B,
	O_HSYNC               => O_HSYNC,
	O_VSYNC               => O_VSYNC,
   O_HBLANK              => O_HBLANK,
   O_VBLANK              => O_VBLANK,
	--
	-- to audio board
	--
	O_ADDR                => audio_addr,
	O_DATA                => audio_data_out,
	I_DATA                => audio_data_in,
	I_DATA_OE_L           => audio_data_oe_l,
	O_RD_L                => audio_rd_l,
	O_WR_L                => audio_wr_l,
	O_IOPC7               => audio_iopc7,
	O_RESET_WD_L          => audio_reset_l,
	--
	ENA                   => ena_6,
	ENA_STAR              => ena_star,
	--
	RESET                 => reset,
	CLK                   => clk
);

--
--
-- audio subsystem
--
u_audio : entity work.SCRAMBLE_AUDIO
port map (
	I_HWSEL_FROGGER    => I_HWSEL_FROGGER,
	--
	I_ADDR             => audio_addr,
	I_DATA             => audio_data_out,
	O_DATA             => audio_data_in,
	O_DATA_OE_L        => audio_data_oe_l,
	--
	I_RD_L             => audio_rd_l,
	I_WR_L             => audio_wr_l,
	I_IOPC7            => audio_iopc7,
	--
	O_AUDIO            => O_AUDIO,
	--
	I_1P_CTRL          => ip_1p, -- start, shoot1, shoot2, left,right,up,down
	I_2P_CTRL          => ip_2p, -- start, shoot1, shoot2, left,right,up,down
	I_SERVICE          => ip_service,
	I_COIN1            => ip_coin1,
	I_COIN2            => ip_coin2,
	O_COIN_COUNTER     => open,
	--
	I_DIP              => ip_dip_switch,
	--
	I_RESET_L          => audio_reset_l,
	ENA                => ena_6,
	ENA_1_79           => ena_1_79,
	CLK                => clk
);

--button_in(0) = Joystick Up
--button_in(1) = Joystick Down
--button_in(2) = Joystick Left
--button_in(3) = Joystick Right
--button_in(4) = Button Left
--button_in(5) = Button Down
--button_in(6) = Joystick Fire
--button_in(7) = Button Right

--Buttons are connected to ground and connect to 3.3V when pressed
--Joystick has internal pullup resistor and connects to ground when pressed

--A '0' on the input is active. Inputs are active low.

-- assign inputs
-- start, shoot1, shoot2, left,right,up,down
ip_1p(6) <= button_in(4); -- start 1
ip_1p(5) <= button_in(6); -- shoot1
ip_1p(4) <= button_in(6); -- shoot2
ip_1p(3) <= button_in(2); -- p1 left
ip_1p(2) <= button_in(3); -- p1 right
ip_1p(1) <= button_in(0); -- p1 up
ip_1p(0) <= button_in(1); -- p1 down
--
ip_2p(6) <= button_in(7); -- start 2
ip_2p(5) <= button_in(6);
ip_2p(4) <= button_in(6);
ip_2p(3) <= button_in(2); -- p2 left
ip_2p(2) <= button_in(3); -- p2 right
ip_2p(1) <= button_in(0); -- p2 up
ip_2p(0) <= button_in(1); -- p2 down
--
ip_service <= '1';
ip_coin1   <= button_in(5); -- credit
ip_coin2   <= '1';

-- dip switch settings
scramble_dips : if (not I_HWSEL_FROGGER) generate
begin
	--SW #1   SW #2       Rockets              SW #3       Cabinet
	-------   -----      ---------             -----       --------
	--OFF     OFF       Unlimited              OFF        Table
	--OFF     ON            5                  ON         Up Right
	--ON      OFF           4
	--ON      ON            3


	--SW #4   SW #5      Coins/Play
	-------   -----      ----------
	--OFF     OFF           4
	--OFF     ON            3
	--ON      OFF           2
	--ON      ON            1

	ip_dip_switch(5 downto 4)  <= not "11"; -- 1 play/coin.
	ip_dip_switch(3)           <= not '1';
	ip_dip_switch(2 downto 1)  <= not "10";
end generate;

frogger_dips : if (    I_HWSEL_FROGGER) generate
begin
	--1   2   3   4   5       Meaning
	-------------------------------------------------------
	--On  On                  3 Frogs
	--On  Off                 5 Frogs
	--Off On                  7 Frogs
	--Off Off                 256 Frogs (!)
	--
	--        On              Upright unit
	--        Off             Cocktail unit
	--
	--            On  On      1 coin 1 play
	--            On  Off     2 coins 1 play
	--            Off On      3 coins 1 play
	--            Off Off     1 coin 2 plays

	ip_dip_switch(5 downto 4)  <= not "11";
	ip_dip_switch(3)           <= not '1';
	ip_dip_switch(2 downto 1)  <= not "01";
end generate;

end RTL;