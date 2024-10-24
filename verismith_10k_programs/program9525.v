module top
#(parameter param125 = (~&(8'hb6)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  assign y = {wire124,
                 wire116,
                 wire108,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire4,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
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
                 (1'h0)};
  assign wire4 = (&($signed($unsigned($signed((8'hb3)))) ?
                     (!wire2) : ({wire2} ?
                         (8'h9e) : $unsigned((wire3 + wire3)))));
  always
    @(posedge clk) begin
      reg5 <= $unsigned(($signed(($unsigned((8'hb5)) ~^ (wire4 ^~ wire1))) ?
          $signed(wire0[(5'h11):(3'h7)]) : wire2));
    end
  always
    @(posedge clk) begin
      reg6 <= wire0;
      if ($unsigned({((|(reg5 ? wire3 : wire4)) ?
              $signed(reg6[(3'h6):(1'h1)]) : $unsigned((wire2 >= wire2)))}))
        begin
          reg7 <= (8'h9e);
          if ((($unsigned(((+reg7) + (8'hbb))) | wire4[(4'ha):(3'h7)]) == (~((-wire4) ?
              reg5[(1'h1):(1'h0)] : $unsigned((8'hb7))))))
            begin
              reg8 <= ($signed((((wire1 ?
                      reg5 : wire4) | (8'hba)) | (~&(!(8'haa))))) ?
                  wire4[(4'h8):(3'h4)] : reg5);
              reg9 <= (7'h44);
              reg10 <= ((~^wire3[(4'hb):(3'h5)]) - wire1);
              reg11 <= $unsigned(reg8);
            end
          else
            begin
              reg8 <= $signed((8'ha0));
              reg9 <= wire2;
            end
        end
      else
        begin
          reg7 <= ((|$signed(((~&wire2) >>> (~^(7'h44))))) | (+(+{reg6[(2'h2):(1'h1)]})));
          if (reg10)
            begin
              reg8 <= (reg7 ?
                  $unsigned(((~$unsigned(wire1)) ?
                      {(^~(8'hbc))} : $unsigned((~wire1)))) : (~$signed((^~reg9))));
              reg9 <= $unsigned(($unsigned(wire4) ^ ($unsigned($unsigned(wire4)) | $unsigned((reg9 <= reg6)))));
            end
          else
            begin
              reg8 <= $unsigned((~|($signed($unsigned((8'ha6))) + $unsigned(wire4))));
              reg9 <= $unsigned(reg7[(4'h8):(2'h3)]);
              reg10 <= reg7;
              reg11 <= (wire2 ?
                  (wire2[(4'ha):(2'h3)] ?
                      ($signed(wire1) >>> (wire2 ?
                          wire0 : reg7)) : (~reg10[(1'h1):(1'h1)])) : ($signed(wire1) ?
                      wire2 : ($signed((wire1 >>> wire4)) ?
                          $signed(((8'ha2) ? reg10 : wire3)) : ($signed(wire0) ?
                              ((8'ha1) > reg5) : (wire3 * (8'h9e))))));
            end
          reg12 <= (8'hb7);
          reg13 <= (^~reg10[(2'h2):(1'h0)]);
        end
      if (({(8'ha6)} ^ (^~($unsigned(reg5) ?
          $signed((~|reg13)) : (+(~|(7'h41)))))))
        begin
          if ((~reg9[(3'h4):(2'h2)]))
            begin
              reg14 <= ((!($signed((|reg5)) <<< $signed($unsigned(reg5)))) ?
                  wire0[(4'hd):(3'h6)] : (!{(~$unsigned(wire2)),
                      $signed({reg12, reg6})}));
              reg15 <= reg11[(4'h8):(1'h0)];
              reg16 <= (($unsigned(((wire0 ?
                      wire1 : reg11) >> wire4[(2'h2):(1'h1)])) ?
                  ($unsigned((reg5 ^~ (8'ha2))) ?
                      wire3[(3'h5):(1'h1)] : $unsigned($signed(wire2))) : $signed((((8'hbf) > reg6) >>> reg6[(4'hb):(1'h1)]))) > ((~|($signed(wire3) ?
                  {reg10, reg11} : (reg8 != reg9))) < (((8'h9d) ?
                  (wire3 >= reg11) : $unsigned(reg10)) << (^~(reg12 ?
                  reg8 : wire1)))));
              reg17 <= ((+wire2) ?
                  (|$signed($signed({wire1}))) : (reg5 ?
                      ($signed($unsigned(reg13)) >> ((reg9 >>> reg6) <= {wire3})) : reg15));
              reg18 <= reg11;
            end
          else
            begin
              reg14 <= (reg7[(2'h2):(1'h0)] ?
                  (~{$signed((wire0 ?
                          reg16 : (8'hbc)))}) : ((reg11[(1'h0):(1'h0)] | reg8[(3'h5):(1'h1)]) ?
                      (~(reg15[(1'h0):(1'h0)] ~^ (reg6 != (8'hbb)))) : {($signed(reg11) == {(7'h42)}),
                          $signed({reg9, (8'hb7)})}));
            end
          if (wire0[(4'he):(4'hb)])
            begin
              reg19 <= reg11[(5'h12):(2'h3)];
            end
          else
            begin
              reg19 <= ($signed((reg18[(4'hb):(1'h1)] << reg11[(2'h3):(2'h3)])) <= reg11);
            end
        end
      else
        begin
          reg14 <= reg5[(2'h2):(1'h1)];
          reg15 <= (({{reg12[(4'ha):(2'h2)]}} ?
              (($signed(reg19) ?
                  reg6[(4'hc):(3'h7)] : (|(8'ha1))) | $signed((wire1 << reg14))) : (^($signed(wire1) < (reg7 ?
                  reg11 : reg14)))) >> (^~(((reg10 > reg13) <= $signed((8'ha4))) ?
              reg19 : $signed($unsigned(reg15)))));
        end
      reg20 <= (~^(^~(reg9 ? ((^~reg11) * (^~reg8)) : wire0[(2'h2):(2'h2)])));
    end
  assign wire21 = reg16;
  assign wire22 = $signed(reg17);
  assign wire23 = $signed($unsigned(reg16[(4'ha):(2'h2)]));
  assign wire24 = (reg19[(2'h2):(2'h2)] ?
                      ($signed((^(reg8 ? reg10 : reg10))) <<< $unsigned((reg5 ?
                          reg5[(2'h3):(1'h1)] : $unsigned(reg17)))) : $unsigned((((reg17 >>> reg12) ^ reg14) ?
                          reg19[(4'h8):(1'h1)] : reg13)));
  module25 #() modinst109 (.y(wire108), .wire28(reg5), .wire26(reg9), .wire29(wire21), .clk(clk), .wire27(wire22), .wire30(reg11));
  always
    @(posedge clk) begin
      reg110 <= (reg14 ~^ (8'hb4));
      reg111 <= reg110;
      if (({wire23[(5'h11):(2'h2)],
          (reg8[(1'h0):(1'h0)] ~^ $unsigned(((8'h9d) * reg18)))} > ($signed((~^$unsigned((8'had)))) ?
          $signed({{reg11}, (reg9 ? reg18 : wire22)}) : (reg18 ?
              ($unsigned((7'h40)) == (|wire4)) : reg11))))
        begin
          reg112 <= $signed((reg17[(3'h5):(3'h5)] ?
              (^~(reg14[(1'h0):(1'h0)] + (~|reg13))) : reg17));
          reg113 <= ((reg10[(1'h0):(1'h0)] - $unsigned((reg6 < (reg14 ?
              reg20 : reg11)))) != $signed(((|reg6[(1'h0):(1'h0)]) ?
              reg9[(3'h4):(2'h3)] : reg14)));
        end
      else
        begin
          reg112 <= reg110[(1'h0):(1'h0)];
          reg113 <= wire22[(3'h7):(1'h0)];
        end
      reg114 <= (|wire22);
      reg115 <= {wire24[(3'h7):(2'h2)]};
    end
  assign wire116 = wire24[(4'hb):(3'h6)];
  always
    @(posedge clk) begin
      reg117 <= wire2;
      reg118 <= {$signed($unsigned(((|reg117) ? reg9 : reg110))),
          (reg20 ? $signed(reg8) : reg113)};
      reg119 <= wire4[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg120 <= reg115;
      reg121 <= (~&reg18);
      reg122 <= wire23;
      reg123 <= $signed((reg5[(3'h7):(1'h0)] ?
          wire116 : (((~&reg10) ?
                  $unsigned(reg11) : (reg111 ? reg117 : wire3)) ?
              reg117[(1'h0):(1'h0)] : (^$signed((7'h44))))));
    end
  assign wire124 = reg18[(3'h6):(1'h1)];
endmodule

module module25
#(parameter param107 = ((((((8'ha2) ? (8'hab) : (8'ha8)) & ((8'hae) << (8'hae))) ^ (8'had)) >= ((((8'had) ? (8'ha8) : (8'ha5)) ? (!(8'ha1)) : {(8'hb0)}) && (~&{(8'h9d)}))) << (({((8'h9e) <= (8'hb0))} ? (&(+(8'ha1))) : ({(8'ha5), (8'hbf)} ^ (~|(8'hb0)))) ? ((((8'hbc) ? (8'hba) : (8'hb1)) <<< ((8'hb1) != (8'h9d))) >>> (((8'hb1) ? (8'hb3) : (8'hb3)) >> (8'hb0))) : (((8'had) && (8'ha5)) ? (8'hb6) : ((|(8'h9c)) ^~ ((7'h42) <<< (8'hbe)))))))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire [(4'he):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire signed [(4'ha):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  assign y = {wire106, wire103, wire75, wire33, wire32, wire31, reg105, (1'h0)};
  assign wire31 = wire30;
  assign wire32 = wire27;
  assign wire33 = (^$unsigned(wire29));
  module34 #() modinst76 (.wire37(wire28), .clk(clk), .wire36(wire29), .wire38(wire30), .y(wire75), .wire35(wire26));
  module77 #() modinst104 (.wire81(wire30), .wire78(wire75), .wire80(wire31), .y(wire103), .wire79(wire29), .clk(clk));
  always
    @(posedge clk) begin
      reg105 <= ((~^(wire75 ?
          (wire28 ?
              $unsigned((8'hb3)) : $unsigned((8'hac))) : (wire103[(4'he):(1'h0)] ^~ $unsigned((7'h42))))) ^ ($signed(wire26) ?
          $signed(wire32) : {({wire29} ?
                  (wire33 ? wire28 : wire29) : $signed((8'h9c)))}));
    end
  assign wire106 = $signed($unsigned($unsigned((^~wire27))));
endmodule

module module77
#(parameter param101 = (^~(((~(^~(8'ha3))) <= {((8'haa) ? (8'ha4) : (8'hbe)), ((8'hb6) ? (8'hae) : (8'ha1))}) != (~&(((8'haa) ? (8'h9f) : (8'hac)) ? ((8'had) ? (8'hab) : (8'had)) : ((8'ha3) ? (8'h9d) : (8'hbc)))))), 
parameter param102 = param101)
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire81;
  input wire signed [(2'h3):(1'h0)] wire80;
  input wire [(4'h8):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire82;
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire82,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
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
                 (1'h0)};
  assign wire82 = wire78;
  always
    @(posedge clk) begin
      if (wire80)
        begin
          reg83 <= wire80[(1'h1):(1'h0)];
          reg84 <= (~((((wire82 >= wire80) >> wire79) ?
                  $signed(wire80[(1'h0):(1'h0)]) : $signed((&wire81))) ?
              ($signed((wire79 >= wire78)) * $signed((reg83 ?
                  wire80 : wire82))) : (wire81 ?
                  (!(wire82 ? wire79 : (8'hb9))) : wire81[(4'hb):(4'hb)])));
          reg85 <= {(|wire79[(2'h3):(1'h0)])};
          reg86 <= (wire80 ?
              wire82 : $unsigned((wire79[(3'h5):(2'h3)] ~^ wire80)));
          reg87 <= ((reg83 | (7'h42)) << $signed(((wire82[(4'h8):(3'h7)] != $signed(wire80)) ~^ ($unsigned(reg86) + reg86))));
        end
      else
        begin
          reg83 <= $unsigned({(^~{reg87}), (!$unsigned((reg87 - (8'hac))))});
          if ($signed(reg83))
            begin
              reg84 <= (~^wire82[(2'h3):(1'h0)]);
              reg85 <= (|(&(^$unsigned(wire81))));
              reg86 <= reg87[(1'h1):(1'h1)];
            end
          else
            begin
              reg84 <= wire78;
              reg85 <= (((((^~wire80) ?
                  reg84 : ((8'ha6) ?
                      (8'h9d) : wire80)) || wire82[(3'h7):(3'h7)]) & reg85[(3'h4):(2'h3)]) * {reg83[(1'h0):(1'h0)]});
              reg86 <= (reg84[(1'h1):(1'h1)] + (reg86 <= reg86[(3'h4):(1'h0)]));
            end
          reg87 <= reg83;
          reg88 <= wire78[(3'h5):(3'h4)];
          if ((^~{$unsigned((!wire79[(3'h5):(2'h2)]))}))
            begin
              reg89 <= $unsigned((!wire80[(1'h1):(1'h1)]));
              reg90 <= (wire78[(4'h9):(3'h7)] | wire81);
              reg91 <= (^reg90[(4'h9):(2'h2)]);
            end
          else
            begin
              reg89 <= $unsigned((reg85[(3'h6):(1'h1)] - {wire78}));
              reg90 <= reg91[(2'h2):(2'h2)];
            end
        end
      reg92 <= $signed($signed($signed(reg89[(4'hc):(2'h2)])));
    end
  assign wire93 = reg83[(2'h3):(1'h0)];
  assign wire94 = reg90;
  assign wire95 = wire80[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= reg88[(4'h9):(3'h4)];
      reg97 <= (((reg89 ?
          (^{(8'ha9),
              reg84}) : (+reg84)) - (+$unsigned(reg92[(2'h2):(1'h1)]))) && {$signed((-(wire80 != wire81))),
          reg89[(2'h2):(1'h1)]});
      reg98 <= ((wire79[(4'h8):(3'h7)] ?
          $unsigned(wire93) : $signed($unsigned((reg91 ?
              reg85 : wire94)))) << $signed(reg97));
      reg99 <= {(8'ha7)};
      reg100 <= reg88;
    end
endmodule

module module34
#(parameter param74 = ({{(((7'h42) << (8'h9c)) > ((8'hab) == (8'haa))), (~|(~^(8'hae)))}} + ((!(((8'hb3) <<< (7'h44)) ? ((8'ha9) ? (8'ha8) : (8'hbb)) : (!(8'hac)))) * ((((8'ha1) ? (8'ha1) : (8'hb9)) * ((8'ha7) < (8'h9d))) == (((8'hbe) >>> (7'h43)) ? (8'hb3) : ((8'ha7) + (8'hb4)))))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire38;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire [(4'hd):(1'h0)] wire36;
  input wire [(4'hb):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire41,
                 wire40,
                 wire39,
                 reg73,
                 reg72,
                 reg71,
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
                 reg56,
                 reg55,
                 reg54,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire39 = (~&$unsigned((-wire36[(3'h4):(1'h1)])));
  assign wire40 = wire36[(1'h0):(1'h0)];
  assign wire41 = $signed($unsigned($signed(wire39[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg42 <= ($unsigned((!$signed(wire40[(4'h9):(1'h1)]))) ?
          $unsigned($signed($signed($signed((8'ha5))))) : (^(~$signed($signed(wire41)))));
      reg43 <= {((-$unsigned(wire41)) ?
              (~^($unsigned(wire39) ~^ wire37)) : $unsigned((~|{wire40,
                  (7'h41)})))};
      if ($signed((wire35 >= (($signed(wire41) ?
              $unsigned(wire38) : reg42[(1'h0):(1'h0)]) ?
          ($signed(wire36) ?
              $unsigned(wire35) : (|wire35)) : ($unsigned(wire37) == $unsigned(wire39))))))
        begin
          reg44 <= wire38[(3'h4):(3'h4)];
          reg45 <= wire41[(2'h3):(1'h1)];
          reg46 <= (8'ha0);
          reg47 <= $unsigned(reg46);
        end
      else
        begin
          reg44 <= (8'hb7);
          reg45 <= {reg44};
        end
      reg48 <= wire37;
    end
  assign wire49 = wire39[(2'h3):(2'h2)];
  assign wire50 = (!$unsigned($signed($unsigned((wire38 * reg42)))));
  assign wire51 = {(wire49 ? (+((~wire49) ~^ (~reg47))) : wire41)};
  assign wire52 = $unsigned((-{(wire36[(1'h1):(1'h0)] != $signed(wire41)),
                      $signed({reg44})}));
  assign wire53 = {wire41,
                      (reg44 ?
                          (wire52 ?
                              wire35[(4'h8):(3'h5)] : wire49) : (reg42[(2'h3):(1'h1)] != ((reg47 ?
                                  wire52 : wire52) ?
                              (wire39 < wire37) : {wire40})))};
  always
    @(posedge clk) begin
      if ($unsigned((!(($unsigned(wire39) ?
              (wire53 ? (8'h9c) : wire38) : {wire50}) ?
          $signed($signed(reg47)) : wire52))))
        begin
          if (((^(((&(8'hab)) ? {wire39} : wire37) ?
                  $unsigned((reg42 ? wire49 : (8'hab))) : wire40)) ?
              reg47 : reg45[(2'h3):(2'h2)]))
            begin
              reg54 <= {wire40};
              reg55 <= $signed($signed((8'hbf)));
              reg56 <= (~&(~^(8'hb3)));
            end
          else
            begin
              reg54 <= ($signed((wire41 ?
                      wire49[(3'h4):(1'h0)] : ($unsigned(reg45) ?
                          {wire37, wire51} : (&wire53)))) ?
                  {reg42[(1'h0):(1'h0)], reg55} : wire39);
              reg55 <= wire52;
            end
          if (wire37[(4'hd):(1'h0)])
            begin
              reg57 <= ({$signed($unsigned($unsigned(wire49)))} && wire36[(2'h2):(1'h1)]);
              reg58 <= {(($unsigned($signed(wire41)) - $unsigned($signed((8'hbe)))) * reg45[(4'h9):(3'h7)])};
              reg59 <= $signed(reg42);
            end
          else
            begin
              reg57 <= $signed($unsigned({((^~reg55) && reg46[(4'ha):(3'h7)])}));
              reg58 <= ((reg58 ~^ (reg45[(1'h1):(1'h0)] ?
                      (reg48 >> (reg59 && wire36)) : $unsigned(reg48[(4'hd):(3'h7)]))) ?
                  {$signed(wire37[(2'h2):(1'h0)])} : {{($signed(wire35) ?
                              wire51[(1'h1):(1'h1)] : (wire50 ^ wire38))},
                      wire36});
            end
          reg60 <= (reg42 ?
              reg58[(2'h3):(1'h0)] : $signed($unsigned($signed((wire36 >>> reg44)))));
          reg61 <= $unsigned(reg44);
        end
      else
        begin
          reg54 <= (7'h41);
          reg55 <= $unsigned($signed((($signed(wire37) >= (reg59 ?
                  (8'ha7) : wire38)) ?
              (!(^reg47)) : wire39[(2'h3):(1'h0)])));
          reg56 <= ((8'h9c) || (reg55[(1'h1):(1'h0)] != (({wire51} ?
              (wire50 & (8'ha6)) : $unsigned(reg46)) < (+reg48[(4'hd):(4'h9)]))));
          reg57 <= reg42;
        end
      reg62 <= reg57;
      reg63 <= reg54;
      if (((~&$unsigned($unsigned((7'h40)))) ?
          $signed(wire49[(3'h5):(1'h0)]) : $signed(({$unsigned(wire53),
              $signed(reg62)} > wire40))))
        begin
          reg64 <= (((($signed(reg62) ? (+reg56) : ((8'h9e) < reg63)) ?
                      reg62[(5'h10):(4'he)] : $signed($unsigned(reg63))) ?
                  $unsigned(reg61[(5'h15):(2'h2)]) : $signed(reg55[(2'h3):(2'h2)])) ?
              {wire49,
                  ($unsigned(reg63) ?
                      ((wire50 ?
                          reg42 : reg48) - (~^wire50)) : (8'hbf))} : ($signed(reg48[(2'h2):(1'h0)]) - wire36[(3'h5):(3'h5)]));
          reg65 <= {(!(reg57[(2'h3):(1'h0)] ?
                  (wire40 ? (wire53 ? reg44 : reg42) : (~|reg47)) : ((reg43 ?
                          wire39 : reg61) ?
                      reg42 : (~&reg42)))),
              $unsigned((|(~|(^reg42))))};
          reg66 <= ($signed((8'hb1)) ? (7'h40) : (|$signed((8'ha4))));
          reg67 <= (reg60[(4'hd):(2'h3)] ?
              wire35 : (wire35 + $signed((reg57[(4'h8):(1'h1)] <= $signed((8'h9c))))));
        end
      else
        begin
          reg64 <= {{reg48}};
          reg65 <= reg43;
          reg66 <= wire49;
          reg67 <= wire50;
          reg68 <= ((~reg56) << $unsigned((!wire41[(2'h3):(2'h3)])));
        end
    end
  assign wire69 = (-$signed(reg64[(4'ha):(3'h4)]));
  assign wire70 = (wire37[(4'hc):(4'hb)] ?
                      $unsigned(($unsigned($unsigned(wire69)) ?
                          {reg59} : wire50)) : ((((|reg62) ?
                                  (~|reg59) : $signed(wire36)) ?
                              $unsigned((reg46 < (8'ha7))) : $unsigned((!wire53))) ?
                          (-(-(~^reg44))) : (&($unsigned(wire52) ?
                              $unsigned(reg44) : $unsigned((8'hbe))))));
  always
    @(posedge clk) begin
      if ($unsigned((^~$signed(wire40))))
        begin
          reg71 <= wire38[(4'hc):(4'ha)];
        end
      else
        begin
          reg71 <= (~^$signed(((8'hb5) || wire40[(3'h7):(3'h5)])));
          reg72 <= reg61[(5'h15):(4'h8)];
        end
      reg73 <= (-$unsigned($unsigned($signed($signed(reg42)))));
    end
endmodule
