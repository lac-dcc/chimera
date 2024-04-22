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
-------------------------------------------------------------------------------
-- Entity:      ahb2mig_sp601
-- File:        ahb2mig_sp601.vhd
-- Author:      Jiri Gaisler - Aeroflex Gaisler AB
--
--  This is a AHB-2.0 interface for the Xilinx Spartan-6 MIG.
--  One bidir 32-bit port is used for the main AHB bus.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

entity ahb2mig_sp601 is
  generic(
    hindex     : integer := 0;
    haddr      : integer := 0;
    hmask      : integer := 16#f00#;
    pindex     : integer := 0;
    paddr      : integer := 0;
    pmask      : integer := 16#fff#
  );
  port(
    mcb3_dram_dq      : inout  std_logic_vector(15 downto 0);
    mcb3_dram_a       : out std_logic_vector(12 downto 0);
    mcb3_dram_ba      : out std_logic_vector(2 downto 0);
    mcb3_dram_ras_n   : out std_logic;
    mcb3_dram_cas_n   : out std_logic;
    mcb3_dram_we_n    : out std_logic;
    mcb3_dram_odt     : out std_logic;
    mcb3_dram_cke     : out std_logic;
    mcb3_dram_dm      : out std_logic;
    mcb3_dram_udqs    : inout std_logic;
    mcb3_dram_udqs_n  : inout std_logic;
    mcb3_rzq          : inout std_logic;
    mcb3_zio          : inout std_logic;
    mcb3_dram_udm     : out std_logic;
    mcb3_dram_dqs     : inout std_logic;
    mcb3_dram_dqs_n   : inout std_logic;
    mcb3_dram_ck      : out std_logic;
    mcb3_dram_ck_n    : out std_logic;

    ahbso             : out ahb_slv_out_type;  
    ahbsi             : in  ahb_slv_in_type;
    apbi   	      : in  apb_slv_in_type;
    apbo   	      : out apb_slv_out_type;

    calib_done        : out std_logic;
    test_error	      : out std_logic; 
    rst_n_syn         : in std_logic;
    rst_n_async	      : in std_logic; 
    clk_amba          : in std_logic;
    clk_mem_n         : in std_logic;
    clk_mem_p         : in std_logic
   );
end ;

architecture rtl of ahb2mig_sp601 is 

component mig_37
generic
  (
            C3_P0_MASK_SIZE           : integer := 4;
          C3_P0_DATA_PORT_SIZE      : integer := 32;
          C3_P1_MASK_SIZE           : integer := 4;
          C3_P1_DATA_PORT_SIZE      : integer := 32;
    C3_MEMCLK_PERIOD        : integer := 5000; 
                                       -- Memory data transfer clock period.
    C3_RST_ACT_LOW          : integer := 0; 
                                       -- # = 1 for active low reset,
                                       -- # = 0 for active high reset.
    C3_INPUT_CLK_TYPE       : string := "DIFFERENTIAL"; 
                                       -- input clock type DIFFERENTIAL or SINGLE_ENDED.
    C3_CALIB_SOFT_IP        : string := "TRUE"; 
                                       -- # = TRUE, Enables the soft calibration logic,
                                       -- # = FALSE, Disables the soft calibration logic.
    C3_SIMULATION           : string := "FALSE"; 
                                       -- # = TRUE, Simulating the design. Useful to reduce the simulation time,
                                       -- # = FALSE, Implementing the design.
    DEBUG_EN                : integer := 0; 
                                       -- # = 1, Enable debug signals/controls,
                                       --   = 0, Disable debug signals/controls.
    C3_MEM_ADDR_ORDER       : string := "ROW_BANK_COLUMN"; 
                                       -- The order in which user address is provided to the memory controller,
                                       -- ROW_BANK_COLUMN or BANK_ROW_COLUMN.
    C3_NUM_DQ_PINS          : integer := 16; 
                                       -- External memory data width.
    C3_MEM_ADDR_WIDTH       : integer := 13; 
                                       -- External memory address width.
    C3_MEM_BANKADDR_WIDTH   : integer := 3 
                                       -- External memory bank address width.
  );
   
  port
  (

   mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
   mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
   mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
   mcb3_dram_ras_n                         : out std_logic;
   mcb3_dram_cas_n                         : out std_logic;
   mcb3_dram_we_n                          : out std_logic;
   mcb3_dram_odt                           : out std_logic;
   mcb3_dram_cke                           : out std_logic;
   mcb3_dram_dm                            : out std_logic;
   mcb3_dram_udqs                          : inout  std_logic;
   mcb3_dram_udqs_n                        : inout  std_logic;
   mcb3_rzq                                : inout  std_logic;
   mcb3_zio                                : inout  std_logic;
   mcb3_dram_udm                           : out std_logic;
   c3_sys_clk_p                            : in  std_logic;
   c3_sys_clk_n                            : in  std_logic;
   c3_sys_rst_n                            : in  std_logic;
   c3_calib_done                           : out std_logic;
   c3_clk0                                 : out std_logic;
   c3_rst0                                 : out std_logic;
   mcb3_dram_dqs                           : inout  std_logic;
   mcb3_dram_dqs_n                         : inout  std_logic;
   mcb3_dram_ck                            : out std_logic;
   mcb3_dram_ck_n                          : out std_logic;
   c3_p0_cmd_clk                           : in std_logic;
   c3_p0_cmd_en                            : in std_logic;
   c3_p0_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p0_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p0_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p0_cmd_empty                         : out std_logic;
   c3_p0_cmd_full                          : out std_logic;
   c3_p0_wr_clk                            : in std_logic;
   c3_p0_wr_en                             : in std_logic;
   c3_p0_wr_mask                           : in std_logic_vector(C3_P0_MASK_SIZE - 1 downto 0);
   c3_p0_wr_data                           : in std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
   c3_p0_wr_full                           : out std_logic;
   c3_p0_wr_empty                          : out std_logic;
   c3_p0_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p0_wr_underrun                       : out std_logic;
   c3_p0_wr_error                          : out std_logic;
   c3_p0_rd_clk                            : in std_logic;
   c3_p0_rd_en                             : in std_logic;
   c3_p0_rd_data                           : out std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
   c3_p0_rd_full                           : out std_logic;
   c3_p0_rd_empty                          : out std_logic;
   c3_p0_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p0_rd_overflow                       : out std_logic;
   c3_p0_rd_error                          : out std_logic
  );
end component;

type bstate_type is (idle, start, read1);

constant hconfig : ahb_config_type := (
   0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_MIGDDR2, 0, 0, 0),
   4 => ahb_membar(haddr, '1', '1', hmask),
--   5 => ahb_iobar(ioaddr, iomask),
   others => zero32);

constant pconfig : apb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_MIGDDR2, 0, 0, 0),
  1 => apb_iobar(paddr, pmask));

type reg_type is record 
  bstate 	: bstate_type;
  cmd_bl         :  std_logic_vector(5 downto 0);
  wr_count       :  std_logic_vector(6 downto 0);
  rd_cnt         :  std_logic_vector(5 downto 0);
  hready         : std_logic; 
  hsel           : std_logic; 
  hwrite         : std_logic; 
  htrans         : std_logic_vector(1 downto 0); 
  hburst         : std_logic_vector(2 downto 0); 
  hsize          : std_logic_vector(2 downto 0); 
  hrdata         : std_logic_vector(31 downto 0); 
  haddr          : std_logic_vector(31 downto 0); 
  hmaster        : std_logic_vector(3 downto 0); 
end record; 

type mcb_type is record
  cmd_en         :  std_logic;
  cmd_instr      :  std_logic_vector(2 downto 0);
  cmd_empty      :  std_logic;
  cmd_full       :  std_logic;
  cmd_bl         :  std_logic_vector(5 downto 0);
  cmd_byte_addr  :  std_logic_vector(29 downto 0);
  wr_full        :  std_logic;
  wr_empty       :  std_logic;
  wr_underrun    :  std_logic;
  wr_error       :  std_logic;
  wr_mask        :  std_logic_vector(3 downto 0);
  wr_en          :  std_logic;
  wr_data        :  std_logic_vector(31 downto 0);
  wr_count       :  std_logic_vector(6 downto 0);
  rd_data        : std_logic_vector(31 downto 0);
  rd_full        : std_logic;
  rd_empty       : std_logic;
  rd_count       : std_logic_vector(6 downto 0);
  rd_overflow    : std_logic;
  rd_error       : std_logic; 
  rd_en          : std_logic;
end record; 

signal r, rin    : reg_type; 
signal i         : mcb_type;

begin

  comb: process( rst_n_syn, r, ahbsi, i )
  variable v : reg_type;
  variable wmask : std_logic_vector(3 downto 0);
  variable wr_en : std_logic;
  variable cmd_en         :  std_logic;
  variable cmd_instr      :  std_logic_vector(2 downto 0);
  variable rd_en          : std_logic;
  variable cmd_bl         :  std_logic_vector(5 downto 0);
  variable hwdata         :  std_logic_vector(31 downto 0);
  variable readdata       :  std_logic_vector(31 downto 0);
  begin
    v := r; wr_en := '0'; cmd_en := '0'; cmd_instr := "000";
    rd_en := '0';

    if (ahbsi.hready = '1') then
      if (ahbsi.hsel(hindex) and ahbsi.htrans(1)) = '1' then
	v.hsel := '1'; v.hburst := ahbsi.hburst;
        v.hwrite := ahbsi.hwrite; v.hsize := ahbsi.hsize;
        v.hmaster := ahbsi.hmaster;
        v.hready := '0';
	if ahbsi.htrans(0) = '0' then v.haddr := ahbsi.haddr; end if;
      else
	v.hsel := '0'; v.hready := '1';
      end if;
      v.htrans := ahbsi.htrans;
    end if;

    hwdata := ahbsi.hwdata(15 downto 0) & ahbsi.hwdata(31 downto 16);
    case r.hsize(1 downto 0) is
    when "00" => wmask := not decode(r.haddr(1 downto 0));
      case r.haddr(1 downto 0) is
      when "00" => wmask := "1101";
      when "01" => wmask := "1110";
      when "10" => wmask := "0111";
      when others => wmask := "1011";
      end case;
    when "01" => wmask := not decode(r.haddr(1 downto 0));
                 wmask(3) := wmask(2); wmask(1) := wmask(0);
    when others => wmask := "0000";
    end case;

    i.wr_mask <= wmask;
    cmd_bl := r.cmd_bl;

    case r.bstate is
    when idle =>
      if v.hsel = '1' then 
	v.bstate := start;
	v.hready := ahbsi.hwrite and not i.cmd_full and not i.wr_full;
	v.haddr := ahbsi.haddr;
      end if;
      v.cmd_bl := (others => '0');
    when start =>
      if r.hwrite = '1' then 
	v.haddr := r.haddr;
	if r.hready = '1' then
	  v.cmd_bl := r.cmd_bl + 1; v.hready := '1'; wr_en := '1';
	  if (ahbsi.htrans /= "11") then
            if v.hsel = '1' then 
	      if (ahbsi.hwrite = '0') or (i.wr_count >= "0000100") then
		v.hready := '0';
	      else v.hready := '1'; end if;
	    else v.bstate := idle; end if;
            v.cmd_bl := (others => '0'); v.haddr := ahbsi.haddr;
	    cmd_en := '1';
	  elsif (i.cmd_full = '1') then
	    v.hready := '0';
	  elsif (i.wr_count >= "0101111") then
	    v.hready := '0'; cmd_en := '1';
            v.cmd_bl := (others => '0'); v.haddr := ahbsi.haddr;
	  end if;
	else
	  if (i.cmd_full = '0') and (i.wr_count <= "0001111") then
	    v.hready := '1';
	  end if;
	end if;
      else
        if i.cmd_full = '0' then
	  cmd_en := '1'; cmd_instr(0) := '1';
	  v.cmd_bl := "000" & not r.haddr(4 downto 2);
          cmd_bl := v.cmd_bl;
	  v.bstate := read1;
        end if;
      end if;
    when read1 =>
      v.hready := '0';
      if (r.rd_cnt = "000000") then  -- flush data from previous line
        if (i.rd_empty = '0') or ((r.hready = '1') and (ahbsi.htrans /= "11")) then
	  v.hrdata(31 downto 0) := i.rd_data(15 downto 0) & i.rd_data(31 downto 16); 
	  v.hready := '1'; 
	  if (i.rd_empty = '0') then v.cmd_bl := r.cmd_bl - 1; rd_en := '1'; end if;
	  if (r.cmd_bl = "000000") or (ahbsi.htrans /= "11") then
            if (ahbsi.hsel(hindex) = '1') and (ahbsi.htrans = "10") and (r.hready = '1') then 
	      v.bstate := start; v.hready := ahbsi.hwrite and not i.cmd_full and not i.wr_full;
              v.cmd_bl := (others => '0');
            else
	      v.bstate := idle;
	    end if;
	    if (i.rd_empty = '1') then v.rd_cnt := r.cmd_bl + 1;
	    else v.rd_cnt := r.cmd_bl; end if;
	  end if;
	end if;
      end if;
    when others =>
    end case;

    readdata := (others => '0');
--    case apbi.paddr(5 downto 2) is
--    when "0000" => readdata(nbits-1 downto 0) := r.din2;
--    when "0001" => readdata(nbits-1 downto 0) := r.dout;
--    when others =>
--    end case;

    readdata(20 downto 0) := 
	i.rd_error & i.rd_overflow & i.wr_error & i.wr_underrun &
	i.cmd_full & i.rd_full & i.rd_empty & i.wr_full & i.wr_empty &
	r.rd_cnt & r.cmd_bl;

    if (r.rd_cnt /= "000000") and (i.rd_empty = '0') then 
      rd_en := '1'; v.rd_cnt := r.rd_cnt - 1;
    end if;

    if rst_n_syn = '0' then
      v.rd_cnt := "000000"; v.bstate := idle; v.hready := '1';
    end if;

    rin <= v;
    apbo.prdata <= readdata;

    i.rd_en <= rd_en;
    i.wr_en <= wr_en;
    i.cmd_bl <= cmd_bl;
    i.cmd_en <= cmd_en;
    i.cmd_instr <= cmd_instr;
    i.wr_data <= hwdata;

  end process;

  i.cmd_byte_addr <= r.haddr(29 downto 2) & "00";

  ahbso.hready  <= r.hready;
  ahbso.hresp   <= "00"; --r.hresp;
  ahbso.hrdata  <= r.hrdata; 

  ahbso.hconfig <= hconfig;
  ahbso.hirq    <= (others => '0');
  ahbso.hindex  <= hindex;
  ahbso.hsplit  <= (others => '0');

  apbo.pindex <= pindex;
  apbo.pconfig <= pconfig;

  regs : process(clk_amba)
  begin
    if rising_edge(clk_amba) then 
      r <= rin;
    end if;
  end process;   

  MCB_inst : entity work.mig_37 generic map(

   C3_P0_MASK_SIZE         => 4,
   C3_P0_DATA_PORT_SIZE    => 32,
   C3_P1_MASK_SIZE         => 4,
   C3_P1_DATA_PORT_SIZE    => 32,
   C3_MEMCLK_PERIOD        => 5000,
   C3_RST_ACT_LOW          =>   1,
--   C3_INPUT_CLK_TYPE       => "DIFFERENTIAL",
   C3_CALIB_SOFT_IP        => "TRUE",
-- pragma translate_off
   C3_SIMULATION           => "TRUE",
-- pragma translate_on
   C3_MEM_ADDR_ORDER       => "BANK_ROW_COLUMN",
   C3_NUM_DQ_PINS          => 16,
   C3_MEM_ADDR_WIDTH       => 13,
   C3_MEM_BANKADDR_WIDTH   => 3 
--   C3_MC_CALIB_BYPASS      => "YES"

  )
  port map (
   mcb3_dram_dq      => mcb3_dram_dq,
   mcb3_dram_a       => mcb3_dram_a,
   mcb3_dram_ba      => mcb3_dram_ba,
   mcb3_dram_ras_n   => mcb3_dram_ras_n,                
   mcb3_dram_cas_n   => mcb3_dram_cas_n,    
   mcb3_dram_we_n    => mcb3_dram_we_n,     
   mcb3_dram_odt     => mcb3_dram_odt,        
   mcb3_dram_cke     => mcb3_dram_cke,   
   mcb3_dram_dm      => mcb3_dram_dm,     
   mcb3_dram_udqs    => mcb3_dram_udqs,   
   mcb3_dram_udqs_n  => mcb3_dram_udqs_n,
   mcb3_rzq          => mcb3_rzq,        
   mcb3_zio          => mcb3_zio,  
   mcb3_dram_udm     => mcb3_dram_udm, 
   c3_sys_clk_p      => clk_mem_p,                     
   c3_sys_clk_n      => clk_mem_n,
   c3_sys_rst_n      => rst_n_async,
   c3_calib_done     => calib_done,
   c3_clk0           => open,
   c3_rst0           => open,
   mcb3_dram_dqs     => mcb3_dram_dqs,
   mcb3_dram_dqs_n   => mcb3_dram_dqs_n,
   mcb3_dram_ck      => mcb3_dram_ck,
   mcb3_dram_ck_n    => mcb3_dram_ck_n,
   c3_p0_cmd_clk     => clk_amba,
   c3_p0_cmd_en      => i.cmd_en,
   c3_p0_cmd_instr   => i.cmd_instr,
   c3_p0_cmd_bl      => i.cmd_bl,
   c3_p0_cmd_byte_addr => i.cmd_byte_addr,
   c3_p0_cmd_empty   => i.cmd_empty,
   c3_p0_cmd_full    => i.cmd_full,
   c3_p0_wr_clk      => clk_amba,
   c3_p0_wr_en       => i.wr_en,
   c3_p0_wr_mask     => i.wr_mask,
   c3_p0_wr_data     => i.wr_data,
   c3_p0_wr_full     => i.wr_full,
   c3_p0_wr_empty    => i.wr_empty,
   c3_p0_wr_count    => i.wr_count,
   c3_p0_wr_underrun => i.wr_underrun,
   c3_p0_wr_error    => i.wr_error,
   c3_p0_rd_clk      => clk_amba,
   c3_p0_rd_en       => i.rd_en,
   c3_p0_rd_data     => i.rd_data,
   c3_p0_rd_full     => i.rd_full,
   c3_p0_rd_empty    => i.rd_empty,
   c3_p0_rd_count    => i.rd_count,
   c3_p0_rd_overflow => i.rd_overflow,
   c3_p0_rd_error    => i.rd_error
   );

end;

