module top
#(parameter param50 = {((8'ha3) & (~(((7'h41) >>> (8'had)) ? {(8'hbb)} : (8'haf))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire35,
                 wire22,
                 wire21,
                 wire20,
                 wire5,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
                 reg33,
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
  assign wire5 = $unsigned(((!{{wire4, wire2},
                     wire0}) >>> $unsigned((|(-wire0)))));
  always
    @(posedge clk) begin
      reg6 <= ($signed((^~$unsigned(((8'hae) ?
          (8'hb9) : wire1)))) ^~ (^~$signed(({(8'ha0)} << (wire4 ^~ wire4)))));
      if (wire2[(4'hc):(3'h6)])
        begin
          if ($unsigned(reg6[(4'hb):(3'h4)]))
            begin
              reg7 <= {wire3[(4'h8):(3'h5)]};
            end
          else
            begin
              reg7 <= (!($unsigned(wire2[(5'h14):(5'h10)]) ?
                  $unsigned({(|wire3)}) : {{$signed(reg6)},
                      (((8'ha4) ? wire2 : (8'hbc)) | (8'ha5))}));
              reg8 <= {$signed($signed((~|$signed(reg7))))};
              reg9 <= ($signed((!(~^reg7[(1'h0):(1'h0)]))) > wire1);
              reg10 <= (+$unsigned(reg9[(2'h3):(1'h1)]));
            end
          if (wire3)
            begin
              reg11 <= ((~(reg7 && (|$signed(wire5)))) && $signed(({((8'hba) && (8'h9c))} <<< reg10[(3'h5):(1'h1)])));
              reg12 <= (((!reg6) - $unsigned(reg8)) != (((wire3[(2'h3):(2'h2)] ^~ $signed((8'hbb))) ?
                      reg6 : ({reg10} * (wire0 ? wire2 : (8'hbf)))) ?
                  (8'hbb) : ({wire0} || reg8)));
              reg13 <= reg9;
              reg14 <= (&reg10);
            end
          else
            begin
              reg11 <= $unsigned((&$unsigned((^wire0[(2'h2):(1'h0)]))));
              reg12 <= $signed((|(wire3 ? (~^reg13) : $signed(wire2))));
              reg13 <= (^~{reg9,
                  $unsigned(({reg6, wire2} > $unsigned(wire1)))});
            end
          if (($unsigned($unsigned(wire1)) | ((wire0 >> (!(!reg10))) < $unsigned({$signed(reg7),
              $unsigned(reg11)}))))
            begin
              reg15 <= $signed((8'hb9));
              reg16 <= (^~$signed(reg15[(2'h2):(1'h0)]));
            end
          else
            begin
              reg15 <= reg16;
              reg16 <= {wire3};
              reg17 <= $unsigned({reg7});
              reg18 <= reg7;
            end
          reg19 <= $signed($unsigned((^reg10[(1'h0):(1'h0)])));
        end
      else
        begin
          reg7 <= (~^($unsigned($unsigned((reg9 * reg12))) ?
              $signed(($signed(reg12) ?
                  $signed(wire0) : $unsigned(wire1))) : reg11[(1'h0):(1'h0)]));
        end
    end
  assign wire20 = reg17[(3'h5):(1'h1)];
  assign wire21 = reg15;
  assign wire22 = $unsigned($signed((reg10[(4'h8):(3'h7)] * (!(wire21 ^~ wire4)))));
  always
    @(posedge clk) begin
      reg23 <= (((reg8[(3'h6):(2'h3)] ?
              $unsigned($signed(wire5)) : ((!wire20) || (reg10 == reg7))) ?
          $signed(($unsigned((8'ha8)) << ((8'ha2) << reg11))) : ($signed(wire5[(5'h10):(4'he)]) ?
              {(reg18 ? (8'hbc) : wire2), (-reg6)} : {(reg8 == wire20),
                  ((8'ha1) != reg14)})) << $unsigned((~|reg13)));
      if (((^~$signed(((^(8'hb5)) & $signed(wire21)))) ~^ reg11[(1'h0):(1'h0)]))
        begin
          reg24 <= wire22[(1'h0):(1'h0)];
          reg25 <= (($unsigned($unsigned($unsigned(reg15))) ?
                  ($unsigned($signed(reg23)) & $unsigned(wire1)) : (reg12[(2'h3):(1'h0)] ?
                      wire20[(2'h2):(2'h2)] : $signed($signed(wire1)))) ?
              $signed(((~|{reg17, reg6}) ?
                  (~&(-wire21)) : wire3)) : $unsigned($unsigned(wire22[(2'h2):(2'h2)])));
          reg26 <= (reg17[(3'h7):(3'h5)] >> wire21[(1'h0):(1'h0)]);
          if (((|($signed(((8'hbf) ? wire1 : reg14)) ?
                  ((~^(8'ha9)) || (wire22 >>> (7'h43))) : ((8'h9d) - {wire1,
                      wire22}))) ?
              ($signed(wire22[(2'h3):(1'h0)]) ?
                  ((reg8 ?
                      (^~reg23) : wire5) || wire21[(1'h1):(1'h0)]) : (8'hbf)) : ($unsigned(reg6) ?
                  ($signed(wire3) <<< $signed(reg18[(1'h0):(1'h0)])) : ((~|(wire20 >= reg18)) ?
                      $unsigned({(8'ha3), reg9}) : (+wire4)))))
            begin
              reg27 <= $signed(((|reg14) < wire3));
              reg28 <= reg17[(3'h5):(2'h3)];
              reg29 <= reg16[(3'h4):(1'h0)];
              reg30 <= reg7;
              reg31 <= (reg26[(4'ha):(2'h2)] ?
                  wire0 : (&$signed((^(~&(8'ha9))))));
            end
          else
            begin
              reg27 <= $signed(reg8[(1'h0):(1'h0)]);
            end
          reg32 <= reg11[(2'h2):(2'h2)];
        end
      else
        begin
          reg24 <= $signed((((8'hb0) ?
                  wire2[(4'ha):(4'h9)] : (reg16 ?
                      reg12[(2'h3):(2'h2)] : (reg13 == wire21))) ?
              $unsigned((8'hba)) : (+{wire0})));
          reg25 <= $unsigned(wire2[(5'h11):(4'hc)]);
          reg26 <= $unsigned(($signed((~|reg29[(2'h2):(2'h2)])) ?
              ((8'hbe) >> $signed((reg25 & (8'hb2)))) : {(8'hbe), wire22}));
          reg27 <= (($signed(reg31) ?
                  (|((reg28 ?
                      wire5 : reg12) >>> $signed((8'hba)))) : {wire0[(4'hd):(1'h0)],
                      (~|$unsigned(reg10))}) ?
              {(+{(~^(7'h42))})} : (reg9 ? reg16 : reg26[(4'ha):(3'h7)]));
          reg28 <= (~((8'hbd) ^~ reg16[(2'h2):(2'h2)]));
        end
      reg33 <= (reg28 ?
          $signed(($signed($signed(reg28)) ?
              reg8[(3'h4):(1'h1)] : $signed(wire20[(1'h0):(1'h0)]))) : (~^(reg19[(3'h7):(1'h1)] <= reg16)));
      reg34 <= reg18[(3'h4):(3'h4)];
    end
  assign wire35 = ($signed($signed(reg6[(2'h3):(1'h0)])) ?
                      ((reg32[(4'h9):(1'h0)] ?
                              reg25[(3'h5):(3'h4)] : $unsigned(wire2[(3'h5):(3'h5)])) ?
                          ((+(|reg19)) ?
                              ($unsigned((8'hae)) | wire21) : $signed((reg7 && reg14))) : wire0[(3'h6):(3'h5)]) : (reg23 ^~ (~(~&$unsigned(reg30)))));
  always
    @(posedge clk) begin
      reg36 <= ((((wire22[(1'h0):(1'h0)] >> (wire3 ?
                  reg26 : (8'hb7))) >>> reg7) ?
              $signed({$signed(wire1), wire5[(4'hd):(3'h5)]}) : reg33) ?
          $unsigned(($unsigned($unsigned(reg8)) < (+$signed(reg24)))) : $signed(reg29[(1'h1):(1'h1)]));
      reg37 <= reg18;
      reg38 <= $signed((($unsigned({wire2, wire2}) ?
          {$unsigned(reg29)} : reg12) ^~ (reg34 ?
          ((reg12 || wire4) <= (reg18 ? wire35 : (8'h9e))) : ($signed(reg27) ?
              $unsigned(reg28) : wire4[(2'h3):(1'h1)]))));
      if ((-($signed($signed((reg15 ? (8'ha3) : (8'h9c)))) ?
          $unsigned(reg10[(3'h4):(3'h4)]) : (~$unsigned((reg17 ?
              reg8 : reg6))))))
        begin
          reg39 <= $unsigned($unsigned($signed(reg8)));
          reg40 <= $signed(reg23);
          if (($unsigned((reg32[(4'he):(2'h3)] <<< $signed(wire22))) ?
              reg10[(3'h5):(2'h2)] : (^~reg15[(2'h2):(1'h0)])))
            begin
              reg41 <= reg25;
              reg42 <= $signed($unsigned(((-(wire35 >>> (8'hb7))) != (-(reg36 ?
                  wire22 : wire5)))));
              reg43 <= ({reg40, reg42} ?
                  reg23[(4'hf):(4'hb)] : $unsigned(($unsigned($signed(reg9)) << reg39)));
              reg44 <= (&$signed(reg38[(2'h2):(2'h2)]));
              reg45 <= ((^$signed(((8'hbc) != (reg26 ^~ reg44)))) ?
                  $signed({{$signed(reg15),
                          (wire35 ?
                              wire22 : (8'hac))}}) : $signed($unsigned($signed(reg27))));
            end
          else
            begin
              reg41 <= (~^$signed((8'hae)));
              reg42 <= $unsigned((reg10 ?
                  $signed(((^reg14) * (reg36 ? reg7 : reg29))) : (8'hac)));
              reg43 <= (!(((-(8'ha8)) ?
                      ($unsigned(reg44) ?
                          reg10[(4'h8):(3'h7)] : (wire0 ?
                              reg30 : reg26)) : (8'hb0)) ?
                  (reg11[(1'h0):(1'h0)] + ((reg42 ?
                      wire3 : (7'h41)) < $unsigned(reg30))) : reg36[(2'h2):(1'h1)]));
            end
          reg46 <= (($signed((~^{reg7, reg45})) ?
                  $unsigned(reg30[(3'h6):(2'h3)]) : $signed($unsigned((reg25 ?
                      reg11 : (7'h43))))) ?
              $unsigned($unsigned($unsigned(reg17))) : reg11[(1'h1):(1'h1)]);
          reg47 <= {(({(reg7 ? wire0 : reg18)} >>> {$unsigned(reg39)}) ?
                  ($unsigned(wire3[(1'h0):(1'h0)]) ?
                      {(wire21 ? reg8 : (8'had))} : $signed(reg13)) : (8'ha8)),
              $unsigned(reg28[(2'h3):(1'h0)])};
        end
      else
        begin
          if (reg47)
            begin
              reg39 <= $signed(($unsigned((-(reg17 ? wire21 : reg34))) ?
                  $signed($unsigned($signed((8'hac)))) : $unsigned($unsigned($unsigned(reg11)))));
              reg40 <= reg9[(1'h0):(1'h0)];
              reg41 <= $unsigned($unsigned(((7'h41) ?
                  $unsigned((~|(7'h42))) : wire35[(2'h3):(2'h2)])));
            end
          else
            begin
              reg39 <= reg23;
              reg40 <= $unsigned($signed(wire2[(1'h0):(1'h0)]));
              reg41 <= ((!$signed((reg34[(2'h2):(2'h2)] ?
                      reg34[(1'h1):(1'h1)] : reg42))) ?
                  {$signed(reg27)} : $signed((^~$signed((reg46 ?
                      reg18 : reg23)))));
            end
          reg42 <= reg41;
          reg43 <= (|{((8'had) << (reg37 >> $unsigned(reg15))),
              {($signed(reg37) <<< $signed(reg46)), ({reg42} * {reg26})}});
          reg44 <= wire21[(2'h2):(1'h1)];
        end
    end
  assign wire48 = $unsigned({wire1[(3'h4):(2'h2)],
                      ((!(^reg33)) ? reg9[(3'h4):(2'h2)] : reg25)});
  assign wire49 = (+((-wire3) <<< (^~reg10)));
endmodule
