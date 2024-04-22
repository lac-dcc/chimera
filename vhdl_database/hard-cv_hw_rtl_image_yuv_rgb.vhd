----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    11:48:01 03/12/2012 
-- Design Name: 
-- Module Name:    binarization - Behavioral 
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
use IEEE.NUMERIC_STD.ALL ;
use IEEE.STD_LOGIC_UNSIGNED.ALL ;

library work;
use work.utils_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity yuv_rgb is
port( clk	:	in std_logic ;
		resetn	:	in std_logic ;
		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_y : in std_logic_vector(7 downto 0) ;
		pixel_u : in std_logic_vector(7 downto 0) ;
		pixel_v : in std_logic_vector(7 downto 0) ;
		pixel_r : out std_logic_vector(7 downto 0) ;
		pixel_g : out std_logic_vector(7 downto 0)  ;
		pixel_b : out std_logic_vector(7 downto 0)  
);
end yuv_rgb;

architecture Behavioral of yuv_rgb is
signal pixel_r_t, pixel_g_t, pixel_b_t: signed(15 downto 0);
signal clamp_pixel_r_t, clamp_pixel_g_t, clamp_pixel_b_t: std_logic_vector(7 downto 0);
signal yl, ul, vl: std_logic_vector(15 downto 0);
signal c, d, e: signed(15 downto 0);
signal c_298, d_100, d_516, e_409, e_208: signed(15 downto 0);
signal pixel_data1_bin, pixel_data2_bin, pixel_data3_bin, pixels_and : std_logic ;
begin

yl <= X"00" & pixel_y ;
ul <= X"00" & pixel_u ;
vl <= X"00" & pixel_v ;

--c <= yl - std_logic_vector(to_unsigned(16, 16)) ;
--d <= ul - std_logic_vector(to_unsigned(128, 16)) ;
--e <= vl - std_logic_vector(to_unsigned(128, 16)) ;
--
--c_298 <= (c(7 downto 0) & X"00") + c(10 downto 0) & (others => '0') ; -- 256 * c + 32 * c 
--d_100 <= (d(8 downto 0) & (others => '0')) - (d(10 downto 0) & (others => '0')) ; -- 128 * d - 32 * d
--d_516 <= (d(6 downto 0) & (others => '0')) ; -- 512 * d
--e_409 <= (e(6 downto 0) & (others => '0')) - (e(8 downto 0) & (others => '0')) ; -- 512 *e - 128 * e
--e_208 <= (e(7 downto 0) & (others => '0')) - (e(10 downto 0) & (others => '0')) ; -- 256 *e - 32 * e
--
--
--
--pixel_r_t <= c_298 + e_409 + std_logic_vector(to_unsigned(128, 16));
--pixel_g_t <= c_298 - d_100 - e_208 + std_logic_vector(to_unsigned(128, 16));
--pixel_b_t <= c_298 + d_516 + std_logic_vector(to_unsigned(128, 16));

pixel_r_t <= signed(yl) + signed(vl) - to_signed(164, 16);
pixel_g_t <= signed(yl) - signed( ul(15 downto 2)) - signed(vl(15 downto 1)) + to_signed(80, 16);
pixel_b_t <= signed(yl) + signed(ul(14 downto 0) & '0') - to_signed(272, 16);


clamp_pixel_r_t <= X"FF" when pixel_r_t > 255 else
						 X"00" when pixel_r_t < 0 else
						 std_logic_vector(pixel_r_t(7 downto 0)) ;

clamp_pixel_g_t <= X"FF" when pixel_g_t > 255 else
						 X"00" when pixel_g_t < 0 else
						 std_logic_vector(pixel_g_t(7 downto 0)) ;

clamp_pixel_b_t <= X"FF" when pixel_b_t > 255 else
						 X"00" when pixel_b_t < 0 else
						 std_logic_vector(pixel_b_t(7 downto 0)) ;

pixel_r_latch0 : edge_triggered_latch 
		 generic map( NBIT => 8)
		 port map( clk =>clk,
				  resetn => resetn ,
				  sraz => '0' ,
				  en => pixel_in_clk ,
				  d => clamp_pixel_r_t(7 downto 0) , 
				  q => pixel_r);
				  
pixel_g_latch0 : edge_triggered_latch 
		 generic map( NBIT => 8)
		 port map( clk =>clk,
				  resetn => resetn ,
				  sraz => '0' ,
				  en => pixel_in_clk ,
				  d => clamp_pixel_g_t(7 downto 0) , 
				  q => pixel_g);

pixel_b_latch0 : edge_triggered_latch 
		 generic map( NBIT => 8)
		 port map( clk =>clk,
				  resetn => resetn ,
				  sraz => '0' ,
				  en => pixel_in_clk ,
				  d => clamp_pixel_b_t(7 downto 0) , 
				  q => pixel_b);				  

process(clk, resetn)
begin
	if resetn = '0' then
		pixel_out_clk <= '0';
		pixel_out_hsync <= '0' ;
		pixel_out_vsync <= '0' ;
	elsif clk'event and clk = '1' then
		pixel_out_clk <= pixel_in_clk;
		pixel_out_hsync <=pixel_in_hsync ;
		pixel_out_vsync <=pixel_in_vsync ;
	end if ;
end process ;

end Behavioral;

