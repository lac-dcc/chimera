module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire92;
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire104,
                 wire103,
                 wire99,
                 wire98,
                 wire5,
                 wire53,
                 wire55,
                 wire92,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg102,
                 reg101,
                 reg100,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire5 = wire4;
  module6 #() modinst54 (wire53, clk, wire2, wire1, wire3, wire4);
  assign wire55 = (wire53[(2'h2):(1'h0)] ?
                      $signed((~^$unsigned(wire4))) : $unsigned($signed({$signed(wire53)})));
  module56 #() modinst93 (.wire60(wire55), .wire58(wire53), .clk(clk), .wire61(wire2), .wire57(wire0), .wire59(wire3), .y(wire92));
  always
    @(posedge clk) begin
      reg94 <= $unsigned({(&(+((8'h9f) ? wire2 : wire3)))});
      reg95 <= $signed((7'h44));
      reg96 <= reg95[(5'h13):(2'h2)];
      reg97 <= $unsigned(((((reg94 ? (8'hb5) : wire92) ^~ (wire92 ?
          reg96 : wire4)) + $unsigned($signed((8'hb2)))) << (^~wire92)));
    end
  assign wire98 = ($unsigned((8'hb0)) ?
                      wire2[(2'h2):(1'h1)] : (^$unsigned({$signed(wire55),
                          wire1[(3'h4):(2'h2)]})));
  assign wire99 = (((|(-reg97)) ? wire53[(4'hf):(2'h2)] : wire92) ?
                      ((7'h41) ?
                          (8'ha2) : $signed(({wire98,
                              (8'ha5)} ~^ $signed(wire1)))) : reg97[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      reg100 <= wire5[(5'h10):(4'he)];
      reg101 <= $signed($signed($unsigned({$signed((8'hbf)),
          $unsigned(reg97)})));
      reg102 <= reg97[(3'h6):(2'h3)];
    end
  assign wire103 = ($unsigned({{wire2[(4'he):(1'h0)],
                               (wire92 ? wire1 : wire53)},
                           (~|(8'h9e))}) ?
                       {wire55, wire5[(5'h12):(3'h6)]} : reg95);
  assign wire104 = (((wire53 == wire5) ?
                           $unsigned($unsigned((~wire2))) : (((&wire53) >> $unsigned(wire103)) <<< wire98)) ?
                       wire103 : $unsigned({$signed($unsigned(reg100)),
                           $unsigned($unsigned(wire1))}));
  always
    @(posedge clk) begin
      reg105 <= wire4[(4'hd):(1'h1)];
      reg106 <= {$unsigned($signed($signed({reg105})))};
      reg107 <= ((~&{({reg102, reg102} ?
              (8'hbe) : (^~wire98))}) != ($signed((8'hbd)) ?
          reg102 : {$unsigned(reg97[(4'h8):(3'h4)]), wire104}));
      reg108 <= wire92;
      if (wire5)
        begin
          reg109 <= ((($signed((8'ha8)) ?
                  (~^{reg96}) : wire4) && ((((8'ha9) < reg96) > $signed(wire53)) ?
                  wire4 : $signed((wire104 ? reg108 : reg100)))) ?
              (({(wire2 ? reg102 : wire92), wire98[(4'he):(3'h7)]} ?
                      (~^(wire98 ^ wire3)) : $signed($signed((8'hb1)))) ?
                  {reg106[(2'h3):(2'h2)]} : reg95[(3'h5):(3'h5)]) : reg107[(4'h8):(2'h3)]);
          reg110 <= ($signed($unsigned((wire55 + $unsigned(reg94)))) > ((-wire55[(1'h0):(1'h0)]) ~^ reg105[(3'h5):(2'h3)]));
          reg111 <= $signed((wire0[(4'hb):(1'h0)] || (!(&$unsigned(wire55)))));
          if ((~^reg97))
            begin
              reg112 <= reg111[(1'h0):(1'h0)];
            end
          else
            begin
              reg112 <= (~^reg105);
              reg113 <= $signed(reg109[(4'hb):(1'h1)]);
            end
          reg114 <= ((+$unsigned((~&$unsigned((8'ha5))))) | $unsigned($signed(reg111[(3'h5):(3'h4)])));
        end
      else
        begin
          reg109 <= wire55[(3'h4):(3'h4)];
        end
    end
  assign wire115 = $unsigned($signed((($unsigned(reg100) ~^ (~reg114)) ?
                       ((wire2 ? wire98 : wire104) ?
                           $signed(wire53) : reg105) : (wire4 + (^~reg107)))));
  assign wire116 = reg107[(3'h5):(2'h3)];
  assign wire117 = (&$unsigned(($unsigned((reg105 ? wire92 : (8'h9f))) ?
                       reg108[(4'hd):(1'h0)] : (^(~reg108)))));
  assign wire118 = wire115[(3'h5):(1'h1)];
  assign wire119 = $signed($unsigned((+(reg108 ?
                       $signed(reg96) : {reg102, wire103}))));
  assign wire120 = {((^(~|(reg114 - wire116))) ?
                           ((wire53 | (wire4 * reg95)) + ((reg109 ?
                               reg100 : wire5) > (-reg94))) : (|reg110)),
                       ($unsigned((-(reg114 < reg112))) & ({(8'h9d)} ^ $signed({wire0,
                           reg96})))};
  assign wire121 = {({(|$signed(wire115)), reg114} | $unsigned({{reg112}}))};
  assign wire122 = (wire115 ?
                       $signed((reg97 * ({reg111} || (reg114 ?
                           wire103 : reg112)))) : wire3);
endmodule

module module56
#(parameter param91 = (-({(~|((8'hbd) ? (8'hbe) : (8'ha8)))} ? {(~^(+(8'hae))), ((^(7'h40)) ? {(7'h42), (7'h43)} : ((8'ha5) >= (8'ha8)))} : ((!{(8'hb3)}) > ({(7'h43), (8'ha0)} ? (~|(8'hac)) : ((8'had) <<< (8'h9d)))))))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire61;
  input wire [(4'h8):(1'h0)] wire60;
  input wire signed [(5'h14):(1'h0)] wire59;
  input wire [(5'h15):(1'h0)] wire58;
  input wire [(5'h12):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  assign y = {wire90, wire88, wire64, wire63, wire62, (1'h0)};
  assign wire62 = $signed($signed(($unsigned($signed(wire58)) >= {wire58[(4'he):(3'h6)],
                      (wire59 ? wire58 : wire61)})));
  assign wire63 = $signed((~{{wire57}}));
  assign wire64 = (~&((((8'ha4) && (^wire58)) ?
                      {(wire59 | wire63),
                          $unsigned(wire61)} : $unsigned((~^wire58))) >= (8'h9f)));
  module65 #() modinst89 (.wire67(wire62), .y(wire88), .wire69(wire64), .clk(clk), .wire66(wire60), .wire68(wire58));
  assign wire90 = $unsigned($unsigned(((8'hb1) >> (~^wire88[(5'h11):(4'ha)]))));
endmodule

module module6
#(parameter param52 = ((-(({(7'h41)} ? ((8'hb3) ? (8'hb1) : (8'haa)) : ((8'haa) * (8'haa))) ? (~&((8'hb5) | (8'hb7))) : {((8'ha0) ~^ (7'h42))})) >> (((((7'h40) | (7'h41)) - ((8'hb7) > (8'h9c))) ? (+((8'hba) >> (8'ha6))) : (((8'hb6) ? (8'hb3) : (8'h9e)) > ((8'hba) ? (7'h44) : (8'haf)))) != (({(8'ha7)} ? (-(8'ha6)) : ((8'ha6) <= (8'hbb))) << (8'h9f)))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire43;
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  module11 #() modinst44 (.wire13(wire10), .wire16(wire9), .clk(clk), .wire15(wire8), .wire14(wire7), .y(wire43), .wire12((8'hb8)));
  assign wire45 = (wire7 ?
                      $signed($unsigned((~^$unsigned((8'hbb))))) : $unsigned((~$unsigned((^wire9)))));
  assign wire46 = $signed($unsigned(wire43));
  assign wire47 = (wire43 ~^ wire9[(4'h9):(4'h8)]);
  assign wire48 = wire43[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg49 <= (wire7 << (wire48[(3'h7):(2'h3)] | wire7[(4'h9):(3'h4)]));
      reg50 <= (((~&$signed((wire9 ^ wire8))) ?
              $unsigned($signed((~&wire47))) : ($signed(wire48) << ({wire8} & wire46[(1'h1):(1'h1)]))) ?
          $signed(($signed((+wire10)) ?
              wire47 : $unsigned(wire46))) : $signed({(~^$signed(wire43))}));
      reg51 <= (wire10[(2'h3):(1'h0)] ?
          {($unsigned((wire10 + wire48)) << {(^~wire46), (~^wire10)}),
              reg50[(1'h0):(1'h0)]} : wire46);
    end
endmodule

module module11
#(parameter param42 = ((&((((8'ha0) <= (8'hba)) ? (~&(8'ha4)) : {(7'h41), (8'hbf)}) ? (((8'hab) < (8'hb5)) == (8'hbc)) : (~((8'hb5) & (8'hb2))))) ? (((((8'hb1) ? (8'ha7) : (8'hb6)) * ((8'hbc) & (8'hab))) - (((8'h9d) == (7'h43)) ? ((8'ha7) << (8'hb0)) : (-(8'hbe)))) >> (~|(((8'hb7) + (8'hbc)) ? ((8'hb7) ? (8'ha6) : (8'hb3)) : ((8'ha9) ? (7'h41) : (8'haf))))) : (((-(~^(8'ha4))) <= ((~^(8'hb3)) <= (~|(8'ha2)))) > ((((8'hb8) ? (8'hb9) : (8'hae)) ? ((8'haa) && (8'ha5)) : ((8'hb0) >> (8'ha6))) ? ({(8'hae), (8'h9c)} ? ((8'hbd) ? (8'hbc) : (8'ha7)) : ((8'h9c) != (8'ha5))) : (+(+(8'hbf)))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg34,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = wire12;
  assign wire18 = wire12[(1'h1):(1'h0)];
  assign wire19 = wire13[(1'h0):(1'h0)];
  assign wire20 = $signed((8'hb5));
  always
    @(posedge clk) begin
      reg21 <= wire20[(2'h3):(1'h1)];
      if ($signed(wire19[(5'h10):(3'h4)]))
        begin
          reg22 <= (-($signed(wire17) + (wire16 ?
              {{(8'hb6), wire16}, reg21} : wire15[(1'h1):(1'h1)])));
          reg23 <= ({$unsigned(wire14), wire16} || $signed($signed(wire20)));
          reg24 <= reg23;
          reg25 <= $unsigned(wire16);
          reg26 <= $signed(($unsigned(wire17[(2'h3):(2'h2)]) ?
              (8'h9e) : {(^~reg23), ((^~reg23) || (reg23 == wire20))}));
        end
      else
        begin
          reg22 <= $signed($unsigned($signed(wire16)));
        end
      if (wire15)
        begin
          reg27 <= (reg21[(4'h8):(2'h3)] << wire15);
          reg28 <= {(reg24[(2'h2):(2'h2)] ?
                  wire13 : ({reg22} ?
                      ({reg24, (8'h9f)} ?
                          (~(8'had)) : reg27) : reg23[(1'h1):(1'h1)]))};
          reg29 <= reg25;
          reg30 <= (~|(reg23[(2'h2):(2'h2)] ?
              wire13 : ($signed((8'hbd)) ?
                  ((+wire18) >> $signed((7'h44))) : wire15[(2'h3):(1'h0)])));
          reg31 <= (|(8'haf));
        end
      else
        begin
          if ((({wire13[(1'h1):(1'h1)]} <<< (^~(^wire17))) ?
              {$signed(reg30),
                  (wire19[(1'h1):(1'h0)] ?
                      (!wire12[(4'ha):(3'h7)]) : $unsigned($unsigned(wire16)))} : $signed($unsigned((reg28[(2'h2):(2'h2)] ?
                  $unsigned(wire15) : (reg30 <<< reg27))))))
            begin
              reg27 <= (+reg27);
              reg28 <= (+$signed((+reg31[(4'ha):(3'h5)])));
            end
          else
            begin
              reg27 <= (($unsigned((wire20[(4'h9):(4'h9)] <<< $signed(wire15))) ?
                  (-(&(~wire19))) : (($unsigned((7'h42)) ?
                      wire19[(1'h0):(1'h0)] : $unsigned((7'h42))) | ($unsigned(reg25) ?
                      reg28[(4'h9):(4'h9)] : wire16))) != ($signed($unsigned({wire15,
                  reg31})) * $unsigned(($unsigned(reg31) ?
                  wire14 : $signed((8'hb3))))));
              reg28 <= $signed(reg25);
              reg29 <= {wire14};
              reg30 <= reg23[(1'h1):(1'h0)];
              reg31 <= $signed(reg22);
            end
        end
    end
  assign wire32 = (~&{reg24});
  assign wire33 = ($signed(wire15) > $unsigned(((8'ha0) ?
                      wire18[(4'hd):(3'h7)] : {(reg23 == reg30)})));
  always
    @(posedge clk) begin
      reg34 <= $signed(reg26[(5'h12):(4'he)]);
    end
  assign wire35 = reg28[(4'he):(4'h9)];
  assign wire36 = $signed(({$unsigned($unsigned((8'h9d)))} ^ (({wire17,
                          (8'hab)} ^~ reg23[(2'h2):(1'h1)]) ?
                      reg31[(4'hb):(3'h4)] : (wire13[(1'h1):(1'h0)] == $signed(reg34)))));
  assign wire37 = reg25[(3'h4):(2'h2)];
  assign wire38 = ((wire17[(5'h13):(4'hd)] ?
                          reg24 : $signed($unsigned($signed(wire13)))) ?
                      {wire20} : (8'ha7));
  assign wire39 = {$unsigned($signed((wire20 * $unsigned(wire14))))};
  assign wire40 = (wire12 ?
                      (((wire38[(1'h1):(1'h0)] ^ $signed(wire36)) == $signed((^~wire32))) >> (-(wire37[(2'h2):(2'h2)] != $unsigned(wire33)))) : $unsigned((^~wire20[(5'h14):(4'he)])));
  assign wire41 = ((wire15[(1'h0):(1'h0)] ?
                      (((wire13 || wire16) ?
                              {reg25, reg23} : wire19[(4'hf):(3'h6)]) ?
                          ((-wire19) ?
                              $unsigned((8'hab)) : wire18[(4'ha):(2'h2)]) : ((&wire19) >= wire13[(1'h0):(1'h0)])) : (^~$unsigned({reg34,
                          reg24}))) - (((8'hae) == $signed(wire39[(4'ha):(3'h4)])) ?
                      $unsigned($unsigned((reg23 ? reg31 : wire38))) : (({reg30,
                              (8'haa)} ?
                          (&wire12) : (wire18 ? wire16 : wire13)) > wire17)));
endmodule

module module65
#(parameter param86 = (~^({(((8'hba) == (8'hb5)) ? (+(8'ha6)) : (~|(8'ha3))), ({(7'h44)} ? (8'hbe) : ((8'hb0) < (8'had)))} <= ((~|((8'ha9) <= (8'ha9))) ? {((8'hbb) & (8'ha6)), ((8'ha4) ? (8'ha7) : (8'ha6))} : ((~^(8'h9e)) ? ((8'ha0) ? (8'ha2) : (8'ha0)) : ((8'hba) ? (8'haa) : (7'h43)))))), 
parameter param87 = param86)
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire68;
  input wire [(3'h4):(1'h0)] wire67;
  input wire [(4'h8):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
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
                 wire70,
                 (1'h0)};
  assign wire70 = $signed(wire67);
  assign wire71 = wire66;
  assign wire72 = ((wire66 + $signed(((wire69 ? wire67 : wire69) > (wire70 ?
                          wire68 : wire66)))) ?
                      (^~({(wire71 ? wire69 : wire71)} ?
                          wire66[(3'h6):(2'h3)] : (^~wire66))) : $unsigned($unsigned(wire69)));
  assign wire73 = {wire68[(2'h2):(1'h1)], (~|wire69[(2'h3):(1'h0)])};
  assign wire74 = $unsigned((8'ha7));
  assign wire75 = ((({$unsigned(wire67), (~wire70)} ?
                          $unsigned(wire67) : wire66) > (^~(|(wire71 << wire72)))) ?
                      wire67 : $signed((^~(&wire72[(2'h2):(2'h2)]))));
  assign wire76 = wire70;
  assign wire77 = wire66;
  assign wire78 = $unsigned($signed($unsigned($signed($unsigned(wire69)))));
  assign wire79 = ($unsigned(((^~wire73[(1'h0):(1'h0)]) | (wire78[(1'h1):(1'h0)] ?
                      ((8'ha6) * wire77) : (~|wire68)))) <<< ($unsigned($signed(wire68)) ?
                      {((wire78 ? wire73 : wire69) ?
                              wire70 : wire77[(1'h1):(1'h1)])} : $unsigned(((|(8'hab)) ?
                          (8'haa) : (!wire69)))));
  assign wire80 = ((8'ha8) >> {{wire78[(4'h9):(1'h1)]}, wire72[(2'h2):(1'h0)]});
  assign wire81 = (wire70 <<< $unsigned($unsigned($unsigned(((8'hbf) >>> wire77)))));
  assign wire82 = $signed($unsigned((wire72[(1'h1):(1'h1)] ?
                      ($unsigned(wire69) ?
                          (|(8'ha8)) : (wire68 ? wire75 : wire76)) : (8'hb3))));
  assign wire83 = wire80[(2'h2):(2'h2)];
  assign wire84 = {wire73[(2'h2):(1'h1)]};
  assign wire85 = {$unsigned($signed(wire76[(4'hb):(3'h7)])),
                      $signed(($signed($signed(wire81)) != $unsigned((wire80 ?
                          wire81 : wire81))))};
endmodule
