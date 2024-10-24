module top
#(parameter param47 = ((8'ha6) ^~ ({(((8'hb4) ? (8'haa) : (8'ha5)) > (8'ha1))} ? (7'h43) : (~|(((8'ha9) ? (8'ha1) : (8'ha5)) >= ((8'hb9) ? (8'ha3) : (8'hbd)))))), 
parameter param48 = param47)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire13,
                 wire4,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (wire3 != wire1);
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg5 <= {(~&wire4)};
        end
      else
        begin
          reg5 <= wire0[(3'h6):(3'h5)];
          reg6 <= $unsigned(wire3[(3'h7):(1'h1)]);
        end
      reg7 <= ((~^wire4[(1'h0):(1'h0)]) ?
          $unsigned((8'ha7)) : $signed({wire0[(3'h6):(3'h5)]}));
      reg8 <= $signed($unsigned(wire1));
      if ($signed((wire0[(4'h8):(1'h1)] ?
          ((^(&reg6)) - wire0[(3'h5):(3'h5)]) : reg5[(4'he):(2'h2)])))
        begin
          reg9 <= (^reg7);
          reg10 <= ((({reg7[(1'h0):(1'h0)], $unsigned(reg6)} ?
                  (8'hbb) : $unsigned($unsigned(wire2))) ?
              (wire3 >= $signed({(8'hb4)})) : $unsigned($unsigned(wire0))) >= reg5);
        end
      else
        begin
          reg9 <= wire0;
          if (($unsigned((reg5[(4'h9):(1'h1)] ~^ (reg10[(3'h5):(2'h3)] ?
                  reg5[(2'h2):(2'h2)] : reg8))) ?
              $signed(reg7) : $signed($unsigned((~|$unsigned(reg7))))))
            begin
              reg10 <= (~^(8'h9e));
            end
          else
            begin
              reg10 <= {$unsigned((((reg9 <<< (8'ha1)) != $signed(wire2)) & ({wire4} ?
                      (|(7'h44)) : {(8'ha0), reg5}))),
                  (~|({wire3, (+reg9)} && wire1))};
              reg11 <= ($signed((((8'hba) < $unsigned(reg8)) ?
                      ((reg8 ? wire1 : reg8) ?
                          $signed(reg8) : $unsigned(wire0)) : $signed(reg6[(1'h0):(1'h0)]))) ?
                  ((+$signed((&(8'ha5)))) ? (~|{reg10}) : reg10) : wire4);
              reg12 <= wire0[(3'h7):(2'h2)];
            end
        end
    end
  assign wire13 = ($signed($signed($unsigned($unsigned(wire0)))) * (-((!$signed(reg5)) ?
                      ($signed((8'hb4)) ?
                          (~&wire2) : ((8'ha5) * reg8)) : $unsigned((~&reg7)))));
  always
    @(posedge clk) begin
      reg14 <= ($signed((^({wire2,
          (8'hbf)} == (reg11 | reg9)))) < reg7[(1'h0):(1'h0)]);
    end
  assign wire15 = reg7;
  assign wire16 = reg8[(1'h0):(1'h0)];
  assign wire17 = ((wire16 ?
                      ((((8'h9e) >= wire13) ? wire13 : (-wire0)) | ((reg10 ?
                          reg11 : reg7) <<< wire3)) : wire15) >> (reg6[(4'h8):(1'h1)] << reg10));
  assign wire18 = $signed($signed({($unsigned(reg7) ?
                          wire4 : $unsigned((7'h40))),
                      wire1[(1'h1):(1'h0)]}));
  always
    @(posedge clk) begin
      reg19 <= (&(~&{wire4}));
      reg20 <= wire15;
      reg21 <= (((reg12 ?
              $signed(wire1[(2'h2):(1'h0)]) : (wire4 ?
                  $unsigned(wire0) : {wire13, reg19})) ?
          wire18[(5'h11):(4'hb)] : (wire18 ?
              reg7[(2'h2):(2'h2)] : (-((8'hbd) ?
                  reg6 : wire15)))) || (((~(+wire3)) ^ $unsigned((reg7 ?
          reg10 : wire2))) <<< wire16[(3'h6):(1'h0)]));
      if (wire1)
        begin
          reg22 <= {$signed(((&reg6[(4'h9):(2'h3)]) ?
                  ((-wire17) != (reg11 != wire0)) : $signed((&reg7))))};
        end
      else
        begin
          if ($signed(wire15[(4'hc):(1'h1)]))
            begin
              reg22 <= wire16;
              reg23 <= $unsigned(($unsigned($signed((wire15 ?
                  reg19 : wire18))) < (wire13[(4'h9):(4'h8)] | wire4[(3'h4):(1'h1)])));
              reg24 <= {$signed(wire2),
                  $unsigned(((~&reg20) * wire1[(2'h2):(1'h0)]))};
              reg25 <= ((&$signed($unsigned({wire4,
                  reg11}))) != $signed(reg20));
              reg26 <= $signed({(|$signed((wire3 >= reg21))), {reg12}});
            end
          else
            begin
              reg22 <= reg22[(3'h4):(1'h0)];
              reg23 <= wire17;
              reg24 <= {((((reg20 ? reg11 : reg7) + (~&wire2)) ?
                          ($unsigned(reg10) >>> $signed(reg8)) : $unsigned($unsigned(wire15))) ?
                      $unsigned($signed(((8'hbb) ? (7'h44) : wire1))) : reg12),
                  reg12[(3'h6):(2'h3)]};
            end
          if (((8'haf) ?
              reg19[(5'h11):(4'ha)] : {(&($unsigned((8'hb3)) ?
                      $unsigned(reg7) : (+reg12))),
                  (reg20 ?
                      ($unsigned(reg25) ?
                          $signed(reg6) : (~|reg25)) : ({(8'hb1)} ?
                          {reg22, wire16} : {reg22}))}))
            begin
              reg27 <= (~|(8'ha0));
              reg28 <= $signed({reg25[(1'h1):(1'h1)], reg6});
              reg29 <= (~^reg22[(1'h0):(1'h0)]);
              reg30 <= ((+$unsigned((7'h43))) ?
                  ($signed(wire4) ?
                      (($signed(reg19) <<< (reg12 ? reg6 : reg11)) ?
                          reg21 : ($unsigned((8'hb0)) - (wire17 ?
                              reg28 : reg25))) : (reg21[(3'h7):(1'h0)] ^ $signed($signed(reg29)))) : ($unsigned(reg26) ?
                      {wire0,
                          $unsigned(reg20[(4'ha):(2'h2)])} : (reg25[(1'h1):(1'h1)] ?
                          $unsigned((+(8'h9e))) : (reg26 & (^~reg19)))));
              reg31 <= (+(reg9 ? wire0[(3'h6):(3'h5)] : (8'ha7)));
            end
          else
            begin
              reg27 <= reg26;
            end
          if (reg31)
            begin
              reg32 <= (-$unsigned((^~reg25)));
              reg33 <= (~&(reg25[(1'h1):(1'h0)] || ($signed((&wire13)) << ((8'hbc) >= (reg6 ?
                  reg14 : (8'hae))))));
              reg34 <= ($unsigned({(reg30[(3'h5):(2'h2)] - (reg28 >> wire2)),
                  $signed((wire1 ? reg11 : reg19))}) & $unsigned(reg5));
              reg35 <= {reg33[(1'h1):(1'h0)]};
            end
          else
            begin
              reg32 <= reg22[(2'h3):(2'h3)];
              reg33 <= reg20;
              reg34 <= (|($unsigned(($unsigned(reg34) ?
                      $signed(reg5) : reg27[(2'h2):(1'h0)])) ?
                  $unsigned(wire13[(1'h0):(1'h0)]) : (wire0 > ((8'haa) > $unsigned(reg34)))));
              reg35 <= ((&$signed((^(reg32 >>> reg29)))) ?
                  (reg11[(3'h5):(3'h5)] > ((~(wire15 ?
                      reg10 : reg12)) ~^ reg21[(5'h11):(4'h8)])) : (~|(reg29[(1'h1):(1'h0)] ?
                      {(reg35 >= wire17)} : ((reg20 ?
                          reg21 : wire0) & (|(8'hab))))));
            end
          reg36 <= $unsigned(reg20);
          reg37 <= $signed({($signed($unsigned(reg29)) * ((wire4 ?
                  wire0 : reg32) - (wire13 ? reg19 : (8'hbb)))),
              $signed({(~|wire17)})});
        end
      reg38 <= $unsigned($signed(({((8'hb4) >> reg23)} != $signed(wire18))));
    end
  assign wire39 = ($signed($unsigned((8'h9c))) ^ $unsigned((~&((reg5 ?
                      (8'ha5) : reg8) || $signed(reg29)))));
  assign wire40 = (~^(&$unsigned({reg11[(3'h4):(2'h2)],
                      wire4[(1'h0):(1'h0)]})));
  assign wire41 = reg21;
  always
    @(posedge clk) begin
      if (reg28)
        begin
          reg42 <= {(7'h42)};
          reg43 <= $signed($signed($signed(reg36)));
          reg44 <= (~|($unsigned((8'ha1)) ? reg26 : reg24[(1'h1):(1'h0)]));
          if ((+(~^$signed(((^~wire13) ? reg36 : reg23)))))
            begin
              reg45 <= {reg31[(4'hd):(2'h2)]};
            end
          else
            begin
              reg45 <= $unsigned(reg27);
            end
          reg46 <= $unsigned(reg7[(1'h1):(1'h0)]);
        end
      else
        begin
          reg42 <= ((^$signed(reg44[(2'h3):(1'h1)])) ?
              $signed((+$signed({reg36, reg34}))) : (reg44[(3'h5):(3'h5)] ?
                  (reg14 ?
                      $unsigned(reg34[(3'h5):(3'h5)]) : ((reg8 ?
                          reg33 : wire40) ^ reg5)) : reg11[(3'h5):(1'h0)]));
          reg43 <= $unsigned(({$signed($unsigned((8'ha9))), {(^~reg23)}} ?
              ((~(reg23 < wire3)) ?
                  (|$signed(wire4)) : reg34[(4'hd):(4'hc)]) : (((~|reg21) <= wire40[(1'h0):(1'h0)]) >>> reg31[(3'h5):(1'h0)])));
          reg44 <= ($unsigned({{(+wire18)}}) * (~((reg37 ?
                  (|(8'hb5)) : (wire2 ? wire41 : wire18)) ?
              ($signed(reg6) > (reg28 >= reg26)) : (&reg8[(3'h7):(2'h3)]))));
          reg45 <= ($signed(reg45) + {($unsigned((reg11 <<< reg5)) ?
                  (^~$signed(reg31)) : (~&$signed((7'h41)))),
              (({reg10, (8'hab)} ? reg24 : reg31[(4'he):(4'h9)]) ?
                  $unsigned($unsigned(reg10)) : $unsigned($unsigned(reg36)))});
          reg46 <= {{reg22,
                  ((reg36[(4'hc):(4'h8)] ?
                          $unsigned((7'h44)) : (reg30 || reg20)) ?
                      $unsigned((-reg38)) : wire16[(3'h5):(3'h5)])}};
        end
    end
endmodule
