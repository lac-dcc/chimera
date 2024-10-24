module top
#(parameter param112 = (((~(|{(8'h9f), (8'ha1)})) == (~&(((8'ha0) && (8'hb2)) && ((8'h9d) ? (8'ha4) : (8'h9c))))) ? {(&((~|(8'hbd)) ? ((8'hb3) ? (8'hb4) : (8'h9f)) : (~&(8'hbe)))), ((((8'hab) == (8'hac)) + ((8'hb3) >>> (8'ha3))) ? (~|((8'hb1) >>> (8'ha7))) : (((8'haf) ? (8'haa) : (8'ha6)) ~^ ((8'ha1) ? (8'hac) : (8'had))))} : ({({(8'ha4), (8'hbf)} ? (~|(8'hae)) : ((8'had) ? (8'ha2) : (8'hbf))), (8'hbb)} | (-((8'h9d) ? (^(8'h9d)) : {(8'ha5)})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire109;
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire111, wire5, wire7, wire109, reg6, (1'h0)};
  assign wire5 = ($unsigned($signed(($unsigned(wire2) <<< ((8'hb5) ^~ wire1)))) > (^{wire2,
                     $signed((wire2 ? wire0 : wire1))}));
  always
    @(posedge clk) begin
      reg6 <= (+(($unsigned((^(7'h41))) < (-(wire3 << wire3))) ?
          $unsigned(wire3) : wire2[(4'hd):(4'hd)]));
    end
  assign wire7 = (((((~|wire5) ? (^~wire2) : (wire0 ? reg6 : reg6)) ?
                         (!(wire3 ?
                             wire3 : wire4)) : wire3[(1'h1):(1'h1)]) >>> wire2[(4'h9):(3'h5)]) ?
                     ((wire4 | $unsigned($unsigned((8'ha4)))) * $signed(wire3[(3'h7):(3'h4)])) : $unsigned($signed(((wire0 | wire2) | (wire0 | wire2)))));
  module8 #() modinst110 (wire109, clk, wire1, wire0, reg6, wire4);
  assign wire111 = {$unsigned($unsigned(wire5[(1'h0):(1'h0)]))};
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire97;
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  assign y = {wire46,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire48,
                 wire49,
                 wire97,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire13 = wire11;
  assign wire14 = wire13;
  assign wire15 = wire14;
  assign wire16 = (($signed(wire13) ?
                      $signed(wire11[(2'h2):(1'h0)]) : ($signed(((8'hbe) ?
                              wire15 : (8'hb1))) ?
                          $signed((wire14 ? wire12 : wire13)) : ((&wire12) ?
                              wire14 : (7'h41)))) | {(!(((7'h41) && wire14) << $unsigned(wire15))),
                      $signed((wire11 ? wire10[(4'h9):(4'h9)] : (^~wire12)))});
  assign wire17 = wire14;
  assign wire18 = (({$signed($signed(wire10)),
                          $unsigned((wire10 << wire17))} < $unsigned(($unsigned(wire17) ?
                          {wire14, wire11} : wire11))) ?
                      $unsigned((&($signed(wire9) ?
                          (~|(8'ha9)) : $unsigned(wire10)))) : $unsigned((8'hac)));
  module19 #() modinst47 (wire46, clk, wire11, wire10, wire17, wire14, wire18);
  assign wire48 = wire11;
  assign wire49 = $signed((wire14 | wire46));
  module50 #() modinst98 (.wire51(wire48), .y(wire97), .wire52(wire16), .wire54(wire13), .wire55(wire17), .clk(clk), .wire53(wire18));
  always
    @(posedge clk) begin
      reg99 <= wire49;
      reg100 <= wire12[(4'h8):(3'h7)];
      if (wire10[(1'h1):(1'h0)])
        begin
          reg101 <= wire14[(3'h6):(2'h2)];
        end
      else
        begin
          reg101 <= (7'h42);
          reg102 <= reg99;
          reg103 <= wire97;
          if (((&$signed((!$unsigned(wire11)))) + (($unsigned(wire12[(1'h1):(1'h1)]) ^ $signed(wire49)) ?
              $signed((wire15 >= (8'ha0))) : reg99)))
            begin
              reg104 <= (wire9[(3'h5):(3'h4)] ?
                  $unsigned((!$unsigned((wire18 ?
                      wire48 : wire18)))) : wire48[(2'h3):(2'h2)]);
              reg105 <= $signed(wire16);
              reg106 <= (^~$signed({reg104, $unsigned($unsigned(wire18))}));
              reg107 <= $unsigned(({$signed($unsigned((8'h9f)))} && reg105[(4'h8):(4'h8)]));
            end
          else
            begin
              reg104 <= $unsigned(((((reg104 ?
                  wire13 : (8'hb9)) > $signed(wire97)) >> {{wire18,
                      (8'ha1)}}) << ((8'ha6) ?
                  ((reg100 ? (8'hb9) : wire18) ^ (reg105 ?
                      wire97 : reg102)) : $unsigned((wire16 > reg107)))));
              reg105 <= (wire17 ? (~|wire9[(2'h3):(1'h1)]) : wire11);
              reg106 <= $unsigned((wire15 ?
                  ({(wire18 < wire13)} ?
                      (8'hba) : $signed(wire12[(4'he):(4'h9)])) : wire11));
              reg107 <= $unsigned({reg107});
              reg108 <= reg104;
            end
        end
    end
endmodule

module module50
#(parameter param95 = (({((&(8'hb7)) >= {(8'ha6)})} ? (8'haf) : (-(((8'ha1) >= (8'hac)) ? ((8'hbb) || (7'h43)) : ((8'haa) + (8'hae))))) <<< (8'hb8)), 
parameter param96 = (^((~^((8'hbf) ? param95 : (param95 == (8'ha6)))) ~^ (((^~param95) ? (param95 && param95) : (~^param95)) ^~ ((8'ha8) ? (param95 ? param95 : (8'h9c)) : ((8'ha7) ? param95 : param95))))))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire55;
  input wire [(4'he):(1'h0)] wire54;
  input wire signed [(5'h12):(1'h0)] wire53;
  input wire [(5'h13):(1'h0)] wire52;
  input wire [(5'h14):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire90,
                 wire89,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire58,
                 wire57,
                 wire56,
                 reg92,
                 reg91,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 (1'h0)};
  assign wire56 = $unsigned((!wire54));
  assign wire57 = wire51[(3'h4):(1'h0)];
  assign wire58 = {$unsigned(wire57),
                      $signed({(((8'hae) || wire52) ?
                              $unsigned(wire57) : (wire57 > wire57))})};
  always
    @(posedge clk) begin
      if ({wire57})
        begin
          reg59 <= wire58[(3'h4):(2'h2)];
          reg60 <= (~^($unsigned((-(wire54 || wire51))) ?
              ($unsigned(wire51[(5'h14):(4'ha)]) ?
                  (^~{wire56, wire53}) : ($unsigned(wire52) | (wire58 ?
                      wire53 : reg59))) : wire58[(2'h3):(1'h0)]));
        end
      else
        begin
          reg59 <= wire55[(1'h1):(1'h1)];
          if (wire54[(3'h5):(2'h2)])
            begin
              reg60 <= ($unsigned(wire51[(4'hb):(1'h1)]) ~^ wire51[(4'ha):(1'h0)]);
              reg61 <= reg59;
            end
          else
            begin
              reg60 <= wire51;
              reg61 <= wire54;
              reg62 <= {$unsigned($signed((wire51[(4'h8):(3'h7)] || (wire54 >> wire53))))};
              reg63 <= reg62[(4'h8):(4'h8)];
            end
        end
      if ((~&reg61[(3'h4):(1'h0)]))
        begin
          if ((((~|wire55) ^ {{$unsigned(wire56)},
                  (wire53 << $unsigned(wire53))}) ?
              $unsigned((~$unsigned($unsigned(wire54)))) : $signed(((^~(^wire52)) >= (8'h9d)))))
            begin
              reg64 <= (($unsigned(((reg61 | wire53) < (7'h42))) << wire53) & ((|({wire58,
                      wire55} ?
                  (8'haa) : (reg60 ? reg63 : wire51))) ^ $unsigned(reg59)));
              reg65 <= {(|reg59[(4'ha):(4'h8)])};
            end
          else
            begin
              reg64 <= (reg59 ?
                  $unsigned($signed($signed((-wire51)))) : wire56);
              reg65 <= (($signed((^(wire56 | (8'hbe)))) ? wire56 : reg65) ?
                  (reg62 * (~$unsigned($unsigned((8'hb6))))) : (-(~wire56[(2'h2):(2'h2)])));
            end
          reg66 <= (~&reg65[(2'h2):(2'h2)]);
          if (((wire52[(4'hc):(4'h9)] ?
                  wire54[(4'h9):(1'h0)] : $signed($unsigned(wire51[(3'h7):(1'h1)]))) ?
              $unsigned(wire55) : (reg61[(1'h0):(1'h0)] <= ($signed((~^reg64)) ?
                  ({reg62} ^~ $signed(wire55)) : (~$signed(wire55))))))
            begin
              reg67 <= (~(!($unsigned($signed(reg60)) ?
                  {(8'hb1)} : reg59[(3'h5):(3'h5)])));
              reg68 <= (((8'h9e) ? reg65 : $unsigned((reg66 >>> (^(8'hba))))) ?
                  $signed((wire51 ?
                      {wire53[(2'h3):(1'h0)]} : wire58[(4'h8):(4'h8)])) : (+reg64[(1'h0):(1'h0)]));
            end
          else
            begin
              reg67 <= {(wire52 ?
                      reg63 : (~^{wire52[(5'h10):(4'hd)], {reg64}}))};
              reg68 <= wire54[(4'he):(2'h2)];
              reg69 <= (wire57 ? reg64 : (|reg65));
              reg70 <= wire54;
            end
          if ({wire53[(4'he):(4'h8)], {(~$unsigned(wire57)), reg60}})
            begin
              reg71 <= ($signed((~|((8'ha5) <= (wire57 ? reg70 : wire57)))) ?
                  (+(^wire51[(5'h10):(1'h1)])) : ($signed($unsigned($signed((8'hb7)))) & wire52[(5'h11):(3'h4)]));
              reg72 <= wire51;
              reg73 <= $signed(wire52[(5'h12):(4'hb)]);
            end
          else
            begin
              reg71 <= reg66[(4'h9):(4'h9)];
              reg72 <= reg70;
            end
        end
      else
        begin
          if ($signed($unsigned(({wire54, $signed(reg62)} ^~ ((reg69 ?
                  wire54 : wire55) ?
              $unsigned(wire57) : $unsigned(reg60))))))
            begin
              reg64 <= $signed((($unsigned($signed(reg72)) != ((reg67 > (8'ha4)) ?
                  wire58 : $signed(wire53))) || reg64));
            end
          else
            begin
              reg64 <= $unsigned(({(~wire58[(3'h5):(2'h3)])} ?
                  ((((8'haa) >> wire52) ?
                      ((8'hb6) << reg72) : (+wire57)) <= ((8'ha2) ~^ ((8'ha1) - reg71))) : reg68[(2'h3):(1'h1)]));
              reg65 <= {({$signed(reg59)} ?
                      {$unsigned($signed(reg65))} : (!reg59[(1'h1):(1'h1)])),
                  reg70};
            end
          reg66 <= (($signed($unsigned($unsigned(reg70))) <<< $signed(((~|(8'hac)) ^~ reg60[(2'h3):(1'h1)]))) >> wire56);
          reg67 <= (~(reg59[(4'hb):(3'h6)] ?
              (^(reg71 <= (reg62 >= reg72))) : (((+wire55) ?
                      $signed((8'hb0)) : wire58) ?
                  {$unsigned(reg65),
                      $signed(wire52)} : ($unsigned(reg67) | $signed(reg61)))));
          if (reg66)
            begin
              reg68 <= (~|(reg59[(4'he):(1'h0)] ?
                  (((wire55 * reg71) || $signed(wire54)) - {$signed((8'h9f))}) : ((reg59 ?
                          (wire54 ? reg64 : reg68) : $unsigned(reg66)) ?
                      $unsigned(((7'h44) ? wire52 : reg73)) : reg68)));
              reg69 <= ((~{reg66[(2'h3):(2'h2)]}) == {(^$unsigned((reg70 ?
                      reg72 : reg73))),
                  {$unsigned((reg69 ? reg62 : wire53)),
                      {(wire51 ? reg67 : (8'hb5)), (^~(7'h43))}}});
              reg70 <= reg66;
            end
          else
            begin
              reg68 <= (~^(($unsigned((~|reg63)) ^~ ((wire55 ? reg66 : reg60) ?
                      {wire53} : $unsigned(reg62))) ?
                  (8'haa) : ((((8'h9c) << wire51) <<< $unsigned(reg73)) ?
                      (8'hba) : (~^$signed(wire57)))));
            end
          reg71 <= ((($signed(wire51) == $signed(wire54[(4'h8):(3'h7)])) ?
                  reg72 : ({(wire58 - reg65)} ?
                      ($signed(reg65) == $unsigned(reg68)) : wire51)) ?
              $signed((8'hbd)) : reg71);
        end
      reg74 <= $unsigned($signed(wire56[(1'h0):(1'h0)]));
    end
  assign wire75 = $signed(reg69[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg76 <= ($unsigned(reg69) != wire56[(3'h4):(2'h2)]);
    end
  assign wire77 = reg64[(4'hd):(1'h1)];
  assign wire78 = ($signed(wire58[(2'h3):(1'h0)]) - (($signed($unsigned((7'h41))) < reg74[(1'h1):(1'h1)]) ?
                      ((~&reg73) << (8'hbc)) : {reg59[(1'h1):(1'h1)]}));
  assign wire79 = wire51[(4'hd):(3'h6)];
  assign wire80 = reg74[(2'h3):(1'h1)];
  assign wire81 = ((wire80 * reg76) ?
                      reg67[(3'h4):(1'h0)] : reg66[(4'hc):(4'ha)]);
  assign wire82 = $signed($unsigned((wire58 ?
                      (8'ha9) : $unsigned($signed(wire53)))));
  assign wire83 = ((reg69 ?
                      (-{((8'hbf) ?
                              wire54 : wire81)}) : reg65[(1'h1):(1'h1)]) ^ (reg74 - wire75));
  always
    @(posedge clk) begin
      reg84 <= $unsigned($signed(((^~(reg63 ? reg62 : (8'ha2))) ?
          $signed((reg76 ? wire80 : reg65)) : ($signed(wire57) - {reg71}))));
      reg85 <= ($unsigned($signed({$unsigned((8'h9e)),
          (~&(8'hab))})) | $unsigned($unsigned($signed((|wire81)))));
      reg86 <= (((((|reg85) - (wire52 > reg74)) || wire78) == $unsigned($unsigned((~^reg62)))) >>> (~^$unsigned((reg84 ^ wire79))));
      reg87 <= (reg65 ^~ (reg63 ?
          wire57[(1'h1):(1'h1)] : reg72[(3'h6):(2'h2)]));
      reg88 <= ($signed((&$signed($signed(wire77)))) + {reg87[(3'h6):(3'h6)],
          reg64});
    end
  assign wire89 = ({wire55,
                      $signed(($signed(wire57) ?
                          reg68 : reg72))} >>> ($signed((wire75[(2'h2):(2'h2)] - (7'h41))) ?
                      wire58 : wire82[(1'h1):(1'h1)]));
  assign wire90 = (^~(wire51[(4'hf):(3'h5)] ?
                      $signed(((reg63 ? wire58 : (8'ha6)) >= (wire79 ?
                          reg74 : reg68))) : wire52[(5'h11):(4'he)]));
  always
    @(posedge clk) begin
      reg91 <= (~|wire83[(4'hb):(4'hb)]);
      reg92 <= $unsigned({$unsigned((reg70[(3'h4):(1'h1)] << $unsigned(reg86)))});
    end
  assign wire93 = {reg65[(1'h0):(1'h0)]};
  assign wire94 = (wire80 ?
                      $signed(($signed($signed(wire55)) << reg91[(1'h0):(1'h0)])) : $signed($signed(($signed(reg87) >>> ((8'hac) <<< wire77)))));
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  assign y = {wire45,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg35,
                 (1'h0)};
  assign wire25 = ((((~|(+wire21)) ?
                          ($unsigned(wire21) | (wire21 >>> (7'h44))) : ($signed(wire21) + $unsigned(wire23))) < wire20) ?
                      (&wire23) : $signed($unsigned($unsigned($signed(wire21)))));
  assign wire26 = $signed(wire24);
  assign wire27 = (($signed(wire24) > wire24) ?
                      (wire20 ^ (^~$unsigned($signed(wire21)))) : $signed(({(~wire26)} && $signed({wire22,
                          wire24}))));
  assign wire28 = $signed((~|$unsigned((^wire25[(3'h6):(3'h5)]))));
  assign wire29 = (~^$signed((!(!(~&(8'hbd))))));
  assign wire30 = (((((wire23 ? wire27 : wire27) > $unsigned(wire28)) ?
                          ((7'h43) >> (!wire20)) : wire29[(3'h5):(2'h3)]) * $signed(wire20[(4'hc):(1'h1)])) ?
                      wire28[(3'h6):(1'h1)] : wire28);
  assign wire31 = ({({(wire27 ? wire26 : wire26),
                          (wire26 ? wire23 : wire27)} ^~ wire23),
                      ($unsigned(wire23) ?
                          {(~|wire28)} : $signed($signed((8'hb2))))} << $signed(($unsigned($unsigned((8'ha4))) ?
                      wire21 : wire28)));
  assign wire32 = ($signed($signed((+wire31[(1'h1):(1'h1)]))) > $signed(($unsigned(wire25) ?
                      wire23[(3'h4):(3'h4)] : (7'h41))));
  assign wire33 = wire21[(1'h0):(1'h0)];
  assign wire34 = ((($unsigned({wire21,
                      wire31}) <<< $unsigned($unsigned(wire21))) < {($signed((8'hbb)) ?
                          (~&wire29) : wire21[(4'h9):(4'h8)])}) && $signed({$signed((wire27 ^~ wire23)),
                      wire25}));
  always
    @(posedge clk) begin
      reg35 <= ((-($signed((wire24 ^ wire33)) == $unsigned(wire27[(5'h13):(2'h3)]))) == wire32);
    end
  assign wire36 = (($unsigned(wire32[(3'h4):(1'h0)]) ?
                          {wire32} : ($unsigned(wire21[(4'ha):(4'ha)]) ?
                              $unsigned(wire31) : wire32[(2'h3):(2'h2)])) ?
                      ($signed(wire29[(1'h0):(1'h0)]) ?
                          wire32 : $signed($unsigned({wire33,
                              wire26}))) : {((8'hb4) - {((8'ha7) > (8'h9f))}),
                          (wire30 ?
                              $unsigned(wire28[(4'hd):(4'h8)]) : {(wire20 << wire25)})});
  assign wire37 = $unsigned(wire30);
  assign wire38 = $unsigned($signed(wire29));
  assign wire39 = (((((wire26 ? wire34 : wire21) ?
                          (^~wire36) : $signed(wire34)) > $signed($signed(wire26))) * ((+$unsigned(wire37)) | ($unsigned(wire30) >>> $signed(wire24)))) ?
                      $unsigned(wire38[(3'h4):(3'h4)]) : $unsigned(wire29[(3'h7):(2'h3)]));
  assign wire40 = ((~&(^($signed((8'hb8)) < wire30[(1'h1):(1'h0)]))) ?
                      ($signed((+wire39[(3'h4):(2'h3)])) && (8'ha4)) : (~^{($unsigned(wire36) ?
                              wire39 : wire25)}));
  always
    @(posedge clk) begin
      reg41 <= ({$signed(((wire38 << wire30) ?
                  $signed(wire33) : wire31[(2'h2):(2'h2)])),
              ({(wire27 ? wire38 : (7'h41)), wire32} ?
                  $unsigned((wire23 ^ wire32)) : wire38[(2'h2):(1'h0)])} ?
          $unsigned(wire31) : (wire40 ? wire31 : wire31));
      reg42 <= (8'ha9);
      reg43 <= (($signed(((&(8'hbc)) <= (reg35 != wire31))) == (((reg42 | wire40) ?
              ((7'h42) + wire24) : wire26[(3'h5):(2'h3)]) > wire32)) ?
          wire24[(2'h2):(1'h0)] : $unsigned((($signed(wire25) + $unsigned((8'hbc))) ?
              (^$unsigned(wire34)) : wire28)));
      reg44 <= (($signed(reg43[(4'ha):(2'h2)]) + (((wire31 <<< wire34) ?
          wire26[(3'h7):(3'h6)] : (^wire36)) - (wire40[(1'h1):(1'h0)] || $signed((8'hb5))))) <<< $signed(wire37[(3'h5):(1'h0)]));
    end
  assign wire45 = $unsigned(wire38[(1'h1):(1'h1)]);
endmodule
