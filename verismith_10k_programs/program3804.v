module top
#(parameter param137 = ((~|(8'h9e)) ? (+(!((8'hb6) > {(8'h9d)}))) : (&((((8'h9f) ? (8'ha2) : (8'h9e)) | {(8'hb5), (8'h9c)}) || (|(~&(8'hb5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire136;
  wire [(3'h7):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  assign y = {wire136, wire134, wire66, wire6, wire5, (1'h0)};
  assign wire5 = wire2[(3'h6):(3'h6)];
  assign wire6 = (^((wire5[(1'h0):(1'h0)] * $signed((wire3 ?
                     wire4 : wire0))) & $unsigned(($signed((8'ha4)) ?
                     (wire5 ? wire1 : wire4) : $signed(wire3)))));
  module7 #() modinst67 (.wire8(wire6), .clk(clk), .wire9(wire5), .wire10(wire1), .y(wire66), .wire11(wire0));
  module68 #() modinst135 (wire134, clk, wire0, wire6, wire3, wire66);
  assign wire136 = (wire2[(1'h1):(1'h1)] < $signed(((^~{wire1}) <<< (!(~wire4)))));
endmodule

module module68
#(parameter param132 = (+({(~|(^(8'hb7))), (8'hb5)} ? ((((8'haf) ? (8'ha2) : (8'ha7)) != ((8'hb5) + (8'ha2))) * (^~(^~(8'hb0)))) : ((((8'ha1) ? (8'ha0) : (8'ha4)) ? ((8'hb6) ? (8'hbc) : (7'h44)) : ((8'hb6) < (8'haf))) ~^ (((8'hb5) ? (8'ha4) : (8'ha0)) <<< (~^(8'ha9)))))), 
parameter param133 = (param132 == (|((~|{param132, param132}) <= (8'ha1)))))
(y, clk, wire69, wire70, wire71, wire72);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire69;
  input wire [(4'h9):(1'h0)] wire70;
  input wire signed [(5'h12):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire129;
  assign y = {wire131, wire73, wire74, wire75, wire129, (1'h0)};
  assign wire73 = (~&wire69);
  assign wire74 = $unsigned(($signed(((^wire72) >= $unsigned(wire73))) == ((!$unsigned(wire69)) ?
                      (8'hb9) : ((8'ha7) ?
                          ((8'hac) ? wire72 : (7'h42)) : (~wire70)))));
  assign wire75 = {wire73};
  module76 #() modinst130 (wire129, clk, wire72, wire75, wire74, wire71, wire69);
  assign wire131 = $unsigned($signed(((wire72[(3'h5):(3'h5)] ?
                           (wire70 ? wire129 : wire129) : $signed(wire73)) ?
                       (((8'ha3) == wire72) != (wire74 ?
                           (8'ha2) : wire70)) : (&((8'hbf) <= wire74)))));
endmodule

module module7
#(parameter param65 = (+(+(+(((8'hbc) ~^ (8'hb9)) ^ (|(8'hb8)))))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h2ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire12;
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  assign y = {wire64,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire28,
                 wire18,
                 wire12,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg56,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = (wire11 > $unsigned(($signed((8'hb0)) ?
                      ((wire11 & wire8) ?
                          wire9 : $signed(wire8)) : $signed({wire11,
                          (8'ha3)}))));
  always
    @(posedge clk) begin
      reg13 <= {$signed((-wire10[(3'h7):(3'h7)])), wire12};
      reg14 <= wire10[(4'h9):(3'h5)];
      reg15 <= ((reg13[(3'h5):(1'h0)] != (8'hb7)) ?
          $signed($unsigned(({reg14, wire12} ?
              wire9 : $unsigned(wire12)))) : reg14);
      reg16 <= ($signed($unsigned(wire12)) ?
          ((((reg13 - wire11) < wire9[(4'h9):(2'h3)]) ?
              wire11[(3'h6):(3'h5)] : $signed(reg14)) >> $signed((reg13[(4'hb):(4'hb)] ?
              (!reg15) : {wire9}))) : (~wire10[(4'h8):(1'h0)]));
      reg17 <= $unsigned(reg16[(1'h0):(1'h0)]);
    end
  assign wire18 = reg16[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if ((^~wire12))
        begin
          if (reg16)
            begin
              reg19 <= $unsigned((reg13[(3'h7):(3'h7)] ?
                  reg17[(4'hc):(4'ha)] : $unsigned($signed($signed(wire8)))));
              reg20 <= (~&(~|{reg14}));
              reg21 <= ($unsigned($signed(wire10[(4'hb):(2'h3)])) ?
                  (&($signed((8'haf)) ?
                      (^(^~wire12)) : wire18[(4'h9):(3'h6)])) : $unsigned({((wire18 ?
                              reg20 : (8'ha9)) ?
                          reg13 : $unsigned((8'hb1)))}));
              reg22 <= (reg14 << $unsigned((wire9[(1'h1):(1'h0)] ?
                  (^~reg13) : wire11)));
              reg23 <= $unsigned((reg14[(4'h9):(1'h0)] ?
                  ($unsigned((reg15 && wire12)) ?
                      (~&wire11) : ((~&reg13) ?
                          (~|reg16) : $signed(reg20))) : ({(reg22 < (8'hac))} & $signed({reg19}))));
            end
          else
            begin
              reg19 <= wire11[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg19 <= $unsigned((wire18[(4'hd):(3'h4)] && reg21));
          reg20 <= wire8[(1'h1):(1'h0)];
          if (wire12)
            begin
              reg21 <= ((reg17[(2'h2):(1'h0)] ?
                  wire8 : {$signed(wire12[(4'he):(4'h9)]), reg21}) - (~&reg13));
            end
          else
            begin
              reg21 <= (~|((((wire9 ? wire10 : wire9) + {wire9,
                  wire10}) != $signed($unsigned((8'haa)))) | wire9[(4'hb):(3'h5)]));
              reg22 <= (~reg17);
            end
          reg23 <= $signed((wire12[(3'h6):(1'h0)] ?
              reg19[(4'ha):(2'h2)] : (~&$unsigned($signed((8'haf))))));
        end
      reg24 <= $signed($signed((((~^reg13) ?
          (wire10 ?
              (8'hae) : wire9) : reg17[(5'h10):(1'h1)]) <<< $unsigned($unsigned(reg21)))));
      reg25 <= $unsigned(($unsigned($unsigned($unsigned((8'hbb)))) ?
          reg23 : (wire12[(2'h3):(2'h3)] - reg13[(2'h3):(2'h3)])));
      reg26 <= wire12[(5'h11):(3'h7)];
      reg27 <= (!{wire18[(2'h2):(1'h1)], $signed((~|((8'hb0) != wire12)))});
    end
  assign wire28 = $unsigned($unsigned(wire9));
  always
    @(posedge clk) begin
      reg29 <= (8'h9d);
      reg30 <= $signed({(reg13 >> $signed($unsigned(reg23))),
          ($unsigned(wire12[(4'hd):(3'h5)]) << wire8[(4'he):(4'hc)])});
      reg31 <= wire8[(2'h3):(1'h1)];
      reg32 <= $unsigned($unsigned($signed(reg13)));
      if ($signed(reg24[(4'h9):(4'h8)]))
        begin
          reg33 <= $unsigned((^~$unsigned(reg24)));
          reg34 <= (|$signed($signed((~wire18))));
          reg35 <= (&{$signed(($signed(reg31) ?
                  $unsigned(reg17) : $signed(wire18))),
              $unsigned($unsigned($unsigned((8'ha0))))});
          if ($unsigned((!reg33[(4'hd):(3'h7)])))
            begin
              reg36 <= reg14;
              reg37 <= reg15;
              reg38 <= ((8'hae) <<< wire8);
            end
          else
            begin
              reg36 <= (({$signed(((8'h9c) ?
                          wire11 : wire11))} || $unsigned(((reg32 ?
                          reg24 : reg29) ?
                      $unsigned((8'hab)) : reg22[(1'h0):(1'h0)]))) ?
                  ((^{(reg21 ? reg31 : reg25), {reg14}}) ^~ ($unsigned({reg15,
                          wire12}) ?
                      (|(~(8'hbe))) : {(reg24 || reg26)})) : ($signed((reg15[(2'h3):(2'h2)] || (reg36 ?
                          reg22 : reg16))) ?
                      reg20 : reg20[(1'h1):(1'h0)]));
              reg37 <= ((+reg21) ?
                  (({$unsigned(reg30)} && reg37[(4'h8):(1'h1)]) ?
                      ((~^(^wire10)) ?
                          ((reg30 - reg17) ?
                              reg36[(5'h14):(4'hb)] : reg19) : (+$unsigned(reg14))) : reg31[(1'h0):(1'h0)]) : $signed($unsigned($unsigned((!reg20)))));
            end
          if ((8'hb7))
            begin
              reg39 <= $unsigned($unsigned({$unsigned((reg22 && reg24)),
                  {((8'hab) >> reg26), (8'hb6)}}));
              reg40 <= (reg38 ^ ((-$unsigned(wire9[(3'h5):(3'h5)])) * $signed(wire11[(2'h2):(2'h2)])));
              reg41 <= $unsigned(((((8'ha2) * reg17[(2'h3):(1'h0)]) ?
                  wire9 : $signed(((8'ha7) + reg25))) | (|$unsigned($unsigned(reg31)))));
              reg42 <= (wire11 ?
                  wire9[(4'h9):(2'h3)] : (-$unsigned($unsigned($unsigned(reg40)))));
            end
          else
            begin
              reg39 <= $signed((~({(reg23 ?
                      reg32 : reg14)} * (((8'hb3) | reg36) - (reg26 ?
                  (8'hab) : reg20)))));
            end
        end
      else
        begin
          reg33 <= (-{($unsigned(reg19[(2'h2):(1'h1)]) ?
                  (reg25[(3'h4):(2'h2)] ?
                      {reg42,
                          reg35} : (reg41 >= reg22)) : $signed($signed(wire9))),
              $signed(reg33[(1'h1):(1'h0)])});
          reg34 <= reg40;
          reg35 <= (((reg25 ?
              reg13 : wire11[(3'h4):(2'h3)]) <<< ($unsigned($unsigned((8'h9d))) != $unsigned($signed(reg39)))) ^~ $signed((wire10[(4'h8):(3'h6)] ^~ ((reg21 ?
                  wire10 : reg27) ?
              (reg36 >> reg32) : reg33[(2'h3):(2'h3)]))));
          reg36 <= $unsigned(reg15);
        end
    end
  assign wire43 = wire11[(1'h0):(1'h0)];
  assign wire44 = ((reg38[(5'h11):(3'h7)] - $signed(wire11[(4'hb):(4'ha)])) ?
                      reg17[(4'hc):(4'h9)] : reg39);
  assign wire45 = (($unsigned((reg19 >>> $signed(reg19))) ~^ $unsigned((~^(|reg25)))) >>> (8'hb9));
  assign wire46 = ($unsigned(reg15) != $unsigned($unsigned($unsigned(wire11))));
  assign wire47 = (reg23[(2'h2):(1'h0)] <<< reg13);
  assign wire48 = (reg16[(4'h9):(4'h8)] < wire18[(2'h3):(1'h1)]);
  assign wire49 = (-reg16);
  assign wire50 = $signed(((^{(~|reg36)}) ?
                      $signed($signed($unsigned(reg32))) : wire12[(4'h8):(2'h2)]));
  assign wire51 = (&$unsigned((~^{reg21[(1'h1):(1'h1)]})));
  assign wire52 = $signed(((8'hac) << ({reg31, (reg40 || (8'hb2))} ?
                      $unsigned(((8'ha1) ? reg23 : reg22)) : $signed(reg22))));
  assign wire53 = (reg19 ^ (((^(reg16 ? (7'h43) : (8'ha5))) ?
                          ($unsigned(wire12) != wire12[(4'hb):(4'h8)]) : (^$signed(reg31))) ?
                      wire52[(4'hc):(4'hb)] : (~|wire45[(4'hc):(4'hc)])));
  assign wire54 = {(~&(7'h43))};
  assign wire55 = reg15[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg56 <= (reg19[(4'h9):(3'h4)] ?
          reg36[(2'h3):(2'h2)] : $signed($unsigned($signed($unsigned(wire51)))));
    end
  assign wire57 = reg16[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      if ($unsigned((~&(({(8'hb1)} >>> (^~wire11)) != reg31[(4'h8):(1'h1)]))))
        begin
          reg58 <= (reg40[(3'h5):(3'h5)] ?
              (reg24[(4'he):(4'h9)] ?
                  (~^{((8'hab) ? (8'hbb) : reg17),
                      $signed((8'hb3))}) : (~$unsigned($signed(wire48)))) : ((((reg56 ~^ (8'hb5)) ?
                      reg30 : (8'ha9)) ?
                  ($unsigned(wire44) << ((8'hbc) * wire10)) : wire12) - {reg35}));
          reg59 <= reg31[(1'h0):(1'h0)];
          reg60 <= $unsigned($signed($signed({wire48[(2'h3):(1'h1)]})));
          reg61 <= (-({{reg34, $signed((8'hb9))}} ?
              (~^reg42) : ((~^(wire57 ? wire55 : (8'h9d))) ?
                  (~|(reg15 ~^ reg56)) : reg32[(2'h2):(1'h1)])));
        end
      else
        begin
          reg58 <= ((8'hb8) ?
              (reg60 ?
                  reg29[(1'h0):(1'h0)] : $unsigned(reg42[(3'h7):(3'h5)])) : $unsigned((-(8'ha1))));
          reg59 <= (({$unsigned((reg60 ?
                  reg14 : reg25))} << ($signed(wire44) >= wire47)) >>> (8'hb0));
        end
      reg62 <= reg22[(2'h3):(2'h3)];
      reg63 <= wire18[(3'h7):(2'h2)];
    end
  assign wire64 = $unsigned(($unsigned(reg27) ? (8'h9e) : (&(&reg13))));
endmodule

module module76
#(parameter param128 = ((!((^(8'hb8)) || ((^~(8'ha0)) - (+(8'hbb))))) ? (+(((~(8'had)) ? ((8'hae) <<< (8'hb8)) : ((8'haa) >>> (7'h43))) << ({(8'hba)} == ((8'hb8) ? (8'ha1) : (8'ha8))))) : ((~^(~(~&(8'hb5)))) ? ((-(^~(8'h9f))) ? (((8'hb7) ? (8'haf) : (7'h44)) <= (+(8'hba))) : ((8'ha8) && ((8'hac) || (8'ha4)))) : ((((7'h44) ? (8'hbc) : (8'ha1)) - {(8'hb7), (8'ha2)}) ? ((8'hbc) >= {(8'hb2), (8'ha4)}) : {((8'ha9) ? (8'h9f) : (8'ha1)), (8'h9d)}))))
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire80;
  input wire signed [(4'h9):(1'h0)] wire79;
  input wire [(3'h5):(1'h0)] wire78;
  input wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  assign y = {wire127,
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
                 wire89,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire82 = (wire77 | (($unsigned($signed((8'hb7))) ?
                          wire81[(4'ha):(3'h7)] : wire78[(2'h3):(2'h3)]) ?
                      $signed(($unsigned(wire78) ?
                          $signed(wire81) : wire81)) : ((+(wire79 == wire77)) ?
                          $signed($unsigned(wire79)) : ((wire77 << wire79) < wire81))));
  assign wire83 = wire79;
  assign wire84 = wire83[(1'h1):(1'h1)];
  assign wire85 = ({($signed($unsigned(wire81)) & $signed((|wire78)))} && (~&$unsigned(wire77)));
  always
    @(posedge clk) begin
      reg86 <= wire79;
      reg87 <= wire81[(4'hf):(3'h4)];
      reg88 <= $unsigned(wire81);
    end
  assign wire89 = $unsigned($unsigned($unsigned(wire82)));
  assign wire90 = (wire89[(2'h2):(1'h1)] >>> wire84[(3'h5):(3'h4)]);
  assign wire91 = wire77[(4'h9):(4'h8)];
  assign wire92 = $signed($signed($unsigned(wire81)));
  assign wire93 = ((wire78 || ((wire89 ?
                      {wire83,
                          (8'had)} : wire84) < wire90[(4'ha):(2'h2)])) > (^~{wire85[(3'h4):(2'h2)],
                      reg87[(2'h2):(1'h1)]}));
  assign wire94 = (wire80[(2'h3):(1'h0)] ?
                      $signed((~|(^$signed((8'haa))))) : wire85[(1'h1):(1'h1)]);
  assign wire95 = ($signed($signed(wire81)) * wire83);
  assign wire96 = (~$unsigned($signed(((wire81 ? wire94 : wire80) && wire81))));
  assign wire97 = reg88[(3'h5):(2'h3)];
  assign wire98 = wire82;
  assign wire99 = $unsigned($signed($unsigned(wire83[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      if (((~^(&wire85)) ^ $signed(((~wire82) || reg87[(4'hb):(1'h1)]))))
        begin
          reg100 <= (^~wire94[(1'h1):(1'h0)]);
          if (((wire78 >= $unsigned({(reg100 > wire79)})) ?
              wire84[(2'h3):(2'h2)] : wire95))
            begin
              reg101 <= {$unsigned((({wire90,
                          wire95} ^~ reg100[(1'h1):(1'h0)]) ?
                      wire96[(3'h7):(1'h1)] : reg100)),
                  wire98[(2'h3):(2'h3)]};
              reg102 <= (8'hbe);
              reg103 <= $unsigned(reg100[(2'h2):(1'h0)]);
            end
          else
            begin
              reg101 <= wire91[(1'h0):(1'h0)];
              reg102 <= (&(wire85[(2'h2):(1'h1)] || (8'ha1)));
              reg103 <= (~|$unsigned({(~$signed(wire84))}));
              reg104 <= $unsigned($signed((^wire77[(3'h5):(3'h5)])));
              reg105 <= $signed({wire92, $signed($unsigned($signed(wire77)))});
            end
          if (reg104)
            begin
              reg106 <= wire97;
              reg107 <= $unsigned({$signed(((wire93 ?
                      reg106 : wire77) >>> (reg106 ? wire93 : wire89))),
                  wire94[(4'h9):(1'h1)]});
            end
          else
            begin
              reg106 <= {wire84[(3'h6):(3'h4)],
                  (wire97 ?
                      {($signed(wire83) >>> (8'h9e)),
                          (wire85[(2'h3):(1'h1)] == (reg101 != reg100))} : reg105)};
              reg107 <= (({$signed((^~wire99)), {wire79[(2'h3):(2'h2)]}} ?
                      {(|(-reg88))} : (((8'h9d) < (wire89 && wire98)) & wire94)) ?
                  ($unsigned($signed((wire79 ?
                      reg102 : wire80))) & reg106) : $unsigned(wire85[(2'h3):(1'h0)]));
              reg108 <= (^~$signed((reg101 ?
                  $signed((wire79 ?
                      wire78 : reg106)) : (wire92 == (wire82 > reg100)))));
              reg109 <= $signed($signed(wire79));
              reg110 <= (reg100 ? wire92[(4'hd):(3'h4)] : $unsigned((8'ha3)));
            end
          if ($unsigned($unsigned(($unsigned((^~wire97)) >> reg103))))
            begin
              reg111 <= $unsigned($unsigned($unsigned(((~^(8'hb3)) ~^ (!wire85)))));
              reg112 <= $signed(wire83);
              reg113 <= (reg112[(2'h2):(1'h0)] - $unsigned($signed($signed(((8'hb4) ?
                  wire94 : wire90)))));
            end
          else
            begin
              reg111 <= (wire80 ?
                  reg109 : {reg106[(2'h2):(1'h1)],
                      (!(^wire78[(3'h5):(3'h5)]))});
              reg112 <= $unsigned($signed(wire99[(2'h3):(2'h2)]));
              reg113 <= wire81[(2'h2):(2'h2)];
              reg114 <= (&(reg112[(2'h2):(1'h1)] & reg110[(2'h2):(1'h0)]));
              reg115 <= $signed($unsigned($signed($signed($signed((8'ha0))))));
            end
        end
      else
        begin
          reg100 <= reg88[(3'h7):(3'h7)];
          reg101 <= wire83;
          reg102 <= {(~^$signed(wire97[(3'h4):(2'h3)])), (8'ha5)};
        end
      if ($unsigned(reg104))
        begin
          reg116 <= reg102;
          reg117 <= reg105;
        end
      else
        begin
          if ((wire93[(3'h5):(2'h2)] ?
              (($signed((reg112 ? reg87 : wire84)) ?
                      {(reg116 + wire80),
                          (reg100 & wire78)} : ($signed(reg109) || (reg112 && reg112))) ?
                  (&(^(&reg103))) : {reg102[(4'hd):(2'h2)],
                      {$unsigned(wire99)}}) : {(($unsigned(wire83) ~^ $unsigned(reg108)) == (~&{wire91,
                      reg111}))}))
            begin
              reg116 <= wire82;
              reg117 <= $unsigned(wire84[(3'h4):(1'h1)]);
            end
          else
            begin
              reg116 <= $unsigned($unsigned(reg101[(3'h4):(1'h1)]));
              reg117 <= ({$unsigned(wire79)} - ($signed(wire79) ?
                  ($unsigned((reg112 ? reg117 : wire94)) ?
                      {(wire93 ? wire80 : reg110)} : reg105) : ((reg115 ?
                          $signed((8'hb6)) : wire80[(3'h6):(3'h4)]) ?
                      (~|wire97[(3'h7):(3'h7)]) : wire90[(1'h1):(1'h1)])));
              reg118 <= $signed((8'h9c));
              reg119 <= wire85;
            end
          if (($unsigned(reg106[(1'h0):(1'h0)]) ?
              reg105[(1'h1):(1'h0)] : ((wire97[(2'h2):(1'h1)] ?
                  ((wire90 ? reg108 : wire95) < $signed(reg86)) : ({reg113,
                      wire93} & wire82)) | reg114)))
            begin
              reg120 <= {(~^reg101[(5'h10):(3'h5)])};
            end
          else
            begin
              reg120 <= reg120[(1'h0):(1'h0)];
            end
        end
      reg121 <= $unsigned($unsigned(wire78[(2'h2):(1'h0)]));
      if ($signed((wire85[(3'h4):(1'h1)] > {(~&(~&wire94))})))
        begin
          if (((($signed($signed(reg117)) - (8'hb8)) ?
                  $unsigned((~wire77)) : {((reg86 * reg87) ?
                          wire79 : {wire95, (8'ha5)})}) ?
              (-reg101) : $unsigned(reg117[(3'h5):(2'h2)])))
            begin
              reg122 <= $signed($signed(reg107));
              reg123 <= (wire77 ?
                  $signed(($signed((|(7'h41))) ?
                      {(reg105 ?
                              reg121 : reg104)} : $unsigned((|wire81)))) : ((wire85[(3'h4):(3'h4)] == reg103) ?
                      (-wire81[(3'h6):(3'h4)]) : wire95));
              reg124 <= (!reg122[(1'h1):(1'h0)]);
              reg125 <= ({($signed((wire81 ? wire97 : reg122)) ?
                      reg114 : wire98[(2'h3):(2'h2)]),
                  (((~^reg103) >>> {wire80, wire94}) ~^ {(&reg103),
                      $unsigned(reg107)})} <= $unsigned(reg117[(3'h5):(2'h3)]));
            end
          else
            begin
              reg122 <= ($unsigned(reg101) << ((~|($unsigned(reg120) ?
                      wire78[(2'h2):(1'h1)] : reg125[(4'hc):(4'h9)])) ?
                  ((-(wire83 ?
                      wire97 : reg119)) <= $unsigned((-reg104))) : $signed(reg106)));
            end
        end
      else
        begin
          reg122 <= (reg86 & $unsigned((((wire94 << (8'hbf)) >>> $signed(wire77)) ?
              ((reg107 ?
                  (8'h9c) : reg108) * (wire92 <<< wire94)) : ($unsigned(reg122) ^ $unsigned((8'hbf))))));
          reg123 <= wire95;
          reg124 <= (reg121[(4'h9):(1'h0)] ?
              $unsigned($signed((^~$signed(reg122)))) : (8'ha2));
        end
      reg126 <= (((&{(!reg122), (~^reg87)}) ?
              ({wire77, $signed(reg115)} ?
                  (reg88 <<< reg87[(4'hd):(3'h5)]) : ($unsigned(wire99) >> $unsigned(reg100))) : (+reg125[(4'hc):(4'ha)])) ?
          wire99 : $signed(($unsigned(((8'haf) ? reg121 : reg124)) ?
              $unsigned($signed((8'hb1))) : wire90[(4'h8):(3'h4)])));
    end
  assign wire127 = {reg106};
endmodule
