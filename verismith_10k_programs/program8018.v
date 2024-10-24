module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire122;
  assign y = {wire124, wire18, wire4, wire20, wire122, (1'h0)};
  assign wire4 = $unsigned({$unsigned(wire2), {wire1, (8'ha1)}});
  module5 #() modinst19 (wire18, clk, wire4, wire0, wire1, wire2, wire3);
  assign wire20 = {((^~wire0[(3'h4):(1'h0)]) ?
                          $unsigned((^$unsigned(wire0))) : ({(wire0 ?
                                      (8'hbe) : wire4)} ?
                              $unsigned(wire3) : (!(wire0 + wire4)))),
                      $signed((wire3 >= wire1[(5'h12):(2'h3)]))};
  module21 #() modinst123 (.y(wire122), .clk(clk), .wire25(wire1), .wire23(wire4), .wire24(wire3), .wire26(wire0), .wire22(wire2));
  assign wire124 = $signed($unsigned((7'h40)));
endmodule

module module21
#(parameter param120 = ((!(((~(8'hbf)) << {(8'h9e), (8'hb1)}) * (((8'haf) != (8'h9f)) ? ((8'ha5) ? (8'hb1) : (8'hbe)) : {(8'hb0), (7'h40)}))) + (-(~&(((8'h9e) ? (8'ha8) : (8'hae)) >>> ((8'hba) ? (8'hb8) : (8'hbc)))))), 
parameter param121 = (^~((+(param120 <<< param120)) & ((param120 & {(8'hab)}) ? {{param120}, (param120 ? param120 : param120)} : (&((8'hb8) != param120))))))
(y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire24;
  input wire [(3'h6):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire119;
  wire signed [(5'h11):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire109;
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire111,
                 wire27,
                 wire73,
                 wire75,
                 wire109,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg76,
                 (1'h0)};
  assign wire27 = {((wire23[(1'h1):(1'h1)] != $signed((wire24 < wire22))) ?
                          (^~wire23) : (8'ha6))};
  module28 #() modinst74 (.wire32(wire24), .wire31(wire27), .wire29(wire23), .wire30(wire22), .y(wire73), .clk(clk));
  assign wire75 = $unsigned(wire73);
  always
    @(posedge clk) begin
      reg76 <= ((wire27[(5'h10):(1'h1)] ?
          (wire26 ^ ((wire75 ?
              wire23 : wire27) != $signed(wire75))) : $signed(wire75)) + {(8'ha8),
          ($unsigned(wire27[(4'hf):(4'h9)]) ?
              $unsigned(wire27[(2'h2):(1'h1)]) : $unsigned($signed(wire27)))});
    end
  module77 #() modinst110 (.wire80(wire27), .wire81(reg76), .y(wire109), .wire79(wire73), .clk(clk), .wire78(wire24));
  assign wire111 = ((^$unsigned($signed(wire27[(4'he):(3'h7)]))) ?
                       wire73 : $signed(wire22));
  always
    @(posedge clk) begin
      reg112 <= {$unsigned(reg76),
          ((8'hb1) ?
              ((&wire23) ?
                  (~&{wire26, wire73}) : $unsigned((wire75 ?
                      (8'haa) : wire27))) : (($signed(wire111) != (^~(8'hbd))) ~^ (~&$signed(wire75))))};
      reg113 <= $unsigned(wire111[(4'h8):(1'h0)]);
      reg114 <= reg112;
      reg115 <= $signed(((wire24 + wire22[(1'h1):(1'h0)]) <<< {(^$unsigned(reg113)),
          $unsigned((&wire73))}));
      reg116 <= $unsigned($signed(wire26));
    end
  assign wire117 = $unsigned($unsigned($unsigned($signed(wire73))));
  assign wire118 = ({reg112} ?
                       (^~$unsigned(($unsigned(wire117) != (wire111 ?
                           wire111 : reg76)))) : (~|$unsigned({reg115,
                           $signed(wire23)})));
  assign wire119 = $signed($unsigned({(8'ha6), reg114[(3'h4):(1'h0)]}));
endmodule

module module5
#(parameter param16 = (~^(({((8'ha3) ? (8'hb5) : (8'hae))} ? (((8'ha3) <= (8'hb8)) < ((8'ha4) == (8'hb1))) : (((8'hbe) ? (8'hac) : (7'h44)) ? ((8'ha4) ? (8'ha6) : (8'hae)) : (|(8'hb0)))) == (&(^~((7'h42) ? (7'h44) : (7'h43)))))), 
parameter param17 = param16)
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire15, wire14, wire12, wire11, reg13, (1'h0)};
  assign wire11 = ((^wire7) ? $unsigned(wire8) : wire9);
  assign wire12 = (wire6[(4'hb):(4'ha)] ?
                      $unsigned((-(~|wire10[(4'hb):(3'h4)]))) : (~|wire10));
  always
    @(posedge clk) begin
      reg13 <= (~&wire11[(1'h0):(1'h0)]);
    end
  assign wire14 = (wire6[(2'h3):(1'h1)] ?
                      $unsigned($unsigned({(+wire6),
                          ((7'h42) ? (8'h9e) : wire7)})) : wire8);
  assign wire15 = $unsigned($unsigned(($unsigned(wire14) > (+(8'haf)))));
endmodule

module module77
#(parameter param108 = ((&(~((!(8'haf)) >> (|(8'hba))))) == (~{((^~(8'ha5)) ? ((8'hb4) ? (8'hb5) : (8'hac)) : ((8'ha0) ? (8'hb4) : (8'hb6))), (~^{(8'hba), (8'hb8)})})))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire81;
  input wire [(4'hd):(1'h0)] wire80;
  input wire [(4'h8):(1'h0)] wire79;
  input wire signed [(5'h10):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg89,
                 (1'h0)};
  assign wire82 = {$unsigned($unsigned({(wire78 ? wire81 : wire79)})),
                      wire78[(3'h6):(3'h5)]};
  assign wire83 = $unsigned(wire82);
  assign wire84 = {$signed($signed($signed((wire83 + wire83)))),
                      wire80[(3'h7):(3'h6)]};
  assign wire85 = ($signed((~^$unsigned({wire83}))) ?
                      wire82[(1'h1):(1'h0)] : $signed(wire79[(3'h7):(3'h6)]));
  assign wire86 = {$signed($signed(((!wire82) ? wire83 : wire78))),
                      (~|wire78[(3'h7):(2'h2)])};
  assign wire87 = $unsigned(wire82);
  assign wire88 = $unsigned(wire82[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg89 <= wire82[(3'h4):(3'h4)];
    end
  assign wire90 = (8'hb5);
  assign wire91 = (^~($unsigned(reg89) - (8'ha0)));
  assign wire92 = {reg89[(2'h2):(1'h1)], $unsigned($signed(wire88))};
  assign wire93 = wire91;
  assign wire94 = (+$signed({$signed((wire79 ? (8'hb7) : wire82))}));
  assign wire95 = wire81;
  assign wire96 = $signed($unsigned((wire94 ?
                      $signed((+(8'ha7))) : ($unsigned(wire95) ?
                          $unsigned(wire81) : {wire90}))));
  assign wire97 = ($unsigned(($unsigned($unsigned(wire85)) > (wire82[(3'h5):(3'h4)] ?
                      (-(8'hbe)) : (&wire93)))) ^ {(~|($signed(wire93) + wire87[(4'ha):(4'ha)])),
                      wire88[(5'h13):(2'h2)]});
  assign wire98 = (~^wire96);
  assign wire99 = ($unsigned($unsigned(((wire86 ? wire97 : reg89) ?
                      (+wire94) : $unsigned(wire82)))) && ((~&((wire88 | wire79) ?
                      wire88 : $signed((8'ha6)))) > $signed(({wire96, wire93} ?
                      wire97 : $unsigned(wire97)))));
  always
    @(posedge clk) begin
      reg100 <= $signed((wire84 ?
          (wire96[(4'h8):(2'h2)] ?
              ($signed(wire93) ?
                  (wire88 == wire82) : $signed(wire88)) : wire83) : reg89));
      reg101 <= (((|$unsigned($signed(wire86))) ?
              {(wire94 == $signed(wire85)),
                  $signed($unsigned(wire98))} : (|($signed(wire99) ?
                  $signed((8'h9d)) : wire91))) ?
          ((!(^~(8'ha9))) * (!wire97)) : $unsigned($signed($signed((~&wire82)))));
      reg102 <= (($signed($signed($signed(wire96))) && (-(|$signed(wire88)))) ?
          $signed(wire85) : wire92[(4'h9):(1'h1)]);
      reg103 <= wire83;
    end
  assign wire104 = wire98;
  assign wire105 = {(-(($signed(wire81) ? {wire78} : $signed(wire91)) ?
                           (8'ha7) : $unsigned(((8'hb8) ? wire90 : reg101)))),
                       ($signed(($signed(wire86) ?
                               (wire86 >>> reg102) : $signed(wire96))) ?
                           {((wire87 && wire104) && (wire82 ?
                                   (8'h9e) : wire90)),
                               wire94[(3'h6):(3'h5)]} : wire99[(4'h9):(1'h0)])};
  assign wire106 = (~|$unsigned(wire88));
  assign wire107 = (wire79[(3'h4):(2'h3)] ?
                       ((~|(reg100 ?
                           {wire93, wire90} : (reg101 ?
                               wire81 : (8'hb8)))) < ($signed(wire96[(4'hb):(1'h1)]) * {$signed(wire104),
                           (reg101 ? wire81 : wire85)})) : wire94);
endmodule

module module28
#(parameter param72 = (^~({(~^((8'hb2) ? (8'hb8) : (8'ha5))), (((8'hbd) ? (8'hb1) : (8'ha4)) <= ((8'hb2) ? (8'ha9) : (8'haf)))} && (~^({(8'hb2), (8'h9c)} ? (~^(8'haf)) : ((8'hbc) | (8'hb0)))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire32;
  input wire [(5'h12):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  input wire [(4'h8):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire33;
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire39,
                 wire38,
                 wire36,
                 wire33,
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
                 reg42,
                 reg41,
                 reg40,
                 reg37,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = wire30;
  always
    @(posedge clk) begin
      reg34 <= $unsigned($unsigned({($unsigned(wire32) ?
              (wire31 > wire29) : $unsigned(wire33))}));
      reg35 <= {((({wire32,
              wire31} || (wire29 <= (8'ha1))) ^~ {wire33[(4'hf):(3'h6)],
              (-wire31)}) >= $unsigned(wire31))};
    end
  assign wire36 = (wire31[(5'h11):(2'h2)] ?
                      wire32 : (((|(wire29 ?
                              reg35 : wire31)) < (wire31 != reg34[(4'h8):(3'h7)])) ?
                          wire29[(3'h5):(2'h2)] : ({wire29[(2'h3):(2'h2)],
                              $signed((8'hba))} + $unsigned((wire32 ?
                              (8'hbb) : wire31)))));
  always
    @(posedge clk) begin
      reg37 <= $signed(reg34);
    end
  assign wire38 = $signed((~^(((~^wire31) ^~ (8'hab)) ?
                      $signed((7'h41)) : reg37)));
  assign wire39 = $signed((reg35[(2'h3):(1'h1)] ?
                      (($signed(wire38) ?
                          $signed(reg35) : (wire32 ?
                              wire31 : wire33)) >> wire38) : $unsigned(((reg35 ^~ wire29) ?
                          (8'haa) : (wire33 ? (8'h9f) : reg34)))));
  always
    @(posedge clk) begin
      if (wire31)
        begin
          if (reg37[(5'h13):(5'h11)])
            begin
              reg40 <= ((($signed({wire38,
                  reg34}) < $signed(wire39)) || (8'hb2)) ^~ (((^((7'h42) <= wire33)) + {(|wire29)}) ?
                  ($signed($signed(wire36)) == ((~|wire32) ?
                      (~&reg37) : ((7'h40) ?
                          reg34 : wire29))) : ($unsigned((wire33 ?
                          wire39 : wire36)) ?
                      (~reg37[(4'ha):(2'h3)]) : ($signed(wire39) >> {(8'hbd),
                          wire31}))));
            end
          else
            begin
              reg40 <= wire39[(1'h1):(1'h1)];
              reg41 <= wire31[(5'h10):(3'h5)];
              reg42 <= (wire30 ?
                  $unsigned($signed(((reg41 ? (7'h44) : wire31) ?
                      $signed(wire30) : $signed(wire29)))) : (wire36[(2'h2):(2'h2)] ?
                      {$unsigned(wire36[(1'h0):(1'h0)])} : wire33));
            end
        end
      else
        begin
          reg40 <= (({((wire39 ? wire36 : (8'hb9)) ?
                      $unsigned((8'hb2)) : (reg35 * reg42)),
                  (+(~^(8'hbf)))} ~^ $signed(((~|wire36) ?
                  {reg40} : (reg35 ? wire29 : wire29)))) ?
              $unsigned((&(wire33 & $signed(wire31)))) : wire30);
          reg41 <= wire36[(1'h0):(1'h0)];
        end
    end
  assign wire43 = (wire29 ?
                      (8'hb1) : (reg35[(4'h8):(2'h3)] ?
                          wire29[(3'h7):(3'h5)] : $unsigned($unsigned($signed(wire39)))));
  assign wire44 = reg37[(2'h3):(1'h1)];
  assign wire45 = wire32[(4'ha):(1'h1)];
  assign wire46 = reg41[(4'hd):(4'hc)];
  assign wire47 = wire38;
  assign wire48 = $signed($unsigned(wire30[(1'h1):(1'h1)]));
  assign wire49 = (reg35[(4'ha):(4'h8)] * $signed((^~wire30)));
  assign wire50 = (-reg41[(4'hc):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire49)
        begin
          reg51 <= wire44[(4'ha):(4'h8)];
        end
      else
        begin
          if (($signed(((reg42 == wire49) ?
              wire32 : wire36)) & wire46[(2'h3):(2'h3)]))
            begin
              reg51 <= wire33;
              reg52 <= $unsigned(wire50);
              reg53 <= $unsigned((8'hb1));
              reg54 <= (reg34 | reg37);
            end
          else
            begin
              reg51 <= reg40[(3'h4):(1'h1)];
              reg52 <= $signed($unsigned({$unsigned(reg53[(3'h4):(1'h1)])}));
              reg53 <= {reg51[(1'h0):(1'h0)]};
              reg54 <= wire44[(3'h6):(3'h6)];
              reg55 <= {$unsigned($unsigned($unsigned(wire46[(1'h1):(1'h0)]))),
                  wire38};
            end
          if ((8'hac))
            begin
              reg56 <= wire49;
              reg57 <= wire46;
              reg58 <= {reg56};
            end
          else
            begin
              reg56 <= {$unsigned(((|reg35) ? (^~reg51) : $signed((-wire47)))),
                  reg34};
            end
        end
      reg59 <= (($signed(({reg53, wire45} ?
                  reg35[(4'hd):(3'h7)] : $signed(wire48))) ?
              (-reg40) : $unsigned(reg55[(1'h0):(1'h0)])) ?
          (8'had) : $signed((((reg54 >> (8'hae)) ?
              (~^reg53) : wire30) <<< wire49)));
      if (((wire46 ?
          reg52[(2'h3):(1'h0)] : (($unsigned(reg53) != wire29) & ((^~reg34) <<< ((7'h41) >>> reg57)))) == {((8'ha5) ?
              $unsigned({reg57}) : ((wire47 ?
                  (8'haa) : wire33) == (|wire44)))}))
        begin
          reg60 <= reg42;
        end
      else
        begin
          if ((($unsigned(wire32) >>> $signed({(8'ha4),
              {reg42, reg53}})) <= ((wire31 ~^ (wire43 << $unsigned((8'ha4)))) ?
              (wire30 * $unsigned(wire43)) : {$signed({wire31}),
                  (reg41 && reg40)})))
            begin
              reg60 <= $signed(((~^$unsigned({(8'hbf)})) ?
                  $signed($unsigned($signed(wire44))) : (reg52[(1'h0):(1'h0)] ?
                      $unsigned((~^wire38)) : wire48)));
              reg61 <= $signed(($unsigned((wire29 ?
                      reg57[(2'h2):(1'h1)] : (-wire46))) ?
                  reg59 : (~wire47[(1'h0):(1'h0)])));
            end
          else
            begin
              reg60 <= $unsigned($unsigned((wire38[(1'h1):(1'h0)] ?
                  $signed(reg34) : (reg51[(1'h1):(1'h1)] ?
                      (^reg37) : wire48[(1'h0):(1'h0)]))));
              reg61 <= {(+(~(wire30[(1'h1):(1'h0)] != $unsigned(wire47)))),
                  (wire46[(2'h3):(1'h0)] ?
                      wire32[(2'h2):(1'h0)] : {wire50, wire48[(1'h1):(1'h0)]})};
              reg62 <= $signed(wire47);
              reg63 <= (reg60[(4'hb):(3'h6)] ?
                  wire45[(3'h7):(3'h7)] : ($unsigned($unsigned(reg61)) ?
                      (wire32 ?
                          ((wire33 < reg62) >>> (~wire38)) : wire49[(4'ha):(3'h4)]) : $unsigned({(reg53 * reg56),
                          reg37})));
              reg64 <= wire46[(5'h10):(5'h10)];
            end
          if (wire49)
            begin
              reg65 <= $unsigned(((^reg56) ?
                  $signed($unsigned((~^(8'haa)))) : ($unsigned((|wire48)) | ((reg55 ?
                          (8'hab) : reg52) ?
                      wire38 : $signed(reg53)))));
            end
          else
            begin
              reg65 <= $signed((reg59[(3'h4):(2'h3)] ?
                  $signed((&(&reg55))) : (($signed(reg57) <<< (8'hb8)) ?
                      wire50[(4'h9):(1'h0)] : {$unsigned(reg41),
                          $signed((8'h9c))})));
              reg66 <= $unsigned((8'hbc));
            end
          reg67 <= {(reg65 <= $signed(wire48)),
              ((!($signed(wire33) ? $signed(reg60) : {reg42})) ?
                  reg61[(4'hc):(1'h0)] : ($signed(((7'h44) - reg34)) && wire38))};
          reg68 <= wire30;
        end
    end
  assign wire69 = wire36[(1'h1):(1'h0)];
  assign wire70 = wire47[(1'h0):(1'h0)];
  assign wire71 = (+reg41[(4'he):(4'hd)]);
endmodule
