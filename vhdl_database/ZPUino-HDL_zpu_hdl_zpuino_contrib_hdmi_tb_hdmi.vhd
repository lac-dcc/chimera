library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.txt_util.all;

entity tb_hdmi is
end entity;

architecture sim of tb_hdmi is

  signal wb_clk_i:  std_logic := '0';
	signal wb_rst_i:  std_logic := '0';
  signal wb_dat_o:  std_logic_vector(wordSize-1 downto 0);
  signal wb_dat_i:  std_logic_vector(wordSize-1 downto 0);
  signal wb_adr_i:  std_logic_vector(maxIObit downto minIObit);
  signal wb_we_i:   std_logic;
  signal wb_cyc_i:  std_logic;
  signal wb_stb_i:  std_logic;
  signal wb_ack_o:  std_logic;
  signal clkin:     std_logic := '0';
  signal clkout:    std_logic;
  signal locked:    std_logic;
  
  signal mi_wb_dat_i: std_logic_vector(wordSize-1 downto 0);
  signal mi_wb_dat_o: std_logic_vector(wordSize-1 downto 0);
  signal mi_wb_adr_o: std_logic_vector(maxAddrBitIncIO downto 0);
  signal mi_wb_sel_o: std_logic_vector(3 downto 0);
  signal mi_wb_cti_o: std_logic_vector(2 downto 0);
  signal mi_wb_we_o:  std_logic;
  signal mi_wb_cyc_o: std_logic;
  signal mi_wb_stb_o: std_logic;
  signal mi_wb_ack_i: std_logic;
  signal mi_wb_stall_i: std_logic;

  constant FCLKPERIOD: time := 23.809524 ns;
  constant WBPERIOD: time := 10.416667 ns;
  constant PLLOFFSET: natural := 256;

  type s6plllocktype is array(0 to 36) of std_logic_vector(31 downto 0);

  constant s6_pll_lock_lookup: s6plllocktype := (
    x"00049fe8",
    x"00049fe8",
    x"0006afe8",
    x"000943e8",
    x"000b53e8",
    x"000d63e8",
    x"000ff7e8",
    x"000ff7e8",
    x"000ff7e8",
    x"000ff7e8",
    x"000ff784",
    x"000ff739",
    x"000ff6ee",
    x"000ff6bc",
    x"000ff68a",
    x"000ff671",
    x"000ff63f",
    x"000ff626",
    x"000ff60d",
    x"000ff5f4",
    x"000ff5db",
    x"000ff5c2",
    x"000ff5a9",
    x"000ff590",
    x"000ff590",
    x"000ff577",
    x"000ff55e",
    x"000ff55e",
    x"000ff545",
    x"000ff545",
    x"000ff52c",
    x"000ff52c",
    x"000ff52c",
    x"000ff513",
    x"000ff513",
    x"000ff513",
    x"000ff4fa"
);
    type s6pllfilterlookupt is array (0 to 63) of std_logic_vector(31 downto 0);
constant s6_pll_filter_lookup: s6pllfilterlookupt := (
    x"000bcb71",
    x"000fd7b1",
    x"000bd871",
    x"000ff9b1",
    x"000bfab1",
    x"000dfb31",
    x"0003ff31",
    x"0005ff31",
    x"0009fcb1",
    x"000ef8b1",
    x"000efd31",
    x"0001fd31",
    x"0001fd31",
    x"0006f931",
    x"0006f931",
    x"000af931",
    x"000af931",
    x"000afd31",
    x"000afd31",
    x"000afd31",
    x"000afd31",
    x"000cf631",
    x"000cf631",
    x"000cfa31",
    x"000cfa31",
    x"000cfe31",
    x"000cfe31",
    x"000cfe31",
    x"000cfe31",
    x"000cfe31",
    x"0002fa31",
    x"0002fa31",
    x"000cfe31",
    x"000cfe31",
    x"0002f532",
    x"0002f532",
    x"0004fd32",
    x"0002f132",
    x"0002f132",
    x"0002f132",
    x"0008d132",
    x"0008d132",
    x"0008d132",
    x"0004d632",
    x"0002de32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0008ce32",
    x"0004ce32",
    x"0004ce32",
    x"0004ce32",
    x"0004ce32",
    x"0004ce32",
    x"0004ce32",
    x"0004ce32",
    x"0004ce32"
);

begin

  clkin     <= not clkin after FCLKPERIOD/2;
  wb_clk_i  <= not wb_clk_i after WBPERIOD/2;

  process
  begin
    wait for 1 ns;
    wb_rst_i<='1';
    wait for WBPERIOD;
    wait until rising_edge(wb_clk_i);
    wb_rst_i<='0';
    wait;
  end process;

  uut: entity work.hdmi_generic
  port map (
    wb_clk_i  => wb_clk_i,
	 	wb_rst_i  => wb_rst_i,
    wb_dat_o  => wb_dat_o,
    wb_dat_i  => wb_dat_i,
    wb_adr_i  => wb_adr_i,
    wb_we_i   => wb_we_i,
    wb_cyc_i  => wb_cyc_i,
    wb_stb_i  => wb_stb_i,
    wb_ack_o  => wb_ack_o,

    -- Wishbone MASTER interface
    mi_wb_dat_i   => mi_wb_dat_i,
    mi_wb_dat_o   => mi_wb_dat_o,
    mi_wb_adr_o   => mi_wb_adr_o,
    mi_wb_sel_o   => mi_wb_sel_o,
    mi_wb_cti_o   => mi_wb_cti_o,
    mi_wb_we_o    => mi_wb_we_o,
    mi_wb_cyc_o   => mi_wb_cyc_o,
    mi_wb_stb_o   => mi_wb_stb_o,
    mi_wb_ack_i   => mi_wb_ack_i,
    mi_wb_stall_i => mi_wb_stall_i,

    -- clocking

    -- Base clock (goes to PLL)
    BCLK        => clkin,
    tmds        => open,
    tmdsb       => open
  );

  stimuli: process


    procedure wbread(address: in natural; data: out std_logic_vector(31 downto 0))
    is
      variable ra: std_logic_vector(wb_adr_i'range);
    begin
      wait until rising_edge(wb_clk_i);
      ra := std_logic_vector(to_unsigned(address, wb_adr_i'length));
      wb_adr_i<=ra;
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i <='0';
      ackwait: loop
        wait until rising_edge(wb_clk_i);
        if wb_ack_o='1' then
          wb_cyc_i<='0';
          wb_stb_i<='0';
          data :=wb_dat_o;
          exit ackwait;
        end if;
      end loop;
    end procedure;

    procedure pll_divider(divide: in natural; rval: out std_logic_vector(13 downto 0))
    is
      variable d: std_logic_vector(13 downto 0);
      variable dv5: unsigned(15 downto 0);
    begin
      dv5 := to_unsigned(divide, 16);
      d(13) := '0'; -- Edge
      if divide=1 then
        d(12):='1';  -- Nocount
        d(5 downto 0):="000001";
        d(11 downto 6):="000001";
      else
        d(12) := '0'; --
        d(5 downto 0) := std_logic_vector(dv5(6 downto 1));
        d(11 downto 6) := std_logic_vector(dv5(6 downto 1));
        if dv5(0)='1' then
          d(13):='1'; -- Edge
          d(5 downto 0) := std_logic_vector(dv5(6 downto 1)+1);
        end if;
      end if;
      rval := d;
    end procedure;

    procedure s6_pll_get_lock(divide: in natural; r: out std_logic_vector(31 downto 0))
    is
      variable d: natural;
    begin
      d := divide - 1;
      if d>36 then
          d:=36;
      end if;
      r:=s6_pll_lock_lookup(d);
    end procedure;
  
    procedure s6_pll_get_filter(divide: in natural; highbw: in boolean; ro: out std_logic_vector(31 downto 0)) is
      variable d: natural;
      variable r: std_logic_vector(31 downto 0);

    begin
      d := divide - 1;
      r := s6_pll_filter_lookup(d);
      if (highbw) then
          r:= "0000000000" & r(31 downto 10);
      else
        r:= r and x"000003FF";
      end if;
      ro := r;
    end procedure;


    procedure wbwrite(address: in natural; data: in std_logic_vector(31 downto 0))
    is
      variable ra: std_logic_vector(wb_adr_i'range);
    begin
      wait until rising_edge(wb_clk_i);
      ra := std_logic_vector(to_unsigned(address, wb_adr_i'length));
      wb_adr_i<=ra;
      wb_dat_i<=data;
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i <='1';
      ackwait: loop
        wait until rising_edge(wb_clk_i);
        if wb_ack_o='1' then
          wb_cyc_i<='0';
          wb_stb_i<='0';
          exit ackwait;
        end if;
      end loop;
    end procedure;

    procedure pll_set_reg(address: in natural;
      data: in std_logic_vector(15 downto 0);
      mask: in std_logic_vector(15 downto 0))
    is
      variable d: std_logic_vector(31 downto 0);
    begin
      wbread(PLLOFFSET+128+address, d);
      d(15 downto 0) := d(15 downto 0) and mask;
      d(15 downto 0) := d(15 downto 0) or (not mask and data);
      Report "Writing " & str(d);
      wbwrite(PLLOFFSET+128+address, d);
    end procedure;

    variable d: std_logic_vector(31 downto 0);
    variable t1,t2: time;
    variable clockps: integer;
    variable pllreg: std_logic_vector(31 downto 0);
    variable plldata: std_logic_vector(31 downto 0);
    variable regindex: natural;
  begin
    wait for 100 ns;
    -- Reset PLL
    wbwrite(PLLOFFSET+0, x"00000001");

    -- Setup HDMI resolution
    wbwrite(0, x"00000000"); -- Mem base
    wbwrite(2, x"00000001"); -- Display enable
    wbwrite(3, x"00000000"); -- H/V polarity

    -- ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
    if false then
    wbwrite(8, std_logic_vector(to_unsigned(640,32))); -- H display
    wbwrite(9, std_logic_vector(to_unsigned(664,32)));
    wbwrite(10,std_logic_vector(to_unsigned(704,32)));
    wbwrite(11,std_logic_vector(to_unsigned(832,32)));

    wbwrite(12,std_logic_vector(to_unsigned(480,32)));
    wbwrite(13,std_logic_vector(to_unsigned(489,32)));
    wbwrite(14,std_logic_vector(to_unsigned(491,32)));
    wbwrite(15,std_logic_vector(to_unsigned(520,32)));
    else
      -- Test mode 
    wbwrite(8, std_logic_vector(to_unsigned(32,32))); -- H display
    wbwrite(9, std_logic_vector(to_unsigned(64,32)));
    wbwrite(10,std_logic_vector(to_unsigned(96,32)));
    wbwrite(11,std_logic_vector(to_unsigned(128,32)));

    wbwrite(12,std_logic_vector(to_unsigned(32,32)));
    wbwrite(13,std_logic_vector(to_unsigned(64,32)));
    wbwrite(14,std_logic_vector(to_unsigned(96,32)));
    wbwrite(15,std_logic_vector(to_unsigned(128,32)));
    end if;

    pll_divider(17, pllreg(13 downto 0));
    wbwrite(PLLOFFSET+1, pllreg); -- Multiplier

    s6_pll_get_lock(17, pllreg);
    report "Lock: " & hstr(pllreg);
    wbwrite(PLLOFFSET+3, pllreg);


    report "Get filter";
    s6_pll_get_filter(17,false,pllreg);
    report "Filter: " & hstr(pllreg);
    wbwrite(PLLOFFSET+2, pllreg);

    pll_divider(1, pllreg(13 downto 0));
    wbwrite(PLLOFFSET+4, pllreg);

    pll_divider(5, pllreg(13 downto 0));
    wbwrite(PLLOFFSET+5, pllreg);

    pll_divider(10, pllreg(13 downto 0));
    wbwrite(PLLOFFSET+6, pllreg);


   --
    regloop: for i in 0 to 32 loop
      wbread(PLLOFFSET+64 + i, pllreg);
      if pllreg(7 downto 0)=x"00" then
        exit regloop;
      end if;
      regindex:=to_integer(unsigned(pllreg(7 downto 0)));

      wbread(PLLOFFSET+64+32+i, plldata);

      report "Reg index " & str(i) & " number " & hstr(pllreg(7 downto 0)) & " mask " & str(plldata(31 downto 16) )
       & " data " & str(plldata(15 downto 0));

      pll_set_reg( regindex, plldata(15 downto 0), plldata(31 downto 16));
    end loop;

    -- de-Reset PLL
    wbwrite(PLLOFFSET+0, x"00000000");

    wait until locked='1';
    wait until rising_edge(clkout);
    t1 := now;
    wait until rising_edge(clkout);
    t2 := now;
    t2 := t2 - t1;
    clockps := integer( t2 / 1 ps );
    report "Clock period: " & str(clockps) & "ps";
    report "Frequency: " & str(1000000000/clockps) & "Hz";

    wait;
  end process;

  mi_wb_stall_i<='0';
  process(wb_clk_i)
    variable d: std_logic_vector(31 downto 0);
    variable index: natural;
  begin
    if rising_edge(wb_clk_i) then
      if mi_wb_cyc_o='1' and mi_wb_stb_o='1' then
        mi_wb_ack_i<='1';
        d:=(others => '0');
        index := to_integer(unsigned(mi_wb_adr_o(mi_wb_adr_o'high downto 2)));
        d(31 downto 0) := std_logic_vector(to_unsigned(index,32));
        --index := index +1;
        --d(31 downto 16) := std_logic_vector(to_unsigned(index,16));

        mi_wb_dat_i<=d;
      else
        mi_wb_ack_i<='0';
      end if;
    end if;
  end process;


end sim;
