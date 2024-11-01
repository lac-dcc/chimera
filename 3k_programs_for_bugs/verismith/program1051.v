module top
#(parameter param199 = ({((~(|(8'hb2))) & ((8'ha7) && {(8'h9f), (8'hbb)})), {(((8'ha6) ? (8'ha5) : (8'hb7)) | ((8'hba) != (8'hb3))), {{(8'h9f), (8'ha9)}, ((8'hbc) << (8'h9d))}}} <= ((~(~{(8'hae), (8'hb5)})) ? (!((~(8'ha4)) >>> (~|(8'hbf)))) : (|(|((8'hbc) ? (7'h42) : (8'ha3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire198;
  wire [(4'ha):(1'h0)] wire197;
  wire signed [(5'h11):(1'h0)] wire195;
  wire signed [(4'h8):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire193;
  reg [(4'hc):(1'h0)] reg192 = (1'h0);
  reg [(5'h14):(1'h0)] reg191 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire195,
                 wire187,
                 wire56,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire189,
                 wire193,
                 reg192,
                 reg191,
                 reg190,
                 reg59,
                 reg58,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ({((|$signed(wire0)) > ((8'ha9) ?
              (wire4 + wire1) : $signed(wire1)))} == (^(&($unsigned((8'h9d)) ?
          ((8'hbf) ^~ wire4) : $signed(wire0)))));
      reg6 <= {$signed(wire1[(3'h5):(3'h5)]),
          ($signed($signed(reg5)) == $unsigned($unsigned(wire1)))};
      reg7 <= $unsigned(wire0);
      if ({$signed($signed((reg7[(3'h5):(3'h5)] & $unsigned(reg5))))})
        begin
          reg8 <= $signed({($unsigned(wire0) ?
                  ($signed(wire3) ?
                      (wire0 ?
                          wire0 : wire4) : wire4[(3'h4):(2'h3)]) : ($unsigned((8'haa)) ^ $signed(wire4))),
              reg6});
          if ($signed($unsigned({{(&wire4), $signed(wire4)}})))
            begin
              reg9 <= (wire1[(3'h4):(3'h4)] ?
                  ((wire3 <= (reg7[(2'h2):(1'h1)] | (reg5 ?
                      reg7 : reg7))) ^~ $signed(((^~wire3) ?
                      (-(8'hb5)) : (&wire3)))) : (~|(~$unsigned(((8'had) ?
                      wire1 : wire2)))));
              reg10 <= wire0[(1'h1):(1'h1)];
              reg11 <= $unsigned($signed(wire0[(1'h1):(1'h0)]));
              reg12 <= reg8[(3'h4):(1'h0)];
            end
          else
            begin
              reg9 <= wire3[(1'h0):(1'h0)];
            end
          if ((^(7'h40)))
            begin
              reg13 <= $unsigned(reg12);
              reg14 <= wire2[(4'h9):(3'h6)];
              reg15 <= $signed(reg7);
              reg16 <= $unsigned($signed($signed(reg14)));
              reg17 <= $unsigned($signed((($signed(reg8) ^~ (~&(8'hbc))) <<< reg7[(4'h8):(2'h2)])));
            end
          else
            begin
              reg13 <= wire0[(2'h3):(2'h3)];
              reg14 <= reg6;
              reg15 <= (~reg6[(1'h1):(1'h1)]);
            end
          reg18 <= reg12[(3'h4):(2'h3)];
          if ((((&(+((8'hbb) != reg13))) ? (8'hb8) : (!$signed((~reg16)))) ?
              (&wire3[(1'h1):(1'h1)]) : reg8))
            begin
              reg19 <= $unsigned(($unsigned(reg15) <= reg13[(4'hb):(4'hb)]));
            end
          else
            begin
              reg19 <= {reg9, reg13};
              reg20 <= reg7[(1'h1):(1'h1)];
              reg21 <= $unsigned(reg5[(2'h3):(1'h1)]);
              reg22 <= (8'hab);
            end
        end
      else
        begin
          reg8 <= $unsigned((reg11 | $signed($unsigned(reg15[(3'h4):(1'h0)]))));
          reg9 <= ((8'hb5) + (^(($signed(reg7) != $unsigned(reg22)) ?
              (^(wire1 > reg14)) : $signed($signed(reg16)))));
        end
    end
  assign wire23 = reg20[(3'h5):(2'h3)];
  assign wire24 = reg20[(4'ha):(4'ha)];
  assign wire25 = wire24[(3'h7):(1'h1)];
  assign wire26 = ((~&(^~{((8'hba) ? reg19 : (8'ha1))})) > ((8'hba) ?
                      (wire25 ~^ ({reg5} & (wire24 - reg18))) : (~^$unsigned({(8'hb1),
                          reg12}))));
  module27 #() modinst57 (.y(wire56), .wire31(wire3), .wire29(reg20), .clk(clk), .wire32(reg12), .wire28(wire1), .wire30(reg7));
  always
    @(posedge clk) begin
      reg58 <= $signed(reg11);
      reg59 <= {($signed((reg16[(3'h6):(2'h2)] + {wire24})) ? (8'ha7) : reg7),
          wire2[(3'h7):(3'h7)]};
    end
  module60 #() modinst188 (wire187, clk, wire24, wire4, reg17, reg6, wire1);
  assign wire189 = {((reg10[(1'h0):(1'h0)] ?
                           reg7[(2'h2):(1'h1)] : $unsigned($signed(wire187))) > reg14[(1'h1):(1'h1)]),
                       $signed((~^(8'h9e)))};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed(((reg5 << wire2) - (8'hb5))))))
        begin
          reg190 <= $signed((-$signed({wire24[(4'hb):(3'h4)]})));
          reg191 <= reg6;
          reg192 <= (^~$unsigned(reg22));
        end
      else
        begin
          reg190 <= wire4[(3'h7):(3'h5)];
          if ((8'haa))
            begin
              reg191 <= $unsigned((reg12[(4'h8):(3'h6)] ?
                  wire25[(4'h9):(3'h7)] : ($signed($unsigned(reg16)) ?
                      $signed((reg22 == wire1)) : reg192)));
              reg192 <= (~reg19);
            end
          else
            begin
              reg191 <= (($signed({(~|reg14)}) ^ reg8[(3'h4):(1'h0)]) ?
                  (|$unsigned($signed(reg12))) : (&$signed(reg7[(5'h12):(1'h0)])));
            end
        end
    end
  module60 #() modinst194 (.wire62(wire25), .clk(clk), .wire65(reg10), .y(wire193), .wire64(reg192), .wire63(wire187), .wire61(wire2));
  module67 #() modinst196 (wire195, clk, reg191, wire2, reg19, wire26);
  assign wire197 = $unsigned(reg191[(5'h10):(4'hb)]);
  assign wire198 = reg16[(2'h2):(2'h2)];
endmodule

module module60  (y, clk, wire61, wire62, wire63, wire64, wire65);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire61;
  input wire [(5'h14):(1'h0)] wire62;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire [(4'hc):(1'h0)] wire64;
  input wire signed [(4'hb):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire186;
  wire [(2'h3):(1'h0)] wire185;
  wire signed [(5'h11):(1'h0)] wire178;
  wire [(3'h5):(1'h0)] wire177;
  wire [(5'h13):(1'h0)] wire176;
  wire signed [(4'he):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire173;
  reg [(5'h10):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg180 = (1'h0);
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire66,
                 wire117,
                 wire119,
                 wire120,
                 wire121,
                 wire173,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 (1'h0)};
  assign wire66 = $signed($unsigned(($signed((wire64 ?
                      (8'hb2) : wire61)) - $signed((wire61 ?
                      wire64 : wire64)))));
  module67 #() modinst118 (wire117, clk, wire62, wire66, wire61, wire64);
  assign wire119 = {(~|(~&$unsigned((wire66 & (8'hb6)))))};
  assign wire120 = wire62[(3'h6):(1'h1)];
  assign wire121 = (8'h9d);
  always
    @(posedge clk) begin
      reg122 <= $unsigned(wire63[(3'h4):(2'h2)]);
      if (wire121[(2'h3):(2'h2)])
        begin
          reg123 <= wire119[(2'h2):(1'h0)];
          reg124 <= ((~&wire65[(4'h8):(1'h0)]) & ((!($unsigned(wire61) <= ((8'haa) ?
                  wire120 : reg123))) ?
              wire61 : {((reg123 >> wire62) == wire121[(1'h0):(1'h0)]),
                  $signed((wire117 < wire62))}));
          reg125 <= (((wire61[(4'hd):(1'h0)] && ($signed(wire64) ?
                      (~^wire62) : (reg124 ? wire117 : wire65))) ?
                  $unsigned($signed($unsigned(wire61))) : wire121[(4'ha):(3'h7)]) ?
              $signed(wire65) : $unsigned((($signed(reg122) - wire62) < reg123)));
        end
      else
        begin
          reg123 <= wire64[(3'h7):(3'h7)];
          if (({(wire63[(1'h0):(1'h0)] < {wire66[(4'hf):(3'h5)],
                      $unsigned(reg122)}),
                  wire119} ?
              $unsigned(({(-reg123),
                  wire119[(1'h1):(1'h0)]} ~^ $signed($unsigned(reg125)))) : wire66[(3'h4):(1'h1)]))
            begin
              reg124 <= $signed(wire61);
              reg125 <= ($unsigned($unsigned(((reg124 >= (8'hbf)) ^~ (wire61 ?
                      (8'hb3) : wire121)))) ?
                  (reg122 ?
                      (^~$unsigned((reg122 && wire65))) : $unsigned(wire121[(3'h4):(2'h2)])) : ($signed(reg125) ?
                      wire61[(2'h2):(1'h0)] : reg122));
              reg126 <= (!wire62[(4'he):(3'h5)]);
              reg127 <= ($unsigned(wire121) <<< $signed(reg123));
            end
          else
            begin
              reg124 <= wire121;
            end
          reg128 <= $signed($signed($signed($unsigned({wire64, reg127}))));
          reg129 <= ((~^((+{wire64, wire117}) ?
              reg128[(2'h3):(2'h3)] : $signed(wire65[(2'h3):(2'h2)]))) != ({(~&(reg126 - wire117)),
              wire121[(1'h0):(1'h0)]} + (((-wire65) ?
                  $unsigned(wire65) : ((8'hbd) ? wire117 : wire63)) ?
              ((&reg122) ?
                  wire66[(2'h3):(2'h2)] : wire121[(2'h3):(2'h3)]) : $unsigned($unsigned(wire120)))));
        end
      reg130 <= $unsigned(reg127);
    end
  module131 #() modinst174 (.wire133(wire65), .clk(clk), .y(wire173), .wire132(wire62), .wire135(reg129), .wire134(wire66));
  assign wire175 = $unsigned(wire117[(1'h1):(1'h1)]);
  assign wire176 = ((^~{($signed(wire62) ? $signed(wire173) : (8'h9c)),
                           ((reg128 ? reg128 : (7'h40)) ?
                               (~wire61) : wire173[(4'hb):(4'ha)])}) ?
                       ((($unsigned(reg124) ?
                               (reg127 ?
                                   wire119 : wire117) : $signed(wire117)) >> reg130) ?
                           $unsigned(reg125) : (reg128[(2'h3):(2'h2)] ?
                               $signed({(7'h41)}) : $signed(wire64))) : (~|{((wire173 ?
                                   reg122 : wire117) ?
                               $signed(wire119) : (wire62 | wire63))}));
  assign wire177 = ((wire175 ?
                       (^~wire66) : (8'h9e)) - $signed((^$unsigned(reg129))));
  assign wire178 = reg123;
  always
    @(posedge clk) begin
      reg179 <= wire178[(3'h4):(1'h0)];
      reg180 <= ($signed(reg128) << (&(($signed(wire176) ?
          {wire117} : (~(8'hba))) * wire178[(4'h8):(4'h8)])));
      if ({{(~$unsigned(reg124)), (wire178[(4'he):(1'h1)] <<< wire121)},
          {(wire175[(2'h3):(2'h2)] ?
                  (wire176[(5'h12):(2'h2)] ?
                      wire177[(2'h3):(2'h3)] : (^~wire66)) : (|$unsigned(reg128))),
              {wire62[(4'hb):(2'h3)]}}})
        begin
          reg181 <= (-$unsigned(wire63[(2'h2):(1'h1)]));
          reg182 <= reg127;
          reg183 <= wire62[(5'h12):(4'hb)];
        end
      else
        begin
          reg181 <= wire61;
        end
      reg184 <= {reg126};
    end
  assign wire185 = ((|wire178[(4'h9):(3'h4)]) <<< reg184);
  assign wire186 = (((^($signed(wire65) && $signed(wire176))) ^ $signed($signed($signed(wire63)))) ^ wire120);
endmodule

module module27
#(parameter param55 = (((~(((7'h43) ? (8'h9c) : (8'hb9)) == ((8'ha1) >> (8'hb7)))) >>> ((^~((8'hb0) ? (8'hab) : (8'ha8))) ? (~{(8'ha9)}) : ((|(8'ha3)) ? ((8'hb1) >> (8'h9d)) : (8'hb9)))) > ({(~^((7'h44) ? (8'ha5) : (8'hac)))} >= {(((8'hac) + (8'hbb)) ? (~|(8'ha5)) : ((8'hae) == (8'ha0)))})))
(y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire53;
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  assign y = {wire33,
                 wire34,
                 wire35,
                 wire39,
                 wire40,
                 wire53,
                 reg36,
                 reg37,
                 reg38,
                 (1'h0)};
  assign wire33 = wire29[(5'h10):(4'h9)];
  assign wire34 = ($unsigned((~(~|$unsigned(wire28)))) >= ((!$unsigned((wire31 || (7'h44)))) ^~ wire29[(5'h11):(4'hb)]));
  assign wire35 = (+$signed((wire32[(3'h5):(1'h0)] ~^ $signed((wire29 ?
                      (8'hb5) : wire33)))));
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(((wire34 ? wire35 : wire32) | {wire32})) ?
          wire33 : wire33[(4'hb):(4'h8)])))
        begin
          reg36 <= $unsigned(($unsigned(($signed(wire32) << $signed(wire29))) ?
              wire32 : wire32));
        end
      else
        begin
          reg36 <= reg36[(3'h4):(2'h3)];
        end
      reg37 <= ($signed(wire35[(1'h1):(1'h0)]) ?
          (wire31[(1'h1):(1'h0)] & {$signed($unsigned((8'hb7)))}) : (~&wire31));
      reg38 <= wire33;
    end
  assign wire39 = ({$signed(wire31),
                      ($unsigned($signed(reg38)) ?
                          $unsigned((wire35 ?
                              wire29 : (8'hb3))) : $signed((^~wire28)))} != ($unsigned(wire33) ^ reg37));
  assign wire40 = wire31[(1'h0):(1'h0)];
  module41 #() modinst54 (.wire42(reg38), .clk(clk), .wire45(wire30), .wire44(wire31), .wire43(wire35), .y(wire53));
endmodule

module module41
#(parameter param52 = ((((((8'hab) | (8'ha4)) ? (&(8'h9f)) : {(8'ha6), (7'h43)}) << (((8'hb5) < (8'ha4)) - (^(8'had)))) ? ((((8'hbc) & (8'hbf)) != (~|(8'haf))) < (7'h44)) : (((|(8'haa)) ? (~|(8'ha7)) : (&(7'h42))) >> ({(8'ha5)} ? ((8'hb1) ? (8'h9c) : (8'hb3)) : ((8'hb9) != (7'h40))))) ? ({(^((8'haa) ? (8'ha0) : (8'haf)))} ? ((((8'hbc) != (8'hac)) >= ((8'ha8) ? (8'hb0) : (7'h40))) ~^ ((8'haa) ^~ (-(8'hb6)))) : (~{((8'ha8) >= (8'haa)), ((7'h44) ? (8'h9e) : (8'ha2))})) : (((((8'hb2) * (8'ha7)) | ((8'ha9) ? (8'hb0) : (8'ha5))) >>> ((^~(8'had)) ? ((8'h9f) >> (8'ha6)) : ((8'hb8) * (8'ha2)))) ? ((((8'ha8) == (7'h40)) != (^(8'ha1))) ? {(+(8'hbe))} : (&((8'ha8) ? (7'h43) : (8'ha0)))) : (^(|((7'h40) >= (8'h9e)))))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire45;
  input wire [(5'h12):(1'h0)] wire44;
  input wire signed [(4'hd):(1'h0)] wire43;
  input wire [(3'h6):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  assign y = {wire51, wire50, wire49, wire48, wire47, wire46, (1'h0)};
  assign wire46 = (({(!((8'hae) ~^ wire43)), $signed((wire42 <= wire43))} ?
                      wire42 : (((wire43 >= wire44) ~^ (wire45 ?
                              (8'hbe) : wire44)) ?
                          wire42[(3'h6):(3'h5)] : $unsigned((wire42 && wire42)))) && (((wire42 ?
                          (+wire42) : $unsigned(wire42)) <= $unsigned((wire44 ?
                          wire43 : wire43))) ?
                      wire42 : $unsigned(wire45[(1'h0):(1'h0)])));
  assign wire47 = ({(!$signed((+wire45))),
                          ({$signed((8'hb5))} ^~ ({wire43} ?
                              wire42 : $signed(wire46)))} ?
                      (wire43[(1'h1):(1'h0)] + (~$signed((~&(8'ha5))))) : wire44[(3'h5):(3'h4)]);
  assign wire48 = $unsigned(($unsigned(wire45[(4'h8):(3'h7)]) ?
                      (wire42[(3'h4):(1'h0)] ?
                          wire45 : wire44) : ($signed((~&wire45)) ?
                          $unsigned(wire47) : wire45)));
  assign wire49 = $unsigned((({(^~(8'h9f))} | (+(~&wire44))) ?
                      (~^($unsigned(wire43) + $signed((8'ha6)))) : (wire45 ^ $unsigned((+wire48)))));
  assign wire50 = $unsigned($unsigned((wire42 ?
                      {(wire49 ? wire46 : wire44)} : wire45)));
  assign wire51 = (!$signed((~$unsigned(wire44))));
endmodule

module module131
#(parameter param171 = ((|(-({(8'hb9)} ? ((8'ha4) ? (8'hac) : (8'hbf)) : ((8'ha1) ? (8'had) : (8'h9f))))) | {({{(8'hba), (7'h40)}, ((8'ha2) || (8'haf))} >>> (((8'hb1) ? (8'h9e) : (8'hba)) ^ ((8'haf) ? (8'ha0) : (8'ha1)))), (({(8'h9f), (8'hb2)} ? ((8'h9d) ? (8'haf) : (7'h42)) : {(8'ha8)}) ? (~&((8'hb9) ? (8'haa) : (8'ha3))) : (+((8'ha3) >>> (8'ha7))))}), 
parameter param172 = param171)
(y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire135;
  input wire [(4'hf):(1'h0)] wire134;
  input wire signed [(3'h4):(1'h0)] wire133;
  input wire [(3'h5):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  wire signed [(4'h9):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire165;
  wire signed [(5'h15):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire163;
  wire signed [(5'h12):(1'h0)] wire162;
  wire signed [(5'h11):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(4'he):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 reg167,
                 reg166,
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
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire136 = (~(((8'hb8) ?
                       (^wire132) : ($unsigned((8'hbe)) << (7'h40))) - wire133));
  assign wire137 = ($signed((!$unsigned($unsigned((8'ha7))))) ?
                       $signed($signed(wire134[(1'h0):(1'h0)])) : {(({wire135} ?
                                   (wire132 ? wire134 : wire132) : wire135) ?
                               wire136 : (8'hbe)),
                           (~^(^~((8'hae) ? wire133 : wire135)))});
  assign wire138 = $signed($unsigned(wire136[(2'h2):(1'h0)]));
  assign wire139 = (wire134[(4'hf):(4'hc)] ?
                       {wire135} : wire135[(4'h8):(3'h6)]);
  assign wire140 = $signed((wire137 <<< ({wire132, wire132[(3'h4):(1'h1)]} ?
                       (|(-wire139)) : (~^wire135))));
  always
    @(posedge clk) begin
      if ($signed(($unsigned(({wire137, wire136} ?
              wire138[(1'h1):(1'h1)] : wire136[(1'h1):(1'h1)])) ?
          (+$unsigned($signed(wire137))) : wire135[(2'h3):(2'h2)])))
        begin
          reg141 <= $unsigned(({(-(wire140 ? wire136 : wire133)),
              ((-wire133) ?
                  (wire138 ?
                      wire138 : (8'ha8)) : ((8'hb2) && wire138))} & ((wire140 ?
                  (wire137 ? wire134 : wire135) : (wire138 ?
                      (8'ha6) : wire139)) ?
              $signed($unsigned((8'hb2))) : (^((8'ha8) || wire135)))));
          if (($signed(wire138[(2'h3):(1'h0)]) ?
              $unsigned((+$unsigned($signed(wire134)))) : wire136[(4'h9):(3'h4)]))
            begin
              reg142 <= wire137;
              reg143 <= (((wire139[(2'h2):(1'h0)] ?
                  ((reg142 > wire133) ?
                      (wire139 ? (8'hb4) : (8'ha0)) : {(7'h44),
                          wire132}) : $unsigned(reg141[(3'h4):(1'h0)])) << {reg142,
                  reg142[(4'hb):(4'hb)]}) >> ($unsigned(reg141[(1'h0):(1'h0)]) ?
                  ((~&(~^wire132)) ?
                      $signed($signed(wire140)) : $unsigned((wire138 & reg142))) : $unsigned(wire138)));
              reg144 <= ($unsigned(($signed($signed(wire133)) || {wire134[(4'hc):(4'h8)]})) ?
                  (^wire134[(3'h4):(1'h1)]) : (^~{$unsigned((wire138 ?
                          (8'h9d) : wire138)),
                      (8'ha3)}));
              reg145 <= reg144[(3'h4):(2'h2)];
            end
          else
            begin
              reg142 <= reg145;
              reg143 <= reg142[(2'h2):(1'h0)];
            end
        end
      else
        begin
          if (wire132[(2'h2):(2'h2)])
            begin
              reg141 <= {wire132[(2'h2):(2'h2)],
                  (reg144[(3'h7):(3'h7)] ?
                      wire139 : (((wire137 ^ (8'hbc)) ?
                          (wire134 ?
                              wire138 : wire134) : (8'hb7)) || reg142[(4'h8):(1'h1)]))};
            end
          else
            begin
              reg141 <= {wire135[(2'h3):(2'h3)], (^(&(+reg142)))};
              reg142 <= $unsigned(($unsigned(($unsigned(wire135) << (reg141 || wire132))) <<< (&(8'hae))));
            end
        end
      reg146 <= ((~|$unsigned(wire139)) ?
          $unsigned(wire139) : reg143[(2'h2):(2'h2)]);
      if ((8'hb0))
        begin
          if (wire133)
            begin
              reg147 <= reg144;
              reg148 <= wire134;
            end
          else
            begin
              reg147 <= $unsigned({reg147,
                  (^~(reg145[(2'h2):(1'h1)] || (+wire132)))});
              reg148 <= $signed(wire136);
            end
          reg149 <= wire134[(4'hd):(1'h0)];
          reg150 <= wire138[(3'h4):(2'h2)];
          reg151 <= $unsigned(wire134);
          if ({{wire132[(3'h4):(3'h4)]}})
            begin
              reg152 <= (reg144[(4'hb):(4'h9)] >>> $signed(((8'hbd) ?
                  (^~(^(7'h41))) : (wire132 != {wire134}))));
              reg153 <= $signed((-($unsigned((^~reg144)) ?
                  $unsigned(wire135[(4'h9):(1'h1)]) : reg147)));
              reg154 <= (^{(8'ha7)});
              reg155 <= (&wire134[(4'hd):(3'h5)]);
              reg156 <= (reg150 ? wire132 : $signed(wire137));
            end
          else
            begin
              reg152 <= {wire132[(1'h1):(1'h1)],
                  ((!(~^(reg151 != (8'hbb)))) & (^~(&reg142)))};
            end
        end
      else
        begin
          reg147 <= $unsigned(wire136);
          if ((~(~&((~^wire137[(2'h2):(1'h1)]) ?
              (reg146 ?
                  (reg149 ? wire139 : reg146) : (wire137 ?
                      reg155 : (8'ha3))) : (wire138[(1'h1):(1'h1)] > wire136[(3'h7):(1'h0)])))))
            begin
              reg148 <= reg153;
              reg149 <= $unsigned(((~|$signed((wire135 ? (7'h43) : (8'hb1)))) ?
                  $signed((~&(reg146 ?
                      reg152 : reg142))) : reg153[(4'hb):(3'h4)]));
            end
          else
            begin
              reg148 <= $unsigned(($signed(wire132[(2'h2):(1'h1)]) ~^ (+$signed($signed(reg153)))));
              reg149 <= (reg145[(2'h2):(2'h2)] > ((8'hbd) ?
                  ($unsigned(((8'hb1) ? reg141 : wire133)) ?
                      ($signed(wire139) ?
                          wire135[(1'h1):(1'h0)] : (wire133 <= reg156)) : (~&((8'hb8) ?
                          reg150 : wire133))) : ({reg142} ?
                      wire132 : (^((8'hab) ? wire136 : wire139)))));
            end
        end
      reg157 <= (((reg141 << $signed($unsigned(reg154))) ?
              $signed(((wire136 ^ (8'hbf)) - reg150)) : reg141) ?
          (|(reg155 & {$signed(wire139)})) : ($signed($unsigned($unsigned(wire137))) != reg150));
      if ((-$unsigned((^~(~|(8'hac))))))
        begin
          reg158 <= $unsigned(wire133);
          reg159 <= {wire139};
          reg160 <= $signed({$signed(reg146),
              {({wire134} ? wire137 : $unsigned(reg142))}});
        end
      else
        begin
          reg158 <= $unsigned($signed(reg141[(1'h0):(1'h0)]));
        end
    end
  assign wire161 = ((reg142[(4'hd):(4'hb)] >= reg142) - reg147);
  assign wire162 = $signed(reg148[(4'ha):(1'h0)]);
  assign wire163 = (reg145 ? reg155[(3'h4):(1'h0)] : reg154[(4'he):(4'hc)]);
  assign wire164 = wire161[(3'h4):(1'h1)];
  assign wire165 = wire161[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg166 <= (wire163[(1'h0):(1'h0)] ?
          reg148 : $signed({($signed(reg144) | $unsigned(reg148)),
              (^~(wire137 == reg158))}));
      reg167 <= (reg141 ?
          {reg159[(2'h2):(1'h0)],
              {reg153[(5'h12):(3'h7)],
                  {$unsigned(reg158), (-wire161)}}} : ((-{(wire162 <= (8'ha5)),
                  $unsigned(reg144)}) ?
              $signed(((reg144 | (8'ha0)) ?
                  reg160 : {wire135, wire134})) : ({reg150[(4'he):(4'ha)],
                      (~&reg149)} ?
                  reg150 : $unsigned({(8'ha8), reg142}))));
    end
  assign wire168 = (&$unsigned(($signed(((8'hb3) ?
                       (8'hb5) : wire161)) >>> ($unsigned(reg148) << (+reg144)))));
  assign wire169 = (($unsigned(((~^reg154) ?
                       {reg160,
                           reg151} : (~&wire134))) - (+(reg149[(3'h7):(1'h1)] ?
                       ((8'ha8) >> (7'h42)) : (wire138 != reg160)))) >>> reg144[(1'h0):(1'h0)]);
  assign wire170 = wire135;
endmodule

module module67
#(parameter param115 = {(~^(({(8'ha5), (8'hb8)} * ((7'h44) ? (8'haf) : (8'ha2))) ? (((8'hb2) & (8'hac)) >>> ((8'ha9) > (8'h9f))) : (~|((8'had) ? (8'ha2) : (8'hb1))))), {((((8'h9e) ? (8'hb5) : (8'hbf)) ? ((8'hab) + (7'h43)) : (&(8'ha5))) ? (~&((8'ha9) >>> (8'hbd))) : (|((8'h9c) ? (8'ha4) : (8'ha2))))}}, 
parameter param116 = {(({(param115 ? param115 : param115), (param115 != param115)} | (~(!param115))) ? ((~&(8'hb8)) <<< (|(param115 || param115))) : ((~&((8'h9e) ? param115 : (8'h9f))) + param115))})
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h1fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire71;
  input wire [(4'ha):(1'h0)] wire70;
  input wire signed [(4'hd):(1'h0)] wire69;
  input wire signed [(4'hc):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire72;
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire76,
                 wire72,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire72 = $unsigned(($unsigned((~((8'h9c) || wire70))) ?
                      {((~|wire69) + (+wire69)),
                          $unsigned((|wire71))} : wire68));
  always
    @(posedge clk) begin
      reg73 <= wire68;
      reg74 <= (^reg73[(4'hb):(2'h3)]);
      reg75 <= $unsigned($unsigned($signed($unsigned((reg74 <<< (8'haa))))));
    end
  assign wire76 = (!$unsigned($unsigned($signed($signed((8'h9f))))));
  always
    @(posedge clk) begin
      if ($unsigned({(((wire70 * wire72) ? $unsigned(wire69) : {wire72}) ?
              $signed(reg75) : (~&(reg74 && reg73)))}))
        begin
          if ($signed(((+(wire69 ? reg75 : (^~wire68))) ?
              (~(^~wire70[(3'h6):(3'h5)])) : (~$unsigned($signed(wire76))))))
            begin
              reg77 <= $unsigned(((^~($signed(wire76) ^ (wire71 ?
                  reg74 : wire71))) > wire76));
              reg78 <= ((8'haf) == $signed(reg77));
              reg79 <= (reg73 ?
                  $signed($unsigned(((~|reg74) ?
                      (!wire68) : $unsigned(reg74)))) : $unsigned({(wire68[(2'h2):(1'h1)] ?
                          (wire69 ? wire76 : wire72) : (^wire69))}));
              reg80 <= {$signed($signed(wire70))};
            end
          else
            begin
              reg77 <= ((^~((reg74 << wire72[(1'h1):(1'h0)]) ^~ {(reg79 >= reg73)})) > ((($unsigned(reg73) >>> (reg74 ?
                      wire68 : reg78)) <<< ($signed((8'ha3)) ?
                      (~&reg74) : (~|reg80))) ?
                  $signed((~&$unsigned(reg80))) : $signed(reg78)));
              reg78 <= wire71;
              reg79 <= (~^reg73);
              reg80 <= wire71[(4'h9):(4'h9)];
            end
          if ((wire72 << reg74[(5'h11):(4'he)]))
            begin
              reg81 <= reg77;
              reg82 <= $unsigned((~(wire68 <<< reg73[(5'h13):(3'h7)])));
              reg83 <= ($signed((^(~$signed((8'h9c))))) - wire70);
              reg84 <= ((reg74[(1'h0):(1'h0)] ?
                  ($signed(wire69[(4'h9):(3'h5)]) ?
                      ((reg82 ? wire68 : (8'hbc)) ?
                          (wire68 ^~ reg82) : (-reg74)) : ({reg78} ?
                          (wire68 ?
                              reg79 : reg83) : {wire71})) : $unsigned((wire76 ?
                      (reg80 + wire70) : {reg78}))) - $signed($unsigned(($signed((8'had)) ?
                  $unsigned((8'haa)) : (+reg73)))));
            end
          else
            begin
              reg81 <= reg83[(4'hc):(3'h7)];
              reg82 <= reg75[(4'h9):(4'h9)];
              reg83 <= reg81[(3'h6):(3'h6)];
              reg84 <= $signed(((!wire71[(1'h0):(1'h0)]) != $unsigned((~(reg74 ?
                  wire71 : (8'ha1))))));
            end
        end
      else
        begin
          if (wire69)
            begin
              reg77 <= $unsigned(wire70[(3'h5):(3'h5)]);
              reg78 <= (($signed($signed(reg73[(3'h6):(2'h3)])) << reg81) | wire71[(5'h11):(2'h3)]);
              reg79 <= (&$signed(reg78[(1'h1):(1'h1)]));
            end
          else
            begin
              reg77 <= $signed($signed({($signed((7'h43)) ?
                      reg77[(4'he):(4'he)] : reg77[(2'h2):(2'h2)])}));
            end
          if ((!$signed(wire76)))
            begin
              reg80 <= $unsigned((($signed($unsigned(reg77)) ?
                  wire70[(2'h2):(1'h0)] : reg74) <<< $unsigned((8'ha0))));
            end
          else
            begin
              reg80 <= wire69;
              reg81 <= reg74[(1'h1):(1'h1)];
            end
          if (reg75)
            begin
              reg82 <= {($signed($signed((~|reg84))) ?
                      ((8'hac) + ((^~(8'hac)) ^~ (reg75 == reg77))) : ($unsigned($unsigned((8'hbb))) >>> ($signed(reg75) ?
                          reg84[(3'h5):(1'h0)] : reg81)))};
              reg83 <= $unsigned(wire70[(2'h2):(1'h1)]);
              reg84 <= $signed(({wire72[(4'he):(4'hb)]} >> ({(wire70 ?
                          (8'hb3) : reg77)} ?
                  (~(reg83 && reg79)) : wire72[(4'hb):(3'h5)])));
            end
          else
            begin
              reg82 <= wire76;
              reg83 <= {(8'hb2),
                  ($unsigned({reg84[(1'h1):(1'h0)]}) ^~ (-reg74))};
              reg84 <= ({wire72[(2'h3):(2'h3)]} >> (8'h9f));
              reg85 <= $signed($signed((8'hb9)));
            end
          reg86 <= (reg84[(1'h1):(1'h0)] ?
              (-$signed($signed($unsigned(reg75)))) : (~wire76));
          reg87 <= $signed($unsigned((($unsigned(wire69) ?
              wire72[(3'h4):(1'h1)] : $signed((8'ha7))) <<< wire76[(3'h7):(1'h1)])));
        end
      reg88 <= $unsigned((wire70 ~^ $signed({$signed((8'hb5)), (8'hb5)})));
      reg89 <= (8'h9e);
      reg90 <= wire70;
    end
  always
    @(posedge clk) begin
      reg91 <= (reg84[(2'h3):(2'h2)] || ((reg90[(3'h5):(2'h3)] == {(^~(8'ha4)),
          reg80[(4'he):(4'hc)]}) && {reg88[(2'h3):(1'h1)],
          $unsigned((wire69 ? reg85 : (8'hae)))}));
    end
  assign wire92 = reg85[(2'h3):(1'h0)];
  assign wire93 = wire72[(3'h5):(3'h4)];
  assign wire94 = $signed((-((((8'ha6) << reg83) - {(8'h9d), wire72}) ?
                      (-(^~reg77)) : wire68[(2'h2):(1'h1)])));
  assign wire95 = $signed({(reg85[(3'h7):(3'h5)] >>> {(reg79 << (8'hb6)),
                          $unsigned(wire94)}),
                      ($signed((7'h42)) ~^ ($signed((8'hbf)) <= (&wire76)))});
  assign wire96 = $signed(($signed((|reg88[(3'h4):(2'h2)])) ?
                      $unsigned(reg81) : wire68));
  always
    @(posedge clk) begin
      if (reg75)
        begin
          if (wire69)
            begin
              reg97 <= (reg74 || (&reg78));
              reg98 <= $signed($signed($signed((^{reg82, reg80}))));
              reg99 <= reg97[(5'h10):(2'h3)];
            end
          else
            begin
              reg97 <= $unsigned(((reg87 == wire71) >> (~&$signed((reg90 ?
                  wire76 : (7'h41))))));
              reg98 <= $signed(($unsigned({reg97,
                  wire71}) ~^ (($unsigned((8'hb5)) ?
                  (~wire94) : (wire72 ? reg75 : wire93)) * (8'hae))));
            end
          reg100 <= (((wire96[(4'ha):(3'h6)] ?
                  $signed(reg73[(5'h14):(2'h2)]) : reg82) ?
              (~|(8'hb1)) : $unsigned($signed($signed(reg97)))) >> (7'h41));
        end
      else
        begin
          reg97 <= (wire69[(3'h7):(2'h2)] | (reg80 == $unsigned(($unsigned(reg73) ?
              reg97[(4'hc):(3'h7)] : {reg82}))));
          reg98 <= $unsigned(((^~(^~wire71)) ^ (($unsigned(wire70) ?
              reg84[(2'h2):(1'h0)] : reg85[(3'h4):(3'h4)]) > ((reg80 | wire92) < (wire93 ?
              reg83 : reg82)))));
        end
      reg101 <= $signed($unsigned(reg85[(3'h5):(1'h0)]));
      reg102 <= reg97[(3'h4):(2'h3)];
    end
  assign wire103 = reg80;
  assign wire104 = (~^$unsigned({($signed(reg89) ?
                           (reg80 ? wire93 : reg100) : (reg100 ^~ reg91)),
                       $signed(wire96[(2'h2):(1'h0)])}));
  assign wire105 = $signed({reg86[(3'h5):(1'h0)]});
  assign wire106 = {$signed((|$signed(reg78)))};
  assign wire107 = $unsigned($signed({((wire95 ^ wire104) != (8'hb5)),
                       wire103}));
  assign wire108 = (8'h9e);
  assign wire109 = (!(-reg88[(1'h0):(1'h0)]));
  assign wire110 = wire96[(3'h5):(1'h1)];
  assign wire111 = reg90;
  assign wire112 = $unsigned(wire69);
  assign wire113 = $unsigned(wire111);
  assign wire114 = ($unsigned(($unsigned((reg83 ?
                       reg89 : wire70)) >>> $unsigned((wire107 ?
                       reg84 : wire96)))) & wire109);
endmodule
