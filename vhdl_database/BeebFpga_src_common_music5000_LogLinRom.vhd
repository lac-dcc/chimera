library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity LogLinRom is
    port (
        CLK  : in  std_logic;
        ADDR : in  std_logic_vector(6 downto 0);
        DATA : out std_logic_vector(12 downto 0)
        );
end;

architecture RTL of LogLinRom is

    type mem_type is array (0 to 127) of unsigned(12 downto 0);

    function init_mem return mem_type is
      variable ccc : integer;
      variable val : integer;
      variable temp_mem : mem_type;
    begin
      ccc := 1;
      for c in 0 to 7 loop
        for s in 0 to 15 loop
          -- input is 7 bits
          -- output is 13 bits
          
          -- ROM = 2 * (2^C (S + 16.5) - 16.5)
          --     = 2^C (2S + 33) - 33
          
          -- min value is 0; max value is 8031
          val := ccc * (2 * s + 33) - 33;
          temp_mem(s + 16 * c) := to_unsigned(val, 13);
        end loop;
        ccc := ccc * 2;
      end loop;
      return temp_mem;
    end;
    
    constant mem : mem_type := init_mem;
                          
begin

    p_rom : process
    begin
        wait until rising_edge(CLK);
        DATA <= std_logic_vector(mem(to_integer(unsigned(ADDR))));
    end process;

end RTL;

