module top
#(parameter param61 = ((~|(~^(+(~&(8'hb1))))) | {{(-{(8'h9f)})}, (~|{(~^(8'hbb))})}), 
parameter param62 = param61)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire38,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire13,
                 wire5,
                 wire4,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 reg27,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed(wire2);
  assign wire5 = $signed($unsigned($unsigned(($signed(wire3) ?
                     wire2 : wire2))));
  always
    @(posedge clk) begin
      if ({{(($signed(wire2) ?
                  $unsigned(wire3) : (wire4 && wire0)) > $signed($unsigned(wire0))),
              {$unsigned({wire2})}}})
        begin
          if ((&(($unsigned((wire4 ? (8'hbc) : wire1)) == (~$signed(wire4))) ?
              wire3[(4'ha):(3'h6)] : $signed(wire2))))
            begin
              reg6 <= (&$signed((~^$unsigned((wire0 && wire3)))));
              reg7 <= ($signed(wire5[(2'h2):(2'h2)]) ?
                  $signed(((&$unsigned(wire5)) ^~ wire0)) : {wire4[(1'h0):(1'h0)]});
            end
          else
            begin
              reg6 <= wire1[(2'h2):(1'h1)];
              reg7 <= $unsigned(((reg6 ?
                      $unsigned(reg6) : $unsigned({reg6, wire4})) ?
                  $signed(((^wire2) || {wire3, reg6})) : $signed(wire2)));
              reg8 <= wire5;
            end
        end
      else
        begin
          reg6 <= ($signed(wire5) == (((8'ha7) > reg6[(1'h1):(1'h1)]) - ($signed($unsigned(wire1)) | (^~wire2))));
          if (wire0)
            begin
              reg7 <= $signed($signed(wire0));
              reg8 <= $unsigned(wire4[(1'h0):(1'h0)]);
              reg9 <= reg6;
              reg10 <= $unsigned($signed({reg7}));
              reg11 <= ($unsigned(wire1) < $signed((($unsigned((7'h44)) || (^wire4)) ?
                  (8'ha3) : ((8'haf) ? $unsigned(wire5) : wire4))));
            end
          else
            begin
              reg7 <= $signed(($unsigned($unsigned($unsigned((7'h44)))) ?
                  $unsigned($unsigned((wire4 ?
                      reg10 : wire2))) : reg8[(1'h0):(1'h0)]));
              reg8 <= (wire2 ?
                  $unsigned(((^~wire5[(4'hd):(1'h1)]) ?
                      (~(&wire0)) : (8'hae))) : reg8[(1'h1):(1'h1)]);
              reg9 <= (($signed(reg10) && $unsigned($signed(((8'ha8) ^ wire3)))) ?
                  reg6 : ($unsigned({$unsigned(wire1),
                      (wire3 >= reg9)}) | (^~$unsigned($signed(wire2)))));
            end
        end
      reg12 <= {$signed((&{wire3[(3'h4):(2'h3)], (^~(8'haf))}))};
    end
  assign wire13 = wire3[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg14 <= reg9[(4'hf):(1'h0)];
      reg15 <= {reg10[(1'h0):(1'h0)],
          $signed($unsigned($unsigned(wire0[(1'h1):(1'h1)])))};
      reg16 <= ({$signed(((reg7 ? reg8 : (8'ha7)) != {(8'hbc), (8'ha2)}))} ?
          $signed(reg10[(1'h1):(1'h1)]) : (^~$signed($signed(wire3))));
      reg17 <= {$signed((($unsigned(wire3) ?
              reg6 : reg8) < $unsigned(reg11[(3'h6):(2'h3)])))};
      reg18 <= {wire3, wire13};
    end
  assign wire19 = $signed(({{{(8'h9e)}, (reg18 ? reg12 : (8'ha1))},
                      reg17} ^ ($unsigned($unsigned(reg6)) ?
                      wire5 : {(+reg7)})));
  assign wire20 = $signed(reg10[(1'h0):(1'h0)]);
  assign wire21 = reg10;
  assign wire22 = (reg10[(1'h1):(1'h1)] >= (~^$signed(($signed(wire20) + wire2))));
  assign wire23 = (!wire20);
  assign wire24 = reg18[(1'h0):(1'h0)];
  assign wire25 = reg17;
  assign wire26 = reg12;
  always
    @(posedge clk) begin
      reg27 <= (-reg11);
      if ($signed($signed(($signed(wire22[(2'h3):(2'h3)]) < ((wire20 ?
              (8'haa) : reg7) ?
          wire2[(1'h0):(1'h0)] : $signed(reg10))))))
        begin
          if ($signed($signed($unsigned((reg6[(4'hc):(4'ha)] >>> {wire2,
              reg27})))))
            begin
              reg28 <= {(~(&$unsigned($signed(wire21)))),
                  {reg12[(4'h8):(3'h7)],
                      $unsigned(((^(8'hba)) ?
                          $unsigned(reg6) : (wire25 ? reg11 : wire20)))}};
              reg29 <= (((+$unsigned(wire3)) ?
                      (^wire0[(1'h0):(1'h0)]) : wire5) ?
                  (~|(~|(8'h9e))) : $signed({wire20[(1'h1):(1'h1)]}));
              reg30 <= wire26[(3'h6):(3'h4)];
              reg31 <= wire2;
              reg32 <= reg9;
            end
          else
            begin
              reg28 <= $signed(wire23[(3'h5):(3'h5)]);
              reg29 <= ($signed((wire20[(2'h2):(1'h1)] ?
                      ((reg31 >> wire26) ?
                          (wire1 ? reg27 : (8'hb0)) : ((8'hac) ?
                              (8'ha5) : wire5)) : (&reg27))) ?
                  (-reg11[(3'h7):(3'h5)]) : $signed(reg9[(4'h9):(2'h3)]));
              reg30 <= (reg31[(5'h11):(3'h7)] ?
                  $unsigned((&((wire19 ? (8'ha1) : (8'h9f)) ?
                      (^wire4) : {reg29,
                          reg8}))) : $unsigned(wire24[(3'h4):(1'h1)]));
              reg31 <= {reg31,
                  ((((reg30 > wire3) ?
                          (&wire5) : (~|reg28)) >>> $unsigned($signed(reg8))) ?
                      $signed(wire20) : (reg15 ?
                          reg15[(3'h5):(3'h4)] : $unsigned(wire0)))};
            end
        end
      else
        begin
          reg28 <= (~^(~{wire21[(1'h1):(1'h1)],
              ((~^(8'ha5)) ? reg11 : wire22)}));
          reg29 <= reg14;
          reg30 <= (|wire26[(3'h5):(2'h3)]);
          reg31 <= $signed(($signed(({(8'hb7),
                  wire24} == wire4[(2'h2):(2'h2)])) ?
              (8'hb9) : (((^~wire20) ?
                  $unsigned(reg28) : {wire0,
                      wire5}) != $unsigned($unsigned(reg28)))));
          if ($unsigned((~{(8'ha9), {{reg15}, $unsigned(wire13)}})))
            begin
              reg32 <= (~(({$unsigned(reg18)} < reg18[(1'h1):(1'h1)]) ~^ $unsigned((wire20[(1'h1):(1'h1)] - (reg28 * reg17)))));
              reg33 <= reg11;
            end
          else
            begin
              reg32 <= {((~|reg32) > reg18[(2'h2):(1'h0)])};
              reg33 <= reg33[(4'h9):(4'h8)];
              reg34 <= {({(|reg10), $signed(reg18[(3'h7):(3'h4)])} ?
                      (^~(^wire4)) : reg30),
                  wire20};
              reg35 <= ($unsigned($signed($signed(reg28))) & reg33[(4'he):(3'h5)]);
              reg36 <= $signed($signed($unsigned($signed(reg9[(4'h8):(2'h3)]))));
            end
        end
      reg37 <= ($signed($unsigned((~&(~&reg11)))) ^~ $unsigned((-((-wire20) ?
          $unsigned(reg9) : $signed(reg27)))));
    end
  assign wire38 = reg27[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      if ($unsigned(reg9))
        begin
          if (reg32[(4'hb):(1'h1)])
            begin
              reg39 <= $unsigned($signed(reg9[(4'hc):(2'h2)]));
              reg40 <= wire13;
              reg41 <= {$unsigned((-((reg11 ? wire38 : wire5) ?
                      {reg11, wire38} : (|reg6)))),
                  $unsigned(wire0[(2'h2):(2'h2)])};
            end
          else
            begin
              reg39 <= wire19[(4'hd):(3'h6)];
              reg40 <= (!((8'h9e) ? $unsigned(reg33) : $signed((-reg32))));
            end
          reg42 <= wire38;
          if ((reg35[(1'h0):(1'h0)] == (reg29[(4'h9):(3'h6)] ?
              ((^$signed(reg42)) << $signed((reg10 >> wire20))) : (reg10[(1'h0):(1'h0)] + ((+wire26) ?
                  (reg37 ? wire4 : wire0) : wire5)))))
            begin
              reg43 <= (reg8[(2'h3):(2'h3)] ?
                  (({(wire22 ? reg14 : reg9)} ?
                          {(wire19 | reg33), reg41} : ((reg10 ^ (8'ha6)) ?
                              $signed((8'ha6)) : (wire2 ? reg6 : reg18))) ?
                      {$unsigned($unsigned(reg35)),
                          $unsigned((7'h44))} : reg42) : (-((wire19[(2'h2):(2'h2)] >= $signed(reg34)) || reg12)));
              reg44 <= wire20;
            end
          else
            begin
              reg43 <= $unsigned(((&$signed({reg18,
                  wire13})) == ((|$signed(wire0)) ? reg12 : reg8)));
              reg44 <= $unsigned(reg31);
              reg45 <= $signed((wire22 ?
                  reg33 : (^((~|reg41) ? {(8'hb3)} : reg17))));
            end
        end
      else
        begin
          reg39 <= $signed((~(8'h9f)));
          reg40 <= $signed({reg10, reg41[(3'h7):(3'h5)]});
        end
      if ((^(~|($signed($signed(reg17)) ?
          ((reg33 ? reg43 : reg18) <= (wire38 ?
              reg44 : reg9)) : ($signed(reg36) ?
              $signed(reg33) : $signed(reg11))))))
        begin
          reg46 <= $unsigned((~&reg31));
        end
      else
        begin
          reg46 <= wire21[(1'h0):(1'h0)];
          reg47 <= (~|(({wire4} ?
                  (reg18 ? wire38[(4'ha):(3'h7)] : wire20) : wire20) ?
              ((~|reg8[(2'h3):(1'h1)]) ?
                  $signed($signed(wire1)) : ({(8'hb0)} ?
                      (wire20 <= reg30) : reg14[(2'h3):(2'h2)])) : {(~|(reg32 <= reg32))}));
        end
      reg48 <= (|$unsigned($signed(($unsigned((8'haa)) == (|reg46)))));
      reg49 <= reg34[(4'hf):(4'hd)];
      reg50 <= (((~|reg36) ?
              (&(((8'haf) ? (8'haa) : reg6) ?
                  $unsigned(reg11) : $unsigned(wire21))) : $signed(reg15)) ?
          reg46[(1'h0):(1'h0)] : reg7[(1'h1):(1'h1)]);
    end
  assign wire51 = $signed(reg37[(4'hf):(3'h6)]);
  assign wire52 = reg39;
  always
    @(posedge clk) begin
      if (($unsigned(reg48) ?
          (~$signed(($signed((8'hb5)) ^~ wire22))) : wire13))
        begin
          if (reg28)
            begin
              reg53 <= reg41[(3'h4):(3'h4)];
              reg54 <= reg32[(4'hc):(1'h0)];
            end
          else
            begin
              reg53 <= (((^~$unsigned((~&wire3))) > ($unsigned($signed(reg8)) & (!(reg49 <<< (8'hb6))))) ?
                  ({(-{wire24, wire38})} ?
                      ((-(8'haf)) ?
                          wire5[(4'hd):(4'hc)] : $signed((~(8'hb8)))) : ($signed((wire52 ?
                              reg11 : wire3)) ?
                          $unsigned({reg32}) : reg12[(3'h6):(3'h6)])) : reg30);
              reg54 <= {(~&{(reg47 <= (reg14 ? reg53 : wire0))}),
                  $signed(reg48[(1'h0):(1'h0)])};
              reg55 <= ((reg37[(4'hf):(3'h7)] << (reg32[(4'hf):(4'hf)] ?
                      (reg17 ?
                          reg42[(5'h15):(1'h0)] : reg29[(2'h3):(2'h3)]) : reg54[(1'h0):(1'h0)])) ?
                  (8'haa) : $signed((reg49 ?
                      (8'hb9) : (~|wire25[(3'h6):(2'h2)]))));
            end
        end
      else
        begin
          reg53 <= (^{$unsigned((8'ha5))});
          if (((~&$signed($unsigned((reg7 ~^ wire26)))) - wire22[(4'h9):(4'h9)]))
            begin
              reg54 <= $unsigned((reg41[(1'h1):(1'h1)] << $signed($unsigned(reg46))));
            end
          else
            begin
              reg54 <= wire1[(1'h0):(1'h0)];
              reg55 <= $unsigned(($unsigned($unsigned(wire13[(3'h5):(2'h3)])) ^~ $unsigned(reg6[(3'h5):(1'h1)])));
              reg56 <= {{$signed({$unsigned(wire2)})}};
            end
          reg57 <= (~^((reg7 ?
              reg55[(3'h4):(2'h2)] : ((reg50 ? wire4 : wire51) ?
                  $signed((8'hac)) : (^wire52))) <<< $signed($unsigned(reg48[(5'h10):(4'hf)]))));
        end
      reg58 <= $signed(((7'h43) <= reg27));
      reg59 <= (8'ha9);
    end
  always
    @(posedge clk) begin
      reg60 <= ($unsigned($signed((~&{wire1, wire52}))) + reg45);
    end
endmodule
