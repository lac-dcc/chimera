module top
#(parameter param99 = (((~^{((8'hbb) < (8'hb1)), ((8'ha8) ~^ (8'ha7))}) != ((((8'ha9) ? (8'h9f) : (8'ha4)) - {(8'h9e), (8'hb3)}) ? (((8'h9e) >> (8'hb5)) || ((8'had) ? (8'h9e) : (7'h43))) : ((!(8'hb5)) && ((8'ha3) ? (8'hab) : (7'h42))))) ? (((((8'haa) ~^ (8'hb5)) ? ((8'hac) ? (8'haa) : (8'hab)) : ((8'hbb) ? (8'hbb) : (8'hbb))) << (~&{(7'h41), (8'ha3)})) ? (((~&(8'h9d)) & ((7'h42) >> (8'hb9))) ? (((8'hb6) + (8'hba)) || ((8'hab) ~^ (7'h40))) : (((8'hb3) >>> (8'h9d)) > {(8'ha7), (8'hb2)})) : ((((8'hb6) ? (8'hab) : (8'ha4)) ~^ {(8'ha0), (8'hb1)}) ? ({(8'hbd)} ? (7'h40) : ((7'h42) != (8'ha6))) : (~^(-(8'hab))))) : ((~(^{(8'hb4), (8'ha5)})) ^ ({(-(8'haf)), ((8'haa) - (8'ha4))} ? {{(8'hbb)}, (+(8'haf))} : (~^(~|(8'ha3)))))), 
parameter param100 = param99)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire98;
  wire [(4'hc):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire89;
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire4,
                 wire89,
                 (1'h0)};
  assign wire4 = ({wire3,
                         (wire1 <<< ((wire3 != wire1) ?
                             $unsigned((8'ha2)) : (!wire1)))} ?
                     ($signed((^~$signed(wire1))) ?
                         ($unsigned($signed(wire1)) ?
                             $unsigned((^~(8'hb6))) : $unsigned({wire1})) : $signed(wire3)) : wire3[(1'h1):(1'h0)]);
  module5 #() modinst90 (.wire10(wire0), .wire7(wire1), .wire8(wire3), .clk(clk), .y(wire89), .wire9(wire4), .wire6(wire2));
  assign wire91 = $signed((wire89 >>> wire3));
  assign wire92 = $signed((^~{(wire89 ? wire3 : (wire1 || wire91))}));
  assign wire93 = wire0;
  assign wire94 = ($unsigned((($signed(wire4) >>> (wire89 >>> wire89)) ?
                      ($unsigned(wire3) ?
                          (+wire2) : wire91[(1'h0):(1'h0)]) : wire3)) && ($signed(wire0) ?
                      wire92 : ({wire2, {wire3}} ?
                          $unsigned((wire3 || (8'had))) : (^~(wire1 ?
                              (7'h41) : wire0)))));
  assign wire95 = (~wire4[(3'h6):(3'h6)]);
  assign wire96 = (~^(&{{((8'hae) <= (8'hb1))}}));
  assign wire97 = $unsigned((-(wire94 ?
                      (wire89 ?
                          (wire94 > (8'had)) : (+(7'h42))) : $signed(wire2[(4'ha):(4'h9)]))));
  assign wire98 = (-wire1[(3'h5):(3'h4)]);
endmodule

module module5
#(parameter param87 = ((^({(^(8'ha0))} | {((8'hb7) ? (8'hb0) : (8'hb6)), (~^(8'haf))})) ? (8'had) : ((^(+((7'h41) <= (8'hb4)))) ? {{((8'ha0) == (8'ha2))}} : {(|(8'hb1))})), 
parameter param88 = (param87 <<< param87))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire59;
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire61,
                 wire11,
                 wire41,
                 wire59,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 (1'h0)};
  assign wire11 = $signed(wire10);
  module12 #() modinst42 (.wire16(wire9), .wire14(wire10), .clk(clk), .wire13(wire6), .wire15(wire8), .y(wire41));
  module43 #() modinst60 (.wire44(wire41), .wire47(wire9), .wire48(wire6), .clk(clk), .wire46(wire10), .wire45(wire11), .y(wire59));
  assign wire61 = wire11;
  always
    @(posedge clk) begin
      reg62 <= wire41[(4'hb):(3'h4)];
      if ($unsigned(((~&(+(wire10 <= (8'hb3)))) != ({wire41, $unsigned(wire9)} ?
          wire59[(2'h3):(1'h0)] : $signed((wire10 ? wire6 : wire11))))))
        begin
          if (((wire10 < (((8'hab) ?
                  (wire11 ? wire7 : (8'hbb)) : $unsigned(wire9)) ?
              reg62 : $signed(wire7))) >= wire6[(4'hb):(2'h3)]))
            begin
              reg63 <= wire6[(4'hb):(4'hb)];
              reg64 <= {(wire61[(4'hd):(3'h7)] ?
                      (|(8'hb2)) : ($unsigned((wire61 > reg62)) <= $unsigned((wire6 & wire11)))),
                  (!((~{wire8, wire59}) ?
                      wire10 : $unsigned($signed(wire61))))};
              reg65 <= wire59;
              reg66 <= (~^$signed(({$signed(wire61),
                  $unsigned(wire7)} && reg64[(5'h13):(5'h10)])));
            end
          else
            begin
              reg63 <= $signed($signed(((~&wire9) <= ((+wire9) ?
                  $unsigned((8'hb9)) : (wire9 == wire8)))));
            end
          reg67 <= (($unsigned($signed((wire8 > reg65))) ?
              $unsigned((-(reg66 ? (8'ha7) : reg64))) : $signed(({wire59,
                  reg64} <= reg65[(2'h2):(2'h2)]))) + ((($signed(wire11) ?
                  ((8'hb6) <= wire11) : wire11) ?
              wire59 : {$unsigned(wire11)}) > (|wire10)));
          if ($signed($signed((wire7 ?
              (~|(|reg65)) : {(wire10 == reg64), $unsigned((7'h40))}))))
            begin
              reg68 <= $signed((reg63[(4'hc):(3'h5)] ?
                  $unsigned((|$unsigned(wire11))) : ({$signed(wire9),
                      {wire11}} == $unsigned($signed(wire9)))));
              reg69 <= (^wire61[(2'h3):(2'h2)]);
              reg70 <= {wire10, reg66};
              reg71 <= ((($unsigned(wire11) ?
                          ($signed(wire59) >>> reg69[(1'h1):(1'h1)]) : $unsigned($unsigned(reg65))) ?
                      (((wire41 ? reg64 : reg63) * reg65) == (reg64 ?
                          (wire11 == wire9) : $signed(reg69))) : $signed($signed(wire61[(4'ha):(4'h8)]))) ?
                  (wire11 ?
                      ((~^$unsigned((8'haf))) * (wire6[(1'h1):(1'h0)] ?
                          $signed(wire8) : reg67)) : $signed(($unsigned(reg65) * {wire7}))) : (wire6[(2'h2):(1'h1)] <<< wire59[(3'h4):(3'h4)]));
              reg72 <= wire61[(4'h8):(1'h1)];
            end
          else
            begin
              reg68 <= (((|(8'hbf)) ?
                  (($signed(reg68) ? (wire59 ? reg66 : wire7) : reg62) ?
                      (reg68[(3'h4):(2'h3)] ^ ((8'hb2) * wire8)) : ((reg67 ?
                              wire59 : wire11) ?
                          wire6[(1'h1):(1'h1)] : reg67[(2'h3):(1'h0)])) : ($unsigned((+reg68)) <<< $signed(reg72))) * reg72);
            end
          reg73 <= wire6[(4'hb):(4'hb)];
          reg74 <= $signed(({$signed(reg68[(2'h3):(1'h1)]),
              {{wire8, reg71}, $signed(reg62)}} | (({wire11} && (wire11 ?
              (8'h9e) : reg65)) ^~ $signed($signed(reg66)))));
        end
      else
        begin
          if ((~^{reg68[(3'h4):(1'h1)],
              ((^~reg70[(4'h8):(3'h7)]) ?
                  $unsigned((wire41 ^~ reg62)) : ((reg66 ? reg74 : reg68) ?
                      $signed(wire11) : wire59[(2'h3):(1'h1)]))}))
            begin
              reg63 <= wire41[(3'h5):(2'h3)];
            end
          else
            begin
              reg63 <= wire9;
              reg64 <= (&wire59);
              reg65 <= $unsigned((wire61 ?
                  (((reg68 ? reg72 : reg67) ?
                      $unsigned((8'ha1)) : $unsigned(reg68)) ^ ({wire61} ?
                      wire11 : (~^reg72))) : $unsigned(reg71[(1'h0):(1'h0)])));
              reg66 <= wire11[(2'h3):(1'h1)];
              reg67 <= (reg66[(2'h2):(1'h1)] - $signed($signed(reg69[(4'h9):(4'h9)])));
            end
        end
    end
  assign wire75 = (&reg62[(3'h7):(3'h4)]);
  assign wire76 = $signed(($unsigned({$unsigned(wire11),
                      ((8'hb0) << wire9)}) - (!wire75)));
  assign wire77 = $signed(wire6);
  assign wire78 = $unsigned($unsigned(($signed($unsigned(reg64)) ^ (((8'ha9) ?
                          reg74 : wire11) ?
                      reg65 : wire76[(3'h5):(1'h1)]))));
  always
    @(posedge clk) begin
      reg79 <= reg63;
      reg80 <= wire59[(3'h4):(1'h1)];
      reg81 <= $signed({wire41[(5'h11):(5'h10)]});
      reg82 <= reg70[(2'h3):(2'h3)];
    end
  assign wire83 = $unsigned(reg69[(4'h9):(2'h2)]);
  assign wire84 = $signed($signed({reg64[(5'h12):(2'h3)],
                      $unsigned($signed(wire83))}));
  assign wire85 = ((((~&reg80[(3'h6):(3'h5)]) ^ $signed((reg81 > wire8))) ?
                      $unsigned($unsigned((!(8'hb1)))) : $unsigned(wire61[(4'hd):(2'h3)])) >= (^reg69[(4'h9):(3'h7)]));
  assign wire86 = $signed(reg74);
endmodule

module module43
#(parameter param57 = (((!(7'h43)) - ((^~((8'ha4) + (8'ha2))) > (~|((8'hb3) * (8'hb9))))) ? (~|({((8'ha6) + (8'ha4))} ~^ (((8'hbb) ? (8'hac) : (8'haa)) ? ((8'ha2) >>> (8'ha0)) : ((8'h9d) + (8'haf))))) : (|(({(8'ha3)} ? ((8'hb5) || (8'ha7)) : (~&(7'h42))) || (~^((8'hb1) ? (8'hae) : (8'ha7)))))), 
parameter param58 = {(param57 ? param57 : ((~|(param57 << param57)) == {(param57 ? param57 : param57), (|param57)}))})
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire48;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  input wire signed [(2'h2):(1'h0)] wire45;
  input wire [(3'h5):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire49,
                 reg51,
                 (1'h0)};
  assign wire49 = $signed(({wire48[(1'h1):(1'h1)], wire48} ?
                      (wire45 ^~ $signed({wire46})) : $unsigned((~&$signed(wire47)))));
  assign wire50 = ($signed(wire48) ?
                      ((((-(7'h44)) ? (wire47 ? wire45 : (7'h44)) : wire47) ?
                          $signed($signed(wire44)) : $signed((~&(8'ha4)))) > $signed($signed((wire47 ?
                          wire47 : wire45)))) : ((^~(+(wire49 << wire48))) ?
                          wire46[(4'hb):(1'h1)] : wire48));
  always
    @(posedge clk) begin
      reg51 <= $signed((~|wire45));
    end
  assign wire52 = reg51[(3'h5):(3'h5)];
  assign wire53 = $signed($unsigned((~&wire44)));
  assign wire54 = (&$signed(wire44));
  assign wire55 = wire53;
  assign wire56 = {wire45, wire48};
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire16;
  input wire [(4'hc):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire30,
                 wire29,
                 wire28,
                 wire20,
                 wire19,
                 wire18,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= (+$signed($unsigned(wire16[(5'h11):(3'h7)])));
    end
  assign wire18 = $unsigned($unsigned(wire13));
  assign wire19 = wire13;
  assign wire20 = wire13[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      if ((|(!$signed((wire16[(3'h6):(3'h5)] ? $unsigned(wire15) : wire20)))))
        begin
          reg21 <= wire14;
          if ($signed((reg17[(2'h2):(2'h2)] ?
              wire20[(4'h8):(1'h1)] : ($unsigned(((7'h44) - wire16)) + $signed($unsigned(wire18))))))
            begin
              reg22 <= ({$unsigned(($signed((8'hac)) ^~ wire19))} ?
                  (~|((reg17 ?
                      wire18[(5'h12):(4'hf)] : wire13) - (~&(wire19 < wire18)))) : (($unsigned(wire20) ?
                          (wire18[(4'hd):(1'h1)] ?
                              (^wire15) : (wire15 * (8'hb6))) : (^wire15[(4'ha):(3'h7)])) ?
                      reg17 : ($unsigned(wire20[(3'h4):(2'h3)]) ?
                          $signed(reg21) : $unsigned($signed(wire18)))));
              reg23 <= $unsigned({(($signed((8'hb7)) ?
                          wire13[(5'h11):(3'h6)] : $signed(reg17)) ?
                      $signed($signed(reg17)) : (~wire19))});
              reg24 <= reg23;
              reg25 <= (reg17 <<< $signed(wire20[(5'h11):(2'h2)]));
            end
          else
            begin
              reg22 <= reg21[(1'h1):(1'h1)];
              reg23 <= ((8'hb7) ?
                  (reg17[(1'h0):(1'h0)] ?
                      $signed(wire16) : $unsigned({$signed((8'ha4)),
                          reg21})) : $unsigned(((reg23 ?
                      (reg21 >= wire14) : $signed(wire19)) < wire20[(3'h6):(1'h0)])));
              reg24 <= reg22;
            end
          reg26 <= (wire16[(4'h9):(3'h6)] << wire20);
        end
      else
        begin
          reg21 <= $signed(({((wire13 >= wire15) ? wire16 : $signed((8'hba))),
              ((reg24 <<< reg23) ?
                  (wire13 & reg17) : ((8'h9d) ^~ reg17))} >> {wire18}));
        end
      reg27 <= $signed(wire13);
    end
  assign wire28 = $signed($unsigned(reg25[(2'h3):(1'h1)]));
  assign wire29 = (^(8'h9e));
  assign wire30 = $signed($unsigned(reg21));
  always
    @(posedge clk) begin
      reg31 <= $signed({(^((reg24 ? reg27 : reg26) ? (~&wire20) : (^(8'haa)))),
          (($signed(reg22) <<< $unsigned(reg23)) ?
              wire20[(4'h8):(3'h5)] : $unsigned($unsigned(wire29)))});
      reg32 <= ((($signed($unsigned((8'hbe))) * $unsigned(wire13[(4'hd):(2'h3)])) ~^ reg22[(5'h10):(1'h1)]) ?
          (~|(&$signed(wire28[(3'h5):(1'h0)]))) : (($signed($signed(reg21)) & $unsigned((~wire16))) ?
              (-(reg21 | $unsigned(wire14))) : reg24[(2'h2):(1'h1)]));
      reg33 <= (8'h9c);
      reg34 <= (~$signed((wire16[(2'h3):(1'h1)] + reg23[(2'h2):(1'h0)])));
    end
  assign wire35 = wire20;
  assign wire36 = (reg25[(2'h2):(1'h1)] ?
                      $unsigned(wire15[(3'h6):(1'h0)]) : $signed((($unsigned(reg23) >> $signed(reg23)) ?
                          {reg24, (reg34 || wire29)} : reg34)));
  assign wire37 = $unsigned(((((8'h9d) >>> (^~(7'h44))) ?
                      {$signed(reg31),
                          (reg34 ?
                              wire14 : wire35)} : $unsigned($unsigned(wire35))) && (&$signed($unsigned(wire13)))));
  assign wire38 = $signed($unsigned(({(~&wire14),
                      $unsigned(reg26)} & $unsigned((reg23 ?
                      (8'hb7) : (8'haf))))));
  assign wire39 = (|(reg17[(3'h4):(1'h1)] ?
                      $signed(wire13) : wire14[(4'h9):(3'h4)]));
  assign wire40 = $unsigned(((^(~&$signed(reg34))) ~^ ((8'ha3) ?
                      (reg32 ?
                          ((8'h9f) ?
                              wire38 : reg32) : $signed(wire20)) : (~^{wire14}))));
endmodule
