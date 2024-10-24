module top
#(parameter param96 = ((!(~(((8'ha0) <<< (8'h9d)) ? ((8'hbd) ? (7'h43) : (7'h44)) : ((8'ha6) ? (8'hb5) : (8'hae))))) ? ((+(((8'hb7) | (8'hb9)) | ((8'ha5) && (8'hae)))) ~^ ({((8'hb9) ? (8'h9d) : (8'hae)), ((8'ha1) ? (8'hb6) : (8'ha0))} ? {{(8'hbe)}} : (^~{(8'hba)}))) : (8'hbf)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire89;
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire75,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire41,
                 wire89,
                 (1'h0)};
  assign wire5 = (-(~&{($signed(wire1) | wire3[(1'h1):(1'h1)]),
                     ((wire1 ? wire3 : wire1) | (~|(7'h42)))}));
  assign wire6 = {$signed(wire3)};
  assign wire7 = $unsigned(wire0[(1'h1):(1'h0)]);
  assign wire8 = $unsigned($unsigned(((wire3 ? $unsigned(wire5) : (^~wire2)) ?
                     $unsigned((wire4 + wire0)) : (~&(wire4 ?
                         wire5 : wire3)))));
  assign wire9 = {(^{wire5[(4'h9):(1'h1)], $signed($unsigned(wire3))})};
  module10 #() modinst42 (.wire15(wire3), .y(wire41), .wire13(wire0), .clk(clk), .wire11(wire8), .wire14(wire9), .wire12(wire2));
  assign wire43 = (($signed(((!(8'hb7)) ? (~|wire9) : (~&wire9))) ?
                          wire3 : $signed(((~wire7) >= wire6))) ?
                      {(((wire3 << (8'ha3)) >= (wire5 >> (8'h9c))) <<< wire9)} : wire8[(3'h7):(3'h4)]);
  assign wire44 = $signed(wire7);
  assign wire45 = $signed(({({wire4} ?
                          wire3[(3'h5):(2'h2)] : (wire5 << (8'haa)))} + $signed((+(wire0 ?
                      wire41 : wire44)))));
  assign wire46 = $signed(($unsigned((8'ha2)) ?
                      (((~wire8) >> {(8'hb1)}) || {wire0, wire41}) : wire44));
  assign wire47 = $unsigned($signed(($signed((+wire1)) >>> (7'h44))));
  module48 #() modinst76 (wire75, clk, wire46, wire47, wire45, wire9, wire0);
  module77 #() modinst90 (.clk(clk), .wire79(wire46), .wire82(wire6), .wire78(wire5), .wire80(wire44), .y(wire89), .wire81(wire1));
  assign wire91 = ({wire0} ?
                      wire3 : $signed(((!(wire3 || wire4)) & $signed((wire4 ?
                          wire43 : (8'ha5))))));
  assign wire92 = wire6;
  assign wire93 = (({wire3[(3'h5):(3'h5)]} ?
                          $unsigned(((wire45 ^ (8'ha4)) ?
                              wire43[(1'h1):(1'h1)] : (wire9 & wire44))) : $signed($unsigned(wire47[(3'h4):(1'h0)]))) ?
                      (7'h40) : {wire41[(5'h12):(4'h9)], wire41});
  assign wire94 = ($signed($unsigned($signed({wire93}))) <<< (!wire9));
  assign wire95 = {$unsigned(wire8[(4'ha):(4'h9)]),
                      (~&($unsigned(((8'hb9) ?
                          wire94 : wire7)) != (&$signed(wire47))))};
endmodule

module module77  (y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire82;
  input wire signed [(4'hd):(1'h0)] wire81;
  input wire signed [(4'hf):(1'h0)] wire80;
  input wire signed [(5'h11):(1'h0)] wire79;
  input wire [(4'h9):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire83;
  assign y = {wire88, wire87, wire86, wire85, wire84, wire83, (1'h0)};
  assign wire83 = wire79;
  assign wire84 = $unsigned({wire82[(4'h8):(1'h0)],
                      $signed(wire81[(3'h5):(3'h4)])});
  assign wire85 = wire80[(4'hc):(2'h2)];
  assign wire86 = $unsigned((($signed($signed(wire81)) ?
                      (wire85 ?
                          (wire80 ?
                              wire84 : wire81) : (^~wire84)) : $unsigned({wire78,
                          wire84})) | wire85[(3'h6):(2'h2)]));
  assign wire87 = $unsigned(wire86);
  assign wire88 = wire87[(1'h0):(1'h0)];
endmodule

module module48
#(parameter param74 = ((8'ha8) ^~ ((~&(((8'hbc) ? (7'h43) : (8'haf)) ~^ (~(8'ha6)))) ? ((+(~&(7'h41))) && (((7'h41) ? (8'ha6) : (8'hb6)) ^~ ((8'hbf) * (8'ha0)))) : (^(^~(~&(8'ha8)))))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire53;
  input wire [(2'h3):(1'h0)] wire52;
  input wire [(4'h9):(1'h0)] wire51;
  input wire [(5'h10):(1'h0)] wire50;
  input wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire67,
                 wire66,
                 wire65,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire54 = (~|wire53);
  assign wire55 = $signed(wire49[(3'h6):(3'h6)]);
  assign wire56 = $unsigned(wire55);
  assign wire57 = ($signed(wire49) < (((wire52[(2'h2):(1'h1)] <= $unsigned(wire53)) ?
                      $unsigned($unsigned((8'hac))) : $signed(wire51[(1'h0):(1'h0)])) * wire49));
  assign wire58 = wire51[(3'h4):(2'h2)];
  assign wire59 = (wire51 ~^ $signed($unsigned(wire54)));
  assign wire60 = ($signed(wire59) ?
                      $signed($signed($unsigned(wire49[(2'h3):(2'h3)]))) : (((-(^wire53)) <<< (8'ha7)) << (wire50 * $unsigned(wire51[(2'h3):(2'h3)]))));
  assign wire61 = {$unsigned(((^(wire59 << wire58)) == (~$unsigned(wire54)))),
                      wire56[(4'hb):(3'h5)]};
  assign wire62 = (~($signed($signed(wire55)) ?
                      wire53[(4'hb):(4'h8)] : $unsigned((&wire54[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg63 <= $unsigned((~&$unsigned((-(&(8'hb8))))));
      reg64 <= wire57[(4'hf):(4'h9)];
    end
  assign wire65 = $signed((wire59[(1'h0):(1'h0)] < wire53[(4'he):(4'he)]));
  assign wire66 = ({(~|(8'hb4))} ?
                      $unsigned($signed((~&$unsigned(wire51)))) : (({(~&reg63)} || (wire50 ?
                          $signed((8'hb6)) : wire55[(1'h0):(1'h0)])) ^~ $unsigned(wire50)));
  assign wire67 = ({(((^wire50) > (wire54 != wire60)) ?
                          wire54[(3'h4):(1'h0)] : $signed($signed((8'hb6))))} <= (wire54[(2'h2):(2'h2)] && (~^(^(wire60 ?
                      (7'h40) : wire62)))));
  always
    @(posedge clk) begin
      reg68 <= reg63[(1'h0):(1'h0)];
      reg69 <= (wire52 << (wire61[(3'h5):(2'h3)] ^ wire60));
      reg70 <= (wire60 ? $unsigned((&wire60)) : {(+wire62)});
      reg71 <= $unsigned(((~^wire62) ? reg70 : (7'h41)));
    end
  assign wire72 = (~&reg70);
  assign wire73 = wire61;
endmodule

module module10
#(parameter param39 = (({(((8'hbf) >= (8'hb7)) && ((7'h40) ? (8'hab) : (8'ha9))), (((8'ha4) ? (8'haf) : (8'hba)) ? (7'h40) : ((8'ha2) >= (8'ha1)))} ? (((8'hae) ? (!(8'hbe)) : ((8'h9d) && (8'hbe))) ~^ ((-(8'haf)) ^~ ((8'ha0) + (8'ha0)))) : {{((8'ha4) <= (8'ha2)), ((8'hba) - (8'haa))}, (7'h43)}) ^~ (({((7'h44) ? (8'hb7) : (8'hb7))} ? (~&(^(8'hb1))) : ((|(8'ha7)) * {(7'h40)})) ? (({(8'h9f)} <<< ((8'ha7) ? (8'h9e) : (8'ha0))) ? (~&((8'hb6) ? (8'hb7) : (8'h9d))) : ((&(8'haf)) ? ((8'hba) >= (8'hb1)) : ((8'hae) ? (8'hab) : (7'h41)))) : (7'h41))), 
parameter param40 = (((~|(~^(param39 < (8'ha5)))) ? ((~&(param39 | (8'hbb))) != ((^param39) ? param39 : param39)) : (param39 ^~ (8'h9c))) + (8'hbb)))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire signed [(2'h2):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
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
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg25,
                 (1'h0)};
  assign wire16 = wire11;
  assign wire17 = $signed($unsigned($signed(($signed(wire11) ?
                      wire11[(3'h4):(1'h1)] : wire11[(3'h7):(3'h6)]))));
  assign wire18 = {(!($unsigned((wire13 ?
                          wire13 : wire16)) <<< $signed(wire14[(4'hb):(3'h7)]))),
                      wire13};
  assign wire19 = wire17[(2'h2):(1'h0)];
  assign wire20 = $signed(({$signed(((7'h40) & wire17))} ?
                      wire11[(4'hb):(3'h6)] : (-$signed($signed(wire11)))));
  assign wire21 = ($signed($signed((^~$unsigned(wire18)))) ?
                      (wire18 ^~ (wire11[(3'h5):(3'h4)] < (~|wire15))) : $unsigned($signed(wire15[(3'h4):(3'h4)])));
  assign wire22 = (8'ha8);
  assign wire23 = (wire21 & (($signed((7'h40)) > $signed((wire14 ?
                          (8'hb3) : wire14))) ?
                      wire20 : ($signed($signed(wire15)) < (wire13 ?
                          wire18[(3'h6):(1'h0)] : $unsigned(wire20)))));
  assign wire24 = wire15[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg25 <= ((~&((~|wire15[(3'h4):(1'h0)]) ?
          $unsigned($signed(wire14)) : wire11)) + $signed($signed(wire22[(4'hb):(3'h6)])));
    end
  assign wire26 = (wire14 ?
                      $signed($signed((wire21[(3'h6):(1'h0)] == (wire24 ?
                          wire11 : wire20)))) : wire19);
  assign wire27 = $unsigned($signed($unsigned(wire18)));
  assign wire28 = $unsigned($unsigned($signed(wire15[(4'hd):(3'h5)])));
  assign wire29 = (wire13[(1'h0):(1'h0)] <<< $unsigned(wire18[(3'h5):(3'h5)]));
  assign wire30 = wire21;
  assign wire31 = (~&wire30);
  assign wire32 = ({({$signed(wire15)} ? (~$signed(reg25)) : (|$signed(reg25))),
                      ($signed((wire16 ? wire24 : wire21)) ?
                          (~^wire26) : ((wire29 ?
                              wire18 : wire17) > wire11))} <<< wire17[(3'h5):(1'h0)]);
  assign wire33 = wire14[(1'h0):(1'h0)];
  assign wire34 = ({(wire14 << ($unsigned(wire19) ?
                          (~^wire19) : $signed(wire33)))} >= wire33);
  assign wire35 = ({(($unsigned(wire29) == wire11[(4'h8):(2'h3)]) ?
                          (((8'hb8) ? (8'hbd) : wire17) ?
                              $signed(wire31) : {wire33,
                                  (8'hbc)}) : wire33[(3'h6):(2'h2)]),
                      (!(-(~^wire28)))} >> (8'ha4));
  assign wire36 = ($signed(wire35[(3'h6):(3'h4)]) ?
                      wire14 : $signed({((wire28 ? (8'h9f) : wire13) ?
                              (-wire17) : {(8'hb2), wire13})}));
  assign wire37 = (^~(8'hae));
  assign wire38 = $unsigned(wire12[(1'h1):(1'h0)]);
endmodule
