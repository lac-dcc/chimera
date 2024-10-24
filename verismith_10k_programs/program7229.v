module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire39,
                 wire38,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
                 wire4,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg26,
                 reg25,
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
  assign wire4 = (wire2 ?
                     ((&wire3[(5'h11):(5'h11)]) << (((wire0 - wire0) & (+wire0)) ?
                         (^~((8'ha2) << wire0)) : wire3[(3'h5):(3'h5)])) : wire0);
  assign wire5 = $unsigned($signed(wire4));
  always
    @(posedge clk) begin
      reg6 <= wire2;
      reg7 <= $unsigned(reg6);
      reg8 <= (8'haf);
      if ($signed($signed((^~(!(wire4 ? reg8 : (8'ha9)))))))
        begin
          reg9 <= wire3;
          reg10 <= (((8'ha5) ? wire4 : (8'hac)) >= {{wire4},
              ({$unsigned(reg7)} ? $unsigned($unsigned((8'ha9))) : reg9)});
          if ((8'hb7))
            begin
              reg11 <= {reg10};
            end
          else
            begin
              reg11 <= wire3;
              reg12 <= ($signed(wire3) ?
                  wire5 : ($unsigned(($unsigned(reg11) ?
                          $signed(wire3) : reg9)) ?
                      (wire0[(4'h9):(2'h3)] && $unsigned(wire5[(3'h6):(3'h5)])) : $unsigned($signed($unsigned((8'haa))))));
              reg13 <= $signed($unsigned($signed(wire5)));
            end
          reg14 <= $signed($signed(((+(8'hba)) >= (7'h40))));
          reg15 <= (($unsigned(reg8[(2'h3):(2'h2)]) ?
              $unsigned(wire0[(3'h5):(1'h1)]) : (((!reg10) ?
                  $signed(wire3) : $signed(wire3)) < reg8[(2'h2):(2'h2)])) == $unsigned(reg7[(4'h8):(1'h0)]));
        end
      else
        begin
          reg9 <= {reg14[(1'h0):(1'h0)]};
          if ((|$signed((8'hb3))))
            begin
              reg10 <= ($unsigned(($unsigned((&wire2)) ?
                  (&$signed(wire5)) : $signed((reg7 - reg6)))) || reg8[(2'h3):(1'h1)]);
              reg11 <= {(((~&$unsigned((7'h44))) != reg9[(3'h7):(2'h3)]) ?
                      (^($signed(reg12) ?
                          $unsigned(reg11) : $unsigned(reg8))) : reg15)};
              reg12 <= $unsigned(reg14[(4'h8):(3'h4)]);
            end
          else
            begin
              reg10 <= (~reg9[(3'h5):(3'h5)]);
              reg11 <= ((~^((~&(wire2 || reg15)) ?
                  reg8 : $unsigned(wire4[(1'h0):(1'h0)]))) - reg12);
              reg12 <= (~{$unsigned(((wire3 <= reg6) + (+wire0))),
                  wire0[(5'h10):(4'hb)]});
            end
          reg13 <= {{wire2[(4'hc):(4'hc)],
                  $unsigned(($signed(reg6) ? (reg10 ? wire5 : wire1) : wire3))},
              {reg11,
                  {(&$signed((8'h9d))), ($unsigned(reg14) >= (reg9 < wire2))}}};
        end
      if ($signed(wire4[(2'h2):(2'h2)]))
        begin
          reg16 <= ($signed(reg8[(3'h5):(3'h5)]) ?
              ((~&{(reg9 ?
                      wire4 : reg10)}) ^ (8'ha3)) : (((^$signed(reg8)) | (^(8'haf))) ^~ ({reg15[(3'h4):(2'h3)],
                  (8'ha0)} >>> (reg15[(1'h0):(1'h0)] ?
                  (reg13 ? (8'ha2) : reg6) : reg10))));
          reg17 <= $unsigned((wire0[(3'h6):(1'h0)] ?
              wire2 : (reg12[(4'hb):(3'h6)] ?
                  ($unsigned(wire1) ?
                      $signed(wire4) : (reg15 > wire0)) : reg13)));
          reg18 <= $signed($unsigned($signed($unsigned($unsigned(reg11)))));
          reg19 <= ({reg6[(3'h7):(1'h1)],
              (reg11 * reg13[(2'h2):(1'h1)])} << ((reg17[(4'h8):(1'h1)] ?
              (&(wire2 - reg15)) : (reg18 + reg13)) | (reg13 < (|(reg14 > reg7)))));
        end
      else
        begin
          reg16 <= reg7[(2'h2):(1'h1)];
          reg17 <= ({$signed(wire4)} << (7'h40));
          reg18 <= $unsigned(reg19);
          reg19 <= (($signed((~|$unsigned(reg6))) ?
                  $signed((|(reg19 ?
                      wire5 : reg10))) : $signed(reg11[(4'h9):(1'h0)])) ?
              reg9 : (reg11 > (^(~&reg10[(2'h2):(1'h0)]))));
          reg20 <= (((8'hb1) ? wire2 : (~^$unsigned($signed((8'hbb))))) ?
              reg8 : reg6[(3'h4):(3'h4)]);
        end
    end
  assign wire21 = reg9[(3'h5):(1'h1)];
  assign wire22 = (~^((($unsigned(reg15) ?
                      (~|wire21) : $unsigned(wire5)) != (-reg16)) + reg9[(3'h5):(3'h5)]));
  assign wire23 = (~|$unsigned((|(wire3 && (wire22 ^~ reg6)))));
  assign wire24 = reg7;
  always
    @(posedge clk) begin
      reg25 <= $unsigned(wire5);
      reg26 <= ($unsigned(wire2) << reg17[(3'h5):(1'h1)]);
    end
  assign wire27 = $unsigned($signed(($signed({wire21}) ?
                      {wire24[(4'hc):(2'h2)]} : (!$signed(wire24)))));
  assign wire28 = $signed($signed({wire1, wire21}));
  assign wire29 = {$unsigned(wire2[(4'hc):(4'h9)]),
                      (reg13 ?
                          (((-wire3) << reg18[(3'h7):(2'h2)]) ?
                              reg10[(5'h12):(4'hf)] : (reg11[(1'h1):(1'h0)] << {wire4})) : (8'hae))};
  assign wire30 = (wire27 ?
                      reg9 : $signed(($unsigned($signed(wire23)) >= reg7)));
  assign wire31 = {(wire24 ?
                          reg16 : ((reg11[(4'h9):(4'h9)] ?
                              {reg26, wire28} : (+(8'had))) ~^ $signed((wire4 ?
                              wire5 : wire0)))),
                      ((~&{$unsigned(reg12), reg19[(2'h2):(2'h2)]}) ?
                          reg9 : (~wire3[(4'hb):(3'h5)]))};
  assign wire32 = reg18[(4'h8):(2'h3)];
  assign wire33 = (wire5 ?
                      (wire4 ?
                          wire31 : (&wire24[(3'h6):(3'h4)])) : $signed(({{(8'hb1),
                              reg20},
                          (reg9 ?
                              reg13 : reg8)} || ($signed(wire32) && wire2))));
  always
    @(posedge clk) begin
      if ($unsigned((reg15 ?
          ((~^$unsigned(reg18)) && $signed((reg25 ?
              reg16 : reg19))) : (~&((wire27 <= reg14) != $signed(reg8))))))
        begin
          if ((!reg17))
            begin
              reg34 <= reg13[(1'h1):(1'h1)];
              reg35 <= (wire33[(1'h1):(1'h0)] - ($unsigned({{wire2}}) ?
                  (|((-(7'h44)) ?
                      (reg11 - wire33) : (wire32 ?
                          (8'ha5) : (8'hb9)))) : $signed((^~reg6))));
            end
          else
            begin
              reg34 <= $unsigned($signed($signed(({wire29, (8'ha9)} ?
                  wire4 : {reg34, wire2}))));
            end
          reg36 <= wire0;
        end
      else
        begin
          reg34 <= $unsigned($signed($signed(reg35[(4'ha):(1'h0)])));
          if (wire21)
            begin
              reg35 <= ($signed(reg36[(1'h1):(1'h0)]) ?
                  wire30[(4'ha):(4'h9)] : (-reg15[(1'h0):(1'h0)]));
            end
          else
            begin
              reg35 <= reg25[(5'h12):(1'h0)];
              reg36 <= $unsigned($signed($unsigned($unsigned((8'h9d)))));
            end
          reg37 <= (&reg35[(5'h10):(1'h0)]);
        end
    end
  assign wire38 = reg12;
  assign wire39 = wire29[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((wire0[(4'hc):(1'h1)] & (reg11[(1'h1):(1'h0)] ?
          {wire30[(5'h12):(4'hb)]} : ({$unsigned((8'haf))} == ($unsigned(wire2) == $unsigned(reg11))))))
        begin
          reg40 <= ({(wire39 ?
                  $signed($signed(reg19)) : wire4)} >> (((~|$unsigned(reg37)) & $unsigned($unsigned(reg26))) ?
              (reg13[(2'h2):(1'h0)] ?
                  wire1 : reg8[(3'h5):(1'h0)]) : (^reg20[(4'hc):(4'h8)])));
          reg41 <= wire33[(2'h3):(2'h3)];
          if ((8'ha5))
            begin
              reg42 <= ((^(&(((8'hb9) ?
                  reg8 : wire39) <<< wire33))) || ((wire32 ?
                  wire31 : wire3[(5'h10):(4'he)]) && $signed({(reg9 <<< wire22)})));
              reg43 <= ((wire3 ^~ reg14[(4'h8):(2'h2)]) <<< $unsigned({({reg35,
                          (8'ha3)} ?
                      (reg35 ? reg20 : reg34) : $signed(wire28)),
                  ((&wire32) * (wire32 > reg11))}));
              reg44 <= (reg20 ?
                  wire1 : ((8'hb8) ?
                      $unsigned($unsigned($signed(wire23))) : (&{$unsigned(wire3)})));
            end
          else
            begin
              reg42 <= ({($unsigned((reg10 ?
                      wire31 : wire22)) & ((wire0 >= reg25) && $unsigned((8'hbb))))} || wire24);
            end
          reg45 <= (~|($signed((((8'had) >>> (8'hba)) ?
                  {wire22} : $unsigned(reg40))) ?
              (~reg25[(2'h2):(1'h0)]) : $signed((&(reg42 ^ reg40)))));
        end
      else
        begin
          reg40 <= {reg6[(2'h3):(1'h1)], reg44[(2'h3):(1'h1)]};
        end
      reg46 <= $unsigned((wire29[(1'h1):(1'h0)] ?
          $unsigned(($signed(wire3) ?
              {wire22, reg11} : reg42)) : reg12[(2'h2):(2'h2)]));
      reg47 <= (~(((+reg40) ^~ ($unsigned(reg16) == reg41)) && ({(~reg12),
          reg36} & reg35)));
    end
  assign wire48 = reg10[(5'h11):(4'h8)];
  assign wire49 = (wire24 >> $signed(reg36[(1'h0):(1'h0)]));
  assign wire50 = reg43[(1'h1):(1'h1)];
endmodule
