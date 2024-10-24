module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire157;
  wire signed [(3'h7):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire148;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire150;
  wire [(2'h2):(1'h0)] wire151;
  wire signed [(3'h5):(1'h0)] wire153;
  wire [(4'hf):(1'h0)] wire154;
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire148,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire49,
                 wire48,
                 wire46,
                 wire150,
                 wire151,
                 wire153,
                 wire154,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  module5 #() modinst47 (.wire8(wire0), .wire7(wire1), .clk(clk), .wire9(wire3), .y(wire46), .wire6(wire4), .wire10(wire2));
  assign wire48 = $signed(({$signed(wire0[(4'hc):(4'h9)])} <<< (wire3 ?
                      $unsigned($signed(wire4)) : $unsigned((wire3 ?
                          wire2 : wire0)))));
  assign wire49 = $signed((+wire2));
  always
    @(posedge clk) begin
      reg50 <= wire1;
      reg51 <= wire3[(4'hb):(4'hb)];
      reg52 <= ((|$unsigned($unsigned((reg51 ? reg51 : wire0)))) ?
          $signed((((reg51 ? wire3 : reg50) ?
                  $unsigned(wire0) : wire2[(1'h1):(1'h0)]) ?
              ((wire4 ?
                  wire2 : wire2) == reg51[(1'h0):(1'h0)]) : ((wire4 - wire4) ?
                  (~&reg51) : (wire49 ?
                      reg50 : wire46)))) : $signed(((^(~wire3)) > (^$unsigned(wire48)))));
      reg53 <= (^(!(^~($signed(reg50) && wire46))));
      if (wire0)
        begin
          reg54 <= wire48[(4'ha):(4'ha)];
          if ((~|(!($unsigned({wire46}) >> $unsigned((reg53 ?
              wire0 : (8'hb1)))))))
            begin
              reg55 <= (reg50[(3'h6):(1'h1)] ?
                  (~|reg52[(2'h2):(2'h2)]) : reg54[(2'h2):(2'h2)]);
              reg56 <= wire3;
              reg57 <= reg56[(5'h13):(3'h6)];
              reg58 <= reg53[(4'ha):(4'h9)];
            end
          else
            begin
              reg55 <= wire46;
              reg56 <= wire4;
              reg57 <= ({{{(+reg58)}, $signed((wire4 & reg57))},
                      $unsigned((8'hbc))} ?
                  (((reg50[(2'h3):(2'h3)] && $signed(wire46)) <<< $signed((~^reg51))) - reg51[(3'h4):(1'h1)]) : (~reg53[(1'h1):(1'h1)]));
              reg58 <= (^$signed(wire46));
              reg59 <= $signed(({$unsigned((wire2 * reg55))} ?
                  reg52 : $signed(({reg57, wire46} < (wire1 & wire1)))));
            end
          reg60 <= (^~wire48);
        end
      else
        begin
          if ({wire48})
            begin
              reg54 <= wire46;
            end
          else
            begin
              reg54 <= wire3;
              reg55 <= $signed((~|$signed(reg59[(3'h4):(1'h0)])));
              reg56 <= ((~|((^~reg56) * (reg51 << {reg50}))) ?
                  $unsigned(reg51[(3'h5):(3'h5)]) : (^(wire4 ?
                      {wire2,
                          wire2[(4'he):(3'h6)]} : (^~wire0[(3'h5):(2'h2)]))));
            end
          reg57 <= (((reg52 != $signed((reg56 - reg53))) < $unsigned((~|$signed(reg59)))) ?
              $unsigned(({$unsigned(reg58),
                  $unsigned(reg56)} - $unsigned((reg50 << (8'ha1))))) : (wire1[(4'hc):(1'h0)] ?
                  (!$unsigned((~^wire0))) : (~^((reg50 ? reg53 : wire3) ?
                      {reg55, wire2} : $signed(reg53)))));
          if ((&$unsigned(reg54[(1'h0):(1'h0)])))
            begin
              reg58 <= reg59;
              reg59 <= reg50;
              reg60 <= $signed((|$signed((~&(wire2 ? reg52 : reg58)))));
              reg61 <= reg52[(2'h2):(1'h1)];
              reg62 <= {(~wire48), {wire1[(3'h6):(2'h2)]}};
            end
          else
            begin
              reg58 <= reg59;
              reg59 <= $unsigned((-(wire49[(3'h4):(2'h2)] ?
                  ((8'hb3) ?
                      reg56[(5'h11):(1'h0)] : $unsigned(wire3)) : $signed($signed(reg62)))));
            end
          if ((($signed(reg56) >> (!$unsigned(reg58[(3'h6):(3'h4)]))) | reg60[(1'h0):(1'h0)]))
            begin
              reg63 <= $unsigned($unsigned($unsigned(reg51)));
              reg64 <= (reg59[(2'h2):(2'h2)] > $unsigned((&reg55[(4'h8):(3'h6)])));
              reg65 <= wire2;
              reg66 <= (^~{(|$unsigned((reg60 + wire4))),
                  $unsigned(wire1[(4'ha):(2'h2)])});
            end
          else
            begin
              reg63 <= ($signed(($unsigned($signed((8'haf))) ?
                      $unsigned(wire2) : $unsigned($unsigned(wire4)))) ?
                  $signed({(wire46[(1'h0):(1'h0)] ?
                          $signed(reg60) : (reg52 <= (8'hbe))),
                      reg66}) : {$signed(reg54[(3'h7):(3'h4)]),
                      (-wire48[(1'h1):(1'h0)])});
              reg64 <= reg56[(4'hb):(1'h1)];
              reg65 <= $unsigned(reg50[(3'h4):(2'h2)]);
              reg66 <= {reg56[(4'h9):(3'h7)],
                  $unsigned((+(^(wire1 >= reg56))))};
              reg67 <= {$unsigned((wire4 ? wire4 : $unsigned(reg59)))};
            end
          reg68 <= reg65;
        end
    end
  assign wire69 = (|wire3[(3'h6):(3'h4)]);
  assign wire70 = (reg57[(1'h0):(1'h0)] ?
                      $signed(wire1[(1'h0):(1'h0)]) : reg65[(1'h1):(1'h1)]);
  assign wire71 = (wire48[(2'h3):(2'h3)] == ($unsigned($unsigned((8'hb0))) ?
                      $signed({(!wire3)}) : $unsigned({wire48[(4'ha):(2'h3)]})));
  assign wire72 = ($signed((~|$signed($signed(wire49)))) ?
                      reg67[(2'h2):(2'h2)] : $signed((|reg56[(2'h3):(2'h2)])));
  assign wire73 = {reg56[(4'he):(4'h9)]};
  assign wire74 = reg64;
  assign wire75 = reg52;
  module76 #() modinst149 (.wire79(reg61), .clk(clk), .y(wire148), .wire77(reg64), .wire78(wire73), .wire80(reg55));
  assign wire150 = reg53;
  module82 #() modinst152 (.wire83(reg64), .y(wire151), .wire84(wire73), .wire86(reg65), .wire85(wire74), .wire87(reg61), .clk(clk));
  assign wire153 = $signed(reg54[(3'h7):(3'h6)]);
  module125 #() modinst155 (.wire128(reg57), .wire126(wire46), .wire127(wire1), .y(wire154), .wire130(reg58), .clk(clk), .wire129(wire49));
  assign wire156 = (~|reg68[(4'hb):(3'h7)]);
  assign wire157 = reg50;
  assign wire158 = ((^(({(8'h9e)} >>> (wire46 >> wire74)) == wire72[(4'hf):(4'h8)])) + $unsigned((reg50[(3'h5):(3'h5)] * (+(&reg67)))));
endmodule

module module76
#(parameter param146 = (~((8'ha8) ? (!(((8'ha5) * (8'hb2)) <<< ((7'h40) ? (8'hac) : (8'ha2)))) : (~|(~&((8'hb8) ? (8'hb1) : (8'h9f)))))), 
parameter param147 = param146)
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire80;
  input wire [(5'h12):(1'h0)] wire79;
  input wire signed [(3'h6):(1'h0)] wire78;
  input wire [(4'ha):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire145;
  wire [(2'h3):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire143;
  wire [(2'h2):(1'h0)] wire142;
  wire [(4'he):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire124;
  wire signed [(3'h5):(1'h0)] wire140;
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire122,
                 wire81,
                 wire124,
                 wire140,
                 (1'h0)};
  assign wire81 = ($unsigned($signed($signed(wire79))) >> $unsigned({(wire78 ?
                          (~|(8'hb3)) : (wire77 ? wire78 : wire80)),
                      ({wire77} | wire77[(1'h0):(1'h0)])}));
  module82 #() modinst123 (wire122, clk, wire77, wire81, wire79, wire78, wire80);
  assign wire124 = (wire81[(3'h6):(1'h0)] + (($signed((wire78 ?
                               wire122 : wire79)) ?
                           $unsigned((^(8'hb1))) : $unsigned(wire122[(2'h2):(2'h2)])) ?
                       (wire122 | $signed($unsigned(wire81))) : $unsigned((|(~&wire78)))));
  module125 #() modinst141 (.wire129(wire124), .wire128(wire79), .y(wire140), .wire130(wire122), .wire126(wire81), .wire127(wire78), .clk(clk));
  assign wire142 = $signed($signed($unsigned($unsigned((^(8'ha6))))));
  assign wire143 = (|{$signed(wire78)});
  assign wire144 = $signed((8'ha1));
  assign wire145 = wire143;
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  assign y = {wire44, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = {(~wire8[(3'h7):(3'h5)])};
  assign wire12 = (|$unsigned($unsigned((|(wire6 > wire10)))));
  assign wire13 = ($unsigned(wire11[(1'h1):(1'h0)]) ?
                      $unsigned($signed((wire12 ?
                          (~|wire11) : wire8[(2'h3):(1'h0)]))) : wire10[(3'h5):(1'h0)]);
  assign wire14 = wire6;
  assign wire15 = wire7[(3'h6):(1'h0)];
  module16 #() modinst45 (wire44, clk, wire10, wire9, wire15, wire8);
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(4'ha):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
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
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = ({wire20[(3'h5):(2'h2)]} << (((wire19[(4'h9):(2'h2)] - (^~(8'hb4))) ?
                      $unsigned(wire19[(1'h1):(1'h1)]) : $unsigned((wire20 > wire20))) + (((+wire20) ?
                      $unsigned(wire18) : wire18[(3'h4):(1'h0)]) ^~ wire19)));
  assign wire22 = $unsigned(wire21[(5'h15):(3'h7)]);
  assign wire23 = $signed(((^~({wire19, wire21} <<< (wire18 ?
                          wire21 : wire20))) ?
                      ($signed((wire21 + wire21)) ^~ $unsigned($unsigned(wire17))) : (((wire19 < wire18) * $signed(wire19)) >>> $signed(wire18[(4'ha):(2'h3)]))));
  assign wire24 = {(wire21 ?
                          $unsigned(((~wire18) + wire22)) : $unsigned(wire22[(2'h3):(2'h3)])),
                      $unsigned($unsigned(wire22[(1'h1):(1'h1)]))};
  assign wire25 = wire17[(4'hf):(4'hd)];
  assign wire26 = $unsigned(({$signed((!wire21))} <<< (-{(wire23 ?
                          wire25 : wire17)})));
  assign wire27 = wire23[(3'h4):(2'h3)];
  assign wire28 = wire18[(3'h7):(1'h1)];
  assign wire29 = wire27;
  assign wire30 = $unsigned($signed($unsigned(wire20[(4'h9):(2'h2)])));
  assign wire31 = (~|$unsigned(wire23[(3'h4):(2'h3)]));
  assign wire32 = (({$signed((8'haa))} == wire17) >= wire22[(1'h1):(1'h1)]);
  assign wire33 = (~|(wire24[(2'h3):(2'h3)] ?
                      wire21[(4'ha):(1'h1)] : $unsigned({(!wire21)})));
  assign wire34 = $unsigned((wire23 ?
                      wire31[(1'h1):(1'h0)] : ((~|(wire27 >>> wire19)) ?
                          {$unsigned(wire26)} : ({wire31,
                              wire25} < {wire31}))));
  assign wire35 = ({$signed(wire29)} * (~^(^~(wire21[(4'he):(3'h6)] + (wire34 ?
                      wire20 : wire18)))));
  assign wire36 = wire21[(1'h1):(1'h0)];
  assign wire37 = $unsigned(({$unsigned((~(8'hbb)))} >>> (-$unsigned(((8'hbd) ?
                      wire27 : wire26)))));
  assign wire38 = (wire23[(3'h5):(2'h2)] << wire27);
  assign wire39 = $unsigned({($signed(wire28) ?
                          {wire33[(1'h0):(1'h0)],
                              (wire38 == wire25)} : ({wire38, wire29} ?
                              wire30 : (wire34 && wire28))),
                      (|wire23)});
  assign wire40 = $unsigned((wire22 ?
                      wire34 : $unsigned(((-(8'had)) ?
                          wire20 : ((8'ha1) >> wire38)))));
  assign wire41 = $signed(wire17);
  assign wire42 = (^wire20);
  assign wire43 = $signed(wire29[(4'hd):(1'h0)]);
endmodule

module module125  (y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire130;
  input wire [(4'h9):(1'h0)] wire129;
  input wire [(3'h5):(1'h0)] wire128;
  input wire [(3'h6):(1'h0)] wire127;
  input wire [(3'h5):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire [(3'h6):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire134;
  wire [(2'h3):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  assign y = {wire139,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 reg138,
                 (1'h0)};
  assign wire131 = wire129;
  assign wire132 = ((wire127 & wire129[(3'h6):(3'h5)]) ?
                       (!wire130) : {$signed($signed(wire128[(2'h2):(2'h2)])),
                           (!wire129[(2'h3):(1'h0)])});
  assign wire133 = $unsigned(($signed($signed($unsigned(wire131))) && (wire132[(2'h3):(2'h3)] ?
                       (~&$unsigned(wire128)) : ((wire130 ? wire128 : wire131) ?
                           wire130[(3'h6):(3'h5)] : $signed(wire131)))));
  assign wire134 = (8'hb5);
  assign wire135 = wire128[(1'h0):(1'h0)];
  assign wire136 = wire133[(1'h0):(1'h0)];
  assign wire137 = (((|$signed((!(8'ha8)))) >= $unsigned(wire132)) + ({(~wire133),
                       wire134} - wire133));
  always
    @(posedge clk) begin
      reg138 <= wire133[(1'h1):(1'h1)];
    end
  assign wire139 = wire131[(4'hd):(1'h1)];
endmodule

module module82
#(parameter param121 = {({(((8'h9f) + (8'hae)) ~^ {(8'ha5)})} ? ((((8'hbd) ? (8'ha9) : (8'hbd)) ? (^(8'hba)) : ((8'hb0) ^~ (8'ha4))) < ((~^(8'hbc)) + ((7'h44) ? (8'h9f) : (8'hbb)))) : (^((8'ha4) || ((8'hb3) < (8'hbb)))))})
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire87;
  input wire signed [(4'hd):(1'h0)] wire86;
  input wire [(4'hc):(1'h0)] wire85;
  input wire [(2'h2):(1'h0)] wire84;
  input wire [(5'h12):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire120;
  wire [(4'hf):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(2'h2):(1'h0)] wire88;
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire114,
                 wire113,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire90,
                 wire89,
                 wire88,
                 reg117,
                 reg116,
                 reg115,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire88 = (|((-$unsigned((wire87 ?
                      (7'h41) : wire84))) <= (wire83 || wire86)));
  assign wire89 = (~&wire86);
  assign wire90 = (((({wire83, wire84} ^~ (wire89 ? wire83 : (8'ha5))) ?
                          (+$unsigned(wire89)) : $unsigned((wire88 + (8'hb0)))) ?
                      (!$unsigned({wire88,
                          wire87})) : $signed(((wire86 << (8'h9e)) || ((8'ha4) + wire83)))) | (wire87[(2'h3):(1'h0)] ?
                      ((wire83[(4'ha):(3'h7)] ?
                          wire88[(2'h2):(1'h0)] : $unsigned(wire87)) <= $unsigned($unsigned(wire83))) : wire87[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      if ((~&$signed(((wire88[(1'h0):(1'h0)] ?
              wire85 : ((7'h44) ? wire89 : wire83)) ?
          wire87[(2'h2):(1'h1)] : $unsigned($unsigned(wire86))))))
        begin
          reg91 <= ((!wire88) < (wire83[(3'h4):(2'h3)] <<< $signed($unsigned(wire83[(4'hb):(4'h9)]))));
          if ((~&$unsigned((8'hb0))))
            begin
              reg92 <= wire87[(1'h0):(1'h0)];
              reg93 <= (($unsigned($signed($signed(wire89))) & reg91) - wire89[(2'h3):(2'h3)]);
              reg94 <= (($unsigned(((~^wire89) * (~&reg91))) & wire90[(1'h1):(1'h0)]) ^~ ($signed($unsigned(((7'h42) * wire90))) >> (8'hbd)));
            end
          else
            begin
              reg92 <= (~&(({((8'ha1) >= reg92), reg94[(4'hf):(2'h3)]} ?
                  ((~|wire84) ?
                      (reg94 ? wire88 : (8'ha8)) : (wire85 ?
                          wire89 : wire90)) : $signed((^reg92))) >>> (~&(!wire85))));
              reg93 <= (wire88 ?
                  $signed((^~{{(8'hbc)},
                      reg91})) : (-$signed($signed($signed(reg91)))));
              reg94 <= reg91[(3'h7):(3'h6)];
              reg95 <= ((wire90[(3'h4):(1'h0)] < ($signed((&reg92)) <= (~|(reg92 != wire86)))) ?
                  ((reg91 <<< $signed($unsigned(wire86))) + wire85) : ($signed((8'hb8)) < $signed(($signed(wire83) > wire89[(4'h8):(2'h3)]))));
              reg96 <= {(($unsigned((wire87 <= wire84)) ^~ {$unsigned(reg92),
                      {wire87,
                          wire83}}) <<< $signed((^~reg93[(2'h2):(2'h2)])))};
            end
          reg97 <= ($signed(reg93) ~^ ((~($unsigned(reg94) || wire88[(2'h2):(2'h2)])) ?
              wire90[(3'h4):(2'h2)] : $unsigned({$unsigned(wire89)})));
        end
      else
        begin
          reg91 <= $signed($signed((~&((wire89 ? reg92 : (8'ha6)) ?
              (+reg97) : wire84[(1'h1):(1'h0)]))));
          reg92 <= (wire88[(1'h0):(1'h0)] ?
              ($unsigned(wire89) != $unsigned(reg93[(1'h1):(1'h0)])) : $signed(wire87));
          reg93 <= (|$signed((8'ha3)));
          reg94 <= ((reg94 ? reg95[(4'hc):(3'h4)] : $unsigned((-(8'hbc)))) ?
              reg96 : ($signed(reg94) > (($unsigned(reg95) >> $signed(wire87)) ^~ $signed(wire90[(2'h3):(1'h0)]))));
        end
    end
  assign wire98 = {$unsigned(($signed((reg93 ?
                          wire90 : wire84)) < (-reg94[(1'h0):(1'h0)])))};
  assign wire99 = (reg97[(3'h7):(2'h2)] - $unsigned({wire85,
                      {{(8'hac), reg93}}}));
  assign wire100 = $unsigned(({$signed($signed(wire83)),
                           (reg91[(4'hb):(1'h0)] ? $signed((8'ha8)) : reg96)} ?
                       (&wire84[(1'h0):(1'h0)]) : (~(!$unsigned((8'hba))))));
  assign wire101 = (reg95 ? (~wire87[(3'h4):(2'h3)]) : $unsigned((8'ha4)));
  assign wire102 = reg96;
  always
    @(posedge clk) begin
      if ($unsigned(wire102[(3'h7):(3'h4)]))
        begin
          if ((!{reg95[(4'h8):(3'h4)], (-wire84)}))
            begin
              reg103 <= $unsigned($signed($signed($unsigned((wire86 ?
                  wire87 : (8'hb0))))));
              reg104 <= {wire101[(1'h1):(1'h0)],
                  ({$signed(wire99),
                          (wire84[(2'h2):(1'h0)] & wire84[(1'h0):(1'h0)])} ?
                      {wire99} : ($unsigned($unsigned(wire99)) >> wire89[(2'h2):(1'h1)]))};
              reg105 <= ({reg96} ?
                  ((7'h43) ?
                      (((^~reg91) != ((8'ha8) ?
                          wire102 : reg97)) >> $signed((wire86 ^ reg93))) : wire100) : (wire99 ?
                      wire84[(1'h1):(1'h0)] : $signed(((wire100 ?
                              (8'hb8) : wire86) ?
                          (wire99 ? reg95 : reg95) : (~(8'hae))))));
            end
          else
            begin
              reg103 <= ((reg104[(2'h2):(1'h1)] >= $unsigned($signed({wire98}))) ?
                  ($signed((wire83[(2'h2):(1'h1)] ?
                      $unsigned(wire88) : wire83[(2'h2):(1'h0)])) >= wire100) : (~(reg97 ?
                      {(wire101 > wire101), $signed(reg92)} : reg92)));
              reg104 <= (^~wire88);
              reg105 <= (($signed(((8'h9f) | reg95)) < reg96) * $unsigned($unsigned($unsigned(wire85))));
              reg106 <= $signed($signed($signed({(wire101 ? (8'h9e) : (8'had)),
                  $signed(wire100)})));
            end
          if ($signed($unsigned((($signed(wire102) ?
              reg105 : (reg95 + reg104)) | $unsigned((&(8'hbb)))))))
            begin
              reg107 <= wire87;
              reg108 <= $unsigned(($unsigned(((!wire83) ^~ wire87[(2'h2):(1'h1)])) ?
                  $unsigned($signed((reg94 ?
                      reg97 : wire88))) : $signed(wire100[(3'h5):(2'h3)])));
            end
          else
            begin
              reg107 <= (~|{($signed({reg92}) ?
                      ((7'h40) ?
                          reg96 : reg108[(2'h2):(1'h0)]) : $signed({reg104})),
                  (((reg106 ? reg94 : wire100) < $unsigned(wire102)) ?
                      ($unsigned(wire102) ?
                          wire83 : wire83[(4'hd):(3'h7)]) : ($unsigned(reg106) ?
                          wire90[(3'h5):(3'h5)] : (!reg97)))});
              reg108 <= $unsigned(reg107);
            end
          reg109 <= $signed(reg106);
          reg110 <= ({$unsigned(reg94),
              $unsigned($signed({(8'ha0), reg95}))} < (wire86[(3'h6):(1'h0)] ?
              ((~((8'haa) | wire100)) > (8'h9f)) : (&($signed(reg93) | {(8'hb5),
                  wire85}))));
        end
      else
        begin
          reg103 <= reg103;
          reg104 <= $signed(((~{(&reg107)}) ?
              (~&((~wire100) ?
                  $unsigned(wire102) : wire88[(1'h0):(1'h0)])) : ($signed((8'hb3)) ?
                  (|wire88) : (&reg105[(3'h4):(1'h1)]))));
          if ((+(($signed((reg108 | wire84)) ?
              (~|$unsigned(reg109)) : $unsigned((wire98 ?
                  reg106 : reg92))) > wire100)))
            begin
              reg105 <= $signed(reg107);
            end
          else
            begin
              reg105 <= reg92;
              reg106 <= (7'h41);
              reg107 <= ((&wire99[(5'h13):(4'hd)]) != $unsigned((reg97 < {$unsigned(wire100),
                  (wire85 ? wire102 : reg95)})));
              reg108 <= $unsigned((wire100 ?
                  (8'ha9) : ((~(wire100 < reg107)) ?
                      reg107[(3'h5):(2'h2)] : $signed((reg94 ?
                          reg109 : wire88)))));
            end
        end
      reg111 <= reg94;
      reg112 <= wire83;
    end
  assign wire113 = (|(8'h9f));
  assign wire114 = $signed($unsigned(wire102));
  always
    @(posedge clk) begin
      reg115 <= (!$signed(wire87));
      reg116 <= (+wire88[(1'h0):(1'h0)]);
      reg117 <= (wire100[(3'h5):(2'h2)] >= ((wire101 ?
              ($unsigned(wire87) <= $signed(wire101)) : ((wire99 ?
                      reg112 : wire114) ?
                  reg91 : $unsigned(wire84))) ?
          (($signed(wire83) && $unsigned(wire114)) ?
              (~^$signed(reg107)) : (8'hbe)) : ($unsigned(wire83[(4'h9):(1'h0)]) + $unsigned(wire84))));
    end
  assign wire118 = reg103[(1'h0):(1'h0)];
  assign wire119 = {(((~|reg115[(1'h0):(1'h0)]) <<< {wire84,
                           (+(7'h41))}) != ($signed((wire90 * reg94)) == reg91)),
                       reg108};
  assign wire120 = wire83;
endmodule
