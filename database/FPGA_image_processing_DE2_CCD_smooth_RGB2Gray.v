/* 
(C) OOMusou 2008 http://oomusou.cnblogs.com

Filename    : RGB2Gray.v
Compiler    : Quartus II 7.2 SP3
Description : RGB to gray
Release     : 07/14/2008 1.0
*/

module RGB2Gray (
  input            clk,
  input            rst_n,
  input      [9:0] i_r,
  input      [9:0] i_g,
  input      [9:0] i_b,
  output reg [9:0] o_r,
  output reg [9:0] o_g,
  output reg [9:0] o_b
);

always@(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    o_r <= {10{1'b0}};
    o_g <= {10{1'b0}};
    o_b <= {10{1'b0}};
  end
  else begin
    o_r <= (i_r + i_g + i_b) / 3;
    o_g <= (i_r + i_g + i_b) / 3;
    o_b <= (i_r + i_g + i_b) / 3;
  end
end

endmodule