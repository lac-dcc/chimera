library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.LoadStorePack.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;


entity ApLoadReq is
  generic (
    -- width of each request
    width: NaturalArray;
    suppress_immediate_ack : BooleanArray
    );
  port (
    -- one address per requester 
    addr : in ApIntArray;
    -- req/ack follow pulse protocol
    -- more than one req may be active
    -- and the unit uses fixed priority
    -- arbitration to resolve.
    req : in BooleanArray;
    ack : out BooleanArray;
    -- mreq/mack level protocol to
    -- memory.  For each request,
    -- multiple requests are made to
    -- memory
    mreq : out std_logic_vector;
    mack : in  std_logic_vector;
    maddr : out std_logic_vector;
    -- mtag is generated to identify
    -- requester.  ApLoadReq must be
    -- matched with the corresponding 
    -- LoadComplete with requesters ordered 
    -- in the same way
    mtag : out std_logic_vector;
    -- +ve edge of clk is used
    clk : in std_logic;
    -- synchronous reset, active high
    reset : in std_logic);
end ApLoadReq;

architecture Behave of ApLoadReq is
  
  constant request_width  : integer := Max(width);
  constant lwidth : NaturalArray(width'length-1 downto 0) := width;

  signal addr_reg, addr_in : AWordArray(req'length-1 downto 0);
  signal addr_s : AWord;

  signal width_s : integer range 1 to request_width;

  signal req_s,ack_s : std_logic;

  signal ssig, reqR,  ackR, eN, reqF, reqFreg: std_logic_vector(req'length-1 downto 0);
  
  alias lreq: BooleanArray(req'length-1 downto 0) is req;
  alias lack: BooleanArray(ack'length-1 downto 0) is ack;

  signal req_fsm_state  : std_logic;
  signal there_is_a_request : std_logic;

  constant lsia : BooleanArray(req'length-1 downto 0) := suppress_immediate_ack;
  
  constant tag_width : integer := mtag'length/request_width;
  signal tag_s : std_logic_vector(tag_width-1 downto 0);
  
begin  -- Behave
  
  assert addr'length(2) = MAW report "address length not equal to MAW" severity error;
  assert ack'length = req'length report "mismatched req/ack vectors" severity error;
  assert ack'length = width'length report "mismatched req-ack and width" severity error;
  assert ack'length=addr'length(1) report "mismatched req-ack and addr(1)" severity error;
  assert suppress_immediate_ack'length=req'length report "mismatched req-ack and suppress generic" severity error;
  assert tag_width*request_width = mtag'length report "Tag length is messed up!" severity error;
  assert 2**tag_width >= req'length report "insufficient tag width" severity error;
  
  
  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  ProTx: for I in 0 to req'length-1 generate

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
       variable laddr: StdLogicArray2D(addr'length(1)-1 downto 0, addr'length(2)-1 downto 0);
    begin
      if(clk'event and clk = '1') then
	if (eN(I) = '1') then
        	laddr := to_stdlogicarray2d(addr);
        	addr_reg(I) <=  Extract(laddr,I);
      	end if;
      end if;
    end process;

    process(addr,addr_reg,en(I))
       variable laddr: StdLogicArray2D(addr'length(1)-1 downto 0, addr'length(2)-1 downto 0);
    begin
        if(en(I) = '1') then 
        	laddr := to_stdlogicarray2d(addr);
    		addr_in(I) <=  Extract(laddr,I);
	else
                addr_in(I) <= addr_reg(I);
	end if;
    end process;

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
  -- addr_s goes to LoadReqBase
  -----------------------------------------------------------------------------
  process(reqF,addr_in)
  begin
    addr_s <= (others => '0');
    for I in reqF'range loop
      if(reqR(I) = '1') then
        addr_s <= addr_in(I);
        exit;
      end if;
    end loop;  -- I
  end process;

  -----------------------------------------------------------------------------
  -- width_s goes to LoadReqBase
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
  base : LoadReqBase generic map (
    request_width => request_width,
    tag_width => tag_width)
    port map (
      addr  => addr_s,
      width => width_s,
      req   => req_s,
      ack   => ack_s,
      tag   => tag_s,
      mreq  => mreq,
      mack  => mack,
      maddr => maddr,
      mtag  => mtag,
      clk   => clk,
      reset => reset);

end Behave;
