module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire97;
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire97,
                 (1'h0)};
  assign wire5 = wire0[(3'h4):(1'h0)];
  assign wire6 = wire5;
  assign wire7 = (^$unsigned(wire6[(2'h2):(2'h2)]));
  assign wire8 = $unsigned($signed((wire6 ?
                     ($signed(wire3) ?
                         (^wire6) : (wire7 ?
                             wire7 : (8'hbd))) : wire6[(1'h1):(1'h1)])));
  assign wire9 = wire4[(4'hf):(2'h2)];
  assign wire10 = (^~((((wire9 + (8'ha4)) ?
                              (wire3 ? wire3 : wire5) : (-wire4)) ?
                          ($signed(wire5) >>> wire5[(4'hb):(1'h0)]) : (8'hbb)) ?
                      $signed(($signed(wire1) ?
                          wire2 : {wire3, (8'hab)})) : wire0));
  assign wire11 = $signed(wire1);
  assign wire12 = (8'ha3);
  module13 #() modinst98 (.wire16(wire12), .y(wire97), .wire18(wire7), .wire15(wire3), .wire17(wire11), .clk(clk), .wire14(wire5));
endmodule

module module13
#(parameter param96 = (((((^(8'ha4)) ~^ (8'hb2)) >>> (|(^(8'ha5)))) | ({((8'ha6) ? (7'h43) : (8'h9e))} >> ({(8'ha7)} ? ((8'hb3) ? (8'hb6) : (8'haa)) : (~(7'h41))))) ? (8'hb1) : ({{(^~(7'h43)), ((8'hb2) ? (7'h42) : (8'hbb))}, (&((8'hb9) ? (8'hb3) : (8'haf)))} >>> ({{(8'had), (8'ha5)}} ^~ (~|((8'ha6) ? (8'h9f) : (8'ha7)))))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire92,
                 wire66,
                 wire65,
                 wire63,
                 wire35,
                 wire34,
                 wire33,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 (1'h0)};
  assign wire19 = (((|($unsigned(wire16) ? $signed((8'haf)) : wire17)) ?
                          $unsigned($unsigned((wire18 ?
                              wire15 : (8'hb0)))) : $unsigned(wire15[(3'h5):(2'h3)])) ?
                      {{wire14[(1'h1):(1'h0)]}} : $unsigned((({wire18, wire17} ?
                          {wire17,
                              wire17} : (wire18 + wire17)) && $unsigned(wire16[(2'h3):(1'h1)]))));
  assign wire20 = (~wire18[(1'h1):(1'h0)]);
  assign wire21 = wire18[(3'h6):(1'h1)];
  assign wire22 = (wire15[(1'h1):(1'h1)] ?
                      (((wire18[(2'h3):(2'h3)] == (|wire19)) ?
                              (-(wire19 ? wire20 : wire16)) : (8'hbb)) ?
                          $unsigned(wire15[(4'h8):(3'h6)]) : (~$signed($signed(wire18)))) : wire20);
  assign wire23 = ($unsigned($signed($signed(wire16[(3'h7):(3'h7)]))) ?
                      ((wire17 ? wire19[(4'he):(1'h0)] : $unsigned(wire16)) ?
                          $unsigned((^~$unsigned(wire15))) : $signed($signed(((8'had) ?
                              wire16 : wire20)))) : wire18);
  assign wire24 = wire19;
  always
    @(posedge clk) begin
      if (($signed($signed((-(^~(7'h42))))) ?
          $signed((!(!$signed((8'ha4))))) : (({$signed(wire23),
                  wire20[(4'hc):(4'hc)]} ?
              $signed($signed(wire14)) : (wire24 ?
                  (8'hae) : {(7'h40)})) != (~wire22))))
        begin
          reg25 <= (|($unsigned(({wire18, wire23} >> (wire23 ?
                  wire18 : (7'h42)))) ?
              wire24[(4'hf):(4'hb)] : ($signed(wire23[(3'h4):(2'h2)]) < (~&(wire23 ?
                  wire18 : wire14)))));
          reg26 <= wire20[(2'h2):(1'h0)];
          if ({reg25, (&wire20)})
            begin
              reg27 <= $unsigned($signed((({wire22} ?
                  (wire16 ? wire15 : wire14) : (wire15 * wire18)) < wire19)));
              reg28 <= ($signed($signed((~&reg26))) ?
                  $unsigned($signed(reg26[(1'h0):(1'h0)])) : wire19);
              reg29 <= ((~|wire19) && (reg26 ?
                  (+{{wire23,
                          wire14}}) : ($unsigned(wire22[(4'h9):(3'h4)]) >= (~|(8'ha1)))));
            end
          else
            begin
              reg27 <= $unsigned((~^$signed((+((8'h9f) ? (8'h9e) : wire19)))));
              reg28 <= (((!wire18) != (((8'hab) ? (^wire18) : wire18) ?
                      ($signed(wire16) ?
                          $signed(wire20) : reg28) : ((reg28 || wire14) >= (~|reg28)))) ?
                  ({(8'had),
                      (wire18[(1'h0):(1'h0)] & wire18[(2'h2):(1'h1)])} != $signed($unsigned(reg26[(1'h0):(1'h0)]))) : (wire20[(3'h4):(1'h0)] <<< (wire17 ?
                      wire24[(1'h1):(1'h1)] : reg27)));
              reg29 <= reg26[(2'h2):(2'h2)];
              reg30 <= ($signed(wire22) ?
                  reg27[(2'h3):(2'h2)] : $unsigned((wire17 ?
                      (~(wire14 > reg28)) : $unsigned(wire19))));
              reg31 <= (~&{(~&(|$signed((8'haf))))});
            end
          reg32 <= $signed(wire20[(2'h3):(2'h2)]);
        end
      else
        begin
          reg25 <= $signed($unsigned((((wire21 >>> (8'ha3)) ?
                  wire22 : (~^reg26)) ?
              (wire22[(4'ha):(2'h3)] ? (+(8'h9c)) : (!wire23)) : (~|{reg28,
                  reg32}))));
        end
    end
  assign wire33 = (((~|($unsigned(reg31) - (reg30 ? (8'hac) : wire14))) ?
                          wire16 : wire24[(5'h10):(4'he)]) ?
                      (~(~^{wire14[(1'h0):(1'h0)]})) : $unsigned(($signed(wire17[(1'h1):(1'h0)]) ?
                          (!$signed(reg29)) : reg29[(4'hb):(1'h1)])));
  assign wire34 = $unsigned({wire15[(3'h7):(3'h6)]});
  assign wire35 = wire14;
  module36 #() modinst64 (wire63, clk, wire34, wire15, wire18, reg27, wire14);
  assign wire65 = reg30[(2'h2):(2'h2)];
  assign wire66 = $unsigned(((reg29 <<< (~&wire24)) > ($unsigned($unsigned(wire21)) ?
                      $signed((wire34 | wire33)) : (reg27[(3'h7):(1'h1)] ?
                          $signed(reg31) : $signed(reg31)))));
  module67 #() modinst93 (.wire71(reg26), .wire70(wire23), .wire69(wire19), .y(wire92), .wire68(reg29), .clk(clk));
  assign wire94 = reg26;
  assign wire95 = $unsigned((&(~reg28[(2'h2):(1'h1)])));
endmodule

module module67
#(parameter param90 = (~^(|(({(8'hb0)} == ((8'hb5) ? (8'ha7) : (8'hb3))) ? {((8'haf) ? (8'hbe) : (8'hba)), ((8'hac) + (7'h41))} : ({(8'hae), (7'h44)} || (8'hbf))))), 
parameter param91 = {(8'hbf), {param90}})
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire71;
  input wire [(3'h6):(1'h0)] wire70;
  input wire [(3'h7):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  assign y = {wire89,
                 wire88,
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
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire72 = (|({($signed(wire69) + (~^wire70))} ^~ wire68));
  assign wire73 = $signed({$unsigned(($signed((7'h41)) ?
                          (wire69 <<< wire68) : (8'hb8)))});
  assign wire74 = {($signed(((wire71 >>> wire72) & (8'hb2))) || ((8'hb2) ?
                          $unsigned($unsigned(wire68)) : ((-wire70) << (wire68 != wire73)))),
                      (8'ha2)};
  assign wire75 = wire73[(4'h8):(1'h1)];
  assign wire76 = (($unsigned(((~^wire74) ^~ wire68)) ?
                      wire72[(2'h2):(1'h1)] : (|wire70[(1'h1):(1'h0)])) + (~^wire75));
  assign wire77 = wire70[(2'h2):(1'h1)];
  assign wire78 = wire76[(3'h4):(3'h4)];
  assign wire79 = $signed(($signed(wire71[(1'h0):(1'h0)]) <= ((~|$signed(wire72)) << $signed($signed(wire69)))));
  assign wire80 = wire70[(3'h5):(2'h2)];
  assign wire81 = wire69[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (wire78)
        begin
          reg82 <= wire76;
          reg83 <= $unsigned((-$unsigned((8'ha8))));
          if (($unsigned($signed($unsigned(wire70[(2'h3):(1'h0)]))) ?
              (-$signed($unsigned(wire72[(1'h1):(1'h1)]))) : {({wire77} ?
                      ((wire71 ?
                          wire68 : (8'hb5)) | wire68) : $signed($unsigned(wire68)))}))
            begin
              reg84 <= {$signed(wire76)};
              reg85 <= ($signed((wire68 * wire79)) ?
                  (&$signed({(reg82 ? (8'h9d) : reg82)})) : (~|wire72));
              reg86 <= (reg83[(1'h0):(1'h0)] ?
                  $signed({((wire69 ? wire75 : wire80) ?
                          (+wire74) : $signed(wire71)),
                      wire77[(3'h6):(3'h4)]}) : (wire72[(2'h3):(1'h0)] ?
                      $unsigned(wire71) : $signed($signed(wire77))));
            end
          else
            begin
              reg84 <= (wire68[(4'h8):(4'h8)] ?
                  {$unsigned((^~wire77[(4'h9):(2'h2)]))} : (7'h41));
              reg85 <= ($signed((((~^reg83) ?
                      $signed(reg83) : {wire72, wire81}) ?
                  reg82 : (8'ha2))) & (reg83 & (8'ha3)));
              reg86 <= wire71[(1'h0):(1'h0)];
              reg87 <= reg85[(4'hd):(3'h4)];
            end
        end
      else
        begin
          reg82 <= $signed(reg85);
          reg83 <= reg86;
          reg84 <= $signed(wire74);
          reg85 <= (!(reg84[(4'hf):(4'h9)] >= (~^((8'hb1) ?
              (!wire80) : (|wire76)))));
          reg86 <= ({(~^wire80),
              $signed(((^~wire73) | (&reg85)))} && {(!((~^wire76) ?
                  $signed(wire77) : (reg85 ? wire75 : (7'h43))))});
        end
    end
  assign wire88 = $signed($signed((~$unsigned($signed(wire70)))));
  assign wire89 = wire73[(4'he):(2'h2)];
endmodule

module module36
#(parameter param61 = (|((~&(((8'hb0) && (8'hb7)) ^ {(8'hb5)})) < ((((8'hb3) ? (8'ha8) : (8'ha0)) ? (~^(8'ha8)) : ((8'hbd) + (8'ha6))) ? (|((8'hb0) ? (8'hac) : (8'hb9))) : (8'ha1)))), 
parameter param62 = {((^~(-(param61 - param61))) ? (param61 == ((param61 ^ param61) ? {param61} : (param61 ? param61 : param61))) : {(param61 & param61)}), param61})
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire41;
  input wire [(4'he):(1'h0)] wire40;
  input wire [(3'h7):(1'h0)] wire39;
  input wire signed [(5'h14):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  assign y = {wire60,
                 wire55,
                 wire44,
                 wire43,
                 wire42,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire42 = (^{(&(wire41[(4'he):(3'h5)] ? wire40 : (wire41 << wire39))),
                      $signed($unsigned((wire39 ~^ wire38)))});
  assign wire43 = $unsigned(wire37[(3'h4):(1'h0)]);
  assign wire44 = $unsigned(wire40[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg45 <= ($unsigned($signed(($signed(wire43) | $unsigned(wire39)))) | {{$signed(wire44),
              $unsigned($signed(wire43))}});
      reg46 <= ((^((wire38[(4'h9):(4'h8)] + $signed(wire41)) ?
              ((~^(7'h41)) ?
                  (&wire37) : wire42[(3'h4):(1'h1)]) : $unsigned(reg45))) ?
          wire37[(3'h6):(3'h5)] : $signed(wire42));
      if (reg45)
        begin
          reg47 <= wire38[(5'h12):(3'h7)];
        end
      else
        begin
          if ((+wire38[(2'h2):(2'h2)]))
            begin
              reg47 <= $signed($signed(($signed($unsigned((7'h42))) ?
                  ((~wire44) ?
                      $unsigned(reg45) : (wire37 <= wire37)) : (!{wire43}))));
              reg48 <= $signed($signed(($signed((reg47 >> (7'h43))) <<< $unsigned(reg47))));
            end
          else
            begin
              reg47 <= ($signed($signed(reg47)) ?
                  {((reg47[(5'h10):(1'h0)] * (+wire43)) ?
                          wire37 : (wire37[(4'he):(3'h6)] ?
                              $signed(wire41) : wire38))} : ({wire41, wire42} ?
                      ((reg45 & (wire41 ? (8'hbe) : wire37)) < $unsigned({reg48,
                          (7'h42)})) : wire40));
            end
          reg49 <= wire40;
          reg50 <= wire40[(3'h7):(3'h5)];
          if (wire41)
            begin
              reg51 <= wire39[(1'h1):(1'h0)];
            end
          else
            begin
              reg51 <= wire44[(3'h6):(2'h2)];
              reg52 <= (reg47 <<< reg45[(4'h9):(3'h7)]);
              reg53 <= ($unsigned((&((-wire43) << (wire42 <= reg47)))) ^~ $unsigned((wire40[(3'h4):(1'h1)] & ((wire41 ?
                      wire40 : wire41) ?
                  (^reg49) : (reg52 ? wire44 : reg48)))));
            end
          reg54 <= (~^{(~wire40)});
        end
    end
  assign wire55 = wire38[(4'h9):(3'h5)];
  always
    @(posedge clk) begin
      reg56 <= wire44;
      reg57 <= (($unsigned((~$signed(wire41))) - reg46[(3'h5):(3'h5)]) ?
          {((!reg51[(4'he):(3'h4)]) ?
                  (&{(8'ha6),
                      (7'h40)}) : $signed($unsigned(wire39)))} : $signed(((~reg54) ^~ {(+wire37)})));
      reg58 <= wire55[(4'h8):(3'h7)];
      reg59 <= $signed({($unsigned((&reg54)) ?
              (&$unsigned(reg57)) : $unsigned((-wire55))),
          (^$signed(wire38[(5'h14):(2'h3)]))});
    end
  assign wire60 = reg53[(3'h6):(2'h2)];
endmodule
