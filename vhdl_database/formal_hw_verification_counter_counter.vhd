library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity counter is
  generic (
    InitVal : natural := 0;
    EndVal  : natural := 16;
    Formal  : boolean := true
  );
  port (
    Reset_n_i : in  std_logic;
    Clk_i     : in  std_logic;
    Data_o    : out std_logic_vector(31 downto 0)
  );
end entity counter;



architecture rtl of counter is


begin


  process (Reset_n_i, Clk_i) is
  begin
    if (Reset_n_i = '0') then
      Data_o <= std_logic_vector(to_unsigned(InitVal, Data_o'length));
    elsif (rising_edge(Clk_i)) then
      if (to_integer(unsigned(Data_o)) < EndVal) then
        Data_o <= std_logic_vector(unsigned(Data_o) + 1);
      end if;
    end if;
  end process;


  FormalG : if Formal generate

    default clock is rising_edge(Clk_i);

    -- Initial reset
    INITIAL_RESET : restrict {not Reset_n_i[*2]; Reset_n_i[+]}[*1];

    -- Asynchronous (unclocked) Reset asserts
    AFTER_RESET : process (all) is
    begin
      if (not Reset_n_i) then
        RESET_DATA : assert unsigned(Data_o) = to_unsigned(InitVal, Data_o'length);
      end if;
    end process AFTER_RESET;

    COUNT_UP : assert always
      Reset_n_i and unsigned(Data_o) < to_unsigned(EndVal, Data_o'length)
      ->
      next unsigned(Data_o) = unsigned(prev(Data_o)) + 1;

    END_VALUE : assert always
      unsigned(Data_o) = to_unsigned(EndVal, Data_o'length)
      ->
      next Data_o = prev(Data_o);

    VALID_RANGE : assert always
      unsigned(Data_o) >= to_unsigned(InitVal, Data_o'length) and
      unsigned(Data_o) <= to_unsigned(EndVal, Data_o'length);

  end generate FormalG;


end architecture rtl;

