-- This is the wrapper file for the complete HyperRAM controller.

-- Bit 31 of avm_address_i is used to indicate register space.

-- The datawidth is fixed at 16 bits.
-- The address is word-based, i.e. units of 2 bytes.

-- This module requires three clocks:
-- clk_x1_i     : 100 MHz : This is the main clock used for the Avalon MM
--                          interface as well as controlling the HyperRAM
--                          device.
-- clk_x2_i     :_200 MHz : Used for I/O to HyperRAM device.
-- clk_x2_del_i :_200 MHz : Used for I/O to HyperRAM device.
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hyperram is
   generic (
      G_ERRATA_ISSI_D_FIX : boolean := true
   );
   port (
      clk_x1_i            : in  std_logic; -- Main clock
      clk_x2_i            : in  std_logic; -- Physical I/O only
      clk_x2_del_i        : in  std_logic; -- Double frequency, phase shifted
      rst_i               : in  std_logic; -- Synchronous reset

      -- Avalon Memory Map
      avm_write_i         : in  std_logic;
      avm_read_i          : in  std_logic;
      avm_address_i       : in  std_logic_vector(31 downto 0);
      avm_writedata_i     : in  std_logic_vector(15 downto 0);
      avm_byteenable_i    : in  std_logic_vector(1 downto 0);
      avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      avm_readdata_o      : out std_logic_vector(15 downto 0);
      avm_readdatavalid_o : out std_logic;
      avm_waitrequest_o   : out std_logic;

      -- HyperRAM device interface
      hr_resetn_o         : out std_logic;
      hr_csn_o            : out std_logic;
      hr_ck_o             : out std_logic;
      hr_rwds_in_i        : in  std_logic;
      hr_rwds_out_o       : out std_logic;
      hr_rwds_oe_o        : out std_logic;   -- Output enable for RWDS
      hr_dq_in_i          : in  std_logic_vector(7 downto 0);
      hr_dq_out_o         : out std_logic_vector(7 downto 0);
      hr_dq_oe_o          : out std_logic    -- Output enable for DQ
   );
end entity hyperram;

architecture synthesis of hyperram is

   constant C_LATENCY : integer := 4;

   signal errata_write         : std_logic;
   signal errata_read          : std_logic;
   signal errata_address       : std_logic_vector(31 downto 0);
   signal errata_writedata     : std_logic_vector(15 downto 0);
   signal errata_byteenable    : std_logic_vector(1 downto 0);
   signal errata_burstcount    : std_logic_vector(7 downto 0);
   signal errata_readdata      : std_logic_vector(15 downto 0);
   signal errata_readdatavalid : std_logic;
   signal errata_waitrequest   : std_logic;

   signal cfg_write         : std_logic;
   signal cfg_read          : std_logic;
   signal cfg_address       : std_logic_vector(31 downto 0);
   signal cfg_writedata     : std_logic_vector(15 downto 0);
   signal cfg_byteenable    : std_logic_vector(1 downto 0);
   signal cfg_burstcount    : std_logic_vector(7 downto 0);
   signal cfg_readdata      : std_logic_vector(15 downto 0);
   signal cfg_readdatavalid : std_logic;
   signal cfg_waitrequest   : std_logic;

   signal ctrl_rstn         : std_logic;
   signal ctrl_ck_ddr       : std_logic_vector(1 downto 0);
   signal ctrl_csn          : std_logic;
   signal ctrl_dq_ddr_in    : std_logic_vector(15 downto 0);
   signal ctrl_dq_ddr_out   : std_logic_vector(15 downto 0);
   signal ctrl_dq_oe        : std_logic;
   signal ctrl_dq_ie        : std_logic;
   signal ctrl_rwds_ddr_out : std_logic_vector(1 downto 0);
   signal ctrl_rwds_oe      : std_logic;

begin

   gen_errata : if G_ERRATA_ISSI_D_FIX generate

      --------------------------------------------------------
      -- Instantiate workaround for errata in ISSI rev D dies
      --------------------------------------------------------

      i_hyperram_errata : entity work.hyperram_errata
         port map (
            clk_i                 => clk_x1_i,
            rst_i                 => rst_i,
            s_avm_waitrequest_o   => avm_waitrequest_o,
            s_avm_write_i         => avm_write_i,
            s_avm_read_i          => avm_read_i,
            s_avm_address_i       => avm_address_i,
            s_avm_writedata_i     => avm_writedata_i,
            s_avm_byteenable_i    => avm_byteenable_i,
            s_avm_burstcount_i    => avm_burstcount_i,
            s_avm_readdata_o      => avm_readdata_o,
            s_avm_readdatavalid_o => avm_readdatavalid_o,
            m_avm_waitrequest_i   => errata_waitrequest,
            m_avm_write_o         => errata_write,
            m_avm_read_o          => errata_read,
            m_avm_address_o       => errata_address,
            m_avm_writedata_o     => errata_writedata,
            m_avm_byteenable_o    => errata_byteenable,
            m_avm_burstcount_o    => errata_burstcount,
            m_avm_readdata_i      => errata_readdata,
            m_avm_readdatavalid_i => errata_readdatavalid
         ); -- i_hyperram_errata

   else generate

      --------------------------------------------------------
      -- Bypass workaround for errata in ISSI rev D dies
      --------------------------------------------------------

      avm_waitrequest_o   <= errata_waitrequest;
      avm_readdata_o      <= errata_readdata;
      avm_readdatavalid_o <= errata_readdatavalid;
      errata_write          <= avm_write_i;
      errata_read           <= avm_read_i;
      errata_address        <= avm_address_i;
      errata_writedata      <= avm_writedata_i;
      errata_byteenable     <= avm_byteenable_i;
      errata_burstcount     <= avm_burstcount_i;

   end generate;


   --------------------------------------------------------
   -- Instantiate HyperRAM configurator
   --------------------------------------------------------

   i_hyperram_config : entity work.hyperram_config
      generic map (
         G_LATENCY => C_LATENCY
      )
      port map (
         clk_i                 => clk_x1_i,
         rst_i                 => rst_i,
         s_avm_write_i         => errata_write,
         s_avm_read_i          => errata_read,
         s_avm_address_i       => errata_address,
         s_avm_writedata_i     => errata_writedata,
         s_avm_byteenable_i    => errata_byteenable,
         s_avm_burstcount_i    => errata_burstcount,
         s_avm_readdata_o      => errata_readdata,
         s_avm_readdatavalid_o => errata_readdatavalid,
         s_avm_waitrequest_o   => errata_waitrequest,
         m_avm_write_o         => cfg_write,
         m_avm_read_o          => cfg_read,
         m_avm_address_o       => cfg_address,
         m_avm_writedata_o     => cfg_writedata,
         m_avm_byteenable_o    => cfg_byteenable,
         m_avm_burstcount_o    => cfg_burstcount,
         m_avm_readdata_i      => cfg_readdata,
         m_avm_readdatavalid_i => cfg_readdatavalid,
         m_avm_waitrequest_i   => cfg_waitrequest
      ); -- i_hyperram_config


   --------------------------------------------------------
   -- Instantiate HyperRAM controller
   --------------------------------------------------------

   i_hyperram_ctrl : entity work.hyperram_ctrl
      generic map (
         G_LATENCY => C_LATENCY
      )
      port map (
         clk_i                => clk_x1_i,
         rst_i                => rst_i,
         avm_write_i          => cfg_write,
         avm_read_i           => cfg_read,
         avm_address_i        => cfg_address,
         avm_writedata_i      => cfg_writedata,
         avm_byteenable_i     => cfg_byteenable,
         avm_burstcount_i     => cfg_burstcount,
         avm_readdata_o       => cfg_readdata,
         avm_readdatavalid_o  => cfg_readdatavalid,
         avm_waitrequest_o    => cfg_waitrequest,
         hb_rstn_o            => ctrl_rstn,
         hb_ck_ddr_o          => ctrl_ck_ddr,
         hb_csn_o             => ctrl_csn,
         hb_dq_ddr_in_i       => ctrl_dq_ddr_in,
         hb_dq_ddr_out_o      => ctrl_dq_ddr_out,
         hb_dq_oe_o           => ctrl_dq_oe,
         hb_dq_ie_i           => ctrl_dq_ie,
         hb_rwds_ddr_out_o    => ctrl_rwds_ddr_out,
         hb_rwds_oe_o         => ctrl_rwds_oe,
         hb_rwds_in_i         => hr_rwds_in_i
      ); -- i_hyperram_ctrl


   --------------------------------------------------------
   -- Instantiate HyperRAM I/O
   --------------------------------------------------------

   i_hyperram_io : entity work.hyperram_io
      port map (
         clk_x1_i            => clk_x1_i,
         clk_x2_i            => clk_x2_i,
         clk_x2_del_i        => clk_x2_del_i,
         rst_i               => rst_i,
         ctrl_rstn_i         => ctrl_rstn,
         ctrl_ck_ddr_i       => ctrl_ck_ddr,
         ctrl_csn_i          => ctrl_csn,
         ctrl_dq_ddr_in_o    => ctrl_dq_ddr_in,
         ctrl_dq_ddr_out_i   => ctrl_dq_ddr_out,
         ctrl_dq_oe_i        => ctrl_dq_oe,
         ctrl_dq_ie_o        => ctrl_dq_ie,
         ctrl_rwds_ddr_out_i => ctrl_rwds_ddr_out,
         ctrl_rwds_oe_i      => ctrl_rwds_oe,
         hr_resetn_o         => hr_resetn_o,
         hr_csn_o            => hr_csn_o,
         hr_ck_o             => hr_ck_o,
         hr_rwds_in_i        => hr_rwds_in_i,
         hr_dq_in_i          => hr_dq_in_i,
         hr_rwds_out_o       => hr_rwds_out_o,
         hr_dq_out_o         => hr_dq_out_o,
         hr_rwds_oe_o        => hr_rwds_oe_o,
         hr_dq_oe_o          => hr_dq_oe_o
      ); -- i_hyperram_io

end architecture synthesis;

