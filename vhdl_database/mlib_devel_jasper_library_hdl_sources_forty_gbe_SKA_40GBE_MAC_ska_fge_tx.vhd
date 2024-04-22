----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: ska_fge_tx - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- SKA 40GBE TX path
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

entity ska_fge_tx is
    generic (
    TTL             : std_logic_vector(7 downto 0);
    USE_CPU_TX      : integer := 1;
    FABRIC_IP       : std_logic_vector(31 downto 0);
    FABRIC_NETMASK  : std_logic_vector(31 downto 0);
    FABRIC_GATEWAY  : std_logic_vector(7 downto 0));

    port (
    local_enable    : in std_logic;
    local_mac       : in std_logic_vector(47 downto 0);
    local_ip        : in std_logic_vector(31 downto 0);
    local_netmask   : in std_logic_vector(31 downto 0);
    local_port      : in std_logic_vector(15 downto 0);
    local_gateway   : in std_logic_vector(7 downto 0);

    -- CPU Arp Cache signals,
    arp_cache_addr      : in std_logic_vector(7 downto 0);
    arp_cache_rd_data   : out std_logic_vector(47 downto 0);
    arp_cache_wr_data   : in std_logic_vector(47 downto 0);
    arp_cache_wr_en     : in std_logic;

    -- Application Interface
    app_clk             : in std_logic;
    app_rst             : in std_logic;
    app_tx_valid        : in std_logic_vector(3 downto 0);
    app_tx_end_of_frame : in std_logic;
    app_tx_data         : in std_logic_vector(255 downto 0);
    app_tx_dest_ip      : in std_logic_vector(31 downto 0);
    app_tx_dest_port    : in std_logic_vector(15 downto 0);
    app_tx_overflow     : out std_logic;
    app_tx_afull        : out std_logic;

    -- CPU Interface
    cpu_clk                 : in std_logic;
    cpu_rst                 : in std_logic;
    cpu_tx_buffer_addr      : in std_logic_vector(10 downto 0);
    cpu_tx_buffer_rd_data   : out std_logic_vector(63 downto 0);
    cpu_tx_buffer_wr_data   : in std_logic_vector(63 downto 0);
    cpu_tx_buffer_wr_en     : in std_logic;
    cpu_tx_size             : in std_logic_vector(10 downto 0);
    cpu_tx_ready            : in std_logic;
    cpu_tx_done             : out std_logic;

    -- MAC
    mac_clk             : in std_logic;
    mac_rst             : in std_logic;
    mac_tx_data         : out std_logic_vector(255 downto 0);
    mac_tx_data_valid   : out std_logic_vector(31 downto 0);
    mac_tx_start        : out std_logic;
    mac_tx_ready        : in std_logic;

    debug_out : out std_logic_vector(7 downto 0)); -- CHANGE TO READY BECAUSE WILL ONLY STALL BETWEEN PACKETS, NOT INSIDE PACKETS
end ska_fge_tx;

architecture arch_ska_fge_tx of ska_fge_tx is

    type T_TX_PACKET_STATE is (
    IDLE,
    READ_CTRL_FIFO_DELAY_1,
    READ_CTRL_FIFO_DELAY_2,
    GEN_HEADER_1,
    GEN_HEADER_1_MULTICAST,
    GEN_HEADER_2_PAYLOAD_START,
    GEN_PAYLOAD,
    GEN_PAYLOAD_FINISH_3,
    GEN_PAYLOAD_FINISH_4,
    GEN_PAYLOAD_FINISH_5,
    GEN_PAYLOAD_FINISH_6,
    CPU_TX_START,
    CPU_TX_PAYLOAD,
    CPU_TX_FINISH);

    component cross_clock_fifo_36x16
    port (
        wr_rst  : in std_logic;
        rd_rst  : in std_logic;
        wr_clk  : in std_logic;
        rd_clk  : in std_logic;
        din     : in std_logic_vector(35 downto 0);
        wr_en   : in std_logic;
        rd_en   : in std_logic;
        dout    : out std_logic_vector(35 downto 0);
        full    : out std_logic;
        empty   : out std_logic);
    end component;

    component ska_tx_packet_fifo
    port (
        wr_rst      : in std_logic;
        rd_rst      : in std_logic;
        wr_clk      : in std_logic;
        rd_clk      : in std_logic;
        din         : in std_logic_vector(263 downto 0);--std_logic_vector(259 downto 0);
        wr_en       : in std_logic;
        rd_en       : in std_logic;
        dout        : out std_logic_vector(263 downto 0);--std_logic_vector(259 downto 0);
        full        : out std_logic;
        overflow    : out std_logic;
        empty       : out std_logic;
        prog_full   : out std_logic);
    end component;

    component ska_tx_packet_ctrl_fifo
    port (
        wr_rst      : in std_logic;
        rd_rst      : in std_logic;
        wr_clk      : in std_logic;
        rd_clk      : in std_logic;
        din         : in std_logic_vector(63 downto 0);
        wr_en       : in std_logic;
        rd_en       : in std_logic;
        dout        : out std_logic_vector(63 downto 0);
        full        : out std_logic;
        overflow    : out std_logic;
        empty       : out std_logic;
        prog_full   : out std_logic);
    end component;

    component arp_cache
    port (
        clka    : in std_logic;
        wea     : in std_logic_vector(0 downto 0);
        addra   : in std_logic_vector(7 downto 0);
        dina    : in std_logic_vector(47 downto 0);
        douta   : out std_logic_vector(47 downto 0);
        clkb    : in std_logic;
        web     : in std_logic_vector(0 downto 0);
        addrb   : in std_logic_vector(7 downto 0);
        dinb    : in std_logic_vector(47 downto 0);
        doutb   : out std_logic_vector(47 downto 0));
    end component;

    component ska_cpu_buffer
    port (
        clka    : in std_logic;
        wea     : in std_logic_vector(0 downto 0);
        addra   : in std_logic_vector(9 downto 0);
        dina    : in std_logic_vector(259 downto 0);
        douta   : out std_logic_vector(259 downto 0);
        clkb    : in std_logic;
        web     : in std_logic_vector(0 downto 0);
        addrb   : in std_logic_vector(9 downto 0);
        dinb    : in std_logic_vector(259 downto 0);
        doutb   : out std_logic_vector(259 downto 0));
    end component;
    
    attribute ASYNC_REG : string;

    signal app_tx_valid_z1 : std_logic_vector(3 downto 0);
    signal app_tx_any_valid : std_logic;
    signal app_tx_data_z1 : std_logic_vector(255 downto 0);
    signal app_tx_dest_ip_z1 : std_logic_vector(31 downto 0);
    signal app_tx_dest_ip_z2 : std_logic_vector(31 downto 0);
    signal app_tx_dest_port_z1 : std_logic_vector(15 downto 0);
    signal app_tx_dest_port_z2 : std_logic_vector(15 downto 0);
    signal app_tx_data_din : std_logic_vector(263 downto 0);--std_logic_vector(259 downto 0);
    signal app_tx_data_wrreq : std_logic;
    signal app_tx_data_rdreq : std_logic;
    signal app_tx_data_dout : std_logic_vector(263 downto 0);--std_logic_vector(259 downto 0);
    signal app_tx_data_full : std_logic;
    signal app_tx_data_empty : std_logic;
    signal app_tx_data_overflow : std_logic;
    signal app_tx_data_rd : std_logic;
    signal app_tx_data_afull : std_logic;
    signal app_tx_end_of_frame_z1 : std_logic;

    signal app_tx_ctrl_fifo_en : std_logic;
    signal app_tx_ctrl_din : std_logic_vector(63 downto 0);
    signal app_tx_ctrl_wrreq : std_logic;
    signal app_tx_ctrl_rdreq : std_logic;
    signal app_tx_ctrl_rdreq_z : std_logic;
    signal app_tx_ctrl_dout : std_logic_vector(63 downto 0);
    signal app_tx_ctrl_full : std_logic;
    signal app_tx_ctrl_overflow : std_logic;
    signal app_tx_ctrl_empty : std_logic;
    signal app_tx_ctrl_afull : std_logic;
    signal app_tx_ctrl_rd : std_logic;

    signal data_count : std_logic_vector(10 downto 0); -- 512 x 256 = 16kB

    signal arp_cache_wr_en_a : std_logic_vector(0 downto 0);
    signal packet_arp_cache_addr : std_logic_vector(7 downto 0);
    signal packet_arp_cache_data : std_logic_vector(47 downto 0);

    signal cpu_tx_buffer_wr_en_z1 : std_logic;
    signal cpu_tx_buffer_wea : std_logic_vector(0 downto 0);
    signal cpu_tx_buffer_addra : std_logic_vector(9 downto 0);
    signal cpu_tx_buffer_dina : std_logic_vector(259 downto 0);
    signal cpu_tx_buffer_douta : std_logic_vector(259 downto 0);
    signal cpu_tx_buffer_addrb : std_logic_vector(9 downto 0);
    signal cpu_tx_buffer_doutb : std_logic_vector(259 downto 0);

    signal mac_pending : std_logic;
    signal mac_pending_z1 : std_logic;
    signal mac_pending_z2 : std_logic;
    attribute ASYNC_REG of mac_pending_z1: signal is "TRUE";
    attribute ASYNC_REG of mac_pending_z2: signal is "TRUE";     
    signal ack_low_wait : std_logic;
    signal cpu_tx_size_reg : std_logic_vector(10 downto 0);
    signal mac_cpu_ack : std_logic;
    signal mac_cpu_ack_z1 : std_logic;
    signal mac_cpu_ack_z2 : std_logic;
    attribute ASYNC_REG of mac_cpu_ack_z1: signal is "TRUE";
    attribute ASYNC_REG of mac_cpu_ack_z2: signal is "TRUE"; 
    
    signal mac_cpu_size : std_logic_vector(10 downto 0);
    signal mac_cpu_pending : std_logic;

    signal tx_overflow_latch : std_logic;
    signal app_overflow_z1 : std_logic;
    signal app_overflow_retimed : std_logic;
    attribute ASYNC_REG of app_overflow_z1: signal is "TRUE";
    attribute ASYNC_REG of app_overflow_retimed: signal is "TRUE";     

    signal cpu_buf_select : std_logic;
    signal cpu_buf_select_z1 : std_logic;
    signal cpu_buf_select_z2 : std_logic;
    attribute ASYNC_REG of cpu_buf_select_z1: signal is "TRUE";
    attribute ASYNC_REG of cpu_buf_select_z2: signal is "TRUE";     
    
    signal current_tx_packet_state : T_TX_PACKET_STATE;
    signal current_tx_packet_state_z1 : T_TX_PACKET_STATE;
    signal tx_size : std_logic_vector(10 downto 0);
    signal tx_ip_ttl : std_logic_vector(7 downto 0);

    signal mac_tx_start_i : std_logic;
    signal mac_tx_start_z1 : std_logic;

    signal mac_tx_data_i : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_i : std_logic_vector(31 downto 0);

    signal mac_tx_data_fabric : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_fabric : std_logic_vector(31 downto 0);
    signal mac_tx_data_fabric_i : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_fabric_i : std_logic_vector(31 downto 0);

    signal mac_tx_data_cpu : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_cpu : std_logic_vector(31 downto 0);
    signal mac_tx_data_cpu_i : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_cpu_i : std_logic_vector(31 downto 0);

    signal dest_mac : std_logic_vector(47 downto 0);
    signal dest_ip : std_logic_vector(31 downto 0);
    signal dest_port : std_logic_vector(15 downto 0);
    signal tx_total_size : std_logic_vector(10 downto 0);

    signal cpu_mac_cross_clock_count : std_logic_vector(3 downto 0);
    signal cpu_mac_cross_clock_fifo_din : std_logic_vector(35 downto 0);
    signal cpu_mac_cross_clock_fifo_wrreq : std_logic;
    signal cpu_mac_cross_clock_fifo_rdreq : std_logic;
    signal cpu_mac_cross_clock_fifo_rdreq_z : std_logic;
    signal cpu_mac_cross_clock_fifo_dout : std_logic_vector(35 downto 0);
    signal cpu_mac_cross_clock_fifo_full : std_logic;
    signal cpu_mac_cross_clock_fifo_empty : std_logic;

    signal local_enable_retimed : std_logic;
    signal local_mac_retimed : std_logic_vector(47 downto 0);
    signal local_ip_retimed : std_logic_vector(31 downto 0);
    signal local_port_retimed : std_logic_vector(15 downto 0);
    signal local_netmask_retimed : std_logic_vector(31 downto 0);
    signal local_gateway_retimed : std_logic_vector(7 downto 0);

    signal payload0 : std_logic_vector(63 downto 0);
    signal payload1 : std_logic_vector(63 downto 0);
    signal payload2 : std_logic_vector(63 downto 0);
    signal payload3 : std_logic_vector(63 downto 0);
    signal payload_valid : std_logic_vector(3 downto 0);
    signal payload_end_of_frame : std_logic;

    signal payload0_z1 : std_logic_vector(63 downto 0);
    signal payload1_z1 : std_logic_vector(63 downto 0);
    signal payload2_z1 : std_logic_vector(63 downto 0);
    signal payload3_z1 : std_logic_vector(63 downto 0);
    signal payload_valid_z1 : std_logic_vector(3 downto 0);
    signal payload_end_of_frame_z1 : std_logic;

    signal ip_checksum_0 : std_logic_vector(17 downto 0);
    signal ip_checksum_1 : std_logic_vector(16 downto 0);
    signal ip_checksum : std_logic_vector(15 downto 0);

    signal cpu_payload0 : std_logic_vector(63 downto 0);
    signal cpu_payload1 : std_logic_vector(63 downto 0);
    signal cpu_payload2 : std_logic_vector(63 downto 0);
    signal cpu_payload3 : std_logic_vector(63 downto 0);
    signal cpu_payload_valid : std_logic_vector(3 downto 0);

    signal mac_cpu_addr : std_logic_vector(7 downto 0);

    signal ip_length : std_logic_vector(15 downto 0);
    signal udp_length : std_logic_vector(15 downto 0);

    signal cpu_first_word : std_logic;
    signal cpu_outstanding : std_logic;

    signal payload_finish_state : std_logic;

    signal app_tx_ctrl_wrreq_latched : std_logic;
    signal app_tx_data_wrreq_latched : std_logic;
    signal app_tx_end_of_frame_latched : std_logic;

    signal read_eof_data_cnt : std_logic_vector(63 downto 0);
    signal read_eof_data_ctrl_cnt : std_logic_vector(63 downto 0);

    signal write_eof_data_cnt : std_logic_vector(63 downto 0);
    signal write_eof_data_ctrl_cnt : std_logic_vector(63 downto 0);

    signal misalign_cond1_count : std_logic_vector(63 downto 0);
    signal misalign_cond2_count : std_logic_vector(63 downto 0);

    signal eof_flag_activate : std_logic;
    
    signal sLocalIp : std_logic_vector(31 downto 0);
    signal sLocalNetmask : std_logic_vector(31 downto 0);
    signal sLocalGateWay : std_logic_vector(7 downto 0);    
    signal sBusLocalRegValid : std_logic;
    signal sBusLocalRegValidD1 : std_logic;
    attribute ASYNC_REG of sBusLocalRegValid: signal is "TRUE";
    attribute ASYNC_REG of sBusLocalRegValidD1: signal is "TRUE"; 
        
--    signal arp_cache_write_error_i : std_logic_vector(7 downto 0);
--    signal arp_cache_read_error_i : std_logic_vector(7 downto 0);

-- Mark Debug ILA Testing
    --signal dbg_app_tx_valid_z1 : std_logic_vector(3 downto 0);
    --signal dbg_app_tx_any_valid : std_logic;
    --signal dbg_app_tx_data_z1 : std_logic_vector(255 downto 0);
    --signal dbg_app_tx_dest_ip_z1 : std_logic_vector(31 downto 0);
    --signal dbg_app_tx_dest_port_z1 : std_logic_vector(15 downto 0);
    --signal dbg_app_tx_data_din : std_logic_vector(263 downto 0);
    --signal dbg_app_tx_data_wrreq : std_logic;
    --signal dbg_app_tx_data_rdreq : std_logic;
    --signal dbg_app_tx_data_dout : std_logic_vector(263 downto 0);
    --signal dbg_app_tx_data_full : std_logic;
    --signal dbg_app_tx_data_empty : std_logic;
    --signal dbg_app_tx_data_overflow : std_logic;
    --signal dbg_app_tx_data_rd : std_logic;
    --signal dbg_app_tx_data_afull : std_logic;
    --signal dbg_app_tx_end_of_frame_z1 : std_logic;
    --signal dbg_payload0 :std_logic_vector(63 downto 0);
    --signal dbg_payload1 :std_logic_vector(63 downto 0);
    --signal dbg_payload2 :std_logic_vector(63 downto 0);
    --signal dbg_payload3 :std_logic_vector(63 downto 0);
    --signal dbg_payload_valid :std_logic_vector(3 downto 0);
    --signal dbg_payload_end_of_frame : std_logic;
    --signal dbg_app_tx_ctrl_din :std_logic_vector(63 downto 0);
    --signal dbg_app_tx_ctrl_wrreq :std_logic;
    --signal dbg_app_tx_ctrl_rdreq :std_logic;
    --signal dbg_app_tx_ctrl_dout :std_logic_vector(63 downto 0);
    --signal dbg_app_tx_ctrl_full :std_logic;
    --signal dbg_app_tx_ctrl_overflow :std_logic;
    --signal dbg_app_tx_ctrl_empty :std_logic;
    --signal dbg_app_tx_ctrl_afull :std_logic;
    --signal dbg_app_tx_ctrl_wrreq_latched : std_logic;
    --signal dbg_app_tx_data_wrreq_latched : std_logic;
    --signal dbg_app_tx_end_of_frame_latched : std_logic;
    --signal dbg_app_tx_ctrl_fifo_en : std_logic;
    --signal dbg_data_count : std_logic_vector(10 downto 0);
    --signal dbg_app_tx_ctrl_rd : std_logic;
    --signal dbg_current_tx_packet_state : T_TX_PACKET_STATE;
    --signal dbg_mac_tx_start_i : std_logic;
    --signal dbg_payload_finish_state : std_logic;
    --signal dbg_dest_mac : std_logic_vector(47 downto 0);
    --signal dbg_dest_ip : std_logic_vector(31 downto 0);
    --signal dbg_dest_port : std_logic_vector(15 downto 0);
    --signal dbg_tx_total_size : std_logic_vector(10 downto 0);
    --signal dbg_mac_tx_start_z1 : std_logic;
    --signal dbg_mac_tx_data_i : std_logic_vector(255 downto 0);
    --signal dbg_mac_tx_data_valid_i : std_logic_vector(31 downto 0);
    --signal dbg_app_rst : std_logic;
    --signal dbg_tx_size : std_logic_vector(10 downto 0);
    --signal dbg_read_eof_data_cnt : std_logic_vector(63 downto 0);
    --signal dbg_read_eof_data_ctrl_cnt : std_logic_vector(63 downto 0);
    --signal dbg_write_eof_data_cnt : std_logic_vector(63 downto 0);
    --signal dbg_write_eof_data_ctrl_cnt : std_logic_vector(63 downto 0);
    --signal dbg_misalign_cond1_count : std_logic_vector(63 downto 0);
    --signal dbg_misalign_cond2_count : std_logic_vector(63 downto 0);

    -- Mark Debug ILA Testing

    --attribute MARK_DEBUG : string;
    --attribute MARK_DEBUG of dbg_app_tx_valid_z1 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_any_valid : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_z1 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_dest_ip_z1 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_dest_port_z1 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_din : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_wrreq : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_rdreq : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_dout : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_full : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_empty : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_overflow : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_rd : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_afull : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_end_of_frame_z1 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_payload0 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_payload1 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_payload2 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_payload3 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_payload_valid : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_payload_end_of_frame : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_din : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_wrreq : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_rdreq : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_dout : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_full : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_overflow : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_empty : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_afull : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_wrreq_latched : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_data_wrreq_latched : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_end_of_frame_latched : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_fifo_en : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_data_count : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_tx_ctrl_rd : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_current_tx_packet_state : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_mac_tx_start_i : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_dest_mac : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_dest_ip : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_dest_port : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_tx_total_size : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_payload_finish_state : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_mac_tx_start_z1 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_mac_tx_data_i : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_mac_tx_data_valid_i : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_app_rst : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_tx_size : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_read_eof_data_cnt : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_read_eof_data_ctrl_cnt : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_write_eof_data_cnt : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_write_eof_data_ctrl_cnt : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_misalign_cond1_count : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_misalign_cond2_count : signal is "TRUE";

begin

    -- ILA Debug Signals
    --dbg_app_tx_valid_z1 <= app_tx_valid_z1;
    --dbg_app_tx_any_valid <= app_tx_any_valid;
    --dbg_app_tx_data_z1 <= app_tx_data_z1;
    --dbg_app_tx_dest_ip_z1 <= app_tx_dest_ip_z1;
    --dbg_app_tx_dest_port_z1 <= app_tx_dest_port_z1;
    --dbg_app_tx_data_din <= app_tx_data_din;
    --dbg_app_tx_data_wrreq <= app_tx_data_wrreq;
    --dbg_app_tx_data_rdreq <= app_tx_data_rdreq;
    --dbg_app_tx_data_dout <= app_tx_data_dout;
    --dbg_app_tx_data_full <= app_tx_data_full;
    --dbg_app_tx_data_empty <= app_tx_data_empty;
    --dbg_app_tx_data_overflow <= app_tx_data_overflow;
    --dbg_app_tx_data_rd <= app_tx_data_rd;
    --dbg_app_tx_data_afull <= app_tx_data_afull;
    --dbg_app_tx_end_of_frame_z1 <= app_tx_end_of_frame_z1;
    --dbg_payload0 <= payload0;
    --dbg_payload1 <= payload1;
    --dbg_payload2 <= payload2;
    --dbg_payload3 <= payload3;
    --dbg_payload_valid <= payload_valid;
    --dbg_payload_end_of_frame <= payload_end_of_frame;
    --dbg_app_tx_ctrl_din <= app_tx_ctrl_din;
    --dbg_app_tx_ctrl_wrreq <= app_tx_ctrl_wrreq;
    --dbg_app_tx_ctrl_rdreq <= app_tx_ctrl_rdreq;
    --dbg_app_tx_ctrl_dout <= app_tx_ctrl_dout;
    --dbg_app_tx_ctrl_full <= app_tx_ctrl_full;
    --dbg_app_tx_ctrl_overflow <= app_tx_ctrl_overflow;
    --dbg_app_tx_ctrl_empty <= app_tx_ctrl_empty;
    --dbg_app_tx_ctrl_afull <= app_tx_ctrl_afull;
    --dbg_app_tx_ctrl_wrreq_latched <= app_tx_ctrl_wrreq_latched;
    --dbg_app_tx_data_wrreq_latched <= app_tx_data_wrreq_latched;
    --dbg_app_tx_end_of_frame_latched <= app_tx_end_of_frame_latched;
    --dbg_app_tx_ctrl_fifo_en <= app_tx_ctrl_fifo_en;
    --dbg_data_count <= data_count;
    --dbg_app_tx_ctrl_rd <= app_tx_ctrl_rd;
    --dbg_current_tx_packet_state <= current_tx_packet_state;
    --dbg_mac_tx_start_i <= mac_tx_start_i;
    --dbg_payload_finish_state <= payload_finish_state;
    --dbg_dest_mac <= dest_mac;
    --dbg_dest_ip <= dest_ip;
    --dbg_dest_port <= dest_port;
    --dbg_tx_total_size <= tx_total_size;
    --dbg_mac_tx_start_z1 <= mac_tx_start_z1;
    --dbg_mac_tx_data_i <= mac_tx_data_i;
    --dbg_mac_tx_data_valid_i <= mac_tx_data_valid_i;
    --dbg_app_rst <= app_rst;
    --dbg_tx_size <= tx_size;
    --dbg_read_eof_data_cnt <= read_eof_data_cnt;
    --dbg_read_eof_data_ctrl_cnt <= read_eof_data_ctrl_cnt;
    --dbg_write_eof_data_cnt <= write_eof_data_cnt;
    --dbg_write_eof_data_ctrl_cnt <= write_eof_data_ctrl_cnt;
    --dbg_misalign_cond1_count <= misalign_cond1_count;
    --dbg_misalign_cond2_count <= misalign_cond2_count;

    debug_out(0) <= app_tx_ctrl_wrreq_latched;
    debug_out(1) <= app_tx_data_wrreq_latched;
    debug_out(2) <= local_enable_retimed;
    debug_out(3) <= app_overflow_retimed;
    debug_out(4) <= app_tx_end_of_frame_latched;
    debug_out(5) <= '0';
    debug_out(6) <= '0';
    debug_out(7) <= '0';

-----------------------------------------------------------------------------------------
-- MOVE LOCAL PARAMETERS FROM CPU CLOCK DOMAIN TO MAC CLOCK DOMAIN
-----------------------------------------------------------------------------------------

    cpu_mac_cross_clock_fifo_wrreq <= (not cpu_mac_cross_clock_fifo_full) and (not cpu_rst);

    gen_cpu_mac_cross_clock_count : process(cpu_rst, cpu_clk)
    begin
        if (cpu_rst = '1')then
            cpu_mac_cross_clock_count <= (others => '0');
        elsif (rising_edge(cpu_clk))then
            if (cpu_mac_cross_clock_fifo_wrreq = '1')then
                if (cpu_mac_cross_clock_count = "0100")then
                    cpu_mac_cross_clock_count <= (others => '0');
                else
                    cpu_mac_cross_clock_count <= cpu_mac_cross_clock_count + "0001";
                end if;
            end if;
        end if;
    end process;

    cpu_mac_cross_clock_fifo_din(35 downto 32) <= cpu_mac_cross_clock_count;

    cpu_mac_cross_clock_fifo_din(31 downto 0) <=
    local_mac(31 downto 0) when (cpu_mac_cross_clock_count = "0000") else
    (local_port & local_mac(47 downto 32)) when (cpu_mac_cross_clock_count = "0001") else
    local_ip when (cpu_mac_cross_clock_count = "0010") else
    local_netmask when (cpu_mac_cross_clock_count = "0011") else
    ("00000000000000000000000" & local_enable & local_gateway);

    cross_clock_fifo_36x16_0 : cross_clock_fifo_36x16
    port map(
        wr_rst  => cpu_rst,
        rd_rst  => mac_rst,
        wr_clk  => cpu_clk,
        rd_clk  => mac_clk,
        din     => cpu_mac_cross_clock_fifo_din,
        wr_en   => cpu_mac_cross_clock_fifo_wrreq,
        rd_en   => cpu_mac_cross_clock_fifo_rdreq,
        dout    => cpu_mac_cross_clock_fifo_dout,
        full    => cpu_mac_cross_clock_fifo_full,
        empty   => cpu_mac_cross_clock_fifo_empty);

    cpu_mac_cross_clock_fifo_rdreq <= (not cpu_mac_cross_clock_fifo_empty) and (not mac_rst);

    gen_cpu_mac_cross_clock_fifo_rdreq_z : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            cpu_mac_cross_clock_fifo_rdreq_z <= cpu_mac_cross_clock_fifo_rdreq;
        end if;
    end process;

    gen_local_retimed : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            if (cpu_mac_cross_clock_fifo_rdreq_z = '1')then
                if (cpu_mac_cross_clock_fifo_dout(35 downto 32) = "0000")then
                    local_mac_retimed(31 downto 0) <= cpu_mac_cross_clock_fifo_dout(31 downto 0);
                elsif (cpu_mac_cross_clock_fifo_dout(35 downto 32) = "0001")then
                    local_mac_retimed(47 downto 32) <= cpu_mac_cross_clock_fifo_dout(15 downto 0);
                    local_port_retimed <= cpu_mac_cross_clock_fifo_dout(31 downto 16);
                elsif (cpu_mac_cross_clock_fifo_dout(35 downto 32) = "0010")then
                    local_ip_retimed <= cpu_mac_cross_clock_fifo_dout(31 downto 0);
                elsif (cpu_mac_cross_clock_fifo_dout(35 downto 32) = "0011")then
                    local_netmask_retimed <= cpu_mac_cross_clock_fifo_dout(31 downto 0);
                else
                    local_gateway_retimed <= cpu_mac_cross_clock_fifo_dout(7 downto 0);
                    local_enable_retimed <= cpu_mac_cross_clock_fifo_dout(8);
                end if;
            end if;
        end if;
    end process;

-----------------------------------------------------------------------------------------
-- FIFOS FOR APPLICATION TX PACKET
-----------------------------------------------------------------------------------------

    -- REGISTER INPUTS
    gen_app_tx_valid_z1 : process(app_clk)
    begin
        if (rising_edge(app_clk))then
            app_tx_valid_z1 <= app_tx_valid;
            app_tx_data_z1 <= app_tx_data;
            app_tx_dest_ip_z1 <= app_tx_dest_ip;
            app_tx_dest_port_z1 <= app_tx_dest_port;
            app_tx_end_of_frame_z1 <= app_tx_end_of_frame;
            app_tx_dest_port_z2 <= app_tx_dest_port_z1;
            app_tx_dest_ip_z2 <= app_tx_dest_ip_z1;
        end if;
    end process;

    app_tx_any_valid <= '1' when (app_tx_valid_z1 /= "0000") else '0';

    gen_app_tx_ctrl_fifo_en : process(app_clk)
    begin
        if (rising_edge(app_clk))then
            if ((app_tx_valid_z1 /= "0000")and(app_tx_end_of_frame_z1 = '1'))then
                app_tx_ctrl_fifo_en <= '1';
            else
                app_tx_ctrl_fifo_en <= '0';
            end if;
        end if;
    end process;

    gen_app_tx_end_of_frame_latched : process(app_rst, app_clk)
    begin
        if (app_rst = '1')then
            app_tx_end_of_frame_latched <= '0';
        elsif (rising_edge(app_clk))then
            if (app_tx_end_of_frame = '1')then
                app_tx_end_of_frame_latched <= '1';
            end if;
        end if;
    end process;


    -- RECORD NUMBER OF 256 bit WORDS WRITTEN INTO FIFO
    gen_data_count : process(app_rst, app_clk)
    begin
        if (app_rst = '1')then
            data_count <= (others => '0');
        elsif (rising_edge(app_clk))then
            if (app_tx_ctrl_fifo_en = '1')then
                data_count <= (others => '0');
            else
                if (app_tx_valid_z1 = "1111")then
                    data_count <= data_count + "00000000100";
                elsif (app_tx_valid_z1 = "0111")then
                    data_count <= data_count + "00000000011";
                elsif (app_tx_valid_z1 = "0011")then
                    data_count <= data_count + "00000000010";
                elsif (app_tx_valid_z1 = "0001")then
                    data_count <= data_count + "00000000001";
                end if;
            end if;
        end if;
    end process;

    -- SINGLE FIFO, JUMBO FIFO SUPPORT ALWAYS ENABLED
    --app_tx_data_din <= app_tx_valid_z1 & app_tx_data_z1;
    app_tx_data_din <= app_tx_end_of_frame_z1 & "000" & app_tx_valid_z1 & app_tx_data_z1;

    --AI: Deassert write when FIFO full and reset asserted
    app_tx_data_wrreq <= app_tx_any_valid and (not app_tx_data_full) and (not app_rst);
    app_tx_data_overflow <= app_tx_any_valid and app_tx_data_full;

    gen_app_tx_data_wrreq_latched : process(app_rst, app_clk)
    begin
        if (app_rst = '1')then
            app_tx_data_wrreq_latched <= '0';
        elsif (rising_edge(app_clk))then
            if (app_tx_data_wrreq = '1')then
                app_tx_data_wrreq_latched <= '1';
            end if;
        end if;
    end process;

    ska_tx_packet_fifo_0 : ska_tx_packet_fifo
    port map(
        wr_rst      => app_rst,
        rd_rst      => mac_rst,
        wr_clk      => app_clk,
        rd_clk      => mac_clk,
        din         => app_tx_data_din,
        wr_en       => app_tx_data_wrreq,
        rd_en       => app_tx_data_rdreq,
        dout        => app_tx_data_dout,
        full        => app_tx_data_full,
        overflow    => open,
        empty       => app_tx_data_empty,
        prog_full   => app_tx_data_afull);

    --AI: Deassert read when FIFO empty and reset asserted
    app_tx_data_rdreq <= app_tx_data_rd and (not app_tx_data_empty) and (not mac_rst);

    payload0 <= app_tx_data_dout(63 downto 0);
    payload1 <= app_tx_data_dout(127 downto 64);
    payload2 <= app_tx_data_dout(191 downto 128);
    payload3 <= app_tx_data_dout(255 downto 192);
    payload_valid <= app_tx_data_dout(259 downto 256);
    payload_end_of_frame <= app_tx_data_dout(263);

    gen_payload_z1 : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            payload0_z1 <= payload0;
            payload1_z1 <= payload1;
            payload2_z1 <= payload2;
            payload3_z1 <= payload3;
            payload_valid_z1 <= payload_valid;
            payload_end_of_frame_z1 <= payload_end_of_frame;
        end if;
    end process;

    -- CONTROL FIFO TO MOVE IP, PORT AND PACKET COUNT TO MAC CLOCK DOMAIN
    -- AI: Deassert write when FIFO full and reset asserted
    app_tx_ctrl_wrreq <= app_tx_ctrl_fifo_en and (not app_tx_ctrl_full) and (not app_rst);

    app_tx_ctrl_din(31 downto 0) <= app_tx_dest_ip_z2;
    app_tx_ctrl_din(47 downto 32) <= app_tx_dest_port_z2;
    app_tx_ctrl_din(58 downto 48) <= data_count;
    app_tx_ctrl_din(63 downto 59) <= (others => '0');

    gen_app_tx_ctrl_wrreq_latched : process(app_rst, app_clk)
    begin
        if (app_rst = '1')then
            app_tx_ctrl_wrreq_latched <= '0';
        elsif (rising_edge(app_clk))then
            if (app_tx_ctrl_wrreq = '1')then
                app_tx_ctrl_wrreq_latched <= '1';
            end if;
        end if;
    end process;


    ska_tx_packet_ctrl_fifo_0 : ska_tx_packet_ctrl_fifo
    port map(
        wr_rst      => app_rst,
        rd_rst      => mac_rst,
        wr_clk      => app_clk,
        rd_clk      => mac_clk,
        din         => app_tx_ctrl_din,
        wr_en       => app_tx_ctrl_wrreq,
        rd_en       => app_tx_ctrl_rdreq,
        dout        => app_tx_ctrl_dout,
        full        => app_tx_ctrl_full,
        overflow    => app_tx_ctrl_overflow,
        empty       => app_tx_ctrl_empty,
        prog_full   => app_tx_ctrl_afull);

   --AI: Deassert read when FIFO empty and reset asserted
    app_tx_ctrl_rdreq <= app_tx_ctrl_rd and (not app_tx_ctrl_empty) and (not mac_rst);

    gen_app_tx_afull : process(app_rst, app_clk)
    begin
    if (app_rst = '1') then
        app_tx_afull <= '0';
        elsif (rising_edge(app_clk))then
            app_tx_afull <= app_tx_data_afull or app_tx_ctrl_afull;
        end if;
    end process;

    gen_app_tx_overflow : process(app_rst, app_clk)
    begin
        if (app_rst = '1')then
            tx_overflow_latch <= '0';
        elsif (rising_edge(app_clk))then
            if ((app_tx_data_overflow = '1')or(app_tx_ctrl_overflow = '1'))then
                tx_overflow_latch <= '1';
            end if;
        end if;
    end process;

    app_tx_overflow <= tx_overflow_latch;

    gen_app_tx_ctrl_rdreq_z : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            app_tx_ctrl_rdreq_z <= app_tx_ctrl_rdreq;
        end if;
    end process;

    gen_dest_ip_port : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            dest_ip <= app_tx_ctrl_dout(31 downto 0);
            dest_port <= app_tx_ctrl_dout(47 downto 32);
            tx_total_size <= app_tx_ctrl_dout(58 downto 48);
            ip_length <= ("00" & app_tx_ctrl_dout(58 downto 48) & "000") + X"001C"; -- ADD 28
            udp_length <= ("00" & app_tx_ctrl_dout(58 downto 48) & "000") + X"0008"; -- ADD 8
        end if;
    end process;

-----------------------------------------------------------------------------------------
-- ARP CACHE
-----------------------------------------------------------------------------------------

    arp_cache_wr_en_a(0) <= arp_cache_wr_en;

--  gen_arp_cache_write_error_i : process(cpu_rst, cpu_clk)
--  begin
--        if (cpu_rst = '1')then
--            arp_cache_write_error_i <= (others => '0');
--        elsif (rising_edge(cpu_clk))then
--            if (arp_cache_wr_en = '1')then
--                if (arp_cache_wr_data(47 downto 8) /= X"0650010101")then
--                    arp_cache_write_error_i <= arp_cache_write_error_i + X"01";
--              end if;
--            end if;
--        end if;
--  end process;

--  arp_cache_write_error <= arp_cache_write_error_i;

    arp_cache_0 : arp_cache
    port map(
        clka    => cpu_clk,
        wea     => arp_cache_wr_en_a,
        addra   => arp_cache_addr,
        dina    => arp_cache_wr_data,
        douta   => arp_cache_rd_data,
        clkb    => mac_clk,
        web     => (others => '0'),
        addrb   => packet_arp_cache_addr,
        dinb    => (others => '0'),
        doutb   => packet_arp_cache_data);

--    gen_arp_cache_read_error_i : process(mac_rst, mac_clk)
--    begin
--        if (mac_rst = '1')then
--            arp_cache_read_error_i <= (others => '0');
--        elsif (rising_edge(mac_clk))then
--            if (packet_arp_cache_data(47 downto 8) /= X"0650010101")then
--                arp_cache_read_error_i <= arp_cache_read_error_i + X"01";
--            end if;
--        end if;
--    end process;

--    arp_cache_read_error <= arp_cache_read_error_i;

    pCDCLocalRegSynchroniser : process(mac_rst, mac_clk)
    begin
       if (mac_rst = '1') then
         sBusLocalRegValid <= '0';
         sBusLocalRegValidD1 <= '0';
         sLocalIp <= FABRIC_IP;
         sLocalNetmask <= FABRIC_NETMASK;
         sLocalGateWay <= FABRIC_GATEWAY;
       elsif (rising_edge(mac_clk))then
           sBusLocalRegValidD1 <= sBusLocalRegValid;
           sBusLocalRegValid <= '1';
           if (sBusLocalRegValidD1 = '1') then
	     sLocalIp <= local_ip;
	     sLocalNetmask <= local_netmask;
	     sLocalGateWay <= local_gateway;
	   end if;  
       end if;
    end process pCDCLocalRegSynchroniser;  
    
    gen_dest_mac : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            dest_mac <= packet_arp_cache_data;
        end if;
    end process;

--    gen_packet_arp_cache_addr : process(mac_clk)
--    begin
--        if (rising_edge(mac_clk))then
--            if (dest_ip(31 downto 8) /= local_ip(31 downto 8))then
--                packet_arp_cache_addr <= local_gateway;
--            else
--                packet_arp_cache_addr <= dest_ip(7 downto 0);
--            end if;
--        end if;
--    end process;

    --packet_arp_cache_addr <= local_gateway when ((dest_ip and local_netmask) /= (local_ip and local_netmask)) else dest_ip(7 downto 0);
    packet_arp_cache_addr <= sLocalGateWay when ((dest_ip and sLocalNetmask) /= (sLocalIp and sLocalNetmask)) else dest_ip(7 downto 0);

    --packet_arp_cache_addr <= local_gateway when (dest_ip(31 downto 8) /= local_ip(31 downto 8)) else dest_ip(7 downto 0);

-----------------------------------------------------------------------------------------
-- CPU TX BUFFER
-----------------------------------------------------------------------------------------

    -- READBACK OF CPU TX BUFFER CURRENTLY NOT SUPPORTED
    cpu_tx_buffer_rd_data <= (others => '0');

    gen_cpu_tx_buffer_wr_en_z1 : process(cpu_clk)
    begin
        if (rising_edge(cpu_clk))then
            cpu_tx_buffer_wr_en_z1 <= cpu_tx_buffer_wr_en;
        end if;
    end process;

    gen_cpu_tx_buffer_dina : process(cpu_rst, cpu_clk)
    begin
        if (cpu_rst = '1')then
            cpu_tx_buffer_dina <= (others => '0');
            cpu_tx_buffer_wea(0) <= '0';
            cpu_tx_buffer_addra <= (others => '0');
            cpu_first_word <= '1';
            cpu_outstanding <= '0';
        elsif (rising_edge(cpu_clk))then
            --cpu_tx_buffer_addra(8 downto 7) <= (others => '0');
            --cpu_tx_buffer_addra(6) <= cpu_buf_select;
            cpu_tx_buffer_addra(9) <= '0';
            cpu_tx_buffer_addra(8) <= cpu_buf_select;
            cpu_tx_buffer_wea(0) <= '0';
            if ((cpu_tx_buffer_wr_en = '1')and(cpu_tx_buffer_wr_en_z1 = '0'))then
                if (cpu_tx_buffer_addr(1 downto 0) = "00")then
                    --cpu_tx_buffer_addra(5 downto 0) <= cpu_tx_buffer_addr(7 downto 2);
                    cpu_tx_buffer_addra(7 downto 0) <= cpu_tx_buffer_addr(9 downto 2);
                    cpu_tx_buffer_dina(63 downto 0) <= cpu_tx_buffer_wr_data;
                    cpu_tx_buffer_dina(256) <= '1';
                    cpu_outstanding <= '1';
                elsif (cpu_tx_buffer_addr(1 downto 0) = "01")then
                    cpu_tx_buffer_dina(127 downto 64) <= cpu_tx_buffer_wr_data;
                    cpu_tx_buffer_dina(257) <= '1';
                elsif (cpu_tx_buffer_addr(1 downto 0) = "10")then
                    cpu_tx_buffer_dina(191 downto 128) <= cpu_tx_buffer_wr_data;
                    cpu_tx_buffer_dina(258) <= '1';
                else
                    cpu_tx_buffer_dina(255 downto 192) <= cpu_tx_buffer_wr_data;
                    cpu_tx_buffer_dina(259) <= '1';
                    if (cpu_first_word = '1')then
                        cpu_first_word <= '0';
                    else
                        cpu_tx_buffer_wea(0) <= '1';
                        cpu_outstanding <= '0';
                    end if;
                end if;
            end if;

            -- HANDLE ANY INCOMPLETE 256 bit WORDS
            if ((cpu_tx_ready = '1')and(cpu_outstanding = '1'))then
                cpu_tx_buffer_wea(0) <= '1';
                cpu_outstanding <= '0';
            end if;

            -- AFTER WRITTEN OUT 256 bit WORD, CLEAR
            if (cpu_tx_buffer_wea(0) = '1')then
                cpu_first_word <= '1';
                cpu_tx_buffer_dina <= (others => '0');
            end if;

        end if;
    end process;

    generate_cpu_tx : if USE_CPU_TX = 1 generate
      ska_cpu_buffer_0 : ska_cpu_buffer
      port map(
          clka    => cpu_clk,
          wea     => cpu_tx_buffer_wea,
          addra   => cpu_tx_buffer_addra,
          dina    => cpu_tx_buffer_dina,
          douta   => cpu_tx_buffer_douta,
          clkb    => mac_clk,
          web     => (others => '0'),
          addrb   => cpu_tx_buffer_addrb,
          dinb    => (others => '0'),
          doutb   => cpu_tx_buffer_doutb);
    end generate generate_cpu_tx;

    generate_nocpu_tx : if USE_CPU_TX = 0 generate
      cpu_tx_buffer_douta <= (others => '0');
      cpu_tx_buffer_doutb <= (others => '0');
    end generate generate_nocpu_tx;

    --cpu_tx_buffer_addrb(8 downto 7) <= (others => '0');
    --cpu_tx_buffer_addrb(6) <= not cpu_buf_select;
    cpu_tx_buffer_addrb(9) <= '0';
    cpu_tx_buffer_addrb(8) <= not cpu_buf_select_z2;--cpu_buf_select;
    cpu_tx_buffer_addrb(7 downto 0) <= mac_cpu_addr;

    cpu_payload0 <= cpu_tx_buffer_doutb(63 downto 0);
    cpu_payload1 <= cpu_tx_buffer_doutb(127 downto 64);
    cpu_payload2 <= cpu_tx_buffer_doutb(191 downto 128);
    cpu_payload3 <= cpu_tx_buffer_doutb(255 downto 192);
    cpu_payload_valid <= cpu_tx_buffer_doutb(259 downto 256);

    gen_cpu_buf_select : process(cpu_rst, cpu_clk)
    begin
        if (cpu_rst = '1')then
            cpu_buf_select <= '0';
            mac_pending <= '0';
            ack_low_wait <= '0';
            cpu_tx_size_reg <= (others => '0');
            mac_cpu_ack_z1 <= '0';
            mac_cpu_ack_z2 <= '0';
        elsif (rising_edge(cpu_clk))then
            mac_cpu_ack_z1 <= mac_cpu_ack;
            mac_cpu_ack_z2 <= mac_cpu_ack_z1;

            if (ack_low_wait = '0')then
                if ((mac_pending = '0')and(cpu_tx_ready = '1'))then
                    mac_pending <= '1';
                    cpu_buf_select <= not cpu_buf_select;
                    cpu_tx_size_reg <= cpu_tx_size;
                end if;

                if (mac_cpu_ack_z2 = '1')then
                    mac_pending <= '0';
                    ack_low_wait <= '1';
                end if;
            else
                if (mac_cpu_ack_z2 = '0')then
                    ack_low_wait <= '0';
                end if;

            end if;
        end if;
    end process;

    cpu_tx_done <= (not ack_low_wait) and (not mac_pending) and cpu_tx_ready;

    gen_mac_pending_z : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            cpu_buf_select_z1  <= cpu_buf_select;
            cpu_buf_select_z2 <= cpu_buf_select_z1;
        end if;
    end process;
    
    gen_cpu_buf_sel_z : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            mac_pending_z1  <= mac_pending;
            mac_pending_z2 <= mac_pending_z1;
        end if;
    end process;

    mac_cpu_size <= cpu_tx_size_reg;
    mac_cpu_pending <= mac_pending_z2;

-----------------------------------------------------------------------------------------
-- MOVE tx_overflow_latch TO mac_clk
-----------------------------------------------------------------------------------------

    gen_app_overflow_retimed : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            app_overflow_z1 <= tx_overflow_latch;
            app_overflow_retimed <= app_overflow_z1;
        end if;
    end process;

-----------------------------------------------------------------------------------------
-- IP HEADER CHECKSUM CALCULATION
-----------------------------------------------------------------------------------------

    gen_ip_checksum : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            ip_checksum_0 <=
            ("00" & X"4500") +
            ("00" & ip_length) +
            ("00" & X"0000") +
            ("00" & X"4000") +
            ("00" & tx_ip_ttl & X"11") +
            ("00" & local_ip_retimed(15 downto 0)) +
            ("00" & local_ip_retimed(31 downto 16)) +
            ("00" & dest_ip(15 downto 0)) +
            ("00" & dest_ip(31 downto 16));
            ip_checksum <= not(ip_checksum_1(15 downto 0) + ("000000000000000" & ip_checksum_1(16)));
        end if;
    end process;

    -- PUT OUTSIDE REGISTERING TO SAVE 1 CLOCK CYCLE
    ip_checksum_1 <= ('0' & ip_checksum_0(15 downto 0)) + ("000000000000000" & ip_checksum_0(17 downto 16));



-----------------------------------------------------------------------------------------
-- Test write EOF Counters to app_clk
-----------------------------------------------------------------------------------------

        write_eof_count : process(app_rst, app_clk, app_tx_end_of_frame_z1)
        begin
            if (app_rst = '1') then
                write_eof_data_cnt <= (others => '0');
            elsif (rising_edge(app_clk))then
                if(app_tx_end_of_frame_z1 = '1') then
                   write_eof_data_cnt <= write_eof_data_cnt + '1';
                end if;
            end if;
        end process;

        write_eof_ctrl_count : process(app_rst, app_clk, app_tx_ctrl_fifo_en)
        begin
            if (app_rst = '1') then
                write_eof_data_ctrl_cnt <= (others => '0');
            elsif (rising_edge(app_clk))then
                if(app_tx_ctrl_fifo_en = '1') then
                   write_eof_data_ctrl_cnt <= write_eof_data_ctrl_cnt + '1';
                end if;
            end if;
        end process;


-----------------------------------------------------------------------------------------
-- STATE MACHINE TO CONSTRUCT UDP/IP PACKET
-----------------------------------------------------------------------------------------

    gen_current_tx_packet_state : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            mac_cpu_ack <= '0';
            tx_size <= (others => '0');
            app_tx_data_rd <= '0';
            current_tx_packet_state <= IDLE;
            current_tx_packet_state_z1 <= IDLE;
            mac_cpu_addr <= (others => '0');
            tx_ip_ttl <= TTL;
            eof_flag_activate <= '0';
            read_eof_data_ctrl_cnt <= (others => '0');
            read_eof_data_cnt <= (others => '0');
            misalign_cond1_count <= (others => '0');
            misalign_cond2_count <= (others => '0');
        elsif (rising_edge(mac_clk))then
            current_tx_packet_state_z1 <= current_tx_packet_state;

            app_tx_data_rd <= '0';

            if (mac_cpu_pending = '0')then
                mac_cpu_ack <= '0';
            end if;

            case current_tx_packet_state is
                when IDLE =>
                current_tx_packet_state <= IDLE;

                tx_ip_ttl <= TTL;

                if ((app_tx_ctrl_empty = '0')and(local_enable_retimed = '1')and(app_overflow_retimed = '0'))then
                    current_tx_packet_state <= READ_CTRL_FIFO_DELAY_1;
                end if;

                if ((mac_cpu_pending = '1')and(mac_cpu_ack = '0')and(mac_tx_ready = '1'))then
                    mac_cpu_addr <= (others => '0');
                    --tx_size <= "000" & mac_cpu_size;
                    tx_size <= mac_cpu_size;
                    current_tx_packet_state <= CPU_TX_START;
                end if;

                when READ_CTRL_FIFO_DELAY_1 =>
                current_tx_packet_state <= READ_CTRL_FIFO_DELAY_2;

                when READ_CTRL_FIFO_DELAY_2 =>
                tx_size <= tx_total_size;
                current_tx_packet_state <= READ_CTRL_FIFO_DELAY_2;

                if (mac_tx_ready = '1')then

                    if (dest_ip(31 downto 28) = "1110")then
                        current_tx_packet_state <= GEN_HEADER_1_MULTICAST;
                    else
                        current_tx_packet_state <= GEN_HEADER_1;
                    end if;
                end if;

                when GEN_HEADER_1 =>

                app_tx_data_rd <= '1';

                current_tx_packet_state <= GEN_HEADER_2_PAYLOAD_START;

                when GEN_HEADER_1_MULTICAST =>
                app_tx_data_rd <= '1';

                current_tx_packet_state <= GEN_HEADER_2_PAYLOAD_START;

                when GEN_HEADER_2_PAYLOAD_START =>

                if (tx_size = "00000000011")then
                    current_tx_packet_state <= GEN_PAYLOAD_FINISH_3;
                elsif (tx_size = "00000000100")then
                    current_tx_packet_state <= GEN_PAYLOAD_FINISH_4;
                elsif (tx_size = "00000000101")then
                    app_tx_data_rd <= '1';
                    current_tx_packet_state <= GEN_PAYLOAD_FINISH_5;
                elsif (tx_size = "00000000110")then
                    app_tx_data_rd <= '1';
                    current_tx_packet_state <= GEN_PAYLOAD_FINISH_6;
                else
                    app_tx_data_rd <= '1';
                    tx_size <= tx_size - "00000000100";
                    current_tx_packet_state <= GEN_PAYLOAD;
                end if;
                read_eof_data_ctrl_cnt <= read_eof_data_ctrl_cnt + '1';
                eof_flag_activate <= '0';

                when GEN_PAYLOAD =>
                if (tx_size = "00000000011")then
                    --AI: if tx_size is misaligned by 1 clock cycle from TX Data FIFO then assert TX Data Packet Read
                    if (payload_end_of_frame = '1') then
                      app_tx_data_rd <= '0';
                    else
                      misalign_cond1_count <= misalign_cond1_count + '1';
                      app_tx_data_rd <= '1';
                    end if;
                    current_tx_packet_state <= GEN_PAYLOAD_FINISH_3;
                elsif (tx_size = "00000000100")then
                    --AI: if tx_size is misaligned by 1 clock cycle from TX Data FIFO then assert TX Data Packet Read
                    if (payload_end_of_frame = '1') then
                      app_tx_data_rd <= '0';
                    else
                      misalign_cond2_count <= misalign_cond2_count + '1';
                      app_tx_data_rd <= '1';
                    end if;
                    current_tx_packet_state <= GEN_PAYLOAD_FINISH_4;
                elsif (tx_size = "00000000101")then
                    app_tx_data_rd <= '1';
                    current_tx_packet_state <= GEN_PAYLOAD_FINISH_5;
                elsif (tx_size = "00000000110")then
                    app_tx_data_rd <= '1';
                    current_tx_packet_state <= GEN_PAYLOAD_FINISH_6;
                else
                    app_tx_data_rd <= '1';
                    tx_size <= tx_size - "00000000100";
                    current_tx_packet_state <= GEN_PAYLOAD;
                end if;

                when GEN_PAYLOAD_FINISH_3 =>
                current_tx_packet_state <= IDLE;

                when GEN_PAYLOAD_FINISH_4 =>
                current_tx_packet_state <= IDLE;

                when GEN_PAYLOAD_FINISH_5 =>
                current_tx_packet_state <= IDLE;

                when GEN_PAYLOAD_FINISH_6 =>
                current_tx_packet_state <= IDLE;

                when CPU_TX_START =>
                mac_cpu_addr <= mac_cpu_addr + "00000001";

                if (tx_size > "00000000100")then
                    tx_size <= tx_size - "00000000100";
                    current_tx_packet_state <= CPU_TX_PAYLOAD;
                else
                    current_tx_packet_state <= CPU_TX_FINISH;
                end if;

                when CPU_TX_PAYLOAD =>
                mac_cpu_addr <= mac_cpu_addr + "00000001";

                if (tx_size > "00000000100")then
                    tx_size <= tx_size - "00000000100";
                    current_tx_packet_state <= CPU_TX_PAYLOAD;
                else
                    current_tx_packet_state <= CPU_TX_FINISH;
                end if;

                when CPU_TX_FINISH =>
                mac_cpu_ack <= '1';

                current_tx_packet_state <= IDLE;

            end case;

            --AI: 2/11/2017: Allows read state machine to synchronise with TX Data Packet FIFO
            --Only providing for GEN_PAYLOAD_FINISH_4 now, SKA-SA will always send 256 bits per
            --a transaction (4 x 64 bits words) and hence, tx_size will always end at 0x4. Provision
            --has been made for 4 data valids, but in reality all 4 data valids will be asserted at once. This
            --could of been coded with 1 data valid.
            if (payload_end_of_frame = '1' and  eof_flag_activate = '0') then
                current_tx_packet_state <= GEN_PAYLOAD_FINISH_4;
                eof_flag_activate <= '1';
                app_tx_data_rd <= '0';
                read_eof_data_cnt <= read_eof_data_cnt + '1';
            end if;

        end if;
    end process;

    app_tx_ctrl_rd <= '1' when (current_tx_packet_state = GEN_HEADER_2_PAYLOAD_START) else '0';
    mac_tx_start_i <= '1' when (((current_tx_packet_state = READ_CTRL_FIFO_DELAY_2)and(mac_tx_ready = '1'))or(current_tx_packet_state = CPU_TX_START)) else '0';
    payload_finish_state <= '1' when
    ((current_tx_packet_state = GEN_PAYLOAD_FINISH_3)or
    (current_tx_packet_state = GEN_PAYLOAD_FINISH_4)or
    (current_tx_packet_state = GEN_PAYLOAD_FINISH_5)or
    (current_tx_packet_state = GEN_PAYLOAD_FINISH_6)) else '0';

    mac_tx_data_valid_fabric_i <=
    X"FFFFFFFF" when
        ((current_tx_packet_state = GEN_HEADER_1)or
        (current_tx_packet_state = GEN_HEADER_1_MULTICAST)or
        (current_tx_packet_state = GEN_HEADER_2_PAYLOAD_START)or
        (current_tx_packet_state = GEN_PAYLOAD)) else
    X"00000003" when
        (current_tx_packet_state = GEN_PAYLOAD_FINISH_3)else
    X"000003FF" when
        (current_tx_packet_state = GEN_PAYLOAD_FINISH_4)else
    X"0003FFFF" when
        (current_tx_packet_state = GEN_PAYLOAD_FINISH_5)else
    X"03FFFFFF" when
        (current_tx_packet_state = GEN_PAYLOAD_FINISH_6)else
    X"00000000";

    -- {dest_ip[2], dest_ip[3], src_ip[0], src_ip[1], src_ip[2], src_ip[3], ip_checksum[0], ip_checksum[1],
    -- {payload2[2], payload2[3], payload2[4], payload2[5], payload2[6], payload2[7], payload1[0], payload1[1]}
    mac_tx_data_fabric_i(255 downto 192) <=
    (dest_ip(23 downto 16) & dest_ip(31 downto 24) & local_ip_retimed(7 downto 0) & local_ip_retimed(15 downto 8) & local_ip_retimed(23 downto 16) & local_ip_retimed(31 downto 24) & ip_checksum(7 downto 0) & ip_checksum(15 downto 8)) when ((current_tx_packet_state = GEN_HEADER_1)or(current_tx_packet_state = GEN_HEADER_1_MULTICAST)) else
    (payload2(23 downto 16) & payload2(31 downto 24) & payload2(39 downto 32) & payload2(47 downto 40) & payload2(55 downto 48) & payload2(63 downto 56) & payload1(7 downto 0) & payload1(15 downto 8)) when (current_tx_packet_state = GEN_HEADER_2_PAYLOAD_START) else
    (payload2(23 downto 16) & payload2(31 downto 24) & payload2(39 downto 32) & payload2(47 downto 40) & payload2(55 downto 48) & payload2(63 downto 56) & payload1(7 downto 0) & payload1(15 downto 8)) when ((current_tx_packet_state = GEN_PAYLOAD)or(payload_finish_state = '1')) else
    (others => '0');

    -- {protocol(UDP), TTL, frag_offset[0], flags, ID[0], ID[1], ipsize[0], ipsize[1]}
    -- {payload1[2], payload1[3], payload1[4], payload1[5], payload1[6], payload1[7], payload0[0], payload0[1]}
    mac_tx_data_fabric_i(191 downto 128) <=
    (X"11" & tx_ip_ttl & X"00" & X"40" & X"00" & X"00" & ip_length(7 downto 0) & ip_length(15 downto 8)) when ((current_tx_packet_state = GEN_HEADER_1)or(current_tx_packet_state = GEN_HEADER_1_MULTICAST)) else
    (payload1(23 downto 16) & payload1(31 downto 24) & payload1(39 downto 32) & payload1(47 downto 40) & payload1(55 downto 48) & payload1(63 downto 56) & payload0(7 downto 0) & payload0(15 downto 8)) when (current_tx_packet_state = GEN_HEADER_2_PAYLOAD_START) else
    (payload1(23 downto 16) & payload1(31 downto 24) & payload1(39 downto 32) & payload1(47 downto 40) & payload1(55 downto 48) & payload1(63 downto 56) & payload0(7 downto 0) & payload0(15 downto 8)) when ((current_tx_packet_state = GEN_PAYLOAD)or(payload_finish_state = '1')) else
    (others => '0');

    -- {IP Type, IP version, Ethetype[0], Ethertype[1], src_mac[0], src_mac[1], src_mac[2], src_mac[3]}
    -- {payload0[2], payload0[3], payload0[4], payload0[5], payload0[6], payload0[7], no udp checksum}
    mac_tx_data_fabric_i(127 downto 64) <=
    (X"00" & X"45" & X"00" & X"08"& local_mac_retimed(7 downto 0) & local_mac_retimed(15 downto 8) & local_mac_retimed(23 downto 16) & local_mac_retimed(31 downto 24)) when ((current_tx_packet_state = GEN_HEADER_1)or(current_tx_packet_state = GEN_HEADER_1_MULTICAST)) else
    (payload0(23 downto 16) & payload0(31 downto 24) & payload0(39 downto 32) & payload0(47 downto 40) & payload0(55 downto 48) & payload0(63 downto 56) & X"0000") when (current_tx_packet_state = GEN_HEADER_2_PAYLOAD_START) else
    (payload0(23 downto 16) & payload0(31 downto 24) & payload0(39 downto 32) & payload0(47 downto 40) & payload0(55 downto 48) & payload0(63 downto 56) & payload3_z1(7 downto 0) & payload3_z1(15 downto 8)) when ((current_tx_packet_state = GEN_PAYLOAD)or(payload_finish_state = '1')) else
    (others => '0');

    --{src_mac[4], src_mac[5], dest_mac[0], dest_mac[1] dest_mac[2], dest_mac[3], dest_mac[4], dest_mac[5]}
    -- MULTICAST : {src_mac[4], src_mac[5], dest_ip[0], dest_ip[1], '0', dest_ip[22:16] 8'b01011110, 8'b00000000, 8'b00000001}
    --{udp_length[0], udp_length[1], dest_port[0], dest_port[1], src_port[0], src_port[1], dest_ip[0], dest_ip[1]}
    mac_tx_data_fabric_i(63 downto 0) <=
    (local_mac_retimed(39 downto 32) & local_mac_retimed(47 downto 40) & dest_mac(7 downto 0) & dest_mac(15 downto 8) & dest_mac(23 downto 16) & dest_mac(31 downto 24) & dest_mac(39 downto 32) & dest_mac(47 downto 40)) when (current_tx_packet_state = GEN_HEADER_1) else
    (local_mac_retimed(39 downto 32) & local_mac_retimed(47 downto 40) & dest_ip(7 downto 0) & dest_ip(15 downto 8) & '0' & dest_ip(22 downto 16) & "01011110" & "00000000" & "00000001") when (current_tx_packet_state = GEN_HEADER_1_MULTICAST) else
    (udp_length(7 downto 0) & udp_length(15 downto 8) & dest_port(7 downto 0) & dest_port(15 downto 8) & local_port_retimed(7 downto 0) & local_port_retimed(15 downto 8) & dest_ip(7 downto 0) & dest_ip(15 downto 8)) when (current_tx_packet_state = GEN_HEADER_2_PAYLOAD_START) else
    (payload3_z1(23 downto 16) & payload3_z1(31 downto 24) & payload3_z1(39 downto 32) & payload3_z1(47 downto 40) & payload3_z1(55 downto 48) & payload3_z1(63 downto 56) & payload2_z1(7 downto 0) & payload2_z1(15 downto 8)) when ((current_tx_packet_state = GEN_PAYLOAD)or(payload_finish_state = '1')) else
    (others => '0');

    gen_mac_fabric : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            mac_tx_data_fabric <= mac_tx_data_fabric_i;
            mac_tx_data_valid_fabric <= mac_tx_data_valid_fabric_i;
        end if;
    end process;

    mac_tx_data_valid_cpu_i(31 downto 24) <=
    X"FF" when (cpu_payload_valid(3) = '1') else X"00";

    mac_tx_data_valid_cpu_i(23 downto 16) <=
    X"FF" when (cpu_payload_valid(2) = '1') else X"00";

    mac_tx_data_valid_cpu_i(15 downto 8) <=
    X"FF" when (cpu_payload_valid(1) = '1') else X"00";

    mac_tx_data_valid_cpu_i(7 downto 0) <=
    X"FF" when (cpu_payload_valid(0) = '1') else X"00";

    mac_tx_data_cpu_i(255 downto 192) <=
    (cpu_payload3(7 downto 0) & cpu_payload3(15 downto 8) & cpu_payload3(23 downto 16) & cpu_payload3(31 downto 24) & cpu_payload3(39 downto 32) & cpu_payload3(47 downto 40) & cpu_payload3(55 downto 48) & cpu_payload3(63 downto 56));

    mac_tx_data_cpu_i(191 downto 128) <=
    (cpu_payload2(7 downto 0) & cpu_payload2(15 downto 8) & cpu_payload2(23 downto 16) & cpu_payload2(31 downto 24) & cpu_payload2(39 downto 32) & cpu_payload2(47 downto 40) & cpu_payload2(55 downto 48) & cpu_payload2(63 downto 56));

    mac_tx_data_cpu_i(127 downto 64) <=
    (cpu_payload1(7 downto 0) & cpu_payload1(15 downto 8) & cpu_payload1(23 downto 16) & cpu_payload1(31 downto 24) & cpu_payload1(39 downto 32) & cpu_payload1(47 downto 40) & cpu_payload1(55 downto 48) & cpu_payload1(63 downto 56));

    mac_tx_data_cpu_i(63 downto 0) <=
    (cpu_payload0(7 downto 0) & cpu_payload0(15 downto 8) & cpu_payload0(23 downto 16) & cpu_payload0(31 downto 24) & cpu_payload0(39 downto 32) & cpu_payload0(47 downto 40) & cpu_payload0(55 downto 48) & cpu_payload0(63 downto 56));

    gen_mac_cpu : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            mac_tx_data_cpu <= mac_tx_data_cpu_i;
            mac_tx_data_valid_cpu <= mac_tx_data_valid_cpu_i;
        end if;
    end process;

    mac_tx_data_i <= mac_tx_data_cpu when
    ((current_tx_packet_state_z1 = CPU_TX_PAYLOAD)or
    (current_tx_packet_state_z1 = CPU_TX_FINISH)) else mac_tx_data_fabric;

    mac_tx_data_valid_i <= mac_tx_data_valid_cpu when
    ((current_tx_packet_state_z1 = CPU_TX_PAYLOAD)or
    (current_tx_packet_state_z1 = CPU_TX_FINISH)) else mac_tx_data_valid_fabric;

    -- REMOVE OUTPUT REGISTERING TO REDUCE LATENCY
    gen_mac_out : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            mac_tx_start_z1 <= mac_tx_start_i;
--            mac_tx_start <= mac_tx_start_z1;
--            mac_tx_data <= mac_tx_data_i;
--            mac_tx_data_valid <= mac_tx_data_valid_i;
        end if;
    end process;

    mac_tx_start <= mac_tx_start_z1;
    mac_tx_data <= mac_tx_data_i;
    mac_tx_data_valid <= mac_tx_data_valid_i;

end arch_ska_fge_tx;
