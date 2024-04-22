-------------------------------------------------------------------------------
-- Copyright (c) 2005 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 1.0
--  \   \        Filename: prbsgen_ser.vhd
--  /   /        Date Last Modified:  May 1 2007
-- /___/   /\    Date Created: May 1 2007
-- \   \  /  \
--  \___\/\___\
-- 
--Device: Virtex-5
--Purpose: Barrel shifter from 10 to 10.
--Reference:
--    
--Revision History:
--    Rev 1.0 - First created, Giovanni Guasti and Paolo Novellini, May 1 2007.
-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- to Elisa
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY bshift10to10 IS
    Port ( 
	    CLK			  : in	STD_LOGIC;
	    RST			  : in	STD_LOGIC;
			DIN       : in	STD_LOGIC_VECTOR(9 downto 0);
			DV        : in	STD_LOGIC_VECTOR(3 downto 0);
			DV10      : out	STD_LOGIC;
			DOUT10		: out	STD_LOGIC_VECTOR(9 downto 0)
		);
END bshift10to10;

ARCHITECTURE behavior OF bshift10to10 IS 

COMPONENT rot20
    Port ( 
      CLK			: in	STD_LOGIC;
      RST			: in	STD_LOGIC;
			HIN			: in	STD_LOGIC_VECTOR(19 downto 0);
			HOUT		: out	STD_LOGIC_VECTOR(19 downto 0);
	    P			  : in	STD_LOGIC_VECTOR(4 downto 0)
		);
END COMPONENT;

COMPONENT maskencoder
    Port ( 
	    CLK			: in	STD_LOGIC;
	    RST			: in	STD_LOGIC;
	    SHIFT   : in	STD_LOGIC_VECTOR(4 downto 0);
			MASK		  : out	STD_LOGIC_VECTOR(19 downto 0)
		);
END COMPONENT;

COMPONENT control
    Port ( 
	    CLK			    : in	STD_LOGIC;
	    RST			    : in	STD_LOGIC;
			DV			    : in	STD_LOGIC_VECTOR(3 downto 0);
			SHIFT       : out	STD_LOGIC_VECTOR(4 downto 0);
			WRFLAG      : out	STD_LOGIC;
			VALID       : out	STD_LOGIC
		);
END COMPONENT;


SIGNAL mask             : STD_LOGIC_VECTOR(19 downto 0);
SIGNAL dinext           : STD_LOGIC_VECTOR(19 downto 0);
SIGNAL dinext_rot       : STD_LOGIC_VECTOR(19 downto 0);
SIGNAL reg20            : STD_LOGIC_VECTOR(19 downto 0);
SIGNAL regout           : STD_LOGIC_VECTOR(9 downto 0);
SIGNAL pointer1         : STD_LOGIC_VECTOR(4 downto 0);
SIGNAL wrflag           : STD_LOGIC;
SIGNAL valid            : STD_LOGIC;

BEGIN

	I_Maskdec: maskencoder PORT MAP(
		CLK        => CLK,
		RST        => RST,
		SHIFT      => pointer1,
		MASK       => mask
	);

    I_control: control PORT MAP(
		CLK        => CLK,
		RST        => RST,
		DV 	       => DV,
        SHIFT      => pointer1,
        WRFLAG     => wrflag,
        VALID      => valid
		);

    dinext  <= "0000000000" & DIN;
	Inst_data_bs: rot20 PORT MAP(
		CLK 		=> CLK,
		RST 		=> RST,
		HIN 		=> dinext,
		HOUT 		=> dinext_rot,
		P 			=> pointer1
	);


	-- writing in the 20 bit register
	PROCESS (CLK,RST)
	begin
		if RST='0' then
			reg20 <= (others=>'0');
		elsif rising_edge(CLK) then
	   		for i in 0 to 19 loop
				if mask(i)='1' then
					reg20(i) <= dinext_rot(i); -- update
				else
					reg20(i) <= reg20(i);      -- keep
				end if;
	   		end loop;
		end if;
	end process;

	regout <= reg20(9 downto 0) when wrflag='0' else reg20(19 downto 10);
	PROCESS (CLK,RST)
	begin
		if RST='0' then
			DOUT10 <= (others=>'0');
		elsif rising_edge(CLK) then
			DOUT10 <= regout;
		end if;
	end process;

	PROCESS (CLK,RST)
	begin
		if RST='0' then
			DV10 <= '0';
		elsif rising_edge(CLK) then
			DV10 <= valid;
		end if;
	end process;

END;