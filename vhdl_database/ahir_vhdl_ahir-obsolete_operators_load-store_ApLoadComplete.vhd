library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.LoadStorePack.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity ApLoadComplete is
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
    data: out StdLogicArray2D;
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
end ApLoadComplete;

architecture Behave of ApLoadComplete is
  
  alias lreq: BooleanArray(req'length-1 downto 0) is req;
  alias lack: BooleanArray(ack'length-1 downto 0) is ack;

  signal req_s, ack_s: std_logic_vector(req'length-1 downto 0);
  signal data_s: DWordArray2D(data'length(1)-1 downto 0, Max(width)-1 downto 0);

begin  -- Behave

  assert ack'length = req'length report "mismatched req/ack vectors" severity error;
  assert ack'length = width'length report "mismatched req-ack and width" severity error;
  assert data'length(2) = Max(width)*LAU report "mismatched width and data-row-length" severity error;

  -- conversions
  -- data_s to data
  process(data_s)
    variable dv : StdLogicArray2D(data'length(1)-1 downto 0, data'length(2)-1 downto 0);
    variable dvl : std_logic_vector(data'length(2)-1 downto 0);
    variable lw : std_logic_vector((Max(width)*LAU)-1 downto 0);
  begin
    for I in 0 to data'length-1 loop
      for J in 0 to Max(width)-1 loop
        lw(((J+1)*LAU)-1 downto J*LAU) := data_s(I,J);
      end loop;  -- J

      dvl := lw;
      Insert(dv,I,dvl);
    end loop;  -- I
    
    data <= dv;
  end process;

  -- req to req_s
  process(lreq)
  begin
    for I in 0 to lreq'length-1 loop
      if(lreq(I)) then
        req_s(I) <= '1';
      else
        req_s(I) <= '0';
      end if;
    end loop;  -- I
  end process;

  -- ack_s to ack
  process(ack_s)
  begin
    for I in 0 to ack_s'length-1 loop
      if(ack_s(I) = '1') then
        lack(I) <= true;
      else
        lack(I) <= false;        
      end if;
    end loop;  -- I
  end process;
  
  base : LoadCompleteBase
    generic map ( ignore_data => false,
                  width => width)
    port map (
      data  => data_s,
      req   => req_s,
      ack   => ack_s,
      mreq  => mreq,
      mack  => mack,
      mdata => mdata,
      mtag  => mtag,
      clk   => clk,
      reset => reset);    

end Behave;
