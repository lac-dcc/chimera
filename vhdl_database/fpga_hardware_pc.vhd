      library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defines.all;

entity pc is
    Port ( clk : in std_logic;
           reset: in std_logic;
           write_enable : in std_logic;
           pc_in : in instruction_address_t;
					 pc_input_select_in: in std_logic;
           pc_out : out instruction_address_t
           );
end pc;

architecture Behavioral of pc is
  signal pc_i : instruction_address_t := (others => '0'); 
begin
  pc_out <= pc_i;
  
  
  process (clk, reset, write_enable) is
  begin
    if reset = '1' then
      pc_i <= (others => '0');
    elsif rising_edge(clk) and write_enable = '1' then
      pc_i <= std_logic_vector(unsigned(pc_i) + to_unsigned(1, INSTRUCTION_ADDRESS_WIDTH));
      if pc_input_select_in = '1' then
        pc_i <= pc_in;
      end if;
    end if;
  end process;

end Behavioral;