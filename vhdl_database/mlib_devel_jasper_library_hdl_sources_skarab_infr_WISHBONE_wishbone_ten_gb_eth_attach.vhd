----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: wishbone_ten_gb_eth_attach - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity wishbone_ten_gb_eth_attach is
    generic (
        FABRIC_MAC      : std_logic_vector(47 downto 0);
        FABRIC_IP       : std_logic_vector(31 downto 0);
        FABRIC_PORT     : std_logic_vector(15 downto 0);
        FABRIC_NETMASK  : std_logic_vector(31 downto 0);
        FABRIC_GATEWAY  : std_logic_vector( 7 downto 0);
        FABRIC_ENABLE   : std_logic;
        MC_RECV_IP      : std_logic_vector(31 downto 0);
        MC_RECV_IP_MASK : std_logic_vector(31 downto 0);
        PREEMPHASIS         : std_logic_vector(3 downto 0);
        POSTEMPHASIS        : std_logic_vector(4 downto 0);
        DIFFCTRL            : std_logic_vector(3 downto 0);
        RXEQMIX             : std_logic_vector(2 downto 0));
    port (
        -- WISHBONE CLASSIC SIGNALS
        CLK_I : in  std_logic;
        RST_I : in  std_logic;
        DAT_I : in  std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in  std_logic_vector(31 downto 0);
        CYC_I : in  std_logic;
        SEL_I : in  std_logic_vector( 3 downto 0);
        STB_I : in  std_logic;
        WE_I  : in  std_logic;

        -- CPU TX BUFFER
        cpu_tx_buffer_addr    : out std_logic_vector(10 downto 0);
        cpu_tx_buffer_rd_data : in  std_logic_vector(63 downto 0);
        cpu_tx_buffer_wr_data : out std_logic_vector(63 downto 0);
        cpu_tx_buffer_wr_en   : out std_logic;
        cpu_tx_size           : out std_logic_vector(10 downto 0);
        cpu_tx_ready          : out std_logic;
        cpu_tx_done           : in  std_logic;

        -- CPU RX BUFFER
        cpu_rx_buffer_addr    : out std_logic_vector(10 downto 0);
        cpu_rx_buffer_rd_data : in  std_logic_vector(63 downto 0);
        cpu_rx_size           : in  std_logic_vector(10 downto 0);
        cpu_rx_ack            : out std_logic;

        -- ARP CACHE
        arp_cache_addr    : out std_logic_vector(10 downto 0);
        arp_cache_rd_data : in  std_logic_vector(47 downto 0);
        arp_cache_wr_data : out std_logic_vector(47 downto 0);
        arp_cache_wr_en   : out std_logic;

        -- LOCAL REGISTERS
        local_enable          : out std_logic;
        local_mac             : out std_logic_vector(47 downto 0);
        local_ip              : out std_logic_vector(31 downto 0);
        local_port            : out std_logic_vector(15 downto 0);
        local_netmask         : out std_logic_vector(31 downto 0);
        local_gateway         : out std_logic_vector( 7 downto 0);
        local_mc_recv_ip      : out std_logic_vector(31 downto 0);
        local_mc_recv_ip_mask : out std_logic_vector(31 downto 0);
        soft_reset            : out std_logic;
        soft_reset_ack        : in  std_logic;

        -- XAUI STATUS
        xaui_status : in std_logic_vector(7 downto 0);

        -- PMA CONFIG
        --mgt_status       : in std_logic_vector(15 downto 0);
        mgt_rxeqmix        : out std_logic_vector(2 downto 0);
        mgt_txpreemphasis  : out std_logic_vector(3 downto 0);
        mgt_txpostemphasis : out std_logic_vector(4 downto 0);
        mgt_txdiffctrl     : out std_logic_vector(3 downto 0));
end wishbone_ten_gb_eth_attach;

architecture arch_wishbone_ten_gb_eth_attach of wishbone_ten_gb_eth_attach is

    constant REGISTERS_OFFSET : std_logic_vector(16 downto 0) := B"0" & X"0000";
    constant REGISTERS_HIGH   : std_logic_vector(16 downto 0) := B"0" & X"0FFF";
    constant ARP_CACHE_OFFSET : std_logic_vector(16 downto 0) := B"0" & X"1000";
    constant ARP_CACHE_HIGH   : std_logic_vector(16 downto 0) := B"0" & X"3FFF";
    constant TX_BUFFER_OFFSET : std_logic_vector(16 downto 0) := B"0" & X"4000";
    constant TX_BUFFER_HIGH   : std_logic_vector(16 downto 0) := B"0" & X"7FFF";
    constant RX_BUFFER_OFFSET : std_logic_vector(16 downto 0) := B"0" & X"8000";
    constant RX_BUFFER_HIGH   : std_logic_vector(16 downto 0) := B"0" & X"BFFF";

    constant REG_CORE_TYPE       : std_logic_vector(7 downto 0) := X"00";
    constant REG_MAX_BUF_SIZE    : std_logic_vector(7 downto 0) := X"01";
    constant REG_WORD_LENS       : std_logic_vector(7 downto 0) := X"02";
    constant REG_LOCAL_MAC_1     : std_logic_vector(7 downto 0) := X"03";
    constant REG_LOCAL_MAC_0     : std_logic_vector(7 downto 0) := X"04";
    constant REG_LOCAL_IPADDR    : std_logic_vector(7 downto 0) := X"05";
    constant REG_LOCAL_GATEWAY   : std_logic_vector(7 downto 0) := X"06";
    constant REG_LOCAL_NETMASK   : std_logic_vector(7 downto 0) := X"07";
    constant REG_MC_RECV_IP      : std_logic_vector(7 downto 0) := X"08";
    constant REG_MC_RECV_IP_MASK : std_logic_vector(7 downto 0) := X"09";
    constant REG_BUFFER_SIZES    : std_logic_vector(7 downto 0) := X"0A";
    constant REG_PROMISC_RST_EN  : std_logic_vector(7 downto 0) := X"0B";
    constant REG_VALID_PORTS     : std_logic_vector(7 downto 0) := X"0C";
    constant REG_XAUI_STATUS     : std_logic_vector(7 downto 0) := X"11";
    constant REG_PHY_CONFIG      : std_logic_vector(7 downto 0) := X"12";
    constant REG_XAUI_CONFIG     : std_logic_vector(7 downto 0) := X"13";
    
    attribute ASYNC_REG : string;
    signal STB_I_z  : std_logic;
    signal STB_I_z2 : std_logic;

    signal wishbone_sel : std_logic;
    signal reg_sel      : std_logic;
    signal rxbuf_sel    : std_logic;
    signal txbuf_sel    : std_logic;
    signal arp_sel      : std_logic;
    signal reg_data_src : std_logic_vector(7 downto 0);

    signal reg_addr   : std_logic_vector(16 downto 0);
    signal rxbuf_addr : std_logic_vector(16 downto 0);
    signal txbuf_addr : std_logic_vector(16 downto 0);
    signal arp_addr   : std_logic_vector(16 downto 0);

    signal local_mac_reg             : std_logic_vector(47 downto 0);
    signal local_ip_reg              : std_logic_vector(31 downto 0);
    signal local_gateway_reg         : std_logic_vector( 7 downto 0);
    signal local_netmask_reg         : std_logic_vector(31 downto 0);
    signal local_port_reg            : std_logic_vector(15 downto 0);
    signal local_enable_reg          : std_logic;
    signal local_mc_recv_ip_reg      : std_logic_vector(31 downto 0);
    signal local_mc_recv_ip_mask_reg : std_logic_vector(31 downto 0);
    signal soft_reset_reg            : std_logic;
    signal mgt_rxeqmix_reg : std_logic_vector(2 downto 0);
    signal mgt_txpreemphasis_reg : std_logic_vector(3 downto 0);
    signal mgt_txpostemphasis_reg : std_logic_vector(4 downto 0);
    signal mgt_txdiffctrl_reg : std_logic_vector(3 downto 0);

    signal xaui_rst_local_fault_reg : std_logic;
    signal xaui_rst_rx_link_status_reg : std_logic;
    signal xaui_test_select_reg : std_logic_vector(1 downto 0);

    signal cpu_tx_size_reg  : std_logic_vector(10 downto 0);
    signal cpu_tx_ready_reg : std_logic;
    signal cpu_rx_ack_reg   : std_logic;

    signal arp_cache_we : std_logic;
    signal tx_buffer_we : std_logic;
    signal write_data   : std_logic_vector(63 downto 0);

    signal cpu_rx_size_int : std_logic_vector(10 downto 0);

    signal arp_data_int : std_logic_vector(31 downto 0);
    signal tx_data_int  : std_logic_vector(31 downto 0);
    signal rx_data_int  : std_logic_vector(31 downto 0);
    signal reg_data_int : std_logic_vector(31 downto 0);
    --AI: signal to store data for wishbone read 
    signal reg_dat_o_int : std_logic_vector(31 downto 0);
    --AI: signal for wishbone ack
    signal reg_ack : std_logic;

    signal reg_sel_z1 : std_logic;
    
    --XAUI Status Signals
    signal sXauiStatusDvalidRR : std_logic;
    signal sXauiStatusDvalidR : std_logic; 
    attribute ASYNC_REG of sXauiStatusDvalidRR: signal is "TRUE";
    attribute ASYNC_REG of sXauiStatusDvalidR: signal is "TRUE";
    signal sXauiStatus : std_logic_vector(7 downto 0);   

begin

    local_mac             <= local_mac_reg;
    local_ip              <= local_ip_reg;
    local_gateway         <= local_gateway_reg;
    local_netmask         <= local_netmask_reg;
    local_port            <= local_port_reg;
    local_enable          <= local_enable_reg;
    soft_reset            <= soft_reset_reg;
    local_mc_recv_ip      <= local_mc_recv_ip_reg;
    local_mc_recv_ip_mask <= local_mc_recv_ip_mask_reg;
    mgt_rxeqmix <= mgt_rxeqmix_reg;
    mgt_txpreemphasis <= mgt_txpreemphasis_reg;
    mgt_txpostemphasis <= mgt_txpostemphasis_reg;
    mgt_txdiffctrl <= mgt_txdiffctrl_reg;

    cpu_tx_size  <= cpu_tx_size_reg;
    cpu_tx_ready <= cpu_tx_ready_reg;
    cpu_rx_ack   <= cpu_rx_ack_reg;

    arp_cache_wr_data <= write_data(47 downto 0);
    arp_cache_wr_en   <= arp_cache_we;

    cpu_tx_buffer_wr_data <= write_data;
    cpu_tx_buffer_wr_en   <= tx_buffer_we;
    cpu_rx_buffer_addr    <= rxbuf_addr(13 downto 3);

--------------------------------------------------------------------------------
-- WISHBONE ACK GENERATION
--------------------------------------------------------------------------------

    gen_STB_I_z : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            STB_I_z  <= '0';
            STB_I_z2 <= '0';
        elsif (rising_edge(CLK_I))then
            STB_I_z  <= STB_I;
            STB_I_z2 <= STB_I_z;
        end if;
    end process;

    gen_ACK_O : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            reg_ack <= '0';
        elsif (rising_edge(CLK_I))then
            if ((STB_I_z = '1')and(STB_I_z2 = '0'))then
                reg_ack <= '1';
            else
                reg_ack <= '0';
            end if;
        end if;
    end process;

--------------------------------------------------------------------------------
-- DECODE ADDRESSES INTO DIFFERENT REGIONS
--------------------------------------------------------------------------------

    wishbone_sel <= (CYC_I and STB_I) or STB_I_z or STB_I_z2;

    reg_sel   <= wishbone_sel when ((ADR_I(16 downto 0) >= REGISTERS_OFFSET) and (ADR_I(16 downto 0) <= REGISTERS_HIGH)) else '0';
    txbuf_sel <= wishbone_sel when ((ADR_I(16 downto 0) >= TX_BUFFER_OFFSET) and (ADR_I(16 downto 0) <= TX_BUFFER_HIGH)) else '0';
    rxbuf_sel <= wishbone_sel when ((ADR_I(16 downto 0) >= RX_BUFFER_OFFSET) and (ADR_I(16 downto 0) <= RX_BUFFER_HIGH)) else '0';
    arp_sel   <= wishbone_sel when ((ADR_I(16 downto 0) >= ARP_CACHE_OFFSET) and (ADR_I(16 downto 0) <= ARP_CACHE_HIGH)) else '0';

    reg_addr   <= ADR_I(16 downto 0) - REGISTERS_OFFSET;
    rxbuf_addr <= ADR_I(16 downto 0) - RX_BUFFER_OFFSET;
    txbuf_addr <= ADR_I(16 downto 0) - TX_BUFFER_OFFSET;
    arp_addr   <= ADR_I(16 downto 0) - ARP_CACHE_OFFSET;

    gen_reg_sel_z1 : process(CLK_I)
    begin
        if (rising_edge(CLK_I))then
            reg_sel_z1 <= reg_sel;
        end if;
    end process;

--------------------------------------------------------------------------------
-- DECODE WHAT DATA TO PUT ON BUS
--------------------------------------------------------------------------------

    arp_data_int <=
    arp_cache_rd_data(31 downto 0) when (arp_addr(2) = '1') else
    (X"0000" & arp_cache_rd_data(47 downto 32));

    tx_data_int <=
    cpu_tx_buffer_rd_data(31 downto 0) when (txbuf_addr(2) = '1') else
    cpu_tx_buffer_rd_data(63 downto 32);

    -- SWAP DATA ORDER TO MATCH THAT USED IN MICROBLAZE
    rx_data_int <=
    (cpu_rx_buffer_rd_data(15 downto  0) & cpu_rx_buffer_rd_data(31 downto 16)) when (rxbuf_addr(2) = '1') else
    (cpu_rx_buffer_rd_data(47 downto 32) & cpu_rx_buffer_rd_data(63 downto 48));

    cpu_rx_size_int <= ("000" & X"00") when (cpu_rx_ack_reg = '1') else cpu_rx_size;
    
    pCDCXauiStatusSynchroniser : process(RST_I, CLK_I)
    begin
       if (RST_I = '1')then
           sXauiStatusDvalidRR <= '0';
           sXauiStatusDvalidR <= '0'; 
           sXauiStatus <= (others => '0');          
       elsif (rising_edge(CLK_I))then
           sXauiStatusDvalidRR <= sXauiStatusDvalidR;
           sXauiStatusDvalidR <= '1';
	     if (sXauiStatusDvalidRR = '1') then
		sXauiStatus <= xaui_status; 		
             end if;  
       end if;
    end process pCDCXauiStatusSynchroniser;    

    reg_data_int <=
    (X"00000000")                                                                when (reg_data_src = REG_CORE_TYPE)        else
    (X"00000000")                                                                when (reg_data_src = REG_MAX_BUF_SIZE)     else
    (X"00000000")                                                                when (reg_data_src = REG_WORD_LENS)        else
    (X"0000" & local_mac_reg(47 downto 32))                                      when (reg_data_src = REG_LOCAL_MAC_1)      else
    local_mac_reg(31 downto 0)                                                   when (reg_data_src = REG_LOCAL_MAC_0)      else
    local_ip_reg(31 downto 0)                                                    when (reg_data_src = REG_LOCAL_IPADDR)     else
    (X"000000" & local_gateway_reg)                                              when (reg_data_src = REG_LOCAL_GATEWAY)    else
    local_netmask_reg(31 downto 0)                                               when (reg_data_src = REG_LOCAL_NETMASK)    else
    local_mc_recv_ip_reg(31 downto 0)                                            when (reg_data_src = REG_MC_RECV_IP)       else
    local_mc_recv_ip_mask_reg(31 downto 0)                                       when (reg_data_src = REG_MC_RECV_IP_MASK)  else
    ("00000" & cpu_tx_size_reg & "00000" & cpu_rx_size_int)                      when (reg_data_src = REG_BUFFER_SIZES)     else
    (X"00" & "0000000" & soft_reset_reg & X"00" & "0000000" & local_enable_reg)  when (reg_data_src = REG_PROMISC_RST_EN)   else
    (X"0000" & local_port_reg)                                                   when (reg_data_src = REG_VALID_PORTS)      else
    (X"000000" & sXauiStatus) when (reg_data_src = REG_XAUI_STATUS) else
    ("0000" & mgt_txdiffctrl_reg & "0000" & mgt_txpreemphasis_reg & "000" & mgt_txpostemphasis_reg & "00000" & mgt_rxeqmix_reg) when (reg_data_src = REG_PHY_CONFIG) else
    local_mc_recv_ip_reg(31 downto 0) when (reg_data_src = REG_MC_RECV_IP) else
    local_mc_recv_ip_mask_reg(31 downto 0) when (reg_data_src = REG_MC_RECV_IP_MASK) else
    (others => '0');

    reg_dat_o_int <=
    arp_data_int when (arp_sel    = '1') else
    tx_data_int  when (txbuf_sel = '1') else
    rx_data_int  when (rxbuf_sel = '1') else
    reg_data_int;
    
    --AI: latch data out when wishbone ack is asserted
    DAT_O <= reg_dat_o_int when (reg_ack = '1') else x"00000000";
    ACK_O <= reg_ack;

--------------------------------------------------------------------------------
-- REGISTER HANDLING
--------------------------------------------------------------------------------

    gen_reg : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            local_mac_reg             <= FABRIC_MAC;
            local_ip_reg              <= FABRIC_IP;
            local_gateway_reg         <= FABRIC_GATEWAY;
            local_netmask_reg         <= FABRIC_NETMASK;
            local_port_reg            <= FABRIC_PORT;
            local_enable_reg          <= FABRIC_ENABLE;
            local_mc_recv_ip_reg      <= MC_RECV_IP;
            local_mc_recv_ip_mask_reg <= MC_RECV_IP_MASK;
            cpu_tx_size_reg           <= (others => '0');
            cpu_rx_ack_reg            <= '0';
            soft_reset_reg            <= '0';
            reg_data_src              <= "00000000";
            cpu_tx_ready_reg          <= '0';
            mgt_rxeqmix_reg <= RXEQMIX;
            mgt_txpreemphasis_reg <= PREEMPHASIS;
            mgt_txpostemphasis_reg <= POSTEMPHASIS;
            mgt_txdiffctrl_reg <= DIFFCTRL;
        elsif (rising_edge(CLK_I))then

            if (cpu_tx_done = '1')then
                cpu_tx_size_reg  <= (others => '0');
                cpu_tx_ready_reg <= '0';
            end if;

            if (cpu_rx_size = ("000" & X"00"))then
                cpu_rx_ack_reg <= '0';
            end if;

            if (soft_reset_ack = '1')then
                soft_reset_reg <= '0';
            end if;

            if ((reg_sel = '1')and(reg_sel_z1 = '0'))then
                reg_data_src <= reg_addr(9 downto 2);
                if (WE_I = '1')then
                    case (reg_addr(9 downto 2))is
                        when REG_LOCAL_MAC_1 =>
                        if (SEL_I(0) = '1')then
                            local_mac_reg(39 downto 32) <= DAT_I(7 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            local_mac_reg(47 downto 40) <= DAT_I(15 downto 8);
                        end if;

                        when REG_LOCAL_MAC_0 =>
                        if (SEL_I(0) = '1')then
                            local_mac_reg(7 downto 0) <= DAT_I(7 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            local_mac_reg(15 downto 8)  <= DAT_I(15 downto 8);
                        end if;
                        if (SEL_I(2) = '1')then
                            local_mac_reg(23 downto 16) <= DAT_I(23 downto 16);
                        end if;
                        if (SEL_I(3) = '1')then
                            local_mac_reg(31 downto 24) <= DAT_I(31 downto 24);
                        end if;

                        when REG_LOCAL_IPADDR =>
                        if (SEL_I(0) = '1')then
                            local_ip_reg(7 downto 0) <= DAT_I(7 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            local_ip_reg(15 downto 8) <= DAT_I(15 downto 8);
                        end if;
                        if (SEL_I(2) = '1')then
                            local_ip_reg(23 downto 16) <= DAT_I(23 downto 16);
                        end if;
                        if (SEL_I(3) = '1')then
                            local_ip_reg(31 downto 24) <= DAT_I(31 downto 24);
                        end if;

                        when REG_LOCAL_GATEWAY =>
                        if (SEL_I(0) = '1')then
                            local_gateway_reg(7 downto 0) <= DAT_I(7 downto 0);
                        end if;

                        when REG_LOCAL_NETMASK =>
                        if (SEL_I(0) = '1')then
                            local_netmask_reg(7 downto 0) <= DAT_I(7 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            local_netmask_reg(15 downto 8) <= DAT_I(15 downto 8);
                        end if;
                        if (SEL_I(2) = '1')then
                            local_netmask_reg(23 downto 16) <= DAT_I(23 downto 16);
                        end if;
                        if (SEL_I(3) = '1')then
                            local_netmask_reg(31 downto 24) <= DAT_I(31 downto 24);
                        end if;

                        when REG_MC_RECV_IP =>
                        if (SEL_I(0) = '1')then
                            local_mc_recv_ip_reg(7 downto 0) <= DAT_I(7 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            local_mc_recv_ip_reg(15 downto 8) <= DAT_I(15 downto 8);
                        end if;
                        if (SEL_I(2) = '1')then
                            local_mc_recv_ip_reg(23 downto 16) <= DAT_I(23 downto 16);
                        end if;
                        if (SEL_I(3) = '1')then
                            local_mc_recv_ip_reg(31 downto 24) <= DAT_I(31 downto 24);
                        end if;

                        when REG_MC_RECV_IP_MASK =>
                        if (SEL_I(0) = '1')then
                            local_mc_recv_ip_mask_reg(7 downto 0) <= DAT_I(7 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            local_mc_recv_ip_mask_reg(15 downto 8) <= DAT_I(15 downto 8);
                        end if;
                        if (SEL_I(2) = '1')then
                            local_mc_recv_ip_mask_reg(23 downto 16) <= DAT_I(23 downto 16);
                        end if;
                        if (SEL_I(3) = '1')then
                            local_mc_recv_ip_mask_reg(31 downto 24) <= DAT_I(31 downto 24);
                        end if;

                        when REG_BUFFER_SIZES =>
                        if ((SEL_I(0) = '1')and(DAT_I(10 downto 0) = ("000" & X"00")))then
                            cpu_rx_ack_reg <= '1';
                        end if;
                        if (SEL_I(2) = '1')then
                            cpu_tx_size_reg <= DAT_I(26 downto 16);
                            cpu_tx_ready_reg <= '1';
                        end if;

                        when REG_PROMISC_RST_EN =>
                        if (SEL_I(0) = '1')then
                            local_enable_reg <= DAT_I(0);
                        end if;
                        if ((SEL_I(2) = '1')and(DAT_I(24) = '1'))then
                            soft_reset_reg <= '1';
                        end if;

                        when REG_VALID_PORTS =>
                        if (SEL_I(0) = '1')then
                            local_port_reg(7 downto 0) <= DAT_I(7 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            local_port_reg(15 downto 8) <= DAT_I(15 downto 8);
                        end if;

                        when REG_XAUI_STATUS =>

                        when REG_PHY_CONFIG =>
                        if (SEL_I(0) = '1')then
                            mgt_rxeqmix_reg <= DAT_I(2 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            mgt_txpostemphasis_reg <= DAT_I(12 downto 8);
                        end if;
                        if (SEL_I(2) = '1')then
                            mgt_txpreemphasis_reg <= DAT_I(19 downto 16);
                        end if;
                        if (SEL_I(3) = '1')then
                            mgt_txdiffctrl_reg <= DAT_I(27 downto 24);
                        end if;

                        when REG_XAUI_CONFIG =>
                        if (SEL_I(0) = '1')then
                            xaui_test_select_reg <= DAT_I(1 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            xaui_rst_local_fault_reg <= DAT_I(8);
                        end if;
                        if (SEL_I(2) = '1')then
                            xaui_rst_rx_link_status_reg <= DAT_I(16);
                        end if;

                        when others =>

                    end case;
                end if;
            end if;
        end if;
    end process;

--------------------------------------------------------------------------------
-- MEMORY HANDLING
--------------------------------------------------------------------------------

    gen_write_data : process(CLK_I)
    begin
        if (rising_edge(CLK_I))then
            arp_cache_we <= '0';
            tx_buffer_we <= '0';

            cpu_tx_buffer_addr <= txbuf_addr(13 downto 3);
            arp_cache_addr     <= arp_addr(13 downto 3);

            if (arp_sel = '1')then
                if (arp_addr(2) = '0')then
                    -- NOT SURE ABOUT ENDIANNESS HERE!!!
                    if (SEL_I(0) = '1')then
                        write_data(39 downto 32) <= DAT_I(7 downto 0);
                    else
                        write_data(39 downto 32) <= arp_cache_rd_data(39 downto 32);
                    end if;

                    if (SEL_I(1) = '1')then
                        write_data(47 downto 40) <= DAT_I(15 downto 8);
                    else
                        write_data(47 downto 40) <= arp_cache_rd_data(47 downto 40);
                    end if;
                else
                    -- WRITE LOWER 32 BITS AFTER THE UPPER 16 BITS
                    arp_cache_we <= '1';

                    if (SEL_I(0) = '1')then
                        write_data(7 downto 0) <= DAT_I(7 downto 0);
                    else
                        write_data(7 downto 0) <= arp_cache_rd_data(7 downto 0);
                    end if;

                    if (SEL_I(1) = '1')then
                        write_data(15 downto 8) <= DAT_I(15 downto 8);
                    else
                        write_data(15 downto 8) <= arp_cache_rd_data(15 downto 8);
                    end if;

                    if (SEL_I(2) = '1')then
                        write_data(23 downto 16) <= DAT_I(23 downto 16);
                    else
                        write_data(23 downto 16) <= arp_cache_rd_data(23 downto 16);
                    end if;

                    if (SEL_I(3) = '1')then
                        write_data(31 downto 24) <= DAT_I(31 downto 24);
                    else
                        write_data(31 downto 24) <= arp_cache_rd_data(31 downto 24);
                    end if;

                end if;
            end if;

            if (txbuf_sel = '1')then
                tx_buffer_we <= '1';

                if (txbuf_addr(2) = '0')then
                    -- NOT SURE ABOUT ENDIANNESS HERE!!!
                    if (SEL_I(0) = '1')then
                        write_data(39 downto 32) <= DAT_I(23 downto 16); --DAT_I(7 downto 0);
                    else
                        write_data(39 downto 32) <= cpu_tx_buffer_rd_data(39 downto 32);
                    end if;

                    if (SEL_I(1) = '1')then
                        write_data(47 downto 40) <= DAT_I(31 downto 24); --DAT_I(15 downto 8);
                    else
                        write_data(47 downto 40) <= cpu_tx_buffer_rd_data(47 downto 40);
                    end if;

                    if (SEL_I(2) = '1')then
                        write_data(55 downto 48) <= DAT_I(7 downto 0); --DAT_I(23 downto 16);
                    else
                        write_data(55 downto 48) <= cpu_tx_buffer_rd_data(55 downto 48);
                    end if;

                    if (SEL_I(3) = '1')then
                        write_data(63 downto 56) <= DAT_I(15 downto 8); --DAT_I(31 downto 24);
                    else
                        write_data(63 downto 56) <= cpu_tx_buffer_rd_data(63 downto 56);
                    end if;

                else
                    if (SEL_I(0) = '1')then
                        write_data(7 downto 0) <= DAT_I(23 downto 16); --DAT_I(7 downto 0);
                    else
                        write_data(7 downto 0) <= cpu_tx_buffer_rd_data(7 downto 0);
                    end if;

                    if (SEL_I(1) = '1')then
                        write_data(15 downto 8) <= DAT_I(31 downto 24); --DAT_I(15 downto 8);
                    else
                        write_data(15 downto 8) <= cpu_tx_buffer_rd_data(15 downto 8);
                    end if;

                    if (SEL_I(2) = '1')then
                        write_data(23 downto 16) <= DAT_I(7 downto 0); --DAT_I(23 downto 16);
                    else
                        write_data(23 downto 16) <= cpu_tx_buffer_rd_data(23 downto 16);
                    end if;

                    if (SEL_I(3) = '1')then
                        write_data(31 downto 24) <= DAT_I(15 downto 8); --DAT_I(31 downto 24);
                    else
                        write_data(31 downto 24) <= cpu_tx_buffer_rd_data(31 downto 24);
                    end if;

                end if;
            end if;
        end if;
    end process;

end arch_wishbone_ten_gb_eth_attach;
