library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.LoadStorePack.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity ApStoreReq is
  generic (width: NaturalArray; suppress_immediate_ack : BooleanArray);
  port (
    -- addr/data organized into array
    -- one row per requester
    addr : in ApIntArray;
    data : in StdLogicArray2D;
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
end ApStoreReq;

architecture behave of ApStoreReq is

  signal data_s : DWordArray2D(data'length(1)-1 downto 0, Max(width)-1 downto 0);
  signal ldata: StdLogicArray2D(data'length(1)-1 downto 0, data'length(2)-1 downto 0);

  signal addr_slv : StdLogicArray2D(addr'range(1), addr'range(2));

begin  -- behave

  ldata <= data;
  addr_slv <= To_StdLogicArray2D(addr);

  -----------------------------------------------------------------------------
  -- conversions
  -----------------------------------------------------------------------------
  -- from data to data_s
  process(ldata)
    variable lw : std_logic_vector((Max(width)*LAU)-1 downto 0);
  begin
    for I in 0 to data'length(1)-1 loop
      lw := Extract(ldata,I);      
      for K in 0 to Max(width)-1 loop
        data_s(I,K) <= lw(((K+1)*LAU)-1 downto K*LAU);
      end loop;  -- K
    end loop;  -- I
  end process;

  -----------------------------------------------------------------------------
  -- base instance
  -----------------------------------------------------------------------------
  base : ApStoreReqBase generic map (
    width => width,
    suppress_immediate_ack => suppress_immediate_ack)
    port map (
      addr  => addr_slv,
      data  => data_s,
      req   => req,
      ack   => ack,
      mreq  => mreq,
      mack  => mack,
      maddr => maddr,
      mdata => mdata,
      clk   => clk,
      reset => reset,
      mtag  => mtag);
    

end behave;
