----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:17:50 01/31/2011 
-- Design Name: 
-- Module Name:    corner_score - Behavioral 
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
-- arithmetic functions with signed or unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity corner_score is
port(
		output : out std_logic_vector(12 downto 0);
		i0b, i1b, i2b, i3b, i4b, i5b, i6b, i7b, i8b, i9b, i10b, i11b, i12b, i13b, i14b, i15b : in std_logic_vector(9 downto 0);
		i0d, i1d, i2d, i3d, i4d, i5d, i6d, i7d, i8d, i9d, i10d, i11d, i12d, i13d, i14d, i15d : in std_logic_vector(9 downto 0);
		clk, rst, ce : in std_logic
	);
end corner_score;

architecture Behavioral of corner_score is

signal s0b, s1b, s2b, s3b, s4b, s5b, s6b, s7b : unsigned(9 downto 0);
signal ss0b, ss1b, ss2b, ss3b : unsigned(10 downto 0);
signal sss0b, sss1b : unsigned(11 downto 0);

signal s0d, s1d, s2d, s3d, s4d, s5d, s6d, s7d : unsigned(9 downto 0);
signal ss0d, ss1d, ss2d, ss3d : unsigned(10 downto 0);
signal sss0d, sss1d : unsigned(11 downto 0);

signal sum_all_b, sum_all_d : unsigned(12 downto 0);

begin

add_b : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
			s0b<=(others=>'0');		s1b<=(others=>'0');		s2b<=(others=>'0');		s3b<=(others=>'0');	
			s4b<=(others=>'0');		s5b<=(others=>'0');		s6b<=(others=>'0');		s7b<=(others=>'0');	
			ss0b<=(others=>'0');		ss1b<=(others=>'0');		ss2b<=(others=>'0');		ss3b<=(others=>'0');	
			sss0b<=(others=>'0');	sss1b<=(others=>'0');	
			sum_all_b<=(others=>'0');
		elsif ce='1' then
			s0b<=resize(unsigned(i0b), s0b'length)+resize(unsigned(i1b), s0b'length);
			s1b<=resize(unsigned(i2b), s1b'length)+resize(unsigned(i3b), s1b'length);
			s2b<=resize(unsigned(i4b), s2b'length)+resize(unsigned(i5b), s2b'length);
			s3b<=resize(unsigned(i6b), s3b'length)+resize(unsigned(i7b), s3b'length);
			s4b<=resize(unsigned(i8b), s4b'length)+resize(unsigned(i9b), s4b'length);
			s5b<=resize(unsigned(i10b), s5b'length)+resize(unsigned(i11b), s5b'length);
			s6b<=resize(unsigned(i12b), s6b'length)+resize(unsigned(i13b), s6b'length);
			s7b<=resize(unsigned(i14b), s7b'length)+resize(unsigned(i15b), s7b'length);

			ss0b<=resize(unsigned(s0b), ss0b'length)+resize(unsigned(s1b), ss0b'length);
			ss1b<=resize(unsigned(s2b), ss1b'length)+resize(unsigned(s3b), ss1b'length);
			ss2b<=resize(unsigned(s4b), ss2b'length)+resize(unsigned(s5b), ss2b'length);
			ss3b<=resize(unsigned(s6b), ss3b'length)+resize(unsigned(s7b), ss3b'length);

			sss0b<=resize(unsigned(ss0b), sss0b'length)+resize(unsigned(ss1b), sss0b'length);
			sss1b<=resize(unsigned(ss2b), sss1b'length)+resize(unsigned(ss3b), sss1b'length);

			sum_all_b<=resize(unsigned(sss0b), sum_all_b'length)+resize(unsigned(sss1b), sum_all_b'length);
		end if;
	end if;
end process add_b;


add_d : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
			s0d<=(others=>'0');		s1d<=(others=>'0');		s2d<=(others=>'0');		s3d<=(others=>'0');	
			s4d<=(others=>'0');		s5d<=(others=>'0');		s6d<=(others=>'0');		s7d<=(others=>'0');	
			ss0d<=(others=>'0');		ss1d<=(others=>'0');		ss2d<=(others=>'0');		ss3d<=(others=>'0');	
			sss0d<=(others=>'0');	sss1d<=(others=>'0');	
			sum_all_d<=(others=>'0');
		elsif ce='1' then
			s0d<=resize(unsigned(i0d), s0d'length)+resize(unsigned(i1d), s0d'length);
			s1d<=resize(unsigned(i2d), s1d'length)+resize(unsigned(i3d), s1d'length);
			s2d<=resize(unsigned(i4d), s2d'length)+resize(unsigned(i5d), s2d'length);
			s3d<=resize(unsigned(i6d), s3d'length)+resize(unsigned(i7d), s3d'length);
			s4d<=resize(unsigned(i8d), s4d'length)+resize(unsigned(i9d), s4d'length);
			s5d<=resize(unsigned(i10d), s5d'length)+resize(unsigned(i11d), s5d'length);
			s6d<=resize(unsigned(i12d), s6d'length)+resize(unsigned(i13d), s6d'length);
			s7d<=resize(unsigned(i14d), s7d'length)+resize(unsigned(i15d), s7d'length);

			ss0d<=resize(unsigned(s0d), ss0d'length)+resize(unsigned(s1d), ss0d'length);
			ss1d<=resize(unsigned(s2d), ss1d'length)+resize(unsigned(s3d), ss1d'length);
			ss2d<=resize(unsigned(s4d), ss2d'length)+resize(unsigned(s5d), ss2d'length);
			ss3d<=resize(unsigned(s6d), ss3d'length)+resize(unsigned(s7d), ss3d'length);

			sss0d<=resize(unsigned(ss0d), sss0d'length)+resize(unsigned(ss1d), sss0d'length);
			sss1d<=resize(unsigned(ss2d), sss1d'length)+resize(unsigned(ss3d), sss1d'length);

			sum_all_d<=resize(unsigned(sss0d), sum_all_d'length)+resize(unsigned(sss1d), sum_all_d'length);
		end if;
	end if;
end process add_d;

select_max : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
			output <= (others => '0');
		elsif ce='1' then
			if sum_all_d>sum_all_b then
				output<=std_logic_vector(sum_all_d);
			else
				output<=std_logic_vector(sum_all_b);
			end if;
		end if;
	end if;
end process select_max;

end Behavioral;

