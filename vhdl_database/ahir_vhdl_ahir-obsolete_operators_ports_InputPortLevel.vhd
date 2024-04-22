library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity InputPortLevel is
  
  generic (colouring: NaturalArray);
  port (
    -- ready/ready interface with the requesters
    req       : in  std_logic_vector;
    ack       : out std_logic_vector;
    data      : out StdLogicArray2D;
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector;
    clk, reset : in  std_logic);
  
end InputPortLevel;

architecture default_arch of InputPortLevel is

  alias lreq : std_logic_vector(req'length-1 downto 0) is req;
  alias lack : std_logic_vector(req'length-1 downto 0) is ack;  
  
  type IPWArray is array(integer range <>) of std_logic_vector(odata'range);
  signal data_final, data_reg : IPWArray(data'length(1)-1 downto 0);
  signal req_active, ack_sig  : std_logic_vector(data'length(1)-1 downto 0); 
  
  constant no_arbitration: boolean := All_Entries_Same(colouring);
  
begin  -- default_arch

  oreq <= OrReduce(req_active);

  NoArb: if no_arbitration generate
    req_active <= lreq;
  end generate NoArb;

  Arb: if not no_arbitration generate
    req_active <= PriorityEncode(lreq);
  end generate Arb;

  process(data_final)
    variable ldata: StdLogicArray2D(data'length(1)-1 downto 0, data'length(2)-1 downto 0);
  begin
    for J in data'length(1)-1 downto 0 loop
      Insert(ldata,J,data_final(J));
    end loop;
    data <= ldata;
  end process;

  gen: for I in data'length(1)-1 downto 0 generate

    ack_sig(I) <= req_active(I) and oack; 
    
    lack(I) <= ack_sig(I);
    
    data_final(I) <= odata when ack_sig(I) = '1' else (others => '0');
    
  end generate gen;

end default_arch;
