module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire64;
  assign y = {wire5, wire6, wire7, wire8, wire9, wire10, wire64, (1'h0)};
  assign wire5 = (wire2[(3'h7):(1'h0)] ?
                     ({(|(wire0 < (7'h40)))} ?
                         ($unsigned($signed(wire0)) ?
                             (&$signed(wire2)) : wire2[(2'h2):(1'h0)]) : ($signed((wire0 > wire2)) ?
                             {wire0,
                                 wire4[(2'h2):(2'h2)]} : $signed((wire2 ~^ (8'hbc))))) : ($unsigned($signed($unsigned(wire3))) ?
                         (~^($signed(wire1) == (wire2 ?
                             wire4 : wire2))) : wire1));
  assign wire6 = wire3[(3'h7):(2'h2)];
  assign wire7 = (((({wire5} ? $signed((8'ha7)) : (wire1 ? wire5 : wire0)) ?
                         wire6[(5'h11):(1'h1)] : ((wire6 ?
                             (8'hb2) : wire1) & {wire0,
                             wire2})) && wire6[(4'hc):(3'h4)]) ?
                     wire4[(2'h2):(1'h0)] : wire1[(1'h1):(1'h1)]);
  assign wire8 = wire4;
  assign wire9 = ((($unsigned($signed(wire3)) ?
                         (wire2 >= (!wire4)) : {wire7[(3'h6):(2'h2)],
                             (!wire8)}) || (wire5 ?
                         wire7[(3'h4):(1'h0)] : (|((8'hb4) ^ wire6)))) ?
                     (~($unsigned((wire3 ? (8'hbe) : wire8)) ?
                         {(+(8'ha6))} : {$signed(wire0),
                             (wire6 != wire4)})) : wire1[(1'h1):(1'h0)]);
  assign wire10 = $signed((wire1 ? (~^wire2) : {(wire3 >= $unsigned(wire5))}));
  module11 #() modinst65 (.clk(clk), .wire15(wire10), .wire16(wire8), .y(wire64), .wire12(wire7), .wire14(wire2), .wire13(wire5));
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire53;
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire53,
                 (1'h0)};
  assign wire17 = {(-$unsigned($signed(wire13[(5'h11):(1'h0)]))), wire14};
  assign wire18 = (~$signed($signed($signed($signed(wire16)))));
  assign wire19 = wire16;
  assign wire20 = wire17[(2'h3):(2'h2)];
  assign wire21 = (({wire19} ?
                      wire15[(4'ha):(2'h3)] : $signed($signed((wire13 ?
                          wire17 : (8'hab))))) >> $unsigned($unsigned($signed($unsigned((8'ha7))))));
  assign wire22 = wire18;
  assign wire23 = ($signed(wire16[(3'h5):(2'h2)]) <<< $signed({(-$unsigned(wire20)),
                      wire19[(4'h8):(4'h8)]}));
  assign wire24 = $unsigned((!wire23[(5'h14):(4'he)]));
  assign wire25 = (wire22[(2'h2):(1'h1)] ?
                      wire21 : (^(((wire23 || wire15) ?
                              {(8'h9d)} : $unsigned(wire16)) ?
                          $unsigned((^~wire20)) : ((8'hb6) <= (&wire14)))));
  module26 #() modinst54 (.wire27(wire22), .y(wire53), .wire29(wire21), .wire28(wire14), .clk(clk), .wire30(wire16), .wire31(wire24));
  assign wire55 = $unsigned(($unsigned($unsigned($signed(wire23))) ?
                      wire24[(5'h10):(1'h0)] : wire16));
  assign wire56 = wire24;
  assign wire57 = wire19;
  assign wire58 = ($unsigned(($signed($unsigned(wire19)) ?
                      ((^wire20) ?
                          wire15 : wire25[(1'h0):(1'h0)]) : (-wire25))) - (+wire25));
  assign wire59 = ({(($signed((8'ha9)) ?
                                  ((8'hb6) ?
                                      wire15 : wire18) : (wire56 == wire55)) ?
                              $unsigned($unsigned(wire12)) : ($signed(wire15) ?
                                  wire15 : {wire22}))} ?
                      (^({(~|wire53), (+wire16)} ?
                          $signed((wire12 >> wire23)) : (wire21[(3'h5):(1'h1)] ?
                              wire58 : (wire58 & wire56)))) : wire22[(2'h2):(1'h1)]);
  assign wire60 = {wire21, wire53};
  assign wire61 = $signed(({$signed((wire17 ? wire60 : wire23)),
                      $unsigned((8'ha2))} | wire18));
  assign wire62 = (($signed(((wire58 ? wire12 : (8'hb1)) ?
                      $unsigned(wire13) : {wire12,
                          wire53})) && $signed($signed(wire55[(2'h3):(2'h2)]))) ^~ (+($signed((7'h40)) ?
                      wire22 : {$unsigned(wire58), (~|(8'hbf))})));
  assign wire63 = ($unsigned(wire15[(3'h4):(1'h1)]) < wire56);
endmodule

module module26
#(parameter param51 = {(8'ha0)}, 
parameter param52 = ((7'h43) ? {{(~&param51)}} : (((((8'hbd) - param51) | (param51 <= param51)) - (^{param51, param51})) ? (((8'ha1) < (^~param51)) ^~ (^~(+param51))) : {param51})))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire [(5'h11):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire32 = ($unsigned((|((wire31 << wire31) << wire27))) >> (~&(~$signed((~wire31)))));
  assign wire33 = $signed($signed(((^(^wire31)) ?
                      ((wire27 ? wire28 : (8'hbb)) ^~ (^wire31)) : {(|wire28),
                          $unsigned((8'ha0))})));
  assign wire34 = {{($unsigned(wire33[(4'h9):(4'h8)]) <<< ((^wire30) | (wire30 ?
                              wire28 : (8'hbe))))},
                      $unsigned((+(^~$signed(wire33))))};
  assign wire35 = $unsigned(($unsigned($signed((~|(7'h40)))) ?
                      (~&(^~$signed((8'ha4)))) : wire28[(4'hd):(3'h6)]));
  assign wire36 = ((((wire32 ?
                          wire35 : (wire32 ?
                              wire32 : wire30)) - wire32) >= wire31[(4'h8):(1'h0)]) ?
                      wire27 : (8'ha0));
  assign wire37 = wire35[(3'h7):(3'h4)];
  assign wire38 = ($signed((~(((8'hbe) ? wire34 : wire29) << {(8'hb9),
                          wire27}))) ?
                      $unsigned((7'h42)) : (~wire37[(2'h3):(1'h1)]));
  assign wire39 = (&wire34[(1'h0):(1'h0)]);
  assign wire40 = $unsigned((((((8'ha9) ?
                      (8'hbf) : wire33) & wire38[(4'hc):(4'hb)]) ~^ $signed({(8'ha4),
                      (8'hbf)})) << (&wire37[(3'h6):(3'h4)])));
  assign wire41 = $unsigned($unsigned((-(+(!wire38)))));
  always
    @(posedge clk) begin
      reg42 <= (-(wire35[(1'h0):(1'h0)] > {wire38[(4'hb):(3'h5)],
          (~&((8'hbb) >> wire39))}));
      reg43 <= {{(wire28 ^~ (wire35[(3'h4):(2'h3)] ?
                  ((8'hb2) ^ wire32) : $unsigned(wire34)))},
          (^(+{$signed(wire39)}))};
      reg44 <= reg42[(1'h0):(1'h0)];
    end
  assign wire45 = wire34[(1'h1):(1'h0)];
  assign wire46 = $signed(wire38[(2'h3):(1'h0)]);
  assign wire47 = wire34[(1'h0):(1'h0)];
  assign wire48 = $signed((!(8'ha1)));
  assign wire49 = ((^$signed((~|wire48[(4'h8):(1'h0)]))) ? wire35 : {reg44});
  assign wire50 = wire46[(2'h2):(1'h1)];
endmodule
