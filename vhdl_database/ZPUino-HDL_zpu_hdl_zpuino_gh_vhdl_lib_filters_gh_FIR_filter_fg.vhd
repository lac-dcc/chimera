---------------------------------------------------------------------
--	Filename:	gh_FIR_filter_fg.vhd
--			
--	Description:
--		FIR Filter with full generics
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	07/11/07  	S A Dodd 	Initial revision
--
------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity gh_FIR_filter_fg is  
	GENERIC(
		x : INTEGER :=3; -- filter order = 2^x
		d_size: INTEGER :=16; -- data size
		c_size: INTEGER :=16; -- coef size
		xbits : INTEGER :=0);  -- extra bits, needed if gain > 1.0
	port(
		CLK       : in STD_LOGIC;
		rst       : in STD_LOGIC;
		sample    : in STD_LOGIC;
		D_IN      : in STD_LOGIC_VECTOR(d_size-1 downto 0);
		coef_data : in STD_LOGIC_VECTOR(c_size-1 downto 0);
		ROM_ADD   : out STD_LOGIC_VECTOR(x-1 downto 0);
		D_OUT     : out STD_LOGIC_VECTOR(d_size+xbits-1 downto 0)
		);
end entity;

architecture a of gh_FIR_filter_fg is

---- Component declarations -----

component gh_register_ce
	generic(size : INTEGER := 8);
	port (
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		CE  : in STD_LOGIC;
		D   : in STD_LOGIC_VECTOR(size-1 downto 0);
		Q   : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end component;

component gh_MAC_ld
	generic(size_A : INTEGER :=16;
	        size_B : INTEGER :=16;
	        xbits : INTEGER :=0);
	port (
		clk  : in STD_LOGIC;
		rst  : in STD_LOGIC;
		LOAD : in STD_LOGIC;
		ce   : in STD_LOGIC;
		DA   : in STD_LOGIC_VECTOR(size_A-1 downto 0);
		DB   : in STD_LOGIC_VECTOR(size_B-1 downto 0);
		Q    : out STD_LOGIC_VECTOR(size_A+size_B+xbits-1 downto 0)
		);
end component;

component gh_shift_reg
	GENERIC (size: INTEGER := 16); 
	PORT(
		clk      : IN STD_logic;
		rst      : IN STD_logic;
		D        : IN STD_LOGIC;
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

component gh_counter_up_ce
	GENERIC (size: INTEGER :=8);
	PORT(
		CLK   : IN	STD_LOGIC;
		rst   : IN	STD_LOGIC;
		CE    : IN	STD_LOGIC;
		Q     : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

component gh_counter_up_sr_ce
	GENERIC (size: INTEGER :=8);
	PORT(
		CLK   : IN	STD_LOGIC;
		rst   : IN	STD_LOGIC;
		srst  : IN	STD_LOGIC;
		CE    : IN	STD_LOGIC;
		Q     : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

component gh_sram_1wp_2rp
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

	constant ORDER : INTEGER := 2**x;
	constant max_coef_count : STD_LOGIC_VECTOR(x downto 1) := (others => '1');

	signal i_data       : STD_LOGIC_VECTOR(d_size-1 downto 0);
	signal D_ACC        : STD_LOGIC_VECTOR(d_size+c_size+xbits-1 downto 0);
	signal id_out       : STD_LOGIC_VECTOR(d_size+c_size+xbits-1 downto 0);
	signal CE           : STD_LOGIC;
	signal R_ADD        : STD_LOGIC_VECTOR(x-1 downto 0);
	signal buff_wr_ADD  : STD_LOGIC_VECTOR(x downto 0);
	signal ibuff_rd_ADD : STD_LOGIC_VECTOR(x downto 0);
	signal buff_rd_ADD  : STD_LOGIC_VECTOR(x downto 0);
	signal WINDOW       : STD_LOGIC;
	signal Delay        : STD_LOGIC_VECTOR(3 downto 1);
	signal iSTART       : STD_LOGIC_VECTOR(order+5 downto 1); 

begin


-----------------------------------------------------
-- data buffer --------------------------------------
-----------------------------------------------------

U1 : gh_sram_1wp_2rp
	generic map (
		size_add => x+1,
		size_data => d_size
		)
	port map(
		A_clk => CLK,
		B_clk => CLK,
		WE => sample,
		D =>  D_IN,
		A_add => buff_wr_ADD,
		B_add => buff_rd_ADD,
		B_Q =>  i_data
		);
  
u2 : gh_counter_up_ce generic map (size => x+1)
	port map(
		CLK => CLK,
		rst => rst,
		ce => sample,
		Q => buff_wr_ADD);

U3 : gh_register_ce generic map (size => x+1)
	port map(
		CLK => CLK,
		rst => rst,
		ce => sample,
		D => buff_wr_ADD,
		Q => ibuff_rd_ADD);

	buff_rd_ADD <= ibuff_rd_ADD - R_ADD;
	
---------------------------------------------

U4 : gh_MAC_ld
	generic map(
		size_A => d_size,
		size_B => c_size,
		xbits => xbits)
	port map(
		clk => CLK,
		rst => rst,
		LOAD => iSTART(3),
		CE => WINDOW,
		DA => i_DATA,
		DB => coef_data,
		Q => d_ACC
		);

U5 : gh_shift_reg generic map (size => order+5)	-- was +4
	port map(
		CLK => CLK,
		rst => rst,
		D => sample,
		Q => iSTART
		);
		
-------------------------------------------------
-- hold the output of the MAC's ----------------- 
------ (output of filter)  ----------------------
-------------------------------------------------
		
U6 : gh_register_ce
	generic map (size => d_size+c_size+xbits)
	port map(
		clk => CLK,
		rst => rst,
		CE => iSTART(order+5),
		D => d_ACC,
		Q => id_OUT
		);

	d_OUT <= id_OUT(d_size+c_size+xbits-2 downto c_size-1);

----------------------------------------------------------
------- cycle through the data samples and prom coef  ---- 
-------- R_ADD -> coef/data sample address  --------------
----------------------------------------------------------
	
	CE <= '0' when (R_ADD = max_coef_count) else
	      '1';

u7 : gh_counter_up_sr_ce generic map (size => x) 
	port map(
		CLK => CLK,
		rst => rst,
		srst => sample,
		CE => CE,
		Q => R_ADD);

---------------------------------------------------------------

	ROM_ADD <= R_ADD;
		
--------------------------------------------------
--- control the accumulate in the MAC  -----------
--------------------------------------------------
		
U8 : gh_shift_reg generic map (size => 3)
	port map(
		CLK => CLK,
		rst => rst,
		D => CE,
		Q => DELAY
		);
	
	WINDOW <= DELAY(2) or DELAY(3);
---- CE is delayed by the clock delays of the SRAM/coef_prom
---- CE is is high for 7 clocks, 
---- needs to be stretched by 1 clock
--------------------------------------------------

end a;
