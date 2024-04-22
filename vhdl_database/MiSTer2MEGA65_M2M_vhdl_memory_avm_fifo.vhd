library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity avm_fifo is
   generic (
      G_WR_DEPTH     : integer;
      G_RD_DEPTH     : integer;
      G_FILL_SIZE    : natural := 5;
      G_ADDRESS_SIZE : integer; -- Number of bits
      G_DATA_SIZE    : integer  -- Number of bits
   );
   port (
      s_clk_i               : in  std_logic;
      s_rst_i               : in  std_logic;
      s_avm_waitrequest_o   : out std_logic;
      s_avm_write_i         : in  std_logic;
      s_avm_read_i          : in  std_logic;
      s_avm_address_i       : in  std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      s_avm_writedata_i     : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      s_avm_byteenable_i    : in  std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      s_avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      s_avm_readdata_o      : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      s_avm_readdatavalid_o : out std_logic;
      m_clk_i               : in  std_logic;
      m_rst_i               : in  std_logic;
      m_avm_waitrequest_i   : in  std_logic;
      m_avm_write_o         : out std_logic;
      m_avm_read_o          : out std_logic;
      m_avm_address_o       : out std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      m_avm_writedata_o     : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_avm_byteenable_o    : out std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      m_avm_burstcount_o    : out std_logic_vector(7 downto 0);
      m_avm_readdata_i      : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_avm_readdatavalid_i : in  std_logic
   );
end entity avm_fifo;

architecture synthesis of avm_fifo is

   subtype R_FIFO_ADDRESS    is natural range G_ADDRESS_SIZE-1 downto 0;
   subtype R_FIFO_WRITEDATA  is natural range R_FIFO_ADDRESS'left + G_DATA_SIZE downto R_FIFO_ADDRESS'left + 1;
   subtype R_FIFO_BYTEENABLE is natural range R_FIFO_WRITEDATA'left + G_DATA_SIZE/8 downto R_FIFO_WRITEDATA'left + 1;
   constant R_FIFO_WRITE   : natural := R_FIFO_BYTEENABLE'left + 1;
   constant C_FIFO_WR_SIZE : natural := ((R_FIFO_BYTEENABLE'left + 2 + 7) / 8) * 8;

   signal s_wr_fifo_ready  : std_logic;
   signal s_wr_fifo_valid  : std_logic;
   signal s_wr_fifo_data   : std_logic_vector(C_FIFO_WR_SIZE-1 downto 0);
   signal s_wr_fifo_user   : std_logic_vector(7 downto 0);
   signal s_wr_fifo_size   : std_logic_vector(G_FILL_SIZE-1 downto 0);
   signal s_rd_fifo_size   : std_logic_vector(G_FILL_SIZE-1 downto 0);

   signal m_wr_fifo_ready  : std_logic;
   signal m_wr_fifo_valid  : std_logic;
   signal m_wr_fifo_data   : std_logic_vector(C_FIFO_WR_SIZE-1 downto 0);
   signal m_wr_fifo_user   : std_logic_vector(7 downto 0);
   signal m_wr_fifo_size   : std_logic_vector(G_FILL_SIZE-1 downto 0);
   signal m_rd_fifo_size   : std_logic_vector(G_FILL_SIZE-1 downto 0);

begin

   s_avm_waitrequest_o               <= not s_wr_fifo_ready;
   s_wr_fifo_data(R_FIFO_ADDRESS)    <= s_avm_address_i;
   s_wr_fifo_data(R_FIFO_WRITEDATA)  <= s_avm_writedata_i;
   s_wr_fifo_data(R_FIFO_BYTEENABLE) <= s_avm_byteenable_i;
   s_wr_fifo_data(R_FIFO_WRITE)      <= s_avm_write_i;
   s_wr_fifo_user                    <= s_avm_burstcount_i;
   s_wr_fifo_valid                   <= s_avm_write_i or s_avm_read_i;

   m_wr_fifo_ready       <= not m_avm_waitrequest_i;
   m_avm_write_o         <= m_wr_fifo_valid and m_wr_fifo_data(R_FIFO_WRITE);
   m_avm_read_o          <= m_wr_fifo_valid and not m_wr_fifo_data(R_FIFO_WRITE);
   m_avm_address_o       <= m_wr_fifo_data(R_FIFO_ADDRESS);
   m_avm_writedata_o     <= m_wr_fifo_data(R_FIFO_WRITEDATA);
   m_avm_byteenable_o    <= m_wr_fifo_data(R_FIFO_BYTEENABLE);
   m_avm_burstcount_o    <= m_wr_fifo_user;

   i_axi_fifo_wr : entity work.axi_fifo
      generic map (
         G_DEPTH     => G_WR_DEPTH,
         G_FILL_SIZE => G_FILL_SIZE,
         G_DATA_SIZE => C_FIFO_WR_SIZE,
         G_USER_SIZE => 8  -- burstcount
      )
      port map (
         s_aclk_i        => s_clk_i,
         s_aresetn_i     => not s_rst_i,
         s_axis_tready_o => s_wr_fifo_ready,
         s_axis_tvalid_i => s_wr_fifo_valid,
         s_axis_tdata_i  => s_wr_fifo_data,
         s_axis_tkeep_i  => (others => '1'),
         s_axis_tlast_i  => '1',
         s_axis_tuser_i  => s_wr_fifo_user,
         s_fill_o        => s_wr_fifo_size,
         m_aclk_i        => m_clk_i,
         m_axis_tready_i => m_wr_fifo_ready,
         m_axis_tvalid_o => m_wr_fifo_valid,
         m_axis_tdata_o  => m_wr_fifo_data,
         m_axis_tkeep_o  => open,
         m_axis_tlast_o  => open,
         m_axis_tuser_o  => m_wr_fifo_user,
         m_fill_o        => m_wr_fifo_size
      ); -- i_axi_fifo_wr

   i_axi_fifo_rd : entity work.axi_fifo
      generic map (
         G_DEPTH     => G_RD_DEPTH,
         G_FILL_SIZE => G_FILL_SIZE,
         G_DATA_SIZE => G_DATA_SIZE-8,
         G_USER_SIZE => 8  -- must be nonzero multiple of 8
      )
      port map (
         s_aclk_i        => m_clk_i,
         s_aresetn_i     => not m_rst_i,
         s_axis_tready_o => open,
         s_axis_tvalid_i => m_avm_readdatavalid_i,
         s_axis_tdata_i  => m_avm_readdata_i(G_DATA_SIZE-1 downto 8),
         s_axis_tkeep_i  => (others => '1'),
         s_axis_tlast_i  => '1',
         s_axis_tuser_i  => m_avm_readdata_i(7 downto 0),
         s_fill_o        => m_rd_fifo_size,
         m_aclk_i        => s_clk_i,
         m_axis_tready_i => '1',
         m_axis_tvalid_o => s_avm_readdatavalid_o,
         m_axis_tdata_o  => s_avm_readdata_o(G_DATA_SIZE-1 downto 8),
         m_axis_tkeep_o  => open,
         m_axis_tlast_o  => open,
         m_axis_tuser_o  => s_avm_readdata_o(7 downto 0),
         m_fill_o        => s_rd_fifo_size
      ); -- i_axi_fifo_rd

end architecture synthesis;

