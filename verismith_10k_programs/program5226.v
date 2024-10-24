module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire175;
  wire signed [(3'h6):(1'h0)] wire171;
  wire [(5'h13):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire74;
  reg [(5'h14):(1'h0)] reg174 = (1'h0);
  reg [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire171,
                 wire82,
                 wire81,
                 wire80,
                 wire77,
                 wire76,
                 wire5,
                 wire6,
                 wire74,
                 reg174,
                 reg173,
                 reg78,
                 reg79,
                 (1'h0)};
  assign wire5 = (wire0 == $signed(wire4));
  assign wire6 = ($signed({$unsigned(wire1[(3'h7):(1'h0)]), wire2}) ?
                     (wire4 ^~ (~&{wire0[(2'h2):(1'h1)]})) : ($signed((-wire2)) ?
                         wire2 : ($signed($unsigned((8'ha3))) ?
                             $signed((8'ha1)) : wire0)));
  module7 #() modinst75 (wire74, clk, wire0, wire3, wire1, wire6, wire5);
  assign wire76 = wire1;
  assign wire77 = wire2;
  always
    @(posedge clk) begin
      reg78 <= ($signed($unsigned($signed((wire77 ? wire2 : wire0)))) ?
          wire6 : $unsigned(wire0));
      reg79 <= wire2[(3'h6):(3'h6)];
    end
  assign wire80 = $unsigned({wire3[(4'h8):(1'h1)]});
  assign wire81 = ({(&(((8'ha9) + reg79) >> $unsigned(wire80)))} ?
                      ($unsigned(wire76[(4'h8):(3'h5)]) << (~|(wire76 ?
                          $unsigned(reg78) : (^wire4)))) : wire4);
  assign wire82 = (reg78 ?
                      reg78[(4'ha):(1'h1)] : $unsigned(wire77[(4'hd):(3'h5)]));
  module83 #() modinst172 (.wire85(wire81), .wire86(reg78), .wire84(wire6), .clk(clk), .y(wire171), .wire88(wire1), .wire87(wire76));
  always
    @(posedge clk) begin
      reg173 <= (wire76[(1'h1):(1'h1)] ? wire6[(1'h1):(1'h1)] : wire4);
      reg174 <= {reg79,
          (^~(reg78[(1'h0):(1'h0)] ?
              (wire80 ?
                  (&wire5) : (wire82 != wire0)) : ($signed(wire171) <= (wire5 >>> (8'ha4)))))};
    end
  assign wire175 = ({(|((7'h44) ?
                               (reg79 >> (7'h41)) : (wire77 ?
                                   wire6 : wire82)))} ?
                       ((~^wire74) ?
                           wire6 : $unsigned($signed(reg79[(4'ha):(2'h3)]))) : ($unsigned($signed(wire4[(3'h5):(3'h5)])) || $unsigned($signed($signed(wire2)))));
  assign wire176 = $signed(($unsigned($unsigned({wire1, wire6})) ?
                       ($signed(wire1[(4'hb):(4'hb)]) ?
                           $unsigned($signed(wire76)) : wire81[(4'hb):(3'h4)]) : ($signed(wire0[(4'h9):(1'h0)]) ^~ reg79[(3'h5):(2'h2)])));
endmodule

module module83
#(parameter param169 = ((8'ha4) ? ((~(~((8'ha6) >= (8'h9e)))) ? ((&((8'hb8) >> (7'h41))) ? ((+(8'ha9)) ? ((8'hb0) + (8'hab)) : ((8'hb9) ? (8'h9e) : (8'hb0))) : (((8'hb5) ? (8'ha0) : (8'hae)) <= (~^(8'h9c)))) : (8'ha2)) : {(((7'h40) ? ((8'ha2) ? (8'hba) : (7'h44)) : {(8'ha7), (8'ha3)}) | (((8'hae) <= (8'hbd)) ? (^~(8'h9c)) : (-(8'hbb)))), (((^(8'hab)) ? {(8'hb1)} : {(7'h41)}) ? ({(7'h42), (8'hb3)} | ((8'hb2) * (8'ha8))) : (&(8'ha4)))}), 
parameter param170 = {((^((param169 ^ param169) - (param169 ? param169 : param169))) < (~^(param169 >> (+param169)))), (((param169 < {param169}) ? (param169 ? (!param169) : (~param169)) : {{param169}, (param169 ? param169 : param169)}) ? {(((7'h41) ? param169 : param169) ? (param169 ? param169 : param169) : (7'h41)), (~param169)} : ({param169} ? ((param169 >>> (7'h44)) ? param169 : (&param169)) : (~^(^(8'hbc)))))})
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire88;
  input wire signed [(3'h6):(1'h0)] wire87;
  input wire [(2'h2):(1'h0)] wire86;
  input wire signed [(5'h11):(1'h0)] wire85;
  input wire [(3'h7):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire166;
  wire [(5'h14):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire89;
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire157,
                 wire104,
                 wire103,
                 wire89,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 (1'h0)};
  assign wire89 = wire88;
  always
    @(posedge clk) begin
      reg90 <= $unsigned(wire86[(1'h1):(1'h1)]);
      if ($unsigned(reg90[(1'h0):(1'h0)]))
        begin
          if (reg90)
            begin
              reg91 <= {(wire84 ?
                      {(wire85[(4'ha):(3'h6)] ? (~&wire85) : $signed(wire86)),
                          $unsigned(wire86[(1'h1):(1'h0)])} : (((~^reg90) << $unsigned(wire89)) || $signed($signed(wire88)))),
                  reg90};
              reg92 <= wire85[(3'h5):(1'h1)];
              reg93 <= ((^$unsigned((~|(reg92 ?
                  reg92 : wire85)))) >>> ((8'hac) != (((~|reg90) ?
                      wire87[(2'h3):(2'h3)] : $signed(wire85)) ?
                  $unsigned((wire88 ?
                      reg90 : wire84)) : (|wire88[(4'hd):(4'hd)]))));
              reg94 <= reg91;
              reg95 <= (&((($unsigned(wire84) < {reg90, wire85}) ?
                  {(wire84 != wire89), $unsigned(wire85)} : ((|(8'ha7)) ?
                      $unsigned((8'ha1)) : (~wire85))) || (wire89 ?
                  ({wire89} ?
                      $unsigned((8'hb5)) : (wire86 ?
                          wire89 : wire88)) : $signed(wire86))));
            end
          else
            begin
              reg91 <= ((reg94[(1'h0):(1'h0)] ?
                  ({{reg94, wire87}} ?
                      reg93[(2'h3):(1'h1)] : (wire87[(1'h1):(1'h0)] ?
                          (wire85 || wire89) : (~&wire84))) : $signed(($unsigned(reg90) ?
                      $signed((8'ha1)) : (wire84 | (8'hae))))) == ($unsigned((~^$unsigned(reg95))) <<< (|reg91[(5'h13):(3'h5)])));
              reg92 <= (reg93 ?
                  ((((reg92 ? wire87 : reg93) ?
                      (wire85 ?
                          reg91 : (8'hb1)) : $unsigned((8'hb5))) * reg95) >> (|(wire88[(4'h9):(2'h2)] ?
                      (wire86 != (8'h9c)) : $unsigned(reg90)))) : (+($unsigned($unsigned(reg90)) ?
                      wire87 : ((wire87 ? wire89 : reg92) <<< (~^wire88)))));
              reg93 <= ((reg94[(3'h7):(2'h3)] ?
                  $unsigned(((wire88 ? wire89 : wire89) ?
                      $signed(reg90) : (~^wire86))) : $signed($signed(reg94[(3'h7):(3'h7)]))) || (+{({reg91,
                      wire89} | (~reg91)),
                  $signed((wire86 ^~ wire87))}));
              reg94 <= $signed((reg94[(2'h2):(1'h1)] ^ $signed($signed((8'ha2)))));
            end
        end
      else
        begin
          if ((!($signed((wire84[(2'h2):(1'h1)] ?
              $signed(reg95) : (~(8'ha4)))) < (wire86[(1'h0):(1'h0)] >= $unsigned($signed(reg95))))))
            begin
              reg91 <= (reg94 ?
                  $signed($unsigned(((~&wire89) ^ $signed(reg94)))) : (+wire87));
              reg92 <= reg93;
              reg93 <= (((reg93[(3'h7):(1'h0)] * wire85[(1'h0):(1'h0)]) ?
                  {wire84, (~|{reg92})} : {((reg92 ? reg95 : reg90) & {reg91,
                          reg90})}) & $signed(wire87));
              reg94 <= ((|((~^(^wire89)) <= $signed($signed(wire88)))) ?
                  (wire88 * reg92[(3'h4):(1'h0)]) : wire88);
              reg95 <= ((8'ha3) ?
                  (~|(|((&wire88) != (reg90 ?
                      wire87 : (8'ha3))))) : $unsigned((~^$signed($signed(wire85)))));
            end
          else
            begin
              reg91 <= reg91[(4'hd):(4'hd)];
              reg92 <= $unsigned($unsigned(reg90));
            end
          reg96 <= reg94[(4'hb):(4'ha)];
          reg97 <= (($unsigned((wire87 + $unsigned(reg95))) >> {$unsigned(reg90[(1'h0):(1'h0)])}) >>> $signed($signed(reg91[(4'hc):(4'hc)])));
          if ((8'ha0))
            begin
              reg98 <= (reg96[(4'hb):(2'h3)] ?
                  reg90[(2'h3):(1'h0)] : ($signed(reg95) ? (8'ha2) : wire84));
              reg99 <= {{wire86[(2'h2):(1'h1)], (~&(~^$unsigned(wire85)))},
                  ({((~^wire86) - (7'h40)),
                          ((^~reg97) ?
                              ((8'hbb) ? reg94 : (8'hb0)) : (wire88 ?
                                  wire88 : wire88))} ?
                      ((~^(~|wire84)) ?
                          (~^wire89[(3'h5):(1'h1)]) : ((~^wire87) ?
                              wire88 : $signed(reg98))) : (({wire84, reg93} ?
                          reg95 : (^~(8'h9d))) ~^ $unsigned({wire86, reg98})))};
              reg100 <= (~reg92);
              reg101 <= reg94;
            end
          else
            begin
              reg98 <= ($unsigned((!$unsigned({reg91}))) ?
                  $unsigned(($signed($unsigned((8'hb0))) >> ($unsigned(reg90) << reg90))) : ({(|reg97),
                          (reg101[(3'h6):(1'h0)] ? (^reg91) : reg98)} ?
                      (((reg101 ? (8'ha3) : wire89) + $unsigned(wire86)) ?
                          $signed($unsigned(wire86)) : $unsigned((reg93 == wire88))) : $signed($signed((~reg94)))));
              reg99 <= ($unsigned({$unsigned($unsigned(wire88)),
                      {wire89, $signed(wire88)}}) ?
                  {$unsigned((8'ha2)),
                      (reg95 ?
                          reg96[(4'h8):(1'h1)] : $signed(reg94[(3'h5):(1'h0)]))} : $unsigned(reg95[(1'h1):(1'h1)]));
              reg100 <= $signed(wire86[(1'h1):(1'h0)]);
              reg101 <= reg91;
            end
        end
      reg102 <= reg95;
    end
  assign wire103 = ($unsigned($signed(reg99)) ?
                       (^($unsigned((wire88 ?
                           reg98 : reg100)) ^~ $unsigned($unsigned(reg99)))) : {reg100,
                           reg96[(2'h2):(2'h2)]});
  assign wire104 = $signed((({reg95, (reg96 << reg93)} ?
                       {$unsigned(reg90),
                           (~&reg99)} : reg101) <<< $unsigned(((~reg91) > $signed(wire103)))));
  module105 #() modinst158 (wire157, clk, reg95, reg91, reg102, wire103, wire87);
  always
    @(posedge clk) begin
      reg159 <= {($unsigned(wire157[(5'h11):(2'h3)]) ?
              $signed(wire157) : (~&$signed((!wire103)))),
          $unsigned((reg92 ? $unsigned($signed(wire86)) : (8'haf)))};
      if ((^wire86[(1'h1):(1'h0)]))
        begin
          if (((7'h42) ?
              ({(reg97[(1'h0):(1'h0)] ? (~reg101) : wire89), reg92} ?
                  {(wire104 & $unsigned(reg90)),
                      wire85} : ($signed($signed((8'hb7))) ?
                      (~&$unsigned(reg102)) : $signed($signed(reg97)))) : (reg97 || {(8'h9f)})))
            begin
              reg160 <= ((-wire86[(1'h0):(1'h0)]) ?
                  $unsigned(((8'ha2) ?
                      ((reg95 * (8'hb0)) > (reg90 + reg94)) : $signed($unsigned(reg91)))) : {wire85[(2'h2):(2'h2)]});
              reg161 <= $signed(wire88);
              reg162 <= (reg161 ?
                  ($unsigned((-wire84)) >> (wire85 <<< {$unsigned(reg93),
                      wire103[(3'h4):(1'h1)]})) : $unsigned($signed(reg90[(2'h3):(1'h1)])));
              reg163 <= {(|(($unsigned(reg97) ^ wire103) ?
                      reg161[(1'h0):(1'h0)] : {reg94})),
                  ($unsigned($unsigned($unsigned(wire87))) ?
                      $unsigned($signed($signed((8'hb0)))) : $signed((~|(~^wire89))))};
              reg164 <= (($unsigned(reg163[(3'h5):(2'h2)]) ?
                  wire84 : wire84[(3'h7):(3'h5)]) <= (^~(reg159 ?
                  $signed({wire85, reg93}) : (~|reg100[(4'hc):(4'hb)]))));
            end
          else
            begin
              reg160 <= ($unsigned(((wire87[(3'h5):(3'h4)] <= $unsigned(reg102)) ?
                  ($unsigned(reg162) ?
                      (reg161 >>> reg160) : reg162[(2'h2):(2'h2)]) : $signed((reg159 ?
                      (8'hba) : wire88)))) <= (8'hb1));
              reg161 <= (($signed(reg95) ?
                      ({(reg98 < (8'had)),
                          $signed(reg160)} != $signed((reg96 <<< wire88))) : (^$signed($unsigned(wire157)))) ?
                  reg162 : $signed($unsigned((^$unsigned(wire103)))));
            end
        end
      else
        begin
          reg160 <= $signed($unsigned(reg90));
          reg161 <= (wire89[(5'h10):(3'h4)] ?
              $signed($unsigned(($unsigned(reg161) > {reg98}))) : reg96[(4'ha):(4'h9)]);
          reg162 <= (&$unsigned($signed((reg90 << reg95[(3'h6):(3'h6)]))));
          reg163 <= (|wire85);
        end
      reg165 <= ($unsigned(wire89[(4'hf):(4'ha)]) & (7'h41));
    end
  assign wire166 = {(&(|(wire104 ? $unsigned(reg163) : $signed(reg98)))),
                       $unsigned(($unsigned((wire88 ?
                           (8'ha0) : reg91)) >>> ((!reg99) ?
                           (reg163 | reg94) : (reg159 > wire103))))};
  assign wire167 = ($signed((({wire86} != $signed(reg160)) || (reg101[(3'h4):(1'h0)] & (~|wire157)))) >>> ((~|(^~wire86[(2'h2):(2'h2)])) ?
                       reg101 : reg90[(2'h3):(2'h3)]));
  assign wire168 = wire86;
endmodule

module module7
#(parameter param72 = (~|(&{(~(|(7'h41))), (7'h42)})), 
parameter param73 = (~|((param72 ? ((~^param72) * (param72 & (8'ha8))) : {param72, (+param72)}) ? (^~param72) : {param72, ({param72, param72} | ((8'hac) ? param72 : param72))})))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire68;
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  assign y = {wire44,
                 wire48,
                 wire68,
                 reg71,
                 reg70,
                 reg13,
                 reg14,
                 reg15,
                 reg46,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= $signed(wire9[(1'h0):(1'h0)]);
      reg14 <= $unsigned($signed({wire8[(4'hc):(3'h7)],
          ((wire12 ? wire10 : reg13) ?
              (wire11 ? wire10 : (8'haa)) : (wire11 & wire11))}));
      reg15 <= reg14[(5'h13):(2'h2)];
    end
  module16 #() modinst45 (wire44, clk, wire9, reg13, wire10, wire8, reg14);
  always
    @(posedge clk) begin
      reg46 <= (~^(!$unsigned((wire10[(3'h7):(1'h1)] ?
          (wire8 + reg15) : wire9[(4'hb):(3'h4)]))));
      reg47 <= (wire8 ?
          (reg13[(5'h13):(5'h11)] << reg46) : wire9[(5'h13):(4'ha)]);
    end
  assign wire48 = reg14[(4'h9):(1'h1)];
  module49 #() modinst69 (wire68, clk, wire8, reg14, wire10, wire11);
  always
    @(posedge clk) begin
      reg70 <= {((-$signed($unsigned((8'hbb)))) & ($signed((^~wire44)) ?
              reg46 : $unsigned((-(8'ha3)))))};
      reg71 <= (^~{(((+reg13) == $unsigned(reg13)) ?
              ($signed(wire12) ?
                  wire11 : wire44[(3'h4):(1'h1)]) : $unsigned((wire48 ?
                  reg15 : wire9))),
          ($unsigned($signed(reg15)) << ((8'hac) && $unsigned(reg46)))});
    end
endmodule

module module49  (y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire52;
  input wire signed [(4'ha):(1'h0)] wire51;
  input wire [(3'h5):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire54;
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire54,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire54 = $signed((wire50 ?
                      $unsigned(wire52[(4'h8):(3'h4)]) : $unsigned((8'hb0))));
  always
    @(posedge clk) begin
      if ((wire51[(2'h2):(1'h0)] > (!$unsigned(wire52))))
        begin
          reg55 <= ($unsigned((8'hb4)) ? (~&$unsigned(wire50)) : wire54);
        end
      else
        begin
          reg55 <= wire52;
          reg56 <= wire52[(4'hd):(2'h3)];
          reg57 <= wire54[(3'h6):(3'h4)];
        end
    end
  assign wire58 = reg57;
  assign wire59 = $signed({$unsigned({(wire58 + (7'h44)), (wire58 + wire50)})});
  always
    @(posedge clk) begin
      if ($signed((~&wire54[(4'h9):(3'h5)])))
        begin
          if ($signed(wire58[(2'h3):(1'h0)]))
            begin
              reg60 <= {$signed((|((wire58 ? wire58 : wire54) ?
                      (wire53 ? wire50 : wire52) : {wire54, (8'ha0)})))};
              reg61 <= $signed(wire58[(2'h3):(1'h0)]);
              reg62 <= $signed(((~((wire50 ? wire59 : reg55) ?
                      (~&wire51) : (&wire53))) ?
                  reg56[(1'h1):(1'h1)] : wire50));
              reg63 <= wire51[(2'h2):(2'h2)];
            end
          else
            begin
              reg60 <= $signed(wire58);
              reg61 <= ((reg57 ^ {(~wire54),
                      $signed((wire59 ? reg60 : reg60))}) ?
                  $signed(reg55) : (!wire51));
              reg62 <= wire51[(4'h8):(2'h2)];
            end
          if ((^~wire52))
            begin
              reg64 <= $unsigned((~|$unsigned($signed(wire51))));
              reg65 <= wire58;
            end
          else
            begin
              reg64 <= {$unsigned({((reg65 ? reg61 : wire54) ?
                          reg61 : {wire52}),
                      wire51})};
              reg65 <= reg61[(1'h0):(1'h0)];
              reg66 <= (wire53[(2'h2):(1'h0)] ?
                  wire51 : ($signed($unsigned((wire50 ?
                      reg55 : reg63))) <= (8'hbb)));
            end
          reg67 <= (|(7'h44));
        end
      else
        begin
          reg60 <= (reg60[(4'hc):(1'h0)] ? reg66 : reg61[(2'h2):(2'h2)]);
          if ((reg64[(4'h8):(3'h5)] ?
              $unsigned(wire51) : $unsigned(wire52[(4'hd):(3'h7)])))
            begin
              reg61 <= wire50;
              reg62 <= {($unsigned(reg56) ?
                      (($unsigned((8'haf)) ?
                              reg61[(2'h2):(1'h0)] : $unsigned(wire59)) ?
                          (-(!reg56)) : ({wire58, reg62} ?
                              reg55 : {(8'ha2)})) : (!$signed($signed(wire59)))),
                  $unsigned(reg66[(1'h0):(1'h0)])};
              reg63 <= wire51;
              reg64 <= ((~&reg60) != reg64);
            end
          else
            begin
              reg61 <= $signed(($unsigned(reg60) > (~&((wire51 ?
                  reg56 : (8'ha9)) ~^ $signed(reg57)))));
              reg62 <= reg64;
            end
        end
    end
endmodule

module module16
#(parameter param42 = (-((({(8'hb9), (8'h9e)} - (~|(8'ha5))) ? (+((8'hac) ? (8'hac) : (8'haf))) : (((8'hbd) != (7'h44)) ? (+(8'hb9)) : (^~(7'h43)))) ? (8'hbd) : (8'ha2))), 
parameter param43 = param42)
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire24,
                 wire23,
                 wire22,
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
                 reg25,
                 (1'h0)};
  assign wire22 = $unsigned((+$unsigned($unsigned((wire18 ?
                      wire18 : wire20)))));
  assign wire23 = $unsigned($unsigned($unsigned((wire20 ?
                      $unsigned(wire22) : {wire17}))));
  assign wire24 = $signed((^~wire19));
  always
    @(posedge clk) begin
      reg25 <= (wire17 ?
          ($unsigned(wire21[(2'h2):(2'h2)]) ?
              wire24[(1'h0):(1'h0)] : $signed((^~(wire22 ?
                  wire20 : wire20)))) : {{(^$signed(wire23)),
                  $signed(wire24[(2'h2):(2'h2)])}});
      if (wire23[(3'h6):(2'h3)])
        begin
          reg26 <= ($signed($signed($signed($signed(wire18)))) != ($unsigned((wire17[(2'h3):(1'h0)] ?
                  $unsigned(reg25) : wire24)) ?
              $signed(reg25) : wire21));
          if (({(8'h9e), $signed((!(wire17 + reg25)))} ?
              (wire24[(1'h0):(1'h0)] * {wire17, wire18}) : (8'h9f)))
            begin
              reg27 <= {$signed((((^wire23) >= $unsigned(wire20)) < (~((8'ha2) >>> (8'haf)))))};
              reg28 <= wire22;
            end
          else
            begin
              reg27 <= (($unsigned(($signed(wire22) ?
                  {reg27} : wire24)) != wire21) >>> {reg28[(3'h7):(1'h0)],
                  (~^(~&{wire23, reg27}))});
              reg28 <= $signed({wire21});
              reg29 <= {$signed((~&reg26)),
                  (reg25 || (((~^wire19) ? $unsigned((8'hb6)) : (8'haf)) ?
                      ($unsigned(reg27) < (reg27 ?
                          wire18 : wire18)) : (8'ha9)))};
              reg30 <= (~|((8'ha6) ?
                  reg25 : {$signed((wire24 ? (8'hb5) : (8'ha9))), wire22}));
            end
          reg31 <= (&wire24[(5'h12):(3'h5)]);
          reg32 <= (($unsigned((8'hae)) <= $signed(reg29[(3'h6):(1'h0)])) ~^ ((!(~&((8'hba) >>> wire23))) <= wire18));
          if ((|$signed($unsigned(wire18[(3'h5):(1'h1)]))))
            begin
              reg33 <= wire17;
              reg34 <= $signed((8'haf));
            end
          else
            begin
              reg33 <= $unsigned($signed(($unsigned((reg31 ?
                  reg32 : reg26)) == wire20[(2'h2):(1'h0)])));
              reg34 <= {$unsigned($signed((-$unsigned(wire21))))};
              reg35 <= reg32;
              reg36 <= (((($unsigned(wire22) ? {reg31, wire21} : (^~wire21)) ?
                  (8'had) : {reg26, wire23}) >= ((|{(8'hbe)}) ?
                  {reg29} : (~&reg29[(4'hd):(3'h6)]))) != $unsigned({$signed($signed(reg33)),
                  $signed((~reg29))}));
            end
        end
      else
        begin
          reg26 <= wire21;
        end
    end
  assign wire37 = ((+((&(^~reg35)) ?
                      $signed(reg28) : {reg32[(4'h8):(2'h3)],
                          (reg29 ? wire18 : wire19)})) != ($signed((-(reg28 ?
                      wire17 : wire23))) >> (~&wire20[(2'h2):(1'h0)])));
  assign wire38 = ($unsigned((reg25 ?
                          $unsigned($signed(wire23)) : {(reg26 <= wire18)})) ?
                      (reg27[(1'h0):(1'h0)] ?
                          wire17 : {$signed($signed(wire18)),
                              ({wire21, wire24} ?
                                  wire18 : (~wire23))}) : $signed(reg34[(3'h4):(1'h1)]));
  assign wire39 = $unsigned((reg31[(2'h2):(1'h1)] + (!($unsigned(wire18) ?
                      $signed((7'h44)) : (wire20 != reg33)))));
  assign wire40 = ((8'hae) <= {$unsigned(($unsigned(reg28) ?
                          wire20[(3'h5):(3'h5)] : reg36[(2'h2):(2'h2)])),
                      reg31[(3'h7):(3'h4)]});
  assign wire41 = (+reg26[(1'h1):(1'h1)]);
endmodule

module module105
#(parameter param156 = (((!(-(~^(8'hb6)))) ? ((((8'hb9) ? (8'hae) : (7'h40)) ? ((8'hba) >> (8'ha3)) : ((7'h41) ? (8'h9c) : (8'haa))) ? {(|(8'hb0)), ((8'ha1) ? (8'hb4) : (8'hb1))} : ((~(8'h9c)) ? {(8'hb0)} : ((8'haa) ? (8'hb6) : (8'ha5)))) : ((~^((8'h9e) == (8'hb4))) <= (~&((8'hae) ? (8'h9e) : (8'h9e))))) ~^ (((^~{(7'h44), (8'ha1)}) ? {((8'had) <= (8'ha4))} : (8'h9c)) ? (^~{(~^(8'haa))}) : ((&((7'h44) * (7'h44))) ? {((8'hb0) ? (7'h41) : (8'hbd)), (8'hbe)} : {((8'hb4) * (8'ha9)), ((8'hae) ? (8'hb9) : (8'hbd))}))))
(y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire110;
  input wire [(5'h11):(1'h0)] wire109;
  input wire [(5'h15):(1'h0)] wire108;
  input wire [(2'h2):(1'h0)] wire107;
  input wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire153;
  wire signed [(5'h15):(1'h0)] wire151;
  wire signed [(4'he):(1'h0)] wire150;
  wire signed [(3'h4):(1'h0)] wire149;
  wire [(3'h4):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire133;
  wire [(3'h4):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire130;
  wire [(5'h12):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire111;
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg152,
                 reg147,
                 reg146,
                 reg145,
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
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire111 = ({(^~$unsigned((~&wire109)))} ?
                       $unsigned((wire106 ?
                           $unsigned((wire110 >> wire108)) : $signed(wire106[(2'h2):(1'h1)]))) : $unsigned($unsigned((wire106[(2'h2):(1'h1)] ~^ wire107[(2'h2):(1'h1)]))));
  assign wire112 = (~|(((wire111[(1'h1):(1'h1)] ?
                       (|wire110) : (+wire111)) << wire111) && ((^{(8'hb4)}) && wire111[(2'h2):(1'h0)])));
  assign wire113 = ((8'hab) ?
                       wire112 : ({$signed(((8'hb6) >= (8'hbe)))} ?
                           {((wire109 ?
                                   wire111 : wire107) == wire107[(1'h1):(1'h0)])} : $unsigned($unsigned((wire111 - (8'ha3))))));
  assign wire114 = ((wire111 <<< {(|wire107[(2'h2):(1'h0)]),
                       ($signed(wire109) ^~ (wire106 ^ wire107))}) << $signed((8'ha1)));
  assign wire115 = $signed({((~&(!(7'h43))) ?
                           $signed((8'h9e)) : $unsigned(wire113))});
  assign wire116 = ((($unsigned(wire114) ?
                           wire108[(3'h7):(3'h7)] : $unsigned({wire114})) == ((8'ha5) == (!$signed(wire114)))) ?
                       {(({wire108} ?
                               wire111 : {wire110,
                                   wire115}) << wire106[(2'h2):(1'h1)]),
                           (~$unsigned($signed(wire109)))} : ($signed((wire111 != ((8'ha9) & (8'hbc)))) >= ((8'hb7) ?
                           (wire115[(3'h7):(2'h2)] & wire110[(4'h8):(3'h6)]) : $signed({wire115,
                               (8'hb9)}))));
  assign wire117 = wire112;
  assign wire118 = wire111[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg119 <= ((+{($unsigned(wire107) ~^ wire107[(2'h2):(1'h0)])}) ?
          wire117 : {wire117});
      if (wire106[(1'h1):(1'h0)])
        begin
          reg120 <= wire106[(3'h4):(1'h0)];
          if (((8'hae) ?
              $unsigned({reg120[(1'h1):(1'h0)]}) : {$signed(((8'hb7) < $signed(reg120)))}))
            begin
              reg121 <= ((!$signed((^~wire109))) - wire107);
              reg122 <= wire107;
            end
          else
            begin
              reg121 <= wire108;
            end
          reg123 <= (&(wire107[(1'h0):(1'h0)] ?
              (({reg121} != $unsigned(wire116)) - $unsigned(wire114[(4'hf):(4'hb)])) : (^reg122[(1'h0):(1'h0)])));
          reg124 <= reg119;
        end
      else
        begin
          if ({{$signed($signed(reg121)), (8'hbe)}})
            begin
              reg120 <= wire106;
              reg121 <= (!wire112[(1'h0):(1'h0)]);
              reg122 <= $unsigned(wire107);
              reg123 <= reg122;
              reg124 <= ($unsigned((((wire114 ?
                          (8'ha4) : reg122) || (wire110 || wire115)) ?
                      $unsigned($signed((8'ha4))) : $unsigned((~&reg120)))) ?
                  ($signed((-(wire112 ?
                      reg124 : wire106))) <= ($signed((&wire108)) >>> wire112)) : wire107);
            end
          else
            begin
              reg120 <= (|(^~$signed(reg121[(4'h8):(4'h8)])));
              reg121 <= $unsigned((((+reg119[(4'ha):(2'h3)]) & $unsigned(wire113[(1'h0):(1'h0)])) ?
                  (&(wire112[(4'h8):(1'h1)] ?
                      (wire112 | wire112) : $unsigned(wire111))) : (wire110[(4'hb):(2'h3)] << $signed(wire115))));
            end
          if ($signed($signed((($signed((8'h9d)) ^ wire111) | (^~$signed(wire113))))))
            begin
              reg125 <= (8'hae);
              reg126 <= ({wire109,
                  $unsigned(wire112[(2'h2):(2'h2)])} == $unsigned((^~wire110[(4'ha):(4'ha)])));
              reg127 <= wire115[(4'hb):(2'h3)];
              reg128 <= wire112;
            end
          else
            begin
              reg125 <= wire113[(3'h7):(2'h3)];
              reg126 <= (!reg127[(2'h2):(2'h2)]);
              reg127 <= $unsigned($signed(($unsigned(wire109[(4'h8):(1'h1)]) + (wire113[(2'h2):(1'h1)] < reg128))));
              reg128 <= (~|reg128[(2'h3):(1'h1)]);
            end
        end
    end
  assign wire129 = (8'hbe);
  assign wire130 = (8'ha4);
  assign wire131 = ({reg124[(1'h1):(1'h1)]} ? (8'hbe) : wire107);
  assign wire132 = (!(reg121[(1'h0):(1'h0)] <= (~^reg126)));
  assign wire133 = $signed((wire131[(1'h1):(1'h0)] ?
                       reg126[(3'h7):(1'h1)] : wire131[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg134 <= (^{wire110, reg126});
      reg135 <= $signed(reg126[(3'h5):(1'h0)]);
      if ((({$unsigned(reg124[(4'hf):(4'hf)]),
              (((8'ha6) >>> reg123) == $unsigned(wire108))} < (reg125 ?
              (~&(reg124 ? reg128 : reg127)) : $unsigned($signed(wire109)))) ?
          ((($unsigned(reg126) ?
              $unsigned(reg135) : wire109[(1'h0):(1'h0)]) | {wire109}) || $unsigned((~^(&wire129)))) : (&reg125[(1'h1):(1'h0)])))
        begin
          if (wire130)
            begin
              reg136 <= ($signed(reg128[(2'h3):(2'h3)]) & ((($signed(reg128) ?
                      wire111 : wire114) ?
                  $signed((reg135 ^~ wire129)) : ({reg121, wire109} ?
                      $unsigned(reg120) : reg119)) && (({reg127, reg124} ?
                      (reg121 <<< wire133) : (~^wire117)) ?
                  $signed((|(8'hb0))) : $unsigned((reg121 ?
                      wire132 : wire118)))));
              reg137 <= (+(~|(7'h40)));
              reg138 <= ((^~(+reg127)) ?
                  ($signed(($signed(reg120) + $signed(reg120))) <<< wire130) : ((7'h42) >>> $unsigned(((wire108 ?
                      wire111 : reg126) > (wire131 >= wire109)))));
            end
          else
            begin
              reg136 <= $unsigned($unsigned((-(wire133 ^~ (~&wire133)))));
              reg137 <= (reg137[(5'h11):(4'he)] ?
                  $signed((~|(((8'h9e) ?
                      wire129 : wire115) << $unsigned(reg120)))) : $unsigned(($unsigned((reg136 ?
                          (7'h42) : (8'hbc))) ?
                      $unsigned((reg136 ? wire114 : wire129)) : ((&reg125) ?
                          (|wire111) : (~^wire132)))));
              reg138 <= reg135;
              reg139 <= reg120;
              reg140 <= $signed(wire132[(1'h1):(1'h0)]);
            end
          reg141 <= (reg140[(5'h11):(4'ha)] ?
              (reg126 + reg123[(3'h4):(1'h1)]) : (reg120[(4'ha):(2'h3)] - $unsigned(($signed(reg139) && $unsigned(reg125)))));
          reg142 <= ((~|reg120[(4'ha):(1'h0)]) >>> $signed(({$unsigned(wire129)} ?
              (~|(reg120 ?
                  wire114 : wire117)) : $unsigned(wire114[(4'hf):(2'h2)]))));
          if ({(wire118[(4'hf):(2'h3)] ?
                  (+reg121[(4'he):(4'hc)]) : (((wire108 >= wire132) << reg134[(1'h1):(1'h1)]) ?
                      (^{reg136, wire108}) : reg136[(2'h2):(1'h0)]))})
            begin
              reg143 <= (+$signed(reg121[(1'h1):(1'h1)]));
              reg144 <= wire107;
              reg145 <= (~&((^$unsigned(reg125[(1'h0):(1'h0)])) < wire116));
              reg146 <= ($unsigned($signed(($signed((8'haa)) ?
                      wire112[(4'h9):(3'h5)] : (reg121 << reg144)))) ?
                  reg120[(4'ha):(4'h9)] : (reg121 >>> ((~|(~&reg142)) ?
                      (8'ha5) : {wire114, $signed((8'hb3))})));
              reg147 <= $signed($signed((wire133[(2'h2):(1'h1)] ?
                  reg145[(4'ha):(4'ha)] : $unsigned(wire112))));
            end
          else
            begin
              reg143 <= wire112[(2'h2):(1'h0)];
              reg144 <= (!(^~$signed($unsigned($unsigned(reg146)))));
              reg145 <= ($unsigned($unsigned($signed($signed(reg120)))) ?
                  reg121 : ((~^(8'hbb)) ^ wire110));
              reg146 <= (({{{reg142},
                          (reg122 != (8'ha7))}} == wire132[(1'h1):(1'h1)]) ?
                  $signed(wire129) : (~^($unsigned({wire112, wire108}) ?
                      $signed($unsigned(wire130)) : wire108[(5'h15):(4'hb)])));
              reg147 <= wire110;
            end
        end
      else
        begin
          reg136 <= reg138[(3'h6):(3'h6)];
          if (reg135)
            begin
              reg137 <= (^$signed($unsigned((^wire114[(1'h1):(1'h0)]))));
              reg138 <= wire115;
            end
          else
            begin
              reg137 <= (($signed(($unsigned((8'hbd)) * (reg125 ?
                      wire132 : reg128))) >> (+$unsigned((^~reg119)))) ?
                  wire111[(2'h3):(1'h0)] : $unsigned((8'hb2)));
              reg138 <= (reg137 << ($unsigned({reg128[(1'h0):(1'h0)],
                      $signed(reg138)}) ?
                  $signed(($unsigned(reg138) ?
                      (wire110 ~^ wire112) : $unsigned(reg124))) : reg147));
              reg139 <= wire117[(1'h0):(1'h0)];
            end
        end
    end
  assign wire148 = $signed((wire131 && ($unsigned($signed((7'h43))) - wire111[(1'h1):(1'h1)])));
  assign wire149 = (-reg136[(2'h2):(1'h1)]);
  assign wire150 = $signed({$unsigned(((wire111 ? reg137 : wire108) ?
                           reg128[(4'h9):(3'h6)] : (^~reg143)))});
  assign wire151 = $unsigned(wire130);
  always
    @(posedge clk) begin
      reg152 <= wire111[(2'h2):(1'h1)];
    end
  assign wire153 = (!(wire113[(2'h3):(1'h0)] ?
                       (~|(|(+(7'h40)))) : reg143[(3'h6):(2'h3)]));
  assign wire154 = $unsigned((+reg124[(5'h11):(3'h7)]));
  assign wire155 = (($unsigned($unsigned(wire150[(3'h5):(2'h2)])) - reg138) << (~^$unsigned({$signed(reg125)})));
endmodule
