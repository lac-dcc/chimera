// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module image_to_ppfifo #(
    parameter BUFFER_SIZE = 10
)(
input               clk,
input               rst,

input               i_enable,

input               i_hsync,          // vga hsync signal
input               i_vsync,          // vga vsync signal
input       [2:0]   i_red,            // vga red signal
input       [2:0]   i_green,          // vga green signal
input       [1:0]   i_blue,           // vga blue signal

output  reg         o_frame_finished,

//Memory FIFO Interface
output              o_rfifo_ready,
input               i_rfifo_activate,
input               i_rfifo_strobe,
output      [31:0]  o_rfifo_data,
output      [23:0]  o_rfifo_size
);

//Local Parameters
localparam          IDLE            =   4'h0;
localparam          PROCESS_IMAGE   =   4'h1;
//Registers/Wires

reg                 r_prev_vsync;
wire                w_neg_edge_vsync;

//ppfifo interface
wire  [1:0]         w_write_ready;
reg   [1:0]         r_write_activate;
wire  [23:0]        w_write_fifo_size;
reg                 r_write_strobe;
reg   [23:0]        r_write_count;
reg   [31:0]        r_write_data;

//Submodules
ppfifo p2m
#(
  .DATA_WIDTH       (32                 ),
  .ADDRESS_WIDTH    (BUFFER_SIZE        )
)fifo        (

  //universal input
  .reset            (rst                ),

  //write side
  .write_clock      (clk                ),
  .write_ready      (w_write_ready      ),
  .write_activate   (r_write_activate   ),
  .write_fifo_size  (w_write_fifo_size  ),
  .write_strobe     (r_write_strobe     ),
  .write_data       (r_write_data       ),

//  .inactive          (w_inactive          ),

  //read side
  .read_clock       (clk                ),
  .read_strobe      (i_rfifo_strobe     ),
  .read_ready       (o_rfifo_ready      ),
  .read_activate    (i_rfifo_activate   ),
  .read_count       (o_rfifo_size       ),
  .read_data        (o_rfifo_data       )
);

//Asynchronous Logic
assign  w_neg_edge_vsync            = (r_prev_vsync & !i_vsync);
//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    r_write_activate                <=  0;
    r_write_strobe                  <=  0;
    r_write_count                   <=  0;
    r_write_data                    <=  0;

    o_frame_finished                <=  0;
    r_prev_vsync                    <=  0;
  end
  else begin
    o_frame_finished                <=  0;
    r_write_strobe                  <=  0;

    if (i_enable && (r_write_activate == 0) && (w_write_ready > 0)) begin
      r_write_count                 <=  0;
      if (w_write_ready[0]) begin
          r_write_activate[0]       <=  1;
      end
      else begin
          r_write_activate[1]       <=  1;
      end
    end
    if (i_enable && (r_write_activate > 0)) begin
      if (i_hsync) begin
        r_write_data                <=  {24'h000000, i_red, i_green, i_blue};
        r_write_strobe              <=  1;
        r_write_count               <=  r_write_count + 1;
        if (r_write_count >= w_write_fifo_size - 1) begin
          r_write_activate          <=  0;
        end
      end
      else if (!i_hsync) begin
        r_write_activate            <=  0;
      end

      if (w_neg_edge_vsync) begin
        o_frame_finished            <=  1;
      end
    end
    r_prev_vsync                    <=  i_vsync;
  end
end
endmodule
