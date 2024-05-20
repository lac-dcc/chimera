// This program was cloned from: https://github.com/emern/badGPU
// License: Apache License 2.0

`default_nettype none
`timescale 1ns / 1ps

module tb_pixel_core ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb_pixel_core.vcd");
    $dumpvars(0, tb_pixel_core);
    #1;
  end

  // Wire up the inputs and outputs:
    reg clk;
    reg rst_n;
    reg pixel_clr; // Clear the pixel state
    reg cmp_en; // Enable polygon rasterization
    reg [8:0] pixel_row; // Current pixel row location
    reg [9:0] pixel_col; // Current pixel column location

    // Packed polygon data struct
    reg [8:0] polygon_depth;
    reg [17:0] polygon_color;
    reg [17:0] polygon_column;
    reg [17:0] polygon_row;

    reg [5:0] pixel_out; // Final value of pixel color


  // Replace tt_um_example with your module name:
  tt_um_emern_pixel_core user_project (

      // TODO: Verify this part
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .clk(clk),
      .rst_n(rst_n),
      .pixel_clr(pixel_clr),
      .cmp_en(cmp_en),
      .pixel_row(pixel_row),
      .pixel_col(pixel_col),

      .polygon_depth(polygon_depth),
      .polygon_color(polygon_color),
      .polygon_column(polygon_column),
      .polygon_row(polygon_row),

      .pixel_out(pixel_out)
  );

endmodule
