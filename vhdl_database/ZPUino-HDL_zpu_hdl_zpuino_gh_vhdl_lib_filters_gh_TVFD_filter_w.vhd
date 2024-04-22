---------------------------------------------------------------------
--	Filename:	gh_TVFD_filter_w.vhd
--			
--	Description:
--		Time Varying Fractional Delay Filter 
--		with wide range output (will work past 100%)
--
--	Copyright (c) 2007, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	08/12/07  	S A Dodd 	Initial revision
--	2.0     	12/24/07  	h lefevre	fixed increased range issues
--	2.1     	09/20/08  	hlefevre 	add simulation init
--	        	          	          	  (to '0') to ram data  
--
------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity gh_TVFD_filter_w is  
	GENERIC(
		modulo_bits : INTEGER := 7; -- must have bits to hold modulo_count
		modulo_count : INTEGER := 100;
		x : INTEGER := 3; -- filter order = 2^x
		d_size : INTEGER := 16;	-- size of data path
		c_size : INTEGER := 16	-- size of filter coeff 
		);
	port(
		CLK : in STD_LOGIC;
		rst : in STD_LOGIC;
		START : in STD_LOGIC;
		RATE : in STD_LOGIC_VECTOR(modulo_bits downto 0);
		L_IN : in STD_LOGIC_VECTOR(d_size-1 downto 0);
		R_IN : in STD_LOGIC_VECTOR(d_size-1 downto 0);
		coef_data : in STD_LOGIC_VECTOR(c_size-1 downto 0);
		ND : out STD_LOGIC;
		ROM_ADD : out STD_LOGIC_VECTOR((modulo_bits + x -1) downto 0); 
		L_OUT : out STD_LOGIC_VECTOR(d_size-1 downto 0);
		R_OUT : out STD_LOGIC_VECTOR(d_size-1 downto 0)
		);
end entity;

architecture a of gh_TVFD_filter_w is

function conv_std_logic_vector(i : integer; w : integer) return std_logic_vector is
	variable tmp : std_logic_vector(w-1 downto 0);
	begin
		tmp := STD_LOGIC_VECTOR(conv_unsigned(i, w));
	return(tmp);
end;

---- Component declarations -----

component gh_MAC_ld
	generic(size_A : INTEGER :=16;
	        size_B : INTEGER :=16;
	        xbits : INTEGER :=0);
	port(
		clk  : in STD_LOGIC;
		rst  : in STD_LOGIC;
		LOAD : in STD_LOGIC; -- "clears" old data/starts a new accumulation
		ce   : in STD_LOGIC; --  clock enable
		DA   : in STD_LOGIC_VECTOR(size_A-1 downto 0);
		DB   : in STD_LOGIC_VECTOR(size_B-1 downto 0);
		Q    : out STD_LOGIC_VECTOR(size_A+size_B+xbits-1 downto 0)
		);
end component;

	type ram_mem_type is array (((2**(x+1))-1) downto 0) 
	        of STD_LOGIC_VECTOR (d_size-1 downto 0);
	signal L_mem    : ram_mem_type := (others => (others => '0')); 
	signal R_mem    : ram_mem_type := (others => (others => '0'));
	signal mem_WR   : STD_LOGIC;
	signal emem_WR  : STD_LOGIC; -- added 12/24/07
	signal mem_Wadd : STD_LOGIC_VECTOR(x downto 0);
	signal mem_Radd : STD_LOGIC_VECTOR(x downto 0);
	signal mem_LD   : STD_LOGIC_VECTOR(d_size-1 downto 0);
	signal mem_RD   : STD_LOGIC_VECTOR(d_size-1 downto 0);

	constant ORDER  : INTEGER := 2**x;
	constant S_OFFSET : INTEGER := 8;
	constant max_coef_count : STD_LOGIC_VECTOR(x downto 1) := (others => '1');

	signal oRATE        : STD_LOGIC;
	signal iND          : STD_LOGIC;
	signal diND         : STD_LOGIC_VECTOR(1 downto 0);	-- added 12/24/07
	signal iiND         : STD_LOGIC;
	signal i_L_DATA     : STD_LOGIC_VECTOR(d_size-1 downto 0);
	signal i_R_DATA     : STD_LOGIC_VECTOR(d_size-1 downto 0);
	signal L_ACC        : STD_LOGIC_VECTOR(d_size+c_size-1 downto 0);
	signal R_ACC        : STD_LOGIC_VECTOR(d_size+c_size-1 downto 0);
	signal CE           : STD_LOGIC;
	signal R_ADD        : STD_LOGIC_VECTOR(x-1 downto 0);
	signal buff_wr_ADD  : STD_LOGIC_VECTOR(x downto 0);
	signal ibuff_rd_ADD : STD_LOGIC_VECTOR(x downto 0);
	signal buff_rd_ADD  : STD_LOGIC_VECTOR(x downto 0);
	signal WINDOW       : STD_LOGIC;
	signal Delay        : STD_LOGIC_VECTOR(3 downto 1);
	signal iSTART       : STD_LOGIC_VECTOR(order+S_OFFSET+1 downto 1); -- 12/24/07
	signal iRATE        : STD_LOGIC_VECTOR(modulo_bits downto 0);
	signal iTC          : STD_LOGIC;
	signal filter       : STD_LOGIC_VECTOR(modulo_bits+1 downto 0);
	signal mod_c        : STD_LOGIC_VECTOR(modulo_bits+1 downto 0);
	signal iNQ          : STD_LOGIC_VECTOR(modulo_bits+1 downto 0);
	signal NQ           : STD_LOGIC_VECTOR(modulo_bits+2 downto 0);

begin

	ND <= iND;

-----------------------------------------------------
-- mem for data buffer ------------------------------
-----------------------------------------------------
process (clk)
begin
	if (rising_edge(clk)) then
		emem_WR <= iND;	  -- added 12/24/07
		mem_WR <= emem_WR; -- 12/24/07
		mem_Wadd <= buff_wr_ADD;
		mem_Radd <= buff_rd_ADD;
		mem_LD <= L_IN;
		mem_RD <= R_IN;
		i_L_DATA <= L_mem(CONV_INTEGER(mem_Radd));
		i_R_DATA <= R_mem(CONV_INTEGER(mem_Radd));
		if (mem_WR = '1') then
			L_mem(CONV_INTEGER(mem_Wadd)) <= mem_LD;
			R_mem(CONV_INTEGER(mem_Wadd)) <= mem_RD;
		end if;
	end if;		
end process;

process(CLK,rst)
begin
	if (rst = '1') then
		buff_wr_ADD <= (others => '0');
		ibuff_rd_ADD <= (others => '0');
		diND <= (others => '0'); -- added 12/24/07
	elsif (rising_edge(CLK)) then
		diND <= (diND(0) & iND);  -- added 12/24/07	
		if (iND = '1') then
			buff_wr_ADD <= buff_wr_ADD + "01";
		end if;
		if ((iND = '1') and (diND = "00")) then	-- added 12/24/07
			ibuff_rd_ADD <= buff_wr_ADD; 
		end if;
	end if;
end process;
		
	buff_rd_ADD <= ibuff_rd_ADD - R_ADD;
	
---------------------------------------------

U1 : gh_MAC_ld
	generic map (
		size_A => d_size,
		size_B => c_size
		)	
	port map(
		clk => CLK,
		rst => rst,
		LOAD => iSTART(S_OFFSET-1), 
		CE => WINDOW,
		DA => i_L_DATA,
		DB => coef_data,
		Q => L_ACC
		);

U2 : gh_MAC_ld
	generic map (
		size_A => d_size,
		size_B => c_size
		)
	port map(
		clk => CLK,
		rst => rst,
		LOAD => iSTART(S_OFFSET-1),
		CE => WINDOW,
		DA => i_R_DATA,
		DB => coef_data,
		Q => R_ACC
		);

process(CLK,rst)
begin
	if (rst = '1') then
		iSTART <= (others => '0');
	elsif (rising_edge(CLK)) then
		iSTART(1) <= START;
		iSTART(order+S_OFFSET+1 downto 2) <= iSTART(order+S_OFFSET downto 1); -- 12/24/07
	end if;
end process;

-------------------------------------------------
-- hold the output of the MAC's ----------------- 
------ (output of filter)  ----------------------
-------------------------------------------------

process(CLK,rst)
begin
	if (rst = '1') then
		L_OUT <= (others => '0');
		R_OUT <= (others => '0');
	elsif (rising_edge(CLK)) then
		if (iSTART(order+S_OFFSET+1) = '1') then
			L_OUT <= L_ACC(d_size+c_size-2 downto c_size-1);
			R_OUT <= R_ACC(d_size+c_size-2 downto c_size-1);
		end if;
	end if;
end process;
		
----------------------------------------------------------
------- control the fractional delay --------------------- 
-------- filter -> Fractional Delay  ---------------------
----------------------------------------------------------

	mod_c <= conv_std_logic_vector(modulo_count, modulo_bits+2);
	
	oRATE <= '1' when (("00" & iNQ) >= ('0' & mod_c & '0')) else -- 12/24/07
	         '0';

	iTC <= '0' when (START = '0') else 
	       '0' when (('0' & iNQ) < ('0' & mod_c)) else
	       '1';
	      
	iNQ <= (filter + ("0" & iRATE));

	NQ <= (('0' & iNQ) - (mod_c & '0')) when (('0' & iNQ) >= (mod_c & '0')) else -- 12/24/07
	      ('0' & iNQ) when (('0' & iNQ) < ('0' & mod_c)) else
	      (('0' & iNQ) - ('0' & mod_c));
 		  
PROCESS (CLK,rst)
BEGIN			 
	if (rst = '1') then
		filter <= (others => '0');
		iiND <= '0';
		iRATE <= (others => '0');
	elsif (rising_edge(CLK)) then
		iiND <= iTC;
		if (START = '1') then
			filter <= NQ(modulo_bits+1 downto 0);
		end if;	
		if (('0' & RATE) >  ('0' & mod_c & '0')) then
			iRATE <= (mod_c(modulo_bits-1 downto 0) & '0') - "01";
		else   
			iRATE <= RATE;
		end if;
	end if;
END PROCESS;
		
	iND <= iiND when (oRATE = '0') else
	       (iiND or iSTART(3));	 -- if rate is over 100%, 
	                             -- may need to read two data samples 
		
	ROM_ADD <= (filter(modulo_bits-1 downto 0) & R_ADD);
	
----------------------------------------------------------
------- cycle through the 8 data samples and prom coef  -- 
-------- R_ADD -> coef/data sample address  --------------
----------------------------------------------------------
	
	CE <= '0' when (R_ADD = max_coef_count) else
	      '1';

process(CLK,rst)
begin
	if (rst = '1') then
		DELAY <= (others => '0');
		R_ADD <= (others => '0');
	elsif (rising_edge(CLK)) then
		DELAY(1) <= CE;
		DELAY(3 downto 2) <= DELAY(2 downto 1);
		if (iSTART(S_OFFSET-4) = '1') then
			R_ADD <= (others => '0');
		elsif (CE = '1') then
			R_ADD <= R_ADD + "01";
		end if;
	end if;
end process;
		
	WINDOW <= DELAY(2) or DELAY(3);		

--------------------------------------------------

end a;
