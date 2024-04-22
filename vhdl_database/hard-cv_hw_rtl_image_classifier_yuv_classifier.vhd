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


entity yuv_classifier is
	port(
		clk, resetn : in std_logic ;
		we, cs : in std_logic ;
		bus_addr : in std_logic_vector(15 downto 0);
		data_in : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0);
		
		y_value, u_value, v_value : in std_logic_vector(7 downto 0);
		class_value : out std_logic_vector(2 downto 0)
	);

end yuv_classifier;

architecture Behavioral of yuv_classifier is

signal cs_y, cs_u, cs_v : std_logic ;
signal u_bit_desc, v_bit_desc, y_bit_desc : std_logic_vector(7 downto 0);
signal u_bit_desc_l, v_bit_desc_l, y_bit_desc_l : std_logic_vector(15 downto 0);
signal data_out_y, data_out_u, data_out_v : std_logic_vector(15 downto 0);
signal pixel_bit_desc : std_logic_vector(7 downto 0);
 
begin

	cs_y <= '1' when cs = '1' and bus_addr(8 downto 7) = "00" else
			  '0' ;
		
	cs_u <= '1' when cs = '1' and bus_addr(8 downto 7) = "01" else
		  '0' ;
		  
	cs_v <= '1' when cs = '1' and bus_addr(8 downto 7) = "10" else
	'0' ;
	
	data_out <= data_out_y when cs_y = '1' else
					data_out_y when cs_u = '1' else
					data_out_v when cs_v = '1' else
					(others => 'Z') ;

	y_lut : dpram_NxN	
		generic map(SIZE => 128, NBIT => 16, ADDR_WIDTH => 7)
		port map(
			clk => clk ,
			we =>  (we and cs_y),
			di => data_in, 
			a	=> bus_addr(6 downto 0),
			dpra => y_value(7 downto 1),
			spo => data_out_y,
			dpo => y_bit_desc_l
		); 
		
		y_bit_desc <= y_bit_desc_l(7 downto 0) when y_value(0)= '0' else
						 y_bit_desc_l(15 downto 8) ;
		
	u_lut : dpram_NxN	
		generic map(SIZE => 128, NBIT => 16, ADDR_WIDTH => 7)
		port map(
			clk => clk ,
			we =>  (we and cs_u),
			di => data_in, 
			a	=> bus_addr(6 downto 0),
			dpra => u_value(7 downto 1),
			spo => data_out_u,
			dpo => u_bit_desc_l		
		); 
		
		u_bit_desc <= u_bit_desc_l(7 downto 0) when u_value(0)= '0' else
						 u_bit_desc_l(15 downto 8) ;
		
	v_lut : dpram_NxN	
		generic map(SIZE => 128, NBIT => 16, ADDR_WIDTH => 7)
		port map(
			clk => clk ,
			we =>  (we and cs_v),
			di => data_in, 
			a	=> bus_addr(6 downto 0),
			dpra => v_value(7 downto 1),
			spo => data_out_v,
			dpo => v_bit_desc_l	
		); 
		
		v_bit_desc <= v_bit_desc_l(7 downto 0) when v_value(0)= '0' else
						 v_bit_desc_l(15 downto 8) ;
		
		pixel_bit_desc <= v_bit_desc and y_bit_desc and u_bit_desc ;
		
		
		class_value <= "001" when  pixel_bit_desc = "00000001" else
							"010" when  pixel_bit_desc = "00000010" else
							"011" when  pixel_bit_desc = "00000100" else
							"100" when  pixel_bit_desc = "00001000" else
							"101" when  pixel_bit_desc = "00010000" else
							"110" when  pixel_bit_desc = "00100000" else
							"111" when  pixel_bit_desc = "01000000" else
							"000"  ;
		
		

end Behavioral;

