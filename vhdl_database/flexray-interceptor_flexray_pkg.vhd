library ieee;
use ieee.std_logic_1164.all;

package flexray is
  type data_t is array (0 to 254) of std_logic_vector(7 downto 0);

  type message is record
    flags          : std_ulogic_vector(4 downto 0);
    frame_id       : std_ulogic_vector(10 downto 0);
    payload_length : std_ulogic_vector(6 downto 0);
    header_crc     : std_ulogic_vector(10 downto 0);
    cycle_count    : std_ulogic_vector(5 downto 0);
    data           : data_t;
    crc            : std_ulogic_vector(23 downto 0);
  end record message;
end package flexray;

package body flexray is
end package body flexray;
