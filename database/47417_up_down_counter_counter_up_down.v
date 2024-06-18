// This program was cloned from: https://github.com/hodefiDavid/up_down_counter
// License: MIT License

// Verilog code for a 4-bit up/down counter

module counter_up_down_4 (
    up_down,  //count control
    clk,  //clock
    rst,  //reset
    bin_count  //output
);
  input up_down;
  input clk;
  input rst;
  output reg [3:0] bin_count;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      bin_count <= 4'b0000;
    end else if (up_down) begin
      if (bin_count == 4'b1111) begin
        bin_count <= 4'b0000;
      end else begin
        bin_count <= bin_count + 1;
      end
    end else begin
      if (bin_count == 4'b0000) begin
        bin_count <= 4'b1111;
      end else begin
        bin_count <= bin_count - 1;
      end
    end
  end
endmodule
