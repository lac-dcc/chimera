/*
  iCEstick Glitcher (top.v)
 
  by Matthias Deeg (@matthiasdeeg, matthias.deeg@syss.de)

  Simple voltage glitcher for a Lattice iCEstick Evaluation Kit

  This glitcher is based on and inspired by glitcher implementations
  by Dmitry Nedospasov (@nedos) from Toothless Consulting and
  Grazfather (@Grazfather)

  References:
    http://www.latticesemi.com/icestick
    https://github.com/toothlessco/arty-glitcher
    https://toothless.co/blog/bootloader-bypass-part1/
    https://toothless.co/blog/bootloader-bypass-part2/
    https://toothless.co/blog/bootloader-bypass-part3/
    https://github.com/Grazfather/glitcher
    http://grazfather.github.io/re/pwn/electronics/fpga/2019/12/08/Glitcher.html

  Copyright (C) 2020, Matthias Deeg, SySS GmbH

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice,
     this list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright notice,
     this list of conditions and the following disclaimer in the documentation
     and/or other materials provided with the distribution.

  3. Neither the name of the copyright holder nor the names of its contributors
     may be used to endorse or promote products derived from this software
     without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE.
*/

`default_nettype none

module top
(
    input wire          clk,
    input wire          uart_rx,
    output wire         uart_tx,
    input wire          target_rx,
    output wire         target_tx,
    output wire         gled1,
    output wire         rled1,
    output wire         rled2,
    output wire         rled3,
    output wire         rled4,
    output wire         target_rst,
    output wire         power_ctrl,
);

    // connect UART TX of FPGA to UART RX of the target device
    assign uart_tx = target_rx;

    wire sys_clk;                           // system clock (PLL)
    wire locked;                            // PLL lock							
    wire target_reset;                      // target reset signal
    wire start_offset_counter;              // start offset counter signal
    wire start_duration_counter;            // start duration counter signal
    wire [31:0] glitch_duration;            // glitch duration register
    wire [31:0] glitch_offset;              // glitch offset register

    // set LEDs
    assign gled1 = locked;
    assign rled1 = 1'b0;
    assign rled2 = 1'b0;
    assign rled3 = 1'b0;
    assign rled4 = 1'b0;

    // PLL for custom-defined system clock
    pll my_pll(
        .clock_in(clk),
        .clock_out(sys_clk),
        .locked(locked)
    );	

    // command processor
    command_processor command_processor (
        .clk(sys_clk),
        .din(uart_rx),
        .rst(!locked),
        .dout(target_tx),
        .target_reset(target_reset),
        .duration(glitch_duration),
        .offset(glitch_offset),
        .start_offset_counter(start_offset_counter)
    );

    // target device resetter
    resetter resetter(
        .clk(sys_clk),
        .enable(target_reset),
        .reset_line(target_rst)
    );

    // offset counter
    offset_counter offset_counter(
        .clk(sys_clk),
        .reset(target_reset),
        .enable(start_offset_counter),
        .din(glitch_offset),
        .done(start_duration_counter)
    );

    // duration counter
    duration_counter duration_counter(
        .clk(sys_clk),
        .reset(target_reset),
        .enable(start_duration_counter),
        .din(glitch_duration),
        .power_select(power_ctrl)
    );

endmodule
