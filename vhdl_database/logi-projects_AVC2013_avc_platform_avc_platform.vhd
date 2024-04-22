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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

library work ;
use work.utils_pack.all ;
use work.peripheral_pack.all ;
use work.interface_pack.all ;
use work.conf_pack.all ;
use work.image_pack.all ;
use work.blob_pack.all ;
use work.classifier_pack.all ;
use work.primitive_pack.all ;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity avc_platform is
port( OSC_FPGA : in std_logic;

		--onboard
		PB, DIP_SW : in std_logic_vector(3 downto 0);
		LED : out std_logic_vector(7 downto 0);	
		
			--PMOD
		PMOD4_9, PMOD4_3  : inout std_logic ; -- used as SCL, SDA
		PMOD4_1, PMOD4_4 : out std_logic ; -- used as reset and xclk 
		PMOD4_10, PMOD4_2, PMOD4_8, PMOD4_7 : in std_logic ; -- used as pclk, href, vsync
		PMOD3 : in std_logic_vector(7 downto 0); -- used as cam data
		
		PWM : out std_logic_vector(1 downto 0);
		ENC_A : in std_logic_vector(1 downto 0);
		ENC_B : in std_logic_vector(1 downto 0);
		
		--i2c
		SYS_I2C_SCL, SYS_I2C_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, SYS_SPI_SS, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic ;
		
		--RPI GPIO
		GPIO_GEN : inout std_logic_vector(3 downto 0);
		GPIO_GCLK : in std_logic 
);
end avc_platform;

architecture Behavioral of avc_platform is

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
	
	component servo_controller is
	generic(
	 pos_width	:	integer := 8 ;
	 clock_period             : integer := 32;
	 minimum_high_pulse_width : integer := 1000000;
	 maximum_high_pulse_width : integer := 2000000
	 );
	port (clk            : in  std_logic;
		  rst            : in  std_logic;
		  servo_position : in  std_logic_vector ((pos_width-1) downto 0);
		  servo_out       : out std_logic);
	end component;
	
	component quad_encoder_block is
	generic(NBIT : positive := 32; POL : std_logic := '1');
	port(
	clk, resetn : in std_logic ;
	en, reset : in std_logic ;
	CHAN_A, CHAN_B : in std_logic ;
	count : out std_logic_vector((NBIT-1) downto 0)
	);
	end component;
	
	component watchdog is
	generic (NB_CHANNEL : positive := 7; DIVIDER : positive := 1000; TIMEOUT : positive := 16000);
	port(clk, resetn : in std_logic;
	  cs, wr : in std_logic ;
	  enable_channels : out std_logic_vector(NB_CHANNEL-1 downto 0);
	  status : out std_logic 
	  );
	end component;

	-- Constant declaration
	constant system_clk_freq : integer      := 100_000_000;
	constant system_clk_period_ns : integer := (1000000000 / system_clk_freq);  -- convert frequency to period
   constant system_clk_period_ps : integer := (system_clk_period_ns * 1000);
	constant servo_clock_period_ps : integer := 20000;
	constant servo_clock_period_ns : integer := servo_clock_period_ps /1000;
	-- Systemc clocking and reset
	signal clk_sys, clk_100,  clk_120,clk_96, clk_24, clk_locked : std_logic ;
	signal resetn , sys_resetn : std_logic ;
	
	
	-- Led counter
	signal counter_output : std_logic_vector(31 downto 0);
	
	
	--Memory interface signals
	signal bus_data_in, bus_data_out : std_logic_vector(15 downto 0);
	signal bus_addr : std_logic_vector(15 downto 0);
	signal bus_wr, bus_rd, bus_cs : std_logic ;
	
	-- Peripheral output signals
	signal bus_color_lut_data_out : std_logic_vector(15 downto 0);
	signal bus_blob_fifo_out : std_logic_vector(15 downto 0);
	signal bus_latches_data_out : std_logic_vector(15 downto 0);
	signal bus_preview_fifo_out : std_logic_vector(15 downto 0);
	
	-- Peripheral logic side input signals
	signal blob_fifo_input : std_logic_vector(15 downto 0);
	signal blob_fifo_wr : std_logic ;
	signal preview_fifo_input : std_logic_vector(15 downto 0);
	signal preview_fifo_wr : std_logic ;
	
	
	-- Peripheral chip select
	signal cs_blob_fifo, cs_color_lut, cs_latches, cs_preview_fifo, cs_watchdog : std_logic ;
	
	
	-- Camera configuration and interface signals
	signal cam_data : std_logic_vector(7 downto 0);
	signal cam_sioc, cam_siod : std_logic ;
	signal cam_xclk, cam_pclk, cam_vsync, cam_href, cam_reset : std_logic ;
	signal rom_addr : std_logic_vector(7 downto 0);
	signal rom_data : std_logic_vector(15 downto 0);
	
	
	--Pixel pipeline signals
	signal pixel_y_from_interface, pixel_u_from_interface, pixel_v_from_interface : std_logic_vector(7 downto 0);
	signal pxclk_from_interface, href_from_interface, vsync_from_interface : std_logic ;
	signal pixel_from_ds : std_logic_vector(7 downto 0);
	signal pxclk_from_ds, href_from_ds, vsync_from_ds : std_logic ;
	signal pixel_from_switch : std_logic_vector(7 downto 0);
	signal pxclk_from_switch, href_from_switch, vsync_from_switch : std_logic ;
	signal pixel_from_bin : std_logic_vector(7 downto 0);
	signal pxclk_from_bin, href_from_bin, vsync_from_bin : std_logic ;
	signal pixel_from_erode : std_logic_vector(7 downto 0);
	signal pxclk_from_erode, href_from_erode, vsync_from_erode : std_logic ;
	
	signal pixel_u_to_fifo, pixel_v_to_fifo : std_logic_vector(7 downto 0);
	
	-- Classifier signals
	signal color_index : std_logic_vector(15 downto 0);
	signal color_lut_out : std_logic_vector(7 downto 0);
	
	-- PWM related signals
	signal pwm_value_1, pwm_value_0 : std_logic_vector(15 downto 0);
	signal enc_value_1, enc_value_0 : std_logic_vector(31 downto 0);
	signal servo_pos_1, servo_pos_0 : std_logic_vector(7 downto 0);
	signal pwm_enable, pwm_rst : std_logic ;
	
	-- Encoders related signal
	signal ENC_A_OLD, ENC_A_RE  : std_logic_vector(1 downto 0); 
	signal ENCODERS_CONTROL : std_logic_vector(15 downto 0);
	
	-- watchdog signals
	signal enable_peripherals : std_logic_vector(1 downto 0);
	signal watchdog_status : std_logic ;
	
	-- i2c routing signals
	
	signal i2c_scl_route, i2c_sda_route : std_logic ;
	
	for all : yuv_register_rom use entity work.yuv_register_rom(ov7725_qvga);
	constant IMAGE_WIDTH : integer := 320 ;
	constant IMAGE_HEIGHT : integer := 240 ;
	
	--constant SERVO_FAILSAFE : std_logic_vector(7 downto 0) := X"9B" ;
	constant SERVO_FAILSAFE : std_logic_vector(7 downto 0) := X"80" ;
begin
	
	resetn <= PB(0) ;
	
	sys_clocks_gen: clock_gen 
	PORT MAP(
		CLK_IN1 => OSC_FPGA,
		CLK_OUT1 => clk_100,
		CLK_OUT2 => clk_24,
		CLK_OUT3 => clk_120, --96Mhz system clock
		LOCKED => clk_locked
	);
	clk_sys <= clk_120 ;

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
		  
		  
	LED(0) <= counter_output(24);


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
	cs_blob_fifo <= '1' when bus_addr(15 downto 3) = "0000000000000" else
				  '0' ; -- 8 * 16bit address space
	cs_preview_fifo <= '1' when bus_addr(15 downto 3) = "0000000000001" else
				  '0' ; -- 8 * 16bit address space
				  
	cs_color_lut <= '1' when bus_addr(15 downto 12) = "0001" else
				  '0' ; -- 4096 * 16bit address space
				  
	cs_latches <= '1' when bus_addr(15 downto 3) = "0010000000000" else
				  '0' ; -- 4 * 16bit address space
	cs_watchdog <= '1' when bus_addr(15 downto 3) = "0010000000001" else
				      '0' ; -- 4 * 16bit address space

	bus_data_in <= bus_blob_fifo_out when cs_blob_fifo = '1' else
						bus_color_lut_data_out when cs_color_lut = '1' else
						bus_latches_data_out when cs_latches = '1' else 
						bus_preview_fifo_out when cs_preview_fifo = '1' else
						(others => '0');
						
-- Peripherals instantiation
	fifo_blobs : fifo_peripheral 
		generic map(ADDR_WIDTH => 16,
						WIDTH => 16, 
						SIZE => 1024, 
						BURST_SIZE => 4,
						SYNC_LOGIC_INTERFACE => true)
		port map(
			clk => clk_sys,
			resetn => sys_resetn,
			addr_bus => bus_addr,
			wr_bus => bus_wr,
			rd_bus => bus_rd,
			cs_bus => cs_blob_fifo,
			wrB => blob_fifo_wr,
			rdA => '0',
			data_bus_in => bus_data_out,
			data_bus_out => bus_blob_fifo_out,
			inputB => blob_fifo_input, 
			outputA => open,
			emptyA => open,
			fullA => open,
			emptyB => open,
			fullB => open,
			burst_available_B => open
		);		
		
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
 
	addr_latches_Inst : addr_latches_peripheral
		generic map(ADDR_WIDTH => 16, WIDTH => 16, NB => 8)
		port map(
			clk => clk_sys, resetn => sys_resetn,
			addr_bus => bus_addr, 
			wr_bus => bus_wr, 
			rd_bus => bus_rd, 
			cs_bus => cs_latches,
			data_bus_in	=> bus_data_out,
			data_bus_out => bus_latches_data_out,
			
			latch_default(0) => SERVO_FAILSAFE & X"00",
			latch_default(1) => SERVO_FAILSAFE & X"00",
			latch_default(2) => X"0000",
			latch_default(3) => X"0000",
			latch_default(4) => X"0000",
			latch_default(5) => X"0000",
			latch_default(6) => X"0000",
			latch_default(7) => X"0000",
			
			
			latch_input(0) => pwm_value_0,
			latch_input(1) => pwm_value_1,
			latch_input(2) => enc_value_0(15 downto 0),
			latch_input(3) => enc_value_0(31 downto 16),
			latch_input(4) => enc_value_1(15 downto 0),
			latch_input(5) => enc_value_1(31 downto 16),
			latch_input(6)(0) => watchdog_status,
			latch_input(6)(15 downto 1) => (others => '0'), -- for future use
			latch_input(7) => (others => '0'), -- for future use
			latch_output(0) => pwm_value_0,
			latch_output(1) => pwm_value_1,
			latch_output(2)(0) => pwm_enable,
			latch_output(3)(7 downto 3) => LED(7 downto 3),
			latch_output(3)(2 downto 1) =>  open,
			latch_output(4) => ENCODERS_CONTROL,
			latch_output(5) => open,
			latch_output(6) => open,
			latch_output(7) => open
		);
		
--	classifier_lut_inst : classifier_lut	
--		generic map(CLASS_WIDTH => 2, INDEX_WIDTH => 12)
--		port map(
--			clk => clk_sys ,
--			resetn => sys_resetn,
--			we =>  cs_color_lut,
--			cs =>cs_color_lut ,
--			data_in => bus_data_out, 
--			bus_addr	=> bus_addr,
--			class_index => color_index(11 downto 0),
--			data_out => bus_color_lut_data_out,
--			class_value => color_lut_out(1 downto 0) 		
--		); 

	classifier_lut_inst : yuv_classifier
		port map(
			clk => clk_sys ,
			resetn => sys_resetn,
			we =>  cs_color_lut,
			cs =>cs_color_lut ,
			data_in => bus_data_out, 
			bus_addr	=> bus_addr,
			data_out => bus_color_lut_data_out,
			y_value => pixel_y_from_interface,
			u_value => pixel_u_from_interface,
			v_value => pixel_v_from_interface,
			class_value(2) => open,
			class_value(1 downto 0) => color_lut_out(1 downto 0)	
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

--PMOD4_9<= 'Z' when SYS_I2C_SCL = '1' else
--			 '0' ;
--
--PMOD4_3 <= 'Z' when SYS_I2C_SDA = '1' else
--			  '0' ;
--
--SYS_I2C_SDA <= '0' when PMOD4_3 = '0' else
--					'Z' ;
 
		
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
	
-- Pixel Pipeline instantiation
	video_switch_inst : video_switch
		generic map(NB	=> 2)
		port map(pixel_clock(0) => pxclk_from_interface,
					pixel_clock(1) => pxclk_from_erode,
					
				   hsync(0) => href_from_interface, 
					hsync(1) => href_from_erode, 
					
					vsync(0) => vsync_from_interface,
					vsync(1) => vsync_from_erode,
					
					pixel_data(0) =>pixel_y_from_interface,
					pixel_data(1) => (pixel_from_erode(1 downto 0)&"000000"),
					
					pixel_clock_out => pxclk_from_switch,
					hsync_out=> href_from_switch,
					vsync_out => vsync_from_switch,
					pixel_data_out => pixel_from_switch,
					channel(0) => DIP_SW(0),
					channel(7 downto 1) => (others => '0')
		);


	ds_image : down_scaler
		generic map(SCALING_FACTOR => 2, INPUT_WIDTH => IMAGE_WIDTH, INPUT_HEIGHT => IMAGE_HEIGHT )
		port map(
			clk => clk_sys,
			resetn => sys_resetn,
			pixel_clock => pxclk_from_switch, 
			hsync => href_from_switch,
			vsync => vsync_from_switch,
			pixel_clock_out => pxclk_from_ds, 
			hsync_out => href_from_ds, 
			vsync_out=> vsync_from_ds,
			pixel_data_in => pixel_from_switch,
			pixel_data_out=> pixel_from_ds
		); 
		
		
		pixel_u_to_fifo <= pixel_u_from_interface when DIP_SW(0) = '0' else
								 pixel_u_from_interface when pixel_from_ds /= 0 else
								 X"80";
								 
		pixel_v_to_fifo <= pixel_v_from_interface when DIP_SW(0) = '0' else
								 pixel_v_from_interface when pixel_from_ds /= 0 else
								 X"80";
		
		pixel_to_fifo : yuv_pixel2fifo
		port map(
			clk => clk_sys, resetn => sys_resetn,
			sreset => '0',
			pixel_clock => pxclk_from_ds, 
			hsync => href_from_ds, 
			vsync => vsync_from_ds,
--			clk => clk_sys, resetn => sys_resetn,
--			pixel_clock => pxclk_from_interface, 
--			hsync => href_from_interface, 
--			vsync => vsync_from_interface,
--			pixel_y => pixel_y_from_interface,
--			pixel_u => pixel_u_from_interface,
--			pixel_v => pixel_v_from_interface,
			pixel_y => pixel_from_ds,
			pixel_u => pixel_u_to_fifo,
			pixel_v => pixel_v_to_fifo,
			fifo_data => preview_fifo_input,
			fifo_wr => preview_fifo_wr
		);	
	
	classification0 : color_classifier
		port map(
				clk => clk_sys, 
				resetn => sys_resetn ,
				pixel_clock => pxclk_from_interface, hsync => href_from_interface, vsync => vsync_from_interface,
				pixel_clock_out => pxclk_from_bin, hsync_out => href_from_bin, vsync_out => vsync_from_bin,
				pixel_y => pixel_y_from_interface,
				pixel_u => pixel_u_from_interface,
				pixel_v => pixel_v_from_interface,
				pixel_class => pixel_from_bin,
				
				color_index => color_index(11 downto 0),
				lut_in => color_lut_out
		);


	smooth0 : classifier_smoother 
		generic map(WIDTH => IMAGE_WIDTH, HEIGHT => IMAGE_HEIGHT)
		port map(
				clk => clk_sys, 
				resetn => sys_resetn ,
				pixel_clock => pxclk_from_bin, hsync => href_from_bin, vsync => vsync_from_bin,
				pixel_clock_out => pxclk_from_erode, hsync_out => href_from_erode, vsync_out => vsync_from_erode,
				pixel_data_in => pixel_from_bin,
				pixel_data_out => pixel_from_erode
		);


	blob_tracker : blob_detection 
		generic map(LINE_SIZE => IMAGE_WIDTH)
		port map(
				clk => clk_sys, 
				resetn => sys_resetn ,
				pixel_clock => pxclk_from_erode, hsync => href_from_erode, vsync => vsync_from_erode,
				pixel_data_in => pixel_from_erode,
				blob_data => open,
				
				--memory_interface to copy results on vsync
				mem_addr => open,
				mem_data =>blob_fifo_input,
				mem_wr => blob_fifo_wr
		);

-- Control peripheral instantiation

	watchdog0: watchdog 
	generic map(NB_CHANNEL => 2,
				DIVIDER => 119_999,
				TIMEOUT => 500)
	port map(clk => clk_sys, 
		  resetn => sys_resetn,
		  cs => cs_watchdog, 
		  wr => bus_wr,
	     enable_channels => enable_peripherals,
		  status => watchdog_status
	  );

	servo_pos_0 <= pwm_value_0(7 downto 0) when enable_peripherals(0) = '1' else
						pwm_value_0(15 downto 8)  ;

	
	pwm_rst <= (not sys_resetn) or (not pwm_enable) ;

	servo_controller_0_Inst : servo_controller
	  generic map(
		 clock_period => 8,
		 minimum_high_pulse_width => 1000000,
		 maximum_high_pulse_width => 2000000
		 )
	  port map(clk => clk_sys,
			  rst => pwm_rst,
			  servo_position => servo_pos_0,
			  servo_out => PWM(0));
		  
	servo_pos_1 <= pwm_value_1(7 downto 0) when enable_peripherals(1) = '1' else
						pwm_value_1(15 downto 8) ;
	
	servo_controller_1_Inst : servo_controller
	  generic map(
		 clock_period => 8,
		 minimum_high_pulse_width => 1000000,
		 maximum_high_pulse_width => 2000000
		 )
	  port map(clk => clk_sys,
			  rst => pwm_rst,
			  servo_position => servo_pos_1,
			  servo_out => PWM(1));
			  
-- Encoders counter instantiation	
-- ENCODERS_CONTROL :  ... | encoder_1 enable | encoder_0 enable | encoder_1 reset | encoder_0 reset

	
		encoder_chan0 : quad_encoder_block
			generic map(NBIT => 32, POL => '0')
			port map( clk => clk_sys,
				resetn => sys_resetn,
				reset => ENCODERS_CONTROL(0),
				en => ENCODERS_CONTROL(2),
				CHAN_A => ENC_A(0) , 
				CHAN_B => ENC_B(0) , 
				count => enc_value_0 );

		encoder_chan1 : quad_encoder_block
			generic map(NBIT => 32, POL => '0')
			port map( clk => clk_sys,
				resetn => sys_resetn,
				reset => ENCODERS_CONTROL(1),
				en => ENCODERS_CONTROL(3),
				CHAN_A => ENC_A(1) , 
				CHAN_B => ENC_B(1) , 
				count => enc_value_1
			);

end Behavioral;

