-- libraries --------------------------------------------------------------------------------- {{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
------------------------------------------------------------------------------------------------- }}}

entity fgpu_wrapper is
  -- ports {{{
  port (
    -- Users to add ports here
    -- User ports ends

    -- Do not modify the ports beyond this line

	-- Please note: the bitwidth of the AXI ID port (e.g: m0_bid, m0_rid, ..) is hardwired to simplify the IP creation process.
	--			    This value must be sized considering the maximum value of N_CU (8 in this case).


    axi_clk     : in std_logic;
    axi_aresetn : in std_logic;

    -- Ports of Axi Slave Bus Interface S0 {{{
    s_awaddr  : in std_logic_vector(15 downto 0);
    s_awprot  : in std_logic_vector(2 downto 0);
    s_awvalid  : in std_logic;
    s_awready  : out std_logic;
    s_wdata    : in std_logic_vector(31 downto 0);
    s_wstrb    : in std_logic_vector(3 downto 0);
    s_wvalid  : in std_logic;
    s_wready  : out std_logic;
    s_bresp    : out std_logic_vector(1 downto 0);
    s_bvalid  : out std_logic;
    s_bready  : in std_logic;
    s_araddr  : in std_logic_vector(15 downto 0);
    s_arprot  : in std_logic_vector(2 downto 0);
    s_arvalid  : in std_logic;
    s_arready  : out std_logic;
    s_rdata    : out std_logic_vector(31 downto 0);
    s_rresp    : out std_logic_vector(1 downto 0);
    s_rvalid  : out std_logic;
    s_rready  : in std_logic;
    -- }}}

    -- Ports of Axi Master Bus Interface M0 {{{
    m0_awid    : out std_logic_vector(3 downto 0);
    m0_awaddr  : out std_logic_vector(31 downto 0);
    m0_awlen  : out std_logic_vector(7 downto 0);
    m0_awsize  : out std_logic_vector(2 downto 0);
    m0_awburst  : out std_logic_vector(1 downto 0);
    m0_awlock  : out std_logic;
    m0_awcache  : out std_logic_vector(3 downto 0);
    m0_awprot  : out std_logic_vector(2 downto 0);
    m0_awqos  : out std_logic_vector(3 downto 0);
    m0_awvalid  : out std_logic;
    m0_awready  : in std_logic;
    m0_wdata  : out std_logic_vector(63 downto 0);
    m0_wstrb  : out std_logic_vector(7 downto 0);
    m0_wlast  : out std_logic;
    m0_wvalid  : out std_logic;
    m0_wready  : in std_logic;
    m0_bid    : in std_logic_vector(3 downto 0);
    m0_bresp  : in std_logic_vector(1 downto 0);
    m0_bvalid  : in std_logic;
    m0_bready  : out std_logic;
    m0_arid    : out std_logic_vector(3 downto 0);
    m0_araddr  : out std_logic_vector(31 downto 0);
    m0_arlen  : out std_logic_vector(7 downto 0);
    m0_arsize  : out std_logic_vector(2 downto 0);
    m0_arburst  : out std_logic_vector(1 downto 0);
    m0_arlock  : out std_logic;
    m0_arcache  : out std_logic_vector(3 downto 0);
    m0_arprot  : out std_logic_vector(2 downto 0);
    m0_arqos  : out std_logic_vector(3 downto 0);
    m0_arvalid  : out std_logic;
    m0_arready  : in std_logic;
    m0_rid    : in std_logic_vector(3 downto 0);
    m0_rdata  : in std_logic_vector(63 downto 0);
    m0_rresp  : in std_logic_vector(1 downto 0);
    m0_rlast  : in std_logic;
    m0_rvalid  : in std_logic;
    m0_rready  : out std_logic;
    -- }}}

    -- Ports of Axi Master Bus Interface M1 {{{
    m1_awid    : out std_logic_vector(3 downto 0);
    m1_awaddr  : out std_logic_vector(31 downto 0);
    m1_awlen  : out std_logic_vector(7 downto 0);
    m1_awsize  : out std_logic_vector(2 downto 0);
    m1_awburst  : out std_logic_vector(1 downto 0);
    m1_awlock  : out std_logic;
    m1_awcache  : out std_logic_vector(3 downto 0);
    m1_awprot  : out std_logic_vector(2 downto 0);
    m1_awqos  : out std_logic_vector(3 downto 0);
    m1_awvalid  : out std_logic;
    m1_awready  : in std_logic;
    m1_wdata  : out std_logic_vector(63 downto 0);
    m1_wstrb  : out std_logic_vector(7 downto 0);
    m1_wlast  : out std_logic;
    m1_wvalid  : out std_logic;
    m1_wready  : in std_logic;
    m1_bid    : in std_logic_vector(3 downto 0);
    m1_bresp  : in std_logic_vector(1 downto 0);
    m1_bvalid  : in std_logic;
    m1_bready  : out std_logic;
    m1_arid    : out std_logic_vector(3 downto 0);
    m1_araddr  : out std_logic_vector(31 downto 0);
    m1_arlen  : out std_logic_vector(7 downto 0);
    m1_arsize  : out std_logic_vector(2 downto 0);
    m1_arburst  : out std_logic_vector(1 downto 0);
    m1_arlock  : out std_logic;
    m1_arcache  : out std_logic_vector(3 downto 0);
    m1_arprot  : out std_logic_vector(2 downto 0);
    m1_arqos  : out std_logic_vector(3 downto 0);
    m1_arvalid  : out std_logic;
    m1_arready  : in std_logic;
    m1_rid    : in std_logic_vector(3 downto 0);
    m1_rdata  : in std_logic_vector(63 downto 0);
    m1_rresp  : in std_logic_vector(1 downto 0);
    m1_rlast  : in std_logic;
    m1_rvalid  : in std_logic;
    m1_rready  : out std_logic;
    -- }}}

    -- Ports of Axi Master Bus Interface M2 {{{
    m2_awid    : out std_logic_vector(3 downto 0);
    m2_awaddr  : out std_logic_vector(31 downto 0);
    m2_awlen  : out std_logic_vector(7 downto 0);
    m2_awsize  : out std_logic_vector(2 downto 0);
    m2_awburst  : out std_logic_vector(1 downto 0);
    m2_awlock  : out std_logic;
    m2_awcache  : out std_logic_vector(3 downto 0);
    m2_awprot  : out std_logic_vector(2 downto 0);
    m2_awqos  : out std_logic_vector(3 downto 0);
    m2_awvalid  : out std_logic;
    m2_awready  : in std_logic;
    m2_wdata  : out std_logic_vector(63 downto 0);
    m2_wstrb  : out std_logic_vector(7 downto 0);
    m2_wlast  : out std_logic;
    m2_wvalid  : out std_logic;
    m2_wready  : in std_logic;
    m2_bid    : in std_logic_vector(3 downto 0);
    m2_bresp  : in std_logic_vector(1 downto 0);
    m2_bvalid  : in std_logic;
    m2_bready  : out std_logic;
    m2_arid    : out std_logic_vector(3 downto 0);
    m2_araddr  : out std_logic_vector(31 downto 0);
    m2_arlen  : out std_logic_vector(7 downto 0);
    m2_arsize  : out std_logic_vector(2 downto 0);
    m2_arburst  : out std_logic_vector(1 downto 0);
    m2_arlock  : out std_logic;
    m2_arcache  : out std_logic_vector(3 downto 0);
    m2_arprot  : out std_logic_vector(2 downto 0);
    m2_arqos  : out std_logic_vector(3 downto 0);
    m2_arvalid  : out std_logic;
    m2_arready  : in std_logic;
    m2_rid    : in std_logic_vector(3 downto 0);
    m2_rdata  : in std_logic_vector(63 downto 0);
    m2_rresp  : in std_logic_vector(1 downto 0);
    m2_rlast  : in std_logic;
    m2_rvalid  : in std_logic;
    m2_rready  : out std_logic;
    -- }}}

    -- Ports of Axi Master Bus Interface M3 {{{
    m3_awid    : out std_logic_vector(3 downto 0);
    m3_awaddr  : out std_logic_vector(31 downto 0);
    m3_awlen  : out std_logic_vector(7 downto 0);
    m3_awsize  : out std_logic_vector(2 downto 0);
    m3_awburst  : out std_logic_vector(1 downto 0);
    m3_awlock  : out std_logic;
    m3_awcache  : out std_logic_vector(3 downto 0);
    m3_awprot  : out std_logic_vector(2 downto 0);
    m3_awqos  : out std_logic_vector(3 downto 0);
    m3_awvalid  : out std_logic;
    m3_awready  : in std_logic;
    m3_wdata  : out std_logic_vector(63 downto 0);
    m3_wstrb  : out std_logic_vector(7 downto 0);
    m3_wlast  : out std_logic;
    m3_wvalid  : out std_logic;
    m3_wready  : in std_logic;
    m3_bid    : in std_logic_vector(3 downto 0);
    m3_bresp  : in std_logic_vector(1 downto 0);
    m3_bvalid  : in std_logic;
    m3_bready  : out std_logic;
    m3_arid    : out std_logic_vector(3 downto 0);
    m3_araddr  : out std_logic_vector(31 downto 0);
    m3_arlen  : out std_logic_vector(7 downto 0);
    m3_arsize  : out std_logic_vector(2 downto 0);
    m3_arburst  : out std_logic_vector(1 downto 0);
    m3_arlock  : out std_logic;
    m3_arcache  : out std_logic_vector(3 downto 0);
    m3_arprot  : out std_logic_vector(2 downto 0);
    m3_arqos  : out std_logic_vector(3 downto 0);
    m3_arvalid  : out std_logic;
    m3_arready  : in std_logic;
    m3_rid    : in std_logic_vector(3 downto 0);
    m3_rdata  : in std_logic_vector(63 downto 0);
    m3_rresp  : in std_logic_vector(1 downto 0);
    m3_rlast  : in std_logic;
    m3_rvalid  : in std_logic;
    m3_rready  : out std_logic
    -- }}}
  ); --}}}
end fgpu_wrapper;

architecture arch_imp of fgpu_wrapper is
  signal nrst      : std_logic;
  signal nrst_sync : std_logic;
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
  -- }}}
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
  -- }}}
  ---------------------------------------------------------------------------------------------------------}}}


  process(axi_clk, axi_aresetn)
  begin
    if axi_aresetn = '0' then
      nrst      <= '0';
      nrst_sync <= '0';
    else
      if rising_edge(axi_clk) then
        nrst      <= '1';
        nrst_sync <= nrst;
      end if;
    end if;
  end process;

  uut: fgpu_top
  port map (
    clk => axi_clk,
    nrst => nrst_sync,

    -- slave axi {{{
    s_awaddr => s_awaddr(15 downto 2),
    s_awprot => s_awprot,
    s_awvalid => s_awvalid,
    s_awready => s_awready,

    s_wdata => s_wdata,
    s_wstrb => s_wstrb,
    s_wvalid => s_wvalid,
    s_wready => s_wready,

    s_bresp => s_bresp,
    s_bvalid => s_bvalid,
    s_bready => s_bready,

    s_araddr => s_araddr(15 downto 2),
    s_arprot => s_arprot,
    s_arvalid => s_arvalid,
    s_arready => s_arready,

    s_rdata => s_rdata,
    s_rresp => s_rresp,
    s_rvalid => s_rvalid,
    s_rready => s_rready,
    -- }}}
    -- axi master 0 connections {{{
    -- ar channel
    m0_araddr => m0_araddr,
    m0_arlen => m0_arlen,
    m0_arsize => m0_arsize,
    m0_arburst => m0_arburst,
    m0_arvalid => m0_arvalid,
    m0_arready => m0_arready,
    m0_arid => m0_arid(ID_WIDTH-1 downto 0),
    -- r channel
    m0_rdata => m0_rdata,
    m0_rresp => m0_rresp,
    m0_rlast => m0_rlast,
    m0_rvalid => m0_rvalid,
    m0_rready => m0_rready,
    m0_rid => m0_rid(ID_WIDTH-1 downto 0),
    -- aw channel
    m0_awvalid => m0_awvalid,
    m0_awaddr => m0_awaddr,
    m0_awready => m0_awready,
    m0_awlen => m0_awlen,
    m0_awsize => m0_awsize,
    m0_awburst => m0_awburst,
    m0_awid => m0_awid(ID_WIDTH-1 downto 0),
    -- w channel
    m0_wdata => m0_wdata,
    m0_wstrb => m0_wstrb,
    m0_wlast => m0_wlast,
    m0_wvalid => m0_wvalid,
    m0_wready => m0_wready,
    -- b channel
    m0_bvalid => m0_bvalid,
    m0_bready => m0_bready,
    m0_bid => m0_bid(ID_WIDTH-1 downto 0),
    -- }}}
    -- axi master 1 connections {{{
    -- ar channel
    m1_araddr => m1_araddr,
    m1_arlen => m1_arlen,
    m1_arsize => m1_arsize,
    m1_arburst => m1_arburst,
    m1_arvalid => m1_arvalid,
    m1_arready => m1_arready,
    m1_arid => m1_arid(ID_WIDTH-1 downto 0),
    -- r channel
    m1_rdata => m1_rdata,
    m1_rresp => m1_rresp,
    m1_rlast => m1_rlast,
    m1_rvalid => m1_rvalid,
    m1_rready => m1_rready,
    m1_rid => m1_rid(ID_WIDTH-1 downto 0),
    -- aw channel
    m1_awvalid => m1_awvalid,
    m1_awaddr => m1_awaddr,
    m1_awready => m1_awready,
    m1_awlen => m1_awlen,
    m1_awsize => m1_awsize,
    m1_awburst => m1_awburst,
    m1_awid => m1_awid(ID_WIDTH-1 downto 0),
    -- w channel
    m1_wdata => m1_wdata,
    m1_wstrb => m1_wstrb,
    m1_wlast => m1_wlast,
    m1_wvalid => m1_wvalid,
    m1_wready => m1_wready,
    -- b channel
    m1_bvalid => m1_bvalid,
    m1_bready => m1_bready,
    m1_bid => m1_bid(ID_WIDTH-1 downto 0),
    -- }}}
    -- axi master 2 connections {{{
    -- ar channel
    m2_araddr => m2_araddr,
    m2_arlen => m2_arlen,
    m2_arsize => m2_arsize,
    m2_arburst => m2_arburst,
    m2_arvalid => m2_arvalid,
    m2_arready => m2_arready,
    m2_arid => m2_arid(ID_WIDTH-1 downto 0),
    -- r channel
    m2_rdata => m2_rdata,
    m2_rresp => m2_rresp,
    m2_rlast => m2_rlast,
    m2_rvalid => m2_rvalid,
    m2_rready => m2_rready,
    m2_rid => m2_rid(ID_WIDTH-1 downto 0),
    -- aw channel
    m2_awvalid => m2_awvalid,
    m2_awaddr => m2_awaddr,
    m2_awready => m2_awready,
    m2_awlen => m2_awlen,
    m2_awsize => m2_awsize,
    m2_awburst => m2_awburst,
    m2_awid => m2_awid(ID_WIDTH-1 downto 0),
    -- w channel
    m2_wdata => m2_wdata,
    m2_wstrb => m2_wstrb,
    m2_wlast => m2_wlast,
    m2_wvalid => m2_wvalid,
    m2_wready => m2_wready,
    -- b channel
    m2_bvalid => m2_bvalid,
    m2_bready => m2_bready,
    m2_bid => m2_bid(ID_WIDTH-1 downto 0),
    -- }}}
    -- axi master 3 connections {{{
    -- ar channel
    m3_araddr => m3_araddr,
    m3_arlen => m3_arlen,
    m3_arsize => m3_arsize,
    m3_arburst => m3_arburst,
    m3_arvalid => m3_arvalid,
    m3_arready => m3_arready,
    m3_arid => m3_arid(ID_WIDTH-1 downto 0),
    -- r channel
    m3_rdata => m3_rdata,
    m3_rresp => m3_rresp,
    m3_rlast => m3_rlast,
    m3_rvalid => m3_rvalid,
    m3_rready => m3_rready,
    m3_rid => m3_rid(ID_WIDTH-1 downto 0),
    -- aw channel
    m3_awvalid => m3_awvalid,
    m3_awaddr => m3_awaddr,
    m3_awready => m3_awready,
    m3_awlen => m3_awlen,
    m3_awsize => m3_awsize,
    m3_awburst => m3_awburst,
    m3_awid => m3_awid(ID_WIDTH-1 downto 0),
    -- w channel
    m3_wdata => m3_wdata,
    m3_wstrb => m3_wstrb,
    m3_wlast => m3_wlast,
    m3_wvalid => m3_wvalid,
    m3_wready => m3_wready,
    -- b channel
    m3_bvalid => m3_bvalid,
    m3_bready => m3_bready,
    m3_bid => m3_bid(ID_WIDTH-1 downto 0)
    -- }}}
  );

    --to manage the ID_WIDTH, without modifying the top
  id_width_check: if ID_WIDTH /= 4 generate
    id_width_adapter: for i in 3 downto ID_WIDTH generate
      m0_arid(i) <= '0';
      m0_awid(i) <= '0';
      m1_arid(i) <= '0';
      m1_awid(i) <= '0';
      m2_arid(i) <= '0';
      m2_awid(i) <= '0';
      m3_arid(i) <= '0';
      m3_awid(i) <= '0';
    end generate;
  end generate;

end arch_imp;
