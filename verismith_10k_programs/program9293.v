module top
#(parameter param67 = ((~|(({(7'h44)} >>> ((8'ha7) <= (8'hb1))) ? {(~&(8'hb8))} : (((8'hb7) ? (8'ha5) : (8'hb0)) ? {(8'ha7)} : ((8'ha4) ~^ (8'hb6))))) < (&((8'haa) >= (((7'h40) ? (8'hb1) : (8'h9f)) | ((7'h41) & (8'ha8)))))), 
parameter param68 = (param67 ? param67 : (-{(param67 >> {param67, param67}), ((param67 > param67) ? param67 : (~param67))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire40;
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire4,
                 wire5,
                 wire16,
                 wire17,
                 wire18,
                 wire40,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
  assign wire4 = wire0[(5'h12):(4'h8)];
  assign wire5 = (~&(($signed($signed(wire1)) + wire0[(5'h11):(3'h4)]) >> wire4));
  always
    @(posedge clk) begin
      if (((wire4 ? wire2[(1'h0):(1'h0)] : (wire5 ~^ $signed($signed(wire1)))) ?
          (!wire3) : (wire2[(2'h3):(1'h0)] >>> wire0[(1'h0):(1'h0)])))
        begin
          reg6 <= (^~($signed({wire0}) ?
              (&($unsigned(wire2) && wire4)) : wire0));
          reg7 <= ((+wire2) << (8'hbb));
        end
      else
        begin
          reg6 <= (7'h42);
          if (wire1[(5'h10):(3'h6)])
            begin
              reg7 <= ((~(wire3 ?
                  reg7 : ((reg7 != wire5) ?
                      wire4[(1'h1):(1'h1)] : $signed(wire0)))) & (8'ha7));
              reg8 <= (((~&$unsigned((wire2 ? (8'hb5) : wire0))) ?
                      wire0 : $unsigned((+(~^(8'hb2))))) ?
                  $signed(({{wire1}, {(8'hae), wire0}} ^ (reg6 ?
                      $unsigned(wire1) : (~&wire2)))) : ($signed({(^wire1),
                          (reg6 ~^ wire5)}) ?
                      ($signed({wire5}) ?
                          (wire5[(4'h8):(2'h3)] ?
                              wire4 : ((7'h44) - wire4)) : (8'ha5)) : (^wire2[(3'h5):(3'h4)])));
              reg9 <= ((^$signed($unsigned($signed((8'ha3))))) ?
                  (~|wire3[(3'h5):(2'h3)]) : (~^({wire4} == $unsigned((wire2 - wire2)))));
            end
          else
            begin
              reg7 <= (wire0 ?
                  $unsigned($signed(wire1[(1'h1):(1'h1)])) : {($unsigned(wire3[(4'h8):(4'h8)]) ?
                          wire3 : {{reg9}, (wire4 != (8'h9d))}),
                      wire2[(1'h0):(1'h0)]});
              reg8 <= wire5[(3'h4):(1'h0)];
              reg9 <= {reg8[(1'h1):(1'h1)]};
              reg10 <= reg6;
              reg11 <= $unsigned($signed($signed(wire5[(4'ha):(3'h4)])));
            end
          reg12 <= (($signed($unsigned((wire0 == reg11))) >= ((~|$unsigned(reg7)) ?
                  wire2 : ((wire5 ? reg7 : wire3) ?
                      (wire5 ? reg6 : wire2) : $signed(reg6)))) ?
              reg10[(4'hb):(4'ha)] : (&($signed((reg10 >> (8'ha6))) == {$unsigned(wire1)})));
          reg13 <= wire0;
          reg14 <= ($unsigned(wire1) && reg6);
        end
      reg15 <= $unsigned({$signed($signed(wire0[(4'ha):(4'h9)])),
          (reg7 == ((|reg9) ^ (wire2 & reg8)))});
    end
  assign wire16 = (wire1 >>> $signed({$signed($unsigned(wire4))}));
  assign wire17 = $signed($signed((~^wire3[(3'h7):(3'h5)])));
  assign wire18 = reg9;
  module19 #() modinst41 (wire40, clk, reg8, wire5, reg6, wire4, wire2);
  always
    @(posedge clk) begin
      reg42 <= $unsigned(reg13[(4'hc):(2'h2)]);
      reg43 <= ($unsigned((wire40[(3'h5):(1'h1)] < reg14[(4'hb):(4'h9)])) > {(((wire0 ?
              wire4 : wire0) >= (wire3 < (8'hbb))) > ({reg7} ?
              (wire4 > wire0) : ((8'ha7) ? reg9 : wire1))),
          ($signed((reg11 - reg10)) ^ $unsigned(reg42))});
      reg44 <= $unsigned(reg13);
      if ($unsigned((($unsigned({(8'h9f), reg9}) ?
          $signed($unsigned(wire0)) : reg8[(2'h2):(1'h0)]) != wire5[(4'hf):(4'hf)])))
        begin
          reg45 <= $signed($signed($signed(wire2)));
        end
      else
        begin
          reg45 <= wire4[(2'h3):(1'h1)];
          reg46 <= wire5;
          reg47 <= {wire16[(1'h1):(1'h0)]};
          reg48 <= $unsigned((&reg47));
          reg49 <= $unsigned((^{wire0[(1'h1):(1'h0)]}));
        end
      reg50 <= (wire18[(4'ha):(3'h7)] ?
          (((!(-wire18)) ? {$signed(wire1)} : $signed(wire5[(5'h11):(3'h6)])) ?
              reg10[(3'h6):(3'h4)] : ((!$unsigned((8'ha0))) ~^ wire1)) : $signed((~|$unsigned($signed(wire4)))));
    end
  assign wire51 = ((({reg13} ?
                          (((8'hbd) ?
                              reg12 : wire17) != $unsigned(reg46)) : reg12) && (~&(!(wire4 + wire40)))) ?
                      ($signed(($unsigned(wire1) ?
                          wire5[(5'h11):(4'h9)] : (^~reg7))) > reg49) : (reg7[(1'h0):(1'h0)] <= ($unsigned(reg7[(3'h5):(2'h2)]) ?
                          (^~(reg13 < reg6)) : ((-wire2) ?
                              $signed(reg46) : wire18))));
  assign wire52 = $unsigned({((-(wire40 >> reg47)) + reg10[(5'h10):(5'h10)]),
                      $signed($signed((reg15 ^ reg13)))});
  assign wire53 = reg8[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg54 <= wire18;
      if ($unsigned((8'hb5)))
        begin
          reg55 <= ((reg54[(1'h1):(1'h0)] || $unsigned(reg9)) ?
              reg46[(3'h4):(2'h2)] : $signed((((reg10 & wire17) > {(8'hb8),
                  (8'haa)}) || ((wire5 ? (8'hb3) : reg7) != reg13))));
        end
      else
        begin
          reg55 <= $unsigned((reg15[(1'h1):(1'h1)] ?
              wire52[(2'h2):(1'h0)] : (((reg12 > (8'haa)) ?
                  reg13[(4'ha):(3'h4)] : wire0) <= reg54)));
          reg56 <= $unsigned(reg54);
          reg57 <= ({(((reg6 != wire1) ?
                      (reg10 ? (7'h44) : reg7) : $unsigned(reg56)) ?
                  $unsigned(reg42) : (wire2[(2'h3):(1'h1)] ?
                      (8'hab) : $unsigned(wire40))),
              ($signed($unsigned(reg11)) ?
                  wire40 : ($unsigned(reg42) ?
                      reg43[(4'ha):(4'h8)] : $signed(reg8)))} && $signed(reg50[(2'h2):(1'h1)]));
          if (reg44[(2'h2):(1'h0)])
            begin
              reg58 <= (reg8 ~^ wire40);
              reg59 <= ((wire4[(3'h5):(2'h2)] * ((reg57[(1'h1):(1'h1)] ?
                      (-reg54) : wire4[(3'h7):(3'h4)]) ^~ (-reg6[(4'h8):(3'h7)]))) ?
                  reg48 : ($unsigned(reg55[(1'h1):(1'h1)]) > ($signed(((8'h9c) ?
                      (8'ha9) : reg43)) <= $unsigned((8'hbc)))));
              reg60 <= (8'hae);
              reg61 <= (($signed(((reg14 * (8'ha2)) ?
                      (^~reg11) : (reg14 << (8'h9d)))) | (7'h41)) ?
                  ($unsigned((((8'haf) ? reg13 : reg50) ?
                          (!wire3) : $signed(reg54))) ?
                      $unsigned(((reg55 >>> (8'ha7)) ?
                          ((8'hae) >>> reg9) : (^~wire1))) : $signed($signed(wire18))) : ($signed(((reg10 ^~ reg59) ?
                      (reg46 - wire53) : $unsigned(reg58))) > reg56));
              reg62 <= $signed((&(reg10 ? reg54 : $signed($signed((8'hae))))));
            end
          else
            begin
              reg58 <= (reg15 | reg48[(2'h3):(1'h1)]);
              reg59 <= {$unsigned((^(!$unsigned(reg49)))),
                  ((reg62[(2'h3):(2'h2)] != $unsigned(reg11)) ?
                      (&((wire4 || wire51) ?
                          (wire4 ^~ reg12) : $unsigned(reg6))) : ((~|(^~reg43)) ^ wire1[(4'hb):(2'h3)]))};
            end
          if (reg45[(3'h5):(1'h0)])
            begin
              reg63 <= ((!$unsigned(($unsigned(reg10) ^~ wire18))) ?
                  reg15[(2'h2):(1'h0)] : (reg13 ^~ wire3));
              reg64 <= ($signed((7'h44)) <<< (reg6[(4'h9):(4'h9)] ~^ reg60));
            end
          else
            begin
              reg63 <= {(!($signed((-wire16)) ?
                      (wire40[(3'h5):(3'h5)] - (reg7 ?
                          reg54 : (8'hb5))) : reg13[(1'h0):(1'h0)]))};
              reg64 <= ((8'ha5) != ($signed(wire1) >>> (~^{$signed((8'hbc))})));
              reg65 <= (wire5 ~^ reg63);
              reg66 <= ({reg15} ?
                  (reg14 == $signed(({reg60,
                      (8'h9c)} <= {reg48}))) : {(~^(8'haa)), $signed(reg10)});
            end
        end
    end
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire26,
                 wire25,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire25 = wire21[(1'h0):(1'h0)];
  assign wire26 = (^$signed(wire21[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg27 <= wire20;
      if (wire21)
        begin
          reg28 <= (8'h9c);
        end
      else
        begin
          reg28 <= wire23[(2'h2):(2'h2)];
          reg29 <= $signed(({$unsigned((~^wire26))} ?
              (wire23 * $unsigned(wire21)) : wire24));
          reg30 <= (wire25 ?
              ($unsigned((~&$unsigned(wire25))) >>> ($signed((^wire20)) == $signed($signed((8'hab))))) : reg29[(4'hb):(3'h6)]);
          reg31 <= reg27;
        end
      reg32 <= $signed($signed($signed($unsigned(wire22))));
      reg33 <= ($signed(reg31[(2'h3):(2'h3)]) << wire25);
    end
  assign wire34 = (&$unsigned({(reg28[(4'ha):(4'ha)] >>> reg33)}));
  assign wire35 = ((wire20[(4'he):(3'h7)] ?
                          ({(reg28 ? reg32 : reg30)} ?
                              (~|(reg32 ?
                                  (8'h9f) : reg30)) : {reg29[(4'hc):(4'h8)],
                                  (reg29 ^~ wire25)}) : wire22[(4'h8):(2'h2)]) ?
                      wire34[(4'h9):(4'h8)] : (((wire20[(4'hd):(3'h4)] ?
                              (reg33 >= reg28) : $signed(wire20)) + wire20) ?
                          {({(8'hb5), wire20} ? reg28[(1'h1):(1'h0)] : wire22),
                              $signed(wire22[(2'h3):(2'h3)])} : {($unsigned(reg30) ?
                                  wire34 : (reg33 < wire34))}));
  assign wire36 = (wire26[(1'h1):(1'h1)] >>> reg31);
  assign wire37 = wire36;
  assign wire38 = ((^~(wire34[(2'h2):(2'h2)] ? reg28 : wire36)) ?
                      $signed({$unsigned({wire25})}) : reg28);
  assign wire39 = $signed((($signed(wire23) ?
                          (~|$signed(reg32)) : (+wire35[(3'h7):(3'h5)])) ?
                      (^$unsigned(((8'hbc) ?
                          (8'had) : wire22))) : (($unsigned(wire37) & reg33) ?
                          (wire37[(2'h3):(1'h1)] ?
                              wire36[(3'h4):(2'h2)] : $signed(reg31)) : $unsigned((^reg30)))));
endmodule
