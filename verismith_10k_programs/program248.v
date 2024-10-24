module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire165;
  wire [(3'h7):(1'h0)] wire164;
  wire [(4'he):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire153;
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire153,
                 (1'h0)};
  module5 #() modinst154 (.wire7(wire0), .y(wire153), .wire8(wire1), .wire9(wire2), .wire6(wire3), .clk(clk));
  module96 #() modinst156 (.clk(clk), .y(wire155), .wire97(wire0), .wire100(wire3), .wire99(wire153), .wire98(wire2));
  assign wire157 = wire4[(4'hd):(1'h0)];
  assign wire158 = {(~^$signed(((wire3 ?
                           wire153 : wire157) * $unsigned(wire157)))),
                       wire3};
  assign wire159 = {$unsigned((wire3 ?
                           wire1 : (wire4[(5'h14):(4'hb)] > wire158))),
                       $unsigned({wire1[(3'h5):(1'h0)]})};
  assign wire160 = $unsigned(wire158);
  assign wire161 = ((8'had) && wire158[(4'ha):(1'h0)]);
  assign wire162 = {wire153};
  assign wire163 = wire1;
  assign wire164 = wire0;
  assign wire165 = $signed(((~^(wire159[(4'h8):(2'h2)] ?
                           $unsigned(wire1) : $signed(wire158))) ?
                       $unsigned({(wire3 - wire2),
                           (wire162 ?
                               (8'hb6) : wire159)}) : $signed(wire160[(3'h6):(1'h1)])));
endmodule

module module5
#(parameter param152 = (~|({((&(8'hb0)) == ((8'ha3) ? (8'hb6) : (8'hae))), (8'ha3)} ? (8'ha4) : ((~(+(8'hb5))) ? ((|(8'h9d)) - (+(8'hac))) : ((-(8'ha6)) ? (-(8'ha2)) : {(8'ha5)})))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire94;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire119;
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  assign y = {wire150,
                 wire121,
                 wire10,
                 wire24,
                 wire82,
                 wire85,
                 wire90,
                 wire91,
                 wire94,
                 wire95,
                 wire119,
                 reg84,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg92,
                 reg93,
                 (1'h0)};
  assign wire10 = $unsigned((wire7 ?
                      $signed((~&wire9[(1'h1):(1'h1)])) : (~&wire6)));
  module11 #() modinst25 (wire24, clk, wire6, wire7, wire8, wire10);
  module26 #() modinst83 (.y(wire82), .wire28(wire24), .wire27(wire10), .wire30(wire6), .clk(clk), .wire29(wire9));
  always
    @(posedge clk) begin
      reg84 <= {wire24[(3'h4):(2'h3)]};
    end
  assign wire85 = reg84[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg86 <= ($unsigned(wire10[(3'h6):(3'h4)]) ?
          {{($unsigned(wire82) + ((7'h42) ^ wire7))},
              (~^$unsigned((wire9 != wire85)))} : ($unsigned((~|(wire24 ?
                  wire85 : wire85))) ?
              wire10[(3'h6):(2'h2)] : (wire10[(3'h5):(3'h5)] ?
                  $unsigned((wire8 ? wire24 : wire6)) : ((&(8'h9e)) ?
                      {wire7} : $unsigned(wire8)))));
      reg87 <= (((~$signed($unsigned(wire10))) ?
          $signed(($unsigned(wire6) >>> wire85)) : ($signed((reg84 <= wire9)) ?
              (8'hbe) : $signed($signed((8'hba))))) <= wire24);
      reg88 <= $unsigned((~|($signed(reg86) ?
          (~$signed(wire82)) : (wire6[(3'h6):(1'h0)] <= (wire82 >= reg84)))));
      reg89 <= (reg86 ? (~|wire8) : wire8);
    end
  assign wire90 = $unsigned(($signed(((wire85 ? wire6 : (7'h43)) ?
                          $signed(reg88) : $signed(wire10))) ?
                      ($signed($signed(wire85)) < reg86[(2'h3):(2'h3)]) : (wire7[(5'h11):(4'hc)] ~^ (reg84 ?
                          wire10[(3'h6):(3'h6)] : (8'hb2)))));
  assign wire91 = (((~&(|{reg86})) ?
                      $unsigned(({wire7} - (wire90 ?
                          (8'hb9) : wire9))) : wire90) < $unsigned($signed(($unsigned(wire90) && (wire6 ?
                      wire90 : reg88)))));
  always
    @(posedge clk) begin
      reg92 <= reg86[(4'h9):(3'h7)];
      reg93 <= (!wire91[(2'h3):(2'h2)]);
    end
  assign wire94 = (8'ha7);
  assign wire95 = ($unsigned(wire85[(4'h9):(3'h5)]) ?
                      {$unsigned(reg92),
                          $unsigned((~(reg93 | (8'h9c))))} : (+(!($unsigned(wire82) == (wire6 ?
                          reg89 : reg93)))));
  module96 #() modinst120 (.y(wire119), .wire97(wire9), .clk(clk), .wire100(reg92), .wire99(wire10), .wire98(wire7));
  assign wire121 = $signed($signed(((&{wire119}) ?
                       reg93 : $signed($unsigned(wire82)))));
  module122 #() modinst151 (wire150, clk, wire91, wire24, reg92, reg88);
endmodule

module module122  (y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire126;
  input wire [(4'ha):(1'h0)] wire125;
  input wire signed [(3'h4):(1'h0)] wire124;
  input wire [(4'h8):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire149;
  wire [(2'h2):(1'h0)] wire148;
  wire [(4'hb):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire145;
  wire [(3'h4):(1'h0)] wire144;
  wire [(5'h13):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire129,
                 wire128,
                 wire127,
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
                 (1'h0)};
  assign wire127 = (wire124[(3'h4):(1'h1)] ^~ (wire126 && $signed(($signed((8'hbf)) ?
                       (&wire124) : wire124[(1'h0):(1'h0)]))));
  assign wire128 = wire126[(4'hb):(4'ha)];
  assign wire129 = wire127;
  always
    @(posedge clk) begin
      reg130 <= wire129[(3'h4):(2'h2)];
      if (wire123[(3'h4):(1'h1)])
        begin
          reg131 <= ($unsigned(((+(wire126 ? wire123 : wire129)) << (8'hb5))) ?
              wire129 : (&((~&{wire127}) ^ $unsigned((wire128 ?
                  wire129 : (8'hbb))))));
          if (wire129)
            begin
              reg132 <= $signed((|(~&$unsigned(wire126[(4'ha):(4'h8)]))));
            end
          else
            begin
              reg132 <= ($signed(((wire127 || $unsigned((8'hb7))) ?
                  $signed(wire126[(4'ha):(1'h0)]) : wire126[(4'h9):(3'h7)])) <<< $signed(wire125));
              reg133 <= ((+(~|(&$signed(wire126)))) ^~ reg132);
            end
          reg134 <= (^wire123[(4'h8):(4'h8)]);
          reg135 <= wire123[(2'h2):(2'h2)];
          reg136 <= (+(~{($signed(wire126) >> wire126[(4'hc):(3'h4)])}));
        end
      else
        begin
          reg131 <= $signed($unsigned(reg133));
          if ($signed($unsigned($signed(({wire124} | (wire127 ?
              reg130 : wire129))))))
            begin
              reg132 <= $unsigned((!(wire128 >>> $signed((reg132 * reg135)))));
              reg133 <= $unsigned((~|wire125[(4'h8):(3'h6)]));
              reg134 <= (~|$unsigned((^~reg134[(1'h1):(1'h1)])));
              reg135 <= wire128[(2'h2):(1'h0)];
            end
          else
            begin
              reg132 <= $unsigned((8'hb7));
              reg133 <= $unsigned(((-wire124[(1'h1):(1'h0)]) ?
                  wire127 : $signed($unsigned((-wire126)))));
              reg134 <= $unsigned((8'hbe));
            end
          reg136 <= {$unsigned(wire127), {(&reg134[(2'h3):(2'h2)])}};
          if (reg130[(2'h2):(2'h2)])
            begin
              reg137 <= ($signed(reg134[(1'h0):(1'h0)]) >= (~^reg135[(2'h3):(2'h3)]));
              reg138 <= (-reg136);
              reg139 <= $signed({{$unsigned((reg138 ? (8'hb4) : reg130))}});
              reg140 <= wire124;
            end
          else
            begin
              reg137 <= ((|($signed((reg140 ?
                      reg134 : wire129)) >= $signed((wire125 ?
                      reg139 : reg136)))) ?
                  {(((wire129 | reg137) > $unsigned((8'h9f))) ?
                          {(~reg138),
                              wire129[(4'hd):(4'h9)]} : reg132[(2'h3):(1'h1)])} : {($unsigned($unsigned(wire124)) ?
                          (wire129 >> (wire128 ?
                              reg132 : (8'hb7))) : (~|wire125[(3'h5):(3'h4)]))});
            end
          reg141 <= ($signed(({(reg134 >= reg139)} ?
                  $signed(wire125) : wire125)) ?
              reg130[(1'h0):(1'h0)] : (^$unsigned(reg134)));
        end
      reg142 <= reg137[(4'ha):(3'h7)];
      reg143 <= ($unsigned((($signed(reg133) <<< $unsigned(reg132)) ?
              $signed({reg140, wire124}) : ({reg130, reg135} ?
                  ((8'hbf) >= reg142) : $unsigned((8'hbb))))) ?
          ($unsigned((8'hab)) ?
              ((reg136[(3'h7):(2'h2)] != $unsigned((8'hb7))) >> (~|$unsigned(reg131))) : {$signed({(7'h42)})}) : wire128[(2'h2):(1'h0)]);
    end
  assign wire144 = $signed(({(-(+reg131)),
                       reg140} <<< {$unsigned($unsigned(reg139)),
                       (reg132[(2'h2):(1'h0)] ?
                           $unsigned(reg132) : {wire125, reg140})}));
  assign wire145 = reg141[(4'h8):(2'h3)];
  assign wire146 = (($signed(reg134[(1'h0):(1'h0)]) ?
                           reg141[(3'h5):(1'h0)] : reg131) ?
                       reg141 : ($unsigned(((^~wire129) ^ (reg139 >>> (8'hb2)))) ?
                           ((reg137 * (8'ha0)) ?
                               {$signed(wire145),
                                   (-(8'hb8))} : $unsigned($signed(reg131))) : ($unsigned((reg142 ?
                                   reg133 : (8'haf))) ?
                               ({reg142,
                                   wire128} - $signed(wire128)) : wire123[(3'h7):(2'h3)])));
  assign wire147 = (~^reg139[(2'h2):(1'h0)]);
  assign wire148 = $unsigned(({(~(~|wire128)), $signed((~&wire147))} ?
                       reg138[(3'h7):(1'h0)] : (-reg131)));
  assign wire149 = ($signed($signed($unsigned((8'ha7)))) ?
                       (({$unsigned(reg137)} ?
                               reg135 : ((~&wire125) ~^ $unsigned(wire125))) ?
                           (((~^wire127) << $signed(wire126)) ?
                               (wire124[(1'h1):(1'h1)] <<< reg137) : reg139) : $unsigned(((reg138 == reg142) - {wire123}))) : ((!(^~reg130[(4'ha):(2'h3)])) + ($signed((wire126 ?
                           wire146 : wire124)) == wire145)));
endmodule

module module96
#(parameter param118 = ((((((7'h42) ? (8'hbd) : (8'ha7)) ? {(8'ha1), (7'h42)} : ((8'hb3) ? (8'hba) : (8'ha3))) - (8'haa)) ? {((-(8'hbb)) >>> ((8'ha7) * (8'haf))), (((7'h40) ? (8'had) : (7'h43)) & ((8'hb1) ? (8'hb7) : (8'hbd)))} : (((^~(7'h44)) ~^ ((8'hb1) * (7'h44))) & ((|(8'hb2)) ^~ ((8'hac) ? (8'h9e) : (8'hb1))))) & ((~|({(7'h42)} ? ((7'h40) >>> (8'hbb)) : ((7'h40) ? (8'hb6) : (8'hb5)))) && (((~^(8'h9d)) | {(8'hae), (8'ha4)}) << {((7'h41) ? (8'ha6) : (8'hab))}))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire100;
  input wire signed [(3'h6):(1'h0)] wire99;
  input wire signed [(4'ha):(1'h0)] wire98;
  input wire [(2'h3):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire101;
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  assign y = {wire117,
                 wire116,
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
                 wire102,
                 wire101,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire101 = wire100;
  assign wire102 = $unsigned(wire101);
  assign wire103 = wire102;
  assign wire104 = $signed(wire102[(1'h0):(1'h0)]);
  assign wire105 = ($unsigned((&$signed((wire97 && wire101)))) ?
                       $signed($signed(wire100)) : ($unsigned((wire103[(3'h5):(1'h0)] ?
                               $signed(wire97) : {(8'hbb)})) ?
                           $unsigned((-(wire104 ?
                               (8'hb6) : wire101))) : $signed($signed(wire97))));
  assign wire106 = (({wire100} >= wire100[(4'hc):(4'hc)]) ?
                       wire97[(1'h0):(1'h0)] : {(8'hae)});
  assign wire107 = (^($signed($unsigned(wire104[(4'hf):(1'h1)])) ~^ ($signed(wire106[(2'h3):(2'h3)]) && $signed(wire103))));
  assign wire108 = wire104;
  assign wire109 = ((8'hb5) <<< (wire100[(4'hb):(4'h9)] ?
                       (($unsigned(wire107) ? $signed(wire99) : wire103) ?
                           ((wire107 ?
                               wire101 : wire104) && $unsigned(wire105)) : (wire105[(4'h8):(4'h8)] ?
                               wire102[(5'h10):(5'h10)] : wire105[(3'h4):(2'h3)])) : ($unsigned(((8'h9e) ~^ wire99)) ?
                           (wire108 ?
                               (wire105 >>> wire104) : (wire98 >= wire101)) : $signed((wire103 ?
                               wire98 : wire97)))));
  assign wire110 = (~|$signed((wire109 ?
                       ($signed((8'hac)) >= (8'hb0)) : wire105)));
  assign wire111 = (^(($unsigned((wire104 < (8'h9f))) == {(^wire109)}) ?
                       (^~(wire99 ?
                           {(8'hbc)} : (wire102 >= wire102))) : $unsigned(((8'hb0) & $unsigned(wire102)))));
  assign wire112 = $signed((($unsigned((wire104 >>> wire111)) & $signed((^~wire109))) ?
                       {wire101[(4'h9):(2'h2)],
                           wire109} : wire110[(4'he):(4'he)]));
  always
    @(posedge clk) begin
      if ((wire97[(2'h2):(2'h2)] >= {(7'h44), wire103}))
        begin
          reg113 <= $unsigned({$signed(wire100)});
        end
      else
        begin
          reg113 <= (wire108[(4'h8):(2'h2)] & (^(+$signed(wire111))));
          reg114 <= ($signed({$unsigned((wire100 ? wire107 : wire108))}) ?
              (-wire105[(3'h5):(1'h1)]) : ((~&wire99) <<< wire112));
        end
      reg115 <= (((!{(wire111 ?
                  wire102 : reg113)}) < (wire104 && reg113[(3'h4):(1'h1)])) ?
          {$signed(wire105[(3'h4):(2'h2)]),
              (^wire97[(2'h2):(1'h0)])} : {((wire106 >> wire106) ?
                  wire98[(3'h6):(2'h2)] : (&(8'hab)))});
    end
  assign wire116 = wire103[(5'h15):(4'hd)];
  assign wire117 = wire102;
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire30;
  input wire signed [(3'h7):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire49,
                 wire46,
                 wire45,
                 wire44,
                 wire32,
                 wire31,
                 reg73,
                 reg72,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg48,
                 reg47,
                 reg43,
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
                 (1'h0)};
  assign wire31 = wire29;
  assign wire32 = wire29;
  always
    @(posedge clk) begin
      if ($signed(($signed((~&(^~wire31))) ?
          ($unsigned(wire29[(2'h2):(1'h1)]) ?
              $unsigned(wire29[(1'h1):(1'h0)]) : (8'ha3)) : $unsigned(wire30[(3'h5):(1'h0)]))))
        begin
          reg33 <= wire32[(3'h5):(2'h3)];
          reg34 <= $unsigned(wire31);
          reg35 <= ((((|$signed(wire32)) == (+((8'ha8) ? wire30 : wire32))) ?
                  $unsigned($signed((wire28 || wire29))) : $signed(wire27)) ?
              reg34[(3'h6):(2'h2)] : (wire29[(1'h1):(1'h1)] | wire32[(4'hd):(3'h6)]));
          reg36 <= $signed((!wire30));
        end
      else
        begin
          reg33 <= wire28[(2'h3):(1'h0)];
          if (($unsigned($unsigned(wire31)) ?
              reg36[(1'h1):(1'h1)] : ($signed($unsigned(wire31)) * ($signed((reg33 ?
                      wire28 : reg35)) ?
                  ((reg34 ? (7'h40) : reg36) + $signed(wire31)) : (^(wire31 ?
                      reg35 : wire29))))))
            begin
              reg34 <= (reg36 ? wire32 : (^$signed(reg34)));
            end
          else
            begin
              reg34 <= $signed({{((8'hbb) ? (|wire31) : {wire27}),
                      {{reg33, wire31}, reg36[(1'h1):(1'h0)]}}});
              reg35 <= wire28;
            end
          reg36 <= (wire29 ? reg34 : (-$signed((+(reg36 >>> wire27)))));
          if (((8'hbd) ?
              $unsigned(((reg36 <<< (&wire28)) >> (~&(wire31 ?
                  wire32 : reg33)))) : $signed((reg33[(3'h4):(1'h1)] ?
                  $signed($signed((8'hab))) : wire28[(3'h6):(2'h2)]))))
            begin
              reg37 <= reg34;
              reg38 <= reg35;
            end
          else
            begin
              reg37 <= {((|$unsigned((~^wire31))) >> $unsigned(($unsigned(wire28) >> $unsigned(reg33))))};
              reg38 <= $signed(reg37[(2'h3):(2'h3)]);
              reg39 <= (~&(!wire30));
              reg40 <= (!$signed($unsigned(wire30)));
            end
          if (({$unsigned((reg35[(4'hf):(4'hf)] <= (wire27 << reg40)))} - wire31[(4'hf):(4'he)]))
            begin
              reg41 <= $unsigned((|$signed(((|reg34) - (wire27 ?
                  wire28 : wire31)))));
            end
          else
            begin
              reg41 <= $unsigned($unsigned((reg39 ?
                  reg39[(1'h1):(1'h0)] : $signed((~&reg34)))));
              reg42 <= ({$signed((!{(8'hb6)}))} ?
                  $signed({((~wire31) < {wire31})}) : $signed(reg36));
            end
        end
      reg43 <= $unsigned((|(((wire30 && (8'h9e)) >>> (wire28 ?
          wire29 : wire29)) < ((!reg34) || (reg36 ? wire29 : reg40)))));
    end
  assign wire44 = (~&(-(wire32[(4'h8):(3'h5)] ?
                      (reg36[(1'h0):(1'h0)] >= wire27[(1'h0):(1'h0)]) : $unsigned((reg38 ?
                          wire29 : reg40)))));
  assign wire45 = {reg41[(3'h7):(3'h4)]};
  assign wire46 = $signed(reg42);
  always
    @(posedge clk) begin
      reg47 <= $signed(((^$unsigned({reg34, reg42})) ?
          {$signed(reg36[(1'h0):(1'h0)])} : {(~$unsigned(reg40)),
              ($unsigned(reg35) ?
                  (wire46 <<< reg34) : (reg42 ? (8'ha2) : reg40))}));
      reg48 <= reg47;
    end
  assign wire49 = reg47;
  always
    @(posedge clk) begin
      if ((8'ha5))
        begin
          reg50 <= $signed((|(&(reg36[(1'h0):(1'h0)] || $signed(reg40)))));
          reg51 <= (reg47[(1'h0):(1'h0)] ?
              (!$signed($unsigned(wire44))) : reg38);
          reg52 <= {reg34[(3'h4):(1'h0)]};
          if ($unsigned(reg39))
            begin
              reg53 <= (wire49 ^~ (reg42[(4'hd):(3'h4)] ?
                  (~&$unsigned({wire49})) : ((~&$unsigned(reg40)) ?
                      $signed($signed((8'ha2))) : $unsigned((7'h44)))));
              reg54 <= (($signed($unsigned((~^(8'hb0)))) | {wire49[(1'h0):(1'h0)]}) ?
                  (reg47[(1'h0):(1'h0)] ^~ $signed($signed(reg47[(2'h2):(1'h1)]))) : (wire32[(4'h8):(3'h4)] ?
                      ((~(reg34 >= wire28)) ?
                          ((wire44 ? reg35 : reg34) ?
                              $signed(wire45) : wire32) : $unsigned((|reg53))) : (((reg34 || wire27) ?
                              {reg51} : $signed(reg53)) ?
                          ((reg35 == wire49) ?
                              $signed(reg36) : $signed(reg39)) : ((~&reg33) ?
                              reg41[(4'hf):(1'h1)] : $unsigned(reg35)))));
              reg55 <= reg33[(4'ha):(3'h4)];
            end
          else
            begin
              reg53 <= (reg48[(3'h7):(3'h6)] && (!wire28));
              reg54 <= $unsigned((~&wire46));
              reg55 <= (reg41 ?
                  $signed(({wire45[(3'h6):(3'h6)]} >> ({wire30} ?
                      (reg47 < reg36) : (|wire28)))) : reg39[(3'h7):(3'h5)]);
            end
        end
      else
        begin
          reg50 <= wire30[(3'h5):(2'h3)];
          reg51 <= wire32;
          if ((~(8'hb6)))
            begin
              reg52 <= $unsigned(reg42[(3'h4):(2'h3)]);
            end
          else
            begin
              reg52 <= {{$signed(reg51)}};
              reg53 <= ((reg43[(1'h0):(1'h0)] ^~ reg36[(1'h1):(1'h0)]) < {{reg52},
                  reg35});
              reg54 <= ($unsigned($unsigned(wire46)) - (8'h9d));
            end
        end
      if ({$unsigned($signed(((wire45 ? reg37 : reg36) ? (~^reg53) : (8'ha4)))),
          (({$unsigned(wire49), (reg54 | wire29)} ?
              $signed(wire44) : $unsigned((^wire31))) >>> (~|$signed((~|(8'ha9)))))})
        begin
          reg56 <= wire44[(4'h9):(4'h8)];
        end
      else
        begin
          if (reg51)
            begin
              reg56 <= $signed((reg34 ? (8'h9d) : ({{(8'hbe)}} - reg40)));
              reg57 <= $signed((reg42 << reg39[(3'h7):(3'h6)]));
              reg58 <= reg55;
              reg59 <= (~$unsigned(($unsigned((wire27 ? reg47 : wire45)) ?
                  ($unsigned(reg50) > reg36[(1'h1):(1'h1)]) : (+(wire27 != reg36)))));
            end
          else
            begin
              reg56 <= (8'h9e);
              reg57 <= ((|reg43[(3'h5):(2'h2)]) ? {reg59, (8'h9f)} : reg57);
              reg58 <= reg42;
              reg59 <= {(($signed(reg43[(2'h2):(1'h0)]) ?
                          ($unsigned(reg40) < {wire45,
                              reg50}) : $unsigned((reg47 ? wire32 : wire44))) ?
                      {reg53[(4'hc):(2'h2)],
                          $unsigned(reg37[(3'h6):(3'h5)])} : (!(+(-reg48)))),
                  (^~(&$signed(wire32)))};
              reg60 <= $signed(reg43);
            end
          reg61 <= {(~|reg50[(5'h11):(4'hc)])};
          reg62 <= (~((~&(wire31[(1'h0):(1'h0)] ^~ wire29)) - $signed($unsigned($unsigned(reg40)))));
          if (({{((8'hbf) > (reg37 ?
                      reg38 : (8'hb5)))}} | reg50[(4'he):(4'hb)]))
            begin
              reg63 <= wire44;
              reg64 <= $signed({reg37, wire27});
            end
          else
            begin
              reg63 <= (~|(($signed(reg57) >>> {(wire30 ? reg34 : reg61),
                  reg41}) <= (((reg55 >>> reg61) ?
                  reg36 : (reg50 ?
                      wire44 : wire31)) >> $unsigned(wire27[(1'h1):(1'h0)]))));
              reg64 <= {(reg56[(2'h3):(2'h3)] ?
                      ({reg47[(1'h1):(1'h0)],
                          wire44} == reg40[(3'h7):(3'h7)]) : (^$unsigned(reg61)))};
              reg65 <= (reg34[(1'h1):(1'h0)] ?
                  $unsigned((~&$unsigned((^~(8'h9f))))) : $signed(reg34[(1'h0):(1'h0)]));
            end
          if ((~($unsigned({reg56}) ?
              ($signed($unsigned(reg50)) ?
                  reg54 : reg57) : reg56[(1'h1):(1'h1)])))
            begin
              reg66 <= (($signed((!{reg59, wire28})) ?
                  ($signed((reg62 ?
                      wire49 : reg62)) & $unsigned($signed(reg58))) : ({reg63[(3'h5):(2'h3)],
                          (reg43 ? reg57 : reg56)} ?
                      {{wire31, reg38}} : ((+wire49) ?
                          $signed((8'hbb)) : (8'hbb)))) >= wire45[(5'h11):(4'hc)]);
            end
          else
            begin
              reg66 <= (-(|(8'hbf)));
            end
        end
    end
  assign wire67 = wire45[(4'h8):(3'h5)];
  assign wire68 = $unsigned($unsigned(reg43[(1'h0):(1'h0)]));
  assign wire69 = $signed(($unsigned(wire28) ?
                      $unsigned($unsigned($unsigned((8'haf)))) : reg35[(3'h6):(1'h1)]));
  assign wire70 = $unsigned(((~&$signed((^reg53))) ? reg33 : reg41));
  assign wire71 = $signed(wire45[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg72 <= $unsigned((wire27[(1'h0):(1'h0)] ?
          reg47 : reg51[(3'h6):(3'h6)]));
      reg73 <= ($signed(((^((8'hb6) - reg34)) ?
          ({wire46} ? (reg38 ? reg37 : reg51) : (-wire69)) : ((reg37 ?
                  reg50 : wire44) ?
              reg60[(5'h10):(3'h5)] : $unsigned(reg72)))) & $signed(wire29[(2'h2):(1'h0)]));
    end
  assign wire74 = (reg53 * ({{$signed(reg63), (reg35 | (8'hbd))},
                      reg66[(2'h3):(1'h1)]} ~^ wire45[(2'h2):(1'h0)]));
  assign wire75 = ((((^~(8'ha1)) ?
                              ($signed(reg53) | (wire68 < reg34)) : $signed($signed(reg64))) ?
                          reg64[(1'h0):(1'h0)] : (reg36[(2'h2):(1'h1)] || ((reg66 <<< wire74) >>> (reg58 ?
                              reg51 : reg39)))) ?
                      reg38[(1'h0):(1'h0)] : (!$signed(((reg50 == reg57) ^ $unsigned(reg53)))));
  assign wire76 = (((&{{reg62}, reg54[(2'h2):(1'h1)]}) < {$unsigned((reg58 ?
                              (8'hbb) : (8'hb0))),
                          (^~(8'h9f))}) ?
                      (((-(reg51 ? (8'hbc) : reg62)) ?
                              $signed((wire49 * wire31)) : (+$signed(wire46))) ?
                          (reg53[(4'ha):(1'h1)] ?
                              wire44 : $unsigned((reg57 ?
                                  reg37 : (8'hb3)))) : $signed(((reg65 & wire71) ?
                              (!reg50) : $unsigned((8'hb4))))) : (($signed($signed((8'h9c))) ?
                              ((reg39 ?
                                  wire29 : wire69) <= $signed(reg41)) : {{reg43},
                                  (+reg41)}) ?
                          (~&($unsigned(reg58) << {reg65})) : ((reg55[(2'h2):(2'h2)] ?
                              (reg50 ? wire32 : reg35) : (wire49 ?
                                  (8'ha0) : (8'hb6))) * $unsigned((wire75 ?
                              reg73 : reg41)))));
  assign wire77 = ((~|(reg59 < $unsigned($unsigned(reg40)))) * wire45);
  assign wire78 = $unsigned(reg54[(2'h2):(2'h2)]);
  assign wire79 = reg48;
  assign wire80 = reg54[(2'h3):(1'h0)];
  assign wire81 = reg38[(1'h1):(1'h0)];
endmodule

module module11
#(parameter param23 = (((-(((8'h9e) ^ (7'h44)) <<< ((8'haa) << (8'h9d)))) ? ({(+(7'h42))} - (~|(~(8'haf)))) : (({(8'hb6), (8'hb7)} ? ((8'hb2) ? (8'h9c) : (8'hb2)) : ((8'hbb) << (8'h9d))) ? ({(8'had)} ? ((8'hac) ? (8'hab) : (8'ha5)) : ((8'h9f) >> (8'h9d))) : {{(8'hae), (8'h9d)}, {(8'hb0)}})) ? ((!(((8'hbb) >= (8'hae)) < ((8'haf) == (8'hbe)))) != (((+(8'hb3)) || (~^(8'ha2))) > ((&(8'hbb)) <<< (^~(8'hbc))))) : ((!((~^(8'ha6)) <= ((8'hb8) ~^ (8'haa)))) != ((((7'h44) ? (8'ha2) : (8'hb8)) ? {(8'ha8), (8'hab)} : (+(8'ha9))) <<< ((~(8'hb0)) & ((8'hb5) ? (8'h9f) : (8'hbe)))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire13;
  input wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  assign y = {wire22, wire21, wire20, wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = (wire15 + $signed($unsigned($unsigned((wire12 ?
                      wire14 : wire12)))));
  assign wire17 = ((wire15[(4'hc):(3'h5)] ?
                      $signed($unsigned(((7'h42) ?
                          wire12 : wire16))) : (!wire13[(2'h2):(1'h1)])) > wire12);
  assign wire18 = wire17;
  assign wire19 = $unsigned(wire12);
  assign wire20 = (({wire14[(5'h14):(4'ha)],
                      $unsigned((8'hac))} >> $signed((~(^~wire14)))) <= wire19[(5'h13):(5'h11)]);
  assign wire21 = ($unsigned(wire19[(4'h8):(3'h6)]) ?
                      $signed(wire12[(3'h5):(3'h5)]) : (((~^((7'h44) >>> (8'hbf))) ?
                          ($signed(wire13) ?
                              $unsigned((8'hbc)) : ((8'hb5) & wire12)) : {$signed(wire12),
                              $signed((8'hb3))}) ^ (&wire16[(1'h0):(1'h0)])));
  assign wire22 = ({(+($signed(wire13) ? wire13 : $signed((8'hb0)))),
                      wire20[(1'h1):(1'h0)]} ^~ (wire16[(1'h1):(1'h0)] <<< (($unsigned((8'ha8)) ?
                      $unsigned((8'hb5)) : wire13) ^~ wire20)));
endmodule
