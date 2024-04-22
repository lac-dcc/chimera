----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:08:37 05/13/2013 
-- Design Name: 
-- Module Name:    classifier_lut - Behavioral 
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
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VC
library work ;
use work.primitive_pack.all ;
use work.utils_pack.all ;


entity classifier_lut is
	generic(INDEX_WIDTH : positive := 12 ; CLASS_WIDTH : positive := 2);
	port(
		clk, resetn : in std_logic ;
		we, cs : in std_logic ;
		bus_addr : in std_logic_vector(15 downto 0);
		data_in : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0);
		class_index : in std_logic_vector(INDEX_WIDTH-1 downto 0);
		class_value : out std_logic_vector(CLASS_WIDTH-1 downto 0)
	);

end classifier_lut;

architecture Behavioral of classifier_lut is
constant nb_class_per_packet : integer := 16/CLASS_WIDTH;
constant nb_class_addr_bit : integer := nbit(nb_class_per_packet);
signal class_value_packet : std_logic_vector(15 downto 0);
begin


	classifier_lut : dpram_NxN	
		generic map(SIZE => 2**(INDEX_WIDTH-nb_class_addr_bit), NBIT => 16, ADDR_WIDTH => (INDEX_WIDTH-nb_class_addr_bit) )
		port map(
			clk => clk ,
			we =>  (we and cs),
			di => data_in, 
			a	=> bus_addr((INDEX_WIDTH-nb_class_addr_bit)-1 downto 0),
			dpra => class_index(INDEX_WIDTH-1 downto nb_class_addr_bit),
			spo => data_out,
			dpo => class_value_packet		
		); 
		
		with  conv_integer(class_index(nb_class_addr_bit-1 downto 0)) select
			class_value <= class_value_packet(CLASS_WIDTH-1 downto 0) when 0,
								class_value_packet(((CLASS_WIDTH)*2 - 1) downto CLASS_WIDTH) when 1,
								class_value_packet(((CLASS_WIDTH)*3 - 1) downto CLASS_WIDTH*2) when 2,
								class_value_packet(((CLASS_WIDTH)*4 - 1) downto CLASS_WIDTH*3) when 3,
								class_value_packet(((CLASS_WIDTH)*5 - 1) downto CLASS_WIDTH*4) when 4,
								class_value_packet(((CLASS_WIDTH)*6 - 1) downto CLASS_WIDTH*5) when 5,
								class_value_packet(((CLASS_WIDTH)*7 - 1) downto CLASS_WIDTH*6) when 6,
								class_value_packet(((CLASS_WIDTH)*8 - 1) downto CLASS_WIDTH*7) when 7,
						      (others => '0' ) when others ;

end Behavioral;

