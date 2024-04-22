----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    15:31:55 03/22/2013 
-- Design Name: 
-- Module Name:    smal_stack - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity small_fifo is
generic( WIDTH : positive := 8 ; DEPTH : positive := 8; THRESHOLD : positive := 4);
port(clk, resetn : in std_logic ;
	  push, pop : in std_logic ;
	  full, empty, limit : out std_logic ;
	  data_in : in std_logic_vector( WIDTH-1 downto 0);
	  data_out : out std_logic_vector(WIDTH-1 downto 0)
	  );
end small_fifo;

architecture Behavioral of small_fifo is
 type mem_array is array(0 to DEPTH-1) of std_logic_vector(WIDTH-1 downto 0);
 signal fifo : mem_array ;
 signal rd_ptr, wr_ptr : integer range 0 to DEPTH-1 ; 
 signal full_t, empty_t : std_logic ;
 signal nb_available : integer range 0 to DEPTH-1 ; 
begin

process(clk, resetn)
begin
	if resetn = '0' then
		rd_ptr <= 0 ;
		wr_ptr <= 0 ;
		nb_available <= 0 ;
	elsif clk'event and clk = '1' then
		if push = '1' and full_t = '0' then
			wr_ptr <= (wr_ptr + 1) ;
			fifo(wr_ptr) <= data_in ;
			if pop = '0' then
				nb_available <= nb_available + 1 ;
			end if ;
		end if ;
		
		if pop = '1' and empty_t = '0' then
			rd_ptr <= rd_ptr + 1 ;
			if push = '0' then
				nb_available <= nb_available - 1 ;
			end if ;
		end if ;
		
	end if ;
end process ;


full_t <= '1' when nb_available = DEPTH-1 else
			 '0' ;
empty_t <= '1' when nb_available = 0 else
			 '0' ;
data_out <= fifo(rd_ptr) when empty_t = '0' else
				(others => '0');
				
limit <= '1' when nb_available >= THRESHOLD else
			'0' ;
				
empty <= empty_t ;
full <= full_t ;

end Behavioral;

