----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:22 06/21/2012 
-- Design Name: 
-- Module Name:    spartcam_beaglebone - Behavioral 
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

library work ;
use work.utils_pack.all ;
use work.peripheral_pack.all ;
use work.interface_pack.all ;
use work.conf_pack.all ;
use work.image_pack.all ;
use work.primitive_pack.all ;
use work.feature_pack.all ;
use work.filter_pack.all ;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity mark1_rpi_camera is
port( OSC_FPGA : in std_logic;

		--onboard
		PB, DIP_SW : in std_logic_vector(3 downto 0);
		LED : out std_logic_vector(7 downto 0);	
		
			--PMOD
		PMOD4_9, PMOD4_3  : inout std_logic ; -- used as SCL, SDA
		PMOD4_1, PMOD4_4 : out std_logic ; -- used as reset and xclk 
		PMOD4_10, PMOD4_2, PMOD4_8, PMOD4_7 : in std_logic ; -- used as pclk, href, vsync
		PMOD3 : in std_logic_vector(7 downto 0); -- used as cam data
		
		--i2c
		SYS_I2C_SCL, SYS_I2C_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, SYS_SPI_SS, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic 
);
end mark1_rpi_camera;

architecture Behavioral of mark1_rpi_camera is

-- Component declaration
	COMPONENT clock_gen
	PORT(
		CLK_IN1 : IN std_logic;          
		CLK_OUT1 : OUT std_logic;
		CLK_OUT2 : OUT std_logic;
		CLK_OUT3 : OUT std_logic;
		LOCKED : OUT std_logic
		);
	END COMPONENT;

	
	
	-- Systemc clocking and reset
	signal clk_sys, clk_100,  clk_96, clk_24, clk_locked : std_logic ;
	signal resetn , sys_resetn : std_logic ;
	
	
	-- Led counter
	signal counter_output : std_logic_vector(31 downto 0);
	
	
	--Memory interface signals
	signal bus_data_in, bus_data_out : std_logic_vector(15 downto 0);
	signal bus_addr : std_logic_vector(15 downto 0);
	signal bus_wr, bus_rd, bus_cs : std_logic ;
	
	-- Peripheral output signals
	signal bus_preview_fifo_out : std_logic_vector(15 downto 0);
	
	-- Peripheral logic side input signals
	signal preview_fifo_input : std_logic_vector(15 downto 0);
	signal preview_fifo_wr : std_logic ;
	
	
	-- Peripheral chip select
	signal cs_preview_fifo : std_logic ;
	
	
	-- Camera configuration and interface signals
	signal cam_data : std_logic_vector(7 downto 0);
	signal cam_sioc, cam_siod : std_logic ;
	signal cam_xclk, cam_pclk, cam_vsync, cam_href, cam_reset : std_logic ;
	signal rom_addr : std_logic_vector(7 downto 0);
	signal rom_data : std_logic_vector(15 downto 0);
	
	
	--Pixel pipeline signals
	signal pixel_y_from_interface, pixel_u_from_interface, pixel_v_from_interface : std_logic_vector(7 downto 0);
	signal pxclk_from_interface, href_from_interface, vsync_from_interface : std_logic ;
	
	signal pixel_from_harris : std_logic_vector(7 downto 0);
	signal harris_resp : std_logic_vector(15 downto 0);
	signal signed_harris_resp : signed(15 downto 0);
	signal pxclk_from_harris, href_from_harris, vsync_from_harris : std_logic ;
	signal pixel_from_gauss: std_logic_vector(7 downto 0);
	signal pxclk_from_gauss, href_from_gauss, vsync_from_gauss : std_logic ;
	signal pixel_from_sobel: std_logic_vector(7 downto 0);
	signal pxclk_from_sobel, href_from_sobel, vsync_from_sobel : std_logic ;
	signal pixel_from_switch: std_logic_vector(7 downto 0);
	signal pxclk_from_switch, href_from_switch, vsync_from_switch : std_logic ;
	
	signal pixel_y_from_ds, pixel_u_from_ds, pixel_v_from_ds : std_logic_vector(7 downto 0);
	signal pxclk_from_ds, href_from_ds, vsync_from_ds : std_logic ;
	
	-- i2c routing signals
	
	for all : yuv_register_rom use entity work.yuv_register_rom(ov7725_qvga_patched);
	constant IMAGE_WIDTH : integer := 320 ;
	constant IMAGE_HEIGHT : integer := 240 ;
begin
	
	resetn <= PB(0) ;
	
	sys_clocks_gen: clock_gen 
	PORT MAP(
		CLK_IN1 => OSC_FPGA,
		CLK_OUT1 => clk_100,
		CLK_OUT2 => clk_24,
		CLK_OUT3 => clk_96, --96Mhz system clock
		LOCKED => clk_locked
	);
	clk_sys <= clk_96 ;

	reset0: reset_generator 
	generic map(HOLD_0 => 1000)
	port map(
		clk => clk_sys, 
		resetn => resetn ,
		resetn_0 => sys_resetn
		);


	divider : simple_counter 
	generic map(NBIT => 32)
	port map(
		clk => clk_sys, 
		resetn => sys_resetn, 
		sraz => '0',
		en => '1',
		load => '0' ,
		E => X"00000000",
		Q => counter_output
		);
		  
		  
	LED(7 downto 3) <= counter_output(24 downto 20);
	LED(0) <= counter_output(25);


-- Memory interface instantiation
	mem_interface0 : spi2ad_bus
		generic map(ADDR_WIDTH => 16 , DATA_WIDTH =>  16)
		port map(
			clk => clk_sys ,
			resetn => sys_resetn ,
			mosi => SYS_SPI_MOSI,
			miso => SYS_SPI_MISO,
			sck => SYS_SPI_SCK,
			ss => SYS_SPI_SS,
			data_bus_out	=> bus_data_out,
			data_bus_in	=> bus_data_in ,
			addr_bus	=> bus_addr, 
			wr => bus_wr , rd => bus_rd 
		);

-- chip select configuration
	cs_preview_fifo <= '1' when bus_addr(15 downto 3) = "0000000000000" else
				  '0' ; -- 8 * 16bit address space

	bus_data_in <=  bus_preview_fifo_out when cs_preview_fifo = '1' else
						(others => '0');
						
	-- Peripherals instantiation
	fifo_preview : fifo_peripheral 
		generic map(ADDR_WIDTH => 16,
						WIDTH => 16, 
						SIZE => 8192,--8192, 
						BURST_SIZE => 4,
						SYNC_LOGIC_INTERFACE => false)
		port map(
			clk => clk_sys,
			resetn => sys_resetn,
			addr_bus => bus_addr,
			wr_bus => bus_wr,
			rd_bus => bus_rd,
			cs_bus => cs_preview_fifo,
			wrB => preview_fifo_wr,
			rdA => '0',
			data_bus_in => bus_data_out,
			data_bus_out => bus_preview_fifo_out,
			inputB => preview_fifo_input, 
			outputA => open,
			emptyA => open,
			fullA => open,
			emptyB => open,
			fullB => open,
			burst_available_B => open
		);	
 
 
-- Camera Interface and configuration instantiation 
	conf_rom : yuv_register_rom
		port map(
			clk => clk_24, en => '1' ,
			data => rom_data,
			addr => rom_addr
		); 
 
	camera_conf_block : i2c_conf 
		generic map(ADD_WIDTH => 8 , SLAVE_ADD => "0100001")
		port map(
			clock => clk_24, 
			resetn => sys_resetn ,		
			i2c_clk => clk_24 ,
			scl => PMOD4_9,
			sda => PMOD4_3, 
			reg_addr => rom_addr ,
			reg_data => rom_data
		);	
 
		
	camera0: yuv_camera_interface
		port map(
			clock => clk_sys,
			resetn => sys_resetn,
			pixel_data => cam_data, 
			pxclk => cam_pclk, href => cam_href, vsync => cam_vsync,
			pixel_clock_out => pxclk_from_interface, hsync_out => href_from_interface, vsync_out => vsync_from_interface,
			y_data => pixel_y_from_interface,
			u_data => pixel_u_from_interface,
			v_data => pixel_v_from_interface
					
		);	
		
	cam_xclk <= clk_24;
	PMOD4_4 <= cam_xclk ;
	cam_data <= PMOD3(3) & PMOD3(7) & PMOD3(2) & PMOD3(6) & PMOD3(1) & PMOD3(5) & PMOD3(0) & PMOD3(4) ;
	cam_pclk <= PMOD4_10 ;
	cam_href <= PMOD4_2 ;
	cam_vsync <= PMOD4_8 ;
	PMOD4_1 <= cam_reset ;
	cam_reset <= resetn ;

	LED(1) <= cam_vsync ;
	LED(2) <= cs_preview_fifo ;

	
	gauss3x3_0	: gauss3x3 
		generic map(WIDTH => IMAGE_WIDTH,
				  HEIGHT => IMAGE_HEIGHT)
		port map(
					clk => clk_sys ,
					resetn => sys_resetn ,
					pixel_clock => pxclk_from_interface, 
					hsync => href_from_interface, 
					vsync =>  vsync_from_interface,
					pixel_clock_out => pxclk_from_gauss, 
					hsync_out => href_from_gauss, 
					vsync_out => vsync_from_gauss, 
					pixel_data_in => pixel_y_from_interface,  
					pixel_data_out => pixel_from_gauss
		);		
		
	
	sobel0: sobel3x3
		generic map(WIDTH => IMAGE_WIDTH,
				  HEIGHT => IMAGE_HEIGHT)
		port map(
			clk => clk_sys ,
			resetn => sys_resetn ,
			pixel_clock => pxclk_from_gauss, hsync => href_from_gauss, vsync =>  vsync_from_gauss,
			pixel_clock_out => pxclk_from_sobel, hsync_out => href_from_sobel, vsync_out => vsync_from_sobel, 
			pixel_data_in => pixel_from_gauss,  
			pixel_data_out => pixel_from_sobel
		);	


	harris_detector : HARRIS 
	generic map(WIDTH => IMAGE_WIDTH, HEIGHT => IMAGE_HEIGHT, WINDOW_SIZE => 5, DS_FACTOR => 2)
	port map(
			clk => clk_sys,
			resetn => sys_resetn, 
			pixel_clock => pxclk_from_interface, 
			hsync => href_from_interface,
			vsync => vsync_from_interface, 
			pixel_clock_out =>pxclk_from_harris,
			hsync_out => href_from_harris, 
			vsync_out => vsync_from_harris,
			pixel_data_in =>  pixel_y_from_interface,
			harris_out => harris_resp 
	);
	signed_harris_resp <= signed(harris_resp) ;

	pixel_from_harris <=  (others => '0') when harris_resp(15) = '1' else
								  harris_resp(7 downto 0) when signed_harris_resp < 256 else
								  (others => '1');
								  
								  
								  



		video_switch_inst: video_switch
		generic map(NB	=>  4)
		port map(
		pixel_clock(0) => pxclk_from_interface, 
		pixel_clock(1) => pxclk_from_gauss, 
		pixel_clock(2) => pxclk_from_sobel, 
		pixel_clock(3) => pxclk_from_harris,
		
		hsync(0) => href_from_interface,
		hsync(1) => href_from_gauss, 
		hsync(2) => href_from_sobel,
		hsync(3) => href_from_harris,
		
		
		vsync(0) => vsync_from_interface,
		vsync(1) => vsync_from_gauss,
		vsync(2) => vsync_from_sobel,
		vsync(3) => vsync_from_harris,
		
		pixel_data(0) => pixel_y_from_interface	,
		pixel_data(1) => pixel_from_gauss	,
		pixel_data(2) => pixel_from_sobel	,
		pixel_data(3) => pixel_from_harris	,


		  pixel_clock_out => pxclk_from_switch, 
		  hsync_out => href_from_switch, 
		  vsync_out => vsync_from_switch,
		  pixel_data_out => pixel_from_switch,
		  channel(1 downto 0) => DIP_SW(1 downto 0),
		  channel(7 downto 2) => "000000"
		);



	ds_image : down_scaler
		generic map(SCALING_FACTOR => 2, INPUT_WIDTH => IMAGE_WIDTH, INPUT_HEIGHT => IMAGE_HEIGHT )
		port map(
			clk => clk_sys,
			resetn => sys_resetn,
--			pixel_clock => pxclk_from_interface, 
--			hsync => href_from_interface,
--			vsync => vsync_from_interface,
			pixel_clock => pxclk_from_switch, 
			hsync => href_from_switch,
			vsync => vsync_from_switch,
			pixel_clock_out => pxclk_from_ds, 
			hsync_out => href_from_ds, 
			vsync_out=> vsync_from_ds,
			pixel_data_in => pixel_from_switch,
			pixel_data_out=> pixel_y_from_ds
		); 
		
		pixel_to_fifo : yuv_pixel2fifo
		port map(
			clk => clk_sys, resetn => sys_resetn,
			pixel_clock => pxclk_from_ds, 
			hsync => href_from_ds, 
			vsync => vsync_from_ds,
			pixel_y => pixel_y_from_ds,
			pixel_u => X"80",--pixel_u_from_interface,
			pixel_v => X"80",--pixel_v_from_interface,
			fifo_data => preview_fifo_input,
			fifo_wr => preview_fifo_wr
		);	

end Behavioral;

