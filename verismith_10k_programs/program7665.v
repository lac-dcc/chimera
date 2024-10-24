module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire136;
  wire [(3'h5):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire113;
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire125,
                 wire115,
                 wire5,
                 wire6,
                 wire42,
                 wire113,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire5 = $signed($signed(({wire3,
                     (8'hbc)} + $unsigned($signed(wire0)))));
  assign wire6 = (wire3[(4'hd):(1'h0)] <= wire4);
  module7 #() modinst43 (wire42, clk, wire5, wire2, wire1, wire4);
  module44 #() modinst114 (wire113, clk, wire3, wire2, wire4, wire0, wire6);
  assign wire115 = (($unsigned($signed(wire3[(2'h3):(1'h0)])) ?
                           ((|{wire42}) * (~^wire1[(1'h0):(1'h0)])) : wire1[(4'hb):(4'h8)]) ?
                       (-$unsigned(((wire0 ^ wire4) ?
                           (wire5 ?
                               wire42 : wire6) : $signed(wire2)))) : (($signed({wire2,
                                   wire3}) ?
                               $unsigned({(8'ha6)}) : (8'hb2)) ?
                           ({wire0,
                               $unsigned(wire4)} || (wire4[(5'h10):(3'h5)] ?
                               wire6[(3'h4):(1'h0)] : wire6[(4'hd):(1'h1)])) : wire3));
  module116 #() modinst126 (wire125, clk, wire1, wire0, wire113, wire42);
  always
    @(posedge clk) begin
      reg127 <= wire4[(4'hb):(3'h7)];
      reg128 <= wire6[(4'h8):(3'h4)];
      reg129 <= $signed(wire42);
    end
  module116 #() modinst131 (wire130, clk, wire42, wire4, reg127, reg128);
  assign wire132 = (^wire0[(4'hc):(1'h0)]);
  assign wire133 = wire125;
  assign wire134 = wire1[(4'hd):(3'h7)];
  assign wire135 = (wire42 ? (~wire115[(3'h5):(1'h0)]) : wire3);
  assign wire136 = wire135;
endmodule

module module116  (y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire120;
  input wire [(4'h8):(1'h0)] wire119;
  input wire signed [(2'h2):(1'h0)] wire118;
  input wire [(4'h9):(1'h0)] wire117;
  wire [(5'h11):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire121;
  assign y = {wire124, wire123, wire122, wire121, (1'h0)};
  assign wire121 = (8'hb2);
  assign wire122 = (~|wire120[(1'h1):(1'h1)]);
  assign wire123 = (({$signed($signed(wire121))} ?
                       ($signed((wire118 ?
                           wire122 : (8'hb1))) == wire122) : (((&wire118) || wire122[(2'h3):(2'h3)]) ~^ (-wire120[(2'h3):(2'h3)]))) * {(((wire118 ?
                           wire120 : (8'hbd)) || (wire119 ?
                           wire118 : wire122)) ^~ {{wire117, wire117}})});
  assign wire124 = wire123;
endmodule

module module44
#(parameter param112 = ((!(((^(8'ha7)) > {(8'hb9)}) + (((8'h9f) ? (8'ha0) : (8'ha9)) ? ((8'h9c) >>> (8'hbb)) : ((8'ha9) ? (8'hbb) : (8'hbd))))) & ((-(~((7'h44) * (8'ha8)))) ? ((((7'h42) ^~ (8'hb9)) ? ((7'h41) ? (8'hb2) : (8'ha5)) : (|(8'haa))) == ({(7'h40), (8'ha9)} || (~|(8'hbe)))) : ((((8'ha3) || (7'h40)) & ((8'ha0) ? (8'hab) : (8'had))) ^~ (((8'ha3) * (8'haf)) * {(8'hb9)})))))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire49;
  input wire signed [(5'h14):(1'h0)] wire48;
  input wire signed [(5'h12):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  input wire signed [(5'h12):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(3'h7):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire60;
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire60,
                 reg111,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= wire49;
      reg51 <= wire45[(4'hd):(4'hb)];
    end
  always
    @(posedge clk) begin
      if ({(wire45 ?
              ({(^reg50),
                  reg51[(3'h4):(2'h2)]} == $signed($signed(wire49))) : (~wire46[(3'h6):(2'h3)])),
          (^(-{wire49}))})
        begin
          reg52 <= ($signed(reg51) ? (8'hb0) : {wire45});
          reg53 <= $signed(wire46[(2'h3):(1'h1)]);
          reg54 <= reg53;
        end
      else
        begin
          reg52 <= wire47[(4'hd):(4'h9)];
          reg53 <= $unsigned(reg52);
          reg54 <= ($signed((~^reg51[(2'h3):(1'h0)])) ?
              (~|reg54) : reg53[(5'h12):(3'h5)]);
          if (wire48[(4'hd):(1'h1)])
            begin
              reg55 <= (wire46[(3'h6):(2'h3)] ?
                  wire48 : $unsigned($signed(($signed(wire49) ?
                      $unsigned(wire46) : (-reg50)))));
              reg56 <= wire46[(3'h4):(3'h4)];
              reg57 <= {$unsigned(wire47[(4'he):(4'hb)])};
              reg58 <= $unsigned(wire46[(3'h5):(1'h1)]);
              reg59 <= wire47;
            end
          else
            begin
              reg55 <= (~|((~|(~(~^reg53))) * $signed($unsigned(reg53))));
              reg56 <= reg59[(5'h10):(3'h6)];
              reg57 <= reg53;
              reg58 <= (|reg55[(4'hb):(1'h1)]);
            end
        end
    end
  assign wire60 = (($signed(({wire48, (8'hac)} ?
                          (~|wire46) : wire49[(3'h7):(3'h5)])) ?
                      (reg57[(2'h3):(1'h1)] > (reg54[(2'h2):(1'h1)] < (reg55 ?
                          (8'hbd) : reg51))) : ((~|{reg59, reg57}) ?
                          wire49 : $unsigned({(8'ha3),
                              wire47}))) > ($unsigned($unsigned($signed(reg57))) ?
                      $unsigned(reg55) : (((reg58 & (8'ha6)) ?
                              wire45 : $signed(wire47)) ?
                          ($signed(reg58) ?
                              reg54[(4'hb):(1'h0)] : (reg52 ?
                                  reg51 : (8'haa))) : ($signed((8'hbd)) ?
                              $signed(reg54) : $signed(reg50)))));
  module61 #() modinst104 (wire103, clk, wire49, wire45, reg57, reg51);
  assign wire105 = wire60[(3'h4):(3'h4)];
  assign wire106 = (8'had);
  assign wire107 = reg58;
  assign wire108 = $signed(reg54);
  assign wire109 = wire106[(5'h10):(4'h8)];
  assign wire110 = reg57;
  always
    @(posedge clk) begin
      reg111 <= (&(+reg52));
    end
endmodule

module module7
#(parameter param41 = ({((((8'hb2) > (7'h43)) ? (^~(8'ha1)) : ((8'ha4) ~^ (8'hb0))) << (((8'ha7) ? (8'haa) : (8'ha2)) <= ((8'h9f) | (8'ha4))))} ? (((((8'hbf) ? (8'hae) : (8'h9d)) ? ((8'ha1) & (8'haa)) : (|(8'hbb))) ? (8'hb4) : (((8'h9e) ? (7'h42) : (8'ha5)) ^~ (~(8'hbd)))) >= ((~((8'hb3) == (8'ha3))) >>> (((7'h43) ? (8'hb3) : (8'hbe)) ? {(8'hba)} : (~^(8'hbc))))) : {({(!(8'hb1)), (&(8'h9d))} ? {((8'ha8) < (7'h43)), ((8'hac) ? (8'hab) : (7'h40))} : (^~((8'ha3) != (8'hab))))}))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire39;
  assign y = {wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire39,
                 (1'h0)};
  assign wire12 = ((($signed({wire9}) ?
                              $signed((wire8 ? wire8 : wire9)) : ({wire11,
                                  wire8} <<< (!wire9))) ?
                          $unsigned($signed(wire8[(3'h6):(2'h2)])) : wire8) ?
                      (($signed(wire9) ~^ wire10[(4'h8):(2'h2)]) - (7'h40)) : (~(wire11[(2'h2):(2'h2)] - wire9)));
  assign wire13 = wire8;
  assign wire14 = ((~|(|(wire10 & (~wire9)))) & wire13);
  assign wire15 = wire13;
  assign wire16 = {(($signed($unsigned(wire13)) >>> (wire10 ?
                          wire9[(4'h9):(4'h8)] : (wire9 ?
                              wire9 : wire12))) >> $unsigned((8'hac)))};
  assign wire17 = $unsigned(wire16[(3'h4):(2'h3)]);
  assign wire18 = ($signed($unsigned(wire8[(2'h3):(2'h3)])) >>> {$unsigned(((wire11 >= wire11) ?
                          (wire8 ? wire12 : wire17) : (~|wire16))),
                      {$unsigned($signed(wire14)), (8'hb1)}});
  module19 #() modinst40 (.wire23(wire11), .wire24(wire14), .wire22(wire17), .y(wire39), .wire21(wire16), .wire20(wire10), .clk(clk));
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire24;
  input wire signed [(5'h11):(1'h0)] wire23;
  input wire [(4'hf):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  assign y = {wire38,
                 wire36,
                 wire35,
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
                 reg37,
                 (1'h0)};
  assign wire25 = {($signed(($unsigned(wire20) > (~wire24))) <<< $unsigned((~^wire23)))};
  assign wire26 = $signed($signed($signed((^~wire23))));
  assign wire27 = (-(&(wire24[(4'h9):(1'h1)] ?
                      wire20[(4'h8):(3'h4)] : (8'hba))));
  assign wire28 = {({{wire22[(4'hf):(3'h5)], $signed(wire20)}} ?
                          wire25[(3'h6):(1'h1)] : wire27)};
  assign wire29 = $unsigned((wire21 ?
                      (wire28 ?
                          ($unsigned(wire28) ?
                              $unsigned(wire20) : $signed(wire23)) : (^~(8'hab))) : (!wire24[(4'h8):(3'h7)])));
  assign wire30 = wire21;
  assign wire31 = (!{(|(~|$signed(wire22))), wire22[(2'h3):(1'h1)]});
  assign wire32 = (~|($unsigned((8'ha6)) || ((wire26[(3'h4):(1'h0)] ?
                      wire20[(3'h4):(1'h1)] : $signed(wire26)) + $signed(wire24))));
  assign wire33 = wire20[(4'h9):(3'h7)];
  assign wire34 = {wire27};
  assign wire35 = {$signed((wire22 | wire34[(3'h4):(3'h4)])),
                      $unsigned(wire34)};
  assign wire36 = (wire32 ^~ wire27[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg37 <= {(|$signed($unsigned(wire32[(3'h7):(1'h0)])))};
    end
  assign wire38 = $unsigned(reg37[(3'h7):(3'h4)]);
endmodule

module module61
#(parameter param101 = {(~|{(((7'h42) ? (8'hbf) : (8'ha5)) * {(8'hbe)}), ((|(8'h9f)) * ((8'hba) >> (8'h9c)))})}, 
parameter param102 = ({(~((param101 ? param101 : param101) * (param101 ? param101 : param101)))} ? (param101 || param101) : param101))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire65;
  input wire signed [(2'h3):(1'h0)] wire64;
  input wire [(3'h7):(1'h0)] wire63;
  input wire signed [(5'h11):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire81,
                 wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire74,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
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
                 reg83,
                 reg82,
                 reg80,
                 reg77,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire66 = (wire62[(4'ha):(4'h8)] ?
                      (~&(($unsigned(wire64) ? $unsigned(wire62) : (!wire64)) ?
                          wire62 : ($unsigned((8'hb9)) >>> $unsigned(wire65)))) : $signed((wire63 ?
                          $signed((wire63 ? wire62 : wire64)) : {(wire62 ?
                                  wire64 : wire65),
                              (+wire64)})));
  assign wire67 = {($unsigned({(^~wire64)}) ?
                          ($signed(wire63) && (wire62 ?
                              (wire66 ?
                                  wire63 : wire66) : (~&wire64))) : (-((wire63 ?
                              wire62 : (8'hb5)) || wire66))),
                      ((&wire62) ?
                          {((wire65 ~^ wire62) ?
                                  $signed(wire63) : ((8'hb5) ?
                                      (8'h9c) : (8'hba))),
                              $signed($unsigned((7'h41)))} : $unsigned($unsigned((wire66 << wire63))))};
  assign wire68 = $signed($unsigned($unsigned(wire66[(3'h4):(3'h4)])));
  assign wire69 = (wire62 != (wire68[(1'h1):(1'h0)] ?
                      wire63 : wire65[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg70 <= (+{wire62[(3'h5):(2'h2)], wire67[(1'h1):(1'h1)]});
      reg71 <= $signed($signed($unsigned((wire69 + (wire64 ^ reg70)))));
      reg72 <= wire63[(2'h2):(1'h0)];
      reg73 <= (|reg72[(3'h6):(1'h0)]);
    end
  assign wire74 = wire68;
  assign wire75 = (^~((&wire65[(4'hb):(1'h0)]) & {(8'ha1), (!$signed(reg73))}));
  assign wire76 = ($signed((wire62[(2'h2):(2'h2)] ?
                          reg71[(3'h4):(3'h4)] : $signed((&wire64)))) ?
                      (($signed((~&(8'ha2))) && (~|$unsigned(wire62))) ?
                          {{{reg71, wire65},
                                  $unsigned(wire63)}} : wire66) : $signed($signed($unsigned($signed(reg72)))));
  always
    @(posedge clk) begin
      reg77 <= $unsigned((wire63 | $signed((!wire69[(3'h5):(3'h5)]))));
    end
  assign wire78 = wire69[(1'h1):(1'h0)];
  assign wire79 = $unsigned(reg73);
  always
    @(posedge clk) begin
      reg80 <= wire74[(3'h6):(2'h2)];
    end
  assign wire81 = $unsigned((|((&$signed(reg73)) ?
                      $unsigned($signed(reg71)) : (wire75 > reg80[(3'h4):(1'h1)]))));
  always
    @(posedge clk) begin
      reg82 <= ($unsigned(wire64[(2'h3):(1'h1)]) <= {(wire64 ?
              wire81 : $signed(wire81[(3'h4):(2'h2)]))});
      reg83 <= (+wire74);
    end
  assign wire84 = $signed({reg70});
  assign wire85 = {reg72};
  assign wire86 = $unsigned((^$signed((^$unsigned(wire75)))));
  assign wire87 = $signed((wire74 ?
                      (wire64 ?
                          (wire65[(4'ha):(4'h9)] ?
                              ((8'h9d) != wire75) : wire69) : $signed($unsigned(wire69))) : (8'hb8)));
  always
    @(posedge clk) begin
      reg88 <= $unsigned($signed($unsigned(reg73[(3'h4):(3'h4)])));
    end
  always
    @(posedge clk) begin
      if ((+reg72))
        begin
          reg89 <= ((|{$signed(reg82)}) * (~|wire62[(2'h3):(1'h0)]));
          reg90 <= $unsigned((!(~wire66)));
          reg91 <= reg83;
          if (wire76[(2'h2):(2'h2)])
            begin
              reg92 <= reg89;
              reg93 <= wire74;
              reg94 <= $signed(($unsigned(reg90) >= (|reg73[(2'h2):(2'h2)])));
            end
          else
            begin
              reg92 <= $signed(((reg90 << ((wire85 ?
                      wire75 : (7'h43)) - $unsigned(wire67))) ?
                  {{$signed(wire79),
                          wire86}} : (^((^~wire64) & wire69[(4'h8):(3'h7)]))));
            end
          reg95 <= ((&wire86[(2'h3):(1'h1)]) + (reg93[(2'h2):(2'h2)] + $signed(reg73)));
        end
      else
        begin
          reg89 <= $signed((-$signed(wire66)));
          reg90 <= ($signed(wire86) <= reg77);
          reg91 <= {{$unsigned((!$unsigned(wire68)))}};
        end
      reg96 <= ({($unsigned(wire84[(3'h4):(2'h2)]) <<< reg73)} <= reg92);
      reg97 <= $unsigned(((~|{(-reg80), {reg77}}) ?
          $signed(wire69[(3'h7):(3'h6)]) : reg96));
      reg98 <= reg73[(3'h5):(1'h0)];
    end
  assign wire99 = (8'ha2);
  assign wire100 = (wire65 <= $unsigned((~|reg89)));
endmodule
