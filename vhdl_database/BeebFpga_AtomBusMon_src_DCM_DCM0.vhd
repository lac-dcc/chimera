library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.Vcomponents.all;

entity DCM0 is
    generic (
       ClkMult        : integer := 10;       -- default value correct for GODIL
       ClkDiv         : integer := 31;       -- default value correct for GODIL
       ClkPer         : real    := 20.345    -- default value correct for GODIL
       );
    port (CLKIN_IN  : in  std_logic;
          CLKFX_OUT : out std_logic); 
end DCM0;

architecture BEHAVIORAL of DCM0 is
    signal CLK0        : std_logic;
    signal CLKFX_BUF   : std_logic;
    signal CLKIN_IBUFG : std_logic;
    signal GND_BIT     : std_logic;
begin

    GND_BIT <= '0';
    CLKFX_BUFG_INST : BUFG
        port map (I => CLKFX_BUF, O => CLKFX_OUT);
    
    DCM_INST : DCM
        generic map(CLK_FEEDBACK          => "1X",
                    CLKDV_DIVIDE          => 4.0,  -- 15.855 =49.152 * 10 / 31
                    CLKFX_DIVIDE          => ClkDiv,
                    CLKFX_MULTIPLY        => ClkMult,
                    CLKIN_DIVIDE_BY_2     => false,
                    CLKIN_PERIOD          => ClkPer,
                    CLKOUT_PHASE_SHIFT    => "NONE",
                    DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS",
                    DFS_FREQUENCY_MODE    => "LOW",
                    DLL_FREQUENCY_MODE    => "LOW",
                    DUTY_CYCLE_CORRECTION => true,
                    FACTORY_JF            => x"C080",
                    PHASE_SHIFT           => 0,
                    STARTUP_WAIT          => false)
        port map (CLKFB    => CLK0,
                  CLKIN    => CLKIN_IN,
                  DSSEN    => GND_BIT,
                  PSCLK    => GND_BIT,
                  PSEN     => GND_BIT,
                  PSINCDEC => GND_BIT,
                  RST      => GND_BIT,
                  CLKDV    => open,
                  CLKFX    => CLKFX_BUF,
                  CLKFX180 => open,
                  CLK0     => CLK0,
                  CLK2X    => open,
                  CLK2X180 => open,
                  CLK90    => open,
                  CLK180   => open,
                  CLK270   => open,
                  LOCKED   => open,
                  PSDONE   => open,
                  STATUS   => open);

end BEHAVIORAL;
