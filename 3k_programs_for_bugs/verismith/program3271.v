module top
#(parameter param20 = ((~(((+(8'hbd)) & {(8'hb2)}) ^ (((8'hb2) == (8'hbb)) * ((8'hb9) ? (8'ha6) : (8'h9d))))) | ((&(^((8'hbc) <= (8'hb5)))) ? (8'hb0) : {(~&(&(8'ha5))), (-((8'ha2) >> (7'h41)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg12,
                 (1'h0)};
  assign wire5 = $signed((!({$unsigned(wire1), $unsigned(wire0)} ?
                     wire4 : (wire1 ?
                         $unsigned(wire3) : (wire2 ? wire4 : wire3)))));
  assign wire6 = {wire4[(1'h1):(1'h1)]};
  assign wire7 = (wire5 <= wire0[(4'ha):(3'h4)]);
  assign wire8 = (wire6 ? $signed(wire2) : $unsigned((!$unsigned((^~wire3)))));
  assign wire9 = $signed((+wire6[(3'h4):(2'h2)]));
  assign wire10 = (~|{wire9,
                      ({$signed(wire0), (wire6 ? (8'hbc) : wire1)} | (~(wire4 ?
                          wire0 : wire6)))});
  assign wire11 = (wire0 ?
                      (((wire6[(2'h3):(1'h1)] ?
                          $signed((8'hbf)) : (^wire8)) + wire7[(3'h6):(3'h6)]) >> $signed(wire3)) : $signed(wire7));
  always
    @(posedge clk) begin
      reg12 <= $signed((!(+(~&(wire11 ? wire4 : wire2)))));
    end
  assign wire13 = reg12[(1'h0):(1'h0)];
  assign wire14 = (!{wire11[(3'h5):(3'h4)]});
  always
    @(posedge clk) begin
      reg15 <= $unsigned($signed(wire9));
      reg16 <= (~|(~|wire3[(4'ha):(2'h2)]));
      reg17 <= wire10[(1'h1):(1'h0)];
    end
  assign wire18 = wire6[(3'h6):(3'h6)];
  assign wire19 = $signed(($unsigned($signed(wire1[(1'h0):(1'h0)])) | wire10[(4'hb):(1'h1)]));
endmodule
