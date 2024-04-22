library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity SRAM is
  Port ( ADDR : in std_logic_vector(15 downto 0);
         DATA : inout std_logic_vector(7 downto 0);
         OE : in std_logic;
         WE : in std_logic;
         CS : in std_logic);
end SRAM;

architecture Behavioral of SRAM is
  subtype byte is std_logic_vector( 7 downto 0 );
  type mem_matrix is array (0 to 65535) of byte;

  shared variable matrix:mem_matrix;

begin

  read:process (CS,OE,ADDR) is

  begin

    if (CS ='1') OR (OE = '1') then
      DATA <= "ZZZZZZZZ";
    else
      DATA <= matrix(conv_integer(ADDR));
    end if;

  end process;

  write:process (CS,WE) is

  begin

    if (CS='0') then
      if WE = '0' then
        matrix (conv_integer(ADDR)):= DATA;
      end if;
    end if;

  end process;

end Behavioral;
