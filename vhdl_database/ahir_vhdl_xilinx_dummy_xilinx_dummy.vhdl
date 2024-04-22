library std;
library ieee;
use ieee.std_logic_1164.all;

package vcomponents is

	component bufgce 
		port (I: in std_logic;
			O : out std_logic;
			CE: in std_logic
		);
	end component bufgce;
end package;

library std;
library ieee;
use ieee.std_logic_1164.all;

entity bufgce  is
  port (I: in std_logic;
	O : out std_logic;
	CE: in std_logic
		);
end entity bufgce;

architecture DummyDumb of bufgce is
      signal CE_latched: std_logic;
begin
	process(I,CE)
	begin
		if(I = '0') then
			CE_latched <= CE;
		end if;
	end process;
	O <= I and CE_latched;

end DummyDumb;


