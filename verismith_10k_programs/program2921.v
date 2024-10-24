module top
#(parameter param225 = (((^~{((7'h42) << (8'ha8)), ((8'hbd) <<< (8'hac))}) ? (~((8'hae) ? ((8'hb7) ? (8'hbb) : (8'hb2)) : ((8'haf) ? (8'hb9) : (8'hbe)))) : (^~(|((8'hb7) ? (8'haa) : (8'h9f))))) ? {((8'hac) << (8'haf))} : (((((8'h9f) - (8'hb7)) <<< ((8'ha8) > (8'ha8))) ? {(~(7'h44))} : (~((8'hb5) - (8'hb4)))) ? {(-(|(7'h44))), (((7'h40) ? (8'hb6) : (8'hb6)) ? {(8'hbf), (8'ha7)} : ((8'hac) ? (8'ha9) : (8'hb9)))} : {(!(~&(8'hbb))), (((8'hac) ^ (8'haf)) ? {(8'hb3)} : (-(8'hb6)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire224;
  wire [(4'hb):(1'h0)] wire222;
  wire [(3'h7):(1'h0)] wire221;
  wire [(5'h14):(1'h0)] wire211;
  wire signed [(5'h12):(1'h0)] wire204;
  wire signed [(5'h14):(1'h0)] wire131;
  wire signed [(5'h10):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire206;
  wire signed [(4'hd):(1'h0)] wire207;
  wire [(5'h15):(1'h0)] wire208;
  wire [(5'h11):(1'h0)] wire209;
  wire [(5'h13):(1'h0)] wire213;
  wire signed [(5'h13):(1'h0)] wire215;
  wire signed [(4'hd):(1'h0)] wire216;
  wire signed [(4'hf):(1'h0)] wire218;
  wire [(4'hd):(1'h0)] wire219;
  reg signed [(5'h10):(1'h0)] reg223 = (1'h0);
  reg [(4'h8):(1'h0)] reg214 = (1'h0);
  assign y = {wire224,
                 wire222,
                 wire221,
                 wire211,
                 wire204,
                 wire131,
                 wire130,
                 wire128,
                 wire75,
                 wire74,
                 wire72,
                 wire5,
                 wire206,
                 wire207,
                 wire208,
                 wire209,
                 wire213,
                 wire215,
                 wire216,
                 wire218,
                 wire219,
                 reg223,
                 reg214,
                 (1'h0)};
  assign wire5 = {(8'ha1),
                     ((wire3[(4'ha):(3'h5)] < wire3) ^~ (((wire3 || wire4) ?
                             (~wire1) : $signed(wire3)) ?
                         ((wire3 >>> wire1) || $signed(wire4)) : {wire4}))};
  module6 #() modinst73 (.wire8(wire1), .wire10(wire5), .wire9(wire2), .clk(clk), .y(wire72), .wire7(wire4));
  assign wire74 = wire1[(2'h3):(1'h1)];
  assign wire75 = wire72[(5'h13):(3'h7)];
  module76 #() modinst129 (.y(wire128), .clk(clk), .wire78(wire5), .wire77(wire74), .wire79(wire72), .wire80(wire4));
  assign wire130 = ((wire2[(3'h7):(3'h5)] ?
                       wire4[(4'h8):(1'h1)] : {wire5}) << wire74);
  assign wire131 = (&(^~wire128[(2'h2):(2'h2)]));
  module132 #() modinst205 (.clk(clk), .wire133(wire130), .y(wire204), .wire136(wire1), .wire135(wire128), .wire137(wire131), .wire134(wire4));
  assign wire206 = wire128[(4'h9):(4'h8)];
  assign wire207 = wire75[(1'h0):(1'h0)];
  assign wire208 = (~|wire5);
  module14 #() modinst210 (wire209, clk, wire0, wire74, wire206, wire1, wire2);
  module132 #() modinst212 (wire211, clk, wire208, wire206, wire209, wire74, wire130);
  assign wire213 = wire0;
  always
    @(posedge clk) begin
      reg214 <= $signed(((&(!wire131)) >>> wire131));
    end
  assign wire215 = (&$signed(wire209));
  module76 #() modinst217 (wire216, clk, wire208, wire5, wire128, wire72);
  assign wire218 = ({((-(~^wire207)) ^~ wire74[(3'h6):(3'h4)]),
                       $signed(wire130)} ~^ $signed($unsigned(($signed(wire75) ?
                       wire207 : wire206))));
  module132 #() modinst220 (.wire134(wire206), .wire136(wire216), .wire137(wire211), .clk(clk), .wire135(wire215), .y(wire219), .wire133(wire0));
  assign wire221 = ((8'ha7) & $unsigned((wire204 ?
                       (((8'hbe) == wire74) >>> (wire130 << (8'hab))) : (~wire208[(4'h9):(3'h5)]))));
  assign wire222 = wire206[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg223 <= wire204[(1'h0):(1'h0)];
    end
  assign wire224 = wire4;
endmodule

module module132  (y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire137;
  input wire [(4'hd):(1'h0)] wire136;
  input wire signed [(4'ha):(1'h0)] wire135;
  input wire [(4'hc):(1'h0)] wire134;
  input wire signed [(3'h4):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire203;
  wire signed [(4'hf):(1'h0)] wire168;
  wire [(4'hc):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire171;
  wire signed [(4'h8):(1'h0)] wire172;
  wire [(4'hc):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire201;
  assign y = {wire203,
                 wire168,
                 wire138,
                 wire170,
                 wire171,
                 wire172,
                 wire173,
                 wire201,
                 (1'h0)};
  assign wire138 = $unsigned((wire135[(4'h8):(4'h8)] ?
                       ((~&$signed(wire136)) - $unsigned({wire134,
                           wire137})) : $signed({(wire136 | (8'ha8))})));
  module139 #() modinst169 (.wire142(wire136), .wire141(wire134), .wire140(wire138), .wire143(wire135), .y(wire168), .clk(clk), .wire144(wire137));
  assign wire170 = $unsigned($signed(wire138[(1'h0):(1'h0)]));
  assign wire171 = {wire138, $unsigned((8'hbd))};
  assign wire172 = $signed(wire135[(3'h5):(3'h5)]);
  assign wire173 = ($signed({({wire135} ?
                           wire138[(4'hc):(1'h1)] : ((8'h9d) ?
                               wire135 : wire135)),
                       wire137}) << wire138);
  module174 #() modinst202 (.y(wire201), .wire178(wire137), .wire179(wire170), .wire177(wire138), .wire176(wire168), .wire175(wire173), .clk(clk));
  assign wire203 = wire171;
endmodule

module module76  (y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h25d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire80;
  input wire signed [(4'hd):(1'h0)] wire79;
  input wire [(5'h15):(1'h0)] wire78;
  input wire [(4'he):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  assign y = {wire127,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
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
                 reg115,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 (1'h0)};
  assign wire81 = {{(+$signed(wire79[(3'h7):(3'h5)]))}};
  assign wire82 = (~((8'hbf) ?
                      (&((wire80 * (8'hb4)) ?
                          wire81 : wire78)) : $unsigned(wire80[(5'h15):(3'h5)])));
  assign wire83 = (wire81[(3'h6):(3'h4)] >= $signed({(~wire80),
                      ((wire80 << wire80) >= wire78[(5'h14):(4'h8)])}));
  assign wire84 = $unsigned((wire78[(4'hb):(4'ha)] || wire81));
  assign wire85 = $unsigned((8'hb9));
  always
    @(posedge clk) begin
      if (((^~(!(8'ha9))) || $signed(wire85)))
        begin
          reg86 <= (~|($unsigned({wire85}) > ((((8'hb1) ?
                  wire79 : wire78) & wire82[(3'h4):(2'h3)]) ?
              $unsigned(wire80[(3'h4):(1'h1)]) : wire79[(4'ha):(1'h1)])));
          reg87 <= (((^~{wire77[(1'h0):(1'h0)]}) - {$unsigned((|wire79))}) >> (+wire84));
          if (wire79)
            begin
              reg88 <= $unsigned((({$signed(wire81)} ?
                      ((wire79 ? wire79 : wire82) ?
                          (wire83 == wire80) : (wire79 * wire84)) : $unsigned(wire85)) ?
                  wire82 : $unsigned($signed(wire83))));
              reg89 <= (^wire82);
            end
          else
            begin
              reg88 <= ($unsigned((!wire82)) == ({wire81, wire84} ?
                  reg86[(4'he):(4'he)] : $signed(wire78[(1'h0):(1'h0)])));
              reg89 <= $unsigned($signed(reg87[(2'h3):(1'h0)]));
              reg90 <= (($signed((!(wire84 || wire81))) ?
                  ({wire83} ?
                      wire84[(2'h2):(2'h2)] : wire83) : {(+{wire84})}) == ((~&((reg89 ?
                      reg86 : wire82) > (-reg88))) ?
                  ($unsigned((reg88 ?
                      wire84 : wire85)) >= wire77) : wire79[(2'h2):(1'h0)]));
            end
          if ((wire81 ?
              ($signed($unsigned(((8'had) >= reg88))) ?
                  {wire80} : $unsigned(($signed((8'ha0)) ?
                      $signed(wire83) : wire79))) : (|wire83[(4'h9):(2'h2)])))
            begin
              reg91 <= wire83[(1'h0):(1'h0)];
            end
          else
            begin
              reg91 <= (+((~|{{(8'ha7)}}) | (reg91 ?
                  $unsigned({reg86, reg86}) : $unsigned((wire77 ?
                      reg91 : wire85)))));
            end
          reg92 <= $unsigned(wire79);
        end
      else
        begin
          if ($unsigned((reg92 + $unsigned((|(reg91 ? wire79 : wire78))))))
            begin
              reg86 <= {(reg90 >= reg89)};
            end
          else
            begin
              reg86 <= $signed(reg88[(3'h4):(1'h1)]);
              reg87 <= $signed($signed($signed((^{wire83, wire84}))));
              reg88 <= wire80[(2'h2):(1'h1)];
              reg89 <= $signed(reg90);
              reg90 <= (^$unsigned($signed(wire78[(5'h11):(1'h1)])));
            end
          if (reg92[(4'hb):(3'h7)])
            begin
              reg91 <= wire80;
              reg92 <= ($signed($unsigned($signed($unsigned((8'hba))))) >> $unsigned($signed(wire79[(4'h8):(1'h0)])));
              reg93 <= $signed((!$signed((((8'hbf) ? wire81 : wire82) ?
                  wire83[(2'h2):(2'h2)] : wire83[(4'h8):(4'h8)]))));
              reg94 <= $unsigned(($signed(reg89) ?
                  (|(~&reg91[(4'h9):(3'h7)])) : reg87));
              reg95 <= ($unsigned((~|$unsigned(reg94))) != $signed((($unsigned(wire77) ?
                  (&wire84) : $signed(reg87)) & $unsigned(wire85[(4'hd):(4'hb)]))));
            end
          else
            begin
              reg91 <= wire77;
              reg92 <= reg90;
            end
        end
      if (reg94)
        begin
          if ($unsigned({({wire85[(1'h1):(1'h1)]} >= $unsigned(wire81))}))
            begin
              reg96 <= (&reg90[(3'h6):(3'h6)]);
              reg97 <= ($unsigned({(+$unsigned(reg94))}) ?
                  (reg90 ?
                      wire79[(3'h7):(1'h0)] : reg96[(3'h6):(3'h6)]) : (wire78[(1'h1):(1'h0)] ?
                      $signed((^((8'hac) ?
                          wire80 : reg91))) : ($signed((reg92 >>> reg88)) ?
                          ((wire84 - wire79) ~^ wire82[(1'h0):(1'h0)]) : wire80[(5'h13):(1'h1)])));
              reg98 <= ($unsigned(wire82[(1'h1):(1'h0)]) ?
                  ((!$unsigned({reg89,
                      reg96})) > ($unsigned(reg91[(4'hd):(3'h5)]) ^~ (reg91[(4'he):(3'h6)] ?
                      {reg86} : (reg88 <= reg97)))) : wire77);
              reg99 <= {(~|(8'hbf)), reg86};
            end
          else
            begin
              reg96 <= wire80;
            end
          reg100 <= (+$unsigned($unsigned($signed($unsigned(reg96)))));
        end
      else
        begin
          if ($signed({wire79[(1'h1):(1'h0)]}))
            begin
              reg96 <= (($unsigned((reg90[(4'ha):(3'h5)] && (~|reg100))) != (wire85[(5'h10):(1'h1)] ?
                      (8'hb6) : $unsigned(reg98[(4'ha):(1'h1)]))) ?
                  $signed($unsigned(($signed(reg89) & $unsigned((8'hb6))))) : $signed(wire84[(2'h2):(2'h2)]));
              reg97 <= (wire79 ?
                  (|($signed((wire79 ^~ reg100)) ^ (~$signed(reg91)))) : reg90);
              reg98 <= {(8'hbb), wire84[(1'h0):(1'h0)]};
            end
          else
            begin
              reg96 <= reg93[(3'h6):(3'h6)];
            end
          reg99 <= $unsigned(reg94[(1'h1):(1'h0)]);
          if ((reg86[(3'h7):(3'h6)] == (~|$unsigned($unsigned($signed(reg90))))))
            begin
              reg100 <= $unsigned((reg93 ?
                  reg92[(4'hd):(1'h1)] : $signed(((reg88 | wire82) && (wire84 | reg99)))));
              reg101 <= $signed(wire81);
              reg102 <= ((~&(^~(^~(~reg89)))) > (8'h9c));
              reg103 <= (reg88[(2'h3):(2'h3)] <<< reg88);
              reg104 <= ($unsigned($unsigned($signed(((8'ha5) ?
                      reg88 : reg94)))) ?
                  (^~(~|reg94)) : ($unsigned(($unsigned(wire78) <<< (reg96 ?
                      (8'ha1) : wire84))) >>> (~&wire84[(2'h2):(2'h2)])));
            end
          else
            begin
              reg100 <= reg87;
              reg101 <= (reg88 ?
                  ($signed($signed(((8'hae) ?
                      reg95 : reg93))) > wire77[(2'h3):(2'h2)]) : wire81);
              reg102 <= (wire80 ?
                  (^(|(-reg94))) : ($signed({(7'h44)}) ?
                      $signed($signed((reg101 && reg96))) : (8'hbc)));
            end
          reg105 <= $signed((&reg88[(3'h5):(2'h2)]));
          if ({$signed((reg92 ? reg89[(3'h5):(3'h4)] : reg99))})
            begin
              reg106 <= ($signed(wire85) ?
                  ((wire84 && reg90) > $unsigned(((wire81 << wire77) ?
                      (reg103 ?
                          reg96 : wire81) : reg94))) : reg88[(3'h4):(1'h0)]);
              reg107 <= (!$unsigned((8'had)));
              reg108 <= (($signed(((8'h9c) ? reg93 : wire82)) ?
                  (~|(~&(reg91 > reg86))) : reg102[(2'h2):(1'h1)]) + reg86);
              reg109 <= $signed((~&(reg102 + $signed($unsigned((8'ha3))))));
              reg110 <= ((~^reg106[(3'h7):(3'h7)]) ?
                  reg96[(4'h8):(1'h0)] : $unsigned({reg90[(3'h4):(1'h0)],
                      $unsigned(reg97[(3'h6):(3'h5)])}));
            end
          else
            begin
              reg106 <= $unsigned((((+(reg104 < reg97)) * $unsigned((|wire82))) <<< $unsigned({reg106[(4'he):(3'h4)],
                  {(8'hbc), reg99}})));
              reg107 <= (&(|{$unsigned($unsigned(reg92)), {{reg103, reg90}}}));
              reg108 <= (reg88[(3'h4):(2'h2)] != ($unsigned($unsigned((+reg96))) ?
                  reg97[(1'h1):(1'h0)] : reg95));
              reg109 <= ($unsigned(reg92[(5'h10):(3'h6)]) ?
                  wire80[(4'hb):(3'h5)] : ($unsigned($signed({reg104,
                          wire82})) ?
                      (+({reg98, reg91} && (8'hb6))) : wire81));
            end
        end
      if ((&(8'had)))
        begin
          reg111 <= reg102;
          reg112 <= $signed($signed(reg109));
          if ((8'ha4))
            begin
              reg113 <= wire82;
            end
          else
            begin
              reg113 <= (wire80 ?
                  (8'ha6) : (reg94[(1'h1):(1'h0)] != reg103[(4'h8):(3'h4)]));
              reg114 <= $unsigned((reg94 & reg109));
              reg115 <= (-$unsigned(($unsigned(wire84[(1'h0):(1'h0)]) >= (8'ha3))));
              reg116 <= reg93;
              reg117 <= $signed(reg98[(3'h7):(3'h6)]);
            end
          if (reg114)
            begin
              reg118 <= reg102;
              reg119 <= (&wire78[(5'h14):(4'hd)]);
              reg120 <= $signed((~|{reg102}));
              reg121 <= ((-((|(+reg114)) < wire83)) - $signed((($signed(reg86) ?
                      {wire83, reg90} : (reg89 <= (8'hbb))) ?
                  ((|reg95) ?
                      $unsigned(reg115) : (reg88 ?
                          reg101 : reg114)) : ((reg109 ? reg86 : reg104) ?
                      (~&wire81) : (~(8'h9c))))));
            end
          else
            begin
              reg118 <= (8'hab);
              reg119 <= $unsigned(reg103[(3'h5):(3'h5)]);
              reg120 <= ({$unsigned((8'h9d)),
                  (~&reg115[(4'he):(1'h0)])} < (reg86[(2'h2):(1'h0)] ^ (~&wire85[(1'h0):(1'h0)])));
              reg121 <= (~^($unsigned(wire81[(1'h0):(1'h0)]) ?
                  (reg101 >= reg98) : reg101[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          if ($unsigned($signed($signed($unsigned(reg119)))))
            begin
              reg111 <= reg105[(5'h10):(4'ha)];
              reg112 <= (^$unsigned($unsigned(($unsigned(reg96) != (wire85 < reg89)))));
              reg113 <= (^~(~^(^(^(+wire78)))));
              reg114 <= (^((reg95[(3'h4):(2'h3)] ?
                  $unsigned({reg89}) : reg90[(4'hb):(1'h1)]) > (+(+$unsigned(wire85)))));
              reg115 <= ($signed($signed(((reg92 ? reg95 : wire84) && (reg105 ?
                      (8'hab) : (8'ha9))))) ?
                  reg111[(2'h3):(2'h3)] : ($unsigned(reg87[(4'ha):(3'h7)]) ?
                      (&((wire77 & reg106) ?
                          reg90 : $signed((8'hb6)))) : $signed($signed((reg91 ?
                          reg109 : wire80)))));
            end
          else
            begin
              reg111 <= (reg109 ?
                  {$unsigned(reg99)} : ($unsigned(wire78) ?
                      ((!(~|reg118)) ^ $unsigned(wire79)) : ((reg110[(1'h0):(1'h0)] ~^ {reg99,
                          reg118}) <<< reg114)));
              reg112 <= $signed({($unsigned((reg119 >>> reg107)) ?
                      $signed((~^reg103)) : (8'hba))});
              reg113 <= ((~|(~&((&reg89) != {(8'hb4)}))) * $signed(wire85));
              reg114 <= $unsigned((!$signed((reg108 ?
                  reg95[(4'h9):(3'h6)] : (~reg118)))));
            end
          if (reg101[(2'h2):(1'h1)])
            begin
              reg116 <= (~reg104[(3'h5):(3'h5)]);
              reg117 <= $signed((reg89 & (wire80 ?
                  ((reg91 || reg112) ~^ (wire80 << wire79)) : (~^((8'hb7) ?
                      reg109 : reg104)))));
              reg118 <= (($signed(((wire77 | reg121) ?
                      $signed(reg97) : reg121[(3'h5):(3'h4)])) ?
                  $signed((wire82 != reg102[(4'h9):(3'h7)])) : $unsigned(({(8'ha0)} ~^ {reg103}))) & reg120[(4'hb):(4'hb)]);
              reg119 <= $unsigned($signed(wire85));
            end
          else
            begin
              reg116 <= reg89;
              reg117 <= (reg99 < $unsigned(reg88));
            end
        end
      if ({(((~^((8'hab) ^ (8'h9c))) - $unsigned(wire83[(1'h0):(1'h0)])) ?
              reg121 : $signed($unsigned($signed(reg86))))})
        begin
          reg122 <= (wire77 <<< $unsigned((reg114 != reg90[(4'he):(3'h5)])));
          reg123 <= reg106;
        end
      else
        begin
          reg122 <= (~&$signed(reg122));
          if (reg119)
            begin
              reg123 <= reg101;
              reg124 <= (((~|((~reg117) ^ $unsigned(reg105))) ?
                      (({reg96, reg88} == (reg90 ^ reg87)) <= (wire77 ?
                          (reg100 <<< reg89) : (reg112 ^ reg103))) : ((^(+reg99)) ?
                          reg112[(1'h0):(1'h0)] : wire84)) ?
                  ((~$signed(reg116[(3'h5):(1'h0)])) ?
                      $signed((wire80[(5'h10):(3'h4)] ?
                          (reg97 || reg100) : reg109[(2'h3):(2'h3)])) : (&(reg100 || (reg106 && reg116)))) : ($signed(((reg90 ?
                          reg114 : reg118) ^ (8'hb7))) ?
                      ((8'ha8) <= {(&reg104),
                          (reg118 ^ reg115)}) : $unsigned((reg89 ?
                          (8'hb1) : {reg118}))));
            end
          else
            begin
              reg123 <= reg95[(4'h9):(2'h3)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg125 <= $unsigned(reg95[(3'h6):(1'h0)]);
      reg126 <= $unsigned(reg111);
    end
  assign wire127 = (wire85 ?
                       reg94[(3'h4):(3'h4)] : (($signed($signed(wire82)) ~^ $signed({reg96})) + (((~|wire83) ?
                               (-reg100) : reg119[(4'hc):(2'h2)]) ?
                           ($unsigned(wire82) ^ (+reg125)) : reg107[(4'he):(4'he)])));
endmodule

module module6
#(parameter param71 = (8'hb2))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire66;
  assign y = {wire70, wire69, wire68, wire11, wire12, wire13, wire66, (1'h0)};
  assign wire11 = (^~wire9);
  assign wire12 = (!((+($signed(wire10) >> {wire7, wire9})) ^ wire8));
  assign wire13 = $signed($signed(wire7[(2'h2):(1'h0)]));
  module14 #() modinst67 (wire66, clk, wire13, wire8, wire12, wire11, wire10);
  assign wire68 = wire13;
  assign wire69 = ($unsigned($signed(((wire11 + (7'h40)) << $unsigned(wire7)))) * wire7[(3'h4):(1'h1)]);
  assign wire70 = {$unsigned((wire10 & wire11[(4'he):(4'h9)]))};
endmodule

module module14
#(parameter param64 = ((~&((((7'h41) ? (8'hb4) : (8'hac)) ? ((8'h9d) - (8'hb0)) : (&(8'hac))) != (8'hb4))) >> (~(((&(8'ha0)) ? (|(8'ha2)) : ((8'ha9) > (8'hb9))) ? ((+(8'hb7)) ^ ((8'hb9) ? (8'hb1) : (8'ha3))) : (8'hb4)))), 
parameter param65 = ((8'hb5) ? {((~{param64}) ? (8'haa) : ({param64} ? (&(7'h44)) : param64))} : ({(!(param64 + param64))} ? ((param64 != (param64 ? param64 : param64)) ^~ param64) : param64)))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire [(2'h3):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(2'h2):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire53,
                 wire52,
                 wire51,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire25,
                 wire24,
                 wire21,
                 wire20,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
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
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = {({(~|(wire16 ^ wire15))} ?
                          (wire19 ? $unsigned(wire17) : wire15) : {(8'ha8),
                              ((wire18 ? wire15 : wire15) ?
                                  wire18 : (wire17 ? (7'h42) : (8'ha5)))}),
                      $signed($signed($signed((wire17 ? wire19 : wire18))))};
  assign wire21 = (wire17 ?
                      ($unsigned($signed($signed(wire19))) | (^~wire15[(1'h1):(1'h0)])) : wire18);
  always
    @(posedge clk) begin
      reg22 <= (wire16 ? wire19 : wire21);
      reg23 <= ((~{((~^reg22) >>> $unsigned((8'hb8))),
          ($signed(wire20) ?
              (8'hb3) : (reg22 ?
                  wire15 : wire17))}) << {(reg22[(3'h7):(2'h3)] != $unsigned($signed(wire16))),
          $signed(wire16)});
    end
  assign wire24 = (wire16 ?
                      (~|((wire18[(2'h2):(2'h2)] ?
                              $signed(wire16) : (wire15 & reg22)) ?
                          (wire18 ?
                              (~^(8'ha4)) : $unsigned(wire15)) : ((~|(8'had)) ?
                              wire20 : (~|reg23)))) : $signed((wire21[(4'ha):(3'h6)] ?
                          ($signed((8'h9c)) ?
                              (8'had) : $unsigned(wire16)) : {$unsigned(wire20)})));
  assign wire25 = $signed((-{($signed(reg23) ? wire18 : (|(8'hb2)))}));
  always
    @(posedge clk) begin
      if (wire16)
        begin
          reg26 <= wire17;
          reg27 <= $unsigned(((($unsigned(reg22) & $unsigned(wire20)) * reg22[(3'h6):(3'h5)]) <= (reg23 ?
              ($signed(reg26) & wire17[(1'h1):(1'h1)]) : ($unsigned(wire20) || (wire20 != (8'ha1))))));
          reg28 <= wire21[(4'ha):(2'h2)];
        end
      else
        begin
          reg26 <= {((($unsigned(wire20) ? (8'ha2) : (^~reg23)) ?
                      $unsigned((|(8'hb0))) : $signed($unsigned(wire17))) ?
                  (&reg26) : $unsigned({(8'had), (!reg27)})),
              $unsigned((^wire17))};
        end
      reg29 <= ({(8'ha9)} & $signed((|(wire17 != wire17[(2'h2):(1'h1)]))));
      reg30 <= (((-($signed(reg26) >> wire18)) ?
          reg23[(3'h6):(3'h5)] : ($unsigned(reg28[(1'h1):(1'h1)]) ?
              reg22 : {(reg26 ? reg22 : (8'hb4))})) && $unsigned(wire25));
      if (wire20[(2'h3):(2'h3)])
        begin
          if (wire17)
            begin
              reg31 <= {wire20[(3'h4):(1'h0)], reg28};
              reg32 <= (|$unsigned($unsigned($unsigned(wire19[(4'hf):(3'h7)]))));
              reg33 <= $unsigned({(-((+reg22) > (~&wire25)))});
            end
          else
            begin
              reg31 <= (&($signed((~&reg28)) ?
                  wire20[(3'h7):(2'h2)] : (reg33 ?
                      (~|$unsigned((8'ha4))) : reg29)));
              reg32 <= (~|wire15);
            end
          reg34 <= reg23;
        end
      else
        begin
          reg31 <= $unsigned((^~((wire16[(1'h1):(1'h0)] >> (8'ha7)) ?
              ((reg33 || wire19) ?
                  reg27 : (^~(8'hac))) : wire19[(4'hb):(1'h0)])));
        end
      reg35 <= wire17;
    end
  assign wire36 = ((($unsigned(reg35[(3'h4):(1'h0)]) >= (8'hbc)) ?
                      wire20[(3'h4):(2'h3)] : $signed($unsigned((^reg35)))) >= ($signed({{wire20,
                          reg30},
                      wire20}) < (~|($unsigned(wire21) << (reg35 ?
                      (8'ha3) : wire15)))));
  assign wire37 = $unsigned(wire20);
  assign wire38 = {(~reg27[(4'hf):(3'h4)])};
  assign wire39 = $unsigned({(reg23 && $unsigned($signed(reg23)))});
  assign wire40 = $unsigned(($signed(reg29) && (((8'ha4) <<< (^wire25)) != (&$unsigned(reg28)))));
  assign wire41 = (wire21[(3'h4):(2'h3)] >> {reg34[(4'hd):(2'h3)]});
  assign wire42 = $unsigned(((((wire40 == reg22) ? wire19 : $unsigned(wire24)) ?
                          {$unsigned(wire15)} : $unsigned((~|reg23))) ?
                      ((8'hab) ?
                          (8'hbf) : $signed((reg34 ?
                              reg29 : wire36))) : $signed((wire18[(1'h0):(1'h0)] ?
                          wire21[(3'h4):(1'h0)] : (reg33 ? reg23 : reg31)))));
  always
    @(posedge clk) begin
      if ({(({$signed((8'had))} || reg32) ?
              ($signed((+wire20)) >= ((wire38 - reg22) - reg33)) : $unsigned(($unsigned(wire39) != {wire38,
                  wire39})))})
        begin
          reg43 <= {(|(($unsigned(reg34) ?
                  {wire17} : wire19[(4'he):(1'h1)]) * ((~|wire21) ?
                  (|reg31) : $signed(wire37)))),
              (reg23[(4'hd):(3'h4)] == (!$signed((wire40 ? reg22 : wire39))))};
          reg44 <= (-wire24);
          reg45 <= $signed((wire40[(2'h2):(2'h2)] < ($signed((reg29 - wire40)) ?
              wire24 : wire19)));
          reg46 <= $unsigned((8'hb9));
          reg47 <= (((({reg29} ?
              (reg30 ?
                  wire42 : reg27) : (reg29 > reg35)) == $signed($signed(reg28))) | (~|reg32)) >> $signed($signed($unsigned((reg32 * reg44)))));
        end
      else
        begin
          if ((~^(~wire41[(1'h1):(1'h0)])))
            begin
              reg43 <= (~^((reg47[(3'h7):(2'h2)] ?
                  (8'h9c) : (7'h44)) << ((reg44[(4'h9):(3'h7)] ?
                      (8'h9e) : wire20[(1'h0):(1'h0)]) ?
                  ((reg22 ^~ wire20) <= wire15[(1'h1):(1'h1)]) : (reg31 ?
                      $unsigned((8'hb8)) : (wire25 ? wire37 : reg34)))));
            end
          else
            begin
              reg43 <= $signed((+$unsigned((((8'ha3) ? wire16 : reg47) ?
                  $unsigned(wire20) : $signed(reg27)))));
            end
        end
      reg48 <= (^((!$unsigned(reg26)) ?
          {$unsigned((wire36 ? (8'hb9) : wire25)),
              reg45[(3'h6):(3'h5)]} : (-($signed((8'ha4)) ~^ $unsigned(wire38)))));
      reg49 <= wire17;
      reg50 <= {((-(^~(reg48 < (8'hbb)))) > $unsigned((reg32 ?
              $unsigned(reg26) : $unsigned(reg44)))),
          ($unsigned(((wire24 ? (8'hb5) : wire15) ?
              reg44 : $unsigned(wire40))) + (($unsigned(wire19) ?
                  wire37 : (reg28 + wire19)) ?
              wire40[(4'hb):(4'hb)] : reg49))};
    end
  assign wire51 = {$signed(reg35)};
  assign wire52 = $signed(((^~((wire41 ? reg43 : reg49) ?
                      $unsigned(wire15) : wire38)) & (^~$unsigned($signed(reg43)))));
  assign wire53 = $signed((-(~^($unsigned((8'had)) ?
                      $signed(wire39) : (reg43 ^~ reg23)))));
  always
    @(posedge clk) begin
      reg54 <= $unsigned(wire15);
      if ($unsigned((({$signed((7'h40)), (reg44 | (8'hb6))} ?
          ((8'ha3) ?
              reg45 : (wire18 ?
                  reg22 : wire24)) : $signed((|reg28))) && {($signed(reg46) && (reg28 ?
              reg54 : (8'ha8)))})))
        begin
          if ($signed((~^($unsigned((~reg47)) ?
              $signed((reg30 ^ (8'ha1))) : (~&$signed((8'haa)))))))
            begin
              reg55 <= wire37[(2'h3):(2'h3)];
              reg56 <= $signed($unsigned({(~$unsigned(reg49)),
                  ($signed(wire51) ~^ (reg47 && reg43))}));
              reg57 <= (~|$signed($signed((|wire42))));
            end
          else
            begin
              reg55 <= $unsigned(reg30);
            end
          reg58 <= $signed((8'h9c));
        end
      else
        begin
          reg55 <= reg45[(2'h3):(2'h3)];
        end
      reg59 <= $unsigned((|{{(reg46 - reg46)}}));
    end
  assign wire60 = $unsigned($signed($unsigned(((reg22 ?
                      reg34 : reg35) + wire37[(2'h3):(1'h0)]))));
  assign wire61 = wire16[(4'hf):(3'h4)];
  assign wire62 = ($unsigned(reg28) ?
                      (reg27[(1'h0):(1'h0)] ?
                          reg54[(1'h1):(1'h0)] : (reg58[(2'h3):(1'h0)] ?
                              (8'hb2) : reg46)) : $signed($unsigned(((!wire41) ?
                          (reg45 ^~ reg58) : wire36))));
  assign wire63 = (wire41[(3'h7):(1'h0)] > $unsigned($signed($unsigned(reg33[(5'h12):(3'h7)]))));
endmodule

module module174
#(parameter param200 = {((8'hb6) != (!(((8'hb2) <<< (8'hac)) && (~(8'h9c))))), (^~(~|{(~|(8'ha6)), ((8'hb6) ? (8'hb6) : (8'hba))}))})
(y, clk, wire179, wire178, wire177, wire176, wire175);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire179;
  input wire [(5'h14):(1'h0)] wire178;
  input wire [(4'hb):(1'h0)] wire177;
  input wire [(4'hf):(1'h0)] wire176;
  input wire signed [(4'hc):(1'h0)] wire175;
  wire signed [(4'h9):(1'h0)] wire199;
  wire [(4'hc):(1'h0)] wire196;
  wire signed [(4'hf):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire194;
  wire [(5'h12):(1'h0)] wire193;
  wire signed [(4'ha):(1'h0)] wire192;
  wire [(4'hb):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire [(3'h6):(1'h0)] wire189;
  wire signed [(4'hb):(1'h0)] wire188;
  wire signed [(5'h12):(1'h0)] wire186;
  wire [(3'h7):(1'h0)] wire185;
  wire signed [(4'ha):(1'h0)] wire184;
  wire signed [(4'h9):(1'h0)] wire182;
  wire signed [(5'h12):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire180;
  reg signed [(3'h7):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg187 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  assign y = {wire199,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire186,
                 wire185,
                 wire184,
                 wire182,
                 wire181,
                 wire180,
                 reg198,
                 reg197,
                 reg187,
                 reg183,
                 (1'h0)};
  assign wire180 = wire178[(4'h8):(3'h5)];
  assign wire181 = ($signed((-$unsigned(wire180[(4'he):(3'h4)]))) ?
                       ((&(wire175[(4'hc):(3'h7)] ?
                               (wire177 < wire176) : $signed(wire180))) ?
                           wire179[(4'hc):(4'hc)] : $unsigned($signed(wire177[(3'h5):(2'h3)]))) : wire180);
  assign wire182 = wire181[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg183 <= wire175[(4'hc):(1'h1)];
    end
  assign wire184 = ($signed((~wire180)) ^ ($signed(wire180[(3'h7):(2'h2)]) ?
                       ((wire181 > $signed(wire179)) ?
                           wire181 : $signed((wire177 >> wire181))) : $unsigned((&wire176))));
  assign wire185 = ((($unsigned(wire177[(1'h0):(1'h0)]) ?
                               $signed(((8'h9f) ?
                                   wire181 : wire177)) : wire180[(3'h5):(1'h0)]) ?
                           {(!$signed(wire179)),
                               (~|wire175)} : $unsigned((!(wire177 ?
                               wire180 : wire177)))) ?
                       ((($signed(wire181) >= (-wire176)) << ($unsigned(wire180) | $signed(wire177))) > $signed($unsigned((|wire175)))) : $signed((&(~^(~^wire181)))));
  assign wire186 = {(-wire185[(2'h3):(2'h3)]), wire181};
  always
    @(posedge clk) begin
      reg187 <= {$signed((reg183 ? (-(wire179 + wire180)) : (7'h44))),
          (^wire179[(5'h11):(3'h7)])};
    end
  assign wire188 = wire184;
  assign wire189 = {{(~^({wire179, wire186} + $signed(wire180))),
                           {wire186, $unsigned(wire176)}},
                       (wire177 + ($signed({wire180}) ?
                           ((wire179 ? wire179 : reg183) ?
                               {(8'hb4), reg183} : (reg183 ?
                                   wire175 : reg183)) : (+$signed((8'hbb)))))};
  assign wire190 = wire180;
  assign wire191 = {(+$signed(({wire188, reg187} * (wire180 ?
                           wire189 : (8'had)))))};
  assign wire192 = $signed((8'hb1));
  assign wire193 = $signed(reg187[(4'h9):(2'h2)]);
  assign wire194 = {(~^(wire175[(4'ha):(4'h8)] ^~ $signed((~wire193)))),
                       wire188[(4'h9):(3'h4)]};
  assign wire195 = $unsigned(($signed(wire179) ?
                       $unsigned($unsigned({wire188})) : {wire184[(2'h2):(1'h0)]}));
  assign wire196 = {(($unsigned((8'haf)) ?
                           ((-(8'hab)) || (wire175 * wire175)) : $signed((wire175 >= wire177))) ~^ wire177[(1'h1):(1'h0)])};
  always
    @(posedge clk) begin
      reg197 <= $signed($unsigned((wire176[(2'h2):(1'h1)] >> (~&{wire194,
          wire188}))));
      reg198 <= $unsigned($signed($unsigned(wire194)));
    end
  assign wire199 = wire182;
endmodule

module module139
#(parameter param167 = ({{((~&(8'hbe)) << (~^(7'h42))), ((~|(8'ha9)) + {(8'h9c), (8'hb3)})}, (^{((8'hb7) > (8'hb0))})} ? (~|(&({(8'hb0)} ? (&(8'ha9)) : ((8'haa) ? (8'hab) : (8'hab))))) : (((7'h40) <<< ({(8'hb5)} < {(8'ha4)})) || {(8'hab), (((8'h9c) ? (8'ha0) : (8'ha5)) ? ((8'hb8) || (8'ha5)) : (-(8'ha8)))})))
(y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire144;
  input wire [(4'h9):(1'h0)] wire143;
  input wire signed [(4'hd):(1'h0)] wire142;
  input wire signed [(4'h8):(1'h0)] wire141;
  input wire [(4'h8):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire166;
  wire [(4'he):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire [(4'h8):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire153;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(3'h5):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire145;
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire145,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire145 = ({$unsigned({$signed(wire143)})} ?
                       $unsigned($unsigned(((wire142 && wire141) & (wire141 || wire142)))) : (8'hbe));
  always
    @(posedge clk) begin
      reg146 <= ($signed(wire142[(1'h0):(1'h0)]) ~^ $signed($unsigned({$signed(wire143),
          (wire140 ? wire142 : wire145)})));
      reg147 <= (!$signed(wire144[(1'h0):(1'h0)]));
      reg148 <= (({($unsigned(reg147) ?
                  wire144[(1'h1):(1'h1)] : $signed(reg146)),
              wire145} ^ wire140) ?
          reg147[(1'h0):(1'h0)] : ((8'ha0) != $unsigned(wire141[(3'h4):(1'h1)])));
      reg149 <= $signed(((^$unsigned($signed(wire143))) ?
          wire144[(2'h2):(1'h1)] : (wire144 ?
              ((^wire140) ?
                  (~wire142) : (wire141 ?
                      wire143 : reg146)) : ($unsigned((8'ha3)) >>> (^~wire141)))));
      reg150 <= (wire144[(2'h2):(1'h0)] ?
          (+$signed(($signed((8'hba)) | (reg147 ?
              wire142 : wire140)))) : wire141);
    end
  assign wire151 = $unsigned(wire145);
  assign wire152 = reg146[(2'h2):(2'h2)];
  assign wire153 = (wire145 ?
                       (wire145[(4'hb):(4'ha)] >= wire140[(3'h5):(2'h2)]) : $signed(reg148));
  assign wire154 = reg148[(4'he):(2'h3)];
  assign wire155 = {{(+(~wire144)),
                           (((wire154 ?
                                   (8'ha2) : wire152) + reg147[(4'h8):(2'h3)]) ?
                               ((reg146 * wire143) >> $signed(reg148)) : $signed((+reg149)))},
                       $unsigned(($signed((wire152 != wire152)) * $signed(reg150[(4'ha):(3'h5)])))};
  assign wire156 = $unsigned(reg146);
  always
    @(posedge clk) begin
      if (wire142[(1'h1):(1'h1)])
        begin
          reg157 <= reg147[(3'h5):(2'h3)];
          if ($unsigned({$signed($unsigned((reg149 == wire141))),
              wire141[(1'h0):(1'h0)]}))
            begin
              reg158 <= (wire141 ? wire145 : (reg148 ^~ $unsigned(reg148)));
              reg159 <= wire142[(3'h4):(2'h3)];
              reg160 <= wire152[(2'h2):(1'h1)];
            end
          else
            begin
              reg158 <= ((8'ha5) ?
                  ((8'hb1) > {$unsigned(reg147[(1'h1):(1'h1)])}) : (wire151 ?
                      (~^($unsigned((8'ha6)) ?
                          $unsigned((8'hbb)) : $signed(wire152))) : (^((+wire153) ~^ reg150[(3'h7):(3'h5)]))));
              reg159 <= {(~&wire144)};
              reg160 <= wire145[(4'ha):(2'h3)];
              reg161 <= (|((((reg159 == reg160) >>> (wire152 ?
                      reg159 : reg159)) >= (+wire155[(3'h6):(2'h2)])) ?
                  ($unsigned($unsigned(wire145)) ?
                      ({(8'h9e)} ?
                          (|(8'hb7)) : wire156[(4'h8):(3'h6)]) : $signed(wire151)) : wire142[(3'h5):(3'h4)]));
            end
        end
      else
        begin
          reg157 <= (~|({wire153[(3'h4):(1'h1)],
                  (((7'h43) >= wire141) ? reg161 : (~wire154))} ?
              $signed($unsigned($unsigned(reg160))) : ($signed((reg148 ?
                      wire142 : wire156)) ?
                  reg161 : (((8'hac) >> reg150) << $signed(reg149)))));
          reg158 <= wire154[(4'hb):(1'h0)];
          reg159 <= ($unsigned(reg158[(4'ha):(2'h2)]) ~^ (~(~^wire154)));
          reg160 <= ($unsigned(wire142[(2'h2):(2'h2)]) != {$signed($signed((reg157 >> reg158))),
              $unsigned(((reg160 == (8'ha4)) << (|wire144)))});
        end
      reg162 <= $unsigned($signed(reg157));
    end
  assign wire163 = $signed($signed((8'hb6)));
  assign wire164 = $signed(wire163);
  assign wire165 = reg159[(3'h5):(1'h1)];
  assign wire166 = (((8'h9d) ^~ reg158) ?
                       $signed((wire140 ?
                           $signed(reg157) : (^~(reg149 > wire140)))) : {(((~^wire151) ^ (+wire155)) ?
                               (8'hb7) : (8'hb5)),
                           ($unsigned(((8'hab) ^~ wire154)) ?
                               wire165[(4'ha):(4'h9)] : wire140[(2'h3):(1'h0)])});
endmodule
