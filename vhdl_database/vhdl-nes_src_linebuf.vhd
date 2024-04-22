library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity linebuf is
   port (
         address  : in  std_logic_vector(9 downto 0);
         inclock  : in  std_logic;
		 we		  : in  std_logic;
         data     : in  std_logic_vector(3 downto 0);
         q        : out std_logic_vector(3 downto 0)
        );
end linebuf;

architecture RTL of linebuf is
  type Mem is array (0 to 255) of std_logic_vector(3 downto 0);
  begin

  process (inclock)
  variable iMem : Mem;
  begin
    if inclock'event and inclock ='1' then
	  if address<255 and we='0' then
		iMem(conv_integer(address)) := data;
	  end if;
		if address<512 then
			q <= iMem(conv_integer(Address(8 downto 1)));
		else
			q<="0000";
		end if;
	end if;
  end process;

end RTL;
