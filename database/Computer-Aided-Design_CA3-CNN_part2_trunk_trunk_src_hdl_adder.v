// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module adder (
  input [11:0] a,
  input [7:0] b,
  input clk,rst,add_en,
  output reg [11:0] sum
);

always @(posedge clk) 
begin
  if (rst) 
    sum <= 12'd0;
  else if (add_en)
    sum <= a + b;
end

endmodule



module adder_l2 (
  input [11:0] a,
  input [11:0] b,
  input [11:0] c,
  input [11:0] d,
  // input clk,rst,add_en,
  output [7:0] sum
);
// always @(posedge clk) 
// begin
//   if (rst) 
//     sum <= 12'd0;
//   else if (add_en)
//     sum <= a + b;
// end

wire [12:0] temp1,temp2;
wire [13:0] res;
assign temp1 = a + b;
assign temp2 = c + d;
assign res = temp1 + temp2;
assign sum = res[13:6];
endmodule
