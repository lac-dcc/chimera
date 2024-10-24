module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire42;
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire25,
                 wire27,
                 wire28,
                 wire42,
                 reg47,
                 (1'h0)};
  module5 #() modinst26 (wire25, clk, wire0, wire2, wire4, wire3, wire1);
  assign wire27 = wire2[(3'h6):(1'h1)];
  assign wire28 = (wire0[(4'h9):(1'h0)] > wire27[(5'h10):(4'he)]);
  module29 #() modinst43 (wire42, clk, wire4, wire0, wire3, wire2, wire25);
  assign wire44 = {(!(!({wire28} & (wire0 ? (8'hb0) : wire28)))),
                      $signed(wire42)};
  assign wire45 = wire28[(1'h1):(1'h1)];
  assign wire46 = ({(wire45[(4'h9):(3'h6)] ?
                          {$unsigned((8'h9d))} : $signed((wire3 ?
                              wire3 : wire2)))} < wire0);
  always
    @(posedge clk) begin
      reg47 <= wire2[(4'hc):(1'h1)];
    end
endmodule

module module29  (y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire [(5'h11):(1'h0)] wire33;
  input wire [(2'h3):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  assign y = {wire41, wire40, wire39, wire38, wire37, wire36, wire35, (1'h0)};
  assign wire35 = $unsigned($unsigned(((!wire34) ^~ $signed($signed(wire33)))));
  assign wire36 = (wire35[(1'h0):(1'h0)] <= $signed((($unsigned(wire33) + wire35[(4'ha):(4'h8)]) ?
                      $signed(wire31) : (8'hbe))));
  assign wire37 = $unsigned($unsigned(wire34));
  assign wire38 = $unsigned(($signed((wire30[(3'h6):(3'h5)] >> wire35[(3'h7):(3'h6)])) ?
                      wire32 : (^~({(8'h9d), wire34} ^~ ((8'hae) ?
                          wire35 : wire31)))));
  assign wire39 = wire35[(3'h4):(1'h1)];
  assign wire40 = wire36;
  assign wire41 = {$signed((({(8'ha3)} <= wire39[(5'h10):(3'h5)]) && $signed(wire34[(2'h2):(1'h0)]))),
                      $unsigned(((~&{wire33, wire34}) ?
                          ((8'ha6) ? (-wire35) : $signed(wire39)) : ((wire33 ?
                                  wire40 : wire35) ?
                              (wire34 ?
                                  wire31 : wire35) : (wire40 < wire38))))};
endmodule

module module5
#(parameter param23 = (+({(((8'hb6) > (8'ha7)) <<< (^(8'h9d)))} == ((((8'ha8) ? (8'hac) : (8'hb2)) * ((8'hb2) && (8'ha3))) ? {(~^(8'hb4)), ((8'ha2) & (8'had))} : (!(^~(8'hbf)))))), 
parameter param24 = param23)
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 (1'h0)};
  assign wire11 = $unsigned(((~&wire8) ?
                      $unsigned(((wire9 ? wire8 : wire9) ?
                          (wire10 == wire10) : wire10[(1'h0):(1'h0)])) : (!{wire9[(3'h6):(1'h1)]})));
  assign wire12 = wire9[(4'hb):(4'hb)];
  assign wire13 = {($signed(((wire6 == wire10) > {wire6, (8'ha6)})) ?
                          wire7[(4'ha):(3'h6)] : ($signed(wire9) ?
                              {(wire7 ? wire9 : (7'h43)),
                                  wire9[(3'h4):(2'h2)]} : $signed((wire9 ?
                                  wire8 : wire9))))};
  assign wire14 = wire10;
  assign wire15 = $signed(((&{$unsigned(wire13),
                      $signed(wire11)}) <<< ((|$unsigned(wire10)) <<< {wire10})));
  assign wire16 = (wire13 > ($signed($unsigned($signed(wire7))) != (+wire9)));
  assign wire17 = wire7;
  assign wire18 = (~^($unsigned(((wire17 ?
                      wire9 : (8'ha9)) | ((8'hac) != wire13))) - (!({(8'hbf)} >= (wire15 >>> wire6)))));
  assign wire19 = ((~^wire13[(3'h7):(2'h3)]) || $unsigned({wire6,
                      ((&wire18) * wire9[(4'hc):(3'h4)])}));
  assign wire20 = $unsigned(wire13[(3'h5):(1'h1)]);
  assign wire21 = {($signed($unsigned($signed(wire15))) | $unsigned($unsigned(wire13))),
                      $signed($unsigned({{(8'hbd)}}))};
  assign wire22 = (8'ha0);
endmodule
