---------------------------------------------------------------------
--	Filename:	gh_ran_scale.vhd
--
--
--	Description:
--		Scales a random number
--              
--	Copyright (c) 2008 by George Huber  
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	04/26/08  	h lefevre	Initial revision
--	1.1     	05/03/08  	h lefevre	add rst to process sensitivity list
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_ran_scale is 
	generic(size : INTEGER :=8 );
	port(
		clk    : in STD_LOGIC;
		rst    : in STD_LOGIC;
		Nsam   : in STD_LOGIC;
		Max    : in STD_LOGIC_VECTOR(size-1 downto 0);
		Min    : in STD_LOGIC_VECTOR(size-1 downto 0);
		random : in STD_LOGIC_VECTOR(size-1 downto 0);
		Sran   : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end entity;

architecture gh_ran_scale of gh_ran_scale is

component gh_mult_ip_usus_mg
	generic(size : INTEGER := 8);
	port (
		clk   : in STD_LOGIC;
		rst   : in STD_LOGIC;
		A     : in STD_LOGIC_VECTOR(size-1 downto 0);
		B     : in STD_LOGIC_VECTOR(size-1 downto 0);
		start : in STD_LOGIC;
		BUSYn : out STD_LOGIC;
		Q     : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end component;

	signal scale  : STD_LOGIC_vector(size downto 0);
	signal iSran  : STD_LOGIC_vector(size downto 0);
	signal iiSran : STD_LOGIC_vector(size downto 0);
	signal iRAND  : STD_LOGIC_vector(size downto 0);
	
begin
	
process (clk,rst)
begin
	if (rst = '1') then
		scale <= (others => '0');
		Sran  <= (others => '0');
		iRAND <= (others => '0');
	elsif (rising_edge(clk)) then
		scale <= (Max & '1') - (Min & '0');	
		iRAND <= (random & '0'); 
		Sran <= iSran(size downto 1) + Min;
		if (Nsam = '1') then
			iSran <= iiSran(size downto 0);
		end if;
	end if;		
end process;

U1 : gh_mult_ip_usus_mg
	generic map(size => size+1)
 	port map(
		clk => clk,
		rst => rst,
		start => Nsam,
		A => scale,
		B => iRAND,
		Q => iiSran
 		);

end architecture;
