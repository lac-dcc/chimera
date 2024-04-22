--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.common.all;

entity top is
    Port (clk    : in  STD_LOGIC;
          tx     : out STD_LOGIC;
          rx     : in  STD_LOGIC;
          led    : out STD_LOGIC_VECTOR (7 downto 0);
          switch : in  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture rtl of top is
    component pll
        port(
            -- Clock in ports
            CLK_IN1  : in  std_logic;
            -- Clock out ports
            CLK_OUT1 : out std_logic;
            -- Status and control signals
            RESET    : in  std_logic;
            LOCKED   : out std_logic
            );
    end component;

    signal rst_n    : std_logic            := '0';  -- start out in reset
    signal rst      : std_logic            := '1';  -- negation of rst_n;
    signal rst_cntr : integer range 0 to 7 := 7;
    signal locked   : std_logic;
    signal clk0     : std_logic;

    signal gpio_in  : word;
    signal gpio_out : word;
begin

    -- Instantiate the PLL (32MHz in, 100MHz out)
    inst_pll : pll
        port map (
            clk_in1  => clk,
            clk_out1 => clk0,
            reset    => '0',
            locked   => open);

    -- hook up GPIO pins
    gpio_in( 7 downto 0 ) <= switch;
    gpio_in( word'high downto 8 ) <= ( others => '0' );
    led <= gpio_out( 7 downto 0 );
    
    -- Instantiate the CPU
    cpu_inst : entity work.yafc(structural)
        port map(
            clk      => clk0,
            rst_in   => '1',
            tx       => tx,
            rx       => rx,
            gpio_in  => gpio_in,
            gpio_out => gpio_out);

end rtl;
