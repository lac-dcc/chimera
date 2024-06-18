// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2017 Dave McCoy (dave.mccoy@cospandesign.com)

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
FITNESS FOR A PARTICULAR PURPOSE AND NACITVEINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTIACITVE OF CACITVETRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CACITVENECTIACITVE WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
 * Author:
 * Description:
 *  Translate one image size to another image size
 *  Only downsampling is supported
 *  TODO:
 *    Support Up Sampling
 *
 * Changes:
 *  04/06/2017  DFM     Initial Commit.
 */

`timescale 1ps / 1ps

module video_resizer #(
  parameter         DATAS_WIDTH   = 24,
  parameter         PPFIFO_WIDTH  = 9
)(
  input                           clk,
  input                           rst,

  //Configuration Ports
  input                           i_enable,
  input                           i_reset,
  input       [31:0]              i_video_in_size,
  input       [31:0]              i_video_in_width,
  input       [31:0]              i_video_in_height,

  input       [31:0]              i_video_out_size,
  input       [31:0]              i_video_out_width,
  input       [31:0]              i_video_out_height,

  input       [31:0]              i_video_in_start_x,
  input       [31:0]              i_video_in_start_y,
  input       [DATAS_WIDTH - 1:0] i_fill_pixel_value,

  //FIFO in Signals
  output      [1:0]               o_fifo_in_rdy,
  input       [1:0]               i_fifo_in_act,
  input                           i_fifo_in_stb,
  output      [23:0]              o_fifo_in_size,
  input       [DATAS_WIDTH - 1:0] i_fifo_in_data,

  output                          o_fifo_out_rdy,
  input                           i_fifo_out_act,
  input                           i_fifo_out_stb,
  output      [23:0]              o_fifo_out_size,
  output      [DATAS_WIDTH - 1:0] o_fifo_out_data
);

//local parameters
localparam  INACTIVE              = 0;
localparam  ACITVE                = 1;
localparam  FLUSH                 = 2;

//registes/wires
reg   [3:0]                       state;


reg   [23:0]                      r_read_count;
reg   [23:0]                      r_write_count;

reg   [31:0]                      r_read_width_pos;
reg   [31:0]                      r_read_height_pos;
reg   [31:0]                      r_pixel_in_count;
reg   [31:0]                      r_pixel_out_count;

reg                               r_read_stb;
wire                              w_read_rdy;
reg                               r_read_act;
wire  [23:0]                      w_read_size;
wire  [DATAS_WIDTH - 1: 0]        w_read_data;

reg                               r_write_stb;
wire  [1:0]                       w_write_rdy;
reg   [1:0]                       r_write_act;
wire  [23:0]                      w_write_size;
//reg   [DATAS_WIDTH - 1: 0]        r_write_data;
//wire  [DATAS_WIDTH - 1: 0]        w_write_data;

wire                              w_trans_valid;

//submodules
ppfifo #(
  .DATA_WIDTH       (DATAS_WIDTH      ),
  .ADDRESS_WIDTH    (PPFIFO_WIDTH     )
)fifo_in (

  .reset           (rst || i_reset    ),

  //write
  .write_clock     (clk               ),
  .write_ready     (o_fifo_in_rdy     ),
  .write_activate  (i_fifo_in_act     ),
  .write_fifo_size (o_fifo_in_size    ),
  .write_strobe    (i_fifo_in_stb     ),
  .write_data      (i_fifo_in_data    ),

  //read
  .read_clock      (clk               ),
  .read_strobe     (r_read_stb        ),
  .read_ready      (w_read_rdy        ),
  .read_activate   (r_read_act        ),
  .read_count      (w_read_size       ),
  .read_data       (w_read_data       )
);

ppfifo #(
  .DATA_WIDTH       (DATAS_WIDTH      ),
  .ADDRESS_WIDTH    (PPFIFO_WIDTH     )
)fifo_out (

  .reset           (rst || i_reset    ),

  //write
  .write_clock     (clk               ),
  .write_ready     (w_write_rdy       ),
  .write_activate  (r_write_act       ),
  .write_fifo_size (w_write_size      ),
  .write_strobe    (r_write_stb       ),
  //.write_data      (r_write_data      ),
  .write_data      (w_read_data       ),

  //read
  .read_clock      (clk               ),
  .read_strobe     (i_fifo_out_stb    ),
  .read_ready      (o_fifo_out_rdy    ),
  .read_activate   (i_fifo_out_act    ),
  .read_count      (o_fifo_out_size   ),
  .read_data       (o_fifo_out_data   )
);

//assign  w_write_data  =   (w_trans_valid) ?  w_read_data : i_fill_pixel_value;

//asynchronous logic
assign  w_trans_valid =   (r_read_width_pos  >=  i_video_in_start_x)                      &&
                          (r_read_width_pos  <  (i_video_in_start_x + i_video_out_width))&&
                          (r_read_height_pos >=  i_video_in_start_y)                      &&
                          (r_read_height_pos <  (i_video_in_start_y + i_video_out_height));
//synchronous logic
always @ (posedge clk) begin
  r_write_stb           <=  0;
  r_read_stb            <=  0;
  if (rst || i_reset) begin
    r_read_width_pos    <=  0;
    r_read_height_pos   <=  0;
    r_pixel_out_count   <=  0;

    r_read_act          <=  0;
    r_write_act         <=  0;
//    r_write_data        <=  0;
    state               <=  INACTIVE;

    r_read_count        <=  0;
    r_write_count       <=  0;
    r_pixel_in_count    <=  0;

  end
  else begin
    case (state)
      INACTIVE: begin
        r_read_width_pos    <=  0;
        r_read_height_pos   <=  0;
        r_pixel_in_count    <=  0;
        if (i_enable) begin
          state             <=  ACITVE;
        end
      end
      ACITVE: begin
        //Both the FIFOs should be open, we can read and transfer between the two
        if ((w_write_rdy > 0) && (r_write_act == 0)) begin
          r_write_count     <=  0;
          if (w_write_rdy[0]) begin
            r_write_act[0]  <=  1;
          end
          else begin
            r_write_act[1]  <=  1;
          end
        end

        if (w_read_rdy && !r_read_act) begin
          r_read_count      <=  0;
          r_read_act        <=  1;
        end

        if (r_read_act && (r_write_act > 0)) begin
          //Both sides are open
          if ((r_write_count < w_write_size) && (r_read_count < w_read_size)) begin
            //Get data from the input
            r_read_stb            <=  1;
            r_write_count         <=  r_write_count + 1;
            r_read_count          <=  r_read_count + 1;
            r_pixel_in_count      <=  r_pixel_in_count + 1;
            if ((r_read_width_pos + 1) < i_video_in_width) begin
              //Increment the pixel pos on the line
              r_read_width_pos    <= r_read_width_pos + 1;
            end
            else begin
              //Reached the end of a line, go to the next line
              r_read_width_pos    <=  0;
              r_read_height_pos   <= r_read_height_pos + 1;
            end
            if (w_trans_valid) begin
              r_write_stb         <=  1;
//              r_write_data        <=  w_read_data;
              r_pixel_out_count   <=  r_pixel_out_count + 1;
            end
          end
          else begin
            //Either one or both FIFOs have been drained, drain the other one
            if (r_write_count >= w_write_size) begin
              r_write_act         <=  0;
            end
            if (r_read_count >= w_read_size) begin
              r_read_act          <=  0;
            end
          end
        end
        if (r_pixel_out_count >= i_video_out_size) begin
          state                   <=  FLUSH;
        end
      end
      FLUSH: begin
        //Only one of the FIFOs is open, we need to fill it up or drain the rest
        if (r_pixel_in_count < i_video_in_size) begin
          if (w_read_rdy && !r_read_act) begin
            r_read_count          <=  0;
            r_read_act            <=  1;
          end
          else if (r_read_act) begin
            if (r_read_count < w_read_size) begin
              r_read_stb          <=  1;
              r_read_count        <=  r_read_count + 1;
              r_pixel_in_count    <=  r_pixel_in_count + 1;
            end
            else begin
              r_read_act          <=  0;
            end
          end
        end
        if (r_pixel_out_count < i_video_out_size) begin
          if ((w_write_rdy > 0) && (r_read_act == 0)) begin
            r_write_count         <=  0;
            if (w_write_rdy[0]) begin
              r_write_act[0]      <=  1;
            end
            else begin
              r_write_act[1]      <=  1;
            end
          end
          else if (r_write_act > 0) begin
            if (r_write_count < w_write_size) begin
              r_write_stb         <=  1;
              r_write_count       <=  r_write_count + 1;
              r_pixel_out_count   <=  r_pixel_out_count + 1;
//              r_write_data        <=  i_fill_pixel_value;
            end
          end
        end
        if ((r_pixel_in_count >= i_video_in_size) &&
            (r_pixel_out_count >= i_video_out_size) ) begin
          state                   <=  INACTIVE;
          r_write_act             <=  0;
          r_read_act              <=  0;
        end
      end
      default: begin
      end
    endcase
    if (!i_enable) begin
      state         <=  INACTIVE;
    end
  end
end



endmodule
