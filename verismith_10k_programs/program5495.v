module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire228;
  wire signed [(2'h3):(1'h0)] wire227;
  wire [(5'h11):(1'h0)] wire225;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  assign y = {wire228,
                 wire227,
                 wire225,
                 wire118,
                 wire17,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = wire4[(3'h7):(2'h3)];
  assign wire6 = {$unsigned($signed((wire3[(1'h0):(1'h0)] ~^ wire2)))};
  assign wire7 = wire0;
  assign wire8 = ({($unsigned($signed(wire1)) | (wire3 >>> wire1[(1'h1):(1'h1)])),
                     $signed((-wire2[(2'h3):(2'h3)]))} <= ((wire6 ?
                         (8'hb9) : wire5) ?
                     wire3 : wire6));
  assign wire9 = (wire1 && (~wire7));
  assign wire10 = $unsigned({(wire0 ? (&(wire4 ? wire8 : wire4)) : (8'h9e))});
  assign wire11 = wire6[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg12 <= {$unsigned($unsigned($unsigned((wire7 && wire10))))};
      if (($signed((($unsigned(reg12) == (wire3 >= wire4)) ?
          wire7[(4'h9):(3'h5)] : wire4)) <= $unsigned(wire5)))
        begin
          reg13 <= $signed($unsigned(wire0));
          reg14 <= wire9;
          reg15 <= (8'ha1);
        end
      else
        begin
          reg13 <= ($unsigned(((wire9 || (|wire7)) ?
                  {$signed((8'hbf))} : $unsigned($signed(wire8)))) ?
              (|(~wire11)) : wire5);
          reg14 <= $signed((reg14[(1'h1):(1'h0)] ? reg12 : $signed((8'ha1))));
          reg15 <= (^~{$unsigned($signed($signed(wire1))),
              wire0[(2'h3):(1'h0)]});
          reg16 <= (-$unsigned(wire7[(4'hb):(3'h6)]));
        end
    end
  assign wire17 = $unsigned((~|((&reg14[(3'h4):(2'h2)]) ^~ $unsigned($signed(wire2)))));
  module18 #() modinst119 (wire118, clk, wire4, wire9, wire5, reg16, wire11);
  module120 #() modinst226 (wire225, clk, wire2, reg12, wire11, wire5, wire8);
  assign wire227 = (!(($unsigned(wire9) ? $unsigned(wire8) : (8'ha3)) ?
                       (((wire9 & wire0) >>> (wire4 < wire8)) <= wire2) : (wire6 >>> $unsigned($unsigned(wire1)))));
  assign wire228 = $unsigned((^~(~|({wire7} + $signed(wire4)))));
endmodule

module module120
#(parameter param224 = (-(~&((((8'hac) ^ (8'hb6)) > ((8'hba) >= (8'hb0))) ? (((8'ha4) ^ (8'hbf)) ? ((8'hb4) ? (8'hbf) : (8'hb2)) : (8'ha1)) : (((8'hae) ? (8'h9d) : (8'ha1)) ? ((8'had) * (8'hb0)) : ((8'hbc) >>> (8'hb5)))))))
(y, clk, wire121, wire122, wire123, wire124, wire125);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire121;
  input wire signed [(4'hc):(1'h0)] wire122;
  input wire signed [(4'hf):(1'h0)] wire123;
  input wire [(5'h12):(1'h0)] wire124;
  input wire [(4'ha):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire223;
  wire [(5'h10):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire171;
  wire signed [(5'h14):(1'h0)] wire173;
  wire signed [(5'h10):(1'h0)] wire174;
  wire [(3'h4):(1'h0)] wire175;
  wire signed [(4'ha):(1'h0)] wire176;
  wire [(3'h7):(1'h0)] wire186;
  wire signed [(5'h14):(1'h0)] wire187;
  wire signed [(5'h13):(1'h0)] wire188;
  wire signed [(3'h6):(1'h0)] wire189;
  wire [(4'hf):(1'h0)] wire221;
  reg signed [(3'h7):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg180 = (1'h0);
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg178 = (1'h0);
  reg [(4'hc):(1'h0)] reg177 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  assign y = {wire223,
                 wire127,
                 wire171,
                 wire173,
                 wire174,
                 wire175,
                 wire176,
                 wire186,
                 wire187,
                 wire188,
                 wire189,
                 wire221,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg126,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg126 <= ((wire123[(2'h2):(2'h2)] + (^wire124)) ?
          (^~$signed((8'hac))) : $unsigned(wire124[(2'h2):(2'h2)]));
    end
  assign wire127 = $signed({(^~$signed(((8'hab) ? wire124 : wire124)))});
  module128 #() modinst172 (.wire130(wire122), .wire129(wire127), .wire131(wire124), .wire132(wire123), .clk(clk), .wire133(reg126), .y(wire171));
  assign wire173 = $unsigned(($unsigned($unsigned(wire125[(4'h8):(1'h1)])) ?
                       ($unsigned(wire122) - reg126) : wire123));
  assign wire174 = {(wire125[(1'h0):(1'h0)] ^~ {wire121})};
  assign wire175 = $signed({$signed((~wire124))});
  assign wire176 = $signed($signed(({$signed(wire171),
                       reg126[(3'h6):(1'h0)]} - $unsigned({wire127,
                       wire122}))));
  always
    @(posedge clk) begin
      reg177 <= $unsigned($unsigned($signed(wire124)));
      reg178 <= wire121[(1'h1):(1'h0)];
      if (wire171[(1'h1):(1'h1)])
        begin
          reg179 <= wire174[(4'ha):(4'h9)];
          reg180 <= $signed(wire176[(3'h7):(2'h2)]);
          reg181 <= $unsigned(((wire125 + (~wire125)) ?
              (wire174[(2'h2):(1'h1)] ?
                  ((wire121 ? wire127 : wire176) ?
                      (reg177 && wire174) : (~^wire171)) : {reg126[(2'h2):(1'h0)],
                      (wire121 < wire127)}) : reg180[(4'ha):(3'h7)]));
        end
      else
        begin
          reg179 <= ((((wire123 == $signed(wire124)) ?
                      ((-(8'hac)) ?
                          (reg180 ?
                              reg181 : wire175) : $unsigned(wire176)) : ((~&wire123) * wire121[(2'h3):(2'h3)])) ?
                  $signed((wire124 ?
                      (+reg178) : (~|(8'ha9)))) : (-((wire123 ~^ reg180) ?
                      wire173[(2'h2):(1'h0)] : (~^reg177)))) ?
              {((reg177 ? (-wire175) : (^wire122)) ?
                      (~^{reg179, reg177}) : ($unsigned(reg178) ?
                          wire125 : $signed(reg179)))} : (^(reg178[(1'h1):(1'h0)] * wire175[(1'h1):(1'h0)])));
          if (((&{((wire175 << wire122) || wire174[(4'hd):(1'h1)]),
              $signed((wire171 ? wire124 : wire124))}) + $unsigned(wire125)))
            begin
              reg180 <= $unsigned(($unsigned($unsigned(reg178[(2'h2):(1'h0)])) > $signed((((8'hbb) >>> reg178) | $unsigned(reg181)))));
            end
          else
            begin
              reg180 <= {$unsigned(($unsigned($signed(reg177)) ^~ $unsigned({wire176})))};
              reg181 <= (wire171[(2'h2):(1'h0)] - wire176[(2'h2):(1'h1)]);
              reg182 <= wire174[(2'h3):(2'h2)];
              reg183 <= wire125;
            end
          if ($signed(wire122))
            begin
              reg184 <= reg182;
              reg185 <= reg178;
            end
          else
            begin
              reg184 <= wire171;
            end
        end
    end
  assign wire186 = {$signed(($signed($signed(wire127)) ^ (wire173 - {wire176}))),
                       (!$unsigned($signed(wire127[(2'h2):(2'h2)])))};
  assign wire187 = (reg181 || $signed(wire122[(1'h1):(1'h1)]));
  assign wire188 = wire176;
  assign wire189 = reg179[(4'hc):(4'h9)];
  module190 #() modinst222 (wire221, clk, reg126, reg179, wire121, wire124, wire188);
  assign wire223 = $signed($unsigned((reg183 ?
                       ((~&wire174) ?
                           (~|(7'h40)) : ((8'ha3) ?
                               wire122 : wire124)) : (-(wire124 >>> (7'h43))))));
endmodule

module module18  (y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire39;
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  assign y = {wire117,
                 wire115,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire24,
                 wire25,
                 wire26,
                 wire39,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire24 = (+((((wire23 ~^ wire20) ?
                      (wire23 + (7'h40)) : wire19) + ($unsigned(wire21) ?
                      {wire20} : $unsigned(wire22))) < ($unsigned((wire22 ?
                      wire20 : wire23)) == {(wire22 << wire20)})));
  assign wire25 = $signed(wire22[(4'hb):(3'h5)]);
  assign wire26 = $signed($signed($unsigned($unsigned((~|wire24)))));
  module27 #() modinst40 (wire39, clk, wire25, wire21, wire26, wire24, wire20);
  always
    @(posedge clk) begin
      reg41 <= ({$signed(wire21[(5'h12):(1'h0)]),
          {{((8'h9f) ?
                      wire25 : wire19)}}} + $unsigned((|wire23[(4'h9):(4'h8)])));
      reg42 <= {$signed($signed(({wire26} | (wire20 + wire20))))};
      reg43 <= reg41;
      if ($signed($signed(wire25[(4'h8):(3'h5)])))
        begin
          reg44 <= (({(~^wire22)} & wire26[(4'hf):(4'h8)]) ?
              ({((reg43 ? reg43 : (8'hbe)) && (-reg41)),
                  wire20} <<< $signed(wire24)) : ($unsigned({$unsigned(wire22)}) ?
                  ((!$signed(reg42)) >> $unsigned((-wire22))) : ((!(~wire25)) + $signed((8'hbe)))));
          if (($unsigned($unsigned(wire21)) ?
              $signed(wire21[(4'h9):(3'h7)]) : wire25))
            begin
              reg45 <= reg42;
              reg46 <= ($unsigned((~&wire19)) >>> $signed({(wire20 ?
                      $unsigned(wire26) : wire19[(3'h7):(1'h1)])}));
            end
          else
            begin
              reg45 <= wire25[(4'hc):(3'h6)];
              reg46 <= ((^~$signed($signed(wire21))) ?
                  (^wire20) : $signed({(!(^~reg42)),
                      $unsigned(reg46[(3'h7):(3'h6)])}));
              reg47 <= wire26[(2'h2):(1'h0)];
              reg48 <= $signed((~|$signed(($signed(reg42) ~^ ((7'h43) ^~ (8'hbd))))));
            end
        end
      else
        begin
          reg44 <= wire20[(4'ha):(2'h2)];
          reg45 <= $signed(wire20);
        end
    end
  module49 #() modinst76 (.wire54(reg46), .clk(clk), .y(wire75), .wire51(reg41), .wire52(reg42), .wire50(wire24), .wire53(wire23));
  assign wire77 = (~&(|(~wire25)));
  assign wire78 = ((((reg48 <<< wire25[(2'h2):(1'h1)]) ?
                          $signed(reg44) : $signed((!(8'hb7)))) >= ($unsigned(reg43) ?
                          reg47 : wire24)) ?
                      (|$unsigned($signed($unsigned(wire19)))) : $signed(((~^$unsigned((8'ha2))) ?
                          (^(|wire75)) : ({wire21} ^~ wire75[(1'h1):(1'h0)]))));
  assign wire79 = (($unsigned(wire24[(1'h0):(1'h0)]) ?
                      reg43 : wire20) >> $signed($unsigned(($signed(wire26) <= (|(8'h9c))))));
  assign wire80 = ({wire23[(4'hc):(1'h1)]} ^ $signed(reg43[(1'h0):(1'h0)]));
  assign wire81 = $unsigned(wire75);
  assign wire82 = (((8'haa) - reg44) << (((8'ha3) >= wire21) + $unsigned($unsigned($unsigned((8'h9c))))));
  assign wire83 = $signed(reg44);
  module84 #() modinst116 (.wire89(reg43), .clk(clk), .wire86(wire81), .y(wire115), .wire85(wire21), .wire88(wire79), .wire87(wire24));
  assign wire117 = (|($unsigned(reg47) ?
                       reg42[(4'h8):(1'h0)] : reg46[(4'hc):(1'h1)]));
endmodule

module module84
#(parameter param113 = ((^(8'ha1)) ? (~({((8'hb6) ~^ (8'h9e))} <= (((8'ha0) <<< (7'h43)) ? ((8'ha6) ? (8'hb1) : (8'hbe)) : (!(8'ha8))))) : (({{(8'hbb), (8'hb2)}} >> ({(8'hb7)} ? (8'ha7) : ((8'hb5) ^ (8'hb3)))) ? ((((8'ha3) ? (8'hb3) : (8'hb5)) ? (8'hb0) : ((8'hb9) && (8'ha0))) ? ((~|(8'hae)) ? ((8'ha8) & (8'hab)) : ((8'hb3) > (7'h43))) : (!((8'hbe) ? (8'hb5) : (8'hae)))) : ((((8'h9d) * (8'ha0)) + {(8'ha8)}) ? (~|((8'haa) ? (8'hb7) : (8'hac))) : ({(8'h9e)} ? (8'hb0) : {(8'had), (7'h44)})))), 
parameter param114 = ((param113 ? param113 : (^(-(-param113)))) ? ({(~param113), param113} < {{(param113 ^ param113)}}) : (((^~(param113 ? param113 : param113)) ? {((8'h9c) ? param113 : param113)} : ((~&param113) ^ (param113 ? (7'h42) : param113))) && (param113 ? (param113 ? ((8'hb8) ? param113 : param113) : param113) : ((param113 ? param113 : param113) ? {param113, param113} : (!param113))))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire89;
  input wire signed [(3'h6):(1'h0)] wire88;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire [(4'h9):(1'h0)] wire86;
  input wire [(4'h8):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire91,
                 wire90,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire90 = (((+wire85) ?
                      $signed(wire86[(3'h6):(1'h1)]) : $unsigned(wire88[(1'h1):(1'h0)])) >> wire87[(2'h3):(2'h3)]);
  assign wire91 = $unsigned(((wire90[(1'h1):(1'h1)] ?
                          $unsigned((wire86 != wire89)) : ({wire88} ?
                              $unsigned(wire89) : (wire87 ?
                                  (8'haa) : wire89))) ?
                      ($signed($signed(wire89)) >= ($unsigned(wire88) ?
                          $signed((8'ha9)) : (~&wire90))) : wire87[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      if (wire86[(3'h5):(1'h0)])
        begin
          reg92 <= wire88[(3'h6):(1'h1)];
        end
      else
        begin
          reg92 <= wire86[(2'h3):(2'h2)];
          reg93 <= (!wire85);
          reg94 <= wire87;
        end
      reg95 <= wire85;
    end
  assign wire96 = $unsigned((wire87 ?
                      ((~^wire89[(3'h4):(2'h3)]) && wire90[(2'h2):(1'h0)]) : {((|reg94) ~^ (wire91 ?
                              wire88 : reg92)),
                          $signed($signed((8'ha7)))}));
  assign wire97 = $signed(wire86);
  assign wire98 = reg95[(4'h9):(1'h1)];
  assign wire99 = ($signed((^~(wire91 ? wire89 : $unsigned(wire90)))) ?
                      wire96[(1'h1):(1'h1)] : (wire90[(2'h2):(2'h2)] <<< ((!$signed(wire90)) | wire97[(4'h8):(3'h7)])));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire89[(1'h0):(1'h0)])))
        begin
          reg100 <= wire88[(3'h5):(3'h4)];
        end
      else
        begin
          if ((&wire90))
            begin
              reg100 <= {(reg92 <<< $signed($signed(wire90))),
                  {wire85, wire85[(1'h0):(1'h0)]}};
              reg101 <= $unsigned({((~&wire98[(5'h13):(3'h5)]) ^ $unsigned((|reg93)))});
              reg102 <= $unsigned(wire98);
            end
          else
            begin
              reg100 <= ($unsigned(({(reg102 <= wire97)} ?
                  $signed(((8'h9c) ?
                      wire91 : (8'haa))) : reg101)) >= (+wire87[(1'h0):(1'h0)]));
              reg101 <= wire85[(3'h5):(2'h2)];
            end
          if ((~^$unsigned((~|wire98[(4'hd):(4'ha)]))))
            begin
              reg103 <= $signed(wire97);
            end
          else
            begin
              reg103 <= (reg92 ?
                  $signed((wire88[(1'h1):(1'h0)] + $unsigned({wire88}))) : {$unsigned(wire89[(4'h9):(2'h2)]),
                      {(~(~reg93)), $unsigned(wire90[(1'h1):(1'h1)])}});
              reg104 <= $unsigned($signed(($signed($signed(reg95)) - (~^{reg100,
                  wire90}))));
            end
          reg105 <= wire96;
        end
      reg106 <= (~|(~&{{(reg104 ? reg100 : wire98)}}));
      reg107 <= $unsigned($unsigned(wire89[(3'h4):(2'h3)]));
    end
  always
    @(posedge clk) begin
      if (((&$signed($unsigned(reg104))) + wire98))
        begin
          reg108 <= ((+(8'hb8)) == (((wire89 > $signed((8'hbd))) <= $signed(wire97[(3'h5):(2'h2)])) ?
              $signed(wire98) : {reg103[(2'h3):(2'h2)],
                  ({wire91, wire90} || wire88[(1'h1):(1'h0)])}));
          if ((~|$unsigned(({$unsigned(wire98), wire99} ?
              ((reg94 ? wire98 : reg104) ?
                  (reg93 ? wire87 : (8'h9f)) : $unsigned(reg108)) : reg106))))
            begin
              reg109 <= (8'hbe);
              reg110 <= reg94;
            end
          else
            begin
              reg109 <= ((($unsigned((wire88 ?
                      wire98 : reg101)) >= ((~^wire89) ?
                      (wire89 ? wire96 : reg108) : (~^reg105))) ?
                  reg106 : $signed($signed($signed(wire97)))) ~^ ($unsigned((~^$unsigned(wire91))) ?
                  (8'haf) : ((&reg102[(4'hb):(1'h1)]) ?
                      (wire85[(2'h2):(1'h0)] ?
                          wire91 : (wire96 ? (8'hab) : reg93)) : wire85)));
              reg110 <= reg102;
            end
          reg111 <= (($unsigned((~|$unsigned(reg100))) ?
              wire97[(1'h0):(1'h0)] : (($unsigned(reg106) ?
                      (reg92 ? (8'hba) : reg92) : reg104) ?
                  $signed($signed(wire97)) : ({reg108, reg108} ?
                      $signed(reg105) : $signed(wire86)))) != $unsigned((wire98[(5'h11):(5'h10)] && $signed(wire96[(1'h0):(1'h0)]))));
          reg112 <= reg95[(3'h5):(2'h3)];
        end
      else
        begin
          reg108 <= (reg109 << {reg93});
        end
    end
endmodule

module module49
#(parameter param73 = (8'hab), 
parameter param74 = {(+param73), {(^{(param73 ^~ param73), (param73 < param73)}), {param73, (~&(param73 ? param73 : param73))}}})
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire54;
  input wire signed [(4'hb):(1'h0)] wire53;
  input wire [(3'h7):(1'h0)] wire52;
  input wire [(4'ha):(1'h0)] wire51;
  input wire [(4'hc):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
                 wire56,
                 wire55,
                 reg58,
                 (1'h0)};
  assign wire55 = (~wire52);
  assign wire56 = (wire50[(4'hb):(3'h6)] ?
                      (7'h41) : (~|($signed((wire54 >= wire54)) ?
                          wire51 : $unsigned(wire52))));
  assign wire57 = (~^{wire54});
  always
    @(posedge clk) begin
      reg58 <= wire55[(4'hd):(3'h6)];
    end
  assign wire59 = (~$unsigned($signed(((-(7'h43)) & (wire51 && wire54)))));
  assign wire60 = $unsigned($unsigned((wire52[(3'h4):(3'h4)] <= wire50)));
  assign wire61 = $unsigned(wire60);
  assign wire62 = wire56[(3'h4):(2'h2)];
  assign wire63 = (~&(reg58[(3'h6):(2'h3)] ?
                      (~&wire62) : ({$unsigned(wire55)} ?
                          wire53[(4'ha):(4'ha)] : ((wire59 ? wire53 : wire54) ?
                              wire53[(4'h8):(2'h3)] : wire62[(2'h3):(1'h0)]))));
  assign wire64 = (~&(~^$unsigned({(reg58 ? wire59 : wire63),
                      reg58[(1'h0):(1'h0)]})));
  assign wire65 = (+wire50);
  assign wire66 = $signed(wire59[(4'h8):(3'h5)]);
  assign wire67 = ((($unsigned($unsigned(wire53)) && wire52) ?
                      $signed(wire65[(3'h4):(2'h2)]) : (|$signed(wire63[(1'h0):(1'h0)]))) & {wire55,
                      (-(^~(wire63 != (8'hbf))))});
  assign wire68 = (wire64 >>> wire51);
  assign wire69 = wire55;
  assign wire70 = $signed(wire64);
  assign wire71 = (($unsigned($unsigned((wire54 || reg58))) - (wire59 >> wire57)) ?
                      (!wire59) : (($signed((+reg58)) ?
                              (-(|wire67)) : {(wire54 && wire62)}) ?
                          $unsigned(wire55) : {((wire57 ?
                                  (7'h40) : (8'hbd)) ^~ (wire50 ?
                                  wire55 : (8'hbf))),
                              wire51}));
  assign wire72 = $signed($unsigned(wire67[(4'hb):(4'ha)]));
endmodule

module module27
#(parameter param37 = ((({((8'hbd) ? (8'hb6) : (8'hac))} ? (^((8'hb9) ? (8'ha9) : (8'hb5))) : (~^(8'hb7))) + {{(+(8'hbf))}}) * (~|(8'haf))), 
parameter param38 = (^(param37 ? (({param37, (8'ha8)} ? (param37 ? param37 : param37) : (param37 + param37)) ? (~param37) : (|(param37 ? param37 : (8'h9e)))) : ((~{(8'hac)}) ? (param37 >= ((8'hb7) <= param37)) : param37))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire32;
  input wire [(5'h12):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire [(3'h6):(1'h0)] wire29;
  input wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  assign y = {wire36, wire35, wire34, wire33, (1'h0)};
  assign wire33 = wire29;
  assign wire34 = $signed(wire30[(1'h1):(1'h0)]);
  assign wire35 = ($signed(((wire29 ?
                          (^wire31) : wire34[(4'hc):(4'h8)]) << $unsigned((wire30 ?
                          wire29 : wire33)))) ?
                      {wire32[(3'h6):(3'h4)]} : (~^(wire29[(3'h4):(3'h4)] == (((8'hbd) ^ wire30) ?
                          $signed(wire34) : {wire31}))));
  assign wire36 = ((^~$signed((wire33 + {wire29, wire29}))) ?
                      (|{($signed((8'hbe)) ?
                              (wire35 ?
                                  wire28 : wire29) : $unsigned(wire35))}) : wire32[(4'h9):(1'h0)]);
endmodule

module module190
#(parameter param220 = ((&({((8'ha4) ? (8'haf) : (7'h42)), ((7'h44) ? (8'h9c) : (8'ha2))} ? (((7'h40) ? (8'hae) : (8'haa)) ? ((8'h9f) >>> (8'hb7)) : ((8'h9e) ? (8'hb4) : (8'hb0))) : {{(8'hae)}})) ? (!({((8'hbe) + (8'hb2)), {(8'ha7), (8'ha8)}} ^~ (((8'hb8) - (8'hb8)) ? ((8'hb3) ? (7'h43) : (8'ha3)) : ((8'had) ^~ (8'ha9))))) : (^~{{((7'h44) ? (7'h43) : (8'h9c)), ((8'h9e) << (8'ha5))}, (~^((8'haa) ? (8'h9f) : (8'hbe)))})))
(y, clk, wire195, wire194, wire193, wire192, wire191);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire195;
  input wire [(4'hc):(1'h0)] wire194;
  input wire signed [(5'h11):(1'h0)] wire193;
  input wire signed [(5'h11):(1'h0)] wire192;
  input wire [(5'h13):(1'h0)] wire191;
  wire [(4'hf):(1'h0)] wire219;
  wire [(3'h4):(1'h0)] wire218;
  wire signed [(2'h2):(1'h0)] wire217;
  wire [(5'h12):(1'h0)] wire216;
  wire signed [(3'h5):(1'h0)] wire215;
  wire signed [(4'h8):(1'h0)] wire214;
  wire signed [(5'h13):(1'h0)] wire213;
  wire signed [(2'h3):(1'h0)] wire212;
  wire [(4'h8):(1'h0)] wire211;
  wire signed [(5'h11):(1'h0)] wire210;
  wire signed [(4'hd):(1'h0)] wire209;
  wire [(5'h12):(1'h0)] wire208;
  wire signed [(3'h7):(1'h0)] wire207;
  wire signed [(3'h7):(1'h0)] wire203;
  wire [(5'h13):(1'h0)] wire202;
  wire signed [(4'hb):(1'h0)] wire201;
  wire [(4'hd):(1'h0)] wire200;
  wire signed [(3'h4):(1'h0)] wire199;
  wire signed [(5'h13):(1'h0)] wire198;
  wire signed [(4'he):(1'h0)] wire197;
  wire signed [(5'h14):(1'h0)] wire196;
  reg signed [(5'h11):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg204 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 reg206,
                 reg205,
                 reg204,
                 (1'h0)};
  assign wire196 = wire195;
  assign wire197 = (+{$signed(wire193), {(~^$signed(wire194))}});
  assign wire198 = {(!(|wire193))};
  assign wire199 = ((wire191[(4'h9):(1'h0)] * (wire197 | wire195[(2'h3):(1'h0)])) ?
                       {($unsigned(wire193[(3'h4):(1'h1)]) ?
                               wire196 : wire198)} : $signed(({(wire192 ?
                               wire193 : wire192)} >= $unsigned($unsigned(wire192)))));
  assign wire200 = wire197[(1'h1):(1'h0)];
  assign wire201 = (~((wire192[(4'hc):(3'h7)] ?
                       $signed(wire199[(2'h2):(1'h0)]) : $unsigned($signed(wire194))) <= (($signed(wire194) ^ $signed(wire196)) <= (wire194[(1'h0):(1'h0)] < $unsigned(wire192)))));
  assign wire202 = (~^($unsigned((wire201[(3'h5):(3'h5)] >>> (wire196 & wire196))) * wire199[(2'h3):(2'h2)]));
  assign wire203 = $signed((^~(|(~|((8'h9d) ? wire198 : wire195)))));
  always
    @(posedge clk) begin
      reg204 <= wire196[(4'hf):(4'hb)];
      reg205 <= (!$signed($unsigned(wire191[(4'h9):(3'h7)])));
      reg206 <= {$signed(($unsigned($signed(wire200)) << $unsigned(((8'h9e) ?
              (7'h42) : (8'ha4)))))};
    end
  assign wire207 = $unsigned($signed(wire194[(3'h4):(3'h4)]));
  assign wire208 = $signed(reg206);
  assign wire209 = wire191[(2'h2):(1'h1)];
  assign wire210 = (({$signed(wire200), (^~(^wire200))} != wire195) ?
                       {$signed($signed(reg206))} : ((^(-(reg204 == wire195))) ?
                           wire202[(4'hc):(1'h0)] : $signed($signed($unsigned(wire198)))));
  assign wire211 = ((($signed((wire200 == wire199)) == ((^~reg206) ?
                       (~&wire199) : $signed(wire207))) || wire199) | (wire199 ?
                       wire203[(2'h3):(1'h1)] : (wire191 ~^ $unsigned($unsigned(wire202)))));
  assign wire212 = ($signed(((^(~&wire208)) ?
                           $signed((7'h42)) : wire203[(3'h4):(1'h0)])) ?
                       (~&$signed(wire208[(1'h1):(1'h1)])) : ($unsigned(reg206) ^ {$signed($unsigned(reg204))}));
  assign wire213 = {(^~wire207[(1'h1):(1'h0)]),
                       $unsigned($unsigned($signed(wire195[(4'h8):(3'h6)])))};
  assign wire214 = ($unsigned(reg204) ?
                       (reg204[(3'h7):(3'h5)] + (wire194 + wire213)) : wire213);
  assign wire215 = ({$unsigned($unsigned(wire208[(3'h5):(3'h4)])),
                       (($signed(wire199) ? wire191 : $signed(wire207)) ?
                           ((wire214 ? (8'h9d) : wire207) ?
                               $signed(reg206) : ((8'hbb) != (7'h40))) : $unsigned((^~wire191)))} < {(!wire203[(2'h2):(1'h0)]),
                       (|{((8'haf) ? (8'hbe) : reg204)})});
  assign wire216 = (^~(wire193 ?
                       ($unsigned($signed((8'h9f))) <= (8'hb9)) : wire215[(1'h1):(1'h0)]));
  assign wire217 = $signed($unsigned(wire192));
  assign wire218 = ((($signed((wire197 > wire197)) ?
                               ((!wire212) >>> $signed(wire202)) : wire209) ?
                           (~&$signed({(8'h9d),
                               wire209})) : wire202[(2'h3):(2'h2)]) ?
                       wire214 : ((^wire208[(5'h11):(4'hc)]) ^~ $signed(($unsigned(wire191) ?
                           $signed(wire211) : (reg206 >= wire209)))));
  assign wire219 = $signed(wire215);
endmodule

module module128
#(parameter param169 = (~|(~|(((^~(8'hb2)) || ((8'hb0) < (8'hb7))) + (~^((8'hb7) ? (8'hbb) : (8'haf)))))), 
parameter param170 = (((^((param169 ^ param169) ? (-param169) : (~^param169))) == (param169 * (~&param169))) ? (8'hb3) : ((+param169) ~^ ({param169, ((8'hae) >= (8'hb0))} ? ({param169, param169} < (^~param169)) : ({param169, param169} <= (~param169))))))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire133;
  input wire signed [(4'hf):(1'h0)] wire132;
  input wire [(5'h12):(1'h0)] wire131;
  input wire [(3'h7):(1'h0)] wire130;
  input wire signed [(5'h10):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire162;
  wire signed [(3'h7):(1'h0)] wire148;
  wire signed [(5'h13):(1'h0)] wire147;
  wire [(5'h13):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(3'h6):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  reg signed [(3'h6):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg165 = (1'h0);
  reg [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(3'h6):(1'h0)] reg161 = (1'h0);
  reg [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  assign y = {wire168,
                 wire162,
                 wire148,
                 wire147,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
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
                 reg151,
                 reg150,
                 reg149,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire134 = ((wire131[(3'h7):(3'h6)] ?
                           (((|wire131) - $signed((8'ha4))) ^~ $unsigned(wire132[(4'hf):(4'hc)])) : (|(^~wire133))) ?
                       wire131 : wire131);
  assign wire135 = $unsigned(($signed(wire132[(3'h6):(3'h4)]) ?
                       (&$signed((-wire133))) : ((!$signed(wire133)) ?
                           (wire133[(3'h5):(3'h4)] ?
                               $unsigned((8'hbf)) : wire134[(3'h4):(2'h2)]) : wire132)));
  assign wire136 = $signed((|wire131));
  assign wire137 = (&$signed(wire134));
  assign wire138 = wire133[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg139 <= (8'ha6);
      if ((wire138 ? reg139 : ((8'ha0) == $signed(wire136))))
        begin
          reg140 <= $signed($signed(((~|wire129) ?
              $unsigned($signed(wire131)) : $unsigned((&wire137)))));
          reg141 <= reg139;
          reg142 <= reg139;
          reg143 <= {$signed(((~|{(8'hbd), reg140}) ?
                  {wire136[(1'h1):(1'h0)]} : $unsigned(wire133[(2'h2):(2'h2)]))),
              ($signed(((wire138 ? wire130 : wire130) ?
                  {wire136, reg141} : {wire132,
                      (8'hb2)})) | (&(+wire134[(1'h1):(1'h1)])))};
          reg144 <= reg143[(2'h3):(2'h2)];
        end
      else
        begin
          reg140 <= reg143;
        end
      reg145 <= wire137;
      reg146 <= (+(-$signed(wire131)));
    end
  assign wire147 = $signed(reg143[(2'h3):(1'h1)]);
  assign wire148 = ($signed($unsigned(($signed(reg142) ?
                           {wire132, wire131} : (8'hb1)))) ?
                       (&(~|($signed(reg143) ?
                           ((8'h9d) <= wire129) : {wire132}))) : $unsigned(wire129[(4'hf):(2'h2)]));
  always
    @(posedge clk) begin
      reg149 <= (wire137[(2'h2):(1'h0)] != ((8'ha4) ?
          $unsigned(((reg139 ? (8'hb9) : reg140) ?
              (reg142 ^ (8'hbc)) : (~&wire136))) : {$unsigned((wire133 & wire148)),
              $signed((wire148 << wire135))}));
      reg150 <= (($signed(((wire135 == wire138) ?
                  wire136 : reg149[(3'h4):(1'h1)])) ?
              reg146[(3'h4):(1'h1)] : {(~|$unsigned(reg143))}) ?
          wire130 : $signed(({(~|wire130),
              (reg144 ? wire130 : wire133)} >= $signed((reg146 >> reg142)))));
      if ((-(reg145[(3'h4):(2'h3)] ? (~|reg139[(2'h2):(1'h1)]) : reg150)))
        begin
          if ({reg140})
            begin
              reg151 <= ((wire134 ?
                      $unsigned($signed({wire132})) : $signed(((-reg139) ?
                          (^~wire130) : {wire138}))) ?
                  wire136[(1'h0):(1'h0)] : reg143);
            end
          else
            begin
              reg151 <= wire135[(4'ha):(4'ha)];
              reg152 <= wire137[(3'h7):(2'h2)];
              reg153 <= (~&reg142);
            end
          reg154 <= ((|(+(-reg140))) || reg141);
          reg155 <= $unsigned((+($unsigned((~^reg152)) ?
              (&wire131[(3'h5):(1'h0)]) : ($signed((8'hbb)) ?
                  $unsigned(wire134) : (wire133 ? reg154 : wire147)))));
          if ((8'ha4))
            begin
              reg156 <= (!wire137);
              reg157 <= reg145;
              reg158 <= {(wire129[(1'h1):(1'h0)] ?
                      ({$signed(reg153), wire131} ?
                          ($signed(reg139) <<< $signed(wire133)) : $signed($unsigned(reg144))) : (&$unsigned((!wire132)))),
                  (~&{wire132[(4'hf):(4'h8)]})};
              reg159 <= (~&(($signed($unsigned(wire130)) >> reg156) & reg152));
              reg160 <= ($signed({wire148}) ?
                  $signed(reg142[(4'hd):(4'h9)]) : reg146);
            end
          else
            begin
              reg156 <= wire129;
              reg157 <= (8'ha7);
              reg158 <= (wire133[(2'h3):(1'h1)] ?
                  (reg157[(1'h1):(1'h1)] || $unsigned(((reg153 >>> reg157) | (reg158 || (8'h9e))))) : reg146[(3'h5):(3'h4)]);
              reg159 <= (~$signed((({reg145} ?
                  $unsigned(reg160) : (wire131 ?
                      reg152 : wire130)) < reg143[(1'h0):(1'h0)])));
              reg160 <= wire137;
            end
          reg161 <= wire134;
        end
      else
        begin
          reg151 <= (reg156 ?
              ({reg152[(3'h5):(2'h3)], (~|wire130[(1'h1):(1'h0)])} ?
                  reg150[(3'h7):(3'h5)] : reg157[(3'h5):(1'h1)]) : $signed({reg158[(2'h2):(1'h1)]}));
          if ($signed(reg145[(2'h3):(2'h3)]))
            begin
              reg152 <= ((reg153[(3'h7):(1'h0)] < (~^reg139[(2'h2):(1'h0)])) ?
                  $unsigned(((^(reg151 & reg142)) ?
                      reg154 : wire136)) : (reg146[(5'h10):(4'ha)] && (($signed((7'h43)) ?
                          (7'h42) : wire133) ?
                      (+$signed(reg152)) : ({reg154} ?
                          {reg160, (8'hb1)} : $unsigned(wire136)))));
              reg153 <= (wire133[(3'h7):(3'h5)] ?
                  $signed(reg159[(3'h5):(3'h5)]) : ({{wire130[(2'h2):(2'h2)],
                              (wire147 ? wire129 : reg139)},
                          ($unsigned(reg155) != (reg157 >> reg156))} ?
                      $unsigned((8'hb0)) : (($signed(reg144) & (wire147 ?
                              reg157 : reg146)) ?
                          $signed(wire131[(3'h6):(2'h3)]) : reg139[(5'h13):(4'ha)])));
              reg154 <= $unsigned(((|wire147[(5'h13):(3'h5)]) ?
                  $unsigned(reg151) : (({(8'hb7)} ?
                      (wire130 ? reg143 : wire129) : (reg143 ?
                          reg143 : reg146)) <<< wire138)));
              reg155 <= ((wire130 <= (({wire129, wire133} ?
                      (&reg154) : wire132[(1'h0):(1'h0)]) >>> (reg158[(1'h0):(1'h0)] == $unsigned(reg144)))) ?
                  $unsigned((~|$signed($unsigned(reg154)))) : ($unsigned(reg141) ^ wire148));
              reg156 <= (|reg145);
            end
          else
            begin
              reg152 <= $signed($signed((~^{(-reg153), $unsigned(reg157)})));
            end
          reg157 <= reg152;
          reg158 <= wire137;
        end
    end
  assign wire162 = $signed(((reg153 ~^ $unsigned((reg151 ?
                       wire131 : reg154))) != ({(^reg144), $unsigned(wire148)} ?
                       ((reg156 ?
                           reg139 : wire129) + (|reg151)) : (~|reg144))));
  always
    @(posedge clk) begin
      if ((&wire137[(1'h1):(1'h0)]))
        begin
          reg163 <= $unsigned(wire131);
          reg164 <= (7'h42);
        end
      else
        begin
          reg163 <= reg159;
          reg164 <= ($signed({((reg149 - reg142) ?
                  (~^wire134) : $signed(reg143)),
              reg143[(4'h9):(3'h5)]}) & (((~&wire138[(1'h0):(1'h0)]) ?
              reg152[(3'h6):(3'h6)] : (~$unsigned(reg157))) | $unsigned((reg161[(1'h1):(1'h0)] > $unsigned((8'hbb))))));
          reg165 <= reg154;
          reg166 <= ((~reg164[(2'h2):(2'h2)]) ?
              ((~&wire130) ?
                  (((wire134 ^ wire135) <= reg145) ?
                      (^~reg145[(1'h1):(1'h1)]) : {(reg161 ?
                              reg143 : wire162)}) : (8'ha4)) : $unsigned(((reg149 ?
                      (reg158 == (8'h9e)) : reg164) ?
                  reg149[(1'h1):(1'h1)] : reg146[(4'hf):(4'hd)])));
          reg167 <= $signed((^((reg151 ? $signed(reg161) : $signed((8'ha6))) ?
              $unsigned(reg140[(2'h2):(1'h1)]) : ($signed(reg163) ?
                  (~reg140) : {reg156}))));
        end
    end
  assign wire168 = ({reg151} ? reg165 : (|wire134[(3'h5):(3'h4)]));
endmodule
