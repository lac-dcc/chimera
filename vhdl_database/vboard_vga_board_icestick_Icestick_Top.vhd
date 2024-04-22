library ieee;
context ieee.ieee_std_context;

use work.ICE40_components.all;
use work.ICE40_PLL_config.ICE40_PLL_config_t;
use work.ICE40_PLL_config.ICE40_Screen_configs;
use work.Icestick_PLL_config.Icestick_PLL_configs;

entity Icestick_Top is
  generic (
    SCREEN : natural := 22
  );
  port (
    IceStick_CLK   : in  std_logic; -- System clock (12 Mhz)
    IceStick_PMOD7 : out std_logic; -- VGA vsync
    IceStick_PMOD8 : out std_logic; -- VGA HSync
    IceStick_PMOD1 : out std_logic; -- VGA R
    IceStick_PMOD2 : out std_logic; -- VGA G
    IceStick_PMOD3 : out std_logic -- VGA B
  );
end;

architecture arch of Icestick_Top is

  constant PLL_cfg : ICE40_PLL_config_t := Icestick_PLL_configs(ICE40_Screen_configs(SCREEN));

  signal clki : std_logic;
  signal rgb  : std_logic_vector(2 downto 0);

begin

  PLL_0: SB_PLL40_CORE
  generic map (
    DIVF => to_unsigned( PLL_cfg.DIVF, 7),
    DIVQ => to_unsigned( PLL_cfg.DIVQ, 3)
  )
  port map (
    REFERENCECLK => IceStick_CLK,
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
    RST   => '0',
    HSYNC => IceStick_PMOD8,
    VSYNC => IceStick_PMOD7,
    RGB   => rgb
  );

  IceStick_PMOD1 <= rgb(2);
  IceStick_PMOD2 <= rgb(1);
  IceStick_PMOD3 <= rgb(0);

end;
