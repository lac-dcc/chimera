module top
#(parameter param133 = (~^((!(+(-(8'hbe)))) ? {(((8'h9d) <<< (8'hac)) ? (8'hac) : {(8'ha4), (8'hb7)}), (((8'hac) ^ (8'ha4)) ? ((8'hbe) - (7'h43)) : {(8'hb8)})} : (!(-((8'ha0) ? (8'ha7) : (7'h40)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire128;
  wire [(5'h14):(1'h0)] wire127;
  wire [(3'h4):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire118,
                 wire7,
                 wire6,
                 wire5,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(((($unsigned(wire2) && (wire2 ? wire0 : wire1)) ?
          $unsigned({wire0, wire1}) : ($unsigned(wire0) ?
              (wire0 ?
                  wire1 : (8'haf)) : wire1[(1'h1):(1'h0)])) >> wire1[(4'hf):(4'ha)]));
    end
  assign wire5 = $signed(wire3);
  assign wire6 = (wire3 || $unsigned((~wire5[(3'h5):(2'h2)])));
  assign wire7 = (8'hba);
  module8 #() modinst119 (.wire11(reg4), .wire9(wire5), .wire12(wire6), .wire13(wire0), .y(wire118), .clk(clk), .wire10(wire1));
  always
    @(posedge clk) begin
      reg120 <= $unsigned(wire5[(5'h10):(4'hf)]);
    end
  always
    @(posedge clk) begin
      reg121 <= $signed((~|$signed((~|wire6))));
      reg122 <= (reg121 ?
          $unsigned((~&wire0)) : {$unsigned(((wire7 ?
                  reg4 : wire0) ~^ wire5[(4'he):(4'hb)]))});
      reg123 <= $unsigned(wire3[(4'hb):(4'hb)]);
    end
  assign wire124 = $unsigned((~&((reg122 - (reg122 ?
                       reg123 : (8'h9c))) * wire7)));
  assign wire125 = wire3;
  assign wire126 = wire7[(2'h3):(1'h0)];
  assign wire127 = (wire7 >> $signed($signed((((8'ha0) && wire5) ?
                       $signed(wire2) : (+wire5)))));
  assign wire128 = (|{$signed($signed((wire2 ? reg122 : reg120)))});
  assign wire129 = ($signed(wire124) & (wire3 ?
                       {$unsigned((&wire127))} : reg120[(5'h12):(2'h3)]));
  assign wire130 = {((8'hab) ?
                           ({{reg120, (8'ha6)},
                               $signed(wire7)} || reg122[(1'h1):(1'h0)]) : (($unsigned(reg123) ~^ (^~wire129)) || (8'h9f)))};
  assign wire131 = (^wire3);
  assign wire132 = wire6[(4'h8):(2'h2)];
endmodule

module module8
#(parameter param116 = (!((((&(8'hb8)) ? ((8'hab) ? (8'hbe) : (8'ha1)) : {(7'h40), (8'hb4)}) && (|((8'hb3) ? (8'hb4) : (8'hbb)))) >>> ((((8'hb1) ~^ (8'ha2)) ? (+(8'hb5)) : (7'h43)) >= ((~&(8'hba)) | (~(8'ha3)))))), 
parameter param117 = ((((|param116) ? (~param116) : (^param116)) >> (|({param116, param116} ? (param116 >>> param116) : (param116 ? param116 : param116)))) || ({((param116 ? (8'had) : param116) ? param116 : (param116 ^ param116))} ? ({{param116}} | ((!(8'hb8)) * param116)) : ((~^(^param116)) ? ((param116 - param116) >>> {(8'h9d), param116}) : ({param116} ? {param116, param116} : (param116 - param116))))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire115;
  wire signed [(4'h9):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire40;
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  assign y = {wire115,
                 wire113,
                 wire42,
                 wire14,
                 wire40,
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
                 (1'h0)};
  assign wire14 = wire10;
  always
    @(posedge clk) begin
      reg15 <= {{{$unsigned(wire13[(2'h3):(2'h2)]),
                  $signed(wire13[(2'h2):(2'h2)])},
              wire14[(1'h1):(1'h1)]},
          {wire11[(3'h6):(1'h0)], $signed(wire12[(5'h10):(4'h9)])}};
      if ((8'ha1))
        begin
          reg16 <= wire10;
          reg17 <= wire11;
          reg18 <= ({$unsigned({(+wire12)})} && $signed(reg15[(2'h3):(2'h2)]));
          reg19 <= $unsigned(reg16[(1'h0):(1'h0)]);
          if (((|$signed($signed((!wire11)))) ?
              (+(wire10 - ($unsigned(wire13) ?
                  {reg19,
                      wire13} : reg18[(2'h3):(2'h3)]))) : ($unsigned(((reg18 & wire11) || $signed(wire10))) ?
                  (^~(~&(wire12 ?
                      wire14 : reg17))) : (((reg15 | wire11) ~^ $unsigned(wire10)) - (reg17[(2'h3):(1'h1)] <= (wire9 ?
                      reg19 : (8'hb0)))))))
            begin
              reg20 <= {$signed(((8'h9f) ?
                      ($signed(wire14) ?
                          wire10[(2'h3):(1'h0)] : wire12) : (|{wire11})))};
              reg21 <= reg18;
              reg22 <= {$unsigned(($signed(reg18[(3'h5):(1'h1)]) ?
                      (wire9[(4'ha):(1'h1)] ?
                          $signed(wire11) : (reg16 << reg18)) : (!(+(8'hb3))))),
                  (~|(^(8'hae)))};
            end
          else
            begin
              reg20 <= $signed(wire14);
              reg21 <= wire12;
              reg22 <= ((wire12[(4'he):(4'hd)] <= {(wire12 ?
                      (~wire12) : reg20)}) >> $unsigned((~|((wire14 ?
                  wire9 : reg17) - {(7'h40)}))));
              reg23 <= ((!$signed(((reg18 ? wire10 : reg17) ?
                  (wire13 <<< wire9) : wire14[(3'h6):(3'h6)]))) * (wire13 >= reg17));
              reg24 <= $signed(((wire10 ?
                  ((wire12 ?
                      wire9 : wire10) == (wire10 ^~ reg23)) : (!$signed((8'hb5)))) && (-$signed($signed(wire10)))));
            end
        end
      else
        begin
          reg16 <= $signed(({$unsigned({reg15, wire14})} ?
              $unsigned(((reg17 ? reg17 : reg18) ?
                  reg20[(2'h3):(1'h0)] : $signed(reg18))) : wire11));
          reg17 <= (($unsigned(wire12) ?
              (+$signed($unsigned(reg23))) : $unsigned(({(8'ha6)} ?
                  reg19[(2'h3):(1'h1)] : reg24))) >>> $signed($signed(reg22)));
          reg18 <= reg17;
          if (reg15[(1'h0):(1'h0)])
            begin
              reg19 <= ({($signed((wire11 ? reg20 : reg24)) ?
                      ((^reg24) ^~ $signed(reg22)) : $signed(reg22))} >>> ((((~wire14) ?
                          reg24[(4'h9):(2'h3)] : $signed(wire9)) ?
                      reg17 : (!wire11[(1'h0):(1'h0)])) ?
                  ({((8'hab) ^ wire12),
                      (~|reg23)} >> (^wire13)) : $signed(((^~reg20) & (&reg22)))));
            end
          else
            begin
              reg19 <= {$signed((8'ha4))};
              reg20 <= $signed((((~|$unsigned((8'hbf))) | reg20) ?
                  (~&(((8'hba) > reg19) ?
                      $unsigned(reg15) : (^wire13))) : ($unsigned($signed(reg23)) ?
                      reg22 : ($unsigned(reg17) ?
                          reg21[(3'h4):(2'h2)] : (reg15 ? reg16 : wire11)))));
              reg21 <= ($signed($signed((~&(8'haf)))) ?
                  wire14[(1'h1):(1'h0)] : $signed((~&$signed(reg18))));
              reg22 <= (-(8'h9d));
            end
          reg23 <= ($signed(reg18[(2'h2):(1'h0)]) ?
              (^(8'hb7)) : (^~wire13[(4'hc):(4'h8)]));
        end
      reg25 <= ($signed(($signed($signed(reg23)) | wire9[(3'h4):(3'h4)])) ?
          ((wire14 >= reg17[(3'h4):(1'h0)]) > reg16[(4'hf):(1'h1)]) : $signed(reg23));
      reg26 <= (!({$signed($signed((8'hbe)))} ?
          {$unsigned(reg17[(3'h4):(2'h2)]),
              wire14[(1'h0):(1'h0)]} : $unsigned(((~&(7'h44)) - (wire12 ?
              (8'haa) : reg24)))));
    end
  module27 #() modinst41 (.wire28(reg17), .wire30(reg15), .clk(clk), .y(wire40), .wire29(wire12), .wire31(reg25), .wire32(reg18));
  assign wire42 = (|(~|reg20));
  module43 #() modinst114 (wire113, clk, reg26, reg15, reg25, wire11, wire40);
  assign wire115 = {wire42};
endmodule

module module43
#(parameter param111 = ({((-((7'h42) | (8'hba))) + (((8'h9e) != (8'h9d)) ^ ((8'h9e) ? (8'hbb) : (8'hae)))), (~|(~&{(8'hbc)}))} ? (~|{(~^((8'hb6) ? (8'ha9) : (8'hb4)))}) : ((|((!(8'h9f)) > {(8'ha7), (8'ha5)})) < (~&(7'h40)))), 
parameter param112 = ((~&((((8'ha5) << (8'ha9)) == (8'hba)) >= param111)) ? ((((~&(8'ha4)) && (param111 == param111)) <= param111) ? (param111 ~^ ((param111 <<< param111) ^ param111)) : ((~&param111) ? (^(param111 ? param111 : param111)) : ((param111 ^~ (8'hb0)) ? (~&param111) : (~&param111)))) : param111))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h2e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  input wire [(4'hc):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire90,
                 wire89,
                 wire88,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
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
                 (1'h0)};
  assign wire49 = (+(wire45[(1'h0):(1'h0)] ~^ $signed((wire46 ?
                      {wire45} : $signed(wire47)))));
  assign wire50 = $unsigned({(8'ha7)});
  assign wire51 = {((wire44[(2'h3):(1'h0)] | $signed(wire45)) <<< (~$signed((wire46 ?
                          wire48 : wire47)))),
                      (wire49 >> wire46[(4'hc):(4'ha)])};
  assign wire52 = (^($signed(wire50) ^ $signed(((~|wire50) ?
                      (^wire50) : (wire46 ~^ wire46)))));
  always
    @(posedge clk) begin
      reg53 <= (^wire46[(3'h6):(3'h4)]);
    end
  always
    @(posedge clk) begin
      reg54 <= $unsigned(wire46[(3'h6):(2'h3)]);
      reg55 <= wire50;
      if (($unsigned(({$signed(wire52), {wire47, wire52}} ?
              ((reg53 ? wire51 : wire50) ?
                  (wire51 ? (8'ha5) : reg53) : {(8'hb7),
                      wire45}) : $signed((reg54 ? wire47 : wire46)))) ?
          $signed($signed(((^(8'hbf)) ?
              $signed(reg54) : wire50[(1'h1):(1'h1)]))) : $signed((wire48[(3'h5):(2'h2)] > $signed({(8'hb4)})))))
        begin
          reg56 <= (-($signed((8'hb4)) ? $unsigned(wire45) : wire44));
        end
      else
        begin
          reg56 <= {reg54};
          reg57 <= ((~|reg55) ?
              $signed(($unsigned(wire46) ?
                  $signed({(8'hb1)}) : ((reg54 ?
                      wire51 : wire51) << {reg54}))) : (~^$unsigned(reg53)));
          if ($unsigned($unsigned((^$unsigned((reg55 == wire46))))))
            begin
              reg58 <= {wire47[(4'ha):(4'ha)], wire47};
            end
          else
            begin
              reg58 <= wire48;
              reg59 <= (^$signed($unsigned($signed((reg55 ?
                  reg56 : (8'hb1))))));
              reg60 <= reg57[(5'h12):(5'h12)];
              reg61 <= $signed(((((reg58 && wire51) == reg56[(2'h2):(2'h2)]) ?
                      wire46[(3'h7):(3'h4)] : $unsigned((reg60 * reg57))) ?
                  reg57 : $unsigned(reg59)));
              reg62 <= wire48[(3'h4):(1'h1)];
            end
          reg63 <= (~|wire52);
        end
    end
  assign wire64 = wire51;
  assign wire65 = $unsigned(((-wire51[(4'h8):(1'h0)]) >>> $unsigned(wire50)));
  assign wire66 = ((|(((^~wire51) == $signed(reg62)) ?
                      $unsigned((wire65 ?
                          (8'hb5) : wire47)) : ($signed((8'ha6)) ?
                          (wire45 ~^ (7'h44)) : (|(8'hbb))))) <= ((+(^~wire45[(3'h6):(2'h2)])) != {(wire45 == (-reg58)),
                      wire65[(3'h5):(3'h5)]}));
  assign wire67 = {reg57, $unsigned((|$signed((8'had))))};
  always
    @(posedge clk) begin
      if ((wire48 | wire51[(1'h1):(1'h1)]))
        begin
          if ({(~|{$signed(reg60)})})
            begin
              reg68 <= $signed(($unsigned($unsigned((wire48 * wire45))) ?
                  (8'hab) : (($unsigned(reg57) ?
                      $unsigned(wire48) : $signed(reg60)) != $unsigned($unsigned(wire47)))));
              reg69 <= $signed((wire66[(3'h4):(3'h4)] * (^reg60[(4'hc):(4'ha)])));
              reg70 <= (wire65[(1'h1):(1'h0)] ? $signed((8'hb8)) : wire44);
              reg71 <= (wire66[(4'hc):(3'h5)] | (reg61[(4'h9):(1'h1)] ?
                  $signed(((reg69 ?
                      wire46 : reg58) <<< reg55[(4'ha):(3'h5)])) : wire52[(3'h4):(2'h2)]));
            end
          else
            begin
              reg68 <= $unsigned((~^$signed($signed((|reg53)))));
              reg69 <= (~$unsigned(wire46[(1'h0):(1'h0)]));
              reg70 <= ({wire66} ? reg68[(1'h0):(1'h0)] : reg59);
              reg71 <= (^~wire50[(3'h4):(2'h3)]);
              reg72 <= ($signed($unsigned($signed($unsigned(wire52)))) ?
                  $signed((8'ha7)) : (!reg62));
            end
          reg73 <= $unsigned(wire49[(2'h2):(2'h2)]);
          reg74 <= (~^{(((reg71 ? wire44 : wire66) ~^ $signed(wire49)) ?
                  wire67[(1'h0):(1'h0)] : (^$signed(wire48))),
              wire44[(1'h1):(1'h0)]});
          reg75 <= wire49;
          reg76 <= $unsigned($signed(reg58));
        end
      else
        begin
          reg68 <= $unsigned({wire47,
              ($unsigned($signed(reg68)) ?
                  (~&reg69) : {wire45[(2'h2):(2'h2)]})});
          reg69 <= $unsigned(reg76);
          reg70 <= wire49;
          reg71 <= wire67;
          reg72 <= {(8'hb4), $unsigned($unsigned($unsigned((~&reg53))))};
        end
      if ((((+($unsigned(wire46) | (~reg60))) ?
              (~|$unsigned(reg63[(2'h3):(2'h3)])) : $signed($unsigned($unsigned((8'hb5))))) ?
          $signed((wire44[(1'h0):(1'h0)] || ($signed(reg61) ?
              (~|(8'haa)) : wire51))) : $signed(reg69)))
        begin
          if ($unsigned(wire64))
            begin
              reg77 <= (reg75 < wire52);
              reg78 <= $unsigned({$signed(reg76[(1'h1):(1'h0)])});
              reg79 <= wire45[(1'h1):(1'h0)];
              reg80 <= {$unsigned((($unsigned(wire45) ?
                      $signed(reg76) : wire46) & reg59[(1'h1):(1'h1)])),
                  (((~reg75[(3'h6):(3'h5)]) * reg61) | $unsigned($signed($unsigned(reg71))))};
            end
          else
            begin
              reg77 <= (-reg70[(4'he):(1'h1)]);
              reg78 <= $unsigned(wire52);
              reg79 <= $signed($signed(reg53[(4'h9):(4'h8)]));
            end
          reg81 <= $signed((reg57 && wire48));
          if ((+$signed((&reg71[(2'h2):(2'h2)]))))
            begin
              reg82 <= $signed(((!(8'hb0)) || (reg80[(2'h2):(2'h2)] ?
                  {{wire50, wire67}} : (~&(reg72 ? reg68 : reg72)))));
              reg83 <= (wire65 > wire66);
              reg84 <= $unsigned(reg71[(4'h8):(1'h0)]);
            end
          else
            begin
              reg82 <= ((|(((reg76 ? reg75 : reg79) & reg73[(2'h2):(1'h1)]) ?
                  (~|$unsigned(reg61)) : ((wire49 ? (8'hb1) : reg57) ?
                      (wire46 * reg68) : $signed((7'h43))))) || $signed($signed(((wire44 < reg62) ^~ (wire48 * (8'haa))))));
              reg83 <= (~reg71[(2'h3):(1'h0)]);
              reg84 <= reg70[(3'h4):(1'h1)];
            end
        end
      else
        begin
          reg77 <= ($signed({$unsigned((^~reg73))}) ?
              ((-(+$unsigned(wire48))) ?
                  (~^reg72) : ($signed((reg59 ?
                      reg61 : reg73)) >> reg71[(4'hf):(3'h6)])) : wire50[(3'h5):(3'h5)]);
          reg78 <= $signed((reg80[(1'h0):(1'h0)] < $unsigned(($signed(reg57) >> reg71))));
          reg79 <= wire45;
          reg80 <= ($unsigned($signed(reg76)) ? (8'hb9) : reg83[(4'h9):(3'h4)]);
        end
      if (($signed((((!reg82) >> (reg84 & reg72)) != $unsigned((reg70 + reg71)))) - ($signed((!(8'hb7))) ^~ $signed((~(~|reg74))))))
        begin
          if ($signed((~&reg81[(1'h0):(1'h0)])))
            begin
              reg85 <= (wire46 > ($unsigned(reg68) ? (+wire49) : reg55));
              reg86 <= $unsigned(reg72);
            end
          else
            begin
              reg85 <= reg81;
            end
          reg87 <= (wire64[(3'h7):(3'h5)] ~^ $signed(reg63[(1'h0):(1'h0)]));
        end
      else
        begin
          reg85 <= (~|$signed((7'h44)));
        end
    end
  assign wire88 = ({(8'hb0),
                      (wire47[(3'h5):(1'h0)] < (|reg59[(3'h6):(3'h6)]))} & ((reg54 ?
                      (((8'hb5) ? wire52 : reg61) ?
                          reg57[(3'h7):(3'h6)] : $unsigned((8'hac))) : $signed(reg76)) < reg80));
  assign wire89 = reg58[(1'h0):(1'h0)];
  assign wire90 = $unsigned(($signed(($unsigned(reg83) >= {wire64})) ^~ $unsigned($signed((reg57 ?
                      reg60 : reg58)))));
  always
    @(posedge clk) begin
      if ($signed(($unsigned($unsigned($unsigned(wire52))) >> (-wire52))))
        begin
          reg91 <= $unsigned(($signed((reg82 ? $signed(reg54) : (~reg62))) ?
              ($signed({reg56}) < wire48) : (^~(!(reg69 > wire66)))));
          if ($unsigned($signed({($signed(wire67) ?
                  {reg61} : reg63[(1'h0):(1'h0)]),
              (reg58 ? wire66[(4'hd):(1'h0)] : wire88[(3'h4):(1'h1)])})))
            begin
              reg92 <= reg58;
              reg93 <= reg63;
              reg94 <= $signed(reg63[(3'h4):(1'h0)]);
              reg95 <= ($unsigned($signed($unsigned((wire47 ?
                  reg84 : reg77)))) ^~ (8'h9c));
              reg96 <= (~|(((8'had) != (reg80 ? (7'h41) : {reg73, wire67})) ?
                  $signed(reg55[(4'h8):(2'h3)]) : reg71));
            end
          else
            begin
              reg92 <= reg74;
              reg93 <= reg78[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg91 <= $signed($unsigned($unsigned($unsigned(reg72))));
          if ({(^(^~reg78[(2'h2):(1'h1)]))})
            begin
              reg92 <= $signed($unsigned({(~|{wire88})}));
            end
          else
            begin
              reg92 <= ((-wire52[(3'h6):(3'h5)]) ? wire45 : wire48);
              reg93 <= (^~reg54[(4'h9):(3'h6)]);
              reg94 <= (((((-reg91) ? {wire88} : (wire66 ? wire90 : reg82)) ?
                      ({wire48,
                          reg86} + $unsigned((8'hb6))) : ($unsigned(reg68) | $signed(reg81))) & (~^(wire49[(1'h0):(1'h0)] || (reg72 > reg70)))) ?
                  $unsigned((~&reg91[(2'h2):(2'h2)])) : ($unsigned({(reg54 ?
                          reg62 : wire51)}) ~^ $signed($signed((^~(7'h40))))));
              reg95 <= {reg81, (8'h9f)};
            end
        end
      reg97 <= (^{wire49[(4'he):(4'h8)],
          (((wire64 != reg58) || (reg79 ?
              wire45 : reg60)) < reg71[(3'h5):(2'h2)])});
    end
  always
    @(posedge clk) begin
      if (reg61)
        begin
          reg98 <= (~$unsigned((~&$unsigned((reg62 - reg69)))));
          reg99 <= reg59;
        end
      else
        begin
          reg98 <= reg71[(3'h4):(2'h3)];
          reg99 <= (~&reg75[(1'h1):(1'h0)]);
          reg100 <= $signed($unsigned(((^~(|reg86)) ?
              reg71 : {$signed((8'hb4)), $unsigned(reg69)})));
        end
      reg101 <= wire47;
      reg102 <= reg75[(2'h3):(1'h0)];
      reg103 <= (^~(^(reg57[(3'h6):(1'h0)] >= (((8'had) ? wire52 : (8'ha0)) ?
          wire89[(4'h9):(2'h3)] : wire67[(1'h1):(1'h1)]))));
      if (wire89)
        begin
          reg104 <= $signed((reg72 >>> ((8'ha7) - $unsigned($signed(reg100)))));
          reg105 <= (8'haf);
          reg106 <= {$unsigned((~|wire46))};
          reg107 <= (8'ha2);
          reg108 <= (8'ha3);
        end
      else
        begin
          reg104 <= {$unsigned((($signed(reg77) ? $signed(reg77) : reg102) ?
                  reg87[(1'h0):(1'h0)] : $signed({wire44, (7'h42)}))),
              (8'hbd)};
          reg105 <= wire49[(2'h2):(1'h0)];
          reg106 <= reg76;
          reg107 <= $signed(wire88[(1'h1):(1'h1)]);
        end
    end
  assign wire109 = wire64;
  assign wire110 = {{($unsigned((&(7'h44))) ?
                               $signed($signed((7'h41))) : ($unsigned(reg55) ?
                                   {wire90, (8'ha2)} : ((8'hac) ^ wire88))),
                           (wire49[(3'h4):(3'h4)] == (^((8'hbc) ?
                               (8'ha8) : wire50)))},
                       ({(~&(~|reg101))} ?
                           $unsigned({$unsigned(wire45)}) : wire52)};
endmodule

module module27
#(parameter param38 = ({((&((8'hbd) ? (8'ha2) : (8'h9e))) << (&((7'h44) >> (8'hba))))} ? ((8'hb6) ? (8'hb1) : (~|(~((8'hab) <<< (8'hb2))))) : (((^((8'hb4) ? (8'ha6) : (8'hba))) ? ((~^(8'hba)) & ((8'ha4) < (8'hbc))) : (~|((8'ha0) ? (8'ha2) : (8'hb8)))) >>> (^({(8'ha0), (8'h9e)} ? {(8'h9e), (8'had)} : {(8'hb5)})))), 
parameter param39 = ((~^(((param38 ? param38 : (8'hae)) ? (param38 ? (8'ha8) : param38) : (&param38)) ? {(param38 ? param38 : param38), (param38 != (8'h9c))} : (param38 | (^(8'hbc))))) ? (&(|(param38 ? param38 : {(8'hab)}))) : ((((param38 ? param38 : param38) ? (param38 - param38) : param38) >= {(param38 ^ param38), param38}) != (-((param38 ? param38 : param38) | param38)))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire32;
  input wire [(5'h12):(1'h0)] wire31;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  assign y = {wire37, wire36, wire34, wire33, reg35, (1'h0)};
  assign wire33 = $unsigned(wire30);
  assign wire34 = ({({$unsigned(wire31)} ? (8'hba) : (^~{wire30, wire33})),
                      wire30} ^ (8'h9e));
  always
    @(posedge clk) begin
      reg35 <= ($unsigned((wire33[(5'h12):(4'he)] >>> wire32)) | {(^~(~((8'hbf) || wire32))),
          $signed(($unsigned(wire28) ?
              wire29[(3'h7):(3'h5)] : wire33[(4'ha):(2'h3)]))});
    end
  assign wire36 = (-{{reg35},
                      ($signed(wire31[(5'h11):(4'hc)]) * $unsigned((&wire31)))});
  assign wire37 = {$unsigned(wire29[(2'h2):(1'h1)]),
                      (wire36 ? (~|$signed((wire30 >>> wire30))) : wire36)};
endmodule
