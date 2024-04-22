--
-- VHDL conversion by MikeJ - October 2002
--
-- video scan doubler
--
-- based on a design by Tatsuyuki Satoh
--
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
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity DBLSCAN is
  port (
	RGB_IN        : in    std_logic_vector(7 downto 0);
	HSYNC_IN      : in    std_logic;
	VSYNC_IN      : in    std_logic;

	RGB_OUT       : out   std_logic_vector(7 downto 0);
	HSYNC_OUT     : out   std_logic;
	VSYNC_OUT     : out   std_logic;
	--  NOTE CLOCKS MUST BE PHASE LOCKED !!
	CLK           : in    std_logic; -- input pixel clock (6MHz)
	CLK_X2        : in    std_logic  -- output clock      (12MHz)
	);
end;

architecture RTL of DBLSCAN is
  --
  -- input timing
  --
  signal hsync_in_t1 : std_logic;
  signal vsync_in_t1 : std_logic;
  signal hpos_i : std_logic_vector(10 downto 0) := (others => '0');    -- input capture postion
  signal ibank : std_logic;
  signal we_a : std_logic;
  signal we_b : std_logic;
  --
  -- output timing
  --
  signal hpos_o : std_logic_vector(10 downto 0) := (others => '0');
  signal ohs : std_logic;
  signal ohs_t1 : std_logic;
  signal ovs : std_logic;
  signal ovs_t1 : std_logic;
  signal obank : std_logic;
  signal obank_t1 : std_logic;
  --
  signal vs_cnt : std_logic_vector(2 downto 0);
  signal rgb_out_a : std_logic_vector(7 downto 0);
  signal rgb_out_b : std_logic_vector(7 downto 0);
begin

  p_input_timing : process
	variable rising_h : boolean;
	variable rising_v : boolean;
  begin
	wait until rising_edge (CLK);
	hsync_in_t1 <= HSYNC_IN;
	vsync_in_t1 <= VSYNC_IN;

	rising_h := (HSYNC_IN = '1') and (hsync_in_t1 = '0');
	rising_v := (VSYNC_IN = '1') and (vsync_in_t1 = '0');

	if rising_v then
	  ibank <= '0';
	elsif rising_h then
	  ibank <= not ibank;
	end if;

	if rising_h then
	  hpos_i <= (others => '0');
	else
	  hpos_i <= hpos_i + "1";
	end if;

  end process;

  we_a <=     ibank;
  we_b <= not ibank;

  u_ram_a : RAMB16_S9_S9
	port map (
	  -- output
	  DOPB  => open,
	  DOB   => rgb_out_a,
	  DIPB  => "0",
	  DIB   => x"00",
	  ADDRB => hpos_o, -- 10..0
	  WEB   => '0',
	  ENB   => '1',
	  SSRB  => '0',
	  CLKB  => CLK_X2,

	  -- input
	  DOPA  => open,
	  DOA   => open,
	  DIPA   => "0",
	  DIA   => RGB_IN,
	  ADDRA => hpos_i,
	  WEA   => we_a,
	  ENA   => '1',
	  SSRA  => '0',
	  CLKA  => CLK
	  );

  u_ram_b : RAMB16_S9_S9
	port map (
	  -- output
	  DOPB  => open,
	  DOB   => rgb_out_b,
	  DIPB  => "0",
	  DIB   => x"00",
	  ADDRB => hpos_o,
	  WEB   => '0',
	  ENB   => '1',
	  SSRB  => '0',
	  CLKB  => CLK_X2,

	  -- input
	  DOPA  => open,
	  DOA   => open,
	  DIPA   => "0",
	  DIA   => RGB_IN,
	  ADDRA => hpos_i,
	  WEA   => we_b,
	  ENA   => '1',
	  SSRA  => '0',
	  CLKA  => CLK
	  );

  p_output_timing : process
	variable falling_h : boolean;
  begin
	wait until rising_edge (CLK_X2);
	falling_h := ((ohs = '0') and (ohs_t1 = '1'));

	if falling_h or (hpos_o = "01001111111") then -- 27f
	  hpos_o <= (others => '0');
	else
	  hpos_o <= hpos_o + "1";
	end if;

	if (ovs = '0') and (ovs_t1 = '1') then -- falling V
	  obank <= '0';
	  vs_cnt <= "000";
	elsif falling_h then
	  obank <= not obank;
	  if (vs_cnt(2) = '0') then
		vs_cnt <= vs_cnt + "1";
	  end if;
	end if;

	ohs <= HSYNC_IN; -- reg on clk_X2
	ohs_t1 <= ohs;

	ovs <= VSYNC_IN; -- reg on clk_X2
	ovs_t1 <= ovs;
  end process;

  p_op : process
  begin
	wait until rising_edge (CLK_X2);

	HSYNC_OUT <= '0';
	if (hpos_o < 32) then
	  HSYNC_OUT <= '1';
	end if;

	obank_t1 <= obank;
	if (obank_t1 = '1') then
	  RGB_OUT <= rgb_out_b;
	else
	  RGB_OUT <= rgb_out_a;
	end if;

	VSYNC_OUT <= not vs_cnt(2);
  end process;

end architecture RTL;

