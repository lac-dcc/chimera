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
use work.logi_virtual_components_pack.all ;

entity logipi_virtual_component is
port( OSC_FPGA : in std_logic;

		--onboard
		PB : in std_logic_vector(1 downto 0);
		SW : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);	
		
		--i2c
		SYS_SCL, SYS_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, RP_SPI_CE0N, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic
);
end logipi_virtual_component;

architecture Behavioral of logipi_virtual_component is

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

	signal intercon_leds0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_leds0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_leds0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_leds0_wbm_strobe :  std_logic;
	signal intercon_leds0_wbm_write :  std_logic;
	signal intercon_leds0_wbm_ack :  std_logic;
	signal intercon_leds0_wbm_cycle :  std_logic;
	
	signal intercon_sw0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_sw0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_sw0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_sw0_wbm_strobe :  std_logic;
	signal intercon_sw0_wbm_write :  std_logic;
	signal intercon_sw0_wbm_ack :  std_logic;
	signal intercon_sw0_wbm_cycle :  std_logic;
	
	signal intercon_seg0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_seg0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_seg0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_seg0_wbm_strobe :  std_logic;
	signal intercon_seg0_wbm_write :  std_logic;
	signal intercon_seg0_wbm_ack :  std_logic;
	signal intercon_seg0_wbm_cycle :  std_logic;
	
	signal intercon_pb0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_pb0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_pb0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_pb0_wbm_strobe :  std_logic;
	signal intercon_pb0_wbm_write :  std_logic;
	signal intercon_pb0_wbm_ack :  std_logic;
	signal intercon_pb0_wbm_cycle :  std_logic;
	
	signal led0_cs, sw0_cs, seg0_cs, pb0_cs: std_logic ;
	

-- counter signals
	signal divider_output1hz,divider_output5hz ,divider_output10hz ,divider_output100hz  : std_logic_vector(31 downto 0);
	signal onehz_signal, fivehz_signal, tenhz_signal, onehundredhz_signal : std_logic ;
	constant DIVIDER1HZ : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(100_000_000, 32));
	constant DIVIDER5HZ : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(20_000_000, 32));
	constant DIVIDER10HZ : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(10_000_000, 32));
	constant DIVIDER100HZ : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(1_000_000, 32));
	signal update_count_output: std_logic;
-- registers signals
	signal virtual_led, virtual_sw, virtual_pb : std_logic_vector(15 downto 0) ;

-- counter signals
	signal counter_output : std_logic_vector(7 downto 0);
	signal counter_enable, counter_reset : std_logic ;
	signal deco_seg_out : std_logic_vector(7 downto 0);
	
-- scanner signals
	signal cylon_reg : std_logic_vector(7 downto 0);
	signal right_leftn : std_logic ;
	
--switch signals
	signal vc_sw_val : std_logic_vector(7 downto 0);
	signal sel: std_logic_vector(1 downto 0);
	
	signal btn: std_logic_vector(1 downto 0);
	
begin


---------------------------------------------------------------------
-- Syscon
-- The Syscon generats all the system clocks and reset of the reset of the architecture
---------------------------------------------------------------------
btn <= not PB;
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

sys_clk <= clk_100Mhz;

----------------------------------------------------------------------


----one hz countdown
--process(sys_clk, sys_reset)
--begin
--	if sys_reset='1' then
--		divider_output1hz <= DIVIDER1HZ ;
--	elsif sys_clk'event and sys_clk = '1' then
--		if divider_output1hz = 0 then
--			divider_output1hz <= DIVIDER1HZ ;
--		else
--			divider_output1hz <= divider_output1hz - 1 ;
--		end if ;
--	end if ;
--end process ;
--onehz_signal <= '1' when divider_output1hz = 0 else
--					'0' ;

--one hz countdown
process(sys_clk, sys_reset)
begin
	if sys_reset='1' then
		divider_output1hz <= DIVIDER1HZ ;
		divider_output5hz <= DIVIDER5HZ ;
		divider_output10hz <= DIVIDER10HZ;
		divider_output100hz <= DIVIDER100HZ;
	elsif sys_clk'event and sys_clk = '1' then
		if divider_output1hz = 0 then
			divider_output1hz <= DIVIDER1HZ ;
		else
			divider_output1hz <= divider_output1hz - 1 ;
		end if ;
		
		if divider_output5hz = 0 then
			divider_output5hz <= DIVIDER5HZ ;
		else
			divider_output5hz <= divider_output5hz - 1 ;
		end if ;
		
		if divider_output10hz = 0 then
			divider_output10hz <= DIVIDER10HZ ;
		else
			divider_output10hz <= divider_output10hz - 1 ;
		end if ;
		
		if divider_output100hz = 0 then
			divider_output100hz <= DIVIDER100HZ ;
		else
			divider_output100hz <= divider_output100hz - 1 ;
		end if ;
		
	end if ;
end process ;
onehz_signal <= '1' when divider_output1hz = 0 else
					'0' ;
fivehz_signal <= '1' when divider_output5hz = 0 else
					'0' ;
tenhz_signal <= '1' when divider_output10hz = 0 else
					'0' ;
onehundredhz_signal <= '1' when divider_output100hz = 0 else
					'0' ;

		

-------------------------------------------------------------
-- Instanciation of the Wishbone Master
-- ----------------------------------------------------------
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
-- The intercon is architecture specific and takes care of wishbone signals routing
-- to the slaves. It generates a set of wishbone signals for each of the slaves.
-- This intercon has to be written for each architecture.


-- First part generates a Chip select for each of the slaves according to the memory map
led0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 0) = "0000000000000000" else
				'0' ;
sw0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 0) = "0000000000000001" else
				'0' ;
seg0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 3) = "0000000000001" else
				'0' ;
				
pb0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 3) = "0000000000010" else
				'0' ;


-- Second part generate the wishbone signals for each slaves. Control signals depends on the
-- previsously generated chip select
intercon_leds0_wbm_address <= intercon_wrapper_wbm_address ;
intercon_leds0_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_leds0_wbm_write <= intercon_wrapper_wbm_write and led0_cs ;
intercon_leds0_wbm_strobe <= intercon_wrapper_wbm_strobe and led0_cs ;
intercon_leds0_wbm_cycle <= intercon_wrapper_wbm_cycle and led0_cs ;

intercon_sw0_wbm_address <= intercon_wrapper_wbm_address ;
intercon_sw0_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_sw0_wbm_write <= intercon_wrapper_wbm_write and sw0_cs ;
intercon_sw0_wbm_strobe <= intercon_wrapper_wbm_strobe and sw0_cs ;
intercon_sw0_wbm_cycle <= intercon_wrapper_wbm_cycle and sw0_cs ;	

intercon_seg0_wbm_address <= intercon_wrapper_wbm_address ;
intercon_seg0_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_seg0_wbm_write <= intercon_wrapper_wbm_write and seg0_cs ;
intercon_seg0_wbm_strobe <= intercon_wrapper_wbm_strobe and seg0_cs ;
intercon_seg0_wbm_cycle <= intercon_wrapper_wbm_cycle and seg0_cs ;	

intercon_pb0_wbm_address <= intercon_wrapper_wbm_address ;
intercon_pb0_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_pb0_wbm_write <= intercon_wrapper_wbm_write and pb0_cs ;
intercon_pb0_wbm_strobe <= intercon_wrapper_wbm_strobe and pb0_cs ;
intercon_pb0_wbm_cycle <= intercon_wrapper_wbm_cycle and pb0_cs ;			
							

-- The third part takes care of the muxing of the readdata bus of the wishbone. This
-- bus is controlled by the slave activated by the generated chip select. 
intercon_wrapper_wbm_readdata	<= intercon_leds0_wbm_readdata when led0_cs = '1' else
											intercon_sw0_wbm_readdata when sw0_cs = '1' else
											intercon_seg0_wbm_readdata when seg0_cs = '1' else
											intercon_pb0_wbm_readdata when pb0_cs = '1' else
											intercon_wrapper_wbm_address ;
											
											
--	The fourth part takes care of the muxing of the ack signal generated by the slaves.
-- It routes the selected slave ack signal to the master ack input										
intercon_wrapper_wbm_ack	<= intercon_leds0_wbm_ack when led0_cs = '1' else
										intercon_sw0_wbm_ack when sw0_cs = '1' else
										intercon_seg0_wbm_ack when sw0_cs = '1' else
										intercon_pb0_wbm_ack when pb0_cs = '1' else
										'0' ;
									      
-----------------------------------------------------------------------
-- Instanciation of the slaves
-- Each slave is instatiated and connected to its own wishbone signals
-----------------------------------------------------------------------
seg0 : logi_virtual_7seg

	 port map
	 (
		  -- Syscon signals
		  gls_reset   => sys_reset ,
		  gls_clk     => sys_clk ,
		  -- Wishbone signals
		  wbs_address     =>  intercon_seg0_wbm_address ,
		  wbs_writedata => intercon_seg0_wbm_writedata,
		  wbs_readdata  => intercon_seg0_wbm_readdata,
		  wbs_strobe    => intercon_seg0_wbm_strobe,
		  wbs_cycle     => intercon_seg0_wbm_cycle,
		  wbs_write     => intercon_seg0_wbm_write,
		  wbs_ack       => intercon_seg0_wbm_ack,
		  -- out signals
		  cathodes => (others => '0'),
		  anodes => deco_seg_out
	 );


leds0 : logi_virtual_led
	 port map
	 (
		  -- Syscon signals
		  gls_reset   => sys_reset ,
		  gls_clk     => sys_clk ,
		  -- Wishbone signals
		  wbs_address     =>  intercon_leds0_wbm_address ,
		  wbs_writedata => intercon_leds0_wbm_writedata,
		  wbs_readdata  => intercon_leds0_wbm_readdata,
		  wbs_strobe    => intercon_leds0_wbm_strobe,
		  wbs_cycle     => intercon_leds0_wbm_cycle,
		  wbs_write     => intercon_leds0_wbm_write,
		  wbs_ack       => intercon_leds0_wbm_ack,
		 
		  led => virtual_led
	 );
	 
	 sw0 : logi_virtual_sw
	 port map
	 (
		  -- Syscon signals
		  gls_reset   => sys_reset ,
		  gls_clk     => sys_clk ,
		  -- Wishbone signals
		  wbs_address     =>  intercon_sw0_wbm_address ,
		  wbs_writedata => intercon_sw0_wbm_writedata,
		  wbs_readdata  => intercon_sw0_wbm_readdata,
		  wbs_strobe    => intercon_sw0_wbm_strobe,
		  wbs_cycle     => intercon_sw0_wbm_cycle,
		  wbs_write     => intercon_sw0_wbm_write,
		  wbs_ack       => intercon_sw0_wbm_ack,
		 
		  sw => virtual_sw
	 );
	 
	 pb0 : logi_virtual_pb
	 port  map
	 (
				  -- Syscon signals
		  gls_reset   => sys_reset ,
		  gls_clk     => sys_clk ,
		  -- Wishbone signals
		  wbs_address     =>  intercon_pb0_wbm_address ,
		  wbs_writedata => intercon_pb0_wbm_writedata,
		  wbs_readdata  => intercon_pb0_wbm_readdata,
		  wbs_strobe    => intercon_pb0_wbm_strobe,
		  wbs_cycle     => intercon_pb0_wbm_cycle,
		  wbs_write     => intercon_pb0_wbm_write,
		  wbs_ack       => intercon_pb0_wbm_ack,
		 
		  pb=> virtual_pb
	 );
	

-------------------------------------------------------------------
-- Connection of the logic
-- This part connect all the glue logic
-------------------------------------------------------------------	
	 
	 -- Device under test
	counter_enable  <= virtual_sw(0);
	counter_reset  <= virtual_pb(3) or btn(1);
	
	 
	LED <=  counter_output(1 downto 0) when virtual_sw(2) = '0' else
			  (virtual_pb(1) & virtual_pb(0));
	
	virtual_led(7 downto 0) <= "000000" & SW(1) & SW(0) when virtual_sw(2) = '1' else 
										cylon_reg when virtual_sw(1) = '0' else
										counter_output(7 downto 0) when virtual_sw(1) = '1';

	 --virtual_led(9 downto 8) <= SW;
	 --virtual_led(10) <= PB(1);
	 
	 vc_sw_val <= virtual_sw(7 downto 0);	--get the vc switch vals 7 and 6 bits

	--mux the count out enable input different frequncy values
	with vc_sw_val(7 downto 6) select
				update_count_output <= 	onehz_signal when 	"00",
												fivehz_signal  when 	"01",
												tenhz_signal  when 	"10",
												onehundredhz_signal  when "11";			
	
	 process(sys_clk, sys_reset)
	 begin
		if sys_reset = '1' then
			counter_output <= (others => '0');
		elsif sys_clk'event and sys_clk = '1' then
			if counter_reset = '1' then
				counter_output <= (others => '0');
			elsif counter_enable = '1' and update_count_output = '1' then --100 hz updateupdate_count_output
				counter_output <= counter_output + 1;
			end if ;
		end if ;
	 end process ;
	 
	 --CYLON GENERATOR
	 process(sys_clk, sys_reset)
	 begin
		if sys_reset = '1' then
			cylon_reg <= X"01";
			right_leftn <= '0' ;
		elsif sys_clk'event and sys_clk = '1' then
			if update_count_output = '1' and right_leftn = '1' then 
				cylon_reg <= '0' & cylon_reg(7 downto 1) ; 
			elsif update_count_output = '1' and right_leftn = '0' then 
				cylon_reg <= cylon_reg(6 downto 0) & '0' ;
			end if ;
			
			if update_count_output = '1' and cylon_reg(6) = '1' then
				right_leftn <= '1' ;
			elsif update_count_output = '1' and cylon_reg(1) = '1' then
				right_leftn <= '0' ;
			end if ;
			
		end if ;
	 end process ;

	deco_seg_out(7) <= '0' ;  -- dot point
		with counter_output(3 downto 0) select
					--"gfedcba" segments
		deco_seg_out(6 downto 0)<=		 "0111111"		 when "0000",--0
					 "0000110"    	 when "0001",--1
					 "1011011"   	 when "0010",--2
					 "1001111"   	 when "0011",--3
					 "1100110"   	 when "0100",--4
					 "1101101"   	 when "0101",--5
					 "1111101"   	 when "0110",--6
					 "0000111"   	 when "0111",--7
					 "1111111"   	 when "1000",--8
					 "1101111"   	 when "1001",--9
					 "1110111"      when "1010", --a
					 "1111100"   	 when "1011", --b
					 "0111001"   	 when "1100", --c
					 "1011110"   	 when "1101", --d
					 "1111001"   	 when "1110", --e
					 "1110001" 	 	when others; --f  
							

end Behavioral;

