/*
  iCEstick Glitcher (offset_counter.v)
 
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

`timescale 1ns / 1ps

module offset_counter(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire[31:0] din,
    output reg done
);

    reg [31:0] counter;

    // state machine
    parameter[2:0] STATE_IDLE = 2'd0;
    parameter[2:0] STATE_RUNNING = 2'd1;
    parameter[2:0] STATE_DONE = 2'd2;

    reg[2:0] state = STATE_IDLE;


    always @(posedge clk)
    begin
        state <= state;
        counter <= counter;
        done <= 1'b0;
        
        if (reset)
        begin
            state <= STATE_IDLE;
        end
        
        case(state)
            // IDLE state
            STATE_IDLE:
            begin
                if (enable)
                begin
                    // reset counter to offset counter value
                    counter <= din;
                    state <= STATE_RUNNING;
                end
            end
            
            // RUNNING state
            STATE_RUNNING:
            begin
                // decrease counter
                counter <= counter - 1'b1;
                
                if (counter == 1)
                begin
                    state <= STATE_DONE;
                end
            end
            
            // DONE_STATE
            STATE_DONE:
            begin
                done <= 1'b1;
                state <= STATE_IDLE;
            end
        endcase
    end     
        
endmodule
