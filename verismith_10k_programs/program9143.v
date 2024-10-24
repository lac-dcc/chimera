module top
#(parameter param201 = (({(&{(8'ha6)}), (^~(&(8'hac)))} > (!(((7'h41) ? (8'hb1) : (8'ha8)) ? (~(8'hb1)) : ((8'ha4) ? (8'ha3) : (8'hbe))))) && (&{{{(8'haa), (8'hb7)}, ((8'hb6) ? (8'ha4) : (8'ha9))}, ((+(8'ha9)) ? (~&(8'h9c)) : ((8'ha0) ? (8'hb0) : (8'hb4)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire200;
  wire [(4'hf):(1'h0)] wire196;
  wire signed [(5'h12):(1'h0)] wire195;
  wire [(5'h13):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire193;
  wire signed [(5'h14):(1'h0)] wire198;
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  assign y = {wire200,
                 wire196,
                 wire195,
                 wire98,
                 wire22,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire100,
                 wire193,
                 wire198,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire5 = (wire2[(1'h0):(1'h0)] ?
                     $signed($unsigned({$unsigned(wire2),
                         (wire0 ? wire3 : wire4)})) : ((((wire3 ^~ wire1) ?
                                 wire4 : (wire0 ? wire2 : wire1)) ?
                             wire1 : $unsigned((wire4 ? wire4 : wire3))) ?
                         ((&(wire2 ?
                             wire2 : wire4)) ~^ $unsigned($signed(wire1))) : wire3));
  assign wire6 = wire4;
  assign wire7 = $unsigned(wire6);
  assign wire8 = ($signed($signed($signed((^~(8'ha4))))) ?
                     wire2 : (($signed(wire0[(1'h1):(1'h1)]) ?
                             (8'hae) : wire4) ?
                         {($unsigned(wire1) < {(8'hbc)})} : (((wire1 ^ wire3) ?
                                 $unsigned(wire5) : (wire2 > wire7)) ?
                             ((wire5 ? wire5 : wire2) ?
                                 (8'ha4) : $unsigned(wire0)) : ((wire6 <<< wire5) >= {wire7,
                                 wire1}))));
  assign wire9 = (($signed(wire8) ?
                         (($unsigned((8'hbf)) & $signed(wire7)) ?
                             (~^wire4[(2'h2):(1'h1)]) : $unsigned((wire5 ?
                                 wire1 : wire2))) : wire2) ?
                     wire0[(1'h0):(1'h0)] : $unsigned($unsigned({wire4[(3'h4):(2'h2)],
                         {wire0}})));
  assign wire10 = {$signed(wire3)};
  assign wire11 = wire9;
  assign wire12 = ($unsigned($unsigned(wire4[(3'h5):(3'h4)])) ?
                      $unsigned((!wire1)) : $unsigned($unsigned((wire0[(2'h2):(1'h1)] >= {wire1,
                          wire2}))));
  always
    @(posedge clk) begin
      if ((~$unsigned(wire7)))
        begin
          reg13 <= (!((((|wire4) >= $signed((8'hb2))) ?
                  ((wire0 ? (8'ha2) : wire10) | ((8'hb3) ^~ wire1)) : (wire10 ?
                      (wire1 <= wire5) : wire11)) ?
              (~^($unsigned(wire12) ?
                  wire2[(1'h0):(1'h0)] : $unsigned(wire2))) : (($signed(wire12) ?
                      (wire9 ~^ wire2) : (wire10 != wire12)) ?
                  $unsigned({(8'hba)}) : ($signed(wire5) ?
                      $signed(wire5) : $signed((8'ha9))))));
          if ({((((&(7'h44)) ?
                      wire11[(3'h7):(1'h1)] : $unsigned(wire9)) <= wire3) ?
                  (((^wire9) >> (wire4 && wire1)) ?
                      ($unsigned(wire11) ~^ (~wire2)) : wire3[(3'h6):(3'h5)]) : $signed(wire12))})
            begin
              reg14 <= wire4;
              reg15 <= (^~wire10[(1'h1):(1'h1)]);
              reg16 <= wire6;
              reg17 <= wire3;
            end
          else
            begin
              reg14 <= wire7;
            end
          reg18 <= (reg13[(1'h1):(1'h0)] ?
              (wire6[(1'h1):(1'h1)] ^ {$signed($unsigned(wire11))}) : $signed((^~($signed(reg16) ?
                  (~^reg14) : (reg17 ? wire3 : reg14)))));
        end
      else
        begin
          if ($signed((wire8[(3'h5):(2'h2)] <= wire4[(2'h3):(2'h2)])))
            begin
              reg13 <= (^~$signed({$unsigned((~^reg17))}));
            end
          else
            begin
              reg13 <= wire2;
              reg14 <= ((~&(8'hb0)) ?
                  ((^~wire0) ?
                      {$unsigned(reg14[(3'h4):(1'h1)]),
                          ((|(8'haa)) ?
                              (wire1 ?
                                  wire1 : wire0) : wire7[(3'h4):(1'h0)])} : ($signed($signed(wire9)) ?
                          reg14 : ($signed((8'had)) > ((8'hab) < reg13)))) : $unsigned(($unsigned($signed(reg14)) << {(~&wire2),
                      (reg18 ? wire1 : wire5)})));
              reg15 <= {(wire4 ?
                      ((&reg14[(1'h0):(1'h0)]) ~^ reg13) : {$signed({wire10,
                              wire2}),
                          wire11}),
                  wire12[(2'h2):(2'h2)]};
            end
          reg16 <= (reg14[(3'h4):(1'h0)] && (7'h42));
        end
      reg19 <= (~|$unsigned($unsigned((&$unsigned(wire12)))));
      reg20 <= (8'ha7);
      reg21 <= ({(~&(!reg15[(4'h9):(3'h4)])), $signed($unsigned((!wire5)))} ?
          (((wire4[(3'h4):(2'h3)] ? wire11 : (~(8'ha1))) ?
                  $unsigned($unsigned(wire10)) : ($unsigned(wire0) > $unsigned(wire2))) ?
              (!$unsigned((wire7 + (8'ha4)))) : {$unsigned($unsigned(wire3))}) : {$signed($unsigned((8'hb7)))});
    end
  assign wire22 = reg16;
  module23 #() modinst99 (wire98, clk, wire11, wire0, reg18, wire2);
  assign wire100 = reg19[(3'h7):(3'h6)];
  module101 #() modinst194 (wire193, clk, wire98, wire1, reg18, wire2, reg17);
  assign wire195 = $signed($signed(wire193));
  module144 #() modinst197 (.wire146(wire195), .wire145(wire11), .clk(clk), .wire149(wire7), .wire148(reg16), .y(wire196), .wire147(reg21));
  module101 #() modinst199 (.y(wire198), .wire104(wire3), .wire103(wire100), .wire106(wire0), .clk(clk), .wire102(wire4), .wire105(wire5));
  assign wire200 = $signed((wire1[(1'h1):(1'h0)] ?
                       $signed($signed((-wire193))) : (!($unsigned(wire11) ?
                           wire7 : {wire3}))));
endmodule

module module101
#(parameter param192 = {({(^~((8'hae) <= (8'ha9))), {((8'hb6) ? (8'hbc) : (8'ha1)), ((8'hb8) && (8'hb3))}} ? {({(8'hba), (8'ha0)} ? {(7'h44)} : ((8'hbe) ? (7'h44) : (8'hbd))), {((8'hbe) ? (8'ha3) : (8'hb0))}} : {(8'hb5)})})
(y, clk, wire102, wire103, wire104, wire105, wire106);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire102;
  input wire [(4'h8):(1'h0)] wire103;
  input wire [(4'he):(1'h0)] wire104;
  input wire [(4'hf):(1'h0)] wire105;
  input wire signed [(3'h6):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire191;
  wire signed [(5'h13):(1'h0)] wire190;
  wire [(4'ha):(1'h0)] wire189;
  wire signed [(5'h12):(1'h0)] wire188;
  wire signed [(3'h7):(1'h0)] wire187;
  wire signed [(2'h3):(1'h0)] wire186;
  wire [(4'hf):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire184;
  wire [(5'h13):(1'h0)] wire183;
  wire signed [(5'h14):(1'h0)] wire182;
  wire [(3'h7):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire138;
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire179,
                 wire107,
                 wire108,
                 wire121,
                 wire122,
                 wire123,
                 wire138,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 (1'h0)};
  assign wire107 = (((~$unsigned((wire104 <= wire103))) < ((!wire105) << ((wire102 ?
                           wire103 : (8'hb4)) ^ {wire102}))) ?
                       (!($signed((+wire104)) ?
                           wire106[(1'h1):(1'h0)] : ((8'ha8) ?
                               (~wire106) : (&wire104)))) : wire102[(4'hf):(3'h5)]);
  assign wire108 = wire104;
  always
    @(posedge clk) begin
      reg109 <= $signed(wire106);
      if (((wire105[(4'he):(3'h5)] ?
              (((wire106 << wire105) ?
                      (wire106 ? reg109 : (8'hb8)) : $unsigned(wire107)) ?
                  wire102 : (-(~wire102))) : wire108) ?
          (~&{$signed({wire106}),
              (&(wire108 ?
                  wire104 : wire104))}) : (!$signed($signed((8'hbc))))))
        begin
          reg110 <= $signed(wire103[(4'h8):(3'h5)]);
        end
      else
        begin
          if ((((^~({wire108, wire108} ? ((8'haf) < reg110) : reg110)) ?
              (wire103 ?
                  ((wire102 ?
                      reg109 : wire106) != (-wire105)) : wire104[(3'h5):(2'h2)]) : $signed(($signed((8'ha9)) ?
                  (reg109 < wire106) : $unsigned(wire104)))) - reg110[(4'hf):(4'hb)]))
            begin
              reg110 <= ((reg109 <<< (wire107 ?
                  (^~(-wire105)) : ({wire103} <<< {wire107,
                      reg110}))) >= ($unsigned(wire104[(4'hc):(1'h1)]) ?
                  (((wire103 * wire108) ? wire106[(2'h2):(1'h0)] : wire107) ?
                      (reg110[(2'h3):(1'h1)] <<< (8'ha5)) : (~&{reg109,
                          wire108})) : (^~(^~wire106))));
              reg111 <= wire103[(1'h1):(1'h1)];
              reg112 <= wire105[(3'h4):(2'h2)];
              reg113 <= reg111;
            end
          else
            begin
              reg110 <= (^~{$signed(wire103),
                  $unsigned(((reg111 ? wire106 : reg110) ?
                      wire106[(1'h1):(1'h1)] : $signed(reg110)))});
              reg111 <= (|(+(&reg109[(4'he):(1'h1)])));
              reg112 <= (reg111 || ($unsigned((reg110[(2'h3):(1'h0)] ?
                  ((8'hb0) ?
                      reg109 : wire104) : wire104[(3'h4):(2'h3)])) ^~ wire103[(1'h0):(1'h0)]));
            end
        end
      reg114 <= $signed((((8'hb9) == {reg109}) ^~ reg112[(2'h2):(1'h0)]));
      if ($unsigned($unsigned((^~(wire105 ?
          wire107[(4'hd):(2'h2)] : ((8'ha5) ~^ (8'ha7)))))))
        begin
          reg115 <= reg111[(1'h1):(1'h0)];
          reg116 <= reg113[(1'h0):(1'h0)];
          reg117 <= (~|wire108[(2'h2):(1'h0)]);
          reg118 <= reg111;
          reg119 <= reg117;
        end
      else
        begin
          reg115 <= wire103;
          reg116 <= reg113;
        end
      reg120 <= wire102[(4'hc):(4'ha)];
    end
  assign wire121 = {(wire102 ?
                           ($unsigned((|reg111)) ?
                               ((reg116 + reg115) ?
                                   {reg110,
                                       wire107} : (reg118 ^~ reg114)) : $unsigned(reg117[(2'h3):(2'h3)])) : (reg109[(3'h4):(1'h1)] ?
                               (reg113 ?
                                   wire104[(2'h2):(1'h0)] : $signed(reg114)) : reg118))};
  assign wire122 = (~|{(-((wire103 & reg119) || ((8'hbe) >> reg116)))});
  assign wire123 = ($unsigned((!(&(^wire105)))) || ($signed(reg109[(5'h12):(1'h1)]) << $unsigned(reg110)));
  module124 #() modinst139 (.y(wire138), .wire125(reg116), .wire127(reg110), .wire128(reg115), .wire129(reg113), .wire126(wire105), .clk(clk));
  always
    @(posedge clk) begin
      reg140 <= ((($signed((reg111 ~^ reg119)) ?
              ((^~wire103) ?
                  $signed(reg117) : (&wire105)) : $unsigned(reg113[(4'ha):(3'h5)])) ?
          (-($unsigned((8'ha4)) ~^ wire102)) : $unsigned(((!(8'hbb)) || reg116))) & (wire121[(3'h7):(2'h2)] >> (((+wire122) & $unsigned(reg114)) < $signed((^wire103)))));
      reg141 <= (wire122[(4'hb):(4'h8)] ?
          $signed(($unsigned((wire104 - reg114)) * $unsigned((reg119 < wire106)))) : (wire138 >= wire108));
      reg142 <= {(reg110[(1'h0):(1'h0)] >>> ($signed(reg140) ?
              {reg118} : $signed((reg114 ? (8'ha3) : reg115))))};
      reg143 <= reg120;
    end
  module144 #() modinst180 (wire179, clk, reg118, reg113, reg141, reg143, reg112);
  assign wire181 = $signed(((reg142 ?
                       (^~{wire122, (8'ha9)}) : $unsigned({reg113,
                           reg110})) || $signed($signed($unsigned((8'hbc))))));
  assign wire182 = {$unsigned((~wire108))};
  assign wire183 = (~&{reg120, (~$signed((wire102 ? reg109 : reg117)))});
  assign wire184 = $unsigned(wire138);
  assign wire185 = $signed(wire183);
  assign wire186 = $unsigned((8'hae));
  assign wire187 = wire108[(2'h2):(1'h0)];
  assign wire188 = (~&(-wire138));
  assign wire189 = wire181;
  assign wire190 = $signed($unsigned($signed(((reg116 << reg120) << reg111[(3'h4):(1'h0)]))));
  assign wire191 = $signed($signed({$unsigned(wire108)}));
endmodule

module module23
#(parameter param97 = (-(~((-(8'hb4)) - (((8'hb8) < (8'hb3)) ^~ ((8'hbd) == (8'hae)))))))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire93;
  assign y = {wire96, wire95, wire28, wire29, wire93, (1'h0)};
  assign wire28 = $unsigned(((~wire25) & $unsigned($unsigned((8'hbd)))));
  assign wire29 = (wire26 >>> ((wire28[(3'h6):(3'h6)] > ((wire25 >= wire25) & $unsigned(wire26))) ?
                      $signed(wire28[(4'h8):(3'h5)]) : (&($unsigned((8'hb9)) ?
                          (wire24 ? wire26 : wire26) : $signed(wire28)))));
  module30 #() modinst94 (.wire34(wire26), .wire32(wire24), .wire35(wire25), .wire31(wire27), .wire33(wire28), .clk(clk), .y(wire93));
  assign wire95 = wire26;
  assign wire96 = wire25;
endmodule

module module30
#(parameter param92 = (+((({(8'ha6), (8'ha7)} ? ((8'ha5) <<< (8'haa)) : ((8'h9d) ? (8'ha1) : (8'haf))) << (~|((8'haa) <= (8'hb7)))) ? {(^((8'hb6) >> (8'ha9))), ({(8'ha0)} == ((8'haf) || (8'hbf)))} : {(^(^~(8'hb4))), (((8'ha7) ^~ (7'h43)) >> ((8'hbf) ? (8'hbf) : (8'ha0)))})))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h269):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire signed [(2'h2):(1'h0)] wire33;
  input wire [(4'hf):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire36;
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire67,
                 wire66,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire36,
                 reg88,
                 reg83,
                 reg82,
                 reg81,
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
                 reg69,
                 reg68,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire36 = $unsigned((wire32[(4'h9):(1'h0)] ^ (wire33 && wire32[(4'h8):(2'h2)])));
  always
    @(posedge clk) begin
      if (($unsigned(wire31) ?
          wire34 : (((^wire36) != ((~|wire36) >>> $unsigned(wire33))) ?
              wire31 : wire32)))
        begin
          reg37 <= (^~wire32);
          reg38 <= (($signed($unsigned((wire31 ^ wire34))) ?
              {(8'ha7)} : $unsigned(wire33[(1'h1):(1'h1)])) < $unsigned((~&$signed(wire31))));
          reg39 <= (wire35[(2'h2):(2'h2)] << reg37);
          reg40 <= wire33[(1'h0):(1'h0)];
          reg41 <= (($signed(wire32[(4'h8):(3'h5)]) + $signed($signed($unsigned(wire31)))) ?
              (($signed($signed(wire35)) ? wire33 : reg40) ?
                  (!$signed($signed(reg40))) : $unsigned(({wire33} ?
                      $signed(wire35) : (reg39 + wire33)))) : ($signed($unsigned($signed(reg40))) ?
                  $signed(reg40) : (wire33[(1'h0):(1'h0)] >= wire32)));
        end
      else
        begin
          if ((wire31 >>> (~|(wire34[(4'h9):(2'h2)] > ((wire34 ?
                  wire32 : wire32) ?
              {wire36} : reg41[(1'h1):(1'h1)])))))
            begin
              reg37 <= $signed($unsigned(($signed({reg39, wire34}) ?
                  (|(!(7'h42))) : $signed(wire35))));
              reg38 <= reg38[(1'h1):(1'h0)];
            end
          else
            begin
              reg37 <= (wire34[(3'h7):(1'h1)] ^ (($unsigned(reg41[(3'h4):(1'h0)]) && {wire34}) ?
                  $signed(((reg37 ? wire33 : (8'ha3)) ?
                      (&wire32) : wire34)) : $signed((7'h44))));
              reg38 <= wire36;
            end
          reg39 <= (-(wire31 | ($unsigned({reg38}) ?
              (8'hb4) : $unsigned((wire35 ~^ reg40)))));
          reg40 <= (8'hb7);
          reg41 <= $unsigned({wire31, wire33[(1'h1):(1'h1)]});
          reg42 <= {$signed($signed($unsigned((~&wire34)))),
              $signed($signed($unsigned((wire33 + reg38))))};
        end
      reg43 <= (&$signed({(((8'hac) ? reg39 : wire33) == (+(8'hbc))),
          ((reg40 ^~ wire32) >> $signed((8'ha4)))}));
    end
  always
    @(posedge clk) begin
      if ($unsigned(($signed($unsigned(wire33)) ?
          (~|wire32) : ($unsigned($unsigned(reg40)) ?
              reg41[(2'h2):(2'h2)] : $unsigned($signed(reg43))))))
        begin
          if (((^~wire31) ? reg41 : $unsigned(wire32[(3'h6):(2'h3)])))
            begin
              reg44 <= ($unsigned((^~(~|(wire33 ?
                  (8'hba) : reg39)))) <<< $unsigned(($unsigned(wire33[(2'h2):(2'h2)]) ?
                  wire34[(4'hb):(4'ha)] : reg43)));
            end
          else
            begin
              reg44 <= $signed({reg39,
                  (reg44[(5'h12):(5'h12)] ?
                      $signed($signed(reg43)) : ((wire33 ? reg37 : wire34) ?
                          $unsigned(wire36) : reg37))});
              reg45 <= $signed({(reg39 ? {reg44, reg37} : $unsigned(reg44)),
                  (8'h9e)});
              reg46 <= (-reg42);
              reg47 <= (^(^reg45[(5'h11):(4'ha)]));
            end
          if ({(reg41[(3'h4):(1'h1)] * {(!(reg46 < reg37)),
                  reg40[(1'h1):(1'h1)]}),
              $unsigned(($signed($unsigned(wire36)) ?
                  reg42[(1'h0):(1'h0)] : $signed((&reg43))))})
            begin
              reg48 <= ($signed((reg42[(2'h2):(1'h1)] ?
                  reg47 : reg46)) | $unsigned($unsigned($signed($signed(reg43)))));
              reg49 <= ((+$signed($signed(reg38[(3'h5):(3'h4)]))) + {$unsigned($signed((wire31 * wire32))),
                  ($unsigned(reg37[(1'h0):(1'h0)]) << (!$unsigned(wire34)))});
              reg50 <= $signed(reg43);
              reg51 <= (~$signed((($signed(reg39) ^ $signed(reg40)) ?
                  ((-reg49) ? (reg43 ? reg48 : reg46) : wire34) : (&(reg40 ?
                      reg38 : wire33)))));
            end
          else
            begin
              reg48 <= ($unsigned($signed(reg45)) <<< reg44[(1'h1):(1'h0)]);
              reg49 <= wire34[(1'h0):(1'h0)];
              reg50 <= (~&$unsigned({{$signed(reg49)},
                  ($signed(reg46) ? (|(8'ha6)) : $signed(reg44))}));
            end
          reg52 <= $unsigned($unsigned($unsigned(((reg46 != (8'h9e)) == (8'hae)))));
          reg53 <= ($unsigned($signed($signed($signed(reg40)))) ^~ $signed((!$unsigned(reg42))));
          reg54 <= reg53;
        end
      else
        begin
          reg44 <= reg49;
          reg45 <= $signed((reg52[(1'h1):(1'h0)] ?
              $unsigned(reg52) : $unsigned({(reg52 ? reg54 : wire35)})));
          if ((~((((~&reg53) ?
                  (wire33 | reg50) : (~^reg51)) <= (reg45 ^ {reg50})) ?
              {((8'hb4) ? reg38[(2'h2):(1'h1)] : (~wire32))} : (^reg46))))
            begin
              reg46 <= (~|reg48[(3'h6):(2'h3)]);
              reg47 <= (~^(8'h9d));
              reg48 <= $signed({(reg41 << $unsigned({wire32}))});
              reg49 <= $signed((-$signed($unsigned(reg49))));
              reg50 <= (8'ha4);
            end
          else
            begin
              reg46 <= {wire34};
              reg47 <= $signed(($signed(((~|reg37) ~^ (|wire33))) <<< $signed((~^$unsigned(reg54)))));
              reg48 <= (reg50[(2'h2):(1'h0)] ?
                  {(^~{$unsigned(reg48)})} : (8'hb6));
              reg49 <= reg40[(2'h3):(1'h1)];
              reg50 <= reg51;
            end
        end
      reg55 <= (|reg53[(2'h3):(1'h1)]);
    end
  assign wire56 = wire35[(2'h2):(1'h1)];
  assign wire57 = $signed({(!{(~(8'ha4)), $signed(reg40)}),
                      (!((~&reg47) ^~ $unsigned(reg46)))});
  assign wire58 = $unsigned(($signed(reg48[(2'h3):(2'h2)]) <= $unsigned(($unsigned(wire57) ?
                      reg46[(1'h1):(1'h1)] : {reg47, reg46}))));
  assign wire59 = ($signed((^~((^(7'h43)) ?
                          reg43[(3'h7):(1'h1)] : $unsigned(reg52)))) ?
                      reg52 : (reg46[(2'h2):(1'h0)] ?
                          (wire34 <= ((wire56 <= reg52) || $signed((8'hb8)))) : $unsigned(($unsigned((8'ha1)) << (wire33 ?
                              wire33 : reg43)))));
  assign wire60 = reg40[(2'h3):(1'h0)];
  assign wire61 = reg41;
  always
    @(posedge clk) begin
      reg62 <= (&(reg40 ?
          $unsigned(((reg51 && wire61) >> reg44[(4'ha):(3'h5)])) : ((&((8'hbc) ?
                  reg51 : (8'hbf))) ?
              $signed(reg40[(2'h3):(2'h2)]) : reg44)));
      reg63 <= ({$signed((|$unsigned(reg45))),
              $unsigned((reg49[(2'h3):(2'h2)] >> $unsigned((8'h9e))))} ?
          $signed($signed((wire58[(3'h4):(3'h4)] <<< reg37))) : ({$signed(reg43[(3'h5):(1'h0)])} >>> (-reg50)));
      reg64 <= (~|(~&(((wire60 ? reg54 : wire31) ?
              $signed((8'hbd)) : $signed(reg51)) ?
          {wire59[(1'h1):(1'h0)],
              {reg52, (8'h9e)}} : ((&wire57) + $unsigned((8'hb6))))));
      reg65 <= (reg48[(1'h0):(1'h0)] <= reg53[(1'h1):(1'h1)]);
    end
  assign wire66 = wire31;
  assign wire67 = (&$signed($signed((~reg62))));
  always
    @(posedge clk) begin
      if ($unsigned(reg49))
        begin
          reg68 <= (reg51[(2'h3):(2'h2)] ?
              wire57 : ((((wire32 ?
                  wire35 : reg52) << $unsigned(reg41)) > reg49) | $signed((|(wire34 ?
                  (8'h9d) : reg47)))));
          reg69 <= (wire58 ?
              reg63[(1'h0):(1'h0)] : ({wire35} > reg52[(2'h2):(2'h2)]));
          if (reg39[(4'ha):(4'ha)])
            begin
              reg70 <= reg37;
              reg71 <= $signed((wire59 <<< $unsigned({{(8'ha5), reg37},
                  (reg43 && wire61)})));
              reg72 <= $unsigned(reg63);
              reg73 <= (^~((+$signed(wire57)) > {reg49[(3'h6):(1'h0)], reg70}));
              reg74 <= (($unsigned(reg43[(2'h3):(2'h3)]) ?
                  {wire60,
                      $unsigned($unsigned(reg47))} : (~^(8'hbe))) <= reg50);
            end
          else
            begin
              reg70 <= reg46[(1'h0):(1'h0)];
              reg71 <= $signed($signed((+{$unsigned(reg70),
                  $unsigned(reg65)})));
              reg72 <= (((8'ha4) ^~ $signed($signed((^reg62)))) ?
                  $unsigned((reg52 ?
                      reg38[(3'h5):(3'h5)] : $unsigned(reg44[(5'h11):(4'he)]))) : (~(reg74[(1'h1):(1'h1)] ?
                      reg71 : (^~(|wire33)))));
            end
          reg75 <= (reg68[(1'h1):(1'h0)] >>> (reg50[(2'h3):(2'h2)] >>> ($unsigned($unsigned(wire35)) <<< (|(~&reg42)))));
        end
      else
        begin
          reg68 <= $unsigned({(8'hab),
              ($signed($unsigned(wire67)) ?
                  reg46 : ({reg74} ? $unsigned(reg62) : (reg40 - reg68)))});
          if ($unsigned((((~|wire67) ?
                  (+$unsigned((7'h42))) : {(^(8'ha8)), {wire34}}) ?
              (reg47 >= (8'ha6)) : $unsigned($signed(wire67[(4'hb):(4'ha)])))))
            begin
              reg69 <= ($signed({((reg70 <= wire31) ? (|(8'ha2)) : reg68)}) ?
                  $unsigned($unsigned($signed(wire31))) : (reg75 == ((+reg39) ?
                      reg55[(1'h0):(1'h0)] : (8'hac))));
            end
          else
            begin
              reg69 <= wire58;
            end
          reg70 <= ((reg44 + (^~(~^(wire59 ^~ reg51)))) <= $signed(($signed((wire59 | reg41)) ?
              ($signed(reg53) && reg64) : reg55)));
          reg71 <= (^~(+(+wire32)));
          reg72 <= {{$signed(reg54), $signed((!$unsigned(wire34)))},
              (reg62 ^ (!wire33[(2'h2):(1'h1)]))};
        end
      if ($signed({$unsigned(reg44[(5'h12):(4'he)]),
          ((7'h41) << reg40[(1'h0):(1'h0)])}))
        begin
          reg76 <= $signed($unsigned((~^(^~{reg45}))));
          reg77 <= reg75;
          reg78 <= ($unsigned(((reg38 <<< (~reg70)) ?
                  $unsigned((reg54 >> wire32)) : reg43[(3'h4):(2'h2)])) ?
              $signed(reg52[(3'h6):(3'h6)]) : reg63[(1'h0):(1'h0)]);
          reg79 <= {reg62[(4'ha):(1'h0)], reg78[(3'h5):(2'h2)]};
          reg80 <= ($signed(wire31[(3'h4):(1'h0)]) ?
              $unsigned(reg53[(1'h1):(1'h1)]) : reg49);
        end
      else
        begin
          reg76 <= $unsigned((&(8'had)));
          reg77 <= (8'hb0);
          reg78 <= (&$signed(((&$unsigned(reg45)) == (~^$unsigned(wire60)))));
        end
      reg81 <= wire59[(4'hb):(3'h6)];
      reg82 <= (^~{(!$signed((reg71 ? reg47 : (8'hb2))))});
      reg83 <= $signed(((~reg75[(1'h0):(1'h0)]) ?
          reg63[(2'h3):(2'h3)] : {((^reg37) ^~ reg64)}));
    end
  assign wire84 = reg72[(1'h1):(1'h1)];
  assign wire85 = $signed((^~(($unsigned(reg55) <= $signed(reg54)) * wire60)));
  assign wire86 = ({((reg82[(2'h2):(1'h1)] && reg69) ?
                          {$signed(reg80)} : $unsigned($signed(reg63)))} || ({(reg82[(2'h3):(2'h3)] ?
                              (wire32 ? reg44 : reg52) : (wire60 >> (8'hb7)))} ?
                      ($unsigned(wire35[(2'h2):(2'h2)]) ?
                          {(reg53 & (8'hb2))} : reg62[(4'hc):(4'h8)]) : (wire34 ~^ wire84)));
  assign wire87 = (~|wire32[(4'hd):(3'h5)]);
  always
    @(posedge clk) begin
      reg88 <= ({(reg44 ?
                  ((wire56 ^~ reg45) ?
                      reg42[(1'h0):(1'h0)] : wire32[(4'ha):(2'h3)]) : $unsigned(reg38)),
              $signed({$signed(wire36), {(8'hbd), (7'h43)}})} ?
          $unsigned((~|($unsigned((7'h43)) ?
              $signed(wire87) : reg47[(5'h14):(2'h3)]))) : (8'ha6));
    end
  assign wire89 = ((((+$unsigned(wire87)) ?
                          ((~|reg81) ?
                              reg70[(4'hc):(2'h2)] : $signed(wire58)) : reg37[(2'h3):(2'h2)]) > $signed((reg40 ^~ (reg44 ?
                          (8'h9f) : wire57)))) ?
                      wire58[(2'h3):(1'h1)] : $signed((~&(8'hba))));
  assign wire90 = {(((~$signed(reg52)) ? wire58 : reg69) ?
                          (((reg49 || (8'hb2)) >= reg48[(2'h2):(2'h2)]) ?
                              reg54[(1'h1):(1'h1)] : (^~wire87)) : $unsigned((reg54[(4'h8):(4'h8)] & (reg39 ?
                              reg52 : reg75)))),
                      ((~|(~|(reg76 ^ wire36))) ?
                          {wire58[(4'hb):(2'h3)]} : (~((reg40 >> reg64) & (reg72 ?
                              reg65 : reg78))))};
  assign wire91 = (wire59 ? reg82 : reg38[(3'h6):(2'h3)]);
endmodule

module module144
#(parameter param178 = (-(((((7'h44) ? (8'ha2) : (8'ha4)) ? (8'had) : ((8'ha8) * (8'haa))) > {(|(8'hac)), {(8'hb2), (8'ha8)}}) ? ({((8'h9d) ? (8'ha1) : (8'h9e))} >= (!(!(8'hb4)))) : {(-(~(8'hbe))), (~|((8'hae) ? (8'hb9) : (8'haa)))})))
(y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire149;
  input wire [(5'h10):(1'h0)] wire148;
  input wire signed [(4'h9):(1'h0)] wire147;
  input wire signed [(5'h12):(1'h0)] wire146;
  input wire signed [(4'ha):(1'h0)] wire145;
  wire [(3'h5):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire176;
  wire [(2'h2):(1'h0)] wire175;
  wire [(4'ha):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  reg signed [(2'h2):(1'h0)] reg174 = (1'h0);
  reg [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(3'h6):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(3'h7):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg165 = (1'h0);
  reg [(4'h8):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(5'h11):(1'h0)] reg152 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire151,
                 wire150,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
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
                 reg152,
                 (1'h0)};
  assign wire150 = {({$unsigned($unsigned(wire147))} >> $unsigned({(wire146 ?
                               wire146 : wire146)})),
                       $unsigned(((wire145[(3'h6):(3'h4)] ~^ wire145) ?
                           (wire149 - wire146[(2'h2):(1'h1)]) : wire148))};
  assign wire151 = {($unsigned(wire146[(3'h7):(2'h3)]) < wire147),
                       ($signed((~&wire147)) ~^ ($unsigned((wire145 | (7'h42))) ~^ wire148))};
  always
    @(posedge clk) begin
      reg152 <= {({$unsigned(wire150[(3'h4):(2'h3)])} != $signed((8'ha7))),
          $signed(wire147)};
      reg153 <= $signed($unsigned({wire147[(2'h3):(2'h2)]}));
      reg154 <= (($unsigned((~$signed((8'hb1)))) >= {wire145}) && ((($unsigned((8'hb8)) ?
              (reg153 ? reg152 : wire149) : reg153) ?
          {$unsigned(reg153), wire147} : $unsigned((wire149 ?
              wire151 : wire151))) && {(((8'hba) * reg153) ?
              ((8'ha7) == wire151) : {wire145})}));
    end
  always
    @(posedge clk) begin
      if ((wire149[(4'hb):(2'h3)] ?
          wire147[(4'h9):(3'h4)] : (~|$signed($signed((wire150 > wire151))))))
        begin
          reg155 <= (~^$signed(($signed(reg153[(3'h6):(1'h1)]) * wire145[(3'h4):(2'h2)])));
        end
      else
        begin
          reg155 <= $signed((((wire149 ? $signed(reg155) : $unsigned(wire147)) ?
                  {$unsigned(reg154)} : reg153) ?
              $unsigned({((8'hbd) != reg153)}) : (7'h40)));
          if ((+$signed({{reg153, (wire151 >> wire145)}})))
            begin
              reg156 <= (7'h40);
              reg157 <= $signed((|(~&reg153)));
              reg158 <= $signed(((&{(reg156 + (8'hb6)), {reg154}}) && reg157));
            end
          else
            begin
              reg156 <= $signed(($unsigned(reg152[(4'hc):(1'h1)]) ~^ ({{wire151,
                      wire149},
                  $signed(wire145)} <= (8'haf))));
              reg157 <= wire149;
              reg158 <= reg152[(1'h0):(1'h0)];
            end
          if (((wire145 ?
                  $unsigned($unsigned(wire145[(2'h3):(2'h3)])) : ({reg153[(2'h2):(1'h0)],
                          reg156[(1'h1):(1'h0)]} ?
                      reg156[(2'h3):(1'h0)] : wire145[(3'h7):(3'h4)])) ?
              ($signed(((~wire147) && wire148)) ?
                  {$unsigned((wire146 <= reg152))} : (-wire150[(2'h2):(2'h2)])) : wire148))
            begin
              reg159 <= $unsigned($unsigned(reg153[(3'h5):(1'h0)]));
              reg160 <= (~|reg153);
            end
          else
            begin
              reg159 <= (wire151[(4'ha):(3'h6)] <= wire146);
              reg160 <= (^$unsigned((|(8'haa))));
            end
          reg161 <= $unsigned((+$unsigned({(~wire148)})));
        end
      reg162 <= $signed($signed(wire151));
      if ($unsigned(($unsigned($unsigned({wire145, reg154})) << reg155)))
        begin
          reg163 <= (reg158 > (^~$signed(($unsigned(reg152) ^ reg153))));
          reg164 <= wire146[(3'h5):(3'h5)];
          reg165 <= (+((7'h41) ^ (~&{$unsigned(reg155), $signed(wire148)})));
          if (reg159[(2'h3):(1'h1)])
            begin
              reg166 <= $signed(wire145[(3'h4):(3'h4)]);
              reg167 <= (~$unsigned(($signed($unsigned(reg152)) ?
                  (~^$unsigned(reg164)) : reg153[(3'h4):(1'h0)])));
              reg168 <= wire147;
              reg169 <= (~(~|$signed((+{reg156}))));
              reg170 <= (|reg168[(3'h4):(1'h0)]);
            end
          else
            begin
              reg166 <= {(wire149 ?
                      wire146[(1'h0):(1'h0)] : reg170[(1'h0):(1'h0)])};
              reg167 <= $unsigned(reg159[(1'h1):(1'h0)]);
              reg168 <= (((7'h44) ^~ $signed((!(reg154 ?
                  reg169 : reg166)))) <= $unsigned({{(reg153 ?
                          wire149 : reg153),
                      ((8'hb8) >> reg170)}}));
              reg169 <= $signed((-(~^(wire145 != $unsigned((8'ha9))))));
            end
          if (((~&{($unsigned(reg160) ? $signed(reg158) : (~|reg167))}) ?
              reg167 : (reg156[(3'h5):(2'h2)] ?
                  $unsigned((8'ha3)) : reg165[(3'h4):(1'h1)])))
            begin
              reg171 <= (-$unsigned(reg157[(4'he):(4'h8)]));
            end
          else
            begin
              reg171 <= ((($unsigned((+wire150)) ?
                      reg168 : $signed({(8'hae),
                          reg166})) < $unsigned($unsigned((reg158 ?
                      reg169 : wire145)))) ?
                  reg160[(4'he):(4'hc)] : ((((!reg158) ^ (reg152 ?
                              reg170 : reg171)) ?
                          ($signed(wire146) + {reg156,
                              (8'ha9)}) : $signed((reg168 ?
                              (8'ha2) : reg165))) ?
                      wire147 : {$signed((7'h41))}));
              reg172 <= wire148;
              reg173 <= reg169[(4'h9):(3'h7)];
              reg174 <= (wire145[(3'h4):(2'h3)] ?
                  ($signed(reg164[(3'h5):(3'h5)]) <<< reg160[(3'h4):(3'h4)]) : ($unsigned(({reg165,
                          reg169} <<< reg162)) ?
                      (8'h9d) : reg171[(2'h3):(2'h2)]));
            end
        end
      else
        begin
          reg163 <= {$unsigned((reg158 ?
                  (^$unsigned(wire148)) : reg159[(3'h6):(3'h6)])),
              (reg152[(1'h0):(1'h0)] ?
                  ($unsigned(reg172) ?
                      $signed(reg161) : (+reg166)) : $unsigned(((reg155 & reg156) < (-reg165))))};
          reg164 <= ({$signed($unsigned($unsigned(reg157)))} + (~&wire145[(1'h1):(1'h1)]));
          reg165 <= reg157[(3'h4):(1'h0)];
        end
    end
  assign wire175 = $unsigned(reg160[(3'h6):(1'h1)]);
  assign wire176 = reg156[(3'h4):(1'h0)];
  assign wire177 = (~|(($unsigned((7'h40)) ?
                       ($unsigned(reg155) ?
                           (reg155 ? reg168 : reg174) : (reg164 ?
                               reg170 : reg171)) : reg170[(3'h7):(1'h1)]) || (reg174 ?
                       reg171 : wire151[(3'h4):(1'h1)])));
endmodule

module module124
#(parameter param137 = (&(^((((8'hbf) ? (8'h9e) : (8'hb5)) >>> ((8'hbf) ? (8'hbd) : (8'h9d))) >>> (^~((7'h41) ? (8'haf) : (8'hbb)))))))
(y, clk, wire129, wire128, wire127, wire126, wire125);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire129;
  input wire signed [(2'h3):(1'h0)] wire128;
  input wire [(3'h4):(1'h0)] wire127;
  input wire [(3'h6):(1'h0)] wire126;
  input wire signed [(4'hb):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire136;
  wire [(3'h6):(1'h0)] wire135;
  wire [(4'hd):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire133;
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed(wire128[(2'h3):(1'h0)]) << ({$unsigned(((8'h9f) | wire128))} ?
          $signed(({wire128, (7'h42)} ?
              wire127[(2'h2):(1'h0)] : (^wire128))) : $unsigned($unsigned((^~wire127))))))
        begin
          reg130 <= $signed((~&wire125));
          reg131 <= $unsigned($signed((($unsigned(wire126) & $signed(wire126)) - wire129)));
        end
      else
        begin
          reg130 <= $unsigned($unsigned(($unsigned($unsigned(wire128)) ?
              {$signed(wire128)} : wire125[(2'h3):(1'h1)])));
        end
      reg132 <= (-((reg130[(4'hb):(1'h0)] ?
          ($unsigned(wire127) ? {(8'ha6), wire126} : {wire126}) : ((wire126 ?
                  wire128 : reg131) ?
              reg131[(2'h3):(1'h1)] : $unsigned(wire129))) <= wire127[(2'h3):(2'h2)]));
    end
  assign wire133 = ($signed(wire127[(3'h4):(3'h4)]) ?
                       ((8'ha9) ?
                           {(!(reg131 ? reg131 : reg131)),
                               {$unsigned(wire127)}} : reg131[(2'h3):(1'h0)]) : wire127);
  assign wire134 = (wire128 ?
                       {(wire127 ^ reg132[(3'h7):(3'h6)])} : ($unsigned(wire129) || (wire125 - (!(wire128 < wire128)))));
  assign wire135 = reg132[(1'h1):(1'h1)];
  assign wire136 = wire135;
endmodule
