library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

library xpm;
use xpm.vcomponents.all;

entity axi_fifo is
   generic (
      G_DEPTH     : natural;
      G_FILL_SIZE : natural;
      G_DATA_SIZE : natural;
      G_USER_SIZE : natural
   );
   port (
      s_aclk_i        : in  std_logic;
      s_aresetn_i     : in  std_logic;
      s_axis_tready_o : out std_logic;
      s_axis_tvalid_i : in  std_logic;
      s_axis_tdata_i  : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      s_axis_tkeep_i  : in  std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      s_axis_tlast_i  : in  std_logic;
      s_axis_tuser_i  : in  std_logic_vector(G_USER_SIZE-1 downto 0);
      s_fill_o        : out std_logic_vector(G_FILL_SIZE-1 downto 0);
      m_aclk_i        : in  std_logic;
      m_axis_tready_i : in  std_logic;
      m_axis_tvalid_o : out std_logic;
      m_axis_tdata_o  : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_axis_tkeep_o  : out std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      m_axis_tlast_o  : out std_logic;
      m_axis_tuser_o  : out std_logic_vector(G_USER_SIZE-1 downto 0);
      m_fill_o        : out std_logic_vector(G_FILL_SIZE-1 downto 0)
   );
end entity axi_fifo;

architecture synthesis of axi_fifo is

begin

   i_xpm_fifo_axis : xpm_fifo_axis
      generic map (
         CDC_SYNC_STAGES      => 2,
         CLOCKING_MODE        => "independent_clock",
         ECC_MODE             => "no_ecc",
         FIFO_DEPTH           => G_DEPTH,
         FIFO_MEMORY_TYPE     => "auto",
         PACKET_FIFO          => "false",
         PROG_EMPTY_THRESH    => 10,
         PROG_FULL_THRESH     => 10,
         RD_DATA_COUNT_WIDTH  => G_FILL_SIZE,
         RELATED_CLOCKS       => 0,
         SIM_ASSERT_CHK       => 0,
         TDATA_WIDTH          => G_DATA_SIZE,
         TDEST_WIDTH          => 1,
         TID_WIDTH            => 1,
         TUSER_WIDTH          => G_USER_SIZE,
         USE_ADV_FEATURES     => "1404",
         WR_DATA_COUNT_WIDTH  => G_FILL_SIZE
      )
      port map (
         almost_empty_axis  => open,
         almost_full_axis   => open,
         dbiterr_axis       => open,
         injectdbiterr_axis => '0',
         injectsbiterr_axis => '0',
         m_aclk             => m_aclk_i,
         m_axis_tdata       => m_axis_tdata_o,
         m_axis_tdest       => open,
         m_axis_tid         => open,
         m_axis_tkeep       => m_axis_tkeep_o,
         m_axis_tlast       => m_axis_tlast_o,
         m_axis_tready      => m_axis_tready_i,
         m_axis_tstrb       => open,
         m_axis_tuser       => m_axis_tuser_o,
         m_axis_tvalid      => m_axis_tvalid_o,
         prog_empty_axis    => open,
         prog_full_axis     => open,
         rd_data_count_axis => m_fill_o,
         s_aclk             => s_aclk_i,
         s_aresetn          => s_aresetn_i,
         s_axis_tdata       => s_axis_tdata_i,
         s_axis_tdest       => (others => '0'),
         s_axis_tid         => (others => '0'),
         s_axis_tkeep       => s_axis_tkeep_i,
         s_axis_tlast       => s_axis_tlast_i,
         s_axis_tready      => s_axis_tready_o,
         s_axis_tstrb       => (others => '0'),
         s_axis_tuser       => s_axis_tuser_i,
         s_axis_tvalid      => s_axis_tvalid_i,
         sbiterr_axis       => open,
         wr_data_count_axis => s_fill_o
      ); -- i_xpm_fifo_axis

end architecture synthesis;

