--
--  SPI-wishbone interface.
-- 
--  Copyright 2014 Alvaro Lopes <alvieboy@alvie.com>
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
use ieee.numeric_std.all;
library work;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;
use work.zpu_config.all;
use work.pad.all;
use work.wishbonepkg.all;


entity spiwb is
  port (
    nCS:  in std_logic;
    SCK:  in std_logic;
    MOSI: in std_logic;
    MISO: out std_logic;
    MISOTRIS: out std_logic;

    clk:    in std_logic;
    rst:    in std_logic;

    wb_we_o:  out std_logic;
    wb_cyc_o:  out std_logic;
    wb_stb_o:  out std_logic;
    wb_adr_o:  out std_logic_vector(maxIObit downto minIObit);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_ack_i: in std_logic
  );
end entity spiwb;

architecture behave of spiwb is

  signal tris: std_logic;
  signal shreg_in_q: std_logic_vector(31 downto 0);
  signal shreg_out_q: std_logic_vector(31 downto 0);
  signal count_q: integer range 0 to 31;
  signal shreg_load: std_logic_vector(31 downto 0) := x"FFFFFFFF";
  signal valid: std_logic;
  signal addr: std_logic_vector(31 downto 0);
  signal data: std_logic_vector(31 downto 0);
  signal cmd: std_logic_vector(7 downto 0);

  signal process_request, process_ack, process_ack1: std_logic;

  signal busy: std_logic;
  
  -- Wishbone clocked signals
  signal datar_wb: std_logic_vector(31 downto 0);
  signal addr_wb,dataw_wb: std_logic_vector(31 downto 0);
  signal process_request_wb, process_ack_wb: std_logic;
  signal process_request_wb1: std_logic;
  signal cmd_wb: std_logic_vector(7 downto 0);

  type state_type is (
    idle,
    address_w,
    address_r,
    data_w,
    processing,
    getconf,
    reply
  );

  signal state_q: state_type;
  signal load,data_out,data_out_q: std_logic;

  type wbstate_type is (
    idle,
    request,
    finish
   );

  signal wbstate: wbstate_type;
  signal eow, eofw: boolean;

  signal input8: std_logic_vector(7 downto 0);
  signal input32: std_logic_vector(31 downto 0);

  signal shreg_out_q_d: std_logic;

  signal conf: std_logic_vector(31 downto 0);
begin

  eow<=true when (count_q=7 or count_q=15 or count_q=23 or count_q=31) else false;
  eofw<=true when count_q=7 else false;

  conf(7 downto 0) <= std_logic_vector(to_unsigned(zpuino_number_io_select_bits,8));
  conf(15 downto 8) <= std_logic_vector(to_unsigned(maxIOBit,8));
  conf(31 downto 16) <= x"A451";

  input8 <= shreg_in_q(6 downto 0) & MOSI;
  input32 <= shreg_in_q(30 downto 0) & MOSI;

  process(state_q, process_ack, eow, datar_wb, conf)
  begin
      load<='0';
      shreg_load <= (others => 'X');

      case state_q is
        when processing =>
          if process_ack='1' and eow then
            load <= '1';
            shreg_load <= datar_wb;
          end if;
        when getconf  =>
          if eow then
            load <= '1';
            shreg_load <= conf;
          end if;
        when others =>
      end case;
  end process;

  process(SCK, nCS)
  begin
    if nCS='1' then
      count_q <= 0;
    elsif falling_edge(SCK) then
      if count_q=31 then
        count_q <= 0;
      else
        count_q <= count_q + 1;
      end if;
    end if;
  end process;

  process(SCK, nCS)
  begin
    if nCS='1' then
     -- count_q <= 0;
      tris <= '1';
      --eow_q <= false;
    elsif falling_edge(SCK) then
      --eow_q <= false;

      if count_q=7 then
        tris <= '0';
        --eow_q <= true;
      end if;


      if load='1' then
        shreg_out_q <= shreg_load;
      else
        shreg_out_q(31 downto 0) <= shreg_out_q(30 downto 0) & '0';
      end if;


    end if;
  end process;

  process(SCK)
  begin
    if falling_edge(SCK) then
      shreg_in_q(0) <= MOSI;
      shreg_in_q(31 downto 1) <= shreg_in_q(30 downto 0);
    end if;
  end process;

  process(SCK,nCS)
  begin
    if nCS='1' then

      state_q <= idle;
      process_request<='0';

    elsif falling_edge(SCK) then

      case state_q is
        when idle =>
         if eofw then
            if input8(7 downto 6)="11" then
              -- Write.
              state_q <= address_w;
            elsif input8(7 downto 6)="01" then
              -- Read.
              state_q <= address_r;
            elsif input8(7 downto 6)="00" then
              state_q <= getconf;
            else
              state_q <= reply;
            end if;
            cmd <= shreg_in_q(7 downto 0);
          end if;
        when address_w =>
         if eofw then
          addr <= input32;
          state_q <= data_w;
        end if;
        when address_r =>
          if eofw then

          addr <= input32;
          process_request <= '1';
          state_q <= processing;
          end if;
        when data_w =>
          if eofw then

          data <= input32;
          process_request <= '1';
          state_q <= processing;
          end if;
        when processing =>
          if process_ack='1' then

            if eow then
              process_request<='0';
              state_q <= reply;
            end if;

          end if;
        when getconf =>
        if eow then
          state_q <= reply;
        end if;
        when reply =>
          -- Stay here until nCS goes up again.

        when others =>
      end case;
    end if;
  end process;

  process(state_q, shreg_out_q, busy, eow)
  begin
    case state_q is
      when processing | getconf =>
        if eow then
          data_out<=busy;
        else
          data_out<='1';
        end if;
      when others =>
      data_out <= shreg_out_q(31);
    end case;
  end process;

  busy <= process_request and not process_ack;

  process(SCK)
  begin
    if rising_edge(SCK) then
      process_ack<=process_ack_wb;
      --shreg_out_q_d <= shreg_out_q(31);
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if rst='1' then
        process_request_wb1<='0';
        process_request_wb<='0';
      else
        process_request_wb1 <= process_request;
        process_request_wb  <= process_request_wb1;
        addr_wb <= addr;
        dataw_wb <= data;
        cmd_wb <= cmd;
      end if;
    end if;
  end process;

  -- Wb processing.
  process(clk,rst)
  begin
    if rst='1' then
      wb_cyc_o<='0';
      wb_stb_o<='0';
      wb_we_o <='0';
      wbstate <= idle;
      process_ack_wb<='0';
    elsif rising_edge(clk) then
      case wbstate is
        when idle =>
          if process_request_wb='1' then
            wbstate <= request;
            wb_cyc_o<='1';
            wb_stb_o<='1';
            wb_we_o <= cmd_wb(7);
          else
          end if;
        when request =>
          if wb_ack_i='1' then
            wb_cyc_o<='0';
            wb_stb_o<='0';
            wb_we_o<='X';
            wbstate <= finish;
            process_ack_wb<='1';
            datar_wb<=wb_dat_i;
          end if;
        when finish =>
          if process_request_wb='0' then
            wbstate <= idle;
            process_ack_wb<='0';
          end if;
        when others =>
      end case;
    end if;
  end process;

  wb_dat_o <= dataw_wb;
  wb_adr_o <= addr_wb(wb_adr_o'range);

  MISO <= data_out;
  MISOTRIS <= tris;

end behave;
