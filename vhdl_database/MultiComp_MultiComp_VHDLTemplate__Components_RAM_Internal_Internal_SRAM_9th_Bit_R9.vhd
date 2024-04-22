---------------------------------------------------------
-- R9 v0.10	 -  a 9th bit recovery BlockRAM controller --
--																		--
--																		--
-- Unrestricted release - do with it as you see fit.	--
--																		--
-- Cray Ze Ape - April 26 2019								--
---------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity R9 is
	port (
		q       : out STD_LOGIC_VECTOR(7 downto 0);
		wren    : in  std_logic;
		data    : in STD_LOGIC_VECTOR(7 downto 0);
 		clock   : in  std_logic;
		address : in STD_LOGIC_VECTOR(13 downto 0)
	);
end R9;

architecture Behavioral of R9 is

constant BasePage			: integer:=0;

signal rambit0dataout	: std_logic_vector(8 downto 0);
signal rambit1dataout	: std_logic_vector(8 downto 0);
signal rambit2dataout	: std_logic_vector(8 downto 0);
signal rambit3dataout	: std_logic_vector(8 downto 0);
signal rambit4dataout	: std_logic_vector(8 downto 0);
signal rambit5dataout	: std_logic_vector(8 downto 0);
signal rambit6dataout	: std_logic_vector(8 downto 0);
signal rambit7dataout	: std_logic_vector(8 downto 0);

signal rambit0datain		: std_logic_vector(8 downto 0);
signal rambit1datain		: std_logic_vector(8 downto 0);
signal rambit2datain		: std_logic_vector(8 downto 0);
signal rambit3datain		: std_logic_vector(8 downto 0);
signal rambit4datain		: std_logic_vector(8 downto 0);
signal rambit5datain		: std_logic_vector(8 downto 0);
signal rambit6datain		: std_logic_vector(8 downto 0);
signal rambit7datain		: std_logic_vector(8 downto 0);

signal addr					: std_logic_vector(13 downto 0);

signal wren9k				: std_logic;
signal q_buf				: std_logic_vector(7 downto 0);

begin

	q_buf <=
		rambit7dataout(0)&rambit6dataout(0)&rambit5dataout(0)&rambit4dataout(0)&rambit3dataout(0)&rambit2dataout(0)&rambit1dataout(0)&rambit0dataout(0) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  0 else
		rambit7dataout(1)&rambit6dataout(1)&rambit5dataout(1)&rambit4dataout(1)&rambit3dataout(1)&rambit2dataout(1)&rambit1dataout(1)&rambit0dataout(1) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  1 else
		rambit7dataout(2)&rambit6dataout(2)&rambit5dataout(2)&rambit4dataout(2)&rambit3dataout(2)&rambit2dataout(2)&rambit1dataout(2)&rambit0dataout(2) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  2 else
		rambit7dataout(3)&rambit6dataout(3)&rambit5dataout(3)&rambit4dataout(3)&rambit3dataout(3)&rambit2dataout(3)&rambit1dataout(3)&rambit0dataout(3) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  3 else
		rambit7dataout(4)&rambit6dataout(4)&rambit5dataout(4)&rambit4dataout(4)&rambit3dataout(4)&rambit2dataout(4)&rambit1dataout(4)&rambit0dataout(4) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  4 else
		rambit7dataout(5)&rambit6dataout(5)&rambit5dataout(5)&rambit4dataout(5)&rambit3dataout(5)&rambit2dataout(5)&rambit1dataout(5)&rambit0dataout(5) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  5 else
		rambit7dataout(6)&rambit6dataout(6)&rambit5dataout(6)&rambit4dataout(6)&rambit3dataout(6)&rambit2dataout(6)&rambit1dataout(6)&rambit0dataout(6) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  6 else
		rambit7dataout(7)&rambit6dataout(7)&rambit5dataout(7)&rambit4dataout(7)&rambit3dataout(7)&rambit2dataout(7)&rambit1dataout(7)&rambit0dataout(7) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  7 else
		rambit7dataout(8)&rambit6dataout(8)&rambit5dataout(8)&rambit4dataout(8)&rambit3dataout(8)&rambit2dataout(8)&rambit1dataout(8)&rambit0dataout(8) when to_integer(unsigned(addr(13 downto 10))) - BasePage =  8 else
		x"FF";

addr<= address;
wren9k <= wren;

process (clock)
begin
  if rising_edge(clock) then

q <= q_buf;

if to_integer(unsigned(addr(13 downto 10))) - BasePage = 0 then
rambit0datain <= rambit0dataout(8 downto 1)&data(0);
rambit1datain <= rambit1dataout(8 downto 1)&data(1);
rambit2datain <= rambit2dataout(8 downto 1)&data(2);
rambit3datain <= rambit3dataout(8 downto 1)&data(3);
rambit4datain <= rambit4dataout(8 downto 1)&data(4);
rambit5datain <= rambit5dataout(8 downto 1)&data(5);
rambit6datain <= rambit6dataout(8 downto 1)&data(6);
rambit7datain <= rambit7dataout(8 downto 1)&data(7);

elsif to_integer(unsigned(addr(13 downto 10))) - BasePage = 1 then
rambit0datain <= rambit0dataout(8 downto 2)&data(0)&rambit0dataout(0);
rambit1datain <= rambit1dataout(8 downto 2)&data(1)&rambit1dataout(0);
rambit2datain <= rambit2dataout(8 downto 2)&data(2)&rambit2dataout(0);
rambit3datain <= rambit3dataout(8 downto 2)&data(3)&rambit3dataout(0);
rambit4datain <= rambit4dataout(8 downto 2)&data(4)&rambit4dataout(0);
rambit5datain <= rambit5dataout(8 downto 2)&data(5)&rambit5dataout(0);
rambit6datain <= rambit6dataout(8 downto 2)&data(6)&rambit6dataout(0);
rambit7datain <= rambit7dataout(8 downto 2)&data(7)&rambit7dataout(0);

elsif to_integer(unsigned(addr(13 downto 10))) - BasePage = 2 then
rambit0datain <= rambit0dataout(8 downto 3)&data(0)&rambit0dataout(1 downto 0);
rambit1datain <= rambit1dataout(8 downto 3)&data(1)&rambit1dataout(1 downto 0);
rambit2datain <= rambit2dataout(8 downto 3)&data(2)&rambit2dataout(1 downto 0);
rambit3datain <= rambit3dataout(8 downto 3)&data(3)&rambit3dataout(1 downto 0);
rambit4datain <= rambit4dataout(8 downto 3)&data(4)&rambit4dataout(1 downto 0);
rambit5datain <= rambit5dataout(8 downto 3)&data(5)&rambit5dataout(1 downto 0);
rambit6datain <= rambit6dataout(8 downto 3)&data(6)&rambit6dataout(1 downto 0);
rambit7datain <= rambit7dataout(8 downto 3)&data(7)&rambit7dataout(1 downto 0);

elsif to_integer(unsigned(addr(13 downto 10))) - BasePage = 3 then
rambit0datain <= rambit0dataout(8 downto 4)&data(0)&rambit0dataout(2 downto 0);
rambit1datain <= rambit1dataout(8 downto 4)&data(1)&rambit1dataout(2 downto 0);
rambit2datain <= rambit2dataout(8 downto 4)&data(2)&rambit2dataout(2 downto 0);
rambit3datain <= rambit3dataout(8 downto 4)&data(3)&rambit3dataout(2 downto 0);
rambit4datain <= rambit4dataout(8 downto 4)&data(4)&rambit4dataout(2 downto 0);
rambit5datain <= rambit5dataout(8 downto 4)&data(5)&rambit5dataout(2 downto 0);
rambit6datain <= rambit6dataout(8 downto 4)&data(6)&rambit6dataout(2 downto 0);
rambit7datain <= rambit7dataout(8 downto 4)&data(7)&rambit7dataout(2 downto 0);

elsif to_integer(unsigned(addr(13 downto 10))) - BasePage = 4 then
rambit0datain <= rambit0dataout(8 downto 5)&data(0)&rambit0dataout(3 downto 0);
rambit1datain <= rambit1dataout(8 downto 5)&data(1)&rambit1dataout(3 downto 0);
rambit2datain <= rambit2dataout(8 downto 5)&data(2)&rambit2dataout(3 downto 0);
rambit3datain <= rambit3dataout(8 downto 5)&data(3)&rambit3dataout(3 downto 0);
rambit4datain <= rambit4dataout(8 downto 5)&data(4)&rambit4dataout(3 downto 0);
rambit5datain <= rambit5dataout(8 downto 5)&data(5)&rambit5dataout(3 downto 0);
rambit6datain <= rambit6dataout(8 downto 5)&data(6)&rambit6dataout(3 downto 0);
rambit7datain <= rambit7dataout(8 downto 5)&data(7)&rambit7dataout(3 downto 0);

elsif to_integer(unsigned(addr(13 downto 10))) - BasePage = 5 then
rambit0datain <= rambit0dataout(8 downto 6)&data(0)&rambit0dataout(4 downto 0);
rambit1datain <= rambit1dataout(8 downto 6)&data(1)&rambit1dataout(4 downto 0);
rambit2datain <= rambit2dataout(8 downto 6)&data(2)&rambit2dataout(4 downto 0);
rambit3datain <= rambit3dataout(8 downto 6)&data(3)&rambit3dataout(4 downto 0);
rambit4datain <= rambit4dataout(8 downto 6)&data(4)&rambit4dataout(4 downto 0);
rambit5datain <= rambit5dataout(8 downto 6)&data(5)&rambit5dataout(4 downto 0);
rambit6datain <= rambit6dataout(8 downto 6)&data(6)&rambit6dataout(4 downto 0);
rambit7datain <= rambit7dataout(8 downto 6)&data(7)&rambit7dataout(4 downto 0);

elsif to_integer(unsigned(addr(13 downto 10))) - BasePage = 6 then
rambit0datain <= rambit0dataout(8 downto 7)&data(0)&rambit0dataout(5 downto 0);
rambit1datain <= rambit1dataout(8 downto 7)&data(1)&rambit1dataout(5 downto 0);
rambit2datain <= rambit2dataout(8 downto 7)&data(2)&rambit2dataout(5 downto 0);
rambit3datain <= rambit3dataout(8 downto 7)&data(3)&rambit3dataout(5 downto 0);
rambit4datain <= rambit4dataout(8 downto 7)&data(4)&rambit4dataout(5 downto 0);
rambit5datain <= rambit5dataout(8 downto 7)&data(5)&rambit5dataout(5 downto 0);
rambit6datain <= rambit6dataout(8 downto 7)&data(6)&rambit6dataout(5 downto 0);
rambit7datain <= rambit7dataout(8 downto 7)&data(7)&rambit7dataout(5 downto 0);

elsif to_integer(unsigned(addr(13 downto 10))) - BasePage = 7 then
rambit0datain <= rambit0dataout(8)&data(0)&rambit0dataout(6 downto 0);
rambit1datain <= rambit1dataout(8)&data(1)&rambit1dataout(6 downto 0);
rambit2datain <= rambit2dataout(8)&data(2)&rambit2dataout(6 downto 0);
rambit3datain <= rambit3dataout(8)&data(3)&rambit3dataout(6 downto 0);
rambit4datain <= rambit4dataout(8)&data(4)&rambit4dataout(6 downto 0);
rambit5datain <= rambit5dataout(8)&data(5)&rambit5dataout(6 downto 0);
rambit6datain <= rambit6dataout(8)&data(6)&rambit6dataout(6 downto 0);
rambit7datain <= rambit7dataout(8)&data(7)&rambit7dataout(6 downto 0);

elsif to_integer(unsigned(addr(13 downto 10))) - BasePage = 8 then
rambit0datain <= data(0)&rambit0dataout(7 downto 0);
rambit1datain <= data(1)&rambit1dataout(7 downto 0);
rambit2datain <= data(2)&rambit2dataout(7 downto 0);
rambit3datain <= data(3)&rambit3dataout(7 downto 0);
rambit4datain <= data(4)&rambit4dataout(7 downto 0);
rambit5datain <= data(5)&rambit5dataout(7 downto 0);
rambit6datain <= data(6)&rambit6dataout(7 downto 0);
rambit7datain <= data(7)&rambit7dataout(7 downto 0);
end if;

  end if;
end process;


rambit0 : entity work.rambit0
port map
(
		address	 => address(9 downto 0),
		clock	 => clock,
		data	 => rambit0datain,
		wren	 => wren9k,
		q	 => rambit0dataout
);

rambit1 : entity work.rambit1
port map
(
		address	 => address(9 downto 0),
		clock	 => clock,
		data	 => rambit1datain,
		wren	 => wren9k,
		q	 => rambit1dataout
);

rambit2 : entity work.rambit2
port map
(
		address	 => address(9 downto 0),
		clock	 => clock,
		data	 => rambit2datain,
		wren	 => wren9k,
		q	 => rambit2dataout
);

rambit3 : entity work.rambit3
port map
(
		address	 => address(9 downto 0),
		clock	 => clock,
		data	 => rambit3datain,
		wren	 => wren9k,
		q	 => rambit3dataout
);

rambit4 : entity work.rambit4
port map
(
		address	 => address(9 downto 0),
		clock	 => clock,
		data	 => rambit4datain,
		wren	 => wren9k,
		q	 => rambit4dataout
);

rambit5 : entity work.rambit5
port map
(
		address	 => address(9 downto 0),
		clock	 => clock,
		data	 => rambit5datain,
		wren	 => wren9k,
		q	 => rambit5dataout
);

rambit6 : entity work.rambit6
port map
(
		address	 => address(9 downto 0),
		clock	 => clock,
		data	 => rambit6datain,
		wren	 => wren9k,
		q	 => rambit6dataout
);

rambit7 : entity work.rambit7
port map
(
		address	 => address(9 downto 0),
		clock	 => clock,
		data	 => rambit7datain,
		wren	 => wren9k,
		q	 => rambit7dataout
);

end Behavioral;
