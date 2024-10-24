module top
#(parameter param37 = (~|((~|(^(^~(7'h41)))) >= (|(((8'hb1) ? (8'ha7) : (8'hab)) ? (+(8'ha4)) : ((8'h9f) != (8'ha9)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire36, wire35, wire33, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed($unsigned($unsigned($unsigned({wire4}))));
  assign wire6 = wire1[(4'h8):(2'h3)];
  assign wire7 = wire1;
  assign wire8 = $signed(wire0);
  module9 #() modinst34 (wire33, clk, wire5, wire0, wire6, wire7);
  assign wire35 = $signed(wire3);
  assign wire36 = wire0[(4'hc):(1'h0)];
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 wire14,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 (1'h0)};
  assign wire14 = ((^~(wire10[(4'hb):(3'h7)] ?
                      (~{wire10,
                          wire10}) : $unsigned(((8'ha4) != wire10)))) || {(|$unsigned($unsigned(wire11)))});
  assign wire15 = (|wire13[(1'h0):(1'h0)]);
  assign wire16 = wire13;
  always
    @(posedge clk) begin
      reg17 <= $signed((8'hb4));
    end
  assign wire18 = wire11[(3'h7):(1'h1)];
  assign wire19 = (wire16[(4'h9):(3'h6)] >= {{$unsigned(wire15[(4'he):(4'hb)]),
                          wire15[(3'h5):(2'h2)]}});
  always
    @(posedge clk) begin
      if ((wire10 + wire12))
        begin
          reg20 <= wire13;
          reg21 <= wire12;
        end
      else
        begin
          reg20 <= $unsigned((~&wire15));
          reg21 <= (^~wire12);
          reg22 <= wire12;
          reg23 <= ($signed(($signed((&wire19)) ?
              wire13[(4'hb):(3'h5)] : ((wire14 ? reg22 : wire13) ?
                  wire18[(3'h5):(3'h4)] : {wire18}))) & (8'ha8));
          reg24 <= (~{$unsigned((^$unsigned(wire16)))});
        end
      reg25 <= $unsigned(reg22);
    end
  assign wire26 = ((|(!$signed($unsigned(reg23)))) >= reg24[(2'h2):(1'h0)]);
  assign wire27 = {(wire12[(4'h8):(3'h6)] & (wire11[(1'h0):(1'h0)] ?
                          reg24 : ((wire10 & reg24) ? wire14 : (~reg23)))),
                      ((8'hae) * wire16)};
  assign wire28 = ({(~&((wire16 - (8'ha4)) >> {wire14}))} ?
                      (^~{(~(|reg20)),
                          wire19[(3'h5):(1'h1)]}) : wire18[(3'h6):(3'h5)]);
  assign wire29 = {{reg22[(3'h5):(3'h4)]}};
  assign wire30 = reg17[(1'h1):(1'h1)];
  assign wire31 = $unsigned((~reg20[(2'h2):(2'h2)]));
  assign wire32 = $signed(reg24[(3'h5):(2'h2)]);
endmodule
