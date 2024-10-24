module top
#(parameter param40 = ((-((((8'hb7) ? (8'hbf) : (8'h9c)) >> (7'h40)) ? (^((8'ha9) ? (8'ha8) : (8'ha6))) : {{(8'ha2)}, (~^(8'hbf))})) >> ({((&(8'had)) << ((8'hae) ? (8'h9e) : (8'ha2))), ((8'hb0) >> ((8'ha3) ? (8'ha1) : (8'hb7)))} == {(~|((8'hbe) < (8'hb0))), (~^{(8'ha8)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = (wire3 ?
                     (wire4[(1'h1):(1'h0)] || wire2[(1'h1):(1'h1)]) : ($unsigned((8'ha1)) ?
                         {((wire5 ? wire4 : wire2) ?
                                 wire5[(4'h8):(4'h8)] : {wire2,
                                     wire0})} : $unsigned($signed($signed(wire4)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire1[(3'h7):(1'h0)])))
        begin
          reg7 <= $unsigned(($signed(wire0) ^~ (&wire5)));
          reg8 <= $unsigned((8'ha0));
        end
      else
        begin
          reg7 <= {((wire1[(4'hb):(3'h7)] ?
                  $unsigned((wire2 * reg8)) : (~(wire4 ^~ reg8))) | ((~&(~wire5)) ?
                  $unsigned(((8'hb5) && reg7)) : $unsigned(((8'hbf) * wire5))))};
          reg8 <= wire6[(4'h9):(3'h5)];
          reg9 <= wire0[(4'ha):(3'h6)];
          reg10 <= {{{((wire1 != reg8) ? (~|(8'hbe)) : wire6),
                      $signed(wire4[(1'h0):(1'h0)])}}};
          reg11 <= wire5;
        end
      reg12 <= {reg8, reg11};
      if ((+wire2))
        begin
          reg13 <= (|(wire3[(1'h0):(1'h0)] && (~((wire3 ?
              reg11 : wire3) * (!reg12)))));
          reg14 <= (8'hab);
          if (wire3[(2'h2):(1'h0)])
            begin
              reg15 <= (~|(wire2[(2'h3):(1'h1)] ?
                  $signed({wire4[(2'h2):(1'h1)],
                      (reg10 ?
                          wire4 : wire0)}) : {$signed(reg12[(1'h1):(1'h1)])}));
              reg16 <= wire1;
              reg17 <= reg8[(2'h3):(2'h2)];
              reg18 <= ($unsigned(({reg17} >> (reg13[(4'hb):(2'h3)] != wire6[(1'h1):(1'h1)]))) ?
                  ($signed({$unsigned(reg13),
                      $signed((8'hb1))}) & wire0[(4'h9):(4'h8)]) : reg12);
              reg19 <= reg9;
            end
          else
            begin
              reg15 <= ($unsigned($unsigned(wire6)) ?
                  reg11[(2'h3):(1'h1)] : $signed($signed(wire0[(3'h6):(3'h6)])));
            end
          reg20 <= (+wire6);
          reg21 <= (^(($unsigned(reg20) ?
                  (reg9 | $signed(reg19)) : (reg10 ^ {reg18, reg12})) ?
              (reg19 ?
                  (reg9[(4'hc):(4'h8)] ?
                      $unsigned(reg15) : $unsigned(reg10)) : reg17[(4'hc):(4'h8)]) : $unsigned((!$signed(reg8)))));
        end
      else
        begin
          reg13 <= ($unsigned($unsigned((reg17[(1'h0):(1'h0)] ?
              (wire1 + reg16) : (!wire4)))) == reg18[(3'h6):(1'h1)]);
          reg14 <= (-($unsigned((reg16[(2'h2):(2'h2)] ?
                  $unsigned((8'haa)) : {reg14, reg14})) ?
              ($unsigned($unsigned(wire6)) ?
                  (~|reg7) : ((reg9 ? wire0 : reg18) ?
                      (reg8 + reg19) : (reg16 + wire6))) : reg10[(3'h6):(3'h6)]));
          if ($unsigned({(wire3[(4'ha):(3'h4)] ?
                  (~|(wire1 ? wire3 : reg13)) : ({reg17, wire5} ?
                      wire3 : (reg14 & reg10)))}))
            begin
              reg15 <= reg10;
              reg16 <= $unsigned($unsigned({wire1}));
              reg17 <= $unsigned((~&(($unsigned(wire6) ?
                      (reg15 || wire4) : (reg20 ? wire6 : wire3)) ?
                  reg9[(3'h7):(3'h4)] : $signed((reg16 | reg17)))));
              reg18 <= $signed({$signed(reg15)});
            end
          else
            begin
              reg15 <= wire5[(1'h1):(1'h1)];
              reg16 <= ((wire3 ?
                      (|reg7) : ((&{(8'ha5),
                          wire4}) ^ $unsigned($unsigned(reg21)))) ?
                  (|wire4[(2'h2):(1'h0)]) : $signed(reg13));
              reg17 <= (wire5 ?
                  $unsigned($unsigned({$unsigned(wire1),
                      (8'hb4)})) : (($unsigned({wire1}) ?
                          reg15 : ((reg21 ? reg8 : reg11) ?
                              {(8'hb9), reg19} : ((8'ha5) ? (8'ha8) : wire4))) ?
                      $unsigned($unsigned((-reg16))) : $unsigned((wire3[(2'h3):(1'h1)] | reg10))));
            end
          reg19 <= wire4;
          if ($signed(reg17))
            begin
              reg20 <= {$unsigned((^(^~(reg18 ? (8'hb8) : wire4)))),
                  reg13[(4'he):(2'h2)]};
              reg21 <= $signed((|{$unsigned((reg11 >>> reg16))}));
              reg22 <= {($unsigned($signed((reg9 ?
                      reg18 : reg8))) < $unsigned(((reg18 - reg19) >>> ((8'ha7) ?
                      reg8 : reg19))))};
              reg23 <= wire3;
              reg24 <= ($unsigned(wire6[(4'ha):(1'h1)]) ?
                  ((~&$unsigned($signed(reg22))) >> wire5) : $unsigned(reg19));
            end
          else
            begin
              reg20 <= ($signed(reg14[(3'h4):(1'h0)]) || wire0[(3'h4):(3'h4)]);
              reg21 <= (wire3[(4'hd):(3'h6)] * (($signed((reg15 != reg18)) | (^~$unsigned(reg7))) ?
                  ((^~(-reg8)) ?
                      ({reg8, reg13} ?
                          $signed(reg18) : (^~(8'hb2))) : reg11[(3'h4):(2'h2)]) : wire3));
              reg22 <= {(reg18 ? $unsigned(wire1) : $unsigned((8'h9d)))};
            end
        end
    end
  assign wire25 = (reg18 | $unsigned(wire2));
  assign wire26 = $signed(reg16[(1'h0):(1'h0)]);
  assign wire27 = ($unsigned($signed(($signed(wire2) && (wire25 != (8'ha0))))) ?
                      reg9 : $signed((^~(8'hbc))));
  assign wire28 = wire6;
  always
    @(posedge clk) begin
      reg29 <= ((reg8[(3'h6):(3'h5)] ?
              reg19[(2'h2):(1'h1)] : ({$unsigned(reg7)} ?
                  (((7'h40) != reg8) + wire4[(2'h3):(2'h2)]) : $signed((reg21 ?
                      reg22 : wire0)))) ?
          ((($unsigned(reg8) <<< (^reg14)) ?
                  (reg21 && wire4[(1'h1):(1'h0)]) : (~&wire25)) ?
              (wire28 ?
                  ($signed(reg15) < {reg12}) : (+{reg16,
                      (8'hb9)})) : ({wire3[(4'ha):(2'h2)]} + $signed(wire25))) : ((|(+wire2[(1'h1):(1'h0)])) ?
              (|reg21[(1'h1):(1'h0)]) : ({(~&reg7)} < wire2[(3'h4):(2'h2)])));
      if ((((((reg7 ~^ reg23) ? (^~wire27) : $signed(reg16)) ?
                  wire5[(4'h9):(2'h2)] : ((wire25 < reg13) ?
                      $signed(wire1) : (reg16 >> reg18))) ?
              reg19 : ({$signed(reg20)} >> (+(wire6 ? reg9 : wire5)))) ?
          ($unsigned((^~$unsigned((7'h44)))) ~^ reg18[(3'h4):(2'h2)]) : (($unsigned($signed((8'hb8))) ~^ {$signed((8'ha6)),
                  (-(8'ha5))}) ?
              $signed({{reg16, (8'had)}}) : reg24[(2'h3):(1'h0)])))
        begin
          reg30 <= ((~^(reg18 - ((reg11 ? wire0 : (8'hb9)) ?
              (wire0 >>> reg12) : ((8'hbb) ^ reg23)))) * ($unsigned($signed((wire6 <= wire6))) * ($signed(reg16[(1'h1):(1'h0)]) ?
              (((8'hae) ^~ reg20) != $signed(wire4)) : $signed(wire5))));
          reg31 <= $signed($signed(reg7[(2'h2):(1'h1)]));
          reg32 <= ({(^~((wire2 == reg12) >= $signed((8'ha2)))), reg8} ?
              ((^~{(wire27 ? wire4 : reg18),
                  {reg23, wire27}}) + reg19[(3'h4):(1'h0)]) : wire4);
          if (({$unsigned((!$signed(wire5)))} == (!(reg21 ?
              ((+reg30) && $unsigned(wire4)) : $signed((+(8'ha3)))))))
            begin
              reg33 <= $signed(((wire27[(1'h0):(1'h0)] <= (reg31[(3'h6):(3'h6)] ?
                      (reg12 <<< reg21) : wire26[(1'h1):(1'h1)])) ?
                  (((+reg17) ? $unsigned(reg32) : reg23) * {wire4,
                      reg8}) : (8'hbd)));
              reg34 <= $unsigned($signed((~&{(wire4 ? reg31 : reg10),
                  $signed((8'haa))})));
            end
          else
            begin
              reg33 <= (+{reg11[(1'h1):(1'h1)]});
              reg34 <= $signed({(~(~&reg15[(1'h1):(1'h0)]))});
            end
        end
      else
        begin
          if (((((wire2[(3'h4):(3'h4)] ?
                          $unsigned(wire3) : $unsigned((8'hab))) ?
                      reg23 : reg34) ?
                  ((((8'hb6) ?
                      reg32 : wire25) <<< $unsigned((8'haf))) != {$unsigned((8'hbd))}) : wire26[(3'h6):(1'h0)]) ?
              ((reg31[(2'h2):(2'h2)] ?
                      ((reg33 && wire25) < reg8) : wire2[(1'h0):(1'h0)]) ?
                  $signed(reg31) : {reg31}) : (8'h9d)))
            begin
              reg30 <= (&wire2);
              reg31 <= (&((reg34[(2'h2):(1'h0)] ?
                      {$signed((7'h42))} : {{wire4, wire4}, $signed(reg8)}) ?
                  $unsigned($unsigned((-wire28))) : {(reg22 ?
                          reg32 : $unsigned(reg31)),
                      (reg14 ? $signed(reg16) : (reg12 << wire0))}));
              reg32 <= ($signed($unsigned((((8'ha6) && (8'hb2)) ?
                      $signed(reg14) : {(8'ha6)}))) ?
                  {(^reg12[(2'h2):(2'h2)])} : $signed($signed((~&reg17[(3'h5):(2'h2)]))));
              reg33 <= ($unsigned(reg17[(4'hc):(1'h0)]) | {(reg16[(2'h2):(2'h2)] ?
                      (~^{(8'ha3)}) : wire4[(2'h3):(1'h0)]),
                  $signed((|reg9[(4'hb):(4'h9)]))});
              reg34 <= (~|$unsigned((&(~|(reg20 || wire1)))));
            end
          else
            begin
              reg30 <= ((&$unsigned($unsigned($unsigned((8'hb9))))) - ({(-(reg20 ?
                      reg18 : reg17)),
                  reg20} * ((!$signed(reg19)) > wire4)));
            end
          if ($unsigned(reg31))
            begin
              reg35 <= ($unsigned(($signed($signed(reg17)) >>> $signed((8'h9f)))) ?
                  (reg34 ? reg33 : (^~(+(|wire0)))) : wire6);
              reg36 <= reg7;
              reg37 <= reg24;
              reg38 <= wire4;
            end
          else
            begin
              reg35 <= reg21;
              reg36 <= ($unsigned((|reg12)) && reg32);
              reg37 <= {($unsigned(wire3) ?
                      $signed({reg9[(2'h2):(2'h2)]}) : ((^~(reg36 ?
                          reg31 : (8'hae))) ^ ((+(8'hb2)) ~^ {wire3, reg33})))};
            end
          reg39 <= (reg35[(3'h5):(3'h4)] ^ $signed(wire1[(4'he):(4'hc)]));
        end
    end
endmodule
