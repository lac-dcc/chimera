module top
#(parameter param196 = ((~(~|(((8'had) ? (8'hb7) : (8'hbd)) ? (~|(8'ha2)) : ((8'hb6) ? (8'hb8) : (7'h44))))) ? (((((8'hbc) | (8'hae)) ? ((8'ha3) - (7'h42)) : ((8'hbe) - (8'hbc))) - ((~|(8'hb7)) >= ((8'hba) - (8'ha2)))) + ((7'h42) | {((8'hb1) >= (8'hb2))})) : ((~^(^~{(8'haa), (8'had)})) ~^ (&(~|(8'ha6))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire195;
  wire signed [(4'ha):(1'h0)] wire193;
  wire signed [(3'h4):(1'h0)] wire192;
  wire [(5'h13):(1'h0)] wire191;
  wire signed [(3'h6):(1'h0)] wire190;
  wire [(4'hd):(1'h0)] wire189;
  wire signed [(4'ha):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire187;
  wire [(5'h12):(1'h0)] wire186;
  wire [(5'h11):(1'h0)] wire182;
  wire [(5'h11):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire179;
  reg [(5'h10):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg183 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire195,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire182,
                 wire181,
                 wire6,
                 wire179,
                 reg185,
                 reg184,
                 reg183,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'hb):(3'h5)];
    end
  assign wire6 = (8'ha7);
  module7 #() modinst180 (.wire11(reg5), .wire9(wire3), .clk(clk), .y(wire179), .wire10(wire6), .wire8(wire1));
  assign wire181 = wire179[(2'h3):(2'h2)];
  assign wire182 = (~^(($signed({wire2}) ^~ ($unsigned(reg5) >>> (^~reg5))) ?
                       ($unsigned(wire2) >> $signed($unsigned(wire179))) : ({wire181,
                               wire3[(4'hf):(3'h5)]} ?
                           $signed($signed(wire1)) : ((wire179 >= (8'ha2)) ?
                               wire0[(3'h7):(2'h3)] : $signed(wire3)))));
  always
    @(posedge clk) begin
      reg183 <= ((~|($unsigned((wire181 << reg5)) > $signed((wire6 >> wire1)))) >> $signed(($unsigned($signed(reg5)) | wire4)));
      reg184 <= ((&($unsigned($signed(wire6)) ?
              $signed((wire3 >> wire3)) : wire0)) ?
          wire179 : (+wire182));
      reg185 <= (-(8'hbd));
    end
  assign wire186 = wire3;
  assign wire187 = (8'hb2);
  assign wire188 = ($unsigned((!(8'ha9))) + reg5);
  assign wire189 = wire182;
  assign wire190 = wire2[(1'h0):(1'h0)];
  assign wire191 = wire179;
  assign wire192 = ((($signed($unsigned(reg184)) - ($signed(wire3) > wire181)) - (($unsigned(wire1) ?
                           (|wire2) : wire188[(3'h5):(3'h4)]) <= ((reg185 * wire191) ?
                           wire186 : $signed(wire189)))) ?
                       (~wire2) : (~|(wire2 * (+(wire188 != (8'hba))))));
  module7 #() modinst194 (.y(wire193), .wire9(wire189), .wire11(reg184), .wire8(reg5), .clk(clk), .wire10(wire182));
  assign wire195 = {wire3, reg185};
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire178;
  wire [(3'h4):(1'h0)] wire176;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire100;
  wire [(4'hf):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire131;
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  assign y = {wire178,
                 wire176,
                 wire94,
                 wire53,
                 wire96,
                 wire97,
                 wire98,
                 wire100,
                 wire101,
                 wire131,
                 reg99,
                 (1'h0)};
  module12 #() modinst54 (.wire15(wire10), .y(wire53), .clk(clk), .wire14(wire8), .wire13(wire11), .wire16(wire9));
  module55 #() modinst95 (wire94, clk, wire53, wire10, wire8, wire11, wire9);
  assign wire96 = wire8;
  assign wire97 = $signed((|$unsigned(((wire96 <<< wire94) >= (^wire8)))));
  assign wire98 = ((!((wire97 ? wire11[(2'h3):(1'h0)] : $signed((8'h9c))) ?
                      {{(8'hb9), wire9}, $signed((8'hb0))} : ((wire94 ?
                              wire9 : wire11) ?
                          wire9[(1'h1):(1'h1)] : wire97))) || wire96[(4'hd):(4'h9)]);
  always
    @(posedge clk) begin
      reg99 <= ((wire98[(4'h8):(3'h4)] > ((^~wire11[(1'h1):(1'h1)]) ?
          $unsigned((wire94 ~^ wire53)) : ((wire11 + wire53) << $signed((8'ha8))))) + (wire10[(4'h8):(3'h4)] ?
          ((wire96[(4'hb):(2'h3)] != $unsigned(wire53)) ?
              ($signed((8'hbc)) ?
                  (^(7'h43)) : (wire94 ~^ wire98)) : wire96[(1'h0):(1'h0)]) : (-{$unsigned((8'hb3)),
              (wire8 & wire97)})));
    end
  assign wire100 = ($unsigned($unsigned((wire11[(1'h1):(1'h0)] > wire11))) ?
                       wire53[(2'h3):(2'h3)] : {wire94,
                           (wire10[(4'h8):(1'h0)] ?
                               (~&wire10[(4'hc):(2'h2)]) : (|{wire53}))});
  assign wire101 = $signed(((-({wire11} >= wire100[(3'h6):(3'h6)])) + (~|(&(wire8 ~^ wire98)))));
  module102 #() modinst132 (wire131, clk, wire10, wire100, wire97, wire96, wire94);
  module133 #() modinst177 (wire176, clk, wire101, wire131, wire94, wire98);
  assign wire178 = wire131[(2'h2):(2'h2)];
endmodule

module module133
#(parameter param174 = {(~^(~(((8'hb6) | (8'ha3)) ? {(8'hbc), (8'hb4)} : ((8'ha1) <= (8'h9e))))), (((((7'h42) ? (8'h9f) : (8'hbc)) ? ((8'hbf) ? (8'hb6) : (7'h43)) : ((8'hb7) ? (8'hb0) : (8'ha5))) ? ({(7'h44)} <= {(8'hb7)}) : (((8'hbe) >> (7'h41)) && (&(7'h43)))) ? (!(((8'hb4) ? (8'hbf) : (7'h42)) - (~|(8'ha1)))) : ({((8'hbe) ? (8'ha5) : (7'h44))} >>> (7'h43)))}, 
parameter param175 = (&{(+(~^(param174 ? param174 : param174)))}))
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire137;
  input wire signed [(5'h11):(1'h0)] wire136;
  input wire signed [(3'h6):(1'h0)] wire135;
  input wire signed [(4'h9):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire173;
  wire signed [(3'h7):(1'h0)] wire172;
  wire [(3'h6):(1'h0)] wire171;
  wire [(4'hc):(1'h0)] wire170;
  wire [(5'h12):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire149;
  wire signed [(2'h2):(1'h0)] wire148;
  wire [(4'hb):(1'h0)] wire143;
  wire signed [(3'h7):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire138;
  reg signed [(4'h8):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(5'h13):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg157 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(5'h14):(1'h0)] reg139 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire150,
                 wire149,
                 wire148,
                 wire143,
                 wire142,
                 wire141,
                 wire138,
                 reg168,
                 reg167,
                 reg166,
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
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire138 = {wire137};
  always
    @(posedge clk) begin
      reg139 <= (wire137 ?
          $signed((wire135 ?
              {$signed(wire136)} : wire135[(1'h0):(1'h0)])) : (($unsigned({wire134,
                  wire136}) ?
              (wire138[(2'h3):(1'h1)] ^ ((8'hb0) - wire136)) : ((wire135 <<< wire134) - (^wire135))) ~^ wire134));
      reg140 <= (wire137 ?
          $unsigned($unsigned(($unsigned(wire136) ?
              (^wire136) : wire136[(3'h6):(3'h6)]))) : $unsigned((!$signed({(8'hbe),
              wire137}))));
    end
  assign wire141 = wire134[(3'h4):(1'h1)];
  assign wire142 = $unsigned($unsigned(reg140));
  assign wire143 = $signed(($signed({$signed(wire137)}) ?
                       $unsigned({{(8'ha8)},
                           $unsigned((8'ha2))}) : ($unsigned($signed(reg139)) > reg140)));
  always
    @(posedge clk) begin
      reg144 <= wire135[(1'h0):(1'h0)];
      reg145 <= (wire134[(2'h2):(1'h1)] < (((8'hb6) | (~^$unsigned(wire141))) ?
          wire134[(3'h7):(1'h1)] : (~&(wire135[(3'h5):(1'h1)] >>> $unsigned(wire136)))));
      reg146 <= $signed($unsigned($unsigned(wire143[(2'h2):(1'h1)])));
      reg147 <= reg144[(2'h2):(1'h1)];
    end
  assign wire148 = (^~$unsigned($unsigned(reg139[(1'h1):(1'h1)])));
  assign wire149 = (~^wire142[(1'h0):(1'h0)]);
  assign wire150 = (|$signed($unsigned((^~(wire141 ? reg139 : (8'hb3))))));
  always
    @(posedge clk) begin
      if ($unsigned(reg145))
        begin
          reg151 <= $signed(($signed((wire136[(3'h6):(1'h1)] && ((7'h42) || wire135))) ?
              (wire134 ?
                  (reg139[(1'h1):(1'h0)] ?
                      $unsigned(wire135) : (-reg147)) : (((8'ha6) < wire148) ?
                      (wire138 ?
                          wire150 : reg146) : ((8'ha9) < wire149))) : (|(-(wire136 >> wire134)))));
          reg152 <= reg145[(2'h2):(1'h0)];
        end
      else
        begin
          if ({wire134, (wire149[(3'h5):(1'h1)] ? wire134 : wire141)})
            begin
              reg151 <= $signed(((^~(+$signed(wire148))) ~^ ({reg144,
                      (reg145 | (8'h9d))} ?
                  (~^(reg147 && wire136)) : wire150)));
              reg152 <= {{($unsigned($signed(wire134)) ?
                          {{(7'h43)},
                              (wire136 ?
                                  (8'haa) : wire143)} : wire143[(3'h4):(1'h1)])},
                  $signed((&wire136))};
              reg153 <= ($unsigned($signed(wire142[(3'h6):(1'h1)])) - (wire149[(1'h0):(1'h0)] | $signed(wire141)));
            end
          else
            begin
              reg151 <= (~|$signed($unsigned(({reg140, reg145} ?
                  (~reg147) : wire142))));
              reg152 <= ((reg151 & wire143) ~^ $signed({reg144[(3'h4):(2'h2)],
                  (~&(^~(8'h9e)))}));
              reg153 <= (+(reg152[(5'h13):(3'h6)] ?
                  $signed((~^$unsigned(wire135))) : (8'hac)));
            end
          if ((~|({($signed(wire134) || (wire137 ?
                  reg151 : wire149))} ^~ (wire141 ?
              $unsigned(reg146) : $unsigned((8'hb3))))))
            begin
              reg154 <= {($unsigned($signed($signed(reg151))) ?
                      (wire148 ?
                          ((8'hb8) ?
                              (wire136 && reg151) : $unsigned(reg153)) : $unsigned((wire142 <<< wire138))) : wire137[(4'ha):(3'h7)])};
              reg155 <= reg144[(1'h1):(1'h0)];
              reg156 <= $unsigned((~$unsigned(((~^(8'ha5)) >> $unsigned((8'ha0))))));
            end
          else
            begin
              reg154 <= (~^wire148[(1'h0):(1'h0)]);
              reg155 <= reg139[(2'h2):(1'h1)];
            end
          reg157 <= ($signed((~^$unsigned($unsigned(reg152)))) ^~ ((8'h9c) ?
              wire150 : wire134[(3'h6):(1'h0)]));
          if ($signed({wire138, $signed((|reg153))}))
            begin
              reg158 <= wire142;
            end
          else
            begin
              reg158 <= ($signed((~wire143[(4'h9):(3'h7)])) | {(^$unsigned($signed(reg152)))});
              reg159 <= ((($unsigned(wire141[(5'h12):(2'h2)]) ?
                          reg154 : {reg151[(4'hb):(3'h7)], (8'hb0)}) ?
                      reg158[(1'h1):(1'h1)] : (({wire134, wire148} ?
                              reg147 : wire150[(4'hc):(3'h4)]) ?
                          (~(^(7'h42))) : $signed((wire149 - reg140)))) ?
                  (~&(+reg144)) : {wire137[(3'h5):(1'h1)],
                      wire136[(4'h9):(3'h5)]});
              reg160 <= wire135;
              reg161 <= $unsigned(reg156);
              reg162 <= (&((~&$unsigned((reg157 + wire149))) <<< (-wire138[(2'h3):(1'h1)])));
            end
          if ($unsigned(reg151))
            begin
              reg163 <= ((~($unsigned($unsigned(reg151)) >> wire148[(2'h2):(2'h2)])) ?
                  $signed({$signed($unsigned((8'ha5)))}) : wire149[(3'h4):(1'h0)]);
              reg164 <= (-reg153);
              reg165 <= $signed((!($signed((reg156 ?
                  wire142 : wire137)) + $signed(wire136))));
              reg166 <= (7'h44);
              reg167 <= reg162[(4'h9):(3'h7)];
            end
          else
            begin
              reg163 <= wire143;
              reg164 <= reg144;
            end
        end
      reg168 <= ((wire135[(1'h1):(1'h1)] < (8'h9d)) & (-reg162[(4'h8):(2'h2)]));
    end
  assign wire169 = (-{(~|$unsigned((~|wire134))),
                       ((^~$unsigned(reg147)) ?
                           $unsigned(wire136) : ($unsigned(reg168) ?
                               $unsigned((8'hbe)) : reg146))});
  assign wire170 = wire136[(4'he):(3'h5)];
  assign wire171 = (8'ha9);
  assign wire172 = {reg146, wire149[(3'h6):(1'h1)]};
  assign wire173 = ($unsigned($signed($unsigned((reg163 ?
                           wire170 : wire138)))) ?
                       reg147[(4'hb):(3'h7)] : reg165[(3'h6):(2'h3)]);
endmodule

module module102  (y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire107;
  input wire signed [(4'h9):(1'h0)] wire106;
  input wire signed [(5'h10):(1'h0)] wire105;
  input wire signed [(4'ha):(1'h0)] wire104;
  input wire [(3'h4):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire121;
  wire signed [(4'hb):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire108 = $signed((^$unsigned(((wire106 & wire103) ?
                       $unsigned(wire103) : (~|wire106)))));
  assign wire109 = $unsigned(wire103);
  assign wire110 = wire103;
  assign wire111 = (|((wire110 >>> $unsigned($signed(wire104))) ?
                       $unsigned(wire105[(2'h2):(1'h0)]) : (!$unsigned($signed(wire107)))));
  assign wire112 = $signed((|$signed($unsigned({wire105, wire110}))));
  assign wire113 = (((!$signed(wire106)) > $signed(($unsigned(wire112) ~^ (!wire112)))) ?
                       wire110 : (~|($signed((wire103 < wire103)) ?
                           (+(wire106 >> wire107)) : {{wire108, wire106}})));
  assign wire114 = wire109;
  assign wire115 = $unsigned(((!$unsigned($unsigned(wire109))) >= wire107[(1'h1):(1'h0)]));
  assign wire116 = ($unsigned((wire108 <= wire110)) ?
                       $unsigned((wire107[(2'h3):(2'h3)] ?
                           wire107[(3'h4):(2'h3)] : (wire106[(4'h9):(2'h2)] ?
                               $signed(wire114) : wire109[(2'h2):(2'h2)]))) : (8'hbb));
  assign wire117 = {(($unsigned($unsigned(wire109)) + ((wire106 << (8'hba)) >= ((8'ha4) ^~ wire112))) || (wire105[(3'h6):(3'h6)] ?
                           wire105 : (~^$signed(wire103))))};
  assign wire118 = ((((wire117[(2'h2):(2'h2)] || $signed(wire103)) ?
                           ($unsigned(wire116) >>> (^~wire108)) : wire116) == $signed(wire114[(4'h8):(2'h3)])) ?
                       ($signed(((wire115 ? wire106 : (8'hbf)) ?
                               wire104 : (8'h9d))) ?
                           {(&(wire115 * (8'ha8)))} : (~^wire104[(1'h0):(1'h0)])) : $signed({wire113}));
  assign wire119 = (|wire118);
  assign wire120 = wire105;
  assign wire121 = wire112[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg122 <= (((($signed(wire104) ?
                  wire107[(2'h3):(2'h2)] : $signed(wire105)) ?
              {wire119, (wire119 != wire113)} : wire117[(1'h0):(1'h0)]) ?
          $unsigned($signed((~|wire113))) : $unsigned(((wire103 <<< wire116) >>> wire117[(2'h2):(2'h2)]))) > wire114[(4'hd):(4'ha)]);
      reg123 <= {wire121};
      reg124 <= $unsigned($signed(({(&wire105)} ?
          $unsigned($unsigned(wire105)) : $unsigned((wire121 ?
              reg122 : wire104)))));
      reg125 <= $unsigned(wire110[(1'h1):(1'h0)]);
      reg126 <= wire109[(1'h1):(1'h0)];
    end
  assign wire127 = (wire114 ?
                       wire107 : ((^$signed(wire109)) != ($signed($signed(wire112)) & $signed(wire107[(1'h0):(1'h0)]))));
  assign wire128 = (-(|($signed((^wire110)) & $unsigned(reg126[(1'h1):(1'h1)]))));
  assign wire129 = $unsigned($unsigned(wire104[(3'h7):(3'h7)]));
  assign wire130 = $unsigned({wire115[(2'h3):(2'h3)]});
endmodule

module module55  (y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire60;
  input wire signed [(2'h2):(1'h0)] wire59;
  input wire signed [(2'h3):(1'h0)] wire58;
  input wire [(5'h15):(1'h0)] wire57;
  input wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire70;
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
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
                 reg69,
                 reg68,
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
      reg61 <= (~^wire56);
      if (wire57)
        begin
          reg62 <= (wire56 ?
              ((&{$unsigned(wire56)}) ^~ {$unsigned({reg61})}) : wire59);
          reg63 <= (!wire59[(1'h0):(1'h0)]);
          if (reg61)
            begin
              reg64 <= (reg63[(3'h6):(1'h1)] ?
                  (+{$unsigned($signed((8'hb8)))}) : ($signed(($unsigned(wire59) ?
                      ((8'ha0) ?
                          reg63 : wire60) : ((8'hbb) > reg63))) + wire57));
              reg65 <= (wire59 != (wire60 ^ wire56));
            end
          else
            begin
              reg64 <= $unsigned((wire58 ?
                  (({reg65} ? (~|(7'h40)) : reg63) ?
                      $unsigned({(8'hb7)}) : $unsigned($unsigned((8'hba)))) : $signed(($signed(wire60) && (reg63 ?
                      wire59 : reg63)))));
              reg65 <= ({(+{(|(8'hb6))})} && (|$signed(wire58[(1'h0):(1'h0)])));
              reg66 <= {(~^wire56[(2'h3):(1'h0)])};
            end
          reg67 <= wire57;
          reg68 <= reg67;
        end
      else
        begin
          reg62 <= wire60[(3'h5):(1'h0)];
          reg63 <= reg62;
          reg64 <= ($signed(wire57[(4'hc):(4'hc)]) ?
              $signed(reg61) : reg66[(2'h3):(1'h1)]);
          reg65 <= $signed((wire59[(1'h1):(1'h0)] || ($unsigned($unsigned(wire58)) ?
              ($signed(wire56) ?
                  (reg68 ? reg61 : wire59) : {wire56,
                      reg63}) : $unsigned((reg62 ^ (8'hac))))));
          reg66 <= wire57;
        end
      reg69 <= wire59[(2'h2):(2'h2)];
    end
  assign wire70 = ((reg61 >>> {$unsigned(reg61[(3'h5):(2'h3)]),
                      ($unsigned((8'hab)) ?
                          (reg64 ?
                              reg67 : reg66) : reg62[(1'h0):(1'h0)])}) - $signed(((8'hb0) ?
                      $unsigned($unsigned(wire60)) : ($unsigned(wire58) < reg66))));
  assign wire71 = (wire60[(3'h6):(3'h4)] >> (reg63[(4'h9):(3'h4)] == (~$unsigned((^~reg66)))));
  assign wire72 = ((wire71 ?
                      reg61 : {wire58,
                          (!(~^(8'hbb)))}) <= $signed((^$signed(reg67))));
  assign wire73 = reg63[(1'h0):(1'h0)];
  assign wire74 = ((reg65[(4'hb):(4'hb)] && $signed($signed((reg64 >= wire58)))) ?
                      ((wire57 ?
                          (wire58[(1'h1):(1'h1)] ^ wire56[(1'h1):(1'h1)]) : wire59) <<< $unsigned(($unsigned(wire59) ~^ wire71))) : wire71[(4'ha):(3'h5)]);
  assign wire75 = wire72[(3'h4):(2'h3)];
  assign wire76 = wire60[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      reg77 <= {reg66[(1'h1):(1'h1)]};
      if ((~(^reg68[(1'h0):(1'h0)])))
        begin
          reg78 <= $unsigned($unsigned(wire73[(3'h5):(1'h0)]));
          if ({(8'had)})
            begin
              reg79 <= $signed((^~reg62));
            end
          else
            begin
              reg79 <= wire58;
              reg80 <= (~&(-wire58[(2'h3):(2'h2)]));
              reg81 <= reg63[(3'h5):(3'h4)];
            end
        end
      else
        begin
          if (((!$signed(($unsigned(reg62) <= $unsigned((8'had))))) ?
              reg65[(4'ha):(4'h9)] : wire59[(1'h0):(1'h0)]))
            begin
              reg78 <= ($signed(reg62) ?
                  ((+reg66[(2'h2):(1'h0)]) ?
                      reg63[(2'h3):(1'h1)] : {$unsigned(reg66),
                          $signed(reg63[(1'h0):(1'h0)])}) : ((~^reg62) ?
                      reg62[(2'h3):(2'h3)] : wire76));
              reg79 <= (~&reg78);
              reg80 <= wire60;
              reg81 <= wire57;
              reg82 <= (wire60 ?
                  $unsigned($signed(reg79)) : {({((8'ha9) >= reg65),
                          (reg65 ? wire72 : wire70)} ^ ((&reg68) > (reg77 ?
                          reg81 : (8'hbb))))});
            end
          else
            begin
              reg78 <= reg80;
            end
          reg83 <= reg66[(2'h3):(2'h3)];
          if ($unsigned(({{((8'hb3) <= wire58), ((8'had) ? reg77 : wire74)}} ?
              ((&wire59) ?
                  $unsigned((~(8'ha9))) : ($signed(wire56) ?
                      (+reg81) : wire75[(1'h1):(1'h1)])) : (!reg77[(2'h2):(1'h0)]))))
            begin
              reg84 <= $signed(reg66);
            end
          else
            begin
              reg84 <= ($signed(((~(reg82 >> wire58)) ?
                      $unsigned((wire72 ? wire58 : reg61)) : $signed(wire74))) ?
                  {reg64[(2'h2):(2'h2)],
                      $unsigned($signed($unsigned(reg61)))} : wire73[(3'h5):(3'h4)]);
              reg85 <= (&(^~(+$signed(reg82[(3'h7):(3'h5)]))));
              reg86 <= reg67;
              reg87 <= ((~((((8'ha1) ?
                      (8'hac) : reg82) << {wire72}) >= wire76[(1'h0):(1'h0)])) ?
                  ($unsigned($signed((reg63 | reg65))) ?
                      $unsigned(((7'h43) <<< $unsigned((8'ha6)))) : wire59[(1'h0):(1'h0)]) : $signed(($unsigned($signed(reg69)) ?
                      {(wire56 ?
                              reg64 : reg69)} : $signed(wire76[(4'h8):(3'h5)]))));
              reg88 <= reg86;
            end
        end
      reg89 <= ((^$signed(reg80)) ?
          {wire56[(1'h0):(1'h0)],
              ($signed($signed(reg68)) ?
                  (+(reg61 ?
                      reg68 : wire57)) : reg88)} : (~|($signed($signed(wire72)) | ((reg69 != reg83) + $signed(reg65)))));
      reg90 <= ((((((8'hb4) <= wire75) ?
          ((8'hbc) | (8'ha5)) : reg88) <= $unsigned((~^(8'ha3)))) ~^ ($signed((+wire57)) ?
          (reg63[(2'h2):(1'h1)] ?
              (wire57 ? (8'hb4) : wire70) : reg81) : ((reg61 >> (8'hb1)) ?
              ((8'hab) ?
                  reg87 : (8'hba)) : (+(7'h40))))) != (reg68[(1'h1):(1'h1)] >> (&(reg89[(1'h1):(1'h1)] ?
          (reg64 ? wire60 : wire57) : {reg83}))));
      reg91 <= $signed({$signed((reg83 ? (reg79 <= wire72) : $signed(reg88))),
          $signed((wire57 <<< $signed(reg87)))});
    end
  assign wire92 = (8'ha7);
  assign wire93 = $signed((((^{reg88, wire75}) ?
                          $unsigned(((8'hbb) + reg77)) : reg62[(2'h2):(1'h0)]) ?
                      ((^{reg84,
                          reg61}) ^~ $signed($unsigned(reg91))) : (~((8'hb3) ?
                          (8'hbb) : (+(8'hb9))))));
endmodule

module module12
#(parameter param52 = (({({(8'h9f)} ? (-(8'hb0)) : (^~(8'hb9))), ((8'hb3) ? ((8'ha5) ? (8'had) : (8'ha4)) : (-(8'hb8)))} ^ (^(8'h9f))) - (((((8'hba) ? (8'ha3) : (8'haa)) ? ((8'hbe) > (8'haf)) : ((8'ha1) ? (8'hb2) : (8'had))) ? ({(8'hae), (8'hb9)} ? ((8'hae) ? (8'had) : (7'h40)) : ((8'hb0) ? (8'h9e) : (8'haa))) : (((8'ha0) ? (8'haa) : (8'ha1)) && ((8'hb5) ? (8'hb0) : (8'ha3)))) ? ((^~((8'hb0) ? (8'hb3) : (8'hb1))) ^ (((8'hb5) ? (8'ha7) : (8'haa)) ? ((8'ha5) ? (8'ha6) : (8'had)) : (-(8'ha4)))) : ({{(8'had)}, ((8'hac) <<< (8'hb8))} ? {((8'hbe) << (8'h9e)), {(8'hab)}} : {(|(8'ha1)), {(8'hb5)}}))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  assign y = {wire51,
                 wire49,
                 wire48,
                 wire38,
                 wire29,
                 wire28,
                 wire27,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg50,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire17 = (^~(^$signed((+$signed(wire16)))));
  assign wire18 = (~^{((&(wire17 ? wire15 : wire16)) ?
                          $unsigned(wire14[(3'h4):(1'h1)]) : (|{wire15,
                              wire16})),
                      (((wire17 ?
                          wire17 : wire13) < wire17[(1'h0):(1'h0)]) >= ($unsigned(wire15) || (wire16 <= wire14)))});
  assign wire19 = wire14[(4'hd):(4'ha)];
  assign wire20 = $unsigned((($unsigned($signed(wire15)) ?
                          wire15[(3'h4):(2'h2)] : ($unsigned(wire16) ~^ (8'hb2))) ?
                      $signed((~^wire13[(4'hc):(4'hc)])) : wire15));
  assign wire21 = $signed(((^(-$signed(wire17))) != $signed({((8'hbe) ^~ (8'hb1))})));
  always
    @(posedge clk) begin
      if ($signed($signed({wire21[(2'h2):(1'h1)]})))
        begin
          reg22 <= $unsigned((wire19[(5'h10):(3'h7)] & {{(wire15 ^ (8'ha6))}}));
          reg23 <= (wire17 || {{$signed((wire15 >> wire17)),
                  (~$unsigned(wire19))}});
          reg24 <= $signed(((|((wire21 ?
              wire20 : wire18) || wire20)) | ({((8'ha3) ? wire21 : wire18),
              (wire13 ? wire20 : wire16)} - $signed($signed(wire13)))));
          reg25 <= $signed($signed((~^$unsigned(wire15[(3'h4):(1'h0)]))));
        end
      else
        begin
          reg22 <= $signed($unsigned(((~wire20[(1'h0):(1'h0)]) <<< $unsigned(wire17))));
          reg23 <= (^((($unsigned(wire19) ?
                      $signed(wire18) : $unsigned(wire21)) ?
                  $unsigned($signed((8'ha9))) : wire14[(4'h8):(3'h6)]) ?
              (!((wire21 && wire18) | $unsigned(wire19))) : $unsigned(((wire19 ?
                  (8'hb2) : reg22) != (&reg23)))));
          reg24 <= ($signed(wire13) ?
              ($signed((|$signed(wire16))) ?
                  wire17[(2'h3):(2'h3)] : reg22[(4'hb):(2'h2)]) : ($signed($unsigned((~|wire16))) - (reg25[(1'h0):(1'h0)] - {wire19,
                  reg23[(3'h4):(2'h2)]})));
          reg25 <= wire14;
          reg26 <= {(~^($unsigned((reg23 ?
                  (8'had) : wire18)) & wire14[(1'h0):(1'h0)])),
              $signed($unsigned(wire20))};
        end
    end
  assign wire27 = wire15[(3'h5):(1'h0)];
  assign wire28 = $signed(wire13[(4'h8):(2'h3)]);
  assign wire29 = (wire16 + (~^$unsigned($unsigned(reg26))));
  always
    @(posedge clk) begin
      reg30 <= $signed({wire17[(1'h1):(1'h0)]});
      if ((wire14[(5'h10):(4'hc)] ?
          wire16[(1'h0):(1'h0)] : $unsigned({((wire29 < wire15) != wire14),
              (wire16 >> reg30)})))
        begin
          reg31 <= $signed((8'ha2));
        end
      else
        begin
          if (wire27[(3'h4):(2'h2)])
            begin
              reg31 <= $signed($unsigned({(~^$signed(wire18))}));
              reg32 <= wire28[(3'h7):(1'h1)];
            end
          else
            begin
              reg31 <= ($signed(((reg31 ? $unsigned(wire14) : wire21) ?
                      reg22 : wire15[(2'h3):(2'h2)])) ?
                  (~wire21[(1'h1):(1'h1)]) : {wire14[(3'h4):(2'h2)]});
              reg32 <= (+((reg22[(4'h9):(3'h5)] ?
                  {(wire16 ? wire17 : wire19)} : (wire28 ?
                      (~reg23) : reg26[(2'h2):(1'h1)])) == wire15));
              reg33 <= $unsigned((8'hbb));
              reg34 <= $signed(((~^(~(wire29 > (8'had)))) ?
                  ((+$signed(wire20)) <= $signed((wire17 ?
                      reg22 : (8'ha2)))) : $unsigned(reg24[(3'h5):(1'h0)])));
            end
          reg35 <= wire17[(1'h0):(1'h0)];
          reg36 <= $signed((&$unsigned((wire28[(4'h8):(1'h1)] ?
              reg32 : $signed((7'h40))))));
        end
      reg37 <= ((($signed((wire21 >>> wire17)) ?
          (|$unsigned((8'ha5))) : (&{reg32,
              reg35})) + $signed((&(reg24 <<< reg26)))) << ((^(~^(&reg26))) ?
          (reg33 > (reg36 << (-reg36))) : $unsigned($signed($unsigned(reg35)))));
    end
  assign wire38 = $unsigned(($signed(wire27[(5'h13):(4'hf)]) <= $signed(reg26)));
  always
    @(posedge clk) begin
      reg39 <= $unsigned({(8'ha6)});
      if ($signed((&wire20)))
        begin
          reg40 <= $signed((~&wire29));
          reg41 <= ((reg33[(2'h3):(2'h2)] >= $unsigned((wire15 ?
              (reg36 - reg22) : (reg39 ? reg39 : reg36)))) & ((+wire27) ?
              reg39 : (~|(8'hbb))));
          reg42 <= $unsigned($signed($unsigned((reg26 << {wire17}))));
          reg43 <= $signed(($signed((~^{reg22})) ?
              (wire19[(2'h3):(1'h1)] == (wire27[(5'h12):(5'h11)] ?
                  (reg30 < (8'hac)) : wire18)) : wire16[(4'ha):(2'h2)]));
          if (($unsigned({$signed({wire21, (8'had)}),
              $unsigned(wire27[(4'h9):(2'h2)])}) * $unsigned(reg30[(1'h0):(1'h0)])))
            begin
              reg44 <= reg37;
              reg45 <= reg35[(3'h7):(1'h1)];
              reg46 <= (wire14 == reg31[(5'h12):(5'h12)]);
            end
          else
            begin
              reg44 <= wire28;
              reg45 <= (!$signed(($signed(reg44) ?
                  reg45 : ($unsigned(reg40) <<< wire15))));
              reg46 <= (8'had);
            end
        end
      else
        begin
          reg40 <= (reg39[(2'h2):(1'h0)] || wire38);
          reg41 <= {$unsigned((&(reg33[(1'h1):(1'h1)] * reg41)))};
          reg42 <= $signed($unsigned(reg44));
        end
      reg47 <= $unsigned({reg43[(2'h2):(1'h1)],
          (+({(8'hbb)} ^~ $signed(reg37)))});
    end
  assign wire48 = $unsigned($unsigned(wire28));
  assign wire49 = wire15[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg50 <= reg33;
    end
  assign wire51 = reg46[(2'h2):(1'h1)];
endmodule
