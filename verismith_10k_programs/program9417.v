module top
#(parameter param29 = {(8'hb2)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire6;
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 wire11,
                 wire6,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed((^~wire2[(2'h3):(1'h0)]));
      reg5 <= $unsigned(((~^((wire0 ?
          wire1 : wire2) == (~|wire3))) - wire2[(4'ha):(1'h1)]));
    end
  assign wire6 = wire3[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg7 <= (reg5 >>> (wire0[(2'h2):(1'h1)] ? (~reg4) : wire3));
      reg8 <= $unsigned($signed($unsigned($unsigned({wire0, wire0}))));
      reg9 <= reg8;
      reg10 <= ($signed(reg8) ?
          (|(!reg4[(4'hb):(4'h8)])) : (((~^(~^reg9)) ?
              reg7 : (wire0[(1'h1):(1'h0)] - $unsigned(reg8))) | $signed(wire2)));
    end
  assign wire11 = ({$unsigned(($signed(wire2) ?
                          {reg10,
                              (8'hb0)} : wire3))} ~^ ($signed(reg7[(2'h2):(2'h2)]) ^~ $unsigned(reg9[(2'h2):(1'h1)])));
  module12 #() modinst23 (.wire14(reg4), .y(wire22), .wire15(wire0), .wire13(wire6), .wire16(reg5), .clk(clk));
  assign wire24 = wire22[(1'h0):(1'h0)];
  assign wire25 = $unsigned(wire1[(2'h3):(2'h3)]);
  assign wire26 = reg10;
  assign wire27 = (^wire1);
  assign wire28 = ((~^(($unsigned(reg4) <<< (~|wire6)) & ($unsigned(reg10) ~^ (^wire25)))) > {(!(+reg5)),
                      ($unsigned((wire27 ? wire2 : wire27)) ?
                          $signed($unsigned(reg9)) : (&$signed((8'ha7))))});
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = wire13[(4'ha):(2'h3)];
  assign wire18 = {$signed(wire14)};
  assign wire19 = (((($unsigned(wire17) ?
                              (^wire16) : wire15[(3'h5):(2'h3)]) >>> ($unsigned((7'h40)) ^ wire16[(3'h7):(1'h0)])) ?
                          wire16 : (((|wire15) ?
                                  (wire17 == wire14) : wire14[(1'h0):(1'h0)]) ?
                              (~^((8'hae) ?
                                  wire18 : wire17)) : {(wire18 >= wire13),
                                  wire17[(2'h3):(1'h0)]})) ?
                      wire18 : $unsigned($unsigned(({wire18} ?
                          wire13[(4'ha):(4'ha)] : (wire16 != (8'hbc))))));
  assign wire20 = wire15;
  assign wire21 = wire13[(3'h6):(3'h6)];
endmodule
