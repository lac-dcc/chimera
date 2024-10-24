module top
#(parameter param171 = (+({(((8'hbc) * (8'hbd)) ? ((8'ha6) ? (8'hbc) : (8'hb3)) : ((8'h9e) ? (8'hbd) : (7'h42)))} ? {({(8'hb3), (8'hb2)} && (^~(8'ha4))), ({(8'hb9)} ? (7'h43) : ((8'hba) >>> (8'hb3)))} : {(((8'hbc) < (8'hb3)) - ((8'h9d) ? (8'hb1) : (8'hb1)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire160;
  wire [(3'h6):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire157;
  wire signed [(4'hd):(1'h0)] wire156;
  wire signed [(5'h11):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire154;
  reg signed [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(4'hc):(1'h0)] reg168 = (1'h0);
  reg [(4'hb):(1'h0)] reg167 = (1'h0);
  reg [(4'ha):(1'h0)] reg166 = (1'h0);
  reg [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  assign y = {wire160,
                 wire158,
                 wire157,
                 wire156,
                 wire81,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire154,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 (1'h0)};
  assign wire4 = wire3[(2'h2):(2'h2)];
  assign wire5 = {(&{{(~|wire3)},
                         ($signed(wire3) ? (wire2 ? wire2 : wire0) : wire2)})};
  assign wire6 = wire0;
  assign wire7 = wire1;
  assign wire8 = (wire4[(3'h5):(1'h1)] ?
                     {(($signed(wire4) ~^ wire0) ?
                             ((^wire4) >>> (wire5 ^~ wire1)) : wire3[(1'h1):(1'h0)]),
                         wire4[(3'h5):(1'h0)]} : $signed({wire5[(1'h0):(1'h0)],
                         wire4}));
  assign wire9 = wire2;
  assign wire10 = ((~$unsigned(($signed((8'ha5)) ?
                          wire8 : wire3[(3'h7):(1'h1)]))) ?
                      $signed({$signed((^wire2))}) : $signed(((!(&wire9)) >= (8'hbc))));
  assign wire11 = $unsigned(((-{$signed(wire4), ((8'hbe) | wire3)}) ?
                      (8'ha8) : ((-(!wire8)) ?
                          $signed((^wire8)) : wire6[(1'h0):(1'h0)])));
  module12 #() modinst82 (.wire15(wire0), .wire13(wire1), .clk(clk), .wire17(wire4), .wire16(wire11), .wire14(wire3), .y(wire81));
  assign wire83 = ($signed($unsigned(wire2[(1'h0):(1'h0)])) | (wire11[(1'h1):(1'h0)] << (!$unsigned((-wire11)))));
  assign wire84 = (~(&(~(wire0 <= $signed((8'ha4))))));
  assign wire85 = wire81[(4'h8):(3'h5)];
  assign wire86 = ($unsigned(wire84) ^ ($unsigned(wire0) + (~&(8'hb9))));
  module87 #() modinst155 (.clk(clk), .wire92(wire8), .wire89(wire1), .wire91(wire3), .y(wire154), .wire88(wire83), .wire90(wire2));
  assign wire156 = $signed(wire10);
  assign wire157 = wire2;
  module117 #() modinst159 (wire158, clk, wire85, wire84, wire10, wire157);
  assign wire160 = ({($unsigned(wire85[(1'h0):(1'h0)]) ? wire85 : wire0),
                       wire85[(3'h4):(1'h1)]} + (8'ha6));
  always
    @(posedge clk) begin
      reg161 <= {wire84[(1'h1):(1'h0)],
          $signed($unsigned($unsigned((wire1 ? wire1 : (8'hb9)))))};
      reg162 <= wire11;
      reg163 <= {{(($signed(wire9) && (wire4 ?
                  wire5 : wire157)) >= ($signed(wire160) ?
                  (wire11 ? wire3 : (8'ha5)) : wire7[(5'h11):(1'h0)]))}};
    end
  always
    @(posedge clk) begin
      if ((~^{((|(!wire7)) ? ((^~wire7) | (^wire156)) : (&wire10))}))
        begin
          reg164 <= ($signed($signed((wire3 ?
                  $signed(reg161) : $unsigned(wire7)))) ?
              wire158[(2'h2):(1'h1)] : {$signed($unsigned((wire154 ?
                      wire1 : (8'ha3))))});
          reg165 <= wire5[(1'h1):(1'h1)];
          reg166 <= ((wire4 == (!({wire3} ?
                  wire0 : (wire9 ? wire160 : wire7)))) ?
              (+$unsigned(($unsigned(reg164) == $unsigned(wire83)))) : $signed($signed({(+wire7),
                  (|reg162)})));
          reg167 <= {wire8, (^~(~{{wire158, wire4}, {wire156}}))};
          reg168 <= (wire158[(1'h0):(1'h0)] ?
              $signed((|(wire6[(4'h9):(4'h8)] ?
                  $signed(wire6) : reg167[(3'h7):(1'h0)]))) : (!$unsigned(wire85[(3'h6):(3'h5)])));
        end
      else
        begin
          reg164 <= $signed(reg167);
          reg165 <= $signed($unsigned(((8'hb4) <<< $unsigned(reg165))));
          if (reg163[(2'h2):(1'h1)])
            begin
              reg166 <= reg168;
              reg167 <= ((&((wire85 ?
                      $signed(wire7) : (wire7 ? wire154 : reg163)) ?
                  {wire158, (wire11 ? reg163 : wire6)} : ($signed(wire0) ?
                      (wire10 ~^ (7'h43)) : (^(8'hb8))))) & wire5[(2'h2):(1'h1)]);
              reg168 <= ({(wire3[(4'hc):(4'ha)] ?
                          $signed(reg168[(1'h1):(1'h1)]) : wire156[(4'hb):(3'h4)]),
                      wire160} ?
                  reg166 : (wire10 ~^ wire0[(3'h4):(1'h0)]));
              reg169 <= reg161;
            end
          else
            begin
              reg166 <= ((({reg161[(1'h0):(1'h0)],
                  (~wire158)} <= wire2[(3'h4):(1'h1)]) > wire86[(1'h0):(1'h0)]) ~^ ($unsigned(wire158[(3'h6):(3'h6)]) || (&wire160[(3'h5):(3'h4)])));
              reg167 <= reg166[(3'h7):(2'h2)];
              reg168 <= $unsigned((({(reg166 || wire84)} ?
                      ((wire10 ? wire154 : reg163) ?
                          (8'hb1) : wire85) : ($unsigned(wire3) >> {wire4,
                          wire3})) ?
                  $unsigned(((wire86 - wire86) ?
                      reg161[(1'h1):(1'h1)] : wire5)) : ((wire156[(4'h9):(3'h6)] ?
                      (wire86 <<< reg164) : wire85) <<< wire154[(3'h4):(1'h1)])));
              reg169 <= $signed(wire2);
            end
          reg170 <= ((8'had) ?
              $signed($signed(wire11[(1'h1):(1'h1)])) : (({wire154,
                      ((8'ha8) ? reg165 : wire0)} - $unsigned((|wire4))) ?
                  (($unsigned(wire158) >>> (wire157 && wire85)) >> ($signed(wire154) & wire3)) : $unsigned(((wire8 ?
                          (8'h9d) : wire81) ?
                      (wire157 & wire2) : (^(8'hab))))));
        end
    end
endmodule

module module87
#(parameter param152 = ({((!(~^(8'ha5))) <<< (((8'haf) * (8'hbb)) > ((8'ha5) ? (7'h40) : (8'hb9))))} ? ((+{((8'hb8) ? (8'hb9) : (8'hb6)), ((8'ha3) ^~ (8'hb9))}) ? ((((7'h41) ~^ (7'h44)) ? ((8'hab) ? (8'hae) : (8'ha6)) : ((8'hb1) & (8'hb5))) ? (^~(~|(8'hb4))) : {((8'haa) || (8'ha0)), ((8'h9c) && (8'h9d))}) : (~&((|(8'hbf)) ? (~&(8'hbd)) : (~^(8'hb5))))) : ((~^{((8'hb5) ? (8'hbe) : (8'hb7)), (&(8'hb7))}) ? ((8'ha9) >>> ((~|(8'ha7)) ? (&(8'haf)) : ((7'h43) != (8'hbf)))) : (({(8'ha0)} ? ((8'hbb) >= (8'hb0)) : ((8'ha0) ? (8'hbc) : (8'hac))) == (&((7'h42) ? (8'hb6) : (8'haf)))))), 
parameter param153 = ((8'hab) | param152))
(y, clk, wire88, wire89, wire90, wire91, wire92);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire88;
  input wire signed [(4'h8):(1'h0)] wire89;
  input wire signed [(2'h3):(1'h0)] wire90;
  input wire signed [(5'h13):(1'h0)] wire91;
  input wire [(5'h10):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire109;
  wire signed [(5'h10):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire134;
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  assign y = {wire150,
                 wire93,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire134,
                 reg116,
                 reg115,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire93 = (((^~$signed((wire88 ? wire91 : wire90))) ?
                      (-wire89) : $signed(wire91[(4'h9):(3'h7)])) >> ($signed(($signed(wire92) >= $signed(wire91))) * {(+wire90[(2'h3):(2'h3)]),
                      (-$signed(wire88))}));
  always
    @(posedge clk) begin
      if (wire90[(2'h3):(1'h0)])
        begin
          reg94 <= ((($signed((-wire93)) ~^ (wire91[(2'h2):(1'h0)] ?
                      $signed(wire91) : (wire90 ? wire90 : (8'hb5)))) ?
                  (~^(&wire88[(3'h4):(1'h1)])) : {wire92[(4'hc):(3'h7)],
                      (|{wire90})}) ?
              {(!$unsigned((wire89 ? wire91 : wire92))),
                  $signed(wire90[(2'h3):(1'h0)])} : (((~|(wire92 * wire93)) <<< ($unsigned((7'h42)) ?
                  (^wire93) : wire90)) | (((8'h9c) ?
                      $unsigned(wire93) : (wire90 ? wire92 : wire91)) ?
                  {wire91} : (7'h42))));
          reg95 <= $signed($unsigned($signed(reg94[(4'hc):(4'h8)])));
          reg96 <= $signed(reg94[(3'h7):(3'h7)]);
        end
      else
        begin
          reg94 <= ((((~^(!reg96)) ?
                      reg96 : ((wire91 == wire89) ?
                          {wire89} : (wire91 | (8'hb9)))) ?
                  {(wire91[(3'h6):(3'h4)] ?
                          (^~wire93) : (wire92 ? reg96 : wire91)),
                      wire89[(3'h4):(3'h4)]} : {((|reg95) != $signed((8'had))),
                      (wire92[(2'h3):(2'h2)] * $unsigned(wire93))}) ?
              wire93 : ((((8'ha9) + $unsigned(wire89)) ?
                      $unsigned($unsigned(wire88)) : (+wire90[(2'h3):(2'h3)])) ?
                  $unsigned(($unsigned(wire91) <<< wire91[(3'h7):(1'h0)])) : ($unsigned($signed(reg94)) ?
                      (!wire88[(2'h3):(2'h2)]) : reg95)));
          reg95 <= ((reg96[(1'h1):(1'h1)] <= {((wire90 ^ reg95) ?
                      $unsigned(wire89) : wire92[(4'hc):(4'hb)]),
                  (&wire91)}) ?
              wire92 : (~&reg95));
          reg96 <= {$signed(($unsigned((wire89 ?
                  wire92 : (8'hbe))) ^~ {((8'hb8) >> reg94),
                  wire89[(2'h3):(1'h0)]})),
              $signed(reg94)};
          if ((~&$signed(wire91[(3'h7):(1'h0)])))
            begin
              reg97 <= wire89;
              reg98 <= (~|(wire91 || wire88[(4'ha):(3'h4)]));
              reg99 <= (~&$unsigned($unsigned((reg98 <= (reg96 ?
                  wire92 : reg95)))));
              reg100 <= reg95[(3'h4):(2'h2)];
            end
          else
            begin
              reg97 <= (~^$signed(reg99[(2'h2):(1'h1)]));
              reg98 <= {$signed($signed(((wire93 ?
                      (8'had) : reg97) ~^ (~^wire92)))),
                  (reg99 ? $signed($signed((~^wire89))) : (~|(8'hb1)))};
            end
        end
      reg101 <= reg97;
      reg102 <= $signed({(((~|reg96) ?
              $unsigned(reg97) : wire92[(3'h7):(1'h1)]) | ((~|(8'ha3)) ^ $unsigned((8'hb8))))});
    end
  assign wire103 = $unsigned({reg97});
  assign wire104 = (((!($unsigned(wire89) ? (+reg95) : {reg101, wire90})) ?
                       (&{$unsigned((8'hb4)),
                           ((7'h44) ?
                               reg102 : wire90)}) : $signed($unsigned(((8'ha6) ?
                           wire91 : reg100)))) - reg94[(1'h0):(1'h0)]);
  assign wire105 = {(8'hb2),
                       ($unsigned((reg100[(4'he):(4'ha)] ?
                               ((8'ha5) ?
                                   wire88 : (8'hb8)) : $signed((8'hb4)))) ?
                           $signed((|(8'ha2))) : ((8'haf) ?
                               $signed(wire103[(1'h1):(1'h0)]) : (~(!reg102))))};
  assign wire106 = $unsigned(($signed(((wire92 ? reg100 : wire88) ?
                       wire90[(2'h2):(1'h0)] : wire90[(1'h0):(1'h0)])) >= $unsigned($signed(reg95))));
  assign wire107 = wire105;
  assign wire108 = wire93;
  assign wire109 = {wire89[(1'h0):(1'h0)]};
  assign wire110 = reg100;
  assign wire111 = reg96[(3'h6):(2'h3)];
  assign wire112 = $signed(wire89);
  assign wire113 = wire104;
  assign wire114 = $signed((((^$unsigned(wire90)) >= {{wire93}}) ?
                       wire110[(3'h7):(1'h1)] : $signed(({reg96} ?
                           wire108 : $signed(reg97)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire107))
        begin
          reg115 <= (reg99 ?
              ($signed($signed(wire113)) | wire113) : ($signed(wire91) + $signed(((~reg96) ?
                  (wire93 ? (8'h9f) : wire103) : reg98))));
          reg116 <= wire92[(2'h2):(1'h0)];
        end
      else
        begin
          reg115 <= reg94;
          reg116 <= {(&$signed($unsigned((~wire93)))), (8'hbc)};
        end
    end
  module117 #() modinst135 (wire134, clk, wire107, reg98, wire92, wire88);
  module136 #() modinst151 (.y(wire150), .wire140(wire91), .wire137(reg100), .wire138(wire134), .clk(clk), .wire139(wire93), .wire141(wire88));
endmodule

module module12  (y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire78;
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  assign y = {wire80,
                 wire35,
                 wire36,
                 wire78,
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
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({$signed($unsigned(({wire14} * wire13[(2'h2):(2'h2)]))),
          (&(+{((8'hb2) >>> wire13)}))})
        begin
          reg18 <= wire15[(1'h0):(1'h0)];
          if ($unsigned(wire16[(1'h0):(1'h0)]))
            begin
              reg19 <= $unsigned((8'hbf));
              reg20 <= ((wire17[(4'h8):(3'h7)] ?
                  wire14 : (wire15[(1'h1):(1'h0)] ?
                      ((reg19 ? (7'h42) : wire15) << (reg18 ?
                          (8'haa) : wire16)) : ((wire15 ?
                          (8'hb2) : wire14) < (&wire16)))) * wire17);
            end
          else
            begin
              reg19 <= ((^~$signed($unsigned(wire17))) <<< reg20);
              reg20 <= reg20[(1'h0):(1'h0)];
              reg21 <= ((~&{$unsigned($signed(wire14)), (8'hac)}) ?
                  $signed(((^reg19) ?
                      $unsigned((+wire14)) : reg18)) : (|reg19));
            end
          if (($unsigned((reg19 ^~ (+$unsigned(wire17)))) == (~^reg18)))
            begin
              reg22 <= (~$signed($signed((-(^wire16)))));
              reg23 <= (~$unsigned(reg20));
              reg24 <= ($unsigned({(8'hac),
                  wire14}) ~^ $unsigned($signed($signed({wire13}))));
            end
          else
            begin
              reg22 <= ((8'hb4) ?
                  (wire16 >>> {reg23[(4'hb):(2'h3)],
                      (~$unsigned(reg24))}) : wire16);
              reg23 <= wire15[(1'h1):(1'h1)];
              reg24 <= reg19[(1'h0):(1'h0)];
            end
          reg25 <= {$signed((((reg24 ? (8'hb9) : reg19) ?
                      (-(8'hb7)) : (&wire13)) ?
                  ($signed(wire15) ^~ $signed(reg24)) : reg21[(2'h3):(2'h3)]))};
          reg26 <= reg22;
        end
      else
        begin
          if ((-reg20))
            begin
              reg18 <= ($unsigned((^~$unsigned((reg20 ^ (8'haf))))) >>> ($signed($signed({(8'hbd),
                  reg25})) > ((|(wire16 & wire13)) ?
                  (wire14[(1'h1):(1'h0)] * reg23) : $unsigned((-wire14)))));
            end
          else
            begin
              reg18 <= $signed(((-wire15) ? (~|{((8'hbe) ^ wire15)}) : wire15));
              reg19 <= wire17;
              reg20 <= {($unsigned(($signed(wire16) ?
                      {reg18, wire17} : reg25)) | {(^~reg19[(4'hc):(1'h0)]),
                      wire17})};
              reg21 <= ($signed(((reg25 ?
                  (8'haf) : $unsigned(reg24)) ^ $signed(reg23))) != (reg20[(2'h3):(1'h1)] <<< $signed((wire14[(5'h14):(4'hd)] ?
                  ((8'hb8) | reg20) : ((8'hb4) > reg19)))));
              reg22 <= {(~(~&reg18))};
            end
          reg23 <= $signed((!($unsigned(reg18[(4'hb):(1'h1)]) << (+reg20))));
        end
      reg27 <= reg23[(3'h4):(2'h2)];
      if ($unsigned(reg25))
        begin
          reg28 <= {reg21, {reg27[(1'h1):(1'h1)]}};
          reg29 <= {reg23[(3'h6):(1'h0)], (-wire15)};
          reg30 <= ((~&reg29) ^ $unsigned(reg19[(5'h10):(4'hf)]));
        end
      else
        begin
          reg28 <= reg26[(1'h1):(1'h1)];
          if ((+wire13))
            begin
              reg29 <= (|$unsigned(reg29[(1'h0):(1'h0)]));
            end
          else
            begin
              reg29 <= $unsigned($signed({$signed($unsigned((8'had))),
                  {$signed(reg23)}}));
              reg30 <= (~|$signed((wire16 ?
                  $signed((wire16 ? reg25 : reg20)) : reg22)));
              reg31 <= $signed(({({reg22} << reg19), reg29} ?
                  reg20 : (($unsigned((7'h42)) ?
                          $signed(reg28) : $unsigned(reg24)) ?
                      ((reg27 ? reg25 : reg19) >>> $signed(reg29)) : reg29)));
              reg32 <= reg23[(4'ha):(1'h0)];
              reg33 <= reg24;
            end
        end
      reg34 <= $unsigned(reg25[(5'h10):(2'h3)]);
    end
  assign wire35 = reg32;
  assign wire36 = (~&wire13);
  always
    @(posedge clk) begin
      reg37 <= ($unsigned(reg24[(3'h5):(2'h3)]) <<< wire15);
      reg38 <= $signed($signed((((8'hae) ?
              $signed((8'hb0)) : $unsigned(reg31)) ?
          reg22[(3'h4):(1'h0)] : {{wire16, reg37}, reg20})));
      reg39 <= reg27;
      if ((wire16 & (^$signed(wire35[(4'h9):(2'h3)]))))
        begin
          reg40 <= $signed($signed((((!reg29) > $unsigned(reg20)) ?
              {reg25,
                  (reg31 ?
                      reg18 : reg23)} : ($unsigned(reg26) == $unsigned(wire16)))));
          reg41 <= reg21;
        end
      else
        begin
          if ($unsigned(((|reg24) ?
              $unsigned({$unsigned(reg33),
                  (reg23 >> (8'hb8))}) : $unsigned($signed($signed(reg23))))))
            begin
              reg40 <= $signed(wire14[(4'hf):(4'hb)]);
              reg41 <= (-reg34[(3'h4):(3'h4)]);
              reg42 <= $unsigned($signed((~&$signed(reg26))));
            end
          else
            begin
              reg40 <= ((reg34 ?
                  reg24[(4'he):(4'h9)] : $unsigned((reg39[(5'h13):(4'h9)] ?
                      reg40 : reg25))) > reg34);
              reg41 <= reg37;
              reg42 <= $unsigned(reg40[(3'h6):(3'h6)]);
              reg43 <= $unsigned(reg37[(2'h3):(2'h3)]);
            end
          reg44 <= ((^reg20[(2'h2):(2'h2)]) || $unsigned((8'hbf)));
          if ($signed(($signed($signed(((8'ha4) > reg19))) - (-$signed((~|reg43))))))
            begin
              reg45 <= ($signed((((reg40 ?
                  (8'hb6) : (8'ha4)) << {reg39}) << $unsigned($signed(reg25)))) || (+$unsigned(wire16[(3'h4):(1'h1)])));
            end
          else
            begin
              reg45 <= ((|$unsigned((((8'hbd) ^~ reg34) <= (-reg45)))) ?
                  (-(8'hb8)) : ($unsigned((reg37 == $signed(reg20))) * $unsigned((^~(reg19 ?
                      reg24 : reg41)))));
              reg46 <= reg39;
              reg47 <= ($unsigned($unsigned(reg31[(2'h3):(1'h0)])) ?
                  reg46[(5'h10):(4'hf)] : reg34);
              reg48 <= (|reg34[(3'h5):(1'h0)]);
              reg49 <= ((!reg22) & $unsigned(wire16[(3'h4):(3'h4)]));
            end
          if ($signed((~reg43)))
            begin
              reg50 <= $signed((~($unsigned(reg46) >>> ((reg27 ?
                  reg18 : (8'had)) | wire14))));
              reg51 <= $signed(($signed((&((8'hbf) ? (8'hb5) : reg21))) ?
                  (reg41 ?
                      $unsigned({reg20}) : $signed((wire13 - reg22))) : (((-reg22) <= $signed(reg38)) ?
                      reg24[(1'h0):(1'h0)] : ((reg32 ? reg32 : wire36) ?
                          (!reg50) : $signed(reg30)))));
            end
          else
            begin
              reg50 <= $signed($signed(({$signed(reg31), {reg27}} ?
                  {(reg19 > reg45)} : ({reg19, reg23} | $unsigned((7'h42))))));
              reg51 <= (reg30[(1'h1):(1'h1)] || ($unsigned(reg20) ?
                  (+$unsigned((reg38 ? reg38 : reg49))) : (($unsigned(reg48) ?
                      ((8'hbe) | reg43) : (wire36 ?
                          (8'hb9) : reg47)) <<< $signed($unsigned((8'hb1))))));
              reg52 <= ((|$signed(($unsigned(wire16) ?
                  $unsigned(reg38) : (|reg48)))) < (($signed((reg39 ?
                      (7'h41) : reg45)) != $signed(((8'ha0) ?
                      reg38 : (8'ha1)))) ?
                  {$unsigned($unsigned(wire15))} : $signed($unsigned({reg34,
                      (8'h9e)}))));
              reg53 <= (|(~reg32));
            end
          reg54 <= reg32;
        end
      reg55 <= $unsigned(($signed(reg37[(4'hb):(4'ha)]) ?
          $signed(((reg23 ? wire17 : reg49) ?
              $unsigned(reg48) : {reg23})) : (|$unsigned((reg26 ?
              reg40 : wire35)))));
    end
  module56 #() modinst79 (.wire58(reg31), .y(wire78), .clk(clk), .wire60(reg39), .wire57(wire36), .wire59(reg29));
  assign wire80 = (+reg34);
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire60;
  input wire [(4'hc):(1'h0)] wire59;
  input wire [(5'h14):(1'h0)] wire58;
  input wire signed [(4'hb):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire69,
                 wire68,
                 reg72,
                 reg71,
                 reg70,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg61 <= $signed((+$signed(((!(8'hbb)) ^~ (^~(8'hb3))))));
      reg62 <= wire60;
      if ((wire58[(1'h0):(1'h0)] > $unsigned((~&($unsigned(wire59) + $signed((8'hb8)))))))
        begin
          reg63 <= ((-$signed(((reg61 << wire59) ?
                  reg62[(3'h6):(1'h1)] : {wire57, wire57}))) ?
              ((reg61 > $signed((reg62 >> wire60))) & ($unsigned($signed(wire58)) ?
                  reg61 : (wire60 ?
                      (wire60 ?
                          (8'hba) : (8'hab)) : (~&(7'h40))))) : (~&(wire57 ?
                  $signed(wire57[(2'h2):(1'h0)]) : reg61[(3'h7):(3'h6)])));
          reg64 <= ($unsigned($unsigned(reg62)) >= (!(reg61 ^ reg62)));
        end
      else
        begin
          if (({((8'ha3) ^~ $signed(reg64[(2'h2):(1'h1)])),
                  ((8'h9e) ^~ $signed(((7'h43) ? reg62 : wire59)))} ?
              reg61[(2'h3):(2'h3)] : (8'hb5)))
            begin
              reg63 <= ({(({(7'h41),
                      reg61} * wire59[(4'hc):(4'hb)]) == (((8'ha7) * reg64) * $unsigned(reg64)))} || (^((8'hbb) ?
                  (~^reg62) : wire60)));
              reg64 <= $unsigned((wire60 ^~ $unsigned({(wire60 ?
                      reg62 : wire58)})));
            end
          else
            begin
              reg63 <= wire60[(3'h4):(2'h2)];
              reg64 <= reg61;
            end
          reg65 <= {reg62};
          reg66 <= {{($signed($unsigned(wire58)) << {reg65[(2'h2):(1'h0)],
                      $unsigned(reg65)}),
                  wire59}};
        end
      reg67 <= {{$signed((wire58 - $unsigned((8'hba))))}};
    end
  assign wire68 = $signed({$signed(wire60[(1'h0):(1'h0)]),
                      $signed($unsigned($signed(reg66)))});
  assign wire69 = (-reg67[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg70 <= (-reg64[(1'h1):(1'h1)]);
      reg71 <= ((8'h9c) ?
          $signed($signed($unsigned(wire59))) : {(((8'ha3) ~^ (-wire59)) + {(reg70 ?
                      wire60 : (8'hac)),
                  {reg64, reg63}}),
              $signed(((+reg67) ?
                  reg61[(3'h7):(2'h3)] : ((8'hb1) ? reg63 : (8'hb5))))});
      reg72 <= wire58[(5'h12):(3'h4)];
    end
  assign wire73 = (((+(|(reg61 ?
                      (7'h40) : wire69))) >> reg61[(2'h2):(2'h2)]) && {wire68});
  assign wire74 = $unsigned({reg67, reg71[(1'h0):(1'h0)]});
  assign wire75 = wire74;
  assign wire76 = reg63[(1'h0):(1'h0)];
  assign wire77 = (^~{reg63,
                      (reg65[(1'h1):(1'h1)] + ($signed(reg67) ?
                          (wire60 > reg70) : (wire76 >= reg63)))});
endmodule

module module136
#(parameter param149 = ((+{((!(8'haf)) ? (^~(8'hab)) : ((8'h9d) ^~ (8'hac)))}) * (~^((((7'h44) ? (8'h9d) : (8'hb0)) <<< ((7'h40) ? (8'h9f) : (8'haa))) ? ((8'hbf) ? (&(8'hba)) : ((8'hbf) ? (8'haa) : (8'ha8))) : {((8'hb6) ? (8'hab) : (8'haa))}))))
(y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire141;
  input wire [(5'h13):(1'h0)] wire140;
  input wire [(5'h10):(1'h0)] wire139;
  input wire [(4'hb):(1'h0)] wire138;
  input wire signed [(5'h10):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire148;
  wire signed [(5'h12):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire142;
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 (1'h0)};
  assign wire142 = (&(-(({wire138} ? wire138 : $unsigned(wire138)) ?
                       $unsigned((wire138 ^~ wire137)) : ((|wire140) ?
                           (wire137 & wire140) : (&wire139)))));
  assign wire143 = $signed(wire138);
  assign wire144 = (wire142 >> (wire138 ?
                       $signed((wire137[(3'h7):(2'h3)] ?
                           wire142[(1'h1):(1'h0)] : (~&(8'hba)))) : wire143));
  assign wire145 = (((8'hb9) << $signed($unsigned((wire140 ?
                           wire144 : (8'hb8))))) ?
                       $unsigned($signed((~(+wire140)))) : wire143);
  assign wire146 = wire144;
  assign wire147 = $unsigned($signed(((^wire140[(4'ha):(3'h7)]) ?
                       ({wire146} <= ((8'hbb) ~^ wire140)) : (+(~wire145)))));
  assign wire148 = (((&wire145) ~^ ($signed((8'hb1)) <= (~wire140[(4'h8):(3'h6)]))) ?
                       ((~&(wire143[(2'h3):(1'h0)] ? wire143 : (^wire143))) ?
                           wire140 : wire145[(1'h0):(1'h0)]) : wire147[(3'h4):(2'h3)]);
endmodule

module module117
#(parameter param132 = (-(~^(+{((8'h9d) >> (8'ha7)), (+(8'ha0))}))), 
parameter param133 = ((({((8'hb2) ? param132 : param132)} >>> (((7'h43) ? param132 : param132) >>> ((8'ha9) ? param132 : param132))) << (^~param132)) ? ((!(param132 ? (param132 & param132) : {param132})) ? ((param132 ? (param132 < param132) : (param132 ^ param132)) >= ((+param132) ^ (param132 ? param132 : param132))) : (param132 + param132)) : param132))
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire121;
  input wire signed [(4'h9):(1'h0)] wire120;
  input wire signed [(4'hf):(1'h0)] wire119;
  input wire [(4'hf):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire130;
  wire signed [(3'h4):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg122,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg122 <= (|$unsigned(wire119));
    end
  assign wire123 = ((|wire120) & wire118);
  assign wire124 = (((wire121[(4'h8):(1'h0)] ?
                           wire119[(4'h9):(3'h6)] : ($unsigned(wire119) ^~ (reg122 ?
                               wire119 : (8'hb3)))) ?
                       $unsigned($unsigned({(8'hb2),
                           wire120})) : (((wire118 != wire118) != wire123) ?
                           $signed(wire123) : ((8'ha4) != wire119[(1'h1):(1'h1)]))) == ($unsigned(wire118[(4'h9):(4'h8)]) ?
                       (~wire118) : wire119));
  assign wire125 = $signed((~(~|wire118[(3'h6):(1'h1)])));
  assign wire126 = $unsigned((^wire125[(2'h3):(2'h3)]));
  assign wire127 = $signed($unsigned($unsigned({(wire126 | wire118)})));
  assign wire128 = wire123;
  assign wire129 = {$signed(wire121[(3'h5):(2'h3)]),
                       $unsigned((~(-wire119[(4'hf):(4'he)])))};
  assign wire130 = $unsigned(($signed(((|wire118) ^ (wire126 ~^ (8'ha8)))) == (-wire125)));
  assign wire131 = (!($signed(((wire129 ?
                       wire126 : wire130) & $signed(reg122))) ^ $unsigned($unsigned({wire123,
                       wire123}))));
endmodule
