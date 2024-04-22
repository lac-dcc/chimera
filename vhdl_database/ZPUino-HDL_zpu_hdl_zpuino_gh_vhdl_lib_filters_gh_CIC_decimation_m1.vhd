-----------------------------------------------------------------------------
--	Filename:	gh_CIC_decimation_m1.vhd
--
--	Description:
--		CIC Decimation Filter m = 1.
--		
--	Copyright (c) 2005, 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	-------   	-----------
--	1.0      	09/03/05   	h LeFevre 	Initial revision
--	1.1      	02/18/06  	G Huber 	add gh_ to name
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_CIC_decimation_m1 IS
	GENERIC (data_in_size : INTEGER := 16; --
	         data_out_size : INTEGER := 37; --
	         stages : INTEGER := 4; -- listed as N in formula's
	         M : INTEGER := 1);	 -- eather 1 or 2
	PORT(	
		clk      : IN  STD_LOGIC;
		rst      : IN  STD_LOGIC; 
		D        : IN  STD_LOGIC_VECTOR(data_in_size-1 DOWNTO 0);
		ND       : IN  STD_LOGIC; -- New data strobe, 1 clock wide 
		              -- R in formula's is (period of ND)/(period of CLK)
		Q        : OUT STD_LOGIC_VECTOR(data_out_size-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_CIC_decimation_m1 IS

	signal iD :  STD_LOGIC_VECTOR(data_out_size-1 DOWNTO 0);
	
	type d_array_type is array (stages downto 0) of STD_LOGIC_VECTOR(data_out_size-1 downto 0);
	
	signal D_fs  :  d_array_type;
	signal D_fsR  :  d_array_type;
	
	type array_type is array (stages downto 1) of STD_LOGIC_VECTOR(data_out_size-1 downto 0);
	
	signal M1  :  array_type;

BEGIN

-- output data
	Q <= D_fsR(stages);

-- input data
	iD(data_out_size-1 downto data_in_size) <= (others => D(data_in_size-1));
	iD(data_in_size-1 downto 0) <= D;
	
	
--  differentiator (comb) section	

PROCESS (clk, rst)
BEGIN
	if (rst = '1') then 
		D_fsR(0) <= (others => '0');
		for i in 1 to stages loop
			M1(i) <= (others => '0');
			D_fsR(i) <= (others => '0');
		end loop;
	elsif (rising_edge (clk)) then
		D_fsR(0) <= D_fs(stages);
		if (ND = '1') then	-- sets data rate for differentiotion section
			for i in 1 to stages loop
				M1(i) <= D_fsR(i-1);
				D_fsR(i) <= D_fsR(i-1) - M1(i);
			end loop;
		else --  
			M1 <= M1;
			for i in 1 to stages loop
				D_fsR(i) <= D_fsR(i);
			end loop;
		end if;
	end if;
END PROCESS;

           
-- integrator section

PROCESS (clk, rst)
BEGIN
	if (rst = '1') then 
		D_fs(0) <= (others => '0');
		for i in 1 to stages loop
			D_fs(i) <= (others => '0');
		end loop;
	elsif (rising_edge (clk)) then
		D_fs(0) <= iD;
		for i in 1 to stages loop -- integration loop
			D_fs(i) <= D_fs(i-1) + D_fs(i);
		end loop; -----------------------------------
	end if;
END PROCESS;

END a;

