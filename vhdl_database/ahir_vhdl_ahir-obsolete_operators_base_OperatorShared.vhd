library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity OperatorShared is
  generic
    (
      operator_id : string;
      const_operand : IStdLogicVector;
      use_constant   : boolean := false;
      zero_delay : boolean := false;
      colouring : NaturalArray;
      suppress_immediate_ack : BooleanArray
    );
  port (
    -- req/ack follow level protocol
    reqL                     : in BooleanArray;
    ackR                     : out BooleanArray;
    ackL                     : out BooleanArray;
    reqR                     : in  BooleanArray;
    -- data is array(n,m) or array(2n,m)
    dataL                    : in StdLogicArray2D;
    dataR                    : out StdLogicArray2D;
    -- with dataR
    clk, reset              : in std_logic);
end OperatorShared;





architecture Vanilla of OperatorShared is

  constant num_operands : integer := dataL'length(1)/reqL'length;
  constant ignore_tag  : boolean := All_Entries_Same(colouring) or (reqL'length = 1);

  -- NOTE: the following combination is not allowed
  --       zero_delay = true and ignore_tag = false and reqL'length =1
  --       because it leads to a zero-delay cycle inside the shared operator 
  --
  -- THUS: if an operator is shared by mutually non-exclusive requesters,
  --       (non-compatible operators), then it CANNOT be zero_delay.
  --       This is explicitly blocked out by using the following constant
  constant use_zero_delay : boolean := zero_delay and ((reqL'length = 1) or ignore_tag);
  signal idata : StdLogicArray2D(num_operands-1 downto 0, dataL'high(2) downto dataL'low(2));  
  signal odata_islv: IStdLogicVector(dataR'high(2) downto dataR'low(2));
  signal odata_slv: std_logic_vector(dataR'length(2)-1 downto 0);

  constant tag_length: integer := Ceil_Log2(reqL'length);
  signal itag,otag : std_logic_vector(tag_length-1 downto 0);
  signal ireq,iack, oreq, oack: std_logic;

  
begin  -- Behave
  assert ackL'length = reqL'length report "mismatched req/ack vectors" severity error;
  assert suppress_immediate_ack'length=reqL'length report "mismatched req-ack and suppress generic" severity error;
  
  assert (not zero_delay) or use_zero_delay
    report "Zero delay flag ignored for shared operators which are not exclusive " severity warning;
  
  imux: InputMuxBase
    generic map (
      colouring  => colouring,
      suppress_immediate_ack => suppress_immediate_ack)
    port map(
      reqL       => reqL,
      ackL       => ackL,
      reqR       => ireq,
      ackR       => iack,
      dataL      => dataL,
      dataR      => idata,
      tagR       => itag,
      clk        => clk,
      reset      => reset);

  op: OperatorBase
    generic map (
      operator_id => operator_id,
      const_operand => const_operand,
      use_constant => use_constant,
      zero_delay  => use_zero_delay)
    port map (
      reqL => ireq,
      ackL => iack,
      reqR => oreq,
      ackR => oack,
      dataL => idata,
      dataR => odata_islv,
      tagR => otag,
      tagL => itag,
      clk => clk,
      reset => reset);

odata_slv <= to_SLV(odata_islv);

  odemux: OutputDeMuxBase
    generic map (
      colouring  => colouring)
    port map (
      reqL   => oreq,
      ackL   => oack,
      dataL => odata_slv,
      tagL  => otag,
      reqR  => reqR,
      ackR  => ackR,
      dataR => dataR,
      clk   => clk,
      reset => reset);
  
end Vanilla;

