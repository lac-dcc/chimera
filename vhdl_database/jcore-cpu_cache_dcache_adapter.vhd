library ieee;
use ieee.std_logic_1164.all;

use work.cache_pack.all;
use work.cpu2j0_pack.all;
use work.data_bus_pack.all;

entity dcache_adapter is
  port (
    clk125 : in std_logic;
    clk200 : in std_logic;
    rst : in std_logic;
    ctrl : in cache_ctrl_t;
    ibus_o : in  cpu_data_o_t;
    lock   : in  std_logic;
    ibus_i : out cpu_data_i_t;

    snpc_o : out dcache_snoop_io_t;
    snpc_i : in  dcache_snoop_io_t;
    dbus_o : out cpu_data_o_t;
    dbus_lock : out std_logic;
    dbus_ddrburst : out std_logic;
    dbus_i : in  cpu_data_i_t;
    dbus_ack_r : in std_logic);
end entity;

architecture arch of dcache_adapter is
  signal dcache_ra : dcache_ram_o_t;
  signal dcache_ry : dcache_ram_i_t;
  signal dcache_ma : mem_i_t;
  signal dcache_my : mem_o_t;
begin

  u_dcache : dcache port map(
    clk125 => clk125,
    clk200 => clk200,
    rst    => rst,
    ctrl   => ctrl,
    -- Cache RAM port
    ra     =>  dcache_ra,
    ry     =>  dcache_ry,
    -- CPU port
    a      =>  ibus_o,
    lock   =>  lock,
    y      =>  ibus_i,
    -- snoop port --------------
    sa     =>  snpc_i,
    sy     =>  snpc_o,
    -- DDR memory port
    ma     =>  dcache_ma,
    my     =>  dcache_my);

  u_dcache_ram : dcache_ram port map (
    rst => rst,
    clk125 => clk125,
    clk200 => clk200,
    ra => dcache_ry,
    ry => dcache_ra);

  -- dcache - ddr side connection
  dbus_o.a      <= x"0" & dcache_my.a;
  dbus_o.en     <= dcache_my.en;
  dbus_o.d      <= dcache_my.d;
  dbus_o.wr     <= dcache_my.wr;
  dbus_o.we     <= dcache_my.we;
  dbus_o.rd     <= dcache_my.en and (not dcache_my.wr);
  dcache_ma.d   <= dbus_i.d;
  dcache_ma.ack <= dbus_i.ack;
  dcache_ma.ack_r <= dbus_ack_r;
  dbus_lock     <= dcache_my.lock;
  dbus_ddrburst <= dcache_my.ddrburst;
end architecture;
