// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module clk_div #(parameter X = 16)(
  input wire clk,

  output wire clk_divided
);

reg [$clog2(X):0]cnt = 0;
assign clk_divided = (cnt == X);

always @(posedge clk) begin
  cnt <= cnt + 1;
end

always @(negedge clk) begin
  if (clk_divided)
    cnt <= 0;
end

endmodule