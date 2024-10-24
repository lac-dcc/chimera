module top
#(parameter param71 = {{((+((8'hbf) ? (8'had) : (8'hbb))) < (!((8'ha5) ? (8'hbe) : (8'hae))))}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire47;
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire70,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 reg69,
                 reg68,
                 reg67,
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
                 reg53,
                 reg52,
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
      reg4 <= ((((^{(7'h41)}) ?
          $signed(wire0) : wire0[(4'h8):(2'h2)]) || $signed(wire2)) <= $signed((wire2 == wire2[(2'h3):(2'h3)])));
      if (wire1)
        begin
          reg5 <= $unsigned($unsigned((7'h41)));
        end
      else
        begin
          if (({$unsigned((-wire0))} & wire2))
            begin
              reg5 <= reg5;
              reg6 <= $unsigned(reg5);
              reg7 <= wire0[(3'h6):(2'h2)];
            end
          else
            begin
              reg5 <= {$signed($unsigned({wire1[(1'h0):(1'h0)]})),
                  wire2[(2'h3):(1'h1)]};
              reg6 <= $signed(reg5);
              reg7 <= {{reg7}, $unsigned(reg4[(1'h0):(1'h0)])};
              reg8 <= ($signed($unsigned(((+wire0) ?
                  $unsigned(reg4) : (reg4 + wire2)))) < $signed(($signed((reg6 ?
                  reg4 : reg6)) <= wire0[(3'h7):(3'h4)])));
              reg9 <= reg8;
            end
          if ((~^reg5))
            begin
              reg10 <= (~&wire0);
              reg11 <= wire1;
              reg12 <= (reg5[(3'h7):(2'h3)] > $unsigned((+((wire0 ^~ reg7) << reg5[(2'h2):(1'h0)]))));
              reg13 <= ($signed((reg6[(3'h4):(3'h4)] ?
                  (reg4 ^~ (reg12 ? wire2 : reg7)) : (wire3[(1'h0):(1'h0)] ?
                      $unsigned(reg6) : wire3[(1'h1):(1'h1)]))) & ($signed((+$signed(reg12))) || wire2));
              reg14 <= (8'ha9);
            end
          else
            begin
              reg10 <= reg11[(3'h4):(1'h0)];
              reg11 <= {$signed((reg5[(3'h6):(3'h6)] == $unsigned((~(8'h9f))))),
                  $signed(wire3)};
            end
          reg15 <= (reg11[(2'h2):(1'h0)] ?
              $unsigned(wire3) : (wire3[(1'h0):(1'h0)] >>> (reg8[(2'h2):(2'h2)] ?
                  $signed(reg5[(4'h8):(2'h2)]) : (((8'ha5) == reg12) ?
                      (reg9 + reg10) : {(8'h9f), reg9}))));
          if ($unsigned(reg14[(3'h5):(2'h3)]))
            begin
              reg16 <= reg10[(2'h2):(1'h1)];
              reg17 <= $unsigned($signed((7'h44)));
              reg18 <= $signed((reg7 ?
                  reg11[(4'h9):(3'h5)] : {$signed(((8'hb3) <<< wire3)),
                      (|reg12[(2'h2):(1'h1)])}));
              reg19 <= (&$signed(reg15));
            end
          else
            begin
              reg16 <= $unsigned(({$unsigned(reg8)} ?
                  $signed(((^~reg18) ?
                      (reg13 ?
                          reg13 : reg14) : (reg14 == (8'h9e)))) : reg9[(4'h8):(1'h0)]));
              reg17 <= $unsigned(($signed(reg17) <= (reg9 >> (wire0[(4'hf):(1'h1)] ?
                  reg7 : (^reg11)))));
            end
        end
    end
  module20 #() modinst48 (.wire22(reg16), .wire25(reg18), .clk(clk), .wire23(reg11), .wire21(wire1), .y(wire47), .wire24(reg9));
  assign wire49 = {(8'hb8)};
  assign wire50 = (($signed($signed((~|wire1))) >> $unsigned({wire3[(2'h2):(1'h0)]})) >= wire3[(1'h1):(1'h0)]);
  assign wire51 = reg9;
  always
    @(posedge clk) begin
      reg52 <= reg10;
      reg53 <= $signed($signed((reg4[(4'hc):(3'h6)] ?
          ($signed(reg11) ? reg17 : $signed(reg15)) : $signed((reg15 ?
              reg13 : wire0)))));
      reg54 <= wire2;
    end
  always
    @(posedge clk) begin
      if (reg54[(3'h4):(1'h1)])
        begin
          if (($signed($signed((reg53[(4'he):(4'hc)] ?
                  (^reg53) : $unsigned(reg18)))) ?
              $signed({reg14[(3'h6):(3'h4)], $signed({reg4, reg19})}) : reg8))
            begin
              reg55 <= $unsigned($signed((($signed(reg8) ?
                      $signed(wire1) : (^~reg9)) ?
                  $unsigned((reg15 ? reg11 : (8'hb5))) : (reg15 ?
                      $unsigned(wire49) : wire0))));
              reg56 <= reg9[(4'h9):(1'h0)];
              reg57 <= $signed(reg7);
              reg58 <= reg4;
            end
          else
            begin
              reg55 <= $unsigned($signed($unsigned($unsigned($unsigned(reg56)))));
              reg56 <= ({reg54[(1'h1):(1'h0)],
                  reg58} == $signed((^$signed((reg5 & reg13)))));
              reg57 <= reg17;
              reg58 <= {(($unsigned((reg4 ? reg18 : wire50)) ?
                      reg14 : reg11) < ($signed($signed(reg13)) ?
                      {wire3, $unsigned(wire0)} : (~&$unsigned(reg11))))};
            end
          reg59 <= $unsigned($unsigned($signed(reg57[(2'h3):(2'h3)])));
          reg60 <= (8'hbb);
          reg61 <= $unsigned(wire2[(1'h0):(1'h0)]);
          reg62 <= (($signed(({reg16} ? {reg11} : wire2)) ?
                  (!reg14[(3'h6):(1'h0)]) : $unsigned($signed(reg14))) ?
              reg11[(4'hf):(2'h2)] : ($unsigned($unsigned((8'ha3))) ?
                  $unsigned(reg11) : wire50));
        end
      else
        begin
          if ((8'hb9))
            begin
              reg55 <= (~|$signed((|reg9[(2'h2):(1'h1)])));
              reg56 <= wire2;
              reg57 <= (~|({((wire49 ~^ reg8) ?
                      $unsigned(reg53) : (wire50 * reg7)),
                  reg15[(2'h2):(2'h2)]} >= (~&$signed(reg6))));
            end
          else
            begin
              reg55 <= (8'ha6);
              reg56 <= wire2[(1'h0):(1'h0)];
              reg57 <= $unsigned((wire47[(4'h9):(2'h2)] ?
                  {((reg10 ? (8'h9e) : (8'h9f)) ?
                          ((8'hbc) > reg9) : (reg10 >> reg14)),
                      $signed(((8'h9e) | wire50))} : (8'hb8)));
              reg58 <= reg10[(3'h4):(1'h0)];
            end
          if (reg57[(1'h0):(1'h0)])
            begin
              reg59 <= (wire51[(3'h5):(3'h5)] >> reg59[(1'h1):(1'h1)]);
              reg60 <= ($unsigned((reg15 <= (^(wire0 ~^ wire50)))) ?
                  ((^$signed($signed((8'ha2)))) ?
                      (^($unsigned((8'ha2)) ?
                          reg9 : $signed(reg12))) : {$unsigned($unsigned(reg15))}) : wire49);
            end
          else
            begin
              reg59 <= $unsigned(((~|(wire49 && reg58)) ?
                  wire0 : (-(&(reg6 <<< reg8)))));
            end
          if (reg8[(2'h2):(1'h0)])
            begin
              reg61 <= ((($unsigned($unsigned((8'hbc))) ?
                      ($unsigned(reg53) ?
                          $unsigned(wire47) : $signed(reg55)) : reg8[(2'h3):(1'h0)]) ?
                  {(~|(reg13 < reg5))} : (^~$signed($unsigned(reg52)))) ^~ reg15[(2'h2):(1'h0)]);
              reg62 <= (!$signed(reg61[(1'h0):(1'h0)]));
              reg63 <= ((8'hbf) ?
                  (reg11[(5'h14):(1'h0)] ?
                      (reg18 ?
                          (|$unsigned((8'hab))) : ($signed(reg55) ?
                              $signed(wire2) : (wire3 != reg54))) : (((^~(8'ha8)) >> reg6) ?
                          $signed((wire3 ?
                              (8'hb4) : reg54)) : $unsigned({wire50,
                              reg4}))) : $signed(reg60[(2'h3):(2'h2)]));
              reg64 <= reg52;
              reg65 <= $signed($unsigned($unsigned(((8'had) ?
                  (-(8'hab)) : (reg7 != reg15)))));
            end
          else
            begin
              reg61 <= (~|$unsigned(($signed((reg59 ?
                  reg62 : reg6)) * $unsigned(reg55))));
              reg62 <= $unsigned(({((8'hb0) ?
                      (reg16 ?
                          wire2 : wire0) : (reg10 ~^ reg59))} > $signed((reg19[(4'ha):(3'h5)] <<< reg15))));
              reg63 <= $signed((($unsigned($unsigned((8'hbb))) << {$unsigned(wire47)}) <= $signed(($unsigned((7'h43)) ?
                  reg4 : (reg65 ? reg61 : reg6)))));
              reg64 <= wire2[(2'h2):(1'h1)];
            end
        end
      reg66 <= (|(+reg59[(2'h2):(1'h0)]));
      reg67 <= $signed((!(!wire2)));
      reg68 <= $signed((($signed(reg17[(2'h3):(2'h2)]) <= ((8'hab) & (!(8'ha2)))) + {((7'h42) ?
              $unsigned(reg54) : (8'ha8)),
          wire0}));
      reg69 <= $signed((((wire3[(2'h2):(2'h2)] ?
              {reg67, reg63} : (reg6 ~^ (8'hb3))) | $unsigned({reg19,
              wire51})) ?
          {reg10,
              (reg56[(1'h1):(1'h1)] || ((8'hb0) ?
                  reg11 : reg52))} : reg10[(3'h4):(1'h1)]));
    end
  assign wire70 = $signed($signed(reg68));
endmodule

module module20
#(parameter param46 = (~&((&((^(8'ha1)) ^ ((8'hba) ? (8'hba) : (8'hab)))) ? ({(~^(8'hbc))} ^~ (8'h9e)) : ((-((7'h44) ? (8'hb4) : (8'haf))) ? ((|(7'h44)) >= ((8'hb1) ? (8'hab) : (8'hb4))) : ((^~(8'hbd)) ? ((8'h9f) ? (8'ha6) : (8'h9f)) : ((8'hb9) ? (8'hb7) : (8'h9e)))))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire23;
  input wire [(4'hc):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire45,
                 wire40,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
                 (1'h0)};
  assign wire26 = {wire21[(3'h5):(1'h0)]};
  assign wire27 = wire22[(3'h6):(2'h2)];
  assign wire28 = (~^$unsigned((({wire26} == (wire24 ? (8'hbe) : wire26)) ?
                      ((8'ha9) ?
                          wire26[(3'h4):(2'h3)] : (wire25 ?
                              wire27 : (8'hbe))) : (8'hb1))));
  assign wire29 = {$signed($unsigned((((8'hb3) ? wire28 : wire28) ^ wire22)))};
  always
    @(posedge clk) begin
      reg30 <= $signed((~(((!wire24) >= (wire23 ?
          wire26 : wire29)) <= wire21[(2'h2):(2'h2)])));
      reg31 <= (!$signed($unsigned($signed(wire22[(3'h6):(2'h3)]))));
      reg32 <= wire22[(2'h2):(1'h1)];
      reg33 <= ((({(reg30 >= reg30)} != ((^~wire28) == {reg32})) ?
              $unsigned((wire27 && (wire25 << reg32))) : wire26[(1'h1):(1'h0)]) ?
          (8'ha5) : ((8'ha1) ? wire23[(1'h0):(1'h0)] : $signed(wire23)));
      reg34 <= (wire29[(1'h0):(1'h0)] >> reg31);
    end
  always
    @(posedge clk) begin
      reg35 <= $unsigned(({$unsigned((|wire24))} ?
          wire25[(5'h11):(5'h11)] : $unsigned($signed($unsigned(wire24)))));
      reg36 <= $signed({reg33, $unsigned((|$unsigned(wire28)))});
    end
  always
    @(posedge clk) begin
      reg37 <= (wire23[(4'hc):(4'ha)] <= (wire26[(1'h1):(1'h1)] ~^ wire26));
      reg38 <= ($signed((~^$signed(wire28))) ?
          reg32 : (|{((wire21 << (7'h43)) >> {reg31, wire29}),
              $signed(reg34[(1'h0):(1'h0)])}));
      reg39 <= wire22[(3'h5):(3'h5)];
    end
  assign wire40 = $unsigned($signed(wire26));
  always
    @(posedge clk) begin
      reg41 <= ($signed(((~|(wire26 ? wire26 : wire22)) ?
              ($signed(wire27) ?
                  (reg39 ?
                      reg31 : wire40) : $unsigned(wire21)) : ((reg34 < reg38) - $unsigned(wire25)))) ?
          ($signed((~$unsigned(wire26))) ?
              $signed(((reg39 ? wire25 : wire23) ?
                  $unsigned(reg30) : $signed(reg37))) : {(-(wire40 ?
                      reg33 : (8'ha6))),
                  reg35}) : (((wire27[(1'h0):(1'h0)] ?
                      $signed(wire26) : $unsigned((7'h40))) ?
                  wire21[(3'h6):(2'h3)] : $unsigned(wire26)) ?
              ((8'hb5) ?
                  $unsigned((~reg36)) : ($unsigned(wire24) != (&reg30))) : $unsigned($signed($signed(reg33)))));
      reg42 <= wire40[(1'h1):(1'h1)];
      reg43 <= wire22;
      reg44 <= $signed((8'h9e));
    end
  assign wire45 = ({(wire22[(1'h0):(1'h0)] ?
                              $unsigned(reg37) : (reg33 ?
                                  reg34 : {reg41, reg35}))} ?
                      (((-wire28) - wire27[(4'hb):(2'h2)]) == $unsigned(reg36[(2'h3):(1'h0)])) : (~&(($unsigned(wire29) ?
                          (wire25 >> reg36) : $signed((8'hbb))) + $signed(wire29))));
endmodule
