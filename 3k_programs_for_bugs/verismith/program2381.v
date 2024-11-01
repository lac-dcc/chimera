module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire8,
                 wire7,
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
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~$signed({wire2, (~|$signed(wire2))}));
      reg5 <= $signed(((~(^~((8'hb2) | (8'hbb)))) < (wire1 ?
          ({wire3} ? $signed(reg4) : reg4) : wire0[(2'h3):(1'h0)])));
      reg6 <= {(8'ha3)};
    end
  assign wire7 = wire2[(1'h1):(1'h1)];
  assign wire8 = (!(wire7[(4'hb):(3'h6)] >> $signed(($signed(wire0) ?
                     $unsigned((8'ha1)) : ((8'hbc) >= reg6)))));
  always
    @(posedge clk) begin
      reg9 <= ($signed($unsigned($signed($signed(wire8)))) ?
          ($signed(($signed(wire7) ?
              $signed(wire8) : (reg4 ?
                  reg4 : reg6))) <<< wire3[(5'h13):(4'h9)]) : ($signed($signed((wire2 && wire3))) <<< (wire7 ?
              reg5[(3'h7):(2'h2)] : {reg5[(1'h0):(1'h0)]})));
      reg10 <= (+(+((reg5 ^ $signed(wire1)) ^ (~&wire3[(3'h7):(3'h4)]))));
      reg11 <= (~reg5[(4'h8):(1'h0)]);
      if (((~(~|{(8'had), {(8'hbf)}})) ?
          (~|(7'h43)) : {$unsigned({reg6[(2'h2):(1'h1)], (~|reg6)}),
              reg11[(1'h1):(1'h0)]}))
        begin
          reg12 <= $unsigned(($signed(({wire1,
              wire0} && (wire1 < wire8))) + $unsigned(wire8)));
          if ((|$signed((!$unsigned((8'ha4))))))
            begin
              reg13 <= $unsigned($signed(wire7[(4'h8):(2'h3)]));
              reg14 <= $unsigned({wire7[(3'h6):(3'h5)],
                  {wire7[(4'hc):(3'h7)], $unsigned({reg13})}});
              reg15 <= (!((((reg11 & wire2) * wire1[(3'h4):(2'h3)]) & ({(8'hbe)} & (reg14 ?
                  reg4 : (7'h42)))) < reg14));
              reg16 <= reg15[(4'ha):(2'h3)];
              reg17 <= {(+$signed($unsigned((reg9 ^~ wire1))))};
            end
          else
            begin
              reg13 <= reg10;
              reg14 <= (reg12[(2'h2):(1'h1)] ?
                  ((|reg15[(4'ha):(2'h3)]) ?
                      reg13 : reg17[(1'h0):(1'h0)]) : $unsigned($signed($signed((~&reg9)))));
              reg15 <= (wire8[(3'h4):(1'h0)] > {($unsigned(wire8[(3'h5):(3'h5)]) * $signed((reg14 ?
                      reg13 : reg15)))});
              reg16 <= (~|wire0);
            end
          reg18 <= {(8'hb1)};
        end
      else
        begin
          reg12 <= (8'ha1);
          reg13 <= reg18[(4'h8):(3'h7)];
          if ({wire8[(3'h6):(2'h2)]})
            begin
              reg14 <= $unsigned((({(+(8'hbd)), $signed(wire2)} == (reg6 ?
                  (reg16 & reg16) : reg16[(4'h8):(4'h8)])) && (^($signed(wire1) ?
                  $signed(wire3) : $unsigned((8'ha0))))));
              reg15 <= reg17[(1'h1):(1'h0)];
              reg16 <= ($signed((reg5[(4'h8):(4'h8)] ?
                      $unsigned(reg5[(4'he):(4'hb)]) : {(reg6 * reg15)})) ?
                  reg17[(4'h9):(1'h1)] : wire3);
            end
          else
            begin
              reg14 <= wire1;
              reg15 <= ({(^~$unsigned(reg4[(4'h9):(4'h8)]))} ?
                  wire3[(5'h10):(4'hc)] : (^~{$signed(reg18[(1'h1):(1'h1)])}));
              reg16 <= $unsigned(($unsigned(((~reg17) ?
                  $unsigned(reg9) : (8'hb0))) == $unsigned((wire0 || wire1))));
              reg17 <= (~&$unsigned(reg12));
              reg18 <= $signed($unsigned(({(~|wire3)} <<< (-((8'hae) ~^ reg17)))));
            end
          reg19 <= ((+(reg11[(1'h0):(1'h0)] ? reg13 : wire3[(3'h5):(1'h0)])) ?
              wire7 : (reg13 ?
                  $unsigned({reg13[(3'h4):(3'h4)],
                      $unsigned(reg12)}) : (~^reg17)));
          if (wire0[(2'h3):(2'h3)])
            begin
              reg20 <= reg19[(3'h7):(1'h1)];
              reg21 <= {(($signed((reg11 ? reg4 : reg6)) ?
                          reg16[(3'h6):(3'h5)] : (~&reg14[(3'h6):(2'h2)])) ?
                      $unsigned(wire0[(2'h3):(2'h3)]) : reg16)};
              reg22 <= ($unsigned(($signed($signed(wire0)) >> $unsigned((reg12 ?
                      reg14 : wire2)))) ?
                  ((($unsigned(wire2) ?
                              ((8'h9d) == reg9) : (reg21 ? wire8 : reg15)) ?
                          $signed((reg14 >>> reg9)) : (+(8'ha2))) ?
                      $signed($signed($unsigned((8'h9c)))) : ($unsigned((!wire0)) ?
                          (|(wire0 != reg6)) : $signed((reg18 ?
                              reg15 : reg10)))) : reg21[(3'h7):(2'h3)]);
              reg23 <= reg18[(4'h8):(3'h7)];
            end
          else
            begin
              reg20 <= $unsigned({$unsigned(({wire8, reg20} && (~reg23)))});
            end
        end
      reg24 <= reg22;
    end
  assign wire25 = (|(~reg19[(4'h8):(3'h7)]));
  assign wire26 = (^(~$unsigned((wire7 ? reg17 : $signed((8'hb2))))));
  assign wire27 = (((reg20[(3'h4):(2'h3)] ?
                          ((reg23 + reg10) <<< reg13) : wire26) + ({{wire26}} == $signed((^~reg4)))) ?
                      wire3[(4'hb):(4'hb)] : ($unsigned((reg20[(3'h4):(1'h0)] >> $unsigned(reg13))) * ((7'h43) ^~ ((8'hb1) ?
                          {wire3} : reg12))));
  assign wire28 = ((8'hbd) ?
                      (~^reg23[(3'h4):(2'h2)]) : (-$unsigned(wire0[(2'h3):(1'h1)])));
  assign wire29 = (($signed($unsigned($signed(reg14))) ?
                      {((reg19 - reg20) - (!reg6))} : $signed(reg6)) <<< (+(reg20[(1'h1):(1'h1)] && $unsigned(((8'hbe) ?
                      (7'h44) : wire2)))));
  assign wire30 = ((wire1[(1'h0):(1'h0)] || ($signed({reg4}) ~^ {{wire29,
                          wire25}})) != $unsigned({reg11[(2'h3):(2'h2)],
                      (+$unsigned(reg11))}));
endmodule
