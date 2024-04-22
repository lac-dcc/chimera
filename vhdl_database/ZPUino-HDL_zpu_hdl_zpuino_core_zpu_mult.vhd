library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity multiplier is
  generic (
    stages: integer := 3
  );
  port (
    clk: in std_logic;
    rst: in std_logic;
    enable:  in std_logic;
    done: out std_logic;
    inputA:  in std_logic_vector(31 downto 0);
    inputB: in std_logic_vector(31 downto 0);
    output: out std_logic_vector(31 downto 0)

  );
end multiplier;

architecture behave of multiplier is

  subtype word is unsigned(31 downto 0);
  type mregtype is array(0 to stages-1) of word;

  signal rq: mregtype;
  signal d: std_logic_vector(0 to stages -1);

begin

  process(clk,inputA,inputB)
    variable r: unsigned(63 downto 0);
    variable idx: word;
  begin
      if rising_edge(clk) then
        if rst='1' then
          done <= '0';
        else
          d <= (others => '0');
          if enable='1' then

            r := unsigned(inputA) * unsigned(inputB);
            rq(0) <= r(31 downto 0);
            d(0) <= '1';
            for i in 1 to stages-1 loop
              rq(i) <= rq(i-1);
              d(i) <= d(i-1);
            end loop;

            done <= d(stages-1);

            output <= std_logic_vector(rq(stages-1));
          else
            done <= '0';
          end if;
        end if;
      end if;
  end process;

end behave;

