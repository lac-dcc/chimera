library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

-- This arbitrates fairly between three or four Masters connected to a single Slave

entity avm_arbit_general is
   generic (
      G_NUM_SLAVES    : integer;
      G_FREQ_HZ       : integer := 100_000_000;  -- 100 MHz
      G_ADDRESS_SIZE  : integer;
      G_DATA_SIZE     : integer
   );
   port (
      clk_i                 : in  std_logic;
      rst_i                 : in  std_logic;

      -- Slave interfaces
      s_avm_write_i         : in  std_logic_vector(G_NUM_SLAVES-1 downto 0);
      s_avm_read_i          : in  std_logic_vector(G_NUM_SLAVES-1 downto 0);
      s_avm_address_i       : in  std_logic_vector(G_NUM_SLAVES*G_ADDRESS_SIZE-1 downto 0);
      s_avm_writedata_i     : in  std_logic_vector(G_NUM_SLAVES*G_DATA_SIZE-1 downto 0);
      s_avm_byteenable_i    : in  std_logic_vector(G_NUM_SLAVES*G_DATA_SIZE/8-1 downto 0);
      s_avm_burstcount_i    : in  std_logic_vector(G_NUM_SLAVES*8-1 downto 0);
      s_avm_readdata_o      : out std_logic_vector(G_NUM_SLAVES*G_DATA_SIZE-1 downto 0);
      s_avm_readdatavalid_o : out std_logic_vector(G_NUM_SLAVES-1 downto 0);
      s_avm_waitrequest_o   : out std_logic_vector(G_NUM_SLAVES-1 downto 0);

      -- Master interface (output)
      m_avm_write_o         : out std_logic;
      m_avm_read_o          : out std_logic;
      m_avm_address_o       : out std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      m_avm_writedata_o     : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_avm_byteenable_o    : out std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      m_avm_burstcount_o    : out std_logic_vector(7 downto 0);
      m_avm_readdata_i      : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_avm_readdatavalid_i : in  std_logic;
      m_avm_waitrequest_i   : in  std_logic
   );
end entity avm_arbit_general;

architecture synthesis of avm_arbit_general is

   signal avm_01_write          : std_logic;
   signal avm_01_read           : std_logic;
   signal avm_01_address        : std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
   signal avm_01_writedata      : std_logic_vector(G_DATA_SIZE-1 downto 0);
   signal avm_01_byteenable     : std_logic_vector(G_DATA_SIZE/8-1 downto 0);
   signal avm_01_burstcount     : std_logic_vector(7 downto 0);
   signal avm_01_readdata       : std_logic_vector(G_DATA_SIZE-1 downto 0);
   signal avm_01_readdatavalid  : std_logic;
   signal avm_01_waitrequest    : std_logic;

   signal avm_23_write          : std_logic;
   signal avm_23_read           : std_logic;
   signal avm_23_address        : std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
   signal avm_23_writedata      : std_logic_vector(G_DATA_SIZE-1 downto 0);
   signal avm_23_byteenable     : std_logic_vector(G_DATA_SIZE/8-1 downto 0);
   signal avm_23_burstcount     : std_logic_vector(7 downto 0);
   signal avm_23_readdata       : std_logic_vector(G_DATA_SIZE-1 downto 0);
   signal avm_23_readdatavalid  : std_logic;
   signal avm_23_waitrequest    : std_logic;

begin

   i_avm_arbit_01 : entity work.avm_arbit
      generic map (
         G_FREQ_HZ      => G_FREQ_HZ,
         G_ADDRESS_SIZE => G_ADDRESS_SIZE,
         G_DATA_SIZE    => G_DATA_SIZE
      )
      port map (
         clk_i                  => clk_i,
         rst_i                  => rst_i,
         s0_avm_write_i         => s_avm_write_i        (                          0),
         s0_avm_read_i          => s_avm_read_i         (                          0),
         s0_avm_address_i       => s_avm_address_i      (1*G_ADDRESS_SIZE-1 downto 0*G_ADDRESS_SIZE),
         s0_avm_writedata_i     => s_avm_writedata_i    (1*G_DATA_SIZE-1    downto 0*G_DATA_SIZE),
         s0_avm_byteenable_i    => s_avm_byteenable_i   (1*G_DATA_SIZE/8-1  downto 0*G_DATA_SIZE/8),
         s0_avm_burstcount_i    => s_avm_burstcount_i   (1*8-1              downto 0*8),
         s0_avm_readdata_o      => s_avm_readdata_o     (1*G_DATA_SIZE-1    downto 0*G_DATA_SIZE),
         s0_avm_readdatavalid_o => s_avm_readdatavalid_o(                          0),
         s0_avm_waitrequest_o   => s_avm_waitrequest_o  (                          0),
         s1_avm_write_i         => s_avm_write_i        (                          1),
         s1_avm_read_i          => s_avm_read_i         (                          1),
         s1_avm_address_i       => s_avm_address_i      (2*G_ADDRESS_SIZE-1 downto 1*G_ADDRESS_SIZE),
         s1_avm_writedata_i     => s_avm_writedata_i    (2*G_DATA_SIZE-1    downto 1*G_DATA_SIZE),
         s1_avm_byteenable_i    => s_avm_byteenable_i   (2*G_DATA_SIZE/8-1  downto 1*G_DATA_SIZE/8),
         s1_avm_burstcount_i    => s_avm_burstcount_i   (2*8-1              downto 1*8),
         s1_avm_readdata_o      => s_avm_readdata_o     (2*G_DATA_SIZE-1    downto 1*G_DATA_SIZE),
         s1_avm_readdatavalid_o => s_avm_readdatavalid_o(                          1),
         s1_avm_waitrequest_o   => s_avm_waitrequest_o  (                          1),
         m_avm_write_o          => avm_01_write,
         m_avm_read_o           => avm_01_read,
         m_avm_address_o        => avm_01_address,
         m_avm_writedata_o      => avm_01_writedata,
         m_avm_byteenable_o     => avm_01_byteenable,
         m_avm_burstcount_o     => avm_01_burstcount,
         m_avm_readdata_i       => avm_01_readdata,
         m_avm_readdatavalid_i  => avm_01_readdatavalid,
         m_avm_waitrequest_i    => avm_01_waitrequest
      ); -- i_avm_arbit_01

   gen_4 : if G_NUM_SLAVES = 4 generate

      i_avm_arbit_23 : entity work.avm_arbit
         generic map (
            G_FREQ_HZ      => G_FREQ_HZ,
            G_ADDRESS_SIZE => G_ADDRESS_SIZE,
            G_DATA_SIZE    => G_DATA_SIZE
         )
         port map (
            clk_i                  => clk_i,
            rst_i                  => rst_i,
            s0_avm_write_i         => s_avm_write_i        (                          2),
            s0_avm_read_i          => s_avm_read_i         (                          2),
            s0_avm_address_i       => s_avm_address_i      (3*G_ADDRESS_SIZE-1 downto 2*G_ADDRESS_SIZE),
            s0_avm_writedata_i     => s_avm_writedata_i    (3*G_DATA_SIZE-1    downto 2*G_DATA_SIZE),
            s0_avm_byteenable_i    => s_avm_byteenable_i   (3*G_DATA_SIZE/8-1  downto 2*G_DATA_SIZE/8),
            s0_avm_burstcount_i    => s_avm_burstcount_i   (3*8-1              downto 2*8),
            s0_avm_readdata_o      => s_avm_readdata_o     (3*G_DATA_SIZE-1    downto 2*G_DATA_SIZE),
            s0_avm_readdatavalid_o => s_avm_readdatavalid_o(                          2),
            s0_avm_waitrequest_o   => s_avm_waitrequest_o  (                          2),
            s1_avm_write_i         => s_avm_write_i        (                          3),
            s1_avm_read_i          => s_avm_read_i         (                          3),
            s1_avm_address_i       => s_avm_address_i      (4*G_ADDRESS_SIZE-1 downto 3*G_ADDRESS_SIZE),
            s1_avm_writedata_i     => s_avm_writedata_i    (4*G_DATA_SIZE-1    downto 3*G_DATA_SIZE),
            s1_avm_byteenable_i    => s_avm_byteenable_i   (4*G_DATA_SIZE/8-1  downto 3*G_DATA_SIZE/8),
            s1_avm_burstcount_i    => s_avm_burstcount_i   (4*8-1              downto 3*8),
            s1_avm_readdata_o      => s_avm_readdata_o     (4*G_DATA_SIZE-1    downto 3*G_DATA_SIZE),
            s1_avm_readdatavalid_o => s_avm_readdatavalid_o(                          3),
            s1_avm_waitrequest_o   => s_avm_waitrequest_o  (                          3),
            m_avm_write_o          => avm_23_write,
            m_avm_read_o           => avm_23_read,
            m_avm_address_o        => avm_23_address,
            m_avm_writedata_o      => avm_23_writedata,
            m_avm_byteenable_o     => avm_23_byteenable,
            m_avm_burstcount_o     => avm_23_burstcount,
            m_avm_readdata_i       => avm_23_readdata,
            m_avm_readdatavalid_i  => avm_23_readdatavalid,
            m_avm_waitrequest_i    => avm_23_waitrequest
         ); -- i_avm_arbit_23
   else generate
      avm_23_write          <= s_avm_write_i     (                          2);
      avm_23_read           <= s_avm_read_i      (                          2);
      avm_23_address        <= s_avm_address_i   (3*G_ADDRESS_SIZE-1 downto 2*G_ADDRESS_SIZE);
      avm_23_writedata      <= s_avm_writedata_i (3*G_DATA_SIZE-1    downto 2*G_DATA_SIZE);
      avm_23_byteenable     <= s_avm_byteenable_i(3*G_DATA_SIZE/8-1  downto 2*G_DATA_SIZE/8);
      avm_23_burstcount     <= s_avm_burstcount_i(3*8-1              downto 2*8);
      s_avm_readdata_o     (3*G_DATA_SIZE-1 downto 2*G_DATA_SIZE) <= avm_23_readdata;
      s_avm_readdatavalid_o(                       2)             <= avm_23_readdatavalid;
      s_avm_waitrequest_o  (                       2)             <= avm_23_waitrequest;
   end generate gen_4;

   i_avm_arbit : entity work.avm_arbit
      generic map (
         G_FREQ_HZ      => G_FREQ_HZ,
         G_ADDRESS_SIZE => G_ADDRESS_SIZE,
         G_DATA_SIZE    => G_DATA_SIZE
      )
      port map (
         clk_i                  => clk_i,
         rst_i                  => rst_i,
         s0_avm_write_i         => avm_01_write,
         s0_avm_read_i          => avm_01_read,
         s0_avm_address_i       => avm_01_address,
         s0_avm_writedata_i     => avm_01_writedata,
         s0_avm_byteenable_i    => avm_01_byteenable,
         s0_avm_burstcount_i    => avm_01_burstcount,
         s0_avm_readdata_o      => avm_01_readdata,
         s0_avm_readdatavalid_o => avm_01_readdatavalid,
         s0_avm_waitrequest_o   => avm_01_waitrequest,
         s1_avm_write_i         => avm_23_write,
         s1_avm_read_i          => avm_23_read,
         s1_avm_address_i       => avm_23_address,
         s1_avm_writedata_i     => avm_23_writedata,
         s1_avm_byteenable_i    => avm_23_byteenable,
         s1_avm_burstcount_i    => avm_23_burstcount,
         s1_avm_readdata_o      => avm_23_readdata,
         s1_avm_readdatavalid_o => avm_23_readdatavalid,
         s1_avm_waitrequest_o   => avm_23_waitrequest,
         m_avm_write_o          => m_avm_write_o,
         m_avm_read_o           => m_avm_read_o,
         m_avm_address_o        => m_avm_address_o,
         m_avm_writedata_o      => m_avm_writedata_o,
         m_avm_byteenable_o     => m_avm_byteenable_o,
         m_avm_burstcount_o     => m_avm_burstcount_o,
         m_avm_readdata_i       => m_avm_readdata_i,
         m_avm_readdatavalid_i  => m_avm_readdatavalid_i,
         m_avm_waitrequest_i    => m_avm_waitrequest_i
      ); -- i_avm_arbit

end architecture synthesis;

