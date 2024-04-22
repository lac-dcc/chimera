----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    18:23:54 01/29/2013 
-- Design Name: 
-- Module Name:    addr_latches_peripheral - Behavioral 
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
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.utils_pack.all ;
use work.peripheral_pack.all ;

entity addr_latches_peripheral is
generic(ADDR_WIDTH : positive := 16;  WIDTH : positive := 16; NB : positive := 4);
port(
	clk, resetn : in std_logic ;
	addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0);
	wr_bus, rd_bus, cs_bus : in std_logic ;
	data_bus_in	: in std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	data_bus_out	: out std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	latch_default : in  reg16_array(0 to (NB-1)) := (others =>(others => '0')) ;
	latch_input : in  reg16_array(0 to (NB-1));
	latch_output :out  reg16_array(0 to (NB-1))
);
end addr_latches_peripheral;

architecture Behavioral of addr_latches_peripheral is

signal cs_vector : std_logic_vector(0 to (NB-1));
signal latches_outs : reg16_array(0 to (NB-1)) ;
begin

gen_latches : for i in 0 to (NB-1) generate
	latch_i :latch_peripheral
		generic map(ADDR_WIDTH => 16,  WIDTH	=> 16)
		port map(
			clk => clk, resetn => resetn,
			addr_bus => addr_bus,
			wr_bus => wr_bus, rd_bus => rd_bus, cs_bus => cs_vector(i),
			data_bus_in	=> data_bus_in,
			data_bus_out => latches_outs(i),
			latch_default => latch_default(i),
			latch_input => latch_input(i),
			latch_output => latch_output(i)
		);
end generate;


gen_c : for i in 0 to (NB-1) generate
	cs_vector(i) <= cs_bus when addr_bus((nbit(NB)-1) downto 0)=std_logic_vector(to_unsigned(i, nbit(NB))) else
						 '0' ;
end generate;

data_bus_out <= latches_outs(conv_integer(addr_bus((nbit(NB)-1) downto 0))) when cs_bus = '1' else
					 (others => 'Z') ;



end Behavioral;

