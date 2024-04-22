library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity ApInt_S_2_C is
  generic (const_operand: ApInt; colouring: NaturalArray);
  port (x: in ApIntArray;
        clk,reset: in std_logic;
        reqR,reqC: in BooleanArray;
        ackR,ackC: out BooleanArray;
        z: out ApIntArray);
end entity;

architecture Base of ApInt_S_2_C is

  signal xT : StdLogicArray2D(x'length(1) -1 downto 0, x'length(2)-1 downto 0);
  signal zT : StdLogicArray2D(z'length(1) -1 downto 0, z'high(2) downto z'low(2));
  constant suppr_imm_ack : BooleanArray(reqR'length-1 downto 0) := (others => false);  
begin  -- Base

  assert  z'length(1) = x'length(1) and x'length(2) = const_operand'length
    report "length mismatch in ApInt_S_2_C" severity error;
  
  xT <= To_StdLogicArray2D(x);
  z  <= To_ApIntArray(zT);
  
  op: OperatorShared                    -- generics zero_delay and operator_id
                                        -- will be set through configuration
    generic map (operator_id => "Null",
                 colouring => colouring,
                 const_operand => To_ISLV(const_operand),
                 use_constant => true,
                 suppress_immediate_ack => suppr_imm_ack)
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
