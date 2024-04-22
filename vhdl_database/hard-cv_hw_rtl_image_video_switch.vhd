----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    13:51:18 05/24/2012 
-- Design Name: 
-- Module Name:    video_switch - Behavioral 
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


library work ;
use work.utils_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity video_switch is
generic(NB	:	positive := 2);
port(pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic_vector(NB - 1 downto 0);
	  pixel_in_data	:	in slv8_array(NB - 1 downto 0);
	  pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic ;
	  pixel_out_data	:	out std_logic_vector(7 downto 0);
	  channel	:	in std_logic_vector(7 downto 0)
);
end video_switch;

architecture Behavioral of video_switch is

begin
pixel_out_data <= pixel_in_data(conv_integer(channel));
pixel_out_clk <= pixel_in_clk(conv_integer(channel));
pixel_out_hsync <=pixel_in_hsync(conv_integer(channel));
pixel_out_vsync <=pixel_in_vsync(conv_integer(channel));

end Behavioral;

