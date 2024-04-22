library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.LoadStorePack.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity ApStoreReqBase is
  generic (
    width: NaturalArray;
    suppress_immediate_ack: BooleanArray
    );
  port (
    addr : in StdLogicArray2D;
    data : in DWordArray2D;
    req : in BooleanArray;
    ack : out BooleanArray;
    mreq : out std_logic_vector;
    mack : in  std_logic_vector;
    maddr : out std_logic_vector;
    mdata : out std_logic_vector;    
    mtag : out std_logic_vector;
    clk : in std_logic;
    reset : in std_logic);
end ApStoreReqBase;

architecture Behave of ApStoreReqBase is
  
  constant request_width  : integer := Max(width);
  constant lwidth: NaturalArray(width'length-1 downto 0) := width;

  signal addr_reg, addr_in  : AWordArray(req'length-1 downto 0);


  
  signal addr_s : AWord;
  signal data_s : std_logic_vector(data'length(2)*LAU-1 downto 0);
  signal width_s : integer range 1 to request_width;


  type LWordArray  is array (natural range <>) of std_logic_vector(data_s'length-1 downto 0);
  signal data_in: LWordArray(data'length(1)-1 downto 0);
  
  signal req_s,ack_s : std_logic;

  constant tag_width : integer := mtag'length/request_width;
  signal tag_s : std_logic_vector(tag_width-1 downto 0);

  signal ssig, reqR,  ackR, eN, reqF, reqFreg: std_logic_vector(req'length-1 downto 0);
  signal req_fsm_state  : std_logic;
  signal there_is_a_request : std_logic;
  
  alias lreq: BooleanArray(req'length-1 downto 0) is req;
  alias lack: BooleanArray(ack'length-1 downto 0) is ack;

  alias lsia : BooleanArray(req'length-1 downto 0) is suppress_immediate_ack;
    
begin  -- Behave
  
  assert addr'length(2) = MAW report "address length not equal to MAW" severity error;
  assert ack'length = req'length report "mismatched req/ack vectors" severity error;
  assert ack'length = width'length report "mismatched req-ack and width" severity error;
  assert ack'length=addr'length(1) report "mismatched req-ack and addr(1)" severity error;
  assert suppress_immediate_ack'length=req'length report "mismatched req-ack and suppress generic" severity error;
  
  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  ProTx: for I in 0 to req'length-1 generate

    InputBlock: block
      signal data_reg: DWordArray(data'length(2)-1 downto 0);
    begin  -- block InputBlock


      P2L: block
        signal state : P2LState;
      begin  -- block P2L      
        Pulse_To_Level_Translate(suppr_imm_ack => lsia(I),
                                 rL => lreq(I),
                                 rR => reqR(I),
                                 aL => lack(I),
                                 aR => ackR(I),
                                 en => eN(I),
                                 state => state,
                                 clk => clk,
                                 reset => reset);
      end block P2L;
      
      process(clk)
        variable laddr: StdLogicArray2D(addr'length(1)-1 downto 0 , addr'length(2)-1 downto 0);
        variable ldata: DWordArray2D(data'length(1)-1 downto 0,data'length(2)-1 downto 0);
      begin
        
        if(clk'event and clk = '1') then
          if(eN(I) = '1') then
            laddr := addr;
            ldata := data;
            addr_reg(I) <=  Extract(laddr,I);
            for J in 0 to data'length(2)-1 loop
              data_reg(J) <=  ldata(I,J);
            end loop;
          end if;
        end if;
      end process;


      process(addr,addr_reg,en(I),data,data_reg)
        variable laddr: StdLogicArray2D(addr'length(1)-1 downto 0, addr'length(2)-1 downto 0);
        variable ldata: DWordArray2D(data'length(1)-1 downto 0,data'length(2)-1 downto 0);
        variable lword : std_logic_vector(data_s'length-1 downto 0);
      begin
        lword := (others => '0');
	if(en(I) = '1') then 
          laddr := addr;
          ldata := data;
          addr_in(I) <=  Extract(laddr,I);
          for J in 0 to data'length(2)-1 loop
            lword((J+1)*LAU-1 downto J*LAU) :=  ldata(I,J);
          end loop;
	else
          addr_in(I) <= addr_reg(I);
          for J in 0 to data'length(2)-1 loop
            lword((J+1)*LAU-1 downto J*LAU) :=  data_reg(J);
          end loop;
	end if;
        data_in(I) <= lword;
      end process;

    end block InputBlock;
  end generate ProTx;

  -----------------------------------------------------------------------------
  -- request handling
  -----------------------------------------------------------------------------
  RequestPriorityEncode(req_fsm_state => req_fsm_state,
                        clk => clk,
                        reset => reset,
                        reqR => reqR,
                        ackR => ackR,
                        reqF => reqF,
                        req_s => req_s,
                        ack_s => ack_s,
                        reqFreg => reqFreg);
  
  
  -----------------------------------------------------------------------------
  -- addr_s goes to StoreReqBase
  -----------------------------------------------------------------------------
  process(reqF,addr_in)
  begin
    addr_s <= (others => '0');
    for I in reqF'range loop
      if(reqF(I) = '1') then
        addr_s <= addr_in(I);
        exit;
      end if;
    end loop;  -- I
  end process;

  -----------------------------------------------------------------------------
  -- data_s goes to StoreReqBase
  -----------------------------------------------------------------------------
  process(data_in,reqF)
  begin
    data_s <= (others => '0');
    for I in reqF'range loop
	if(reqF(I) = '1') then
          data_s <= data_in(I);
          exit;
        end if;
    end loop;  -- I
  end process;
  
  -----------------------------------------------------------------------------
  -- width_s goes to StoreReqBase
  -----------------------------------------------------------------------------
  process(reqF)
  begin
    width_s <= 1;
    for I in reqF'range loop
      if(reqF(I) = '1') then
        width_s <= lwidth(I);
        exit;
      end if;
    end loop;  -- I
  end process;

  -----------------------------------------------------------------------------
  -- set tag_s to requester id.
  -----------------------------------------------------------------------------
  process(reqF)
  begin
    tag_s <= (others => '0');
    for I in reqF'range loop
      if(reqF(I) = '1') then
        tag_s <= To_SLV(To_Unsigned(I,tag_s'length));
        exit;
      end if;
    end loop;  -- I
  end process;

  -----------------------------------------------------------------------------
  -- base component instance
  -----------------------------------------------------------------------------
  base : StoreReqBase generic map (
    request_width => request_width,
    tag_width => tag_width)
    port map (
      addr  => addr_s,
      din  => data_s,
      width => width_s,
      req   => req_s,
      ack   => ack_s,
      tag   => tag_s,
      mreq  => mreq,
      mack  => mack,
      maddr => maddr,
      mdata => mdata,
      mtag  => mtag,
      clk   => clk,
      reset => reset);

end Behave;
