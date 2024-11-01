module top
#(parameter param157 = ((~&(((!(8'ha5)) ? (7'h44) : ((8'ha4) ? (8'hab) : (8'ha7))) != (((8'hb2) << (8'hbd)) ? (8'hba) : (-(8'hab))))) ~^ {(8'hb9), (-(8'hb0))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire100;
  wire [(3'h4):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire155;
  assign y = {wire94,
                 wire4,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire100,
                 wire101,
                 wire155,
                 (1'h0)};
  assign wire4 = $signed($signed($signed((wire2 ?
                     $unsigned((8'hbe)) : $signed((8'hae))))));
  module5 #() modinst95 (wire94, clk, wire1, wire4, wire3, wire0, wire2);
  assign wire96 = $signed(wire3);
  assign wire97 = $signed(wire94[(1'h0):(1'h0)]);
  assign wire98 = (($unsigned((((8'ha5) + wire0) >>> wire0[(4'h8):(3'h4)])) ?
                          wire3 : $signed(wire3[(5'h11):(3'h6)])) ?
                      (wire1[(2'h3):(2'h2)] * (wire96[(2'h2):(1'h1)] ?
                          wire1[(4'hc):(3'h4)] : wire1)) : $signed(wire0[(3'h7):(2'h2)]));
  assign wire99 = $signed($unsigned(wire0));
  assign wire100 = (&$unsigned(($unsigned($unsigned(wire97)) ?
                       wire94 : wire97)));
  assign wire101 = wire1[(4'hd):(1'h0)];
  module102 #() modinst156 (wire155, clk, wire94, wire3, wire100, wire2, wire98);
endmodule

module module102
#(parameter param154 = ({{(^((8'ha3) << (8'hbc))), (((8'ha8) ? (8'ha4) : (8'hab)) < ((8'hb4) ? (8'hbc) : (8'hb6)))}, (8'ha2)} == (({(^~(8'ha3)), {(8'h9d)}} ? {((7'h43) | (8'hab))} : (7'h40)) ? (^~{(-(8'hb4)), (~&(8'ha0))}) : (~|{{(8'ha8)}, ((8'ha7) ? (8'hb1) : (7'h44))}))))
(y, clk, wire103, wire104, wire105, wire106, wire107);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire103;
  input wire signed [(2'h3):(1'h0)] wire104;
  input wire signed [(3'h6):(1'h0)] wire105;
  input wire signed [(5'h15):(1'h0)] wire106;
  input wire [(3'h6):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire151;
  wire signed [(4'h8):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire147;
  reg signed [(4'h9):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire121,
                 wire122,
                 wire123,
                 wire147,
                 reg153,
                 reg152,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire108 = wire104[(1'h1):(1'h1)];
  assign wire109 = (|{wire105});
  assign wire110 = $unsigned($signed((!wire107)));
  assign wire111 = wire106[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg112 <= $signed((8'had));
      if ({wire103[(4'hb):(2'h2)]})
        begin
          if ((~^$signed(wire111)))
            begin
              reg113 <= $signed((~&{((!reg112) ^~ wire103)}));
              reg114 <= $unsigned({(~&wire103)});
              reg115 <= ((($unsigned($unsigned(wire106)) ?
                  wire103 : reg112[(2'h2):(1'h1)]) + reg113[(2'h3):(1'h1)]) ^ (~&$unsigned(($unsigned((8'had)) > reg113))));
            end
          else
            begin
              reg113 <= (({reg114[(1'h0):(1'h0)]} ?
                      wire107 : {reg114[(1'h0):(1'h0)]}) ?
                  wire106 : wire105[(2'h2):(1'h1)]);
            end
          reg116 <= $signed(($signed($unsigned((^~wire108))) ?
              wire109 : (~&$signed(reg112[(3'h4):(2'h2)]))));
          reg117 <= wire111[(4'h8):(1'h0)];
          reg118 <= ($signed(wire105) | reg116[(4'hf):(4'he)]);
        end
      else
        begin
          reg113 <= (&reg116[(4'he):(4'hc)]);
          if ((&wire109[(2'h3):(1'h1)]))
            begin
              reg114 <= ((wire106[(4'hc):(2'h3)] >>> wire111) >>> (($unsigned((reg115 == (8'hbd))) ^ reg116[(4'hf):(2'h3)]) >= $signed(wire111[(2'h3):(1'h1)])));
              reg115 <= wire104;
              reg116 <= reg115[(3'h4):(1'h1)];
              reg117 <= wire109;
            end
          else
            begin
              reg114 <= $unsigned({reg115, {wire106}});
            end
        end
      reg119 <= ((8'h9c) != (($unsigned(wire107[(3'h4):(1'h0)]) ?
          $unsigned((wire107 <<< (8'ha5))) : (((8'hb0) ?
              wire109 : wire110) < {wire111})) << ($unsigned(wire110[(1'h1):(1'h0)]) & $signed($unsigned(wire108)))));
      reg120 <= $signed((~|{(!(wire103 < reg119)), (~((8'ha9) & reg118))}));
    end
  assign wire121 = (((((reg112 ? wire106 : reg117) ?
                           wire105 : (reg113 < reg120)) == $unsigned((wire109 << wire104))) >>> ((&{reg117,
                           wire111}) <<< wire108)) ?
                       (wire103 ?
                           (8'hb8) : (8'ha5)) : $unsigned($unsigned($signed($signed(reg113)))));
  assign wire122 = ($unsigned(($unsigned($unsigned(wire121)) ~^ $signed({reg113,
                       wire121}))) << $signed(((8'hac) | (wire121 * $signed(wire121)))));
  assign wire123 = $signed(($signed({(wire103 ^ wire109)}) ?
                       (-{$signed((7'h40)),
                           $signed((8'h9f))}) : $unsigned(reg119)));
  module124 #() modinst148 (.wire129(wire106), .wire125(wire123), .wire127(wire121), .wire126(reg114), .wire128(reg120), .y(wire147), .clk(clk));
  assign wire149 = (~{(((reg113 < wire110) + (8'hbd)) ?
                           wire122 : (-$signed((8'hae))))});
  assign wire150 = wire107[(2'h2):(1'h0)];
  assign wire151 = $unsigned((-{wire106[(4'hc):(3'h6)], $signed(wire103)}));
  always
    @(posedge clk) begin
      reg152 <= $unsigned(reg115);
      reg153 <= reg113[(3'h7):(3'h5)];
    end
endmodule

module module5
#(parameter param93 = (8'hb5))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire90;
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  assign y = {wire92,
                 wire44,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire90,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 (1'h0)};
  assign wire11 = {wire7[(4'he):(4'hd)]};
  assign wire12 = $signed((wire10[(4'h8):(3'h7)] ^~ $unsigned(wire7)));
  assign wire13 = wire11[(3'h5):(3'h4)];
  assign wire14 = wire11[(1'h1):(1'h0)];
  module15 #() modinst45 (wire44, clk, wire9, wire8, wire7, wire10, wire11);
  always
    @(posedge clk) begin
      reg46 <= wire13;
    end
  always
    @(posedge clk) begin
      reg47 <= $signed($signed((|{(&wire9)})));
      reg48 <= wire9[(2'h2):(1'h1)];
      if ($signed($unsigned((wire44[(2'h2):(2'h2)] != $signed((wire44 == wire6))))))
        begin
          reg49 <= wire10;
          reg50 <= ({{($unsigned(wire13) + $signed(wire12)),
                  (!(7'h40))}} * {wire10[(3'h6):(2'h3)], wire9});
          reg51 <= {$signed((7'h40)),
              ((&{(wire6 ? reg50 : wire9)}) ?
                  $unsigned($unsigned(wire13[(4'hb):(3'h5)])) : reg50[(2'h3):(1'h0)])};
          reg52 <= reg48[(3'h5):(1'h0)];
        end
      else
        begin
          reg49 <= wire7;
          reg50 <= {((($unsigned(wire44) ?
                      wire11[(3'h4):(1'h1)] : reg46[(1'h1):(1'h0)]) || (!$signed(wire8))) ?
                  $unsigned((&$unsigned(wire13))) : (+(reg49 ?
                      (^wire14) : (wire11 ? wire10 : wire9))))};
        end
      reg53 <= $signed($unsigned($unsigned((8'ha1))));
    end
  assign wire54 = wire11;
  assign wire55 = {$signed({$unsigned({(8'ha6), (8'hbe)})})};
  assign wire56 = wire11;
  assign wire57 = $unsigned((~&$signed(($unsigned(wire13) ?
                      (reg52 ~^ reg49) : (&(8'haa))))));
  assign wire58 = (($signed(wire54) * (-$unsigned((reg49 ?
                          wire55 : (8'hae))))) ?
                      (&(-(!(reg52 ?
                          reg46 : reg48)))) : ($signed($unsigned($signed((8'hb1)))) ?
                          wire6[(4'hd):(4'ha)] : (reg48 ?
                              wire55[(1'h1):(1'h1)] : (!{reg51, reg51}))));
  assign wire59 = {($signed((8'had)) ?
                          ((~^(wire8 != (8'h9c))) || (((8'hb2) > wire9) ?
                              (+reg53) : $unsigned(wire57))) : $signed(reg53))};
  module60 #() modinst91 (.wire62(reg47), .clk(clk), .wire61(wire8), .y(wire90), .wire64(wire59), .wire63(wire7));
  assign wire92 = {($signed(({reg49,
                          wire7} >> wire59[(2'h3):(2'h3)])) ^ $unsigned((reg48[(4'h9):(3'h5)] ?
                          (wire55 ? reg51 : reg46) : $signed(reg47)))),
                      wire8[(2'h3):(1'h1)]};
endmodule

module module60
#(parameter param89 = ((((((8'hac) && (8'hac)) || ((8'ha5) ~^ (8'hba))) ? ((&(8'hbc)) ? (&(8'h9f)) : (+(8'ha8))) : (8'hb3)) << ({((8'hb6) != (8'hbf))} ? (((8'hb4) ? (8'h9f) : (8'hb6)) ? (^(8'hb0)) : ((8'hb4) ? (8'hb4) : (8'hab))) : ((~^(8'h9c)) ? (8'h9f) : (|(8'ha8))))) <<< (8'ha2)))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire63;
  input wire signed [(2'h3):(1'h0)] wire62;
  input wire signed [(5'h14):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire75,
                 wire74,
                 wire73,
                 wire66,
                 wire65,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire65 = $signed(wire62[(1'h0):(1'h0)]);
  assign wire66 = (|wire64);
  always
    @(posedge clk) begin
      reg67 <= $unsigned(wire61[(1'h0):(1'h0)]);
      reg68 <= reg67[(4'hc):(4'hb)];
      reg69 <= $unsigned(wire62[(2'h3):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg70 <= ($unsigned($unsigned((~|(~^wire61)))) ?
          (~|$signed(reg67)) : (!wire61[(4'hc):(3'h7)]));
      reg71 <= wire62;
      reg72 <= {($signed(reg69) & $unsigned(((wire63 ? reg70 : (8'ha2)) ?
              $unsigned(wire61) : (reg67 ^ wire66)))),
          wire65};
    end
  assign wire73 = $unsigned(reg70);
  assign wire74 = $signed(wire62[(2'h3):(2'h3)]);
  assign wire75 = ((^~reg71[(3'h7):(1'h1)]) + (8'h9c));
  always
    @(posedge clk) begin
      if ({{$unsigned($signed((wire61 | (8'hac)))),
              $signed((-$unsigned(wire62)))},
          (8'h9d)})
        begin
          if ($signed(((~^reg72) ?
              wire66 : {$signed({(8'h9d)}), $unsigned($signed(reg69))})))
            begin
              reg76 <= (((($signed(wire64) ?
                          (wire66 ? wire62 : reg71) : $signed((8'hba))) ?
                      (^~$unsigned(reg72)) : ((wire66 ^ wire62) ?
                          (reg67 ^~ wire61) : (&wire61))) ?
                  (wire66[(1'h0):(1'h0)] << $signed($unsigned(reg68))) : (($signed(wire74) + wire65) ^ wire74[(1'h1):(1'h1)])) >>> (~^wire63[(3'h4):(2'h2)]));
            end
          else
            begin
              reg76 <= wire62[(1'h0):(1'h0)];
            end
          reg77 <= wire62[(1'h0):(1'h0)];
          reg78 <= (-$signed((|$unsigned((reg67 ? wire63 : reg71)))));
          if ((({wire64[(3'h5):(2'h2)]} * wire65) ^ wire61[(4'hb):(1'h1)]))
            begin
              reg79 <= $unsigned((!$unsigned(reg70)));
              reg80 <= reg77[(4'ha):(2'h3)];
              reg81 <= {$signed({$unsigned((wire63 != reg77))})};
              reg82 <= reg78[(4'h9):(2'h2)];
              reg83 <= (8'hb1);
            end
          else
            begin
              reg79 <= $signed({{reg67}});
            end
        end
      else
        begin
          reg76 <= (reg76[(4'hd):(4'h8)] ~^ (^$unsigned(wire64)));
          reg77 <= $unsigned(wire63[(5'h10):(4'ha)]);
        end
      reg84 <= wire63;
      reg85 <= (~^((((reg68 ? reg82 : reg70) ?
          (|(8'hbf)) : {reg71}) && {(wire61 * reg71)}) ~^ reg83[(4'h8):(1'h0)]));
    end
  assign wire86 = wire74[(2'h3):(1'h1)];
  assign wire87 = {$unsigned(($signed($unsigned(wire65)) ?
                          (^~wire63[(4'ha):(3'h4)]) : $unsigned($signed(reg77)))),
                      $unsigned(reg83)};
  assign wire88 = ($unsigned((~|$unsigned((~&reg83)))) ?
                      $unsigned((wire61[(1'h1):(1'h1)] & reg71)) : ((($unsigned(reg70) <<< reg67[(4'h9):(3'h7)]) && $signed(wire74)) ^~ {$unsigned((&wire63)),
                          (~wire63[(4'h8):(3'h6)])}));
endmodule

module module15
#(parameter param42 = (&(((((8'had) <<< (7'h43)) ? {(8'hb9)} : {(8'hb4), (8'hab)}) ? (-(!(8'h9d))) : (((7'h42) ? (8'h9e) : (8'hbc)) ^ ((8'hb2) != (8'hae)))) ? (8'ha9) : (({(8'h9f)} >> ((8'hb8) ? (8'hbf) : (8'ha9))) ? (((8'hac) && (8'hab)) ~^ ((8'h9e) ? (8'ha6) : (8'hbb))) : (((8'had) && (8'hb7)) ? ((8'haf) ? (8'ha3) : (8'hb6)) : ((7'h40) ^ (8'hbf)))))), 
parameter param43 = ({{((param42 ? param42 : param42) || (param42 ? param42 : param42))}} > {((^~(param42 ? (8'haf) : param42)) ? ({(8'haa)} ? param42 : (8'hb4)) : ((param42 ? param42 : param42) << param42))}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire21;
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
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
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = (+$unsigned($unsigned((((8'hb2) ? (8'hb1) : wire16) ?
                      (wire18 ? wire18 : wire17) : wire17[(2'h2):(1'h0)]))));
  assign wire22 = (^wire18);
  assign wire23 = (($signed($unsigned((wire16 ?
                          wire18 : wire22))) == ($signed((8'h9e)) ?
                          wire20[(4'hd):(3'h6)] : wire20[(4'hb):(4'h8)])) ?
                      (($unsigned(wire16) ?
                          (wire22 ?
                              $signed(wire18) : (wire18 ?
                                  wire20 : wire22)) : wire21) | {(|wire22),
                          $unsigned(wire22[(1'h0):(1'h0)])}) : (wire17[(1'h0):(1'h0)] | ($unsigned(wire18[(3'h7):(3'h5)]) ?
                          $signed(wire22) : wire22[(1'h0):(1'h0)])));
  assign wire24 = wire18;
  assign wire25 = (~$signed((($signed(wire18) ?
                          $signed(wire18) : wire23[(1'h0):(1'h0)]) ?
                      (8'ha6) : (wire20[(3'h5):(2'h2)] >>> (wire21 && wire24)))));
  assign wire26 = (wire21[(4'hb):(3'h5)] || $signed((&wire19[(5'h10):(4'hb)])));
  assign wire27 = $unsigned((8'hb1));
  assign wire28 = $signed(wire24);
  assign wire29 = (($unsigned(((wire26 << wire25) ? {wire23} : wire27)) ?
                          (wire23 ?
                              {wire26,
                                  wire26} : $unsigned((wire23 * wire18))) : (((wire21 ?
                              wire19 : wire24) && $signed(wire20)) || wire28)) ?
                      $unsigned(($signed(((8'haa) ?
                          wire26 : wire24)) ^~ (8'hb1))) : wire20[(4'hd):(2'h2)]);
  assign wire30 = wire29[(3'h4):(3'h4)];
  assign wire31 = (wire18 + (wire25 ?
                      (^~(~&$unsigned(wire21))) : $signed($signed((wire25 << wire30)))));
  assign wire32 = $signed((((8'haa) <<< $unsigned($signed((8'h9e)))) * (~|wire19)));
  assign wire33 = wire17;
  assign wire34 = $signed((!($unsigned(wire16[(3'h6):(3'h5)]) ?
                      ({wire30, wire28} ?
                          (wire27 >= wire20) : (&wire26)) : {(^~wire33)})));
  assign wire35 = (-$unsigned({($signed(wire33) ? (7'h42) : $unsigned(wire22)),
                      {(~|wire23), (wire25 ? wire16 : wire21)}}));
  assign wire36 = {wire33};
  assign wire37 = {wire32[(4'ha):(4'h8)]};
  assign wire38 = (wire33[(2'h2):(2'h2)] ?
                      $unsigned(wire23) : ((-wire27[(2'h3):(1'h1)]) ?
                          $signed(wire29) : wire32));
  assign wire39 = (8'hb3);
  assign wire40 = (($signed($signed({wire35})) <= (~^(((8'ha2) ~^ wire34) ?
                          wire38 : (^~(8'hb1))))) ?
                      (($unsigned((wire23 ? wire39 : wire17)) << (~|(wire27 ?
                              wire37 : wire31))) ?
                          $unsigned((&(wire27 ?
                              wire37 : (8'had)))) : wire21[(4'hc):(3'h4)]) : wire27);
  assign wire41 = wire29[(3'h5):(2'h3)];
endmodule

module module124  (y, clk, wire129, wire128, wire127, wire126, wire125);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire129;
  input wire signed [(2'h2):(1'h0)] wire128;
  input wire signed [(3'h4):(1'h0)] wire127;
  input wire signed [(2'h2):(1'h0)] wire126;
  input wire signed [(5'h14):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire146;
  wire [(3'h5):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire130;
  reg signed [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire132,
                 wire131,
                 wire130,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire130 = wire126;
  assign wire131 = wire129;
  assign wire132 = wire126;
  always
    @(posedge clk) begin
      reg133 <= $signed(((((~^wire132) ?
          $signed(wire130) : (wire125 ?
              wire130 : wire131)) && (~|{(8'ha4)})) << wire129[(4'hc):(4'h8)]));
      reg134 <= wire126[(1'h1):(1'h1)];
      reg135 <= ((~{wire132, wire128}) ?
          wire126[(1'h1):(1'h0)] : $signed(wire131[(3'h5):(1'h1)]));
      reg136 <= $unsigned(reg134[(2'h3):(2'h3)]);
      if (wire126[(1'h1):(1'h0)])
        begin
          if ($signed($signed(wire126)))
            begin
              reg137 <= {(({(wire131 || (8'h9f))} ?
                          (wire128 > $signed(reg136)) : ($signed(reg136) * ((8'hb2) ~^ reg134))) ?
                      wire126[(1'h1):(1'h1)] : wire128),
                  wire126};
              reg138 <= (!wire127);
              reg139 <= (8'h9f);
              reg140 <= (wire126 ?
                  (&(~^$unsigned(wire125))) : $unsigned(wire131[(1'h1):(1'h0)]));
              reg141 <= ((($unsigned($signed(wire125)) >> $unsigned($unsigned(wire125))) ?
                      reg140 : (reg136 != $unsigned({(8'ha0), wire132}))) ?
                  {reg135[(1'h1):(1'h0)]} : wire129);
            end
          else
            begin
              reg137 <= $signed($signed(($unsigned($signed(wire131)) >> $unsigned((wire125 ?
                  reg138 : wire126)))));
              reg138 <= $signed(((|((&wire127) ?
                  (wire127 - (8'hba)) : $unsigned(reg137))) <= (+wire132)));
              reg139 <= (^~{(8'h9e), $signed(wire125)});
            end
          reg142 <= $signed($unsigned((wire126 >= {wire128, (8'ha4)})));
          reg143 <= (((reg140 * reg137) ?
              $unsigned((wire129[(5'h14):(1'h0)] + $unsigned(reg139))) : (~&($unsigned(wire130) || (~&reg137)))) ^~ {{$unsigned((reg135 - (8'hbe)))}});
          reg144 <= $unsigned(wire125[(2'h2):(1'h1)]);
        end
      else
        begin
          reg137 <= (^~$unsigned(({$unsigned(reg135), reg141} ?
              $signed(wire127[(1'h1):(1'h0)]) : reg135[(2'h3):(2'h2)])));
          reg138 <= wire127[(1'h0):(1'h0)];
        end
    end
  assign wire145 = reg142[(2'h2):(1'h0)];
  assign wire146 = $unsigned(($signed(($signed(wire126) ?
                       $signed(wire127) : ((7'h40) ~^ reg140))) << wire126));
endmodule
