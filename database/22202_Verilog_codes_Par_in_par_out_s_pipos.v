// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module piporegister (
  input wire clk,
  input wire reset,
  input wire [7:0] parallel_in,
  input wire enable,
  output reg [7:0] parallel_out
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      parallel_out <= 8'b00000000;
    else if (enable)
      parallel_out <= parallel_in;
  end

endmodule