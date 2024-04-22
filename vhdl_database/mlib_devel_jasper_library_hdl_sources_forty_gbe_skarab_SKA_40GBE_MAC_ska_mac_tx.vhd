----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: ska_mac_tx - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- SKA 40GBE TX path - MAC
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

entity ska_mac_tx is
    port (
    -- MAC
    mac_clk             : in std_logic;
    mac_rst             : in std_logic;
    mac_tx_data         : in std_logic_vector(255 downto 0);
    mac_tx_data_valid   : in std_logic_vector(31 downto 0);
    mac_tx_start        : in std_logic;
    mac_tx_ready        : out std_logic;
    phy_tx_rst          : in std_logic;

    -- XLGMII
    xlgmii_txd      : out std_logic_vector(255 downto 0);
    xlgmii_txc      : out std_logic_vector(31 downto 0);
    xlgmii_txled    : out std_logic_vector(1 downto 0));
end ska_mac_tx;

architecture arch_ska_mac_tx of ska_mac_tx is

    constant C_IDLE_TXD : std_logic_vector(255 downto 0):= X"0707070707070707070707070707070707070707070707070707070707070707";
    constant C_IDLE_TXC : std_logic_vector(31 downto 0) := "11111111111111111111111111111111";
    constant C_PREAMBLE_IFG_TXD : std_logic_vector(127 downto 0) := X"D5555555555555FB0707070707070707";
    constant C_PREAMBLE_IFG_TXC : std_logic_vector(15 downto 0) := "0000000111111111";

    constant C_IDLE_BYTE : std_logic_vector(7 downto 0) := X"07";
    constant C_TERMINATE_BYTE : std_logic_vector(7 downto 0) := X"FD";

    type T_MAC_STATE is (
    IDLE,
    START_CRC,
    GEN_IFG_PREAMBLE_START_PAYLOAD,
    GEN_PAYLOAD,
    GEN_END_ALIGNED_0,
    GEN_END_ALIGNED_16,
    GEN_END_ALIGNED_64,
    GEN_END_ALIGNED_80,
    GEN_END_ALIGNED_128_PART1,
    GEN_END_ALIGNED_128_PART2,
    GEN_END_ALIGNED_144_PART1,
    GEN_END_ALIGNED_144_PART2,
    GEN_END_ALIGNED_192_PART1,
    GEN_END_ALIGNED_192_PART2,
    GEN_END_ALIGNED_208_PART1,
    GEN_END_ALIGNED_208_PART2);

    component ska_mac_tx_crc
    port (
        clk             : in std_logic;
        crc_reset       : in std_logic;
        crc_init        : in std_logic_vector(31 downto 0);
        data_in         : in std_logic_vector(255 downto 0);
        data_in_val     : in std_logic_vector(31 downto 0);
        crc_out         : out std_logic_vector(31 downto 0));
    end component;
    
    
    attribute ASYNC_REG : string;
    signal current_mac_state : T_MAC_STATE;

    signal mac_tx_data_z1 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z1 : std_logic_vector(31 downto 0);
    signal mac_tx_data_z2 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z2 : std_logic_vector(31 downto 0);
    signal mac_tx_data_z3 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z3 : std_logic_vector(31 downto 0);
    signal mac_tx_data_z4 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z4 : std_logic_vector(31 downto 0);

    signal crc_reset : std_logic;
    signal crc_data_in : std_logic_vector(255 downto 0);
    signal crc_data_in_val : std_logic_vector(31 downto 0);
    signal crc_out : std_logic_vector(31 downto 0);
    signal crc_out_z1 : std_logic_vector(31 downto 0);
    signal crc_first_128bits_data_in : std_logic_vector(255 downto 0);
    signal crc_first_128bits_data_in_val : std_logic_vector(31 downto 0);

    signal xlgmii_txd_i : std_logic_vector(255 downto 0);
    signal xlgmii_txc_i : std_logic_vector(31 downto 0);

    signal crc_payload : std_logic_vector(255 downto 0);
    signal crc_payload_val : std_logic_vector(31 downto 0);

    signal payload_txd : std_logic_vector(255 downto 0);
    signal payload_txc : std_logic_vector(31 downto 0);

    signal end_aligned_0_txd : std_logic_vector(255 downto 0);
    signal end_aligned_0_txc : std_logic_vector(31 downto 0);
    signal end_aligned_16_txd : std_logic_vector(255 downto 0);
    signal end_aligned_16_txc : std_logic_vector(31 downto 0);
    signal end_aligned_64_txd : std_logic_vector(255 downto 0);
    signal end_aligned_64_txc : std_logic_vector(31 downto 0);
    signal end_aligned_80_txd : std_logic_vector(255 downto 0);
    signal end_aligned_80_txc : std_logic_vector(31 downto 0);
    signal end_aligned_128_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_128_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_128_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_128_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_144_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_144_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_144_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_144_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_192_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_192_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_192_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_192_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_208_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_208_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_208_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_208_txc_part2 : std_logic_vector(31 downto 0);

    signal tx_activity_timeout_low : std_logic_vector(15 downto 0);
    signal tx_activity_timeout_low_over : std_logic;
    signal tx_activity_timeout_high : std_logic_vector(11 downto 0);
    signal tx_activity_timeout : std_logic;
    
    signal sPhyTxRstD1 : std_logic;
    signal sPhyTxRstD2 : std_logic;
    attribute ASYNC_REG of sPhyTxRstD1 : signal is "TRUE";
    attribute ASYNC_REG of sPhyTxRstD2 : signal is "TRUE";    

begin


-----------------------------------------------------------------------------------
-- CDC Synchronisation
-----------------------------------------------------------------------------------

     pCDCPhyRstSynchroniser : process(mac_clk)
     begin
     if (rising_edge(mac_clk))then
       sPhyTxRstD2 <= sPhyTxRstD1;
       sPhyTxRstD1 <= phy_tx_rst;
     end if;
     end process pCDCPhyRstSynchroniser; 

-----------------------------------------------------------------------------------
-- REGISTER TO HANDLE LATENCY THROUGH CRC
-----------------------------------------------------------------------------------

    gen_mac_tx_data_z : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            mac_tx_data_z1 <= mac_tx_data;
            mac_tx_data_valid_z1 <= mac_tx_data_valid;
            mac_tx_data_z2 <= mac_tx_data_z1;
            mac_tx_data_valid_z2 <= mac_tx_data_valid_z1;
            mac_tx_data_z3 <= mac_tx_data_z2;
            mac_tx_data_valid_z3 <= mac_tx_data_valid_z2;
            mac_tx_data_z4 <= mac_tx_data_z3;
            mac_tx_data_valid_z4 <= mac_tx_data_valid_z3;
        end if;
    end process;

-----------------------------------------------------------------------------------
-- STATE MACHINE TO CONSTRUCT ETHERNET FRAME
-----------------------------------------------------------------------------------

    gen_current_mac_state : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            current_mac_state <= IDLE;

        elsif (rising_edge(mac_clk))then
            case current_mac_state is
                when IDLE =>
                current_mac_state <= IDLE;

                if (mac_tx_start = '1')then
                    current_mac_state <= START_CRC;
                end if;

                when START_CRC =>
                current_mac_state <= GEN_IFG_PREAMBLE_START_PAYLOAD;

                when GEN_IFG_PREAMBLE_START_PAYLOAD =>
                current_mac_state <= GEN_PAYLOAD;

                when GEN_PAYLOAD =>
                current_mac_state <= GEN_PAYLOAD;

                if (mac_tx_data_valid = X"00000000")then
                    current_mac_state <= GEN_END_ALIGNED_0;
                elsif (mac_tx_data_valid = X"00000003")then
                    current_mac_state <= GEN_END_ALIGNED_16;
                elsif (mac_tx_data_valid = X"000000FF")then
                    current_mac_state <= GEN_END_ALIGNED_64;
                elsif (mac_tx_data_valid = X"000003FF")then
                    current_mac_state <= GEN_END_ALIGNED_80;
                elsif (mac_tx_data_valid = X"0000FFFF")then
                    current_mac_state <= GEN_END_ALIGNED_128_PART1;
                elsif (mac_tx_data_valid = X"0003FFFF")then
                    current_mac_state <= GEN_END_ALIGNED_144_PART1;
                elsif (mac_tx_data_valid = X"00FFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_192_PART1;
                elsif (mac_tx_data_valid = X"03FFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_208_PART1;
                else
                    current_mac_state <= GEN_PAYLOAD;
                end if;

                when GEN_END_ALIGNED_0 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_16 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_64 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_80 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_128_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_128_PART2;

                when GEN_END_ALIGNED_128_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_144_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_144_PART2;

                when GEN_END_ALIGNED_144_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_192_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_192_PART2;

                when GEN_END_ALIGNED_192_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_208_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_208_PART2;

                when GEN_END_ALIGNED_208_PART2 =>
                current_mac_state <= IDLE;

            end case;
        end if;
    end process;

    mac_tx_ready <= '1' when (current_mac_state = IDLE) else '0';

-----------------------------------------------------------------------------------
-- GENERATE ALL DIFFERENT END ALIGNMENT OPTIONS
-----------------------------------------------------------------------------------

    -- ALIGNED 0
    end_aligned_0_txd(127 downto 0) <= mac_tx_data_z2(255 downto 128);
    end_aligned_0_txd(159 downto 128) <= crc_out;
    end_aligned_0_txd(167 downto 160) <= C_TERMINATE_BYTE;
    end_aligned_0_txd(255 downto 168) <= X"0707070707070707070707";
    end_aligned_0_txc <= "11111111111100000000000000000000";

    -- ALIGNED 16
    end_aligned_16_txd(127 downto 0) <= mac_tx_data_z2(255 downto 128);
    end_aligned_16_txd(143 downto 128) <= mac_tx_data_z1(15 downto 0);
    end_aligned_16_txd(175 downto 144) <= crc_out;
    end_aligned_16_txd(183 downto 176) <= C_TERMINATE_BYTE;
    end_aligned_16_txd(255 downto 184) <= X"070707070707070707";
    end_aligned_16_txc <= "11111111110000000000000000000000";

    -- ALIGNED 64
    end_aligned_64_txd(127 downto 0) <= mac_tx_data_z2(255 downto 128);
    end_aligned_64_txd(191 downto 128) <= mac_tx_data_z1(63 downto 0);
    end_aligned_64_txd(223 downto 192) <= crc_out;
    end_aligned_64_txd(231 downto 224) <= C_TERMINATE_BYTE;
    end_aligned_64_txd(255 downto 232) <= X"070707";
    end_aligned_64_txc <= "11110000000000000000000000000000";

    -- ALIGNED 80
    end_aligned_80_txd(127 downto 0) <= mac_tx_data_z2(255 downto 128);
    end_aligned_80_txd(207 downto 128) <= mac_tx_data_z1(79 downto 0);
    end_aligned_80_txd(239 downto 208) <= crc_out;
    end_aligned_80_txd(247 downto 240) <= C_TERMINATE_BYTE;
    end_aligned_80_txd(255 downto 248) <= X"07";
    end_aligned_80_txc <= "11000000000000000000000000000000";

    -- ALIGNED 128
    end_aligned_128_txd_part1(127 downto 0) <= mac_tx_data_z2(255 downto 128);
    end_aligned_128_txd_part1(255 downto 128) <= mac_tx_data_z1(127 downto 0);
    end_aligned_128_txc_part1 <= (others => '0');

    end_aligned_128_txd_part2(31 downto 0) <= crc_out_z1;
    end_aligned_128_txd_part2(39 downto 32) <= C_TERMINATE_BYTE;
    end_aligned_128_txd_part2(255 downto 40) <= X"070707070707070707070707070707070707070707070707070707";
    end_aligned_128_txc_part2 <= "11111111111111111111111111110000";

    -- ALIGNED 144
    end_aligned_144_txd_part1(127 downto 0) <= mac_tx_data_z2(255 downto 128);
    end_aligned_144_txd_part1(255 downto 128) <= mac_tx_data_z1(127 downto 0);
    end_aligned_144_txc_part1 <= (others => '0');

    end_aligned_144_txd_part2(15 downto 0) <= mac_tx_data_z2(143 downto 128);
    end_aligned_144_txd_part2(47 downto 16) <= crc_out;
    end_aligned_144_txd_part2(55 downto 48) <= C_TERMINATE_BYTE;
    end_aligned_144_txd_part2(255 downto 56) <= X"07070707070707070707070707070707070707070707070707";
    end_aligned_144_txc_part2 <= "11111111111111111111111111000000";

    -- ALIGNED 192
    end_aligned_192_txd_part1(127 downto 0) <= mac_tx_data_z2(255 downto 128);
    end_aligned_192_txd_part1(255 downto 128) <= mac_tx_data_z1(127 downto 0);
    end_aligned_192_txc_part1 <= (others => '0');

    end_aligned_192_txd_part2(63 downto 0) <= mac_tx_data_z2(191 downto 128);
    end_aligned_192_txd_part2(95 downto 64) <= crc_out;
    end_aligned_192_txd_part2(103 downto 96) <= C_TERMINATE_BYTE;
    end_aligned_192_txd_part2(255 downto 104) <= X"07070707070707070707070707070707070707";
    end_aligned_192_txc_part2 <= "11111111111111111111000000000000";

    -- ALIGNED 208
    end_aligned_208_txd_part1(127 downto 0) <= mac_tx_data_z2(255 downto 128);
    end_aligned_208_txd_part1(255 downto 128) <= mac_tx_data_z1(127 downto 0);
    end_aligned_208_txc_part1 <= (others => '0');

    end_aligned_208_txd_part2(79 downto 0) <= mac_tx_data_z2(207 downto 128);
    end_aligned_208_txd_part2(111 downto 80) <= crc_out;
    end_aligned_208_txd_part2(119 downto 112) <= C_TERMINATE_BYTE;
    end_aligned_208_txd_part2(255 downto 120) <= X"0707070707070707070707070707070707";
    end_aligned_208_txc_part2 <= "11111111111111111100000000000000";

-----------------------------------------------------------------------------------
-- DECODE STATES
-----------------------------------------------------------------------------------

    payload_txd <= mac_tx_data_z1(127 downto 0) & mac_tx_data_z2(255 downto 128);
    payload_txc <= (others => '0');

    xlgmii_txd_i <=
    (mac_tx_data_z1(127 downto 0) & C_PREAMBLE_IFG_TXD) when (current_mac_state = GEN_IFG_PREAMBLE_START_PAYLOAD) else
    payload_txd when (current_mac_state = GEN_PAYLOAD) else
    end_aligned_0_txd when (current_mac_state = GEN_END_ALIGNED_0) else
    end_aligned_16_txd when (current_mac_state = GEN_END_ALIGNED_16) else
    end_aligned_64_txd when (current_mac_state = GEN_END_ALIGNED_64) else
    end_aligned_80_txd when (current_mac_state = GEN_END_ALIGNED_80) else
    end_aligned_128_txd_part1 when (current_mac_state = GEN_END_ALIGNED_128_PART1) else
    end_aligned_128_txd_part2 when (current_mac_state = GEN_END_ALIGNED_128_PART2) else
    end_aligned_144_txd_part1 when (current_mac_state = GEN_END_ALIGNED_144_PART1) else
    end_aligned_144_txd_part2 when (current_mac_state = GEN_END_ALIGNED_144_PART2) else
    end_aligned_192_txd_part1 when (current_mac_state = GEN_END_ALIGNED_192_PART1) else
    end_aligned_192_txd_part2 when (current_mac_state = GEN_END_ALIGNED_192_PART2) else
    end_aligned_208_txd_part1 when (current_mac_state = GEN_END_ALIGNED_208_PART1) else
    end_aligned_208_txd_part2 when (current_mac_state = GEN_END_ALIGNED_208_PART2) else
    C_IDLE_TXD;

    xlgmii_txc_i <=
    (X"0000" & C_PREAMBLE_IFG_TXC) when (current_mac_state = GEN_IFG_PREAMBLE_START_PAYLOAD) else
    payload_txc when (current_mac_state = GEN_PAYLOAD) else
    end_aligned_0_txc when (current_mac_state = GEN_END_ALIGNED_0) else
    end_aligned_16_txc when (current_mac_state = GEN_END_ALIGNED_16) else
    end_aligned_64_txc when (current_mac_state = GEN_END_ALIGNED_64) else
    end_aligned_80_txc when (current_mac_state = GEN_END_ALIGNED_80) else
    end_aligned_128_txc_part1 when (current_mac_state = GEN_END_ALIGNED_128_PART1) else
    end_aligned_128_txc_part2 when (current_mac_state = GEN_END_ALIGNED_128_PART2) else
    end_aligned_144_txc_part1 when (current_mac_state = GEN_END_ALIGNED_144_PART1) else
    end_aligned_144_txc_part2 when (current_mac_state = GEN_END_ALIGNED_144_PART2) else
    end_aligned_192_txc_part1 when (current_mac_state = GEN_END_ALIGNED_192_PART1) else
    end_aligned_192_txc_part2 when (current_mac_state = GEN_END_ALIGNED_192_PART2) else
    end_aligned_208_txc_part1 when (current_mac_state = GEN_END_ALIGNED_208_PART1) else
    end_aligned_208_txc_part2 when (current_mac_state = GEN_END_ALIGNED_208_PART2) else
    C_IDLE_TXC;

-----------------------------------------------------------------------------------
-- CRC
-----------------------------------------------------------------------------------

    crc_reset <= '1' when (current_mac_state = START_CRC) else '0';

    crc_payload(127 downto 0) <= mac_tx_data_z1(255 downto 128);
    crc_payload(255 downto 128) <= mac_tx_data(127 downto 0);

    crc_payload_val(15 downto 0) <= mac_tx_data_valid_z1(31 downto 16);
    crc_payload_val(31 downto 16) <= mac_tx_data_valid(15 downto 0);

    -- SHIFT FIRST 128 BITS DOWN TO LEFT TO MATCH NORMAL CRC BYTE ORDERING
    crc_first_128bits_data_in <= X"00000000000000000000000000000000" & mac_tx_data(127 downto 0);
    crc_first_128bits_data_in_val <= X"0000FFFF";

    crc_data_in <=
    crc_first_128bits_data_in when (current_mac_state = START_CRC) else
    crc_payload;

    crc_data_in_val <=
    crc_first_128bits_data_in_val when (current_mac_state = START_CRC) else
    crc_payload_val;

    ska_mac_tx_crc_0 : ska_mac_tx_crc
    port map(
        clk             => mac_clk,
        crc_reset       => crc_reset,
        crc_init        => (others => '1'),
        data_in         => crc_data_in,
        data_in_val     => crc_data_in_val,
        crc_out         => crc_out);

    gen_crc_out_z1 : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            crc_out_z1 <= crc_out;
        end if;
    end process;

-----------------------------------------------------------------------------------
-- REGISTER OUTPUT
-----------------------------------------------------------------------------------

    gen_xlgmii_txd : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            xlgmii_txd <= xlgmii_txd_i;
            xlgmii_txc <= xlgmii_txc_i;
        end if;
    end process;

-----------------------------------------------------------------------------------
-- LED CONTROL
-----------------------------------------------------------------------------------

    gen_xlgmii_txled : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            xlgmii_txled <= "00";
        elsif (rising_edge(mac_clk))then
            -- IF OUT OF RESET, THEN LINK ENABLED
            if (sPhyTxRstD2 = '1')then
                xlgmii_txled <= "00";
            else
                xlgmii_txled(0) <= '1';

                -- RESET ACTIVITY EVERY 107 ms
                if (tx_activity_timeout = '1')then
                    xlgmii_txled(1) <= '0';
                elsif (mac_tx_start = '1')then
                    xlgmii_txled(1) <= '1';
                end if;
            end if;
        end if;
    end process;

    gen_tx_activity_timeout_low : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            tx_activity_timeout_low <= (others => '0');
            tx_activity_timeout_low_over <= '0';
        elsif (rising_edge(mac_clk))then
            tx_activity_timeout_low_over <= '0';

            if (mac_tx_start = '1')then
                tx_activity_timeout_low <= (others => '0');
                tx_activity_timeout_low_over <= '0';
            else
                if (tx_activity_timeout_low = X"FFFF")then
                    tx_activity_timeout_low_over <= '1';
                    tx_activity_timeout_low <= (others => '0');
                else
                    tx_activity_timeout_low <= tx_activity_timeout_low + X"0001";
                end if;
            end if;
        end if;
    end process;

    gen_tx_activity_timeout_high : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            tx_activity_timeout_high <= (others => '0');
            tx_activity_timeout <= '0';
        elsif (rising_edge(mac_clk))then
            tx_activity_timeout <= '0';

            if (mac_tx_start = '1')then
                tx_activity_timeout_high <= (others => '0');
                tx_activity_timeout <= '0';
            else
                if (tx_activity_timeout_low_over = '1')then
                    if (tx_activity_timeout_high = X"FFF")then
                        tx_activity_timeout_high <= (others => '0');
                        tx_activity_timeout <= '1';
                    else
                        tx_activity_timeout_high <= tx_activity_timeout_high + X"001";
                    end if;
                end if;
            end if;
        end if;
    end process;

end arch_ska_mac_tx;
