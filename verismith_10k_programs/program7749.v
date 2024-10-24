module top
#(parameter param173 = ((|((((8'hb5) ? (8'hb3) : (7'h44)) + ((8'ha3) != (8'hb9))) <<< (((8'hac) - (7'h42)) ^ ((8'hb2) && (8'h9e))))) ? (~((((8'ha0) ~^ (8'hbd)) ^ ((8'hb7) ? (8'ha9) : (8'hb0))) ^ ({(8'hbc), (8'ha9)} >> {(7'h42)}))) : ((((^~(8'hbf)) ? (~(8'h9d)) : ((8'hb2) ? (8'hbf) : (8'hb8))) == {{(8'haa), (8'hb7)}, ((8'had) ? (8'hb3) : (8'ha9))}) >= (((-(8'ha9)) ? (^(8'hb2)) : {(8'ha4), (8'hbc)}) != (((8'hbb) ? (8'hb6) : (8'ha8)) << ((8'h9f) | (8'hb7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire5;
  assign y = {wire171, wire85, wire84, wire83, wire81, wire5, (1'h0)};
  assign wire5 = {(8'hba)};
  module6 #() modinst82 (wire81, clk, wire5, wire4, wire0, wire1);
  assign wire83 = (((wire0[(3'h6):(2'h2)] < $unsigned(wire1[(3'h6):(3'h4)])) <= ($unsigned((7'h40)) ?
                          {$unsigned((7'h41))} : wire1[(3'h7):(2'h3)])) ?
                      $unsigned(wire5[(3'h7):(3'h7)]) : (8'h9e));
  assign wire84 = wire0[(4'ha):(3'h5)];
  assign wire85 = ($unsigned(wire2) == (7'h42));
  module86 #() modinst172 (wire171, clk, wire84, wire0, wire81, wire1);
endmodule

module module86
#(parameter param170 = (8'hbf))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h25c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire90;
  input wire [(3'h6):(1'h0)] wire89;
  input wire [(5'h15):(1'h0)] wire88;
  input wire [(4'h9):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire169;
  wire signed [(4'hb):(1'h0)] wire168;
  wire signed [(5'h15):(1'h0)] wire167;
  wire signed [(2'h3):(1'h0)] wire166;
  wire signed [(3'h6):(1'h0)] wire165;
  wire [(5'h10):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire134;
  wire signed [(4'ha):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire130;
  wire [(2'h2):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg127,
                 (1'h0)};
  assign wire91 = $unsigned(wire90[(3'h6):(1'h0)]);
  assign wire92 = ($signed(wire89) ?
                      $unsigned($unsigned(wire88)) : wire88[(5'h13):(1'h0)]);
  assign wire93 = wire88;
  assign wire94 = (^~(($unsigned(wire87) ?
                          ($signed((8'hab)) || (wire90 + wire93)) : wire91[(1'h0):(1'h0)]) ?
                      $signed({wire90[(3'h6):(2'h2)],
                          (wire90 > (8'hb7))}) : wire89));
  always
    @(posedge clk) begin
      reg95 <= (|$signed($signed((wire90[(1'h0):(1'h0)] - $unsigned((8'ha0))))));
      reg96 <= wire93[(4'h8):(2'h3)];
      if ($unsigned({(~^(+(|wire90))),
          ($signed(wire87) ? (|reg96) : wire90[(4'h9):(1'h0)])}))
        begin
          reg97 <= {$signed(($unsigned($unsigned(wire93)) ^ (reg96[(3'h4):(1'h0)] || reg95))),
              ({$signed(((8'hb4) ?
                      (8'hbb) : reg95))} * (&wire93[(4'hc):(3'h6)]))};
          reg98 <= $unsigned({reg96});
          reg99 <= {wire88[(4'hf):(4'he)]};
          reg100 <= (^$signed(((reg96 ?
              {wire94} : {reg97, wire92}) * $unsigned(((8'h9c) ?
              (8'hac) : wire92)))));
          reg101 <= (!(~wire89[(1'h0):(1'h0)]));
        end
      else
        begin
          if (($unsigned(($unsigned(wire93) ~^ (wire92[(4'he):(4'h8)] ?
                  (-reg100) : {reg95, wire89}))) ?
              (reg98[(5'h11):(4'h9)] ^ {$signed($unsigned((8'h9d)))}) : ({($signed(reg101) ?
                      wire88[(2'h3):(1'h1)] : wire91)} == $signed($unsigned($unsigned(reg101))))))
            begin
              reg97 <= $unsigned((~|wire91[(2'h3):(2'h2)]));
              reg98 <= (&wire89[(2'h3):(2'h2)]);
            end
          else
            begin
              reg97 <= wire91[(3'h6):(1'h1)];
              reg98 <= ($unsigned($signed(((^wire87) * (wire91 >> wire92)))) + (~|(^((wire89 && wire88) ?
                  (reg97 ? wire94 : wire90) : reg98[(5'h13):(3'h4)]))));
              reg99 <= {wire87};
            end
          reg100 <= ($unsigned({{$unsigned((8'hb5))}}) || ({$signed({wire90,
                  reg100}),
              $unsigned({(8'h9e), reg100})} | $unsigned($unsigned(wire90))));
          reg101 <= ((+((^~wire94[(1'h1):(1'h0)]) <<< ((reg99 ?
                  wire93 : wire87) != reg101[(3'h4):(1'h0)]))) ?
              wire88 : $unsigned(({{reg97, reg95}, $unsigned(wire88)} ?
                  reg95[(1'h1):(1'h0)] : $unsigned($unsigned(wire90)))));
          reg102 <= $signed(($signed((((8'hb0) ?
              (8'h9d) : reg98) > reg95[(2'h3):(1'h0)])) >>> {($unsigned(reg99) < (reg98 + wire93))}));
        end
    end
  always
    @(posedge clk) begin
      reg103 <= wire87[(1'h1):(1'h0)];
      reg104 <= $signed($signed(reg101));
      reg105 <= $signed($signed($signed(reg100)));
      if (({{((reg96 ? reg103 : (8'hb9)) >> {wire91})}} ?
          {$unsigned(((reg101 < (8'ha3)) > reg104[(2'h2):(2'h2)])),
              $unsigned({wire89})} : (({(reg104 ? reg96 : wire91),
                  $signed(wire90)} == reg97[(4'ha):(2'h3)]) ?
              ($unsigned(reg105[(3'h6):(3'h4)]) <= $signed((wire89 && wire89))) : (~|((reg96 + reg99) ?
                  (wire90 && wire92) : (reg102 && (8'hbb)))))))
        begin
          if (wire87[(3'h5):(3'h4)])
            begin
              reg106 <= wire88;
              reg107 <= $unsigned($signed(wire93[(4'hb):(4'h8)]));
            end
          else
            begin
              reg106 <= $unsigned($signed($signed(reg105)));
            end
          if ($signed((reg96 > {((reg105 ?
                  wire92 : (8'ha9)) >= (reg96 ^ reg104)),
              reg98[(4'he):(2'h3)]})))
            begin
              reg108 <= (^~$signed(wire92));
              reg109 <= $signed($signed((-reg100)));
              reg110 <= (reg109[(4'hc):(4'h8)] > reg102);
              reg111 <= (^$signed(wire92[(4'he):(4'ha)]));
            end
          else
            begin
              reg108 <= wire89[(3'h4):(2'h2)];
              reg109 <= (wire90 ~^ (~^$unsigned(((reg100 ? reg95 : wire94) ?
                  reg108 : $signed(reg106)))));
              reg110 <= reg95;
              reg111 <= {(reg98 >> ((8'ha8) >> reg104))};
            end
        end
      else
        begin
          reg106 <= ({(^reg109),
              {wire89[(2'h3):(2'h3)],
                  (|$unsigned(reg108))}} + $unsigned((reg99[(3'h4):(1'h0)] <= ((reg109 > reg107) <= reg111))));
          if (((~&(reg102 ? reg107 : (8'haa))) ?
              (reg110 || $unsigned((8'ha6))) : ((reg99[(3'h6):(3'h4)] - reg102) >= (((&wire87) ?
                  {(8'hb2)} : ((8'hb0) ?
                      wire87 : wire91)) | {reg104[(3'h4):(2'h3)]}))))
            begin
              reg107 <= ($unsigned($signed((reg97 ?
                  $signed(reg111) : $signed(reg95)))) + {reg110[(2'h3):(2'h2)],
                  reg110});
              reg108 <= (|({(^~(reg102 ? wire93 : (8'hac))),
                  (+((8'ha5) ?
                      wire87 : reg110))} >> (($unsigned(wire93) <= (|wire93)) ?
                  (reg97 < {reg102, (8'hb8)}) : $signed($unsigned(reg107)))));
              reg109 <= (|(((reg110 >= reg103) > (+(^(8'hbf)))) ?
                  reg100[(1'h1):(1'h0)] : $signed(wire91[(3'h6):(1'h0)])));
            end
          else
            begin
              reg107 <= (&$signed(($unsigned($signed(reg110)) + ($unsigned(wire94) >> reg98))));
            end
        end
      if (reg96)
        begin
          reg112 <= $unsigned((reg111[(1'h0):(1'h0)] ?
              (reg102[(3'h7):(3'h7)] >>> reg99[(1'h1):(1'h1)]) : wire91));
        end
      else
        begin
          reg112 <= ($signed(reg108[(3'h4):(1'h1)]) << reg109);
          reg113 <= (~^({($signed(reg99) ?
                      $unsigned(wire91) : reg105[(4'h8):(4'h8)]),
                  {$signed(wire87), (reg99 || wire90)}} ?
              reg97[(5'h10):(4'hd)] : reg107));
          reg114 <= reg106;
          if ($signed(reg97[(4'hf):(1'h0)]))
            begin
              reg115 <= (~(!$unsigned($signed(reg110[(4'h9):(2'h3)]))));
              reg116 <= reg113[(5'h10):(1'h1)];
            end
          else
            begin
              reg115 <= $signed($signed($unsigned($unsigned((|(8'hba))))));
              reg116 <= ({$signed(((reg107 ? reg105 : reg100) ?
                          ((8'hb0) ? reg104 : reg114) : ((8'hba) != reg114))),
                      {(^~{reg113, reg105})}} ?
                  reg114 : $unsigned(((reg116 ^~ (reg108 ? wire87 : reg111)) ?
                      reg112 : reg107[(4'ha):(3'h6)])));
            end
          reg117 <= (reg105[(2'h2):(2'h2)] ?
              reg104[(2'h3):(2'h2)] : reg110[(2'h2):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg118 <= ({($unsigned($unsigned(reg97)) ?
              $unsigned($signed(reg112)) : reg96[(1'h1):(1'h0)])} == ($signed((reg106 ~^ wire93[(3'h5):(1'h1)])) ~^ $signed(($signed(reg96) ?
          (reg115 ? wire88 : reg113) : $signed((8'haa))))));
      reg119 <= reg111;
      reg120 <= reg118;
      if ((~|(|$unsigned(wire89))))
        begin
          if ($signed((~^reg97)))
            begin
              reg121 <= $signed(reg115[(1'h1):(1'h1)]);
              reg122 <= reg101[(2'h2):(1'h1)];
              reg123 <= $unsigned(reg99);
              reg124 <= ($signed(reg108[(4'h8):(2'h3)]) ?
                  $unsigned((~|$unsigned((~&reg114)))) : $unsigned(reg99[(4'h9):(1'h1)]));
              reg125 <= (-reg103);
            end
          else
            begin
              reg121 <= reg107[(3'h6):(2'h3)];
              reg122 <= (~|reg106);
            end
        end
      else
        begin
          reg121 <= ((7'h44) ?
              ((~&{(reg107 ? reg121 : reg120),
                  reg108[(3'h4):(3'h4)]}) >>> (($unsigned(reg112) | wire87[(3'h6):(2'h2)]) ?
                  $signed($signed(reg96)) : reg120[(3'h5):(1'h1)])) : (|($signed(reg103) ?
                  reg104[(1'h1):(1'h0)] : (~|$unsigned(reg111)))));
        end
    end
  assign wire126 = (reg117[(3'h4):(2'h3)] & reg124);
  always
    @(posedge clk) begin
      reg127 <= (|reg111[(2'h2):(1'h1)]);
    end
  assign wire128 = (+($signed(reg114) ?
                       ($unsigned({reg102, reg100}) < ($unsigned(reg104) ?
                           (wire126 == wire126) : $signed(reg106))) : (((&reg107) ?
                           (reg120 ?
                               (7'h41) : wire90) : $signed(wire90)) | reg120)));
  assign wire129 = (reg112[(2'h3):(1'h0)] >= (reg102[(4'h9):(2'h3)] < $signed(((~^reg107) * reg127[(4'h8):(4'h8)]))));
  assign wire130 = (reg115 ?
                       wire94[(2'h3):(2'h3)] : {{{(reg106 ? (7'h44) : wire90),
                                   ((8'h9f) < (8'hbd))}},
                           (+{(reg115 && reg111), (reg117 || reg124)})});
  assign wire131 = wire92[(4'hd):(1'h1)];
  assign wire132 = $signed(($signed($signed((~&reg118))) ?
                       $signed(wire91) : (~^((+wire89) ?
                           $unsigned(reg104) : (!(8'ha2))))));
  assign wire133 = (-reg115);
  assign wire134 = (wire89 >>> (reg95 - {reg123[(3'h4):(2'h2)]}));
  module135 #() modinst164 (.clk(clk), .wire138(reg112), .y(wire163), .wire136(wire90), .wire140(reg110), .wire139(wire88), .wire137(reg111));
  assign wire165 = wire133;
  assign wire166 = wire128;
  assign wire167 = $signed((reg105[(1'h0):(1'h0)] > (~|$signed(reg114))));
  assign wire168 = (8'haa);
  assign wire169 = reg121[(4'hc):(3'h4)];
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire22;
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
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
                 wire22,
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
                 (1'h0)};
  module11 #() modinst23 (wire22, clk, wire9, wire10, wire8, wire7, (7'h42));
  assign wire24 = (($unsigned((wire10[(3'h6):(1'h1)] ^~ {(8'ha9)})) <<< ({(|wire10),
                          wire8} - ($unsigned(wire7) ?
                          wire7[(4'hd):(2'h3)] : $signed(wire10)))) ?
                      (-(-(wire7[(5'h12):(4'hc)] ?
                          $unsigned((8'ha3)) : (8'hbd)))) : $unsigned($unsigned({wire9})));
  assign wire25 = (^~{wire22[(1'h1):(1'h1)], (^$signed((^~wire9)))});
  assign wire26 = ((((^~wire8[(4'h9):(4'h9)]) ?
                          (wire24 < (8'ha8)) : wire24[(4'h8):(3'h5)]) ?
                      $unsigned(wire9[(4'he):(4'hd)]) : {((~|wire7) ?
                              $signed(wire7) : (8'hae))}) & $signed(wire10));
  assign wire27 = ($unsigned($signed($signed($unsigned(wire7)))) ^ $signed((!(8'hbb))));
  assign wire28 = (~&(~(((wire9 ? (8'hb8) : wire25) * {(8'hbe)}) ?
                      (~^(wire25 ? wire7 : wire22)) : ((wire7 ?
                          (8'hba) : wire8) * $unsigned(wire26)))));
  assign wire29 = $signed(wire26[(3'h5):(1'h0)]);
  assign wire30 = (wire8[(4'hf):(4'h9)] ?
                      wire7 : {(({wire24, (8'hb0)} ?
                                  (wire29 & (8'ha2)) : ((7'h43) * (8'hbc))) ?
                              (((7'h41) ?
                                  wire9 : wire7) >> $unsigned((8'hac))) : ($signed(wire9) >> (wire27 ?
                                  wire10 : wire29)))});
  assign wire31 = ($signed(wire24) >> wire27);
  assign wire32 = wire8;
  assign wire33 = wire27;
  assign wire34 = $signed($signed(($signed({wire9}) == $signed(wire26[(5'h11):(3'h6)]))));
  module35 #() modinst58 (.wire36(wire25), .wire37(wire33), .clk(clk), .wire39(wire30), .y(wire57), .wire38(wire7));
  assign wire59 = (~(!wire26));
  assign wire60 = $signed(wire22[(1'h1):(1'h0)]);
  assign wire61 = wire27[(4'hb):(3'h6)];
  always
    @(posedge clk) begin
      if ($signed($signed($signed($unsigned((~^wire60))))))
        begin
          if ($unsigned({(&$signed(((8'hbe) >> wire32))), (8'ha2)}))
            begin
              reg62 <= $unsigned(wire34[(4'hd):(1'h0)]);
              reg63 <= $unsigned($unsigned(wire32[(5'h12):(4'h8)]));
              reg64 <= (~wire8);
            end
          else
            begin
              reg62 <= (($signed({wire22[(1'h0):(1'h0)]}) ?
                      (7'h41) : ((7'h42) ?
                          ($signed(wire30) ?
                              $unsigned(wire61) : (wire33 ^~ wire9)) : wire29)) ?
                  $signed($signed(wire32)) : $unsigned((-$unsigned(wire26))));
              reg63 <= wire34;
              reg64 <= (^$unsigned((({wire60, wire31} ^~ ((7'h41) <= wire10)) ?
                  ((wire32 ?
                      wire57 : (8'haa)) >>> wire29) : (~wire27[(4'hc):(4'ha)]))));
            end
          reg65 <= {wire29[(4'h8):(3'h7)]};
        end
      else
        begin
          reg62 <= {wire28[(1'h0):(1'h0)]};
          reg63 <= wire31;
        end
      if (($unsigned($signed((~^$signed(reg64)))) ?
          (~wire22[(2'h2):(1'h1)]) : (^$unsigned(reg63))))
        begin
          reg66 <= wire33;
          if (reg64[(1'h1):(1'h1)])
            begin
              reg67 <= ((-wire30[(2'h3):(2'h2)]) ?
                  $signed(wire60[(4'h9):(4'h8)]) : $unsigned((-$unsigned({wire8}))));
              reg68 <= (+(+$signed({((8'hb1) ? wire33 : reg64),
                  $unsigned(wire22)})));
              reg69 <= $unsigned(wire22[(2'h3):(2'h2)]);
            end
          else
            begin
              reg67 <= reg62;
              reg68 <= {(8'hbc)};
              reg69 <= ($signed(((-(reg63 | wire60)) >> ((|reg68) < {wire29,
                  (7'h42)}))) ^ wire31[(3'h4):(2'h3)]);
              reg70 <= (~&(&(wire24[(1'h0):(1'h0)] ^ ($unsigned(wire32) ?
                  wire9 : wire7))));
              reg71 <= ((wire60 ?
                      (~&({wire7, (8'hbf)} ?
                          wire31 : (wire24 ^~ reg68))) : (wire33 && {wire9,
                          $unsigned(reg65)})) ?
                  ($unsigned($signed({wire34,
                      wire29})) >> (|$unsigned(wire28))) : $signed(wire60[(5'h12):(3'h6)]));
            end
        end
      else
        begin
          if ($signed(((7'h40) ? (!wire34) : wire7)))
            begin
              reg66 <= reg70;
            end
          else
            begin
              reg66 <= wire24[(4'h8):(2'h3)];
              reg67 <= {$unsigned((reg62 ?
                      ((wire29 ?
                          reg63 : wire28) & wire57[(4'he):(3'h6)]) : $unsigned((reg68 ?
                          (8'ha2) : (8'hb2)))))};
              reg68 <= $unsigned(((!wire29[(3'h5):(3'h4)]) ?
                  ((reg62[(3'h7):(3'h7)] ?
                      wire24[(4'h8):(3'h6)] : wire61) ~^ {(wire30 ~^ reg65)}) : $unsigned($signed($signed(reg62)))));
              reg69 <= reg64;
              reg70 <= reg63;
            end
          if (wire61)
            begin
              reg71 <= wire31[(4'h8):(1'h1)];
              reg72 <= (($unsigned(reg71[(4'h8):(3'h7)]) ?
                  (!((reg66 ?
                      wire7 : (8'hb3)) & $unsigned(wire61))) : wire60) >> wire34);
              reg73 <= wire22;
              reg74 <= (((^~$signed(((8'ha7) >>> wire61))) <<< {(~^wire27),
                      $signed((-wire34))}) ?
                  wire7 : reg70);
            end
          else
            begin
              reg71 <= $unsigned({(wire33[(3'h6):(2'h3)] ?
                      {wire27[(5'h11):(3'h5)], (wire10 <= reg65)} : (~&wire32)),
                  (reg73 | ($signed((8'hb7)) ? wire10 : (wire57 >> reg62)))});
              reg72 <= wire25;
            end
        end
    end
  assign wire75 = wire31[(1'h0):(1'h0)];
  assign wire76 = (~((+$signed((wire60 ?
                      (8'hb8) : reg66))) + ($unsigned((wire24 ?
                          wire61 : wire32)) ?
                      wire27 : (wire22[(2'h2):(1'h0)] ?
                          $signed(wire60) : wire59[(1'h0):(1'h0)]))));
  assign wire77 = (&$signed((wire30[(1'h1):(1'h1)] ?
                      (~|$signed(reg68)) : (+(~|reg63)))));
  assign wire78 = (($unsigned((^(|reg65))) ?
                      $signed($signed(wire8)) : (wire27[(4'he):(2'h2)] ?
                          (^~(~|wire34)) : ((wire34 ?
                              reg67 : wire31) >>> $unsigned((8'h9e))))) != $unsigned((^~wire60[(1'h0):(1'h0)])));
  assign wire79 = (wire22[(1'h0):(1'h0)] ?
                      $unsigned((|wire77[(3'h7):(3'h4)])) : reg62);
  assign wire80 = (~^reg72[(3'h5):(2'h3)]);
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire [(4'hb):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire signed [(4'hb):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire40 = $unsigned($signed(((^~{wire39,
                      wire39}) >> (wire39[(4'h8):(1'h0)] <= $signed(wire38)))));
  assign wire41 = {($unsigned(wire36) ? $unsigned((&$signed(wire38))) : wire37),
                      ({($signed((7'h41)) ?
                                  $unsigned((8'h9c)) : $unsigned(wire37))} ?
                          wire40 : $unsigned(wire36))};
  assign wire42 = $signed(($signed(({wire36} == (wire41 != wire38))) >> (^~(-(wire38 ?
                      wire41 : wire40)))));
  assign wire43 = ((~|$signed(wire39[(4'hc):(3'h4)])) ?
                      wire37[(4'h9):(4'h9)] : $signed(wire42));
  assign wire44 = wire40;
  assign wire45 = wire43[(2'h2):(1'h0)];
  assign wire46 = ((-$signed($unsigned($unsigned(wire42)))) != $signed(wire45[(1'h0):(1'h0)]));
  assign wire47 = ($signed(wire46[(4'hb):(4'h8)]) ?
                      $unsigned((~|$signed((wire46 ?
                          wire46 : (8'ha1))))) : (8'haa));
  always
    @(posedge clk) begin
      reg48 <= $signed({wire39[(1'h1):(1'h1)],
          $signed($unsigned(wire44[(3'h5):(2'h2)]))});
      reg49 <= $unsigned({$signed($unsigned(wire46[(4'hf):(2'h3)])),
          ((~|(wire36 <= wire38)) ?
              ((|reg48) <<< wire45[(4'he):(4'he)]) : ((wire43 && wire39) * (~&(8'h9d))))});
      reg50 <= $signed((^~wire40[(4'hc):(3'h5)]));
    end
  assign wire51 = ($signed($signed((wire42 ?
                      {reg48} : (&wire38)))) < reg48[(2'h2):(2'h2)]);
  assign wire52 = wire39;
  assign wire53 = $unsigned({wire43[(1'h0):(1'h0)],
                      (({wire44, wire39} * $signed(wire41)) ?
                          reg49[(1'h1):(1'h0)] : wire38[(4'hb):(4'h9)])});
  assign wire54 = $unsigned(($unsigned((-$signed(wire46))) ~^ ($unsigned($signed((8'haa))) << wire47[(2'h2):(1'h1)])));
  assign wire55 = ((({reg50} ?
                          ($signed((8'ha4)) ?
                              (wire45 != wire45) : (7'h43)) : (8'h9f)) ?
                      (wire52 * ((~^wire46) ~^ {wire39,
                          wire38})) : $unsigned((~^(wire46 <= wire47)))) <<< ($signed(wire45) ^~ $signed({wire45[(3'h6):(3'h4)],
                      reg49[(2'h3):(2'h3)]})));
  assign wire56 = wire53[(1'h1):(1'h1)];
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = (wire16 && $signed($signed((8'hae))));
  assign wire18 = ($unsigned($unsigned(($unsigned(wire12) ^~ $unsigned(wire17)))) ?
                      wire15[(2'h3):(2'h3)] : $unsigned(wire12[(3'h4):(3'h4)]));
  assign wire19 = (^~$unsigned({($unsigned(wire15) ? wire13 : (8'hb4)),
                      ($signed(wire17) ? $unsigned(wire15) : (~&wire13))}));
  assign wire20 = wire12[(4'he):(2'h3)];
  assign wire21 = (($signed(wire19[(2'h2):(1'h0)]) || wire15[(4'h8):(1'h0)]) > (^wire13));
endmodule

module module135  (y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire140;
  input wire [(5'h13):(1'h0)] wire139;
  input wire signed [(4'he):(1'h0)] wire138;
  input wire signed [(4'h8):(1'h0)] wire137;
  input wire signed [(4'hc):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire162;
  wire signed [(5'h14):(1'h0)] wire161;
  wire [(4'he):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire156;
  wire signed [(5'h11):(1'h0)] wire155;
  wire [(2'h2):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire148;
  wire signed [(4'he):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire143;
  wire [(2'h2):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire157,
                 wire156,
                 wire155,
                 wire149,
                 wire148,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg159,
                 reg158,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire141 = $signed(((wire139 ?
                           (~^(~&wire139)) : $unsigned($signed((8'h9f)))) ?
                       ($signed(wire139[(4'h9):(1'h0)]) ?
                           ((+wire139) ?
                               (^(8'hbb)) : $unsigned(wire136)) : $signed((wire137 << wire138))) : $signed($unsigned((wire137 ?
                           wire138 : wire139)))));
  assign wire142 = $unsigned($signed(({(wire141 < (7'h41))} ?
                       {wire139[(5'h11):(4'h8)]} : ($unsigned(wire138) ?
                           wire139 : wire138))));
  assign wire143 = (wire141 >> (($signed((~&wire138)) ?
                       $unsigned((|wire141)) : wire137) == wire137));
  assign wire144 = (8'hb8);
  always
    @(posedge clk) begin
      reg145 <= $signed($signed((~^({wire136} + wire142[(1'h1):(1'h0)]))));
      reg146 <= $signed($unsigned(wire142));
      reg147 <= {($signed((8'ha8)) << (wire143[(3'h4):(3'h4)] ?
              $signed(wire142) : ((wire137 <<< wire137) ?
                  (+(8'hb3)) : $unsigned(wire139))))};
    end
  assign wire148 = $signed($signed({((wire136 ? wire143 : wire144) ?
                           (wire139 ? reg146 : wire140) : (~&reg145)),
                       (~|$unsigned(wire141))}));
  assign wire149 = (wire144[(4'hb):(3'h6)] > (-(wire136 ?
                       reg146 : $unsigned(reg145))));
  always
    @(posedge clk) begin
      reg150 <= {{wire144[(4'h8):(2'h2)]},
          (($unsigned(wire140[(5'h10):(3'h4)]) ?
              {(wire143 >> (8'hbe))} : ((wire144 <= wire138) ?
                  wire140 : (~|wire141))) == {((wire139 & wire149) | (wire142 * reg147)),
              wire137[(4'h8):(2'h2)]})};
      reg151 <= $signed($unsigned(wire140[(4'hb):(4'hb)]));
      reg152 <= ((|$unsigned(((reg147 >>> reg146) ?
              ((8'h9c) * reg150) : {reg146}))) ?
          (($signed(wire148) << $signed((wire143 - reg146))) ~^ (((~^wire144) ?
              (reg150 ?
                  wire140 : wire138) : $unsigned(wire140)) || $unsigned((~wire139)))) : {wire149,
              wire144});
      reg153 <= reg146;
      reg154 <= (wire148[(2'h2):(1'h0)] > wire138[(4'ha):(3'h4)]);
    end
  assign wire155 = ($signed(({reg151[(1'h0):(1'h0)], (&(8'hb0))} ?
                       {$unsigned(wire142)} : (~&{wire137}))) < $unsigned($unsigned(reg150)));
  assign wire156 = reg150;
  assign wire157 = (((reg153 ? reg147 : $signed((wire148 ? wire141 : reg153))) ?
                           {((7'h41) ?
                                   (reg154 ?
                                       wire137 : reg147) : (reg154 << wire140)),
                               ($signed(reg153) ?
                                   wire138 : ((8'h9f) ?
                                       (8'ha4) : wire149))} : wire148[(2'h3):(2'h2)]) ?
                       {((wire136[(3'h4):(3'h4)] ?
                               ((8'ha3) ? reg150 : reg154) : (wire141 ?
                                   wire156 : reg154)) * $unsigned(reg154[(4'h8):(2'h3)]))} : reg151[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg158 <= $signed(wire155[(4'hb):(3'h4)]);
      reg159 <= ((reg150 ?
          reg158 : wire137[(4'h8):(3'h4)]) >= $unsigned({($unsigned(wire144) ?
              (wire143 ? reg150 : wire156) : $signed(reg152))}));
    end
  assign wire160 = {wire142[(1'h1):(1'h0)]};
  assign wire161 = $unsigned(wire157[(4'h8):(2'h3)]);
  assign wire162 = (!(reg153 ? wire141 : wire138));
endmodule
