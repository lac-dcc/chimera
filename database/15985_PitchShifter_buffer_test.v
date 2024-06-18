// This program was cloned from: https://github.com/jmt329/PitchShifter
// License: MIT License

/* Buffer module testbench */

`timescale 1ns/1ns

module buffer_test();

   localparam B = 1024;

   reg CLOCK_50, rst;
   reg [31:0] counter;
   reg        new_sample_val;

   wire [31:0] pitch_shift_out;
   wire        pitch_shift_val;

   // make reset
   initial begin
      CLOCK_50 = 1'b0;
      rst = 1'b0;
      counter = 32'b0;
      new_sample_val = 1'b0;
      #50
        rst = 1'b1;
      #100
        rst = 1'b0;
   end

   // make clock
   always begin
      #10
        CLOCK_50 = !CLOCK_50;
   end

   always begin
      #50
        counter = counter + 1;
      new_sample_val = 1'b1;
      #10
        new_sample_val = 1'b0;

   end

   buffer #(B) b1
     (
      //inputs
      .clk(CLOCK_50),
      .rst(rst),
      .delta(8'b01000000), // 1 in fixed3.5
      .new_sample_val(new_sample_val),
      .new_sample_data(counter),
      .out_sel(1'b0),
      .delta_mode(1'b0),
      //outputs
      .pitch_shift_out(pitch_shift_out),
      .pitch_shift_val(pitch_shift_val)
      );

endmodule
