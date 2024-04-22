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
library grlib;
use grlib.amba.all;
use grlib.devices.all;
library gaisler;
use gaisler.ddrpkg.all;

entity lpddr2if is
  generic (
    hindex: integer;
    haddr: integer := 16#400#;
    hmask: integer := 16#000#;
    burstlen: integer := 8
    );
  port (
    pll_ref_clk: in std_ulogic;
    global_reset_n: in std_ulogic;
    mem_ca: out   std_logic_vector(9 downto 0);
    mem_ck: out   std_ulogic;
    mem_ck_n: out   std_ulogic;
    mem_cke: out   std_ulogic;
    mem_cs_n: out   std_ulogic;
    mem_dm: out   std_logic_vector(1 downto 0);
    mem_dq: inout std_logic_vector(15 downto 0);
    mem_dqs: inout std_logic_vector(1 downto 0);
    mem_dqs_n: inout std_logic_vector(1 downto 0);
    oct_rzqin: in    std_logic;
    ahb_clk: in std_ulogic;
    ahb_rst: in std_ulogic;
    ahbsi: in ahb_slv_in_type;
    ahbso: out ahb_slv_out_type
    );
end;

architecture rtl of lpddr2if is

	component lpddr2ctrl1 is
		port (
			pll_ref_clk               : in    std_logic                     := 'X';             -- clk
			global_reset_n            : in    std_logic                     := 'X';             -- reset_n
			soft_reset_n              : in    std_logic                     := 'X';             -- reset_n
			afi_clk                   : out   std_logic;                                        -- clk
			afi_half_clk              : out   std_logic;                                        -- clk
			afi_reset_n               : out   std_logic;                                        -- reset_n
			afi_reset_export_n        : out   std_logic;                                        -- reset_n
			mem_ca                    : out   std_logic_vector(9 downto 0);                     -- mem_ca
			mem_ck                    : out   std_logic_vector(0 downto 0);                     -- mem_ck
			mem_ck_n                  : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			mem_cke                   : out   std_logic_vector(0 downto 0);                     -- mem_cke
			mem_cs_n                  : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			mem_dm                    : out   std_logic_vector(1 downto 0);                     -- mem_dm
			mem_dq                    : inout std_logic_vector(15 downto 0) := (others => 'X'); -- mem_dq
			mem_dqs                   : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs
			mem_dqs_n                 : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs_n
			avl_ready                 : out   std_logic;                                        -- waitrequest_n
			avl_burstbegin            : in    std_logic                     := 'X';             -- beginbursttransfer
			avl_addr                  : in    std_logic_vector(24 downto 0) := (others => 'X'); -- address
			avl_rdata_valid           : out   std_logic;                                        -- readdatavalid
			avl_rdata                 : out   std_logic_vector(63 downto 0);                    -- readdata
			avl_wdata                 : in    std_logic_vector(63 downto 0) := (others => 'X'); -- writedata
			avl_be                    : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- byteenable
			avl_read_req              : in    std_logic                     := 'X';             -- read
			avl_write_req             : in    std_logic                     := 'X';             -- write
			avl_size                  : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- burstcount
			local_init_done           : out   std_logic;                                        -- local_init_done
			local_cal_success         : out   std_logic;                                        -- local_cal_success
			local_cal_fail            : out   std_logic;                                        -- local_cal_fail
			oct_rzqin                 : in    std_logic                     := 'X';             -- rzqin
			pll_mem_clk               : out   std_logic;                                        -- pll_mem_clk
			pll_write_clk             : out   std_logic;                                        -- pll_write_clk
			pll_write_clk_pre_phy_clk : out   std_logic;                                        -- pll_write_clk_pre_phy_clk
			pll_addr_cmd_clk          : out   std_logic;                                        -- pll_addr_cmd_clk
			pll_locked                : out   std_logic;                                        -- pll_locked
			pll_avl_clk               : out   std_logic;                                        -- pll_avl_clk
			pll_config_clk            : out   std_logic;                                        -- pll_config_clk
			pll_mem_phy_clk           : out   std_logic;                                        -- pll_mem_phy_clk
			afi_phy_clk               : out   std_logic;                                        -- afi_phy_clk
			pll_avl_phy_clk           : out   std_logic                                         -- pll_avl_phy_clk
		);
	end component lpddr2ctrl1;

        signal vcc: std_ulogic;

        signal afi_clk, afi_half_clk, afi_reset_n: std_ulogic;
        signal local_init_done, local_cal_success, local_cal_fail: std_ulogic;

        signal ck_p_arr, ck_n_arr, cke_arr, cs_arr: std_logic_vector(0 downto 0);

        signal avlsi: ddravl_slv_in_type;
        signal avlso: ddravl_slv_out_type;

begin

  vcc <= '1';

  mem_ck   <= ck_p_arr(0);
  mem_ck_n <= ck_n_arr(0);
  mem_cke <= cke_arr(0);
  mem_cs_n <= cs_arr(0);

  ctrl0: lpddr2ctrl1
    port map (
      pll_ref_clk => pll_ref_clk,
      global_reset_n => global_reset_n,
      soft_reset_n => vcc,
      afi_clk => afi_clk,
      afi_half_clk => afi_half_clk,
      afi_reset_n => afi_reset_n,
      afi_reset_export_n => open,
      mem_ca => mem_ca,
      mem_ck => ck_p_arr,
      mem_ck_n => ck_n_arr,
      mem_cke => cke_arr,
      mem_cs_n => cs_arr,
      mem_dm => mem_dm,
      mem_dq => mem_dq,
      mem_dqs => mem_dqs,
      mem_dqs_n => mem_dqs_n,
      avl_ready => avlso.ready,
      avl_burstbegin => avlsi.burstbegin,
      avl_addr => avlsi.addr(24 downto 0),
      avl_rdata_valid => avlso.rdata_valid,
      avl_rdata => avlso.rdata(63 downto 0),
      avl_wdata => avlsi.wdata(63 downto 0),
      avl_be => avlsi.be(7 downto 0),
      avl_read_req => avlsi.read_req,
      avl_write_req => avlsi.write_req,
      avl_size => avlsi.size(2 downto 0),
      local_init_done => local_init_done,
      local_cal_success => local_cal_success,
      local_cal_fail => local_cal_fail,
      oct_rzqin => oct_rzqin,
      pll_mem_clk => open,
      pll_write_clk => open,
      pll_write_clk_pre_phy_clk => open,
      pll_addr_cmd_clk => open,
      pll_locked => open,
      pll_avl_clk => open,
      pll_config_clk => open,
      pll_mem_phy_clk => open,
      afi_phy_clk => open,
      pll_avl_phy_clk => open
      );
  avlso.rdata(avlso.rdata'high downto 64) <= (others => '0');

  ahb2avl0: ahb2avl_async
    generic map (
      hindex => hindex,
      haddr => haddr,
      hmask => hmask,
      burstlen => burstlen,
      nosync => 0,
      avldbits => 64,
      avlabits => 25
      )
    port map (
      rst_ahb => ahb_rst,
      clk_ahb => ahb_clk,
      ahbsi => ahbsi,
      ahbso => ahbso,
      rst_avl => afi_reset_n,
      clk_avl => afi_clk,
      avlsi => avlsi,
      avlso => avlso
      );
end;

