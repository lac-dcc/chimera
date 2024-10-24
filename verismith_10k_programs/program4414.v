module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire163;
  wire [(4'hc):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire signed [(3'h7):(1'h0)] wire160;
  wire [(2'h3):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire157;
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire4,
                 wire6,
                 wire157,
                 reg5,
                 (1'h0)};
  assign wire4 = wire3[(4'hd):(3'h4)];
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire0[(4'ha):(1'h0)]);
    end
  assign wire6 = ((+(wire2 <<< (~&wire3[(4'hc):(4'h9)]))) ?
                     (~(wire0 * wire4)) : ($signed(wire0[(1'h1):(1'h0)]) ?
                         (8'ha5) : (wire2 <<< (8'ha4))));
  module7 #() modinst158 (.wire11(wire3), .wire9(wire1), .wire10(wire4), .wire8(wire0), .wire12(wire6), .clk(clk), .y(wire157));
  assign wire159 = (^~(^~(~&(-(~|wire157)))));
  assign wire160 = $signed(reg5[(1'h0):(1'h0)]);
  assign wire161 = $unsigned((~|(((8'ha5) ? wire157 : (wire1 < reg5)) ?
                       ((wire3 != wire157) ?
                           wire3 : wire3[(4'hf):(2'h2)]) : $unsigned(wire157[(3'h6):(1'h0)]))));
  assign wire162 = (wire157 ?
                       (~(^((wire6 ? wire6 : wire161) ?
                           wire2[(2'h2):(1'h0)] : {wire159}))) : wire2);
  assign wire163 = {wire4[(4'hb):(4'hb)],
                       {(^($unsigned(wire162) ?
                               wire159[(1'h1):(1'h0)] : {wire162}))}};
endmodule

module module7
#(parameter param155 = ((({{(8'ha8)}, ((7'h42) ? (7'h41) : (7'h44))} ^~ {(&(7'h40)), ((8'h9e) + (8'hac))}) ? (^(!((8'ha3) == (8'hbc)))) : (+((8'ha0) == ((8'h9f) ? (8'ha6) : (8'hb8))))) << (^{(+{(7'h40)}), {((8'hb2) ^~ (8'hb4)), (^(8'hac))}})), 
parameter param156 = (((((param155 >= param155) ? {param155} : (param155 | (8'h9f))) ? (!(~param155)) : param155) ? ((((7'h43) > param155) ? ((8'hb8) * param155) : (param155 ? param155 : param155)) ? (-(param155 && (8'hb4))) : {(param155 ? (8'hbf) : param155)}) : {(8'hb4), {(+param155), (8'h9f)}}) ^~ {(((8'hb1) ? (8'hac) : (param155 * (8'hb8))) + ((param155 >> param155) ? param155 : {param155, (7'h42)})), (~^((8'hac) > param155))}))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire152;
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  assign y = {wire154,
                 wire74,
                 wire76,
                 wire77,
                 wire78,
                 wire120,
                 wire122,
                 wire125,
                 wire126,
                 wire152,
                 reg124,
                 reg123,
                 reg79,
                 (1'h0)};
  module13 #() modinst75 (.wire16(wire9), .wire14(wire11), .wire17(wire8), .clk(clk), .y(wire74), .wire15(wire12));
  assign wire76 = $signed(wire74);
  assign wire77 = $unsigned(wire8);
  assign wire78 = wire10;
  always
    @(posedge clk) begin
      reg79 <= ($signed($unsigned(({(8'hbf),
          wire77} ^ wire10))) >= (wire78[(2'h3):(2'h3)] ?
          (+wire78[(3'h4):(2'h3)]) : wire78));
    end
  module80 #() modinst121 (.wire81(reg79), .wire85(wire11), .clk(clk), .y(wire120), .wire83(wire10), .wire82(wire8), .wire84(wire74));
  assign wire122 = {wire120};
  always
    @(posedge clk) begin
      reg123 <= wire12[(2'h3):(2'h3)];
      reg124 <= (~|$signed((8'hab)));
    end
  assign wire125 = {(((~(wire76 ? wire78 : wire76)) && wire10[(3'h6):(1'h0)]) ?
                           ({wire11[(4'hb):(1'h0)],
                               wire122} || ($signed(wire77) <= (~&wire11))) : {wire120})};
  assign wire126 = ((8'hb7) ?
                       {($signed(wire78[(3'h7):(3'h4)]) ?
                               $signed((wire125 ?
                                   wire77 : reg124)) : (((8'hb1) ?
                                   wire10 : reg124) >>> (^wire125)))} : reg79[(2'h3):(1'h0)]);
  module127 #() modinst153 (wire152, clk, reg124, wire126, wire122, wire125, reg79);
  assign wire154 = (wire76[(4'hd):(3'h4)] + (8'h9d));
endmodule

module module127  (y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire132;
  input wire signed [(5'h15):(1'h0)] wire131;
  input wire [(3'h5):(1'h0)] wire130;
  input wire signed [(4'hf):(1'h0)] wire129;
  input wire [(4'hd):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire149;
  wire [(5'h10):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire147;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(3'h4):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire139;
  wire [(4'hb):(1'h0)] wire138;
  wire [(3'h7):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire133;
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire133 = $unsigned(wire130);
  assign wire134 = wire129;
  assign wire135 = wire130;
  assign wire136 = (($signed((-(wire134 ^~ wire134))) ?
                           {wire135,
                               wire129} : $unsigned($signed($unsigned(wire131)))) ?
                       wire129[(3'h6):(2'h2)] : $signed($signed(wire131)));
  assign wire137 = (+wire132[(4'h8):(2'h2)]);
  assign wire138 = wire137;
  assign wire139 = (((wire136 * $signed(wire130)) ?
                           $unsigned($unsigned(wire137)) : (wire130[(1'h0):(1'h0)] && (^~$signed(wire137)))) ?
                       (wire132[(1'h0):(1'h0)] << $unsigned(wire130)) : $signed((wire137 >= $signed((wire132 ?
                           wire129 : wire131)))));
  assign wire140 = (-$signed($unsigned($signed((wire138 ?
                       wire136 : wire139)))));
  assign wire141 = $signed($signed(wire139[(3'h7):(3'h4)]));
  always
    @(posedge clk) begin
      reg142 <= wire130;
      reg143 <= (reg142[(3'h6):(2'h3)] >> (wire134[(1'h1):(1'h1)] ^ wire141));
      reg144 <= (+wire138);
      reg145 <= $unsigned(({({wire130,
              wire141} > wire132[(3'h6):(3'h6)])} > reg142));
      reg146 <= ((|{$unsigned((wire138 ? reg143 : wire141)),
          reg144[(3'h6):(1'h1)]}) <<< (+$unsigned({wire131[(4'ha):(4'h9)]})));
    end
  assign wire147 = $unsigned($signed(wire138[(3'h4):(3'h4)]));
  assign wire148 = ((((8'ha0) ? {{wire133}} : $signed(((8'ha2) ^ wire133))) ?
                           (((wire128 ?
                               (8'hb6) : wire140) ~^ wire131) >>> reg145) : {$unsigned($signed(wire147))}) ?
                       {$signed(wire138[(4'ha):(2'h2)]),
                           (wire134[(4'he):(4'hc)] || reg144)} : wire147[(4'h8):(2'h3)]);
  assign wire149 = reg144;
  assign wire150 = (8'hbc);
  assign wire151 = ($signed($unsigned(($unsigned(wire134) & (wire147 ?
                           wire147 : wire149)))) ?
                       $unsigned(wire150[(4'h9):(3'h6)]) : ((~^$unsigned($unsigned(wire129))) ?
                           $unsigned((reg143[(4'he):(4'hd)] ?
                               (wire150 ?
                                   wire137 : wire134) : (7'h44))) : wire130[(2'h3):(1'h0)]));
endmodule

module module80
#(parameter param118 = {(7'h43)}, 
parameter param119 = param118)
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire85;
  input wire signed [(4'hb):(1'h0)] wire84;
  input wire signed [(4'hc):(1'h0)] wire83;
  input wire [(5'h13):(1'h0)] wire82;
  input wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire103;
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg102,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((((((8'hb3) ? wire81 : wire82) == wire84) ?
              {wire83} : ($unsigned(wire81) - $signed((7'h42)))) ?
          (8'ha2) : (!{$unsigned(wire85)}))))
        begin
          reg86 <= (wire85 ^ $signed(((wire81[(4'hb):(3'h5)] << $signed(wire81)) ?
              ((wire81 <= wire85) ?
                  wire84 : wire82[(5'h13):(5'h10)]) : (wire82[(4'hf):(1'h0)] ?
                  $unsigned(wire85) : wire84))));
          reg87 <= wire81;
          reg88 <= wire84;
          reg89 <= ($unsigned(({(reg88 ? (8'hb5) : reg86),
                  (7'h40)} == ((reg87 && reg86) ?
                  (wire82 ? wire81 : wire85) : (reg86 ? reg86 : wire81)))) ?
              $signed($signed((wire83 ?
                  $unsigned(wire83) : $signed(wire84)))) : reg86[(3'h4):(1'h1)]);
          reg90 <= $unsigned($unsigned(($unsigned((&reg87)) << wire81[(3'h4):(2'h2)])));
        end
      else
        begin
          reg86 <= (8'h9d);
          reg87 <= ((($unsigned($signed(wire84)) > wire85[(4'hf):(2'h3)]) ?
              (!($unsigned(reg87) ?
                  (~&(8'hb6)) : ((8'hab) ?
                      wire81 : reg89))) : ($signed($signed((8'ha5))) ?
                  (|{wire85}) : wire84)) || wire82[(2'h2):(1'h0)]);
          if ((({$signed(wire85), reg88[(4'ha):(3'h7)]} ?
                  (!$signed((wire82 ? wire85 : reg88))) : $unsigned(reg88)) ?
              wire85 : $signed(wire82[(4'h8):(2'h3)])))
            begin
              reg88 <= (!reg88);
              reg89 <= $unsigned((!{wire83[(3'h7):(3'h5)],
                  $unsigned((wire81 ? wire82 : reg89))}));
              reg90 <= reg87[(3'h4):(2'h3)];
              reg91 <= (&$unsigned((((wire81 ? reg86 : reg89) & (wire85 ?
                  (7'h44) : wire85)) >= reg87)));
              reg92 <= $unsigned($signed(wire85));
            end
          else
            begin
              reg88 <= ({wire81, (&(reg90 ? $unsigned(reg92) : reg89))} ?
                  $signed((($unsigned((8'hac)) ? (~reg86) : (&wire81)) ?
                      $signed($signed(wire84)) : $unsigned((reg88 ?
                          wire82 : reg92)))) : (!(~&wire82[(3'h4):(2'h2)])));
              reg89 <= (8'hbe);
            end
          reg93 <= reg92[(5'h10):(1'h1)];
        end
      if ($signed((~|$signed(((reg90 != (8'ha4)) ? {reg87} : (8'ha2))))))
        begin
          reg94 <= (~|(reg87[(3'h6):(3'h5)] ?
              $unsigned((+{wire84, reg93})) : $signed($signed(reg86))));
          if (reg93)
            begin
              reg95 <= {reg93[(3'h7):(1'h1)]};
              reg96 <= {reg88};
              reg97 <= (~((8'ha6) | $signed((wire84[(2'h2):(1'h0)] ?
                  (~&wire84) : ((8'hbf) ? reg95 : reg94)))));
            end
          else
            begin
              reg95 <= reg87;
              reg96 <= reg94[(2'h2):(2'h2)];
              reg97 <= ((-({$unsigned(reg91)} ?
                      ((8'haa) ~^ reg87) : {(reg93 ? (8'h9f) : reg96),
                          $unsigned(wire82)})) ?
                  ({(reg90 ?
                          $unsigned((8'hac)) : $unsigned(reg89))} ~^ wire85[(4'hf):(2'h3)]) : reg96);
              reg98 <= $signed(reg97[(1'h0):(1'h0)]);
            end
          reg99 <= ({(!$signed(reg91)),
                  ((!(wire85 > reg86)) - reg92[(2'h2):(1'h1)])} ?
              wire85[(4'hd):(4'ha)] : (~&$signed((8'ha3))));
          reg100 <= (reg95[(1'h1):(1'h0)] >> $unsigned(($unsigned((^~reg90)) | (8'haf))));
          reg101 <= (reg93 ? $unsigned((|(&(|wire81)))) : (|(!(8'hbd))));
        end
      else
        begin
          reg94 <= wire83;
          if (reg96)
            begin
              reg95 <= $unsigned(((~&((8'ha8) || $unsigned(reg101))) <= wire83[(4'ha):(3'h6)]));
              reg96 <= reg88[(3'h5):(3'h5)];
            end
          else
            begin
              reg95 <= reg87;
            end
          reg97 <= (~^reg87[(3'h4):(3'h4)]);
          reg98 <= $unsigned(wire84[(2'h3):(2'h2)]);
        end
      reg102 <= (&$unsigned(wire82));
    end
  assign wire103 = $unsigned($unsigned(reg92));
  assign wire104 = (~^reg98[(3'h5):(3'h4)]);
  assign wire105 = {wire104[(3'h6):(2'h2)]};
  assign wire106 = (8'ha6);
  always
    @(posedge clk) begin
      reg107 <= $signed(($signed((!(reg90 > reg92))) ^~ ($signed($signed(reg102)) ?
          $signed(reg92) : (reg88 <= (reg99 <<< wire103)))));
      reg108 <= reg96;
      if ($signed($signed(reg97)))
        begin
          reg109 <= $unsigned(reg99);
        end
      else
        begin
          reg109 <= (reg87 ^ ($signed($signed({(8'hb5),
              reg89})) < $signed(reg89[(1'h1):(1'h0)])));
          if (((reg88 ?
                  (reg99[(1'h0):(1'h0)] ?
                      reg89[(1'h0):(1'h0)] : $signed((!reg95))) : wire103) ?
              reg95 : (~|reg92)))
            begin
              reg110 <= reg93[(3'h4):(2'h3)];
              reg111 <= (wire81[(4'h8):(3'h7)] ?
                  reg91[(4'he):(3'h6)] : ((^(reg109 - (wire84 + wire104))) ?
                      wire103[(2'h3):(2'h3)] : (&wire81[(3'h7):(3'h4)])));
              reg112 <= {(7'h44), wire82[(3'h6):(3'h4)]};
            end
          else
            begin
              reg110 <= {reg101};
              reg111 <= $signed($unsigned(reg100[(3'h4):(2'h3)]));
            end
        end
      reg113 <= (|$unsigned($signed(wire106[(2'h3):(2'h2)])));
      reg114 <= reg91;
    end
  assign wire115 = {reg100, reg111};
  assign wire116 = ((((^(reg112 - reg93)) ~^ ((wire106 == wire115) >>> (reg102 ?
                       reg86 : reg107))) ^~ (wire82 ?
                       wire104[(4'h8):(2'h2)] : (~{reg109,
                           reg91}))) ^~ $signed(reg96));
  assign wire117 = (+$unsigned($unsigned((^~$signed(reg88)))));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h25f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire28;
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  assign y = {wire72,
                 wire56,
                 wire55,
                 wire54,
                 wire41,
                 wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire28,
                 reg73,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg39,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= $signed($unsigned((wire16 || (((8'ha4) < wire17) < {wire16}))));
      if ((~|$unsigned((^{$unsigned((8'hbd))}))))
        begin
          reg19 <= $unsigned(($signed($signed($signed(reg18))) ^~ $unsigned((8'haf))));
        end
      else
        begin
          if ($signed(wire14))
            begin
              reg19 <= wire14;
              reg20 <= ($unsigned(reg18[(4'h9):(3'h7)]) + (reg18 ?
                  ($unsigned((reg19 ? (8'hb3) : wire16)) * ($signed(wire15) ?
                      (!wire17) : (wire15 ?
                          wire14 : wire16))) : $unsigned({(~reg19)})));
              reg21 <= (&($signed(((wire15 ~^ reg20) << reg20[(4'he):(4'hd)])) == {wire16[(4'h9):(4'h8)],
                  reg19}));
              reg22 <= reg18;
              reg23 <= $signed(($signed(($unsigned(reg19) ?
                  (reg22 ~^ (8'had)) : (wire14 ?
                      (8'hac) : wire16))) ^~ $signed(reg20[(3'h6):(2'h2)])));
            end
          else
            begin
              reg19 <= (8'hb0);
            end
          reg24 <= (^(~&(wire16 ?
              ({reg20, wire17} & $unsigned(reg18)) : {(wire17 ^~ wire15),
                  $signed(wire14)})));
        end
      reg25 <= ((~|(wire17[(2'h3):(2'h2)] ?
          $unsigned((reg21 ?
              reg22 : reg22)) : wire17[(2'h3):(2'h3)])) ^ wire16[(4'he):(4'hb)]);
      reg26 <= reg22;
      reg27 <= $unsigned(reg18[(4'h8):(2'h2)]);
    end
  assign wire28 = (8'haa);
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg29 <= $signed(reg19);
        end
      else
        begin
          reg29 <= {reg18[(4'h8):(4'h8)], wire16};
          reg30 <= $unsigned({wire17, reg23});
          reg31 <= (|reg30[(4'h8):(1'h0)]);
        end
      reg32 <= wire16;
    end
  assign wire33 = reg23;
  assign wire34 = reg23;
  assign wire35 = ($signed((-$unsigned((|reg18)))) <= wire33[(2'h2):(2'h2)]);
  assign wire36 = reg25[(3'h6):(3'h4)];
  assign wire37 = ({{wire36}} ? (^~reg32) : wire33);
  assign wire38 = $unsigned($signed(((|{reg30}) - reg27)));
  always
    @(posedge clk) begin
      reg39 <= {$signed((((7'h44) ? wire15 : (wire35 > wire36)) ?
              {wire38[(1'h0):(1'h0)]} : $unsigned((reg23 - reg24))))};
    end
  assign wire40 = (8'ha7);
  assign wire41 = $unsigned($unsigned((!((reg24 >> reg26) ?
                      (reg30 ? reg25 : reg21) : $unsigned(reg26)))));
  always
    @(posedge clk) begin
      reg42 <= ({reg19[(1'h0):(1'h0)], {$unsigned(wire14[(4'hb):(4'hb)])}} ?
          $unsigned({({(8'haf)} <= (8'hac))}) : (8'haa));
      if ($unsigned($unsigned($unsigned((8'haa)))))
        begin
          reg43 <= $unsigned($signed((!(wire34[(5'h11):(4'hb)] | reg31))));
          reg44 <= reg19;
          reg45 <= $unsigned($unsigned(reg43[(3'h5):(1'h1)]));
        end
      else
        begin
          reg43 <= reg39[(2'h3):(2'h2)];
          reg44 <= $unsigned(wire28);
          reg45 <= (reg31[(4'ha):(2'h2)] ?
              ($unsigned(($signed(wire40) ?
                  (wire35 != wire40) : (~(8'h9c)))) ^~ (~|((wire17 == reg29) ?
                  $signed((8'ha4)) : reg44[(1'h1):(1'h0)]))) : wire15[(2'h2):(1'h1)]);
          if ($unsigned($signed((~&((reg24 ^ (8'hb5)) ?
              ((8'hab) > wire14) : wire36[(2'h2):(2'h2)])))))
            begin
              reg46 <= $unsigned((reg45[(5'h10):(4'hc)] >> reg31[(1'h1):(1'h1)]));
              reg47 <= (wire38 >>> reg21[(4'h8):(2'h3)]);
              reg48 <= reg24;
              reg49 <= $unsigned((^(~({wire35, (7'h44)} ?
                  {reg32, reg42} : (reg26 > (8'h9c))))));
              reg50 <= wire17[(3'h4):(1'h0)];
            end
          else
            begin
              reg46 <= ($unsigned(($unsigned($signed((8'hbc))) ^~ {reg44[(3'h6):(3'h6)]})) ?
                  wire16[(1'h1):(1'h1)] : ((8'ha6) ?
                      ({reg47, (reg44 ? reg20 : reg22)} ?
                          ((~reg20) == $unsigned(wire14)) : reg45[(2'h3):(1'h1)]) : $unsigned(($unsigned(reg45) ?
                          {reg30, reg45} : wire37[(3'h7):(1'h0)]))));
            end
          if (reg23)
            begin
              reg51 <= wire37;
            end
          else
            begin
              reg51 <= $signed((wire37 ?
                  ($signed((!wire40)) == ((reg21 ? reg49 : wire37) ?
                      (reg20 ?
                          (8'hb3) : (8'h9c)) : (wire41 * wire14))) : {((reg32 <<< reg48) != $signed(reg44))}));
              reg52 <= $unsigned($signed((($unsigned(reg30) << $unsigned(wire28)) ?
                  $signed(((8'hba) ? reg43 : wire35)) : $signed(reg21))));
              reg53 <= {{{reg46}}, $unsigned($signed(wire38))};
            end
        end
    end
  assign wire54 = reg47;
  assign wire55 = $signed(((|$signed($signed(reg43))) ?
                      reg19[(2'h2):(1'h1)] : ({(-wire16)} ?
                          wire40 : (~&(reg48 * reg53)))));
  assign wire56 = $unsigned({$signed(reg29), (8'ha6)});
  always
    @(posedge clk) begin
      if ($signed((~^reg21[(2'h2):(1'h0)])))
        begin
          if (wire34)
            begin
              reg57 <= (+$unsigned($unsigned(wire28[(3'h4):(1'h1)])));
              reg58 <= $unsigned(reg51);
              reg59 <= wire35[(2'h3):(1'h1)];
              reg60 <= (8'h9c);
              reg61 <= (((((reg18 | wire37) <<< $signed(wire17)) ?
                      {(~^reg25),
                          (wire40 ?
                              reg45 : (8'hb3))} : {$signed(wire34)}) != (8'hbd)) ?
                  $signed($signed($unsigned(reg52[(4'hc):(1'h0)]))) : reg50[(2'h3):(2'h2)]);
            end
          else
            begin
              reg57 <= ({$unsigned(reg22), wire35[(3'h6):(1'h1)]} == {wire28});
              reg58 <= (-(&($signed($signed(reg61)) ?
                  ((-(8'ha3)) >= {(8'hb2), wire41}) : $signed((wire28 ?
                      wire36 : reg39)))));
              reg59 <= $signed(((wire14 ?
                  (wire55 ? $unsigned(wire17) : (reg20 <= (8'hb9))) : (|(reg61 ?
                      wire41 : reg44))) >>> reg50));
              reg60 <= {{$unsigned(((reg50 | reg22) == reg50))},
                  ((8'hb5) ?
                      ((reg39[(1'h0):(1'h0)] - (+reg20)) ?
                          $unsigned((|reg29)) : (|(wire56 == wire55))) : (wire56 ?
                          wire41 : $signed({reg31})))};
            end
          reg62 <= reg43[(4'ha):(3'h6)];
          if ($signed((^wire40)))
            begin
              reg63 <= (wire34[(4'hc):(4'h8)] ?
                  (~^((reg26[(4'h9):(2'h2)] <<< $signed(wire37)) ?
                      $signed(((8'hb8) ?
                          wire56 : reg61)) : reg49[(2'h2):(1'h1)])) : reg46);
              reg64 <= reg53;
            end
          else
            begin
              reg63 <= reg25;
              reg64 <= (($unsigned(reg49) ^~ $signed(reg50)) ?
                  (((wire36[(3'h5):(1'h0)] & $unsigned(wire28)) ?
                          (reg18[(2'h3):(2'h2)] ?
                              reg53 : $unsigned(reg61)) : wire38[(1'h0):(1'h0)]) ?
                      reg24[(4'hd):(4'hc)] : reg27[(2'h2):(2'h2)]) : ($signed($signed((~^wire38))) ?
                      $unsigned(((wire16 ?
                          (8'hae) : reg26) & $unsigned(reg19))) : (~|($signed(reg50) ?
                          {reg30} : reg46))));
              reg65 <= ((reg58[(4'he):(4'ha)] ?
                  (8'hbf) : (reg26 > reg59[(3'h7):(2'h2)])) - (!((reg45[(1'h1):(1'h1)] <= {reg52}) ?
                  {reg44[(1'h1):(1'h1)], reg45[(1'h1):(1'h0)]} : wire15)));
              reg66 <= reg23[(1'h0):(1'h0)];
              reg67 <= $signed($unsigned(($signed({reg64}) ?
                  $unsigned({reg52}) : $unsigned(reg23))));
            end
          reg68 <= reg27[(2'h2):(1'h1)];
          reg69 <= $signed((((~&(wire33 ^~ reg53)) >= {{reg24,
                  (8'haf)}}) << (^~$unsigned(reg31[(4'ha):(4'h9)]))));
        end
      else
        begin
          reg57 <= ($signed((($signed(reg44) ?
                  wire54[(2'h3):(2'h2)] : reg67) || (reg57[(2'h2):(2'h2)] ?
                  $unsigned(reg58) : reg58[(3'h6):(3'h4)]))) ?
              reg50[(3'h5):(1'h0)] : ($unsigned((|wire40[(1'h0):(1'h0)])) >> reg42));
          if ($signed(($unsigned((reg69 >> (reg26 ? reg43 : reg45))) ?
              {((reg21 ? wire35 : (7'h44)) + (+reg46))} : (^~$unsigned((reg26 ?
                  (7'h43) : reg32))))))
            begin
              reg58 <= (~&{$unsigned((~&(^~wire56))),
                  $unsigned((((8'hbf) ?
                      (8'h9f) : reg43) <= reg66[(3'h7):(1'h1)]))});
              reg59 <= $signed({(&reg59[(4'hb):(2'h3)])});
              reg60 <= $signed(((^~$unsigned($unsigned(reg69))) << (reg63[(4'h9):(4'h9)] ?
                  $signed($unsigned(reg67)) : $signed(wire34[(4'hc):(4'h8)]))));
              reg61 <= (~|reg19);
            end
          else
            begin
              reg58 <= (~^($unsigned($signed($signed(reg53))) ?
                  {(wire36 ?
                          reg64 : (|reg63))} : $signed(wire40[(3'h4):(1'h0)])));
            end
          reg62 <= ((reg32 ?
                  reg21 : ($unsigned($unsigned(reg18)) ~^ wire40[(1'h0):(1'h0)])) ?
              ((reg68 ~^ (8'ha5)) == {{(reg46 ? reg67 : reg25),
                      (reg29 & wire17)},
                  {(!reg22)}}) : {wire41[(3'h4):(1'h0)],
                  $signed(({(8'ha7)} >>> reg62[(2'h3):(1'h1)]))});
          reg63 <= reg22[(3'h6):(3'h4)];
          reg64 <= (~reg48[(4'h8):(3'h6)]);
        end
      reg70 <= (8'hac);
      reg71 <= (reg32 - {{(8'haf),
              ($signed((8'hbc)) ? $unsigned(wire56) : $unsigned(reg43))},
          wire54[(3'h4):(1'h0)]});
    end
  assign wire72 = $signed($unsigned($signed($unsigned($signed(reg53)))));
  always
    @(posedge clk) begin
      reg73 <= (8'hb0);
    end
endmodule
