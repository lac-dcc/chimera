library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;
use work.image_pack.all ;
use work.filter_pack.all ;
use work.interface_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;


entity logibone_cam_test is
	port(
		OSC_FPGA : in std_logic ;
		GPMC_AD :   inout  std_logic_vector((16-1) downto 0);
		GPMC_CSN :  in std_logic;
		GPMC_OEN :  in std_logic;
		GPMC_WEN :  in std_logic;
		GPMC_ADVN :  in std_logic;
		GPMC_CLK :  in std_logic;
		LED :   out  std_logic_vector((2-1) downto 0);
		PMOD1 :   inout  std_logic_vector((8-1) downto 0);
		PMOD2 :   inout  std_logic_vector((8-1) downto 0);
		ARD :   inout  std_logic_vector((6-1) downto 0);
		PB :  in std_logic_vector((2-1) downto 0);
		SW :  in std_logic_vector((2-1) downto 0);
		ARD_SCL :   inout  std_logic;
		ARD_SDA :   inout  std_logic	
	);
end logibone_cam_test;

architecture structural of logibone_cam_test is
	
	type wishbone_bus is
	record
		address : std_logic_vector(15 downto 0);
		writedata : std_logic_vector(15 downto 0);
		readdata : std_logic_vector(15 downto 0);
		cycle: std_logic;
		write : std_logic;
		strobe : std_logic;
		ack : std_logic;
	end record;

	signal gls_clk, gls_reset, gls_resetn, clk_locked, osc_buff, clkfb : std_logic ;

	signal Master_0_wbm_Intercon_0_wbs_0 : wishbone_bus;
	signal top_GPMC_CSN_Master_0_gpmc_csn_0 : std_logic;
	signal top_GPMC_CLK_Master_0_gpmc_clk_0 : std_logic;
	signal top_GPMC_OEN_Master_0_gpmc_oen_0 : std_logic;
	signal top_GPMC_WEN_Master_0_gpmc_wen_0 : std_logic;
	signal top_GPMC_ADVN_Master_0_gpmc_advn_0 : std_logic;
	signal top_GPMC_AD_Master_0_gpmc_ad_0 : std_logic_vector((16-1) downto 0);
	signal CAM_0_pixel_out_SPLIT_0_pixel_in_0 : yuv_pixel_bus;
	signal SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0 : y_pixel_bus;
	signal GAUSS_0_pixel_out_SOBEL_0_pixel_in_0 : y_pixel_bus;
	signal SOBEL_0_pixel_out_MAX_0_pixel_in_0 : y_pixel_bus;

	signal SOBEL_0_pixel_y_out_MAX_0_pixel_in_0 : y_pixel_bus;
	signal Intercon_0_wbm_MEM_0_wbs_0 : wishbone_bus;
	signal Intercon_0_wbm_I2C_0_wbs_0 : wishbone_bus;
	signal Intercon_0_wbm_GPIO_0_wbs_0 : wishbone_bus;
	signal Intercon_0_wbm_FIFO_0_wbs_0 : wishbone_bus;
	signal Intercon_0_wbm_PWM_0_wbs_0 : wishbone_bus;

	signal cam_data : std_logic_vector(7 downto 0);
	signal cam_pclk, cam_href, cam_vsync : std_logic ;
	
	signal SOBEL_0_x_grad_MAX_0_value_in, SOBEL_0_y_grad_MAX_0_value_in : signed(15 downto 0);
	signal MAX_0_mem_write_MEM_0_write_in : std_logic;
	signal MAX_0_mem_out_MEM_0_data_in : std_logic_vector(15 downto 0);
	signal MAX_0_write_addr_MEM_0_addr_in : std_logic_vector(9 downto 0);
	
	signal clk_cam, clk_cam_buff : std_logic ;
	signal fifo_data : std_logic_vector(15 downto 0);
	signal fifo_write, pipeline_reset : std_logic ;
	for all : sobel3x3 use entity work.sobel3x3(RTL);
	for all : gauss3x3 use entity work.gauss3x3(RTL);
	signal dir : std_logic_vector(1 downto 0);

begin


gls_reset <= (NOT clk_locked); -- system reset while clock not locked
gls_resetn <= not gls_reset ;


Master_0 : gpmc_wishbone_wrapper
generic map(sync => true, burst => false)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	gpmc_ad(15 downto 0) =>  top_GPMC_AD_Master_0_gpmc_ad_0,

	gpmc_csn =>  top_GPMC_CSN_Master_0_gpmc_csn_0,

	gpmc_oen =>  top_GPMC_OEN_Master_0_gpmc_oen_0,

	gpmc_wen =>  top_GPMC_WEN_Master_0_gpmc_wen_0,

	gpmc_advn =>  top_GPMC_ADVN_Master_0_gpmc_advn_0,

	gpmc_clk =>  top_GPMC_CLK_Master_0_gpmc_clk_0,

	wbm_address =>  Master_0_wbm_Intercon_0_wbs_0.address,
	wbm_writedata =>  Master_0_wbm_Intercon_0_wbs_0.writedata,
	wbm_readdata =>  Master_0_wbm_Intercon_0_wbs_0.readdata,
	wbm_cycle =>  Master_0_wbm_Intercon_0_wbs_0.cycle,
	wbm_strobe =>  Master_0_wbm_Intercon_0_wbs_0.strobe,
	wbm_write =>  Master_0_wbm_Intercon_0_wbs_0.write,
	wbm_ack =>  Master_0_wbm_Intercon_0_wbs_0.ack	
);

Intercon_0 : wishbone_intercon
generic map(
memory_map => ("000000XXXXXXXXXX", 
					"000100000000000X", 
					"000100000000001X",
					"0010XXXXXXXXXXXX",
					"00010000000001XX"
					)
)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Master_0_wbm_Intercon_0_wbs_0.address,
	wbs_writedata =>  Master_0_wbm_Intercon_0_wbs_0.writedata,
	wbs_readdata =>  Master_0_wbm_Intercon_0_wbs_0.readdata,
	wbs_cycle =>  Master_0_wbm_Intercon_0_wbs_0.cycle,
	wbs_strobe =>  Master_0_wbm_Intercon_0_wbs_0.strobe,
	wbs_write =>  Master_0_wbm_Intercon_0_wbs_0.write,
	wbs_ack =>  Master_0_wbm_Intercon_0_wbs_0.ack,

	wbm_address(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.address,
	wbm_address(1) =>  Intercon_0_wbm_I2C_0_wbs_0.address,
	wbm_address(2) =>  Intercon_0_wbm_GPIO_0_wbs_0.address,
	wbm_address(3) =>  Intercon_0_wbm_MEM_0_wbs_0.address,
	wbm_address(4) =>  Intercon_0_wbm_PWM_0_wbs_0.address,

	wbm_writedata(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.writedata,
	wbm_writedata(1) =>  Intercon_0_wbm_I2C_0_wbs_0.writedata,
	wbm_writedata(2) =>  Intercon_0_wbm_GPIO_0_wbs_0.writedata,
	wbm_writedata(3) =>  Intercon_0_wbm_MEM_0_wbs_0.writedata,
	wbm_writedata(4) =>  Intercon_0_wbm_PWM_0_wbs_0.writedata,
	
	
	wbm_readdata(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.readdata,
	wbm_readdata(1) =>  Intercon_0_wbm_I2C_0_wbs_0.readdata,
	wbm_readdata(2) =>  Intercon_0_wbm_GPIO_0_wbs_0.readdata,
	wbm_readdata(3) =>  Intercon_0_wbm_MEM_0_wbs_0.readdata,
	wbm_readdata(4) =>  Intercon_0_wbm_PWM_0_wbs_0.readdata,
	
	
	wbm_cycle(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.cycle,
	wbm_cycle(1) =>  Intercon_0_wbm_I2C_0_wbs_0.cycle,
	wbm_cycle(2) =>  Intercon_0_wbm_GPIO_0_wbs_0.cycle,
	wbm_cycle(3) =>  Intercon_0_wbm_MEM_0_wbs_0.cycle,
	wbm_cycle(4) =>  Intercon_0_wbm_PWM_0_wbs_0.cycle,



	
	wbm_strobe(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.strobe,
	wbm_strobe(1) =>  Intercon_0_wbm_I2C_0_wbs_0.strobe,
	wbm_strobe(2) =>  Intercon_0_wbm_GPIO_0_wbs_0.strobe,
	wbm_strobe(3) =>  Intercon_0_wbm_MEM_0_wbs_0.strobe,
	wbm_strobe(4) =>  Intercon_0_wbm_PWM_0_wbs_0.strobe,

	
	wbm_write(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.write,
	wbm_write(1) =>  Intercon_0_wbm_I2C_0_wbs_0.write,
	wbm_write(2) =>  Intercon_0_wbm_GPIO_0_wbs_0.write,
	wbm_write(3) =>  Intercon_0_wbm_MEM_0_wbs_0.write,
	wbm_write(4) =>  Intercon_0_wbm_PWM_0_wbs_0.write,


	
	wbm_ack(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.ack,
	wbm_ack(1) =>  Intercon_0_wbm_I2C_0_wbs_0.ack,
	wbm_ack(2) =>  Intercon_0_wbm_GPIO_0_wbs_0.ack,
	wbm_ack(3) =>  Intercon_0_wbm_MEM_0_wbs_0.ack,
	wbm_ack(4) =>  Intercon_0_wbm_PWM_0_wbs_0.ack
	
	
);

CAM_0 : yuv_camera_interface
-- no generics
port map(
	clock => gls_clk, resetn => (not gls_reset),

	pclk => cam_pclk,

	href => cam_href,

	vsync => cam_vsync,


	pixel_data(7 downto 0) => cam_data,

	pixel_out_clk =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.clk,
	pixel_out_hsync =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.hsync,
	pixel_out_vsync =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.vsync,
	pixel_out_y_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.y_data,
	pixel_out_u_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.u_data,
	pixel_out_v_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.v_data	
);

SPLIT_0 : yuv_split
-- no generics
port map(
	pixel_in_clk =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.clk,
	pixel_in_hsync =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.hsync,
	pixel_in_vsync =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.vsync,
	pixel_in_y_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.y_data,
	pixel_in_u_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.u_data,
	pixel_in_v_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.v_data,

	pixel_y_out_clk =>  SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0.clk,
	pixel_y_out_hsync =>  SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0.hsync,
	pixel_y_out_vsync =>  SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0.vsync,
	pixel_y_out_data =>  SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0.data,

	pixel_u_out_clk =>  open,
	pixel_u_out_hsync =>  open,
	pixel_u_out_vsync =>  open,
	pixel_u_out_data =>  open,

	pixel_v_out_clk =>  open,
	pixel_v_out_hsync =>  open,
	pixel_v_out_vsync =>  open,
	pixel_v_out_data =>  open	
);

GAUSS_0 : gauss3x3
generic map(WIDTH => 320, HEIGHT => 240)
port map(
	clk => gls_clk, resetn => (not gls_reset),

	pixel_in_clk =>  SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0.clk,
	pixel_in_hsync =>  SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0.hsync,
	pixel_in_vsync =>  SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0.vsync,
	pixel_in_data =>  SPLIT_0_pixel_y_out_GAUSS_0_pixel_in_0.data,

	pixel_out_clk =>  GAUSS_0_pixel_out_SOBEL_0_pixel_in_0.clk,
	pixel_out_hsync =>  GAUSS_0_pixel_out_SOBEL_0_pixel_in_0.hsync,
	pixel_out_vsync =>  GAUSS_0_pixel_out_SOBEL_0_pixel_in_0.vsync,
	pixel_out_data =>  GAUSS_0_pixel_out_SOBEL_0_pixel_in_0.data

);

SOBEL_0 : sobel3x3
generic map(WIDTH => 320, HEIGHT => 240)
port map(
	clk => gls_clk, resetn => (not gls_reset),

	pixel_in_clk =>  GAUSS_0_pixel_out_SOBEL_0_pixel_in_0.clk,
	pixel_in_hsync =>  GAUSS_0_pixel_out_SOBEL_0_pixel_in_0.hsync,
	pixel_in_vsync =>  GAUSS_0_pixel_out_SOBEL_0_pixel_in_0.vsync,
	pixel_in_data =>  GAUSS_0_pixel_out_SOBEL_0_pixel_in_0.data,

	pixel_out_clk =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.clk,
	pixel_out_hsync =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.hsync,
	pixel_out_vsync =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.vsync,
	pixel_out_data =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.data,
	
	y_grad => SOBEL_0_y_grad_MAX_0_value_in,
	x_grad => SOBEL_0_x_grad_MAX_0_value_in
);

MAX_0 : max_pos_col
generic map(
		WIDTH => 320,
		HEIGHT => 240,
		VALUE_WIDTH => 16,
		VALUE_SIGNED => true,
		MIN_Y =>90,
		MAX_Y =>235
		  )
port map(

		clk => gls_clk, resetn => (not gls_reset),

		pixel_in_clk =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.clk,
		pixel_in_hsync =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.hsync,
		pixel_in_vsync =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.vsync,
		pixel_in_data => SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.data,
 		value_in => std_logic_vector(SOBEL_0_y_grad_MAX_0_value_in),
		
		mem_out => MAX_0_mem_out_MEM_0_data_in,
		mem_write_addr(9 downto 0) => MAX_0_write_addr_MEM_0_addr_in,
		mem_write_addr(15 downto 10) => open,
		mem_write =>MAX_0_mem_write_MEM_0_write_in
);

MEM_0 : wishbone_shared_mem
generic map(
			mem_size => 2048,
			wb_size => 16 , -- Data port size for wishbone
			wb_addr_size => 16 ,  -- Data port size for wishbone
			logic_addr_size => 10,
			logic_data_size => 16
)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_MEM_0_wbs_0.address,
	wbs_writedata =>  Intercon_0_wbm_MEM_0_wbs_0.writedata,
	wbs_readdata =>  Intercon_0_wbm_MEM_0_wbs_0.readdata,
	wbs_cycle =>  Intercon_0_wbm_MEM_0_wbs_0.cycle,
	wbs_strobe =>  Intercon_0_wbm_MEM_0_wbs_0.strobe,
	wbs_write =>  Intercon_0_wbm_MEM_0_wbs_0.write,
	wbs_ack =>  Intercon_0_wbm_MEM_0_wbs_0.ack,	
	
	-- Logic signals
  write_in => MAX_0_mem_write_MEM_0_write_in,
  addr_in => MAX_0_write_addr_MEM_0_addr_in,
  data_in => MAX_0_mem_out_MEM_0_data_in,
  data_out => open
);

GPIO_0 : wishbone_gpio
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_GPIO_0_wbs_0.address,
	wbs_writedata =>  Intercon_0_wbm_GPIO_0_wbs_0.writedata,
	wbs_readdata =>  Intercon_0_wbm_GPIO_0_wbs_0.readdata,
	wbs_cycle =>  Intercon_0_wbm_GPIO_0_wbs_0.cycle,
	wbs_strobe =>  Intercon_0_wbm_GPIO_0_wbs_0.strobe,
	wbs_write =>  Intercon_0_wbm_GPIO_0_wbs_0.write,
	wbs_ack =>  Intercon_0_wbm_GPIO_0_wbs_0.ack,	
	
	-- Logic signals
  gpio(0) => PMOD2(0), -- led on
  gpio(1) => dir(0),
  gpio(2) => dir(1),
  gpio(15 downto 3) => open
);

PWM_0 : wishbone_pwm
generic map( nb_chan => 2)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_PWM_0_wbs_0.address,
	wbs_writedata =>  Intercon_0_wbm_PWM_0_wbs_0.writedata,
	wbs_readdata =>  Intercon_0_wbm_PWM_0_wbs_0.readdata,
	wbs_cycle =>  Intercon_0_wbm_PWM_0_wbs_0.cycle,
	wbs_strobe =>  Intercon_0_wbm_PWM_0_wbs_0.strobe,
	wbs_write =>  Intercon_0_wbm_PWM_0_wbs_0.write,
	wbs_ack =>  Intercon_0_wbm_PWM_0_wbs_0.ack,	
	
	-- Logic signals
  pwm_out(0) => LED(0), 
  pwm_out(1) => ARD(3)
);

I2C_0 : wishbone_i2c_master
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_I2C_0_wbs_0.address,
	wbs_writedata =>  Intercon_0_wbm_I2C_0_wbs_0.writedata,
	wbs_readdata =>  Intercon_0_wbm_I2C_0_wbs_0.readdata,
	wbs_cycle =>  Intercon_0_wbm_I2C_0_wbs_0.cycle,
	wbs_strobe =>  Intercon_0_wbm_I2C_0_wbs_0.strobe,
	wbs_write =>  Intercon_0_wbm_I2C_0_wbs_0.write,
	wbs_ack =>  Intercon_0_wbm_I2C_0_wbs_0.ack,

	scl => PMOD2(6),
	sda => PMOD2(2)
);


FiFO_0 : wishbone_fifo 
generic map(ADDR_WIDTH => 16,
			WIDTH => 16, 
			SIZE => 4096, 
			BURST_SIZE => 512,
			SYNC_LOGIC_INTERFACE => true
			)
port map(
	gls_clk => gls_clk, 
	gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_FIFO_0_wbs_0.address,
	wbs_writedata =>  Intercon_0_wbm_FIFO_0_wbs_0.writedata,
	wbs_readdata =>  Intercon_0_wbm_FIFO_0_wbs_0.readdata,
	wbs_cycle =>  Intercon_0_wbm_FIFO_0_wbs_0.cycle,
	wbs_strobe =>  Intercon_0_wbm_FIFO_0_wbs_0.strobe,
	wbs_write =>  Intercon_0_wbm_FIFO_0_wbs_0.write,
	wbs_ack =>  Intercon_0_wbm_FIFO_0_wbs_0.ack,
		  
	-- logic signals
	write_fifo => fifo_write, 
	read_fifo => '0',
	fifo_input => fifo_data,
	fifo_output => open,
	read_fifo_empty => open, 
	read_fifo_full => open,
	write_fifo_empty => open, 
	write_fifo_full => open,
	write_fifo_threshold => open,
	read_fifo_threshold	=> open,
	write_fifo_reset => pipeline_reset,
	read_fifo_reset => open
);

YUV_TO_FIFO_0: yuv_to_fifo
port map(
	clk => gls_clk, 
	resetn =>  gls_resetn,
	sreset => pipeline_reset,
--	pixel_in_clk =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.clk,
--	pixel_in_hsync =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.hsync,
--	pixel_in_vsync =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.vsync,
--	pixel_in_y_data => CAM_0_pixel_out_SPLIT_0_pixel_in_0.y_data,
--	pixel_in_u_data => CAM_0_pixel_out_SPLIT_0_pixel_in_0.u_data,
--	pixel_in_v_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.v_data,
	pixel_in_clk =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.clk,
	pixel_in_hsync =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.hsync,
	pixel_in_vsync =>  SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.vsync,
	--pixel_in_y_data => SOBEL_0_pixel_y_out_MAX_0_pixel_in_0.data,
	pixel_in_y_data => std_logic_vector(SOBEL_0_y_grad_MAX_0_value_in(15 downto 8)),
	pixel_in_u_data => X"80",
	pixel_in_v_data => X"80",
	fifo_data => fifo_data,
	fifo_wr => fifo_write 

);


-- Connecting inputs
top_GPMC_CSN_Master_0_gpmc_csn_0 <= GPMC_CSN;
top_GPMC_OEN_Master_0_gpmc_oen_0 <= GPMC_OEN;
top_GPMC_WEN_Master_0_gpmc_wen_0 <= GPMC_WEN;
top_GPMC_ADVN_Master_0_gpmc_advn_0 <= GPMC_ADVN;
top_GPMC_CLK_Master_0_gpmc_clk_0 <= GPMC_CLK;
-- <= PB;
-- <= SW;

-- Connecting outputs
LED(1) <= dir(0);
ARD(2) <= dir(1);
-- Connecting inouts

GPMC_AD(15 downto 0) <= top_GPMC_AD_Master_0_gpmc_ad_0;
--top_GPMC_AD_Master_0_gpmc_ad_0 <= GPMC_AD(15 downto 0);


PMOD2(3) <= clk_cam_buff ;
cam_data <= PMOD1(3) & PMOD1(7) & PMOD1(2) & PMOD1(6) & PMOD1(1) & PMOD1(5) & PMOD1(0) & PMOD1(4) ;
cam_pclk <= PMOD2(7) ;
cam_href <= PMOD2(1) ;
cam_vsync <= PMOD2(5) ;
--PMOD2(0) <= (NOT gls_reset) ;

ARD(5 downto 4) <= (others => 'Z');
ARD(1 downto 0) <= (others => 'Z');
--(others => 'Z') <= ARD(5 downto 0);


ARD_SCL <= 'Z';
--'Z' <= ARD_SCL;


ARD_SDA <= 'Z';
--'Z' <= ARD_SDA;






-- system clock generation

PLL_BASE_inst : PLL_BASE generic map (
      BANDWIDTH      => "OPTIMIZED",        -- "HIGH", "LOW" or "OPTIMIZED" 
      CLKFBOUT_MULT  => 12 ,                 -- Multiply value for all CLKOUT clock outputs (1-64)
      CLKFBOUT_PHASE => 0.0,                -- Phase offset in degrees of the clock feedback output (0.0-360.0).
      CLKIN_PERIOD   => 20.00,              -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
      CLKOUT0_DIVIDE => 6,       CLKOUT1_DIVIDE => 25,
      CLKOUT2_DIVIDE => 1,       CLKOUT3_DIVIDE => 1,
      CLKOUT4_DIVIDE => 1,       CLKOUT5_DIVIDE => 1,
      -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
      CLKOUT0_DUTY_CYCLE => 0.5, CLKOUT1_DUTY_CYCLE => 0.5,
      CLKOUT2_DUTY_CYCLE => 0.5, CLKOUT3_DUTY_CYCLE => 0.5,
      CLKOUT4_DUTY_CYCLE => 0.5, CLKOUT5_DUTY_CYCLE => 0.5,
      -- CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
      CLKOUT0_PHASE => 0.0,      CLKOUT1_PHASE => 0.0, -- Capture clock
      CLKOUT2_PHASE => 0.0,      CLKOUT3_PHASE => 0.0,
      CLKOUT4_PHASE => 0.0,      CLKOUT5_PHASE => 0.0,
      
      CLK_FEEDBACK => "CLKFBOUT",           -- Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
      COMPENSATION => "SYSTEM_SYNCHRONOUS", -- "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
      DIVCLK_DIVIDE => 1,                   -- Division value for all output clocks (1-52)
      REF_JITTER => 0.1,                    -- Reference Clock Jitter in UI (0.000-0.999).
      RESET_ON_LOSS_OF_LOCK => FALSE        -- Must be set to FALSE
   ) port map (
      CLKFBOUT => clkfb, -- 1-bit output: PLL_BASE feedback output
      -- CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
      CLKOUT0 => gls_clk,      CLKOUT1 => clk_cam,
      CLKOUT2 => open,      CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => clk_locked,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => clkfb, -- 1-bit input: Feedback clock input
      CLKIN   => osc_buff,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

    -- Buffering of clocks
	BUFG_1 : BUFG port map (O => osc_buff,    I => OSC_FPGA);
	BUFG_2 : BUFG port map (O => clk_cam_buff,    I => clk_cam);

end structural ;