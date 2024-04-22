library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BRAM is
  generic(
    DEPTH : integer := 7500;
    WIDTH : integer := 8
  );
  port(
    CLK_IN : in std_logic;
    CLK_OUT : in std_logic;

    WE : in std_logic;
    DIN : in std_logic_vector;
    AIN : in std_logic_vector;

    DOUT : out std_logic_vector;
    AOUT : in std_logic_vector
  );
end entity BRAM;

architecture RTL of BRAM is

  type MEMORY_TYPE is array (0 to DEPTH - 1)  of Std_logic_vector(WIDTH-1 downto 0);
  shared variable MEMORY : MEMORY_TYPE;

begin

  process
  begin
    wait until rising_edge(CLK_IN);
    if WE = '1' then
      MEMORY(to_integer(unsigned(AIN))) := DIN;
    end if;
  end process;

  process
  begin
    wait until rising_edge(CLK_OUT);
    DOUT <= MEMORY(to_integer(unsigned(AOUT)));
  end process;

end architecture RTL;

