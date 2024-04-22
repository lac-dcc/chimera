--
--  ZPUINO PWM block
-- 
--  Copyright 2017 Alvaro Lopes <alvieboy@alvie.com>
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

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity zpuino_pwmblock is
  generic (
    NUMPWMBITS: natural := 3;
    SEL:    natural := 6
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIOBit downto minIOBit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;
    id:       out slot_id;
    pwmout:   out std_logic_vector((2**NUMPWMBITS)-1 downto 0)
  );
end entity zpuino_pwmblock;

architecture behave of zpuino_pwmblock is

  signal ack: std_logic;

  signal  counter_q: unsigned(15 downto 0);
  type    cmptype is array(0 to (2**NUMPWMBITS)-1) of unsigned(15 downto 0);
  signal  cmp:    cmptype;
  signal  cmp_q:   cmptype;

  signal  reload_event:   std_logic;

begin

  id <= x"08" & x"2A";

  reload_event<='1' when counter_q = x"FFFE" else '0';
  wb_ack_o <= ack;


  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        counter_q<=(others => '0');
        clrcmp: for i in 0 to (2**NUMPWMBITS)-1 loop
          cmp_q(i)<=(others => '0');
        end loop;
      else
        if counter_q/=x"FFFE" then
          counter_q<=counter_q+1;
        else
          counter_q<=x"0000";
        end if;

        if reload_event='1' then
          cmp_q<=cmp;
        end if;
      end if;
    end if;
  end process;

  outgen: for i in 0 to (2**NUMPWMBITS)-1 generate
    pwmout(i) <= '1' when counter_q < cmp_q(i) else '0';
  end generate;

  process(wb_clk_i)
    variable index: natural;
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        ack<='0';
        for i in 0 to (2**NUMPWMBITS)-1 loop
          cmp(i)<=(others => '0');
        end loop;
      else
        ack<='0';
        if wb_cyc_i='1' and wb_stb_i='1' and ack='0' then
          ack<='1';

          -- Reads
          if wb_adr_i(SEL)='0' then
            wb_dat_o(15 downto 0)<=std_logic_vector( to_unsigned((2**NUMPWMBITS), 16) );
            wb_dat_o(31 downto 16)<=std_logic_vector( to_unsigned(SEL, 16) );
          else
            index := to_integer(unsigned(wb_adr_i(NUMPWMBITS+1 downto 2)));
            wb_dat_o(31 downto 16)<=(others =>'0');
            wb_dat_o(15 downto 0)<=std_logic_vector( cmp(index) );
          end if;
          -- Writes
          if wb_we_i='1' then
            if wb_adr_i(SEL)='1' then
              index := to_integer(unsigned(wb_adr_i(NUMPWMBITS+1 downto 2)));
              cmp(index) <= unsigned(wb_dat_i(15 downto 0));
            end if;
          end if;

        end if;
      end if;
    end if;
  end process;


end behave;
