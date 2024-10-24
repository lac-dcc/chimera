module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire43,
                 wire41,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire4,
                 reg42,
                 reg40,
                 reg39,
                 reg38,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned((8'h9d));
  always
    @(posedge clk) begin
      if ((&(((wire4 ? (+wire2) : wire2) ?
          ({wire0, (8'ha0)} ? (wire1 * wire3) : (+wire3)) : ((~^(8'h9c)) ?
              ((8'hac) ~^ wire4) : {wire3, wire2})) >= (8'ha5))))
        begin
          reg5 <= {($unsigned($unsigned((&wire3))) ?
                  (!{wire0, (7'h40)}) : $signed(((^wire2) ?
                      (wire3 ? wire1 : (8'hb0)) : {wire3, wire1})))};
          if ($signed(wire1))
            begin
              reg6 <= wire0;
              reg7 <= $unsigned(($unsigned($signed($signed((8'had)))) >> $unsigned(((wire0 ?
                      (8'hbb) : wire0) ?
                  $unsigned(wire3) : (+wire1)))));
              reg8 <= {(wire2[(4'hf):(1'h1)] ?
                      ((^~$unsigned(wire4)) ?
                          (^(wire3 ? reg7 : reg5)) : ((7'h42) ?
                              (reg5 ?
                                  wire1 : wire2) : $unsigned(reg5))) : (8'h9c)),
                  ((^~$unsigned((8'hb3))) || $signed($unsigned($signed(wire0))))};
              reg9 <= wire3[(2'h3):(2'h3)];
            end
          else
            begin
              reg6 <= reg9;
              reg7 <= ((reg7[(3'h5):(2'h3)] ?
                  reg9[(2'h3):(1'h1)] : (((~&(8'h9e)) << (reg5 ?
                      wire0 : reg9)) != wire3)) * {$unsigned({$signed(wire1),
                      wire2})});
              reg8 <= (reg9[(3'h6):(3'h6)] > wire2);
              reg9 <= $signed((8'h9c));
              reg10 <= (wire4[(3'h6):(3'h5)] <= ((wire2 ?
                      (((8'hac) >>> reg6) <= (wire0 != wire0)) : {(7'h42)}) ?
                  wire0 : $signed($signed($signed(wire4)))));
            end
          reg11 <= (-{wire4[(4'hf):(1'h1)], $signed(reg6[(3'h4):(1'h1)])});
        end
      else
        begin
          reg5 <= wire2[(4'hc):(3'h6)];
          if (reg8[(2'h2):(1'h1)])
            begin
              reg6 <= $signed(wire1);
              reg7 <= $signed($unsigned($signed(($unsigned((8'hbc)) ?
                  (reg7 << reg6) : (reg10 <= (8'hb2))))));
            end
          else
            begin
              reg6 <= (7'h42);
              reg7 <= $unsigned(reg10);
              reg8 <= $signed(($signed(reg9) && wire3[(1'h0):(1'h0)]));
            end
        end
      if ($unsigned((~((^$unsigned(wire3)) >>> $signed((wire0 ?
          wire1 : reg11))))))
        begin
          reg12 <= $unsigned(reg10);
          if (((({reg6} ?
                      $unsigned($unsigned(wire4)) : $unsigned(wire0[(2'h2):(2'h2)])) ?
                  (^wire1) : $unsigned($unsigned((wire3 <= reg7)))) ?
              reg7 : wire3[(1'h1):(1'h0)]))
            begin
              reg13 <= reg10[(1'h0):(1'h0)];
              reg14 <= reg10;
              reg15 <= reg9;
            end
          else
            begin
              reg13 <= (!(&(+wire0[(3'h4):(2'h3)])));
              reg14 <= reg10;
            end
          reg16 <= ($signed(wire1) ~^ $unsigned($unsigned($unsigned(((8'hbe) ?
              reg12 : reg8)))));
          if ($signed((reg14 ? reg10 : wire2)))
            begin
              reg17 <= $signed((8'hbf));
              reg18 <= (((~^$signed(((8'hb6) ~^ wire1))) ?
                      (8'hbd) : ($unsigned((~|(8'hb4))) || ((reg15 ?
                              wire0 : reg14) ?
                          {reg13, reg15} : (reg9 ? (8'hb5) : (8'hb9))))) ?
                  $signed(($signed($signed(reg6)) ?
                      {(wire2 ?
                              (8'ha2) : wire0)} : (reg14[(4'ha):(1'h1)] + reg9[(2'h3):(1'h0)]))) : (~|(|((7'h43) ?
                      {(8'hac)} : (8'h9c)))));
            end
          else
            begin
              reg17 <= wire3;
              reg18 <= $unsigned(($unsigned($signed($signed(reg18))) ?
                  (~|$unsigned((reg9 ^~ wire2))) : ($signed($unsigned(wire0)) ?
                      (((8'hbc) ? reg18 : (7'h44)) ?
                          reg8 : (!reg12)) : ({reg5} | reg13))));
              reg19 <= {(&(wire1 <<< $unsigned($signed(reg18)))),
                  $signed($unsigned((reg6[(4'hf):(3'h6)] <<< (^~reg17))))};
            end
          reg20 <= $unsigned((~|{({reg15} ?
                  reg14[(3'h5):(3'h5)] : (wire4 ? reg15 : (8'ha4))),
              ({reg12} ? reg8 : (8'h9f))}));
        end
      else
        begin
          reg12 <= ((!$signed({(8'hb1), $signed(reg18)})) ?
              $signed(reg7) : $unsigned($signed((-(reg15 - reg6)))));
          reg13 <= (~|($signed(((wire0 ? wire2 : reg7) ?
              (~reg16) : {wire1})) <= wire1));
        end
      if (({((reg20 << ((8'hb0) ? reg11 : (8'had))) ?
              wire2[(4'hd):(4'h9)] : ($signed(wire4) ?
                  (reg9 > reg18) : reg19[(2'h2):(1'h1)])),
          {reg15, (~&(8'h9e))}} | (~((reg16[(5'h12):(4'he)] ?
              {reg12, reg8} : reg8) ?
          reg17[(4'h9):(3'h7)] : (!(-wire4))))))
        begin
          reg21 <= {(&((8'hb7) ?
                  $unsigned($unsigned((8'hbc))) : ((8'hb3) - (wire1 ?
                      reg16 : wire2))))};
        end
      else
        begin
          reg21 <= reg13[(4'hb):(4'h9)];
          reg22 <= ($signed(((wire1[(5'h13):(3'h5)] != $unsigned(reg8)) ?
              ($unsigned((8'h9f)) >= reg17[(1'h0):(1'h0)]) : reg18[(1'h0):(1'h0)])) <<< reg15[(4'hb):(1'h1)]);
          reg23 <= (reg18 <= $signed(($unsigned((reg15 || reg14)) ?
              $signed((wire4 ? reg15 : wire4)) : (&(reg14 <<< reg10)))));
          reg24 <= wire3;
        end
      if (($signed((wire4[(3'h5):(1'h1)] ?
          $signed((reg10 - (8'hae))) : ($unsigned(reg15) ^~ reg10))) && wire2))
        begin
          reg25 <= (7'h44);
          reg26 <= (~&$unsigned(reg18));
          reg27 <= $signed(((reg22 ?
              ((^~reg22) ?
                  (reg20 ?
                      reg15 : reg22) : reg20) : $unsigned($signed(reg23))) & (wire3[(1'h1):(1'h1)] ?
              {(reg12 > reg18)} : $signed((~&(8'hb9))))));
        end
      else
        begin
          if ($unsigned($signed(($signed((reg12 - reg21)) | $signed((8'h9f))))))
            begin
              reg25 <= $unsigned(reg24);
              reg26 <= ($signed(reg15[(4'h8):(1'h1)]) ?
                  (~&reg18[(2'h3):(2'h3)]) : $unsigned($unsigned(($signed((8'h9d)) ?
                      reg24 : reg17))));
              reg27 <= (~(&($unsigned({wire0}) ?
                  reg12[(5'h10):(3'h6)] : $signed($unsigned(reg13)))));
              reg28 <= (reg20[(3'h4):(3'h4)] >= $unsigned({$signed($unsigned((8'hb4)))}));
            end
          else
            begin
              reg25 <= reg11[(2'h2):(2'h2)];
              reg26 <= $signed({reg21, (&reg11[(3'h5):(1'h0)])});
              reg27 <= (^{(~^$signed($unsigned(reg26)))});
              reg28 <= reg9;
            end
          reg29 <= ((({$signed((8'ha5)), $signed(reg9)} ?
                  (reg21 >>> {reg7,
                      wire3}) : (reg7[(4'hd):(4'h8)] << (+reg17))) < {((8'hbb) && (|reg18))}) ?
              (|wire0[(1'h0):(1'h0)]) : ((wire3 != ($unsigned(reg8) ?
                      ((8'ha8) ? reg27 : reg12) : (wire2 ? reg6 : (8'hba)))) ?
                  reg9 : (^(~&reg26))));
        end
      reg30 <= $unsigned(((8'hb5) & (reg17[(3'h6):(2'h2)] && $signed((|reg15)))));
    end
  assign wire31 = (+(&$signed({$unsigned(reg26), {wire4}})));
  assign wire32 = $unsigned($unsigned($signed(reg9[(2'h2):(2'h2)])));
  assign wire33 = $unsigned(wire32[(3'h6):(2'h2)]);
  assign wire34 = {$signed((^~(8'ha4))),
                      (((8'h9f) * wire1[(5'h11):(5'h11)]) ?
                          (reg12[(3'h7):(1'h0)] >>> $unsigned(reg27)) : (~^(wire32 ?
                              $unsigned(reg16) : reg27[(5'h12):(4'hc)])))};
  always
    @(posedge clk) begin
      reg35 <= ($unsigned($unsigned(reg11)) ?
          ($signed(reg14) ?
              $unsigned(($signed(reg28) ?
                  (~reg16) : ((8'ha8) ?
                      wire34 : reg29))) : reg17[(4'hc):(1'h0)]) : (((&$signed(reg6)) ?
                  (~&wire3) : $unsigned(wire3[(2'h2):(1'h1)])) ?
              (+$signed($signed(reg8))) : {({reg17} != wire34)}));
      if (($unsigned($unsigned($unsigned((reg19 | reg14)))) ?
          {(reg13[(4'h8):(4'h8)] ? $signed($unsigned(wire3)) : wire3),
              $unsigned($signed({reg25}))} : $signed((~|reg26[(2'h2):(2'h2)]))))
        begin
          if ((($unsigned(reg16) ?
                  {$signed($unsigned(reg16)),
                      (reg35 | $signed(wire1))} : reg15) ?
              $signed($signed((-$signed(reg14)))) : (~&(reg14[(3'h5):(3'h5)] >> $signed($unsigned(reg23))))))
            begin
              reg36 <= ((-$unsigned($signed(wire31))) - reg28);
              reg37 <= $unsigned(wire31[(4'h8):(3'h6)]);
              reg38 <= reg13[(1'h1):(1'h1)];
              reg39 <= ((+(|reg16[(2'h2):(1'h0)])) - (!($unsigned($unsigned(reg35)) ?
                  $signed((reg10 ? reg28 : reg24)) : (~&(~reg13)))));
            end
          else
            begin
              reg36 <= wire2[(3'h6):(2'h3)];
              reg37 <= (~$unsigned((&$signed(reg37[(3'h4):(1'h0)]))));
              reg38 <= ($signed($signed(reg37[(1'h1):(1'h1)])) ^ reg35[(1'h0):(1'h0)]);
              reg39 <= reg9;
              reg40 <= (^~(reg13 >>> ($unsigned((^reg39)) >> $signed((&reg39)))));
            end
        end
      else
        begin
          reg36 <= (~^reg28[(1'h1):(1'h0)]);
          reg37 <= reg24;
          if (($unsigned(reg17) | (reg6 && $signed(((wire33 + reg9) ?
              $unsigned(reg8) : $signed((8'had)))))))
            begin
              reg38 <= $signed({(((^reg30) > reg29) ?
                      $unsigned(reg36[(2'h3):(1'h1)]) : $unsigned(wire3)),
                  {(8'hbf)}});
              reg39 <= ((8'hb4) * reg23);
            end
          else
            begin
              reg38 <= $unsigned(reg12[(4'hf):(3'h7)]);
              reg39 <= (&$unsigned((((&reg7) ?
                      reg11[(1'h0):(1'h0)] : reg38[(3'h7):(3'h6)]) ?
                  {wire34, reg8[(2'h2):(1'h1)]} : {(wire33 >> wire33),
                      $unsigned((8'hba))})));
            end
          reg40 <= ((-{reg30[(3'h7):(2'h2)], (7'h41)}) >>> wire3);
        end
    end
  assign wire41 = $signed(reg9);
  always
    @(posedge clk) begin
      reg42 <= ($unsigned(($signed($signed(reg13)) ?
          (|(reg37 ? wire33 : reg14)) : ((reg9 ? wire0 : reg28) ?
              wire33[(4'hb):(3'h5)] : (+wire41)))) - ($unsigned($signed($signed(reg21))) ?
          {((wire33 ? reg24 : wire33) <<< (reg30 ? (8'ha9) : reg10)),
              $unsigned((|wire34))} : (reg26[(2'h3):(2'h2)] ^ wire2)));
    end
  assign wire43 = $unsigned(reg20);
endmodule
