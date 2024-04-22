library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity lshifter is
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
    output: out std_logic_vector(63 downto 0);
    multorshift: in std_logic
  );
end lshifter;

architecture behave of lshifter is


  subtype word is signed(63 downto 0);
  type mregtype is array(0 to stages-1) of word;

  signal rq: mregtype;
  signal d: std_logic_vector(0 to stages -1);

begin

  process(clk,inputA,inputB)
    variable r: signed(63 downto 0);
    variable idx: signed(31 downto 0);
  begin


      if rising_edge(clk) then
        if rst='1' then
          done <= '0';
        else
        d <= (others =>'0');

        if enable='1' then
          if multorshift='1' then
            idx := signed(inputB);
          else
          case inputB(4 downto 0) is
            when "00000" => idx := "00000000000000000000000000000001";
            when "00001" => idx := "00000000000000000000000000000010";
            when "00010" => idx := "00000000000000000000000000000100";
            when "00011" => idx := "00000000000000000000000000001000";
            when "00100" => idx := "00000000000000000000000000010000";
            when "00101" => idx := "00000000000000000000000000100000";
            when "00110" => idx := "00000000000000000000000001000000";
            when "00111" => idx := "00000000000000000000000010000000";
            when "01000" => idx := "00000000000000000000000100000000";
            when "01001" => idx := "00000000000000000000001000000000";
            when "01010" => idx := "00000000000000000000010000000000";
            when "01011" => idx := "00000000000000000000100000000000";
            when "01100" => idx := "00000000000000000001000000000000";
            when "01101" => idx := "00000000000000000010000000000000";
            when "01110" => idx := "00000000000000000100000000000000";
            when "01111" => idx := "00000000000000001000000000000000";
            when "10000" => idx := "00000000000000010000000000000000";
            when "10001" => idx := "00000000000000100000000000000000";
            when "10010" => idx := "00000000000001000000000000000000";
            when "10011" => idx := "00000000000010000000000000000000";
            when "10100" => idx := "00000000000100000000000000000000";
            when "10101" => idx := "00000000001000000000000000000000";
            when "10110" => idx := "00000000010000000000000000000000";
            when "10111" => idx := "00000000100000000000000000000000";
            when "11000" => idx := "00000001000000000000000000000000";
            when "11001" => idx := "00000010000000000000000000000000";
            when "11010" => idx := "00000100000000000000000000000000";
            when "11011" => idx := "00001000000000000000000000000000";
            when "11100" => idx := "00010000000000000000000000000000";
            when "11101" => idx := "00100000000000000000000000000000";
            when "11110" => idx := "01000000000000000000000000000000";
            when "11111" => idx := "10000000000000000000000000000000";
            when others =>

          end case;
          end if;

          r := signed(inputA) * idx;
        
          rq(0) <= r(63 downto 0);
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