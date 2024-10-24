module top
#(parameter param100 = ((&(!(-(&(8'ha6))))) <= (|((((7'h40) ? (8'hb1) : (8'ha6)) ? ((8'ha4) ? (8'hbf) : (8'hb0)) : (&(8'had))) ? ((8'hbd) <<< (~&(8'haa))) : (((8'h9f) ? (8'ha0) : (8'h9e)) << (8'hb8))))), 
parameter param101 = (^~((param100 == ((|param100) - (^param100))) ? {(((8'hb1) ~^ param100) ? (!param100) : (-(8'hb1))), {{param100}, (param100 ? param100 : param100)}} : ({(|param100)} >= (~&(~&param100))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire67;
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire83,
                 wire82,
                 wire81,
                 wire69,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire67,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire4 = ($signed($unsigned((^((8'hb2) ? wire0 : wire0)))) ^ wire3);
  assign wire5 = $signed($signed((8'ha4)));
  assign wire6 = $unsigned($unsigned($signed(($unsigned(wire0) ^~ {wire2,
                     wire0}))));
  assign wire7 = wire0;
  assign wire8 = $unsigned($unsigned(wire5[(1'h1):(1'h0)]));
  assign wire9 = wire6[(4'h9):(1'h1)];
  module10 #() modinst68 (.y(wire67), .wire15(wire9), .wire13(wire0), .wire14(wire8), .clk(clk), .wire12(wire6), .wire11(wire1));
  assign wire69 = wire7[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg70 <= (~(-wire6));
      reg71 <= wire67[(3'h6):(3'h6)];
      reg72 <= $unsigned({reg70, wire69[(3'h7):(2'h2)]});
      if (wire1)
        begin
          if ($signed(wire4[(2'h2):(1'h0)]))
            begin
              reg73 <= ($unsigned($unsigned(wire3)) ?
                  $unsigned((^~$unsigned(wire1[(3'h5):(2'h2)]))) : {wire9[(4'h9):(3'h7)],
                      ({{wire69, reg71}} ?
                          wire0[(3'h6):(3'h5)] : $signed($unsigned(wire67)))});
            end
          else
            begin
              reg73 <= $signed($signed(wire7));
              reg74 <= $signed($unsigned($signed((~(wire67 ^ (8'hbc))))));
            end
        end
      else
        begin
          reg73 <= (-reg72);
          reg74 <= reg74;
          if (reg73)
            begin
              reg75 <= ({($unsigned(wire4) ?
                          $unsigned((wire7 ?
                              reg72 : reg71)) : $unsigned(wire1[(4'hc):(2'h3)])),
                      wire8} ?
                  (-$signed((wire1[(1'h1):(1'h1)] > (^~wire69)))) : wire6[(3'h7):(2'h3)]);
              reg76 <= $unsigned(reg74);
              reg77 <= (8'hba);
            end
          else
            begin
              reg75 <= ($signed(reg74[(3'h4):(1'h0)]) <<< wire6);
              reg76 <= (!wire5);
              reg77 <= wire8[(3'h5):(2'h3)];
              reg78 <= $signed($signed((({reg73} >>> $unsigned(wire3)) > $unsigned((wire2 || wire2)))));
            end
          reg79 <= wire6;
          reg80 <= (-(~$unsigned(reg76)));
        end
    end
  assign wire81 = ((reg78 ?
                      wire2[(3'h4):(2'h3)] : (8'hae)) == (~|reg76[(3'h4):(2'h3)]));
  assign wire82 = ((-$signed($signed((~&wire67)))) ?
                      wire6[(4'hd):(3'h5)] : (8'hbb));
  assign wire83 = ($signed(wire82[(3'h4):(2'h3)]) ?
                      ((wire0[(1'h0):(1'h0)] & ($unsigned(wire4) || wire4)) || ($signed($signed(reg77)) * (wire6[(5'h10):(4'hd)] >= $unsigned(wire1)))) : $unsigned($signed((~&((8'hb3) || reg77)))));
  always
    @(posedge clk) begin
      reg84 <= $unsigned(((($unsigned(reg76) ?
          reg80[(1'h1):(1'h1)] : reg78[(4'hd):(4'hb)]) || (~^{(8'hb4)})) << $signed((~&((8'hb7) <= wire83)))));
      if ({wire8, {wire69[(4'hf):(4'h8)], $signed($signed(wire67))}})
        begin
          reg85 <= (wire82[(3'h6):(3'h4)] ?
              wire3[(1'h1):(1'h1)] : ($signed(wire83[(2'h3):(2'h2)]) >= {(~^$unsigned(wire9))}));
          reg86 <= $unsigned($unsigned(reg84[(2'h3):(1'h1)]));
          reg87 <= reg75;
          reg88 <= reg86[(3'h5):(1'h1)];
          reg89 <= ($unsigned(((wire2[(3'h6):(2'h2)] ?
                  (wire81 ? reg79 : wire2) : (^reg79)) & ($signed(wire6) ?
                  (8'ha2) : $signed(reg78)))) ?
              reg80 : $unsigned((-$unsigned(wire5))));
        end
      else
        begin
          reg85 <= reg89[(3'h4):(3'h4)];
          reg86 <= ({(^~($signed((8'hb4)) >= (-(8'hae))))} ?
              wire67 : reg77[(4'hc):(4'ha)]);
          if (reg74[(3'h4):(2'h3)])
            begin
              reg87 <= (-(((-$unsigned(reg70)) ~^ reg79) <= ($signed($unsigned(wire6)) ?
                  $unsigned((wire8 ? reg79 : (7'h41))) : ({(8'hb1), wire1} ?
                      (reg76 ^~ reg74) : (wire82 != reg79)))));
              reg88 <= ($unsigned($unsigned($signed($signed(reg76)))) ?
                  wire5 : ($signed(({(8'hbe), (7'h44)} ?
                      (reg79 ?
                          reg75 : reg77) : $signed(reg75))) * reg74[(1'h1):(1'h0)]));
              reg89 <= reg72[(4'hb):(1'h1)];
            end
          else
            begin
              reg87 <= ($signed($signed($signed((reg71 >= (8'hb3))))) ?
                  wire83[(2'h2):(1'h0)] : $unsigned((~&$unsigned((reg87 | reg71)))));
              reg88 <= {wire8[(2'h3):(2'h3)], reg72[(3'h6):(3'h5)]};
              reg89 <= $unsigned((~&($unsigned($unsigned((8'ha8))) - wire0)));
              reg90 <= (~{{((reg80 >= reg87) | (reg87 ? wire82 : wire3)),
                      wire83[(4'hd):(3'h6)]},
                  wire2[(2'h2):(2'h2)]});
            end
        end
      reg91 <= reg89;
      reg92 <= $signed((wire0 >> (+wire2[(2'h2):(1'h1)])));
      if ($unsigned((((^wire6) ^~ (((8'hbd) ? (7'h44) : wire0) & {wire8,
              reg79})) ?
          $signed({reg77, reg90}) : (((~|reg85) ?
              $unsigned(wire6) : (wire5 ? wire0 : reg88)) >> reg78))))
        begin
          reg93 <= $unsigned((^($signed($unsigned(reg76)) ^~ ((wire69 ?
              wire67 : reg74) <<< wire81[(2'h3):(2'h2)]))));
          reg94 <= (^~(((+$signed(wire69)) ^~ $unsigned($signed(reg80))) <<< $signed((wire7[(1'h0):(1'h0)] ?
              (reg91 ? (8'ha2) : reg76) : $unsigned(wire8)))));
          reg95 <= ($signed(reg88) - (reg76[(1'h1):(1'h0)] ?
              (+($unsigned(reg75) || (reg75 & (8'ha7)))) : $unsigned($unsigned(reg85[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg93 <= reg87;
          if ($unsigned((~|$signed(wire7[(2'h2):(2'h2)]))))
            begin
              reg94 <= ((7'h40) > (wire69 ?
                  reg70[(2'h3):(1'h1)] : $unsigned((8'hbf))));
              reg95 <= {(reg79 ? (~|$signed((~wire83))) : wire3)};
              reg96 <= $unsigned($unsigned(({(reg85 ?
                      reg76 : reg72)} <<< $unsigned(reg90))));
              reg97 <= wire69;
            end
          else
            begin
              reg94 <= $unsigned(reg84[(1'h1):(1'h1)]);
              reg95 <= reg88[(2'h2):(1'h0)];
              reg96 <= wire67[(1'h1):(1'h0)];
            end
        end
    end
  assign wire98 = ((($signed($unsigned((8'hb9))) ?
                              (~&$signed(reg80)) : (reg71 ?
                                  $unsigned(wire81) : reg70[(3'h6):(1'h1)])) ?
                          (&($signed(reg91) ?
                              reg96[(3'h5):(1'h1)] : $signed(reg72))) : (reg78[(2'h2):(2'h2)] >>> (+(wire2 >= reg76)))) ?
                      $unsigned((-wire83)) : $unsigned((($signed(reg95) ~^ $signed((8'ha6))) << (~^(~|wire0)))));
  assign wire99 = ($unsigned((+((wire82 ?
                          wire0 : reg93) <<< $signed((8'h9f))))) ?
                      (^(reg80 ?
                          $unsigned(wire2) : (~|reg93[(1'h0):(1'h0)]))) : (((reg91[(3'h4):(2'h2)] ?
                              wire9 : reg71[(4'h8):(1'h0)]) == $signed(reg76[(2'h3):(2'h3)])) ?
                          reg75[(3'h6):(3'h4)] : wire0[(1'h0):(1'h0)]));
endmodule

module module10
#(parameter param65 = (+(!(&(8'hb0)))), 
parameter param66 = (({(8'hb5), ((~param65) ? (param65 ^~ (8'ha6)) : param65)} * param65) || param65))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire [(2'h3):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire16;
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  assign y = {wire64,
                 wire47,
                 wire46,
                 wire44,
                 wire16,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire16 = $signed(((($unsigned((8'hbb)) ?
                      (-wire15) : wire11) ^ $unsigned(wire14)) <= {wire13,
                      (((8'hac) ? wire13 : wire14) > $unsigned(wire13))}));
  module17 #() modinst45 (.y(wire44), .wire21(wire15), .wire19(wire11), .wire18(wire12), .wire20(wire16), .clk(clk));
  assign wire46 = $signed(({wire16[(1'h0):(1'h0)], (~$signed(wire44))} ?
                      $unsigned(((~&wire11) ?
                          (wire15 ?
                              wire12 : wire11) : wire16)) : $unsigned({wire14[(3'h6):(3'h6)],
                          $signed(wire12)})));
  assign wire47 = wire12[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg48 <= $unsigned((+$signed(wire12)));
      if ((8'hba))
        begin
          reg49 <= ((8'haf) << {(~&(^~(wire44 << wire44)))});
          reg50 <= $signed($unsigned(($unsigned((^~(8'hb1))) ?
              $signed(wire12[(4'h9):(2'h2)]) : {wire11[(4'h8):(3'h5)],
                  reg48})));
          reg51 <= (^~$unsigned((({wire14} == $unsigned(wire13)) | $unsigned((reg48 ?
              wire11 : wire12)))));
        end
      else
        begin
          reg49 <= $unsigned((reg51[(2'h3):(2'h3)] ?
              $signed((~|(wire12 ? reg51 : wire44))) : {$signed(wire12),
                  ((reg49 ~^ reg51) ?
                      (wire15 ? wire46 : (8'hb6)) : (~&wire11))}));
          if (((+$signed(((wire13 ? (8'hbe) : reg49) >> (reg51 ?
                  reg50 : wire16)))) ?
              (wire47[(4'h8):(3'h7)] ?
                  (+(~&$signed((8'ha8)))) : ((~^(^wire16)) ?
                      wire13[(2'h2):(2'h2)] : $signed($signed(wire16)))) : {(((&(7'h43)) ?
                      (wire11 - (8'hb2)) : (~^wire13)) <= ($unsigned(wire47) ?
                      ((8'hb6) * reg49) : $signed((8'hb0)))),
                  $signed(reg51)}))
            begin
              reg50 <= reg50[(4'h9):(2'h2)];
              reg51 <= $signed(wire46);
              reg52 <= (^~$unsigned({{(wire11 ? (7'h42) : wire47)}}));
              reg53 <= {(~^((8'ha1) && (~(wire11 ? wire46 : (8'ha4))))),
                  $signed(wire16)};
            end
          else
            begin
              reg50 <= wire44[(1'h0):(1'h0)];
              reg51 <= wire13;
              reg52 <= (|$unsigned((($unsigned(reg48) ?
                  wire47[(2'h2):(2'h2)] : reg53[(4'hc):(4'hb)]) + $unsigned($unsigned(reg48)))));
              reg53 <= (8'hb8);
              reg54 <= (wire11[(2'h2):(1'h1)] ? $unsigned(reg49) : wire47);
            end
          reg55 <= ((~|reg48) && (!(($signed(reg50) != $unsigned(reg51)) ?
              $unsigned($unsigned((8'ha9))) : reg51[(3'h4):(1'h0)])));
        end
      reg56 <= $signed(reg53);
      reg57 <= ((8'hb2) <= ((wire14[(2'h3):(1'h1)] ~^ (~(wire47 + reg52))) >> reg48[(1'h1):(1'h0)]));
      if ({{$signed((|(~^(8'haa)))),
              (+(reg49[(1'h0):(1'h0)] ?
                  $signed(wire46) : reg55[(4'he):(4'hb)]))}})
        begin
          if ((wire44[(4'h9):(1'h0)] & wire46[(4'h9):(1'h0)]))
            begin
              reg58 <= $unsigned({($signed(reg48) ?
                      ({reg51} ?
                          reg50[(4'h8):(4'h8)] : reg57[(4'hc):(3'h5)]) : wire44)});
              reg59 <= ($unsigned($signed($unsigned((wire13 ^ reg50)))) ?
                  reg53[(4'hf):(3'h6)] : {reg53[(1'h1):(1'h1)],
                      $signed(wire44)});
              reg60 <= reg59;
              reg61 <= ((&$unsigned((!$unsigned(wire16)))) | $signed((reg57[(4'hb):(3'h6)] ?
                  (^wire13) : reg51[(1'h0):(1'h0)])));
              reg62 <= (~$signed(reg56));
            end
          else
            begin
              reg58 <= (~({((^~wire12) ? (|reg52) : (8'hab)),
                      $signed((~|(8'hb0)))} ?
                  ($signed(reg57[(4'he):(4'he)]) <<< ((reg50 < reg58) >>> {reg59,
                      reg53})) : $signed(($unsigned(wire15) ?
                      reg56 : $signed(wire47)))));
            end
          reg63 <= (~((8'hbc) ?
              ($unsigned(((8'ha7) - reg49)) != ((^wire12) * wire15[(3'h5):(1'h1)])) : wire11[(3'h7):(2'h3)]));
        end
      else
        begin
          if ((^reg48[(1'h0):(1'h0)]))
            begin
              reg58 <= reg53[(4'hc):(3'h6)];
              reg59 <= reg51[(1'h0):(1'h0)];
              reg60 <= wire14;
              reg61 <= {$signed($signed(($signed(reg55) ?
                      $signed(wire47) : {reg60}))),
                  reg56[(3'h4):(1'h1)]};
            end
          else
            begin
              reg58 <= $unsigned({((wire12 || (reg63 <<< reg51)) >>> reg60)});
              reg59 <= reg53;
              reg60 <= reg49[(2'h2):(1'h0)];
              reg61 <= {{reg60},
                  (({(+reg48), $signed(wire16)} * {(wire44 && reg55)}) ?
                      wire11 : (~^(wire14[(1'h1):(1'h0)] ?
                          (reg57 ^~ (8'hb3)) : {reg49})))};
            end
        end
    end
  assign wire64 = $signed(reg60);
endmodule

module module17
#(parameter param42 = ((^~(~|(~|((8'ha4) <= (8'ha5))))) <<< {{(|(~^(8'ha6))), ((~&(8'hb7)) ? ((8'ha0) ^ (8'h9f)) : {(8'ha0), (8'ha6)})}}), 
parameter param43 = ((~&(8'ha8)) ~^ (~|(((param42 ? param42 : param42) >= ((7'h40) == param42)) ? param42 : ((^param42) ? (param42 ? param42 : param42) : (&param42))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire22;
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire22,
                 reg39,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = (&{($signed($signed(wire18)) ?
                          $signed(wire20) : wire18[(3'h4):(1'h1)])});
  always
    @(posedge clk) begin
      if ($signed((((~&$signed(wire18)) ?
          ((^(8'ha3)) || (wire18 ~^ (8'ha4))) : $signed($signed((8'ha9)))) ^ $unsigned(($unsigned(wire20) | (wire21 ?
          wire18 : wire21))))))
        begin
          reg23 <= ($signed(wire22[(4'hf):(3'h6)]) | $signed(wire21));
          reg24 <= ((~^(wire18 || ($signed((8'hbc)) != $unsigned((8'hb6))))) >= wire20[(2'h3):(1'h1)]);
          reg25 <= wire18;
        end
      else
        begin
          reg23 <= reg24[(4'h8):(3'h6)];
          reg24 <= reg25;
        end
      reg26 <= (~((wire21 << reg24) ?
          $signed($unsigned((wire21 ? (8'hbf) : reg25))) : $unsigned((8'hbf))));
      reg27 <= wire21[(4'h8):(3'h6)];
      if (wire19[(3'h4):(1'h1)])
        begin
          reg28 <= reg27;
          if ((wire21 > $unsigned(wire21[(2'h2):(1'h0)])))
            begin
              reg29 <= $signed(((wire22[(3'h5):(3'h4)] ?
                  $unsigned((!reg25)) : $signed((|wire20))) * ($unsigned($unsigned(reg28)) ?
                  wire18[(3'h7):(2'h3)] : ($unsigned(wire18) ?
                      (8'ha8) : (~&reg23)))));
            end
          else
            begin
              reg29 <= (~&((!$unsigned(wire18[(1'h1):(1'h0)])) ?
                  (wire22[(2'h3):(2'h2)] > reg27[(2'h3):(1'h1)]) : reg26));
              reg30 <= ((reg27[(1'h0):(1'h0)] ?
                  reg29 : (((~^wire22) != (reg26 ? wire22 : (8'hba))) ?
                      $unsigned(reg28[(2'h2):(2'h2)]) : (^~{wire22,
                          (8'ha4)}))) < $signed($signed(reg24[(3'h5):(3'h4)])));
              reg31 <= reg28;
              reg32 <= $unsigned((&$unsigned((wire22[(3'h4):(1'h0)] & {wire22}))));
            end
          if (reg29)
            begin
              reg33 <= $signed(reg23);
              reg34 <= (&(reg30[(4'hb):(4'ha)] - (((reg24 > reg29) ?
                      (reg28 != reg24) : $unsigned(reg28)) ?
                  (-$signed(wire22)) : $signed((~|reg33)))));
              reg35 <= (wire20 << $signed(reg30));
            end
          else
            begin
              reg33 <= wire20[(2'h3):(2'h2)];
              reg34 <= ($unsigned($unsigned({(~|reg29),
                  $unsigned(wire19)})) + wire20);
              reg35 <= $unsigned($signed({wire18,
                  ((reg23 * reg35) <<< $unsigned(reg30))}));
            end
        end
      else
        begin
          reg28 <= (wire19 ^ {$signed($signed({wire20, reg31})),
              ($unsigned((reg31 >= reg24)) ?
                  reg32[(3'h4):(2'h2)] : ((reg24 | reg24) > $signed(reg27)))});
          if ($signed(reg33))
            begin
              reg29 <= $unsigned($signed({reg24[(1'h1):(1'h1)],
                  reg35[(4'hc):(4'hc)]}));
            end
          else
            begin
              reg29 <= (reg35[(4'he):(1'h1)] >= (-(-(^(~|reg24)))));
            end
          reg30 <= $unsigned($signed((((reg31 ^~ wire22) && reg27[(3'h5):(1'h1)]) + {$unsigned(reg35),
              reg34})));
        end
    end
  assign wire36 = wire18;
  assign wire37 = $signed(reg25);
  assign wire38 = $signed((~&{$signed(wire20[(2'h3):(1'h1)])}));
  always
    @(posedge clk) begin
      reg39 <= (~(reg31[(3'h6):(2'h2)] <<< (((wire22 ? reg31 : wire22) ?
          {reg31} : ((8'hb4) * wire19)) <= (&{reg33}))));
    end
  assign wire40 = reg39[(1'h0):(1'h0)];
  assign wire41 = $signed((!(wire40[(1'h0):(1'h0)] ?
                      $signed(reg29[(4'h9):(3'h6)]) : {(^reg30),
                          $signed(reg25)})));
endmodule
