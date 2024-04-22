library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.LoadStorePack.all;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity StoreReqBase is
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
end StoreReqBase;

architecture Behave of StoreReqBase is

  signal val_index, mack_reg,mack_sig : std_logic_vector(request_width-1 downto 0);
  signal ack_sig : std_logic;

begin  -- Behave

  
  splitgen: for I in 0 to request_width-1 generate
    
    val_index(I) <= '1' when I <= width-1 else '0';

    mdata(((I+1)*LAU)-1 downto I*LAU) <= din(((I+1)*LAU)-1 downto I*LAU);
    maddr(((I+1)*MAW)-1 downto I*MAW) <= To_SLV(To_Unsigned(addr) + I);

    mreq(I) <= req and (not mack_reg(I)) when val_index(I)='1' else '0';
    mtag(((I+1)*TAG_WIDTH)-1 downto I*TAG_WIDTH) <= tag;

    process(clk)
    begin
      if(clk'event and clk = '1') then
        if(reset = '1' or ack_sig = '1') then
          mack_reg(I) <= '0';
        elsif mack(I) = '1' then
          mack_reg(I) <= '1';
        end if;
      end if;
    end process;
          
    mack_sig(I) <= (mack(I) or mack_reg(I)) when val_index(I) = '1' else '1';

  end generate splitgen;

  ack_sig <= AndReduce(mack_sig);
  ack <= ack_sig;
  
end Behave;
