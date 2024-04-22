----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: ska_runt_filt_rx - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- SKA 40GBE RX path - filters out runt packets BEFORE they get to the RX MAC
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

entity ska_runt_filt_rx is
    port (
    mac_clk             : in std_logic;
    mac_rst             : in std_logic;

    -- XLGMII
    xlgmii_rxd_in      : in std_logic_vector(255 downto 0);
    xlgmii_rxc_in      : in std_logic_vector(31 downto 0);
    xlgmii_rxd_out     : out std_logic_vector(255 downto 0);
    xlgmii_rxc_out     : out std_logic_vector(31 downto 0);

    -- LED CONTROL
    phy_rx_up          : in std_logic;
    xlgmii_rxled       : out std_logic_vector(1 downto 0));
end ska_runt_filt_rx;

architecture arch_ska_runt_filt_rx of ska_runt_filt_rx is

    constant C_IDLE_TXD : std_logic_vector(255 downto 0):= X"0707070707070707070707070707070707070707070707070707070707070707";
    constant C_IDLE_TXC : std_logic_vector(31 downto 0) := "11111111111111111111111111111111";

    constant C_START_BYTE : std_logic_vector(7 downto 0) := X"FB";

    type T_FILT_STATE is (
    VALID_DATA,
    INVALID_WORD_0,
    INVALID_WORD_1);

    signal xlgmii_rxd_in_z1 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_in_z1 : std_logic_vector(31 downto 0);
    signal xlgmii_rxd_in_z2 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_in_z2 : std_logic_vector(31 downto 0);
    signal xlgmii_rxd_in_z3 : std_logic_vector(255 downto 0);
    signal xlgmii_rxc_in_z3 : std_logic_vector(31 downto 0);

    signal current_filt_state : T_FILT_STATE;

    signal got_valid_start : std_logic;
    signal rx_activity_timeout_low : std_logic_vector(15 downto 0);
    signal rx_activity_timeout_low_over : std_logic;
    signal rx_activity_timeout_high : std_logic_vector(11 downto 0);
    signal rx_activity_timeout : std_logic;

begin

---------------------------------------------------------------------------------------------------
-- CREATE DELAYED COPIES OF XLGMII IN TO CHECK CURRENT 256 BITS AND NEXT 256 BITS
---------------------------------------------------------------------------------------------------

    gen_xlgmii_rxd_in_z : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            xlgmii_rxd_in_z1 <= xlgmii_rxd_in;
            xlgmii_rxc_in_z1 <= xlgmii_rxc_in;
            xlgmii_rxd_in_z2 <= xlgmii_rxd_in_z1;
            xlgmii_rxc_in_z2 <= xlgmii_rxc_in_z1;
            xlgmii_rxd_in_z3 <= xlgmii_rxd_in_z2;
            xlgmii_rxc_in_z3 <= xlgmii_rxc_in_z2;
        end if;
    end process;

---------------------------------------------------------------------------------------------------
-- BY DEFAULT, DATA IS ASSUMED VALID
---------------------------------------------------------------------------------------------------

    gen_current_filt_state : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            got_valid_start <= '0';
            current_filt_state <= VALID_DATA;
        elsif (rising_edge(mac_clk))then
            got_valid_start <= '0';

            case current_filt_state is
                when VALID_DATA =>
                current_filt_state <= VALID_DATA;

                if (((xlgmii_rxd_in_z2(7 downto 0) = C_START_BYTE)and(xlgmii_rxc_in_z2(0) = '1'))or
                ((xlgmii_rxd_in_z2(71 downto 64) = C_START_BYTE)and(xlgmii_rxc_in_z2(8) = '1'))or
                ((xlgmii_rxd_in_z2(135 downto 128) = C_START_BYTE)and(xlgmii_rxc_in_z2(16) = '1'))or
                ((xlgmii_rxd_in_z2(199 downto 192) = C_START_BYTE)and(xlgmii_rxc_in_z2(24) = '1')))then
                    -- DETECTED A START, CHECK THAT THE NEXT WORD IS ALL DATA
                    if (xlgmii_rxc_in_z1 = X"00000000")then
                        current_filt_state <= VALID_DATA;
                        got_valid_start <= '1';
                    else
                        -- DETECTED A RUNT PACKET, DROP START AND RUNT (MAY CONTAIN TERMINATE OR ERROR)
                        current_filt_state <= INVALID_WORD_0;
                    end if;
                end if;

                when INVALID_WORD_0 =>
                current_filt_state <= INVALID_WORD_1;

                when INVALID_WORD_1 =>
                current_filt_state <= VALID_DATA;

            end case;
        end if;
    end process;

    -- GT REGISTER OUTPUT TO IMPROVE TIMING
    --xlgmii_rxd_out <= xlgmii_rxd_in_z3 when (current_filt_state = VALID_DATA) else C_IDLE_TXD;
    --xlgmii_rxc_out <= xlgmii_rxc_in_z3 when (current_filt_state = VALID_DATA) else C_IDLE_TXC;

    gen_xlgmii_rxd_out : process(mac_clk)
    begin
        if (rising_edge(mac_clk))then
            if (current_filt_state = VALID_DATA)then
                xlgmii_rxd_out <= xlgmii_rxd_in_z3;
                xlgmii_rxc_out <= xlgmii_rxc_in_z3;
            else
                xlgmii_rxd_out <= C_IDLE_TXD;
                xlgmii_rxc_out <= C_IDLE_TXC;
            end if;
        end if;
    end process;

--------------------------------------------------------------------------------------------
-- DETECT FOR PACKETS HERE BEFORE PACKETS ARE SPLIT
--------------------------------------------------------------------------------------------

    gen_xlgmii_rxled : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            xlgmii_rxled <= "00";
        elsif (rising_edge(mac_clk))then
            if (phy_rx_up = '1')then
                xlgmii_rxled(0) <= '1';
            else
                xlgmii_rxled(0) <= '0';
            end if;

            if (rx_activity_timeout = '1')then
                xlgmii_rxled(1) <= '0';
            elsif (got_valid_start = '1')then
                xlgmii_rxled(1) <= '1';
            end if;
        end if;
    end process;

    gen_rx_activity_timeout_low : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            rx_activity_timeout_low <= (others => '0');
            rx_activity_timeout_low_over <= '0';
        elsif (rising_edge(mac_clk))then
            rx_activity_timeout_low_over <= '0';

            if (got_valid_start = '1')then
                rx_activity_timeout_low <= (others => '0');
                rx_activity_timeout_low_over <= '0';
            else
                if (rx_activity_timeout_low = X"FFFF")then
                    rx_activity_timeout_low_over <= '1';
                    rx_activity_timeout_low <= (others => '0');
                else
                    rx_activity_timeout_low <= rx_activity_timeout_low + X"0001";
                end if;
            end if;
        end if;
    end process;

    gen_rx_activity_timeout_high : process(mac_rst, mac_clk)
    begin
        if (mac_rst = '1')then
            rx_activity_timeout_high <= (others => '0');
            rx_activity_timeout <= '0';
        elsif (rising_edge(mac_clk))then
            rx_activity_timeout <= '0';

            if (got_valid_start = '1')then
                rx_activity_timeout_high <= (others => '0');
                rx_activity_timeout <= '0';
            else
                if (rx_activity_timeout_low_over = '1')then
                    if (rx_activity_timeout_high = X"FFF")then
                        rx_activity_timeout_high <= (others => '0');
                        rx_activity_timeout <= '1';
                    else
                        rx_activity_timeout_high <= rx_activity_timeout_high + X"001";
                    end if;
                end if;
            end if;
        end if;
    end process;

end arch_ska_runt_filt_rx;
