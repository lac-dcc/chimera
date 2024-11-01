module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire163;
  wire signed [(3'h4):(1'h0)] wire164;
  wire signed [(2'h2):(1'h0)] wire166;
  wire signed [(3'h4):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire168;
  wire signed [(5'h12):(1'h0)] wire169;
  wire [(5'h12):(1'h0)] wire179;
  reg [(3'h7):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg [(4'hb):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg173 = (1'h0);
  reg [(2'h2):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg175 = (1'h0);
  reg [(4'h9):(1'h0)] reg176 = (1'h0);
  reg [(3'h4):(1'h0)] reg177 = (1'h0);
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  assign y = {wire4,
                 wire22,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire59,
                 wire61,
                 wire62,
                 wire161,
                 wire163,
                 wire164,
                 wire166,
                 wire167,
                 wire168,
                 wire169,
                 wire179,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 (1'h0)};
  assign wire4 = $signed((^{(wire0[(1'h1):(1'h1)] ~^ wire2), wire2}));
  module5 #() modinst23 (wire22, clk, wire2, wire0, wire4, wire1);
  assign wire24 = (&$unsigned((+wire2)));
  assign wire25 = ((((&$unsigned(wire3)) ?
                      $signed((wire1 << wire3)) : wire2) <<< $unsigned({wire2[(4'ha):(3'h6)]})) | wire24);
  assign wire26 = wire22[(4'hf):(3'h6)];
  assign wire27 = $unsigned((wire4[(4'hb):(4'hb)] ?
                      (^(~&(^(8'hac)))) : wire25));
  module28 #() modinst60 (wire59, clk, wire4, wire26, wire27, wire25);
  assign wire61 = (~|$unsigned(wire24[(2'h3):(1'h1)]));
  assign wire62 = wire22[(3'h5):(1'h1)];
  module63 #() modinst162 (wire161, clk, wire2, wire22, wire4, wire1);
  assign wire163 = (($signed(({wire62, wire0} ^ wire24[(3'h4):(1'h1)])) ?
                       {wire25[(1'h0):(1'h0)],
                           ((|wire61) && $unsigned(wire22))} : $signed($signed($unsigned(wire62)))) ^~ wire25[(5'h14):(4'ha)]);
  module39 #() modinst165 (.wire40(wire0), .y(wire164), .wire41(wire161), .wire42(wire25), .wire43(wire4), .clk(clk));
  assign wire166 = ($signed($signed($unsigned($unsigned(wire25)))) ?
                       (7'h42) : ($unsigned(wire163[(4'h9):(1'h0)]) ?
                           $signed(wire1[(3'h6):(2'h3)]) : (((wire1 ?
                               wire59 : wire4) - $unsigned((8'hb4))) ~^ $unsigned($signed(wire25)))));
  assign wire167 = $signed($signed(({(!wire163)} ?
                       $signed($signed(wire59)) : $signed($unsigned(wire25)))));
  assign wire168 = $signed(wire24[(3'h4):(1'h0)]);
  assign wire169 = {((~^wire24) - (wire161[(2'h2):(2'h2)] ?
                           ($unsigned((7'h44)) ?
                               wire25 : $unsigned((8'ha2))) : (~|(|wire4)))),
                       $unsigned(($unsigned(wire26) <<< {$unsigned((8'hac)),
                           (wire26 != wire22)}))};
  always
    @(posedge clk) begin
      reg170 <= ($signed($unsigned(wire1[(3'h5):(2'h2)])) && ($signed(wire1) ?
          {(wire26 ? (wire4 ~^ (8'hb4)) : $unsigned(wire62)),
              (|(wire169 ? wire24 : wire161))} : wire4));
      reg171 <= (wire4 ? wire163[(2'h3):(1'h0)] : wire0[(3'h4):(3'h4)]);
      if ({(~&$unsigned($signed($unsigned((8'hbf))))), wire166})
        begin
          if ((!(wire4[(4'ha):(4'h8)] ?
              (wire161[(4'h8):(3'h4)] - $unsigned((wire169 || wire4))) : (~(+wire4[(3'h5):(2'h3)])))))
            begin
              reg172 <= (&wire169);
              reg173 <= $signed($unsigned(wire61[(4'he):(3'h6)]));
              reg174 <= {(+{$signed($signed((8'hba))),
                      (~|((7'h40) | (7'h44)))})};
            end
          else
            begin
              reg172 <= $signed((reg174 ?
                  (~|wire164) : ((8'ha6) || ((wire25 ? (8'haf) : wire167) ?
                      (wire27 ^ wire25) : (^wire61)))));
              reg173 <= $signed($signed({{(+wire167)},
                  ((^reg171) ^ (wire2 > wire27))}));
              reg174 <= wire24[(3'h4):(1'h0)];
              reg175 <= (~|$signed(reg172[(4'ha):(3'h6)]));
              reg176 <= $unsigned(reg170[(4'h9):(2'h3)]);
            end
          if ((^~$signed({($unsigned(wire169) ?
                  (wire61 | (8'hb8)) : wire166)})))
            begin
              reg177 <= ((8'hb2) >> $unsigned((wire61 ?
                  wire25[(4'hd):(1'h1)] : ((wire3 ? wire0 : wire61) ?
                      (wire164 >> wire166) : $unsigned(wire167)))));
            end
          else
            begin
              reg177 <= {wire62};
            end
          reg178 <= ((($unsigned($unsigned(wire2)) ?
                  (&{reg177,
                      wire62}) : (|(wire26 == wire0))) + {$unsigned((^~reg176)),
                  $unsigned(wire27)}) ?
              (($signed((wire4 ?
                  wire161 : (8'hb5))) | wire3[(1'h1):(1'h0)]) >> wire167[(2'h2):(2'h2)]) : wire161);
        end
      else
        begin
          reg172 <= (((($signed(wire164) ? $unsigned(wire164) : (^wire2)) ?
                  {$unsigned(reg172),
                      $signed(wire169)} : wire62[(2'h2):(1'h1)]) + (~|reg175[(3'h4):(2'h3)])) ?
              $unsigned((+wire168[(4'h8):(2'h3)])) : reg172[(1'h1):(1'h1)]);
          reg173 <= ((wire27 ?
                  (!$signed((wire24 ?
                      wire62 : (8'ha9)))) : $unsigned({((8'ha4) ?
                          (7'h43) : wire2),
                      (wire22 == wire166)})) ?
              {$signed(reg174[(2'h2):(1'h0)]),
                  (~&$signed(((8'had) <<< wire161)))} : (8'h9c));
        end
    end
  module39 #() modinst180 (.wire40(reg172), .clk(clk), .wire43(wire169), .wire41(wire0), .y(wire179), .wire42(wire4));
  always
    @(posedge clk) begin
      reg181 <= wire4[(3'h7):(3'h5)];
      reg182 <= ($signed($unsigned((wire167 ?
          (wire0 ?
              wire161 : reg174) : wire164[(1'h0):(1'h0)]))) == (~{wire62[(3'h4):(3'h4)],
          (wire1 * reg174)}));
      reg183 <= (^~{(wire164[(1'h0):(1'h0)] * reg182[(3'h5):(2'h3)])});
      reg184 <= $unsigned($signed(wire27));
      reg185 <= $unsigned((wire161[(1'h0):(1'h0)] | (wire0[(4'h9):(2'h3)] < $signed($signed(wire168)))));
    end
endmodule

module module63
#(parameter param160 = {(((^~(~|(8'ha8))) ? (~&{(8'ha4)}) : (((8'hbc) ? (8'hbf) : (8'hb4)) ? ((8'hbd) != (8'ha7)) : ((8'had) ? (8'ha7) : (8'hbf)))) ? (((~(8'haa)) ? (^~(8'hbc)) : (&(8'haa))) << (((8'ha3) ? (8'hbd) : (8'had)) || ((8'had) ? (8'ha7) : (8'hbc)))) : {{((8'hb2) >= (8'ha8)), (~(7'h40))}})})
(y, clk, wire64, wire65, wire66, wire67);
  output wire [(32'h255):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire65;
  input wire signed [(5'h13):(1'h0)] wire66;
  input wire [(5'h15):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(2'h3):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire148;
  wire signed [(5'h10):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire145;
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(4'he):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire149,
                 wire148,
                 wire147,
                 wire68,
                 wire69,
                 wire82,
                 wire113,
                 wire115,
                 wire116,
                 wire117,
                 wire133,
                 wire145,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
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
                 reg130,
                 reg131,
                 reg132,
                 (1'h0)};
  assign wire68 = $signed((-$signed($unsigned(wire65[(3'h5):(1'h1)]))));
  assign wire69 = (8'hba);
  always
    @(posedge clk) begin
      reg70 <= wire65;
      reg71 <= wire66;
      reg72 <= wire68[(4'h9):(3'h5)];
      if (wire68)
        begin
          if (wire64[(3'h4):(1'h0)])
            begin
              reg73 <= (reg70[(3'h4):(2'h3)] ?
                  (~|{(7'h41)}) : ($signed(wire64[(1'h1):(1'h0)]) ?
                      (reg70 << reg71) : $unsigned(wire68[(2'h3):(2'h3)])));
              reg74 <= $signed((^~$signed((wire65 ?
                  $unsigned(wire69) : (wire64 ? (8'ha1) : wire67)))));
              reg75 <= $unsigned(($unsigned(reg73) ?
                  $unsigned(wire68) : wire69[(1'h0):(1'h0)]));
              reg76 <= (~^(~(~((wire66 <<< reg74) ?
                  (wire66 ? wire69 : reg70) : wire66[(4'he):(4'h8)]))));
              reg77 <= (((~&wire64[(2'h3):(1'h1)]) ^~ (&(reg75[(4'h9):(2'h3)] ?
                      wire64[(2'h3):(2'h3)] : wire67[(1'h1):(1'h1)]))) ?
                  reg73 : $unsigned(reg73[(1'h1):(1'h0)]));
            end
          else
            begin
              reg73 <= reg75[(4'hc):(3'h4)];
              reg74 <= $signed(reg70);
            end
          reg78 <= (($unsigned((8'hbc)) ?
              $unsigned({reg73[(4'h8):(1'h1)],
                  ((8'hb1) || reg70)}) : reg75[(3'h4):(2'h2)]) << $signed(reg71));
          reg79 <= (((8'had) ?
              ($unsigned((~^(8'hb6))) ?
                  wire66[(1'h1):(1'h0)] : wire67) : ($unsigned((|(8'ha2))) << (reg72 ?
                  (-wire67) : (reg78 ^ wire65)))) ~^ ({((wire67 != reg75) == wire68)} ?
              (+{$signed((8'hb9)), (reg74 ? reg73 : reg77)}) : (8'ha7)));
          reg80 <= $signed($signed(reg79));
        end
      else
        begin
          reg73 <= ($signed(wire65) ? wire64 : reg72);
          reg74 <= reg75[(2'h3):(1'h1)];
          reg75 <= $signed($unsigned(wire65[(4'hb):(4'ha)]));
          reg76 <= $unsigned((~&(({(8'haa)} ?
                  (reg71 ? reg75 : wire69) : (reg73 ? reg70 : (8'hbe))) ?
              $signed((reg74 < wire64)) : ((wire68 ? reg71 : reg79) ?
                  $signed(reg76) : (wire65 >>> wire68)))));
        end
      reg81 <= ($unsigned(reg72[(2'h2):(1'h0)]) ^ $unsigned($signed((~^((8'hb6) <<< wire69)))));
    end
  assign wire82 = (reg71[(2'h3):(2'h2)] <= ($signed((+(reg75 | reg72))) & reg80[(3'h6):(3'h4)]));
  module83 #() modinst114 (.wire86(reg80), .clk(clk), .wire85(reg76), .y(wire113), .wire87(reg73), .wire84(reg72));
  assign wire115 = reg77[(4'hf):(2'h2)];
  assign wire116 = wire69;
  assign wire117 = (^~$signed(wire115));
  always
    @(posedge clk) begin
      reg118 <= (~&(8'hbf));
      reg119 <= wire68;
      if (((8'ha6) >= {reg75[(4'h9):(2'h3)], reg74}))
        begin
          reg120 <= $unsigned(wire64[(4'h8):(1'h0)]);
          reg121 <= wire67[(3'h4):(1'h1)];
        end
      else
        begin
          reg120 <= reg73;
          if ((wire68[(3'h7):(2'h3)] || $signed($signed($unsigned({reg70,
              wire116})))))
            begin
              reg121 <= reg74;
              reg122 <= ((+$signed(reg75)) ^ (reg120 ?
                  $unsigned(wire113[(3'h6):(1'h1)]) : $unsigned($signed(wire117[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg121 <= $unsigned((|(|reg79[(3'h5):(2'h3)])));
              reg122 <= $signed(($signed(wire82[(4'h8):(3'h4)]) ~^ reg71[(4'hb):(3'h4)]));
              reg123 <= {wire69};
            end
          if ($signed($unsigned(reg70)))
            begin
              reg124 <= ((wire67 * $signed({$unsigned(reg72)})) || $unsigned($unsigned($signed($unsigned((8'ha3))))));
              reg125 <= (|(reg80 ?
                  reg72 : $unsigned(({wire69, reg74} ~^ $signed((8'hba))))));
              reg126 <= (wire64 ?
                  $signed((({wire65} ?
                      (wire69 ?
                          reg80 : reg118) : (8'ha3)) >= {reg78[(2'h2):(2'h2)],
                      $signed(wire113)})) : reg77);
              reg127 <= {(wire68 <<< {{$unsigned((7'h44)),
                          (reg123 ? reg81 : reg78)}})};
            end
          else
            begin
              reg124 <= $unsigned(reg122[(3'h6):(1'h0)]);
            end
          reg128 <= reg74[(1'h1):(1'h0)];
          if ($signed((8'ha3)))
            begin
              reg129 <= reg120[(2'h3):(1'h1)];
              reg130 <= reg71;
              reg131 <= reg73[(2'h3):(2'h2)];
            end
          else
            begin
              reg129 <= wire117;
            end
        end
      reg132 <= ((^~$unsigned(((^~reg77) - reg80))) >= $signed(((~|((8'hb6) >> reg73)) * $unsigned(reg72[(4'ha):(4'h8)]))));
    end
  assign wire133 = $unsigned((($signed((reg131 ?
                       reg78 : wire65)) <= reg127) && (~|(~|{wire116,
                       wire82}))));
  module134 #() modinst146 (.y(wire145), .clk(clk), .wire136(reg118), .wire137(wire68), .wire135(wire66), .wire138(wire67));
  assign wire147 = $unsigned((-$signed(reg129)));
  assign wire148 = ((reg80 | {wire117,
                       {(reg70 == (8'haa)),
                           $signed(wire65)}}) != {$unsigned($signed({reg132,
                           wire115}))});
  assign wire149 = reg77;
  always
    @(posedge clk) begin
      if ($unsigned(reg73))
        begin
          reg150 <= ((&(reg132[(3'h6):(2'h3)] ?
              (reg70[(1'h0):(1'h0)] ~^ (7'h42)) : (|$unsigned(reg121)))) >= (reg120[(2'h3):(2'h2)] >>> ({wire68[(1'h1):(1'h0)]} ?
              reg124 : wire66[(4'h9):(2'h3)])));
          reg151 <= {(($signed((8'ha9)) < wire82[(1'h0):(1'h0)]) >= ((+$unsigned((8'hba))) ?
                  {(|reg129)} : (8'ha4)))};
          reg152 <= reg79[(1'h0):(1'h0)];
          reg153 <= (!$unsigned(wire82[(3'h4):(2'h2)]));
          reg154 <= $unsigned(wire113);
        end
      else
        begin
          reg150 <= reg123[(2'h3):(2'h3)];
          reg151 <= (reg79 ?
              $unsigned(($unsigned($signed((8'hbe))) ?
                  ({wire149} < $signed(reg121)) : ((~reg120) != {reg77}))) : (~^reg154));
        end
      reg155 <= ((8'haf) <= reg123[(1'h1):(1'h0)]);
      reg156 <= ($unsigned({$unsigned((^~wire115)),
          ((reg123 ? wire133 : wire117) ?
              $signed(reg121) : (wire145 ?
                  reg71 : reg120))}) ~^ (^~((reg127[(1'h0):(1'h0)] > $signed(wire117)) >>> {reg73})));
      reg157 <= ($unsigned(wire116) ?
          (($unsigned({(8'hb5), wire145}) ?
              (+reg77[(5'h11):(4'he)]) : ($signed(reg155) ?
                  reg78[(4'ha):(3'h7)] : $unsigned((8'hba)))) >>> $signed(((reg150 ?
                  reg81 : reg79) ?
              $signed(reg131) : $signed(reg127)))) : $unsigned(reg125));
    end
  assign wire158 = {reg73};
  assign wire159 = ($unsigned((reg151[(3'h5):(3'h4)] == (((8'ha7) ?
                           reg123 : reg127) <= (reg80 ? reg72 : (8'hb9))))) ?
                       $unsigned((reg73[(1'h0):(1'h0)] ^~ (reg78 <<< $signed(wire113)))) : $signed(reg79[(1'h0):(1'h0)]));
endmodule

module module28
#(parameter param57 = ((|(((!(8'hb0)) ? ((8'hae) ? (8'h9c) : (8'ha7)) : ((8'haf) ? (8'ha5) : (8'hba))) ? (~|((8'hac) ? (7'h42) : (8'had))) : (8'h9e))) + ((((8'hb6) ? ((8'ha8) ? (8'h9c) : (8'hbf)) : ((8'ha8) || (8'had))) ? {{(8'hb6), (8'hb9)}, {(8'had), (7'h44)}} : (((8'hb7) ? (8'haf) : (8'ha9)) ~^ (~&(8'hb1)))) ? ((&((8'hb5) ? (8'ha6) : (8'ha9))) ? {((8'h9e) ? (8'ha3) : (8'ha5)), (~(8'hab))} : ({(7'h44), (8'hbc)} ? ((7'h44) >>> (8'h9e)) : ((7'h43) ~^ (8'ha5)))) : ((!((8'haa) ? (8'had) : (8'hba))) ? (&((8'hb5) && (8'ha6))) : (8'ha5)))), 
parameter param58 = ((&((~(param57 << param57)) ? param57 : param57)) ? (|({param57} ? ((param57 != param57) - {param57}) : {param57, (param57 ~^ (8'hb3))})) : param57))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  assign y = {wire56,
                 wire55,
                 wire53,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 (1'h0)};
  assign wire33 = (($signed((-wire31[(2'h3):(1'h0)])) ~^ $signed({(wire31 ?
                              wire32 : wire30)})) ?
                      wire31[(3'h4):(3'h4)] : wire32);
  assign wire34 = wire30[(1'h0):(1'h0)];
  assign wire35 = wire34;
  assign wire36 = (~&($unsigned($unsigned($signed(wire32))) || ((wire30[(2'h2):(2'h2)] != (~&wire35)) ?
                      (wire35[(3'h5):(1'h0)] || (wire32 < wire30)) : wire30[(5'h11):(3'h5)])));
  assign wire37 = (~&$unsigned(wire35));
  assign wire38 = {$unsigned(wire37), wire34[(4'h9):(3'h5)]};
  module39 #() modinst54 (wire53, clk, wire35, wire32, wire33, wire37);
  assign wire55 = wire38[(3'h5):(2'h2)];
  assign wire56 = ($unsigned($signed($unsigned((~wire55)))) ?
                      ($signed($signed(wire53[(3'h4):(1'h1)])) ?
                          (wire55 != wire35) : wire37[(3'h6):(2'h2)]) : $signed(wire30));
endmodule

module module5
#(parameter param21 = ((({((8'hb1) ? (8'hb4) : (8'hb5))} ^~ (((8'hb7) ? (7'h43) : (8'ha7)) || ((8'hae) ^~ (8'ha5)))) == (8'hb4)) ? ((({(8'ha7)} ? {(8'ha2), (8'hac)} : ((7'h42) ? (8'hb9) : (8'hba))) ? ((&(8'hbe)) ? ((8'h9e) <<< (8'ha6)) : (&(8'hb1))) : (|((8'haa) | (8'hbc)))) == (!(7'h40))) : ((+(((8'hbd) ? (8'hb8) : (8'hbd)) != {(8'ha3)})) + (~(~^(-(8'ha9)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire11,
                 wire10,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = wire6[(4'hd):(4'h8)];
  assign wire11 = wire9[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= wire7;
      if (($unsigned((((|wire8) ? $unsigned(wire9) : wire11) | ({wire7} ?
          $unsigned((8'ha5)) : $unsigned(reg12)))) != ((($unsigned(wire6) ?
                  $signed(wire8) : (^~(8'hb9))) ?
              (+wire6[(3'h6):(3'h6)]) : (|((8'hba) < wire11))) ?
          $unsigned((!(wire7 & wire8))) : (wire9[(3'h7):(2'h2)] ^ wire9[(4'h8):(4'h8)]))))
        begin
          reg13 <= wire6[(3'h7):(1'h0)];
          reg14 <= $signed((wire9[(1'h0):(1'h0)] != ((wire9 < (reg13 - wire9)) ^~ wire7)));
          reg15 <= ($signed(((wire8 ~^ (reg12 ? wire9 : wire9)) ?
              $unsigned((&wire11)) : wire11[(1'h0):(1'h0)])) ^~ wire6[(3'h4):(1'h0)]);
        end
      else
        begin
          reg13 <= (reg14[(3'h7):(3'h7)] ?
              ((8'hb0) ?
                  (&{(reg15 ? reg15 : (8'hb9)),
                      (wire10 ? (8'hbf) : reg12)}) : ($signed((reg12 ?
                      reg13 : reg12)) ~^ (!(wire6 ?
                      wire9 : reg12)))) : $signed({(8'hb4),
                  $unsigned($unsigned(wire9))}));
          reg14 <= wire11;
        end
      reg16 <= (wire8[(4'hc):(3'h4)] || ($signed($signed(wire10[(1'h0):(1'h0)])) * ($signed(((8'hab) >>> reg14)) ?
          ($signed(wire7) ?
              (reg15 ?
                  wire6 : wire10) : reg12[(3'h4):(2'h3)]) : $signed($signed((8'hba))))));
      reg17 <= $signed(wire7[(1'h1):(1'h0)]);
    end
  assign wire18 = {wire11[(2'h3):(2'h2)]};
  assign wire19 = {($unsigned(($signed(reg14) ?
                          reg14[(4'ha):(3'h6)] : (reg15 ?
                              reg17 : wire11))) == ($unsigned({reg13}) + $signed(reg12))),
                      ($signed(wire6[(3'h6):(2'h2)]) && ((wire10 ?
                          reg16[(1'h0):(1'h0)] : $signed(wire8)) >>> $signed($unsigned((8'hbb)))))};
  assign wire20 = $unsigned(reg17);
endmodule

module module39
#(parameter param52 = (-((+(((8'hb0) ? (8'had) : (8'hb1)) || ((8'hbb) <<< (8'hba)))) ? ((&(+(8'haf))) >> ({(8'ha0)} ~^ (8'hb4))) : (~^((+(8'h9f)) ? {(8'hab), (8'ha2)} : ((8'hbf) ? (8'haa) : (8'hba)))))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire43;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire [(4'hc):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire45,
                 wire44,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire44 = wire41[(1'h0):(1'h0)];
  assign wire45 = wire43[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg46 <= wire41;
      reg47 <= (~^$unsigned($signed(($signed((8'hb4)) ?
          $unsigned(wire45) : (|wire45)))));
    end
  assign wire48 = $signed((|wire43[(3'h4):(1'h1)]));
  assign wire49 = (wire44 ?
                      {$signed(((wire45 ?
                              wire44 : wire40) + $unsigned(wire48))),
                          reg46[(3'h4):(3'h4)]} : (($unsigned((wire42 << reg46)) ?
                              wire45 : ({reg46, wire42} ?
                                  (wire41 < reg47) : {wire48, wire42})) ?
                          (wire41[(4'hc):(3'h5)] != (!{wire45,
                              (8'h9d)})) : (~wire43[(2'h2):(1'h1)])));
  assign wire50 = wire44;
  assign wire51 = $unsigned({wire40, reg47});
endmodule

module module134
#(parameter param144 = ((((((8'hae) ? (8'hbb) : (8'ha0)) ? ((8'hab) ? (8'ha9) : (8'hb3)) : ((8'ha0) ? (8'hb5) : (8'ha7))) | (((8'hb7) ? (7'h40) : (8'ha6)) != {(8'h9f)})) ? {(((8'hb8) ~^ (8'ha0)) ? {(8'hbb)} : ((8'ha6) ? (8'h9e) : (8'ha8)))} : ({((8'hbe) >>> (8'haf))} ? (&((8'h9c) - (8'ha6))) : (((8'h9f) ? (8'haa) : (8'hac)) & (&(8'hbb))))) >= (~&((~^(~^(8'hb5))) ? (((8'hb0) ? (8'hbe) : (8'hbb)) ? {(8'h9f), (7'h40)} : ((7'h40) ? (8'hb7) : (8'hac))) : (~&(^(8'ha5)))))))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire138;
  input wire [(4'hc):(1'h0)] wire137;
  input wire [(4'hc):(1'h0)] wire136;
  input wire signed [(5'h13):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire139;
  assign y = {wire143, wire142, wire141, wire140, wire139, (1'h0)};
  assign wire139 = $signed($signed((^(|wire138))));
  assign wire140 = (wire136[(4'h8):(1'h1)] * ($signed((~$unsigned(wire135))) ?
                       (^~(-(wire139 ? (8'had) : wire136))) : (((wire136 ?
                                   wire136 : wire137) ?
                               (^~(8'haf)) : (wire139 ? (8'ha5) : wire135)) ?
                           ($signed(wire139) ?
                               (~^wire139) : $unsigned(wire138)) : (wire136 ?
                               (^~wire138) : (wire136 ? wire136 : wire135)))));
  assign wire141 = $signed(($signed((!$signed(wire137))) ?
                       $signed($signed(wire139)) : wire140[(4'hf):(1'h0)]));
  assign wire142 = ($signed($signed($signed($unsigned(wire139)))) ?
                       wire136 : (~wire137));
  assign wire143 = (-$signed((wire141[(2'h3):(1'h0)] <<< wire141)));
endmodule

module module83
#(parameter param111 = ({((~((8'hb5) ? (8'haf) : (8'hb4))) ? ({(8'ha4), (8'ha1)} ? ((8'ha6) ? (8'hb0) : (8'hb8)) : (^~(8'ha8))) : (((8'hbd) || (8'haf)) < ((8'ha0) || (8'ha7)))), ((((7'h41) ? (8'hb8) : (8'had)) > (7'h42)) != {{(8'had), (8'hb0)}})} < (((((8'ha3) ? (8'ha8) : (7'h42)) ? (~|(8'hab)) : (!(8'haa))) > ((~^(8'ha8)) ? ((8'haf) >= (8'ha7)) : (^~(8'hbf)))) ? {(8'hbe)} : ((((8'hb3) ? (8'ha2) : (8'hb4)) ? {(8'hab)} : ((8'ha3) && (8'hb5))) > ((|(8'hb9)) ? ((7'h44) >> (8'hbd)) : ((8'h9d) ? (8'h9d) : (8'haf)))))), 
parameter param112 = {((8'ha0) && (param111 ^~ param111))})
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire87;
  input wire [(5'h11):(1'h0)] wire86;
  input wire [(3'h7):(1'h0)] wire85;
  input wire [(5'h11):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire88;
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 wire103,
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
                 wire88,
                 reg105,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire88 = wire87[(4'hc):(1'h0)];
  assign wire89 = (-(((&(!(8'ha9))) ^~ (~^$unsigned(wire86))) <<< (-(|(wire84 ?
                      wire84 : wire87)))));
  assign wire90 = (wire88[(3'h6):(1'h1)] ?
                      ({(wire84 | (~(8'hbc))), $unsigned((wire84 <= wire84))} ?
                          (wire84[(4'h8):(3'h6)] || (|wire87)) : $unsigned(((~&wire85) && ((7'h44) && wire84)))) : {(&((^~wire87) ?
                              (wire87 <<< wire87) : wire84[(4'hd):(3'h6)]))});
  assign wire91 = $unsigned({$signed(((+wire88) ?
                          (-wire88) : $unsigned(wire90))),
                      {$unsigned(((8'haf) ? wire87 : wire89))}});
  assign wire92 = {wire85};
  assign wire93 = {wire88[(4'hb):(1'h1)]};
  assign wire94 = wire93;
  assign wire95 = (wire92 ?
                      $signed({wire91,
                          (-$signed(wire88))}) : (wire84[(3'h4):(1'h1)] & $signed(($signed((7'h43)) || $signed(wire92)))));
  assign wire96 = $signed({($signed((!wire85)) >= $unsigned($signed((8'hbd))))});
  assign wire97 = wire90;
  assign wire98 = {(wire90 - (8'hbf))};
  assign wire99 = wire95[(4'ha):(4'h9)];
  always
    @(posedge clk) begin
      if ((wire88[(3'h7):(3'h7)] != wire84[(4'h8):(2'h2)]))
        begin
          reg100 <= wire85[(3'h4):(2'h3)];
          reg101 <= (8'ha9);
        end
      else
        begin
          reg100 <= $unsigned(wire94[(4'hd):(4'hb)]);
        end
      reg102 <= ({$unsigned({wire97[(1'h0):(1'h0)]})} && {(((~|wire85) >>> {(8'hb7),
                  wire88}) ?
              (8'h9d) : (8'hb0)),
          ((wire87 ?
              wire86[(2'h3):(1'h0)] : (~&reg101)) >>> $signed((~wire84)))});
    end
  assign wire103 = wire96;
  assign wire104 = wire92;
  always
    @(posedge clk) begin
      reg105 <= wire103[(1'h1):(1'h1)];
    end
  assign wire106 = wire88;
  assign wire107 = (~(wire87 ?
                       ($signed((wire95 && wire89)) ~^ reg101) : wire97));
  assign wire108 = {(^(wire106 > $unsigned((reg102 >>> wire99))))};
  assign wire109 = (!(wire87[(2'h3):(2'h3)] | $unsigned($unsigned((wire97 == wire87)))));
  assign wire110 = (^~(8'hb0));
endmodule
