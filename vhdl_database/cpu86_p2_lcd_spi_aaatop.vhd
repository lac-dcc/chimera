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
	txd : inout std_logic;
	rxd : in std_logic;
	
	ARD_RESET : out  STD_LOGIC;
	DUO_SW1 : in  STD_LOGIC;
--	DUO_LED : out std_logic;
			 
	sram_addr : out std_logic_vector(20 downto 0);
	sram_data : inout std_logic_vector(7 downto 0);
	sram_ce : out std_logic;
	sram_we : out std_logic;
	sram_oe : out std_logic;
	
    W1A : inout  STD_LOGIC_VECTOR (7 downto 0);
    W1B : inout  STD_LOGIC_VECTOR (7 downto 0);
    W2C : inout  STD_LOGIC_VECTOR (15 downto 0);
    W2D : inout  STD_LOGIC_VECTOR (15 downto 0);

    Arduino : inout  STD_LOGIC_VECTOR (21 downto 0)
--	Arduino : inout  STD_LOGIC_VECTOR (53 downto 0)
);
end Aaatop;
 
architecture Behavioral of Aaatop is
signal   CLOCK_40MHZ :     std_logic;
signal   CTS         :      std_logic  := '1';
signal   PIN3        :      std_logic;
signal   LED1        :     std_logic;
signal   LED2N       :     std_logic;
signal   LED3N       :     std_logic;
signal   PIN4        :     std_logic;
signal   RTS         :     std_logic;

signal SD_MISO : std_logic;
signal SD_MOSI : std_logic;
signal SD_SCK : std_logic;
signal SD_nCS : std_logic;

signal buttons : std_logic_vector(5 downto 0);
signal audio_left : STD_LOGIC;
signal audio_right : STD_LOGIC;
signal ud : STD_LOGIC;
signal rl : STD_LOGIC;
signal enab : STD_LOGIC;
signal vsync : STD_LOGIC;
signal hsync : STD_LOGIC;
signal ck : STD_LOGIC;
signal r : std_logic_vector(5 downto 0);
signal g : std_logic_vector(5 downto 0);
signal b : std_logic_vector(5 downto 0);
signal    vramaddr : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal    vramdata : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal spi_clk : std_logic := '1';
    signal spi_csn : std_logic := '1';
    signal spi_mosi : std_logic := '1';
    signal spi_miso : std_logic := '1';
signal buttons2 : STD_LOGIC_VECTOR (3 downto 0);
signal leds : STD_LOGIC_VECTOR (3 downto 0);

component clk32to40
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic
 );
end component;
begin
  ARD_RESET <= not(DUO_SW1);

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
	drigmorn1_top0 : entity work.drigmorn1_top
   PORT map( 
		sram_addr => sram_addr,
		sram_data => sram_data,
		sram_ce => sram_ce,
		sram_we => sram_we,
		sram_oe => sram_oe,
		vramaddr => vramaddr,
		vramdata => vramdata,
		spi_cs => spi_csn,
		spi_clk => spi_clk,
		spi_mosi => spi_mosi,
		spi_miso => spi_miso,
		buttons => buttons2,
		leds => leds,
	
      CLOCK_40MHZ => CLOCK_40MHZ,
      CTS => CTS,
      PIN3 => PIN3,
      RXD => RXD,
      LED1 => LED1,
      LED2N => LED2N,
      LED3N => LED3N,
      PIN4 => PIN4,
      RTS => RTS,
      TXD => TXD
   );
	dcm0: clk32to40
  port map
   (-- Clock in ports
    CLK_IN1 => clk,
    -- Clock out ports
    CLK_OUT1 => CLOCK_40MHZ);

    winglcd0 : entity work.winglcdsndbut Port map(
            W1A => w2c,
         W1B => w2d,
            buttons => buttons,
            audio_left => audio_left,
         audio_right => audio_right,
            ud => ud,
            rl => rl,
            enab => enab,
            vsync => vsync,
            hsync => hsync,
            ck => ck,
            r => r,
            g => g,
            b => b
        );
    w1a(0) <= vsync;
    w1a(5) <= hsync;
    w1a(7) <= r(0);
    lcdctl0 : entity work.lcdctl Port map(
            clk => CLOCK_40MHZ,
--            clk => clk,
            reset=>reset,
	vramaddr => vramaddr,
   vramdata => vramdata,
            ud => ud,
            rl => rl,
            enab => enab,
            vsync => vsync,
            hsync => hsync,
            ck => ck,
            r => r,
            g => g,
            b => b
    );

    --microSDwing
--0 not used in SPI
--1 MISO
--2 SCK
--3 MOSI
--4 CSN
    spi_miso <= w1a(1);
    w1a(2) <= spi_clk;
    w1a(3) <= spi_mosi;
    w1a(4) <= spi_csn;
	butled1: entity work.wingbutled
	Port map (
		io => w1b,
		buttons => buttons2,
		leds => leds
	);
--	leds <= buttons2;
end Behavioral;
