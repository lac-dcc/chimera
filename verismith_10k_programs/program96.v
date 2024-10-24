module top
#(parameter param94 = (({(((8'hae) ? (8'hb1) : (8'had)) >> (!(8'haf)))} != {{((8'hb0) <= (8'h9c)), {(8'h9f)}}, ({(7'h41), (8'hb0)} ? (-(7'h41)) : ((8'ha6) | (8'hb8)))}) ^~ (~(((~^(8'h9c)) ~^ (8'ha6)) ? ((+(8'hb9)) ? {(8'h9c)} : ((8'haf) ? (8'hb0) : (8'hbb))) : ((-(8'ha1)) ? ((8'hac) ? (8'hb7) : (8'ha0)) : ((8'hbd) - (8'hb4)))))), 
parameter param95 = ((^~((((8'hac) ? param94 : param94) >>> ((8'hb5) ? param94 : param94)) ^~ (8'h9d))) ? ((param94 > ((^param94) <<< {(8'hba), (8'hb6)})) ? param94 : (^~((param94 ? param94 : param94) ? (+param94) : (^(8'hbc))))) : {((((8'ha2) ? param94 : param94) >> (param94 < param94)) == param94), (8'ha4)}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire85;
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire64,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire85,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (($signed({wire2, wire5}) ^ {(-(wire3 | wire5)), wire0}) ?
                     ($unsigned(((&(8'haf)) || {wire4})) ?
                         wire5 : {$signed(wire4)}) : (wire4 != wire1));
  assign wire7 = $signed($signed($unsigned(wire5)));
  assign wire8 = ($signed($unsigned(((wire7 ? wire3 : wire2) ?
                         (|wire4) : {wire4}))) ?
                     (wire1[(3'h4):(1'h1)] || (wire4[(4'h9):(3'h6)] ?
                         (~|(|(8'ha4))) : $unsigned($unsigned(wire1)))) : wire5);
  assign wire9 = wire1[(4'h9):(2'h2)];
  assign wire10 = $unsigned({wire4});
  module11 #() modinst65 (.wire15(wire10), .wire14(wire8), .wire16(wire6), .wire13(wire0), .wire12(wire9), .clk(clk), .y(wire64));
  assign wire66 = ((8'ha6) ?
                      wire9[(3'h4):(1'h0)] : ($unsigned($unsigned($unsigned(wire0))) ?
                          $unsigned($signed($signed(wire8))) : wire64[(4'h8):(3'h5)]));
  assign wire67 = ((^$signed($signed(wire8))) >= $unsigned((8'hb5)));
  assign wire68 = $signed(wire7[(2'h2):(1'h0)]);
  assign wire69 = ((wire9 ?
                          $signed(wire9[(4'he):(1'h1)]) : wire6[(5'h10):(2'h2)]) ?
                      wire67 : wire3[(1'h1):(1'h1)]);
  module70 #() modinst86 (.wire72(wire6), .wire75(wire69), .wire74(wire9), .y(wire85), .wire73(wire64), .clk(clk), .wire71(wire5));
  assign wire87 = wire3;
  assign wire88 = {wire68[(5'h13):(3'h7)]};
  assign wire89 = $unsigned($signed($signed($signed({wire5, (8'h9e)}))));
  assign wire90 = (wire8[(2'h3):(1'h1)] <= $unsigned(wire69[(3'h6):(3'h6)]));
  assign wire91 = $signed($unsigned(($unsigned(wire6) > $unsigned((wire88 ?
                      wire68 : (8'haa))))));
  assign wire92 = $signed({(({wire90} ?
                              (wire0 ? wire0 : wire89) : $unsigned(wire85)) ?
                          (+wire90[(1'h0):(1'h0)]) : wire6),
                      ((|$signed(wire89)) && (wire9[(4'h8):(2'h2)] ?
                          (wire64 ? (8'ha2) : wire89) : $signed(wire10)))});
  assign wire93 = $unsigned(wire5[(5'h12):(4'ha)]);
endmodule

module module70  (y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire75;
  input wire signed [(5'h15):(1'h0)] wire74;
  input wire signed [(5'h10):(1'h0)] wire73;
  input wire [(2'h3):(1'h0)] wire72;
  input wire [(3'h6):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  assign y = {wire84,
                 wire81,
                 wire78,
                 wire77,
                 wire76,
                 reg83,
                 reg82,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire76 = $unsigned($unsigned((^wire73)));
  assign wire77 = $unsigned(((~|{wire72[(2'h2):(2'h2)]}) <<< wire73));
  assign wire78 = $unsigned($unsigned($signed((~|$unsigned(wire74)))));
  always
    @(posedge clk) begin
      reg79 <= wire71[(2'h2):(2'h2)];
      reg80 <= $unsigned((+(~|((wire76 ? wire74 : wire75) ?
          wire75 : wire78[(1'h0):(1'h0)]))));
    end
  assign wire81 = (reg79[(3'h6):(1'h1)] | reg80);
  always
    @(posedge clk) begin
      reg82 <= ($unsigned(wire71[(3'h4):(1'h1)]) << ($unsigned((&(!(7'h43)))) >= reg80[(1'h1):(1'h1)]));
      reg83 <= (wire72 == $signed(wire76[(1'h0):(1'h0)]));
    end
  assign wire84 = $unsigned(((($unsigned((7'h43)) ?
                          {wire76, wire73} : wire71) - $unsigned((^wire77))) ?
                      (-$signed($signed((8'hb6)))) : $unsigned(($signed(wire78) ^ wire73))));
endmodule

module module11
#(parameter param63 = {(({(^(8'ha3)), ((8'hb8) ? (7'h44) : (8'ha2))} ^ ((~(8'hb0)) ? {(8'ha4), (8'haf)} : ((8'h9d) ^ (8'ha9)))) ? ((~&{(8'ha9), (8'h9e)}) != (((7'h41) ? (8'hae) : (8'ha9)) ? ((8'hb5) >= (8'hb4)) : (^(8'ha6)))) : (^~({(8'hbe), (7'h42)} == (^~(8'ha2))))), (((^((7'h44) << (7'h43))) + {((8'hb3) ? (8'hab) : (8'ha7))}) ? (^~(((8'hac) ? (7'h43) : (8'ha4)) <<< ((8'hb0) > (7'h42)))) : ((((8'ha5) != (8'hb9)) <<< (!(8'hbe))) ? {(~|(8'ha6)), {(8'ha5), (8'h9d)}} : (((8'hb5) == (8'ha9)) ? (!(8'ha7)) : ((8'hbc) ? (8'ha6) : (7'h44)))))})
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  assign y = {wire61,
                 wire34,
                 wire26,
                 wire25,
                 wire18,
                 wire17,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  assign wire17 = {wire15[(1'h1):(1'h1)], wire14};
  assign wire18 = $unsigned(wire17);
  always
    @(posedge clk) begin
      if ((~^$unsigned((wire14 ? (|(wire15 < wire15)) : wire13))))
        begin
          reg19 <= $unsigned(({$unsigned(wire14[(3'h4):(3'h4)]),
                  (wire18[(2'h2):(1'h0)] ? (wire15 >= (8'hbe)) : wire12)} ?
              (~wire12) : $signed(wire12)));
          reg20 <= $signed(({$unsigned($unsigned(wire17)),
                  $unsigned($signed(wire16))} ?
              (^~((^(8'h9f)) ?
                  (reg19 ?
                      wire17 : wire15) : (~wire18))) : (~|wire18[(1'h0):(1'h0)])));
          reg21 <= (($unsigned(wire17) == (!$signed($unsigned(reg19)))) ?
              $signed(reg20[(5'h11):(4'hb)]) : $signed($unsigned(((wire14 > wire12) | {wire16,
                  wire15}))));
          reg22 <= $unsigned(($signed(wire16[(4'hf):(3'h7)]) <<< (~|$signed(reg20[(1'h0):(1'h0)]))));
          reg23 <= (8'hb8);
        end
      else
        begin
          if ((($unsigned(wire17) ?
              (~^$unsigned($unsigned((8'hb0)))) : $signed(reg22[(4'h8):(4'h8)])) || {(~&$unsigned($unsigned(reg22))),
              $signed((~$unsigned(wire15)))}))
            begin
              reg19 <= wire16;
              reg20 <= ((~^(8'hba)) == (~(~|$signed((wire17 * reg20)))));
              reg21 <= reg20;
              reg22 <= $signed(((wire14 <= $unsigned(reg20[(1'h1):(1'h1)])) ?
                  ((&(wire12 ? reg23 : reg23)) ?
                      $unsigned((reg20 >> reg20)) : wire12) : (((wire18 ?
                          wire18 : wire18) >>> $unsigned(wire16)) ?
                      (8'ha6) : (wire14 >>> reg22))));
            end
          else
            begin
              reg19 <= $unsigned((($signed((^wire18)) || $signed(reg20)) ?
                  $unsigned(wire18[(2'h2):(2'h2)]) : (&((wire17 || reg20) ?
                      reg20 : $signed(wire17)))));
              reg20 <= wire17[(4'ha):(4'ha)];
              reg21 <= (wire16 ? wire15[(2'h3):(2'h2)] : $unsigned((^wire13)));
              reg22 <= {$unsigned({($unsigned((8'hba)) && wire18)})};
              reg23 <= reg20;
            end
        end
      reg24 <= $unsigned((8'hb1));
    end
  assign wire25 = reg22;
  assign wire26 = $unsigned(($signed((+(wire17 && wire18))) ?
                      $unsigned({{reg19}}) : reg21));
  always
    @(posedge clk) begin
      if ((8'haa))
        begin
          reg27 <= (($signed($unsigned($unsigned(wire13))) < reg22[(4'ha):(2'h3)]) && wire13[(5'h11):(4'hf)]);
          reg28 <= ((($signed($unsigned(wire14)) ?
                      {{reg24}} : $unsigned(wire16[(4'h8):(2'h3)])) ?
                  (~wire14) : $signed({wire17[(5'h14):(5'h12)]})) ?
              $unsigned((~&$signed(((7'h41) ?
                  (8'h9f) : wire13)))) : ((((wire15 ?
                      reg23 : (8'hae)) << reg27[(4'hb):(3'h4)]) ?
                  wire17[(3'h7):(1'h1)] : (-reg20)) <= (~wire18)));
        end
      else
        begin
          reg27 <= wire15[(1'h0):(1'h0)];
          reg28 <= ($signed((8'hac)) - ((((wire25 ? wire15 : wire13) > {wire18,
                      wire12}) ?
                  ((-reg27) >>> $unsigned((8'hb3))) : reg19[(4'h8):(3'h5)]) ?
              $unsigned(((reg27 ? reg23 : (8'hb0)) ?
                  reg21[(1'h0):(1'h0)] : ((8'ha6) * wire15))) : reg27));
          reg29 <= wire17;
          reg30 <= (|{$signed(wire14), $unsigned(reg22[(4'h9):(4'h8)])});
        end
      reg31 <= ($signed((wire16 ?
          (~(|(8'hb7))) : wire13[(5'h11):(4'he)])) <= (-(wire12[(2'h2):(1'h0)] * (8'haa))));
      reg32 <= $unsigned(reg31[(4'hf):(4'h9)]);
      reg33 <= reg20;
    end
  assign wire34 = ($signed(((wire14 ?
                      $unsigned(wire13) : (~|reg24)) >> $signed((reg22 == wire17)))) || {(wire18 ?
                          reg29 : reg32)});
  module35 #() modinst62 (wire61, clk, reg20, reg28, wire34, wire26, reg19);
endmodule

module module35
#(parameter param60 = {(((((8'hbc) ? (8'ha9) : (8'hb3)) ? {(8'hb0)} : (&(8'hbd))) ? (8'ha9) : {{(7'h40), (8'ha1)}, {(8'ha9)}}) << (^~(((8'ha0) << (8'hba)) ? ((8'hbc) << (8'ha4)) : {(8'hb6)}))), (-(({(8'had)} || ((8'hbc) ? (7'h44) : (8'h9e))) | (~|(^(8'hbc)))))})
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire40;
  input wire [(4'h8):(1'h0)] wire39;
  input wire signed [(5'h10):(1'h0)] wire38;
  input wire signed [(3'h6):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  assign y = {wire59,
                 wire43,
                 wire42,
                 wire41,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
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
                 reg44,
                 (1'h0)};
  assign wire41 = (^wire39);
  assign wire42 = (wire38[(4'hd):(1'h1)] ?
                      wire36 : (wire38 ?
                          $signed($unsigned($signed(wire38))) : (+wire39)));
  assign wire43 = ((($signed(wire36[(3'h4):(1'h1)]) ? wire36 : (~|wire36)) ?
                          $unsigned($signed({wire37})) : {(^~$signed(wire41)),
                              ($unsigned(wire36) ^ {wire36, wire37})}) ?
                      $signed(wire41[(2'h2):(2'h2)]) : (+$signed($signed($signed(wire36)))));
  always
    @(posedge clk) begin
      if ($signed((~^((~^(wire40 ? wire39 : wire40)) > (((8'ha7) & wire36) ?
          (wire39 && wire38) : (wire37 ? wire43 : (8'hae)))))))
        begin
          if ($unsigned(wire37))
            begin
              reg44 <= wire36[(4'h8):(3'h6)];
              reg45 <= $signed(wire40);
              reg46 <= ($unsigned((^$unsigned((8'haf)))) ?
                  (+(wire36 ?
                      wire39 : (wire39 ?
                          $signed(wire39) : (wire37 ?
                              wire43 : wire40)))) : (8'hb4));
            end
          else
            begin
              reg44 <= (wire38[(4'h9):(3'h4)] - (8'hab));
              reg45 <= ((((~reg46) >> $unsigned(((8'hb2) ? wire42 : (7'h44)))) ?
                  $unsigned({((8'hb1) & wire39),
                      (wire38 ^~ wire42)}) : {(!$unsigned(reg44)),
                      wire43}) + $unsigned($unsigned((~|$signed(wire38)))));
            end
          if (wire38[(1'h0):(1'h0)])
            begin
              reg47 <= (({(~^$unsigned(wire37))} ?
                      wire36 : $unsigned(($signed(wire40) ?
                          wire39[(2'h2):(1'h0)] : $unsigned(wire41)))) ?
                  $unsigned((|wire37[(3'h6):(2'h3)])) : ((({wire42, reg46} ?
                          (&wire36) : $signed(reg44)) ?
                      $signed($signed(wire39)) : (-(wire38 && wire36))) << wire43[(3'h6):(2'h3)]));
              reg48 <= wire38[(4'hc):(3'h6)];
              reg49 <= (&{$unsigned((-wire40[(5'h11):(5'h11)]))});
              reg50 <= ($unsigned(($unsigned($unsigned((8'hb7))) ?
                      $unsigned((-reg47)) : reg48[(3'h6):(3'h6)])) ?
                  $unsigned(wire41[(1'h0):(1'h0)]) : (^~$signed({wire37})));
              reg51 <= $signed(reg49);
            end
          else
            begin
              reg47 <= (~^reg49[(3'h6):(3'h4)]);
              reg48 <= (|$signed((8'hba)));
              reg49 <= $signed($unsigned((-$signed(wire43))));
              reg50 <= (wire41 ^ wire40);
              reg51 <= {reg51};
            end
        end
      else
        begin
          reg44 <= wire41[(2'h3):(2'h2)];
          reg45 <= ($unsigned((($signed(reg48) ?
              $signed(reg48) : $unsigned(reg48)) < $unsigned({wire41}))) >> (((-((7'h44) < wire38)) & reg47[(2'h2):(2'h2)]) ^ (~|{{reg45,
                  reg45},
              ((7'h44) ? (8'hb3) : reg50)})));
          if ($unsigned((($signed((~reg50)) ^~ $unsigned($signed(reg49))) ?
              reg45[(3'h6):(1'h1)] : reg44[(2'h3):(2'h2)])))
            begin
              reg46 <= $signed(wire40[(5'h10):(5'h10)]);
              reg47 <= $unsigned((~&(((^~wire37) + (~reg47)) ?
                  (wire38 == $unsigned(reg47)) : $unsigned($signed((8'hb9))))));
            end
          else
            begin
              reg46 <= wire42;
              reg47 <= (~(reg50 ? (!wire43) : $unsigned(reg45[(2'h2):(2'h2)])));
            end
        end
      if (($unsigned($signed($signed((^~wire36)))) || wire37[(2'h3):(2'h2)]))
        begin
          if ((~&reg49))
            begin
              reg52 <= wire39;
              reg53 <= (+wire39[(2'h3):(1'h1)]);
              reg54 <= {$unsigned($unsigned(wire38[(4'hf):(2'h2)])),
                  (~((reg45 || $unsigned((8'ha6))) ?
                      (+(^wire40)) : ($signed((8'hb8)) ?
                          $signed(wire42) : $unsigned(wire43))))};
            end
          else
            begin
              reg52 <= ($signed(($unsigned((reg47 ?
                      wire43 : reg51)) >= ((!wire41) == wire36))) ?
                  $signed($signed(reg53)) : ((|(reg52[(2'h2):(2'h2)] ^ reg47)) - wire42));
              reg53 <= reg53[(3'h6):(1'h0)];
              reg54 <= (8'ha1);
              reg55 <= $unsigned({$signed($unsigned($unsigned(wire42)))});
            end
          reg56 <= ((reg48[(4'hf):(4'hb)] ?
                  (reg46[(3'h7):(3'h4)] >= {(wire42 ? reg44 : wire41),
                      wire37[(1'h0):(1'h0)]}) : (({reg55} ?
                          wire43 : (reg52 & reg53)) ?
                      wire37 : (~|{reg51}))) ?
              reg55 : $unsigned($unsigned($unsigned((~&wire42)))));
        end
      else
        begin
          reg52 <= reg56;
          if (wire40[(5'h11):(3'h6)])
            begin
              reg53 <= reg52[(1'h0):(1'h0)];
              reg54 <= $unsigned((8'ha5));
              reg55 <= (reg50[(1'h1):(1'h1)] ? reg55 : (8'hbd));
              reg56 <= wire38[(3'h6):(3'h6)];
              reg57 <= $signed($unsigned({(wire42[(3'h4):(2'h2)] ^~ (+reg54)),
                  (((8'hbe) <<< reg44) * (wire39 <= reg51))}));
            end
          else
            begin
              reg53 <= (|wire36[(3'h4):(2'h2)]);
              reg54 <= reg53[(1'h0):(1'h0)];
            end
          reg58 <= reg54[(3'h7):(3'h6)];
        end
    end
  assign wire59 = (($unsigned(({reg45} + (~&wire36))) ?
                          $unsigned(($signed(reg52) > reg50[(2'h3):(1'h1)])) : $signed(reg44)) ?
                      (!(8'hb5)) : $signed($unsigned(reg51[(2'h3):(2'h2)])));
endmodule
