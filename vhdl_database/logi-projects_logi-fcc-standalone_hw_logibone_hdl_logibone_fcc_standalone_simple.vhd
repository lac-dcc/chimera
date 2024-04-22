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

entity logibone_fcc_standalone_simple is
    Port ( clk_50      : in  STD_LOGIC;
           led        : out  STD_LOGIC_VECTOR(1 downto 0);
			  sw        : in  STD_LOGIC_VECTOR(1 downto 0);
			  
			  PMOD1: inout std_logic_vector(7 downto 0); 
			  --clk = 
			  PMOD2 : inout std_logic_vector(7 downto 0);
			 		  
--			  PMOD2(7 downto 4): in std_logic_vector(3 downto 0);
--			  PMOD2(2 downto 0): in std_logic_vector(2 downto 0);
--			  PMOD2(3) : out std_logic;
			  
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
end logibone_fcc_standalone_simple;

architecture Behavioral of logibone_fcc_standalone_simple is
   constant test_width  : natural := 21;


	COMPONENT blinker
	PORT(
		clk : IN std_logic;
		i : IN std_logic;          
		o : OUT std_logic
		);
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
   signal sdram_test_addr : std_logic_vector(12 downto 0); 
   signal sdram_test_reset, cam_test_reset : std_logic ;
	signal sdram_test_dq : std_logic_vector(15 downto 0);
	signal vsync_from_interface : std_logic ;
	signal cam_data : std_logic_vector(7 downto 0);
	signal cam_pclk, cam_href, cam_vsync, cam_xclk : std_logic ;


	signal rom_addr : std_logic_vector(7 downto 0);
	signal rom_data : std_logic_vector(15 downto 0);
	for all : yuv_register_rom use entity work.yuv_register_rom(ov7670_qvga);
	
	begin
	
	sdram_test_reset <= not sw(0);
	cam_test_reset <= not sw(1);
	
	
	i_error_blink : blinker PORT MAP(
		clk => clk,
		i => error_testing,
		o => error_blink
		);
   
      led(0) <= cam_vsync ;
		led(1) <= error_blink when sw(0) = '0' else
					 '0' ;
   
	SDRAM_CKE <= '1' ;
	SDRAM_nRAS <= '1' ;
	SDRAM_nCAS <= '1' ;
	SDRAM_nWE <= '1' ;
	SDRAM_DQ <= sdram_test_dq;
	SDRAM_DQM <= (others => '0');
	SDRAM_BA <= (others => '0');
	SDRAM_ADDR <= sdram_test_addr;
	
	sdram_clk_forward : ODDR2
   generic map(DDR_ALIGNMENT => "NONE", INIT => '0', SRTYPE => "SYNC")
   port map (Q => SDRAM_CLK, C0 => CLK_MEM, C1 => not CLK_MEM, CE => not sdram_test_reset, R => '0', S => '0', D0 => '0', D1 => '1');
	
	process(CLK_MEM, sdram_test_reset)
	begin
		if sdram_test_reset ='1' then
			sdram_test_addr <= (others => '0') ;
			sdram_test_addr(0) <= '1' ;
			sdram_test_dq <= (others => '0') ;
			sdram_test_dq(sdram_test_dq'high) <= '1' ;
			error_testing <= '0' ;
		elsif rising_edge(CLK_MEM) then
			sdram_test_addr(sdram_test_addr'high downto 1) <= sdram_test_addr(sdram_test_addr'high-1 downto 0);
			sdram_test_addr(0) <= sdram_test_addr(sdram_test_addr'high);
			sdram_test_dq(sdram_test_dq'high-1 downto 0) <= sdram_test_dq(sdram_test_dq'high downto 1);
			sdram_test_dq(sdram_test_dq'high) <= sdram_test_dq(0);		
			error_testing <= '1' ;
		end if ;
	end process ;
	
	


	
	
	
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
		--25Mhz = M=8 D=16
		--23.5Mhz = M=8 D=17
		--8Mhz = 	M=8 D=50
		--4Mhz = 	M=8 D=100
		--3.125Mhz = 	M=8 D=128
      BANDWIDTH => "OPTIMIZED",             -- "HIGH", "LOW" or "OPTIMIZED" 
      CLKFBOUT_MULT => 8,                  -- Multiply value for all CLKOUT clock outputs (1-64)
		CLKFBOUT_PHASE => 0.0,                -- Phase offset in degrees of the clock feedback output (0.0-360.0).
      --!CLKIN_PERIOD => 31.25,               -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      CLKIN_PERIOD => 20.00,               -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).

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