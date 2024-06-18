// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module Register (
    par_in,
    clk,
    rst,
    load_en,
    par_out
);

  parameter word_len = 8;

  input [word_len - 1 : 0] par_in;
  input clk, rst, load_en;

  output reg [word_len - 1 : 0] par_out;

  always @(posedge clk or posedge rst) begin
    if (rst) par_out <= 'b0;
    if (load_en) par_out <= par_in;
  end

endmodule
