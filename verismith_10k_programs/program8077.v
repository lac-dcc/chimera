module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire166;
  wire signed [(4'h9):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire159;
  wire signed [(3'h7):(1'h0)] wire158;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire156;
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire160,
                 wire159,
                 wire158,
                 wire57,
                 wire5,
                 wire4,
                 wire59,
                 wire156,
                 reg167,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 (1'h0)};
  assign wire4 = {wire2[(4'hc):(3'h5)]};
  assign wire5 = $unsigned((~^(~&$unsigned($unsigned(wire2)))));
  module6 #() modinst58 (wire57, clk, wire3, wire2, wire4, wire5, wire0);
  assign wire59 = $unsigned($signed(wire57));
  module60 #() modinst157 (wire156, clk, wire4, wire59, wire2, wire0, wire57);
  assign wire158 = ({($signed((+(8'hae))) ? wire59 : (~&wire59[(2'h3):(2'h2)])),
                           ($unsigned((wire3 ? wire4 : wire0)) >= ((wire3 ?
                               wire59 : wire156) * $unsigned((8'hb8))))} ?
                       (&$signed($unsigned($signed(wire5)))) : {$unsigned(wire57),
                           (~&wire156)});
  assign wire159 = (($unsigned($signed(wire4)) ?
                           wire156[(3'h6):(1'h0)] : (!((^(7'h43)) ?
                               $signed(wire5) : {wire1}))) ?
                       $signed($unsigned($signed($signed(wire156)))) : (8'h9c));
  assign wire160 = ($unsigned($signed($unsigned(((7'h44) ?
                       wire59 : wire1)))) <= (((wire158[(3'h6):(3'h4)] ?
                       (8'hbf) : $signed(wire1)) - ({wire3} ?
                       $unsigned(wire4) : {wire158,
                           wire57})) >> (~^(wire57 >>> $signed(wire57)))));
  always
    @(posedge clk) begin
      reg161 <= ({$signed(($unsigned(wire4) ?
              $signed(wire0) : {wire2, (8'ha9)}))} ~^ (!wire1));
      reg162 <= {((((-wire0) == wire2[(5'h10):(1'h1)]) ?
              {wire57} : wire160[(4'ha):(4'h8)]) && {wire156[(1'h1):(1'h1)],
              wire5[(2'h2):(2'h2)]})};
      reg163 <= {{wire4[(3'h7):(3'h5)],
              ($signed(((8'hb9) * (8'ha7))) < reg162[(2'h2):(1'h1)])}};
      reg164 <= $signed(wire4[(2'h3):(1'h0)]);
    end
  assign wire165 = (8'hbe);
  assign wire166 = wire160[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg167 <= $unsigned((reg163 ? (!$signed($unsigned(reg163))) : wire5));
    end
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire65;
  input wire signed [(4'h8):(1'h0)] wire64;
  input wire signed [(5'h10):(1'h0)] wire63;
  input wire [(3'h6):(1'h0)] wire62;
  input wire signed [(4'hc):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire155;
  wire [(5'h10):(1'h0)] wire154;
  wire [(5'h15):(1'h0)] wire153;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire151;
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire101,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire103,
                 wire151,
                 (1'h0)};
  assign wire66 = (~^(~^$signed(wire65)));
  assign wire67 = wire66[(3'h5):(1'h0)];
  assign wire68 = $unsigned((({(^(8'had))} ?
                          (wire67 ?
                              $signed(wire64) : $signed(wire66)) : (wire64 - (~wire62))) ?
                      wire67[(3'h5):(2'h3)] : ((+(wire66 <= wire65)) >= $signed((wire62 || (8'hb0))))));
  assign wire69 = (wire65 >>> (~|wire62[(2'h2):(2'h2)]));
  assign wire70 = $signed(wire65[(2'h3):(2'h3)]);
  module71 #() modinst102 (wire101, clk, wire68, wire61, wire64, wire66, wire63);
  assign wire103 = $unsigned(({((wire101 != wire70) ?
                               (wire63 <= wire69) : $unsigned(wire101))} ?
                       (&wire63[(4'ha):(4'ha)]) : (((wire61 & wire101) ?
                               ((8'h9f) && wire65) : (wire62 ?
                                   wire70 : (8'h9c))) ?
                           (wire65 ?
                               $signed(wire65) : $unsigned(wire66)) : wire68[(4'hd):(4'ha)])));
  module104 #() modinst152 (wire151, clk, wire63, wire61, wire69, wire66, wire64);
  assign wire153 = $signed($unsigned(($signed($unsigned(wire66)) & (|{(8'hae)}))));
  assign wire154 = (^~(&(wire63 ?
                       $unsigned((&wire70)) : wire66[(5'h10):(3'h6)])));
  assign wire155 = $signed({$unsigned((((8'hbf) >= wire67) ?
                           wire70 : wire151))});
endmodule

module module6
#(parameter param56 = {(8'ha3)})
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire52;
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  assign y = {wire54, wire12, wire13, wire14, wire52, reg55, (1'h0)};
  assign wire12 = {((-$unsigned((-wire11))) ? wire10 : (~wire11))};
  assign wire13 = $unsigned(wire12[(1'h0):(1'h0)]);
  assign wire14 = wire8[(3'h6):(2'h3)];
  module15 #() modinst53 (wire52, clk, wire12, wire9, wire7, wire14, wire8);
  assign wire54 = $signed($signed((^((wire8 ? wire11 : wire7) & (8'ha1)))));
  always
    @(posedge clk) begin
      reg55 <= wire14[(1'h1):(1'h1)];
    end
endmodule

module module15
#(parameter param51 = {((+(8'ha6)) >> ({(~|(8'haf)), (~(8'ha9))} ~^ {((8'ha7) ? (8'haa) : (8'ha8))}))})
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire21;
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire25,
                 wire21,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = (^$unsigned(wire20[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire21[(3'h6):(3'h4)])
        begin
          reg22 <= (({(wire20 >= (wire18 && (8'ha8))),
                  wire21} == $unsigned((!(!(7'h42))))) ?
              wire19[(2'h3):(1'h1)] : (wire19[(2'h3):(2'h3)] ?
                  $unsigned(((|wire19) ?
                      wire16[(3'h4):(1'h0)] : {wire21})) : ((wire19 > $signed(wire18)) ?
                      wire21[(3'h5):(3'h4)] : $signed((|wire19)))));
          reg23 <= ((!wire19[(2'h2):(1'h1)]) ?
              (&($signed($signed(wire20)) ?
                  (wire16 ?
                      {(8'hbf)} : (reg22 ?
                          wire19 : wire20)) : {(wire16 & wire18)})) : ((^((wire19 ?
                      wire18 : (8'hb6)) ?
                  wire19 : reg22)) * $signed($unsigned((wire19 ?
                  reg22 : reg22)))));
          reg24 <= (~wire20);
        end
      else
        begin
          reg22 <= $unsigned($unsigned($unsigned(((wire18 ~^ wire18) && $signed(wire16)))));
          reg23 <= (|($unsigned(wire19) ?
              $signed($signed((~|reg22))) : (~&((reg22 && reg23) ?
                  (8'ha6) : (wire16 >= wire19)))));
          reg24 <= $signed($signed(wire17[(3'h4):(3'h4)]));
        end
    end
  assign wire25 = $signed((^~$signed((-(wire18 ? reg23 : wire19)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire16))
        begin
          reg26 <= reg24;
          reg27 <= reg26[(1'h1):(1'h1)];
        end
      else
        begin
          reg26 <= wire21[(1'h0):(1'h0)];
        end
      if (wire16[(3'h6):(2'h2)])
        begin
          reg28 <= reg22;
          reg29 <= reg23[(1'h1):(1'h0)];
          reg30 <= (^$unsigned((|((wire19 ? reg24 : reg23) ?
              (reg29 ? wire25 : reg27) : (reg26 ? (8'ha0) : wire19)))));
          if ($unsigned(((^~(7'h41)) != reg29[(4'hd):(3'h6)])))
            begin
              reg31 <= {(8'hb3), (!$signed($signed(wire17[(1'h0):(1'h0)])))};
              reg32 <= {(8'ha2)};
              reg33 <= {(8'hbd), (8'ha8)};
            end
          else
            begin
              reg31 <= reg30[(3'h6):(3'h4)];
            end
          reg34 <= $unsigned(reg23);
        end
      else
        begin
          reg28 <= $unsigned($signed($signed(reg26[(2'h3):(2'h2)])));
          reg29 <= ((!$unsigned(wire19[(1'h1):(1'h1)])) == (~^(~|reg23)));
          reg30 <= ((~|wire17) - reg30[(2'h2):(1'h1)]);
          reg31 <= (($signed({$signed((8'hb3))}) ?
              (&reg29[(4'hb):(3'h6)]) : $unsigned({{reg31,
                      reg22}})) <= {$signed($unsigned(wire21[(1'h0):(1'h0)]))});
        end
      reg35 <= ($signed((({(8'haa)} >= reg29) != $signed(((8'ha5) >> reg28)))) ?
          wire21[(3'h5):(1'h0)] : $unsigned((reg29 <= $signed((|reg27)))));
      reg36 <= $unsigned((reg35 == ($signed($signed(reg27)) || {reg35[(1'h0):(1'h0)]})));
      if ((((({(7'h44)} ? (7'h44) : (-wire19)) ^~ (^{reg30,
              (8'h9c)})) <= $signed(((reg24 ^ reg28) ?
              {reg22, reg31} : (reg34 ? wire17 : wire25)))) ?
          ((~($signed(reg27) ? (8'hb4) : reg28)) && (8'h9f)) : reg35))
        begin
          reg37 <= ((reg34 ?
              reg35 : $unsigned($unsigned(((8'hba) ?
                  reg31 : wire20)))) >= ((8'h9d) > $signed(($unsigned(wire21) || wire21))));
        end
      else
        begin
          reg37 <= (^($unsigned((~|$unsigned(wire17))) ?
              (reg26 != ($signed(wire20) ?
                  (wire18 ?
                      reg26 : wire25) : (~|wire18))) : reg33[(4'h8):(2'h2)]));
          reg38 <= (8'hb9);
          if (wire20)
            begin
              reg39 <= $signed((~&$unsigned(reg34)));
              reg40 <= (8'h9f);
            end
          else
            begin
              reg39 <= (reg30 ?
                  (reg37 < ((~(8'haf)) != ((!reg27) <<< ((8'h9c) > reg38)))) : $unsigned($signed((reg23 != (wire21 ~^ reg22)))));
            end
          if ((-$signed((($signed(reg39) < $unsigned(reg26)) ~^ ($signed(reg33) ~^ (8'hb7))))))
            begin
              reg41 <= reg35[(4'h8):(3'h5)];
            end
          else
            begin
              reg41 <= (&{$unsigned((^~$signed(wire18))),
                  (wire16[(3'h5):(3'h4)] ?
                      (8'hb0) : $unsigned($unsigned(reg31)))});
            end
          reg42 <= reg37[(3'h6):(3'h4)];
        end
    end
  assign wire43 = (-(reg24[(3'h5):(2'h3)] + $unsigned(reg28)));
  assign wire44 = wire43;
  assign wire45 = $signed({(^~{(reg40 ? wire19 : reg38), $unsigned(reg29)})});
  assign wire46 = (reg30 ?
                      (wire20 & ((reg27 >> reg32) ?
                          wire19[(1'h0):(1'h0)] : wire43[(3'h5):(3'h4)])) : {(+(&{wire16,
                              wire20}))});
  assign wire47 = (|(8'h9d));
  assign wire48 = $signed((~|$unsigned($signed(reg27[(1'h0):(1'h0)]))));
  assign wire49 = $signed({$signed((8'hac))});
  assign wire50 = (wire44[(4'h9):(2'h2)] != wire45);
endmodule

module module104
#(parameter param150 = ((((((8'hb0) ? (8'ha6) : (8'h9d)) | (|(8'hb0))) ? (~&{(8'hb4), (8'had)}) : ((-(8'hb5)) ? ((8'ha2) ? (8'h9f) : (8'haa)) : ((8'ha6) ? (8'hb5) : (8'hb6)))) > ((~^((8'ha6) ? (8'ha0) : (8'ha5))) | (&(-(8'ha3))))) ? (!({((8'hb6) ? (8'hb9) : (8'hb9)), (~|(8'hac))} ? (~^{(8'hbf)}) : (|((7'h41) || (8'hb4))))) : (&(((~(7'h41)) != {(7'h42)}) ? (~((7'h40) ? (8'ha3) : (8'ha3))) : {{(8'hb7), (8'hae)}, ((8'ha3) ? (8'hba) : (8'h9c))}))))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire109;
  input wire [(4'hc):(1'h0)] wire108;
  input wire signed [(4'h9):(1'h0)] wire107;
  input wire [(5'h12):(1'h0)] wire106;
  input wire signed [(4'h8):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire149;
  wire signed [(3'h4):(1'h0)] wire148;
  wire signed [(5'h13):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire145;
  wire [(3'h5):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire131;
  wire signed [(5'h15):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire123;
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(4'h9):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire132,
                 wire131,
                 wire130,
                 wire126,
                 wire125,
                 wire123,
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
                 reg129,
                 reg128,
                 reg127,
                 reg124,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire108[(4'h8):(3'h5)])
        begin
          reg110 <= (($signed({(wire108 ? wire108 : wire106)}) ?
                  $signed($signed((wire107 ?
                      (8'ha3) : wire107))) : ($signed(wire107[(1'h1):(1'h0)]) ?
                      wire107 : (wire105 * (wire105 <= wire106)))) ?
              (wire107[(2'h3):(1'h0)] | ({(wire106 ? wire109 : wire108),
                      (~&wire107)} ?
                  ($signed(wire106) ?
                      (wire107 ?
                          wire106 : wire108) : wire107) : ($signed(wire108) + (8'ha7)))) : (8'ha9));
          if (((^~wire109[(4'hf):(3'h6)]) ?
              ({(|(~|wire106))} ?
                  $signed(reg110[(2'h2):(1'h1)]) : wire106) : (~|$signed(wire107[(2'h2):(1'h1)]))))
            begin
              reg111 <= {reg110};
            end
          else
            begin
              reg111 <= (($signed({$unsigned((8'hb9))}) ?
                  $signed($signed(((8'hb7) ? wire108 : wire106))) : {((wire108 ?
                              wire108 : wire106) ?
                          wire105 : wire105)}) * ($signed(wire106[(4'hf):(4'ha)]) ?
                  $signed(wire106) : ($unsigned((reg111 ?
                      wire106 : reg110)) | wire109)));
              reg112 <= (8'hac);
              reg113 <= reg111;
            end
          reg114 <= wire106[(5'h11):(2'h3)];
        end
      else
        begin
          reg110 <= ($signed(wire109[(4'h8):(3'h4)]) ^ $unsigned((~|wire107[(1'h0):(1'h0)])));
          if (reg114[(3'h6):(2'h2)])
            begin
              reg111 <= reg111[(4'hb):(2'h2)];
            end
          else
            begin
              reg111 <= $unsigned($unsigned($unsigned((^(~reg111)))));
              reg112 <= $unsigned($signed(wire107[(3'h7):(1'h1)]));
              reg113 <= {reg112, wire105};
            end
          reg114 <= (+wire107);
          reg115 <= (($unsigned((wire107[(4'h9):(1'h0)] ?
                      wire109 : $signed(wire107))) ?
                  (7'h41) : $signed((8'hb4))) ?
              ((wire106[(4'h8):(1'h1)] ? wire107 : reg112[(4'he):(3'h5)]) ?
                  (~|(-(wire106 ? reg110 : wire108))) : $signed(((+wire107) ?
                      wire106 : (wire109 ? reg114 : wire105)))) : reg113);
          reg116 <= $signed((((~|(wire108 || reg115)) >>> (~|(+wire108))) ~^ (+wire107[(2'h2):(1'h0)])));
        end
      reg117 <= $unsigned(($signed(((reg113 ? wire105 : reg113) ?
              (reg116 ? (8'haf) : (8'hab)) : {wire108, reg112})) ?
          (~&$signed($signed(wire108))) : ((reg116 ?
              reg116[(3'h7):(3'h6)] : {reg111}) << (wire107 ?
              wire107 : $signed((8'hba))))));
      reg118 <= wire108;
      reg119 <= {reg114[(4'h8):(1'h0)]};
    end
  always
    @(posedge clk) begin
      reg120 <= {reg111};
      reg121 <= $unsigned(reg112);
      reg122 <= ($unsigned((~reg116[(4'h9):(3'h7)])) >= ((reg119 != reg110[(1'h0):(1'h0)]) ^~ {((wire108 ^ reg111) ^~ ((8'hb7) ?
              reg112 : reg121)),
          $unsigned({(7'h42)})}));
    end
  assign wire123 = $signed(($unsigned(reg120) - {reg117[(4'hb):(1'h1)],
                       ((&reg113) > ((8'hb5) >>> reg116))}));
  always
    @(posedge clk) begin
      reg124 <= reg111[(1'h0):(1'h0)];
    end
  assign wire125 = (+(~^((&{(8'ha0)}) >>> ((~reg124) ?
                       (!wire123) : reg110[(3'h5):(2'h3)]))));
  assign wire126 = reg114;
  always
    @(posedge clk) begin
      reg127 <= wire109;
      reg128 <= wire126;
      reg129 <= (((&(&{reg112})) ?
          wire108 : reg110[(1'h0):(1'h0)]) == ({($unsigned(reg122) == wire123[(2'h3):(2'h2)]),
              ((&reg122) ? $unsigned(wire125) : (reg110 << reg118))} ?
          $signed($signed($signed((8'hb8)))) : $signed(($unsigned(reg128) ?
              reg115 : wire125))));
    end
  assign wire130 = wire109;
  assign wire131 = reg128;
  assign wire132 = $signed(reg113[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      reg133 <= (((^~wire108) ? reg118 : reg119) ?
          {reg128[(1'h1):(1'h0)]} : {(^{reg122}),
              ((~&$signed(reg129)) >>> (~|(8'h9c)))});
      reg134 <= (8'hb1);
      if (((~reg113) ^ ($signed($unsigned($unsigned(wire126))) ^~ (($signed(reg118) + reg124) >> $signed((reg119 == reg117))))))
        begin
          if (wire105[(1'h1):(1'h1)])
            begin
              reg135 <= $unsigned(reg121);
              reg136 <= (((^wire108[(1'h1):(1'h1)]) == (~reg135[(4'h9):(3'h6)])) != (~$signed((wire131 && (!wire109)))));
              reg137 <= (reg110[(1'h1):(1'h0)] ?
                  reg135 : $unsigned(((&(wire106 ? reg133 : reg133)) ?
                      $signed(reg129) : $unsigned((reg119 >= (8'ha2))))));
              reg138 <= $signed({{(^(reg128 ? reg115 : reg127))},
                  (^~({reg118} ? (reg124 ~^ wire108) : (^(8'hb3))))});
            end
          else
            begin
              reg135 <= ($signed((!($signed(wire123) ?
                      (~&reg128) : $signed(wire107)))) ?
                  (((wire132 ?
                          ((8'ha8) == reg116) : $unsigned(reg128)) == ((reg113 ?
                              wire105 : (8'ha8)) ?
                          (wire132 ? wire125 : reg135) : {reg133, reg111})) ?
                      reg134 : ({$unsigned(wire106)} ?
                          $signed($signed((7'h40))) : reg129)) : reg111[(5'h11):(4'hd)]);
              reg136 <= reg122;
              reg137 <= $signed(((-$signed((reg122 ? reg117 : reg128))) ?
                  ($unsigned((reg135 ? wire132 : wire105)) ?
                      reg121 : ($unsigned(reg129) ?
                          wire106[(3'h5):(1'h1)] : (wire123 <<< (8'hb9)))) : ((reg137 != reg128[(3'h5):(2'h2)]) <<< $signed(((8'hba) <<< (8'haa))))));
              reg138 <= reg138[(2'h3):(1'h1)];
              reg139 <= reg129[(4'h9):(2'h2)];
            end
          if (reg138)
            begin
              reg140 <= $unsigned($signed((($signed(wire105) ?
                  $signed(wire105) : (wire105 < reg110)) <= reg114)));
            end
          else
            begin
              reg140 <= (8'ha8);
              reg141 <= (+reg135);
              reg142 <= ((wire105[(3'h5):(1'h1)] * $signed(((&reg139) ?
                      reg135 : (^~wire126)))) ?
                  $signed(($unsigned((reg113 ? reg113 : wire106)) ?
                      reg111 : $signed($signed(wire132)))) : (wire105 & $unsigned($signed((8'hb4)))));
              reg143 <= $unsigned((!(reg140[(3'h4):(2'h2)] == (~|wire106))));
              reg144 <= ((+((reg117[(4'hc):(3'h5)] ? (^wire106) : wire125) ?
                      $signed($unsigned(reg142)) : reg124)) ?
                  $unsigned(reg128[(4'h8):(1'h1)]) : ($signed($unsigned(wire131)) < reg139[(2'h3):(2'h2)]));
            end
        end
      else
        begin
          reg135 <= $signed(((($unsigned(reg118) ^~ (!reg141)) & $unsigned($unsigned(wire105))) != (wire105 == $signed((reg118 ?
              wire125 : reg115)))));
          reg136 <= (($signed((reg138[(1'h0):(1'h0)] ?
                  {reg140, reg128} : $signed((8'haf)))) ?
              (8'hae) : (((reg140 || (8'h9d)) ?
                  reg128[(4'h8):(1'h0)] : $signed(reg143)) ^ reg112[(2'h3):(1'h0)])) ^ ((8'ha2) && (~&reg120)));
          reg137 <= (wire126[(3'h5):(2'h2)] >> $unsigned({$signed((wire105 ?
                  wire130 : (8'ha8)))}));
        end
    end
  assign wire145 = $signed(reg111);
  assign wire146 = wire108[(3'h7):(3'h7)];
  assign wire147 = reg138[(2'h3):(1'h1)];
  assign wire148 = ((reg112 << wire106) ?
                       ((&($unsigned(wire109) ?
                               $signed(reg122) : reg124[(4'ha):(4'h8)])) ?
                           ((~^(^reg112)) || (-(wire108 <<< reg127))) : $unsigned($signed(reg143[(1'h1):(1'h1)]))) : $unsigned(reg115));
  assign wire149 = $unsigned($unsigned({reg127[(4'hd):(2'h2)]}));
endmodule

module module71
#(parameter param99 = (((^~{(~|(8'had)), {(8'h9c)}}) & {(|((8'hba) >> (8'ha7))), (!(~|(8'hac)))}) ? ((((~(8'hbf)) << (|(8'hbb))) ? ({(8'hb0)} ? (-(8'hb5)) : {(8'hbf), (8'hb3)}) : ((-(8'ha1)) >>> (-(8'hae)))) ? {(^~((8'ha7) + (8'hae)))} : {((8'hb2) + ((8'hb2) ? (8'h9d) : (8'haf)))}) : ((+(((8'hb4) ? (8'ha6) : (8'ha9)) ~^ (|(8'h9e)))) ? {(((8'hbb) ? (7'h44) : (8'h9d)) == ((8'hbd) ? (8'ha0) : (8'hb5))), (+((8'ha3) & (8'ha2)))} : ((((8'hbf) ? (8'hb6) : (7'h42)) ? (^~(7'h42)) : (8'ha2)) >>> (((8'h9d) ? (8'had) : (8'hbf)) != (8'h9f))))), 
parameter param100 = (((&(param99 ? ((8'hac) ^ param99) : ((7'h42) <= param99))) - {{(param99 != param99), (param99 ? (7'h44) : param99)}, param99}) ? (~(({param99} ~^ (8'haf)) ? (^~param99) : {param99, (param99 <<< param99)})) : ({param99, (8'h9c)} | (|{(param99 >= (8'hb1))}))))
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire76;
  input wire signed [(3'h5):(1'h0)] wire75;
  input wire signed [(2'h3):(1'h0)] wire74;
  input wire signed [(3'h4):(1'h0)] wire73;
  input wire [(5'h10):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  assign y = {wire98,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
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
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire77 = ($signed($signed($unsigned({wire74,
                      wire76}))) && ($unsigned($unsigned($signed(wire74))) ?
                      ($unsigned($unsigned(wire75)) ?
                          $signed({wire74}) : (+((8'hae) ?
                              wire76 : wire75))) : (wire76 && $signed(wire75[(1'h1):(1'h0)]))));
  assign wire78 = ((($signed(wire75[(2'h2):(2'h2)]) >> {(wire77 & (8'ha0)),
                      $signed(wire77)}) <<< $unsigned(wire74[(2'h2):(1'h1)])) >= wire75);
  assign wire79 = (($signed($signed((wire74 ? wire76 : wire72))) <= wire75) ?
                      (((((7'h44) ? wire72 : wire76) ?
                                  (wire76 ?
                                      wire77 : wire72) : $unsigned(wire78)) ?
                              (wire78[(4'hd):(4'hb)] ?
                                  (wire77 ?
                                      wire74 : wire77) : $signed(wire75)) : wire74[(1'h1):(1'h1)]) ?
                          wire72[(4'h8):(4'h8)] : wire77[(3'h6):(2'h3)]) : {$unsigned({{wire75}})});
  assign wire80 = (wire76[(4'hc):(2'h2)] | ($unsigned(wire72) && $unsigned({wire74,
                      {wire74, wire79}})));
  always
    @(posedge clk) begin
      if (wire74)
        begin
          reg81 <= $unsigned($signed({(~^wire80)}));
          reg82 <= (+wire78);
          reg83 <= (|$unsigned($signed(((~wire78) < wire79))));
          reg84 <= (((^~((^wire77) ?
                      wire74[(1'h0):(1'h0)] : $unsigned(wire73))) ?
                  $signed(($unsigned(wire76) ?
                      ((8'haf) ? reg82 : wire78) : (wire77 ?
                          wire76 : wire74))) : (-reg82[(3'h4):(1'h0)])) ?
              $signed({wire79[(4'h9):(3'h4)]}) : $unsigned($signed(wire77[(5'h12):(3'h7)])));
          reg85 <= wire74;
        end
      else
        begin
          reg81 <= $unsigned(($signed(wire74) - ((wire76 && (8'ha9)) ?
              ((wire73 + reg83) != $signed(wire72)) : wire80)));
        end
      reg86 <= (!wire78);
      reg87 <= $unsigned({($unsigned({(8'ha8),
              wire80}) >> wire76[(4'h9):(3'h5)])});
      reg88 <= (&$signed($signed($unsigned(wire77[(2'h3):(1'h0)]))));
      if ((8'hb3))
        begin
          if ($signed(($signed(((-wire74) ?
              (&reg87) : wire73[(2'h2):(1'h1)])) >= (&$signed(reg83[(1'h0):(1'h0)])))))
            begin
              reg89 <= (($signed(wire80) ?
                  (reg88 && wire80[(5'h10):(2'h3)]) : reg86) >>> (wire75[(3'h5):(1'h0)] ?
                  ($unsigned((reg81 ? wire80 : wire78)) ?
                      $unsigned($unsigned(wire75)) : (wire73 ?
                          wire72[(3'h4):(2'h2)] : $unsigned(reg81))) : {(^reg83),
                      (~(+wire74))}));
            end
          else
            begin
              reg89 <= wire79[(2'h3):(1'h1)];
              reg90 <= $signed({(~|(((8'hbd) >> reg83) + $signed(reg85)))});
              reg91 <= $signed($unsigned($signed({reg81})));
              reg92 <= reg89[(3'h7):(2'h2)];
            end
          reg93 <= (8'hb0);
          if ((((((8'hb8) ? ((8'hae) ? reg87 : wire74) : $signed(wire72)) ?
                  $signed(reg86) : wire77) <= reg82[(2'h3):(1'h0)]) ?
              (wire73[(3'h4):(2'h2)] ?
                  (^~((~&reg82) ?
                      $signed(wire74) : (wire74 + wire79))) : $unsigned(($signed(wire78) ?
                      (|reg92) : {reg84}))) : (~&($unsigned({wire78,
                  wire80}) >>> (wire73 ? {wire74, reg84} : (-wire77))))))
            begin
              reg94 <= wire74;
              reg95 <= wire73[(2'h2):(1'h1)];
              reg96 <= {($signed((+reg93[(4'hf):(3'h4)])) ?
                      (~&wire72) : (^~$signed({reg83})))};
            end
          else
            begin
              reg94 <= (+$signed(((^~$signed(reg95)) ?
                  ($unsigned(reg84) ?
                      reg88[(4'hb):(4'h9)] : (reg93 >>> wire77)) : (reg96 ?
                      $signed(wire80) : wire72[(2'h2):(2'h2)]))));
              reg95 <= wire72;
              reg96 <= $signed((((~|$unsigned((8'ha3))) && $unsigned((reg82 ?
                  wire78 : reg86))) <<< $unsigned((8'ha8))));
              reg97 <= $unsigned($unsigned(($unsigned((!(8'hb5))) ~^ ((reg86 + reg82) < (reg84 ?
                  reg84 : (8'hae))))));
            end
        end
      else
        begin
          reg89 <= ((((((8'ha5) ? wire73 : wire77) ^~ $unsigned(reg91)) ?
                      (((8'hae) <<< (8'ha5)) ?
                          $unsigned(reg92) : {(8'hab), reg85}) : (!reg83)) ?
                  (-(((8'hbf) ? (8'hb9) : reg85) ?
                      $unsigned(reg97) : (reg85 ?
                          reg97 : reg96))) : (|(((8'hb1) ?
                      reg81 : reg87) || (wire79 != reg88)))) ?
              $signed((reg87 ?
                  $signed({reg86}) : ($signed((8'h9c)) ^~ wire79))) : reg92[(1'h0):(1'h0)]);
          reg90 <= (((~|(reg81[(1'h0):(1'h0)] > (wire80 ? reg86 : (8'ha7)))) ?
                  (-$unsigned((~&reg86))) : reg90) ?
              (&wire77) : (&{$unsigned($signed(reg82))}));
          reg91 <= (-wire75[(2'h2):(1'h0)]);
          reg92 <= {((+{(reg84 ? reg83 : reg85)}) ?
                  reg90 : $signed($signed((~|reg83))))};
          reg93 <= $signed($unsigned(($unsigned(wire78[(4'hb):(3'h5)]) >= wire75[(2'h2):(2'h2)])));
        end
    end
  assign wire98 = $unsigned((~&(8'haa)));
endmodule
