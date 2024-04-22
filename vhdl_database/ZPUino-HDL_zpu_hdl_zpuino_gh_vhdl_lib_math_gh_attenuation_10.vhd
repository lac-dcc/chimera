-----------------------------------------------------------------------------
--	Filename:	gh_attenuation_10.vhd
--
--	Description:
--		   a digital Attenuator
--		   1/8 dB resolution
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	01/27/07  	SA Dodd 	Initial revision
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_attenuation_10 is
	port (
		CLK   : in std_logic;
		ATTEN : in std_logic_vector(9 downto 0);
		Q     : out std_logic_vector(15 downto 0)
	);
end entity;


architecture a of gh_attenuation_10 is

	signal iADDH :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal iADDL :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal A     :  STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal B     :  STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal iA    :  STD_LOGIC_VECTOR(16 DOWNTO 0);
	signal iB    :  STD_LOGIC_VECTOR(16 DOWNTO 0);
	signal iQ    :  STD_LOGIC_VECTOR(33 DOWNTO 0);
	signal iiQ   :  STD_LOGIC_VECTOR(33 DOWNTO 0);

begin

	iADDH <= "000" & ATTEN(9 downto 5);
	iADDL <= "000" & ATTEN(4 downto 0);

	Q <= iiQ(33 downto 18);
	iiQ <= iQ + x"00020000";
	
PROCESS (CLK)
BEGIN
	if (rising_edge (clk)) then
		iA <= A(16 downto 0);
		iB <= B(16 downto 0);
		iQ <= (iA * iB);
	end if;
END PROCESS;

process(iADDL)
begin
    case (iADDL) is
          when x"00" => A <= x"1FFFF"; 
          when x"01" => A <= x"1F8AE"; 
          when x"02" => A <= x"1F178"; 
          when x"03" => A <= x"1EA5D"; 
          when x"04" => A <= x"1E35B"; 
          when x"05" => A <= x"1DC73"; 
          when x"06" => A <= x"1D5A4"; 
          when x"07" => A <= x"1CEEE"; 
          when x"08" => A <= x"1C851"; 
          when x"09" => A <= x"1C1CC"; 
          when x"0A" => A <= x"1BB5F"; 
          when x"0B" => A <= x"1B509"; 
          when x"0C" => A <= x"1AECB"; 
          when x"0D" => A <= x"1A8A3"; 
          when x"0E" => A <= x"1A292"; 
          when x"0F" => A <= x"19C97"; 
          when x"10" => A <= x"196B1"; 
          when x"11" => A <= x"190E2"; 
          when x"12" => A <= x"18B27"; 
          when x"13" => A <= x"18582"; 
          when x"14" => A <= x"17FF1"; 
          when x"15" => A <= x"17A75"; 
          when x"16" => A <= x"1750D"; 
          when x"17" => A <= x"16FB8"; 
          when x"18" => A <= x"16A77"; 
          when x"19" => A <= x"16549"; 
          when x"1A" => A <= x"1602E"; 
          when x"1B" => A <= x"15B26"; 
          when x"1C" => A <= x"15631"; 
          when x"1D" => A <= x"1514D"; 
          when x"1E" => A <= x"14C7B"; 
          when others => A <= x"147BB"; 
	end case;
end process;

process(iADDH)
begin
    case (iADDH) is
          when x"00" => B <= x"1FFFF"; 
          when x"01" => B <= x"1430C"; 
          when x"02" => B <= x"0CBD4"; 
          when x"03" => B <= x"0809C"; 
          when x"04" => B <= x"05125"; 
          when x"05" => B <= x"03333"; 
          when x"06" => B <= x"0204E"; 
          when x"07" => B <= x"01462"; 
          when x"08" => B <= x"00CDC"; 
          when x"09" => B <= x"0081D"; 
          when x"0A" => B <= x"0051F"; 
          when x"0B" => B <= x"0033B"; 
          when x"0C" => B <= x"0020A"; 
          when x"0D" => B <= x"00149"; 
          when x"0E" => B <= x"000D0"; 
          when x"0F" => B <= x"00083"; 
          when x"10" => B <= x"00053"; 
          when x"11" => B <= x"00034"; 
          when x"12" => B <= x"00021"; 
          when x"13" => B <= x"00015"; 
          when x"14" => B <= x"0000D"; 
          when x"15" => B <= x"00008"; 
          when x"16" => B <= x"00005"; 
          when x"17" => B <= x"00003"; 
          when x"18" => B <= x"00002"; 
          when x"19" => B <= x"00001"; 
		  when x"1A" => B <= x"00001"; 
		  when x"1B" => B <= x"00001"; 
          when others => B <= x"00000"; 
	end case;
end process;

end architecture;
