library ieee;
use ieee.std_logic_1164.all;

use work.cache_pack.all;
use work.cpu2j0_pack.all;
use work.data_bus_pack.all;

entity icache_adapter is
  port (
    clk125 : in std_logic;
    clk200 : in std_logic;
    rst : in std_logic;
    ctrl : in cache_ctrl_t;
    ibus_o : in  cpu_instruction_o_t;
    ibus_i : out cpu_instruction_i_t;

    dbus_o : out cpu_data_o_t;
    dbus_ddrburst : out std_logic;
    dbus_i : in  cpu_data_i_t;
    dbus_ack_r : in  std_logic);
end entity;

architecture arch of icache_adapter is
  signal icache_ra : icache_ram_o_t;
  signal icache_ry : icache_ram_i_t;
  signal icache_a : icache_i_t;
  signal icache_y : icache_o_t;
  signal icache_ma : mem_i_t;
  signal icache_my : mem_o_t;
  signal icccra : icccr_i_t;
begin
  icccra.ic_onm <= ctrl.en;
  icccra.ic_inv <= ctrl.inv;

  u_icache : icache port map(
    clk125 => clk125,
    clk200 => clk200,
    rst    => rst,
    icccra => icccra,
    -- Cache RAM port
    ra     =>  icache_ra,
    ry     =>  icache_ry,
    -- CPU port
    a      =>  icache_a,
    y      =>  icache_y,
    -- DDR memory port
    ma     =>  icache_ma,
    my     =>  icache_my);

  u_ucache_ram : icache_ram port map (
    rst => rst,
    clk125 => clk125,
    clk200 => clk200,
    ra => icache_ry,
    ry => icache_ra);

  -- icache - cpu side connection
  icache_a.a  <= ibus_o.a(27 downto 1) & "0";
  icache_a.en <= ibus_o.en;
  ibus_i.ack  <= icache_y.ack;
  ibus_i.d    <= icache_y.d;

  -- icache - ddr side connection
  dbus_o.a      <= x"0" & icache_my.a;
  dbus_o.en     <= icache_my.en;
  dbus_o.d      <= x"00000000";
  dbus_o.wr     <= '0';
  dbus_o.we     <= x"0";
  dbus_o.rd     <= icache_my.en;
  dbus_ddrburst <= icache_my.ddrburst;
  icache_ma.d   <= dbus_i.d;
  icache_ma.ack <= dbus_i.ack;
  icache_ma.ack_r <= dbus_ack_r;
end architecture;
