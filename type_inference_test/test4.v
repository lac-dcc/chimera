module mod4(
  input clock,
  input enable,
  input rst,
  input [7:0] data_in,
  output reg [7:0] data_out
);
  always @(posedge clock or posedge rst) begin
    if (rst)
      data_out <= 8'b0;
    else if (enable)
      data_out <= data_in;
  end
endmodule
