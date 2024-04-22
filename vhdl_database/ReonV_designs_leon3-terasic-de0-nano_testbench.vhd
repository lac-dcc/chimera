------------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2012 Aeroflex Gaisler
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.libdcom.all;
use gaisler.sim.all;
use work.debug.all;
library techmap;
use techmap.gencomp.all;
library micron;
use micron.components.all;
library grlib;
use grlib.stdlib.all;

use work.config.all;	-- configuration


entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW;

    romdepth  : integer := 22		-- rom address depth (flash 4 MB)
  );
end; 

architecture behav of testbench is

  constant promfile    : string := "prom.srec";
  constant sdramfile   : string := "ram.srec";

  signal clock_50      : std_logic := '0';

  signal led           : std_logic_vector(7 downto 0);

  signal key           : std_logic_vector(1 downto 0);

  signal sw            : std_logic_vector(3 downto 0);

  signal dram_ba       : std_logic_vector(1 downto 0);
  signal dram_dqm      : std_logic_vector(1 downto 0);
  signal dram_ras_n    : std_ulogic;
  signal dram_cas_n    : std_ulogic;
  signal dram_cke      : std_ulogic;
  signal dram_clk      : std_ulogic;
  signal dram_we_n     : std_ulogic;
  signal dram_cs_n     : std_ulogic;
  signal dram_dq       : std_logic_vector(15 downto 0);
  signal dram_addr     : std_logic_vector(12 downto 0);

  signal epcs_data0    : std_logic;
  signal epcs_dclk     : std_logic;
  signal epcs_ncso     : std_logic;
  signal epcs_asdo     : std_logic;

  signal i2c_sclk      : std_logic;
  signal i2c_sdat      : std_logic;
  signal g_sensor_cs_n : std_ulogic;
  signal g_sensor_int  : std_ulogic;

  signal adc_cs_n      : std_ulogic;
  signal adc_saddr     : std_ulogic;
  signal adc_sclk      : std_ulogic;
  signal adc_sdat      : std_ulogic;

  signal gpio_2        : std_logic_vector(12 downto 0);
  signal gpio_2_in     : std_logic_vector(2 downto 0);
    
  signal gpio_1_in     : std_logic_vector(1 downto 0);
  signal gpio_1        : std_logic_vector(33 downto 0);

  signal gpio_0_in     : std_logic_vector(1 downto 0);
  signal gpio_0        : std_logic_vector(33 downto 0);
    
begin

  clock_50 <= not clock_50 after 10 ns; --50 MHz clk 
  key(0) <= '0', '1' after 300 ns;
  key(1) <= '1';                        -- DSU break, disabled

  sw <= (others => 'H');

  gpio_0 <= (others => 'H');
  gpio_0_in <= (others => 'H');
  gpio_1 <= (others => 'H');
  gpio_1_in <= (others => 'H');
  gpio_2 <= (others => 'H');
  gpio_2_in <= (others => 'H');

  led(5 downto 0) <= (others => 'H');
  
  
  d3 : entity work.leon3mp
        generic map ( fabtech, memtech, padtech, clktech, disas, dbguart, pclow )
        port map (
          clock_50      => clock_50,
          led           => led,
          key           => key,
          sw            => sw,
          dram_ba       => dram_ba,
          dram_dqm      => dram_dqm,
          dram_ras_n    => dram_ras_n,
          dram_cas_n    => dram_cas_n,
          dram_cke      => dram_cke,
          dram_clk      => dram_clk,
          dram_we_n     => dram_we_n,
          dram_cs_n     => dram_cs_n,
          dram_dq       => dram_dq,
          dram_addr     => dram_addr,
          epcs_data0    => epcs_data0,
          epcs_dclk     => epcs_dclk,
          epcs_ncso     => epcs_ncso,
          epcs_asdo     => epcs_asdo,
          i2c_sclk      => i2c_sclk,
          i2c_sdat      => i2c_sdat,
          g_sensor_cs_n => g_sensor_cs_n,
          g_sensor_int  => g_sensor_int,
          adc_cs_n      => adc_cs_n,
          adc_saddr     => adc_saddr,
          adc_sclk      => adc_sclk,
          adc_sdat      => adc_sdat,
          gpio_2        => gpio_2,
          gpio_2_in     => gpio_2_in,
          gpio_1_in     => gpio_1_in,
          gpio_1        => gpio_1,
          gpio_0_in     => gpio_0_in,
          gpio_0        => gpio_0);


  sd1 : if (CFG_SDCTRL /= 0) generate
    u1: entity work.mt48lc16m16a2 generic map (addr_bits => 13, col_bits => 8, index => 1024, fname => sdramfile)
	PORT MAP(
            Dq => dram_dq, Addr => dram_addr, Ba => dram_ba, Clk => dram_clk,
            Cke => dram_cke, Cs_n => dram_cs_n, Ras_n => dram_ras_n,
            Cas_n => dram_cas_n, We_n => dram_we_n, Dqm => dram_dqm);
  end generate;

  dram_dq <= buskeep(dram_dq) after 5 ns;
  
  spif : if CFG_SPIMCTRL /= 0 generate
    spi0: spi_flash
      generic map (
        ftype      => 4,
        debug      => 0,
        fname      => promfile,
        readcmd    => CFG_SPIMCTRL_READCMD,
        dummybyte  => CFG_SPIMCTRL_DUMMYBYTE,
        dualoutput => CFG_SPIMCTRL_DUALOUTPUT,
        memoffset  => CFG_SPIMCTRL_OFFSET)
      port map (
        sck             => epcs_dclk,
        di              => epcs_asdo,
        do              => epcs_data0,
        csn             => epcs_ncso,
        sd_cmd_timeout  => open,
        sd_data_timeout => open);
  end generate;
    
  iuerr : process
  begin
    wait for 2500 ns;
    if to_x01(led(6)) = '1' then wait on led(6); end if;
    assert (to_x01(led(6)) = '1') 
      report "*** IU in error mode, simulation halted ***"
      severity failure ;
  end process;


end ;

