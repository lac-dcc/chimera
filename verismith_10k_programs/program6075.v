module top
#(parameter param36 = (^((~^((+(7'h40)) != (~^(8'h9d)))) ? {(((8'hb3) ? (8'hb6) : (8'hac)) >> (|(8'haf)))} : (~|(((8'haf) ? (8'hab) : (8'haf)) ? (-(8'hab)) : ((8'had) ? (8'hba) : (8'hae)))))), 
parameter param37 = (&(param36 <<< (((param36 - (8'ha9)) <<< (param36 >>> param36)) + param36))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~^wire3[(1'h1):(1'h1)]);
      reg5 <= $signed((~^$signed(((wire1 ?
          wire3 : (8'hbb)) << (wire1 > wire2)))));
      if (reg5)
        begin
          reg6 <= (wire0 ?
              $unsigned(($unsigned((reg5 >= reg5)) ^ wire3)) : (+wire0[(1'h1):(1'h1)]));
        end
      else
        begin
          reg6 <= $signed($signed($unsigned(wire1)));
          reg7 <= $signed((wire1[(1'h0):(1'h0)] ?
              wire0[(2'h3):(1'h0)] : (^$signed($unsigned(reg4)))));
          if ((($signed(reg7) ?
              $signed($unsigned(reg7)) : {(wire1 == $unsigned(wire3))}) ^~ (wire1[(1'h0):(1'h0)] & reg6)))
            begin
              reg8 <= ((~&$unsigned(reg7[(5'h11):(4'hf)])) <<< $unsigned(wire3[(2'h2):(1'h0)]));
              reg9 <= ($unsigned(({$unsigned(wire1)} ?
                      $unsigned(wire0) : wire1)) ?
                  wire1[(2'h3):(2'h2)] : (reg5 & $signed($signed({(8'hb7)}))));
            end
          else
            begin
              reg8 <= ($unsigned((($unsigned(reg5) ?
                  $unsigned((8'haa)) : $signed(reg7)) >= $unsigned((reg8 ?
                  wire1 : wire3)))) - reg5[(3'h7):(3'h7)]);
              reg9 <= {((8'ha3) ? {$unsigned((reg8 > (8'ha0)))} : wire3),
                  $signed($unsigned($unsigned(reg5)))};
              reg10 <= (($unsigned((wire1 >>> (wire1 ?
                      reg7 : reg9))) > ((&wire1[(2'h2):(1'h1)]) == wire1)) ?
                  ($unsigned($unsigned((reg4 ?
                      reg5 : wire1))) ^~ (wire3 < ((~(8'ha3)) ?
                      $signed(wire3) : (reg7 + wire3)))) : (reg6[(1'h0):(1'h0)] ?
                      reg5 : ($unsigned(reg9[(1'h0):(1'h0)]) ?
                          ((wire1 + reg5) << {wire0, wire0}) : (|(~^reg4)))));
              reg11 <= reg10[(1'h1):(1'h1)];
              reg12 <= {(-reg11[(4'hf):(4'hc)]), wire0};
            end
          if (reg10)
            begin
              reg13 <= $unsigned(($signed(($signed(reg8) > (reg12 * reg7))) < ({reg9[(4'he):(4'he)],
                      ((8'hba) ? (8'hb6) : reg10)} ?
                  (|(^reg9)) : $unsigned($unsigned(wire3)))));
              reg14 <= ($signed($signed(wire3[(1'h0):(1'h0)])) ?
                  $signed(($unsigned($signed(reg9)) > (&((8'h9d) ?
                      reg11 : reg13)))) : $unsigned($unsigned(reg12)));
              reg15 <= (((^~$signed(reg12)) ?
                      reg14 : $signed(reg5[(3'h4):(3'h4)])) ?
                  $unsigned($signed({$signed(wire0),
                      $unsigned((8'h9c))})) : (($unsigned({wire1, wire2}) ?
                      wire2[(2'h2):(1'h0)] : $unsigned($unsigned(reg11))) >>> reg12[(4'ha):(4'h9)]));
            end
          else
            begin
              reg13 <= ($signed($unsigned({(reg8 ? reg5 : reg8),
                      (~&(7'h43))})) ?
                  (~^$signed(reg8[(3'h5):(2'h3)])) : reg10[(2'h2):(2'h2)]);
            end
          reg16 <= (~|$unsigned(reg4));
        end
    end
  always
    @(posedge clk) begin
      if (wire3[(1'h0):(1'h0)])
        begin
          reg17 <= (~^wire0[(3'h4):(2'h3)]);
          reg18 <= ((8'hb5) ?
              ({reg15} >> $signed(reg9[(3'h5):(3'h4)])) : $signed($unsigned(($unsigned(reg5) ?
                  $unsigned(reg14) : $signed(reg11)))));
          reg19 <= {wire0, (!(+({reg6, wire3} ? (-wire2) : $signed(reg10))))};
          reg20 <= (~|($signed((~^$unsigned(wire3))) ?
              ($unsigned(reg5) == (|{wire0, wire3})) : ((8'hb7) ^ reg11)));
          reg21 <= $signed($unsigned(((~|reg20) ? reg7 : (^~$unsigned(reg5)))));
        end
      else
        begin
          reg17 <= ($signed((-$signed({wire1}))) <<< wire3);
          reg18 <= ($signed(($signed((~|reg5)) ?
              $unsigned((reg11 ? reg20 : wire2)) : ((wire2 ?
                  reg21 : wire1) != reg17[(5'h11):(4'he)]))) >>> $unsigned((|($signed(reg17) > reg17[(4'hd):(3'h5)]))));
          reg19 <= $unsigned((((!(8'ha4)) <<< ((&wire3) || $signed(reg15))) ?
              $signed(reg12) : (^~{$signed(reg11)})));
          reg20 <= reg11[(4'hd):(1'h0)];
        end
      reg22 <= reg14;
      if (reg20)
        begin
          reg23 <= reg4[(5'h13):(5'h11)];
        end
      else
        begin
          reg23 <= $signed(reg4[(3'h4):(1'h0)]);
          reg24 <= (reg22 ?
              $unsigned(reg18[(4'he):(4'h8)]) : $signed($unsigned((&$unsigned(reg16)))));
          reg25 <= $signed((!(~&(reg9[(2'h2):(1'h1)] ?
              reg8[(1'h0):(1'h0)] : {reg23, wire2}))));
          if ($unsigned(((!{{wire3}, {reg21, (8'hbd)}}) - reg4)))
            begin
              reg26 <= reg17;
            end
          else
            begin
              reg26 <= reg7[(5'h10):(4'he)];
              reg27 <= reg15;
              reg28 <= (8'hb4);
            end
          if ($unsigned((+$signed(wire1))))
            begin
              reg29 <= ({reg6[(1'h1):(1'h0)],
                      (wire1 ? (!$signed(reg20)) : reg16[(4'h9):(3'h4)])} ?
                  ($signed((~$signed(reg27))) ?
                      $signed(reg11) : (^~((reg23 | reg10) <= $signed(reg22)))) : {{wire1[(2'h3):(1'h0)]},
                      ((((8'hb2) == reg11) ^~ reg17) ? reg21 : {(^~reg8)})});
              reg30 <= wire0;
              reg31 <= {{reg7[(5'h12):(3'h5)], reg16[(4'ha):(3'h6)]}};
              reg32 <= $signed(reg13);
            end
          else
            begin
              reg29 <= $unsigned(($signed((reg20[(4'he):(4'h9)] > {reg28})) ?
                  (8'h9c) : {{$unsigned(reg27)}, reg27[(1'h0):(1'h0)]}));
              reg30 <= ($unsigned(($signed((~^reg16)) ^~ {(|reg12),
                      {(7'h42), reg15}})) ?
                  $signed(({reg11[(3'h4):(3'h4)],
                      {reg14, reg22}} ^ ($signed(reg4) ?
                      (wire2 ?
                          (7'h43) : wire0) : $unsigned(reg23)))) : $unsigned($signed($signed($unsigned(reg28)))));
              reg31 <= ($signed(((reg10[(1'h1):(1'h0)] ^ reg25[(4'ha):(4'ha)]) ~^ ((reg19 ?
                      reg10 : wire0) >>> (|reg24)))) ?
                  $signed($unsigned(((reg17 * reg12) ?
                      (reg7 ?
                          reg4 : reg28) : (~^reg11)))) : (|{((^reg20) ^~ reg17[(3'h7):(1'h1)]),
                      $signed((!(8'ha6)))}));
              reg32 <= (((8'hb2) >> ((((8'ha0) ?
                  reg26 : reg21) > $unsigned(wire1)) == (~&reg13))) & wire2[(1'h0):(1'h0)]);
            end
        end
    end
  assign wire33 = reg17[(4'hf):(4'ha)];
  assign wire34 = $unsigned($signed((^~(+$signed(reg27)))));
  assign wire35 = {(reg19[(3'h7):(3'h7)] ?
                          (~^((^(8'ha5)) || (reg16 ?
                              (8'h9e) : wire33))) : $signed({wire0[(4'ha):(3'h4)]})),
                      {reg29, reg13[(3'h7):(2'h2)]}};
endmodule
