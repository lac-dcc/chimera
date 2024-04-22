----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    09:37:19 03/29/2012 
-- Design Name: 
-- Module Name:    configuration_module - Behavioral 
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

library work;
use work.camera.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity configuration_module is
generic(NB_REGISTERS : natural := 6);
port(
	clk, resetn : in std_logic ;
	input_data	:	in std_logic_vector(7 downto 0) ;
	read_data	:	out std_logic ;
	data_present	:	in std_logic ;
	vsync	:	in std_logic ;
	registers	: out register_array(0 to (NB_REGISTERS - 1))
);
end configuration_module;

architecture Behavioral of configuration_module is
type conf_module_state is (WAIT_DATA_STATE, READ_DATA_STATE, OUTPUT_DATA_STATE);


signal register_array0 :  register_array(0 to (NB_REGISTERS - 1)) ;
signal conf_module_state0 : conf_module_state ;
signal register_index : std_logic_vector(3 downto 0) := (others => '0') ;
begin


process(clk, resetn)
begin
if resetn = '0' then
	register_index <= (others => '0');
	conf_module_state0 <= WAIT_DATA_STATE ;
elsif clk'event and clk = '1' then
	case conf_module_state0 is
		when WAIT_DATA_STATE => 
			if data_present = '1' then
				read_data <= '1' ;
				conf_module_state0 <= READ_DATA_STATE;
			elsifpixel_in_vsync = '1' then
				read_data <= '0' ;
				registers <= register_array0 ;
				conf_module_state0 <= OUTPUT_DATA_STATE;
			end if;
		when READ_DATA_STATE => 
			register_array0(conv_integer(register_index)) <= input_data;
			read_data <= '0' ;
			register_index <= register_index + 1 ;
			conf_module_state0 <= WAIT_DATA_STATE;
		when OUTPUT_DATA_STATE =>
			register_index <= (others => '0') ;
			ifpixel_in_vsync = '0' then
				conf_module_state0 <= WAIT_DATA_STATE;
			end if;
	end case ;
end if;
end process;


end Behavioral;

