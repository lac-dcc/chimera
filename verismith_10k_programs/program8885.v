module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire10;
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire10,
                 reg37,
                 reg36,
                 reg35,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (~|(~&($signed({wire0}) == (+(&wire0)))));
      reg6 <= wire4;
      reg7 <= (~|reg5);
      reg8 <= $unsigned(({(|wire0[(1'h1):(1'h1)])} ?
          wire1[(4'h8):(3'h4)] : $unsigned($unsigned(wire3))));
      reg9 <= reg7;
    end
  assign wire10 = reg8[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire3[(3'h5):(1'h0)])
        begin
          reg11 <= wire3;
        end
      else
        begin
          reg11 <= wire2;
          reg12 <= ({(wire2[(3'h5):(1'h0)] * ((~&reg8) | reg11[(3'h7):(3'h5)])),
              ((^reg5[(3'h4):(1'h0)]) && reg8)} >= {(wire10[(3'h5):(2'h2)] == ($unsigned(reg7) ?
                  $signed(wire3) : $signed(reg5))),
              reg8[(1'h0):(1'h0)]});
          if (reg11)
            begin
              reg13 <= (reg8 <<< wire3);
              reg14 <= reg9;
            end
          else
            begin
              reg13 <= reg8[(3'h4):(1'h1)];
            end
          if ($unsigned($unsigned((($unsigned(wire1) ^~ reg5) ?
              $unsigned(reg14[(3'h5):(2'h3)]) : ((8'ha4) | reg5[(4'h9):(1'h0)])))))
            begin
              reg15 <= reg11[(3'h7):(3'h5)];
              reg16 <= ((^$signed((!(~&wire3)))) ?
                  reg8[(2'h3):(1'h0)] : (&$unsigned((|$signed(wire4)))));
              reg17 <= $unsigned(($signed(reg6[(1'h1):(1'h0)]) ^~ (&(reg9[(1'h1):(1'h0)] >>> $unsigned(reg14)))));
              reg18 <= {($signed({reg14}) >>> {reg5[(3'h5):(1'h0)]}),
                  (!$signed(wire10))};
            end
          else
            begin
              reg15 <= {reg7[(2'h2):(2'h2)]};
            end
        end
      if (($unsigned((wire10[(2'h3):(1'h1)] ?
          ($unsigned(reg14) ? wire4[(5'h10):(1'h0)] : {reg7}) : {(!reg13),
              (wire4 || wire3)})) << reg12))
        begin
          reg19 <= reg11;
          reg20 <= wire4;
          reg21 <= $signed((wire2[(3'h5):(3'h5)] ?
              reg12 : reg14[(4'hd):(4'h8)]));
        end
      else
        begin
          reg19 <= (^((~^$signed((~&reg8))) || $unsigned($signed((&reg16)))));
          if ($signed($signed(wire2[(3'h4):(1'h1)])))
            begin
              reg20 <= ({((+(reg11 ? reg16 : reg6)) & $signed(((8'haf) ?
                      reg17 : reg12))),
                  reg18} < (~|$unsigned(reg14)));
            end
          else
            begin
              reg20 <= reg8;
              reg21 <= ((~&$signed($unsigned(wire4))) ?
                  reg5 : (reg17[(3'h7):(2'h3)] + ({{wire10},
                      (wire0 >= reg19)} <= (!(reg7 - wire10)))));
              reg22 <= (reg17 >>> (reg14[(5'h10):(3'h7)] > {(~&(^reg9)),
                  reg11[(3'h6):(3'h5)]}));
              reg23 <= $signed(wire10[(3'h6):(2'h2)]);
            end
          reg24 <= reg18;
        end
      if (reg23)
        begin
          reg25 <= reg6[(3'h5):(3'h5)];
        end
      else
        begin
          reg25 <= (($signed((~|(reg19 != reg13))) ?
              $signed(reg5[(3'h4):(1'h0)]) : reg17[(4'h9):(1'h0)]) ~^ ((~^$signed($signed(reg11))) ?
              $unsigned($unsigned((|reg19))) : (~&reg11)));
          if ({(reg5[(3'h6):(2'h3)] & reg14[(4'hc):(2'h2)])})
            begin
              reg26 <= ({reg18[(3'h7):(3'h7)]} & ((&($unsigned(reg25) ?
                  $unsigned(reg7) : reg18)) || (reg24[(2'h2):(1'h1)] ?
                  $unsigned((^(8'hb5))) : reg17[(3'h5):(1'h0)])));
              reg27 <= {($unsigned((^~$signed(reg26))) ?
                      $unsigned((reg21 > reg20)) : {wire3[(2'h2):(1'h0)]}),
                  $unsigned(reg16)};
            end
          else
            begin
              reg26 <= (($unsigned($signed((~&reg8))) ?
                      $unsigned($signed(reg18[(5'h12):(5'h12)])) : reg9) ?
                  {(^$signed(((7'h41) ? reg22 : reg21))),
                      $signed($unsigned({reg15}))} : $signed(reg15[(1'h0):(1'h0)]));
              reg27 <= (~|reg26[(3'h7):(3'h5)]);
              reg28 <= wire3[(3'h7):(1'h0)];
              reg29 <= ((~^(!reg28)) + reg12[(2'h2):(1'h1)]);
            end
          reg30 <= wire3[(1'h1):(1'h0)];
        end
    end
  assign wire31 = {$unsigned((reg8[(1'h0):(1'h0)] << wire0))};
  assign wire32 = reg22[(1'h0):(1'h0)];
  assign wire33 = (&(+{$unsigned((+reg6)), (~^(+reg12))}));
  assign wire34 = {$signed(reg25)};
  always
    @(posedge clk) begin
      reg35 <= wire1;
      reg36 <= wire33[(3'h6):(1'h0)];
      reg37 <= ((^~reg27) || ((8'hbc) || (({(8'hb6)} << (reg19 <= (8'hae))) ^ ({reg22,
          wire32} < $unsigned(reg14)))));
    end
endmodule
