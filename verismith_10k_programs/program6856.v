module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  assign y = {wire34,
                 wire32,
                 wire15,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg33,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = {$signed({(~{wire0, (8'ha2)}),
                         ((wire3 ^~ wire3) ? wire4 : (wire3 ? wire1 : wire0))}),
                     (wire1[(3'h4):(2'h2)] <<< wire0[(3'h4):(3'h4)])};
  assign wire7 = $signed($signed((!wire0[(3'h6):(2'h3)])));
  assign wire8 = $unsigned((!wire0[(4'h8):(2'h3)]));
  assign wire9 = $signed($unsigned(((8'hbf) ?
                     ((wire8 >>> wire4) ?
                         (wire4 > wire5) : $signed(wire4)) : (wire2[(3'h5):(3'h4)] ?
                         $signed(wire3) : wire2[(4'ha):(2'h3)]))));
  always
    @(posedge clk) begin
      if ((|$unsigned($signed(wire3[(3'h5):(2'h2)]))))
        begin
          if (((!(wire1[(5'h13):(1'h0)] ^~ (^wire3[(4'he):(4'h8)]))) ?
              (wire0 ?
                  (((8'had) <<< ((8'hb4) ? (8'ha1) : wire7)) ?
                      wire1[(3'h6):(3'h4)] : (wire2[(4'h9):(1'h1)] == wire5)) : $unsigned((((8'had) < wire5) ?
                      (~wire2) : wire2[(4'he):(2'h2)]))) : ((~$unsigned((wire4 ?
                      wire8 : wire2))) ?
                  wire1 : wire2[(4'h9):(3'h4)])))
            begin
              reg10 <= (&(!wire6));
              reg11 <= wire6;
              reg12 <= $unsigned((~^reg11));
              reg13 <= $unsigned((&($unsigned((reg11 ?
                  wire5 : wire2)) >> $unsigned((~|reg10)))));
            end
          else
            begin
              reg10 <= $unsigned(reg11);
              reg11 <= wire0[(2'h3):(1'h0)];
              reg12 <= $unsigned(((8'ha4) * $signed($signed($signed(wire6)))));
              reg13 <= wire8[(3'h7):(1'h0)];
              reg14 <= $unsigned((~^(wire9 << (~|$unsigned(wire2)))));
            end
        end
      else
        begin
          reg10 <= wire2;
          reg11 <= ({(-(^~reg13)), wire6} & (({(reg14 < wire6)} ?
                  {(~reg10)} : ({wire8, wire3} ?
                      ((8'h9d) ? reg10 : (8'h9d)) : wire7)) ?
              $unsigned($unsigned($signed(wire7))) : reg10[(4'h8):(3'h7)]));
        end
    end
  assign wire15 = (&wire5[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      if (reg10)
        begin
          reg16 <= ($unsigned(wire9[(4'ha):(4'h9)]) ?
              $signed(wire15[(1'h1):(1'h0)]) : wire8);
        end
      else
        begin
          if ({reg11[(4'hd):(4'hb)]})
            begin
              reg16 <= (reg12[(3'h5):(1'h1)] ?
                  {reg13,
                      ({$unsigned(reg12), wire3} ?
                          $signed((wire5 ~^ wire8)) : wire3)} : wire9);
              reg17 <= (&wire9[(4'hb):(1'h1)]);
              reg18 <= $unsigned($unsigned($signed($unsigned($unsigned(reg14)))));
              reg19 <= (&$unsigned($signed($signed(reg16[(4'hd):(4'hd)]))));
            end
          else
            begin
              reg16 <= (|reg19[(3'h5):(1'h1)]);
              reg17 <= reg14[(3'h7):(1'h0)];
              reg18 <= (((8'h9f) + ((wire6 ?
                  (+wire1) : ((8'hba) & wire8)) << $unsigned(wire6))) * $unsigned(reg19[(1'h0):(1'h0)]));
            end
          reg20 <= ((wire6 || wire0) ?
              (wire1 > (~|({wire9,
                  reg14} ^~ $unsigned(reg18)))) : $unsigned(wire6));
        end
      reg21 <= wire4[(4'he):(3'h6)];
      if ($unsigned((!(~^$signed(reg10[(4'h8):(3'h7)])))))
        begin
          reg22 <= $unsigned(reg20[(1'h0):(1'h0)]);
          if ($signed((&(((wire7 ? wire15 : wire15) ?
                  (reg14 && wire5) : (reg10 ? reg17 : wire7)) ?
              $unsigned({(8'hbe), reg16}) : reg20))))
            begin
              reg23 <= $signed($signed((reg21 >= ((wire6 ^~ wire9) ?
                  (8'haa) : ((8'hac) ? reg11 : reg16)))));
              reg24 <= {reg13[(4'hb):(3'h6)], wire8};
              reg25 <= $unsigned((~$unsigned(reg24)));
            end
          else
            begin
              reg23 <= $unsigned((reg11 ?
                  reg12[(1'h1):(1'h1)] : (reg17[(2'h3):(2'h3)] ?
                      $unsigned((wire4 ?
                          reg23 : wire9)) : reg23[(4'h8):(3'h4)])));
              reg24 <= reg10;
              reg25 <= $signed(wire6[(4'h8):(3'h4)]);
              reg26 <= (~&$signed(($signed($signed(wire1)) > wire2)));
            end
          reg27 <= ($unsigned((($unsigned(reg11) ?
                  $signed(wire1) : (reg25 ? reg24 : wire9)) ?
              $signed((reg24 ?
                  reg16 : reg21)) : ((!reg25) || wire9[(3'h7):(3'h4)]))) ^ {{($unsigned(reg14) ?
                      reg25[(4'h8):(3'h5)] : (~reg22))},
              ($signed(reg26[(4'h9):(1'h0)]) ^~ ($unsigned((8'hb3)) ?
                  {(7'h42)} : $unsigned(wire3)))});
          if (($signed(($unsigned(wire3[(4'h9):(4'h8)]) ?
              $signed((wire2 != reg20)) : ($signed(reg26) ?
                  (~^(8'ha2)) : $unsigned(reg11)))) <= (reg22 >= (8'ha6))))
            begin
              reg28 <= (&(^(~&($unsigned(wire1) + (wire7 ? reg27 : wire4)))));
              reg29 <= {((reg13[(3'h5):(2'h3)] + ($signed(reg18) + (8'ha6))) ?
                      $signed((reg26 ?
                          $unsigned(wire15) : $signed(wire8))) : {($signed(reg20) ?
                              (wire6 == reg23) : (wire3 ? reg27 : wire5)),
                          $signed(((8'h9c) <<< reg19))})};
              reg30 <= (reg22[(3'h5):(3'h5)] ?
                  reg14 : {(~$signed($signed(reg14)))});
            end
          else
            begin
              reg28 <= $signed(reg26[(5'h12):(4'hc)]);
              reg29 <= (^~($unsigned((reg26 ?
                  (reg18 > (8'hb8)) : (reg17 || (8'hbc)))) == $signed($unsigned({(7'h41),
                  reg24}))));
              reg30 <= reg14[(4'hb):(3'h4)];
              reg31 <= ($signed((($unsigned((7'h41)) ?
                  $signed(wire4) : reg23[(3'h6):(2'h3)]) == ($unsigned(reg27) < $signed(reg27)))) ^~ (wire2 & ($unsigned((8'hb9)) ?
                  (!$unsigned(reg24)) : reg11)));
            end
        end
      else
        begin
          reg22 <= ($signed($unsigned($signed($signed(reg21)))) ?
              ({reg30} ?
                  $unsigned((reg10[(3'h7):(2'h3)] ~^ $signed((8'hb3)))) : $unsigned(reg13)) : $signed(wire2[(1'h0):(1'h0)]));
        end
    end
  assign wire32 = ($unsigned((+$signed($signed(wire9)))) ?
                      ((((reg21 >>> wire2) ?
                              $unsigned(wire7) : (~&reg14)) & $signed($unsigned((8'hab)))) ?
                          wire4 : {wire0,
                              (8'had)}) : $signed($signed({$signed(wire15),
                          $signed(reg22)})));
  always
    @(posedge clk) begin
      reg33 <= $unsigned(reg10);
    end
  assign wire34 = $unsigned(reg12[(2'h3):(2'h2)]);
endmodule
