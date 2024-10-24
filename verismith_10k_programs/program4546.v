module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire120;
  assign y = {wire122, wire4, wire5, wire120, (1'h0)};
  assign wire4 = $unsigned((8'ha6));
  assign wire5 = wire1;
  module6 #() modinst121 (wire120, clk, wire3, wire4, wire0, wire1, wire5);
  assign wire122 = wire0;
endmodule

module module6
#(parameter param118 = ({(!(((8'ha0) ^~ (7'h43)) ? ((8'had) ? (8'hb9) : (8'ha3)) : {(8'hb1)}))} | (8'ha6)), 
parameter param119 = (^~((((param118 ? param118 : param118) ? {param118, param118} : {param118}) ? (|param118) : ((param118 ? (8'hb0) : param118) > (param118 ? (7'h41) : param118))) || ({(+param118), ((8'hb5) ? (8'hbe) : param118)} >= (7'h40)))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire115;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire39;
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  assign y = {wire117,
                 wire115,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire39,
                 reg41,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg61,
                 (1'h0)};
  assign wire12 = wire10;
  assign wire13 = (-((((wire12 ? wire10 : wire10) >> (wire10 >>> (7'h43))) ?
                          wire12 : ((wire12 ? wire7 : wire11) ?
                              wire10[(2'h2):(1'h0)] : (wire11 ?
                                  wire8 : wire11))) ?
                      (~wire12[(4'h8):(4'h8)]) : {$unsigned((~wire7))}));
  assign wire14 = wire11[(3'h5):(3'h4)];
  assign wire15 = wire7;
  assign wire16 = (~&wire9);
  module17 #() modinst40 (.y(wire39), .wire21(wire12), .wire18(wire8), .wire19(wire9), .wire20(wire11), .wire22(wire7), .clk(clk));
  always
    @(posedge clk) begin
      reg41 <= wire16;
    end
  assign wire42 = (&(8'hb7));
  assign wire43 = {(|wire8[(5'h12):(4'ha)]), $unsigned(wire12)};
  assign wire44 = wire12;
  assign wire45 = (wire9[(4'ha):(1'h1)] ?
                      (((((8'haa) > wire11) || (8'hab)) ?
                              wire8[(4'hb):(2'h3)] : ((wire39 << wire14) ?
                                  (8'h9c) : (&wire43))) ?
                          $unsigned((~&{(8'haf)})) : $signed($unsigned({wire11}))) : $signed(wire16));
  assign wire46 = wire10[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg47 <= wire15;
      if ((!((8'h9c) ?
          ((wire42[(2'h3):(2'h3)] ?
              ((8'h9c) >= wire42) : (wire43 ?
                  (8'hb7) : (8'h9c))) <= (wire14[(2'h2):(1'h1)] ?
              $unsigned(wire16) : reg41)) : (reg41[(3'h5):(1'h1)] && ((wire16 ~^ wire15) ^ ((8'hb1) ^~ reg41))))))
        begin
          if ((-(7'h41)))
            begin
              reg48 <= wire45;
              reg49 <= (((+(~|$signed(wire15))) << {($signed(wire9) << {wire8,
                      wire8})}) & $signed((wire7 ?
                  reg41[(1'h1):(1'h1)] : (~^(&wire42)))));
              reg50 <= ($signed($signed($unsigned(wire39))) * $signed(($signed((~^wire7)) ?
                  (~^{reg49, wire11}) : (|(~|(8'hac))))));
              reg51 <= (wire10[(1'h1):(1'h1)] == (^~$unsigned(wire43[(3'h5):(1'h1)])));
              reg52 <= {wire43[(1'h1):(1'h1)],
                  {wire42,
                      ($unsigned(wire8) ? (|(~|wire12)) : (reg47 ~^ wire8))}};
            end
          else
            begin
              reg48 <= (8'haf);
            end
          reg53 <= wire45;
        end
      else
        begin
          reg48 <= (^(!((~&(wire42 ? wire9 : wire39)) >= wire11)));
          if ($unsigned((!(((wire8 ? wire13 : reg41) ? wire42 : (-wire39)) ?
              $unsigned((wire8 ? wire9 : reg52)) : $signed((^wire15))))))
            begin
              reg49 <= wire43[(5'h11):(4'hc)];
              reg50 <= (($unsigned(reg51[(2'h2):(1'h0)]) ^~ reg52) ?
                  $unsigned(((^~$signed(wire15)) > (~(8'hb7)))) : reg51[(4'hf):(3'h5)]);
              reg51 <= wire9[(3'h4):(2'h3)];
            end
          else
            begin
              reg49 <= wire44;
              reg50 <= $signed($unsigned((wire7[(3'h5):(1'h0)] & (~^(wire13 ^~ wire16)))));
            end
          if ((wire39 ?
              {reg48} : $unsigned($unsigned(({reg50, reg49} ^ (+wire43))))))
            begin
              reg52 <= {(^(~($unsigned(wire13) ?
                      $signed(wire10) : (wire12 - (8'hac)))))};
              reg53 <= $unsigned(reg48[(4'hb):(3'h4)]);
            end
          else
            begin
              reg52 <= (((~{(~wire12)}) ?
                      {((wire11 ? wire13 : wire14) ?
                              (&reg48) : wire46)} : reg49[(1'h1):(1'h1)]) ?
                  reg48[(4'hb):(3'h7)] : ((8'hbf) == reg53[(2'h2):(1'h0)]));
              reg53 <= $unsigned(wire12);
              reg54 <= reg48[(3'h4):(1'h0)];
              reg55 <= ((&wire7[(5'h12):(5'h11)]) == ($unsigned($unsigned($unsigned(wire12))) ?
                  $signed(wire9) : wire12));
              reg56 <= (~reg41[(4'h9):(3'h7)]);
            end
          reg57 <= {wire15, $unsigned(($unsigned(wire14) + wire15))};
          reg58 <= wire42[(3'h7):(3'h5)];
        end
    end
  assign wire59 = wire39;
  assign wire60 = ((($unsigned((wire42 ? reg53 : wire45)) <<< ((reg54 ?
                              wire45 : reg48) ?
                          $unsigned(reg51) : $signed(reg53))) ?
                      {$signed($signed(wire14)),
                          $unsigned((reg47 ?
                              reg52 : reg48))} : reg53) && reg50);
  always
    @(posedge clk) begin
      reg61 <= (reg58[(2'h2):(2'h2)] ? (8'hb2) : reg53[(2'h2):(1'h0)]);
    end
  assign wire62 = $signed((^((^~(wire12 ~^ reg61)) ^~ (|(8'hbd)))));
  assign wire63 = (8'hb2);
  module64 #() modinst116 (.wire66(wire62), .wire69(reg58), .clk(clk), .wire67(wire10), .wire65(wire12), .wire68(wire59), .y(wire115));
  assign wire117 = ($signed((-(|(7'h41)))) - wire43[(5'h11):(4'h9)]);
endmodule

module module64  (y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire69;
  input wire signed [(4'he):(1'h0)] wire68;
  input wire signed [(4'hf):(1'h0)] wire67;
  input wire [(5'h12):(1'h0)] wire66;
  input wire signed [(5'h10):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  assign y = {wire112,
                 wire91,
                 wire90,
                 wire89,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg114,
                 reg113,
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
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire70 = {$unsigned((^$unsigned(wire69))), $unsigned((8'hb4))};
  assign wire71 = $unsigned(wire68[(4'hb):(3'h6)]);
  assign wire72 = {((!$signed((~^wire66))) == $unsigned(wire65)),
                      wire71[(1'h1):(1'h0)]};
  assign wire73 = wire72[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      if ((^wire71[(3'h4):(2'h2)]))
        begin
          reg74 <= $signed(($unsigned((wire68[(4'ha):(1'h0)] ?
              (|wire73) : $unsigned(wire73))) + $unsigned(({wire71, wire66} ?
              $signed((8'ha8)) : (wire70 != wire71)))));
          reg75 <= wire68[(1'h0):(1'h0)];
          reg76 <= ($signed(wire72) ?
              wire70 : (^(+((wire66 ? (7'h44) : wire70) ?
                  $signed(reg75) : ((8'ha6) ? wire72 : wire70)))));
          reg77 <= (reg74 ^~ ((wire71 == $signed($signed(wire69))) == $signed({wire70})));
          reg78 <= $unsigned((((!(wire70 ?
              wire65 : (8'hb7))) <= $signed(wire73[(4'ha):(3'h5)])) >> $unsigned((|$unsigned(wire65)))));
        end
      else
        begin
          reg74 <= ({((~^reg75) ?
                  (~^(!wire70)) : reg74[(2'h2):(2'h2)])} ~^ wire69);
          reg75 <= wire71;
          reg76 <= ((reg77 ?
              reg78[(4'h8):(3'h5)] : reg76[(2'h2):(2'h2)]) != wire69);
          reg77 <= reg76;
          reg78 <= $unsigned($unsigned((((-wire65) * $unsigned(reg78)) || $unsigned({reg75}))));
        end
      reg79 <= reg74;
      if (reg78)
        begin
          reg80 <= ($signed($signed(wire68)) ?
              ((wire67 & wire69[(4'hf):(2'h2)]) ?
                  wire71 : ({reg79[(5'h13):(5'h12)]} & $signed((~&wire69)))) : wire67[(3'h6):(2'h2)]);
          reg81 <= (!wire69[(2'h3):(2'h2)]);
          reg82 <= wire68;
          reg83 <= ((wire68[(1'h1):(1'h1)] ?
              (+(-$signed(wire73))) : ((wire73 ?
                  (~|reg74) : (wire70 > wire68)) - (~wire72))) || wire67[(4'ha):(3'h4)]);
        end
      else
        begin
          reg80 <= (-((+$signed((wire70 <<< reg80))) ?
              (({wire65, reg75} * $unsigned(wire71)) ?
                  reg75[(2'h2):(2'h2)] : $signed(wire69)) : ((wire65 ?
                      wire66 : (reg81 & reg78)) ?
                  reg76 : $signed((wire73 < wire66)))));
          reg81 <= ($unsigned((~reg74)) + (8'hbc));
          reg82 <= $signed(reg77);
        end
      if ($unsigned($signed(wire72)))
        begin
          if ((wire73[(4'h9):(3'h5)] != $signed((~&(!(8'hbe))))))
            begin
              reg84 <= $signed((^$unsigned((~&(!(8'hb1))))));
              reg85 <= ((reg83 ?
                  wire70 : {$signed($unsigned(wire72))}) >>> (wire69 ?
                  $signed($unsigned($unsigned(wire69))) : (~^$signed({reg75}))));
              reg86 <= $signed((wire73 - wire69[(1'h0):(1'h0)]));
              reg87 <= reg79[(2'h3):(1'h0)];
              reg88 <= reg87;
            end
          else
            begin
              reg84 <= $unsigned((^(reg82 >>> ((-reg77) ^ $unsigned(wire68)))));
              reg85 <= {$unsigned({(~|{reg80}), (~wire65[(3'h7):(1'h1)])}),
                  (^(~wire67))};
              reg86 <= $unsigned($unsigned((~{reg74[(1'h1):(1'h1)],
                  $signed(wire66)})));
              reg87 <= (((&($unsigned(wire70) ? $unsigned(reg75) : (&reg74))) ?
                      (((reg88 ?
                          reg88 : reg80) && wire69) <= reg81) : {($signed(wire69) << (wire71 ?
                              reg76 : reg85)),
                          (&(wire72 <<< wire72))}) ?
                  ($signed((|(+reg88))) ?
                      $unsigned(reg83[(3'h7):(1'h0)]) : (($signed(wire71) ?
                          (reg85 >= reg74) : (reg80 ?
                              (8'hba) : wire68)) >>> (~|((8'hac) >= reg80)))) : (((&(reg82 >>> (8'hb1))) ?
                      reg81[(1'h1):(1'h0)] : (reg82[(4'ha):(4'ha)] >> $signed((7'h40)))) <<< (~(~&{(8'hbe),
                      reg85}))));
            end
        end
      else
        begin
          reg84 <= (!wire66);
          reg85 <= {(reg78 + $unsigned(reg85))};
          reg86 <= (wire69 ~^ (^~$signed(wire71[(3'h6):(2'h3)])));
          if (reg87)
            begin
              reg87 <= wire69;
              reg88 <= (-reg85);
            end
          else
            begin
              reg87 <= $signed((($unsigned($unsigned((8'ha0))) ?
                      $signed((reg87 ^ reg79)) : wire70[(3'h6):(1'h1)]) ?
                  ((reg87 ? (^reg79) : (reg81 ? reg76 : wire71)) ?
                      $signed((+reg79)) : reg87) : ($signed($unsigned(reg87)) >> $unsigned($unsigned(wire72)))));
              reg88 <= $unsigned(reg74);
            end
        end
    end
  assign wire89 = ((reg86[(1'h1):(1'h1)] ?
                      ((wire73 | wire72[(4'h8):(1'h0)]) ?
                          (|wire73) : ($unsigned(reg87) && (reg81 & wire73))) : ((-reg87[(3'h5):(2'h2)]) ^~ $unsigned($signed(wire66)))) == reg77);
  assign wire90 = (~|reg75);
  assign wire91 = (wire68 < $unsigned(wire68));
  always
    @(posedge clk) begin
      reg92 <= wire70[(4'h8):(3'h4)];
      reg93 <= wire68;
      if ((~^{(&{(wire66 ? reg93 : (7'h42))})}))
        begin
          reg94 <= (^~reg84);
          reg95 <= $unsigned((~^({$unsigned((7'h43))} * wire72[(3'h4):(1'h0)])));
          if (reg85)
            begin
              reg96 <= $unsigned($unsigned((({(8'ha4), (8'hb0)} ?
                  reg94 : reg78) <<< wire71[(2'h2):(2'h2)])));
              reg97 <= (~&reg93);
              reg98 <= (wire66 >> reg85[(2'h3):(2'h3)]);
              reg99 <= wire70[(4'h8):(1'h0)];
            end
          else
            begin
              reg96 <= $unsigned((({(|reg74)} ?
                  reg81 : $signed($unsigned(wire69))) < ($unsigned((~(8'hbc))) > (~wire70[(2'h3):(1'h1)]))));
            end
        end
      else
        begin
          if ({$unsigned((~|$signed((&wire66))))})
            begin
              reg94 <= (8'hb1);
              reg95 <= (reg78[(3'h4):(1'h0)] ?
                  $signed(reg87[(2'h3):(1'h0)]) : ((({wire66, wire69} ?
                              (^~reg77) : reg95) ?
                          (!{(7'h42), reg87}) : ((reg92 ? reg88 : reg77) ?
                              (~reg97) : (~^reg86))) ?
                      ((reg84 ? $signed((8'ha7)) : reg83) ?
                          ((wire69 >= (8'hbb)) ?
                              wire73 : wire90[(1'h1):(1'h0)]) : $signed((reg74 ^~ reg78))) : $signed({$signed(reg81)})));
              reg96 <= $unsigned((~$signed((^~reg84[(4'hc):(4'ha)]))));
              reg97 <= (^~(($signed($signed(reg88)) * $unsigned((wire90 + reg76))) || reg80[(1'h1):(1'h0)]));
            end
          else
            begin
              reg94 <= reg97[(2'h3):(1'h0)];
              reg95 <= wire66;
              reg96 <= (reg81[(3'h5):(3'h4)] ^ ($signed(($unsigned(wire89) <= (wire73 > wire71))) ?
                  $signed((wire69 ?
                      reg75[(1'h0):(1'h0)] : (reg98 ^ reg92))) : reg76));
            end
          reg98 <= wire65;
          reg99 <= $signed(reg95);
          if ((~^(reg85 ~^ ($signed((reg99 <<< wire72)) ?
              $unsigned($unsigned(reg95)) : reg77))))
            begin
              reg100 <= $signed(({$unsigned(wire72)} ?
                  $signed(wire68[(3'h5):(2'h3)]) : ($signed($signed(wire72)) < ($unsigned(reg95) ?
                      $unsigned(reg92) : $signed(reg96)))));
              reg101 <= (((reg92 | reg93[(1'h0):(1'h0)]) ?
                      {$unsigned((|reg78))} : wire70) ?
                  wire66 : ((+$signed((reg92 | reg93))) ^~ (((reg78 != reg81) ^~ (!reg76)) ^ (8'hba))));
              reg102 <= reg83;
              reg103 <= (-{$unsigned($unsigned((reg94 ^ reg99)))});
              reg104 <= {{$unsigned(($unsigned(wire89) || reg97[(2'h3):(1'h1)]))}};
            end
          else
            begin
              reg100 <= (-wire65);
              reg101 <= ((^wire89) ?
                  reg88 : ((|$signed((+reg81))) ?
                      (^~((reg101 ?
                          reg104 : reg84) < reg104)) : {($unsigned(reg93) < reg85)}));
              reg102 <= (((+((reg87 ^ reg95) ? $unsigned(wire68) : reg93)) ?
                      $unsigned(($unsigned(wire89) ?
                          {(8'hba)} : (^~reg101))) : (|$unsigned(wire90))) ?
                  (!$signed((wire72[(1'h1):(1'h1)] << reg76))) : (reg92[(4'hb):(3'h4)] >> (|$unsigned(reg92[(5'h13):(4'ha)]))));
              reg103 <= $unsigned(({$signed($unsigned(reg104)),
                  reg96} ^~ (~&$signed(wire71[(3'h4):(3'h4)]))));
            end
          reg105 <= (8'ha6);
        end
      if ((&$unsigned(reg75[(1'h1):(1'h1)])))
        begin
          reg106 <= ((~|reg97) ?
              (8'ha2) : ($signed(({reg80, (8'h9c)} ?
                      wire73 : $unsigned(wire90))) ?
                  reg75 : $signed({(reg76 | reg96), {wire89, reg97}})));
          if ({$unsigned(reg77)})
            begin
              reg107 <= (((~^$signed((~|reg81))) ?
                  $unsigned((wire91[(2'h3):(2'h3)] ~^ {wire90})) : $unsigned($unsigned($unsigned((8'hb6))))) | (((-(reg83 >> wire66)) ?
                  $unsigned(wire90) : $signed((reg74 == reg98))) >= ((8'hb2) * reg82)));
              reg108 <= reg103[(3'h6):(1'h0)];
            end
          else
            begin
              reg107 <= ((8'hb0) ?
                  ({(~|(+reg85)), $signed((wire91 ? reg102 : reg85))} ?
                      reg85 : $signed((~&((8'hb4) ?
                          reg84 : reg82)))) : ($unsigned(wire72) ?
                      reg102 : reg103[(3'h7):(3'h4)]));
              reg108 <= reg97[(2'h3):(2'h3)];
              reg109 <= wire71[(2'h2):(1'h1)];
              reg110 <= reg101[(2'h2):(2'h2)];
              reg111 <= $unsigned(reg106[(4'h9):(3'h5)]);
            end
        end
      else
        begin
          reg106 <= ((((&$unsigned(reg80)) ?
                  ($signed(reg88) ?
                      $signed(reg100) : reg79[(5'h13):(3'h7)]) : reg107[(5'h10):(3'h5)]) ?
              wire69 : (-$signed(wire91[(4'h8):(2'h3)]))) != $signed(((^~$unsigned(wire66)) ?
              ((reg80 | reg98) * (-wire73)) : ($unsigned(reg92) <= reg102[(1'h1):(1'h1)]))));
          reg107 <= $unsigned(reg100[(2'h2):(1'h0)]);
          reg108 <= ((~|(~reg100[(1'h1):(1'h1)])) ?
              (~^($unsigned(((8'hb4) == reg96)) * reg81[(4'h8):(3'h6)])) : $signed(wire71[(3'h6):(3'h5)]));
          reg109 <= $unsigned((~^wire70[(3'h7):(2'h3)]));
        end
    end
  assign wire112 = $unsigned($signed(((&(8'hb3)) | reg98[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg113 <= reg75[(2'h2):(1'h1)];
      reg114 <= (reg104 ?
          {((~^(reg76 ? (8'haa) : reg76)) ?
                  $unsigned($unsigned(reg98)) : $signed($unsigned(reg95))),
              ($unsigned({(8'h9c), reg74}) - {(~(8'ha7)),
                  (reg107 ? wire73 : reg107)})} : ($unsigned({(|reg84),
                  (reg92 ? reg99 : reg79)}) ?
              {$signed((^reg95)),
                  $signed(wire112)} : (reg78 ~^ ($signed(reg105) ?
                  (^~reg74) : reg95[(4'h9):(1'h1)]))));
    end
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire22;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire23 = wire20[(3'h4):(1'h0)];
  assign wire24 = $signed($signed(($signed((wire19 >>> wire18)) ?
                      (-$unsigned(wire22)) : wire19)));
  assign wire25 = $signed(wire21[(4'h8):(3'h7)]);
  assign wire26 = {((8'hb5) ?
                          ((~wire24) ?
                              (-$signed(wire18)) : wire24) : wire25[(1'h1):(1'h1)])};
  assign wire27 = ((&(-$unsigned(wire23))) >>> $unsigned(($signed(((8'hab) < wire26)) <= {(~&wire20)})));
  assign wire28 = wire27;
  assign wire29 = $unsigned((!$signed($signed(wire21[(4'ha):(2'h2)]))));
  assign wire30 = ((~|{(^~((8'hb2) ? wire21 : wire18))}) ?
                      wire29 : (((wire20[(1'h1):(1'h0)] && wire19) >> ((wire23 || (8'hb2)) >= wire28)) ?
                          ((wire25 ?
                              $signed(wire28) : $unsigned(wire18)) > ((~^wire26) && wire27)) : ((((8'hbb) ?
                              wire28 : wire29) ~^ (wire24 * wire26)) < ($unsigned(wire24) ?
                              ((8'hbb) ?
                                  wire25 : wire24) : $unsigned(wire28)))));
  assign wire31 = wire23[(4'h8):(2'h3)];
  assign wire32 = wire20;
  assign wire33 = ($signed($unsigned($signed((wire20 ? wire31 : wire32)))) ?
                      ((&(wire32 ^ $unsigned(wire27))) * wire31[(4'ha):(3'h7)]) : $unsigned(wire31));
  assign wire34 = (8'hb3);
  assign wire35 = wire22;
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned(wire20[(3'h4):(2'h3)]) && (wire26 || (&wire20)))) + {$unsigned(wire24[(5'h14):(5'h12)])}))
        begin
          reg36 <= wire22;
          reg37 <= reg36[(4'hd):(4'ha)];
          reg38 <= (|(^(+(+(wire23 | reg36)))));
        end
      else
        begin
          reg36 <= wire30;
          reg37 <= wire29[(5'h13):(4'hf)];
        end
    end
endmodule
