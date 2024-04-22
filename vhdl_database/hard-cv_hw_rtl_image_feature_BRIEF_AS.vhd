----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    11:53:10 02/27/2013 
-- Design Name: 
-- Module Name:    brief_as - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.utils_pack.all ;
use work.image_pack.all ;
use work.feature_pack.all ;

entity BRIEF_AS is
generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480;
		  DESCRIPTOR_SIZE : natural := 64);
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			new_feature : in std_logic;
			line_count : in std_logic_vector((nbit(HEIGHT) - 1) downto 0 ) ;
			pixel_count : in std_logic_vector((nbit(WIDTH) - 1) downto 0 ) ;
			curr_descriptor : in std_logic_vector((DESCRIPTOR_SIZE - 1) downto 0) ;  
			descriptor_correl :  in std_logic_vector((DESCRIPTOR_SIZE - 1) downto 0) ;
			correl_winx0 :  in std_logic_vector(15 downto 0) ;
			correl_winx1 :  in std_logic_vector(15 downto 0) ;
			correl_winy0 :  in std_logic_vector(15 downto 0) ;
			correl_winy1 :  in std_logic_vector(15 downto 0) ;
			
			correl_x	: out std_logic_vector(15 downto 0);
			correl_y	: out std_logic_vector(15 downto 0);
			correl_score : out std_logic_vector(nbit(DESCRIPTOR_SIZE)-1 downto 0);
			correl_done :  out std_logic;
			correl_busy : out std_logic 
			);
end BRIEF_AS;

architecture Behavioral of BRIEF_AS is

signal correl_score_t : std_logic_vector(nbit(DESCRIPTOR_SIZE)-1 downto 0);
signal correl_x_t, correl_y_t : std_logic_vector(15 downto 0);
signal hamming_done : std_logic ;
signal current_score : std_logic_vector(nbit(DESCRIPTOR_SIZE)-1 downto 0);
signal inWin : std_logic ;
signal reset_correl : std_logic ;
begin

score: HAMMING_DIST 
		generic map(WIDTH => DESCRIPTOR_SIZE, CYCLES => 4)
		port map(
			clk => clk,
			resetn => resetn ,
			en => new_feature,
			vec1 => curr_descriptor, vec2 => descriptor_correl ,
			dv => hamming_done ,
			distance =>  current_score);

inWin <= '0' when pixel_count < correl_winx0 and pixel_count > correl_winx1 and line_count < correl_winy0 and line_count > correl_winy1 else
			'1' ;

correl_busy <= inWin ;
reset_correl <= '1' when pixel_count = (correl_winx0-1) and line_count = correl_winy0 else
					 '0' ; -- reseting just when entering window
			
process(clk, resetn)
begin
	if resetn = '0' then
		correl_score_t <= (others => '0');
	elsif clk'event and clk = '1' then
		if reset_correl = '1' then
			correl_score_t <= (others => '0');
		elsif inWin = '1' then
			if current_score > correl_score_t then
				correl_score_t <= current_score ;
				correl_x_t((nbit(WIDTH) - 1) downto 0) <= pixel_count ;
				correl_y_t((nbit(HEIGHT) - 1) downto 0) <= line_count ;
			end if ;
		end if ;
	end if ;
end process ;
correl_x_t(15 downto nbit(WIDTH)) <= (others => '0') ;
correl_y_t(15 downto nbit(WIDTH)) <= (others => '0') ;
correl_score <= correl_score_t ;
correl_x <= correl_x_t ;
correl_y <= correl_y_t ;


correl_done <= '1' when pixel_count > correl_winx1 and line_count > correl_winy1 else 
					'0' ;


end Behavioral;

