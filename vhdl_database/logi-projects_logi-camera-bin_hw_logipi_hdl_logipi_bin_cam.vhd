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
use work.logi_wishbone_peripherals_pack.all ;
use work.logi_wishbone_pack.all ;
use work.interface_pack.all ;
use work.image_pack.all ;
use work.filter_pack.all ;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity logipi_bin_cam is
port( OSC_FPGA : in std_logic;

		--onboard
		PB : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);	
		
		--PMODS
		PMOD4 : inout std_logic_vector(7 downto 0);
		PMOD3 : in std_logic_vector(7 downto 0); -- used as cam data
		
		--i2c
		SYS_SCL, SYS_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, RP_SPI_CE0N, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic
		
);
end logipi_bin_cam;

architecture Behavioral of logipi_bin_cam is



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

	signal CAM_0_pixel_out_SPLIT_0_pixel_in_0 : yuv_pixel_bus;
	signal SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0 : y_pixel_bus;
	signal THRESH_0_pixel_out_ERODE_0_pixel_in_0 : y_pixel_bus;
	signal ERODE_0_pixel_out_DILATE_0_pixel_in_0 : y_pixel_bus;
	signal DILATE_0_pixel_out_FIFO_0_pixel_in_0 : y_pixel_bus;

	signal Intercon_0_wbm_I2C_0_wbs_0 : wishbone_bus;
	signal Intercon_0_wbm_REG_0_wbs_0 : wishbone_bus;
	signal Intercon_0_wbm_FIFO_0_wbs_0 : wishbone_bus;

	signal cam_data : std_logic_vector(7 downto 0);
	signal cam_pclk, cam_href, cam_vsync : std_logic ;
	
	signal clk_cam, clk_cam_buff : std_logic ;
	signal fifo_data : std_logic_vector(15 downto 0);
	signal fifo_write, pipeline_reset : std_logic ;
	signal dir : std_logic_vector(1 downto 0);

	signal threshold_value : std_logic_vector(7 downto 0);
begin
	
	
gls_reset <= (NOT clk_locked); -- system reset while clock not locked
gls_resetn <= not gls_reset ;


spi2wishbone : spi_wishbone_wrapper 
port map
    (
      -- SPI SIGNALS
      mosi => SYS_SPI_MOSI, 
		ss => RP_SPI_CE0N, 
		sck => SYS_SPI_SCK,
	   miso => SYS_SPI_MISO,
		
      -- Global Signals
      gls_reset => gls_reset,
      gls_clk   => gls_clk,
      -- Wishbone interface signals
      wbm_address    => Master_0_wbm_Intercon_0_wbs_0.address,  -- Address bus
      wbm_readdata   => Master_0_wbm_Intercon_0_wbs_0.readdata,  -- Data bus for read access
      wbm_writedata 	=> Master_0_wbm_Intercon_0_wbs_0.writedata,  -- Data bus for write access
      wbm_strobe     => Master_0_wbm_Intercon_0_wbs_0.strobe,                      -- Data Strobe
      wbm_write      => Master_0_wbm_Intercon_0_wbs_0.write,                      -- Write access
      wbm_ack        => Master_0_wbm_Intercon_0_wbs_0.ack,                      -- acknowledge
      wbm_cycle      => Master_0_wbm_Intercon_0_wbs_0.cycle                       -- bus cycle in progress
    );



						
	intercon0 : wishbone_intercon
generic map(memory_map => ("00000XXXXXXXXXXX", --fifo0
									"000100000000000X", -- i2c0
									"00010000000001XX" -- reg0
)
)
port map(
		gls_reset => gls_reset,
		gls_clk   => gls_clk,
		
		
		wbs_address    => Master_0_wbm_Intercon_0_wbs_0.address,  	-- Address bus
		wbs_readdata   => Master_0_wbm_Intercon_0_wbs_0.readdata,  	-- Data bus for read access
		wbs_writedata 	=> Master_0_wbm_Intercon_0_wbs_0.writedata,  -- Data bus for write access
		wbs_strobe     => Master_0_wbm_Intercon_0_wbs_0.strobe,     -- Data Strobe
		wbs_write      => Master_0_wbm_Intercon_0_wbs_0.write,      -- Write access
		wbs_ack        => Master_0_wbm_Intercon_0_wbs_0.ack,        -- acknowledge
		wbs_cycle      => Master_0_wbm_Intercon_0_wbs_0.cycle,      -- bus cycle in progress
		
		-- Wishbone master signals
		wbm_address(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.address,
	wbm_address(1) =>  Intercon_0_wbm_I2C_0_wbs_0.address,
	wbm_address(2) =>  Intercon_0_wbm_REG_0_wbs_0.address,
	
	wbm_writedata(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.writedata,
	wbm_writedata(1) =>  Intercon_0_wbm_I2C_0_wbs_0.writedata,
	wbm_writedata(2) =>  Intercon_0_wbm_REG_0_wbs_0.writedata,	
	
	wbm_readdata(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.readdata,
	wbm_readdata(1) =>  Intercon_0_wbm_I2C_0_wbs_0.readdata,
	wbm_readdata(2) =>  Intercon_0_wbm_REG_0_wbs_0.readdata,

	wbm_cycle(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.cycle,
	wbm_cycle(1) =>  Intercon_0_wbm_I2C_0_wbs_0.cycle,
	wbm_cycle(2) =>  Intercon_0_wbm_REG_0_wbs_0.cycle,

	wbm_strobe(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.strobe,
	wbm_strobe(1) =>  Intercon_0_wbm_I2C_0_wbs_0.strobe,
	wbm_strobe(2) =>  Intercon_0_wbm_REG_0_wbs_0.strobe,
	
	wbm_write(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.write,
	wbm_write(1) =>  Intercon_0_wbm_I2C_0_wbs_0.write,
	wbm_write(2) =>  Intercon_0_wbm_REG_0_wbs_0.write,

	wbm_ack(0) =>  Intercon_0_wbm_FIFO_0_wbs_0.ack,
	wbm_ack(1) =>  Intercon_0_wbm_I2C_0_wbs_0.ack,
	wbm_ack(2) =>  Intercon_0_wbm_REG_0_wbs_0.ack
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

	scl => PMOD4(6),
	sda => PMOD4(2)
);

REG_0 : wishbone_register
generic map(nb_regs => 1)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_REG_0_wbs_0.address,
	wbs_writedata =>  Intercon_0_wbm_REG_0_wbs_0.writedata,
	wbs_readdata =>  Intercon_0_wbm_REG_0_wbs_0.readdata,
	wbs_cycle =>  Intercon_0_wbm_REG_0_wbs_0.cycle,
	wbs_strobe =>  Intercon_0_wbm_REG_0_wbs_0.strobe,
	wbs_write =>  Intercon_0_wbm_REG_0_wbs_0.write,
	wbs_ack =>  Intercon_0_wbm_REG_0_wbs_0.ack,

	reg_out(0)(15 downto 8) => open,
	reg_out(0)(7 downto 0) => threshold_value,
	reg_in(0)(15 downto 8) => X"00",
	reg_in(0)(7 downto 0) => threshold_value
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

Led(0) <= cam_vsync ;

SPLIT_0 : yuv_split
-- no generics
port map(
	pixel_in_clk =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.clk,
	pixel_in_hsync =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.hsync,
	pixel_in_vsync =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.vsync,
	pixel_in_y_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.y_data,
	pixel_in_u_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.u_data,
	pixel_in_v_data =>  CAM_0_pixel_out_SPLIT_0_pixel_in_0.v_data,

	pixel_y_out_clk =>  SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0.clk,
	pixel_y_out_hsync =>  SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0.hsync,
	pixel_y_out_vsync =>  SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0.vsync,
	pixel_y_out_data =>  SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0.data,

	pixel_u_out_clk =>  open,
	pixel_u_out_hsync =>  open,
	pixel_u_out_vsync =>  open,
	pixel_u_out_data =>  open,

	pixel_v_out_clk =>  open,
	pixel_v_out_hsync =>  open,
	pixel_v_out_vsync =>  open,
	pixel_v_out_data =>  open	
);

THRESHOLD_0 : threshold
port map(
	clk => gls_clk, resetn => gls_resetn,

	pixel_in_clk =>  SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0.clk,
	pixel_in_hsync =>  SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0.hsync,
	pixel_in_vsync =>  SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0.vsync,
	pixel_in_data =>  SPLIT_0_pixel_y_out_THRESH_0_pixel_in_0.data,

	pixel_out_clk =>  THRESH_0_pixel_out_ERODE_0_pixel_in_0.clk,
	pixel_out_hsync =>  THRESH_0_pixel_out_ERODE_0_pixel_in_0.hsync,
	pixel_out_vsync =>  THRESH_0_pixel_out_ERODE_0_pixel_in_0.vsync,
	pixel_out_data =>  THRESH_0_pixel_out_ERODE_0_pixel_in_0.data,
	
	threshold => threshold_value

);

ERODE_0 : erode3x3
generic map(
		  WIDTH => 640,
		  HEIGHT => 480)
port map(
	clk => gls_clk, resetn => gls_resetn,

	pixel_in_clk =>  THRESH_0_pixel_out_ERODE_0_pixel_in_0.clk,
	pixel_in_hsync =>  THRESH_0_pixel_out_ERODE_0_pixel_in_0.hsync,
	pixel_in_vsync =>  THRESH_0_pixel_out_ERODE_0_pixel_in_0.vsync,
	pixel_in_data =>  THRESH_0_pixel_out_ERODE_0_pixel_in_0.data,

	pixel_out_clk =>  ERODE_0_pixel_out_DILATE_0_pixel_in_0.clk,
	pixel_out_hsync =>  ERODE_0_pixel_out_DILATE_0_pixel_in_0.hsync,
	pixel_out_vsync =>  ERODE_0_pixel_out_DILATE_0_pixel_in_0.vsync,
	pixel_out_data =>  ERODE_0_pixel_out_DILATE_0_pixel_in_0.data

);


DILATE_0 : dilate3x3
generic map(
		  WIDTH => 640,
		  HEIGHT => 480)
port map(
	clk => gls_clk, resetn => gls_resetn,

	pixel_in_clk =>  ERODE_0_pixel_out_DILATE_0_pixel_in_0.clk,
	pixel_in_hsync =>  ERODE_0_pixel_out_DILATE_0_pixel_in_0.hsync,
	pixel_in_vsync =>  ERODE_0_pixel_out_DILATE_0_pixel_in_0.vsync,
	pixel_in_data =>  ERODE_0_pixel_out_DILATE_0_pixel_in_0.data,

	pixel_out_clk =>  DILATE_0_pixel_out_FIFO_0_pixel_in_0.clk,
	pixel_out_hsync =>  DILATE_0_pixel_out_FIFO_0_pixel_in_0.hsync,
	pixel_out_vsync =>  DILATE_0_pixel_out_FIFO_0_pixel_in_0.vsync,
	pixel_out_data =>  DILATE_0_pixel_out_FIFO_0_pixel_in_0.data

);
		
	PMOD4(3) <= clk_cam ;
	cam_data <= PMOD3(3) & PMOD3(7) & PMOD3(2) & PMOD3(6) & PMOD3(1) & PMOD3(5) & PMOD3(0) & PMOD3(4) ;
	cam_pclk <= PMOD4(7) ;
	cam_href <= PMOD4(1) ;
	cam_vsync <= PMOD4(5) ;
	PMOD4(0) <= '1' ;
	LED(1) <= cam_vsync ;

	

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

BIN_TO_FIFO_0: bin_to_fifo
generic map(ADD_SYNC => true)
port map(
	clk => gls_clk, 
	resetn =>  gls_resetn,
	sreset => pipeline_reset,
	pixel_in_clk =>  DILATE_0_pixel_out_FIFO_0_pixel_in_0.clk,
	pixel_in_hsync =>  DILATE_0_pixel_out_FIFO_0_pixel_in_0.hsync,
	pixel_in_vsync =>  DILATE_0_pixel_out_FIFO_0_pixel_in_0.vsync,
	pixel_in_data => DILATE_0_pixel_out_FIFO_0_pixel_in_0.data,
	fifo_data => fifo_data,
	fifo_wr => fifo_write 

);



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
	
	
end Behavioral;

