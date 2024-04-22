library IEEE;
use IEEE.std_logic_1164.all;

package fx68k is
COMPONENT fx68k
PORT
(
	clk             : in std_logic;
	extReset        : in std_logic; -- External sync reset on emulated system
	pwrUp           : in std_logic; -- Asserted together with reset on emulated system coldstart
	enPhi1          : in std_logic;
	enPhi2          : in std_logic; -- Clock enables. Next cycle is PHI1 or PHI2

	eRWn            : out std_logic;
	ASn             : out std_logic;
	LDSn            : out std_logic;
	UDSn            : out std_logic;
	E               : out std_logic;
	VMAn            : out std_logic;
	FC0             : out std_logic;
	FC1             : out std_logic;
	FC2             : out std_logic;
	BGn             : out std_logic;
	oRESETn         : out std_logic;
	oHALTEDn        : out std_logic;
	DTACKn          : in std_logic;
	VPAn            : in std_logic;
	BERRn           : in std_logic;
	BRn             : in std_logic;
	BGACKn          : in std_logic;
	IPL0n           : in std_logic;
	IPL1n           : in std_logic;
	IPL2n           : in std_logic;
	iEdb            : in std_logic_vector(15 downto 0);
	oEdb            : out std_logic_vector(15 downto 0);
	eab             : out std_logic_vector(23 downto 1)
);
END COMPONENT;
end package;