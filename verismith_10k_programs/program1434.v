module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire119,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 (1'h0)};
  assign wire5 = (!(wire0 * {(!wire4),
                     ($signed(wire4) ? {wire4} : (wire3 > wire4))}));
  assign wire6 = $unsigned(({wire0} < wire5[(5'h10):(3'h4)]));
  assign wire7 = $signed((wire6[(3'h4):(2'h3)] ?
                     (wire0[(1'h1):(1'h1)] ?
                         wire6 : (wire2[(2'h3):(2'h2)] ?
                             (wire6 == wire0) : ((7'h43) ?
                                 wire0 : wire6))) : ($unsigned($unsigned(wire3)) ?
                         wire5 : {(wire1 ? wire0 : wire6)})));
  assign wire8 = $signed(((wire0 ? (7'h43) : (8'hb0)) >>> ($unsigned((!wire5)) ?
                     (^~(~^(8'ha8))) : $unsigned(wire1))));
  always
    @(posedge clk) begin
      reg9 <= ($signed(wire3[(1'h1):(1'h1)]) == (8'hac));
    end
  module10 #() modinst120 (.wire14(wire4), .y(wire119), .clk(clk), .wire12(wire0), .wire13(wire3), .wire11(wire2));
  assign wire121 = (wire8[(1'h1):(1'h0)] ? reg9 : wire5);
  assign wire122 = (wire3 && ($signed((~^((8'ha6) && (8'hbc)))) <<< wire3[(1'h1):(1'h1)]));
  assign wire123 = wire5[(2'h2):(1'h0)];
  assign wire124 = $signed(wire5[(3'h4):(1'h0)]);
endmodule

module module10
#(parameter param117 = (8'ha7), 
parameter param118 = (~((~|param117) >>> param117)))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire107;
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire109,
                 wire54,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire107,
                 reg111,
                 reg110,
                 (1'h0)};
  module15 #() modinst55 (wire54, clk, wire12, wire13, wire11, wire14, (8'hb0));
  assign wire56 = (+$signed(wire11));
  assign wire57 = (8'hbd);
  assign wire58 = $signed(({(&(wire11 - wire12))} ?
                      ((8'h9e) ?
                          $signed($signed(wire11)) : $signed($signed(wire12))) : wire11[(4'he):(1'h0)]));
  assign wire59 = $unsigned(($unsigned(wire14[(4'ha):(3'h4)]) < $unsigned((~|$unsigned(wire57)))));
  module60 #() modinst108 (.wire61(wire57), .wire65(wire13), .clk(clk), .wire63(wire14), .wire62(wire58), .y(wire107), .wire64(wire56));
  assign wire109 = wire11[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg110 <= ($unsigned(wire54) ?
          $signed((|(wire11[(4'hf):(3'h4)] ?
              (8'h9d) : (wire107 ? wire13 : wire109)))) : ($unsigned(wire109) ?
              {((8'had) ? (-wire12) : {wire13, wire109}),
                  $signed((wire12 && wire14))} : wire54[(2'h3):(1'h0)]));
      reg111 <= $unsigned(wire12);
    end
  assign wire112 = ((reg111 ?
                           (wire14[(3'h5):(3'h5)] ?
                               (wire109 >= (wire13 ?
                                   wire54 : (8'ha4))) : $signed(((8'hb1) ?
                                   wire58 : wire59))) : wire58) ?
                       (^((wire54 ? $signed(reg110) : wire109) || ((wire109 ?
                               wire13 : (8'ha0)) ?
                           (wire14 ?
                               reg111 : wire57) : wire107))) : $signed($signed((~(wire57 ?
                           wire12 : wire54)))));
  assign wire113 = (~^(reg111[(2'h3):(1'h1)] ? wire14 : wire54[(4'hb):(3'h4)]));
  assign wire114 = wire14;
  assign wire115 = $unsigned(wire114);
  assign wire116 = $signed((((~|reg111) == $unsigned((+wire58))) ?
                       ($signed($signed(wire109)) ?
                           wire115[(1'h1):(1'h0)] : (^~(wire57 && (8'hbe)))) : (^wire112[(1'h0):(1'h0)])));
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire65;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire [(5'h15):(1'h0)] wire63;
  input wire [(5'h11):(1'h0)] wire62;
  input wire [(3'h4):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  assign y = {wire106,
                 wire101,
                 wire100,
                 wire87,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
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
                 (1'h0)};
  assign wire66 = $unsigned(wire61);
  assign wire67 = ((8'hb7) * {($signed($unsigned(wire61)) ?
                          wire63 : (((8'hba) ? wire61 : (8'hbf)) ^ (wire62 ?
                              (8'h9e) : wire61))),
                      $signed((wire61 >>> (wire65 <<< wire63)))});
  assign wire68 = $unsigned($signed({((wire66 ^ wire61) > (wire61 ?
                          wire65 : (8'hb3)))}));
  assign wire69 = $signed($signed((($unsigned(wire66) ?
                          (~^wire65) : $unsigned(wire64)) ?
                      wire65[(2'h2):(1'h0)] : (^wire67[(4'ha):(2'h2)]))));
  assign wire70 = ($unsigned(($signed((wire69 <= (8'ha2))) ?
                          wire68 : $unsigned({wire63, (8'ha5)}))) ?
                      wire69[(2'h3):(1'h0)] : (^~(+wire64)));
  assign wire71 = (&wire67[(3'h7):(3'h4)]);
  assign wire72 = (~(wire69[(3'h4):(2'h2)] ? wire66[(3'h7):(2'h2)] : (8'haf)));
  assign wire73 = ((~|wire62[(4'h8):(1'h1)]) ?
                      $unsigned((~^(!(+wire65)))) : (7'h41));
  assign wire74 = ($signed(wire72[(3'h7):(3'h7)]) >>> ($unsigned($unsigned($signed(wire63))) ?
                      ((~|$unsigned(wire71)) ?
                          $unsigned((+wire72)) : $signed((wire64 <<< wire72))) : (~^(|(wire71 ^~ wire71)))));
  always
    @(posedge clk) begin
      reg75 <= wire61;
      reg76 <= (({$unsigned((wire69 ? wire73 : wire74))} ?
              $signed((&(wire62 ? wire63 : wire62))) : wire70) ?
          wire66 : $signed(wire64[(4'he):(1'h1)]));
      reg77 <= wire73[(1'h1):(1'h0)];
      if (wire74)
        begin
          if ((wire74[(4'ha):(3'h6)] ?
              (!(~&wire71[(4'hc):(4'hb)])) : (!$signed($signed(reg77)))))
            begin
              reg78 <= (+(((wire63 ~^ (wire63 ?
                  wire72 : wire74)) > $signed($signed(wire62))) < (wire66[(4'h8):(1'h1)] ?
                  ($signed((8'haf)) ? (-reg75) : wire68) : (~|(wire68 ?
                      wire66 : reg77)))));
              reg79 <= (({wire71[(3'h5):(1'h1)]} ?
                  $signed(($unsigned(wire62) ?
                      (~^(8'h9d)) : wire74)) : $unsigned({$signed(wire70),
                      wire62})) != (-$signed(($signed(wire70) & wire65[(4'hb):(4'hb)]))));
              reg80 <= reg76;
            end
          else
            begin
              reg78 <= $unsigned(reg78);
              reg79 <= $signed((8'ha8));
              reg80 <= $unsigned({(reg75[(5'h10):(4'h8)] ?
                      reg80[(4'ha):(4'h8)] : reg76[(1'h1):(1'h1)]),
                  ((|(wire72 ? wire66 : reg80)) <<< wire62)});
              reg81 <= $signed($signed({$unsigned(((8'ha2) * reg78))}));
            end
          reg82 <= reg78;
          reg83 <= wire71;
        end
      else
        begin
          reg78 <= ($signed(($signed((wire74 >>> wire70)) != wire70)) ^~ (wire74[(3'h4):(1'h1)] < wire71));
          reg79 <= (^wire61);
          reg80 <= (~|(^$unsigned(wire63[(1'h1):(1'h1)])));
          reg81 <= $unsigned(wire64);
          if (((8'hb0) ?
              (wire64 <<< $signed((~$unsigned((8'hbf))))) : (-wire70[(3'h4):(1'h1)])))
            begin
              reg82 <= wire72;
              reg83 <= ((((!(reg81 ?
                      (7'h42) : reg83)) == (8'haa)) ^ $signed(wire67)) ?
                  ((wire74[(2'h3):(2'h2)] + ((^~wire71) ?
                          (8'ha6) : {reg80, (8'hb7)})) ?
                      wire65[(3'h4):(3'h4)] : $signed(({reg79} == (reg83 * (7'h44))))) : (+($unsigned(reg76[(1'h0):(1'h0)]) ^ ((wire64 ?
                      wire63 : wire72) >>> (-reg77)))));
              reg84 <= {$signed(($signed(reg75[(1'h1):(1'h1)]) ?
                      {(^~wire74), (wire68 ^ (8'ha7))} : reg78)),
                  (wire68[(2'h2):(1'h0)] ~^ $unsigned(reg76))};
              reg85 <= wire66[(3'h6):(2'h3)];
            end
          else
            begin
              reg82 <= $signed($signed(wire64));
              reg83 <= reg75[(2'h2):(1'h1)];
              reg84 <= reg84;
              reg85 <= $unsigned($unsigned(($unsigned({wire70, reg80}) ?
                  wire67[(5'h10):(4'hf)] : (wire61 ?
                      (wire73 * (8'hab)) : {wire69}))));
              reg86 <= reg77[(2'h3):(1'h1)];
            end
        end
    end
  assign wire87 = ((^~reg77) > (reg76 * reg79[(4'h9):(3'h5)]));
  always
    @(posedge clk) begin
      reg88 <= (~&reg76[(1'h0):(1'h0)]);
      reg89 <= {reg76[(1'h1):(1'h0)], $signed((8'hb3))};
      if (wire63[(5'h12):(5'h12)])
        begin
          reg90 <= {$unsigned(wire62[(1'h1):(1'h0)])};
          reg91 <= (($signed((-(|(8'ha6)))) && ($unsigned($unsigned(wire61)) ?
                  $signed($unsigned(reg75)) : ((wire67 != reg75) ?
                      reg84[(3'h7):(1'h1)] : reg77[(1'h1):(1'h1)]))) ?
              (~reg90[(2'h2):(2'h2)]) : ({{$unsigned(wire74)}, (8'hbe)} ?
                  ((|$signed((8'hbf))) ?
                      {(wire61 ?
                              wire69 : reg78)} : (^(reg79 <<< wire69))) : $unsigned(wire70)));
          if ((wire69 < (~^wire62)))
            begin
              reg92 <= wire64[(4'he):(3'h7)];
              reg93 <= (wire69 >= $unsigned(reg81[(4'h8):(2'h3)]));
              reg94 <= (&$signed(reg83[(1'h0):(1'h0)]));
              reg95 <= ((wire62 && wire69[(1'h0):(1'h0)]) ?
                  reg88[(2'h2):(1'h1)] : wire62);
              reg96 <= ($signed((reg76 ~^ reg79[(4'h8):(2'h3)])) - wire69[(3'h4):(2'h3)]);
            end
          else
            begin
              reg92 <= (~^$signed((8'hba)));
              reg93 <= (((wire71 ?
                          reg76[(1'h0):(1'h0)] : $unsigned((wire70 > wire87))) ?
                      (({(8'hb2), reg94} ?
                          reg91[(3'h4):(2'h2)] : $signed(wire68)) * {wire62[(2'h3):(2'h3)]}) : $unsigned({(reg94 * (7'h42)),
                          $signed(reg79)})) ?
                  wire64 : $unsigned(($signed($signed(wire66)) * $unsigned(reg89[(4'h9):(1'h1)]))));
              reg94 <= reg86;
            end
          reg97 <= ($unsigned($unsigned(({wire74} ?
                  reg77[(3'h6):(1'h1)] : (!(8'ha3))))) ?
              wire74 : $unsigned((reg76 ?
                  reg94 : ((-reg81) ? $signed(wire65) : $signed(reg88)))));
        end
      else
        begin
          reg90 <= $unsigned({(^$unsigned(reg95[(2'h2):(2'h2)])), reg93});
          if (($signed({{reg86},
              $signed($unsigned(wire63))}) - $unsigned((reg81 ?
              wire74[(3'h7):(3'h7)] : (reg81 ?
                  (wire68 <<< reg93) : $unsigned(reg86))))))
            begin
              reg91 <= $signed(((^~($unsigned(reg90) ?
                      (reg78 ~^ wire63) : (wire68 < (8'hb3)))) ?
                  reg76 : (-((reg90 ?
                      reg75 : (7'h44)) << reg79[(2'h2):(1'h1)]))));
              reg92 <= $signed((reg85 || $unsigned(((^wire71) ^ (reg93 > wire61)))));
              reg93 <= ((~|wire67) <<< ($unsigned(reg90) * $unsigned($unsigned((~|(8'hb1))))));
              reg94 <= ((wire73 ?
                  (^~$unsigned(((7'h42) & reg78))) : (wire72 ?
                      reg79[(1'h1):(1'h1)] : reg76[(1'h1):(1'h0)])) && (wire72 ?
                  wire72 : (+$signed($unsigned(wire87)))));
              reg95 <= {$signed(((|{reg79, reg86}) ?
                      (~|$unsigned(wire64)) : (~|(wire73 ?
                          (8'hb3) : wire73))))};
            end
          else
            begin
              reg91 <= $signed(reg91[(3'h7):(3'h5)]);
              reg92 <= (reg84[(3'h5):(2'h3)] ?
                  (&(wire72[(1'h0):(1'h0)] ?
                      {(wire61 ?
                              wire71 : wire71)} : reg81)) : reg77[(3'h6):(1'h0)]);
            end
          reg96 <= (^~reg84);
        end
      reg98 <= (+(8'hb1));
      reg99 <= $unsigned(reg91[(5'h13):(3'h4)]);
    end
  assign wire100 = ((8'h9c) ?
                       (reg91[(3'h6):(2'h3)] < $unsigned(((reg86 ?
                               reg94 : reg83) ?
                           $unsigned(wire62) : {reg93}))) : reg96[(4'h8):(2'h2)]);
  assign wire101 = (|(wire87[(4'ha):(2'h2)] && $unsigned($signed({reg80}))));
  always
    @(posedge clk) begin
      if ($unsigned((|($unsigned((reg85 ? reg78 : wire101)) + (&(reg88 ?
          (8'hba) : wire87))))))
        begin
          reg102 <= wire74[(2'h2):(1'h1)];
          reg103 <= (8'ha2);
          reg104 <= ($signed({wire74,
              (wire64 ?
                  reg83[(1'h0):(1'h0)] : (wire61 ?
                      wire64 : (8'hb0)))}) > reg95);
          reg105 <= reg82[(2'h2):(1'h1)];
        end
      else
        begin
          reg102 <= wire100[(2'h2):(1'h0)];
        end
    end
  assign wire106 = wire74;
endmodule

module module15
#(parameter param53 = ((~(+(((8'hb9) ? (8'hbb) : (8'hb5)) ^~ ((8'haa) * (8'ha1))))) && (((((8'h9f) ? (8'hbf) : (8'hb3)) ? ((8'hac) ? (8'h9c) : (7'h42)) : (^(8'ha7))) <= (((8'ha7) << (8'h9c)) <<< ((8'hb1) ^~ (8'ha2)))) ? ((^~(|(8'ha2))) ? (((8'h9e) ? (7'h41) : (8'hb3)) ? ((8'hb3) ? (8'hb0) : (8'hb3)) : ((8'hbd) * (8'ha4))) : (((7'h43) - (8'hb2)) ? ((8'h9d) ? (8'hae) : (8'hae)) : ((7'h42) ? (8'ha6) : (8'hb1)))) : ((((8'hb1) ^ (8'h9c)) < (^~(8'hb1))) ? (((8'hbf) << (8'hb4)) == {(8'h9c)}) : (((8'hbd) ? (8'h9d) : (8'ha4)) ^~ (-(8'hb4)))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(4'hb):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire21 = ($unsigned(wire17) ~^ wire16[(3'h5):(2'h3)]);
  assign wire22 = {$unsigned(wire19[(1'h1):(1'h1)])};
  assign wire23 = (!(&{($signed(wire16) << wire17)}));
  assign wire24 = ((wire17[(2'h3):(2'h3)] ?
                      ($signed({wire16,
                          wire23}) >>> wire21[(4'hf):(2'h3)]) : $signed(((8'ha3) >= $signed(wire16)))) + $signed($signed(wire19)));
  assign wire25 = $signed({(wire18 && ((^wire24) && wire24)),
                      $signed(($signed((7'h40)) ^ $signed((8'hb1))))});
  assign wire26 = wire23[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg27 <= (wire21[(1'h1):(1'h1)] || {wire23, wire17[(1'h1):(1'h0)]});
      if ((wire25 * {(~^$unsigned((|wire19))),
          $signed($unsigned($signed(wire20)))}))
        begin
          reg28 <= wire18;
          reg29 <= (&$unsigned(($unsigned((^reg28)) >= ($unsigned((8'h9d)) - wire23))));
          reg30 <= wire20[(2'h3):(1'h1)];
          reg31 <= {$signed({reg30[(1'h0):(1'h0)],
                  {(~&reg29), (wire16 ? (8'hb6) : wire24)}}),
              ((reg27[(3'h4):(1'h1)] ?
                  ((8'hae) ?
                      wire22 : wire23[(2'h2):(1'h0)]) : $unsigned($unsigned((8'hba)))) || $unsigned($unsigned((wire26 ?
                  wire19 : reg27))))};
        end
      else
        begin
          reg28 <= $signed(((^~$unsigned({(7'h41)})) ? wire23 : (8'ha4)));
          if (($signed(wire18[(4'h9):(2'h3)]) ?
              ((((wire23 * (8'hb0)) >= wire25[(4'ha):(2'h3)]) ^~ ((~|reg29) ?
                  (reg27 ? wire25 : wire18) : {wire20,
                      (8'ha5)})) <<< $signed((^(wire19 ?
                  wire20 : wire20)))) : wire17))
            begin
              reg29 <= wire21[(4'he):(4'h9)];
            end
          else
            begin
              reg29 <= $unsigned(wire25[(1'h0):(1'h0)]);
              reg30 <= {wire23,
                  $signed(($signed(wire25[(2'h2):(1'h1)]) ?
                      wire22[(5'h14):(4'hf)] : ($signed(wire23) || {wire16,
                          reg28})))};
              reg31 <= reg31;
              reg32 <= ({(((-reg30) ? wire22 : (reg27 ? wire23 : (8'ha1))) ?
                      (|(reg28 ? (8'h9c) : reg30)) : $unsigned((~&wire26))),
                  $unsigned(((wire22 << wire19) <<< {(8'hb9),
                      reg29}))} ^ $signed(($signed((wire25 ^~ wire25)) ?
                  (^~$unsigned(wire26)) : $signed((^wire19)))));
              reg33 <= ({(^~$signed((reg28 >= wire19))),
                      {((&(8'ha7)) >> wire19[(2'h2):(2'h2)]),
                          $signed(wire22)}} ?
                  {(8'h9e)} : $signed((~|($unsigned(wire16) || (^~wire25)))));
            end
          reg34 <= ($signed(reg28) >= {($unsigned(reg29[(3'h5):(2'h3)]) <= $unsigned((reg33 ?
                  reg31 : (8'hb9))))});
        end
      reg35 <= reg33;
    end
  always
    @(posedge clk) begin
      reg36 <= $unsigned($unsigned((($unsigned(reg33) & (wire22 || reg33)) ?
          (+(reg33 ? reg33 : reg30)) : ((reg29 < reg29) ?
              $signed(wire17) : reg34))));
    end
  assign wire37 = (~&((^~({wire16, wire24} ? $unsigned(reg28) : (!wire23))) ?
                      (^(7'h42)) : $unsigned(wire21)));
  assign wire38 = $unsigned(reg32[(3'h5):(1'h1)]);
  assign wire39 = ((-$signed((|(reg27 ? (7'h42) : wire24)))) ?
                      {wire17,
                          (^~$signed(((8'ha6) ?
                              (8'hba) : wire38)))} : (($signed((~(8'ha6))) >>> $unsigned({wire25})) >>> ($unsigned(reg31[(1'h0):(1'h0)]) <<< ((reg36 | wire25) ^~ reg35[(4'h8):(3'h6)]))));
  assign wire40 = $unsigned($unsigned($signed((wire18[(2'h2):(1'h1)] >>> $signed(reg36)))));
  assign wire41 = (wire19 ?
                      reg27 : $unsigned(((~((8'hbe) ?
                          reg36 : wire18)) >>> (!(~|(8'ha0))))));
  assign wire42 = $signed(reg33);
  assign wire43 = (wire39 * reg31);
  always
    @(posedge clk) begin
      if ((+reg32))
        begin
          reg44 <= (|wire18[(3'h5):(1'h1)]);
          if ($unsigned(wire42[(1'h1):(1'h0)]))
            begin
              reg45 <= (^(wire37 <<< ($unsigned((reg35 ? reg30 : (8'hb9))) ?
                  {reg32[(1'h1):(1'h1)], (-wire37)} : {$signed(wire43)})));
              reg46 <= wire25[(3'h5):(1'h1)];
              reg47 <= (wire26[(4'hd):(3'h7)] ?
                  reg36[(5'h10):(1'h0)] : (($signed($unsigned(wire24)) ?
                      (reg44 ^~ wire21) : $signed((+wire18))) ~^ $unsigned($signed(reg31))));
              reg48 <= $signed($unsigned($signed((|$unsigned(reg29)))));
            end
          else
            begin
              reg45 <= wire19;
              reg46 <= {((($signed(wire37) ?
                              reg30[(1'h1):(1'h0)] : wire21[(3'h5):(1'h0)]) ?
                          (wire26 <<< wire38[(3'h4):(2'h2)]) : reg34) ?
                      {((8'hb8) * wire39),
                          (wire25[(1'h0):(1'h0)] >>> $signed(wire16))} : reg27[(1'h1):(1'h1)])};
              reg47 <= $signed($signed(reg48));
              reg48 <= ($unsigned({wire20,
                      ((wire37 ~^ wire37) ?
                          $signed(wire23) : (wire24 ? (8'hab) : reg27))}) ?
                  wire41[(4'hd):(4'ha)] : (^{(wire18 ?
                          (reg35 != wire42) : $signed(reg30)),
                      {(wire38 ^~ reg44)}}));
            end
          if (({reg44[(3'h7):(1'h0)],
                  (((reg36 ?
                      reg31 : reg32) ~^ (reg47 && wire41)) | ((-reg29) ^~ (wire43 ?
                      wire26 : wire42)))} ?
              (8'haf) : (({reg30[(1'h1):(1'h1)],
                  {wire42, reg47}} ^ (reg32[(1'h0):(1'h0)] ?
                  (wire26 >= wire21) : (wire23 ?
                      wire26 : reg31))) | (-$unsigned({wire18})))))
            begin
              reg49 <= (~reg33);
              reg50 <= (wire26[(4'hb):(3'h7)] && (!((^reg27[(2'h2):(2'h2)]) > ((&(7'h43)) ?
                  (reg30 ? wire17 : wire18) : ((8'hb8) ~^ reg45)))));
              reg51 <= wire21;
              reg52 <= (&reg35);
            end
          else
            begin
              reg49 <= $signed((|{((^wire39) ^~ reg29[(4'hc):(3'h5)])}));
              reg50 <= (~&wire41);
              reg51 <= (^~$signed(((~&wire37) >>> ($signed((8'hb0)) ?
                  $unsigned(reg46) : (wire40 ? (8'hb8) : (8'hae))))));
              reg52 <= (~&$signed($signed((8'hb7))));
            end
        end
      else
        begin
          reg44 <= (+(~{reg28, $signed($unsigned(wire37))}));
        end
    end
endmodule
