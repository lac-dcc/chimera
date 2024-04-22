----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    14:58:34 10/12/2012 
-- Design Name: 
-- Module Name:    virtual_camera - Behavioral 
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
library STD;
use STD.textio.all;                     -- basic I/O

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_textio.all;          -- I/O for logic types


library work ;
use work.pgm.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity virtual_camera is
generic(IMAGE_PATH : string := ""; 
			PERIOD : time := 10ns; 
			HEIGHT : positive := 240;
			WIDTH : positive := 320);
port(
		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic );
end virtual_camera;

architecture Behavioral of virtual_camera is
type INTF is file of integer ;

signal temp_hsync, temp_vsync, temp_pixel_clock : std_logic ;
signal pixel_data_temp : std_logic_vector(7 downto 0);
begin

read_file:
    process    -- read file_io.in (one time at start of simulation)
		variable image : pixel_array_ptr ;
		variable px_count, x_count, y_count, line_count, byte_count : integer := 0 ;
    begin
		image := pgm_read(IMAGE_PATH);
      loop EXIT WHEN line_count = (HEIGHT+37);
				temp_pixel_clock <= '0';
				if px_count < WIDTH and line_count > 25 and line_count < (HEIGHT+26) then
					temp_hsync <= '0' ;					
					pixel_data_temp <= std_logic_vector(to_unsigned(image.all(px_count,line_count - 26), 8)) ;
				else
						temp_hsync <= '1' ;
				end if ;
				

				if line_count < 3 then
					temp_vsync <= '1' ;
				 else 
					temp_vsync <= '0' ;
				end if ;
				wait for PERIOD/2;
				
				temp_pixel_clock <= '1';
				if (px_count = (WIDTH+155) ) then
					px_count := 0 ;
					if (line_count > (HEIGHT+37)) then
						line_count := 0;
				  else
					 line_count := line_count + 1 ;
				  end if ;
				else
				  px_count := px_count + 1 ;
				end if ;
				wait for PERIOD/2;
				if line_count >= (HEIGHT+26) then
					line_count := 0;
					px_count := 0;
				end if;
      end loop;
		
		
      wait; -- one shot at time zero,
    end process read_file;
	 
	 
	 clk_domain_latch : process(clk, resetn)
	 begin
	 if resetn = '0' then
		pixel_out_hsync <= '1' ;
		pixel_out_vsync <= '1' ;
		pixel_out_clk <= '0' ;
		pixel_data <= (others => '0');
	 elsif rising_edge(clk) then
		pixel_out_clk <= temp_pixel_clock ;
		pixel_out_hsync <= temp_hsync ;
		pixel_out_vsync <= temp_vsync ;
		pixel_data <= pixel_data_temp ;
	 end if ;
	 end process ;


end Behavioral;

