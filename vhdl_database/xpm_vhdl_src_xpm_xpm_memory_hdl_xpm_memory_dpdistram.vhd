--! Copyright [2020] [Frans Schreuder]
--!
--!   Licensed under the Apache License, Version 2.0 (the "License");
--!   you may not use this file except in compliance with the License.
--!   You may obtain a copy of the License at
--!
--!       http://www.apache.org/licenses/LICENSE-2.0
--!
--!   Unless required by applicable law or agreed to in writing, software
--!   distributed under the License is distributed on an "AS IS" BASIS,
--!   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--!   See the License for the specific language governing permissions and
--!   limitations under the License.
library ieee;
use ieee.std_logic_1164.all;
library std;
use std.env.all;

entity xpm_memory_dpdistram is
  generic (

    -- Common module generics
    MEMORY_SIZE             : integer := 2048          ;
    CLOCKING_MODE           : string  := "common_clock";
    MEMORY_INIT_FILE        : string  := "none"        ;
    MEMORY_INIT_PARAM       : string  := ""            ;
    USE_MEM_INIT            : integer := 1             ;
    USE_MEM_INIT_MMI        : integer := 0             ;
    MESSAGE_CONTROL         : integer := 0             ;
    USE_EMBEDDED_CONSTRAINT : integer := 0              ;
    MEMORY_OPTIMIZATION     : string  := "true";
    SIM_ASSERT_CHK          : integer := 0               ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A : integer := 32  ;
    READ_DATA_WIDTH_A  : integer := 32  ;
    BYTE_WRITE_WIDTH_A : integer := 32  ;
    ADDR_WIDTH_A       : integer := 6   ;
    READ_RESET_VALUE_A : string  := "0" ;
    READ_LATENCY_A     : integer := 2   ;
    RST_MODE_A         : string  := "SYNC";

    -- Port B module generics
    READ_DATA_WIDTH_B  : integer := 32  ;
    ADDR_WIDTH_B       : integer := 6   ;
    READ_RESET_VALUE_B : string  := "0" ;
    READ_LATENCY_B     : integer := 2   ;
    RST_MODE_B         : string  := "SYNC"

  );
  port (

    -- Port A module ports
    clka   : in  std_logic;
    rsta   : in  std_logic;
    ena    : in  std_logic;
    regcea : in  std_logic;
    wea    : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra  : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina   : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    douta  : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);

    -- Port B module ports
    clkb   : in  std_logic;
    rstb   : in  std_logic;
    enb    : in  std_logic;
    regceb : in  std_logic;
    addrb  : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    doutb  : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0)
  );
end xpm_memory_dpdistram;

architecture rtl of xpm_memory_dpdistram is

  
  function P_CLOCKING_MODE return integer is begin
   if    ( CLOCKING_MODE = "common_clock"       or  CLOCKING_MODE = "COMMON_CLOCK"     ) then return 0;
   elsif ( CLOCKING_MODE = "independent_clock"  or  CLOCKING_MODE = "INDEPENDENT_CLOCK") then return 1; else return 0; end if; end function;

  function P_MEMORY_OPTIMIZATION return integer is begin if (MEMORY_OPTIMIZATION = "false") then return 0; else return 1; end if; end function;

begin

  xpm_memory_base_inst: entity work.xpm_memory_base 
  generic map (
    -- Common module parameters
    MEMORY_OPTIMIZATION      => P_MEMORY_OPTIMIZATION,
    MEMORY_TYPE              => 2 ,
    MEMORY_SIZE              => MEMORY_SIZE,
    MEMORY_PRIMITIVE         => 1 ,
    CLOCKING_MODE            => P_CLOCKING_MODE,
    ECC_MODE                 => 0 ,
    SIM_ASSERT_CHK           => SIM_ASSERT_CHK,
    MEMORY_INIT_FILE         => MEMORY_INIT_FILE,
    MEMORY_INIT_PARAM        => MEMORY_INIT_PARAM,
    USE_MEM_INIT             => USE_MEM_INIT,
    USE_MEM_INIT_MMI         => USE_MEM_INIT_MMI,
    WAKEUP_TIME              => 0 ,
    AUTO_SLEEP_TIME          => 0 ,
    MESSAGE_CONTROL          => MESSAGE_CONTROL,
    USE_EMBEDDED_CONSTRAINT  => USE_EMBEDDED_CONSTRAINT,

    -- Port A module parameters
    WRITE_DATA_WIDTH_A => WRITE_DATA_WIDTH_A,
    READ_DATA_WIDTH_A  => READ_DATA_WIDTH_A,
    BYTE_WRITE_WIDTH_A => BYTE_WRITE_WIDTH_A,
    ADDR_WIDTH_A       => ADDR_WIDTH_A,
    READ_RESET_VALUE_A => READ_RESET_VALUE_A,
    READ_LATENCY_A     => READ_LATENCY_A,
    WRITE_MODE_A       => 1,
    RST_MODE_A         => RST_MODE_A,

    -- Port B module parameters
    WRITE_DATA_WIDTH_B => READ_DATA_WIDTH_B,
    READ_DATA_WIDTH_B  => READ_DATA_WIDTH_B,
    BYTE_WRITE_WIDTH_B => READ_DATA_WIDTH_B,
    ADDR_WIDTH_B       => ADDR_WIDTH_B,
    READ_RESET_VALUE_B => READ_RESET_VALUE_B,
    READ_LATENCY_B     => READ_LATENCY_B,
    WRITE_MODE_B       => 1,
    RST_MODE_B         => RST_MODE_B        
  ) 
  port map(

    -- Common module ports
    sleep          => '0',

    -- Port A module ports
    clka           => clka,
    rsta           => rsta,
    ena            => ena,
    regcea         => regcea,
    wea            => wea,
    addra          => addra,
    dina           => dina,
    injectsbiterra => '0',
    injectdbiterra => '0',
    douta          => douta,
    sbiterra       => open,
    dbiterra       => open,

    -- Port B module ports
    clkb           => clkb,
    rstb           => rstb,
    enb            => enb,
    regceb         => regceb,
    web            => (others => '0'),
    addrb          => addrb,
    dinb           => (others => '0'),
    injectsbiterrb => '0',
    injectdbiterrb => '0',
    doutb          => doutb,
    sbiterrb       => open,
    dbiterrb       => open                          
  );

end rtl;
