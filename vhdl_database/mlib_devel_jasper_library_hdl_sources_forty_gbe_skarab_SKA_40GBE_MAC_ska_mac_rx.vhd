----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: ska_mac_rx - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- SKA 40GBE RX path - MAC
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

entity ska_mac_rx is
    generic (
    RX_CRC_CHK_ENABLE   : integer);
    port (
    -- XLGMII
    xlgmii_rxd      : in std_logic_vector(255 downto 0);
    xlgmii_rxc      : in std_logic_vector(31 downto 0);

    -- MAC
    mac_clk             : in std_logic;
    mac_rst             : in std_logic;
    mac_rx_enable       : in std_logic;
    mac_rx_busy         : out std_logic;
    mac_rx_data         : out std_logic_vector(255 downto 0);
    mac_rx_data_valid   : out std_logic_vector(31 downto 0);
    mac_rx_good_frame   : out std_logic;
    mac_rx_bad_frame    : out std_logic);
end ska_mac_rx;

architecture arch_ska_mac_rx of ska_mac_rx is

    constant C_IDLE_TXD : std_logic_vector(255 downto 0):= X"0707070707070707070707070707070707070707070707070707070707070707";
    constant C_IDLE_TXC : std_logic_vector(31 downto 0) := "11111111111111111111111111111111";

    constant C_START_BYTE : std_logic_vector(7 downto 0) := X"FB";
    constant C_IDLE_BYTE : std_logic_vector(7 downto 0) := X"07";
    constant C_TERMINATE_BYTE : std_logic_vector(7 downto 0) := X"FD";

    type T_MAC_STATE is (
    IDLE,
    REC_ALIGNED_0,
    REC_ALIGNED_64,
    REC_ALIGNED_128,
    REC_ALIGNED_192);

--    component ska_mac_rx_crc
--    port (
--        clk             : in std_logic;
--        crc_reset       : in std_logic;
--        crc_init        : in std_logic_vector(31 downto 0);
--        data_in         : in std_logic_vector(255 downto 0);
--        data_in_val     : in std_logic_vector(31 downto 0);
--        crc_out         : out std_logic_vector(31 downto 0));
--    end component;

    component ska_mac_rx_crc_multi
    port (
        clk             : in std_logic;
        rst             : in std_logic;
        crc_reset       : in std_logic;
        crc_init        : in std_logic_vector(31 downto 0);
        data_in         : in std_logic_vector(255 downto 0);
        data_in_val     : in std_logic_vector(31 downto 0);
        crc_out         : out std_logic_vector(31 downto 0));
    end component;

    signal crc_reset : std_logic;
    signal crc_data_in : std_logic_vector(255 downto 0);
    signal crc_data_in_val : std_logic_vector(31 downto 0);
    signal crc_out : std_logic_vector(31 downto 0);

    signal current_mac_state : T_MAC_STATE;
    signal current_mac_state_z1 : T_MAC_STATE;

    signal xlgmii_rxd_z1 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_z1 : std_logic_vector(31 downto 0);
    signal xlgmii_rxd_z2 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_z2 : std_logic_vector(31 downto 0);

    signal xlgmii_rxd_aligned_0 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_aligned_0 : std_logic_vector(31 downto 0);
    signal xlgmii_rxd_aligned_64 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_aligned_64 : std_logic_vector(31 downto 0);
    signal xlgmii_rxd_aligned_128 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_aligned_128 : std_logic_vector(31 downto 0);
    signal xlgmii_rxd_aligned_192 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_aligned_192 : std_logic_vector(31 downto 0);

    signal xlgmii_rxd_aligned : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_aligned : std_logic_vector(31 downto 0);
    signal xlgmii_rxd_aligned_z1 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_aligned_z1 : std_logic_vector(31 downto 0);

    signal xlgmii_rxd_crc_masked : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_crc_masked : std_logic_vector(31 downto 0);
    signal next_xlgmii_rxd_crc_masked : std_logic_vector(255 downto 0);
    signal next_xlgmii_rxc_crc_masked : std_logic_vector(31 downto 0);
    signal use_next_xlgmii_rxd_crc_masked : std_logic;
    signal terminate_byte_found : std_logic;
    signal terminate_byte_found_z1 : std_logic;
    signal terminate_byte_found_z2 : std_logic;
    signal terminate_byte_found_z3 : std_logic;
    signal terminate_byte_found_z4 : std_logic;
    signal terminate_byte_found_z5 : std_logic;
    signal terminate_byte_found_z6 : std_logic;

    signal received_crc : std_logic_vector(31 downto 0);
    signal received_crc_z1 : std_logic_vector(31 downto 0);
    signal received_crc_z2 : std_logic_vector(31 downto 0);
    signal received_crc_z3 : std_logic_vector(31 downto 0);


    signal crc_data_in_z1 : std_logic_vector(255 downto 0);
    signal crc_data_in_val_z1 : std_logic_vector(31 downto 0);
    signal crc_data_in_z2 : std_logic_vector(255 downto 0);
    signal crc_data_in_val_z2 : std_logic_vector(31 downto 0);

    signal crc_do_reset : std_logic;
    signal crc_do_reset_z1 : std_logic;

    signal crc_out_multi : std_logic_vector(31 downto 0);

    signal mac_rx_data_i : std_logic_vector(255 downto 0);
    signal mac_rx_data_valid_i : std_logic_vector(31 downto 0);
    signal mac_rx_data_i_z1 : std_logic_vector(255 downto 0);
    signal mac_rx_data_valid_i_z1 : std_logic_vector(31 downto 0);
    signal mac_rx_data_i_z2 : std_logic_vector(255 downto 0);
    signal mac_rx_data_valid_i_z2 : std_logic_vector(31 downto 0);
    signal mac_rx_data_i_z3 : std_logic_vector(255 downto 0);
    signal mac_rx_data_valid_i_z3 : std_logic_vector(31 downto 0);
    signal mac_rx_data_i_z4 : std_logic_vector(255 downto 0);
    signal mac_rx_data_valid_i_z4 : std_logic_vector(31 downto 0);

    signal crc_out_old : std_logic_vector(31 downto 0);
    signal finished_packet : std_logic;
    signal clear_finished_packet : std_logic;

begin

    -- NEED TO BE ABLE TO HANDLE MINIMUM IFG!!!!

------------------------------------------------------------------------------
-- REGISTER TO HANDLE DIFFERENT LATENCIES
------------------------------------------------------------------------------

    gen_xlgmii_rxd_z : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            xlgmii_rxd_z1 <= xlgmii_rxd;
            xlgmii_rxc_z1 <= xlgmii_rxc;
            xlgmii_rxd_z2 <= xlgmii_rxd_z1;
            xlgmii_rxc_z2 <= xlgmii_rxc_z1;
        end if;
    end process;

------------------------------------------------------------------------------
-- STATE MACHINE TO DETECT FRAME STRUCTURE
------------------------------------------------------------------------------

    gen_current_mac_state : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            crc_do_reset <= '0';
            current_mac_state <= IDLE;
            current_mac_state_z1 <= IDLE;
            clear_finished_packet <= '0';
        elsif (rising_edge(mac_clk))then

            current_mac_state_z1 <= current_mac_state;

            crc_do_reset <= '0';
            clear_finished_packet <= '0';

            case current_mac_state is
                when IDLE =>
                current_mac_state <= IDLE;

                -- CAN'T HANDLE PACKETS SHORTER THAN SPECIFICATION OF 64 BYTES SO EXTEND CHECK OF START
                --if ((xlgmii_rxd(7 downto 0) = C_START_BYTE)and(xlgmii_rxc(0) = '1')and(mac_rx_enable = '1'))then
                if ((xlgmii_rxd(7 downto 0) = C_START_BYTE)and(xlgmii_rxc(31 downto 0) = X"00000001")and(mac_rx_enable = '1'))then
                    crc_do_reset <= '1';
                    clear_finished_packet <= '1';
                    current_mac_state <= REC_ALIGNED_0;
                --elsif ((xlgmii_rxd(71 downto 64) = C_START_BYTE)and(xlgmii_rxc(8) = '1')and(mac_rx_enable = '1'))then
                elsif ((xlgmii_rxd(71 downto 64) = C_START_BYTE)and(xlgmii_rxc(31 downto 8) = X"000001")and(mac_rx_enable = '1'))then
                    crc_do_reset <= '1';
                    clear_finished_packet <= '1';
                    current_mac_state <= REC_ALIGNED_64;
                --elsif ((xlgmii_rxd(135 downto 128) = C_START_BYTE)and(xlgmii_rxc(16) = '1')and(mac_rx_enable = '1'))then
                elsif ((xlgmii_rxd(135 downto 128) = C_START_BYTE)and(xlgmii_rxc(31 downto 16) = X"0001")and(mac_rx_enable = '1'))then
                    crc_do_reset <= '1';
                    clear_finished_packet <= '1';
                    current_mac_state <= REC_ALIGNED_128;
                --elsif ((xlgmii_rxd(199 downto 192) = C_START_BYTE)and(xlgmii_rxc(24) = '1')and(mac_rx_enable = '1'))then
                elsif ((xlgmii_rxd(199 downto 192) = C_START_BYTE)and(xlgmii_rxc(31 downto 24) = X"01")and(mac_rx_enable = '1'))then
                    crc_do_reset <= '1';
                    clear_finished_packet <= '1';
                    current_mac_state <= REC_ALIGNED_192;
                end if;

                when REC_ALIGNED_0 =>
                current_mac_state <= REC_ALIGNED_0;

                if (terminate_byte_found = '1')then
                    current_mac_state <= IDLE;
                end if;

                when REC_ALIGNED_64 =>
                current_mac_state <= REC_ALIGNED_64;

                if (terminate_byte_found = '1')then
                    current_mac_state <= IDLE;
                end if;

                when REC_ALIGNED_128 =>
                current_mac_state <= REC_ALIGNED_128;

                if (terminate_byte_found = '1')then
                    current_mac_state <= IDLE;
                end if;

                when REC_ALIGNED_192 =>
                current_mac_state <= REC_ALIGNED_192;

                if (terminate_byte_found = '1')then
                    current_mac_state <= IDLE;
                end if;

            end case;
        end if;
    end process;

    mac_rx_busy <= '0' when (current_mac_state = IDLE) else (not terminate_byte_found);

------------------------------------------------------------------------------
-- ALIGN DATA TO 256 BOUNDARY BASED ON LOCATION OF START BYTE
------------------------------------------------------------------------------

    -- 0 ALIGNED
    xlgmii_rxd_aligned_0(191 downto 0) <= xlgmii_rxd_z1(255 downto 64);
    xlgmii_rxd_aligned_0(255 downto 192) <= xlgmii_rxd(63 downto 0);
    xlgmii_rxc_aligned_0(23 downto 0) <= xlgmii_rxc_z1(31 downto 8);
    xlgmii_rxc_aligned_0(31 downto 24) <= xlgmii_rxc(7 downto 0);

    -- 64 ALIGNED
    xlgmii_rxd_aligned_64(127 downto 0) <= xlgmii_rxd_z1(255 downto 128);
    xlgmii_rxd_aligned_64(255 downto 128) <= xlgmii_rxd(127 downto 0);
    xlgmii_rxc_aligned_64(15 downto 0) <= xlgmii_rxc_z1(31 downto 16);
    xlgmii_rxc_aligned_64(31 downto 16) <= xlgmii_rxc(15 downto 0);

    -- 128 ALIGNED
    xlgmii_rxd_aligned_128(63 downto 0) <= xlgmii_rxd_z1(255 downto 192);
    xlgmii_rxd_aligned_128(255 downto 64) <= xlgmii_rxd(191 downto 0);
    xlgmii_rxc_aligned_128(7 downto 0) <= xlgmii_rxc_z1(31 downto 24);
    xlgmii_rxc_aligned_128(31 downto 8) <= xlgmii_rxc(23 downto 0);

    -- 192 ALIGNED
    xlgmii_rxd_aligned_192(255 downto 0) <= xlgmii_rxd(255 downto 0);
    xlgmii_rxc_aligned_192(31 downto 0) <= xlgmii_rxc(31 downto 0);

    xlgmii_rxd_aligned <=
    xlgmii_rxd_aligned_0 when (current_mac_state = REC_ALIGNED_0) else
    xlgmii_rxd_aligned_64 when (current_mac_state = REC_ALIGNED_64) else
    xlgmii_rxd_aligned_128 when (current_mac_state = REC_ALIGNED_128) else
    xlgmii_rxd_aligned_192 when (current_mac_state = REC_ALIGNED_192) else
    C_IDLE_TXD;

    xlgmii_rxc_aligned <=
    xlgmii_rxc_aligned_0 when (current_mac_state = REC_ALIGNED_0) else
    xlgmii_rxc_aligned_64 when (current_mac_state = REC_ALIGNED_64) else
    xlgmii_rxc_aligned_128 when (current_mac_state = REC_ALIGNED_128) else
    xlgmii_rxc_aligned_192 when (current_mac_state = REC_ALIGNED_192) else
    C_IDLE_TXC;

------------------------------------------------------------------------------
-- FIND TERMINATE BYTE AND LATCH RECEIVED CRC
------------------------------------------------------------------------------

    -- KEEP COPY OF PREVIOUS VALUE SO CAN RECONSTUCT RECEIVED CRC
    gen_xlgmii_rxd_aligned_z1 : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            xlgmii_rxd_aligned_z1 <= xlgmii_rxd_aligned;
            xlgmii_rxc_aligned_z1 <= xlgmii_rxc_aligned;
        end if;
    end process;

    -- MASK OUT END OF PACKET (INCLUDING CRC)
    -- NEED TO EXTRACT LOCATION OF CRC
    -- ALSO NEED TO DO THIS TWO 256 bit WORDS IN ADVANCE IN CASE PART OF CRC IN PREVIOUS 256 bit WORD
    gen_xlgmii_rxd_crc_masked : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            xlgmii_rxd_crc_masked <= (others => '0');
            xlgmii_rxc_crc_masked <= (others => '0');
            next_xlgmii_rxd_crc_masked <= (others => '0');
            next_xlgmii_rxc_crc_masked <= (others => '0');
            use_next_xlgmii_rxd_crc_masked <= '0';
            finished_packet <= '0';
            --terminate_byte_found <= '0';
        elsif (rising_edge(mac_clk))then
            --terminate_byte_found <= '0';
            if (clear_finished_packet = '1')then
                finished_packet <= '0';
            end if;

            if (use_next_xlgmii_rxd_crc_masked = '1')then
                xlgmii_rxd_crc_masked <= next_xlgmii_rxd_crc_masked;
                xlgmii_rxc_crc_masked <= next_xlgmii_rxc_crc_masked;
                use_next_xlgmii_rxd_crc_masked <= '0';
                finished_packet <= '1';
                --terminate_byte_found <= '1';
            else
                use_next_xlgmii_rxd_crc_masked <= '0';
                if ((xlgmii_rxd_aligned(7 downto 0) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(0) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"0FFFFFFF"; -- UPPER 32 BITS ARE CRC
                    received_crc <= xlgmii_rxd_aligned_z1(255 downto 224);
                    finished_packet <= '1';
                    --terminate_byte_found <= '1';
                elsif ((xlgmii_rxd_aligned(15 downto 8) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(1) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"1FFFFFFF"; -- UPPER 24 BITS ARE CRC
                    received_crc <= xlgmii_rxd_aligned(7 downto 0) & xlgmii_rxd_aligned_z1(255 downto 232);
                    finished_packet <= '1';
                    --terminate_byte_found <= '1';
                elsif ((xlgmii_rxd_aligned(23 downto 16) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(2) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"3FFFFFFF"; -- UPPER 16 BITS ARE CRC
                    received_crc <= xlgmii_rxd_aligned(15 downto 0) & xlgmii_rxd_aligned_z1(255 downto 240);
                    finished_packet <= '1';
                    --terminate_byte_found <= '1';
                elsif ((xlgmii_rxd_aligned(31 downto 24) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(3) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"7FFFFFFF"; -- UPPER 8 BITS ARE CRC
                    received_crc <= xlgmii_rxd_aligned(23 downto 0) & xlgmii_rxd_aligned_z1(255 downto 248);
                    finished_packet <= '1';
                    --terminate_byte_found <= '1';
                elsif ((xlgmii_rxd_aligned(39 downto 32) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(4) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    received_crc <= xlgmii_rxd_aligned(31 downto 0);
                    finished_packet <= '1';
                    --terminate_byte_found <= '1';
                elsif ((xlgmii_rxd_aligned(47 downto 40) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(5) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"00000001"; -- 1 BYTE OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(39 downto 8);
                elsif ((xlgmii_rxd_aligned(55 downto 48) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(6) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"00000003"; -- 2 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(47 downto 16);
                elsif ((xlgmii_rxd_aligned(63 downto 56) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(7) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"00000007"; -- 3 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(55 downto 24);
                elsif ((xlgmii_rxd_aligned(71 downto 64) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(8) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"0000000F"; -- 4 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(63 downto 32);
                elsif ((xlgmii_rxd_aligned(79 downto 72) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(9) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"0000001F"; -- 5 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(71 downto 40);
                elsif ((xlgmii_rxd_aligned(87 downto 80) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(10) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"0000003F"; -- 6 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(79 downto 48);
                elsif ((xlgmii_rxd_aligned(95 downto 88) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(11) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"0000007F"; -- 7 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(87 downto 56);
                elsif ((xlgmii_rxd_aligned(103 downto 96) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(12) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"000000FF"; -- 8 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(95 downto 64);
                elsif ((xlgmii_rxd_aligned(111 downto 104) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(13) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"000001FF"; -- 9 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(103 downto 72);
                elsif ((xlgmii_rxd_aligned(119 downto 112) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(14) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"000003FF"; -- 10 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(111 downto 80);
                elsif ((xlgmii_rxd_aligned(127 downto 120) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(15) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"000007FF"; -- 11 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(119 downto 88);
                elsif ((xlgmii_rxd_aligned(135 downto 128) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(16) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"00000FFF"; -- 12 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(127 downto 96);
                elsif ((xlgmii_rxd_aligned(143 downto 136) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(17) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"00001FFF"; -- 13 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(135 downto 104);
                elsif ((xlgmii_rxd_aligned(151 downto 144) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(18) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"00003FFF"; -- 14 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(143 downto 112);
                elsif ((xlgmii_rxd_aligned(159 downto 152) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(19) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"00007FFF"; -- 15 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(151 downto 120);
                elsif ((xlgmii_rxd_aligned(167 downto 160) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(20) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"0000FFFF"; -- 16 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(159 downto 128);
                elsif ((xlgmii_rxd_aligned(175 downto 168) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(21) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"0001FFFF"; -- 17 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(167 downto 136);
                elsif ((xlgmii_rxd_aligned(183 downto 176) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(22) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"0003FFFF"; -- 18 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(175 downto 144);
                elsif ((xlgmii_rxd_aligned(191 downto 184) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(23) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"0007FFFF"; -- 19 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(183 downto 152);
                elsif ((xlgmii_rxd_aligned(199 downto 192) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(24) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"000FFFFF"; -- 20 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(191 downto 160);
                elsif ((xlgmii_rxd_aligned(207 downto 200) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(25) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"001FFFFF"; -- 21 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(199 downto 168);
                elsif ((xlgmii_rxd_aligned(215 downto 208) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(26) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"003FFFFF"; -- 22 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(207 downto 176);
                elsif ((xlgmii_rxd_aligned(223 downto 216) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(27) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"007FFFFF"; -- 23 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(215 downto 184);
                elsif ((xlgmii_rxd_aligned(231 downto 224) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(28) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"00FFFFFF"; -- 24 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(223 downto 192);
                elsif ((xlgmii_rxd_aligned(239 downto 232) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(29) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"01FFFFFF"; -- 25 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(231 downto 200);
                elsif ((xlgmii_rxd_aligned(247 downto 240) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(30) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"03FFFFFF"; -- 26 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(239 downto 208);
                elsif ((xlgmii_rxd_aligned(255 downto 248) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(31) = '1'))then
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    xlgmii_rxc_crc_masked <= X"FFFFFFFF"; -- NO CRC BITS
                    next_xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned;
                    next_xlgmii_rxc_crc_masked <= X"07FFFFFF"; -- 27 BYTES OF PAYLOAD
                    use_next_xlgmii_rxd_crc_masked <= '1';
                    finished_packet <= '1';
                    received_crc <= xlgmii_rxd_aligned(247 downto 216);
                else
                    xlgmii_rxd_crc_masked <= xlgmii_rxd_aligned_z1;
                    if (finished_packet = '0')then
                        xlgmii_rxc_crc_masked <= not xlgmii_rxc_aligned_z1;
                    else
                        xlgmii_rxc_crc_masked <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

    terminate_byte_found <= '1' when
    (((xlgmii_rxd_aligned(7 downto 0) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(0) = '1'))or
    ((xlgmii_rxd_aligned(15 downto 8) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(1) = '1'))or
    ((xlgmii_rxd_aligned(23 downto 16) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(2) = '1'))or
    ((xlgmii_rxd_aligned(31 downto 24) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(3) = '1'))or
    ((xlgmii_rxd_aligned(39 downto 32) = C_TERMINATE_BYTE)and(xlgmii_rxc_aligned(4) = '1')))else
    use_next_xlgmii_rxd_crc_masked;

------------------------------------------------------------------------------
-- CALCULATE CRC ON RECEIVED FRAME
------------------------------------------------------------------------------

    gen_crc_reset : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            crc_do_reset_z1 <= crc_do_reset;
            crc_reset <= crc_do_reset_z1;
        end if;
    end process;

    crc_data_in <= xlgmii_rxd_crc_masked;
    crc_data_in_val <= xlgmii_rxc_crc_masked;

    generate_mac_rx_crc : if RX_CRC_CHK_ENABLE = 1 generate
--        ska_mac_rx_crc_0 : ska_mac_rx_crc
--        port map(
--            clk             => mac_clk,
--            crc_reset       => crc_reset,
--            crc_init        => (others => '1'),
--            data_in         => crc_data_in,
--            data_in_val     => crc_data_in_val,
--            crc_out         => crc_out_old);

        ska_mac_rx_crc_multi_0 : ska_mac_rx_crc_multi
        port map(
            clk             => mac_clk,
            rst             => mac_rst,
            crc_reset       => crc_reset,
            crc_init        => (others => '1'),
            data_in         => crc_data_in,
            data_in_val     => crc_data_in_val,
            crc_out         => crc_out);
    end generate generate_mac_rx_crc;

------------------------------------------------------------------------------
-- REGISTER OUTPUT MULTIPLE TIMES TO ALLOW CRC CALCULATION DELAY
------------------------------------------------------------------------------

    gen_mac_rx_data : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            --crc_data_in_z1 <= crc_data_in;
            --crc_data_in_z2 <= crc_data_in_z1;
            mac_rx_data_i <= crc_data_in;

            --crc_data_in_val_z1 <= crc_data_in_val;
            --crc_data_in_val_z2 <= crc_data_in_val_z1;
            if (current_mac_state_z1 /= IDLE)then
                mac_rx_data_valid_i <= crc_data_in_val;
            else
                mac_rx_data_valid_i <= (others => '0');
            end if;

            mac_rx_data_i_z1 <= mac_rx_data_i;
            mac_rx_data_i_z2 <= mac_rx_data_i_z1;
            mac_rx_data_i_z3 <= mac_rx_data_i_z2;
            mac_rx_data_i_z4 <= mac_rx_data_i_z3;

            mac_rx_data_valid_i_z1 <= mac_rx_data_valid_i;
            mac_rx_data_valid_i_z2 <= mac_rx_data_valid_i_z1;
            mac_rx_data_valid_i_z3 <= mac_rx_data_valid_i_z2;
            mac_rx_data_valid_i_z4 <= mac_rx_data_valid_i_z3;

            terminate_byte_found_z1 <= terminate_byte_found;
            terminate_byte_found_z2 <= terminate_byte_found_z1;
            terminate_byte_found_z3 <= terminate_byte_found_z2;
            terminate_byte_found_z4 <= terminate_byte_found_z3;
            terminate_byte_found_z5 <= terminate_byte_found_z4;
            terminate_byte_found_z6 <= terminate_byte_found_z5;

            received_crc_z1 <= received_crc;
            received_crc_z2 <= received_crc_z1;
            received_crc_z3 <= received_crc_z2;
            -- ONLY GO UP TO Z3 FOR RECEIVED CRC BECAUSE OF VARIATION IN
            -- LOCATION OF CRC
            -- CRC IS LATCHED SO THIS PURELY PROTECTION AGAINST ARRIVAL
            -- OF A SECOND PACKET STRAIGHT AFTER THIS ONE


        end if;
    end process;

    mac_rx_data <= mac_rx_data_i_z4;
    mac_rx_data_valid <= mac_rx_data_valid_i_z4;

    generate_mac_rx_good_bad_frame_crc : if RX_CRC_CHK_ENABLE = 1 generate
        mac_rx_good_frame <= '1' when ((terminate_byte_found_z6 = '1')and(crc_out = received_crc_z3)) else '0';
        mac_rx_bad_frame <= '1' when ((terminate_byte_found_z6 = '1')and(crc_out /= received_crc_z3)) else '0';
    end generate generate_mac_rx_good_bad_frame_crc;

    generate_mac_rx_good_bad_frame_no_crc : if RX_CRC_CHK_ENABLE = 0 generate
        mac_rx_good_frame <= '1' when (terminate_byte_found_z6 = '1') else '0';
        mac_rx_bad_frame <= '0';
    end generate generate_mac_rx_good_bad_frame_no_crc;

end arch_ska_mac_rx;
