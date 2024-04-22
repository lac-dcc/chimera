----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    17:04:38 06/28/2012 
-- Design Name: 
-- Module Name:    add_interface - Behavioral 
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

entity addr_interface is
generic(ADDR_WIDTH : positive := 8 ; DATA_WIDTH : positive := 16; USE_EXT_CLOCK : boolean := false);
port(clk, resetn : in std_logic ;
	  data	:	inout	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  addr	:	in	std_logic_vector((ADDR_WIDTH - 1) downto 0);
	  wrn, oen, csn, ext_clk : in std_logic ;
	  data_bus_out	: out	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  data_bus_in	: in	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  addr_bus	:	out	std_logic_vector((ADDR_WIDTH - 1) downto 0);
	  wr, rd	:	out	std_logic
);
end addr_interface;

architecture Behavioral of addr_interface is
signal wr_from_bus , rd_from_bus, wrt, rdt, cst, nclk, latch_en, old_oen : std_logic ;
signal data_bus_out_t, data_bus_in_t	: std_logic_vector((DATA_WIDTH - 1) downto 0);
signal debounce_counter : std_logic_vector(3 downto 0)  ;
begin

wr_from_bus <= (NOT wrn) and (NOT csn) ;
rd_from_bus <= (NOT oen) and (NOT csn) ;


gen_ext_clk : if USE_EXT_CLOCK generate
	process(ext_clk, resetn)
	begin
	if resetn ='0' then
		wrt <= '0' ;
		rdt <= '0' ;
		data_bus_out_t <= (others => 'Z');
		addr_bus <= (others => '0') ;
		data_bus_in_t <= (others => '0') ;
	elsif ext_clk'event and ext_clk ='1' then
		wrt <= wr_from_bus  ;
		rdt <= rd_from_bus  ;
		addr_bus <= addr ;
		data_bus_out_t <= data ;
		data_bus_in_t <= data_bus_in ;
	end if ;
	end process;
end generate ;

gen_no_ext_clk : if (NOT USE_EXT_CLOCK) generate
	process(clk, resetn)
	begin
	if resetn ='0' then
		wrt <= '0' ;
		rdt <= '0' ;
		data_bus_out_t <= (others => '0');
		addr_bus <= (others => '0') ;
		--data_bus_in_t <= (others => '0') ;
	elsif clk'event and clk ='1' then
		if latch_en = '1' then
			wrt <= wr_from_bus  ;
			rdt <= rd_from_bus  ;
			addr_bus <= addr ;
			data_bus_out_t <= data ;
		end if ;
		--data_bus_in_t <= data_bus_in ;
	end if ;
	end process;
	
	
	-- trying to limit SSN
	process(clk, resetn)
	begin
	if resetn ='0' then
		data_bus_in_t(7 downto 0) <= (others => '0');
	elsif clk'event and clk ='0' then
		data_bus_in_t(7 downto 0) <= data_bus_in(7 downto 0) ;
	end if ;
	end process;
	
	process(clk, resetn)
	begin
	if resetn ='0' then
		data_bus_in_t(15 downto 8) <= (others => '0');
	elsif clk'event and clk ='1' then
		data_bus_in_t(15 downto 8) <= data_bus_in(15 downto 8) ;
	end if ;
	end process;
	
end generate ;


--latch_en <= '1' ;
--debounce 
--rs lock
process(clk, resetn)
begin
	if resetn = '0' then
		latch_en <= '1' ;
	elsif clk'event and clk = '1' then
		if wr_from_bus = '1' or rd_from_bus = '1' then
			latch_en <= '0' ;
		elsif debounce_counter = 1 then
			latch_en <= '1' ;
		end if ;
	end if ;
end process ;

process(clk, resetn)
begin
	if resetn = '0' then
		debounce_counter <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if debounce_counter = 1 then
			debounce_counter <= (others => '0') ;
		elsif latch_en = '0' then
			debounce_counter <=  debounce_counter + 1;
		end if ;
	end if ;
end process ;

--end debounce

wr <= wrt ;
rd <= rdt ;

data <= data_bus_in_t when rdt = '1' else
		  (others => 'Z');

data_bus_out <= data_bus_out_t ;



end Behavioral;

