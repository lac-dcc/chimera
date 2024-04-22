-- BBC Micro Core, designed to be platform independant
--
-- Copyright (c) 2015-2022 David Banks
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
-- BBC Micro Core, designed to be platform independant
--
-- (c) 2015-2022 David Banks
-- (C) 2011 Mike Stirling
--
-- Master 128 TODO List
-- ACC_IFJ - direct FC00-FDFF to cartridge port
-- ACC_ITU - internal / external tube
-- INTON/INTOFF registers
-- refactor NVRAM (146818 off System VIA Port A)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity bbc_micro_core is
    generic (
        IncludeAMXMouse    : boolean := false;
        IncludeSPISD       : boolean := false;
        IncludeSID         : boolean := false;
        IncludeMusic5000   : boolean := false;
        IncludeICEDebugger : boolean := false;
        IncludeCoPro6502   : boolean := false; -- The three co pro options
        IncludeCoProSPI    : boolean := false; -- are currently mutually exclusive
        IncludeCoProExt    : boolean := false; -- (i.e. select just one)
        IncludeVideoNuLA   : boolean := false;
        IncludeHDMI        : boolean := false;
        IncludeTrace       : boolean := false;
        UseOrigKeyboard    : boolean := false;
        UseT65Core         : boolean := false;
        UseAlanDCore       : boolean := true;
        OverrideCMOS       : boolean := true   -- Overide CMOS/RTC mode settings with keyb_dip
    );
    port (
        -- Clocks
        clock_27       : in    std_logic;
        clock_32       : in    std_logic;
        clock_48       : in    std_logic;
        clock_96       : in    std_logic;
        clock_avr      : in    std_logic;

        -- Hard reset (active low)
        hard_reset_n   : in    std_logic;

        -- Keyboard
        ps2_kbd_clk    : inout std_logic;
        ps2_kbd_clk_o  : out   std_logic;
        ps2_kbd_data   : inout std_logic;
        ps2_kbd_data_o : out   std_logic;

        -- Mouse
        ps2_mse_clk    : inout std_logic;
        ps2_mse_clk_o  : out   std_logic;
        ps2_mse_data   : inout std_logic;
        ps2_mse_data_o : out   std_logic;

        -- Control input to exchange Keyboard and Mouse connections
        ps2_swap       : in    std_logic := '0';

        -- Video
        video_red      : out   std_logic_vector (3 downto 0);
        video_green    : out   std_logic_vector (3 downto 0);
        video_blue     : out   std_logic_vector (3 downto 0);
        video_vsync    : out   std_logic;
        video_hsync    : out   std_logic;

        -- Audio
        audio_l        : out   std_logic_vector (15 downto 0);
        audio_r        : out   std_logic_vector (15 downto 0);

        -- External memory (e.g. SRAM and/or FLASH)
        -- 512KB logical address space
        ext_A_stb      : out   std_logic;
        ext_nOE        : out   std_logic;
        ext_nWE        : out   std_logic;
        ext_nWE_long   : out   std_logic;
        ext_nCS        : out   std_logic;
        ext_A          : out   std_logic_vector (18 downto 0);
        ext_Dout       : in    std_logic_vector (7 downto 0);
        ext_Din        : out   std_logic_vector (7 downto 0);

        -- SD Card
        SDMISO         : in    std_logic;
        SDSS           : out   std_logic;
        SDCLK          : out   std_logic;
        SDMOSI         : out   std_logic;

        -- KeyBoard LEDs (active high)
        caps_led       : out   std_logic;
        shift_led      : out   std_logic;

        -- Keyboard DIP switches
        keyb_dip       : in    std_logic_vector(7 downto 0);

        -- Original Keyboard
        ext_keyb_led1  : out   std_logic;
        ext_keyb_led2  : out   std_logic;
        ext_keyb_led3  : out   std_logic;
        ext_keyb_1mhz  : out   std_logic;
        ext_keyb_en_n  : out   std_logic;
        ext_keyb_pa    : out   std_logic_vector(6 downto 0);
        ext_keyb_rst_n : in    std_logic;
        ext_keyb_ca2   : in    std_logic;
        ext_keyb_pa7   : in    std_logic;


        -- Config outputs (from PS/2 keyboard)
        config         : out   std_logic_vector(9 downto 0);

        -- Format of Video
        -- Bit 1,0 select the video format
        --   00 - 15.625KHz SRGB
        --   01 - 31.250KHz VGA using the RGB2VGA Scan Doubler
        --   10 - 31.250KHz VGA using the Mist Scan Doubler
        --   11 - 31.250KHz VGA using the Mist Scan Doubler (Modes 0..6) and SAA5050 VGA (Mode 7)
        -- Bit 2 inverts hsync
        -- Bit 3 inverts vsync
        vid_mode       : in    std_logic_vector(3 downto 0);


        -- Main Joystick and Secondary Joystick
        -- Bit 0 - Up (active low)
        -- Bit 1 - Down (active low)
        -- Bit 2 - Left (active low)
        -- Bit 3 - Right (active low)
        -- Bit 4 - Fire (active low)
        joystick1      : in    std_logic_vector(4 downto 0);
        joystick2      : in    std_logic_vector(4 downto 0);

        -- ICE T65 Deubgger 57600 baud serial
        avr_reset      : in    std_logic;   -- active high
        avr_RxD        : in    std_logic;
        avr_TxD        : out   std_logic;

        -- Current CPU address, e.g. to drive a hex display
        cpu_addr       : out   std_logic_vector(15 downto 0);

        -- Master Mode
        m128_mode      : in    std_logic;

        -- Copro
        copro_mode     : in    std_logic;        -- Runtime enable for both internal/external Co Processors
        copro_ext      : in    std_logic := '0'; -- Model B, indicates external Co Pro has priority if both enabled

        -- Co Pro SPI - slave interface
        p_spi_ssel     : in    std_logic;
        p_spi_sck      : in    std_logic;
        p_spi_mosi     : in    std_logic;
        p_spi_miso     : out   std_logic;

        -- Co Pro SPI - interrupts/control
        p_irq_b        : out   std_logic;
        p_nmi_b        : out   std_logic;
        p_rst_b        : out   std_logic;

        -- External tube outputs, for connecting to PiTubeDirect
        ext_tube_r_nw  : out   std_logic;
        ext_tube_nrst  : out   std_logic;
        ext_tube_ntube : out   std_logic;
        ext_tube_phi2  : out   std_logic;
        ext_tube_a     : out   std_logic_vector(6 downto 0);
        ext_tube_di    : out   std_logic_vector(7 downto 0);
        ext_tube_do    : in    std_logic_vector(7 downto 0) := x"FE";

        -- 6502 tracing outputs
        trace_data     : out   std_logic_vector(7 downto 0);
        trace_r_nw     : out   std_logic;
        trace_sync     : out   std_logic;
        trace_rstn     : out   std_logic;
        trace_phi2     : out   std_logic;

        -- HDMI Video
        hdmi_aspect    : in    std_logic_vector(1 downto 0) := "00";
        hdmi_audio_en  : in    std_logic := '0';
        vid_debug      : in    std_logic := '0';
        tmds_r         : out   std_logic_vector(9 downto 0);
        tmds_g         : out   std_logic_vector(9 downto 0);
        tmds_b         : out   std_logic_vector(9 downto 0);

        -- Test outputs
        test           : out   std_logic_vector(7 downto 0)

    );
end entity;

architecture rtl of bbc_micro_core is

component MOS6502CpuMonCore is
    generic (
       UseT65Core        : boolean;
       UseAlanDCore      : boolean;
       -- default sizing is used by Electron/Beeb Fpga
       num_comparators   : integer := 8;
       avr_prog_mem_size : integer := 1024 * 8
    );
    port (
        clock_avr       : in    std_logic;

        busmon_clk      : in    std_logic;
        busmon_clken    : in    std_logic;
        cpu_clk         : in    std_logic;
        cpu_clken       : in    std_logic;

        -- 6502 Signals
        IRQ_n           : in    std_logic;
        NMI_n           : in    std_logic;
        Sync            : out   std_logic;
        Addr            : out   std_logic_vector(15 downto 0);
        R_W_n           : out   std_logic;
        Din             : in    std_logic_vector(7 downto 0);
        Dout            : out   std_logic_vector(7 downto 0);
        SO_n            : in    std_logic;
        Res_n           : in    std_logic;
        Rdy             : in    std_logic;

        -- External trigger inputs
        trig            : in    std_logic_vector(1 downto 0);

        -- Serial Console
        avr_RxD         : in     std_logic;
        avr_TxD         : out    std_logic;

        -- Switches
        sw_reset_cpu    : in    std_logic;
        sw_reset_avr    : in    std_logic;

        -- LEDs
        led_bkpt        : out   std_logic;
        led_trig0       : out   std_logic;
        led_trig1       : out   std_logic;

        -- OHO_DY1 connected to test connector
        tmosi           : out   std_logic;
        tdin            : out   std_logic;
        tcclk           : out   std_logic;

        -- Test connector signals
        test            : inout std_logic_vector(3 downto 0)
    );
end component;

component CoPro6502 is
    port (

        -- Host
        h_clk        : in    std_logic;
        h_cs_b       : in    std_logic;
        h_rdnw       : in    std_logic;
        h_addr       : in    std_logic_vector(2 downto 0);
        h_data_in    : in    std_logic_vector(7 downto 0);
        h_data_out   : out   std_logic_vector(7 downto 0);
        h_rst_b      : in    std_logic;
        h_irq_b      : out    std_logic;

        -- Parasite Clock (32 MHz)
        clk_cpu      : in    std_logic;
        cpu_clken    : in    std_logic;

        -- External RAM
        ram_addr     : out  std_logic_vector(15 downto 0);
        ram_data_in  : out  std_logic_vector(7 downto 0);
        ram_data_out : in   std_logic_vector(7 downto 0);
        ram_wr       : out  std_logic;

        -- Test signals for debugging
        test         : out    std_logic_vector(7 downto 0)
    );
end component;

component CoProSPI is
    port (

        -- Host
        h_clk        : in  std_logic;
        h_cs_b       : in  std_logic;
        h_rdnw       : in  std_logic;
        h_addr       : in  std_logic_vector(2 downto 0);
        h_data_in    : in  std_logic_vector(7 downto 0);
        h_data_out   : out std_logic_vector(7 downto 0);
        h_rst_b      : in  std_logic;
        h_irq_b      : out  std_logic;

        -- Parasite Clock (32 MHz)
        p_clk        : in  std_logic;

        -- SPI Slave
        p_spi_ssel   : in  std_logic;
        p_spi_sck    : in  std_logic;
        p_spi_mosi   : in  std_logic;
        p_spi_miso   : out std_logic;

        -- Interrupts/Control
        p_irq_b      : out std_logic;
        p_nmi_b      : out std_logic;
        p_rst_b      : out std_logic;

        -- Test signals for debugging
        test         : out std_logic_vector(7 downto 0)
    );
end component;

component Music5000 is
    generic (
        sumwidth : integer := 20;
        dacwidth : integer := 16;
        id       : std_logic_vector(3 downto 0) := "0011"
    );
    port (
        -- This is the cpu clock
        clk      : in     std_logic;
        clken    : in     std_logic;
        -- This is the 6MHz audio clock
        clk6     : in     std_logic;
        clk6en   : in     std_logic;
        rnw      : in     std_logic;
        rst_n    : in     std_logic;
        pgfc_n   : in     std_logic;
        pgfd_n   : in     std_logic;
        a        : in     std_logic_vector (7 downto 0);
        din      : in     std_logic_vector (7 downto 0);
        dout     : out    std_logic_vector (7 downto 0);
        dout_oel : out    std_logic;
        audio_l  : out    std_logic_vector (dacwidth - 1 downto 0);
        audio_r  : out    std_logic_vector (dacwidth - 1 downto 0);
        cycle    : out    std_logic_vector (6 downto 0);
        test     : out    std_logic
    );
end component;


-- Use 4-bit RGB when VideoNuLA is included, other 1-bit RGB
function calc_rgb_width(includeVideoNuLA : boolean) return integer is
begin
    if includeVideoNuLA then
        return 4;
    else
        return 1;
    end if;
end function;

constant RGB_WIDTH : integer := calc_rgb_width(IncludeVideoNuLA);

-------------
-- Signals
-------------

signal reset            :   std_logic;
signal reset_n          :   std_logic;

-- Clock enables for the scan doubler
signal clken_pixel      :   std_logic;
signal clken_vga        :   std_logic;

-- Counter to divide 96MHz down to 32MHz or 24MHz
signal vga3_counter     :   unsigned(1 downto 0) := (others => '0');

-- Counter to divide 48MHz down to 16MHz and 8MHz
signal div3_counter     :   unsigned(1 downto 0) := (others => '0');

-- Counter to divide 48MHz down to 12MHz and 6MHz
signal div8_counter     :   unsigned(2 downto 0) := (others => '0');

-- Clock enable counter
-- CPU and video cycles are interleaved.  The CPU runs at 2 MHz (every 16th
-- cycle) and the video subsystem is enabled on every odd cycle.
signal clken_counter    :   unsigned(3 downto 0) := (others => '0');
signal cpu_cycle_mask   :   std_logic_vector(1 downto 0) := (others => '0'); -- Set to mask CPU cycles until 1 MHz cycle is complete
signal cpu_clken        :   std_logic; -- 2 MHz cycles in which the CPU is enabled
signal cpu_clken1       :   std_logic; -- delayed one cycle for BusMonitor

-- IO cycles are out of phase with the CPU
signal mhz16_clken      :   std_logic; -- 16 MHz, used by the Video ULA
signal ttxt_clken       :   std_logic := '0'; -- 12 MHz used by SAA 5050 (24MHz in VGA mode)
signal mhz6_clken       :   std_logic; -- 6 MHz used by Music 5000
signal mhz4_clken       :   std_logic; -- Used by 6522
signal mhz1_clken       :   std_logic; -- 1 MHz bus and associated peripherals, 6522 phase 2

-- Control signals to indicate memory cycles
signal vid_mem_cycle    :   std_logic;
signal cpu_mem_cycle    :   std_logic;
signal tube_mem_cycle   :   std_logic;
signal mem_write_strobe :   std_logic;

-- Latches for read data at the end of the memory cycle
signal vid_mem_data    :   std_logic_vector(7 downto 0);
signal cpu_mem_data    :   std_logic_vector(7 downto 0);
signal tube_mem_data   :   std_logic_vector(7 downto 0);

-- CPU signals
signal cpu_mode         :   std_logic_vector(1 downto 0);
signal cpu_ready        :   std_logic;
signal cpu_abort_n      :   std_logic;
signal cpu_irq_n        :   std_logic;
signal cpu_nmi_n        :   std_logic;
signal cpu_so_n         :   std_logic;
signal cpu_r_nw         :   std_logic;
signal cpu_nr_w         :   std_logic;
signal cpu_sync         :   std_logic;
signal cpu_ef           :   std_logic;
signal cpu_mf           :   std_logic;
signal cpu_xf           :   std_logic;
signal cpu_ml_n         :   std_logic;
signal cpu_vp_n         :   std_logic;
signal cpu_vda          :   std_logic;
signal cpu_vpa          :   std_logic;
signal cpu_a            :   std_logic_vector(23 downto 0);
signal cpu_di           :   std_logic_vector(7 downto 0);
signal cpu_do           :   std_logic_vector(7 downto 0);
signal cpu_addr_us      :   unsigned (15 downto 0);
signal cpu_dout_us      :   unsigned (7 downto 0);

-- CRTC signals
signal crtc_clken       :   std_logic;
signal crtc_do          :   std_logic_vector(7 downto 0);
signal crtc_vsync       :   std_logic;
signal crtc_vsync_n     :   std_logic;
signal crtc_hsync       :   std_logic;
signal crtc_hsync_n     :   std_logic;
signal crtc_de          :   std_logic;
signal crtc_cursor      :   std_logic;
signal crtc_lpstb       :   std_logic;
signal crtc_ma          :   std_logic_vector(13 downto 0);
signal crtc_ra          :   std_logic_vector(4 downto 0);
signal crtc_test        :   std_logic_vector(3 downto 0);

-- Decoded display address after address translation for hardware
-- scrolling
signal display_a        :   std_logic_vector(14 downto 0);

-- "VIDPROC" signals
signal vidproc_invert_n :   std_logic;
signal vidproc_disen    :   std_logic;
signal r_in             :   std_logic;
signal g_in             :   std_logic;
signal b_in             :   std_logic;
signal r_out            :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal g_out            :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal b_out            :   std_logic_vector(RGB_WIDTH - 1 downto 0);

-- Scan Doubler signals (Mist)
signal rgbi_in          :   std_logic_vector(RGB_WIDTH * 3 downto 0);
signal vga0_r           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga0_g           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga0_b           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga0_hs          :   std_logic;
signal vga0_vs          :   std_logic;
-- Scan Doubler signals (RGB2VGA)
signal vga1_r           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga1_g           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga1_b           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga1_hs          :   std_logic;
signal vga1_vs          :   std_logic;
-- Scan Retimer (24MHz to 27MHz) signals
signal vga2_r           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga2_g           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga2_b           :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal vga2_hs          :   std_logic;
signal vga2_vs          :   std_logic;

signal vga_mode         :   std_logic; -- Runs the SAA5050 at 24Mhz
signal vga0_mode        :   std_logic; -- Use the Mist Scan Doubler
signal vga1_mode        :   std_logic; -- Use the RGB2VGA Scan Doubler
signal vga2_mode        :   std_logic; -- Use the 24MHz to 27MHz Retimer

signal rgbi_out         :   std_logic_vector(RGB_WIDTH * 3 downto 0);
signal vsync_int        :   std_logic;
signal hsync_int        :   std_logic;

signal final_r          :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal final_g          :   std_logic_vector(RGB_WIDTH - 1 downto 0);
signal final_b          :   std_logic_vector(RGB_WIDTH - 1 downto 0);

-- HDMI signals
signal hsync1           :   std_logic;
signal vsync1           :   std_logic;
signal hcnt             :   std_logic_vector(9 downto 0);
signal vcnt             :   std_logic_vector(9 downto 0);
signal hdmi_aspect_169  :   std_logic;
signal hdmi_red         :   std_logic_vector(3 downto 0);
signal hdmi_green       :   std_logic_vector(3 downto 0);
signal hdmi_blue        :   std_logic_vector(3 downto 0);
signal hdmi_hsync       :   std_logic;
signal hdmi_vsync       :   std_logic;
signal hdmi_blank       :   std_logic;
signal audio_l_int      :   std_logic_vector (15 downto 0);
signal audio_r_int      :   std_logic_vector (15 downto 0);

-- SAA5050 signals
signal ttxt_data        :   std_logic_vector(6 downto 0);
signal ttxt_vdu         :   std_logic;
signal ttxt_glr         :   std_logic;
signal ttxt_dew         :   std_logic;
signal ttxt_crs         :   std_logic;
signal ttxt_lose        :   std_logic;
signal ttxt_r           :   std_logic;
signal ttxt_g           :   std_logic;
signal ttxt_b           :   std_logic;
signal ttxt_y           :   std_logic;
signal ttxt_active      :   std_logic;
signal ttxt_ic15_clken  :   std_logic;
signal ttxt_di_clken    :   std_logic;
signal mhz12_active     :   std_logic;

-- System VIA signals
signal sys_via_do       :   std_logic_vector(7 downto 0);
signal sys_via_do_oe_n  :   std_logic;
signal sys_via_irq_n    :   std_logic;
signal sys_via_ca1_in   :   std_logic := '0';
signal sys_via_ca2_in   :   std_logic := '0';
signal sys_via_ca2_out  :   std_logic;
signal sys_via_ca2_oe_n :   std_logic;
signal sys_via_pa_in    :   std_logic_vector(7 downto 0);
signal sys_via_pa_out   :   std_logic_vector(7 downto 0);
signal sys_via_pa_oe_n  :   std_logic_vector(7 downto 0);
signal sys_via_cb1_in   :   std_logic := '0';
signal sys_via_cb1_out  :   std_logic;
signal sys_via_cb1_oe_n :   std_logic;
signal sys_via_cb2_in   :   std_logic := '0';
signal sys_via_cb2_out  :   std_logic;
signal sys_via_cb2_oe_n :   std_logic;
signal sys_via_pb_in    :   std_logic_vector(7 downto 0);
signal sys_via_pb_out   :   std_logic_vector(7 downto 0);
signal sys_via_pb_oe_n  :   std_logic_vector(7 downto 0);
signal sys_via_do_r     :   std_logic_vector (7 downto 0);

-- User VIA signals
signal user_via_do      :   std_logic_vector(7 downto 0);
signal user_via_do_oe_n :   std_logic;
signal user_via_irq_n   :   std_logic;
signal user_via_ca1_in  :   std_logic;
signal user_via_ca2_in  :   std_logic;
signal user_via_ca2_out :   std_logic;
signal user_via_ca2_oe_n:   std_logic;
signal user_via_pa_in   :   std_logic_vector(7 downto 0);
signal user_via_pa_out  :   std_logic_vector(7 downto 0);
signal user_via_pa_oe_n :   std_logic_vector(7 downto 0);
signal user_via_cb1_in  :   std_logic;
signal user_via_cb1_out :   std_logic;
signal user_via_cb1_oe_n:   std_logic;
signal user_via_cb2_in  :   std_logic;
signal user_via_cb2_out :   std_logic;
signal user_via_cb2_oe_n:   std_logic;
signal user_via_pb_in   :   std_logic_vector(7 downto 0);
signal user_via_pb_out  :   std_logic_vector(7 downto 0);
signal user_via_pb_oe_n :   std_logic_vector(7 downto 0);
signal user_via_do_r    :   std_logic_vector (7 downto 0);

-- Mouse signals
signal mouse_read        :   std_logic;
signal mouse_err         :   std_logic;
signal mouse_rx_data     :   std_logic_vector(7 downto 0);
signal mouse_write       :   std_logic;
signal mouse_tx_data     :   std_logic_vector(7 downto 0);

-- SPI SD Card
signal spisd_do         :   std_logic_vector(7 downto 0);

-- IC32 latch on System VIA
signal ic32             :   std_logic_vector(7 downto 0);
signal sound_enable_n   :   std_logic;
--signal speech_read_n    :   std_logic;
--signal speech_write_n   :   std_logic;
signal keyb_enable_n    :   std_logic;
signal disp_addr_offs   :   std_logic_vector(1 downto 0);

-- Keyboard
signal keyb_column      :   std_logic_vector(3 downto 0);
signal keyb_row         :   std_logic_vector(2 downto 0);
signal keyb_out         :   std_logic;
signal keyb_int         :   std_logic;
signal keyb_break       :   std_logic;
signal ps2_keyb_out     :   std_logic;
signal ps2_keyb_int     :   std_logic;
signal ps2_keyb_break   :   std_logic;

-- Interface between PS/2 decoder and Keyboard Controller
signal ps2_keyb_cmd     :   std_logic_vector(7 downto 0);
signal ps2_keyb_data    :   std_logic_vector(7 downto 0);
signal ps2_keyb_valid   :   std_logic;
signal ps2_keyb_error   :   std_logic;
signal ps2_keyb_busy    :   std_logic;
signal ps2_keyb_write   :   std_logic;

-- Seperate (i.e. non open collector) keyboard and mouse signals
signal ps2_kbd_clk_in   :   std_logic;
signal ps2_kbd_clk_out  :   std_logic;
signal ps2_kbd_data_in  :   std_logic;
signal ps2_kbd_data_out :   std_logic;
signal ps2_mse_clk_in   :   std_logic;
signal ps2_mse_clk_out  :   std_logic;
signal ps2_mse_data_in  :   std_logic;
signal ps2_mse_data_out :   std_logic;

-- Sound generator
signal sound_di         :   std_logic_vector(7 downto 0);
signal sound_ao         :   std_logic_vector(7 downto 0);

-- Optional SID
signal sid_ao           :   std_logic_vector(17 downto 0);
signal sid_do           :   std_logic_vector(7 downto 0);
signal sid_enable       :   std_logic;

-- Optional Music5000
signal music5000_ao_l   :   std_logic_vector(15 downto 0);
signal music5000_ao_r   :   std_logic_vector(15 downto 0);
signal music5000_do     :   std_logic_vector(7 downto 0);

-- Optional Tube
signal tube_do          :   std_logic_vector(7 downto 0);
signal tube_clken       :   std_logic;
signal tube_clken1      :   std_logic := '0';
signal tube_ram_wr      :   std_logic;
signal tube_ram_addr    :   std_logic_vector(15 downto 0);
signal tube_ram_data_in :   std_logic_vector(7 downto 0);
signal ext_tube_clk     :   std_logic;

-- Memory enables
signal ram_enable       :   std_logic;      -- 0x0000
signal rom_enable       :   std_logic;      -- 0x8000 (BASIC/sideways ROMs)
signal mos_enable       :   std_logic;      -- 0xC000

-- IO region enables
signal io_fred          :   std_logic;      -- 0xFC00 (1 MHz bus)
signal io_fred_n        :   std_logic;      -- 0xFC00 (1 MHz bus)
signal io_jim           :   std_logic;      -- 0xFD00 (1 MHz bus)
signal io_jim_n         :   std_logic;      -- 0xFD00 (1 MHz bus)
signal io_sheila        :   std_logic;      -- 0xFE00 (System peripherals)
signal io_sheila_n      :   std_logic;      -- 0xFE00 (System peripherals)

-- SHIELA
signal crtc_enable      :   std_logic;      -- 0xFE00-FE07
signal acia_enable      :   std_logic;      -- 0xFE08-FE0F
signal serproc_enable   :   std_logic;      -- 0xFE10-FE1F
signal vidproc_enable   :   std_logic;      -- 0xFE20-FE2F
signal romsel_enable    :   std_logic;      -- 0xFE30-FE3F
signal sys_via_enable   :   std_logic;      -- 0xFE40-FE5F
signal user_via_enable  :   std_logic;      -- 0xFE60-FE7F, or FE80-FE9F
--signal adlc_enable      :   std_logic;      -- 0xFEA0-FEBF (Econet)
signal spisd_enable     :   std_logic;      -- 0xFEDC (Master) / 0xFE1C (Model B)
signal int_tube_enable  :   std_logic;      -- 0xFEE0-FEFF
signal ext_tube_enable  :   std_logic;      -- 0xFEE0-FEFF

signal adc_enable       :   std_logic;      -- 0xFEC0-FEDF
signal adc_eoc_n        :   std_logic;
signal adc_do           :   std_logic_vector(7 downto 0);
signal adc_ch0          :   std_logic_vector(11 downto 0);
signal adc_ch1          :   std_logic_vector(11 downto 0);
signal adc_ch2          :   std_logic_vector(11 downto 0);
signal adc_ch3          :   std_logic_vector(11 downto 0);

-- ROM select latch
signal romsel           :   std_logic_vector(7 downto 0);

signal mhz1_enable      :   std_logic;      -- Set for access to any 1 MHz peripheral

-- Master Real Time Clock / CMOS RAM
signal rtc_adi         : std_logic_vector(7 downto 0);
signal rtc_do          : std_logic_vector(7 downto 0);
signal rtc_ce          : std_logic;
signal rtc_r_nw        : std_logic;
signal rtc_as          : std_logic;
signal rtc_ds          : std_logic;

-- 0xFE34 Access Control
signal acccon          : std_logic_vector(7 downto 0);
signal acc_irr         : std_logic;
signal acc_tst         : std_logic;
signal acc_ifj         : std_logic;
signal acc_itu         : std_logic;
signal acc_y           : std_logic;
signal acc_x           : std_logic;
signal acc_e           : std_logic;
signal acc_d           : std_logic;

signal acccon_enable   : std_logic;     -- 0xFE34-0xFE37
signal intoff_enable   : std_logic;     -- 0xFE38-0xFE3B
signal inton_enable    : std_logic;     -- 0xFE3C-0xFE3F

signal vdu_op          : std_logic;     -- last opcode was 0xC000-0xDFFF

begin

    -------------------------
    -- COMPONENT INSTANCES
    -------------------------

    GenDebug: if IncludeICEDebugger generate

        core : MOS6502CpuMonCore
            generic map (
                UseT65Core   => UseT65Core,
                UseAlanDCore => UseAlanDCore
                )
            port map (
                clock_avr    => clock_avr,
                busmon_clk   => clock_48,
                busmon_clken => cpu_clken1,
                cpu_clk      => clock_48,
                cpu_clken    => cpu_clken,
                IRQ_n        => cpu_irq_n,
                NMI_n        => cpu_nmi_n,
                Sync         => cpu_sync,
                Addr         => cpu_a(15 downto 0),
                R_W_n        => cpu_r_nw,
                Din          => cpu_di,
                Dout         => cpu_do,
                SO_n         => cpu_so_n,
                Res_n        => reset_n,
                Rdy          => cpu_ready,
                trig         => "00",
                avr_RxD      => avr_RxD,
                avr_TxD      => avr_TxD,
                sw_reset_cpu => '0',
                sw_reset_avr => avr_reset,
                led_bkpt     => open,
                led_trig0    => open,
                led_trig1    => open,
                tmosi        => open,
                tdin         => open,
                tcclk        => open
                );

        process(clock_48)
        begin
            if rising_edge(clock_48) then
                cpu_clken1 <= cpu_clken;
            end if;
        end process;

    end generate;

    GenT65Core: if UseT65Core and not IncludeICEDebugger generate
        core : entity work.T65
        port map (
            Mode    => cpu_mode,
            Res_n   => reset_n,
            Enable  => cpu_clken,
            Clk     => clock_48,
            Rdy     => cpu_ready,
            Abort_n => cpu_abort_n,
            IRQ_n   => cpu_irq_n,
            NMI_n   => cpu_nmi_n,
            SO_n    => cpu_so_n,
            R_W_n   => cpu_r_nw,
            Sync    => cpu_sync,
            EF      => cpu_ef,
            MF      => cpu_mf,
            XF      => cpu_xf,
            ML_n    => cpu_ml_n,
            VP_n    => cpu_vp_n,
            VDA     => cpu_vda,
            VPA     => cpu_vpa,
            A       => cpu_a,
            DI      => cpu_di,
            DO      => cpu_do
        );
        avr_TxD <= avr_RxD;
    end generate;

    GenAlanDCore: if UseAlanDCore and not IncludeICEDebugger generate
        core : entity work.r65c02
        port map (
            reset    => reset_n,
            clk      => clock_48,
            enable   => cpu_clken,
            nmi_n    => cpu_nmi_n,
            irq_n    => cpu_irq_n,
            di       => unsigned(cpu_di),
            do       => cpu_dout_us,
            addr     => cpu_addr_us,
            nwe      => cpu_r_nw,
            sync     => cpu_sync,
            sync_irq => open,
            Regs     => open
        );
        cpu_do <= std_logic_vector(cpu_dout_us);
        cpu_a(15 downto 0) <= std_logic_vector(cpu_addr_us);
        cpu_a(23 downto 16) <= (others => '0');
        avr_TxD <= avr_RxD;
    end generate;

    crtc : entity work.mc6845
        port map (
            CLOCK     => clock_48,
            CLKEN     => crtc_clken,
            CLKEN_CPU => cpu_clken,
            nRESET    => hard_reset_n,
            ENABLE    => crtc_enable,
            R_nW      => cpu_r_nw,
            RS        => cpu_a(0),
            DI        => cpu_do,
            DO        => crtc_do,
            VSYNC     => crtc_vsync,
            HSYNC     => crtc_hsync,
            DE        => crtc_de,
            CURSOR    => crtc_cursor,
            LPSTB     => crtc_lpstb,
            VGA       => vga_mode,
            MA        => crtc_ma,
            RA        => crtc_ra,
            test      => crtc_test
        );

    vidproc_nula: if IncludeVideoNuLA generate
    begin
        videoula : entity work.vidproc
            port map (
                CLOCK           => clock_48,
                CPUCLKEN        => cpu_clken,
                CLKEN           => mhz16_clken,
                PIXCLK          => clock_48,
                nRESET          => hard_reset_n,
                CLKEN_CRTC      => crtc_clken,
                CLKEN_COUNT     => clken_counter,
                TTXT            => ttxt_active,
                MHZ12           => mhz12_active,
                VGA             => vga_mode,
                ENABLE          => vidproc_enable,
                A               => cpu_a(1 downto 0),
                DI_CPU          => cpu_do,
                DI_RAM          => vid_mem_data,
                nINVERT         => vidproc_invert_n,
                DISEN           => vidproc_disen,
                CURSOR          => crtc_cursor,
                R_IN            => r_in,
                G_IN            => g_in,
                B_IN            => b_in,
                R               => r_out,
                G               => g_out,
                B               => b_out
            );
    end generate;

    vidproc_orig: if not IncludeVideoNuLA generate
    begin
        videoula_orig : entity work.vidproc_orig
            port map (
                CLOCK           => clock_48,
                CPUCLKEN        => cpu_clken,
                CLKEN           => mhz16_clken,
                nRESET          => hard_reset_n,
                CLKEN_CRTC      => crtc_clken,
                CLKEN_COUNT     => clken_counter,
                TTXT            => ttxt_active,
                VGA             => vga_mode,
                ENABLE          => vidproc_enable,
                A0              => cpu_a(0),
                DI_CPU          => cpu_do,
                DI_RAM          => vid_mem_data,
                nINVERT         => vidproc_invert_n,
                DISEN           => vidproc_disen,
                CURSOR          => crtc_cursor,
                R_IN            => r_in,
                G_IN            => g_in,
                B_IN            => b_in,
                R               => r_out,
                G               => g_out,
                B               => b_out
            );
        mhz12_active <= ttxt_active;
    end generate;

    teletext : entity work.saa5050
        port map (
            CLOCK    => clock_48, -- This runs at 12 MHz, which we can't derive from the 32 MHz clock
            CLKEN    => ttxt_clken,
            nRESET   => hard_reset_n,
            VGA      => vga_mode,
            DI_CLOCK => clock_48, -- Data input is synchronised from the bus clock domain
            DI_CLKEN => ttxt_di_clken,
            DI       => ttxt_data,
            GLR      => ttxt_glr,
            DEW      => ttxt_dew,
            CRS      => ttxt_crs,
            LOSE     => ttxt_lose,
            R        => ttxt_r,
            G        => ttxt_g,
            B        => ttxt_b,
            Y        => ttxt_y
        );

    -- System VIA
    system_via : entity work.m6522
        port map (
            I_RS        => cpu_a(3 downto 0),
            I_DATA      => cpu_do,
            O_DATA      => sys_via_do,
            O_DATA_OE_L => sys_via_do_oe_n,
            I_RW_L      => cpu_r_nw,
            I_CS1       => sys_via_enable,
            I_CS2_L     => '0', -- nCS2
            O_IRQ_L     => sys_via_irq_n,
            I_CA1       => sys_via_ca1_in,
            I_CA2       => sys_via_ca2_in,
            O_CA2       => sys_via_ca2_out,
            O_CA2_OE_L  => sys_via_ca2_oe_n,
            I_PA        => sys_via_pa_in,
            O_PA        => sys_via_pa_out,
            O_PA_OE_L   => sys_via_pa_oe_n,
            I_CB1       => sys_via_cb1_in,
            O_CB1       => sys_via_cb1_out,
            O_CB1_OE_L  => sys_via_cb1_oe_n,
            I_CB2       => sys_via_cb2_in,
            O_CB2       => sys_via_cb2_out,
            O_CB2_OE_L  => sys_via_cb2_oe_n,
            I_PB        => sys_via_pb_in,
            O_PB        => sys_via_pb_out,
            O_PB_OE_L   => sys_via_pb_oe_n,
            I_P2_H      => mhz1_clken,
            RESET_L     => hard_reset_n, -- System VIA is reset by power on reset only
            ENA_4       => mhz4_clken,
            CLK         => clock_48
        );

    -- User VIA
    user_via : entity work.m6522
        port map (
            I_RS        => cpu_a(3 downto 0),
            I_DATA      => cpu_do,
            O_DATA      => user_via_do,
            O_DATA_OE_L => user_via_do_oe_n,
            I_RW_L      => cpu_r_nw,
            I_CS1       => user_via_enable,
            I_CS2_L     => '0', -- nCS2
            O_IRQ_L     => user_via_irq_n,
            I_CA1       => user_via_ca1_in,
            I_CA2       => user_via_ca2_in,
            O_CA2       => user_via_ca2_out,
            O_CA2_OE_L  => user_via_ca2_oe_n,
            I_PA        => user_via_pa_in,
            O_PA        => user_via_pa_out,
            O_PA_OE_L   => user_via_pa_oe_n,
            I_CB1       => user_via_cb1_in,
            O_CB1       => user_via_cb1_out,
            O_CB1_OE_L  => user_via_cb1_oe_n,
            I_CB2       => user_via_cb2_in,
            O_CB2       => user_via_cb2_out,
            O_CB2_OE_L  => user_via_cb2_oe_n,
            I_PB        => user_via_pb_in,
            O_PB        => user_via_pb_out,
            O_PB_OE_L   => user_via_pb_oe_n,
            I_P2_H      => mhz1_clken,
            RESET_L     => hard_reset_n,
            ENA_4       => mhz4_clken,
            CLK         => clock_48
        );

    -- Optional AMXMouse, connected to the user via FE60
    GenMouse: if IncludeAMXMouse generate
        mouse_ps2interface: entity work.ps2interface
        generic map(
            MainClockSpeed => 48000000
        )
        port map(
           ps2_clk      => ps2_mse_clk_in,
           ps2_clk_out  => ps2_mse_clk_out,
           ps2_data     => ps2_mse_data_in,
           ps2_data_out => ps2_mse_data_out,
           clk          => clock_48,
           rst          => reset,
           tx_data      => mouse_tx_data,
           write        => mouse_write,
           rx_data      => mouse_rx_data,
           read         => mouse_read,
           busy         => open,
           err          => mouse_err
        );
        -- BBC Micro User Port (Mouse use)
        --  2 - CB1 - X Axis
        --  6 - D0  - X Dir
        --  4 - CB2 - Y Axis
        -- 10 - D2  - Y Dir
        -- 16 - D5  - Left button
        -- 18 - D6  - Middle button
        -- 20 - D7  - Right button
        mouse_controller: entity work.quadrature_controller port map(
           clk      => clock_48,
           rst      => reset,
           read     => mouse_read,
           err      => mouse_err,
           rx_data  => mouse_rx_data,
           write    => mouse_write,
           tx_data  => mouse_tx_data,
           x_a      => user_via_pb_in(0),
           x_b      => user_via_cb1_in,
           y_a      => user_via_pb_in(2),
           y_b      => user_via_cb2_in,
           left     => user_via_pb_in(5),
           middle   => user_via_pb_in(6),
           right    => user_via_pb_in(7)
        );
    end generate;
    GenNotMouse: if not IncludeAMXMouse generate
        ps2_mse_clk_out   <= '1';
        ps2_mse_data_out  <= '1';
        user_via_pb_in(0) <= '1';
        user_via_cb1_in   <= '1';
        user_via_cb2_in   <= '1';
        user_via_pb_in(2) <= '1';
        user_via_pb_in(5) <= '1';
        user_via_pb_in(6) <= '1';
        user_via_pb_in(7) <= '1';
    end generate;

    -- Unused User VIA Port B Inputs
    user_via_pb_in(1) <= '1';
    user_via_pb_in(3) <= '1';
    user_via_pb_in(4) <= '1';

    -- Unused User VIA Port A Inputs
    user_via_ca1_in   <= '1';
    user_via_ca2_in   <= '1';
    user_via_pa_in    <= (others => '1');

    -- Original Keyboard Enabled
    keyboard_orig: if UseOrigKeyboard generate
        ext_keyb_led3  <= '1';     -- motor LED would be driven off serial ULA
        ext_keyb_led2  <= ic32(7); -- caps LED
        ext_keyb_led1  <= ic32(6); -- shift LED
        ext_keyb_1mhz  <= mhz1_clken;
        ext_keyb_en_n  <= keyb_enable_n;
        ext_keyb_pa    <= keyb_row & keyb_column;
        keyb_out       <= ext_keyb_pa7 or ps2_keyb_out;
        keyb_int       <= ext_keyb_ca2 or ps2_keyb_int;
        keyb_break     <= (not ext_keyb_rst_n) or ps2_keyb_break;
    end generate;

    -- Original Keyboard Disabled
    keyboard_ps2: if not UseOrigKeyboard generate
        ext_keyb_led3  <= '1'; -- motor LED
        ext_keyb_led2  <= '1'; -- caps LED
        ext_keyb_led1  <= '1'; -- shift LED
        ext_keyb_1mhz  <= '1';
        ext_keyb_en_n  <= '1';
        ext_keyb_pa    <= (others => '1');
        keyb_out       <= ps2_keyb_out;
        keyb_int       <= ps2_keyb_int;
        keyb_break     <= ps2_keyb_break;
    end generate;

    -- PS/2 Keyboard Interface
    keyboard_ps2interface : entity work.ps2interface
        generic map(
            MainClockSpeed => 48000000
        )
        port map(
           ps2_clk      => ps2_kbd_clk_in,
           ps2_clk_out  => ps2_kbd_clk_out,
           ps2_data     => ps2_kbd_data_in,
           ps2_data_out => ps2_kbd_data_out,
           clk          => clock_48,
           rst          => not hard_reset_n,
           tx_data      => ps2_keyb_cmd,
           write        => ps2_keyb_write,
           rx_data      => ps2_keyb_data,
           read         => ps2_keyb_valid,
           busy         => ps2_keyb_busy,
           err          => ps2_keyb_error
        );

    -- PS/2 Keyboard Controller
    keyboard_controller : entity work.keyboard
        port map (
            CLOCK      => clock_48,
            nRESET     => hard_reset_n,
            CLKEN_1MHZ => mhz1_clken,
            KEYB_CMD   => ps2_keyb_cmd,
            KEYB_WRITE => ps2_keyb_write,
            KEYB_DATA  => ps2_keyb_data,
            KEYB_VALID => ps2_keyb_valid,
            KEYB_ERROR => ps2_keyb_error,
            KEYB_BUSY  => ps2_keyb_busy,
            AUTOSCAN   => keyb_enable_n,
            COLUMN     => keyb_column,
            ROW        => keyb_row,
            KEYPRESS   => ps2_keyb_out,
            INT        => ps2_keyb_int,
            BREAK_OUT  => ps2_keyb_break,
            DIP_SWITCH => keyb_dip,
            CONFIG     => config
            );

    -- Logic to swap the mouse and keyboard, and handle open collector driving

    ps2_kbd_clk_in  <= ps2_kbd_clk  when ps2_swap = '0' else ps2_mse_clk;
    ps2_mse_clk_in  <= ps2_mse_clk  when ps2_swap = '0' else ps2_kbd_clk;
    ps2_kbd_data_in <= ps2_kbd_data when ps2_swap = '0' else ps2_mse_data;
    ps2_mse_data_in <= ps2_mse_data when ps2_swap = '0' else ps2_kbd_data;

    ps2_kbd_clk_o  <= ps2_kbd_clk_out  when ps2_swap = '0' else ps2_mse_clk_out;
    ps2_mse_clk_o  <= ps2_mse_clk_out  when ps2_swap = '0' else ps2_kbd_clk_out;
    ps2_kbd_data_o <= ps2_kbd_data_out when ps2_swap = '0' else ps2_mse_data_out;
    ps2_mse_data_o <= ps2_mse_data_out when ps2_swap = '0' else ps2_kbd_data_out;

    ps2_kbd_clk  <= '0' when ps2_kbd_clk_out = '0' and ps2_swap = '0' else
                    '0' when ps2_mse_clk_out = '0' and ps2_swap = '1' else
                    'Z';
    ps2_mse_clk  <= '0' when ps2_mse_clk_out = '0' and ps2_swap = '0' else
                    '0' when ps2_kbd_clk_out = '0' and ps2_swap = '1' else
                    'Z';
    ps2_kbd_data <= '0' when ps2_kbd_data_out = '0' and ps2_swap = '0' else
                    '0' when ps2_mse_data_out = '0' and ps2_swap = '1' else
                    'Z';
    ps2_mse_data <= '0' when ps2_mse_data_out = '0' and ps2_swap = '0' else
                    '0' when ps2_kbd_data_out = '0' and ps2_swap = '1' else
                    'Z';

    -- Analog to Digital Convertor
    adc: entity work.upd7002 port map (
        clk        => clock_48,
        cpu_clken  => cpu_clken,
        mhz1_clken => mhz1_clken,
        cs         => adc_enable,
        reset_n    => reset_n,
        r_nw       => cpu_r_nw,
        addr       => cpu_a(1 downto 0),
        di         => cpu_do,
        do         => adc_do,
        eoc_n      => adc_eoc_n,
        ch0        => adc_ch0,
        ch1        => adc_ch1,
        ch2        => adc_ch2,
        ch3        => adc_ch3
    );

    -- Master Joystick Left/Right (low value = right)
    adc_ch0 <= "111111111111" when joystick1(2) = '0' else -- left
               "000000000000" when joystick1(3) = '0' else -- right
               "100000000000";

    -- Master Joystick Up/Down (low value = down)
    adc_ch1 <= "111111111111" when joystick1(0) = '0' else -- up
               "000000000000" when joystick1(1) = '0' else -- down
               "100000000000";

    -- Secondary Joystick Left/Right (low value = right)
    adc_ch2 <= "111111111111" when joystick2(2) = '0' else -- left
               "000000000000" when joystick2(3) = '0' else -- right
               "100000000000";

    -- Secondary Joystick Up/Down (low value = down)
    adc_ch3 <= "111111111111" when joystick2(0) = '0' else -- up
               "000000000000" when joystick2(1) = '0' else -- down
               "100000000000";


--------------------------------------------------------
-- Optional SID
--------------------------------------------------------

    Optional_SID: if IncludeSID generate

        Inst_sid6581: entity work.sid6581
            port map (
                clk_1MHz   => clock_48,
                clken      => mhz1_clken,
                clk_SYS    => clock_48,
                clk_DAC    => '0', -- internal pwm dac not used
                reset      => reset,
                cs         => sid_enable,
                we         => cpu_nr_w,
                addr       => cpu_a(4 downto 0),
                di         => cpu_do,
                do         => sid_do,
                pot_x      => '0',
                pot_y      => '0',
                audio_out  => open,
                audio_data => sid_ao
            );
    end generate;

--------------------------------------------------------
-- Optional Music 5000
--------------------------------------------------------

    Optional_Music5000: if IncludeMusic5000 generate

        Inst_Music5000: component Music5000
            port map (
                clk      => clock_48,
                clken    => mhz1_clken,
                clk6     => clock_48,
                clk6en   => mhz6_clken,
                rnw      => cpu_r_nw,
                rst_n    => reset_n,
                pgfc_n   => io_fred_n,
                pgfd_n   => io_jim_n,
                a        => cpu_a(7 downto 0),
                din      => cpu_do,
                dout     => music5000_do,
                audio_l  => music5000_ao_l,
                audio_r  => music5000_ao_r
            );

    end generate;


--------------------------------------------------------
-- Optional 6502 Co Processor
--------------------------------------------------------

    GenCoPro6502: if IncludeCoPro6502 generate
        signal tube_cs_b : std_logic;
    begin
        copro1 : CoPro6502
        port map (
            -- Host
            h_clk       => clock_48,
            h_cs_b      => tube_cs_b,
            h_rdnw      => cpu_r_nw,
            h_addr      => cpu_a(2 downto 0),
            h_data_in   => cpu_do,
            h_data_out  => tube_do,
            h_rst_b     => reset_n,
            h_irq_b     => open,
            -- Parasite
            clk_cpu     => clock_48,
            cpu_clken   => tube_clken,
            -- External RAM
            ram_addr     => tube_ram_addr,
            ram_data_in  => tube_ram_data_in,
            ram_data_out => tube_mem_data,
            ram_wr       => tube_ram_wr,
            -- Test signals for debugging
            test         => open
        );
        tube_cs_b <= '0' when int_tube_enable = '1' and cpu_clken = '1' else '1';
    end generate;

--------------------------------------------------------
-- Optional SPI Co Processor
--------------------------------------------------------

    GenCoProSPI: if IncludeCoProSPI generate
        signal tube_cs_b : std_logic;
    begin
        copro2 : component CoProSPI
        port map (
            -- Host
            h_clk       => clock_48,
            h_cs_b      => tube_cs_b,
            h_rdnw      => cpu_r_nw,
            h_addr      => cpu_a(2 downto 0),
            h_data_in   => cpu_do,
            h_data_out  => tube_do,
            h_rst_b     => reset_n,
            h_irq_b     => open,
            -- Parasite
            p_clk       => clock_48,
            -- SPI Slave
            p_spi_ssel  => p_spi_ssel,
            p_spi_sck   => p_spi_sck,
            p_spi_mosi  => p_spi_mosi,
            p_spi_miso  => p_spi_miso,
            -- Interrupts/Control
            p_irq_b     => p_irq_b,
            p_nmi_b     => p_nmi_b,
            p_rst_b     => p_rst_b,
            -- Test signals for debugging
            test        => open
        );
        tube_cs_b <= '0' when int_tube_enable = '1' and cpu_clken = '1' else '1';
    end generate;

    GenNotCoProSPI: if not IncludeCoProSPI generate
    begin
        p_spi_miso <= '1';
        p_irq_b    <= '1';
        p_nmi_b    <= '1';
        p_rst_b    <= '1';
    end generate;

--------------------------------------------------------
-- Optional External Co Processor
--------------------------------------------------------

    GenCoProExt: if IncludeCoProExt generate
    begin
        process(clock_48)
        begin
            if rising_edge(clock_48) then
                ext_tube_phi2  <= not clken_counter(2);
                ext_tube_r_nw  <= cpu_r_nw;
                ext_tube_nrst  <= reset_n;
                ext_tube_ntube <= not ext_tube_enable;
                ext_tube_a     <= cpu_a(6 downto 0);
                ext_tube_di    <= cpu_do;
            end if;
        end process;
    end generate;

    GenNotCoProExt: if not IncludeCoProExt generate
        ext_tube_phi2  <= '1';
        ext_tube_r_nw  <= '1';
        ext_tube_nrst  <= '1';
        ext_tube_ntube <= '1';
        ext_tube_a     <= (others => '1');
        ext_tube_di    <= (others => '1');
    end generate;

--------------------------------------------------------
-- SN76489 Sound Generator
--------------------------------------------------------

    sound : entity work.sn76489
        generic map (
            AUDIO_RES => 8
            )
        port  map (
            clk => clock_48,
            clk_en => mhz4_clken,
            reset => reset,
            d => sound_di,
            we_n => sound_enable_n,
            ce_n => '0',
            audio_out => sound_ao
            );

--------------------------------------------------------
-- Sound Mixer
--------------------------------------------------------

    -- TODO clean up to avoid using hard coded width constants

--    process(sound_ao, sid_ao, music5000_ao_l, music5000_ao_r)
--        variable l : std_logic_vector(15 downto 0);
--        variable r : std_logic_vector(15 downto 0);
--    begin
--        l := std_logic_vector(sound_ao) & "00000000";
--        r := std_logic_vector(sound_ao) & "00000000";
--        if IncludeSID or IncludeMusic5000 then
--            l := l(15) & l(15 downto 1);
--            r := r(15) & r(15 downto 1);
--            if IncludeSID then
--                l := l + (sid_ao(17) & sid_ao(17 downto 3));
--                r := r + (sid_ao(17) & sid_ao(17 downto 3));
--            end if;
--            if IncludeMusic5000 then
--                l := l + (music5000_ao_l(15) & music5000_ao_l(15 downto 1));
--                r := r + (music5000_ao_r(15) & music5000_ao_r(15 downto 1));
--            end if;
--        end if;
--        audio_l <= l;
--        audio_r <= r;
--    end process;

    -- This version assumes only one source is playing at once
    process(sound_ao, sid_ao, music5000_ao_l, music5000_ao_r)
        variable l : std_logic_vector(15 downto 0);
        variable r : std_logic_vector(15 downto 0);
    begin
        -- SN76489 output is 8-bit unsigned and is 0x00 when no sound is playing
        -- attenuate by one bit as to try to match level with other sources
        l := std_logic_vector("00" & sound_ao(7 downto 0) & "000000");
        r := std_logic_vector("00" & sound_ao(7 downto 0) & "000000");
        if IncludeSID then
            -- SID output is 16-bit unsigned
            l := l + (sid_ao(17 downto 2) - x"8000");
            r := r + (sid_ao(17 downto 2) - x"8000");
        end if;
        if IncludeMusic5000 then
            -- Music 5000 output is 16-bit signed
            l := l + music5000_ao_l;
            r := r + music5000_ao_r;
        end if;
        audio_l_int <= l;
        audio_r_int <= r;
    end process;
    audio_l <= audio_l_int;
    audio_r <= audio_r_int;

--------------------------------------------------------
-- Reset generation
--------------------------------------------------------

    -- Keyboard and System VIA and Video are by a power up reset signal
    -- Rest of system is reset by all of the above plus keyboard BREAK key
	 -- Syncronise the reset to cpu_clken. This seems to be needed for reliable
	 -- operation of the Alan D core. I think without this, depending on when
	 -- reset is release, there may be too short a time to read the the first
	 -- byte of the reset vector from slow FLASH (on the Altera DE1).
    sync_reset: process(clock_48)
    begin
        if rising_edge(clock_48) then
            if cpu_clken = '1' then
                reset_n <= hard_reset_n and not keyb_break;
            end if;
        end if;
    end process;

    reset   <= not reset_n;

--------------------------------------------------------
-- Clock enable generation
--------------------------------------------------------

    -- Clock enable generation
    --
    -- Updated system timing, as of 27th May 2022
    --
    -- The goal of this change to accomodate much slower external RAM.
    --
    -- There is a single copy of clken_counter, inside the video processor,
    -- which is now passed out of it's interface.
    --
    -- The video processor increments clken_counter when mhz16_clken
    -- is asserted.
    --
    -- The video processor assertes CRTC_CLKEN during cycle 0/8
    -- (qualified by mhz16_clken)
    --
    -- The mc6845 increments updates it's output in CRTC_CLKEN.
    --
    -- The CPU is clocked out of phase with the CRTC, during cycle 4/12
    -- (qualified by mhz16_clken)
    --
    -- The video processor latches read data at the end of cycle 0/8
    -- (qualified by mhz16_clken)
    --
    --      Memory     Data loaded
    --  0 - Co Pro     Video
    --  1 - Co Pro
    --  2 - CPU        Co Pro
    --  3 - CPU
    --  4 - Co Pro     CPU
    --  5 - Co Pro
    --  6 - Video      Co Pro
    --  7 - Video
    --  8 - Co Pro     Video
    --  9 - Co Pro
    -- 10 - CPU        Co Pro
    -- 11 - CPU
    -- 12 - Co Pro     CPU
    -- 13 - Co Pro
    -- 14 - Video      Co Pro
    -- 15 - Video

    process(clock_48)
    begin
        if rising_edge(clock_48) then


            -- Divide 48MHz by 8 to get 6MHz and 12MHz
            div8_counter <= div8_counter + 1;

            -- Divide 48MHz by 3 to get 16MHz and 8MHz
            if div3_counter = 2 then
                div3_counter <= (others => '0');
            else
                div3_counter <= div3_counter + 1;
            end if;

            -- 16MHz (video) clock enable
            if div3_counter = 1 then
                mhz16_clken <= '1';
            else
                mhz16_clken <= '0';
            end if;

            -- 1MHz/2MHz clock enable (for IC15).
            --
            -- On a real Beeb this is clocked on the falling edge of
            -- the Video ULA 1MHz clock.
            --
            -- In VGA mode this needs to be double-speed.
            if div3_counter = 1 and
                ((vga_mode = '0' and clken_counter = 0) or
                 (vga_mode = '1' and clken_counter(2 downto 0) = 0 and not IncludeVideoNuLA) or
                 (vga_mode = '1' and clken_counter(2 downto 0) = 0 and     IncludeVideoNuLA)) then
                ttxt_ic15_clken <= '1';
            else
                ttxt_ic15_clken <= '0';
            end if;

            -- 1MHz/2MHz clock enable (for the SAA5050)
            --
            -- On a real Beeb this is clocked on the rising edge of
            -- the Video ULA 1MHz clock.
            --
            -- In VGA mode this needs to be double-speed.
            --
            -- This is the best place to fine-tune the teletext character alignent with the cursor
            if div3_counter = 1 and
                ((vga_mode = '0' and clken_counter = 8) or
                 (vga_mode = '1' and clken_counter(2 downto 0) = 6 and not IncludeVideoNuLA) or
                 (vga_mode = '1' and clken_counter(2 downto 0) = 3 and     IncludeVideoNuLA)) then
                ttxt_di_clken <= '1';
            else
                ttxt_di_clken <= '0';
            end if;

            -- 12MHz clock enable (for SAA5050)
            if (vga_mode = '0' and div8_counter(1 downto 0) = 3) or (vga_mode = '1' and div8_counter(0) = '1') then
                ttxt_clken <= '1';
            else
                ttxt_clken <= '0';
            end if;

            -- 6MHz clock enable (for Music 5000)
            if div8_counter(2 downto 0) = 7 then
                mhz6_clken <= '1';
            else
                mhz6_clken <= '0';
            end if;

            -- 4MHz clock enable
            if div3_counter = 1 and clken_counter(1 downto 0) = 3 then
                mhz4_clken <= '1';
            else
                mhz4_clken <= '0';
            end if;

            -- 2MHz clock enable
            if div3_counter = 1 and clken_counter(2 downto 0) = 3 then
                -- Compute cycle stretching
                if mhz1_enable = '1' and cpu_cycle_mask = "00" then
                    -- Block CPU cycles until 1 MHz cycle has completed
                    if clken_counter(3) = '1' then
                        cpu_cycle_mask <= "01";
                    else
                        cpu_cycle_mask <= "10";
                    end if;
                end if;
                if cpu_cycle_mask /= "00" then
                    cpu_cycle_mask <= cpu_cycle_mask - 1;
                end if;
            end if;

            -- 1MHz clock enable
            if div3_counter = 1 and clken_counter(3 downto 0) = 3 then
                mhz1_clken <= '1';
            else
                mhz1_clken <= '0';
            end if;

            -- CPU clock enable (taking account of cycle stretching)
            if div3_counter = 2 and clken_counter(2 downto 0) = 3 and cpu_cycle_mask = "00" then
                cpu_clken <= '1';
            else
                cpu_clken <= '0';
            end if;

            -- Tube clock enable
            if div3_counter = 2 and clken_counter(1 downto 0) = 1 and IncludeCoPro6502 then
                tube_clken <= '1';
            else
                tube_clken <= '0';
            end if;

            -- CPU memory cycle
            if (clken_counter(2 downto 1) = "01") or
               (clken_counter(2) = '0' and not IncludeCoPro6502) then
                cpu_mem_cycle <= '1';
                -- Latch read data at the end of the cycle
                -- DB: do we need the timing logic, just do it every cycle?
--                if div3_counter = 2 and clken_counter(2 downto 0) = "011" then
--                    -- This is only held for one tick, so likely could be eliminated
                    cpu_mem_data <= ext_Dout;
--                end if;
            else
                cpu_mem_cycle <= '0';
            end if;

            -- Video memory cycle
            if (clken_counter(2 downto 1) = "11") or
               (clken_counter(2) = '1' and not IncludeCoPro6502) then
                vid_mem_cycle <= '1';
                -- Latch read data at the end of the cycle
                if div3_counter = 2 and clken_counter(0) = '1' then
                    vid_mem_data <= ext_Dout;
                end if;
            else
                vid_mem_cycle <= '0';
            end if;

            -- Tube memory cycle
            if clken_counter(1) = '0' and IncludeCoPro6502 then
                tube_mem_cycle <= '1';
                -- Latch read data at the end of the cycle
                if div3_counter = 2 and clken_counter(0) = '1' then
                    tube_mem_data <= ext_Dout;
                end if;
            else
                tube_mem_cycle <= '0';
            end if;

            if div3_counter = 1 and clken_counter(0) = '0' and
                (clken_counter(1) = '0' or IncludeCoPro6502) then
                ext_A_stb <= '1';
            else
                ext_A_stb <= '0';
            end if;

            -- Control timing of the Ram write, mid cycle
            if div3_counter = 0 and clken_counter(0) = '1' then
                mem_write_strobe <= '1';
            else
                mem_write_strobe <= '0';
            end if;

        end if;
    end process;

    -- CPU configuration and fixed signals
    cpu_mode <= "00"; -- 6502
    cpu_ready <= '1';
    cpu_abort_n <= '1';
    cpu_nmi_n <= '1';
    cpu_so_n <= '1';
    cpu_nr_w <= not cpu_r_nw;

    -- Address decoding
    -- 0x0000 = 32 KB SRAM
    -- 0x8000 = 16 KB BASIC/Sideways ROMs
    -- 0xC000 = 16 KB MOS ROM
    --
    -- IO regions are mapped into a hole in the MOS.  There are three regions:
    -- 0xFC00 = FRED
    -- 0xFD00 = JIM
    -- 0xFE00 = SHEILA
    ram_enable <= not cpu_a(15);
    rom_enable <= cpu_a(15) and not cpu_a(14);
    mos_enable <= cpu_a(15) and cpu_a(14) and not (io_fred or io_jim or io_sheila);
    io_fred <= '1' when cpu_a(15 downto 8) = "11111100" else '0';
    io_fred_n <= not io_fred;
    io_jim <= '1' when cpu_a(15 downto 8) = "11111101" else '0';
    io_jim_n <= not io_jim;
    io_sheila <= '1' when cpu_a(15 downto 8) = "11111110" else '0';
    io_sheila_n <= not io_sheila;
    -- The following IO regions are accessed at 1 MHz and hence will stall the
    -- CPU accordingly
    mhz1_enable <= io_fred or io_jim or
        adc_enable or sys_via_enable or user_via_enable or
        serproc_enable or acia_enable or crtc_enable;


    -- FRED address demux
    -- Optional peripherals are mapped to fred and/or Jim
    -- 0xFC20 - 0xFEFF = SID
    process(cpu_a,io_fred)
    begin
        -- All regions normally de-selected
        sid_enable <= '0';
        if io_fred = '1' then
            case cpu_a(7 downto 5) is
                when "001" =>
                    sid_enable <= '1';
                when others =>
                    null;
            end case;
        end if;
    end process;

    -- SHEILA address demux
    -- All the system peripherals are mapped into this page as follows:
    -- 0xFE00 - 0xFE07 = MC6845 CRTC
    -- 0xFE08 - 0xFE0F = MC6850 ACIA (Serial/Tape)
    -- 0xFE10 - 0xFE17 = Serial ULA
    -- 0xFE18 - 0xFE1B = Econet Station ID (Model B)
    -- 0xFE1C - 0xFE1F = SPI SD Card Controller (Model B)
    -- 0xFE20 - 0xFE2F = Video ULA
    -- 0xFE30 - 0xFE3F = Paged ROM select latch
    -- 0xFE40 - 0xFE5F = System VIA (6522)
    -- 0xFE60 - 0xFE7F = User VIA (6522)
    -- 0xFE80 - 0xFE9F = 8271 Floppy disc controller
    -- 0xFEA0 - 0xFEBF = 68B54 ADLC for Econet
    -- 0xFEC0 - 0xFEDB = uPD7002 ADC
    -- 0xFEDC - 0xFEDF = SPI SD Card Controller (Master)
    -- 0xFEE0 - 0xFEFF = Tube ULA
    process(cpu_a,io_sheila,m128_mode,copro_mode,copro_ext,cpu_r_nw,acc_itu)
    begin
        -- All regions normally de-selected
        crtc_enable <= '0';
        acia_enable <= '0';
        serproc_enable <= '0';
        vidproc_enable <= '0';
        romsel_enable <= '0';
        sys_via_enable <= '0';
        user_via_enable <= '0';
 --     adlc_enable <= '0';
        spisd_enable <= '0';
        adc_enable <= '0';
        int_tube_enable <= '0';
        ext_tube_enable <= '0';
        acccon_enable <= '0';
        intoff_enable <= '0';
        inton_enable  <= '0';
        if io_sheila = '1' then
            case cpu_a(7 downto 5) is
                when "000" =>
                    -- 0xFE00
                    if cpu_a(4) = '0' then
                        if cpu_a(3) = '0' then
                            -- 0xFE00
                            crtc_enable <= '1';
                        else
                            -- 0xFE08
                            acia_enable <= '1';
                        end if;
                    else
                        if cpu_a(3) = '0' then
                            -- 0xFE10
                            serproc_enable <= '1';
                        else
                            -- 0xFE18
                            if m128_mode = '1' then
                                adc_enable <= '1';     -- 0xFE18-0xFE1F
                            elsif cpu_a(2) = '1' then
                                spisd_enable <= '1';   -- 0xFE1C-0xFE1F
                            end if;
                        end if;
                    end if;
                when "001" =>
                    -- 0xFE20
                    if cpu_a(4) = '0' then
                        -- 0xFE20
                        vidproc_enable <= not cpu_r_nw;
                    elsif m128_mode = '1' then
                        case cpu_a(3 downto 2) is
                            -- 0xFE30
                            when "00" => romsel_enable <= '1';
                            -- 0xFE34
                            when "01" => acccon_enable <= '1';
                            -- 0xFE38
                            when "10" => intoff_enable <= '1';
                            -- 0xFE3C
                            when "11" => inton_enable  <= '1';
                            when others => null;
                        end case;
                    else
                        -- 0xFE30
                        romsel_enable <= '1';
                    end if;
                when "010" =>
                    -- 0xFE40
                    sys_via_enable <= '1';
                when "011" =>
                    -- 0xFE60
                    user_via_enable <= '1';
--              when "101" => adlc_enable <= '1';       -- 0xFEA0
                when "110" =>
                    -- 0xFEC0
                    if m128_mode = '1' then
                        if cpu_a(4 downto 2) = "111" then
                            spisd_enable <= '1';        -- 0xFEDC - 0xFEDF
                        end if;
                    else
                        adc_enable <= '1';
                    end if;
                when "111" =>                           -- 0xFEE0
                    if copro_mode = '1' then
                        if m128_mode = '1' then
                            -- On the Master the ITU bit in ACCCON selects
                            -- between internal and external tube
                            if acc_itu = '0' then
                                if IncludeCoProExt then
                                    ext_tube_enable <= '1';
                                end if;
                            else
                                if IncludeCoPro6502 or IncludeCoProSPI  then
                                    int_tube_enable <= '1';
                                end if;
                            end if;
                        else
                            -- On the Model B, the copro_ext input selects
                            -- between internal and external tube
                            if copro_ext = '1' then
                                if IncludeCoProExt then
                                    ext_tube_enable <= '1';
                                end if;
                            else
                                if IncludeCoPro6502 or IncludeCoProSPI then
                                    int_tube_enable <= '1';
                                end if;
                            end if;
                        end if;
                    end if;
                when others =>
                    null;
            end case;
        end if;
    end process;

    -- This is needed as in v003 of the 6522 data out is only valid while I_P2_H is asserted
    -- I_P2_H is driven from mhz1_clken
    data_latch: process(clock_48)
    begin
        if rising_edge(clock_48) then
            if (mhz1_clken = '1') then
                user_via_do_r <= user_via_do;
                sys_via_do_r  <= sys_via_do;
            end if;
        end if;
    end process;

    -- CPU data bus mux and interrupts
    cpu_di <=
        cpu_do         when cpu_r_nw = '0' else
        cpu_mem_data   when ram_enable = '1' or rom_enable = '1' or mos_enable = '1' else
        crtc_do        when crtc_enable = '1' else
        adc_do         when adc_enable = '1' else
        "00000010"     when acia_enable = '1' else
        sys_via_do_r   when sys_via_enable = '1' else
        user_via_do_r  when user_via_enable = '1' else
        spisd_do       when spisd_enable = '1' else
        -- Optional peripherals
        sid_do         when sid_enable = '1' and IncludeSid else
        music5000_do   when io_jim = '1' and IncludeMusic5000 else
        tube_do        when int_tube_enable = '1' and (IncludeCoPro6502 or IncludeCoProSPI) else
        ext_tube_do    when ext_tube_enable = '1' and IncludeCoProExt else
        -- Master 128 additions
        romsel         when romsel_enable = '1' and m128_mode = '1' else
        acccon         when acccon_enable = '1' and m128_mode = '1' else
        "11111110"     when io_sheila = '1' else
        "11111111"     when io_fred = '1' or io_jim = '1' else
        (others => '0'); -- un-decoded locations are pulled down by RP1

    cpu_irq_n <= not ((not sys_via_irq_n) or (not user_via_irq_n) or acc_irr) when m128_mode = '1' else
                 not ((not sys_via_irq_n) or (not user_via_irq_n));
    -- SRAM bus

    -- Synchronous outputs to External Memory

    -- ext_A is 18..0 providing a 512KB address space

    -- External Memory Map in 16KB pages
    -- 0x00000-0x3FFFF is ROM
    -- 0x40000-0x7FFFF is RAM

    -- Master Mode (Beeb Mode difference)

    -- 000 00xx xxxx xxxx xxxx = ROM Slot 0
    -- 000 01xx xxxx xxxx xxxx = ROM Slot 1
    -- 000 10xx xxxx xxxx xxxx = ROM Slot 2
    -- 000 11xx xxxx xxxx xxxx = ROM Slot 3
    -- 001 00xx xxxx xxxx xxxx = MOS 3.20 (OS 1.20)
    -- 001 01xx xxxx xxxx xxxx = unused
    -- 001 10xx xxxx xxxx xxxx = unused
    -- 001 11xx xxxx xxxx xxxx = unused
    -- 010 00xx xxxx xxxx xxxx = ROM Slot 8 (8000-B5FF)
    -- 010 01xx xxxx xxxx xxxx = ROM Slot 9
    -- 010 10xx xxxx xxxx xxxx = ROM Slot A
    -- 010 11xx xxxx xxxx xxxx = ROM Slot B
    -- 011 00xx xxxx xxxx xxxx = ROM Slot C
    -- 011 01xx xxxx xxxx xxxx = ROM Slot D
    -- 011 10xx xxxx xxxx xxxx = ROM Slot E
    -- 011 11xx xxxx xxxx xxxx = ROM Slot F

    -- 100 00xx xxxx xxxx xxxx = Co Processor
    -- 100 01xx xxxx xxxx xxxx = Co Processor
    -- 100 10xx xxxx xxxx xxxx = Co Processor
    -- 100 11xx xxxx xxxx xxxx = Co Processor
    -- 101 00xx xxxx xxxx xxxx = RAM Slot 4
    -- 101 01xx xxxx xxxx xxxx = RAM Slot 5
    -- 101 10xx xxxx xxxx xxxx = RAM Slot 6
    -- 101 11xx xxxx xxxx xxxx = RAM Slot 7
    -- 110 00xx xxxx xxxx xxxx = Main memory
    -- 110 01xx xxxx xxxx xxxx = Main memory
    -- 110 1000 xxxx xxxx xxxx = Private RAM (4K, at 8000-8FFF)       (unused in Beeb Mode)
    -- 110 1001 xxxx xxxx xxxx = Filing System RAM (4K, at C000-CFFF) (unused in Beeb Mode)
    -- 110 1010 xxxx xxxx xxxx = Filing System RAM (4K, at D000-DFFF) (unused in Beeb Mode)
    -- 110 1011 xxxx xxxx xxxx = Shadow memory (4K, at 3000-3FFF)     (unused in Beeb Mode)
    -- 110 11xx xxxx xxxx xxxx = Shadow memory (16K, at 4000-7FFF)    (unused in Beeb Mode)
    -- 111 00xx xxxx xxxx xxxx = RAM Slot 8 (B600-BFFF)
    -- 111 01xx xxxx xxxx xxxx = unused
    -- 111 10xx xxxx xxxx xxxx = unused
    -- 111 11xx xxxx xxxx xxxx = unused

    process(clock_48,hard_reset_n)
    begin

        if hard_reset_n = '0' then
            ext_nOE <= '1';
            ext_nWE <= '1';
            ext_nWE_long <= '1';
            ext_Din <= (others => '0');
            ext_A   <= (others => '0');
            ext_nCS <= '1';
        elsif rising_edge(clock_48) then
            -- Tri-stating of RAM data has been pushed up a level
            ext_Din  <= cpu_do;
            -- Default to reading RAM
            ext_nWE  <= '1';
            ext_nWE_long <= '1';
            ext_nOE  <= '0';
            ext_nCS  <= '1';
            -- Register SRAM signals to outputs (clock must be at least 2x CPU clock)
            if vid_mem_cycle = '1' then
                -- Fetch data from previous display cycle
                if m128_mode = '1' then
                    -- Master 128
                    ext_A <= "110" & acc_d & display_a;
                else
                    -- Model B
                    ext_A <= "1100" & display_a;
                end if;
                ext_nCS <= '0';
            elsif tube_mem_cycle = '1' and IncludeCoPro6502 then
                -- The Co Processor has access to the memory system on cycles 3, 11, 19, 27
                ext_Din <= tube_ram_data_in;
                ext_nWE <= not (tube_ram_wr and mem_write_strobe);
                ext_nWE_long <= not (tube_ram_wr);
                ext_nOE <= tube_ram_wr;
                ext_nCS <= '0';
                ext_A   <= "100" & tube_ram_addr;
            else
                ext_nCS <= '0';
                -- Fetch data from previous CPU cycle
                if rom_enable = '1' then
                    if m128_mode = '1' and cpu_a(15 downto 12) = "1000" and romsel(7) = '1' then
                        -- Master 128, RAM bit maps 8000-8FFF as private RAM
                        ext_A   <= "1101000" & cpu_a(11 downto 0);
                        ext_nWE <= not ((not cpu_r_nw) and mem_write_strobe);
                        ext_nWE_long <= cpu_r_nw;
                        ext_nOE <= not cpu_r_nw;
                    else
                        case romsel(3 downto 2) is
                            when "00" =>
                                -- ROM slots 0,1,2,3 are in ROM
                                ext_A <= "000" & romsel(1 downto 0) & cpu_a(13 downto 0);
                            when "01" =>
                                -- ROM slots 4,5,6,7 are writeable on the Beeb and Master
                                ext_A <= "101" & romsel(1 downto 0) & cpu_a(13 downto 0);
                                ext_nWE <= not ((not cpu_r_nw) and mem_write_strobe);
                                ext_nWE_long <= cpu_r_nw;
                                ext_nOE <= not cpu_r_nw;
                            when others =>
                                if m128_mode = '0' and romsel(3 downto 0) = "1000" and cpu_a(13 downto 8) >= "110110" then
                                    -- ROM slot 8 >= B600 is mapped to RAM for
                                    -- the SWRam version of MMFS in Beeb mode only
                                    ext_A <= "11100" & cpu_a(13 downto 0);
                                    ext_nWE <= not ((not cpu_r_nw) and mem_write_strobe);
                                    ext_nWE_long <= cpu_r_nw;
                                    ext_nOE <= not cpu_r_nw;
                                else
                                    -- ROM slots 8,9,A,B,C,D,E,F are in ROM
                                    ext_A <= "01" & romsel(2 downto 0) & cpu_a(13 downto 0);
                                end if;
                        end case;
                        -- If bit 6 if ACCCON (&FE34) is set, make the ROMs writeable
                        if acc_tst = '1' then
                            ext_nWE <= not ((not cpu_r_nw) and mem_write_strobe);
                            ext_nWE_long <= cpu_r_nw;
                            ext_nOE <= not cpu_r_nw;
                        end if;
                    end if;
                elsif mos_enable = '1' then
                    if m128_mode = '1' and cpu_a(15 downto 13) = "110" and acc_y = '1' then
                        -- Master 128, Y bit maps C000-DFFF as filing system RAM
                        ext_A   <= "11010" & cpu_a(12) & not cpu_a(12) & cpu_a(11 downto 0);
                        ext_nWE <= not ((not cpu_r_nw) and mem_write_strobe);
                        ext_nWE_long <= cpu_r_nw;
                        ext_nOE <= not cpu_r_nw;
                    else
                        -- Master OS 3.20 / Model B OS 1.20
                        ext_A <= "00100" & cpu_a(13 downto 0);
                    end if;
                elsif ram_enable = '1' then
                    if m128_mode = '1' and (cpu_a(15 downto 12) = "0011"  or cpu_a(15 downto 14) = "01") and ((vdu_op = '0' and acc_x = '1') or (vdu_op = '1' and acc_e = '1' and cpu_sync = '0')) then
                        -- Shadow RAM
                        ext_A   <= "1101" & cpu_a(14 downto 0);
                    else
                        -- Main RAM
                        ext_A   <= "1100" & cpu_a(14 downto 0);
                    end if;
                    ext_nWE <= not ((not cpu_r_nw) and mem_write_strobe);
                    ext_nWE_long <= cpu_r_nw;
                    ext_nOE <= not cpu_r_nw;
                end if;
            end if;
        end if;
    end process;

    -- Address translation logic for calculation of display address
    process(crtc_ma, crtc_ra, disp_addr_offs, ttxt_vdu, m128_mode)
    variable aa : unsigned(3 downto 0);
    begin
        if crtc_ma(12) = '0' then
            -- No adjustment
            aa := unsigned(crtc_ma(11 downto 8));
        else
            -- Address adjusted according to screen mode to compensate for
            -- wrap at 0x8000.
            case disp_addr_offs is
            when "00" =>
                -- Mode 3 - restart at 0x4000
                aa := unsigned(crtc_ma(11 downto 8)) + 8;
            when "01" =>
                -- Mode 6 - restart at 0x6000
                aa := unsigned(crtc_ma(11 downto 8)) + 12;
            when "10" =>
                -- Mode 0,1,2 - restart at 0x3000
                aa := unsigned(crtc_ma(11 downto 8)) + 6;
            when "11" =>
                -- Mode 4,5 - restart at 0x5800
                aa := unsigned(crtc_ma(11 downto 8)) + 11;
            when others =>
                null;
            end case;
        end if;

        if ttxt_vdu = '0' then
            -- HI RES
            display_a <= std_logic_vector(aa(3 downto 0)) & crtc_ma(7 downto 0) & crtc_ra(2 downto 0);
        elsif m128_mode = '0' then
            -- TTX VDU (Model B, &3c00 or &7C00)
            display_a <= std_logic(aa(3)) & "1111" & crtc_ma(9 downto 0);
        else
            -- TTX VDU (Master, &7C00 only)
            display_a <= "11111" & crtc_ma(9 downto 0);
        end if;
    end process;

    -- VIDPROC
    vidproc_invert_n <= '1';
    vidproc_disen <= crtc_de and not crtc_ra(3); -- DISEN is masked off by RA(3) for MODEs 3 and 6
    r_in <= ttxt_r;
    g_in <= ttxt_g;
    b_in <= ttxt_b;

    -- SAA5050
    ttxt_glr <= crtc_hsync_n;
    ttxt_dew <= crtc_vsync;
    ttxt_crs <= not crtc_ra(0);

    ttxt_vdu <= crtc_ma(13);

    -- IC15 (LS273 latch in front of SAA5050)
    process(clock_48)
    begin
        if rising_edge(clock_48) then
            if ttxt_vdu = '0' then
                ttxt_data <= (others => '0');
                ttxt_lose <= '0';
            elsif ttxt_ic15_clken = '1' then
                ttxt_data <= vid_mem_data(6 downto 0);
                ttxt_lose <= crtc_de;
            end if;
        end if;
    end process;

    -- Connections to System VIA

    -- ADC
    sys_via_cb1_in <= adc_eoc_n;
    sys_via_pb_in(5) <= joystick2(4);
    sys_via_pb_in(4) <= joystick1(4);

    -- CRTC
    sys_via_ca1_in <= crtc_vsync;
    sys_via_cb2_in <= crtc_lpstb;

    -- The Lightpen strobe is abused by Pharoah's Curse
    -- see https://github.com/mattgodbolt/jsbeeb/issues/135
    crtc_lpstb <= sys_via_cb2_out when sys_via_cb2_oe_n = '0' else '1';

    -- Keyboard
    sys_via_ca2_in <= keyb_int;


    -- TODO more work needed here, but this might be enough
    sys_via_pa_in <= rtc_do when m128_mode = '1' and rtc_ce = '1' and rtc_ds = '1' and rtc_r_nw = '1' else
                     -- Must loop back output pins or keyboard won't work
                     keyb_out & sys_via_pa_out(6 downto 0);

    keyb_column <= sys_via_pa_out(3 downto 0);
    keyb_row <= sys_via_pa_out(6 downto 4);
    -- Sound
    sound_di <= sys_via_pa_out;
    -- Others (idle until missing bits implemented)
    sys_via_pb_in(7 downto 6) <= (others => '1');
    sys_via_pb_in(3 downto 0) <= sys_via_pb_out(3 downto 0);

    -- SPI SD Card Interface (for Memory Mapped SPI)
    spisd: if IncludeSPISD generate
        Inst_SPI_Port: entity work.SPI_Port
            port map (
                nRST    => reset_n,
                clk     => clock_48,
                clken   => mhz16_clken,  -- needs to be 16MHz or less (SPI clockis half this rate)
                enable  => spisd_enable,
                nwe     => cpu_r_nw,
                datain  => cpu_do,
                dataout => spisd_do,
                SDMISO  => SDMISO,
                SDMOSI  => SDMOSI,
                SDSS    => SDSS,
                SDCLK   => SDCLK
                );
    end generate;
    not_spisd: if not IncludeSPISD generate
        SDCLK    <= '1';
        SDMOSI   <= '1';
        SDSS     <= '1';
        spisd_do <= x"FE";
    end generate;

    -- ROM select latch
    process(clock_48,reset_n)
    begin
        if reset_n = '0' then
            romsel <= (others => '0');
        elsif rising_edge(clock_48) then
            if romsel_enable = '1' and cpu_r_nw = '0' then
                romsel <= cpu_do;
            end if;
        end if;
    end process;

    -- IC32 latch
    sound_enable_n <= ic32(0);
 -- speech_write_n <= ic32(1);
 -- speech_read_n <= ic32(2);
    keyb_enable_n <= ic32(3);
    disp_addr_offs <= ic32(5 downto 4);

    -- Keyboard LEDs
    caps_led <= not ic32(6);
    shift_led <= not ic32(7);

    process(clock_48,reset_n)
    variable bit_num : integer;
    begin
        if reset_n = '0' then
            ic32 <= (others => '0');
        elsif rising_edge(clock_48) then
            bit_num := to_integer(unsigned(sys_via_pb_out(2 downto 0)));
            ic32(bit_num) <= sys_via_pb_out(3);
        end if;
    end process;

-----------------------------------------------
-- Scan Doubler from the MIST project
-----------------------------------------------

    -- Input clock enable (for the 48MHz input clock)
    --   mhz12_active = 0: 16MHz
    --   mhz12_active = 1: 12MHz
    clken_pixel <= ttxt_clken when mhz12_active = '1' else mhz16_clken;

    -- Output clock enable (for the 96MHz output clock)
    -- mhz12_active = 0: divide by 3 -> 32MHz
    -- mhz12_active = 1: divide by 4 -> 24MHz
    process(clock_96)
    begin
        if rising_edge(clock_96) then
            if (mhz12_active = '0' and vga3_counter = 2) or (mhz12_active = '1' and vga3_counter = 3) then
                vga3_counter <= (others => '0');
                clken_vga <= '1';
            else
                vga3_counter <= vga3_counter + 1;
                clken_vga <= '0';
            end if;
        end if;
    end process;

    inst_mist_scandoubler: entity work.mist_scandoubler
    generic map (
        -- WIDTH is width of individual rgb in/out ports
        WIDTH => RGB_WIDTH
    )
    port map (
        clk => clock_96,
        clk_en => clken_vga,
        clk_16 => clock_48,
        clk_16_en => clken_pixel,
        hs_in => crtc_hsync_n,
        vs_in => crtc_vsync_n,
        r_in => r_out,
        g_in => g_out,
        b_in => b_out,
        hs_out => vga0_hs,
        vs_out => vga0_vs,
        r_out => vga0_r,
        g_out => vga0_g,
        b_out => vga0_b,
        is15k => open
    );
    crtc_hsync_n <= not crtc_hsync;
    crtc_vsync_n <= not crtc_vsync;

-----------------------------------------------
-- Scan Doubler from RGB2VGA project
-----------------------------------------------

    rgbi_in <= r_out & g_out & b_out & '0';

    inst_rgb2vga_scandoubler: entity work.rgb2vga_scandoubler
    generic map (
        -- WIDTH is width of combined rgbi in/out ports
        WIDTH => RGB_WIDTH * 3 + 1
    )
    port map (
        clock => clock_48,
        clken => clken_pixel,
        clk25 => clock_27,
        mode => mhz12_active,
        rgbi_in => rgbi_in,
        hSync_in => crtc_hsync,
        vSync_in => crtc_vsync,
        rgbi_out => rgbi_out,
        hSync_out => vga1_hs,
        vSync_out => vga1_vs
    );

    vga1_r  <= rgbi_out(RGB_WIDTH * 3 downto RGB_WIDTH * 2 + 1);
    vga1_g  <= rgbi_out(RGB_WIDTH * 2 downto RGB_WIDTH * 1 + 1);
    vga1_b  <= rgbi_out(RGB_WIDTH * 1 downto RGB_WIDTH * 0 + 1);

-----------------------------------------------
-- 24MHz to 27MHz Scan Retimer (by DMB)
-----------------------------------------------

    inst_retimer: entity work.retimer
    generic map (
        -- WIDTH is width of individual rgb in/out ports
        WIDTH => RGB_WIDTH
    )
    port map (
        clk_in    => clock_48,
        clken_in  => ttxt_clken,
        clk_out   => clock_27,
        clken_out => '1',
        hs_in     => crtc_hsync_n,
        vs_in     => crtc_vsync_n,
        r_in      => r_out,
        g_in      => g_out,
        b_in      => b_out,
        hs_out    => vga2_hs,
        vs_out    => vga2_vs,
        r_out     => vga2_r,
        g_out     => vga2_g,
        b_out     => vga2_b
    );


-----------------------------------------------
-- RGBHV Multiplexor
-----------------------------------------------

    -- Video Mode:  -------------------Scan Doubling Approach-----------------------
    --              Mode 0-6@16MHz      Mode 0-6@12Mhz      Mode7
    -- 00 (SRGB)    direct    (16MHz)   Direct    (12MHz)   Direct             (12MHz)
    -- 01 (HDMI)    RGB2VGASD (27MHz)   RGB2VGASD (27MHz)   SAA5050VGA/retimer (27MHz)
    -- 10 (VGA)     MistSD    (32MHz)   MistSD    (24MHz)   Mist SD            (24MHz)
    -- 11 (VGA)     MistSD    (32Mhz)   MistSD    (24MHz)   SAA5050VGA         (24MHz)

    -- The SAA5050 24MHz VGA mode is enabled
    vga_mode <= '1' when (vid_mode(0) = '1' and ttxt_active = '1') else '0';

    -- The video output is taken from the Mist Scan Doubler
    vga0_mode <= '1' when (vid_mode(1 downto 0) = "11" and ttxt_active = '0') or vid_mode(1 downto 0) = "10" else '0';

    -- The video output is taken from the RGB2VGA Scan Doubler
    vga1_mode <= '1' when vid_mode(1 downto 0) = "01" and ttxt_active = '0' else '0';

    -- The video output is taken from the Retimer
    vga2_mode <= '1' when vid_mode(1 downto 0) = "01" and ttxt_active = '1' else '0';

    -- CRTC drives video out (CSYNC on HSYNC output, VSYNC high)
    hsync_int   <= vga0_hs when vga0_mode = '1' else
                   vga1_hs when vga1_mode = '1' else
                   vga2_hs when vga2_mode = '1' else
              crtc_hsync_n when  vga_mode = '1' else
                   not (crtc_hsync or crtc_vsync);

    vsync_int   <= vga0_vs when vga0_mode = '1' else
                   vga1_vs when vga1_mode = '1' else
                   vga2_vs when vga2_mode = '1' else
              crtc_vsync_n when  vga_mode = '1' else
                   '1';

    video_hsync <= hsync_int xor vid_mode(2);

    video_vsync <= vsync_int xor vid_mode(3);

    final_r <= vga0_r when vga0_mode = '1' else
               vga1_r when vga1_mode = '1' else
               vga2_r when vga2_mode = '1' else
               r_out;

    final_g <= vga0_g when vga0_mode = '1' else
               vga1_g when vga1_mode = '1' else
               vga2_g when vga2_mode = '1' else
               g_out;

    final_b <= vga0_b when vga0_mode = '1' else
               vga1_b when vga1_mode = '1' else
               vga2_b when vga2_mode = '1' else
               b_out;

    map_video_nula: if IncludeVideoNuLA generate
    begin
        video_red   <= final_r;
        video_green <= final_g;
        video_blue  <= final_b;
    end generate;

    map_video_orig: if not IncludeVideoNuLA generate
    begin
        video_red   <= (others => final_r(0));
        video_green <= (others => final_g(0));
        video_blue  <= (others => final_b(0));
    end generate;


--------------------------------------------------------
-- HDMI
--------------------------------------------------------

    GenHDMI: if IncludeHDMI generate

        -- Recreate the video sync/blank signals that match standard HDTV 720x576p
        --
        -- Modeline "720x576 @ 50hz"  27    720   732   796   864   576   581   586   625
        --
        -- Hcnt is set to 0 on the trailing edge of hsync from the Beeb core
        -- so the H constants below need to be offset by 864-796=68
        --
        -- Vcnt is set to 0 on the trailing edge of vsync from the Beeb core
        -- so the V constants below need to be offset by 625-586=39
        --
        -- This only works because the Beeb core is generating 32us lines
        --
        -- The hdmidataencode module inserts a two 32 pixel data packets after the
        -- first edge of hsync. The hsync pluse + back porch needs to be at least
        -- this width. There are also min requirements on the size of control
        -- islands of 12 pixels.

        process(clock_27)
            variable voffset : integer;
            variable vsize   : integer;
        begin
            if rising_edge(clock_27) then
                hsync1 <= hsync_int;
                if hsync1 = '0' and hsync_int = '1' then
                    hcnt <= (others => '0');
                    vsync1 <= vsync_int;
                    if vsync1 = '0' and vsync_int = '1' then
                        vcnt <= (others => '0');
                    else
                        vcnt <= vcnt + 1;
                    end if;
                else
                    hcnt <= hcnt + 1;
                end if;
                if hdmi_audio_en = '1' then
                    voffset := 39;
                    vsize   := 576;
                else
                    voffset := 55;
                    vsize   := 540;
                end if;
                if hcnt < 68 or hcnt >= 68 + 720 or vcnt < voffset or vcnt >= voffset + vsize then
                    hdmi_blank <= '1';
                    hdmi_red   <= (others => '0');
                    hdmi_green <= (others => '0');
                    hdmi_blue  <= (others => '0');
                else
                    hdmi_blank <= '0';
                    if IncludeVideoNuLA then
                        hdmi_red   <= final_r;
                        hdmi_green <= final_g;
                        hdmi_blue  <= final_b;
                    else
                        hdmi_red   <= final_r(0) & "000";
                        hdmi_green <= final_g(0) & "000";
                        hdmi_blue  <= final_b(0) & "000";
                    end if;
                    if vid_debug = '1' and (hcnt = 68 or hcnt = 68 + 719 or vcnt = voffset or vcnt = voffset + vsize - 1) then
                        hdmi_green <= (others => '1');
                    end if;
                end if;
                if hcnt >= 732 + 68 then -- 800
                    hdmi_hsync <= '0';
                    if vcnt >= 581 + 39 then -- 620
                        hdmi_vsync <= '0';
                    else
                        hdmi_vsync <= '1';
                    end if;
                else
                    hdmi_hsync <= '1';
                end if;
            end if;
        end process;

        hdmi_aspect_169 <= '0' when hdmi_aspect = "01" else -- always 4:3
                           '1' when hdmi_aspect = "10" else -- always 16:9
                           mhz12_active;                    -- 4:3 in modes 0-6; 16:9 i mode 7

        inst_hdmi: entity work.hdmi
            generic map (
                FREQ => 27000000,  -- pixel clock frequency
                FS   => 48000,     -- audio sample rate - should be 32000, 44100 or 48000
                CTS  => 27000,     -- CTS = Freq(pixclk) * N / (128 * Fs)
                N    => 6144       -- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300
                --FS   => 32000,   -- audio sample rate - should be 32000, 44100 or 48000
                --CTS  => 27000,   -- CTS = Freq(pixclk) * N / (128 * Fs)
                --N    => 4096     -- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300
                )
            port map (
                -- clocks
                I_CLK_PIXEL      => clock_27,
                -- components
                I_R              => hdmi_red   & "0000",
                I_G              => hdmi_green & "0000",
                I_B              => hdmi_blue  & "0000",
                I_BLANK          => hdmi_blank,
                I_HSYNC          => hdmi_hsync,
                I_VSYNC          => hdmi_vsync,
                I_ASPECT_169     => hdmi_aspect_169,
                -- PCM audio
                I_AUDIO_ENABLE   => hdmi_audio_en,
                I_AUDIO_PCM_L    => audio_l_int,
                I_AUDIO_PCM_R    => audio_r_int,
                -- TMDS parallel pixel synchronous outputs (serialize LSB first)
                O_RED            => tmds_r,
                O_GREEN          => tmds_g,
                O_BLUE           => tmds_b
                );

    end generate;

    GenNotHDMI: if not IncludeHDMI generate
        tmds_r <= (others => '0');
        tmds_g <= (others => '0');
        tmds_b <= (others => '0');
    end generate;

-----------------------------------------------
-- Master 128 additions
-----------------------------------------------

    -- RTC/CMOS
    inst_rtc : entity work.rtc
        generic map (
            OverrideCMOS => OverrideCMOS
        )
        port map (
            clk          => clock_48,
            cpu_clken    => cpu_clken,
            hard_reset_n => hard_reset_n,
            reset_n      => reset_n,
            ce           => rtc_ce,
            as           => rtc_as,
            ds           => rtc_ds,
            r_nw         => rtc_r_nw,
            adi          => rtc_adi,
            do           => rtc_do,
            keyb_dip     => keyb_dip
        );

    -- RTC/CMOS is controlled from the system
    -- PB7 -> address strobe (AS) active high
    -- PB6 -> chip enable (CE) active high
    -- PB3..0 drives IC32 (4-16 line decoder)
    -- IC32(2) -> data strobe (active high)
    -- IC32(1) -> read (1) / write (0)
    rtc_adi    <= sys_via_pa_out;
    rtc_as     <= sys_via_pb_out(7);
    rtc_ce     <= sys_via_pb_out(6);
    rtc_ds     <= ic32(2);
    rtc_r_nw   <= ic32(1);

    process(clock_48,reset_n)
    begin
        if reset_n = '0' then
            acccon <= (others => '0');
            vdu_op <= '0';
        elsif rising_edge(clock_48) then
            if (cpu_clken = '1') then
                -- Access Control Register 0xFE34
                if acccon_enable = '1' and cpu_r_nw = '0' then
                    acccon <= cpu_do;
                end if;
                -- vdu op indicates the last opcode fetch in 0xC000-0xDFFF and
                -- the VDU driver is paged in (rather than Hazel RAM)
                if cpu_sync = '1' then
                    if cpu_a(15 downto 13) = "110" and acc_y = '0' then
                        vdu_op <= '1';
                    else
                        vdu_op <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;
    acc_irr <= acccon(7);
    acc_tst <= acccon(6);
    acc_ifj <= acccon(5);
    acc_itu <= acccon(4);
    acc_y   <= acccon(3);
    acc_x   <= acccon(2);
    acc_e   <= acccon(1);
    acc_d   <= acccon(0);

    -- Debugging output
    cpu_addr <= cpu_a(15 downto 0);

-----------------------------------------------
-- 6502 Decoder Trace Output
-----------------------------------------------

    GenTrace: if IncludeTrace generate
        -- 6502 trace outputs
        process(clock_48)
            variable p_delay : std_logic_vector(11 downto 0);
        begin
            if rising_edge(clock_48) then
                if cpu_clken = '1' then
                    if cpu_r_nw = '1' then
                        trace_data <= cpu_di;
                    else
                        trace_data <= cpu_do;
                    end if;
                    trace_r_nw <= cpu_r_nw;
                    trace_sync <= cpu_sync;
                    trace_rstn <= reset_n;
                end if;
                -- generate an 12 cycle wide fake phi2 pulse with the falling edge 12 cycles after cpu_clken
                trace_phi2 <= p_delay(0) or p_delay(1) or p_delay(2)  or p_delay(3) or
                              p_delay(4) or p_delay(5) or p_delay(6)  or p_delay(7) or
                              p_delay(8) or p_delay(9) or p_delay(10) or p_delay(11);
                -- delayed versions of cpu_clken
                p_delay := cpu_clken & p_delay(11 downto 1);
            end if;
        end process;
    end generate;

    GenNotTrace: if not IncludeTrace generate
        trace_data <= (others => '0');
        trace_r_nw <= '0';
        trace_sync <= '0';
        trace_rstn <= '0';
        trace_phi2 <= '0';
    end generate;


    -- Test output
    test <= crtc_vsync & crtc_hsync & crtc_ra(0) & crtc_enable & crtc_test(3 downto 0);

end architecture;
