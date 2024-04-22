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

entity logipi_wishbone is
port( OSC_FPGA : in std_logic;

		--onboard
		PB : in std_logic_vector(1 downto 0);
		SW : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);	
		
		PMOD3 : inout std_logic_vector(7 downto 0); 
		
		PMOD4 : inout std_logic_vector(7 downto 0); 
		
		PMOD2 : inout std_logic_vector(7 downto 0); 
		
		PMOD1 : inout std_logic_vector(7 downto 0); 
		--i2c
		SYS_SCL, SYS_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, RP_SPI_CE0N, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic
);
end logipi_wishbone;

architecture Behavioral of logipi_wishbone is


	-- syscon
	signal sys_reset, sys_resetn,sys_clk, clock_locked : std_logic ;
	signal clk_100Mhz, clk_100Mhz_pll, osc_buff, clkfb  : std_logic ;

	-- wishbone intercon signals
	signal intercon_wrapper_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_strobe :  std_logic;
	signal intercon_wrapper_wbm_write :  std_logic;
	signal intercon_wrapper_wbm_ack :  std_logic;
	signal intercon_wrapper_wbm_cycle :  std_logic;

	signal intercon_register_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_register_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_register_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_register_wbm_strobe :  std_logic;
	signal intercon_register_wbm_write :  std_logic;
	signal intercon_register_wbm_ack :  std_logic;
	signal intercon_register_wbm_cycle :  std_logic;

	signal intercon_pwm0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_pwm0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_pwm0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_pwm0_wbm_strobe :  std_logic;
	signal intercon_pwm0_wbm_write :  std_logic;
	signal intercon_pwm0_wbm_ack :  std_logic;
	signal intercon_pwm0_wbm_cycle :  std_logic;
	
	signal intercon_mem0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_strobe :  std_logic;
	signal intercon_mem0_wbm_write :  std_logic;
	signal intercon_mem0_wbm_ack :  std_logic;
	signal intercon_mem0_wbm_cycle :  std_logic;
	
	signal pwm0_cs, reg_cs, mem0_cs : std_logic ;
	

-- registers signals
	signal loopback_sig, signal_input, signal_output : std_logic_vector(15 downto 0);
	signal dummy_sig0, dummy_sig1 : std_logic_vector(15 downto 0);
	signal dummy_pwm0 : std_logic ;
begin

--LED(1) <= (GPMC_BEN(0) XOR GPMC_BEN(1)) ;

sys_reset <= NOT PB(0); 
sys_resetn <= NOT sys_reset ; -- for preipherals with active low reset

sys_clk <= clk_100Mhz;




mem_interface0 : spi_wishbone_wrapper
		port map(
			-- Global Signals
			gls_reset => sys_reset,
			gls_clk   => sys_clk,
			
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

reg_cs <= '1' when intercon_wrapper_wbm_address(15 downto 2) = "00000000000000" else
				'0' ;
				
pwm0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 3) = "00000000000001"  else --1000 = 0x08
			 '0' ;
			 
mem0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 11) = "00001"  else
			 '0' ;


intercon_pwm0_wbm_address <= intercon_wrapper_wbm_address ;
intercon_pwm0_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_pwm0_wbm_write <= intercon_wrapper_wbm_write and pwm0_cs ;
intercon_pwm0_wbm_strobe <= intercon_wrapper_wbm_strobe and pwm0_cs ;
intercon_pwm0_wbm_cycle <= intercon_wrapper_wbm_cycle and pwm0_cs ;

intercon_register_wbm_address <= intercon_wrapper_wbm_address ;
intercon_register_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_register_wbm_write <= intercon_wrapper_wbm_write and reg_cs ;
intercon_register_wbm_strobe <= intercon_wrapper_wbm_strobe and reg_cs ;
intercon_register_wbm_cycle <= intercon_wrapper_wbm_cycle and reg_cs ;		

intercon_mem0_wbm_address <= intercon_wrapper_wbm_address ;
intercon_mem0_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_mem0_wbm_write <= intercon_wrapper_wbm_write and mem0_cs ;
intercon_mem0_wbm_strobe <= intercon_wrapper_wbm_strobe and mem0_cs ;
intercon_mem0_wbm_cycle <= intercon_wrapper_wbm_cycle and mem0_cs ;								


intercon_wrapper_wbm_readdata	<= intercon_register_wbm_readdata when reg_cs = '1' else
											intercon_pwm0_wbm_readdata when pwm0_cs = '1' else
											intercon_mem0_wbm_readdata when mem0_cs = '1' else
											intercon_wrapper_wbm_address ;
											
intercon_wrapper_wbm_ack	<= intercon_register_wbm_ack when reg_cs = '1' else
										intercon_pwm0_wbm_ack when pwm0_cs = '1' else
										intercon_mem0_wbm_ack when mem0_cs = '1' else
										'0' ;
									      
										  
-----------------------------------------------------------------------
register0 : wishbone_register
	generic map(nb_regs => 4)
	 port map
	 (
		  -- Syscon signals
		  gls_reset   => sys_reset ,
		  gls_clk     => sys_clk ,
		  -- Wishbone signals
		  wbs_address      =>  intercon_register_wbm_address ,
		  wbs_writedata => intercon_register_wbm_writedata,
		  wbs_readdata  => intercon_register_wbm_readdata,
		  wbs_strobe    => intercon_register_wbm_strobe,
		  wbs_cycle     => intercon_register_wbm_cycle,
		  wbs_write     => intercon_register_wbm_write,
		  wbs_ack       => intercon_register_wbm_ack,
		 
		  -- out signals
		  reg_out(0) =>dummy_sig0,
		  reg_out(1) => dummy_sig1,
		  reg_out(2) => loopback_sig,
		  reg_out(3) => signal_output,
		 
		  reg_in(0) => X"DEAD",
		  reg_in(1) => X"BEEF",
		  -- out signals
		  reg_in(2) => loopback_sig,		  
		  reg_in(3) => signal_input
	 );
	
	
	pwm0: wishbone_pwm
		generic map( nb_chan => 3)
		port map(
				-- Syscon signals
			  gls_reset   => sys_reset ,
			  gls_clk     => sys_clk ,
			  -- Wishbone signals
			  wbs_address      =>  intercon_pwm0_wbm_address ,
			  wbs_writedata => intercon_pwm0_wbm_writedata,
			  wbs_readdata  => intercon_pwm0_wbm_readdata,
			  wbs_strobe    => intercon_pwm0_wbm_strobe,
			  wbs_cycle     => intercon_pwm0_wbm_cycle,
			  wbs_write     => intercon_pwm0_wbm_write,
			  wbs_ack       => intercon_pwm0_wbm_ack,
			  
			  pwm_out(0) => LED(0),
			  pwm_out(1) => LED(1),
			  pwm_out(2) => dummy_pwm0
		);
	
	
	signal_input <= PMOD3 & "000000"& SW;
	
	
	PMOD2(7 downto 0) <= signal_output(15 downto 8); 
	PMOD1(7 downto 0) <= signal_output(7 downto 0); 

	
	
mem_0 : wishbone_mem
generic map( mem_size => 2048,
			wb_size =>  16,  -- Data port size for wishbone
			wb_addr_size =>  16  -- Data port size for wishbone
		  )
port map(
		 -- Syscon signals
			  gls_reset   => sys_reset ,
			  gls_clk     => sys_clk ,
			  -- Wishbone signals
			  wbs_address      =>  intercon_mem0_wbm_address ,
			  wbs_writedata => intercon_mem0_wbm_writedata,
			  wbs_readdata  => intercon_mem0_wbm_readdata,
			  wbs_strobe    => intercon_mem0_wbm_strobe,
			  wbs_cycle     => intercon_mem0_wbm_cycle,
			  wbs_write     => intercon_mem0_wbm_write,
			  wbs_ack       => intercon_mem0_wbm_ack
		  );
	 


PLL_BASE_inst : PLL_BASE generic map (
      BANDWIDTH      => "OPTIMIZED",        -- "HIGH", "LOW" or "OPTIMIZED" 
      CLKFBOUT_MULT  => 12 ,                 -- Multiply value for all CLKOUT clock outputs (1-64)
      CLKFBOUT_PHASE => 0.0,                -- Phase offset in degrees of the clock feedback output (0.0-360.0).
      CLKIN_PERIOD   => 20.00,              -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
      CLKOUT0_DIVIDE => 6,       CLKOUT1_DIVIDE =>1,
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
      CLKOUT0 => clk_100Mhz_pll,      CLKOUT1 => open,
      CLKOUT2 => open,      CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => clock_locked,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => clkfb, -- 1-bit input: Feedback clock input
      CLKIN   => osc_buff,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

    -- Buffering of clocks
	BUFG_1 : BUFG port map (O => osc_buff,    I => OSC_FPGA);
	BUFG_2 : BUFG port map (O => clk_100Mhz,    I => clk_100Mhz_pll);

end Behavioral;

