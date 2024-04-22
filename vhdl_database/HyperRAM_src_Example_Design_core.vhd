-- This is the core test
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity core is
   generic (
      G_ADDRESS_SIZE      : integer;
      G_SYS_ADDRESS_SIZE  : integer;
      G_DATA_SIZE         : integer
   );
   port (
      clk_i          : in    std_logic; -- Main clock
      clk_del_i      : in    std_logic; -- Main clock, phase shifted
      delay_refclk_i : in    std_logic; -- 200 MHz
      rst_i          : in    std_logic; -- Synchronous reset

      -- Control and Status for trafic generator
      start_i        : in    std_logic;
      active_o       : out   std_logic;
      address_o      : out   std_logic_vector(31 downto 0) := (others => '0');
      data_exp_o     : out   std_logic_vector(31 downto 0) := (others => '0');
      data_read_o    : out   std_logic_vector(31 downto 0) := (others => '0');

      -- Statistics
      count_long_o   : out   unsigned(31 downto 0);
      count_short_o  : out   unsigned(31 downto 0);
      count_error_o  : out   unsigned(31 downto 0);

      -- HyperRAM device interface
      hr_resetn_o    : out   std_logic;
      hr_csn_o       : out   std_logic;
      hr_ck_o        : out   std_logic;
      hr_rwds_io     : inout std_logic;
      hr_dq_io       : inout std_logic_vector(7 downto 0)
   );
end entity core;

architecture synthesis of core is

   -- Avalon Memory Map interface to HyperRAM Controller
   signal avm_write            : std_logic;
   signal avm_read             : std_logic;
   signal avm_address          : std_logic_vector(31 downto 0) := (others => '0');
   signal avm_writedata        : std_logic_vector(G_DATA_SIZE-1 downto 0);
   signal avm_byteenable       : std_logic_vector(G_DATA_SIZE/8-1 downto 0);
   signal avm_burstcount       : std_logic_vector(7 downto 0);
   signal avm_readdata         : std_logic_vector(G_DATA_SIZE-1 downto 0);
   signal avm_readdatavalid    : std_logic;
   signal avm_waitrequest      : std_logic;

   signal dec_write            : std_logic;
   signal dec_read             : std_logic;
   signal dec_address          : std_logic_vector(31 downto 0) := (others => '0');
   signal dec_writedata        : std_logic_vector(15 downto 0);
   signal dec_byteenable       : std_logic_vector(1 downto 0);
   signal dec_burstcount       : std_logic_vector(7 downto 0);
   signal dec_readdata         : std_logic_vector(15 downto 0);
   signal dec_readdatavalid    : std_logic;
   signal dec_waitrequest      : std_logic;

   -- HyperRAM tri-state control signals
   signal hr_rwds_in           : std_logic;
   signal hr_dq_in             : std_logic_vector(7 downto 0);
   signal hr_rwds_out          : std_logic;
   signal hr_dq_out            : std_logic_vector(7 downto 0);
   signal hr_rwds_oe_n         : std_logic;
   signal hr_dq_oe_n           : std_logic_vector(7 downto 0);

   signal start_d              : std_logic;
   signal start_long           : unsigned(31 downto 0);
   signal start_short          : unsigned(31 downto 0);
   signal count_long           : unsigned(31 downto 0);
   signal count_short          : unsigned(31 downto 0);

begin

   count_long_o  <= count_long  - start_long;
   count_short_o <= count_short - start_short;

   p_start : process (clk_i)
   begin
      if rising_edge(clk_i) then
         start_d <= start_i;

         if start_d = '0' and start_i = '1' then
            start_long  <= count_long;
            start_short <= count_short;
         end if;
      end if;
   end process p_start;


   --------------------------------------------------------
   -- Instantiate trafic generator
   --------------------------------------------------------

   i_traffic_gen : entity work.trafic_gen
      generic map (
         G_DATA_SIZE    => G_DATA_SIZE,
         G_ADDRESS_SIZE => G_SYS_ADDRESS_SIZE
      )
      port map (
         clk_i               => clk_i,
         rst_i               => rst_i,
         start_i             => start_i,
         wait_o              => active_o,
         address_o           => address_o(G_SYS_ADDRESS_SIZE-1 downto 0),
         data_exp_o          => data_exp_o(G_DATA_SIZE-1 downto 0),
         data_read_o         => data_read_o(G_DATA_SIZE-1 downto 0),
         count_error_o       => count_error_o,
         avm_write_o         => avm_write,
         avm_read_o          => avm_read,
         avm_address_o       => avm_address(G_SYS_ADDRESS_SIZE-1 downto 0),
         avm_writedata_o     => avm_writedata,
         avm_byteenable_o    => avm_byteenable,
         avm_burstcount_o    => avm_burstcount,
         avm_readdata_i      => avm_readdata,
         avm_readdatavalid_i => avm_readdatavalid,
         avm_waitrequest_i   => avm_waitrequest
      ); -- i_traffic_gen

   gen_decrease : if G_DATA_SIZE > 16 generate
      i_avm_decrease : entity work.avm_decrease
         generic map (
            G_SLAVE_ADDRESS_SIZE  => G_ADDRESS_SIZE,
            G_SLAVE_DATA_SIZE     => G_DATA_SIZE,
            G_MASTER_ADDRESS_SIZE => 22,
            G_MASTER_DATA_SIZE    => 16
         )
         port map (
            clk_i                 => clk_i,
            rst_i                 => rst_i,
            s_avm_write_i         => avm_write,
            s_avm_read_i          => avm_read,
            s_avm_address_i       => avm_address(G_ADDRESS_SIZE-1 downto 0),
            s_avm_writedata_i     => avm_writedata,
            s_avm_byteenable_i    => avm_byteenable,
            s_avm_burstcount_i    => avm_burstcount,
            s_avm_readdata_o      => avm_readdata,
            s_avm_readdatavalid_o => avm_readdatavalid,
            s_avm_waitrequest_o   => avm_waitrequest,
            m_avm_write_o         => dec_write,
            m_avm_read_o          => dec_read,
            m_avm_address_o       => dec_address(21 downto 0),
            m_avm_writedata_o     => dec_writedata,
            m_avm_byteenable_o    => dec_byteenable,
            m_avm_burstcount_o    => dec_burstcount,
            m_avm_readdata_i      => dec_readdata,
            m_avm_readdatavalid_i => dec_readdatavalid,
            m_avm_waitrequest_i   => dec_waitrequest
         ); -- i_avm_decrease
      else generate
         dec_write         <= avm_write;
         dec_read          <= avm_read;
         dec_address       <= avm_address;
         dec_writedata     <= avm_writedata;
         dec_byteenable    <= avm_byteenable;
         dec_burstcount    <= avm_burstcount;
         avm_readdata      <= dec_readdata;
         avm_readdatavalid <= dec_readdatavalid;
         avm_waitrequest   <= dec_waitrequest;
      end generate gen_decrease;


   --------------------------------------------------------
   -- Instantiate HyperRAM interface
   --------------------------------------------------------

   i_hyperram : entity work.hyperram
      generic map (
         G_ERRATA_ISSI_D_FIX => true
      )
      port map (
         clk_i               => clk_i,
         clk_del_i           => clk_del_i,
         delay_refclk_i      => delay_refclk_i,
         rst_i               => rst_i,
         avm_write_i         => dec_write,
         avm_read_i          => dec_read,
         avm_address_i       => dec_address,
         avm_writedata_i     => dec_writedata,
         avm_byteenable_i    => dec_byteenable,
         avm_burstcount_i    => dec_burstcount,
         avm_readdata_o      => dec_readdata,
         avm_readdatavalid_o => dec_readdatavalid,
         avm_waitrequest_o   => dec_waitrequest,
         count_long_o        => count_long,
         count_short_o       => count_short,
         hr_resetn_o         => hr_resetn_o,
         hr_csn_o            => hr_csn_o,
         hr_ck_o             => hr_ck_o,
         hr_rwds_in_i        => hr_rwds_in,
         hr_dq_in_i          => hr_dq_in,
         hr_rwds_out_o       => hr_rwds_out,
         hr_dq_out_o         => hr_dq_out,
         hr_rwds_oe_n_o      => hr_rwds_oe_n,
         hr_dq_oe_n_o        => hr_dq_oe_n
      ); -- i_hyperram


   ----------------------------------
   -- Tri-state buffers for HyperRAM
   ----------------------------------

   hr_rwds_io <= hr_rwds_out when hr_rwds_oe_n = '0' else 'Z';
   hr_dq_gen : for i in 0 to 7 generate
      hr_dq_io(i) <= hr_dq_out(i) when hr_dq_oe_n(i) = '0' else 'Z';
   end generate hr_dq_gen;
   hr_rwds_in <= hr_rwds_io;
   hr_dq_in   <= hr_dq_io;

end architecture synthesis;

