--
--  Timers for ZPUINO
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

entity zpuino_timers is
  generic (
    A_TSCENABLED: boolean := false;
    A_PWMCOUNT: integer range 1 to 8 := 2;
    A_WIDTH: integer range 1 to 32 := 16;
    A_PRESCALER_ENABLED: boolean := true;
    A_BUFFERS: boolean :=true;
    B_TSCENABLED: boolean := false;
    B_PWMCOUNT: integer range 1 to 8 := 2;
    B_WIDTH: integer range 1 to 32 := 16;
    B_PRESCALER_ENABLED: boolean := false;
    B_BUFFERS: boolean := false
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
    wb_intb_o:out std_logic;
    id:       out slot_id;
    pwm_A_out: out std_logic_vector(A_PWMCOUNT-1 downto 0);
    pwm_B_out: out std_logic_vector(B_PWMCOUNT-1 downto 0)
  );
end entity zpuino_timers;


architecture behave of zpuino_timers is

  component timer is
  generic (
    TSCENABLED: boolean := false;
    PWMCOUNT: integer range 1 to 8 := 2;
    WIDTH: integer range 1 to 32 := 16;
    PRESCALER_ENABLED: boolean := true;
    BUFFERS: boolean := true
  );
  port (
    wb_clk_i:      in std_logic;
	 	wb_rst_i:   in std_logic;
    wb_dat_o:     out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i:    in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i:  in std_logic_vector(5 downto 0);
    wb_we_i:       in std_logic;
    wb_cyc_i:       in std_logic;
    wb_stb_i:       in std_logic;
    wb_ack_o:     out std_logic;
    wb_inta_o: out std_logic;
    pwm_out:    out std_logic_vector(PWMCOUNT-1 downto 0)

  );
  end component timer;

  signal timer0_read:       std_logic_vector(wordSize-1 downto 0);
  signal timer0_stb:         std_logic;
  signal timer0_cyc:         std_logic;
  signal timer0_we:         std_logic;
  signal timer0_interrupt:  std_logic;
  signal timer0_ack:       std_logic;

  signal timer1_read:       std_logic_vector(wordSize-1 downto 0);
  signal timer1_stb:         std_logic;
  signal timer1_cyc:         std_logic;
  signal timer1_we:         std_logic;
  signal timer1_interrupt:  std_logic;
  signal timer1_ack:       std_logic;

begin

  id <= x"08" & x"13"; -- Vendor: ZPUino  Device: Dual Basic Timers
  wb_inta_o <= timer0_interrupt;
  wb_intb_o <= timer1_interrupt;

  --comp <= timer0_comp;

  timer0_inst: timer
    generic map (
      TSCENABLED         => A_TSCENABLED,
      PWMCOUNT           => A_PWMCOUNT,
      WIDTH              => A_WIDTH,
      PRESCALER_ENABLED  => A_PRESCALER_ENABLED,
      BUFFERS            => A_BUFFERS
    )
    port map (
      wb_clk_i  => wb_clk_i,
      wb_rst_i  => wb_rst_i,
      wb_dat_o  => timer0_read,
      wb_dat_i  => wb_dat_i,
      wb_adr_i  => wb_adr_i(7 downto 2),
      wb_cyc_i  => timer0_cyc,
      wb_stb_i  => timer0_stb,
      wb_we_i   => timer0_we,
      wb_ack_o  => timer0_ack,
      wb_inta_o => timer0_interrupt,
      pwm_out   => pwm_A_out
    );

  timer1_inst: timer
    generic map (
      TSCENABLED         => B_TSCENABLED,
      PWMCOUNT           => B_PWMCOUNT,
      WIDTH              => B_WIDTH,
      PRESCALER_ENABLED  => B_PRESCALER_ENABLED,
      BUFFERS            => B_BUFFERS
    )
    port map (
      wb_clk_i  => wb_clk_i,
      wb_rst_i  => wb_rst_i,
      wb_dat_o  => timer1_read,
      wb_dat_i  => wb_dat_i,
      wb_adr_i  => wb_adr_i(7 downto 2),
      wb_cyc_i  => timer1_cyc,
      wb_stb_i  => timer1_stb,
      wb_we_i   => timer1_we,
      wb_ack_o  => timer1_ack,
      wb_inta_o => timer1_interrupt,
      pwm_out   => pwm_B_out
    );


  process(wb_adr_i,timer0_read,timer1_read)
  begin
    wb_dat_o <= (others => '0');
    case wb_adr_i(9 downto 8) is
      when "00" =>
        wb_dat_o <= timer0_read;
      when "01" =>
        wb_dat_o <= timer1_read;
      when "10" =>
        case wb_adr_i(3 downto 2) is
          when "00" =>
            wb_dat_o(5 downto 0) <= std_logic_vector(to_unsigned(A_WIDTH,6));
          --when "01" =>
            if A_TSCENABLED then
              wb_dat_o(8) <= '1';
            end if;
            if A_BUFFERS then
              wb_dat_o(9) <= '1';
            end if;
            if A_PRESCALER_ENABLED then
              wb_dat_o(10) <= '1';
            end if;
          when "10" =>
            wb_dat_o(21 downto 16) <= std_logic_vector(to_unsigned(A_PWMCOUNT,6));
          when others =>
            wb_dat_o <= (others => DontCareValue);
        end case;
      when "11" =>
        case wb_adr_i(3 downto 2) is
          when "00" =>
            wb_dat_o(5 downto 0) <= std_logic_vector(to_unsigned(B_WIDTH,6));
            if B_TSCENABLED then
              wb_dat_o(8) <= '1';
            end if;
            if B_BUFFERS then
              wb_dat_o(9) <= '1';
            end if;
            if B_PRESCALER_ENABLED then
              wb_dat_o(10) <= '1';
            end if;
          when "10" =>
            wb_dat_o(21 downto 16) <= std_logic_vector(to_unsigned(B_PWMCOUNT,6));
          when others =>
            wb_dat_o <= (others => DontCareValue);
        end case;

      when others =>
        wb_dat_o <= (others => DontCareValue);
    end case;
  end process;

  timer0_cyc <= wb_cyc_i when wb_adr_i(8)='0' else '0';
  timer1_cyc <= wb_cyc_i when wb_adr_i(8)='1' else '0';
  timer0_stb <= wb_stb_i when wb_adr_i(8)='0' else '0';
  timer1_stb <= wb_stb_i when wb_adr_i(8)='1' else '0';
  timer0_we <= wb_we_i when wb_adr_i(8)='0' else '0';
  timer1_we <= wb_we_i when wb_adr_i(8)='1' else '0';


  wb_ack_o <= timer0_ack or timer1_ack;
  
  --spp_data(0) <= timer0_spp_data;
  --spp_data(1) <= timer1_spp_data;

  --spp_en(0) <= timer0_spp_en;
  --spp_en(1) <= timer1_spp_en;

end behave;
