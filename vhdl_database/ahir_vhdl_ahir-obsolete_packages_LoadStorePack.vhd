
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

package LoadStorePack is

  constant lau : integer := 8;
  constant maw : integer := 16;
  constant mtw : integer := 8;

  subtype AWord is std_logic_vector(1 to maw);
  subtype DWord is std_logic_vector(1 to LAU);
  subtype TWord is std_logic_vector(1 to MTW);

  type AWordArray is array (natural range <>) of AWord;
  type DWordArray is array (natural range <>) of DWord;
  type TWordArray is array (natural range <>) of TWord;

  type DWordArray2D is array (natural range <>, natural range <>) of DWord;  

  -----------------------------------------------------------------------------
  -- load-store base components
  -----------------------------------------------------------------------------
  component LoadReqBase is
                          generic (
                            request_width : integer;                -- as a multiple of LAU
                            tag_width : integer
                            );
                        port (
                          addr : in std_logic_vector(MAW-1 downto 0);
                          width: in integer range 1 to request_width*lau;    
                          req : in std_logic;
                          ack : out std_logic;
                          tag: in std_logic_vector(tag_width-1 downto 0);
                          mreq : out std_logic_vector(request_width-1 downto 0);
                          mack : in  std_logic_vector(request_width-1 downto 0);
                          maddr : out std_logic_vector((maw*request_width)-1 downto 0);
                          mtag : out std_logic_vector((tag_width*request_width)-1 downto 0);
                          clk : in std_logic;
                          reset : in std_logic);
  end component LoadReqBase;
  
  component StoreReqBase 
    generic (
      request_width : natural;                -- as a multiple of LAU
      tag_width : integer
      );
    port (
      din : in std_logic_vector((request_width*LAU)-1 downto 0);
      addr : in std_logic_vector(MAW-1 downto 0);
      width: in integer range 1 to request_width*lau;
      tag: in std_logic_vector(tag_width-1 downto 0);
      req : in std_logic;
      ack : out std_logic;
      mreq : out std_logic_vector(request_width-1 downto 0);
      mack : in  std_logic_vector(request_width-1 downto 0);
      mdata: out std_logic_vector((request_width*lau)-1 downto 0);
      maddr : out std_logic_vector((maw*request_width)-1 downto 0);
      mtag : out std_logic_vector((tag_width*request_width)-1 downto 0);
      clk : in std_logic;
      reset : in std_logic);
  end component StoreReqBase;
  
  component ApStoreReqBase is
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
  end component ApStoreReqBase;


  component LoadCompleteBase 
    generic (
      ignore_data: boolean := false;
      width: NaturalArray
      );
    port (
      req : in std_logic_vector;
      ack : out std_logic_vector;
      data: out DWordArray2D;
      mreq : out std_logic_vector;
      mack : in  std_logic_vector;
      mtag : in std_logic_vector;
      mdata: in std_logic_vector;
      clk : in std_logic;
      reset : in std_logic);
  end component LoadCompleteBase;


  component StoreCompleteBase 
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
  end component StoreCompleteBase;

end LoadStorePack;

