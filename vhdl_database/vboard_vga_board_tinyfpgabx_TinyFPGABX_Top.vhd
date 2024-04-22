library ieee;
context ieee.ieee_std_context;

use work.ICE40_components.all;
use work.ICE40_PLL_config.ICE40_PLL_config_t;
use work.ICE40_PLL_config.ICE40_Screen_configs;
use work.TinyFPGABX_PLL_config.TinyFPGABX_PLL_configs;

entity TinyFPGABX_Top is
  generic (
    SCREEN : natural := 22
  );
  port (
    TinyFPGABX_CLK    : in  std_logic; -- System clock (16 Mhz)
    TinyFPGABX_PIN_15 : in  std_logic; -- Reset

    TinyFPGABX_USBPU  : out std_logic; -- USB pull resistor

    TinyFPGABX_PIN_13 : out std_logic; -- VGA VSync
    TinyFPGABX_PIN_12 : out std_logic; -- VGA HSync
    TinyFPGABX_PIN_11 : out std_logic; -- VGA R
    TinyFPGABX_PIN_10 : out std_logic; -- VGA G
    TinyFPGABX_PIN_9  : out std_logic  -- VGA B
  );
end;

architecture arch of TinyFPGABX_Top is

  constant PLL_cfg : ICE40_PLL_config_t := TinyFPGABX_PLL_configs(ICE40_Screen_configs(SCREEN));

  signal clki : std_logic;
  signal rgb  : std_logic_vector(2 downto 0);

begin

  -- Drive USB pull-up resistor to '0' to disable USB
  TinyFPGABX_USBPU <= '0';

  PLL_0: SB_PLL40_CORE
  generic map (
    DIVF => to_unsigned( PLL_cfg.DIVF, 7),
    DIVQ => to_unsigned( PLL_cfg.DIVQ, 3)
  )
  port map (
    REFERENCECLK => TinyFPGABX_CLK,
    PLLOUTCORE   => clki,
    BYPASS       => '0',
    RESETB       => '1'
  );

  UUT: entity work.Design_Top(demo)
  generic map (
    G_SCREEN => SCREEN
  )
  port map (
    CLK   => clki,
    EN    => '1',
    RST   => TinyFPGABX_PIN_15,
    HSYNC => TinyFPGABX_PIN_12,
    VSYNC => TinyFPGABX_PIN_13,
    RGB   => rgb
  );

  TinyFPGABX_PIN_11 <= rgb(2);
  TinyFPGABX_PIN_10 <= rgb(1);
  TinyFPGABX_PIN_9  <= rgb(0);

end;
