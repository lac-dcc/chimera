// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2018 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
 * Author: Dave McCoy (dave.mccoy@cospandesign.com)
 * Description:
 *  Tranlates data from a BRAM to an AXI Stream
 *
 * Changes:     Who?  What?
 *  03/01/2018: DFM   Initial check in.
 */

`timescale 1ps / 1ps

module adapter_bram_2_axi_stream #(
  parameter                                     AXIS_DATA_WIDTH     = 32,
  parameter                                     BRAM_DEPTH          = 8,
  parameter                                     AXIS_STROBE_WIDTH   = AXIS_DATA_WIDTH / 8,
  parameter                                     USE_KEEP            = 0,
  parameter                                     USER_DEPTH          = 1
)(
  input                                         clk,
  input                                         rst,

  //Ping Poing FIFO Read Interface
  input       [USER_DEPTH - 1:0]                i_axis_user,

  input                                         i_bram_en,
  input       [BRAM_DEPTH - 1:0]                i_bram_size,
  output  reg [BRAM_DEPTH - 1:0]                o_bram_addr,
  input       [AXIS_DATA_WIDTH - 1:0]           i_bram_data,

  //AXI Stream Output
  output      [USER_DEPTH - 1:0]                o_axis_user,
  input                                         i_axis_ready,
  output      [AXIS_DATA_WIDTH - 1:0]           o_axis_data,
  output                                        o_axis_last,
  output                                        o_axis_valid
);

//Functions
function integer clogb2 (input integer bit_depth);
begin
  for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
    bit_depth = bit_depth >> 1;
end
endfunction



//local parameters
//localparam     PARAM1  = 32'h00000000;
localparam  IDLE        = 0;

localparam  BRAM_START  = 1;
localparam  BRAM_DELAY  = 2;
localparam  BRAM_READ   = 3;
localparam  BRAM_FIN    = 4;

localparam  AXIS_SEND_DATA   = 1;




localparam  DECOUPLE_DEPTH = 4;
//localparam  DECOUPLE_COUNT_SIZE = clogb2(DECOUPLE_DEPTH);
localparam  DECOUPLE_COUNT_SIZE = 2;
//registes/wires
reg   [3:0]                   state;

reg   [DECOUPLE_COUNT_SIZE - 1:0]  dstart;
reg   [DECOUPLE_COUNT_SIZE - 1:0]  dend;
reg   [AXIS_DATA_WIDTH - 1:0] dfifo[0:DECOUPLE_DEPTH - 1];  //Decoupling FIFO

wire  dempty;
wire  dfull;
wire  dalmost_full;
wire  dlast;


//AXIS
wire  w_axis_active;
reg   r_axis_enable;

//submodules
//asynchronous logic

assign  o_axis_user       = i_axis_user;
assign  dempty            = (dstart == dend);
assign  dfull             = (dend == (1 << DECOUPLE_COUNT_SIZE) - 1) ?  (dstart == 0) : ((dend + 1) == dstart);

assign  dalmost_full      = (dend == (1 << DECOUPLE_COUNT_SIZE) - 2) ?  (dstart == 0) : (dend == (1 << DECOUPLE_COUNT_SIZE) - 1) ?  (dstart == 1) : ((dend + 2) == dstart);
                            
assign  dlast             = (dstart == (1 << DECOUPLE_COUNT_SIZE) - 1) ? (dend   == 0) : ((dstart + 1) == dend);

assign  o_axis_last       = ((o_bram_addr > i_bram_size) || !i_bram_en) && dlast && (state == BRAM_FIN);
assign  o_axis_valid      = (!dempty && r_axis_enable);
assign  w_axis_active     = (o_axis_valid && i_axis_ready);
assign  o_axis_data       = dfifo[dstart];

//synchronous logic
integer i;
always @ (posedge clk) begin
  if (rst) begin
    state          <=  IDLE;
    o_bram_addr         <=  0;
    dstart              <=  0;
    dend                <=  0;
    r_axis_enable       <=  0;
    for (i = 0; i < DECOUPLE_DEPTH; i = i + 1) begin
      dfifo[i] <=  0;
    end
  end
  else begin
    case (state)
      IDLE: begin
        o_bram_addr   <=  0;
        dstart        <=  0;
        dend          <=  0;
        if (i_bram_en) begin
          state  <=  BRAM_START;
        end
      end
      BRAM_START: begin
        //If the FIFO is not full request data from BRAM
        if (!dfull) begin
          dfifo[dend]   <=  i_bram_data;
          dend          <=  dend + 1;
          o_bram_addr   <=  o_bram_addr + 1;
          if ((o_bram_addr + 1) >= i_bram_size) begin
            state  <=  BRAM_FIN; 
          end
          else begin
            state  <=  BRAM_DELAY;
          end
        end
      end
      BRAM_DELAY: begin
        if (o_bram_addr >= i_bram_size) begin
            state  <=  BRAM_FIN;
        end
        else if (dfull) begin
          state    <=  BRAM_START;
        end
        else begin
          state    <=  BRAM_READ;
          o_bram_addr   <=  o_bram_addr + 1;
        end
      end
      BRAM_READ: begin
        dfifo[dend]     <=  i_bram_data;
        dend            <=  dend + 1;

        if (o_bram_addr > i_bram_size) begin
          state  <=  BRAM_FIN; 
        end
        else if (dfull || dalmost_full) begin
          state  <=  BRAM_START;
        end
        else begin
          o_bram_addr     <=  o_bram_addr + 1;
        end
      end
      BRAM_FIN: begin
        if (!i_bram_en) begin
          state  <=  IDLE;
          r_axis_enable <=  0;
        end
      end
    endcase

    //Go back to idle when bram is not enabled
    if (!i_bram_en) begin
      state     <= IDLE;
    end


    //Add the r_axis_enable to bypass the valid hiccup
    if (!r_axis_enable && dfull) begin
      r_axis_enable     <=  1;
    end
    else if (dempty && (o_bram_addr >= i_bram_size)) begin
      r_axis_enable     <=  0;
    end

    if (w_axis_active) begin
      dstart            <=  dstart + 1;
    end
  end
end

endmodule
