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
-- it under the terms of the GNU Affero General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
--
-- You should have received a copy of the GNU Affero General Public License
-- along with this design.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

library PoC;
use PoC.physical.all;

entity ml605_queens_uart is
  generic (
    N : positive := 27;
    L : positive :=  2;

    SOLVERS      : positive := 127;
    COUNT_CYCLES : boolean  := false;

    CLK_FREQ : FREQ     := 200 MHz;
    CLK_MULA : positive := 6;
    CLK_DIVA : positive := 1;
    CLK_DIVB : positive := 7;

    BAUDRATE : positive                     := 115200;
    SENTINEL : std_logic_vector(7 downto 0) := x"FA"  -- Start Byte
  );
  port (
    clk_p : in std_logic;
    clk_n : in std_logic;

    rx : in  std_logic;
    tx : out std_logic;

    rts_n : in  std_logic;
    cts_n : out std_logic;

    FanControl_PWM : out std_logic
  );
end ml605_queens_uart;


library IEEE;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library PoC;

architecture rtl of ml605_queens_uart is

  -- Global Control
  constant CLK_COMP_FREQ : FREQ := CLK_FREQ * CLK_MULA / CLK_DIVA / CLK_DIVB;
  constant CLK_SLOW_FREQ : FREQ := CLK_FREQ * CLK_MULA / CLK_DIVA / 100;
  signal clk200   : std_logic;          -- 200 MHz Input Clock
  signal clk_comp : std_logic;          -- Computation Clock
  signal clk_slow : std_logic;          -- Slow Interface Clock
  signal rst      : std_logic;

begin

  -----------------------------------------------------------------------------
  -- Generate Global Controls
  blkGlobal: block is
    signal clkfb     : std_logic;       -- Feedback Clock
    signal clk_compu : std_logic;       -- Unbuffered Synthesized Clock
    signal clk_slowu : std_logic;       -- Unbuffered Synthesized Clock
  begin

    clk_in : IBUFGDS
      port map(
        O  => clk200,
        I  => clk_p,
        IB => clk_n
      );

    pll : MMCM_BASE
      generic map (
        CLKIN1_PERIOD    => to_real(to_time(CLK_FREQ), 1 ns),
        CLKFBOUT_MULT_F  => real(CLK_MULA),
        DIVCLK_DIVIDE    => CLK_DIVA,
        CLKOUT0_DIVIDE_F => real(CLK_DIVB),
        CLKOUT1_DIVIDE   => 100,
        STARTUP_WAIT     => false
      )
      port map (
        CLKIN1   => clk200,
        CLKFBIN  => clkfb,
        RST      => '0',
        CLKOUT0  => clk_compu,
        CLKOUT1  => clk_slowu,
        CLKOUT2  => open,
        CLKOUT3  => open,
        CLKOUT4  => open,
        CLKOUT5  => open,
        CLKFBOUT => clkfb,
        LOCKED   => open,
        PWRDWN   => '0'
      );

    comp_buf : BUFG
      port map (
        I => clk_compu,
        O => clk_comp
      );

    slow_buf : BUFH
      port map (
        I => clk_slowu,
        O => clk_slow
      );

    -- No Reset
    rst <= '0';

  end block blkGlobal;

  -----------------------------------------------------------------------------
  -- Fan Control
  fan : entity PoC.io_FanControl
    generic map (
      CLOCK_FREQ => CLK_SLOW_FREQ
    )
    port map (
      Clock          => clk_slow,
      Reset          => '0',
      Fan_PWM        => FanControl_PWM,
      TachoFrequency => open
    );

  ----------------------------------------------------------------------------
  -- Solver Chain
  chain: entity work.queens_uart
    generic map (
      N            => N,
      L            => L,
      SOLVERS      => SOLVERS,
      COUNT_CYCLES => COUNT_CYCLES,
      CLK_FREQ     => integer(to_real(CLK_COMP_FREQ, 1 Hz)),
      BAUDRATE     => BAUDRATE,
      SENTINEL     => SENTINEL
    )
    port map (
      clk   => clk_comp,
      rst   => rst,
      rx    => rx,
      tx    => tx,
      avail => open
    );
  cts_n <= rts_n;

end rtl;
