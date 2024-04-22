library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.Vcomponents.all;

entity dcm1 is
    port (CLKIN_IN       : in  std_logic;
          CLK0_OUT       : out std_logic;
          CLKFX_OUT      : out std_logic);
end dcm1;

architecture BEHAVIORAL of dcm1 is
    signal GND_BIT     : std_logic;
    signal CLKIN       : std_logic;
    signal CLKFX       : std_logic;
    signal CLKFX_BUF   : std_logic;
    signal CLK0        : std_logic;
    signal CLK0_BUF    : std_logic;
    signal CLKFB       : std_logic;
begin

    GND_BIT <= '0';
    
    -- This DCM completely de-skews the clock network wrt the input pin
    -- Note: the BUFIO2 instance needed manually placing in the .ucf file
    
    -- Clock input io2 buffer
    CLKIN_BUFIO2_INST : BUFIO2
        port map (I => CLKIN_IN, DIVCLK => CLKIN);
        
    -- Clock feedback io2 buffer
    CLKFB_BUFIO2FB_INST : BUFIO2FB
        port map (I => CLK0_BUF, O => CLKFB);
    
    -- CLK0 output buffer
    CLK0_BUFG_INST : BUFG
        port map (I => CLK0, O => CLK0_BUF);
    CLK0_OUT <= CLK0_BUF;
    
    -- CLKFX output buffer
    CLKFX_BUFG_INST : BUFG
        port map (I => CLKFX, O => CLKFX_BUF);
    CLKFX_OUT <= CLKFX_BUF;

    DCM_INST : DCM
        generic map(CLK_FEEDBACK          => "1X",
                    CLKDV_DIVIDE          => 4.0,  -- 48 = 32 * 6/4
                    CLKFX_DIVIDE          => 4,
                    CLKFX_MULTIPLY        => 6,
                    CLKIN_DIVIDE_BY_2     => false,
                    CLKIN_PERIOD          => 31.250,
                    CLKOUT_PHASE_SHIFT    => "NONE",
                    DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS",
                    DFS_FREQUENCY_MODE    => "LOW",
                    DLL_FREQUENCY_MODE    => "LOW",
                    DUTY_CYCLE_CORRECTION => true,
                    FACTORY_JF            => x"C080",
                    PHASE_SHIFT           => 0,
                    STARTUP_WAIT          => false)
        port map (CLKFB    => CLKFB,
                  CLKIN    => CLKIN,
                  DSSEN    => GND_BIT,
                  PSCLK    => GND_BIT,
                  PSEN     => GND_BIT,
                  PSINCDEC => GND_BIT,
                  RST      => GND_BIT,
                  CLKDV    => open,
                  CLKFX    => CLKFX,
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
