---------------------------------------------------------------------------------
-- Galaga video horizontal/vertical and sync generator by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all,
    ieee.std_logic_1164.all,
    ieee.std_logic_unsigned.all,
    ieee.numeric_std.all;

entity gen_video is
  port (
    clk      : in    std_logic;
    enable   : in    std_logic;
    hcnt     : out   std_logic_vector(8 downto 0);
    vcnt     : out   std_logic_vector(8 downto 0);
    hsync    : out   std_logic;
    vsync    : out   std_logic;
    csync    : out   std_logic; -- composite sync for TV
    hblank   : out   std_logic;
    vblank   : out   std_logic;
    h_offset : in    signed(3 downto 0);
    v_offset : in    signed(3 downto 0)
  );
end entity gen_video;

architecture struct of gen_video is

  signal hclkreg : unsigned (1 downto 0);
  signal hcntreg : unsigned (8 downto 0) := to_unsigned(000, 9);
  signal vcntreg : unsigned (8 downto 0) := to_unsigned(015, 9);

  signal hsync0 : std_logic;
  signal hsync1 : std_logic;
  signal hsync2 : std_logic;

  signal hsync_base : integer;
  signal vsync_base : integer;

begin

  hcnt  <= std_logic_vector(hcntreg);
  vcnt  <= std_logic_vector(vcntreg);
  hsync <= hsync0;

  --! - Horizontal counter: 511-128+1=384 pixels (48 tiles)
  --!     - 192 to 255: 64 pixels start of line (8 including 2 last tiles displayed)
  --!     - 256 to 511: 256 pixels line center (32 tiles displayed)
  --!     - 128 to 191: 64 pixels end of line (8 including 2 first tiles displayed)
  --!
  --! - Vertical counter: 263-000+1=264 lines (33 tiles)
  --!     - 000 to 015: 16 frame start lines (2 tiles)
  --!     - 016 to 239: 224 center lines (28 tiles displayed)
  --!     - 240 to 263: 24 end of frame lines (3 tiles
  --!
  --! - Horizontal Sync: hcnt=[176/204] (29 pixels)
  --! - Vertical Sync  : vcnt=[260/003] (8 lines)

    process (clk) is
    begin

        if rising_edge(clk) then
            if (enable = '1') then    -- clk & ena at 6MHz

                if hcntReg = 511 then hcntReg <= to_unsigned (128,9);
                else                  hcntReg <= hcntReg + 1;
                end if;

                if hcntReg = 191 then
                    if vcntReg = 263 then vcntReg <= to_unsigned(0,9);
                    else                  vcntReg <= vcntReg + 1;
                    end if;
                end if;

                hsync_base <= 175 + to_integer(resize(h_offset, 9));
                if    hcntReg = (hsync_base+ 0-8+8) then hsync0 <= '0'; -- 1
                elsif hcntReg = (hsync_base+29-8+8) then hsync0 <= '1';
                end if;

                if    hcntReg = (hsync_base-8+8)        then hsync1 <= '0';
                elsif hcntReg = (hsync_base+13-8+8)     then hsync1 <= '1'; -- 11
                elsif hcntReg = (hsync_base   +192-8+8) then hsync1 <= '0';
                elsif hcntReg = (hsync_base+13+192-8+8) then hsync1 <= '1'; -- 11
                end if;

                if    hcntReg = (hsync_base-8+8)     then hsync2 <= '0';
                elsif hcntReg = (hsync_base-28-8+8)  then hsync2 <= '1';
                end if;

                vsync_base <= 250+to_integer(resize(v_offset, 9));
                if     vcntReg = (vsync_base+ 2-1+2) mod 264 then csync <= hsync1;
                elsif  vcntReg = (vsync_base+ 3-1+2) mod 264 then csync <= hsync1;
                elsif  vcntReg = (vsync_base+ 4-1+2) mod 264 then csync <= hsync1; -- and hsync2;
                elsif  vcntReg = (vsync_base+ 5-1+2) mod 264 then csync <= hsync2; -- not(hsync1);
                elsif  vcntReg = (vsync_base+ 6-1+2) mod 264 then csync <= hsync2; -- not(hsync1);
                elsif  vcntReg = (vsync_base+ 7-1+2) mod 264 then csync <= hsync2; -- not(hsync1) or not(hsync2);
                elsif  vcntReg = (vsync_base+ 8-1+2) mod 264 then csync <= hsync1;
                elsif  vcntReg = (vsync_base+ 9-1+2) mod 264 then csync <= hsync1;
                elsif  vcntReg = (vsync_base+10-1+2) mod 264 then csync <= hsync1;
                else                                              csync <= hsync0;
                end if;

                if    vcntReg = (vsync_base+10) mod 264 then vsync <= '1';
                elsif vcntReg = (vsync_base+17) mod 264 then vsync <= '0';
                end if;

                if    hcntReg = (127+16+9)   then hblank <= '1';
                elsif hcntReg = (255-17+9+1) then hblank <= '0';
                end if;

                if    vcntReg = (240+1-1) then vblank <= '1';
                elsif vcntReg = (015+1)   then vblank <= '0';
                end if;

            end if;
        end if;

    end process;

end architecture struct;
