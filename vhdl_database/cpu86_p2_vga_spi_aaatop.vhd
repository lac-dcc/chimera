----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:25 02/11/2015 
-- Design Name: 
-- Module Name:    aaatop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

----------------------------------------------------------------------------------
-- LED example, by Jerome Cornet
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
 
library UNISIM;
use UNISIM.vcomponents.all;
 
entity Aaatop is
Port (
	CLK,reset : in  STD_LOGIC;
	tx : inout std_logic;
	rx : in std_logic;
	
	ARDUINO_RESET : out  STD_LOGIC;
	DUO_SW1 : in  STD_LOGIC;
--	DUO_LED : out std_logic;
			 
	sram_addr : out std_logic_vector(20 downto 0);
	sram_data : inout std_logic_vector(7 downto 0);
	sram_ce : out std_logic;
	sram_we : out std_logic;
	sram_oe : out std_logic;

	SD_MISO : in std_logic;
	SD_MOSI : out std_logic;
	SD_SCK : out std_logic;
	SD_nCS : out std_logic;
	
	SW_LEFT : in  STD_LOGIC;
    SW_UP : in  STD_LOGIC;
    SW_DOWN : in  STD_LOGIC;
    SW_RIGHT : in  STD_LOGIC;

    LED1 : inout  STD_LOGIC;
    LED2 : inout  STD_LOGIC;
    LED3 : inout  STD_LOGIC;
    LED4 : inout  STD_LOGIC;

	VGA_HSYNC : out  STD_LOGIC;
    VGA_VSYNC : out  STD_LOGIC;
    VGA_BLUE : out std_logic_vector(3 downto 0);
    VGA_GREEN : out std_logic_vector(3 downto 0);
    VGA_RED : out std_logic_vector(3 downto 0)

--    Arduino : inout  STD_LOGIC_VECTOR (21 downto 0)
--	Arduino : inout  STD_LOGIC_VECTOR (53 downto 0)
);
end Aaatop;
 
architecture Behavioral of Aaatop is
   signal   CLOCK_40MHZ :     std_logic;
   signal   CTS         :      std_logic  := '1';
   signal   PIN3        :      std_logic;
   signal   LED1P        :     std_logic;
   signal   LED2N       :     std_logic;
   signal   LED3N       :     std_logic;
   signal   PIN4        :     std_logic;
   signal   RTS         :     std_logic;

signal    vramaddr : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal    vramdata : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal pixel_x, pixel_y: std_logic_vector(9 downto 0);
signal clock, video_on, pixel_tick: std_logic;
signal rgb_reg, rgb_next: std_logic_vector(2 downto 0);
signal hsync, vsync: std_logic;
signal rgb: std_logic_vector(2 downto 0);
signal buttons: std_logic_vector(3 downto 0);
signal leds: std_logic_vector(3 downto 0);

begin

	CTS <= '1';
--	PIN3 <= not Arduino(40); -- por
--	PIN3 <= reset; -- por
	PIN3 <= '1'; -- por

--	Arduino(38) <= Arduino(40);
--	Arduino(42) <= Arduino(44);
--	Arduino(46) <= Arduino(48);
--	Arduino(50) <= Arduino(52);
--	Arduino(38) <= LED1;
--	Arduino(42) <= LED2N;
--	Arduino(46) <= LED3N;
--	Arduino(50) <= '0';

--	sram_addr <= (others => '0');
--	sram_ce <= '0';
--	sram_we <= '0';
--	sram_oe <= '0';
	drigmorn1_top0: ENTITY work.drigmorn1_top
   PORT map( 
		sram_addr => sram_addr,
		sram_data => sram_data,
		sram_ce => sram_ce,
		sram_we => sram_we,
		sram_oe => sram_oe,
		vramaddr => vramaddr,
		vramdata => vramdata,
		spi_cs => SD_nCS,
		spi_clk => SD_SCK,
		spi_mosi => SD_MOSI,
		spi_miso => SD_MISO,
		buttons => buttons,
		leds => leds,

      CLOCK_40MHZ => CLOCK_40MHZ,
      CTS => CTS,
      PIN3 => PIN3,
      RXD => RX,
      LED1 => LED1P,
      LED2N => LED2N,
      LED3N => LED3N,
      PIN4 => PIN4,
      RTS => RTS,
      TXD => TX
   );
	dcm0: entity work.clk32to40
  port map
   (-- Clock in ports
    CLK_IN1 => clk,
    -- Clock out ports
    CLK_OUT1 => CLOCK_40MHZ,
    CLK_OUT2 => clock
	 );

    -- VGA signals
    vga_sync_unit: entity work.vga_sync
        port map(
            clock => clock,
            reset => reset,
            hsync => hsync,
            vsync => vsync,
            video_on => video_on,
            pixel_tick => pixel_tick,
            pixel_x => pixel_x,
            pixel_y => pixel_y
        );
	 -- font generator
    font_gen_unit: entity work.font_generator
        port map(
            clock => pixel_tick,
				vramaddr => vramaddr,
				vramdata => vramdata,
            video_on => video_on,
            pixel_x => pixel_x,
            pixel_y => pixel_y,
            rgb_text => rgb_next
        );
	ARDUINO_RESET <= not(DUO_SW1);
    buttons <= sw_left & sw_right & sw_up & sw_down;
    led1 <= leds(0);
    led2 <= leds(1);
    led3 <= leds(2);
    led4 <= leds(3);

    -- rgb buffer
    process(clock)
    begin
        if clock'event and clock = '1' then
            if pixel_tick = '1' then
                rgb_reg <= rgb_next;
            end if;
        end if;
    end process;

    rgb <= rgb_reg;
    vga_hsync <= hsync;
    vga_vsync <= vsync;
    vga_blue <= (others => rgb(0));--blue
    vga_green <= (others => rgb(1));--green
    vga_red <= (others => rgb(2));--red
end Behavioral;
