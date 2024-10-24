module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire185;
  wire [(5'h15):(1'h0)] wire184;
  wire signed [(5'h12):(1'h0)] wire178;
  wire signed [(5'h10):(1'h0)] wire177;
  wire signed [(4'hf):(1'h0)] wire176;
  wire [(4'hd):(1'h0)] wire175;
  wire [(5'h14):(1'h0)] wire173;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire181;
  wire [(4'ha):(1'h0)] wire182;
  reg [(4'he):(1'h0)] reg180 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire173,
                 wire4,
                 wire5,
                 wire91,
                 wire181,
                 wire182,
                 reg180,
                 (1'h0)};
  assign wire4 = (8'hb7);
  assign wire5 = ({($unsigned($signed(wire2)) ?
                             $signed((wire2 ? wire2 : wire0)) : wire2),
                         (({wire1} & wire1) ?
                             ((wire4 > wire4) ?
                                 ((8'hb0) ?
                                     wire0 : wire2) : (^wire1)) : $signed($signed(wire0)))} ?
                     $unsigned($unsigned(((wire0 ? wire2 : (8'ha8)) ?
                         $unsigned(wire1) : ((8'hb9) || (8'hb8))))) : $unsigned((|$unsigned($unsigned(wire0)))));
  module6 #() modinst92 (wire91, clk, wire5, wire0, wire1, wire4, wire3);
  module93 #() modinst174 (.wire94(wire91), .clk(clk), .wire97(wire1), .y(wire173), .wire95(wire5), .wire96(wire4));
  assign wire175 = $signed(wire3);
  assign wire176 = {$unsigned((^~{(-wire3)})), $unsigned($signed(wire2))};
  assign wire177 = $signed($signed(wire2[(3'h7):(1'h0)]));
  module98 #() modinst179 (wire178, clk, wire2, wire3, wire177, wire0, wire5);
  always
    @(posedge clk) begin
      reg180 <= $unsigned(wire176);
    end
  assign wire181 = wire0;
  module127 #() modinst183 (wire182, clk, wire0, wire2, wire3, wire181, wire173);
  assign wire184 = (~^{{((wire178 && (8'ha1)) || (8'hbb))}});
  assign wire185 = (!(|wire177));
endmodule

module module93  (y, clk, wire94, wire95, wire96, wire97);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire94;
  input wire signed [(5'h15):(1'h0)] wire95;
  input wire [(5'h13):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire172;
  wire [(4'he):(1'h0)] wire171;
  wire signed [(2'h3):(1'h0)] wire121;
  wire [(4'hc):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire169;
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire121,
                 wire123,
                 wire124,
                 wire125,
                 wire169,
                 reg126,
                 (1'h0)};
  module98 #() modinst122 (wire121, clk, wire94, wire97, wire96, wire95, (7'h41));
  assign wire123 = (^~wire94);
  assign wire124 = {(($signed(wire94) ?
                           (wire96 ?
                               wire121 : $signed(wire94)) : $signed((&wire123))) & (!$unsigned($signed(wire96))))};
  assign wire125 = (+((&wire123[(3'h6):(3'h4)]) ^ ((~^(^wire124)) ^~ ($unsigned(wire94) ?
                       $unsigned(wire94) : (wire97 > wire94)))));
  always
    @(posedge clk) begin
      reg126 <= wire96;
    end
  module127 #() modinst170 (.y(wire169), .wire132(wire97), .wire129(wire94), .wire128(wire95), .wire130(wire124), .clk(clk), .wire131(wire96));
  assign wire171 = $signed(({($signed(wire96) ?
                           wire96 : wire123[(4'h9):(2'h3)])} || $signed($unsigned((&(8'hb6))))));
  assign wire172 = ((&(wire124[(2'h3):(1'h0)] == $unsigned(wire96))) << (($signed($unsigned(wire96)) - (wire123[(1'h1):(1'h1)] ?
                           $signed(wire97) : wire124[(2'h3):(2'h2)])) ?
                       (8'hae) : ((wire97[(2'h3):(2'h2)] ?
                           $unsigned(wire121) : $signed(wire125)) ^~ wire96)));
endmodule

module module6
#(parameter param89 = {((8'ha9) ? ({((8'ha9) ? (8'hbb) : (8'hb2))} >> (((7'h41) <= (8'hb5)) ? (~|(8'h9f)) : ((8'haf) ? (8'hbf) : (8'ha5)))) : (|(8'ha8))), ((({(7'h42)} ? ((8'h9c) != (8'ha2)) : (8'hb2)) <<< (~|((8'ha6) ? (8'ha7) : (8'hb7)))) == ((((8'ha4) + (8'ha3)) - (~&(7'h41))) ? (((8'hb0) + (8'hb9)) ? {(8'hbf)} : (|(8'hb3))) : (((7'h41) ? (8'ha2) : (8'haf)) ? ((8'ha0) >> (8'haf)) : (~|(7'h44)))))}, 
parameter param90 = (({(param89 ? (param89 >>> param89) : (param89 ? param89 : (7'h41)))} - ({(param89 * param89), (param89 > param89)} ? {{(7'h44)}} : ((&param89) ^~ (~&param89)))) <<< param89))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire12;
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire85,
                 wire74,
                 wire71,
                 wire52,
                 wire51,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire12,
                 reg73,
                 reg72,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire12 = (-(!wire9));
  module13 #() modinst45 (.wire16(wire8), .y(wire44), .wire15(wire9), .wire17(wire7), .clk(clk), .wire14(wire11));
  assign wire46 = $signed($unsigned($unsigned($unsigned($unsigned(wire10)))));
  assign wire47 = wire9[(5'h11):(4'he)];
  assign wire48 = ($signed({$unsigned($unsigned(wire47)),
                      ($unsigned(wire47) ?
                          wire47 : $signed(wire11))}) != ((^~wire10[(3'h4):(2'h3)]) < ($unsigned(wire11) ?
                      ({wire46} ?
                          wire47 : wire9[(5'h14):(4'he)]) : wire8[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg49 <= {wire12[(3'h4):(1'h0)],
          $unsigned($unsigned($signed(wire12[(1'h1):(1'h1)])))};
      reg50 <= wire46;
    end
  assign wire51 = ((-$unsigned(({(8'hb6)} ?
                          wire47[(4'hb):(1'h1)] : (!(8'hbc))))) ?
                      $signed((^~({reg49} >>> ((8'hb0) ?
                          (8'h9f) : (7'h40))))) : wire10[(1'h0):(1'h0)]);
  assign wire52 = ((wire46 ?
                      (wire47[(4'hf):(4'hb)] ?
                          (^{wire10,
                              reg50}) : wire10[(3'h6):(1'h1)]) : reg49[(1'h1):(1'h1)]) * $signed((~&wire9)));
  always
    @(posedge clk) begin
      reg53 <= $unsigned(wire7[(5'h10):(2'h2)]);
      if (wire52)
        begin
          reg54 <= wire51;
          reg55 <= wire8[(1'h1):(1'h1)];
          reg56 <= {$unsigned(((^~wire44[(1'h1):(1'h0)]) ?
                  ((8'hba) ?
                      wire10[(3'h7):(3'h7)] : wire9) : (reg50[(3'h6):(1'h1)] ?
                      (&reg50) : $signed(reg49))))};
          reg57 <= $signed((8'ha7));
          if (wire8)
            begin
              reg58 <= ({reg54[(1'h0):(1'h0)]} ?
                  $signed((wire12[(3'h6):(3'h6)] ?
                      (7'h43) : (wire46 <<< reg53))) : (!($unsigned(wire10[(1'h0):(1'h0)]) << reg53[(3'h7):(3'h7)])));
              reg59 <= (wire46[(3'h7):(1'h1)] >> reg55);
              reg60 <= {(^(wire47[(4'hf):(3'h5)] == ($signed((7'h43)) ?
                      wire46 : wire8)))};
              reg61 <= $signed(((+(-reg54[(2'h2):(1'h0)])) << $unsigned(reg54[(2'h2):(1'h0)])));
            end
          else
            begin
              reg58 <= ((wire9[(3'h4):(1'h0)] * reg59) ?
                  (~&$unsigned(({reg49,
                      reg60} ~^ (+wire7)))) : {(wire12 <<< (|$signed(reg58)))});
              reg59 <= ($signed((reg56 ^ $unsigned({(8'hbd)}))) > wire47);
              reg60 <= reg61[(4'h8):(2'h2)];
            end
        end
      else
        begin
          reg54 <= $signed($signed($unsigned(((reg54 * wire47) ?
              $signed(wire11) : reg56))));
          reg55 <= $unsigned((~^wire51[(4'h9):(3'h6)]));
          reg56 <= wire7;
          reg57 <= (~|((reg57 >> $signed((reg55 ?
              reg57 : (8'ha4)))) >= $unsigned({wire46[(1'h1):(1'h0)],
              (wire7 == wire51)})));
        end
      if (wire12)
        begin
          reg62 <= wire51;
          if ((($unsigned($unsigned($signed(wire52))) ?
              reg54[(1'h0):(1'h0)] : (((-wire11) ?
                  (~&wire52) : (reg62 && wire44)) >> $unsigned((!wire46)))) >>> (8'ha6)))
            begin
              reg63 <= wire46[(3'h5):(2'h2)];
            end
          else
            begin
              reg63 <= {($unsigned($unsigned($signed(wire9))) ?
                      {(wire7 ? (~&(8'h9f)) : $unsigned(wire51)),
                          ((+wire47) ?
                              (-wire48) : $signed(reg61))} : (~^wire52))};
              reg64 <= ($signed($signed((&$unsigned(wire9)))) >>> reg63[(1'h0):(1'h0)]);
            end
          if ({{wire46}})
            begin
              reg65 <= {$unsigned(($unsigned((reg49 ?
                      reg56 : wire48)) >= wire10[(3'h5):(2'h3)])),
                  $unsigned((+$signed(reg50[(3'h7):(2'h3)])))};
              reg66 <= (~&$unsigned((~(7'h43))));
              reg67 <= $unsigned(({reg60} ?
                  {$unsigned(((8'ha8) - reg61))} : reg60[(3'h6):(2'h2)]));
              reg68 <= (wire9 == wire44[(4'ha):(4'ha)]);
              reg69 <= wire48;
            end
          else
            begin
              reg65 <= (^(8'h9d));
            end
          reg70 <= $unsigned(({reg56[(1'h0):(1'h0)], wire10} ?
              ($unsigned($signed((8'ha7))) < $unsigned(wire48[(3'h6):(2'h2)])) : ({reg53[(4'h8):(2'h2)]} | $signed((reg59 <= reg54)))));
        end
      else
        begin
          if ((8'ha1))
            begin
              reg62 <= $signed({$unsigned($signed(reg62[(2'h3):(1'h0)])),
                  wire10[(3'h6):(2'h3)]});
              reg63 <= reg53[(4'h8):(4'h8)];
              reg64 <= $unsigned(reg61);
              reg65 <= $unsigned($signed($signed(wire10)));
              reg66 <= (^~((!(8'ha8)) ? reg53 : wire47[(3'h6):(3'h6)]));
            end
          else
            begin
              reg62 <= $signed({(^~(^~reg64))});
              reg63 <= ((~^wire7) | (7'h42));
              reg64 <= reg64[(4'ha):(4'ha)];
              reg65 <= {wire44,
                  $signed(($signed(reg69) ?
                      wire9 : $unsigned((reg50 & reg70))))};
              reg66 <= {(!{(8'ha9), $unsigned((reg56 ? reg55 : (8'hbb)))})};
            end
        end
    end
  assign wire71 = wire7;
  always
    @(posedge clk) begin
      reg72 <= ($unsigned(reg58[(1'h0):(1'h0)]) ?
          $unsigned({$signed($signed(wire9))}) : (8'h9c));
      reg73 <= {$unsigned(($signed((reg70 <<< reg61)) | ((reg68 ?
                  wire47 : reg72) ?
              (-wire9) : ((8'ha1) && reg67)))),
          ((($unsigned(wire12) ? reg50 : (wire9 == reg67)) ?
              wire48 : $signed($signed(reg72))) << ($signed({wire10,
              wire12}) >>> (reg57 > (!reg65))))};
    end
  assign wire74 = (((|$unsigned($unsigned(wire10))) > (((reg55 ?
                              wire7 : reg61) ?
                          (~reg55) : $signed(reg50)) != ((~|reg68) ^ $signed(reg61)))) ?
                      (^~$signed((reg72[(1'h1):(1'h1)] + {reg73}))) : {reg49,
                          (8'hb2)});
  module75 #() modinst86 (.wire79(reg61), .y(wire85), .clk(clk), .wire77(reg66), .wire76(reg55), .wire78(reg72));
  assign wire87 = ($signed((reg49[(3'h7):(1'h0)] & $unsigned((reg61 ?
                      reg53 : wire46)))) != ($unsigned((8'hba)) ?
                      wire52[(3'h6):(3'h6)] : wire44[(2'h2):(2'h2)]));
  assign wire88 = $signed($unsigned(((^~(reg64 >>> reg54)) ^~ ((wire74 + wire47) ?
                      (wire46 ? (8'ha9) : wire71) : wire74[(1'h0):(1'h0)]))));
endmodule

module module75  (y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire79;
  input wire signed [(4'hb):(1'h0)] wire78;
  input wire signed [(4'he):(1'h0)] wire77;
  input wire [(5'h13):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  assign y = {wire84, wire83, wire82, wire81, wire80, (1'h0)};
  assign wire80 = (~$signed($unsigned({{wire77, wire76}, {wire79, wire77}})));
  assign wire81 = ($signed(((8'hb2) ?
                          (wire76 ?
                              $unsigned((8'hb5)) : $unsigned(wire76)) : wire79[(4'ha):(4'h9)])) ?
                      $signed(wire76[(4'h8):(3'h5)]) : {wire79});
  assign wire82 = wire81[(3'h5):(1'h1)];
  assign wire83 = $signed(wire78[(3'h6):(3'h6)]);
  assign wire84 = ({$signed(wire78[(4'hb):(3'h6)])} ?
                      $unsigned((-wire78)) : ($signed($unsigned(wire79)) < ((+{wire79}) ?
                          wire77 : (8'hbd))));
endmodule

module module13
#(parameter param42 = ({((!((8'ha3) ? (7'h41) : (7'h41))) ? ({(8'h9f)} >= ((8'ha6) >>> (8'ha4))) : (((7'h40) < (8'hb9)) ? (8'haf) : ((8'hb6) + (8'hac))))} ? {({((8'hbb) ? (8'hb5) : (8'hbf)), {(7'h42)}} ? ({(8'hbd), (8'haa)} ? ((8'hb0) ? (8'ha1) : (8'h9f)) : ((8'hb1) < (7'h43))) : (|((8'ha4) ? (8'hb9) : (8'ha6))))} : ((+{(&(8'hbf))}) == (({(8'haf), (8'ha9)} ? {(8'hb5), (8'h9d)} : (&(8'hbf))) ^ {(~^(7'h44))}))), 
parameter param43 = (8'hab))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(3'h5):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= $unsigned(wire17);
      reg19 <= reg18;
      reg20 <= ((^(^wire14[(3'h5):(1'h0)])) << reg18[(2'h3):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if (wire14[(3'h5):(1'h0)])
        begin
          reg21 <= (-$signed(wire15[(4'h8):(2'h3)]));
        end
      else
        begin
          reg21 <= (^~$signed($signed($signed((&reg18)))));
          reg22 <= wire15[(4'h8):(1'h1)];
          reg23 <= $signed($unsigned(((|{wire14, reg22}) ?
              (~&{reg18, reg20}) : $unsigned((reg18 << reg18)))));
          reg24 <= $unsigned(($unsigned((8'hb9)) ?
              (~&(^(wire17 >>> reg18))) : (8'hbe)));
          reg25 <= ($unsigned($signed(($unsigned((8'hbd)) < {reg23, reg19}))) ?
              ((({reg20} ? $signed(reg23) : (wire14 << reg23)) ?
                      reg21 : $unsigned($unsigned(reg24))) ?
                  reg18[(3'h5):(1'h0)] : wire14) : reg21);
        end
      if ((~wire17))
        begin
          if ({{(($signed(reg21) + (wire16 <= wire15)) ?
                      {reg20} : $signed(reg19[(3'h4):(2'h2)])),
                  {((!(8'hb5)) == $unsigned(reg18)), wire14}}})
            begin
              reg26 <= $signed((^~(wire14[(1'h1):(1'h1)] ?
                  $signed(wire14) : (reg18[(4'he):(2'h2)] ?
                      ((8'hab) ? wire17 : wire16) : (^reg21)))));
              reg27 <= $signed(wire16[(4'he):(4'h8)]);
            end
          else
            begin
              reg26 <= ($unsigned({$signed(wire15),
                      ((wire17 ? reg23 : reg21) ? reg24 : (|(7'h44)))}) ?
                  reg22[(3'h5):(1'h1)] : (($signed((wire16 ?
                      wire15 : wire15)) ^ reg27) ~^ $unsigned($signed($signed(reg26)))));
              reg27 <= (8'ha0);
              reg28 <= $signed($signed($unsigned(reg18)));
            end
          reg29 <= reg20[(4'h9):(2'h2)];
        end
      else
        begin
          reg26 <= reg29[(2'h3):(1'h1)];
        end
    end
  assign wire30 = (&($signed(reg24[(3'h4):(2'h3)]) == $signed(reg21)));
  assign wire31 = $unsigned(reg20[(4'he):(2'h2)]);
  assign wire32 = reg27[(1'h1):(1'h0)];
  assign wire33 = $signed((({(wire16 >>> (7'h44))} || $unsigned((wire32 ^ reg18))) - $unsigned(reg28)));
  assign wire34 = (~|wire30[(2'h2):(2'h2)]);
  assign wire35 = (wire32[(1'h0):(1'h0)] ?
                      $unsigned((($signed(wire14) | (reg24 ^ wire30)) >>> reg28[(3'h5):(2'h2)])) : (!(reg26 || (~|(+wire33)))));
  assign wire36 = reg20;
  assign wire37 = {$unsigned((~reg26[(3'h5):(2'h3)])),
                      (~&(~|wire34[(1'h1):(1'h0)]))};
  assign wire38 = reg18;
  assign wire39 = ((^{((-wire34) ? (8'ha4) : (reg20 ? reg25 : reg25)),
                          $signed(wire17[(4'h8):(1'h1)])}) ?
                      reg21[(3'h4):(2'h3)] : wire34);
  assign wire40 = wire30;
  assign wire41 = (~&((((wire16 - wire17) != $signed((8'hbf))) ?
                          (reg23 ?
                              reg18 : (~&reg29)) : $signed($unsigned(wire15))) ?
                      reg22 : wire40[(1'h0):(1'h0)]));
endmodule

module module127  (y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire132;
  input wire signed [(5'h13):(1'h0)] wire131;
  input wire signed [(4'h9):(1'h0)] wire130;
  input wire [(3'h5):(1'h0)] wire129;
  input wire [(3'h5):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire152;
  wire [(3'h5):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire149;
  wire signed [(4'hc):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire137;
  wire signed [(2'h3):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire133;
  reg signed [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg138 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire152,
                 wire151,
                 wire149,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg150,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg139,
                 reg138,
                 (1'h0)};
  assign wire133 = ($signed(((wire128[(3'h4):(3'h4)] >> (wire132 >= (8'hb6))) >= wire128)) ?
                       ((wire130[(3'h6):(3'h4)] <<< (~|(^wire132))) ^ (&wire132)) : (8'hb5));
  assign wire134 = wire133;
  assign wire135 = (&(wire128[(1'h1):(1'h0)] ?
                       $signed($unsigned((&wire129))) : ({(wire130 ?
                               wire133 : wire131),
                           (wire132 ? wire128 : wire131)} - (~wire128))));
  assign wire136 = $unsigned($signed($signed(wire130)));
  assign wire137 = (wire128 ?
                       $signed($unsigned(wire132[(2'h2):(1'h1)])) : $signed((wire130[(3'h4):(1'h0)] ?
                           {$unsigned(wire135), (+wire131)} : (7'h42))));
  always
    @(posedge clk) begin
      reg138 <= $signed($signed(wire134[(4'ha):(1'h0)]));
      reg139 <= wire137[(1'h0):(1'h0)];
    end
  assign wire140 = wire134[(3'h6):(3'h6)];
  assign wire141 = wire131[(3'h4):(2'h2)];
  assign wire142 = (~|wire136);
  assign wire143 = wire142[(5'h11):(4'hc)];
  always
    @(posedge clk) begin
      reg144 <= $signed($signed((~&($signed(wire142) >> {wire140, wire140}))));
      reg145 <= wire133[(4'h8):(2'h2)];
      reg146 <= ($unsigned(wire133[(5'h14):(4'hb)]) ?
          wire132 : ((+(&(wire136 ?
              wire143 : wire131))) + $signed($unsigned((~^wire137)))));
      reg147 <= $unsigned($unsigned($signed({$unsigned(wire129), reg139})));
      reg148 <= (~|($signed((^~(reg146 ?
          wire129 : wire136))) << $unsigned((wire141 < (wire129 ?
          (8'hbc) : reg138)))));
    end
  assign wire149 = {$unsigned(wire131)};
  always
    @(posedge clk) begin
      reg150 <= wire129;
    end
  assign wire151 = ((reg147 >>> $unsigned({(reg145 & wire131)})) ?
                       (^~wire137[(2'h2):(1'h0)]) : ((wire132[(3'h7):(1'h0)] ?
                           reg147 : ($signed(wire137) != (8'ha0))) >>> wire136));
  assign wire152 = $signed(reg147);
  always
    @(posedge clk) begin
      if (((^$unsigned(((wire133 == reg148) >= (8'hae)))) ?
          (!(reg145[(1'h1):(1'h0)] ?
              (~wire152) : $unsigned($signed((8'hb2))))) : reg145))
        begin
          reg153 <= ($unsigned(($unsigned((wire132 ?
              reg138 : reg150)) <<< ((~(8'hb6)) ?
              reg146[(3'h6):(3'h6)] : wire128[(1'h1):(1'h0)]))) >> $unsigned((wire149[(4'hd):(4'hb)] * ((-wire130) & (|wire134)))));
          if ($unsigned((~{($signed(wire131) ?
                  (wire129 - wire152) : $signed(reg147))})))
            begin
              reg154 <= wire140;
              reg155 <= $signed((-$unsigned(((~wire140) ?
                  reg146[(4'h8):(4'h8)] : wire151))));
              reg156 <= (($unsigned((8'hb5)) ? wire130 : wire149) != wire134);
              reg157 <= (reg147 + $unsigned(wire129));
              reg158 <= (wire140[(2'h2):(1'h1)] ? (8'hb9) : wire135);
            end
          else
            begin
              reg154 <= $unsigned(reg144);
            end
          reg159 <= (($signed($unsigned((reg157 ?
                  wire149 : reg155))) < $unsigned($unsigned((wire151 ?
                  reg148 : (8'hb6))))) ?
              reg150[(3'h7):(2'h3)] : {(~$unsigned((~&reg158)))});
          if ((&reg150))
            begin
              reg160 <= ({(reg148 ?
                          $signed($signed(wire128)) : {(wire142 >= wire143)})} ?
                  {wire132[(2'h3):(2'h2)],
                      wire135[(3'h5):(1'h1)]} : reg154[(2'h3):(2'h3)]);
              reg161 <= wire136[(2'h3):(1'h1)];
              reg162 <= {wire137[(3'h4):(1'h0)], reg145};
              reg163 <= reg157;
            end
          else
            begin
              reg160 <= wire135[(3'h5):(1'h1)];
              reg161 <= wire133[(4'ha):(1'h0)];
              reg162 <= ($signed($signed(($signed(reg155) ?
                  $signed(reg145) : (wire128 ?
                      (8'ha2) : reg147)))) + $signed($signed((wire131 & (reg155 ?
                  wire140 : reg156)))));
              reg163 <= reg158;
            end
          reg164 <= ({$signed(reg159[(3'h4):(2'h3)]),
                  ({{reg156, reg148}} ? (!wire129) : wire135[(3'h5):(2'h2)])} ?
              wire131 : reg145);
        end
      else
        begin
          reg153 <= $unsigned($unsigned(reg164[(3'h4):(3'h4)]));
          if (wire131[(3'h4):(2'h2)])
            begin
              reg154 <= reg162;
              reg155 <= $signed(({reg159} ^ wire151));
              reg156 <= $unsigned(({((~^wire141) < $signed(wire129))} & ($signed(wire135) ?
                  $unsigned({reg145, reg155}) : wire143[(4'hb):(4'h9)])));
              reg157 <= (+$signed($unsigned(((reg139 | (7'h42)) ~^ (reg144 ?
                  reg159 : reg145)))));
            end
          else
            begin
              reg154 <= ({reg145[(2'h3):(1'h1)]} ^ wire140);
              reg155 <= ($signed(($unsigned($unsigned(wire128)) ?
                      (~^wire152) : $unsigned($unsigned(reg154)))) ?
                  (~|(($unsigned(wire133) ?
                          (wire132 ~^ wire137) : $unsigned(reg139)) ?
                      reg157[(1'h1):(1'h1)] : reg156[(2'h3):(1'h1)])) : $unsigned(wire143));
              reg156 <= wire128;
              reg157 <= (~((~|reg147[(3'h4):(2'h3)]) ?
                  {$signed($signed(wire140))} : $unsigned(wire133[(4'hf):(2'h3)])));
            end
          reg158 <= $unsigned((^~reg154));
        end
      reg165 <= {(wire141 ?
              wire149 : (($signed(reg158) ?
                  wire129[(2'h3):(1'h0)] : wire134) | ($signed(wire152) ?
                  $signed((8'had)) : (wire141 != reg163)))),
          ((~|(^~$unsigned(reg145))) ^~ wire149[(4'he):(4'hb)])};
      reg166 <= wire141;
    end
  assign wire167 = $unsigned($signed($unsigned(((8'hab) ?
                       $unsigned((8'ha4)) : $signed((8'hba))))));
  assign wire168 = (~|$unsigned(reg165[(4'h8):(1'h1)]));
endmodule

module module98
#(parameter param120 = (~|{((((8'ha5) ? (8'hb5) : (8'hbe)) * ((8'ha9) ? (7'h44) : (8'hb6))) ? (((8'ha7) || (8'hb1)) ? ((8'ha9) ? (7'h41) : (7'h43)) : ((8'hba) >> (8'had))) : (((7'h40) & (8'hb2)) ? ((8'hb5) ^ (8'hae)) : ((7'h40) ? (8'h9d) : (7'h41))))}))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire103;
  input wire signed [(4'hd):(1'h0)] wire102;
  input wire [(4'hd):(1'h0)] wire101;
  input wire [(5'h15):(1'h0)] wire100;
  input wire signed [(3'h4):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire108;
  wire [(3'h7):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  assign y = {wire119,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire104 = ((-$signed(wire102[(2'h2):(1'h0)])) & wire103);
  assign wire105 = $signed((&(8'had)));
  assign wire106 = ((8'hab) ?
                       (wire100 >>> (wire103[(4'h9):(2'h3)] ^~ wire103)) : {$unsigned(($unsigned((8'h9f)) >= (wire101 << wire105)))});
  assign wire107 = wire104[(1'h1):(1'h1)];
  assign wire108 = (&($signed(wire104) ?
                       ($unsigned(wire107[(3'h6):(2'h2)]) * ((8'hb3) ?
                           wire102 : wire104)) : (((wire107 ?
                               wire107 : wire100) ?
                           (-wire104) : (wire104 ?
                               wire101 : wire105)) - $unsigned((wire100 <= wire104)))));
  always
    @(posedge clk) begin
      reg109 <= wire102[(3'h4):(2'h3)];
      reg110 <= $unsigned($signed(((|wire103[(3'h4):(2'h2)]) ?
          wire106 : wire108[(1'h0):(1'h0)])));
      if ((8'ha6))
        begin
          reg111 <= wire99;
          if ((|($signed(wire108[(5'h12):(2'h3)]) ?
              (+($signed(reg109) || $unsigned(reg111))) : $signed(wire105[(3'h7):(3'h5)]))))
            begin
              reg112 <= ((($signed(wire104[(1'h1):(1'h1)]) >>> {((8'ha7) != wire99)}) - (~|{wire102[(4'hd):(3'h4)]})) ?
                  $signed(reg110[(2'h2):(1'h0)]) : (wire107 ?
                      ({reg109, $signed(wire104)} ?
                          (~wire103) : wire103) : ((wire102[(2'h3):(2'h2)] | (wire100 ?
                          (8'ha9) : (8'h9e))) + wire102[(3'h6):(2'h2)])));
              reg113 <= $signed((^wire104));
            end
          else
            begin
              reg112 <= (8'h9d);
              reg113 <= (~wire100);
            end
          reg114 <= wire99;
          reg115 <= $signed($signed(wire101));
        end
      else
        begin
          if ((&$unsigned(($signed({reg115}) ?
              (reg111 <= (wire104 != reg114)) : ((wire103 ?
                  wire99 : wire101) * wire108[(3'h5):(3'h4)])))))
            begin
              reg111 <= $signed($signed(wire101[(2'h2):(1'h1)]));
            end
          else
            begin
              reg111 <= (reg114 >= $unsigned(reg110));
              reg112 <= (($signed($signed($signed(wire108))) ?
                      reg111[(2'h3):(1'h1)] : ({wire102[(3'h5):(3'h5)],
                              (8'haa)} ?
                          ((!wire107) | {wire99, (8'ha8)}) : wire99)) ?
                  {(8'hba),
                      ((wire99 ?
                          (reg110 ? reg114 : wire108) : ((8'had) ?
                              reg109 : (8'ha3))) < (reg114 <= (^wire106)))} : $unsigned($signed(wire99[(3'h4):(2'h2)])));
              reg113 <= reg111[(1'h0):(1'h0)];
              reg114 <= (~$signed({$signed((~|(8'hbb)))}));
              reg115 <= (~^$signed(wire105));
            end
          reg116 <= ($signed($signed((|wire100))) + {(&(8'hb1))});
          reg117 <= (~^((($signed(reg110) + reg115[(3'h4):(3'h4)]) ?
              wire107 : $unsigned(reg111)) > (~^$signed((wire107 ?
              reg111 : (7'h44))))));
        end
      reg118 <= (^~($unsigned(({(8'ha3)} <<< (wire102 ? reg116 : reg117))) ?
          (7'h44) : reg110[(2'h2):(1'h0)]));
    end
  assign wire119 = reg115;
endmodule
