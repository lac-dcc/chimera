-- BBC Master / BBC B for the Papilio Duo
--
-- Copright (c) 2020 David Banks
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
-- Papilio Duo top-level
--
-- (c) 2022 David Banks
-- (C) 2011 Mike Stirling

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

-- Generic top-level entity for Papilio Duo board
entity bbc_micro_duo is
    generic (
        IncludeAMXMouse    : boolean := false;  -- Also must enable pullup on accel_io(8,9) in .ucf file
        IncludeSPISD       : boolean := true;
        IncludeSID         : boolean := false;
        IncludeMusic5000   : boolean := true;
        IncludeICEDebugger : boolean := true;
        IncludeCoPro6502   : boolean := true;
        IncludeCoProExt    : boolean := false;   -- Also helps to enable pulldown on D0/accel_io(8) in .ucf file
        IncludeRGBtoHDMI   : boolean := true;
        IncludeVideoNuLA   : boolean := false;
        IncludeBootstrap   : boolean := true;
        IncludeMaster      : boolean := false;
        IncludeMinimal     : boolean := false   -- Creates a build to test
                                                -- 4x16K ROM Images
    );
    port (
        clk_32M00      : in    std_logic;
        ps2_kbd_clk    : inout std_logic;
        ps2_kbd_data   : inout std_logic;
        ERST           : in    std_logic;
        red            : out   std_logic_vector (3 downto 0);
        green          : out   std_logic_vector (3 downto 0);
        blue           : out   std_logic_vector (3 downto 0);
        vsync          : out   std_logic;
        hsync          : out   std_logic;
        audioL         : out   std_logic;
        audioR         : out   std_logic;
        SRAM_nOE       : out   std_logic;
        SRAM_nWE       : out   std_logic;
        SRAM_nCS       : out   std_logic;
        SRAM_A         : out   std_logic_vector (20 downto 0);
        SRAM_D         : inout std_logic_vector (7 downto 0);
        SDMISO         : in    std_logic;
        SDSS           : out   std_logic;
        SDCLK          : out   std_logic;
        SDMOSI         : out   std_logic;
        ARDUINO_RESET  : out   std_logic;
        SW1            : in    std_logic;
        FLASH_CS       : out   std_logic;                     -- Active low FLASH chip select
        FLASH_SI       : out   std_logic;                     -- Serial output to FLASH chip SI pin
        FLASH_CK       : out   std_logic;                     -- FLASH clock
        FLASH_SO       : in    std_logic;                     -- Serial input from FLASH chip SO pin
        avr_RxD        : in    std_logic;
        avr_TxD        : out   std_logic;
        -- DIP(0) = Video Mode:
        --             (0) SCART RGB mode (15.625KHz)
        --             (1) VGA Mode (Mode 0-6: Mist SD, Mode 7: SAA5050 VGA Mode)
        -- DIP(1) = Co Pro:
        --             (0) Off
        --             (1) On
        -- DIP(2) = Machine:
        --             (0) BBC Model B
        --             (1) BBC Master
        -- DIP(3) = NulA:
        --             (0) Off
        --             (1) On
        DIP            : in    std_logic_vector(3 downto 0);
        JOYSTICK1      : in    std_logic_vector(4 downto 0);

        -- This is also used for JOYSTICK2, MOUSE, LED1/2
        -- when the Co Pro is disabled
        accel_io       : inout std_logic_vector(15 downto 0)

    );
end entity;

architecture rtl of bbc_micro_duo is

-------------
-- Signals
-------------

    signal clk0            : std_logic;
    signal clk1            : std_logic;
    signal clk2            : std_logic;
    signal clk3            : std_logic;
    signal clkfb           : std_logic;
    signal clkfb_buf       : std_logic;
    signal fx_clk_27       : std_logic;
    signal fx_clk_32       : std_logic;

    signal clock_27        : std_logic;
    signal clock_32        : std_logic;
    signal clock_48        : std_logic;
    signal clock_96        : std_logic;
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
    signal audio           : std_logic;
    signal powerup_reset_n : std_logic;
    signal hard_reset_n    : std_logic;
    signal reset_counter   : std_logic_vector(9 downto 0);
    signal RAM_A           : std_logic_vector(18 downto 0);
    signal RAM_Din         : std_logic_vector(7 downto 0);
    signal RAM_Dout        : std_logic_vector(7 downto 0);
    signal RAM_nWE         : std_logic;
    signal RAM_nOE         : std_logic;
    signal RAM_nCS         : std_logic;
    signal keyb_dip        : std_logic_vector(7 downto 0);
    signal vid_mode        : std_logic_vector(3 downto 0);
    signal m128_mode       : std_logic;
    signal copro_mode      : std_logic;
    signal caps_led        : std_logic;
    signal shift_led       : std_logic;

    signal ext_tube_r_nw   : std_logic;
    signal ext_tube_nrst   : std_logic;
    signal ext_tube_ntube  : std_logic;
    signal ext_tube_phi2   : std_logic;
    signal ext_tube_a      : std_logic_vector(6 downto 0);
    signal ext_tube_di     : std_logic_vector(7 downto 0);
    signal ext_tube_do     : std_logic_vector(7 downto 0);

    signal ps2_mse_clk    : std_logic;
    signal ps2_mse_clk_o  : std_logic;
    signal ps2_mse_data   : std_logic;
    signal ps2_mse_data_o : std_logic;
    signal LED1           : std_logic;
    signal LED2           : std_logic;
    signal JOYSTICK2      : std_logic_vector(4 downto 0);
    signal ROM_D          : std_logic_vector(7 downto 0);

    signal red_int        : std_logic_vector(3 downto 0);
    signal green_int      : std_logic_vector(3 downto 0);
    signal blue_int       : std_logic_vector(3 downto 0);
    signal hsync_int      : std_logic;
    signal vsync_int      : std_logic;

-----------------------------------------------
-- Bootstrap ROM Image from SPI FLASH into SRAM
-----------------------------------------------

    -- These are settings for use with a minimal 64K ROM config
    --
    --        Beeb          Master
    -- 0 -> 4 MOS 1.20      4 MOS 3.20
    -- 1 -> 8 MMFS          9 MMFS
    -- 2 -> E Ram Master    C Basic II
    -- 3 -> F Basic II      F Terminal
    constant user_rom_map_beeb_minimal    : std_logic_vector(63 downto 0) := x"000000000000FE84";
    constant user_rom_map_master_minimal  : std_logic_vector(63 downto 0) := x"000000000000FC94";
    constant user_rom_map_full            : std_logic_vector(63 downto 0) := x"FEDCBA9876543210";
    signal   user_rom_map                 : std_logic_vector(63 downto 0);

    -- start address of user data in FLASH as obtained from bitmerge.py
    -- this mus be beyond the end of the bitstream

    constant user_address_beeb            : std_logic_vector(23 downto 0) := x"200000";
    constant user_address_master_minimal  : std_logic_vector(23 downto 0) := x"210000";
    constant user_address_master_full     : std_logic_vector(23 downto 0) := x"240000";
    signal   user_address                 : std_logic_vector(23 downto 0);

    -- length of user data in FLASH = 256KB (16x 16K ROM) images
    constant user_length_full             : std_logic_vector(23 downto 0) := x"040000";

    -- length of user data in FLASH = 64KB (4x 16K ROM) images
    constant user_length_minimal          : std_logic_vector(23 downto 0) := x"010000";

    function calc_user_length (isMinimal : in Boolean) return std_logic_vector is
        variable tmp : std_logic_vector(23 downto 0);
    begin
        if isMinimal then
            tmp := user_length_minimal;
        else
            tmp := user_length_full;
        end if;
        return tmp;
    end calc_user_length;

    -- high when FLASH is being copied to SRAM, can be used by user as active high reset
    signal bootstrap_busy  : std_logic;

begin

--------------------------------------------------------
-- BBC Micro Core
--------------------------------------------------------

    copro_mode <= DIP(1);
    keyb_dip       <= "00000000";
    m128_mode      <= '1' when IncludeMaster else '0';
    vid_mode       <= "0000" when DIP(0) = '0' else "0011";
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
        UseOrigKeyboard    => false,
        UseT65Core         => not IncludeMaster,  -- select the 6502 for the Beeb
        UseAlanDCore       => IncludeMaster       -- select the 65C02 for the Master
    )
    port map (
        clock_27       => clock_27,
        clock_32       => clock_32,
        clock_48       => clock_48,
        clock_96       => clock_96,
        clock_avr      => clock_avr,
        hard_reset_n   => hard_reset_n,
        ps2_kbd_clk    => ps2_kbd_clk,
        ps2_kbd_data   => ps2_kbd_data,
        ps2_mse_clk    => ps2_mse_clk,
        ps2_mse_clk_o  => ps2_mse_clk_o,
        ps2_mse_data   => ps2_mse_data,
        ps2_mse_data_o => ps2_mse_data_o,
        video_red      => red_int,
        video_green    => green_int,
        video_blue     => blue_int,
        video_vsync    => vsync_int,
        video_hsync    => hsync_int,
        audio_l        => audio_l,
        audio_r        => audio_r,
        ext_nOE        => RAM_nOE,
        ext_nWE        => RAM_nWE,
        ext_nCS        => RAM_nCS,
        ext_A          => RAM_A,
        ext_Dout       => RAM_Dout,
        ext_Din        => RAM_Din,
        SDMISO         => SDMISO,
        SDSS           => SDSS,
        SDCLK          => SDCLK,
        SDMOSI         => SDMOSI,
        caps_led       => caps_led,
        shift_led      => shift_led,
        keyb_dip       => keyb_dip,
        vid_mode       => vid_mode,
        joystick1      => JOYSTICK1,
        joystick2      => JOYSTICK2,
        avr_reset      => not hard_reset_n,
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
        -- original keyboard not yet supported on the Duo
        ext_keyb_led1  => open,
        ext_keyb_led2  => open,
        ext_keyb_led3  => open,
        ext_keyb_1mhz  => open,
        ext_keyb_en_n  => open,
        ext_keyb_pa    => open,
        ext_keyb_rst_n => '1',
        ext_keyb_ca2   => '1',
        ext_keyb_pa7   => '1'
    );
    LED1  <= caps_led;
    LED2  <= shift_led;
    red   <= red_int;
    green <= green_int;
    blue  <= blue_int;
    hsync <= hsync_int;
    vsync <= vsync_int;

--------------------------------------------------------
-- Clock Generation
--------------------------------------------------------

    inst_PLL : PLL_BASE
        generic map (
            BANDWIDTH            => "OPTIMIZED",
            CLK_FEEDBACK         => "CLKFBOUT",
            COMPENSATION         => "SYSTEM_SYNCHRONOUS",
            DIVCLK_DIVIDE        => 1,
            CLKFBOUT_MULT        => 15,
            CLKFBOUT_PHASE       => 0.000,
            CLKOUT0_DIVIDE       => 5,         -- 32 * (15/5) = 96MHz
            CLKOUT0_PHASE        => 0.000,
            CLKOUT0_DUTY_CYCLE   => 0.500,
            CLKOUT1_DIVIDE       => 10,        -- 32 * (15/10) = 48MHz
            CLKOUT1_PHASE        => 0.000,
            CLKOUT1_DUTY_CYCLE   => 0.500,
            CLKOUT2_DIVIDE       => 15,        -- 32 * (15/15) = 32MHz
            CLKOUT2_PHASE        => 0.000,
            CLKOUT2_DUTY_CYCLE   => 0.500,
            CLKOUT3_DIVIDE       => 20,        -- 32 * (15/20) = 24MHz
            CLKOUT3_PHASE        => 0.000,
            CLKOUT3_DUTY_CYCLE   => 0.500,
            CLKIN_PERIOD         => 31.25,
            REF_JITTER           => 0.010
            )
        port map (
            -- Output clocks
            CLKFBOUT            => clkfb,
            CLKOUT0             => clk0,
            CLKOUT1             => clk1,
            CLKOUT2             => clk2,
            CLKOUT3             => clk3,
            RST                 => '0',
            -- Input clock control
            CLKFBIN             => clkfb_buf,
            CLKIN               => clk_32M00
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

    -- 27MHz for the alternative scan doubler

    inst_DCM : DCM
        generic map (
            CLKFX_MULTIPLY    => 27,
            CLKFX_DIVIDE      => 32,
            CLK_FEEDBACK      => "1X"
            )
        port map (
            CLKIN             => clk_32M00,
            CLKFB             => fx_clk_32,
            RST               => '0',
            DSSEN             => '0',
            PSINCDEC          => '0',
            PSEN              => '0',
            PSCLK             => '0',
            CLK2X             => fx_clk_32,
            CLKFX             => fx_clk_27
            );

    inst_clk27_buf : BUFG
    port map (
        I => fx_clk_27,
        O => clock_27
        );

--------------------------------------------------------
-- Power Up Reset Generation
--------------------------------------------------------

    -- Generate a reliable power up reset, as ERST on the Papilio doesn't do this
    -- Also, perform a power up reset if the master/beeb mode switch is changed
    reset_gen : process(clock_48)
    begin
        if rising_edge(clock_48) then
            if (reset_counter(reset_counter'high) = '0') then
                reset_counter <= reset_counter + 1;
            end if;
            powerup_reset_n <= not ERST and reset_counter(reset_counter'high);
        end if;
    end process;

   -- extend the version seen by the core to hold the 6502 reset during bootstrap
   hard_reset_n <= powerup_reset_n and not bootstrap_busy;

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
        dac_o => audioL
    );

    dac_r : entity work.pwm_sddac
    generic map (
        msbi_g => 9
    )
    port map (
        clk_i => clock_48,
        reset => '0',
        dac_i => dac_r_in,
        dac_o => audioR
    );

--------------------------------------------------------
-- Papilio Duo Misc
--------------------------------------------------------

    -- Follow convention for keeping Arduino reset
    ARDUINO_RESET <= SW1;

--------------------------------------------------------
-- BOOTSTRAP SPI FLASH to SRAM
--------------------------------------------------------

    GenBootstrap: if IncludeBootstrap generate

        user_address <= user_address_master_minimal when m128_mode = '1' and     IncludeMinimal else
                        user_address_master_full    when m128_mode = '1' and not IncludeMinimal else
                        user_address_beeb;

        user_rom_map <= user_rom_map_master_minimal when m128_mode = '1' and     IncludeMinimal else
                        user_rom_map_beeb_minimal   when m128_mode = '0' and     IncludeMinimal else
                        user_rom_map_full;

        inst_bootstrap: entity work.bootstrap
            generic map (
                user_length     => calc_user_length(IncludeMinimal)
                )
            port map(
                clock           => clock_48,
                powerup_reset_n => powerup_reset_n,
                bootstrap_busy  => bootstrap_busy,
                user_address    => user_address,
                user_rom_map    => user_rom_map,
                RAM_nOE         => RAM_nOE,
                RAM_nWE         => RAM_nWE,
                RAM_nCS         => RAM_nCS,
                RAM_A           => RAM_A,
                RAM_Din         => RAM_Din,
                RAM_Dout        => RAM_Dout,
                SRAM_nOE        => SRAM_nOE,
                SRAM_nWE        => SRAM_nWE,
                SRAM_nCS        => SRAM_nCS,
                SRAM_A          => SRAM_A,
                SRAM_D          => SRAM_D,
                FLASH_CS        => FLASH_CS,
                FLASH_SI        => FLASH_SI,
                FLASH_CK        => FLASH_CK,
                FLASH_SO        => FLASH_SO
                );

    end generate;

    NotGenBootstrap: if not IncludeBootstrap generate

        bootstrap_busy <= '0';
        SRAM_nOE       <= RAM_nOE;
        SRAM_nWE       <= RAM_nWE;
        SRAM_nCS       <= RAM_nCS;
        SRAM_A         <= "00" & RAM_A;
        SRAM_D         <= RAM_Din when RAM_nWE = '0' else (others => 'Z');

        RAM_Dout       <= ROM_D when RAM_A(18) = '0' else SRAM_D;

        FLASH_CS       <= '1';
        FLASH_SI       <= '1';
        FLASH_CK       <= '1';

        -- Minimal Model B ROM set with OS 1.20, Basic II and MMFS
        inst_rom: entity work.minimal_modelb_rom_set
            port map (
                clk => clock_48,
                addr => RAM_A(17 downto 0),
                data => ROM_D
                );

    end generate;


--------------------------------------------------------
-- External tube connections
--------------------------------------------------------

    GenCoProExt: if IncludeCoProExt generate
    begin
        ext_tube_do           <= accel_io(15 downto 8);
        accel_io(0)           <= ext_tube_phi2;
        accel_io(1)           <= ext_tube_r_nw;
        accel_io(5 downto 2)  <= ext_tube_a(3 downto 0);
        accel_io(6)           <= ext_tube_nrst;
        accel_io(7)           <= ext_tube_ntube;
        accel_io(15 downto 8) <= ext_tube_di when ext_tube_r_nw = '0' and ext_tube_phi2 = '1' else (others => 'Z');
        JOYSTICK2             <= (others => '1');
        ps2_mse_clk           <= ps2_mse_clk_o;
        ps2_mse_data          <= ps2_mse_data_o;
    end generate;

    GenRGBtoHDMI: if IncludeRGBtoHDMI generate
    begin
        -- Mappings for RGBtoHDMI 12-bit extender V1
        -- (V2 is different !!!)
                                                -- pin 7 (GND)
        accel_io(15 downto 0) <= 'Z'          &
                                 'Z'          &
                                 green_int(0) & -- pin 1
                                 red_int(0)   & -- pin 2
                                 blue_int(0)  & -- pin 3
                                 green_int(1) & -- pin 4
                                 red_int(1)   & -- pin 5
                                 blue_int(1)  & -- pin 6
                                 green_int(2) & -- pin 8
                                 red_int(2)   & -- pin 9
                                 blue_int(2)  & -- pin 10
                                 red_int(3)   & -- pin 11
                                 hsync_int    & -- pin 12
                                 green_int(3) & -- pin 13
                                 vsync_int    & -- pin 14
                                 blue_int(3);   -- pin 15
                                                -- pin 16 (VCC)

        JOYSTICK2             <= (others => '1');
        ps2_mse_clk           <= ps2_mse_clk_o;
        ps2_mse_data          <= ps2_mse_data_o;
    end generate;


    GenCoProNotExt: if not IncludeCoProExt and not IncludeRGBtoHDMI generate
    begin
        ext_tube_do  <= x"FE";
        JOYSTICK2    <= accel_io(5) & accel_io(1) & accel_io(2) & accel_io(3) & accel_io(4);
        accel_io(15 downto 14) <= (others => 'Z');
        accel_io(13) <= LED2;
        accel_io(12) <= LED1;
        accel_io(11 downto 10) <= (others => 'Z');
        accel_io(7 downto 0) <= (others => 'Z');
        -- PS/2 Mouse
        ps2_mse_clk  <= accel_io(8);
        accel_io(8)  <= '0' when ps2_mse_clk_o  = '0' else 'Z';
        ps2_mse_data <= accel_io(9);
        accel_io(9)  <= '0' when ps2_mse_data_o = '0' else 'Z';
    end generate;


end architecture;
