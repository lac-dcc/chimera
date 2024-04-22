----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:33:02 07/30/2013 
-- Design Name: 
-- Module Name:    logibone_wishbone - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;

entity logi_edu_test is
port( 

		OSC_FPGA : in std_logic;

		--onboard
		PB : in std_logic_vector(1 downto 0);
		--SW : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);	
		
		PMOD4 : inout std_logic_vector(7 downto 0); 
		
		PMOD3 : inout std_logic_vector(7 downto 0); 
		
		PMOD2 : inout std_logic_vector(7 downto 0); 
		
		PMOD1 : inout std_logic_vector(7 downto 0); 
		--i2c
		SYS_SCL, SYS_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, RP_SPI_CE0N, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic
);
end logi_edu_test;

architecture Behavioral of logi_edu_test is

	component clock_gen
	port
	(-- Clock in ports
		CLK_IN1           : in     std_logic;
		-- Clock out ports
		CLK_OUT1          : out    std_logic;
		CLK_OUT2          : out    std_logic;
		-- Status and control signals
		LOCKED            : out    std_logic
	);
	end component;
	
	component sound_440 is
		generic(clk_freq_hz : positive := 100_000_000);
		port(
		clk, reset : in std_logic ;
		sound_out : out std_logic 
		);
	end component;
	
	component vga_sync is
   port(
      clk, reset: in std_logic;
      hsync, vsync: out std_logic;
      video_on, p_tick: out std_logic;
      pixel_x, pixel_y: out std_logic_vector (9 downto 0)
    );
	end component;

	component vga_bar_top is
	generic (COLOR_GRAY_SEL : std_logic := '1'); --color = 0 , gray = 1
	port (
		clk: in std_logic;		
		hsync, vsync: out  std_logic;
		red: out std_logic_vector(2 downto 0);
		green: out std_logic_vector(2 downto 0);
		blue: out std_logic_vector(2 downto 0)
	);
	end component;

	-- syscon
	signal gls_reset, gls_resetn,gls_clk, clock_locked : std_logic ;
	signal clk_100Mhz, clk_50Mhz, vga_clk : std_logic ;

	-- wishbone intercon signals
	signal intercon_wrapper_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_strobe :  std_logic;
	signal intercon_wrapper_wbm_write :  std_logic;
	signal intercon_wrapper_wbm_ack :  std_logic;
	signal intercon_wrapper_wbm_cycle :  std_logic;

	signal intercon_gpio0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_gpio0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_gpio0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_gpio0_wbm_strobe :  std_logic;
	signal intercon_gpio0_wbm_write :  std_logic;
	signal intercon_gpio0_wbm_ack :  std_logic;
	signal intercon_gpio0_wbm_cycle :  std_logic;
	
	signal intercon_sseg0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_sseg0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_sseg0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_sseg0_wbm_strobe :  std_logic;
	signal intercon_sseg0_wbm_write :  std_logic;
	signal intercon_sseg0_wbm_ack :  std_logic;
	signal intercon_sseg0_wbm_cycle :  std_logic;
	
	-- logic signals
	signal sseg_edu_cathode_out : std_logic_vector(4 downto 0);
	signal sseg_edu_anode_out : std_logic_vector(7 downto 0);
	
	-- vga signals
	signal vga_hsync, vga_vsync : std_logic ;
	signal vga_red, vga_green, vga_blue : std_logic_vector(2 downto 0);
	
	signal led_signal: std_logic_vector(1 downto 0);
	
begin


gls_reset <= (NOT clock_locked); -- system reset while clock not locked
gls_resetn <= NOT gls_reset ; -- for preipherals with active low reset

pll0 : clock_gen
  port map
   (-- Clock in ports
    CLK_IN1 => OSC_FPGA,
    -- Clock out ports
    CLK_OUT1 => clk_100Mhz,
	 CLK_OUT2 => clk_50Mhz,
    -- Status and control signals
    LOCKED => clock_locked
	 );

gls_clk <= clk_100Mhz;
vga_clk <= clk_50Mhz;


SYS_SCL <= 'Z' ;
SYS_SDA <= 'Z' ;

mem_interface0 : spi_wishbone_wrapper
		port map(
			-- Global Signals
			gls_reset => gls_reset,
			gls_clk   => gls_clk,
			
			-- SPI signals
			mosi => SYS_SPI_MOSI,
			miso => SYS_SPI_MISO,
			sck => SYS_SPI_SCK,
			ss => RP_SPI_CE0N,
			
			  -- Wishbone interface signals
			wbm_address    => intercon_wrapper_wbm_address,  	-- Address bus
			wbm_readdata   => intercon_wrapper_wbm_readdata,  	-- Data bus for read access
			wbm_writedata 	=> intercon_wrapper_wbm_writedata,  -- Data bus for write access
			wbm_strobe     => intercon_wrapper_wbm_strobe,                      -- Data Strobe
			wbm_write      => intercon_wrapper_wbm_write,                      -- Write access
			wbm_ack        => intercon_wrapper_wbm_ack,                      -- acknowledge
			wbm_cycle      => intercon_wrapper_wbm_cycle                       -- bus cycle in progress
			);

-- Intercon -----------------------------------------------------------
-- will be generated automatically in the future

intercon0 : wishbone_intercon
generic map(memory_map => 
(
"000000000000000X", -- gpio0
"00000000000001XX") -- sseg0
)
port map(
		gls_reset => gls_reset,
		gls_clk   => gls_clk,
	
		wbs_address    => intercon_wrapper_wbm_address,  	-- Address bus
		wbs_readdata   => intercon_wrapper_wbm_readdata,  	-- Data bus for read access
		wbs_writedata 	=> intercon_wrapper_wbm_writedata,  -- Data bus for write access
		wbs_strobe     => intercon_wrapper_wbm_strobe,     -- Data Strobe
		wbs_write      => intercon_wrapper_wbm_write,      -- Write access
		wbs_ack        => intercon_wrapper_wbm_ack,        -- acknowledge
		wbs_cycle      => intercon_wrapper_wbm_cycle,      -- bus cycle in progress
		
		-- Wishbone master signals
		wbm_address(0) => intercon_gpio0_wbm_address,
		wbm_address(1) => intercon_sseg0_wbm_address,
		
		wbm_writedata(0)  => intercon_gpio0_wbm_writedata,
		wbm_writedata(1)  => intercon_sseg0_wbm_writedata,
				
		wbm_readdata(0)  => intercon_gpio0_wbm_readdata,
		wbm_readdata(1)  => intercon_sseg0_wbm_readdata,	
			
		wbm_strobe(0)  => intercon_gpio0_wbm_strobe,
		wbm_strobe(1)  => intercon_sseg0_wbm_strobe,

		wbm_cycle(0)   => intercon_gpio0_wbm_cycle,
		wbm_cycle(1)   => intercon_sseg0_wbm_cycle,	
	
		wbm_write(0)   => intercon_gpio0_wbm_write,
		wbm_write(1)   => intercon_sseg0_wbm_write,	
	
		wbm_ack(0)      => intercon_gpio0_wbm_ack,
		wbm_ack(1)      => intercon_sseg0_wbm_ack		
	);
									      										  
-----------------------------------------------------------------------
--DNT: SIGNALS NOT USE IN LOOPBACK TESTS: VGA AND, PS2_2, SSEG 
--TO LOOPBACK TEST: PS2_1, NES, PWM
-- USE THIS GOOGLE DOC TO SORT BETWEEN FUNCITON, PMOD# https://docs.google.com/spreadsheet/ccc?key=0AhVVrYeO_MdEdElXNE1PSzNPNDMxc2lXYklURmplNFE&usp=sharing

--GPIO0 7:0 = PMOD1		--used on sseg and vga
--GPIO0 15:8 = PMOD2 	--used on sseg and vga
--GPIO1 7:0 = PMOD3		
--GPIO1 15:8 = PMOD4 
--SHORTS - PASS THROUGH CONNECTIONS ON PMOD PORT4
--pwm2 - pwm1 			= p4_0  - p4_4  
--nesclk - nes_data2 	= p4_1 - p4_3
--neslat - nes_data1  	= p4_2 - p4_7
--ps2clk_1 - ps2d_1		= p4_4 - p4_5
--SET SIDE 1 HIGH - CHECK SIDE 2


	 
gpio0 : wishbone_gpio
	 port map
	 (
			gls_reset => gls_reset,
			gls_clk   => gls_clk,

			wbs_address    => intercon_gpio0_wbm_address,  	
			wbs_readdata   => intercon_gpio0_wbm_readdata,  	
			wbs_writedata 	=> intercon_gpio0_wbm_writedata,  
			wbs_strobe     => intercon_gpio0_wbm_strobe,      
			wbs_write      => intercon_gpio0_wbm_write,    
			wbs_ack        => intercon_gpio0_wbm_ack,    
			wbs_cycle      => intercon_gpio0_wbm_cycle, 
			--MAP GPIO TO IO PI											 TEST1-OUT	TEST1-DIR EXPECT-PORT TEST1-REVERSE = INVERTED FROM TEST1
			gpio(7) =>PMOD4(7),		--NES_DATA1       PMOD4(7)		0			0				1
			gpio(6) =>PMOD4(6),		--PWM1            PMOD4(6)		0			0				1
			gpio(5) =>PMOD4(5),		--PS2D_1          PMOD4(5)		0			0				1
			gpio(4) =>PMOD4(4),		--PS2C_1          PMOD4(4)		1			1				0
			gpio(3) =>PMOD4(3),		--NES_DAT2        PMOD4(3)		0			0				1
			gpio(2) =>PMOD4(2),		--NES_LAT         PMOD4(2)		1			1				0
			gpio(1) => PMOD4(1),		--NES_CLK         PMOD4(1)		1			1				0	
			gpio(0) => PMOD4(0),			--PWM2            PMOD4(0)		1			1				0
			gpio(15 downto 8) => open			
		);
	
sseg0 : wishbone_7seg4x
	 port map
	 (
			gls_reset => gls_reset,
			gls_clk   => gls_clk,

			wbs_address    => intercon_sseg0_wbm_address,  	
			wbs_readdata   => intercon_sseg0_wbm_readdata,  	
			wbs_writedata 	=> intercon_sseg0_wbm_writedata,  
			wbs_strobe     => intercon_sseg0_wbm_strobe,      
			wbs_write      => intercon_sseg0_wbm_write,    
			wbs_ack        => intercon_sseg0_wbm_ack,    
			wbs_cycle      => intercon_sseg0_wbm_cycle, 
			
			sseg_cathode_out => sseg_edu_cathode_out,
			sseg_anode_out => sseg_edu_anode_out
	 );

	PMOD2(5) <= sseg_edu_cathode_out(0); -- cathode 0
	PMOD2(1) <= sseg_edu_cathode_out(1); -- cathode 1
	PMOD3(0) <= sseg_edu_cathode_out(2); -- cathode 2
	PMOD3(1) <= sseg_edu_cathode_out(3); -- cathode 3
	PMOD2(2) <= sseg_edu_cathode_out(4); -- cathode 4

	PMOD3(6) <= sseg_edu_anode_out(0); --A
	PMOD3(5) <= sseg_edu_anode_out(1); --B
	PMOD3(3) <= sseg_edu_anode_out(2); --C
	PMOD2(6) <= sseg_edu_anode_out(3); --D
	PMOD2(7) <= sseg_edu_anode_out(4); --E
	PMOD3(7) <= sseg_edu_anode_out(5); --F
	PMOD3(2) <= sseg_edu_anode_out(6); --G
	PMOD3(4) <= sseg_edu_anode_out(7); --DP


-- following code tests the audio out.
--sound_0: sound_440 -- generates 440hz pwm
--		generic map(clk_freq_hz => 100_000_000)
--		port map(
--			clk => gls_clk, reset => gls_reset,
--			sound_out =>  PMOD4(0)
--		);
--		
--sound_1: sound_440 -- tricking module to produce 220
--		generic map(clk_freq_hz => 50_000_000)
--		port map(
--			clk => gls_clk, reset => gls_reset,
--			sound_out =>  PMOD4(6)
--		);
		
vga0 : vga_bar_top
	generic  map(COLOR_GRAY_SEL => '1') --color = 0 , gray = 1
	port map(
		clk => vga_clk,	
		hsync => vga_hsync, vsync => vga_vsync,
		red => vga_red,
		green => vga_green,
		blue => vga_blue
	);
	
--VGA SIGNAL MAPPING
PMOD1(3) <= vga_hsync ;
PMOD1(7) <= vga_vsync ;	
PMOD1(0) <= vga_red(2);		
PMOD1(4) <= vga_red(1);		
PMOD2(4) <= vga_red(0); 	
PMOD1(1) <= vga_green(2);	
PMOD1(5) <= vga_green(1);	
PMOD2(3) <= vga_green(0);	
PMOD1(2) <= vga_blue(2);	
PMOD1(6) <= vga_blue(1);	
PMOD2(0) <= vga_blue(0);	

		
LED(0) <= sseg_edu_cathode_out(0);
LED(1) <= PB(0) ;
	
end Behavioral;

