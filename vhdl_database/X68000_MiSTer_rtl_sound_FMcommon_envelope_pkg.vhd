library ieee, work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package envelope_pkg is
type envstate_t is(
	es_OFF,
	es_Atk,
	es_Dec,
	es_Sus,
	es_Rel
);

end envelope_pkg;
