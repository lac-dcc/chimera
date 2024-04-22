--
--  SPI interface
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
use ieee.numeric_std.all;

entity spi is
  port (
    clk:  in std_logic;
    rst:  in std_logic;
    din:  in std_logic_vector(31 downto 0);
    dout:  out std_logic_vector(31 downto 0);
    en:   in std_logic;
    ready: out std_logic;
    transfersize: in std_logic_vector(1 downto 0);

    miso: in std_logic;
    mosi: out std_logic;

    clk_en:    out std_logic;

    clkrise: in std_logic;
    clkfall: in std_logic;
    samprise:in std_logic -- Sample on rising edge
  );
end entity spi;


architecture behave of spi is

signal read_reg_q:    std_logic_vector(31 downto 0);
signal write_reg_q:   std_logic_vector(31 downto 0);

signal ready_q:       std_logic;
signal count:         integer range 0 to 32;
--signal count_val_q:   integer range 0 to 32;

signal sample_event:  std_logic;
signal do_shift:      std_logic;
signal ignore_sample_q: std_logic;

begin

  dout <= read_reg_q;

  process(samprise,clkrise,clkfall)
  begin
    sample_event <= '0';
    if (clkfall='1' and samprise='0') then
      sample_event <= '1';
    elsif (clkrise='1' and samprise='1') then
      sample_event <= '1';
    end if;
  end process;

  process(ready_q, en)
  begin
      ready <= ready_q;
  end process;

  process(ready_q, clkrise)
  begin
    if ready_q='0' and clkrise='1' then
      do_shift<='1';
    else
      do_shift<='0';
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if do_shift='1' then
        case transfersize is
          when "00" =>
            MOSI <= write_reg_q(7); -- 8-bit write
          when "01" =>
            MOSI <= write_reg_q(15); -- 16-bit write
          when "10" =>
            MOSI <= write_reg_q(23); -- 24-bit write
          when "11" =>
            MOSI <= write_reg_q(31); -- 32-bit write
          when others =>
        end case;
      end if;
    end if;
  end process;

  process(ready_q, clkrise, count)
  begin
    if ready_q='1' then
      clk_en <= '0';
    else
      if count/=0 then
        clk_en <= '1';
      else
        clk_en <= not clkrise;
      end if;
    end if;
  end process;

  process(clk)
  begin
  if rising_edge(clk) then
    if rst='1' then
      ready_q <= '1';
      count <= 0;
      --count_val_q <= 8; -- Default to 8-bit
    else
        if ready_q='1' then
          if en='1' then
            write_reg_q <= din(31 downto 0);
            ignore_sample_q <= samprise;
            -- Shift the 32-bit register
            case transfersize is
              when "00" =>
                count <= 8;
              when "01" =>
                count <= 16;
              when "10" =>
                count <= 24;
              when "11" =>
                count <= 32;
              when others =>
            end case;
            ready_q <= '0';
          end if;
        else 

            if count/=0 then
              if do_shift='1' then
                count <= count -1;
              end if;
            else
              if clkrise='1' and ready_q='0' then
                ready_q <= '1';
              end if;
            end if;
        end if;

        if ready_q='0' and sample_event='1' then
          if ignore_sample_q='0' then
            read_reg_q(31 downto 0) <= read_reg_q(30 downto 0) & MISO;
          end if;
          ignore_sample_q<='0';
          write_reg_q(31 downto 0) <= write_reg_q(30 downto 0) & '0';
        end if;

    end if;
  end if;
end process;

end behave;
