---------------------------------------------------------------------
--	Filename:	gh_TVFD_filter.vhd
--			
--	Description:
--		Time Varying Fractional Delay Filter 
--
--	Copyright (c) 2005, 2006, 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/03/05  	S A Dodd 	Initial revision
--	1.1      	09/11/05  	G Huber  	reduce required clk/start
--	        	          	         	   rario to 8 (order of 
--	        	          	         	   filter) to 1
--	2.0     	09/17/05  	h LeFevre	add gh_ to library parts
--	3.0     	12/17/05  	S A Dodd 	fixed problem so generics will
--	        	          	          	   work with higher order filtes
--	3.1      	02/18/06  	G Huber 	add gh_ to name	- coef prom moved
--	        	          	          	  outside of this file
--	3.2     	08/11/07  	S A Dodd 	fixed problem read address timing
--
------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity gh_TVFD_filter is  
	GENERIC(
		modulo_bits : INTEGER := 7; -- must have bits to hold modulo_count
		modulo_count : INTEGER := 100;
		x : INTEGER := 3 -- filter order = 2^x
		);
	port(
		CLK : in STD_LOGIC;
		rst : in STD_LOGIC;
		START : in STD_LOGIC;
		RATE : in STD_LOGIC_VECTOR(modulo_bits-1 downto 0);
		L_IN : in STD_LOGIC_VECTOR(15 downto 0);
		R_IN : in STD_LOGIC_VECTOR(15 downto 0);
		coef_data : in STD_LOGIC_VECTOR(15 downto 0); -- 02/16/06
		ND : out STD_LOGIC;
		ROM_ADD : out STD_LOGIC_VECTOR((modulo_bits + x -1) downto 0); -- 02/16/06
		L_OUT : out STD_LOGIC_VECTOR(15 downto 0);
		R_OUT : out STD_LOGIC_VECTOR(15 downto 0)
		);
end gh_TVFD_filter;

architecture a of gh_TVFD_filter is

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

component gh_MAC_16bit_ld
	port (
		clk  : in STD_LOGIC;
		rst  : in STD_LOGIC;
		LOAD : in STD_LOGIC;
		ce   : in STD_LOGIC;
		DA   : in STD_LOGIC_VECTOR(15 downto 0);
		DB   : in STD_LOGIC_VECTOR(15 downto 0);
		Q    : out STD_LOGIC_VECTOR(15 downto 0)
		);
end component;

COMPONENT  gh_counter_modulo IS
	GENERIC (size : INTEGER :=7;
	         modulo :INTEGER :=100 );
	port (
		CLK   : IN	STD_LOGIC;
		rst   : IN	STD_LOGIC;
		CE    : IN	STD_LOGIC;
		N     : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q     : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		TC    : OUT STD_LOGIC
		);
END COMPONENT;

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

	signal DIN          : STD_LOGIC_VECTOR(31 downto 0);
	signal DOUT         : STD_LOGIC_VECTOR(31 downto 0);
	signal iND          : STD_LOGIC;
	signal i_L_DATA     : STD_LOGIC_VECTOR(15 downto 0);
	signal i_R_DATA     : STD_LOGIC_VECTOR(15 downto 0);
	signal L_ACC        : STD_LOGIC_VECTOR(15 downto 0);
	signal R_ACC        : STD_LOGIC_VECTOR(15 downto 0);
	signal filter       : STD_LOGIC_VECTOR(modulo_bits-1 downto 0);
	signal CE           : STD_LOGIC;
	signal R_ADD        : STD_LOGIC_VECTOR(x-1 downto 0);
	signal buff_wr_ADD  : STD_LOGIC_VECTOR (x downto 0);
	signal ibuff_rd_ADD : STD_LOGIC_VECTOR (x downto 0);
	signal buff_rd_ADD  : STD_LOGIC_VECTOR (x downto 0);
	signal WINDOW       : STD_LOGIC;
	signal Delay        : STD_LOGIC_VECTOR(3 downto 1);
	signal iSTART       : STD_LOGIC_VECTOR(order+5 downto 1); -- 8/11/07

begin

	ND <= iND;

	DIN(31 downto 16) <= L_IN;
	DIN(15 downto 0) <= R_IN;

-----------------------------------------------------
-- data buffer --------------------------------------
-----------------------------------------------------

U1 : gh_sram_1wp_2rp
	generic map (
		size_add => x+1,
		size_data => 32
		)
	port map(
		A_clk => CLK,
		B_clk => CLK,
		WE => iND,
		D =>  DIN(31 downto 0),
		A_add => buff_wr_ADD,
		B_add => buff_rd_ADD,
		B_Q =>  DOUT(31 downto 0)
		);
  
u2 : gh_counter_up_ce generic map (size => x+1)
	port map(
		CLK => CLK,
		rst => rst,
		ce => iND,
		Q => buff_wr_ADD);

U3 : gh_register_ce generic map (size => x+1)
	port map(
		CLK => CLK,
		rst => rst,
		ce => iND,
		D => buff_wr_ADD,
		Q => ibuff_rd_ADD);

	buff_rd_ADD <= ibuff_rd_ADD - R_ADD;

	i_L_DATA <= DOUT(31 downto 16); 
	i_R_DATA <= DOUT(15 downto 0); 
	
---------------------------------------------

U4 : gh_MAC_16bit_ld
	port map(
		clk => CLK,
		rst => rst,
		LOAD => iSTART(4), -- 8/11/07
		CE => WINDOW,
		DA => i_L_DATA,
		DB => coef_data,
		Q => L_ACC
		);

U5 : gh_MAC_16bit_ld
	port map(
		clk => CLK,
		rst => rst,
		LOAD => iSTART(4), -- 8/11/07
		CE => WINDOW,
		DA => i_R_DATA,
		DB => coef_data,
		Q => R_ACC
		);

U5a : gh_shift_reg generic map (size => order+5) -- 8/11/07
	port map(
		CLK => CLK,
		rst => rst,
		D => START,
		Q => iSTART
		);
		
-------------------------------------------------
-- hold the output of the MAC's ----------------- 
------ (output of filter)  ----------------------
-------------------------------------------------
		
U6 : gh_register_ce
	generic map (size => 16)
	port map(
		clk => CLK,
		rst => rst,
		CE => iSTART(order+5), -- 8/11/07
		D => L_ACC,
		Q => L_OUT
		);

U7 : gh_register_ce
	generic map (size => 16)
	port map(
		clk => CLK,
		rst => rst,
		CE => iSTART(order+5), -- 8/11/07
		D => R_ACC,
		Q => R_OUT
		);

----------------------------------------------------------
------- control the fractional delay --------------------- 
-------- filter -> Fractional Delay  ---------------------
----------------------------------------------------------

u8 : gh_counter_modulo 
	GENERIC map(
		size => modulo_bits, 
		modulo => modulo_count)
	port map(
		CLK => clk,
		rst => rst,
		CE => START,
		N => RATE,
		Q => filter,
		TC => iND);


----------------------------------------------------------
------- cycle through the 8 data samples and prom coef  -- 
-------- R_ADD -> coef/data sample address  --------------
----------------------------------------------------------
	
	CE <= '0' when (R_ADD = max_coef_count) else
	      '1';

u9 : gh_counter_up_sr_ce generic map (size => x) -- 12/17/05
	port map(
		CLK => CLK,
		rst => rst,
		srst => iSTART(1), -- 8/11/07
		CE => CE,
		Q => R_ADD);

---------------------------------------------------------------

	ROM_ADD <= (filter & R_ADD);
		
--------------------------------------------------
--- control the accumulate in the MAC  -----------
--------------------------------------------------
		
U11 : gh_shift_reg generic map (size => 3)
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
