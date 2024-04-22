-- author: Furkan Cayci, 2018
-- description: serializer for for 10-bit tmds signal

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity serializer is
    generic (
        SERIES6 : boolean := false
    );
    port (
        rst      : in  std_logic;
        pixclk   : in  std_logic;  -- low speed pixel clock 1x
        serclk   : in  std_logic;  -- high speed serial clock 5x
        endata_i : in  std_logic_vector(9 downto 0);
        s_p      : out std_logic;
        s_n      : out std_logic
    );
end serializer;

architecture rtl of serializer is
    signal sdata : std_logic;
    signal cascade1, cascade2 : std_logic;
begin

    -- create differential pair
    obuf : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>sdata, O=>s_p, OB=>s_n);

-- generate for implementation
fors7: if SERIES6 = false generate
begin

    -- serializer 10:1 (5:1 DDR)
    -- master-slave cascaded since data width > 8
    master : OSERDESE2
    generic map (
        DATA_RATE_OQ      => "DDR",
        DATA_RATE_TQ      => "SDR",
        DATA_WIDTH        => 10,
        SERDES_MODE       => "MASTER",
        TRISTATE_WIDTH    => 1)
    port map (
        OQ                => sdata,
        OFB               => open,
        TQ                => open,
        TFB               => open,
        SHIFTOUT1         => open,
        SHIFTOUT2         => open,
        TBYTEOUT          => open,
        CLK               => serclk,
        CLKDIV            => pixclk,
        D1                => endata_i(0),
        D2                => endata_i(1),
        D3                => endata_i(2),
        D4                => endata_i(3),
        D5                => endata_i(4),
        D6                => endata_i(5),
        D7                => endata_i(6),
        D8                => endata_i(7),
        TCE               => '0',
        OCE               => '1',
        TBYTEIN           => '0',
        RST               => rst,
        SHIFTIN1          => cascade1,
        SHIFTIN2          => cascade2,
        T1                => '0',
        T2                => '0',
        T3                => '0',
        T4                => '0'
    );

    slave : OSERDESE2
    generic map (
        DATA_RATE_OQ      => "DDR",
        DATA_RATE_TQ      => "SDR",
        DATA_WIDTH        => 10,
        SERDES_MODE       => "SLAVE",
        TRISTATE_WIDTH    => 1)
    port map (
        OQ                => open,
        OFB               => open,
        TQ                => open,
        TFB               => open,
        SHIFTOUT1         => cascade1,
        SHIFTOUT2         => cascade2,
        TBYTEOUT          => open,
        CLK               => serclk,
        CLKDIV            => pixclk,
        D1                => '0',
        D2                => '0',
        D3                => endata_i(8),
        D4                => endata_i(9),
        D5                => '0',
        D6                => '0',
        D7                => '0',
        D8                => '0',
        TCE               => '0',
        OCE               => '1',
        TBYTEIN           => '0',
        RST               => rst,
        SHIFTIN1          => '0',
        SHIFTIN2          => '0',
        T1                => '0',
        T2                => '0',
        T3                => '0',
        T4                => '0'
    );

end generate;

-- WARNING: this is for GHDL simulator only. Not for implementation!
--   OSERDESE2 is an encrypted IP, so convert that to
--   OSERDESE1 (6-series serdes)
fors6: if SERIES6 = true generate
begin

    -- serializer 10:1 (5:1 DDR)
    -- master-slave cascaded since data width > 8
    master : OSERDESE1
    generic map (
        DATA_RATE_OQ      => "DDR",
        DATA_RATE_TQ      => "SDR",
        DATA_WIDTH        => 10,
        SERDES_MODE       => "MASTER",
        TRISTATE_WIDTH    => 1)
    port map (
        OQ                => sdata,
        OFB               => open,
        TQ                => open,
        TFB               => open,
        SHIFTOUT1         => open,
        SHIFTOUT2         => open,
        CLKPERF           => '0',
        CLKPERFDELAY      => '0',
        ODV               => '0',
        WC                => '0',
        CLK               => serclk,
        CLKDIV            => pixclk,
        D1                => endata_i(0),
        D2                => endata_i(1),
        D3                => endata_i(2),
        D4                => endata_i(3),
        D5                => endata_i(4),
        D6                => endata_i(5),
        TCE               => '0',
        OCE               => '1',
        RST               => rst,
        SHIFTIN1          => cascade1,
        SHIFTIN2          => cascade2,
        T1                => '0',
        T2                => '0',
        T3                => '0',
        T4                => '0'
    );

    slave : OSERDESE1
    generic map (
        DATA_RATE_OQ      => "DDR",
        DATA_RATE_TQ      => "SDR",
        DATA_WIDTH        => 10,
        SERDES_MODE       => "SLAVE",
        TRISTATE_WIDTH    => 1)
    port map (
        OQ                => open,
        OFB               => open,
        TQ                => open,
        TFB               => open,
        CLKPERF           => '0',
        CLKPERFDELAY      => '0',
        ODV               => '0',
        WC                => '0',
        SHIFTOUT1         => cascade1,
        SHIFTOUT2         => cascade2,
        CLK               => serclk,
        CLKDIV            => pixclk,
        D1                => '0',
        D2                => '0',
        D3                => endata_i(6),
        D4                => endata_i(7),
        D5                => endata_i(8),
        D6                => endata_i(9),
        TCE               => '0',
        OCE               => '1',
        RST               => rst,
        SHIFTIN1          => '0',
        SHIFTIN2          => '0',
        T1                => '0',
        T2                => '0',
        T3                => '0',
        T4                => '0'
    );

end generate;

end rtl;
