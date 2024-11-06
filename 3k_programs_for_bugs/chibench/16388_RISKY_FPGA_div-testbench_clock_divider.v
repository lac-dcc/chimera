// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module clock_divider #(


parameter COUNT_WIDTH = 24,
parameter [COUNT_WIDTH:0] MAX_COUNT = 6000000 - 1

)(
input clk,
input rst,

output reg out


);


// internal signals
wire rst;
reg div_clk;
reg [COUNT_WIDTH:0] count;

always @ (posedge clk or posedge rst) begin
  if (rst == 1'b1) begin
    count <= 0;
    out <= 0;
  end else if (count == MAX_COUNT) begin
    count <= 0;
    out <= ~out;

  end else begin
    count <= count + 1;
  end
end

endmodule
