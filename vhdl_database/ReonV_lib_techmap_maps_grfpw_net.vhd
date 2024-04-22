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
-- Entity: 	grfpw_net
-- File:	grfpw_net.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	GRFPU / GRLFPC netlist wrapper
------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use work.gencomp.all;

entity grfpw_net is
  generic (tech     : integer := 0;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 2 := 1;           
           disas    : integer range 0 to 2 := 0;
           pipe     : integer range 0 to 2 := 0
           );
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    cpi_flush  	: in std_ulogic;			  -- pipeline flush
    cpi_exack    	: in std_ulogic;			  -- FP exception acknowledge
    cpi_a_rs1  	: in std_logic_vector(4 downto 0);
    cpi_d_pc    : in std_logic_vector(31 downto 0);
    cpi_d_inst  : in std_logic_vector(31 downto 0);
    cpi_d_cnt   : in std_logic_vector(1 downto 0);
    cpi_d_trap  : in std_ulogic;
    cpi_d_annul : in std_ulogic;
    cpi_d_pv    : in std_ulogic;
    cpi_a_pc    : in std_logic_vector(31 downto 0);
    cpi_a_inst  : in std_logic_vector(31 downto 0);
    cpi_a_cnt   : in std_logic_vector(1 downto 0);
    cpi_a_trap  : in std_ulogic;
    cpi_a_annul : in std_ulogic;
    cpi_a_pv    : in std_ulogic;
    cpi_e_pc    : in std_logic_vector(31 downto 0);
    cpi_e_inst  : in std_logic_vector(31 downto 0);
    cpi_e_cnt   : in std_logic_vector(1 downto 0);
    cpi_e_trap  : in std_ulogic;
    cpi_e_annul : in std_ulogic;
    cpi_e_pv    : in std_ulogic;
    cpi_m_pc    : in std_logic_vector(31 downto 0);
    cpi_m_inst  : in std_logic_vector(31 downto 0);
    cpi_m_cnt   : in std_logic_vector(1 downto 0);
    cpi_m_trap  : in std_ulogic;
    cpi_m_annul : in std_ulogic;
    cpi_m_pv    : in std_ulogic;
    cpi_x_pc    : in std_logic_vector(31 downto 0);
    cpi_x_inst  : in std_logic_vector(31 downto 0);
    cpi_x_cnt   : in std_logic_vector(1 downto 0);
    cpi_x_trap  : in std_ulogic;
    cpi_x_annul : in std_ulogic;
    cpi_x_pv    : in std_ulogic;    
    cpi_lddata        : in std_logic_vector(31 downto 0);     -- load data
    cpi_dbg_enable : in std_ulogic;
    cpi_dbg_write  : in std_ulogic;
    cpi_dbg_fsr    : in std_ulogic;                            -- FSR access
    cpi_dbg_addr   : in std_logic_vector(4 downto 0);
    cpi_dbg_data   : in std_logic_vector(31 downto 0);

    cpo_data          : out std_logic_vector(31 downto 0); -- store data
    cpo_exc  	        : out std_logic;			 -- FP exception
    cpo_cc           : out std_logic_vector(1 downto 0);  -- FP condition codes
    cpo_ccv  	       : out std_ulogic;			 -- FP condition codes valid
    cpo_ldlock       : out std_logic;			 -- FP pipeline hold
    cpo_holdn         : out std_ulogic;
    cpo_dbg_data     : out std_logic_vector(31 downto 0);

    rfi1_rd1addr 	: out std_logic_vector(3 downto 0); 
    rfi1_rd2addr 	: out std_logic_vector(3 downto 0); 
    rfi1_wraddr 	: out std_logic_vector(3 downto 0); 
    rfi1_wrdata 	: out std_logic_vector(31 downto 0);
    rfi1_ren1        : out std_ulogic;			   
    rfi1_ren2        : out std_ulogic;			   
    rfi1_wren        : out std_ulogic;			   
    
    rfi2_rd1addr 	: out std_logic_vector(3 downto 0); 
    rfi2_rd2addr 	: out std_logic_vector(3 downto 0); 
    rfi2_wraddr 	: out std_logic_vector(3 downto 0); 
    rfi2_wrdata 	: out std_logic_vector(31 downto 0);
    rfi2_ren1        : out std_ulogic;
    rfi2_ren2        : out std_ulogic;			    
    rfi2_wren        : out std_ulogic;

    rfo1_data1    	: in std_logic_vector(31 downto 0);
    rfo1_data2    	: in std_logic_vector(31 downto 0);
    rfo2_data1    	: in std_logic_vector(31 downto 0);
    rfo2_data2    	: in std_logic_vector(31 downto 0)        
    );
end;


architecture rtl of grfpw_net is

component grfpw_0_unisim
port(
  rst :  in std_logic;
  clk :  in std_logic;
  holdn :  in std_logic;
  cpi_flush :  in std_logic;
  cpi_exack :  in std_logic;
  cpi_a_rs1 : in std_logic_vector (4 downto 0);
  cpi_d_pc : in std_logic_vector (31 downto 0);
  cpi_d_inst : in std_logic_vector (31 downto 0);
  cpi_d_cnt : in std_logic_vector (1 downto 0);
  cpi_d_trap :  in std_logic;
  cpi_d_annul :  in std_logic;
  cpi_d_pv :  in std_logic;
  cpi_a_pc : in std_logic_vector (31 downto 0);
  cpi_a_inst : in std_logic_vector (31 downto 0);
  cpi_a_cnt : in std_logic_vector (1 downto 0);
  cpi_a_trap :  in std_logic;
  cpi_a_annul :  in std_logic;
  cpi_a_pv :  in std_logic;
  cpi_e_pc : in std_logic_vector (31 downto 0);
  cpi_e_inst : in std_logic_vector (31 downto 0);
  cpi_e_cnt : in std_logic_vector (1 downto 0);
  cpi_e_trap :  in std_logic;
  cpi_e_annul :  in std_logic;
  cpi_e_pv :  in std_logic;
  cpi_m_pc : in std_logic_vector (31 downto 0);
  cpi_m_inst : in std_logic_vector (31 downto 0);
  cpi_m_cnt : in std_logic_vector (1 downto 0);
  cpi_m_trap :  in std_logic;
  cpi_m_annul :  in std_logic;
  cpi_m_pv :  in std_logic;
  cpi_x_pc : in std_logic_vector (31 downto 0);
  cpi_x_inst : in std_logic_vector (31 downto 0);
  cpi_x_cnt : in std_logic_vector (1 downto 0);
  cpi_x_trap :  in std_logic;
  cpi_x_annul :  in std_logic;
  cpi_x_pv :  in std_logic;
  cpi_lddata : in std_logic_vector (31 downto 0);
  cpi_dbg_enable :  in std_logic;
  cpi_dbg_write :  in std_logic;
  cpi_dbg_fsr :  in std_logic;
  cpi_dbg_addr : in std_logic_vector (4 downto 0);
  cpi_dbg_data : in std_logic_vector (31 downto 0);
  cpo_data : out std_logic_vector (31 downto 0);
  cpo_exc :  out std_logic;
  cpo_cc : out std_logic_vector (1 downto 0);
  cpo_ccv :  out std_logic;
  cpo_ldlock :  out std_logic;
  cpo_holdn :  out std_logic;
  cpo_dbg_data : out std_logic_vector (31 downto 0);
  rfi1_rd1addr : out std_logic_vector (3 downto 0);
  rfi1_rd2addr : out std_logic_vector (3 downto 0);
  rfi1_wraddr : out std_logic_vector (3 downto 0);
  rfi1_wrdata : out std_logic_vector (31 downto 0);
  rfi1_ren1 :  out std_logic;
  rfi1_ren2 :  out std_logic;
  rfi1_wren :  out std_logic;
  rfi2_rd1addr : out std_logic_vector (3 downto 0);
  rfi2_rd2addr : out std_logic_vector (3 downto 0);
  rfi2_wraddr : out std_logic_vector (3 downto 0);
  rfi2_wrdata : out std_logic_vector (31 downto 0);
  rfi2_ren1 :  out std_logic;
  rfi2_ren2 :  out std_logic;
  rfi2_wren :  out std_logic;
  rfo1_data1 : in std_logic_vector (31 downto 0);
  rfo1_data2 : in std_logic_vector (31 downto 0);
  rfo2_data1 : in std_logic_vector (31 downto 0);
  rfo2_data2 : in std_logic_vector (31 downto 0));
--  disasen     :  in std_logic);
end component;

component grfpw_0_altera
port(
  rst :  in std_logic;
  clk :  in std_logic;
  holdn :  in std_logic;
  cpi_flush :  in std_logic;
  cpi_exack :  in std_logic;
  cpi_a_rs1 : in std_logic_vector (4 downto 0);
  cpi_d_pc : in std_logic_vector (31 downto 0);
  cpi_d_inst : in std_logic_vector (31 downto 0);
  cpi_d_cnt : in std_logic_vector (1 downto 0);
  cpi_d_trap :  in std_logic;
  cpi_d_annul :  in std_logic;
  cpi_d_pv :  in std_logic;
  cpi_a_pc : in std_logic_vector (31 downto 0);
  cpi_a_inst : in std_logic_vector (31 downto 0);
  cpi_a_cnt : in std_logic_vector (1 downto 0);
  cpi_a_trap :  in std_logic;
  cpi_a_annul :  in std_logic;
  cpi_a_pv :  in std_logic;
  cpi_e_pc : in std_logic_vector (31 downto 0);
  cpi_e_inst : in std_logic_vector (31 downto 0);
  cpi_e_cnt : in std_logic_vector (1 downto 0);
  cpi_e_trap :  in std_logic;
  cpi_e_annul :  in std_logic;
  cpi_e_pv :  in std_logic;
  cpi_m_pc : in std_logic_vector (31 downto 0);
  cpi_m_inst : in std_logic_vector (31 downto 0);
  cpi_m_cnt : in std_logic_vector (1 downto 0);
  cpi_m_trap :  in std_logic;
  cpi_m_annul :  in std_logic;
  cpi_m_pv :  in std_logic;
  cpi_x_pc : in std_logic_vector (31 downto 0);
  cpi_x_inst : in std_logic_vector (31 downto 0);
  cpi_x_cnt : in std_logic_vector (1 downto 0);
  cpi_x_trap :  in std_logic;
  cpi_x_annul :  in std_logic;
  cpi_x_pv :  in std_logic;
  cpi_lddata : in std_logic_vector (31 downto 0);
  cpi_dbg_enable :  in std_logic;
  cpi_dbg_write :  in std_logic;
  cpi_dbg_fsr :  in std_logic;
  cpi_dbg_addr : in std_logic_vector (4 downto 0);
  cpi_dbg_data : in std_logic_vector (31 downto 0);
  cpo_data : out std_logic_vector (31 downto 0);
  cpo_exc :  out std_logic;
  cpo_cc : out std_logic_vector (1 downto 0);
  cpo_ccv :  out std_logic;
  cpo_ldlock :  out std_logic;
  cpo_holdn :  out std_logic;
  cpo_dbg_data : out std_logic_vector (31 downto 0);
  rfi1_rd1addr : out std_logic_vector (3 downto 0);
  rfi1_rd2addr : out std_logic_vector (3 downto 0);
  rfi1_wraddr : out std_logic_vector (3 downto 0);
  rfi1_wrdata : out std_logic_vector (31 downto 0);
  rfi1_ren1 :  out std_logic;
  rfi1_ren2 :  out std_logic;
  rfi1_wren :  out std_logic;
  rfi2_rd1addr : out std_logic_vector (3 downto 0);
  rfi2_rd2addr : out std_logic_vector (3 downto 0);
  rfi2_wraddr : out std_logic_vector (3 downto 0);
  rfi2_wrdata : out std_logic_vector (31 downto 0);
  rfi2_ren1 :  out std_logic;
  rfi2_ren2 :  out std_logic;
  rfi2_wren :  out std_logic;
  rfo1_data1 : in std_logic_vector (31 downto 0);
  rfo1_data2 : in std_logic_vector (31 downto 0);
  rfo2_data1 : in std_logic_vector (31 downto 0);
  rfo2_data2 : in std_logic_vector (31 downto 0));
end component;

component grfpw_0_stratixii
port(
  rst :  in std_logic;
  clk :  in std_logic;
  holdn :  in std_logic;
  cpi_flush :  in std_logic;
  cpi_exack :  in std_logic;
  cpi_a_rs1 : in std_logic_vector (4 downto 0);
  cpi_d_pc : in std_logic_vector (31 downto 0);
  cpi_d_inst : in std_logic_vector (31 downto 0);
  cpi_d_cnt : in std_logic_vector (1 downto 0);
  cpi_d_trap :  in std_logic;
  cpi_d_annul :  in std_logic;
  cpi_d_pv :  in std_logic;
  cpi_a_pc : in std_logic_vector (31 downto 0);
  cpi_a_inst : in std_logic_vector (31 downto 0);
  cpi_a_cnt : in std_logic_vector (1 downto 0);
  cpi_a_trap :  in std_logic;
  cpi_a_annul :  in std_logic;
  cpi_a_pv :  in std_logic;
  cpi_e_pc : in std_logic_vector (31 downto 0);
  cpi_e_inst : in std_logic_vector (31 downto 0);
  cpi_e_cnt : in std_logic_vector (1 downto 0);
  cpi_e_trap :  in std_logic;
  cpi_e_annul :  in std_logic;
  cpi_e_pv :  in std_logic;
  cpi_m_pc : in std_logic_vector (31 downto 0);
  cpi_m_inst : in std_logic_vector (31 downto 0);
  cpi_m_cnt : in std_logic_vector (1 downto 0);
  cpi_m_trap :  in std_logic;
  cpi_m_annul :  in std_logic;
  cpi_m_pv :  in std_logic;
  cpi_x_pc : in std_logic_vector (31 downto 0);
  cpi_x_inst : in std_logic_vector (31 downto 0);
  cpi_x_cnt : in std_logic_vector (1 downto 0);
  cpi_x_trap :  in std_logic;
  cpi_x_annul :  in std_logic;
  cpi_x_pv :  in std_logic;
  cpi_lddata : in std_logic_vector (31 downto 0);
  cpi_dbg_enable :  in std_logic;
  cpi_dbg_write :  in std_logic;
  cpi_dbg_fsr :  in std_logic;
  cpi_dbg_addr : in std_logic_vector (4 downto 0);
  cpi_dbg_data : in std_logic_vector (31 downto 0);
  cpo_data : out std_logic_vector (31 downto 0);
  cpo_exc :  out std_logic;
  cpo_cc : out std_logic_vector (1 downto 0);
  cpo_ccv :  out std_logic;
  cpo_ldlock :  out std_logic;
  cpo_holdn :  out std_logic;
  cpo_dbg_data : out std_logic_vector (31 downto 0);
  rfi1_rd1addr : out std_logic_vector (3 downto 0);
  rfi1_rd2addr : out std_logic_vector (3 downto 0);
  rfi1_wraddr : out std_logic_vector (3 downto 0);
  rfi1_wrdata : out std_logic_vector (31 downto 0);
  rfi1_ren1 :  out std_logic;
  rfi1_ren2 :  out std_logic;
  rfi1_wren :  out std_logic;
  rfi2_rd1addr : out std_logic_vector (3 downto 0);
  rfi2_rd2addr : out std_logic_vector (3 downto 0);
  rfi2_wraddr : out std_logic_vector (3 downto 0);
  rfi2_wrdata : out std_logic_vector (31 downto 0);
  rfi2_ren1 :  out std_logic;
  rfi2_ren2 :  out std_logic;
  rfi2_wren :  out std_logic;
  rfo1_data1 : in std_logic_vector (31 downto 0);
  rfo1_data2 : in std_logic_vector (31 downto 0);
  rfo2_data1 : in std_logic_vector (31 downto 0);
  rfo2_data2 : in std_logic_vector (31 downto 0));
end component;

component grfpw_0_cycloneiii
port(
  rst :  in std_logic;
  clk :  in std_logic;
  holdn :  in std_logic;
  cpi_flush :  in std_logic;
  cpi_exack :  in std_logic;
  cpi_a_rs1 : in std_logic_vector (4 downto 0);
  cpi_d_pc : in std_logic_vector (31 downto 0);
  cpi_d_inst : in std_logic_vector (31 downto 0);
  cpi_d_cnt : in std_logic_vector (1 downto 0);
  cpi_d_trap :  in std_logic;
  cpi_d_annul :  in std_logic;
  cpi_d_pv :  in std_logic;
  cpi_a_pc : in std_logic_vector (31 downto 0);
  cpi_a_inst : in std_logic_vector (31 downto 0);
  cpi_a_cnt : in std_logic_vector (1 downto 0);
  cpi_a_trap :  in std_logic;
  cpi_a_annul :  in std_logic;
  cpi_a_pv :  in std_logic;
  cpi_e_pc : in std_logic_vector (31 downto 0);
  cpi_e_inst : in std_logic_vector (31 downto 0);
  cpi_e_cnt : in std_logic_vector (1 downto 0);
  cpi_e_trap :  in std_logic;
  cpi_e_annul :  in std_logic;
  cpi_e_pv :  in std_logic;
  cpi_m_pc : in std_logic_vector (31 downto 0);
  cpi_m_inst : in std_logic_vector (31 downto 0);
  cpi_m_cnt : in std_logic_vector (1 downto 0);
  cpi_m_trap :  in std_logic;
  cpi_m_annul :  in std_logic;
  cpi_m_pv :  in std_logic;
  cpi_x_pc : in std_logic_vector (31 downto 0);
  cpi_x_inst : in std_logic_vector (31 downto 0);
  cpi_x_cnt : in std_logic_vector (1 downto 0);
  cpi_x_trap :  in std_logic;
  cpi_x_annul :  in std_logic;
  cpi_x_pv :  in std_logic;
  cpi_lddata : in std_logic_vector (31 downto 0);
  cpi_dbg_enable :  in std_logic;
  cpi_dbg_write :  in std_logic;
  cpi_dbg_fsr :  in std_logic;
  cpi_dbg_addr : in std_logic_vector (4 downto 0);
  cpi_dbg_data : in std_logic_vector (31 downto 0);
  cpo_data : out std_logic_vector (31 downto 0);
  cpo_exc :  out std_logic;
  cpo_cc : out std_logic_vector (1 downto 0);
  cpo_ccv :  out std_logic;
  cpo_ldlock :  out std_logic;
  cpo_holdn :  out std_logic;
  cpo_dbg_data : out std_logic_vector (31 downto 0);
  rfi1_rd1addr : out std_logic_vector (3 downto 0);
  rfi1_rd2addr : out std_logic_vector (3 downto 0);
  rfi1_wraddr : out std_logic_vector (3 downto 0);
  rfi1_wrdata : out std_logic_vector (31 downto 0);
  rfi1_ren1 :  out std_logic;
  rfi1_ren2 :  out std_logic;
  rfi1_wren :  out std_logic;
  rfi2_rd1addr : out std_logic_vector (3 downto 0);
  rfi2_rd2addr : out std_logic_vector (3 downto 0);
  rfi2_wraddr : out std_logic_vector (3 downto 0);
  rfi2_wrdata : out std_logic_vector (31 downto 0);
  rfi2_ren1 :  out std_logic;
  rfi2_ren2 :  out std_logic;
  rfi2_wren :  out std_logic;
  rfo1_data1 : in std_logic_vector (31 downto 0);
  rfo1_data2 : in std_logic_vector (31 downto 0);
  rfo2_data1 : in std_logic_vector (31 downto 0);
  rfo2_data2 : in std_logic_vector (31 downto 0));
end component;

component grfpw_0_stratixiii
port(
  rst :  in std_logic;
  clk :  in std_logic;
  holdn :  in std_logic;
  cpi_flush :  in std_logic;
  cpi_exack :  in std_logic;
  cpi_a_rs1 : in std_logic_vector (4 downto 0);
  cpi_d_pc : in std_logic_vector (31 downto 0);
  cpi_d_inst : in std_logic_vector (31 downto 0);
  cpi_d_cnt : in std_logic_vector (1 downto 0);
  cpi_d_trap :  in std_logic;
  cpi_d_annul :  in std_logic;
  cpi_d_pv :  in std_logic;
  cpi_a_pc : in std_logic_vector (31 downto 0);
  cpi_a_inst : in std_logic_vector (31 downto 0);
  cpi_a_cnt : in std_logic_vector (1 downto 0);
  cpi_a_trap :  in std_logic;
  cpi_a_annul :  in std_logic;
  cpi_a_pv :  in std_logic;
  cpi_e_pc : in std_logic_vector (31 downto 0);
  cpi_e_inst : in std_logic_vector (31 downto 0);
  cpi_e_cnt : in std_logic_vector (1 downto 0);
  cpi_e_trap :  in std_logic;
  cpi_e_annul :  in std_logic;
  cpi_e_pv :  in std_logic;
  cpi_m_pc : in std_logic_vector (31 downto 0);
  cpi_m_inst : in std_logic_vector (31 downto 0);
  cpi_m_cnt : in std_logic_vector (1 downto 0);
  cpi_m_trap :  in std_logic;
  cpi_m_annul :  in std_logic;
  cpi_m_pv :  in std_logic;
  cpi_x_pc : in std_logic_vector (31 downto 0);
  cpi_x_inst : in std_logic_vector (31 downto 0);
  cpi_x_cnt : in std_logic_vector (1 downto 0);
  cpi_x_trap :  in std_logic;
  cpi_x_annul :  in std_logic;
  cpi_x_pv :  in std_logic;
  cpi_lddata : in std_logic_vector (31 downto 0);
  cpi_dbg_enable :  in std_logic;
  cpi_dbg_write :  in std_logic;
  cpi_dbg_fsr :  in std_logic;
  cpi_dbg_addr : in std_logic_vector (4 downto 0);
  cpi_dbg_data : in std_logic_vector (31 downto 0);
  cpo_data : out std_logic_vector (31 downto 0);
  cpo_exc :  out std_logic;
  cpo_cc : out std_logic_vector (1 downto 0);
  cpo_ccv :  out std_logic;
  cpo_ldlock :  out std_logic;
  cpo_holdn :  out std_logic;
  cpo_dbg_data : out std_logic_vector (31 downto 0);
  rfi1_rd1addr : out std_logic_vector (3 downto 0);
  rfi1_rd2addr : out std_logic_vector (3 downto 0);
  rfi1_wraddr : out std_logic_vector (3 downto 0);
  rfi1_wrdata : out std_logic_vector (31 downto 0);
  rfi1_ren1 :  out std_logic;
  rfi1_ren2 :  out std_logic;
  rfi1_wren :  out std_logic;
  rfi2_rd1addr : out std_logic_vector (3 downto 0);
  rfi2_rd2addr : out std_logic_vector (3 downto 0);
  rfi2_wraddr : out std_logic_vector (3 downto 0);
  rfi2_wrdata : out std_logic_vector (31 downto 0);
  rfi2_ren1 :  out std_logic;
  rfi2_ren2 :  out std_logic;
  rfi2_wren :  out std_logic;
  rfo1_data1 : in std_logic_vector (31 downto 0);
  rfo1_data2 : in std_logic_vector (31 downto 0);
  rfo2_data1 : in std_logic_vector (31 downto 0);
  rfo2_data2 : in std_logic_vector (31 downto 0));
end component;

component grfpw_tsmc90 
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    cpi_flush  	: in std_ulogic;			  -- pipeline flush
    cpi_exack    	: in std_ulogic;			  -- FP exception acknowledge
    cpi_a_rs1  	: in std_logic_vector(4 downto 0);
    cpi_d_pc    : in std_logic_vector(31 downto 0);
    cpi_d_inst  : in std_logic_vector(31 downto 0);
    cpi_d_cnt   : in std_logic_vector(1 downto 0);
    cpi_d_trap  : in std_ulogic;
    cpi_d_annul : in std_ulogic;
    cpi_d_pv    : in std_ulogic;
    cpi_a_pc    : in std_logic_vector(31 downto 0);
    cpi_a_inst  : in std_logic_vector(31 downto 0);
    cpi_a_cnt   : in std_logic_vector(1 downto 0);
    cpi_a_trap  : in std_ulogic;
    cpi_a_annul : in std_ulogic;
    cpi_a_pv    : in std_ulogic;
    cpi_e_pc    : in std_logic_vector(31 downto 0);
    cpi_e_inst  : in std_logic_vector(31 downto 0);
    cpi_e_cnt   : in std_logic_vector(1 downto 0);
    cpi_e_trap  : in std_ulogic;
    cpi_e_annul : in std_ulogic;
    cpi_e_pv    : in std_ulogic;
    cpi_m_pc    : in std_logic_vector(31 downto 0);
    cpi_m_inst  : in std_logic_vector(31 downto 0);
    cpi_m_cnt   : in std_logic_vector(1 downto 0);
    cpi_m_trap  : in std_ulogic;
    cpi_m_annul : in std_ulogic;
    cpi_m_pv    : in std_ulogic;
    cpi_x_pc    : in std_logic_vector(31 downto 0);
    cpi_x_inst  : in std_logic_vector(31 downto 0);
    cpi_x_cnt   : in std_logic_vector(1 downto 0);
    cpi_x_trap  : in std_ulogic;
    cpi_x_annul : in std_ulogic;
    cpi_x_pv    : in std_ulogic;    
    cpi_lddata        : in std_logic_vector(31 downto 0);     -- load data
    cpi_dbg_enable : in std_ulogic;
    cpi_dbg_write  : in std_ulogic;
    cpi_dbg_fsr    : in std_ulogic;                            -- FSR access
    cpi_dbg_addr   : in std_logic_vector(4 downto 0);
    cpi_dbg_data   : in std_logic_vector(31 downto 0);

    cpo_data          : out std_logic_vector(31 downto 0); -- store data
    cpo_exc  	        : out std_logic;			 -- FP exception
    cpo_cc           : out std_logic_vector(1 downto 0);  -- FP condition codes
    cpo_ccv  	       : out std_ulogic;			 -- FP condition codes valid
    cpo_ldlock       : out std_logic;			 -- FP pipeline hold
    cpo_holdn         : out std_ulogic;
    --cpo_restart      : out std_ulogic;
    cpo_dbg_data     : out std_logic_vector(31 downto 0);

    rfi1_rd1addr 	: out std_logic_vector(3 downto 0); 
    rfi1_rd2addr 	: out std_logic_vector(3 downto 0); 
    rfi1_wraddr 	: out std_logic_vector(3 downto 0); 
    rfi1_wrdata 	: out std_logic_vector(31 downto 0);
    rfi1_ren1        : out std_ulogic;			   
    rfi1_ren2        : out std_ulogic;			   
    rfi1_wren        : out std_ulogic;			   
    
    rfi2_rd1addr 	: out std_logic_vector(3 downto 0); 
    rfi2_rd2addr 	: out std_logic_vector(3 downto 0); 
    rfi2_wraddr 	: out std_logic_vector(3 downto 0); 
    rfi2_wrdata 	: out std_logic_vector(31 downto 0);
    rfi2_ren1        : out std_ulogic;
    rfi2_ren2        : out std_ulogic;			        
    rfi2_wren        : out std_ulogic;

    rfo1_data1    	: in std_logic_vector(31 downto 0);
    rfo1_data2    	: in std_logic_vector(31 downto 0);    
    rfo2_data1    	: in std_logic_vector(31 downto 0);
    rfo2_data2    	: in std_logic_vector(31 downto 0)
    );
end component;

component grfpw_tm65gplus 
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    cpi_flush  	: in std_ulogic;			  -- pipeline flush
    cpi_exack    	: in std_ulogic;			  -- FP exception acknowledge
    cpi_a_rs1  	: in std_logic_vector(4 downto 0);
    cpi_d_pc    : in std_logic_vector(31 downto 0);
    cpi_d_inst  : in std_logic_vector(31 downto 0);
    cpi_d_cnt   : in std_logic_vector(1 downto 0);
    cpi_d_trap  : in std_ulogic;
    cpi_d_annul : in std_ulogic;
    cpi_d_pv    : in std_ulogic;
    cpi_a_pc    : in std_logic_vector(31 downto 0);
    cpi_a_inst  : in std_logic_vector(31 downto 0);
    cpi_a_cnt   : in std_logic_vector(1 downto 0);
    cpi_a_trap  : in std_ulogic;
    cpi_a_annul : in std_ulogic;
    cpi_a_pv    : in std_ulogic;
    cpi_e_pc    : in std_logic_vector(31 downto 0);
    cpi_e_inst  : in std_logic_vector(31 downto 0);
    cpi_e_cnt   : in std_logic_vector(1 downto 0);
    cpi_e_trap  : in std_ulogic;
    cpi_e_annul : in std_ulogic;
    cpi_e_pv    : in std_ulogic;
    cpi_m_pc    : in std_logic_vector(31 downto 0);
    cpi_m_inst  : in std_logic_vector(31 downto 0);
    cpi_m_cnt   : in std_logic_vector(1 downto 0);
    cpi_m_trap  : in std_ulogic;
    cpi_m_annul : in std_ulogic;
    cpi_m_pv    : in std_ulogic;
    cpi_x_pc    : in std_logic_vector(31 downto 0);
    cpi_x_inst  : in std_logic_vector(31 downto 0);
    cpi_x_cnt   : in std_logic_vector(1 downto 0);
    cpi_x_trap  : in std_ulogic;
    cpi_x_annul : in std_ulogic;
    cpi_x_pv    : in std_ulogic;    
    cpi_lddata        : in std_logic_vector(31 downto 0);     -- load data
    cpi_dbg_enable : in std_ulogic;
    cpi_dbg_write  : in std_ulogic;
    cpi_dbg_fsr    : in std_ulogic;                            -- FSR access
    cpi_dbg_addr   : in std_logic_vector(4 downto 0);
    cpi_dbg_data   : in std_logic_vector(31 downto 0);

    cpo_data          : out std_logic_vector(31 downto 0); -- store data
    cpo_exc  	        : out std_logic;			 -- FP exception
    cpo_cc           : out std_logic_vector(1 downto 0);  -- FP condition codes
    cpo_ccv  	       : out std_ulogic;			 -- FP condition codes valid
    cpo_ldlock       : out std_logic;			 -- FP pipeline hold
    cpo_holdn         : out std_ulogic;
    --cpo_restart      : out std_ulogic;
    cpo_dbg_data     : out std_logic_vector(31 downto 0);

    rfi1_rd1addr 	: out std_logic_vector(3 downto 0); 
    rfi1_rd2addr 	: out std_logic_vector(3 downto 0); 
    rfi1_wraddr 	: out std_logic_vector(3 downto 0); 
    rfi1_wrdata 	: out std_logic_vector(31 downto 0);
    rfi1_ren1        : out std_ulogic;			   
    rfi1_ren2        : out std_ulogic;			   
    rfi1_wren        : out std_ulogic;			   
    
    rfi2_rd1addr 	: out std_logic_vector(3 downto 0); 
    rfi2_rd2addr 	: out std_logic_vector(3 downto 0); 
    rfi2_wraddr 	: out std_logic_vector(3 downto 0); 
    rfi2_wrdata 	: out std_logic_vector(31 downto 0);
    rfi2_ren1        : out std_ulogic;
    rfi2_ren2        : out std_ulogic;			        
    rfi2_wren        : out std_ulogic;

    rfo1_data1    	: in std_logic_vector(31 downto 0);
    rfo1_data2    	: in std_logic_vector(31 downto 0);    
    rfo2_data1    	: in std_logic_vector(31 downto 0);
    rfo2_data2    	: in std_logic_vector(31 downto 0)
    );
end component;

component grfpw_cust1 
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    cpi_flush  	: in std_ulogic;			  -- pipeline flush
    cpi_exack    	: in std_ulogic;			  -- FP exception acknowledge
    cpi_a_rs1  	: in std_logic_vector(4 downto 0);
    cpi_d_pc    : in std_logic_vector(31 downto 0);
    cpi_d_inst  : in std_logic_vector(31 downto 0);
    cpi_d_cnt   : in std_logic_vector(1 downto 0);
    cpi_d_trap  : in std_ulogic;
    cpi_d_annul : in std_ulogic;
    cpi_d_pv    : in std_ulogic;
    cpi_a_pc    : in std_logic_vector(31 downto 0);
    cpi_a_inst  : in std_logic_vector(31 downto 0);
    cpi_a_cnt   : in std_logic_vector(1 downto 0);
    cpi_a_trap  : in std_ulogic;
    cpi_a_annul : in std_ulogic;
    cpi_a_pv    : in std_ulogic;
    cpi_e_pc    : in std_logic_vector(31 downto 0);
    cpi_e_inst  : in std_logic_vector(31 downto 0);
    cpi_e_cnt   : in std_logic_vector(1 downto 0);
    cpi_e_trap  : in std_ulogic;
    cpi_e_annul : in std_ulogic;
    cpi_e_pv    : in std_ulogic;
    cpi_m_pc    : in std_logic_vector(31 downto 0);
    cpi_m_inst  : in std_logic_vector(31 downto 0);
    cpi_m_cnt   : in std_logic_vector(1 downto 0);
    cpi_m_trap  : in std_ulogic;
    cpi_m_annul : in std_ulogic;
    cpi_m_pv    : in std_ulogic;
    cpi_x_pc    : in std_logic_vector(31 downto 0);
    cpi_x_inst  : in std_logic_vector(31 downto 0);
    cpi_x_cnt   : in std_logic_vector(1 downto 0);
    cpi_x_trap  : in std_ulogic;
    cpi_x_annul : in std_ulogic;
    cpi_x_pv    : in std_ulogic;    
    cpi_lddata        : in std_logic_vector(31 downto 0);     -- load data
    cpi_dbg_enable : in std_ulogic;
    cpi_dbg_write  : in std_ulogic;
    cpi_dbg_fsr    : in std_ulogic;                            -- FSR access
    cpi_dbg_addr   : in std_logic_vector(4 downto 0);
    cpi_dbg_data   : in std_logic_vector(31 downto 0);

    cpo_data          : out std_logic_vector(31 downto 0); -- store data
    cpo_exc  	        : out std_logic;			 -- FP exception
    cpo_cc           : out std_logic_vector(1 downto 0);  -- FP condition codes
    cpo_ccv  	       : out std_ulogic;			 -- FP condition codes valid
    cpo_ldlock       : out std_logic;			 -- FP pipeline hold
    cpo_holdn         : out std_ulogic;
    --cpo_restart      : out std_ulogic;
    cpo_dbg_data     : out std_logic_vector(31 downto 0);

    rfi1_rd1addr 	: out std_logic_vector(3 downto 0); 
    rfi1_rd2addr 	: out std_logic_vector(3 downto 0); 
    rfi1_wraddr 	: out std_logic_vector(3 downto 0); 
    rfi1_wrdata 	: out std_logic_vector(31 downto 0);
    rfi1_ren1        : out std_ulogic;			   
    rfi1_ren2        : out std_ulogic;			   
    rfi1_wren        : out std_ulogic;			   
    
    rfi2_rd1addr 	: out std_logic_vector(3 downto 0); 
    rfi2_rd2addr 	: out std_logic_vector(3 downto 0); 
    rfi2_wraddr 	: out std_logic_vector(3 downto 0); 
    rfi2_wrdata 	: out std_logic_vector(31 downto 0);
    rfi2_ren1        : out std_ulogic;
    rfi2_ren2        : out std_ulogic;			        
    rfi2_wren        : out std_ulogic;

    rfo1_data1    	: in std_logic_vector(31 downto 0);
    rfo1_data2    	: in std_logic_vector(31 downto 0);    
    rfo2_data1    	: in std_logic_vector(31 downto 0);
    rfo2_data2    	: in std_logic_vector(31 downto 0)
    );
end component;

  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0_tsmc90 : label is TRUE;
  attribute DONT_TOUCH of u0_tm65gplus : label is TRUE;

--  signal disasen : std_logic;

begin

--  disasen <= '1' when disas /= 0 else '0';

  uni : if (is_unisim(tech) = 1) generate
    grfpw0 : grfpw_0_unisim
      port map (rst, clk, holdn, cpi_flush, cpi_exack, cpi_a_rs1, cpi_d_pc,
    	cpi_d_inst, cpi_d_cnt, cpi_d_trap, cpi_d_annul, cpi_d_pv, cpi_a_pc,
    	cpi_a_inst, cpi_a_cnt, cpi_a_trap, cpi_a_annul, cpi_a_pv, cpi_e_pc, 
    	cpi_e_inst, cpi_e_cnt, cpi_e_trap, cpi_e_annul, cpi_e_pv, cpi_m_pc, 
    	cpi_m_inst, cpi_m_cnt, cpi_m_trap, cpi_m_annul, cpi_m_pv, cpi_x_pc, 
    	cpi_x_inst, cpi_x_cnt, cpi_x_trap, cpi_x_annul, cpi_x_pv, cpi_lddata, 
    	cpi_dbg_enable, cpi_dbg_write, cpi_dbg_fsr, cpi_dbg_addr, cpi_dbg_data, 
    	cpo_data, cpo_exc, cpo_cc, cpo_ccv, cpo_ldlock, cpo_holdn, cpo_dbg_data, 
    	rfi1_rd1addr, rfi1_rd2addr, rfi1_wraddr, rfi1_wrdata, rfi1_ren1, 
    	rfi1_ren2, rfi1_wren, rfi2_rd1addr, rfi2_rd2addr, rfi2_wraddr,
    	rfi2_wrdata, rfi2_ren1, rfi2_ren2, rfi2_wren, rfo1_data1, 
    	rfo1_data2, rfo2_data1, rfo2_data2);--, disasen);
  end generate;

  alt : if (tech = altera) generate     -- Cyclone, Cyclone V
    grfpw0 : grfpw_0_altera
      port map (rst, clk, holdn, cpi_flush, cpi_exack, cpi_a_rs1, cpi_d_pc,
    	cpi_d_inst, cpi_d_cnt, cpi_d_trap, cpi_d_annul, cpi_d_pv, cpi_a_pc,
    	cpi_a_inst, cpi_a_cnt, cpi_a_trap, cpi_a_annul, cpi_a_pv, cpi_e_pc, 
    	cpi_e_inst, cpi_e_cnt, cpi_e_trap, cpi_e_annul, cpi_e_pv, cpi_m_pc, 
    	cpi_m_inst, cpi_m_cnt, cpi_m_trap, cpi_m_annul, cpi_m_pv, cpi_x_pc, 
    	cpi_x_inst, cpi_x_cnt, cpi_x_trap, cpi_x_annul, cpi_x_pv, cpi_lddata, 
    	cpi_dbg_enable, cpi_dbg_write, cpi_dbg_fsr, cpi_dbg_addr, cpi_dbg_data, 
    	cpo_data, cpo_exc, cpo_cc, cpo_ccv, cpo_ldlock, cpo_holdn, cpo_dbg_data, 
    	rfi1_rd1addr, rfi1_rd2addr, rfi1_wraddr, rfi1_wrdata, rfi1_ren1, 
    	rfi1_ren2, rfi1_wren, rfi2_rd1addr, rfi2_rd2addr, rfi2_wraddr,
    	rfi2_wrdata, rfi2_ren1, rfi2_ren2, rfi2_wren, rfo1_data1, 
    	rfo1_data2, rfo2_data1, rfo2_data2 );
  end generate;
  
  strtx : if (tech = stratix1) or (tech = stratix2) generate
    grfpw0 : grfpw_0_stratixii
      port map (rst, clk, holdn, cpi_flush, cpi_exack, cpi_a_rs1, cpi_d_pc,
    	cpi_d_inst, cpi_d_cnt, cpi_d_trap, cpi_d_annul, cpi_d_pv, cpi_a_pc,
    	cpi_a_inst, cpi_a_cnt, cpi_a_trap, cpi_a_annul, cpi_a_pv, cpi_e_pc, 
    	cpi_e_inst, cpi_e_cnt, cpi_e_trap, cpi_e_annul, cpi_e_pv, cpi_m_pc, 
    	cpi_m_inst, cpi_m_cnt, cpi_m_trap, cpi_m_annul, cpi_m_pv, cpi_x_pc, 
    	cpi_x_inst, cpi_x_cnt, cpi_x_trap, cpi_x_annul, cpi_x_pv, cpi_lddata, 
    	cpi_dbg_enable, cpi_dbg_write, cpi_dbg_fsr, cpi_dbg_addr, cpi_dbg_data, 
    	cpo_data, cpo_exc, cpo_cc, cpo_ccv, cpo_ldlock, cpo_holdn, cpo_dbg_data, 
    	rfi1_rd1addr, rfi1_rd2addr, rfi1_wraddr, rfi1_wrdata, rfi1_ren1, 
    	rfi1_ren2, rfi1_wren, rfi2_rd1addr, rfi2_rd2addr, rfi2_wraddr,
    	rfi2_wrdata, rfi2_ren1, rfi2_ren2, rfi2_wren, rfo1_data1, 
    	rfo1_data2, rfo2_data1, rfo2_data2 );
  end generate;

  strtxiii : if (tech = stratix3) or (tech = stratix4) or (tech = stratix5) generate
    grfpw0 : grfpw_0_stratixiii
      port map (rst, clk, holdn, cpi_flush, cpi_exack, cpi_a_rs1, cpi_d_pc,
    	cpi_d_inst, cpi_d_cnt, cpi_d_trap, cpi_d_annul, cpi_d_pv, cpi_a_pc,
    	cpi_a_inst, cpi_a_cnt, cpi_a_trap, cpi_a_annul, cpi_a_pv, cpi_e_pc, 
    	cpi_e_inst, cpi_e_cnt, cpi_e_trap, cpi_e_annul, cpi_e_pv, cpi_m_pc, 
    	cpi_m_inst, cpi_m_cnt, cpi_m_trap, cpi_m_annul, cpi_m_pv, cpi_x_pc, 
    	cpi_x_inst, cpi_x_cnt, cpi_x_trap, cpi_x_annul, cpi_x_pv, cpi_lddata, 
    	cpi_dbg_enable, cpi_dbg_write, cpi_dbg_fsr, cpi_dbg_addr, cpi_dbg_data, 
    	cpo_data, cpo_exc, cpo_cc, cpo_ccv, cpo_ldlock, cpo_holdn, cpo_dbg_data, 
    	rfi1_rd1addr, rfi1_rd2addr, rfi1_wraddr, rfi1_wrdata, rfi1_ren1, 
    	rfi1_ren2, rfi1_wren, rfi2_rd1addr, rfi2_rd2addr, rfi2_wraddr,
    	rfi2_wrdata, rfi2_ren1, rfi2_ren2, rfi2_wren, rfo1_data1, 
    	rfo1_data2, rfo2_data1, rfo2_data2 );
  end generate;
  
  cyc3 : if (tech = cyclone3) generate
    grfpw0 : grfpw_0_cycloneiii
      port map (rst, clk, holdn, cpi_flush, cpi_exack, cpi_a_rs1, cpi_d_pc,
    	cpi_d_inst, cpi_d_cnt, cpi_d_trap, cpi_d_annul, cpi_d_pv, cpi_a_pc,
    	cpi_a_inst, cpi_a_cnt, cpi_a_trap, cpi_a_annul, cpi_a_pv, cpi_e_pc, 
    	cpi_e_inst, cpi_e_cnt, cpi_e_trap, cpi_e_annul, cpi_e_pv, cpi_m_pc, 
    	cpi_m_inst, cpi_m_cnt, cpi_m_trap, cpi_m_annul, cpi_m_pv, cpi_x_pc, 
    	cpi_x_inst, cpi_x_cnt, cpi_x_trap, cpi_x_annul, cpi_x_pv, cpi_lddata, 
    	cpi_dbg_enable, cpi_dbg_write, cpi_dbg_fsr, cpi_dbg_addr, cpi_dbg_data, 
    	cpo_data, cpo_exc, cpo_cc, cpo_ccv, cpo_ldlock, cpo_holdn, cpo_dbg_data, 
    	rfi1_rd1addr, rfi1_rd2addr, rfi1_wraddr, rfi1_wrdata, rfi1_ren1, 
    	rfi1_ren2, rfi1_wren, rfi2_rd1addr, rfi2_rd2addr, rfi2_wraddr,
    	rfi2_wrdata, rfi2_ren1, rfi2_ren2, rfi2_wren, rfo1_data1, 
    	rfo1_data2, rfo2_data1, rfo2_data2 );
  end generate;
  
  u0_tsmc90 : if tech = tsmc90 generate
    grfpw0 : grfpw_tsmc90
            port map (rst, clk, holdn, cpi_flush, cpi_exack, cpi_a_rs1, cpi_d_pc,
    	cpi_d_inst, cpi_d_cnt, cpi_d_trap, cpi_d_annul, cpi_d_pv, cpi_a_pc,
    	cpi_a_inst, cpi_a_cnt, cpi_a_trap, cpi_a_annul, cpi_a_pv, cpi_e_pc, 
    	cpi_e_inst, cpi_e_cnt, cpi_e_trap, cpi_e_annul, cpi_e_pv, cpi_m_pc, 
    	cpi_m_inst, cpi_m_cnt, cpi_m_trap, cpi_m_annul, cpi_m_pv, cpi_x_pc, 
    	cpi_x_inst, cpi_x_cnt, cpi_x_trap, cpi_x_annul, cpi_x_pv, cpi_lddata, 
    	cpi_dbg_enable, cpi_dbg_write, cpi_dbg_fsr, cpi_dbg_addr, cpi_dbg_data, 
    	cpo_data, cpo_exc, cpo_cc, cpo_ccv, cpo_ldlock, cpo_holdn, cpo_dbg_data, 
    	rfi1_rd1addr, rfi1_rd2addr, rfi1_wraddr, rfi1_wrdata, rfi1_ren1, 
    	rfi1_ren2, rfi1_wren, rfi2_rd1addr, rfi2_rd2addr, rfi2_wraddr,
    	rfi2_wrdata, rfi2_ren1, rfi2_ren2, rfi2_wren, rfo1_data1, 
    	rfo1_data2, rfo2_data1, rfo2_data2 );
  end generate;
    
  u0_tm65gplus : if tech = tm65gplus generate
    grfpw0 : grfpw_tm65gplus
            port map (rst, clk, holdn, cpi_flush, cpi_exack, cpi_a_rs1, cpi_d_pc,
    	cpi_d_inst, cpi_d_cnt, cpi_d_trap, cpi_d_annul, cpi_d_pv, cpi_a_pc,
    	cpi_a_inst, cpi_a_cnt, cpi_a_trap, cpi_a_annul, cpi_a_pv, cpi_e_pc, 
    	cpi_e_inst, cpi_e_cnt, cpi_e_trap, cpi_e_annul, cpi_e_pv, cpi_m_pc, 
    	cpi_m_inst, cpi_m_cnt, cpi_m_trap, cpi_m_annul, cpi_m_pv, cpi_x_pc, 
    	cpi_x_inst, cpi_x_cnt, cpi_x_trap, cpi_x_annul, cpi_x_pv, cpi_lddata, 
    	cpi_dbg_enable, cpi_dbg_write, cpi_dbg_fsr, cpi_dbg_addr, cpi_dbg_data, 
    	cpo_data, cpo_exc, cpo_cc, cpo_ccv, cpo_ldlock, cpo_holdn, cpo_dbg_data, 
    	rfi1_rd1addr, rfi1_rd2addr, rfi1_wraddr, rfi1_wrdata, rfi1_ren1, 
    	rfi1_ren2, rfi1_wren, rfi2_rd1addr, rfi2_rd2addr, rfi2_wraddr,
    	rfi2_wrdata, rfi2_ren1, rfi2_ren2, rfi2_wren, rfo1_data1, 
    	rfo1_data2, rfo2_data1, rfo2_data2 );
  end generate;

  u0_cust1 : if tech = custom1 generate
    grfpw0 : grfpw_cust1
            port map (rst, clk, holdn, cpi_flush, cpi_exack, cpi_a_rs1, cpi_d_pc,
    	cpi_d_inst, cpi_d_cnt, cpi_d_trap, cpi_d_annul, cpi_d_pv, cpi_a_pc,
    	cpi_a_inst, cpi_a_cnt, cpi_a_trap, cpi_a_annul, cpi_a_pv, cpi_e_pc, 
    	cpi_e_inst, cpi_e_cnt, cpi_e_trap, cpi_e_annul, cpi_e_pv, cpi_m_pc, 
    	cpi_m_inst, cpi_m_cnt, cpi_m_trap, cpi_m_annul, cpi_m_pv, cpi_x_pc, 
    	cpi_x_inst, cpi_x_cnt, cpi_x_trap, cpi_x_annul, cpi_x_pv, cpi_lddata, 
    	cpi_dbg_enable, cpi_dbg_write, cpi_dbg_fsr, cpi_dbg_addr, cpi_dbg_data, 
    	cpo_data, cpo_exc, cpo_cc, cpo_ccv, cpo_ldlock, cpo_holdn, cpo_dbg_data, 
    	rfi1_rd1addr, rfi1_rd2addr, rfi1_wraddr, rfi1_wrdata, rfi1_ren1, 
    	rfi1_ren2, rfi1_wren, rfi2_rd1addr, rfi2_rd2addr, rfi2_wraddr,
    	rfi2_wrdata, rfi2_ren1, rfi2_ren2, rfi2_wren, rfo1_data1, 
    	rfo1_data2, rfo2_data1, rfo2_data2 );
  end generate;

end;
                                

