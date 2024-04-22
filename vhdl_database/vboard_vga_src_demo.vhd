library ieee;
context ieee.ieee_std_context;

use work.VGA_config.all;

architecture demo of Design_Top is

  constant cfg : VGA_config_t := VGA_configs(G_SCREEN);

  constant ymid : integer range -1 to cfg.height := cfg.height/2;
  constant xmid : integer range -1 to cfg.width  := cfg.width/2;

  type sync_t is record
    x     : integer;
    y     : integer;
    hsync : std_logic;
    vsync : std_logic;
  end record;

  type vga_t is record
    R    : std_logic;
    G    : std_logic;
    B    : std_logic;
    sync : sync_t;
  end record;

  signal vga_gen : sync_t;
  signal vga_out : vga_t;

begin

  i_sync: entity work.VGA_sync_gen_cfg
  generic map ( cfg )
  port map (
    CLK   => CLK,
    EN    => EN,
    RST   => RST,
    HSYNC => vga_gen.hsync,
    VSYNC => vga_gen.vsync,
    X     => vga_gen.x,
    Y     => vga_gen.y
  );

  process (CLK)
  begin
    if rising_edge(CLK) then
      if EN then
        -- Reg 0
        vga_out.sync <= vga_gen;
        vga_out.R <= '1' when vga_gen.y >= ymid else '0';
        vga_out.G <= '1' when vga_gen.x >= xmid else '0';
        vga_out.B <= '1' when (vga_gen.x rem xmid) >= xmid/2 else '0';

        -- Reg 1 (end of pipeline)
        HSYNC <= vga_out.sync.hsync;
        VSYNC <= vga_out.sync.vsync;
        RGB   <= vga_out.R & vga_out.G & vga_out.B when vga_out.sync.x /= -1 and vga_out.sync.y /= -1 else (others=>'0');
      end if;
    end if;
  end process;

end;
