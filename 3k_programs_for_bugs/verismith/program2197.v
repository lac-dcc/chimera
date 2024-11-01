module top
#(parameter param157 = ((((&((8'hbf) + (8'hab))) << ({(8'h9f)} ? ((8'haf) << (8'ha0)) : ((8'hb1) ? (8'ha4) : (8'hb2)))) ? ((~^{(8'ha7)}) ? {(~|(8'hb3)), ((8'hbc) ? (8'had) : (8'h9c))} : ({(8'haf), (8'hb9)} ? {(8'hb0)} : ((8'had) <= (8'h9d)))) : (&(!((8'hb0) < (8'hb0))))) != ({{(^~(7'h40)), ((8'h9f) == (8'hac))}} && ({((8'haa) != (8'h9f))} ? (((8'h9c) * (8'h9f)) ? ((8'h9e) ? (8'ha3) : (8'hba)) : {(8'hb9), (8'hbc)}) : (((8'hae) < (8'ha4)) >= ((8'hac) ? (8'hb9) : (8'hb6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h201):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire142;
  wire [(4'he):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  assign y = {wire155,
                 wire142,
                 wire141,
                 wire140,
                 wire133,
                 wire33,
                 wire32,
                 wire31,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
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
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 (1'h0)};
  assign wire4 = (&$signed(wire3[(4'hd):(3'h6)]));
  always
    @(posedge clk) begin
      reg5 <= $unsigned($signed($signed(wire4[(4'ha):(2'h2)])));
      if (wire1)
        begin
          reg6 <= wire0;
        end
      else
        begin
          if ($unsigned(wire4))
            begin
              reg6 <= reg6;
            end
          else
            begin
              reg6 <= wire3[(1'h0):(1'h0)];
              reg7 <= {$unsigned({wire1, $unsigned($signed(wire2))})};
            end
          reg8 <= {$unsigned((~((wire3 ? reg6 : wire2) << (~reg6))))};
          reg9 <= reg5;
        end
    end
  assign wire10 = ($unsigned(($unsigned((reg5 ? wire4 : wire4)) == {reg8,
                          $signed(wire2)})) ?
                      (($unsigned($signed(wire4)) ?
                          $signed((wire4 != reg7)) : reg8) >= ((&reg7[(3'h7):(3'h6)]) ?
                          wire1 : $signed((~|reg7)))) : ($unsigned((^(reg7 ?
                          reg6 : wire1))) + {wire1[(4'hf):(4'hf)]}));
  assign wire11 = ($signed($unsigned(((reg6 >= reg6) ?
                      (wire2 != reg8) : (|(8'hab))))) ^~ $unsigned((&((^wire2) << $unsigned(wire10)))));
  assign wire12 = (($unsigned(((wire4 > wire10) < (reg5 ? (8'hb5) : wire2))) ?
                      $signed($signed($signed(wire0))) : wire1) != ((8'hb3) ?
                      $signed((reg9 * {reg9,
                          (8'h9d)})) : ($unsigned((wire11 == reg9)) * (8'hb6))));
  assign wire13 = ((($unsigned($unsigned(reg9)) < $signed((7'h44))) << ($signed($unsigned(reg9)) | $unsigned(reg9))) >= (~&reg9[(4'hd):(4'h9)]));
  assign wire14 = $unsigned(($signed((&(wire0 <= wire13))) ?
                      ((!reg6[(1'h0):(1'h0)]) ?
                          ($signed((8'haa)) & $unsigned(wire4)) : ((~(8'hbd)) ?
                              wire13 : (reg8 > (8'ha1)))) : $signed($unsigned((-reg7)))));
  assign wire15 = reg7[(3'h5):(3'h4)];
  assign wire16 = wire0[(4'hf):(3'h4)];
  assign wire17 = ((wire10[(4'h8):(3'h4)] ?
                          $unsigned(wire11) : (|(wire13[(3'h7):(1'h0)] || (wire13 ?
                              wire15 : wire2)))) ?
                      (((+(wire4 <<< reg5)) >= ((wire13 ? reg7 : wire3) ?
                          (~reg5) : (reg6 ?
                              wire11 : wire12))) < (reg5 < $unsigned($signed(wire14)))) : (wire16[(1'h1):(1'h0)] ?
                          wire3[(5'h10):(1'h1)] : wire10[(5'h10):(1'h0)]));
  assign wire18 = reg7;
  assign wire19 = $unsigned(wire2[(3'h5):(3'h4)]);
  assign wire20 = {{wire12[(3'h7):(3'h4)]},
                      {wire19[(1'h0):(1'h0)], $signed((|(wire2 + (8'hb1))))}};
  always
    @(posedge clk) begin
      if ((^wire11))
        begin
          reg21 <= reg7;
          if (((|({((8'h9d) ? wire13 : (8'hbf)), (reg8 >= wire4)} ?
              (wire20 && (wire10 ?
                  reg6 : wire17)) : (^~(8'haa)))) - (+reg6[(3'h6):(3'h6)])))
            begin
              reg22 <= (($unsigned($unsigned((reg8 + wire17))) ?
                      $unsigned(((reg21 ? wire19 : wire20) - (wire3 ?
                          reg21 : reg6))) : $unsigned($signed(wire18[(3'h7):(2'h2)]))) ?
                  {(^~wire3)} : (8'hbe));
              reg23 <= wire15;
              reg24 <= wire15;
            end
          else
            begin
              reg22 <= ((~^wire3) >>> reg7[(3'h5):(3'h4)]);
              reg23 <= (8'hb3);
              reg24 <= (^~$signed(wire14[(2'h2):(1'h0)]));
              reg25 <= (~^($unsigned((((8'hb7) > wire4) ?
                      (reg7 ? wire16 : wire0) : wire13[(1'h1):(1'h0)])) ?
                  (-wire0) : (8'hb4)));
              reg26 <= $signed({reg6[(2'h3):(1'h1)]});
            end
          reg27 <= $signed((^~($unsigned($unsigned((7'h40))) ?
              ($signed(wire14) == reg8) : $unsigned($unsigned(wire17)))));
        end
      else
        begin
          if ((($signed((reg9[(3'h4):(1'h0)] ? (-wire4) : $unsigned(wire3))) ?
                  wire16 : $signed(reg23)) ?
              reg22 : (reg26[(4'hb):(1'h1)] <<< (wire11[(1'h1):(1'h1)] == $unsigned($unsigned(reg24))))))
            begin
              reg21 <= $unsigned(wire15[(2'h3):(2'h3)]);
              reg22 <= {(^(wire4[(4'hb):(3'h6)] ?
                      wire15 : $signed(((8'hbd) - reg7))))};
            end
          else
            begin
              reg21 <= (~(8'h9d));
              reg22 <= (+{{$unsigned($unsigned(wire13)), wire10}});
            end
          reg23 <= $signed((^~(^~reg5[(1'h1):(1'h0)])));
        end
      reg28 <= wire20[(3'h6):(2'h2)];
      reg29 <= (^~$signed((reg27 | $unsigned(((8'ha3) ? reg27 : reg28)))));
      reg30 <= (reg25[(4'hf):(3'h5)] ?
          $unsigned((wire11 ?
              ((wire10 ? reg26 : wire20) ?
                  (7'h43) : reg9[(1'h0):(1'h0)]) : $unsigned($unsigned(reg9)))) : (-$signed(reg28)));
    end
  assign wire31 = wire13[(3'h4):(2'h2)];
  assign wire32 = $signed(($signed(($unsigned(wire16) >= $signed(wire17))) ?
                      (reg26 >>> (reg27 ?
                          $unsigned(wire17) : $unsigned((8'hbd)))) : (+$unsigned(wire31))));
  assign wire33 = wire3[(1'h1):(1'h1)];
  module34 #() modinst134 (wire133, clk, wire31, reg8, wire32, reg7);
  always
    @(posedge clk) begin
      reg135 <= reg8[(5'h10):(1'h0)];
      reg136 <= ($signed((reg26[(4'h9):(3'h6)] ?
              wire15 : ((&reg22) ? (-wire31) : wire133[(2'h3):(2'h2)]))) ?
          (+($signed($unsigned(wire3)) ?
              (^~(wire11 ?
                  wire0 : reg22)) : wire11)) : {wire133[(3'h5):(1'h0)]});
      reg137 <= (~&{wire0[(3'h7):(3'h6)], (&wire20[(4'hb):(3'h6)])});
      reg138 <= ((&(((8'ha0) ? (+(8'hab)) : reg21[(2'h3):(2'h2)]) - (reg26 ?
              reg136 : (wire1 ? wire32 : reg136)))) ?
          (reg136 ?
              (reg5[(3'h5):(2'h3)] ?
                  ((~&wire11) << (wire4 ?
                      wire13 : wire12)) : (!wire31[(4'h9):(3'h6)])) : (wire4[(5'h11):(4'hf)] ?
                  wire20 : $unsigned(wire3))) : reg26);
      reg139 <= (({((&reg5) ? (reg24 ? wire1 : wire3) : reg23[(1'h0):(1'h0)])} ?
              $unsigned(((8'ha8) ?
                  (wire15 ? (8'had) : reg135) : $signed(reg138))) : (+wire1)) ?
          (-($unsigned(wire12[(2'h3):(1'h0)]) < wire19)) : wire18[(1'h1):(1'h0)]);
    end
  assign wire140 = ((({(reg29 == reg6)} << reg27) ~^ {reg21,
                           (~|(wire4 ? wire14 : (8'hbd)))}) ?
                       ((~^reg135) ?
                           wire18 : $unsigned((|(wire15 ?
                               (8'haa) : reg21)))) : ({reg27,
                           {$unsigned(wire32)}} + {$unsigned((^~wire14))}));
  assign wire141 = $unsigned(wire13[(1'h0):(1'h0)]);
  assign wire142 = (!($unsigned(($signed(reg28) ~^ reg8)) ?
                       $signed($signed(reg5[(3'h5):(2'h3)])) : $unsigned(wire19[(1'h1):(1'h1)])));
  module143 #() modinst156 (.wire148(wire3), .wire144(reg139), .y(wire155), .clk(clk), .wire147(reg21), .wire146(wire140), .wire145(reg26));
endmodule

module module143  (y, clk, wire148, wire147, wire146, wire145, wire144);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire148;
  input wire signed [(3'h5):(1'h0)] wire147;
  input wire [(5'h15):(1'h0)] wire146;
  input wire signed [(3'h4):(1'h0)] wire145;
  input wire [(2'h2):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire154;
  wire [(4'he):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire149;
  assign y = {wire154, wire153, wire152, wire151, wire150, wire149, (1'h0)};
  assign wire149 = wire148[(1'h0):(1'h0)];
  assign wire150 = $signed((~&wire147[(1'h0):(1'h0)]));
  assign wire151 = wire148[(2'h2):(1'h0)];
  assign wire152 = $unsigned($unsigned(((~|wire145) ?
                       (wire149[(4'h8):(3'h6)] ?
                           $unsigned(wire147) : $signed((8'hac))) : $unsigned(wire150[(2'h2):(1'h0)]))));
  assign wire153 = {({wire150} ~^ wire148),
                       {$unsigned(wire151[(2'h3):(1'h0)]), wire145}};
  assign wire154 = {wire152[(4'h8):(3'h5)]};
endmodule

module module34
#(parameter param131 = (^(({((8'hae) || (8'h9c))} != (&{(8'hab), (8'hab)})) == ((((8'hb7) | (8'ha7)) ? (~|(8'hb6)) : ((7'h42) >> (8'ha4))) ? (((8'hb7) << (8'haf)) ? ((8'ha2) ? (8'h9f) : (8'h9d)) : ((8'hb6) - (7'h40))) : (((8'hb6) & (8'ha2)) ~^ {(8'haf)})))), 
parameter param132 = param131)
(y, clk, wire35, wire36, wire37, wire38);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire35;
  input wire signed [(4'hf):(1'h0)] wire36;
  input wire [(5'h14):(1'h0)] wire37;
  input wire signed [(4'he):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire130;
  wire [(2'h2):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire127;
  wire signed [(3'h4):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire122;
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire39,
                 wire82,
                 wire84,
                 wire122,
                 (1'h0)};
  assign wire39 = {($signed({(wire36 <= wire37)}) >= (8'ha8))};
  module40 #() modinst83 (.clk(clk), .wire44(wire38), .wire41(wire39), .y(wire82), .wire42(wire37), .wire43(wire36));
  assign wire84 = (~($signed(((^~wire36) && wire37)) ?
                      ($unsigned((wire82 ? wire36 : wire38)) ?
                          $unsigned(wire39) : (wire35 ^ (^~wire35))) : {((wire38 ?
                              wire36 : wire82) >>> (&wire36)),
                          wire39[(1'h1):(1'h0)]}));
  module85 #() modinst123 (wire122, clk, wire84, wire82, wire36, wire35, wire38);
  assign wire124 = (!wire39);
  assign wire125 = ($signed($unsigned($signed({wire82, wire82}))) ?
                       $signed($unsigned((~|(wire82 ~^ wire39)))) : ((&({wire38} ?
                           $unsigned((8'hb5)) : (wire124 ?
                               wire36 : wire38))) <<< $unsigned(($signed(wire37) << wire84))));
  assign wire126 = (wire35[(2'h3):(2'h2)] ?
                       wire82[(1'h1):(1'h0)] : ((wire37 ?
                           $unsigned($signed(wire84)) : wire38[(2'h2):(1'h1)]) <<< $unsigned(wire84[(3'h4):(1'h1)])));
  assign wire127 = (wire126[(1'h1):(1'h1)] ?
                       $unsigned(($signed((7'h42)) ?
                           $unsigned(wire37[(3'h6):(3'h6)]) : ((wire35 & wire124) ?
                               wire125[(4'hf):(4'hb)] : (8'ha5)))) : wire84);
  assign wire128 = (wire35 - wire124[(4'hc):(1'h1)]);
  assign wire129 = $unsigned({((|$signed(wire126)) | {(wire125 ~^ wire127)}),
                       $unsigned((wire36 && (wire38 ? (7'h44) : wire128)))});
  assign wire130 = wire126[(3'h4):(2'h3)];
endmodule

module module85
#(parameter param121 = {(~^(((|(8'h9e)) ? (~(8'hb9)) : ((8'hac) ? (7'h42) : (8'hbb))) ? (~&((8'hbe) & (8'h9f))) : (((8'h9f) ? (8'hb9) : (8'h9f)) <<< ((8'ha7) ^ (8'hb5)))))})
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire90;
  input wire signed [(3'h4):(1'h0)] wire89;
  input wire [(4'hf):(1'h0)] wire88;
  input wire [(3'h5):(1'h0)] wire87;
  input wire signed [(3'h7):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire119;
  wire signed [(5'h12):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire96;
  wire signed [(3'h7):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire91;
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire115,
                 wire114,
                 wire113,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire96,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg116,
                 reg112,
                 reg111,
                 reg110,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg95,
                 (1'h0)};
  assign wire91 = wire86[(3'h7):(1'h1)];
  assign wire92 = (wire86[(3'h5):(3'h5)] >= (({(~wire86)} ^~ ((^~wire91) + $signed(wire89))) ^~ (+wire90)));
  assign wire93 = $unsigned($signed($unsigned(wire91)));
  assign wire94 = ($unsigned(($signed({wire90, (8'hb1)}) ?
                      (~^wire90[(3'h5):(1'h1)]) : (^wire93))) || ({(~(wire89 ?
                              wire93 : wire89)),
                          wire86[(1'h1):(1'h1)]} ?
                      ($signed($unsigned(wire87)) ?
                          wire86 : $signed($unsigned((8'hb1)))) : {(wire87 ?
                              $unsigned((7'h41)) : $signed(wire91))}));
  always
    @(posedge clk) begin
      reg95 <= (8'ha3);
    end
  assign wire96 = ((((8'ha4) >> wire90[(3'h5):(2'h2)]) ?
                      wire89[(1'h0):(1'h0)] : (+$signed((wire93 ?
                          wire91 : wire87)))) != $unsigned(($unsigned($unsigned(wire88)) ?
                      ($unsigned(wire92) >> (wire89 ?
                          (8'ha9) : (8'ha5))) : $signed(wire86[(3'h6):(2'h3)]))));
  always
    @(posedge clk) begin
      reg97 <= $signed((((^(wire86 ? wire87 : wire96)) >> $signed(wire86)) ?
          (~^(((8'ha3) ? wire91 : wire96) ?
              (!reg95) : $signed(wire91))) : wire88[(4'hd):(4'hb)]));
      if ((~^($signed(wire91[(3'h4):(1'h1)]) <= $signed(wire94[(3'h4):(1'h0)]))))
        begin
          reg98 <= wire92;
          reg99 <= ((((8'hac) == $unsigned($unsigned(wire96))) ?
                  $signed(wire87[(3'h4):(1'h1)]) : $unsigned({((8'ha5) ?
                          wire92 : (8'hbf)),
                      $unsigned(wire86)})) ?
              $unsigned(wire96[(5'h11):(3'h6)]) : ($unsigned(wire87[(3'h4):(1'h0)]) == ((8'ha6) ?
                  (wire88 && $unsigned(wire91)) : (~^(-wire96)))));
        end
      else
        begin
          reg98 <= wire92;
          reg99 <= (reg95[(5'h11):(1'h0)] ?
              $unsigned(((|$unsigned((8'ha3))) || $signed(wire91[(2'h2):(1'h1)]))) : (+(((wire88 << wire89) ?
                  (~wire86) : wire92) ~^ $unsigned((reg97 < wire96)))));
          reg100 <= (~|wire89);
          reg101 <= ((~^$signed($unsigned((^(8'hb4))))) ?
              wire86[(1'h0):(1'h0)] : {$signed(((&reg98) ?
                      (reg95 && (8'ha8)) : (8'hb5)))});
        end
      reg102 <= reg101;
    end
  assign wire103 = reg95[(4'h9):(3'h7)];
  assign wire104 = ({((wire90[(3'h4):(2'h3)] ?
                                   $unsigned(wire94) : $unsigned(reg99)) ?
                               ($unsigned(reg101) && ((7'h44) != wire91)) : ((wire89 >> reg99) ?
                                   reg95[(5'h10):(3'h4)] : $signed(wire96)))} ?
                       reg97[(5'h13):(5'h11)] : (wire96[(5'h11):(3'h7)] && wire92));
  assign wire105 = (wire103 ?
                       wire86[(3'h6):(1'h1)] : $unsigned($unsigned((|(reg97 ?
                           wire86 : (8'ha6))))));
  assign wire106 = ($unsigned(($unsigned(reg98[(2'h2):(1'h0)]) || ({(8'hb1),
                           wire90} ?
                       (reg99 ?
                           reg98 : reg101) : (~wire88)))) <<< $unsigned((wire104 ?
                       (wire103[(2'h2):(1'h0)] ?
                           wire87[(2'h2):(1'h0)] : reg101) : $signed($signed(wire87)))));
  assign wire107 = reg95;
  assign wire108 = ($unsigned($signed(wire88)) ^~ (wire106[(3'h6):(1'h1)] ?
                       $unsigned(wire86) : ((~&(^~wire106)) - ($unsigned(wire87) ?
                           (wire90 ? reg98 : wire86) : (wire92 ?
                               wire105 : (8'ha5))))));
  assign wire109 = (^(-((~wire86) ?
                       ((^reg95) ?
                           (wire87 ?
                               wire86 : reg102) : $signed(reg100)) : ($unsigned(wire86) | (wire103 - reg99)))));
  always
    @(posedge clk) begin
      reg110 <= $signed(((~|($signed(wire109) + $signed(wire94))) ^ (~^(^~wire105[(2'h2):(1'h1)]))));
      reg111 <= (wire92[(1'h0):(1'h0)] ?
          (-wire93[(2'h2):(2'h2)]) : ($unsigned($signed((reg98 ?
                  wire88 : wire105))) ?
              ((8'ha6) - (!reg102)) : $signed($unsigned({wire94, wire106}))));
      reg112 <= ($signed($unsigned($signed(((7'h44) ? wire103 : wire86)))) ?
          (8'hb8) : (wire106 ?
              ((wire93[(1'h1):(1'h1)] <<< $signed(reg95)) ?
                  ((~wire87) ^~ (reg97 << wire90)) : wire105[(4'hd):(1'h0)]) : ($signed((+wire94)) ?
                  (&{wire108, wire91}) : {wire91[(2'h3):(2'h3)]})));
    end
  assign wire113 = reg95;
  assign wire114 = $unsigned($unsigned(((~|((8'hb2) ^~ wire93)) ?
                       (((8'hb1) ?
                           (8'ha8) : (8'hbd)) & $signed(wire86)) : reg102)));
  assign wire115 = (($unsigned(((8'hb2) > ((8'ha1) ?
                           wire105 : (8'ha2)))) || $unsigned(((wire106 ?
                           (8'hba) : wire92) && (8'hb8)))) ?
                       reg102 : (8'hac));
  always
    @(posedge clk) begin
      reg116 <= $unsigned(wire87);
    end
  assign wire117 = {reg112};
  assign wire118 = wire87[(1'h0):(1'h0)];
  assign wire119 = reg102;
  assign wire120 = (7'h43);
endmodule

module module40
#(parameter param80 = ((((((8'ha5) && (8'hbd)) | {(8'hb9)}) ? (&(^(8'ha9))) : (~^(~(8'ha3)))) ? ((((8'ha1) ? (8'ha6) : (7'h44)) ? {(8'hb7), (8'h9c)} : (-(8'ha3))) ? (~^{(8'hb5), (8'hb6)}) : ((~|(8'hbc)) ? (-(7'h41)) : ((8'hba) && (8'ha3)))) : {{(~|(8'hb5)), (8'haa)}}) >> {(((7'h44) << ((8'h9f) ? (7'h44) : (8'hae))) ? ((+(7'h42)) ? {(8'haa), (8'haf)} : ((8'had) || (7'h42))) : {(8'hb5)}), (-(~^((7'h40) ? (8'h9d) : (8'ha8))))}), 
parameter param81 = (8'hbf))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire signed [(3'h6):(1'h0)] wire43;
  input wire [(5'h14):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire45;
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
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
                 reg57,
                 reg56,
                 reg55,
                 reg46,
                 (1'h0)};
  assign wire45 = (!wire43[(3'h6):(3'h5)]);
  always
    @(posedge clk) begin
      reg46 <= $signed(((wire43[(3'h6):(3'h5)] ?
              ((wire42 & wire44) == $unsigned(wire41)) : wire44) ?
          {$signed(((8'h9e) ~^ (8'hb8))), (|(^~(8'hb9)))} : (~^(((8'hb7) ?
                  wire43 : wire43) ?
              $unsigned(wire42) : {wire44}))));
    end
  assign wire47 = wire43[(3'h6):(3'h4)];
  assign wire48 = {(|(!{wire42, (|wire41)}))};
  assign wire49 = $unsigned({($signed((~|wire43)) + $signed($signed((8'hbf))))});
  assign wire50 = (&(8'ha8));
  assign wire51 = $unsigned($unsigned($signed(((^~(8'hbc)) << $unsigned(wire42)))));
  assign wire52 = reg46[(4'hd):(3'h5)];
  assign wire53 = {$signed($unsigned(wire50))};
  assign wire54 = wire52[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned(wire48) ?
          ((~wire47) >> wire41[(2'h3):(1'h0)]) : wire47[(4'h9):(3'h7)])) ^ $unsigned((((^(7'h41)) && ((7'h44) ?
          wire44 : (8'hb1))) > wire52[(3'h6):(3'h4)]))))
        begin
          reg55 <= (((~^wire48[(4'h8):(2'h3)]) != $unsigned(wire48)) ?
              (wire44 || wire41[(3'h4):(2'h2)]) : wire52[(1'h0):(1'h0)]);
          if ({wire44, (~wire51[(4'ha):(3'h5)])})
            begin
              reg56 <= wire42[(5'h10):(4'h9)];
              reg57 <= $unsigned(wire42[(4'h8):(2'h3)]);
              reg58 <= (8'hba);
            end
          else
            begin
              reg56 <= {$signed(wire47[(5'h14):(4'h9)]), {wire45, wire51}};
              reg57 <= $unsigned(((reg58[(3'h6):(3'h4)] ?
                  {$unsigned(wire43), reg57[(5'h13):(4'he)]} : ((~wire41) ?
                      $unsigned(wire44) : reg56)) < (wire53 << $signed(((8'ha1) <<< wire50)))));
            end
          reg59 <= reg55;
          if ({wire44, wire45})
            begin
              reg60 <= (8'hbe);
              reg61 <= {($unsigned((~&(reg56 ?
                      wire50 : wire49))) || $unsigned($signed((^~wire49)))),
                  (!($signed(wire51[(4'h9):(2'h2)]) == $unsigned(wire45[(3'h4):(2'h3)])))};
              reg62 <= reg46[(3'h4):(1'h1)];
              reg63 <= wire50[(4'hc):(3'h5)];
              reg64 <= (wire54[(4'hf):(4'he)] ? wire47[(4'hb):(3'h7)] : reg61);
            end
          else
            begin
              reg60 <= $unsigned(reg46);
              reg61 <= ((-{(&(wire43 ~^ reg60))}) ~^ {(!((reg46 ^~ wire43) ~^ reg57)),
                  (reg64 || (~{wire47, (7'h41)}))});
              reg62 <= ((^~$signed(((~|wire41) | wire50[(5'h12):(1'h0)]))) ?
                  (~^({$unsigned((7'h41)), $signed(wire48)} ?
                      $signed($unsigned(reg56)) : wire54[(4'ha):(3'h5)])) : reg64);
            end
        end
      else
        begin
          reg55 <= wire42[(5'h11):(2'h3)];
        end
      reg65 <= $signed((((!(wire42 >>> reg56)) <= $unsigned((reg64 ?
              reg57 : (8'hbf)))) ?
          reg58[(3'h5):(2'h2)] : $signed(reg55[(2'h3):(1'h0)])));
      reg66 <= (($signed($unsigned(reg61[(1'h0):(1'h0)])) && (8'ha4)) && $signed((&$signed({reg60,
          wire42}))));
    end
  always
    @(posedge clk) begin
      if ((~^(((+wire52) || (wire49[(4'hf):(1'h1)] ?
          $unsigned(reg66) : (~&wire48))) | (^~((reg64 ?
          wire51 : wire53) ~^ (~reg46))))))
        begin
          if ($unsigned(wire48[(4'he):(4'hb)]))
            begin
              reg67 <= $signed($unsigned($unsigned((~&reg57))));
              reg68 <= ((({$signed(reg57)} ^ wire53[(4'h9):(3'h6)]) ?
                      ($unsigned(reg62) >= ({reg56} ^~ wire49)) : (wire44[(1'h1):(1'h0)] ?
                          (!$signed(reg55)) : wire44)) ?
                  (($unsigned(reg57) + {wire44[(2'h2):(1'h1)]}) ?
                      $unsigned({$signed(wire52)}) : (|wire49[(2'h2):(1'h1)])) : reg61);
              reg69 <= ((|wire53) - $signed(wire47));
              reg70 <= wire45[(1'h1):(1'h1)];
              reg71 <= ((~&(($unsigned(reg58) ?
                  wire48 : reg60) && (reg64 | wire49[(4'ha):(3'h6)]))) >= $unsigned(reg60));
            end
          else
            begin
              reg67 <= ($signed((wire47[(5'h11):(3'h4)] ?
                  (^reg70) : ($signed(reg71) ?
                      (~^wire48) : (~^wire44)))) < (reg46[(4'hd):(3'h5)] || wire48[(1'h0):(1'h0)]));
            end
          reg72 <= (~$unsigned((^~(7'h44))));
          reg73 <= wire47[(3'h7):(3'h5)];
        end
      else
        begin
          reg67 <= ((|{((wire54 ? wire44 : (8'hab)) ^ (reg68 ?
                  reg63 : reg72))}) ^ (^~reg58));
        end
      reg74 <= (8'hb1);
    end
  assign wire75 = reg71;
  assign wire76 = reg65;
  assign wire77 = $signed($signed((~^(!reg74[(3'h5):(1'h1)]))));
  assign wire78 = ({(8'hb4)} & (+$unsigned((!(wire47 ^~ reg46)))));
  assign wire79 = reg46[(3'h7):(3'h6)];
endmodule
