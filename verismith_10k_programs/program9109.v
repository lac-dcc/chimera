module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  wire [(4'hb):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire148;
  assign y = {wire152, wire151, wire150, wire4, wire148, (1'h0)};
  assign wire4 = $unsigned(wire1[(3'h6):(3'h5)]);
  module5 #() modinst149 (wire148, clk, wire3, wire0, wire2, wire1, wire4);
  assign wire150 = wire1;
  assign wire151 = (|{(wire148[(1'h0):(1'h0)] ~^ ((wire1 - wire0) ?
                           (wire1 != (8'ha7)) : (^~wire2))),
                       (wire2 ^~ $unsigned(wire4[(2'h3):(2'h2)]))});
  assign wire152 = {$signed(wire4[(4'ha):(4'h9)])};
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire6;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire146;
  wire signed [(3'h5):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire114;
  assign y = {wire146,
                 wire116,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire52,
                 wire83,
                 wire85,
                 wire114,
                 (1'h0)};
  assign wire11 = (((&$signed($unsigned(wire7))) ?
                          {wire7[(4'ha):(3'h6)]} : wire9[(1'h0):(1'h0)]) ?
                      $signed(($signed($signed(wire10)) ?
                          wire8 : (~$signed(wire8)))) : ((wire10 <= wire10) * (wire9 < $signed((wire7 ?
                          wire6 : wire7)))));
  assign wire12 = wire6;
  assign wire13 = (~&$unsigned($unsigned(wire7)));
  assign wire14 = ($unsigned(wire10[(2'h2):(2'h2)]) != ($unsigned((8'hba)) ^ $signed(($signed(wire8) ?
                      $unsigned(wire10) : $unsigned(wire6)))));
  module15 #() modinst53 (wire52, clk, wire7, wire6, wire8, wire13);
  module54 #() modinst84 (wire83, clk, wire13, wire52, wire12, wire8);
  assign wire85 = {$unsigned(wire12[(3'h4):(3'h4)]),
                      ($unsigned(wire11) ^ (wire14 ~^ (^~(~^(8'h9d)))))};
  module86 #() modinst115 (.y(wire114), .wire90(wire13), .wire88(wire85), .wire91(wire9), .wire87(wire10), .clk(clk), .wire89(wire14));
  assign wire116 = $signed(wire83);
  module117 #() modinst147 (.wire121(wire7), .wire118(wire12), .y(wire146), .clk(clk), .wire120(wire14), .wire119(wire6));
endmodule

module module117
#(parameter param145 = ((8'h9d) ? {(((+(8'h9e)) ? {(8'ha0), (8'hb5)} : ((8'ha5) ? (8'hb7) : (7'h43))) ? ({(7'h42), (8'hbe)} ? ((8'ha3) ? (8'ha8) : (8'hbf)) : {(8'ha6)}) : (((8'hb8) ? (8'ha4) : (7'h40)) << ((7'h41) ? (8'hbb) : (8'hae))))} : (^~(({(8'h9c), (8'h9f)} & {(8'hb5)}) ? (((8'hb3) || (8'had)) ? ((8'had) ? (8'hb5) : (7'h42)) : ((8'hba) ? (8'hac) : (8'h9f))) : (~((8'hbb) || (8'h9c)))))))
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire121;
  input wire [(4'hb):(1'h0)] wire120;
  input wire signed [(4'hb):(1'h0)] wire119;
  input wire [(2'h2):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire144;
  wire [(5'h13):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire142;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(5'h10):(1'h0)] wire126;
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire126,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg122 <= ((+$unsigned(wire120)) ?
          wire118 : $signed({{wire119[(4'h8):(4'h8)]},
              ({wire121, wire121} ?
                  (wire120 == wire118) : wire119[(4'ha):(1'h0)])}));
      reg123 <= $signed(($signed(($signed(wire118) << (-wire121))) << (wire118 << ((+wire121) ?
          wire120 : wire121[(3'h4):(2'h3)]))));
      reg124 <= $signed(wire118[(1'h1):(1'h0)]);
      reg125 <= (8'ha4);
    end
  assign wire126 = (|$signed(($signed($unsigned(reg122)) ?
                       (wire120[(2'h2):(2'h2)] <<< (reg123 ^~ wire121)) : $unsigned((reg125 ?
                           reg125 : wire121)))));
  always
    @(posedge clk) begin
      reg127 <= $signed(($signed($unsigned($signed(reg123))) ?
          $unsigned((^~$signed(wire119))) : {(wire119 ~^ wire119[(4'hb):(2'h3)])}));
      reg128 <= {{(^reg123[(2'h3):(1'h0)]),
              $unsigned($unsigned((reg125 ? wire118 : (8'hb9))))}};
    end
  always
    @(posedge clk) begin
      if (wire121[(3'h6):(3'h4)])
        begin
          reg129 <= $signed(reg124);
          reg130 <= $unsigned(reg125[(3'h4):(3'h4)]);
          reg131 <= $signed((!{(|(+(8'hb9))), $unsigned($signed(wire120))}));
        end
      else
        begin
          if ((^{{$signed({reg127}), $signed(reg123[(2'h3):(1'h0)])},
              (!((reg127 ? reg128 : reg127) ? wire119 : reg123))}))
            begin
              reg129 <= wire120[(4'h9):(1'h0)];
              reg130 <= $unsigned($signed((~reg131[(4'he):(1'h1)])));
              reg131 <= $unsigned((7'h42));
            end
          else
            begin
              reg129 <= reg125;
            end
          reg132 <= $unsigned((^~$unsigned((reg127[(5'h13):(4'hd)] == $unsigned(reg127)))));
          reg133 <= (~^$unsigned((^(-(wire121 << (8'ha0))))));
          reg134 <= {(~|(^~{(wire119 ~^ reg123),
                  (wire121 ? wire118 : reg127)}))};
        end
      reg135 <= $signed({((|wire120[(2'h2):(1'h1)]) || $signed({wire126}))});
      reg136 <= (+(~|((^~(reg133 & reg123)) <= reg122)));
      reg137 <= reg134[(2'h2):(1'h1)];
      reg138 <= $signed({{reg134[(2'h3):(1'h0)]},
          ($unsigned($signed(reg122)) ? (8'hb7) : reg132)});
    end
  assign wire139 = $signed({wire118[(2'h2):(1'h0)],
                       ($unsigned($unsigned(reg124)) - $signed((^reg132)))});
  assign wire140 = wire118;
  assign wire141 = ($unsigned(($unsigned($unsigned(wire119)) ?
                       (reg138[(5'h10):(4'h9)] ?
                           (8'hb9) : $unsigned(reg124)) : $unsigned(reg123[(3'h4):(1'h0)]))) < ($unsigned(wire121) ?
                       $unsigned($signed((~^reg131))) : reg122[(2'h2):(1'h1)]));
  assign wire142 = (~^reg129[(1'h1):(1'h1)]);
  assign wire143 = (^~$signed((reg132 <= ($unsigned(reg124) ?
                       (wire141 ? reg135 : reg122) : reg122))));
  assign wire144 = (wire143[(5'h13):(5'h12)] ?
                       $unsigned(wire139[(3'h6):(1'h1)]) : wire141[(2'h2):(1'h0)]);
endmodule

module module86
#(parameter param112 = (7'h42), 
parameter param113 = (({((8'haa) + (~^param112)), (~^(param112 ? param112 : param112))} ? {{(param112 ? param112 : (8'hb6))}, ((param112 ? param112 : (8'haa)) <= param112)} : (~{{param112, (8'hba)}})) ? param112 : (~^(((8'hb3) ? (param112 ? param112 : param112) : (param112 ? param112 : param112)) ? (7'h42) : param112))))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire91;
  input wire [(5'h12):(1'h0)] wire90;
  input wire [(3'h5):(1'h0)] wire89;
  input wire [(2'h3):(1'h0)] wire88;
  input wire [(3'h7):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(wire87) ?
          (wire88 & $signed((&$signed(wire90)))) : $unsigned($unsigned(wire87[(1'h0):(1'h0)]))))
        begin
          reg92 <= (8'h9e);
          reg93 <= $unsigned($signed((($signed(wire88) && $signed(wire90)) & wire90)));
          reg94 <= wire90;
        end
      else
        begin
          if ((-reg92[(2'h2):(1'h1)]))
            begin
              reg92 <= wire87[(3'h5):(2'h2)];
            end
          else
            begin
              reg92 <= ($unsigned((reg93 >= ((!reg93) ?
                  wire88[(1'h1):(1'h0)] : wire91))) && $unsigned(($signed((~|wire91)) >>> $unsigned((wire88 ?
                  reg93 : reg94)))));
            end
          reg93 <= reg92[(2'h3):(1'h1)];
          reg94 <= $signed((^~$signed((reg93[(1'h0):(1'h0)] <<< wire87[(2'h2):(1'h0)]))));
          if ({$signed((+((wire88 << reg94) - $unsigned(wire87))))})
            begin
              reg95 <= ((7'h43) ?
                  wire91[(4'hf):(2'h2)] : $unsigned({((8'ha4) >> (8'hb3)),
                      wire89}));
              reg96 <= (^~(^~(8'hb0)));
              reg97 <= (~^reg95[(3'h5):(1'h1)]);
              reg98 <= $signed({$signed((+$unsigned(reg93)))});
              reg99 <= $unsigned($unsigned(($signed((^reg93)) < reg96[(1'h1):(1'h0)])));
            end
          else
            begin
              reg95 <= (reg95 <= reg94);
              reg96 <= wire87[(2'h3):(1'h0)];
            end
          if (($unsigned((wire89[(3'h5):(1'h1)] >= {(&reg92)})) <<< {{reg98},
              reg97}))
            begin
              reg100 <= $signed($signed(wire91));
            end
          else
            begin
              reg100 <= (-wire87);
              reg101 <= $signed($signed(wire90));
            end
        end
      reg102 <= ($signed(wire91[(1'h1):(1'h1)]) ?
          wire88[(1'h0):(1'h0)] : $signed(reg92));
      reg103 <= (reg101[(1'h0):(1'h0)] ?
          $signed({reg100[(4'hc):(3'h5)]}) : ((!reg94[(1'h1):(1'h1)]) == reg98));
      reg104 <= reg98[(1'h0):(1'h0)];
      reg105 <= reg94;
    end
  always
    @(posedge clk) begin
      reg106 <= ({{$unsigned((reg101 && wire89))}, reg102[(1'h1):(1'h0)]} ?
          {(($signed((8'hb1)) ? (^~reg94) : wire90[(3'h7):(3'h7)]) ?
                  (reg103[(2'h2):(1'h1)] < {reg94}) : {reg101[(1'h1):(1'h1)],
                      $unsigned(reg96)}),
              {reg93, {wire87[(1'h0):(1'h0)]}}} : wire91);
      reg107 <= wire87[(3'h6):(3'h6)];
      reg108 <= reg99;
    end
  assign wire109 = (!(($signed(reg94[(2'h3):(2'h3)]) < reg107) ?
                       $signed($unsigned(wire88[(1'h0):(1'h0)])) : reg105));
  assign wire110 = reg92[(1'h0):(1'h0)];
  assign wire111 = reg102[(1'h0):(1'h0)];
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire58;
  input wire signed [(4'hb):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  input wire [(2'h2):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  assign y = {wire82,
                 wire79,
                 wire78,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg81,
                 reg80,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire59 = $unsigned((wire55[(1'h1):(1'h0)] * $signed(wire57[(3'h4):(3'h4)])));
  assign wire60 = ((~&$signed($unsigned((wire57 | wire57)))) << wire57);
  assign wire61 = (~$unsigned(({(~|wire56), (wire55 == wire58)} ?
                      {$signed(wire56)} : wire57[(2'h2):(2'h2)])));
  assign wire62 = (-(~^(+$unsigned((wire60 >> wire58)))));
  assign wire63 = ($unsigned($unsigned($signed({wire62}))) ?
                      $signed((($signed(wire60) & (wire59 ^ wire56)) || {(wire57 ?
                              wire58 : (8'h9f)),
                          wire59[(2'h2):(2'h2)]})) : (((~(wire56 ?
                              wire57 : wire62)) ?
                          (8'ha1) : (~&(wire58 + wire56))) > (($unsigned(wire57) | (~wire56)) == (wire60[(3'h4):(2'h3)] ?
                          wire60[(3'h6):(3'h6)] : $signed(wire62)))));
  assign wire64 = {$unsigned(((((8'hbc) & wire58) <= $unsigned(wire63)) << $signed($signed(wire58)))),
                      ({(^wire60)} ?
                          (($signed(wire57) + (wire57 == wire62)) > ($signed(wire57) ?
                              wire62[(1'h1):(1'h1)] : (~|wire56))) : {wire63})};
  assign wire65 = (wire60[(1'h0):(1'h0)] ?
                      ((^~wire60) ?
                          ($unsigned((~wire61)) | $unsigned($unsigned(wire63))) : $unsigned($unsigned(wire64))) : (wire64[(2'h2):(1'h1)] ?
                          {$signed(wire57)} : (~^$unsigned((wire62 ?
                              wire57 : wire56)))));
  assign wire66 = {$signed((~|$unsigned($signed(wire58))))};
  assign wire67 = $unsigned((|(|wire58)));
  assign wire68 = (+($unsigned((+{wire64, wire58})) ?
                      (-(~^((8'ha3) ?
                          (8'hba) : (7'h43)))) : $unsigned((+(wire56 && wire60)))));
  assign wire69 = $signed((~(~^($unsigned((8'hab)) ?
                      (^wire68) : $signed(wire63)))));
  assign wire70 = wire67[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg71 <= (~^(wire63[(5'h10):(3'h7)] || wire56));
      reg72 <= $unsigned($signed({(-(wire61 ? wire57 : wire60))}));
      if ({{wire57[(1'h0):(1'h0)], (!$unsigned((wire67 ^~ wire69)))},
          ((wire55[(2'h2):(1'h1)] ?
              ((^wire70) ?
                  wire57[(3'h5):(3'h4)] : wire55) : $unsigned((|wire55))) >> $unsigned((^~{wire69})))})
        begin
          reg73 <= (~^$unsigned((^({(8'ha6)} ?
              $signed(wire64) : wire60[(3'h4):(1'h0)]))));
          reg74 <= (wire70[(3'h7):(2'h3)] ?
              ((wire58 ?
                  (&$unsigned((7'h40))) : reg72) << (wire59[(3'h4):(1'h1)] >>> wire56)) : (~|(wire66[(4'h8):(3'h7)] ?
                  $unsigned((wire60 ~^ wire60)) : {{wire67, wire70}})));
          reg75 <= wire55[(1'h1):(1'h1)];
          reg76 <= reg74[(3'h4):(3'h4)];
        end
      else
        begin
          if (($signed(wire55) && $unsigned((|wire60[(2'h2):(1'h1)]))))
            begin
              reg73 <= (~&((^~(~&(wire63 != wire70))) >> reg75[(3'h4):(3'h4)]));
            end
          else
            begin
              reg73 <= ((({$signed(wire57), {wire61}} ?
                  wire59 : $signed($unsigned(reg74))) << wire63[(4'hc):(4'h8)]) > wire56[(3'h7):(3'h5)]);
              reg74 <= (|wire61[(4'h9):(3'h5)]);
              reg75 <= $unsigned($signed({$signed($signed((8'ha6)))}));
            end
          reg76 <= (~$signed(((reg73 == $unsigned(wire60)) * (~^reg76[(2'h3):(2'h2)]))));
          reg77 <= $unsigned(($unsigned((8'ha1)) << $signed((!$signed(reg76)))));
        end
    end
  assign wire78 = (wire64[(1'h0):(1'h0)] || (|$signed($signed($unsigned(reg72)))));
  assign wire79 = {wire59[(4'h8):(3'h5)]};
  always
    @(posedge clk) begin
      reg80 <= wire70[(1'h1):(1'h0)];
      reg81 <= ($unsigned(((wire59 ?
          (^(8'hb2)) : $unsigned(wire65)) & {(wire70 ~^ (8'hb5)),
          (8'hb5)})) ^ $signed((($unsigned(wire65) ?
              $signed(reg74) : (-wire57)) ?
          $signed(wire70[(4'he):(3'h7)]) : $signed(wire67))));
    end
  assign wire82 = wire69;
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= $unsigned({{wire17, $signed((|wire19))}, (-wire17)});
    end
  always
    @(posedge clk) begin
      if ({((((^wire17) ?
              $signed(wire17) : (|wire17)) != $signed(wire16[(3'h6):(2'h3)])) | $unsigned(wire18)),
          wire19})
        begin
          reg21 <= $signed(((wire19[(4'h9):(3'h5)] ^ (^~(~reg20))) ?
              $unsigned(wire17[(3'h5):(3'h5)]) : $signed((^~(^~wire16)))));
          if ((~^$unsigned($unsigned((wire17 >= (wire18 ^ wire16))))))
            begin
              reg22 <= ($unsigned(reg20) ?
                  {(reg20[(2'h3):(1'h1)] ?
                          $signed(wire18) : (reg20 ?
                              (wire16 * (8'hbd)) : (reg20 >= wire18))),
                      (^~($signed(reg21) ?
                          $signed(wire18) : $unsigned(wire17)))} : $signed(($unsigned((wire17 || (8'h9d))) * wire18[(3'h5):(3'h5)])));
              reg23 <= (((^$unsigned(wire16)) ?
                      $signed((wire16[(2'h2):(2'h2)] & $unsigned(reg22))) : $signed({wire16,
                          reg20[(3'h5):(3'h5)]})) ?
                  ((!wire17) ?
                      $unsigned(wire16[(4'hf):(4'hb)]) : ($unsigned((wire16 * wire19)) ^ (!(8'ha4)))) : $signed($unsigned($signed((wire19 <= (8'h9e))))));
              reg24 <= {wire16[(4'he):(3'h6)]};
              reg25 <= {wire19[(4'h8):(3'h6)],
                  (~&(|(reg21[(4'he):(2'h2)] ?
                      reg24 : wire18[(5'h11):(1'h1)])))};
            end
          else
            begin
              reg22 <= ((^~$unsigned(({(8'hbf), reg24} >> $unsigned(reg24)))) ?
                  (|(^~$signed((8'hbc)))) : (reg23[(2'h2):(1'h1)] != ((~|$unsigned(reg21)) ^ (!$unsigned(reg20)))));
              reg23 <= $signed(wire16);
              reg24 <= (&wire18);
              reg25 <= reg22;
            end
          reg26 <= wire17;
          reg27 <= $signed($signed(((~|((7'h42) || wire16)) ^~ (reg24 == $signed((8'hb3))))));
        end
      else
        begin
          reg21 <= reg22[(2'h3):(1'h0)];
          reg22 <= reg23;
          reg23 <= ($signed(((reg20 <<< (wire17 + reg24)) ?
                  $signed((&reg26)) : wire17[(1'h0):(1'h0)])) ?
              wire18[(3'h4):(1'h1)] : {$unsigned((-(-(7'h42)))),
                  wire19[(5'h12):(3'h4)]});
          reg24 <= $unsigned(((^~{(~^wire16)}) ~^ reg27));
        end
      reg28 <= ($unsigned((~|($unsigned(wire18) >> $signed(wire18)))) & $signed((|reg20)));
      reg29 <= {(-$unsigned($signed($signed(reg23)))), wire18};
    end
  assign wire30 = ({(reg22[(5'h12):(4'ha)] ?
                              reg28[(3'h6):(3'h5)] : {wire18[(4'ha):(3'h7)],
                                  {reg27}})} ?
                      (~$signed($unsigned((&wire16)))) : reg21);
  assign wire31 = $signed((reg25[(3'h4):(3'h4)] ?
                      (^($unsigned((8'hbe)) ~^ (8'hb8))) : $signed({(reg28 == wire18),
                          reg21})));
  assign wire32 = wire19[(3'h7):(2'h2)];
  assign wire33 = wire32;
  assign wire34 = (^$unsigned(wire33[(3'h6):(1'h1)]));
  assign wire35 = reg24;
  assign wire36 = $signed(($unsigned(wire16[(4'h8):(1'h1)]) ?
                      (((~reg27) ?
                          $signed(wire16) : ((8'hb1) + reg28)) > $unsigned($unsigned((8'ha2)))) : (~$unsigned(wire18[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg37 <= ($unsigned($signed($unsigned($unsigned(reg29)))) | (+(~$signed($signed(reg20)))));
      if (reg27[(1'h1):(1'h1)])
        begin
          if (({reg26[(4'hc):(3'h4)]} || ($signed((8'hbf)) == reg26)))
            begin
              reg38 <= ($unsigned((reg21[(4'h8):(2'h2)] ?
                  ((8'ha8) ?
                      (wire19 * wire31) : {reg27,
                          reg22}) : wire30[(5'h11):(3'h5)])) ~^ ((+{(8'ha2)}) ?
                  wire17[(1'h1):(1'h0)] : $signed(reg27[(3'h6):(2'h2)])));
              reg39 <= reg25[(2'h2):(2'h2)];
              reg40 <= reg38[(3'h4):(2'h2)];
              reg41 <= ($signed($unsigned(((reg27 ? wire17 : wire33) > {(8'ha5),
                      (8'hb1)}))) ?
                  ($unsigned({((8'hbe) ? (8'h9c) : reg38), $signed(wire36)}) ?
                      reg37[(2'h2):(2'h2)] : (^({reg26, reg40} ?
                          wire36 : wire19))) : reg29);
              reg42 <= reg25;
            end
          else
            begin
              reg38 <= (reg28[(4'ha):(2'h3)] - reg29[(3'h5):(1'h0)]);
              reg39 <= reg39[(1'h0):(1'h0)];
              reg40 <= wire30;
              reg41 <= ($signed({reg21[(5'h13):(4'hd)]}) ^~ ((&(wire19 ~^ reg41)) <<< ((wire30[(4'ha):(3'h5)] ?
                      $unsigned(wire31) : $signed(reg40)) ?
                  {$signed(reg27)} : ({wire33, reg20} ?
                      reg21[(5'h14):(5'h12)] : reg26[(1'h1):(1'h1)]))));
            end
          reg43 <= reg42[(2'h3):(2'h2)];
          reg44 <= $signed(reg29[(1'h0):(1'h0)]);
        end
      else
        begin
          reg38 <= (|$unsigned(($signed({(8'hb8),
              reg40}) ^ (wire31[(4'h9):(4'h9)] >>> $unsigned(wire36)))));
          if ((~^$signed((((reg20 ~^ wire35) >= $unsigned(reg23)) ?
              $unsigned(((8'hb4) ? reg40 : (8'hbc))) : reg42))))
            begin
              reg39 <= (($unsigned($signed(wire36[(3'h6):(3'h6)])) && $signed((((8'ha6) < reg29) | (reg23 ?
                  reg21 : (7'h44))))) >>> wire31);
            end
          else
            begin
              reg39 <= reg26;
              reg40 <= wire30;
              reg41 <= ({reg44[(2'h2):(2'h2)],
                      (reg39[(1'h1):(1'h0)] ?
                          {$unsigned(reg38), $signed(reg26)} : ((8'hbb) ?
                              (wire30 >> wire30) : reg20))} ?
                  $unsigned(({wire33} > reg28[(3'h6):(2'h2)])) : {wire34,
                      $unsigned(reg28)});
            end
          reg42 <= ((+$signed($unsigned($signed((8'ha7))))) == $unsigned((~&$unsigned($signed((8'had))))));
          reg43 <= ((8'hbc) ? $signed(wire31) : wire33[(1'h1):(1'h1)]);
          reg44 <= (-$unsigned(({$signed(reg20)} != reg24[(3'h4):(1'h0)])));
        end
    end
  always
    @(posedge clk) begin
      reg45 <= reg24;
      reg46 <= wire33;
      reg47 <= ($signed($unsigned(reg39)) > (((~wire35[(4'hc):(1'h1)]) << {$unsigned(reg21)}) == $unsigned({reg22[(5'h10):(3'h7)],
          reg29[(2'h3):(1'h1)]})));
    end
  assign wire48 = $signed((+$unsigned({wire17, $unsigned((8'hbf))})));
  assign wire49 = (^~(7'h42));
  assign wire50 = $unsigned((~|wire31[(4'hf):(3'h6)]));
  assign wire51 = $signed((^wire17));
endmodule
