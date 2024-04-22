-- BBC Master / BBC B for the Pynq Z2
--
-- Copright (c) 2021 David Banks
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
-- Pynq Z2 top-level
--
-- (c) 2021 David Banks
-- (C) 2011 Mike Stirling

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.Vcomponents.all;

-- Generic top-level entity for Pynq Z2 board
entity bbc_micro_pynqz2 is
    generic (
        IncludeAMXMouse    : boolean := false;
        IncludeSPISD       : boolean := true;
        IncludeSID         : boolean := true;
        IncludeMusic5000   : boolean := true;
        IncludeICEDebugger : boolean := true;
        IncludeCoPro6502   : boolean := true;
        IncludeCoProExt    : boolean := true;
        IncludeVideoNuLA   : boolean := true;
        IncludeMaster      : boolean := true;
        UseOrigKeyboard    : boolean := true
    );
    port (
        -- PMOD B
        btn_reset          : in    std_logic;
        ps2_clk_io         : inout std_logic;
        ps2_data_io        : inout std_logic;
        sd_cs_n_o          : out   std_logic;
        sd_miso_i          : in    std_logic;
        sd_mosi_o          : out   std_logic;
        sd_sclk_o          : out   std_logic;

        -- LEDs
        led                : out   std_logic_vector(3 downto 0);

        -- Switches
        sw                 : in    std_logic_vector(1 downto 0);

        -- Audio
        au_adr0            : out   std_logic;
        au_adr1            : out   std_logic;
        au_mclk            : out   std_logic;
        au_sda             : inout std_logic;
        au_scl             : out   std_logic;
        au_dout            : in    std_logic;
        au_din             : out   std_logic;
        au_lrclk           : in    std_logic;
        au_bclk            : in    std_logic;

        -- HDMI
        hdmi_n             : out   std_logic_vector(3 downto 0);
        hdmi_p             : out   std_logic_vector(3 downto 0);
        hdmi_scl           : inout std_logic;
        hdmi_sda           : inout std_logic;
        hdmi_cec           : inout std_logic;
        hdmi_hpdn          : in    std_logic;

        -- ICE Debugger
        --avr_RxD            : in    std_logic;
        --avr_TxD            : out   std_logic;

        -- PiTubeDirect connects to the Raspberry Pi Connector
        accel_io           : inout std_logic_vector(27 downto 0);

        -- External Keyboard connects to the Arduino Connector
        ext_keyb_led1      : out   std_logic;
        ext_keyb_led2      : out   std_logic;
        ext_keyb_led3      : out   std_logic;
        ext_keyb_1mhz      : out   std_logic;
        ext_keyb_en_n      : out   std_logic;
        ext_keyb_pa        : out   std_logic_vector(6 downto 0);
        ext_keyb_rst_n     : in    std_logic;
        ext_keyb_ca2       : in    std_logic;
        ext_keyb_pa7       : in    std_logic;

        -- Test pins
        test               : out   std_logic_vector(3 downto 0);

        -- Zynq Processing System

        DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
        DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
        DDR_cas_n : inout STD_LOGIC;
        DDR_ck_n : inout STD_LOGIC;
        DDR_ck_p : inout STD_LOGIC;
        DDR_cke : inout STD_LOGIC;
        DDR_cs_n : inout STD_LOGIC;
        DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
        DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_odt : inout STD_LOGIC;
        DDR_ras_n : inout STD_LOGIC;
        DDR_reset_n : inout STD_LOGIC;
        DDR_we_n : inout STD_LOGIC;
        FIXED_IO_ddr_vrn : inout STD_LOGIC;
        FIXED_IO_ddr_vrp : inout STD_LOGIC;
        FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
        FIXED_IO_ps_clk : inout STD_LOGIC;
        FIXED_IO_ps_porb : inout STD_LOGIC;
        FIXED_IO_ps_srstb : inout STD_LOGIC
        );
end entity;

architecture rtl of bbc_micro_pynqz2 is

-------------
-- Signals
-------------

    -- PLL 1
    signal clk0            : std_logic;
    signal clk1            : std_logic;
    signal clk2            : std_logic;
    signal clkfb           : std_logic;
    signal clkfb_buf       : std_logic;
    signal clock_avr       : std_logic;
    signal clock_codec     : std_logic;
    signal clock_48        : std_logic;

    -- PLL 2
    signal hclk0           : std_logic;
    signal hclk1           : std_logic;
    signal hclk2           : std_logic;
    signal hclkfb          : std_logic;
    signal hclkfb_buf      : std_logic;
    signal clock_27        : std_logic;
    signal clock_135       : std_logic;
    signal clock_135_n     : std_logic;

    signal au_mclk_int     : std_logic;
    signal au_din_int      : std_logic;
    signal audio_l         : std_logic_vector(15 downto 0);
    signal audio_r         : std_logic_vector(15 downto 0);
    signal audio_24_l      : std_logic_vector(23 downto 0);
    signal audio_24_r      : std_logic_vector(23 downto 0);
    signal audio_24_sample : std_logic;
    signal debug_scl       : std_logic;
    signal debug_sda       : std_logic;

    signal powerup_reset_n : std_logic;
    signal hard_reset_n    : std_logic;
    signal hard_reset      : std_logic;
    signal reset_counter   : std_logic_vector(9 downto 0);
    signal RAM_A           : std_logic_vector(18 downto 0);
    signal RAM_Din         : std_logic_vector(7 downto 0);
    signal RAM_Dout        : std_logic_vector(7 downto 0);
    signal RAM_nWE         : std_logic;
    signal RAM_nOE         : std_logic;
    signal RAM_nCS         : std_logic;
    signal RAM_CS          : std_logic;
    signal RAM_WE          : std_logic;
    signal keyb_dip        : std_logic_vector(7 downto 0) := x"00";
    signal vid_mode        : std_logic_vector(3 downto 0) := "0001";
    signal m128_mode       : std_logic;
    signal copro_mode      : std_logic;
    signal ext_tube_r_nw   : std_logic;
    signal ext_tube_nrst   : std_logic;
    signal ext_tube_ntube  : std_logic;
    signal ext_tube_phi2   : std_logic;
    signal ext_tube_a      : std_logic_vector(6 downto 0);
    signal ext_tube_di     : std_logic_vector(7 downto 0);
    signal ext_tube_do     : std_logic_vector(7 downto 0);

    signal hdmi_aspect     : std_logic_vector(1 downto 0);
    signal hdmi_audio_en   : std_logic;
    signal vid_debug       : std_logic;
    signal tmds_r          : std_logic_vector(9 downto 0);
    signal tmds_g          : std_logic_vector(9 downto 0);
    signal tmds_b          : std_logic_vector(9 downto 0);

    signal config          : std_logic_vector(9 downto 0);

    signal caps_led        : std_logic;
    signal shift_led       : std_logic;

    signal FCLK_CLK0_0     : std_logic;
    signal FCLK_RESET0_N_0 : std_logic;

    signal avr_RxD         : std_logic;
    signal avr_TxD         : std_logic;

    signal usb_kb_matrix   : std_logic_vector(127 downto 0);
    signal usb_kb_col      : std_logic_vector(7 downto 0);
    signal usb_kb_counter  : std_logic_vector(3 downto 0);
    signal usb_kb_ca2      : std_logic;
    signal usb_kb_pa7      : std_logic;

    signal keyb_1mhz       : std_logic;
    signal keyb_1mhz_last  : std_logic;
    signal keyb_en_n       : std_logic;
    signal keyb_pa         : std_logic_vector(6 downto 0);
    signal keyb_rst_n      : std_logic;
    signal keyb_ca2        : std_logic;
    signal keyb_pa7        : std_logic;
    signal fn_keys         : std_logic_vector(9 downto 0);
    signal fn_keys_last    : std_logic_vector(9 downto 0);

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
        UseOrigKeyboard    => UseOrigKeyboard,
        UseT65Core         => not IncludeMaster,  -- select the 6502 for the Beeb
        UseAlanDCore       => IncludeMaster,      -- select the 65C02 for the Master
        OverrideCMOS       => false
        )
    port map (
        clock_27       => clock_27,
        clock_32       => '0',                    -- no longer used
        clock_48       => clock_48,
        clock_96       => '0',                    -- used by myst scan doubler which is optimised away
        clock_avr      => clock_avr,
        hard_reset_n   => hard_reset_n,
        ps2_kbd_clk    => ps2_clk_io,
        ps2_kbd_data   => ps2_data_io,
        ps2_mse_clk    => open,
        ps2_mse_data   => open,
        ps2_swap       => '0',
        video_red      => open,
        video_green    => open,
        video_blue     => open,
        video_vsync    => open,
        video_hsync    => open,
        audio_l        => audio_l,
        audio_r        => audio_r,
        ext_nOE        => RAM_nOE,
        ext_nWE        => RAM_nWE,
        ext_nCS        => RAM_nCS,
        ext_A          => RAM_A,
        ext_Dout       => RAM_Dout,
        ext_Din        => RAM_Din,
        SDMISO         => sd_miso_i,
        SDSS           => sd_cs_n_o,
        SDCLK          => sd_sclk_o,
        SDMOSI         => sd_mosi_o,
        caps_led       => caps_led,
        shift_led      => shift_led,
        keyb_dip       => keyb_dip,
        vid_mode       => vid_mode,
        joystick1      => "11111",
        joystick2      => "11111",
        avr_reset      => hard_reset,
        avr_RxD        => avr_RxD,
        avr_TxD        => avr_TxD,
        cpu_addr       => open,
        m128_mode      => m128_mode,
        copro_mode     => copro_mode,
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
        ext_keyb_led1  => ext_keyb_led1,
        ext_keyb_led2  => ext_keyb_led2,
        ext_keyb_led3  => ext_keyb_led3,
        ext_keyb_1mhz  => keyb_1mhz,
        ext_keyb_en_n  => keyb_en_n,
        ext_keyb_pa    => keyb_pa,

        ext_keyb_rst_n => keyb_rst_n,
        ext_keyb_ca2   => keyb_ca2,
        ext_keyb_pa7   => keyb_pa7,

        -- HDMI
        hdmi_aspect    => hdmi_aspect,
        hdmi_audio_en  => hdmi_audio_en,
        vid_debug      => vid_debug,
        tmds_r         => tmds_r,
        tmds_g         => tmds_g,
        tmds_b         => tmds_b,

        -- config
        config         => open
    );

--------------------------------------------------------
-- USB Keyboard Matrix
--------------------------------------------------------

    ext_keyb_1mhz <= keyb_1mhz;
    ext_keyb_en_n <= keyb_en_n;
    ext_keyb_pa   <= keyb_pa;

    process(clock_48)
    begin
        if rising_edge(clock_48) then
            if keyb_1mhz = '1' and keyb_1mhz_last = '0' then
                if keyb_en_n = '0' then
                    usb_kb_counter <= keyb_pa(3 downto 0);
                else
                    usb_kb_counter <= usb_kb_counter + 1;
                end if;
                -- Map config function to <Ctrl> <Shift> <Fn>
                fn_keys_last <= fn_keys;
                if usb_kb_matrix(8) = '1' and usb_kb_matrix(0) = '1' then
                    config <= fn_keys and not(fn_keys_last);
                end if;
            else
                config <= (others => '0');
            end if;
            keyb_1mhz_last <= keyb_1mhz;
        end if;
    end process;

    usb_kb_col <= usb_kb_matrix(to_integer(unsigned(usb_kb_counter)) * 8 + 7 downto to_integer(unsigned(usb_kb_counter)) * 8);
    usb_kb_ca2 <= usb_kb_col(1) or usb_kb_col(2) or usb_kb_col(3) or usb_kb_col(4) or usb_kb_col(5) or usb_kb_col(6) or usb_kb_col(7);
    usb_kb_pa7 <= '0' when keyb_en_n = '1' else usb_kb_col(to_integer(unsigned(keyb_pa(6 downto 4))));

    keyb_rst_n <= ext_keyb_rst_n and not (usb_kb_matrix(127));
    keyb_ca2   <= ext_keyb_ca2   or usb_kb_ca2;
    keyb_pa7   <= ext_keyb_pa7   or usb_kb_pa7;

    -- F9...F1, F10
    fn_keys <= usb_kb_matrix(63) & usb_kb_matrix(55) & usb_kb_matrix(49) & usb_kb_matrix(47) & usb_kb_matrix(39) &
               usb_kb_matrix(33) & usb_kb_matrix(31) & usb_kb_matrix(23) & usb_kb_matrix(15) & usb_kb_matrix(2);

--------------------------------------------------------
-- Zynq Processing System
--------------------------------------------------------

    inst_PS : entity work.ProcessingSystemOnly_wrapper
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FCLK_CLK0_0 => FCLK_CLK0_0,
      FCLK_RESET0_N_0 => FCLK_RESET0_N_0,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      UART1_RX_0 => avr_TxD,
      UART1_TX_0 => avr_RxD,
      gpio_io_o_0 => usb_kb_matrix(31 downto  0),
      gpio_io_o_1 => usb_kb_matrix(63 downto 32),
      gpio_io_o_2 => usb_kb_matrix(95 downto 64),
      gpio_io_o_3 => usb_kb_matrix(127 downto 96)
    );

--------------------------------------------------------
-- Clock Generation
--------------------------------------------------------

    -- 50MHz to 48/32/24 MHz

    inst_PLL1 : MMCM_BASE
        generic map (
            BANDWIDTH            => "OPTIMIZED",
            DIVCLK_DIVIDE        => 1,
            CLKFBOUT_MULT_F      => 24.0,      -- VCO 1200
            CLKFBOUT_PHASE       => 0.000,
            CLKOUT0_DIVIDE_F     => 37.5,      -- 1200 / 37.5 = 32MHz
            CLKOUT0_PHASE        => 0.000,
            CLKOUT0_DUTY_CYCLE   => 0.500,
            CLKOUT1_DIVIDE       => 25,        -- 1200 / 25 = 48MHz
            CLKOUT1_PHASE        => 0.000,
            CLKOUT1_DUTY_CYCLE   => 0.500,
            CLKOUT2_DIVIDE       => 50,        -- 1200 / 50 = 24MHz
            CLKOUT2_PHASE        => 0.000,
            CLKOUT2_DUTY_CYCLE   => 0.500,
            CLKIN1_PERIOD        => 20.000
            )
        port map (
            -- Output clocks
            CLKFBOUT            => clkfb,
            CLKOUT0             => clk0,
            CLKOUT1             => clk1,
            CLKOUT2             => clk2,
            RST                 => '0',
            PWRDWN              => '0',
            -- Input clock control
            CLKFBIN             => clkfb_buf,
            CLKIN1              => FCLK_CLK0_0
            );

    inst_clkfb_buf : BUFG
        port map (
            I => clkfb,
            O => clkfb_buf
            );

    inst_clk0_buf : BUFG
        port map (
            I => clk0,
            O => clock_codec
            );

    inst_clk1_buf : BUFG
        port map (
            I => clk1,
            O => clock_48
            );

    inst_clk2_buf : BUFG
        port map (
            I => clk2,
            O => clock_avr
            );

    -- 50MHz to 27MHz/135MHz for HDMI (and the alternative scan doubler)

    inst_PLL2 : MMCM_BASE
        generic map (
            BANDWIDTH            => "OPTIMIZED",
            DIVCLK_DIVIDE        => 1,
            CLKFBOUT_MULT_F      => 13.5,      -- VCO 675 MHz
            CLKFBOUT_PHASE       => 0.000,
            CLKOUT0_DIVIDE_F     => 25.0,      -- 675 / 25 = 27MHz
            CLKOUT0_PHASE        => 0.000,
            CLKOUT0_DUTY_CYCLE   => 0.500,
            CLKOUT1_DIVIDE       => 5,         -- 675 / 5 = 135MHz
            CLKOUT1_PHASE        => 0.000,
            CLKOUT1_DUTY_CYCLE   => 0.500,
            CLKOUT2_DIVIDE       => 5,         -- 675 / 5 = 135MHz (inverted)
            CLKOUT2_PHASE        => 180.000,
            CLKOUT2_DUTY_CYCLE   => 0.500,
            CLKIN1_PERIOD        => 20.000
            )
        port map (
            -- Output clocks
            CLKFBOUT            => hclkfb,
            CLKOUT0             => hclk0,
            CLKOUT1             => hclk1,
            CLKOUT2             => hclk2,
            RST                 => '0',
            PWRDWN              => '0',
            -- Input clock control
            CLKFBIN             => hclkfb_buf,
            CLKIN1              => FCLK_CLK0_0
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

--------------------------------------------------------
-- Power Up Reset Generation
--------------------------------------------------------

    m128_mode <= '1' when IncludeMaster else '0';

    -- Generate a reliable power up reset and handle configuration mode
    reset_gen : process(clock_48)
    begin
        if rising_edge(clock_48) then
            if btn_reset = '1' then
                reset_counter <= (others => '0');
            elsif reset_counter(reset_counter'high) = '0' then
                reset_counter <= reset_counter + 1;
            end if;
            powerup_reset_n <= reset_counter(reset_counter'high);
            -- Configuration toggles
            -- Yellow 5 - HDMI audio/data on/off
            -- Yellow 6 - HDMI aspect: auto
            -- Yellow 7 - HDMI aspect: 4:3
            -- Yellow 8 - HDMI aspect: 16:9
            -- Yellow 9 - Int Co Pro on/off
            -- Yellow 0 - Video debug on/off
            if powerup_reset_n = '0' then
                hdmi_audio_en <= '1';
                hdmi_aspect <= "00";
                copro_mode <= sw(0);
                vid_debug <= sw(1);
            else
                if config(5) = '1' then
                    hdmi_audio_en <= not hdmi_audio_en;
                end if;
                if config(6) = '1' then
                    hdmi_aspect <= "00";
                end if;
                if config(7) = '1' then
                    hdmi_aspect <= "01";
                end if;
                if config(8) = '1' then
                    hdmi_aspect <= "10";
                end if;
                if config(9) = '1' then
                    copro_mode <= not copro_mode;
                end if;
                if config(0) = '1' then
                    vid_debug <= not vid_debug;
                end if;
            end if;
        end if;
    end process;

    hard_reset_n <= powerup_reset_n;
    hard_reset   <= not hard_reset_n;

--------------------------------------------------------
-- SRAM INTERFACE
--------------------------------------------------------

    RAM_CS <= not RAM_nCS;
    RAM_WE <= not RAM_nWE;

    sram : entity work.generic_ram
    generic map (
        ADDR_BITS => 19,
        DATA_BITS => 8
    )
    port map (
        clk  => clock_48,
        ena  => RAM_CS,
        wea  => RAM_WE,
        addr => RAM_A,
        din  => RAM_Din,
        dout => RAM_Dout
    );

--------------------------------------------------------
-- 24-bit Audio
--------------------------------------------------------

    process(clock_48)
    begin
        if rising_edge(clock_48) then
            if (audio_24_sample = '1') then
                audio_24_l <= audio_l & x"00";
                audio_24_r <= audio_r & x"00";
            end if;
        end if;
    end process;

    adau1761 : entity work.adau1761
    port map (
        -- Clocks
        clk_48     => clock_48,
        clk_codec  => clock_codec,

        -- Internal interface
        audio_l_in  => audio_24_l,
        audio_r_in  => audio_24_r,
        audio_l_out => open,
        audio_r_out => open,
        new_sample  => audio_24_sample,

        -- ADAU1761 I2C control interface
        adr0  => au_adr0,
        adr1  => au_adr1,
        scl   => au_scl,
        sda   => au_sda,

        -- ADAU1761 I2S data interface
        mclk  => au_mclk_int,
        bclk  => au_bclk,
        lrclk => au_lrclk,
        din   => au_dout, -- au_dout is the data out from the ADC
        dout  => au_din_int,  -- au_din is the data in to the DAC

        debug_scl => debug_scl,
        debug_sda => debug_sda

        );

    au_mclk <= au_mclk_int;
    au_din  <= au_din_int;
    test <= au_mclk_int & au_bclk & au_lrclk & au_din_int;

--------------------------------------------------------
-- External tube connections
--------------------------------------------------------

    GenCoProExt: if IncludeCoProExt generate
    begin
        ext_tube_do  <= accel_io(25 downto 22) & accel_io(11 downto 8);
        accel_io(0)  <= 'Z';
        accel_io(1)  <= 'Z';
        accel_io(2)  <= ext_tube_a(1);
        accel_io(3)  <= ext_tube_a(2);
        accel_io(4)  <= ext_tube_nrst;
        accel_io(5)  <= 'Z'; -- reserved for ext_tube_a(3);
        accel_io(6)  <= 'Z';
        accel_io(7)  <= ext_tube_phi2;
        accel_io(11 downto 8) <= ext_tube_di(3 downto 0) when ext_tube_r_nw = '0' and ext_tube_phi2 = '1' else (others => 'Z');
        accel_io(12) <= 'Z';
        accel_io(13) <= 'Z';
        accel_io(14) <= 'Z'; -- Serial Tx
        accel_io(15) <= '1'; -- Serial Rx
        accel_io(16) <= 'Z';
        accel_io(17) <= ext_tube_ntube;
        accel_io(18) <= ext_tube_r_nw;
        accel_io(19) <= 'Z';
        accel_io(20) <= 'Z';
        accel_io(21) <= 'Z';
        accel_io(25 downto 22) <= ext_tube_di(7 downto 4) when ext_tube_r_nw = '0' and ext_tube_phi2 = '1' else (others => 'Z');
        accel_io(26) <= 'Z';
        accel_io(27) <= ext_tube_a(0);
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
        tmds_out_p     => hdmi_p,
        tmds_out_n     => hdmi_n
   );

--------------------------------------------------------
-- Miscellaneous outputs
--------------------------------------------------------

    led(0) <= btn_reset;
    led(1) <= caps_led;
    led(2) <= shift_led;
    led(3) <= usb_kb_matrix(127);

    hdmi_scl <= 'Z';
    hdmi_sda <= 'Z';
    hdmi_cec <= 'Z';

end architecture;
