module top
#(parameter param90 = ((&((~(!(8'hb4))) && ((~&(8'hac)) ? ((8'hb0) ? (7'h42) : (8'hb9)) : ((7'h42) ? (8'hac) : (8'ha8))))) ? (8'ha5) : ((~((&(8'hb3)) ? ((8'hba) ? (8'h9d) : (8'haf)) : (!(8'hbb)))) ~^ ((~{(8'hbb), (8'h9c)}) > (((8'hb8) + (8'ha1)) ? (&(8'ha3)) : ((8'hae) <= (7'h40)))))), 
parameter param91 = (param90 * ((({param90} ~^ (param90 * (8'h9c))) ? (~^(!param90)) : (~|(param90 + param90))) ? ({param90} | ((~^param90) * (param90 ? param90 : (8'hbb)))) : ((param90 ? (~(8'had)) : {param90, param90}) == (param90 ? (param90 & param90) : param90)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  assign y = {wire89,
                 wire87,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed($signed($unsigned(((~&(8'ha1)) ?
                     (^~wire4) : $signed(wire3)))));
  assign wire6 = $signed(((~&wire0) <= (($signed(wire1) ?
                         wire1 : $unsigned(wire4)) ?
                     $unsigned((wire2 ? wire5 : wire3)) : ({wire3, (8'ha2)} ?
                         $unsigned(wire0) : $unsigned(wire0)))));
  assign wire7 = $unsigned(((-{wire0, wire1}) ?
                     (~&$unsigned((~wire3))) : wire6));
  assign wire8 = wire7[(4'h8):(1'h1)];
  assign wire9 = wire5;
  assign wire10 = wire3;
  assign wire11 = $signed((wire8 <= ({$unsigned(wire0)} <<< wire4)));
  assign wire12 = ((8'hba) ?
                      (+(^($signed(wire9) - wire3))) : (wire4[(2'h2):(2'h2)] ?
                          (^~(~^(~&wire6))) : (^~(|$signed(wire6)))));
  assign wire13 = ({wire6} ~^ (^~wire8[(2'h3):(1'h1)]));
  assign wire14 = $unsigned((^~$unsigned(wire2)));
  module15 #() modinst88 (wire87, clk, wire1, wire4, wire6, wire5);
  assign wire89 = ((^(+((wire9 ? wire1 : wire11) ?
                          $unsigned(wire3) : (&(8'ha1))))) ?
                      wire7 : wire8[(3'h5):(2'h3)]);
endmodule

module module15
#(parameter param86 = ((~^((+{(7'h42)}) < {(!(8'hba)), ((8'hab) ? (8'hb9) : (8'hb2))})) ? ((^~({(8'hb8)} + {(8'hbf)})) ? ((!((8'ha2) >= (8'hb0))) ? {((8'hb9) > (8'hb7)), (~&(7'h43))} : (((8'hab) ? (8'hb4) : (8'hb1)) || (^(8'ha7)))) : ((^((8'hba) <<< (8'hab))) + (((8'ha7) ? (8'hbb) : (8'hbc)) ? (&(8'hbf)) : ((8'hb4) ? (8'h9c) : (8'ha1))))) : (((((8'ha9) ? (8'ha8) : (8'haa)) ? ((8'hba) - (8'ha3)) : (~^(8'ha1))) ? (((8'hb9) ? (8'ha9) : (8'ha8)) ? {(8'h9c)} : ((8'ha9) ? (7'h43) : (8'h9c))) : (&{(8'hb9), (8'ha2)})) ? ((&((8'hb5) ? (8'hbb) : (8'hb7))) ? ((~|(8'hbe)) ^~ (8'ha7)) : ((8'hb4) ? ((8'hbe) ^~ (8'hac)) : {(8'hbe), (8'hb0)})) : (~^(((8'hb6) ? (8'hb2) : (8'ha2)) & ((8'hb6) + (8'hae)))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire34;
  assign y = {wire85,
                 wire83,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire34,
                 (1'h0)};
  module20 #() modinst35 (wire34, clk, wire19, wire16, wire17, wire18);
  module36 #() modinst52 (.wire40(wire19), .wire39(wire17), .wire37(wire18), .y(wire51), .wire38(wire34), .clk(clk));
  assign wire53 = $signed(wire16[(4'he):(1'h1)]);
  assign wire54 = (wire53 << $signed({{(|wire51)}}));
  assign wire55 = $signed((&(^(+(8'hac)))));
  assign wire56 = $signed($unsigned((wire54[(2'h2):(1'h1)] ?
                      wire16[(3'h6):(1'h1)] : $unsigned($signed(wire55)))));
  assign wire57 = wire18[(4'h8):(2'h3)];
  module58 #() modinst84 (wire83, clk, wire16, wire19, wire18, wire55);
  assign wire85 = $signed(((8'ha2) ?
                      $signed(wire34[(3'h6):(2'h2)]) : $signed(((wire34 | wire18) | (wire17 ?
                          wire57 : wire54)))));
endmodule

module module58  (y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire62;
  input wire signed [(2'h3):(1'h0)] wire61;
  input wire [(4'hf):(1'h0)] wire60;
  input wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire63;
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire66,
                 wire63,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire63 = $signed($unsigned((~|($signed(wire62) >= wire62[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg64 <= $unsigned(wire60);
      reg65 <= $signed((wire62 ?
          wire61 : $signed(((wire59 < wire62) ? (-wire61) : (8'hbf)))));
    end
  assign wire66 = ((|$unsigned(wire60)) ?
                      reg65[(2'h3):(1'h0)] : $unsigned($signed(wire60[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg67 <= ($signed($unsigned($signed((~^wire59)))) ?
          wire66[(3'h6):(3'h5)] : $signed($unsigned(((8'hac) && (wire59 ?
              wire59 : (8'ha4))))));
      reg68 <= (|((~$unsigned((wire61 ? (8'hac) : wire60))) ?
          ($signed((reg65 ^~ (8'haa))) ?
              ((wire59 ?
                  reg64 : (8'hb7)) || ((7'h43) ^ wire63)) : $unsigned((wire63 == wire60))) : (reg65 - reg65)));
      reg69 <= {(~^(wire66 ? wire62[(4'h9):(1'h0)] : wire59[(4'hd):(2'h3)])),
          {$unsigned((!((8'hbb) ? (8'ha9) : wire62)))}};
      reg70 <= $unsigned(((|wire59) == $unsigned(reg64)));
    end
  assign wire71 = {$signed(((^wire61) == wire61))};
  assign wire72 = wire66;
  assign wire73 = (&($signed($signed($signed(reg65))) != (|$unsigned(wire63[(3'h4):(1'h1)]))));
  assign wire74 = (7'h43);
  assign wire75 = wire66;
  assign wire76 = $signed((wire59[(4'hc):(1'h1)] ?
                      reg68 : {($signed(wire62) | (wire72 && (8'hb6)))}));
  assign wire77 = {wire60[(4'hd):(4'h8)], $unsigned((^wire63[(2'h3):(1'h1)]))};
  assign wire78 = {wire59,
                      ({($unsigned(reg64) != (^wire73))} < ((!(wire60 ?
                          wire75 : reg65)) <= $signed(reg67[(4'hc):(4'h8)])))};
  assign wire79 = (!$unsigned((~^$unsigned(((8'hbd) || wire63)))));
  assign wire80 = wire74;
  assign wire81 = wire79[(3'h7):(3'h5)];
  assign wire82 = $unsigned(wire60);
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire40;
  input wire [(5'h12):(1'h0)] wire39;
  input wire [(5'h10):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg50,
                 (1'h0)};
  assign wire41 = wire37;
  assign wire42 = {(($unsigned((wire38 ? wire38 : wire40)) ?
                          $unsigned((wire39 ?
                              (8'hb2) : wire41)) : (8'ha2)) && (~|(~$signed(wire38))))};
  assign wire43 = $unsigned({{$signed((~|(8'hb8))), (^(^wire39))}});
  assign wire44 = {($unsigned((wire38[(4'h9):(1'h1)] ?
                          $signed(wire39) : $signed(wire37))) == $signed((wire41[(3'h4):(1'h0)] ^~ wire38)))};
  assign wire45 = wire42;
  assign wire46 = (^~$unsigned((8'haf)));
  assign wire47 = ((~&$signed($signed({(8'hb1)}))) ?
                      $unsigned(wire45) : wire39);
  assign wire48 = $signed($unsigned((wire37 + wire42)));
  assign wire49 = (($unsigned(($signed(wire45) * wire42[(1'h0):(1'h0)])) << {$unsigned((wire43 ?
                              (8'ha7) : (7'h40)))}) ?
                      $signed((wire47 ?
                          ($unsigned(wire40) ?
                              $unsigned(wire39) : (^~wire39)) : wire40)) : $signed((!(wire44[(3'h7):(1'h0)] ?
                          (wire37 + wire42) : $unsigned(wire46)))));
  always
    @(posedge clk) begin
      reg50 <= (wire37 >> wire39);
    end
endmodule

module module20
#(parameter param33 = ({(&(((8'hb6) ? (8'hb1) : (8'ha3)) << {(8'ha0), (8'ha5)}))} ? (|(((^~(8'ha5)) ? ((8'h9c) * (8'hb6)) : ((8'ha7) ? (8'hb9) : (8'hb1))) ? ((8'had) ? ((8'ha5) == (8'ha3)) : ((8'hb1) ? (7'h43) : (8'hb1))) : (~|(8'ha0)))) : (~|(({(8'hb8)} | ((8'h9f) ? (8'h9f) : (8'haf))) ? {{(8'ha5)}, ((8'hb7) ? (8'h9c) : (7'h40))} : (((8'ha7) + (8'hb8)) ? ((7'h42) & (8'h9d)) : ((8'hae) ? (8'ha3) : (8'h9c)))))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg30,
                 (1'h0)};
  assign wire25 = ((8'ha6) < wire22);
  assign wire26 = $unsigned($unsigned((wire21 ?
                      $unsigned({wire25}) : (wire24 > (wire21 < wire21)))));
  assign wire27 = wire25[(3'h4):(3'h4)];
  assign wire28 = {$signed(wire23), $signed(wire23)};
  assign wire29 = $unsigned(({$unsigned($signed((8'ha7)))} <= {wire24}));
  always
    @(posedge clk) begin
      reg30 <= wire28[(3'h7):(1'h0)];
    end
  assign wire31 = ((wire27 ?
                      (wire21 ?
                          $unsigned($unsigned(wire21)) : (~|$signed(wire27))) : (({reg30,
                          (8'had)} ^ {wire24}) - wire21)) | $unsigned(wire26));
  assign wire32 = (wire28 & wire23);
endmodule
