module top
#(parameter param67 = ((&((((8'hb7) ? (8'ha5) : (8'hb4)) ? ((8'hbc) ^~ (8'ha5)) : ((7'h44) <<< (8'hb4))) ? (((8'hb4) == (8'hb1)) ? ((8'hbf) ? (8'ha4) : (8'hae)) : ((7'h44) ? (8'haa) : (8'ha0))) : ({(8'hac)} && ((8'ha4) <<< (8'hbd))))) + ((((~(8'ha0)) ~^ (~(8'hac))) ~^ (&(+(7'h44)))) ^ ({((8'hb9) ? (7'h44) : (8'ha9)), ((8'h9c) | (8'ha0))} ? (~((8'h9e) ? (7'h40) : (8'ha8))) : (-((7'h43) ? (8'ha1) : (8'h9d)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire52,
                 wire31,
                 wire30,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg51,
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
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
      if ((^wire0[(1'h1):(1'h1)]))
        begin
          reg4 <= wire3;
          reg5 <= {{$unsigned($signed($signed(wire3))),
                  (^~wire2[(4'h9):(3'h4)])},
              reg4};
          reg6 <= (wire3[(4'hc):(1'h0)] ^ $signed((8'hb2)));
          reg7 <= {reg5, wire1};
        end
      else
        begin
          reg4 <= $signed(reg7[(3'h7):(1'h1)]);
          if (wire1[(4'hc):(3'h6)])
            begin
              reg5 <= (($unsigned((~(wire1 ? wire2 : (8'h9c)))) ?
                  reg5 : $unsigned($unsigned(reg7))) <= {reg6,
                  $signed($signed((wire2 && wire0)))});
            end
          else
            begin
              reg5 <= $unsigned(reg7[(4'ha):(1'h0)]);
            end
        end
      reg8 <= $unsigned((!$unsigned(reg5)));
      if (wire3)
        begin
          if ($signed((|reg4[(2'h2):(2'h2)])))
            begin
              reg9 <= (wire0[(1'h1):(1'h0)] ?
                  (+wire0[(3'h4):(2'h2)]) : ({($unsigned(reg6) ?
                          reg6[(2'h2):(1'h0)] : reg6),
                      $unsigned((reg7 + wire1))} * $unsigned((reg5 ?
                      wire3[(3'h4):(2'h2)] : $unsigned(reg4)))));
              reg10 <= $signed(($signed((!(^reg6))) ?
                  (^wire0) : $signed(($signed(reg7) == (wire3 ?
                      wire1 : reg5)))));
              reg11 <= ($unsigned((((reg9 ? wire1 : (7'h41)) ?
                      (reg7 < wire2) : (!reg4)) < reg10[(4'h9):(3'h5)])) ?
                  ((~|((reg10 ?
                      wire0 : reg5) - $unsigned(reg9))) == $signed($unsigned((wire3 ?
                      reg10 : (8'hbc))))) : (|$unsigned(reg7)));
              reg12 <= reg7;
              reg13 <= reg5;
            end
          else
            begin
              reg9 <= reg8;
              reg10 <= $signed($unsigned(reg4));
            end
          reg14 <= $signed($signed(reg8[(1'h1):(1'h0)]));
          reg15 <= ($signed((((wire2 == wire3) ?
              $signed(wire1) : {reg14, reg5}) & ((reg5 ?
              wire3 : reg11) ^ reg10[(2'h2):(1'h1)]))) > $signed((~(-reg7[(4'h8):(3'h7)]))));
          reg16 <= $signed(((8'hbf) ? {(reg9 >> reg11)} : reg10));
        end
      else
        begin
          reg9 <= ($signed((^(reg6[(1'h1):(1'h0)] ?
                  (reg12 >>> reg13) : {reg15}))) ?
              {((reg4 ? (&reg13) : wire1) ?
                      (reg8 ?
                          $signed(reg4) : (reg6 & reg7)) : reg8[(1'h1):(1'h0)]),
                  (wire3 | (reg14 && (reg13 | reg4)))} : $unsigned((reg5[(1'h0):(1'h0)] ?
                  reg4 : ((reg14 ? reg6 : (8'hb1)) ~^ {reg9, reg15}))));
          reg10 <= reg9[(4'hb):(3'h7)];
        end
      if (reg5[(3'h6):(3'h6)])
        begin
          reg17 <= (~(reg14[(2'h3):(1'h1)] > ($signed((&wire1)) | (&(reg8 ?
              reg11 : reg12)))));
          if (reg14)
            begin
              reg18 <= ((reg15[(2'h2):(2'h2)] + {reg11}) - $signed({{reg4[(3'h5):(1'h0)],
                      ((8'had) * reg9)},
                  $signed({reg9, reg12})}));
              reg19 <= (~&$signed(($signed({(8'hb3), reg18}) >= {(!wire1)})));
              reg20 <= wire1;
              reg21 <= reg18;
            end
          else
            begin
              reg18 <= {reg9};
            end
          reg22 <= reg10[(3'h5):(1'h1)];
          reg23 <= (reg6 >>> reg13[(2'h2):(2'h2)]);
        end
      else
        begin
          if (wire3[(3'h5):(2'h3)])
            begin
              reg17 <= $unsigned(((-$signed(reg7[(2'h3):(2'h3)])) >>> ({(reg6 + reg9)} != (~&(^reg6)))));
              reg18 <= $signed((8'hbf));
            end
          else
            begin
              reg17 <= (reg10[(3'h4):(1'h0)] ? (|reg18) : $signed((8'haa)));
              reg18 <= (reg4 != (-$unsigned((+{reg10, (8'hb9)}))));
            end
          if ($signed($unsigned(((&(reg6 && reg14)) && (~^$signed(reg17))))))
            begin
              reg19 <= reg12[(1'h1):(1'h1)];
              reg20 <= (($signed($signed((~|reg20))) + $unsigned((|$signed(reg13)))) + (~^($unsigned((-reg7)) | $unsigned((+wire1)))));
              reg21 <= $unsigned(($unsigned((-wire1)) <<< (8'hb3)));
              reg22 <= (8'haa);
              reg23 <= {reg11[(4'h8):(1'h1)]};
            end
          else
            begin
              reg19 <= reg9;
              reg20 <= {wire3,
                  ({($unsigned(reg19) ? $signed(reg14) : wire2[(2'h2):(2'h2)]),
                          wire3[(4'hc):(2'h2)]} ?
                      (8'hbe) : ($unsigned(reg11) <= reg10[(5'h12):(5'h12)]))};
              reg21 <= (~^reg18[(5'h12):(1'h1)]);
              reg22 <= wire3[(4'hf):(4'hf)];
            end
          if ($signed(reg23))
            begin
              reg24 <= $unsigned($signed(wire0[(2'h2):(1'h0)]));
              reg25 <= $unsigned({($unsigned($signed(reg11)) < (reg15 ~^ (reg24 ?
                      wire0 : reg5)))});
            end
          else
            begin
              reg24 <= (reg4 + {(&$signed({reg18, reg22})),
                  reg25[(3'h5):(1'h1)]});
              reg25 <= ({wire3, (~reg23)} ^~ {((~(reg11 & wire1)) ?
                      (!$signed(reg20)) : $unsigned(wire2))});
              reg26 <= (($unsigned($unsigned($unsigned(reg4))) + {$signed(reg13[(3'h5):(1'h0)])}) >> $signed(($unsigned($signed((8'hbd))) >= reg24[(3'h4):(1'h1)])));
              reg27 <= wire3[(4'h8):(3'h5)];
            end
          reg28 <= $unsigned((reg7[(4'hc):(4'ha)] ?
              (+$unsigned($signed(reg5))) : (reg15[(1'h0):(1'h0)] >> wire0)));
        end
      reg29 <= reg24[(2'h3):(1'h0)];
    end
  assign wire30 = {reg21[(3'h4):(2'h3)],
                      ($signed(((&reg18) <= wire3[(1'h1):(1'h0)])) ?
                          (8'hb2) : $signed($unsigned((reg4 ?
                              wire3 : (8'haa)))))};
  assign wire31 = $unsigned(reg7);
  always
    @(posedge clk) begin
      reg32 <= $unsigned($signed($unsigned((|$unsigned(reg23)))));
      if ((~&(8'hb2)))
        begin
          reg33 <= reg20[(4'hd):(4'hb)];
          reg34 <= (^~(+($unsigned($signed((8'h9d))) && $signed(((8'hb2) + reg13)))));
          reg35 <= reg5;
          if ((reg35 > (^(($unsigned(reg15) ?
              (reg34 ?
                  reg9 : reg10) : reg12) == (reg32[(2'h2):(1'h1)] != $unsigned(reg27))))))
            begin
              reg36 <= (reg23[(1'h0):(1'h0)] ^ reg20);
              reg37 <= (reg36[(4'he):(4'h8)] ^ $unsigned(reg32));
              reg38 <= reg18[(4'ha):(2'h3)];
            end
          else
            begin
              reg36 <= ($signed(reg13[(3'h5):(2'h3)]) + wire1);
              reg37 <= $signed($unsigned(reg29));
              reg38 <= (|((reg16[(4'h8):(2'h2)] ?
                      reg12[(1'h1):(1'h0)] : $unsigned({reg5})) ?
                  (((reg18 ? reg17 : reg27) > $unsigned(wire2)) ?
                      $unsigned($unsigned(reg6)) : reg17[(5'h15):(5'h13)]) : ({$signed(reg34)} ?
                      ((wire1 ? reg28 : reg34) > (^reg35)) : ((reg4 - reg7) ?
                          (!reg15) : $signed(wire2)))));
              reg39 <= reg34[(4'hd):(4'hc)];
            end
        end
      else
        begin
          reg33 <= ((reg33 != wire0[(3'h5):(2'h3)]) ?
              ($unsigned(reg32) ?
                  reg22[(2'h2):(2'h2)] : $signed({{reg25}})) : (reg9 ?
                  reg7[(4'h8):(3'h4)] : (reg23 ?
                      (~(reg11 ?
                          (8'ha6) : reg36)) : (reg10 & (reg21 && wire1)))));
          reg34 <= (({(-reg28),
              $unsigned({reg32,
                  (8'hbb)})} * reg27) & $signed((reg33 ~^ ((reg29 & reg16) ?
              $signed(reg20) : reg10[(3'h5):(3'h4)]))));
          reg35 <= (reg39 ?
              ((($unsigned(reg24) ? (8'hba) : (8'haf)) ?
                  reg27 : (|$unsigned((7'h42)))) < reg35[(5'h13):(2'h2)]) : (~^$unsigned((-$signed(reg16)))));
        end
      reg40 <= $unsigned(reg17[(4'hb):(3'h6)]);
    end
  always
    @(posedge clk) begin
      reg41 <= {reg6,
          {((+$signed(wire30)) ?
                  reg10[(4'ha):(3'h7)] : {((8'hbe) ? reg23 : reg36), reg7}),
              (~&reg18[(3'h7):(3'h4)])}};
      reg42 <= (!((7'h43) ?
          ((^(|reg7)) - reg5) : $unsigned(wire31[(2'h3):(2'h3)])));
      reg43 <= reg19;
      if ({{(^reg9[(2'h2):(2'h2)])}, reg21[(2'h2):(1'h1)]})
        begin
          if (reg24[(3'h5):(2'h3)])
            begin
              reg44 <= (wire30[(2'h3):(2'h3)] ?
                  (8'hb3) : ($unsigned($unsigned((reg26 << (8'hb1)))) != wire3));
              reg45 <= (|(reg38[(3'h6):(3'h4)] << reg6[(1'h0):(1'h0)]));
            end
          else
            begin
              reg44 <= (~&$unsigned($signed((-(reg25 * reg32)))));
              reg45 <= $signed((!wire1));
              reg46 <= ((reg35[(2'h2):(1'h0)] ?
                  (^~({reg13} ? (~|reg12) : (reg15 - reg38))) : ({reg20,
                          (reg37 * reg39)} ?
                      (8'hb7) : (-(~^reg17)))) >>> (reg18[(3'h4):(1'h1)] ?
                  reg13 : wire3));
              reg47 <= {(reg15[(1'h0):(1'h0)] ?
                      $unsigned((&(~reg16))) : wire31),
                  $signed(reg22)};
              reg48 <= (~^$signed({{$signed(reg24)}}));
            end
          reg49 <= (((reg26[(3'h6):(1'h0)] ?
                  (-(reg48 ? reg29 : reg33)) : ((reg16 ?
                      reg5 : reg23) != $signed(reg45))) ?
              (^~{reg26, reg39[(4'h8):(2'h2)]}) : reg15) > reg21);
          reg50 <= wire3[(3'h6):(2'h2)];
        end
      else
        begin
          reg44 <= reg5;
          reg45 <= ($unsigned(reg14[(2'h3):(2'h2)]) ?
              $unsigned($unsigned(reg33[(1'h1):(1'h0)])) : $signed($unsigned($signed(wire30))));
          reg46 <= (($unsigned((8'hbe)) && wire3) << (reg41 - reg13));
        end
      reg51 <= (((~&(reg7 <<< $signed(reg32))) ?
              (~&(reg33[(1'h1):(1'h0)] + (~&(8'hb2)))) : (|reg46)) ?
          (&$unsigned({$signed(reg11)})) : (reg37[(1'h1):(1'h0)] && ($unsigned({reg24}) ?
              (reg39[(1'h1):(1'h0)] != $unsigned((8'hae))) : (^~$unsigned(reg15)))));
    end
  assign wire52 = (($signed((+$unsigned(reg36))) ?
                      reg48 : $unsigned(reg11)) - $unsigned(reg26));
  always
    @(posedge clk) begin
      reg53 <= reg34[(3'h7):(1'h0)];
      reg54 <= reg27;
      reg55 <= reg29;
    end
  always
    @(posedge clk) begin
      reg56 <= $unsigned($signed($signed($signed(reg44[(4'hb):(2'h2)]))));
      reg57 <= reg47;
      reg58 <= $unsigned((reg26 > ((reg27 <<< reg13) ^ (|$signed(wire52)))));
      reg59 <= $unsigned((!reg43));
      reg60 <= ($signed({reg6[(1'h0):(1'h0)]}) == reg32[(1'h0):(1'h0)]);
    end
  assign wire61 = $unsigned($unsigned((8'ha1)));
  assign wire62 = (-(((reg46 ?
                      (~|reg42) : $signed(reg58)) && reg35) < (reg20 ~^ (-reg23))));
  assign wire63 = reg32;
  assign wire64 = $unsigned(reg37);
  assign wire65 = $unsigned($signed($unsigned((-(reg11 ? reg35 : reg12)))));
  assign wire66 = reg42;
endmodule
