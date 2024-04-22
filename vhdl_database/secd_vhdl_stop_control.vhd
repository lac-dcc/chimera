
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stop_control is
  port (
    stop_input       : in std_logic;
    stop_instruction : in std_logic;
    stop_output      : out std_logic
    );
end;

architecture rtl of stop_control is

    signal stop_instruction_latched : std_logic;
    signal reset                    : std_logic;

begin

  ff : entity dff port map (
    d    => '1',
    clk  => stop_instruction,
    q    => stop_instruction_latched,
    arst => reset
    );

  reset       <= not stop_input and not stop_instruction;
  stop_output <= stop_instruction_latched or stop_input;

end;
