module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire44, wire43, wire42, wire40, wire6, wire5, (1'h0)};
  assign wire5 = (7'h42);
  assign wire6 = wire0[(3'h6):(2'h2)];
  module7 #() modinst41 (wire40, clk, wire4, wire6, wire0, wire3);
  assign wire42 = (~&wire1);
  assign wire43 = wire4;
  assign wire44 = wire6;
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  assign y = {wire39, wire37, wire14, wire13, wire12, (1'h0)};
  assign wire12 = ({($unsigned($signed(wire8)) <= ($unsigned(wire9) ?
                          $unsigned((8'h9f)) : {(8'ha5),
                              (7'h43)}))} | $unsigned((^~wire9)));
  assign wire13 = wire12;
  assign wire14 = wire11[(2'h3):(1'h1)];
  module15 #() modinst38 (.wire16(wire11), .clk(clk), .wire18(wire10), .wire17(wire14), .wire19(wire9), .y(wire37));
  assign wire39 = ((wire14[(4'h8):(4'h8)] - $signed($signed((wire8 == wire14)))) ^ ((&((~&wire14) ?
                      wire9 : $signed(wire10))) ^ (wire10[(4'hd):(1'h0)] ^~ wire37)));
endmodule

module module15
#(parameter param36 = {(!({{(8'ha1)}} ? ((~(8'hbf)) ? ((8'hb2) != (8'hbb)) : ((7'h43) ? (8'haa) : (7'h42))) : (((8'hb9) ^~ (8'ha3)) > (~&(8'hb1))))), ({(((8'hb9) - (7'h42)) ? (~|(8'h9e)) : {(8'hac)}), ((8'ha5) ? (~&(8'hbd)) : ((8'h9f) & (8'ha7)))} || ((((8'hb0) ? (8'hb9) : (8'hbc)) ^ (~(8'hb8))) ? (!((8'hbc) - (8'ha9))) : (((8'hb0) && (8'hb1)) < {(8'ha6), (8'hac)})))})
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire27,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 (1'h0)};
  assign wire20 = (wire19 ? wire16[(3'h7):(1'h0)] : (-wire17));
  assign wire21 = (~^{$signed(wire20[(4'hf):(1'h0)]),
                      (($unsigned(wire18) ?
                          $unsigned(wire19) : $signed(wire17)) & (&(wire19 ~^ wire18)))});
  assign wire22 = wire17[(3'h5):(1'h0)];
  assign wire23 = wire16[(4'h9):(3'h4)];
  assign wire24 = $unsigned($unsigned((((8'ha8) <= $unsigned(wire23)) == $signed($signed((8'hb2))))));
  assign wire25 = ((|$unsigned(wire19[(4'hb):(1'h0)])) != wire19);
  always
    @(posedge clk) begin
      reg26 <= $unsigned((+(~$signed((wire17 ? wire22 : (8'h9c))))));
    end
  assign wire27 = {$unsigned($signed(wire24[(1'h1):(1'h0)])),
                      $signed(($unsigned((^~wire20)) ^~ (~|$signed(wire16))))};
  always
    @(posedge clk) begin
      reg28 <= wire24;
      reg29 <= reg26[(4'ha):(3'h4)];
      reg30 <= (reg28 + ((^reg28) <<< {($unsigned(reg29) >= $signed(wire21))}));
      reg31 <= (-(wire25 ?
          (reg26[(4'hc):(1'h1)] >>> wire19) : {(reg30[(2'h3):(2'h2)] ?
                  {(8'hb1)} : (reg26 ? wire25 : wire23))}));
      reg32 <= $unsigned((|{(~^wire25), wire21}));
    end
  assign wire33 = (|($signed($signed((wire24 - (8'hb5)))) ?
                      (-$unsigned(((8'hb8) ?
                          wire24 : wire23))) : (&(|wire25[(4'he):(4'he)]))));
  assign wire34 = $signed({wire24[(3'h7):(3'h7)],
                      (^({reg28, wire33} >= $unsigned(wire21)))});
  assign wire35 = reg31[(3'h5):(3'h4)];
endmodule
