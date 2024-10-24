module top
#(parameter param129 = ((~^{(8'hb1), {((8'hbc) ~^ (8'hbd))}}) ^~ (8'hbd)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire104;
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  module5 #() modinst105 (.wire6(wire4), .wire8(wire0), .y(wire104), .wire7(wire3), .wire10(wire2), .clk(clk), .wire9(wire1));
  assign wire106 = $signed(((-wire3) ?
                       ({wire3} ?
                           wire0 : (wire0[(4'he):(4'hc)] == $unsigned(wire3))) : $unsigned(wire3[(2'h3):(1'h1)])));
  assign wire107 = $unsigned($unsigned(($unsigned($signed(wire1)) & ((wire4 && (8'hb8)) ?
                       (wire0 ? wire3 : wire0) : (wire1 ? wire1 : (8'hb9))))));
  assign wire108 = $signed((~|$signed((&(wire3 ^~ (7'h42))))));
  assign wire109 = (wire4[(4'hc):(3'h7)] ?
                       wire2 : {wire4[(2'h2):(2'h2)],
                           (-(wire106 ? $signed(wire104) : $unsigned(wire2)))});
  assign wire110 = (wire109[(1'h0):(1'h0)] == $signed(wire2[(2'h2):(2'h2)]));
  assign wire111 = wire1;
  assign wire112 = (~&wire106);
  assign wire113 = (-$signed(wire2));
  assign wire114 = (+wire2[(4'he):(2'h2)]);
  assign wire115 = $signed(wire113);
  always
    @(posedge clk) begin
      if (($unsigned(((wire4[(5'h12):(5'h10)] | $signed(wire1)) ?
          wire0 : (wire113[(1'h0):(1'h0)] ?
              wire109 : $signed(wire111)))) ^~ $signed(($signed((wire4 != wire115)) ?
          wire111 : (8'ha0)))))
        begin
          if ((wire111[(4'hc):(4'hb)] ? wire108 : wire2))
            begin
              reg116 <= ((8'hb1) <= wire113[(3'h5):(3'h4)]);
            end
          else
            begin
              reg116 <= (+{$unsigned($signed(wire110))});
              reg117 <= $unsigned(wire113[(2'h2):(1'h1)]);
              reg118 <= wire111;
              reg119 <= wire106;
            end
        end
      else
        begin
          reg116 <= ({$signed(((-wire115) != wire114)),
              (!$signed($signed(wire110)))} != (wire114 ^~ wire111[(3'h6):(1'h1)]));
          reg117 <= ($signed({reg119,
              ($unsigned(wire104) << (wire4 ?
                  wire107 : wire113))}) * (wire1[(1'h1):(1'h1)] ?
              {$signed($unsigned((8'ha6))), wire112} : $signed(wire1)));
          reg118 <= (&$unsigned((wire112 > $signed($unsigned(wire2)))));
          reg119 <= wire4[(4'hf):(2'h2)];
          reg120 <= {({(wire104 ?
                      $unsigned(wire4) : {(8'haa),
                          (8'haa)})} + (+(wire4[(4'h8):(2'h2)] ?
                  {wire113} : $signed(wire114))))};
        end
      if ($unsigned(wire0))
        begin
          reg121 <= $signed(((~&(!(wire113 ? wire0 : wire111))) != (wire113 ?
              {{reg118, wire115}} : (8'h9f))));
          reg122 <= wire1;
          reg123 <= $signed({wire104[(1'h0):(1'h0)]});
          reg124 <= {$unsigned((({reg121,
                  wire109} >> reg121) - reg118[(3'h5):(3'h5)])),
              ((8'hb3) ?
                  (reg116 & ((-reg118) ?
                      $unsigned((8'hb7)) : (wire0 ?
                          wire3 : wire115))) : $unsigned(wire115))};
          reg125 <= $unsigned($unsigned(reg119));
        end
      else
        begin
          if ((^($signed(wire111) ?
              (~($unsigned(wire115) ^~ (wire4 == (8'hbe)))) : reg116)))
            begin
              reg121 <= wire113[(4'h8):(3'h7)];
              reg122 <= (&$signed(wire113));
              reg123 <= wire4;
              reg124 <= $unsigned($signed(reg122[(2'h2):(1'h1)]));
              reg125 <= ({(wire115[(4'hb):(3'h6)] >>> $signed($unsigned(wire106)))} ?
                  (wire108 - $signed(((wire109 ? wire111 : wire0) ?
                      {reg118,
                          wire2} : (reg125 || wire111)))) : wire114[(1'h1):(1'h1)]);
            end
          else
            begin
              reg121 <= reg122[(2'h3):(2'h2)];
              reg122 <= (~($signed((wire106[(3'h4):(2'h3)] >> (wire113 ?
                  reg116 : (8'h9f)))) >= (~|((wire111 << wire115) >>> (reg117 | wire110)))));
              reg123 <= $unsigned($signed((wire2 <<< $signed($unsigned(reg123)))));
            end
          reg126 <= (wire113 <= reg120);
        end
      reg127 <= reg125[(5'h13):(4'h9)];
    end
  always
    @(posedge clk) begin
      reg128 <= ({reg122} ?
          $signed(wire4) : $unsigned(({$signed((7'h40))} ?
              ($unsigned(wire106) ? wire108 : (~reg121)) : ({wire104} ?
                  wire106 : {reg119}))));
    end
endmodule

module module5
#(parameter param103 = ((+((~^(!(8'ha2))) ? (|{(7'h42), (8'hab)}) : (((8'hbd) ? (8'hbc) : (8'hab)) + (^~(8'h9c))))) == (({(~|(8'ha8))} != (^((8'h9e) && (8'hbe)))) ? ((~((8'ha3) > (8'had))) ? (((8'hb9) ? (8'hb3) : (8'hb5)) ? {(8'hbd)} : (~|(8'ha3))) : (-{(8'hb4)})) : ((((8'ha6) ? (8'hbf) : (7'h40)) ? ((8'ha2) - (8'h9d)) : ((8'ha3) <<< (8'hb7))) ? (!(8'ha6)) : (((8'hb4) ? (8'hbc) : (8'ha6)) ? ((8'h9f) ? (8'hbe) : (7'h42)) : (~&(8'haa)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire84;
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  assign y = {wire101,
                 wire31,
                 wire33,
                 wire34,
                 wire36,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire84,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 (1'h0)};
  module11 #() modinst32 (wire31, clk, wire6, wire8, wire9, wire10);
  assign wire33 = $signed(wire6[(3'h5):(1'h0)]);
  assign wire34 = $unsigned(wire9);
  always
    @(posedge clk) begin
      reg35 <= wire7[(1'h1):(1'h0)];
    end
  assign wire36 = wire7;
  always
    @(posedge clk) begin
      if (wire36[(1'h1):(1'h1)])
        begin
          reg37 <= $unsigned(((((wire10 ?
              wire9 : wire10) <= (~^wire7)) && {$signed((8'hb2))}) | {(wire31 ?
                  $unsigned(reg35) : wire36[(2'h2):(2'h2)]),
              $signed({wire6, wire6})}));
          reg38 <= $signed(((+(wire36[(2'h2):(1'h0)] - (wire7 ~^ wire33))) ?
              ((8'hbb) ?
                  wire6 : $signed({wire36,
                      wire8})) : $unsigned($unsigned($signed((8'ha4))))));
          if ((wire7[(2'h3):(2'h3)] ^~ $unsigned((&reg37))))
            begin
              reg39 <= wire31[(3'h6):(2'h2)];
            end
          else
            begin
              reg39 <= wire34;
              reg40 <= (8'ha5);
              reg41 <= (&$signed(wire10));
              reg42 <= {wire9};
              reg43 <= ({({reg39[(3'h6):(2'h2)],
                          ((8'hbb) ? reg38 : (8'hb9))} * (wire8 ?
                          (wire34 >>> wire31) : reg39))} ?
                  (|wire7) : {reg39});
            end
          reg44 <= (8'hb9);
          reg45 <= reg40[(3'h7):(3'h4)];
        end
      else
        begin
          reg37 <= (wire33[(3'h7):(3'h6)] && wire9[(4'hf):(4'hb)]);
          reg38 <= reg37[(3'h4):(1'h0)];
          reg39 <= {wire36, wire9};
          reg40 <= $unsigned(wire10);
        end
      if ($signed(reg37))
        begin
          reg46 <= (8'h9c);
          reg47 <= (wire31[(4'he):(2'h2)] ?
              (({$unsigned((8'ha5)), reg42} ?
                  (+(reg42 ? wire9 : wire31)) : $signed((reg41 ?
                      reg44 : (8'hb1)))) & (((wire6 ? reg38 : wire33) ?
                      $unsigned(wire33) : {reg44, wire31}) ?
                  (reg38 || reg35[(3'h6):(2'h3)]) : $signed(reg46[(5'h10):(3'h6)]))) : (((!((8'hb9) ?
                  (8'hbc) : wire6)) + ($unsigned(reg44) ^ reg42[(2'h2):(2'h2)])) > (reg37[(4'h8):(3'h5)] ?
                  (~^wire8[(1'h0):(1'h0)]) : reg43)));
        end
      else
        begin
          reg46 <= reg40;
          reg47 <= (+{{$signed($signed(reg35))}, (&reg42[(1'h1):(1'h0)])});
          reg48 <= $signed($unsigned(((reg44 ?
                  (wire8 ? reg35 : wire36) : {wire6}) ?
              wire7 : ((wire6 ? wire7 : reg40) == ((8'h9f) ?
                  (8'hba) : reg41)))));
        end
      reg49 <= (^~(^$unsigned((^~$unsigned(reg35)))));
      reg50 <= $unsigned((&$unsigned($signed($signed(wire10)))));
    end
  always
    @(posedge clk) begin
      reg51 <= wire9;
      reg52 <= (-reg35[(3'h4):(1'h1)]);
      reg53 <= wire36[(2'h2):(1'h1)];
    end
  assign wire54 = {(+reg43)};
  assign wire55 = (^~(8'ha9));
  assign wire56 = $unsigned(reg48[(1'h1):(1'h1)]);
  assign wire57 = $signed({$unsigned(((reg40 != wire9) ?
                          (reg53 ? reg46 : reg38) : reg52))});
  module58 #() modinst85 (wire84, clk, wire7, reg51, wire33, wire57);
  module86 #() modinst102 (.wire88(wire6), .wire89(wire34), .wire87(wire33), .y(wire101), .wire90(reg35), .wire91(wire54), .clk(clk));
endmodule

module module86
#(parameter param99 = (-(8'hb8)), 
parameter param100 = ((~&(7'h44)) ? param99 : param99))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire91;
  input wire [(5'h10):(1'h0)] wire90;
  input wire signed [(5'h13):(1'h0)] wire89;
  input wire [(4'hd):(1'h0)] wire88;
  input wire [(5'h11):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire92;
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  assign y = {wire98, wire97, wire96, wire92, reg95, reg94, reg93, (1'h0)};
  assign wire92 = ((wire89 + $signed(((wire87 ? (8'hba) : wire88) ~^ (wire87 ?
                          wire87 : wire88)))) ?
                      (&wire90[(4'hf):(4'h9)]) : (+(wire88[(4'hc):(4'h9)] ^ ($unsigned(wire91) ?
                          $unsigned(wire89) : $unsigned(wire88)))));
  always
    @(posedge clk) begin
      reg93 <= $unsigned($signed(wire88[(4'ha):(3'h5)]));
      reg94 <= (~|wire91);
      reg95 <= (8'hb2);
    end
  assign wire96 = ($unsigned($signed((~|(wire92 < reg94)))) ?
                      {wire88[(4'hd):(4'h9)],
                          $unsigned($signed(wire90[(4'hb):(1'h0)]))} : $unsigned($unsigned($unsigned((reg93 ^~ wire88)))));
  assign wire97 = (((~&(((8'hbc) & reg95) < $signed(reg93))) ?
                          $signed($unsigned($unsigned(wire89))) : (+$signed((wire92 | reg93)))) ?
                      {reg93[(1'h1):(1'h1)]} : wire96);
  assign wire98 = {reg95[(2'h2):(1'h0)],
                      $unsigned((wire91[(3'h4):(3'h4)] < (~^reg95[(1'h1):(1'h0)])))};
endmodule

module module58
#(parameter param83 = {{((((8'haa) + (7'h42)) <<< ((8'hb0) == (8'ha4))) ? (((8'ha3) + (8'ha5)) ? (^~(8'hab)) : ((8'ha7) ? (8'hb6) : (8'hb8))) : (8'had))}, ((8'hb0) ? (({(8'ha9), (8'hb0)} | {(8'ha1)}) ? ((~(8'hab)) ? ((8'h9e) ? (8'hbd) : (8'hb6)) : ((8'ha5) <<< (8'hba))) : (((7'h44) ~^ (8'hbf)) ? {(8'hb4)} : ((8'hae) ? (8'hbe) : (8'ha2)))) : (8'hbb))})
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire62;
  input wire [(4'hd):(1'h0)] wire61;
  input wire signed [(4'hd):(1'h0)] wire60;
  input wire signed [(3'h5):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire63;
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  assign y = {wire82,
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
                 wire69,
                 wire63,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire63 = (8'hb8);
  always
    @(posedge clk) begin
      reg64 <= $signed(($unsigned({$unsigned(wire62),
          (wire62 ? wire62 : wire60)}) ^~ (8'h9e)));
      reg65 <= {(|$unsigned($unsigned($unsigned(wire59)))),
          (^(wire62 ^ reg64))};
      reg66 <= (+((8'had) ~^ wire61[(1'h1):(1'h1)]));
      reg67 <= ({$signed((+(wire62 ? wire59 : reg65))),
          (reg66 >>> reg66[(1'h0):(1'h0)])} >= $unsigned((7'h44)));
      reg68 <= (((~((reg66 <= (7'h44)) >= (reg67 & reg66))) >>> {(~^(!reg66))}) << ($signed($signed(wire62[(5'h13):(3'h4)])) && ((wire61 ?
          reg67 : (reg66 || reg67)) >>> reg67)));
    end
  assign wire69 = $signed((7'h41));
  assign wire70 = {wire60, reg64};
  assign wire71 = $signed((~&{{(~reg67), $signed((8'ha3))}}));
  assign wire72 = {wire70[(3'h6):(1'h0)]};
  assign wire73 = wire72[(3'h7):(3'h7)];
  assign wire74 = $signed($signed($unsigned($signed($unsigned(wire63)))));
  assign wire75 = (~|wire60[(4'hb):(4'ha)]);
  assign wire76 = ((($unsigned((reg65 + wire71)) ?
                          wire63[(1'h1):(1'h1)] : ((wire72 ?
                                  (8'ha7) : (7'h44)) ?
                              (wire63 ? wire71 : wire75) : reg64)) >> wire62) ?
                      (&$signed({(wire59 ?
                              wire59 : wire69)})) : (~|wire63[(3'h6):(3'h6)]));
  assign wire77 = {wire61[(4'h9):(2'h3)]};
  assign wire78 = $signed($signed($unsigned(($signed(wire69) ?
                      (8'hab) : $unsigned(wire73)))));
  assign wire79 = $signed(wire59[(3'h4):(2'h3)]);
  assign wire80 = {(((wire73 >>> (wire75 * reg68)) & ({wire59, wire75} ?
                              wire63 : (^wire77))) ?
                          $signed((wire73 == (wire79 > wire78))) : (wire79 ?
                              wire79 : $signed($signed(wire70)))),
                      (-(~|(&wire60[(3'h5):(1'h1)])))};
  assign wire81 = wire63;
  assign wire82 = (!wire77[(2'h3):(1'h1)]);
endmodule

module module11
#(parameter param29 = {((({(8'ha5)} ? {(8'ha1), (8'hb8)} : (^(8'hbd))) ? {(+(8'haa))} : (((8'hb6) ^ (8'ha7)) > ((8'hb1) ? (8'hb3) : (8'ha0)))) << ((-(7'h44)) ? (((8'h9f) ? (8'ha2) : (7'h41)) * ((8'h9c) | (8'ha7))) : (((8'haa) < (8'ha8)) ? ((8'hb7) ? (7'h43) : (8'hb0)) : ((8'h9f) ^~ (8'hae))))), (({((8'ha1) <<< (8'hbc)), ((8'had) <<< (8'hba))} ? (((8'hb1) ? (8'ha3) : (8'ha1)) ? ((8'haa) ? (8'hb9) : (8'hb9)) : ((8'hbd) ? (8'h9c) : (8'hbc))) : (8'ha4)) ? (+(&{(7'h41), (8'haa)})) : ((((8'ha5) ? (8'ha7) : (7'h44)) ? ((8'h9e) < (8'hb3)) : (&(8'hb0))) || ((&(8'ha7)) ? (|(8'hb3)) : ((8'hba) - (8'haa)))))}, 
parameter param30 = (!{param29}))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire28,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire16 = $signed($signed(((~&$signed(wire14)) <<< (~^(!wire15)))));
  assign wire17 = (8'hb4);
  assign wire18 = wire16;
  assign wire19 = wire13[(2'h2):(1'h0)];
  assign wire20 = (wire16[(3'h5):(2'h2)] + wire15);
  assign wire21 = $unsigned(($signed(wire19) == {wire19}));
  always
    @(posedge clk) begin
      if ((^(+wire12[(1'h1):(1'h1)])))
        begin
          reg22 <= (wire17 >>> ((^wire13[(3'h4):(1'h1)]) ?
              $signed($signed(wire16)) : (!((^~wire14) << $signed(wire18)))));
        end
      else
        begin
          reg22 <= (8'hb2);
          if (wire19[(2'h2):(1'h1)])
            begin
              reg23 <= $signed((({(&wire14)} > wire19[(1'h1):(1'h0)]) << $unsigned(wire19)));
              reg24 <= {wire20};
            end
          else
            begin
              reg23 <= wire17[(1'h0):(1'h0)];
              reg24 <= reg23[(3'h7):(3'h4)];
            end
          reg25 <= wire17[(4'hf):(1'h1)];
          reg26 <= ($signed(((~^(~&wire21)) ^ wire21)) == (8'hbf));
          reg27 <= $unsigned((wire18[(1'h1):(1'h1)] & $signed($unsigned(wire17))));
        end
    end
  assign wire28 = (|$signed(wire16[(4'ha):(4'h9)]));
endmodule
