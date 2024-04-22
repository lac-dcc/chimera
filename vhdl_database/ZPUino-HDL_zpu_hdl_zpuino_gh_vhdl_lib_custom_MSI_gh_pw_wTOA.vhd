-----------------------------------------------------------------------------
--	Filename: gh_pw_wTOA.vhd
--
--	Description:
--		This module measures the Pulse width, and provides the TOA 
--		(Time Of Arrival) of a pulse and/or pulse train
--		also, it has a free running counter (used as a timer)
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	07/15/07   	SA Dodd 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

ENTITY gh_pw_wTOA IS
	GENERIC (pw_size: INTEGER :=7;
	         T_size: INTEGER :=7); -- T_size must be >= pw_size
	PORT(
		CLK       : IN STD_LOGIC;
		rst       : IN STD_LOGIC;
		Pulse     : IN STD_LOGIC;
		NEW_PULSE : OUT STD_LOGIC;
		PW        : OUT STD_LOGIC_VECTOR(pw_size-1 DOWNTO 0);
		TOA       : OUT STD_LOGIC_VECTOR(T_size-1 DOWNTO 0);
		TTIME     : OUT STD_LOGIC_VECTOR(T_size-1 DOWNTO 0); -- output of free 
		                                                     -- running counter
		ACTIVE    : OUT STD_LOGIC -- high with pulse, low with no new 
	);                            -- pulse for TTime wrap around
END entity;

ARCHITECTURE a OF gh_pw_wTOA IS 

component gh_edge_det IS
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		D   : in STD_LOGIC;
		re  : out STD_LOGIC; -- rising edge (need sync source at D)
		fe  : out STD_LOGIC; -- falling edge (need sync source at D)
		sre : out STD_LOGIC; -- sync'd rising edge
		sfe : out STD_LOGIC  -- sync'd falling edge
		);
END component;

component gh_register_ce IS
	GENERIC (size: INTEGER := 8);
	PORT(	
		clk : IN		STD_LOGIC;
		rst : IN		STD_LOGIC; 
		CE  : IN		STD_LOGIC; -- clock enable
		D   : IN		STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q   : OUT		STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END component;

component gh_counter_up_ce_ld IS
	GENERIC (size: INTEGER :=8);
	PORT(
		CLK   : IN	STD_LOGIC;
		rst   : IN	STD_LOGIC;
		LOAD  : IN	STD_LOGIC;
		CE    : IN	STD_LOGIC;
		D     : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q     : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
	);
END component;

	signal iTTIME : STD_LOGIC_VECTOR (T_size-1 DOWNTO 0);
	signal iTOA : STD_LOGIC_VECTOR (T_size-1 DOWNTO 0);
	signal C_PW : STD_LOGIC_VECTOR (pw_size-1 DOWNTO 0);
	signal re_Pulse : STD_LOGIC;
	signal fe_Pulse : STD_LOGIC;
	signal PW_CE : STD_LOGIC;
	signal iACTIVE : STD_LOGIC;
	signal iNEW_PULSE : STD_LOGIC;
	signal VGND : STD_LOGIC_VECTOR (pw_size-1 DOWNTO 0);
	
	
BEGIN

----------------------------------
-------- output buffers ----------

	ACTIVE <= iACTIVE;
	TTIME <= iTTIME;
	
----------------------------------
----------------------------------

	VGND <= (others => '0');

process(CLK,rst)
begin
	if (rst = '1') then
		iTTIME <= (others => '0');
	elsif (rising_edge(CLK)) then
		iTTIME <= iTTIME + "01";
	end if;
end process;

	U1 :  gh_edge_det port map (CLK,rst,Pulse,open,open,re_Pulse,fe_Pulse);
	
	U2 :  gh_register_ce generic map (size => T_size)
	             port map (CLK,rst,re_Pulse,iTTIME,iTOA);

process(CLK,rst)
begin
	if (rst = '1') then
		PW_CE <= '0';
	elsif (rising_edge(CLK)) then
		if (re_Pulse = '1') then
			PW_CE <= '1';
		elsif (fe_Pulse = '1') then
			PW_CE <= '0';
		else
			PW_CE <= PW_CE;
		end if;
	end if;
end process;
				 
	U3 :  gh_counter_up_ce_ld generic map (size => pw_size)
	              port map (CLK,rst,iNEW_PULSE,PW_CE,VGND,C_PW);

-- U4, U5 and U6 time aline TOA, PW and NEW_PULSE
				  
	U4 :  gh_edge_det port map (CLK,rst,fe_Pulse,open,open,iNEW_PULSE,NEW_PULSE);


	U5 :  gh_register_ce generic map (size => pw_size)
	             port map (CLK,rst,iNEW_PULSE,C_PW,PW);

	U6 :  gh_register_ce generic map (size => T_size)
	             port map (CLK,rst,iNEW_PULSE,iTOA,TOA);


process(CLK,rst)
begin
	if (rst = '1') then
		iACTIVE <= '0';
	elsif (rising_edge(CLK)) then
		if (iNEW_PULSE = '1') then
			iACTIVE <= '1';
		elsif (iTTIME = iTOA) then
			iACTIVE <= '0';
		else
			iACTIVE <= iACTIVE;
		end if;
	end if;
end process;

END a;
