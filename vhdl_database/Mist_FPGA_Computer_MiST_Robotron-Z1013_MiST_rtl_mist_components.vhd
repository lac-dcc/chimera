----------------------------------------------------------------------------------
-- helper package for access to (mist) verilog modules (Z1013 mist project)
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

package mist_components is


    ------------------------------------------------------------ 
    -- component declarations (needed for verilog imports)
    ------------------------------------------------------------ 
    component user_io is
    generic
    (
        strlen              : integer := 0
    );                       
    port                    
    (                       
        -- config string
    	conf_str            : in  std_logic_vector(( 8 * STRLEN) - 1 downto 0);
        -- external interface
    	SPI_CLK             : in  std_logic;
    	SPI_SS_IO           : in  std_logic;
    	SPI_MISO            : out std_logic;
    	SPI_MOSI            : in  std_logic;
        -- internal interfaces
    	joystick_0          : out std_logic_vector( 7 downto 0);
    	joystick_1          : out std_logic_vector( 7 downto 0);
    	joystick_analog_0   : out std_logic_vector( 15 downto 0);
    	joystick_analog_1   : out std_logic_vector( 15 downto 0);
    	buttons             : out std_logic_vector( 1 downto 0);
    	switches            : out std_logic_vector( 1 downto 0);
        --
    	status              : out std_logic_vector( 31 downto 0);
        -- connection to sd card emulation
    	sd_lba              : in  std_logic_vector( 31 downto 0);
    	sd_rd               : in  std_logic;
    	sd_wr               : in  std_logic;
    	sd_ack              : out std_logic;
    	sd_conf             : in  std_logic;
    	sd_sdhc             : in  std_logic;
    	sd_dout             : out std_logic_vector( 7 downto 0); -- valid on rising edge of sd_dout_strobe
    	sd_dout_strobe      : out std_logic;
    	sd_din              : in  std_logic_vector( 7 downto 0);
    	sd_din_strobe       : out std_logic;
    	-- ps2 keyboard emulation
    	ps2_clk             : in  std_logic; -- 12-16khz provided by core
    	ps2_kbd_clk         : out std_logic;
    	ps2_kbd_data        : out std_logic;
    	ps2_mouse_clk       : out std_logic;
    	ps2_mouse_data      : out std_logic;
    	-- serial com port 
    	serial_data         : in  std_logic_vector( 7 downto 0);
        serial_strobe       : in  std_logic;
        --
        -- FPGA clk domain
        clk                 : in  std_logic;
        -- ps2 keyboard scancodes
        scancode            : out std_logic_vector( 7 downto 0);
        scancode_en         : out std_logic
    );
    end component user_io;


    component osd is
    port
    (
        -- OSDs pixel clock
	pclk                : in  std_logic;
        -- SPI interface
        sck                 : in  std_logic;
        ss                  : in  std_logic;
        sdi                 : in  std_logic;
        -- VGA signals coming from core
        red_in              : in  std_logic_vector( 5 downto 0);
        green_in            : in  std_logic_vector( 5 downto 0);
        blue_in             : in  std_logic_vector( 5 downto 0);
        hs_in               : in  std_logic;
        vs_in               : in  std_logic;
        -- VGA signals going to video connector
        red_out             : out std_logic_vector( 5 downto 0);
        green_out           : out std_logic_vector( 5 downto 0);
        blue_out            : out std_logic_vector( 5 downto 0);
        hs_out              : out std_logic;
        vs_out              : out std_logic
    );
    end component osd;


    component sdram is
    port
    (
        -- interface to the MT48LC16M16 chip
        sd_data : inout std_logic_vector(15 downto 0);  -- 16 bit bidirectional data bus
        sd_addr : out   std_logic_vector(12 downto 0);  -- 13 bit multiplexed address bus
        sd_dqm  : out   std_logic_vector(1 downto 0);   -- two byte masks
        sd_ba   : out   std_logic_vector(1 downto 0);   -- two banks
        sd_cs   : out   std_logic;                      -- a single chip select
        sd_we   : out   std_logic;                      -- write enable
        sd_ras  : out   std_logic;                      -- row address select
        sd_cas  : out   std_logic;                      -- columns address select
            -- system interface
        init    : in    std_logic;                      -- init signal after FPGA config to initialize RAM
        clk     : in    std_logic;                      -- sdram is accessed at up to 128MHz
        clkref  : in    std_logic;                      -- reference clock to sync to
        -- cpu/chipset interface
        din     : in    std_logic_vector(7 downto 0); 	-- data input from chipset/cpu
        dout    : out   std_logic_vector(7 downto 0);  	-- data output to chipset/cpu
        addr    : in    std_logic_vector(24 downto 0);  -- 25 bit byte address
        oe      : in    std_logic;		        -- cpu/chipset requests read
        we      : in    std_logic 		        -- cpu/chipset requests write
    );
    end component sdram;


    component data_io is
    port
    (
        -- io controller spi interface
        sck             : in    std_logic;
        ss              : in    std_logic;
        sdi             : in    std_logic;
        downloading     : out   std_logic;              -- signal indication an active download
        index           : out   std_logic_vector(4 downto 0); -- menu index used to upload the file
        -- external ram interface
        clk             : in    std_logic;
        wr              : out   std_logic;
        addr            : out   std_logic_vector(24 downto 0);
        data            : out   std_logic_vector(7 downto 0)
    );
    end component data_io;


end package mist_components;

