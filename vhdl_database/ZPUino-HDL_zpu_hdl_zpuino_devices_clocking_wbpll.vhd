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

entity wbpll is
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
end entity wbpll;

architecture behave of wbpll is

  signal pll_daddr: std_logic_vector(4 downto 0);
  signal pll_di, pll_do, pll_do_q: std_logic_vector(15 downto 0);
  signal pll_den, pll_dwe, pll_drdy, pll_dclk: std_ulogic;
  signal pll_locked: std_logic;
  signal clk_to_fb, clk_from_fb: std_ulogic;
  signal vgaclk,vgaclk_i: std_ulogic;

  signal pll_data_out:  std_logic_vector(31 downto 0);
  signal pll_reg_out:   std_logic_vector(7 downto 0);
  signal pll_index:     unsigned(3 downto 0);

  type state_type is (
    IDLE,
    ACK,
    PLLACCESS
  );

  type regs_type is record
    state:        state_type;
    CLKFBOUT:     std_logic_vector(13 downto 0);
    DIGITAL_FILT: std_logic_vector(9 downto 0);
    LOCKH:        std_logic_vector(19 downto 0);
    --DIVCLK:       std_logic_vector(13 downto 0);
    CLKOUT0:      std_logic_vector(13 downto 0);
    we:           std_logic;
    ack:          std_logic;
    dat:          std_logic_vector(31 downto 0);
    den:          std_logic;
    pll_reset:    std_ulogic;
  end record;

  signal r: regs_type;
  signal LOCK:         std_logic_vector(39 downto 0);

begin


 -- PLL access


  pll_dclk  <= wb_clk_i;
  pll_dwe   <= r.we;
  pll_den <= r.den;
  pll_daddr <= wb_adr_i(6 downto 2);
  pll_di    <= wb_dat_i(15 downto 0);
  locked   <= pll_locked;
  wb_ack_o <= r.ack;
  wb_dat_o <= r.dat;

  process(wb_adr_i,wb_dat_i,wb_stb_i,wb_cyc_i,wb_rst_i,wb_we_i,wb_clk_i,wb_rst_i,r,
    pll_locked,pll_reg_out,pll_data_out,pll_do,pll_drdy)
    variable w: regs_type;
  begin
    w := r;


    case r.state is
      when IDLE =>
        if wb_cyc_i='1' and wb_stb_i='1' then
          w.we := wb_we_i;
          if wb_adr_i(8)='1' then
            -- Direct PLL access
            w.den := '1';
            w.state := PLLACCESS;
          else
            w.state := ACK;
            w.ack := '1';
          end if;

        w.dat := (others => '0');

        if wb_adr_i(8)='0' then
          if wb_adr_i(7)='0' then
            -- Mux output for normal accesses.
            case wb_adr_i(5 downto 2) is
              when "0000" =>
                w.dat(0) := r.pll_reset;
                w.dat(1) := pll_locked;
                w.dat(2) := '1';
                if wb_we_i='1' then
                  w.pll_reset:=wb_dat_i(0);
                end if;
              when "0001" =>
                w.dat(r.CLKFBOUT'range) := r.CLKFBOUT;
                if wb_we_i='1' then
                  w.CLKFBOUT := wb_dat_i(w.CLKFBOUT'range);
                end if;
              when "0010" =>
                w.dat(r.DIGITAL_FILT'range) := r.DIGITAL_FILT;
                if wb_we_i='1' then
                  w.DIGITAL_FILT := wb_dat_i(w.DIGITAL_FILT'range);
                end if;
              when "0011" =>
                w.dat(19 downto 0) := r.LOCKH(19 downto 0);
                if wb_we_i='1' then
                  w.LOCKH(19 downto 0) := wb_dat_i(19 downto 0);
                end if;
              when "0100" =>
                w.dat(r.CLKOUT0'range) := r.CLKOUT0;
                if wb_we_i='1' then
                  w.CLKOUT0 := wb_dat_i(w.CLKOUT0'range);
                end if;
              when others =>
                w.dat := (others => 'X');
            end case;
          else
            if wb_adr_i(6)='0' then
              w.dat(7 downto 0):=pll_reg_out;
            else
              w.dat:=pll_data_out;
            end if;
          end if;
        else
          w.dat := (others => 'X'); -- Will be filled later
        end if;
      end if;
      when ACK =>
        w.ack := '0';
        w.state := IDLE;

      when PLLACCESS =>
        w.den := '0';
        w.dat := (others => '0');
        w.dat(15 downto 0) := pll_do;

        if pll_drdy='1' then
          w.ack := '1';
          w.state := ACK;
        end if;

      when others =>
    end case;

    if wb_rst_i='1' then
      w.ack := '0';
      w.dat := (others => 'X');
      w.state := IDLE;
      w.pll_reset := '0';
      w.den := '0';
    end if;

    if rising_edge(wb_clk_i) then
      r <= w;
    end if;

  end process;

  pll: PLL_ADV
  generic map
   (BANDWIDTH            => "OPTIMIZED",
    CLK_FEEDBACK         => "CLKFBOUT",
    COMPENSATION         => "SYSTEM_SYNCHRONOUS",
    DIVCLK_DIVIDE        => 1,
    CLKFBOUT_MULT        => CLKFB_MULT,
    CLKFBOUT_PHASE       => 0.000,
    CLKOUT0_DIVIDE       => CLK0_DIV,
    CLKOUT0_PHASE        => 0.000,
    CLKOUT0_DUTY_CYCLE   => 0.500,
    CLKIN1_PERIOD        => CLKIN_PERIOD,
    REF_JITTER           => 0.010,
    SIM_DEVICE           => "SPARTAN6")
  port map
    -- Output clocks
   (CLKFBOUT            => clk_to_fb,
    CLKOUT0             => vgaclk_i,
    LOCKED              => pll_locked,
    RST                 => r.pll_reset,
    -- Input clock control
    CLKFBIN             => clk_from_fb,
    CLKIN1              => clkin,
    CLKIN2              => '0',
    CLKINSEL            => '1',

    DADDR               => pll_daddr,
    DCLK                => pll_dclk,
    DEN                 => pll_den,
    DI                  => pll_di,
    DO                  => pll_do,
    DRDY                => pll_drdy,
    DWE                 => pll_dwe,
    REL                 => '0'
   );

   clkfbinst: BUFG
    port map (
      I =>  clk_to_fb,
      O =>  clk_from_fb
    );
   clkvgainst: BUFG
    port map (
      I =>  vgaclk_i,
      O =>  clkout
    );

  -- Hardcode LOCK lower bits - they are always same for spartan6.

  datamux: block

    signal CLKFBOUT:     std_logic_vector(13 downto 0);
    signal DIGITAL_FILT: std_logic_vector(9 downto 0);
    signal LOCK:         std_logic_vector(39 downto 0);
    signal CLKOUT0:      std_logic_vector(13 downto 0);

  begin
  
  LOCK <= r.LOCKH & x"FA401";
  CLKOUT0 <= r.CLKOUT0;
  CLKFBOUT <= r.CLKFBOUT;
  DIGITAL_FILT <= r.DIGITAL_FILT;


  pll_index <= unsigned(wb_adr_i(5 downto 2));

  process(pll_index,CLKOUT0,CLKFBOUT,LOCK,DIGITAL_FILT)
  begin

      case pll_index is
        when "0000" => pll_reg_out <= x"06"; pll_data_out <= x"FFFB" & "XXXXXXXXXXXXX" & CLKOUT0(13) & "XX";
	      when "0001" => pll_reg_out <= x"0B"; pll_data_out <= x"7DFF" & CLKOUT0(5)& "XXXXX" & CLKOUT0(4) & "X" & "XXXXXXXX";
	      when "0010" => pll_reg_out <= x"0D"; pll_data_out <= x"FF8F"&  "XXXXXXXX"& 'X' & CLKOUT0(3) & CLKOUT0(0) & CLKOUT0(2) & "XXXX";
        when "0011" => pll_reg_out <= x"0F"; pll_data_out <= x"01F3"& CLKFBOUT(4)& CLKFBOUT(5)& CLKFBOUT(3)& CLKFBOUT(12)& CLKFBOUT(1)&
                                    CLKFBOUT(2)& CLKFBOUT(0)& "XXXXX" &  CLKOUT0(12)& CLKOUT0(1)& "XX";
        when "0100" => pll_reg_out <= x"10"; pll_data_out <=x"801F"& 'X'& CLKOUT0(9)& CLKOUT0(11)& CLKOUT0(10)& CLKFBOUT(10)& CLKFBOUT(11)&
                      CLKFBOUT(9)& CLKFBOUT(8)& CLKFBOUT(7)& CLKFBOUT(6)& CLKFBOUT(13)& "XXXXX";
        when "0101" => pll_reg_out <= x"11"; pll_data_out <= x"FFF4"& "XXXXXXXXXXXX" & CLKOUT0(6)& 'X'& CLKOUT0(8)& CLKOUT0(7);
        when "0110" => pll_reg_out <= x"14"; pll_data_out <= x"2FFF"& LOCK(1)& LOCK(2) & 'X' & LOCK(0)& "XXXXXXXXXXXX";
        when "0111" => pll_reg_out <= x"15"; pll_data_out <= x"FFF4"& "XXXXXXXXXXXX" & LOCK(38) & 'X' & LOCK(32) & LOCK(39);
        when "1000" => pll_reg_out <= x"16"; pll_data_out <= x"0BFF"& LOCK(15)& LOCK(13)& LOCK(27)& LOCK(16)& 'X' & LOCK(10)&"XXXXXXXXXX";
        when "1001" => pll_reg_out <= x"17"; pll_data_out <= x"FFD0"& "XXXXXXXXXX" & LOCK(17)& 'X'& LOCK(8)& LOCK(9)& LOCK(23)& LOCK(22);
        when "1010" => pll_reg_out <= x"18"; pll_data_out <= x"1039"& DIGITAL_FILT(6)& DIGITAL_FILT(7)& DIGITAL_FILT(0)& 'X'&
                      DIGITAL_FILT(2)& DIGITAL_FILT(1)& DIGITAL_FILT(3)& DIGITAL_FILT(9)& 
                      DIGITAL_FILT(8)& LOCK(26)& "XXX" & LOCK(19)& LOCK(18) & 'X';
        when "1011" => pll_reg_out <= x"19"; pll_data_out <= x"0000"& LOCK(24)& LOCK(25)& LOCK(21)& LOCK(14)& LOCK(11)&
                      LOCK(12)& LOCK(20)& LOCK(6)& LOCK(35)& LOCK(36)& 
                      LOCK(37)& LOCK(3)& LOCK(33)& LOCK(31)& LOCK(34)& LOCK(30);
        when "1100" => pll_reg_out <= x"1A"; pll_data_out <= x"FFFC"& "XXXXXXXXXXXXXX" & LOCK(28)& LOCK(29);
        when "1101" => pll_reg_out <= x"1D"; pll_data_out <= x"2FFF"& LOCK(7)& LOCK(4)& 'X' & LOCK(5)& "XXXXXXXXXXXX";
        when others => pll_reg_out <= x"00" ; pll_data_out <= "XXXXXXXXXXXXXXXX" & "XXXXXXXXXXXXXXXX";
      end case;

  end process;

  end block;

end behave;
