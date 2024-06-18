// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

module video_to_block_fifo #(
    parameter BUFFER_SIZE = 9
)(
input               clk,
input               rst,


input               i_enable,

input               i_video_hsync,
input               i_video_sof_stb,
input       [7:0]   i_red,
input       [7:0]   i_green,
input       [7:0]   i_blue,

//Memory FIFO Interface
input               i_rfifo_clk,
input               i_rfifo_rst,
output              o_rfifo_ready,
input               i_rfifo_activate,
input               i_rfifo_strobe,
output      [24:0]  o_rfifo_data,
output      [23:0]  o_rfifo_size
);

//Local Parameters
//Registers/Wires
wire                w_write_ready;
reg                 r_write_activate;
wire  [23:0]        w_write_fifo_size;
reg                 r_write_stb;
reg   [24:0]        r_write_data;
reg                 r_used;
reg   [23:0]        r_count;  //XXX: Don't need this in the final design but it's good for debugging

//Submodules
block_fifo #(
  .DATA_WIDTH       (25                 ),
  .ADDRESS_WIDTH    (BUFFER_SIZE        )
) bf (
  .reset            (rst | i_rfifo_rst  ),

  //write side
  .write_clock      (clk                ),
  .write_ready      (w_write_ready      ),
  .write_activate   (r_write_activate   ),
  .write_fifo_size  (w_write_fifo_size  ),
  .write_strobe     (r_write_stb        ),
  .write_data       (r_write_data       ),

  //read size
  .read_clock       (i_rfifo_clk        ),
  .read_strobe      (i_rfifo_strobe     ),
  .read_ready       (o_rfifo_ready      ),
  .read_activate    (i_rfifo_activate   ),
  .read_count       (o_rfifo_size       ),
  .read_data        (o_rfifo_data       )
);

//Asynchronous Logic
//Synchronous Logic
always @ (posedge clk) begin
  r_write_stb                       <=  0;
  if (rst) begin
    r_write_activate                <=  0;
    r_write_stb                     <=  0;
    r_write_data                    <=  0;
    r_used                          <=  0;
    r_count                         <=  0;
  end
  else begin
    if (i_enable && !r_write_activate && w_write_ready) begin
      r_write_activate              <=  1;
      r_used                        <=  0;
      r_count                       <=  0;
    end
    if (r_write_activate) begin
      if (i_video_hsync) begin
        r_write_data                <=  {i_video_sof_stb, i_red, i_green, i_blue};
        r_write_stb                 <=  1;
        r_used                      <=  1;
        r_count                     <=  r_count + 1;
      end
      else if (r_used) begin
  
        r_write_activate            <=  0;
      end
    end
  end
end
endmodule

