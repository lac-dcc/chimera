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

entity logibone_wishbone is
port( OSC_FPGA : in std_logic;
		PB : in std_logic_vector(1 downto 0);
		SW : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);	
		
		-- PMOD1
		PMOD1 : in std_logic_vector(7 downto 0);
		
		-- PMOD1
		PMOD2 : out std_logic_vector(7 downto 0);
		
		-- I2C
			
		ARD_SCL, ARD_SDA : inout std_logic ;
		
		--gpmc interface
		GPMC_CSN : in std_logic ;
		GPMC_BEN:	in std_logic_vector(1 downto 0);
		GPMC_WEN, GPMC_OEN, GPMC_ADVN :	in std_logic;
		GPMC_CLK :	in std_logic;
		GPMC_AD :	inout std_logic_vector(15 downto 0)	
);
end logibone_wishbone;

architecture Behavioral of logibone_wishbone is

	component clock_gen
	port
	(-- Clock in ports
		CLK_IN1           : in     std_logic;
		-- Clock out ports
		CLK_OUT1          : out    std_logic;
		-- Status and control signals
		LOCKED            : out    std_logic
	);
	end component;

	-- syscon
	signal sys_reset, sys_resetn,sys_clk, clock_locked : std_logic ;
	signal clk_100Mhz, clk_120Mhz, clk_24Mhz, clk_50Mhz, clk_50Mhz_ext : std_logic ;

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

ARD_SCL <= 'Z' ;
ARD_SDA <= 'Z' ;

sys_reset <= NOT PB(0); 
sys_resetn <= NOT sys_reset ; -- for preipherals with active low reset

pll0 : clock_gen
  port map
   (-- Clock in ports
    CLK_IN1 => OSC_FPGA,
    -- Clock out ports
    CLK_OUT1 => clk_100Mhz,
    -- Status and control signals
    LOCKED => clock_locked);

sys_clk <= clk_100Mhz;--clk_120Mhz ;
--GPMC_CLK <= clk_50Mhz_ext;


gpmc2wishbone : gpmc_wishbone_wrapper 
generic map(sync => true, burst => false)
port map
    (
      -- GPMC SIGNALS
      gpmc_ad => GPMC_AD, 
      gpmc_csn => GPMC_CSN,
      gpmc_oen => GPMC_OEN,
		gpmc_wen => GPMC_WEN,
		gpmc_advn => GPMC_ADVN,
		gpmc_clk => GPMC_CLK,
		
      -- Global Signals
      gls_reset => sys_reset,
      gls_clk   => sys_clk,
      -- Wishbone interface signals
      wbm_address    => intercon_wrapper_wbm_address,  -- Address bus
      wbm_readdata   => intercon_wrapper_wbm_readdata,  -- Data bus for read access
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
				
pwm0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 3) = "00000000000001"  else
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
	
	
	signal_input <= PMOD1 & "000000"& SW;
	PMOD2(7 downto 4) <= signal_output(15 downto 12); 
	PMOD2(0) <= GPMC_CSN ;
	PMOD2(1) <= GPMC_OEN ;
	PMOD2(2) <= GPMC_WEN ;
	PMOD2(3) <= GPMC_ADVN ;
	
	
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
	 

end Behavioral;

