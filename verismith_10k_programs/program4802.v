module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire113;
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire45,
                 wire43,
                 wire41,
                 wire39,
                 wire113,
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
                 reg44,
                 reg42,
                 (1'h0)};
  module4 #() modinst40 (wire39, clk, wire3, wire1, wire0, wire2, (8'ha7));
  assign wire41 = $unsigned(($signed(($signed(wire0) ?
                      (wire1 ? (8'had) : (8'hac)) : {wire3,
                          (8'hb5)})) << {$unsigned(wire0),
                      (wire2[(5'h15):(1'h1)] ?
                          (wire1 ? wire0 : wire2) : (wire2 ?
                              wire2 : wire39))}));
  always
    @(posedge clk) begin
      reg42 <= wire1[(1'h0):(1'h0)];
    end
  assign wire43 = ((^~wire39) ?
                      $signed((reg42 ?
                          $signed($signed(wire3)) : $unsigned($unsigned(wire1)))) : $signed(wire1[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg44 <= (~|$signed((~|wire1[(3'h4):(1'h0)])));
    end
  assign wire45 = wire39[(4'hd):(3'h6)];
  always
    @(posedge clk) begin
      if (wire2[(4'hc):(1'h0)])
        begin
          reg46 <= (8'hbd);
          reg47 <= $signed($signed((reg46[(1'h1):(1'h1)] | wire1[(3'h4):(1'h0)])));
          if ($signed(wire1[(1'h1):(1'h0)]))
            begin
              reg48 <= $unsigned(((~|(8'h9c)) ?
                  $unsigned({(+wire0),
                      (wire3 >> wire41)}) : {($signed(reg47) == (|wire45))}));
              reg49 <= {$signed(($unsigned($signed(wire43)) ?
                      (+(~|reg42)) : (wire0 ? {wire45, reg46} : (|reg48)))),
                  wire2};
              reg50 <= ((wire41 ~^ ($unsigned((reg49 | wire39)) ?
                      ({(8'hb7), reg49} ?
                          $signed(wire3) : (reg47 ?
                              wire1 : wire2)) : $unsigned(reg47))) ?
                  $signed($unsigned((!(reg46 ? reg49 : wire2)))) : (~|({reg44,
                          wire41[(2'h3):(2'h3)]} ?
                      reg48 : wire43[(3'h7):(3'h6)])));
            end
          else
            begin
              reg48 <= reg50[(5'h14):(5'h11)];
              reg49 <= ($signed((8'hbb)) ?
                  reg49[(4'hd):(3'h4)] : wire3[(2'h3):(2'h3)]);
              reg50 <= reg50[(1'h0):(1'h0)];
            end
          reg51 <= reg46;
        end
      else
        begin
          reg46 <= (reg47 ? (+$unsigned(wire39[(4'ha):(3'h7)])) : (8'haf));
          reg47 <= $signed(wire1);
          reg48 <= ((&reg47) != $signed({$signed(((7'h43) == reg42)),
              $unsigned($signed((8'haa)))}));
          reg49 <= reg50;
        end
      reg52 <= reg44;
      reg53 <= {((($unsigned(wire0) ^ (wire39 > reg48)) ?
              ({reg47, reg42} ?
                  (^~wire0) : (reg52 || reg47)) : $unsigned((wire3 != wire3))) & $unsigned($signed($unsigned(wire39)))),
          ((8'hb2) >>> wire1[(3'h5):(2'h2)])};
      reg54 <= ($signed(reg47) + $signed((reg46[(1'h0):(1'h0)] == {$unsigned((8'hb0)),
          (reg46 ? reg44 : wire1)})));
      reg55 <= (wire43[(4'hd):(1'h0)] ?
          $signed($signed(reg42[(5'h11):(1'h1)])) : ((8'hb0) && $unsigned($signed({(8'hbc)}))));
    end
  assign wire56 = $unsigned(($unsigned(($signed(reg47) | wire43)) || (^~reg49)));
  assign wire57 = $signed($unsigned((reg50 ?
                      ((reg42 ? wire43 : reg46) ?
                          $unsigned((8'haa)) : (+wire43)) : {reg55,
                          $signed(reg50)})));
  assign wire58 = (!(&wire39[(4'hd):(3'h4)]));
  assign wire59 = $unsigned(reg49);
  module60 #() modinst107 (wire106, clk, reg50, reg55, reg42, wire58, wire3);
  assign wire108 = reg55[(4'h8):(2'h3)];
  assign wire109 = (reg44 ? wire45[(3'h6):(1'h1)] : wire2);
  assign wire110 = {$unsigned((wire43 * ($unsigned(reg44) | {wire3}))),
                       ((($signed(wire2) ?
                               wire2 : reg48[(4'ha):(4'h8)]) != $unsigned(wire2)) ?
                           ({(wire2 ? reg44 : wire56),
                               ((8'ha1) ? reg54 : wire39)} ~^ ({reg49} ?
                               $unsigned((7'h40)) : ((7'h43) >> reg55))) : $unsigned($unsigned($unsigned(wire59))))};
  module4 #() modinst112 (wire111, clk, wire43, wire45, wire3, wire39, wire1);
  module67 #() modinst114 (wire113, clk, wire39, reg47, reg50, reg51);
  assign wire115 = (reg52 ?
                       (wire109[(4'ha):(2'h3)] ?
                           (8'hb9) : $unsigned(wire108[(3'h4):(2'h3)])) : (+reg44));
  assign wire116 = $unsigned($unsigned($unsigned({(wire108 ~^ wire2)})));
  assign wire117 = $signed((|reg55[(2'h2):(1'h0)]));
  assign wire118 = (~|reg42[(4'hd):(4'h8)]);
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire65;
  input wire [(5'h15):(1'h0)] wire64;
  input wire [(5'h10):(1'h0)] wire63;
  input wire [(4'hf):(1'h0)] wire62;
  input wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire66;
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  assign y = {wire104, wire92, wire90, wire88, wire66, reg91, (1'h0)};
  assign wire66 = wire63;
  module67 #() modinst89 (.wire70(wire63), .clk(clk), .wire68(wire62), .y(wire88), .wire71(wire64), .wire69(wire65));
  assign wire90 = (~$signed($signed(wire66)));
  always
    @(posedge clk) begin
      reg91 <= $signed(wire90[(1'h0):(1'h0)]);
    end
  assign wire92 = (~$unsigned(wire66[(2'h3):(2'h2)]));
  module93 #() modinst105 (.wire95(reg91), .wire94(wire65), .wire97(wire64), .clk(clk), .wire96(wire61), .wire98(wire63), .y(wire104));
endmodule

module module4
#(parameter param38 = ((^(!(&(^~(8'hb7))))) >= (~|((-((8'hab) ? (8'hba) : (8'ha1))) ? {{(8'hb7)}, {(8'ha5)}} : ({(8'h9d)} - (&(7'h43)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire [(5'h12):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire26;
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  assign y = {wire37,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  module10 #() modinst27 (.wire14(wire7), .wire12(wire8), .wire11(wire6), .y(wire26), .clk(clk), .wire13(wire9), .wire15(wire5));
  assign wire28 = {($signed(({wire5, wire9} ?
                              (wire5 ?
                                  wire26 : wire8) : wire9[(5'h10):(5'h10)])) ?
                          wire7 : (^~$signed((wire9 & wire7))))};
  assign wire29 = $unsigned((({wire9, wire6[(3'h6):(2'h3)]} >> (wire9 ?
                          $signed(wire28) : wire8[(1'h0):(1'h0)])) ?
                      (|$signed(wire28)) : wire26));
  assign wire30 = (^~(wire8[(4'hd):(3'h5)] == wire8));
  always
    @(posedge clk) begin
      if ($unsigned((~|wire6)))
        begin
          reg31 <= $unsigned(wire8[(4'hb):(3'h4)]);
          reg32 <= (^wire5[(1'h0):(1'h0)]);
        end
      else
        begin
          reg31 <= ($signed($signed((!wire28[(4'hb):(4'h8)]))) << (^~$signed(({wire5} ?
              (wire30 ? wire5 : wire9) : (wire29 >= wire29)))));
          reg32 <= (8'ha2);
          reg33 <= wire30;
          reg34 <= {wire29, $unsigned(wire7)};
        end
      reg35 <= $signed(wire6);
      reg36 <= {(((wire6 ~^ (8'h9c)) | {$signed(wire7)}) ^ wire28[(4'hd):(3'h6)])};
    end
  assign wire37 = (($signed((8'hbf)) ?
                          $signed($signed(wire8[(5'h13):(3'h7)])) : $signed({$signed(reg32)})) ?
                      $unsigned($unsigned((wire29 ?
                          (-wire8) : reg35[(3'h4):(3'h4)]))) : wire28[(4'hd):(4'ha)]);
endmodule

module module10
#(parameter param25 = (~|(((-(^~(8'ha8))) >>> (((8'ha7) ? (8'hab) : (8'ha6)) ? (!(8'ha8)) : {(8'hb5)})) ? ({(|(8'hac)), {(8'hac), (8'hb0)}} ? (((8'ha1) ~^ (8'ha5)) ? (~&(8'hbe)) : ((8'h9d) ? (8'hb9) : (8'hb6))) : ({(8'hab)} ? (~^(7'h40)) : ((8'hb6) ? (8'ha6) : (8'hb9)))) : ((8'ha1) ~^ (((8'hbc) > (8'h9c)) ? (&(8'h9e)) : (^(8'ha1)))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire13;
  input wire [(3'h5):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire16 = (^~wire14);
  assign wire17 = (wire15 <= $signed($unsigned(wire15)));
  assign wire18 = $signed(wire11);
  assign wire19 = wire17[(1'h0):(1'h0)];
  assign wire20 = wire18[(4'h9):(3'h4)];
  assign wire21 = $unsigned(wire14);
  always
    @(posedge clk) begin
      reg22 <= (~|{$signed((^$signed((8'hb8))))});
      reg23 <= wire19;
      reg24 <= ($signed(wire12) ?
          (-$unsigned({wire16, wire12})) : (wire21[(2'h2):(1'h0)] ?
              ($signed((wire11 ? wire19 : wire18)) ^ ((|reg22) ?
                  wire12[(2'h3):(2'h2)] : (wire15 >>> wire17))) : $unsigned(((~|wire16) ?
                  $unsigned(wire13) : wire17[(1'h1):(1'h0)]))));
    end
endmodule

module module93  (y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire98;
  input wire [(4'ha):(1'h0)] wire97;
  input wire [(4'h9):(1'h0)] wire96;
  input wire [(4'hd):(1'h0)] wire95;
  input wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  assign y = {wire103, wire102, wire101, wire100, wire99, (1'h0)};
  assign wire99 = (^wire94[(2'h3):(1'h1)]);
  assign wire100 = wire95;
  assign wire101 = (8'hb8);
  assign wire102 = (wire97 <<< (wire101 ?
                       $signed(wire94) : $signed(($unsigned(wire96) ^ wire96))));
  assign wire103 = (wire101[(4'h9):(3'h7)] ?
                       wire95[(4'h9):(2'h2)] : wire100[(4'hb):(3'h6)]);
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire71;
  input wire [(3'h4):(1'h0)] wire70;
  input wire [(3'h6):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  assign y = {wire87,
                 wire86,
                 wire85,
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
                 (1'h0)};
  assign wire72 = (((({wire68,
                          wire69} & wire68) * $signed(wire70[(2'h2):(2'h2)])) ^ $unsigned((wire70 ?
                          wire71 : wire71[(5'h10):(4'he)]))) ?
                      $signed((~^$unsigned(wire69))) : (((~^$unsigned(wire68)) == $signed($signed(wire69))) ?
                          ((~&wire71[(4'h8):(2'h2)]) ?
                              $signed($signed(wire71)) : wire69) : $unsigned($unsigned(wire71))));
  assign wire73 = {$unsigned((wire69[(2'h3):(2'h2)] ?
                          {{wire70, wire69},
                              (wire69 ? wire70 : wire72)} : ((wire70 + wire69) ?
                              wire71[(5'h11):(4'h9)] : wire72)))};
  assign wire74 = $unsigned((((wire71 ?
                          ((8'haf) ?
                              wire69 : wire68) : (~&wire70)) - wire69[(3'h4):(2'h3)]) ?
                      (-$unsigned($signed(wire71))) : wire73[(4'hf):(4'hd)]));
  assign wire75 = wire71;
  assign wire76 = wire72[(1'h0):(1'h0)];
  assign wire77 = (wire68[(3'h7):(3'h7)] ?
                      wire68[(3'h7):(3'h5)] : ((&wire70[(3'h4):(1'h0)]) & $signed((+wire71))));
  assign wire78 = (+wire72[(3'h5):(2'h3)]);
  assign wire79 = wire72[(1'h1):(1'h1)];
  assign wire80 = $signed(wire77);
  assign wire81 = $unsigned(wire74);
  assign wire82 = $unsigned($unsigned(((!wire69) ?
                      (+$unsigned(wire78)) : (-wire70))));
  assign wire83 = wire81[(1'h1):(1'h0)];
  assign wire84 = ((!(wire83[(2'h2):(1'h0)] >>> (((8'hbc) + (8'ha8)) == $signed(wire76)))) ?
                      wire72[(3'h5):(3'h5)] : (~^wire81[(1'h0):(1'h0)]));
  assign wire85 = ({wire70[(2'h2):(1'h0)]} * (^~$signed((^$signed(wire72)))));
  assign wire86 = $unsigned($signed($signed({wire85[(4'hc):(4'ha)]})));
  assign wire87 = {(wire76[(1'h1):(1'h0)] ?
                          ($signed((^~wire83)) ?
                              $signed((&wire81)) : (wire72[(3'h4):(1'h0)] <<< $unsigned(wire85))) : wire77[(1'h1):(1'h0)])};
endmodule
