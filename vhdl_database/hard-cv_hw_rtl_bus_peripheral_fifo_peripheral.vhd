----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:54:36 06/19/2012 
-- Design Name: 
-- Module Name:    fifo_peripheral - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
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

library work ;
use work.utils_pack.all ;


--! peripheral with fifo interface to the logic
--! fifo B can be written from logic and read from bus
--! fifo A can be written from bus and read from logic
entity fifo_peripheral is
generic(ADDR_WIDTH : positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			SIZE	: positive	:= 128; --! fifo depth
			BURST_SIZE : positive := 4;
			SYNC_LOGIC_INTERFACE : boolean := false 
			); 
port(
	clk, resetn : in std_logic ; --! system clock and asynchronous reset
	addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0); --! address bus
	wr_bus, rd_bus, cs_bus : in std_logic ; --! bus control signals
	wrB, rdA : in std_logic ; --! fifo control signal
	data_bus_in	: in std_logic_vector((WIDTH - 1) downto 0); --! input data bus
	data_bus_out	: out std_logic_vector((WIDTH - 1) downto 0); --! output data bus
	inputB: in std_logic_vector((WIDTH - 1) downto 0); --! data input of fifo B
	outputA	: out std_logic_vector((WIDTH - 1) downto 0); --! data output of fifo A
	emptyA, fullA, emptyB, fullB, burst_available_B	:	out std_logic; --! fifo state signals
	fifoA_reset, fifoB_reset : out std_logic 
);
end fifo_peripheral;



architecture RTL of fifo_peripheral is

constant address_space_nbit : integer := MAX((nbit(BURST_SIZE)+1), 3);


signal  fifoA_wr, fifoB_rd, bus_cs, srazA, srazB : std_logic ;
signal in_addr	:	std_logic_vector((address_space_nbit-1) downto 0);
signal fifoA_in,  fifoB_out : std_logic_vector((WIDTH - 1) downto 0 ); 
signal nb_availableA, nb_availableB  :  unsigned((WIDTH - 1) downto 0 ); 
signal nb_availableA_latched, nb_availableB_latched : std_logic_vector((WIDTH - 1) downto 0  );
signal data_bus_out_t	: std_logic_vector((WIDTH - 1) downto 0); 
signal latch_registers : std_logic ;
begin

bus_cs <= cs_bus ;
in_addr <= addr_bus((address_space_nbit-1) downto 0 );

fifo_A : dp_fifo -- write from bus, read from logic
	generic map(N => SIZE , W => WIDTH, SYNC_RD => SYNC_LOGIC_INTERFACE, SYNC_WR => false)
	port map(
 		clk => clk, resetn => resetn , sraz => srazA , 
 		wr => fifoA_wr, rd => rdA,
		empty => emptyA,
		full => fullA ,
 		data_out => outputA , 
 		data_in => fifoA_in ,
		nb_available => nb_availableA(nbit(SIZE)   downto 0)
	); 
	
fifo_B : dp_fifo -- read from bus, write from logic
	generic map(N => SIZE , W => WIDTH, SYNC_WR => SYNC_LOGIC_INTERFACE, SYNC_RD => false)
	port map(
 		clk => clk, resetn => resetn , sraz => srazB , 
 		wr => wrB, rd => fifoB_rd,
		empty => emptyB,
		full => fullB ,
 		data_out => fifoB_out , 
 		data_in => inputB ,
		nb_available => nb_availableB(nbit(SIZE)  downto 0)
	); 

--latch_registers <= NOT rd_bus ;
	  
--nb_available_latch0 : generic_latch 
--	 generic map(NBIT => WIDTH)
--    Port map( clk => clk ,
--           resetn => resetn ,
--           sraz => '0' ,
--           en => latch_registers ,
--           d => std_logic_vector(nb_availableB),
--           q => nb_availableB_latched);

nb_availableB_latched  <= std_logic_vector(nb_availableB) ;	  
--nb_available_latch1 : generic_latch 
--	 generic map(NBIT => WIDTH)
--    Port map( clk => clk ,
--           resetn => resetn ,
--           sraz => '0' ,
--           en => latch_registers ,
--           d => std_logic_vector(nb_availableA),
--           q => nb_availableA_latched);

nb_availableA_latched <= std_logic_vector(nb_availableA) ;

nb_availableB((WIDTH - 1) downto (nbit(SIZE) + 1)) <= (others => '0') ;
nb_availableA((WIDTH - 1) downto (nbit(SIZE) + 1)) <= (others => '0') ;


data_bus_out_t <= fifoB_out when in_addr(address_space_nbit-1) = '0'  else --fifo has (address_space_nbit-1) bits address space
				std_logic_vector(to_unsigned(SIZE, 16)) when in_addr((address_space_nbit-1)) = '1' and in_addr(1 downto 0)= "00" else
				( nb_availableA_latched) when in_addr((address_space_nbit-1)) = '1' and in_addr(1 downto 0)= "01" else
				( nb_availableB_latched) when in_addr((address_space_nbit-1)) = '1' and in_addr(1 downto 0)= "10"  else
				fifoB_out when in_addr((address_space_nbit-1)) = '1' and in_addr(1 downto 0)= "11" else -- peek !
				(others => '0');

data_bus_out <= data_bus_out_t when bus_cs = '1' else
					(others => 'Z');


fifoB_rd <= '1' when in_addr((address_space_nbit-1)) = '0' and bus_cs = '1' and rd_bus = '1' else
				'0' ;
				
fifoA_wr <= '1' when in_addr((address_space_nbit-1)) = '0' and bus_cs = '1' and wr_bus = '1' else
				'0' ;
	
srazA <= '1' when bus_cs = '1' and rd_bus = '0' and wr_bus = '1' and in_addr(address_space_nbit-1) = '1' and in_addr(1 downto 0) = "01" else
			'0' ;

srazB <= '1' when bus_cs = '1' and rd_bus = '0' and wr_bus = '1' and in_addr(address_space_nbit-1) = '1' and in_addr(1 downto 0) = "10" else
			'0' ;
				
fifoA_reset <= 	srazA ;
fifoB_reset	<= 	srazB ;		
				
fifoA_in <= data_bus_in ;

burst_available_B <= '1' when nb_availableB_latched > BURST_SIZE else
							'0' ;

end RTL;

