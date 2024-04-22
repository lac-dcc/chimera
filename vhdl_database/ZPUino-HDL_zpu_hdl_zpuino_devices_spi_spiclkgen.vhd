--
--  SPI Clock generator
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

entity spiclkgen is
  port (
    clk:   in std_logic;
    rst:   in std_logic;
    en:    in std_logic;
    cpol:  in std_logic;
    pres:  in std_logic_vector(2 downto 0);

    clkrise: out std_logic;
    clkfall: out std_logic;
    spiclk:  out std_logic

  );
end entity spiclkgen;



architecture behave of spiclkgen is

signal running_q: std_logic;
signal clkrise_i: std_logic;
signal clkfall_i: std_logic;

component prescaler is
  port (
    clk:    in std_logic;
    rst:    in std_logic;
    prescale:   in std_logic_vector(2 downto 0);
    event:  out std_logic                       
  );
end component prescaler;


signal prescale_q: std_logic_vector(2 downto 0);
signal clk_i: std_logic;
signal prescale_event: std_logic;
signal prescale_reset: std_logic;

begin

clkrise <= clkrise_i;
clkfall <= clkfall_i;

pr: prescaler
  port map (
    clk => clk,
    rst => prescale_reset,
    prescale => prescale_q,
    event => prescale_event
  );


genclk: process(clk)
begin
  if rising_edge(clk) then
    if rst='1' or en='0' then
      spiclk <= cpol;
    else

      if clkrise_i='1' then
        spiclk<=not cpol;
      end if;

      if clkfall_i='1' then
        spiclk<=cpol;
      end if;

    end if;
  end if;
end process;
    

process(clk)
begin
  if rising_edge(clk) then
    if rst='1' then
      prescale_q <= (others => '0');
      running_q <= '0';
      prescale_reset <= '0';
    else
      if en='1' then
        prescale_reset<='0';
        running_q <= '1';

        if running_q='0' then
          prescale_q <= pres;
          prescale_reset<='1';
        end if;
        
      else
        running_q <= '0';
      end if;
    end if;
  end if;
end process;

process(clk)
begin
  if rising_edge(clk) then
    if rst='1' then
      clkrise_i<='0';
      clkfall_i<='0';
      clk_i<='0';
    else
      clkrise_i <= '0';
      clkfall_i <= '0';

      if running_q='1' and en='1' then

        if prescale_event='1' then
          clk_i <= not clk_i;
          if clk_i='0' then
            clkrise_i <= '1';
          else
            clkfall_i <= '1';
          end if;
        end if;
      else
        clk_i <= '0';
      end if;
    end if;
  end if;
end process;

end behave;
