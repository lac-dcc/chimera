-------------------------------------------------------------------------------
-- Title      :
-- Project    : Wishbone2AXI
-------------------------------------------------------------------------------
-- File       : XwbXaxi.vhd
-- Authors    : Piotr Miedzik <qermit@sezamkowa.net>
--            : Adrian Byszuk <adrian.byszuk@gmail.com>
-- Company    :
-- Created    : 2017-01-10
-- Last update: 2017-08-31
-- License    : This is a PUBLIC DOMAIN code, published under
--              Creative Commons CC0 license
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Wishbone -> AXI4, AXI4 -> Wishbone converter
-------------------------------------------------------------------------------
-- Copyleft (ↄ) 2017 
-------------------------------------------------------------------------------
-- Revisions  : see git commit log
-------------------------------------------------------------------------------
-- External requirements :
-- * genram_pkg.vhd
-- * memory_loader_pkg.vhd
-- * inferred_sync_fifo.vhd
-- * generic_dpram.vhd
-- * generic_dpram_sameclock.vhd
-- * generic_dpram_dualclock.vhd
-- * wishbone_pkg.vhd
-- * wb_slave_adapter.vhd
-- * wb_helpers_pkg.vhd
-- * axi_helpers_pkg.vhd
-------------------------------------------------------------------------------
-- Implementation details
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.axi_helpers_pkg.all;
use work.wishbone_pkg.all;
use work.wb_helpers_pkg.all;

entity XwbXaxi is
  generic (
    -- Users to add parameters here
    C_MASTER_MODE : string := "AXI4"; --AXI4, AXI4LITE, CLASSIC, PIPELINED
    C_SLAVE_MODE  : string := "AXI4LITE"; --AXI4, AXI4LITE, CLASSIC, PIPELINED
    
    C_S_WB_ADR_WIDTH : integer := 32;
    C_S_WB_DAT_WIDTH : integer := 32;

    C_M_WB_ADR_WIDTH : integer := 32;
    C_M_WB_DAT_WIDTH : integer := 32;
    C_WB_ADDRESS_GRANULARITY : string := "BYTE"; -- BYTE, WORD
    -- User parameters ends
    -- Do not modify the parameters beyond this line

    -- Parameters of Axi Slave Bus Interface S_AXI4_LITE
    C_S_AXI4_LITE_DATA_WIDTH : integer := 32;
    C_S_AXI4_LITE_ADDR_WIDTH : integer := 32;

    -- Parameters of Axi Slave Bus Interface S_AXI4
    C_S_AXI4_ID_WIDTH     : integer := 1;
    C_S_AXI4_DATA_WIDTH   : integer := 32;
    C_S_AXI4_ADDR_WIDTH   : integer := 6;
    C_S_AXI4_AWUSER_WIDTH : integer := 0;
    C_S_AXI4_ARUSER_WIDTH : integer := 0;
    C_S_AXI4_WUSER_WIDTH  : integer := 0;
    C_S_AXI4_RUSER_WIDTH  : integer := 0;
    C_S_AXI4_BUSER_WIDTH  : integer := 0;

    -- Parameters of Axi Master Bus Interface M_AXI4_LITE
    C_M_AXI4_LITE_START_DATA_VALUE       : std_logic_vector := x"AA000000";
    C_M_AXI4_LITE_TARGET_SLAVE_BASE_ADDR : std_logic_vector := x"40000000";
    C_M_AXI4_LITE_ADDR_WIDTH             : integer          := 32;
    C_M_AXI4_LITE_DATA_WIDTH             : integer          := 32;
    C_M_AXI4_LITE_TRANSACTIONS_NUM       : integer          := 4;

    -- Parameters of Axi Master Bus Interface M_AXI4
    C_M_AXI4_TARGET_SLAVE_BASE_ADDR : std_logic_vector := x"40000000";
    C_M_AXI4_BURST_LEN              : integer          := 16;
    C_M_AXI4_ID_WIDTH               : integer          := 1;
    C_M_AXI4_ADDR_WIDTH             : integer          := 32;
    C_M_AXI4_DATA_WIDTH             : integer          := 32;
    C_M_AXI4_AWUSER_WIDTH           : integer          := 0;
    C_M_AXI4_ARUSER_WIDTH           : integer          := 0;
    C_M_AXI4_WUSER_WIDTH            : integer          := 0;
    C_M_AXI4_RUSER_WIDTH            : integer          := 0;
    C_M_AXI4_BUSER_WIDTH            : integer          := 0
    );
    
  port (
  
    aclk : in std_logic;
    aresetn : in std_logic;
    
    s_wb_m2s : in  t_wishbone_master_out;
	s_wb_s2m : out t_wishbone_slave_out;
	
	m_wb_m2s : out t_wishbone_master_out;
	m_wb_s2m : in  t_wishbone_slave_out;
	
    -- slave axi-lite/axi4 port
    s_axi4_m2s : in  t_axi4_m2s;
    s_axi4_s2m : out t_axi4_s2m;

    -- master axi-lite/axi4 port
    m_axi4_m2s : out t_axi4_m2s;
    m_axi4_s2m : in  t_axi4_s2m

    );
end XwbXaxi;

architecture arch_imp of XwbXaxi is

  function f_mode_supported(x_master: string; x_slave: string) return boolean is
  begin
    if    x_master = "CLASSIC"   and x_slave = "CLASSIC" then return true;
    elsif x_master = "PIPELINED" and x_slave = "CLASSIC" then return false;
    elsif x_master = "AXI4LITE"  and x_slave = "CLASSIC" then return true;
    elsif x_master = "AXI4"      and x_slave = "CLASSIC" then return false;
        
    elsif x_master = "CLASSIC"   and x_slave = "PIPELINED" then return false;
    elsif x_master = "PIPELINED" and x_slave = "PIPELINED" then return true;
    elsif x_master = "AXI4LITE"  and x_slave = "PIPELINED" then return true;
    elsif x_master = "AXI4"      and x_slave = "PIPELINED" then return false;    

    elsif x_master = "CLASSIC"   and x_slave = "AXI4LITE" then return true;
    elsif x_master = "PIPELINED" and x_slave = "AXI4LITE" then return true;
    elsif x_master = "AXI4LITE"  and x_slave = "AXI4LITE" then return true;
    elsif x_master = "AXI4"      and x_slave = "AXI4LITE" then return false;    

    elsif x_master = "CLASSIC"   and x_slave = "AXI4" then return false;
    elsif x_master = "PIPELINED" and x_slave = "AXI4" then return false;
    elsif x_master = "AXI4LITE"  and x_slave = "AXI4" then return false;
    elsif x_master = "AXI4"      and x_slave = "AXI4" then return true;    
    
    else return false;
    end if;
  end f_mode_supported;
  


  function f_str_is_axi(x : string) return boolean is
  begin
    if x = "AXI4" then return true;
    elsif x = "AXI4LITE" then return true;
    else return false;
    end if;
  end f_str_is_axi;
  
  function f_str_is_wb(x : string) return boolean is
  begin
    if x = "PIPELINED" then return true;
    elsif x = "CLASSIC" then return true;
    else return false;
    end if;
  end f_str_is_wb;


component WishboneAXI_v0_2_M_AXI4_LITE is
  generic (
    -- Users to add parameters here
    C_WB_ADR_WIDTH : integer := 32;
    C_WB_DAT_WIDTH : integer := 32;
    -- wb always pipelined
    --C_WB_MODE      : t_wishbone_interface_mode := PIPELINED;

    C_M_AXI_ADDR_WIDTH         : integer          := 32;
    C_M_AXI_DATA_WIDTH         : integer          := 32
    );
  port (

    
    aclk : in std_logic;
    aresetn : in std_logic;
    -- Users to add ports here
    s_wb_m2s : in  t_wishbone_slave_in;
    s_wb_s2m : out t_wishbone_slave_out;
    -- User ports ends
    
    
    -- Do not modify the ports beyond this line

    m_axi_s2m : in t_axi4_s2m;
    m_axi_m2s : out t_axi4_m2s
    
    );
end component;

component WishboneAXI_v0_2_S_AXI4_LITE is
  generic (
    -- Users to add parameters here
    C_WB_ADR_WIDTH : integer;
    C_WB_DAT_WIDTH : integer;
    C_WB_MODE      : t_wishbone_interface_mode ;
    -- User parameters ends
    -- Do not modify the parameters beyond this line

    -- Width of S_AXI data bus
    C_S_AXI_DATA_WIDTH : integer := 32;
    -- Width of S_AXI address bus
    C_S_AXI_ADDR_WIDTH : integer := 4
    );
  port (
  
    aclk : in std_logic;
    aresetn : in std_logic;
    -- Users to add ports here
	m_wb_m2s : out t_wishbone_master_out;
    m_wb_s2m : in  t_wishbone_slave_out;
    -- User ports ends
    -- Do not modify the ports beyond this line
    s_axi_m2s : in t_axi4_m2s;
    s_axi_s2m : out t_axi4_s2m
    
    );
end component;

begin

GEN_BYPASS: if C_MASTER_MODE = C_SLAVE_MODE  generate
GEN_BYPASS_WB: if f_str_is_wb(C_MASTER_MODE) generate
  m_wb_m2s <= s_wb_m2s;
  s_wb_s2m <= m_wb_s2m;
end generate;

GEN_BYPASS_AXI: if f_str_is_axi(C_MASTER_MODE) generate
  m_axi4_m2s <= s_axi4_m2s;
  s_axi4_s2m <= m_axi4_s2m; 
end generate;
end generate;

GEN_CONVERT: if C_MASTER_MODE /= C_SLAVE_MODE  generate

GEN_AXI4LITE_2_WB: if f_str_is_wb(C_MASTER_MODE) and f_str_is_axi(C_SLAVE_MODE) generate
  signal m_tmp_wb_s2m: t_wishbone_slave_out;
  signal m_tmp_wb_m2s: t_wishbone_master_out;
  constant tmp_local_wb_mode: t_wishbone_interface_mode := f_str_to_wb_type(C_MASTER_MODE);
  -- internal axi 2 wishbone implemented as PIPELINED
  constant tmp_intarnal_wb_mode: t_wishbone_interface_mode := PIPELINED;
begin

WishboneAXI_v0_2_S_AXI4_LITE_inst : WishboneAXI_v0_2_S_AXI4_LITE
      generic map (
        C_S_AXI_DATA_WIDTH => C_S_AXI4_LITE_DATA_WIDTH,
        C_S_AXI_ADDR_WIDTH => C_S_AXI4_LITE_ADDR_WIDTH,
        C_WB_ADR_WIDTH     => C_M_WB_ADR_WIDTH,
        C_WB_DAT_WIDTH     => C_M_WB_DAT_WIDTH,
        C_WB_MODE          => tmp_intarnal_wb_mode
        )
      port map (
        ACLK    => aclk,
        ARESETN => aresetn,
        s_axi_m2s => s_axi4_m2s,
        s_axi_s2m => s_axi4_s2m,
        
        m_wb_m2s => m_tmp_wb_m2s,
        m_wb_s2m => m_tmp_wb_s2m
        
        );

  
  U_WB_SLAVE_ADAPTER: wb_slave_adapter
    generic map (
      g_master_use_struct  => true,
      g_master_mode        => tmp_local_wb_mode,
      g_master_granularity => f_str_to_wb_granularity(C_WB_ADDRESS_GRANULARITY),
      g_slave_use_struct   => true,
      g_slave_mode         => tmp_intarnal_wb_mode,
      g_slave_granularity  => BYTE
    )
    port map (
      clk_sys_i  => aclk,
      rst_n_i    => aresetn,
      slave_i    => m_tmp_wb_m2s,
      slave_o    => m_tmp_wb_s2m,
      master_i   => m_wb_s2m,
      master_o   => m_wb_m2s
    );

end generate;
  

GEN_WB_2_AXI4LITE: if f_str_is_wb(C_SLAVE_MODE) and f_str_is_axi(C_MASTER_MODE) generate
  signal tmp_wb_s2m: t_wishbone_slave_out;
  signal tmp_wb_m2s: t_wishbone_master_out;
  constant tmp_local_wb_mode: t_wishbone_interface_mode := f_str_to_wb_type(C_SLAVE_MODE);
  -- wishbone 2 axi always pipelined
  constant tmp_intarnal_wb_mode: t_wishbone_interface_mode := PIPELINED;
begin

WishboneAXI_v0_2_S_AXI4_LITE_inst : WishboneAXI_v0_2_M_AXI4_LITE
      generic map (
        C_M_AXI_DATA_WIDTH => C_S_AXI4_LITE_DATA_WIDTH,
        C_M_AXI_ADDR_WIDTH => C_S_AXI4_LITE_ADDR_WIDTH,
        C_WB_ADR_WIDTH     => C_M_WB_ADR_WIDTH,
        C_WB_DAT_WIDTH     => C_M_WB_DAT_WIDTH
        )
      port map (
        ACLK    => aclk,
        ARESETN => aresetn,
        m_axi_m2s => m_axi4_m2s,
        m_axi_s2m => m_axi4_s2m,
        
        s_wb_m2s => tmp_wb_m2s,
        s_wb_s2m => tmp_wb_s2m
        
        );

  
  U_WB_SLAVE_ADAPTER: wb_slave_adapter
    generic map (
      g_master_use_struct  => true,
      g_master_mode        => PIPELINED,
      g_master_granularity => BYTE,
      
      g_slave_use_struct   => true,
      g_slave_mode         => tmp_local_wb_mode,
      g_slave_granularity  => f_str_to_wb_granularity(C_WB_ADDRESS_GRANULARITY)
    )
    port map (
      clk_sys_i  => aclk,
      rst_n_i    => aresetn,
      slave_i    => s_wb_m2s,
      slave_o    => s_wb_s2m,
      master_i   => tmp_wb_s2m,
      master_o   => tmp_wb_m2s
    );

end generate;


end generate;

  assert ( f_mode_supported(C_MASTER_MODE, C_SLAVE_MODE) = true )
    report "Unsupported mode " & C_MASTER_MODE & " -> " & C_SLAVE_MODE
    severity failure;


end arch_imp;

