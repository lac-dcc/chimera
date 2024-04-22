--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library ieee;
use ieee.std_logic_1164.all;

use work.common.all;
use work.gpio_pkg.all;

entity gpio is
    port (
        clk      : in  std_logic;
        rst_n    : in  std_logic;
        regs_in  : in  gpio_in_regs_t;
        regs_out : out gpio_out_regs_t;
        pins_in  : in  gpio_in_pins_t;
        pins_out : out gpio_out_pins_t
        );
end gpio;

architecture rtl of gpio is
    signal regs_i : gpio_in_regs_t;
    signal regs_o : gpio_out_regs_t;
    signal pins_i : gpio_in_pins_t;
    signal pins_o : gpio_out_pins_t;

    signal synced : word := (others => '0');
begin

    ---------------------------------------------------------------------------
    -- Assign inputs and outputs
    ---------------------------------------------------------------------------

    pins_out.output <= regs_in.input;
    regs_out.output <= synced;

    -- synchronize inputs to this clock domain
    input_synchronizers : for i in word'range generate
        sync : entity work.synchronizer(rtl)
            port map (
                clk   => clk,
                rst_n => rst_n,
                ain   => pins_in.input(i),
                sout  => synced(i));
    end generate input_synchronizers;

end architecture rtl;
