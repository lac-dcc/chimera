module top #(parameter param45 = (8'ha1)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire33,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = {(8'hb0), $unsigned($unsigned((8'h9e)))};
  assign wire6 = (-{$unsigned({((7'h43) ? wire0 : wire0), $unsigned(wire1)})});
  assign wire7 = ((^~((wire3[(3'h5):(2'h2)] ?
                     (!(8'hbe)) : $unsigned(wire4)) ^~ wire4[(2'h2):(1'h0)])) || wire3[(2'h3):(1'h0)]);
  assign wire8 = (8'ha4);
  always
    @(posedge clk) begin
      reg9 <= wire7;
      if ($signed($signed($signed(wire0[(4'h9):(3'h5)]))))
        begin
          reg10 <= (-((8'hb4) | (8'ha2)));
        end
      else
        begin
          reg10 <= wire5[(2'h3):(2'h2)];
          reg11 <= wire2;
          reg12 <= ((reg10 ?
                  (wire3[(3'h6):(3'h6)] ?
                      (&(~&wire8)) : (reg9 ?
                          reg10 : $signed((8'ha5)))) : wire7) ?
              (^~(($unsigned(wire6) ?
                  (reg11 - reg10) : {(8'ha7)}) && $signed(wire1[(3'h4):(1'h1)]))) : (&(~^$unsigned({reg9,
                  wire0}))));
          reg13 <= $signed(wire3);
          reg14 <= (&$signed(((!((8'hb2) <= reg11)) ?
              wire0 : ($unsigned(reg13) <<< $signed((7'h42))))));
        end
      if ({$unsigned((&(((8'h9e) ? wire2 : wire5) & (&(8'h9c))))),
          (wire5[(4'h8):(1'h1)] + (wire3 < wire5[(5'h11):(3'h7)]))})
        begin
          reg15 <= {($unsigned((^~((8'h9c) ? wire2 : reg10))) ?
                  $signed(((^~reg14) <= $signed(wire0))) : (~^((8'haf) ?
                      (reg13 ? (8'ha8) : wire4) : reg9)))};
          reg16 <= (|({(|{wire2, reg9})} < wire5[(1'h1):(1'h0)]));
          reg17 <= {$signed(({(wire0 && wire5)} ?
                  (reg13 & (wire4 ? reg12 : (8'ha1))) : {$unsigned(wire3)})),
              ((!(reg11 ? {wire6} : $signed(reg15))) ?
                  $unsigned(wire3) : ({(wire8 ? reg9 : wire3)} ?
                      $unsigned(wire0) : wire1))};
          reg18 <= wire5[(4'h8):(3'h7)];
          reg19 <= $signed(reg14);
        end
      else
        begin
          reg15 <= $unsigned({reg15, reg16[(1'h0):(1'h0)]});
          reg16 <= reg9;
          reg17 <= {reg9[(4'hc):(2'h2)]};
          reg18 <= {wire5[(3'h5):(2'h2)], wire7[(4'ha):(1'h1)]};
        end
      reg20 <= (+$signed(wire4));
    end
  assign wire21 = ({wire4,
                      ($unsigned($signed(wire5)) + $unsigned((reg13 <= reg15)))} == {(reg10[(4'ha):(4'h9)] ?
                          ({wire0, (8'ha9)} ?
                              reg15[(3'h5):(3'h4)] : (reg11 <= reg16)) : wire7[(1'h0):(1'h0)]),
                      ((8'hb2) ?
                          (+wire8) : (wire3 ?
                              {reg14, reg12} : (wire6 ? reg18 : reg12)))});
  assign wire22 = {($unsigned(wire2) > $unsigned((^$unsigned(wire8)))), reg19};
  assign wire23 = (+reg11[(2'h2):(2'h2)]);
  assign wire24 = {wire3[(4'h9):(4'h9)]};
  assign wire25 = wire23[(4'h9):(3'h5)];
  assign wire26 = (8'hb1);
  assign wire27 = ({$signed((wire3[(4'ha):(3'h7)] != $unsigned(wire5))),
                      wire24} >= wire5);
  always
    @(posedge clk) begin
      reg28 <= wire6;
      reg29 <= reg18;
      reg30 <= ((($unsigned(reg10) <= (&(wire8 ? wire4 : reg17))) ?
              (wire4 ?
                  ($unsigned(reg19) ?
                      (reg19 >>> (8'ha7)) : wire2[(3'h6):(3'h6)]) : reg9) : (!((wire0 - reg18) ?
                  $signed(wire27) : $signed(reg11)))) ?
          reg14[(2'h2):(2'h2)] : reg15[(4'hb):(2'h3)]);
      reg31 <= reg14;
      reg32 <= ($signed(reg9) ^~ (~^{((wire4 ?
              reg30 : wire2) >>> (~^wire25))}));
    end
  assign wire33 = $unsigned({$signed($unsigned((~reg32)))});
  always
    @(posedge clk) begin
      reg34 <= ({{wire7,
                  ((!reg11) ? (reg29 >>> reg32) : ((8'hb1) ? (8'hb4) : reg18))},
              $unsigned(wire33[(4'h8):(1'h0)])} ?
          {reg30[(3'h6):(2'h2)]} : ($unsigned($signed(reg30)) && (((&(7'h43)) ?
                  reg12[(1'h1):(1'h0)] : wire21[(1'h0):(1'h0)]) ?
              (&$unsigned(wire24)) : (~^(8'hb4)))));
      reg35 <= {$unsigned(wire8)};
      reg36 <= reg32;
      reg37 <= (|(((~|(reg31 >>> wire26)) * (~&(reg9 ~^ reg20))) ?
          (|(|(^reg16))) : reg12));
      reg38 <= $unsigned({$unsigned($unsigned({wire5, wire33})),
          $signed($signed($unsigned(wire3)))});
    end
  assign wire39 = $signed(reg16[(3'h6):(2'h2)]);
  assign wire40 = ($signed(wire0) ?
                      ({reg30, $signed($unsigned(wire23))} ?
                          (~$signed($signed(reg14))) : ($signed($signed(wire25)) ~^ reg30[(2'h2):(2'h2)])) : wire1[(4'ha):(4'h8)]);
  assign wire41 = wire39;
  assign wire42 = ((|(-((!reg14) * (-(8'h9c))))) >= (($signed({reg34}) ~^ (!((8'ha6) || reg20))) | (~^reg37[(4'h8):(3'h5)])));
  assign wire43 = wire33[(2'h3):(1'h0)];
  assign wire44 = (^~$signed($signed((+{wire8}))));
endmodule
