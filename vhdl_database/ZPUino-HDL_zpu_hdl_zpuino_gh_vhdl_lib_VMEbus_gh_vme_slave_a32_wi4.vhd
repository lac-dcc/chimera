---------------------------------------------------------------------
--	Filename:	gh_vme_slave_a32_wi4.vhd
--
--			
--	Description:
--		VME bus Slave interface, A32 D32 with 4 interrupts 
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

entity gh_vme_slave_a32_wi4 is
	GENERIC (add_size : integer := 24;
	         BRD_ID   : STD_LOGIC_VECTOR(31 downto 0) :=x"00000000";
	         version  : STD_LOGIC_VECTOR(31 downto 0) :=x"00000000"); 
	port (					
		clk       : in STD_LOGIC;
		RESn      : in STD_LOGIC;
		CRDSn     : in STD_LOGIC;
		WRITEn    : in STD_LOGIC;
		IACKn     : in STD_LOGIC;
		IACK_INn  : in STD_LOGIC;
		ASn       : in STD_LOGIC;
		AM        : in STD_LOGIC_VECTOR(5 downto 0);
		LWORDn    : in STD_LOGIC;
		DS0n      : in STD_LOGIC;
		DS1n      : in STD_LOGIC;
		Vadd      : in STD_LOGIC_VECTOR(add_size-1 downto 1);
		LD_IN     : in STD_LOGIC_VECTOR(31 downto 0);
		L_ACK     : in STD_LOGIC; -- local acknowledge, hold low to add wait states
		g_IRQA    : in STD_LOGIC;
		IRQ_LA    : in STD_LOGIC_VECTOR(2 downto 0);
		IRQ_VA    : in STD_LOGIC_VECTOR(7 downto 0);
		g_IRQB    : in STD_LOGIC;
		IRQ_LB    : in STD_LOGIC_VECTOR(2 downto 0);
		IRQ_VB    : in STD_LOGIC_VECTOR(7 downto 0);
		g_IRQC    : in STD_LOGIC;
		IRQ_LC    : in STD_LOGIC_VECTOR(2 downto 0);
		IRQ_VC    : in STD_LOGIC_VECTOR(7 downto 0);
		g_IRQD    : in STD_LOGIC;
		IRQ_LD    : in STD_LOGIC_VECTOR(2 downto 0);
		IRQ_VD    : in STD_LOGIC_VECTOR(7 downto 0);
		VD        : inout STD_LOGIC_VECTOR(31 downto 0);
		BRDSLn    : out STD_LOGIC;
		rst       : out STD_LOGIC;
		WR        : out STD_LOGIC;
		DTACKn    : out STD_LOGIC;
		VD_ENn    : out STD_LOGIC;
		VD_DIR    : out STD_LOGIC;
		IACK_OUTn : out STD_LOGIC;
		IRQn      : out STD_LOGIC_VECTOR(6 downto 1);
		BE        : out STD_LOGIC_VECTOR(3 downto 0);
		LA        : out STD_LOGIC_VECTOR(add_size-1 downto 2);
		LD_OUT    : out STD_LOGIC_VECTOR(31 downto 0));
end entity;

architecture a of gh_vme_slave_a32_wi4 is

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
	
	signal iIRQ      : STD_LOGIC_VECTOR(6 downto 1);
	signal iIACK_INn : STD_LOGIC;
	signal diIACKn   : STD_LOGIC;
	signal IRQ_MATCH : STD_LOGIC;
	signal ACT_IRQ   : STD_LOGIC;
	signal IRQ_ACK   : STD_LOGIC_VECTOR(2 downto 0);
	signal iIVEC     : STD_LOGIC_VECTOR(31 downto 0);
	signal state_IACK, nstate_IACK : StateType;
	
	signal iIRQA     : STD_LOGIC_VECTOR(1 downto 0);	
	signal state_irqA, nstate_irqA : StateType;
	signal iIRQB     : STD_LOGIC_VECTOR(1 downto 0);	
	signal state_irqB, nstate_irqB : StateType;
	signal iIRQC     : STD_LOGIC_VECTOR(1 downto 0);	
	signal state_irqC, nstate_irqC : StateType;
	signal iIRQD     : STD_LOGIC_VECTOR(1 downto 0);	
	signal state_irqD, nstate_irqD : StateType;

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
		diIACKn <= iIACKn;
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
		elsif ((iDS0n = '0') and (iIACK_INn = '0') and ((IRQ_MATCH and ACT_IRQ) = '1')) then
			VD_ENn <= '0';
			nstate <= s5; -- interrupt cycle
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
	when s5 => -- interrupt cycle
		iBE <= x"F"; BRDSLn <= '1'; WR <= '0'; DTACKn <= '1'; VD_ENn <= '0';
		nstate <= s6;
	when s6 => -- interrupt cycle (wait state)
		iBE <= x"F"; BRDSLn <= '1'; WR <= '0'; DTACKn <= '1'; VD_ENn <= '0';
		nstate <= s7;
	when s7 => -- generate DTACK
		iBE <= lBE; WR <= '0'; DTACKn <= '0';
		if ((iDS1n and iDS0n) = '1') then -- end of cycle
			BRDSLn <= '1'; VD_ENn <= '1';
			nstate <= s0;
		else -- wait for end
			BRDSLn <= (not iIACKn); VD_ENn <= '0';
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
		if ((iDS0n = '0') and (iIACK_INn = '0') and ((IRQ_MATCH and ACT_IRQ) = '1')) then
			VD <= iIVEC;
		elsif ((iWR = '1') or ((state = s0) or ((iDS1n and iDS0n) = '1'))) then
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

----------------------------------------------------------------

	ACT_IRQ <= '1' when (state_irqA = s1) else
	           '1' when (state_irqB = s1) else
	           '1' when (state_irqC = s1) else
	           '1' when (state_irqD = s1) else
	           '0';
 
	iIVEC <= (x"FFFFFF" & IRQ_VA) when (IRQ_ACK <= "001") else
	         (x"FFFFFF" & IRQ_VB) when (IRQ_ACK <= "010") else
	         (x"FFFFFF" & IRQ_VC) when (IRQ_ACK <= "011") else
	         (x"FFFFFF" & IRQ_VD) when (IRQ_ACK <= "100") else
	          x"FFFFFFFF";

	IRQ_MATCH <= '1' when ((iADD(3 downto 1) = IRQ_LA) and (state_irqA = s1)) else
	             '1' when ((iADD(3 downto 1) = IRQ_LB) and (state_irqB = s1)) else
	             '1' when ((iADD(3 downto 1) = IRQ_LC) and (state_irqC = s1)) else
	             '1' when ((iADD(3 downto 1) = IRQ_LD) and (state_irqD = s1)) else
	             '0';
			  
process(state_IACK,nstate_IACK,iIACKn,iIACK_INn,ACT_IRQ)
begin
case state_IACK is
	when s0 => -- idle 
		IACK_OUTn <= '1';
		if ((iIACKn or iIACK_INn) = '1') then
			nstate_IACK <= s0;
		elsif ((ACT_IRQ = '0') or (IRQ_MATCH = '0')) then 
			nstate_IACK <= s1;
		else
			nstate_IACK <= s2;
		end if;
	when s1 => 
		IACK_OUTn <= iIACK_INn;	
		if (iIACK_INn = '1') then 
			nstate_IACK <= s0;
		else -- 
			nstate_IACK <= s1;
		end if;
	when s2 => 
		IACK_OUTn <= '1';
		if (iDS0n = '0') then 
			nstate_IACK <= s2;
		else
			nstate_IACK <= s0;
		end if;
	when others =>
		IACK_OUTn <= '1';
		nstate_IACK <= s0;
end case;
end process;

process (clk,irst)
begin
	if (irst = '1') then
		IRQ_ACK <= (others => '0');
		iIACK_INn <= '1';
		state_IACK <= s0;
	elsif (rising_edge(clk)) then 
		iIACK_INn <= IACK_INn;
		state_IACK <= nstate_IACK;
		if (iIACKn = '1') then
			IRQ_ACK <= (others => '0');
		elsif (diIACKn = '1') then
			if ((iADD(3 downto 1) = IRQ_LA) and (state_irqA = s1)) then
				IRQ_ACK <= "001";
			elsif ((iADD(3 downto 1) = IRQ_LB) and (state_irqB = s1)) then
				IRQ_ACK <= "010";
			elsif ((iADD(3 downto 1) = IRQ_LC) and (state_irqC = s1)) then
				IRQ_ACK <= "011";
			elsif ((iADD(3 downto 1) = IRQ_LD) and (state_irqD = s1)) then
				IRQ_ACK <= "100";
			end if;
		else
			IRQ_ACK <= IRQ_ACK;
		end if;
	end if;		
end process;

----------------------------------------------------------------

	IRQn <= (not iIRQ);

	iIRQ(1) <= '1' when ((state_irqA = s1) and (IRQ_LA = "001")) else
	           '1' when ((state_irqB = s1) and (IRQ_LB = "001")) else
	           '1' when ((state_irqC = s1) and (IRQ_LC = "001")) else
	           '1' when ((state_irqD = s1) and (IRQ_LD = "001")) else
	           '0';

	iIRQ(2) <= '1' when ((state_irqA = s1) and (IRQ_LA = "010")) else
	           '1' when ((state_irqB = s1) and (IRQ_LB = "010")) else
	           '1' when ((state_irqC = s1) and (IRQ_LC = "010")) else
	           '1' when ((state_irqD = s1) and (IRQ_LD = "010")) else
	           '0';

	iIRQ(3) <= '1' when ((state_irqA = s1) and (IRQ_LA = "011")) else
	           '1' when ((state_irqB = s1) and (IRQ_LB = "011")) else
	           '1' when ((state_irqC = s1) and (IRQ_LC = "011")) else
	           '1' when ((state_irqD = s1) and (IRQ_LD = "011")) else
	           '0';

	iIRQ(4) <= '1' when ((state_irqA = s1) and (IRQ_LA = "100")) else
	           '1' when ((state_irqB = s1) and (IRQ_LB = "100")) else
	           '1' when ((state_irqC = s1) and (IRQ_LC = "100")) else
	           '1' when ((state_irqD = s1) and (IRQ_LD = "100")) else
	           '0';

	iIRQ(5) <= '1' when ((state_irqA = s1) and (IRQ_LA = "101")) else
	           '1' when ((state_irqB = s1) and (IRQ_LB = "101")) else
	           '1' when ((state_irqC = s1) and (IRQ_LC = "101")) else
	           '1' when ((state_irqD = s1) and (IRQ_LD = "101")) else
	           '0';

	iIRQ(6) <= '1' when ((state_irqA = s1) and (IRQ_LA = "110")) else
	           '1' when ((state_irqB = s1) and (IRQ_LB = "110")) else
	           '1' when ((state_irqC = s1) and (IRQ_LC = "110")) else
	           '1' when ((state_irqD = s1) and (IRQ_LD = "110")) else
	           '0';

----------------------------------------------------------------
-----------  IRQ A ---------------------------------------------

process(state_irqA,nstate_irqA,iIRQA,state_IACK,state,IRQ_ACK,iDS0n)
begin
case state_irqA is
	when s0 => -- idle
		if (iIRQA = x"01") then
			nstate_irqA <= s1;
		else
			nstate_irqA <= s0;
		end if;
	when s1 =>
		if (state_IACK = s0) then 
			nstate_irqA <= s1;
		elsif ((state = s7) and (IRQ_ACK = "001") and (iDS0n = '1')) then 
			nstate_irqA <= s0;
		else
			nstate_irqA <= s1;
		end if;
	when others =>
		nstate_irqA <= s0;
end case;
end process;

process (clk,irst)
begin
	if (irst = '1') then
		iIRQA <= (others => '0');
		state_irqA <= s0;
	elsif (rising_edge(clk)) then
		iIRQA(0) <= g_IRQA;
		iIRQA(1) <= iIRQA(0);
		if (IRQ_LA = "000") then
			state_irqA <= s0;
		else
			state_irqA <= nstate_irqA;
		end if;
	end if;		
end process;

----------------------------------------------------------------
-----------  IRQ B ---------------------------------------------

process(state_irqB,nstate_irqB,iIRQB,state_IACK,state,IRQ_ACK,iDS0n)
begin
case state_irqB is
	when s0 => -- idle
		if (iIRQB = x"01") then
			nstate_irqB <= s1;
		else
			nstate_irqB <= s0;
		end if;
	when s1 =>
		if (state_IACK = s0) then 
			nstate_irqB <= s1;
		elsif ((state = s7) and (IRQ_ACK = "010") and (iDS0n = '1')) then 
			nstate_irqB <= s0;
		else
			nstate_irqB <= s1;
		end if;
	when others =>
		nstate_irqB <= s0;
end case;
end process;

process (clk,irst)
begin
	if (irst = '1') then
		iIRQB <= (others => '0');
		state_irqB <= s0;
	elsif (rising_edge(clk)) then
		iIRQB(0) <= g_IRQB;
		iIRQB(1) <= iIRQB(0);
		if (IRQ_LB = "000") then
			state_irqB <= s0;
		else
			state_irqB <= nstate_irqB;
		end if;
	end if;		
end process;

----------------------------------------------------------------
-----------  IRQ C ---------------------------------------------

process(state_irqC,nstate_irqC,iIRQC,state_IACK,state,IRQ_ACK,iDS0n)
begin
case state_irqC is
	when s0 => -- idle
		if (iIRQC = x"01") then
			nstate_irqC <= s1;
		else
			nstate_irqC <= s0;
		end if;
	when s1 =>
		if (state_IACK = s0) then 
			nstate_irqC <= s1;
		elsif ((state = s7) and (IRQ_ACK = "011") and (iDS0n = '1')) then 
			nstate_irqC <= s0;
		else
			nstate_irqC <= s1;
		end if;
	when others =>
		nstate_irqC <= s0;
end case;
end process;

process (clk,irst)
begin
	if (irst = '1') then
		iIRQC <= (others => '0');
		state_irqC <= s0;
	elsif (rising_edge(clk)) then
		iIRQC(0) <= g_IRQC;
		iIRQC(1) <= iIRQC(0);
		if (IRQ_LC = "000") then
			state_irqC <= s0;
		else
			state_irqC <= nstate_irqC;
		end if;
	end if;		
end process;

----------------------------------------------------------------
-----------  IRQ D ---------------------------------------------

process(state_irqD,nstate_irqD,iIRQD,state_IACK,state,IRQ_ACK,iDS0n)
begin
case state_irqD is
	when s0 => -- idle
		if (iIRQD = x"01") then
			nstate_irqD <= s1;
		else
			nstate_irqD <= s0;
		end if;
	when s1 =>
		if (state_IACK = s0) then 
			nstate_irqD <= s1;
		elsif ((state = s7) and (IRQ_ACK = "100") and (iDS0n = '1')) then 
			nstate_irqD <= s0;
		else
			nstate_irqD <= s1;
		end if;
	when others =>
		nstate_irqD <= s0;
end case;
end process;

process (clk,irst)
begin
	if (irst = '1') then
		iIRQD <= (others => '0');
		state_irqD <= s0;
	elsif (rising_edge(clk)) then
		iIRQD(0) <= g_IRQD;
		iIRQD(1) <= iIRQD(0);
		if (IRQ_LD = "000") then
			state_irqD <= s0;
		else
			state_irqD <= nstate_irqD;
		end if;
	end if;		
end process;

-------------------------------------------------

end architecture;
