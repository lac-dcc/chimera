-----------------------------------------------------------------------------
--	Filename:	gh_fir_pfilter_ot.vhd
--
--	Description:
--		A symmetrical, parallel FIR Filter
--		uses 1/2 order number of multipliers, odd number of taps
--
--	Copyright (c) 2007, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	02/10/07  	h lefevre	Initial revision
--	1.1     	11/09/08  	h lefevre	fix note
--	
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
use IEEE.std_logic_signed.all;

ENTITY gh_fir_pfilter_ot IS  
	GENERIC(
		d_size: INTEGER := 16;
		coef_size: INTEGER := 16;
		fract_bits: INTEGER := 4;
		half_tap_size: INTEGER := 8);
	PORT(
		clk  : IN  STD_LOGIC;
		rst  : in STD_LOGIC:='0';
		ce   : in STD_LOGIC:='1';
		D    : IN  STD_LOGIC_VECTOR (d_size-1 downto 0);
		COEF : IN  STD_LOGIC_VECTOR (coef_size * (half_tap_size +1) -1 downto 0);
		Q    : OUT STD_LOGIC_VECTOR (d_size-1 downto 0)
		);
END entity;

ARCHITECTURE a OF gh_fir_pfilter_ot IS	  

	constant P_size : INTEGER := d_size + coef_size;
	constant Reg_size : INTEGER := d_size + fract_bits;	
	
	constant zero : STD_LOGIC_VECTOR(d_size-3 downto 0) := (others => '0');
	constant ones : STD_LOGIC_VECTOR(d_size-2 downto 0) := (others => '1');
	
	constant max_pos : STD_LOGIC_VECTOR(d_size-1 downto 0) := '0' & ones;
	constant max_neg : STD_LOGIC_VECTOR(d_size-1 downto 0) := '1' & zero & '1';

	type filter_array is array (half_tap_size * 2 +1 downto 0) 
	                  of STD_LOGIC_VECTOR(Reg_size downto 0);
	SIGNAL  Reg :  filter_array; -- Intermediate values
	
	type P_array is array (half_tap_size+1 downto 1) 
	                  of STD_LOGIC_VECTOR(P_size-1 downto 0);

	SIGNAL  P :  P_array; -- Intermediate values
	
	SIGNAL  iD : STD_LOGIC_VECTOR (d_size-1 downto 0);
	
BEGIN 
 
-- outputs
	Q <= max_pos when (Reg(half_tap_size * 2 +1)(Reg_size downto Reg_size-1) = "01") else
	     max_neg when (Reg(half_tap_size * 2 +1)(Reg_size downto Reg_size-1) = "10") else
	     Reg(half_tap_size * 2 +1)(Reg_size-1 downto fract_bits);
-------------------------------------

PROCESS (clk,rst) 
BEGIN 	
	if (rst = '1') then
		iD <= (others => '0');
		for i in 0 to ((half_tap_size * 2) +1) loop
			Reg(i) <= (others => '0'); -- Reg(0) is always zero
		end loop;
		for j in 1 to (half_tap_size +1) loop
			P(j) <= (others => '0');
		end loop;
	elsif (rising_edge(clk)) THEN
		iD <= D;
		Reg(0) <= (others => '0'); -- Reg(0) is always zero
		if (ce = '0') then
			P <= P;
			Reg <= Reg;
		else
			-- iteration loop
			P(half_tap_size+1) <= iD * COEF((coef_size * (half_tap_size +1)) -1 
			        downto (coef_size * (half_tap_size +1) - coef_size));
			Reg(half_tap_size+1) <= Reg(half_tap_size) 
			        + P(half_tap_size+1)(P_size-2 downto P_size-Reg_size-1);
			for k in 1 to half_tap_size loop	
				P(k) <= iD * COEF(coef_size * k -1 downto coef_size * k - coef_size);
				Reg(k) <= Reg(k-1) + P(k)(P_size-2 downto P_size-Reg_size-1);
				Reg(k + half_tap_size +1) <= Reg(k + half_tap_size) 
				      + P(half_tap_size +1 -k)(P_size-2 downto P_size-Reg_size-1);
 			end loop; 
		end if;
	end if;
END PROCESS;

END a;
