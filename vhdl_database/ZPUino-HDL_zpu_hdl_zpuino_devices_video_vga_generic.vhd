library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

library unisim;
use unisim.vcomponents.all;

entity vga_generic is
  generic (
    ENABLE_DUPLICATION: boolean := true
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

    -- VGA signals
    clk_42mhz:     in std_logic;
    vga_hsync:  out std_logic;
    vga_vsync:  out std_logic;
    vga_b:      out std_logic_vector(4 downto 0);
    vga_r:      out std_logic_vector(4 downto 0);
    vga_g:      out std_logic_vector(5 downto 0);
    blank:      out std_logic
  );
end entity;

architecture behave of vga_generic is

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
  signal fifo_read_enable: std_logic:='0';
  signal fifo_write, read: std_logic_vector(31 downto 0);
  signal fifo_empty: std_logic;


  signal char_wb_dat_o: std_logic_vector(wordSize-1 downto 0);
  signal char_wb_dat_i: std_logic_vector(wordSize-1 downto 0);
  signal char_wb_adr_i: std_logic_vector(maxIObit downto minIObit);
  signal char_wb_cyc_i: std_logic;
  signal char_wb_stb_i: std_logic;
  signal char_wb_ack_o: std_logic;

                      -- Mem size: 614400 bytes.
                        -- Page:
  signal membase:       std_logic_vector(mi_wb_adr_o'high downto 2) := (others => '0');
  --signal palletebase:   std_logic_vector(wordSize-1 downto 0) := (others => '0');

  type state_type is (
    idle,
    fill
  );

  subtype counter_type is unsigned(11 downto 0); -- limit 0-2047 on each counter. Limits resolution.

  type vgaregs_type is record

    state:    state_type;
    chars:    std_logic_vector(wordSize-1 downto 0);
    memptr:   unsigned(mi_wb_adr_o'high downto 2);

    rburst, wburst: integer;

    -- Wishbone
    cyc:  std_logic;
    stb:  std_logic;
  end record;

  signal r: vgaregs_type;


  signal VGA_H_DISPLAY:   counter_type;
  signal VGA_H_D_BACKPORCH:  counter_type;
  signal VGA_H_D_B_SYNC:          counter_type;


  signal VGA_V_DISPLAY:   counter_type;
  signal VGA_V_D_BACKPORCH:  counter_type;
  signal VGA_V_D_B_SYNC:          counter_type;

  signal VGA_HCOUNT:          counter_type;
  signal VGA_VCOUNT:          counter_type;
 
  signal v_polarity:        std_logic := '1';
  signal h_polarity:        std_logic := '1';

  -- Pixel counters

  signal hcount_q: counter_type;
  signal vcount_q: counter_type;

  signal h_sync_tick: std_logic;

  signal vgarst: std_logic := '0';
  signal rstq1: std_logic:='1';
  signal rstq2: std_logic;

  signal v_display: std_logic;
  signal v_display_in_wbclk: std_logic;           
  signal v_display_q: std_logic;

  signal mode332:  std_logic;

  signal cache_clear: std_logic;

  signal vga_reset_q1, vga_reset_q2: std_logic;

  signal ack_i: std_logic;
  signal hdup: std_logic := '1';

  signal hflip, hflip2, hflip3: std_logic;

  constant BURST_SIZE: integer := 16;

  signal disp_enable: std_logic;
  signal duplicate:   std_logic;

  component wbpll is
  generic (
    CLKIN_PERIOD: real;
    CLKFB_MULT: integer;
    CLK0_DIV: integer
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

    clkin:    in std_logic;
    clkout:   out std_logic;
    locked:   out std_logic
  );
  end component;

  signal vga_data_out, pll_data_out: std_logic_vector(31 downto 0);
  signal vga_stb, pll_stb: std_logic;
  signal vga_ack, pll_ack: std_logic;
  signal vgaclk: std_ulogic;

  signal lineram_ena, lineram_enb, lineram_wea: std_logic;
  signal lineram_dia, lineram_dob: std_logic_vector(31 downto 0);
  signal lineram_addra, lineram_addrb: unsigned(9 downto 0);
  signal read_enable_q: std_logic;

  signal bctrl_sob:   std_logic;
  signal bctrl_rnext: std_logic;
  signal bctrl_wnext: std_logic;
  signal bctrl_req:   std_logic;
  signal bctrl_eob:   std_logic;

begin

  -- Wishbone register access
  id <= x"08" & x"1D"; -- Vendor: ZPUIno  Product: VGA Generic 16-bit

  mi_wb_dat_o <= (others => DontCareValue);
  mi_wb_we_o <= '0';

  wb_dat_o <= vga_data_out when wb_adr_i(9)='0' else pll_data_out;
  wb_ack_o <= vga_ack when wb_adr_i(9)='0' else pll_ack;
  vga_stb <= wb_stb_i when wb_adr_i(9)='0' else '0';
  pll_stb <= wb_stb_i when wb_adr_i(9)='1' else '0';
  

  process(wb_adr_i, v_display_in_wbclk)
    variable r: unsigned(15 downto 0);
  begin
    vga_data_out(31 downto 0) <= (others => '0');
    case wb_adr_i(3 downto 2) is
      when "00" =>
        vga_data_out(0) <= v_display_in_wbclk;
      when "01" =>
        -- Not used.
      when "10" =>
        -- Pixel format
      when "11" =>
      when others =>
    end case;
  end process;

  vga_ack <= ack_i;

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
       ack_i <= '0';
       membase<=(others => 'X');
       disp_enable<='0';
       mode332<='0';
       duplicate<='0';

       VGA_H_D_B_SYNC     <= (others => '0');
       VGA_H_D_BACKPORCH  <= (others => '0');
       VGA_H_DISPLAY      <= (others => '0');
       VGA_HCOUNT         <= (others => '0');

       VGA_V_DISPLAY      <= (others => '0');
       VGA_V_D_BACKPORCH  <= (others => '0');
       VGA_V_D_B_SYNC     <= (others => '0');
       VGA_VCOUNT         <= (others => '0');
     
       v_polarity         <= '1';
       h_polarity         <= '1';



      else
        ack_i<='0';
        if vga_stb='1' and wb_cyc_i='1' and ack_i='0' then
          ack_i<='1';
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

  mi_wb_adr_o <= std_logic_vector( r.memptr ) & "00";

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


  process(wb_clk_i, wb_rst_i, r, mi_wb_ack_i, mi_wb_dat_i, membase, fifo_almost_full, vga_reset_q1,mi_wb_stall_i,disp_enable)
    variable w: vgaregs_type;
  begin

    fifo_write_enable<='0';

    w := r;
    
    if wb_rst_i='1' then
      w.state := idle;
      fifo_clear <='1';
      bctrl_sob <= 'X';
    else

      fifo_clear<='0';
      bctrl_sob <= '0';

      case r.state is

        when idle =>
          -- If we can proceed to FIFO fill, do it
          if fifo_almost_full='0' and vga_reset_q1='0' then
            w.state := fill;
            bctrl_sob <= '1';
          end if;

          if vga_reset_q1='1' then
            fifo_clear <= '1';
            w.memptr := unsigned(membase);
          end if;

        when fill =>

          fifo_write_enable <= mi_wb_ack_i;

          if bctrl_wnext='1' then
            w.memptr := r.memptr + 1;
          end if;

          if bctrl_eob='1' then
            w.state := idle;
          end if;

        when others =>
      end case;

    end if;

    fifo_write <= mi_wb_dat_i;

    if rising_edge(wb_clk_i) then

      r <= w;

    end if;
   end process;

  --
  --
  --  VGA part
  --
  --
  process(vgaclk, wb_rst_i,disp_enable)
  begin
    if wb_rst_i='1' or disp_enable='0' then
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
        hcount_q <= VGA_H_D_BACKPORCH;
      else
        if hcount_q = VGA_HCOUNT then
          hcount_q <= (others => '0');
        else
          hcount_q <= hcount_q + 1;
        end if;
      end if;
    end if;
  end process;

  process(hcount_q, vcount_q,VGA_H_DISPLAY,VGA_V_DISPLAY)
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
        if hcount_q = VGA_H_D_BACKPORCH then
          h_sync_tick <= '1';
          vga_hsync <= not h_polarity;
        elsif hcount_q = VGA_H_D_B_SYNC then
          vga_hsync <= h_polarity;
        end if;
      end if;
    end if;
  end process;

  vcounter: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        vcount_q <= VGA_V_D_BACKPORCH;
      else
       if vcount_q = VGA_VCOUNT then
          vcount_q <= (others => '0');
          report "V finished" severity note;
       else
          if h_sync_tick='1' then
            vcount_q <= vcount_q + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  vsyncgen: process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if vgarst='1' then
        cache_clear<='1';
        vga_vsync<=v_polarity;
      else
        if vcount_q = VGA_V_D_BACKPORCH then
          vga_vsync <= not v_polarity;
        elsif vcount_q = VGA_V_D_B_SYNC then
          vga_vsync <= v_polarity;
          cache_clear<='0';
        end if;

        if vcount_q = VGA_V_DISPLAY then
          cache_clear<='1';
        elsif vcount_q = VGA_V_D_B_SYNC then
          cache_clear<='0';
        end if;

      end if;
    end if;
  end process;

  dupmem: if ENABLE_DUPLICATION generate

    lineram: generic_dp_ram
      generic map (
        address_bits    => 10,
        data_bits       => 32
      )
      port map (
        clka  => vgaclk,
        ena   => lineram_ena,
        wea   => lineram_wea,
        addra => std_logic_vector(lineram_addra),
        dia   => lineram_dia,
        doa   => open,
        clkb  => vgaclk,
        enb   => lineram_enb,
        web   => '0',
        addrb => std_logic_vector(lineram_addrb),
        dib   => x"00000000",
        dob   => lineram_dob
      );

      --lineram_addra <= hcount_q(10 downto 1) when mode332='1' else hcount_q(10 downto 1);
      --lineram_addra <= lineram_addrb;

      process(v_display,hflip,hflip2,mode332,duplicate,read_enable,read_enable_q,vcount_q)
      begin
        --if mode332='0' then
        --  read_enable <= v_display and not hflip;
        --  lineram_wea <= hflip and not vcount_q(0);
        --  lineram_enb <= ((hflip) or not v_display) and duplicate;
        --else
        --  lineram_wea <= hflip and hflip2 and not vcount_q(0);
        --  lineram_enb <= ((hflip and not hflip2) or not v_display) and duplicate;

        --  read_enable <= v_display and hflip2 and not hflip;
        --end if;
        lineram_wea <= read_enable_q and not vcount_q(0);
        lineram_enb <= (read_enable_q or not v_display) and duplicate;
      end process;


      --lineram_wea <= hflip and hflip2 and not vcount_q(0);
      --lineram_enb <= ((hflip and hflip2) or not v_display) and duplicate;
      lineram_ena <= duplicate;
      lineram_dia <= read;

      process(vgaclk)
      begin
        if rising_edge(vgaclk) then
          lineram_addra<=lineram_addrb;
          if v_display='0' then
            lineram_addrb <= (others => '0');
            read_enable_q<='0';
          else
            read_enable_q<=read_enable;
            --if mode332='1' then
            --  if (v_display and hflip2 and not hflip)='1' then
            --   lineram_addrb<=lineram_addrb+1;
            --  end if;
            --else
            --  if (v_display and hflip)='1' then
            --    lineram_addrb<=lineram_addrb+1;
            --  end if;
            --end if;
            if read_enable='1' then
              lineram_addrb<=lineram_addrb+1;
            end if;
          end if;
        end if;
      end process;

  end generate;

  
  so: block
      signal dbg_vgadata: std_logic_vector(31 downto 0);
      signal dbg_lowhigh: std_logic;
  begin

  -- Synchronous output
  process(vgaclk,vcount_q,hflip,hflip2,duplicate)
    variable sel: std_logic_vector(1 downto 0);
    variable vga_data: std_logic_vector(31 downto 0);
    variable lowhigh: std_logic;
  begin
    sel := hflip2 & hflip;
    if duplicate='1' and vcount_q(0)='1' then
      vga_data := lineram_dob;
    else
      vga_data := read;
    end if;

    if duplicate='1' then
      lowhigh:=hflip2;
    else
      lowhigh:=hflip;
    end if;

    if rising_edge(vgaclk) then

      if v_display='0' then
          vga_b <= (others => '0');
          vga_r <= (others => '0');
          vga_g <= (others => '0');
          blank <= '1';
      else
          blank <= '0';
          if mode332='0' then
            if lowhigh='1' then
              vga_r <= vga_data(15 downto 11);
              vga_g <= vga_data(10 downto 5);
              vga_b <= vga_data(4 downto 0);
            else
              vga_r <= vga_data(31 downto 27);
              vga_g <= vga_data(26 downto 21);
              vga_b <= vga_data(20 downto 16);
            end if;
          else
            case sel is
              when "00" =>
                vga_r <= vga_data(31 downto 29) & "00";
                vga_g <= vga_data(28 downto 26) & "000";
                vga_b <= vga_data(25 downto 24) & "000";
              when "01" =>
                vga_r <= vga_data(23 downto 21) & "00";
                vga_g <= vga_data(20 downto 18) & "000";
                vga_b <= vga_data(17 downto 16) & "000";
              when "10" =>
                vga_r <= vga_data(15 downto 13) & "00";
                vga_g <= vga_data(12 downto 10) & "000";
                vga_b <= vga_data(9 downto 8) & "000";
              when "11" =>
                vga_r <= vga_data(7 downto 5) & "00";
                vga_g <= vga_data(4 downto 2) & "000";
                vga_b <= vga_data(1 downto 0) & "000";
              when others =>
            end case;
          end if;
      end if;

    end if;

    dbg_vgadata<=vga_data;
    dbg_lowhigh<=lowhigh;

  end process;

  end block;

  process(wb_clk_i,cache_clear,disp_enable)
  begin
    if cache_clear='1' or disp_enable='0' then
      vga_reset_q1<='1';
      vga_reset_q2<='1';
    elsif rising_edge(wb_clk_i) then
      vga_reset_q2<='0';
      vga_reset_q1<=vga_reset_q2;
    end if;
  end process;

  fifo_read_enable<=read_enable when duplicate='0' else (read_enable and not vcount_q(0));
  
  process(vgaclk)
  begin
    if rising_edge(vgaclk) then
      if v_display='1' and v_display_q='0' then
        hflip <= '1';
        hflip2 <= '0';
        hflip3 <= '0';
      else
        if v_display='0' then
          hflip <='0';
          hflip2 <='0';
        else
          hflip <= hflip xor hdup;
          if hflip='1' then
            hflip2 <= not hflip2;-- hflip2 xor hdup;
          end if;
          if hflip2='1' and hflip='1' then
            hflip3<= not hflip3;
          end if;
        end if;
      end if;                     
    end if;
  end process;

  process(v_display,hflip,hflip2,hflip3,mode332,duplicate)
    variable m: std_logic_vector(1 downto 0);
  begin
    m := mode332 & duplicate;
    case m is
      when "00" =>
        read_enable <= v_display and not hflip;
      when "10" | "01" =>
        read_enable <= v_display and hflip2 and not hflip;
      when "11" =>
        read_enable <= v_display and hflip2 and hflip3 and not hflip;
      when others =>
    end case;
  end process;


  myfifo: gh_fifo_async_rrd_sr_wf
  generic map (
    data_width => 32,
    add_width => 11
  )
  port map (
		clk_WR  => wb_clk_i,
		clk_RD  => vgaclk,
		rst     => '0',
		srst    => fifo_clear,
		WR      => fifo_write_enable,
		RD      => fifo_read_enable,
		D       => fifo_write,
		Q       => read,
		empty   => fifo_empty,
		qfull   => fifo_quad_full,
		hfull   => fifo_half_full,
		qqqfull => fifo_almost_full,
		full    => fifo_full
  );

  pllinst: wbpll
    generic map (
    CLKIN_PERIOD  => 23.809524,
    CLKFB_MULT    => 16,
    CLK0_DIV      => 7
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

    clkin     => clk_42mhz,
    clkout    => vgaclk,
    locked    => open
  );



end behave;
