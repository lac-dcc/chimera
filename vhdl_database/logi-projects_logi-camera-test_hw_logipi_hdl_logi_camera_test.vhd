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
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.interface_pack.all ;
use work.conf_pack.all ;
use work.image_pack.all ;
use work.primitive_pack.all ;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity logi_camera_test is
port( OSC_FPGA : in std_logic;

		--onboard
		PB : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);	
		
		--PMODS
		PMOD4 : inout std_logic_vector(7 downto 0);
		PMOD3 : inout std_logic_vector(7 downto 0);
	
		--i2c
		SYS_SCL, SYS_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, RP_SPI_CE0N, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic ;
		
		--flash
		CS_FLASH : out std_logic 
);
end logi_camera_test;

architecture Behavioral of logi_camera_test is
	
	-- Systemc clocking and reset
	signal gls_clk, clk_100,  clk_96, clk_24, clk_locked : std_logic ;
	signal osc_buff, clkfb : std_logic ;
	signal gls_reset , gls_resetn : std_logic ;
	
	
	-- wishbone intercon signals
	signal intercon_wrapper_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_strobe :  std_logic;
	signal intercon_wrapper_wbm_write :  std_logic;
	signal intercon_wrapper_wbm_ack :  std_logic;
	signal intercon_wrapper_wbm_cycle :  std_logic;

	signal intercon_fifo0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_fifo0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_fifo0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_fifo0_wbm_strobe :  std_logic;
	signal intercon_fifo0_wbm_write :  std_logic;
	signal intercon_fifo0_wbm_ack :  std_logic;
	signal intercon_fifo0_wbm_cycle :  std_logic;
	
	signal intercon_reg0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_reg0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_reg0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_reg0_wbm_strobe :  std_logic;
	signal intercon_reg0_wbm_write :  std_logic;
	signal intercon_reg0_wbm_ack :  std_logic;
	signal intercon_reg0_wbm_cycle :  std_logic;
	
	signal intercon_mem0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_strobe :  std_logic;
	signal intercon_mem0_wbm_write :  std_logic;
	signal intercon_mem0_wbm_ack :  std_logic;
	signal intercon_mem0_wbm_cycle :  std_logic;

	
	
	-- Camera configuration and interface signals
	signal cam_data : std_logic_vector(7 downto 0);
	signal cam_sioc, cam_siod : std_logic ;
	signal cam_xclk, cam_pclk, cam_vsync, cam_href, cam_reset : std_logic ;
	signal rom_addr : std_logic_vector(7 downto 0);
	signal rom_data : std_logic_vector(15 downto 0);
	
	
	--Pixel pipeline signals
	signal pixel_y_from_interface, pixel_u_from_interface, pixel_v_from_interface : std_logic_vector(7 downto 0);
	signal pxclk_from_interface, href_from_interface, vsync_from_interface : std_logic ;
	
	signal pixel_y_from_ds, pixel_u_from_ds, pixel_v_from_ds : std_logic_vector(7 downto 0);
	signal pxclk_from_ds, href_from_ds, vsync_from_ds : std_logic ;
	
	signal preview_fifo_wr : std_logic ;
	signal preview_fifo_input : std_logic_vector(15 downto 0);
	signal reset_pipeline : std_logic ;
	signal cam_conf_reset : std_logic ;
	
--	for all : yuv_register_rom use entity work.yuv_register_rom(ov7725_qvga);
--	for all : yuv_register_rom use entity work.yuv_register_rom(ov7670_qvga);
	constant IMAGE_WIDTH : integer := 320 ;
	constant IMAGE_HEIGHT : integer := 240 ;
begin
	
	CS_FLASH <= '1' ;

	gls_clk <= clk_100 ;

	gls_reset <= not clk_locked ;
	gls_resetn <= not gls_reset ;


	LED(0) <= gls_resetn;
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
				
	intercon0 : wishbone_intercon
		generic map(memory_map => 
		("0000000000000XXX", -- fifo0
       "0000000000001000", -- reg0
		 "00000001XXXXXXXX" -- mem0
		))
		port map(
			gls_reset => gls_reset,
				gls_clk   => gls_clk,
			
			
			wbs_address    => intercon_wrapper_wbm_address,  	-- Address bus
			wbs_readdata   => intercon_wrapper_wbm_readdata,  	-- Data bus for read access
			wbs_writedata 	=> intercon_wrapper_wbm_writedata,  -- Data bus for write access
			wbs_strobe     => intercon_wrapper_wbm_strobe,                      -- Data Strobe
			wbs_write      => intercon_wrapper_wbm_write,                      -- Write access
			wbs_ack        => intercon_wrapper_wbm_ack,                      -- acknowledge
			wbs_cycle      => intercon_wrapper_wbm_cycle,                       -- bus cycle in progress
			
			-- Wishbone master signals
			wbm_address(0) => intercon_fifo0_wbm_address,
			wbm_address(1) => intercon_reg0_wbm_address,
			wbm_address(2) => intercon_mem0_wbm_address,
			
			wbm_writedata(0)  => intercon_fifo0_wbm_writedata,
			wbm_writedata(1)  => intercon_reg0_wbm_writedata,
			wbm_writedata(2)  => intercon_mem0_wbm_writedata,
			
			wbm_readdata(0)  => intercon_fifo0_wbm_readdata,
			wbm_readdata(1)  => intercon_reg0_wbm_readdata,
			wbm_readdata(2)  => intercon_mem0_wbm_readdata,

			wbm_strobe(0)  => intercon_fifo0_wbm_strobe,
			wbm_strobe(1)  => intercon_reg0_wbm_strobe,
			wbm_strobe(2)  => intercon_mem0_wbm_strobe,
			
			wbm_cycle(0)   => intercon_fifo0_wbm_cycle,
			wbm_cycle(1)   => intercon_reg0_wbm_cycle,
			wbm_cycle(2)   => intercon_mem0_wbm_cycle,

			wbm_write(0)   => intercon_fifo0_wbm_write,
			wbm_write(1)   => intercon_reg0_wbm_write,
			wbm_write(2)   => intercon_mem0_wbm_write,
			
			wbm_ack(0)      => intercon_fifo0_wbm_ack,
			wbm_ack(1)      => intercon_reg0_wbm_ack,
			wbm_ack(2)      => intercon_mem0_wbm_ack			
		);			
						
	fifo0 : wishbone_fifo
	generic map( ADDR_WIDTH => 16,
				WIDTH	=> 16,
				SIZE	=> 4096,
				BURST_SIZE => 4,
				SYNC_LOGIC_INTERFACE => true 
				)
	port map(
		-- Syscon signals
		gls_reset => gls_reset,
		gls_clk   => gls_clk,
		-- Wishbone signals
		wbs_address => intercon_fifo0_wbm_address,
		wbs_writedata => intercon_fifo0_wbm_writedata,
		wbs_readdata  => intercon_fifo0_wbm_readdata,
		wbs_strobe    => intercon_fifo0_wbm_strobe,
		wbs_cycle     => intercon_fifo0_wbm_cycle,
		wbs_write     => intercon_fifo0_wbm_write,
		wbs_ack       => intercon_fifo0_wbm_ack,
			  
		-- logic signals  
		write_fifo => preview_fifo_wr, read_fifo=> '0',
		fifo_input => preview_fifo_input,
		fifo_output => open,
		read_fifo_empty => open, 
		read_fifo_full => open,
		write_fifo_empty => open, 
		write_fifo_full => open,
		write_fifo_threshold => open,
		read_fifo_threshold	=> open,
		write_fifo_reset => reset_pipeline,
		read_fifo_reset => open
	);

 
 
-- Camera Interface and configuration instantiation 
dyn_conf_rom :  wishbone_shared_mem
	generic map( mem_size=> 256,
				wb_size  => 16 , -- Data port size for wishbone
				wb_addr_size => 16  -- Data port size for wishbone
			  )
	port map(
			-- Syscon signals
			gls_reset => gls_reset,
			gls_clk   => gls_clk,
			-- Wishbone signals
			wbs_address => intercon_mem0_wbm_address,
			wbs_writedata => intercon_mem0_wbm_writedata,
			wbs_readdata  => intercon_mem0_wbm_readdata,
			wbs_strobe    => intercon_mem0_wbm_strobe,
			wbs_cycle     => intercon_mem0_wbm_cycle,
			wbs_write     => intercon_mem0_wbm_write,
			wbs_ack       => intercon_mem0_wbm_ack,


			-- Logic signals
			write_in => '0' ,
			addr_in => "00" & rom_addr,
			data_in => (others => '0'),
			data_out => rom_data
	);

-- Camera Interface and configuration instantiation 
cam_control_reg :  wishbone_register
	generic map( nb_regs=> 1,
				wb_size  => 16  -- Data port size for wishbone
			  )
	port map(
			-- Syscon signals
			gls_reset => gls_reset,
			gls_clk   => gls_clk,
			-- Wishbone signals
			wbs_address => intercon_reg0_wbm_address,
			wbs_writedata => intercon_reg0_wbm_writedata,
			wbs_readdata  => intercon_reg0_wbm_readdata,
			wbs_strobe    => intercon_reg0_wbm_strobe,
			wbs_cycle     => intercon_reg0_wbm_cycle,
			wbs_write     => intercon_reg0_wbm_write,
			wbs_ack       => intercon_reg0_wbm_ack,


			-- Logic signals
			reg_out(0)(15 downto 1) => open,
			reg_out(0)(0) => cam_conf_reset,
			reg_in(0) => X"BEEF"
	);


--	conf_rom : yuv_register_rom
--		port map(
--			clk => clk_24, en => '1' ,
--			data => rom_data,
--			addr => rom_addr
--		); 
 
	camera_conf_block : i2c_conf 
		generic map(ADD_WIDTH => 8 , SLAVE_ADD => "0100001")
		port map(
			clock => clk_24,  -- clk divider for i2c was fixed, need to move to generic
			resetn => cam_conf_reset ,		
			i2c_clk => clk_24 ,
			scl => PMOD4(6),
			sda => PMOD4(2), 
			reg_addr => rom_addr ,
			reg_data => rom_data
		);	
 
		
	camera0: yuv_camera_interface
		port map(
			clock => gls_clk,
			resetn => gls_resetn,
			pixel_data => cam_data, 
			pclk => cam_pclk, href => cam_href, vsync => cam_vsync,
			pixel_out_clk => pxclk_from_interface, 
			pixel_out_hsync => href_from_interface, 
			pixel_out_vsync => vsync_from_interface,
			pixel_out_y_data => pixel_y_from_interface,
			pixel_out_u_data => pixel_u_from_interface,
			pixel_out_v_data => pixel_v_from_interface
					
		);	
		
	cam_xclk <= clk_24;
	PMOD4(3) <= cam_xclk ;
	cam_data <= PMOD3(3) & PMOD3(7) & PMOD3(2) & PMOD3(6) & PMOD3(1) & PMOD3(5) & PMOD3(0) & PMOD3(4) ;
	cam_pclk <= PMOD4(7) ;
	cam_href <= PMOD4(1) ;
	cam_vsync <= PMOD4(5) ;
	PMOD4(0) <= cam_reset ;
	cam_reset <= gls_resetn ;

	LED(1) <= vsync_from_ds ;
	
	ds_image : down_scaler
		generic map(SCALING_FACTOR => 2, INPUT_WIDTH => IMAGE_WIDTH, INPUT_HEIGHT => IMAGE_HEIGHT )
		port map(
			clk => gls_clk,
			resetn => gls_resetn,
			pixel_in_clk => pxclk_from_interface, 
			pixel_in_hsync => href_from_interface,
			pixel_in_vsync => vsync_from_interface,
			pixel_out_clk => pxclk_from_ds, 
			pixel_out_hsync => href_from_ds, 
			pixel_out_vsync=> vsync_from_ds,
			pixel_in_data => pixel_y_from_interface,
			pixel_out_data => pixel_y_from_ds
		); 
		
		pixel_to_fifo : yuv_to_fifo
		port map(
			clk => gls_clk, resetn => gls_resetn,
			sreset => reset_pipeline , -- should wire to a register to allow to reset 
			pixel_in_clk => pxclk_from_ds, 
			pixel_in_hsync => href_from_ds, 
			pixel_in_vsync => vsync_from_ds,
			pixel_in_y_data => pixel_y_from_ds,
			pixel_in_u_data => pixel_u_from_interface,--pixel_u_from_interface,
			pixel_in_v_data => pixel_v_from_interface,
			fifo_data => preview_fifo_input,
			fifo_wr => preview_fifo_wr
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
      CLKOUT0 => clk_100,      CLKOUT1 => clk_24,
      CLKOUT2 => open,      CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => clk_locked,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => clkfb, -- 1-bit input: Feedback clock input
      CLKIN   => osc_buff,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

    -- Buffering of clocks
	BUFG_1 : BUFG port map (O => osc_buff,    I => OSC_FPGA);

end Behavioral;

