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

entity lbone_fcc_simple_nopll is
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
end lbone_fcc_simple_nopll;

architecture Behavioral of lbone_fcc_simple_nopll is
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
   --signal clk, clku, clk_mem, clk_memu, clkfb, clkb, clk_cam, clk_cam_buff, clk_locked   : std_logic;
   
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

	
	begin
	
	sdram_test_reset <= not sw(0);
	cam_test_reset <= not sw(1);
	
	
	i_error_blink : blinker PORT MAP(
		clk => clk_50,
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
	
	--sdram_clk_forward : ODDR2
   --generic map(DDR_ALIGNMENT => "NONE", INIT => '0', SRTYPE => "SYNC")
   --port map (Q => clk_50, C0 => clk_50, C1 => not clk_50, CE => not sdram_test_reset, R => '0', S => '0', D0 => '0', D1 => '1');
	
	SDRAM_CLK <= clk_50;
	
	process(clk_50, sdram_test_reset)
	begin
		if sdram_test_reset ='1' then
			sdram_test_addr <= (others => '0') ;
			sdram_test_addr(0) <= '1' ;
			sdram_test_dq <= (others => '0') ;
			sdram_test_dq(sdram_test_dq'high) <= '1' ;
			error_testing <= '0' ;
		elsif rising_edge(clk_50) then
			sdram_test_addr(sdram_test_addr'high downto 1) <= sdram_test_addr(sdram_test_addr'high-1 downto 0);
			sdram_test_addr(0) <= sdram_test_addr(sdram_test_addr'high);
			sdram_test_dq(sdram_test_dq'high-1 downto 0) <= sdram_test_dq(sdram_test_dq'high downto 1);
			sdram_test_dq(sdram_test_dq'high) <= sdram_test_dq(0);		
			error_testing <= '1' ;
		end if ;
	end process ;
	
	


	
	
	



end Behavioral;