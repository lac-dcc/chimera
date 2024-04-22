library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

use work.types.all;
use work.constants.all;


entity gamepad is
    port (
        clk, rst: in std_logic;
        spi_cs: out std_logic;
        spi_clk: out std_logic;
        spi_mosi: out std_logic;
        spi_miso: in std_logic;
        data_valid: out std_logic;
        data_out: out gamepad_data_t
    );
end entity;


architecture Behavioral of gamepad is
    component frequency_divider is
        generic (
            PERIOD: integer := 100000
        );
        port (
            clk, rst: in std_logic;
            en: in std_logic;
            pulse: out std_logic
        );
    end component;

    constant SPI_CLK_PERIOD: integer := 1200;
    constant SPI_PKG_PERIOD: integer := 800;

    constant BYTE_TICKS: integer := 10;

    constant START_SIGNAL: std_logic_vector(7 downto 0) := x"01";
    constant REQUEST_SIGNAL: std_logic_vector(7 downto 0) := x"42";
    constant IDLE_SIGNAL: std_logic_vector(7 downto 0) := x"00";

    type data_pkg_t is array(0 to 8) of std_logic_vector(7 downto 0);
    constant CMD_SIGNALS: data_pkg_t := (
        START_SIGNAL,
        REQUEST_SIGNAL,
        IDLE_SIGNAL,
        IDLE_SIGNAL,
        IDLE_SIGNAL,
        IDLE_SIGNAL,
        IDLE_SIGNAL,
        IDLE_SIGNAL,
        IDLE_SIGNAL
    );

    signal spi_clk_pulse, spi_pkg_pulse: std_logic;

    signal cs_reg, cs_next: std_logic;
    signal clk_reg, clk_next: std_logic;

    signal edge, edge_next: std_logic;
    signal byte_cnt, byte_cnt_next: integer;
    signal bit_cnt, bit_cnt_next: integer;

    signal data_signals, data_signals_next: data_pkg_t;
    signal pss_rx_rawint, pss_ry_rawint, pss_lx_rawint, pss_ly_rawint: integer;
begin
    clk_freq_div: frequency_divider
        generic map (
            PERIOD => SPI_CLK_PERIOD / 2
        )
        port map (
            clk => clk,
            rst => rst,
            en => '1',
            pulse => spi_clk_pulse
        );
    
    pkg_freq_div: frequency_divider
        generic map (
            PERIOD => SPI_PKG_PERIOD
        )
        port map (
            clk => clk,
            rst => rst,
            en => spi_clk_pulse,
            pulse => spi_pkg_pulse
        );
    
    process (clk, rst) is
    begin
        if rst = '1' then
            cs_reg <= '1';
            clk_reg <= '1';
            edge <= '1';
            byte_cnt <= 0;
            bit_cnt <= 0;
            data_signals <= (others => (others => '0'));
            data_signals(5) <= std_logic_vector(to_unsigned(PSS_MIDDLE, 8));
            data_signals(6) <= std_logic_vector(to_unsigned(PSS_MIDDLE, 8));
            data_signals(7) <= std_logic_vector(to_unsigned(PSS_MIDDLE, 8));
            data_signals(8) <= std_logic_vector(to_unsigned(PSS_MIDDLE, 8));
        elsif rising_edge(clk) and spi_clk_pulse = '1' then
            if spi_pkg_pulse = '1' then
                cs_reg <= '0';  -- !
                clk_reg <= '1';
                edge <= '1';
                byte_cnt <= 0;
                bit_cnt <= 0;
                data_signals <= (others => (others => '0'));
                data_signals(5) <= std_logic_vector(to_unsigned(PSS_MIDDLE, 8));
                data_signals(6) <= std_logic_vector(to_unsigned(PSS_MIDDLE, 8));
                data_signals(7) <= std_logic_vector(to_unsigned(PSS_MIDDLE, 8));
                data_signals(8) <= std_logic_vector(to_unsigned(PSS_MIDDLE, 8));
            else
                cs_reg <= cs_next;
                clk_reg <= clk_next;
                edge <= edge_next;
                byte_cnt <= byte_cnt_next;
                bit_cnt <= bit_cnt_next;
                data_signals <= data_signals_next;
            end if;
        end if;
    end process;

    cs_next <=
        '1' when byte_cnt = 8 and bit_cnt = BYTE_TICKS - 1 else
        cs_reg;

    clk_next <=
        '1' when cs_reg = '1' or bit_cnt > 7 else
        edge_next;

    edge_next <= not edge;

    byte_cnt_next <=
        byte_cnt when byte_cnt = 8 or edge = '1' or bit_cnt /= BYTE_TICKS - 1 else
        byte_cnt + 1;

    bit_cnt_next <=
        bit_cnt when cs_reg = '1' or edge = '1' else
        0 when bit_cnt = BYTE_TICKS - 1 else
        bit_cnt + 1;

    process (all) is
    begin
        data_signals_next <= data_signals;
        if edge = '1' and byte_cnt >= 0 and byte_cnt <= 8 and bit_cnt >= 0 and bit_cnt < 8 then
            data_signals_next(byte_cnt)(bit_cnt) <= spi_miso;
        end if;
    end process;

    -- Signals Outputs
    spi_cs <= cs_reg;
    spi_clk <= clk_reg;
    spi_mosi <=
        CMD_SIGNALS(byte_cnt)(bit_cnt) when byte_cnt >= 0 and byte_cnt <= 8 and bit_cnt >= 0 and bit_cnt < 8 else
        '0';

    -- Data Outputs
    data_valid <= '1' when cs_reg = '1' and (data_out.id = x"73" or data_out.id = x"41") and data_signals(2) = x"5A" else '0';

    data_out.id <= data_signals(1);
    
    data_out.f_select <= not data_signals(3)(0);
    data_out.L3 <= not data_signals(3)(1);
    data_out.R3 <= not data_signals(3)(2);
    data_out.f_start <= not data_signals(3)(3);
    data_out.up <= not data_signals(3)(4);
    data_out.right <= not data_signals(3)(5);
    data_out.down <= not data_signals(3)(6);
    data_out.left <= not data_signals(3)(7);

    data_out.L2 <= not data_signals(4)(0);
    data_out.R2 <= not data_signals(4)(1);
    data_out.L1 <= not data_signals(4)(2);
    data_out.R1 <= not data_signals(4)(3);
    data_out.triangle <= not data_signals(4)(4);
    data_out.circle <= not data_signals(4)(5);
    data_out.cross <= not data_signals(4)(6);
    data_out.square <= not data_signals(4)(7);

    pss_rx_rawint <= to_integer(unsigned(data_signals(5))) - PSS_MIDDLE;
    pss_ry_rawint <= to_integer(unsigned(data_signals(6))) - PSS_MIDDLE;
    pss_lx_rawint <= to_integer(unsigned(data_signals(7))) - PSS_MIDDLE;
    pss_ly_rawint <= to_integer(unsigned(data_signals(8))) - PSS_MIDDLE;
    data_out.pss_rx <=
        0 when pss_rx_rawint >= -PSS_DEADZONE_RADIUS and pss_rx_rawint < PSS_DEADZONE_RADIUS else
        pss_rx_rawint;
    data_out.pss_ry <=
        0 when pss_ry_rawint >= -PSS_DEADZONE_RADIUS and pss_ry_rawint < PSS_DEADZONE_RADIUS else
        pss_ry_rawint;
    data_out.pss_lx <=
        0 when pss_lx_rawint >= -PSS_DEADZONE_RADIUS and pss_lx_rawint < PSS_DEADZONE_RADIUS else
        pss_lx_rawint;
    data_out.pss_ly <=
        0 when pss_ly_rawint >= -PSS_DEADZONE_RADIUS and pss_ly_rawint < PSS_DEADZONE_RADIUS else
        pss_ly_rawint;
end architecture;
