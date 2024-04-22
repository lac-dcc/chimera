----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- This is an Intel flavor "altpll" PLL.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library altera_mf;
use altera_mf.all;

entity pll is
  generic(
    CLK_MUL : positive;
    CLK_DIV : positive
  );
  port(
    i_rst : in std_logic;
    i_refclk : in std_logic;
    o_clk : out std_logic;
    o_locked : out std_logic
  );
end pll;

architecture rtl of pll is
  signal s_in_clocks : std_logic_vector (1 downto 0);
  signal s_gen_clocks : std_logic_vector (4 downto 0);

  component altpll
    generic(
      bandwidth_type : string;
      clk0_divide_by : natural;
      clk0_duty_cycle : natural;
      clk0_multiply_by : natural;
      clk0_phase_shift : string;
      compensate_clock : string;
      inclk0_input_frequency : natural;
      intended_device_family : string;
      lpm_hint : string;
      lpm_type : string;
      operation_mode : string;
      pll_type : string;
      port_activeclock : string;
      port_areset : string;
      port_clkbad0 : string;
      port_clkbad1 : string;
      port_clkloss : string;
      port_clkswitch : string;
      port_configupdate : string;
      port_fbin : string;
      port_inclk0 : string;
      port_inclk1 : string;
      port_locked : string;
      port_pfdena : string;
      port_phasecounterselect : string;
      port_phasedone : string;
      port_phasestep : string;
      port_phaseupdown : string;
      port_pllena : string;
      port_scanaclr : string;
      port_scanclk : string;
      port_scanclkena : string;
      port_scandata : string;
      port_scandataout : string;
      port_scandone : string;
      port_scanread : string;
      port_scanwrite : string;
      port_clk0 : string;
      port_clk1 : string;
      port_clk2 : string;
      port_clk3 : string;
      port_clk4 : string;
      port_clk5 : string;
      port_clkena0 : string;
      port_clkena1 : string;
      port_clkena2 : string;
      port_clkena3 : string;
      port_clkena4 : string;
      port_clkena5 : string;
      port_extclk0 : string;
      port_extclk1 : string;
      port_extclk2 : string;
      port_extclk3 : string;
      self_reset_on_loss_lock : string;
      width_clock : natural
    );
    port(
      areset : in std_logic;
      inclk : in std_logic_vector (1 downto 0);
      clk : out std_logic_vector (4 downto 0);
      locked : out std_logic 
    );
  end component;
begin
  s_in_clocks <= "0" & i_refclk;
  o_clk <= s_gen_clocks(0);

  altpll_component : altpll
  generic map (
    bandwidth_type => "AUTO",

    clk0_divide_by => CLK_DIV,
    clk0_multiply_by => CLK_MUL,
    clk0_duty_cycle => 50,
    clk0_phase_shift => "0",

    compensate_clock => "CLK0",
    inclk0_input_frequency => 20000,
    intended_device_family => "MAX 10",
    lpm_hint => "CBX_MODULE_PREFIX=mypll",
    lpm_type => "altpll",
    operation_mode => "NORMAL",
    pll_type => "AUTO",
    port_activeclock => "PORT_UNUSED",
    port_areset => "PORT_USED",
    port_clkbad0 => "PORT_UNUSED",
    port_clkbad1 => "PORT_UNUSED",
    port_clkloss => "PORT_UNUSED",
    port_clkswitch => "PORT_UNUSED",
    port_configupdate => "PORT_UNUSED",
    port_fbin => "PORT_UNUSED",
    port_inclk0 => "PORT_USED",
    port_inclk1 => "PORT_UNUSED",
    port_locked => "PORT_USED",
    port_pfdena => "PORT_UNUSED",
    port_phasecounterselect => "PORT_UNUSED",
    port_phasedone => "PORT_UNUSED",
    port_phasestep => "PORT_UNUSED",
    port_phaseupdown => "PORT_UNUSED",
    port_pllena => "PORT_UNUSED",
    port_scanaclr => "PORT_UNUSED",
    port_scanclk => "PORT_UNUSED",
    port_scanclkena => "PORT_UNUSED",
    port_scandata => "PORT_UNUSED",
    port_scandataout => "PORT_UNUSED",
    port_scandone => "PORT_UNUSED",
    port_scanread => "PORT_UNUSED",
    port_scanwrite => "PORT_UNUSED",
    port_clk0 => "PORT_USED",
    port_clk1 => "PORT_UNUSED",
    port_clk2 => "PORT_UNUSED",
    port_clk3 => "PORT_UNUSED",
    port_clk4 => "PORT_UNUSED",
    port_clk5 => "PORT_UNUSED",
    port_clkena0 => "PORT_UNUSED",
    port_clkena1 => "PORT_UNUSED",
    port_clkena2 => "PORT_UNUSED",
    port_clkena3 => "PORT_UNUSED",
    port_clkena4 => "PORT_UNUSED",
    port_clkena5 => "PORT_UNUSED",
    port_extclk0 => "PORT_UNUSED",
    port_extclk1 => "PORT_UNUSED",
    port_extclk2 => "PORT_UNUSED",
    port_extclk3 => "PORT_UNUSED",
    self_reset_on_loss_lock => "OFF",
    width_clock => 5
  )
  port map (
    areset => i_rst,
    inclk => s_in_clocks,
    clk => s_gen_clocks,
    locked => o_locked
  );
end rtl;
