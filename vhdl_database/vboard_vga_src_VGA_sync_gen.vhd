library ieee;
context ieee.ieee_std_context;

entity VGA_sync_gen is
  generic (
    G_HPULSE: natural;
    G_HFRONT: natural;
    G_WIDTH:  natural;
    G_HBACK:  natural;
    G_HPOL:   boolean;
    G_VPULSE: natural;
    G_VFRONT: natural;
    G_HEIGHT: natural;
    G_VBACK:  natural;
    G_VPOL:   boolean
  );
  port (
    CLK:   in  std_logic;
    EN:    in  std_logic;
    RST:   in  std_logic;
    HSYNC: out std_logic;
    VSYNC: out std_logic;
    X:     out integer range -1 to G_WIDTH-1;
    Y:     out integer range -1 to G_HEIGHT-1
  );
end entity;


architecture arch of VGA_sync_gen is

  signal tc: std_logic;

begin

  i_h: entity work.VGA_syn_gen_idx
    generic map (
      G_PULSE  => G_HPULSE,
      G_FRONT  => G_HFRONT,
      G_LENGTH => G_WIDTH,
      G_BACK   => G_HBACK,
      G_POL    => G_HPOL
    )
    port map (
      CLK  => CLK,
      EN   => EN,
      RST  => RST,
      SYNC => HSYNC,
      IDX  => X,
      TC   => tc
    );

  i_v: entity work.VGA_syn_gen_idx
    generic map (
      G_PULSE  => G_VPULSE,
      G_FRONT  => G_VFRONT,
      G_LENGTH => G_HEIGHT,
      G_BACK   => G_VBACK,
      G_POL    => G_VPOL
    )
    port map (
      CLK  => CLK,
      EN   => EN and tc,
      RST  => RST,
      SYNC => VSYNC,
      IDX  => Y,
      TC   => open
    );

end;
