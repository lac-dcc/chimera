----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:11 09/01/2014 
-- Design Name: 
-- Module Name:    yuv_split - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity yuv_split is
port(
	pixel_in_clk, pixel_in_hsync, pixel_in_vsync : in std_logic ;
	pixel_in_y_data : in std_logic_vector(7 downto 0);
	pixel_in_u_data : in std_logic_vector(7 downto 0);
	pixel_in_v_data : in std_logic_vector(7 downto 0);
	pixel_y_out_clk, pixel_y_out_hsync, pixel_y_out_vsync : out std_logic ;
	pixel_y_out_data : out std_logic_vector(7 downto 0);
	pixel_u_out_clk, pixel_u_out_hsync, pixel_u_out_vsync : out std_logic ;
	pixel_u_out_data : out std_logic_vector(7 downto 0);
	pixel_v_out_clk, pixel_v_out_hsync, pixel_v_out_vsync : out std_logic ;
	pixel_v_out_data : out std_logic_vector(7 downto 0)
);
end yuv_split;

architecture Behavioral of yuv_split is

begin

pixel_y_out_clk <= pixel_in_clk;
pixel_u_out_clk <= pixel_in_clk;
pixel_v_out_clk <= pixel_in_clk;

pixel_y_out_hsync <= pixel_in_hsync ;
pixel_u_out_hsync <= pixel_in_hsync ;
pixel_v_out_hsync <= pixel_in_hsync ;

pixel_y_out_vsync <= pixel_in_vsync ;
pixel_u_out_vsync <= pixel_in_vsync ;
pixel_v_out_vsync <= pixel_in_vsync ;

pixel_y_out_data <= pixel_in_y_data ;
pixel_u_out_data <= pixel_in_u_data ;
pixel_v_out_data <= pixel_in_v_data ;


end Behavioral;

