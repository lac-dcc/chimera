----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    16:53:16 03/11/2013 
-- Design Name: 
-- Module Name:    interrupt_manager_peripheral - Behavioral 
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



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity interrupt_manager_peripheral is
generic(NB_INTERRUPT_LINES : positive := 3; 
		  NB_INTERRUPTS : positive := 1; 
		  ADDR_WIDTH : positive := 16;
		  DATA_WIDTH : positive := 16);
port(clk, resetn : in std_logic ; --! system clock and asynchronous reset
	addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0); --! address bus
	wr_bus, rd_bus, cs_bus : in std_logic ; --! bus control signals
	data_bus_in	: in std_logic_vector((DATA_WIDTH - 1) downto 0); --! input data bus
	data_bus_out	: out std_logic_vector((DATA_WIDTH - 1) downto 0);
	
	interrupt_lines : out std_logic_vector(0 to NB_INTERRUPT_LINES-1);
	interrupts_req : in std_logic_vector(0 to NB_INTERRUPTS-1)
	
	);
end interrupt_manager_peripheral;

architecture Behavioral of interrupt_manager_peripheral is
type interrupts_registers is array(0 to NB_INTERRUPTS-1) of std_logic_vector(15 downto 0);

signal interrupt_registers_d : interrupts_registers ;
signal enabled_interrupts : std_logic_vector(0 to NB_INTERRUPTS-1);
begin

gen_registers : for i in 0 to NB_INTERRUPTS-1 generate
	 process (clk, resetn)
		begin
		  if resetn = '0' then
				interrupt_registers_d(i) <= (others => '0') ;
		  elsif clk'event and clk = '1' then
				if addr_bus = i and cs_bus = '1' and wr_bus = '1' then
					 interrupt_registers_d(i) <= data_bus_in;
				elsif interrupts_req (i) = '1' then
					interrupt_registers_d(i)(1) <= '1' ;
				end if;
		  end if;
	 end process;
	 enabled_interrupts(i) <= interrupt_registers_d(i)(1) and interrupt_registers_d(i)(0) ;
 end generate;
	
data_bus_out <= interrupt_registers_d(conv_integer(addr_bus)) when cs_bus = '1' else
					 (others => '0');
	

	
gen_ints : for i in 0 to NB_INTERRUPT_LINES-1 generate
	 interrupt_lines(i) <= '0' when enabled_interrupts((i*NB_INTERRUPTS/NB_INTERRUPT_LINES) to (((i+1)*NB_INTERRUPTS/NB_INTERRUPT_LINES)-1)) /= 0 else
								  '1' ;
 end generate;		 



end Behavioral;

