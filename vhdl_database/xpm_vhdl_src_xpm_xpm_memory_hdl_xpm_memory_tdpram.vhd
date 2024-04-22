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


entity xpm_memory_tdpram is
  generic (

    -- Common module generics
    MEMORY_SIZE             : integer := 2048           ;
    MEMORY_PRIMITIVE        : string  := "auto"         ;
    CLOCKING_MODE           : string  := "common_clock" ;
    ECC_MODE                : string  := "no_ecc"       ;
    MEMORY_INIT_FILE        : string  := "none"         ;
    MEMORY_INIT_PARAM       : string  := ""             ;
    USE_MEM_INIT            : integer := 1              ;
    USE_MEM_INIT_MMI        : integer := 0              ;
    WAKEUP_TIME             : string  := "disable_sleep";
    AUTO_SLEEP_TIME         : integer := 0              ;
    MESSAGE_CONTROL         : integer := 0              ;
    USE_EMBEDDED_CONSTRAINT : integer := 0              ;
    MEMORY_OPTIMIZATION     : string  := "true";
    CASCADE_HEIGHT          : integer := 0               ;
    SIM_ASSERT_CHK          : integer := 0               ;
    WRITE_PROTECT           : integer := 1               ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A : integer := 32          ;
    READ_DATA_WIDTH_A  : integer := 32          ;
    BYTE_WRITE_WIDTH_A : integer := 32          ;
    ADDR_WIDTH_A       : integer := 6           ;
    READ_RESET_VALUE_A : string  := "0"         ;
    READ_LATENCY_A     : integer := 2           ;
    WRITE_MODE_A       : string  := "no_change" ;
    RST_MODE_A         : string  := "SYNC"      ;

    -- Port B module generics
    WRITE_DATA_WIDTH_B : integer := 32         ;
    READ_DATA_WIDTH_B  : integer := 32         ;
    BYTE_WRITE_WIDTH_B : integer := 32         ;
    ADDR_WIDTH_B       : integer := 6          ;
    READ_RESET_VALUE_B : string  := "0"        ;
    READ_LATENCY_B     : integer := 2          ;
    WRITE_MODE_B       : string  := "no_change";
    RST_MODE_B         : string  := "SYNC"

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    wea            : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina           : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic;

    -- Port B module ports
    clkb           : in  std_logic;
    rstb           : in  std_logic;
    enb            : in  std_logic;
    regceb         : in  std_logic;
    web            : in  std_logic_vector((WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B)-1 downto 0);
    addrb          : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    dinb           : in  std_logic_vector(WRITE_DATA_WIDTH_B-1 downto 0);
    injectsbiterrb : in  std_logic;
    injectdbiterrb : in  std_logic;
    doutb          : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);
    sbiterrb       : out std_logic;
    dbiterrb       : out std_logic
  );
end xpm_memory_tdpram;

architecture rtl of xpm_memory_tdpram is

  function P_MEMORY_PRIMITIVE return integer is begin
    if    (MEMORY_PRIMITIVE = "lutram"    or  MEMORY_PRIMITIVE = "LUTRAM"  or  MEMORY_PRIMITIVE = "distributed"  or  MEMORY_PRIMITIVE = "DISTRIBUTED" ) then return 1;
    elsif (MEMORY_PRIMITIVE = "blockram"  or  MEMORY_PRIMITIVE = "BLOCKRAM"  or  MEMORY_PRIMITIVE = "block"  or  MEMORY_PRIMITIVE = "BLOCK" ) then return 2;
    elsif (MEMORY_PRIMITIVE = "ultraram"  or  MEMORY_PRIMITIVE = "ULTRARAM"  or  MEMORY_PRIMITIVE = "ultra"  or  MEMORY_PRIMITIVE = "ULTRA" ) then return 3; else return 0; end if; end function;
  
  function P_CLOCKING_MODE return integer is begin
   if    ( CLOCKING_MODE = "common_clock"       or  CLOCKING_MODE = "COMMON_CLOCK"     ) then return 0;
   elsif ( CLOCKING_MODE = "independent_clock"  or  CLOCKING_MODE = "INDEPENDENT_CLOCK") then return 1; else return 0; end if; end function;

  function P_ECC_MODE return integer is begin
    if    ( ECC_MODE  = "no_ecc"                  or  ECC_MODE  = "NO_ECC"                ) then return 0;
    elsif ( ECC_MODE  = "encode_only"             or  ECC_MODE  = "ENCODE_ONLY"           ) then return 1;
    elsif ( ECC_MODE  = "decode_only"             or  ECC_MODE  = "DECODE_ONLY"           ) then return 2;
    elsif ( ECC_MODE  = "both_encode_and_decode"  or  ECC_MODE  = "BOTH_ENCODE_AND_DECODE") then return 3; else return 4; end if; end function;

  function P_WAKEUP_TIME return integer is begin if (WAKEUP_TIME = "use_sleep_pin"     or  WAKEUP_TIME = "USE_SLEEP_PIN") then return 2; else return 0; end if; end function;

  function P_WRITE_MODE_A  return integer is begin
    if    ( WRITE_MODE_A = "write_first"  or  WRITE_MODE_A = "WRITE_FIRST") then return 0;
    elsif ( WRITE_MODE_A = "read_first"   or  WRITE_MODE_A = "READ_FIRST" ) then return 1;
    elsif ( WRITE_MODE_A = "no_change"    or  WRITE_MODE_A = "NO_CHANGE"  ) then return 2; else return 0; end if; end function;

  function P_WRITE_MODE_B  return integer is begin
    if(    WRITE_MODE_B = "write_first"  or  WRITE_MODE_B = "WRITE_FIRST") then return 0;
    elsif( WRITE_MODE_B = "read_first"   or  WRITE_MODE_B = "READ_FIRST" ) then return 1 ;
    elsif( WRITE_MODE_B = "no_change"    or  WRITE_MODE_B = "NO_CHANGE"  ) then return 2 ; else return 0; end if; end function;

  function P_MEMORY_OPTIMIZATION return integer is begin if (MEMORY_OPTIMIZATION = "false") then return 0; else return 1; end if; end function;

begin

    xpm_memory_base_inst: entity work.xpm_memory_base 
    generic map (

    -- Common module parameters
    MEMORY_OPTIMIZATION      => P_MEMORY_OPTIMIZATION,
    MEMORY_TYPE              => 2,
    MEMORY_SIZE              => MEMORY_SIZE,
    MEMORY_PRIMITIVE         => P_MEMORY_PRIMITIVE,
    CLOCKING_MODE            => P_CLOCKING_MODE,
    ECC_MODE                 => P_ECC_MODE,
    SIM_ASSERT_CHK           => SIM_ASSERT_CHK,
    MEMORY_INIT_FILE         => MEMORY_INIT_FILE,
    MEMORY_INIT_PARAM        => MEMORY_INIT_PARAM,
    USE_MEM_INIT             => USE_MEM_INIT,
    USE_MEM_INIT_MMI         => USE_MEM_INIT_MMI,
    WAKEUP_TIME              => P_WAKEUP_TIME,
    AUTO_SLEEP_TIME          => 0,
    MESSAGE_CONTROL          => MESSAGE_CONTROL,
    USE_EMBEDDED_CONSTRAINT  => USE_EMBEDDED_CONSTRAINT,

    -- Port A module parameters
    WRITE_DATA_WIDTH_A => WRITE_DATA_WIDTH_A,
    READ_DATA_WIDTH_A  => READ_DATA_WIDTH_A,
    BYTE_WRITE_WIDTH_A => BYTE_WRITE_WIDTH_A,
    ADDR_WIDTH_A       => ADDR_WIDTH_A,
    READ_RESET_VALUE_A => READ_RESET_VALUE_A,
    READ_LATENCY_A     => READ_LATENCY_A,
    WRITE_MODE_A       => P_WRITE_MODE_A,
    RST_MODE_A         => RST_MODE_A,

    -- Port B module parameters
    WRITE_DATA_WIDTH_B => READ_DATA_WIDTH_B,
    READ_DATA_WIDTH_B  => READ_DATA_WIDTH_B,
    BYTE_WRITE_WIDTH_B => READ_DATA_WIDTH_B,
    ADDR_WIDTH_B       => ADDR_WIDTH_B,
    READ_RESET_VALUE_B => READ_RESET_VALUE_B,
    READ_LATENCY_B     => READ_LATENCY_B,
    WRITE_MODE_B       => P_WRITE_MODE_B,
    RST_MODE_B         => RST_MODE_B
    )  
    port map(

    -- Common module ports
    sleep          => sleep,

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
    web            => web,
    addrb          => addrb,
    dinb           => dinb,
    injectsbiterrb => '0',
    injectdbiterrb => '0',
    doutb          => doutb,
    sbiterrb       => open,
    dbiterrb       => open
  );

end rtl;

