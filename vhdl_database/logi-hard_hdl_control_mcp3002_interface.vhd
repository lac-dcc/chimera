

-- ----------------------------------------------------------------------
--LOGI-hard
--Copyright (c) 2013, Jonathan Piat, Michael Jones, All rights reserved.
--
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 3.0 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library.
-- ----------------------------------------------------------------------



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:08 08/26/2013 
-- Design Name: 
-- Module Name:    mcp3002_interface - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library work ;
use work.utils_pack.all ;


entity mcp3002_interface is
generic(CLK_DIV : positive := 1024;
		  SAMPLING_DIV : positive := 2048);
port(

		  clk, resetn : std_logic ;

		  sample : out std_logic_vector(9 downto 0);
		  dv : out std_logic ;
		  chan : in std_logic ;
		
		  -- spi signals
		  DOUT : out std_logic ;
		  DIN : in std_logic ;
		  SCLK : out std_logic ;
		  SSN : out std_logic

);
end mcp3002_interface;



architecture Behavioral of mcp3002_interface is
type tranfer_state is (WAIT_SAMPLE, ASSERT_CS, XFER_DATA, DEASSERT_CS);

signal current_transfer_state, next_transfer_state : tranfer_state;


signal data_out_shift_reg, data_in_shift_reg : std_logic_vector(15 downto 0) ;
signal load_shift_register : std_logic ;

signal tempo_val : std_logic_vector(15 downto 0);
signal count_tempo : std_logic_vector(15 downto 0 );
signal load_tempo, en_tempo, end_tempo : std_logic ;
signal data_clk, data_clk_old, data_clk_re, data_clk_fe : std_logic ;

signal en_bit_count, reset_bit_count : std_logic ;

signal bit_count : std_logic_vector(4 downto 0);
signal bit_count_eq_16  : std_logic ;

signal cmd_word  : std_logic_vector(15 downto 0);


signal ssn_d : std_logic ;


begin

-- tempo
process(clk, resetn)
begin
	if resetn = '0' then
		count_tempo <= (others => '1');
	elsif clk'event and clk = '1' then
		if load_tempo = '1' then
			count_tempo <= tempo_val ;
		elsif en_tempo = '1' then
			if count_tempo /= 0 then
				count_tempo <= count_tempo - 1 ;
			end if ;
		end if ;
	end if ;
end process ;

end_tempo <= '1' when count_tempo =  0 else
				 '0' ;
		
-- bit counter		
process(clk, resetn)
begin
	if resetn = '0' then
		bit_count <= (others => '0');
	elsif clk'event and clk = '1' then
		if reset_bit_count = '1' then
			bit_count <= (others => '0');
		elsif en_bit_count = '1' then
			bit_count <= bit_count + 1 ;
		end if ;
	end if ;
end process ;	
bit_count_eq_16 <= '1' when bit_count = 16 else
						 '0' ;		 

process(clk, resetn)
begin
	if resetn = '0' then
		current_transfer_state <= WAIT_SAMPLE;
	elsif clk'event and clk = '1' then
		current_transfer_state <= next_transfer_state;
	end if ;
end process ; 


process(bit_count, end_tempo)
begin
	next_transfer_state <= current_transfer_state ;
	case current_transfer_state is
		when wait_sample =>
			if end_tempo = '1' then
				next_transfer_state <= assert_cs ;
			end if ;
		when assert_cs =>
			if end_tempo = '1' then 
				next_transfer_state <= xfer_data ;
			end if ;
		when xfer_data =>
			if bit_count = 16 then
				next_transfer_state <= deassert_cs ;
			end if ;
		when deassert_cs => 
			if end_tempo = '1' then 
				next_transfer_state <= wait_sample ;
			end if ;
		when others =>
			next_transfer_state <= wait_sample ;
	end case;
end process ;

process(clk, resetn)
begin 
	if resetn = '0' then
		data_clk <= '0' ;
	elsif clk'event and clk = '1' then
		if current_transfer_state = xfer_data then
			if end_tempo = '1' then
				data_clk <= not data_clk ;
			end if ;
		else
			data_clk <= '0' ;
		end if ;
	end if ;
end process ;

-- data clock rising edge and falling edge detect
process(clk, resetn)
begin 
	if resetn = '0' then
		data_clk_old <= '0' ;
	elsif clk'event and clk = '1' then
		data_clk_old <= data_clk ;
	end if ;
end process ;
data_clk_re <= data_clk and (not data_clk_old);
data_clk_fe <= (not data_clk) and data_clk_old;


cmd_word <= "10" & chan & "0" & X"000" ;


--shift register for data out
process(clk, resetn)
begin 
	if resetn = '0' then
		data_out_shift_reg <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if load_shift_register = '1' then
			data_out_shift_reg <= cmd_word ;
		elsif data_clk_fe = '1' then
			data_out_shift_reg(15 downto 1) <= data_out_shift_reg(14 downto 0) ;
			data_out_shift_reg(0) <= '0' ;
		end if ;
	end if ;
end process ;

--shift register for data in
process(clk, resetn)
begin 
	if resetn = '0' then
		data_in_shift_reg <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if data_clk_re = '1' then
			data_in_shift_reg(15 downto 1) <= data_in_shift_reg(14 downto 0) ;
			data_in_shift_reg(0) <= DIN ;
		end if ;
	end if ;
end process ;

with current_transfer_state select
	load_shift_register <= end_tempo when assert_cs,
					           '0' when others ;


en_tempo <= '1'  ;
with current_transfer_state select
	tempo_val <= std_logic_vector(to_unsigned(CLK_DIV, 16)) when  wait_sample,
					std_logic_vector(to_unsigned(CLK_DIV, 16)) when assert_cs,
					std_logic_vector(to_unsigned(CLK_DIV, 16)) when xfer_data,
					std_logic_vector(to_unsigned(SAMPLING_DIV, 16)) when deassert_cs,
					(others => '0') when others ;

with current_transfer_state select
	load_tempo <= end_tempo when  wait_sample,
					end_tempo when assert_cs,
					end_tempo when xfer_data,
					end_tempo when deassert_cs,
					'0' when others ;
					
with current_transfer_state select
	en_bit_count <= data_clk_fe when xfer_data,
					    '0' when others ;
						 
						 
with current_transfer_state select
	reset_bit_count <= bit_count_eq_16 when xfer_data,
					    '1' when others ;
			    
				 

-- outputs 

with current_transfer_state select
	ssn_d <= '0' when assert_cs,
				'0' when xfer_data,
				'1' when others ;
				
				
sample <= data_in_shift_reg(9 downto 0);
dv <= '1' when current_transfer_state=xfer_data and bit_count_eq_16= '1' else
		'0' ;
				
				
-- todo may delete following stuf, output are not combinatorial ...
process(clk, resetn)
begin 
	if resetn = '0' then
		DOUT <= '0' ;
		SCLK <= '0' ;
		SSN <= '1' ;
	elsif clk'event and clk = '1' then
		DOUT <= data_out_shift_reg(15) ;
		SCLK <= data_clk ;
		SSN <= ssn_d ;	
	end if ;
end process ;		

end Behavioral;

