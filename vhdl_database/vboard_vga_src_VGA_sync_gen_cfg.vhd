library ieee;
context ieee.ieee_std_context;

use work.VGA_config.VGA_config_t;

entity VGA_sync_gen_cfg is
  generic (
    CONFIG: VGA_config_t
  );
  port (
    CLK:   in  std_logic;
    EN:    in  std_logic;
    RST:   in  std_logic;
    HSYNC: out std_logic;
    VSYNC: out std_logic;
    X:     out integer range -1 to CONFIG.width-1;
    Y:     out integer range -1 to CONFIG.height-1
  );
end entity;


architecture wrap of VGA_sync_gen_cfg is

begin

  i_sync: entity work.VGA_sync_gen
  generic map (
    G_HPULSE => CONFIG.hpulse,
    G_HFRONT => CONFIG.hfront,
    G_WIDTH  => CONFIG.width,
    G_HBACK  => CONFIG.hback,
    G_HPOL   => CONFIG.hpol,
    G_VPULSE => CONFIG.vpulse,
    G_VFRONT => CONFIG.vfront,
    G_HEIGHT => CONFIG.height,
    G_VBACK  => CONFIG.vback,
    G_VPOL   => CONFIG.vpol
  )
  port map (
    CLK   => CLK,
    EN    => EN,
    RST   => RST,
    HSYNC => HSYNC,
    VSYNC => VSYNC,
    X     => X,
    Y     => Y
  );

end;
