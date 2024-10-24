module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire170;
  wire signed [(4'hc):(1'h0)] wire168;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg180 = (1'h0);
  reg [(5'h12):(1'h0)] reg179 = (1'h0);
  reg [(3'h6):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg175 = (1'h0);
  reg [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  reg [(5'h13):(1'h0)] reg171 = (1'h0);
  assign y = {wire170,
                 wire168,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire5 = wire3[(3'h6):(3'h5)];
  assign wire6 = $unsigned((-(+(&$unsigned(wire5)))));
  assign wire7 = (wire0 ?
                     wire1[(4'h8):(3'h6)] : $signed($unsigned(({wire3} ?
                         $unsigned((8'h9c)) : {wire1}))));
  assign wire8 = $signed($unsigned($unsigned(({(7'h40), wire7} ?
                     wire2[(1'h1):(1'h1)] : $signed(wire0)))));
  assign wire9 = wire4[(4'h9):(3'h5)];
  assign wire10 = ($unsigned({{wire2, (8'ha8)}}) ?
                      (^~((wire2 ^~ {wire8,
                          wire9}) != wire1[(2'h2):(1'h0)])) : ((&wire9) ?
                          (($signed(wire0) ?
                                  $unsigned(wire9) : ((7'h43) & (8'ha7))) ?
                              ($signed((8'hb7)) * $signed((8'hb6))) : (~wire5[(4'hb):(3'h5)])) : $signed((&wire4[(4'h8):(2'h3)]))));
  assign wire11 = (&$signed((-wire8)));
  module12 #() modinst169 (.wire14(wire4), .y(wire168), .wire13(wire8), .wire16(wire2), .clk(clk), .wire15(wire10));
  assign wire170 = wire1[(5'h11):(3'h7)];
  always
    @(posedge clk) begin
      reg171 <= $unsigned($signed($signed(({wire170, wire168} == (wire2 ?
          wire7 : wire0)))));
      reg172 <= {wire4};
      reg173 <= wire170[(4'hc):(1'h1)];
      reg174 <= ((((wire0[(3'h5):(2'h2)] && wire6) ?
              ($signed(wire4) ?
                  (wire5 ?
                      wire3 : (8'hb3)) : $unsigned((8'hbd))) : {{wire1}}) == {((wire11 ?
                  (8'hbc) : wire7) >>> (wire1 > wire4)),
              $signed((^~wire170))}) ?
          (&(wire9[(1'h0):(1'h0)] & reg171[(4'he):(4'hd)])) : (((-{reg171,
                  wire168}) - reg171[(4'hb):(2'h2)]) ?
              {$unsigned((wire6 <= wire9)),
                  (^((8'hb8) != wire10))} : (!{(~^(8'hb8)), wire1})));
      if (($signed({(!$signed((8'ha7))), reg173[(3'h4):(2'h2)]}) ?
          reg171 : $signed(({(^wire168), wire1} > wire7[(3'h7):(2'h2)]))))
        begin
          reg175 <= $unsigned((^~((-(-wire2)) <= (!$unsigned(reg171)))));
        end
      else
        begin
          if ($unsigned(reg171[(4'hc):(4'hc)]))
            begin
              reg175 <= ($signed($unsigned(wire2[(3'h6):(3'h5)])) <<< $unsigned($signed(reg172)));
              reg176 <= (wire168[(2'h2):(2'h2)] ?
                  reg172 : $signed(wire7[(3'h5):(2'h3)]));
            end
          else
            begin
              reg175 <= (-{wire3[(1'h0):(1'h0)]});
              reg176 <= (8'haf);
            end
          reg177 <= ((~^wire4[(4'h8):(3'h5)]) + $signed($unsigned({$signed(wire1)})));
          reg178 <= wire9[(1'h1):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      reg179 <= reg173[(4'ha):(2'h2)];
      reg180 <= (wire8[(4'hd):(4'h9)] ?
          (wire170[(3'h7):(3'h4)] ?
              wire9 : (&(~reg174))) : $unsigned((~wire8)));
      reg181 <= $unsigned(wire1[(5'h11):(4'hf)]);
      reg182 <= $signed({($unsigned((~^reg175)) ?
              $unsigned((~wire9)) : wire1[(3'h4):(2'h3)]),
          $unsigned(($signed(wire0) ?
              $unsigned(wire6) : (reg173 >>> wire168)))});
    end
endmodule

module module12
#(parameter param167 = (((^~(^~((7'h43) && (8'ha9)))) + ({((8'h9d) != (8'ha1)), (~|(8'ha7))} || (((8'ha9) <= (8'hbf)) ? {(8'ha7), (8'hba)} : ((7'h40) ? (7'h44) : (8'hbc))))) ? (~&((((8'hac) | (8'ha2)) | (!(8'h9d))) > (((8'hab) << (8'hbb)) ^ {(8'hbc)}))) : ((8'h9e) ? (~|{{(8'hae)}}) : ({(&(8'hbe))} + ((7'h43) == ((8'ha1) ^~ (8'ha2)))))))
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h28b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire [(5'h10):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire104;
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire128,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire43,
                 wire44,
                 wire104,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
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
                 reg126,
                 reg127,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((!(&$signed(($signed(wire13) || $signed(wire13))))))
        begin
          if ((8'ha4))
            begin
              reg17 <= ({wire13} ?
                  {{((wire14 >>> wire14) ?
                              (wire16 ~^ wire15) : (wire16 == wire14)),
                          wire16},
                      ($signed((wire14 ?
                          wire13 : wire16)) < $signed(wire15))} : $unsigned({wire15[(2'h2):(1'h1)],
                      $unsigned((-wire16))}));
              reg18 <= $unsigned(wire13);
              reg19 <= wire16[(1'h1):(1'h1)];
            end
          else
            begin
              reg17 <= $unsigned($signed(wire15[(2'h2):(2'h2)]));
              reg18 <= $unsigned(($signed($signed((reg19 ?
                  wire14 : reg19))) * wire14));
            end
          reg20 <= $unsigned((~|$unsigned(wire14[(4'hc):(2'h3)])));
          if (wire16[(2'h3):(1'h0)])
            begin
              reg21 <= reg18[(1'h0):(1'h0)];
              reg22 <= (wire13 || {$signed(({wire15} ?
                      wire13[(2'h2):(2'h2)] : (^~wire13)))});
              reg23 <= $unsigned(wire14[(4'h8):(3'h5)]);
              reg24 <= $unsigned(wire13);
              reg25 <= (-(reg22 ? reg18[(2'h3):(1'h0)] : reg20[(4'hf):(2'h3)]));
            end
          else
            begin
              reg21 <= {{(~&((reg20 ? wire15 : reg17) > (reg22 ?
                          wire16 : (8'hb3)))),
                      reg23[(4'h9):(4'h8)]}};
              reg22 <= $unsigned($unsigned($unsigned(({reg21, wire15} & (reg24 ?
                  reg19 : reg21)))));
              reg23 <= (^~$unsigned(($signed(reg19[(3'h5):(1'h0)]) ?
                  {$signed((8'hab))} : (-(reg23 ? wire14 : wire16)))));
              reg24 <= wire15;
              reg25 <= (~(reg24 <<< $unsigned(((wire16 || reg17) ?
                  reg23[(3'h7):(2'h3)] : reg18))));
            end
          reg26 <= reg22;
          reg27 <= reg18;
        end
      else
        begin
          if ($unsigned(wire16))
            begin
              reg17 <= wire13[(1'h1):(1'h0)];
            end
          else
            begin
              reg17 <= {$unsigned((($signed(reg26) ? $signed(wire13) : wire14) ?
                      reg24 : $signed(reg27))),
                  reg27};
            end
          if ({(~&$signed((8'ha1))), $signed(reg19[(3'h4):(2'h3)])})
            begin
              reg18 <= (reg21[(3'h6):(3'h5)] != (reg22[(1'h1):(1'h0)] <<< $signed((~&reg20[(1'h0):(1'h0)]))));
              reg19 <= $unsigned(wire13[(2'h2):(2'h2)]);
              reg20 <= reg17[(3'h7):(1'h1)];
            end
          else
            begin
              reg18 <= $signed((&(((+reg22) & (-wire16)) >> (&(reg24 ?
                  reg18 : wire15)))));
              reg19 <= $signed($signed(($unsigned($signed(reg25)) ?
                  (~wire13[(1'h1):(1'h0)]) : (reg23 ~^ (reg26 >>> reg19)))));
              reg20 <= ((reg22[(1'h1):(1'h0)] << $signed((reg23 ?
                  (wire15 > reg25) : $unsigned(reg20)))) | $signed((^~(^~reg24))));
              reg21 <= (|$unsigned((+$unsigned(reg17[(5'h10):(1'h1)]))));
              reg22 <= (wire16[(2'h3):(1'h0)] ? (8'hae) : reg19);
            end
        end
      if ($unsigned((~^$signed(reg21))))
        begin
          reg28 <= ({$signed((~$signed(reg20)))} ?
              ($signed((!(wire13 > reg23))) >= {wire13, reg25}) : reg17);
          reg29 <= $unsigned($unsigned({reg22, reg26[(2'h2):(2'h2)]}));
          reg30 <= (wire16[(1'h1):(1'h0)] ~^ ($signed((reg22[(2'h2):(1'h1)] | $unsigned(reg19))) ?
              ((((8'ha0) ? reg21 : reg21) == ((8'hbd) ^~ wire13)) ?
                  wire16[(2'h2):(2'h2)] : $signed((|reg23))) : ((reg20 ?
                      wire13 : (reg29 << reg23)) ?
                  (~|reg27[(4'he):(4'h8)]) : ((wire16 << reg21) >= (reg22 ?
                      reg25 : reg24)))));
        end
      else
        begin
          reg28 <= $signed(({$signed((&reg19)), reg20} < reg28));
        end
      if (reg20)
        begin
          if ((+({(reg26 < (wire13 == wire14)),
              ({reg28, (8'hb6)} < (~&reg28))} <<< $unsigned((-(reg20 ?
              (8'hb5) : wire15))))))
            begin
              reg31 <= (~|(&{((-reg25) >>> (reg25 ? reg19 : wire13))}));
              reg32 <= ($signed(reg27[(3'h5):(1'h1)]) != {wire15});
              reg33 <= $signed($signed($unsigned(reg23[(4'h8):(1'h0)])));
              reg34 <= {(&wire13),
                  ($unsigned($unsigned(reg31)) ^ (((wire14 + reg30) ?
                          (+reg19) : ((8'haa) ? reg20 : reg32)) ?
                      reg31 : $signed($signed(wire16))))};
              reg35 <= $signed($unsigned($signed(wire14[(4'h8):(3'h5)])));
            end
          else
            begin
              reg31 <= (+{((8'ha0) >> wire16[(2'h3):(1'h0)]),
                  wire13[(1'h1):(1'h1)]});
              reg32 <= (8'ha6);
              reg33 <= $signed(((^~$unsigned(((8'ha8) || wire13))) ?
                  (+$signed(((8'hb2) ?
                      reg17 : wire14))) : reg29[(3'h4):(3'h4)]));
              reg34 <= $signed((|($signed(((8'ha5) * reg25)) + (8'hb8))));
            end
          reg36 <= $unsigned($signed($signed(($unsigned(wire16) ?
              reg18 : (reg27 ? reg34 : reg18)))));
          reg37 <= (~$unsigned((reg19 - reg17[(4'hd):(3'h6)])));
          reg38 <= $signed(reg34);
          if ((|($unsigned((reg22 ?
              (reg17 ? (8'hae) : (8'hbd)) : reg38[(4'hf):(2'h3)])) & reg26)))
            begin
              reg39 <= reg20;
            end
          else
            begin
              reg39 <= wire16[(2'h3):(2'h3)];
              reg40 <= ((!$signed((^~((8'hac) <= reg21)))) ^ (!reg25[(3'h4):(2'h2)]));
              reg41 <= (8'hb6);
            end
        end
      else
        begin
          reg31 <= reg27;
        end
      reg42 <= ($unsigned({{reg29[(2'h2):(2'h2)]}}) ?
          $signed((8'hac)) : $signed(($signed($signed(reg30)) ?
              $signed($unsigned(reg25)) : (+reg18[(2'h2):(1'h0)]))));
    end
  assign wire43 = (~&reg28[(1'h0):(1'h0)]);
  assign wire44 = $signed((reg28 ? reg40[(5'h10):(4'he)] : (|$signed(reg21))));
  module45 #() modinst105 (wire104, clk, wire43, reg39, reg20, reg21, reg41);
  assign wire106 = $unsigned($unsigned(($signed($signed(reg33)) ?
                       ((reg25 ? reg23 : wire104) ~^ (~&(8'ha1))) : {(reg35 ?
                               reg23 : wire13)})));
  assign wire107 = reg36[(1'h0):(1'h0)];
  assign wire108 = $signed(((reg37[(1'h0):(1'h0)] > $signed($signed(reg26))) ?
                       {(reg37[(3'h7):(1'h0)] ? (reg37 << wire13) : (~&reg39)),
                           ($signed(reg35) ?
                               (reg31 ?
                                   reg29 : reg35) : $unsigned(reg17))} : $signed($signed((~&wire106)))));
  assign wire109 = $signed(wire104[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      reg110 <= (!((8'haf) ?
          $signed(((^~wire44) >> (-wire109))) : (-(reg23 ?
              reg19[(3'h5):(3'h5)] : (8'hb6)))));
      if ({(wire106 ?
              (&reg42[(2'h2):(1'h0)]) : ((reg17[(4'he):(2'h3)] | $unsigned(reg110)) ?
                  reg25[(3'h6):(2'h2)] : ((wire108 ? wire44 : wire44) ?
                      ((8'ha0) ? reg110 : wire104) : (wire107 ~^ reg34))))})
        begin
          reg111 <= ({(($signed(reg31) ?
                  (wire109 ?
                      wire108 : wire108) : (reg21 >> (8'ha8))) << {wire14[(4'hf):(2'h3)]}),
              ({(|reg28),
                  reg18[(2'h3):(2'h3)]} || (wire14[(1'h1):(1'h1)] || (reg23 ?
                  reg21 : reg20)))} || $signed({($signed((8'ha3)) ?
                  (~(8'haf)) : reg21)}));
          reg112 <= (8'hbc);
        end
      else
        begin
          reg111 <= reg30[(3'h7):(1'h1)];
          reg112 <= $unsigned($signed((wire44[(3'h5):(2'h2)] == ((reg31 ?
                  reg25 : wire15) ?
              reg34[(3'h5):(3'h5)] : wire13))));
          reg113 <= (8'h9e);
          if ($unsigned((reg33[(1'h0):(1'h0)] ~^ wire44[(1'h0):(1'h0)])))
            begin
              reg114 <= $unsigned(($signed(($unsigned(wire109) | $signed(reg41))) >>> (8'hb2)));
              reg115 <= (8'h9d);
              reg116 <= reg39[(1'h1):(1'h0)];
              reg117 <= ((|($signed((reg17 ? reg40 : reg114)) ?
                      (|(reg26 ? reg17 : reg111)) : wire14[(4'ha):(4'h9)])) ?
                  $unsigned($signed(((reg27 ? reg30 : reg20) ?
                      reg39 : reg28[(2'h2):(2'h2)]))) : reg17);
              reg118 <= ($unsigned((reg22[(2'h2):(1'h1)] ?
                      (~$signed((8'ha3))) : (8'ha9))) ?
                  (reg111[(3'h4):(1'h1)] * $signed((~|(wire107 ?
                      reg115 : (8'hb0))))) : $unsigned(((^(!(8'hbe))) | $signed((reg42 ?
                      reg38 : reg40)))));
            end
          else
            begin
              reg114 <= (reg113[(3'h6):(3'h5)] ?
                  reg25 : $unsigned((!($signed(wire15) > (reg40 + wire108)))));
              reg115 <= $signed(wire43);
            end
        end
      if ($unsigned(reg33))
        begin
          reg119 <= wire104[(1'h1):(1'h0)];
        end
      else
        begin
          reg119 <= ({reg20[(1'h1):(1'h0)],
              (($unsigned(wire104) & $unsigned(reg24)) ?
                  reg119 : (~wire109))} >= {($signed(reg119[(5'h12):(5'h10)]) < reg119),
              $unsigned(reg34)});
          reg120 <= ($signed($signed(((reg33 ^~ reg116) + $signed(reg19)))) < $unsigned(reg42[(4'hf):(4'hd)]));
        end
      reg121 <= $unsigned($unsigned(($unsigned(wire107) ?
          (&$signed((8'hb7))) : $unsigned($unsigned((8'ha2))))));
      if ((((-$unsigned((~^reg24))) >= {((~&reg118) >= (8'ha5))}) >> (({(~&reg40)} ?
          $unsigned((^~reg32)) : ($unsigned(wire43) ?
              reg18 : $signed(reg35))) <= (reg29 ?
          $unsigned((~(8'hb5))) : reg119[(5'h12):(4'he)]))))
        begin
          if (((~^reg19) & (wire108 ?
              (-$signed((^reg30))) : reg39[(2'h2):(1'h0)])))
            begin
              reg122 <= reg39;
              reg123 <= (^((8'ha8) ? reg122[(4'h9):(3'h4)] : reg117));
              reg124 <= (reg117[(4'hb):(4'h8)] + (((8'h9f) ?
                      reg38 : $unsigned($signed(reg33))) ?
                  reg42[(3'h5):(3'h4)] : reg117[(3'h6):(3'h6)]));
              reg125 <= $unsigned((8'hb2));
            end
          else
            begin
              reg122 <= $unsigned(reg117[(4'ha):(4'ha)]);
              reg123 <= reg19[(1'h0):(1'h0)];
              reg124 <= reg23;
              reg125 <= (reg27[(3'h6):(3'h4)] <= $signed(($signed({reg41,
                      wire13}) ?
                  ($signed(reg29) | $unsigned(wire108)) : (-(reg28 ?
                      reg27 : wire13)))));
            end
          reg126 <= wire14[(3'h5):(2'h2)];
          reg127 <= ($unsigned((reg119 ?
                  ((reg116 <= wire44) ?
                      (reg35 << reg112) : (wire104 ?
                          reg119 : wire106)) : $signed((~&(8'hb8))))) ?
              {$signed(reg17[(4'ha):(3'h7)]),
                  wire106[(3'h6):(3'h6)]} : $signed($unsigned((-$unsigned(reg35)))));
        end
      else
        begin
          reg122 <= (~|(^reg32[(3'h5):(3'h4)]));
          if (($unsigned($signed($unsigned((reg34 ?
              reg125 : reg29)))) | (reg36 ?
              (|$signed($signed(reg114))) : (~|{$unsigned(wire108)}))))
            begin
              reg123 <= ({wire104[(3'h5):(1'h1)]} ~^ reg114);
              reg124 <= reg124[(4'hb):(2'h3)];
              reg125 <= $signed({{(~|$unsigned(reg37)),
                      ((8'ha9) & (reg124 ? reg118 : reg123))}});
              reg126 <= wire16[(1'h1):(1'h1)];
            end
          else
            begin
              reg123 <= (reg110 ?
                  (reg34 ?
                      (wire104 ?
                          (^(^~(8'hac))) : $signed($unsigned(reg22))) : wire16) : ((!(&(reg115 ?
                      reg20 : reg28))) >> reg127));
              reg124 <= {($unsigned($signed(reg30[(1'h1):(1'h0)])) ~^ (($unsigned(reg114) >>> {wire109}) >>> ($signed(reg38) ^ $unsigned(reg114))))};
              reg125 <= reg41;
              reg126 <= reg18;
              reg127 <= ($unsigned((reg114 ?
                      $unsigned((8'had)) : (~^(reg25 >>> wire43)))) ?
                  reg22 : ({(8'haf), $unsigned((~&reg38))} >> ({(~|reg22)} ?
                      $signed((8'hba)) : ((~^reg30) ?
                          (^wire14) : (wire14 ? reg19 : reg126)))));
            end
        end
    end
  assign wire128 = {(reg40[(2'h2):(1'h0)] * wire109), reg25[(3'h4):(2'h3)]};
  module129 #() modinst163 (.wire131(reg34), .wire132(wire108), .clk(clk), .wire133(reg121), .y(wire162), .wire130(wire15), .wire134(reg31));
  assign wire164 = $unsigned(({(~&wire162[(2'h2):(1'h1)]), {reg31, (+reg38)}} ?
                       {($signed(wire15) ? reg110 : (reg124 ? (8'hbc) : reg24)),
                           reg30} : (~&$signed($signed((8'hbb))))));
  assign wire165 = wire162;
  assign wire166 = $signed((~|(reg21 ~^ $signed((8'ha4)))));
endmodule

module module129  (y, clk, wire134, wire133, wire132, wire131, wire130);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire134;
  input wire signed [(2'h2):(1'h0)] wire133;
  input wire signed [(4'hf):(1'h0)] wire132;
  input wire [(2'h3):(1'h0)] wire131;
  input wire signed [(4'hd):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire159;
  wire signed [(5'h10):(1'h0)] wire158;
  wire [(4'hb):(1'h0)] wire157;
  wire signed [(2'h3):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire135;
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
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
  assign wire135 = wire134[(1'h1):(1'h0)];
  assign wire136 = $unsigned($signed($signed((~|$unsigned(wire130)))));
  assign wire137 = wire135[(2'h3):(1'h1)];
  assign wire138 = $unsigned(wire136);
  assign wire139 = $unsigned($unsigned(({$unsigned(wire130)} <= ((^wire134) << wire134))));
  assign wire140 = $signed((wire138[(1'h1):(1'h1)] + ((((8'hb3) + wire132) ?
                       $signed(wire138) : $signed(wire135)) <<< (8'hb5))));
  always
    @(posedge clk) begin
      reg141 <= wire132;
      reg142 <= (wire130 ? (!$signed(wire134)) : (&(~^(&(~&(8'hb4))))));
      if ((8'hb3))
        begin
          reg143 <= ((reg141[(2'h2):(1'h1)] ?
              wire130 : (($signed(wire140) ?
                      wire132[(1'h0):(1'h0)] : ((8'hab) >= wire133)) ?
                  wire138[(4'hf):(4'hf)] : ($unsigned(reg142) | (|reg142)))) && reg141[(4'ha):(3'h4)]);
          reg144 <= {($signed(reg141) ^~ ((((8'hb6) ?
                  wire136 : (8'ha7)) > {wire134,
                  wire133}) ^~ $unsigned({wire130, wire139})))};
        end
      else
        begin
          if ((wire130 ?
              wire139[(1'h0):(1'h0)] : (wire138[(3'h5):(2'h2)] == {$unsigned((reg142 ?
                      wire138 : wire139))})))
            begin
              reg143 <= reg143[(3'h4):(2'h2)];
              reg144 <= (-(8'ha4));
            end
          else
            begin
              reg143 <= reg142;
            end
          if (({$unsigned((7'h42))} * wire134))
            begin
              reg145 <= $unsigned($unsigned((+(~&(~|(8'hbb))))));
              reg146 <= (8'ha1);
              reg147 <= reg144[(2'h3):(2'h2)];
            end
          else
            begin
              reg145 <= wire136;
              reg146 <= wire135;
              reg147 <= wire138[(2'h3):(1'h0)];
              reg148 <= wire131;
            end
          reg149 <= (wire136 ?
              {(|(reg146[(4'hd):(3'h6)] ?
                      $signed(wire139) : wire139[(2'h2):(2'h2)])),
                  wire135[(3'h6):(2'h3)]} : ($unsigned(wire134[(1'h0):(1'h0)]) ?
                  $signed((wire133[(1'h1):(1'h1)] >= wire136[(4'h9):(4'h9)])) : $signed(reg142)));
          reg150 <= wire133;
          if ($unsigned($signed((reg143 ?
              wire137[(3'h4):(1'h1)] : ($unsigned(wire140) ?
                  $unsigned((8'hbe)) : (wire130 ? wire137 : (8'hbe)))))))
            begin
              reg151 <= (~|wire134);
            end
          else
            begin
              reg151 <= wire139;
              reg152 <= ($unsigned($unsigned(((^~(8'hbb)) << wire130))) <= {wire139[(1'h1):(1'h0)]});
              reg153 <= ((+$signed({(~^wire140)})) & ($unsigned(reg151) ?
                  {reg150, reg147} : $signed((~|reg143))));
              reg154 <= reg149;
              reg155 <= reg152;
            end
        end
      reg156 <= (!wire138);
    end
  assign wire157 = (+wire132[(1'h1):(1'h0)]);
  assign wire158 = $signed((wire130[(2'h2):(2'h2)] >= wire130[(4'h8):(4'h8)]));
  assign wire159 = $unsigned(($signed($signed({reg144})) ^ reg145[(3'h6):(2'h2)]));
  assign wire160 = {((~({wire140} ?
                           reg149[(2'h2):(1'h0)] : reg150)) >> $signed(((^~reg147) || wire134))),
                       reg141};
  assign wire161 = (reg152 || (~&reg145));
endmodule

module module45
#(parameter param102 = ((7'h40) ? {(~|(|((8'hbd) ? (8'hbf) : (8'hbf))))} : (~|((((8'hba) ? (7'h40) : (8'ha5)) - ((7'h41) ? (8'h9d) : (8'ha0))) ? ({(7'h42), (8'hb6)} ? ((8'ha3) ? (8'hb6) : (8'h9f)) : {(8'hb5)}) : (&((8'hb2) ? (8'hbd) : (8'hbd)))))), 
parameter param103 = param102)
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h25b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire50;
  input wire signed [(3'h4):(1'h0)] wire49;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire signed [(3'h6):(1'h0)] wire47;
  input wire signed [(2'h3):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire71,
                 wire70,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 reg57,
                 (1'h0)};
  assign wire51 = $unsigned($unsigned((wire47[(1'h0):(1'h0)] ?
                      (^wire46[(1'h0):(1'h0)]) : (~wire47))));
  assign wire52 = ({$unsigned(($unsigned(wire49) - ((8'haf) - wire49)))} < (((wire49 ?
                          (&wire51) : wire48[(1'h1):(1'h0)]) - $unsigned({wire48,
                          wire50})) ?
                      wire46[(1'h1):(1'h0)] : wire50));
  assign wire53 = wire49[(1'h0):(1'h0)];
  assign wire54 = $unsigned($signed($unsigned($signed((^~wire48)))));
  assign wire55 = ($unsigned($unsigned(wire46)) ?
                      $signed(wire46[(2'h3):(2'h3)]) : ((((^~wire48) ?
                              (wire49 ? wire46 : wire52) : ((8'hb4) ?
                                  wire54 : wire54)) ?
                          wire50 : wire51) * $signed(($unsigned(wire50) ?
                          (7'h43) : $signed(wire49)))));
  assign wire56 = (~&wire46);
  always
    @(posedge clk) begin
      reg57 <= (~&wire48[(1'h1):(1'h0)]);
      reg58 <= $unsigned($signed($unsigned(wire47[(2'h3):(1'h1)])));
      reg59 <= (8'hb3);
      reg60 <= wire47[(3'h6):(3'h4)];
    end
  always
    @(posedge clk) begin
      if ((+wire54[(3'h6):(3'h4)]))
        begin
          if ((reg60[(5'h13):(3'h6)] >> wire49[(1'h0):(1'h0)]))
            begin
              reg61 <= (wire53[(4'hd):(3'h4)] > $unsigned(reg59));
              reg62 <= (&($signed(((reg58 ? wire46 : wire56) ?
                  ((8'hb2) ? reg57 : wire49) : (wire55 ?
                      wire47 : wire52))) >> (|(wire56 ?
                  $unsigned(wire52) : $unsigned(reg58)))));
              reg63 <= (!{wire54,
                  (((!wire47) ^~ $signed(wire49)) && {$signed(reg61),
                      (wire54 ^~ (8'hb9))})});
            end
          else
            begin
              reg61 <= (-(reg60[(4'he):(1'h1)] == {reg62}));
              reg62 <= {wire49,
                  ($signed({$signed(wire49)}) ?
                      (((wire48 >>> wire55) ?
                          (wire48 != (8'ha7)) : reg59) <<< (wire46[(2'h2):(1'h1)] || (8'ha9))) : (^(reg62 ?
                          (-reg58) : $signed((8'hbf)))))};
              reg63 <= (wire47 ?
                  ((((reg60 < wire51) ^ (~|(8'ha4))) ^~ (|(wire53 ?
                      wire46 : wire54))) ~^ reg57[(1'h0):(1'h0)]) : ($unsigned((wire55 ~^ (|wire54))) + $signed(((wire56 != wire48) ?
                      (wire50 ? wire47 : wire55) : $signed(reg58)))));
            end
          reg64 <= $signed((~|((wire52 & $signed(wire49)) ^~ wire46[(2'h3):(1'h0)])));
          reg65 <= (&$signed(($unsigned($signed(wire56)) == wire55[(2'h3):(1'h0)])));
          if ($unsigned(wire51[(4'hf):(4'he)]))
            begin
              reg66 <= $signed(wire50);
            end
          else
            begin
              reg66 <= $signed((^~reg58[(4'hf):(4'ha)]));
            end
          reg67 <= (^(^wire50[(4'h8):(3'h7)]));
        end
      else
        begin
          if ((~^wire52))
            begin
              reg61 <= $signed((-((~(8'h9e)) * ((~wire53) ?
                  $signed(reg65) : (reg59 ? (8'hb2) : wire46)))));
              reg62 <= ($signed((!wire54[(4'hd):(4'hc)])) >> $signed($unsigned($signed((reg57 || wire55)))));
              reg63 <= ($signed(reg57) * $signed((+wire50[(1'h1):(1'h1)])));
              reg64 <= $signed((wire56[(4'h9):(3'h4)] ?
                  (^~$signed(wire49[(2'h3):(1'h1)])) : $signed(reg61)));
              reg65 <= (^wire46);
            end
          else
            begin
              reg61 <= (^~{((wire47 | $signed(wire51)) != $unsigned($unsigned(wire52)))});
              reg62 <= reg59[(5'h12):(4'hd)];
              reg63 <= (wire54[(2'h2):(2'h2)] ?
                  ($unsigned(((reg59 ? reg67 : reg64) + (wire52 ?
                      (8'ha2) : reg67))) >= $unsigned(wire47[(3'h6):(3'h4)])) : wire49[(3'h4):(2'h2)]);
            end
        end
      reg68 <= (((8'hb3) ?
              $signed(wire54) : (wire48 ?
                  $signed(reg61) : (^(reg57 && wire52)))) ?
          reg65[(4'he):(4'ha)] : reg62);
      if ((&wire50[(4'hc):(4'h8)]))
        begin
          reg69 <= {wire54};
        end
      else
        begin
          reg69 <= ({$signed($signed((reg60 ? reg62 : (8'ha4)))),
              (~&(|reg69[(2'h3):(1'h0)]))} ^ $unsigned(reg61[(4'he):(3'h4)]));
        end
    end
  assign wire70 = $unsigned((reg68 == ((~reg65[(3'h4):(3'h4)]) - reg60[(5'h10):(4'hd)])));
  assign wire71 = reg57[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg72 <= reg64;
      if (reg67[(5'h11):(1'h0)])
        begin
          if (({wire49,
              (wire51[(3'h7):(3'h6)] <= (-$signed(reg60)))} ^~ (~wire54[(4'hd):(4'hb)])))
            begin
              reg73 <= $signed(reg57);
              reg74 <= reg64;
            end
          else
            begin
              reg73 <= reg58[(5'h10):(5'h10)];
            end
        end
      else
        begin
          reg73 <= $unsigned((~|reg73[(2'h2):(1'h0)]));
          reg74 <= $signed($unsigned(($unsigned(wire52) + $signed((reg72 ?
              reg67 : wire46)))));
          reg75 <= $signed({(~reg61), {(|reg62[(1'h0):(1'h0)])}});
          reg76 <= $signed(({reg61[(5'h10):(3'h5)]} << {reg69,
              (wire50[(3'h7):(1'h0)] >>> $signed(wire70))}));
          reg77 <= ((reg74[(3'h4):(3'h4)] ?
                  $unsigned($unsigned(reg69[(1'h1):(1'h0)])) : {(wire49 ?
                          (+reg64) : (~|reg66))}) ?
              wire48[(3'h4):(2'h3)] : {reg66[(2'h2):(1'h0)]});
        end
    end
  assign wire78 = $signed((^($unsigned((~reg64)) && ($signed(reg58) <= $signed(wire48)))));
  assign wire79 = $unsigned($unsigned(($signed($unsigned(wire78)) ?
                      ((reg69 ?
                          reg77 : reg69) * reg64[(1'h0):(1'h0)]) : $signed($unsigned(wire46)))));
  assign wire80 = $unsigned(($unsigned($signed(((8'hb6) ? (8'hbe) : wire56))) ?
                      $signed({reg67[(4'hc):(2'h2)],
                          ((8'hae) ?
                              reg62 : wire46)}) : $unsigned(reg61[(5'h13):(4'hc)])));
  assign wire81 = (((~&(|(reg64 < reg60))) < reg66) ?
                      ((^~wire56) ?
                          reg58 : (~|reg68)) : $signed(reg63[(1'h1):(1'h1)]));
  assign wire82 = $unsigned(($signed({(wire81 > wire80),
                      $unsigned(reg76)}) + $signed($signed(wire55))));
  assign wire83 = $signed(($unsigned($signed((~^wire51))) ?
                      (~wire54[(4'h8):(4'h8)]) : ((|(~wire55)) != $unsigned(wire56))));
  assign wire84 = ((reg61[(2'h3):(2'h2)] & $signed($signed(wire82))) ?
                      $signed(wire50[(1'h1):(1'h0)]) : (reg61[(2'h2):(1'h1)] ?
                          wire81 : (|reg72)));
  assign wire85 = $unsigned(wire51[(4'he):(4'he)]);
  always
    @(posedge clk) begin
      if ($signed((wire79 < ($unsigned((wire82 | wire83)) & ((reg72 ?
              wire48 : (8'h9e)) ?
          $unsigned(wire52) : (^(8'ha0)))))))
        begin
          reg86 <= wire51;
          reg87 <= (~&(~^{reg74}));
        end
      else
        begin
          reg86 <= (~&(~^((8'h9e) + (wire54[(4'hf):(4'hc)] ?
              $signed(wire56) : (reg58 * wire70)))));
          reg87 <= $unsigned(wire47);
          reg88 <= (^~(~|($signed((!wire85)) ?
              (reg76 ^~ reg58[(3'h7):(3'h5)]) : ((reg86 ^~ reg74) && {wire81}))));
          reg89 <= wire47;
          reg90 <= wire85;
        end
      reg91 <= ({$unsigned((-$unsigned(reg64)))} - wire85);
      if (wire54)
        begin
          reg92 <= ((8'hae) ?
              wire53 : {(8'hb1),
                  (~&(reg86[(4'hc):(4'hb)] ?
                      $signed(wire55) : (reg75 ? wire79 : wire49)))});
          reg93 <= wire55;
          reg94 <= $signed($unsigned((((reg64 ?
              reg90 : reg60) || $unsigned(wire47)) || $signed($signed(reg64)))));
          reg95 <= (((wire71 >>> $signed((reg92 ?
              wire80 : reg92))) >>> reg61) - (8'hab));
        end
      else
        begin
          reg92 <= {reg72};
        end
    end
  always
    @(posedge clk) begin
      reg96 <= (~{{{$signed(reg60), (reg86 ^~ reg66)}, reg92[(1'h0):(1'h0)]},
          $unsigned((wire85 || {wire49, wire53}))});
      reg97 <= $unsigned(reg89[(1'h1):(1'h1)]);
      reg98 <= (($unsigned({((7'h42) << wire49)}) == wire71[(2'h2):(2'h2)]) ^ ((^$unsigned($unsigned(wire85))) ?
          wire46 : wire48[(2'h3):(2'h3)]));
      reg99 <= $unsigned(reg64[(3'h5):(3'h4)]);
    end
  always
    @(posedge clk) begin
      reg100 <= ($unsigned(((^~$signed(wire80)) != (|wire78[(2'h2):(1'h1)]))) ?
          reg98[(3'h4):(1'h0)] : reg67[(4'hf):(2'h2)]);
      reg101 <= $signed($signed(wire84[(3'h4):(1'h1)]));
    end
endmodule
