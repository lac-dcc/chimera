module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire158;
  wire signed [(2'h3):(1'h0)] wire157;
  wire signed [(4'ha):(1'h0)] wire156;
  wire signed [(5'h10):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire153;
  wire signed [(4'ha):(1'h0)] wire152;
  wire [(4'h8):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire150;
  wire signed [(2'h3):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire148;
  wire signed [(3'h5):(1'h0)] wire147;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire145;
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire5,
                 wire20,
                 wire22,
                 wire145,
                 (1'h0)};
  assign wire5 = wire3[(1'h1):(1'h1)];
  module6 #() modinst21 (wire20, clk, wire5, wire0, wire3, wire1);
  assign wire22 = ({$signed(($unsigned(wire2) > wire2))} && $signed(($unsigned($signed(wire5)) & $signed((wire2 && (8'ha8))))));
  module23 #() modinst146 (.wire27(wire20), .wire25(wire5), .clk(clk), .y(wire145), .wire24(wire1), .wire28(wire22), .wire26(wire4));
  assign wire147 = (^wire5);
  assign wire148 = ($signed((wire5 ?
                           $unsigned((~(8'hae))) : $unsigned((~&wire2)))) ?
                       (8'had) : {$unsigned((~^$unsigned(wire2)))});
  assign wire149 = (wire3[(4'hc):(3'h6)] ~^ (~^$unsigned({wire22[(3'h5):(2'h3)],
                       (wire2 ? wire20 : wire145)})));
  assign wire150 = wire2;
  assign wire151 = wire20[(4'hb):(2'h3)];
  assign wire152 = (~^($signed($unsigned($unsigned(wire150))) ^~ $unsigned((8'ha5))));
  assign wire153 = (($signed(wire148) && $signed(wire5[(4'hd):(4'hb)])) ?
                       (wire145[(4'hc):(3'h4)] || ((wire148[(3'h4):(3'h4)] ?
                               (&wire148) : (wire150 & wire5)) ?
                           wire152 : ((wire0 ?
                               wire5 : wire148) * wire150[(4'h8):(4'h8)]))) : (^$unsigned((-$signed((8'ha4))))));
  assign wire154 = $unsigned((wire0 < $unsigned(wire22)));
  assign wire155 = ((wire149 && (+$unsigned(wire4))) - wire147[(1'h0):(1'h0)]);
  assign wire156 = ((wire149 ?
                           wire151[(2'h3):(2'h2)] : {$unsigned(wire148),
                               wire153}) ?
                       ((({(7'h42)} >= $signed(wire152)) == (wire20 < $signed(wire3))) <= ($unsigned($signed(wire147)) - {wire2,
                           wire20})) : $signed((8'hba)));
  assign wire157 = wire0[(3'h5):(1'h1)];
  assign wire158 = wire3;
endmodule

module module23
#(parameter param144 = ((~^(((-(8'ha5)) ? ((8'ha8) ? (7'h40) : (8'hb8)) : (7'h40)) ~^ (8'hb6))) << {((~&((7'h40) & (8'hbc))) <<< {(+(8'ha8))})}))
(y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire138;
  wire signed [(4'ha):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire96;
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  assign y = {wire140,
                 wire138,
                 wire104,
                 wire99,
                 wire98,
                 wire46,
                 wire48,
                 wire49,
                 wire57,
                 wire96,
                 reg143,
                 reg142,
                 reg141,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 (1'h0)};
  module29 #() modinst47 (wire46, clk, wire25, wire27, wire24, wire28);
  assign wire48 = $unsigned($signed(($unsigned((8'hbe)) ?
                      $signed((8'had)) : $unsigned(((7'h40) << wire27)))));
  assign wire49 = (!$signed((wire46[(4'h8):(2'h2)] ?
                      $signed(wire28) : ($signed(wire28) ?
                          wire26 : $signed(wire27)))));
  always
    @(posedge clk) begin
      reg50 <= (|(wire25[(2'h2):(2'h2)] ?
          ($signed($signed(wire26)) * (^~$unsigned(wire28))) : (wire28 ?
              (&$signed(wire24)) : $signed(wire25))));
      reg51 <= ((~|$signed(wire28)) ?
          $unsigned($unsigned(((wire25 ? wire49 : wire24) << {wire27,
              wire25}))) : wire24);
      if ((+{$unsigned({(wire24 != wire27), (wire26 <<< wire48)})}))
        begin
          reg52 <= $unsigned((~&((wire24 ? $unsigned(wire49) : (-wire28)) ?
              (~^$unsigned(wire49)) : ($signed(wire49) <= $unsigned(wire49)))));
          if ((+(8'haf)))
            begin
              reg53 <= {$signed(wire49)};
              reg54 <= ((wire24 > $signed($signed($unsigned(wire25)))) ?
                  $signed((&reg52)) : (($signed($unsigned(wire27)) ?
                      (7'h44) : reg52[(1'h0):(1'h0)]) & {(wire48 | (reg53 * reg51)),
                      (reg50[(4'ha):(4'h9)] | (~&wire27))}));
              reg55 <= (wire26[(4'h8):(1'h1)] ?
                  wire49[(4'hd):(2'h2)] : ((~^((~&reg51) | {(8'hbc)})) ?
                      (((8'haf) + wire25[(3'h4):(3'h4)]) <<< {(~reg54),
                          $unsigned((7'h42))}) : $signed((-{wire26}))));
              reg56 <= (-(($signed($signed(wire28)) - reg53) ?
                  (((reg51 ? reg52 : reg51) ? wire24 : $signed(reg52)) ?
                      reg51[(1'h1):(1'h1)] : $unsigned($unsigned(reg55))) : (({(8'hb8),
                          wire25} ?
                      $unsigned((8'ha4)) : (reg55 ?
                          wire49 : wire26)) >>> $unsigned($unsigned(wire24)))));
            end
          else
            begin
              reg53 <= ($signed((~&($unsigned(reg50) ?
                  ((8'ha7) <= wire28) : $signed(wire28)))) * {$unsigned(reg54)});
            end
        end
      else
        begin
          reg52 <= (((reg50[(2'h3):(2'h3)] ~^ (wire24[(3'h7):(1'h0)] * (wire46 == reg54))) != wire46) ?
              ($signed({$unsigned(wire46), (wire27 >= reg56)}) ?
                  wire27 : (~|(-{wire28}))) : (^wire27[(1'h0):(1'h0)]));
          reg53 <= wire28[(4'h8):(1'h0)];
        end
    end
  assign wire57 = (~wire28[(3'h4):(3'h4)]);
  module58 #() modinst97 (.wire63(reg53), .clk(clk), .wire60(reg54), .wire61(reg51), .wire62(reg50), .y(wire96), .wire59(wire28));
  assign wire98 = $unsigned((reg52[(1'h1):(1'h1)] | ($signed((wire28 > wire49)) ?
                      reg55 : $unsigned({(8'ha1), (7'h41)}))));
  assign wire99 = (+(+wire98[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg100 <= wire98[(1'h0):(1'h0)];
      reg101 <= wire24[(2'h2):(1'h1)];
      reg102 <= $unsigned(reg50[(2'h3):(2'h3)]);
      reg103 <= $unsigned((8'ha3));
    end
  assign wire104 = $unsigned($unsigned(reg102[(1'h0):(1'h0)]));
  module105 #() modinst139 (wire138, clk, reg101, reg102, wire24, reg50, wire98);
  assign wire140 = $unsigned(wire27[(5'h12):(4'hd)]);
  always
    @(posedge clk) begin
      reg141 <= reg50;
    end
  always
    @(posedge clk) begin
      reg142 <= (8'hb0);
      reg143 <= (wire96 ?
          reg50[(3'h5):(3'h4)] : (reg55[(3'h6):(1'h1)] ?
              ((((8'ha9) ^~ wire49) != (~reg141)) ?
                  $signed(((7'h41) ? wire98 : reg100)) : {(+reg53),
                      wire140}) : reg52[(3'h7):(3'h5)]));
    end
endmodule

module module6
#(parameter param19 = (((-((+(8'ha1)) | ((8'hab) ^ (8'hbe)))) ~^ ((((8'hb9) < (8'hb4)) <= (~|(8'ha0))) ? ((~^(8'hbd)) ? {(8'hb8)} : ((8'haa) ? (8'hac) : (8'hb1))) : {((8'hb0) <<< (8'h9c))})) <<< (((|((8'hbc) <<< (8'haa))) ? (~((8'hb2) >> (8'ha2))) : {(~&(8'ha3))}) | ((7'h43) ? (~^{(7'h42), (8'ha3)}) : (((8'hb8) - (8'hb5)) ? {(8'hb0)} : ((8'hbe) ? (8'hb7) : (8'hba)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire11 = ($unsigned($signed((wire8[(4'hc):(4'h8)] ?
                          $signed((8'ha2)) : wire9[(3'h4):(2'h2)]))) ?
                      $unsigned($unsigned(((-wire8) != {wire7}))) : $unsigned($unsigned({wire8[(4'h8):(1'h1)],
                          $unsigned(wire9)})));
  assign wire12 = ((~|(^(|(wire9 ?
                      (8'ha4) : wire11)))) != (wire9 && {wire11[(4'hc):(4'hb)],
                      (wire8 ? {(8'haa)} : {(8'ha1), wire9})}));
  assign wire13 = $unsigned($signed($unsigned(wire11[(2'h2):(1'h1)])));
  assign wire14 = (wire7 ?
                      ($signed($signed((8'hb7))) ?
                          (($signed(wire13) ?
                                  (wire9 ? wire7 : wire10) : wire7) ?
                              wire10 : ((~^wire9) ?
                                  wire7 : ((7'h44) ?
                                      (8'ha7) : wire13))) : $unsigned({(wire11 != wire10)})) : (wire10 ^ ((wire9 * $signed(wire7)) == wire13)));
  assign wire15 = $unsigned(((wire12[(2'h2):(2'h2)] ?
                          (wire14[(4'hb):(3'h4)] ?
                              (~&wire12) : {wire7,
                                  wire7}) : wire13[(2'h2):(1'h0)]) ?
                      (-wire14[(3'h7):(2'h2)]) : wire12[(3'h5):(2'h2)]));
  always
    @(posedge clk) begin
      reg16 <= wire7[(2'h2):(1'h1)];
      reg17 <= $unsigned(wire10);
      reg18 <= $unsigned(((wire11[(4'h9):(3'h7)] ?
              wire8[(1'h1):(1'h1)] : wire13) ?
          ($unsigned($unsigned(wire14)) << wire15) : ((~^$unsigned(wire8)) ?
              wire15[(5'h11):(5'h10)] : $unsigned({wire9}))));
    end
endmodule

module module105
#(parameter param136 = (~^((7'h41) <<< ((8'ha7) ? (((8'hb4) * (8'haa)) ? (8'hb4) : ((8'ha0) ? (8'hb9) : (8'had))) : (((8'hb7) ? (8'hbc) : (8'ha0)) | (~|(8'hb7)))))), 
parameter param137 = ((-{{(param136 ? param136 : param136), (^param136)}}) & (~&({(param136 ? param136 : param136), (param136 ? param136 : param136)} ? (param136 ? param136 : (param136 >>> param136)) : {(param136 ? param136 : param136), param136}))))
(y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire110;
  input wire [(3'h4):(1'h0)] wire109;
  input wire signed [(5'h12):(1'h0)] wire108;
  input wire [(3'h4):(1'h0)] wire107;
  input wire [(3'h7):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(3'h6):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
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
                 (1'h0)};
  assign wire111 = $unsigned(wire106);
  assign wire112 = ((^~(wire110 + wire109[(3'h4):(2'h2)])) ^ wire109[(2'h3):(1'h0)]);
  assign wire113 = $signed($unsigned((|(((8'hb0) ?
                       wire107 : (8'ha9)) | wire108[(1'h1):(1'h0)]))));
  assign wire114 = wire106;
  assign wire115 = wire107;
  assign wire116 = wire113[(4'h8):(1'h1)];
  assign wire117 = (~&((+$signed({(8'hb0), wire108})) ?
                       (wire108 ?
                           $unsigned((~wire109)) : (~$signed(wire106))) : $unsigned(wire106[(3'h7):(3'h5)])));
  always
    @(posedge clk) begin
      reg118 <= (((wire112 & {(~^wire110),
              wire117[(2'h3):(1'h0)]}) ^~ {(^~(wire115 ? wire107 : wire106))}) ?
          (wire106[(1'h0):(1'h0)] || wire111[(1'h1):(1'h0)]) : (!wire109[(1'h0):(1'h0)]));
      if (((~|(((8'hb8) ?
          (wire113 ?
              wire113 : wire114) : {wire114}) != (~|(wire111 >>> wire108)))) & wire108))
        begin
          reg119 <= wire108;
          reg120 <= (+{$unsigned((|((8'h9d) << reg119))),
              $unsigned(((-wire109) ?
                  ((8'hbd) >= (8'haf)) : $unsigned(wire111)))});
          reg121 <= $unsigned(wire107[(2'h2):(1'h1)]);
          reg122 <= (reg119 | wire112[(2'h3):(2'h3)]);
        end
      else
        begin
          reg119 <= wire114;
          reg120 <= wire111[(1'h1):(1'h1)];
          reg121 <= $signed((wire112[(2'h3):(2'h3)] ?
              $unsigned({((8'hba) + wire113),
                  $signed((8'hba))}) : $unsigned(wire113[(4'h8):(4'h8)])));
          if ((wire112 ?
              ((8'hbb) ?
                  (8'ha6) : (wire114 ?
                      $unsigned((~|wire106)) : $signed(reg120))) : ({$unsigned(reg120),
                  $signed(reg122[(5'h13):(5'h12)])} <<< $signed(wire113[(3'h5):(3'h4)]))))
            begin
              reg122 <= (((!$signed($signed((8'hb8)))) == (wire110[(3'h5):(2'h2)] | (+(|reg120)))) || (~^$unsigned($signed(((8'hb7) << (8'hb8))))));
            end
          else
            begin
              reg122 <= (~|$signed((({wire115, wire117} >>> (reg122 ?
                      wire115 : wire111)) ?
                  wire117 : {wire114})));
              reg123 <= $signed($unsigned($unsigned({wire110,
                  (wire111 + (7'h44))})));
              reg124 <= $signed($signed($signed($unsigned($signed(reg118)))));
              reg125 <= $unsigned({$unsigned(wire110), wire113});
              reg126 <= ({(wire110[(1'h1):(1'h0)] <<< reg119[(3'h5):(2'h2)]),
                  $signed($unsigned($unsigned((8'h9c))))} <<< (&$unsigned($unsigned(wire114[(4'he):(3'h7)]))));
            end
          reg127 <= {reg125[(4'ha):(2'h3)]};
        end
      reg128 <= $signed($unsigned((-$signed($signed(wire109)))));
      if (wire117[(4'h8):(3'h5)])
        begin
          reg129 <= (!(~wire112));
        end
      else
        begin
          reg129 <= $signed((-{(&$signed(reg123))}));
        end
    end
  assign wire130 = {{($signed((reg128 && reg118)) + wire116[(2'h2):(2'h2)]),
                           {((!(8'ha1)) * (~(8'ha4)))}},
                       $signed(($unsigned((reg121 ?
                           (7'h42) : reg121)) ^ wire109))};
  assign wire131 = reg118;
  assign wire132 = reg125[(2'h3):(1'h0)];
  assign wire133 = (^$unsigned(($signed({reg129}) ?
                       $unsigned(reg128[(4'he):(1'h1)]) : (wire111 > (reg129 * wire106)))));
  assign wire134 = wire132[(4'h8):(2'h3)];
  assign wire135 = $signed(reg129[(4'h9):(3'h7)]);
endmodule

module module58
#(parameter param95 = ((~&((~|(8'ha0)) ? (((7'h41) | (7'h42)) && {(8'h9e), (8'hb2)}) : (((8'ha9) ? (8'ha2) : (8'ha9)) ? ((8'hb5) ^ (8'hba)) : ((8'ha6) ? (8'hb5) : (8'ha8))))) >> (((((8'hb7) > (8'hac)) & ((8'hb8) ? (8'hba) : (8'hae))) ? (((8'had) ? (8'hbd) : (8'hba)) ? ((8'hb4) ? (8'hbe) : (8'haf)) : ((8'ha1) < (8'h9d))) : (((8'hb5) ^ (8'ha1)) << {(7'h42), (8'haa)})) <<< {{((7'h43) ? (8'hbd) : (8'had))}, (((8'ha4) ? (8'hba) : (7'h40)) < ((8'hb0) | (8'hbd)))})))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire63;
  input wire [(2'h3):(1'h0)] wire62;
  input wire [(5'h14):(1'h0)] wire61;
  input wire signed [(2'h3):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire64 = {{(({(8'hbb)} ^~ (8'h9d)) ?
                              {(^~wire59),
                                  wire59[(3'h4):(2'h2)]} : (&wire60[(1'h0):(1'h0)])),
                          wire59},
                      $unsigned({$unsigned(((8'haf) >= wire61)),
                          (wire61[(1'h1):(1'h1)] ?
                              (wire59 & wire59) : $unsigned(wire60))})};
  assign wire65 = ($signed((-$signed((8'hb7)))) <= $unsigned({$signed($signed(wire59))}));
  assign wire66 = wire59;
  assign wire67 = wire65;
  assign wire68 = $unsigned((~&($signed((~^wire66)) ?
                      ($signed(wire67) & (wire60 > wire60)) : (~|wire66))));
  always
    @(posedge clk) begin
      reg69 <= $unsigned($unsigned($signed($unsigned(wire64))));
      reg70 <= (($unsigned(((~wire65) != $unsigned(wire61))) | (wire60 > wire64[(1'h1):(1'h0)])) ^~ {wire59,
          wire62[(1'h0):(1'h0)]});
    end
  always
    @(posedge clk) begin
      if (($signed(reg69[(2'h3):(2'h2)]) ?
          (~&$signed((|(~&wire66)))) : (^{($signed(wire65) >= $unsigned((8'hbe))),
              {wire62, {wire64, reg69}}})))
        begin
          reg71 <= {(-(&(~|{wire67})))};
          reg72 <= wire62;
          reg73 <= $unsigned(((^(8'hac)) ?
              {(reg72 ? $unsigned(reg69) : wire61),
                  ($signed(wire60) ^ (~|wire63))} : wire64[(2'h3):(2'h2)]));
        end
      else
        begin
          reg71 <= $signed((($unsigned((+(8'hba))) ^~ (~&reg73)) >> (wire68 ?
              $unsigned((!(8'hbb))) : $signed($unsigned((8'hb8))))));
          reg72 <= $unsigned(reg70);
          reg73 <= wire64;
          reg74 <= wire64[(3'h4):(2'h3)];
        end
      reg75 <= (((~((reg72 >>> wire64) ?
          $unsigned(reg73) : (wire61 || reg73))) != $unsigned($signed((8'haa)))) >> wire61[(1'h1):(1'h1)]);
      reg76 <= wire65[(3'h4):(2'h3)];
    end
  assign wire77 = $unsigned(($unsigned($unsigned((wire65 ? wire63 : reg70))) ?
                      wire68 : wire63));
  assign wire78 = $unsigned((8'haf));
  assign wire79 = (^wire63[(4'h8):(3'h4)]);
  assign wire80 = (&$unsigned(($signed((reg71 ? wire67 : wire77)) << (reg76 ?
                      wire62[(2'h2):(2'h2)] : wire61))));
  assign wire81 = $signed((^~$unsigned({$signed(wire63)})));
  always
    @(posedge clk) begin
      if (wire60)
        begin
          reg82 <= $unsigned((+(reg70[(1'h0):(1'h0)] ^ {$signed(wire59)})));
          reg83 <= $signed({$unsigned(wire79)});
          if ((8'hba))
            begin
              reg84 <= $unsigned((8'ha3));
            end
          else
            begin
              reg84 <= $unsigned((-$signed(wire79)));
              reg85 <= (reg74[(3'h4):(2'h2)] * wire64);
              reg86 <= $signed(reg72[(5'h10):(3'h5)]);
              reg87 <= (wire68[(4'hd):(4'hb)] <= $signed(wire64[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg82 <= reg87[(5'h10):(4'h9)];
          if ($unsigned(wire61))
            begin
              reg83 <= (-(((~^$unsigned(reg87)) ?
                      wire65[(1'h0):(1'h0)] : (^(~^reg87))) ?
                  reg83 : (((8'h9f) != $signed(wire65)) ?
                      $unsigned(wire80[(4'h8):(1'h0)]) : (~$signed(reg75)))));
              reg84 <= ({$unsigned(reg85)} ^ $signed(({$signed(reg83)} <= wire66[(1'h1):(1'h1)])));
              reg85 <= (reg73 ?
                  (^~(~&(~^wire61))) : $unsigned((!$unsigned((+(8'hb7))))));
              reg86 <= $unsigned(wire62);
            end
          else
            begin
              reg83 <= reg75[(4'ha):(2'h3)];
              reg84 <= {$unsigned($unsigned($unsigned((|(8'hb3)))))};
            end
          reg87 <= ({(~&(wire62[(2'h2):(1'h1)] & (reg70 - (8'hb1))))} <= wire77);
        end
      reg88 <= (($unsigned(($signed((8'hb5)) ?
          $signed(reg75) : $signed(reg87))) && (!{wire60[(1'h0):(1'h0)]})) || reg73[(4'he):(4'hd)]);
    end
  assign wire89 = (reg83 >>> $unsigned((8'hbf)));
  assign wire90 = wire68;
  assign wire91 = {wire78};
  assign wire92 = {{$unsigned(reg85[(3'h5):(1'h1)])}};
  assign wire93 = $unsigned($signed((|(((8'hb6) ?
                      wire91 : wire60) >> (!wire89)))));
  assign wire94 = (reg76[(4'hf):(4'hb)] * (8'hb0));
endmodule

module module29
#(parameter param45 = ((~{{((8'ha0) ? (8'h9d) : (8'ha4))}}) >= (((((7'h44) ? (8'ha1) : (7'h43)) && (~(8'hbf))) ? {((8'hb4) | (8'ha7))} : (((8'hac) & (8'hb4)) >>> (|(8'hb2)))) ^~ (8'ha5))))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire33;
  input wire [(5'h13):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire [(5'h11):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire34 = $unsigned({wire30});
  assign wire35 = (+(~((~&{(8'haa), (8'hbf)}) <= (wire31[(3'h6):(3'h6)] ?
                      (wire34 != wire33) : wire31))));
  assign wire36 = wire35[(4'ha):(1'h0)];
  assign wire37 = (^~$signed((~^wire35[(4'h9):(1'h1)])));
  always
    @(posedge clk) begin
      reg38 <= wire35[(3'h6):(1'h1)];
      reg39 <= (~(($unsigned(((8'hbc) ? wire31 : wire34)) ?
          {(wire34 | wire30)} : {(~&wire31)}) >= (wire30 >> ({wire32} + $unsigned(reg38)))));
      reg40 <= $signed((!$unsigned($unsigned(wire34[(4'ha):(1'h0)]))));
    end
  assign wire41 = (wire37[(5'h10):(1'h1)] == $signed((wire34 ?
                      $signed((~^reg38)) : $unsigned(wire31))));
  assign wire42 = wire33;
  assign wire43 = $unsigned((wire31 ^ wire31));
  assign wire44 = ($signed($unsigned({(wire37 ?
                          reg39 : wire37)})) & (+{$unsigned($signed(wire42)),
                      reg38}));
endmodule
