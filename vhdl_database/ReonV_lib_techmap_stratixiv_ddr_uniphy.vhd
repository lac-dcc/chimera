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
-----------------------------------------------------------------------------
-- Entity:        uniphy_ddr2_phy
-- File:          ddr_uniphy.vhd
-- Contact:       support@gaiser.com
-- Description:	  DDR2 PHY for Altera Stratix 4
--                Wrapper for Uniphy entity
--                generated from /boards/terasic-de4/uniphy_*.vhd
-- Author:        Andrea Gianarro, Cobham Gaisler
--                Pascal Trotta
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;

entity uniphy_ddr2_phy is
  generic (
    MHz        : integer := 100;
    rstdelay   : integer := 200;
    dbits      : integer := 16;
    clk_mul    : integer := 2;
    clk_div    : integer := 2;
    eightbanks : integer  range 0 to 1 := 0;
    abits      : integer := 14;
    nclk       : integer := 3;
    ncs        : integer := 2);
  port (
    rst        : in  std_ulogic;
    clk        : in  std_logic;        -- input clock
                                       -- for operating without PLL
    clkout     : out std_ulogic;       -- system clock
    clkoutret  : in  std_ulogic;       -- system clock return
    lock       : out std_ulogic;       -- DCM locked

    ddr_clk    : out std_logic_vector(nclk-1 downto 0);
    ddr_clkb   : out std_logic_vector(nclk-1 downto 0);
    ddr_cke    : out std_logic_vector(ncs-1 downto 0);
    ddr_csb    : out std_logic_vector(ncs-1 downto 0);
    ddr_web    : out std_ulogic;                               -- ddr write enable
    ddr_rasb   : out std_ulogic;                               -- ddr ras
    ddr_casb   : out std_ulogic;                               -- ddr cas
    ddr_dm     : out std_logic_vector (dbits/8-1 downto 0);    -- ddr dm
    ddr_dqs    : inout std_logic_vector (dbits/8-1 downto 0);  -- ddr dqs
    ddr_dqsn   : inout std_logic_vector (dbits/8-1 downto 0);  -- ddr dqsn
    ddr_ad     : out std_logic_vector (abits-1 downto 0);           -- ddr address
    ddr_ba     : out std_logic_vector (1+eightbanks downto 0); -- ddr bank address
    ddr_dq     : inout  std_logic_vector (dbits-1 downto 0);   -- ddr data
    ddr_odt    : out std_logic_vector(ncs-1 downto 0);
    
    addr       : in  std_logic_vector (abits-1 downto 0);           -- ddr address
    ba         : in  std_logic_vector ( 2 downto 0);           -- ddr bank address
    dqin       : out std_logic_vector (dbits*2-1 downto 0);    -- ddr input data
    dqout      : in  std_logic_vector (dbits*2-1 downto 0);    -- ddr input data
    dm         : in  std_logic_vector (dbits/4-1 downto 0);    -- data mask
    oen        : in  std_ulogic;
    rasn       : in  std_ulogic;
    casn       : in  std_ulogic;
    wen        : in  std_ulogic;
    csn        : in  std_logic_vector(ncs-1 downto 0);
    cke        : in  std_logic_vector(ncs-1 downto 0);
    odt        : in  std_logic_vector(ncs-1 downto 0);
    read_pend  : in  std_logic_vector(7 downto 0);
    regwdata   : in  std_logic_vector(63 downto 0);
    regwrite   : in  std_logic_vector(1 downto 0);
    regrdata   : out std_logic_vector(63 downto 0);
    dqin_valid : out std_ulogic;
    oct_rdn    : in  std_logic := '0';
    oct_rup    : in  std_logic := '0'
  );

end;

architecture rtl of uniphy_ddr2_phy is

  component uniphy is
    port (
      pll_ref_clk         : in    std_logic                      := '0';             --      pll_ref_clk.clk
      global_reset_n      : in    std_logic                      := '0';             --     global_reset.reset_n
      soft_reset_n        : in    std_logic                      := '0';             --       soft_reset.reset_n
      afi_clk             : out   std_logic;                                         --          afi_clk.clk
      afi_half_clk        : out   std_logic;                                         --     afi_half_clk.clk
      afi_reset_n         : out   std_logic;                                         --        afi_reset.reset_n
      afi_reset_export_n  : out   std_logic;                                         -- afi_reset_export.reset_n
      mem_a               : out   std_logic_vector(13 downto 0);                     --           memory.mem_a
      mem_ba              : out   std_logic_vector(2 downto 0);                      --                 .mem_ba
      mem_ck              : out   std_logic_vector(1 downto 0);                      --                 .mem_ck
      mem_ck_n            : out   std_logic_vector(1 downto 0);                      --                 .mem_ck_n
      mem_cke             : out   std_logic_vector(0 downto 0);                      --                 .mem_cke
      mem_cs_n            : out   std_logic_vector(0 downto 0);                      --                 .mem_cs_n
      mem_dm              : out   std_logic_vector(7 downto 0);                      --                 .mem_dm
      mem_ras_n           : out   std_logic_vector(0 downto 0);                      --                 .mem_ras_n
      mem_cas_n           : out   std_logic_vector(0 downto 0);                      --                 .mem_cas_n
      mem_we_n            : out   std_logic_vector(0 downto 0);                      --                 .mem_we_n
      mem_dq              : inout std_logic_vector(63 downto 0)  := (others => '0'); --                 .mem_dq
      mem_dqs             : inout std_logic_vector(7 downto 0)   := (others => '0'); --                 .mem_dqs
      mem_dqs_n           : inout std_logic_vector(7 downto 0)   := (others => '0'); --                 .mem_dqs_n
      mem_odt             : out   std_logic_vector(0 downto 0);                      --                 .mem_odt
      afi_addr            : in    std_logic_vector(13 downto 0)  := (others => '0'); --              afi.afi_addr
      afi_ba              : in    std_logic_vector(2 downto 0)   := (others => '0'); --                 .afi_ba
      afi_cke             : in    std_logic_vector(0 downto 0)   := (others => '0'); --                 .afi_cke
      afi_cs_n            : in    std_logic_vector(0 downto 0)   := (others => '0'); --                 .afi_cs_n
      afi_ras_n           : in    std_logic_vector(0 downto 0)   := (others => '0'); --                 .afi_ras_n
      afi_we_n            : in    std_logic_vector(0 downto 0)   := (others => '0'); --                 .afi_we_n
      afi_cas_n           : in    std_logic_vector(0 downto 0)   := (others => '0'); --                 .afi_cas_n
      afi_odt             : in    std_logic_vector(0 downto 0)   := (others => '0'); --                 .afi_odt
      afi_dqs_burst       : in    std_logic_vector(7 downto 0)   := (others => '0'); --                 .afi_dqs_burst
      afi_wdata_valid     : in    std_logic_vector(7 downto 0)   := (others => '0'); --                 .afi_wdata_valid
      afi_wdata           : in    std_logic_vector(127 downto 0) := (others => '0'); --                 .afi_wdata
      afi_dm              : in    std_logic_vector(15 downto 0)  := (others => '0'); --                 .afi_dm
      afi_rdata           : out   std_logic_vector(127 downto 0);                    --                 .afi_rdata
      afi_rdata_en        : in    std_logic_vector(0 downto 0)   := (others => '0'); --                 .afi_rdata_en
      afi_rdata_en_full   : in    std_logic_vector(0 downto 0)   := (others => '0'); --                 .afi_rdata_en_full
      afi_rdata_valid     : out   std_logic_vector(0 downto 0);                      --                 .afi_rdata_valid
      afi_mem_clk_disable : in    std_logic_vector(1 downto 0)   := (others => '0'); --                 .afi_mem_clk_disable
      afi_init_req        : in    std_logic                      := '0';             --                 .afi_init_req
      afi_cal_req         : in    std_logic                      := '0';             --                 .afi_cal_req
      afi_wlat            : out   std_logic_vector(5 downto 0);                      --                 .afi_wlat
      afi_rlat            : out   std_logic_vector(5 downto 0);                      --                 .afi_rlat
      afi_cal_success     : out   std_logic;                                         --                 .afi_cal_success
      afi_cal_fail        : out   std_logic;                                         --                 .afi_cal_fail
      oct_rdn             : in    std_logic                      := '0';             --              oct.rdn
      oct_rup             : in    std_logic                      := '0'              --                 .rup
    );
  end component;

  signal vcc, gnd : std_logic;
  signal vccv: std_logic_vector(4 downto 0);
  signal gndv: std_logic_vector(4 downto 0);

  signal clk0,clk0d: std_ulogic;
  signal lrst: std_ulogic;
  signal locki: std_logic;
  signal pllcgi: clkgen_in_type;
  signal pllcgo: clkgen_out_type;
  
  signal rstdelay_arst: std_logic;
  signal rstdelay_count: std_logic_vector(16 downto 0);
  signal rstdelay_done: std_logic;
  
  signal dfi_address, dfi_address_in: std_logic_vector(abits-1 downto 0);  
  signal dfi_ras_n, dfi_ras_n_in: std_logic_vector(0 downto 0);
  signal dfi_cas_n, dfi_cas_n_in: std_logic_vector(0 downto 0);
  signal dfi_we_n, dfi_we_n_in: std_logic_vector(0 downto 0);  
  signal dfi_bank, dfi_bank_in: std_logic_vector(1+eightbanks downto 0);
  signal dfi_cs_n, dfi_cs_n_in: std_logic_vector(ncs-1 downto 0);
  
  signal oe: std_ulogic;
  signal cken: std_ulogic;
  signal dfi_rddata_en: std_logic_vector(0 downto 0);
  signal dfi_rddata_valid: std_logic_vector(0 downto 0);
  signal dfi_dram_clk_disable: std_logic_vector(1 downto 0);
  signal dfi_wrdata_en, dfi_wrdata_en_in: std_logic_vector(0 downto 0);
  signal dfi_rddata, dfi_wrdata, dfi_wrdata_in: std_logic_vector(2*dbits-1 downto 0);
  signal dfi_wrdata_mask, dfi_wrdata_mask_in: std_logic_vector(dbits/4-1 downto 0);
  
  signal afi_dqs_burst_l, afi_wdata_valid_l : std_logic_vector(7 downto 0);
  signal afi_wlat_l, afi_rlat_l : std_logic_vector(5 downto 0);
  signal cal_succ_i : std_logic;

  signal ddr_rasb_l, ddr_casb_l, ddr_web_l : std_logic_vector(0 downto 0);
begin

  vcc <= '1';
  gnd <= '0';
  gndv <= "00000";
  vccv <= "11111";

  oe <= not oen;
  cken <= not cke(0);
  dfi_dram_clk_disable <= (others => cken);
  dfi_wrdata_en_in <= (others => oe);
  dqin_valid <= dfi_rddata_valid(0);
  
  afi_dqs_burst_l <= ( others => (dfi_wrdata_en(0) or dfi_wrdata_en_in(0)));
  afi_wdata_valid_l <= ( others => dfi_wrdata_en(0) );

  -----------------------------------------------------------------------------
  -- Reset delay with async reset  
  -----------------------------------------------------------------------------

  rstdelay_arst <= rst and locki and cal_succ_i;
  lrst <= rstdelay_done;
  lock <= lrst;
  
  rstdelproc: process(clkoutret,rstdelay_arst)
  begin
    if rising_edge(clkoutret) then
      if rstdelay_done='0' then 
        rstdelay_count <= std_logic_vector(unsigned(rstdelay_count)-1);
      end if;
      if rstdelay_count=std_logic_vector(to_unsigned(0,rstdelay_count'length)) then
        rstdelay_done <= '1';
      end if;
    end if;
    if rstdelay_arst='0' then
      rstdelay_count <= std_logic_vector(to_unsigned(rstdelay*MHz*clk_mul/clk_div,rstdelay_count'length));
      rstdelay_done <= '0';
    end if;
  end process;
  
  regrdata(63 downto 6) <= ( others => '0' );
  regrdata(5 downto 0) <= afi_wlat_l;
  dfi_rddata_en <= (others => read_pend(1));

  regs: process(clkoutret, rstdelay_arst)
  begin
    if rising_edge(clkoutret) then
      dfi_wrdata <= dfi_wrdata_in;
      dfi_wrdata_mask <= dfi_wrdata_mask_in;
      dfi_wrdata_en <= dfi_wrdata_en_in;
      dfi_address <= dfi_address_in;
      dfi_bank <= dfi_bank_in;
      dfi_cas_n <= dfi_cas_n_in;
      dfi_cs_n <= dfi_cs_n_in;
      dfi_ras_n <= dfi_ras_n_in;
      dfi_we_n <= dfi_we_n_in;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Altera Uniphy DDR2 PHY instantiation
  -----------------------------------------------------------------------------
  
  -- NOTE: The phy reads and sends the lower part of the data vectors first
  -- (on the rising edge of dqs) and higher part second (on the falling edge of dqs).
  -- We swap this in both directions to match the memory simulation models and
  -- our other PHY:s.
  dqin <= dfi_rddata(dbits-1 downto 0) & dfi_rddata(2*dbits-1 downto dbits);
  dfi_wrdata_in <= dqout(dbits-1 downto 0) & dqout(2*dbits-1 downto dbits);
  dfi_wrdata_mask_in <= dm(dbits/8-1 downto 0) & dm(dbits/4-1 downto dbits/8);
  dfi_cs_n_in <= csn;
  dfi_address_in(abits-1 downto 0) <= addr;
  dfi_bank_in(1+eightbanks downto 0) <= ba(1+eightbanks downto 0);
  dfi_ras_n_in <= (others => rasn);
  dfi_cas_n_in <= (others => casn);
  dfi_we_n_in <= (others => wen);

  phy: uniphy
    port map (
        pll_ref_clk         => clk,
        global_reset_n      => rst,
        soft_reset_n        => rst,
        afi_clk             => clkout,
        afi_half_clk        => open,
        afi_reset_n         => locki,
        afi_reset_export_n  => open,
        mem_a               => ddr_ad,
        mem_ba              => ddr_ba,
        mem_ck              => ddr_clk,
        mem_ck_n            => ddr_clkb,
        mem_cke             => ddr_cke,
        mem_cs_n            => ddr_csb,
        mem_dm              => ddr_dm,
        mem_ras_n           => ddr_rasb_l,
        mem_cas_n           => ddr_casb_l,
        mem_we_n            => ddr_web_l,
        mem_dq              => ddr_dq,
        mem_dqs             => ddr_dqs,
        mem_dqs_n           => ddr_dqsn,
        mem_odt             => ddr_odt,
        afi_addr            => dfi_address,
        afi_ba              => dfi_bank,
        afi_cke             => cke,
        afi_cs_n            => dfi_cs_n,
        afi_ras_n           => dfi_ras_n,
        afi_we_n            => dfi_we_n,
        afi_cas_n           => dfi_cas_n,
        afi_odt             => odt,
        afi_dqs_burst       => afi_dqs_burst_l,
        afi_wdata_valid     => afi_wdata_valid_l,
        afi_wdata           => dfi_wrdata,
        afi_dm              => dfi_wrdata_mask,
        afi_rdata           => dfi_rddata,
        afi_rdata_en        => dfi_rddata_en,
        afi_rdata_en_full   => dfi_rddata_en,
        afi_rdata_valid     => dfi_rddata_valid,
        afi_mem_clk_disable => dfi_dram_clk_disable,
        afi_init_req        => '0',
        afi_cal_req         => '0',
        afi_wlat            => afi_wlat_l,
        afi_rlat            => afi_rlat_l,
        afi_cal_success     => cal_succ_i,
        afi_cal_fail        => open,
        oct_rdn             => oct_rdn,
        oct_rup             => oct_rup
    );
  
  ddr_web   <= ddr_web_l(0);
  ddr_rasb  <= ddr_rasb_l(0);
  ddr_casb  <= ddr_casb_l(0);
end;
