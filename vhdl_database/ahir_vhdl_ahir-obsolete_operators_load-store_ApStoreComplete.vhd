library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.LoadStorePack.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity ApStoreComplete is
  generic (
    -- width of requests
    width: NaturalArray
    );
  port (
    -- in requester array, pulse protocol
    -- more than one requester can be active
    -- at any time
    req : in BooleanArray;
    -- out ack array, pulse protocol
    -- more than one ack can be sent back
    -- at any time.
    --
    -- Note: req -> ack delay can be 0
    ack : out BooleanArray;
    -- mreq goes out to memory as 
    -- a response to mack.
    mreq : out std_logic_vector;
    mack : in  std_logic_vector;
    -- mtag to distinguish the 
    -- requesters.
    mtag : in std_logic_vector;
    -- rising edge of clock is used
    clk : in std_logic;
    -- synchronous reset, active high
    reset : in std_logic);
end ApStoreComplete;

architecture Behave of ApStoreComplete is

  alias lreq: BooleanArray(req'length-1 downto 0) is req;
  alias lack: BooleanArray(ack'length-1 downto 0) is ack;

  signal req_s, ack_s: std_logic_vector(req'length-1 downto 0);
begin  -- Behave

  assert ack'length = req'length report "mismatched req/ack vectors" severity error;
  assert ack'length = width'length report "mismatched req-ack and width" severity error;

  -- conversions
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
  
  base : StoreCompleteBase
    generic map (width => width)
    port map (
      req   => req_s,
      ack   => ack_s,
      mreq  => mreq,
      mack  => mack,
      mtag  => mtag,
      clk   => clk,
      reset => reset);
  
end Behave;
