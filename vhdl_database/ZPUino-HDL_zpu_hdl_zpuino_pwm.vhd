--
-- PWM generator
--
-- Copyright 2015 Alvaro Lopes <alvieboy@alvie.com>
--
-- The FreeBSD license
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- Changelog:
--
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpupkg.all;
use work.zpu_config.all;
use work.zpuinopkg.all;
-- synthesis translate_off
use work.txt_util.all;
-- synthesis translate_on
entity pwm is
  generic (
    PWMBLOCKS:  integer := 1;   -- Number of PWM blocks (each has 2 outputs)
    CTRWIDTH:   integer := 16;  -- Counter width
    PRESWIDTH:  integer := 8   -- Prescaler width
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
    id:       out slot_id;

    -- Synchronization
    sync_in:  in std_logic;
    sync_out: out std_logic;

    -- Outputs
    pwmaout:   out std_logic_vector(PWMBLOCKS-1 downto 0);
    pwmbout:   out std_logic_vector(PWMBLOCKS-1 downto 0)
  );
end entity pwm;


architecture behave of pwm is

  subtype counter_t is unsigned(CTRWIDTH-1 downto 0);
  --type compare_t is array(PWMBLOCKS-1 downto 0) of counter_t;
  
  type compareentry_t is record
    cmpa:       counter_t;
    iscmpa_s:   std_logic;
    cmpa_s:     counter_t;
    loada:      std_logic_vector(1 downto 0);
    cmpb:       counter_t;
    iscmpb_s:   std_logic;
    cmpb_s:     counter_t;
    loadb:      std_logic_vector(1 downto 0);
  end record;

  subtype actiontype_t is std_logic_vector(1 downto 0);

  type actionentry_single_t is record
    prd:      actiontype_t;
    zero:     actiontype_t;
    cmpau:    actiontype_t;
    cmpbu:    actiontype_t;
    cmpad:    actiontype_t;
    cmpbd:    actiontype_t;
  end record;
  type actionentry_t is array(0 to 1) of actionentry_single_t;

  type comparearray_t is array(PWMBLOCKS-1 downto 0) of compareentry_t;
  type actionarray_t is array(PWMBLOCKS-1 downto 0) of actionentry_t;

  -- All Configurable registers
  type confregs_type is record
    period:     counter_t;
    period_s:   counter_t;
    isperiod_s: std_logic;
    -- phase:      unsigned(CTRWIDTH-1 downto 0); -- TBD
    prescale:   unsigned(PRESWIDTH-1 downto 0); -- No shadow
    countmode:  std_logic_vector(1 downto 0);

    cmp:        comparearray_t;
    action:     actionarray_t;
    updateprescale:std_logic;
    reset:      std_logic;
    -- Wishbone out
    ack:        std_logic;
    dat:        std_logic_vector(31 downto 0);
    int:        std_logic;
  end record;

  signal r: confregs_type;

  -- Time base
  signal cnt:        counter_t;
  signal prescnt:    unsigned(PRESWIDTH-1 downto 0);


  -- Internal signals
  signal prescalertick: std_logic;
  signal cntzero:       std_logic;
  signal cntperiod:     std_logic;

  signal updown:        std_logic;
  signal goingdown:     std_logic;

  signal cmpamatch:     std_logic_vector(PWMBLOCKS-1 downto 0);
  signal cmpbmatch:     std_logic_vector(PWMBLOCKS-1 downto 0);

  constant NOCOUNT:     std_logic_vector(1 downto 0) := "00";
  constant COUNTUP:     std_logic_vector(1 downto 0) := "01";
  constant COUNTDOWN:   std_logic_vector(1 downto 0) := "10";
  constant COUNTUPDOWN: std_logic_vector(1 downto 0) := "11";

  constant LOADZERO:    std_logic_vector(1 downto 0) := "01";
  constant LOADPRD:     std_logic_vector(1 downto 0) := "10";
  constant LOADBOTH:    std_logic_vector(1 downto 0) := "11";
  constant LOADNONE:    std_logic_vector(1 downto 0) := "00";

  constant ACTIONSET:   std_logic_vector(1 downto 0) := "01";
  constant ACTIONCLEAR: std_logic_vector(1 downto 0) := "10";
  constant ACTIONTOGGLE:std_logic_vector(1 downto 0) := "11";
  constant ACTIONNONE:  std_logic_vector(1 downto 0) := "00";

  signal pwma:   std_logic_vector(PWMBLOCKS-1 downto 0);
  signal pwmb:   std_logic_vector(PWMBLOCKS-1 downto 0);

begin

  wb_ack_o <= r.ack;
  wb_dat_o <= r.dat;
  wb_inta_o <= r.int;

  pwmaout <= pwma;
  pwmbout <= pwmb;

  timebase: block
    signal countisup: std_logic;
  begin

    cntzero     <='1' when cnt=0 else '0';
    cntperiod   <='1' when cnt=r.period else '0';

    -- Prescaler
    process(wb_clk_i)
    begin
      if rising_edge(wb_clk_i) then
        if wb_rst_i='1' or r.reset='1' then
          prescnt<=(others => '0');
          prescalertick <= '0';
        else
          if r.updateprescale='1' then
            prescnt <= r.prescale;
          else
          if prescnt=0 then
            prescnt <= r.prescale;
            if r.countmode=NOCOUNT then
              prescalertick <= '0'; -- Disabled
            else
              prescalertick <= '1';
            end if;
          else
            prescnt <= prescnt - 1;
            prescalertick <= '0';
          end if;
        end if;
        end if;
      end if;
    end process;

    process(r.countmode, countisup)
    begin
      case r.countmode is
        when COUNTUP      => updown <= '1';
        when COUNTDOWN    => updown <= '0';
        when COUNTUPDOWN  => updown <= countisup;
        when others       => updown <= '0';
      end case;
    end process;

    -- Counter
    process(wb_clk_i)
    begin
      if rising_edge(wb_clk_i) then
        if wb_rst_i='1' or r.reset='1' then
          cnt <= (others => '0');
        else
          if prescalertick='1' then
            if updown='1' then
              if cntperiod='1' then
                cnt <= (others => '0');
              else
                cnt <= cnt + 1;
              end if;
            else
              if cntzero='1' then
                cnt <= r.period;
              else
                cnt <= cnt - 1;
              end if;
            end if;
          end if;
        end if;
      end if;
    end process;

    countisup<=cntzero when goingdown='1' else not cntperiod;

    process(wb_clk_i, wb_rst_i, cntperiod, cntzero, goingdown)
      variable ngd: std_logic;
    begin

      if rising_edge(wb_clk_i) then
        if wb_rst_i='1' then
          goingdown<='0';
        else
        if cntzero='1' then
          goingdown <= '0';
        elsif cntperiod='1' then
          goingdown <= '1';
        end if;
        end if;
      end if;

    end process;

  end block;


  comparator: block

  begin
    matcher: for N in 0 to PWMBLOCKS-1 generate
      cmpamatch(N)<='1' when r.cmp(N).cmpa = cnt else '0';
      cmpbmatch(N)<='1' when r.cmp(N).cmpb = cnt else '0';
    end generate;

  end block;

  action: block
    
  begin
    process(wb_clk_i)
      procedure act(clause: in std_logic;
                    name:   in string;
                    action: in std_logic_vector(1 downto 0);
                    variable sig: inout std_logic;
                    orig: in std_logic) is
      begin
        if clause='1' then
        case action is
          when ACTIONSET =>
            -- synthesis translate_off
            report "setting signal due to " & name;
            -- synthesis translate_on
            sig := '1';
          when ACTIONCLEAR =>
            -- synthesis translate_off
            report "clearing signal due to " & name;
            -- synthesis translate_on
            sig := '0';
          when ACTIONTOGGLE =>
            -- synthesis translate_off
            report "toggling signal due to " & name & " original " & str(orig);
            -- synthesis translate_on
            sig := not orig;
          when others =>
        end case;
        end if;
      end procedure;
      variable p,pin: std_logic_vector(1 downto 0);
      variable ev: std_logic_vector(1 downto 0);

    begin
      if rising_edge(wb_clk_i) then
        if wb_rst_i='1' then
          for N in 0 to PWMBLOCKS-1 loop
            pwma(N) <= '0';
            pwmb(N) <= '0';
          end loop;
        else
            for N in 0 to PWMBLOCKS-1 loop
              --ev(0) := force_event_a(N) & force_event_b(N);
              p(0) := pwma(N);
              p(1) := pwmb(N);
              pin(0) := pwma(N);
              pin(1) := pwmb(N);

              for OUTPUT in 0 to 1 loop

                if ev(OUTPUT)='1' then
                else
                 if prescalertick='1' then

                  case r.countmode is
                    when COUNTUP =>
                      act( cntzero,     "ZERO",   r.action(N)(OUTPUT).zero,   p(OUTPUT), pin(OUTPUT) );
                      act( cmpamatch(N),"CMPAU",  r.action(N)(OUTPUT).cmpau,  p(OUTPUT), pin(OUTPUT) );
                      act( cmpbmatch(N),"CMPBU",  r.action(N)(OUTPUT).cmpbu,  p(OUTPUT), pin(OUTPUT) );
                      act( cntperiod,   "Period", r.action(N)(OUTPUT).prd,    p(OUTPUT), pin(OUTPUT) );
                    when COUNTDOWN =>
                      act( cntperiod,   "Period", r.action(N)(OUTPUT).prd,    p(OUTPUT), pin(OUTPUT) );
                      act( cmpamatch(N),"CMPAD",  r.action(N)(OUTPUT).cmpad,  p(OUTPUT), pin(OUTPUT) );
                      act( cmpbmatch(N),"CMPBD",  r.action(N)(OUTPUT).cmpbd,  p(OUTPUT), pin(OUTPUT) );
                      act( cntzero,     "ZERO",   r.action(N)(OUTPUT).zero,   p(OUTPUT), pin(OUTPUT) );
                    when COUNTUPDOWN =>
                      if updown='1' then
                        act( cntzero,     "ZERO",   r.action(N)(OUTPUT).zero,   p(OUTPUT), pin(OUTPUT) );
                        act( cmpamatch(N),"CMPAU",  r.action(N)(OUTPUT).cmpau,  p(OUTPUT), pin(OUTPUT) );
                        act( cmpbmatch(N),"CMPBU",  r.action(N)(OUTPUT).cmpbu,  p(OUTPUT), pin(OUTPUT) );
                      else  -- going down
                        act( cntperiod,   "Period", r.action(N)(OUTPUT).prd,    p(OUTPUT), pin(OUTPUT) );
                        act( cmpamatch(N),"CMPAD",  r.action(N)(OUTPUT).cmpad,  p(OUTPUT), pin(OUTPUT) );
                        act( cmpbmatch(N),"CMPBD",  r.action(N)(OUTPUT).cmpbd,  p(OUTPUT), pin(OUTPUT) );
                      end if;
                    when others =>

                  end case;
                 end if; -- prescalertick
                end if;
              end loop;

              pwma(N) <= p(0);
              pwmb(N) <= p(1);

            end loop;




          end if;
      end if;
    end process;
  end block;


  -- configuration
  process(wb_clk_i,r,wb_cyc_i,wb_stb_i,wb_we_i,wb_dat_i,wb_adr_i,wb_rst_i)
    variable w: confregs_type;
    variable cmpidx, outidx:  integer;
  begin
    w := r;
    w.ack := '0';
    w.updateprescale:='0';

    -- Shadow loading. Should be done here. TODO.


    if wb_cyc_i='1' and wb_stb_i='1' and r.ack='0' then
      -- Wishbone cycle.
      w.ack:='1';
      w.dat:=(others => '0');
      case wb_adr_i(8 downto 7) is
        when "00" =>
          -- Timebase configuration.
          case wb_adr_i(4 downto 2) is
            when "000" => -- Prescaler
              w.dat(PRESWIDTH-1 downto 0) := std_logic_vector(r.prescale);
              if wb_we_i='1' then
                w.prescale := unsigned(wb_dat_i(PRESWIDTH-1 downto 0));
                w.updateprescale:='1';
              end if;
            when "001" => -- Period
              w.dat(CTRWIDTH-1 downto 0) := std_logic_vector(r.period);
              if wb_we_i='1' then
                w.period := unsigned(wb_dat_i(CTRWIDTH-1 downto 0));
              end if;

            when "010" => -- Period shade register
              w.dat(CTRWIDTH-1 downto 0) := std_logic_vector(r.period_s);
              if wb_we_i='1' then
                w.period_s := unsigned(wb_dat_i(CTRWIDTH-1 downto 0));
              end if;
            when "011" => -- Configuration
              w.dat(1 downto 0) := r.countmode;
              w.dat(2)          := r.isperiod_s;
              w.dat(3)          := r.reset;
              if wb_we_i='1' then
                w.countmode     := wb_dat_i(1 downto 0);
                w.isperiod_s    := wb_dat_i(2);
                w.reset         := wb_dat_i(3);
              end if;
            when others =>

          end case;

        when "01" =>
          -- Compare module.
          cmpidx := to_integer(unsigned(wb_adr_i(4+PWMBLOCKS-1 downto 4)));
          case wb_adr_i(3 downto 2) is
            when "00" =>
              -- Compare A
              w.dat(CTRWIDTH-1 downto 0) := std_logic_vector(r.cmp(cmpidx).cmpa);
              if wb_we_i='1' then
                if r.cmp(cmpidx).iscmpa_s='0' then
                  w.cmp(cmpidx).cmpa    := unsigned(wb_dat_i(CTRWIDTH-1 downto 0));
                end if;
                w.cmp(cmpidx).cmpa_s  := unsigned(wb_dat_i(CTRWIDTH-1 downto 0));
              end if;
            when "01" =>
              -- Compare B
              w.dat(CTRWIDTH-1 downto 0) := std_logic_vector(r.cmp(cmpidx).cmpb);
              if wb_we_i='1' then
                if r.cmp(cmpidx).iscmpb_s='0' then
                  w.cmp(cmpidx).cmpb := unsigned(wb_dat_i(CTRWIDTH-1 downto 0));
                end if;
                w.cmp(cmpidx).cmpb_s := unsigned(wb_dat_i(CTRWIDTH-1 downto 0));
              end if;
            when "10" =>
              -- Configuration
              w.dat(0) := r.cmp(cmpidx).iscmpa_s;
              w.dat(1) := r.cmp(cmpidx).iscmpb_s;
              w.dat(3 downto 2) := r.cmp(cmpidx).loada;
              w.dat(5 downto 4) := r.cmp(cmpidx).loadb;
              if wb_we_i='1' then
                w.cmp(cmpidx).iscmpa_s := wb_dat_i(0);
                w.cmp(cmpidx).iscmpb_s := wb_dat_i(1);
                w.cmp(cmpidx).loada    := wb_dat_i(3 downto 2);
                w.cmp(cmpidx).loadb    := wb_dat_i(5 downto 4);
              end if;
            when others =>
          end case;

        when "10" =>
          -- Action module.
          cmpidx := to_integer(unsigned(wb_adr_i(4+PWMBLOCKS-1 downto 4)));
          outidx := to_integer(unsigned(wb_adr_i(2 downto 2)));

          w.dat(1 downto 0) := r.action(cmpidx)(outidx).zero;
          w.dat(3 downto 2) := r.action(cmpidx)(outidx).prd;
          w.dat(5 downto 4) := r.action(cmpidx)(outidx).cmpau;
          w.dat(7 downto 6) := r.action(cmpidx)(outidx).cmpbu;
          w.dat(9 downto 8) := r.action(cmpidx)(outidx).cmpad;
          w.dat(11 downto 10) := r.action(cmpidx)(outidx).cmpbd;

          if wb_we_i='1' then
            w.action(cmpidx)(outidx).zero := wb_dat_i(1 downto 0);
            w.action(cmpidx)(outidx).prd  := wb_dat_i(3 downto 2);
            w.action(cmpidx)(outidx).cmpau:= wb_dat_i(5 downto 4);
            w.action(cmpidx)(outidx).cmpbu:= wb_dat_i(7 downto 6);
            w.action(cmpidx)(outidx).cmpad:= wb_dat_i(9 downto 8);
            w.action(cmpidx)(outidx).cmpbd:= wb_dat_i(11 downto 10);
          end if;

        when others =>
      end case;
    end if;

    if wb_rst_i='1' then
      w.ack := '0';
      w.countmode := "00";
      w.isperiod_s := '0';
      w.period := (others =>'0');
      w.period_s := (others =>'0');
      w.prescale := (others =>'0');
      w.reset := '1';
      for N in 0 to PWMBLOCKS-1 loop
        w.cmp(N).cmpa := (others => '0');
        w.cmp(N).cmpa_s := (others => '0');
        w.cmp(N).cmpb := (others => '0');
        w.cmp(N).cmpb_s := (others => '0');
        w.cmp(N).loada := "00";
        w.cmp(N).loadb := "00";
        w.cmp(N).iscmpa_s := '0';
        w.cmp(N).iscmpb_s := '0';
        for Y in 0 to 1 loop
          w.action(N)(Y).zero := (others => '0');
          w.action(N)(Y).prd := (others => '0');
          w.action(N)(Y).cmpau := (others => '0');
          w.action(N)(Y).cmpbu := (others => '0');
          w.action(N)(Y).cmpad := (others => '0');
          w.action(N)(Y).cmpbd := (others => '0');
        end loop;
      end loop;
    end if;

    if rising_edge(wb_clk_i) then
      r <= w;
    end if;
  end process;


end behave;
