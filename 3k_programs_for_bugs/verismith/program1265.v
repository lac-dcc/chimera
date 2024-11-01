module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire30;
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire4,
                 wire5,
                 wire6,
                 wire30,
                 (1'h0)};
  assign wire4 = $unsigned(wire3[(2'h2):(1'h1)]);
  assign wire5 = $signed(wire4);
  assign wire6 = ((-wire1[(1'h0):(1'h0)]) >= wire1);
  module7 #() modinst31 (.wire8(wire6), .clk(clk), .wire11(wire5), .wire9(wire1), .wire12(wire3), .y(wire30), .wire10(wire2));
  assign wire32 = wire5[(4'h9):(3'h6)];
  assign wire33 = wire1;
  assign wire34 = {$signed($signed(($signed(wire6) != $unsigned(wire30)))),
                      (~|{(-wire4)})};
  assign wire35 = (wire2[(1'h1):(1'h0)] - $unsigned((+($unsigned(wire30) >= wire5))));
  assign wire36 = wire5[(3'h5):(1'h1)];
  assign wire37 = ($unsigned((($unsigned(wire2) ?
                          wire32 : {wire2}) << wire3[(3'h7):(3'h5)])) ?
                      $unsigned($signed((-wire5))) : wire33);
  assign wire38 = $unsigned({({wire37[(1'h0):(1'h0)],
                          {wire4, wire6}} <<< ((wire35 >>> (8'h9f)) ?
                          (!wire33) : wire36))});
  assign wire39 = wire1;
  assign wire40 = wire2[(2'h2):(2'h2)];
  module41 #() modinst89 (.wire45(wire6), .wire44(wire30), .wire42(wire33), .y(wire88), .wire43(wire32), .clk(clk));
  assign wire90 = $signed((({$signed(wire6)} == wire3) ?
                      $signed(((^~(8'h9d)) & (wire30 ?
                          wire40 : wire2))) : wire36));
  assign wire91 = wire40[(4'ha):(3'h4)];
  assign wire92 = (wire34[(4'hc):(3'h6)] ?
                      {($unsigned($signed(wire34)) ?
                              {wire35[(3'h4):(2'h2)]} : $signed((wire5 + wire2))),
                          wire88[(1'h0):(1'h0)]} : $unsigned($unsigned(($unsigned(wire37) ?
                          {wire33, wire37} : $unsigned(wire36)))));
  assign wire93 = wire30;
  assign wire94 = wire92[(1'h0):(1'h0)];
  assign wire95 = (wire5[(4'ha):(4'h9)] <= $signed((wire3[(4'hf):(4'hf)] ?
                      $signed($unsigned((8'hab))) : wire6)));
endmodule

module module41  (y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire45;
  input wire signed [(5'h11):(1'h0)] wire44;
  input wire signed [(5'h12):(1'h0)] wire43;
  input wire [(4'h9):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire83;
  assign y = {wire87, wire86, wire85, wire83, (1'h0)};
  module46 #() modinst84 (.clk(clk), .wire49(wire44), .wire50(wire43), .y(wire83), .wire48(wire45), .wire47(wire42));
  assign wire85 = (~&($signed(($unsigned(wire83) ?
                      $signed(wire43) : ((7'h42) ?
                          wire42 : wire45))) && wire45));
  assign wire86 = (~^$signed({($unsigned(wire43) ?
                          wire42[(3'h7):(1'h0)] : wire44[(1'h1):(1'h0)])}));
  assign wire87 = $unsigned(({((&wire45) ? $unsigned(wire83) : $signed(wire44)),
                          $signed($signed(wire83))} ?
                      ($signed($signed(wire43)) ?
                          $unsigned((wire43 ?
                              wire83 : wire43)) : wire44) : ((wire83 + (8'h9c)) ?
                          $signed(wire83[(2'h3):(2'h3)]) : $unsigned({wire86,
                              (8'hb5)}))));
endmodule

module module7
#(parameter param29 = {((((|(8'hb1)) && ((7'h44) ~^ (7'h43))) ? (^(^~(8'hb5))) : {((8'hb7) ? (8'h9e) : (8'hbc)), {(8'hb9)}}) ? {((^~(8'h9c)) ~^ (|(7'h43)))} : (~|(((8'hb9) - (7'h42)) ? ((8'hbc) ? (8'ha5) : (8'hbc)) : (7'h44)))), (~(~&(((8'hab) ~^ (8'h9c)) < (-(8'haf)))))})
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire13 = {$unsigned((~|$signed($signed(wire11)))),
                      $unsigned((~&(!{wire11})))};
  assign wire14 = wire13[(1'h0):(1'h0)];
  assign wire15 = wire11;
  assign wire16 = {({$signed($unsigned(wire9)), wire11} ?
                          $signed(($signed(wire9) ^ $unsigned((8'hb8)))) : (wire13 ?
                              (~|(wire15 || wire13)) : (wire8 ?
                                  (wire11 ?
                                      wire13 : (8'hb7)) : $signed(wire15))))};
  always
    @(posedge clk) begin
      if (wire13)
        begin
          reg17 <= ($signed(((~&wire8[(5'h14):(4'hd)]) ?
                  ($unsigned(wire13) ?
                      $unsigned(wire12) : (wire14 || wire12)) : (~|(~wire12)))) ?
              wire13[(3'h5):(1'h1)] : (wire14[(2'h3):(2'h3)] ?
                  (~wire9[(4'h8):(1'h0)]) : (~$unsigned((!wire13)))));
        end
      else
        begin
          reg17 <= {(|$signed(wire11[(2'h3):(2'h2)]))};
          reg18 <= {(-(~^{$unsigned((8'hb6))}))};
          if ($unsigned(wire11))
            begin
              reg19 <= ($unsigned(($unsigned((-wire8)) ?
                  wire16 : (8'haf))) ~^ (^wire14));
            end
          else
            begin
              reg19 <= reg18[(2'h2):(1'h0)];
              reg20 <= wire8;
            end
          reg21 <= (((wire8 & ($signed(wire15) ? $signed(wire13) : (^reg17))) ?
              wire9[(3'h5):(1'h1)] : {({reg18, wire9} || (^~reg17))}) - (wire8 ?
              ($unsigned((^~(7'h44))) ? reg18 : wire14) : $unsigned(wire11)));
        end
    end
  always
    @(posedge clk) begin
      reg22 <= {wire15[(4'hd):(4'hc)],
          ((!reg19) ?
              $signed((reg20[(3'h5):(2'h3)] == {(8'hae),
                  reg20})) : $signed(($signed(wire15) ?
                  $signed(wire9) : $signed((8'hb1)))))};
      reg23 <= ((({$signed(reg21)} ?
          ((wire9 ?
              wire14 : wire15) | wire15[(1'h1):(1'h0)]) : wire9) * {$signed({reg18}),
          ((^wire13) - reg18)}) - reg17);
    end
  assign wire24 = $unsigned(wire12);
  assign wire25 = $signed($signed((wire13[(5'h12):(1'h1)] >> reg22)));
  assign wire26 = $signed($signed(reg17[(4'h9):(3'h4)]));
  assign wire27 = reg17[(4'hf):(1'h0)];
  assign wire28 = (+{{$unsigned($signed((8'hb3))),
                          ($signed(reg19) ? (|reg18) : $unsigned(wire24))},
                      (($signed(wire26) ?
                              (wire10 - (8'ha5)) : $unsigned(wire24)) ?
                          wire26 : wire10[(2'h3):(1'h1)])});
endmodule

module module46
#(parameter param81 = (((((^~(8'hb1)) ? (+(7'h43)) : ((8'hbf) ? (8'hac) : (8'haf))) > (~&((7'h42) ? (8'hae) : (8'ha9)))) != (((8'h9f) ? (^(8'ha3)) : ((8'ha8) >> (8'ha2))) ? ((~^(8'had)) == {(8'hb5)}) : (((8'h9e) & (7'h41)) ? ((8'ha8) ? (8'hb7) : (8'ha9)) : ((8'hb6) < (8'hb6))))) ? ((((~|(8'ha0)) ^~ (7'h43)) ? (((8'hbb) >>> (8'hb8)) > (^~(8'h9f))) : ((~(8'hab)) >= ((8'hb7) ? (8'ha0) : (8'hb5)))) < ({((8'had) ? (7'h43) : (8'h9e))} | (((8'hb4) ? (8'ha5) : (8'hbc)) ? (^~(8'ha3)) : (~^(8'h9f))))) : (({((8'hb2) >= (8'hbd))} ? (((8'had) && (8'ha8)) ? (!(8'hb0)) : ((8'hb2) && (8'h9d))) : (~^((8'h9c) ? (7'h41) : (8'hbe)))) ? (^~(((8'ha2) ? (8'h9d) : (8'hb7)) ? (8'hbe) : ((8'hb4) ? (8'ha1) : (8'hb6)))) : ((-(~^(8'ha4))) >>> (((8'haf) ? (8'hab) : (8'h9d)) - (~|(8'hac)))))), 
parameter param82 = ((~&(((param81 >>> (8'hbb)) - (|param81)) == ((param81 > param81) ? (param81 ? param81 : param81) : (param81 || (8'hb7))))) <= param81))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire [(5'h11):(1'h0)] wire49;
  input wire signed [(5'h11):(1'h0)] wire48;
  input wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire51;
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire51,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire51 = ((&$unsigned($signed($signed(wire48)))) + $signed($unsigned((~^$unsigned(wire49)))));
  always
    @(posedge clk) begin
      if (wire47)
        begin
          reg52 <= wire48[(4'h9):(2'h3)];
        end
      else
        begin
          reg52 <= (+(wire48[(3'h5):(1'h1)] << $signed($unsigned($signed((8'ha3))))));
          reg53 <= $unsigned($signed(wire50[(4'h9):(1'h1)]));
          reg54 <= reg52[(1'h1):(1'h1)];
          reg55 <= ((~^$signed(reg54)) ?
              ($unsigned(((^~reg52) ?
                  wire49[(3'h7):(3'h4)] : (wire51 ?
                      wire48 : reg54))) * ($unsigned(wire50[(5'h11):(4'ha)]) ?
                  $unsigned(wire50) : {wire47})) : {$signed((!(wire49 < wire48)))});
        end
      reg56 <= ($unsigned($unsigned((reg53[(3'h4):(2'h3)] ?
              $signed(reg54) : (wire50 >= reg53)))) ?
          ((8'h9c) ?
              ($unsigned((reg54 ?
                  reg53 : wire51)) >= reg55[(3'h7):(3'h5)]) : $signed(reg55[(3'h7):(1'h0)])) : (wire47 >>> (8'ha3)));
      if ((~reg56[(4'hc):(4'hc)]))
        begin
          if ((({reg53, (^wire51)} ?
              $signed(wire49) : $unsigned(((wire48 >> wire51) > $unsigned(wire48)))) || reg52[(2'h2):(2'h2)]))
            begin
              reg57 <= reg55[(4'h9):(4'h8)];
              reg58 <= wire48;
              reg59 <= (-$unsigned((&(8'ha1))));
              reg60 <= ((-(~|(|$unsigned(reg56)))) + {$signed(((wire47 < reg55) ?
                      reg59 : (reg52 ? wire51 : wire49)))});
              reg61 <= (~(((|wire50) ?
                      ($unsigned(reg60) == (wire51 >> reg58)) : (~&reg55)) ?
                  $signed({(^~reg58), (wire47 || reg52)}) : reg58));
            end
          else
            begin
              reg57 <= {reg56};
              reg58 <= wire51;
              reg59 <= wire50[(4'hc):(3'h4)];
              reg60 <= (~(^(reg59[(2'h3):(1'h0)] ?
                  wire51 : wire49[(5'h10):(3'h7)])));
            end
        end
      else
        begin
          reg57 <= $signed(($signed((wire47 * wire49)) ?
              (reg56 ?
                  $signed((reg55 ?
                      reg55 : reg54)) : $signed($signed((8'haa)))) : $unsigned(wire51)));
          reg58 <= reg52[(2'h2):(1'h1)];
          reg59 <= (~&(~|$unsigned((((8'hb5) ? wire47 : wire48) ?
              $unsigned(reg60) : $signed((8'h9c))))));
        end
      reg62 <= (8'ha2);
      reg63 <= $unsigned((reg61 << (~^{wire51})));
    end
  always
    @(posedge clk) begin
      reg64 <= $signed(((^~$unsigned((reg63 ? wire50 : reg55))) ?
          {(~$signed(wire47))} : (wire48 < $unsigned(wire51[(4'he):(2'h3)]))));
      reg65 <= {$signed({(!(^reg57))}),
          $unsigned((($unsigned(wire51) >> {reg63, wire47}) ?
              reg61 : ($signed(wire49) & $signed(reg59))))};
      reg66 <= (-((~|(~^$unsigned(reg65))) && $unsigned({reg60[(3'h4):(2'h2)],
          reg54[(5'h13):(4'h9)]})));
      reg67 <= $unsigned(($unsigned(($unsigned(reg58) > (~reg66))) & (+(~{reg58}))));
      reg68 <= $unsigned(reg53[(1'h1):(1'h0)]);
    end
  assign wire69 = reg57;
  assign wire70 = ((-(8'ha5)) ~^ $unsigned($signed(((reg53 ? wire50 : wire50) ?
                      (reg65 >>> wire69) : {(8'ha2)}))));
  assign wire71 = wire69;
  assign wire72 = (+{{$signed((reg68 ? reg63 : (8'haa))),
                          ($unsigned(reg64) ? reg68 : reg57)},
                      $signed(reg66[(3'h5):(3'h5)])});
  assign wire73 = ((+$signed((reg65[(4'h9):(3'h4)] ?
                          ((8'hba) <<< reg60) : $signed(reg56)))) ?
                      reg56 : wire70[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg74 <= (8'h9c);
      reg75 <= reg54;
      reg76 <= ({(^($unsigned(reg58) || $unsigned(reg68)))} <= reg74[(2'h3):(1'h0)]);
      reg77 <= $signed((($signed($unsigned(wire47)) ?
          $signed(reg64[(1'h1):(1'h1)]) : $unsigned((8'haf))) | $unsigned($unsigned((wire70 ?
          wire50 : reg52)))));
    end
  assign wire78 = (-(-(((wire71 ? reg62 : (8'hab)) ?
                          reg67[(1'h0):(1'h0)] : reg54[(3'h6):(2'h2)]) ?
                      (~^((7'h41) <= wire73)) : {$unsigned((8'h9e))})));
  assign wire79 = $signed($signed(reg52[(1'h1):(1'h0)]));
  assign wire80 = (~$signed((reg53[(2'h2):(2'h2)] ?
                      {$unsigned(reg52),
                          $unsigned(wire50)} : {(wire48 || (8'hae))})));
endmodule
