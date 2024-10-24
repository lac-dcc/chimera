module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire7,
                 wire6,
                 wire5,
                 reg29,
                 reg28,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $signed((($unsigned($unsigned(wire1)) <= ($signed(wire2) >>> $signed(wire2))) & $signed(wire2)));
  assign wire6 = $unsigned(wire2[(1'h1):(1'h1)]);
  assign wire7 = $signed($signed((wire4 ?
                     ((~^wire5) ?
                         (!wire4) : (wire1 ?
                             wire5 : wire1)) : (+(wire6 <= wire5)))));
  always
    @(posedge clk) begin
      reg8 <= (8'ha7);
      if ((^~(8'ha0)))
        begin
          reg9 <= ($signed(($signed((~wire1)) ?
                  $signed((wire6 ?
                      wire1 : wire3)) : $unsigned($unsigned(wire6)))) ?
              (^~wire2) : $unsigned(wire2));
          if (wire2[(3'h4):(1'h1)])
            begin
              reg10 <= (($unsigned($unsigned((wire0 & wire7))) ?
                      (wire7[(1'h1):(1'h0)] ?
                          reg9[(4'hb):(3'h5)] : $unsigned((^(8'hb8)))) : (((!reg9) ?
                              $signed(wire3) : {wire1}) ?
                          $unsigned(wire6) : wire4)) ?
                  ($unsigned((reg9 >= (wire0 >= wire1))) <<< $unsigned((reg9 - (^~reg8)))) : ($unsigned(reg9[(2'h3):(1'h1)]) ~^ wire1[(4'h8):(2'h2)]));
              reg11 <= ((((+(wire4 ? wire1 : wire3)) ?
                          (7'h43) : $signed($unsigned(wire7))) ?
                      wire5 : wire0[(2'h2):(1'h0)]) ?
                  {$signed((8'h9e))} : (wire3[(4'h8):(4'h8)] ?
                      wire1 : (8'ha1)));
              reg12 <= $unsigned($signed(reg8));
            end
          else
            begin
              reg10 <= wire0[(1'h1):(1'h1)];
              reg11 <= $unsigned(wire3[(3'h6):(3'h5)]);
              reg12 <= (~|wire7[(2'h2):(1'h1)]);
              reg13 <= wire0;
            end
        end
      else
        begin
          reg9 <= reg9;
          reg10 <= wire4[(2'h3):(1'h1)];
          if (wire7[(4'hc):(4'hb)])
            begin
              reg11 <= $signed(reg8[(4'hc):(4'ha)]);
              reg12 <= {{((!(!wire6)) ~^ (^~reg10)), wire1},
                  (^{(+reg8[(4'hc):(4'ha)]),
                      $signed((wire7 ? wire2 : wire7))})};
              reg13 <= wire4;
              reg14 <= (~&$unsigned($unsigned((wire2 >= {reg11}))));
              reg15 <= reg9[(2'h3):(2'h3)];
            end
          else
            begin
              reg11 <= wire2;
              reg12 <= reg15;
              reg13 <= (reg13[(3'h7):(3'h4)] ?
                  (^((^(&(7'h41))) ?
                      $signed((wire5 ^~ wire1)) : $unsigned(wire4[(4'h8):(1'h1)]))) : reg9);
            end
          reg16 <= (-$unsigned(reg8));
          reg17 <= reg10;
        end
      if (reg8[(3'h7):(3'h4)])
        begin
          reg18 <= (8'hb8);
          reg19 <= (~^reg8[(3'h5):(3'h4)]);
          reg20 <= $unsigned((reg17[(2'h2):(1'h1)] ?
              {wire7,
                  ((reg18 != wire5) ?
                      (reg15 ?
                          reg11 : reg15) : reg12[(3'h5):(3'h5)])} : ($signed((8'hb9)) ?
                  (((8'hb8) ^ wire6) < ((8'hb6) ? wire1 : reg10)) : reg19)));
          if ((+reg10[(4'hd):(4'hb)]))
            begin
              reg21 <= $unsigned($unsigned((wire3 ?
                  wire7[(5'h11):(4'h8)] : ($signed(reg20) ?
                      reg14 : $signed((7'h43))))));
              reg22 <= $signed(reg16);
              reg23 <= ((^$unsigned((reg15[(3'h7):(1'h1)] == (!reg19)))) ~^ $unsigned(reg16));
              reg24 <= $unsigned($unsigned(wire7[(3'h5):(2'h2)]));
            end
          else
            begin
              reg21 <= (+(~^((wire6 - (reg20 ? reg24 : reg21)) ?
                  ((reg12 >>> (8'hb4)) ?
                      (wire4 ?
                          reg14 : reg14) : ((8'ha9) || reg23)) : ((~reg14) >> $unsigned(reg19)))));
            end
        end
      else
        begin
          reg18 <= (reg10[(3'h7):(1'h1)] ?
              reg14[(4'hb):(3'h4)] : $signed(reg10[(2'h2):(1'h0)]));
          if (reg11)
            begin
              reg19 <= wire2[(1'h1):(1'h1)];
              reg20 <= (~&reg21);
              reg21 <= ($unsigned($unsigned(wire4)) >>> (7'h42));
            end
          else
            begin
              reg19 <= $unsigned($signed({wire5}));
            end
          reg22 <= $unsigned(({(reg14[(3'h7):(2'h3)] != $unsigned(reg20))} ?
              ($signed($unsigned(reg20)) ?
                  $signed(reg13[(5'h12):(1'h0)]) : ((~|wire5) && (~reg15))) : $unsigned((reg12 == $unsigned(reg10)))));
          reg23 <= (|$signed((reg14[(4'h9):(3'h4)] > (&reg11))));
          if ($signed((8'hab)))
            begin
              reg24 <= $unsigned(wire6[(2'h3):(2'h2)]);
              reg25 <= wire0;
              reg26 <= wire2;
              reg27 <= $unsigned(reg25);
            end
          else
            begin
              reg24 <= $signed(reg22[(2'h3):(2'h3)]);
              reg25 <= reg19[(4'ha):(4'h9)];
              reg26 <= reg9;
              reg27 <= $signed(((!wire1[(3'h5):(3'h4)]) ?
                  (!((8'hb3) ?
                      $unsigned(reg21) : wire2)) : $unsigned(((~&reg16) << $signed(wire3)))));
              reg28 <= (reg12 ?
                  ($signed({(reg13 ? wire6 : wire2)}) >= (((reg13 ?
                      reg16 : wire5) <<< wire4) + ((-(8'hb1)) << $signed(reg24)))) : reg10[(2'h2):(1'h1)]);
            end
        end
      reg29 <= (-{reg14});
    end
  assign wire30 = ({reg19[(4'hc):(4'hb)], $unsigned(reg25[(3'h7):(2'h3)])} ?
                      (!wire6[(2'h3):(2'h2)]) : $signed((+$unsigned((!reg22)))));
  assign wire31 = reg23[(3'h6):(3'h4)];
endmodule
