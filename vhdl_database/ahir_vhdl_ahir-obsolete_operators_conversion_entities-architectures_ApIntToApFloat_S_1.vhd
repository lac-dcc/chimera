library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity ApIntToApFloat_S_1 is
  generic(colouring: NaturalArray);
  port (x: in ApIntArray;
        clk,reset: in std_logic;
        reqR,reqC: in BooleanArray;
        ackR,ackC: out BooleanArray;
        z: out ApFloatArray);
end entity;

architecture Base of ApIntToApFloat_S_1 is
  signal xT : StdLogicArray2D(x'length(1) -1 downto 0, x'high(2) downto x'low(2));
  signal zT : StdLogicArray2D(z'length(1) -1 downto 0, z'high(2) downto z'low(2));
  constant const_operand : IStdLogicVector(x'high(2) downto x'low(2)) := (others => '0');
  constant suppr_imm_ack : BooleanArray(reqR'length-1 downto 0) := (others => false);  
begin  -- Base

  
  xT <= To_StdLogicArray2D(x);
  z  <= To_ApFloatArray(zT);
  
  op: OperatorShared                    -- generics zero_delay and operator_id
                                        -- will be set through a configuration
    generic map (
      operator_id => "Null",
      const_operand => const_operand,
      colouring => colouring,
      use_constant => false,
      suppress_immediate_ack => suppr_imm_ack
                 )
    port map (
      reqL  => reqR,
      ackL  => ackR,
      reqR  => reqC,
      ackR  => ackC,
      dataL => xT,
      dataR => zT,
      clk   => clk,
      reset => reset);
end Base;
