module top
#(parameter param139 = ((((&(~^(8'hbb))) ? ({(8'ha2), (8'ha1)} ? ((8'haa) ? (8'ha4) : (8'hbb)) : {(8'haf)}) : (~|((7'h44) ? (7'h41) : (8'hac)))) ? ((((7'h43) ? (8'hb4) : (7'h41)) < ((8'hab) >>> (7'h40))) & (((8'ha0) && (7'h42)) ^~ ((8'hb6) == (8'haf)))) : (7'h40)) != (~|((((8'hac) ? (8'hae) : (8'hb5)) <= ((8'hae) ? (8'hab) : (8'hb8))) ? (((8'hb0) ~^ (8'hba)) ? {(8'hb8), (8'ha2)} : (!(8'haa))) : {(~(8'hba))}))), 
parameter param140 = ((((param139 ? (param139 ? param139 : param139) : (-param139)) != param139) ~^ (+(^((8'hb0) * (8'ha1))))) ? param139 : param139))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire137;
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire75,
                 wire21,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire77,
                 wire90,
                 wire135,
                 wire137,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = (($signed(({(8'hb6)} ?
                         (~^wire1) : (wire2 * wire0))) && {($unsigned(wire1) ?
                             wire3[(3'h4):(1'h1)] : (wire0 ?
                                 wire3 : (8'hbe)))}) ?
                     $signed(wire0[(4'ha):(4'ha)]) : (~&$signed({(wire3 << wire2),
                         (8'ha2)})));
  assign wire5 = wire2[(5'h15):(5'h12)];
  assign wire6 = $signed({(~$signed($unsigned((8'ha6)))),
                     wire4[(4'h8):(2'h3)]});
  assign wire7 = (wire5 ?
                     (wire3[(2'h3):(1'h1)] == $signed((|(!wire2)))) : (~|$unsigned(($signed(wire5) < wire2[(5'h13):(1'h0)]))));
  assign wire8 = (~|{({{wire0}} ? wire1 : $signed(((7'h40) - wire2))),
                     $unsigned($signed((wire4 ? wire3 : wire7)))});
  assign wire9 = ($signed(wire5) ?
                     $signed(({$unsigned(wire3),
                         wire1[(3'h7):(3'h6)]} ^ wire6[(1'h0):(1'h0)])) : wire3[(1'h1):(1'h1)]);
  assign wire10 = (8'haf);
  always
    @(posedge clk) begin
      reg11 <= wire7[(3'h4):(2'h2)];
      reg12 <= (reg11 ?
          {$unsigned($unsigned({wire10})), {wire2[(4'h8):(2'h3)]}} : wire0);
      if ((+wire5))
        begin
          if (wire1)
            begin
              reg13 <= wire6;
              reg14 <= $signed(reg12);
              reg15 <= reg14[(1'h0):(1'h0)];
              reg16 <= reg15[(2'h2):(1'h0)];
              reg17 <= (!(reg13 ? reg16[(4'hc):(3'h6)] : wire8));
            end
          else
            begin
              reg13 <= wire7;
              reg14 <= $signed((wire1 ? (^(^(wire1 == wire0))) : wire3));
              reg15 <= ((|(($signed((8'ha8)) ?
                  wire5 : reg11[(3'h5):(2'h2)]) - $unsigned(wire7[(3'h5):(2'h3)]))) != ((^~{reg13[(2'h3):(2'h2)],
                      $signed(reg11)}) ?
                  (|(wire6 ? {reg16} : (wire7 >>> wire4))) : (8'hb4)));
              reg16 <= $signed({(8'had),
                  (reg13[(2'h3):(2'h2)] < ($signed(wire2) ?
                      (|wire6) : (8'ha1)))});
            end
          reg18 <= ($unsigned((~&($signed(reg15) ?
                  (wire9 ? wire0 : (8'hbc)) : reg13[(1'h0):(1'h0)]))) ?
              (reg17[(2'h3):(1'h1)] & $signed(wire9)) : $unsigned((wire5[(3'h4):(1'h0)] ?
                  $signed($unsigned(wire6)) : (reg12[(4'hc):(3'h7)] ?
                      $unsigned((8'h9f)) : (wire6 <= reg14)))));
          reg19 <= wire5[(4'hb):(2'h2)];
        end
      else
        begin
          if (wire2[(4'hc):(4'h9)])
            begin
              reg13 <= reg12;
              reg14 <= (~^(~^reg16));
              reg15 <= {(((8'ha1) ~^ (((8'hba) ?
                      (8'haa) : reg19) >= $unsigned(reg11))) & wire8[(5'h12):(4'he)]),
                  (((8'h9e) ? $signed($signed(reg11)) : $signed(reg17)) ?
                      $signed(reg15) : (reg17[(3'h6):(1'h1)] ?
                          $signed((wire7 >>> reg19)) : ($unsigned(wire4) ?
                              (~&reg16) : (~&reg12))))};
              reg16 <= $unsigned(($unsigned({{(8'hab)}}) ~^ wire4[(4'h9):(4'h8)]));
              reg17 <= ($signed(reg19) ? reg11 : (8'hb2));
            end
          else
            begin
              reg13 <= wire5;
              reg14 <= (8'hbf);
            end
          reg18 <= (~|$signed($signed($signed((wire7 - reg17)))));
        end
      reg20 <= wire2[(1'h1):(1'h1)];
    end
  assign wire21 = $signed((^$unsigned($signed((reg11 ? reg11 : reg19)))));
  module22 #() modinst76 (.wire24(reg16), .wire23(wire3), .y(wire75), .clk(clk), .wire25(reg11), .wire27(wire2), .wire26(wire9));
  assign wire77 = (-((~|($unsigned(reg17) << (!reg14))) ~^ $unsigned({{reg13,
                          reg20}})));
  module78 #() modinst91 (wire90, clk, reg16, wire1, wire75, wire7, wire6);
  module92 #() modinst136 (wire135, clk, wire3, reg15, wire2, wire0, wire7);
  module22 #() modinst138 (.wire25(reg16), .wire26(reg19), .clk(clk), .wire24(wire21), .y(wire137), .wire23(reg20), .wire27(reg13));
endmodule

module module92
#(parameter param134 = ({((((8'hb5) >>> (8'ha0)) == {(8'hba), (8'h9c)}) >> (&(|(8'hb2))))} ? ((((^(8'ha0)) ? ((8'ha1) > (8'ha5)) : {(8'ha7)}) || {((8'hba) | (8'hae)), ((8'h9d) ? (8'ha6) : (8'ha7))}) ? ((8'h9d) >= ({(8'hb4)} ? ((8'hb9) < (8'hb2)) : ((8'hae) ? (8'hbb) : (8'had)))) : (!{{(8'hbf)}})) : (((((8'hb8) ? (8'ha0) : (8'hbb)) << ((8'hab) == (7'h44))) ? (-((8'haf) ? (8'h9c) : (8'hb5))) : (((8'hb3) >>> (8'hb5)) > ((8'ha5) * (8'h9d)))) < (((&(8'hb7)) ? ((8'ha2) && (8'hbc)) : ((8'ha4) != (8'hba))) ? {{(8'haa)}} : (~|((8'h9d) && (8'hb9)))))))
(y, clk, wire93, wire94, wire95, wire96, wire97);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire93;
  input wire [(5'h15):(1'h0)] wire94;
  input wire [(4'hc):(1'h0)] wire95;
  input wire signed [(2'h3):(1'h0)] wire96;
  input wire [(4'hf):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire125;
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire125,
                 reg130,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg98 <= wire95;
      reg99 <= $unsigned(wire96[(1'h0):(1'h0)]);
      if (($unsigned(reg99) ?
          ((8'had) ?
              $signed(({reg98,
                  (8'hac)} >= wire96[(1'h0):(1'h0)])) : $signed(reg99[(3'h5):(1'h0)])) : (wire94[(5'h15):(4'h9)] ?
              (reg98 | (8'hb1)) : wire97)))
        begin
          reg100 <= (~&(wire95 ?
              (($unsigned(wire96) >> reg98) ?
                  reg99 : ((wire93 ? reg98 : reg98) <= (~reg98))) : (({wire97,
                  (8'h9f)} <= (wire93 && wire93)) >> (wire95 | wire94))));
          reg101 <= (reg100 ?
              $unsigned($unsigned(((8'haf) ?
                  (~wire97) : $signed(wire97)))) : $unsigned(reg98[(4'h9):(3'h4)]));
          if ((8'hbf))
            begin
              reg102 <= $signed($signed($signed({$signed(wire97)})));
              reg103 <= $signed(reg101);
            end
          else
            begin
              reg102 <= {(!(((|(8'hb8)) ^~ (8'ha8)) ?
                      (^(&(8'hb9))) : $signed((wire93 == reg100)))),
                  $signed((reg99 << ({reg98, wire93} ?
                      $signed(reg99) : $signed(reg100))))};
              reg103 <= $signed({$signed($signed((wire95 <= (8'had))))});
            end
        end
      else
        begin
          reg100 <= (!$unsigned((wire96 ?
              wire94[(4'he):(4'h9)] : $unsigned(wire97[(4'ha):(2'h2)]))));
          reg101 <= (((reg103 & $unsigned(wire97[(3'h4):(1'h0)])) ?
                  {$signed(wire97)} : wire96[(1'h0):(1'h0)]) ?
              {$unsigned($unsigned((!reg99)))} : (8'hbc));
          reg102 <= (^~$unsigned(reg99[(1'h0):(1'h0)]));
        end
    end
  assign wire104 = (|$unsigned((|$signed((^wire97)))));
  assign wire105 = ({$unsigned(reg102[(3'h4):(2'h3)])} ~^ reg103[(2'h2):(1'h0)]);
  assign wire106 = $signed($unsigned((wire94 ?
                       ($unsigned(reg99) ?
                           (wire97 > wire95) : $signed(wire96)) : reg100[(1'h0):(1'h0)])));
  assign wire107 = $signed({wire93});
  assign wire108 = ((reg102[(2'h3):(2'h3)] ?
                       wire95 : (~reg100[(3'h5):(1'h1)])) == reg100);
  module109 #() modinst126 (wire125, clk, wire104, reg99, wire97, wire107);
  assign wire127 = $unsigned(($signed(reg103[(1'h0):(1'h0)]) ?
                       (~&$unsigned(wire108[(4'hb):(3'h6)])) : wire104));
  assign wire128 = ({(-(wire107 ^ (wire125 && (8'h9c))))} ?
                       ($unsigned((~^{wire106})) < $unsigned(reg99[(1'h0):(1'h0)])) : wire127);
  assign wire129 = (&{$unsigned((~$signed(reg98))), wire128});
  always
    @(posedge clk) begin
      reg130 <= ($signed((((+reg100) >> ((8'ha2) - (8'hbe))) || $signed((8'h9d)))) * (8'h9e));
    end
  assign wire131 = (7'h40);
  assign wire132 = ($signed(wire97) ^ wire125);
  assign wire133 = (((($unsigned(wire127) - (wire128 ? (8'ha4) : (8'ha1))) ?
                       {(wire106 ? reg100 : wire94),
                           $unsigned(wire132)} : (^(wire105 ?
                           reg102 : reg99))) ^ wire106) ^ ({wire129} == wire106[(3'h7):(1'h0)]));
endmodule

module module78
#(parameter param88 = (({(((8'ha0) >= (8'h9c)) != ((8'hbd) * (8'ha6)))} >> (~^(((8'ha4) > (7'h40)) ? {(8'h9f), (7'h40)} : ((8'hb6) ? (8'hb1) : (8'haa))))) ? (-(({(8'h9c), (8'ha1)} ? ((8'h9f) || (8'hbd)) : (8'hbb)) == ({(8'hae), (8'haa)} >= ((8'hbc) ? (8'hb6) : (8'hbe))))) : (|(-({(8'hae)} & (!(8'hb6)))))), 
parameter param89 = (~&((+(~&(+param88))) ? param88 : (+(-(param88 ? param88 : param88))))))
(y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire83;
  input wire signed [(4'hd):(1'h0)] wire82;
  input wire [(4'hf):(1'h0)] wire81;
  input wire signed [(5'h10):(1'h0)] wire80;
  input wire signed [(4'hc):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  assign y = {wire87, wire86, wire85, wire84, (1'h0)};
  assign wire84 = $unsigned(($signed($unsigned(wire82[(4'hd):(4'ha)])) >= {wire82}));
  assign wire85 = (($signed(((wire81 << (8'hb2)) >= $signed(wire79))) << wire83[(2'h2):(1'h1)]) & wire80);
  assign wire86 = (&wire84);
  assign wire87 = $unsigned((wire81[(3'h4):(1'h1)] >= {wire86[(5'h14):(5'h10)],
                      ((wire79 ? wire82 : wire84) <= $signed(wire86))}));
endmodule

module module22  (y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire23;
  input wire [(2'h2):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire64;
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire28,
                 wire29,
                 wire30,
                 wire42,
                 wire43,
                 wire44,
                 wire46,
                 wire47,
                 wire48,
                 wire64,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg45,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire28 = $signed(wire24[(1'h0):(1'h0)]);
  assign wire29 = (+wire24[(1'h1):(1'h1)]);
  assign wire30 = wire27[(5'h10):(4'hf)];
  always
    @(posedge clk) begin
      reg31 <= wire30;
      reg32 <= {wire27};
      if ({$unsigned((wire25 ?
              ((wire28 ~^ wire29) ?
                  $signed(wire23) : wire30) : reg31[(2'h3):(1'h0)])),
          (~(!($unsigned(wire25) ? (wire29 * wire30) : {(8'hab), (8'ha0)})))})
        begin
          reg33 <= $signed((~^((&((8'h9f) ? wire29 : (8'ha2))) ?
              (8'ha8) : wire27)));
          if (wire26)
            begin
              reg34 <= $signed($signed(wire29));
              reg35 <= {$unsigned((~|(reg33[(4'he):(3'h4)] ?
                      $unsigned(wire23) : wire30)))};
            end
          else
            begin
              reg34 <= ((reg35[(3'h6):(3'h6)] ? (!(-{wire28, reg35})) : reg33) ?
                  {$signed(wire27)} : (wire27[(4'h8):(2'h3)] >= $signed((~&(wire25 ?
                      wire25 : reg34)))));
              reg35 <= {(~|$signed({$unsigned(wire23), $unsigned(wire29)})),
                  (|$unsigned(wire23[(1'h0):(1'h0)]))};
            end
          reg36 <= (!$unsigned((^~(&(!wire27)))));
          reg37 <= $signed((8'h9e));
          if ($signed((reg36 ?
              $unsigned($unsigned($signed((8'hac)))) : ($unsigned((8'h9f)) <<< reg31))))
            begin
              reg38 <= ($signed(reg32) ?
                  $unsigned((((wire28 ? reg33 : wire28) ?
                      reg35[(4'h9):(2'h2)] : $signed((8'haf))) - ((reg35 ?
                      wire28 : wire30) ~^ wire24))) : reg35[(4'he):(4'hd)]);
              reg39 <= reg34[(2'h2):(1'h0)];
              reg40 <= reg35;
              reg41 <= ($signed(($unsigned((wire26 ?
                  reg32 : reg40)) | ((~^(8'h9f)) ?
                  {(8'hab)} : reg40[(2'h3):(1'h0)]))) | wire29);
            end
          else
            begin
              reg38 <= wire25[(3'h6):(2'h3)];
              reg39 <= (reg39[(3'h6):(3'h6)] == wire25);
              reg40 <= ($unsigned(wire28) + wire30[(5'h12):(4'hb)]);
            end
        end
      else
        begin
          reg33 <= reg41[(1'h0):(1'h0)];
        end
    end
  assign wire42 = ((reg41[(1'h0):(1'h0)] ?
                          (reg36[(1'h1):(1'h0)] ?
                              (~&reg31[(3'h7):(3'h4)]) : $unsigned((^~wire28))) : {(~|{reg39,
                                  reg36})}) ?
                      $signed($unsigned(wire23)) : (-reg37[(3'h7):(3'h6)]));
  assign wire43 = (^~reg36);
  assign wire44 = {$signed({$unsigned({wire42}), $signed({wire28})}),
                      ({$unsigned({wire30})} ?
                          $unsigned(({reg31, (8'hb8)} ?
                              (wire30 != wire27) : wire43)) : {($unsigned(reg37) ?
                                  wire26[(3'h5):(3'h4)] : {reg41, (8'ha3)})})};
  always
    @(posedge clk) begin
      reg45 <= $signed(wire43[(1'h1):(1'h1)]);
    end
  assign wire46 = $signed(reg45);
  assign wire47 = $unsigned((~&wire23[(2'h3):(2'h2)]));
  assign wire48 = ((|(|(~reg31))) & reg39);
  always
    @(posedge clk) begin
      reg49 <= {wire48,
          ((~reg39) <<< ({(wire30 * wire26)} ?
              (wire43 ? (^wire29) : (&wire46)) : (+$signed((8'hae)))))};
      reg50 <= $unsigned(($signed(($unsigned(reg33) <= $signed(wire25))) ?
          (~((~^(8'h9d)) ?
              wire26[(4'h8):(2'h3)] : (reg49 - wire46))) : wire44));
      reg51 <= (^~(~&$unsigned(($unsigned(wire24) ?
          $signed(wire42) : ((8'hb5) || reg37)))));
      reg52 <= wire42;
      reg53 <= (({((wire27 & wire43) ? reg31 : $signed(reg36)), (~|(-wire29))} ?
          wire48[(3'h4):(2'h3)] : $signed({$unsigned(wire42),
              (!wire30)})) >= (!$signed(((-wire24) ?
          {reg35, wire43} : (wire28 ? reg31 : reg36)))));
    end
  module54 #() modinst65 (wire64, clk, wire47, wire27, reg32, wire25, reg41);
  assign wire66 = (wire24[(1'h0):(1'h0)] ?
                      (+((8'ha8) ?
                          (!reg38[(3'h4):(2'h2)]) : $unsigned(reg40))) : {{($unsigned(wire27) <= $signed(reg49)),
                              $unsigned($signed(wire25))},
                          $signed(wire64)});
  assign wire67 = ($unsigned($unsigned($signed($signed(wire25)))) == $unsigned(reg52));
  assign wire68 = wire66[(2'h2):(1'h0)];
  assign wire69 = wire66[(2'h3):(2'h2)];
  assign wire70 = $signed({wire27[(4'he):(3'h5)]});
  assign wire71 = $signed(((reg45[(1'h1):(1'h1)] ?
                      (-wire66) : reg37) < {$unsigned({wire47})}));
  assign wire72 = $signed((8'h9f));
  assign wire73 = wire28;
  assign wire74 = $unsigned((^~{((&wire47) ?
                          (reg45 ? reg36 : wire69) : $unsigned(wire46))}));
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire59;
  input wire signed [(4'hf):(1'h0)] wire58;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire [(4'he):(1'h0)] wire56;
  input wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  assign y = {wire63, wire62, wire61, wire60, (1'h0)};
  assign wire60 = $signed(wire57);
  assign wire61 = {wire55[(4'hb):(3'h5)]};
  assign wire62 = wire61;
  assign wire63 = ($signed(wire57[(3'h7):(3'h4)]) ?
                      wire55 : wire58[(4'hd):(1'h0)]);
endmodule

module module109
#(parameter param123 = ({{(^~(8'hab)), (8'hb7)}, {((-(8'hb2)) >= {(8'ha6)}), (((8'had) ? (8'haa) : (8'hb3)) ? {(8'ha5), (8'hb3)} : ((8'ha7) << (8'ha9)))}} ? ((|(~(8'hab))) ^~ (^(+(~^(8'had))))) : ((-{(~|(8'ha8))}) - (((+(7'h44)) + ((8'ha9) ~^ (7'h42))) ~^ (~^((7'h42) ? (8'hbc) : (8'haa)))))), 
parameter param124 = {(param123 <<< ((param123 ? param123 : (param123 ? param123 : param123)) ^~ ((&param123) < param123)))})
(y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire113;
  input wire signed [(3'h6):(1'h0)] wire112;
  input wire [(4'hf):(1'h0)] wire111;
  input wire signed [(5'h10):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire116;
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire118,
                 wire117,
                 wire116,
                 reg119,
                 reg115,
                 reg114,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg114 <= $signed((8'h9d));
      reg115 <= (!$signed(wire113));
    end
  assign wire116 = ($signed($unsigned(wire111)) ? $signed(wire111) : wire112);
  assign wire117 = wire113;
  assign wire118 = ($signed(wire111) >> $unsigned(reg114));
  always
    @(posedge clk) begin
      reg119 <= $unsigned($signed($unsigned(wire116)));
    end
  assign wire120 = (!((~wire113[(4'ha):(4'h8)]) | (wire110[(4'hf):(2'h2)] ^~ (!wire118))));
  assign wire121 = wire118;
  assign wire122 = (reg115[(4'hc):(2'h3)] ?
                       (8'ha5) : ((^((wire110 ? (8'h9e) : wire110) ?
                               (reg115 >> reg115) : wire113[(4'hb):(3'h5)])) ?
                           $unsigned({((8'hb6) <= wire111)}) : $unsigned((|wire120))));
endmodule
