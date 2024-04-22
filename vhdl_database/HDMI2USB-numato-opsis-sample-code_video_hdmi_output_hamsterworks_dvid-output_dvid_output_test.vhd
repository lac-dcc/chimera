----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:30 01/03/2015 
-- Design Name: 
-- Module Name:    dvid_output_test - Behavioral 
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

entity dvid_output_test is
    Port ( clk50         : in  STD_LOGIC;

           hdmi_out_p : out  STD_LOGIC_VECTOR(3 downto 0);
           hdmi_out_n : out  STD_LOGIC_VECTOR(3 downto 0);
                      
           leds       : out std_logic_vector(7 downto 0));
end dvid_output_test;

architecture Behavioral of dvid_output_test is

	COMPONENT vga_gen
	PORT(
		clk50           : IN std_logic;          
		pixel_clock     : OUT std_logic;
		red_p           : OUT std_logic_vector(7 downto 0);
		green_p         : OUT std_logic_vector(7 downto 0);
		blue_p          : OUT std_logic_vector(7 downto 0);
		blank           : OUT std_logic;
		hsync           : OUT std_logic;
		vsync           : OUT std_logic
		);
	END COMPONENT;


	COMPONENT dvid_out
	PORT(
      clk_pixel  : IN std_logic;
		red_p      : IN std_logic_vector(7 downto 0);
		green_p    : IN std_logic_vector(7 downto 0);
		blue_p     : IN std_logic_vector(7 downto 0);
		blank      : IN std_logic;
		hsync      : IN std_logic;
		vsync      : IN std_logic;          
		tmds_out_p : OUT std_logic_vector(3 downto 0);
		tmds_out_n : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	signal pixel_clock     : std_logic;

   signal red_p   : std_logic_vector(7 downto 0);
   signal green_p : std_logic_vector(7 downto 0);
   signal blue_p  : std_logic_vector(7 downto 0);
	signal blank   : std_logic;
	signal hsync   : std_logic;
	signal vsync   : std_logic;          

begin
   leds <= x"AA";
   
   ----------------------------------
   -- EDID I2C signals (not implemented)
   ----------------------------------
--   hdmi_in_sclk  <= 'Z';
--   hdmi_in_sdat  <= 'Z';

---------------------------------------
-- Generate a 1280x720 VGA test pattern
---------------------------------------
Inst_vga_gen: vga_gen PORT MAP(
		clk50 => clk50,
		pixel_clock     => pixel_clock,      
		red_p           => red_p,
		green_p         => green_p,
		blue_p          => blue_p,
		blank           => blank,
		hsync           => hsync,
		vsync           => vsync
	);

---------------------------------------------------
-- Convert the VGA signals to the DVI-D/TMDS output 
---------------------------------------------------
Inst_dvid_out: dvid_out PORT MAP(
		clk_pixel  => pixel_clock,
     
		red_p      => red_p,
		green_p    => green_p,
		blue_p     => blue_p,
		blank      => blank,
		hsync      => hsync,
		vsync      => vsync,
     
		tmds_out_p => hdmi_out_p,
		tmds_out_n => hdmi_out_n
	);


end Behavioral;

