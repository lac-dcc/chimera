module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire128;
  wire [(5'h14):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire79;
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire123,
                 wire122,
                 wire121,
                 wire108,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 reg125,
                 reg124,
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
                 (1'h0)};
  module4 #() modinst80 (.wire7(wire2), .wire8(wire3), .clk(clk), .wire6(wire0), .y(wire79), .wire5(wire1));
  assign wire81 = ($signed(($unsigned({wire0,
                      wire2}) - wire0)) || (~((~&(~wire0)) - $unsigned($signed(wire1)))));
  assign wire82 = wire81[(3'h4):(2'h2)];
  assign wire83 = $unsigned($unsigned({$unsigned(wire81), $signed(wire0)}));
  assign wire84 = $unsigned(($unsigned($unsigned((wire0 ^ wire2))) ?
                      $signed($signed($signed(wire3))) : (wire1 ?
                          {wire82[(5'h15):(5'h13)],
                              $unsigned(wire81)} : $signed({wire82,
                              (8'had)}))));
  assign wire85 = wire0[(2'h3):(2'h3)];
  assign wire86 = {wire82[(4'he):(2'h3)], wire85[(2'h3):(1'h0)]};
  assign wire87 = ($unsigned(wire82[(1'h0):(1'h0)]) <= {wire79,
                      (wire81[(1'h1):(1'h1)] ?
                          wire81[(1'h1):(1'h0)] : ((wire82 ? (8'ha4) : wire86) ?
                              $unsigned((8'hbf)) : $signed(wire0)))});
  assign wire88 = wire83;
  module89 #() modinst109 (wire108, clk, wire79, wire86, wire2, wire87);
  always
    @(posedge clk) begin
      reg110 <= (-wire3);
      if (wire82)
        begin
          reg111 <= $signed(wire0[(3'h5):(3'h4)]);
          reg112 <= $signed($unsigned($unsigned(wire0[(4'h8):(1'h0)])));
        end
      else
        begin
          if ({(wire79[(3'h6):(2'h3)] ? $unsigned(reg110) : {(&{wire2})})})
            begin
              reg111 <= $signed(wire3);
              reg112 <= (~&wire2);
              reg113 <= ($signed(wire1) > (reg112 ?
                  (reg112 ?
                      (~|wire108) : wire84[(2'h2):(1'h1)]) : wire3[(5'h11):(3'h7)]));
            end
          else
            begin
              reg111 <= wire81[(1'h0):(1'h0)];
              reg112 <= ({(~&{wire86[(3'h4):(1'h1)]})} ?
                  {$unsigned(({wire83} ?
                          (reg110 ? wire108 : wire87) : (wire2 ?
                              (8'h9c) : wire1)))} : $unsigned($unsigned($signed(wire79[(1'h1):(1'h0)]))));
              reg113 <= ($unsigned(($signed((wire0 ? wire0 : wire81)) ?
                      ($signed(wire81) ?
                          wire83 : $signed(wire82)) : wire2[(5'h11):(4'ha)])) ?
                  $unsigned((reg112 - $unsigned(wire81[(4'h9):(2'h2)]))) : (~|wire1[(3'h7):(1'h1)]));
              reg114 <= ($unsigned({(|(8'haa)),
                  reg110[(4'h9):(3'h5)]}) - wire2[(2'h3):(1'h0)]);
              reg115 <= (((($signed(wire2) < $signed(wire3)) && $signed($signed(wire0))) ?
                  $unsigned($signed(reg114)) : reg113) > {reg111});
            end
          reg116 <= wire81;
          reg117 <= wire84[(2'h2):(1'h1)];
        end
      reg118 <= wire0[(3'h6):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg119 <= $unsigned((8'hb0));
      reg120 <= {$signed($unsigned(reg115[(5'h14):(3'h7)])),
          ((~|wire83) ?
              $unsigned($signed($signed(wire87))) : $unsigned(($unsigned(reg117) >> (wire83 ?
                  reg112 : wire79))))};
    end
  assign wire121 = (wire81 ? (^wire108[(3'h7):(1'h0)]) : reg118[(3'h5):(2'h2)]);
  assign wire122 = $signed({((reg117[(4'he):(1'h1)] ?
                           (reg115 | wire87) : reg113) <<< {wire83})});
  assign wire123 = $signed($unsigned($unsigned({wire1[(2'h2):(1'h1)]})));
  always
    @(posedge clk) begin
      reg124 <= $signed((+reg119));
      reg125 <= $unsigned(((|$unsigned((wire82 == reg119))) ?
          {reg116[(2'h2):(1'h1)],
              $unsigned((wire121 >> wire122))} : ($unsigned((^~(8'hb5))) ?
              wire123 : ((reg111 ? wire3 : (8'h9d)) ?
                  $unsigned(wire88) : wire2[(4'hd):(3'h5)]))));
    end
  assign wire126 = reg111;
  assign wire127 = $unsigned($signed((&wire82[(3'h7):(2'h3)])));
  assign wire128 = (^~($unsigned(($unsigned(reg124) <= {reg124})) << (wire2[(3'h6):(2'h3)] ?
                       ($unsigned(reg112) <= (^wire87)) : $signed(reg120[(1'h0):(1'h0)]))));
  assign wire129 = $unsigned(reg112[(1'h1):(1'h1)]);
  assign wire130 = ({wire81, reg110} ?
                       wire0 : $unsigned(($unsigned(reg118) ?
                           (&wire85[(1'h1):(1'h1)]) : $unsigned($unsigned(wire128)))));
  assign wire131 = ($signed(wire128) >>> ((((wire123 & wire81) == $unsigned((8'h9d))) ?
                       $signed({wire84, wire128}) : ($unsigned(wire85) ?
                           $signed(reg113) : (-reg124))) ^~ $unsigned(($signed(reg116) << $signed((8'hb6))))));
  assign wire132 = $signed($unsigned($unsigned((~&(&wire79)))));
endmodule

module module89
#(parameter param106 = (~^(~&(~&({(8'ha4)} ? (~(8'hae)) : {(7'h44), (8'ha3)})))), 
parameter param107 = (-(~^(^~(((8'ha9) ^ param106) >>> (param106 >= param106))))))
(y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire93;
  input wire signed [(2'h2):(1'h0)] wire92;
  input wire [(4'ha):(1'h0)] wire91;
  input wire [(4'hd):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg94 <= (+$signed((((!(8'hae)) ?
          wire91 : $unsigned(wire93)) < $signed(wire92[(1'h0):(1'h0)]))));
      if ($signed(wire90))
        begin
          reg95 <= $unsigned($signed((wire90 ?
              wire93[(1'h0):(1'h0)] : $signed(wire93))));
          reg96 <= (~^$signed($signed(wire93[(2'h2):(2'h2)])));
        end
      else
        begin
          reg95 <= (~&$signed(wire93));
          reg96 <= ($unsigned({$signed($unsigned((8'hbe))), wire92}) ?
              $signed($signed($signed((wire90 != wire92)))) : reg96);
        end
    end
  assign wire97 = (8'hb4);
  assign wire98 = {($signed((~&(wire92 ?
                          wire92 : (8'hb6)))) << (reg96 >= reg94[(2'h3):(2'h3)])),
                      (reg96[(4'hb):(1'h0)] ~^ ($signed((reg95 ?
                              reg96 : reg94)) ?
                          (!(8'ha3)) : wire92))};
  assign wire99 = ((wire92[(1'h1):(1'h1)] & wire91) ?
                      ($unsigned($unsigned($signed((8'hbf)))) + wire97[(5'h10):(4'ha)]) : wire92[(1'h1):(1'h1)]);
  assign wire100 = wire99[(3'h7):(1'h0)];
  assign wire101 = ({(reg96 > (~^(reg94 + wire90))),
                           (wire93 ?
                               ($signed(reg95) ?
                                   (&wire98) : {reg96}) : {{reg96},
                                   $unsigned(wire93)})} ?
                       {(wire91[(1'h0):(1'h0)] >= ((wire100 ?
                                   wire98 : (8'hb1)) ?
                               $signed(wire100) : (wire98 < wire92))),
                           ((8'hb1) - wire100)} : $signed(($unsigned($unsigned(wire97)) ?
                           (+$signed(wire93)) : (~$signed(reg95)))));
  assign wire102 = ($signed((+$signed(((8'ha4) ? wire92 : wire99)))) ?
                       (~|($signed($signed(reg94)) << $unsigned(wire91))) : (((((7'h41) || wire90) != wire101) ?
                           wire98 : ({reg95} ?
                               $signed((8'had)) : reg94[(1'h0):(1'h0)])) >= {($unsigned((8'hb2)) ?
                               wire93[(2'h2):(1'h1)] : {wire90})}));
  assign wire103 = wire91[(2'h2):(2'h2)];
  assign wire104 = (wire100[(2'h3):(2'h2)] ?
                       $signed({((8'h9c) ?
                               ((8'h9c) < (8'ha8)) : reg96[(2'h3):(2'h2)]),
                           wire92[(1'h0):(1'h0)]}) : (8'hb8));
  assign wire105 = wire90;
endmodule

module module4
#(parameter param77 = (~|((((~&(8'hab)) ? ((8'hb5) - (7'h41)) : (~(8'ha6))) ? (!((8'hb7) >= (8'hb3))) : (((8'h9d) ? (8'haa) : (7'h43)) <= (~|(8'hba)))) <= (^(((8'ha3) < (8'h9e)) > ((8'hb5) >>> (8'had)))))), 
parameter param78 = ((param77 ? (({param77, param77} + param77) ? param77 : {param77, {param77, (8'hbf)}}) : (~^param77)) >>> (^((~&((7'h44) ? param77 : param77)) ^ {(-(8'h9c)), param77}))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire12;
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire12,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= $unsigned($signed((wire7[(3'h4):(2'h3)] <<< $signed(wire7))));
      reg10 <= ({$unsigned((8'haa))} ?
          $signed($signed($unsigned({reg9}))) : (&$signed((wire5[(4'hf):(4'h8)] ?
              (wire8 >> wire8) : (reg9 == wire5)))));
      reg11 <= (($signed($signed($unsigned(reg10))) >> $unsigned((wire7[(3'h5):(2'h3)] ?
          (!wire5) : (reg9 ^ wire5)))) >= wire7[(1'h1):(1'h0)]);
    end
  assign wire12 = wire8[(1'h0):(1'h0)];
  module13 #() modinst70 (.y(wire69), .wire18(wire7), .wire14(wire8), .wire16(reg11), .wire17(reg10), .clk(clk), .wire15(reg9));
  assign wire71 = $signed(wire69[(3'h6):(1'h1)]);
  assign wire72 = wire12[(3'h7):(3'h7)];
  assign wire73 = $unsigned($signed({(&$unsigned(wire8)), (&{reg9, wire6})}));
  assign wire74 = (^$signed(wire73));
  assign wire75 = wire69[(4'hd):(2'h2)];
  assign wire76 = ((-wire71[(1'h1):(1'h1)]) || (wire71[(3'h6):(1'h1)] <<< $signed((wire75 ?
                      $unsigned(reg10) : (wire5 ~^ wire73)))));
endmodule

module module13
#(parameter param68 = (((8'ha1) ? ((!(8'ha5)) <= {((8'hae) + (8'hb4))}) : (~&((7'h42) ? ((8'ha4) << (8'hbf)) : ((8'hb2) * (8'hbe))))) ? (((~&((8'hba) ? (8'ha5) : (7'h42))) >>> (~((8'ha7) ? (8'ha7) : (8'ha9)))) >= ((((8'ha0) ? (8'hb4) : (8'had)) ? {(8'ha7), (8'hac)} : (!(8'h9c))) ^~ (!(~&(8'hb3))))) : (((((8'hb5) ? (8'h9e) : (8'ha3)) ? ((8'ha5) & (8'hba)) : {(7'h41)}) ? ((-(8'hb7)) ? {(8'ha0), (8'ha4)} : ((8'hbc) ^~ (8'hb7))) : {((8'haf) ? (7'h42) : (8'hb8)), (^(8'ha6))}) ? {(~|((8'ha7) != (8'ha6))), {{(7'h41)}}} : {(((8'ha6) ? (8'ha6) : (8'had)) ? ((8'hae) ? (8'ha5) : (8'hac)) : (8'ha7)), {((8'ha6) ? (8'hb1) : (8'hb6))}})))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire33,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 reg49,
                 reg48,
                 reg47,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire19 = (&wire16[(2'h2):(2'h2)]);
  assign wire20 = $signed((wire17 < ((&(wire16 ~^ wire14)) ?
                      $unsigned(wire17[(3'h4):(1'h0)]) : ((|wire19) ^~ (~wire17)))));
  assign wire21 = ($signed((^~({wire18} ? $signed(wire16) : $signed(wire18)))) ?
                      $unsigned($signed(wire17[(1'h0):(1'h0)])) : $unsigned($unsigned(wire19)));
  assign wire22 = wire20;
  assign wire23 = (&((wire18 <= $unsigned({wire17})) ?
                      ($signed({wire21, wire19}) ?
                          $unsigned((wire15 ?
                              wire20 : wire21)) : $signed((+wire16))) : wire22));
  assign wire24 = wire14;
  assign wire25 = (~|$unsigned((+$unsigned((^wire14)))));
  assign wire26 = (!wire15);
  assign wire27 = (^wire26);
  assign wire28 = (((wire24[(4'h9):(3'h7)] & ($signed((8'hbd)) + $signed((8'hac)))) ?
                      wire20 : $signed(((!(8'h9e)) | (wire18 * wire25)))) == $unsigned(wire20[(4'hd):(3'h6)]));
  assign wire29 = $signed(($unsigned(wire25) ?
                      wire17[(1'h0):(1'h0)] : ((wire14[(5'h14):(5'h12)] ~^ $unsigned(wire23)) ?
                          wire26[(1'h1):(1'h1)] : $unsigned((~(8'hb2))))));
  always
    @(posedge clk) begin
      reg30 <= ($signed((8'haa)) ?
          {$signed(($unsigned(wire22) ? (~|wire26) : wire20)),
              ((!$signed((8'h9e))) ?
                  ((wire16 ~^ wire14) ?
                      $signed(wire20) : $unsigned(wire23)) : $unsigned({(8'hb0)}))} : $unsigned(wire17));
      reg31 <= {({wire18[(4'hb):(1'h0)]} & $unsigned($signed((reg30 ?
              wire15 : (8'hb0)))))};
      reg32 <= $unsigned($signed(({{(8'hab),
              wire16}} + $signed($unsigned(reg31)))));
    end
  assign wire33 = wire16[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg34 <= (wire24[(5'h11):(4'hc)] | ($signed($unsigned($unsigned(wire22))) ?
          $unsigned(({wire25, wire17} ^~ (~&reg32))) : wire15));
      if ($signed($signed({(wire27 * (~&reg34)),
          ((~&wire15) ? $unsigned(wire29) : wire14)})))
        begin
          reg35 <= wire24;
          reg36 <= wire19;
          reg37 <= {$unsigned(wire26[(3'h4):(1'h1)])};
        end
      else
        begin
          if (((^~$unsigned($unsigned((wire26 ?
              reg37 : (8'hbb))))) >> ({((wire14 && wire14) ?
                  (wire15 <<< wire19) : wire15[(2'h2):(1'h1)])} | (-(((8'h9d) ?
                  wire19 : (8'ha2)) ?
              $signed(wire33) : (wire22 ? wire18 : wire22))))))
            begin
              reg35 <= $signed($unsigned((wire28 ?
                  $unsigned(wire22) : (~|(wire25 ? wire15 : (8'ha9))))));
            end
          else
            begin
              reg35 <= ($unsigned((8'hbd)) >= (~|(|wire20)));
              reg36 <= wire16[(2'h3):(1'h1)];
              reg37 <= (+(~|({wire28[(4'h8):(3'h4)], reg31} & wire18)));
            end
          if (reg32)
            begin
              reg38 <= (|(((8'hae) ?
                      (wire19 ?
                          $unsigned(reg31) : (~^wire33)) : (~|reg34[(4'ha):(3'h4)])) ?
                  ((~&$signed(wire21)) ?
                      $signed(wire17[(2'h3):(2'h2)]) : (^~$signed(wire17))) : (~|$unsigned(wire16[(1'h1):(1'h0)]))));
              reg39 <= ($unsigned(reg38[(4'hd):(4'hd)]) << wire26[(2'h2):(2'h2)]);
            end
          else
            begin
              reg38 <= wire33;
              reg39 <= {(|$unsigned(((reg34 != (8'haf)) >>> (wire19 ?
                      (8'hba) : wire14)))),
                  (wire27 ?
                      $unsigned(wire16) : ((^wire26) ?
                          ((reg32 * wire33) ?
                              wire17 : (wire23 & wire25)) : reg37[(3'h7):(1'h1)]))};
            end
          reg40 <= wire16;
          if ((&(((8'h9e) ?
              reg31 : {reg32[(3'h6):(3'h4)],
                  {wire25}}) | wire22[(2'h3):(2'h3)])))
            begin
              reg41 <= $unsigned({reg36,
                  {((wire26 + wire25) ?
                          (wire16 ? wire14 : wire22) : ((8'hbb) ?
                              (8'had) : reg32)),
                      $unsigned({reg36, reg38})}});
            end
          else
            begin
              reg41 <= (($unsigned($unsigned((wire22 ? wire28 : (8'ha8)))) ?
                  $signed($unsigned($unsigned(reg30))) : $unsigned($unsigned($unsigned(wire29)))) - wire24[(2'h3):(1'h0)]);
              reg42 <= reg39[(1'h0):(1'h0)];
            end
        end
    end
  assign wire43 = $unsigned(wire24);
  assign wire44 = ((wire14 ?
                      $signed(wire16[(3'h5):(1'h1)]) : wire14[(3'h7):(3'h4)]) < (~(reg32[(4'ha):(4'h9)] != (reg40[(3'h4):(1'h0)] >= reg37[(4'he):(4'h8)]))));
  assign wire45 = $unsigned(((~^wire18[(2'h3):(1'h1)]) || {$unsigned((~^wire16)),
                      $signed((wire33 ? wire18 : reg31))}));
  assign wire46 = reg37;
  always
    @(posedge clk) begin
      reg47 <= {(wire16[(3'h4):(3'h4)] ? (8'hbe) : wire45[(4'hb):(3'h6)]),
          ((wire25[(1'h1):(1'h1)] | reg38[(4'hc):(3'h4)]) ?
              (|(~|wire46[(2'h3):(2'h3)])) : $signed((wire15 ?
                  $signed(reg30) : (&reg42))))};
      reg48 <= wire20[(4'he):(2'h2)];
      reg49 <= (-$signed({((^~reg32) <= (wire22 ? (8'hb4) : reg40)),
          (reg41[(4'h8):(1'h0)] >= wire14[(4'hd):(4'hb)])}));
      reg50 <= {wire46[(5'h12):(3'h6)],
          ($unsigned(((reg36 ? wire27 : reg40) ?
              (~&wire14) : reg47)) == $signed({wire22[(2'h2):(1'h1)],
              $signed(reg35)}))};
    end
  always
    @(posedge clk) begin
      if (wire14[(2'h2):(1'h0)])
        begin
          reg51 <= $signed(reg36);
          reg52 <= (($unsigned({$unsigned((7'h41)), wire44}) ?
                  $unsigned({$unsigned((8'hbc))}) : $signed(reg49[(2'h3):(1'h0)])) ?
              {{((wire43 ? (8'hbe) : wire22) ?
                          $signed(reg34) : (reg50 <<< reg41))},
                  reg34[(4'ha):(2'h3)]} : wire43);
          reg53 <= (8'hbd);
          if ((!(8'ha2)))
            begin
              reg54 <= $unsigned(reg52);
              reg55 <= (&(~^{$signed((wire46 ? wire20 : wire43)),
                  $signed($signed((8'hb2)))}));
              reg56 <= ({$signed({(reg37 & reg40), $signed(reg52)}),
                      (|({reg32} ^ (|reg32)))} ?
                  (reg53[(3'h6):(1'h1)] ?
                      ($unsigned($unsigned(wire43)) ?
                          (wire16[(3'h5):(2'h3)] ?
                              wire28[(4'hf):(4'hc)] : reg52[(3'h5):(1'h0)]) : $unsigned(reg47[(1'h0):(1'h0)])) : ($signed($signed(wire25)) >>> ($unsigned((8'hb4)) ?
                          wire21[(1'h0):(1'h0)] : (8'h9c)))) : ((&(~&reg47[(2'h3):(2'h2)])) ?
                      $signed(reg49) : {(^~(+wire29))}));
              reg57 <= {$unsigned($signed(($unsigned(wire29) >>> {wire46})))};
              reg58 <= wire27;
            end
          else
            begin
              reg54 <= (wire16 ?
                  reg36 : $signed($unsigned((reg42 ?
                      $signed((8'ha1)) : wire26[(1'h0):(1'h0)]))));
              reg55 <= $signed(($unsigned($signed((reg41 < reg32))) ?
                  $signed((((8'hab) >>> reg37) >>> $unsigned(wire45))) : wire26[(3'h5):(2'h2)]));
              reg56 <= reg32[(3'h4):(2'h2)];
              reg57 <= wire20;
            end
        end
      else
        begin
          reg51 <= $signed($unsigned(((^~$signed(wire26)) < (+reg50[(3'h4):(2'h2)]))));
        end
      reg59 <= (!(+$signed({$unsigned((8'hbc))})));
      if ((!(~|wire44[(2'h2):(1'h0)])))
        begin
          reg60 <= reg38;
          reg61 <= (wire19[(3'h5):(2'h2)] ?
              (-wire24) : $unsigned((-(|$unsigned(reg38)))));
          reg62 <= $unsigned((reg58[(1'h0):(1'h0)] ?
              reg36[(3'h4):(2'h3)] : reg56));
          reg63 <= ($unsigned($unsigned($unsigned($unsigned(wire21)))) ?
              (wire29[(4'hd):(2'h3)] ^~ ($signed((wire43 ? wire21 : reg48)) ?
                  ((reg57 ^ reg34) != reg42[(3'h6):(3'h5)]) : ($unsigned(reg31) > (wire45 ?
                      (8'hae) : (8'hb4))))) : ((~^wire18) ?
                  (~reg35[(1'h1):(1'h1)]) : ($signed((reg42 + reg38)) ?
                      $unsigned(wire16) : $signed(reg30[(3'h5):(1'h1)]))));
          reg64 <= reg38;
        end
      else
        begin
          reg60 <= reg30[(1'h1):(1'h0)];
          reg61 <= $signed(reg40);
          reg62 <= $unsigned($unsigned({(8'h9e)}));
          reg63 <= ($unsigned((((wire16 ? wire17 : (8'ha6)) * $signed(reg63)) ?
              (wire46[(4'hd):(1'h0)] ?
                  (reg37 + wire28) : wire21) : $signed((reg41 >> (8'ha6))))) >>> (&(^~$unsigned(wire21))));
        end
      reg65 <= reg38;
      reg66 <= (reg65[(2'h2):(1'h0)] == {(-{reg48})});
    end
  always
    @(posedge clk) begin
      reg67 <= (~$signed($signed($unsigned(reg54))));
    end
endmodule
