module top
#(parameter param51 = (~&((~^(~|(~^(8'h9d)))) >>> (&(((7'h44) != (8'ha3)) >= ((8'hb6) ? (8'ha8) : (8'hbf)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire49;
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire16,
                 wire17,
                 wire49,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire5 = (7'h41);
  assign wire6 = $unsigned((-{(wire3 ? (~&wire3) : (wire4 > (8'hbe))), wire3}));
  always
    @(posedge clk) begin
      if (wire6)
        begin
          reg7 <= {(-$signed((wire2[(3'h4):(1'h1)] ?
                  wire1[(5'h12):(3'h6)] : (wire5 ? wire0 : wire6))))};
          reg8 <= $signed(wire2);
          reg9 <= wire6;
          reg10 <= ($unsigned({(reg9[(4'hc):(4'h8)] ?
                  (^~wire6) : (wire4 <= (8'hb6))),
              (^$signed(reg8))}) && wire2);
          reg11 <= (!(((~$unsigned(reg7)) >= ((reg10 ? wire0 : wire0) ?
                  (~^wire3) : ((8'ha6) ? wire3 : reg9))) ?
              $unsigned(((!wire0) ?
                  (reg8 ? reg8 : reg7) : (reg10 ? reg9 : reg10))) : reg9));
        end
      else
        begin
          reg7 <= $signed((wire1 ?
              ((8'ha4) ?
                  ((reg8 ? (8'ha1) : wire5) ?
                      (~^reg10) : $unsigned(wire1)) : $unsigned((wire5 ?
                      wire6 : (8'ha8)))) : ($unsigned((|wire6)) + reg10[(4'hb):(2'h3)])));
        end
      reg12 <= ($signed(((reg11[(2'h3):(1'h0)] & wire3) >> wire6[(1'h1):(1'h1)])) ?
          $signed((8'ha6)) : $signed(wire6[(2'h3):(2'h3)]));
      reg13 <= wire1[(3'h5):(2'h3)];
      reg14 <= $unsigned((|(reg7[(4'hb):(3'h7)] <= reg12)));
      reg15 <= $signed(((reg12 + reg14[(1'h1):(1'h1)]) ^ $unsigned(reg10)));
    end
  assign wire16 = wire5[(3'h7):(3'h5)];
  assign wire17 = $signed({$unsigned($signed((~^(8'had)))),
                      $signed(wire1[(4'he):(1'h1)])});
  module18 #() modinst50 (.wire20(reg15), .wire19(reg12), .clk(clk), .y(wire49), .wire21(wire0), .wire22(reg9));
endmodule

module module18
#(parameter param48 = (^{(~^(((8'ha2) * (8'haf)) ? ((8'hac) != (8'ha6)) : {(7'h41), (8'hac)}))}))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire27,
                 wire24,
                 wire23,
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
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = wire19[(4'h9):(4'h8)];
  assign wire24 = (&(wire23 >> wire23[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire19)
        begin
          reg25 <= (8'hb3);
          reg26 <= ((~|((^~$unsigned(wire23)) <= ((8'h9f) ?
              (wire20 >= wire19) : wire21[(3'h4):(2'h3)]))) >> ((!{$signed(wire19)}) ?
              $signed(((~|reg25) >= (|wire22))) : (&((|reg25) - $unsigned(wire19)))));
        end
      else
        begin
          reg25 <= reg26;
        end
    end
  assign wire27 = $signed(((8'hae) << $unsigned(({wire23, (7'h43)} && {wire19,
                      wire23}))));
  always
    @(posedge clk) begin
      reg28 <= (~((wire23[(3'h4):(2'h3)] ?
              (-$signed(wire23)) : (~|(wire19 ? wire22 : wire21))) ?
          $unsigned((8'hb8)) : (~&$signed(wire20[(4'hb):(4'h8)]))));
      if ((reg28[(3'h6):(3'h6)] ?
          (~&($signed((reg26 - (8'hae))) ?
              wire24[(4'hd):(3'h7)] : ((wire27 ?
                  reg26 : wire20) != $signed(wire27)))) : {wire21[(1'h1):(1'h0)]}))
        begin
          reg29 <= wire24[(3'h6):(3'h6)];
          reg30 <= {((!(wire22 ? $unsigned((8'haf)) : $signed(wire22))) ?
                  (&wire19) : (|(&(wire20 ? wire24 : wire19)))),
              $unsigned((|({reg26} ? (~^wire19) : {wire21, wire27})))};
          reg31 <= reg30[(1'h0):(1'h0)];
        end
      else
        begin
          reg29 <= wire20[(1'h0):(1'h0)];
          reg30 <= reg25[(2'h3):(2'h3)];
          if (((~(~({wire24, wire24} == ((8'hbf) ? reg31 : wire23)))) ?
              {wire23[(2'h3):(1'h1)]} : (+(reg29 ?
                  (^~(wire24 ? (7'h43) : (8'ha0))) : $unsigned((+wire23))))))
            begin
              reg31 <= ($signed(((wire22 ?
                      (reg28 <<< (8'hba)) : {wire22,
                          wire22}) << reg26[(3'h6):(1'h0)])) ?
                  reg29[(4'hf):(1'h1)] : $unsigned((((wire19 ?
                          wire27 : wire22) <= {reg28}) ?
                      reg30[(2'h3):(1'h1)] : ({reg25} ?
                          wire27 : (reg29 != wire22)))));
            end
          else
            begin
              reg31 <= {(+(~reg28))};
              reg32 <= ((($signed((~reg26)) ?
                          {(wire20 ? wire19 : wire23),
                              ((8'hb7) ?
                                  reg29 : wire27)} : reg25[(3'h4):(2'h3)]) ?
                      $signed({$signed(wire23)}) : reg31) ?
                  (~^($signed((wire19 || reg25)) ?
                      {(wire19 > reg25)} : (&$unsigned((8'ha0))))) : wire27[(2'h3):(1'h1)]);
              reg33 <= $unsigned(wire19);
              reg34 <= (({{(-reg30)}, (8'ha5)} ?
                  $unsigned((-(wire20 <<< (8'ha1)))) : {$signed($unsigned(reg31))}) >> (^wire24[(4'ha):(3'h7)]));
              reg35 <= wire27[(2'h2):(1'h0)];
            end
          reg36 <= (($signed($unsigned((+(8'hbc)))) ?
              reg35[(2'h2):(1'h1)] : {$unsigned($unsigned((8'hb5))),
                  $unsigned($unsigned((8'hbf)))}) <<< wire22);
        end
      reg37 <= {wire27[(1'h0):(1'h0)], wire22[(5'h14):(3'h6)]};
      if ({$unsigned($signed(({wire19, (8'hbb)} >> (~&reg29))))})
        begin
          reg38 <= ((((~(+reg30)) ?
                  (reg26[(3'h5):(3'h5)] ?
                      (reg29 < reg35) : $unsigned(wire24)) : (reg26 <= $unsigned(reg30))) ?
              ((reg29[(4'hd):(4'hb)] ?
                      (reg35 ? reg31 : reg36) : {(8'ha6), reg29}) ?
                  (^{wire27}) : ((reg28 ~^ reg29) ?
                      (wire19 << (8'hbc)) : $signed((7'h43)))) : wire24) - $signed((((reg29 ?
                      wire21 : (7'h41)) ?
                  $signed((8'haa)) : reg36[(4'hc):(4'ha)]) ?
              (reg36 ?
                  wire19[(4'he):(2'h2)] : {(8'h9f),
                      (8'hbc)}) : ($unsigned(reg26) ^ {wire20}))));
          reg39 <= (reg33[(3'h6):(1'h0)] ?
              (~{$unsigned($unsigned(wire20))}) : ((-(reg33 && $unsigned(wire27))) == $unsigned($unsigned((reg38 ?
                  (8'ha5) : reg28)))));
        end
      else
        begin
          if (wire22)
            begin
              reg38 <= reg35;
              reg39 <= (($unsigned($signed(reg28)) ?
                      (~|$signed({reg29})) : wire20[(4'ha):(4'ha)]) ?
                  {(reg37 <<< (wire22[(5'h10):(4'ha)] ?
                          (reg38 & reg35) : reg26))} : reg25[(3'h5):(2'h2)]);
            end
          else
            begin
              reg38 <= (($unsigned((~|(reg32 ?
                  wire27 : reg39))) ^~ ($signed($unsigned(reg33)) ?
                  $unsigned((reg33 ? reg33 : reg34)) : $signed((wire19 ?
                      (8'ha4) : reg38)))) <= (~^({(wire23 ^~ wire21)} ?
                  {$unsigned((8'ha0)), {reg37}} : (^~reg25))));
              reg39 <= $unsigned({((~|(wire22 | reg29)) ^ $unsigned((wire19 == (8'hb5)))),
                  ($unsigned($signed(wire22)) - (~|$signed(reg31)))});
              reg40 <= reg26;
            end
          reg41 <= reg34;
        end
    end
  assign wire42 = (^~(8'hb6));
  assign wire43 = ((8'hb4) & {{(wire27[(2'h3):(1'h0)] * (reg30 ?
                              wire42 : wire23)),
                          (wire22 << reg41[(4'h9):(1'h1)])}});
  assign wire44 = reg25;
  assign wire45 = (($signed(reg26) < (reg39 >>> reg41)) ?
                      reg33 : $unsigned((-{reg41[(4'hd):(2'h3)]})));
  assign wire46 = $unsigned((~|reg29[(4'ha):(4'h8)]));
  assign wire47 = $signed((($signed((+wire42)) ?
                          (8'hb6) : $signed(reg39[(1'h1):(1'h1)])) ?
                      (!wire44[(3'h6):(3'h4)]) : (((reg35 || reg38) ?
                              {reg25, reg26} : (reg25 ? reg41 : reg28)) ?
                          $unsigned((reg39 ?
                              wire22 : reg31)) : ((reg31 + (8'h9e)) > (^~wire19)))));
endmodule
