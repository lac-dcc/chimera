library ieee;
context ieee.ieee_std_context;

package ICE40_components is

component PLL
  generic (
    DIVF : unsigned(6 downto 0);
    DIVQ : unsigned(2 downto 0)
  );
  port (
    clki : in  std_logic;
    clko : out std_logic
  );
end component;

component SB_PLL40_CORE
  generic (
    --- Feedback
    FEEDBACK_PATH                  : string := "SIMPLE"; -- String (simple, delay, phase_and_delay, external)
--    DELAY_ADJUSTMENT_MODE_FEEDBACK : string := "FIXED";
--    DELAY_ADJUSTMENT_MODE_RELATIVE : string := "FIXED";
--    SHIFTREG_DIV_MODE              : bit_vector(1 downto 0) := "00";   -- 0-->Divide by 4, 1-->Divide by 7, 3 -->Divide by 5
--    FDA_FEEDBACK                   : bit_vector(3 downto 0) := "0000"; -- Integer (0-15)
--    FDA_RELATIVE                   : bit_vector(3 downto 0) := "0000"; -- Integer (0-15)
    PLLOUT_SELECT                  : string := "GENCLK";

--      --- Use the spread sheet to populate the values below
    DIVF         : unsigned(6 downto 0);  -- Determine a good default value
    DIVR         : unsigned(3 downto 0) := (others=>'0');  -- Determine a good default value
    DIVQ         : unsigned(2 downto 0);  -- Determine a good default value
    FILTER_RANGE : unsigned(2 downto 0) := "001"  -- Determine a good default value

    --- Additional C-Bits
--    ENABLE_ICEGATE : bit := '0';

    --- Test Mode Parameter
--    TEST_MODE              : bit := '0';
--    EXTERNAL_DIVIDE_FACTOR : integer := 1 -- Not Used by model, Added for PLL config GUI
  );
  port (
    REFERENCECLK    : in  std_logic; -- Driven by core logic
    PLLOUTCORE      : out std_logic; -- PLL output to core logic
--    PLLOUTGLOBAL    : out std_logic; -- PLL output to global network
--    EXTFEEDBACK     : in  std_logic; -- Driven by core logic
--    DYNAMICDELAY    : in  std_logic_vector (7 downto 0); -- Driven by core logic
--    LOCK            : out std_logic; -- Output of PLL
    BYPASS          : in  std_logic; -- Driven by core logic
    RESETB          : in  std_logic -- Driven by core logic
--    LATCHINPUTVALUE : in  std_logic; -- iCEGate Signal
    -- Test Pins
--    SDO  : out std_logic; -- Output of PLL
--    SDI  : in std_logic;  -- Driven by core logic
--    SCLK : in std_logic   -- Driven by core logic
  );
end component;

end ICE40_components;
