/*
  iCEstick Glitcher (resetter.v)
 
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

module resetter(
    input wire clk,
    input wire enable,
    output wire reset_line
);
 
    reg [255:0] shift;

    assign reset_line = shift[0];

    always @(posedge clk)
    begin
        // shit a bit
        shift <= {1'b1, shift[255:1]};
        
        if (enable)
        begin
            // reset shift register
            shift <= 256'b0;
        end
    end
    
endmodule
