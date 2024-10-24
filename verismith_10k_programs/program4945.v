module top
#(parameter param36 = (8'hbc))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire28,
                 wire18,
                 wire17,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = ((($unsigned($signed(wire3)) ^~ ((&wire2) >= {wire2})) <= wire4[(1'h0):(1'h0)]) << (((wire2 ?
                         (^~wire2) : (wire1 ? wire0 : wire2)) + wire0) ?
                     (~|((wire3 ?
                         wire4 : (7'h40)) && (wire0 * wire0))) : wire2));
  assign wire6 = wire1;
  assign wire7 = (($unsigned(((wire2 >= wire0) ?
                         {(8'haa)} : $unsigned(wire1))) ?
                     ($signed(wire2[(3'h6):(2'h2)]) & $signed((8'ha1))) : $unsigned($unsigned(wire6))) != wire4);
  always
    @(posedge clk) begin
      reg8 <= wire3[(2'h2):(1'h1)];
      if (($unsigned(wire7[(3'h5):(1'h0)]) ?
          {($signed(((8'ha4) ? wire3 : wire1)) | ((reg8 ?
                  (8'hb3) : wire4) ^ wire2[(3'h6):(3'h4)]))} : (($signed(wire6) >= (~&$signed(wire4))) | wire7)))
        begin
          reg9 <= wire3[(2'h3):(2'h3)];
        end
      else
        begin
          reg9 <= (8'hbb);
          reg10 <= $unsigned($signed(wire3[(2'h3):(1'h0)]));
          reg11 <= ($unsigned((reg9[(2'h2):(1'h1)] ?
              reg8 : (!wire0[(4'hd):(2'h3)]))) ^ wire6[(2'h2):(2'h2)]);
          reg12 <= ((((^wire0) ?
              ((wire1 ? reg11 : reg10) ?
                  wire4 : {wire3}) : $signed((+wire6))) >= (($signed(wire6) ?
                  {reg11, wire3} : {(8'hbd)}) ?
              $signed(reg11[(3'h5):(1'h1)]) : (wire6 ?
                  $unsigned((8'hb0)) : $signed(wire6)))) - (($signed((wire7 >> (8'ha9))) ?
              (~&wire3) : {(~|reg10)}) <<< wire5[(2'h3):(2'h2)]));
          reg13 <= wire3;
        end
      reg14 <= wire3[(3'h7):(3'h4)];
      reg15 <= (reg8 ?
          ($signed((8'hb4)) ?
              {{(wire2 >>> wire6), (reg9 ? reg8 : reg14)},
                  $unsigned($signed(wire6))} : ($unsigned((wire5 ^ wire6)) ?
                  $unsigned((reg13 ? reg12 : (8'h9c))) : ((-reg13) ?
                      (wire4 ? wire2 : reg13) : $signed(wire1)))) : {reg12});
    end
  always
    @(posedge clk) begin
      reg16 <= $unsigned({$unsigned(reg10[(4'ha):(3'h6)])});
    end
  assign wire17 = $unsigned((((!reg11[(3'h7):(2'h2)]) ?
                          ((~&reg16) ?
                              (reg10 || reg11) : (reg10 | wire4)) : ({reg12,
                                  reg12} ?
                              $signed((8'hab)) : $signed((8'h9d)))) ?
                      (+(~^$signed((8'h9c)))) : wire0[(4'he):(4'he)]));
  assign wire18 = (reg8 ?
                      (~^(({wire17} + (reg12 ^~ wire7)) ?
                          (reg11 & (wire7 ?
                              wire0 : reg8)) : $signed($unsigned((8'hb0))))) : (^(8'hb9)));
  always
    @(posedge clk) begin
      if (reg10[(2'h3):(1'h0)])
        begin
          reg19 <= {$unsigned((($signed(reg9) ?
                      $unsigned(reg12) : (reg14 || wire5)) ?
                  (-wire1[(4'hb):(4'h9)]) : ({reg16} >>> wire3))),
              $signed({reg14[(1'h0):(1'h0)],
                  $signed(((8'hb0) ? wire1 : reg15))})};
          reg20 <= $signed(reg12);
          if ($signed(wire1[(3'h7):(2'h3)]))
            begin
              reg21 <= $signed($unsigned((8'hbd)));
              reg22 <= $signed(reg21);
              reg23 <= (~^reg8[(3'h7):(2'h3)]);
            end
          else
            begin
              reg21 <= reg9;
              reg22 <= (!$unsigned($signed((8'hb8))));
            end
          reg24 <= $signed($unsigned(reg16[(1'h0):(1'h0)]));
          reg25 <= $unsigned($unsigned((+$unsigned((reg15 ^~ reg24)))));
        end
      else
        begin
          if (($signed((wire7 ?
              (reg24 ?
                  reg24 : (!(8'h9f))) : (8'ha5))) >>> {(wire5[(4'ha):(3'h5)] ~^ wire1[(4'h9):(1'h1)])}))
            begin
              reg19 <= (^~reg12[(2'h2):(1'h0)]);
              reg20 <= ((8'ha8) ?
                  $unsigned(reg9[(4'hb):(4'h9)]) : ($unsigned(($signed(wire4) || reg21)) ?
                      $unsigned((reg11 ?
                          (wire6 ?
                              reg14 : reg16) : (~|reg24))) : (reg25[(3'h4):(1'h1)] >= $unsigned(reg11[(1'h1):(1'h0)]))));
              reg21 <= (($unsigned(((^wire7) > reg11)) & $signed(((8'had) || (wire7 ?
                      (8'hb9) : reg10)))) ?
                  $unsigned(((8'hb9) ?
                      $unsigned($signed(reg15)) : $unsigned($signed(reg11)))) : reg15);
              reg22 <= (reg19[(3'h5):(2'h2)] ?
                  (&$signed((((8'hb1) - (8'hb6)) ?
                      wire17 : (reg13 ? wire2 : reg23)))) : $unsigned({reg10,
                      (+reg8)}));
            end
          else
            begin
              reg19 <= $signed($unsigned(wire3));
              reg20 <= (((~^$unsigned($signed((8'ha8)))) ^~ ((8'hab) ?
                      ($unsigned((8'ha3)) ?
                          (wire0 * reg25) : $signed(reg24)) : (|$signed(reg14)))) ?
                  (|reg16[(2'h2):(1'h0)]) : $signed((({reg16} ?
                          $unsigned((8'hac)) : (reg9 && reg25)) ?
                      $unsigned($unsigned(reg21)) : $unsigned((reg10 > reg14)))));
              reg21 <= $unsigned($signed(((wire17 ?
                  $unsigned(reg10) : (reg19 ?
                      reg19 : wire2)) >= $unsigned((reg10 || reg23)))));
              reg22 <= $signed($unsigned((8'hb1)));
              reg23 <= (|((reg19 != $unsigned((reg9 * reg15))) > $signed(wire1[(4'ha):(3'h6)])));
            end
          reg24 <= $signed($signed((+$unsigned(reg8))));
        end
      reg26 <= $unsigned(reg19[(1'h1):(1'h1)]);
      reg27 <= (^{$unsigned((^$signed(wire17)))});
    end
  assign wire28 = (wire18 ?
                      (&$unsigned(reg16[(3'h4):(2'h2)])) : reg12[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg29 <= {$unsigned($unsigned(((wire28 >>> reg12) >>> (reg21 > reg20))))};
      reg30 <= reg11;
      reg31 <= (~^{wire0[(1'h0):(1'h0)]});
    end
  assign wire32 = $unsigned(reg12[(1'h1):(1'h1)]);
  assign wire33 = (reg27 ?
                      ($signed(reg11[(4'h9):(3'h6)]) ?
                          (($signed(reg16) <<< (reg11 ?
                              reg21 : reg22)) >> (8'hbf)) : $unsigned($unsigned((wire32 - reg23)))) : $unsigned($signed(wire28)));
  assign wire34 = wire0[(3'h4):(3'h4)];
  assign wire35 = wire28;
endmodule
