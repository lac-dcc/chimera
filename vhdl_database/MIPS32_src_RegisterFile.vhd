library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Common.all;

entity RegisterFile is
  port (
    -- Interface --
    clk:          in      std_logic;
    rst:          in      std_logic;
    rw:           in      RwType;
    rdReg1:       in      std_logic_vector (4 downto 0);
    rdReg2:       in      std_logic_vector (4 downto 0);
    wrReg:        in      std_logic_vector (4 downto 0);
    wrData:       in      std_logic_vector (31 downto 0);
    rdData1:      out     std_logic_vector (31 downto 0);
    rdData2:      out     std_logic_vector (31 downto 0)
  );
end RegisterFile; 

architecture Behavioral of RegisterFile is
begin
  process (clk, rst)
    constant NUM_REGISTERS: integer := 32;
    type RegistersType is array(0 to NUM_REGISTERS - 1) of Int32;
    variable registers: RegistersType;
  begin
    if rst = '0' then
      for i in 0 to NUM_REGISTERS - 1 loop
        registers(i) := Int32_Zero;
      end loop;
    elsif falling_edge(clk) then
      if rw = R then
        -- Read register --
        rdData1 <= registers(to_integer(unsigned(rdReg1)));
        rdData2 <= registers(to_integer(unsigned(rdReg2)));
      else
        -- Write register --
        if wrReg /= "00000" then
          registers(to_integer(unsigned(wrReg))) := wrData;
        end if;
      end if;
    end if;
  end process;
end Behavioral;
