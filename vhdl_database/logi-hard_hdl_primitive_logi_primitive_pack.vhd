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



package logi_primitive_pack is


component MAC16 is
port(clk, sraz : in std_logic;
	  add_subb, reset_acc	:	in std_logic;
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

component tdp_bram is
generic (
    DATA_A    : integer := 16;
    ADDR_A    : integer := 10;
    DATA_B    : integer := 16;
    ADDR_B    : integer := 10
);
port (
    -- Port A
    a_clk   : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  std_logic_vector(ADDR_A-1 downto 0);
    a_din   : in  std_logic_vector(DATA_A-1 downto 0);
    a_dout  : out std_logic_vector(DATA_A-1 downto 0);
     
    -- Port B
    b_clk   : in  std_logic;
    b_wr    : in  std_logic;
    b_addr  : in  std_logic_vector(ADDR_B-1 downto 0);
    b_din   : in  std_logic_vector(DATA_B-1 downto 0);
    b_dout  : out std_logic_vector(DATA_B-1 downto 0)
);
end component;


end logi_primitive_pack;

package body logi_primitive_pack is

 
end logi_primitive_pack;
