module top
#(parameter param13 = (((&({(8'ha4), (7'h42)} ~^ ((8'ha7) ? (8'ha4) : (8'hba)))) || ((((8'h9c) ? (8'hbf) : (8'hb1)) | (^~(8'hbd))) ? ({(8'hb7), (8'hbb)} ? (8'haf) : (^~(8'hb4))) : (((8'hb0) + (8'ha4)) && {(8'ha9), (8'hb4)}))) ? {((((8'hbf) ? (8'h9f) : (7'h44)) ? ((8'had) ? (8'h9f) : (7'h40)) : ((8'haa) >= (8'hbf))) ? (+((8'ha1) ? (8'ha3) : (8'hbf))) : ({(8'hb1)} <<< (~|(8'hb8)))), ({(~(8'hbf)), ((8'hba) && (8'h9c))} != {((8'ha8) || (8'hb8))})} : (8'had)), 
parameter param14 = {(8'ha6), ((^~(^(~&param13))) >>> (((!param13) && (param13 ^ param13)) ? (param13 > (param13 || param13)) : ((param13 + param13) || (param13 == param13))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, reg12, reg11, reg10, reg9, reg8, reg7, (1'h0)};
  assign wire5 = wire0[(4'hc):(4'hc)];
  assign wire6 = wire1[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg7 <= ($unsigned($signed($signed((~(8'hab))))) >>> ($signed(wire0[(4'h9):(1'h1)]) + $unsigned((wire0[(4'hb):(2'h2)] + (+wire6)))));
      reg8 <= $signed(wire4);
      reg9 <= wire3;
      reg10 <= wire6[(4'he):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg11 <= $unsigned($signed((!$signed((+wire4)))));
      reg12 <= {((8'ha5) ^~ (~|(7'h40)))};
    end
endmodule
