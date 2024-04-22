-------------------------------------------------------------------------------
-- Title      : LocalLink-level Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
-- Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
-- File       : v6_emac_v1_6_locallink.vhd
-- Version    : 1.6
-------------------------------------------------------------------------------
--
-- (c) Copyright 2009-2012 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
-- Description:  This is the LocalLink-level wrapper for the Virtex-6
--               Embedded Tri-Mode Ethernet MAC. It is intended that this
--               example design can be quickly adapted and downloaded onto an
--               FPGA to provide a hardware test environment.
--
--               The LocalLink-level wrapper:
--
--               * instantiates the EMAC block-level wrapper (the EMAC
--                 instance-level wrapper with the physical interface logic);
--
--               * instantiates TX and RX reference design FIFOs with
--                 a LocalLink interface.
--
--               Please refer to the Datasheet, Getting Started Guide, and
--               the Virtex-6 Embedded Tri-Mode Ethernet MAC User Gude for
--               further information.
-------------------------------------------------------------------------------

library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
-- Entity declaration for the LocalLink-level wrapper
-------------------------------------------------------------------------------

entity v6_emac_v1_6_locallink is
   port(

      -- TX clock output
      TX_CLK_OUT               : out std_logic;
      -- TX clock input from BUFG
      TX_CLK                   : in  std_logic;

      -- LocalLink receiver interface
      RX_LL_CLOCK              : in  std_logic;
      RX_LL_RESET              : in  std_logic;
      RX_LL_DATA               : out std_logic_vector(7 downto 0);
      RX_LL_SOF_N              : out std_logic;
      RX_LL_EOF_N              : out std_logic;
      RX_LL_SRC_RDY_N          : out std_logic;
      RX_LL_DST_RDY_N          : in  std_logic;
      RX_LL_FIFO_STATUS        : out std_logic_vector(3 downto 0);

      -- LocalLink transmitter interface
      TX_LL_CLOCK              : in  std_logic;
      TX_LL_RESET              : in  std_logic;
      TX_LL_DATA               : in  std_logic_vector(7 downto 0);
      TX_LL_SOF_N              : in  std_logic;
      TX_LL_EOF_N              : in  std_logic;
      TX_LL_SRC_RDY_N          : in  std_logic;
      TX_LL_DST_RDY_N          : out std_logic;

      -- Client receiver interface
      EMACCLIENTRXDVLD         : out std_logic;
      EMACCLIENTRXFRAMEDROP    : out std_logic;
      EMACCLIENTRXSTATS        : out std_logic_vector(6 downto 0);
      EMACCLIENTRXSTATSVLD     : out std_logic;
      EMACCLIENTRXSTATSBYTEVLD : out std_logic;

      -- Client transmitter interface
      CLIENTEMACTXIFGDELAY     : in  std_logic_vector(7 downto 0);
      EMACCLIENTTXSTATS        : out std_logic;
      EMACCLIENTTXSTATSVLD     : out std_logic;
      EMACCLIENTTXSTATSBYTEVLD : out std_logic;

      -- MAC control interface
      CLIENTEMACPAUSEREQ       : in  std_logic;
      CLIENTEMACPAUSEVAL       : in  std_logic_vector(15 downto 0);

      -- Receive-side PHY clock on regional buffer, to EMAC
      PHY_RX_CLK               : in  std_logic;

      -- Clock signal
      GTX_CLK                  : in  std_logic;

      -- GMII interface
      GMII_TXD                 : out std_logic_vector(7 downto 0);
      GMII_TX_EN               : out std_logic;
      GMII_TX_ER               : out std_logic;
      GMII_TX_CLK              : out std_logic;
      GMII_RXD                 : in  std_logic_vector(7 downto 0);
      GMII_RX_DV               : in  std_logic;
      GMII_RX_ER               : in  std_logic;
      GMII_RX_CLK              : in  std_logic;

      -- Asynchronous reset
      RESET                    : in  std_logic

   );
end v6_emac_v1_6_locallink;


architecture TOP_LEVEL of v6_emac_v1_6_locallink is

-------------------------------------------------------------------------------
-- Component declarations for lower hierarchial level entities
-------------------------------------------------------------------------------

  -- Component declaration for the block-level wrapper
  component v6_emac_v1_6_block is
   port(
      -- TX clock output
      TX_CLK_OUT               : out std_logic;
      -- TX clock input from BUFG
      TX_CLK                   : in  std_logic;

      -- Client receiver interface
      EMACCLIENTRXD            : out std_logic_vector(7 downto 0);
      EMACCLIENTRXDVLD         : out std_logic;
      EMACCLIENTRXGOODFRAME    : out std_logic;
      EMACCLIENTRXBADFRAME     : out std_logic;
      EMACCLIENTRXFRAMEDROP    : out std_logic;
      EMACCLIENTRXSTATS        : out std_logic_vector(6 downto 0);
      EMACCLIENTRXSTATSVLD     : out std_logic;
      EMACCLIENTRXSTATSBYTEVLD : out std_logic;

      -- Client transmitter interface
      CLIENTEMACTXD            : in  std_logic_vector(7 downto 0);
      CLIENTEMACTXDVLD         : in  std_logic;
      EMACCLIENTTXACK          : out std_logic;
      CLIENTEMACTXFIRSTBYTE    : in  std_logic;
      CLIENTEMACTXUNDERRUN     : in  std_logic;
      EMACCLIENTTXCOLLISION    : out std_logic;
      EMACCLIENTTXRETRANSMIT   : out std_logic;
      CLIENTEMACTXIFGDELAY     : in  std_logic_vector(7 downto 0);
      EMACCLIENTTXSTATS        : out std_logic;
      EMACCLIENTTXSTATSVLD     : out std_logic;
      EMACCLIENTTXSTATSBYTEVLD : out std_logic;

      -- MAC control interface
      CLIENTEMACPAUSEREQ       : in  std_logic;
      CLIENTEMACPAUSEVAL       : in  std_logic_vector(15 downto 0);

      -- Receive-side PHY clock on regional buffer, to EMAC
      PHY_RX_CLK               : in  std_logic;

      -- Clock signal
      GTX_CLK                  : in  std_logic;

      -- GMII interface
      GMII_TXD                 : out std_logic_vector(7 downto 0);
      GMII_TX_EN               : out std_logic;
      GMII_TX_ER               : out std_logic;
      GMII_TX_CLK              : out std_logic;
      GMII_RXD                 : in  std_logic_vector(7 downto 0);
      GMII_RX_DV               : in  std_logic;
      GMII_RX_ER               : in  std_logic;
      GMII_RX_CLK              : in  std_logic;

      -- Asynchronous reset
      RESET                    : in  std_logic
    );
  end component;

   -- Component declaration for the client-side FIFO
   component eth_fifo_8
   generic (
        FULL_DUPLEX_ONLY    : boolean);
   port (
        -- EMAC transmitter client interface
        tx_clk              : in  std_logic;
        tx_reset            : in  std_logic;
        tx_enable           : in  std_logic;
        tx_data             : out std_logic_vector(7 downto 0);
        tx_data_valid       : out std_logic;
        tx_ack              : in  std_logic;
        tx_underrun         : out std_logic;
        tx_collision        : in  std_logic;
        tx_retransmit       : in  std_logic;

        -- Transmitter LocalLink interface
        tx_ll_clock         : in  std_logic;
        tx_ll_reset         : in  std_logic;
        tx_ll_data_in       : in  std_logic_vector(7 downto 0);
        tx_ll_sof_in_n      : in  std_logic;
        tx_ll_eof_in_n      : in  std_logic;
        tx_ll_src_rdy_in_n  : in  std_logic;
        tx_ll_dst_rdy_out_n : out std_logic;
        tx_fifo_status      : out std_logic_vector(3 downto 0);
        tx_overflow         : out std_logic;

        -- EMAC receiver client interface
        rx_clk              : in  std_logic;
        rx_reset            : in  std_logic;
        rx_enable           : in  std_logic;
        rx_data             : in  std_logic_vector(7 downto 0);
        rx_data_valid       : in  std_logic;
        rx_good_frame       : in  std_logic;
        rx_bad_frame        : in  std_logic;
        rx_overflow         : out std_logic;

        -- Receiver LocalLink interface
        rx_ll_clock         : in  std_logic;
        rx_ll_reset         : in  std_logic;
        rx_ll_data_out      : out std_logic_vector(7 downto 0);
        rx_ll_sof_out_n     : out std_logic;
        rx_ll_eof_out_n     : out std_logic;
        rx_ll_src_rdy_out_n : out std_logic;
        rx_ll_dst_rdy_in_n  : in  std_logic;
        rx_fifo_status      : out std_logic_vector(3 downto 0)
        );
   end component;


-------------------------------------------------------------------------------
-- Signal declarations
-------------------------------------------------------------------------------

    -- Global asynchronous reset
    signal reset_i               : std_logic;

    -- Client interface clocking signals
    signal tx_clk_i            : std_logic;
    signal rx_clk_i            : std_logic;

    -- Internal client interface connections
    -- Transmitter interface
    signal tx_data_i           : std_logic_vector(7 downto 0);
    signal tx_data_valid_i     : std_logic;
    signal tx_underrun_i       : std_logic;
    signal tx_ack_i            : std_logic;
    signal tx_collision_i      : std_logic;
    signal tx_retransmit_i     : std_logic;
    -- Receiver interface
    signal rx_data_i           : std_logic_vector(7 downto 0);
    signal rx_data_valid_i     : std_logic;
    signal rx_good_frame_i     : std_logic;
    signal rx_bad_frame_i      : std_logic;
    -- Registers for the EMAC receiver output
    signal rx_data_r           : std_logic_vector(7 downto 0);
    signal rx_data_valid_r     : std_logic;
    signal rx_good_frame_r     : std_logic;
    signal rx_bad_frame_r      : std_logic;

    -- Synchronous reset registers in the transmitter clock domain
    signal tx_pre_reset_i      : std_logic_vector(5 downto 0);
    signal tx_reset_i          : std_logic;

    -- Synchronous reset registers in the receiver clock domain
    signal rx_pre_reset_i      : std_logic_vector(5 downto 0);
    signal rx_reset_i          : std_logic;

    attribute async_reg : string;
    attribute async_reg of rx_pre_reset_i : signal is "true";
    attribute async_reg of tx_pre_reset_i : signal is "true";

    attribute keep : string;
    attribute keep of tx_data_i : signal is "true";
    attribute keep of tx_data_valid_i : signal is "true";
    attribute keep of tx_ack_i : signal is "true";
    attribute keep of rx_data_i : signal is "true";
    attribute keep of rx_data_valid_i : signal is "true";
-------------------------------------------------------------------------------
-- Main body of code
-------------------------------------------------------------------------------

begin

    -- Asynchronous reset input
    reset_i <= RESET;

    --------------------------------------------------------------------------
    -- Instantiate the block-level wrapper (v6_emac_v1_6_block.vhd)
    --------------------------------------------------------------------------
    v6_emac_v1_6_block_inst : v6_emac_v1_6_block
    port map (
      -- TX clock output
      TX_CLK_OUT               => TX_CLK_OUT,
      -- TX clock input from BUFG
      TX_CLK                   => TX_CLK,

      -- Client receiver interface
      EMACCLIENTRXD            => rx_data_i,
      EMACCLIENTRXDVLD         => rx_data_valid_i,
      EMACCLIENTRXGOODFRAME    => rx_good_frame_i,
      EMACCLIENTRXBADFRAME     => rx_bad_frame_i,
      EMACCLIENTRXFRAMEDROP    => EMACCLIENTRXFRAMEDROP,
      EMACCLIENTRXSTATS        => EMACCLIENTRXSTATS,
      EMACCLIENTRXSTATSVLD     => EMACCLIENTRXSTATSVLD,
      EMACCLIENTRXSTATSBYTEVLD => EMACCLIENTRXSTATSBYTEVLD,

      -- Client transmitter interface
      CLIENTEMACTXD            => tx_data_i,
      CLIENTEMACTXDVLD         => tx_data_valid_i,
      EMACCLIENTTXACK          => tx_ack_i,
      CLIENTEMACTXFIRSTBYTE    => '0',
      CLIENTEMACTXUNDERRUN     => tx_underrun_i,
      EMACCLIENTTXCOLLISION    => tx_collision_i,
      EMACCLIENTTXRETRANSMIT   => tx_retransmit_i,
      CLIENTEMACTXIFGDELAY     => CLIENTEMACTXIFGDELAY,
      EMACCLIENTTXSTATS        => EMACCLIENTTXSTATS,
      EMACCLIENTTXSTATSVLD     => EMACCLIENTTXSTATSVLD,
      EMACCLIENTTXSTATSBYTEVLD => EMACCLIENTTXSTATSBYTEVLD,

      -- MAC control interface
      CLIENTEMACPAUSEREQ       => CLIENTEMACPAUSEREQ,
      CLIENTEMACPAUSEVAL       => CLIENTEMACPAUSEVAL,

      -- Receive-side PHY clock on regional buffer, to EMAC
      PHY_RX_CLK               => PHY_RX_CLK,

      -- Clock signal
      GTX_CLK                  => GTX_CLK,

      -- GMII interface
      GMII_TXD                 => GMII_TXD,
      GMII_TX_EN               => GMII_TX_EN,
      GMII_TX_ER               => GMII_TX_ER,
      GMII_TX_CLK              => GMII_TX_CLK,
      GMII_RXD                 => GMII_RXD,
      GMII_RX_DV               => GMII_RX_DV,
      GMII_RX_ER               => GMII_RX_ER,
      GMII_RX_CLK              => GMII_RX_CLK,

      -- Asynchronous reset
      RESET                    => reset_i
   );

   ----------------------------------------------------------------------
   -- Instantiate the client-side FIFO
   ----------------------------------------------------------------------
   client_side_FIFO : eth_fifo_8
     generic map (
       FULL_DUPLEX_ONLY     => false)
     port map (
       -- EMAC transmitter client interface
       tx_clk               => tx_clk_i,
       tx_reset             => tx_reset_i,
       tx_enable            => '1',
       tx_data              => tx_data_i,
       tx_data_valid        => tx_data_valid_i,
       tx_ack               => tx_ack_i,
       tx_underrun          => tx_underrun_i,
       tx_collision         => tx_collision_i,
       tx_retransmit        => tx_retransmit_i,

       -- Transmitter LocalLink interface
       tx_ll_clock          => TX_LL_CLOCK,
       tx_ll_reset          => TX_LL_RESET,
       tx_ll_data_in        => TX_LL_DATA,
       tx_ll_sof_in_n       => TX_LL_SOF_N,
       tx_ll_eof_in_n       => TX_LL_EOF_N,
       tx_ll_src_rdy_in_n   => TX_LL_SRC_RDY_N,
       tx_ll_dst_rdy_out_n  => TX_LL_DST_RDY_N,
       tx_fifo_status       => open,
       tx_overflow          => open,

       -- EMAC receiver client interface
       rx_clk               => rx_clk_i,
       rx_reset             => rx_reset_i,
       rx_enable            => '1',
       rx_data              => rx_data_r,
       rx_data_valid        => rx_data_valid_r,
       rx_good_frame        => rx_good_frame_r,
       rx_bad_frame         => rx_bad_frame_r,
       rx_overflow          => open,

       -- Receiver LocalLink interface
       rx_ll_clock          => RX_LL_CLOCK,
       rx_ll_reset          => RX_LL_RESET,
       rx_ll_data_out       => RX_LL_DATA,
       rx_ll_sof_out_n      => RX_LL_SOF_N,
       rx_ll_eof_out_n      => RX_LL_EOF_N,
       rx_ll_src_rdy_out_n  => RX_LL_SRC_RDY_N,
       rx_ll_dst_rdy_in_n   => RX_LL_DST_RDY_N,
       rx_fifo_status       => RX_LL_FIFO_STATUS
       );

  ---------------------------------------------------------------------
  -- Additional synchronization, pipelining, and clock assignments
  ---------------------------------------------------------------------

   -- Create synchronous reset in the transmitter clock domain
   gen_tx_reset : process (tx_clk_i, reset_i)
   begin
     if reset_i = '1' then
       tx_pre_reset_i <= (others => '1');
       tx_reset_i     <= '1';
     elsif tx_clk_i'event and tx_clk_i = '1' then
         tx_pre_reset_i(0)          <= '0';
         tx_pre_reset_i(5 downto 1) <= tx_pre_reset_i(4 downto 0);
         tx_reset_i                 <= tx_pre_reset_i(5);
     end if;
   end process gen_tx_reset;

   -- Create synchronous reset in the receiver clock domain
   gen_rx_reset : process (rx_clk_i, reset_i)
   begin
     if reset_i = '1' then
       rx_pre_reset_i <= (others => '1');
       rx_reset_i     <= '1';
     elsif rx_clk_i'event and rx_clk_i = '1' then
         rx_pre_reset_i(0)          <= '0';
         rx_pre_reset_i(5 downto 1) <= rx_pre_reset_i(4 downto 0);
         rx_reset_i                 <= rx_pre_reset_i(5);
     end if;
   end process gen_rx_reset;

   -- Register the receiver outputs before routing to the FIFO
   regipgen : process(rx_clk_i, reset_i)
   begin
     if reset_i = '1' then
       rx_data_r       <= (others => '0');
       rx_data_valid_r <= '0';
       rx_good_frame_r <= '0';
       rx_bad_frame_r  <= '0';
     elsif rx_clk_i'event and rx_clk_i = '1' then
         rx_data_r       <= rx_data_i;
         rx_data_valid_r <= rx_data_valid_i;
         rx_good_frame_r <= rx_good_frame_i;
         rx_bad_frame_r  <= rx_bad_frame_i;
     end if;
   end process regipgen;

   EMACCLIENTRXDVLD <= rx_data_valid_i;

   -- Clocking assignments
   tx_clk_i  <= TX_CLK;
   rx_clk_i  <= PHY_RX_CLK;


end TOP_LEVEL;
