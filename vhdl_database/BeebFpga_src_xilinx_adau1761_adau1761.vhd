library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adau1761 is
    port (
        -- Clocks
        clk_48  : in    std_logic;
        clk_codec : in std_logic;

        -- Internal interface
        audio_l_in    : in  std_logic_vector (23 downto 0);
        audio_r_in    : in  std_logic_vector (23 downto 0);
        audio_l_out   : out std_logic_vector (23 downto 0);
        audio_r_out   : out std_logic_vector (23 downto 0);
        new_sample    : out std_logic;

        -- ADAU1761 I2C control interface
        adr0  : out   std_logic;
        adr1  : out   std_logic;
        scl   : out   std_logic;
        sda   : inout std_logic;

        -- ADAU1761 I2S data interface
        mclk  : out   std_logic;
        bclk  : in    std_logic;
        lrclk : in    std_logic;
        din   : in    std_logic;
        dout  : out   std_logic;

        -- Debug
        debug_scl : out  std_logic;
        debug_sda : out  std_logic

        );

end adau1761;

architecture Behavioral of adau1761 is

    signal sda_i        : std_logic;
    signal sda_o        : std_logic;
    signal sda_t        : std_logic;
    signal inst_address : std_logic_vector (9 downto 0);
    signal inst_data    : std_logic_vector (8 downto 0);
    signal inputs       : std_logic_vector (15 downto 0);
    signal outputs      : std_logic_vector (15 downto 0);

begin

    i2s_int : entity work.i2s_data_interface
        port map (
            clk           => clk_48,
            audio_l_in    => audio_l_in,
            audio_r_in    => audio_r_in,
            audio_l_out   => audio_l_out,
            audio_r_out   => audio_r_out,
            new_sample    => new_sample,
            i2s_bclk      => bclk,
            i2s_d_out     => dout,
            i2s_d_in      => din,
            i2s_lr        => lrclk
            );

    i2c_int : entity work.i3c2
        generic map (
            clk_divide => "01111000"   -- 120 (48,000/120 = 400kHz I2C clock)
            )
        port map (
            clk          => clk_48,
            inst_address => inst_address,
            inst_data    => inst_data,
            i2c_scl      => scl,
            i2c_sda_i    => sda_i,
            i2c_sda_o    => sda_o,
            i2c_sda_t    => sda_t,
            inputs       => x"0000",
            outputs      => open,
            debug_scl    => debug_scl,
            debug_sda    => debug_sda
            );

    sda_i <= sda;
    sda   <= sda_o when sda_t = '0' else 'Z';

    config : entity work.adau1761_configuration_data
        port map (
            clk     => clk_48,
            address => inst_address,
            data    => inst_data
            );

    mclk <= clk_codec;
    adr0 <= '1';
    adr1 <= '1';

end Behavioral;
