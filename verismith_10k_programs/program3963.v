module top
#(parameter param150 = {((((~&(8'ha3)) >> {(8'hb4), (8'hac)}) ? {(~(8'hb8))} : (8'ha9)) <= {{((8'hb0) || (8'haa)), ((8'h9d) >> (8'ha1))}, ((~|(8'hb8)) || ((8'ha4) ? (8'hb9) : (8'hab)))})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire147;
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire149,
                 wire143,
                 wire145,
                 wire146,
                 wire147,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(wire2);
      reg5 <= $unsigned($signed($signed($signed(wire3[(1'h1):(1'h1)]))));
      reg6 <= ($signed(($unsigned({reg5,
              wire2}) << $signed($unsigned(wire3)))) ?
          ($unsigned($unsigned(wire2)) << reg4) : (($unsigned((wire3 ?
              reg5 : wire0)) << (((8'h9d) >> wire3) & ((8'hb8) ?
              wire1 : wire2))) << reg4[(4'hb):(3'h4)]));
      reg7 <= (7'h43);
      reg8 <= ($unsigned($signed(reg5[(2'h3):(1'h0)])) - reg5);
    end
  module9 #() modinst144 (.wire12(reg7), .wire13(reg5), .clk(clk), .y(wire143), .wire11(reg4), .wire10(wire0));
  assign wire145 = $unsigned(wire0[(4'hc):(1'h0)]);
  assign wire146 = (8'ha4);
  module48 #() modinst148 (.wire51(reg4), .y(wire147), .clk(clk), .wire50(reg8), .wire49(wire145), .wire53(wire2), .wire52(wire1));
  assign wire149 = (wire147[(3'h5):(2'h2)] ?
                       reg4[(2'h2):(1'h1)] : wire146[(3'h5):(1'h0)]);
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire79;
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  assign y = {wire141,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire59,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire14,
                 wire63,
                 wire64,
                 wire65,
                 wire79,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire14 = wire12[(1'h0):(1'h0)];
  module15 #() modinst42 (wire41, clk, wire12, wire14, wire11, wire10);
  assign wire43 = $unsigned((wire41[(2'h2):(1'h0)] * $signed($signed(wire11))));
  assign wire44 = $unsigned(wire41);
  assign wire45 = wire44[(4'hd):(4'ha)];
  assign wire46 = (~wire45[(2'h2):(1'h0)]);
  assign wire47 = ({$signed(wire43[(4'h8):(2'h2)]),
                          ((-wire44[(3'h5):(1'h0)]) ~^ (wire11 < $unsigned(wire46)))} ?
                      (wire12 ^~ ((wire14 ?
                          wire12[(3'h7):(3'h5)] : (wire44 * (8'h9d))) > $signed(wire44[(5'h12):(1'h1)]))) : $signed((!($unsigned(wire11) ?
                          wire44[(4'he):(3'h7)] : (-(8'hb3))))));
  module48 #() modinst60 (.wire49(wire41), .wire53(wire43), .wire51(wire10), .y(wire59), .clk(clk), .wire50(wire44), .wire52(wire11));
  always
    @(posedge clk) begin
      reg61 <= ($unsigned($unsigned($signed(((8'hbe) ? wire47 : wire12)))) ?
          (8'hb2) : (~|(wire12 != (!(-wire47)))));
      reg62 <= $unsigned(wire59);
    end
  assign wire63 = reg62;
  assign wire64 = (~&({(^~wire14[(1'h0):(1'h0)]), wire43[(4'ha):(4'h9)]} ?
                      $signed(((wire14 >> wire44) ?
                          $signed(wire47) : (&wire41))) : (~|wire59)));
  assign wire65 = ((wire46 < $signed($unsigned($signed((8'hbd))))) ?
                      (wire14[(1'h0):(1'h0)] < $unsigned(wire43)) : reg61);
  module66 #() modinst80 (.wire70(reg61), .clk(clk), .wire68(wire45), .wire69(wire12), .wire67(wire43), .y(wire79));
  assign wire81 = wire65;
  assign wire82 = wire47;
  assign wire83 = wire10;
  assign wire84 = $unsigned($signed(($unsigned((~&(8'had))) || wire81)));
  module85 #() modinst142 (.clk(clk), .wire86(wire45), .y(wire141), .wire87(wire44), .wire88(wire79), .wire89(wire81));
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h253):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire89;
  input wire [(3'h7):(1'h0)] wire88;
  input wire signed [(4'ha):(1'h0)] wire87;
  input wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire138;
  wire [(4'h9):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire90;
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire91,
                 wire90,
                 reg140,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
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
  assign wire90 = wire87[(4'ha):(4'h9)];
  assign wire91 = wire87[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg92 <= wire89;
      if ({$unsigned(wire89)})
        begin
          if (wire87[(3'h7):(3'h5)])
            begin
              reg93 <= $signed(reg92[(3'h7):(1'h1)]);
              reg94 <= {$signed((~&(^~(reg93 && wire90)))), (7'h41)};
            end
          else
            begin
              reg93 <= (reg93[(5'h13):(3'h7)] >= $unsigned(((wire91[(2'h2):(1'h0)] > (&wire91)) || wire90)));
              reg94 <= (-(!(7'h42)));
              reg95 <= (($unsigned((|$signed(reg93))) - reg93) ?
                  reg92[(5'h13):(4'hc)] : $unsigned($signed(((wire91 | wire88) ?
                      (^wire86) : {reg92}))));
            end
          reg96 <= reg92;
          reg97 <= reg93[(2'h3):(1'h0)];
          if ((wire89[(2'h2):(1'h0)] ?
              ({wire90[(4'hf):(2'h2)], wire90} ?
                  {reg95[(4'ha):(4'h8)]} : wire90) : (wire86 ?
                  (^~reg92) : $signed(reg92[(5'h12):(4'hd)]))))
            begin
              reg98 <= (((((reg96 ?
                  wire88 : (8'hab)) <<< (wire90 ^~ reg93)) | wire89[(1'h0):(1'h0)]) * reg93) ~^ reg92[(3'h4):(1'h0)]);
              reg99 <= ({$signed((|reg98))} ?
                  reg95[(1'h0):(1'h0)] : $unsigned(($signed((+wire88)) ?
                      $unsigned($signed(reg95)) : $unsigned((^~(8'ha4))))));
            end
          else
            begin
              reg98 <= ($signed($signed($unsigned((^~wire91)))) ~^ {reg96,
                  (~|$unsigned(reg96[(5'h14):(5'h13)]))});
              reg99 <= $unsigned((~($unsigned((reg92 ^~ (8'haf))) ?
                  $signed($unsigned(wire87)) : wire90)));
            end
        end
      else
        begin
          reg93 <= (-($unsigned($unsigned(reg96[(4'hc):(3'h5)])) >> ((8'hb0) ?
              {$unsigned(reg97)} : reg99)));
        end
      reg100 <= reg98;
      if ($unsigned($unsigned((|reg100[(3'h4):(1'h0)]))))
        begin
          reg101 <= $unsigned($signed((reg98 ?
              $unsigned((|(8'hb1))) : (+wire91))));
        end
      else
        begin
          reg101 <= (({$unsigned((wire88 ? (8'h9e) : wire86))} ?
              {$unsigned(reg93[(5'h11):(5'h10)]),
                  wire88} : (~|$unsigned(((8'hbc) - wire89)))) + wire89);
          reg102 <= (wire89[(2'h2):(2'h2)] && ((8'hbe) ?
              {$unsigned($unsigned(reg98))} : $signed($unsigned((wire88 <= (8'hbe))))));
          reg103 <= (({reg98[(1'h1):(1'h0)],
              wire90[(4'hd):(1'h1)]} + wire91[(2'h2):(1'h1)]) & (~$signed($unsigned($unsigned(reg96)))));
          reg104 <= $unsigned({$signed(({wire90} ?
                  (~^wire91) : (reg96 ? wire90 : reg99))),
              $signed(wire86)});
        end
    end
  assign wire105 = $signed($unsigned((-reg103)));
  assign wire106 = {((&wire87) ?
                           (8'hb8) : ((~|(+reg101)) >> $unsigned($signed(wire86)))),
                       ((-{(reg93 ? wire91 : (8'hb3)),
                               (reg93 ? reg103 : wire89)}) ?
                           (wire88 >= (reg99[(2'h2):(1'h0)] ?
                               $unsigned((8'hbd)) : (wire90 ?
                                   reg92 : (8'ha9)))) : (reg104 - reg92))};
  assign wire107 = $signed(($signed(((reg95 ? reg97 : reg95) ?
                       $signed(wire106) : (reg99 ?
                           reg98 : reg96))) >> wire90[(4'h9):(2'h2)]));
  assign wire108 = $signed(reg92);
  always
    @(posedge clk) begin
      reg109 <= (({(wire86[(4'ha):(3'h7)] ? (wire107 && reg95) : (~|reg97)),
          (7'h40)} && (~&(reg100 | $unsigned(reg101)))) >>> $signed((reg99 ?
          ((reg101 || reg92) != reg94) : {(8'h9d)})));
      reg110 <= $unsigned(reg104);
      if ((reg101 && $unsigned(($unsigned($unsigned(wire87)) ?
          (^(~^wire89)) : ((!reg100) + $signed(reg93))))))
        begin
          reg111 <= (~^(8'hb7));
          reg112 <= $unsigned(wire87[(3'h7):(1'h1)]);
          reg113 <= (8'ha2);
          if ((~|$unsigned(reg111[(1'h1):(1'h1)])))
            begin
              reg114 <= $unsigned(wire88);
            end
          else
            begin
              reg114 <= wire106[(2'h2):(2'h2)];
              reg115 <= wire89;
              reg116 <= ((^$unsigned((-(wire105 ?
                  wire106 : (8'ha7))))) >>> (($signed((wire89 ?
                          reg113 : reg114)) ?
                      reg100 : reg103[(4'ha):(1'h1)]) ?
                  $unsigned((8'ha4)) : (wire87[(4'h8):(2'h2)] ?
                      $unsigned(wire90) : (reg114[(3'h7):(2'h2)] ?
                          wire108 : ((8'hb4) ? (8'ha6) : reg92)))));
              reg117 <= (($signed((reg94[(1'h0):(1'h0)] ?
                      (reg97 >> wire108) : {(8'hb7)})) ?
                  (reg94 * {(reg109 || reg95),
                      (reg92 ?
                          reg97 : reg104)}) : ((&$unsigned(wire88)) == ({wire106,
                      reg99} && $signed((8'ha9))))) == (reg110[(1'h1):(1'h0)] ~^ (^~(~&$unsigned(reg115)))));
            end
          reg118 <= (wire89 ? reg95[(2'h3):(1'h1)] : (8'ha8));
        end
      else
        begin
          reg111 <= (($signed(reg109) + {reg102[(5'h14):(5'h10)],
              reg117}) << (~&(((reg95 ? wire107 : wire91) ?
                  (reg94 != reg103) : (reg116 ? wire89 : reg101)) ?
              reg96 : $unsigned($unsigned(reg102)))));
        end
    end
  assign wire119 = (|(~$signed(({wire108} < reg116))));
  assign wire120 = {reg117, reg117};
  assign wire121 = (reg112[(4'h8):(3'h5)] ?
                       $unsigned(reg110[(1'h1):(1'h0)]) : $unsigned(reg95[(4'hc):(4'h9)]));
  assign wire122 = (wire88[(2'h2):(1'h1)] ^~ $signed(wire89[(1'h0):(1'h0)]));
  assign wire123 = wire108;
  assign wire124 = (+(&(((!reg102) ?
                       $unsigned((8'hb2)) : $signed(reg103)) - $unsigned(reg92[(5'h10):(3'h4)]))));
  assign wire125 = (|(($unsigned($unsigned(reg117)) > (((7'h43) ?
                       reg104 : (8'hba)) - (&reg99))) || reg95));
  assign wire126 = $unsigned($signed((8'hbe)));
  assign wire127 = $unsigned($unsigned($signed($unsigned(reg116[(3'h4):(1'h0)]))));
  assign wire128 = $signed((+(-$signed($unsigned(reg113)))));
  assign wire129 = reg110[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned({reg98, $unsigned($unsigned((^reg111)))}))
        begin
          reg130 <= $unsigned(reg104);
        end
      else
        begin
          reg130 <= reg116[(5'h12):(4'h8)];
          reg131 <= {$unsigned((!(~$signed(reg116))))};
          if (($unsigned($unsigned(reg115)) ?
              reg117[(2'h3):(1'h0)] : $unsigned($signed($signed((wire86 ?
                  reg104 : wire126))))))
            begin
              reg132 <= ((|(-wire90)) <<< (wire124[(2'h3):(2'h3)] >= wire129[(4'h8):(4'h8)]));
              reg133 <= ($unsigned(wire88[(3'h5):(2'h2)]) * (reg112[(1'h0):(1'h0)] ?
                  $signed(wire105[(1'h0):(1'h0)]) : reg116));
            end
          else
            begin
              reg132 <= wire126[(3'h4):(3'h4)];
              reg133 <= ({reg113[(2'h2):(1'h0)],
                  ($signed($unsigned(wire127)) ?
                      reg114 : $signed($unsigned(wire108)))} > $unsigned($unsigned(($signed(wire128) * $unsigned(reg109)))));
            end
        end
      reg134 <= reg92;
      reg135 <= ((8'hb8) ?
          ((($unsigned(wire91) == $signed(reg132)) ?
              ((&wire107) != (&reg99)) : (^~reg112)) > wire124) : reg102[(5'h11):(4'hf)]);
      reg136 <= $unsigned((reg98[(2'h3):(1'h1)] ? (8'ha2) : {wire129}));
      reg137 <= wire108;
    end
  assign wire138 = $signed($signed(($unsigned(reg102) ?
                       {$signed(reg103),
                           ((8'hb7) ?
                               reg114 : (8'hae))} : $unsigned((wire87 >> reg95)))));
  assign wire139 = $unsigned({(reg135[(4'hc):(3'h7)] ?
                           reg135[(1'h1):(1'h1)] : ($unsigned(wire106) ?
                               (|wire121) : (wire90 ? wire106 : reg111))),
                       $unsigned(((reg94 ?
                           (8'ha7) : reg103) > $unsigned(reg102)))});
  always
    @(posedge clk) begin
      reg140 <= $signed($signed(({reg116} ?
          $signed($signed(wire107)) : $unsigned((reg110 ?
              (8'hbe) : wire139)))));
    end
endmodule

module module66
#(parameter param77 = ((^({(~(8'hbb)), ((8'haa) - (8'hb8))} ? (~&((8'ha6) || (8'ha8))) : (-{(8'hbc), (8'hae)}))) ~^ {(&({(7'h42), (8'haf)} ? (~(8'ha3)) : (~&(8'ha9)))), ((~((8'haa) ? (8'h9f) : (8'hb7))) ? ((8'hbb) >= ((8'hbf) != (8'hba))) : (+((8'hb4) >= (8'hb5))))}), 
parameter param78 = (!param77))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire70;
  input wire [(4'he):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire68;
  input wire signed [(4'hc):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  assign y = {wire76, wire75, wire74, wire73, wire72, wire71, (1'h0)};
  assign wire71 = $signed((!$signed(wire67[(2'h3):(2'h3)])));
  assign wire72 = $unsigned($unsigned((wire71[(1'h1):(1'h0)] <<< wire68)));
  assign wire73 = $unsigned(wire72[(4'ha):(4'h8)]);
  assign wire74 = $signed((($unsigned((wire71 & wire67)) * (^$unsigned(wire68))) ?
                      $unsigned(wire67[(4'hc):(4'ha)]) : wire69));
  assign wire75 = $unsigned($signed(wire72));
  assign wire76 = {wire74};
endmodule

module module48
#(parameter param58 = (~((|(7'h40)) ? (((+(8'hac)) ? (~^(8'ha3)) : ((8'hab) ? (8'hba) : (8'ha3))) || {((8'ha5) ? (8'hb0) : (8'ha5)), ((8'hb0) ? (8'haf) : (8'hbd))}) : ((((7'h40) ? (8'hb6) : (8'h9c)) && (^(8'hac))) - (~^{(8'ha6), (8'hae)})))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire53;
  input wire signed [(4'h9):(1'h0)] wire52;
  input wire [(3'h6):(1'h0)] wire51;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire signed [(4'hc):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  assign y = {wire57, wire56, wire55, wire54, (1'h0)};
  assign wire54 = wire49[(4'hc):(1'h1)];
  assign wire55 = {wire52[(2'h2):(1'h0)],
                      (((wire54 ? {wire49, wire53} : $signed(wire49)) ?
                          (!(~^wire52)) : (^~wire49)) || wire51[(1'h1):(1'h1)])};
  assign wire56 = ({({wire51[(3'h4):(3'h4)], wire54[(1'h1):(1'h1)]} ?
                          (-(wire52 + wire50)) : wire51[(1'h1):(1'h1)])} | (~^({$unsigned(wire51),
                      wire53} | $unsigned(wire55))));
  assign wire57 = (~$signed((8'h9c)));
endmodule

module module15
#(parameter param40 = {{{(((8'hac) ? (8'haf) : (8'haa)) ? ((8'h9d) ? (8'hb1) : (8'had)) : ((8'ha5) ? (7'h42) : (7'h40)))}, (({(8'ha8)} && ((8'hac) != (8'ha5))) ? ((~&(8'hab)) ? ((8'had) <<< (8'ha3)) : ((8'ha0) ? (8'h9f) : (8'hb3))) : (~&((8'ha6) ? (7'h41) : (8'hbb))))}, (~^((~&((8'hab) ? (8'hb0) : (8'hbe))) < (((8'hb3) ? (8'hb8) : (8'ha9)) <<< {(8'h9e), (8'ha7)})))})
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  assign y = {wire26,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg39,
                 reg38,
                 reg37,
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
                 reg25,
                 (1'h0)};
  assign wire20 = $signed(((&$signed((wire16 ~^ wire17))) ?
                      {{$signed((8'hae)),
                              $signed(wire16)}} : (+wire16[(2'h3):(2'h3)])));
  assign wire21 = (($signed(wire18[(2'h2):(1'h1)]) ?
                      {wire16[(1'h1):(1'h1)],
                          wire20[(3'h6):(1'h1)]} : $signed(((wire20 >= wire16) ?
                          (wire19 ?
                              wire18 : wire20) : $signed(wire17)))) & wire16);
  assign wire22 = (({((wire21 >>> (8'h9c)) <= (&(7'h40))),
                          ($signed(wire21) ^~ $signed(wire19))} ^ (($unsigned(wire21) ^~ wire16) ?
                          wire18[(1'h1):(1'h0)] : $signed((^wire16)))) ?
                      ((8'hac) < $unsigned($unsigned((wire19 ?
                          wire18 : wire17)))) : (&(((wire20 ?
                              wire16 : wire19) >>> wire18) ?
                          ($unsigned(wire19) ^ $signed(wire19)) : $signed((wire21 ?
                              (8'hb5) : wire20)))));
  assign wire23 = $signed((^$unsigned($signed(wire17))));
  assign wire24 = $unsigned($signed($signed($signed($signed(wire23)))));
  always
    @(posedge clk) begin
      reg25 <= {($unsigned((8'hba)) | $signed((wire19 >>> (^~(8'hbc)))))};
    end
  assign wire26 = wire19[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed((~^wire26[(2'h2):(1'h1)])))
        begin
          reg27 <= $signed($unsigned((reg25[(1'h1):(1'h0)] ?
              wire26 : ((reg25 ? wire20 : (8'hbd)) ?
                  $signed(wire26) : wire18))));
          reg28 <= $signed(((wire23[(1'h0):(1'h0)] >> ($signed(reg25) * wire18)) + (((wire23 ?
              (8'hbb) : reg25) < $signed(wire17)) | wire19)));
          reg29 <= wire19;
          if ((reg29 ?
              $unsigned((&(reg27[(1'h1):(1'h0)] ?
                  $unsigned(wire17) : (wire20 ? wire17 : reg27)))) : reg28))
            begin
              reg30 <= $unsigned((($signed({wire17}) ?
                      {wire19[(1'h0):(1'h0)], reg27} : reg29) ?
                  (({wire16, reg28} == ((8'hba) ? wire20 : reg25)) ?
                      (~&wire22) : {{wire23,
                              (8'had)}}) : wire17[(4'h9):(1'h0)]));
            end
          else
            begin
              reg30 <= $signed((+(8'hb7)));
            end
          reg31 <= ((($signed((reg25 ^ wire20)) >= wire16[(1'h0):(1'h0)]) ?
                  $signed(reg28) : ($signed(reg25[(4'h9):(4'h8)]) < {$unsigned(wire20)})) ?
              (~(-wire19[(2'h2):(1'h0)])) : wire20);
        end
      else
        begin
          reg27 <= (wire23 ?
              $signed(wire20) : {($unsigned($unsigned(wire20)) == {(reg28 ?
                          (8'ha6) : (8'hb5))}),
                  $unsigned(wire23)});
          reg28 <= $unsigned($signed(wire21));
          reg29 <= $signed(wire26[(2'h3):(2'h2)]);
          if ($unsigned(wire22[(1'h0):(1'h0)]))
            begin
              reg30 <= ((~&$signed($signed((wire19 || wire22)))) == wire21);
              reg31 <= $signed(wire26[(1'h0):(1'h0)]);
              reg32 <= wire20;
              reg33 <= (!wire16[(3'h5):(3'h5)]);
              reg34 <= {$signed((((-(8'hb6)) || (^~(8'ha9))) ?
                      wire16[(1'h0):(1'h0)] : $unsigned(wire18)))};
            end
          else
            begin
              reg30 <= {(($signed(wire17[(1'h0):(1'h0)]) ?
                          wire20 : wire16[(3'h5):(2'h3)]) ?
                      {(7'h41)} : ({reg30, (8'haf)} ?
                          ({reg33} ?
                              wire22[(1'h1):(1'h1)] : (reg31 ?
                                  (8'h9f) : reg33)) : wire18)),
                  (~^{reg30[(3'h5):(1'h1)]})};
              reg31 <= ($unsigned((({reg33, wire18} ?
                  (wire22 || wire22) : (7'h41)) ~^ $signed($signed(wire17)))) << (~reg31[(3'h6):(3'h5)]));
              reg32 <= (~(~^(~((~reg27) > (~|wire21)))));
              reg33 <= $signed($signed(wire21[(2'h3):(1'h1)]));
              reg34 <= ((wire23 * wire20[(3'h4):(3'h4)]) ?
                  $unsigned($signed($unsigned((7'h41)))) : $unsigned((+{reg25,
                      $signed(wire21)})));
            end
          reg35 <= ((&(wire26[(4'h9):(4'h8)] ?
                  (8'h9f) : (~&$unsigned(wire22)))) ?
              {((^reg32) ? (~(8'ha9)) : reg28),
                  (((wire22 - reg28) == {wire19, wire19}) * ((7'h42) + {reg30,
                      (8'hb6)}))} : ($signed(reg27[(3'h4):(2'h2)]) ^~ (~&($signed((8'hb4)) ?
                  reg32[(1'h1):(1'h1)] : (wire16 && wire22)))));
        end
      reg36 <= $signed(wire23[(4'hd):(1'h0)]);
      if ((reg25[(2'h3):(1'h0)] == {wire16[(3'h6):(3'h6)]}))
        begin
          reg37 <= (reg32[(3'h4):(1'h1)] ? $signed($unsigned((8'hb2))) : reg29);
        end
      else
        begin
          reg37 <= {reg35[(2'h3):(2'h3)]};
          reg38 <= wire26[(1'h0):(1'h0)];
        end
      reg39 <= ($signed($unsigned(reg36[(4'ha):(4'h8)])) ?
          $unsigned($signed({reg32[(4'hb):(3'h5)]})) : (&$signed($unsigned(reg30))));
    end
endmodule
