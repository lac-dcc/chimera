----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    09:22:53 03/08/2013 
-- Design Name: 
-- Module Name:    shared_mem - Behavioral 
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

library work ;
use work.primitive_pack.all ;

entity shared_mem_peripheral is
generic(SIZE : positive := 128; 
			DATA_WIDTH : positive := 16; 
			ADDR_WIDTH : positive := 16;
			LOGIC_PRIORITY : boolean := false);
port(clk, resetn : in std_logic;
	  addr_bus : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	  data_in_bus : in std_logic_vector(DATA_WIDTH-1 downto 0);
	  data_out_bus : out std_logic_vector(DATA_WIDTH-1 downto 0);
	  wr_bus, rd_bus, cs_bus : in std_logic ;
	  wait_bus : out std_logic ;
	  addr_logic : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	  data_in_logic : in std_logic_vector(DATA_WIDTH-1 downto 0);
	  data_out_logic : out std_logic_vector(DATA_WIDTH-1 downto 0);
	  wr_logic, rd_logic, cs_logic : in std_logic;
	  wait_logic : out std_logic 
	);
end shared_mem_peripheral;

architecture Behavioral of shared_mem_peripheral is

signal we_temp, we_mem : std_logic ;
signal mem_doutsp, mem_doutdp, mem_in : std_logic_vector(DATA_WIDTH-1 downto 0 );
signal mem_addrsp, mem_addrdp : std_logic_vector((ADDR_WIDTH - 1) downto 0 );
begin

prio_logic : if LOGIC_PRIORITY generate
	we_temp <= wr_bus when wr_logic = '0' else
				 wr_logic ;
	wait_bus <= '1' when wr_bus = '1' and wr_logic = '1' else
				   '0' ;
	mem_in <= data_in_bus when wr_bus='1' and wr_logic = '0' else
				 data_in_logic ;
	mem_addrsp <= addr_logic when rd_logic = '1' and wr_bus = '0' else
				  addr_bus when rd_bus = '1' and wr_logic = '0' else
				  addr_bus when cs_bus = '1' and wr_bus = '1' and wr_logic = '0' else
				  addr_logic ;
				 
	wait_logic <= '0' ;
end generate ;

prio_bus : if NOT LOGIC_PRIORITY generate
	we_temp <= wr_logic when wr_bus = '0' else
				  wr_bus ;
	wait_logic <= '1' when wr_bus = '1' and wr_logic = '1' else
				   '0' ;
	mem_in <= data_in_logic when wr_logic='1' and wr_bus = '0' else
				 data_in_bus ;
	mem_addrsp <= addr_logic when rd_logic = '1' and wr_bus = '0' else
				  addr_bus when rd_bus = '1' and wr_logic = '0' else
				  addr_logic when cs_logic = '1' and wr_logic = '1' and wr_bus = '0' else
				  addr_bus ;
				  
	wait_bus <= '0' ;
end generate ;

we_mem <= we_temp when cs_bus = '1' else
			 we_temp when cs_logic = '1' else
			 '0' ;

data_out_logic <= mem_doutsp when cs_logic = '1' and rd_logic = '1' and wr_bus = '0' else
						mem_doutdp when cs_logic = '1' and rd_logic = '1' and wr_bus = '1' else
						(others => 'Z') ;
						
data_out_bus <= mem_doutsp when cs_bus = '1' and rd_bus = '1' and wr_logic = '0' else
					 mem_doutdp when cs_bus = '1' and rd_bus = '1' and wr_logic = '1' else
					(others => 'Z') ;


mem_addrdp <= addr_logic when rd_logic = '1' and wr_bus = '1' else
				  addr_bus ;

ram : dpram_NxN 
	generic map(SIZE => SIZE ,
					NBIT => DATA_WIDTH,
					ADDR_WIDTH => ADDR_WIDTH)
	port map(
 		clk => clk,
 		we => we_mem, 
 		di => mem_in, 
		a	=> mem_addrsp,
 		dpra => mem_addrdp,
		spo => mem_doutsp,
		dpo => mem_doutdp 		
	); 





end Behavioral;

