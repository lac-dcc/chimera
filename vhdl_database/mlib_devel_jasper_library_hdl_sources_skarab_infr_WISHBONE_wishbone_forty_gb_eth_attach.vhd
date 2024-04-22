----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: wishbone_forty_gb_eth_attach - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Wishbone Classic slave, Replaces opb_attach in 10GBE MAC, for 40GBE MAC
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

entity wishbone_forty_gb_eth_attach is
    generic (
        FABRIC_MAC      : std_logic_vector(47 downto 0);
        FABRIC_IP       : std_logic_vector(31 downto 0);
        FABRIC_PORT     : std_logic_vector(15 downto 0);
        FABRIC_NETMASK  : std_logic_vector(31 downto 0);
        FABRIC_GATEWAY  : std_logic_vector( 7 downto 0);
        FABRIC_ENABLE   : std_logic;
        MC_RECV_IP      : std_logic_vector(31 downto 0);
        MC_RECV_IP_MASK : std_logic_vector(31 downto 0));
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
        arp_cache_addr    : out std_logic_vector(7 downto 0);
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

        -- LOCAL COUNTER REGISTERS
        tx_pkt_rate      : in  std_logic_vector(31 downto 0);
        tx_pkt_cnt       : in  std_logic_vector(31 downto 0);
        tx_valid_rate    : in  std_logic_vector(31 downto 0);
        tx_valid_cnt     : in  std_logic_vector(31 downto 0);
        tx_overflow_cnt  : in  std_logic_vector(31 downto 0);
        tx_afull_cnt     : in  std_logic_vector(31 downto 0);
        rx_pkt_rate      : in  std_logic_vector(31 downto 0);
        rx_pkt_cnt       : in  std_logic_vector(31 downto 0);
        rx_valid_rate    : in  std_logic_vector(31 downto 0);
        rx_valid_cnt     : in  std_logic_vector(31 downto 0);
        rx_overflow_cnt  : in  std_logic_vector(31 downto 0);
        rx_bad_frame_cnt : in  std_logic_vector(31 downto 0);
        cnt_reset        : out std_logic_vector(31 downto 0));

end wishbone_forty_gb_eth_attach;

architecture arch_wishbone_forty_gb_eth_attach of wishbone_forty_gb_eth_attach is

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

    -- COUNTER REGISTERS (read only)
    constant REG_TX_PKT_RATE      : std_logic_vector(7 downto 0) := X"12";
    constant REG_TX_PKT_CNT       : std_logic_vector(7 downto 0) := X"13";
    constant REG_TX_VALID_RATE    : std_logic_vector(7 downto 0) := X"14";
    constant REG_TX_VALID_CNT     : std_logic_vector(7 downto 0) := X"15";
    constant REG_TX_OVERFLOW_CNT  : std_logic_vector(7 downto 0) := X"16";
    constant REG_TX_AFULL_CNT     : std_logic_vector(7 downto 0) := X"17";
    constant REG_RX_PKT_RATE      : std_logic_vector(7 downto 0) := X"18";
    constant REG_RX_PKT_CNT       : std_logic_vector(7 downto 0) := X"19";
    constant REG_RX_VALID_RATE    : std_logic_vector(7 downto 0) := X"1A";
    constant REG_RX_VALID_CNT     : std_logic_vector(7 downto 0) := X"1B";
    constant REG_RX_OVERFLOW_CNT  : std_logic_vector(7 downto 0) := X"1C";
    constant REG_RX_BAD_FRAME_CNT : std_logic_vector(7 downto 0) := X"1D";
    constant REG_CNT_RESET        : std_logic_vector(7 downto 0) := X"1E"; -- obviously writable
    
    --Reset Synchroniser and user reset signals
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

    signal tx_pkt_rate_reg       : std_logic_vector(31 downto 0);
    signal tx_pkt_cnt_reg        : std_logic_vector(31 downto 0);
    signal tx_valid_rate_reg     : std_logic_vector(31 downto 0);
    signal tx_valid_cnt_reg      : std_logic_vector(31 downto 0);
    signal tx_overflow_cnt_reg   : std_logic_vector(31 downto 0);
    signal tx_afull_cnt_reg      : std_logic_vector(31 downto 0);
    signal rx_pkt_rate_reg       : std_logic_vector(31 downto 0);
    signal rx_pkt_cnt_reg        : std_logic_vector(31 downto 0);
    signal rx_valid_rate_reg     : std_logic_vector(31 downto 0);
    signal rx_valid_cnt_reg      : std_logic_vector(31 downto 0);
    signal rx_overflow_cnt_reg   : std_logic_vector(31 downto 0);
    signal rx_bad_frame_cnt_reg  : std_logic_vector(31 downto 0);
    signal cnt_reset_reg         : std_logic_vector(31 downto 0);

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
    
    signal sBusRegValidD1 : std_logic;
    signal sBusRegValid : std_logic;
    attribute ASYNC_REG of sBusRegValid : signal is "TRUE";
    attribute ASYNC_REG of sBusRegValidD1 : signal is "TRUE";    
    signal sSoftResetAck : std_logic;
    signal sSoftResetAckD1 : std_logic;
    attribute ASYNC_REG of sSoftResetAck : signal is "TRUE";
    attribute ASYNC_REG of sSoftResetAckD1 : signal is "TRUE";    
         

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

    cnt_reset             <= cnt_reset_reg;

    cpu_tx_size  <= cpu_tx_size_reg;
    cpu_tx_ready <= cpu_tx_ready_reg;
    cpu_rx_ack   <= cpu_rx_ack_reg;

    arp_cache_wr_data <= write_data(47 downto 0);
    arp_cache_wr_en   <= arp_cache_we;

    cpu_tx_buffer_wr_data <= write_data;
    cpu_tx_buffer_wr_en   <= tx_buffer_we;
    cpu_rx_buffer_addr    <= rxbuf_addr(13 downto 3);
    
--------------------------------------------------------------------------------
-- CDC Synchronisation
--------------------------------------------------------------------------------    
    
    pCDCRegSynchroniser : process(RST_I, CLK_I)
    begin
       if (RST_I = '1')then
           tx_pkt_rate_reg <= (others => '0');
           tx_pkt_cnt_reg <= (others => '0');
           tx_valid_rate_reg <= (others => '0');
           tx_valid_cnt_reg <= (others => '0');
           tx_overflow_cnt_reg <= (others => '0');
           tx_afull_cnt_reg <= (others => '0');
           rx_pkt_rate_reg <= (others => '0');
           rx_pkt_cnt_reg <= (others => '0');
           rx_valid_rate_reg <= (others => '0');
           rx_valid_cnt_reg <= (others => '0');
           rx_overflow_cnt_reg <= (others => '0');
           rx_bad_frame_cnt_reg <= (others => '0');          
           sBusRegValidD1 <= '0';
           sBusRegValid <= '0'; 
           sSoftResetAck <= '0';
           sSoftResetAckD1 <= '0';
       elsif (rising_edge(CLK_I))then
           sBusRegValidD1 <= sBusRegValid;
           sBusRegValid <= '1';
           sSoftResetAckD1 <= sSoftResetAck;
           sSoftResetAck <= soft_reset_ack;
             if (sBusRegValidD1 = '1') then
               tx_pkt_rate_reg  <= tx_pkt_rate;
               tx_pkt_cnt_reg <= tx_pkt_cnt;
               tx_valid_rate_reg <= tx_valid_rate;
               tx_valid_cnt_reg <= tx_valid_cnt;
               tx_overflow_cnt_reg <= tx_overflow_cnt;
               tx_afull_cnt_reg  <= tx_afull_cnt;
               rx_pkt_rate_reg  <= rx_pkt_rate;
               rx_pkt_cnt_reg  <= rx_pkt_cnt;
               rx_valid_rate_reg <= rx_valid_rate;
               rx_valid_cnt_reg  <= rx_valid_cnt;
               rx_overflow_cnt_reg <= rx_overflow_cnt;
               rx_bad_frame_cnt_reg  <= rx_bad_frame_cnt;                          
             end if;  
       end if;
    end process pCDCRegSynchroniser;     

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

    --X"12345678"                                                              when (reg_data_src = REG_TX_PKT_RATE)      else
    tx_pkt_rate_reg                                                              when (reg_data_src = REG_TX_PKT_RATE)      else
    tx_pkt_cnt_reg                                                               when (reg_data_src = REG_TX_PKT_CNT)       else
    tx_valid_rate_reg                                                            when (reg_data_src = REG_TX_VALID_RATE)    else
    tx_valid_cnt_reg                                                             when (reg_data_src = REG_TX_VALID_CNT)     else
    tx_overflow_cnt_reg                                                          when (reg_data_src = REG_TX_OVERFLOW_CNT)  else
    tx_afull_cnt_reg                                                             when (reg_data_src = REG_TX_AFULL_CNT)     else
    rx_pkt_rate_reg                                                              when (reg_data_src = REG_RX_PKT_RATE)      else
    rx_pkt_cnt_reg                                                               when (reg_data_src = REG_RX_PKT_CNT)       else
    rx_valid_rate_reg                                                            when (reg_data_src = REG_RX_VALID_RATE)    else
    rx_valid_cnt_reg                                                             when (reg_data_src = REG_RX_VALID_CNT)     else
    rx_overflow_cnt_reg                                                          when (reg_data_src = REG_RX_OVERFLOW_CNT)  else
    --X"87654321"                                                         when (reg_data_src = REG_RX_BAD_FRAME_CNT) else
    rx_bad_frame_cnt_reg                                                         when (reg_data_src = REG_RX_BAD_FRAME_CNT) else
    cnt_reset_reg                                                                when (reg_data_src = REG_CNT_RESET)        else
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
            cnt_reset_reg             <= (others => '1');
            cpu_tx_size_reg           <= (others => '0');
            cpu_rx_ack_reg            <= '0';
            soft_reset_reg            <= '0';
            reg_data_src              <= "00000000";
        elsif (rising_edge(CLK_I))then

            if (cpu_tx_done = '1')then
                cpu_tx_size_reg  <= (others => '0');
                cpu_tx_ready_reg <= '0';
            end if;

            if (cpu_rx_size = ("000" & X"00"))then
                cpu_rx_ack_reg <= '0';
            end if;

            if (sSoftResetAckD1 = '1')then
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
                        
                        when REG_CNT_RESET =>
                        if (SEL_I(0) = '1')then
                            cnt_reset_reg(7 downto 0) <= DAT_I(7 downto 0);
                        end if;
                        if (SEL_I(1) = '1')then
                            cnt_reset_reg(15 downto 8) <= DAT_I(15 downto 8);
                        end if;
                        if (SEL_I(2) = '1')then
                            cnt_reset_reg(23 downto 16) <= DAT_I(23 downto 16);
                        end if;
                        if (SEL_I(3) = '1')then
                            cnt_reset_reg(31 downto 24) <= DAT_I(31 downto 24);
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
            arp_cache_addr     <= arp_addr(10 downto 3);

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

end arch_wishbone_forty_gb_eth_attach;
