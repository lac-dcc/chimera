-- BBC Master / BBC B for the Spectrum Next
--
-- Copright (c) 2022 David Banks
--
-- Based on previous work by Mike Stirling
--
-- Copyright (c) 2011 Mike Stirling
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
--
-- * Redistributions in synthesized form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
--
-- * Neither the name of the author nor the names of other contributors may
--   be used to endorse or promote products derived from this software without
--   specific prior written agreement from the author.
--
-- * License is granted for non-commercial use only.  A fee may not be charged
--   for redistributions as source code or in synthesized/hardware form without
--   specific prior written agreement from the author.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Spectrum Next top-level
--
-- (c) 2022 David Banks
-- (C) 2011 Mike Stirling

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.Vcomponents.all;

-- Generic top-level entity for Spectrum Next board
entity bbc_micro_spec_next is
    generic (
        IncludeAMXMouse    : boolean := true;
        IncludeSPISD       : boolean := true;
        IncludeSID         : boolean := true;
        IncludeMusic5000   : boolean := true;
        IncludeICEDebugger : boolean := true;
        IncludeCoPro6502   : boolean := true;
        IncludeCoProExt    : boolean := true;
        IncludeVideoNuLA   : boolean := true;
        IncludeMaster      : boolean := true
    );
    port (
        accel_io              : inout std_logic_vector(27 downto 0);
        audioext_l_o          : out   std_logic;
        audioext_r_o          : out   std_logic;
        audioint_o            : out   std_logic;
        btn_divmmc_n_i        : in    std_logic;
        btn_multiface_n_i     : in    std_logic;
        btn_reset_n_i         : in    std_logic;
        bus_addr_o            : out   std_logic_vector(15 downto 0);
        bus_busack_n_o        : out   std_logic;
        bus_busreq_n_i        : in    std_logic;
        bus_clk35_o           : out   std_logic;
        bus_data_io           : inout std_logic_vector(7 downto 0);
        bus_halt_n_o          : out   std_logic;
        bus_int_n_io          : out   std_logic;
        bus_iorq_n_o          : out   std_logic;
        bus_iorqula_n_i       : in    std_logic;
        bus_m1_n_o            : out   std_logic;
        bus_mreq_n_o          : out   std_logic;
        bus_nmi_n_i           : in    std_logic;
        bus_ramcs_i           : in    std_logic;
        bus_rd_n_o            : out   std_logic;
        bus_rfsh_n_o          : out   std_logic;
        bus_romcs_i           : in    std_logic;
        bus_rst_n_io          : inout std_logic;
        bus_wait_n_i          : in    std_logic;
        bus_wr_n_o            : out   std_logic;
        clock_50_i            : in    std_logic;
        csync_o               : out   std_logic;
        ear_port_i            : in    std_logic;
        esp_gpio0_io          : inout std_logic;
        esp_gpio2_io          : inout std_logic;
        esp_rx_i              : in    std_logic;
        esp_tx_o              : out   std_logic;
        flash_cs_n_o          : out   std_logic;
        flash_hold_o          : out   std_logic;
        flash_miso_i          : in    std_logic;
        flash_mosi_o          : out   std_logic;
        flash_sclk_o          : out   std_logic;
        flash_wp_o            : out   std_logic;
        hdmi_n_o              : out   std_logic_vector(3 downto 0);
        hdmi_p_o              : out   std_logic_vector(3 downto 0);
        hsync_o               : out   std_logic;
        i2c_scl_io            : inout std_logic;
        i2c_sda_io            : inout std_logic;
        joyp1_i               : in    std_logic;
        joyp2_i               : in    std_logic;
        joyp3_i               : in    std_logic;
        joyp4_i               : in    std_logic;
        joyp6_i               : in    std_logic;
        joyp7_o               : out   std_logic;
        joyp9_i               : in    std_logic;
        joysel_o              : out   std_logic;
        keyb_col_i            : in    std_logic_vector(6 downto 0);
        keyb_row_o            : out   std_logic_vector(7 downto 0);
        mic_port_o            : out   std_logic;
        ps2_clk_io            : inout std_logic;
        ps2_data_io           : inout std_logic;
        ps2_pin2_io           : inout std_logic;
        ps2_pin6_io           : inout std_logic;
        ram_addr_o            : out   std_logic_vector(18 downto 0);
        ram_ce_n_o            : out   std_logic_vector(3 downto 0);
        ram_data_io           : inout std_logic_vector(15 downto 0);
        ram_oe_n_o            : out   std_logic;
        ram_we_n_o            : out   std_logic;
        rgb_b_o               : out   std_logic_vector(2 downto 0);
        rgb_g_o               : out   std_logic_vector(2 downto 0);
        rgb_r_o               : out   std_logic_vector(2 downto 0);
        sd_cs1_n_o            : out   std_logic;
        sd_cs0_n_o            : out   std_logic;
        sd_miso_i             : in    std_logic;
        sd_mosi_o             : out   std_logic;
        sd_sclk_o             : out   std_logic;
        vsync_o               : out   std_logic;
        extras_io             : inout std_logic
    );
end entity;

architecture rtl of bbc_micro_spec_next is

-------------
-- Signals
-------------

    signal clk0            : std_logic;
    signal clk1            : std_logic;
    signal clk2            : std_logic;
    signal clk3            : std_logic;
    signal clk4            : std_logic;
    signal clkfb           : std_logic;
    signal clkfb_buf       : std_logic;
    signal clk100          : std_logic;

    signal hclk0            : std_logic;
    signal hclk1            : std_logic;
    signal hclk2            : std_logic;
    signal hclkfb           : std_logic;
    signal hclkfb_buf       : std_logic;

--  signal fx_clk_27       : std_logic;

    signal clock_16        : std_logic; -- for ICAP (flashreboot) only
    signal clock_27        : std_logic;
    signal clock_32        : std_logic;
    signal clock_48        : std_logic;
    signal clock_96        : std_logic;
    signal clock_135       : std_logic;
    signal clock_135_n     : std_logic;
    signal clock_avr       : std_logic;

    attribute S : string;
--  attribute S of clock_avr : signal is "yes";
    attribute S of clock_27  : signal is "yes";
    attribute S of clock_32  : signal is "yes";
    attribute S of clock_96  : signal is "yes";

    signal dac_l_in        : std_logic_vector(9 downto 0);
    signal dac_r_in        : std_logic_vector(9 downto 0);
    signal audio_l         : std_logic_vector(15 downto 0);
    signal audio_r         : std_logic_vector(15 downto 0);
    signal powerup_reset_n : std_logic;
    signal hard_reset_n    : std_logic;
    signal reset_counter   : std_logic_vector(9 downto 0);
    signal ram_addr        : std_logic_vector(20 downto 0);
    signal RAM_A           : std_logic_vector(18 downto 0);
    signal RAM_Din         : std_logic_vector(7 downto 0);
    signal RAM_Dout        : std_logic_vector(7 downto 0);
    signal RAM_nWE         : std_logic;
    signal RAM_nOE         : std_logic;
    signal RAM_nCS         : std_logic;
    signal keyb_dip        : std_logic_vector(7 downto 0) := x"00";
    signal vid_mode        : std_logic_vector(3 downto 0) := "0001";
    signal reconfig_ctr    : std_logic_vector(23 downto 0);
    signal reconfig        : std_logic := '0';
    signal m128_mode       : std_logic;
    signal copro           : std_logic_vector(1 downto 0);
    signal copro_mode      : std_logic;
    signal copro_ext       : std_logic;
    signal red             : std_logic_vector(3 downto 0);
    signal green           : std_logic_vector(3 downto 0);
    signal blue            : std_logic_vector(3 downto 0);
    signal joystick1       : std_logic_vector(4 downto 0);
    signal joystick2       : std_logic_vector(4 downto 0);
    signal ext_tube_r_nw   : std_logic;
    signal ext_tube_nrst   : std_logic;
    signal ext_tube_ntube  : std_logic;
    signal ext_tube_phi2   : std_logic;
    signal ext_tube_a      : std_logic_vector(6 downto 0);
    signal ext_tube_di     : std_logic_vector(7 downto 0);
    signal ext_tube_do     : std_logic_vector(7 downto 0);
    signal ext_tube_enable : std_logic := '0';

    signal hdmi_aspect     : std_logic_vector(1 downto 0) := "00";
    signal hdmi_audio_en   : std_logic := '1';
    signal vid_debug       : std_logic := '0';
    signal tmds_r          : std_logic_vector(9 downto 0);
    signal tmds_g          : std_logic_vector(9 downto 0);
    signal tmds_b          : std_logic_vector(9 downto 0);

    signal ext_keyb_1mhz   : std_logic;
    signal ext_keyb_en_n   : std_logic;
    signal ext_keyb_pa     : std_logic_vector(6 downto 0);
    signal ext_keyb_rst_n  : std_logic;
    signal ext_keyb_ca2    : std_logic;
    signal ext_keyb_pa7    : std_logic;

    signal config_data     : std_logic_vector(7 downto 0);

    signal ps2_swap        : std_logic := '0';

    signal avr_RxD         : std_logic;
    signal avr_TxD         : std_logic;

    signal joy_counter     : std_logic_vector(4 downto 0);

    -- Config buttons
    signal yellow_config_ps2         : std_logic_vector(9 downto 0);
    signal yellow_config_membrane    : std_logic_vector(9 downto 0);
    signal yellow_config             : std_logic_vector(9 downto 0);

    -- Special Power Up Configuration Mode
    signal config_mode     : std_logic := '1';
    signal config_remap    : std_logic := '0';
    signal config_reset    : std_logic := '0';

begin

--------------------------------------------------------
-- BBC Micro Core
--------------------------------------------------------

    -- Format of Video
    -- Bit 1,0 select the video format
    --   00 - 15.625KHz SRGB
    --   01 - 31.250KHz VGA using the RGB2VGA Scan Doubler
    --   10 - 31.250KHz VGA using the Mist Scan Doubler
    --   11 - 31.250KHz VGA using the Mist Scan Doubler (Modes 0..6) and SAA5050 VGA (Mode 7)
    -- Bit 2 inverts hsync
    -- Bit 3 inverts vsync

    bbc_micro : entity work.bbc_micro_core
    generic map (
        IncludeAMXMouse    => IncludeAMXMouse,
        IncludeSPISD       => IncludeSPISD,
        IncludeSID         => IncludeSID,
        IncludeMusic5000   => IncludeMusic5000,
        IncludeICEDebugger => IncludeICEDebugger,
        IncludeCoPro6502   => IncludeCoPro6502,
        IncludeCoProSPI    => false,
        IncludeCoProExt    => IncludeCoProExt,
        IncludeVideoNuLA   => IncludeVideoNuLA,
        IncludeHDMI        => true,
        UseOrigKeyboard    => true,
        UseT65Core         => not IncludeMaster,  -- select the 6502 for the Beeb
        UseAlanDCore       => IncludeMaster,      -- select the 65C02 for the Master
        OverrideCMOS       => false
        )
    port map (
        clock_27       => clock_27,
        clock_32       => clock_32,
        clock_48       => clock_48,
        clock_96       => clock_96,
        clock_avr      => clock_avr,
        hard_reset_n   => hard_reset_n,
        ps2_kbd_clk    => ps2_clk_io,
        ps2_kbd_data   => ps2_data_io,
        ps2_mse_clk    => ps2_pin6_io,
        ps2_mse_data   => ps2_pin2_io,
        ps2_swap       => ps2_swap,
        video_red      => red,
        video_green    => green,
        video_blue     => blue,
        video_vsync    => vsync_o,
        video_hsync    => hsync_o,
        audio_l        => audio_l,
        audio_r        => audio_r,
        ext_nOE        => RAM_nOE,
        ext_nWE        => RAM_nWE,
        ext_nCS        => RAM_nCS,
        ext_A          => RAM_A,
        ext_Dout       => RAM_Dout,
        ext_Din        => RAM_Din,
        SDMISO         => sd_miso_i,
        SDSS           => sd_cs0_n_o,
        SDCLK          => sd_sclk_o,
        SDMOSI         => sd_mosi_o,
        caps_led       => open,
        shift_led      => open,
        keyb_dip       => keyb_dip,
        vid_mode       => vid_mode,
        joystick1      => joystick1,
        joystick2      => joystick2,
        avr_reset      => not hard_reset_n,
        avr_RxD        => avr_RxD,
        avr_TxD        => avr_TxD,
        cpu_addr       => open,
        m128_mode      => m128_mode,
        copro_mode     => copro_mode,
        copro_ext      => copro_ext,
        p_spi_ssel     => '0',
        p_spi_sck      => '0',
        p_spi_mosi     => '0',
        p_spi_miso     => open,
        p_irq_b        => open,
        p_nmi_b        => open,
        p_rst_b        => open,
        ext_tube_r_nw  => ext_tube_r_nw,
        ext_tube_nrst  => ext_tube_nrst,
        ext_tube_ntube => ext_tube_ntube,
        ext_tube_phi2  => ext_tube_phi2,
        ext_tube_a     => ext_tube_a,
        ext_tube_di    => ext_tube_di,
        ext_tube_do    => ext_tube_do,
        test           => open,

        -- original keyboard
        ext_keyb_led1  => open,
        ext_keyb_led2  => open,
        ext_keyb_led3  => open,
        ext_keyb_1mhz  => ext_keyb_1mhz,
        ext_keyb_en_n  => ext_keyb_en_n,
        ext_keyb_pa    => ext_keyb_pa,
        ext_keyb_rst_n => ext_keyb_rst_n,
        ext_keyb_ca2   => ext_keyb_ca2,
        ext_keyb_pa7   => ext_keyb_pa7,

        -- HDMI
        hdmi_aspect    => hdmi_aspect,
        hdmi_audio_en  => hdmi_audio_en,
        tmds_r         => tmds_r,
        tmds_g         => tmds_g,
        tmds_b         => tmds_b,

        -- config
        config         => yellow_config_ps2

    );

    -- The copro_ext setting is only relevant to the model b
    copro_mode <= '1' when IncludeMaster or config_mode = '1' else (copro(0) or copro(1));
    copro_ext  <= '1' when IncludeMaster or config_mode = '1' else (copro(1) and ext_tube_enable);

    -- Joystick 1/2
    --   Bit 0 - Up (active low)
    --   Bit 1 - Down (active low)
    --   Bit 2 - Left (active low)
    --   Bit 3 - Right (active low)
    --   Bit 4 - Fire (active low)

    process(clock_48)
    begin
        if rising_edge(clock_48) then
            -- Spec Next toggles joy_select every 35ns
            -- The 74HC157 S->Y is 29ns max @4.5V and 145ns max @2.0V
            --
            -- joy_Counter is currently 5 bits
            -- Beeb Fpga thus toggles joy_select every 16/48 = 333ns
            --
            -- At 115200 baud a bit is ~8.7us, so sampling every 0.66us is fine
            joy_counter <= joy_counter + 1;
            -- Sample when bits 11..0 are all '1'
            if (not joy_counter(joy_counter'high - 1 downto 0)) = 0 then
                if joy_counter(joy_counter'high) = '1' then
                    joystick2 <= joyp6_i & joyp4_i & joyp3_i & joyp2_i & joyp1_i;
                    if IncludeICEDebugger and vid_debug = '1' then
                        avr_RxD <= joyp9_i;
                    end if;
                else
                    joystick1 <= joyp6_i & joyp4_i & joyp3_i & joyp2_i & joyp1_i;
                end if;
            end if;
        end if;
    end process;

    -- VGA RGB outputs
    rgb_r_o <= red(3 downto 1);
    rgb_g_o <= green(3 downto 1);
    rgb_b_o <= blue(3 downto 1);

--------------------------------------------------------
-- Clock Generation
--------------------------------------------------------

    -- 50MHz to 100MHz

    inst_DCM1 : DCM
        generic map (
            CLK_FEEDBACK         => "2X"
            )
        port map (
            CLKIN                => clock_50_i,
            CLKFB                => clk100,
            RST                  => '0',
            DSSEN                => '0',
            PSINCDEC             => '0',
            PSEN                 => '0',
            PSCLK                => '0',
            CLK2X                => clk100
            );


    -- 100MHz to 96/48/32 MHz

    inst_PLL1 : PLL_BASE
        generic map (
            BANDWIDTH            => "OPTIMIZED",
            CLK_FEEDBACK         => "CLKFBOUT",
            COMPENSATION         => "DCM2PLL",
            DIVCLK_DIVIDE        => 5,
            CLKFBOUT_MULT        => 24,
            CLKFBOUT_PHASE       => 0.000,
            CLKOUT0_DIVIDE       => 5,         -- 100 * (24/5/5) = 96MHz
            CLKOUT0_PHASE        => 0.000,
            CLKOUT0_DUTY_CYCLE   => 0.500,
            CLKOUT1_DIVIDE       => 10,        -- 100 * (24/5/10) = 48MHz
            CLKOUT1_PHASE        => 0.000,
            CLKOUT1_DUTY_CYCLE   => 0.500,
            CLKOUT2_DIVIDE       => 15,        -- 100 * (24/5/15) = 32MHz
            CLKOUT2_PHASE        => 0.000,
            CLKOUT2_DUTY_CYCLE   => 0.500,
            CLKOUT3_DIVIDE       => 20,        -- 100 * (24/5/20) = 24MHz
            CLKOUT3_PHASE        => 0.000,
            CLKOUT3_DUTY_CYCLE   => 0.500,
            CLKOUT4_DIVIDE       => 30,        -- 100 * (24/5/30) = 16MHz
            CLKOUT4_PHASE        => 0.000,
            CLKOUT4_DUTY_CYCLE   => 0.500,
            CLKIN_PERIOD         => 10.000,
            REF_JITTER           => 0.010
            )
        port map (
            -- Output clocks
            CLKFBOUT            => clkfb,
            CLKOUT0             => clk0,
            CLKOUT1             => clk1,
            CLKOUT2             => clk2,
            CLKOUT3             => clk3,
            CLKOUT4             => clk4,
            RST                 => '0',
            -- Input clock control
            CLKFBIN             => clkfb_buf,
            CLKIN               => clk100
            );

    inst_clkfb_buf : BUFG
        port map (
            I => clkfb,
            O => clkfb_buf
            );

    inst_clk0_buf : BUFG
        port map (
            I => clk0,
            O => clock_96
            );

    inst_clk1_buf : BUFG
        port map (
            I => clk1,
            O => clock_48
            );

    inst_clk2_buf : BUFG
        port map (
            I => clk2,
            O => clock_32
            );

    inst_clk3_buf : BUFG
        port map (
            I => clk3,
            O => clock_avr
            );

    inst_clk4_buf : BUFG
        port map (
            I => clk4,
            O => clock_16
            );

    -- 27MHz for HDMI (and the alternative scan doubler)

    inst_PLL2 : PLL_BASE
        generic map (
            BANDWIDTH            => "OPTIMIZED",
            CLK_FEEDBACK         => "CLKFBOUT",
            COMPENSATION         => "DCM2PLL",
            DIVCLK_DIVIDE        => 2,
            CLKFBOUT_MULT        => 27,
            CLKFBOUT_PHASE       => 0.000,
            CLKOUT0_DIVIDE       => 25,       -- 50 * (27/2/25) = 27MHz
            CLKOUT0_PHASE        => 0.000,
            CLKOUT0_DUTY_CYCLE   => 0.500,
            CLKOUT1_DIVIDE       => 5,        -- 50 * (27/2/5) = 135MHz
            CLKOUT1_PHASE        => 0.000,
            CLKOUT1_DUTY_CYCLE   => 0.500,
            CLKOUT2_DIVIDE       => 5,        -- 50 * (27/2/5) = 135MHz (inverted)
            CLKOUT2_PHASE        => 180.000,
            CLKOUT2_DUTY_CYCLE   => 0.500,
            CLKIN_PERIOD         => 20.000,
            REF_JITTER           => 0.010
            )
        port map (
            -- Output clocks
            CLKFBOUT            => hclkfb,
            CLKOUT0             => hclk0,
            CLKOUT1             => hclk1,
            CLKOUT2             => hclk2,
            RST                 => '0',
            -- Input clock control
            CLKFBIN             => hclkfb_buf,
            CLKIN               => clock_50_i
            );


    inst_hclkfb_buf : BUFG
        port map (
            I => hclkfb,
            O => hclkfb_buf
            );

    inst_hclk0_buf : BUFG
        port map (
            I => hclk0,
            O => clock_27
            );

    inst_hclk1_buf : BUFG
        port map (
            I => hclk1,
            O => clock_135
            );

    inst_hclk2_buf : BUFG
        port map (
            I => hclk2,
            O => clock_135_n
            );


--    inst_DCM2 : DCM
--        generic map (
--            CLKFX_MULTIPLY    => 27,
--            CLKFX_DIVIDE      => 25,
--            CLKIN_DIVIDE_BY_2 => TRUE,
--            CLK_FEEDBACK      => "NONE"
--            )
--        port map (
--            CLKIN             => clock_50_i,
--            CLKFB             => '0',
--            RST               => '0',
--            DSSEN             => '0',
--            PSINCDEC          => '0',
--            PSEN              => '0',
--            PSCLK             => '0',
--            CLKFX             => fx_clk_27
--            );
--
--    inst_clk27_buf : BUFG
--    port map (
--        I => fx_clk_27,
--        O => clock_27
--        );

--------------------------------------------------------
-- Power Up Reset Generation
--------------------------------------------------------

    m128_mode <= '1' when IncludeMaster else '0';

    -- Generate a reliable power up reset and handle configuration mode
    reset_gen : process(clock_48)
    begin
        if rising_edge(clock_48) then
            if config_reset = '1' then
                -- Exit config mode when config_reset register written
                config_mode <= '0';
                config_remap <= '0';
                config_reset <= '0';
                reset_counter <= (others => '0');
            elsif btn_reset_n_i = '0' then
                -- Enter config mode when red button presset
                config_mode <= '1';
                ext_tube_enable <= '0';
                reset_counter <= (others => '0');
            elsif reset_counter(reset_counter'high) = '0' then
                reset_counter <= reset_counter + 1;
            elsif powerup_reset_n = '0' and config_mode = '0' then
                -- At the end of power up reset, test for the presence of PiTubeDirect
                if ext_tube_do = x"55" then
                    ext_tube_enable <= '1';
                else
                    ext_tube_enable <= '0';
                end if;
            end if;
            powerup_reset_n <= reset_counter(reset_counter'high);

            -- Configuration toggles
            -- Yellow 1 - Video: SCART sRGB: Pixel Clock 16MHz/12MHz
            -- Yellow 2 - Video:   HDMI/VGA: Pixel Clock       27MHz
            -- Yellow 3 - Video:        VGA: Pixel Clock 32MHz/24MHz
            -- Yellow 4 - Video:        VGA: Pixel Clock 32MHz/24MHz
            -- Yellow 5 - HDMI audio/data on/off
            -- Yellow 6 - HDMI aspect: auto
            -- Yellow 7 - HDMI aspect: 4:3
            -- Yellow 8 - HDMI aspect: 16:9
            -- Yellow 9 - Int Co Pro on/off
            -- Yellow 0 - Video debug on/off
            yellow_config <= yellow_config_membrane or yellow_config_ps2;
            if yellow_config(1) = '1' then
                vid_mode      <= "0000";
            elsif yellow_config(2) = '1' then
                vid_mode      <= "0001";
            elsif yellow_config(3) = '1' then
                vid_mode      <= "0010";
            elsif yellow_config(4) = '1' then
                vid_mode      <= "0011";
            elsif yellow_config(5) = '1' then
                hdmi_audio_en <= not hdmi_audio_en;
            elsif yellow_config(6) = '1' then
                hdmi_aspect <= "00";
            elsif yellow_config(7) = '1' then
                hdmi_aspect <= "01";
            elsif yellow_config(8) = '1' then
                hdmi_aspect <= "10";
            elsif yellow_config(9) = '1' then
                if copro = "00" then
                    copro <= "01";
                elsif copro = "01" and ext_tube_enable = '1' and not IncludeMaster then
                    copro <= "10";
                else
                    copro <= "00";
                end if;
            elsif yellow_config(0) = '1' then
                vid_debug <= not vid_debug;
            end if;

            -- Overlay write-only config registers in config mode only at &2FFx
            config_reset <= '0';
            if config_mode = '1' and ('0' & RAM_A(18 downto 4)) = x"62FF" and RAM_nCS = '0' and RAM_nWE = '0' then
                case RAM_A(3 downto 0) is
					when x"0" =>
                        vid_mode <= RAM_Din(3 downto 0);
					when x"1" =>
                        hdmi_audio_en <= RAM_Din(0);
					when x"2" =>
                        hdmi_aspect <= RAM_Din(1 downto 0);
					when x"3" =>
                        copro <= RAM_Din(1 downto 0);
					when x"4" =>
                        vid_debug <= RAM_Din(0);
					when x"5" =>
                        keyb_dip <= RAM_Din(7 downto 0);
					when x"6" =>
                        ps2_swap <= RAM_Din(0);
					when x"F" =>
                        config_remap <= RAM_Din(0);
                        config_reset <= RAM_Din(7);
                    when others =>
                end case;
            end if;
        end if;
    end process;

    hard_reset_n <= powerup_reset_n;

--------------------------------------------------------
-- Dynamic Reconfiguration
--------------------------------------------------------

    reconfig_gen : process(clock_16)
    begin
        if rising_edge(clock_16) then
            if btn_reset_n_i = '0' then
                reconfig_ctr <= reconfig_ctr + 1;
            else
                reconfig_ctr <= (others => '0');
            end if;
            if reconfig_ctr = 16000000 then
                reconfig <= '1';
            end if;
        end if;
    end process;

    flash_reboot_inst : entity work.flashboot
    port map (
        reset_i    => '0',
        clock_i    => clock_16,
        start_i    => reconfig,
        spiaddr_i  => x"6B" & "00001" & "0000000000000000000"
        );

--------------------------------------------------------
-- Membrane Keyboard
--------------------------------------------------------

    kbd_spec_next_inst : entity work.kbd_spec_next
    port map (
        -- Clock
        clock             => clock_48,
        reset_n           => hard_reset_n,

        -- Specnext Keboard matrix
        keyb_col_i        => keyb_col_i,
        keyb_row_o        => keyb_row_o,

        -- Specnext Buttons
        btn_divmmc_n_i    => btn_divmmc_n_i,    -- Green  / divmmc    / Drive
        btn_multiface_n_i => btn_multiface_n_i, -- Yellow / multiface / NMI

        -- Debounced configuration outputs
        -- (pulse high for 1 clock cycle when depressed)
        green_config      => open,                       -- Green  / divmmc    / Drive
        yellow_config     => yellow_config_membrane,     -- Yellow / multiface / NMI

        -- Beeb Keyboard
        keyb_1mhz         => ext_keyb_1mhz,
        keyb_en_n         => ext_keyb_en_n,
        keyb_pa           => ext_keyb_pa,
        keyb_rst_n        => ext_keyb_rst_n,
        keyb_ca2          => ext_keyb_ca2,
        keyb_pa7          => ext_keyb_pa7
        );

--------------------------------------------------------
-- Audio DACs
--------------------------------------------------------

    -- Convert from signed to unsigned
    dac_l_in <= (not audio_l(15)) & audio_l(14 downto 6);
    dac_r_in <= (not audio_r(15)) & audio_r(14 downto 6);

    dac_l : entity work.pwm_sddac
    generic map (
        msbi_g => 9
    )
    port map (
        clk_i => clock_48,
        reset => '0',
        dac_i => dac_l_in,
        dac_o => audioext_l_o
    );

    dac_r : entity work.pwm_sddac
    generic map (
        msbi_g => 9
    )
    port map (
        clk_i => clock_48,
        reset => '0',
        dac_i => dac_r_in,
        dac_o => audioext_r_o
    );

--------------------------------------------------------
-- SRAM INTERFACE
--------------------------------------------------------

    -- The latest Spec Next firmware can pre-load ROMs into pages
    -- This mode uses Ram Chip 0

    ram_oe_n_o              <= RAM_nOE;
    ram_we_n_o              <= RAM_nWE;
    ram_ce_n_o(0)           <= RAM_nCS when RAM_A(0) = '0' else '1';
    ram_ce_n_o(1)           <= RAM_nCS when RAM_A(0) = '1' else '1';
    ram_ce_n_o(2)           <= '1';
    ram_ce_n_o(3)           <= '1';

    -- In all modes:
    --    8000-BFFF slots 0-3 => SRAM Pages 00-03
    --    8000-BFFF slots 8-F => SRAM Pages 08-0F
    --
    -- In normal mode the ROM mapping is:
    --    C000-FFFF           => SRAM Page 04 (the OS ROM)
    --    8000-BFFF slots 4-7 => SRAM Pages 14-17
    --
    -- In config mode the ROM mapping is changed as follows:
    --    C000-FFFF           => local config rom (see RAM_Dout below)
    --    8000-BFFF slots 4-7 => SRAM Pages 04-07
    --
    -- SRAM Page 04 holds the OS ROM
    -- SRAM Page 05 holds the beeb.cfg file

    -- In the 3.01.06 Spec Next Core the memory becomes 16-bits wide
    -- and A(0) selects between the lower and upper bytes

    ram_addr_o              <= "0001" & RAM_A(15 downto 1) when config_remap = '1' and RAM_A(18 downto 16) = "101" else
                               "0"    & RAM_A(18 downto 1);

    ram_data_io             <= RAM_Din & RAM_Din when RAM_nWE = '0' else (others => 'Z');

    RAM_Dout                <= config_data when config_mode = '1' and RAM_A(18 downto 14) = "00100" else
                               ram_data_io(7 downto 0) when RAM_A(0) = '0'                          else
                               ram_data_io(15 downto 8);

    flash_cs_n_o            <= '1';
    flash_mosi_o            <= '1';
    flash_sclk_o            <= '1';

    -- Embedded Config ROM replaces the MOS in config mode
    config_rom_inst : entity work.config_rom port map (
        clk  => clock_48,
        addr => RAM_A(13 downto 0),
        data => config_data
        );

--------------------------------------------------------
-- External tube connections
--------------------------------------------------------

    GenCoProExt: if IncludeCoProExt generate
    begin
        ext_tube_do  <= accel_io(25 downto 22) & accel_io(11 downto 8);
        accel_io(0)  <= 'Z';
        accel_io(1)  <= 'Z';
        accel_io(2)  <= ext_tube_a(1) when ext_tube_enable = '1' else 'Z';
        accel_io(3)  <= ext_tube_a(2) when ext_tube_enable = '1' else 'Z';
        accel_io(4)  <= ext_tube_nrst when ext_tube_enable = '1' else 'Z';
        accel_io(5)  <= 'Z'; -- reserved for ext_tube_a(3);
        accel_io(6)  <= 'Z';
        accel_io(7)  <= ext_tube_phi2 when ext_tube_enable = '1' else 'Z';
        accel_io(11 downto 8) <= ext_tube_di(3 downto 0) when ext_tube_r_nw = '0' and ext_tube_phi2 = '1' and ext_tube_enable = '1' else (others => 'Z');
        accel_io(12) <= 'Z';
        accel_io(13) <= 'Z';
        accel_io(14) <= 'Z'; -- Serial Tx
        accel_io(15) <= '1'; -- Serial Rx
        accel_io(16) <= 'Z';
        accel_io(17) <= ext_tube_ntube when ext_tube_enable = '1' else 'Z';
        accel_io(18) <= ext_tube_r_nw when ext_tube_enable = '1' else 'Z';
        accel_io(19) <= 'Z';
        accel_io(20) <= 'Z';
        accel_io(21) <= 'Z';
        accel_io(25 downto 22) <= ext_tube_di(7 downto 4) when ext_tube_r_nw = '0' and ext_tube_phi2 = '1' and ext_tube_enable = '1' else (others => 'Z');
        accel_io(26) <= 'Z';
        accel_io(27) <= ext_tube_a(0) when ext_tube_enable = '1' else 'Z';
    end generate;

    GenCoProNotExt: if not IncludeCoProExt generate
    begin
        ext_tube_do  <= x"FE";
        accel_io     <= (others => 'Z');
    end generate;

--------------------------------------------------------
-- HDMI Output
--------------------------------------------------------

    inst_hdmi_out_xilinx: entity work.hdmi_out_xilinx
    port map (
        clock_pixel_i  => clock_27,    -- (x1)
        clock_tmds_i   => clock_135,   -- (x5)
        clock_tmds_n_i => clock_135_n, -- (x5)
        red_i          => tmds_r,
        green_i        => tmds_g,
        blue_i         => tmds_b,
        tmds_out_p     => hdmi_p_o,
        tmds_out_n     => hdmi_n_o
   );

--------------------------------------------------------
-- Unused outputs
--------------------------------------------------------

    -- Interal audio (speaker, not fitted)
    audioint_o     <= '0';

    -- Spectrum Next Bus
    -- (all these signals have PULLUP set in the .ucf file)
    bus_addr_o     <= (others => 'Z');
    bus_busack_n_o <= 'Z';
    bus_clk35_o    <= 'Z';
    bus_data_io    <= (others => 'Z');
    bus_halt_n_o   <= 'Z';
    bus_iorq_n_o   <= 'Z';
    bus_m1_n_o     <= 'Z';
    bus_mreq_n_o   <= 'Z';
    bus_rd_n_o     <= 'Z';
    bus_rfsh_n_o   <= 'Z';
    bus_rst_n_io   <= 'Z';
    bus_wr_n_o     <= 'Z';
    bus_int_n_io   <= 'Z';

    -- TODO: add support for sRGB output
    csync_o        <= '1';

    -- ESP 8266 module
    esp_gpio0_io   <= 'Z';
    esp_gpio2_io   <= 'Z';
    esp_tx_o       <= '1';

    -- Addtional flash pins; used at IO2 and IO3 in Quad SPI Mode
    flash_hold_o   <= '1';
    flash_wp_o     <= '0';

    i2c_scl_io <= 'Z';
    i2c_sda_io <= 'Z';

    -- Pin 7 on the joystick connecter
    joyp7_o    <= avr_TxD when IncludeICEDebugger and vid_debug = '1' else '1';

    -- Controls a mux to select between two joystick ports
    joysel_o   <= joy_counter(joy_counter'high);

    -- Mic Port (output, as it connects to the mic input on cassette deck)
    mic_port_o <= '0';

    -- CS2 is for internal SD socket
    sd_cs1_n_o <= '1';

    -- Extra unused pin
    extras_io <= 'Z';

end architecture;
