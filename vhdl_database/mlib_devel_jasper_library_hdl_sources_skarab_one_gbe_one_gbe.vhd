library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

use work.parameter.all;

entity one_gbe is
    --generic ();
    port(
        user_clk : in std_logic;
        user_rst : in std_logic;
        sys_clk  : in std_logic;
        sys_rst  : in std_logic;

        -- 1GBE SIDEBAND SIGNALS
        ONE_GBE_RESET_N    : out std_logic;
        gbe_if_present     : out std_logic;
        gbe_link_up        : out std_logic;
        gbe_status_vector  : out std_logic_vector(15 downto 0);
        --gbe_int_n         : in  std_logic;
        host_reset         : in  std_logic;
        user_mmcm_locked   : in  std_logic;
        gmii_reset_done_o  : out std_logic;
        gbe_phy_up         : out std_logic;
        --FPGA_RESET_N      : in  std_logic;
        sync_gmii_fpga_rst : in  std_logic;

        -- 1GBE SIGNALS
        ONE_GBE_SGMII_TX_P  : out std_logic;
        ONE_GBE_SGMII_TX_N  : out std_logic;
        ONE_GBE_SGMII_RX_P  : in  std_logic;
        ONE_GBE_SGMII_RX_N  : in  std_logic;
        ONE_GBE_MGTREFCLK_P : in  std_logic;
        ONE_GBE_MGTREFCLK_N : in  std_logic;

        WB_CLK_I : in  std_logic;
        WB_RST_I : in  std_logic;
        WB_DAT_I : in  std_logic_vector(31 downto 0);
        WB_DAT_O : out std_logic_vector(31 downto 0);
        WB_ACK_O : out std_logic;
        WB_ADR_I : in  std_logic_vector(31 downto 0);
        WB_CYC_I : in  std_logic;
        WB_SEL_I : in  std_logic_vector(3 downto 0);
        WB_STB_I : in  std_logic;
        WB_WE_I  : in  std_logic;
        WB_ERR_O : out std_logic;

        gmii_tx_valid        : in  std_logic;
        gmii_tx_end_of_frame : in  std_logic;
        gmii_tx_data         : in  std_logic_vector(63 downto 0);
        gmii_tx_dest_ip      : in  std_logic_vector(31 downto 0);
        gmii_tx_dest_port    : in  std_logic_vector(15 downto 0);
        gmii_tx_overflow     : out std_logic;
        gmii_tx_afull        : out std_logic;

        gmii_rx_valid        : out std_logic;
        gmii_rx_end_of_frame : out std_logic;
        gmii_rx_data         : out std_logic_vector(63 downto 0);
        gmii_rx_source_ip    : out std_logic_vector(31 downto 0);
        gmii_rx_source_port  : out std_logic_vector(15 downto 0);
        gmii_rx_bad_frame    : out std_logic;
        gmii_rx_overrun      : out std_logic;
        gmii_rx_overrun_ack  : in  std_logic;
        gmii_rx_ack          : in  std_logic);
end one_gbe;

architecture arch_one_gbe of one_gbe is 

    attribute ASYNC_REG : string; 
    signal sgmii_link_up : std_logic;
    signal sgmii_link_up_z : std_logic;
    signal sgmii_link_up_z2 : std_logic;
    signal sgmii_link_up_z3 : std_logic;

    signal gmii_clk : std_logic;
    signal gmii_rst : std_logic;

    --Reset Synchroniser and user reset signals
    signal gmii_fpga_rst      : std_logic;
    --signal sync_gmii_fpga_rst : std_logic;
    --attribute ASYNC_REG : string;
    --attribute ASYNC_REG of gmii_fpga_rst: signal is "TRUE";
    --attribute ASYNC_REG of sync_gmii_fpga_rst: signal is "TRUE";

    signal gmii_rst_z : std_logic;
    signal gmii_rst_z2 : std_logic;
    signal gmii_rst_z3 : std_logic;

    -- GT 11/04/2017 ADD TIMEOUT TO SGMII CORE     
    signal sgmii_timeout_count_low : std_logic_vector(15 downto 0);
    signal sgmii_timeout_count_low_over : std_logic;
    signal sgmii_timeout_count_high : std_logic_vector(10 downto 0);
    signal sgmii_timeout : std_logic;
    signal sgmii_reset_count : std_logic_vector(7 downto 0);
    signal sgmii_timeout_reset : std_logic;
    
    signal gmii_xaui_status : std_logic_vector(7 downto 0);
    signal gmii_xgmii_txd : std_logic_vector(63 downto 0);
    signal gmii_xgmii_txc : std_logic_vector(7 downto 0);
    signal gmii_xgmii_rxd : std_logic_vector(63 downto 0);
    signal gmii_xgmii_rxc : std_logic_vector(7 downto 0);
    signal gmii_src_ip_address : std_logic_vector(31 downto 0);
    signal gmii_src_mac_address : std_logic_vector(47 downto 0);
    signal gmii_src_enable : std_logic;
    signal gmii_src_port : std_logic_vector(15 downto 0);
    signal gmii_src_gateway : std_logic_vector(7 downto 0);
    signal gmii_src_local_mc_recv_ip : std_logic_vector(31 downto 0);
    signal gmii_src_local_mc_recv_ip_mask : std_logic_vector(31 downto 0);
    signal gmii_xaui_almost_full : std_logic;
    signal gmii_xaui_full : std_logic;

    signal gmii_clk_en : std_logic;
    signal gmii_txd : std_logic_vector(7 downto 0);
    signal gmii_tx_en : std_logic;
    signal gmii_tx_en_z : std_logic;
    signal gmii_tx_er : std_logic;
    signal gmii_rxd : std_logic_vector(7 downto 0);
    signal gmii_rx_dv : std_logic;
    signal gmii_rx_er : std_logic;
    signal gmii_to_sgmii_reset : std_logic;

    signal gmii_to_sgmii_refclk_p : std_logic;
    signal gmii_to_sgmii_refclk_n : std_logic;
    signal gmii_to_sgmii_txp : std_logic;
    signal gmii_to_sgmii_txn : std_logic;
    signal gmii_to_sgmii_rxp : std_logic;
    signal gmii_to_sgmii_rxn : std_logic;

    signal gmii_rx_valid_flash_sdram_controller : std_logic;
    signal gmii_rx_end_of_frame_flash_sdram_controller : std_logic;
    signal gmii_rx_overrun_ack_flash_sdram_controller : std_logic;
    signal gmii_rx_ack_flash_sdram_controller : std_logic;

    signal gmii_reset_done : std_logic;

    -- GT 04/06/2015 ADD SUPPORT FOR 10/100Mbps
    signal gmii_speed_is_10_100 : std_logic;
    signal gmii_speed_is_100    : std_logic;

    signal host_reset_z : std_logic;
    signal host_reset_z2 : std_logic;
    signal host_reset_z3 : std_logic;

    signal src_packets_sent : std_logic_vector(15 downto 0);
    signal xaui_packets_sent : std_logic_vector(15 downto 0);
    signal gmii_packets_sent : std_logic_vector(15 downto 0);

    signal configuration_vector : std_logic_vector(4 downto 0);
    signal an_interrupt : std_logic;
    signal an_adv_config_vector : std_logic_vector(15 downto 0);
    signal an_restart_config : std_logic;
    signal status_vector : std_logic_vector(15 downto 0);
    signal sGbeStatusVectorD2 : std_logic;
    signal sGbeStatusVectorD1 : std_logic;
    attribute ASYNC_REG of sGbeStatusVectorD2: signal is "TRUE";
    attribute ASYNC_REG of sGbeStatusVectorD1: signal is "TRUE"; 
    signal sgmii_link_up_retimed : std_logic;
    signal gmii_reset_done_retimed : std_logic;
    signal sGbeGmiiResetDoneD2 : std_logic;
    signal sGbeGmiiResetDoneD1 : std_logic; 
    attribute ASYNC_REG of sGbeGmiiResetDoneD2: signal is "TRUE";
    attribute ASYNC_REG of sGbeGmiiResetDoneD1: signal is "TRUE";     
    signal gmii_reset_done_z : std_logic;

    component kat_ten_gb_eth
    generic (
        FABRIC_MAC     : std_logic_vector(47 downto 0);
        FABRIC_IP      : std_logic_vector(31 downto 0);
        FABRIC_PORT    : std_logic_vector(15 downto 0);
        FABRIC_NETMASK : std_logic_vector(31 downto 0);
        FABRIC_GATEWAY : std_logic_vector(7 downto 0);
        FABRIC_ENABLE  : std_logic;
        FABRIC_MC_RECV_IP      : std_logic_vector(31 downto 0);
        FABRIC_MC_RECV_IP_MASK : std_logic_vector(31 downto 0);
        PREEMPHASIS       : std_logic_vector(3 downto 0);
        POSTEMPHASIS      : std_logic_vector(4 downto 0);
        DIFFCTRL          : std_logic_vector(3 downto 0);
        RXEQMIX           : std_logic_vector(2 downto 0);
        CPU_TX_ENABLE     : integer;
        CPU_RX_ENABLE     : integer;
        RX_DIST_RAM       : integer;
        LARGE_PACKETS     : integer;
        TTL               : integer;
        PROMISC_MODE      : integer);
    port (
        clk : in std_logic;
        rst : in std_logic;
        tx_valid            : in std_logic;
        tx_end_of_frame     : in std_logic;
        tx_data             : in std_logic_vector(63 downto 0);
        tx_dest_ip          : in std_logic_vector(31 downto 0);
        tx_dest_port        : in std_logic_vector(15 downto 0);
        tx_overflow         : out std_logic;
        tx_afull            : out std_logic;
        rx_valid            : out std_logic;
        rx_end_of_frame     : out std_logic;
        rx_data             : out std_logic_vector(63 downto 0);
        rx_source_ip        : out std_logic_vector(31 downto 0);
        rx_source_port      : out std_logic_vector(15 downto 0);
        rx_bad_frame        : out std_logic;
        rx_overrun          : out std_logic;
        rx_overrun_ack      : in std_logic;
        rx_ack : in std_logic;
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector(31 downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic;
        led_up : out std_logic;
        led_rx : out std_logic;
        led_tx : out std_logic;
        xaui_clk        : in std_logic;
        xaui_reset      : in std_logic;
        xaui_status     : in std_logic_vector(7 downto 0);
        xgmii_txd       : out std_logic_vector(63 downto 0);
        xgmii_txc       : out std_logic_vector(7 downto 0);
        xgmii_rxd       : in std_logic_vector(63 downto 0);
        xgmii_rxc       : in std_logic_vector(7 downto 0);
        mgt_rxeqmix         : out std_logic_vector(2 downto 0);
        mgt_txpreemphasis   : out std_logic_vector(3 downto 0);
        mgt_txpostemphasis  : out std_logic_vector(4 downto 0);
        mgt_txdiffctrl      : out std_logic_vector(3 downto 0);
        src_ip_address      : out std_logic_vector(31 downto 0);
        src_mac_address     : out std_logic_vector(47 downto 0);
        src_enable          : out std_logic;
        src_port            : out std_logic_vector(15 downto 0);
        src_gateway         : out std_logic_vector(7 downto 0);
        src_local_mc_recv_ip        : out std_logic_vector(31 downto 0);
        src_local_mc_recv_ip_mask   : out std_logic_vector(31 downto 0));
    end component;

    component xaui_to_gmii_translator
    port(
        xaui_clk            : in std_logic;
        xaui_rst            : in std_logic;
        xgmii_txd           : in std_logic_vector(63 downto 0);
        xgmii_txc           : in std_logic_vector(7 downto 0);
        xaui_almost_full    : out std_logic;
        xaui_full           : out std_logic;
        gmii_clk             : in std_logic;
        gmii_clk_en          : in std_logic;  -- GT 04/06/2015 ADD SUPPORT FOR 10/100MBPS OPERATION
        gmii_rst             : in std_logic;
        gmii_txd             : out std_logic_vector(7 downto 0);
        gmii_tx_en           : out std_logic;
        gmii_tx_er           : out std_logic;
        gmii_link_up         : in std_logic);
    end component;

    component gmii_to_xaui_translator
    port(
        gmii_clk        : in std_logic;
        gmii_clk_en     : in std_logic;  -- GT 04/06/2015 ADD SUPPORT FOR 10/100MBPS OPERATION
        gmii_rst        : in std_logic;
        gmii_rxd        : in std_logic_vector(7 downto 0);
        gmii_rx_dv      : in std_logic;
        gmii_rx_er      : in std_logic;
        xaui_clk        : in std_logic;
        xaui_rst        : in std_logic;
        xgmii_rxd       : out std_logic_vector(63 downto 0);
        xgmii_rxc       : out std_logic_vector(7 downto 0));
    end component;

    component gmii_to_sgmii
    port (
        gtrefclk_p           : in  std_logic;
        gtrefclk_n           : in  std_logic;
        gtrefclk_out         : out std_logic;
        txp                  : out std_logic;
        txn                  : out std_logic;
        rxp                  : in std_logic;
        rxn                  : in std_logic;
        resetdone                   : out std_logic;
        userclk_out                 : out std_logic;
        userclk2_out                : out std_logic;
        rxuserclk_out               : out std_logic;
        rxuserclk2_out              : out std_logic;
        pma_reset_out               : out std_logic;
        mmcm_locked_out             : out std_logic;
        independent_clock_bufg      : in std_logic;
        sgmii_clk_r                 : out std_logic;
        sgmii_clk_f                 : out std_logic;
        sgmii_clk_en         : out std_logic;
        gmii_txd             : in std_logic_vector(7 downto 0);
        gmii_tx_en           : in std_logic;
        gmii_tx_er           : in std_logic;
        gmii_rxd             : out std_logic_vector(7 downto 0);
        gmii_rx_dv           : out std_logic;
        gmii_rx_er           : out std_logic;
        gmii_isolate         : out std_logic;
        configuration_vector : in std_logic_vector(4 downto 0);
        an_interrupt         : out std_logic;
        an_adv_config_vector : in std_logic_vector(15 downto 0);
        an_restart_config    : in std_logic;
        speed_is_10_100      : in std_logic;
        speed_is_100         : in std_logic;
        status_vector        : out std_logic_vector(15 downto 0);
        reset                : in std_logic;
        signal_detect        : in std_logic;
        gt0_qplloutclk_out     : out std_logic;
        gt0_qplloutrefclk_out  : out std_logic);
    end component;

begin

    -- WISHBONE SLAVE 9 - 1GBE MAC
    kat_ten_gb_eth_0 : kat_ten_gb_eth
    generic map(
        FABRIC_MAC     => X"FFFFFFFFFFFF",
        FABRIC_IP      => X"FFFFFFFF",
        FABRIC_PORT    => X"FFFF",
        FABRIC_NETMASK => X"FFFFFF00",
        FABRIC_GATEWAY => X"FF",
        FABRIC_ENABLE  => '0',
        FABRIC_MC_RECV_IP      => X"FFFFFFFF",
        FABRIC_MC_RECV_IP_MASK => X"FFFFFFFF",
        PREEMPHASIS       => "0100",
        POSTEMPHASIS      => "00000",
        DIFFCTRL          => "1010",
        RXEQMIX           => "111",
        CPU_TX_ENABLE     => 1,
        CPU_RX_ENABLE     => 1,
        RX_DIST_RAM       => 0,
        LARGE_PACKETS     => 1,
        TTL               => 1,
        PROMISC_MODE      => 0)
    port map(
        clk => user_clk,
        rst => user_rst,
        tx_valid            => gmii_tx_valid,
        tx_end_of_frame     => gmii_tx_end_of_frame,
        tx_data             => gmii_tx_data,
        tx_dest_ip          => gmii_tx_dest_ip,
        tx_dest_port        => gmii_tx_dest_port,
        tx_overflow         => gmii_tx_overflow,
        tx_afull            => gmii_tx_afull,
        rx_valid            => gmii_rx_valid,
        rx_end_of_frame     => gmii_rx_end_of_frame,
        rx_data             => gmii_rx_data,
        rx_source_ip        => gmii_rx_source_ip,
        rx_source_port      => gmii_rx_source_port,
        rx_bad_frame        => gmii_rx_bad_frame,
        rx_overrun          => gmii_rx_overrun,
        rx_overrun_ack      => gmii_rx_overrun_ack,
        rx_ack              => gmii_rx_ack,

        CLK_I => WB_CLK_I,
        RST_I => WB_RST_I,
        DAT_I => WB_DAT_I,
        DAT_O => WB_DAT_O,
        ACK_O => WB_ACK_O,
        ADR_I => WB_ADR_I,
        CYC_I => WB_CYC_I,
        SEL_I => WB_SEL_I,
        STB_I => WB_STB_I,
        WE_I  => WB_WE_I,
        --led_up => led_up,
        --led_rx => led_rx,
        --led_tx => led_tx,
        xaui_clk        => sys_clk,
        xaui_reset      => sys_rst,
        xaui_status     => gmii_xaui_status,
        xgmii_txd       => gmii_xgmii_txd,
        xgmii_txc       => gmii_xgmii_txc,
        xgmii_rxd       => gmii_xgmii_rxd,
        xgmii_rxc       => gmii_xgmii_rxc,
        mgt_rxeqmix         => open,
        mgt_txpreemphasis   => open,
        mgt_txpostemphasis  => open,
        mgt_txdiffctrl      => open,

        src_ip_address      => gmii_src_ip_address,
        src_mac_address     => gmii_src_mac_address,
        src_enable          => gmii_src_enable,
        src_port            => gmii_src_port,
        src_gateway         => gmii_src_gateway,
        src_local_mc_recv_ip        => gmii_src_local_mc_recv_ip,
        src_local_mc_recv_ip_mask   => gmii_src_local_mc_recv_ip_mask);

    --host reset synchronised to the gmii_clk
    gen_host_reset_z : process(gmii_clk)
    begin
        if (rising_edge(gmii_clk))then
            host_reset_z <= host_reset;
            host_reset_z2 <= host_reset_z;
            host_reset_z3 <= host_reset_z2;
        end if;
    end process;

    gen_xaui_packets_sent : process(sys_rst, sys_clk)
    begin
        if (sys_rst = '1')then
            xaui_packets_sent <= (others => '0');
        elsif (rising_edge(sys_clk))then
            if ((gmii_xgmii_txc = X"01")and(gmii_xgmii_txd(7 downto 0) = X"FB"))then
                xaui_packets_sent <= xaui_packets_sent + X"0001";
            end if;
        end if;
    end process;
    
    pCDCXauiStatusSynchroniser : process(sys_clk)
    begin
        if (rising_edge(sys_clk))then
           sGbeStatusVectorD2 <= sGbeStatusVectorD1;
           sGbeStatusVectorD1 <= status_vector(0);                       
       end if;
    end process pCDCXauiStatusSynchroniser;

    gen_gmii_xaui_status : process(sys_rst, sys_clk)
    begin
        if (sys_rst = '1')then
            gmii_xaui_status <= (others => '0');
        elsif (rising_edge(sys_clk))then
            if (sGbeStatusVectorD2 = '1')then
                gmii_xaui_status <= "11111100";
            else
                gmii_xaui_status <= (others => '0');
            end if;
        end if;
    end process;

    xaui_to_gmii_translator_0 : xaui_to_gmii_translator
    port map(
        xaui_clk            => sys_clk,
        xaui_rst            => sys_rst,
        xgmii_txd           => gmii_xgmii_txd,
        xgmii_txc           => gmii_xgmii_txc,
        xaui_almost_full    => gmii_xaui_almost_full,
        xaui_full           => gmii_xaui_full,
        gmii_clk            => gmii_clk,
        gmii_clk_en         => gmii_clk_en,  -- GT 04/06/2015 ADD SUPPORT FOR 10/100MBPS OPERATION
        gmii_rst            => gmii_rst,
        gmii_txd            => gmii_txd,
        gmii_tx_en          => gmii_tx_en,
        gmii_tx_er          => gmii_tx_er,
        gmii_link_up        => status_vector(0));

    gen_gmii_tx_en_z : process(gmii_clk)
    begin
        if (rising_edge(gmii_clk))then
            gmii_tx_en_z <= gmii_tx_en;
        end if;
    end process;

    gen_gmii_packets_sent : process(gmii_rst, gmii_clk)
    begin
        if (gmii_rst = '1')then
            gmii_packets_sent <= (others => '0');
        elsif (rising_edge(gmii_clk))then
            if ((gmii_tx_en_z = '0')and(gmii_tx_en = '1'))then
                gmii_packets_sent <= gmii_packets_sent + X"0001";
            end if;
        end if;
    end process;

    gmii_to_xaui_translator_0 : gmii_to_xaui_translator
    port map(
        gmii_clk        => gmii_clk,
        gmii_clk_en     => gmii_clk_en,  -- GT 04/06/2015 ADD SUPPORT FOR 10/100MBPS OPERATION
        gmii_rst        => gmii_rst,
        gmii_rxd        => gmii_rxd,
        gmii_rx_dv      => gmii_rx_dv,
        gmii_rx_er      => gmii_rx_er,
        xaui_clk        => sys_clk,
        xaui_rst        => sys_rst,
        xgmii_rxd       => gmii_xgmii_rxd,
        xgmii_rxc       => gmii_xgmii_rxc);


    gen_gmii_rst : process(gmii_fpga_rst, gmii_clk)
    begin
        if (gmii_fpga_rst = '1')then
            gmii_rst <= '1';
            gmii_rst_z <= '1';
            gmii_rst_z2 <= '1';
            gmii_rst_z3 <= '1';
        elsif (rising_edge(gmii_clk))then
            -- GT 29/03/2017 KEEP gmii_rst ASSERTED WHEN SGMII LINK IS DOWN
            --if ((gmii_reset_done_z3 = '1')and(host_reset_z3 = '0'))then
            if ((sgmii_link_up_z3 = '1')and(host_reset_z3 = '0'))then
                gmii_rst_z <= '0';
                gmii_rst_z2 <= gmii_rst_z;
                gmii_rst_z3 <= gmii_rst_z2;
                gmii_rst <= gmii_rst_z3;
            else
                gmii_rst <= '1';
                gmii_rst_z <= '1';
                gmii_rst_z2 <= '1';
                gmii_rst_z3 <= '1';
            end if;
        end if;
    end process;

   -- GT 11/04/2017 ADDED A TIMEOUT TO SGMII CORE IF LINK DOESN'T COME UP
    gen_sgmii_timeout_count_low : process(sys_rst, sys_clk)
    begin
        if (sys_rst = '1')then
            sgmii_timeout_count_low <= (others => '0');
            sgmii_timeout_count_low_over <= '0';
        elsif (rising_edge(sys_clk))then
            sgmii_timeout_count_low_over <= '0';

            if ((gmii_reset_done_retimed = '1')and(sgmii_link_up_retimed = '1'))then
                sgmii_timeout_count_low <= (others => '0');
            else
                if (sgmii_timeout_count_low = X"FFFF")then           
                    sgmii_timeout_count_low_over <= '1';
                    sgmii_timeout_count_low <= (others => '0');
                else
                    sgmii_timeout_count_low <= sgmii_timeout_count_low + X"0001";
                end if;
            end if;    
        end if;
    end process;

    gen_sgmii_timeout_count_high : process(sys_rst, sys_clk)
    begin
        if (sys_rst = '1')then
            sgmii_timeout_count_high <= (others => '0');
            sgmii_timeout <= '0';
        elsif (rising_edge(sys_clk))then
            sgmii_timeout <= '0';

            if ((gmii_reset_done_retimed = '1')and(sgmii_link_up_retimed = '1'))then
                sgmii_timeout_count_high <= (others => '0');
            else
                if (sgmii_timeout_count_low_over = '1')then
                    if (sgmii_timeout_count_high = "11111111111")then           
                        sgmii_timeout <= '1';
                        sgmii_timeout_count_high <= (others => '0');
                    else
                        sgmii_timeout_count_high <= sgmii_timeout_count_high + "00000000001";
                    end if;
                end if;
            end if;    
        end if;
    end process;

    gen_sgmii_reset_count : process(sys_rst, sys_clk)
    begin
        if (sys_rst = '1')then
            sgmii_reset_count <= X"FF";
        elsif (rising_edge(sys_clk))then
            if (sgmii_timeout = '1')then   
                sgmii_reset_count <= (others => '0');
            else
                if (sgmii_reset_count /= X"FF")then
                    sgmii_reset_count <= sgmii_reset_count + X"01";
                end if;
            end if;
        end if;
    end process;

    sgmii_timeout_reset <= '0' when (sgmii_reset_count = X"FF") else '1';

    gmii_to_sgmii_reset <= sys_rst or sgmii_timeout_reset;

    gmii_to_sgmii_0 : gmii_to_sgmii
    port map(
        gtrefclk_p           => gmii_to_sgmii_refclk_p,
        gtrefclk_n           => gmii_to_sgmii_refclk_n,
        gtrefclk_out         => open,
        txp                  => gmii_to_sgmii_txp,
        txn                  => gmii_to_sgmii_txn,
        rxp                  => gmii_to_sgmii_rxp,
        rxn                  => gmii_to_sgmii_rxn,
        resetdone                   => gmii_reset_done,
        userclk_out                 => open,
        userclk2_out                => gmii_clk,
        rxuserclk_out               => open,
        rxuserclk2_out              => open,
        pma_reset_out               => open,
        mmcm_locked_out             => open,
        independent_clock_bufg      => sys_clk,
        sgmii_clk_r                 => open,
        sgmii_clk_f                 => open,
        sgmii_clk_en         => gmii_clk_en,
        gmii_txd             => gmii_txd,
        gmii_tx_en           => gmii_tx_en,
        gmii_tx_er           => gmii_tx_er,
        gmii_rxd             => gmii_rxd,
        gmii_rx_dv           => gmii_rx_dv,
        gmii_rx_er           => gmii_rx_er,
        gmii_isolate         => open,
        configuration_vector => configuration_vector,
        an_interrupt         => an_interrupt,
        an_adv_config_vector => an_adv_config_vector,
        an_restart_config    => an_restart_config,
        speed_is_10_100      => gmii_speed_is_10_100, --'0',
        speed_is_100         => gmii_speed_is_100, --'0',
        status_vector        => status_vector,
        reset                => gmii_to_sgmii_reset,
        signal_detect        => '1',
        gt0_qplloutclk_out     => open,
        gt0_qplloutrefclk_out  => open);

    -- GT 04/06/2015 SPEED SELECTION CONTROL
    gen_gmii_speed : process(gmii_fpga_rst, gmii_clk)
    begin
        if (gmii_fpga_rst = '1')then
            gmii_speed_is_10_100 <= '0';
            gmii_speed_is_100 <= '0';
        elsif (rising_edge(gmii_clk))then
            if (status_vector(0) = '1')then
                if (status_vector(11 downto 10) = "10")then
                    -- 1GBE
                    gmii_speed_is_10_100 <= '0';
                    gmii_speed_is_100 <= '0';
                elsif (status_vector(11 downto 10) = "01")then
                    -- 100MBPS
                    gmii_speed_is_10_100 <= '1';
                    gmii_speed_is_100 <= '1';
                else
                    -- 10MBPS
                    gmii_speed_is_10_100 <= '1';
                    gmii_speed_is_100 <= '0';
                end if;
            end if;
        end if;
    end process;

    --SGMII TO GMII
    --ONE_GBE_RESET_N <= not sys_rst;
    --the same reset as bsp_fpga_rst
    ONE_GBE_RESET_N <= not WB_RST_I;
    
    -- GT 11/04/2017 UPDATED SGMII CORE RESET TO ADD A TIMEOUT gmii_to_sgmii_reset <= fpga_reset;
    
    gmii_to_sgmii_refclk_p <= ONE_GBE_MGTREFCLK_P;
    gmii_to_sgmii_refclk_n <= ONE_GBE_MGTREFCLK_N;
    
    ONE_GBE_SGMII_TX_P <= gmii_to_sgmii_txp;
    ONE_GBE_SGMII_TX_N <= gmii_to_sgmii_txn;
    gmii_to_sgmii_rxp <= ONE_GBE_SGMII_RX_P;
    gmii_to_sgmii_rxn <= ONE_GBE_SGMII_RX_N;

    --TODO: We might not need this. process
    -- GT 29/03/2017 CHANGE gmii_rst TO STAY IN RESET WHILE SGMII LINK IS DOWN
    --gen_gmii_reset_done_z : process (gmii_clk)
    --begin
    --    if (rising_edge(gmii_clk))then
    --        gmii_reset_done_z <= gmii_reset_done;
    --        gmii_reset_done_z2 <= gmii_reset_done_z;
    --        gmii_reset_done_z3 <= gmii_reset_done_z2;
    --    end if;
    --end process; 
    
    gen_gmii_reset_done_z : process (gmii_clk)
    begin
        if (rising_edge(gmii_clk))then
            gmii_reset_done_z <= gmii_reset_done;
        end if;
    end process;     
    
    sgmii_link_up <= status_vector(0);
    sgmii_link_up_retimed <= sGbeStatusVectorD2;
    
    
    pCDCGmiiResetDoneSynchroniser : process(sys_clk)
    begin
        if (rising_edge(sys_clk))then
           sGbeGmiiResetDoneD2 <= sGbeGmiiResetDoneD1;
           sGbeGmiiResetDoneD1 <= gmii_reset_done_z;                       
       end if;
    end process pCDCGmiiResetDoneSynchroniser;    
    
    
    
    gmii_reset_done_retimed <= sGbeGmiiResetDoneD2;
    
    
    
    gen_sgmii_link_up_z : process (gmii_clk)
    begin
        if (rising_edge(gmii_clk))then
            sgmii_link_up_z <= sgmii_link_up;
            sgmii_link_up_z2 <= sgmii_link_up_z;
            sgmii_link_up_z3 <= sgmii_link_up_z2;
        end if;
    end process;

    --pFpgaResetGmiiSynchroniser : process(user_mmcm_locked, gmii_clk, FPGA_RESET_N)
    --begin
    --    if (user_mmcm_locked = '0' or FPGA_RESET_N = '0')then
    --        sync_gmii_fpga_rst <= '1';
    --        gmii_fpga_rst <= '1';
    --    elsif (rising_edge(gmii_clk))then
    --        sync_gmii_fpga_rst <= '0';
    --        gmii_fpga_rst <= sync_gmii_fpga_rst;
    --    end if;
    --end process;

    configuration_vector(0) <= '0'; -- BIDIRECTIONAL
    configuration_vector(1) <= '0'; -- NO LOOPBACK
    configuration_vector(2) <= '0'; -- NO LOW POWER MODE
    configuration_vector(3) <= '0'; -- NORMAL OPERATION OF GMII
    configuration_vector(4) <= '1'; -- AN ENABLED

    an_adv_config_vector(0) <= '1'; -- SGMII
    an_adv_config_vector(4 downto 1) <= (others => '0');
    an_adv_config_vector(5) <= '0';
    an_adv_config_vector(6) <= '0';
    an_adv_config_vector(8 downto 7) <= (others => '0');
    an_adv_config_vector(9) <= '0';
    an_adv_config_vector(11 downto 10) <= "10"; -- 1GB/S
    an_adv_config_vector(12) <= '1'; -- FULL DUPLEX
    an_adv_config_vector(13) <= '0';
    an_adv_config_vector(14) <= '1'; -- ACKNOWLEDGE
    an_adv_config_vector(15) <= '1'; -- LINK UP

    an_restart_config <= '0';
    gbe_if_present <= '1';
    gbe_phy_up <= sgmii_link_up_z3;
    gmii_reset_done_o <= gmii_reset_done;
    gbe_link_up <= sgmii_link_up_z3;
    gbe_status_vector <= status_vector;
    WB_ERR_O <= '0';
    gmii_fpga_rst <= sync_gmii_fpga_rst;

end arch_one_gbe;