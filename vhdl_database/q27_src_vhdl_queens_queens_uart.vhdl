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

entity queens_uart is
  generic (
    -- Problem Size
    N : positive;
    L : positive;

    -- Design Spec
    SOLVERS      : positive;
    COUNT_CYCLES : boolean;

    -- Communication Parameters
    CLK_FREQ : positive;
    BAUDRATE : positive;
    SENTINEL : std_logic_vector(7 downto 0)
  );
  port (
    -- Global Control
    clk : in  std_logic;
    rst : in  std_logic;

    -- UART Interface
    rx : in  std_logic;
    tx : out std_logic;

    -- Activity
    avail : out std_logic
  );
end queens_uart;


library IEEE;
use IEEE.numeric_std.all;

library PoC;
use PoC.utils.all;
use PoC.fifo.all;
use PoC.uart.all;

architecture rtl of queens_uart is

  -- Bit Length of Pre-Placement
  constant PRE_BITS  : positive := 4*L*log2ceil(N)-1;
  constant PRE_BYTES : positive := (PRE_BITS+7)/8;

  -- UART-to-Unframe Interface
  signal rx_dat : std_logic_vector(7 downto 0);
  signal rx_stb : std_logic;

  -- Unframe-to-Chain Interface
  signal piful : std_logic;
  signal pidat : byte;
  signal pieof : std_logic;
  signal piput : std_logic;

  -- Chain-to-Enframe Interface
  signal sovld : std_logic;
  signal sodat : byte;
  signal soeof : std_logic;
  signal sogot : std_logic;

  -- Enframe-to-UART Interface
  signal tx_dat : std_logic_vector(7 downto 0);
  signal tx_ful : std_logic;
  signal tx_put : std_logic;

begin

  -----------------------------------------------------------------------------
  -- UART -> Byte Interface
  blkUART: block
    signal bclk_x8 : std_logic;
    signal bclk_x1 : std_logic;
  begin

    -- Bit Clock Generation
    bclk_gen_x8: entity PoC.arith_counter_free
      generic map (
        DIVIDER => CLK_FREQ/(8*BAUDRATE)
      )
      port map (
        clk => clk,
        rst => '0',
        inc => '1',
        stb => bclk_x8
      );
    bclk_gen_x1: entity PoC.arith_counter_free
      generic map (
        DIVIDER => 8
      )
      port map (
        clk => clk,
        rst => '0',
        inc => bclk_x8,
        stb => bclk_x1
      );

    -- Receive Bytes
    uart_rx_2 : uart_rx
      port map (
        clk     => clk,
        rst     => rst,
        bclk_x8 => bclk_x8,
        rx      => rx,
        stb     => rx_stb,
        do      => rx_dat
      );

    -- Transmit Byte
    uart_tx_1 : uart_tx
      port map (
        clk  => clk,
        rst  => rst,
        bclk => bclk_x1,
        put  => tx_put,
        di   => tx_dat,
        ful  => tx_ful,
        tx   => tx
      );

  end block blkUART;

  blkUnframe: block

    -- Input Glue FIFO -> Unframe
    signal glue_vld : std_logic;
    signal glue_dat : std_logic_vector(7 downto 0);
    signal glue_got : std_logic;

    -- Unframe -> Input Buffer
    signal odat : std_logic_vector(7 downto 0);
    signal oeof : std_logic;
    signal oful : std_logic;
    signal oput : std_logic;
    signal ocommit : std_logic;
    signal orollback : std_logic;

		signal pvld : std_logic;

  begin

    glue: fifo_glue
      generic map (
        D_BITS => 8
      )
      port map (
        clk => clk,
        rst => rst,
        put => rx_stb,
        di  => rx_dat,
        ful => open,
        vld => glue_vld,
        do  => glue_dat,
        got => glue_got
      );

    unframe_i: entity work.unframe
      generic map (
        SENTINEL => SENTINEL,
        PAY_LEN  => PRE_BYTES
      )
      port map (
        clk       => clk,
        rst       => rst,
        rx_dat    => glue_dat,
        rx_vld    => glue_vld,
        rx_got    => glue_got,
        odat      => odat,
        oeof      => oeof,
        oful      => oful,
        oput      => oput,
        ocommit   => ocommit,
        orollback => orollback
      );

    buf: fifo_cc_got_tempput
      generic map (
        MIN_DEPTH      => 5*(SOLVERS+5),
        D_BITS         => 9
      )
      port map (
        clk => clk,
        rst => rst,

        put             => oput,
        din(8)          => oeof,
        din(7 downto 0) => odat,
        full            => oful,
        commit          => ocommit,
        rollback        => orollback,

        got              => piput,
        dout(8)          => pieof,
        dout(7 downto 0) => pidat,
        valid            => pvld
      );
		piput <= pvld and not piful;
		avail <= pvld;

  end block blkUnframe;


	chain: entity work.queens_chain
    generic map (
      N            => N,
      L            => L,
      SOLVERS      => SOLVERS,
      COUNT_CYCLES => COUNT_CYCLES
		)
    port map (
      clk   => clk,
      rst   => rst,

      piful => piful,
      pidat => pidat,
      pieof => pieof,
      piput => piput,
      poful => '1',
      podat => open,
      poeof => open,
      poput => open,

      sivld => '0',
      sidat => (others => '-'),
      sieof => '-',
      sigot => open,
      sovld => sovld,
      sodat => sodat,
      soeof => soeof,
      sogot => sogot
		);

  blkEnframe: block
		signal sful : std_logic;

		signal ogot : std_logic;
		signal oeof : std_logic;
		signal odat : byte;
		signal ovld : std_logic;
  begin

    sogot <= sovld and not sful;
    buf: fifo_cc_got
      generic map (
        MIN_DEPTH => 5*(SOLVERS+5),
        D_BITS    => 9,
        STATE_REG => true
      )
      port map (
        clk => clk,
        rst => rst,

        put             => sogot,
        din(8)          => soeof,
        din(7 downto 0) => sodat,
        full            => sful,

        got              => ogot,
        dout(8)          => oeof,
        dout(7 downto 0) => odat,
        valid            => ovld
      );

    enframe_i: entity work.enframe
      generic map (
        SENTINEL => SENTINEL
      )
      port map (
        clk    => clk,
        rst    => rst,
        ivld   => ovld,
        idat   => odat,
        ieof   => oeof,
        igot   => ogot,
        tx_ful => tx_ful,
        tx_put => tx_put,
        tx_dat => tx_dat
      );
  end block blkEnframe;

end rtl;
