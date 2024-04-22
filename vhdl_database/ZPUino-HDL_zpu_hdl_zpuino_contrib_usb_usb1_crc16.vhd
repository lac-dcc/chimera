library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity usb1_crc16 is
  port (
    crc_in:   in std_logic_vector(15 downto 0);
    din:      in std_logic_vector(7 downto 0);
    crc_out:  out std_logic_vector(15 downto 0)
  );
end entity usb1_crc16;

architecture behave of usb1_crc16 is

begin

crc_out(0) <=	din(7) xor din(6) xor din(5) xor din(4) xor din(3) xor
			din(2) xor din(1) xor din(0) xor crc_in(8) xor crc_in(9) xor
			crc_in(10) xor crc_in(11) xor crc_in(12) xor crc_in(13) xor
			crc_in(14) xor crc_in(15);
crc_out(1) <=	din(7) xor din(6) xor din(5) xor din(4) xor din(3) xor din(2) xor
			din(1) xor crc_in(9) xor crc_in(10) xor crc_in(11) xor
			crc_in(12) xor crc_in(13) xor crc_in(14) xor crc_in(15);
crc_out(2) <=	din(1) xor din(0) xor crc_in(8) xor crc_in(9);
crc_out(3) <=	din(2) xor din(1) xor crc_in(9) xor crc_in(10);
crc_out(4) <=	din(3) xor din(2) xor crc_in(10) xor crc_in(11);
crc_out(5) <=	din(4) xor din(3) xor crc_in(11) xor crc_in(12);
crc_out(6) <=	din(5) xor din(4) xor crc_in(12) xor crc_in(13);
crc_out(7) <=	din(6) xor din(5) xor crc_in(13) xor crc_in(14);
crc_out(8) <=	din(7) xor din(6) xor crc_in(0) xor crc_in(14) xor crc_in(15);
crc_out(9) <=	din(7) xor crc_in(1) xor crc_in(15);
crc_out(10) <=	crc_in(2);
crc_out(11) <=	crc_in(3);
crc_out(12) <=	crc_in(4);
crc_out(13) <=	crc_in(5);
crc_out(14) <=	crc_in(6);
crc_out(15) <=	din(7) xor din(6) xor din(5) xor din(4) xor din(3) xor din(2) xor
			din(1) xor din(0) xor crc_in(7) xor crc_in(8) xor crc_in(9) xor
			crc_in(10) xor crc_in(11) xor crc_in(12) xor crc_in(13) xor
			crc_in(14) xor crc_in(15);


end behave;
