// This program was cloned from: https://github.com/YosysHQ/apicula
// License: MIT License

module top ( out, clk, reset );
    output out;
    input clk, reset;
    reg out;

    always @(posedge clk, posedge reset)
      if (reset)
          out <= 0;
      else
          out <= ~out;
endmodule
