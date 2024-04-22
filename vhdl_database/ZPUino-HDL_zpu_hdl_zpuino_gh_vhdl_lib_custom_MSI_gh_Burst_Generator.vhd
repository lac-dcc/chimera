-----------------------------------------------------------------------------
--	Filename:	gh_Burst_Generator.vhd
--
--	Description:
--		A Birst Generator
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	10/04/08  	hlefevre 	Initial revision
--
-----------------------------------------------------------------------------

library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;
							 
entity gh_Burst_Generator is
	GENERIC(size_Period: INTEGER := 16;
	        size_pcount: INTEGER := 8); 
	port(
		clk         : in std_logic; 
		rst         : in std_logic;
		Period      : in std_logic_vector (size_Period-1 downto 0);
		Pulse_Width : in std_logic_vector (size_Period-1 downto 0);
		P_Count     : in std_logic_vector (size_pcount-1 downto 0);
		trigger     : in std_logic;
		Pulse       : out std_logic;
		busy        : out std_logic 
		);
end entity;

architecture a of gh_Burst_Generator is

COMPONENT gh_counter_down_ce_ld is
	GENERIC (size: INTEGER :=8);
	PORT(
		CLK   : IN	STD_LOGIC;
		rst   : IN	STD_LOGIC;
		LOAD  : IN	STD_LOGIC;
		CE    : IN	STD_LOGIC;
		D     : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q     : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END COMPONENT;

	signal p_trigger      : std_logic;
	signal LD_Period      : std_logic;
	signal Period_Count   : std_logic_vector(size_Period-1 downto 0);
	signal Width_Count    : std_logic_vector(size_Period-1 downto 0);
	signal sPeriod        : std_logic_vector(size_Period-1 downto 0);
	signal pcount         : std_logic_vector(size_pcount-1 downto 0);
	
	signal LD_width       : std_logic;
	signal E_width        : std_logic;
	signal CE_pcount      : std_logic;
	
	signal Period_cmp     : std_logic_vector(size_Period-1 downto 0);
	constant Width_cmp    : std_logic_vector(size_Period-1 downto 0):=(others => '0');
	constant pcount_cmp   : std_logic_vector(size_pcount-1 downto 0):=(others => '0');
	
begin

-- constant compare values  -----------------------------------
	Period_cmp(size_Period-1 downto 1) <= (others =>'0');
	Period_cmp(0) <= '1';
--	Width_cmp <= (others => '0');
--	pcount_cmp <= (others => '0');
---------------------------------------------------------------

process(clk,rst)
begin
	if (rst = '1') then
		busy <= '0';
	elsif (rising_edge(clk)) then
--		if (trigger = '1') then
--			busy <= '1';
--		elsif ((E_width = '0') and (CE_pcount = '0')) then
		if (pCount > pcount_cmp) then
			busy <= '1';
		elsif (Width_Count > Width_cmp) then
			busy <= '1';
		else
			busy <= '0';
		end if;
	end if;
end process;
	
U1 : gh_counter_down_ce_ld 
	Generic Map(size_Period) 
	PORT MAP(
		clk => clk,
		rst => rst,
		LOAD => LD_Period,
		CE => CE_pcount,  
		D => sPeriod,
		Q => Period_Count
		);
		
	sPeriod <= Period when (trigger = '0') else
	           Width_cmp;
		
	LD_Period <= p_trigger or (not CE_pcount);
	
	p_trigger <= '1' when (Period_Count > Period) else
	             '1' when (Period_Count = Period_cmp) else
	             '0';
		
-----------------------------------------------------------
			   
U2 : gh_counter_down_ce_ld 
	Generic Map(size_Period) 
	PORT MAP(
		clk => clk,
		rst => rst,
		LOAD => LD_width,
		CE => E_width,  
		D => Pulse_Width,
		Q => Width_Count
		);

	LD_width <= p_trigger; 
	
	E_width <= '0' when (Width_Count = Width_cmp) else
	           '1';
	
	Pulse <= E_width;

--------------------------------------------------------
	
U3 : gh_counter_down_ce_ld 
	Generic Map(size_pcount) 
	PORT MAP(
		clk => clk,
		rst => rst,
		LOAD => trigger,
		CE => p_trigger,  
		D => P_Count,
		Q => pCount
		);

	CE_pcount <= '0' when (pCount = pcount_cmp) else
	             '1';
		
end architecture;

