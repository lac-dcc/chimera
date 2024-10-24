module top
#(parameter param138 = {((((|(8'hac)) ^ ((8'hbc) >> (8'hbd))) ? (((8'ha2) + (8'hac)) || ((8'hb8) * (8'h9c))) : (((8'hbc) ? (8'ha7) : (7'h40)) ? ((7'h40) || (8'ha5)) : ((8'ha0) ? (8'ha5) : (8'hbd)))) && ({((8'ha3) | (8'hbb)), ((8'h9d) >> (8'h9d))} ? ((&(8'hb5)) ^~ {(8'haa), (8'h9f)}) : (!(~(8'ha9))))), (((((8'ha9) ? (8'haf) : (8'hae)) >= (-(8'ha8))) ~^ (~&((8'h9c) >>> (8'hb1)))) ? ((((7'h42) ? (8'hb3) : (8'ha8)) < (~&(8'hb2))) & (^(^~(8'hb2)))) : (|({(8'hb3)} ? ((8'haf) ? (7'h40) : (8'hba)) : {(8'ha5), (8'haa)})))}, 
parameter param139 = {(((param138 || (param138 ? param138 : param138)) ? ((param138 ? param138 : param138) <= param138) : (|{param138, param138})) ? {{param138, (~param138)}} : (~(^(param138 ? (7'h41) : param138)))), param138})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire134,
                 wire10,
                 wire5,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1[(3'h6):(1'h1)];
  assign wire5 = {(~&wire1[(3'h4):(2'h2)])};
  always
    @(posedge clk) begin
      reg6 <= wire4[(2'h3):(2'h2)];
      reg7 <= ((wire4[(1'h1):(1'h0)] * wire5[(2'h2):(1'h0)]) | wire4[(4'hc):(4'hc)]);
      reg8 <= wire4[(4'hc):(4'h9)];
      reg9 <= (wire2 ? wire5 : $signed(wire5[(2'h3):(1'h1)]));
    end
  assign wire10 = $signed((~|(~&$unsigned(((8'hb3) ? wire4 : wire0)))));
  module11 #() modinst135 (wire134, clk, wire10, reg8, reg6, wire5);
  assign wire136 = {wire3[(3'h5):(1'h1)]};
  assign wire137 = wire134[(5'h12):(4'hd)];
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire81;
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire83,
                 wire55,
                 wire18,
                 wire17,
                 wire16,
                 wire81,
                 (1'h0)};
  assign wire16 = (|(^~($unsigned(wire12[(1'h0):(1'h0)]) ?
                      ((&wire13) | (wire14 ^ wire13)) : wire13[(2'h3):(2'h2)])));
  assign wire17 = wire16;
  assign wire18 = wire14[(1'h0):(1'h0)];
  module19 #() modinst56 (wire55, clk, wire16, wire13, wire15, wire18, wire12);
  module57 #() modinst82 (wire81, clk, wire12, wire16, wire13, wire55, wire18);
  assign wire83 = wire16;
  module84 #() modinst127 (.wire87(wire15), .wire88(wire13), .y(wire126), .clk(clk), .wire85(wire12), .wire86(wire16));
  assign wire128 = (-$signed(wire12));
  assign wire129 = wire83;
  assign wire130 = ((wire13[(4'he):(4'hb)] ?
                       $unsigned((8'hab)) : wire55[(4'hd):(3'h5)]) - (wire126 == wire129[(2'h2):(2'h2)]));
  assign wire131 = (((((~wire12) ? (wire83 ? wire15 : wire129) : (8'hab)) ?
                           ((8'ha1) * $signed(wire18)) : $signed((wire129 ?
                               (8'hb5) : wire14))) || $unsigned(wire18)) ?
                       wire15 : wire15);
  assign wire132 = (~{wire13,
                       $unsigned($unsigned(((8'hba) ? wire129 : wire13)))});
  assign wire133 = ((|(wire14[(1'h1):(1'h0)] ^ wire132)) ^~ {$signed((!wire18)),
                       {$signed(wire15),
                           ({wire131} - (wire83 ? wire18 : wire13))}});
endmodule

module module84
#(parameter param124 = ((+(((^(8'ha8)) ? (~(7'h40)) : ((8'hb7) & (8'ha9))) ? {{(7'h42), (8'h9d)}} : (((8'hb4) ? (8'haf) : (8'ha9)) ~^ ((8'hbc) ? (8'hb5) : (8'hac))))) != ({(7'h41)} - (~&({(7'h41)} <<< {(8'hb3)})))), 
parameter param125 = (^~((((|param124) ? ((8'ha3) ? param124 : param124) : (param124 ? (8'hac) : param124)) ? param124 : param124) * ({(param124 ^ param124), ((8'hae) < param124)} ? (!(~^param124)) : ((param124 ? (8'hb6) : param124) ? (param124 ? param124 : param124) : param124)))))
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  input wire signed [(4'hc):(1'h0)] wire86;
  input wire [(3'h6):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire100;
  wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire89;
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire89 = wire88;
  assign wire90 = {($unsigned((wire88[(4'hb):(1'h0)] & $signed(wire88))) ?
                          {((wire88 >> wire86) >>> wire85),
                              $signed($signed((8'ha9)))} : ({(wire86 ?
                                      wire86 : wire89),
                                  (wire89 ? wire86 : wire86)} ?
                              {(~|wire89),
                                  ((8'hbb) ?
                                      wire86 : wire87)} : ({wire85} < (~^wire86)))),
                      $signed($unsigned($unsigned((~^wire88))))};
  assign wire91 = ($signed(wire90) ^ $unsigned((wire89 ?
                      ($unsigned((7'h42)) == ((8'ha0) & (8'haf))) : ((wire85 != wire87) ?
                          (wire89 ^ (8'ha4)) : $signed(wire85)))));
  assign wire92 = (wire88[(4'hb):(3'h5)] ~^ $unsigned($signed($signed($unsigned(wire86)))));
  assign wire93 = wire91[(3'h6):(1'h1)];
  assign wire94 = wire89[(3'h7):(1'h1)];
  assign wire95 = ($unsigned((~|((wire94 ?
                      (8'ha1) : wire94) == (wire85 && wire93)))) || wire92);
  assign wire96 = $unsigned({(+(wire91 - {(8'hb4)})), wire93});
  assign wire97 = ((8'hac) <<< (^~($signed(wire96) ?
                      wire86[(4'hb):(3'h7)] : $signed($signed(wire87)))));
  assign wire98 = (^wire87);
  assign wire99 = $unsigned($signed((+wire98[(5'h10):(3'h4)])));
  assign wire100 = wire86[(4'h9):(4'h9)];
  assign wire101 = (8'ha4);
  assign wire102 = (((-(~&$unsigned(wire92))) << wire89) <= wire95);
  assign wire103 = ((wire88 ? wire93[(1'h0):(1'h0)] : wire97) ?
                       wire86 : wire85);
  assign wire104 = $unsigned(wire96[(5'h14):(4'ha)]);
  assign wire105 = $signed((($signed({wire91, wire102}) >> (&((8'hab) ?
                       wire85 : wire99))) & wire96));
  assign wire106 = (~&$unsigned(wire102));
  assign wire107 = $signed((wire89 ?
                       wire105[(1'h1):(1'h0)] : $signed((^(8'hbc)))));
  assign wire108 = ((($unsigned((wire92 - wire89)) && wire89[(5'h11):(4'h8)]) ^~ (-$signed($signed((8'hb5))))) ?
                       wire101 : $unsigned(((wire86 ?
                               wire91[(3'h4):(3'h4)] : {wire86}) ?
                           wire106 : (wire96[(5'h14):(4'h8)] ?
                               $unsigned(wire88) : (wire89 ?
                                   wire85 : wire86)))));
  assign wire109 = ({$unsigned($signed((^~wire94)))} ^ {wire107[(1'h0):(1'h0)]});
  assign wire110 = wire109;
  always
    @(posedge clk) begin
      reg111 <= wire105;
      if (wire105)
        begin
          if ((((wire90 ?
                  ($unsigned(wire99) + (|wire97)) : (~&{wire98,
                      wire93})) > $unsigned(((&wire97) ?
                  (~|wire89) : wire108))) ?
              wire87[(1'h1):(1'h1)] : $signed({((wire101 ?
                      wire99 : wire90) * (+wire103))})))
            begin
              reg112 <= (+wire104[(1'h0):(1'h0)]);
            end
          else
            begin
              reg112 <= wire105[(1'h0):(1'h0)];
              reg113 <= (((8'ha0) ?
                  ($signed($unsigned(wire101)) ?
                      ((wire100 + wire107) + (8'hbf)) : (wire101 ?
                          wire94 : reg112)) : (~&$unsigned((wire104 ?
                      wire100 : wire105)))) > wire106);
              reg114 <= (|wire88);
              reg115 <= $unsigned({(|wire92)});
              reg116 <= $unsigned(((wire101 - ((|(8'hb3)) << $signed(wire85))) << wire101));
            end
          reg117 <= $unsigned({(-wire107[(3'h4):(2'h2)])});
        end
      else
        begin
          reg112 <= (($unsigned(wire110[(3'h4):(3'h4)]) ?
              $unsigned($unsigned($unsigned(reg111))) : wire106) >>> wire109[(3'h7):(3'h6)]);
          reg113 <= $unsigned(wire96);
          reg114 <= $unsigned(({{(reg111 >> (8'ha6)),
                      (wire86 ? wire107 : (8'ha4))}} ?
              wire97[(3'h6):(3'h4)] : wire90[(1'h0):(1'h0)]));
          reg115 <= (^wire110[(4'h9):(3'h5)]);
        end
      reg118 <= $signed($unsigned(reg111[(3'h4):(2'h2)]));
      if (wire104[(1'h0):(1'h0)])
        begin
          reg119 <= ($unsigned($signed((^~$unsigned(wire102)))) ?
              $unsigned((~&$signed((7'h41)))) : {(((wire109 ? wire85 : reg115) ?
                      wire103[(2'h2):(2'h2)] : (wire97 + wire89)) <= {{(8'ha2),
                          wire99},
                      $unsigned((8'hba))})});
          reg120 <= $signed($unsigned($signed(({wire110} != (7'h44)))));
          reg121 <= ((~&(reg115[(3'h7):(2'h2)] != $unsigned((wire103 << (8'hb0))))) && $signed($unsigned($signed(wire109[(2'h2):(2'h2)]))));
          reg122 <= $unsigned($unsigned({{wire89, reg119[(1'h1):(1'h1)]},
              (-{(8'hab)})}));
          reg123 <= (wire89[(5'h11):(3'h4)] ?
              $signed($unsigned(wire102)) : ((-$unsigned($signed(wire107))) == (reg117 ?
                  wire105[(2'h2):(1'h0)] : wire98)));
        end
      else
        begin
          reg119 <= (reg114 ?
              (wire104 <<< (wire110 <<< ((~&reg121) ?
                  (reg111 + wire93) : (~|reg123)))) : (|$signed(wire110)));
          reg120 <= (wire86[(3'h5):(1'h1)] < (^(!$unsigned(reg115[(5'h10):(4'h9)]))));
          reg121 <= {(~{wire89}),
              ((reg120[(4'h8):(2'h3)] << $unsigned((wire94 ?
                      wire103 : wire106))) ?
                  $signed((~&(reg120 ^ (8'ha8)))) : {wire86[(3'h4):(3'h4)],
                      (wire94 & (~reg120))})};
        end
    end
endmodule

module module57  (y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire62;
  input wire [(4'hb):(1'h0)] wire61;
  input wire signed [(5'h10):(1'h0)] wire60;
  input wire signed [(2'h2):(1'h0)] wire59;
  input wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire63 = ((&$signed({(&(8'hb9))})) ^ ((~|{$signed(wire61),
                          $signed(wire60)}) ?
                      (-{((8'ha9) * wire59),
                          (wire62 <<< (7'h43))}) : $signed({$signed((8'h9d)),
                          (wire59 ? wire60 : wire61)})));
  assign wire64 = (~|((|$unsigned(((7'h42) <= wire59))) ?
                      wire62 : (-$signed((wire58 ~^ wire59)))));
  assign wire65 = $signed($unsigned((($signed(wire58) & (wire62 >>> wire64)) ?
                      (wire63[(5'h11):(2'h2)] ?
                          (wire62 ^ wire63) : (wire64 | wire64)) : $signed((wire62 ?
                          wire63 : wire58)))));
  assign wire66 = $signed({(wire61[(4'h8):(3'h5)] ?
                          (&$unsigned(wire65)) : (~$signed(wire63))),
                      $unsigned({$signed(wire62)})});
  assign wire67 = {wire59};
  assign wire68 = {wire58[(4'h8):(1'h1)], wire67[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg69 <= $unsigned($unsigned(wire68[(1'h0):(1'h0)]));
      reg70 <= (&(wire65[(3'h5):(2'h2)] * wire66[(2'h3):(2'h2)]));
    end
  assign wire71 = wire63;
  assign wire72 = $unsigned(wire65);
  assign wire73 = $signed($signed($signed((+((8'hb4) | wire60)))));
  assign wire74 = wire59[(1'h1):(1'h0)];
  assign wire75 = (+(wire61 ?
                      $signed({(wire67 ^ wire58),
                          $unsigned((8'hba))}) : ((&(wire74 ?
                          wire59 : wire59)) ^~ ($signed(wire68) || ((8'haa) ?
                          (7'h41) : (8'hbd))))));
  assign wire76 = ((&$signed(((wire63 ? wire61 : wire63) ?
                          $unsigned(wire75) : (!(8'h9e))))) ?
                      {$signed((|(wire59 ? wire71 : wire66))),
                          (^~(8'hae))} : (-(($signed(wire73) >>> $signed((7'h43))) ?
                          wire65 : $unsigned($unsigned(wire68)))));
  assign wire77 = (wire71[(3'h5):(2'h2)] == (~$unsigned(((wire66 || wire74) - (wire60 ?
                      (8'ha9) : wire72)))));
  assign wire78 = reg70[(1'h0):(1'h0)];
  assign wire79 = (($signed(($signed(reg70) - (wire72 ? wire62 : reg69))) ?
                      (~&((^(8'haf)) ?
                          $unsigned(wire74) : $unsigned(wire59))) : ($signed({wire76}) - $unsigned(reg69))) || (^(~$signed(wire66[(2'h2):(2'h2)]))));
  assign wire80 = (8'hb8);
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire45,
                 wire44,
                 wire43,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg48,
                 reg47,
                 reg46,
                 reg42,
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
                 reg30,
                 (1'h0)};
  assign wire25 = $signed($signed(($signed(wire21[(4'h8):(2'h3)]) ?
                      $signed($signed(wire21)) : $signed($signed(wire23)))));
  assign wire26 = $unsigned(($signed(wire23[(4'h9):(3'h7)]) ?
                      $signed((~|$unsigned(wire24))) : $signed((~(wire21 ?
                          (8'h9f) : wire23)))));
  assign wire27 = ((wire25[(4'h8):(3'h5)] + {wire22,
                      $unsigned(((8'hb5) ?
                          wire23 : wire23))}) >>> wire26[(4'h9):(1'h0)]);
  assign wire28 = ($unsigned({(wire24 ?
                              (wire25 ?
                                  wire21 : wire26) : $unsigned((8'hb7)))}) ?
                      $signed(((!wire21[(5'h11):(1'h0)]) && wire27)) : {$unsigned((wire20[(4'h9):(4'h9)] ?
                              $signed(wire23) : wire25[(4'h8):(3'h5)])),
                          (+wire27)});
  assign wire29 = wire27;
  always
    @(posedge clk) begin
      reg30 <= wire21;
      reg31 <= $signed((wire27[(2'h2):(1'h0)] > $unsigned($signed(wire27))));
      reg32 <= wire20[(1'h0):(1'h0)];
      reg33 <= $unsigned(wire27);
    end
  always
    @(posedge clk) begin
      reg34 <= reg32;
      if ({reg32[(1'h1):(1'h0)]})
        begin
          if (({(reg33 >> $signed($signed(reg30))),
                  ({$unsigned((8'ha9))} >= ($signed(wire22) ?
                      $signed(reg32) : $signed(wire24)))} ?
              (~&({{(8'hae), (8'ha6)}, $signed(reg30)} ?
                  (wire25 != wire27[(1'h1):(1'h0)]) : wire25)) : ($signed($unsigned(wire26[(1'h1):(1'h0)])) ?
                  wire27 : reg34)))
            begin
              reg35 <= wire27[(1'h0):(1'h0)];
            end
          else
            begin
              reg35 <= (((+((reg35 >= reg35) && reg30[(2'h3):(2'h2)])) ?
                  $unsigned((~|$signed(wire22))) : ((((8'ha0) ?
                          wire23 : wire23) >= (reg31 * wire26)) ?
                      (~^(wire27 != reg30)) : (|(8'h9f)))) > reg32[(2'h3):(1'h0)]);
              reg36 <= wire20[(1'h1):(1'h1)];
              reg37 <= (($signed($signed((wire21 ^ wire27))) ?
                      wire23 : $signed({$unsigned(reg32), (wire25 | wire21)})) ?
                  $unsigned(((^(^(7'h40))) >>> (~&(reg31 >>> (8'hbb))))) : $unsigned((($unsigned(wire22) ?
                      wire21 : $unsigned(wire20)) >> (|wire24))));
              reg38 <= $unsigned(wire29[(3'h6):(3'h4)]);
            end
        end
      else
        begin
          reg35 <= {((wire28 ?
                  (|((8'hbe) * reg37)) : (wire22[(1'h1):(1'h1)] ^ wire26)) <<< reg30[(3'h7):(2'h3)])};
          reg36 <= reg38[(3'h4):(2'h2)];
          reg37 <= (wire28[(4'hc):(2'h3)] >= ((7'h44) ?
              ({(reg30 - reg36), $unsigned((8'hb2))} ?
                  ((8'haa) ? wire21[(3'h6):(2'h3)] : {wire23}) : ((wire21 ?
                      wire28 : reg36) || wire21[(4'h9):(1'h1)])) : ((^~(~^(8'hb9))) ?
                  $unsigned(reg35[(1'h0):(1'h0)]) : (~^$signed(wire25)))));
          if (reg31)
            begin
              reg38 <= wire27[(2'h3):(1'h1)];
              reg39 <= $signed($signed((($signed(wire26) - (~reg35)) ?
                  {$unsigned(wire20),
                      reg33[(2'h2):(1'h0)]} : $unsigned((wire28 <= (8'hb7))))));
              reg40 <= reg38;
            end
          else
            begin
              reg38 <= (+$signed($signed((wire22[(4'ha):(1'h1)] >= $signed(wire20)))));
              reg39 <= (reg36 * (8'hbd));
              reg40 <= reg37[(3'h7):(3'h6)];
              reg41 <= $unsigned(reg35[(1'h0):(1'h0)]);
            end
        end
      reg42 <= ($unsigned(reg40) != ($unsigned(((reg30 ?
              wire27 : reg31) != $unsigned(reg32))) ?
          (|((reg35 ? wire26 : wire23) + (~^wire29))) : wire22));
    end
  assign wire43 = $unsigned($unsigned((((^reg38) ?
                          wire22[(4'ha):(2'h3)] : {wire25}) ?
                      $signed((wire24 == reg34)) : (!$unsigned((8'h9c))))));
  assign wire44 = reg40;
  assign wire45 = wire22;
  always
    @(posedge clk) begin
      reg46 <= ($unsigned((wire22 <<< (+$unsigned(wire25)))) + (&$signed(({reg33} ?
          (reg36 ? reg32 : (8'hbd)) : reg31[(1'h1):(1'h1)]))));
      reg47 <= ($unsigned(((wire43 ^ {reg36, wire24}) ?
          wire21 : (|{reg36}))) || $unsigned(($unsigned(wire22) * $signed((wire25 | wire20)))));
      reg48 <= $unsigned(($signed({((8'ha8) << reg37),
          reg34[(1'h1):(1'h0)]}) && $signed(wire44)));
    end
  assign wire49 = (wire44[(5'h12):(5'h10)] << ((({reg31,
                          (8'hbf)} - reg35[(3'h4):(1'h0)]) ?
                      $unsigned({wire27}) : wire24[(4'hc):(4'h8)]) == ($signed((wire25 != reg34)) ?
                      ($unsigned(wire29) >> wire26[(5'h14):(1'h1)]) : ((wire20 - reg36) | (reg39 ?
                          (8'hab) : wire24)))));
  assign wire50 = ($signed($signed(({(8'hab),
                      reg40} ~^ wire45))) != $unsigned({{reg32}}));
  assign wire51 = (|(~wire45[(4'hb):(1'h0)]));
  assign wire52 = (wire44[(1'h0):(1'h0)] ? (8'h9f) : {(~&wire21)});
  assign wire53 = $signed((8'hba));
  assign wire54 = wire50[(2'h3):(2'h3)];
endmodule
