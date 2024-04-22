---------------------------------------------------------------------
--	Filename:	gh_fifo_sync_rrd_sr.vhd
--
--			
--	Description:
--		a simple FIFO - uses gh_sram_1wp_2rp_sc.vhd for Memory
--              
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	12/27/06  	S A Dodd 	Initial rrd revision
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_fifo_sync_rrd_sr is
	GENERIC (add_width: INTEGER :=8; -- min value is 1 (2 memory locations)
	         data_width: INTEGER :=8 ); -- size of data bus
	port (					
		clk : in STD_LOGIC; -- clock
		rst    : in STD_LOGIC; -- resets counters
		srst   : in STD_LOGIC:='0'; -- resets counters
		WR     : in STD_LOGIC; -- write control 
		RD     : in STD_LOGIC; -- read control
		D      : in STD_LOGIC_VECTOR (data_width-1 downto 0);
		Q      : out STD_LOGIC_VECTOR (data_width-1 downto 0);
		empty  : out STD_LOGIC; 
		full   : out STD_LOGIC);
end entity;

architecture a of gh_fifo_sync_rrd_sr is

component gh_sram_1wp_2rp_sc is
	GENERIC (size_add: INTEGER :=8 ;
	         size_data: INTEGER :=8 );
	port (					
		A_clk  : in STD_LOGIC;
		B_clk  : in STD_LOGIC;
		WE     : in STD_LOGIC;
		A_add  : in STD_LOGIC_VECTOR(size_add-1 downto 0);
		B_add  : in STD_LOGIC_VECTOR(size_add-1 downto 0);
		D      : in STD_LOGIC_VECTOR (size_data-1 downto 0);
		A_Q    : out STD_LOGIC_VECTOR (size_data-1 downto 0);
		B_Q    : out STD_LOGIC_VECTOR (size_data-1 downto 0));
end component;

	signal iempty      : STD_LOGIC;
	signal diempty     : STD_LOGIC;
	signal ifull       : STD_LOGIC;
	signal add_WR_CE   : std_logic;
	signal add_WR      : std_logic_vector(add_width downto 0); -- add_width -1 bits are used to address MEM
	signal add_RD_CE   : std_logic;
	signal add_RD      : std_logic_vector(add_width downto 0);

begin

--------------------------------------------
------- memory -----------------------------
--------------------------------------------
 
U1 : gh_sram_1wp_2rp_sc
	generic map (
		size_add => add_width,
		size_data => data_width
		)
	port map(
		A_clk => CLK,
		B_clk => CLK,
		WE => add_WR_CE,
		D =>  D,
		A_add => add_WR(add_width-1 downto 0),
		B_add => add_RD(add_width-1 downto 0),
		B_Q =>  Q
		);
	
-----------------------------------------
----- Write address counter -------------
-----------------------------------------

	add_WR_CE <= '0' when (ifull = '1') else
	             '0' when (WR = '0') else
	             '1';
				 
process (clk,rst)
begin 
	if (rst = '1') then
		add_WR <= (others => '0');
	elsif (rising_edge(clk)) then
		if (srst = '1') then
			add_WR <= (others => '0');
		elsif (add_WR_CE = '1') then
			add_WR <= add_WR + "01";
		else
			add_WR <= add_WR;
		end if;
	end if;
end process;
				 
	full <= ifull;

	ifull <= '1' when ((add_RD(add_width) /= add_WR(add_width)) 
	                and (add_RD(add_width-1 downto 0) = add_WR(add_width-1 downto 0))) else
	         '0';
			 
-----------------------------------------
----- Read address counter --------------
-----------------------------------------


	add_RD_CE <= '0' when (iempty = '1') else
	             '0' when (RD = '0') else
	             '1';
				 
process (clk,rst)
begin 
	if (rst = '1') then
		add_RD <= (others => '0');
		diempty <= '1';
	elsif (rising_edge(clk)) then
		if (srst = '1') then
			add_RD <= (others => '0');
			diempty <= '1';
		elsif (add_RD_CE = '1') then
			add_RD <= add_RD + "01";
			diempty <= iempty;
		else
			add_RD <= add_RD;
			diempty <= iempty;
		end if;
	end if;
end process;

	empty <= diempty;
 
	iempty <= '1' when (add_WR = add_RD) else
	          '0';


end architecture;
