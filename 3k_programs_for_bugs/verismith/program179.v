module top
#(parameter param34 = (^~{(~((~(8'hbf)) >= (^(8'hb4)))), {(!((8'hb5) >> (8'ha0)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  assign y = {wire33,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg32,
                 reg31,
                 reg30,
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
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(wire3));
  assign wire6 = wire2[(4'h8):(3'h6)];
  assign wire7 = ((&(wire5[(4'hd):(4'h8)] >> $signed((wire0 << (8'hbc))))) < wire6);
  assign wire8 = $signed((-($unsigned(wire5) || wire6[(3'h5):(2'h2)])));
  assign wire9 = $signed($signed(wire7[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg10 <= (((!(wire0[(3'h5):(3'h4)] == $signed(wire6))) ?
                  ($unsigned(wire7) <<< wire1[(4'hc):(2'h3)]) : $signed((~&(~|(8'ha2))))) ?
              wire7[(3'h7):(3'h6)] : $unsigned((!((wire4 ?
                  wire2 : wire1) | $signed(wire5)))));
          if (wire0)
            begin
              reg11 <= $signed(($unsigned($unsigned($unsigned(wire4))) ?
                  {$unsigned($unsigned(wire9))} : $signed((^(+(8'hbc))))));
              reg12 <= ({$unsigned(((wire1 ? wire4 : reg10) ?
                          wire5 : (reg11 ? wire5 : (8'ha2)))),
                      $signed(wire0)} ?
                  $signed(wire4) : wire3[(1'h1):(1'h0)]);
              reg13 <= (^~wire0);
              reg14 <= $signed((wire9 ^ $signed(wire2)));
              reg15 <= $signed($unsigned((wire9[(3'h6):(2'h2)] >>> (reg11[(4'hc):(2'h3)] ?
                  (8'hb2) : {wire0}))));
            end
          else
            begin
              reg11 <= (~|(!{(~^((8'hbe) ^ reg15))}));
            end
          reg16 <= ($signed((-$signed(((8'hb2) || reg11)))) >> ((8'hb5) ?
              $signed((&(~wire1))) : (&($unsigned(wire3) + $unsigned(wire7)))));
          reg17 <= wire7;
          reg18 <= reg12;
        end
      else
        begin
          reg10 <= $unsigned($signed(($signed($unsigned(reg15)) ~^ (reg17[(4'hc):(3'h7)] ?
              $signed(reg15) : (^reg14)))));
          if (reg15)
            begin
              reg11 <= $signed(((^(wire9[(3'h4):(2'h2)] >> {wire2})) < (reg13 ?
                  ($signed(wire1) ?
                      $signed(wire0) : $signed(reg14)) : reg11[(2'h2):(2'h2)])));
            end
          else
            begin
              reg11 <= ((&reg13) ?
                  $unsigned($unsigned(({wire6} ?
                      (^~(8'hb1)) : (reg15 ? wire9 : wire6)))) : {({{wire8},
                              reg14} ?
                          {$signed(reg11), reg16} : (8'hae)),
                      reg12[(2'h2):(2'h2)]});
              reg12 <= {((^$unsigned(reg15)) ^~ $signed((|wire0[(5'h11):(4'hf)]))),
                  reg16};
            end
          if ($unsigned((7'h42)))
            begin
              reg13 <= (((~^$signed($unsigned(reg11))) && reg17[(4'h9):(2'h3)]) | $signed($unsigned((^(+wire9)))));
              reg14 <= $unsigned($signed(($signed($signed(wire1)) - (reg16[(4'h9):(2'h2)] ?
                  reg15[(4'h9):(1'h0)] : $unsigned(wire8)))));
            end
          else
            begin
              reg13 <= $unsigned((reg11 >>> ((~|(reg11 ?
                  (8'ha2) : reg16)) + reg13)));
            end
        end
      if (((~^(|{(~^wire3)})) ?
          $unsigned($signed((^$signed(wire5)))) : ((~|$unsigned((wire8 ?
                  wire5 : wire0))) ?
              reg13 : $unsigned(reg12))))
        begin
          if (wire8)
            begin
              reg19 <= ((((^~(8'hb4)) < (|reg12)) ?
                      (!wire2[(4'hd):(2'h3)]) : reg10) ?
                  wire1 : (~$unsigned($unsigned($signed(wire1)))));
              reg20 <= $signed(wire0[(4'he):(2'h3)]);
            end
          else
            begin
              reg19 <= wire5;
              reg20 <= $signed(((wire4 ?
                  (((8'hb1) << (8'hb9)) - {wire8}) : $signed((wire8 ?
                      wire1 : reg15))) * (-wire6[(4'hf):(3'h5)])));
              reg21 <= ((wire5[(2'h3):(1'h0)] ^ $unsigned(wire1[(3'h6):(2'h2)])) - (~^reg10[(2'h3):(2'h2)]));
            end
          reg22 <= (((((reg15 ? (8'hb7) : wire6) ?
                  wire7[(3'h4):(1'h0)] : reg11) != ($signed(reg17) ^ {reg11})) ?
              $unsigned($unsigned((wire4 > wire1))) : ($unsigned($signed(wire3)) ?
                  $unsigned((wire6 ? wire4 : reg13)) : ($unsigned((8'hbb)) ?
                      reg14[(3'h5):(1'h1)] : (reg17 >>> (8'haf))))) ^~ ({($signed(wire8) >= wire8[(2'h3):(2'h2)])} ?
              (~(~(reg13 ? reg14 : reg20))) : (reg14 >= $signed((!(8'hb6))))));
          reg23 <= $signed($unsigned(reg17[(3'h7):(3'h7)]));
          reg24 <= ({(reg21 ?
                      $signed((^~reg14)) : ($signed(wire8) ?
                          $unsigned(reg14) : $unsigned(wire7)))} ?
              wire4[(2'h2):(1'h0)] : (+({reg11[(1'h1):(1'h1)],
                  (8'hb7)} + {$unsigned((8'ha0))})));
          reg25 <= (|($unsigned(reg21) ?
              $signed(wire8) : ($signed(((8'ha8) ?
                  reg11 : wire7)) ~^ (reg12[(3'h4):(3'h4)] ?
                  (reg21 * wire6) : (wire7 ~^ (8'hb0))))));
        end
      else
        begin
          reg19 <= (-((^~$unsigned(wire8)) ? reg13 : reg21[(4'h8):(4'h8)]));
          reg20 <= (($signed({((7'h44) ~^ reg13), reg15}) ?
              ((~&(reg20 ? wire1 : reg22)) ?
                  {wire4[(3'h4):(2'h3)],
                      {reg12,
                          wire6}} : wire8[(1'h1):(1'h1)]) : $signed(reg14[(4'hd):(4'h9)])) < $unsigned((wire4[(2'h2):(1'h0)] ?
              (reg14 ? (reg20 ~^ wire3) : reg14) : {$signed(reg18)})));
        end
      reg26 <= $unsigned(((($unsigned(reg22) || (!reg17)) ?
              (wire6 || {wire2}) : reg16[(1'h1):(1'h1)]) ?
          $signed(($unsigned(reg25) * wire4[(3'h6):(1'h0)])) : $signed(((reg14 ?
                  reg13 : reg20) ?
              $signed(reg15) : {wire0}))));
      if ($unsigned((|reg22[(1'h0):(1'h0)])))
        begin
          reg27 <= (wire4[(2'h2):(1'h0)] <<< $signed(reg17));
          if (((reg25[(1'h0):(1'h0)] == reg15[(3'h7):(1'h0)]) ?
              $unsigned(($signed($signed(reg16)) ?
                  reg23 : (+$unsigned(wire9)))) : (!(wire8[(3'h7):(1'h1)] ?
                  reg26[(1'h0):(1'h0)] : $unsigned(((8'hb8) ?
                      reg23 : reg25))))))
            begin
              reg28 <= $unsigned(wire2);
            end
          else
            begin
              reg28 <= (|(8'hb5));
              reg29 <= reg13;
              reg30 <= (~|(~^wire9[(3'h7):(2'h2)]));
              reg31 <= $signed((-(&$signed($signed(reg26)))));
              reg32 <= (wire3[(1'h0):(1'h0)] + $signed((wire6[(5'h10):(4'hb)] ?
                  (8'ha8) : reg19[(4'hc):(4'h9)])));
            end
        end
      else
        begin
          if ($unsigned(reg29))
            begin
              reg27 <= (&(8'hbd));
            end
          else
            begin
              reg27 <= reg25[(3'h4):(1'h1)];
              reg28 <= {$unsigned({$signed((|wire3)),
                      $signed($unsigned((8'haa)))})};
              reg29 <= reg30[(4'h8):(2'h2)];
              reg30 <= reg10[(4'hd):(3'h6)];
            end
        end
    end
  assign wire33 = reg22[(3'h4):(1'h1)];
endmodule
