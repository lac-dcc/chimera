module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h22d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire54,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg53,
                 reg52,
                 reg49,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
  always
    @(posedge clk) begin
      if ($unsigned({{$signed((wire4 > wire0))},
          $unsigned((-$unsigned(wire2)))}))
        begin
          reg5 <= (^~((+wire4[(4'h9):(3'h5)]) << ((^~(wire3 ? wire2 : wire4)) ?
              ((wire0 ? wire4 : wire0) ?
                  wire3[(4'h8):(2'h2)] : (+wire0)) : wire3[(3'h5):(2'h3)])));
          reg6 <= (((8'hbc) <<< {$unsigned(wire3)}) ?
              reg5[(4'ha):(3'h7)] : wire4);
          reg7 <= wire2[(3'h6):(2'h2)];
          reg8 <= (reg5 ?
              ((&$signed(reg7)) ?
                  ((^~$signed((8'ha0))) ?
                      ((wire4 ^ wire1) ?
                          (wire4 & wire3) : reg5) : (~|(-(8'h9c)))) : $unsigned((reg6[(4'h8):(3'h5)] * (wire4 ^ reg7)))) : reg5[(4'hb):(4'h9)]);
        end
      else
        begin
          reg5 <= $unsigned({$signed($signed($unsigned((8'ha8))))});
          if ((^~$unsigned((^~wire2))))
            begin
              reg6 <= ((((~&(wire0 ? reg6 : wire0)) ?
                      wire4 : ($signed(wire3) > {reg5,
                          wire2})) != $unsigned($signed($unsigned(wire4)))) ?
                  {((+(reg8 ? reg7 : reg7)) ?
                          wire0 : ($signed(reg5) * wire4[(3'h4):(3'h4)]))} : (reg8 ?
                      wire3 : (~^(&$unsigned(wire3)))));
              reg7 <= {(~|$unsigned(wire2))};
              reg8 <= ((|((8'h9e) ?
                  ({wire4} ?
                      reg5[(1'h0):(1'h0)] : (wire0 ?
                          wire1 : wire2)) : (8'hb7))) >= (((reg8 ?
                  (+wire4) : reg8[(2'h2):(2'h2)]) || wire2) && reg8[(3'h5):(3'h4)]));
              reg9 <= $signed($unsigned(wire0));
            end
          else
            begin
              reg6 <= $signed((~&reg7[(1'h0):(1'h0)]));
              reg7 <= (|(^{(~|(reg9 ? reg6 : reg9))}));
              reg8 <= $signed({$signed($unsigned($signed(wire3))),
                  ({$unsigned((8'hbd))} >>> (7'h44))});
              reg9 <= $signed($unsigned((reg6[(3'h5):(3'h4)] ?
                  wire0[(3'h4):(2'h3)] : (8'hb3))));
              reg10 <= {((reg5[(1'h0):(1'h0)] ?
                      $signed($signed(reg8)) : (!(~(8'ha6)))) << reg5[(3'h5):(3'h5)]),
                  wire3[(2'h2):(1'h0)]};
            end
          reg11 <= wire3;
          reg12 <= $unsigned(((!$signed(reg9)) ?
              (~|(wire4 ?
                  reg9[(3'h7):(2'h3)] : {reg11})) : (reg10 | (wire1 * wire0))));
          reg13 <= ($signed($unsigned($signed((wire4 ?
              wire4 : reg8)))) | (~^(~&$unsigned(((8'hb0) << reg5)))));
        end
      reg14 <= ((reg9 >>> {((reg5 ? reg10 : wire1) > reg5[(3'h5):(1'h0)]),
              (reg8[(2'h2):(2'h2)] ~^ (~&wire3))}) ?
          $signed((&((reg8 ?
              (8'hac) : (8'h9f)) <<< {(8'ha7)}))) : $unsigned(((&reg13[(3'h4):(1'h0)]) ^ {$signed(reg13),
              wire3[(4'h8):(3'h6)]})));
      reg15 <= {reg5[(1'h0):(1'h0)]};
    end
  always
    @(posedge clk) begin
      reg16 <= wire0[(4'hb):(4'hb)];
      reg17 <= $unsigned($signed(reg5[(4'he):(4'he)]));
    end
  always
    @(posedge clk) begin
      if (reg8)
        begin
          if ($signed(reg16[(4'hd):(2'h3)]))
            begin
              reg18 <= ((+(({(8'ha2),
                      reg7} ^ (reg12 * reg16)) & {reg12[(1'h0):(1'h0)]})) ?
                  reg13[(2'h2):(1'h1)] : {((reg11 && reg8[(2'h3):(1'h1)]) ?
                          reg16 : ($signed(reg11) >>> (|reg9)))});
              reg19 <= (($signed($unsigned($unsigned((8'hac)))) ?
                  $signed({(|wire1)}) : reg14[(4'ha):(1'h0)]) != $signed(({(reg7 ?
                      reg13 : reg9)} ~^ $signed({reg17}))));
              reg20 <= $unsigned(reg10[(5'h14):(3'h7)]);
            end
          else
            begin
              reg18 <= $signed((!$unsigned(reg6)));
            end
          if (($signed((reg5[(3'h6):(2'h3)] ?
                  $signed(((8'haa) ? reg7 : reg10)) : ((reg20 > wire1) ?
                      reg8 : (reg19 || wire0)))) ?
              $signed($unsigned({$unsigned((8'hbe))})) : $signed((7'h42))))
            begin
              reg21 <= $unsigned(($unsigned(wire2[(4'h8):(2'h3)]) * (reg11 ^ wire3[(1'h1):(1'h0)])));
              reg22 <= (~^{(+(-$signed(reg18))),
                  $unsigned({reg6[(3'h7):(1'h0)], (reg8 ? reg18 : reg20)})});
            end
          else
            begin
              reg21 <= $unsigned($signed((-{(reg21 && wire2)})));
              reg22 <= ($signed(((~&reg10[(3'h6):(2'h2)]) >> (&(&reg9)))) ?
                  {(~^reg19[(1'h1):(1'h0)]),
                      {($unsigned(reg12) ^ (8'hb7)),
                          $signed($signed(reg11))}} : (8'hb0));
              reg23 <= {{reg17}};
              reg24 <= (^(+reg17));
              reg25 <= reg22;
            end
        end
      else
        begin
          reg18 <= wire4;
          reg19 <= ($signed(wire4[(3'h4):(2'h3)]) >> $signed({reg17[(1'h0):(1'h0)],
              wire0}));
          reg20 <= reg8[(1'h0):(1'h0)];
          reg21 <= ((reg18[(4'hb):(3'h7)] >>> (~($signed((8'hbc)) || reg10))) - $signed(reg21[(1'h0):(1'h0)]));
        end
      reg26 <= ($unsigned((^reg23[(2'h2):(1'h1)])) * $unsigned(reg13[(1'h1):(1'h0)]));
      reg27 <= $signed($signed(reg26));
      if ($unsigned(wire4[(4'h8):(3'h7)]))
        begin
          if ($unsigned(reg25[(2'h2):(1'h1)]))
            begin
              reg28 <= $signed({$signed(((+reg25) ~^ (reg11 ?
                      reg23 : reg26)))});
            end
          else
            begin
              reg28 <= $unsigned($unsigned(reg10[(3'h6):(2'h3)]));
              reg29 <= reg10[(4'h8):(2'h3)];
              reg30 <= $unsigned({(8'hb1), $unsigned(reg25)});
              reg31 <= (&reg30);
            end
          reg32 <= ($signed($signed($signed((wire3 ?
              reg29 : reg24)))) && reg25);
          reg33 <= ((($unsigned((reg15 ~^ reg27)) ~^ $signed((~^reg9))) ^~ (^~{((8'ha3) & reg29)})) >>> ($signed(reg11) <<< ($unsigned($signed((8'hae))) < reg23)));
          reg34 <= (!($unsigned($signed((wire1 ? reg8 : reg13))) ?
              {wire3} : reg24));
          reg35 <= (-reg15);
        end
      else
        begin
          reg28 <= $unsigned({reg22[(5'h10):(2'h3)],
              $signed((+((8'ha7) ? (8'hb8) : reg8)))});
          reg29 <= {$signed(reg18), reg31};
          reg30 <= reg18;
          reg31 <= $unsigned(($unsigned(reg30[(2'h2):(2'h2)]) >= reg19[(4'hc):(4'hb)]));
        end
      reg36 <= (($unsigned(($unsigned(reg30) ?
              reg31[(1'h0):(1'h0)] : (reg9 ? reg29 : (8'hb6)))) ?
          $signed(((+(8'haf)) ^ reg23)) : ($unsigned((~reg15)) ?
              {{wire2, reg14}} : reg22)) * {({(reg28 ? reg7 : (8'hb1)), reg17} ?
              (8'ha0) : ((8'hbf) ? $signed((7'h42)) : reg32)),
          ((reg7[(2'h2):(2'h2)] - $signed(reg29)) ?
              ((reg12 <= reg7) ^ {reg13, reg23}) : ((reg11 <<< reg10) ?
                  reg24[(4'hb):(3'h4)] : (~|reg10)))});
    end
  assign wire37 = ((-reg6) * (|((~^$signed(reg21)) ?
                      reg33[(4'hf):(4'hb)] : $unsigned($unsigned(wire4)))));
  assign wire38 = $unsigned((-((^~$signed(reg36)) ~^ (-(+reg17)))));
  assign wire39 = reg19;
  assign wire40 = ($signed($unsigned(reg12)) < ($signed(($unsigned(reg25) ?
                          (-wire1) : reg17[(3'h5):(2'h2)])) ?
                      $signed($signed($signed(reg5))) : $signed($signed(wire39[(4'hd):(2'h2)]))));
  always
    @(posedge clk) begin
      if ((&((($signed((8'hb6)) ? wire1[(5'h11):(3'h5)] : reg33) ?
              ($unsigned(reg36) - (~^reg31)) : (wire38 * reg28)) ?
          (^~(+(wire39 <= reg8))) : reg21)))
        begin
          reg41 <= $unsigned((^(reg13 ?
              $unsigned((-reg18)) : $unsigned($unsigned(wire3)))));
          reg42 <= (reg35[(4'hb):(3'h7)] ?
              (($signed(reg33[(4'hc):(4'ha)]) ?
                      (wire40[(1'h0):(1'h0)] ?
                          (!reg32) : $unsigned(reg17)) : $unsigned(reg16)) ?
                  (|(reg6 ?
                      ((8'hac) ?
                          reg14 : reg25) : {(8'ha9)})) : (($signed(wire4) ?
                      reg36 : $unsigned((8'hb7))) >= reg10)) : $signed(wire38));
          reg43 <= ({$unsigned(((reg35 ? reg25 : reg31) < reg14)),
              (reg8 ?
                  $signed($signed((8'ha4))) : reg7[(1'h1):(1'h1)])} ~^ wire0[(2'h2):(1'h1)]);
        end
      else
        begin
          reg41 <= reg6;
          reg42 <= reg10;
          reg43 <= (((8'hbe) ? (~^(~(!(8'ha6)))) : (^~wire40[(2'h3):(1'h0)])) ?
              reg22 : (reg41[(4'h9):(3'h6)] ? reg19[(4'hf):(3'h7)] : wire39));
          reg44 <= reg23[(1'h0):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg45 <= reg16;
    end
  assign wire46 = $unsigned($unsigned($unsigned(reg35[(4'h8):(1'h1)])));
  assign wire47 = reg13;
  assign wire48 = (reg33[(4'hc):(1'h0)] ?
                      (+{((reg30 != (8'h9d)) ?
                              $unsigned(wire38) : (wire3 ? reg27 : (8'ha2))),
                          reg10}) : reg32);
  always
    @(posedge clk) begin
      reg49 <= (~&reg7[(1'h1):(1'h1)]);
    end
  assign wire50 = ({reg36[(3'h6):(3'h6)],
                      $unsigned(reg24[(3'h4):(2'h2)])} > ((($signed((8'hb1)) == $signed(reg5)) ?
                          reg14[(3'h5):(2'h3)] : (!(reg8 != (8'hbb)))) ?
                      (~|reg12) : $signed($signed((reg42 | reg5)))));
  assign wire51 = {reg10};
  always
    @(posedge clk) begin
      reg52 <= wire46;
      reg53 <= $unsigned($signed($unsigned(reg15[(4'h8):(3'h6)])));
    end
  assign wire54 = $signed(reg19[(4'hb):(4'h8)]);
endmodule
