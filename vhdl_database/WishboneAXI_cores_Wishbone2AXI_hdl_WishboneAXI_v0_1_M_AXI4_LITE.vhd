-------------------------------------------------------------------------------
-- Title      :
-- Project    : Wishbone2AXI
-------------------------------------------------------------------------------
-- File       : WishboneAXI_vX_Y_M_AXI4_LITE.vhd
-- Authors    : Piotr Miedzik <qermit@sezamkowa.net>
--            : Adrian Byszuk <adrian.byszuk@gmail.com>
-- Company    :
-- Created    : 2017-01-10
-- License    : This is a PUBLIC DOMAIN code, published under
--              Creative Commons CC0 license
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Wishbone -> AXI4LITE bridge
-------------------------------------------------------------------------------
-- Copyleft (ↄ) 2017 
-------------------------------------------------------------------------------
-- Revisions  : see git commit log
-------------------------------------------------------------------------------
-- External requirements :
-- * wishbone_pkg.vhd
-- * wb_helpers_pkg.vhd
-- * axi_helpers_pkg.vhd
-------------------------------------------------------------------------------
-- Implementation details
-------------------------------------------------------------------------------
-- To ease bridging, converter uses internally Wishbone Pipelined mode with
-- BYTE address granularity as AXI always uses it. wb_slave_adapters need to 
-- be used to interface with any wishbone module.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.genram_pkg.all;
use work.wishbone_pkg.all;
use work.axi_helpers_pkg.all;
use work.wb_helpers_pkg.all;


entity WishboneAXI_v0_2_M_AXI4_LITE is
  generic (
    C_WB_ADR_WIDTH : integer := 32;
    C_WB_DAT_WIDTH : integer := 32;
    -- wb always pipelined

    C_M_AXI_ADDR_WIDTH         : integer          := 32;
    C_M_AXI_DATA_WIDTH         : integer          := 32
    );
  port (    
    aclk : in std_logic;
    aresetn : in std_logic;

    s_wb_m2s : in  t_wishbone_slave_in;
    s_wb_s2m : out t_wishbone_slave_out;
    m_axi_s2m : in t_axi4_s2m;
    m_axi_m2s : out t_axi4_m2s
    
    );
end WishboneAXI_v0_2_M_AXI4_LITE;

architecture implementation of WishboneAXI_v0_2_M_AXI4_LITE is

  signal wb_r: t_wishbone_slave_out;
  signal wb_w: t_wishbone_slave_out;
  signal wb_stall : std_logic;
  
  signal axi_waddr: std_logic_vector(31 downto 0);
  signal axi_wdata: std_logic_vector(31 downto 0);
  signal axi_wstrb: std_logic_vector( 3 downto 0);
  signal axi_raddr: std_logic_vector(31 downto 0);
  
begin

  -- I/O Connections assignments
  -- WB signals
  s_wb_s2m.stall <= wb_stall;
  wb_stall <= '0' when wb_r.stall = '0' and wb_w.stall = '0' else '1'; 
  s_wb_s2m.ack   <= '1' when wb_r.ack   = '1' or wb_w.ack   = '1' else '0';
  s_wb_s2m.err   <= '1' when wb_r.err   = '1' or wb_w.err   = '1' else '0';
  s_wb_s2m.rty   <= '1' when wb_r.rty   = '1' or wb_w.rty   = '1' else '0';
  s_wb_s2m.dat   <= wb_r.dat;
  s_wb_s2m.int   <= '0';
  -- axi4 signals
  m_axi_m2s.awaddr(31 downto 0) <= axi_waddr;
  m_axi_m2s.araddr(31 downto 0) <= axi_raddr;
  m_axi_m2s.wdata(31 downto 0) <= axi_wdata;
  m_axi_m2s.wdata(m_axi_m2s.wdata'left downto 32) <= (others => '0');
  m_axi_m2s.wstrb(3 downto 0) <= axi_wstrb;
  m_axi_m2s.wstrb(m_axi_m2s.wstrb'left downto 4) <= (others => '0');
    
  -- AXI4LITE always one cycle per transfer
  m_axi_m2s.wlast <= '1';
  -- AXI4 compatibility
  m_axi_m2s.awid <= (others => '0');
  m_axi_m2s.arid <= (others => '0');
  
  m_axi_m2s.awsize <= "010"; -- Write/read size always 4 bytes (2^2)
  m_axi_m2s.arsize <= "010";
  m_axi_m2s.awlen <= x"00"; -- Write/read size always 4 bytes (2^2)
  m_axi_m2s.arlen <= x"00";
  m_axi_m2s.awburst <= "01";
  m_axi_m2s.arburst <= "01";
  m_axi_m2s.awlock <= '0';
  m_axi_m2s.arlock <= '0';
  m_axi_m2s.awprot <= "000";
  m_axi_m2s.arprot <= "000";
  m_axi_m2s.awqos <= "0000";
  m_axi_m2s.arqos <= "0000";    
  m_axi_m2s.arregion <= "0000";
  m_axi_m2s.awregion <= "0000";    
  m_axi_m2s.arcache <= "0000";
  m_axi_m2s.awcache <= "0000";    
    -- /AXI4 compatibility

  axi_aw_channel: process(aclk) is
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        m_axi_m2s.awvalid <= '0';
        axi_waddr <= (others => '0');
      else
        if s_wb_m2s.cyc = '1' and s_wb_m2s.stb = '1' and  s_wb_m2s.we = '1' and wb_stall = '0' then
          axi_waddr(31 downto 0) <= s_wb_m2s.adr(31 downto 0);
          m_axi_m2s.awvalid <= '1';
        elsif m_axi_s2m.awready = '1' then
          m_axi_m2s.awvalid <= '0';
        end if; 
      end if;
    end if;
  end process;


  axi_w_channel : process(aclk) is
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        m_axi_m2s.wvalid <= '0';
        axi_wdata <= (others => '0');
        axi_wstrb <= (others => '0');
      else
        if s_wb_m2s.cyc = '1' and s_wb_m2s.stb = '1' and  s_wb_m2s.we = '1' and wb_stall = '0' then
          axi_wdata(31 downto 0) <= s_wb_m2s.dat(31 downto 0);
          axi_wstrb(3 downto 0) <= s_wb_m2s.sel(3 downto 0);
          m_axi_m2s.wvalid <= '1';
        elsif m_axi_s2m.wready = '1' then
          m_axi_m2s.wvalid <= '0';
        end if; 
      end if;
    end if;
  end process;

  -- b channel reply is always after w and aw channels. 
  axi_w_stall  : process(aclk) is
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        wb_w.stall <= '0';
      else
        if s_wb_m2s.cyc = '1' and s_wb_m2s.stb = '1' and  s_wb_m2s.we = '1' and wb_stall = '0' then
          wb_w.stall <= '1';
        elsif m_axi_s2m.bvalid = '1' then
          wb_w.stall <= '0';
        end if; 
      end if;
    end if;
  end process;

  axi_ar_channel: process(aclk) is
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        m_axi_m2s.arvalid <= '0';
        axi_raddr <= (others => '0');
      else
        if s_wb_m2s.cyc = '1' and s_wb_m2s.stb = '1' and  s_wb_m2s.we = '0' and wb_stall = '0' then
          axi_raddr(31 downto 0) <= s_wb_m2s.adr(31 downto 0);
          m_axi_m2s.arvalid <= '1';
        elsif m_axi_s2m.arready = '1' then
          m_axi_m2s.arvalid <= '0';
        end if; 
      end if;
    end if;
  end process;

  axi_r_stall  : process(aclk) is
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        wb_r.stall <= '0';
      else
        if s_wb_m2s.cyc = '1' and s_wb_m2s.stb = '1' and  s_wb_m2s.we = '0' and wb_stall = '0' then
          wb_r.stall <= '1';
        elsif m_axi_s2m.rvalid = '1' then
          wb_r.stall <= '0';
        end if; 
      end if;
    end if;
  end process;

  
  -- wishbone read channel always ready
  -- todo: add reset condition 
  wb_r.dat <= m_axi_s2m.rdata(31 downto 0);
  m_axi_m2s.rready <= '1'; 
  -- rty always '0'
  wb_r.rty <= '0';
  
  process(m_axi_s2m.rvalid, m_axi_s2m.rresp) is
  begin
    -- xRESP
    --  0b00 OKAY (see OKAY, normal access success in AXI specification for more information)
    --  0b01 EXOKAY
    --  0b10 SLVERR
    --  0b11 DECERR
    if m_axi_s2m.rvalid = '1' and m_axi_s2m.rresp(1) = '0' then
      wb_r.ack <= '1';
    else     
      wb_r.ack <= '0';
    end if;
    
    if m_axi_s2m.rvalid = '1' and m_axi_s2m.rresp(1) = '1' then
      wb_r.err <= '1';
    else     
      wb_r.err <= '0';
    end if;
  end process;
  
  -- wishbone write return channel always ready
  m_axi_m2s.bready <= '1';
  
  -- rty always '0'
  wb_w.rty <= '0';
  process(m_axi_s2m.bvalid, m_axi_s2m.bresp) is
  begin
    -- xRESP
    --  0b00 OKAY (see OKAY, normal access success in AXI specification for more information)
    --  0b01 EXOKAY
    --  0b10 SLVERR
    --  0b11 DECERR
    if m_axi_s2m.bvalid = '1' and m_axi_s2m.bresp(1) = '0' then
      wb_w.ack <= '1';
    else     
      wb_w.ack <= '0';
    end if;
    
    if m_axi_s2m.bvalid = '1' and m_axi_s2m.bresp(1) = '1' then
      wb_w.err <= '1';
    else     
      wb_w.err <= '0';
    end if;
  end process;
  
  axi_bw_channel  : process(aclk) is
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
      else
      end if;
    end if;
  end process;

end implementation;
