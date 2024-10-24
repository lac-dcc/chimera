module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire59;
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire27,
                 wire59,
                 (1'h0)};
  module5 #() modinst28 (wire27, clk, wire1, wire0, wire4, wire2, wire3);
  module29 #() modinst60 (wire59, clk, wire2, wire4, wire3, wire0, wire1);
  assign wire61 = (((((wire0 != (8'hb0)) ?
                              $unsigned(wire59) : (wire27 - wire3)) ?
                          $unsigned((&(8'h9c))) : (wire0 ?
                              (&wire2) : $signed(wire2))) <<< wire2) ?
                      {(wire2 ?
                              (^wire59[(5'h13):(4'ha)]) : wire27[(4'hb):(3'h4)])} : wire27);
  assign wire62 = ((~^(((wire4 || wire59) ? (^~wire27) : $signed(wire4)) ?
                      (~$unsigned(wire2)) : (8'hbd))) || (|$signed(((wire1 != wire0) ?
                      (wire2 != wire61) : $signed(wire27)))));
  assign wire63 = ((^$signed(((wire62 ? wire59 : (8'hbf)) >>> wire59))) ?
                      wire3[(4'hc):(3'h5)] : wire4);
  assign wire64 = $unsigned(wire61[(4'he):(4'ha)]);
  assign wire65 = $unsigned($signed({wire64[(1'h1):(1'h1)],
                      $unsigned($signed(wire61))}));
  assign wire66 = wire63;
endmodule

module module29
#(parameter param58 = ((8'ha5) + (8'hb6)))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire34;
  input wire [(5'h10):(1'h0)] wire33;
  input wire [(3'h6):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire52;
  assign y = {wire57, wire56, wire55, wire54, wire52, (1'h0)};
  module35 #() modinst53 (.clk(clk), .wire39(wire30), .y(wire52), .wire37(wire33), .wire38(wire31), .wire36(wire32));
  assign wire54 = $signed({$signed((^~(wire52 & wire52))),
                      (wire30[(5'h10):(5'h10)] ^~ (~(wire31 > (8'hab))))});
  assign wire55 = $unsigned({((wire33[(2'h2):(2'h2)] ?
                          wire31[(4'ha):(4'h9)] : (wire52 | wire52)) ^~ wire34[(3'h7):(1'h1)])});
  assign wire56 = $signed((~^wire52));
  assign wire57 = ($unsigned((~|$signed($signed(wire31)))) ?
                      wire55[(2'h3):(1'h1)] : (8'hb8));
endmodule

module module5
#(parameter param25 = (8'hb3), 
parameter param26 = (|((({param25, param25} >= (param25 ? param25 : (8'hbc))) ? {(~param25), (-(8'ha7))} : (8'hbf)) <= {(+param25), param25})))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire11;
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire11,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = wire10[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= wire9[(3'h7):(1'h1)];
      reg13 <= wire10[(4'hd):(4'hc)];
      reg14 <= $signed(((($unsigned(reg13) ?
          $unsigned(wire8) : (wire9 <= reg13)) * (wire10[(3'h6):(3'h4)] << (wire9 ?
          wire11 : wire7))) < ($signed((&(7'h41))) ^~ {$unsigned(wire9)})));
      reg15 <= wire8;
      reg16 <= ($signed((8'hbe)) ?
          {$unsigned((8'hb8)),
              ($signed((8'ha6)) ~^ ($signed((7'h40)) ?
                  $unsigned(wire8) : ((8'ha3) ?
                      reg13 : wire9)))} : (^~{($signed(wire11) ?
                  reg15[(2'h2):(1'h1)] : reg14)}));
    end
  assign wire17 = $signed(reg15[(5'h10):(3'h4)]);
  assign wire18 = reg16;
  assign wire19 = (~&reg16);
  assign wire20 = (wire19 >= ((wire18 << wire9[(3'h5):(2'h3)]) ~^ (((~&(8'ha6)) <<< {reg15}) <= (^~$signed(wire10)))));
  assign wire21 = reg14[(4'hc):(2'h3)];
  assign wire22 = ($signed(($unsigned($unsigned(wire20)) - ($unsigned(wire17) * (8'ha2)))) ^ ({$unsigned((~&(8'hb7))),
                      reg13[(3'h5):(1'h1)]} != $signed(wire7[(3'h7):(1'h0)])));
  assign wire23 = (((+$unsigned({(8'h9d), wire9})) << (wire10 ?
                          wire9[(3'h5):(2'h2)] : {(^~wire19),
                              (wire22 ? wire8 : wire19)})) ?
                      $unsigned(((^(reg12 ^ reg14)) != $signed(wire11))) : (~^(reg13 != $unsigned((wire10 <<< reg16)))));
  assign wire24 = {wire9[(4'h9):(3'h4)],
                      ((~|reg14) ? $signed($signed((~|wire19))) : wire9)};
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire39;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  input wire [(3'h4):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 (1'h0)};
  assign wire40 = {$signed($unsigned(wire39)),
                      $unsigned((wire39[(4'h8):(3'h6)] ?
                          (wire38 ? (+wire37) : (8'hb5)) : ((~^wire37) ?
                              $unsigned(wire36) : $signed(wire37))))};
  assign wire41 = $unsigned($unsigned(wire38));
  assign wire42 = {({($unsigned(wire39) || $unsigned(wire37)),
                              (&$unsigned((8'ha2)))} ?
                          $signed(wire37[(4'ha):(4'ha)]) : $unsigned($signed((+wire41))))};
  assign wire43 = {wire40[(3'h7):(3'h4)], (!(+(8'ha2)))};
  assign wire44 = wire43;
  assign wire45 = wire44[(4'hb):(3'h7)];
  assign wire46 = (~&$signed(wire38[(2'h2):(2'h2)]));
  assign wire47 = wire38[(4'hd):(3'h4)];
  assign wire48 = $unsigned($signed((~^wire40)));
  assign wire49 = (-wire40);
  assign wire50 = wire36[(3'h4):(3'h4)];
  assign wire51 = $signed(wire47);
endmodule
