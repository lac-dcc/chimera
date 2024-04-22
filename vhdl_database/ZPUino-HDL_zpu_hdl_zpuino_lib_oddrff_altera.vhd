library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

entity oddrff is
  port (
    CLK:  in std_ulogic;
    D0:   in std_logic;
    D1:   in std_logic;
    O:   out std_ulogic
  );

end entity oddrff;

architecture behave of oddrff is
  signal D0_v, D1_v, O_v:   std_logic_vector(0 downto 0);


begin

	ALTDDIO_OUT_component : ALTDDIO_OUT
	GENERIC MAP (
		extend_oe_disable => "OFF",
		intended_device_family => "Cyclone IV E",
		invert_output => "OFF",
		lpm_hint => "UNUSED",
		lpm_type => "altddio_out",
		oe_reg => "UNREGISTERED",
		power_up_high => "OFF",
		width => 1
	)
	PORT MAP (
		datain_h => D1_v,
		datain_l => D0_v,
		outclock => CLK,
		dataout => O_v
	);

  D1_v(0) <= D0;
  D0_v(0) <= D1;
  O <= O_v(0);

end behave;
