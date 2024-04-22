-- libraries --------------------------------------------------------------------------------- {{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
library xil_defaultlib;
use xil_defaultlib.all;
------------------------------------------------------------------------------------------------- }}}

entity FGPU_v3_0 is
  -- generics {{{
  generic (
    -- Users to add parameters here

    -- User parameters ends
    -- Do not modify the parameters beyond this line


    -- Parameters of Axi Slave Bus Interface S0
    C_S0_DATA_WIDTH    : integer  := 32;
    C_S0_ADDR_WIDTH    : integer  := 16;

    -- Parameters of Axi Master Bus Interface M0
    C_M0_TARGET_SLAVE_BASE_ADDR  : std_logic_vector  := x"00000000";
    C_M0_BURST_LEN    : integer  := 8;
    C_M0_ID_WIDTH    : integer  := 6;
    C_M0_ADDR_WIDTH    : integer  := 32;
    C_M0_DATA_WIDTH    : integer  := 64;
    C_M0_AWUSER_WIDTH  : integer  := 0;
    C_M0_ARUSER_WIDTH  : integer  := 0;
    C_M0_WUSER_WIDTH  : integer  := 0;
    C_M0_RUSER_WIDTH  : integer  := 0;
    C_M0_BUSER_WIDTH  : integer  := 0;

    -- Parameters of Axi Master Bus Interface M1
    C_M1_TARGET_SLAVE_BASE_ADDR  : std_logic_vector  := x"00000000";
    C_M1_BURST_LEN    : integer  := 8;
    C_M1_ID_WIDTH    : integer  := 6;
    C_M1_ADDR_WIDTH    : integer  := 32;
    C_M1_DATA_WIDTH    : integer  := 64;
    C_M1_AWUSER_WIDTH  : integer  := 0;
    C_M1_ARUSER_WIDTH  : integer  := 0;
    C_M1_WUSER_WIDTH  : integer  := 0;
    C_M1_RUSER_WIDTH  : integer  := 0;
    C_M1_BUSER_WIDTH  : integer  := 0;

    -- Parameters of Axi Master Bus Interface M2
    C_M2_TARGET_SLAVE_BASE_ADDR  : std_logic_vector  := x"00000000";
    C_M2_BURST_LEN    : integer  := 8;
    C_M2_ID_WIDTH    : integer  := 6;
    C_M2_ADDR_WIDTH    : integer  := 32;
    C_M2_DATA_WIDTH    : integer  := 64;
    C_M2_AWUSER_WIDTH  : integer  := 0;
    C_M2_ARUSER_WIDTH  : integer  := 0;
    C_M2_WUSER_WIDTH  : integer  := 0;
    C_M2_RUSER_WIDTH  : integer  := 0;
    C_M2_BUSER_WIDTH  : integer  := 0;

    -- Parameters of Axi Master Bus Interface M3
    C_M3_TARGET_SLAVE_BASE_ADDR  : std_logic_vector  := x"00000000";
    C_M3_BURST_LEN    : integer  := 8;
    C_M3_ID_WIDTH    : integer  := 6;
    C_M3_ADDR_WIDTH    : integer  := 32;
    C_M3_DATA_WIDTH    : integer  := 64;
    C_M3_AWUSER_WIDTH  : integer  := 0;
    C_M3_ARUSER_WIDTH  : integer  := 0;
    C_M3_WUSER_WIDTH  : integer  := 0;
    C_M3_RUSER_WIDTH  : integer  := 0;
    C_M3_BUSER_WIDTH  : integer  := 0
  ); --}}}
  -- ports {{{
  port (
    -- Users to add ports here
    -- User ports ends
    -- Do not modify the ports beyond this line
    -- Ports of Axi Slave Bus Interface S0 {{{
    s0_aclk    : in std_logic;
    s0_aresetn  : in std_logic;
    s0_awaddr  : in std_logic_vector(C_S0_ADDR_WIDTH-1 downto 0);
    s0_awprot  : in std_logic_vector(2 downto 0);
    s0_awvalid  : in std_logic;
    s0_awready  : out std_logic;
    s0_wdata    : in std_logic_vector(C_S0_DATA_WIDTH-1 downto 0);
    s0_wstrb    : in std_logic_vector((C_S0_DATA_WIDTH/8)-1 downto 0);
    s0_wvalid  : in std_logic;
    s0_wready  : out std_logic;
    s0_bresp    : out std_logic_vector(1 downto 0);
    s0_bvalid  : out std_logic;
    s0_bready  : in std_logic;
    s0_araddr  : in std_logic_vector(C_S0_ADDR_WIDTH-1 downto 0);
    s0_arprot  : in std_logic_vector(2 downto 0);
    s0_arvalid  : in std_logic;
    s0_arready  : out std_logic;
    s0_rdata    : out std_logic_vector(C_S0_DATA_WIDTH-1 downto 0);
    s0_rresp    : out std_logic_vector(1 downto 0);
    s0_rvalid  : out std_logic;
    s0_rready  : in std_logic;
    -- }}}
    -- Ports of Axi Master Bus Interface M0 {{{
    m0_aclk    : in std_logic;
    m0_aresetn  : in std_logic;
    m0_awid    : out std_logic_vector(C_M0_ID_WIDTH-1 downto 0);
    m0_awaddr  : out std_logic_vector(C_M0_ADDR_WIDTH-1 downto 0);
    m0_awlen  : out std_logic_vector(7 downto 0);
    m0_awsize  : out std_logic_vector(2 downto 0);
    m0_awburst  : out std_logic_vector(1 downto 0);
    m0_awlock  : out std_logic;
    m0_awcache  : out std_logic_vector(3 downto 0);
    m0_awprot  : out std_logic_vector(2 downto 0);
    m0_awqos  : out std_logic_vector(3 downto 0);
    m0_awuser  : out std_logic_vector(C_M0_AWUSER_WIDTH-1 downto 0);
    m0_awvalid  : out std_logic;
    m0_awready  : in std_logic;
    m0_wdata  : out std_logic_vector(C_M0_DATA_WIDTH-1 downto 0);
    m0_wstrb  : out std_logic_vector(C_M0_DATA_WIDTH/8-1 downto 0);
    m0_wlast  : out std_logic;
    m0_wuser  : out std_logic_vector(C_M0_WUSER_WIDTH-1 downto 0);
    m0_wvalid  : out std_logic;
    m0_wready  : in std_logic;
    m0_bid    : in std_logic_vector(C_M0_ID_WIDTH-1 downto 0);
    m0_bresp  : in std_logic_vector(1 downto 0);
    m0_buser  : in std_logic_vector(C_M0_BUSER_WIDTH-1 downto 0);
    m0_bvalid  : in std_logic;
    m0_bready  : out std_logic;
    m0_arid    : out std_logic_vector(C_M0_ID_WIDTH-1 downto 0);
    m0_araddr  : out std_logic_vector(C_M0_ADDR_WIDTH-1 downto 0);
    m0_arlen  : out std_logic_vector(7 downto 0);
    m0_arsize  : out std_logic_vector(2 downto 0);
    m0_arburst  : out std_logic_vector(1 downto 0);
    m0_arlock  : out std_logic;
    m0_arcache  : out std_logic_vector(3 downto 0);
    m0_arprot  : out std_logic_vector(2 downto 0);
    m0_arqos  : out std_logic_vector(3 downto 0);
    m0_aruser  : out std_logic_vector(C_M0_ARUSER_WIDTH-1 downto 0);
    m0_arvalid  : out std_logic;
    m0_arready  : in std_logic;
    m0_rid    : in std_logic_vector(C_M0_ID_WIDTH-1 downto 0);
    m0_rdata  : in std_logic_vector(C_M0_DATA_WIDTH-1 downto 0);
    m0_rresp  : in std_logic_vector(1 downto 0);
    m0_rlast  : in std_logic;
    m0_ruser  : in std_logic_vector(C_M0_RUSER_WIDTH-1 downto 0);
    m0_rvalid  : in std_logic;
    m0_rready  : out std_logic;
    --}}}
    -- Ports of Axi Master Bus Interface M1 {{{
    m1_aclk    : in std_logic;
    m1_aresetn  : in std_logic;
    m1_awid    : out std_logic_vector(C_M1_ID_WIDTH-1 downto 0);
    m1_awaddr  : out std_logic_vector(C_M1_ADDR_WIDTH-1 downto 0);
    m1_awlen  : out std_logic_vector(7 downto 0);
    m1_awsize  : out std_logic_vector(2 downto 0);
    m1_awburst  : out std_logic_vector(1 downto 0);
    m1_awlock  : out std_logic;
    m1_awcache  : out std_logic_vector(3 downto 0);
    m1_awprot  : out std_logic_vector(2 downto 0);
    m1_awqos  : out std_logic_vector(3 downto 0);
    m1_awuser  : out std_logic_vector(C_M1_AWUSER_WIDTH-1 downto 0);
    m1_awvalid  : out std_logic;
    m1_awready  : in std_logic;
    m1_wdata  : out std_logic_vector(C_M1_DATA_WIDTH-1 downto 0);
    m1_wstrb  : out std_logic_vector(C_M1_DATA_WIDTH/8-1 downto 0);
    m1_wlast  : out std_logic;
    m1_wuser  : out std_logic_vector(C_M1_WUSER_WIDTH-1 downto 0);
    m1_wvalid  : out std_logic;
    m1_wready  : in std_logic;
    m1_bid    : in std_logic_vector(C_M1_ID_WIDTH-1 downto 0);
    m1_bresp  : in std_logic_vector(1 downto 0);
    m1_buser  : in std_logic_vector(C_M1_BUSER_WIDTH-1 downto 0);
    m1_bvalid  : in std_logic;
    m1_bready  : out std_logic;
    m1_arid    : out std_logic_vector(C_M1_ID_WIDTH-1 downto 0);
    m1_araddr  : out std_logic_vector(C_M1_ADDR_WIDTH-1 downto 0);
    m1_arlen  : out std_logic_vector(7 downto 0);
    m1_arsize  : out std_logic_vector(2 downto 0);
    m1_arburst  : out std_logic_vector(1 downto 0);
    m1_arlock  : out std_logic;
    m1_arcache  : out std_logic_vector(3 downto 0);
    m1_arprot  : out std_logic_vector(2 downto 0);
    m1_arqos  : out std_logic_vector(3 downto 0);
    m1_aruser  : out std_logic_vector(C_M1_ARUSER_WIDTH-1 downto 0);
    m1_arvalid  : out std_logic;
    m1_arready  : in std_logic;
    m1_rid    : in std_logic_vector(C_M1_ID_WIDTH-1 downto 0);
    m1_rdata  : in std_logic_vector(C_M1_DATA_WIDTH-1 downto 0);
    m1_rresp  : in std_logic_vector(1 downto 0);
    m1_rlast  : in std_logic;
    m1_ruser  : in std_logic_vector(C_M1_RUSER_WIDTH-1 downto 0);
    m1_rvalid  : in std_logic;
    m1_rready  : out std_logic;
    -- }}}
    -- Ports of Axi Master Bus Interface M2 {{{
    m2_aclk    : in std_logic;
    m2_aresetn  : in std_logic;
    m2_awid    : out std_logic_vector(C_M2_ID_WIDTH-1 downto 0);
    m2_awaddr  : out std_logic_vector(C_M2_ADDR_WIDTH-1 downto 0);
    m2_awlen  : out std_logic_vector(7 downto 0);
    m2_awsize  : out std_logic_vector(2 downto 0);
    m2_awburst  : out std_logic_vector(1 downto 0);
    m2_awlock  : out std_logic;
    m2_awcache  : out std_logic_vector(3 downto 0);
    m2_awprot  : out std_logic_vector(2 downto 0);
    m2_awqos  : out std_logic_vector(3 downto 0);
    m2_awuser  : out std_logic_vector(C_M2_AWUSER_WIDTH-1 downto 0);
    m2_awvalid  : out std_logic;
    m2_awready  : in std_logic;
    m2_wdata  : out std_logic_vector(C_M2_DATA_WIDTH-1 downto 0);
    m2_wstrb  : out std_logic_vector(C_M2_DATA_WIDTH/8-1 downto 0);
    m2_wlast  : out std_logic;
    m2_wuser  : out std_logic_vector(C_M2_WUSER_WIDTH-1 downto 0);
    m2_wvalid  : out std_logic;
    m2_wready  : in std_logic;
    m2_bid    : in std_logic_vector(C_M2_ID_WIDTH-1 downto 0);
    m2_bresp  : in std_logic_vector(1 downto 0);
    m2_buser  : in std_logic_vector(C_M2_BUSER_WIDTH-1 downto 0);
    m2_bvalid  : in std_logic;
    m2_bready  : out std_logic;
    m2_arid    : out std_logic_vector(C_M2_ID_WIDTH-1 downto 0);
    m2_araddr  : out std_logic_vector(C_M2_ADDR_WIDTH-1 downto 0);
    m2_arlen  : out std_logic_vector(7 downto 0);
    m2_arsize  : out std_logic_vector(2 downto 0);
    m2_arburst  : out std_logic_vector(1 downto 0);
    m2_arlock  : out std_logic;
    m2_arcache  : out std_logic_vector(3 downto 0);
    m2_arprot  : out std_logic_vector(2 downto 0);
    m2_arqos  : out std_logic_vector(3 downto 0);
    m2_aruser  : out std_logic_vector(C_M2_ARUSER_WIDTH-1 downto 0);
    m2_arvalid  : out std_logic;
    m2_arready  : in std_logic;
    m2_rid  : in std_logic_vector(C_M2_ID_WIDTH-1 downto 0);
    m2_rdata  : in std_logic_vector(C_M2_DATA_WIDTH-1 downto 0);
    m2_rresp  : in std_logic_vector(1 downto 0);
    m2_rlast  : in std_logic;
    m2_ruser  : in std_logic_vector(C_M2_RUSER_WIDTH-1 downto 0);
    m2_rvalid  : in std_logic;
    m2_rready  : out std_logic;
    -- }}}
    -- Ports of Axi Master Bus Interface M3 {{{
    m3_aclk  : in std_logic;
    m3_aresetn  : in std_logic;
    m3_awid  : out std_logic_vector(C_M3_ID_WIDTH-1 downto 0);
    m3_awaddr  : out std_logic_vector(C_M3_ADDR_WIDTH-1 downto 0);
    m3_awlen  : out std_logic_vector(7 downto 0);
    m3_awsize  : out std_logic_vector(2 downto 0);
    m3_awburst  : out std_logic_vector(1 downto 0);
    m3_awlock  : out std_logic;
    m3_awcache  : out std_logic_vector(3 downto 0);
    m3_awprot  : out std_logic_vector(2 downto 0);
    m3_awqos  : out std_logic_vector(3 downto 0);
    m3_awuser  : out std_logic_vector(C_M3_AWUSER_WIDTH-1 downto 0);
    m3_awvalid  : out std_logic;
    m3_awready  : in std_logic;
    m3_wdata  : out std_logic_vector(C_M3_DATA_WIDTH-1 downto 0);
    m3_wstrb  : out std_logic_vector(C_M3_DATA_WIDTH/8-1 downto 0);
    m3_wlast  : out std_logic;
    m3_wuser  : out std_logic_vector(C_M3_WUSER_WIDTH-1 downto 0);
    m3_wvalid  : out std_logic;
    m3_wready  : in std_logic;
    m3_bid  : in std_logic_vector(C_M3_ID_WIDTH-1 downto 0);
    m3_bresp  : in std_logic_vector(1 downto 0);
    m3_buser  : in std_logic_vector(C_M3_BUSER_WIDTH-1 downto 0);
    m3_bvalid  : in std_logic;
    m3_bready  : out std_logic;
    m3_arid  : out std_logic_vector(C_M3_ID_WIDTH-1 downto 0);
    m3_araddr  : out std_logic_vector(C_M3_ADDR_WIDTH-1 downto 0);
    m3_arlen  : out std_logic_vector(7 downto 0);
    m3_arsize  : out std_logic_vector(2 downto 0);
    m3_arburst  : out std_logic_vector(1 downto 0);
    m3_arlock  : out std_logic;
    m3_arcache  : out std_logic_vector(3 downto 0);
    m3_arprot  : out std_logic_vector(2 downto 0);
    m3_arqos  : out std_logic_vector(3 downto 0);
    m3_aruser  : out std_logic_vector(C_M3_ARUSER_WIDTH-1 downto 0);
    m3_arvalid  : out std_logic;
    m3_arready  : in std_logic;
    m3_rid  : in std_logic_vector(C_M3_ID_WIDTH-1 downto 0);
    m3_rdata  : in std_logic_vector(C_M3_DATA_WIDTH-1 downto 0);
    m3_rresp  : in std_logic_vector(1 downto 0);
    m3_rlast  : in std_logic;
    m3_ruser  : in std_logic_vector(C_M3_RUSER_WIDTH-1 downto 0);
    m3_rvalid  : in std_logic;
    m3_rready  : out std_logic
    -- }}}
  ); --}}}
end entity;

architecture arch_imp of FGPU_v3_0 is
  signal nrst        : std_logic := '0';
begin
  -- fixed signals ------------------------------------------------------------------------------------{{{
  -- m0 {{{
  m0_awlock <= '0';
  --Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
  m0_awcache  <= "0010";
  m0_awprot <= "000";
  m0_awqos <= X"0";
  m0_arlock <= '0';
  m0_arcache <= "0010";
  m0_arprot <= "000";
  m0_arqos <= X"0";
  -- }}}
  -- m1 {{{
  m1_awlock <= '0';
  --Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
  m1_awcache  <= "0010";
  m1_awprot <= "000";
  m1_awqos <= X"0";
  m1_arlock <= '0';
  m1_arcache <= "0010";
  m1_arprot <= "000";
  m1_arqos <= X"0";
  --}}}
  -- m2 {{{
  m2_awlock <= '0';
  --Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
  m2_awcache  <= "0010";
  m2_awprot <= "000";
  m2_awqos <= X"0";
  m2_arlock <= '0';
  m2_arcache <= "0010";
  m2_arprot <= "000";
  m2_arqos <= X"0";
  -- }}}
  -- m3 {{{
  m3_awlock <= '0';
  --Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
  m3_awcache  <= "0010";
  m3_awprot <= "000";
  m3_awqos <= X"0";
  m3_arlock <= '0';
  m3_arcache <= "0010";
  m3_arprot <= "000";
  m3_arqos <= X"0";
  -- }}}
  ---------------------------------------------------------------------------------------------------------}}}
  process(s0_aclk)
  begin
    if rising_edge(s0_aclk) then
      nrst <= s0_aresetn and m0_aresetn and m1_aresetn and m2_aresetn and m3_aresetn;
    end if;
  end process;
  
  uut: entity FGPU 
  PORT MAP (
    clk => s0_aclk,
    -- slave axi {{{
    s0_awaddr => s0_awaddr(C_S0_ADDR_WIDTH-1 downto 2),
    s0_awprot => s0_awprot,
    s0_awvalid => s0_awvalid,
    s0_awready => s0_awready,
  
    s0_wdata => s0_wdata,
    s0_wstrb => s0_wstrb,
    s0_wvalid => s0_wvalid,
    s0_wready => s0_wready,
  
    s0_bresp => s0_bresp,
    s0_bvalid => s0_bvalid,
    s0_bready => s0_bready,
  
    s0_araddr => s0_araddr(C_S0_ADDR_WIDTH-1 downto 2),
    s0_arprot => s0_arprot,
    s0_arvalid => s0_arvalid,
    s0_arready => s0_arready,
  
    s0_rdata => s0_rdata,
    s0_rresp => s0_rresp,
    s0_rvalid => s0_rvalid,
    s0_rready => s0_rready,
    -- }}}
    -- axi master 0 connections {{{
    -- ar channel
    m0_araddr => m0_araddr,
    m0_arlen => m0_arlen,
    m0_arsize => m0_arsize,
    m0_arburst => m0_arburst,
    m0_arvalid => m0_arvalid,
    m0_arready => m0_arready,
    m0_arid => m0_arid,
    -- r channel
    m0_rdata => m0_rdata,
    m0_rresp => m0_rresp,
    m0_rlast => m0_rlast,
    m0_rvalid => m0_rvalid,
    m0_rready => m0_rready,
    m0_rid => m0_rid,
    -- aw channel
    m0_awvalid => m0_awvalid,
    m0_awaddr => m0_awaddr,
    m0_awready => m0_awready,
    m0_awlen => m0_awlen,
    m0_awsize => m0_awsize,
    m0_awburst => m0_awburst,
    m0_awid => m0_awid,
    -- w channel
    m0_wdata => m0_wdata,
    m0_wstrb => m0_wstrb,
    m0_wlast => m0_wlast,
    m0_wvalid => m0_wvalid,
    m0_wready => m0_wready,
    -- b channel
    m0_bvalid => m0_bvalid,
    m0_bready => m0_bready,
    m0_bid => m0_bid,
    -- }}}
    -- axi master 1 connections {{{
    -- ar channel
    m1_araddr => m2_araddr,
    m1_arlen => m2_arlen,
    m1_arsize => m2_arsize,
    m1_arburst => m2_arburst,
    m1_arvalid => m2_arvalid,
    m1_arready => m2_arready,
    m1_arid => m2_arid,
    -- r channel
    m1_rdata => m2_rdata,
    m1_rresp => m2_rresp,
    m1_rlast => m2_rlast,
    m1_rvalid => m2_rvalid,
    m1_rready => m2_rready,
    m1_rid => m2_rid,
    -- aw channel
    m1_awvalid => m2_awvalid,
    m1_awaddr => m2_awaddr,
    m1_awready => m2_awready,
    m1_awlen => m2_awlen,
    m1_awsize => m2_awsize,
    m1_awburst => m2_awburst,
    m1_awid => m2_awid,
    -- w channel
    m1_wdata => m2_wdata,
    m1_wstrb => m2_wstrb,
    m1_wlast => m2_wlast,
    m1_wvalid => m2_wvalid,
    m1_wready => m2_wready,
    -- b channel
    m1_bvalid => m2_bvalid,
    m1_bready => m2_bready,
    m1_bid => m2_bid,
    -- }}}
    -- axi master 2 connections {{{
    -- ar channel
    m2_araddr => m1_araddr,
    m2_arlen => m1_arlen,
    m2_arsize => m1_arsize,
    m2_arburst => m1_arburst,
    m2_arvalid => m1_arvalid,
    m2_arready => m1_arready,
    m2_arid => m1_arid,
    -- r channel
    m2_rdata => m1_rdata,
    m2_rresp => m1_rresp,
    m2_rlast => m1_rlast,
    m2_rvalid => m1_rvalid,
    m2_rready => m1_rready,
    m2_rid => m1_rid,
    -- aw channel
    m2_awvalid => m1_awvalid,
    m2_awaddr => m1_awaddr,
    m2_awready => m1_awready,
    m2_awlen => m1_awlen,
    m2_awsize => m1_awsize,
    m2_awburst => m1_awburst,
    m2_awid => m1_awid,
    -- w channel
    m2_wdata => m1_wdata,
    m2_wstrb => m1_wstrb,
    m2_wlast => m1_wlast,
    m2_wvalid => m1_wvalid,
    m2_wready => m1_wready,
    -- b channel
    m2_bvalid => m1_bvalid,
    m2_bready => m1_bready,
    m2_bid => m1_bid,
    -- }}}
    -- axi master 3 connections {{{
    -- ar channel
    m3_araddr => m3_araddr,
    m3_arlen => m3_arlen,
    m3_arsize => m3_arsize,
    m3_arburst => m3_arburst,
    m3_arvalid => m3_arvalid,
    m3_arready => m3_arready,
    m3_arid => m3_arid,
    -- r channel
    m3_rdata => m3_rdata,
    m3_rresp => m3_rresp,
    m3_rlast => m3_rlast,
    m3_rvalid => m3_rvalid,
    m3_rready => m3_rready,
    m3_rid => m3_rid,
    -- aw channel
    m3_awvalid => m3_awvalid,
    m3_awaddr => m3_awaddr,
    m3_awready => m3_awready,
    m3_awlen => m3_awlen,
    m3_awsize => m3_awsize,
    m3_awburst => m3_awburst,
    m3_awid => m3_awid,
    -- w channel
    m3_wdata => m3_wdata,
    m3_wstrb => m3_wstrb,
    m3_wlast => m3_wlast,
    m3_wvalid => m3_wvalid,
    m3_wready => m3_wready,
    -- b channel
    m3_bvalid => m3_bvalid,
    m3_bready => m3_bready,
    m3_bid => m3_bid,
    -- }}}
    nrst => nrst
  );
end arch_imp;
