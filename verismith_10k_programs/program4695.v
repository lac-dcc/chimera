module top
#(parameter param195 = (&({(&(~|(8'had)))} ? ((~&(-(8'hb6))) ? (8'ha4) : (7'h40)) : (((+(8'haf)) ? (|(8'hba)) : (7'h43)) ? (~(!(8'hb8))) : {{(8'hb6), (8'ha7)}, ((8'had) ? (8'hbe) : (8'hb5))}))), 
parameter param196 = ({({(param195 ? param195 : param195)} ~^ (~|{param195}))} <= ((param195 <= ({param195} - (~^param195))) ~^ param195)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire194;
  wire [(5'h15):(1'h0)] wire192;
  wire signed [(5'h10):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire140;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire194,
                 wire192,
                 wire143,
                 wire142,
                 wire140,
                 wire15,
                 wire14,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (~^$signed(($signed({wire2, wire3}) ?
                     (wire0[(2'h2):(1'h1)] ^~ (wire3 >>> wire3)) : wire1[(5'h11):(4'hf)])));
  assign wire5 = wire3;
  always
    @(posedge clk) begin
      if ($unsigned(wire2[(4'hb):(1'h1)]))
        begin
          reg6 <= $signed((!$signed(wire1)));
          reg7 <= (8'hb9);
          reg8 <= $signed($unsigned($signed(((|(8'hb1)) ?
              (&(8'hb0)) : (!reg6)))));
        end
      else
        begin
          reg6 <= reg7[(4'hd):(4'h9)];
        end
      reg9 <= (7'h43);
      reg10 <= $signed($unsigned(wire2));
      if ($signed((((!$unsigned(wire0)) & (~|((8'had) >> wire3))) ?
          ($unsigned(((8'hae) >> wire1)) && wire4[(3'h5):(3'h4)]) : (&($signed(wire4) ?
              $unsigned((8'hba)) : (wire4 ? wire1 : reg7))))))
        begin
          reg11 <= $signed(wire2);
        end
      else
        begin
          reg11 <= $signed($signed(($unsigned(wire1[(1'h0):(1'h0)]) ?
              $unsigned($unsigned(reg7)) : reg10[(1'h1):(1'h0)])));
          reg12 <= wire3;
        end
    end
  always
    @(posedge clk) begin
      reg13 <= $signed((wire0[(3'h5):(3'h5)] ?
          (|($signed(reg10) > (wire4 ?
              reg8 : wire2))) : $signed(($signed((8'hbc)) << $unsigned(reg9)))));
    end
  assign wire14 = wire2;
  assign wire15 = reg7[(4'hf):(2'h3)];
  module16 #() modinst141 (wire140, clk, wire15, wire1, reg7, reg12);
  assign wire142 = wire5[(2'h3):(1'h0)];
  assign wire143 = ((~^wire4) ?
                       ((^reg12) >>> $unsigned(((+wire14) ?
                           $unsigned(wire3) : {reg7,
                               wire142}))) : wire142[(2'h3):(1'h0)]);
  module144 #() modinst193 (wire192, clk, wire140, reg9, wire14, reg10);
  assign wire194 = wire0;
endmodule

module module144  (y, clk, wire148, wire147, wire146, wire145);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire148;
  input wire signed [(5'h15):(1'h0)] wire147;
  input wire [(5'h10):(1'h0)] wire146;
  input wire signed [(3'h6):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire191;
  wire [(5'h12):(1'h0)] wire190;
  wire signed [(5'h13):(1'h0)] wire189;
  wire signed [(4'h8):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire [(5'h10):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(5'h10):(1'h0)] wire172;
  wire [(3'h5):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire150;
  wire [(5'h13):(1'h0)] wire149;
  reg [(5'h11):(1'h0)] reg188 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(5'h11):(1'h0)] reg180 = (1'h0);
  reg [(5'h15):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg175 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire186,
                 wire177,
                 wire176,
                 wire174,
                 wire172,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 reg188,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg175,
                 (1'h0)};
  assign wire149 = wire146[(4'h8):(3'h4)];
  assign wire150 = (wire148 >= (~wire147[(3'h5):(2'h3)]));
  assign wire151 = (wire148[(1'h0):(1'h0)] ?
                       ((wire150 ?
                               (^~(!(7'h43))) : ($unsigned((8'hb8)) ?
                                   $unsigned((8'hb6)) : (~|(8'hb4)))) ?
                           {{$unsigned(wire148),
                                   wire147}} : (wire149 >>> {(7'h44)})) : wire146);
  assign wire152 = wire151[(4'hb):(4'h8)];
  assign wire153 = {$unsigned((({wire148} + wire145[(1'h1):(1'h0)]) != (~&(wire148 == wire148)))),
                       wire146};
  module154 #() modinst173 (.wire157(wire147), .wire156(wire145), .clk(clk), .y(wire172), .wire155(wire149), .wire158(wire150));
  assign wire174 = $unsigned(wire150[(4'hc):(3'h4)]);
  always
    @(posedge clk) begin
      reg175 <= (wire153 & (!wire152[(3'h6):(3'h6)]));
    end
  assign wire176 = ((!{wire172,
                       (wire152[(3'h6):(1'h1)] ?
                           $signed(wire146) : $unsigned(wire152))}) <= (^$unsigned(wire152)));
  assign wire177 = ((wire146 ?
                       wire148[(3'h6):(2'h2)] : ((|wire145) ?
                           wire153 : wire153[(3'h4):(1'h1)])) ^ ((((wire151 << wire152) | (-wire174)) ?
                           (^~wire151) : {(wire145 & (8'hb1))}) ?
                       $unsigned($signed(wire151[(4'hc):(2'h2)])) : wire151));
  always
    @(posedge clk) begin
      reg178 <= wire174[(3'h7):(3'h6)];
      reg179 <= wire150[(5'h14):(3'h6)];
      reg180 <= wire149[(4'hd):(1'h0)];
      if ((&{{wire148[(3'h5):(1'h1)], {wire177, (8'ha9)}}}))
        begin
          reg181 <= $signed(((&wire174[(5'h13):(4'hd)]) ?
              (-$signed((wire145 && wire152))) : {$signed(wire174)}));
        end
      else
        begin
          if (wire145)
            begin
              reg181 <= ((~|(((reg179 & wire174) << (^wire153)) ?
                  $signed((wire149 ^ wire177)) : wire145)) == $signed((~|$signed(((8'h9e) ~^ reg178)))));
              reg182 <= ($signed(reg175) ?
                  ($signed($unsigned(wire172[(4'h8):(3'h4)])) & reg181) : ($unsigned($unsigned($signed(wire150))) | ($signed(wire151[(4'ha):(3'h5)]) ?
                      $signed(wire148[(3'h5):(2'h2)]) : wire151[(3'h4):(3'h4)])));
              reg183 <= $signed(reg180[(3'h7):(3'h6)]);
            end
          else
            begin
              reg181 <= (|{$signed((^~(wire145 >= reg175))),
                  $unsigned(wire152[(2'h2):(2'h2)])});
              reg182 <= $signed(((~|reg179) & (^reg180[(2'h3):(1'h0)])));
              reg183 <= wire148;
              reg184 <= ({(wire148 != {$signed(wire145)})} ?
                  wire146[(5'h10):(4'h8)] : wire152);
            end
        end
      reg185 <= ($signed($signed($unsigned(reg184[(3'h5):(1'h1)]))) ^ reg183[(4'hb):(4'hb)]);
    end
  assign wire186 = {wire147};
  assign wire187 = ($signed(wire147) ~^ $signed((~|(wire150 ?
                       (reg183 ? reg184 : wire152) : (~^(8'hb0))))));
  always
    @(posedge clk) begin
      reg188 <= wire147;
    end
  assign wire189 = $unsigned((($unsigned(wire149[(4'he):(1'h1)]) ?
                       wire176 : (reg188 >> reg185)) && wire146[(3'h7):(3'h5)]));
  assign wire190 = (wire189 ? (8'ha8) : (&$unsigned(wire187)));
  assign wire191 = (^~reg179);
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20);
  output wire [(32'h1b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire131;
  wire signed [(4'hd):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire99;
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  assign y = {wire139,
                 wire137,
                 wire136,
                 wire131,
                 wire129,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire101,
                 wire21,
                 wire48,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire99,
                 reg138,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg104,
                 reg103,
                 reg102,
                 reg56,
                 reg55,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire21 = wire17[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      reg22 <= $unsigned((wire19 | ($unsigned((^(7'h44))) <= {(wire17 ~^ wire19)})));
      reg23 <= wire19;
      reg24 <= wire19;
      reg25 <= $signed(reg23[(2'h3):(2'h3)]);
    end
  module26 #() modinst49 (.y(wire48), .clk(clk), .wire27(reg24), .wire28(wire18), .wire29(wire20), .wire31(reg25), .wire30(reg23));
  assign wire50 = wire21;
  assign wire51 = $signed((|$signed(wire20)));
  assign wire52 = (~(~reg24[(3'h7):(3'h5)]));
  assign wire53 = $unsigned($signed(wire21[(4'hf):(4'h9)]));
  assign wire54 = ($signed((({wire17} ? (8'ha0) : $signed(wire17)) ?
                      $unsigned(wire51[(2'h2):(1'h1)]) : $unsigned(wire48))) ^~ reg22);
  always
    @(posedge clk) begin
      reg55 <= wire53[(4'h8):(3'h5)];
      reg56 <= $unsigned((8'hbf));
    end
  module57 #() modinst100 (.wire58(reg24), .wire59(reg25), .wire62(wire52), .wire60(wire18), .wire61(wire54), .clk(clk), .y(wire99));
  assign wire101 = ($signed(reg24[(4'h8):(2'h3)]) ?
                       $unsigned($signed((~^$signed(wire17)))) : (!(-(~(^~wire50)))));
  always
    @(posedge clk) begin
      reg102 <= ({$signed((-$signed((8'hb3))))} != wire54);
      reg103 <= reg55;
      reg104 <= ($signed($unsigned(((wire48 ? reg22 : wire17) ?
          (reg102 ~^ reg22) : ((8'hbd) + reg102)))) + ($unsigned((reg103 << reg22)) == (8'h9f)));
    end
  assign wire105 = wire19;
  assign wire106 = $signed((~&reg23));
  assign wire107 = (($unsigned($unsigned($unsigned(reg104))) == $signed(($signed(reg103) << ((8'hb9) ?
                           (8'ha1) : wire54)))) ?
                       ($signed($unsigned((reg25 | reg22))) ?
                           (wire18[(3'h6):(2'h2)] ?
                               (~|(!reg103)) : {(wire106 ? (8'h9d) : wire106),
                                   $unsigned((8'had))}) : $unsigned(wire20[(1'h0):(1'h0)])) : ($signed(reg55[(3'h7):(3'h5)]) * wire17));
  assign wire108 = (^wire53);
  module109 #() modinst130 (.y(wire129), .wire113(wire48), .wire112(reg104), .wire111(reg102), .wire110(wire106), .clk(clk));
  assign wire131 = (7'h40);
  always
    @(posedge clk) begin
      reg132 <= (~&($signed(wire101) ?
          (8'hb0) : (&$signed((reg55 && wire131)))));
      reg133 <= {(+wire54),
          ($signed(wire53[(3'h7):(1'h1)]) ?
              wire50[(1'h0):(1'h0)] : $unsigned(($unsigned(wire101) + $signed(wire105))))};
      reg134 <= wire106[(2'h3):(2'h2)];
      reg135 <= reg104;
    end
  assign wire136 = wire50;
  assign wire137 = (wire101[(1'h1):(1'h0)] ?
                       reg23[(4'hb):(1'h0)] : ({$signed((&reg24)),
                               $unsigned($unsigned(wire131))} ?
                           ((-(&(8'hbe))) ?
                               (&$unsigned((8'ha3))) : $signed((wire107 - (8'hac)))) : (|reg55[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg138 <= (&(({reg22[(3'h4):(3'h4)], (^reg135)} ?
              ((wire54 >= (8'hba)) ?
                  $signed(wire108) : wire19) : $unsigned((8'hb6))) ?
          ($signed((wire51 ? reg135 : (8'ha3))) ?
              wire50 : (~&{(8'hb3), reg102})) : wire131[(5'h12):(5'h11)]));
    end
  assign wire139 = (^wire108);
endmodule

module module109
#(parameter param128 = (^~{(({(8'hb2)} ? (!(8'hb0)) : ((7'h41) * (8'h9f))) & ({(8'hb2), (8'hb0)} + {(8'hae), (8'haf)})), (8'hae)}))
(y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire113;
  input wire [(4'hb):(1'h0)] wire112;
  input wire [(5'h10):(1'h0)] wire111;
  input wire [(5'h15):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire114 = (~$unsigned($signed(({wire112} ?
                       {wire110, wire110} : (8'hbc)))));
  assign wire115 = {$unsigned($unsigned($unsigned(wire114[(3'h4):(3'h4)]))),
                       wire113[(4'hf):(4'ha)]};
  assign wire116 = wire115;
  assign wire117 = $unsigned(wire113);
  assign wire118 = wire112;
  always
    @(posedge clk) begin
      reg119 <= wire114[(1'h0):(1'h0)];
      reg120 <= (wire114 ?
          (|({(wire113 ?
                  wire118 : reg119)} - wire116[(1'h0):(1'h0)])) : $unsigned(($unsigned($signed(wire110)) - wire113[(4'hc):(1'h1)])));
      reg121 <= $unsigned((wire110 - $unsigned(wire116[(2'h3):(2'h3)])));
      reg122 <= (((-$unsigned(wire112)) ?
          (-(8'hb8)) : $unsigned(((wire111 ^~ wire112) ?
              (wire114 ? wire113 : (8'hbe)) : $signed(wire118)))) > ({(wire116 ?
                  {(8'hb1), reg120} : $unsigned(wire112)),
              ((^~wire114) ? wire115[(3'h7):(2'h3)] : (~|wire114))} ?
          wire111 : (|wire117)));
    end
  assign wire123 = {$unsigned(reg120)};
  assign wire124 = {wire114};
  assign wire125 = (!$signed(reg121));
  assign wire126 = wire123;
  assign wire127 = ((wire116 ?
                           (({wire112} ^ $unsigned(wire118)) ?
                               $unsigned((~wire125)) : (&$unsigned((8'ha2)))) : $signed((~|wire113[(4'hb):(2'h3)]))) ?
                       ((8'hae) ?
                           wire124[(1'h0):(1'h0)] : $unsigned(wire115)) : wire112);
endmodule

module module57
#(parameter param97 = ((((((8'haf) & (8'ha4)) ? ((8'ha8) ? (8'ha2) : (7'h41)) : (&(8'haa))) || (8'ha1)) & (&{(-(8'h9d))})) ? (((~&(+(8'h9d))) ? {((8'haf) != (8'ha6)), ((8'haf) ? (8'hb3) : (8'ha3))} : ({(7'h44), (7'h42)} ? (!(8'hbb)) : {(8'ha9), (8'hb5)})) ? ((|((7'h42) ? (7'h43) : (8'hb9))) ? (((8'ha0) || (8'ha1)) ? ((8'ha0) > (8'ha5)) : ((7'h40) ~^ (8'hbd))) : ({(8'had)} ? ((8'hb9) <= (8'h9c)) : (8'hb8))) : (~^(~((8'hbc) ? (8'ha4) : (8'ha3))))) : (((~&(~^(8'hb0))) ? {(~&(8'ha1))} : (-(8'hbc))) ? ((^~((8'hab) ? (8'ha8) : (8'hb0))) * (&(+(8'ha5)))) : ((+((8'hbc) - (8'h9c))) ? {((8'hae) ? (8'hb6) : (8'h9f))} : ((&(8'hb1)) < (~(8'ha7)))))), 
parameter param98 = (8'hba))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire62;
  input wire signed [(3'h5):(1'h0)] wire61;
  input wire signed [(5'h14):(1'h0)] wire60;
  input wire signed [(3'h7):(1'h0)] wire59;
  input wire [(4'h8):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(2'h3):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire87,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire63 = $unsigned(wire61[(1'h0):(1'h0)]);
  assign wire64 = {((^~$signed((8'hbd))) ?
                          wire60[(3'h6):(2'h3)] : $unsigned($signed((-wire63)))),
                      $unsigned(wire59[(1'h0):(1'h0)])};
  assign wire65 = $unsigned((((~&$unsigned(wire60)) ^ wire60) ?
                      wire62[(1'h0):(1'h0)] : $unsigned((~&{wire59}))));
  assign wire66 = (((!$signed($signed(wire65))) ?
                      wire62 : (wire63 << (8'h9e))) + (wire62[(2'h2):(1'h1)] ?
                      (wire65 & $signed(wire64[(3'h4):(1'h0)])) : wire65));
  always
    @(posedge clk) begin
      reg67 <= $unsigned((+$unsigned($unsigned($signed((8'hb2))))));
      reg68 <= (^~{($unsigned((wire65 ? wire60 : wire60)) & wire65),
          (($unsigned(wire61) ? (reg67 ? wire63 : (8'ha8)) : $signed(wire64)) ?
              ($signed((8'hac)) > $unsigned(wire62)) : $unsigned({wire65,
                  wire62}))});
      if (wire62)
        begin
          reg69 <= (^~((wire65[(2'h2):(1'h0)] + (8'ha2)) ?
              $signed((wire64 ?
                  $signed(wire61) : (wire64 ?
                      wire63 : (8'hbf)))) : ((~|$unsigned(wire63)) & wire58)));
          reg70 <= wire61;
          if ((|$unsigned((((~&reg69) ?
              (~&wire62) : ((8'hb6) ?
                  wire65 : (8'ha2))) >= reg68[(4'hb):(4'hb)]))))
            begin
              reg71 <= (|wire60[(4'h9):(2'h3)]);
              reg72 <= {($signed(wire64) <<< $unsigned(reg67[(4'hb):(1'h1)])),
                  wire58};
              reg73 <= $signed($signed(reg69));
              reg74 <= (^~($unsigned($signed((reg72 ?
                  wire58 : wire64))) - (({reg71, wire59} == (|(8'h9c))) ?
                  (|wire63) : (8'hb0))));
              reg75 <= reg73[(1'h1):(1'h0)];
            end
          else
            begin
              reg71 <= (8'ha2);
            end
        end
      else
        begin
          reg69 <= (8'hab);
          reg70 <= ((reg67 ? reg75 : $signed({wire58, wire58[(3'h7):(1'h0)]})) ?
              $signed({($signed(reg68) - ((8'hb6) != reg74)),
                  ((|wire63) ?
                      $unsigned(reg74) : $unsigned(wire60))}) : (~&$unsigned($signed((wire66 | wire63)))));
          if ($unsigned((+($signed({reg75, reg69}) << reg73[(5'h11):(3'h4)]))))
            begin
              reg71 <= $signed(((8'ha9) ?
                  {((reg70 ? reg68 : reg69) ?
                          ((8'hba) ? wire59 : (8'hab)) : (8'hb2)),
                      ((wire63 ? reg73 : reg75) ?
                          $signed(reg72) : $unsigned(reg68))} : $signed(wire62[(4'hb):(3'h6)])));
              reg72 <= wire64;
              reg73 <= $signed(wire60[(4'hc):(3'h7)]);
            end
          else
            begin
              reg71 <= reg69[(4'h8):(4'h8)];
            end
          reg74 <= (wire66 <= $unsigned($unsigned(($unsigned((8'had)) & $unsigned(wire60)))));
        end
      reg76 <= ($signed(($unsigned($unsigned(wire60)) ~^ ((reg72 ?
              wire59 : reg75) == $unsigned(reg73)))) ?
          (&{$unsigned({wire61, wire63}), wire60[(5'h13):(4'h8)]}) : (reg67 ?
              $signed(((wire66 == (8'hb5)) > wire59)) : $unsigned(reg71)));
    end
  assign wire77 = ($unsigned($signed(((|wire60) ?
                      $unsigned(reg67) : reg74))) ~^ ($unsigned(wire62) ^ (|{$signed(wire58)})));
  assign wire78 = $unsigned($unsigned($signed((!(wire63 ? wire59 : wire61)))));
  assign wire79 = $unsigned($signed({$signed($signed(wire66)),
                      {$unsigned(reg76), $unsigned(reg72)}}));
  assign wire80 = reg73[(3'h6):(3'h4)];
  assign wire81 = ($signed($signed(((reg71 ? wire65 : (8'h9c)) ?
                      ((8'ha6) <<< reg73) : wire63))) >> ((^((reg73 ?
                              reg68 : wire60) ?
                          {reg75, wire58} : wire61)) ?
                      $unsigned($signed((wire78 ?
                          reg72 : wire58))) : (-$unsigned(wire62[(5'h13):(3'h4)]))));
  assign wire82 = (~wire66);
  always
    @(posedge clk) begin
      reg83 <= wire60[(2'h3):(1'h0)];
      reg84 <= reg68[(3'h5):(2'h3)];
      reg85 <= wire79;
      reg86 <= ((8'hb6) ?
          (~($unsigned((!(8'hb6))) ?
              $unsigned(wire62[(3'h4):(1'h1)]) : reg85[(2'h3):(2'h3)])) : (~&(~|$signed($signed((8'ha8))))));
    end
  assign wire87 = reg70;
  always
    @(posedge clk) begin
      if ((({{wire66[(4'h8):(3'h4)]}} ?
              $unsigned({(~&wire61),
                  (wire82 ? wire66 : wire79)}) : (~^wire78)) ?
          reg73[(3'h5):(3'h4)] : wire65))
        begin
          reg88 <= (+($unsigned($signed((reg68 >> wire65))) ?
              (wire62 < (~wire79[(2'h2):(1'h0)])) : (8'ha2)));
          reg89 <= $signed((({reg73,
              ((8'ha0) ? reg88 : wire62)} <<< wire61) << $unsigned(reg83)));
          reg90 <= wire58[(3'h7):(3'h6)];
        end
      else
        begin
          if (reg85[(2'h3):(2'h2)])
            begin
              reg88 <= ((-($unsigned(reg72) - reg72)) >= $unsigned(wire59));
              reg89 <= wire80[(1'h0):(1'h0)];
              reg90 <= ($unsigned(wire79) ?
                  ($signed(($unsigned((8'ha9)) ?
                      (reg88 == reg73) : reg88[(1'h1):(1'h0)])) << $signed(((wire59 ?
                          (8'hae) : wire63) ?
                      $signed(reg83) : (wire80 ? reg69 : reg84)))) : reg85);
            end
          else
            begin
              reg88 <= {($unsigned($unsigned($signed(wire64))) > $unsigned(($signed(wire64) >>> (~^reg86))))};
              reg89 <= reg72[(3'h5):(1'h0)];
              reg90 <= reg69;
              reg91 <= $signed($signed(wire78[(4'he):(3'h5)]));
            end
          reg92 <= wire81;
        end
    end
  assign wire93 = wire80[(3'h7):(1'h1)];
  assign wire94 = reg69[(2'h2):(1'h1)];
  assign wire95 = ((&($unsigned((8'h9f)) ?
                      reg68 : wire78)) < (wire82[(5'h12):(5'h12)] ?
                      (reg67 ?
                          ((reg84 && reg76) - (reg89 ?
                              (8'ha8) : wire64)) : (((8'hb5) ^ wire58) ?
                              reg69[(3'h6):(1'h1)] : $signed(reg89))) : ($signed((wire93 >>> wire81)) ?
                          $unsigned(((7'h44) ?
                              (8'ha6) : wire65)) : (reg83 >= (wire82 ?
                              wire66 : wire80)))));
  assign wire96 = (reg91 ?
                      $signed((~^($signed(wire82) ?
                          (8'ha3) : {(8'had)}))) : ((wire59[(1'h1):(1'h1)] & (((8'hba) ?
                          (8'hb7) : wire80) * wire65)) ~^ reg90[(4'h8):(1'h0)]));
endmodule

module module26
#(parameter param47 = {({((~&(8'had)) != ((8'hac) ^~ (8'ha1)))} ? (((~(8'hac)) ? ((8'h9f) ? (8'hb5) : (8'hb7)) : {(8'hac)}) ? ((8'ha8) ? (^(8'ha1)) : ((8'ha9) ? (8'haa) : (8'hb2))) : (((7'h41) >> (8'h9c)) ? ((8'h9f) >> (7'h44)) : (-(8'hb6)))) : (+(((8'haa) == (8'h9f)) | (+(8'ha7))))), {(|(((8'ha1) != (8'hb9)) >> (!(8'hbf)))), ((~&((8'hba) + (8'hbc))) != (^(~(8'hbc))))}})
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire31;
  input wire signed [(4'he):(1'h0)] wire30;
  input wire signed [(2'h2):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire32 = (wire30 * {(~((+wire30) ? $signed(wire29) : {wire30})),
                      (^~$signed($signed(wire28)))});
  assign wire33 = {{$unsigned(($signed(wire30) <= wire31))}};
  assign wire34 = {$signed(((8'ha9) >>> $signed(wire33[(2'h2):(1'h1)]))),
                      {wire32[(2'h3):(1'h1)]}};
  assign wire35 = (wire29[(2'h2):(1'h0)] | wire33[(3'h6):(2'h3)]);
  assign wire36 = (+(((+(wire27 ? (8'ha1) : (8'ha7))) ?
                          (8'haf) : ($unsigned(wire30) ?
                              $signed(wire28) : wire30[(1'h0):(1'h0)])) ?
                      $signed(wire33) : $unsigned($unsigned({wire34,
                          wire29}))));
  assign wire37 = ($signed(((wire29 ~^ (wire30 <<< wire32)) ?
                      {(~^wire33), wire33} : (8'hb5))) - (^wire30));
  assign wire38 = (7'h40);
  always
    @(posedge clk) begin
      if ((~|wire34[(1'h0):(1'h0)]))
        begin
          reg39 <= wire34[(1'h1):(1'h0)];
          reg40 <= (({$signed(wire28), wire30[(4'he):(4'hc)]} ?
                  ((~^$signed(wire36)) ?
                      wire37 : (8'hb7)) : (wire32[(1'h0):(1'h0)] <<< (8'hb0))) ?
              $signed($unsigned(wire31)) : $unsigned((8'hbe)));
          reg41 <= (^~(($signed(wire27) || $signed($unsigned(wire28))) && $signed($signed(wire38[(4'hf):(4'hd)]))));
          reg42 <= $unsigned(wire38[(3'h6):(3'h4)]);
          reg43 <= ($signed((~|wire34)) || (wire33 ?
              (((~|wire28) >> (wire38 ~^ wire32)) ^~ wire37) : $signed(reg42)));
        end
      else
        begin
          reg39 <= $unsigned(((wire28[(3'h5):(1'h0)] >>> $unsigned((reg40 ?
                  (8'h9e) : (8'hb4)))) ?
              $signed((8'hbe)) : (($signed(wire38) <<< (wire29 ?
                      wire36 : wire28)) ?
                  $signed(((8'hb4) ?
                      reg40 : (7'h44))) : $signed(wire38[(3'h7):(2'h2)]))));
          reg40 <= wire37[(4'h8):(3'h5)];
        end
    end
  assign wire44 = $unsigned(($unsigned($signed(wire35)) ?
                      (~^{(~|reg43),
                          $unsigned(wire30)}) : (!reg41[(4'hc):(3'h6)])));
  assign wire45 = {$unsigned({wire28})};
  assign wire46 = wire38[(3'h5):(1'h1)];
endmodule

module module154
#(parameter param171 = ((8'had) + (^(~(((8'hb8) >>> (8'hb2)) * (+(8'hbb)))))))
(y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire158;
  input wire [(3'h4):(1'h0)] wire157;
  input wire signed [(2'h2):(1'h0)] wire156;
  input wire [(4'ha):(1'h0)] wire155;
  wire [(4'h8):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire169;
  wire [(2'h3):(1'h0)] wire168;
  wire [(4'hb):(1'h0)] wire159;
  reg signed [(3'h5):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire159,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire159 = (^~$unsigned({{((8'hba) ? wire158 : wire158)},
                       ($signed(wire155) >> $signed(wire156))}));
  always
    @(posedge clk) begin
      if ($unsigned(((^~$signed((wire157 < wire157))) ?
          $unsigned({(~|wire156)}) : wire159)))
        begin
          reg160 <= wire158[(2'h3):(2'h2)];
        end
      else
        begin
          reg160 <= wire156;
          reg161 <= wire156[(1'h1):(1'h0)];
          reg162 <= $unsigned((wire159 <<< (reg161 ?
              $signed(wire158) : {{wire155}, ((7'h42) ? reg160 : wire156)})));
          reg163 <= ((wire156[(1'h0):(1'h0)] && {{(wire156 * wire159),
                  (~wire156)}}) > reg161);
        end
      reg164 <= ($signed((-(wire157 != (reg161 ?
          reg162 : reg161)))) ^~ {(wire157 ^ ((reg163 ~^ reg161) ~^ (wire158 ?
              reg160 : wire155))),
          wire158[(1'h0):(1'h0)]});
      reg165 <= (wire155 ? $unsigned(reg160[(5'h10):(3'h6)]) : wire156);
      reg166 <= $unsigned(reg161[(3'h6):(3'h4)]);
      reg167 <= $unsigned(((($unsigned(reg165) ?
          wire157 : wire155[(4'h9):(2'h3)]) | $unsigned($signed(reg161))) & reg164));
    end
  assign wire168 = (($unsigned((~|$signed((8'hba)))) ?
                           (!(7'h40)) : (^~wire157)) ?
                       {reg166[(4'hb):(3'h6)]} : {(wire155[(3'h7):(3'h7)] ^ ($unsigned(reg162) || {reg162}))});
  assign wire169 = $unsigned(((reg167[(2'h3):(2'h3)] * ({wire156,
                       reg160} + (7'h42))) | {$unsigned((^~wire168)), reg166}));
  assign wire170 = reg164;
endmodule
