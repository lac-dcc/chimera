library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity OutputPort is
  generic(colouring : NaturalArray);
  port (
    req        : in  BooleanArray;
    ack        : out BooleanArray;
    data       : in  StdLogicArray2D;
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector;
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPort is
  alias lreq : BooleanArray(req'length-1 downto 0) is req;
  alias lack : BooleanArray(req'length-1 downto 0) is ack;

  signal reqR, ackR, eN : std_logic_vector(req'length-1 downto 0);
  signal reqF, reqFreg  : std_logic_vector(req'length-1 downto 0);
  signal req_fsm_state  : std_logic;

  type   OPWArray is array(integer range <>) of std_logic_vector(odata'range);
  signal data_array : OPWArray(data'length(1)-1 downto 0);

  constant no_arbitration : boolean := All_Entries_Same(colouring);
  
begin

  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  ProTx : for I in 0 to req'length-1 generate

    P2L : block
      signal state : P2LState;
    begin  -- block P2L
      Pulse_To_Level_Translate(suppr_imm_ack => true,
                               rL            => lreq(I),
                               rR            => reqR(I),
                               aL            => lack(I),
                               aR            => ackR(I),
                               en            => eN(I),
                               state         => state,
                               clk           => clk,
                               reset         => reset);

    end block P2L;
    
  end generate ProTx;

  -----------------------------------------------------------------------------
  -- request handling
  -----------------------------------------------------------------------------
  RequestPriorityEncode(req_fsm_state => req_fsm_state,
                        clk           => clk,
                        reset         => reset,
                        reqR          => reqR,
                        ackR          => ackR,
                        reqF          => reqF,
                        req_s         => oreq,
                        ack_s         => oack,
                        reqFreg       => reqFreg);

  -----------------------------------------------------------------------------
  -- data handlin
  -----------------------------------------------------------------------------
  process (data_array)
    variable var_odata : std_logic_vector(odata'range) := (others => '0');
  begin  -- process
    var_odata := (others => '0');
    for I in 0 to data'length(1) - 1 loop
      var_odata := data_array(I) or var_odata;
    end loop;  -- I
    odata <= var_odata;
  end process;

  gen : for I in data'length(1)-1 downto 0 generate

    ackR(I) <= reqF(I) and oack;

    data_array(I) <= Extract(data, I) when reqF(I) = '1' else (others => '0');
    
  end generate gen;

end Base;
