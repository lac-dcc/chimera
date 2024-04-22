----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: forty_gbe - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

--use work.parameter.all;

entity forty_gbe is
    generic (
        -- forty gbe specific parameters
        FABRIC_MAC        : std_logic_vector(47 downto 0);
        FABRIC_IP         : std_logic_vector(31 downto 0);
        FABRIC_PORT       : std_logic_vector(15 downto 0);
        FABRIC_NETMASK    : std_logic_vector(31 downto 0);
        FABRIC_GATEWAY    : std_logic_vector( 7 downto 0);
        FABRIC_ENABLE     : std_logic;
        TTL               : std_logic_vector( 7 downto 0);
        PROMISC_MODE      : integer;
        RX_CRC_CHK_ENABLE : integer := 0;
        RX_2B_SWAP        : boolean := false);
    port(
        user_clk : in std_logic;
        user_rst : in std_logic;

        sys_clk : in std_logic;
        sys_rst : in std_logic;

        REFCLK_P : in std_logic;
        REFCLK_N : in std_logic;

        qsfp_gtrefclk    : out std_logic;
        qsfp_soft_reset  : in  std_logic;

        fgbe_if_present   : out std_logic;

        xlgmii_txled     : out std_logic_vector(1 downto 0);
        xlgmii_rxled     : out std_logic_vector(1 downto 0);

        phy_rx_up : out std_logic;

        forty_gbe_rst             : in  std_logic;
        forty_gbe_tx_valid        : in  std_logic_vector(3 downto 0);
        forty_gbe_tx_end_of_frame : in  std_logic;
        forty_gbe_tx_data         : in  std_logic_vector(255 downto 0);
        forty_gbe_tx_dest_ip      : in  std_logic_vector(31 downto 0);
        forty_gbe_tx_dest_port    : in  std_logic_vector(15 downto 0);
        forty_gbe_tx_overflow     : out std_logic;
        forty_gbe_tx_afull        : out std_logic;
        forty_gbe_rx_valid        : out std_logic_vector(3 downto 0);
        forty_gbe_rx_end_of_frame : out std_logic;
        forty_gbe_rx_data         : out std_logic_vector(255 downto 0);
        forty_gbe_rx_source_ip    : out std_logic_vector(31 downto 0);
        forty_gbe_rx_source_port  : out std_logic_vector(15 downto 0);
        forty_gbe_rx_dest_ip      : out std_logic_vector(31 downto 0);
        forty_gbe_rx_dest_port    : out std_logic_vector(15 downto 0);
        forty_gbe_rx_bad_frame    : out std_logic;
        forty_gbe_rx_overrun      : out std_logic;
        forty_gbe_rx_overrun_ack  : in  std_logic;
        forty_gbe_rx_ack          : in  std_logic;

        forty_gbe_led_tx : out std_logic;
        forty_gbe_led_rx : out std_logic;
        forty_gbe_led_up : out std_logic;

        wb_clk_i : in  std_logic;
        wb_rst_i : in  std_logic;
        wb_dat_i : in  std_logic_vector(31 downto 0);
        wb_dat_o : out std_logic_vector(31 downto 0);
        wb_ack_o : out std_logic;
        wb_adr_i : in  std_logic_vector(31 downto 0);
        wb_cyc_i : in  std_logic;
        wb_sel_i : in  std_logic_vector(3 downto 0);
        wb_stb_i : in  std_logic;
        wb_we_i  : in  std_logic;
        wb_err_o : in  std_logic;

        -- MEZZANINE GTH SIGNALS
        PHY_LANE_RX_P : in  std_logic_vector(3 downto 0);
        PHY_LANE_RX_N : in  std_logic_vector(3 downto 0);
        PHY_LANE_TX_P : out std_logic_vector(3 downto 0);
        PHY_LANE_TX_N : out std_logic_vector(3 downto 0)
 );

end forty_gbe;

--}} End of automatically maintained section

architecture arch_forty_gbe of forty_gbe is

    component ska_forty_gb_eth
    generic (
        FABRIC_MAC        : std_logic_vector(47 downto 0);
        FABRIC_IP         : std_logic_vector(31 downto 0);
        FABRIC_PORT       : std_logic_vector(15 downto 0);
        FABRIC_NETMASK    : std_logic_vector(31 downto 0);
        FABRIC_GATEWAY    : std_logic_vector(7 downto 0);
        FABRIC_ENABLE     : std_logic;
        TTL               : std_logic_vector(7 downto 0);
        PROMISC_MODE      : integer;
        RX_CRC_CHK_ENABLE : integer;
        RX_2B_SWAP        : boolean);
    port (
        clk : in std_logic;
        rst : in std_logic;
        tx_valid            : in std_logic_vector(3 downto 0);
        tx_end_of_frame     : in std_logic;
        tx_data             : in std_logic_vector(255 downto 0);
        tx_dest_ip          : in std_logic_vector(31 downto 0);
        tx_dest_port        : in std_logic_vector(15 downto 0);
        tx_overflow         : out std_logic;
        tx_afull            : out std_logic;
        rx_valid            : out std_logic_vector(3 downto 0);
        rx_end_of_frame     : out std_logic;
        rx_data             : out std_logic_vector(255 downto 0);
        rx_source_ip        : out std_logic_vector(31 downto 0);
        rx_source_port      : out std_logic_vector(15 downto 0);
        rx_dest_ip          : out std_logic_vector(31 downto 0);
        rx_dest_port        : out std_logic_vector(15 downto 0);
        rx_bad_frame        : out std_logic;
        rx_overrun          : out std_logic;
        rx_overrun_ack      : in std_logic;
        rx_ack : in std_logic;
        CLK_I  : in std_logic;
        RST_I  : in std_logic;
        DAT_I  : in std_logic_vector(31 downto 0);
        DAT_O  : out std_logic_vector(31 downto 0);
        ACK_O  : out std_logic;
        ADR_I  : in std_logic_vector(31 downto 0);
        CYC_I  : in std_logic;
        SEL_I  : in std_logic_vector(3 downto 0);
        STB_I  : in std_logic;
        WE_I   : in std_logic;
        --ERR_O  : in std_logic;
        xlgmii_txclk    : in std_logic;
        xlgmii_txrst    : in std_logic;
        xlgmii_txd      : out std_logic_vector(255 downto 0);
        xlgmii_txc      : out std_logic_vector(31 downto 0);
        xlgmii_txled    : out std_logic_vector(1 downto 0);
        xlgmii_rxclk    : in std_logic;
        xlgmii_rxrst    : in std_logic;
        xlgmii_rxd      : in std_logic_vector(255 downto 0);
        xlgmii_rxc      : in std_logic_vector(31 downto 0);
        xlgmii_rxled    : out std_logic_vector(1 downto 0);
        phy_rx_up       : in std_logic;
        phy_tx_rst      : in std_logic;
        src_ip_address      : out std_logic_vector(31 downto 0);
        src_mac_address     : out std_logic_vector(47 downto 0);
        src_enable          : out std_logic;
        src_port            : out std_logic_vector(15 downto 0);
        src_gateway         : out std_logic_vector(7 downto 0);
        src_local_mc_recv_ip        : out std_logic_vector(31 downto 0);
        src_local_mc_recv_ip_mask   : out std_logic_vector(31 downto 0);
        --debug_out : out std_logic_vector(7 downto 0);
        debug_led : out std_logic_vector(7 downto 0));
    end component;

    component IEEE802_3_XL_PHY_top is
        Port(
            SYS_CLK_I            : in  std_logic;
            SYS_CLK_RST_I        : in  std_logic;

            GTREFCLK_PAD_N_I     : in  std_logic;
            GTREFCLK_PAD_P_I     : in  std_logic;

            GTREFCLK_O           : out std_logic;

            TXN_O                : out std_logic_vector(3 downto 0);
            TXP_O                : out std_logic_vector(3 downto 0);
            RXN_I                : in  std_logic_vector(3 downto 0);
            RXP_I                : in  std_logic_vector(3 downto 0);

            SOFT_RESET_I         : in  std_logic;

            LINK_UP_O            : out std_logic;

            -- XLGMII INPUT Interface
            -- Transmitter Interface
            XLGMII_X4_TXC_I      : in  std_logic_vector(31 downto 0);
            XLGMII_X4_TXD_I      : in  std_logic_vector(255 downto 0);

            -- XLGMII Output Interface
            -- Receiver Interface
            XLGMII_X4_RXC_O      : out std_logic_vector(31 downto 0);
            XLGMII_X4_RXD_O      : out std_logic_vector(255 downto 0);

            TEST_PATTERN_EN_I    : in  std_logic;
            TEST_PATTERN_ERROR_O : out std_logic
        );
    end component IEEE802_3_XL_PHY_top;
    
    --attribute mark_debug : string;
    attribute ASYNC_REG : string; 
    signal xlgmii_tx_valid        : std_logic_vector(3 downto 0);
    signal xlgmii_tx_end_of_frame : std_logic;
    signal xlgmii_tx_data         : std_logic_vector(255 downto 0);
    signal xlgmii_tx_dest_ip      : std_logic_vector(31 downto 0);
    signal xlgmii_tx_dest_port    : std_logic_vector(15 downto 0);
    signal xlgmii_tx_overflow     : std_logic;
    signal xlgmii_tx_afull        : std_logic;
    signal xlgmii_rx_valid        : std_logic_vector(3 downto 0);
    --attribute mark_debug of xlgmii_rx_valid: signal is "true";
    signal xlgmii_rx_end_of_frame : std_logic;
    --attribute mark_debug of xlgmii_rx_end_of_frame: signal is "true";
    signal xlgmii_rx_data         : std_logic_vector(255 downto 0);
    --attribute mark_debug of xlgmii_rx_data: signal is "true";
    signal xlgmii_rx_source_ip    : std_logic_vector(31 downto 0);
    --attribute mark_debug of xlgmii_rx_source_ip: signal is "true";
    signal xlgmii_rx_source_port  : std_logic_vector(15 downto 0);
    signal xlgmii_rx_dest_ip      : std_logic_vector(31 downto 0);
    signal xlgmii_rx_dest_port    : std_logic_vector(15 downto 0);
    signal xlgmii_rx_bad_frame    : std_logic;
    signal xlgmii_rx_overrun      : std_logic;
    signal xlgmii_rx_overrun_ack  : std_logic;
    signal xlgmii_rx_ack          : std_logic;

    signal xlgmii_txd : std_logic_vector(255 downto 0);
    signal xlgmii_txc : std_logic_vector(31 downto 0);
    signal xlgmii_rxd : std_logic_vector(255 downto 0);
    --attribute mark_debug of xlgmii_rxd: signal is "true";
    signal xlgmii_rxc : std_logic_vector(31 downto 0);
    --attribute mark_debug of xlgmii_rxc: signal is "true";

    signal xlgmii_txled_sig : std_logic_vector(1 downto 0);
    signal xlgmii_rxled_sig : std_logic_vector(1 downto 0);

    signal xlgmii_txd_i : std_logic_vector(255 downto 0);
    signal xlgmii_txc_i : std_logic_vector(31 downto 0);

    signal xlgmii_txd_reg : std_logic_vector(255 downto 0);
    signal xlgmii_txc_reg : std_logic_vector(31 downto 0);
    signal xlgmii_rxd_reg : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_reg : std_logic_vector(31 downto 0);

    signal phy_rx_up_sig : std_logic;
    signal xlgmii_src_ip_address : std_logic_vector(31 downto 0);
    signal xlgmii_src_mac_address : std_logic_vector(47 downto 0);
    signal xlgmii_src_enable : std_logic;
    signal xlgmii_src_port : std_logic_vector(15 downto 0);
    signal xlgmii_src_gateway : std_logic_vector(7 downto 0);
    signal xlgmii_src_local_mc_recv_ip : std_logic_vector(31 downto 0);
    signal xlgmii_src_local_mc_recv_ip_mask : std_logic_vector(31 downto 0);

    signal tx_start_count_0 : std_logic_vector(15 downto 0);
    signal tx_start_count_1 : std_logic_vector(15 downto 0);
    signal tx_start_count_2 : std_logic_vector(15 downto 0);
    signal tx_start_count_3 : std_logic_vector(15 downto 0);

    signal rx_start_count_0 : std_logic_vector(15 downto 0);
    signal rx_start_count_1 : std_logic_vector(15 downto 0);
    signal rx_start_count_2 : std_logic_vector(15 downto 0);
    signal rx_start_count_3 : std_logic_vector(15 downto 0);

    signal qsfp_gtrefclk_pb : std_logic;
    
    signal sXlGmiiRxLedD2 : std_logic;
    signal sXlGmiiRxLedD1 : std_logic;
    attribute ASYNC_REG of sXlGmiiRxLedD1 : signal is "TRUE";
    attribute ASYNC_REG of sXlGmiiRxLedD2 : signal is "TRUE";       
    
    signal sXlGmiiTxLedD2 : std_logic;
    signal sXlGmiiTxLedD1 : std_logic;
    attribute ASYNC_REG of sXlGmiiTxLedD1 : signal is "TRUE";
    attribute ASYNC_REG of sXlGmiiTxLedD2 : signal is "TRUE";       
    
    signal sPhyRxUpSigD2 : std_logic;
    signal sPhyRxUpSigD1 : std_logic;
    attribute ASYNC_REG of sPhyRxUpSigD1 : signal is "TRUE";
    attribute ASYNC_REG of sPhyRxUpSigD2 : signal is "TRUE"; 
    
    --signal sFortyGbeRstD2 : std_logic;
    --signal sFortyGbeRstD1 : std_logic;
    --attribute ASYNC_REG of sFortyGbeRstD1 : signal is "TRUE";
    --attribute ASYNC_REG of sFortyGbeRstD2 : signal is "TRUE"; 
    
    --signal sUserCombRst : std_logic;
    --signal sSysCombRst : std_logic;
   
begin

    xlgmii_tx_valid        <= forty_gbe_tx_valid;
    xlgmii_tx_end_of_frame <= forty_gbe_tx_end_of_frame;
    xlgmii_tx_data         <= forty_gbe_tx_data(63 downto 0) & forty_gbe_tx_data(127 downto 64) & forty_gbe_tx_data(191 downto 128) &  forty_gbe_tx_data(255 downto 192);
    xlgmii_tx_dest_ip      <= forty_gbe_tx_dest_ip;
    xlgmii_tx_dest_port    <= forty_gbe_tx_dest_port;

    forty_gbe_tx_overflow     <= xlgmii_tx_overflow;
    forty_gbe_tx_afull        <= xlgmii_tx_afull;
    forty_gbe_rx_valid        <= xlgmii_rx_valid;
    forty_gbe_rx_end_of_frame <= xlgmii_rx_end_of_frame;
    --AI: Rx Data incorrectly mapped and needs to be mapped correctly such that forty_gbe_rx_data[255:0] maps correctly to 40GbE MAC rx data[255:0]
    --forty_gbe_rx_data         <= xlgmii_rx_data;
    forty_gbe_rx_data(255 downto 0) <= xlgmii_rx_data(63 downto 0) & xlgmii_rx_data(127 downto 64) & xlgmii_rx_data(191 downto 128) &  xlgmii_rx_data(255 downto 192);    
    forty_gbe_rx_source_ip    <= xlgmii_rx_source_ip;
    forty_gbe_rx_source_port  <= xlgmii_rx_source_port;
    forty_gbe_rx_dest_ip      <= xlgmii_rx_dest_ip;
    forty_gbe_rx_dest_port    <= xlgmii_rx_dest_port;
    forty_gbe_rx_bad_frame    <= xlgmii_rx_bad_frame;
    forty_gbe_rx_overrun      <= xlgmii_rx_overrun;
    
    
    --pCDC40GbEResetSynchroniser : process(sys_clk)
    --begin
    --   if (rising_edge(sys_clk))then
    --       sFortyGbeRstD2 <= sFortyGbeRstD1;
    --       sFortyGbeRstD1 <= forty_gbe_rst;                    
    --   end if;
    --end process pCDC40GbEResetSynchroniser; 
    
    --sUserCombRst <= user_rst or forty_gbe_rst;
    --sSysCombRst <= sys_rst or sFortyGbeRstD2;

    -- WISHBONE SLAVE 10 - 40GBE MAC 0
    ska_forty_gb_eth_0 : ska_forty_gb_eth
    generic map(
        FABRIC_MAC        => FABRIC_MAC,
        FABRIC_IP         => FABRIC_IP,
        FABRIC_PORT       => FABRIC_PORT,
        FABRIC_NETMASK    => FABRIC_NETMASK,
        FABRIC_GATEWAY    => FABRIC_GATEWAY,
        FABRIC_ENABLE     => FABRIC_ENABLE,
        TTL               => TTL,
        PROMISC_MODE      => PROMISC_MODE,
        RX_CRC_CHK_ENABLE => RX_CRC_CHK_ENABLE,
        RX_2B_SWAP        => RX_2B_SWAP)
    port map(
        clk => user_clk,
        rst => user_rst,
        tx_valid            => xlgmii_tx_valid,
        tx_end_of_frame     => xlgmii_tx_end_of_frame,
        tx_data             => xlgmii_tx_data,
        tx_dest_ip          => xlgmii_tx_dest_ip,
        tx_dest_port        => xlgmii_tx_dest_port,
        tx_overflow         => xlgmii_tx_overflow,
        tx_afull            => xlgmii_tx_afull,
        rx_valid            => xlgmii_rx_valid,
        rx_end_of_frame     => xlgmii_rx_end_of_frame,
        rx_data             => xlgmii_rx_data,
        rx_source_ip        => xlgmii_rx_source_ip,
        rx_source_port      => xlgmii_rx_source_port,
        rx_dest_ip          => xlgmii_rx_dest_ip,
        rx_dest_port        => xlgmii_rx_dest_port,
        rx_bad_frame        => xlgmii_rx_bad_frame,
        rx_overrun          => xlgmii_rx_overrun,
        rx_overrun_ack      => xlgmii_rx_overrun_ack,
        rx_ack => xlgmii_rx_ack,
        CLK_I => wb_clk_i,
        RST_I => wb_rst_i,
        DAT_I => wb_dat_i,
        DAT_O => wb_dat_o,
        ACK_O => wb_ack_o,
        ADR_I => wb_adr_i,
        CYC_I => wb_cyc_i,
        SEL_I => wb_sel_i,
        STB_I => wb_stb_i,
        WE_I  => wb_we_i ,
        --ERR_O => wb_err_o,
        xlgmii_txclk    => sys_clk,
        xlgmii_txrst    => sys_rst,
        xlgmii_txd      => xlgmii_txd,
        xlgmii_txc      => xlgmii_txc,
        xlgmii_txled    => xlgmii_txled_sig,
        xlgmii_rxclk    => sys_clk,
        xlgmii_rxrst    => sys_rst,
        xlgmii_rxd      => xlgmii_rxd,
        xlgmii_rxc      => xlgmii_rxc,
        xlgmii_rxled    => xlgmii_rxled_sig,
        phy_tx_rst      => qsfp_soft_reset,
        phy_rx_up       => phy_rx_up_sig,
        src_ip_address      => xlgmii_src_ip_address,
        src_mac_address     => xlgmii_src_mac_address,
        src_enable          => xlgmii_src_enable,
        src_port            => xlgmii_src_port,
        src_gateway         => xlgmii_src_gateway,
        src_local_mc_recv_ip        => xlgmii_src_local_mc_recv_ip,
        src_local_mc_recv_ip_mask   => xlgmii_src_local_mc_recv_ip_mask,
        --debug_out   => debug_out,
        debug_led   => open);

    GTREFCLK_buf : BUFG
    port map(
        O => qsfp_gtrefclk,
        I => qsfp_gtrefclk_pb);

    gen_xlgmii_tx_reg : process(sys_clk)
    begin
        if (rising_edge(sys_clk))then
            xlgmii_txd_reg <= xlgmii_txd;
            xlgmii_txc_reg <= xlgmii_txc;
        end if;
    end process;

    gen_xlgmii_rx_reg : process(sys_clk)
    begin
        if (rising_edge(sys_clk))then
            xlgmii_rxd_reg <= xlgmii_rxd;
            xlgmii_rxc_reg <= xlgmii_rxc;
        end if;
    end process;

    gen_tx_start_count_0 : process(sys_rst, sys_clk)
    begin
        if (sys_rst = '1')then
            tx_start_count_0 <= (others => '0');
        elsif (rising_edge(sys_clk))then
            if (((xlgmii_txc_reg(0) = '1')and(xlgmii_txd_reg(7 downto 0) = X"FB"))or
            ((xlgmii_txc_reg(8) = '1')and(xlgmii_txd_reg(71 downto 64) = X"FB"))or
            ((xlgmii_txc_reg(16) = '1')and(xlgmii_txd_reg(135 downto 128) = X"FB"))or
            ((xlgmii_txc_reg(24) = '1')and(xlgmii_txd_reg(199 downto 192) = X"FB")))then
                tx_start_count_0 <= tx_start_count_0 + X"0001";
            end if;
        end if;
    end process;

    gen_rx_start_count_0 : process(sys_rst, sys_clk)
    begin
        if (sys_rst = '1')then
            rx_start_count_0 <= (others => '0');
        elsif (rising_edge(sys_clk))then
            if (((xlgmii_rxc_reg(0) = '1')and(xlgmii_rxd_reg(7 downto 0) = X"FB"))or
            ((xlgmii_rxc_reg(8) = '1')and(xlgmii_rxd_reg(71 downto 64) = X"FB"))or
            ((xlgmii_rxc_reg(16) = '1')and(xlgmii_rxd_reg(135 downto 128) = X"FB"))or
            ((xlgmii_rxc_reg(24) = '1')and(xlgmii_rxd_reg(199 downto 192) = X"FB")))then
                rx_start_count_0 <= rx_start_count_0 + X"0001";
            end if;
        end if;
    end process;

    xlgmii_rx_overrun_ack  <= forty_gbe_rx_overrun_ack;
    xlgmii_rx_ack          <= forty_gbe_rx_ack;
    
    pCDCLedSynchroniser : process(user_rst, user_clk)
    begin
       if (user_rst = '1')then
           sXlGmiiRxLedD1 <= '0';
           sXlGmiiRxLedD2 <= '0';      
           sXlGmiiTxLedD1 <= '0';
           sXlGmiiTxLedD2 <= '0';
           sPhyRxUpSigD1 <= '0';
           sPhyRxUpSigD2 <= '0';
       elsif (rising_edge(user_clk))then
           sXlGmiiRxLedD2 <= sXlGmiiRxLedD1;
           sXlGmiiRxLedD1 <= xlgmii_rxled_sig(1);
           sXlGmiiTxLedD2 <= sXlGmiiTxLedD1;
           sXlGmiiTxLedD1 <= xlgmii_txled_sig(1);
           sPhyRxUpSigD2 <= sPhyRxUpSigD1;
           sPhyRxUpSigD1 <= phy_rx_up_sig;                     
       end if;
    end process pCDCLedSynchroniser;        
    
    
    forty_gbe_led_rx <= sXlGmiiRxLedD2; -- xlgmii_rxled(0)(1) is activity, xlgmii_rxled(0)(0) is phy rx up
    forty_gbe_led_tx <= sXlGmiiTxLedD2; -- xlgmii_txled(0)(1) is activity, xlgmii_txled(0)(0) is phy tx up
    forty_gbe_led_up <= sPhyRxUpSigD2;

    IEEE802_3_XL_PHY_0 : component IEEE802_3_XL_PHY_top
        port map(
            SYS_CLK_I            => sys_clk,
            SYS_CLK_RST_I        => sys_rst,
            GTREFCLK_PAD_N_I     => REFCLK_N,
            GTREFCLK_PAD_P_I     => REFCLK_P,
            GTREFCLK_O           => qsfp_gtrefclk_pb,
            TXN_O                => PHY_LANE_TX_N,
            TXP_O                => PHY_LANE_TX_P,
            RXN_I                => PHY_LANE_RX_N,
            RXP_I                => PHY_LANE_RX_P,
            SOFT_RESET_I         => qsfp_soft_reset,
            LINK_UP_O            => phy_rx_up_sig,
            XLGMII_X4_TXC_I      => xlgmii_txc,
            XLGMII_X4_TXD_I      => xlgmii_txd,
            XLGMII_X4_RXC_O      => xlgmii_rxc,
            XLGMII_X4_RXD_O      => xlgmii_rxd,
            TEST_PATTERN_EN_I    => '0',
            TEST_PATTERN_ERROR_O => open
        );

        fgbe_if_present <= '1';
        phy_rx_up    <= phy_rx_up_sig;
        xlgmii_txled <= xlgmii_txled_sig;
        xlgmii_rxled <= xlgmii_rxled_sig;

end arch_forty_gbe;
