
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rgb32 is
  port (
    R:        in std_logic;
    G:        in std_logic;
    B:        in std_logic;

    Ro:       out std_logic_vector(31 downto 0);
    Go:       out std_logic_vector(31 downto 0);
    Bo:       out std_logic_vector(31 downto 0);

    CLK:      in std_logic;
    STB:      in std_logic;
    OE:       in std_logic
  );
end entity rgb32;

architecture sim of rgb32 is

  subtype shregtype is std_logic_vector(31 downto 0);

  type rgbshregstype is array(0 to 2) of shregtype;
  signal shregs: rgbshregstype;

  signal inrgb:std_logic_vector(2 downto 0);

begin
  inrgb(0)<=R;
  inrgb(1)<=G;
  inrgb(2)<=B;

  process(CLK)
  begin
    if rising_edge(CLK) then
      for i in 0 to 2 loop
        shregs(i)(31 downto 1) <= shregs(i)(30 downto 0);
        shregs(i)(0) <= inrgb(i);
      end loop;
    end if;
  end process;

  process(STB)
  begin
    if STB='1' then
      Ro <= shregs(0);
      Go <= shregs(1);
      Bo <= shregs(2);
    end if;
  end process;

end sim;
