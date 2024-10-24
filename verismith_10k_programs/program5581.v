module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h212):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  assign y = {wire64,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire16,
                 wire15,
                 reg4,
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
                 reg17,
                 reg18,
                 reg19,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0[(4'h8):(3'h6)];
      if ((~^wire2))
        begin
          reg5 <= ((8'hb7) == (({{(7'h40), wire3}} ?
              ($unsigned(reg4) != $signed((8'hb0))) : $unsigned(wire0[(3'h6):(3'h6)])) * ((|wire0) ?
              wire2 : ($unsigned(wire1) ? wire2 : wire3[(4'h9):(3'h5)]))));
          if ((((8'ha0) & ((((8'hb6) >>> reg4) ?
                  wire0[(4'he):(3'h4)] : $signed((8'ha5))) <<< wire0[(4'h8):(2'h2)])) ?
              (wire1[(2'h2):(1'h1)] && wire0[(4'h9):(2'h3)]) : reg5[(4'hd):(4'ha)]))
            begin
              reg6 <= $signed(($signed($signed($signed(wire0))) ?
                  ($unsigned({wire2, wire2}) ?
                      (8'ha1) : (!(wire1 ? wire0 : (8'ha5)))) : wire1));
              reg7 <= wire1[(1'h0):(1'h0)];
              reg8 <= wire0[(2'h2):(1'h0)];
            end
          else
            begin
              reg6 <= wire3[(2'h2):(1'h1)];
              reg7 <= $unsigned((|$signed(reg5[(1'h1):(1'h0)])));
            end
          if ({((+$unsigned({wire3})) + (~|((&reg5) >>> (8'ha9))))})
            begin
              reg9 <= (^~({$unsigned($unsigned(reg4)), (wire2 - (^~(7'h44)))} ?
                  (~&((reg8 <<< reg8) ?
                      ((8'h9d) ?
                          wire2 : reg7) : ((8'ha3) == wire2))) : $signed(reg5[(3'h4):(1'h0)])));
              reg10 <= (~|reg4[(4'ha):(1'h0)]);
              reg11 <= $unsigned((($unsigned((~reg6)) >> (-(|(8'hb3)))) ^ ({reg7} ?
                  (~^$unsigned(reg9)) : $unsigned($unsigned(reg8)))));
            end
          else
            begin
              reg9 <= (8'hab);
              reg10 <= $unsigned(reg6);
              reg11 <= (wire0[(4'h9):(3'h4)] ?
                  ((8'hb6) ?
                      (~&$unsigned($unsigned(wire2))) : {reg9[(2'h2):(1'h1)],
                          ($unsigned(wire2) ?
                              reg11 : (-wire1))}) : $unsigned(($signed(reg5[(4'hc):(4'hb)]) ?
                      ({reg6,
                          reg9} >= $unsigned(reg5)) : ($signed(wire1) - $unsigned(wire0)))));
              reg12 <= ({reg7,
                      (^~((wire0 ? (8'hb3) : wire0) ?
                          (wire0 == reg7) : {reg4, reg4}))} ?
                  reg5[(3'h5):(2'h3)] : $unsigned($signed((((8'hb8) ?
                      wire2 : (8'hb4)) >= $unsigned(reg4)))));
              reg13 <= (reg8 ?
                  $signed($unsigned(wire1[(1'h0):(1'h0)])) : $unsigned(reg5[(2'h3):(1'h1)]));
            end
        end
      else
        begin
          reg5 <= reg4;
          if ($signed(reg8))
            begin
              reg6 <= ($unsigned({$signed((reg5 ? wire3 : reg4)),
                  $signed((reg10 < wire0))}) - wire0[(1'h0):(1'h0)]);
            end
          else
            begin
              reg6 <= (|reg9);
              reg7 <= (~|(&(&(((8'hb7) ? (8'h9e) : reg8) ?
                  {wire1, reg4} : reg5))));
            end
          if ($signed($signed(wire0[(4'he):(4'hc)])))
            begin
              reg8 <= (&reg11);
              reg9 <= (7'h41);
              reg10 <= {$unsigned((+$unsigned((reg10 + wire1))))};
              reg11 <= wire1[(4'hb):(4'ha)];
            end
          else
            begin
              reg8 <= $unsigned({($signed(reg13) - {$unsigned((8'had))}),
                  {reg6, (-(~^reg11))}});
              reg9 <= reg11[(4'hc):(2'h3)];
            end
        end
      reg14 <= reg12[(3'h4):(3'h4)];
    end
  assign wire15 = reg6[(2'h3):(1'h1)];
  assign wire16 = {{(~|wire2[(4'he):(2'h2)]),
                          ((~&reg13[(3'h4):(1'h0)]) & $unsigned($unsigned(reg14)))}};
  always
    @(posedge clk) begin
      reg17 <= reg4;
      reg18 <= $signed((!wire2));
      reg19 <= $signed($unsigned(reg10[(5'h11):(5'h10)]));
    end
  assign wire20 = (~^wire1[(3'h5):(1'h1)]);
  assign wire21 = $unsigned((~&wire0[(2'h2):(1'h1)]));
  assign wire22 = reg8[(1'h0):(1'h0)];
  assign wire23 = $signed($unsigned(reg17));
  always
    @(posedge clk) begin
      reg24 <= ($unsigned(($signed(reg17[(1'h0):(1'h0)]) ?
          {$signed(wire0), reg18} : ((reg17 != (8'ha8)) <<< (wire21 ?
              (8'hb2) : reg5)))) ^ (reg6 ?
          wire3[(3'h5):(3'h5)] : ({$unsigned(wire21)} >= $signed($signed((8'haf))))));
      reg25 <= $unsigned(wire16);
      if (wire23[(1'h1):(1'h0)])
        begin
          reg26 <= wire23[(1'h1):(1'h1)];
          reg27 <= wire2;
          reg28 <= reg12;
          reg29 <= (~$unsigned($signed((~|(wire15 ? reg13 : wire3)))));
          if (wire3)
            begin
              reg30 <= (($unsigned(((reg28 ? reg19 : wire22) >= (8'hbb))) ?
                      $signed(reg26[(1'h0):(1'h0)]) : ((&reg14[(4'h9):(1'h1)]) <<< (8'hbc))) ?
                  {reg18[(2'h2):(2'h2)],
                      {$signed($unsigned(wire2)),
                          $signed({wire22, wire15})}} : reg9[(4'ha):(2'h3)]);
            end
          else
            begin
              reg30 <= (^~(wire3 ?
                  ((reg10 ?
                      (wire22 ?
                          (8'ha9) : (8'ha0)) : (~reg18)) != (wire22 && (reg13 <<< wire16))) : ((reg27 ?
                      (reg30 - reg7) : (^~reg11)) >= reg12[(1'h0):(1'h0)])));
              reg31 <= wire23;
              reg32 <= (+($unsigned((!(reg17 ?
                  wire16 : reg31))) >>> $signed(reg30[(1'h1):(1'h1)])));
            end
        end
      else
        begin
          reg26 <= wire3;
          reg27 <= $signed(($signed($signed($unsigned(reg18))) ?
              {{((8'hba) - (8'ha0))},
                  reg6} : $signed($unsigned($signed(wire22)))));
          reg28 <= ((($signed($unsigned(wire16)) > ($unsigned(reg30) ?
                  (reg32 < reg19) : $signed(reg19))) && $signed($unsigned((~|reg4)))) ?
              reg13 : $signed(reg31[(4'h9):(4'h8)]));
          reg29 <= {{(reg8[(1'h0):(1'h0)] ?
                      $signed({reg28}) : (+(reg25 - reg25)))}};
        end
    end
  always
    @(posedge clk) begin
      reg33 <= reg28[(1'h0):(1'h0)];
    end
  assign wire34 = wire22[(2'h3):(2'h3)];
  assign wire35 = $signed({reg8});
  assign wire36 = reg28[(3'h4):(1'h1)];
  assign wire37 = ($signed($signed((((8'hb3) ? reg19 : reg14) ?
                      $unsigned(reg13) : (reg7 | reg31)))) << (8'ha3));
  assign wire38 = wire21[(3'h7):(2'h2)];
  assign wire39 = $unsigned((((|(^~wire15)) ?
                          $unsigned(reg33[(3'h7):(3'h5)]) : $signed({(8'hb2),
                              wire35})) ?
                      wire36 : $unsigned((&(^~reg18)))));
  assign wire40 = reg29;
  assign wire41 = {$signed((^~(~^(7'h43)))),
                      {($unsigned(reg9[(4'hd):(2'h3)]) ?
                              wire2 : wire0[(1'h0):(1'h0)])}};
  assign wire42 = (|$signed(($unsigned($unsigned((7'h40))) ?
                      (~((8'hb1) & wire41)) : (wire20 ?
                          (reg7 * reg8) : (wire34 << reg24)))));
  assign wire43 = (~^reg9);
  assign wire44 = $signed(((((!reg11) < {(8'haa),
                          (8'ha0)}) << $unsigned($signed(wire42))) ?
                      (+wire0) : (+$signed(reg13))));
  assign wire45 = $signed(($signed($unsigned((reg9 ?
                      (8'h9f) : reg14))) > {(reg30 ?
                          (wire2 != wire34) : wire15),
                      (!$signed(wire43))}));
  module46 #() modinst65 (.wire49(reg17), .wire50(reg12), .y(wire64), .wire48(wire43), .wire47(reg6), .wire51(wire44), .clk(clk));
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire signed [(5'h14):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire [(5'h14):(1'h0)] wire48;
  input wire signed [(5'h12):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire52 = $unsigned($signed((~^$unsigned((&wire50)))));
  assign wire53 = ((&$signed(wire52)) ?
                      (~&wire47) : (($unsigned(wire50[(4'h8):(3'h6)]) ?
                              wire48[(4'hb):(3'h7)] : (8'hb5)) ?
                          wire51[(3'h5):(3'h4)] : $signed((wire49[(2'h2):(1'h0)] * (&wire50)))));
  assign wire54 = ({(wire49 ?
                              $signed(wire53[(4'hd):(4'h9)]) : ((wire49 * wire49) >>> (^wire50)))} ?
                      {wire49,
                          (~^($signed(wire47) >> $signed(wire47)))} : {(({wire49,
                                      wire53} ?
                                  wire47 : $unsigned((8'ha0))) ?
                              ((wire48 ^ wire49) + {wire47}) : $signed({wire52,
                                  wire53}))});
  always
    @(posedge clk) begin
      reg55 <= $signed((8'ha6));
      if ((-wire47[(4'hf):(4'h9)]))
        begin
          reg56 <= (^~((+wire50[(1'h0):(1'h0)]) ?
              wire53 : $unsigned((~&(wire51 > wire50)))));
          if ((&$unsigned((8'hb7))))
            begin
              reg57 <= {((~&$signed((wire52 ? wire54 : wire50))) ?
                      $signed($signed(wire50[(3'h5):(2'h3)])) : wire48),
                  reg55[(4'hb):(2'h3)]};
            end
          else
            begin
              reg57 <= (wire49 >>> wire49);
              reg58 <= $unsigned((~|(|$unsigned($unsigned((8'hb1))))));
              reg59 <= $signed((wire50[(5'h10):(1'h0)] * wire48[(5'h11):(4'h9)]));
            end
          reg60 <= ($unsigned((reg55[(4'h9):(2'h3)] ?
                  ((reg56 ? wire50 : wire51) ?
                      $signed(reg55) : (wire47 ?
                          reg57 : reg57)) : wire51[(3'h4):(1'h1)])) ?
              {(($signed(wire54) ? wire48 : wire53) ?
                      (8'hbf) : $signed((!wire53)))} : ($unsigned(wire48) | $signed($signed((~&reg57)))));
          reg61 <= (+$unsigned(({reg55, $unsigned(reg59)} ?
              $signed((&(8'hb5))) : $signed((reg56 ? wire54 : (8'h9d))))));
        end
      else
        begin
          reg56 <= $signed($signed(($unsigned($signed(wire51)) ^~ (&$unsigned(wire53)))));
          reg57 <= $unsigned({wire54});
          reg58 <= wire50[(4'hc):(3'h5)];
          if ({(wire48[(2'h3):(1'h0)] != $unsigned((wire50[(5'h11):(4'hf)] == reg55))),
              ($unsigned($signed((reg56 || wire50))) ^ {reg59[(3'h7):(3'h6)],
                  wire53[(3'h5):(1'h1)]})})
            begin
              reg59 <= wire54[(2'h2):(2'h2)];
              reg60 <= wire48;
            end
          else
            begin
              reg59 <= (wire47[(4'he):(4'h8)] ?
                  ($unsigned((wire50 ? $signed(wire53) : $unsigned(reg59))) ?
                      (wire52[(4'hc):(2'h3)] ?
                          reg55 : $signed({reg61,
                              wire50})) : reg57[(5'h15):(4'he)]) : reg61[(3'h5):(1'h1)]);
            end
        end
      reg62 <= (((reg56 ? {reg60[(4'h8):(3'h7)], $unsigned(reg58)} : reg56) ?
          (^~({reg55,
              wire51} + wire50[(5'h10):(3'h5)])) : $unsigned($unsigned((wire53 ?
              (8'ha8) : wire51)))) >>> (reg56[(2'h2):(1'h1)] ?
          wire48[(3'h4):(1'h0)] : (!(~|(^wire48)))));
      reg63 <= (wire49 ?
          $signed((&((reg59 > wire54) < wire52))) : (~|$unsigned({(^(8'hbb))})));
    end
endmodule
