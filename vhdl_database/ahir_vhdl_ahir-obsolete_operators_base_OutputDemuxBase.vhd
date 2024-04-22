library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity OutputDeMuxBase is
  generic (
    colouring  : NaturalArray;
    pulse_ack_dominant: boolean := false);
  port (
    -- req/ack follow level protocol
    reqL                 : in  std_logic;
    ackL                 : out std_logic;
    dataL                : in  std_logic_vector;
    -- tag identifies index to which demux
    -- should happen
    tagL                 : in std_logic_vector;
    -- reqR/ackR follow pulse protocol
    -- and are of length n
    reqR                : in BooleanArray;
    ackR                : out  BooleanArray;
    -- dataR is array(n,m) 
    dataR               : out StdLogicArray2D;
    clk, reset          : in std_logic);
end OutputDeMuxBase;

architecture Behave of OutputDeMuxBase is

  alias lreqR : BooleanArray(reqR'length-1 downto 0) is reqR;
  alias lackR : BooleanArray(reqR'length-1 downto 0) is ackR;
  signal ackR_sig : BooleanArray(reqR'length-1 downto 0);
  signal reqRreg, reqRfinal_pre_arb, reqRfinal, valid : std_logic_vector(reqR'length-1 downto 0);

  type WordArray is array (natural range <>) of std_logic_vector(dataR'length(2)-1 downto 0);
  signal dreg, dfinal : WordArray(dataR'length(1)-1 downto 0);

  signal ackL_sig : std_logic;
  constant no_arbitration : boolean := All_Entries_Same(colouring);
  
begin  -- Behave

  -----------------------------------------------------------------------------
  -- reqRfinal
  -----------------------------------------------------------------------------
  NoArb: if no_arbitration generate
     reqRfinal <= reqRfinal_pre_arb;
  end generate NoArb;

  Arb: if not no_arbitration generate
     reqRfinal <= PriorityEncode(reqRfinal_pre_arb);
  end generate Arb;
 

  -----------------------------------------------------------------------------
  -- dataR
  -----------------------------------------------------------------------------
  process(dfinal)
     variable v: StdLogicArray2D(dataR'length(1)-1 downto 0, dataR'length(2)-1 downto 0);
  begin
     for I in dfinal'range loop
	for J in 0 to dataR'length(2)-1 loop
  		v(I,J) := dfinal(I)(J);
	end loop;
     end loop;
     dataR <= v; 
  end process;

  -----------------------------------------------------------------------------
  -- parallel generate across all requesters
  -----------------------------------------------------------------------------
  PGen: for I in lreqR'range generate

    ---------------------------------------------------------------------------
    -- valid true if this I is mentioned in tag
    ---------------------------------------------------------------------------
    valid(I) <= '1' when (tagL = To_SLV(To_Unsigned(I,tagL'length))) else '0';

    ---------------------------------------------------------------------------
    -- set/clear pulse request from right
    ---------------------------------------------------------------------------
    process(clk,reset,lreqR,ackR_sig)
      variable set,clear : boolean;
    begin
      set := lreqR(I);
      clear := (reset = '1') or ackR_sig(I);
      
      if(clk'event and clk = '1') then
        if(clear) then
          reqRreg(I) <= '0';
        elsif set then
          reqRreg(I) <= '1';
        end if;
      end if;
    end process;

    reqRfinal_pre_arb(I) <= '1' when (lreqR(I) or (reqRreg(I) = '1') ) and (valid(I) = '1') else '0';

    ---------------------------------------------------------------------------
    -- data register/mux
    ---------------------------------------------------------------------------
    process(clk,reqRfinal(I),reqL,ackL_sig,dataL,dreg(I),reset)

      variable latch : boolean;
      variable ldataL : std_logic_vector(dataL'length-1 downto 0);
      
    begin

      -------------------------------------------------------------------------
      -- request is pending at I and I is valid and there is
      -- a request from the right which has been acknowledged
      -------------------------------------------------------------------------
      latch :=  (reqRfinal(I) = '1')  and (reqL = '1') and (ackL_sig = '1') and (reset = '0');
      ldataL := dataL;

      if(latch) then
        for C in 0 to ldataL'length-1 loop
          dfinal(I)(C) <= ldataL(C);
        end loop;  -- C        
      else
        dfinal(I) <= dreg(I);
      end if;

      if(clk'event and clk = '1') then
        if(latch) then
          -- fill the appropriate data register
          for C in 0 to ldataL'length-1 loop
            dreg(I)(C) <= ldataL(C);
          end loop;  -- C
        end if;
      end if;
      ackR_sig(I) <= latch;
    end process;
  end generate PGen;

  -----------------------------------------------------------------------------
  -- ackR
  -----------------------------------------------------------------------------
  lackR <= ackR_sig;
  
  -----------------------------------------------------------------------------
  -- ackL
  -----------------------------------------------------------------------------
  ackL_sig <= reqL and OrReduce(reqRfinal);
  ackL <= ackL_sig;


end Behave;
