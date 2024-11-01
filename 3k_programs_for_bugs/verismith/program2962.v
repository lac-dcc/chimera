module top
#(parameter param32 = (^~(-(-({(8'hb2)} >= ((8'ha8) ~^ (8'hb8)))))), 
parameter param33 = (|(~|param32)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  assign y = {wire31,
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
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = (wire0 ^~ $signed((($signed((8'hae)) ?
                         wire0[(5'h10):(4'hd)] : (^wire1)) ?
                     wire1[(2'h3):(1'h1)] : wire1)));
  assign wire5 = ((~wire0[(4'hc):(4'ha)]) << wire3[(5'h11):(1'h1)]);
  assign wire6 = $signed(wire0[(5'h10):(3'h4)]);
  assign wire7 = {(wire3[(4'h8):(3'h4)] ?
                         wire4 : ($unsigned($signed(wire6)) ~^ wire6[(3'h5):(2'h3)]))};
  always
    @(posedge clk) begin
      reg8 <= {(wire1[(2'h2):(2'h2)] == wire6),
          $unsigned(wire0[(3'h4):(2'h2)])};
      if ((((^~(wire5 ? wire1 : ((7'h41) * wire0))) ?
              ($unsigned((^~wire1)) >> (8'hb4)) : $signed($unsigned({wire0,
                  wire4}))) ?
          ((^$unsigned($unsigned(wire2))) << $signed({wire0[(2'h2):(2'h2)]})) : wire0))
        begin
          reg9 <= (8'hbb);
          reg10 <= ((7'h41) ? $unsigned(wire4) : reg9);
          reg11 <= $signed(wire3);
          if ($unsigned($unsigned(((wire7[(1'h0):(1'h0)] ?
              $signed(wire2) : (~wire5)) < (wire2[(3'h4):(2'h3)] ?
              {wire7, reg9} : (7'h43))))))
            begin
              reg12 <= (wire6[(3'h5):(3'h5)] ?
                  $signed((~&$signed(wire1))) : $signed(($unsigned((~wire4)) ?
                      (^~(~|reg8)) : $signed($unsigned(wire7)))));
              reg13 <= $signed(((($unsigned(wire3) <= {wire2, wire3}) ?
                  $signed((wire3 > reg10)) : $signed((8'ha4))) >> $signed($unsigned(((8'hbe) ?
                  reg10 : reg9)))));
              reg14 <= ((~&$unsigned($signed((reg8 <= wire7)))) ?
                  (8'hb7) : $signed($signed(((wire5 ?
                      wire0 : wire1) - reg10[(3'h7):(3'h7)]))));
              reg15 <= (&({($unsigned(reg14) ? wire3 : {reg12, reg14}),
                  $signed((wire1 ^ reg8))} << {$signed($signed(wire2))}));
              reg16 <= reg15;
            end
          else
            begin
              reg12 <= reg12;
              reg13 <= (8'hab);
              reg14 <= ((~^$unsigned((wire4[(3'h5):(3'h4)] ?
                  (|reg11) : $unsigned(reg9)))) ~^ wire6);
              reg15 <= (((((~^wire1) & (reg15 ?
                      reg12 : (8'hbe))) - $signed($unsigned((8'hb3)))) ?
                  reg8[(2'h2):(1'h1)] : (8'hb6)) - $signed((($signed(wire2) * wire3[(3'h7):(3'h4)]) ?
                  {(reg13 << wire0),
                      (reg14 ? wire6 : wire2)} : $signed((wire0 || wire2)))));
              reg16 <= $signed((((wire3 ? (wire3 >>> wire1) : (wire3 < wire2)) ?
                      $unsigned($unsigned((8'ha1))) : $signed((~wire1))) ?
                  reg11 : $signed((reg8[(1'h0):(1'h0)] >= reg15))));
            end
          reg17 <= (~$signed(wire7));
        end
      else
        begin
          reg9 <= (reg11 ?
              (wire6 ?
                  ({$unsigned(wire1), reg14[(2'h2):(1'h0)]} ?
                      {{wire6},
                          wire0[(4'ha):(1'h1)]} : $unsigned(wire2)) : (reg15 && reg9)) : (wire2[(4'h9):(3'h4)] ?
                  ($unsigned($unsigned(reg17)) << ($unsigned(reg17) << $unsigned(wire0))) : (~&reg15)));
          reg10 <= $unsigned((reg15[(3'h4):(2'h3)] ?
              $unsigned((reg12[(3'h6):(1'h0)] ?
                  {wire4,
                      reg14} : reg13[(5'h14):(5'h12)])) : (reg13 ^~ wire0)));
          if ((~^(&wire0[(5'h12):(4'hc)])))
            begin
              reg11 <= wire1;
              reg12 <= reg10[(1'h0):(1'h0)];
              reg13 <= {(wire6[(1'h1):(1'h0)] ^ (($unsigned(reg10) && $unsigned(wire1)) ?
                      wire7 : reg8[(3'h5):(1'h0)])),
                  (&((wire0 << (8'hb8)) <<< ($signed(wire3) && reg8[(3'h4):(1'h1)])))};
              reg14 <= $unsigned(({($unsigned(reg15) << (wire3 >> wire7))} ?
                  {wire0[(3'h7):(1'h1)], reg15} : wire3[(5'h11):(4'he)]));
              reg15 <= wire6[(3'h5):(2'h3)];
            end
          else
            begin
              reg11 <= wire5[(1'h0):(1'h0)];
              reg12 <= (+$unsigned(((8'ha6) ~^ ($unsigned(reg12) > reg11))));
              reg13 <= {{$unsigned((&$signed(reg16))), $signed($signed(reg10))},
                  ({reg11[(3'h4):(1'h0)]} || {$signed(reg9), wire1})};
            end
          if ((^(({(|reg10), $signed(wire3)} ? (-{reg8, reg13}) : (8'ha0)) ?
              wire6[(3'h5):(1'h0)] : (^~reg8[(4'h8):(3'h5)]))))
            begin
              reg16 <= {wire7};
              reg17 <= $unsigned($unsigned(reg10[(1'h0):(1'h0)]));
              reg18 <= ((reg12 ~^ (^~(wire7 ^ $unsigned((8'hb7))))) ?
                  (reg10 ?
                      wire3 : $signed($unsigned(reg10[(4'hd):(2'h3)]))) : ((((+reg14) ?
                          $signed(reg9) : reg14) ?
                      wire3[(4'ha):(3'h6)] : (wire3[(4'hd):(2'h2)] ?
                          $signed(wire5) : (reg12 ?
                              reg12 : reg8))) < {(8'ha5)}));
              reg19 <= (!((((reg11 ~^ reg16) > (~^wire7)) - reg14) & (((reg18 && wire3) ?
                  (8'hb4) : ((8'hbe) ?
                      reg18 : wire5)) <<< (wire1[(3'h4):(2'h3)] != (wire5 | wire0)))));
            end
          else
            begin
              reg16 <= ($signed(reg10) ?
                  $unsigned((|wire6)) : $unsigned($unsigned(reg17[(4'hb):(2'h3)])));
              reg17 <= reg9;
              reg18 <= (^~wire0[(4'hf):(1'h1)]);
              reg19 <= ($unsigned($unsigned(wire7[(1'h1):(1'h0)])) > ((wire1 + reg14) ?
                  $signed(reg10[(2'h3):(2'h2)]) : wire1[(3'h5):(2'h3)]));
              reg20 <= $signed($signed({$signed((reg17 >>> wire4))}));
            end
        end
    end
  assign wire21 = (((wire4[(3'h5):(3'h5)] ?
                      $signed($signed(reg14)) : ((wire5 ^ wire7) << (wire3 - reg17))) == $unsigned({reg17})) < {$signed(reg11),
                      (~|reg20)});
  assign wire22 = {((8'hb1) && reg19), (+(!reg15[(2'h2):(2'h2)]))};
  assign wire23 = $unsigned((({reg11[(5'h12):(5'h11)], $signed((8'hb8))} ?
                      wire5 : ($unsigned(reg9) >>> $unsigned(reg17))) + reg13));
  assign wire24 = {wire3[(3'h7):(3'h5)], wire6};
  assign wire25 = (~&reg18);
  assign wire26 = wire5;
  assign wire27 = ((~|(8'hb7)) ?
                      (+$unsigned(reg20[(3'h4):(3'h4)])) : ($unsigned(reg9) ?
                          (!wire0[(5'h10):(3'h5)]) : ((~(reg14 ?
                                  wire23 : reg13)) ?
                              ($unsigned(wire7) ?
                                  $signed(wire21) : $unsigned(wire23)) : $signed(((8'hbc) == reg10)))));
  assign wire28 = $unsigned(wire26);
  assign wire29 = (+reg9);
  assign wire30 = $signed($signed(wire25[(4'hb):(4'hb)]));
  assign wire31 = $signed($unsigned(reg9));
endmodule
