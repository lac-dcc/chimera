library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.LoadStorePack.all;
use ahir.Components.all;

entity ApFloatLoadComplete is
  generic (
    width: NaturalArray
    );
  port (
    -- req/ack follow pulse protocol
    -- multiple reqs may be active
    -- req->ack delay can be 0
    req : in BooleanArray;
    ack : out BooleanArray;
    -- one row per requester.
    -- data will be registered and 
    -- overwritten when next load to
    -- same requester is completed.
    -- NOTE: the user must guarantee
    -- that data is not overwritten
    -- prematurely (same requester is
    -- not retriggered before data is
    -- used).
    data: out ApFloatArray;
    -- mack -> mreq, level protocol
    -- will not overwrite data register
    -- unless ack pulse has been released.
    -- one cycle delay mack -> ack
    mreq : out std_logic_vector;
    mack : in  std_logic_vector;
    -- id of request 
    -- this unit must have a matching
    -- ApLoadReq
    mtag : in std_logic_vector;
    mdata: in std_logic_vector;
    -- +ve edge 
    clk : in std_logic;
    -- synchronous, active high
    reset : in std_logic);
end ApFloatLoadComplete;

architecture Behave of ApFloatLoadComplete is
    signal data_slv: StdLogicArray2D(data'high(1) downto data'low(1), data'high(2) downto data'low(2));
begin  -- Behave
    data <= To_ApFloatArray(data_slv);

    base: ApLoadComplete generic map (width => width)
	port map(req => req, 
		 ack => ack,
       data => data_slv,
		 mreq => mreq,
		 mack => mack,
		 mtag => mtag,
		 mdata => mdata,
		 clk => clk,
		 reset => reset);
end Behave;
