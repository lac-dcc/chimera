module top
#(parameter param61 = (8'hb2))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire55;
  assign y = {wire60, wire59, wire58, wire57, wire5, wire6, wire55, (1'h0)};
  assign wire5 = (&((wire4 ?
                         (8'hab) : (wire2[(4'ha):(2'h3)] <= $signed((8'hb4)))) ?
                     {(+((8'ha9) ? wire4 : wire2)),
                         $unsigned(wire0)} : ({(wire0 < wire1), wire4} ?
                         $unsigned({wire1}) : wire3[(3'h7):(3'h7)])));
  assign wire6 = wire2[(3'h4):(2'h3)];
  module7 #() modinst56 (wire55, clk, wire1, wire5, wire0, wire2, wire6);
  assign wire57 = ({((wire6 - wire55[(3'h6):(3'h5)]) > (8'ha9)),
                      (wire2[(4'hf):(3'h6)] <= ((wire1 < wire6) << wire0[(2'h3):(1'h0)]))} == (^~($unsigned((~|wire5)) == (8'hab))));
  assign wire58 = {$signed((wire4[(3'h7):(1'h1)] >>> {$signed(wire57),
                          (wire3 != wire57)})),
                      (!$signed(wire3[(2'h2):(1'h0)]))};
  assign wire59 = ((~|($unsigned((wire1 > wire3)) == wire55)) ?
                      $unsigned((~&wire57[(2'h3):(2'h2)])) : $unsigned(wire5[(4'h9):(3'h6)]));
  assign wire60 = wire2;
endmodule

module module7
#(parameter param53 = {(+(-((8'h9e) <= ((8'hb1) ? (7'h44) : (7'h40)))))}, 
parameter param54 = (&(&(param53 ? {{param53}} : ((param53 & (8'hb1)) >> (param53 ? (8'ha8) : param53))))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire40;
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  module13 #() modinst41 (.wire16(wire12), .wire17(wire10), .wire18(wire9), .clk(clk), .y(wire40), .wire15(wire11), .wire14(wire8));
  assign wire42 = wire8;
  assign wire43 = ((wire11[(3'h6):(3'h6)] ?
                      (wire10 ?
                          wire40 : ($signed(wire42) >= wire40)) : ((wire10 ?
                          wire9[(2'h3):(1'h0)] : wire9) <<< wire9[(1'h0):(1'h0)])) << wire9);
  assign wire44 = $unsigned({$signed(((wire40 ^~ wire11) ?
                          wire8[(4'h9):(3'h7)] : wire9)),
                      ((^wire12) && ($unsigned((8'hbe)) ?
                          wire12 : $signed(wire42)))});
  assign wire45 = ({(~&wire10[(3'h7):(1'h1)]),
                      wire10[(1'h1):(1'h1)]} || $signed((wire11 && (&wire11))));
  always
    @(posedge clk) begin
      reg46 <= wire43[(4'hb):(3'h4)];
      if ($signed(wire9[(4'hf):(3'h7)]))
        begin
          reg47 <= {{((wire9[(4'h9):(3'h6)] | (wire11 ?
                      wire12 : reg46)) | ($signed(wire44) ?
                      wire9 : wire40[(1'h0):(1'h0)]))},
              $signed({wire44[(1'h0):(1'h0)], $unsigned($signed(wire43))})};
          reg48 <= wire45;
          reg49 <= wire12;
          reg50 <= ((($signed(reg46[(2'h2):(2'h2)]) >= wire12[(1'h0):(1'h0)]) ?
              (~&wire9) : wire45) ^ ((reg46[(2'h3):(1'h0)] ?
                  (reg47 | $signed(wire8)) : $unsigned($signed(wire8))) ?
              (^(^~((8'hba) ? wire43 : reg47))) : (-{wire8[(1'h0):(1'h0)]})));
        end
      else
        begin
          reg47 <= $unsigned($signed(wire45[(4'hc):(2'h3)]));
          reg48 <= $signed(((~^(wire40 ?
                  wire8[(3'h7):(3'h4)] : $unsigned(wire43))) ?
              ((8'hbd) ~^ wire45[(4'hd):(2'h3)]) : (reg49[(2'h2):(1'h1)] < $signed($signed(wire10)))));
        end
    end
  assign wire51 = ((wire43[(5'h13):(1'h1)] ?
                      reg48[(2'h2):(1'h1)] : $unsigned(((8'ha3) ?
                          (8'hab) : $unsigned((7'h40))))) * (+{($signed(wire10) << reg50),
                      wire10}));
  assign wire52 = (8'hb7);
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  assign y = {wire39,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire21,
                 wire20,
                 wire19,
                 reg38,
                 reg37,
                 reg36,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = (~|$unsigned(wire17));
  assign wire20 = ($unsigned(wire15[(3'h4):(2'h3)]) >> wire14[(4'h9):(1'h0)]);
  assign wire21 = $unsigned($unsigned(wire19));
  always
    @(posedge clk) begin
      reg22 <= ($unsigned(($signed((+wire15)) >= (8'hb2))) == $unsigned($signed($unsigned((wire18 + wire14)))));
      reg23 <= wire18;
      reg24 <= wire15[(3'h7):(3'h7)];
      reg25 <= (8'ha3);
    end
  assign wire26 = (8'h9c);
  assign wire27 = (8'hb4);
  assign wire28 = wire20;
  assign wire29 = ((wire20[(4'ha):(4'ha)] ?
                      {((-wire18) ?
                              reg24[(4'hc):(1'h0)] : ((8'h9d) ?
                                  wire21 : wire14)),
                          (((8'h9e) < reg24) ?
                              (+reg25) : wire16[(4'he):(1'h0)])} : (^wire14[(2'h2):(1'h1)])) != wire28[(2'h2):(1'h1)]);
  assign wire30 = (8'h9c);
  assign wire31 = wire15;
  assign wire32 = $signed(wire16[(4'hf):(2'h3)]);
  assign wire33 = (wire28 != ($unsigned((^$unsigned(wire32))) ^~ ((+reg22[(4'hb):(3'h7)]) >> ((wire30 ?
                      wire28 : wire32) || wire26))));
  assign wire34 = $signed(($signed($unsigned(wire31)) ?
                      (-((+reg23) && (+reg23))) : (wire32[(2'h3):(1'h1)] ?
                          ((wire19 ?
                              wire21 : reg25) - (8'h9c)) : $signed((wire33 * wire33)))));
  assign wire35 = (|((&$unsigned($signed(wire31))) >= reg22[(3'h5):(1'h0)]));
  always
    @(posedge clk) begin
      reg36 <= $signed({reg25,
          (wire30[(1'h0):(1'h0)] ?
              (wire31[(2'h2):(2'h2)] ^~ {wire28, wire31}) : $signed(wire16))});
      reg37 <= $signed((^(^~((+wire18) * reg23[(1'h1):(1'h1)]))));
      reg38 <= wire34[(3'h7):(3'h6)];
    end
  assign wire39 = $unsigned(reg38[(3'h5):(1'h0)]);
endmodule
