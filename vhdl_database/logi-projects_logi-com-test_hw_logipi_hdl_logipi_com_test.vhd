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

entity logipi_com_test is
port( OSC_FPGA : in std_logic;

		--i2c
		SYS_SCL, SYS_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, RP_SPI_CE0N, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic
);
end logipi_com_test;

architecture Behavioral of logipi_com_test is

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
	signal clk_100Mhz : std_logic ;

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
	
	signal intercon_mem0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_mem0_wbm_strobe :  std_logic;
	signal intercon_mem0_wbm_write :  std_logic;
	signal intercon_mem0_wbm_ack :  std_logic;
	signal intercon_mem0_wbm_cycle :  std_logic;
	
	signal loopback_sig : std_logic_vector(15 downto 0);
		
begin

--LED(1) <= (GPMC_BEN(0) XOR GPMC_BEN(1)) ;

sys_reset <= NOT clock_locked; 
sys_resetn <= NOT sys_reset ; -- for preipherals with active low reset

pll0 : clock_gen
  port map
   (-- Clock in ports
    CLK_IN1 => OSC_FPGA,
    -- Clock out ports
    CLK_OUT1 => clk_100Mhz,
    -- Status and control signals
    LOCKED => clock_locked);

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
inter0 : wishbone_intercon 
generic map(memory_map  => ("00000000000000XX", "00001XXXXXXXXXXX"))
port map(
	-- Syscon signals
		  gls_reset   => sys_reset ,
		  gls_clk     => sys_clk ,
		
		
		-- Wishbone slave signals
		wbs_address      =>  intercon_wrapper_wbm_address ,
		  wbs_writedata => intercon_wrapper_wbm_writedata,
		  wbs_readdata  => intercon_wrapper_wbm_readdata,
		  wbs_strobe    => intercon_wrapper_wbm_strobe,
		  wbs_cycle     => intercon_wrapper_wbm_cycle,
		  wbs_write     => intercon_wrapper_wbm_write,
		  wbs_ack       => intercon_wrapper_wbm_ack,
		
		-- Wishbone master signals
		  wbm_address(0)      =>  intercon_register_wbm_address ,
		  wbm_address(1)      =>  intercon_mem0_wbm_address ,
		  wbm_writedata(0) => intercon_register_wbm_writedata,
		  wbm_writedata(1) => intercon_mem0_wbm_writedata,
		  wbm_readdata(0)  => intercon_register_wbm_readdata,
		  wbm_readdata(1)  => intercon_mem0_wbm_readdata,
		  wbm_strobe(0)    => intercon_register_wbm_strobe,
		  wbm_strobe(1)    => intercon_mem0_wbm_strobe,
		  wbm_cycle(0)     => intercon_register_wbm_cycle,
		  wbm_cycle(1)     => intercon_mem0_wbm_cycle,
		  wbm_write(0)     => intercon_register_wbm_write,
		  wbm_write(1)     => intercon_mem0_wbm_write,
		  wbm_ack(0)       => intercon_register_wbm_ack,
		  wbm_ack(1)       => intercon_mem0_wbm_ack
		
);
									      
										  
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
		  reg_out(0) =>open,
		  reg_out(1) => open,
		  reg_out(2) => loopback_sig,
		  reg_out(3) => open,
		 
		  reg_in(0) => X"DEAD",
		  reg_in(1) => X"BEEF",
		  -- out signals
		  reg_in(2) => loopback_sig,		  
		  reg_in(3) => open
	 );

	
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

