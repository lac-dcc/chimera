module top
#(parameter param34 = {(|((!((8'ha4) > (8'ha2))) ? (((7'h42) || (7'h43)) ? (~|(8'hb2)) : ((8'hb4) ? (8'hb1) : (8'hb6))) : ((~|(8'hac)) ? (~|(8'hbc)) : {(8'hbf)})))}, 
parameter param35 = param34)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire32;
  assign y = {wire5, wire6, wire7, wire8, wire32, (1'h0)};
  assign wire5 = $unsigned((7'h44));
  assign wire6 = wire1[(2'h3):(1'h1)];
  assign wire7 = $unsigned(((8'hac) * $unsigned($signed((~|(8'h9c))))));
  assign wire8 = {wire7};
  module9 #() modinst33 (wire32, clk, wire0, wire8, wire6, wire5, wire1);
endmodule

module module9
#(parameter param30 = (&(((^((8'ha6) << (8'hb5))) <= (((8'hb8) ? (8'hba) : (8'ha6)) != {(8'hbd)})) ? (-(((8'ha1) & (8'hab)) > (~|(8'hb0)))) : (^~(&(!(8'hb2)))))), 
parameter param31 = (({(~param30)} && {(~&(param30 ^ param30))}) << ((~&((~&param30) ? (param30 >= param30) : {param30})) ? (+{(^param30)}) : (~(8'hb8)))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire15 = $signed($signed(($signed(wire10[(2'h3):(2'h3)]) ?
                      ($unsigned(wire12) < (^~(8'haa))) : $unsigned($unsigned(wire12)))));
  assign wire16 = wire15;
  assign wire17 = $signed($signed($unsigned($signed((wire10 ^~ (8'hb0))))));
  assign wire18 = ($signed(wire13) ?
                      $unsigned((~{$signed(wire13)})) : wire10[(2'h3):(2'h3)]);
  assign wire19 = (^~(((|(wire10 ?
                          wire13 : wire13)) & ($signed(wire15) - (wire14 ?
                          wire18 : wire18))) ?
                      wire16[(2'h2):(2'h2)] : wire17));
  assign wire20 = {$unsigned(wire14[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg21 <= {wire16};
      reg22 <= reg21[(1'h1):(1'h1)];
      reg23 <= $signed({$unsigned($unsigned(wire11[(1'h1):(1'h0)]))});
      reg24 <= (8'ha7);
      reg25 <= (~^(reg23[(1'h0):(1'h0)] == wire20));
    end
  assign wire26 = {(((wire19 ? $unsigned(wire20) : (wire11 == (8'hbe))) ?
                              wire18 : (wire10 == {wire15})) ?
                          wire11[(2'h3):(2'h2)] : (&($unsigned(wire16) > (wire12 ?
                              wire19 : wire18)))),
                      $signed(wire18)};
  assign wire27 = $signed($signed(reg22));
  assign wire28 = reg22;
  assign wire29 = $unsigned(wire13);
endmodule
