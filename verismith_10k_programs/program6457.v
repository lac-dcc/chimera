module top
#(parameter param212 = (-(-(~&{((8'hb4) - (8'h9c))}))), 
parameter param213 = (!(~|param212)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire210;
  assign y = {wire4, wire5, wire6, wire7, wire210, (1'h0)};
  assign wire4 = $signed({wire0});
  assign wire5 = (&(-((~^wire3[(4'hb):(3'h7)]) | (^{(8'hb8)}))));
  assign wire6 = (+$signed($signed($unsigned((wire2 ? wire2 : (8'haf))))));
  assign wire7 = $unsigned((wire1 ?
                     $unsigned((wire1 ?
                         {wire2,
                             wire1} : $signed(wire2))) : wire6[(4'hc):(3'h4)]));
  module8 #() modinst211 (wire210, clk, wire6, wire2, wire3, wire0, wire5);
endmodule

module module8
#(parameter param209 = (((-((+(8'ha6)) ? {(8'hac), (7'h44)} : (|(8'hbb)))) + ({{(7'h40), (8'had)}, (~&(7'h41))} ? (((8'h9e) ? (8'ha3) : (8'hb0)) ? ((8'hb5) ~^ (8'hbd)) : (~^(8'h9e))) : ((!(8'hb8)) | ((8'ha9) >> (8'hb9))))) ? ((~^(~^(+(8'ha0)))) ? ((((8'hb7) ? (8'h9d) : (8'ha7)) ? {(8'haa)} : (|(7'h43))) ? (((8'h9d) ? (8'hb1) : (8'hb8)) ? ((8'hbf) ? (7'h42) : (8'ha5)) : {(7'h44), (8'ha6)}) : (((7'h43) ? (8'hbc) : (8'ha8)) < (!(7'h40)))) : (({(8'hbd), (7'h42)} ? ((8'hbe) + (8'hae)) : ((7'h40) <<< (8'hb0))) ? ({(8'hb5), (8'h9d)} >= ((7'h41) + (8'hb4))) : {((8'h9f) ? (8'hb4) : (7'h42)), {(8'hb4)}})) : ((^(8'hba)) ? ((~^((8'hb4) >> (8'hb4))) ? (^~{(8'ha9), (8'hb1)}) : ({(8'ha4)} ? ((8'haa) ? (8'hb7) : (7'h44)) : (|(8'haa)))) : ({{(7'h44), (8'hb7)}, (~&(8'hbb))} ~^ (7'h44)))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h25a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire208;
  wire [(5'h10):(1'h0)] wire207;
  wire [(5'h15):(1'h0)] wire169;
  wire signed [(5'h12):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire205;
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire169,
                 wire131,
                 wire130,
                 wire116,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire51,
                 wire49,
                 wire16,
                 wire15,
                 wire14,
                 wire205,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 (1'h0)};
  assign wire14 = wire12;
  assign wire15 = wire13;
  assign wire16 = ({((~(wire12 ? wire13 : wire12)) <<< {(!wire11),
                          $unsigned((8'ha2))})} == $signed(($unsigned($unsigned(wire13)) ?
                      $signed($signed(wire11)) : (^{wire12}))));
  always
    @(posedge clk) begin
      reg17 <= $unsigned((|$signed(wire15[(2'h2):(1'h1)])));
      reg18 <= {({$unsigned(wire14[(2'h2):(1'h1)]),
              ((&wire12) | wire13[(4'hd):(2'h3)])} << (~(+wire10)))};
      reg19 <= wire13[(4'h9):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg20 <= ((($signed((wire10 && reg17)) && $signed(wire13[(4'hf):(2'h2)])) ?
          {($signed(wire16) ?
                  (wire16 ?
                      (8'h9c) : reg19) : wire11[(4'hd):(3'h5)])} : ((|wire13[(4'h8):(4'h8)]) < reg17)) >> (((wire11 ?
                  wire16[(1'h0):(1'h0)] : $signed(wire12)) ?
              $unsigned(reg17) : (wire10 <<< reg17[(1'h1):(1'h0)])) ?
          (wire9[(3'h4):(1'h0)] ?
              ({wire15, (7'h44)} > wire9) : $signed((8'hb5))) : (({wire9,
                  wire12} << (^~(8'ha8))) ?
              ((wire16 + (8'hb8)) ? wire10 : $unsigned(wire9)) : {{wire13,
                      wire10},
                  reg19})));
    end
  module21 #() modinst50 (.wire24(wire11), .wire22(wire16), .clk(clk), .wire25(wire13), .wire23(wire15), .wire26(reg19), .y(wire49));
  assign wire51 = ($signed($signed((~$unsigned(wire16)))) + $unsigned(wire14));
  always
    @(posedge clk) begin
      reg52 <= ($unsigned(reg17) <= (({$unsigned(wire9)} ?
          $unsigned(wire15[(1'h1):(1'h1)]) : wire10[(4'ha):(4'h9)]) <<< (&(^$unsigned(reg19)))));
      if (((reg17 ?
              ({{wire12, reg20}} ?
                  wire15[(4'h9):(3'h7)] : (^~((8'hab) ?
                      reg17 : (8'ha6)))) : ($signed(reg19[(4'hb):(2'h2)]) >>> wire49[(4'he):(1'h1)])) ?
          $signed((reg19 < $signed(wire13[(5'h13):(1'h0)]))) : $unsigned((-wire12[(1'h0):(1'h0)]))))
        begin
          reg53 <= reg52[(3'h6):(3'h5)];
          reg54 <= ($unsigned((8'hb6)) ?
              ($signed(wire13) << wire16[(4'h8):(3'h6)]) : ($unsigned(reg20[(2'h2):(2'h2)]) ?
                  {reg19[(5'h11):(3'h5)]} : (^(&(~|wire12)))));
        end
      else
        begin
          if ({$signed((+((wire9 ? wire49 : wire11) >>> reg53))), reg53})
            begin
              reg53 <= ((wire11 ?
                  (wire49 > reg53[(3'h6):(2'h3)]) : wire14) > {(~^{(8'hb2)})});
              reg54 <= {(+$unsigned($unsigned(((8'hb3) >= wire14)))),
                  $unsigned($unsigned(((!wire15) <= ((8'ha4) ?
                      wire49 : wire12))))};
              reg55 <= ((8'hb0) >> $unsigned($signed(((8'hb8) == {wire49}))));
              reg56 <= ((~&$signed(wire51)) ?
                  {(~|reg18),
                      $signed($unsigned(wire9))} : $unsigned((~&(^~((8'ha9) ?
                      wire10 : reg54)))));
            end
          else
            begin
              reg53 <= $unsigned((($unsigned(wire9) ?
                      reg53[(3'h5):(2'h3)] : $unsigned(((8'hbf) * wire12))) ?
                  (({wire51, (8'hbe)} ?
                      wire14[(4'ha):(4'h8)] : reg52) < reg52[(4'h9):(3'h7)]) : (8'ha1)));
              reg54 <= ($signed({($unsigned((7'h42)) && reg17)}) ?
                  (-(~|{wire14[(4'hb):(2'h2)]})) : reg20);
            end
          if ($unsigned({((!$signed(reg53)) >> wire51),
              ((8'hb0) ^ ((^~wire11) << (reg19 ? reg53 : wire51)))}))
            begin
              reg57 <= wire16;
              reg58 <= reg18[(4'hc):(1'h1)];
              reg59 <= $signed($unsigned(wire14));
              reg60 <= ($signed({$signed((wire14 ?
                      reg52 : wire14))}) ~^ $signed(reg19));
            end
          else
            begin
              reg57 <= $signed((7'h44));
              reg58 <= wire15;
              reg59 <= $unsigned($signed({$unsigned(reg52[(2'h2):(1'h1)]),
                  (+$signed(wire12))}));
            end
          reg61 <= (&$signed({$signed((~(8'had))),
              {(wire14 ? reg59 : wire11)}}));
          reg62 <= ({wire13,
                  (((wire15 ? wire16 : reg58) ?
                          (~|reg54) : reg55[(2'h3):(2'h3)]) ?
                      reg53[(1'h1):(1'h1)] : ($unsigned(wire13) ?
                          (-reg56) : (+reg59)))} ?
              {(8'haf),
                  (reg20 == wire10)} : $unsigned((((~&reg55) ~^ $signed(reg17)) - $signed($unsigned(reg61)))));
        end
      reg63 <= reg55;
    end
  assign wire64 = (8'had);
  assign wire65 = reg54[(3'h7):(3'h4)];
  assign wire66 = (8'h9f);
  assign wire67 = (^~reg18[(3'h6):(3'h5)]);
  assign wire68 = (8'hbe);
  assign wire69 = (8'hb1);
  module70 #() modinst117 (.wire74(reg61), .wire72(reg54), .wire73(reg17), .wire75(wire14), .y(wire116), .wire71(wire66), .clk(clk));
  always
    @(posedge clk) begin
      reg118 <= (!({$signed(wire49)} ?
          $unsigned({(reg57 ?
                  wire13 : reg57)}) : (!$unsigned(wire51[(1'h0):(1'h0)]))));
      if (reg17[(1'h1):(1'h1)])
        begin
          if ($signed(reg18))
            begin
              reg119 <= wire67[(3'h7):(3'h6)];
              reg120 <= wire65[(4'hd):(4'hc)];
              reg121 <= reg119[(2'h2):(1'h1)];
              reg122 <= (wire116[(4'h9):(4'h8)] ?
                  reg63[(5'h15):(2'h2)] : ($signed($signed($unsigned((8'ha5)))) ?
                      reg60[(2'h3):(1'h0)] : (reg120[(3'h7):(2'h2)] >= $signed((wire66 ?
                          reg60 : reg60)))));
            end
          else
            begin
              reg119 <= (~(reg122 >= $signed($signed(((8'ha7) - reg62)))));
              reg120 <= ($signed(reg122[(4'hc):(4'ha)]) >>> (((wire67 > wire116) + reg58) ?
                  (~&$signed(reg53[(2'h2):(2'h2)])) : reg57));
            end
          reg123 <= reg57[(4'hd):(4'h8)];
        end
      else
        begin
          reg119 <= {reg60,
              ($signed((-(~^reg62))) ?
                  reg61 : (^((&wire9) ? (+(8'hb8)) : $unsigned(reg20))))};
          reg120 <= (&reg62[(3'h5):(3'h5)]);
          reg121 <= wire13[(5'h12):(4'hc)];
          reg122 <= $unsigned(reg53[(1'h1):(1'h0)]);
          reg123 <= ($signed({(~|(&wire13)),
              $signed((|reg119))}) ^~ $signed($unsigned({$signed((7'h42))})));
        end
      if ((~&$unsigned({$signed((~^reg59)),
          (reg58[(4'h9):(3'h4)] << (~wire68))})))
        begin
          reg124 <= ((((~^wire9) ^ $unsigned($unsigned((8'hab)))) == (^~$unsigned((~reg18)))) > reg119);
        end
      else
        begin
          reg124 <= wire67[(4'hc):(1'h1)];
          reg125 <= ($signed((8'ha0)) ?
              (({reg61} + $unsigned({reg60, reg53})) ?
                  ({wire116[(2'h2):(1'h0)]} ?
                      (reg62[(5'h11):(3'h4)] ?
                          wire11[(4'h8):(3'h7)] : {reg17}) : ((wire10 ?
                              wire51 : (8'h9f)) ?
                          (reg61 <= wire14) : (reg119 < wire116))) : ((!(+reg58)) ?
                      (reg17[(1'h1):(1'h0)] ?
                          (reg20 ? reg121 : wire15) : {wire49,
                              (8'ha3)}) : ((-wire12) < $signed(wire116)))) : {({(reg52 + reg54),
                      {reg20}} << wire68[(4'hd):(4'hb)])});
          reg126 <= ($signed((({(8'hbc)} ? (&(8'h9e)) : {wire11}) ?
              $unsigned(wire14[(4'h9):(1'h0)]) : (wire16[(4'ha):(1'h1)] ?
                  wire12 : (reg56 >>> reg125)))) - $unsigned((reg119 ?
              (8'hbe) : {(^~reg121)})));
          reg127 <= $unsigned(reg62);
          if ($signed({wire10}))
            begin
              reg128 <= reg18;
            end
          else
            begin
              reg128 <= $signed(({(~(reg118 ? reg128 : wire116)),
                  (wire13 + wire69)} == wire10));
              reg129 <= reg20[(2'h3):(2'h2)];
            end
        end
    end
  assign wire130 = ($unsigned($unsigned(reg122)) ?
                       ($signed(((+wire16) ? (+wire10) : (8'hb7))) ?
                           {$signed(reg126[(5'h15):(5'h13)]),
                               $unsigned({wire16, reg62})} : reg124) : (8'h9c));
  assign wire131 = ((wire65 ^ (~&$signed({reg124}))) >> $signed(({(reg128 | (8'hab))} || ((8'hb8) ?
                       wire14 : (&(8'ha7))))));
  module132 #() modinst170 (.wire135(reg63), .clk(clk), .wire137(wire13), .wire136(reg62), .wire133(reg123), .y(wire169), .wire134(reg17));
  module171 #() modinst206 (.wire173(reg62), .y(wire205), .wire174(wire116), .clk(clk), .wire172(reg56), .wire175(reg61));
  assign wire207 = reg57;
  assign wire208 = (($signed($signed(reg55[(2'h3):(2'h2)])) >> wire11[(4'h8):(1'h0)]) ?
                       $unsigned(reg56[(4'he):(4'h9)]) : (!(($unsigned(reg56) <= (wire16 - wire116)) ~^ reg62)));
endmodule

module module171
#(parameter param203 = ((!((~^(&(8'haa))) ? (~((8'ha0) - (8'hb5))) : ((|(8'had)) ? (|(8'h9f)) : ((8'ha7) ? (7'h41) : (7'h41))))) - (|(((|(8'hb9)) ? ((8'hbc) ? (8'ha7) : (8'hb5)) : {(7'h42), (8'h9f)}) >> (((7'h42) >> (8'hb3)) ? ((7'h40) >>> (8'hb4)) : (~|(8'ha2)))))), 
parameter param204 = (((((param203 ? param203 : param203) ^~ ((8'hb2) || param203)) ? (^param203) : ((param203 & param203) ? param203 : {(8'ha5), (7'h41)})) ? ((!(param203 >>> param203)) ? ((!param203) + (-param203)) : (8'ha7)) : param203) ^ param203))
(y, clk, wire175, wire174, wire173, wire172);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire175;
  input wire [(3'h6):(1'h0)] wire174;
  input wire signed [(3'h4):(1'h0)] wire173;
  input wire [(5'h10):(1'h0)] wire172;
  wire [(3'h7):(1'h0)] wire202;
  wire signed [(4'hd):(1'h0)] wire193;
  wire signed [(3'h7):(1'h0)] wire192;
  wire signed [(3'h6):(1'h0)] wire191;
  wire [(2'h3):(1'h0)] wire190;
  wire [(4'hb):(1'h0)] wire179;
  wire signed [(4'h8):(1'h0)] wire178;
  wire signed [(5'h13):(1'h0)] wire177;
  wire signed [(3'h5):(1'h0)] wire176;
  reg signed [(3'h4):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg199 = (1'h0);
  reg [(4'hc):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg197 = (1'h0);
  reg [(3'h6):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  reg [(5'h10):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(5'h14):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg180 = (1'h0);
  assign y = {wire202,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 (1'h0)};
  assign wire176 = {$unsigned($unsigned((|(~^wire175))))};
  assign wire177 = wire175[(4'h9):(3'h7)];
  assign wire178 = $signed((+(^~$signed($unsigned(wire175)))));
  assign wire179 = (-wire172[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg180 <= ((~^(wire176[(2'h2):(2'h2)] || wire174)) != ((+wire178[(2'h3):(1'h0)]) != $signed(((-wire173) || (wire173 ~^ wire176)))));
      if ({wire172[(3'h6):(1'h1)]})
        begin
          reg181 <= $signed(wire178[(3'h7):(3'h7)]);
          reg182 <= $unsigned(((($signed(wire179) ?
                      $unsigned(wire172) : (wire174 < (8'hb1))) ?
                  (&$signed((8'hb7))) : (~(8'hb1))) ?
              wire176 : $unsigned(wire175[(5'h10):(5'h10)])));
          reg183 <= ((~|$unsigned(wire177)) ?
              {((7'h43) >>> wire174[(2'h3):(2'h2)]),
                  ($signed(reg182[(5'h11):(4'h8)]) ?
                      {(+wire174)} : (^(^reg181)))} : {(((8'hb8) << $unsigned(wire178)) ?
                      $unsigned($signed(wire172)) : ($unsigned((7'h44)) << reg182[(1'h1):(1'h0)]))});
          if (wire177[(4'h9):(1'h0)])
            begin
              reg184 <= ((reg182 || reg182[(5'h11):(2'h2)]) ?
                  $unsigned($signed(wire179[(2'h3):(1'h1)])) : $unsigned({(^$unsigned(wire178)),
                      wire176}));
              reg185 <= wire173;
              reg186 <= wire176;
            end
          else
            begin
              reg184 <= ($unsigned((!reg184[(4'hc):(4'h9)])) ?
                  wire175[(5'h10):(3'h7)] : $unsigned($signed((8'h9c))));
              reg185 <= (-wire173[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          if (($signed(reg181[(2'h3):(1'h1)]) ?
              ({(8'hbf), {(&wire177)}} ^~ ($signed((7'h41)) >> ((7'h40) ?
                  (wire177 ^ (8'hb9)) : reg181))) : ((~($unsigned(wire173) ?
                      (wire176 ^ reg185) : $unsigned((8'ha9)))) ?
                  wire179 : {$unsigned(wire177[(5'h10):(2'h3)]),
                      $signed((wire175 & wire177))})))
            begin
              reg181 <= (wire179 ?
                  (~^reg181[(3'h7):(2'h2)]) : (wire173 & reg180[(3'h5):(1'h0)]));
              reg182 <= wire175;
            end
          else
            begin
              reg181 <= ({wire174[(3'h4):(3'h4)],
                  (^~$signed($unsigned(reg181)))} - (wire174[(1'h1):(1'h1)] ?
                  ($unsigned($signed(wire175)) ^ $unsigned((wire175 ?
                      reg183 : wire174))) : $unsigned(wire173)));
              reg182 <= reg182[(4'h9):(2'h2)];
              reg183 <= {wire174[(2'h3):(1'h1)]};
              reg184 <= (wire176[(2'h3):(2'h3)] << reg184);
            end
          reg185 <= (~^$unsigned($signed(wire178[(3'h6):(3'h5)])));
          reg186 <= $signed({$unsigned({$signed(wire172)}),
              wire177[(2'h3):(1'h1)]});
          reg187 <= (8'haa);
        end
      reg188 <= ((((reg180[(4'h8):(3'h4)] ? $unsigned(wire176) : reg180) ?
                  ((!reg183) && (reg184 ?
                      reg187 : wire174)) : $signed((wire172 + wire178))) ?
              $unsigned((((8'hb8) ?
                  (8'hab) : reg181) ~^ ((8'haa) ^ wire178))) : ((^~$unsigned((8'hab))) & $unsigned($signed(reg184)))) ?
          (reg184 || wire176[(3'h5):(1'h0)]) : (8'hb4));
      reg189 <= $signed($signed(reg188[(1'h1):(1'h0)]));
    end
  assign wire190 = (!$signed(($unsigned($signed(reg187)) > $signed(wire177[(4'hf):(3'h4)]))));
  assign wire191 = wire190;
  assign wire192 = wire176[(1'h0):(1'h0)];
  assign wire193 = $signed((^(((wire172 == wire176) ?
                       {reg182} : reg182) | (wire179 || $unsigned(wire191)))));
  always
    @(posedge clk) begin
      if (((wire176 ? $unsigned({$unsigned(wire192)}) : (8'hb8)) ?
          reg181[(4'h9):(3'h7)] : $signed(wire175[(4'hc):(4'ha)])))
        begin
          reg194 <= reg185;
          reg195 <= ($unsigned((8'hb6)) ?
              (wire193 ?
                  reg188 : (((~wire177) ? $unsigned(wire172) : reg187) ?
                      $unsigned($signed((8'hb1))) : wire172)) : $unsigned(wire172));
          reg196 <= (8'hb2);
          reg197 <= (reg184[(3'h7):(3'h4)] ?
              ($signed((((8'h9f) - reg194) + wire193)) != (-((wire178 - (8'ha3)) ?
                  $unsigned(wire178) : $unsigned(wire174)))) : reg184[(4'he):(3'h6)]);
        end
      else
        begin
          reg194 <= $unsigned($signed((~|(8'hbf))));
          if (reg195[(2'h3):(2'h2)])
            begin
              reg195 <= reg187[(1'h1):(1'h0)];
            end
          else
            begin
              reg195 <= reg187[(3'h6):(3'h4)];
              reg196 <= $signed($signed(({(wire191 ? wire174 : (7'h41)),
                  $unsigned(reg183)} <<< $signed((+reg181)))));
              reg197 <= ($signed(((&reg187[(3'h6):(3'h5)]) != {(|(8'ha5))})) == ((^~wire192) & {(reg194 ?
                      $signed(reg183) : reg181)}));
              reg198 <= ($unsigned(((wire193 ?
                      $unsigned(reg184) : (reg197 ?
                          wire191 : (8'ha1))) && (-(^~reg183)))) ?
                  $signed($signed({(wire176 * (8'haa))})) : $unsigned((((wire190 ?
                          (8'hb7) : reg186) ?
                      (8'ha7) : $unsigned(wire177)) + reg180)));
              reg199 <= (+(reg184[(4'hb):(2'h2)] > ($signed((|reg182)) ?
                  reg198 : $signed((wire174 >>> wire179)))));
            end
          reg200 <= reg187;
          reg201 <= (~^($unsigned($signed($unsigned((8'ha5)))) <<< {wire175}));
        end
    end
  assign wire202 = ($signed((^$unsigned(wire191))) ?
                       (~|(reg196 ?
                           (+$unsigned(reg186)) : reg188[(3'h5):(2'h3)])) : wire173);
endmodule

module module132  (y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire137;
  input wire signed [(4'hc):(1'h0)] wire136;
  input wire [(4'hf):(1'h0)] wire135;
  input wire [(4'h8):(1'h0)] wire134;
  input wire [(5'h15):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire168;
  wire signed [(4'he):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire [(2'h2):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire [(5'h11):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire140;
  wire [(4'hd):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  reg [(3'h5):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(4'hd):(1'h0)] reg165 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg signed [(4'he):(1'h0)] reg142 = (1'h0);
  assign y = {wire168,
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
                 wire146,
                 wire145,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
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
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire138 = wire134;
  assign wire139 = (7'h44);
  assign wire140 = $signed($unsigned((|wire137[(4'ha):(3'h4)])));
  assign wire141 = (($signed($signed(wire138)) > (~((wire133 >= wire135) ^~ wire135[(2'h2):(1'h1)]))) * wire136);
  always
    @(posedge clk) begin
      reg142 <= (((~|wire135) ?
          {(wire139[(3'h5):(2'h3)] ?
                  (wire140 ?
                      wire140 : wire140) : wire137[(1'h1):(1'h0)])} : $signed((8'h9d))) < {($signed($unsigned(wire135)) ?
              $signed((~^wire141)) : wire139),
          (wire135[(4'hc):(1'h1)] ?
              $unsigned((|wire137)) : (&{wire141, wire134}))});
      reg143 <= (~^(wire137[(4'hb):(4'ha)] ? wire137 : wire141[(4'hb):(4'h8)]));
      reg144 <= $signed((8'ha2));
    end
  assign wire145 = {{({{(8'hb2)},
                               (wire133 ?
                                   (8'hb3) : wire138)} <<< (wire136[(4'h8):(1'h0)] ?
                               (~&wire138) : wire136[(4'h9):(3'h6)])),
                           wire139}};
  assign wire146 = wire145;
  assign wire147 = $unsigned(($unsigned((~|reg143[(4'hb):(2'h3)])) | $signed({$unsigned(wire138)})));
  assign wire148 = {{(((wire136 <= wire138) | $signed(reg144)) >> $unsigned(wire140))}};
  assign wire149 = (^$signed(reg142));
  assign wire150 = {($signed(wire141) ?
                           ((|(+wire149)) ?
                               wire148 : $signed(wire136)) : (($signed((8'hb1)) ?
                               reg142 : $signed(wire133)) + $unsigned({(8'ha6),
                               wire137})))};
  assign wire151 = {(($unsigned((wire148 ? wire138 : wire134)) ?
                           wire149 : wire148[(4'ha):(4'ha)]) >> $signed($unsigned((+wire149)))),
                       $signed((+$unsigned((|wire135))))};
  assign wire152 = (-$unsigned((~&((wire147 ? wire136 : reg144) ?
                       $signed(wire148) : (wire148 == wire135)))));
  assign wire153 = ((8'ha3) ?
                       $signed($signed((!$unsigned(wire147)))) : {{$unsigned($unsigned(wire147)),
                               wire139}});
  assign wire154 = wire141;
  assign wire155 = {{(wire153 && wire138)}, $signed(wire145[(3'h5):(2'h2)])};
  assign wire156 = $unsigned(wire138);
  assign wire157 = (wire133[(5'h12):(4'ha)] ?
                       $unsigned({$signed(wire150[(2'h2):(2'h2)]),
                           wire136[(4'hc):(4'hc)]}) : $signed((8'hb0)));
  always
    @(posedge clk) begin
      reg158 <= wire148[(4'he):(4'hc)];
      reg159 <= (8'ha9);
      if ((wire150 ^ (8'hb0)))
        begin
          reg160 <= (&(8'h9e));
          if (wire149)
            begin
              reg161 <= (8'ha2);
            end
          else
            begin
              reg161 <= (wire136 <<< wire155[(3'h6):(2'h2)]);
            end
          if ($signed(wire140[(3'h5):(3'h5)]))
            begin
              reg162 <= (^~reg144);
              reg163 <= (!$signed({(~wire147[(1'h1):(1'h0)]),
                  {$signed(wire152), $signed(reg162)}}));
              reg164 <= (wire155[(1'h1):(1'h0)] ?
                  {(($signed(reg143) && reg144) ?
                          (wire148[(4'h9):(3'h5)] ^ $signed(wire157)) : wire139)} : (~|$signed((~|wire149))));
              reg165 <= $signed((wire137 ?
                  (wire153 <= $signed((!reg158))) : (~|($unsigned(wire151) | reg161[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg162 <= (~^((((wire140 ~^ wire145) ?
                      $signed(wire157) : (8'hb6)) ?
                  ((8'hae) < $unsigned(wire140)) : (wire133 || (-(8'ha1)))) - $signed((^~(wire140 ?
                  wire134 : (8'hae))))));
              reg163 <= $signed(reg159[(3'h4):(1'h1)]);
            end
          reg166 <= wire154[(1'h1):(1'h0)];
          reg167 <= wire136[(3'h4):(2'h2)];
        end
      else
        begin
          reg160 <= $unsigned(((|($signed(wire133) > $unsigned(wire156))) ?
              $unsigned({reg164,
                  $unsigned(reg163)}) : $signed({$signed(reg163)})));
          reg161 <= (~|((7'h44) ?
              $unsigned($signed($unsigned(reg165))) : ((wire139 ?
                      (reg165 == wire147) : {(7'h40)}) ?
                  reg142[(3'h6):(2'h3)] : ($unsigned(wire149) ?
                      wire157 : $signed(wire147)))));
          reg162 <= ({wire147[(2'h2):(1'h0)], wire136} - wire152);
          reg163 <= (7'h42);
        end
    end
  assign wire168 = (($unsigned($signed(wire135)) ?
                           reg164 : (wire157[(4'hd):(4'hb)] < ($unsigned(reg166) ?
                               $unsigned(wire153) : $signed(wire148)))) ?
                       reg159 : (7'h42));
endmodule

module module70  (y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire75;
  input wire [(4'he):(1'h0)] wire74;
  input wire signed [(2'h2):(1'h0)] wire73;
  input wire signed [(5'h14):(1'h0)] wire72;
  input wire [(5'h12):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire76;
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire100,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire76,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg99,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire76 = {$unsigned(wire73[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg77 <= $signed((wire72 ?
          (&$signed($signed((8'ha9)))) : $unsigned(($unsigned(wire73) != $signed((8'hb6))))));
    end
  always
    @(posedge clk) begin
      reg78 <= wire74;
      reg79 <= (wire74[(4'h8):(1'h1)] * wire72[(5'h11):(4'hb)]);
    end
  always
    @(posedge clk) begin
      if (($unsigned((~&{$unsigned((8'hb5))})) ^~ $unsigned((~{reg79[(4'hb):(1'h1)]}))))
        begin
          if (wire71)
            begin
              reg80 <= ((~&(^~$unsigned(reg78[(4'hc):(4'hb)]))) | (!wire75));
              reg81 <= wire72[(5'h10):(4'hd)];
              reg82 <= $signed(wire71[(4'ha):(3'h7)]);
            end
          else
            begin
              reg80 <= ({reg82,
                  ((^(reg79 || reg79)) | reg79)} * ((!(~&wire73)) ?
                  $signed(wire72) : reg78[(4'hb):(3'h5)]));
              reg81 <= reg82;
              reg82 <= reg80[(2'h2):(2'h2)];
              reg83 <= (+$unsigned(wire73));
              reg84 <= $unsigned((|(((~(8'haa)) ? (8'h9f) : (^~reg82)) ?
                  (!((8'hbe) ? wire74 : wire75)) : (-reg78))));
            end
        end
      else
        begin
          if ($unsigned((~^wire76[(3'h5):(3'h4)])))
            begin
              reg80 <= wire76[(2'h3):(2'h2)];
              reg81 <= reg83;
              reg82 <= ($signed(reg83[(1'h1):(1'h0)]) >= {(8'haf)});
              reg83 <= (!(+(-$unsigned((reg83 ? reg80 : reg77)))));
            end
          else
            begin
              reg80 <= $unsigned($unsigned((&(&(reg83 - reg82)))));
              reg81 <= reg78;
              reg82 <= (~|$signed($unsigned((reg77 ?
                  (reg77 <= wire76) : ((8'haa) ^~ reg77)))));
              reg83 <= wire75;
            end
          reg84 <= (-wire72[(3'h5):(3'h5)]);
          reg85 <= $unsigned(((|{(~^(8'ha9)), (~wire73)}) ?
              wire71[(3'h7):(2'h3)] : $signed(($signed(reg81) ?
                  $signed(wire71) : (|(8'ha1))))));
          reg86 <= $signed($signed($unsigned(($unsigned(wire73) ?
              ((8'ha4) == reg78) : $unsigned(wire72)))));
        end
      reg87 <= reg85;
      reg88 <= (reg85[(2'h3):(1'h0)] < (($unsigned((reg80 ?
              (8'hb8) : reg86)) ^ ({reg82, reg86} ?
              {reg79, (8'hbb)} : (reg87 == wire71))) ?
          $unsigned({(~^reg82)}) : (wire74[(2'h2):(2'h2)] ~^ ((wire76 ?
              wire74 : reg83) < (~wire72)))));
      reg89 <= $signed($signed($signed({(8'hb4)})));
    end
  assign wire90 = reg88[(1'h1):(1'h0)];
  assign wire91 = reg86;
  assign wire92 = reg82;
  assign wire93 = wire73[(1'h1):(1'h1)];
  assign wire94 = wire91;
  assign wire95 = (8'hae);
  assign wire96 = (~|$signed({(((8'hb4) ? reg85 : wire90) ?
                          (~&reg84) : reg80[(3'h5):(1'h1)])}));
  assign wire97 = ($signed((($signed(wire91) != $signed(reg85)) >> (reg84[(3'h6):(3'h5)] * wire74[(2'h2):(1'h0)]))) && $unsigned((wire93 ?
                      wire95 : reg79[(1'h0):(1'h0)])));
  assign wire98 = {reg86[(4'hc):(2'h3)]};
  always
    @(posedge clk) begin
      reg99 <= (~^(wire74[(4'he):(4'he)] ?
          wire72[(3'h6):(3'h4)] : (reg82[(2'h2):(2'h2)] | ((wire96 ?
              reg79 : (8'ha0)) ~^ $signed(wire75)))));
    end
  assign wire100 = $unsigned($signed({$unsigned(wire74[(3'h7):(3'h6)]),
                       (~&(^~reg86))}));
  always
    @(posedge clk) begin
      reg101 <= wire92[(4'he):(2'h2)];
      reg102 <= {$unsigned($unsigned(((reg81 == wire73) ?
              (reg86 ? (8'ha0) : (7'h40)) : ((7'h42) ? wire98 : reg84))))};
      reg103 <= (8'h9f);
      reg104 <= reg81;
      reg105 <= $unsigned(reg77);
    end
  assign wire106 = wire95[(3'h5):(3'h4)];
  assign wire107 = $unsigned((^$unsigned((reg88 != $unsigned(reg101)))));
  assign wire108 = wire106;
  assign wire109 = ((((reg103[(4'ha):(1'h0)] <= (wire106 ? wire96 : wire107)) ?
                           reg101 : $unsigned((&wire95))) ?
                       reg81[(4'h9):(3'h6)] : {wire72,
                           wire100}) & wire71[(4'hc):(3'h4)]);
  assign wire110 = {((wire100[(2'h2):(1'h0)] ?
                               (~&(reg86 <= reg77)) : (((8'hb4) ?
                                       wire76 : wire97) ?
                                   wire106 : wire94)) ?
                           (((wire75 << wire71) > $signed(wire90)) ?
                               reg101[(3'h5):(1'h0)] : wire73[(2'h2):(1'h0)]) : ({((8'h9e) ?
                                       wire93 : wire97),
                                   reg85[(4'h8):(2'h3)]} ?
                               $unsigned(reg101[(2'h3):(2'h3)]) : ((wire100 ?
                                       wire97 : wire71) ?
                                   (wire91 ^ (8'ha8)) : (~(8'hac))))),
                       (&$unsigned($signed((reg87 ? reg82 : wire75))))};
  always
    @(posedge clk) begin
      reg111 <= $unsigned($unsigned(wire109));
      reg112 <= {(^(reg77 ? wire95 : reg85)),
          $signed(((~$unsigned(reg78)) ? (&reg78) : (~|(|wire97))))};
      reg113 <= $signed(reg77[(4'hc):(3'h7)]);
      reg114 <= $unsigned(($unsigned($signed(((8'hb3) == wire93))) ?
          (|(wire106[(1'h1):(1'h0)] >= $unsigned(wire75))) : ($signed($unsigned((8'hb1))) ?
              (-(+reg83)) : ($unsigned(wire93) || wire100[(1'h0):(1'h0)]))));
      reg115 <= ($signed(reg102) ?
          ($unsigned(reg85[(3'h5):(1'h0)]) | (-(wire90[(2'h3):(2'h3)] ?
              ((8'ha5) ? reg114 : reg103) : {reg104}))) : (((^reg99) ?
              (8'ha8) : $signed($unsigned(reg80))) == ({(wire75 ?
                  reg82 : (8'hab))} << $unsigned((^(8'hae))))));
    end
endmodule

module module21
#(parameter param48 = ((8'had) <<< {((~&((8'hbe) ? (8'h9c) : (8'h9c))) <= (^{(8'h9e), (8'hbb)}))}))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire [(4'hd):(1'h0)] wire23;
  input wire signed [(3'h5):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire27 = $signed(wire25[(4'h8):(2'h3)]);
  assign wire28 = $signed((8'hbd));
  assign wire29 = (wire24[(4'hc):(2'h3)] ? wire25 : $signed({(8'ha8), wire22}));
  assign wire30 = (~^$signed(wire26[(5'h10):(4'hd)]));
  always
    @(posedge clk) begin
      reg31 <= (^~($signed($unsigned((-wire25))) ?
          $signed(($signed(wire30) ?
              {wire30, wire24} : (wire22 ? (8'h9c) : (8'ha4)))) : (((+wire23) ?
              {wire25} : $unsigned(wire23)) << ((wire28 ?
              wire23 : wire30) <<< wire23))));
      if ((wire30[(3'h6):(3'h4)] ^~ $unsigned($unsigned($signed($unsigned(wire24))))))
        begin
          reg32 <= ($signed(wire22[(2'h3):(2'h3)]) ?
              {({$signed(wire28), (~wire29)} <= wire30[(4'hc):(4'h9)]),
                  $unsigned($unsigned((reg31 ?
                      reg31 : (8'hae))))} : $signed(wire23[(2'h3):(2'h3)]));
        end
      else
        begin
          reg32 <= wire23;
        end
      if (wire27)
        begin
          reg33 <= wire30[(3'h6):(3'h4)];
          reg34 <= {$signed($signed(wire30[(3'h7):(1'h1)]))};
        end
      else
        begin
          reg33 <= reg33;
        end
    end
  assign wire35 = (~|(+$unsigned(wire29[(2'h3):(1'h0)])));
  assign wire36 = (reg33[(4'ha):(2'h2)] ?
                      ({wire23} > $signed($unsigned((|wire22)))) : ((($unsigned(wire22) >> wire24) ?
                          $signed($unsigned(wire29)) : wire25[(4'hd):(4'hd)]) != $unsigned(wire26[(4'h8):(2'h3)])));
  assign wire37 = reg34;
  assign wire38 = (($unsigned(wire22[(2'h2):(1'h0)]) ^ (~^$signed((^~(8'hb3))))) << ((wire25 & $unsigned((~^reg34))) ?
                      reg32[(2'h3):(2'h2)] : reg34));
  assign wire39 = ($unsigned(($unsigned($signed((8'ha4))) ?
                          {(wire29 != wire29)} : ((&wire38) >= (~wire36)))) ?
                      $unsigned((reg34 ?
                          ((wire24 ? wire37 : wire36) ?
                              wire27 : (^wire25)) : (wire28[(2'h2):(1'h0)] >>> wire23[(4'ha):(4'ha)]))) : $signed(($signed((reg34 >= wire25)) ?
                          {((8'hac) ? reg33 : wire35)} : reg33)));
  assign wire40 = ({wire35} | wire27);
  assign wire41 = $unsigned((wire27[(3'h4):(2'h2)] ?
                      $signed($signed((wire38 >> wire22))) : (((wire28 ?
                              wire29 : wire37) > wire30[(4'h8):(3'h4)]) ?
                          reg31 : ({(8'ha8)} ?
                              (wire36 != wire36) : (reg31 ? wire25 : reg33)))));
  assign wire42 = (reg31 ?
                      (wire36 ^~ wire23[(3'h6):(3'h4)]) : $signed({(wire30 ?
                              {reg31, reg32} : $unsigned(wire35))}));
  assign wire43 = ($unsigned(({wire41} ?
                          ((wire22 >> wire28) >= (|(8'hb8))) : wire23)) ?
                      (-wire39[(1'h0):(1'h0)]) : (~|(|(wire24 ?
                          wire37[(2'h2):(1'h1)] : reg33[(4'hf):(3'h7)]))));
  assign wire44 = $signed((reg34[(3'h5):(2'h3)] && wire36[(4'hb):(3'h7)]));
  assign wire45 = (($unsigned(((wire38 ~^ reg31) ?
                          $unsigned(wire39) : wire43[(4'h8):(2'h2)])) ?
                      (((~^wire28) ~^ wire25[(4'h8):(1'h1)]) > {$unsigned(wire22),
                          (&wire42)}) : {$unsigned($signed(wire44)),
                          $unsigned((wire44 ? (8'hb2) : wire36))}) < wire43);
  assign wire46 = ($signed((((-wire38) || $signed(reg34)) | (8'ha4))) ?
                      (wire39[(3'h4):(1'h0)] != wire41[(1'h1):(1'h1)]) : $signed(reg34[(4'hb):(3'h7)]));
  assign wire47 = $signed($unsigned($signed((8'ha1))));
endmodule
