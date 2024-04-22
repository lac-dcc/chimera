-- Copyright (C) 2013, 2016 Martin Åberg
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

library ieee;
use ieee.std_logic_1164.all;
use work.greta_pkg.all;

entity greta is
  port(
    --- EXTERNAL CLOCK
    CLK25MHZ        : in    std_logic;

    --- ROCK LOBSTER
    RL_nRST         : in    std_logic;
    RL_nAS          : in    std_logic;
    RL_nUDS         : in    std_logic;
    RL_nLDS         : in    std_logic;
    RL_RnW          : in    std_logic;
    RL_CDAC         : in    std_logic;
    RL_nOVR         : out   std_logic;
    RL_nINT2        : out   std_logic;
    RL_nINT6        : out   std_logic;
    RL_nINT7        : out   std_logic;
    RL_nDTACK       : out   std_logic;
    RL_A            : in    std_logic_vector(23 downto 1);
    RL_D            : inout std_logic_vector(15 downto 0);
    RL_D_nOE        : out   std_logic;
    RL_D_TO_GRETA   : out   std_logic;

    --- SDRAM
    SDRAM_CLK       : out   std_logic;
    SDRAM_CKE       : out   std_logic;
    SDRAM_nRAS      : out   std_logic;
    SDRAM_nCAS      : out   std_logic;
    SDRAM_nWE       : out   std_logic;
    SDRAM_UDQM      : out   std_logic;
    SDRAM_LDQM      : out   std_logic;
    SDRAM_BA        : out   std_logic_vector(1 downto 0);
    SDRAM_A         : out   std_logic_vector(11 downto 0);
    SDRAM_DQ        : inout std_logic_vector(15 downto 0);

    --- SECURE DIGITAL (SPI)
    SPI_CLK         : out   std_logic;
    SPI_nCS         : out   std_logic;
    SPI_DI          : out   std_logic;
    SPI_DO          : in    std_logic;

    --- ETHERNET PHY (RMII)
    PHY_nRST        : out   std_logic;
    PHY_MDC         : out   std_logic;
    PHY_MDIO        : inout std_logic;
    RMII_REF_CLK    : in    std_logic;
    RMII_CRS_DV     : in    std_logic;
    RMII_RXD        : in    std_logic_vector(1 downto 0);
    RMII_TXD        : in    std_logic_vector(1 downto 0);
    RMII_TX_EN      : out   std_logic;

    --- UART/DEBUG
    DEBUG_RX        : in    std_logic;
    DEBUG_TX        : out   std_logic
  );
end;

architecture structural of greta is
  signal clk              : std_logic;
  signal clk180           : std_logic;
  signal cpu_reset        : std_logic;
  signal dcm_locked       : std_logic;
  signal req              : std_logic;
  signal nwe              : bus_nwe;
  signal addr             : bus_addr;
  signal wdata            : bus_data;
  signal rdata            : bus_data;

  signal fast_select      : std_logic;
  signal fast_rdata       : bus_data;
  signal fast_config_in   : std_logic;
  signal fast_config_out  : std_logic;

  signal sdram_rdata      : bus_data;

  signal sdram_fast       : ram_bus := (
    req => '0',
    nwe => READ_WORD,
    addr => (others => '0'),
    wdata => (others => '0')
  );
  signal sdram_fast_ack   : std_logic := '0';

  signal disk_select      : std_logic;
  signal disk_rdata       : bus_data;
  signal disk_config_in   : std_logic;
  signal disk_config_out  : std_logic;

  signal sdram_disk       : ram_bus := (
    req => '0',
    nwe => READ_WORD,
    addr => (others => '0'),
    wdata => (others => '0')
  );
  signal sdram_disk_ack   : std_logic := '0';

  signal dev_select       : std_logic;

  signal gbi        : gbus_in;
  signal gbo_aspic  : gbus_out;

  signal spii : spi_in;
  signal spio : spi_out;

  constant GSLAVE_FAST  : gslave := 0;
  constant GSLAVE_DISK  : gslave := 1;
  constant GSLAVE_ASPIC : gslave := 2;
  constant GSLAVE_LAST  : gslave := GSLAVE_ASPIC;
begin

  -- debug outputs
  DEBUG_TX <= gbo_aspic.config;

  -- GRETA bus connections
  dev_select <= fast_select or disk_select or gbo_aspic.dev_select;
  fast_config_in <= '1';
  disk_config_in <= fast_config_out;
  gbi.config(GSLAVE_ASPIC) <= disk_config_out;

  rdata <= fast_rdata or disk_rdata or gbo_aspic.rdata;

  gbi.reset   <= cpu_reset;
  gbi.req     <= req;
  gbi.nwe     <= nwe;
  gbi.addr    <= addr;
  gbi.wdata   <= wdata;

  SPI_CLK <= spio.clk;
  SPI_nCS <= spio.ss;
  SPI_DI <= spio.mosi;
  spii.miso <= SPI_DO;

  -- Enable PLL.
  PHY_nRST <= '1';
  PHY_MDC <= 'Z';
  RMII_TX_EN <= '0';

  RL_nINT2 <= not gbo_aspic.interrupt;

  -- Generate 133.3 MHz clock from 50 MHz PHY clock.
  dcm_0 : entity work.dcm_greta
  port map(
    CLKIN_IN        => RMII_REF_CLK,
    CLKFX_OUT       => clk,
    CLKFX180_OUT    => clk180,
    CLKIN_IBUFG_OUT => open,
    LOCKED_OUT      => dcm_locked
  );

  -- SDRAM clock output uses a DDR output buffer. See Xilinx
  -- documentation for generic and port descriptions.
  ODDR2_inst : ODDR2
  generic map(
    DDR_ALIGNMENT => "NONE",
    INIT => '0',
    SRTYPE => "SYNC")
  port map (
    Q   => SDRAM_CLK,
    C0  => clk,
    C1  => clk180,
    CE  => '1',
    D0  => '0',
    D1  => '1',
    R   => '0',
    S   => '0'
  );

  bus_interface_0 : entity work.bus_interface
  port map(
    clk             => clk,
    cpu_reset       => cpu_reset,
    dcm_locked      => dcm_locked,

    dev_select      => dev_select,
    req             => req,
    nwe             => nwe,
    addr            => addr,
    wdata           => wdata,
    rdata           => rdata,

    --- ROCK LOBSTER
    nRST            => RL_nRST,
    nAS             => RL_nAS,
    nUDS            => RL_nUDS,
    nLDS            => RL_nLDS,
    RnW             => RL_RnW,
    CDAC            => RL_CDAC,
    nOVR            => RL_nOVR,
    nINT2           => open,
    nINT6           => RL_nINT6,
    nINT7           => RL_nINT7,
    nDTACK          => RL_nDTACK,
    A               => RL_A,
    D               => RL_D,
    D_nOE           => RL_D_nOE,
    D_TO_GRETA      => RL_D_TO_GRETA
  );

  sdram_0 : entity work.sdram
  port map(
    clk             => clk,
    reset           => cpu_reset,
    ready           => open,

    --- CLIENTS
    disk            => sdram_disk,
    disk_ack        => sdram_disk_ack,
    fast            => sdram_fast,
    fast_ack        => sdram_fast_ack,
    rdata           => sdram_rdata,

    --- SDRAM
    SDRAM_CKE       => SDRAM_CKE,
    SDRAM_nRAS      => SDRAM_nRAS,
    SDRAM_nCAS      => SDRAM_nCAS,
    SDRAM_nWE       => SDRAM_nWE,
    SDRAM_UDQM      => SDRAM_UDQM,
    SDRAM_LDQM      => SDRAM_LDQM,
    SDRAM_BA        => SDRAM_BA,
    SDRAM_A         => SDRAM_A,
    SDRAM_DQ        => SDRAM_DQ
  );

  fast_0 : entity work.fast
  port map(
    clk         => clk,
    reset       => cpu_reset,

    req         => req,
    nwe         => nwe,
    dev_select  => fast_select,
    addr        => addr,
    wdata       => wdata,
    rdata       => fast_rdata,
    config_in   => fast_config_in,
    config_out  => fast_config_out,

    ram         => sdram_fast,
    ram_ack     => sdram_fast_ack,
    ram_rdata   => sdram_rdata
  );

  disk_0 : entity work.disk
  port map(
    clk         => clk,
    reset       => cpu_reset,

    req         => req,
    nwe         => nwe,
    dev_select  => disk_select,
    addr        => addr,
    wdata       => wdata,
    rdata       => disk_rdata,
    config_in   => disk_config_in,
    config_out  => disk_config_out,

    ram         => sdram_disk,
    ram_ack     => sdram_disk_ack,
    ram_rdata   => sdram_rdata,

    SPI_CLK     => open,
    SPI_nCS     => open,
    SPI_DO      => open,
    SPI_DI      => '0'
  );

  -- ASPIC - SPI controller for GRETA
  aspic_0 : entity work.aspic
  generic map(
    gslave  => GSLAVE_ASPIC,
    dwidth  => 8,
    swidth  => 8,
    sspol   => '0'
  )
  port map(
    clk   => clk,
    gbi   => gbi,
    gbo   => gbo_aspic,
    spii  => spii,
    spio  => spio
  );

end;

