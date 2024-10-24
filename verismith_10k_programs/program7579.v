module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire138;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire153;
  wire signed [(4'h9):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire156;
  wire [(3'h5):(1'h0)] wire158;
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(3'h5):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  assign y = {wire160,
                 wire138,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire57,
                 wire140,
                 wire141,
                 wire152,
                 wire153,
                 wire154,
                 wire156,
                 wire158,
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
                 (1'h0)};
  assign wire5 = $signed(((!(8'hac)) ~^ (8'had)));
  assign wire6 = {(wire4 >>> (wire0 ~^ ($signed(wire4) < (wire4 ?
                         wire2 : wire3)))),
                     ((($signed((8'ha7)) || $signed(wire3)) ?
                         $unsigned((wire2 ?
                             wire1 : wire3)) : {(^~wire2)}) > ($signed(wire1) ?
                         wire4[(4'he):(4'he)] : wire0[(3'h4):(3'h4)]))};
  assign wire7 = $signed((($signed($unsigned(wire2)) ?
                     (wire6 >= $unsigned(wire2)) : (~^$unsigned(wire0))) & $signed($signed((&(8'hb5))))));
  assign wire8 = ({((((8'h9e) == wire1) ?
                             $unsigned(wire0) : {wire5,
                                 wire4}) != $signed(wire1))} ?
                     (^($signed($signed(wire5)) ~^ $signed((~^(8'hb1))))) : $unsigned($signed({wire1[(1'h1):(1'h0)],
                         wire4[(4'h9):(1'h1)]})));
  module9 #() modinst58 (.wire14(wire2), .wire11(wire3), .clk(clk), .wire10(wire1), .wire13(wire5), .wire12(wire6), .y(wire57));
  module59 #() modinst139 (.wire63(wire6), .y(wire138), .wire62(wire1), .wire64(wire4), .clk(clk), .wire60(wire2), .wire61(wire8));
  assign wire140 = {{{(!(wire4 ? wire2 : wire2)), {wire6, wire5}},
                           ((+$unsigned((8'hab))) >>> ($unsigned(wire2) * wire7))}};
  assign wire141 = $signed($unsigned($unsigned((8'h9c))));
  always
    @(posedge clk) begin
      reg142 <= $unsigned(((($unsigned(wire138) ?
                  (wire0 > wire3) : $unsigned(wire5)) ?
              ($signed(wire2) ?
                  (wire140 == (8'hab)) : (wire3 ?
                      wire2 : wire4)) : wire8[(3'h7):(3'h5)]) ?
          wire5 : wire141[(1'h0):(1'h0)]));
      reg143 <= ((({$signed(wire0)} ?
                  {$unsigned((8'ha4)), wire141} : wire8[(4'hb):(4'hb)]) ?
              (((wire1 >= wire6) ? (-wire6) : wire4[(5'h13):(3'h7)]) ?
                  (wire1 ? (|wire2) : wire2) : (8'hb4)) : (|wire8)) ?
          (~wire3) : wire7[(3'h6):(1'h1)]);
      if ($unsigned(((wire57 <<< wire8[(4'he):(4'hb)]) ?
          (~$signed($signed(wire8))) : $signed(($unsigned(wire57) - wire8)))))
        begin
          reg144 <= $signed(wire0[(2'h3):(1'h0)]);
        end
      else
        begin
          reg144 <= $signed(wire1[(4'he):(3'h7)]);
          if (wire3[(4'h8):(1'h1)])
            begin
              reg145 <= wire4;
              reg146 <= wire8;
              reg147 <= $signed(((~|((wire6 ? wire140 : wire1) ?
                      wire2 : wire138)) ?
                  (~^({reg145,
                      wire1} ^ ((8'haf) + wire3))) : $signed(wire1[(1'h1):(1'h1)])));
              reg148 <= (+{(&$signed($unsigned(wire2))),
                  $unsigned(reg145[(2'h2):(1'h1)])});
              reg149 <= {(wire8 ?
                      $signed($signed((reg144 ~^ reg142))) : ($signed((wire7 != reg146)) ?
                          ((reg145 ?
                              reg145 : reg142) >> (reg146 >>> wire4)) : wire140)),
                  (~^$unsigned((reg146 <= wire2)))};
            end
          else
            begin
              reg145 <= {{wire6[(2'h3):(2'h2)]},
                  $signed((^{wire5[(4'hf):(1'h0)], $unsigned((8'hbe))}))};
              reg146 <= reg145;
              reg147 <= (^$signed(reg143[(4'h9):(2'h2)]));
            end
          reg150 <= (reg147 ?
              (wire3[(4'hd):(2'h2)] ?
                  (reg149 ^~ (reg142[(3'h4):(1'h0)] ?
                      ((8'ha4) <= wire7) : (wire2 ?
                          wire4 : wire3))) : (7'h40)) : $unsigned($signed(wire6)));
        end
      reg151 <= $unsigned({reg143[(3'h7):(3'h7)],
          $signed({{reg144, reg150}, $unsigned(reg145)})});
    end
  assign wire152 = wire4;
  assign wire153 = (wire8 ?
                       wire6[(2'h3):(2'h3)] : {(8'hae),
                           ($signed((~^wire7)) ?
                               $signed((wire140 < wire1)) : ($signed((8'h9e)) >> (wire138 ?
                                   (8'hb4) : wire8)))});
  module9 #() modinst155 (.clk(clk), .wire14(reg151), .wire10(reg144), .wire13(wire3), .wire11(reg145), .y(wire154), .wire12(wire2));
  module9 #() modinst157 (.wire10(reg144), .wire14(reg147), .clk(clk), .wire12(wire3), .y(wire156), .wire11(wire8), .wire13(reg142));
  module113 #() modinst159 (.y(wire158), .clk(clk), .wire114(reg143), .wire115(wire138), .wire118(reg151), .wire117(reg142), .wire116(reg148));
  assign wire160 = (&wire156[(3'h6):(2'h2)]);
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire64;
  input wire signed [(4'ha):(1'h0)] wire63;
  input wire [(4'he):(1'h0)] wire62;
  input wire signed [(5'h15):(1'h0)] wire61;
  input wire [(5'h14):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire137;
  wire signed [(2'h3):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire131;
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire101,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire131,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  module65 #() modinst102 (wire101, clk, wire61, wire63, wire62, wire64, wire60);
  assign wire103 = (($unsigned((8'hbf)) ?
                           (&wire63) : $signed((~^(wire61 ^~ (8'hb7))))) ?
                       wire60 : (^~$signed(wire63[(3'h5):(1'h1)])));
  assign wire104 = wire63[(3'h4):(2'h2)];
  assign wire105 = wire63[(3'h6):(3'h6)];
  assign wire106 = $unsigned(wire64);
  always
    @(posedge clk) begin
      if ((!wire103[(4'he):(2'h3)]))
        begin
          if ($unsigned(($unsigned((wire62 > (wire63 ~^ wire61))) ?
              (wire60 ?
                  (wire64[(1'h1):(1'h0)] << $signed(wire60)) : $unsigned(wire106)) : ($unsigned($signed(wire105)) <= wire62))))
            begin
              reg107 <= $unsigned(wire101);
            end
          else
            begin
              reg107 <= wire103;
              reg108 <= wire104;
              reg109 <= reg108[(3'h4):(1'h0)];
              reg110 <= wire62[(4'hd):(2'h3)];
              reg111 <= ((+(|(^~(-wire103)))) ^ (~(wire60[(4'ha):(3'h7)] || (~^wire64[(5'h10):(5'h10)]))));
            end
        end
      else
        begin
          if ((wire103[(4'h8):(2'h2)] >= wire106[(4'ha):(2'h3)]))
            begin
              reg107 <= reg108;
              reg108 <= (&$unsigned(reg110[(5'h12):(4'h8)]));
              reg109 <= $unsigned({{{(~|wire103), (reg109 == (7'h43))}}});
            end
          else
            begin
              reg107 <= $signed(reg110);
            end
        end
      reg112 <= $signed($unsigned((+(wire104 ?
          (wire61 ? wire64 : (8'ha6)) : (wire61 ? wire104 : wire103)))));
    end
  module113 #() modinst132 (.wire114(wire64), .y(wire131), .clk(clk), .wire116(wire60), .wire117(reg110), .wire115(wire63), .wire118(reg109));
  assign wire133 = wire64;
  assign wire134 = reg112[(4'hb):(4'ha)];
  assign wire135 = ($signed(wire131) == (wire134 ?
                       wire105[(1'h1):(1'h0)] : wire61));
  assign wire136 = wire105;
  assign wire137 = $signed($unsigned($unsigned(($unsigned((8'ha6)) ?
                       $unsigned((7'h44)) : $signed(wire131)))));
endmodule

module module9
#(parameter param56 = (-{{(&((8'hb7) - (8'hb1))), ((7'h42) >>> ((8'hab) ? (7'h44) : (8'hbf)))}, (~|(~|((8'ha8) ? (8'hbf) : (8'hb7))))}))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire [(3'h7):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire51;
  assign y = {wire55, wire54, wire53, wire51, (1'h0)};
  module15 #() modinst52 (wire51, clk, wire11, wire13, wire12, wire14);
  assign wire53 = wire51;
  assign wire54 = (^wire53);
  assign wire55 = (!wire54[(1'h0):(1'h0)]);
endmodule

module module15
#(parameter param50 = ((8'h9c) ? {{(((8'hb2) ? (8'hb9) : (8'ha7)) ? ((7'h41) <<< (8'h9e)) : (|(8'hac)))}} : ({(~^((8'h9c) >> (8'haa))), (8'ha8)} >= (~|{((8'hb9) ? (8'haa) : (8'haf)), (8'hac)}))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire22,
                 wire21,
                 wire20,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire20 = (~&$signed(wire19[(3'h5):(3'h4)]));
  assign wire21 = (-($signed({$unsigned((8'hab))}) ?
                      (^~wire20) : (wire19 ^~ $unsigned($signed(wire16)))));
  assign wire22 = $unsigned(wire21);
  always
    @(posedge clk) begin
      reg23 <= $unsigned($signed(($unsigned($unsigned((8'hb6))) ?
          {((8'hac) || wire19), wire18[(3'h5):(2'h3)]} : wire18)));
      reg24 <= wire18;
      reg25 <= ((8'haf) >= $signed((($unsigned((8'ha2)) <= $signed(wire19)) ?
          ((reg24 >> wire18) ? reg24 : (wire17 < (8'h9c))) : wire21)));
    end
  always
    @(posedge clk) begin
      reg26 <= ((&(wire19 ?
              reg24[(3'h7):(3'h6)] : $unsigned((wire17 ? wire21 : wire17)))) ?
          reg24[(5'h13):(4'he)] : wire17[(1'h0):(1'h0)]);
      reg27 <= $signed(reg23[(5'h12):(2'h3)]);
      reg28 <= wire20[(1'h0):(1'h0)];
    end
  assign wire29 = (8'hbd);
  assign wire30 = $unsigned((~((+(~reg25)) >= ((|wire17) ?
                      (wire20 ^ wire21) : (wire21 ? (8'hb9) : wire18)))));
  assign wire31 = wire21[(3'h4):(1'h1)];
  assign wire32 = (~&($unsigned(wire21) + ($unsigned({reg26}) != reg23)));
  assign wire33 = $unsigned($signed((reg28[(3'h6):(2'h3)] || reg25[(2'h3):(1'h0)])));
  assign wire34 = (7'h44);
  assign wire35 = wire17[(2'h2):(1'h1)];
  assign wire36 = $signed($signed($signed(wire20[(1'h0):(1'h0)])));
  assign wire37 = ((~|$signed((8'hbe))) <= wire20[(2'h2):(2'h2)]);
  assign wire38 = $unsigned((^~reg25[(2'h2):(1'h0)]));
  assign wire39 = wire30;
  always
    @(posedge clk) begin
      if (wire39)
        begin
          reg40 <= $unsigned(({$signed((wire34 >> (8'ha7)))} ?
              ({$signed(wire20), reg23[(1'h1):(1'h0)]} ?
                  (wire31[(3'h6):(3'h4)] ?
                      ((7'h43) ?
                          (8'hb4) : (8'haf)) : (-wire16)) : $unsigned(wire17[(1'h1):(1'h0)])) : wire33[(3'h6):(2'h3)]));
          if ({(wire17 + (((wire32 ?
                  reg24 : (8'hbd)) << $unsigned(wire35)) >> (^reg23[(4'hb):(4'h8)]))),
              (-{$signed($signed(wire19))})})
            begin
              reg41 <= wire29[(4'h8):(3'h4)];
              reg42 <= $unsigned($unsigned($signed(($signed(reg41) ?
                  wire38[(1'h1):(1'h0)] : (wire16 ? wire34 : wire18)))));
              reg43 <= $signed(($unsigned(reg26[(2'h3):(1'h1)]) < wire21[(4'hc):(3'h5)]));
              reg44 <= $signed(reg42[(1'h1):(1'h0)]);
            end
          else
            begin
              reg41 <= (+(^(reg27 ?
                  (-$signed(reg28)) : ($signed(wire17) ?
                      (reg44 & reg25) : (wire17 >= reg43)))));
              reg42 <= (reg40 >> wire22);
              reg43 <= ((({(wire37 ? (8'hbc) : wire22)} ?
                      (~|(reg24 | wire36)) : ((~&wire37) << (+wire29))) <<< wire29) ?
                  reg26[(2'h3):(2'h3)] : reg26[(2'h2):(1'h1)]);
              reg44 <= ($unsigned(reg41) ?
                  wire20 : $unsigned((&((8'hb0) << wire21[(5'h13):(5'h10)]))));
            end
          reg45 <= (($signed(wire35[(3'h5):(3'h4)]) || $signed(((reg24 >>> reg26) + ((8'ha3) >= (8'hb2))))) - $signed((((wire18 ?
              wire18 : reg43) > (reg27 || wire18)) * (wire22 ^ reg41))));
        end
      else
        begin
          reg40 <= reg25[(2'h3):(2'h3)];
          reg41 <= $signed($unsigned((^{(reg44 ? (8'hbb) : wire17),
              (wire19 >= wire21)})));
        end
      reg46 <= (reg25[(3'h4):(2'h3)] ?
          {(reg41 ?
                  (wire35 ?
                      (wire38 && wire38) : (wire32 > wire30)) : wire36)} : wire34);
      reg47 <= $signed(reg46);
      reg48 <= wire16;
      reg49 <= {$unsigned(reg41[(3'h4):(2'h3)])};
    end
endmodule

module module113  (y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire118;
  input wire [(2'h3):(1'h0)] wire117;
  input wire signed [(5'h14):(1'h0)] wire116;
  input wire signed [(4'h9):(1'h0)] wire115;
  input wire [(4'h8):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire130;
  wire [(2'h2):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire120;
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire120,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg119,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg119 <= (wire118[(1'h0):(1'h0)] && {(wire114 ?
              $unsigned((wire114 * wire116)) : (~&(wire115 < wire118)))});
    end
  assign wire120 = (({wire115[(2'h2):(1'h0)]} ?
                       wire116[(4'h8):(3'h4)] : (((wire117 ?
                               wire118 : wire117) ?
                           ((8'hb6) ?
                               wire117 : wire117) : $signed(wire117)) <<< $signed(wire116))) >>> $signed(wire116));
  always
    @(posedge clk) begin
      reg121 <= ((~(((~|reg119) || {wire116, (7'h43)}) ?
          $unsigned({wire120}) : (~^$signed(wire116)))) + ($signed(($unsigned((7'h41)) | (wire115 ?
              wire120 : wire114))) ?
          $signed(({wire114} ?
              reg119 : wire118)) : $unsigned($unsigned($unsigned(wire114)))));
      reg122 <= $signed($signed($signed((~&((7'h43) && wire116)))));
      reg123 <= (+((+wire115) || ((+$unsigned(reg122)) ?
          (wire115[(2'h2):(1'h1)] ? (~|reg122) : (&wire118)) : wire117)));
    end
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(wire117) ?
          reg123 : ({(reg123 || reg121), {reg122}} ?
              $unsigned(reg123[(1'h1):(1'h0)]) : wire120))))
        begin
          reg124 <= $signed(reg119[(3'h7):(3'h6)]);
          reg125 <= (~^wire114);
          reg126 <= (((&reg121[(2'h2):(1'h1)]) ?
                  (((^~reg122) ? (^reg125) : (wire114 ~^ reg119)) ?
                      (^~(wire114 < reg122)) : wire120[(1'h0):(1'h0)]) : ({(wire114 <= wire114)} && ($signed(reg123) ^~ (~^(8'hac))))) ?
              $unsigned((reg124[(2'h2):(1'h1)] + wire120)) : ({$unsigned((^(7'h40)))} ?
                  reg122 : wire120));
          reg127 <= reg124;
        end
      else
        begin
          reg124 <= {$signed({$unsigned((^~reg126)),
                  ((8'ha1) ? (~&reg123) : (~reg125))}),
              $signed(wire116)};
          reg125 <= (7'h44);
        end
      reg128 <= ($signed(wire120[(1'h1):(1'h0)]) == ((reg119[(3'h7):(3'h7)] ?
          ((-reg121) <= (!(8'hbf))) : $signed($unsigned((7'h40)))) << (~|reg121)));
    end
  assign wire129 = {(+((8'ha9) & ($unsigned(wire120) * {reg122, wire117}))),
                       $unsigned(((8'hab) << (-reg119)))};
  assign wire130 = {reg128, reg127};
endmodule

module module65  (y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire70;
  input wire signed [(4'ha):(1'h0)] wire69;
  input wire [(4'he):(1'h0)] wire68;
  input wire signed [(4'hf):(1'h0)] wire67;
  input wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire71;
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  assign y = {wire100,
                 wire96,
                 wire95,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg99,
                 reg98,
                 reg97,
                 reg94,
                 reg93,
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
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire71 = wire70;
  assign wire72 = $signed(wire66);
  assign wire73 = $unsigned(wire67);
  assign wire74 = (8'hac);
  always
    @(posedge clk) begin
      reg75 <= ($signed(wire74) ?
          (wire69 ?
              wire66[(4'hf):(4'he)] : wire71) : (($signed($signed(wire74)) & wire67) ?
              ($signed((wire71 < wire68)) ?
                  (~^wire69[(1'h1):(1'h1)]) : $signed($unsigned((8'ha1)))) : (^~$unsigned((wire68 ?
                  wire67 : wire69)))));
      reg76 <= $signed(wire69);
      reg77 <= $signed({($signed($signed(wire73)) ?
              reg75[(1'h0):(1'h0)] : (&$signed(wire68))),
          wire70});
    end
  always
    @(posedge clk) begin
      if (((8'ha8) < $signed(((wire69 - $unsigned(reg77)) ?
          $unsigned((8'ha2)) : ((~|(8'haa)) >> (reg77 ? wire70 : wire72))))))
        begin
          reg78 <= {$signed(wire74), reg76};
        end
      else
        begin
          reg78 <= reg76;
          if ($signed((^wire66[(3'h5):(2'h3)])))
            begin
              reg79 <= (^(~&$unsigned((~^reg77[(4'he):(1'h0)]))));
              reg80 <= ((((wire73[(3'h5):(1'h0)] != $unsigned(reg75)) ?
                      wire74 : reg77[(4'hf):(4'he)]) - (^~($signed(reg79) ?
                      (~&wire68) : (wire74 ? wire71 : wire69)))) ?
                  $signed((!(-((8'hae) ?
                      wire72 : reg76)))) : ((wire74[(5'h10):(3'h6)] >>> ($signed((8'hb3)) + (!reg75))) >>> reg79));
              reg81 <= reg80;
              reg82 <= ((~^{(~&$unsigned(reg76)), (&wire74)}) != reg80);
              reg83 <= wire71[(5'h10):(3'h5)];
            end
          else
            begin
              reg79 <= $unsigned((8'hbe));
            end
          reg84 <= (wire70 ?
              (&$unsigned($unsigned((reg75 ?
                  (8'hb5) : reg76)))) : $unsigned($unsigned({$signed(reg83)})));
          if ($unsigned(wire71))
            begin
              reg85 <= wire71;
              reg86 <= reg77[(4'h9):(4'h9)];
              reg87 <= (-reg79[(2'h2):(1'h1)]);
              reg88 <= $unsigned(wire69[(3'h5):(2'h3)]);
            end
          else
            begin
              reg85 <= (8'h9c);
              reg86 <= reg87[(4'hf):(4'h8)];
              reg87 <= $unsigned(wire72);
            end
        end
      reg89 <= (wire72 + $unsigned($unsigned((8'ha1))));
      reg90 <= (-($unsigned(reg88[(2'h3):(1'h0)]) ?
          reg84 : $signed((~|{reg76, reg82}))));
      if (((((~&$signed(wire74)) * $unsigned($unsigned(reg77))) ?
              reg75[(3'h7):(3'h4)] : ($signed((wire73 ? (8'hac) : wire68)) ?
                  reg86[(1'h0):(1'h0)] : reg89[(4'h8):(3'h4)])) ?
          ($signed(reg81[(1'h1):(1'h0)]) ^~ ((~wire69[(3'h7):(1'h0)]) == reg83[(3'h5):(1'h1)])) : (~^$unsigned(((reg75 & reg81) + wire67[(4'hc):(3'h6)])))))
        begin
          reg91 <= ({$signed($signed($unsigned(wire74))),
              ((wire73[(1'h0):(1'h0)] - ((8'h9f) ? reg85 : reg85)) ?
                  reg77 : reg87)} || (~|reg89));
        end
      else
        begin
          reg91 <= $signed(($unsigned(reg91[(3'h6):(3'h6)]) ~^ (reg90 ?
              wire66[(4'ha):(3'h7)] : $unsigned($unsigned(reg84)))));
        end
      if (reg80[(1'h0):(1'h0)])
        begin
          reg92 <= ($unsigned({(~&reg87)}) <= reg76[(5'h13):(5'h12)]);
        end
      else
        begin
          reg92 <= ($unsigned($unsigned($unsigned(reg85[(2'h3):(2'h2)]))) ?
              reg78 : (8'hb0));
          reg93 <= ((8'hae) ^~ ($signed($signed($unsigned(reg88))) ?
              ({$unsigned(reg85)} + $unsigned($unsigned(reg90))) : $signed($signed($signed(reg90)))));
          reg94 <= wire73;
        end
    end
  assign wire95 = ($unsigned({(reg79[(2'h2):(1'h1)] ?
                          {wire67,
                              (8'ha8)} : reg77[(3'h4):(1'h1)])}) >> $signed((reg76 ?
                      $signed(wire71) : ((reg93 >>> wire68) ?
                          {reg90} : $signed(wire69)))));
  assign wire96 = reg75;
  always
    @(posedge clk) begin
      reg97 <= reg90;
      reg98 <= reg87;
      reg99 <= (^(|(reg94[(3'h6):(3'h5)] ?
          ({reg78, reg75} < $unsigned(reg83)) : reg86[(4'hb):(2'h2)])));
    end
  assign wire100 = $unsigned($unsigned({(((7'h43) ^ reg97) < (wire72 ?
                           (8'hab) : (8'hb4))),
                       (~^(wire73 ? (7'h44) : (8'had)))}));
endmodule
