------------------------------------------------------------------------------------
-- AXI TDC channel top wrapper
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 7.6.2019
-- Modified: 12.6.2019 -> BRAM PORTB disconnect
-- 13.6.2019 -> AXI ID WIDTH signals
--
-- 29.9.2019
-- Version 2.0 -> New core, 64-bit BRAM data, AXI stays at 32 bits
--
-- Connects all the components and IPs together into an AXI interfaced TDC channel.
------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXITDC is
   generic (
      NTaps : integer := 192  -- No. of taps; multiple of 12! NTaps <= 200!
      -- ADDR_WIDTH : integer := 11    -- BRAM buffer address size
   );
   Port (
   
   s_axi_aclk : IN STD_LOGIC;
   s_axi_aresetn : IN STD_LOGIC;
   
   -- AXI Lite (GPIO)
   s_axi_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
   s_axi_awvalid : IN STD_LOGIC;
   s_axi_awready : OUT STD_LOGIC;
   s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   s_axi_wvalid : IN STD_LOGIC;
   s_axi_wready : OUT STD_LOGIC;
   s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
   s_axi_bvalid : OUT STD_LOGIC;
   s_axi_bready : IN STD_LOGIC;
   s_axi_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
   s_axi_arvalid : IN STD_LOGIC;
   s_axi_arready : OUT STD_LOGIC;
   s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
   s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
   s_axi_rvalid : OUT STD_LOGIC;
   s_axi_rready : IN STD_LOGIC;
   
   -- AXI (BRAM Controller)
   s_axi_1_awid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
   s_axi_1_awaddr : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
   s_axi_1_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
   s_axi_1_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
   s_axi_1_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
   s_axi_1_awlock : IN STD_LOGIC;
   s_axi_1_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   s_axi_1_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
   s_axi_1_awvalid : IN STD_LOGIC;
   s_axi_1_awready : OUT STD_LOGIC;
   s_axi_1_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   s_axi_1_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   s_axi_1_wlast : IN STD_LOGIC;
   s_axi_1_wvalid : IN STD_LOGIC;
   s_axi_1_wready : OUT STD_LOGIC;
   s_axi_1_bid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
   s_axi_1_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
   s_axi_1_bvalid : OUT STD_LOGIC;
   s_axi_1_bready : IN STD_LOGIC;
   s_axi_1_arid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
   s_axi_1_araddr : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
   s_axi_1_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
   s_axi_1_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
   s_axi_1_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
   s_axi_1_arlock : IN STD_LOGIC;
   s_axi_1_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   s_axi_1_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
   s_axi_1_arvalid : IN STD_LOGIC;
   s_axi_1_arready : OUT STD_LOGIC;
   s_axi_1_rid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
   s_axi_1_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
   s_axi_1_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
   s_axi_1_rlast : OUT STD_LOGIC;
   s_axi_1_rvalid : OUT STD_LOGIC;
   s_axi_1_rready : IN STD_LOGIC;
   
   -- TDC
   clk : in std_logic;
   hit : in std_logic;
   
   trigger_in : in std_logic_vector(10 downto 0); -- BRAM buffer address size
   trigger_out : out std_logic_vector(10 downto 0)
   
   );
end AXITDC;

architecture Structure of AXITDC is

   constant ADDR_WIDTH : integer := 11;   -- fixed to 2K
   
   -- AXI GPIO component & signals
   component axi_gpio_0 is
      Port (
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      s_axi_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      s_axi_awvalid : IN STD_LOGIC;
      s_axi_awready : OUT STD_LOGIC;
      s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_wvalid : IN STD_LOGIC;
      s_axi_wready : OUT STD_LOGIC;
      s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_bvalid : OUT STD_LOGIC;
      s_axi_bready : IN STD_LOGIC;
      s_axi_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      s_axi_arvalid : IN STD_LOGIC;
      s_axi_arready : OUT STD_LOGIC;
      s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_rvalid : OUT STD_LOGIC;
      s_axi_rready : IN STD_LOGIC;
      gpio_io_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      gpio2_io_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
      );
   end component;
   
   signal gpio_in : STD_LOGIC_VECTOR(1 DOWNTO 0);
   signal gpio_out : STD_LOGIC_VECTOR(1 DOWNTO 0);
   
   -- AXI BRAM Controller component & signals
   component axi_bram_ctrl_0 is
      Port (
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      s_axi_awid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      s_axi_awaddr : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      s_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_awlock : IN STD_LOGIC;
      s_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_awvalid : IN STD_LOGIC;
      s_axi_awready : OUT STD_LOGIC;
      s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_wlast : IN STD_LOGIC;
      s_axi_wvalid : IN STD_LOGIC;
      s_axi_wready : OUT STD_LOGIC;
      s_axi_bid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_bvalid : OUT STD_LOGIC;
      s_axi_bready : IN STD_LOGIC;
      s_axi_arid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      s_axi_araddr : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      s_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_arlock : IN STD_LOGIC;
      s_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_arvalid : IN STD_LOGIC;
      s_axi_arready : OUT STD_LOGIC;
      s_axi_rid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_rlast : OUT STD_LOGIC;
      s_axi_rvalid : OUT STD_LOGIC;
      s_axi_rready : IN STD_LOGIC;
      bram_rst_a : OUT STD_LOGIC;
      bram_clk_a : OUT STD_LOGIC;
      bram_en_a : OUT STD_LOGIC;
      bram_we_a : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bram_addr_a : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      bram_wrdata_a : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_rddata_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
   end component;
   
   signal bram_rst_a : STD_LOGIC;
   signal bram_clk_a : STD_LOGIC;
   signal bram_en_a : STD_LOGIC;
   signal bram_we_a : STD_LOGIC_VECTOR(3 DOWNTO 0);
   signal bram_addr_a : STD_LOGIC_VECTOR(13 DOWNTO 0);
   signal bram_wrdata_a : STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal bram_rddata_a : STD_LOGIC_VECTOR(31 DOWNTO 0);
   
   -- Dual Port BRAM component
   component blk_mem_gen_0 is
      Port (
      clka : IN STD_LOGIC;
      rsta : IN STD_LOGIC;
      ena : IN STD_LOGIC;
      wea : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      addra : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  -- 32 bit port
      douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      clkb : IN STD_LOGIC;
      rstb : IN STD_LOGIC;
      enb : IN STD_LOGIC;
      web : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      addrb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      dinb : IN STD_LOGIC_VECTOR(63 DOWNTO 0);  -- 64 bit port
      doutb : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
      );
   end component;
   
   -- TDC component signals
   signal run, clr, rdy, full : std_logic;
   signal addr : std_logic_vector(ADDR_WIDTH-1 downto 0);
   signal data : std_logic_vector(63 downto 0);
   signal we : std_logic_vector(7 downto 0);
   
begin

   -- AXI GPIO port map
   AXI_control: axi_gpio_0
      port map(
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_awaddr => s_axi_awaddr,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_awready => s_axi_awready,
      s_axi_wdata => s_axi_wdata,
      s_axi_wstrb => s_axi_wstrb,
      s_axi_wvalid => s_axi_wvalid,
      s_axi_wready => s_axi_wready,
      s_axi_bresp => s_axi_bresp,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_bready => s_axi_bready,
      s_axi_araddr => s_axi_araddr,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arready => s_axi_arready,
      s_axi_rdata => s_axi_rdata,
      s_axi_rresp => s_axi_rresp,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_rready => s_axi_rready,
      gpio_io_i => gpio_in,
      gpio2_io_o => gpio_out        
   );
      
   -- AXI BRAM Controller  port map
   AXI_memory: axi_bram_ctrl_0
      port map(
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_awid => s_axi_1_awid,
      s_axi_awaddr => s_axi_1_awaddr,
      s_axi_awlen => s_axi_1_awlen,
      s_axi_awsize => s_axi_1_awsize,
      s_axi_awburst => s_axi_1_awburst,
      s_axi_awlock => s_axi_1_awlock,
      s_axi_awcache => s_axi_1_awcache,
      s_axi_awprot => s_axi_1_awprot,
      s_axi_awvalid => s_axi_1_awvalid,
      s_axi_awready => s_axi_1_awready,
      s_axi_wdata => s_axi_1_wdata,
      s_axi_wstrb => s_axi_1_wstrb,
      s_axi_wlast => s_axi_1_wlast,
      s_axi_wvalid => s_axi_1_wvalid,
      s_axi_wready => s_axi_1_wready,
      s_axi_bid => s_axi_1_bid,
      s_axi_bresp => s_axi_1_bresp,
      s_axi_bvalid => s_axi_1_bvalid,
      s_axi_bready => s_axi_1_bready,
      s_axi_arid => s_axi_1_arid,
      s_axi_araddr => s_axi_1_araddr,
      s_axi_arlen => s_axi_1_arlen,
      s_axi_arsize => s_axi_1_arsize,
      s_axi_arburst => s_axi_1_arburst,
      s_axi_arlock => s_axi_1_arlock,
      s_axi_arcache => s_axi_1_arcache,
      s_axi_arprot => s_axi_1_arprot,
      s_axi_arvalid => s_axi_1_arvalid,
      s_axi_arready => s_axi_1_arready,
      s_axi_rid => s_axi_1_rid,
      s_axi_rdata => s_axi_1_rdata,
      s_axi_rresp => s_axi_1_rresp,
      s_axi_rlast => s_axi_1_rlast,
      s_axi_rvalid => s_axi_1_rvalid,
      s_axi_rready => s_axi_1_rready,
      bram_rst_a => bram_rst_a,
      bram_clk_a => bram_clk_a,
      bram_en_a => bram_en_a,
      bram_we_a => bram_we_a,
      bram_addr_a => bram_addr_a,
      bram_wrdata_a => bram_wrdata_a,
      bram_rddata_a => bram_rddata_a
   );
   
   -- BRAM port map
   BRAM: blk_mem_gen_0
      port map(
      -- BRAM Controller side
      clka => bram_clk_a,
      rsta => bram_rst_a,
      ena => bram_en_a,
      wea => bram_we_a,
      addra(31 downto 14) => (others => '0'),
      addra(13 downto 0) => bram_addr_a,  -- lowest bits (byte access)
      dina => bram_wrdata_a,
      douta => bram_rddata_a,
      -- TDC side
      clkb => clk,
      rstb => '0',
      enb => '1',
      web => we,
      addrb(31 downto ADDR_WIDTH+3) => (others => '0'),
      addrb(ADDR_WIDTH-1+3 downto 3) => addr,   -- shift up by 3 bits (8 bytes per data)
      addrb(2 downto 0) => "000",
      dinb => data,
      doutb => open      
      
      -- PORTB disable
      --clkb => '0',
      --rstb => '0',
      --enb => '0',
      --web => "0000",
      --addrb => (others => '0'),
      --dinb => x"00000008",
      --doutb => open
   );
   
   -- TDC port map
   TDC:
   entity work.TDCchannel(rtl)
      generic map(
         NTaps => NTaps,
         ADDR_WIDTH => ADDR_WIDTH
      )
      port map(
         clk => clk,
         hit => hit,
         addr => addr,
         data => data,
         we => we,
         run => run,
         clr => clr,
         rdy => rdy,
         full => full,
         trigger_in => trigger_in,
         trigger_out => trigger_out
      );

   -- synchronizers
   sync_0:
   entity work.sync(rtl)
   port map(
      target_clk => clk,
      asyn => gpio_out(0),
      syn => clr
   );
   
   sync_1:
   entity work.sync(rtl)
   port map(
      target_clk => clk,
      asyn => gpio_out(1),
      syn => run
   ); 
   
   sync_2:
   entity work.sync(rtl)
   port map(
      target_clk => s_axi_aclk,
      asyn => rdy,
      syn => gpio_in(0)
   );
   
   sync_3:
   entity work.sync(rtl)
   port map(
      target_clk => s_axi_aclk,
      asyn => full,
      syn => gpio_in(1)
   ); 
   
end Structure;
