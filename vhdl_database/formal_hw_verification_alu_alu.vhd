library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity alu is
  generic (
    Width  : natural := 8;
    Formal : boolean := true
  );
  port (
    Reset_n_i  : in  std_logic;
    Clk_i      : in  std_logic;
    Opc_i      : in  std_logic_vector(1 downto 0);
    DinA_i     : in  std_logic_vector(Width-1 downto 0);
    DinB_i     : in  std_logic_vector(Width-1 downto 0);
    Dout_o     : out std_logic_vector(Width-1 downto 0);
    OverFlow_o : out std_logic
  );
end entity alu;



architecture rtl of alu is


  subtype t_opc is std_logic_vector(Opc_i'range);

  constant c_add : t_opc := "00";
  constant c_sub : t_opc := "01";
  constant c_and : t_opc := "10";
  constant c_or  : t_opc := "11";


begin


  process (Reset_n_i, Clk_i) is
    variable v_result : std_logic_vector(Width downto 0);
  begin
    if (Reset_n_i = '0') then
      v_result   := (others => '0');
      Dout_o     <= (others => '0');
      OverFlow_o <= '0';
    elsif (rising_edge(Clk_i)) then
      case Opc_i is
        when c_add =>
          v_result := std_logic_vector(unsigned('0' & DinA_i) +
                                       unsigned('0' & DinB_i));
        when c_sub =>
          v_result := std_logic_vector(unsigned('0' & DinA_i) -
                                       unsigned('0' & DinB_i));
        when c_and => v_result := ('0', DinA_i and DinB_i);
        when c_or  => v_result := ('0', DinA_i or  DinB_i);
        when others => null;
      end case;
      Dout_o     <= v_result(Width-1 downto 0);
      OverFlow_o <= v_result(Width);
    end if;
  end process;


  FormalG : if Formal generate

    function max(a, b: std_logic_vector) return unsigned is
    begin
      if unsigned(a) > unsigned(b) then
        return unsigned(a);
      else
        return unsigned(b);
      end if;
    end function max;

  begin

    default clock is rising_edge(Clk_i);

    -- Initial reset
    INITIAL_RESET : restrict {not Reset_n_i[*2]; Reset_n_i[+]}[*1];

    -- Asynchronous (unclocked) Reset asserts
    AFTER_RESET : process (all) is
    begin
      if (not Reset_n_i) then
        RESET_DOUT : assert Dout_o = (Dout_o'range => '0');
        RESET_OVFL : assert OverFlow_o = '0';
      end if;
    end process AFTER_RESET;

    ADD_OP : assert always Reset_n_i and Opc_i = c_add ->
      next unsigned(Dout_o) = unsigned(prev(DinA_i)) + unsigned(prev(DinB_i)) abort not Reset_n_i;

    SUB_OP : assert always Reset_n_i and Opc_i = c_sub ->
      next unsigned(Dout_o) = unsigned(prev(DinA_i)) - unsigned(prev(DinB_i)) abort not Reset_n_i;

    AND_OP : assert always Reset_n_i and Opc_i = c_and ->
      next Dout_o = (prev(DinA_i) and prev(DinB_i)) abort not Reset_n_i;

    OR_OP :  assert always Reset_n_i and Opc_i = c_or ->
      next Dout_o = (prev(DinA_i) or prev(DinB_i)) abort not Reset_n_i;

    OVERFLOW_ADD : assert always Reset_n_i and Opc_i = c_add and (unsigned(DinA_i) + unsigned(DinB_i)) < max(DinA_i, DinB_i) ->
      next OverFlow_o abort not Reset_n_i;

    NOT_OVERFLOW_ADD : assert always Reset_n_i and Opc_i = c_add and (unsigned(DinA_i) + unsigned(DinB_i)) >= max(DinA_i, DinB_i) ->
      next not OverFlow_o abort not Reset_n_i;

    OVERFLOW_SUB : assert always Reset_n_i and Opc_i = c_sub and (unsigned(DinA_i) - unsigned(DinB_i)) > unsigned(DinA_i) ->
      next OverFlow_o abort not Reset_n_i;

    NOT_OVERFLOW_SUB : assert always Reset_n_i and Opc_i = c_sub and (unsigned(DinA_i) - unsigned(DinB_i)) <= unsigned(DinA_i) ->
      next not OverFlow_o abort not Reset_n_i;

  end generate FormalG;


end architecture rtl;
