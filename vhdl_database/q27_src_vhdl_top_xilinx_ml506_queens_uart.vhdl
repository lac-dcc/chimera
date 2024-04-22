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

entity ml506_queens_uart is
  generic (
    N : positive := 27;
    L : positive :=  2;

    SOLVERS      : positive := 23;
    COUNT_CYCLES : boolean  := false;

    CLK_FREQ : positive := 100000000;
    CLK_MUL  : positive := 20;
    CLK_DIV  : positive := 11;

    BAUDRATE : positive                     := 115200;
    SENTINEL : std_logic_vector(7 downto 0) := x"FA"  -- Start Byte
  );
  port (
    clkx : in std_logic;
    rstx : in std_logic;

    rx : in  std_logic;
    tx : out std_logic;

    leds : out std_logic_vector(0 to 7)
  );
end ml506_queens_uart;


library IEEE;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

architecture rtl of ml506_queens_uart is

  -- Global Control
  signal clk : std_logic;
  signal rst : std_logic;

  -- Solver Status
  signal avail : std_logic;

begin

  -----------------------------------------------------------------------------
  -- Generate Global Controls
  blkGlobal: block is
    signal clk_u : std_logic;           -- Unbuffered Synthesized Clock
    signal rst_s : std_logic_vector(1 downto 0) := (others => '0');
  begin
    DCM0 : DCM_BASE
      generic map (
        CLKIN_PERIOD          => 1000000000.0/real(CLK_FREQ),
        CLKIN_DIVIDE_BY_2     => FALSE,
        PHASE_SHIFT           => 0,
        CLKFX_MULTIPLY        => CLK_MUL,
        CLKFX_DIVIDE          => CLK_DIV,
        CLKOUT_PHASE_SHIFT    => "NONE",
        CLK_FEEDBACK          => "NONE",  -- only using clkfx
        DLL_FREQUENCY_MODE    => "HIGH",
        DFS_FREQUENCY_MODE    => "HIGH",
        DUTY_CYCLE_CORRECTION => TRUE,
        STARTUP_WAIT          => TRUE     --  Delay until DCM LOCK
      )
      port map (
        CLK0     => open,
        CLK180   => open,
        CLK270   => open,
        CLK2X    => open,
        CLK2X180 => open,
        CLK90    => open,
        CLKDV    => open,
        CLKFX    => clk_u,
        CLKFX180 => open,
        LOCKED   => open,
        CLKFB    => '0',
        CLKIN    => clkx,
        RST      => '0'
      );

    clk_buf : BUFG
      port map (
        I => clk_u,
        O => clk
      );

    -- Reset Synchronization
    process(clk)
    begin
      if rising_edge(clk) then
        rst_s <= (not rstx) & rst_s(rst_s'left downto 1);
      end if;
    end process;
    rst <= rst_s(0);

  end block blkGlobal;

  ----------------------------------------------------------------------------
  -- Solver Chain
  chain: entity work.queens_uart
    generic map (
      N            => N,
      L            => L,
      SOLVERS      => SOLVERS,
      COUNT_CYCLES => COUNT_CYCLES,
      CLK_FREQ     => integer((real(CLK_MUL)*real(CLK_FREQ))/real(CLK_DIV)),
      BAUDRATE     => BAUDRATE,
      SENTINEL     => SENTINEL
    )
    port map (
      clk   => clk,
      rst   => rst,
      rx    => rx,
      tx    => tx,
      avail => avail
    );

  ----------------------------------------------------------------------------
  -- Basic Status Output
  leds <= std_logic_vector(to_unsigned((SOLVERS mod (2**(leds'length-1)-1))+1, leds'length-1)) & avail;

end rtl;
