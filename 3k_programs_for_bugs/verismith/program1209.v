module top
#(parameter param70 = ((-{({(8'ha8), (8'hac)} >>> ((8'ha2) ? (8'hac) : (8'hb0))), (~|(&(8'hab)))}) | {(+(^((8'h9c) ? (8'hae) : (8'hb6))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  assign y = {wire69, wire68, wire66, wire6, wire5, (1'h0)};
  assign wire5 = {((7'h43) ? wire0[(5'h15):(4'he)] : wire3[(4'he):(4'ha)])};
  assign wire6 = wire2[(1'h0):(1'h0)];
  module7 #() modinst67 (.wire10(wire2), .clk(clk), .wire9(wire3), .wire11(wire0), .wire8(wire5), .y(wire66));
  assign wire68 = wire0;
  assign wire69 = $signed(wire2);
endmodule

module module7
#(parameter param64 = ((~|((^~((7'h43) + (8'hb7))) ? {(^(8'ha9)), (+(8'hbf))} : (~((8'hab) || (8'hae))))) * {(+(((8'hbc) ? (8'ha5) : (8'ha6)) ~^ (!(8'ha7)))), ((8'ha8) ? (((8'hb6) ? (8'hb0) : (8'h9f)) ? ((8'hb6) * (8'ha2)) : ((7'h42) ? (8'hbf) : (8'haa))) : ((~(8'hbb)) ? ((8'hb1) >> (8'ha4)) : ((8'hb5) <<< (8'ha2))))}), 
parameter param65 = ({(+(+(^(8'hb0)))), (^~(param64 != (param64 ? (8'hb5) : param64)))} ? ({((param64 ? param64 : param64) ~^ (param64 <<< (8'hb2)))} ? ((+(param64 ? param64 : param64)) < ((8'ha4) == (param64 ? (7'h40) : (8'hb2)))) : (~&(param64 != (~&param64)))) : (((param64 + (param64 ? (8'hb3) : (8'ha9))) + (param64 ? {(8'hbf)} : param64)) ? {((param64 != param64) & (~^param64))} : (~&((~param64) <<< param64)))))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire59;
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire35,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire59,
                 (1'h0)};
  assign wire12 = wire8;
  assign wire13 = ((~^$unsigned({wire12[(2'h3):(2'h3)]})) ?
                      (wire11[(1'h1):(1'h0)] ?
                          (wire8 + {wire8[(1'h0):(1'h0)]}) : ({(^wire9),
                                  $unsigned(wire11)} ?
                              ($unsigned(wire12) ?
                                  {wire11} : (wire8 ?
                                      wire12 : wire8)) : wire12[(1'h1):(1'h0)])) : {wire8[(2'h2):(2'h2)],
                          (|(&$signed(wire11)))});
  assign wire14 = (~(8'h9f));
  assign wire15 = $signed((7'h42));
  assign wire16 = wire15[(4'h8):(2'h3)];
  assign wire17 = wire9[(3'h7):(2'h3)];
  module18 #() modinst36 (.y(wire35), .wire19(wire15), .wire22(wire11), .wire21(wire8), .wire20(wire10), .clk(clk));
  assign wire37 = $signed(($unsigned(wire12[(3'h4):(3'h4)]) ?
                      wire8[(3'h4):(2'h2)] : wire16[(4'hf):(4'h8)]));
  assign wire38 = ((8'hbd) >>> (-(~&{wire10})));
  assign wire39 = (~^$signed((($unsigned(wire8) ^~ (wire12 >>> wire14)) - $unsigned((wire37 ?
                      wire38 : wire8)))));
  assign wire40 = (^($signed(wire10) ?
                      {((wire39 ?
                              wire8 : wire13) ^ (8'ha1))} : (^(^wire14[(3'h4):(2'h3)]))));
  assign wire41 = wire13[(1'h0):(1'h0)];
  module42 #() modinst60 (wire59, clk, wire39, wire10, wire12, wire13, wire15);
  assign wire61 = wire8;
  assign wire62 = (wire14 << $unsigned((7'h40)));
  assign wire63 = $signed(wire39);
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(5'h10):(1'h0)] wire45;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire signed [(3'h4):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 (1'h0)};
  assign wire48 = ((~$unsigned(((-wire45) <<< wire47[(3'h7):(2'h3)]))) ?
                      (~$signed(($unsigned(wire44) > (wire46 ~^ wire43)))) : ($unsigned((wire44[(1'h0):(1'h0)] ?
                              wire45 : (wire43 ? (7'h41) : (8'hb8)))) ?
                          wire47[(3'h6):(2'h3)] : ($unsigned($signed(wire43)) * (+(wire46 ?
                              wire43 : (8'ha2))))));
  assign wire49 = wire45[(4'h8):(1'h0)];
  assign wire50 = (wire47 <= (-(~|(wire43 ?
                      ((8'hab) ^~ wire48) : $unsigned(wire47)))));
  assign wire51 = (~&($signed($signed((~^(8'ha2)))) ?
                      $signed($signed((wire43 ^ wire45))) : $unsigned($signed((wire43 <<< (8'hb7))))));
  assign wire52 = ($signed({(^(wire50 * wire46)), wire51}) + $unsigned(wire43));
  assign wire53 = (($signed({$unsigned((8'h9f)), (wire43 ? wire48 : (8'ha2))}) ?
                          $unsigned(wire43) : $unsigned((^(wire48 == wire45)))) ?
                      wire43[(1'h1):(1'h0)] : wire46[(3'h5):(2'h2)]);
  assign wire54 = ((&$unsigned($unsigned((wire53 ? wire48 : wire51)))) ?
                      {$unsigned((wire43[(2'h2):(2'h2)] ?
                              $signed(wire44) : (8'h9d))),
                          (!wire49)} : wire46);
  assign wire55 = $unsigned(wire50);
  assign wire56 = {(+(($signed(wire55) ?
                          wire44 : $signed(wire44)) + $signed($signed(wire54)))),
                      $unsigned((8'hab))};
  assign wire57 = wire49;
  assign wire58 = $unsigned(wire53);
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire22;
  input wire [(3'h5):(1'h0)] wire21;
  input wire [(5'h11):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = $unsigned(wire19[(4'h8):(3'h4)]);
  assign wire24 = wire20;
  assign wire25 = (~^(wire19 ?
                      (((8'hbb) ^ $signed(wire20)) ?
                          {(wire23 ?
                                  wire20 : wire20)} : $signed($unsigned(wire19))) : ($unsigned($unsigned(wire23)) ?
                          wire22[(4'hd):(1'h1)] : wire21)));
  assign wire26 = ($unsigned((wire22 <= wire25[(1'h0):(1'h0)])) ?
                      wire25[(2'h2):(2'h2)] : ((&$signed((^~wire20))) ?
                          (wire20 >= (&wire24)) : (^(wire19 ?
                              ((8'ha4) && wire25) : wire19[(1'h0):(1'h0)]))));
  assign wire27 = wire20[(4'hd):(3'h7)];
  assign wire28 = $signed({((((8'hb8) ? wire20 : wire24) ?
                          (wire21 >= wire19) : $signed((8'ha6))) < ((wire21 ?
                          (8'hb4) : (8'ha1)) ^ $unsigned(wire22))),
                      (wire19[(2'h2):(1'h0)] ?
                          $unsigned((~&wire26)) : {(wire20 ?
                                  wire20 : (8'ha2))})});
  assign wire29 = wire27;
  assign wire30 = wire20;
  assign wire31 = wire28;
  assign wire32 = $unsigned({(|((wire21 != wire28) & $signed(wire21)))});
  assign wire33 = ((~(8'ha2)) || wire28[(4'hf):(4'hb)]);
  assign wire34 = $unsigned($unsigned($signed((wire21[(2'h2):(2'h2)] ?
                      wire23[(4'h9):(2'h2)] : ((8'hb2) ? wire32 : wire30)))));
endmodule
