-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.fp_wire.all;

entity fp_mac is
	port(
		fp_mac_i : in  fp_mac_in_type;
		fp_mac_o : out fp_mac_out_type
	);
end fp_mac;

architecture behavior of fp_mac is

	signal add : signed(109 downto 0);
	signal mul : signed(111 downto 0);
	signal mac : signed(109 downto 0);
	signal res : signed(109 downto 0);

begin

	add <= fp_mac_i.a & "00" & X"0000000000000";
	mul <= fp_mac_i.b * fp_mac_i.c;
	mac <= mul(109 downto 0) when fp_mac_i.op = '0' else -mul(109 downto 0);
	res <= add + mac;
	fp_mac_o.d <= res;

end behavior;
