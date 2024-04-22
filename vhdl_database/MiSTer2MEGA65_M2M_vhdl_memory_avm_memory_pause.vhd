library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity avm_memory_pause is
   generic (
      G_REQ_PAUSE    : integer;
      G_RESP_PAUSE   : integer;
      G_ADDRESS_SIZE : integer; -- Number of bits
      G_DATA_SIZE    : integer  -- Number of bits
   );
   port (
      clk_i               : in  std_logic;
      rst_i               : in  std_logic;
      avm_write_i         : in  std_logic;
      avm_read_i          : in  std_logic;
      avm_address_i       : in  std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      avm_writedata_i     : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      avm_byteenable_i    : in  std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      avm_readdata_o      : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      avm_readdatavalid_o : out std_logic;
      avm_waitrequest_o   : out std_logic
   );
end entity avm_memory_pause;

architecture simulation of avm_memory_pause is

   signal avm_write         : std_logic;
   signal avm_read          : std_logic;
   signal avm_address       : std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
   signal avm_writedata     : std_logic_vector(G_DATA_SIZE-1 downto 0);
   signal avm_byteenable    : std_logic_vector(G_DATA_SIZE/8-1 downto 0);
   signal avm_burstcount    : std_logic_vector(7 downto 0);
   signal avm_readdata      : std_logic_vector(G_DATA_SIZE-1 downto 0);
   signal avm_readdatavalid : std_logic;
   signal avm_waitrequest   : std_logic;

begin

   i_avm_pause : entity work.avm_pause
      generic map (
         G_REQ_PAUSE    => G_REQ_PAUSE,
         G_RESP_PAUSE   => G_RESP_PAUSE,
         G_ADDRESS_SIZE => G_ADDRESS_SIZE,
         G_DATA_SIZE    => G_DATA_SIZE
      )
      port map (
         clk_i                 => clk_i,
         rst_i                 => rst_i,
         s_avm_write_i         => avm_write_i,
         s_avm_read_i          => avm_read_i,
         s_avm_address_i       => avm_address_i,
         s_avm_writedata_i     => avm_writedata_i,
         s_avm_byteenable_i    => avm_byteenable_i,
         s_avm_burstcount_i    => avm_burstcount_i,
         s_avm_readdata_o      => avm_readdata_o,
         s_avm_readdatavalid_o => avm_readdatavalid_o,
         s_avm_waitrequest_o   => avm_waitrequest_o,
         m_avm_write_o         => avm_write,
         m_avm_read_o          => avm_read,
         m_avm_address_o       => avm_address,
         m_avm_writedata_o     => avm_writedata,
         m_avm_byteenable_o    => avm_byteenable,
         m_avm_burstcount_o    => avm_burstcount,
         m_avm_readdata_i      => avm_readdata,
         m_avm_readdatavalid_i => avm_readdatavalid,
         m_avm_waitrequest_i   => avm_waitrequest
      ); -- i_avm_pause


   i_avm_memory : entity work.avm_memory
      generic map (
         G_ADDRESS_SIZE => G_ADDRESS_SIZE,
         G_DATA_SIZE    => G_DATA_SIZE
      )
      port map (
         clk_i               => clk_i,
         rst_i               => rst_i,
         avm_write_i         => avm_write,
         avm_read_i          => avm_read,
         avm_address_i       => avm_address,
         avm_writedata_i     => avm_writedata,
         avm_byteenable_i    => avm_byteenable,
         avm_burstcount_i    => avm_burstcount,
         avm_readdata_o      => avm_readdata,
         avm_readdatavalid_o => avm_readdatavalid,
         avm_waitrequest_o   => avm_waitrequest
      ); -- i_avm_memory

end architecture simulation;

