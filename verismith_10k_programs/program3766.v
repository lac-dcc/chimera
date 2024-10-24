module top
#(parameter param193 = (((8'ha2) ? ((((8'hb7) & (8'hae)) ? ((8'hb8) == (8'hb3)) : {(8'h9e)}) ? ((7'h40) ^ {(8'hbd), (7'h40)}) : ({(8'h9e), (8'had)} ? (~&(8'h9e)) : {(8'ha6)})) : ((((8'h9c) > (8'hac)) ? (-(8'haa)) : ((8'ha1) & (8'h9d))) ? (((8'ha6) <= (8'ha9)) >= ((8'ha2) <<< (8'hbe))) : ((|(8'hb4)) ^~ (~|(8'h9f))))) ? (-(^~(((8'h9e) ? (8'ha5) : (7'h43)) ? (!(8'had)) : ((8'h9f) ? (8'hb3) : (7'h41))))) : {((^((8'h9c) ? (8'hbd) : (8'h9d))) ? ((8'h9e) ? ((8'hbb) ? (8'hba) : (8'ha1)) : ((8'hbc) != (8'ha6))) : ({(8'hb3)} && ((8'hb3) <<< (8'hb3)))), ((((8'hb4) << (8'hb9)) ~^ {(8'hb0)}) << {((8'hb2) ? (8'hb0) : (8'hba)), {(7'h44), (8'ha5)}})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire189;
  wire [(4'hd):(1'h0)] wire187;
  wire signed [(5'h15):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire191;
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  assign y = {wire189,
                 wire187,
                 wire73,
                 wire191,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 (1'h0)};
  module4 #() modinst74 (wire73, clk, wire2, wire0, wire1, wire3, (8'hbe));
  always
    @(posedge clk) begin
      reg75 <= (&(wire1 >>> $unsigned(wire3)));
      reg76 <= $signed((({wire0, $signed(wire2)} ?
          ((reg75 ? wire0 : reg75) ?
              (~|wire73) : (!wire73)) : (^~(wire1 != reg75))) <<< {(^~wire3)}));
      reg77 <= wire73;
      reg78 <= (~((^reg77) ?
          (reg76[(4'hd):(2'h3)] ~^ (!(wire73 ?
              reg75 : reg76))) : (!(~&$unsigned(wire73)))));
    end
  module79 #() modinst188 (.wire80(wire73), .clk(clk), .wire83(wire1), .wire84(reg76), .y(wire187), .wire81(reg78), .wire82(reg75));
  module137 #() modinst190 (.wire140(reg78), .wire138(wire1), .clk(clk), .wire139(wire2), .y(wire189), .wire141(wire73));
  module137 #() modinst192 (.clk(clk), .wire139(reg78), .wire141(wire187), .wire140(wire1), .y(wire191), .wire138(wire3));
endmodule

module module79
#(parameter param186 = ((8'hac) & (-({((8'h9d) >>> (8'hb6)), (^(8'hbd))} ? ((~|(7'h40)) ? (-(8'ha9)) : ((8'hb4) << (7'h42))) : (((8'hb6) ? (8'h9f) : (7'h42)) != {(8'hba), (8'hb5)})))))
(y, clk, wire80, wire81, wire82, wire83, wire84);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire80;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire [(5'h10):(1'h0)] wire83;
  input wire signed [(5'h11):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire185;
  wire signed [(4'ha):(1'h0)] wire171;
  wire signed [(4'he):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire168;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire135;
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg181 = (1'h0);
  reg [(4'hb):(1'h0)] reg180 = (1'h0);
  reg [(4'hf):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg174 = (1'h0);
  reg [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(5'h10):(1'h0)] reg172 = (1'h0);
  assign y = {wire185,
                 wire171,
                 wire170,
                 wire168,
                 wire85,
                 wire86,
                 wire135,
                 reg184,
                 reg183,
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
                 (1'h0)};
  assign wire85 = wire82[(5'h11):(4'he)];
  assign wire86 = {$signed((($signed((8'h9c)) ?
                          (~^(8'had)) : (wire81 ?
                              wire84 : wire84)) != $unsigned($signed((8'hac))))),
                      ($signed(wire85[(1'h0):(1'h0)]) <<< (~&(wire80 <<< (~^wire83))))};
  module87 #() modinst136 (.y(wire135), .wire88(wire86), .clk(clk), .wire92(wire84), .wire89(wire83), .wire90(wire85), .wire91(wire81));
  module137 #() modinst169 (wire168, clk, wire86, wire135, wire85, wire82);
  assign wire170 = (~$unsigned(($signed(((8'hb6) ? wire85 : wire85)) ?
                       wire84 : $unsigned($signed(wire86)))));
  assign wire171 = $signed($unsigned(wire81));
  always
    @(posedge clk) begin
      if (wire171[(4'h9):(4'h8)])
        begin
          reg172 <= (($signed({{(7'h41), wire135}}) ?
                  $unsigned(wire80[(2'h3):(1'h1)]) : $unsigned(wire170)) ?
              ((8'hb8) >>> $signed((&$signed(wire168)))) : ((wire83[(4'h9):(4'h9)] * $unsigned($signed(wire84))) * wire84[(4'h9):(3'h4)]));
          reg173 <= ((wire135 ?
                  $signed(wire85[(4'ha):(1'h0)]) : wire83[(2'h2):(2'h2)]) ?
              wire84[(3'h6):(1'h0)] : (wire171[(3'h4):(1'h1)] ?
                  $unsigned({wire171, {wire82}}) : (^((wire86 ?
                      reg172 : (8'ha6)) <<< (wire84 << (8'hb9))))));
          if ($unsigned(wire81[(2'h2):(1'h0)]))
            begin
              reg174 <= ((!wire171[(2'h3):(1'h1)]) ?
                  $signed(wire81) : wire170[(4'hd):(4'ha)]);
              reg175 <= {wire83};
            end
          else
            begin
              reg174 <= wire84[(1'h1):(1'h0)];
            end
          reg176 <= ($signed((|wire84)) + $signed((wire171[(1'h0):(1'h0)] & ((wire85 ?
              wire81 : wire135) >= (~|wire83)))));
        end
      else
        begin
          if ((7'h42))
            begin
              reg172 <= ($signed({$signed($unsigned(reg172)),
                      (+(wire135 && wire135))}) ?
                  reg173[(4'hf):(4'h8)] : wire83);
              reg173 <= (&(~^(+$unsigned($signed((8'ha0))))));
              reg174 <= $unsigned((((wire135[(5'h11):(4'hf)] + (wire84 ?
                          wire84 : reg174)) ?
                      $unsigned({(8'hb3)}) : $unsigned(((8'hb7) ?
                          reg173 : reg172))) ?
                  ($unsigned($signed(wire84)) < ((reg176 ~^ wire85) < $unsigned(wire85))) : wire80[(2'h2):(1'h1)]));
            end
          else
            begin
              reg172 <= reg175;
            end
          if ($unsigned(((wire83 ? $unsigned((wire171 & wire82)) : reg173) ?
              (wire83 ?
                  $signed(wire135) : $signed($signed(wire80))) : wire85[(3'h6):(3'h5)])))
            begin
              reg175 <= {wire81[(5'h10):(4'hc)],
                  (($unsigned($signed(wire81)) - reg172[(2'h2):(1'h0)]) ?
                      wire84 : $unsigned(reg175[(3'h6):(3'h4)]))};
            end
          else
            begin
              reg175 <= {wire171,
                  {wire80[(2'h3):(1'h1)], (|$unsigned((~wire82)))}};
              reg176 <= reg173[(4'hd):(1'h0)];
              reg177 <= $unsigned(reg172[(4'h8):(4'h8)]);
              reg178 <= (~^wire84);
              reg179 <= wire171[(3'h6):(1'h1)];
            end
          reg180 <= wire135[(1'h1):(1'h1)];
        end
      reg181 <= (+$signed((~^$signed(wire171))));
      reg182 <= $signed((reg181 ^~ $unsigned(reg173[(4'hd):(2'h2)])));
      reg183 <= $signed($unsigned(($signed((reg176 ?
          wire85 : wire80)) != {wire81})));
      reg184 <= (wire81[(3'h7):(3'h6)] ~^ $unsigned(reg177[(2'h3):(2'h2)]));
    end
  assign wire185 = {$unsigned(wire80[(1'h0):(1'h0)]),
                       $unsigned($unsigned(((~(8'ha9)) ~^ (wire80 ?
                           wire135 : reg173))))};
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire5;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire68;
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire10,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire35,
                 wire37,
                 wire68,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = (~$signed($signed(wire6)));
  always
    @(posedge clk) begin
      reg11 <= wire8;
      reg12 <= wire9[(2'h2):(2'h2)];
    end
  assign wire13 = reg11[(4'h8):(1'h1)];
  assign wire14 = reg11;
  assign wire15 = $unsigned(((^~$signed($unsigned((7'h44)))) != $unsigned(wire7)));
  assign wire16 = wire9;
  assign wire17 = $unsigned(({$signed({wire16})} ?
                      $signed($signed({(8'hb2)})) : ($signed((~wire16)) ?
                          (wire14[(3'h7):(3'h6)] ?
                              reg12 : (wire15 >> wire8)) : reg12)));
  assign wire18 = wire14[(3'h6):(1'h1)];
  assign wire19 = wire5;
  assign wire20 = wire15;
  module21 #() modinst36 (wire35, clk, wire19, wire8, wire13, wire10);
  assign wire37 = $unsigned($signed($unsigned(wire10)));
  module38 #() modinst69 (.wire42(wire37), .wire39(wire5), .y(wire68), .wire40(wire19), .wire41(wire7), .wire43(wire10), .clk(clk));
  assign wire70 = $unsigned({(wire9[(3'h7):(3'h5)] && $unsigned((&wire37))),
                      $unsigned(wire35[(2'h2):(1'h1)])});
  assign wire71 = wire6[(3'h5):(2'h2)];
  assign wire72 = (&$signed((({wire35, reg11} ?
                          wire7[(2'h3):(1'h0)] : (wire70 >= wire70)) ?
                      wire68[(4'hc):(3'h4)] : (((8'hb8) << wire19) >= $signed(wire19)))));
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire43;
  input wire [(4'h9):(1'h0)] wire42;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire signed [(5'h10):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg49,
                 (1'h0)};
  assign wire44 = $unsigned((~(~(^~(!wire41)))));
  assign wire45 = $unsigned(wire40[(3'h7):(3'h5)]);
  assign wire46 = $unsigned(wire42);
  assign wire47 = (wire41[(1'h1):(1'h1)] >>> wire43[(4'h9):(2'h3)]);
  assign wire48 = (~|(((+wire44[(3'h6):(1'h0)]) || (wire44 * wire46[(5'h11):(4'hd)])) || ($unsigned((8'ha5)) ?
                      wire44[(4'he):(3'h7)] : $unsigned(wire42[(4'h8):(1'h1)]))));
  always
    @(posedge clk) begin
      if (($unsigned($unsigned($signed((8'ha3)))) + wire40[(4'h8):(4'h8)]))
        begin
          reg49 <= wire42;
        end
      else
        begin
          reg49 <= wire41;
        end
    end
  assign wire50 = $unsigned({{wire40[(4'hf):(2'h2)], $signed((^~wire46))}});
  assign wire51 = $signed(($signed({$unsigned(wire47)}) - wire44[(4'ha):(4'h9)]));
  assign wire52 = $unsigned(wire50);
  assign wire53 = $unsigned($unsigned((~(~&{wire47, wire42}))));
  assign wire54 = (($unsigned($signed((^~wire42))) << wire40) >= $signed($signed($signed($signed(wire46)))));
  assign wire55 = ({$unsigned((|$unsigned((8'ha8)))),
                      ((!(wire54 ?
                          wire54 : wire51)) == (~&$signed(wire48)))} || $signed((((reg49 >>> wire41) <<< (wire53 ?
                          wire51 : wire47)) ?
                      $unsigned(wire54) : $unsigned($signed(wire40)))));
  assign wire56 = ((wire46 ?
                      $signed(wire50) : {(~(wire43 && wire51))}) >= $signed({wire50,
                      wire44[(4'hb):(2'h3)]}));
  always
    @(posedge clk) begin
      reg57 <= (^$unsigned((wire39 < $unsigned(wire40[(4'ha):(3'h7)]))));
      reg58 <= {wire47};
      reg59 <= (&wire50[(3'h4):(2'h3)]);
      if ($unsigned(($unsigned($unsigned($signed(reg57))) & wire39[(1'h1):(1'h1)])))
        begin
          reg60 <= (wire44[(4'hb):(2'h2)] < wire51);
        end
      else
        begin
          reg60 <= {$signed(({(^wire53),
                  (^~wire56)} ^~ $unsigned($unsigned(wire43)))),
              $unsigned($signed(((wire48 == wire47) * $unsigned(wire47))))};
          reg61 <= wire44[(4'hc):(3'h6)];
        end
      reg62 <= {{wire47[(3'h7):(1'h0)]}};
    end
  assign wire63 = {({{(~reg61)}} ? wire52 : wire50)};
  assign wire64 = ($unsigned((wire40[(4'hb):(2'h2)] >> (~|reg60[(4'h8):(3'h6)]))) ?
                      $unsigned((wire48 >= ((wire39 << wire63) ^ reg49))) : reg58);
  assign wire65 = ($unsigned(wire44) ?
                      (wire63 * wire41[(4'hb):(3'h5)]) : $unsigned($signed($signed(wire54[(3'h7):(2'h3)]))));
  assign wire66 = $unsigned(wire47[(3'h6):(3'h6)]);
  assign wire67 = {$unsigned((wire64 ?
                          $signed(wire53[(1'h1):(1'h1)]) : $signed((wire43 + wire56)))),
                      (8'ha4)};
endmodule

module module21
#(parameter param34 = (((((^(8'hb0)) ? ((8'haf) ? (8'hb5) : (8'hba)) : ((8'haf) ? (8'hb1) : (8'haa))) * ({(8'hbd), (7'h42)} ? ((8'h9f) ? (8'hb7) : (8'h9d)) : {(8'hbf), (7'h42)})) ? ({{(8'h9e), (8'ha6)}, ((8'hb1) || (8'ha1))} == (((8'hb1) ? (8'h9f) : (8'hae)) << ((8'hb7) ? (8'hb9) : (8'hac)))) : (!(~^(&(8'hb0))))) >> ({(~|((8'hbf) ? (8'hb9) : (8'hb7))), {(!(8'ha7))}} && ({(|(8'hac))} ? (((8'h9d) ? (8'ha7) : (8'ha1)) ~^ {(7'h40), (8'hb2)}) : (~&(+(8'hb5)))))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire [(4'hd):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire26 = wire25;
  assign wire27 = $signed(((wire24[(4'h9):(4'h9)] ?
                      wire25 : wire26) + {($signed(wire24) ?
                          (wire23 > wire22) : (wire26 ? wire25 : wire25)),
                      $unsigned((wire22 ? wire25 : wire22))}));
  assign wire28 = $unsigned(($signed($signed((&wire23))) | $unsigned($signed($signed(wire27)))));
  assign wire29 = $unsigned($signed((!$signed($unsigned(wire24)))));
  assign wire30 = $unsigned(wire28);
  always
    @(posedge clk) begin
      reg31 <= $signed(wire26);
      reg32 <= wire25;
      reg33 <= $signed($unsigned(reg31));
    end
endmodule

module module137
#(parameter param166 = (&((~&(|(7'h40))) || (8'hb0))), 
parameter param167 = param166)
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire141;
  input wire signed [(5'h13):(1'h0)] wire140;
  input wire signed [(3'h6):(1'h0)] wire139;
  input wire [(5'h13):(1'h0)] wire138;
  wire [(4'hc):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire164;
  wire [(3'h4):(1'h0)] wire163;
  wire [(5'h15):(1'h0)] wire156;
  wire signed [(5'h10):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire154;
  wire [(3'h6):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire149;
  wire signed [(4'hf):(1'h0)] wire148;
  wire signed [(5'h10):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire142;
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire142 = $signed((wire138 ? wire140[(3'h4):(2'h3)] : (8'hb2)));
  assign wire143 = $signed(($signed($signed($unsigned(wire139))) ?
                       (((wire141 || wire140) - (wire142 || wire142)) ?
                           (~&(wire141 & (8'ha2))) : wire138) : wire139));
  assign wire144 = wire139[(1'h1):(1'h0)];
  assign wire145 = (|{wire143, wire138[(4'hf):(2'h2)]});
  assign wire146 = $unsigned((~&wire144[(3'h6):(3'h5)]));
  assign wire147 = wire146;
  assign wire148 = $signed((((^~$unsigned(wire139)) ?
                       ({(8'ha9), wire139} ?
                           wire144 : (^wire145)) : (^~$unsigned(wire145))) - $signed($signed($signed(wire140)))));
  assign wire149 = $signed(wire139[(3'h5):(3'h4)]);
  assign wire150 = (!($unsigned($signed(wire145[(1'h0):(1'h0)])) <<< $signed((+(|wire143)))));
  assign wire151 = (8'hbf);
  assign wire152 = (~($unsigned(((wire141 ? wire148 : wire151) & (wire141 ?
                           wire139 : wire144))) ?
                       {wire140[(2'h3):(1'h1)],
                           $signed((~&wire142))} : (wire148[(4'h8):(2'h2)] ?
                           $unsigned((|(8'hb1))) : wire144[(1'h0):(1'h0)])));
  assign wire153 = wire152;
  assign wire154 = wire151[(2'h3):(1'h0)];
  assign wire155 = $signed(((8'h9d) ~^ (~^{(wire146 ? wire151 : wire147)})));
  assign wire156 = $signed((~^((8'ha1) ?
                       ((8'hb4) || wire140[(5'h10):(4'hb)]) : ($signed(wire155) ?
                           $unsigned(wire145) : {wire151}))));
  always
    @(posedge clk) begin
      if ((^~(~^((wire154[(1'h1):(1'h1)] ?
          ((7'h42) ? wire143 : wire141) : (wire145 ?
              wire150 : wire143)) <<< ((wire150 ?
          wire145 : wire139) | (wire141 ? (8'ha0) : (7'h40)))))))
        begin
          reg157 <= {wire150[(3'h4):(1'h0)],
              $signed((!$signed((wire146 ? wire140 : wire140))))};
        end
      else
        begin
          reg157 <= $signed((wire140 ?
              $unsigned((wire152 >>> $signed((8'ha1)))) : ($unsigned((wire147 != wire141)) ?
                  (^{wire146, wire142}) : wire155)));
          reg158 <= $signed(wire143);
        end
    end
  always
    @(posedge clk) begin
      reg159 <= (~($signed(($unsigned(wire155) ^~ $signed((8'hbd)))) ?
          (((reg157 >>> wire148) <<< wire151) ?
              (reg158 + (^~wire143)) : ({wire150} <<< wire138)) : wire144[(4'h8):(3'h5)]));
      reg160 <= $unsigned((+($signed((~&wire148)) | $signed(((7'h42) ?
          reg157 : wire152)))));
      reg161 <= $signed(((&$signed((~reg157))) ?
          (8'hb4) : (((wire140 > wire140) ?
              wire153[(1'h1):(1'h1)] : (wire154 ?
                  wire147 : wire149)) >= wire139)));
      reg162 <= (^$signed({({wire154} ^ ((7'h42) + wire148))}));
    end
  assign wire163 = wire139[(1'h1):(1'h0)];
  assign wire164 = $signed((~|reg161));
  assign wire165 = $unsigned({{($unsigned(wire138) ?
                               (~|wire164) : $unsigned(reg162))}});
endmodule

module module87
#(parameter param133 = (8'hbe), 
parameter param134 = (({param133} >> ((~(param133 >> (8'hbc))) >= ((!(8'hbd)) ? ((8'hb0) ? param133 : param133) : param133))) ^~ {((~(param133 != param133)) * (~^(&param133))), param133}))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire92;
  input wire [(5'h13):(1'h0)] wire91;
  input wire signed [(4'hd):(1'h0)] wire90;
  input wire [(5'h10):(1'h0)] wire89;
  input wire [(4'hd):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  wire signed [(2'h2):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire121;
  wire [(3'h7):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire93;
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire122,
                 wire121,
                 wire106,
                 wire105,
                 wire101,
                 wire100,
                 wire95,
                 wire94,
                 wire93,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg104,
                 reg103,
                 reg102,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire93 = (~^($signed((+wire91)) ?
                      ($signed(wire90[(4'ha):(2'h2)]) || wire89) : (8'h9e)));
  assign wire94 = $unsigned($signed(wire90[(3'h7):(3'h7)]));
  assign wire95 = $signed($unsigned((((~|wire91) ? wire93 : $signed(wire88)) ?
                      wire91 : (wire89[(3'h6):(1'h0)] >= $unsigned(wire92)))));
  always
    @(posedge clk) begin
      reg96 <= $signed(($signed((|(wire91 >= wire90))) ?
          $unsigned(((^(8'hb0)) <= $signed((8'hbb)))) : $signed({$signed((8'hb5))})));
      reg97 <= ((-wire92[(1'h0):(1'h0)]) || wire90);
      reg98 <= ((8'h9d) ?
          ($unsigned(wire92[(1'h1):(1'h1)]) ?
              $signed((wire90 ?
                  {wire93} : $unsigned(wire90))) : $unsigned(((wire90 >> wire93) ?
                  wire88[(4'hc):(4'hc)] : $signed((8'hb9))))) : (~&{((wire94 >= wire94) ?
                  $signed(wire90) : (reg96 | wire92)),
              $unsigned((wire88 >= wire88))}));
      reg99 <= wire90;
    end
  assign wire100 = wire91;
  assign wire101 = (+(~&(~&(((8'hba) ?
                       reg98 : wire100) < (wire89 || (8'h9d))))));
  always
    @(posedge clk) begin
      reg102 <= $unsigned({{wire94[(3'h4):(3'h4)],
              ($unsigned(wire91) > ((7'h42) ? wire94 : (8'hbd)))}});
      reg103 <= wire100;
      reg104 <= (&{$unsigned(($signed(reg102) | (wire89 ? reg103 : wire92)))});
    end
  assign wire105 = (wire90 ?
                       (((wire94[(2'h3):(1'h0)] ?
                           (wire88 ?
                               wire89 : wire90) : $unsigned(wire89)) < $unsigned(wire89[(4'hc):(3'h5)])) <= reg103) : ((8'hae) ^ $unsigned($signed($unsigned((8'hbd))))));
  assign wire106 = ((reg97 ?
                       ({$signed(wire101), (8'h9c)} ?
                           $signed(reg104) : wire94[(3'h6):(1'h0)]) : ($signed(wire88[(2'h3):(2'h3)]) + reg97[(4'h9):(3'h7)])) >> (wire100[(1'h1):(1'h0)] != (((wire95 < reg103) ?
                       (~^(8'ha0)) : wire91[(4'h8):(3'h7)]) ^ wire101[(4'hd):(4'hd)])));
  always
    @(posedge clk) begin
      if ($unsigned(((-{((8'hb3) ? reg102 : (8'hac))}) >> wire93)))
        begin
          if ((|(8'hb7)))
            begin
              reg107 <= $unsigned(reg97);
            end
          else
            begin
              reg107 <= $unsigned({$signed(wire100), reg104});
              reg108 <= wire95[(2'h2):(1'h0)];
              reg109 <= wire91[(1'h1):(1'h0)];
              reg110 <= (~|{((wire93 < reg103[(4'he):(4'he)]) != wire93[(2'h2):(2'h2)])});
            end
        end
      else
        begin
          reg107 <= (~|((wire90 ?
              $unsigned($unsigned((7'h42))) : (~(wire92 - reg108))) > ((7'h41) ?
              {{wire93}} : $unsigned((-wire106)))));
        end
      reg111 <= reg110;
      if ($signed({$signed(($signed((8'hb8)) & $unsigned((8'ha9))))}))
        begin
          reg112 <= ((|($signed(wire92[(1'h0):(1'h0)]) - (+$signed(wire95)))) ?
              $unsigned({$unsigned((!wire100))}) : ((reg107[(2'h2):(1'h1)] < (reg111 ?
                  reg99[(4'he):(4'hb)] : ((8'ha5) && (8'hb0)))) >= ($unsigned((wire105 > wire106)) ?
                  wire90[(4'h8):(4'h8)] : (~|(wire91 & reg108)))));
        end
      else
        begin
          reg112 <= reg109[(5'h10):(2'h3)];
          reg113 <= ($signed(reg109) ?
              (reg103 ?
                  $unsigned($signed(((8'hbb) ?
                      wire101 : (8'hb2)))) : (!((^~wire100) ?
                      wire93 : wire90))) : (~|(wire93[(1'h1):(1'h1)] ?
                  $signed((&reg109)) : $unsigned(wire95[(1'h0):(1'h0)]))));
          reg114 <= ({(($unsigned(reg98) & {reg110, reg109}) ?
                      wire93 : $signed($signed(reg99))),
                  $signed(((&wire100) ? (~&(8'h9f)) : $signed(reg109)))} ?
              wire100 : (reg96[(4'h9):(4'h9)] ?
                  reg107 : $signed((+$unsigned(reg96)))));
          reg115 <= reg96;
          if (wire105[(1'h0):(1'h0)])
            begin
              reg116 <= (reg104[(1'h0):(1'h0)] - $unsigned($unsigned($signed(reg98[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg116 <= $unsigned(reg103);
              reg117 <= $signed((^(+{$unsigned(wire90), wire89})));
              reg118 <= $signed(((reg114[(3'h4):(2'h2)] >>> (reg112[(3'h7):(2'h2)] >= wire95)) <<< $signed($signed((reg111 || wire94)))));
              reg119 <= $signed(reg102[(4'h9):(2'h3)]);
              reg120 <= $unsigned(reg108[(2'h3):(1'h1)]);
            end
        end
    end
  assign wire121 = $unsigned((~^reg103));
  assign wire122 = $unsigned(((~&wire91) ?
                       ((wire91 >= $signed(reg118)) < ((+reg96) ?
                           $signed(reg118) : (!(8'ha9)))) : $unsigned((!(wire89 >>> reg107)))));
  always
    @(posedge clk) begin
      reg123 <= reg117;
      reg124 <= ($signed((^~$unsigned((reg104 ?
          reg109 : reg112)))) ^~ ($signed(reg110) ?
          ({(~^(8'hab))} <<< $signed((~wire88))) : $unsigned((((8'hab) == reg98) ?
              $unsigned((8'hb7)) : {reg96}))));
      reg125 <= ((wire90 && {wire91[(4'hc):(3'h6)],
          $signed($unsigned(reg120))}) ~^ (~&wire106));
      reg126 <= wire93[(1'h1):(1'h1)];
    end
  assign wire127 = reg118[(1'h0):(1'h0)];
  assign wire128 = ((^~$signed((~^reg103[(1'h1):(1'h0)]))) ?
                       $signed(($signed(wire121[(4'h8):(3'h7)]) ^ $unsigned((~&reg125)))) : $signed(reg108));
  assign wire129 = wire121[(4'hf):(4'h8)];
  assign wire130 = ($signed(wire100) ^~ $signed($signed(reg109)));
  assign wire131 = wire121;
  assign wire132 = reg108[(1'h0):(1'h0)];
endmodule
