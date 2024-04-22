library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.LoadStorePack.all;
use ahir.Components.all;

entity ApIntStoreReq is
  generic (width: NaturalArray);
  port (
    -- addr/data organized into array
    -- one row per requester
    addr : in ApIntArray;
    data : in ApIntArray;
    -- req/ack follow pulse protocol.
    -- more than one req can be active
    -- however, fixed priority will be
    -- used to select
    req : in BooleanArray;
    ack : out BooleanArray;
    -- mreq/mack follow level protocol
    -- multiple mreqs are generated for
    -- each req.
    mreq : out std_logic_vector;
    mack : in  std_logic_vector;
    maddr : out std_logic_vector;
    mdata : out std_logic_vector;    
    -- mtag identifies the requester
    -- this unit must be matched with
    -- a corresponding ApStoreComplete
    -- with requesters ordered in the
    -- same manner
    mtag : out std_logic_vector;
    -- +ve edge of clk is used
    clk : in std_logic;
    -- synchronous reset, active high
    reset : in std_logic);
end ApIntStoreReq;

architecture Behave of ApIntStoreReq is
    signal data_slv: StdLogicArray2D(data'range(1), data'range(2));
    signal addr_slv: StdLogicArray2D(addr'range(1), addr'range(2));
    signal suppress_immediate_ack: BooleanArray(width'length - 1 downto 0) := (others => true);

begin  -- Behave
    data_slv <= To_StdLogicArray2D(data);

    base: ApStoreReq generic map (width => width, suppress_immediate_ack => suppress_immediate_ack)
	port map(req => req, 
		 ack => ack,
		 data => data_slv,
		 addr => addr,
		 mreq => mreq,
		 mack => mack,
		 mtag => mtag,
		 mdata => mdata,
		 maddr => maddr,
		 clk => clk,
		 reset => reset);
end Behave;
