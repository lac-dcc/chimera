library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.defines.all;
use ieee.numeric_std.all;

entity instruction_delay is

  generic(
      BARREL_BIT_WIDTH: integer := 4);

  Port(
        clk, reset : in std_logic;
        shift_instructions_in : in std_logic;
        active_barrel_row_in : in std_logic_vector(BARREL_BIT_WIDTH -1 downto 0);
        instruction_in : in instruction_t;
        instruction_out : out instruction_t);

end instruction_delay;

architecture Behavioral of instruction_delay is

  type instruction_queue_t is array(BARREL_HEIGHT - 1 downto 0) of instruction_t;
  signal instruction_queue : instruction_queue_t := (others => (others => '0'));

begin

  instruction_select: process (instruction_in, active_barrel_row_in, instruction_queue) is
  begin
    instruction_out <= instruction_in;
    if unsigned(active_barrel_row_in) /= 0 then
      instruction_out <= instruction_queue(to_integer(unsigned(active_barrel_row_in)));
    end if;
  end process;

  shift_instructions: process (clk) is
  begin
    if rising_edge(clk) then
      if reset = '1' then
        instruction_queue <= (others => (others => '0'));
      elsif shift_instructions_in = '1' then
        instruction_queue(0) <= instruction_in;
        for i in 1 to BARREL_HEIGHT - 1 loop
          instruction_queue(i) <= instruction_queue(i-1);
        end loop;
      end if;
    end if;
  end process; -- shift_instructions

end Behavioral;

