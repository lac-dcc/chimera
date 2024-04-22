---------------------------------------------------------------------
--	Filename:	gh_fifo_async_uswf.vhd
--
--			
--	Description:
--		an Asynchronous FIFO - 
--		generics for width, depth - has UART style write flags (full, empty)
--		has "Style #2" gray code address compare
--              
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	05/24/08  	h lefevre	Initial revision
--	1.1     	09/20/08  	hlefevre 	add simulation init
--	        	          	          	  (to '0') to ram data 
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_fifo_async_uswf is
	GENERIC (add_width: INTEGER :=4;
	         data_width: INTEGER :=8 ); -- size of data bus
	port (					
		clk_WR : in STD_LOGIC; -- write clock
		clk_RD : in STD_LOGIC; -- read clock
		rst    : in STD_LOGIC; -- resets counters
		srst   : in STD_LOGIC:='0'; -- resets counters (sync with clk_WR)
		WR     : in STD_LOGIC; -- write control 
		RD     : in STD_LOGIC; -- read control
		D      : in STD_LOGIC_VECTOR (data_width-1 downto 0);
		Q      : out STD_LOGIC_VECTOR (data_width-1 downto 0);
		empty  : out STD_LOGIC; 
		full   : out STD_LOGIC);
end entity;

architecture a of gh_fifo_async_uswf is

component gh_binary2gray IS
	GENERIC (size: INTEGER := 8);
	PORT(	
		B   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		G   : out STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

component gh_gray2binary IS
	GENERIC (size: INTEGER := 8);
	PORT(	
		G   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);	-- gray code in
		B   : out STD_LOGIC_VECTOR(size-1 DOWNTO 0) -- binary value out
		);
end component;

	type ram_mem_type is array (2**add_width-1 downto 0) 
	        of STD_LOGIC_VECTOR (data_width-1 downto 0);
	signal ram_mem : ram_mem_type := (others => (others => '0')); 
	signal iempty        : STD_LOGIC;
	signal diempty       : STD_LOGIC;
	signal ifull         : STD_LOGIC;
	signal add_WR_CE     : std_logic;
	signal add_WR        : std_logic_vector(add_width downto 0); -- 4 bits are used to address MEM
	signal add_WR_GC     : std_logic_vector(add_width downto 0); -- 5 bits are used to compare
	signal iadd_WR_GC    : std_logic_vector(add_width downto 0);
	signal n_add_WR      : std_logic_vector(add_width downto 0); --   for empty, full flags
	signal add_WR_RS     : std_logic_vector(add_width downto 0); -- synced to read clk
	signal add_RD_CE     : std_logic;
	signal add_RD        : std_logic_vector(add_width downto 0);
	signal add_RD_GC     : std_logic_vector(add_width downto 0);
	signal add_RD_GCwc   : std_logic_vector(add_width downto 0);
	signal iadd_RD_GC    : std_logic_vector(add_width downto 0);
	signal iadd_RD_GCwc  : std_logic_vector(add_width downto 0);
	signal iiadd_RD_GCwc : std_logic_vector(add_width downto 0);
	signal n_add_RD      : std_logic_vector(add_width downto 0);
	signal add_RD_WS     : std_logic_vector(add_width downto 0); -- synced to write clk
	signal srst_w        : STD_LOGIC;
	signal isrst_w       : STD_LOGIC;
	signal srst_r        : STD_LOGIC;
	signal isrst_r       : STD_LOGIC;
	signal iWR           : STD_LOGIC;

begin

--------------------------------------------
------- memory -----------------------------
--------------------------------------------

	iWR <= '1' when ((WR = '1') and (ifull = '0')) else '0';

process (clk_WR)
begin			  
	if (rising_edge(clk_WR)) then
		if (iWR = '1') then
			ram_mem(CONV_INTEGER(add_WR(add_width-1 downto 0))) <= D;
		end if;
	end if;		
end process;

process (clk_RD)
begin			  
	if (rising_edge(clk_RD)) then
		Q <= ram_mem(CONV_INTEGER(add_RD(add_width-1 downto 0)));
	end if;		
end process;

-----------------------------------------
----- Write address counter -------------
-----------------------------------------

	add_WR_CE <= '0' when (ifull = '1') else
	             '0' when (WR = '0') else
	             '1';

	n_add_WR <= add_WR + x"1";

U1 : gh_binary2gray
	generic map (size => add_width+1)
	port map(
		B => n_add_WR,
		G => iadd_WR_GC
		);
	
process (clk_WR,rst)
begin 
	if (rst = '1') then
		add_WR <= (others => '0');
		add_RD_WS(add_width downto add_width-1) <= "11"; 
		add_RD_WS(add_width-2 downto 0) <= (others => '0');
		add_WR_GC <= (others => '0');
	elsif (rising_edge(clk_WR)) then
		add_RD_WS <= add_RD_GCwc;
		if (srst_w = '1') then
			add_WR <= (others => '0');
			add_WR_GC <= (others => '0');
		elsif (add_WR_CE = '1') then
			add_WR <= n_add_WR;
			add_WR_GC <= iadd_WR_GC;
		else
			add_WR <= add_WR;
			add_WR_GC <= add_WR_GC;
		end if;
	end if;
end process;

	full <= ifull;

	ifull <= '0' when (iempty = '1') else -- just in case add_RD_WS is reset to "00000"
	         '0' when (add_RD_WS /= add_WR_GC) else ---- instend of "11000"
	         '1';
			 
-----------------------------------------
----- Read address counter --------------
-----------------------------------------


	add_RD_CE <= '0' when (iempty = '1') else
	             '0' when (RD = '0') else
	             '1';
				 
	n_add_RD <= add_RD + x"1";

U2 : gh_binary2gray
	generic map (size => add_width+1)
	port map(
		B => n_add_RD,
		G => iadd_RD_GC -- to be used for empty flag
		);

	iiadd_RD_GCwc <= (not n_add_RD(add_width)) & n_add_RD(add_width-1 downto 0);
		
U3 : gh_binary2gray
	generic map (size => add_width+1)
	port map(
		B => iiadd_RD_GCwc,
		G => iadd_RD_GCwc -- to be used for full flag
		);
		
process (clk_RD,rst)
begin 
	if (rst = '1') then
		add_RD <= (others => '0');	
		add_WR_RS <= (others => '0');
		add_RD_GC <= (others => '0');
		add_RD_GCwc(add_width downto add_width-1) <= "11";
		add_RD_GCwc(add_width-2 downto 0) <= (others => '0');
		diempty <= '1';
	elsif (rising_edge(clk_RD)) then
		add_WR_RS <= add_WR_GC;
		diempty <= iempty;
		if (srst_r = '1') then
			add_RD <= (others => '0');
			add_RD_GC <= (others => '0');
			add_RD_GCwc(add_width downto add_width-1) <= "11";
			add_RD_GCwc(add_width-2 downto 0) <= (others => '0');
		elsif (add_RD_CE = '1') then
			add_RD <= n_add_RD;
			add_RD_GC <= iadd_RD_GC;
			add_RD_GCwc <= iadd_RD_GCwc;
		else
			add_RD <= add_RD; 
			add_RD_GC <= add_RD_GC;
			add_RD_GCwc <= add_RD_GCwc;
		end if;
	end if;
end process;

	empty <= iempty;
 
	iempty <= '1' when (add_WR_RS = add_RD_GC) else
	          '0';
 
----------------------------------
---	sync rest stuff --------------
--- srst is sync with clk_WR -----
--- srst_r is sync with clk_RD ---
----------------------------------

process (clk_WR,rst)
begin 
	if (rst = '1') then
		srst_w <= '0';	
		isrst_r <= '0';	
	elsif (rising_edge(clk_WR)) then
		isrst_r <= srst_r;
		if (srst = '1') then
			srst_w <= '1';
		elsif (isrst_r = '1') then
			srst_w <= '0';
		end if;
	end if;
end process;

process (clk_RD,rst)
begin 
	if (rst = '1') then
		srst_r <= '0';	
		isrst_w <= '0';	
	elsif (rising_edge(clk_RD)) then
		isrst_w <= srst_w;
		if (isrst_w = '1') then
			srst_r <= '1';
		else
			srst_r <= '0';
		end if;
	end if;
end process;

end architecture;
