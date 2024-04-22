--
--  16-bit Timer for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity timer is
  generic (
    TSCENABLED: boolean := false;
    PWMCOUNT: integer range 1 to 8 := 2;
    WIDTH: integer range 1 to 32 := 16;
    PRESCALER_ENABLED: boolean := true;
    BUFFERS: boolean := true
  );
  port (
    wb_clk_i:   in std_logic;
	 	wb_rst_i:   in std_logic;
    wb_dat_o:   out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i:   in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i:   in std_logic_vector(5 downto 0);
    wb_we_i:    in std_logic;
    wb_cyc_i:   in std_logic;
    wb_stb_i:   in std_logic;
    wb_ack_o:   out std_logic;
    wb_inta_o:  out std_logic;

    pwm_out:    out std_logic_vector(PWMCOUNT-1 downto 0)

  );
end entity timer;

architecture behave of timer is

  component prescaler is
  port (
    clk:    in std_logic;
    rst:    in std_logic;
    prescale:   in std_logic_vector(2 downto 0);
    event:  out std_logic                       
  );
  end component prescaler;

type singlepwmregs is record
  cmplow: unsigned(WIDTH-1 downto 0);
  cmphigh: unsigned(WIDTH-1 downto 0);
  en: std_logic;
end record;

type pwmregs is array(PWMCOUNT-1 downto 0) of singlepwmregs;

type timerregs is record
  cnt:  unsigned(WIDTH-1 downto 0); -- current timer counter value
  cmp:  unsigned(WIDTH-1 downto 0); -- top timer compare value
  ccm:  std_logic; -- clear on compare match
  en:   std_logic; -- enable
  dir:  std_logic; -- direction
  ien:  std_logic; -- interrupt enable
  intr: std_logic; -- interrupt
  pres: std_logic_vector(2 downto 0); -- Prescaler
  updp: std_logic_vector(1 downto 0);
  presrst: std_logic;
  pwmr: pwmregs;
  pwmrb:pwmregs;
end record;

constant UPDATE_NOW: std_logic_vector(1 downto 0) := "00";
constant UPDATE_ZERO_SYNC: std_logic_vector(1 downto 0) := "01";
constant UPDATE_LATER: std_logic_vector(1 downto 0) := "10";


signal tmr0_prescale_rst: std_logic;
--signal tmr0_prescale: std_logic_vector(2 downto 0);
signal tmr0_prescale_event: std_logic;

signal TSC_q: unsigned(wordSize-1 downto 0);

signal tmrr: timerregs;

function eq(a:std_logic_vector; b:std_logic_vector) return std_logic is
begin
  if a=b then
    return '1';
  else
    return '0';
  end if;
end function;

signal do_interrupt: std_logic;

begin

  wb_inta_o <= tmrr.intr;
--  comp <= tmrr.cout;

  wb_ack_o <= wb_cyc_i and wb_stb_i;

pr: if PRESCALER_ENABLED generate
  tmr0prescale_inst: prescaler
    port map (
      clk     => wb_clk_i,
      rst     => tmrr.presrst,
      prescale=> tmrr.pres,
      event   => tmr0_prescale_event
    );
end generate;

npr: if not PRESCALER_ENABLED generate
  tmr0_prescale_event<='1';
end generate;

  tsc_process: if TSCENABLED generate
  TSCgen: process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        TSC_q <= (others => '0');
      else
        TSC_q <= TSC_q + 1;
      end if;
    end if;
  end process;
  end generate;

  -- Read
  process(wb_adr_i, tmrr,TSC_q)
  begin

    case wb_adr_i(1 downto 0) is
      when "00" =>
        wb_dat_o <= (others => Undefined);
        wb_dat_o(0) <= tmrr.en;
        wb_dat_o(1) <= tmrr.ccm;
        wb_dat_o(2) <= tmrr.dir;
        wb_dat_o(3) <= tmrr.ien;
        wb_dat_o(6 downto 4) <= tmrr.pres;
        wb_dat_o(7) <= tmrr.intr;
        wb_dat_o(10 downto 9) <= tmrr.updp;

      when "01" =>
        wb_dat_o <= (others => '0');
        wb_dat_o(WIDTH-1 downto 0) <= std_logic_vector(tmrr.cnt);
      when "10" =>
        wb_dat_o <= (others => '0');
        wb_dat_o(WIDTH-1 downto 0) <= std_logic_vector(tmrr.cmp);
      when others =>
        if TSCENABLED then
          wb_dat_o <= (others => '0');
          wb_dat_o <= std_logic_vector(TSC_q);
        else
          wb_dat_o <= (others => DontCareValue );
        end if;
    end case;
  end process;

  process(wb_clk_i, tmrr, wb_rst_i,wb_cyc_i,wb_stb_i,wb_we_i,wb_adr_i,wb_dat_i,tmrr,do_interrupt,tmr0_prescale_event)
    variable w: timerregs;
    variable write_ctrl: std_logic;
    variable write_cmp: std_logic;
    variable write_cnt: std_logic;
    variable write_pwm: std_logic;
    variable ovf: std_logic;
    variable pwmindex: integer;
  begin
    w := tmrr;
    -- These are just helpers
    write_ctrl := wb_cyc_i and wb_stb_i and wb_we_i and eq(wb_adr_i,"000000");
    write_cnt  := wb_cyc_i and wb_stb_i and wb_we_i and eq(wb_adr_i,"000001");
    write_cmp  := wb_cyc_i and wb_stb_i and wb_we_i and eq(wb_adr_i,"000010");
    write_pwm  := wb_cyc_i and wb_stb_i and wb_we_i and wb_adr_i(5);

    ovf:='0';
    if tmrr.cnt = tmrr.cmp then
      ovf:='1';
    end if;

    do_interrupt <= '0';

    if wb_rst_i='1' then
        w.en := '0';
        w.ccm := '0';
        w.dir := '0';
        w.ien := '0';
        w.intr := '0';
        w.pres := (others => '0');
        w.presrst := '1';
        w.updp := UPDATE_ZERO_SYNC;
        for i in 0 to PWMCOUNT-1 loop
          w.pwmrb(i).en :='0';
          w.pwmr(i).en :='0';
        end loop;

    else
      if do_interrupt='1' then
        w.intr := '1';
      end if;

      w.presrst := '0';

      -- Wishbone access
      if write_ctrl='1' then
        w.en  := wb_dat_i(0);
        w.ccm := wb_dat_i(1);
        w.dir := wb_dat_i(2);
        w.ien := wb_dat_i(3);
        w.pres:= wb_dat_i(6 downto 4);
        w.updp := wb_dat_i(10 downto 9);

        if wb_dat_i(7)='0' then
          w.intr:='0';
        end if;
      end if;

      if write_cmp='1' then
        w.cmp := unsigned(wb_dat_i(WIDTH-1 downto 0));
      end if;

      if write_cnt='1' then
        w.cnt := unsigned(wb_dat_i(WIDTH-1 downto 0));
      else
        if tmrr.en='1' and tmr0_prescale_event='1' then
          -- If output matches, set interrupt
          if ovf='1' then
            if tmrr.ien='1' then
              do_interrupt<='1';
            end if;
          end if;

          -- CCM
            if tmrr.ccm='1' and ovf='1' then
              w.cnt := (others => '0');
            else
              if tmrr.dir='1' then
                w.cnt := tmrr.cnt + 1;
              else
                w.cnt := tmrr.cnt - 1;
              end if;
            end if;

          end if;

        end if;

      end if;

    if write_pwm='1' then
      for i in 0 to PWMCOUNT-1 loop
        if wb_adr_i(4 downto 2) = std_logic_vector(to_unsigned(i,3)) then
         if BUFFERS then
          -- Write values to this PWM
          case wb_adr_i(1 downto 0) is
            when "00" =>
              w.pwmrb(i).cmplow := unsigned(wb_dat_i(WIDTH-1 downto 0));
            when "01" =>
              w.pwmrb(i).cmphigh := unsigned(wb_dat_i(WIDTH-1 downto 0));
            when "10" =>
              w.pwmrb(i).en := wb_dat_i(0);
            when "11" =>
              -- This is sync pulse for UPDATE_LATER
            when others =>
          end case;
         else
          -- Write values to this PWM
          case wb_adr_i(1 downto 0) is
            when "00" =>
              w.pwmr(i).cmplow := unsigned(wb_dat_i(WIDTH-1 downto 0));
            when "01" =>
              w.pwmr(i).cmphigh := unsigned(wb_dat_i(WIDTH-1 downto 0));
            when "10" =>
              w.pwmr(i).en := wb_dat_i(0);
            when "11" =>
              -- This is sync pulse for UPDATE_LATER
            when others =>
          end case;

         end if;
        end if;
      end loop;
    end if;

    if BUFFERS then
    for i in 0 to PWMCOUNT-1 loop
      case tmrr.updp is
        when UPDATE_NOW =>
          w.pwmr(i) := tmrr.pwmrb(i);
        when UPDATE_ZERO_SYNC =>
          if ovf='1' then
            w.pwmr(i) := tmrr.pwmrb(i);
          end if;
        when UPDATE_LATER =>
          --if wb_adr_i(3 downto 2) = std_logic_vector(to_unsigned(i,2)) then
          --  if wb_adr_i(1 downto 0)="11" then
          --    w.pwmr(i) := tmrr.pwmrb(i);
          --  end if;
         -- end if;

        when others =>
          --w.pwmr(i) := tmrr.pwmrb(i);
      end case;
    end loop;
    end if;


    if rising_edge(wb_clk_i) then
      tmrr <= w;
      for i in 0 to PWMCOUNT-1 loop
        if tmrr.pwmr(i).en='1' then
          if tmrr.cnt >= tmrr.pwmr(i).cmplow and tmrr.cnt<tmrr.pwmr(i).cmphigh then
            pwm_out(i) <= '1';
          else
            pwm_out(i) <= '0';
          end if;
        else
          pwm_out(i)<='0';
        end if;
      end loop;
    end if;

  end process;

end behave;     
