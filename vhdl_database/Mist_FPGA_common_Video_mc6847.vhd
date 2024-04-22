library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mc6847 is
	generic
	(
		T1_VARIANT      : boolean := false;
		CHAR_ROM_FILE	  : string := "";
		
    CVBS_NOT_VGA    : boolean := true
	);
	port
	(
		clk				      : in std_logic;
		clk_ena         : in std_logic;
		reset			      : in std_logic;

    -- address output lines
    da0     	      : out std_logic;

    -- data inputs
		dd				      : in std_logic_vector(7 downto 0);

    -- synchronising outputs
    hs_n    	      : out std_logic;
    fs_n    	      : out std_logic;

    -- mode control lines
    an_g            : in std_logic;
    an_s            : in std_logic;
    intn_ext        : in std_logic;
    gm              : in std_logic_vector(2 downto 0);
    css             : in std_logic;
    inv             : in std_logic;

    -- VGA output
    red     	      : out std_logic_vector(7 downto 0);
    green   	      : out std_logic_vector(7 downto 0);
    blue    	      : out std_logic_vector(7 downto 0);
    hsync   	      : out std_logic;
    vsync			      : out std_logic;
    hblank          : out std_logic;
    vblank          : out std_logic;

    -- special inputs
    artifact_en     : in std_logic;
    artifact_set    : in std_logic;
    artifact_phase  : in std_logic;
    
    -- CVBS output
    cvbs      : out std_logic_vector(7 downto 0)
	);
end mc6847;

architecture SYN of mc6847 is

  constant BUILD_DEBUG          : boolean := false;
  constant DEBUG_AN_G           : std_logic := '1';
  constant DEBUG_AN_S           : std_logic := '1';
  constant DEBUG_INTN_EXT       : std_logic := '1';
  constant DEBUG_GM             : std_logic_vector(2 downto 0) := "111";
  constant DEBUG_CSS            : std_logic := '1';
  constant DEBUG_INV            : std_logic := '0';
  
  -- H_TOTAL_PER_LINE must be divisible by 16
  -- so that sys_count is the same on each line when
  -- the video comes out of hblank
  -- so the phase relationship between data from the 6847 and character timing is maintained

	-- 14.31818 MHz : 256 X 384
  constant H_FRONT_PORCH      : integer := 11-1+1;
  constant H_HORIZ_SYNC       : integer := H_FRONT_PORCH + 35+2;
  constant H_BACK_PORCH       : integer := H_HORIZ_SYNC + 34+1;
  constant H_LEFT_BORDER      : integer := H_BACK_PORCH + 61+1+3; -- adjust for hblank de-assert @sys_count=6
  constant H_VIDEO            : integer := H_LEFT_BORDER + 256;
  constant H_RIGHT_BORDER     : integer := H_VIDEO + 61+1-3;      -- "
  constant H_TOTAL_PER_LINE   : integer := H_RIGHT_BORDER;

  -- (not used)
  --constant V_FRONT_PORCH      : integer := 2-1;
  --constant V_VERTICAL_SYNC    : integer := V_FRONT_PORCH + 2;
  --constant V_BACK_PORCH       : integer := V_VERTICAL_SYNC + 25;
  --constant V_TOP_BORDER       : integer := V_BACK_PORCH + 8 + 48;
  --constant V_VIDEO            : integer := V_TOP_BORDER +  384;
  --constant V_BOTTOM_BORDER    : integer := V_VIDEO + 8 + 48;
  --constant V_TOTAL_PER_FIELD  : integer := V_BOTTOM_BORDER;

  constant V2_FRONT_PORCH      : integer := 2;
  constant V2_VERTICAL_SYNC    : integer := V2_FRONT_PORCH + 2;
  constant V2_BACK_PORCH       : integer := V2_VERTICAL_SYNC + 12;
  constant V2_TOP_BORDER       : integer := V2_BACK_PORCH + 27; -- + 25;  -- +25 for PAL
  constant V2_VIDEO            : integer := V2_TOP_BORDER +  192;
  constant V2_BOTTOM_BORDER    : integer := V2_VIDEO + 27; -- + 25;       -- +25 for PAL
  constant V2_TOTAL_PER_FIELD  : integer := V2_BOTTOM_BORDER;

  -- internal version of control ports
  
  signal an_g_s                 : std_logic;
  signal an_s_s                 : std_logic;
  signal intn_ext_s             : std_logic;
  signal gm_s                   : std_logic_vector(2 downto 0);
  signal css_s                  : std_logic;
  signal inv_s                  : std_logic;
  
  -- VGA signals

	signal vga_clk_ena					: std_logic;
  signal vga_hsync            : std_logic;
  signal vga_vsync            : std_logic;
  signal vga_hblank           : std_logic;
  signal vga_vblank           : std_logic;
	signal vga_linebuf_addr			: std_logic_vector(8 downto 0);
	signal vga_data							: std_logic_vector(7 downto 0);
	signal vga_hborder          : std_logic;
	signal vga_vborder          : std_logic;
		
	-- CVBS signals
	
	signal cvbs_clk_ena					: std_logic;	        -- PAL/NTSC*2
  signal cvbs_hsync           : std_logic;
  signal cvbs_vsync           : std_logic;
  signal cvbs_hblank          : std_logic;
  signal cvbs_vblank          : std_logic;
  signal cvbs_hborder         : std_logic;
  signal cvbs_vborder         : std_logic;
	signal cvbs_linebuf_we			: std_logic;
	signal cvbs_linebuf_addr		: std_logic_vector(8 downto 0);
  
  signal active_h_start       : std_logic := '0';	
	signal an_s_r               : std_logic;
  signal inv_r                : std_logic;
  signal dd_r                 : std_logic_vector(7 downto 0);
  signal pixel_data           : std_logic_vector(7 downto 0);
	signal cvbs_data						: std_logic_vector(7 downto 0); -- CVBS data out
  
  alias hs_int     	          : std_logic is cvbs_hblank;
  alias fs_int     	          : std_logic is cvbs_vblank;
  signal da0_int              : std_logic_vector(4 downto 0);

  -- character rom signals
  signal char_a               : std_logic_vector(10 downto 0);
  signal char_d_o             : std_logic_vector(7 downto 0);
	signal cvbs_linebuf_we_r    : std_logic;
	signal cvbs_linebuf_addr_r  : std_logic_vector(8 downto 0);
	signal cvbs_linebuf_we_rr   : std_logic;
	signal cvbs_linebuf_addr_rr : std_logic_vector(8 downto 0);
	
  -- used by both CVBS and VGA
  shared variable v_count : std_logic_vector(8 downto 0);

  shared variable row_v : std_logic_vector(3 downto 0);

  procedure map_palette ( vga_data  : in std_logic_vector(7 downto 0);
                          r         : out std_logic_vector(7 downto 0);
                          g         : out std_logic_vector(7 downto 0);
                          b         : out std_logic_vector(7 downto 0)) is
                          
    type pal_entry_t is array (0 to 2) of std_logic_vector(1 downto 0);
    type pal_a is array (0 to 7) of pal_entry_t;
    constant pal : pal_a :=
    (
      0 => (0=>"00", 1=>"11", 2=>"00"),   -- green
      1 => (0=>"11", 1=>"11", 2=>"00"),   -- yellow
      2 => (0=>"00", 1=>"00", 2=>"11"),   -- blue
      3 => (0=>"11", 1=>"00", 2=>"00"),   -- red
      4 => (0=>"11", 1=>"11", 2=>"11"),   -- white
      5 => (0=>"00", 1=>"11", 2=>"11"),   -- cyan
      6 => (0=>"11", 1=>"00", 2=>"11"),   -- magenta
      7 => (0=>"11", 1=>"10", 2=>"00")    -- orange
      --others => (others => (others => '0'))
    );
    alias css_v   : std_logic is vga_data(6);
    alias an_g_v  : std_logic is vga_data(5);
    alias an_s_v  : std_logic is vga_data(4);
    alias luma    : std_logic is vga_data(3);
    alias chroma  : std_logic_vector(2 downto 0) is vga_data(2 downto 0);
  begin
    if luma = '1' then
      r := pal(to_integer(unsigned(chroma)))(0) & "000000";
      g := pal(to_integer(unsigned(chroma)))(1) & "000000";
      b := pal(to_integer(unsigned(chroma)))(2) & "000000";
    else
      -- not quite black in alpha mode
      if an_g_v = '0' and an_s_v = '0' then
        -- dark green/orange
        r := '0' & css_v & "000000";
        g := "01000000";
      else
        r := (others => '0');
        g := (others => '0');
      end if;
      b := (others => '0');
    end if;
  end procedure;
  
begin

  -- assign control inputs for debug/release build
  an_g_s <= DEBUG_AN_G when BUILD_DEBUG else an_g;
  an_s_s <= DEBUG_AN_S when BUILD_DEBUG else an_s;
  intn_ext_s <= DEBUG_INTN_EXT when BUILD_DEBUG else intn_ext;
  gm_s <= DEBUG_GM when BUILD_DEBUG else gm;
  css_s <= DEBUG_CSS when BUILD_DEBUG else css;
  inv_s <= DEBUG_INV when BUILD_DEBUG else inv;

  -- generate the clocks
  PROC_CLOCKS : process (clk, reset)
    variable toggle : std_logic := '0';
  begin
    if reset = '1' then
      toggle := '0';
      cvbs_clk_ena <= '0';
    elsif rising_edge(clk) then
      cvbs_clk_ena <= '0';  -- default
      if clk_ena = '1' then
        cvbs_clk_ena <= toggle;
        toggle := not toggle;
      end if;
      vga_clk_ena <= clk_ena;
    end if;
  end process PROC_CLOCKS;
  
  -- generate horizontal timing for VGA
  -- generate line buffer address for reading VGA data
  PROC_VGA : process (clk, reset)
    variable h_count : integer range 0 to H_TOTAL_PER_LINE;
    variable active_h_count : std_logic_vector(7 downto 0);
    variable vga_vblank_r : std_logic;
  begin
    if reset = '1' then
      h_count := 0;
      vga_hsync <= '1';
      vga_vsync <= '1';
      vga_hblank <= '0';

    elsif rising_edge (clk) and vga_clk_ena = '1' then

      -- start hsync when cvbs comes out of vblank
      if vga_vblank_r = '1' and vga_vblank = '0' then
        h_count := 0;
      else
        if h_count = H_TOTAL_PER_LINE then
          h_count := 0;
          vga_hborder <= '0';
        else
          h_count := h_count + 1;
        end if;
                
        if h_count = H_FRONT_PORCH then
          vga_hsync <= '0';
        elsif h_count = H_HORIZ_SYNC then
          vga_hsync <= '1';
        elsif h_count = H_BACK_PORCH then
          vga_hborder <= '1';
        elsif h_count = H_LEFT_BORDER then
          vga_hblank <= '0';
          active_h_count := (others => '0');
        elsif h_count = H_VIDEO then
          vga_hblank <= '1';
        elsif h_count = H_RIGHT_BORDER then
          vga_hborder <= '0';
        else
          active_h_count := std_logic_vector(unsigned(active_h_count) + 1);
        end if;

      end if;

      -- vertical syncs, blanks are the same
      vga_vsync <= cvbs_vsync;

      -- generate linebuffer address
      -- - alternate every 2nd line
      vga_linebuf_addr <= (not v_count(0)) & active_h_count;

      vga_vblank_r := vga_vblank;

    end if;
  end process;

  -- generate horizontal timing for CVBS
  -- generate line buffer address for writing CVBS data
  PROC_CVBS : process (clk, reset)
    variable h_count : integer range 0 to H_TOTAL_PER_LINE;
    variable active_h_count : std_logic_vector(7 downto 0);
    variable cvbs_hblank_r : std_logic := '0';
    --variable row_v : std_logic_vector(3 downto 0);
    -- for debug only
    variable active_v_count : std_logic_vector(v_count'range);
  begin
    if reset = '1' then

      h_count := H_TOTAL_PER_LINE;
      v_count := std_logic_vector(to_unsigned(V2_TOTAL_PER_FIELD, v_count'length));
      active_h_count := (others => '0');
      active_h_start <= '0';
      cvbs_hsync <= '1';
      cvbs_vsync <= '1';
      cvbs_hblank <= '0';
      cvbs_vblank <= '1';
			vga_vblank <= '1';
      da0_int <= (others => '0');
      cvbs_hblank_r := '0';
      row_v := (others => '0');
      
    elsif rising_edge (clk) and cvbs_clk_ena = '1' then

      active_h_start <= '0';      -- default
      
      if h_count = H_TOTAL_PER_LINE then
        h_count := 0;
        if v_count = V2_TOTAL_PER_FIELD then
          v_count := (others => '0');
        else
          v_count := v_count + 1;
        end if;

        -- VGA vblank is 1 line behind CVBS
        -- - because we need to fill the line buffer
        vga_vblank <= cvbs_vblank;
        
        if v_count = V2_FRONT_PORCH then
          cvbs_vsync <= '0';
        elsif v_count = V2_VERTICAL_SYNC then
          cvbs_vsync <= '1';
        elsif v_count = V2_BACK_PORCH then
          cvbs_vborder <= '1';
        elsif v_count = V2_TOP_BORDER then
          cvbs_vblank <= '0';
          row_v := (others => '0');
          active_v_count := (others => '0');        -- debug only
        elsif v_count = V2_VIDEO then
          cvbs_vblank <= '1';
        elsif v_count = V2_BOTTOM_BORDER then
          cvbs_vborder <= '0';
        else
          if row_v = 11 then
            row_v := (others => '0');
            active_v_count := active_v_count + 5;   -- debug only
          else
            row_v := row_v + 1;
            active_v_count := active_v_count + 1;   -- debug only
          end if;
        end if;
        
      else
        h_count := h_count + 1;
        
        if h_count = H_FRONT_PORCH then
          cvbs_hsync <= '0';
        elsif h_count = H_HORIZ_SYNC then
          cvbs_hsync <= '1';
        elsif h_count = H_BACK_PORCH then
        elsif h_count = H_LEFT_BORDER then
          cvbs_hblank <= '0';
          active_h_count := (others => '0');
          active_h_start <= '1';
        elsif h_count = H_VIDEO then
          cvbs_hblank <= '1';
          -- only needed for debug???
          active_h_count := active_h_count + 1;
        elsif h_count = H_RIGHT_BORDER then
          null;
        else
          active_h_count := active_h_count + 1;
        end if;
      end if;

      -- generate character rom address
      char_a <= '0' & dd(5 downto 0) & row_v(3 downto 0);
     
			-- DA0 high during FS
			if cvbs_vblank = '1' then
				da0_int <= (others => '1');
			elsif cvbs_hblank = '1' then
        da0_int <= (others => '0');
      elsif cvbs_hblank_r = '1' and cvbs_hblank = '0' then
				da0_int <= "01000";
      else
        da0_int <= da0_int + 1;
			end if;

      -- generate linebuffer address
      -- - alternate every line
      cvbs_linebuf_addr <= v_count(0) & active_h_count;

      -- pipeline writes to linebuf because data is delayed 1 clock as well!
			cvbs_linebuf_we_r <= cvbs_linebuf_we;
			cvbs_linebuf_addr_r <= cvbs_linebuf_addr;
			cvbs_linebuf_we_rr <= cvbs_linebuf_we_r;
			cvbs_linebuf_addr_rr <= cvbs_linebuf_addr_r;

      cvbs_hblank_r := cvbs_hblank;

    end if; -- cvbs_clk_ena
  end process;

  -- handle latching & shifting of character, graphics data
  process (clk, reset)
    variable count : std_logic_vector(3 downto 0) := (others => '0');
  begin
    if reset = '1' then
      count := (others => '0');
    elsif rising_edge(clk) and cvbs_clk_ena = '1' then
      if active_h_start = '1' then
        count := (others => '0');
      end if;
      if an_g_s = '0' then
        -- alpha-semi modes
        if count(2 downto 0) = 0 then
          -- handle alpha-semi latching
          an_s_r <= an_s_s;
          inv_r <= inv_s;
          if an_s_s = '0' then
            dd_r <= char_d_o;                               -- alpha mode
          else
            -- store luma,chroma(2..0),luma,chroma(2..0)
            if intn_ext_s = '0' then                        -- semi-4
              if row_v < 6 then
                dd_r <= dd(3) & dd(6) & dd(5) & dd(4) & 
                        dd(2) & dd(6) & dd(5) & dd(4);
              else
                dd_r <= dd(1) & dd(6) & dd(5) & dd(4) & 
                        dd(0) & dd(6) & dd(5) & dd(4);
              end if;
            else                                            -- semi-6
              if row_v < 4 then
                dd_r <= dd(5) & css_s & dd(7) & dd(6) & 
                        dd(4) & css_s & dd(7) & dd(6);
              elsif row_v < 8 then
                dd_r <= dd(3) & css_s & dd(7) & dd(6) & 
                        dd(2) & css_s & dd(7) & dd(6);
              else
                dd_r <= dd(1) & css_s & dd(7) & dd(6) & 
                        dd(0) & css_s & dd(7) & dd(6);
              end if;
            end if;
          end if;
        else
          -- handle alpha-semi shifting
          if an_s_r = '0' then
            dd_r <= dd_r(dd_r'left-1 downto 0) & '0';       -- alpha mode
          else
            if count(1 downto 0) = 0 then
              dd_r <= dd_r(dd_r'left-4 downto 0) & "0000";  -- semi mode
            end if;
          end if;
        end if;
      else
        -- graphics modes
        --if IN_SIMULATION then
          an_s_r <= '0';
        --end if;
        case gm_s is
          when "000" | "001" | "011" | "101" =>     -- CG1/RG1/RG2/RG3
            if count(3 downto 0) = 0 then
              -- handle graphics latching
              dd_r <= dd;
            else
              -- handle graphics shifting
              if gm_s = "000" then
                if count(1 downto 0) = 0 then
                  dd_r <= dd_r(dd_r'left-2 downto 0) & "00";  -- CG1
                end if;
              else
                if count(0) = '0' then
                  dd_r <= dd_r(dd_r'left-1 downto 0) & '0';   -- RG1/RG2/RG3
                end if;
              end if;
            end if;
          when others =>                            -- CG2/CG3/CG6/RG6
            if count(2 downto 0) = 0 then
              -- handle graphics latching
              dd_r <= dd;
            else
              -- handle graphics shifting
              if gm_s = "111" then
                dd_r <= dd_r(dd_r'left-1 downto 0) & '0';     -- RG6
              else
                if count(0) = '0' then
                  dd_r <= dd_r(dd_r'left-2 downto 0) & "00";  -- CG2/CG3/CG6
                end if;
              end if;
            end if;
        end case;
      end if;
      count := count + 1;
    end if;
  end process;

  -- generate pixel data
  process (clk, reset)
    variable luma : std_logic;
    variable chroma : std_logic_vector(2 downto 0);
  begin
    if reset = '1' then
    elsif rising_edge(clk) and cvbs_clk_ena = '1' then
      -- alpha/graphics mode
      if an_g_s = '0' then
        -- alphanumeric & semi-graphics mode
        luma := dd_r(dd_r'left);
        if an_s_r = '0' then
          -- alphanumeric
          if intn_ext_s = '0' then
            -- internal rom
            chroma := (others => css_s);
            if inv_r = '1' then
              luma := not luma;
            end if; -- normal/inverse
          else
            -- external ROM?!?
          end if; -- internal/external
        else
          chroma := dd_r(dd_r'left-1 downto dd_r'left-3);
        end if; -- alphanumeric/semi-graphics
      else
        -- graphics mode
        case gm_s is
          when "000" =>                     -- CG1 64x64x4
            luma := '1';
            chroma := css_s & dd_r(dd_r'left downto dd_r'left-1);
          when "001" | "011" | "101" =>     -- RG1/2/3 128x64/96/192x2
            luma := dd_r(dd_r'left);
            chroma := css_s & "00";         -- green/buff
          when "010" | "100" | "110" =>     -- CG2/3/6 128x64/96/192x4
            luma := '1';
            chroma := css_s & dd_r(dd_r'left downto dd_r'left-1);
          when others =>                    -- RG6 256x192x2
            luma := dd_r(dd_r'left);
            chroma := css_s & "00";         -- green/buff
        end case;
      end if; -- alpha/graphics mode

      -- pack source data into line buffer
      -- - palette lookup on output
      pixel_data <= '0' & css_s & an_g_s & an_s_r & luma & chroma;

    end if;
  end process;

  -- only write to the linebuffer during active display
  cvbs_linebuf_we <= not (cvbs_vblank or cvbs_hblank);

	cvbs <= '0' & cvbs_vsync & "000000" when cvbs_vblank = '1' else
				  '0' & cvbs_hsync & "000000" when cvbs_hblank = '1' else
				  cvbs_data;

  -- assign outputs

  hs_n <= not hs_int;
  fs_n <= not fs_int;
  da0 <= da0_int(4) when (gm_s = "001" or gm_s = "011" or gm_s = "101") else
         da0_int(3);
		
	-- map the palette to the pixel data
	-- -  we do that at the output so we can use a 
	--    higher colour-resolution palette
	--    without using memory in the line buffer
  PROC_OUTPUT : process (clk)
    variable r : std_logic_vector(red'range);
    variable g : std_logic_vector(green'range);
    variable b : std_logic_vector(blue'range);
    -- for artifacting testing only
    variable p_in : std_logic_vector(vga_data'range);
    variable p_out: std_logic_vector(vga_data'range);
    variable count : std_logic := '0';
  begin
    if reset = '1' then
      count := '0';
    elsif rising_edge(clk) then
      if CVBS_NOT_VGA then
        if cvbs_clk_ena = '1' then
          if cvbs_hblank = '0' and cvbs_vblank = '0' then				
            map_palette (vga_data, r, g, b);
          else
            r := (others => '0');
            g := (others => '0');
            b := (others => '0');
          end if;
        end if;
      else
        if vga_clk_ena = '1' then
          if vga_hblank = '1' then
            count := '0';
            p_in := (others => '0');
          end if;
          if vga_hblank = '0' and vga_vblank = '0' then
            -- artifacting test only --
            if artifact_en = '1' and an_g_s = '1' and gm_s = "111" then
              if count /= '0' then
                p_out(p_out'left downto 4) := vga_data(p_out'left downto 4);
                if p_in(3) = '0' and vga_data(3) = '0' then
                  p_out(3 downto 0) := "0000";
                elsif p_in(3) = '1' and vga_data(3) = '1' then
                  p_out(3 downto 0) := "1100";
                elsif p_in(3) = '0' and vga_data(3) = '1' then
                  p_out(3 downto 0) := "1011";  -- red
                  --p_out(3 downto 0) := "1101";  -- cyan
                else
                  p_out(3 downto 0) := "1010";  -- blue
                  --p_out(3 downto 0) := "1111";  -- orange
                end if;
              end if;
              map_palette (p_out, r, g, b);
              p_in := vga_data;
            else
              map_palette (vga_data, r, g, b);
            end if;
            count := not count;
          elsif an_g_s = '1' and vga_hborder = '1' and cvbs_vborder = '1' then
            -- graphics mode, either green or buff (white)
            map_palette ("00001" & css_s & "00", r, g, b);
          else
            r := (others => '0');
            g := (others => '0');
            b := (others => '0');
          end if;
        end if;
      end if; -- CVBS_NOT_VGA
      red <= r; green <= g; blue <= b;
    end if; -- rising_edge(clk)
    
    if CVBS_NOT_VGA then
      hsync <= cvbs_hsync;
      vsync <= cvbs_vsync;
      hblank <= cvbs_hblank;
      vblank <= cvbs_vblank;
    else
      hsync <= vga_hsync;
      vsync <= vga_vsync;
      hblank <= not vga_hborder; --vga_hblank;
      vblank <= not cvbs_vborder; --vga_vblank;
    end if;
  end process PROC_OUTPUT;

	-- fixme (clocking)!!!
	
	linebuf : entity work.dpram_1r1w
		generic map
		(
			numwords_a	=> 512,
			widthad_a		=> 9
		)
		port map
		(
			wrclock		=> cvbs_clk_ena,
			wren			=> cvbs_linebuf_we_rr,
			wraddress	=> cvbs_linebuf_addr_rr,
			data			=> pixel_data,

			rdclock		=> clk,
			rdaddress	=> vga_linebuf_addr,
			q					=> vga_data
		);

  -- Character ROM
  -- - technically the rom size is 1KB or 1.5KB (T1)
  charrom_inst : entity work.sprom
		generic map
		(
			init_file			=> CHAR_ROM_FILE,
			--numwords_a		=> 2048,
			widthad_a			=> 11
		)                               
    port map
    (
      clock  		    => clk,
      address 	    => char_a,
      q 			      => char_d_o
    );

end SYN;
