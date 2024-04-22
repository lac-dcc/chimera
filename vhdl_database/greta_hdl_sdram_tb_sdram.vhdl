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
use work.greta_pkg.all;

entity tb_sdram is
end;

architecture testbench of tb_sdram is
  --- GRETA
  signal clk    : std_logic := '1';
  signal reset  : std_logic;
  signal ready  : std_logic;

  --- CLIENTS
  signal disk               : ram_bus;
  signal disk_ack           : std_logic;
  signal fast               : ram_bus;
  signal fast_ack           : std_logic;

  signal rdata              : bus_data;

  --- SDRAM
  signal SDRAM_CLK          : std_logic;
  signal SDRAM_CKE          : std_logic;
  signal SDRAM_nRAS         : std_logic;
  signal SDRAM_nCAS         : std_logic;
  signal SDRAM_nWE          : std_logic;
  signal SDRAM_UDQM         : std_logic;
  signal SDRAM_LDQM         : std_logic;
  signal SDRAM_BA           : std_logic_vector( 1 downto  0);
  signal SDRAM_A            : std_logic_vector(11 downto  0);
  signal SDRAM_DQ           : std_logic_vector(15 downto  0);

  signal end_of_simulation  : boolean := false;

  type dev_t is (F, D);
  type ram_buss   is array (dev_t) of ram_bus;
  signal devreq   : ram_buss;
  type acks       is array (dev_t) of std_logic;
  signal devack   : acks := "00";

  subtype cmd_t is std_logic_vector(2 downto 0);
  constant CMD_MRS    : cmd_t := "000";
  constant CMD_AR     : cmd_t := "001";
  constant CMD_PRE    : cmd_t := "010";
  constant CMD_ACT    : cmd_t := "011";
  constant CMD_WRITE  : cmd_t := "100";
  constant CMD_READ   : cmd_t := "101";
  constant CMD_NOP    : cmd_t := "111";
  signal cmd          : cmd_t := CMD_NOP;

  constant CLK_PERIOD   : Delay_length := 7.5 ns;
  constant RESET_LENGTH : Delay_length := 7 * CLK_PERIOD;

begin
  cmd(2) <= SDRAM_nRAS;
  cmd(1) <= SDRAM_nCAS;
  cmd(0) <= SDRAM_nWE;

  fast <= devreq(F);
  disk <= devreq(D);
  devack(F) <= fast_ack;
  devack(D) <= disk_ack;

  dut: entity work.sdram
  port map(
    clk         => clk,
    reset       => reset,
    ready       => ready,

    disk        => disk,
    disk_ack    => disk_ack,
    fast        => fast,
    fast_ack    => fast_ack,
    rdata       => rdata,

    SDRAM_CKE   => SDRAM_CKE,
    SDRAM_nRAS  => SDRAM_nRAS,
    SDRAM_nCAS  => SDRAM_nCAS,
    SDRAM_nWE   => SDRAM_nWE,
    SDRAM_UDQM  => SDRAM_UDQM,
    SDRAM_LDQM  => SDRAM_LDQM,
    SDRAM_BA    => SDRAM_BA,
    SDRAM_A     => SDRAM_A,
    SDRAM_DQ    => SDRAM_DQ
  );

  process
  begin
    if end_of_simulation = false then
      clk <= not clk;
      wait for CLK_PERIOD / 2.0;
    else
      report "Simulation ended";
      wait;
    end if;
  end process;

  process
    procedure dut_reset is
    begin
      reset <= '1';
      wait for RESET_LENGTH;
      wait until rising_edge(clk);
      reset <= '0';
    end;

    procedure read(
      constant dev      : in    dev_t;
      constant a        : in    bus_addr24;
      variable rd       : out   std_logic_vector
    ) is
    begin
      devreq(dev).req   <= '1';
      devreq(dev).nwe   <= READ_WORD;
      devreq(dev).addr  <= a(devreq(dev).addr'range);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      SDRAM_DQ          <= a(a'high downto a'high - 15);
      wait until devack(dev) = '1';
      assert rdata = a(a'high downto a'high - 15);
      SDRAM_DQ          <= (others => 'Z');
      wait until rising_edge(clk);
      devreq(dev).req   <= '0';
      devreq(dev).nwe   <= WRITE_WORD;
      devreq(dev).addr  <= (others => 'U');
      
      --check what?

    end;
  variable d16 : std_logic_vector(15 downto 0);

  begin
    SDRAM_DQ <= (others => 'Z');
    devreq(F).req <= '0';
    devreq(F).nwe <= WRITE_WORD;
    devreq(D).req <= '0';
    devreq(D).nwe <= WRITE_WORD;
    dut_reset;
    wait until ready = '1';

    read(D, x"201000", d16);
    read(D, x"201002", d16);
    read(D, x"201004", d16);
    read(D, x"201006", d16);

    read(F, x"202000", d16);
    read(F, x"202002", d16);
    read(F, x"202004", d16);
    read(F, x"202006", d16);

    end_of_simulation <= true;
    wait;
  end process;

  -- Invariants that shall always hold.
  invariants: process
  begin
    wait until rising_edge(clk);
    assert true;
  end process;
end;

