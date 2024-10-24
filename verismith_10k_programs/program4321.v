module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire27,
                 wire22,
                 wire21,
                 wire4,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 (1'h0)};
  assign wire4 = $unsigned($unsigned((((wire2 >>> wire1) ?
                         (wire0 - wire3) : (wire0 ~^ (8'hb5))) ?
                     $unsigned((wire0 - wire3)) : $signed(wire0[(4'ha):(1'h1)]))));
  always
    @(posedge clk) begin
      reg5 <= (wire2[(1'h0):(1'h0)] * (wire3 < wire3[(1'h0):(1'h0)]));
      reg6 <= wire0;
      if (wire0[(2'h3):(1'h0)])
        begin
          if ({(~(8'haf))})
            begin
              reg7 <= wire3[(2'h2):(1'h1)];
              reg8 <= (+wire3);
            end
          else
            begin
              reg7 <= {{(((reg8 + (8'hae)) ?
                          (reg8 >>> reg5) : wire3) ~^ wire3[(1'h1):(1'h0)]),
                      reg8[(4'h8):(1'h0)]}};
            end
          reg9 <= (wire0 ?
              $unsigned($signed(((wire1 ^ wire2) || $signed(reg8)))) : ((reg5[(4'hd):(3'h6)] >= $signed($unsigned(reg7))) != ($unsigned((-wire0)) ?
                  $unsigned((wire3 ? reg5 : wire3)) : (reg8 >> {(7'h41)}))));
          reg10 <= {$unsigned((reg7[(1'h1):(1'h1)] * reg9[(1'h0):(1'h0)])),
              (8'ha6)};
        end
      else
        begin
          reg7 <= reg8[(3'h7):(1'h1)];
          reg8 <= reg5;
        end
      reg11 <= reg6;
      if ((((~|wire1[(3'h4):(1'h0)]) ?
              (((7'h43) == $signed(wire1)) ?
                  $unsigned($unsigned(reg11)) : $unsigned($unsigned(reg6))) : (wire0[(3'h5):(1'h1)] ?
                  $signed(wire1) : ((reg5 != wire3) ?
                      $unsigned(reg8) : wire0))) ?
          reg6 : (8'hb4)))
        begin
          reg12 <= ($signed(wire2) ?
              ($signed($unsigned(wire0)) >>> reg11) : (reg6[(3'h6):(3'h5)] ?
                  $unsigned($unsigned(((8'hb1) ?
                      (8'ha1) : reg5))) : $unsigned((8'hbd))));
          reg13 <= (8'ha5);
          reg14 <= reg13[(1'h1):(1'h0)];
          reg15 <= $signed((+(~|wire4)));
          reg16 <= $signed($signed(reg14[(2'h3):(1'h0)]));
        end
      else
        begin
          if ({(~|$signed($signed(wire1[(1'h1):(1'h1)]))),
              (~^((wire0[(4'hb):(4'h8)] ^ (reg13 ?
                  (8'hb0) : reg8)) == (~|$signed(reg7))))})
            begin
              reg12 <= $unsigned(($signed($signed($signed((8'h9f)))) >>> {((~reg13) ?
                      $unsigned(wire1) : reg9),
                  $unsigned(reg5)}));
              reg13 <= wire0;
              reg14 <= {$signed((($signed((8'ha5)) ? reg15 : {reg15}) ?
                      reg10[(4'hf):(1'h1)] : reg15)),
                  $signed($unsigned($signed(((7'h42) && reg6))))};
              reg15 <= (8'ha9);
              reg16 <= $signed(reg15[(1'h0):(1'h0)]);
            end
          else
            begin
              reg12 <= reg7[(4'ha):(3'h4)];
            end
          if (($signed(reg5[(4'hc):(4'ha)]) ?
              $unsigned((~^(~$unsigned(reg6)))) : ({reg13,
                      reg10[(4'ha):(4'ha)]} ?
                  $signed(((&reg10) ?
                      $signed(reg12) : $unsigned(reg9))) : ($signed($unsigned(wire3)) & ((wire0 >= reg14) << $signed(reg10))))))
            begin
              reg17 <= (|((reg7 ? ((wire2 || (8'ha9)) + reg7) : wire1) ?
                  reg6 : (&(reg9 ? $unsigned(reg6) : $signed((7'h44))))));
              reg18 <= $signed(wire2[(4'ha):(2'h3)]);
              reg19 <= $signed({wire4,
                  (reg14[(2'h3):(1'h0)] ?
                      wire2 : ((reg10 + reg6) ?
                          (wire3 | reg14) : {wire0, (8'ha2)}))});
              reg20 <= $unsigned(($unsigned(((~&reg8) ^~ $unsigned(reg8))) ?
                  reg12[(4'hf):(1'h1)] : {reg16,
                      ((reg12 ? wire4 : reg9) ?
                          (^~reg11) : wire1[(2'h3):(2'h3)])}));
            end
          else
            begin
              reg17 <= {{reg6[(1'h0):(1'h0)]}};
              reg18 <= $unsigned($signed($unsigned(reg9[(3'h4):(2'h2)])));
              reg19 <= $signed(wire1[(3'h4):(2'h3)]);
            end
        end
    end
  assign wire21 = ($signed(reg5[(3'h5):(3'h5)]) ?
                      ($unsigned((((8'ha6) ? reg14 : reg14) - {reg7,
                          reg13})) ^ (reg7 | (+reg19))) : $signed(($unsigned((reg13 >>> reg5)) ?
                          (~|$unsigned(reg13)) : $unsigned($signed((7'h44))))));
  assign wire22 = reg13;
  always
    @(posedge clk) begin
      reg23 <= (7'h43);
      reg24 <= reg12[(5'h12):(4'hf)];
      reg25 <= wire1;
      reg26 <= $signed(({((reg6 && wire4) ?
              $signed(reg13) : $signed(reg15))} ^~ wire2[(3'h4):(3'h4)]));
    end
  assign wire27 = $signed((reg24 ?
                      $signed($signed($signed(reg10))) : (wire21[(4'h8):(3'h5)] ?
                          wire22 : ({reg5, reg15} <<< ((8'ha5) * wire22)))));
  always
    @(posedge clk) begin
      if ((({reg15[(2'h2):(2'h2)]} == ({reg15[(2'h2):(2'h2)],
              $unsigned(reg6)} - $signed(reg19[(3'h6):(2'h2)]))) ?
          ($unsigned($signed($signed(reg25))) > reg7) : {{(^~$signed(reg11))}}))
        begin
          reg28 <= $unsigned(reg11[(5'h13):(4'hb)]);
        end
      else
        begin
          reg28 <= (reg5 ?
              ($unsigned((-reg5[(1'h1):(1'h0)])) >= (reg28 && (~^(reg6 > reg5)))) : ($signed(($signed((8'hb2)) ?
                  $signed(reg23) : (^~reg11))) * (reg17[(4'ha):(1'h1)] ?
                  ($signed(reg28) ?
                      (~|reg28) : (reg16 ? wire22 : reg23)) : reg6)));
          reg29 <= reg16;
          reg30 <= wire21;
          if ((+reg25[(2'h3):(2'h2)]))
            begin
              reg31 <= reg10[(1'h0):(1'h0)];
              reg32 <= {reg6};
              reg33 <= wire3[(1'h0):(1'h0)];
            end
          else
            begin
              reg31 <= (reg14[(3'h5):(3'h5)] != (-$unsigned(((reg19 || reg32) ?
                  reg23[(3'h5):(3'h5)] : reg10[(4'he):(1'h1)]))));
            end
        end
      reg34 <= reg10[(4'hb):(2'h2)];
      reg35 <= (((((wire2 ? reg13 : wire0) ?
                      $unsigned(reg20) : (reg8 ? reg8 : (8'hbd))) ?
                  ((~&reg17) | wire4[(3'h5):(2'h2)]) : (!wire2)) ?
              ((reg24 ~^ reg29[(4'ha):(3'h5)]) ?
                  ($unsigned(reg17) ?
                      (+reg17) : $signed(reg9)) : reg9) : $signed(((wire4 ?
                  reg26 : reg10) & $signed((8'hb1))))) ?
          $unsigned(reg9[(4'hb):(2'h2)]) : (wire2 ?
              (!((wire0 ? wire4 : reg23) < (8'h9c))) : reg31[(3'h4):(3'h4)]));
      if (reg10)
        begin
          reg36 <= (~|$unsigned($signed(reg17[(4'hc):(3'h5)])));
          reg37 <= ((^~{reg29,
              $unsigned($unsigned(reg26))}) != ($signed((|(reg26 ?
                  reg12 : reg6))) ?
              wire4[(3'h6):(3'h5)] : (reg14 > $unsigned((wire1 - (8'hb3))))));
          reg38 <= reg19[(2'h2):(1'h0)];
        end
      else
        begin
          if ($signed(reg26))
            begin
              reg36 <= (~|$signed(reg11));
              reg37 <= reg16;
              reg38 <= ($unsigned($unsigned({$unsigned((8'hae))})) * ((({wire22,
                  reg36} ~^ (!reg32)) >= $signed({reg32})) >= $unsigned(((reg38 << reg12) ?
                  {(8'hbb)} : (reg26 != wire4)))));
            end
          else
            begin
              reg36 <= reg15[(1'h0):(1'h0)];
            end
          reg39 <= (^~$unsigned($unsigned(reg25[(1'h1):(1'h0)])));
        end
      reg40 <= $unsigned(reg17[(3'h4):(3'h4)]);
    end
  assign wire41 = reg26[(4'h8):(1'h0)];
  assign wire42 = $unsigned((-((reg36[(5'h11):(5'h11)] ?
                          $unsigned((8'hba)) : $unsigned(reg8)) ?
                      reg8[(3'h6):(3'h6)] : (~reg10))));
  assign wire43 = (($signed($signed((reg25 <= (8'hbf)))) ?
                          (|((^reg15) ?
                              reg11 : $unsigned(reg5))) : reg32[(1'h1):(1'h0)]) ?
                      $signed($signed(($unsigned(wire4) >>> (reg30 ?
                          reg20 : reg18)))) : (reg18[(4'hc):(3'h6)] < (8'ha3)));
  assign wire44 = $unsigned((wire0[(3'h6):(3'h6)] ?
                      (reg5 * (reg34[(3'h7):(3'h5)] & {reg18,
                          reg20})) : reg20[(4'ha):(4'ha)]));
endmodule
