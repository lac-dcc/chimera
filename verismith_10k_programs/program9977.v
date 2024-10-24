module top
#(parameter param9 = ({((((8'hb7) && (8'ha8)) != ((8'h9e) ? (8'had) : (8'hbd))) ^ (&((8'haf) | (8'hbc))))} ^~ ((~^((~|(8'hb7)) ~^ (~|(8'ha0)))) & (^~({(8'ha4), (8'ha3)} ? ((8'ha1) ? (7'h44) : (8'hb3)) : ((8'haf) ? (8'ha8) : (8'hb3)))))), 
parameter param10 = (^((((~&param9) < (param9 < param9)) ? param9 : ((~|param9) ? (param9 ^ param9) : (param9 >= param9))) ? (~(^param9)) : (param9 ? (-{param9, param9}) : param9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire5, wire4, reg8, reg7, reg6, (1'h0)};
  assign wire4 = $signed((|wire0));
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= $unsigned($signed(wire5));
    end
  always
    @(posedge clk) begin
      reg7 <= wire4;
      reg8 <= $unsigned((wire2 ? (8'haa) : ((8'hb8) == (~|$signed((8'hbe))))));
    end
endmodule
