--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package logi_communication_pack is

component i2c_master is
generic(i2c_freq_hz : positive := 100_000;
		  clk_freq_hz : positive := 100_000_000);
port(
 		clk : in std_logic; 
 		reset : in std_logic; 
 		slave_addr : in std_logic_vector(6 downto 0 ); 
 		data_in : in std_logic_vector(7 downto 0 );
		
 		i2c_read : in std_logic; 
 		i2c_write : in std_logic; 
		scl : inout std_logic; 
 		sda : inout std_logic; 
		
		data_out : out std_logic_vector(7 downto 0 ); 
		new_data : out std_logic ;
 		ack, nack, busy : out std_logic
	); 
end component;

end logi_communication_pack;

package body logi_communication_pack is


end logi_communication_pack;
