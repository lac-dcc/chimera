--
-- Copyright (C) 2013 Martin Åberg
--
--  This program is free software: you can redistribute it
--  and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation,
--  either version 3 of the License, or (at your option)
--  any later version.
--
--  This program is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the
--  implied warranty of MERCHANTABILITY or FITNESS FOR A
--  PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General
--  Public License along with this program.  If not, see
--  <http://www.gnu.org/licenses/>.
--
library ieee;
use ieee.std_logic_1164.all;
use work.bus_bfm_pkg.all;

entity bus_bfm is
  port(
    nRST            : out   std_logic;
    nAS             : out   std_logic;
    nUDS            : out   std_logic;
    nLDS            : out   std_logic;
    RnW             : out   std_logic;
    CDAC            : out   std_logic;
    nDTACK          : in    std_logic;
    nOVR            : in    std_logic;
    nINT2           : in    std_logic;
    nINT6           : in    std_logic;
    nINT7           : in    std_logic;
    A               : out   std_logic_vector(23 downto 1);
    D               : inout std_logic_vector(15 downto 0)
  );
end;

architecture behavioral of bus_bfm is
  constant CLK_PERIOD : Delay_length := 1000.0 ns / 7.09;
  -- 7M clock
  signal CLK : std_logic := '0';
  type state_t is (S0, S1, S2, S3, S4, w, S5, S6, S7);
  signal state : state_t := S0;
  signal op : bus_op := XXX;

begin

  process
  begin
    if end_of_simulation = false then
      CLK <= not CLK;
      wait for CLK_PERIOD / 2.0;
    else
      wait;
    end if;
  end process;

  CDAC <= CLK after CLK_PERIOD / 4.0;

  process
  begin
    wait until bus_cmd.req = '1';
    bus_cmd.ack <= '1';
    wait for 0 ns;

    op <= bus_cmd.op;
    case bus_cmd.op is
    when RESET =>
      nRST <= '0';
      nAS <= '1';
      nUDS <= '1';
      nLDS <= '1';
      RnW <= '1';
      A <= (others => 'Z');
      D <= (others => 'Z');
      wait for CLK_PERIOD * 10;
      wait until rising_edge(CLK);
      nRST <= '1';
      state <= S0;

    when WRITE =>
      wait until falling_edge(CLK);
      state <= S1;
      A <= bus_cmd.addr after 70 ns / 2.0;

      wait until rising_edge(CLK);
      state <= S2;
      wait for 30 ns;
      RnW <= '0';
      nAS <= '0';
      nUDS <= bus_cmd.nUDS after 144 ns;
      nLDS <= bus_cmd.nLDS after 144 ns;

      wait until falling_edge(CLK);
      state <= S3;
      D <= bus_cmd.wdata after 70 ns / 2.0;

      wait until rising_edge(CLK);
      state <= S4;

      wait until falling_edge(CLK);
      state <= S5;

      wait until rising_edge(CLK);
      state <= S6;

      wait until falling_edge(CLK);
      state <= S7;
      nAS <= '1';
      nUDS <= '1';
      nLDS <= '1';

      wait until rising_edge(CLK);
      state <= S0;
      A <= (others => 'Z');
      D <= (others => 'Z');
      RnW <= '1' after 70 ns / 2.0;

    when READ =>
      wait until falling_edge(CLK);
      state <= S1;
      A <= bus_cmd.addr after 70 ns / 2.0;

      wait until rising_edge(CLK);
      state <= S2;
      RnW <= '1' after 70 ns / 2.0;
      nAS <= '0' after 60 ns / 2.0;
      nUDS <= bus_cmd.nUDS after 60 ns / 2.0;
      nLDS <= bus_cmd.nLDS after 60 ns / 2.0;

      wait until falling_edge(CLK);
      state <= S3;

      wait until rising_edge(CLK);
      state <= S4;

      wait until falling_edge(CLK);
      state <= S5;

      wait until rising_edge(CLK);
      state <= S6;

      wait for (CLK_PERIOD / 2.0) - 15 ns;
      -- Set up time ended. Sample here to simulate actual
      -- setup time.
      bus_cmd.rdata <= D;

      wait until falling_edge(CLK);
      state <= S7;
      nAS <= '1';
      nUDS <= '1';
      nLDS <= '1';

      wait until rising_edge(CLK);
      state <= S0;
      A <= (others => 'Z');

    when others =>
        null;
    end case;
    op <= XXX;

    bus_cmd.ack <= '0';
    wait for 0 ns;
    while bus_cmd.req = '1' loop
    end loop;

  end process;
end;

