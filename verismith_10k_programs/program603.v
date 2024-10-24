module top
#(parameter param60 = {(((((8'ha4) << (8'ha2)) - (+(7'h44))) == (((8'haf) - (8'ha9)) * ((8'h9d) ? (8'hbf) : (8'ha3)))) ? (-({(8'ha0)} ? (^~(8'hba)) : ((8'hb8) & (8'hba)))) : (~((~|(8'hb6)) ? (|(8'hbb)) : ((8'hb7) ? (8'hb4) : (8'h9d)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire31,
                 wire6,
                 wire5,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
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
                 (1'h0)};
  assign wire5 = (+$unsigned((($unsigned(wire3) + $unsigned(wire3)) < (wire0[(4'he):(4'hd)] || $unsigned(wire1)))));
  assign wire6 = ((wire5[(4'hc):(4'ha)] + (wire2 != wire3)) ^ wire4);
  always
    @(posedge clk) begin
      reg7 <= wire0[(1'h0):(1'h0)];
      reg8 <= $unsigned((~|wire3[(1'h1):(1'h1)]));
      reg9 <= wire6;
    end
  always
    @(posedge clk) begin
      reg10 <= (wire6 != ((~^wire3) ?
          ((^{wire2}) || {$unsigned(wire0),
              ((8'hb1) ? wire1 : wire1)}) : ($signed($unsigned(wire4)) ?
              $unsigned($signed(wire0)) : (-wire1))));
    end
  always
    @(posedge clk) begin
      reg11 <= (({((wire6 <<< wire4) ?
                      ((8'hbf) * wire6) : (wire4 ? reg10 : wire3)),
                  (!$unsigned(wire6))} ?
              wire3[(2'h2):(1'h1)] : reg7) ?
          $signed(wire6) : $signed(((wire5[(2'h3):(2'h3)] == ((7'h40) ?
              wire4 : (8'ha9))) | wire1)));
      reg12 <= $unsigned($unsigned(({(^reg8)} ?
          ((+wire5) ? (~reg10) : (wire1 ~^ (8'hba))) : (~^(wire2 != reg11)))));
      reg13 <= (wire3[(2'h3):(2'h3)] ?
          $unsigned({($unsigned(reg7) & wire3),
              {$signed(wire2),
                  (wire5 << reg12)}}) : $signed(reg12[(4'hb):(2'h2)]));
      reg14 <= $unsigned(reg11[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg15 <= (~&(((!$unsigned(wire0)) > wire6[(1'h1):(1'h1)]) ^~ reg8[(3'h4):(1'h1)]));
      reg16 <= $signed(($signed($unsigned(((8'hb5) ? wire1 : (8'ha0)))) ?
          {reg8[(2'h2):(2'h2)],
              (reg7 ^ {wire4, (8'ha6)})} : wire3[(1'h0):(1'h0)]));
      if (($signed(reg10) != $signed((^~($signed((8'h9e)) == (~^reg16))))))
        begin
          if (wire1[(2'h3):(2'h2)])
            begin
              reg17 <= reg15;
            end
          else
            begin
              reg17 <= (reg10 - {($unsigned(((8'ha3) >= reg7)) == ((reg17 == (8'hba)) ?
                      reg17 : (wire1 & wire0)))});
              reg18 <= reg17[(4'h9):(3'h5)];
              reg19 <= {reg9, ((8'h9e) ? reg9 : $signed(reg11[(3'h6):(1'h0)]))};
              reg20 <= (~&$signed(((^((8'h9d) ~^ reg10)) << ((wire6 ^ reg17) - reg13[(4'hf):(4'h9)]))));
              reg21 <= (^~reg8);
            end
          reg22 <= $unsigned((~reg9));
        end
      else
        begin
          if ($unsigned($signed(wire2)))
            begin
              reg17 <= reg22[(1'h1):(1'h1)];
            end
          else
            begin
              reg17 <= $signed($unsigned(((~(^~reg11)) ?
                  $signed($signed((8'hbf))) : ((8'ha2) ?
                      {wire3, reg16} : {(8'ha4), reg10}))));
              reg18 <= ((^~(((~|wire6) < (reg8 >>> reg7)) ~^ (~&$signed(reg7)))) <<< reg7);
            end
          if ($signed((~|(((&wire0) <= (reg18 <= (8'ha4))) ?
              reg11[(3'h4):(3'h4)] : wire4))))
            begin
              reg19 <= (({(^(reg21 ? reg22 : reg18)),
                          ($signed(wire1) * (reg16 | (8'h9c)))} ?
                      $signed(wire4[(4'h8):(2'h3)]) : $unsigned($signed((~|reg8)))) ?
                  (^$signed(wire0[(4'h9):(3'h5)])) : (8'hb2));
              reg20 <= reg14;
              reg21 <= {{$signed($signed(wire5[(4'h9):(1'h1)])),
                      ($unsigned($unsigned(reg10)) != (((8'ha9) ?
                              reg14 : (8'hb7)) ?
                          reg9 : (!reg7)))}};
              reg22 <= (~&(~^({{reg13}, {reg14}} ?
                  reg15 : $unsigned($unsigned(reg20)))));
            end
          else
            begin
              reg19 <= wire1[(3'h6):(3'h6)];
              reg20 <= {(reg19 ? reg17 : wire2[(3'h7):(1'h0)])};
            end
          reg23 <= (+$signed(wire2));
          if ($unsigned($unsigned($unsigned($signed($unsigned((8'had)))))))
            begin
              reg24 <= reg19;
              reg25 <= $unsigned(wire2);
              reg26 <= (~(8'hbb));
              reg27 <= $signed(($signed($unsigned((wire1 - reg12))) ?
                  reg15[(3'h7):(2'h2)] : (!(|reg12[(2'h2):(2'h2)]))));
              reg28 <= $unsigned((+($signed((8'hb6)) > wire6)));
            end
          else
            begin
              reg24 <= ({reg25[(2'h2):(2'h2)],
                  ({(reg20 ? wire3 : reg16), reg14} ?
                      $signed((!wire2)) : reg14[(2'h2):(2'h2)])} || $signed(wire2[(3'h7):(3'h6)]));
            end
        end
      reg29 <= (+$unsigned(reg25));
      reg30 <= (8'ha1);
    end
  assign wire31 = $signed(reg19[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg32 <= reg28;
      reg33 <= (reg32[(1'h0):(1'h0)] ?
          $unsigned(reg30) : ((^reg24) || (+$signed((reg11 <= wire0)))));
      if ((reg11 ?
          $signed($signed(reg18[(2'h2):(1'h1)])) : reg10[(4'h9):(4'h8)]))
        begin
          if ((((((-(8'ha2)) ?
                  reg17[(3'h6):(2'h3)] : reg10[(3'h7):(3'h5)]) >> wire6[(4'hc):(2'h3)]) >>> wire31) ?
              reg15[(3'h4):(1'h0)] : ($unsigned((wire0 ^~ reg25)) ?
                  (-reg13[(4'hc):(3'h6)]) : $signed(wire6[(4'hd):(3'h5)]))))
            begin
              reg34 <= wire3[(2'h3):(1'h1)];
              reg35 <= $unsigned((wire5 == wire6));
              reg36 <= (reg16 & ($unsigned({((7'h44) ? reg28 : reg35)}) ?
                  {wire31, reg29[(3'h5):(2'h2)]} : wire1[(4'h9):(4'h9)]));
            end
          else
            begin
              reg34 <= (((|(&(reg12 ^ wire3))) ?
                  $signed(reg28) : (|((reg7 + wire2) ?
                      wire5[(2'h2):(2'h2)] : (8'hb2)))) > (reg26[(1'h0):(1'h0)] ?
                  reg25 : $signed(reg30)));
              reg35 <= ($unsigned((+$unsigned((reg18 >= (8'ha0))))) >> $unsigned(reg35));
            end
        end
      else
        begin
          if (((($signed((reg25 >>> (8'hbf))) ? reg29[(2'h2):(1'h1)] : reg18) ?
              (~($signed(reg16) + (&(8'hb2)))) : $signed((~|reg25))) <= reg11))
            begin
              reg34 <= $unsigned({($unsigned((wire2 + reg33)) | $signed({reg22,
                      (8'hae)}))});
              reg35 <= wire1;
              reg36 <= ($signed($unsigned(($signed(reg24) >> (|reg11)))) ?
                  $unsigned($unsigned(((wire2 - reg35) >>> (|reg8)))) : (~^(!(&{wire3}))));
            end
          else
            begin
              reg34 <= (^{reg18[(2'h3):(1'h1)],
                  {$signed((reg23 ? reg24 : reg26))}});
              reg35 <= $unsigned(($signed($unsigned(reg23[(3'h4):(2'h2)])) >= $unsigned((8'h9e))));
              reg36 <= (-(+(~|($unsigned(reg27) > {reg25}))));
            end
          reg37 <= reg26[(2'h3):(2'h2)];
          reg38 <= (^wire5[(3'h4):(2'h2)]);
          reg39 <= {(~&{((|reg22) ? (reg24 > reg27) : reg16[(5'h11):(5'h11)]),
                  reg29}),
              $signed(reg10[(3'h5):(3'h5)])};
        end
      reg40 <= reg19;
    end
  always
    @(posedge clk) begin
      reg41 <= (+(+(~(-(^~reg40)))));
      reg42 <= (!$signed({((~&reg21) << reg23[(1'h0):(1'h0)])}));
    end
  assign wire43 = $unsigned(((8'h9e) >> $signed(reg18[(3'h4):(3'h4)])));
  assign wire44 = $signed({$signed(({reg7} ? {(8'ha2), wire5} : reg34)),
                      reg27});
  assign wire45 = (wire44 ?
                      $unsigned(wire1) : (wire3[(2'h2):(1'h0)] >= (wire6[(4'hf):(3'h7)] > {(reg8 & wire3),
                          (wire2 >= reg28)})));
  assign wire46 = $signed({reg42});
  assign wire47 = reg38;
  assign wire48 = ($signed($unsigned((~&(reg14 < (8'hb2))))) == $signed((reg27[(3'h6):(1'h1)] ?
                      wire31 : reg25[(3'h5):(2'h2)])));
  assign wire49 = $unsigned(wire43);
  always
    @(posedge clk) begin
      if (((reg26 <= $signed(wire3)) ?
          {$signed(reg32),
              (reg38[(4'hd):(4'ha)] > $signed((reg35 < reg37)))} : ($signed(reg25) ?
              (reg7[(2'h3):(2'h2)] <= reg15[(3'h7):(3'h7)]) : reg7)))
        begin
          if ((~&((&($signed(reg20) | reg11)) - reg16[(4'h9):(1'h1)])))
            begin
              reg50 <= reg27;
            end
          else
            begin
              reg50 <= (~reg32);
              reg51 <= $unsigned(reg41[(1'h0):(1'h0)]);
              reg52 <= $unsigned({(~^$unsigned($signed(wire49)))});
              reg53 <= {(~^reg40[(4'ha):(3'h7)])};
              reg54 <= reg33[(2'h3):(1'h1)];
            end
          if (reg7[(2'h3):(2'h2)])
            begin
              reg55 <= (reg51[(2'h2):(2'h2)] > ((wire46[(4'he):(4'hb)] ?
                      reg12 : (-{wire43})) ?
                  $unsigned({$signed(reg38)}) : reg24));
              reg56 <= (^~(reg39 ?
                  (wire44 ?
                      reg7 : {(-reg52), (+wire2)}) : (~&reg41[(1'h0):(1'h0)])));
            end
          else
            begin
              reg55 <= (|(reg36 << (^~(((7'h42) == reg29) ?
                  ((8'hbd) ? reg54 : wire1) : (~^reg41)))));
              reg56 <= $signed(reg10[(3'h6):(1'h0)]);
            end
          reg57 <= (($signed({((7'h44) <= reg13),
                  (8'ha8)}) ^~ (^$signed(reg13[(3'h7):(2'h2)]))) ?
              (wire2[(4'h9):(1'h1)] - reg50) : $signed($unsigned($unsigned((reg15 < reg27)))));
        end
      else
        begin
          reg50 <= (~(~&reg21[(2'h2):(1'h1)]));
          reg51 <= {reg52[(4'h8):(3'h6)]};
          reg52 <= $unsigned(wire4[(4'h9):(3'h6)]);
          if (reg41[(2'h3):(1'h0)])
            begin
              reg53 <= (~$signed($unsigned(reg19)));
              reg54 <= (~|($unsigned((8'hba)) ?
                  ($unsigned($signed(wire46)) & wire46) : $signed((~|reg20))));
              reg55 <= wire48;
            end
          else
            begin
              reg53 <= (8'hb8);
              reg54 <= $signed(((((wire45 < reg17) <<< (wire46 | reg28)) ?
                  (~&(reg42 * wire44)) : ((wire5 ?
                      wire43 : reg27) == (8'ha4))) + $signed(reg32)));
              reg55 <= ((reg23 ?
                  (reg39 >= $signed((wire48 - wire43))) : ((wire1[(4'hc):(4'ha)] ?
                          reg22 : reg55[(2'h3):(1'h1)]) ?
                      reg18[(1'h0):(1'h0)] : $signed({wire44,
                          reg19}))) < wire47);
              reg56 <= {(|(!{(+wire47), reg17[(1'h1):(1'h1)]}))};
              reg57 <= $unsigned(reg42[(2'h2):(1'h1)]);
            end
        end
    end
  assign wire58 = reg36[(3'h6):(3'h6)];
  assign wire59 = (8'haa);
endmodule
