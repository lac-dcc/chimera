---------------------------------------------------------------------
--	Filename:	gh_vme_slave_a32.vhd
--
--			
--	Description:
--		VME bus Slave interface, A32 D32
--              
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	11/22/07  	H LeFevre	Initial revision
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_vme_slave_a32 is
	GENERIC (add_size : integer := 24;
	         BRD_ID   : STD_LOGIC_VECTOR(31 downto 0) :=x"00000000";
	         version  : STD_LOGIC_VECTOR(31 downto 0) :=x"00000000"); 
	port (					
		clk    : in STD_LOGIC;
		RESn   : in STD_LOGIC;
		CRDSn  : in STD_LOGIC;
		WRITEn : in STD_LOGIC;
		IACKn  : in STD_LOGIC;
		ASn    : in STD_LOGIC;
		AM     : in STD_LOGIC_VECTOR(5 downto 0);
		LWORDn : in STD_LOGIC;
		DS0n   : in STD_LOGIC;
		DS1n   : in STD_LOGIC;
		Vadd   : in STD_LOGIC_VECTOR(add_size-1 downto 1);
		LD_IN  : in STD_LOGIC_VECTOR(31 downto 0);
		L_ACK  : in STD_LOGIC; -- local acknowledge, hold low to add wait states
		VD     : inout STD_LOGIC_VECTOR(31 downto 0);
		BRDSLn : out STD_LOGIC;
		rst    : out STD_LOGIC;
		WR     : out STD_LOGIC;
		DTACKn : out STD_LOGIC;
		VD_ENn : out STD_LOGIC;
		VD_DIR : out STD_LOGIC;	
		BE     : out STD_LOGIC_VECTOR(3 downto 0);
		LA     : out STD_LOGIC_VECTOR(add_size-1 downto 2);
		LD_OUT : out STD_LOGIC_VECTOR(31 downto 0));
end entity;

architecture a of gh_vme_slave_a32 is

	constant u_add  : STD_LOGIC_VECTOR(add_size-1 downto 4):=(others => '1'); -- upper address range

	signal irst   : STD_LOGIC;
	signal iCRDSn : STD_LOGIC;
	signal iWR    : STD_LOGIC;
	signal iIACKn : STD_LOGIC;
	signal iLWRDn : STD_LOGIC;
	signal iASn   : STD_LOGIC;
	signal iDS0n  : STD_LOGIC;
	signal iDS1n  : STD_LOGIC;
	signal iADD   : STD_LOGIC_VECTOR(add_size-1 downto 1);
	signal iLADD  : STD_LOGIC_VECTOR(add_size-1 downto 1);
	signal iDIN   : STD_LOGIC_VECTOR(31 downto 0);
	signal iDOUT  : STD_LOGIC_VECTOR(31 downto 0);
	signal iAM    : STD_LOGIC_VECTOR(5 downto 0);
	signal MAM    : STD_LOGIC; -- match AM
	signal iBE    : STD_LOGIC_VECTOR(3 downto 0);
	signal lBE    : STD_LOGIC_VECTOR(3 downto 0);
	
	type StateType is (s0,s1,s2,s3,s4,s5,s6,s7);
	signal state, nstate : StateType;

begin

	irst <= not RESn;
	rst <= irst; 
	BE <= iBE;
	LA <= iLADD(add_size-1 downto 2);
	VD_DIR <= not iWR;
			   
process (clk) -- synchronize VME signals to clock
begin
	if (rising_edge(clk)) then
		iCRDSn <= CRDSn;
		iWR <= not WRITEn;
		iASn <= ASn;
		iDS0n <= DS0n;
		iDS1n <= DS1n;
		iLWRDn <= LWORDn;
		iDIN <= VD;
		iAM <= AM;
		iIACKn <= IACKn;
		iADD <= Vadd;
		if (state = s0) then
			iLADD <= iADD;
		end if;
	end if;		
end process;
	
	MAM <= '0' when (iASn = '1') else  -- match address modifers
	       '1' when (("00" & iAM) = x"0D") else -- extended supervisory data access
	       '1' when (("00" & iAM) = x"09") else -- extended non-privileged data access
	       '0';


--------- state machine --------------------------------

process(state,nstate,iCRDSn,MAM,iDS1n,iDS0n,iIACKn,iADD(1),lBE,L_ACK)
begin
case state is
	when s0 => -- idle
		BRDSLn <= '1'; WR <= '0'; DTACKn <= '1';
		if (iLWRDn = '0') then
			iBE <= x"F";
		elsif ((iDS1n = '0') and (iDS0n = '0') and (iADD(1) = '1')) then
			iBE <= x"3";
		elsif ((iDS1n = '0') and (iDS0n = '0')) then
			iBE <= x"C";
		elsif ((iDS1n = '0') and (iADD(1) = '1')) then
			iBE <= x"2";
		elsif (iDS1n = '0') then
			iBE <= x"8";
		elsif ((iDS0n = '0') and (iADD(1) = '1')) then
			iBE <= x"1";
		elsif (iDS0n = '0') then
			iBE <= x"4";
		else
			iBE <= x"0";
		end if;
	--------------------------------------------
		if ((iCRDSn = '0') and (MAM = '1') and ((iDS1n and iDS0n) = '0') and (iIACKn = '1')) then
			VD_ENn <= '0';
			nstate <= s1; -- VME cycle
		else -- stay in idle state
			VD_ENn <= '1';
			nstate <= s0;
		end if;
	when s1 => 
		iBE <= lBE; BRDSLn <= '0'; WR <= '0'; DTACKn <= '1'; VD_ENn <= '0';
		if (iWR = '1') then -- write cycle
			nstate <= s2;
		else -- read cycle 
			nstate <= s3;
		end if;
	when s2 => -- write cycle
		iBE <= lBE; BRDSLn <= '0'; WR <= '1'; DTACKn <= '1'; VD_ENn <= '0';
		if (L_ACK = '0') then 
			nstate <= s2;
		else
			nstate <= s7;
		end if;
	when s3 => -- read cycle
		iBE <= lBE; BRDSLn <= '0'; WR <= '0'; DTACKn <= '1'; VD_ENn <= '0';
		if (L_ACK = '0') then -- wait for local acknowledge
			nstate <= s3;
		else
			nstate <= s7;
		end if;		
	when s7 => -- generate DTACK
		iBE <= lBE; WR <= '0'; DTACKn <= '0';
		if ((iDS1n and iDS0n) = '1') then -- end of cycle
			BRDSLn <= '1'; VD_ENn <= '1';
			nstate <= s0;
		else -- wait for end
			BRDSLn <= '0'; VD_ENn <= '0';
			nstate <= s7;
		end if;
	when others => 
		iBE <= x"0"; BRDSLn <= '1'; WR <= '0'; DTACKn <= '1'; VD_ENn <= '0';
		nstate <= s0;
end case;
end process;
	
process (clk,irst)
begin
	if (irst = '1') then
		lBE <= x"0";
		state <= s0;
	elsif (rising_edge(clk)) then 
		lBE <= iBE;
		state <= nstate;
	end if;		
end process;

--------- local data write --------------------------

process (clk,irst)
begin
	if (irst = '1') then
		LD_OUT <= (others => '0');
	elsif (rising_edge(clk)) then 
		if (iBE = x"F") then
			LD_OUT(31 downto 24) <= iDIN(31 downto 24);
			LD_OUT(23 downto 16) <= iDIN(23 downto 16);
			LD_OUT(15 downto 8) <= iDIN(15 downto 8);
			LD_OUT(7 downto 0) <= iDIN(7 downto 0);
		else 
			LD_OUT(31 downto 24) <= iDIN(15 downto 8);
			LD_OUT(23 downto 16) <= iDIN(7 downto 0);
			LD_OUT(15 downto 8) <= iDIN(15 downto 8);
			LD_OUT(7 downto 0) <= iDIN(7 downto 0);
		end if;	
	end if;		
end process;

---------- VME Read Data stuff --------------------------------

	iDOUT <= BRD_ID when ((iLADD(add_size-1 downto 2) & "00") = (u_add & x"C")) else
	         version when ((iLADD(add_size-1 downto 2) & "00") = (u_add & x"8")) else 
	         LD_IN;
				 
process (clk,irst)
begin
	if (irst = '1') then
		VD <= (others => 'Z');
	elsif (rising_edge(clk)) then 
		if ((iWR = '1') or ((state = s0) or ((iDS1n and iDS0n) = '1'))) then
			VD <= (others => 'Z');
		elsif (iBE = x"F") then
			VD(31 downto 24) <= iDOUT(31 downto 24);
			VD(23 downto 16) <= iDOUT(23 downto 16);
			VD(15 downto 8) <= iDOUT(15 downto 8);
			VD(7 downto 0) <= iDOUT(7 downto 0);
		elsif (iADD(1) = '1') then 
			VD(31 downto 24) <= x"FF";
			VD(23 downto 16) <= x"FF";
			VD(15 downto 8) <= iDOUT(15 downto 8);
			VD(7 downto 0) <= iDOUT(7 downto 0);
		else 
			VD(31 downto 24) <= x"FF";
			VD(23 downto 16) <= x"FF";
			VD(15 downto 8) <= iDOUT(31 downto 24);
			VD(7 downto 0) <= iDOUT(23 downto 16);
		end if;	
	end if;		
end process;


end architecture;
