--
--  ZPUINO RGB Panel Controller v2
-- 
--  Copyright 2015 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
-- synthesis translate_off
use work.txt_util.all;
-- synthesis translate_on

entity zpuino_rgbctrl2 is
  generic (
      WIDTH_BITS: integer := 5;
      PWM_WIDTH: integer := 8;
      VSUBPANELS: integer := 4;
      CLOCK_POLARITY: std_logic := '1';
      STROBE_POLARITY: std_logic := '1';
      OE_POLARITY: std_logic := '1';
      DATA_INVERT: boolean := false;
      COLUMN_INVERT: boolean := false;
      NUMCLOCKS: integer := 2
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;

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

    displayclk: in std_logic;
    -- RGB outputters

    R:        out std_logic_vector(VSUBPANELS-1 downto 0);
    G:        out std_logic_vector(VSUBPANELS-1 downto 0);
    B:        out std_logic_vector(VSUBPANELS-1 downto 0);

    COL:      out std_logic_vector(3 downto 0);

    CLK:      out std_logic_vector(NUMCLOCKS-1 downto 0);
    STB:      out std_logic;
    OE:       out std_logic
  );
end entity zpuino_rgbctrl2;


architecture behave of zpuino_rgbctrl2 is

  constant WIDTH: integer := 2**WIDTH_BITS;

  function f_log2 (x : positive) return natural is
      variable i : natural;
   begin
      i := 0;  
      while (2**i < x) and i < 31 loop
         i := i + 1;
      end loop;
      return i;
   end function;

  signal clken: std_logic;

  subtype shreg is std_logic_vector(WIDTH-1 downto 0);

  type shifteddatatype is array(0 to 1) of shreg;

  signal shiftout_r,
         shiftout_g,
         shiftout_b,
         shiftdata_r,
         shiftdata_g,
         shiftdata_b: shifteddatatype;

  type shtype is (
    idle,shift,clock,strobe
  );
  signal shstate: shtype;

  signal transfer_count: integer;

  signal ack_transfer: std_logic := '0';

  signal mraddr: unsigned(WIDTH_BITS downto 0) := (others => '0');

  signal mren: std_logic;
  signal cpwm: unsigned (PWM_WIDTH downto 0) := (others => '0');

  signal column, column_q: unsigned(4 downto 0) := (others => '0');
  signal row: unsigned(WIDTH_BITS-1 downto 0) := (others => '0');

  subtype colorvaluetype is unsigned(PWM_WIDTH-1 downto 0);
  type utype is array(0 to 3) of colorvaluetype;

  type fillerstatetype is (
    waitsync,
    compute,
    send
  );

  signal fillerstate: fillerstatetype := compute;

  signal debug_compresult: std_logic_vector(2 downto 0);
  signal memvalid: std_logic := '0';

  signal ack_q: std_logic;

  function reverse (a: in std_logic_vector)
  return std_logic_vector is
    variable result: std_logic_vector(a'RANGE);
    alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
  begin
    for i in aa'RANGE loop
      result(i) := aa(i);
    end loop;
    return result;
  end;

  signal config_data: std_logic_vector(31 downto 0);
  signal ram_out    : std_logic_vector(31 downto 0);

  constant PWMIGNORE: integer := 8 - PWM_WIDTH;

  signal line_address:  std_logic_vector(WIDTH_BITS downto 0);
  signal line_sel:      std_logic_vector(VSUBPANELS-1 downto 0);
  signal line_we:       std_logic;

  subtype pixeltype is std_logic_vector(23 downto 0);
  subtype rgbtype is std_logic_vector(2 downto 0);
  type allrgbtype is array(0 to VSUBPANELS-1) of rgbtype;

  signal  line_data_in:  pixeltype;
  type    dataouttype is array(0 to VSUBPANELS-1) of pixeltype;
  signal  line_data_out: dataouttype;
  constant zerovec: pixeltype:=(others => '0');

  signal displayblock: std_logic := '1';
  signal displayrst,rst1q: std_logic;
  signal blockindex: std_logic;

  signal strobeout, datalatched: std_logic;
  signal clockout: std_logic_vector(NUMCLOCKS-1 downto 0);

  signal fbaddr:    std_logic_vector(wb_dat_i'range);
  signal test_mode: std_logic;

  attribute IOB: string;
  attribute IOB of clockout: signal is "true";
  attribute IOB of strobeout: signal is "true";
  attribute IOB of R: signal is "true";
  attribute IOB of G: signal is "true";
  attribute IOB of B: signal is "true";


begin

  process(displayclk,wb_rst_i)
  begin
    if wb_rst_i='1' then
      displayrst<='1'; rst1q<='1';
    elsif rising_edge(displayclk) then
      displayrst<=rst1q; rst1q<='0';
    end if;
  end process;

  displayblock<=column(0);

  wb_ack_o <= ack_q;
  wb_inta_o <= '0';

  wb_dat_o <= config_data;

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        ack_q<='0';
        test_mode<='0';
        fbaddr<=x"00010000";
        OE <= not OE_POLARITY;
      else
        ack_q<='0';
        if wb_cyc_i='1' and wb_stb_i='1' and ack_q='0' then
          ack_q<='1';
          if wb_we_i='1' then
            case wb_adr_i(3 downto 2) is
              when "11" =>
                fbaddr <= wb_dat_i;
              when "10" =>
                OE <= wb_dat_i(0);
                test_mode <= wb_dat_i(1);
              when others => null;
            end case;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(wb_adr_i)
  begin
    config_data <= (others => 'X');
    case wb_adr_i(3 downto 2) is
      when "00" =>
        config_data(15 downto 0)  <= std_logic_vector(to_unsigned(16*VSUBPANELS,16));
        config_data(31 downto 16) <= std_logic_vector(to_unsigned(WIDTH,16));
      when "01" =>
        -- Pixel format....
        config_data <= (others => 'X');

      when others =>
    end case;
  end process;


  linefiller: block

    type linefiller_state_type is ( idle, stream );

    constant SUBPANELBITS: natural := f_log2(VSUBPANELS);

    type linefiller_regs_type is record
      offset:   unsigned(WIDTH_BITS-1 downto 0); -- 128 width
      subpanel: unsigned(SUBPANELBITS-1 downto 0); -- 8 columns
      lineindex:unsigned(3 downto 0); -- 16 columns
      bindex:   std_logic;
      woffset:  unsigned(WIDTH_BITS-1 downto 0); -- 128 width
      stb:      std_logic;
      state:    linefiller_state_type;
      fbaddr:   std_logic_vector(31 downto 0);
      line_sel_q: std_logic_vector(VSUBPANELS-1 downto 0);

    end record;

    signal lr:  linefiller_regs_type;
    signal line_sel_i: std_logic_vector(VSUBPANELS-1 downto 0);

  begin

    blockindex <= lr.lineindex(0); -- Current block (opposite to the one being displayed)

    

    line_data_in <= mi_wb_dat_i(23 downto 0);

    mi_wb_adr_o(mi_wb_adr_o'high downto (11+SUBPANELBITS+2)) <=
        lr.fbaddr(mi_wb_adr_o'high downto (11+SUBPANELBITS+2));

    mi_wb_adr_o((3+WIDTH_BITS+SUBPANELBITS+2) downto 0) <= std_logic_vector(lr.subpanel) & std_logic_vector(lr.lineindex) &
       std_logic_vector(lr.offset) & "00";

    mi_wb_stb_o <= lr.stb;
    mi_wb_we_o <= '0';

    line_address <= lr.bindex & std_logic_vector(lr.woffset);


    -- Generate line_sel
    lsgen: for N in 0 to VSUBPANELS-1 generate
      line_sel_i(N) <= '1' when lr.subpanel = to_unsigned(N, SUBPANELBITS) else '0';
    end generate;
    line_sel <= lr.line_sel_q;

    process(wb_clk_i,lr,wb_rst_i,mi_wb_ack_i,mi_wb_stall_i,displayblock,fbaddr,blockindex,line_sel_i)
      variable lw: linefiller_regs_type;
      constant offsetMAX: unsigned(lr.offset'range):=(others => '1');
      constant subpanelMAX: unsigned(lr.subpanel'range):=(others => '1');

    begin
      lw := lr;

      case lr.state is

        when idle =>
          line_we<='0';
          if displayblock/=blockindex then
            lw.fbaddr := fbaddr; -- TODO: change this only in v refresh
            lw.state := stream;
            lw.line_sel_q := line_sel_i;
          end if;
          lw.woffset := (others => '0');
          lw.bindex := blockindex;
          lw.stb := '1';
          mi_wb_cyc_o<='0';

        when stream =>

          mi_wb_cyc_o<='1';

          if mi_wb_stall_i='0' and lr.stb='1' then

            lw.offset := lr.offset + 1;
            if (lr.offset=offsetMAX) then
              lw.subpanel := lr.subpanel + 1;
              if (lr.subpanel = subpanelMAX) then
                lw.lineindex := lr.lineindex + 1;
              end if;
            end if;


            if lr.offset = offsetMAX then
              lw.stb := '0';
            end if;
          end if;

          line_we <= mi_wb_ack_i;

          if mi_wb_ack_i='1' then
            lw.woffset := lr.woffset + 1;
            if lr.woffset=offsetMAX then
              lw.state := idle;
            end if;
          end if;

      end case;

      if wb_rst_i='1' then
        lw.state := idle;
        lw.stb := '0';
        lw.offset := (others => '0');
        lw.subpanel := (others => '0');
        lw.lineindex := (others => '0');
        lw.fbaddr := x"00010000";
      end if;

      if rising_edge(wb_clk_i) then
        lr<=lw;
      end if;

    end process;
  end block;

  linerams: for N in 0 to VSUBPANELS-1 generate

    lineram: generic_dp_ram
      generic map (
        address_bits => WIDTH_BITS+1, -- TODO: base in width. It's one bit more
        data_bits => 24
      )
      port map (
        clka  => wb_clk_i,
        ena   => line_sel(N),
        wea   => line_we,
        addra => line_address,
        dia   => line_data_in,
        doa   => open,
  
        clkb  => displayclk,
        enb   => mren,
        web   => '0',
        addrb => std_logic_vector(mraddr),
        dib   => zerovec,
        dob   => line_data_out(N)
      );
  
  end generate;

  mraddr <= column(0) & row(WIDTH_BITS-1 downto 0);


  process(displayclk)
    variable ucomp: utype;
    variable mword: unsigned(23 downto 0);
    variable compresult: std_logic_vector(2 downto 0);
    variable panel: integer;
  begin

    if rising_edge(displayclk) then

      memvalid <= mren;
      datalatched<='0';
      strobeout<= not STROBE_POLARITY;

      case fillerstate is
        when waitsync =>
          -- Wait for line to be completely full
          if blockindex='1' then
            fillerstate<=compute;
            column<=(others => '0');
            mren<='1';
            clockout <= (others => not CLOCK_POLARITY);
          end if;

        when compute =>

          mren <= '1';

          if COLUMN_INVERT then
            COL <= not std_logic_vector(column(3 downto 0));
          else
            COL <= std_logic_vector(column(3 downto 0));
          end if;

          if mren='1' and row/=WIDTH-1 then
            if datalatched='1' then
              row <= row + 1;
            end if;
          end if;

          if (row=WIDTH-1) and clockout(0)=not CLOCK_POLARITY then
            fillerstate <= send;
            mren<='0';
            row<=(others =>'0');
            column_q <= column;
          end if;


          if memvalid='1' and datalatched='0' then
            -- Validate if PWM bit for this LED should be '1' or '0'
    
            -- We need to decompose into the individual components
            pwmgen: for N in 0 to VSUBPANELS-1 loop
              mword := unsigned(line_data_out(N));
  
              ucomp(2) := mword(7 downto 0+PWMIGNORE);
              ucomp(1) := mword(15 downto 8+PWMIGNORE);
              ucomp(0) := mword(23 downto 16+PWMIGNORE);
  
              -- Compare output for each of them
              -- synthesis translate_off
              --  report "Panel " & str(N) & " data " & hstr(line_data_out(N)) & " compare R:" &  str(std_logic_vector(ucomp(0))) & " G:"
              --  & str(std_logic_vector(ucomp(1))) & " B:" & str(std_logic_vector(ucomp(2)));
              -- synthesis translate_on

              comparepwm: for j in 0 to 2 loop
                if (ucomp(j)>cpwm(PWM_WIDTH-1 downto 0)) then
                  compresult(j):='1';
                else
                  compresult(j):='0';
                end if;
              end loop;
              if test_mode='1' then
                R(N) <= row(0);
                G(N) <= row(1);
                B(N) <= row(2);
              else
                if DATA_INVERT then
                  R(N) <= not compresult(0);
                  G(N) <= not compresult(1);
                  B(N) <= not compresult(2);
                else
                  R(N) <= compresult(0);
                  G(N) <= compresult(1);
                  B(N) <= compresult(2);
                end if;
              end if;
              --clockout <= '1';
            end loop;

            datalatched<='1';

            if row=WIDTH-1 then
              -- Advance pwm counter
              cpwm <= cpwm + 1;
            end if;
          end if;

          if CLOCK_POLARITY='1' then
            clockout<=(others =>datalatched);
          else
            clockout<=(others =>not datalatched);
          end if;

        when send =>
          mren<='0';
          strobeout<=STROBE_POLARITY;
          clockout<=(others =>not CLOCK_POLARITY);
          if strobeout=STROBE_POLARITY then
            strobeout<=not STROBE_POLARITY;
            fillerstate<=compute;
            if cpwm(cpwm'HIGH)='1' then
              column <= column + 1;
              cpwm(cpwm'HIGH)<='0';
            end if;
          end if;
      end case;

      if displayrst='1' then
        column <= (others => '1');
        fillerstate <= waitsync;
        mren<='0';
        clockout<=(others =>not CLOCK_POLARITY);
        strobeout<=not STROBE_POLARITY;
      end if;

    end if;

    debug_compresult <= compresult;

  end process;

  CLK <= clockout;
  STB <= strobeout;

end behave;
