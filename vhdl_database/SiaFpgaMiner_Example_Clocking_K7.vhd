library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
  use unisim.all;

entity Clocking_K7 is  
  port (
    aReset    : in std_logic;
    ClkIn     : in std_logic;
    MiningClk : out std_logic;
    UartClk   : out std_logic;
    Locked    : out std_logic
  );

end Clocking_K7;

architecture rtl of Clocking_K7 is

  component PLLE2_ADV
    generic (
      BANDWIDTH : string := "OPTIMIZED";
      CLKIN1_PERIOD : real := 0.000;
      CLKIN2_PERIOD : real := 0.000;
      CLKOUT0_DIVIDE : integer := 1;
      CLKOUT1_DIVIDE : integer := 1;
      CLKOUT2_DIVIDE : integer := 1;
      CLKOUT3_DIVIDE : integer := 1;
      CLKOUT4_DIVIDE : integer := 1;
      CLKOUT5_DIVIDE : integer := 1;
      CLKOUT0_PHASE : real := 0.0;
      CLKOUT1_PHASE : real := 0.0;
      CLKOUT2_PHASE : real := 0.0;
      CLKOUT3_PHASE : real := 0.0;
      CLKOUT4_PHASE : real := 0.0;
      CLKOUT5_PHASE : real := 0.0;
      CLKOUT0_DUTY_CYCLE : real := 0.5;
      CLKOUT1_DUTY_CYCLE : real := 0.5;
      CLKOUT2_DUTY_CYCLE : real := 0.5;
      CLKOUT3_DUTY_CYCLE : real := 0.5;
      CLKOUT4_DUTY_CYCLE : real := 0.5;
      CLKOUT5_DUTY_CYCLE : real := 0.5;
      COMPENSATION : string := "ZHOLD";
      DIVCLK_DIVIDE : integer := 1;
      CLKFBOUT_MULT : integer := 2;
      CLKFBOUT_PHASE : real := 0.0;
      REF_JITTER1 : real := 0.100;
      REF_JITTER2 : real := 0.100;
      STARTUP_WAIT : string := "FALSE");
    port (
      CLKIN1 : in std_logic;
      CLKIN2 : in std_logic;
      CLKFBIN : in std_logic;
      CLKINSEL : in std_logic;
      RST : in std_logic;
      PWRDWN : in std_logic;
      DADDR : in std_logic_vector(6 downto 0);
      DI : in std_logic_vector(15 downto 0);
      DWE : in std_logic;
      DEN : in std_logic;
      DCLK : in std_logic;
      DRDY : out std_logic;
      DO : out std_logic_vector(15 downto 0);
      CLKOUT0 : out std_logic;
      CLKOUT1 : out std_logic;
      CLKOUT2 : out std_logic;
      CLKOUT3 : out std_logic;
      CLKOUT4 : out std_logic;
      CLKOUT5 : out std_logic;
      CLKFBOUT : out std_logic;
      LOCKED : out std_logic);
  end component;

  component BUFG
    port (
      O : out std_ulogic;
      I : in std_ulogic);
  end component;

  signal ClkOut0: std_logic;
  signal ClkOut1: std_logic;
  signal FbIn: std_ulogic;
  signal FbOut: std_ulogic;

begin

  PLL: PLLE2_ADV
  generic map (
    BANDWIDTH             => "OPTIMIZED",
    COMPENSATION          => "ZHOLD",
    DIVCLK_DIVIDE         => 1,
    CLKFBOUT_MULT         => 25,
    CLKFBOUT_PHASE        => 0.000,
    CLKIN1_PERIOD         => 25.000,
    CLKIN2_PERIOD         => 0.000,
    CLKOUT0_DIVIDE        => 5,
    CLKOUT0_DUTY_CYCLE    => 0.500,
    CLKOUT0_PHASE         => 0.000,
    CLKOUT1_DIVIDE        => 25,
    CLKOUT1_DUTY_CYCLE    => 0.500,
    CLKOUT1_PHASE         => 0.000)
  port map (
    CLKIN1   => ClkIn,          -- in  std_logic
    CLKIN2   => '0',            -- in  std_logic
    CLKFBIN  => FbIn,     -- in  std_logic
    CLKINSEL => '1',            -- in  std_logic
    RST      => aReset,      -- in  std_logic
    PWRDWN   => '0',            -- in  std_logic
    DADDR    => (others=>'0'),  -- in  std_logic_vector(6 downto 0)
    DI       => (others=>'0'),  -- in  std_logic_vector(15 downto 0)
    DWE      => '0',            -- in  std_logic
    DEN      => '0',            -- in  std_logic
    DCLK     => '0',            -- in  std_logic
    DRDY     => open,           -- out std_logic
    DO       => open,           -- out std_logic_vector(15 downto 0)
    CLKOUT0  => ClkOut0,     -- out std_logic
    CLKOUT1  => ClkOut1,     -- out std_logic
    CLKOUT2  => open,     -- out std_logic
    CLKOUT3  => open,     -- out std_logic
    CLKOUT4  => open,     -- out std_logic
    CLKOUT5  => open,     -- out std_logic
    CLKFBOUT => FbOut,    -- out std_logic
    LOCKED   => Locked); -- out std_logic

  FbBufG: BUFG
    port map (
      I => FbOut,   
      O => FbIn); 

  Clk0Bufg: BUFG
    port map (
      I => ClkOut0,
      O => MiningClk);    

  Clk1Bufg: BUFG
    port map (
      I => ClkOut1,
      O => UartClk);

end rtl;