library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity vga_zxspectrum is
  port(
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    id:       out slot_id;

    -- Wishbone MASTER interface
    mi_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    mi_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    mi_wb_adr_o: out std_logic_vector(maxAddrBitIncIO downto 0);
    mi_wb_sel_o: out std_logic_vector(3 downto 0);
    mi_wb_cti_o: out std_logic_vector(2 downto 0);
    mi_wb_we_o:  out std_logic;
    mi_wb_cyc_o: out std_logic;
    mi_wb_stb_o: out std_logic;
    mi_wb_ack_i: in std_logic;

    -- VGA signals
    vgaclk:     in std_logic;
    vga_hsync:  out std_logic;
    vga_vsync:  out std_logic;
    vga_b:      out std_logic;
    vga_r:      out std_logic;
    vga_g:      out std_logic;
    vga_bright: out std_logic
  );
end entity;

architecture behave of vga_zxspectrum is

  component gh_fifo_async_rrd_sr_wf is
	GENERIC (add_width: INTEGER :=8; -- min value is 2 (4 memory locations)
	         data_width: INTEGER :=8 ); -- size of data bus
	port (					
		clk_WR  : in STD_LOGIC; -- write clock
		clk_RD  : in STD_LOGIC; -- read clock
		rst     : in STD_LOGIC; -- resets counters
		srst    : in STD_LOGIC:='0'; -- resets counters (sync with clk_WR)
		WR      : in STD_LOGIC; -- write control 
		RD      : in STD_LOGIC; -- read control
		D       : in STD_LOGIC_VECTOR (data_width-1 downto 0);
		Q       : out STD_LOGIC_VECTOR (data_width-1 downto 0);
		empty   : out STD_LOGIC;
		qfull   : out STD_LOGIC;
		hfull   : out STD_LOGIC;
		qqqfull : out STD_LOGIC;
    afull   : out STD_LOGIC;
		full    : out STD_LOGIC);
  end component;

  signal fifo_full: std_logic;
  signal fifo_almost_full: std_logic;
  signal fifo_write_enable: std_logic;
  signal fifo_quad_full: std_logic;
  signal fifo_half_full: std_logic;

--  signal readclk: std_logic:='0';
  signal fifo_clear: std_logic:='0';
  signal read_enable: std_logic:='0';
  signal fifo_write, read: std_logic_vector(3 downto 0);
  signal fifo_empty: std_logic;


  signal char_wb_dat_o: std_logic_vector(wordSize-1 downto 0);
  signal char_wb_dat_i: std_logic_vector(wordSize-1 downto 0);
  signal char_wb_adr_i: std_logic_vector(maxIObit downto minIObit);
  signal char_wb_cyc_i: std_logic;
  signal char_wb_stb_i: std_logic;
  signal char_wb_ack_o: std_logic;


  signal membase:       std_logic_vector(wordSize-1 downto 0) := (others => '0');
  signal palletebase:   std_logic_vector(wordSize-1 downto 0) := (others => '0');

  type state_type is (
    fetch_char,
    fetch_pallete,
    load_char,
    fill,
    next_line,
    sleep
  );

  type vgaregs_type is record

    state:    state_type;
    chars:    std_logic_vector(wordSize-1 downto 0);
    pallete:  std_logic_vector(wordSize-1 downto 0);

    --charline: std_logic_vector(7 downto 0); -- The 8 pixels of a char row
    --charpal:  std_logic_vector(7 downto 0); -- Pallete for this char

    hptr:     integer range 0 to 79; -- horizontal counter
  
    hoff:     unsigned(4 downto 0); 
    voff:     unsigned(4 downto 0);

    memptr:        unsigned(wordSize-1 downto 0);
    palleteptr:    unsigned(wordSize-1 downto 0);

    ls_memptr:        unsigned(wordSize-1 downto 0);
    ls_palleteptr:    unsigned(wordSize-1 downto 0);

  end record;

  signal r: vgaregs_type;

--# 640x480 @ 72Hz (VESA) hsync: 37.9kHz
--ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync

--# 640x480 @ 75Hz (VESA) hsync: 37.5kHz
--ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync

--# 640x480 @ 85Hz (VESA) hsync: 43.3kHz
--ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync


  constant VGA_H_BORDER: integer := 64;
  constant VGA_H_SYNC: integer := 40;
  constant VGA_H_FRONTPORCH: integer := 24+VGA_H_BORDER;
  constant VGA_H_DISPLAY: integer := 640 - (2*VGA_H_BORDER);
  constant VGA_H_BACKPORCH: integer := 128+VGA_H_BORDER;

  constant VGA_V_BORDER: integer := 48;
  constant VGA_V_FRONTPORCH: integer := 29+VGA_V_BORDER;
  constant VGA_V_SYNC: integer := 2;
  constant VGA_V_DISPLAY: integer := 480 - (2*VGA_V_BORDER);
  constant VGA_V_BACKPORCH: integer := 9+VGA_V_BORDER;

--  constant VGA_H_BORDER: integer := 0;
--  constant VGA_H_SYNC: integer := 2;
--  constant VGA_H_FRONTPORCH: integer := 2;
--  constant VGA_H_DISPLAY: integer := 128;
--  constant VGA_H_BACKPORCH: integer := 2;

--  constant VGA_V_BORDER: integer := 0;
--  constant VGA_V_FRONTPORCH: integer := 2;
--  constant VGA_V_SYNC: integer := 2;
--  constant VGA_V_DISPLAY: integer := 192;
--  constant VGA_V_BACKPORCH: integer := 2;


  constant VGA_HCOUNT: integer :=
    VGA_H_SYNC + VGA_H_FRONTPORCH + VGA_H_DISPLAY + VGA_H_BACKPORCH;

  constant VGA_VCOUNT: integer :=
    VGA_V_SYNC + VGA_V_FRONTPORCH + VGA_V_DISPLAY + VGA_V_BACKPORCH;

  constant v_polarity: std_logic := '1';
  constant h_polarity: std_logic := '1';

  -- Pixel counters

  signal hcount_q: integer range 0 to VGA_HCOUNT;
  signal vcount_q: integer range 0 to VGA_VCOUNT;

  signal h_sync_tick: std_logic;

  signal vgarst: std_logic := '0';
  signal rstq1: std_logic:='1';
  signal rstq2: std_logic;

  signal v_display: std_logic;
  signal v_display_in_wbclk: std_logic;
  signal v_display_q: std_logic;

  --signal v_border: std_logic;

  signal cache_clear: std_logic;

  signal vga_reset_q1, vga_reset_q2: std_logic;

  signal rdly: std_logic;
  signal hdup: std_logic := '1';

  signal hflip: std_logic;

begin

  id <= x"08" & x"1C"; -- Vendor: ZPUIno  Product: ZX Spectrum over VGA
      -- Wishbone register access

  wb_dat_o(31 downto 1) <= (others => DontCareValue);
  wb_dat_o(0) <= v_display_in_wbclk;

  mi_wb_dat_o <= (others => DontCareValue);

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
     if wb_rst_i='1' then
      rdly<='0';
      wb_ack_o<='0';

     else
      if rdly='0' then
      if wb_stb_i='1' and wb_cyc_i='1' then
        if wb_we_i='1' then
          case wb_adr_i(3 downto 2) is
            when "00" =>
              membase(maxAddrBit downto 0) <= wb_dat_i(maxAddrBit downto 0);
            when "01" =>
              palletebase(maxAddrBit downto 0) <= wb_dat_i(maxAddrBit downto 0);
            when others =>
          end case;
        end if;
        wb_ack_o<='1';
        rdly <= '1';
      end if;
      else
        rdly <= '0';
        wb_ack_o<='0';
      end if;
     end if;
    end if;
  end process;


  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if (vcount_q < VGA_V_DISPLAY) then
        v_display_in_wbclk <= '1';
      else
        v_display_in_wbclk <= '0';
      end if;
    end if;
  end process;

  process(wb_clk_i, wb_rst_i, r, mi_wb_ack_i, mi_wb_dat_i,membase,palletebase)
    variable w: vgaregs_type;

    variable current_char: std_logic_vector(7 downto 0);
    variable current_pallete: std_logic_vector(7 downto 0);

    variable vdisp_char:  std_logic_vector(2 downto 0); -- Vertical offset in char (0 to 7)

    variable pixel: std_logic_vector(3 downto 0);
    variable hmax: integer range 0 to 7;

  begin
    mi_wb_stb_o <= '0';
    mi_wb_cyc_o <= '0';
    mi_wb_we_o <= '0';
    mi_wb_adr_o <= (others => '0');
    fifo_write_enable<='0';

    char_wb_cyc_i<='0';
    char_wb_stb_i<='0';
    char_wb_adr_i <= (others => DontCareValue);
    pixel := (others => DontCareValue);

--    vdisp_char := std_logic_vector(r.voff(3 downto 1)); -- Ignore last bit - will duplicate vertical line
    --if hdup='1' then

    hmax := 7;   -- 8 32-bit values = 256 bits

    --else
    --  hmax := 79;
    --end if;


    w := r;
    
    if wb_rst_i='1' or vga_reset_q1='1' then
      w.state := sleep;
      --w.palloff := (others => '0');
      fifo_clear <='1';
      w.hptr := 0;
      w.hoff := (others =>'0');
      w.voff := (others =>'0');
      w.memptr := unsigned(membase);
      w.palleteptr := unsigned(palletebase);
      mi_wb_adr_o <= (others => DontCareValue);
      w.ls_memptr := unsigned(membase);
      w.ls_palleteptr := unsigned(palletebase);

    else
      fifo_clear<='0';

      case r.state is
        when fetch_char =>

          mi_wb_stb_o <= '1';
          mi_wb_cyc_o <= '1';
          mi_wb_adr_o <= std_logic_vector( r.memptr(maxAddrBitIncIO downto 0) );

          --w.charoff := (others => '0');
          w.chars := mi_wb_dat_i;
          w.hoff := (others => '0');

          if mi_wb_ack_i='1' then
            w.state := fill;
          end if;

        when fetch_pallete =>

          mi_wb_stb_o <= '1';
          mi_wb_cyc_o <= '1';
          mi_wb_adr_o <= std_logic_vector( r.palleteptr(maxAddrBitIncIO downto 0) );
          w.pallete := mi_wb_dat_i;

          if mi_wb_ack_i='1' then
            w.state := fetch_char;
          end if;

        when fill =>

          -- Choose color
          case r.palleteptr(1 downto 0) is
            when "11" => current_pallete := r.pallete(7 downto 0);
            when "10" => current_pallete := r.pallete(15 downto 8);
            when "01" => current_pallete := r.pallete(23 downto 16);
            when "00" => current_pallete := r.pallete(31 downto 24);
            when others =>
          end case;

          --w.charpal := current_pallete;

          case r.chars(31) is
            when '1' =>
              pixel := current_pallete(6) & current_pallete(2 downto 0);
            when '0' =>
              pixel := current_pallete(6) & current_pallete(5 downto 3);
            when others =>
          end case;

          -- Other bits have extended attributes


          if fifo_almost_full='0' then

            fifo_write_enable<='1';
            -- Shift r.chars
            w.chars(31 downto 1) := r.chars(30 downto 0);
            w.chars(0) := DontCareValue;

            w.hoff := r.hoff + 1;

            if r.hoff="11111" then -- Meaning we just output the 32 bits

              if r.hptr=hmax then -- Finished a whole line
                w.hptr := 0;
                w.voff := r.voff + 1;
                if r.voff(0)='1' then
                  -- Finished a whole character line
                  w.memptr := r.memptr + 4;
                  if r.voff(3 downto 0) /="1111" then
                    w.palleteptr := r.ls_palleteptr;
                  else
                    w.palleteptr := r.palleteptr + 1;
                  end if;

                  w.state := next_line;

                else
                  w.memptr := r.ls_memptr;
                  w.palleteptr := r.ls_palleteptr;
                  w.state := sleep;
                end if;
              else
                -- Still doing a line
                w.hptr := w.hptr + 1;
                w.memptr := r.memptr + 4;
                w.palleteptr := r.palleteptr + 1;
            
                --if r.palleteptr(1 downto 0)="11" then
                  -- Increase pointer
                  w.state := fetch_pallete;
                --elsif r.memptr(1 downto 0)="11" then
                  -- Increase pointer
                --else
                --  w.state := fetch_char;
                --end if;
                --else
                --  w.state := load_char;
                --end if;
              end if;
            else
              if r.hoff(2 downto 0)="111" then -- Just output 8 bits

                w.palleteptr := r.palleteptr + 1;

                if r.palleteptr(1 downto 0)="11" then
                  -- Increase pointer
                  w.state := fetch_pallete;
                end if;
              end if;
            end if;
          end if;

        when sleep =>
          w.state := fetch_pallete;

        when next_line =>
          if r.voff(3 downto 0)="0000" then
            w.ls_palleteptr := r.palleteptr;
          end if;
          w.ls_memptr := r.memptr;

          w.state := fetch_pallete;

        when others =>
      end case;

    end if;

    fifo_write <= pixel;



    if rising_edge(wb_clk_i) then

      r <= w;

    end if;
   end process;

  --
  --
  --  VGA part
  --
  --
  process(vgaclk, wb_rst_i)
  begin
    if wb_rst_i='1' then
      rstq1 <= '1';
      rstq2 <= '1';
    elsif rising_edge(vgaclk) then
      rstq1 <= rstq2;
      rstq2 <= '0';
    end if;
  end process;
  vgarst <= rstq1;


  hcounter: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        hcount_q <= VGA_H_DISPLAY + VGA_H_BACKPORCH - 1;
      else
        if hcount_q = VGA_HCOUNT then
          hcount_q <= 0;
        else
          hcount_q <= hcount_q + 1;
        end if;
      end if;
    end if;
  end process;

  process(hcount_q, vcount_q)
  begin
    if hcount_q < VGA_H_DISPLAY  and vcount_q < VGA_V_DISPLAY then
      v_display<='1';
    else
      v_display<='0';
    end if;
  end process;

  process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      v_display_q <= v_display;
    end if;
  end process;


  hsyncgen: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        vga_hsync<=h_polarity;
      else
        h_sync_tick <= '0';
        if hcount_q = (VGA_H_DISPLAY + VGA_H_FRONTPORCH) then
          h_sync_tick <= '1';
          vga_hsync <= not h_polarity;
        elsif hcount_q = (VGA_HCOUNT - VGA_H_BACKPORCH) then
          vga_hsync <= h_polarity;
        end if;
      end if;
    end if;
  end process;

  vcounter: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        vcount_q <= VGA_V_DISPLAY + VGA_V_BACKPORCH - 1;
      else
       if vcount_q = VGA_VCOUNT then
          vcount_q <= 0;
          report "V finished" severity note;
       else
          if h_sync_tick='1' then
            vcount_q <= vcount_q + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  -- Cache clear.

  vclear: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        cache_clear <= '1';
      else
        cache_clear<='0';
        --if  vcount_q = VGA_V_DISPLAY and h_sync_tick='1' then
        --  cache_clear<='1';
        --end if;
        if not (vcount_q < VGA_V_DISPLAY) then
          cache_clear <='1';
        end if;
      end if;
    end if;
  end process;

  vsyncgen: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        vga_vsync<=v_polarity;
        --cache_clear <= '1';
      else
        --cache_clear <= '0';
        if vcount_q = (VGA_V_DISPLAY + VGA_V_FRONTPORCH) then
          vga_vsync <= not v_polarity;
        elsif vcount_q = (VGA_VCOUNT - VGA_V_BACKPORCH) then
          vga_vsync <= v_polarity;
          --cache_clear <= '1';
        end if;
      end if;
    end if;
  end process;

  -- Synchronous output
  process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if v_display='0' then
          vga_b <= '0';
          vga_r <= '0';
          vga_g <= '0';
          vga_bright <= '0';
      else
          vga_b <= read(0);
          vga_r <= read(1);
          vga_g <= read(2);
          vga_bright <= read(3);
      end if;
    end if;
  end process;


  process(wb_clk_i,cache_clear)
  begin
    if cache_clear='1' then
      vga_reset_q1<='1';
      vga_reset_q2<='1';
    elsif rising_edge(wb_clk_i) then
      vga_reset_q2<='0';
      vga_reset_q1<=vga_reset_q2;
    end if;
  end process;

  -- In order to perform H duplication, we use a trick here

  process(vgaclk,v_display,v_display_q)
  begin
    if rising_edge(vgaclk) then
      if v_display='1' and v_display_q='0' then
        -- Starting an horizontal line display, reset hflip if needed
        hflip <= '1';
      else
        if v_display='0' then
          hflip <='0';
        else
          hflip <= hflip xor hdup;
        end if;
      end if;                     
    end if;
  end process;

  read_enable <= v_display and not hflip;



  myfifo: gh_fifo_async_rrd_sr_wf
  generic map (
    data_width => 4,
    add_width => 4
  )
  port map (
		clk_WR  => wb_clk_i,
		clk_RD  => vgaclk,
		rst     => '0',
		srst    => fifo_clear,
		WR      => fifo_write_enable,
		RD      => read_enable,
		D       => fifo_write,
		Q       => read,
		empty   => fifo_empty,
		qfull   => fifo_quad_full,
		hfull   => fifo_half_full,
		qqqfull => fifo_almost_full,
		full    => fifo_full
  );

end behave;
