module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire5,
                 wire4,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed(($unsigned(((wire0 | wire0) == ((8'ha0) ?
                         (8'hbd) : (8'hbc)))) ?
                     ({$unsigned((8'h9e))} <= $signed((&(8'hae)))) : ((&(wire1 != wire0)) == $signed((~|wire0)))));
  assign wire5 = $signed(((!wire4[(5'h10):(3'h5)]) + wire4));
  always
    @(posedge clk) begin
      if ((+$signed(($signed(wire1) << $signed((wire2 ? (8'hbe) : wire2))))))
        begin
          reg6 <= ((^~($unsigned($signed(wire1)) && (~(wire5 ?
                  wire5 : wire4)))) ?
              wire0 : $signed((^$unsigned((|wire1)))));
        end
      else
        begin
          reg6 <= $unsigned(wire4);
          reg7 <= $unsigned(((8'ha8) <= ((wire1[(5'h12):(4'hf)] ?
                  wire2[(2'h3):(2'h2)] : (wire4 != (8'ha8))) ?
              reg6 : wire5)));
          if ((((-((wire0 ? (8'haf) : wire5) ?
                  (wire1 || wire0) : ((8'hbd) == wire4))) >>> ($signed(wire2[(1'h1):(1'h1)]) < wire5)) ?
              {wire1} : $signed((^wire3))))
            begin
              reg8 <= (8'hbf);
              reg9 <= (~&(8'h9f));
              reg10 <= $signed($signed(reg7[(1'h0):(1'h0)]));
              reg11 <= (&$unsigned($signed((!((8'hbb) ? wire3 : reg8)))));
              reg12 <= ((^reg8[(2'h2):(1'h1)]) >= (wire3 ?
                  $unsigned((|(reg11 != wire1))) : $unsigned(($signed(wire0) ?
                      $signed((7'h43)) : (reg7 >>> reg9)))));
            end
          else
            begin
              reg8 <= (!reg7[(3'h6):(1'h1)]);
            end
        end
      reg13 <= {$signed((((reg10 ? (8'ha0) : (8'ha4)) - $signed(wire4)) ?
              ($unsigned((8'ha3)) >= $signed(reg11)) : reg6))};
      reg14 <= (~^$signed($unsigned((^{wire3, (8'had)}))));
      reg15 <= $unsigned(reg7);
      if ((wire2[(3'h4):(3'h4)] ?
          $signed(($unsigned(((8'hb0) ? (8'hae) : reg14)) - wire5)) : (8'hab)))
        begin
          reg16 <= $signed(reg12[(2'h3):(2'h3)]);
          reg17 <= (&(8'had));
          if (reg11[(4'hb):(4'ha)])
            begin
              reg18 <= $unsigned((reg15[(1'h0):(1'h0)] ?
                  ((reg13[(4'hc):(1'h0)] ?
                          (~^reg15) : ((8'ha8) ? wire4 : wire0)) ?
                      $unsigned(reg17) : $signed($signed(reg6))) : ((~&$signed(wire4)) | reg11[(4'hd):(3'h6)])));
              reg19 <= reg9;
              reg20 <= reg19;
            end
          else
            begin
              reg18 <= (&$signed({$unsigned(reg18), {{(7'h40)}, (+wire5)}}));
              reg19 <= $unsigned((~(reg9 ?
                  (!reg6) : $signed((reg12 ? reg14 : reg8)))));
              reg20 <= $unsigned($signed(wire0));
              reg21 <= $unsigned((^$signed($signed({reg16, reg18}))));
              reg22 <= (|{reg18[(3'h6):(2'h2)]});
            end
          reg23 <= ({wire0} ?
              {$signed((reg19 | {wire1, reg22})),
                  $unsigned((^~(reg22 ? reg20 : wire0)))} : (($unsigned((reg10 ?
                      reg16 : wire5)) ?
                  (wire0 + $unsigned(wire2)) : reg16) + ($unsigned($signed(reg18)) & (reg19 == (reg18 ?
                  (8'had) : wire4)))));
          reg24 <= (-(&($signed((^~reg6)) ?
              ($signed((8'ha1)) <= {reg15}) : reg20)));
        end
      else
        begin
          reg16 <= $unsigned(reg13[(5'h12):(4'hd)]);
          if (((reg18[(3'h5):(2'h3)] ?
              (((reg20 ? reg21 : reg6) ^~ $signed(reg14)) ?
                  ($signed(reg21) ?
                      (wire2 != reg12) : reg23) : (~|$unsigned(reg9))) : reg18[(3'h5):(2'h3)]) == (reg14[(4'ha):(3'h6)] ~^ $signed(((-reg13) ?
              (reg11 < wire4) : $signed(wire2))))))
            begin
              reg17 <= (reg19 * ({$unsigned($unsigned(reg16))} ?
                  {($signed(reg11) ?
                          $unsigned(reg12) : $unsigned((8'hab)))} : (((reg6 ?
                      reg11 : wire1) >>> {reg20}) ~^ reg14[(1'h0):(1'h0)])));
              reg18 <= (+(({{reg10, reg8}, reg9[(4'he):(3'h7)]} ?
                  $unsigned(reg14[(2'h2):(1'h1)]) : ((~&wire0) ?
                      reg8 : $unsigned(wire4))) ^ $unsigned($signed((~wire1)))));
            end
          else
            begin
              reg17 <= $unsigned((^(~&reg7[(2'h3):(1'h1)])));
              reg18 <= (wire3[(2'h3):(1'h1)] ?
                  reg17[(2'h2):(2'h2)] : ($unsigned((|$signed(reg12))) ?
                      wire0 : $signed(((!reg18) < $unsigned(wire4)))));
              reg19 <= (((((~|(8'haa)) | $signed(reg15)) ?
                          $signed(reg23[(4'h9):(1'h1)]) : ((reg9 < (8'hbd)) ?
                              $unsigned(reg24) : (|(8'ha9)))) ?
                      reg22 : wire3[(2'h3):(1'h0)]) ?
                  reg22[(1'h1):(1'h1)] : (reg11 ?
                      ((~$signed(reg12)) ?
                          $signed({reg7, reg15}) : ($signed(reg7) ?
                              {reg18,
                                  reg12} : (-reg6))) : reg12[(2'h3):(1'h0)]));
            end
          reg20 <= reg10;
          reg21 <= ((|reg12[(2'h2):(1'h0)]) ?
              $unsigned(reg15) : $signed(((~(&reg11)) ?
                  ($unsigned(reg24) || {reg8}) : ($unsigned((7'h41)) ?
                      $unsigned(wire0) : {wire0, reg19}))));
          reg22 <= (($signed(reg17[(2'h3):(2'h3)]) <<< (^~(^(reg13 ?
                  reg12 : reg7)))) ?
              reg14 : ($signed(reg16) <<< {($signed(reg6) == {reg7, reg21})}));
        end
    end
  assign wire25 = (wire4[(4'hc):(2'h3)] ? reg10 : reg6);
  assign wire26 = $unsigned((reg17 <= $unsigned((~|reg20[(4'h9):(3'h4)]))));
  assign wire27 = $unsigned($signed(reg20[(3'h4):(2'h2)]));
  assign wire28 = (^$signed((wire5[(1'h0):(1'h0)] & $signed((reg17 ?
                      wire2 : reg10)))));
  assign wire29 = reg9;
  assign wire30 = (-$signed($signed($unsigned((reg9 ? reg23 : wire25)))));
  assign wire31 = $unsigned((^$signed(reg17[(3'h5):(1'h0)])));
  assign wire32 = reg7[(3'h5):(3'h4)];
  assign wire33 = $signed({$unsigned($unsigned(reg17[(3'h4):(3'h4)])),
                      ($unsigned(wire32[(3'h4):(1'h1)]) ?
                          ((|reg13) ?
                              {reg22, reg7} : reg10) : (!(wire31 ^~ wire3)))});
  assign wire34 = {(($unsigned($unsigned((8'ha4))) ^ reg20[(3'h4):(2'h2)]) <<< wire32),
                      ($unsigned(reg6) ?
                          $signed($signed(reg18[(4'h8):(3'h4)])) : $unsigned(wire29))};
  always
    @(posedge clk) begin
      reg35 <= $signed({$unsigned(wire28)});
      reg36 <= ((((~&(-reg9)) ? (~|(wire30 ? wire0 : wire1)) : $signed(reg10)) ?
          $signed((~|$unsigned(reg7))) : (~&$unsigned(wire3))) >> (8'h9c));
      reg37 <= (reg35 < reg16[(1'h1):(1'h0)]);
      reg38 <= ($signed(($signed($unsigned(reg6)) << {reg37[(4'hb):(3'h5)],
              reg20})) ?
          ($signed($signed((reg35 >> wire2))) < reg9) : {reg22[(4'h8):(2'h3)],
              (~&reg23)});
    end
  assign wire39 = ($signed({wire30[(3'h4):(2'h2)],
                      wire28}) < (&($unsigned((reg20 ^ reg14)) == ($unsigned(reg16) && reg14))));
  assign wire40 = ($signed($signed(reg37[(4'hc):(1'h0)])) * ($signed($unsigned($unsigned(wire34))) ?
                      $signed(({reg6,
                          wire29} && (reg6 > wire34))) : ($unsigned((!reg13)) ?
                          reg20 : wire30)));
endmodule
