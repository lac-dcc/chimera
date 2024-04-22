library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity usb1_crc5 is
  port (
    crc_in:   in std_logic_vector(4 downto 0);
    din:      in std_logic_vector(10 downto 0);
    crc_out:  out std_logic_vector(4 downto 0)
  );
end entity usb1_crc5;

architecture behave of usb1_crc5 is

begin

crc_out(0) <=	din(10) xor din(9) xor din(6) xor din(5) xor din(3) xor
			din(0) xor crc_in(0) xor crc_in(3) xor crc_in(4);

crc_out(1) <=	din(10) xor din(7) xor din(6) xor din(4) xor din(1) xor
			crc_in(0) xor crc_in(1) xor crc_in(4);

crc_out(2) <=	din(10) xor din(9) xor din(8) xor din(7) xor din(6) xor
			din(3) xor din(2) xor din(0) xor crc_in(0) xor crc_in(1) xor
			crc_in(2) xor crc_in(3) xor crc_in(4);

crc_out(3) <=	din(10) xor din(9) xor din(8) xor din(7) xor din(4) xor din(3) xor
			din(1) xor crc_in(1) xor crc_in(2) xor crc_in(3) xor crc_in(4);

crc_out(4) <=	din(10) xor din(9) xor din(8) xor din(5) xor din(4) xor din(2) xor
			crc_in(2) xor crc_in(3) xor crc_in(4);

end behave;
