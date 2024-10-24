module top
#(parameter param199 = (!((8'h9f) + ((8'hbc) ? (~|((8'had) >= (8'ha5))) : (((8'ha1) ? (7'h42) : (8'hb6)) & (-(8'h9d)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire198;
  wire [(5'h14):(1'h0)] wire197;
  wire signed [(4'hf):(1'h0)] wire195;
  wire signed [(5'h12):(1'h0)] wire193;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire20;
  assign y = {wire198,
                 wire197,
                 wire195,
                 wire193,
                 wire23,
                 wire22,
                 wire4,
                 wire5,
                 wire6,
                 wire20,
                 (1'h0)};
  assign wire4 = wire0[(1'h1):(1'h0)];
  assign wire5 = ($signed($signed(((!(8'hab)) >= (|wire0)))) ?
                     ((^(((7'h41) ? (8'hbc) : wire4) ?
                             $unsigned((8'hb1)) : {wire4, wire3})) ?
                         $signed(wire4[(4'hf):(4'hb)]) : $unsigned((+wire0))) : $signed(wire2[(2'h2):(1'h1)]));
  assign wire6 = (((^wire0[(3'h5):(1'h0)]) ?
                     ((wire4 ? (~&(8'ha2)) : wire3) ?
                         $unsigned($signed((8'hb6))) : ($signed(wire3) ?
                             wire0[(2'h2):(1'h0)] : $signed(wire3))) : (((8'had) && wire3) ?
                         (wire2 & {wire5, wire2}) : ({wire2,
                             (7'h42)} & $unsigned(wire0)))) == ($unsigned($unsigned((8'hbe))) ?
                     ($unsigned($signed(wire2)) ^ $signed($signed(wire4))) : $signed({(wire2 ?
                             wire3 : wire5),
                         (wire1 ? wire5 : wire5)})));
  module7 #() modinst21 (.wire8(wire1), .y(wire20), .wire10(wire2), .wire9(wire3), .clk(clk), .wire11(wire6), .wire12(wire0));
  assign wire22 = $signed(wire5);
  assign wire23 = $unsigned(wire6[(4'hb):(4'hb)]);
  module24 #() modinst194 (wire193, clk, wire0, wire4, wire3, wire6);
  module167 #() modinst196 (wire195, clk, wire20, wire2, wire22, wire3);
  assign wire197 = (wire195 ?
                       (-{(8'h9d),
                           {(wire193 ?
                                   wire195 : wire23)}}) : $unsigned((~|$unsigned({(8'hb7)}))));
  assign wire198 = wire195;
endmodule

module module24
#(parameter param192 = (^~(+{(8'haa), ({(8'ha1)} > (^~(8'h9c)))})))
(y, clk, wire25, wire26, wire27, wire28);
  output wire [(32'h3af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire191;
  wire signed [(4'h9):(1'h0)] wire190;
  wire signed [(5'h13):(1'h0)] wire189;
  wire signed [(4'he):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire186;
  wire [(4'h8):(1'h0)] wire166;
  wire signed [(4'h8):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire42;
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg158 = (1'h0);
  reg [(4'he):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire186,
                 wire166,
                 wire149,
                 wire144,
                 wire113,
                 wire111,
                 wire98,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire29,
                 wire42,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
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
                 reg132,
                 reg131,
                 reg130,
                 reg129,
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
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg112,
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
                 (1'h0)};
  assign wire29 = ($unsigned(wire25[(1'h1):(1'h0)]) != wire26[(3'h5):(3'h5)]);
  module30 #() modinst43 (wire42, clk, wire28, wire25, wire29, wire26, wire27);
  module44 #() modinst64 (wire63, clk, wire27, wire26, wire28, wire25);
  assign wire65 = wire25[(4'hf):(1'h0)];
  assign wire66 = ({$signed({$unsigned(wire28)})} ?
                      ({(&(wire26 << wire28))} ?
                          (~&$unsigned(wire63)) : ((^~(wire42 ?
                              wire28 : wire26)) < wire25[(4'ha):(2'h3)])) : ($signed((8'hbb)) ?
                          ($unsigned($unsigned(wire26)) ?
                              (((7'h41) ? (8'h9c) : wire63) ?
                                  (~&wire63) : wire65[(3'h6):(1'h0)]) : ((~wire65) | $signed(wire65))) : wire65[(3'h6):(2'h3)]));
  assign wire67 = (~$unsigned((|wire27[(1'h1):(1'h1)])));
  assign wire68 = wire42[(2'h2):(1'h1)];
  module69 #() modinst99 (wire98, clk, wire27, wire65, wire66, wire42);
  always
    @(posedge clk) begin
      if (((wire28[(5'h13):(4'hc)] ^~ ($unsigned(wire27) != $signed($unsigned(wire42)))) < wire67[(4'h8):(2'h2)]))
        begin
          reg100 <= $signed($unsigned(wire26[(2'h2):(1'h1)]));
          reg101 <= wire66;
          reg102 <= wire65[(2'h2):(2'h2)];
          if (wire63)
            begin
              reg103 <= (~^($signed((wire26 ?
                  $unsigned((8'ha0)) : $unsigned((8'hb1)))) - (~^{(wire98 ?
                      reg100 : wire66)})));
              reg104 <= $signed(wire63);
              reg105 <= (wire68 ?
                  wire29[(4'ha):(3'h5)] : {(((-reg100) ?
                              $unsigned(wire98) : (reg103 ? wire67 : wire67)) ?
                          wire25 : {(wire42 ? wire66 : wire42),
                              $signed(reg104)}),
                      (8'hbd)});
              reg106 <= (^~$unsigned(($unsigned((wire67 <= (8'ha9))) ?
                  $unsigned((8'hb1)) : $signed((wire66 ? reg105 : wire29)))));
            end
          else
            begin
              reg103 <= (-wire66[(3'h6):(1'h0)]);
              reg104 <= $unsigned(wire65[(5'h11):(1'h1)]);
              reg105 <= (reg102[(4'hb):(4'hb)] && (8'hbd));
            end
        end
      else
        begin
          reg100 <= ($signed(($signed(wire26) ?
              $unsigned(wire42[(4'hf):(4'hd)]) : ($unsigned(wire67) ?
                  $unsigned(wire98) : ((7'h43) ?
                      wire66 : reg103)))) ~^ $signed(wire29));
        end
      if (wire29)
        begin
          reg107 <= wire65[(1'h0):(1'h0)];
          reg108 <= (($signed((reg107 ?
                      $unsigned(reg107) : (reg102 ? (8'hba) : wire68))) ?
                  (^({wire42} ?
                      $signed(reg102) : (wire65 ~^ wire63))) : $unsigned($signed((reg107 << (8'hb9))))) ?
              wire98 : reg107[(4'hf):(4'hb)]);
        end
      else
        begin
          reg107 <= ((-(!(7'h42))) ? (^~(^(8'hb0))) : wire65);
          reg108 <= wire67[(4'h9):(1'h1)];
        end
      reg109 <= reg108;
      reg110 <= reg108[(2'h3):(1'h0)];
    end
  assign wire111 = (&wire98[(4'he):(2'h2)]);
  always
    @(posedge clk) begin
      reg112 <= reg108[(3'h4):(2'h3)];
    end
  assign wire113 = (|$signed((wire68 ?
                       {(~&wire66), $unsigned(wire67)} : wire25)));
  always
    @(posedge clk) begin
      if ({(8'hb8)})
        begin
          if ({reg107[(3'h5):(2'h2)],
              (+($unsigned(wire63) == (~&wire66[(1'h0):(1'h0)])))})
            begin
              reg114 <= $signed($signed(reg112));
              reg115 <= ({(reg110[(4'hc):(3'h4)] - $signed($signed(wire67)))} ?
                  {($unsigned($signed(wire66)) & ($signed((8'hab)) ?
                          (+wire27) : $signed(reg106)))} : ((!(|(wire111 + reg114))) ?
                      reg101 : $unsigned((~&(wire29 ? wire111 : (8'h9c))))));
            end
          else
            begin
              reg114 <= wire68;
              reg115 <= $signed((wire67 ?
                  (((^~reg101) || wire68[(1'h1):(1'h0)]) * wire63[(2'h3):(1'h0)]) : $signed(($unsigned((8'hb6)) * (wire66 ?
                      wire42 : wire68)))));
              reg116 <= reg104[(1'h1):(1'h1)];
              reg117 <= (|((7'h43) == wire63[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg114 <= wire98[(1'h1):(1'h0)];
          if ($signed((wire67 ?
              $unsigned({$unsigned(wire66)}) : {$unsigned((+wire63))})))
            begin
              reg115 <= $signed((~(wire65[(3'h7):(1'h0)] ?
                  {$signed(wire68), wire28[(5'h15):(2'h3)]} : (&(reg115 ?
                      wire25 : reg109)))));
              reg116 <= (8'hb1);
              reg117 <= wire42[(4'hb):(3'h7)];
            end
          else
            begin
              reg115 <= reg103[(2'h2):(2'h2)];
            end
        end
      if ({(reg106 ?
              $signed($signed((wire113 ?
                  wire28 : wire27))) : reg108[(1'h0):(1'h0)])})
        begin
          if ({(^(wire113[(4'ha):(4'ha)] ^ (^~((8'hb5) ? wire42 : reg106))))})
            begin
              reg118 <= (($unsigned(wire63) ^ $unsigned(wire98)) * reg114[(4'ha):(1'h1)]);
              reg119 <= $unsigned($signed($unsigned($signed(reg105))));
              reg120 <= wire66[(1'h1):(1'h1)];
              reg121 <= (wire28 ?
                  reg120[(4'he):(1'h0)] : $unsigned($signed($unsigned({reg110}))));
              reg122 <= (^~(8'ha9));
            end
          else
            begin
              reg118 <= $signed($unsigned($unsigned(((reg105 ^~ wire27) ?
                  ((8'haf) ? reg119 : wire113) : reg117[(4'hd):(4'hd)]))));
              reg119 <= (reg106 >>> ({(8'h9e),
                  ((8'hac) - (reg112 ? wire29 : reg119))} + ($signed(reg119) ?
                  $signed((reg119 ?
                      reg110 : reg103)) : $unsigned($signed(reg100)))));
              reg120 <= $unsigned($signed(reg117[(4'hd):(2'h3)]));
            end
          reg123 <= reg122;
          reg124 <= ($signed($signed($unsigned(((8'had) ^ (8'haf))))) ?
              $signed((wire27[(4'h8):(3'h7)] + (!((8'hbd) <= reg119)))) : $unsigned((wire42[(5'h12):(2'h2)] == $signed((reg106 ?
                  (8'ha7) : wire68)))));
        end
      else
        begin
          reg118 <= (wire25 == $unsigned(reg115[(4'h9):(3'h7)]));
          if ((reg118[(2'h2):(1'h0)] ?
              (wire63 ?
                  reg103[(1'h0):(1'h0)] : {({reg124,
                          reg116} < (wire98 > wire113))}) : reg100[(3'h4):(2'h2)]))
            begin
              reg119 <= (wire28[(3'h7):(1'h0)] ?
                  ($unsigned($signed($unsigned(reg100))) ?
                      (^~{reg105}) : $signed($unsigned((&reg121)))) : ((^~$signed((wire65 + (8'ha7)))) == $signed($unsigned((wire42 && wire28)))));
              reg120 <= reg117;
              reg121 <= reg122;
              reg122 <= (8'hbc);
              reg123 <= reg106[(1'h1):(1'h0)];
            end
          else
            begin
              reg119 <= ($signed((~$signed($unsigned(wire26)))) >>> {((&(wire29 ?
                      (7'h42) : reg119)) | wire65),
                  reg119});
              reg120 <= (&(8'ha8));
              reg121 <= (((^~$unsigned($unsigned(reg115))) < (8'hbb)) ?
                  $unsigned(({reg122[(1'h1):(1'h1)]} ?
                      ((wire68 != reg101) > reg105) : (((8'haa) || wire42) > (wire27 == wire29)))) : reg124[(1'h1):(1'h1)]);
              reg122 <= reg107;
              reg123 <= (wire66 ?
                  wire63 : ($signed(reg121[(5'h12):(2'h3)]) ?
                      (~^reg123[(3'h4):(2'h3)]) : (8'hb9)));
            end
          reg124 <= reg107[(4'hb):(3'h6)];
          reg125 <= {(reg107 ?
                  ((|(wire25 > reg106)) ?
                      reg110 : (reg121[(4'hc):(3'h4)] ?
                          reg106[(1'h1):(1'h1)] : (reg119 >= (8'hb7)))) : $signed(((wire68 ?
                          reg108 : (8'hab)) ?
                      $unsigned((8'hb6)) : $unsigned(reg110))))};
          reg126 <= reg100[(3'h6):(2'h2)];
        end
      if ($signed({$unsigned(reg101),
          (($signed(wire65) ? (reg101 >> reg118) : (~reg122)) ?
              wire25[(2'h2):(2'h2)] : {$unsigned(reg117)})}))
        begin
          if ($signed((&($signed(wire65) ?
              ((reg107 <<< (8'hb1)) ?
                  (8'h9c) : $unsigned((8'ha9))) : $signed(reg106)))))
            begin
              reg127 <= $signed(((~^$signed((&reg125))) ?
                  ($unsigned((wire98 ~^ wire42)) ?
                      ((&reg125) ?
                          (~&reg123) : {reg108}) : (reg100[(2'h2):(2'h2)] <= $unsigned(wire42))) : {$unsigned((reg108 ?
                          (8'hb4) : reg105))}));
            end
          else
            begin
              reg127 <= $signed((reg108[(1'h1):(1'h0)] ?
                  reg124 : $signed($unsigned(wire29[(4'h9):(3'h5)]))));
              reg128 <= (reg108 && {({$unsigned((8'ha5))} & reg110[(4'hc):(1'h0)]),
                  ($signed(((8'hae) ? reg122 : (8'hbd))) ?
                      $signed((&wire68)) : reg100[(4'he):(4'hb)])});
              reg129 <= (8'h9c);
              reg130 <= $unsigned((wire42 || $unsigned(wire27[(4'hf):(4'hd)])));
              reg131 <= ($signed($signed((~|{reg117, reg124}))) ?
                  ((((reg100 ? (8'hba) : (8'haa)) >>> $unsigned(reg105)) ?
                          $unsigned((~^wire111)) : {$unsigned(reg108),
                              (wire27 ? wire26 : (8'hb4))}) ?
                      reg112 : (reg124 ?
                          $signed($unsigned(wire98)) : $signed($unsigned(reg108)))) : (reg125 ?
                      $unsigned(((reg121 ? reg103 : wire25) ?
                          (|reg101) : (wire27 ? wire113 : reg129))) : (reg128 ?
                          $signed(reg125) : ((~&(8'had)) & reg128))));
            end
          if ((-(~(~&((reg105 ~^ reg114) ? wire98 : (|(8'hb8)))))))
            begin
              reg132 <= $unsigned(reg123[(2'h2):(2'h2)]);
              reg133 <= reg118;
              reg134 <= ((7'h43) ?
                  (!(reg105[(4'hc):(4'hb)] >= (~|$signed(reg118)))) : reg102[(4'hb):(3'h7)]);
              reg135 <= $signed((~$unsigned($unsigned((reg128 ?
                  reg102 : reg116)))));
              reg136 <= reg116;
            end
          else
            begin
              reg132 <= $unsigned(reg108[(2'h3):(1'h0)]);
              reg133 <= (($unsigned((8'hac)) ?
                      $unsigned(wire98) : (^($signed(reg109) ~^ reg102[(3'h6):(3'h4)]))) ?
                  (reg136[(2'h3):(2'h3)] ?
                      reg128 : $unsigned($unsigned((wire68 << wire66)))) : {reg128[(2'h3):(2'h2)]});
            end
          if ((reg128 ? reg120[(4'ha):(3'h5)] : (!wire66[(3'h5):(1'h1)])))
            begin
              reg137 <= reg101[(2'h3):(1'h0)];
              reg138 <= $signed(($signed((^$unsigned(wire65))) > $unsigned($signed(reg127[(3'h5):(3'h4)]))));
              reg139 <= reg124[(1'h1):(1'h0)];
              reg140 <= (~wire111);
              reg141 <= (reg136 ^~ (reg102 ?
                  reg118 : $signed({reg138[(4'hb):(3'h5)], (-reg136)})));
            end
          else
            begin
              reg137 <= reg118;
              reg138 <= (wire68[(4'he):(4'he)] ~^ (+($signed((reg131 ?
                      reg104 : reg133)) ?
                  wire66 : ((7'h44) ? wire66 : {reg108}))));
              reg139 <= (~^$signed({$unsigned(reg132[(1'h1):(1'h1)])}));
            end
          reg142 <= (8'hb8);
          reg143 <= $unsigned((8'had));
        end
      else
        begin
          reg127 <= $unsigned((8'ha3));
          reg128 <= reg135[(2'h2):(1'h0)];
        end
    end
  assign wire144 = $signed(reg106[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg145 <= (reg107 ?
          (($unsigned(wire29) < (|(-(8'hb9)))) == (^~{{reg106}})) : $signed((+$signed($signed(reg134)))));
      reg146 <= (((~^$unsigned((reg105 ?
          reg133 : wire27))) | ($unsigned((reg116 ?
          reg117 : reg104)) ^ (reg115 >> reg135[(2'h3):(1'h0)]))) <<< reg101[(2'h2):(1'h0)]);
      reg147 <= reg138;
      reg148 <= ((reg147[(2'h3):(1'h0)] ?
              reg103[(1'h1):(1'h1)] : $unsigned(((8'ha9) | reg112))) ?
          ($unsigned($unsigned($signed(reg118))) ?
              ($unsigned({reg120}) && (^~$unsigned(wire25))) : $signed((&reg140[(2'h2):(1'h0)]))) : (+(8'ha5)));
    end
  assign wire149 = ({((reg128 ?
                               $signed((7'h40)) : (reg136 ?
                                   wire28 : (7'h42))) << (wire144[(3'h6):(3'h5)] - reg100[(2'h2):(1'h1)]))} ?
                       (reg105 << $unsigned(wire26)) : $unsigned(reg127[(4'h8):(3'h6)]));
  always
    @(posedge clk) begin
      if ($signed(({(reg118[(2'h3):(2'h3)] ?
              $signed(reg115) : (reg138 ? reg146 : reg114))} | wire26)))
        begin
          reg150 <= $signed(($unsigned((+((8'h9d) <= wire144))) ?
              (7'h41) : wire111));
          if ({(|reg131[(3'h7):(2'h2)])})
            begin
              reg151 <= ($signed((^({wire98} ?
                  (reg125 <= reg145) : $signed(reg106)))) | reg102);
              reg152 <= {(reg132 <= $signed($signed((reg123 - reg118))))};
              reg153 <= (~^reg138);
              reg154 <= reg151[(4'h9):(2'h3)];
            end
          else
            begin
              reg151 <= ($signed(reg118[(2'h3):(1'h1)]) ?
                  (~$unsigned($unsigned(reg148))) : (^~reg116));
              reg152 <= reg119[(1'h1):(1'h0)];
              reg153 <= (~^$unsigned(($signed($unsigned(reg140)) ?
                  $signed(reg153[(2'h2):(2'h2)]) : $unsigned((~&reg124)))));
              reg154 <= {(~^reg123)};
              reg155 <= (wire67[(4'hb):(4'hb)] * ($signed($signed((&(8'hab)))) - {(8'h9c),
                  (~|reg121[(5'h12):(5'h11)])}));
            end
          reg156 <= $signed((~reg152[(3'h4):(1'h0)]));
          reg157 <= {reg120, (~&$signed(reg109[(3'h4):(3'h4)]))};
        end
      else
        begin
          reg150 <= wire66;
        end
      reg158 <= $signed($signed(reg135[(2'h2):(1'h0)]));
      reg159 <= wire42;
      if ((~^($unsigned(($signed(reg106) ?
              $signed(reg128) : {(8'ha0), reg129})) ?
          reg143[(1'h1):(1'h0)] : wire67)))
        begin
          reg160 <= reg155;
          reg161 <= (wire67[(2'h3):(1'h0)] && $unsigned($unsigned(({(8'ha8)} ?
              (reg140 ? reg120 : reg133) : wire149[(3'h4):(2'h3)]))));
          reg162 <= (!$signed((~^$unsigned((wire29 ? reg150 : reg131)))));
          reg163 <= ((^~(wire63 - ((reg151 & reg121) || $signed((8'hbb))))) ?
              {$signed({{(8'ha3)},
                      (reg139 ? wire63 : reg157)})} : reg114[(3'h5):(1'h0)]);
          reg164 <= $unsigned((!($unsigned(((7'h42) ?
              (8'hb6) : reg155)) != $unsigned(reg155))));
        end
      else
        begin
          reg160 <= ({$signed(reg146)} <= reg100);
          if ($unsigned(($unsigned((-(~&reg103))) == wire113[(3'h6):(3'h4)])))
            begin
              reg161 <= (((((~&reg122) ? (8'hbd) : (^~(7'h40))) ?
                  ((reg100 == reg138) ?
                      (reg160 >> reg120) : $unsigned(reg159)) : reg150) > $unsigned(($unsigned(wire25) ?
                  (~^reg106) : reg124[(1'h1):(1'h0)]))) >>> {(reg135[(1'h1):(1'h0)] ~^ $signed((wire149 ^~ reg108)))});
              reg162 <= (reg107[(3'h6):(3'h6)] ?
                  reg160 : ((reg100[(3'h7):(1'h0)] <<< (8'ha3)) ?
                      (((reg147 != reg158) ^ ((8'ha4) ?
                          reg158 : reg116)) && reg160) : wire42));
              reg163 <= (($unsigned((wire113 - reg118[(2'h3):(2'h3)])) ?
                      {{(!reg109)},
                          ((^~reg153) == (^~reg120))} : ($signed({(8'hb4)}) ?
                          ((wire28 ? wire149 : (8'ha9)) ?
                              (reg164 == reg155) : (~^reg155)) : reg110)) ?
                  ({wire27} ?
                      reg141 : ((~$unsigned(reg100)) ?
                          (&(wire28 ?
                              (8'ha9) : reg158)) : $signed(wire65))) : (8'h9f));
              reg164 <= $signed(reg135[(1'h1):(1'h1)]);
            end
          else
            begin
              reg161 <= $unsigned($signed(reg100));
              reg162 <= reg147;
              reg163 <= reg151;
            end
        end
      reg165 <= reg108[(1'h1):(1'h1)];
    end
  assign wire166 = (reg124 ~^ wire26);
  module167 #() modinst187 (wire186, clk, reg160, reg148, reg153, reg107);
  assign wire188 = {($unsigned((|(wire25 ? (8'hb7) : reg136))) ?
                           {(~&((7'h41) ? reg163 : reg129)),
                               (^~(^~reg162))} : (wire67[(3'h6):(3'h5)] << $signed(reg101)))};
  assign wire189 = (!reg122);
  assign wire190 = ((reg123[(5'h12):(4'hb)] == ($signed(reg147) ?
                           ((reg105 ? reg138 : reg155) ?
                               reg101[(3'h5):(3'h4)] : ((8'hb2) ?
                                   reg114 : (8'ha8))) : ($unsigned(wire29) ^ (reg127 ?
                               reg157 : reg137)))) ?
                       {reg127, reg134[(2'h2):(1'h0)]} : reg123);
  assign wire191 = reg108;
endmodule

module module7
#(parameter param18 = (~|((|(((8'ha5) ? (8'h9c) : (8'haa)) ^ (!(8'hbb)))) ? (~&(((8'h9d) ^ (7'h40)) ? ((8'hbf) ? (8'hb3) : (8'ha9)) : ((7'h42) | (7'h40)))) : {((~(8'hb7)) ^~ (-(8'hb8))), (((8'ha2) ? (8'hbc) : (8'ha2)) ? (-(8'hb2)) : {(8'ha5), (8'hb0)})})), 
parameter param19 = {(param18 - (^~({param18} ^ (8'hab)))), (8'hbc)})
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  assign y = {wire17, wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = wire12[(1'h0):(1'h0)];
  assign wire14 = (^~(~&(^~(~(wire12 ? wire8 : (8'ha8))))));
  assign wire15 = $unsigned($signed(wire9));
  assign wire16 = ((wire9 >> (wire10[(3'h6):(1'h1)] >>> ((wire8 ~^ wire8) ^~ wire14[(2'h2):(2'h2)]))) >> $signed($unsigned(wire14)));
  assign wire17 = ($unsigned(({$signed(wire12),
                          wire14} != {wire15[(2'h3):(1'h0)]})) ?
                      $signed(wire14) : ((+(~&wire14)) ?
                          wire16[(4'he):(4'he)] : wire15[(1'h0):(1'h0)]));
endmodule

module module167  (y, clk, wire171, wire170, wire169, wire168);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire171;
  input wire signed [(5'h14):(1'h0)] wire170;
  input wire [(4'hc):(1'h0)] wire169;
  input wire [(4'he):(1'h0)] wire168;
  wire signed [(4'hf):(1'h0)] wire185;
  wire signed [(5'h10):(1'h0)] wire184;
  wire [(2'h3):(1'h0)] wire183;
  wire [(3'h7):(1'h0)] wire175;
  wire [(5'h10):(1'h0)] wire174;
  wire [(4'ha):(1'h0)] wire173;
  wire [(3'h7):(1'h0)] wire172;
  reg [(4'hc):(1'h0)] reg182 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg180 = (1'h0);
  reg [(5'h12):(1'h0)] reg179 = (1'h0);
  reg [(5'h13):(1'h0)] reg178 = (1'h0);
  reg [(3'h6):(1'h0)] reg177 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  assign wire172 = ((~|$signed(($unsigned(wire168) ~^ $unsigned(wire169)))) ?
                       $unsigned({(wire168 >>> {wire170,
                               wire168})}) : wire169[(3'h6):(3'h6)]);
  assign wire173 = (((wire169 ?
                               (8'ha3) : ((wire169 ? wire172 : (8'h9f)) ?
                                   (-wire169) : (wire168 & wire170))) ?
                           (^$signed((~wire170))) : {($signed(wire172) << {wire168,
                                   wire169}),
                               {((8'hb7) ? wire170 : wire172), (!wire172)}}) ?
                       ($signed(((wire170 - wire168) ?
                               $signed(wire171) : $signed(wire169))) ?
                           wire171[(3'h4):(2'h3)] : wire168) : $signed(($unsigned(wire168[(4'hd):(4'ha)]) ?
                           wire168[(3'h6):(2'h2)] : $signed($signed(wire168)))));
  assign wire174 = ($signed((~&{$signed(wire172)})) * (^~wire169[(2'h3):(2'h3)]));
  assign wire175 = {$unsigned($signed((^~wire173[(1'h0):(1'h0)]))),
                       $signed($signed(((wire169 ? wire169 : wire171) ?
                           $signed(wire174) : (~|wire173))))};
  always
    @(posedge clk) begin
      reg176 <= (wire175 ?
          (8'hab) : ((($unsigned(wire172) >= (wire173 ^~ (8'h9f))) ?
              ($unsigned(wire170) < wire168) : wire174[(2'h2):(1'h0)]) ^~ ((|(wire169 ?
              wire172 : wire174)) == $unsigned($signed((8'hb4))))));
      if ((wire171 & $unsigned(wire172[(3'h5):(3'h5)])))
        begin
          if ((((-$unsigned((~^reg176))) ?
                  (^~((wire171 >> wire172) ?
                      (wire171 <<< wire169) : (-wire174))) : $unsigned(wire172[(3'h7):(3'h6)])) ?
              (~$signed(((wire172 ?
                  wire171 : wire175) <<< (wire168 >>> reg176)))) : (wire172 ?
                  $unsigned((wire175[(2'h2):(1'h0)] ?
                      wire168 : ((8'hb3) ?
                          wire168 : (7'h42)))) : ((&(+wire170)) ?
                      (!(~wire168)) : wire170[(3'h6):(3'h5)]))))
            begin
              reg177 <= (~$signed($unsigned((-wire174[(4'hb):(3'h4)]))));
              reg178 <= wire171[(4'hd):(3'h6)];
              reg179 <= $unsigned($unsigned(wire171[(4'h8):(3'h7)]));
              reg180 <= (-{wire171});
              reg181 <= ({$unsigned({reg176, reg178[(4'h8):(2'h2)]})} ?
                  wire168[(1'h0):(1'h0)] : $unsigned(((!wire173) >>> wire170)));
            end
          else
            begin
              reg177 <= wire171[(4'hc):(4'h9)];
              reg178 <= $signed(wire173);
            end
          reg182 <= reg178;
        end
      else
        begin
          reg177 <= wire173[(2'h2):(2'h2)];
          reg178 <= (reg178[(3'h5):(1'h0)] && wire171);
        end
    end
  assign wire183 = ({($unsigned(wire169[(3'h5):(1'h1)]) ?
                               ({reg177,
                                   wire171} && wire170[(4'hf):(4'hd)]) : wire171)} ?
                       (~&wire171) : $unsigned($signed($signed((~^reg182)))));
  assign wire184 = $signed((~|{wire183[(1'h1):(1'h1)],
                       $unsigned($signed(reg182))}));
  assign wire185 = (reg176 + reg177);
endmodule

module module69
#(parameter param96 = (((({(8'hb0)} ? ((8'hb4) ? (7'h43) : (8'hb0)) : ((8'ha4) ? (8'hb0) : (8'hac))) ? ({(8'ha7)} ? {(8'ha7), (8'ha5)} : ((8'hbe) * (8'h9f))) : ((8'hb4) ? (&(8'hba)) : ((8'hbc) ? (8'h9f) : (8'ha5)))) ? ({(~&(8'hb8)), ((8'hbe) << (8'hb2))} | (^((8'ha8) - (8'hb4)))) : (({(8'hb7), (8'ha2)} ? ((8'hb5) & (8'hb5)) : (^(8'hb4))) ^~ ({(7'h42)} + ((8'had) >> (8'hb8))))) ? (((((8'h9f) ? (8'ha6) : (8'hb1)) ~^ {(8'hb8), (8'hbc)}) ? (~(+(8'h9d))) : (((8'ha9) != (8'hb0)) ? (^~(8'ha9)) : ((8'hac) ? (8'hb2) : (7'h41)))) ? (8'hb3) : (((!(8'ha2)) - (-(8'haf))) && (-((8'ha2) ? (8'hb2) : (8'ha7))))) : ((7'h40) ? (~|(~|(|(8'hbb)))) : (((~^(8'hbc)) + ((8'ha1) ? (8'hb8) : (8'hbb))) ~^ (-((8'hba) ? (8'hae) : (8'ha2)))))), 
parameter param97 = param96)
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire73;
  input wire [(5'h11):(1'h0)] wire72;
  input wire [(3'h7):(1'h0)] wire71;
  input wire [(4'hf):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire74;
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire86,
                 wire85,
                 wire84,
                 wire74,
                 reg88,
                 reg87,
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
  assign wire74 = ({$signed(wire70[(4'he):(4'hc)])} ?
                      $unsigned((~|(~|(wire70 == wire73)))) : $unsigned((wire73 ^ (|$unsigned(wire73)))));
  always
    @(posedge clk) begin
      if ($signed($signed(wire73)))
        begin
          if ($unsigned($signed(wire73[(2'h2):(1'h1)])))
            begin
              reg75 <= (wire70 | $unsigned(wire72));
            end
          else
            begin
              reg75 <= wire73;
            end
          reg76 <= wire70[(4'he):(1'h1)];
          if (reg76[(5'h10):(3'h4)])
            begin
              reg77 <= wire71[(2'h2):(1'h0)];
              reg78 <= (~&wire72[(2'h3):(1'h0)]);
            end
          else
            begin
              reg77 <= (^{$unsigned($unsigned($unsigned((8'hb9))))});
              reg78 <= $unsigned((&wire70));
              reg79 <= ((reg78[(5'h12):(4'hc)] ?
                  $signed((wire71[(2'h2):(1'h0)] ?
                      (reg77 ^~ wire72) : $unsigned((8'hb0)))) : reg78[(3'h6):(2'h2)]) >= wire71[(3'h7):(3'h4)]);
              reg80 <= (!((8'hb6) ?
                  (($signed(reg78) ^ (wire74 - wire74)) ?
                      ((~|wire70) ?
                          $unsigned(wire73) : reg79) : $unsigned((8'haf))) : ((^$unsigned(reg75)) ?
                      wire74 : $unsigned(((8'hb3) || (8'hb5))))));
              reg81 <= $signed(wire71[(2'h3):(2'h3)]);
            end
          reg82 <= wire70[(3'h6):(3'h6)];
          reg83 <= wire73[(2'h3):(2'h2)];
        end
      else
        begin
          reg75 <= $signed($unsigned($signed(({reg76} ?
              $signed(wire74) : {(8'hb2), reg82}))));
          reg76 <= reg76;
        end
    end
  assign wire84 = reg81;
  assign wire85 = $signed((reg78 ^ $unsigned($signed(wire72[(3'h4):(2'h2)]))));
  assign wire86 = $signed($signed((wire84 ? {$signed(reg77)} : (^{reg80}))));
  always
    @(posedge clk) begin
      reg87 <= (({reg78,
          reg82[(2'h3):(2'h3)]} && reg83[(2'h3):(2'h2)]) >> {wire84});
      reg88 <= ((^{$unsigned((&(7'h40))), wire72}) ?
          $signed(($unsigned((!wire71)) ?
              ({wire73} ? (~^wire85) : (-reg87)) : wire85)) : (wire85 ?
              $signed($unsigned((^~reg79))) : (reg82 == reg82)));
    end
  assign wire89 = $unsigned((wire86 < reg83[(4'h9):(2'h3)]));
  assign wire90 = reg88;
  assign wire91 = reg88[(4'h8):(1'h0)];
  assign wire92 = {((-wire85) >= reg79[(1'h1):(1'h0)]), wire73[(1'h1):(1'h0)]};
  assign wire93 = (~&(($signed((!wire71)) ?
                          wire90[(5'h10):(4'hb)] : $unsigned(reg80)) ?
                      (~|wire74[(4'h9):(4'h9)]) : ($unsigned((reg83 ?
                              wire89 : wire71)) ?
                          ((7'h41) ? $signed(wire74) : reg76) : {reg87})));
  assign wire94 = (!(reg82 ? $unsigned(reg88[(1'h0):(1'h0)]) : reg88));
  assign wire95 = reg88;
endmodule

module module44
#(parameter param61 = {(({(-(8'ha4)), {(8'h9e)}} ? {((8'ha6) ~^ (8'h9c))} : (((8'hac) ? (7'h41) : (8'ha3)) ? ((8'hb5) > (8'h9e)) : ((8'hb6) > (8'ha5)))) * (({(8'ha1)} ? ((8'ha9) * (8'h9e)) : ((8'ha3) <= (8'hb9))) >= (+{(8'haa)})))}, 
parameter param62 = ((-param61) ^~ param61))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire [(4'he):(1'h0)] wire47;
  input wire [(5'h15):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire51,
                 wire50,
                 wire49,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire49 = $signed(wire45);
  assign wire50 = wire49[(3'h4):(1'h1)];
  assign wire51 = wire49[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg52 <= {wire49[(1'h0):(1'h0)], wire47};
      if ((+((({wire50} ? (reg52 >= (8'ha0)) : wire47[(3'h6):(3'h6)]) ?
              (wire46 ?
                  $signed(wire47) : wire49) : ($unsigned(wire49) >= reg52[(3'h4):(1'h1)])) ?
          $signed(((+wire46) ^ (wire45 ?
              wire47 : wire46))) : ($unsigned((wire51 == wire48)) ?
              (^~wire48[(2'h3):(2'h3)]) : $signed((^wire46))))))
        begin
          if (wire50)
            begin
              reg53 <= $signed((7'h41));
              reg54 <= (wire46[(3'h6):(1'h0)] - (($unsigned(((8'hb0) && wire50)) ?
                      (reg52[(4'h9):(2'h3)] | wire46) : $signed($unsigned((8'ha4)))) ?
                  ($unsigned({wire49}) ?
                      $unsigned((wire50 & wire49)) : reg53[(4'h9):(3'h4)]) : (reg53[(4'h8):(3'h4)] >>> wire47)));
              reg55 <= ($signed(wire47) ?
                  $signed(wire45[(5'h13):(5'h12)]) : (({wire47} <<< {$signed((8'ha5)),
                      (8'hb0)}) <<< ((!$unsigned(wire45)) >> (8'h9e))));
              reg56 <= (~wire50);
            end
          else
            begin
              reg53 <= (&{wire45[(4'hd):(4'hd)], $signed((8'hb6))});
              reg54 <= $signed($unsigned(((reg52 ?
                  wire47 : $signed((8'had))) << {(wire48 || (8'h9c))})));
              reg55 <= wire45[(4'hf):(1'h1)];
              reg56 <= $unsigned(({((wire48 & (8'ha0)) ~^ (+wire45))} && (^~reg54)));
            end
          reg57 <= reg56[(1'h0):(1'h0)];
          reg58 <= $unsigned($unsigned(reg57));
        end
      else
        begin
          if ($signed($signed((!(^~(-wire47))))))
            begin
              reg53 <= ($signed((~|(^~(wire47 < wire48)))) | wire47[(2'h2):(1'h1)]);
              reg54 <= wire47[(4'hb):(3'h4)];
              reg55 <= $signed((!(~wire49)));
              reg56 <= wire47;
            end
          else
            begin
              reg53 <= $signed($unsigned((^reg55)));
              reg54 <= ($signed((~&{reg52, wire48})) ?
                  $signed(reg52) : (reg55[(2'h3):(1'h1)] - reg58[(1'h0):(1'h0)]));
            end
          reg57 <= $signed(reg52[(1'h0):(1'h0)]);
        end
    end
  assign wire59 = {{$unsigned(((reg55 * reg53) | (8'hb2))),
                          (reg54[(4'ha):(2'h3)] ?
                              $unsigned(reg53[(4'h8):(3'h4)]) : ($signed((8'h9c)) ?
                                  $unsigned(wire50) : (^reg56)))}};
  assign wire60 = $unsigned($unsigned($unsigned(({(7'h41), reg52} ?
                      $unsigned(wire59) : wire59[(4'ha):(4'h8)]))));
endmodule

module module30
#(parameter param40 = (!{(-((^(8'had)) >> ((8'hb2) * (8'hb4)))), ({(8'hbe)} << (((8'hb9) ? (8'h9e) : (8'hb9)) ? (^(8'hab)) : ((7'h44) ? (8'ha6) : (8'ha9))))}), 
parameter param41 = ({param40} ~^ ({((param40 ? param40 : param40) + (|param40))} && (~|({param40} >>> (8'hbc))))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  assign y = {wire39, wire38, wire37, wire36, (1'h0)};
  assign wire36 = (((wire33[(5'h10):(3'h7)] ?
                          ($signed(wire32) >>> (wire31 ?
                              (7'h43) : wire32)) : wire32[(3'h6):(1'h1)]) ?
                      {({wire32} == wire34),
                          ((^wire33) <<< $unsigned(wire33))} : {$unsigned((^(8'hae))),
                          (&((8'had) ?
                              (8'hb2) : wire31))}) || (wire33[(5'h13):(5'h12)] ?
                      ($unsigned(wire32[(4'hc):(3'h7)]) ?
                          $unsigned((wire35 + wire33)) : (&(~wire32))) : $unsigned(wire35[(3'h7):(2'h3)])));
  assign wire37 = (|({(wire34[(1'h0):(1'h0)] | $signed(wire34))} ?
                      wire35[(5'h10):(4'h8)] : $signed((wire33[(4'hd):(4'hb)] != (wire32 ?
                          wire32 : (8'hae))))));
  assign wire38 = $unsigned($signed({wire37[(3'h5):(2'h3)],
                      $signed((|wire37))}));
  assign wire39 = (wire38 ?
                      (wire38[(3'h5):(3'h5)] ?
                          wire36[(1'h0):(1'h0)] : wire33) : $unsigned(((^~(wire37 ?
                              wire36 : wire38)) ?
                          $unsigned(wire38[(2'h2):(2'h2)]) : $signed((wire32 || (8'h9f))))));
endmodule
