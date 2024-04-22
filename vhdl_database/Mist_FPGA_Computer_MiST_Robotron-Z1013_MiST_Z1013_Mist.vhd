----------------------------------------------------------------------------------
-- top module for the Z1013 mist project
-- 
-- Copyright (c) 2017, 2018 by Bert Lange
-- https://github.com/boert/Z1013-mist
-- 
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library mist;
use mist.mist_components.osd;
use mist.mist_components.sdram;
use mist.mist_components.user_io;
use mist.mist_components.data_io;

library support;
library overlay;

library work;
use work.init_message_pkg.all;


entity top_mist2 is
    port (
        -- system
        CLOCK_27                    : in    std_logic;
        reset_n                   : in    std_logic;                        -- clk 6, pin 89, connected wit S2 and AMR JTAG reset

        -- basic input
        -- no inputs

        -- basic output
        LED              : out   std_logic;                        -- io 7 
        test_point_tp1            : out   std_logic;                        -- io 33, was sdram_cke on prototype
                                                                           
        -- basic communication                                             
        uart_rx                   : in    std_logic;                        -- io 31
        uart_tx                   : inout std_logic;                        -- io 46

        -- dRAM pin connections
        dram_dq                   : inout std_logic_vector(15 downto 0);    -- io 104, 103, 101, 100, 99, 98, 87, 86, 68, 69, 71, 72, 76, 77, 79, 83
        dram_a                    : out   std_logic_vector(12 downto 0);    -- io 32, 30, 50, 28, 11, 10, 8, 6, 4, 39, 42, 44, 49 
        dram_clk                  : out   std_logic;                        -- io 43
        dram_we_n                 : out   std_logic;                        -- io 66
        dram_cas_n                : out   std_logic;                        -- io 64
        dram_ras_n                : out   std_logic;                        -- io 60
        dram_cs_n                 : out   std_logic;                        -- io 59
        dram_dqm                  : out   std_logic_vector(1 downto 0);     -- io 85, 67
        dram_ba                   : out   std_logic_vector(1 downto 0);     -- io 51, 58


        VGA_R                   : out   std_logic_vector(5 downto 0);
        VGA_G                 : out   std_logic_vector(5 downto 0);
        VGA_B                  : out   std_logic_vector(5 downto 0);
        VGA_HS                 : out   std_logic;
        VGA_VS                 : out   std_logic;
    
        -- audio
        AUDIO_R                    : out   std_logic;
        AUDIO_L                    : out   std_logic;

        -- SPI interface to ARM io controller
        SPI_DO                    : out   std_logic;
        SPI_DI                    : in    std_logic;
        SPI_SCK                   : in    std_logic;
        SPI_SS2                   : in    std_logic;
        SPI_SS3                   : in    std_logic;
        SPI_SS4                   : in    std_logic;
        conf_data0                : in    std_logic
    );
end entity top_mist2;


architecture rtl of top_mist2 is

    ------------------------------------------------------------
    -- helper function
    -- convert string to a long logic vector
    --
    function string_to_slv ( str : string) return std_logic_vector is
        variable result   : std_logic_vector( 1 to 8 * str'length);
        variable position : integer; 
        variable char     : integer; 
    begin 
        for i in str'range loop
            position := 8 * i;
            char     := character'pos( str( i));
            result(position - 7 to position) := std_logic_vector( to_unsigned( char, 8)); 
        end loop; 
        return result;
    end function string_to_slv;

    
    ------------------------------------------------------------
    -- configuration string for osd
    --   field separator: ,
    --   line separator: ;
    --   forbidden symbols: / 
    --   max. 7 chars per entry
    --
    constant config_str   : string := 
        core_name & ";" &   -- soc name
        "Z80;" &            -- extension for image files, attn: here in upper case
        "O23,Decoration,Scanline+mono,Mono,Scanline+color,Color;" & 
        "O4,Keyboard,en,de;" & 
        "OA,Online help,Off,On;" &
        "O67,Joystick,practic 1/88,ju+te 6/87,practic 4/87,ERF-Soft;" & -- 00,10,01,11
        "OB,Autostart,Enable,Disable;" &
        "T1,Reset;" &
		"V0," & version & ", " & compile_time;
        -- O = option
        -- T = toggle
		  -- F = file
		  -- S = SD-image
		  -- V = version number

    -- named bit numbers
    constant uc_reset_bit   : natural := 0;
    constant reset_bit      : natural := 1;
    constant scanline_bit   : natural := 2;
    constant color_bit      : natural := 3;
    constant keyboard_bit   : natural := 4;
    constant joystick_bit   : natural := 6;
    constant joystick2_bit  : natural := 7;
    constant help_bit       : natural := 10;
    constant autostart_bit  : natural := 11;

    
    ------------------------------------------------------------
    -- signal declarations
    --
    signal sys_reset_n            : std_logic;
    signal sys_reset              : std_logic               := '1';
    signal reset_counter          : natural range 0 to 255  := 255;
    --                            
    signal scancode_en            : std_logic;
    signal scancode               : std_logic_vector(7 downto 0);
    --                            
  --  signal clk_32Mhz              : std_logic;
    signal video_clk              : std_logic;
    signal cpu_clk                : std_logic;
    signal cpu_clk_fast           : std_logic;
    signal cpu_clk_slow           : std_logic;
  --  signal ram_clk                : std_logic;
    --
    signal ascii                  : std_logic_vector( 7 downto 0);
    signal ascii_press            : std_logic;
    signal ascii_release          : std_logic;
    --
    signal joystick_0             : std_logic_vector( 7 downto 0);
    signal joystick_1             : std_logic_vector( 7 downto 0);
    signal buttons                : std_logic_vector( 1 downto 0);
    --signal switches               : std_logic_vector( 1 downto 0);
    --
    --
    signal redz0mb1e_1_ramAddr      : std_logic_vector(15 downto 0);
    signal redz0mb1e_1_ramData_out  : std_logic_vector( 7 downto 0);
    signal redz0mb1e_1_ramCE_N      : std_logic;
    signal redz0mb1e_1_ramWe_N      : std_logic;
    signal redz0mb1e_1_ramOe_N      : std_logic;
    --
    signal sdram_din              : std_logic_vector(7 downto 0);
    signal sdram_dout             : std_logic_vector(7 downto 0);
    signal sdram_addr             : std_logic_vector(15 downto 0);
    --signal sdram_oe               : std_logic;
    signal sdram_wr               : std_logic;
    --
    signal status         : std_logic_vector(31 downto 0);
    -- user port (X4) signals
    signal redz0mb1e_1_x4_in      : std_logic_vector(7 downto 0);
    signal redz0mb1e_1_x4_out     : std_logic_vector(7 downto 0);
    --
    signal joystick_mode          : std_logic_vector( 1 downto 0);
    signal userport_sound         : std_logic;
    signal sound_out              : std_logic;
    -- extension signals
    signal clk_2MHz_4MHz          : std_logic;
    --
    signal data_io_index          : std_logic_vector(4 downto 0);
    signal data_io_inst_download  : std_logic;
    signal data_io_inst_wr        : std_logic;
    signal data_io_inst_addr      : std_logic_vector(24 downto 0);
    signal data_io_inst_data      : std_logic_vector(7 downto 0);
    --
    signal hs_decode_download     : std_logic;
    signal hs_decode_wr           : std_logic;
    signal hs_decode_addr         : std_logic_vector(15 downto 0);
    signal hs_decode_data         : std_logic_vector(7 downto 0);
    --
    signal hs_show_message        : std_logic; 
    signal hs_message_en          : std_logic; 
    signal hs_message             : character;
    signal hs_message_restart     : std_logic;
    signal hs_autostart_addr      : std_logic_vector(15 downto 0);
    signal hs_autostart_en        : std_logic;
    --
    signal as_active              : std_logic;
    signal as_ascii               : std_logic_vector( 7 downto 0);
    signal as_press               : std_logic;
    signal as_release             : std_logic;
    --
    signal sys_ascii              : std_logic_vector( 7 downto 0);
    signal sys_press              : std_logic;
    signal sys_release            : std_logic;
    --
    signal color_foreground       : std_logic_vector( 2 downto 0);
    signal color_background       : std_logic_vector( 2 downto 0);
    --                            
    signal sys_red                : std_logic;
    signal sys_green              : std_logic;
    signal sys_blue               : std_logic;
    signal sys_hsync              : std_logic;
    signal sys_vsync              : std_logic;
    --
    signal scanline_red_out       : std_logic_vector( 5 downto 0);
    signal scanline_green_out     : std_logic_vector( 5 downto 0);
    signal scanline_blue_out      : std_logic_vector( 5 downto 0);
    signal scanline_hsync_out     : std_logic;
    signal scanline_vsync_out     : std_logic;
    --
    signal onlinehelp_red_out     : std_logic_vector( 5 downto 0);
    signal onlinehelp_green_out   : std_logic_vector( 5 downto 0);
    signal onlinehelp_blue_out    : std_logic_vector( 5 downto 0);
    signal onlinehelp_hsync_out   : std_logic;
    signal onlinehelp_vsync_out   : std_logic;

    -- select the global clock source
    signal pll_locked   : std_logic;


begin

    -- default outputs
    uart_tx         <= uart_rx;
    test_point_tp1  <= uart_rx when rising_edge( CLOCK_27);


    -- generate all necessary clocks
    altpll0_inst: entity work.altpll0
    port map
    (
        inclk0   => CLOCK_27,      -- 27 MHz
        locked   => pll_locked,
      --  c0       => clk_32Mhz,    -- 32 MHz, -2.5 ns (was: 50MHz), sdram
        c1       => video_clk,    -- 40 MHz, SVGA 800x600@60Hz
        c2       => cpu_clk_fast, --  4 MHz
        c3       => cpu_clk_slow--, --  2 MHz
      --  c4       => ram_clk       -- 32 MHz
    );

    ------------------------------------
    -- switch for cpu clk
    -- activate 4 MHz also for downloading software to memory
    cpu_clk <= cpu_clk_slow when clk_2MHz_4MHz = '0' and data_io_inst_download = '0'  else cpu_clk_fast;


    ------------------------------------
    -- reset generator
    --
    process
    begin
        wait until rising_edge( cpu_clk);

        if reset_counter > 0 then
            reset_counter   <= reset_counter - 1;
        else
            sys_reset       <= '0';
        end if;

        -- all reset sources:
        if( user_io_status( reset_bit) = '1')                                   -- menu reset
            or ( user_io_status( uc_reset_bit) = '1')                           -- arm uc
            or ( reset_n = '0')                                                 -- reset button S2 / JTAG reset line
            or buttons(1)                                            -- right device button
            or ( pll_locked = '0')
            or ( data_io_inst_download = '1' and unsigned( data_io_index) = 0)  -- download possible ROM image
        then
            reset_counter   <= 255;
            sys_reset       <= '1';
        end if;

    end process;
    sys_reset_n <= not sys_reset;


    -- visual check the clock on LED
    clock_blink_cpuclk: entity support.clock_blink
    generic map 
    (
        g_ticks_per_sec => 4_000_000
    )
    port map
    (
        clk     => cpu_clk_slow,
        blink_o => LED
    );


    -- convert ps2 scancode to ascii
    -- bits 7..0 are scancode 8:'1' key pressed, '0' -> key released
    scancode_ascii_inst: entity support.scancode_ascii 
    port map
    (
        clk                   => cpu_clk,               -- : in    std_logic;
        --
        scancode              => scancode,              -- : in    std_logic_vector( 7 downto 0);
        scancode_en           => scancode_en,           -- : in    std_logic;
        --
        layout_select         => user_io_status( keyboard_bit), -- : in    std_logic   -- 0 = en, 1 = de
        --
        ascii                 => ascii,                 -- : out   std_logic_vector( 7 downto 0);
        ascii_press           => ascii_press,           -- : out   std_logic;
        ascii_release         => ascii_release          -- : out   std_logic
    );
    

    ------------------------------------
    -- multiplex between keyboard inputs
    --
    sys_ascii   <= as_ascii     when as_active else ascii;
    sys_press   <= as_press     when as_active else ascii_press;
    sys_release <= as_release   when as_active else ascii_release;


    ------------------------------------
    -- redzomb1e
    --
    redz0mb1e_1 : entity work.redz0mb1e
    port map (
        -- system
     	reset_n               => sys_reset_n,               -- : in std_logic;
        --
        cpu_clk               => cpu_clk,                   -- : in std_logic;
        cpu_hold_n            => not( hs_decode_download),  -- : in std_logic;
        video_clk             => video_clk,                 -- : in std_logic;
        -- ascii from keyboard or serial line
        ascii                 => sys_ascii,                 -- : in std_logic_vector( 7 downto 0);
        ascii_press           => sys_press,                 -- : in std_logic;
        ascii_release         => sys_release,               -- : in std_logic;
        -- VGA                
        red_o                 => sys_red,
        blue_o                => sys_blue,
        green_o               => sys_green,
        vsync_o               => sys_vsync,                 -- check polarity
        hsync_o               => sys_hsync,
        -- color selection (original is white on black)
        col_fg                => color_foreground,          -- white
        col_bg                => color_background,          -- black
        -- SRAM interface
        ramAddr	              => redz0mb1e_1_ramAddr,       -- : out   std_logic_vector(15 downto 0);
        ramData_in            => sdram_dout,                -- : in    std_logic_vector(7 downto 0);
        ramData_out           => redz0mb1e_1_ramData_out,   -- : out   std_logic_vector(7 downto 0);
        ramOe_N	              => redz0mb1e_1_ramOe_N,       -- : out   std_logic; 
        --ramCE_N	              => redz0mb1e_1_ramCE_N,       -- : out   std_logic;
        ramWe_N	              => redz0mb1e_1_ramWe_N,       -- : out   std_logic
        -- user port (PIO port A) for joystick
        x4_in                 => redz0mb1e_1_x4_in,         -- : in    std_logic_vector(7 downto 0);
        x4_out                => redz0mb1e_1_x4_out,        -- : out   std_logic_vector(7 downto 0)
        --
        sound_out             => sound_out,                 -- : out std_logic;
        -- PETERS extension
        clk_2MHz_4MHz         => clk_2MHz_4MHz              -- : out std_logic
    );      


    ------------------------------------
    -- color selector
    --
    color_foreground <= "111" when user_io_status( color_bit) = '0' else "110";
    color_background <= "000" when user_io_status( color_bit) = '0' else "001";


    ------------------------------------
    -- sdram arbiter
    --
    sdram_din   <= redz0mb1e_1_ramData_out   when hs_decode_download = '0' else hs_decode_data;
    sdram_addr  <= redz0mb1e_1_ramAddr       when hs_decode_download = '0' else hs_decode_addr;
    sdram_wr    <= not( redz0mb1e_1_ramWe_N) when hs_decode_download = '0' else hs_decode_wr;
   -- sdram_oe    <= not( redz0mb1e_1_ramOe_N) when hs_decode_download = '0' else '1'; -- write only
   

    ------------------------------------
    -- internal block RAM, with load function
    -- size:    32k
    -- offset:  0x0000
    --
    ram : block is
        constant size   : natural := 32768;
        constant offset : natural := 0;
        type ram_type is array ( 0 to size - 1) of std_logic_vector( sdram_din'range);
        signal ram  : ram_type;
    begin

        process
        begin
            wait until rising_edge( cpu_clk);
            if sdram_wr = '1' then
                ram( to_integer( unsigned( sdram_addr))) <= sdram_din;
            end if;
            if unsigned( sdram_addr) < size then
                sdram_dout <= ram( to_integer( unsigned( sdram_addr)));
            else
                sdram_dout <= ( others => 'Z');
            end if;
        end process;

    end block ram;
    
    -- disable external dram
    dram_cs_n   <= '1';
    dram_we_n   <= '1';
    dram_ras_n  <= '1';
    dram_cas_n  <= '1';
    -- reduce simulation warnings about missing drivers
    dram_dq     <= ( others => 'Z');
    dram_a      <= ( others => 'Z');
    dram_clk    <= '0';
    dram_dqm    <= ( others => 'Z');
    dram_ba     <= ( others => 'Z');
   

    ------------------------------------
    -- connect joystick to user port X4
    --
    joystick_mode   <= user_io_status( joystick2_bit) & user_io_status( joystick_bit);

    joystick_emu_inst: entity work.joystick_emu
    port map (
        mode            => joystick_mode,       -- : in  std_logic_vector( 1 downto 0);
        --
        joystick_0      => joystick_0,          -- : in  std_logic_vector( 7 downto 0);
        joystick_1      => joystick_1,          -- : in  std_logic_vector( 7 downto 0);
        --
        userport_out    => redz0mb1e_1_x4_out,  -- : in  std_logic_vector( 7 downto 0); -- from PIO
        userport_in     => redz0mb1e_1_x4_in,   -- : out std_logic_vector( 7 downto 0); -- to   PIO
        --
        sound           => userport_sound       -- : out std_logic; 
    );


    ------------------------------------
    -- audio output
    -- from tape out and/or user port
    --
    AUDIO_L  <= sound_out or userport_sound;
    AUDIO_R  <= sound_out or userport_sound;

    
    ------------------------------------
    -- io-module via arm controller
    --
    user_io_inst : user_io
    generic map
    (
        strlen         => config_str'length
    )
    port map
    (
        conf_str       => string_to_slv( config_str),
        -- external interface
        spi_clk        => SPI_SCK,
        spi_ss_io      => conf_data0,
        spi_miso       => SPI_DO,
        spi_mosi       => SPI_DI,
        --
		status         => status,
        --
        -- internal interfaces
        joystick_0     => joystick_0,          -- : out std_logic_vector( 7 downto 0);
        joystick_1     => joystick_1,          -- : out std_logic_vector( 7 downto 0);
        buttons        => buttons,             -- : out std_logic_vector( 1 downto 0);
        --switches       => switches,            -- : out std_logic_vector( 1 downto 0);
        -- connection to sd card emulation
		sd_lba         => ( others => '0'),    -- : in  std_logic_vector( 31 downto 0);
		sd_rd          => '0',                 -- : in  std_logic;
		sd_wr          => '0',                 -- : in  std_logic;
		sd_ack         => open,                -- : out std_logic;
		sd_conf        => '0',                 -- : in  std_logic;
		sd_sdhc        => '0',                 -- : in  std_logic;
		sd_dout        => open,                -- : out std_logic_vector( 7 downto 0); -- valid on rising edge of sd_dout_strobe
		sd_dout_strobe => open,                -- : out std_logic;
		sd_din         => ( others => '0'),    -- : in  std_logic_vector( 7 downto 0);
		sd_din_strobe  => open,                -- : out std_logic;
		-- ps2 keyboard emulation
		ps2_clk        => '0',                 -- : in  std_logic; -- 12-16khz provided by core
		ps2_kbd_clk    => open,                -- : out std_logic;
		ps2_kbd_data   => open,                -- : out std_logic;
		ps2_mouse_clk  => open,                -- : out std_logic;
		ps2_mouse_data => open,                -- : out std_logic;
		-- serial com port, not used jet 
		serial_data    => ( others => '0'),    -- : in  std_logic_vector( 7 downto 0);
		serial_strobe  => '0',                 -- : in  std_logic
        --
        -- FPGA clk domain
        clk            => cpu_clk,             -- : in  std_logic;
        -- ps2 keyboard scancodes
        scancode       => scancode,            -- : out std_logic_vector( 7 downto 0);
        scancode_en    => scancode_en          -- : out std_logic
    );
    
    
    data_io_inst : data_io 
    port map
    (
        -- io controller spi interface
        sck         => SPI_SCK,               -- : in    std_logic;
        ss          => SPI_SS2,               -- : in    std_logic;
        sdi         => SPI_DI,                -- : in    std_logic;
        downloading => data_io_inst_download, -- : out   std_logic;                     -- signal indication an active download
        index       => data_io_index,         -- : out   std_logic_vector(4 downto 0);  -- menu index used to upload the file
        -- external ram interface
        clk         => cpu_clk,               -- : in    std_logic;
        wr          => data_io_inst_wr,       -- : out   std_logic;
        addr        => data_io_inst_addr,     -- : out   std_logic_vector(24 downto 0);
        data        => data_io_inst_data      -- : out   std_logic_vector(7 downto 0)
    );
    
    
    ------------------------------------
    -- decode z80 (headersave) files
    -- to bring them to the right memory address
    --
    headersave_decode_inst : entity support.headersave_decode
    port map
    (
        clk                 => cpu_clk,                 -- : in    std_logic;
        -- interface from data_io                   
        downloading         => data_io_inst_download,   -- : in    std_logic;    -- signal indication an active download
        wr                  => data_io_inst_wr,         -- : in    std_logic;
        addr                => data_io_inst_addr,       -- : in    std_logic_vector(24 downto 0);
        data                => data_io_inst_data,       -- : in    std_logic_vector(7 downto 0);
        -- interface to memory
        downloading_out     => hs_decode_download,      -- : out   std_logic;
        wr_out              => hs_decode_wr,            -- : out   std_logic;
        addr_out            => hs_decode_addr,          -- : out   std_logic_vector(15 downto 0);
        data_out            => hs_decode_data,          -- : out   std_logic_vector(7 downto 0)
        -- interface to message display
        show_message        => hs_show_message,         -- : out   std_logic;    -- enable or disable message display
        message_en          => hs_message_en,           -- : out   std_logic;    -- 0->1 take new message character
        message             => hs_message,              -- : out   character;
        message_restart     => hs_message_restart,      -- : out   std_logic     -- restart with new message
        -- autostart support signals
        autostart_addr      => hs_autostart_addr,       -- : out   std_logic_vector(15 downto 0);
        autostart_en        => hs_autostart_en          -- : out   std_logic     -- start signal
    );
    

    ------------------------------------
    -- auto starter for loaderd programs
    -- emulate 'J xxxx' on keyboard
    --
    auto_start_inst: entity support.auto_start
    port map
    (
        clk                 => cpu_clk,                 -- : in    std_logic;
        enable              => not( user_io_status( autostart_bit)), -- : in    std_logic;
        -- 
        autostart_addr      => hs_autostart_addr,       -- : in    std_logic_vector(15 downto 0);
        autostart_en        => hs_autostart_en,         -- : in    std_logic;    -- start signal
        -- emulated keypresses
        active              => as_active,               -- : out   std_logic;
        ascii               => as_ascii,                -- : out   std_logic_vector( 7 downto 0);
        ascii_press         => as_press,                -- : out   std_logic;
        ascii_release       => as_release               -- : out   std_logic
    );
    

    ------------------------------------
    -- additional fancy video overlays
    -- (scanlines, osd and online_help)
    --
    scanline_inst : entity overlay.scanline
    port map
    (
        active      => not( user_io_status( scanline_bit)), -- : in  std_logic;
        pixel_clock => video_clk,              -- : in  std_logic;
        -- input signals
        red         => (others => sys_red),    -- : in  std_logic_vector( 5 downto 0);
        green       => (others => sys_green),  -- : in  std_logic_vector( 5 downto 0);
        blue        => (others => sys_blue),   -- : in  std_logic_vector( 5 downto 0);
        hsync       => sys_hsync,              -- : in  std_logic;
        vsync       => sys_vsync,              -- : in  std_logic;
        -- output signals
        red_out     => scanline_red_out,       -- : out std_logic_vector( 5 downto 0);
        green_out   => scanline_green_out,     -- : out std_logic_vector( 5 downto 0);
        blue_out    => scanline_blue_out,      -- : out std_logic_vector( 5 downto 0);
        hsync_out   => scanline_hsync_out,     -- : out std_logic;
        vsync_out   => scanline_vsync_out      -- : out std_logic
    );


    online_help_inst : entity overlay.online_help
	generic map
	(
		init_message	=> init_message
	)
    port map
    (
        active          => user_io_status(10), -- : in  std_logic;
        pixel_clock     => video_clk,              -- : in  std_logic;
        -- input signals
        red             => scanline_red_out,       -- : in  std_logic_vector( 5 downto 0);
        green           => scanline_green_out,     -- : in  std_logic_vector( 5 downto 0);
        blue            => scanline_blue_out,      -- : in  std_logic_vector( 5 downto 0);
        hsync           => scanline_hsync_out,     -- : in  std_logic;
        vsync           => scanline_vsync_out,     -- : in  std_logic;
        -- message stuff
        show_message    => hs_show_message,        -- : in  std_logic;    -- enable or disable message display
        message_en      => hs_message_en,          -- : in  std_logic;    -- 0->1 take new message character
        message         => hs_message,             -- : in  character;
        message_restart => hs_message_restart,     -- : in  std_logic;    -- restart with new message
        -- output signals
        red_out         => onlinehelp_red_out,     -- : out std_logic_vector( 5 downto 0);
        green_out       => onlinehelp_green_out,   -- : out std_logic_vector( 5 downto 0);
        blue_out        => onlinehelp_blue_out,    -- : out std_logic_vector( 5 downto 0);
        hsync_out       => onlinehelp_hsync_out,   -- : out std_logic;
        vsync_out       => onlinehelp_vsync_out    -- : out std_logic
    );


    osd_inst: osd
    port map
    (
        -- OSDs pixel clock
	    pclk           => video_clk,           -- : in  std_logic;
        -- SPI interface                       -- 
		sck            => spi_sck,             -- : in  std_logic;
		ss             => spi_ss3,             -- : in  std_logic;
		sdi            => spi_di,              -- : in  std_logic;
		-- VGA signals coming from core
		red_in         => onlinehelp_red_out,    -- : in  std_logic_vector( 5 downto 0);
		green_in       => onlinehelp_green_out,  -- : in  std_logic_vector( 5 downto 0);
		blue_in        => onlinehelp_blue_out,   -- : in  std_logic_vector( 5 downto 0);
        hs_in          => onlinehelp_hsync_out,  -- : in  std_logic;
        vs_in          => onlinehelp_vsync_out,  -- : in  std_logic;
		-- VGA signals going to video connector
		red_out        => VGA_R,             -- : out std_logic_vector( 5 downto 0);
		green_out      => VGA_G,           -- : out std_logic_vector( 5 downto 0);
		blue_out       => VGA_B,            -- : out std_logic_vector( 5 downto 0);
        hs_out         => VGA_HS,           -- : out std_logic;
        vs_out         => VGA_VS            -- : out std_logic
    );

end architecture rtl;

