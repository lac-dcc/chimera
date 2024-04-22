----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: ska_fge_rx - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- SKA 40GBE RX path
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

entity ska_fge_rx is
    generic (
    PROMISC_MODE    : integer;
    USE_CPU_RX      : integer := 1);

    port (
    -- Local parameters
    local_enable    : in std_logic;
    local_mac       : in std_logic_vector(47 downto 0);
    local_ip        : in std_logic_vector(31 downto 0);
    local_port      : in std_logic_vector(15 downto 0);
    local_gateway   : in std_logic_vector(7 downto 0);
    local_mc_recv_ip        : in std_logic_vector(31 downto 0);
    local_mc_recv_ip_mask   : in std_logic_vector(31 downto 0);

    -- Application Interface
    app_clk                 : in std_logic;
    app_rst                 : in std_logic;
    app_rx_valid            : out std_logic_vector(3 downto 0);
    app_rx_end_of_frame     : out std_logic;
    app_rx_data             : out std_logic_vector(255 downto 0);
    app_rx_source_ip        : out std_logic_vector(31 downto 0);
    app_rx_source_port      : out std_logic_vector(15 downto 0);
    app_rx_dest_ip          : out std_logic_vector(31 downto 0);
    app_rx_dest_port        : out std_logic_vector(15 downto 0);
    app_rx_bad_frame        : out std_logic;
    app_rx_overrun          : out std_logic;
    app_rx_overrun_ack      : in std_logic;
    app_rx_ack              : in std_logic;

    -- CPU Interface
    cpu_clk                 : in std_logic;
    cpu_rst                 : in std_logic;
    cpu_rx_buffer_addr      : in std_logic_vector(10 downto 0);
    cpu_rx_buffer_rd_data   : out std_logic_vector(63 downto 0);
    cpu_rx_size             : out std_logic_vector(10 downto 0);
    cpu_rx_ack              : in std_logic;

    -- MAC Interface
    mac_clk             : in std_logic;
    mac_rst             : in std_logic;
    mac_rx_data         : in std_logic_vector(255 downto 0);
    mac_rx_data_valid   : in std_logic_vector(31 downto 0);
    mac_rx_good_frame   : in std_logic;
    mac_rx_bad_frame    : in std_logic;

    -- PHY status
    phy_rx_up           : in std_logic;

    debug_port : out std_logic_vector(7 downto 0));
end ska_fge_rx;

architecture arch_ska_fge_rx of ska_fge_rx is

    type T_RX_PACKET_STATE is (
    IDLE,
    REC_HEADER_2_PAYLOAD_START,
    REC_PAYLOAD);

    type T_CPU_STATE is (
    CPU_BUFFERING,
    CPU_WAIT);

    type T_APP_STATE is (
    APP_RUN,
    APP_OVER,
    APP_WAIT);

    type T_CPU_READ_STATE is (
    CPU_READ_WAITING_FOR_PACKET,
    CPU_READ_LATENCY,
    CPU_READ_WAITING_FOR_ACK);

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

    component ska_rx_packet_fifo
    port (
        wr_rst      : in std_logic;
        rd_rst      : in std_logic;
        wr_clk      : in std_logic;
        rd_clk      : in std_logic;
        din         : in std_logic_vector(262 downto 0);
        wr_en       : in std_logic;
        rd_en       : in std_logic;
        dout        : out std_logic_vector(262 downto 0);
        full        : out std_logic;
        empty       : out std_logic;
        prog_full   : out std_logic);
    end component;

    component ska_rx_packet_ctrl_fifo
    port (
        wr_rst      : in std_logic;
        rd_rst      : in std_logic;
        wr_clk      : in std_logic;
        rd_clk      : in std_logic;
        din         : in std_logic_vector(47 downto 0);
        wr_en       : in std_logic;
        rd_en       : in std_logic;
        dout        : out std_logic_vector(47 downto 0);
        full        : out std_logic;
        empty       : out std_logic;
        prog_full   : out std_logic);
    end component;

    component cpu_rx_packet_size
    port (
        wr_rst          : in std_logic;
        rd_rst          : in std_logic;
        wr_clk          : in std_logic;
        rd_clk          : in std_logic;
        din             : in std_logic_vector(10 downto 0);
        wr_en           : in std_logic;
        rd_en           : in std_logic;
        dout            : out std_logic_vector(10 downto 0);
        full            : out std_logic;
        empty           : out std_logic;
        wr_data_count   : out std_logic_vector(3 downto 0));
    end component;

    attribute ASYNC_REG : string;
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
    signal local_gateway_retimed : std_logic_vector(7 downto 0);
    signal local_mc_recv_ip_retimed : std_logic_vector(31 downto 0);
    signal local_mc_recv_ip_mask_retimed : std_logic_vector(31 downto 0);

    signal mac_rx_data_i : std_logic_vector(255 downto 0);
    signal mac_rx_data_valid_i : std_logic_vector(31 downto 0);
    signal mac_rx_good_frame_i : std_logic;
    signal mac_rx_bad_frame_i : std_logic;

    signal app_rx_good_frame_latched : std_logic;
    signal app_rx_bad_frame_latched : std_logic;
    signal cpu_rx_good_frame_latched : std_logic;
    signal cpu_rx_bad_frame_latched : std_logic;

    signal mac_rx_data_z1 : std_logic_vector(255 downto 0);
    signal mac_rx_data_valid_z1 : std_logic_vector(31 downto 0);
    --signal mac_rx_good_frame_z1 : std_logic;
    --signal mac_rx_bad_frame_z1 : std_logic;
    signal mac_rx_data_z2 : std_logic_vector(255 downto 0);
    signal mac_rx_data_valid_z2 : std_logic_vector(31 downto 0);
    --signal mac_rx_good_frame_z2 : std_logic;
    --signal mac_rx_bad_frame_z2 : std_logic;

    signal phy_rx_up_i : std_logic;

    signal destination_mac : std_logic_vector(47 downto 0);
    signal destination_port : std_logic_vector(15 downto 0);
    signal destination_ip : std_logic_vector(31 downto 0);

    signal app_source_ip : std_logic_vector(31 downto 0);
    signal app_source_port : std_logic_vector(15 downto 0);

    signal current_rx_packet_state : T_RX_PACKET_STATE;
    signal current_rx_packet_state_z1 : T_RX_PACKET_STATE;
    signal cpu_frame : std_logic;
    signal application_frame : std_logic;

    signal valid_cpu_frame : std_logic;

    signal payload0 : std_logic_vector(63 downto 0);
    signal payload1 : std_logic_vector(63 downto 0);
    signal payload2 : std_logic_vector(63 downto 0);
    signal payload3 : std_logic_vector(63 downto 0);

    signal payload0_z1 : std_logic_vector(63 downto 0);
    signal payload1_z1 : std_logic_vector(63 downto 0);
    signal payload2_z1 : std_logic_vector(63 downto 0);
    signal payload3_z1 : std_logic_vector(63 downto 0);

    signal payload0_val : std_logic;
    signal payload1_val : std_logic;
    signal payload2_val : std_logic;
    signal payload3_val : std_logic;

    signal payload0_val_z1 : std_logic;
    signal payload1_val_z1 : std_logic;
    signal payload2_val_z1 : std_logic;
    signal payload3_val_z1 : std_logic;

    signal cpu_payload0 : std_logic_vector(63 downto 0);
    signal cpu_payload1 : std_logic_vector(63 downto 0);
    signal cpu_payload2 : std_logic_vector(63 downto 0);
    signal cpu_payload3 : std_logic_vector(63 downto 0);

    signal cpu_payload0_val : std_logic;
    signal cpu_payload1_val : std_logic;
    signal cpu_payload2_val : std_logic;
    signal cpu_payload3_val : std_logic;

    signal cpu_data : std_logic_vector(255 downto 0);
    signal cpu_dvld : std_logic;
    signal cpu_frame_invalid : std_logic;
    signal cpu_frame_valid : std_logic;

    signal packet_fifo_wr_data : std_logic_vector(262 downto 0);
    signal packet_fifo_wr_en : std_logic;
    signal packet_fifo_almost_full : std_logic;
    signal packet_fifo_rd_data : std_logic_vector(262 downto 0);
    signal packet_fifo_rd_en : std_logic;
    signal packet_fifo_empty : std_logic;
    signal packet_fifo_full : std_logic;

    signal app_dvld : std_logic;
    signal app_goodframe : std_logic;
    signal app_badframe : std_logic;

    signal rx_eof : std_logic;
    signal rx_bad : std_logic;
    signal rx_over : std_logic;

    signal ctrl_fifo_wr_data : std_logic_vector(47 downto 0);
    signal ctrl_fifo_wr_en : std_logic;
    signal ctrl_fifo_almost_full : std_logic;
    signal ctrl_fifo_rd_data : std_logic_vector(47 downto 0);
    signal ctrl_fifo_rd_en : std_logic;
    signal ctrl_fifo_empty : std_logic;
    signal ctrl_fifo_full : std_logic;
    signal txctrl_fifo_wr_data : std_logic_vector(47 downto 0);
    signal txctrl_fifo_almost_full : std_logic;
    signal txctrl_fifo_rd_data : std_logic_vector(47 downto 0);

    signal current_app_state : T_APP_STATE;
    signal sCDCCurrentAppState : T_APP_STATE;
    signal sBusValidD1 : std_logic;
    signal sBusValidD2 : std_logic;
    attribute ASYNC_REG of sBusValidD1 : signal is "TRUE";
    attribute ASYNC_REG of sBusValidD2 : signal is "TRUE";    
    
    signal first_word : std_logic;

    signal overrun_ack_retimed : std_logic;
    signal overrun_ack_z1 : std_logic;
    attribute ASYNC_REG of overrun_ack_retimed : signal is "TRUE";
    attribute ASYNC_REG of overrun_ack_z1 : signal is "TRUE";       
    signal app_overrun_ack : std_logic;
    

    signal overrun_z1 : std_logic;
    signal overrun_z2 : std_logic;

    signal current_cpu_state : T_CPU_STATE;
    signal cpu_buffer_free : std_logic;
    signal frame_bypass : std_logic;
    signal cpu_buffer_write_sel : std_logic_vector(1 downto 0);
    signal cpu_buffer_read_sel : std_logic_vector(1 downto 0);
    signal cpu_buffer_addr : std_logic_vector(7 downto 0);
    signal cpu_buffer_addra : std_logic_vector(9 downto 0);
    signal cpu_buffer_douta : std_logic_vector(259 downto 0);
    signal cpu_buffer_web : std_logic_vector(0 downto 0);
    signal cpu_buffer_addrb : std_logic_vector(9 downto 0);
    signal cpu_buffer_dinb : std_logic_vector(259 downto 0);
    --signal cpu_count : std_logic_vector(7 downto 0);
    --signal reset_cpu_count : std_logic;

    signal cpu_size : std_logic_vector(10 downto 0);
    signal cpu_size_z1 : std_logic_vector(10 downto 0);
    signal cpu_size_z2 : std_logic_vector(10 downto 0);

    signal cpu_ack_z1 : std_logic;
    signal cpu_ack_z2 : std_logic;

    signal mac_match : std_logic;
    signal ip_match : std_logic;

    signal app_dvld_z1 : std_logic;

    signal cpu_rx_packet_size_din : std_logic_vector(10 downto 0);
    signal cpu_rx_packet_size_wrreq : std_logic;
    signal cpu_rx_packet_size_wrreq_1 : std_logic;    
    signal cpu_rx_packet_size_rdreq : std_logic;
    signal cpu_rx_packet_size_rdreq_1 : std_logic;
    signal cpu_rx_packet_size_dout : std_logic_vector(10 downto 0);
    signal cpu_rx_packet_size_empty : std_logic;
    signal cpu_rx_packet_size_full : std_logic;    
    signal cpu_rx_packet_size_wrcount : std_logic_vector(3 downto 0);

    signal current_cpu_read_state : T_CPU_READ_STATE;
    signal next_packet_cpu_count : std_logic;

--    signal app_frame_count_i : std_logic_vector(7 downto 0);
--    signal app_goodframe_count_i : std_logic_vector(7 downto 0);

--    signal lost_app_frame_count_i : std_logic_vector(7 downto 0);
--    signal application_frame_z1 : std_logic;

--    signal lost_good_frame_count_i : std_logic_vector(7 downto 0);
--    signal app_rx_good_frame_latched_z1 : std_logic;

--    signal no_app_frame_count_i : std_logic_vector(7 downto 0);
--    signal no_good_frame_count_i : std_logic_vector(7 downto 0);

    signal clear_application_frame : std_logic;
    signal clear_cpu_frame : std_logic;

begin

--------------------------------------------------------------------------------
-- REGISTER MAC INPUTS TO IMPROVE TIMING
--------------------------------------------------------------------------------

    gen_mac_rx_data_i : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            mac_rx_data_i <= mac_rx_data;
            mac_rx_data_valid_i <= mac_rx_data_valid;
            mac_rx_good_frame_i <= mac_rx_good_frame;
            mac_rx_bad_frame_i <= mac_rx_bad_frame;
            phy_rx_up_i <= phy_rx_up;

            mac_rx_data_z1 <= mac_rx_data_i;
            mac_rx_data_valid_z1 <= mac_rx_data_valid_i;
            --mac_rx_good_frame_z1 <= mac_rx_good_frame_i;
            --mac_rx_bad_frame_z1 <= mac_rx_bad_frame_i;

            mac_rx_data_z2 <= mac_rx_data_z1;
            mac_rx_data_valid_z2 <= mac_rx_data_valid_z1;
            --mac_rx_good_frame_z2 <= mac_rx_good_frame_z1;
            --mac_rx_bad_frame_z2 <= mac_rx_bad_frame_z1;

        end if;
    end process;

    -- Promisc mode only filters on the cpu port all other traffic will get through to fabric
    generate_promisc_mode : if PROMISC_MODE = 1 generate
        mac_match <= '0';
        ip_match <= '0';
    end generate generate_promisc_mode;

    generate_non_promisc_mode : if PROMISC_MODE = 0 generate
        mac_match <= '1' when
        (((mac_rx_data_i(103 downto 96) & mac_rx_data_i(111 downto 104)) /= X"0800")or
        (mac_rx_data_i(119 downto 112) /= X"45")) else '0';

        ip_match <= '1' when
        ((destination_ip /= local_ip_retimed)and
        (destination_ip /= local_mc_recv_ip_retimed)and
        ((destination_ip and local_mc_recv_ip_mask_retimed) /= (local_mc_recv_ip_retimed and local_mc_recv_ip_mask_retimed))) else '0';
    end generate generate_non_promisc_mode;

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
                if (cpu_mac_cross_clock_count = "0101")then
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
    ("00000000000000000000000" & local_enable & local_gateway) when (cpu_mac_cross_clock_count = "0011") else
    local_mc_recv_ip when (cpu_mac_cross_clock_count = "0100") else
    local_mc_recv_ip_mask;

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
                    local_gateway_retimed <= cpu_mac_cross_clock_fifo_dout(7 downto 0);
                    local_enable_retimed <= cpu_mac_cross_clock_fifo_dout(8);
                elsif (cpu_mac_cross_clock_fifo_dout(35 downto 32) = "0100")then
                    local_mc_recv_ip_retimed <= cpu_mac_cross_clock_fifo_dout(31 downto 0);
                else
                    local_mc_recv_ip_mask_retimed <= cpu_mac_cross_clock_fifo_dout(31 downto 0);
                end if;
            end if;
        end if;
    end process;

-----------------------------------------------------------------------------------------
-- DECODE DESTINATION MAC, IP ADDRESS AND PORT
-----------------------------------------------------------------------------------------

    destination_mac <= mac_rx_data_i(7 downto 0) & mac_rx_data_i(15 downto 8) & mac_rx_data_i(23 downto 16) & mac_rx_data_i(31 downto 24) & mac_rx_data_i(39 downto 32) & mac_rx_data_i(47 downto 40);
    destination_port <= mac_rx_data_i(39 downto 32) & mac_rx_data_i(47 downto 40);
    destination_ip <= mac_rx_data_z1(247 downto 240) &  mac_rx_data_z1(255 downto 248) & mac_rx_data_i(7 downto 0) & mac_rx_data_i(15 downto 8);

-----------------------------------------------------------------------------------------
-- STATE MACHINE TO HANDLE PACKET RECEPTION AND SORTING
-----------------------------------------------------------------------------------------

    gen_current_rx_packet_state : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            app_source_ip <= (others => '0');
            app_source_port <= (others => '0');
            cpu_frame <= '1';
            application_frame <= '1';
            app_rx_good_frame_latched <= '0';
            app_rx_bad_frame_latched <= '0';
            cpu_rx_good_frame_latched <= '0';
            cpu_rx_bad_frame_latched <= '0';
            clear_application_frame <= '0';
            clear_cpu_frame <= '0';
            current_rx_packet_state <= IDLE;
        elsif (rising_edge(mac_clk))then
            current_rx_packet_state_z1 <= current_rx_packet_state;

            case current_rx_packet_state is
                when IDLE =>
                cpu_frame <= '1';
                application_frame <= '1';

                clear_application_frame <= '0';
                clear_cpu_frame <= '0';

                current_rx_packet_state <= IDLE;

                if ((mac_rx_data_valid_i = X"FFFFFFFF")and(phy_rx_up_i = '1'))then
                    cpu_rx_good_frame_latched <= '0';
                    cpu_rx_bad_frame_latched <= '0';

                    current_rx_packet_state <= REC_HEADER_2_PAYLOAD_START;

                    -- Check Dest MAC
                    if ((destination_mac /= local_mac_retimed)and(destination_mac /= X"FFFFFFFFFFFF")and(destination_mac(47 downto 24) /= X"01005E"))then
                        -- Don't send if mac mismatch
                        clear_cpu_frame <= '1';
                        clear_application_frame <= '1';
                    end if;

                    -- Don't send application frame if not enabled
                    if (local_enable_retimed = '0')then
                        clear_application_frame <= '1';
                    end if;

                    -- Check IPV4 info
                    if (mac_match = '1') then
                        -- If not IPv4 frame, with no options or padding no good for application
                        clear_application_frame <= '1';
                    end if;

                    -- Check UDP protocol
                    if (mac_rx_data_i(191 downto 184) /= X"11")then
                        clear_application_frame <= '1';
                    end if;

                    -- Store source IP address info
                    app_source_ip(31 downto 24) <= mac_rx_data_i(215 downto 208);
                    app_source_ip(23 downto 16) <= mac_rx_data_i(223 downto 216);
                    app_source_ip(15 downto 8) <= mac_rx_data_i(231 downto 224);
                    app_source_ip(7 downto 0) <= mac_rx_data_i(239 downto 232);
                    -- No IP checksum
                end if;

                when REC_HEADER_2_PAYLOAD_START =>
                current_rx_packet_state <= REC_PAYLOAD;

                if (clear_application_frame = '1')then
                    application_frame <= '0';
                end if;

                if (clear_cpu_frame = '1')then
                    cpu_frame <= '0';
                end if;

                -- Store source port
                app_source_port(15 downto 8) <= mac_rx_data_i(23 downto 16);
                app_source_port(7 downto 0) <= mac_rx_data_i(31 downto 24);

                -- Check destiniation port
                if (destination_port /= local_port_retimed)then
                    application_frame <= '0';
                end if;

                -- Check destiniation IP, is it our IP or a multicast IP that we have subscribed to
                if (ip_match = '1')then
                    application_frame <= '0';
                end if;

                -- No UDP checksum

                -- Move by 1 clock cycle to handle back to back packets
                app_rx_good_frame_latched <= '0';
                app_rx_bad_frame_latched <= '0';

                if ((mac_rx_good_frame_i = '1')or(mac_rx_bad_frame_i = '1'))then
                    cpu_rx_good_frame_latched <= mac_rx_good_frame_i;
                    cpu_rx_bad_frame_latched <= mac_rx_bad_frame_i;
                    app_rx_good_frame_latched <= mac_rx_good_frame_i;
                    app_rx_bad_frame_latched <= mac_rx_bad_frame_i;
                    current_rx_packet_state <= IDLE;
                end if;

                when REC_PAYLOAD =>
                -- Get data until good frame/bad frame signal
                if ((mac_rx_good_frame_i = '1')or(mac_rx_bad_frame_i = '1'))then
                    cpu_rx_good_frame_latched <= mac_rx_good_frame_i;
                    cpu_rx_bad_frame_latched <= mac_rx_bad_frame_i;
                    app_rx_good_frame_latched <= mac_rx_good_frame_i;
                    app_rx_bad_frame_latched <= mac_rx_bad_frame_i;
                    current_rx_packet_state <= IDLE;
                end if;
            end case;

-- MESSES WITH CPU VALID SIGNAL
--            if (local_enable_retimed = '0')then
--                application_frame <= '0';
--            end if;
        end if;
    end process;

--    gen_app_frame_count_i : process(mac_rst, mac_clk)
--    begin
--        if (mac_rst = '1')then
--            app_frame_count_i <= (others => '0');
--        elsif (rising_edge(mac_clk))then
--            if ((mac_rx_good_frame_i = '1')and(application_frame = '1')and(current_rx_packet_state /= IDLE))then
--                app_frame_count_i <= app_frame_count_i + X"01";
--            end if;
--        end if;
--    end process;

--    app_frame_count <= app_frame_count_i;

--    gen_application_frame_z1 : process( mac_clk)
--    begin
--        if (rising_edge(mac_clk))then
--            application_frame_z1 <= application_frame;
--        end if;
--    end process;

--    gen_app_rx_good_frame_latched_z1 : process(mac_clk)
--    begin
--        if (rising_edge(mac_clk))then
--            app_rx_good_frame_latched_z1 <= app_rx_good_frame_latched;
--        end if;
--    end process;

-----------------------------------------------------------------------------------------
-- DECODE STATES INTO DIFFERENT DATA
-----------------------------------------------------------------------------------------

    cpu_payload0 <= mac_rx_data_z1(7 downto 0) & mac_rx_data_z1(15 downto 8) & mac_rx_data_z1(23 downto 16) & mac_rx_data_z1(31 downto 24) & mac_rx_data_z1(39 downto 32) & mac_rx_data_z1(47 downto 40) & mac_rx_data_z1(55 downto 48) & mac_rx_data_z1(63 downto 56);
    cpu_payload1 <= mac_rx_data_z1(71 downto 64) & mac_rx_data_z1(79 downto 72) & mac_rx_data_z1(87 downto 80) & mac_rx_data_z1(95 downto 88) & mac_rx_data_z1(103 downto 96) & mac_rx_data_z1(111 downto 104) & mac_rx_data_z1(119 downto 112) & mac_rx_data_z1(127 downto 120);
    cpu_payload2 <= mac_rx_data_z1(135 downto 128) & mac_rx_data_z1(143 downto 136) & mac_rx_data_z1(151 downto 144) & mac_rx_data_z1(159 downto 152) & mac_rx_data_z1(167 downto 160) & mac_rx_data_z1(175 downto 168) & mac_rx_data_z1(183 downto 176) & mac_rx_data_z1(191 downto 184);
    cpu_payload3 <= mac_rx_data_z1(199 downto 192) & mac_rx_data_z1(207 downto 200) & mac_rx_data_z1(215 downto 208) & mac_rx_data_z1(223 downto 216) & mac_rx_data_z1(231 downto 224) & mac_rx_data_z1(239 downto 232) & mac_rx_data_z1(247 downto 240) & mac_rx_data_z1(255 downto 248);

    cpu_payload0_val <= mac_rx_data_valid_z1(0);
    cpu_payload1_val <= mac_rx_data_valid_z1(8);
    cpu_payload2_val <= mac_rx_data_valid_z1(16);
    cpu_payload3_val <= mac_rx_data_valid_z1(24);

    valid_cpu_frame <= (not application_frame) and cpu_frame;

    cpu_data <= cpu_payload3 & cpu_payload2 & cpu_payload1 & cpu_payload0;
    cpu_dvld <= cpu_payload3_val or cpu_payload2_val or cpu_payload1_val or cpu_payload0_val;
    cpu_frame_invalid <= cpu_rx_bad_frame_latched or (cpu_rx_good_frame_latched and (not valid_cpu_frame));
    cpu_frame_valid <= cpu_rx_good_frame_latched and valid_cpu_frame;

    payload0 <= mac_rx_data_z1(87 downto 80) & mac_rx_data_z1(95 downto 88) & mac_rx_data_z1(103 downto 96) & mac_rx_data_z1(111 downto 104) & mac_rx_data_z1(119 downto 112) & mac_rx_data_z1(127 downto 120) & mac_rx_data_z1(135 downto 128) & mac_rx_data_z1(143 downto 136);
    payload1 <= mac_rx_data_z1(151 downto 144) & mac_rx_data_z1(159 downto 152) & mac_rx_data_z1(167 downto 160) & mac_rx_data_z1(175 downto 168) & mac_rx_data_z1(183 downto 176) & mac_rx_data_z1(191 downto 184) & mac_rx_data_z1(199 downto 192) & mac_rx_data_z1(207 downto 200);
    payload2 <= mac_rx_data_z1(215 downto 208) & mac_rx_data_z1(223 downto 216) & mac_rx_data_z1(231 downto 224) & mac_rx_data_z1(239 downto 232) & mac_rx_data_z1(247 downto 240) & mac_rx_data_z1(255 downto 248) & mac_rx_data_i(7 downto 0) & mac_rx_data_i(15 downto 8);
    payload3 <= mac_rx_data_i(23 downto 16) & mac_rx_data_i(31 downto 24) & mac_rx_data_i(39 downto 32) & mac_rx_data_i(47 downto 40) & mac_rx_data_i(55 downto 48) & mac_rx_data_i(63 downto 56) & mac_rx_data_i(71 downto 64) & mac_rx_data_i(79 downto 72);

    payload0_val <= mac_rx_data_valid_z1(10) when (((current_rx_packet_state_z1 = REC_HEADER_2_PAYLOAD_START)or(current_rx_packet_state_z1 = REC_PAYLOAD))and(application_frame = '1')) else '0';
    payload1_val <= mac_rx_data_valid_z1(18) when (((current_rx_packet_state_z1 = REC_HEADER_2_PAYLOAD_START)or(current_rx_packet_state_z1 = REC_PAYLOAD))and(application_frame = '1')) else '0';
    payload2_val <= mac_rx_data_valid_z1(26) when (((current_rx_packet_state_z1 = REC_HEADER_2_PAYLOAD_START)or(current_rx_packet_state_z1 = REC_PAYLOAD))and(application_frame = '1')) else '0';
    payload3_val <= mac_rx_data_valid_i(2) when (((current_rx_packet_state_z1 = REC_HEADER_2_PAYLOAD_START)or(current_rx_packet_state_z1 = REC_PAYLOAD))and(application_frame = '1')and(current_rx_packet_state /= IDLE)) else '0';

    gen_payload_z1 : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            payload0_z1 <= payload0;
            payload1_z1 <= payload1;
            payload2_z1 <= payload2;
            payload3_z1 <= payload3;

            payload0_val_z1 <= payload0_val;
            payload1_val_z1 <= payload1_val;
            payload2_val_z1 <= payload2_val;
            payload3_val_z1 <= payload3_val;
        end if;
    end process;

    app_dvld <= (payload0_val or payload1_val or payload2_val or payload3_val) when (mac_rst = '0') else '0';
    app_goodframe <=
    (application_frame and app_rx_good_frame_latched) when ((app_dvld = '0')and(app_dvld_z1 = '1')and(mac_rst = '0')) else '0';
    --app_badframe <=
    --(application_frame and app_rx_bad_frame_latched) when ((app_dvld = '0')and(app_dvld_z1 = '1')and(app_rst = '0')) else '0';
    --AI: Allow bad frames to be routed through
    app_badframe <=
    (app_rx_bad_frame_latched) when ((app_dvld = '0')and(app_dvld_z1 = '1')and(mac_rst = '0')) else '0';


    gen_app_dvld_z1 : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            app_dvld_z1 <= app_dvld;
        end if;
    end process;

--    gen_app_goodframe_count_i : process(mac_rst, mac_clk)
--    begin
--        if (mac_rst = '1')then
--            app_goodframe_count_i <= (others => '0');
--        elsif (rising_edge(mac_clk))then
--            if (app_goodframe = '1')then
--                app_goodframe_count_i <= app_goodframe_count_i + X"01";
--            end if;
--        end if;
--    end process;

--    app_goodframe_count <= app_goodframe_count_i;

--    gen_lost_app_frame_count_i : process(mac_rst, mac_clk)
--    begin
--        if (mac_rst = '1')then
--            lost_app_frame_count_i <= (others => '0');
--        elsif (rising_edge(mac_clk))then
--            if ((app_dvld = '0')and(app_dvld_z1 = '1')and(application_frame = '0')and(application_frame_z1 = '1'))then
--                lost_app_frame_count_i <= lost_app_frame_count_i + X"01";
--            end if;
--        end if;
--    end process;

--    lost_app_frame_count <= lost_app_frame_count_i;

--    gen_lost_good_frame_count_i : process(mac_rst, mac_clk)
--    begin
--        if (mac_rst = '1')then
--            lost_good_frame_count_i <= (others => '0');
--        elsif (rising_edge(mac_clk))then
--            if ((app_dvld = '0')and(app_dvld_z1 = '1')and(app_rx_good_frame_latched = '0')and(app_rx_good_frame_latched_z1 = '1'))then
--                lost_good_frame_count_i <= lost_good_frame_count_i + X"01";
--            end if;
--        end if;
--    end process;

--    lost_good_frame_count <= lost_good_frame_count_i;

--    gen_no_app_frame_count_i : process(mac_rst, mac_clk)
--    begin
--        if (mac_rst = '1')then
--            no_app_frame_count_i <= (others => '0');
--        elsif (rising_edge(mac_clk))then
--            if ((app_dvld = '0')and(app_dvld_z1 = '1')and(app_rx_good_frame_latched = '1')and(application_frame = '0'))then
--                no_app_frame_count_i <= no_app_frame_count_i + X"01";
--            end if;
--        end if;
--    end process;

--    no_app_frame_count <= no_app_frame_count_i;

--    gen_no_good_frame_count_i : process(mac_rst, mac_clk)
--    begin
--        if (mac_rst = '1')then
--            no_good_frame_count_i <= (others => '0');
--        elsif (rising_edge(mac_clk))then
--            if ((app_dvld = '0')and(app_dvld_z1 = '1')and(app_rx_good_frame_latched = '0')and(application_frame = '1'))then
--                no_good_frame_count_i <= no_good_frame_count_i + X"01";
--            end if;
--        end if;
--    end process;

--    no_good_frame_count <= no_good_frame_count_i;

---------------------------------------------------------------------------------------------
-- CPU RECEIVE BUFFER
---------------------------------------------------------------------------------------------
    
    cpu_rx_packet_size_wrreq_1 <= cpu_rx_packet_size_wrreq and (not mac_rst) and (not cpu_rx_packet_size_full);
    
    debug_port(0) <= cpu_dvld;
    debug_port(1) <= cpu_frame_invalid;
    debug_port(2) <= cpu_frame_valid;
    debug_port(3) <= frame_bypass;
    debug_port(4) <= cpu_rx_packet_size_wrreq_1;
    debug_port(5) <= cpu_rx_packet_size_rdreq_1;
    debug_port(6) <= cpu_rx_ack;
    debug_port(7) <= '1' when (cpu_size /= ("000" & X"00")) else '0';

    -- CONVERT 256 bits TO 64 bit READS BY DROPPING LAST 2 bits OF ADDRESS
    cpu_buffer_addra(9 downto 8) <= cpu_buffer_read_sel;
    cpu_buffer_addra(7 downto 0) <= cpu_rx_buffer_addr(9 downto 2);


    generate_cpu_rx : if USE_CPU_RX = 1 generate
      cpu_rx_buffer_rd_data <=
      cpu_buffer_douta(63 downto 0) when (cpu_rx_buffer_addr(1 downto 0) = "00") else
      cpu_buffer_douta(127 downto 64) when (cpu_rx_buffer_addr(1 downto 0) = "01") else
      cpu_buffer_douta(191 downto 128) when (cpu_rx_buffer_addr(1 downto 0) = "10") else
      cpu_buffer_douta(255 downto 192);

      ska_cpu_buffer_0 : ska_cpu_buffer
      port map(
          clka    => cpu_clk,
          wea     => (others => '0'),
          addra   => cpu_buffer_addra,
          dina    => (others => '0'),
          douta   => cpu_buffer_douta,
          clkb    => mac_clk,
          web     => cpu_buffer_web,
          addrb   => cpu_buffer_addrb,
          dinb    => cpu_buffer_dinb,
          doutb   => open);
    end generate generate_cpu_rx;

    generate_nocpu_rx : if USE_CPU_RX = 0 generate
      cpu_rx_buffer_rd_data <= (others => '0');
    end generate generate_nocpu_rx;

    cpu_buffer_web(0) <= cpu_dvld;

    cpu_buffer_dinb(255 downto 0) <= cpu_data;
    cpu_buffer_dinb(256) <= cpu_payload0_val;
    cpu_buffer_dinb(257) <= cpu_payload1_val;
    cpu_buffer_dinb(258) <= cpu_payload2_val;
    cpu_buffer_dinb(259) <= cpu_payload3_val;

    cpu_buffer_addrb(9 downto 8) <= cpu_buffer_write_sel;
    cpu_buffer_addrb(7 downto 0) <= cpu_buffer_addr;

    gen_current_cpu_state : process(mac_rst, mac_clk)
    variable cpu_count : std_logic_vector(10 downto 0);
    begin
      if (mac_rst = '1')then
            cpu_buffer_addr <= (others => '0');
            frame_bypass <= '0';
            cpu_buffer_write_sel <= "00";
            cpu_rx_packet_size_wrreq <= '0';
            cpu_count := (others => '0');
            cpu_rx_packet_size_din <= (others => '0');
            current_cpu_state <= CPU_BUFFERING;
        elsif (rising_edge(mac_clk))then
            cpu_rx_packet_size_wrreq <= '0';

            case current_cpu_state is
                when CPU_BUFFERING =>
                current_cpu_state <= CPU_BUFFERING;

                if (cpu_dvld = '1')then
                    if (cpu_buffer_addr = "11111111")then
                        frame_bypass <= '1';
                    else
                        cpu_buffer_addr <= cpu_buffer_addr + "00000001";
                    end if;

                    if (cpu_payload3_val = '1')then
                        cpu_count := cpu_count + "00000000100";
                    elsif (cpu_payload2_val = '1')then
                        cpu_count := cpu_count + "00000000011";
                    elsif (cpu_payload1_val = '1')then
                        cpu_count := cpu_count + "00000000010";
                    else
                        cpu_count := cpu_count + "00000000001";
                    end if;

                end if;

                if ((cpu_frame_invalid = '1')or
                ((cpu_frame_valid = '1')and(frame_bypass = '1')))then
                    frame_bypass <= '0';
                    cpu_count := (others => '0');
                    cpu_buffer_addr  <= (others => '0');
                end if;

                -- DIFFERENT TO 10GBE MAC
                if ((cpu_frame_valid = '1')and(frame_bypass = '0'))then
                    -- IF SPACE AVAILABLE, WRITE IMMEDIATELY AND STAY IN THIS STATE
                    if (cpu_rx_packet_size_wrcount(2) = '0')then
                        if (cpu_buffer_write_sel = "11")then
                            cpu_buffer_write_sel <= "00";
                        else
                            cpu_buffer_write_sel <= cpu_buffer_write_sel + "01";
                        end if;

                        cpu_rx_packet_size_wrreq <= '1';
                        cpu_rx_packet_size_din <= cpu_count;

                        current_cpu_state <= CPU_BUFFERING;

                        cpu_buffer_addr <= (others => '0');
                        cpu_count := (others => '0');
                    else
                        current_cpu_state <= CPU_WAIT;
                    end if;
                end if;

                when CPU_WAIT =>
                current_cpu_state <= CPU_WAIT;

                -- LESS THAN 4 FRAMES
                if (cpu_rx_packet_size_wrcount(2) = '0')then
                    if (cpu_buffer_write_sel = "11")then
                        cpu_buffer_write_sel <= "00";
                    else
                        cpu_buffer_write_sel <= cpu_buffer_write_sel + "01";
                    end if;

                    cpu_rx_packet_size_wrreq <= '1';
                    cpu_rx_packet_size_din <= cpu_count;

                    current_cpu_state <= CPU_BUFFERING;

                    cpu_buffer_addr <= (others => '0');
                    cpu_count := (others => '0');
                end if;

                if (cpu_dvld = '1')then
                    frame_bypass <= '1';
                end if;

            end case;

        end if;
    end process;

    cpu_rx_packet_size_0 : cpu_rx_packet_size
    port map(
        wr_rst          => mac_rst,
        rd_rst          => cpu_rst,
        wr_clk          => mac_clk,
        rd_clk          => cpu_clk,
        din             => cpu_rx_packet_size_din,
        wr_en           => cpu_rx_packet_size_wrreq_1,
        rd_en           => cpu_rx_packet_size_rdreq_1,
        dout            => cpu_rx_packet_size_dout,
        full            => cpu_rx_packet_size_full,
        empty           => cpu_rx_packet_size_empty,
        wr_data_count   => cpu_rx_packet_size_wrcount);

    -- CPU HANDSHAKING NOW DONE THROUGH FIFO WHICH STORES PACKET SIZES
    gen_current_cpu_read_state : process(cpu_rst, cpu_clk)
    begin
        if (cpu_rst = '1')then
            cpu_size <= (others => '0');
            -- START READING AT PREVIOUS ADDRESS SPACE SO THAT NOT READING
            -- WHILE WRITING
            cpu_buffer_read_sel <= "11";
            current_cpu_read_state <= CPU_READ_WAITING_FOR_PACKET;
        elsif (rising_edge(cpu_clk))then

            case current_cpu_read_state is
                when CPU_READ_WAITING_FOR_PACKET =>
                current_cpu_read_state <= CPU_READ_WAITING_FOR_PACKET;

                cpu_size <= (others => '0');

                if (cpu_rx_packet_size_empty = '0')then

                    if (cpu_buffer_read_sel = "11")then
                        cpu_buffer_read_sel <= "00";
                    else
                        cpu_buffer_read_sel <= cpu_buffer_read_sel + "01";
                    end if;
                    current_cpu_read_state <= CPU_READ_LATENCY;
                end if;

                when CPU_READ_LATENCY =>
                current_cpu_read_state <= CPU_READ_WAITING_FOR_ACK;

                when CPU_READ_WAITING_FOR_ACK =>
                current_cpu_read_state <= CPU_READ_WAITING_FOR_ACK;

                cpu_size <= cpu_rx_packet_size_dout;

                if (cpu_rx_ack = '1')then
                    cpu_size <= (others => '0');
                    current_cpu_read_state <= CPU_READ_WAITING_FOR_PACKET;
                end if;

            end case;
        end if;
    end process;

    cpu_rx_packet_size_rdreq <= '1' when (current_cpu_read_state = CPU_READ_LATENCY) else '0';
    cpu_rx_packet_size_rdreq_1 <= cpu_rx_packet_size_rdreq and (not cpu_rst) and (not cpu_rx_packet_size_empty);


    cpu_rx_size <= cpu_size;

--    -- CPU HANDSHAKING
--    cpu_buffer_free <= '1' when ((cpu_size = X"00")and(cpu_ack_z2 = '0')) else '0';

--    gen_cpu_size : process(mac_rst, mac_clk)
--    begin
--        if (mac_rst = '1')then
--            cpu_size <= (others => '0');
--        elsif (rising_edge(mac_clk))then
--            cpu_ack_z1 <= cpu_rx_ack;
--            cpu_ack_z2 <= cpu_ack_z1;

--            if (cpu_ack_z2 = '1')then
--                cpu_size <= (others => '0');
--            end if;

--            if ((current_cpu_state = CPU_WAIT)and(cpu_buffer_free = '1'))then
--                cpu_size <= cpu_count;
--            end if;
--        end if;
--    end process;

--    -- MOVE CPU SIZE TO CPU CLOCK DOMAIN
--    cpu_rx_size <= cpu_size_z2;

--    gen_cpu_size_z : process(cpu_clk)
--    begin
--        if (rising_edge(cpu_clk))then
--            cpu_size_z1 <= cpu_size;
--            cpu_size_z2 <= cpu_size_z1;
--        end if;
--    end process;

---------------------------------------------------------------------------------------------
-- APP RECEIVE BUFFER
---------------------------------------------------------------------------------------------

    rx_eof <= '1' when
    (((app_goodframe = '1')or
    (app_badframe = '1')or
    ((app_dvld = '1')and((packet_fifo_almost_full = '1')or(ctrl_fifo_almost_full = '1')or(txctrl_fifo_almost_full = '1'))))and(mac_rst = '0')) else '0';
    rx_bad <= app_badframe when (mac_rst = '0') else '0';
    -- This really shouldnt be called rx_over, it is actually almost full
    rx_over <= (packet_fifo_almost_full or ctrl_fifo_almost_full or txctrl_fifo_almost_full) when (mac_rst = '0') else '0';
    -- this wont work becaus the fifo will be full and this signal wont get through the fifo.
    -- rx_over <= packet_fifo_full

    packet_fifo_wr_data(255 downto 0) <= payload3_z1 & payload2_z1 & payload1_z1 & payload0_z1;
    packet_fifo_wr_data(256) <= payload0_val_z1;
    packet_fifo_wr_data(257) <= payload1_val_z1;
    packet_fifo_wr_data(258) <= payload2_val_z1;
    packet_fifo_wr_data(259) <= payload3_val_z1;
    packet_fifo_wr_data(260) <= rx_eof;
    packet_fifo_wr_data(261) <= rx_bad;
    packet_fifo_wr_data(262) <= rx_over;

    --AI: Alway deassert FIFO write when reset is asserted
    packet_fifo_wr_en <= '1' when
    ((app_dvld_z1  = '1')and
    (current_app_state = APP_RUN) and (mac_rst = '0') and (packet_fifo_full = '0')) else '0';

    ska_rx_packet_fifo_0 : ska_rx_packet_fifo
    port map(
        wr_rst      => mac_rst,
        rd_rst      => app_rst,
        wr_clk      => mac_clk,
        rd_clk      => app_clk,
        din         => packet_fifo_wr_data,
        wr_en       => packet_fifo_wr_en,
        rd_en       => packet_fifo_rd_en,
        dout        => packet_fifo_rd_data,
        full        => packet_fifo_full,
        empty       => packet_fifo_empty,
        prog_full   => packet_fifo_almost_full);

    --AI: Alway deassert FIFO read when reset is asserted
    packet_fifo_rd_en <= app_rx_ack and (not app_rst) and (not packet_fifo_empty);

    app_rx_valid        <= packet_fifo_rd_data(259 downto 256) when (packet_fifo_empty = '0') else (others => '0');
    app_rx_end_of_frame <= packet_fifo_rd_data(260);
    app_rx_bad_frame    <= packet_fifo_rd_data(261);
    app_rx_overrun      <= packet_fifo_rd_data(262);
    app_rx_data         <= packet_fifo_rd_data(255 downto 0);

    ctrl_fifo_wr_data <= app_source_port & app_source_ip;
    --AI: Alway deassert FIFO write when reset is asserted
    ctrl_fifo_wr_en   <= '1' when ((app_dvld = '1')and(first_word = '1')and(current_app_state = APP_RUN)and(mac_rst = '0')and(ctrl_fifo_full = '0')) else '0';
    txctrl_fifo_wr_data <= destination_port & destination_ip;
    --txctrl_fifo_wr_en   <= '1' when ((app_dvld = '1')and(first_word = '1')and(current_app_state = APP_RUN)) else '0';

    ska_rx_packet_ctrl_fifo_0 : ska_rx_packet_ctrl_fifo
    port map(
        wr_rst      => mac_rst,
        rd_rst      => app_rst,
        wr_clk      => mac_clk,
        rd_clk      => app_clk,
        din         => ctrl_fifo_wr_data,
        wr_en       => ctrl_fifo_wr_en,
        rd_en       => ctrl_fifo_rd_en,
        dout        => ctrl_fifo_rd_data,
        full        => ctrl_fifo_full,
        empty       => ctrl_fifo_empty,
        prog_full   => ctrl_fifo_almost_full);

    --AI: Alway deassert FIFO read when reset is asserted
    ctrl_fifo_rd_en <= app_rx_ack and  packet_fifo_rd_data(260) and packet_fifo_rd_data(256) and (not app_rst) and (not ctrl_fifo_empty) ;

    app_rx_source_ip   <= ctrl_fifo_rd_data(31 downto 0);
    app_rx_source_port <= ctrl_fifo_rd_data(47 downto 32);

    ska_rx_packet_ctrl_fifo_1 : ska_rx_packet_ctrl_fifo
    port map(
        wr_rst      => mac_rst,
        rd_rst      => app_rst,
        wr_clk      => mac_clk,
        rd_clk      => app_clk,
        din         => txctrl_fifo_wr_data,
        wr_en       => ctrl_fifo_wr_en,
        rd_en       => ctrl_fifo_rd_en,
        dout        => txctrl_fifo_rd_data,
        full        => open,
        empty       => open,
        prog_full   => txctrl_fifo_almost_full);

    --ctrl_fifo_rd_en <= app_rx_ack and  packet_fifo_rd_data(260) and packet_fifo_rd_data(256);

    app_rx_dest_ip   <= txctrl_fifo_rd_data(31 downto 0);
    app_rx_dest_port <= txctrl_fifo_rd_data(47 downto 32);

---------------------------------------------------------------------------------------------
-- STATE MACHINE TO HANDLE OVERFLOW CASE
---------------------------------------------------------------------------------------------

    gen_current_app_state : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            current_app_state <= APP_RUN;
            first_word <= '1';

        elsif (rising_edge(mac_clk))then
            case current_app_state is
                when APP_RUN =>
                current_app_state <= APP_RUN;

                if (app_dvld = '1')then
                    first_word <= '0';
                end if;

                if (rx_eof = '1')then
                    first_word <= '1';
                end if;

                if ((app_dvld = '1')and((packet_fifo_almost_full = '1')or(ctrl_fifo_almost_full = '1')or(txctrl_fifo_almost_full = '1')))then
                    current_app_state <= APP_OVER;
                end if;

                when APP_OVER =>
                current_app_state <= APP_OVER;

                if (overrun_ack_retimed = '1')then
                    current_app_state <= APP_WAIT;
                end if;

                when APP_WAIT =>
                current_app_state <= APP_WAIT;

                if (overrun_ack_retimed = '0')then
                    current_app_state <= APP_RUN;
                end if;

            end case;
        end if;
    end process;
    
    pCDCAppStateSynchroniser : process(app_rst, app_clk)
    begin
       if (app_rst = '1')then
           sCDCCurrentAppState <= APP_RUN;
           sBusValidD1 <= '0';
           sBusValidD2 <= '0';           
       elsif (rising_edge(app_clk))then
           sBusValidD2 <= sBusValidD1;
           sBusValidD1 <= '1';
             if (sBusValidD2 = '1') then
               sCDCCurrentAppState <= current_app_state;
             end if;  
       end if;
    end process pCDCAppStateSynchroniser;      

    gen_app_overrun_ack : process(app_rst, app_clk)
    begin
        if (app_rst = '1')then
            app_overrun_ack <= '1';
            overrun_z1 <= '0';
        elsif (rising_edge(app_clk))then
            if (sCDCCurrentAppState = APP_OVER)then
                overrun_z1 <= '1';
            else
                overrun_z1 <= '0';
            end if;

            overrun_z2 <= overrun_z1;

            if (overrun_z2 = '0')then
                app_overrun_ack <= '0';
            end if;

            if (app_rx_overrun_ack = '1')then
                app_overrun_ack <= '1';
            end if;
        end if;
    end process;

    gen_overrun_ack_retimed : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            overrun_ack_z1 <= app_overrun_ack;
            overrun_ack_retimed <= overrun_ack_z1;
        end if;
    end process;


end arch_ska_fge_rx;
