library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity OutputPortLevel is
  generic(colouring: NaturalArray);
  port (
    req       : in  std_logic_vector;
    ack       : out std_logic_vector;
    data      : in  StdLogicArray2D;
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector;
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPortLevel is
  alias lreq : std_logic_vector(req'length-1 downto 0) is req;
  alias lack : std_logic_vector(req'length-1 downto 0) is ack;  
  
  type OPWArray is array(integer range <>) of std_logic_vector(odata'range);
  signal data_array : OPWArray(data'length(1)-1 downto 0);
  signal req_active, ack_sig  : std_logic_vector(data'length(1)-1 downto 0); 
  
  constant no_arbitration: boolean := All_Entries_Same(colouring);
  
begin
  
  oreq <= OrReduce(req_active);

  NoArb: if no_arbitration generate
     req_active <= lreq;
  end generate NoArb;

  Arb: if not no_arbitration generate
     req_active <= PriorityEncode(lreq);
  end generate Arb;

  process (data_array)
    variable var_odata : std_logic_vector(odata'range) := (others => '0');
  begin  -- process
    var_odata := (others => '0');
    for I in 0 to data'length(1) - 1 loop
      var_odata := data_array(I) or var_odata;
    end loop;  -- I
    odata <= var_odata;
  end process;

  gen: for I in data'length(1)-1 downto 0 generate

       ack_sig(I) <= req_active(I) and oack; 
 
       lack(I) <= ack_sig(I);

       data_array(I) <= Extract(data, I) when req_active(I) = '1' else (others => '0');
         
  end generate gen;

end Base;
