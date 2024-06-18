// This program was cloned from: https://github.com/ilaydayaman/CNN_for_SLR
// License: BSD 2-Clause "Simplified" License

`timescale 1ns / 1ps

module RELU1(
input [22:0] a,
input clk,
input enable,
input read_strobe,
output reg [21:0] out,
output reg write_strobe,
output reg done
    );

always@(posedge clk) begin
    done <= enable;
  if (enable && read_strobe) begin
    if (a[22] == 1) begin
      out <= 0;
      write_strobe <= 1;
    end
    else begin
      out <= a[21:0];
      write_strobe <= 1;
    end
  end else write_strobe <= 0;
end
endmodule
