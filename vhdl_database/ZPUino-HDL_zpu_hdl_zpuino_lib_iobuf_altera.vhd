library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IOBUF is
  port(
    O  : out   std_ulogic;
    IO : inout std_ulogic;
    I  : in    std_ulogic;
    T  : in    std_ulogic
    );
end entity IOBUF;

architecture behave of IOBUF is

begin

  IO <= I when T='0' else 'Z';
  O <= IO;

end behave;
