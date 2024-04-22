library ieee;
use ieee.std_logic_1164.all;

package can is
  type message is record
    id  : std_ulogic_vector(10 downto 0);
    len : std_ulogic_vector(3 downto 0);
    dat : std_ulogic_vector(63 downto 0);
  end record message;
end package can;

package body can is
end package body can;
