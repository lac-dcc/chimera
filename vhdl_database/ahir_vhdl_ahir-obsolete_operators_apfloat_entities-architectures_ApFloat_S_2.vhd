library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity ApFloat_S_2 is
  generic (colouring : NaturalArray);
  port (x, y       : in  ApFloatArray;
        clk, reset : in  std_logic;
        reqR, reqC : in  BooleanArray;
        ackR, ackC : out BooleanArray;
        z          : out ApFloatArray);
end entity;

architecture Base of ApFloat_S_2 is

  signal   xT            : StdLogicArray2D(x'length(1) -1 downto 0, x'high(2) downto x'low(2));
  signal   yT            : StdLogicArray2D(y'length(1) -1 downto 0, y'high(2) downto y'low(2));
  signal   xStackyT      : StdLogicArray2D(x'length(1)+y'length(1)-1 downto 0, x'high(2) downto x'low(2));
  signal   zT            : StdLogicArray2D(z'length(1) -1 downto 0, z'high(2) downto z'low(2));
  constant const_operand : IStdLogicVector(x'high(2) downto x'low(2)) := (others => '0');
  constant suppr_imm_ack : BooleanArray(reqR'length-1 downto 0) := (others => false);  
begin  -- Base

  assert x'length(1) = y'length(1) and z'length(1) = x'length(1) and x'length(2) = y'length(2) and z'length(2) = x'length(2)
    report "length mismatch in ApFloat_S_2" severity error;
  
  xT       <= To_StdLogicArray2D(x);
  yT       <= To_StdLogicArray2D(y);
  xStackyT <= Stack(xT, yT);
  z        <= To_ApFloatArray(zT);

  op : OperatorShared  -- remaining generics will be set through a configuration
    generic map (
      operator_id   => "Null",
      const_operand => const_operand,
      use_constant  => false,
      colouring     => colouring,
      suppress_immediate_ack => suppr_imm_ack)
    port map (
      reqL  => reqR,
      ackL  => ackR,
      reqR  => reqC,
      ackR  => ackC,
      dataL => xStackyT,
      dataR => zT,
      clk   => clk,
      reset => reset);
end Base;
