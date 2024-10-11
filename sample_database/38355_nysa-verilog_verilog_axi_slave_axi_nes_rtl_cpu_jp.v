// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/***************************************************************************************************
** fpga_nes/hw/src/cpu/jp.v
*
*  Copyright (c) 2012, Brian Bennett
*  All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without modification, are permitted
*  provided that the following conditions are met:
*
*  1. Redistributions of source code must retain the above copyright notice, this list of conditions
*     and the following disclaimer.
*  2. Redistributions in binary form must reproduce the above copyright notice, this list of
*     conditions and the following disclaimer in the documentation and/or other materials provided
*     with the distribution.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
*  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
*  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
*  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
*  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
*  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
*  WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*  Joypad controller block.
***************************************************************************************************/
`timescale 1ps / 1ps

module jp(
  input              clk,         // 100MHz system clock signal
  input              rst,         // reset signal

  input              i_wr,         // i_write enable signal
  input       [15:0] i_addr,       // 16-bit memory i_address
  input              i_din,        // data input bus
  output reg  [7:0]  o_dout,       // data output bus

  input       [7:0]  i_jp1_state,  //state of the joy pad 1
  input       [7:0]  i_jp2_state   //state of the joy pad 2
);

//Local Parameters
localparam [15:0] JOYPAD1_MMR_ADDR = 16'h4016;
localparam [15:0] JOYPAD2_MMR_ADDR = 16'h4017;

//Registers/Wires
reg   [15:0]          r_prev_addr;
wire                  w_new_addr;
reg                   r_wrote_1_flag;
reg   [8:0]           r_jp1_state;
reg   [8:0]           r_jp2_state;

//Submodules
//Asynchronous Logic
assign  w_new_addr  = (r_prev_addr != i_addr);
//Synchronous Logic

always @ (posedge clk) begin
  if (rst) begin
    o_dout                  <=  0;
    r_prev_addr             <=  0;
    r_wrote_1_flag          <=  0;
    r_jp1_state             <=  0;
    r_jp2_state             <=  0;
  end
  else begin
    //Only process a command when i_address changes from not this i_address to this i_address
    if (i_addr[15:1] == JOYPAD1_MMR_ADDR[15:1]) begin
      //User has accessed the joypad register(s), depeni_ding on the last
      //bit send the appropriate joystick information (1 or 2)
      o_dout              <= { 7'h00, ((i_addr[0]) ? r_jp2_state[0] : r_jp1_state[0]) };
      if (w_new_addr) begin
        if (i_wr && !i_addr[0]) begin
          if (!r_wrote_1_flag) begin
            if (i_din == 1'b1) begin
              r_wrote_1_flag    <= 1;
            end
          end
          else begin
            if (i_din == 1'b0) begin
              r_wrote_1_flag    <=  0;
              r_jp1_state     <=  {i_jp1_state, 1'b0};
              r_jp2_state     <=  {i_jp2_state, 1'b0};
            end
          end
        end
        //Shift appropriate JP read state on every read, after 8 reads, all subsequent reads should be 1
        else if (!i_wr && !i_addr[0]) begin
          r_jp1_state         <=  {1'b1, r_jp1_state[8:1]};
        end
        else if (!i_wr && i_addr[0]) begin
          r_jp2_state         <=  {1'b1, r_jp2_state[8:1]};
        end
      end
    end
    r_prev_addr             <=  i_addr;
  end
end
endmodule

