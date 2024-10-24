module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire198;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire200;
  wire [(5'h13):(1'h0)] wire216;
  wire signed [(5'h10):(1'h0)] wire217;
  wire signed [(3'h5):(1'h0)] wire218;
  wire [(4'hd):(1'h0)] wire221;
  wire signed [(3'h6):(1'h0)] wire223;
  wire [(4'ha):(1'h0)] wire225;
  wire signed [(4'hb):(1'h0)] wire226;
  wire signed [(4'h9):(1'h0)] wire228;
  reg signed [(3'h6):(1'h0)] reg227 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg202 = (1'h0);
  reg [(3'h5):(1'h0)] reg203 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg204 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg205 = (1'h0);
  reg [(5'h14):(1'h0)] reg206 = (1'h0);
  reg [(4'hb):(1'h0)] reg207 = (1'h0);
  reg [(5'h11):(1'h0)] reg208 = (1'h0);
  reg [(4'hf):(1'h0)] reg209 = (1'h0);
  reg [(5'h14):(1'h0)] reg210 = (1'h0);
  reg [(4'hf):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg212 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg213 = (1'h0);
  reg signed [(4'he):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg215 = (1'h0);
  reg [(3'h6):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg220 = (1'h0);
  assign y = {wire198,
                 wire29,
                 wire4,
                 wire27,
                 wire200,
                 wire216,
                 wire217,
                 wire218,
                 wire221,
                 wire223,
                 wire225,
                 wire226,
                 wire228,
                 reg227,
                 reg201,
                 reg202,
                 reg203,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 reg215,
                 reg219,
                 reg220,
                 (1'h0)};
  assign wire4 = ((^~{$unsigned((^~wire2)),
                     $signed($signed(wire2))}) | wire3[(4'h9):(4'h9)]);
  module5 #() modinst28 (wire27, clk, wire2, wire0, wire4, wire3, wire1);
  assign wire29 = wire0[(4'h8):(2'h2)];
  module30 #() modinst199 (.wire33(wire29), .wire34(wire27), .wire32(wire1), .wire31(wire3), .y(wire198), .clk(clk), .wire35(wire2));
  assign wire200 = wire2;
  always
    @(posedge clk) begin
      if ($unsigned((wire27[(4'ha):(2'h2)] || (~wire1))))
        begin
          if (wire2)
            begin
              reg201 <= ((^wire198[(2'h3):(1'h1)]) ?
                  wire1 : (~($unsigned($signed(wire29)) < wire29)));
              reg202 <= (+$signed(wire2[(4'hb):(4'h8)]));
              reg203 <= wire3;
            end
          else
            begin
              reg201 <= (wire4[(4'he):(4'hd)] ?
                  (+$unsigned($signed(wire3[(4'hc):(3'h6)]))) : (^(&(wire27 ~^ wire1))));
              reg202 <= reg203;
              reg203 <= (wire29 ?
                  $signed($unsigned($unsigned({wire200,
                      wire1}))) : $unsigned(($unsigned((wire29 >= reg201)) ?
                      wire200[(4'h9):(3'h4)] : $unsigned($signed(wire200)))));
              reg204 <= (~|(reg202[(3'h5):(3'h4)] ?
                  {$unsigned(reg202)} : $unsigned((|(8'hb1)))));
              reg205 <= ($unsigned(($signed((wire2 ?
                      wire27 : wire198)) <<< $unsigned($signed(wire2)))) ?
                  ($unsigned(reg203[(1'h0):(1'h0)]) > $signed(reg204)) : wire200);
            end
          if ($unsigned(wire4))
            begin
              reg206 <= $unsigned($signed((((wire0 ?
                      reg202 : (8'hac)) <<< (+wire3)) ?
                  (|$signed(wire27)) : $signed($unsigned((8'haa))))));
              reg207 <= (^$signed($unsigned((reg204[(1'h1):(1'h0)] ?
                  wire0 : $signed(wire1)))));
              reg208 <= wire200;
              reg209 <= (~^$signed(reg201[(5'h12):(5'h12)]));
            end
          else
            begin
              reg206 <= wire4[(3'h7):(3'h6)];
              reg207 <= $unsigned(reg203);
              reg208 <= {wire2[(5'h13):(2'h2)]};
              reg209 <= ((wire198[(3'h7):(3'h7)] ?
                  (($unsigned(reg201) ?
                          ((8'h9c) ? (8'hae) : reg201) : $unsigned(reg208)) ?
                      $signed(((8'hac) < wire198)) : $signed((!wire27))) : wire198[(3'h5):(1'h0)]) <<< {$signed($unsigned($unsigned(reg208))),
                  $signed($signed((wire29 ? reg203 : wire200)))});
            end
          if (((wire27[(4'hc):(4'h9)] ?
              {$signed((reg208 && (8'hb9))),
                  $unsigned({reg208})} : ((^~(~^(8'hbf))) ?
                  (reg201 << {reg201,
                      wire1}) : wire27[(1'h0):(1'h0)])) + (~^$unsigned(((^~reg205) ?
              $signed(wire0) : $unsigned(wire1))))))
            begin
              reg210 <= wire200;
              reg211 <= ($signed(wire3[(2'h2):(2'h2)]) & $signed($signed((8'ha0))));
              reg212 <= {$signed((wire3[(4'hd):(3'h6)] & reg205[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg210 <= $unsigned((~&$unsigned((&wire200))));
            end
          reg213 <= wire200;
        end
      else
        begin
          reg201 <= {$signed($unsigned(reg204)),
              $unsigned((((~&reg206) >= (wire2 ?
                  wire27 : reg213)) * (((8'ha6) <= wire0) && reg213[(1'h0):(1'h0)])))};
          reg202 <= (~&(reg204 - $signed({(wire27 ? reg211 : reg212),
              $signed((8'hb2))})));
          reg203 <= $signed((($signed((wire1 <<< reg201)) ?
              (wire0 == {reg210,
                  wire3}) : $signed($signed(wire4))) & (|reg209[(4'h9):(2'h2)])));
          if (wire27)
            begin
              reg204 <= {((reg208 ?
                          $signed($unsigned((7'h44))) : (reg207 || $signed(reg211))) ?
                      {((~^reg207) <<< (reg201 || wire1)),
                          $unsigned((~|wire4))} : $unsigned(wire0))};
              reg205 <= ((|(wire198 & (~^reg211))) > (wire27 ?
                  ($signed($unsigned(reg211)) ?
                      ($signed(wire200) ?
                          (wire29 ?
                              wire3 : reg209) : reg212[(4'hc):(1'h1)]) : reg206) : reg205));
            end
          else
            begin
              reg204 <= {reg202,
                  {(((reg205 ? wire4 : (8'hb0)) != wire1) ?
                          $unsigned($unsigned(wire1)) : $unsigned(wire0))}};
              reg205 <= ((-$signed($unsigned(reg203[(3'h5):(1'h1)]))) < (&{wire4[(3'h7):(2'h2)]}));
              reg206 <= ((7'h41) | $signed((($unsigned(wire27) ?
                  (wire1 << wire29) : (wire27 || wire29)) < $signed(wire2[(4'hd):(3'h6)]))));
              reg207 <= $unsigned(reg212);
              reg208 <= (wire1[(2'h2):(1'h0)] ?
                  $signed(reg206) : (~^({wire198[(2'h2):(1'h0)],
                      reg202} | (!(8'hb1)))));
            end
        end
      reg214 <= ($unsigned(reg201[(4'he):(1'h0)]) * wire29[(4'hd):(4'hc)]);
      reg215 <= wire0;
    end
  assign wire216 = ((({(7'h43)} ? $unsigned(wire1) : reg214[(4'h9):(3'h7)]) ?
                           ($signed((reg211 ?
                               reg201 : (8'ha2))) & (+(^~reg210))) : {(reg203[(1'h0):(1'h0)] ?
                                   reg215[(2'h2):(2'h2)] : $signed(wire29))}) ?
                       wire2[(4'hd):(3'h5)] : (reg209 ?
                           ((~&(+wire2)) >> $unsigned((8'had))) : ((((8'hbc) == reg204) && wire0[(4'h9):(3'h7)]) ?
                               (8'hb8) : reg211[(3'h7):(3'h4)])));
  assign wire217 = (^~$signed(wire3));
  assign wire218 = reg203;
  always
    @(posedge clk) begin
      reg219 <= (^~reg214);
      reg220 <= ({reg208[(2'h3):(2'h3)]} + wire198);
    end
  module79 #() modinst222 (.wire82(wire29), .wire80(reg214), .clk(clk), .wire84(reg215), .y(wire221), .wire81(reg211), .wire83(wire200));
  module138 #() modinst224 (.wire141(wire3), .clk(clk), .y(wire223), .wire139(wire217), .wire142(wire4), .wire140(wire27));
  assign wire225 = ($signed((reg202[(3'h4):(1'h0)] ?
                           wire2 : (-$unsigned((8'hbe))))) ?
                       wire0[(4'h8):(4'h8)] : (-((8'hbb) >>> (&(wire217 | (8'ha7))))));
  assign wire226 = (8'hb9);
  always
    @(posedge clk) begin
      reg227 <= wire223;
    end
  module36 #() modinst229 (.clk(clk), .wire37(wire1), .wire41(reg212), .y(wire228), .wire38(wire29), .wire40(reg209), .wire39(wire223));
endmodule

module module30
#(parameter param196 = {(((((8'hb3) ? (8'hb1) : (8'hba)) | ((8'hb6) ? (8'haa) : (8'ha4))) ? {(8'ha6)} : (((8'ha8) ? (8'h9e) : (8'ha2)) >= (8'ha2))) != (({(8'h9e)} != (+(8'hb0))) != (^(&(8'had)))))}, 
parameter param197 = (param196 <<< param196))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  input wire [(4'he):(1'h0)] wire33;
  input wire [(5'h13):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire117;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire194;
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  assign y = {wire71,
                 wire73,
                 wire111,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire137,
                 wire194,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg113,
                 reg114,
                 reg115,
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
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 (1'h0)};
  module36 #() modinst72 (wire71, clk, wire32, wire31, wire33, wire34, wire35);
  assign wire73 = $signed((!({$signed(wire34)} ?
                      (wire34 ?
                          {wire31} : $unsigned(wire71)) : $unsigned((wire34 ^ wire71)))));
  always
    @(posedge clk) begin
      reg74 <= wire71[(1'h0):(1'h0)];
      reg75 <= (8'h9d);
      reg76 <= (~((~|$unsigned(reg75[(4'ha):(2'h2)])) ?
          ((8'hb5) ~^ reg75[(3'h7):(3'h4)]) : (+($unsigned(wire71) | $unsigned(reg75)))));
      reg77 <= reg74[(1'h0):(1'h0)];
      reg78 <= (reg74[(2'h2):(1'h1)] ?
          (wire34[(4'hb):(3'h5)] ?
              $unsigned((wire73 ?
                  $signed(wire31) : $signed(wire34))) : ((|$signed(reg75)) ?
                  $signed((|wire35)) : (wire31[(3'h7):(3'h4)] ^ {wire31,
                      (8'hb7)}))) : $signed((8'h9d)));
    end
  module79 #() modinst112 (.y(wire111), .wire80(wire32), .wire82(reg77), .wire81(wire35), .clk(clk), .wire83(wire31), .wire84(wire73));
  always
    @(posedge clk) begin
      reg113 <= reg75[(1'h1):(1'h0)];
      reg114 <= $signed((|$signed(wire35[(3'h5):(3'h5)])));
      reg115 <= ($signed(((wire111[(3'h7):(3'h4)] ?
              (!wire111) : (reg113 ? wire111 : wire35)) + $signed((|reg113)))) ?
          (({$unsigned(wire32), {wire33, wire31}} || ({wire111,
              wire71} > (wire31 ?
              reg114 : wire111))) & reg77[(4'ha):(3'h5)]) : $unsigned(wire33));
    end
  assign wire116 = $unsigned(wire111[(2'h2):(1'h0)]);
  assign wire117 = (~^$signed(($signed($unsigned(reg78)) ^ $unsigned((8'ha3)))));
  assign wire118 = wire73;
  assign wire119 = (reg77 == $signed($unsigned(((+(8'haa)) < ((8'ha4) >>> reg75)))));
  always
    @(posedge clk) begin
      reg120 <= (wire73[(4'ha):(3'h4)] ?
          $signed((!$signed({wire71}))) : $signed(((+(&reg75)) ?
              {(wire116 ? wire33 : wire32)} : reg114[(3'h5):(2'h3)])));
      if (wire73[(3'h4):(2'h2)])
        begin
          reg121 <= $unsigned($unsigned(((+(reg77 ?
              reg78 : wire32)) >= ($unsigned(reg114) ?
              $signed(wire31) : (&wire32)))));
        end
      else
        begin
          if ($signed(reg120[(3'h6):(2'h2)]))
            begin
              reg121 <= {wire116};
              reg122 <= $unsigned({$unsigned({{wire73}}), reg74});
              reg123 <= ({wire71} <= wire32[(1'h0):(1'h0)]);
            end
          else
            begin
              reg121 <= ({reg114[(3'h4):(2'h2)]} ?
                  ((((wire32 || wire31) ?
                          reg113 : reg121) * ($signed(wire118) - $unsigned(reg122))) ?
                      $signed((~|reg122)) : (wire34 < $unsigned({reg120,
                          reg74}))) : $signed((wire33[(4'h9):(3'h6)] ^~ wire117[(2'h3):(2'h3)])));
            end
          reg124 <= ((|((~|(reg77 ^ reg113)) >> {((8'hb8) || reg78)})) ?
              $unsigned(reg121[(4'hb):(4'h9)]) : wire34);
          reg125 <= reg113;
          reg126 <= {wire119,
              ($unsigned((8'ha0)) >> $unsigned($signed((^reg125))))};
        end
      reg127 <= ((reg114[(3'h6):(3'h6)] ?
              (($unsigned(wire32) ? $unsigned(reg75) : $signed(reg125)) ?
                  $signed((~&reg115)) : wire31) : ((~wire117[(1'h1):(1'h1)]) >>> $signed($unsigned(reg122)))) ?
          (~^{($unsigned(wire119) <= reg125[(2'h2):(1'h0)]),
              $signed($signed(wire34))}) : wire33[(1'h0):(1'h0)]);
      if (reg78[(1'h0):(1'h0)])
        begin
          reg128 <= {(^~(reg125[(3'h6):(1'h0)] ?
                  $unsigned($unsigned(reg113)) : wire31)),
              reg113[(3'h7):(1'h1)]};
          reg129 <= wire73;
          if ($unsigned((((^~{reg122}) ^ $unsigned((8'ha3))) ?
              (~wire34) : reg127[(3'h7):(2'h3)])))
            begin
              reg130 <= wire31[(5'h13):(4'he)];
            end
          else
            begin
              reg130 <= $signed(($signed($unsigned($unsigned((8'had)))) <<< ((-(reg127 ?
                  wire32 : wire32)) - reg121[(2'h2):(2'h2)])));
              reg131 <= $unsigned((((wire111[(2'h3):(2'h3)] ?
                          $signed(reg126) : {wire111, reg123}) ?
                      ((reg114 & reg121) & ((8'hbe) <<< wire35)) : (^$unsigned(wire35))) ?
                  (reg76[(2'h3):(1'h0)] == reg123[(4'hc):(3'h7)]) : ((&(&(8'had))) ?
                      ((&wire119) & (wire71 ?
                          reg114 : reg122)) : $signed($unsigned((8'hba))))));
              reg132 <= $unsigned(reg121[(4'hc):(4'hb)]);
              reg133 <= $signed(reg131[(1'h0):(1'h0)]);
              reg134 <= $signed((reg78[(3'h6):(1'h1)] ?
                  reg122[(3'h6):(3'h6)] : reg128[(3'h5):(2'h2)]));
            end
          reg135 <= (8'ha0);
          reg136 <= $unsigned((~(8'hb9)));
        end
      else
        begin
          reg128 <= reg122[(1'h0):(1'h0)];
          reg129 <= (8'h9e);
        end
    end
  assign wire137 = $signed((~($signed((8'h9f)) ?
                       reg74[(1'h0):(1'h0)] : wire31)));
  module138 #() modinst195 (wire194, clk, wire73, wire117, reg78, wire118);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire17,
                 wire16,
                 wire15,
                 wire12,
                 wire11,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = (!({{(wire7 & wire8)}, $signed((wire9 ? wire8 : wire10))} ?
                      wire7[(3'h4):(2'h3)] : ($unsigned((wire10 | wire7)) || wire8)));
  assign wire12 = wire8;
  always
    @(posedge clk) begin
      reg13 <= $unsigned((wire6[(2'h3):(2'h2)] ?
          $signed(((wire9 ? wire11 : (8'hbc)) ?
              ((8'hb1) ?
                  wire6 : wire7) : $unsigned(wire11))) : (-($unsigned((8'ha8)) ?
              $unsigned(wire9) : $signed(wire9)))));
      reg14 <= ((wire8 ? (^$signed($signed(reg13))) : wire11) ?
          ($signed({(wire11 ^ wire7)}) ?
              (~&wire7) : {reg13,
                  ((|(8'ha3)) ?
                      (wire11 ? wire8 : wire11) : {wire12})}) : $signed(wire6));
    end
  assign wire15 = (|$unsigned(wire7[(1'h1):(1'h0)]));
  assign wire16 = ((wire7[(2'h3):(1'h1)] ?
                          (~$signed((~|wire8))) : wire11[(4'h8):(2'h2)]) ?
                      reg14 : ($signed(reg13) != (~|$signed((reg13 || wire10)))));
  assign wire17 = wire9[(5'h13):(5'h10)];
  always
    @(posedge clk) begin
      reg18 <= (((!$unsigned({(8'hbe)})) ?
          $unsigned($signed($signed(wire6))) : ((wire7 ?
                  wire8[(2'h3):(2'h3)] : $signed(wire17)) ?
              wire16[(2'h2):(1'h1)] : (wire17[(2'h3):(1'h0)] ?
                  (|wire12) : $signed(wire7)))) | (&wire7));
      reg19 <= (wire17[(2'h3):(2'h2)] ~^ $signed(($unsigned({reg13, wire10}) ?
          $unsigned(wire7[(4'hf):(1'h0)]) : (((8'hb6) ? wire10 : (8'hb5)) ?
              wire17 : $unsigned(wire6)))));
      if (({(~^wire17[(1'h0):(1'h0)])} ?
          (8'hac) : (^~((wire9[(4'hb):(3'h4)] ^ $unsigned((7'h42))) ?
              $unsigned($unsigned(wire12)) : reg19))))
        begin
          reg20 <= $unsigned((wire10 ?
              ((-(-wire15)) > wire11) : $signed($signed({wire12}))));
          reg21 <= wire10[(4'ha):(3'h5)];
          reg22 <= wire15[(4'hc):(2'h3)];
        end
      else
        begin
          reg20 <= reg22;
          reg21 <= ({((wire12 ? wire16[(4'h9):(3'h5)] : wire6) ?
                      {$unsigned(wire12)} : (8'ha7))} ?
              (wire10 < {((wire6 ? wire6 : reg13) ?
                      $unsigned(wire6) : (&(8'hab))),
                  ($unsigned((8'hb6)) ?
                      (reg19 ? wire16 : wire8) : (wire15 ?
                          (8'h9d) : wire11))}) : $unsigned($signed((wire10 ^ $signed(wire10)))));
          reg22 <= ($unsigned({reg19[(4'h8):(1'h1)]}) ^ (8'h9f));
          reg23 <= reg20[(3'h6):(2'h3)];
        end
    end
  assign wire24 = reg20;
  assign wire25 = $unsigned($unsigned((~$signed((+wire17)))));
  assign wire26 = wire17;
endmodule

module module138  (y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'h254):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire142;
  input wire [(4'hf):(1'h0)] wire141;
  input wire signed [(5'h13):(1'h0)] wire140;
  input wire signed [(2'h2):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire193;
  wire [(4'h9):(1'h0)] wire192;
  wire [(4'h8):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire [(5'h12):(1'h0)] wire189;
  wire signed [(4'hc):(1'h0)] wire188;
  wire [(5'h11):(1'h0)] wire187;
  wire signed [(2'h2):(1'h0)] wire186;
  wire signed [(5'h14):(1'h0)] wire185;
  wire [(3'h5):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire160;
  wire [(4'hb):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire146;
  wire signed [(3'h4):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire143;
  reg signed [(4'hc):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg183 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg180 = (1'h0);
  reg [(5'h14):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg178 = (1'h0);
  reg [(4'hc):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg176 = (1'h0);
  reg [(4'he):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg168 = (1'h0);
  reg [(4'he):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg158 = (1'h0);
  reg [(5'h14):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
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
                 (1'h0)};
  assign wire143 = wire141;
  assign wire144 = (8'hb3);
  assign wire145 = ({$unsigned($signed((wire140 ^ wire139))),
                       $unsigned(((wire141 ?
                           wire140 : wire139) * (~&wire144)))} == (^({$signed(wire139),
                       wire142[(1'h1):(1'h0)]} - ((wire143 ?
                       wire140 : wire140) << $signed(wire139)))));
  assign wire146 = wire142[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg147 <= $signed((wire142[(2'h2):(2'h2)] ?
          {$signed(wire141)} : wire146[(2'h2):(1'h0)]));
      if ((wire145[(2'h2):(1'h0)] ~^ (~&(^~wire144))))
        begin
          reg148 <= ((wire144 ?
                  $signed(wire141) : (({(8'ha9), wire143} && {wire143}) ?
                      wire145[(1'h0):(1'h0)] : ((|wire145) - wire139[(2'h2):(2'h2)]))) ?
              $signed({(&wire146[(1'h0):(1'h0)]),
                  ((wire140 ? wire143 : (8'hbc)) ?
                      $unsigned((8'hb2)) : wire139)}) : $signed(($unsigned((^~wire142)) ?
                  $unsigned($signed(wire143)) : {$unsigned(wire139)})));
          reg149 <= reg147[(3'h7):(2'h3)];
          reg150 <= wire144[(3'h5):(1'h1)];
        end
      else
        begin
          reg148 <= ((wire145 < (~($signed(reg150) ?
              wire142[(1'h0):(1'h0)] : $unsigned(wire142)))) | ({$unsigned((~|wire140))} ?
              $signed({wire141,
                  $unsigned(wire146)}) : $unsigned(((wire144 & reg149) ?
                  wire145[(3'h4):(1'h0)] : (wire145 ? wire141 : (8'haf))))));
          reg149 <= ($unsigned($unsigned((wire140 ?
              $signed(wire143) : reg148[(3'h5):(3'h5)]))) * reg147);
          reg150 <= reg149[(1'h0):(1'h0)];
          reg151 <= ($signed(reg148[(3'h5):(2'h3)]) >>> $signed(wire142));
        end
    end
  always
    @(posedge clk) begin
      reg152 <= $signed($unsigned((8'h9c)));
      if ($unsigned(wire143[(1'h1):(1'h1)]))
        begin
          reg153 <= ($unsigned(($signed((wire146 && reg152)) ?
                  $signed($unsigned((8'h9d))) : (+reg147))) ?
              wire144 : (!$unsigned(($signed(wire140) - {(8'ha0)}))));
          reg154 <= (7'h42);
          reg155 <= ((|(-$signed(wire139))) - wire140);
          reg156 <= $signed($unsigned(((wire142 ?
                  reg150[(2'h2):(2'h2)] : $signed(wire139)) ?
              reg147 : ((reg152 ? wire146 : reg150) == $unsigned((7'h44))))));
        end
      else
        begin
          reg153 <= $unsigned((!wire140[(2'h3):(1'h1)]));
          reg154 <= $unsigned((reg155 ?
              (((^~wire145) >= $signed(wire145)) ?
                  wire146[(2'h2):(1'h1)] : wire143) : reg153));
        end
      reg157 <= (^$signed({{wire140[(4'hf):(4'ha)]},
          $signed($signed(reg151))}));
      reg158 <= {(&$signed(((^wire143) & (reg147 ? reg149 : reg157)))),
          $signed((((8'ha5) ? (^~(8'hac)) : reg157) ?
              $unsigned($unsigned((8'h9c))) : $signed($signed(wire144))))};
    end
  assign wire159 = wire143[(1'h0):(1'h0)];
  assign wire160 = wire143[(2'h3):(2'h3)];
  assign wire161 = {(((wire144 <<< $unsigned((8'ha1))) > (|$signed((8'hbc)))) ?
                           (&wire142) : $signed(((~reg157) ?
                               (reg148 ? reg150 : reg150) : {wire143,
                                   (8'ha3)})))};
  assign wire162 = ($unsigned($signed($signed({reg151}))) ?
                       $signed((wire146[(1'h1):(1'h0)] <= ((wire144 ?
                           reg152 : reg151) >>> $signed(reg155)))) : $unsigned((|wire143[(1'h0):(1'h0)])));
  assign wire163 = reg149;
  always
    @(posedge clk) begin
      reg164 <= ($signed(($unsigned((reg150 ? reg147 : reg156)) * reg156)) ?
          reg153 : $unsigned($signed($signed(wire159))));
    end
  always
    @(posedge clk) begin
      if ((((~&(reg164[(2'h2):(1'h1)] - $signed(wire141))) ?
              (~|$signed((~|reg154))) : $signed(((wire141 ? reg152 : reg155) ?
                  reg151 : (^wire139)))) ?
          wire142 : (!$signed((+(&wire143))))))
        begin
          reg165 <= (!(^{$signed((~|wire146)),
              $signed((reg151 ? wire162 : reg155))}));
          reg166 <= ((^wire139) < $signed(reg151));
          if (reg164)
            begin
              reg167 <= $unsigned((|(8'h9d)));
              reg168 <= (wire162 ^ $unsigned(wire161[(1'h1):(1'h1)]));
              reg169 <= $signed($signed(($unsigned((wire145 <<< reg149)) ?
                  reg150[(3'h5):(1'h0)] : {{wire162, wire161}})));
              reg170 <= $unsigned({reg154[(3'h4):(3'h4)]});
              reg171 <= {$unsigned(wire145),
                  $unsigned({$unsigned(reg156[(3'h4):(2'h3)])})};
            end
          else
            begin
              reg167 <= reg147[(4'hb):(3'h6)];
            end
        end
      else
        begin
          reg165 <= ((&(~((reg157 < wire162) << (~reg158)))) ?
              $signed($signed(((wire159 ?
                  wire161 : reg155) << (reg156 < (8'hb8))))) : $signed((~((reg152 - reg148) | reg155[(2'h3):(1'h0)]))));
          reg166 <= {({(^wire159[(3'h7):(3'h5)]),
                  wire161} - $unsigned(($unsigned(reg152) << $unsigned(reg149))))};
          reg167 <= $signed($unsigned(wire145));
          reg168 <= (reg171[(4'hf):(3'h7)] <<< wire139[(2'h2):(1'h0)]);
        end
      reg172 <= ((~|$signed($signed((wire160 ? reg157 : wire146)))) ?
          reg168 : $unsigned((({(8'hb9),
              reg158} != $unsigned(wire160)) - $signed((&reg166)))));
      if (wire160[(1'h0):(1'h0)])
        begin
          reg173 <= (-wire160[(2'h2):(1'h0)]);
        end
      else
        begin
          reg173 <= (reg154 + reg171[(2'h2):(1'h1)]);
        end
      reg174 <= $signed(reg165[(1'h1):(1'h0)]);
      if (({$unsigned(($unsigned(wire141) ?
              $unsigned(reg148) : (-reg172)))} * reg165[(2'h2):(1'h0)]))
        begin
          reg175 <= $signed(($unsigned({wire161[(3'h7):(3'h7)],
              wire162[(4'hf):(1'h1)]}) + ((+{reg156}) ?
              reg147[(3'h5):(3'h5)] : ((reg172 ?
                  (8'hab) : (8'h9d)) + (reg157 || (8'haf))))));
          reg176 <= wire139[(1'h1):(1'h1)];
          reg177 <= (reg166 ? (8'hb2) : wire162[(4'hc):(1'h1)]);
          reg178 <= {$unsigned((wire162 != $signed((-reg147)))),
              ((((wire139 ?
                  reg168 : reg158) <<< $signed(reg171)) != reg167[(4'hb):(4'h8)]) * wire163)};
        end
      else
        begin
          if ($signed((+($signed((wire139 - wire161)) ?
              {(wire159 ? (8'ha3) : reg173),
                  (reg156 < reg153)} : ((|reg166) != $unsigned((8'h9d)))))))
            begin
              reg175 <= {reg173};
              reg176 <= reg175;
            end
          else
            begin
              reg175 <= wire163[(2'h3):(2'h3)];
              reg176 <= (((((^reg165) ?
                          $signed(reg155) : wire145[(2'h2):(1'h0)]) ?
                      {(reg148 < reg176)} : $signed((reg151 ^ reg157))) <<< {reg168[(3'h4):(1'h0)],
                      reg170[(1'h1):(1'h1)]}) ?
                  ((~&($signed(reg167) ?
                          (reg148 ? reg152 : reg169) : reg164[(2'h3):(2'h2)])) ?
                      reg176[(2'h3):(2'h2)] : ((wire142 && $unsigned(reg168)) ?
                          ($unsigned(reg178) ?
                              (reg174 < reg176) : $signed((8'hb7))) : reg152[(4'h8):(1'h1)])) : ($signed($signed($unsigned(reg169))) && reg167));
              reg177 <= wire146;
              reg178 <= (8'haa);
              reg179 <= (8'ha4);
            end
          reg180 <= ((8'hab) ?
              $unsigned({{$unsigned(reg171)}}) : $signed((7'h40)));
          if (((|reg158) || (wire142[(2'h2):(1'h0)] - ((~|((7'h44) ?
              reg157 : (8'h9f))) <<< $unsigned((reg180 < reg149))))))
            begin
              reg181 <= (|(8'haf));
              reg182 <= (^~(wire139 & $unsigned((8'hb4))));
              reg183 <= {(reg153 < {$unsigned(reg182)}), reg165[(1'h1):(1'h1)]};
              reg184 <= ((-(!$unsigned((~wire139)))) ?
                  $unsigned((^~(!reg154[(1'h1):(1'h1)]))) : (|($unsigned({reg170}) ?
                      {reg150, $unsigned(wire145)} : reg166[(4'hd):(3'h4)])));
            end
          else
            begin
              reg181 <= (((|reg151[(4'hc):(3'h4)]) ?
                      (^~(reg169 & (+reg178))) : reg169) ?
                  {reg178,
                      (reg181 >>> $signed((+reg149)))} : reg166[(4'h8):(1'h0)]);
              reg182 <= reg148;
            end
        end
    end
  assign wire185 = ($signed(($signed(reg174) ?
                       ((8'ha9) & $signed(reg171)) : wire160[(1'h1):(1'h1)])) <<< (reg164 <= (($signed(reg174) < (^~reg154)) <<< wire163)));
  assign wire186 = ((~(~^reg167[(3'h4):(2'h3)])) + reg150);
  assign wire187 = ((($unsigned($unsigned((8'hb0))) ?
                           $unsigned((~^wire141)) : (!{reg172, wire144})) ?
                       $unsigned($signed($unsigned(reg180))) : reg154[(3'h5):(3'h4)]) >>> $signed(reg172));
  assign wire188 = ($signed(wire161) ?
                       $unsigned(reg149) : $unsigned(($unsigned((^reg182)) >= $signed(wire159[(2'h2):(2'h2)]))));
  assign wire189 = ((~|{((8'hb5) + (reg167 ? wire159 : reg153))}) ?
                       $signed({((reg173 >= reg148) ?
                               $signed(wire163) : $signed(reg180))}) : $unsigned((((+wire161) << (8'hae)) << $signed((-(7'h41))))));
  assign wire190 = (reg153 ? reg167[(1'h0):(1'h0)] : $signed(reg147));
  assign wire191 = ((-(~$signed(reg175))) <<< (wire163 ?
                       (7'h44) : (reg153 ? wire186[(1'h0):(1'h0)] : reg174)));
  assign wire192 = wire145[(3'h4):(3'h4)];
  assign wire193 = reg173;
endmodule

module module79  (y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire84;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire signed [(3'h7):(1'h0)] wire82;
  input wire [(4'hf):(1'h0)] wire81;
  input wire [(4'he):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire86;
  wire [(4'h9):(1'h0)] wire85;
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire85 = $unsigned((wire82 * $unsigned((&{wire82}))));
  assign wire86 = $unsigned(($signed($unsigned((wire80 ?
                      (8'h9f) : (8'ha6)))) > (~&wire81)));
  assign wire87 = (wire86[(3'h4):(3'h4)] & wire86[(4'h8):(3'h4)]);
  assign wire88 = (($signed((~^wire87[(1'h0):(1'h0)])) ?
                          (((^~wire85) ? wire84 : wire85[(2'h3):(2'h2)]) ?
                              $signed({wire81,
                                  wire86}) : wire86) : (wire86 != wire81)) ?
                      (wire82 >= $signed(wire81[(4'hc):(4'hb)])) : (wire81 ^ wire87));
  assign wire89 = ((8'haa) ?
                      ($unsigned(wire86[(3'h4):(1'h1)]) ?
                          wire83 : (^((~^wire82) ?
                              (wire81 ?
                                  wire86 : (8'hb6)) : wire80[(4'he):(4'h8)]))) : wire87[(2'h2):(2'h2)]);
  assign wire90 = $unsigned($signed((({wire84, wire87} ?
                          (~&wire80) : wire89[(2'h2):(1'h0)]) ?
                      (~|(wire88 || wire81)) : (wire87 ?
                          wire87 : (wire87 < wire84)))));
  assign wire91 = ((((^~$unsigned(wire82)) || $unsigned($unsigned(wire90))) ?
                          $unsigned(wire84) : $signed({{wire82, wire84},
                              $unsigned(wire87)})) ?
                      wire90 : ($unsigned(wire87[(1'h0):(1'h0)]) >>> $signed($signed(wire89))));
  always
    @(posedge clk) begin
      reg92 <= ($signed((wire83[(3'h7):(3'h5)] ^ wire88)) ?
          ($signed($unsigned(wire89)) ?
              $unsigned(((-wire86) ?
                  $signed(wire83) : wire88[(4'h8):(3'h6)])) : (wire83 && (~&(wire91 | wire80)))) : ((!$unsigned(wire86[(4'ha):(3'h6)])) ?
              (wire80 >> (wire90[(4'ha):(3'h4)] | (wire82 ?
                  wire84 : wire90))) : $signed((wire81 ?
                  $unsigned(wire80) : wire87))));
      if ($unsigned((~^($unsigned(wire86) ?
          {(~|wire87)} : $unsigned((wire87 <= wire85))))))
        begin
          reg93 <= reg92;
          reg94 <= $unsigned($unsigned(wire83[(2'h2):(1'h1)]));
          reg95 <= (^$unsigned(wire81));
        end
      else
        begin
          reg93 <= wire84[(1'h0):(1'h0)];
          reg94 <= $unsigned($signed($signed($signed((^~(8'hae))))));
          reg95 <= $signed({$signed(({reg92} ? (8'hb6) : (wire86 ^ wire88))),
              (^(!$unsigned((8'haa))))});
        end
      reg96 <= wire89;
      reg97 <= $unsigned($signed(wire84));
    end
  assign wire98 = reg95;
  assign wire99 = ($signed((^~$unsigned(reg95[(3'h4):(1'h1)]))) << wire85);
  assign wire100 = ((^~{$signed(wire81),
                       ((!reg96) ?
                           (wire83 ? wire86 : wire99) : (wire98 ?
                               wire85 : (8'ha6)))}) >> wire98);
  assign wire101 = wire84[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg102 <= (^wire85);
      if ($signed((!((~|$signed(wire86)) ?
          $unsigned((+reg94)) : ((wire99 >> reg97) < (~|wire82))))))
        begin
          reg103 <= (($unsigned(($unsigned((7'h44)) ?
                  {wire91, reg97} : wire83)) ?
              $signed({reg93[(1'h0):(1'h0)],
                  wire81[(4'he):(2'h3)]}) : wire80[(4'ha):(4'ha)]) ^ {$signed($unsigned((reg96 ?
                  wire87 : wire90))),
              ((!$signed(wire89)) == (+(reg95 | wire86)))});
          reg104 <= $unsigned((reg103[(3'h7):(3'h5)] ?
              (^((wire99 ? wire88 : reg97) ?
                  {reg102} : (reg102 ? wire89 : wire88))) : (~wire90)));
        end
      else
        begin
          reg103 <= {$signed($signed({wire91}))};
          reg104 <= ($signed(((~&(|wire90)) ? (~&(~reg97)) : reg104)) ?
              $signed((wire98[(4'h9):(3'h7)] ?
                  (^~$unsigned(wire91)) : $unsigned((reg95 * wire99)))) : ((reg93[(1'h0):(1'h0)] ?
                      (reg103[(1'h1):(1'h0)] >= $unsigned(wire85)) : {{reg102},
                          $signed(wire89)}) ?
                  (reg95[(4'hc):(2'h2)] ?
                      reg93 : $signed($signed(wire80))) : {(-$signed(wire100)),
                      (~&$unsigned(wire84))}));
          if ((wire90[(1'h1):(1'h0)] | ((((&(8'ha6)) ^~ (reg94 == reg103)) - (~&reg94[(1'h0):(1'h0)])) ?
              $signed((wire87[(2'h2):(1'h0)] ?
                  wire83[(4'he):(4'hc)] : wire88[(1'h0):(1'h0)])) : $signed((8'ha4)))))
            begin
              reg105 <= reg96;
              reg106 <= {{(~|(8'hbb)), (~&{(wire91 * wire89), (~&(8'ha7))})}};
              reg107 <= (wire91[(5'h13):(1'h0)] ?
                  wire82[(2'h2):(2'h2)] : reg94[(2'h2):(1'h1)]);
              reg108 <= (reg96[(3'h7):(3'h5)] ?
                  reg97[(3'h4):(1'h0)] : {$unsigned(((wire86 ?
                              reg106 : wire80) ?
                          $unsigned((8'hbb)) : wire91)),
                      ($signed((&reg96)) >> (!$unsigned(wire101)))});
              reg109 <= $signed((+(reg103[(5'h12):(4'h9)] * {(^reg93)})));
            end
          else
            begin
              reg105 <= $signed((reg104 ?
                  $unsigned(((reg97 < (8'ha1)) ?
                      (wire80 ?
                          (8'h9c) : reg106) : (wire84 ^~ reg95))) : (reg106 ?
                      reg103[(3'h4):(2'h2)] : reg96[(4'h9):(4'h9)])));
              reg106 <= $signed((-(~&($unsigned(wire87) & (~|wire80)))));
              reg107 <= wire84;
              reg108 <= wire85[(3'h7):(3'h7)];
            end
          reg110 <= wire86;
        end
    end
endmodule

module module36
#(parameter param69 = ((-(8'ha2)) == (-((~&(+(8'hbc))) <<< {((8'ha7) ? (8'hac) : (7'h41)), (~&(8'hba))}))), 
parameter param70 = param69)
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire signed [(4'hf):(1'h0)] wire40;
  input wire [(3'h6):(1'h0)] wire39;
  input wire signed [(5'h11):(1'h0)] wire38;
  input wire [(4'hb):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 reg56,
                 reg55,
                 reg54,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire42 = ($signed($signed((&wire41))) <= wire40);
  assign wire43 = wire41;
  assign wire44 = (~$unsigned($signed(wire38)));
  always
    @(posedge clk) begin
      reg45 <= (~wire39[(3'h5):(2'h3)]);
      if ((($signed($unsigned(wire41)) ?
              $unsigned($unsigned($signed((8'hb0)))) : wire38) ?
          $signed($unsigned(($unsigned(wire40) ?
              $signed(wire37) : wire43))) : {(((~|wire42) << $unsigned(wire38)) ?
                  wire41[(4'h9):(2'h3)] : (~|((8'haf) ? (8'h9f) : wire37))),
              $signed((|{wire41}))}))
        begin
          reg46 <= $signed(((8'hb0) ?
              $unsigned($signed((reg45 ?
                  reg45 : wire42))) : ($signed((wire41 & wire38)) ?
                  (+wire42[(1'h1):(1'h0)]) : ($signed(wire37) <= wire43))));
          reg47 <= (wire39 ^~ (($unsigned($unsigned(wire42)) ?
              (!reg45) : $unsigned((wire42 ?
                  wire40 : reg46))) <= wire41[(3'h6):(1'h1)]));
          reg48 <= $signed(wire40[(3'h4):(1'h1)]);
          if (({reg47, (($signed(reg45) ? $signed(wire37) : reg45) | reg46)} ?
              (~((|wire37[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned(reg45)) : $unsigned(wire40[(2'h3):(2'h2)]))) : reg47))
            begin
              reg49 <= reg48[(5'h12):(4'hc)];
            end
          else
            begin
              reg49 <= {$signed($unsigned(($unsigned(reg46) & reg48)))};
            end
          reg50 <= $signed((($signed((reg45 ?
              reg45 : reg48)) | (8'hac)) + $signed($signed($signed(wire40)))));
        end
      else
        begin
          reg46 <= wire39;
          if ((($unsigned(reg45) ?
                  (8'h9d) : (wire42[(1'h1):(1'h0)] ~^ wire44)) ?
              {wire41[(5'h12):(3'h6)]} : {wire43[(3'h4):(1'h0)],
                  ($unsigned(wire44[(2'h3):(1'h0)]) ?
                      ({(8'ha2)} <= (~wire39)) : $unsigned($unsigned(wire41)))}))
            begin
              reg47 <= (&($signed(((reg50 ? wire43 : wire43) ?
                      $signed(wire39) : $signed(reg47))) ?
                  ({wire44} ?
                      reg48[(4'h8):(2'h3)] : (^~(wire40 & wire39))) : (&(^(-wire44)))));
            end
          else
            begin
              reg47 <= {reg50, $signed($signed(wire40[(1'h0):(1'h0)]))};
              reg48 <= $unsigned($signed((8'had)));
              reg49 <= reg49[(2'h2):(2'h2)];
            end
          reg50 <= (^(~^{(reg45 ^ (reg49 ? (8'hb9) : wire40)),
              reg49[(3'h7):(3'h7)]}));
        end
      reg51 <= $unsigned($signed($signed($signed($signed(reg46)))));
    end
  assign wire52 = (((8'h9d) ? (^reg46) : wire42) ?
                      $signed({{reg50,
                              (!reg48)}}) : $signed({($signed((7'h44)) | (~^(8'ha7)))}));
  assign wire53 = $unsigned(wire40);
  always
    @(posedge clk) begin
      reg54 <= ((reg50[(3'h5):(3'h5)] ?
          $unsigned((!wire44[(3'h6):(2'h3)])) : reg49) > (~|{((wire38 - wire38) || $unsigned(reg45))}));
      reg55 <= {(|((~&(~^(8'h9f))) ? (~wire41) : reg48)), $unsigned(wire39)};
      reg56 <= $unsigned((^~wire43));
    end
  assign wire57 = (^~(($unsigned((~&wire52)) && (+(wire42 ? reg47 : (7'h42)))) ?
                      (((reg55 * reg50) == wire43) ?
                          {$unsigned(wire40)} : $signed($unsigned(reg47))) : $unsigned((8'hb2))));
  assign wire58 = $unsigned(reg46);
  assign wire59 = $unsigned((7'h42));
  assign wire60 = wire59;
  assign wire61 = reg45;
  assign wire62 = reg50[(4'hf):(2'h2)];
  assign wire63 = $signed(((wire62[(2'h2):(2'h2)] ~^ wire52[(3'h6):(2'h2)]) * $unsigned(((reg45 ?
                          reg47 : (8'hb1)) ?
                      (^wire38) : $signed(wire43)))));
  assign wire64 = $signed((+(|$signed($unsigned(reg49)))));
  assign wire65 = (~^($unsigned(({(8'ha2)} ?
                      $signed(wire39) : wire64)) && $signed({wire39})));
  assign wire66 = reg51[(1'h1):(1'h1)];
  assign wire67 = $unsigned((~^({wire44[(1'h1):(1'h1)],
                      wire65[(2'h2):(1'h0)]} < (reg50[(3'h7):(3'h7)] ?
                      $unsigned(reg46) : $unsigned(wire65)))));
  assign wire68 = reg56;
endmodule
