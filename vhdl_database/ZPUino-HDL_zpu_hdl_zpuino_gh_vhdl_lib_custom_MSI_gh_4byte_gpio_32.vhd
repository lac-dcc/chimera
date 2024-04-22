---------------------------------------------------------------------
--	Filename:	gh_4byte_gpio_32.vhd
--
--	Description:
--		4 byte General purpose Input/Output
--		with control register bit control, this has 32 bits 
--			mode = "00" writes D to O
--			mode = "01" sets D bits in O
--			mode = "10" clears D bits in O
--			mode = "11" inverts D bits in O
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	09/27/08  	hlefevre 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY gh_4byte_gpio_32 IS 
	port(
		clk   : IN STD_LOGIC; -- sample clock
		rst   : IN STD_LOGIC;
		CSn   : IN STD_LOGIC; -- chip select
		WR    : IN STD_LOGIC; -- Write signal
		BE    : IN STD_LOGIC_vector(3 downto 0); -- byte enable
		DRIVE : IN STD_LOGIC_vector(3 downto 0);
		MODE  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		D     : IN STD_LOGIC_vector(31 downto 0); -- data bus in
		RD    : out STD_LOGIC_VECTOR(31 downto 0); -- read back bus
		IO    : inout STD_LOGIC_VECTOR(31 downto 0)
		);
END entity;

ARCHITECTURE a OF gh_4byte_gpio_32 IS 

COMPONENT gh_register_control_ce IS 
	GENERIC (size: INTEGER := 8);
	PORT(	
		clk  : IN  STD_LOGIC;
		rst  : IN  STD_LOGIC; 
		CE   : IN  STD_LOGIC; -- clock enable
		MODE : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		D    : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q    : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END COMPONENT;

	signal	iQ      :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iWR     :  STD_LOGIC;
	signal	WR_BYTE :  STD_LOGIC_VECTOR(3 downto 0);
	
BEGIN 

--
-- OUTPUT 	   

process(clk,rst)
begin
	if (rst = '1') then
		RD <= (others => '0');
	elsif (rising_edge(clk)) then
		if (CSn = '1') then
			RD <= IO;
		end if;
	end if;
end process;

	IO(7 downto 0) <= iQ(7 downto 0) when (DRIVE(0) = '1') else
	                  "ZZZZZZZZ";
	
	IO(15 downto 8) <= iQ(15 downto 8) when (DRIVE(1) = '1') else
	                   "ZZZZZZZZ";
	
	IO(23 downto 16) <= iQ(23 downto 16) when (DRIVE(2) = '1') else
	                    "ZZZZZZZZ";

	IO(31 downto 24) <= iQ(31 downto 24) when (DRIVE(3) = '1') else
	                    "ZZZZZZZZ";
	 
	iWR <= '0' when ((WR = '0') or (CSn = '1')) else
	       '1';

	WR_BYTE <= BE and (iWR & iWR & iWR & iWR);

--  Registers
	
	U1 : gh_register_control_ce GENERIC MAP(8)-- 
	        PORT MAP (clk,rst,WR_BYTE(0),MODE,D(7 downto 0),iQ(7 downto 0));

	U2 : gh_register_control_ce GENERIC MAP(8)-- 
	        PORT MAP (clk,rst,WR_BYTE(1),MODE,D(15 downto 8),iQ(15 downto 8));

	U3 : gh_register_control_ce GENERIC MAP(8)-- 
	        PORT MAP (clk,rst,WR_BYTE(2),MODE,D(23 downto 16),iQ(23 downto 16));

	U4 : gh_register_control_ce GENERIC MAP(8)-- 
	        PORT MAP (clk,rst,WR_BYTE(3),MODE,D(31 downto 24),iQ(31 downto 24));

				
END architecture; 
