module top
#(parameter param13 = ((^((((8'hae) + (8'ha5)) ? (~|(8'hbd)) : ((8'hb5) >>> (8'h9e))) ? (8'hac) : {((8'haf) ? (8'hbd) : (8'hb4))})) ~^ (((((8'ha2) <<< (8'ha4)) ? (~&(8'ha4)) : ((8'haa) ? (8'ha0) : (8'ha8))) ? (((8'hbb) | (8'haa)) >> (~(8'hac))) : {((8'h9d) ^ (8'haf)), (~|(7'h41))}) ^~ {(~^((8'hb1) > (8'hbb))), (((8'hb0) ? (7'h41) : (8'hae)) | ((8'hb3) ? (8'hb0) : (8'ha8)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (^~(|(7'h40)));
  assign wire5 = $unsigned(wire1[(4'h9):(2'h2)]);
  always
    @(posedge clk) begin
      reg6 <= wire5[(3'h7):(2'h3)];
      reg7 <= wire5[(2'h2):(2'h2)];
      reg8 <= (-$unsigned((($signed(wire2) ^~ wire5[(3'h5):(1'h0)]) ^ $signed((~|wire1)))));
    end
  assign wire9 = {wire0,
                     ((~^$signed(wire0)) ?
                         (~&reg6[(3'h4):(1'h1)]) : wire5[(1'h0):(1'h0)])};
  assign wire10 = wire9;
  assign wire11 = $signed(reg7[(4'hc):(4'hc)]);
  assign wire12 = ((~^($unsigned((wire1 <= reg6)) ?
                      $signed(wire4[(1'h1):(1'h0)]) : (wire10 >= wire11))) & {($unsigned($unsigned(wire0)) >>> $signed(wire0)),
                      wire9[(2'h3):(1'h1)]});
endmodule
