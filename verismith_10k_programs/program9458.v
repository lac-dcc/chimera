module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire18,
                 wire17,
                 wire16,
                 wire5,
                 wire4,
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
  assign wire4 = (~|(wire3[(5'h11):(3'h6)] ?
                     (^((wire3 ?
                         (8'hb7) : wire3) | (wire1 >> wire1))) : $signed((~$signed((8'hb6))))));
  assign wire5 = (8'ha5);
  always
    @(posedge clk) begin
      reg6 <= {wire1};
      reg7 <= wire2;
      reg8 <= wire0[(4'h9):(3'h4)];
      if (wire0[(4'h8):(3'h7)])
        begin
          if (reg6)
            begin
              reg9 <= $unsigned(wire2);
              reg10 <= (|reg7[(3'h5):(3'h4)]);
              reg11 <= reg8;
              reg12 <= reg7;
              reg13 <= reg9;
            end
          else
            begin
              reg9 <= (~^(((((7'h44) + (7'h41)) >>> (wire3 != reg6)) ^ {wire2[(5'h11):(1'h0)]}) ?
                  (^((reg8 & reg8) > $unsigned(wire2))) : (wire3[(5'h12):(4'hd)] + (wire0[(4'ha):(1'h1)] != reg12))));
              reg10 <= (($signed(((~|reg12) ?
                          {reg8, reg10} : wire3[(1'h1):(1'h1)])) ?
                      ((reg7 ? (+wire3) : (reg12 ? reg8 : reg10)) ?
                          {reg12[(4'h9):(1'h1)],
                              wire4} : $unsigned($signed(reg6))) : ((reg8 ?
                              $unsigned(reg9) : (reg13 ? reg6 : (8'hbc))) ?
                          reg12 : $unsigned(((8'ha0) ? wire2 : reg10)))) ?
                  ((8'hbc) ?
                      ((8'hac) ?
                          reg12 : {$signed(wire5)}) : (8'hb4)) : (($unsigned((~|wire0)) ?
                          (wire4 ?
                              (^reg7) : $signed((8'h9e))) : $signed($signed((8'haf)))) ?
                      reg7[(4'h8):(3'h7)] : wire5));
              reg11 <= reg10;
              reg12 <= (($unsigned(reg9) ?
                      (wire3 ?
                          (~((8'hae) ?
                              reg12 : reg12)) : $unsigned(reg10)) : reg6[(2'h2):(1'h1)]) ?
                  reg10 : wire0[(4'h9):(3'h6)]);
              reg13 <= reg7[(2'h2):(1'h1)];
            end
          reg14 <= $unsigned($signed($signed($signed((wire3 ?
              (8'hbf) : reg9)))));
        end
      else
        begin
          if ({wire1[(2'h3):(2'h2)],
              ($unsigned($unsigned($signed(wire4))) ?
                  (~^wire0[(4'ha):(4'h8)]) : {{$signed(reg12)},
                      ($signed(reg6) ? $unsigned((7'h40)) : (reg6 | wire4))})})
            begin
              reg9 <= $signed($unsigned(reg12));
              reg10 <= wire4[(2'h2):(1'h0)];
              reg11 <= $unsigned(($signed((wire1[(4'hc):(3'h7)] ?
                  {(8'ha7), (8'ha4)} : {reg14})) | $unsigned((8'haf))));
            end
          else
            begin
              reg9 <= $signed($unsigned(wire4));
              reg10 <= reg7[(3'h5):(1'h1)];
              reg11 <= ((8'hab) >> ((~reg13[(4'he):(2'h3)]) << (reg8 - (reg12[(4'h8):(4'h8)] < (wire2 < wire1)))));
              reg12 <= wire3;
            end
          reg13 <= (-$unsigned(((~^$signed(reg11)) ?
              (~^(~|reg6)) : (reg13[(2'h2):(2'h2)] ?
                  $unsigned(wire1) : {wire4, wire4}))));
          reg14 <= (|reg12);
        end
      reg15 <= $unsigned($signed(reg8));
    end
  assign wire16 = reg13;
  assign wire17 = $signed({reg9,
                      ($unsigned(reg11) ?
                          ((reg8 ? reg8 : reg11) ~^ (wire0 ?
                              wire2 : reg12)) : {reg10[(4'hc):(4'hb)]})});
  assign wire18 = $unsigned($signed(wire0[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg19 <= reg6;
      reg20 <= (wire4 <= $signed($unsigned(($signed((8'hbd)) ?
          (+reg9) : (+reg10)))));
      reg21 <= ((^(~&reg20[(4'h8):(3'h6)])) & (^~((reg8 ?
          (reg20 ? wire5 : reg8) : $unsigned(reg19)) ^~ {(reg15 & reg14),
          (~^reg14)})));
      reg22 <= ($signed({(wire2 ? {wire0} : $unsigned(reg12)),
          $unsigned($unsigned(wire1))}) ^~ ((^~(reg8 ?
              (reg13 & wire18) : (~(8'hb2)))) ?
          (~|wire5) : ((~&(~|reg15)) > ((reg9 << wire4) ~^ (~&reg19)))));
      if ((^((wire16[(3'h6):(2'h2)] ? wire3 : wire0[(4'ha):(4'h9)]) ?
          reg20 : (reg11[(5'h12):(5'h12)] <<< reg15))))
        begin
          reg23 <= {(+reg10), reg11};
          reg24 <= ((((!$unsigned(wire4)) ~^ (wire2[(4'hd):(1'h0)] ?
                  $signed(reg8) : wire17)) ^~ {(-$signed((8'ha4)))}) ?
              ((((~|reg7) ? $unsigned(wire16) : $unsigned(reg14)) ?
                  ($signed(reg23) + $unsigned(reg22)) : ($unsigned(wire18) ?
                      $unsigned((8'haf)) : $signed((8'ha3)))) != (~^reg21[(3'h6):(3'h6)])) : (8'hb9));
        end
      else
        begin
          reg23 <= (({reg14} | ($unsigned(wire16[(5'h13):(3'h4)]) ~^ wire5)) ?
              reg7[(4'hd):(3'h7)] : $signed({((reg24 <<< wire1) && reg12[(3'h4):(1'h1)])}));
          reg24 <= ((|wire18) ?
              $signed(reg9[(1'h0):(1'h0)]) : $unsigned($unsigned(reg15)));
          reg25 <= {(~|(+$unsigned(wire1)))};
          if ($signed(($unsigned($unsigned($unsigned(reg10))) | reg10)))
            begin
              reg26 <= (reg19 ^ $unsigned({wire17[(2'h2):(1'h0)],
                  wire17[(1'h1):(1'h1)]}));
            end
          else
            begin
              reg26 <= (~|reg13[(2'h3):(2'h3)]);
              reg27 <= (wire2[(5'h15):(4'h8)] ?
                  {{reg14, $unsigned(reg14[(2'h3):(1'h0)])},
                      (8'hb4)} : $unsigned($signed(wire1)));
              reg28 <= reg25;
            end
        end
    end
  assign wire29 = reg25;
  assign wire30 = ($unsigned($unsigned(((~&reg20) * $unsigned(reg23)))) ?
                      $unsigned($signed(wire1[(5'h10):(4'hf)])) : (!$unsigned($signed(wire0[(4'ha):(3'h6)]))));
  assign wire31 = ((reg10 ?
                      wire4 : $unsigned((((8'ha9) & reg13) && (8'hb3)))) != (({(|wire3)} ?
                          wire2[(3'h5):(2'h3)] : ($signed(reg15) ?
                              (reg24 ?
                                  reg11 : (8'hbb)) : reg27[(3'h7):(2'h3)])) ?
                      ($signed({wire0, reg13}) ?
                          $unsigned((reg24 ?
                              (7'h41) : wire2)) : (~|$unsigned(reg19))) : $signed({(reg22 + reg10)})));
  assign wire32 = wire5;
  assign wire33 = $signed($signed((-($unsigned(reg22) || (8'haf)))));
endmodule
