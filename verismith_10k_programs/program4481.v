module top
#(parameter param75 = (((~(~(~(7'h42)))) ^ ((((8'h9d) ? (7'h43) : (7'h41)) & (~^(8'ha4))) * (^~((8'had) >> (8'h9c))))) && (~&(({(8'hae)} ~^ ((8'had) >= (8'hb7))) ? {((7'h42) ? (8'ha8) : (8'ha7))} : (((7'h43) * (8'h9f)) && ((8'haf) == (8'hab)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire19;
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  assign y = {wire71,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire19,
                 reg74,
                 reg73,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (-(~^((8'h9c) ? wire3 : $signed((8'hb3)))));
      if ((+($signed(wire4[(2'h2):(1'h0)]) > (wire1 ?
          $signed((wire3 ?
              wire0 : wire3)) : (wire2[(1'h0):(1'h0)] + $signed((8'hb3)))))))
        begin
          if ($signed($unsigned(((!wire4[(2'h2):(2'h2)]) ?
              wire4[(2'h2):(2'h2)] : $signed((wire2 ^ wire4))))))
            begin
              reg6 <= ((wire4[(1'h0):(1'h0)] ?
                      $unsigned($signed($unsigned(reg5))) : wire2) ?
                  ((wire2[(2'h2):(1'h0)] ?
                          ((reg5 < wire2) ?
                              (reg5 ? wire3 : wire3) : {(7'h44),
                                  wire4}) : $signed(reg5)) ?
                      wire3 : wire3) : (wire3[(4'hf):(3'h6)] + ({{wire3}} ?
                      wire4 : $signed((~^reg5)))));
              reg7 <= reg6[(1'h0):(1'h0)];
            end
          else
            begin
              reg6 <= $signed($signed((($unsigned((8'hae)) & (reg7 ?
                      (8'hbc) : wire1)) ?
                  wire1[(3'h6):(3'h6)] : (wire2[(1'h1):(1'h1)] > {wire3}))));
              reg7 <= $unsigned(reg5);
              reg8 <= (($signed(wire1) <= $signed({$signed(reg5),
                  reg6[(1'h0):(1'h0)]})) + $signed(((8'ha7) ?
                  wire0[(3'h7):(2'h3)] : ((^wire2) ?
                      reg7 : $unsigned(wire3)))));
            end
          reg9 <= $signed($signed(wire1[(1'h0):(1'h0)]));
          reg10 <= (-reg6[(1'h1):(1'h1)]);
          reg11 <= wire4;
          reg12 <= (((~&wire3[(4'ha):(4'h9)]) == ($unsigned(reg9[(1'h1):(1'h1)]) ?
              $unsigned($unsigned(wire1)) : ((reg8 ? wire1 : wire2) ?
                  reg5[(4'h8):(4'h8)] : $unsigned(reg11)))) << {((8'hb3) ?
                  (^reg5[(4'ha):(3'h4)]) : reg7[(4'he):(4'hd)]),
              wire2[(1'h0):(1'h0)]});
        end
      else
        begin
          reg6 <= wire0;
          reg7 <= {reg5};
          reg8 <= (wire1 || (~|((^~(wire1 ?
              (8'h9d) : reg12)) << reg9[(2'h3):(1'h1)])));
          reg9 <= $signed((~&reg6));
        end
      reg13 <= {$signed(((wire3[(2'h3):(1'h0)] && {reg10,
              reg12}) || $signed($signed((8'ha6))))),
          (8'h9f)};
      reg14 <= $unsigned(reg11[(1'h0):(1'h0)]);
      if ((&reg8))
        begin
          reg15 <= {(reg5 ?
                  (reg6[(4'h8):(1'h1)] ?
                      reg9[(3'h4):(1'h1)] : reg8[(3'h4):(3'h4)]) : (wire4 ?
                      (-(reg6 - reg13)) : ({reg5, reg7} != $signed((8'hb0)))))};
          reg16 <= reg14[(4'h8):(4'h8)];
        end
      else
        begin
          if ($unsigned($signed((~({wire1, wire3} ? reg15 : reg8)))))
            begin
              reg15 <= $unsigned({reg14[(1'h0):(1'h0)]});
              reg16 <= reg14[(4'hb):(4'h9)];
            end
          else
            begin
              reg15 <= ({(reg13 ? reg6 : ({reg6} ? reg16 : ((8'h9c) << wire3))),
                      ({$signed((8'ha5)), $signed(reg7)} ?
                          (wire1 ?
                              $unsigned(reg8) : reg14) : (reg9[(1'h0):(1'h0)] ?
                              $signed(reg16) : wire0))} ?
                  ((~&(~^$signed(wire4))) ?
                      ($signed($signed(reg11)) ?
                          $unsigned((reg12 || reg7)) : {(~^reg10),
                              ((8'hb3) ?
                                  reg15 : reg14)}) : (8'had)) : reg10[(2'h3):(1'h0)]);
              reg16 <= (8'hac);
              reg17 <= reg16[(1'h0):(1'h0)];
              reg18 <= ((((~(reg5 ?
                  (7'h40) : (8'haa))) | (!reg13[(3'h4):(1'h1)])) ^~ (8'hb0)) ^~ $signed({($unsigned(reg16) < reg12)}));
            end
        end
    end
  assign wire19 = $unsigned((wire1 >> ({((8'hbe) ? reg8 : reg7),
                      (~^reg15)} ^ reg8[(4'ha):(1'h0)])));
  module20 #() modinst54 (.wire24(reg14), .wire23(reg6), .y(wire53), .clk(clk), .wire21(wire1), .wire22(reg12), .wire25(wire4));
  assign wire55 = {(^~(^~((^(8'hbe)) ? reg16[(4'hb):(3'h7)] : {wire4, reg7}))),
                      ((~^$signed(((8'hb1) << reg10))) >> reg9)};
  assign wire56 = {wire0[(1'h0):(1'h0)]};
  assign wire57 = (((^~(8'ha2)) & $signed((-(reg8 ? (8'hb6) : (8'hac))))) ?
                      wire53[(1'h1):(1'h0)] : {reg15});
  assign wire58 = $unsigned(((^(-((8'haf) << reg18))) <= {$unsigned(reg15[(2'h2):(2'h2)]),
                      (+$signed(reg12))}));
  assign wire59 = $signed(($signed((reg11 - {(7'h44)})) < ($signed(reg8[(2'h3):(1'h1)]) ?
                      ($signed(reg17) | (reg13 ? wire53 : reg6)) : ((reg10 ?
                              wire57 : wire53) ?
                          wire58 : (wire3 ^~ wire58)))));
  assign wire60 = wire57[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg61 <= $signed((-wire56));
      reg62 <= ($unsigned((({reg15} | (wire60 ?
              wire60 : wire59)) ~^ $signed({reg8}))) ?
          ($unsigned($signed($signed((8'hb2)))) ?
              reg10[(2'h2):(1'h0)] : ((wire57 <= {reg13, reg10}) ?
                  (+(reg9 ?
                      wire57 : wire3)) : (reg15[(4'h8):(3'h4)] ^ $signed(reg7)))) : ($signed(((reg61 && (8'haa)) ?
              $signed(wire58) : (reg8 ? reg7 : wire56))) & (8'ha1)));
      if ($unsigned($signed(((|(+reg12)) ^ (reg6 == (~^wire3))))))
        begin
          reg63 <= $signed($signed($signed($unsigned($unsigned(reg11)))));
          reg64 <= wire55;
        end
      else
        begin
          reg63 <= (~|($signed((|$signed(reg13))) ?
              $signed(wire59[(4'he):(2'h2)]) : (($signed(wire60) ?
                      (~^reg10) : {wire1, reg5}) ?
                  ((~^wire19) ?
                      reg13 : (8'hb7)) : $signed((wire53 >= wire58)))));
          reg64 <= {(~&($unsigned(wire53[(3'h4):(2'h2)]) ?
                  $signed((~reg15)) : reg9))};
          reg65 <= reg16;
          if (((^~(reg62 ? (~^(reg6 ^~ wire59)) : wire4[(1'h0):(1'h0)])) ?
              $signed(wire60[(3'h6):(3'h5)]) : (~(8'h9e))))
            begin
              reg66 <= reg18[(3'h5):(1'h0)];
              reg67 <= $unsigned($signed($signed($signed((^wire60)))));
              reg68 <= $unsigned((wire58 + $signed(reg64[(4'h8):(3'h7)])));
              reg69 <= $signed(reg8[(4'ha):(4'h9)]);
              reg70 <= (|(8'hbe));
            end
          else
            begin
              reg66 <= (^~{{$signed({(8'hbe)}), $signed($unsigned(wire19))},
                  {wire0, ($unsigned(reg70) & wire58)}});
              reg67 <= $unsigned($signed({($unsigned(reg65) ?
                      ((7'h40) ? reg12 : reg70) : (reg17 != reg64)),
                  reg68}));
              reg68 <= {$unsigned((^~(~^((7'h40) ? reg18 : reg10)))),
                  reg17[(2'h3):(1'h0)]};
              reg69 <= $unsigned(wire57);
              reg70 <= $signed($unsigned($signed(reg62[(2'h2):(1'h0)])));
            end
        end
    end
  assign wire71 = (|(reg67 ?
                      $unsigned(wire55[(2'h2):(1'h1)]) : $signed(reg13[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg72 <= $signed(((((-reg14) ? $signed((8'hb1)) : reg5) ?
          ((~&reg7) ~^ reg69[(3'h4):(2'h2)]) : reg14) >>> (8'hae)));
      reg73 <= $signed($signed((^~wire1)));
      reg74 <= $signed(((reg66 > (^~$unsigned(reg17))) ~^ {wire56[(3'h6):(2'h3)],
          $unsigned((reg6 ~^ reg12))}));
    end
endmodule

module module20
#(parameter param52 = {(~|{((&(8'hb4)) >> ((8'h9d) ^ (8'ha6))), (((8'hb8) || (8'hbb)) || {(8'haf), (8'ha7)})})})
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire [(2'h3):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire26;
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  assign y = {wire47,
                 wire26,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
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
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire26 = wire25[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if (wire25[(2'h2):(1'h1)])
        begin
          if (($signed((($unsigned(wire23) ?
              wire21 : wire22[(3'h5):(1'h0)]) >> (-wire21[(1'h0):(1'h0)]))) ^ wire24))
            begin
              reg27 <= (wire22 ?
                  $unsigned($signed($signed($signed(wire25)))) : wire26[(3'h7):(3'h4)]);
              reg28 <= wire26;
              reg29 <= reg27[(3'h5):(2'h2)];
              reg30 <= ($unsigned((wire22 ?
                      (8'haa) : ({wire26} ? reg28 : $unsigned(wire25)))) ?
                  {(+$signed({wire21, wire26})),
                      $unsigned(($unsigned(wire21) ?
                          wire23[(2'h2):(2'h2)] : {wire22}))} : ((&$unsigned((wire24 | wire23))) << ((!reg27) ?
                      ($unsigned(reg29) ?
                          wire21[(4'h9):(2'h3)] : $unsigned(wire25)) : wire26[(2'h3):(1'h0)])));
              reg31 <= {$unsigned($signed(((reg28 | wire23) ?
                      (reg30 ? wire25 : wire23) : ((8'hb6) < wire24)))),
                  {reg30, (^reg30)}};
            end
          else
            begin
              reg27 <= $signed($unsigned((($unsigned(wire26) ?
                  ((8'hb5) <<< reg29) : $unsigned(reg30)) > $signed((8'hab)))));
            end
        end
      else
        begin
          if ($signed(($signed(((7'h42) ?
              wire26[(2'h2):(1'h1)] : $signed(wire21))) + reg28[(3'h4):(2'h2)])))
            begin
              reg27 <= $unsigned((wire21[(1'h0):(1'h0)] << $signed({((7'h44) ^~ wire24)})));
              reg28 <= $unsigned({$signed((~reg28))});
              reg29 <= wire25[(4'h8):(3'h5)];
              reg30 <= $unsigned(reg29[(2'h2):(2'h2)]);
            end
          else
            begin
              reg27 <= ($signed((^~$signed((-reg30)))) ?
                  (~^$unsigned(wire23[(2'h2):(1'h1)])) : wire22[(3'h7):(3'h6)]);
              reg28 <= wire21;
              reg29 <= $signed($signed($signed((~^{reg27, reg29}))));
              reg30 <= (^~(wire25[(4'h8):(3'h6)] ?
                  $unsigned($unsigned(wire23)) : $unsigned(($unsigned(reg30) ?
                      ((8'hbb) ? reg30 : wire23) : $unsigned(reg31)))));
            end
          reg31 <= ({(wire24[(4'ha):(3'h4)] ?
                      (&$signed(wire21)) : {$signed((8'hb3))}),
                  ({((8'hae) ~^ wire25), wire26} ?
                      (~^{wire24}) : $unsigned((wire23 ? wire25 : reg31)))} ?
              $unsigned($signed($signed($signed(wire24)))) : (-$signed(($unsigned(wire22) && $unsigned(reg28)))));
          reg32 <= $unsigned((reg27 ^~ reg30));
          reg33 <= $signed(($signed($unsigned((8'ha0))) ?
              wire21 : $signed(reg30)));
          reg34 <= $unsigned((8'hb6));
        end
      reg35 <= (~^reg33);
      reg36 <= (^$signed((((wire25 ? wire22 : reg33) >> wire24[(4'hc):(4'hb)]) ?
          {(+reg27)} : {(wire22 >> reg29), (reg27 <<< reg28)})));
    end
  always
    @(posedge clk) begin
      reg37 <= ((|(+$signed(wire25[(3'h7):(1'h1)]))) != reg36);
      if ((^$signed((((reg34 ^~ wire24) ?
          (wire21 ? reg29 : reg28) : reg36) - $signed((~|reg34))))))
        begin
          reg38 <= (!$signed($unsigned(reg27)));
          if (reg29[(3'h7):(2'h2)])
            begin
              reg39 <= $unsigned(wire22[(2'h2):(1'h0)]);
              reg40 <= wire23[(1'h1):(1'h0)];
              reg41 <= {((~&(reg39 && $unsigned(reg38))) <<< $unsigned((^(reg28 ?
                      wire21 : reg39)))),
                  ($signed($unsigned(reg32)) < (8'hb7))};
              reg42 <= $signed($unsigned($unsigned(reg29[(2'h3):(2'h2)])));
              reg43 <= reg39[(4'h9):(3'h6)];
            end
          else
            begin
              reg39 <= $signed(reg39[(2'h2):(2'h2)]);
              reg40 <= ($signed({reg35[(1'h0):(1'h0)],
                  ((reg28 != reg31) & (wire25 > reg39))}) >>> $unsigned(wire22));
              reg41 <= $unsigned(($signed(wire23[(2'h3):(2'h3)]) >>> (~^($signed(wire23) ?
                  (reg27 ? reg30 : reg32) : $unsigned((8'hbb))))));
            end
          reg44 <= reg35;
          reg45 <= (!($unsigned($unsigned((reg33 == reg33))) ?
              $signed(($signed(reg40) ?
                  $signed(reg39) : reg40[(5'h10):(3'h5)])) : (reg42[(1'h1):(1'h1)] > $signed((~&reg28)))));
          reg46 <= {$signed((8'hbf))};
        end
      else
        begin
          reg38 <= reg27;
          reg39 <= reg44[(3'h7):(1'h0)];
        end
    end
  assign wire47 = reg45[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((8'haa))
        begin
          reg48 <= {$unsigned(wire22)};
          reg49 <= ((wire22 > $signed(wire25[(1'h1):(1'h1)])) == (reg42 ?
              reg27[(2'h2):(1'h0)] : reg43));
        end
      else
        begin
          reg48 <= wire47[(3'h4):(2'h2)];
        end
      reg50 <= (((|$signed({reg35})) ?
          $unsigned(((reg29 <<< reg44) & (reg43 + reg32))) : reg46) - $signed($unsigned($unsigned((~(8'hbb))))));
      reg51 <= reg38;
    end
endmodule
