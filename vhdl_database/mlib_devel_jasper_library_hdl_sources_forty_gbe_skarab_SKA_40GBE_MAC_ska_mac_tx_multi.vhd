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

entity ska_mac_tx_multi is
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
end ska_mac_tx_multi;

architecture arch_ska_mac_tx_multi of ska_mac_tx_multi is

    constant C_IDLE_TXD : std_logic_vector(255 downto 0):= X"0707070707070707070707070707070707070707070707070707070707070707";
    constant C_IDLE_TXC : std_logic_vector(31 downto 0) := "11111111111111111111111111111111";
    constant C_PREAMBLE_IFG_TXD : std_logic_vector(127 downto 0) := X"D5555555555555FB0707070707070707";
    constant C_PREAMBLE_IFG_TXC : std_logic_vector(15 downto 0) := "0000000111111111";

    constant C_IDLE_BYTE : std_logic_vector(7 downto 0) := X"07";
    constant C_TERMINATE_BYTE : std_logic_vector(7 downto 0) := X"FD";

    type T_MAC_STATE is (
    IDLE,
    START_CRC,
    CRC_LATENCY_1,
    CRC_LATENCY_2,
    CRC_LATENCY_3,
    GEN_IFG_PREAMBLE_START_PAYLOAD,
    GEN_PAYLOAD,
    GEN_END_ALIGNED_0,
    GEN_END_ALIGNED_8,
    GEN_END_ALIGNED_16,
    GEN_END_ALIGNED_24,
    GEN_END_ALIGNED_32,
    GEN_END_ALIGNED_40,
    GEN_END_ALIGNED_48,
    GEN_END_ALIGNED_56,
    GEN_END_ALIGNED_64,
    GEN_END_ALIGNED_72,
    GEN_END_ALIGNED_80,
    GEN_END_ALIGNED_88,
    GEN_END_ALIGNED_96_PART1,
    GEN_END_ALIGNED_96_PART2,
    GEN_END_ALIGNED_104_PART1,
    GEN_END_ALIGNED_104_PART2,
    GEN_END_ALIGNED_112_PART1,
    GEN_END_ALIGNED_112_PART2,
    GEN_END_ALIGNED_120_PART1,
    GEN_END_ALIGNED_120_PART2,
    GEN_END_ALIGNED_128_PART1,
    GEN_END_ALIGNED_128_PART2,
    GEN_END_ALIGNED_136_PART1,
    GEN_END_ALIGNED_136_PART2,
    GEN_END_ALIGNED_144_PART1,
    GEN_END_ALIGNED_144_PART2,
    GEN_END_ALIGNED_152_PART1,
    GEN_END_ALIGNED_152_PART2,
    GEN_END_ALIGNED_160_PART1,
    GEN_END_ALIGNED_160_PART2,
    GEN_END_ALIGNED_168_PART1,
    GEN_END_ALIGNED_168_PART2,
    GEN_END_ALIGNED_176_PART1,
    GEN_END_ALIGNED_176_PART2,
    GEN_END_ALIGNED_184_PART1,
    GEN_END_ALIGNED_184_PART2,
    GEN_END_ALIGNED_192_PART1,
    GEN_END_ALIGNED_192_PART2,
    GEN_END_ALIGNED_200_PART1,
    GEN_END_ALIGNED_200_PART2,
    GEN_END_ALIGNED_208_PART1,
    GEN_END_ALIGNED_208_PART2,
    GEN_END_ALIGNED_216_PART1,
    GEN_END_ALIGNED_216_PART2,
    GEN_END_ALIGNED_224_PART1,
    GEN_END_ALIGNED_224_PART2,
    GEN_END_ALIGNED_232_PART1,
    GEN_END_ALIGNED_232_PART2,
    GEN_END_ALIGNED_240_PART1,
    GEN_END_ALIGNED_240_PART2,
    GEN_END_ALIGNED_248_PART1,
    GEN_END_ALIGNED_248_PART2);

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

    signal current_mac_state : T_MAC_STATE;

    signal mac_tx_data_z1 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z1 : std_logic_vector(31 downto 0);
    signal mac_tx_data_z2 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z2 : std_logic_vector(31 downto 0);
    signal mac_tx_data_z3 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z3 : std_logic_vector(31 downto 0);
    signal mac_tx_data_z4 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z4 : std_logic_vector(31 downto 0);
    signal mac_tx_data_z5 : std_logic_vector(255 downto 0);
    signal mac_tx_data_valid_z5 : std_logic_vector(31 downto 0);

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
    signal end_aligned_8_txd : std_logic_vector(255 downto 0);
    signal end_aligned_8_txc : std_logic_vector(31 downto 0);
    signal end_aligned_16_txd : std_logic_vector(255 downto 0);
    signal end_aligned_16_txc : std_logic_vector(31 downto 0);
    signal end_aligned_24_txd : std_logic_vector(255 downto 0);
    signal end_aligned_24_txc : std_logic_vector(31 downto 0);
    signal end_aligned_32_txd : std_logic_vector(255 downto 0);
    signal end_aligned_32_txc : std_logic_vector(31 downto 0);
    signal end_aligned_40_txd : std_logic_vector(255 downto 0);
    signal end_aligned_40_txc : std_logic_vector(31 downto 0);
    signal end_aligned_48_txd : std_logic_vector(255 downto 0);
    signal end_aligned_48_txc : std_logic_vector(31 downto 0);
    signal end_aligned_56_txd : std_logic_vector(255 downto 0);
    signal end_aligned_56_txc : std_logic_vector(31 downto 0);
    signal end_aligned_64_txd : std_logic_vector(255 downto 0);
    signal end_aligned_64_txc : std_logic_vector(31 downto 0);
    signal end_aligned_72_txd : std_logic_vector(255 downto 0);
    signal end_aligned_72_txc : std_logic_vector(31 downto 0);
    signal end_aligned_80_txd : std_logic_vector(255 downto 0);
    signal end_aligned_80_txc : std_logic_vector(31 downto 0);
    signal end_aligned_88_txd : std_logic_vector(255 downto 0);
    signal end_aligned_88_txc : std_logic_vector(31 downto 0);
    signal end_aligned_96_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_96_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_96_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_96_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_104_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_104_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_104_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_104_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_112_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_112_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_112_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_112_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_120_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_120_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_120_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_120_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_128_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_128_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_128_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_128_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_136_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_136_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_136_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_136_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_144_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_144_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_144_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_144_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_152_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_152_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_152_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_152_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_160_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_160_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_160_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_160_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_168_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_168_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_168_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_168_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_176_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_176_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_176_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_176_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_184_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_184_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_184_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_184_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_192_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_192_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_192_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_192_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_200_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_200_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_200_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_200_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_208_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_208_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_208_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_208_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_216_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_216_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_216_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_216_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_224_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_224_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_224_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_224_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_232_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_232_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_232_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_232_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_240_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_240_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_240_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_240_txc_part2 : std_logic_vector(31 downto 0);
    signal end_aligned_248_txd_part1 : std_logic_vector(255 downto 0);
    signal end_aligned_248_txc_part1 : std_logic_vector(31 downto 0);
    signal end_aligned_248_txd_part2 : std_logic_vector(255 downto 0);
    signal end_aligned_248_txc_part2 : std_logic_vector(31 downto 0);

    signal tx_activity_timeout_low : std_logic_vector(15 downto 0);
    signal tx_activity_timeout_low_over : std_logic;
    signal tx_activity_timeout_high : std_logic_vector(11 downto 0);
    signal tx_activity_timeout : std_logic;

begin

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
            mac_tx_data_z5 <= mac_tx_data_z4;
            mac_tx_data_valid_z5 <= mac_tx_data_valid_z4;
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
                current_mac_state <= CRC_LATENCY_1;

                when CRC_LATENCY_1 =>
                current_mac_state <= CRC_LATENCY_2;

                when CRC_LATENCY_2 =>
                current_mac_state <= CRC_LATENCY_3;

                when CRC_LATENCY_3 =>
                current_mac_state <= GEN_IFG_PREAMBLE_START_PAYLOAD;

                when GEN_IFG_PREAMBLE_START_PAYLOAD =>
                current_mac_state <= GEN_PAYLOAD;

                when GEN_PAYLOAD =>
                current_mac_state <= GEN_PAYLOAD;

                if (mac_tx_data_valid_z3 = X"00000000")then
                    current_mac_state <= GEN_END_ALIGNED_0;
                elsif (mac_tx_data_valid_z3 = X"00000001")then
                    current_mac_state <= GEN_END_ALIGNED_8;
                elsif (mac_tx_data_valid_z3 = X"00000003")then
                    current_mac_state <= GEN_END_ALIGNED_16;
                elsif (mac_tx_data_valid_z3 = X"00000007")then
                    current_mac_state <= GEN_END_ALIGNED_24;
                elsif (mac_tx_data_valid_z3 = X"0000000F")then
                    current_mac_state <= GEN_END_ALIGNED_32;
                elsif (mac_tx_data_valid_z3 = X"0000001F")then
                    current_mac_state <= GEN_END_ALIGNED_40;
                elsif (mac_tx_data_valid_z3 = X"0000003F")then
                    current_mac_state <= GEN_END_ALIGNED_48;
                elsif (mac_tx_data_valid_z3 = X"0000007F")then
                    current_mac_state <= GEN_END_ALIGNED_56;
                elsif (mac_tx_data_valid_z3 = X"000000FF")then
                    current_mac_state <= GEN_END_ALIGNED_64;
                elsif (mac_tx_data_valid_z3 = X"000001FF")then
                    current_mac_state <= GEN_END_ALIGNED_72;
                elsif (mac_tx_data_valid_z3 = X"000003FF")then
                    current_mac_state <= GEN_END_ALIGNED_80;
                elsif (mac_tx_data_valid_z3 = X"000007FF")then
                    current_mac_state <= GEN_END_ALIGNED_88;
                elsif (mac_tx_data_valid_z3 = X"00000FFF")then
                    current_mac_state <= GEN_END_ALIGNED_96_PART1;
                elsif (mac_tx_data_valid_z3 = X"00001FFF")then
                    current_mac_state <= GEN_END_ALIGNED_104_PART1;
                elsif (mac_tx_data_valid_z3 = X"00003FFF")then
                    current_mac_state <= GEN_END_ALIGNED_112_PART1;
                elsif (mac_tx_data_valid_z3 = X"00007FFF")then
                    current_mac_state <= GEN_END_ALIGNED_120_PART1;
                elsif (mac_tx_data_valid_z3 = X"0000FFFF")then
                    current_mac_state <= GEN_END_ALIGNED_128_PART1;
                elsif (mac_tx_data_valid_z3 = X"0001FFFF")then
                    current_mac_state <= GEN_END_ALIGNED_136_PART1;
                elsif (mac_tx_data_valid_z3 = X"0003FFFF")then
                    current_mac_state <= GEN_END_ALIGNED_144_PART1;
                elsif (mac_tx_data_valid_z3 = X"0007FFFF")then
                    current_mac_state <= GEN_END_ALIGNED_152_PART1;
                elsif (mac_tx_data_valid_z3 = X"000FFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_160_PART1;
                elsif (mac_tx_data_valid_z3 = X"001FFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_168_PART1;
                elsif (mac_tx_data_valid_z3 = X"003FFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_176_PART1;
                elsif (mac_tx_data_valid_z3 = X"007FFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_184_PART1;
                elsif (mac_tx_data_valid_z3 = X"00FFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_192_PART1;
                elsif (mac_tx_data_valid_z3 = X"01FFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_200_PART1;
                elsif (mac_tx_data_valid_z3 = X"03FFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_208_PART1;
                elsif (mac_tx_data_valid_z3 = X"07FFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_216_PART1;
                elsif (mac_tx_data_valid_z3 = X"0FFFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_224_PART1;
                elsif (mac_tx_data_valid_z3 = X"1FFFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_232_PART1;
                elsif (mac_tx_data_valid_z3 = X"3FFFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_240_PART1;
                elsif (mac_tx_data_valid_z3 = X"7FFFFFFF")then
                    current_mac_state <= GEN_END_ALIGNED_248_PART1;
                else
                    current_mac_state <= GEN_PAYLOAD;
                end if;

                when GEN_END_ALIGNED_0 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_8 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_16 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_24 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_32 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_40 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_48 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_56 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_64 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_72 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_80 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_88 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_96_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_96_PART2;

                when GEN_END_ALIGNED_96_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_104_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_104_PART2;

                when GEN_END_ALIGNED_104_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_112_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_112_PART2;

                when GEN_END_ALIGNED_112_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_120_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_120_PART2;

                when GEN_END_ALIGNED_120_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_128_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_128_PART2;

                when GEN_END_ALIGNED_128_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_136_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_136_PART2;

                when GEN_END_ALIGNED_136_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_144_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_144_PART2;

                when GEN_END_ALIGNED_144_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_152_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_152_PART2;

                when GEN_END_ALIGNED_152_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_160_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_160_PART2;

                when GEN_END_ALIGNED_160_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_168_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_168_PART2;

                when GEN_END_ALIGNED_168_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_176_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_176_PART2;

                when GEN_END_ALIGNED_176_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_184_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_184_PART2;

                when GEN_END_ALIGNED_184_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_192_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_192_PART2;

                when GEN_END_ALIGNED_192_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_200_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_200_PART2;

                when GEN_END_ALIGNED_200_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_208_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_208_PART2;

                when GEN_END_ALIGNED_208_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_216_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_216_PART2;

                when GEN_END_ALIGNED_216_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_224_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_224_PART2;

                when GEN_END_ALIGNED_224_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_232_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_232_PART2;

                when GEN_END_ALIGNED_232_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_240_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_240_PART2;

                when GEN_END_ALIGNED_240_PART2 =>
                current_mac_state <= IDLE;

                when GEN_END_ALIGNED_248_PART1 =>
                current_mac_state <= GEN_END_ALIGNED_248_PART2;

                when GEN_END_ALIGNED_248_PART2 =>
                current_mac_state <= IDLE;

            end case;
        end if;
    end process;

    mac_tx_ready <= '1' when (current_mac_state = IDLE) else '0';

-----------------------------------------------------------------------------------
-- GENERATE ALL DIFFERENT END ALIGNMENT OPTIONS
-----------------------------------------------------------------------------------

    -- ALIGNED 0
    end_aligned_0_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_0_txd(159 downto 128) <= crc_out;
    end_aligned_0_txd(167 downto 160) <= C_TERMINATE_BYTE;
    end_aligned_0_txd(255 downto 168) <= X"0707070707070707070707";
    end_aligned_0_txc <= "11111111111100000000000000000000";

    -- ALIGNED 8
    end_aligned_8_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_8_txd(135 downto 128) <= mac_tx_data_z4(7 downto 0);
    end_aligned_8_txd(167 downto 136) <= crc_out;
    end_aligned_8_txd(175 downto 168) <= C_TERMINATE_BYTE;
    end_aligned_8_txd(255 downto 176) <= X"07070707070707070707";
    end_aligned_8_txc <= "11111111111000000000000000000000";

    -- ALIGNED 16
    end_aligned_16_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_16_txd(143 downto 128) <= mac_tx_data_z4(15 downto 0);
    end_aligned_16_txd(175 downto 144) <= crc_out;
    end_aligned_16_txd(183 downto 176) <= C_TERMINATE_BYTE;
    end_aligned_16_txd(255 downto 184) <= X"070707070707070707";
    end_aligned_16_txc <= "11111111110000000000000000000000";

    -- ALIGNED 24
    end_aligned_24_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_24_txd(151 downto 128) <= mac_tx_data_z4(23 downto 0);
    end_aligned_24_txd(183 downto 152) <= crc_out;
    end_aligned_24_txd(191 downto 184) <= C_TERMINATE_BYTE;
    end_aligned_24_txd(255 downto 192) <= X"0707070707070707";
    end_aligned_24_txc <= "11111111100000000000000000000000";

    -- ALIGNED 32
    end_aligned_32_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_32_txd(159 downto 128) <= mac_tx_data_z4(31 downto 0);
    end_aligned_32_txd(191 downto 160) <= crc_out;
    end_aligned_32_txd(199 downto 192) <= C_TERMINATE_BYTE;
    end_aligned_32_txd(255 downto 200) <= X"07070707070707";
    end_aligned_32_txc <= "11111111000000000000000000000000";

    -- ALIGNED 40
    end_aligned_40_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_40_txd(167 downto 128) <= mac_tx_data_z4(39 downto 0);
    end_aligned_40_txd(199 downto 168) <= crc_out;
    end_aligned_40_txd(207 downto 200) <= C_TERMINATE_BYTE;
    end_aligned_40_txd(255 downto 208) <= X"070707070707";
    end_aligned_40_txc <= "11111110000000000000000000000000";

    -- ALIGNED 48
    end_aligned_48_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_48_txd(175 downto 128) <= mac_tx_data_z4(47 downto 0);
    end_aligned_48_txd(207 downto 176) <= crc_out;
    end_aligned_48_txd(215 downto 208) <= C_TERMINATE_BYTE;
    end_aligned_48_txd(255 downto 216) <= X"0707070707";
    end_aligned_48_txc <= "11111100000000000000000000000000";

    -- ALIGNED 56
    end_aligned_56_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_56_txd(183 downto 128) <= mac_tx_data_z4(55 downto 0);
    end_aligned_56_txd(215 downto 184) <= crc_out;
    end_aligned_56_txd(223 downto 216) <= C_TERMINATE_BYTE;
    end_aligned_56_txd(255 downto 224) <= X"07070707";
    end_aligned_56_txc <= "11111000000000000000000000000000";

    -- ALIGNED 64
    end_aligned_64_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_64_txd(191 downto 128) <= mac_tx_data_z4(63 downto 0);
    end_aligned_64_txd(223 downto 192) <= crc_out;
    end_aligned_64_txd(231 downto 224) <= C_TERMINATE_BYTE;
    end_aligned_64_txd(255 downto 232) <= X"070707";
    end_aligned_64_txc <= "11110000000000000000000000000000";

    -- ALIGNED 72
    end_aligned_72_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_72_txd(199 downto 128) <= mac_tx_data_z4(71 downto 0);
    end_aligned_72_txd(231 downto 200) <= crc_out;
    end_aligned_72_txd(239 downto 232) <= C_TERMINATE_BYTE;
    end_aligned_72_txd(255 downto 240) <= X"0707";
    end_aligned_72_txc <= "11100000000000000000000000000000";

    -- ALIGNED 80
    end_aligned_80_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_80_txd(207 downto 128) <= mac_tx_data_z4(79 downto 0);
    end_aligned_80_txd(239 downto 208) <= crc_out;
    end_aligned_80_txd(247 downto 240) <= C_TERMINATE_BYTE;
    end_aligned_80_txd(255 downto 248) <= X"07";
    end_aligned_80_txc <= "11000000000000000000000000000000";

    -- ALIGNED 88
    end_aligned_88_txd(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_88_txd(215 downto 128) <= mac_tx_data_z4(87 downto 0);
    end_aligned_88_txd(247 downto 216) <= crc_out;
    end_aligned_88_txd(255 downto 248) <= C_TERMINATE_BYTE;
    end_aligned_88_txc <= "10000000000000000000000000000000";

    -- ALIGNED 96
    end_aligned_96_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_96_txd_part1(223 downto 128) <= mac_tx_data_z4(95 downto 0);
    end_aligned_96_txd_part1(255 downto 224) <= crc_out;
    end_aligned_96_txc_part1 <= (others => '0');

    end_aligned_96_txd_part2(7 downto 0) <= C_TERMINATE_BYTE;
    end_aligned_96_txd_part2(255 downto 8) <= X"07070707070707070707070707070707070707070707070707070707070707";
    end_aligned_96_txc_part2 <= (others => '1');

    -- ALIGNED 104
    end_aligned_104_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_104_txd_part1(231 downto 128) <= mac_tx_data_z4(103 downto 0);
    end_aligned_104_txd_part1(255 downto 232) <= crc_out(23 downto 0);
    end_aligned_104_txc_part1 <= (others => '0');

    end_aligned_104_txd_part2(7 downto 0) <= crc_out_z1(31 downto 24);
    end_aligned_104_txd_part2(15 downto 8) <= C_TERMINATE_BYTE;
    end_aligned_104_txd_part2(255 downto 16) <= X"070707070707070707070707070707070707070707070707070707070707";
    end_aligned_104_txc_part2 <= "11111111111111111111111111111110";

    -- ALIGNED 112
    end_aligned_112_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_112_txd_part1(239 downto 128) <= mac_tx_data_z4(111 downto 0);
    end_aligned_112_txd_part1(255 downto 240) <= crc_out(15 downto 0);
    end_aligned_112_txc_part1 <= (others => '0');

    end_aligned_112_txd_part2(15 downto 0) <= crc_out_z1(31 downto 16);
    end_aligned_112_txd_part2(23 downto 16) <= C_TERMINATE_BYTE;
    end_aligned_112_txd_part2(255 downto 24) <= X"0707070707070707070707070707070707070707070707070707070707";
    end_aligned_112_txc_part2 <= "11111111111111111111111111111100";

    -- ALIGNED 120
    end_aligned_120_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_120_txd_part1(247 downto 128) <= mac_tx_data_z4(119 downto 0);
    end_aligned_120_txd_part1(255 downto 248) <= crc_out(7 downto 0);
    end_aligned_120_txc_part1 <= (others => '0');

    end_aligned_120_txd_part2(23 downto 0) <= crc_out_z1(31 downto 8);
    end_aligned_120_txd_part2(31 downto 24) <= C_TERMINATE_BYTE;
    end_aligned_120_txd_part2(255 downto 32) <= X"07070707070707070707070707070707070707070707070707070707";
    end_aligned_120_txc_part2 <= "11111111111111111111111111111000";

    -- ALIGNED 128
    end_aligned_128_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_128_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_128_txc_part1 <= (others => '0');

    end_aligned_128_txd_part2(31 downto 0) <= crc_out_z1;
    end_aligned_128_txd_part2(39 downto 32) <= C_TERMINATE_BYTE;
    end_aligned_128_txd_part2(255 downto 40) <= X"070707070707070707070707070707070707070707070707070707";
    end_aligned_128_txc_part2 <= "11111111111111111111111111110000";

    -- ALIGNED 136
    end_aligned_136_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_136_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_136_txc_part1 <= (others => '0');

    end_aligned_136_txd_part2(7 downto 0) <= mac_tx_data_z5(135 downto 128);
    end_aligned_136_txd_part2(39 downto 8) <= crc_out_z1;
    end_aligned_136_txd_part2(47 downto 40) <= C_TERMINATE_BYTE;
    end_aligned_136_txd_part2(255 downto 48) <= X"0707070707070707070707070707070707070707070707070707";
    end_aligned_136_txc_part2 <= "11111111111111111111111111100000";

    -- ALIGNED 144
    end_aligned_144_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_144_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_144_txc_part1 <= (others => '0');

    end_aligned_144_txd_part2(15 downto 0) <= mac_tx_data_z5(143 downto 128);
    end_aligned_144_txd_part2(47 downto 16) <= crc_out;
    end_aligned_144_txd_part2(55 downto 48) <= C_TERMINATE_BYTE;
    end_aligned_144_txd_part2(255 downto 56) <= X"07070707070707070707070707070707070707070707070707";
    end_aligned_144_txc_part2 <= "11111111111111111111111111000000";

    -- ALIGNED 152
    end_aligned_152_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_152_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_152_txc_part1 <= (others => '0');

    end_aligned_152_txd_part2(23 downto 0) <= mac_tx_data_z5(151 downto 128);
    end_aligned_152_txd_part2(55 downto 24) <= crc_out;
    end_aligned_152_txd_part2(63 downto 56) <= C_TERMINATE_BYTE;
    end_aligned_152_txd_part2(255 downto 64) <= X"070707070707070707070707070707070707070707070707";
    end_aligned_152_txc_part2 <= "11111111111111111111111110000000";

    -- ALIGNED 160
    end_aligned_160_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_160_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_160_txc_part1 <= (others => '0');

    end_aligned_160_txd_part2(31 downto 0) <= mac_tx_data_z5(159 downto 128);
    end_aligned_160_txd_part2(63 downto 32) <= crc_out;
    end_aligned_160_txd_part2(71 downto 64) <= C_TERMINATE_BYTE;
    end_aligned_160_txd_part2(255 downto 72) <= X"0707070707070707070707070707070707070707070707";
    end_aligned_160_txc_part2 <= "11111111111111111111111100000000";

    -- ALIGNED 168
    end_aligned_168_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_168_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_168_txc_part1 <= (others => '0');

    end_aligned_168_txd_part2(39 downto 0) <= mac_tx_data_z5(167 downto 128);
    end_aligned_168_txd_part2(71 downto 40) <= crc_out;
    end_aligned_168_txd_part2(79 downto 72) <= C_TERMINATE_BYTE;
    end_aligned_168_txd_part2(255 downto 80) <= X"07070707070707070707070707070707070707070707";
    end_aligned_168_txc_part2 <= "11111111111111111111111000000000";

    -- ALIGNED 176
    end_aligned_176_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_176_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_176_txc_part1 <= (others => '0');

    end_aligned_176_txd_part2(47 downto 0) <= mac_tx_data_z5(175 downto 128);
    end_aligned_176_txd_part2(79 downto 48) <= crc_out;
    end_aligned_176_txd_part2(87 downto 80) <= C_TERMINATE_BYTE;
    end_aligned_176_txd_part2(255 downto 88) <= X"070707070707070707070707070707070707070707";
    end_aligned_176_txc_part2 <= "11111111111111111111110000000000";

    -- ALIGNED 184
    end_aligned_184_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_184_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_184_txc_part1 <= (others => '0');

    end_aligned_184_txd_part2(55 downto 0) <= mac_tx_data_z5(183 downto 128);
    end_aligned_184_txd_part2(87 downto 56) <= crc_out;
    end_aligned_184_txd_part2(95 downto 88) <= C_TERMINATE_BYTE;
    end_aligned_184_txd_part2(255 downto 96) <= X"0707070707070707070707070707070707070707";
    end_aligned_184_txc_part2 <= "11111111111111111111100000000000";

    -- ALIGNED 192
    end_aligned_192_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_192_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_192_txc_part1 <= (others => '0');

    end_aligned_192_txd_part2(63 downto 0) <= mac_tx_data_z5(191 downto 128);
    end_aligned_192_txd_part2(95 downto 64) <= crc_out;
    end_aligned_192_txd_part2(103 downto 96) <= C_TERMINATE_BYTE;
    end_aligned_192_txd_part2(255 downto 104) <= X"07070707070707070707070707070707070707";
    end_aligned_192_txc_part2 <= "11111111111111111111000000000000";

    -- ALIGNED 200
    end_aligned_200_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_200_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_200_txc_part1 <= (others => '0');

    end_aligned_200_txd_part2(71 downto 0) <= mac_tx_data_z5(199 downto 128);
    end_aligned_200_txd_part2(103 downto 72) <= crc_out;
    end_aligned_200_txd_part2(111 downto 104) <= C_TERMINATE_BYTE;
    end_aligned_200_txd_part2(255 downto 112) <= X"070707070707070707070707070707070707";
    end_aligned_200_txc_part2 <= "11111111111111111110000000000000";

    -- ALIGNED 208
    end_aligned_208_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_208_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_208_txc_part1 <= (others => '0');

    end_aligned_208_txd_part2(79 downto 0) <= mac_tx_data_z5(207 downto 128);
    end_aligned_208_txd_part2(111 downto 80) <= crc_out;
    end_aligned_208_txd_part2(119 downto 112) <= C_TERMINATE_BYTE;
    end_aligned_208_txd_part2(255 downto 120) <= X"0707070707070707070707070707070707";
    end_aligned_208_txc_part2 <= "11111111111111111100000000000000";

    -- ALIGNED 216
    end_aligned_216_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_216_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_216_txc_part1 <= (others => '0');

    end_aligned_216_txd_part2(87 downto 0) <= mac_tx_data_z5(215 downto 128);
    end_aligned_216_txd_part2(119 downto 88) <= crc_out;
    end_aligned_216_txd_part2(127 downto 120) <= C_TERMINATE_BYTE;
    end_aligned_216_txd_part2(255 downto 128) <= X"07070707070707070707070707070707";
    end_aligned_216_txc_part2 <= "11111111111111111000000000000000";

    -- ALIGNED 224
    end_aligned_224_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_224_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_224_txc_part1 <= (others => '0');

    end_aligned_224_txd_part2(95 downto 0) <= mac_tx_data_z5(223 downto 128);
    end_aligned_224_txd_part2(127 downto 96) <= crc_out;
    end_aligned_224_txd_part2(135 downto 128) <= C_TERMINATE_BYTE;
    end_aligned_224_txd_part2(255 downto 136) <= X"070707070707070707070707070707";
    end_aligned_224_txc_part2 <= "11111111111111110000000000000000";

    -- ALIGNED 232
    end_aligned_232_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_232_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_232_txc_part1 <= (others => '0');

    end_aligned_232_txd_part2(103 downto 0) <= mac_tx_data_z5(231 downto 128);
    end_aligned_232_txd_part2(135 downto 104) <= crc_out;
    end_aligned_232_txd_part2(143 downto 136) <= C_TERMINATE_BYTE;
    end_aligned_232_txd_part2(255 downto 144) <= X"0707070707070707070707070707";
    end_aligned_232_txc_part2 <= "11111111111111100000000000000000";

    -- ALIGNED 240
    end_aligned_240_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_240_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_240_txc_part1 <= (others => '0');

    end_aligned_240_txd_part2(111 downto 0) <= mac_tx_data_z5(239 downto 128);
    end_aligned_240_txd_part2(143 downto 112) <= crc_out;
    end_aligned_240_txd_part2(151 downto 144) <= C_TERMINATE_BYTE;
    end_aligned_240_txd_part2(255 downto 152) <= X"07070707070707070707070707";
    end_aligned_240_txc_part2 <= "11111111111111000000000000000000";

    -- ALIGNED 248
    end_aligned_248_txd_part1(127 downto 0) <= mac_tx_data_z5(255 downto 128);
    end_aligned_248_txd_part1(255 downto 128) <= mac_tx_data_z4(127 downto 0);
    end_aligned_248_txc_part1 <= (others => '0');

    end_aligned_248_txd_part2(119 downto 0) <= mac_tx_data_z5(247 downto 128);
    end_aligned_248_txd_part2(151 downto 120) <= crc_out;
    end_aligned_248_txd_part2(159 downto 152) <= C_TERMINATE_BYTE;
    end_aligned_248_txd_part2(255 downto 160) <= X"070707070707070707070707";
    end_aligned_248_txc_part2 <= "11111111111110000000000000000000";

-----------------------------------------------------------------------------------
-- DECODE STATES
-----------------------------------------------------------------------------------

    payload_txd <= mac_tx_data_z4(127 downto 0) & mac_tx_data_z5(255 downto 128);
    payload_txc <= (others => '0');

    xlgmii_txd_i <=
    (mac_tx_data_z4(127 downto 0) & C_PREAMBLE_IFG_TXD) when (current_mac_state = GEN_IFG_PREAMBLE_START_PAYLOAD) else
    payload_txd when (current_mac_state = GEN_PAYLOAD) else
    end_aligned_0_txd when (current_mac_state = GEN_END_ALIGNED_0) else
    end_aligned_8_txd when (current_mac_state = GEN_END_ALIGNED_8) else
    end_aligned_16_txd when (current_mac_state = GEN_END_ALIGNED_16) else
    end_aligned_24_txd when (current_mac_state = GEN_END_ALIGNED_24) else
    end_aligned_32_txd when (current_mac_state = GEN_END_ALIGNED_32) else
    end_aligned_40_txd when (current_mac_state = GEN_END_ALIGNED_40) else
    end_aligned_48_txd when (current_mac_state = GEN_END_ALIGNED_48) else
    end_aligned_56_txd when (current_mac_state = GEN_END_ALIGNED_56) else
    end_aligned_64_txd when (current_mac_state = GEN_END_ALIGNED_64) else
    end_aligned_72_txd when (current_mac_state = GEN_END_ALIGNED_72) else
    end_aligned_80_txd when (current_mac_state = GEN_END_ALIGNED_80) else
    end_aligned_88_txd when (current_mac_state = GEN_END_ALIGNED_88) else
    end_aligned_96_txd_part1 when (current_mac_state = GEN_END_ALIGNED_96_PART1) else
    end_aligned_96_txd_part2 when (current_mac_state = GEN_END_ALIGNED_96_PART2) else
    end_aligned_104_txd_part1 when (current_mac_state = GEN_END_ALIGNED_104_PART1) else
    end_aligned_104_txd_part2 when (current_mac_state = GEN_END_ALIGNED_104_PART2) else
    end_aligned_112_txd_part1 when (current_mac_state = GEN_END_ALIGNED_112_PART1) else
    end_aligned_112_txd_part2 when (current_mac_state = GEN_END_ALIGNED_112_PART2) else
    end_aligned_120_txd_part1 when (current_mac_state = GEN_END_ALIGNED_120_PART1) else
    end_aligned_120_txd_part2 when (current_mac_state = GEN_END_ALIGNED_120_PART2) else
    end_aligned_128_txd_part1 when (current_mac_state = GEN_END_ALIGNED_128_PART1) else
    end_aligned_128_txd_part2 when (current_mac_state = GEN_END_ALIGNED_128_PART2) else
    end_aligned_136_txd_part1 when (current_mac_state = GEN_END_ALIGNED_136_PART1) else
    end_aligned_136_txd_part2 when (current_mac_state = GEN_END_ALIGNED_136_PART2) else
    end_aligned_144_txd_part1 when (current_mac_state = GEN_END_ALIGNED_144_PART1) else
    end_aligned_144_txd_part2 when (current_mac_state = GEN_END_ALIGNED_144_PART2) else
    end_aligned_152_txd_part1 when (current_mac_state = GEN_END_ALIGNED_152_PART1) else
    end_aligned_152_txd_part2 when (current_mac_state = GEN_END_ALIGNED_152_PART2) else
    end_aligned_160_txd_part1 when (current_mac_state = GEN_END_ALIGNED_160_PART1) else
    end_aligned_160_txd_part2 when (current_mac_state = GEN_END_ALIGNED_160_PART2) else
    end_aligned_168_txd_part1 when (current_mac_state = GEN_END_ALIGNED_168_PART1) else
    end_aligned_168_txd_part2 when (current_mac_state = GEN_END_ALIGNED_168_PART2) else
    end_aligned_176_txd_part1 when (current_mac_state = GEN_END_ALIGNED_176_PART1) else
    end_aligned_176_txd_part2 when (current_mac_state = GEN_END_ALIGNED_176_PART2) else
    end_aligned_184_txd_part1 when (current_mac_state = GEN_END_ALIGNED_184_PART1) else
    end_aligned_184_txd_part2 when (current_mac_state = GEN_END_ALIGNED_184_PART2) else
    end_aligned_192_txd_part1 when (current_mac_state = GEN_END_ALIGNED_192_PART1) else
    end_aligned_192_txd_part2 when (current_mac_state = GEN_END_ALIGNED_192_PART2) else
    end_aligned_200_txd_part1 when (current_mac_state = GEN_END_ALIGNED_200_PART1) else
    end_aligned_200_txd_part2 when (current_mac_state = GEN_END_ALIGNED_200_PART2) else
    end_aligned_208_txd_part1 when (current_mac_state = GEN_END_ALIGNED_208_PART1) else
    end_aligned_208_txd_part2 when (current_mac_state = GEN_END_ALIGNED_208_PART2) else
    end_aligned_216_txd_part1 when (current_mac_state = GEN_END_ALIGNED_216_PART1) else
    end_aligned_216_txd_part2 when (current_mac_state = GEN_END_ALIGNED_216_PART2) else
    end_aligned_224_txd_part1 when (current_mac_state = GEN_END_ALIGNED_224_PART1) else
    end_aligned_224_txd_part2 when (current_mac_state = GEN_END_ALIGNED_224_PART2) else
    end_aligned_232_txd_part1 when (current_mac_state = GEN_END_ALIGNED_232_PART1) else
    end_aligned_232_txd_part2 when (current_mac_state = GEN_END_ALIGNED_232_PART2) else
    end_aligned_240_txd_part1 when (current_mac_state = GEN_END_ALIGNED_240_PART1) else
    end_aligned_240_txd_part2 when (current_mac_state = GEN_END_ALIGNED_240_PART2) else
    end_aligned_248_txd_part1 when (current_mac_state = GEN_END_ALIGNED_248_PART1) else
    end_aligned_248_txd_part2 when (current_mac_state = GEN_END_ALIGNED_248_PART2) else
    C_IDLE_TXD;

    xlgmii_txc_i <=
    (X"0000" & C_PREAMBLE_IFG_TXC) when (current_mac_state = GEN_IFG_PREAMBLE_START_PAYLOAD) else
    payload_txc when (current_mac_state = GEN_PAYLOAD) else
    end_aligned_0_txc when (current_mac_state = GEN_END_ALIGNED_0) else
    end_aligned_8_txc when (current_mac_state = GEN_END_ALIGNED_8) else
    end_aligned_16_txc when (current_mac_state = GEN_END_ALIGNED_16) else
    end_aligned_24_txc when (current_mac_state = GEN_END_ALIGNED_24) else
    end_aligned_32_txc when (current_mac_state = GEN_END_ALIGNED_32) else
    end_aligned_40_txc when (current_mac_state = GEN_END_ALIGNED_40) else
    end_aligned_48_txc when (current_mac_state = GEN_END_ALIGNED_48) else
    end_aligned_56_txc when (current_mac_state = GEN_END_ALIGNED_56) else
    end_aligned_64_txc when (current_mac_state = GEN_END_ALIGNED_64) else
    end_aligned_72_txc when (current_mac_state = GEN_END_ALIGNED_72) else
    end_aligned_80_txc when (current_mac_state = GEN_END_ALIGNED_80) else
    end_aligned_88_txc when (current_mac_state = GEN_END_ALIGNED_88) else
    end_aligned_96_txc_part1 when (current_mac_state = GEN_END_ALIGNED_96_PART1) else
    end_aligned_96_txc_part2 when (current_mac_state = GEN_END_ALIGNED_96_PART2) else
    end_aligned_104_txc_part1 when (current_mac_state = GEN_END_ALIGNED_104_PART1) else
    end_aligned_104_txc_part2 when (current_mac_state = GEN_END_ALIGNED_104_PART2) else
    end_aligned_112_txc_part1 when (current_mac_state = GEN_END_ALIGNED_112_PART1) else
    end_aligned_112_txc_part2 when (current_mac_state = GEN_END_ALIGNED_112_PART2) else
    end_aligned_120_txc_part1 when (current_mac_state = GEN_END_ALIGNED_120_PART1) else
    end_aligned_120_txc_part2 when (current_mac_state = GEN_END_ALIGNED_120_PART2) else
    end_aligned_128_txc_part1 when (current_mac_state = GEN_END_ALIGNED_128_PART1) else
    end_aligned_128_txc_part2 when (current_mac_state = GEN_END_ALIGNED_128_PART2) else
    end_aligned_136_txc_part1 when (current_mac_state = GEN_END_ALIGNED_136_PART1) else
    end_aligned_136_txc_part2 when (current_mac_state = GEN_END_ALIGNED_136_PART2) else
    end_aligned_144_txc_part1 when (current_mac_state = GEN_END_ALIGNED_144_PART1) else
    end_aligned_144_txc_part2 when (current_mac_state = GEN_END_ALIGNED_144_PART2) else
    end_aligned_152_txc_part1 when (current_mac_state = GEN_END_ALIGNED_152_PART1) else
    end_aligned_152_txc_part2 when (current_mac_state = GEN_END_ALIGNED_152_PART2) else
    end_aligned_160_txc_part1 when (current_mac_state = GEN_END_ALIGNED_160_PART1) else
    end_aligned_160_txc_part2 when (current_mac_state = GEN_END_ALIGNED_160_PART2) else
    end_aligned_168_txc_part1 when (current_mac_state = GEN_END_ALIGNED_168_PART1) else
    end_aligned_168_txc_part2 when (current_mac_state = GEN_END_ALIGNED_168_PART2) else
    end_aligned_176_txc_part1 when (current_mac_state = GEN_END_ALIGNED_176_PART1) else
    end_aligned_176_txc_part2 when (current_mac_state = GEN_END_ALIGNED_176_PART2) else
    end_aligned_184_txc_part1 when (current_mac_state = GEN_END_ALIGNED_184_PART1) else
    end_aligned_184_txc_part2 when (current_mac_state = GEN_END_ALIGNED_184_PART2) else
    end_aligned_192_txc_part1 when (current_mac_state = GEN_END_ALIGNED_192_PART1) else
    end_aligned_192_txc_part2 when (current_mac_state = GEN_END_ALIGNED_192_PART2) else
    end_aligned_200_txc_part1 when (current_mac_state = GEN_END_ALIGNED_200_PART1) else
    end_aligned_200_txc_part2 when (current_mac_state = GEN_END_ALIGNED_200_PART2) else
    end_aligned_208_txc_part1 when (current_mac_state = GEN_END_ALIGNED_208_PART1) else
    end_aligned_208_txc_part2 when (current_mac_state = GEN_END_ALIGNED_208_PART2) else
    end_aligned_216_txc_part1 when (current_mac_state = GEN_END_ALIGNED_216_PART1) else
    end_aligned_216_txc_part2 when (current_mac_state = GEN_END_ALIGNED_216_PART2) else
    end_aligned_224_txc_part1 when (current_mac_state = GEN_END_ALIGNED_224_PART1) else
    end_aligned_224_txc_part2 when (current_mac_state = GEN_END_ALIGNED_224_PART2) else
    end_aligned_232_txc_part1 when (current_mac_state = GEN_END_ALIGNED_232_PART1) else
    end_aligned_232_txc_part2 when (current_mac_state = GEN_END_ALIGNED_232_PART2) else
    end_aligned_240_txc_part1 when (current_mac_state = GEN_END_ALIGNED_240_PART1) else
    end_aligned_240_txc_part2 when (current_mac_state = GEN_END_ALIGNED_240_PART2) else
    end_aligned_248_txc_part1 when (current_mac_state = GEN_END_ALIGNED_248_PART1) else
    end_aligned_248_txc_part2 when (current_mac_state = GEN_END_ALIGNED_248_PART2) else
    C_IDLE_TXC;

-----------------------------------------------------------------------------------
-- CRC
-----------------------------------------------------------------------------------

    crc_reset <= '1' when (current_mac_state = START_CRC) else '0';

--    crc_payload(127 downto 0) <= mac_tx_data_z1(255 downto 128);
--    crc_payload(255 downto 128) <= mac_tx_data(127 downto 0);

--    crc_payload_val(15 downto 0) <= mac_tx_data_valid_z1(31 downto 16);
--    crc_payload_val(31 downto 16) <= mac_tx_data_valid(15 downto 0);

--    -- SHIFT FIRST 128 BITS DOWN TO LEFT TO MATCH NORMAL CRC BYTE ORDERING
--    crc_first_128bits_data_in <= X"00000000000000000000000000000000" & mac_tx_data(127 downto 0);
--    crc_first_128bits_data_in_val <= X"0000FFFF";

--    crc_data_in <=
--    crc_first_128bits_data_in when (current_mac_state = START_CRC) else
--    crc_payload;

--    crc_data_in_val <=
--    crc_first_128bits_data_in_val when (current_mac_state = START_CRC) else
--    crc_payload_val;

    crc_data_in <= mac_tx_data;
    crc_data_in_val <= mac_tx_data_valid;

    ska_mac_rx_crc_multi_0 : ska_mac_rx_crc_multi
    port map(
        clk             => mac_clk,
        rst             => mac_rst,
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
            if (phy_tx_rst = '1')then
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

end arch_ska_mac_tx_multi;
