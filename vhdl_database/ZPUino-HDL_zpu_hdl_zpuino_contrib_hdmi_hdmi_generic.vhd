library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

Library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.wishbonepkg.all;

entity hdmi_generic is
  generic (
    CLKIN_PERIOD: real := 0.001;
    CLKFB_MULT: integer := 10;
    CLK0_DIV: integer := 10;
    CLK1_DIV: integer := 10;
    CLK2_DIV: integer := 10
  );
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
    mi_wb_stall_i: in std_logic;

    -- clocking

    -- Base clock (goes to PLL)
    BCLK :    in std_ulogic;
    tmds    : out  STD_LOGIC_VECTOR(3 downto 0);
    tmdsb   : out  STD_LOGIC_VECTOR(3 downto 0)
  );
end entity;

architecture behave of hdmi_generic is

  signal fifo_almost_full: std_logic;
  signal fifo_write_enable: std_logic;
  signal fifo_clear: std_logic:='0';
  signal read_enable: std_logic:='0';
  signal fifo_write, read: std_logic_vector(31 downto 0);
  signal vga_hsync, vga_vsync: std_logic;
  signal vga_b, vga_r: std_logic_vector(4 downto 0);
  signal vga_g: std_logic_vector(5 downto 0);
  signal membase:       std_logic_vector(wordSize-1 downto 0) := (others => '0');

  type state_type is (
    idle,
    fill
  );

  subtype counter_type is unsigned(11 downto 0); -- limit 0-2047 on each counter. Limits resolution.

  type vgaregs_type is record

    state:    state_type;
    chars:    std_logic_vector(wordSize-1 downto 0);
    hptr:     counter_type;
    hoff:     unsigned(4 downto 0);
    voff:     unsigned(4 downto 0);

    memptr:           unsigned(wordSize-1 downto 0);
    -- Wishbone
    adr:  std_logic_vector(31 downto 0);
    fillptr: counter_type;
  end record;


  signal r: vgaregs_type;

  constant GUARD_PIXELS: integer := 2;

  signal VGA_H_DISPLAY:       counter_type;
  signal VGA_H_D_BACKPORCH:   counter_type;
  signal VGA_H_D_B_SYNC:      counter_type;


  signal VGA_V_DISPLAY:       counter_type;
  signal VGA_V_D_BACKPORCH:   counter_type;
  signal VGA_V_D_B_SYNC:      counter_type;

  signal VGA_HCOUNT:          counter_type;
  signal VGA_VCOUNT:          counter_type;
 
  signal v_polarity:        std_logic := '1';
  signal h_polarity:        std_logic := '1';

  -- Pixel counters

  signal hcount_q: counter_type;
  signal vcount_q: counter_type;
  signal mode332: std_logic;
  signal duplicate: std_logic;


  signal h_sync_tick: std_logic;

  signal vgarst: std_logic := '0';
  signal rstq1: std_logic:='1';
  signal rstq2: std_logic;

  signal v_display: std_logic;
  signal v_display_in_wbclk: std_logic;
  signal v_display_q: std_logic;

  signal cache_clear: std_logic;

  signal vga_reset_q1, vga_reset_q2: std_logic;
  signal bufpll_lock, pll_locked: std_ulogic;

  signal ack_i: std_logic;
  signal hdup: std_logic := '1';

  signal hflip: std_logic;

  constant BURST_SIZE: integer := 16;

  signal red_s, blue_s, green_s, clock_s: std_ulogic;

  signal v_display_neg: std_logic;
  signal guard: std_logic; -- Video Display Guard
  signal startp:std_logic; -- Start of video period (8 words)

  signal vga_data_out, pll_data_out: std_logic_vector(31 downto 0);
  signal disp_enable: std_logic;

  constant ENABLE_DUPLICATION: boolean := false;
  signal CLK_PIX: std_ulogic;
  signal CLK_X2: std_ulogic;
  signal CLK_P: std_ulogic;
  signal pll_ack: std_logic;
  signal rst: std_logic;

  signal dataisland:  std_logic;
  signal d0,d1,d2:  std_logic_vector(3 downto 0);
  signal islandcount: integer range 0 to 31;
  signal start_island: std_logic;
  type datastate_type is (
    IDLE,
    PREAMBLE,
    GUARD1,
    DATA,
    GUARD2
  );
  signal datastate: datastate_type;
  signal indata: std_logic;

  signal bctrl_sob:   std_logic;
  signal bctrl_rnext: std_logic;
  signal bctrl_wnext: std_logic;
  signal bctrl_req:   std_logic;
  signal bctrl_eob:   std_logic;


begin

      -- Wishbone register access
  id <= x"08" & x"21"; -- Vendor: ZPUIno  Product: HDMI Generic 16-bit

  wb_dat_o <= vga_data_out when wb_adr_i(10)='0' else pll_data_out;

  vga_data_out(31 downto 1) <= (others => '0');
  vga_data_out(0) <= v_display_in_wbclk;

  mi_wb_dat_o <= (others => DontCareValue);
  mi_wb_we_o <= '0';

  wb_ack_o <= ack_i when wb_adr_i(10)='0' else pll_ack;

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
     if wb_rst_i='1' then
      ack_i <= '0';
      membase <= (others => '0');
      -- synthesis translate_off
      disp_enable<='1';
      h_polarity<='0';
      v_polarity<='0';
      --640,  656,   752, 800, 480, 490,  492, 525
      VGA_H_DISPLAY <=      to_unsigned(640, counter_type'length);
      VGA_H_D_BACKPORCH <=  to_unsigned(656, counter_type'length);
      VGA_H_D_B_SYNC <=     to_unsigned(752, counter_type'length);
      VGA_HCOUNT <=         to_unsigned(800, counter_type'length);

      VGA_V_DISPLAY <=      to_unsigned(480, counter_type'length);
      VGA_V_D_BACKPORCH <=  to_unsigned(482, counter_type'length);
      VGA_V_D_B_SYNC <=     to_unsigned(484, counter_type'length);
      VGA_VCOUNT <=         to_unsigned(486, counter_type'length);
      -- synthesis translate_on
     else
      if wb_stb_i='1' and wb_cyc_i='1' and ack_i='0' then
       ack_i<='1';

          if wb_adr_i(10)='0' then

          if wb_we_i='1' then
            case wb_adr_i(5 downto 2) is
              when "0000" =>
                membase <= wb_dat_i(membase'range);
              when "0010" =>
                disp_enable <= wb_dat_i(0);
              when "0011" =>
                h_polarity <= wb_dat_i(0);
                v_polarity <= wb_dat_i(1);
                mode332    <= wb_dat_i(2);
                if ENABLE_DUPLICATION then
                  duplicate  <= wb_dat_i(3);
                end if;
              when "1000" =>
                VGA_H_DISPLAY             <= unsigned(wb_dat_i(counter_type'range));
              when "1001" =>
                VGA_H_D_BACKPORCH         <= unsigned(wb_dat_i(counter_type'range));
              when "1010" =>
                VGA_H_D_B_SYNC            <= unsigned(wb_dat_i(counter_type'range));
              when "1011" =>
                VGA_HCOUNT                <= unsigned(wb_dat_i(counter_type'range));
              when "1100" =>
                VGA_V_DISPLAY             <= unsigned(wb_dat_i(counter_type'range));
              when "1101" =>
                VGA_V_D_BACKPORCH         <= unsigned(wb_dat_i(counter_type'range));
              when "1110" =>
                VGA_V_D_B_SYNC            <= unsigned(wb_dat_i(counter_type'range));
              when "1111" =>
                VGA_VCOUNT                <= unsigned(wb_dat_i(counter_type'range));
              when others =>
            end case;
          end if;
        end if;
      else
        ack_i <= '0';
      end if;
     end if;
    end if;
  end process;

  process(vcount_q, hcount_q)
  begin
    startp <= '0';
    guard <= '0';
    if vcount_q < VGA_V_DISPLAY then
      if hcount_q > (VGA_HCOUNT - 8 - GUARD_PIXELS) then
        startp <= '1';
      end if;
      if (hcount_q > VGA_HCOUNT-GUARD_PIXELS) then
        guard <= '1';
      end if;
    else
      if (datastate=GUARD1 or datastate=GUARD2) then
        guard<='1';
      end if;
      if (datastate=PREAMBLE) then
        startp<='1';
      end if;
      -- startp....
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

  --mi_wb_stb_o <= r.stb;
  --mi_wb_cyc_o <= r.cyc;
  mi_wb_adr_o(maxAddrBit downto 0) <= std_logic_vector( r.memptr(maxAddrBit downto 0) );
  mi_wb_adr_o(maxAddrBitIncIO downto maxAddrBit+1) <= (others => '0');


  burstctl: entity work.wb_burstctrl
    port map (
      clk     => wb_clk_i,
      rst     => wb_rst_i,
      sob     => bctrl_sob,
      eob     => bctrl_eob,
      cti     => mi_wb_cti_o,
      stb     => mi_wb_stb_o,
      cyc     => mi_wb_cyc_o,
      stall   => mi_wb_stall_i,
      ack     => mi_wb_ack_i,
      req     => bctrl_req,
      rnext   => bctrl_rnext,
      wnext   => bctrl_wnext
    );



  process(wb_clk_i, wb_rst_i, r, mi_wb_ack_i, mi_wb_dat_i, membase)
    variable w: vgaregs_type;
  begin

    w := r;

    fifo_write_enable<='0';
    fifo_clear<='0';

    case r.state is
      when idle =>
        -- If we can proceed to FIFO fill, do it
        if fifo_almost_full='0' and vga_reset_q1='0' then
          bctrl_sob<='1';
          w.state := fill;
        else
          bctrl_sob<='0';
        end if;

        if vga_reset_q1='1' then
          fifo_clear<='1';
          w.memptr := unsigned(membase);
        end if;

      when fill =>
        bctrl_sob<='0';
        fifo_write_enable <= mi_wb_ack_i;

        if bctrl_wnext='1' then
          w.memptr := r.memptr + 4;
        end if;

        if bctrl_eob='1' then
          w.state := idle;
        end if;

      when others =>
    end case;

    fifo_write<=mi_wb_dat_i;

    if wb_rst_i='1' then
      w.state := idle;
      --fifo_clear <='1';
      w.hptr := (others =>'0');
      w.hoff := (others =>'0');
      w.voff := (others =>'0');
      w.adr := (others => DontCareValue);
    end if;

    if rising_edge(wb_clk_i) then
      r <= w;
    end if;
   end process;

  --
  --
  --  VGA part
  --
  --
  process(CLK_PIX, bufpll_lock, pll_locked, rst)
  begin
    if bufpll_lock='0' or pll_locked='0' or rst='1' then
      rstq1 <= '1';
      rstq2 <= '1';
    elsif rising_edge(CLK_PIX) then
      rstq1 <= rstq2;
      rstq2 <= '0';
    end if;
  end process;
  vgarst <= rstq1;


  hcounter: process(CLK_PIX)
  begin
    if rising_edge(CLK_PIX) then
      if vgarst='1' then
        hcount_q <= VGA_H_D_BACKPORCH;
      else
        if hcount_q = VGA_HCOUNT then
          hcount_q <= (others =>'0');
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

      if vcount_q = VGA_V_D_BACKPORCH and hcount_q=0 then
        start_island<='1';
      else
        start_island<='0';
      end if;

  end process;

  process(CLK_PIX)
  begin
    if rising_edge(CLK_PIX) then
      v_display_q <= v_display;
    end if;
  end process;


  hsyncgen: process(CLK_PIX)
  begin
    if rising_edge(CLK_PIX) then
      if vgarst='1' then
        vga_hsync<=h_polarity;
      else
        h_sync_tick <= '0';
        if hcount_q = VGA_H_D_BACKPORCH then
          h_sync_tick <= '1';
          vga_hsync <= not h_polarity;
        elsif hcount_q = VGA_H_D_B_SYNC - GUARD_PIXELS then
          vga_hsync <= h_polarity;
        end if;
      end if;
    end if;
  end process;

  vcounter: process(CLK_PIX)
  begin
    if rising_edge(CLK_PIX) then
      if vgarst='1' then
        vcount_q <= VGA_V_D_BACKPORCH;
      else
       if vcount_q = VGA_VCOUNT then
          vcount_q <= (others =>'0');
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

  vclear: process(CLK_PIX)
  begin
    if rising_edge(CLK_PIX) then
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

  vsyncgen: process(CLK_PIX)
  begin
    if rising_edge(CLK_PIX) then
      if vgarst='1' then
        vga_vsync<=v_polarity;
        --cache_clear <= '1';
      else
        --cache_clear <= '0';
        if vcount_q = VGA_V_D_BACKPORCH then
          vga_vsync <= not v_polarity;
        elsif vcount_q = VGA_V_D_B_SYNC then
          vga_vsync <= v_polarity;
          --cache_clear <= '1';
        end if;
      end if;
    end if;
  end process;

  v_display_neg <= not v_display;

  mydvid: entity work.dvid
    port map (
      clk        => CLK_P,
      clk_pixel  => CLK_PIX,
      clk2x      => CLK_X2,
      pll_locked => pll_locked,
      lock_out   => bufpll_lock,

      red_p(7 downto 3) => vga_r,
      red_p(2 downto 0) => "000",
      green_p(7 downto 2) => vga_g,
      green_p(1 downto 0) => "00",
      blue_p(7 downto 3) => vga_b,
      blue_p(2 downto 0) => "000",

      blank             => v_display_neg,
      guard             => guard,
      startp            => startp,
      hsync             => vga_hsync,
      vsync             => vga_vsync,

      dataisland        => dataisland,
      data0             => d0,
      data1             => d1,
      data2             => d2,
      indata            => indata,

      red_s     => red_s,
      green_s   => green_s,
      blue_s    => blue_s,
      clock_s   => clock_s
    );

  -- Asynchronous output
  process(read,hflip)
  begin
    --if rising_edge(CLK_PIX) then
      if v_display='0' then
          vga_b <= (others => '0');
          vga_r <= (others => '0');
          vga_g <= (others => '0');
      else
          if hflip='0' then
            vga_r <= read(15 downto 11);
            vga_g <= read(10 downto 5);
            vga_b <= read(4 downto 0);
          else
            vga_r <= read(31 downto 27);
            vga_g <= read(26 downto 21);
            vga_b <= read(20 downto 16);
          end if;
      end if;
    --end if;
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

  process(CLK_PIX,v_display,v_display_q)
  begin
    if rising_edge(CLK_PIX) then
      if v_display='1' and v_display_q='0' then
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

  process(islandcount)
    variable idx: integer;
  begin
    idx := 31-islandcount;
    case idx is
      when 0 =>
        d0 <= '0' & '0' & vga_vsync & vga_hsync;
        d1 <= (others => '0');
        d2 <= (others => '0');
      when others =>
        d0 <= '1' & '0' & vga_vsync & vga_hsync;
        d1 <= (others => '0');
        d2 <= (others => '0');
    end case;
  end process;

  indata <= '1' when datastate/=IDLE else '0';

  process(CLK_PIX)
  begin
    if rising_edge(CLK_PIX) then
      if vgarst='1' then
        datastate<=IDLE;
        dataisland<='0';
        islandcount<=31;
      else
        case datastate is
          when IDLE =>
            islandcount<=7;
            if start_island='1' then
              datastate <= PREAMBLE;
            end if;
          when PREAMBLE =>
            if islandcount=0 then
              islandcount<=1;
              datastate<=GUARD1;
            else
              islandcount<=islandcount-1;
            end if;
          when GUARD1 =>
            if islandcount=0 then
              dataisland<='1';
              islandcount<=31;
              datastate<=DATA;
            else
              islandcount<=islandcount-1;
            end if;
          when DATA =>
            if islandcount=0 then
              islandcount<=1;
              datastate<=GUARD2;
              dataisland<='0';
            else
              islandcount<=islandcount-1;
            end if;
          when GUARD2 =>
            if islandcount=0 then
              datastate<=IDLE;
            else
              islandcount<=islandcount-1;
            end if;
        end case;
      end if;
    end if;
  end process;

  read_enable <= (v_display and not guard) and not hflip;

  OBUFDS_blue  : OBUFDS port map ( O  => TMDS(0), OB => TMDSB(0), I  => blue_s  );
  OBUFDS_green : OBUFDS port map ( O  => TMDS(1), OB => TMDSB(1), I  => green_s );
  OBUFDS_red   : OBUFDS port map ( O  => TMDS(2), OB => TMDSB(2), I  => red_s   );
  OBUFDS_clock : OBUFDS port map ( O  => TMDS(3), OB => TMDSB(3), I  => clock_s );

--  myfifo: gh_fifo_async_rrd_sr_wf
--  generic map (
--    data_width => 30,
--    add_width => 8
--  )
--  port map (
--		clk_WR  => wb_clk_i,
--		clk_RD  => CLK_PIX,
--		rst     => '0',
--		srst    => fifo_clear,
--		WR      => fifo_write_enable,
--		RD      => read_enable,
--		D       => fifo_write,
--		Q       => read,
--		empty   => fifo_empty,
--		qfull   => fifo_quad_full,
--		hfull   => fifo_half_full,
--		qqqfull => fifo_almost_full,
--		full    => fifo_full
--  );

  myfifo: entity work.async_fifo
    generic map (
      data_bits => 32,
      address_bits => 8,
      threshold => 220
    )
    port map (
      clk_r   => CLK_PIX,
      clk_w   => wb_clk_i,
      arst    => fifo_clear,
      wr      => fifo_write_enable,
      rd      => read_enable,
      read    => read,
      write   => fifo_write,
      almost_full => fifo_almost_full
    );

  clocking: block
    signal clk0, clk1, clk2: std_ulogic;
    signal pll_stb: std_logic;
  begin

  pll_stb<='1' when wb_adr_i(10)='1' and wb_cyc_i='1' and wb_stb_i='1' else '0';

  pllinst: entity work.wbpll2
    generic map (
    CLKIN_PERIOD  => CLKIN_PERIOD,
    CLKFB_MULT    => CLKFB_MULT,
    CLK0_DIV      => CLK0_DIV,
    CLK1_DIV      => CLK1_DIV,
    CLK2_DIV      => CLK2_DIV,
    CLK1_ENABLE   => true,
    CLK2_ENABLE   => true,
    BUFFER0       => false,
    BUFFER1       => true,
    BUFFER2       => true
  )
  port map (
    wb_clk_i  => wb_clk_i,
	 	wb_rst_i  => wb_rst_i,
    wb_dat_o  => pll_data_out,
    wb_dat_i  => wb_dat_i,
    wb_adr_i  => wb_adr_i,
    wb_we_i   => wb_we_i,
    wb_cyc_i  => wb_cyc_i,
    wb_stb_i  => pll_stb,
    wb_ack_o  => pll_ack,

    clkin     => BCLK,
    clk0      => clk0,
    clk1      => clk1,
    clk2      => clk2,
    rst       => rst,
    locked    => pll_locked,
    lock_in   => bufpll_lock
  );

  CLK_P   <= clk0;
  CLK_X2  <= clk1;
  CLK_PIX <= clk2;

  end block;

end behave;
