----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: Top level module for the LogiPi SDRAM controller project 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.conf_pack.all ;

entity logibone_fcc_standalone is
    Port ( clk_50      : in  STD_LOGIC;
           led        : out  STD_LOGIC_VECTOR(1 downto 0);
			  sw        : in  STD_LOGIC_VECTOR(1 downto 0);
			  
			  PMOD1, PMOD2 : inout std_logic_vector(7 downto 0);
			  
           SDRAM_CLK   : out  STD_LOGIC;
           SDRAM_CKE   : out  STD_LOGIC;
           SDRAM_nRAS  : out  STD_LOGIC;
			  
           SDRAM_nCAS  : out  STD_LOGIC;
           SDRAM_nWE   : out  STD_LOGIC;
           SDRAM_DQM   : out  STD_LOGIC_VECTOR( 1 downto 0);
           SDRAM_ADDR  : out  STD_LOGIC_VECTOR (12 downto 0);
           SDRAM_BA    : out   STD_LOGIC_VECTOR( 1 downto 0);
           SDRAM_DQ    : inout  STD_LOGIC_VECTOR (15 downto 0)
           
           );
end logibone_fcc_standalone;

architecture Behavioral of logibone_fcc_standalone is
   constant test_width  : natural := 21;

	COMPONENT SDRAM_Controller
	PORT(
		clk             : IN std_logic;
		clk_mem         : IN std_logic;-- not needed at the moment
		reset           : IN std_logic;
      
      -- Interface to issue commands
		cmd_ready       : OUT std_logic;
		cmd_enable      : IN std_logic;
		cmd_wr          : IN std_logic;
		cmd_address     : IN std_logic_vector(22 downto 0);
		cmd_byte_enable : IN std_logic_vector(3 downto 0);
		cmd_data_in     : IN std_logic_vector(31 downto 0);    
      
      -- Data being read back from SDRAM
		data_out        : OUT std_logic_vector(31 downto 0);
		data_out_ready  : OUT std_logic;

      -- SDRAM signals
		SDRAM_CLK       : OUT   std_logic;
		SDRAM_CKE       : OUT   std_logic;
		SDRAM_CS        : OUT   std_logic;
		SDRAM_RAS       : OUT   std_logic;
		SDRAM_CAS       : OUT   std_logic;
		SDRAM_WE        : OUT   std_logic;
		SDRAM_DQM       : OUT   std_logic_vector(1 downto 0);
		SDRAM_ADDR      : OUT   std_logic_vector(12 downto 0);
		SDRAM_BA        : OUT   std_logic_vector(1 downto 0);
		SDRAM_DATA      : INOUT std_logic_vector(15 downto 0)     
		);
	END COMPONENT;

	COMPONENT blinker
	PORT(
		clk : IN std_logic;
		i : IN std_logic;          
		o : OUT std_logic
		);
	END COMPONENT;

   
   COMPONENT Memory_tester
      Generic (address_width : natural := 23);
      Port ( clk           : in  STD_LOGIC;
				reset : in std_logic ;
           cmd_enable      : out std_logic;
           cmd_wr          : out std_logic;
           cmd_address     : out std_logic_vector(address_width-1 downto 0);
           cmd_byte_enable : out std_logic_vector(3 downto 0);
           cmd_data_in     : out std_logic_vector(31 downto 0);    
           cmd_ready       : in std_logic;

           data_out        : in std_logic_vector(31 downto 0);
           data_out_ready  : in std_logic;

           debug           : out std_logic_vector(15 downto 0);

           error_testing   : out STD_LOGIC;
           blink           : out STD_LOGIC);
   END COMPONENT;
	
	component yuv_camera_interface is
	port(
 		clock : in std_logic; 
 		resetn : in std_logic; 
 		pixel_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_y_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_u_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_v_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pclk, href,vsync : in std_logic
	); 
	end component;

   -- signals for clocking
   signal clk, clku, clk_mem, clk_memu, clkfb, clkb, clk_cam, clk_cam_buff, clk_locked   : std_logic;
   
   -- signals to interface with the memory controller
   signal cmd_address     : std_logic_vector(22 downto 0) := (others => '0');
   signal cmd_wr          : std_logic := '1';
   signal cmd_enable      : std_logic;
   signal cmd_byte_enable : std_logic_vector(3 downto 0);
   signal cmd_data_in     : std_logic_vector(31 downto 0);
   signal cmd_ready       : std_logic;
   signal data_out        : std_logic_vector(31 downto 0);
   signal data_out_ready  : std_logic;
   
   -- misc signals
   signal error_refresh   : std_logic;
   signal error_testing   : std_logic;
   signal blink           : std_logic;
   signal debug           : std_logic_vector(15 downto 0);
   signal tester_debug    : std_logic_vector(15 downto 0);
   signal is_idle         : std_logic;
   signal iob_data        : std_logic_vector(15 downto 0);      
   signal error_blink     : std_logic;
 
   signal sdram_test_reset, cam_test_reset : std_logic ;
	signal vsync_from_interface : std_logic ;
	signal cam_data : std_logic_vector(7 downto 0);
	signal cam_pclk, cam_href, cam_vsync, cam_xclk : std_logic ;


	signal rom_addr : std_logic_vector(7 downto 0);
	signal rom_data : std_logic_vector(15 downto 0);
	for all : yuv_register_rom use entity work.yuv_register_rom(ov7670_qvga);
	begin
	
	sdram_test_reset <= sw(0);
	cam_test_reset <= sw(1);
	
	
i_error_blink : blinker PORT MAP(
   clk => clk,
   i => error_testing,
   o => error_blink
   );
   
      led(0) <= blink xor error_blink when sw(0) = '0' else
					 vsync_from_interface when sw(1) = '0' else
					 '0'
					 ;
		led(1) <= error_blink when sw(0) = '0' else
					 '0' ;

Inst_Memory_tester: Memory_tester GENERIC MAP(address_width => test_width) PORT MAP(
      clk             => clk,
		reset => sdram_test_reset ,
      
      cmd_address     => cmd_address(test_width-1 downto 0),
      cmd_wr          => cmd_wr,
      cmd_enable      => cmd_enable,
      cmd_ready       => cmd_ready,
      cmd_byte_enable => cmd_byte_enable,
      cmd_data_in     => cmd_data_in,
      
      data_out        => data_out,
      data_out_ready  => data_out_ready,
      
      debug           => tester_debug,
      
      error_testing   => error_testing,
      blink           => blink
   );
   
   debug <= tester_debug;

Inst_SDRAM_Controller: SDRAM_Controller PORT MAP(
      clk             => clk,
      clk_mem         => clk_mem,
      reset           => sdram_test_reset,

      cmd_address     => cmd_address,
      cmd_wr          => cmd_wr,
      cmd_enable      => cmd_enable,
      cmd_ready       => cmd_ready,
      cmd_byte_enable => cmd_byte_enable,
      cmd_data_in     => cmd_data_in,
      
      data_out        => data_out,
      data_out_ready  => data_out_ready,
   
      SDRAM_CLK       => SDRAM_CLK,
      SDRAM_CKE       => SDRAM_CKE,
      SDRAM_CS        => open,
      SDRAM_RAS       => SDRAM_nRAS,
      SDRAM_CAS       => SDRAM_nCAS,
      SDRAM_WE        => SDRAM_nWE,
      SDRAM_DQM       => SDRAM_DQM,
      SDRAM_BA        => SDRAM_BA,
      SDRAM_ADDR      => SDRAM_ADDR,
      SDRAM_DATA      => SDRAM_DQ
   );


	conf_rom : yuv_register_rom
		port map(
			clk => clk_cam_buff, en => '1' ,
			data => rom_data,
			addr => rom_addr
		);

	camera_conf_block : i2c_conf 
		generic map(ADD_WIDTH => 8 , SLAVE_ADD => "0100001")
		port map(
			clock => clk_cam_buff,  -- clk divider for i2c was fixed, need to move to generic
			resetn => not clk_locked ,		
			i2c_clk => clk_cam_buff ,
			scl => PMOD2(6),
			sda => PMOD2(2), 
			reg_addr => rom_addr ,
			reg_data => rom_data
		);	

	camera0: yuv_camera_interface
		port map(
			clock => clk,
			resetn => cam_test_reset,
			pixel_data => cam_data, 
			pclk => cam_pclk, href => cam_href, vsync => cam_vsync,
			pixel_out_clk => open, pixel_out_hsync => open, pixel_out_vsync => vsync_from_interface,
			pixel_out_y_data => open,
			pixel_out_u_data => open,
			pixel_out_v_data => open
					
		);	
		
	cam_xclk <= clk_cam_buff;
	PMOD2(3) <= cam_xclk when cam_test_reset = '0' else	
					'0' ;
	cam_data <= PMOD1(3) & PMOD1(7) & PMOD1(2) & PMOD1(6) & PMOD1(1) & PMOD1(5) & PMOD1(0) & PMOD1(4) ;
	cam_pclk <= PMOD2(7) ;
	cam_href <= PMOD2(1) ;
	cam_vsync <= PMOD2(5) ;
	PMOD2(0) <= 'Z' ;
   
PLL_BASE_inst : PLL_BASE generic map (
		--100mhz: 	M=12, D=6 ; M=8 D=4
		--75Mhz 		M=12, D=8 
		--50Mhz = 	M=12 D=12
		--100mhz: 	M=12, D=6 
		--75Mhz 		M=12, D=8 
		--50Mhz = 	M=12 D=12 ; M=8 D=8
		--30Mhz = 	M=8 D=13
		--23.5Mhz = 	M=8 D=17
		--8Mhz = 	M=8 D=50
		--4Mhz = 	M=8 D=100
		--3.125Mhz = 	M=8 D=128
      BANDWIDTH => "OPTIMIZED",             -- "HIGH", "LOW" or "OPTIMIZED" 
      CLKFBOUT_MULT => 8,                   -- Multiply value for all CLKOUT clock outputs (1-64)
		CLKFBOUT_PHASE => 0.0,                -- Phase offset in degrees of the clock feedback output (0.0-360.0).
      --!CLKIN_PERIOD => 31.25,             -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      CLKIN_PERIOD => 20.00,                -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).

      -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
		CLKOUT0_DIVIDE => 8,  --SYSCLK = clk
		CLKOUT1_DIVIDE => 10,  --SDRAM
      CLKOUT2_DIVIDE => 128,  --CAM 
		CLKOUT3_DIVIDE => 128,
      CLKOUT4_DIVIDE => 128,       CLKOUT5_DIVIDE => 1,
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
      CLKFBOUT => CLKFB, -- 1-bit output: PLL_BASE feedback output
      -- CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
      CLKOUT0 => clku,      CLKOUT1 => CLK_MEMu,
      CLKOUT2 => clk_cam,   CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => clk_locked,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => CLKFB, -- 1-bit input: Feedback clock input
      CLKIN   => clkb,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

   -- Buffering of clocks
BUFG_1 : BUFG port map (O => clkb,    I => clk_50);
BUFG_2 : BUFG port map (O => CLK_MEM, I => CLK_MEMu);
BUFG_3 : BUFG port map (O => clk,     I => clku);
BUFG_4 : BUFG port map (O => clk_cam_buff,    I => clk_cam);



end Behavioral;