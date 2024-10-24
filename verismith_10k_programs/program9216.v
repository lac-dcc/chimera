module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire13,
                 wire12,
                 wire5,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (wire2 && {(($unsigned((8'hae)) ?
                         $unsigned(wire1) : $unsigned(wire3)) != $unsigned((wire3 ?
                         wire4 : (8'hbb))))});
  always
    @(posedge clk) begin
      reg6 <= $unsigned({wire4[(4'h8):(2'h2)], wire3[(4'h8):(3'h4)]});
      if (wire3[(4'hb):(3'h6)])
        begin
          reg7 <= ({(-(wire1 ? (wire0 ? wire4 : wire0) : $signed(reg6))),
                  (8'hb7)} ?
              wire3 : wire5);
          reg8 <= {((((wire5 * wire0) ^~ wire2) ? (-(~^wire2)) : (^(8'hb7))) ?
                  $signed((((8'ha0) + wire1) ^ (reg7 && (8'h9f)))) : wire4)};
          reg9 <= $signed((wire2[(4'hf):(4'h9)] >> (8'hb3)));
        end
      else
        begin
          reg7 <= wire2[(2'h3):(2'h2)];
          reg8 <= wire1;
          reg9 <= (|(wire1[(2'h3):(1'h0)] ?
              (reg9[(4'h8):(1'h1)] ?
                  $unsigned((wire3 ? reg7 : reg7)) : $signed({reg8,
                      reg6})) : wire2[(4'he):(4'hd)]));
          reg10 <= $unsigned($unsigned(reg8[(3'h5):(3'h5)]));
        end
      reg11 <= wire2[(4'h8):(3'h4)];
    end
  assign wire12 = $signed((&(~&wire3)));
  assign wire13 = reg8[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ((^(^~(8'hbf))))
        begin
          reg14 <= (&({reg10[(5'h10):(3'h5)],
              (|wire3)} >= ((7'h44) << $signed(wire13))));
          reg15 <= $signed(($unsigned(wire1) ~^ ((8'ha9) >> $signed((~|reg8)))));
          reg16 <= (~$signed((((reg11 & reg6) ?
              wire13[(3'h4):(2'h3)] : {reg7}) ^ $signed((^(8'hb9))))));
          reg17 <= reg7[(4'hc):(2'h3)];
        end
      else
        begin
          reg14 <= {(((!reg10[(3'h5):(1'h0)]) ?
                  $signed((wire13 >= wire12)) : $signed((wire1 ?
                      wire4 : wire1))) >>> $signed(reg16[(2'h3):(1'h0)]))};
          reg15 <= $signed(reg16);
          reg16 <= $unsigned($unsigned(wire5));
          reg17 <= ((&($unsigned($signed(reg7)) && $signed($signed(wire4)))) ?
              (reg14 ?
                  (~^wire2[(4'hf):(1'h1)]) : ({(^~reg14), (~&reg6)} ?
                      $unsigned($unsigned(reg8)) : ($unsigned(reg10) ?
                          $signed(reg7) : (reg6 <= wire3)))) : $signed(({reg7} ?
                  ($unsigned(reg10) < (~wire13)) : reg14)));
        end
      reg18 <= ($signed(wire2[(4'hc):(4'ha)]) ?
          $unsigned(reg14) : {((+(reg14 ? wire1 : wire12)) ?
                  wire13 : ((&reg14) >>> (wire12 ? reg11 : wire0)))});
      reg19 <= (((!$signed(wire4[(3'h7):(1'h0)])) || (wire2 * $signed(reg8))) ?
          ($unsigned((&wire4[(4'h8):(2'h2)])) || reg7) : wire0);
    end
  assign wire20 = reg11;
  assign wire21 = (reg8[(2'h3):(1'h0)] ?
                      ({reg8[(3'h6):(3'h6)], reg9} ?
                          (($signed(wire5) ?
                              (wire12 >= (7'h41)) : (wire1 ?
                                  wire2 : reg19)) >= reg11) : $unsigned(((reg19 ?
                                  reg19 : reg16) ?
                              (reg8 | wire20) : $signed(reg18)))) : wire20[(2'h2):(1'h0)]);
  assign wire22 = (wire5 ?
                      ($signed(reg14[(5'h10):(1'h0)]) ?
                          (~&reg8[(2'h3):(1'h0)]) : $unsigned($unsigned((~^reg19)))) : (({(8'hb9)} == $signed((wire5 ?
                          wire13 : wire20))) - (|reg11[(1'h0):(1'h0)])));
  assign wire23 = $unsigned({(wire20[(3'h5):(2'h2)] != reg8),
                      $unsigned(($signed(reg11) ? wire0 : wire12))});
  always
    @(posedge clk) begin
      reg24 <= $signed((wire1 ?
          {reg18, reg11[(3'h6):(1'h0)]} : $unsigned(({reg9, wire13} ?
              wire21[(4'h9):(3'h5)] : reg17))));
      reg25 <= ((^~(wire3 ? $unsigned((reg19 ? reg18 : reg7)) : {(8'ha5)})) ?
          ($unsigned(reg8) > $unsigned($signed(wire2[(4'hd):(4'h9)]))) : ({{(^wire0)},
                  ($unsigned(reg16) ? $unsigned(reg19) : $unsigned((8'hb5)))} ?
              reg14 : wire12[(5'h11):(3'h6)]));
      reg26 <= $unsigned((wire12[(2'h2):(1'h0)] ^ wire0));
      reg27 <= wire23;
      reg28 <= $signed($unsigned((|$signed((-reg16)))));
    end
  assign wire29 = ($signed($signed($signed((reg6 ? reg16 : wire5)))) ?
                      $unsigned((^$signed($unsigned(reg9)))) : $unsigned($unsigned(((~&wire21) ?
                          (^reg24) : $signed(wire12)))));
  assign wire30 = reg7;
  assign wire31 = (^~($unsigned((!{wire21})) ? wire23 : (-{$signed((8'hb5))})));
  assign wire32 = ((reg28[(3'h7):(2'h3)] ?
                      $unsigned($signed(wire1[(4'hc):(4'hc)])) : (|reg6[(2'h3):(2'h3)])) >= $unsigned(reg9));
  always
    @(posedge clk) begin
      reg33 <= (|reg24);
      reg34 <= $unsigned(reg15[(4'hd):(3'h4)]);
      reg35 <= reg25[(4'ha):(1'h0)];
      if (wire31)
        begin
          reg36 <= {((((~|reg7) <<< $signed(wire13)) <= $unsigned(reg6[(2'h2):(1'h0)])) ?
                  {(^~reg33)} : (((^~(7'h41)) ? reg17 : (~&reg10)) ?
                      ((wire2 - reg26) >> $unsigned(wire22)) : ((~|wire20) + reg28[(2'h3):(1'h0)])))};
        end
      else
        begin
          reg36 <= (8'haf);
          reg37 <= {(|{(~|(^reg28)), wire30[(3'h7):(2'h3)]})};
          reg38 <= ($unsigned(((reg17[(1'h0):(1'h0)] > (wire13 << wire4)) + (+(wire13 ?
              reg15 : wire23)))) || ($unsigned((^~(reg37 < reg11))) ?
              (^~$signed({reg19})) : reg6));
          reg39 <= (^~$signed((wire12[(4'ha):(4'ha)] <<< {(reg24 != reg9)})));
          reg40 <= ((wire12 > (^reg38[(3'h4):(3'h4)])) || wire29);
        end
    end
  assign wire41 = $unsigned((wire4 ~^ $unsigned($unsigned((wire30 ?
                      reg25 : reg38)))));
  assign wire42 = reg8[(3'h4):(2'h3)];
endmodule
