library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity dpram_5X4 is
   port(       AB,A2  : in std_logic_vector(4 downto 0);
      I1,I2  : in std_logic_vector(3 downto 0);
      CE1,CE2,CSB1,CSB2,WEBB,WEB2: in std_logic;
      O1,O2 : out std_logic_vector(3 downto 0));
  end entity;
architecture SimpleWrap of dpram_5X4 is 
begin
  dpram_5X4_wrap_inst: dpram_generic_reverse_wrapper 
       generic map (address_width => 5, data_width => 4)
   port map (ADDR_0 => AB, ADDR_1 => A2, CLK => CE1, WRITE_0_BAR => WEBB, WRITE_1_BAR => WEB2,  ENABLE_0_BAR => CSB1, ENABLE_1_BAR => CSB2, DATAIN_0 => I1, DATAIN_1 => I2, DATAOUT_0 => O1, DATAOUT_1 => O2);
end SimpleWrap;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity obc11_dpram_4X8 is
   port(       AB,A2  : in std_logic_vector(3 downto 0);
      I1,I2  : in std_logic_vector(7 downto 0);
      CE1,CE2,CSB1,CSB2,WEBB,WEB2: in std_logic;
      O1,O2 : out std_logic_vector(7 downto 0));
  end entity;
architecture SimpleWrap of obc11_dpram_4X8 is 
begin
  obc11_dpram_4X8_wrap_inst: dpram_generic_reverse_wrapper 
       generic map (address_width => 4, data_width => 8)
   port map (ADDR_0 => AB, ADDR_1 => A2, CLK => CE1, WRITE_0_BAR => WEBB, WRITE_1_BAR => WEB2,  ENABLE_0_BAR => CSB1, ENABLE_1_BAR => CSB2, DATAIN_0 => I1, DATAIN_1 => I2, DATAOUT_0 => O1, DATAOUT_1 => O2);
end SimpleWrap;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity dpram_5X8 is
   port(       AB,A2  : in std_logic_vector(4 downto 0);
      I1,I2  : in std_logic_vector(7 downto 0);
      CE1,CE2,CSB1,CSB2,WEBB,WEB2: in std_logic;
      O1,O2 : out std_logic_vector(7 downto 0));
  end entity;
architecture SimpleWrap of dpram_5X8 is 
begin
  dpram_5X8_wrap_inst: dpram_generic_reverse_wrapper 
       generic map (address_width => 5, data_width => 8)
   port map (ADDR_0 => AB, ADDR_1 => A2, CLK => CE1, WRITE_0_BAR => WEBB, WRITE_1_BAR => WEB2,  ENABLE_0_BAR => CSB1, ENABLE_1_BAR => CSB2, DATAIN_0 => I1, DATAIN_1 => I2, DATAOUT_0 => O1, DATAOUT_1 => O2);
end SimpleWrap;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity spram_4X4 is
   port(       A : in std_logic_vector(3 downto 0);
      I  : in std_logic_vector(3 downto 0);
      CE, CSB, WEB: in std_logic;
      O  : out std_logic_vector(3 downto 0));
  end entity;
architecture SimpleWrap of spram_4X4 is 
begin
  spram_4X4_wrap_inst: spram_generic_reverse_wrapper 
       generic map (address_width => 4, data_width => 4)
   port map (ADDR => A, CLK => CE, WRITE_BAR => WEB, ENABLE_BAR => CSB, DATAIN => I,  DATAOUT => O);
end SimpleWrap;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity spram_5X16 is
   port(       A : in std_logic_vector(4 downto 0);
      I  : in std_logic_vector(15 downto 0);
      CE, CSB, WEB: in std_logic;
      O  : out std_logic_vector(15 downto 0));
  end entity;
architecture SimpleWrap of spram_5X16 is 
begin
  spram_5X16_wrap_inst: spram_generic_reverse_wrapper 
       generic map (address_width => 5, data_width => 16)
   port map (ADDR => A, CLK => CE, WRITE_BAR => WEB, ENABLE_BAR => CSB, DATAIN => I,  DATAOUT => O);
end SimpleWrap;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity obc11_8X8 is
   port(       A : in std_logic_vector(7 downto 0);
      I  : in std_logic_vector(7 downto 0);
      CE, CSB, WEB: in std_logic;
      O  : out std_logic_vector(7 downto 0));
  end entity;
architecture SimpleWrap of obc11_8X8 is 
begin
  obc11_8X8_wrap_inst: spram_generic_reverse_wrapper 
       generic map (address_width => 8, data_width => 8)
   port map (ADDR => A, CLK => CE, WRITE_BAR => WEB, ENABLE_BAR => CSB, DATAIN => I,  DATAOUT => O);
end SimpleWrap;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity spram_9X24 is
   port(       A : in std_logic_vector(8 downto 0);
      I  : in std_logic_vector(23 downto 0);
      CE, CSB, WEB: in std_logic;
      O  : out std_logic_vector(23 downto 0));
  end entity;
architecture SimpleWrap of spram_9X24 is 
begin
  spram_9X24_wrap_inst: spram_generic_reverse_wrapper 
       generic map (address_width => 9, data_width => 24)
   port map (ADDR => A, CLK => CE, WRITE_BAR => WEB, ENABLE_BAR => CSB, DATAIN => I,  DATAOUT => O);
end SimpleWrap;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity fake_1r1w_1X1 is
   port(   FAKEIN:in std_logic; FAKEOUT: out std_logic );
  end entity;
architecture SimpleWrap of fake_1r1w_1X1 is 
begin
end SimpleWrap;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.types.all;
use ahir.utilities.all;
entity fake_1r1w_2X2 is
   port(   FAKEIN:in std_logic; FAKEOUT: out std_logic );
  end entity;
architecture SimpleWrap of fake_1r1w_2X2 is 
begin
end SimpleWrap;
