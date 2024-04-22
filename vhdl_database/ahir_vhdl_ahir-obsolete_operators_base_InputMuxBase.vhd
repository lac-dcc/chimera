library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity InputMuxBase is
  generic (
    colouring  : NaturalArray;
    suppress_immediate_ack: BooleanArray);
  port (
    -- req/ack follow pulse protocol
    -- arrays of length n
    reqL                 : in  BooleanArray;
    ackL                 : out BooleanArray;
    -- dataL is array(n,m) or array(2n,m)
    dataL                : in  StdLogicArray2D;
    -- reqR/ackR follow level protocol
    reqR                : out std_logic;
    ackR                : in  std_logic;
    -- dataR is array(1,m) or array(2,m)
    dataR               : out StdLogicArray2D;
    -- tag specifies the index of the
    -- operation which is selected
    tagR                : out std_logic_vector;
    clk, reset          : in std_logic);
end InputMuxBase;


architecture Behave of InputMuxBase is

  alias lreqL : BooleanArray(reqL'length-1 downto 0) is reqL;
  alias lackL : BooleanArray(reqL'length-1 downto 0) is ackL;  
  signal reqP,ackP,enP,ssig : std_logic_vector(reqL'length-1 downto 0);
  signal reqF,reqFreg : std_logic_vector(reqL'length-1 downto 0);  
  signal req_fsm_state: std_logic;

  type WordArray is array (natural range <>) of std_logic_vector(dataL'length(2)-1 downto 0);
  signal data_reg, dataP : WordArray(dataL'length(1)-1 downto 0);

  constant no_arbitration : boolean := All_Entries_Same(colouring);
  constant tag0 : std_logic_vector(tagR'length-1 downto 0) := (others => '0');

  alias lsia : BooleanArray(reqL'length-1 downto 0) is suppress_immediate_ack;

begin  -- Behave

  -----------------------------------------------------------------------------
  -- pulse to level translate
  -----------------------------------------------------------------------------
  P2L: for I in reqL'length-1 downto 0 generate
      P2LBlk: block
        signal state : P2LState;
      begin  -- block P2L          
        Pulse_To_Level_Translate(suppr_imm_ack => lsia(I),
                                 rL => lreqL(I), rR => reqP(I), aL => lackL(I), aR => ackP(I),
                                 en => enP(I), state => state, clk => clk, reset => reset);
      end block P2LBlk;

    Twin: if dataR'length(1) = 2 generate

      process(clk)
         variable t : StdLogicArray2D(dataL'length(1)-1 downto 0, dataL'length(2)-1 downto 0);
      begin
        if(clk'event and clk = '1') then
          if(enP(I) = '1') then
        	t := dataL;
        	for J in 0 to dataL'length(2)-1  loop
          	data_reg(I)(J) <= t(I,J);
          	data_reg(I+reqL'length)(J) <= t(I+reqL'length,J);
        	end loop;  -- J
	  end if;
        end if;
      end process;

      process(enP(I),data_reg(I), dataL)
        variable t : StdLogicArray2D(dataL'length(1)-1 downto 0, dataL'length(2)-1 downto 0);      
      begin
        if(enP(I) = '0') then
          dataP(I) <= data_reg(I);
          dataP(I+reqL'length) <= data_reg(I+reqL'length);
        else
          t := dataL;
          for J in 0 to dataL'length(2)-1  loop
            dataP(I)(J) <= t(I,J);
            dataP(I+reqL'length)(J) <= t(I+reqL'length,J);
          end loop;  -- J
        end if;
      end process;
    end generate Twin;


    Single: if dataR'length(1) = 1 generate
      process(clk)
         variable t : StdLogicArray2D(dataL'length(1)-1 downto 0, dataL'length(2)-1 downto 0);
      begin
        if(clk'event and clk = '1') then
          if(enP(I) = '1') then
        	t := dataL;
        	for J in 0 to dataL'length(2)-1  loop
          	  data_reg(I)(J) <= t(I,J);
        	end loop;  -- J
	  end if;
        end if;
      end process;

      process(enP(I),data_reg(I), dataL)
        variable t : StdLogicArray2D(dataL'length(1)-1 downto 0, dataL'length(2)-1 downto 0);      
      begin
        if(enP(I) = '0') then
          dataP(I) <= data_reg(I);
        else
          t := dataL;
          for J in 0 to dataL'length(2)-1  loop
            dataP(I)(J) <= t(I,J);
          end loop;  -- J
        end if;
      end process;
    end generate Single;

  end generate P2L;


  -----------------------------------------------------------------------------
  -- priority encoding or pass through
  -----------------------------------------------------------------------------
  NoArbitration: if no_arbitration generate
    reqF <= reqP;
    reqR <= OrReduce(reqF);
    ackP <= reqF when ackR = '1' else (others => '0');
  end generate NoArbitration;

  Arbitration: if not no_arbitration generate
    RequestPriorityEncode(req_fsm_state => req_fsm_state,
                            clk => clk,
                            reset => reset,
                            reqR => reqP,
                            ackR => ackP,
                            reqF => reqF,
                            req_s => reqR,
                            ack_s => ackR,
                            reqFreg => reqFreg);
  end generate Arbitration;

  -----------------------------------------------------------------------------
  -- final multiplexor
  -----------------------------------------------------------------------------
  Twin: if dataR'length(1) = 2 generate
    -- multiplexor
    process(reqF,dataP)
      variable t : StdLogicArray2D(1 downto 0, dataR'length(2)-1 downto 0);            
    begin
      t := (others => (others => '0'));
      for J in 0 to (dataL'length(1)/2)-1 loop
	  -- had to split the two insert calls 
	  -- to support Xilinx ISE 11.3 synthesis
        if(reqF(J) = '1') then
          Insert(t,0,dataP(J));
        end if;
        if(reqF(J) = '1') then
          Insert(t,1,dataP(J+(dataL'length(1)/2)));          
        end if;
      end loop;  -- J
      dataR <= t;
    end process;    
  end generate Twin;

  Single: if dataR'length(1) = 1 generate
    process(reqF,dataP)
      variable t : StdLogicArray2D(0 downto 0, dataR'length(2)-1 downto 0);            
    begin
      t := (others => (others => '0'));
      for J in 0 to dataL'length(1)-1 loop
        if(reqF(J) = '1') then
          Insert(t,0,dataP(J));
        end if;
      end loop;  -- J
      dataR <= t;
    end process;    
  end generate Single;

  -----------------------------------------------------------------------------
  -- tag generation
  -----------------------------------------------------------------------------
    process(reqF)
    begin
      tagR <= tag0;
      for J in reqF'range loop
        if(reqF(J) = '1') then
          tagR <= To_SLV(To_Unsigned(J,tagR'length));
        end if;
      end loop;  -- J
    end process;
  
end Behave;
