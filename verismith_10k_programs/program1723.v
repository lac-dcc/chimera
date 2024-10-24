module top
#(parameter param59 = (((!(((8'hbd) ? (8'had) : (8'hb9)) ? ((8'ha8) ? (8'ha9) : (7'h41)) : ((8'ha4) ? (7'h44) : (8'hab)))) ? {(8'hb0)} : (8'hb9)) - ({(^~((8'hb6) <= (8'hb1)))} | {(((8'ha2) ? (8'h9c) : (8'ha9)) ? (^(8'ha2)) : {(8'hbd)}), (-{(8'ha0), (8'hb0)})})), 
parameter param60 = (^~{(8'had), param59}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire42;
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire5,
                 wire42,
                 reg53,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
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
  assign wire5 = (8'hb3);
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned($signed((wire2 ? (8'ha7) : wire3))))))
        begin
          reg6 <= $signed(($signed($unsigned((wire2 * wire4))) ?
              (~{(^~wire0)}) : {wire0[(2'h3):(2'h3)], wire3[(3'h6):(2'h2)]}));
          if (wire2[(3'h6):(2'h2)])
            begin
              reg7 <= $unsigned(reg6[(2'h3):(2'h3)]);
              reg8 <= $unsigned(wire5[(2'h2):(1'h1)]);
              reg9 <= ($signed((^~$signed(wire1))) ?
                  wire2 : wire2[(4'hd):(3'h6)]);
              reg10 <= $signed(reg9);
            end
          else
            begin
              reg7 <= (-wire1[(3'h7):(1'h0)]);
              reg8 <= $unsigned($unsigned($signed($signed(reg9))));
              reg9 <= $unsigned(({$unsigned((reg9 ? (7'h44) : reg9)),
                  {wire4, {wire3, reg7}}} != (reg8[(3'h5):(2'h3)] ?
                  {wire3[(2'h3):(2'h3)], reg7} : {wire5,
                      (wire5 ? wire2 : reg7)})));
            end
          if (reg10)
            begin
              reg11 <= $unsigned($unsigned(($unsigned($unsigned(wire2)) + ($signed(reg8) ?
                  ((8'ha5) ? wire2 : reg8) : $signed((8'hb2))))));
            end
          else
            begin
              reg11 <= $signed((($signed(wire4[(3'h4):(3'h4)]) ?
                      {(reg10 == reg8)} : {reg11[(2'h3):(1'h1)],
                          $signed(reg8)}) ?
                  $signed((wire5[(3'h4):(2'h3)] < (8'haa))) : ($unsigned((^wire3)) ?
                      (reg7 ?
                          $signed(wire5) : (wire1 ?
                              reg9 : reg8)) : wire3[(4'h8):(3'h4)])));
              reg12 <= reg8;
              reg13 <= (+$unsigned($signed(wire3[(4'h8):(3'h7)])));
            end
          reg14 <= $signed((&reg6[(3'h4):(1'h0)]));
        end
      else
        begin
          reg6 <= ($signed({reg6, wire3[(3'h6):(1'h0)]}) || $signed(wire1));
          reg7 <= (reg9 & (7'h42));
          reg8 <= reg9[(2'h3):(2'h2)];
        end
      reg15 <= (reg14[(1'h0):(1'h0)] ?
          ((&{(reg12 || reg10), $unsigned(wire0)}) ?
              (^wire0) : ($unsigned((^~reg13)) ?
                  (^~((8'ha8) != reg6)) : wire5)) : (reg7[(4'h9):(3'h6)] ?
              $signed(((wire2 > reg10) ?
                  $signed(reg7) : reg12)) : $unsigned(($unsigned((8'hbf)) && $signed(wire5)))));
      reg16 <= reg14[(1'h0):(1'h0)];
      reg17 <= ($signed($unsigned($signed($signed(wire0)))) | (wire4[(1'h1):(1'h1)] ^~ (!((wire0 ?
          reg16 : reg12) | (reg9 ? (8'h9d) : reg11)))));
      reg18 <= $signed($unsigned((^(^~$signed(reg14)))));
    end
  module19 #() modinst43 (wire42, clk, reg12, reg13, reg14, wire5);
  always
    @(posedge clk) begin
      reg44 <= (wire0 ?
          (-$unsigned((-{(8'h9e), wire5}))) : reg14[(2'h2):(1'h1)]);
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg10[(3'h5):(2'h3)]))
        begin
          reg45 <= $signed({((~^wire3) ?
                  $unsigned((~|(8'hbe))) : $signed($unsigned((8'hb5))))});
        end
      else
        begin
          reg45 <= $unsigned({(($unsigned((8'had)) || reg16[(3'h6):(1'h1)]) * ((+wire2) ?
                  reg18[(2'h2):(1'h0)] : (reg18 ? reg15 : reg13))),
              (!((reg11 & (8'ha0)) ? reg10 : {wire42}))});
          reg46 <= reg16[(3'h7):(1'h0)];
          reg47 <= $unsigned(reg11);
        end
    end
  assign wire48 = (+{(^$signed(wire0))});
  assign wire49 = (reg47[(3'h5):(1'h1)] ?
                      (({reg16} ? reg9 : ($unsigned(reg45) ~^ $signed(reg11))) ?
                          $signed({{wire5},
                              reg6[(4'h8):(3'h7)]}) : reg47) : {($signed((8'hba)) == reg12[(4'h9):(3'h4)]),
                          (|(!(wire1 ? wire3 : wire5)))});
  assign wire50 = (($signed(($signed(reg17) ?
                          (wire5 ?
                              wire4 : reg15) : (8'ha5))) | $signed({$unsigned(reg45)})) ?
                      reg14 : $signed($signed((-((8'hac) ? (8'hab) : reg14)))));
  assign wire51 = reg16[(4'hc):(1'h1)];
  assign wire52 = $signed(wire48[(5'h11):(5'h11)]);
  always
    @(posedge clk) begin
      reg53 <= {$unsigned($unsigned({((8'hac) ? wire0 : wire48)}))};
    end
  assign wire54 = (reg44[(1'h0):(1'h0)] & $signed((&reg45[(3'h5):(1'h1)])));
  assign wire55 = $unsigned(($unsigned(reg10[(3'h6):(3'h6)]) ?
                      ({(~&(8'ha4)), wire52[(1'h0):(1'h0)]} ?
                          (((8'ha1) ?
                              reg45 : (8'hbc)) || (reg9 ^~ reg10)) : ((reg15 ?
                                  reg46 : reg17) ?
                              reg16[(5'h12):(3'h7)] : $unsigned(wire5))) : $signed({$signed(reg12)})));
  assign wire56 = {(&(({reg15} ?
                              ((8'hbd) ?
                                  reg12 : (8'hae)) : wire5[(5'h11):(3'h6)]) ?
                          wire5 : ($unsigned(wire49) ?
                              (reg9 ? wire54 : wire4) : {wire48})))};
  assign wire57 = wire56[(1'h0):(1'h0)];
  assign wire58 = (^reg8[(3'h4):(2'h3)]);
endmodule

module module19
#(parameter param40 = (|(((((8'hbc) ? (8'hbb) : (7'h43)) && (~^(8'hb3))) ^~ (((8'ha2) ? (8'hb1) : (8'hbe)) <<< ((7'h41) >> (8'haf)))) ~^ {(~(8'hb0))})), 
parameter param41 = ({(({param40} ? (~^param40) : (~^(8'h9d))) ? ((param40 ? param40 : param40) != param40) : ((~&param40) >>> param40)), (8'hb2)} < ((((param40 ? param40 : param40) ? (^param40) : {param40, param40}) >> (~(param40 ? param40 : param40))) ? ({(8'hbe)} ? {(+param40)} : (param40 ? ((7'h44) ^ param40) : (param40 << param40))) : param40)))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg39,
                 reg38,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire24 = (^~(~&{((wire23 && wire21) >> (^wire22)),
                      (wire21 ? (&wire22) : (wire21 ? wire23 : wire21))}));
  assign wire25 = ($unsigned(wire22[(3'h5):(1'h0)]) ?
                      ((wire20[(5'h10):(1'h0)] >> wire24[(1'h0):(1'h0)]) ?
                          $unsigned((wire24[(1'h0):(1'h0)] ?
                              (wire20 ?
                                  wire21 : wire23) : $signed(wire24))) : (((!wire24) ?
                              $unsigned(wire21) : $signed(wire23)) <<< $unsigned((wire21 || (8'ha1))))) : $unsigned($signed(wire20[(4'hd):(4'h9)])));
  assign wire26 = (~(!wire24));
  assign wire27 = {(&wire20[(4'ha):(3'h7)])};
  assign wire28 = ((wire21[(4'hc):(4'hc)] ?
                      $unsigned((~&$signed(wire21))) : ($unsigned((~&wire23)) + wire25[(1'h0):(1'h0)])) ^ wire26[(2'h2):(1'h0)]);
  assign wire29 = {wire23[(1'h0):(1'h0)], (~|wire22[(4'h8):(3'h7)])};
  assign wire30 = {((7'h40) ?
                          ($unsigned((&wire22)) ?
                              wire27 : ((wire29 && (8'ha9)) ?
                                  $unsigned(wire23) : (wire23 ?
                                      wire22 : wire27))) : (^(~&wire23[(3'h7):(3'h5)]))),
                      $unsigned({(+{wire22})})};
  assign wire31 = (wire28[(3'h7):(3'h7)] || (({(wire22 ~^ wire24),
                              (wire20 ? wire23 : wire29)} ?
                          wire25 : (~|$signed(wire26))) ?
                      ($unsigned($unsigned(wire22)) < (wire25[(4'h8):(3'h4)] ?
                          (wire29 <<< wire25) : $signed(wire30))) : $unsigned(($signed((8'hae)) ?
                          {wire27, wire20} : (wire23 > wire21)))));
  always
    @(posedge clk) begin
      reg32 <= wire31[(4'hf):(1'h1)];
      reg33 <= $signed(reg32[(1'h0):(1'h0)]);
      reg34 <= wire28[(4'ha):(4'h9)];
    end
  assign wire35 = $signed(reg34);
  assign wire36 = (({{reg33, (wire24 > wire30)}} ?
                          wire24[(2'h2):(1'h1)] : $signed($unsigned((wire26 & wire25)))) ?
                      reg34[(1'h1):(1'h1)] : (^~(~^{wire29[(4'hd):(3'h4)]})));
  assign wire37 = reg34[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg38 <= $unsigned($unsigned($signed($signed(reg33))));
      reg39 <= $signed(({($unsigned(reg33) ?
                  (wire26 > wire25) : wire21[(4'h9):(3'h6)]),
              ($signed(wire29) ~^ wire28)} ?
          wire36[(4'h9):(4'h9)] : $signed(wire29)));
    end
endmodule
