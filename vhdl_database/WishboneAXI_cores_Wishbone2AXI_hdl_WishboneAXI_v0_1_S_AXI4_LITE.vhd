-------------------------------------------------------------------------------
-- Title      :
-- Project    : Wishbone2AXI
-------------------------------------------------------------------------------
-- File       : WishboneAXI_vX_Y_S_AXI4_LITE.vhd
-- Authors    : Adrian Byszuk <adrian.byszuk@gmail.com>
--            : Piotr Miedzik (qermit@sezamkowa.net)
-- Company    :
-- Created    : 2016-06-06
-- Last update: 2017-08-31
-- License    : This is a PUBLIC DOMAIN code, published under
--              Creative Commons CC0 license
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: AXI4Lite -> WB bridge
-------------------------------------------------------------------------------
-- Copyleft (ↄ) 2017 
-------------------------------------------------------------------------------
-- Revisions  : see git reflog
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Implementation details
-------------------------------------------------------------------------------
-- This core implemnts translation from AXI4LITE to Wishbone PIPELINED
-- Translation to Wishbone CLASSIC might be used with additional wb_adapter
-- In the AXI bus the read and write accesses may be handled independently
-- but in Wishbone they can't, therefore we must provide an arbitration scheme.
--
-- To avoid upstream bus jamming (write or read channel) we implement
-- arbitration that lowers the priority of the last type of operation.
--
-- To ease bridging, both AXI and WB use byte addressing. WB uses byte select.


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.genram_pkg.all;
use work.wishbone_pkg.all;
use work.axi_helpers_pkg.all;
use work.wb_helpers_pkg.all;


entity wishboneaxi_v0_2_s_axi4_lite is
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
    C_S_AXI_ADDR_WIDTH : integer := 32
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
end wishboneaxi_v0_2_s_axi4_lite;

architecture arch_imp of wishboneaxi_v0_2_s_axi4_lite is

component  inferred_sync_fifo is

  generic (
    g_data_width : natural;
    g_size       : natural;
    g_show_ahead : boolean := false;

    -- Read-side flag selection
    g_with_empty        : boolean := true;   -- with empty flag
    g_with_full         : boolean := true;   -- with full flag
    g_with_almost_empty : boolean := false;
    g_with_almost_full  : boolean := false;
    g_with_count        : boolean := false;  -- with words counter

    g_almost_empty_threshold : integer := 0;  -- threshold for almost empty flag
    g_almost_full_threshold  : integer := 0;  -- threshold for almost full flag

    g_register_flag_outputs : boolean := true
    );

  port (
    rst_n_i : in std_logic := '1';

    clk_i : in std_logic;
    d_i   : in std_logic_vector(g_data_width-1 downto 0);
    we_i  : in std_logic;

    q_o  : out std_logic_vector(g_data_width-1 downto 0);
    rd_i : in  std_logic;

    empty_o        : out std_logic;
    full_o         : out std_logic;
    almost_empty_o : out std_logic;
    almost_full_o  : out std_logic;
    count_o        : out std_logic_vector(f_log2_size(g_size)-1 downto 0)
    );

end component;

  signal r_last_was_write: std_logic;
  type t_trans_state is (IDLE, W_SEND, W_RESP, R_SEND, R_RESP);
  signal trans_state : t_trans_state := IDLE;

  -- AXI4LITE signals
  signal axi_wready       : std_logic;
  signal axi_bresp        : std_logic_vector(1 downto 0);
  signal axi_bvalid       : std_logic;
  signal axi_arready      : std_logic;
  signal axi_rdata        : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  signal axi_rresp        : std_logic_vector(1 downto 0);
  signal axi_rvalid       : std_logic;
  signal axi_araddr       : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  signal axi_araddr_empty : std_logic;
  signal axi_araddr_full  : std_logic;
  
  signal axi_s2m_awready    : std_logic;
  signal axi_m2s_awempty    : std_logic;
  signal axi_m2s_awaddr     : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  
  signal axi_s2m_wready     : std_logic;
  signal axi_m2s_dwempty     : std_logic;
  signal axi_m2s_waddr     : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  signal axi_m2s_wdata    :  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  signal axi_m2s_wempty   : std_logic;



  signal axi_araddr_read  : std_logic := '0';  
  signal axi_awaddr_read : std_logic; -- signal from arbiter


  signal wb_adr   : std_logic_vector(C_WB_ADR_WIDTH-1 downto 0);
  signal wb_dat_w : std_logic_vector(C_WB_DAT_WIDTH-1 downto 0);
  signal wb_cyc   : std_logic;
  signal wb_stb   : std_logic;
  
  signal wb_lock  : std_logic;
  signal wb_sel   : std_logic_vector(C_WB_DAT_WIDTH/8-1 downto 0);
  signal wb_we    : std_logic;

begin

  w_translate : process (aclk) is
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        r_last_was_write <= '0';
        trans_state <= IDLE;
        
        -- reset wishbone buss
        wb_cyc <= '0';
        wb_stb <= '0';
        wb_we  <= '0';
        wb_sel <= (others => '0');
        wb_dat_w <= (others => '0');
        wb_adr  <= (others => '0');

        axi_araddr_read <= '0';
        axi_awaddr_read <= '0';
        axi_rresp <= "00";
        axi_bresp <= "00";  
        axi_rdata <= (others => '0');  
        -- axi response channels
        axi_bvalid  <= '0';
        axi_rvalid  <= '0';
            
        wb_cyc      <= '0';
        wb_stb      <= '0';

        
      else
        case trans_state is
          when IDLE =>
            if (axi_m2s_wempty = '0' and r_last_was_write = '0' ) or 
               (axi_m2s_wempty = '0' and axi_araddr_empty = '1' ) then
               
              trans_state <= W_SEND;
              
              r_last_was_write <= '1';
              axi_awaddr_read <= '1';

              wb_cyc <= '1';
              wb_stb <= '1';
              wb_we  <= '1';
              
              wb_sel <= (others => '1');
              
              wb_dat_w <= axi_m2s_wdata;
              wb_adr   <= axi_m2s_awaddr;
              
            elsif axi_araddr_empty = '0' then
            
              trans_state <= R_SEND;
              
              r_last_was_write <= '0';
              axi_araddr_read <= '1';

              wb_cyc <= '1';
              wb_stb <= '1';
              wb_we  <= '0';
              wb_sel <= (others => '1');
         
              wb_dat_w <= (others => '0');
              wb_adr   <= axi_araddr;
            end if;

          when W_SEND =>
            wb_stb <= m_wb_s2m.stall;
            axi_awaddr_read <= '0';         
            if (m_wb_s2m.ack or m_wb_s2m.err or m_wb_s2m.rty) = '1' then
              trans_state  <= W_RESP;                              
              
              -- we should finish wishbone cycle, another master may use this channel
              wb_cyc <= '0';
              
              --if it's not ACK, then it must be slave error
              axi_bresp <= not(m_wb_s2m.ack) & '0';
              axi_bvalid   <= '1';                          
            end if;
            
          when W_RESP =>
            if s_axi_m2s.BREADY = '1' then
              -- later we may optimize this to start new wishbone write/read cycle here 
              trans_state <= IDLE;
              
              axi_bvalid   <= '0';
            end if;
          
          when R_SEND =>
            wb_stb <= m_wb_s2m.stall;
            axi_araddr_read <= '0';
            if (m_wb_s2m.ack or m_wb_s2m.err or m_wb_s2m.rty) = '1' then
              trans_state <= R_RESP;
              
              -- we should finish wishbone cycle, another master may use the same endpoint
              wb_cyc <= '0';
              
              --if it's not ACK, then it must be slave error
              axi_rresp   <= not(m_wb_s2m.ack) & '0';
              axi_rvalid  <= '1';
              axi_rdata   <= m_wb_s2m.dat;                                      
            end if;

          when R_RESP =>
            if s_axi_m2s.RREADY = '1' then
              -- later we may optimize this to start new wishbone write/read cycle here 
              trans_state <= IDLE;
              
              axi_rvalid <= '0';  
            end if;
                     
          when others =>
            -- axi ctl signals
            axi_araddr_read <= '0';
            axi_awaddr_read <= '0';
            
            -- axi response channels
            axi_bvalid  <= '0';
            axi_rvalid  <= '0';
            
            wb_cyc      <= '0';
            wb_stb      <= '0';
            
            trans_state <= IDLE;
--coverage on
        end case;
      end if;
    end if;
  end process;


  -- data write queue
  dw_queue : inferred_sync_fifo
    generic map (
      g_data_width        => C_S_AXI_DATA_WIDTH,
      g_size              => 4,
      g_show_ahead        => true,
      g_with_empty        => true,
      g_with_full         => true,
      g_with_almost_empty => false,
      g_with_almost_full  => false,
      g_with_count        => false
      )
    port map (
      rst_n_i => ARESETN,
      clk_i   => ACLK,
      d_i     => s_axi_m2s.WDATA(C_S_AXI_DATA_WIDTH - 1 downto 0),
      we_i    => s_axi_m2s.WVALID,
      
      q_o     => axi_m2s_wdata,
      rd_i    => axi_awaddr_read,
      empty_o => axi_m2s_dwempty,

      full_o  => axi_s2m_wready
      );

  aw_queue : inferred_sync_fifo
    generic map (
      g_data_width        => C_S_AXI_ADDR_WIDTH,
      g_size              => 4,
      g_show_ahead        => true,
      g_with_empty        => true,
      g_with_full         => true,
      g_with_almost_empty => false,
      g_with_almost_full  => false,
      g_with_count        => false
      )
    port map (
      rst_n_i => ARESETN,
      clk_i   => ACLK,
      d_i     => s_axi_m2s.AWADDR,
      we_i    => s_axi_m2s.AWVALID,
      
      q_o     => axi_m2s_awaddr,
      rd_i    => axi_awaddr_read,
      empty_o => axi_m2s_awempty,

      full_o  => axi_s2m_awready
      );

  -- AXI specification explicitly says that no relationship between input channels is defined (A3.3)
  -- It means that write data can appear before write address and vice versa. It is slave's responsibility
  -- to align channels if that's necessary for proper slave operation.
  -- To ease synchronization of AXI4LITE DATA and AWADDR channels we are using fifos and 
  -- start Wishbone write cycle only when both fifos ar not empty.

  axi_m2s_wempty <= axi_m2s_awempty or axi_m2s_dwempty;
  
  --To avoid wasted cycles put read requests on a queue. Combined with Wishbone's asynchronous cycle
  --termination or pipelined mode will prove very useful for achieving high bus throughput.
  ar_queue : inferred_sync_fifo
    generic map (
      g_data_width        => C_S_AXI_ADDR_WIDTH,
      g_size              => 4,
      g_show_ahead        => true,
      g_with_empty        => true,
      g_with_full         => true,
      g_with_almost_empty => false,
      g_with_almost_full  => false,
      g_with_count        => false
      )
    port map (
      rst_n_i => ARESETN,
      clk_i   => ACLK,
      d_i     => s_axi_m2s.ARADDR,
      we_i    => s_axi_m2s.ARVALID,
      
      q_o     => axi_araddr,
      rd_i    => axi_araddr_read,
      empty_o => axi_araddr_empty,
      -- this goes to axi s_axi_s2m.ARREADY
      full_o  => axi_arready
      );

  -- I/O Connections assignments
  s_axi_s2m.AWREADY <= '0' when aresetn = '0' else not(axi_s2m_awready);
  s_axi_s2m.WREADY  <= '0' when aresetn = '0' else not(axi_s2m_wready);
  s_axi_s2m.ARREADY <= '0' when aresetn = '0' else not(axi_arready);
  
  s_axi_s2m.BRESP   <= axi_bresp;
  s_axi_s2m.BVALID  <= axi_bvalid;

  s_axi_s2m.BID  <= (others => '0');
  s_axi_s2m.RID  <= (others => '0');
  s_axi_s2m.RLAST  <= '0';

  
  s_axi_s2m.RDATA(31 downto 0)   <= axi_rdata;
  s_axi_s2m.RDATA(s_axi_s2m.RDATA'left downto 32)   <= (others => '0');
  s_axi_s2m.RRESP   <= axi_rresp;
  s_axi_s2m.RVALID  <= axi_rvalid;

  m_wb_m2s.adr   <= wb_adr;
  m_wb_m2s.dat   <= wb_dat_w;
  m_wb_m2s.cyc   <= wb_cyc;
  m_wb_m2s.stb   <= wb_stb;
  --m_wb_m2s.lock  <= wb_lock;
  m_wb_m2s.sel   <= wb_sel;
  m_wb_m2s.we    <= wb_we;


  assert (C_S_AXI_DATA_WIDTH = C_WB_DAT_WIDTH)
    report "AXI-Lite->Wishbone bridge doesn't support data width conversion. " & lf &
    "C_S_AXI_DATA_WIDTH=" & integer'image(C_S_AXI_DATA_WIDTH) &
    " C_WB_DAT_WIDTH=" & integer'image(C_WB_DAT_WIDTH)
    severity failure;

  assert (C_WB_MODE = PIPELINED)
    report "Incorrect C_WB_MODE: " & f_wb_type_to_str(C_WB_MODE) & ". This core supports: " & f_wb_type_to_str(PIPELINED)
    severity failure;

end arch_imp;
