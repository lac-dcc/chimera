module top
#(parameter param212 = (&(((((8'hba) << (8'hac)) ~^ {(8'ha8), (8'haf)}) ? (-((8'hb9) ? (8'hb7) : (7'h44))) : ((&(8'hb8)) | ((8'hb6) ? (8'hb2) : (8'ha4)))) < ((~^(~(8'ha0))) ? {(|(8'hb9)), (~^(8'ha2))} : ((~&(8'hb6)) ^~ (!(7'h40)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire211;
  wire [(3'h5):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire187;
  wire [(4'h8):(1'h0)] wire189;
  wire [(4'h9):(1'h0)] wire190;
  wire signed [(4'h8):(1'h0)] wire191;
  wire [(3'h4):(1'h0)] wire192;
  wire [(4'hf):(1'h0)] wire207;
  wire signed [(5'h14):(1'h0)] wire208;
  wire signed [(5'h10):(1'h0)] wire209;
  reg [(5'h14):(1'h0)] reg184 = (1'h0);
  reg [(5'h11):(1'h0)] reg183 = (1'h0);
  reg [(5'h13):(1'h0)] reg182 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg [(4'hf):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg179 = (1'h0);
  reg [(4'hf):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg177 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg193 = (1'h0);
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg [(5'h12):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg197 = (1'h0);
  reg [(5'h12):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg199 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg200 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg signed [(4'he):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg204 = (1'h0);
  reg [(3'h5):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg206 = (1'h0);
  assign y = {wire211,
                 wire185,
                 wire176,
                 wire48,
                 wire20,
                 wire16,
                 wire50,
                 wire51,
                 wire174,
                 wire187,
                 wire189,
                 wire190,
                 wire191,
                 wire192,
                 wire207,
                 wire208,
                 wire209,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg19,
                 reg18,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 reg203,
                 reg204,
                 reg205,
                 reg206,
                 (1'h0)};
  module5 #() modinst17 (.y(wire16), .wire8(wire4), .clk(clk), .wire9(wire2), .wire6(wire1), .wire7(wire0));
  always
    @(posedge clk) begin
      reg18 <= wire1[(4'hc):(3'h7)];
      reg19 <= (8'hbc);
    end
  assign wire20 = reg19[(1'h0):(1'h0)];
  module21 #() modinst49 (wire48, clk, wire16, reg18, wire1, wire20);
  assign wire50 = $unsigned(reg19);
  assign wire51 = (~&reg19[(2'h2):(1'h0)]);
  module52 #() modinst175 (wire174, clk, reg18, wire0, wire50, wire4);
  assign wire176 = wire4;
  always
    @(posedge clk) begin
      reg177 <= (~|wire20);
      if ((&$signed(wire50)))
        begin
          reg178 <= $signed(((wire0[(1'h1):(1'h0)] - $signed((wire176 ?
                  wire50 : reg19))) ?
              $signed(((reg177 ~^ reg19) <= {reg19,
                  (8'hb4)})) : wire1[(4'hc):(2'h3)]));
        end
      else
        begin
          reg178 <= wire176;
          if ($unsigned((|{wire4[(4'hd):(1'h1)]})))
            begin
              reg179 <= $signed($signed($unsigned(((&wire2) ?
                  (wire1 >> (8'hba)) : $signed(reg177)))));
              reg180 <= ((wire2 ?
                  (~|(|$signed((8'hae)))) : {(8'hbb)}) * $signed(reg19[(1'h0):(1'h0)]));
              reg181 <= ({$unsigned(reg18[(1'h0):(1'h0)])} ?
                  (~|(~(~^(^~wire4)))) : wire48);
              reg182 <= $signed({(&$signed(wire50[(4'ha):(2'h3)]))});
              reg183 <= wire0;
            end
          else
            begin
              reg179 <= reg182;
              reg180 <= reg179;
              reg181 <= wire48[(4'he):(4'h8)];
              reg182 <= (reg19[(1'h1):(1'h1)] ~^ (|reg180[(1'h1):(1'h1)]));
            end
        end
      reg184 <= {($signed($unsigned($signed(reg178))) ?
              reg19 : (~^(~|(8'hb2))))};
    end
  module134 #() modinst186 (wire185, clk, reg184, wire4, wire2, wire50);
  module134 #() modinst188 (wire187, clk, wire48, reg184, reg178, wire50);
  assign wire189 = wire185;
  assign wire190 = wire4;
  assign wire191 = $unsigned(($unsigned($signed((wire48 ? reg179 : reg181))) ?
                       reg178 : $unsigned(((wire4 ? wire1 : wire1) ?
                           $signed(wire190) : $unsigned((7'h40))))));
  assign wire192 = wire0[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg193 <= (~$signed($signed(reg19[(1'h1):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg194 <= $signed($signed(((~^(~^reg18)) ?
          reg18[(4'hd):(3'h6)] : $unsigned({wire0}))));
      reg195 <= ((~((-$signed(reg178)) ?
          $signed({wire20}) : {$signed(wire1)})) * ($signed((^$signed(reg181))) == (wire1 ?
          $signed((-(8'had))) : {$unsigned(reg181), (-reg179)})));
      reg196 <= (^~(&wire48[(4'he):(2'h3)]));
      if ($unsigned($signed({$signed((wire0 ? reg18 : wire4))})))
        begin
          if ({(($unsigned($unsigned((8'haa))) ?
                      ((!reg184) ? (8'ha1) : $unsigned(wire48)) : (wire174 ?
                          reg184 : (reg18 ? wire187 : wire16))) ?
                  wire50[(5'h12):(3'h6)] : (-$unsigned({wire185, reg180})))})
            begin
              reg197 <= (($unsigned((~&(~|reg193))) ?
                  $signed(wire190[(3'h4):(2'h3)]) : ($unsigned((reg194 >>> reg195)) ?
                      {(reg178 ? reg179 : wire190),
                          $signed(wire3)} : wire176)) >> (!(^~wire0)));
              reg198 <= (!{reg182,
                  (($unsigned(reg195) ?
                      wire0[(3'h7):(3'h7)] : $signed(wire4)) >= ((8'had) ?
                      (wire48 ? wire0 : wire48) : $signed(reg181)))});
              reg199 <= (wire51[(4'he):(2'h2)] > reg193[(4'hc):(3'h6)]);
            end
          else
            begin
              reg197 <= $unsigned($unsigned(($unsigned((reg184 ?
                      wire191 : wire50)) ?
                  $unsigned((^wire176)) : $signed((7'h41)))));
              reg198 <= ($signed($signed($unsigned(reg199[(2'h2):(1'h1)]))) << ($unsigned(((wire1 >>> (8'ha5)) ^ $signed(reg19))) != $signed(reg180[(4'h8):(1'h1)])));
              reg199 <= ((((-(wire190 ~^ reg179)) != wire2[(1'h1):(1'h1)]) ?
                      reg177[(3'h5):(2'h3)] : $signed((!(reg182 ?
                          reg197 : reg198)))) ?
                  reg199 : ((^~($unsigned(wire20) ?
                      (reg183 ?
                          wire20 : (8'hbf)) : $signed((7'h40)))) & $signed((8'hbe))));
              reg200 <= (+$signed($unsigned($unsigned((wire189 && reg199)))));
            end
          reg201 <= (reg182 * {reg179[(2'h2):(2'h2)],
              (&(wire48[(2'h2):(1'h0)] <<< (wire191 ? reg19 : wire190)))});
          if (wire191[(1'h1):(1'h0)])
            begin
              reg202 <= $signed({{{wire20[(4'ha):(4'h8)], (reg198 - wire50)},
                      wire20},
                  (((wire16 >= wire16) ?
                      (8'ha4) : $signed((8'haa))) << wire2[(2'h3):(2'h2)])});
              reg203 <= (~(wire1[(1'h0):(1'h0)] == wire51));
              reg204 <= wire0;
              reg205 <= reg195[(4'hf):(3'h6)];
              reg206 <= ({($signed(wire174[(2'h3):(1'h0)]) ?
                      $signed({reg203}) : $signed((^(8'ha7)))),
                  ((wire185 >= $signed(wire50)) ?
                      $signed((8'hbb)) : $unsigned(((8'hac) * wire187)))} ^~ (reg203 ?
                  reg177 : (~&$signed((wire50 ? (8'h9f) : wire1)))));
            end
          else
            begin
              reg202 <= reg180[(4'h8):(2'h3)];
              reg203 <= reg180;
            end
        end
      else
        begin
          reg197 <= (~|(8'hae));
          if ($signed($signed($unsigned((wire189 ^~ (wire2 ?
              (8'h9c) : (8'hb0)))))))
            begin
              reg198 <= reg178;
              reg199 <= $signed($signed($signed((-$unsigned(wire0)))));
            end
          else
            begin
              reg198 <= reg201[(3'h7):(3'h5)];
              reg199 <= $signed(wire48);
              reg200 <= $unsigned($unsigned(reg194));
              reg201 <= $signed($unsigned((~{$unsigned(wire190),
                  ((8'ha8) ? reg182 : wire0)})));
              reg202 <= (^~$signed({($signed((8'ha1)) ?
                      $unsigned((8'hb5)) : reg205[(3'h4):(3'h4)]),
                  wire185}));
            end
          reg203 <= wire176[(1'h0):(1'h0)];
          reg204 <= (^wire174[(2'h2):(1'h0)]);
          reg205 <= $signed((7'h43));
        end
    end
  assign wire207 = reg204;
  assign wire208 = ($unsigned(reg179[(1'h0):(1'h0)]) - $signed(wire176[(1'h1):(1'h1)]));
  module5 #() modinst210 (.wire6(reg194), .clk(clk), .wire9(wire191), .wire8(wire174), .y(wire209), .wire7(wire3));
  assign wire211 = $signed({((wire20 < wire207) >>> (^~{reg200, wire185}))});
endmodule

module module52
#(parameter param172 = (({(~^(^~(8'haf))), (~^((8'hbc) ? (8'hb0) : (8'ha4)))} ~^ ((((8'hb4) ? (8'hb1) : (8'haf)) ^ (+(8'hb0))) ? (|(^(8'ha0))) : (((7'h43) + (8'haa)) ~^ (8'ha8)))) != ((+{((8'hb7) > (8'hb1)), (&(8'haf))}) == (((^(8'hbe)) ? {(8'hb6)} : ((8'ha4) == (8'hbf))) ? ({(8'hbe)} < ((8'hbc) >= (8'ha2))) : (((8'h9d) <<< (8'h9e)) <= ((8'h9d) ? (8'ha9) : (8'hb1)))))), 
parameter param173 = param172)
(y, clk, wire53, wire54, wire55, wire56);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire53;
  input wire signed [(5'h13):(1'h0)] wire54;
  input wire signed [(4'he):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire170;
  wire signed [(4'hc):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire115;
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  assign y = {wire170,
                 wire133,
                 wire132,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire66,
                 wire67,
                 wire74,
                 wire75,
                 wire76,
                 wire115,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire56[(3'h4):(3'h4)] - (~|((((8'h9e) - wire56) ?
              {wire56, wire55} : (wire53 ? wire53 : wire55)) ?
          ((wire53 > wire56) >> (~|wire55)) : wire55[(3'h4):(3'h4)]))))
        begin
          reg57 <= wire56;
          reg58 <= ((8'ha0) ? {wire56[(1'h0):(1'h0)], wire54} : reg57);
        end
      else
        begin
          reg57 <= (($signed($signed({wire53,
                  wire54})) == $signed((wire55[(4'ha):(3'h4)] ?
                  (reg57 != (8'haa)) : (8'had)))) ?
              ({$signed({wire54, (7'h44)}), (|$signed((8'hbc)))} ?
                  $signed((~(~|(8'hb3)))) : $unsigned(reg58)) : reg57[(4'h8):(3'h7)]);
          if (wire55[(3'h4):(2'h3)])
            begin
              reg58 <= (wire56 ?
                  (((^~{reg58, wire55}) && $unsigned((wire53 < reg58))) ?
                      reg57[(2'h3):(2'h3)] : (^wire53)) : wire53[(2'h2):(1'h1)]);
              reg59 <= (($unsigned($unsigned($unsigned(wire56))) < (-wire54[(4'hb):(4'h8)])) >> $signed(wire56[(1'h1):(1'h0)]));
            end
          else
            begin
              reg58 <= $signed({(|((!wire54) | $signed(wire54))),
                  ((8'hbb) > ({wire54, reg57} >= (reg59 >>> (8'ha7))))});
              reg59 <= ((8'h9f) ^ (~&$signed(reg57)));
            end
          reg60 <= $signed(((reg58 ?
              (8'h9c) : $signed($unsigned(wire55))) < reg58[(3'h4):(1'h0)]));
          if ($signed($unsigned((!$signed((reg57 | (8'ha4)))))))
            begin
              reg61 <= reg59[(4'hd):(4'ha)];
              reg62 <= reg59[(4'h8):(3'h5)];
              reg63 <= $unsigned((~&$unsigned(reg62)));
            end
          else
            begin
              reg61 <= ((((+$signed(reg60)) ? wire55 : wire53[(2'h2):(1'h0)]) ?
                  wire55[(2'h3):(1'h0)] : (~wire56)) * $signed($signed(reg57[(1'h0):(1'h0)])));
              reg62 <= ((~wire55[(3'h4):(1'h0)]) ?
                  $signed((wire55 || (~^(wire55 ~^ (7'h43))))) : (reg63[(2'h2):(1'h0)] <<< reg62[(3'h5):(1'h1)]));
              reg63 <= (wire53[(2'h2):(1'h1)] ? wire56 : reg61);
              reg64 <= wire53[(2'h3):(1'h0)];
              reg65 <= reg62[(4'he):(1'h1)];
            end
        end
    end
  assign wire66 = ((~^(&(~(reg61 ^~ reg58)))) ?
                      ((!reg58) ?
                          $signed($unsigned((wire54 | reg63))) : ($unsigned(reg61[(4'h9):(3'h4)]) & reg65[(3'h4):(3'h4)])) : wire55);
  assign wire67 = wire66[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (reg58)
        begin
          reg68 <= (reg64 != reg64);
          reg69 <= (~|$unsigned(wire55[(3'h4):(2'h3)]));
          reg70 <= wire53;
          reg71 <= ((8'haa) & $unsigned(reg61));
        end
      else
        begin
          reg68 <= reg62;
        end
      reg72 <= (($signed(reg70[(2'h2):(1'h1)]) ?
              (|$unsigned((7'h42))) : $unsigned({((8'hb7) ~^ reg68),
                  {reg64}})) ?
          {$signed((~^((8'hb5) ? wire67 : wire56)))} : (&reg60[(3'h4):(2'h2)]));
      reg73 <= (reg71 < reg65[(2'h3):(2'h2)]);
    end
  assign wire74 = reg63;
  assign wire75 = ((wire53 << wire54[(2'h2):(1'h1)]) >= $signed((wire56 ?
                      {(+(7'h43))} : wire53[(1'h1):(1'h1)])));
  assign wire76 = reg57;
  module77 #() modinst116 (.wire81(reg57), .wire80(wire67), .wire82(reg69), .wire79(reg60), .y(wire115), .wire78(reg70), .clk(clk));
  assign wire117 = reg59;
  assign wire118 = $signed(reg68);
  assign wire119 = reg61;
  assign wire120 = wire75;
  assign wire121 = {(~^(reg70[(4'hd):(4'ha)] ?
                           (wire75[(5'h12):(3'h4)] | (wire76 << wire119)) : ((^~wire66) >> $signed(reg63)))),
                       (~^$signed((reg73 ~^ $signed((8'hbb)))))};
  always
    @(posedge clk) begin
      reg122 <= (((-($signed(wire118) > $unsigned(wire117))) ?
              reg58[(3'h6):(3'h4)] : $signed($signed((^(8'ha9))))) ?
          wire54[(3'h7):(3'h7)] : (reg62[(3'h7):(3'h4)] > (~&$signed((reg59 & wire56)))));
      if ((&$unsigned((~^reg73[(3'h5):(3'h4)]))))
        begin
          reg123 <= reg58[(1'h0):(1'h0)];
          reg124 <= {(~(^wire56[(2'h3):(1'h0)])), wire119[(2'h3):(1'h0)]};
          reg125 <= {reg69[(4'h8):(3'h5)]};
          if ($unsigned((!(~|wire120))))
            begin
              reg126 <= wire76[(2'h2):(1'h0)];
              reg127 <= reg58[(4'hb):(1'h1)];
              reg128 <= ((~^(^wire76)) ?
                  (wire54[(4'hc):(4'h8)] ?
                      $unsigned(reg126) : (wire119[(3'h6):(3'h6)] ?
                          {(-reg124)} : {$signed(wire117),
                              $unsigned(wire120)})) : (8'ha5));
            end
          else
            begin
              reg126 <= reg123[(4'hb):(3'h6)];
              reg127 <= ((reg60[(3'h5):(3'h5)] ?
                  wire76[(2'h2):(2'h2)] : $signed(((&reg63) == $signed(wire119)))) + (reg64[(1'h1):(1'h1)] ?
                  $signed({(reg122 ? reg70 : wire76)}) : (~^$signed((reg126 ?
                      reg127 : wire115)))));
              reg128 <= (&$unsigned($signed($signed({reg65, (8'hab)}))));
            end
          reg129 <= (wire76[(2'h3):(2'h2)] | $unsigned(reg57));
        end
      else
        begin
          if (({reg69[(3'h7):(2'h2)],
                  ($unsigned((wire75 <= wire54)) > reg129[(1'h1):(1'h1)])} ?
              (reg128 ?
                  $unsigned($signed((~|wire120))) : $unsigned(((wire54 <<< (8'hb9)) && (reg128 ?
                      wire66 : reg68)))) : ((^~$signed($signed(wire119))) ?
                  (reg127[(3'h4):(3'h4)] ?
                      reg126 : ((reg59 ? reg129 : wire118) ?
                          reg125[(1'h0):(1'h0)] : $unsigned(reg65))) : ((reg73 * (!reg57)) || $unsigned({wire75})))))
            begin
              reg123 <= reg126[(1'h0):(1'h0)];
              reg124 <= ((reg60[(3'h6):(2'h3)] * (reg73[(3'h7):(3'h6)] << reg127)) ?
                  (~|$signed(($unsigned(reg125) ?
                      $unsigned(reg124) : $signed((8'ha9))))) : $unsigned({(reg60 + $signed((8'ha3))),
                      wire55[(3'h5):(2'h2)]}));
            end
          else
            begin
              reg123 <= (^~reg64);
              reg124 <= (~|($unsigned(((wire66 << reg64) ?
                      (~^(8'hbe)) : (reg69 ? wire66 : reg73))) ?
                  reg65 : $signed((wire118 ?
                      $unsigned(reg63) : $unsigned(reg72)))));
              reg125 <= $unsigned($signed((((reg63 - reg123) ?
                      (~reg63) : $unsigned((8'ha2))) ?
                  reg69 : reg68[(4'h9):(3'h6)])));
              reg126 <= reg125;
              reg127 <= ((reg65 ?
                      ($signed(reg59) ?
                          (!(wire53 ?
                              wire67 : reg64)) : wire54[(4'he):(4'ha)]) : (wire120[(4'hf):(3'h6)] >> ((^~wire55) == {(8'hb0),
                          reg128}))) ?
                  $unsigned($unsigned(({wire119} && (wire53 >> wire67)))) : reg72);
            end
          reg128 <= reg60[(3'h4):(2'h2)];
          if (reg122[(3'h7):(3'h4)])
            begin
              reg129 <= (~&$unsigned(({reg68} ?
                  ((wire55 & reg57) ^ (wire76 ? (8'ha6) : reg70)) : wire53)));
            end
          else
            begin
              reg129 <= wire117[(3'h6):(1'h1)];
              reg130 <= $unsigned($signed($signed($signed({reg73}))));
              reg131 <= (~&wire56[(2'h2):(2'h2)]);
            end
        end
    end
  assign wire132 = (reg123[(4'hb):(4'h8)] ? {{wire74}} : wire56);
  assign wire133 = (reg72 ^ wire55[(4'h9):(2'h3)]);
  module134 #() modinst171 (wire170, clk, reg125, reg71, wire115, wire54);
endmodule

module module21
#(parameter param46 = {{({((8'ha2) != (8'hb1))} <<< (8'hab)), (+((~(8'ha3)) <= (8'h9c)))}}, 
parameter param47 = (({param46} && param46) || (param46 || param46)))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire25;
  input wire [(5'h10):(1'h0)] wire24;
  input wire [(4'h9):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg45,
                 reg44,
                 reg43,
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
                 (1'h0)};
  assign wire26 = $signed((~&(wire23 ?
                      (!(wire24 ? wire24 : wire23)) : $unsigned({wire22}))));
  assign wire27 = $signed({$unsigned($unsigned((|wire25)))});
  assign wire28 = ($signed($signed($unsigned(wire24[(3'h7):(3'h4)]))) ?
                      ($unsigned((~&wire22[(3'h7):(3'h7)])) ?
                          wire24 : $signed(($signed(wire23) ?
                              (~^wire25) : $signed((8'hb1))))) : $signed({((wire27 <= wire25) ?
                              wire25[(4'h8):(1'h1)] : (wire23 ~^ wire24)),
                          ($signed(wire22) ? (~&wire23) : {(8'hbe)})}));
  assign wire29 = (wire25 ?
                      ((8'hb5) ?
                          $signed((8'hb6)) : wire28) : {$signed((~|wire22)),
                          {(8'had)}});
  assign wire30 = (wire28 - $unsigned({(+wire25[(2'h2):(1'h1)]),
                      wire29[(3'h6):(2'h2)]}));
  assign wire31 = (wire29[(3'h5):(2'h3)] ?
                      {wire29[(2'h3):(2'h2)],
                          (^((^~wire29) && $unsigned((8'hac))))} : ((^~((wire28 ?
                          wire22 : wire25) && $unsigned((8'hb9)))) & wire28));
  assign wire32 = ((|$signed($signed((~&wire22)))) * ($signed($signed(wire28)) ?
                      (~^{{(8'ha3), wire30}}) : wire26[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg33 <= $signed($signed(((+(8'hbe)) && wire25[(5'h12):(4'he)])));
      reg34 <= wire30;
      if (reg33[(3'h5):(3'h4)])
        begin
          reg35 <= $signed($signed($signed(wire22)));
          reg36 <= ({$signed((~|$unsigned(wire31)))} > ({{reg34}} ^ ({(&wire31)} & (wire31[(4'h9):(4'h9)] ?
              (8'hb2) : ((8'haa) & wire31)))));
          reg37 <= {$signed((8'hac))};
          reg38 <= (wire23[(1'h1):(1'h0)] ?
              {reg36[(3'h6):(1'h1)], wire30} : ($signed(wire24[(4'ha):(3'h4)]) ?
                  $signed(wire23[(3'h5):(2'h3)]) : $signed($signed((wire22 ?
                      wire32 : (7'h43))))));
        end
      else
        begin
          reg35 <= (~&($unsigned(($signed((8'ha8)) ? (-wire24) : (8'hb7))) ?
              reg34[(3'h6):(3'h6)] : ($signed(((8'hb0) >>> wire22)) ?
                  $signed((wire32 <<< wire23)) : (|{wire23}))));
          reg36 <= $unsigned((7'h43));
          reg37 <= ($signed((~^(((8'ha0) << wire26) | $signed(wire31)))) >> $signed($signed(wire30[(1'h0):(1'h0)])));
          reg38 <= ((|(((reg33 | wire25) && reg34) ?
              $signed($unsigned((7'h43))) : ((wire27 ?
                  wire26 : (8'ha4)) & (wire32 ?
                  wire25 : wire32)))) >>> (reg37[(1'h1):(1'h0)] >= (-{reg37,
              (~&reg35)})));
          reg39 <= wire24;
        end
    end
  always
    @(posedge clk) begin
      reg40 <= $unsigned($unsigned((^reg33)));
      if ($unsigned({reg37}))
        begin
          reg41 <= (reg40[(3'h7):(1'h0)] <= ({$signed(reg35[(4'hc):(4'h8)]),
                  ($signed(reg35) ? (~&(8'hb5)) : $unsigned(reg36))} ?
              $unsigned(wire25[(1'h0):(1'h0)]) : (~&(((8'ha0) ?
                      wire29 : reg35) ?
                  (|wire25) : (wire22 ? reg37 : wire28)))));
          if ($signed(wire22[(3'h5):(3'h4)]))
            begin
              reg42 <= $signed($signed(((&(reg40 ~^ wire31)) << wire27)));
              reg43 <= wire27;
            end
          else
            begin
              reg42 <= ((!(&reg41)) ?
                  (({{reg40, reg35}, (reg37 < (8'hae))} & {(reg38 ^ reg37),
                          $signed((7'h42))}) ?
                      ($unsigned(wire31[(4'ha):(3'h5)]) << wire29) : wire23[(1'h1):(1'h0)]) : {($unsigned((wire32 * wire27)) ?
                          wire31[(3'h6):(2'h2)] : $signed(wire24))});
              reg43 <= reg37[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg41 <= {$signed($unsigned(wire26))};
          reg42 <= wire32[(3'h7):(3'h5)];
        end
      reg44 <= wire23[(4'h9):(1'h1)];
      reg45 <= (((($unsigned(wire27) <= (~&reg44)) ^~ ((reg37 >= wire32) != wire27[(4'h8):(4'h8)])) >> ({(reg42 ?
              wire25 : reg40)} << ((wire31 ^~ (8'hb4)) || $unsigned(wire22)))) & $signed(reg38));
    end
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  assign y = {wire15, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = {wire7[(1'h1):(1'h1)]};
  assign wire11 = {{({$signed(wire8)} - ({wire6} ?
                              {(8'hba), (8'hbe)} : (wire9 || wire7))),
                          ((wire6[(3'h4):(2'h3)] ?
                              $unsigned(wire6) : wire6[(1'h0):(1'h0)]) | $signed(wire8[(2'h3):(2'h2)]))}};
  assign wire12 = wire8[(4'h9):(1'h1)];
  assign wire13 = ((8'ha5) - ((|(-$unsigned((8'hb4)))) ?
                      (&wire9[(3'h5):(3'h4)]) : $unsigned(({wire6,
                          wire10} == $unsigned(wire12)))));
  assign wire14 = $signed((~wire9[(1'h1):(1'h1)]));
  assign wire15 = wire8[(2'h2):(2'h2)];
endmodule

module module134  (y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire138;
  input wire signed [(5'h14):(1'h0)] wire137;
  input wire [(3'h7):(1'h0)] wire136;
  input wire signed [(5'h13):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire169;
  wire signed [(2'h3):(1'h0)] wire168;
  wire [(5'h11):(1'h0)] wire167;
  wire signed [(2'h2):(1'h0)] wire166;
  wire [(3'h6):(1'h0)] wire165;
  wire [(2'h3):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire163;
  wire [(2'h3):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg160 = (1'h0);
  reg [(5'h10):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
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
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire139 = (~$unsigned(wire137));
  assign wire140 = $unsigned(wire137);
  assign wire141 = (7'h44);
  assign wire142 = wire141[(5'h11):(1'h0)];
  assign wire143 = ($signed($signed($unsigned(wire135))) ?
                       (~(~|((~^wire136) != wire141))) : ((^((wire135 ?
                               wire141 : wire141) ?
                           wire142[(2'h3):(1'h0)] : wire140[(1'h0):(1'h0)])) >= (wire137 ?
                           ($unsigned(wire140) ?
                               $unsigned(wire141) : wire139) : $unsigned(((8'ha7) ?
                               wire137 : wire139)))));
  assign wire144 = ((^{wire142[(1'h1):(1'h1)], (-wire140)}) ?
                       $signed({wire137[(4'h9):(3'h6)]}) : $signed({{wire143[(1'h0):(1'h0)]}}));
  always
    @(posedge clk) begin
      reg145 <= {wire144};
      if (wire142[(1'h0):(1'h0)])
        begin
          reg146 <= $unsigned(wire137);
          reg147 <= reg146;
        end
      else
        begin
          reg146 <= wire137[(5'h12):(5'h12)];
          reg147 <= wire142;
          reg148 <= wire139;
        end
      if (wire142[(2'h3):(1'h1)])
        begin
          reg149 <= (8'haf);
          reg150 <= $unsigned($signed({(~^wire140[(1'h0):(1'h0)])}));
          reg151 <= (({$unsigned((reg147 >>> wire136)),
                  wire136[(1'h0):(1'h0)]} ?
              ((8'hae) ?
                  {{reg148, wire140}} : (wire144[(2'h3):(2'h3)] ?
                      (wire137 == reg145) : wire144[(1'h1):(1'h0)])) : ($signed(((8'hb9) ?
                      reg149 : wire138)) ?
                  $unsigned((8'hbb)) : reg146)) * $signed(wire141));
          reg152 <= (wire144 ?
              $unsigned($unsigned($signed($signed(reg149)))) : $signed(wire141[(5'h12):(4'h9)]));
          reg153 <= $unsigned($unsigned($signed(wire140[(5'h12):(4'hd)])));
        end
      else
        begin
          reg149 <= $unsigned(wire138);
          reg150 <= ($signed(reg146[(4'ha):(3'h5)]) - (($unsigned({reg145}) ?
                  $unsigned((wire137 || reg149)) : (~^reg153[(4'h8):(2'h3)])) ?
              ($signed(wire139[(4'h8):(4'h8)]) ?
                  wire143[(2'h2):(1'h1)] : ($unsigned(wire139) ?
                      ((8'hb5) ? wire136 : (8'ha9)) : (reg146 ?
                          wire140 : reg147))) : wire137));
          if (reg146[(4'ha):(4'ha)])
            begin
              reg151 <= (8'ha8);
            end
          else
            begin
              reg151 <= reg151[(3'h6):(1'h1)];
              reg152 <= $signed($signed($unsigned({(8'ha6)})));
              reg153 <= ($unsigned((($signed((8'hb5)) ?
                          (~|wire138) : (&wire135)) ?
                      {wire138} : ({reg145} ?
                          (reg145 ? wire139 : wire143) : reg145))) ?
                  (|reg146) : $signed($signed((8'ha4))));
              reg154 <= (^(($unsigned((~|reg149)) ?
                  reg149[(3'h5):(2'h3)] : (~$unsigned((8'hb9)))) ~^ reg148));
              reg155 <= wire144;
            end
          reg156 <= {(&{reg153[(4'hb):(4'h9)],
                  (reg146[(4'hd):(3'h7)] ?
                      $unsigned(wire137) : (reg154 ? wire144 : reg147))})};
          if (wire135)
            begin
              reg157 <= $unsigned((wire142 && reg145));
              reg158 <= wire142;
              reg159 <= {({((reg151 ? reg154 : reg152) << (reg150 < wire137)),
                          $unsigned($unsigned(reg147))} ?
                      (!(wire138[(2'h3):(1'h0)] ?
                          $signed(reg149) : $signed(wire139))) : $unsigned(((reg156 ?
                          (8'ha8) : wire138) <<< (reg154 ? wire136 : reg151)))),
                  reg153};
              reg160 <= reg147[(4'h8):(2'h2)];
            end
          else
            begin
              reg157 <= ($unsigned($signed(({reg147} <= reg156[(1'h1):(1'h1)]))) ?
                  $signed($unsigned((!$unsigned(reg159)))) : {reg157});
              reg158 <= ($unsigned($signed($unsigned($unsigned(reg145)))) ?
                  (reg153 ?
                      reg148[(3'h5):(2'h3)] : ((^~reg147[(1'h0):(1'h0)]) << wire139)) : (($unsigned((reg154 ?
                      (8'ha1) : reg148)) >= reg145[(2'h3):(1'h0)]) != reg147[(3'h7):(3'h4)]));
            end
        end
      reg161 <= reg145[(4'hc):(2'h3)];
      reg162 <= reg155;
    end
  assign wire163 = (^reg157[(2'h2):(1'h0)]);
  assign wire164 = $signed(reg152);
  assign wire165 = wire144[(2'h3):(2'h2)];
  assign wire166 = (+reg157);
  assign wire167 = (-(~|($signed((&reg161)) ?
                       {(reg151 >= reg155), reg158} : $unsigned((~|reg154)))));
  assign wire168 = (((8'hb9) ?
                       $signed((reg159[(4'hb):(4'h8)] ?
                           (8'haf) : reg150[(4'hf):(4'hf)])) : ($signed(((8'had) & reg151)) ?
                           reg149 : (reg151[(2'h3):(1'h1)] ^ $signed(wire166)))) - (+(($signed(reg161) > $signed(reg160)) ?
                       $unsigned(((8'hb3) ?
                           reg154 : wire164)) : $signed($signed(reg156)))));
  assign wire169 = reg146;
endmodule

module module77  (y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire82;
  input wire signed [(4'hf):(1'h0)] wire81;
  input wire signed [(2'h2):(1'h0)] wire80;
  input wire signed [(4'h9):(1'h0)] wire79;
  input wire [(5'h14):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire83;
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  assign y = {wire114,
                 wire105,
                 wire104,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 reg84,
                 (1'h0)};
  assign wire83 = (8'ha0);
  always
    @(posedge clk) begin
      reg84 <= wire83;
    end
  assign wire85 = wire82;
  assign wire86 = wire78[(4'hc):(3'h7)];
  assign wire87 = (wire79[(4'h9):(4'h9)] ?
                      $unsigned($signed(wire81)) : $signed((~^$signed((wire78 ?
                          wire85 : wire82)))));
  assign wire88 = wire78[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg89 <= reg84[(3'h4):(2'h3)];
      if ((wire78 ?
          $unsigned({(~&(wire80 ? wire79 : reg89)),
              $signed((!(8'ha1)))}) : $signed(($signed(wire85[(2'h3):(2'h3)]) ?
              wire88 : ($unsigned((8'ha4)) & $signed(wire87))))))
        begin
          if (wire79)
            begin
              reg90 <= wire82[(4'hc):(4'h8)];
              reg91 <= (($unsigned(({wire81} ? {wire88} : {(8'h9d)})) ?
                      ($signed($signed(wire81)) ~^ ((reg84 & wire78) && $unsigned(wire88))) : ($unsigned($signed(wire80)) ?
                          ($signed(wire80) ~^ wire87) : wire82)) ?
                  wire88[(2'h2):(1'h1)] : $unsigned($signed((wire78[(4'hc):(4'h8)] ^~ (~^wire80)))));
              reg92 <= $signed($unsigned(reg89[(4'hb):(4'h9)]));
              reg93 <= reg92;
            end
          else
            begin
              reg90 <= (^(wire83 & wire79));
              reg91 <= (^~{{{$signed(reg84)}, wire81}});
              reg92 <= $unsigned((|((wire80[(1'h0):(1'h0)] ^ {wire83}) == {$unsigned(wire83)})));
              reg93 <= $unsigned(wire81);
              reg94 <= $unsigned((~^(^((~|wire88) ?
                  (wire85 ? (8'ha3) : wire82) : reg89[(4'h9):(4'h9)]))));
            end
          reg95 <= (wire81 ?
              wire87[(3'h7):(1'h1)] : $unsigned(wire83[(3'h6):(1'h0)]));
          if ($signed($unsigned(reg89[(1'h1):(1'h1)])))
            begin
              reg96 <= {(&(&wire80)), (~wire82)};
              reg97 <= ($signed(wire88) <<< reg92[(4'hd):(3'h5)]);
            end
          else
            begin
              reg96 <= $signed({reg91[(3'h7):(3'h7)]});
              reg97 <= (^reg89[(1'h0):(1'h0)]);
              reg98 <= ((wire86 ?
                  $unsigned({$unsigned(reg93),
                      $unsigned(wire81)}) : ($signed((reg84 ? wire79 : reg92)) ?
                      ($signed(wire80) ?
                          $signed((8'hb4)) : (reg95 <<< wire83)) : {{reg89,
                              reg97},
                          (^reg97)})) >= $signed($unsigned($signed((8'haa)))));
              reg99 <= $signed(($unsigned((wire78 >= $unsigned(reg98))) >>> reg90));
            end
          reg100 <= reg92[(4'hc):(4'hc)];
          reg101 <= {$signed($signed($unsigned((reg91 ? reg96 : reg98)))),
              wire87};
        end
      else
        begin
          if ((wire82 <<< $signed($signed(reg93[(3'h7):(2'h3)]))))
            begin
              reg90 <= reg98[(1'h1):(1'h1)];
              reg91 <= (|wire78[(4'he):(4'h8)]);
              reg92 <= (reg95[(2'h2):(1'h1)] * (^$signed($unsigned((reg93 ^ wire85)))));
              reg93 <= {(reg95[(5'h12):(5'h11)] ?
                      $signed(($signed(wire85) ?
                          wire80 : $unsigned(reg100))) : (|((wire85 ?
                              reg98 : reg94) ?
                          {reg97} : (wire85 ? reg99 : reg98))))};
              reg94 <= $unsigned(wire88[(1'h0):(1'h0)]);
            end
          else
            begin
              reg90 <= {{wire80[(1'h1):(1'h0)], reg91}};
            end
          if (({($signed((reg95 ^~ reg100)) >> {(reg89 ^~ reg91),
                      (wire85 | reg90)}),
                  $signed((^wire78))} ?
              $unsigned(((8'ha5) ?
                  (&wire82[(4'hf):(4'hf)]) : (8'ha5))) : {(8'hbe)}))
            begin
              reg95 <= reg94;
            end
          else
            begin
              reg95 <= (8'hb0);
              reg96 <= (wire85[(1'h1):(1'h0)] ?
                  wire82[(2'h3):(2'h2)] : ((reg93[(3'h5):(1'h1)] > ((reg101 ?
                          reg94 : wire80) || reg97)) ?
                      {($unsigned(reg95) ? (wire83 >>> wire86) : reg100),
                          ($signed(wire88) ?
                              $signed((8'hb8)) : reg96[(3'h4):(3'h4)])} : (($unsigned((8'ha1)) | reg89) ?
                          (reg94[(1'h0):(1'h0)] ?
                              (reg97 ^ (8'ha2)) : reg92) : (8'hb5))));
              reg97 <= wire78;
              reg98 <= wire83[(3'h6):(3'h5)];
              reg99 <= ($unsigned(wire81) ?
                  ($signed((+(~wire82))) != $unsigned((~&(7'h41)))) : $signed($signed({{wire79}})));
            end
          if (($signed(wire80[(1'h1):(1'h1)]) ?
              $signed((reg84 ?
                  $signed($signed(reg91)) : reg92[(4'h9):(4'h9)])) : $signed((^~wire88))))
            begin
              reg100 <= (8'ha2);
              reg101 <= $signed($signed(reg94[(3'h4):(2'h2)]));
            end
          else
            begin
              reg100 <= $unsigned((^~wire87));
            end
        end
      reg102 <= $signed((~&(reg101[(2'h3):(1'h1)] ?
          $signed({reg89, wire86}) : $signed(reg94))));
    end
  always
    @(posedge clk) begin
      reg103 <= ($unsigned((8'hbc)) + (&(reg92 ?
          ((wire81 < reg84) ?
              (reg98 | reg97) : (wire85 * reg96)) : $unsigned((~|(8'hbf))))));
    end
  assign wire104 = reg102;
  assign wire105 = ((8'hb6) >> ((-($signed(reg98) < (reg101 > reg98))) + $signed($unsigned(wire85))));
  always
    @(posedge clk) begin
      if ($unsigned((~|wire87[(4'h8):(3'h4)])))
        begin
          reg106 <= (wire78[(4'h9):(3'h7)] <= ((reg93[(4'hc):(1'h0)] ?
                  (|(~^(7'h44))) : wire105) ?
              ((7'h41) * reg90[(4'h9):(3'h4)]) : reg101[(1'h0):(1'h0)]));
          reg107 <= (|reg93[(3'h5):(3'h4)]);
          reg108 <= wire80;
          reg109 <= wire88;
        end
      else
        begin
          reg106 <= wire80;
          if ({$unsigned($signed((~|$signed(reg92)))),
              $unsigned($signed((8'hb7)))})
            begin
              reg107 <= (+reg91[(4'hd):(4'ha)]);
              reg108 <= $signed($unsigned({(8'had),
                  $unsigned((wire105 <<< (8'ha4)))}));
              reg109 <= $unsigned($unsigned((~|((reg101 || (8'had)) - (~&wire79)))));
              reg110 <= ($signed($unsigned($unsigned((wire104 ?
                      reg103 : wire83)))) ?
                  (reg96[(3'h5):(1'h0)] * reg107) : $signed($unsigned({reg94})));
              reg111 <= ((!{wire88}) ?
                  (reg102 * (!$signed($unsigned(wire86)))) : ((((reg94 * (8'ha4)) ?
                              (wire104 <<< wire104) : (8'haf)) ?
                          (^~wire82) : reg103) ?
                      {wire104[(1'h1):(1'h0)], reg109} : (($signed(reg91) ?
                          (reg108 ?
                              wire87 : reg89) : (&reg101)) ~^ $unsigned(((8'ha6) ?
                          reg109 : (8'hb2))))));
            end
          else
            begin
              reg107 <= $signed(wire82[(1'h1):(1'h1)]);
              reg108 <= ($unsigned(($signed((wire78 ? (8'hb1) : reg91)) ?
                  ($signed(reg92) > wire81[(4'he):(3'h4)]) : $signed((^(8'ha4))))) != wire78[(4'ha):(3'h4)]);
              reg109 <= $unsigned(((~|(wire82[(2'h3):(1'h0)] ~^ {reg103,
                  wire83})) & $unsigned(($signed(reg94) ?
                  (wire81 ^~ reg95) : {wire78, reg94}))));
              reg110 <= (reg100 ?
                  (reg103 >>> (($unsigned(reg90) << (~&reg100)) ^~ (~&{reg101}))) : $signed(((&(~reg110)) ^~ reg94[(2'h2):(1'h1)])));
            end
          reg112 <= reg91[(5'h15):(4'hc)];
        end
      reg113 <= (($signed(wire88) <= ($unsigned((wire88 < reg106)) ?
              reg84 : reg99)) ?
          wire85 : wire86);
    end
  assign wire114 = ((~&wire87) ?
                       $signed($signed($unsigned(wire88[(1'h0):(1'h0)]))) : (reg112 >> reg95));
endmodule
