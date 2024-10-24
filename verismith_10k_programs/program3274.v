module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire167;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire165;
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  assign y = {wire167,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire14,
                 wire15,
                 wire165,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = wire0[(3'h4):(2'h2)];
  assign wire5 = $unsigned((wire4[(4'h8):(2'h2)] * $signed({$unsigned(wire4),
                     {(8'h9e)}})));
  assign wire6 = $signed(wire5);
  assign wire7 = $signed($signed((({wire4, (8'ha4)} << {wire3}) ?
                     (^~(wire3 == (8'hb7))) : {$unsigned((7'h42))})));
  assign wire8 = wire4;
  assign wire9 = (~(wire4[(4'hb):(2'h3)] >>> $signed(((wire8 ^~ wire7) ?
                     (wire1 >> (8'hac)) : $signed(wire8)))));
  assign wire10 = (+wire1);
  always
    @(posedge clk) begin
      reg11 <= $signed((!$signed({(wire2 - (8'hb7))})));
      reg12 <= ($unsigned((+wire5)) ?
          $unsigned(wire7[(4'hb):(4'ha)]) : wire10[(2'h3):(2'h3)]);
      reg13 <= ((reg11[(2'h2):(1'h0)] ?
              $signed($unsigned(((8'hb6) ^ wire5))) : $signed($unsigned((reg12 < (8'h9e))))) ?
          $signed(wire9) : wire10[(3'h6):(3'h6)]);
    end
  assign wire14 = ($unsigned((((~&(8'haa)) <<< (7'h43)) << ($signed((8'hab)) ?
                          (-wire10) : wire5[(2'h3):(2'h2)]))) ?
                      $signed(($signed($unsigned(reg11)) ?
                          $unsigned($signed(wire5)) : (wire9[(4'h8):(2'h2)] >> $signed((8'h9f))))) : reg11[(4'hb):(1'h1)]);
  assign wire15 = $signed(wire2[(4'hf):(4'hf)]);
  module16 #() modinst166 (.wire21(wire6), .wire20(wire3), .wire18(wire8), .wire19(wire0), .y(wire165), .wire17(wire2), .clk(clk));
  assign wire167 = wire2;
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire164;
  wire [(3'h4):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire162;
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  assign y = {wire164,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire47,
                 wire48,
                 wire49,
                 wire91,
                 wire144,
                 wire146,
                 wire162,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= ((+((wire18 & wire19) ?
          wire19 : $signed((~&wire17)))) > (wire19[(3'h4):(3'h4)] ?
          $signed(({wire21} < (wire17 ?
              (8'hb2) : (8'hb2)))) : wire18[(5'h14):(3'h6)]));
      reg23 <= wire21;
      reg24 <= $unsigned((((~(wire19 < wire18)) ?
          (~^$unsigned(reg23)) : wire19[(1'h1):(1'h1)]) << (~^((8'ha5) ?
          (-wire21) : (wire18 ? reg22 : (8'ha4))))));
      reg25 <= reg24;
    end
  assign wire26 = wire17[(2'h2):(1'h1)];
  assign wire27 = (wire19[(4'h9):(1'h1)] ?
                      ($unsigned((~(reg25 - wire18))) ?
                          $unsigned((|reg24[(2'h3):(2'h3)])) : {(8'h9c),
                              (~&(~|wire20))}) : ($unsigned(wire19) + reg22));
  assign wire28 = wire19;
  assign wire29 = (!reg24[(2'h2):(2'h2)]);
  assign wire30 = (|$signed((7'h41)));
  assign wire31 = $signed($unsigned(((^~(wire29 ? wire21 : reg22)) ?
                      $unsigned((7'h41)) : ((^~wire27) >>> {reg25}))));
  assign wire32 = $unsigned(reg23[(4'h8):(2'h3)]);
  always
    @(posedge clk) begin
      reg33 <= wire21[(2'h2):(1'h0)];
      if ($unsigned(((wire26[(3'h4):(1'h0)] ?
          (8'ha6) : wire28) && $signed((8'hb6)))))
        begin
          reg34 <= ($unsigned((-(~{wire18}))) ?
              (((&$signed(wire32)) ?
                  (~^((7'h44) + wire26)) : wire18[(4'h9):(4'h8)]) == $unsigned({{wire18},
                  (8'ha8)})) : reg33[(1'h1):(1'h1)]);
          reg35 <= (-wire18[(3'h4):(2'h3)]);
          if ($unsigned((&reg34)))
            begin
              reg36 <= wire31;
              reg37 <= reg33[(3'h6):(1'h1)];
            end
          else
            begin
              reg36 <= reg37;
              reg37 <= (|($signed((8'h9e)) ?
                  wire28 : (|((wire27 + wire32) ?
                      $signed(reg25) : reg37[(4'hf):(1'h1)]))));
              reg38 <= ((~&(wire32[(3'h5):(1'h1)] ?
                  {{wire19}} : reg35[(3'h5):(2'h2)])) | (~|wire26[(2'h3):(2'h3)]));
            end
        end
      else
        begin
          reg34 <= (~|reg37[(4'hf):(4'hc)]);
          reg35 <= ((($unsigned(wire31) == {(wire28 ? (8'hbd) : wire32),
              {wire26}}) || (($unsigned(wire26) - (!(7'h40))) ?
              (wire31 ?
                  (~^wire17) : wire28) : (8'hb7))) <<< reg22[(1'h1):(1'h0)]);
        end
      if (reg36)
        begin
          reg39 <= (wire32 ?
              (+$signed(($signed(reg24) ?
                  wire27 : (~wire28)))) : {((+(~reg23)) - reg35),
                  wire29[(2'h2):(1'h1)]});
          reg40 <= (7'h40);
        end
      else
        begin
          reg39 <= (reg39 && $unsigned(wire28));
          reg40 <= {(wire31[(5'h14):(5'h12)] ?
                  (($signed(reg40) ? ((7'h42) ? wire31 : wire20) : reg35) ?
                      {reg39, $unsigned((8'ha3))} : (wire27 ?
                          (wire32 >>> (8'hb7)) : $unsigned(reg40))) : wire27[(3'h4):(2'h2)])};
          reg41 <= $unsigned($signed(reg34[(4'he):(1'h1)]));
          if (($signed(((-wire20) * ($unsigned(reg41) ?
              (~&(8'hb9)) : $unsigned(reg34)))) | (~reg34)))
            begin
              reg42 <= reg33;
              reg43 <= $signed(wire28[(1'h1):(1'h1)]);
              reg44 <= ($unsigned({reg37}) + reg34[(4'he):(4'h9)]);
            end
          else
            begin
              reg42 <= (reg42 * reg43);
              reg43 <= $signed((+($signed(reg33) ?
                  $unsigned(wire32[(1'h0):(1'h0)]) : {(reg44 ^ wire30),
                      $signed((8'hbe))})));
              reg44 <= $unsigned(((~|wire26) * $unsigned((8'ha7))));
              reg45 <= $unsigned((&(($unsigned(wire21) ?
                      (wire26 ? wire26 : reg40) : (reg39 | (7'h41))) ?
                  ($signed(reg42) ?
                      wire32 : {reg23, wire31}) : reg34[(5'h10):(3'h7)])));
            end
        end
      reg46 <= wire26;
    end
  assign wire47 = $unsigned(wire28);
  assign wire48 = (wire47[(3'h7):(2'h2)] ?
                      $signed(wire17[(5'h13):(4'hd)]) : $unsigned({$signed((wire20 >= wire19))}));
  assign wire49 = (($signed($unsigned((!wire28))) ?
                      reg23[(3'h6):(2'h2)] : ((^~(8'hbb)) ?
                          {(reg38 + wire21),
                              wire20[(2'h2):(1'h1)]} : ((~&wire32) ?
                              $signed(reg40) : reg38))) != (reg39 << $signed(((+(8'hb4)) ?
                      reg22[(2'h3):(2'h2)] : reg42))));
  module50 #() modinst92 (.wire55(reg33), .wire54(wire30), .wire51(reg43), .clk(clk), .wire52(wire47), .wire53(reg46), .y(wire91));
  module93 #() modinst145 (.wire97(reg41), .wire95(wire91), .wire94(wire29), .clk(clk), .y(wire144), .wire96(reg37), .wire98(reg42));
  assign wire146 = $unsigned(((reg38[(2'h2):(1'h1)] ?
                           ((wire18 ? (8'had) : wire30) ?
                               wire29 : wire144) : ($signed(reg34) && $signed(reg34))) ?
                       $signed($unsigned($signed(reg23))) : wire20[(1'h0):(1'h0)]));
  module147 #() modinst163 (.wire151(reg33), .clk(clk), .wire148(reg24), .y(wire162), .wire150(reg41), .wire149(wire21));
  assign wire164 = (wire30 ?
                       (|((wire91 || (wire29 << wire17)) * ($signed((7'h43)) ?
                           {(8'hba), reg33} : (~&reg40)))) : {wire17});
endmodule

module module147
#(parameter param161 = ((8'hbb) ? (+((+((8'hbc) ? (8'hb1) : (8'hab))) || (((8'hb0) ? (8'hbd) : (7'h41)) ? (|(8'hb6)) : ((7'h43) * (8'hb5))))) : (!{({(8'hbe)} || ((8'ha7) != (7'h42))), (^~((8'h9c) || (8'hb4)))})))
(y, clk, wire151, wire150, wire149, wire148);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire151;
  input wire signed [(5'h14):(1'h0)] wire150;
  input wire [(3'h5):(1'h0)] wire149;
  input wire signed [(2'h2):(1'h0)] wire148;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(4'he):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 reg158,
                 reg152,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg152 <= ((~|$signed((^wire151))) ?
          $unsigned({(((8'ha1) ? wire150 : wire148) ?
                  $unsigned((8'haa)) : $signed(wire149)),
              (((8'hb9) ?
                  (8'hbc) : wire150) < wire150)}) : (!{(+(wire148 + (8'had)))}));
    end
  assign wire153 = $unsigned({((((8'h9f) ? wire151 : wire150) ?
                               $unsigned((8'hb6)) : (wire148 ?
                                   wire149 : wire151)) ?
                           wire149 : ($signed(wire151) < wire151)),
                       $signed(($unsigned(wire151) < (~wire149)))});
  assign wire154 = $unsigned(wire149);
  assign wire155 = wire149;
  assign wire156 = (~&(^$unsigned((reg152 < $unsigned(wire149)))));
  assign wire157 = wire153[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg158 <= (wire151[(1'h0):(1'h0)] ?
          $signed({reg152[(4'ha):(3'h5)],
              $unsigned(wire153)}) : ($signed($signed(wire154[(3'h7):(1'h1)])) <= {wire156,
              wire155[(3'h5):(3'h4)]}));
    end
  assign wire159 = (wire154[(4'h9):(3'h4)] ?
                       (~&($signed($signed(wire148)) >= $unsigned((~|wire154)))) : ((wire156 ?
                           $unsigned(reg152[(3'h5):(1'h1)]) : (~^(wire150 ?
                               wire151 : (8'had)))) == (+(&(wire148 == wire153)))));
  assign wire160 = reg152[(4'hb):(1'h1)];
endmodule

module module93
#(parameter param142 = (({(^~((8'hae) ~^ (8'ha4))), {(-(8'ha6)), ((7'h42) ? (8'hbf) : (8'hb6))}} >> (8'h9e)) + (~^(!{{(8'h9e)}, ((8'ha4) ^~ (8'ha4))}))), 
parameter param143 = ((^((((8'hac) ? param142 : param142) == param142) + (!param142))) + ((^param142) - {((|param142) ? (!(8'ha1)) : (~&param142)), ((param142 != (8'hb7)) ^ (~&param142))})))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire98;
  input wire signed [(3'h5):(1'h0)] wire97;
  input wire signed [(2'h3):(1'h0)] wire96;
  input wire [(4'ha):(1'h0)] wire95;
  input wire [(5'h10):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire135;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire signed [(4'ha):(1'h0)] wire131;
  wire signed [(4'he):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 reg139,
                 reg138,
                 reg137,
                 reg125,
                 reg124,
                 reg123,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed(($signed($signed(wire96)) - ($unsigned(wire98) ?
              ((8'h9f) ? (8'ha7) : wire98) : (wire97 ? wire95 : wire95)))) ?
          $signed((($unsigned(wire98) ? $signed(wire97) : $signed(wire95)) ?
              wire94[(3'h6):(1'h1)] : (~^wire96[(1'h0):(1'h0)]))) : $signed($unsigned($signed(wire95)))))
        begin
          if (((~&({wire98[(3'h4):(1'h0)],
              ((8'ha8) || wire95)} ~^ $unsigned({wire95,
              wire97}))) <= $signed($unsigned(wire96))))
            begin
              reg99 <= (8'hbe);
              reg100 <= ({(wire98[(1'h0):(1'h0)] ? wire97 : wire96),
                      $signed($unsigned((reg99 ? reg99 : wire94)))} ?
                  $unsigned(reg99) : {$signed((~|$unsigned(wire96)))});
              reg101 <= $unsigned(reg100[(4'h9):(4'h9)]);
              reg102 <= $signed(($signed({reg100[(4'hb):(4'hb)]}) ?
                  $unsigned((~^{wire96})) : reg101));
            end
          else
            begin
              reg99 <= ({($unsigned((reg102 ? wire97 : wire96)) ?
                          wire98[(3'h5):(2'h2)] : $unsigned({(8'ha5), reg99})),
                      (reg99[(3'h7):(1'h1)] ?
                          ((+wire94) ?
                              reg99 : (8'hbf)) : wire94[(2'h2):(2'h2)])} ?
                  (reg100 ?
                      ($unsigned(reg102[(4'ha):(1'h0)]) ?
                          {reg102[(4'h8):(4'h8)]} : wire95) : wire94) : wire95[(3'h7):(1'h0)]);
              reg100 <= (|wire98);
              reg101 <= wire95;
              reg102 <= wire98[(4'ha):(3'h5)];
            end
          if (reg100)
            begin
              reg103 <= $unsigned($unsigned({wire96[(2'h2):(2'h2)]}));
              reg104 <= $unsigned($signed((reg101 ?
                  $signed($signed(wire98)) : reg103[(4'ha):(3'h6)])));
              reg105 <= $signed($signed($unsigned(((reg100 ?
                  wire96 : reg101) >> (wire94 * wire94)))));
              reg106 <= (8'hac);
            end
          else
            begin
              reg103 <= reg104;
              reg104 <= ($signed($unsigned(reg100)) ?
                  (((~^(reg99 ?
                          reg101 : reg105)) <<< $signed($unsigned(reg102))) ?
                      (~^reg101[(2'h3):(1'h0)]) : reg99) : (~^reg104[(4'hc):(2'h3)]));
            end
          reg107 <= wire94;
          if ($unsigned($unsigned($signed({$unsigned(reg106)}))))
            begin
              reg108 <= ({$signed((reg104[(5'h10):(4'hc)] <<< (^~wire96))),
                      reg100[(4'hc):(4'h8)]} ?
                  $unsigned(((-$unsigned(wire94)) > (reg101[(3'h7):(2'h3)] ?
                      $signed(wire94) : $signed(wire94)))) : (reg100[(1'h1):(1'h0)] ?
                      $signed($unsigned((reg101 >= wire96))) : reg100));
              reg109 <= {(-($signed($unsigned(reg99)) ?
                      (^reg101[(3'h6):(3'h6)]) : {(|wire94)})),
                  (&(~&((^wire94) ? reg99 : (wire95 ? reg108 : (7'h44)))))};
            end
          else
            begin
              reg108 <= $unsigned((^$unsigned($unsigned($unsigned(reg102)))));
              reg109 <= reg102;
              reg110 <= $unsigned(reg99[(4'h9):(4'h8)]);
              reg111 <= $unsigned((reg109 | $signed((^~{(8'ha4), (8'hb1)}))));
              reg112 <= wire96[(2'h2):(2'h2)];
            end
          reg113 <= (($unsigned(wire94) ?
                  $signed({(reg112 + wire95)}) : (~&{(reg106 ? reg102 : reg104),
                      wire94[(4'hc):(1'h1)]})) ?
              $unsigned($unsigned(((!wire97) >= $signed(wire98)))) : ((reg107 | reg107) ^ ((~(wire97 ?
                  reg106 : reg106)) || reg100)));
        end
      else
        begin
          reg99 <= ($signed(($signed(wire98[(3'h5):(3'h4)]) ?
              wire94[(4'hf):(4'hb)] : $signed(reg111[(3'h5):(1'h0)]))) ^~ ((^~$signed((reg99 >> reg99))) ^ $unsigned((8'hb1))));
        end
      reg114 <= wire97[(1'h0):(1'h0)];
      if (wire95)
        begin
          reg115 <= reg110[(4'hb):(3'h7)];
          reg116 <= wire94[(3'h5):(2'h3)];
        end
      else
        begin
          reg115 <= reg105[(2'h2):(1'h0)];
        end
      reg117 <= ($signed(reg107) ? reg115[(2'h3):(2'h2)] : (&(~(!(8'ha6)))));
      if ($signed((reg109 ?
          ($unsigned((reg112 ?
              wire95 : wire94)) - wire95[(4'h8):(4'h8)]) : reg107)))
        begin
          reg118 <= (8'ha1);
          reg119 <= ((reg100 ?
                  (|reg110) : $signed({(reg103 * reg111), $signed(reg105)})) ?
              $signed(reg113[(1'h0):(1'h0)]) : wire95[(4'h9):(3'h5)]);
          reg120 <= $signed($unsigned((8'ha7)));
          if ({$unsigned(wire97[(2'h2):(1'h0)]), (-(!reg116[(4'hb):(4'hb)]))})
            begin
              reg121 <= reg115;
            end
          else
            begin
              reg121 <= ((!{$unsigned($unsigned(reg113)),
                  wire97}) == (reg109[(3'h7):(3'h5)] ?
                  $unsigned({$unsigned(reg110),
                      $unsigned(reg113)}) : (~$signed({reg103}))));
              reg122 <= (reg112 & (~|(((reg121 ?
                  (8'h9e) : reg121) <= (reg116 && reg105)) >>> wire98)));
              reg123 <= ($unsigned(((((7'h40) ? wire98 : reg119) >>> {(8'hb0),
                      reg112}) ?
                  $unsigned(reg109) : {reg107[(3'h6):(1'h1)]})) < (((((8'ha8) ?
                  reg103 : wire95) + $signed(reg104)) | $unsigned($unsigned(reg102))) & (reg120[(5'h10):(5'h10)] > ((reg115 ?
                  wire96 : reg113) == (~&wire95)))));
              reg124 <= $signed({reg123[(5'h10):(2'h3)],
                  (reg120[(4'hf):(1'h1)] << $unsigned($unsigned(reg120)))});
            end
          reg125 <= reg105;
        end
      else
        begin
          reg118 <= (^(!($unsigned((!reg113)) ^ reg110[(4'h9):(4'h9)])));
          reg119 <= $signed(($signed(($signed(reg107) <= {wire98,
              reg117})) > (reg109 ?
              $signed((-reg116)) : (reg104[(3'h4):(2'h3)] ?
                  $unsigned(reg112) : reg119))));
          reg120 <= reg104[(4'hb):(2'h3)];
        end
    end
  assign wire126 = reg103;
  assign wire127 = $signed((reg109[(3'h6):(1'h0)] ?
                       reg109[(4'hb):(3'h7)] : reg100));
  assign wire128 = (reg99 ?
                       {reg104[(4'hd):(4'hd)]} : $signed({$signed(reg121)}));
  assign wire129 = (wire128 != ((^~({wire98, (7'h40)} ?
                       (&reg99) : ((8'hbb) ?
                           reg110 : reg108))) || reg110[(4'hd):(1'h1)]));
  assign wire130 = $unsigned((reg113 ?
                       {((8'ha4) == (reg107 || (8'h9f)))} : (|$unsigned($unsigned(reg125)))));
  assign wire131 = reg111;
  assign wire132 = reg123[(3'h6):(3'h4)];
  assign wire133 = reg125[(2'h2):(2'h2)];
  assign wire134 = (($signed($unsigned(wire94)) ?
                           (wire133[(3'h5):(1'h1)] >> (^(^wire131))) : reg100) ?
                       $unsigned({$unsigned(reg105[(1'h1):(1'h1)])}) : (&reg113));
  assign wire135 = $unsigned(wire96);
  assign wire136 = (+$signed($signed((((8'haf) ? reg115 : reg101) & reg117))));
  always
    @(posedge clk) begin
      reg137 <= $unsigned(((~wire94) || {((reg107 ? reg106 : reg105) ?
              (reg102 ? (8'hbc) : reg115) : reg111)}));
      reg138 <= $signed(wire134[(2'h3):(2'h3)]);
      reg139 <= (|((&{$signed(reg110)}) ?
          $signed(reg111[(3'h6):(1'h0)]) : (reg110[(4'hf):(3'h7)] <= reg99[(2'h3):(2'h3)])));
    end
  assign wire140 = (~|($unsigned(((^~reg101) & ((8'ha2) >>> reg122))) ?
                       $signed($unsigned($signed((8'ha9)))) : wire133[(3'h7):(1'h1)]));
  assign wire141 = (8'ha1);
endmodule

module module50  (y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire55;
  input wire [(3'h4):(1'h0)] wire54;
  input wire [(2'h3):(1'h0)] wire53;
  input wire signed [(5'h15):(1'h0)] wire52;
  input wire [(4'h8):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire87,
                 wire86,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire57,
                 wire56,
                 reg88,
                 reg85,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire56 = wire52;
  assign wire57 = {($signed((wire53[(1'h1):(1'h1)] || wire53)) >>> {(-wire55)}),
                      $signed(($unsigned(wire55[(3'h7):(3'h4)]) || wire56[(4'hd):(2'h2)]))};
  always
    @(posedge clk) begin
      reg58 <= wire56[(3'h5):(1'h0)];
      reg59 <= (~$unsigned(($signed((~&wire57)) << ($signed((8'ha9)) || ((8'h9d) ?
          (8'hac) : wire51)))));
      if ((|((&(wire55 ? wire52 : $unsigned((8'hbd)))) - wire53)))
        begin
          reg60 <= (reg58[(5'h10):(4'hd)] * $unsigned($unsigned((8'ha6))));
          reg61 <= (reg59 ?
              ($unsigned(reg59) & {$unsigned($unsigned(wire56))}) : (!$signed({wire57,
                  wire56})));
          if ((($unsigned(wire57[(5'h15):(3'h6)]) ?
                  reg60 : $signed($signed(wire56))) ?
              $unsigned(($unsigned((reg61 >= wire57)) ?
                  reg58 : reg60)) : ((wire57[(4'h9):(3'h6)] ?
                      wire54[(2'h2):(2'h2)] : ((reg60 & wire57) ?
                          wire52 : wire53[(2'h3):(2'h3)])) ?
                  ($unsigned($unsigned(wire57)) ?
                      (reg60[(4'ha):(4'ha)] >>> (8'ha3)) : (reg61[(3'h4):(2'h3)] ^~ $signed(reg59))) : reg60)))
            begin
              reg62 <= wire51;
              reg63 <= wire57;
              reg64 <= (wire56[(3'h4):(1'h1)] ?
                  $unsigned((|(wire54 - (reg60 > wire51)))) : (~^(wire53 >= $signed(reg58[(5'h10):(3'h4)]))));
              reg65 <= $unsigned((-($signed((reg60 < wire53)) || $signed((~^reg64)))));
              reg66 <= (^~($unsigned($unsigned((^~reg59))) == $signed(({wire51,
                  (8'hb5)} >> $signed(reg60)))));
            end
          else
            begin
              reg62 <= $unsigned($signed((!$unsigned(wire51))));
            end
          reg67 <= (^~reg59);
          reg68 <= ((8'hb8) ?
              $unsigned(($unsigned($signed((8'hbc))) && (reg58[(4'h9):(1'h0)] <<< reg64))) : $signed((wire53[(1'h1):(1'h1)] | (8'ha9))));
        end
      else
        begin
          reg60 <= $signed(reg61[(4'h9):(1'h1)]);
          if (reg60[(4'hd):(4'h8)])
            begin
              reg61 <= $unsigned(($unsigned(((-wire53) ?
                      wire51[(3'h6):(2'h2)] : (!reg66))) ?
                  {$signed(((8'hbf) - (8'ha9))),
                      ((8'hb8) ?
                          (wire55 << (8'ha5)) : wire54[(1'h1):(1'h1)])} : $unsigned(reg67[(4'hc):(2'h3)])));
            end
          else
            begin
              reg61 <= (^$unsigned(reg59));
              reg62 <= (wire55[(1'h1):(1'h1)] <<< (&$signed($unsigned({reg64,
                  reg59}))));
              reg63 <= $unsigned($unsigned(((((8'ha1) >= (7'h43)) >>> $signed(reg68)) ?
                  wire53 : $signed($signed((8'ha7))))));
            end
        end
      reg69 <= $unsigned(($signed(reg66[(1'h1):(1'h1)]) ?
          (~&((reg68 == reg64) != $signed(wire52))) : {$unsigned($signed(reg66))}));
    end
  always
    @(posedge clk) begin
      reg70 <= wire57[(4'he):(4'hb)];
      if (wire52[(5'h14):(5'h12)])
        begin
          reg71 <= {(-(reg68 ?
                  ({wire52, reg66} && reg69) : {wire57[(4'h8):(2'h2)]}))};
          reg72 <= (~&($unsigned(reg61) ? reg64 : $unsigned(reg59)));
          reg73 <= (-(~(reg58[(3'h4):(1'h0)] ?
              reg59 : $signed((wire55 ? reg63 : (8'hbb))))));
        end
      else
        begin
          reg71 <= {$unsigned($unsigned((reg58[(3'h5):(2'h3)] ?
                  (reg64 ? reg70 : (8'ha0)) : $unsigned(wire53))))};
          reg72 <= (reg59 ?
              (({reg66[(4'he):(1'h1)]} ?
                      (^$unsigned(reg60)) : reg62[(3'h5):(1'h0)]) ?
                  reg71[(3'h5):(2'h2)] : ($signed(((8'ha5) ?
                      wire55 : wire54)) >>> wire52)) : $signed($signed($unsigned((reg58 ?
                  reg63 : wire53)))));
          reg73 <= $signed((!(8'hbf)));
          if ((~&$unsigned(reg62)))
            begin
              reg74 <= $signed((~$signed(reg62)));
              reg75 <= (!($signed(reg58[(4'hc):(3'h5)]) > {wire55}));
            end
          else
            begin
              reg74 <= ((((reg71[(3'h7):(2'h3)] ?
                      wire57[(2'h3):(1'h1)] : (&reg68)) & (|$unsigned(reg73))) * (-reg65)) ?
                  reg65 : reg68);
              reg75 <= $unsigned(((~^((^~reg74) <= $unsigned(reg70))) ?
                  (8'h9c) : reg62));
              reg76 <= reg60;
              reg77 <= reg71;
              reg78 <= reg72;
            end
          reg79 <= wire56;
        end
      reg80 <= ((8'ha2) & ({$unsigned({reg76, reg61})} > $signed(reg74)));
    end
  assign wire81 = (wire51 ?
                      reg59 : ((&(^(reg66 <= reg70))) && $unsigned(($unsigned(wire54) ^ (~&wire54)))));
  assign wire82 = (-(+(-$signed((reg60 != reg59)))));
  assign wire83 = reg73;
  assign wire84 = (reg75 << $signed(wire51));
  always
    @(posedge clk) begin
      reg85 <= $signed(wire56[(4'he):(2'h3)]);
    end
  assign wire86 = ((&{(8'hb7),
                      (reg71[(3'h4):(2'h2)] ?
                          (~reg66) : (reg71 ?
                              wire84 : reg64))}) << $signed(wire55));
  assign wire87 = reg61;
  always
    @(posedge clk) begin
      reg88 <= $unsigned({reg58, ((~^reg67) <<< reg61)});
    end
  assign wire89 = (~(&wire55));
  assign wire90 = (((($signed(reg77) == wire56[(3'h4):(1'h0)]) ?
                              $unsigned(((8'hb1) ?
                                  reg78 : (8'hba))) : {$unsigned(wire81)}) ?
                          (^$signed($signed(wire56))) : ($unsigned(wire89[(3'h4):(1'h1)]) != $signed($signed(wire82)))) ?
                      (({(reg69 ? reg72 : (8'ha8))} ?
                              (&reg85[(4'hc):(3'h5)]) : $signed((8'hac))) ?
                          $signed(reg74[(3'h5):(2'h3)]) : reg76) : ((reg85 >> ((reg68 ?
                              wire51 : reg75) ?
                          $signed(reg68) : (reg80 != wire81))) ~^ reg59[(1'h1):(1'h1)]));
endmodule
