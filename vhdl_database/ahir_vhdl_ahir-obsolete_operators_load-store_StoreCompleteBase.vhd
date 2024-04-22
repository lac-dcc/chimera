library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.LoadStorePack.all;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-------------------------------------------------------------------------------
-- protocol on both sides is level ready-ready
-------------------------------------------------------------------------------
entity StoreCompleteBase is
  generic (
    width: NaturalArray
    );
  port (
    req : in std_logic_vector;
    ack : out std_logic_vector;
    mreq : out std_logic_vector;
    mack : in  std_logic_vector;
    mtag : in std_logic_vector;
    clk : in std_logic;
    reset : in std_logic);
end StoreCompleteBase;

architecture Behave of StoreCompleteBase is
  
  signal mdata: std_logic_vector((LAU*Max(width))-1 downto 0);
  signal junkdata: DWordArray2D(width'length-1 downto 0, Max(width)-1 downto 0);
  
begin  -- Behave

  mdata <= (others => '0');

  base : LoadCompleteBase generic map (
    ignore_data => true,
    width       => width)
    port map (
      req   => req,
      ack   => ack,
      mreq  => mreq,
      mack  => mack,
      mtag  => mtag,
      mdata => mdata,
      data  => junkdata,
      clk   => clk,
      reset => reset);
  
end Behave;
