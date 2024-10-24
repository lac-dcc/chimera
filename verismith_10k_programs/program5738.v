module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire15,
                 wire14,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = (^~wire3[(3'h6):(1'h1)]);
  assign wire6 = wire0;
  assign wire7 = {$unsigned((~|({wire3} ?
                         $unsigned(wire5) : ((8'hb0) ? wire6 : wire3)))),
                     (|wire2)};
  assign wire8 = ($signed((wire3[(5'h12):(4'hd)] ?
                     wire4 : wire5)) & $signed(wire5[(1'h0):(1'h0)]));
  assign wire9 = (($signed({$signed(wire0), $signed((8'ha4))}) < {((wire8 ?
                             wire8 : wire3) ?
                         wire7[(4'h8):(2'h2)] : $unsigned(wire5)),
                     $signed({(8'hab), wire4})}) + ({wire0[(2'h2):(2'h2)]} ?
                     wire5[(3'h7):(3'h5)] : (8'ha1)));
  assign wire10 = wire6[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg11 <= (8'hab);
      reg12 <= (!reg11);
      reg13 <= wire10[(2'h2):(1'h0)];
    end
  assign wire14 = reg11;
  assign wire15 = ($unsigned({($signed(wire14) << (^wire1)),
                      ((wire10 ?
                          wire1 : (8'ha3)) <= (^wire9))}) << wire1[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg16 <= wire3;
      if (wire6[(3'h5):(1'h1)])
        begin
          reg17 <= (~^wire0);
          if (wire9[(1'h0):(1'h0)])
            begin
              reg18 <= {wire6[(2'h2):(1'h1)]};
              reg19 <= $unsigned(reg12[(4'hb):(4'h9)]);
              reg20 <= ((7'h43) | (wire8 ?
                  {$signed((~(7'h43)))} : ((~^(wire3 ?
                      (8'hb8) : reg12)) != wire9[(4'h9):(1'h0)])));
              reg21 <= (~$unsigned((wire7 >> (8'hab))));
              reg22 <= (~^reg21[(4'ha):(2'h3)]);
            end
          else
            begin
              reg18 <= reg20[(4'hb):(1'h0)];
              reg19 <= wire2;
            end
          reg23 <= wire15;
          reg24 <= $unsigned($signed((~^$unsigned((-wire7)))));
        end
      else
        begin
          reg17 <= (|{$unsigned(wire6[(3'h6):(1'h1)])});
        end
    end
  assign wire25 = $unsigned(({({(8'ha6), reg20} ? wire3 : wire2),
                          $signed($unsigned(wire3))} ?
                      (reg18 ?
                          (|(reg13 <= (8'hb8))) : (reg17[(5'h11):(3'h6)] < (wire0 ?
                              reg11 : reg23))) : {($unsigned(wire5) < $unsigned(wire7))}));
  assign wire26 = (wire7[(4'h9):(2'h3)] ?
                      $unsigned((^~(wire0[(1'h0):(1'h0)] ?
                          (wire25 << reg11) : $signed(reg11)))) : wire0[(1'h1):(1'h1)]);
  assign wire27 = ({{reg22, $signed(reg12[(4'h9):(1'h0)])}, wire5} ?
                      ($unsigned(($signed(reg17) <<< ((8'haf) == reg16))) ?
                          ({reg13[(1'h0):(1'h0)],
                              reg19[(3'h4):(1'h1)]} & $signed($unsigned(wire1))) : {reg17[(2'h2):(2'h2)]}) : reg19);
  assign wire28 = ({(+wire6[(2'h3):(2'h3)])} || ((((wire8 & wire5) ?
                              $signed((8'ha5)) : (wire0 ? reg19 : (8'hb3))) ?
                          $unsigned(reg18) : $unsigned(reg23[(3'h4):(1'h0)])) ?
                      $signed(reg13[(3'h5):(2'h2)]) : reg21[(4'hd):(4'hc)]));
  always
    @(posedge clk) begin
      reg29 <= reg13;
      reg30 <= {$unsigned($unsigned(((wire8 ? reg16 : wire9) & (reg23 ?
              reg22 : reg22))))};
      if (wire6)
        begin
          reg31 <= ($signed({$signed({wire10, wire27}),
              reg24}) >> (+{$unsigned((wire14 & (8'ha7))), $signed(reg16)}));
        end
      else
        begin
          reg31 <= $unsigned(reg22);
          reg32 <= ((~($unsigned(reg30[(2'h2):(2'h2)]) > $signed((~&reg17)))) ?
              (({(8'hb8)} ?
                  $unsigned(reg24) : $unsigned($unsigned(reg22))) * (8'ha9)) : (($unsigned((&wire2)) ?
                      {{wire4, reg24}, $unsigned(reg19)} : wire2) ?
                  wire7[(4'hd):(1'h1)] : ($unsigned(reg22) >= ((^~reg16) > (wire15 >>> (8'ha5))))));
          reg33 <= ({$unsigned((~|reg16[(3'h4):(3'h4)]))} ^~ (~&reg13[(4'h9):(3'h6)]));
        end
      reg34 <= (~|$unsigned($unsigned(wire15[(3'h6):(2'h2)])));
      reg35 <= ((+wire8[(1'h1):(1'h0)]) ?
          $signed((|(reg32[(3'h7):(2'h2)] ?
              (&wire28) : {wire4,
                  (8'hb5)}))) : $signed($signed(($signed(reg16) ?
              $unsigned(wire1) : (8'ha9)))));
    end
  assign wire36 = ($unsigned((&(~|(|wire9)))) ?
                      ((-((wire15 | wire6) & (reg30 + reg24))) | $unsigned(($unsigned((8'hb1)) < (wire4 ?
                          (8'had) : wire25)))) : $unsigned(($signed(reg13[(4'hd):(3'h4)]) & $unsigned((reg19 << reg33)))));
  assign wire37 = ($unsigned((~&(&(wire9 ? reg24 : reg19)))) ?
                      ({reg33[(2'h2):(2'h2)]} ?
                          (wire1 >= (~wire4)) : wire3[(3'h6):(3'h4)]) : reg21[(4'he):(2'h2)]);
  assign wire38 = $unsigned((wire10 ?
                      (wire27[(4'hc):(3'h5)] <<< $signed({reg34})) : (wire10 != reg12)));
  always
    @(posedge clk) begin
      reg39 <= (wire15[(4'hb):(4'hb)] <= ($unsigned(($unsigned(reg22) ?
          reg23[(4'h8):(3'h6)] : $signed(reg31))) ^ (wire4 ?
          $unsigned($unsigned(wire8)) : reg23)));
      reg40 <= $signed($signed(wire37[(1'h0):(1'h0)]));
      reg41 <= wire3[(4'hb):(4'h9)];
      reg42 <= $signed(wire36[(1'h0):(1'h0)]);
    end
endmodule
