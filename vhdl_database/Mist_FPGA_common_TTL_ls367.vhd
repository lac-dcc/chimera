--
-- ls367.vhd
--
-- LS367 and the others circuit module
-- for MZ-700 on FPGA
--
-- TEMPO generator
-- TONE gate
--
-- Nibbles Lab. 2005
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ls367 is
    Port ( RST : in std_logic;
           CLKIN : in std_logic;
           CLKOUT : out std_logic;
		 GATE : out std_logic;
		 CS : in std_logic;
		 WR : in std_logic;
		 DI : in std_logic_vector(7 downto 0);
           DO : out std_logic_vector(7 downto 0));
end ls367;

architecture Behavioral of ls367 is

--
-- TEMPO counter
--
signal TCOUNT : std_logic_vector(15 downto 0);
signal TEMPO : std_logic;
--
-- GATE control
--
signal GT : std_logic;

begin

	--
	-- TEMPO
	--
	process( CLKIN ) begin
		if( CLKIN'event and CLKIN='1' ) then
			TCOUNT<=TCOUNT+'1';
			if( TCOUNT=46976 ) then
				TCOUNT<=(others=>'0');
				TEMPO<=not TEMPO;
			end if;
		end if;
	end process;

	DO(0)<=TEMPO;
	DO(7 downto 1)<=(others=>'1');
	CLKOUT<=TEMPO;

	--
	-- TONE gate control
	--
	process( WR, RST ) begin
		if( RST='0' ) then
			GT<='0';
		elsif( WR'event and WR='1' ) then
			if( CS='0' ) then
				GT<=DI(0);
			end if;
		end if;
	end process;

	GATE<=GT;

end Behavioral;
