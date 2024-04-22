---------------------------------------------------------------------
--	Filename:	gh_vme_cs20w_20a.vhd
--
--			
--	Description:
--		chip select block for use with gh_vme_slave module
--		20 chip select outputs, uses 20 bits address space for word (2 byte) decode
--              
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	11/11/07  	H LeFevre	Initial revision
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_vme_cs20w_20a is
	GENERIC (
		CS0min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS0max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS1min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS1max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS2min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS2max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS3min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS3max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS4min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS4max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS5min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS5max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS6min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS6max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS7min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS7max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS8min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS8max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS9min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS9max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS10min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS10max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS11min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS11max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS12min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS12max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS13min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS13max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS14min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS14max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS15min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS15max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS16min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS16max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS17min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS17max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS18min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS18max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS19min : STD_LOGIC_VECTOR(19 downto 0) :=x"00000";
		CS19max : STD_LOGIC_VECTOR(19 downto 0) :=x"00000"); 
	port (
		CRDSn  : in STD_LOGIC;
		Ladd   : in STD_LOGIC_VECTOR(19 downto 1);
		CSn    : out STD_LOGIC_VECTOR(19 downto 0));
end entity;

architecture a of gh_vme_cs20w_20a is

	signal iCS   : STD_LOGIC_VECTOR(19 downto 0);


begin

	CSn <= (not iCS);

	iCS(0) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS0min(19 downto 1)) and (Ladd <= CS0max(19 downto 1))) else
	          '0';

 	iCS(1) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS1min(19 downto 1)) and (Ladd <= CS1max(19 downto 1))) else
	          '0';

	iCS(2) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS2min(19 downto 1)) and (Ladd <= CS2max(19 downto 1))) else
	          '0';

	iCS(3) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS3min(19 downto 1)) and (Ladd <= CS3max(19 downto 1))) else
	          '0';

	iCS(4) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS4min(19 downto 1)) and (Ladd <= CS4max(19 downto 1))) else
	          '0';

	iCS(5) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS5min(19 downto 1)) and (Ladd <= CS5max(19 downto 1))) else
	          '0';

 	iCS(6) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS6min(19 downto 1)) and (Ladd <= CS6max(19 downto 1))) else
	          '0';

	iCS(7) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS7min(19 downto 1)) and (Ladd <= CS7max(19 downto 1))) else
	          '0';

	iCS(8) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS8min(19 downto 1)) and (Ladd <= CS8max(19 downto 1))) else
	          '0';

	iCS(9) <= '0' when (CRDSn = '1') else
	          '1' when ((Ladd >= CS9min(19 downto 1)) and (Ladd <= CS9max(19 downto 1))) else
	          '0';			  

	iCS(10) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS10min(19 downto 1)) and (Ladd <= CS10max(19 downto 1))) else
	           '0';

 	iCS(11) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS11min(19 downto 1)) and (Ladd <= CS11max(19 downto 1))) else
	           '0';

	iCS(12) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS12min(19 downto 1)) and (Ladd <= CS12max(19 downto 1))) else
	           '0';

	iCS(13) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS13min(19 downto 1)) and (Ladd <= CS13max(19 downto 1))) else
	           '0';

	iCS(14) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS14min(19 downto 1)) and (Ladd <= CS14max(19 downto 1))) else
	           '0';

	iCS(15) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS15min(19 downto 1)) and (Ladd <= CS15max(19 downto 1))) else
	           '0';

 	iCS(16) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS16min(19 downto 1)) and (Ladd <= CS16max(19 downto 1))) else
	           '0';

	iCS(17) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS17min(19 downto 1)) and (Ladd <= CS17max(19 downto 1))) else
	           '0';

	iCS(18) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS18min(19 downto 1)) and (Ladd <= CS18max(19 downto 1))) else
	           '0';

	iCS(19) <= '0' when (CRDSn = '1') else
	           '1' when ((Ladd >= CS19min(19 downto 1)) and (Ladd <= CS19max(19 downto 1))) else
	           '0';			  

end architecture;
