module top
#(parameter param85 = {(!(((~&(7'h40)) ^ ((7'h44) < (8'ha4))) + {{(8'h9f)}}))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire47;
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  assign y = {wire84,
                 wire82,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
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
                 reg55,
                 reg56,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire1[(4'hb):(4'hb)]);
      reg5 <= (~&(8'hb2));
      reg6 <= reg5;
      if (reg4[(1'h1):(1'h0)])
        begin
          reg7 <= ($unsigned(reg5[(4'h8):(3'h7)]) ?
              ({((!reg5) ? (+wire1) : (wire0 + wire2))} ?
                  $signed(wire1[(3'h6):(3'h6)]) : wire2[(4'h9):(1'h1)]) : wire2);
        end
      else
        begin
          reg7 <= wire0;
          reg8 <= (7'h41);
          reg9 <= reg8[(2'h3):(2'h3)];
          reg10 <= $unsigned(({{$unsigned(reg4)}} ?
              $unsigned((8'ha8)) : $signed((8'hb3))));
          reg11 <= reg4[(2'h3):(2'h2)];
        end
      if ($unsigned(wire3[(4'h8):(3'h5)]))
        begin
          reg12 <= $signed(reg9[(3'h6):(2'h2)]);
        end
      else
        begin
          if ((~$unsigned(((~^{reg4,
              wire2}) - (reg12[(3'h7):(3'h4)] - $unsigned(reg5))))))
            begin
              reg12 <= reg9;
              reg13 <= reg11[(5'h13):(4'he)];
              reg14 <= reg11[(2'h2):(2'h2)];
              reg15 <= {$signed(reg14[(3'h4):(1'h1)])};
              reg16 <= reg4;
            end
          else
            begin
              reg12 <= (($signed(((!reg14) ?
                      reg14[(2'h3):(2'h2)] : $unsigned(reg14))) >>> ((~&(-reg9)) ?
                      reg4 : {reg4, reg10})) ?
                  $signed((wire1 <<< {{reg8,
                          reg15}})) : (($signed($signed(reg8)) << reg15[(4'hc):(4'h9)]) >> {(!(reg14 ?
                          reg4 : reg4))}));
              reg13 <= $unsigned((+((~&(reg13 < wire0)) | ($signed(wire3) ?
                  (wire1 ? reg16 : (8'h9e)) : wire1[(1'h0):(1'h0)]))));
              reg14 <= $signed($unsigned(((~((8'ha2) < wire3)) >>> (reg15[(3'h6):(3'h5)] != $signed(reg6)))));
            end
        end
    end
  module17 #() modinst48 (wire47, clk, reg12, reg7, reg13, wire3);
  assign wire49 = reg16[(1'h1):(1'h0)];
  assign wire50 = (reg11 ^ (reg11 ?
                      $unsigned(((reg15 * reg7) ?
                          $signed((8'h9e)) : reg10)) : wire3[(3'h5):(3'h5)]));
  assign wire51 = $signed($unsigned((reg14[(1'h1):(1'h0)] ?
                      (~^reg11) : {$unsigned((8'ha3))})));
  assign wire52 = ((8'hb5) || (($signed({reg9}) ^ ((reg6 ? reg11 : wire49) ?
                      (~|wire47) : wire3)) <= (!reg14)));
  assign wire53 = reg15[(4'h9):(2'h3)];
  assign wire54 = ($unsigned($signed($unsigned(wire52[(2'h3):(2'h2)]))) >> ((&{$signed(wire51),
                          (^~reg4)}) ?
                      ({(-reg16)} + ((wire2 ? reg15 : wire47) ?
                          reg13 : reg10[(4'h9):(1'h0)])) : (~|((wire0 ?
                          reg16 : wire53) <<< $unsigned((8'hb1))))));
  always
    @(posedge clk) begin
      reg55 <= (^((!($unsigned(reg6) >>> reg6)) <<< {$unsigned(reg16)}));
      reg56 <= wire47;
    end
  assign wire57 = $unsigned((((&{reg14}) ?
                      $unsigned(reg14) : ($unsigned((8'ha4)) ?
                          reg8 : $signed(reg7))) || ((!$signed((8'ha9))) ?
                      wire51 : (+wire52))));
  module58 #() modinst83 (wire82, clk, wire1, reg10, reg14, reg12, wire0);
  assign wire84 = $signed($unsigned(wire54));
endmodule

module module58
#(parameter param80 = (|({{{(8'hb7), (8'ha5)}, ((8'hac) ? (7'h42) : (8'h9d))}, (-{(8'hb5)})} ? {((^(8'hba)) ? {(8'hb1)} : (&(8'ha0))), (&{(7'h42), (7'h42)})} : {(((8'hbf) >> (8'hb2)) || ((8'ha3) >>> (8'hac)))})), 
parameter param81 = (param80 ^ (8'hb7)))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire63;
  input wire [(5'h11):(1'h0)] wire62;
  input wire [(5'h12):(1'h0)] wire61;
  input wire signed [(5'h12):(1'h0)] wire60;
  input wire signed [(5'h10):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire66,
                 wire65,
                 wire64,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire64 = (wire63[(3'h5):(1'h0)] ?
                      ($unsigned({(^~(8'ha8)), (wire60 ~^ (8'hbc))}) ?
                          wire63[(2'h3):(2'h2)] : (wire62[(4'h9):(3'h4)] ?
                              (^wire59) : ($unsigned(wire60) ?
                                  $unsigned(wire62) : wire63[(1'h1):(1'h1)]))) : {$unsigned(wire60),
                          (|$unsigned(wire59[(3'h6):(2'h3)]))});
  assign wire65 = (+(+(^wire60)));
  assign wire66 = $signed((~|wire64));
  always
    @(posedge clk) begin
      if (wire63)
        begin
          reg67 <= (~|(^~$unsigned(wire59)));
          reg68 <= (wire65[(1'h1):(1'h0)] || wire65);
          reg69 <= ({$signed(($signed(wire66) - wire64[(3'h7):(1'h0)])),
              (7'h42)} >> ((&(wire60[(4'h9):(4'h9)] >>> {wire61})) && $unsigned(($signed(wire61) ?
              (+(8'h9c)) : (^~reg68)))));
          if ($unsigned(reg67))
            begin
              reg70 <= $signed(wire65);
            end
          else
            begin
              reg70 <= $signed(({(wire59[(1'h1):(1'h0)] ^ reg69[(5'h15):(1'h1)])} ?
                  (!($signed(wire62) == (~&reg69))) : ($unsigned((wire62 ?
                      wire59 : wire59)) & ($signed((8'hae)) + $unsigned(reg67)))));
              reg71 <= reg68[(3'h5):(3'h5)];
              reg72 <= $signed(((wire65 >> (wire64 ?
                  reg70[(4'hb):(3'h4)] : (wire59 << (8'had)))) | ($unsigned(wire61[(4'hc):(3'h6)]) ?
                  $unsigned($unsigned(reg71)) : $unsigned((|wire59)))));
            end
          reg73 <= wire60;
        end
      else
        begin
          reg67 <= $unsigned($unsigned((($signed(wire60) <= wire66[(3'h5):(2'h3)]) << $unsigned(reg72))));
          reg68 <= (8'hbd);
          reg69 <= (|(({(&wire63), reg67} >= (reg73 - reg67[(1'h0):(1'h0)])) ?
              ($unsigned(wire65[(2'h2):(2'h2)]) ?
                  (-(reg68 ?
                      wire62 : reg70)) : $unsigned(reg73)) : ($signed($signed(reg67)) >>> $signed((reg69 ?
                  (8'ha6) : wire62)))));
        end
      reg74 <= ((({((8'ha8) + (8'ha9)), wire59} || reg69[(5'h14):(4'h8)]) ?
              $signed((~&$unsigned(wire61))) : (~^({(8'ha5),
                  wire59} < reg69[(5'h13):(4'h9)]))) ?
          ((($unsigned(wire61) >= (reg70 ? reg73 : wire66)) ?
                  $signed((wire59 ?
                      wire65 : (8'hac))) : ($unsigned(reg69) || (reg72 ?
                      wire66 : wire66))) ?
              reg69[(5'h15):(5'h11)] : ($unsigned($unsigned(wire66)) > $unsigned((wire62 ?
                  wire63 : (8'hbb))))) : reg69);
    end
  assign wire75 = {wire63,
                      $unsigned(($unsigned($signed(reg69)) ?
                          $signed((reg69 ?
                              wire64 : reg68)) : $unsigned((-wire59))))};
  assign wire76 = reg74;
  assign wire77 = ({(((wire60 ? wire75 : wire61) ? $signed(wire60) : {wire76}) ?
                              {$unsigned(reg71)} : (&reg74[(4'hb):(4'hb)]))} ?
                      ({$unsigned($unsigned(reg68)), (^reg68[(3'h6):(1'h1)])} ?
                          (~&(^(8'had))) : wire62) : $unsigned((~^$unsigned($signed((8'hb7))))));
  assign wire78 = (((^$unsigned($unsigned(reg67))) ^ reg74[(5'h11):(4'ha)]) ?
                      (($unsigned(reg72) ?
                          reg70[(4'hb):(4'hb)] : ($unsigned(wire59) ?
                              wire63 : $unsigned((8'haa)))) >> (((reg69 ?
                                  (8'ha5) : reg67) ?
                              wire59[(3'h7):(3'h5)] : (8'ha3)) ?
                          $unsigned({wire65,
                              wire61}) : wire76[(3'h5):(3'h5)])) : $unsigned(wire59));
  assign wire79 = ((!wire76[(3'h4):(3'h4)]) << $unsigned(reg70));
endmodule

module module17
#(parameter param45 = (~&(8'hb2)), 
parameter param46 = (param45 ? (8'h9e) : param45))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire [(5'h11):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire22;
  assign y = {wire44, wire43, wire42, wire40, wire22, (1'h0)};
  assign wire22 = $unsigned($unsigned({($signed(wire18) ? (8'ha4) : (~&wire19)),
                      $signed((wire21 ? wire19 : wire18))}));
  module23 #() modinst41 (wire40, clk, wire21, wire19, wire18, wire22);
  assign wire42 = wire20;
  assign wire43 = ((+wire18[(4'hb):(4'h8)]) ?
                      wire20[(2'h3):(2'h3)] : $signed({$unsigned((wire40 ^ wire20))}));
  assign wire44 = $signed((wire18 | $signed((wire18[(3'h7):(2'h2)] ?
                      {wire19, wire43} : $unsigned(wire43)))));
endmodule

module module23
#(parameter param39 = ({((((8'hb7) < (8'hb7)) ? ((8'had) ? (8'ha6) : (8'hb5)) : ((8'h9d) ^ (8'hbb))) ? (((8'hac) ? (8'haa) : (7'h42)) ? ((8'h9c) & (8'h9e)) : ((8'h9f) >> (8'h9c))) : (((8'hb6) == (8'ha8)) ~^ {(8'hb5)})), (8'hab)} >> (+{(!{(8'hb7)}), (((8'h9d) ? (8'h9f) : (8'h9c)) >> ((8'ha6) ? (8'hbd) : (8'hbe)))})))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire [(3'h7):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire28;
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire28,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire28 = $unsigned($unsigned((({wire24,
                          wire26} - wire25[(1'h1):(1'h1)]) ?
                      $unsigned((-wire24)) : $signed((wire26 ?
                          wire26 : (8'h9d))))));
  always
    @(posedge clk) begin
      if ((~wire26))
        begin
          reg29 <= (wire27 > ($signed((wire27 >> (wire26 != wire27))) ?
              $unsigned((wire27 && wire28)) : (8'ha9)));
          reg30 <= ((~|$unsigned((wire27 + (wire25 ? (8'hbd) : (8'ha0))))) ?
              $unsigned(wire25) : (&((|wire25) + (^~(wire28 & wire25)))));
          reg31 <= $unsigned($signed({$unsigned($unsigned(wire28)),
              $unsigned(wire25[(1'h1):(1'h0)])}));
          reg32 <= $unsigned($unsigned({(8'hb3)}));
        end
      else
        begin
          if (reg30)
            begin
              reg29 <= (^~reg32);
              reg30 <= $unsigned($signed($unsigned(wire28[(3'h5):(2'h2)])));
              reg31 <= $unsigned(wire24[(3'h6):(2'h3)]);
              reg32 <= ($unsigned(reg29[(3'h7):(2'h2)]) ?
                  ($signed((wire28[(4'hb):(1'h0)] ?
                          $signed((8'h9c)) : (+wire27))) ?
                      {(reg30[(1'h1):(1'h0)] ?
                              wire24[(3'h7):(1'h1)] : $signed((8'hab)))} : $unsigned(($unsigned(wire28) ?
                          reg32 : wire27[(3'h4):(1'h0)]))) : ((8'hb2) ?
                      (wire28[(4'hb):(4'h8)] ?
                          ((wire24 & reg32) + ((8'hb1) ?
                              reg29 : wire27)) : ((reg29 ?
                              wire27 : (8'h9c)) & $unsigned(reg31))) : (^~(-wire26[(3'h7):(3'h6)]))));
            end
          else
            begin
              reg29 <= ($signed(wire26) ^ (^~$signed($signed({(7'h43),
                  wire24}))));
              reg30 <= $signed($signed(wire26[(3'h6):(1'h0)]));
              reg31 <= (((((wire24 > wire25) ?
                      (wire24 & wire27) : (!wire27)) + $signed((reg31 ?
                      wire26 : reg29))) ?
                  {$unsigned(wire27),
                      $unsigned(reg30[(1'h1):(1'h1)])} : wire27[(3'h4):(2'h2)]) >= wire24);
            end
        end
      reg33 <= wire25[(1'h0):(1'h0)];
      reg34 <= $signed(reg29[(3'h6):(2'h3)]);
    end
  assign wire35 = reg31;
  assign wire36 = {wire27[(4'hb):(3'h5)], (reg30[(2'h2):(2'h2)] != reg34)};
  assign wire37 = $unsigned($unsigned((((reg34 ? reg32 : (8'h9c)) ?
                          (!wire36) : {wire24, wire27}) ?
                      (8'hb8) : $signed($signed(wire26)))));
  assign wire38 = (8'hb2);
endmodule
