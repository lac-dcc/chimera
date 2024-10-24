module top
#(parameter param155 = (-((^(((7'h42) + (8'ha8)) - (~^(8'ha1)))) ? {((^(8'ha9)) ? (^~(8'hab)) : (+(8'hb3)))} : (^~(((8'had) ^~ (8'h9c)) ^~ (~^(8'hb9)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire151;
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire27,
                 wire28,
                 wire32,
                 wire33,
                 wire151,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg29,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire5 = ($unsigned($unsigned(($signed(wire4) ?
                     wire2 : $unsigned(wire3)))) >>> $unsigned((&wire0[(1'h0):(1'h0)])));
  assign wire6 = $signed({wire0[(1'h1):(1'h1)]});
  assign wire7 = (($signed(wire1[(1'h1):(1'h0)]) ?
                     (^~(8'hab)) : $unsigned($unsigned({wire5}))) << wire0);
  assign wire8 = wire5[(1'h1):(1'h0)];
  assign wire9 = (wire0[(1'h1):(1'h0)] >>> ((~&wire3[(3'h6):(3'h4)]) ?
                     wire0 : (^$signed(wire1))));
  assign wire10 = (wire4 >> ($signed($unsigned((|wire7))) << (-($signed(wire0) ?
                      wire4 : wire0[(2'h2):(2'h2)]))));
  assign wire11 = $unsigned(wire1);
  assign wire12 = wire10[(5'h15):(5'h11)];
  assign wire13 = (wire7 ?
                      $unsigned((~^(wire3[(1'h1):(1'h0)] ?
                          wire2 : $unsigned(wire5)))) : (!$unsigned(wire11[(4'h9):(2'h3)])));
  always
    @(posedge clk) begin
      if ({$signed(wire10),
          ($unsigned(wire10[(3'h7):(3'h5)]) && {(+(wire8 >= wire2)),
              wire2[(4'hc):(2'h2)]})})
        begin
          if ($signed(wire13[(2'h3):(2'h3)]))
            begin
              reg14 <= (((~^wire4[(2'h3):(2'h2)]) ?
                      (((wire4 ? wire5 : wire7) ?
                              $unsigned(wire12) : wire1[(1'h0):(1'h0)]) ?
                          $unsigned((wire8 != wire10)) : $unsigned($signed(wire5))) : (+wire11)) ?
                  (8'ha2) : (-(+(-((7'h40) ? wire9 : (8'h9f))))));
              reg15 <= $unsigned($unsigned($signed((~|((8'hbd) ?
                  wire9 : wire11)))));
              reg16 <= $unsigned($signed($unsigned($signed((~&wire10)))));
              reg17 <= $unsigned((8'hab));
              reg18 <= (~&wire12[(3'h6):(3'h4)]);
            end
          else
            begin
              reg14 <= wire13[(3'h5):(1'h1)];
              reg15 <= $unsigned(($signed((~&(wire10 ?
                  reg15 : reg15))) << wire10));
              reg16 <= wire13;
            end
          reg19 <= wire3;
          reg20 <= {({(~^reg18[(1'h0):(1'h0)]),
                  wire3[(4'h8):(3'h7)]} << wire0[(1'h1):(1'h1)])};
          if (({wire6} + (($signed((reg17 ? (8'hb4) : (8'ha4))) + wire4) ?
              reg20 : $signed($signed(reg20)))))
            begin
              reg21 <= reg14;
              reg22 <= $signed(reg16[(3'h7):(1'h1)]);
            end
          else
            begin
              reg21 <= ({$unsigned(reg21[(3'h4):(2'h3)])} ?
                  ((~&$signed((8'ha2))) << reg16[(4'hb):(4'ha)]) : reg16[(1'h1):(1'h0)]);
              reg22 <= (((reg16[(4'ha):(4'h9)] <= $unsigned(wire2[(4'ha):(2'h2)])) ~^ (~|(~wire4))) ?
                  wire6 : (!reg14));
              reg23 <= ($signed($signed(wire9[(3'h4):(2'h2)])) ?
                  (&wire12) : (8'haf));
              reg24 <= $unsigned($unsigned((reg16 ?
                  ((~|wire9) < {wire11, (8'had)}) : (!$unsigned((8'ha8))))));
              reg25 <= $signed(($unsigned(($unsigned(wire3) != (reg22 ?
                      (8'ha9) : (7'h41)))) ?
                  $signed(($signed(reg18) ?
                      wire3[(3'h4):(2'h3)] : wire1[(1'h0):(1'h0)])) : {$unsigned({(8'hb3)})}));
            end
          reg26 <= reg17;
        end
      else
        begin
          reg14 <= reg19[(3'h5):(3'h5)];
          reg15 <= {(~$signed(wire5)),
              (({wire9[(3'h4):(1'h1)]} ?
                      (!reg24[(4'hd):(4'h9)]) : $unsigned((wire5 && (8'h9d)))) ?
                  $signed(($unsigned(wire4) ?
                      (wire9 ? reg25 : wire7) : $signed(reg21))) : reg15)};
          reg16 <= (^$signed({(reg21[(2'h2):(2'h2)] ?
                  $signed(reg20) : $unsigned(reg23))}));
          reg17 <= $unsigned((($unsigned(reg18[(1'h1):(1'h1)]) - wire3[(4'hb):(4'h9)]) != wire2));
        end
    end
  assign wire27 = wire6;
  assign wire28 = wire2;
  always
    @(posedge clk) begin
      reg29 <= $unsigned(wire5);
      reg30 <= $unsigned((!$signed((~&(wire27 || wire9)))));
      reg31 <= ((+wire6[(1'h0):(1'h0)]) ? (8'hae) : (8'hb7));
    end
  assign wire32 = (wire7[(1'h1):(1'h1)] ?
                      $signed(wire12) : ({wire1[(2'h2):(1'h1)]} && ((8'hba) ?
                          wire27 : (reg19[(3'h5):(3'h4)] <= (reg22 ?
                              reg25 : reg16)))));
  assign wire33 = {$unsigned({$unsigned(wire27[(2'h2):(2'h2)]), wire1})};
  module34 #() modinst152 (.clk(clk), .wire37(reg19), .wire38(wire0), .wire35(wire33), .wire36(wire11), .y(wire151));
  assign wire153 = $unsigned((~&wire3[(4'hb):(3'h5)]));
  assign wire154 = $signed((reg22[(4'h9):(4'h8)] ?
                       (!reg19) : (~^({reg21, wire153} ~^ (reg26 <= reg24)))));
endmodule

module module34
#(parameter param150 = (~|{(((~(8'hab)) ? ((8'hbe) >> (7'h41)) : (^~(8'hac))) - ({(8'ha5)} >> (-(8'ha9))))}))
(y, clk, wire35, wire36, wire37, wire38);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire147;
  wire [(2'h3):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire143;
  wire signed [(5'h13):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire83;
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire139,
                 wire86,
                 wire85,
                 wire39,
                 wire83,
                 (1'h0)};
  assign wire39 = {wire35[(4'hc):(4'hb)], (8'hbe)};
  module40 #() modinst84 (.clk(clk), .wire45(wire38), .wire43(wire37), .wire42(wire35), .y(wire83), .wire44(wire39), .wire41(wire36));
  assign wire85 = wire38;
  assign wire86 = (wire39 ^ wire39);
  module87 #() modinst140 (.wire90(wire39), .wire89(wire36), .wire91(wire38), .clk(clk), .y(wire139), .wire88(wire83));
  assign wire141 = wire35;
  assign wire142 = wire37;
  assign wire143 = wire35;
  assign wire144 = (~$signed(((~$unsigned(wire35)) ?
                       $unsigned((wire39 != wire141)) : wire37[(1'h1):(1'h1)])));
  assign wire145 = $signed((+$signed((wire143[(3'h7):(2'h2)] ?
                       (^~wire35) : (8'haa)))));
  assign wire146 = wire35;
  assign wire147 = (($unsigned(($unsigned(wire38) ?
                       $unsigned(wire37) : (^~wire86))) ^ (!($signed(wire37) <<< ((8'hb2) ?
                       wire141 : wire146)))) != $signed(wire143[(4'h9):(1'h0)]));
  assign wire148 = {wire38};
  assign wire149 = (+$unsigned((wire148 ?
                       {$unsigned(wire139), (~&wire148)} : $unsigned((wire145 ?
                           (8'hb0) : wire148)))));
endmodule

module module87
#(parameter param137 = ({(~(&((8'hbf) >>> (8'ha3))))} < ((((|(7'h42)) ? (!(8'hbe)) : {(8'hb0), (8'ha3)}) ? (~&((7'h44) ? (8'h9e) : (8'hae))) : (&((8'hb2) << (8'ha2)))) >= (|(8'hb1)))), 
parameter param138 = ((param137 && ({param137} ? ({param137} >>> (8'ha6)) : param137)) ? (8'hae) : ((-param137) ? (param137 <<< ((param137 >= (8'hb0)) <= (|param137))) : (^~(~|(^param137))))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h22c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire91;
  input wire signed [(3'h7):(1'h0)] wire90;
  input wire signed [(3'h4):(1'h0)] wire89;
  input wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(5'h11):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire116,
                 wire115,
                 wire114,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg130,
                 reg129,
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
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire92 = wire88[(4'ha):(1'h0)];
  assign wire93 = (!$signed(wire91));
  assign wire94 = ({(8'ha2)} ?
                      (^$signed((^{wire90}))) : (wire93[(3'h4):(1'h1)] ?
                          $unsigned(wire93[(4'hd):(4'hb)]) : $signed(wire92[(3'h4):(3'h4)])));
  assign wire95 = (|wire92[(2'h2):(1'h0)]);
  assign wire96 = ($unsigned((-((+wire90) ? ((7'h40) * wire94) : (~^wire89)))) ?
                      {(wire88 ?
                              (+wire89[(3'h4):(1'h0)]) : ($unsigned((8'hab)) == wire94))} : $signed((wire94 ?
                          wire90[(2'h2):(1'h0)] : (~&wire93))));
  always
    @(posedge clk) begin
      reg97 <= wire95;
      if ((~^(wire96[(2'h2):(1'h0)] + $unsigned({(wire90 & wire91)}))))
        begin
          reg98 <= (($unsigned((~^{wire96})) > $unsigned((wire89 + wire89[(1'h0):(1'h0)]))) ?
              wire96 : ($signed((wire94[(3'h6):(1'h1)] == ((8'ha3) ?
                      wire94 : wire91))) ?
                  ($unsigned((wire91 == wire95)) & wire91) : wire91));
          reg99 <= (!(-wire89[(2'h3):(1'h0)]));
          reg100 <= $unsigned($signed($unsigned(wire91[(2'h2):(2'h2)])));
          reg101 <= wire93[(4'h8):(2'h2)];
          reg102 <= reg99[(2'h3):(1'h1)];
        end
      else
        begin
          reg98 <= (8'hb0);
          reg99 <= (+((((wire95 && reg101) << wire93[(4'he):(4'h8)]) ?
              reg102[(2'h2):(1'h1)] : ({wire92,
                  reg100} * (!reg102))) || ({reg98, wire89} ?
              (reg98[(4'he):(4'h8)] | (^~wire94)) : {(wire89 == wire89)})));
          reg100 <= $unsigned({(~^{(wire95 <= (8'haf)), (wire91 << wire91)})});
          reg101 <= $signed({$unsigned((wire92[(3'h6):(3'h5)] ?
                  (~(8'h9e)) : $unsigned(wire90))),
              wire90[(3'h6):(3'h6)]});
        end
    end
  assign wire103 = (+({(wire92 ?
                               (wire91 ?
                                   (8'hb2) : wire92) : $unsigned(reg100))} ?
                       {wire91[(2'h3):(2'h3)]} : $signed($signed(((8'h9f) ?
                           wire92 : reg102)))));
  assign wire104 = (^~$signed($signed((-(wire103 ? wire88 : reg98)))));
  assign wire105 = wire93;
  assign wire106 = reg99;
  assign wire107 = ((({{wire92}, $unsigned(reg97)} ?
                       wire104[(4'hd):(3'h7)] : (&$unsigned(wire105))) || (wire106[(1'h1):(1'h0)] * $signed($unsigned((7'h42))))) ^ (wire104[(3'h6):(1'h1)] ?
                       (|({wire94,
                           wire94} - wire95[(2'h2):(1'h0)])) : (((~wire95) | $unsigned(reg100)) <<< $unsigned(((8'ha5) <<< wire95)))));
  always
    @(posedge clk) begin
      reg108 <= wire95[(1'h0):(1'h0)];
      if ($signed($signed(({((8'ha6) >>> reg98), $unsigned(wire91)} ?
          wire95[(1'h1):(1'h1)] : (-$signed(wire90))))))
        begin
          if ((({wire95[(1'h0):(1'h0)]} > (^~wire95)) ?
              wire91 : wire90[(3'h6):(2'h2)]))
            begin
              reg109 <= (($unsigned({$signed(wire107)}) ?
                      $unsigned(($signed(reg100) ?
                          wire91 : $signed(wire104))) : {wire93[(4'h8):(2'h2)],
                          $signed((~&wire95))}) ?
                  wire93 : ($unsigned((reg102[(2'h2):(1'h1)] <<< (wire105 + reg98))) ?
                      wire88 : (^wire92[(2'h3):(2'h3)])));
              reg110 <= wire91[(2'h2):(2'h2)];
              reg111 <= (wire91[(2'h3):(1'h1)] >>> (|reg101));
            end
          else
            begin
              reg109 <= ($signed(wire104[(3'h4):(2'h2)]) ?
                  ({wire103, $signed((&reg99))} > wire93) : reg109);
              reg110 <= $signed(wire89[(2'h2):(1'h0)]);
              reg111 <= $unsigned($signed(wire103));
              reg112 <= {(wire89[(3'h4):(3'h4)] ?
                      $signed(wire95) : ((|(reg99 == reg100)) & (~^wire92[(2'h3):(2'h2)])))};
            end
          reg113 <= {($signed({reg97[(3'h6):(2'h3)]}) ? (8'ha9) : (+wire89))};
        end
      else
        begin
          reg109 <= ($unsigned(wire94) ~^ $unsigned(wire88[(4'he):(4'he)]));
          if ((-((~&wire91) ?
              $unsigned(wire106) : ($unsigned(reg111) ?
                  $signed((wire104 ? reg110 : reg113)) : reg100))))
            begin
              reg110 <= ((wire92 ?
                  $signed({$signed(wire93)}) : (~reg112)) == (&$signed({(reg111 ?
                      (8'hb3) : reg108),
                  $signed((8'hbe))})));
              reg111 <= (-(($signed(reg108) + reg112[(3'h5):(2'h2)]) ~^ ($unsigned(reg97) ?
                  (reg112 ?
                      wire91 : $unsigned(reg110)) : (^~$signed(wire106)))));
            end
          else
            begin
              reg110 <= reg100[(4'hf):(4'hb)];
              reg111 <= ($signed((^{(wire106 & wire94), $signed(wire105)})) ?
                  ((|$unsigned(wire91)) ?
                      (~&{wire88[(3'h5):(2'h3)],
                          wire88[(4'hb):(2'h2)]}) : wire95) : (~|reg111[(2'h3):(1'h0)]));
            end
          reg112 <= reg109[(2'h3):(2'h3)];
          reg113 <= wire105;
        end
    end
  assign wire114 = (((wire107 ^ ($unsigned(reg111) || (reg102 <<< wire93))) == $signed($unsigned((^reg112)))) ?
                       $unsigned((~|$signed({wire91}))) : ($signed(($signed(reg108) ?
                           (wire96 + reg110) : (^~(8'hb3)))) >>> ($unsigned(reg113) ^ ((!(8'haa)) | (|wire106)))));
  assign wire115 = (8'ha6);
  assign wire116 = (|$unsigned((^~$unsigned(reg98[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg117 <= $unsigned(reg101[(4'hc):(2'h3)]);
      reg118 <= reg97[(2'h2):(2'h2)];
      if (wire92[(4'h9):(4'h8)])
        begin
          reg119 <= wire96[(2'h2):(1'h0)];
          if ((~^$unsigned(reg110[(4'h8):(2'h3)])))
            begin
              reg120 <= (reg119[(3'h4):(1'h1)] << $signed(wire94));
              reg121 <= {wire93[(5'h13):(4'hd)],
                  $unsigned($signed($unsigned(reg118[(3'h6):(3'h5)])))};
              reg122 <= ({($signed(wire106[(2'h2):(1'h0)]) ^ $unsigned(reg112)),
                      wire94[(3'h7):(3'h5)]} ?
                  reg99[(2'h3):(2'h2)] : $unsigned(((!$signed(reg111)) ?
                      $signed((^wire104)) : {$signed(reg113), reg100})));
            end
          else
            begin
              reg120 <= (~|$unsigned(reg110[(3'h6):(3'h4)]));
              reg121 <= wire90[(3'h5):(2'h3)];
              reg122 <= {$signed(($signed(wire95) <= reg117[(4'ha):(3'h7)])),
                  (~&$signed(((wire103 ?
                      reg112 : (8'h9c)) && $signed(wire106))))};
            end
          if ({wire93})
            begin
              reg123 <= wire94;
              reg124 <= ((wire105[(4'ha):(4'ha)] ?
                      (($unsigned(reg97) << (wire91 >> reg119)) ^ $unsigned((~wire115))) : $unsigned(reg110)) ?
                  ((~^{$signed(wire94)}) << $signed(($signed((7'h42)) < wire106[(3'h4):(2'h2)]))) : wire94);
            end
          else
            begin
              reg123 <= {(wire91[(3'h6):(3'h6)] ?
                      wire116[(3'h5):(2'h3)] : wire95[(2'h3):(2'h2)]),
                  (((wire104[(4'hc):(3'h7)] ?
                      $signed(reg100) : (~reg100)) >= ((wire88 ?
                          reg97 : wire107) ?
                      $unsigned(reg99) : {wire105,
                          wire104})) & {(~^$unsigned(reg119)),
                      ((~|wire114) << (reg112 & reg111))})};
              reg124 <= {($signed((8'hab)) < (~reg108[(3'h5):(3'h5)])),
                  {reg118}};
              reg125 <= $unsigned(((wire106[(3'h5):(3'h4)] ?
                  $unsigned(reg108[(4'hd):(3'h5)]) : $signed(reg100)) == wire106));
            end
          reg126 <= $unsigned($signed(((-{wire106,
              wire104}) && $signed(wire95[(1'h0):(1'h0)]))));
        end
      else
        begin
          if (reg102[(2'h3):(1'h0)])
            begin
              reg119 <= ($signed(wire104) && (-$unsigned(wire92[(5'h10):(2'h2)])));
              reg120 <= $signed($unsigned($signed(($signed(wire93) || {(7'h43),
                  reg109}))));
            end
          else
            begin
              reg119 <= ($unsigned((~((wire90 ?
                  reg118 : reg119) > $signed(wire114)))) && reg101[(1'h0):(1'h0)]);
            end
          reg121 <= $signed($signed(reg113[(2'h2):(1'h0)]));
          reg122 <= wire107;
          if ((({(reg110[(2'h3):(1'h0)] != (reg120 ^ reg99))} && $signed(wire116)) ?
              wire91 : ({({(8'had), reg101} & reg100), wire96[(2'h2):(1'h1)]} ?
                  $unsigned((~(~^wire94))) : reg98[(4'hc):(3'h6)])))
            begin
              reg123 <= wire106;
              reg124 <= ((((7'h42) | reg99[(4'h8):(3'h7)]) || wire105[(3'h5):(3'h4)]) ?
                  ($unsigned($signed(wire88[(4'he):(2'h3)])) ?
                      (((wire94 ? wire92 : wire91) ?
                              (reg120 ? reg109 : reg110) : $signed(wire96)) ?
                          $signed($unsigned(wire107)) : $unsigned($signed(reg126))) : ((|(reg97 ?
                          wire89 : reg118)) == ((&reg102) ?
                          (-reg126) : $unsigned(reg110)))) : (~|(reg118 & $unsigned((-reg122)))));
              reg125 <= {{$signed((^~wire106[(1'h1):(1'h0)]))},
                  ({($unsigned(reg99) ? $signed((8'ha1)) : (^reg111))} ?
                      wire115[(3'h6):(3'h4)] : reg110[(4'ha):(3'h7)])};
              reg126 <= wire93[(5'h13):(3'h6)];
            end
          else
            begin
              reg123 <= $unsigned({(+$unsigned(reg118)),
                  (wire92[(2'h3):(2'h3)] + wire116[(2'h2):(1'h0)])});
              reg124 <= (($signed($signed((reg121 ? wire92 : reg122))) ?
                  (wire89[(2'h2):(1'h1)] ?
                      (wire114[(4'hc):(4'h9)] > $signed(reg118)) : (^$signed(wire106))) : $signed(reg120)) | $signed((wire96 ?
                  reg125[(2'h3):(2'h3)] : $signed(reg126[(4'hc):(4'h8)]))));
              reg125 <= (8'haa);
              reg126 <= reg98[(4'h9):(3'h6)];
              reg127 <= $unsigned(wire88[(2'h3):(2'h3)]);
            end
          reg128 <= ((8'haf) ^~ $signed((7'h42)));
        end
      reg129 <= $unsigned((&reg123));
      reg130 <= wire106;
    end
  assign wire131 = wire115[(1'h1):(1'h1)];
  assign wire132 = (^wire95);
  assign wire133 = $unsigned(reg117[(3'h7):(3'h6)]);
  assign wire134 = {wire94[(2'h2):(2'h2)]};
  assign wire135 = $signed(($signed(reg98) >> $signed(reg120[(1'h1):(1'h0)])));
  assign wire136 = reg122;
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire45;
  input wire signed [(3'h6):(1'h0)] wire44;
  input wire [(4'ha):(1'h0)] wire43;
  input wire signed [(5'h15):(1'h0)] wire42;
  input wire [(3'h5):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire46;
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire79,
                 wire78,
                 wire67,
                 wire66,
                 wire62,
                 wire61,
                 wire46,
                 reg80,
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
                 reg47,
                 (1'h0)};
  assign wire46 = $unsigned((8'ha3));
  always
    @(posedge clk) begin
      if (($unsigned($unsigned($unsigned((~&wire42)))) != wire42))
        begin
          reg47 <= {$unsigned((($signed(wire42) | $unsigned(wire46)) || ({wire41} >> $unsigned((8'hab)))))};
          reg48 <= reg47;
        end
      else
        begin
          reg47 <= {$unsigned((8'ha2)),
              $unsigned(($signed((wire46 >= wire43)) ?
                  wire41 : wire43[(3'h4):(3'h4)]))};
          if (wire41[(3'h4):(2'h3)])
            begin
              reg48 <= (|($unsigned(reg48) << ((((8'hbb) == wire43) ~^ (wire42 ?
                      wire41 : wire44)) ?
                  $signed({reg47, wire42}) : reg47[(1'h1):(1'h0)])));
            end
          else
            begin
              reg48 <= wire44[(3'h4):(3'h4)];
              reg49 <= wire41[(3'h4):(2'h3)];
              reg50 <= (|(wire42 ?
                  $unsigned((+wire45[(3'h7):(3'h4)])) : (^~(-(-wire46)))));
              reg51 <= (^((wire44[(2'h2):(2'h2)] ?
                      {(reg48 ? (8'ha9) : reg50),
                          $signed((8'hb5))} : ($unsigned(reg48) ?
                          $unsigned(wire42) : $unsigned(reg48))) ?
                  (|$signed(wire43[(2'h2):(1'h0)])) : {wire43,
                      {$unsigned(wire42)}}));
              reg52 <= wire44[(3'h6):(2'h3)];
            end
          reg53 <= (^~((wire44 ?
              (reg48[(2'h2):(2'h2)] ?
                  wire46[(3'h5):(2'h3)] : (8'hb8)) : reg52[(5'h11):(3'h7)]) - (-($unsigned(reg51) ?
              wire45 : $unsigned((8'ha6))))));
        end
      reg54 <= $unsigned((({$signed(reg50)} ?
          (~$signed(reg48)) : $signed($unsigned(wire41))) || wire43[(1'h0):(1'h0)]));
      if (reg53[(4'h8):(3'h4)])
        begin
          reg55 <= ((wire41[(1'h0):(1'h0)] <= reg47) ?
              (reg51 ?
                  ($unsigned((wire45 ? (8'hbd) : reg47)) ?
                      wire42[(3'h6):(2'h3)] : {(~wire45)}) : (|(reg49 ~^ $unsigned(reg50)))) : reg50);
          reg56 <= $signed($unsigned($unsigned((reg54[(4'he):(4'ha)] ?
              $signed(reg52) : $signed(wire46)))));
          if ($signed($unsigned(reg55[(2'h2):(1'h1)])))
            begin
              reg57 <= (!($signed(wire45) ?
                  ({(wire44 * reg56),
                      (reg52 == reg52)} + (reg50[(4'h8):(4'h8)] ?
                      reg47[(1'h1):(1'h0)] : wire41[(3'h4):(3'h4)])) : (^~((!reg49) ?
                      reg48[(2'h3):(1'h0)] : $unsigned(reg49)))));
            end
          else
            begin
              reg57 <= (^~reg50[(3'h7):(1'h0)]);
              reg58 <= ($signed(wire46) ? $unsigned((8'hac)) : wire42);
              reg59 <= (&(~$unsigned({{reg48}, (~reg58)})));
              reg60 <= wire46[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg55 <= $unsigned(($unsigned(((-reg55) <<< $unsigned(reg50))) ~^ $signed((^~(-wire44)))));
          reg56 <= ((!((((8'hb3) ? wire43 : reg51) & (|reg51)) ?
              ($unsigned(reg60) && (reg58 ?
                  reg54 : reg60)) : reg59[(2'h3):(1'h1)])) >> reg57[(2'h2):(1'h1)]);
          reg57 <= (~&((^~((reg50 ? reg50 : reg58) ?
              (wire41 || wire41) : $signed(reg51))) != $unsigned(reg52[(3'h6):(3'h4)])));
        end
    end
  assign wire61 = reg48;
  assign wire62 = wire41[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg63 <= reg47;
      reg64 <= ($unsigned($unsigned($signed((reg54 ? reg51 : reg50)))) ?
          (8'ha3) : (^~(({wire62, reg59} >> $signed(reg55)) ?
              reg59[(4'hc):(1'h1)] : (~|(reg57 == reg59)))));
      reg65 <= {$signed(reg58),
          (&{(((8'hb1) ? reg48 : (8'hba)) ? $signed(wire46) : reg63)})};
    end
  assign wire66 = reg64;
  assign wire67 = wire42;
  always
    @(posedge clk) begin
      reg68 <= reg47;
      reg69 <= $unsigned($unsigned($signed($signed(reg56))));
      if ((^~reg57[(1'h1):(1'h0)]))
        begin
          if ((reg49[(4'ha):(3'h6)] ?
              ((reg50 >> ({reg57} == reg63[(1'h1):(1'h0)])) ^ {((!(8'ha2)) + (reg58 + wire46))}) : $unsigned(wire62)))
            begin
              reg70 <= ($unsigned((reg54 >> ((7'h42) ?
                  $signed(wire62) : (wire43 >= reg57)))) <<< (+reg64[(3'h7):(2'h2)]));
              reg71 <= ((!(+{((8'hb9) ? reg64 : wire61)})) ?
                  {$signed({(&wire45),
                          reg70[(1'h0):(1'h0)]})} : $signed(($signed(reg64[(1'h1):(1'h0)]) ?
                      reg52 : reg53)));
            end
          else
            begin
              reg70 <= {wire66[(4'hd):(2'h3)],
                  $unsigned((wire66 >> (reg65 ? (7'h43) : $signed(wire62))))};
              reg71 <= ((^((~&{reg55}) ?
                      $unsigned((reg53 ?
                          wire46 : wire42)) : $signed($unsigned(reg63)))) ?
                  $signed((wire62 ?
                      {(reg64 ?
                              (8'hb0) : reg70)} : $unsigned($unsigned(reg51)))) : ((~|(&{reg57})) ?
                      $signed($unsigned(reg64[(4'hd):(4'h9)])) : $signed(($unsigned(reg59) ?
                          (~^reg50) : reg50))));
            end
          reg72 <= (~&($unsigned(wire61[(1'h1):(1'h1)]) || (|wire44[(2'h3):(1'h1)])));
        end
      else
        begin
          if ((~^(($unsigned(wire43) && ({reg70} ? reg71 : (8'hae))) ?
              ($unsigned($unsigned((8'hbc))) ?
                  ((&reg63) ? reg70 : $unsigned(reg48)) : ((reg64 ?
                          reg64 : (8'hac)) ?
                      (~|reg68) : {reg55})) : ($signed($unsigned(reg65)) ?
                  reg55[(3'h6):(2'h3)] : reg64))))
            begin
              reg70 <= (reg65[(3'h5):(2'h3)] ?
                  {(~$unsigned(wire42[(5'h12):(5'h11)]))} : (|(8'hbc)));
              reg71 <= (!$unsigned(wire67[(1'h1):(1'h1)]));
              reg72 <= $signed(reg49[(3'h6):(3'h4)]);
              reg73 <= $unsigned(reg63[(3'h6):(3'h5)]);
            end
          else
            begin
              reg70 <= reg52;
            end
          if ((|$unsigned(reg53[(4'hb):(4'hb)])))
            begin
              reg74 <= reg63;
            end
          else
            begin
              reg74 <= reg51;
              reg75 <= reg68;
              reg76 <= $signed({{($signed(reg50) ?
                          $unsigned(wire41) : {reg54})},
                  {$unsigned((wire67 >>> reg48)), (8'ha6)}});
            end
        end
      reg77 <= ($unsigned($unsigned(((reg57 ^~ wire44) ?
              reg55[(2'h3):(1'h0)] : (8'hbb)))) ?
          reg72 : $unsigned($signed($signed((^~reg56)))));
    end
  assign wire78 = reg55[(3'h6):(3'h5)];
  assign wire79 = {{reg71, reg49[(3'h5):(3'h5)]}};
  always
    @(posedge clk) begin
      reg80 <= (reg48[(3'h5):(1'h1)] ?
          (wire45 ^ (~|$signed($unsigned((8'hbf))))) : reg54[(4'hd):(4'hd)]);
    end
  assign wire81 = $unsigned(reg58);
  assign wire82 = $signed(wire62[(2'h3):(2'h2)]);
endmodule
