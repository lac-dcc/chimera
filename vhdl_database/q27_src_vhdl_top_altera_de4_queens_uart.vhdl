-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-------------------------------------------------------------------------------
-- This file is part of the Queens@TUD solver suite
-- for enumerating and counting the solutions of an N-Queens Puzzle.
--
-- Copyright (C) 2008-2015
--      Thomas B. Preusser <thomas.preusser@utexas.edu>
-------------------------------------------------------------------------------
-- This design is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- Modifications to this work must be clearly identified and must leave
-- the original copyright statement and contact information intact. This
-- license notice may not be removed.
--
-- This design is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this design.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

library PoC;
use PoC.physical.all;

entity de4_queens_uart is
  generic (
    N : positive := 27;
    L : positive :=  2;

    SOLVERS      : positive := 125;
    COUNT_CYCLES : boolean  := false;

    CLK_FREQ : FREQ     := 50 MHz;
    CLK_MUL  : positive := 5;
    CLK_DIV  : positive := 1;

    BAUDRATE : positive                     := 115200;
    SENTINEL : std_logic_vector(7 downto 0) := x"FA"  -- Start Byte
  );
  port (
    osc_50_bank2 : in std_logic;
    cpu_reset_n  : in std_logic;

    uart_rxd : in  std_logic;
    uart_txd : out std_logic;

    uart_rts : in  std_logic;
    uart_cts : out std_logic;

    fan_ctrl : out std_logic
  );
end de4_queens_uart;


library IEEE;
use IEEE.numeric_std.all;

library altera_mf;
use altera_mf.all;

architecture rtl of DE4_queens_uart is

  -- Altera PLL Component
  component altpll
  generic (
    bandwidth_type          : STRING;
    clk0_divide_by          : NATURAL;
    clk0_duty_cycle         : NATURAL;
    clk0_multiply_by        : NATURAL;
    clk0_phase_shift        : STRING;
    inclk0_input_frequency  : NATURAL;
    intended_device_family  : STRING;
    lpm_hint                : STRING;
    lpm_type                : STRING;
    operation_mode          : STRING;
    pll_type                : STRING;
    port_activeclock        : STRING;
    port_areset             : STRING;
    port_clkbad0            : STRING;
    port_clkbad1            : STRING;
    port_clkloss            : STRING;
    port_clkswitch          : STRING;
    port_configupdate       : STRING;
    port_fbin               : STRING;
    port_fbout              : STRING;
    port_inclk0             : STRING;
    port_inclk1             : STRING;
    port_locked             : STRING;
    port_pfdena             : STRING;
    port_phasecounterselect : STRING;
    port_phasedone          : STRING;
    port_phasestep          : STRING;
    port_phaseupdown        : STRING;
    port_pllena             : STRING;
    port_scanaclr           : STRING;
    port_scanclk            : STRING;
    port_scanclkena         : STRING;
    port_scandata           : STRING;
    port_scandataout        : STRING;
    port_scandone           : STRING;
    port_scanread           : STRING;
    port_scanwrite          : STRING;
    port_clk0               : STRING;
    port_clk1               : STRING;
    port_clk2               : STRING;
    port_clk3               : STRING;
    port_clk4               : STRING;
    port_clk5               : STRING;
    port_clk6               : STRING;
    port_clk7               : STRING;
    port_clk8               : STRING;
    port_clk9               : STRING;
    port_clkena0            : STRING;
    port_clkena1            : STRING;
    port_clkena2            : STRING;
    port_clkena3            : STRING;
    port_clkena4            : STRING;
    port_clkena5            : STRING;
    using_fbmimicbidir_port : STRING;
    width_clock	            : NATURAL
  );
  port (
    clk	: out std_logic_vector (9 downto 0);
    inclk : in std_logic_vector (1 downto 0)
  );
  end component;

  -- Global Control
  constant CLK_PLL_FREQ : FREQ := CLK_FREQ * CLK_MUL / CLK_DIV;

  signal pll_clkout : std_logic_vector(9 DOWNTO 0);
  signal pll_clkin : std_logic_vector(1 DOWNTO 0);
                
  signal rst      : std_logic;
  signal pwm_counter : unsigned(21 downto 0) := (others => '0');

begin

  -- PWM generator (cooling fan)
  process(osc_50_bank2) begin
    if rising_edge(osc_50_bank2) then
      pwm_counter <= pwm_counter + 1;   
    end if;
  end process;

  -- Solver clock PLL
  pll: altpll generic map (
    bandwidth_type => "AUTO",
    clk0_divide_by => CLK_DIV,
    clk0_duty_cycle => 50,
    clk0_multiply_by => CLK_MUL,
    clk0_phase_shift => "0",
    inclk0_input_frequency => integer(to_real(to_time(CLK_FREQ), 1 ps)),
    intended_device_family => "Stratix IV",
    lpm_hint => "CBX_MODULE_PREFIX=solver_pll",
    lpm_type => "altpll",
    operation_mode => "NO_COMPENSATION",
    pll_type => "AUTO",
    port_activeclock => "PORT_UNUSED",
    port_areset => "PORT_UNUSED",
    port_clkbad0 => "PORT_UNUSED",
    port_clkbad1 => "PORT_UNUSED",
    port_clkloss => "PORT_UNUSED",
    port_clkswitch => "PORT_UNUSED",
    port_configupdate => "PORT_UNUSED",
    port_fbin => "PORT_UNUSED",
    port_fbout => "PORT_UNUSED",
    port_inclk0 => "PORT_USED",
    port_inclk1 => "PORT_UNUSED",
    port_locked => "PORT_UNUSED",
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
    port_clk6 => "PORT_UNUSED",
    port_clk7 => "PORT_UNUSED",
    port_clk8 => "PORT_UNUSED",
    port_clk9 => "PORT_UNUSED",
    port_clkena0 => "PORT_UNUSED",
    port_clkena1 => "PORT_UNUSED",
    port_clkena2 => "PORT_UNUSED",
    port_clkena3 => "PORT_UNUSED",
    port_clkena4 => "PORT_UNUSED",
    port_clkena5 => "PORT_UNUSED",
    using_fbmimicbidir_port => "OFF",
    width_clock => 10
  ) port map (
    inclk => pll_clkin,
    clk => pll_clkout
  );

  ----------------------------------------------------------------------------
  -- Solver Chain
  chain: entity work.queens_uart
    generic map (
      N            => N,
      L            => L,
      SOLVERS      => SOLVERS,
      COUNT_CYCLES => COUNT_CYCLES,
      CLK_FREQ     => integer(to_real(CLK_PLL_FREQ, 1 Hz)),
      BAUDRATE     => BAUDRATE,
      SENTINEL     => SENTINEL
    )
    port map (
      clk   => pll_clkout(0),
      rst   => rst,
      rx    => uart_rxd,
      tx    => uart_txd,
      snap  => open,
      avail => open
    );

  pll_clkin <= "0" & osc_50_bank2;
  rst <= not cpu_reset_n;
  uart_cts <= uart_rts;
  fan_ctrl <= pwm_counter(21);

end rtl;
