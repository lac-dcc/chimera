-----------------------------------------------------------------------------
--	Filename:	gh_PWM.vhd
--
--	Description:
--
--	Copyright (c) 2009 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	02/28/09  	h lefevre	Initial revision
--
-----------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_PWM is
	generic(size : INTEGER := 8);
	port(
		clk      : in STD_LOGIC;
		rst      : in STD_LOGIC;
		d_format : in STD_LOGIC:='0'; -- '0' = two's comp   '1' = offset binary
		DATA     : in STD_LOGIC_VECTOR(size-1 downto 0);
		PWMo     : out STD_LOGIC;
		ND       : out STD_LOGIC -- New Data sample strobe
		);
end entity;

architecture a of gh_PWM is

	constant TC_C : STD_LOGIC_VECTOR (size-1 downto 0):=(others => '1');

	signal iSum   : STD_LOGIC_VECTOR (size DOWNTO 0);
	signal bDATA  : STD_LOGIC_VECTOR (size-1 downto 0);
	signal icount : STD_LOGIC_VECTOR (size-1 downto 0);
	signal idata  : STD_LOGIC_VECTOR (size-1 downto 0);
	signal TC     : STD_LOGIC;

begin

	----------- data format selection ----------------------------
	bDATA(size-1) <= (not DATA(size-1)) when (d_format = '0') else
	                  DATA(size-1);
	bDATA(size-2 downto 0) <= DATA(size-2 downto 0);
	--------------------------------------------------------------

	PWMo <= iSum(size);
	
	TC <= '1' when (icount = TC_C) else
	      '0';


		
PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		iSum <= (others =>'0');
		idata <= (others =>'0');
		icount <= (others =>'0');
		ND <= '0';
	elsif (rising_edge (clk)) then
		iSum <= ('0' & icount) + ('0' & idata);
		icount <= icount + "01";
		ND <= TC;
		if (TC = '1') then
			idata <= bDATA;
		end if;
	end if;
END PROCESS;

end architecture;
