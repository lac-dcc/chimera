--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;



package primitive_pack is

component ram_NxN is
	generic(SIZE : natural := 64 ; NBIT : natural := 8; ADDR_WIDTH : natural := 6);
	port(
 		clk : in std_logic; 
 		we, en : in std_logic; 
 		do : out std_logic_vector(NBIT-1 downto 0 ); 
 		di : in std_logic_vector(NBIT-1 downto 0 ); 
 		addr : in std_logic_vector((ADDR_WIDTH - 1) downto 0 )
	); 
end component;


component ram_8x64 is
	port(
 		clk : in std_logic; 
 		we, en : in std_logic; 
 		do : out std_logic_vector(7 downto 0 ); 
 		di : in std_logic_vector(7 downto 0 ); 
 		addr : in std_logic_vector(6 downto 0 )
	); 
end component;

component ram_Nx8 is
	generic(N : natural := 645; A : natural := 10);
	port(
 		clk : in std_logic; 
 		we, en : in std_logic; 
 		do : out std_logic_vector(7 downto 0 ); 
 		di : in std_logic_vector(7 downto 0 ); 
 		addr : in std_logic_vector((A - 1) downto 0 )
	); 
end component;

component MAC16 is
port(clk, reset : in std_logic;
	  add_subb	:	in std_logic;
	  A, B	:	in signed(15 downto 0);
	  RES	:	out signed(31 downto 0)  
);
end component;

component SAC16 is
port(clk, sraz : in std_logic;
	  A, B	:	in signed(15 downto 0);
	  RES	:	out signed(31 downto 0)  
);
end component;

component dpram_NxN is
	generic(SIZE : natural := 64 ; NBIT : natural := 8; ADDR_WIDTH : natural := 6);
	port(
 		clk : in std_logic; 
 		we : in std_logic; 
 		
 		di : in std_logic_vector(NBIT-1 downto 0 ); 
		a	:	in std_logic_vector((ADDR_WIDTH - 1) downto 0 );
 		dpra : in std_logic_vector((ADDR_WIDTH - 1) downto 0 );
		spo : out std_logic_vector(NBIT-1 downto 0 );
		dpo : out std_logic_vector(NBIT-1 downto 0 ) 		
	); 
end component;




end primitive_pack;

package body primitive_pack is

 
end primitive_pack;
