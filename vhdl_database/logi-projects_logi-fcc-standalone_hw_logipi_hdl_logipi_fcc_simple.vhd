----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: Top level module for the LogiPi SDRAM controller project 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity logipi_fcc_simple is
    Port ( clk_50      : in  STD_LOGIC;
           led        : out  STD_LOGIC_VECTOR(1 downto 0);
			  sw : in std_logic_vector(1 downto 0);
			  
			  PMOD2, PMOD3 : inout std_logic_vector(7 downto 0);
			  
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
end logipi_fcc_simple;

architecture Behavioral of logipi_fcc_simple is
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

   
	
	component sseg_4x is
	generic(
		  clock_freq_hz : natural := 100_000_000;
		  refresh_rate_hz : natural := 100
	 );
	port(
		  clk, reset : in std_logic ;
		  bcd_in : in std_logic_vector(15 downto 0);
			
			  -- SSEG to EDU from Host
		  sseg_cathode_out : out std_logic_vector(4 downto 0); -- common cathode
		  sseg_anode_out : out std_logic_vector(7 downto 0) -- sseg anode	  

	);
	end component;

   -- signals for clocking
   signal clk, clku, clk_mem, clk_memu, clkfb, clkb, clk_cam, clk_cam_buff   : std_logic;
   
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
 
   signal sdram_test_reset, sseg_test_reset : std_logic ;
	
	-- logic signals
	signal sseg_edu_cathode_out : std_logic_vector(4 downto 0);
	signal sseg_edu_anode_out : std_logic_vector(7 downto 0);
	
	--bcd counter 
	signal unit_cnt, ten_cnt, hundred_cnt, thousand_cnt : std_logic_vector(3 downto 0);
	signal divider_cnt  : std_logic_vector(31 downto 0); 
	
	signal sdram_test_addr : std_logic_vector(12 downto 0); 
	signal sdram_test_dq : std_logic_vector(15 downto 0);
	
	signal led_counter : std_logic_vector(24 downto 0);
	
	begin
	
	sdram_test_reset <= not(sw(0));
	sseg_test_reset <= not(sw(1));
	
	
	i_error_blink : blinker PORT MAP(
		clk => clk,
		i => error_testing,
		o => error_blink
		);
   
      led(0) <= blink;
		led(1) <= error_blink ;


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
	
   
   debug <= tester_debug;
	
	

	
	

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


	--sseg blinker
	process(clk, sseg_test_reset)
	begin
		if sseg_test_reset = '1' then
			led_counter <= (others=>'0');
		elsif clk'event and clk = '1' then
			led_counter <= led_counter +1;
		end if;
	end process;
	blink <= led_counter(22);
	

process(clk, sseg_test_reset)
begin
	if sseg_test_reset = '1' then
		unit_cnt <= (others => '0');
		ten_cnt <= (others => '0');
		hundred_cnt  <= (others => '0');
		thousand_cnt  <= (others => '0');
		divider_cnt <= std_logic_vector(to_unsigned(9_999_999, 32));
	elsif clk'event and clk = '1' then
			if divider_cnt = 0 then
				divider_cnt <= std_logic_vector(to_unsigned(9_999_999, 32));
				unit_cnt <= unit_cnt + 1 ;
				if unit_cnt = 9 then
					unit_cnt <= (others => '0');
					ten_cnt <= ten_cnt + 1 ;
					if ten_cnt = 9 then
						ten_cnt <= (others => '0');
						hundred_cnt <= hundred_cnt + 1 ;
						if hundred_cnt = 9 then
							hundred_cnt <= (others => '0');
							thousand_cnt <= thousand_cnt + 1;
							if thousand_cnt = 9 then
								thousand_cnt <= (others => '0');
							end if ;
						end if ;
					 end if ;
				  end if ;
				else
				divider_cnt <= divider_cnt - 1 ;
			   end if ;
	end if ;
end process ;


SSEG_0 : sseg_4x 
generic map(
		  clock_freq_hz => 50_000_000,
		  refresh_rate_hz => 100
	 )
port map(
		  clk => clk, reset => sseg_test_reset,
		  bcd_in =>  thousand_cnt & hundred_cnt & ten_cnt & unit_cnt,
			  -- SSEG to EDU from Host
			sseg_cathode_out => sseg_edu_cathode_out,
			sseg_anode_out => sseg_edu_anode_out

);

--LOGI-EDU R1.0
--	PMOD2(4) <= sseg_edu_cathode_out(0); -- cathode 0
--	PMOD2(0) <= sseg_edu_cathode_out(1); -- cathode 1
--	PMOD2(2) <= sseg_edu_cathode_out(2); -- cathode 2
--	PMOD2(3) <= sseg_edu_cathode_out(3); -- cathode 3
--	PMOD2(1) <= sseg_edu_cathode_out(4); -- cathode 4
--
--	PMOD3(5) <= sseg_edu_anode_out(0); --A
--	PMOD3(4) <= sseg_edu_anode_out(1); --B
--	PMOD3(1) <= sseg_edu_anode_out(2); --C
--	PMOD2(5) <= sseg_edu_anode_out(3); --D
--	PMOD2(6) <= sseg_edu_anode_out(4); --E
--	PMOD3(6) <= sseg_edu_anode_out(5); --F
--	PMOD3(0) <= sseg_edu_anode_out(6); --G
--	PMOD2(7) <= sseg_edu_anode_out(7); --DP

--LOGI-EDU R1.1 150406
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
      CLKOUT2_DIVIDE => 128,  
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
      CLKOUT0 => CLKu,      CLKOUT1 => CLK_MEMu,
      CLKOUT2 => open,      CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => open,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => CLKFB, -- 1-bit input: Feedback clock input
      CLKIN   => clkb,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

   -- Buffering of clocks
BUFG_1 : BUFG port map (O => clkb,    I => clk_50);
BUFG_2 : BUFG port map (O => clk_MEM, I => clk_MEMu);
BUFG_3 : BUFG port map (O => clk,     I => clku);

end Behavioral;
