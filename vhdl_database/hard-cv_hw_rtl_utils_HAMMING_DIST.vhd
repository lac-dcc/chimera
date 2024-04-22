----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    17:31:14 10/04/2012 
-- Design Name: 
-- Module Name:    HAMMING_DIST - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.utils_pack.all ;

entity HAMMING_DIST is
generic(WIDTH: natural := 32; CYCLES : natural := 1);
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			en : in std_logic ;
			vec1, vec2 :  in std_logic_vector((WIDTH - 1) downto 0);
			
			dv : out std_logic ;
			distance : out std_logic_vector(nbit(WIDTH)-1 downto 0 ) );
end HAMMING_DIST;


--architecture RTL of HAMMING_DIST is
--
--type array_4bits is array(0 to (((WIDTH/CYCLES)/4) - 1)) of std_logic_vector(3 downto 0); 
--type array_widthbits is array(0 to (((WIDTH/CYCLES)/4) - 1)) of std_logic_vector(nbit(WIDTH)-1 downto 0); 
--
--signal distance_latched, distance_i : std_logic_vector(nbit(WIDTH)-1 downto 0) ;
--signal distances_int : array_widthbits ;
--
--signal distances_array : array_4bits ;
--
--signal svec1,  svec2 : std_logic_vector((WIDTH - 1) downto 0) ;
--
--signal en_re, en_old : std_logic ;
--begin
-- 
--	generate_hamming4_n : for i in  0 to (((WIDTH/CYCLES)/4) - 1) generate
--		hamming4_0 : HAMMING_DIST4 
--			port map(
--				clk => clk, 
--				resetn => resetn, 
--				en => en,
--				vec1 => svec1((((i*4) + 4) - 1) downto (i*4)), vec2 => svec2((((i*4) + 4) - 1) downto (i*4)),
--				distance => distances_array(i) );
--			if_zeroo : if i = 0 generate
--				distances_int(i)(nbit(WIDTH)-1 downto 4) <=  (others => '0') ;
--				distances_int(i)(3 downto 0) <=  distances_array(i)  ;
--			end generate ;
--			if_sup1 : if i > 0 generate
--				distances_int(i) <= distances_array(i) + distances_int(i - 1) ;
--			end generate ;
--	end generate ;
--
--	
--	process(clk, resetn)
--	begin
--		if resetn = '0' then
--			en_old <= '0' ;
--		elsif clk'event and clk = '1' then
--			en_old <= en ;
--		end if ;
--	end process ;
--	en_re <= en AND (NOT en_old) ;
--	
--	
--	
--	process(clk, resetn)
--	begin
--		if resetn = '0' then
--			distance_latched <= (others => '0') ;
--			svec1 <= (others => '0') ;
--			svec2 <= (others => '0') ;
--		elsif clk'event and clk = '1' then
--			if en_re = '1' then
--				svec1 <= vec1 ;
--				svec2 <= vec2 ;
--				distance_latched <= (others => '0');
--			else
--				distance_latched <= distance_i ;
--				svec1((WIDTH - 1) downto (WIDTH )-(WIDTH/CYCLES)) <=  (others => '0') ;
--				svec2((WIDTH - 1) downto (WIDTH )-(WIDTH/CYCLES)) <=  (others => '0') ;
--				svec1((WIDTH - 1)-(WIDTH/CYCLES) downto 0) <=  svec1((WIDTH - 1) downto (WIDTH/CYCLES)) ;
--				svec2((WIDTH - 1)-(WIDTH/CYCLES) downto 0) <=  svec2((WIDTH - 1) downto (WIDTH/CYCLES)) ;
--			end if ;
--		end if;
--	end process ;
--	
--	enable_delay : generic_delay 
--		generic map( WIDTH => 1, DELAY => CYCLES)
--		port map(
--			clk => clk, resetn => resetn,
--			input(0)	=> en_re ,
--			output(0) => dv 
--		);		
--
-- 
--   distance_i <= distance_latched + distances_int(((WIDTH/CYCLES)/4) - 1) ;
--	distance <= distance_i ;
--
--end RTL;

architecture Behavioral of HAMMING_DIST is
signal comp : std_logic_vector((WIDTH - 1) downto 0) ;

begin
 
 
 process(clk, resetn)
	begin
		if resetn = '0' then
			distance <= (others => '0');
			dv <= '0' ;
		elsif clk'event and clk = '1' then
			 comp <= vec1 XOR vec2 ;
			 distance <= std_logic_vector(to_unsigned(count_ones(comp), nbit(WIDTH)));
			 dv <= en ;
		end if;
	end process ;
 
 
end Behavioral;

