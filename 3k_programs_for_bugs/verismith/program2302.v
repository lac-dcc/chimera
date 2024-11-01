module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire30,
                 wire18,
                 wire17,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (8'hb7);
  assign wire6 = (wire3[(4'hd):(1'h1)] ~^ (~&((8'h9f) < wire2)));
  assign wire7 = (&(wire6[(2'h2):(2'h2)] | $signed(((wire3 ?
                         (8'had) : (7'h44)) ?
                     ((8'haa) ? wire2 : wire0) : wire5))));
  always
    @(posedge clk) begin
      reg8 <= wire1[(2'h2):(2'h2)];
      reg9 <= $unsigned((&(8'ha9)));
    end
  assign wire10 = $unsigned(wire6);
  assign wire11 = wire7[(5'h12):(4'hf)];
  always
    @(posedge clk) begin
      if (((^(&wire1)) ? wire10 : wire2[(3'h4):(1'h0)]))
        begin
          reg12 <= $signed(({((-wire2) ? {wire0, wire3} : (|wire2)),
                  {$unsigned((8'haa))}} ?
              $unsigned((~^wire1[(1'h1):(1'h1)])) : $unsigned(($unsigned(wire0) ?
                  ((8'hba) >>> wire2) : (wire6 ? (8'hb4) : reg9)))));
          reg13 <= (wire11 ?
              $signed(($unsigned((wire5 ? wire7 : (8'hb8))) ?
                  $unsigned((!reg12)) : $signed(wire7[(4'hf):(4'hd)]))) : wire5[(3'h7):(3'h4)]);
          reg14 <= $signed((((|$unsigned(reg8)) ? {$unsigned(wire6)} : reg12) ?
              reg8 : wire0[(1'h0):(1'h0)]));
          reg15 <= ($signed($unsigned(wire3[(4'he):(4'hc)])) & reg13);
        end
      else
        begin
          reg12 <= wire11;
        end
      reg16 <= reg15[(4'h8):(2'h2)];
    end
  assign wire17 = $signed((8'hb1));
  assign wire18 = reg16[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if (((wire2[(1'h0):(1'h0)] <= reg14) ?
          (wire5[(4'h9):(4'h9)] || $unsigned(((wire17 & reg9) * wire1[(1'h0):(1'h0)]))) : ((-($unsigned(wire18) ^~ (reg8 >>> reg8))) ?
              $unsigned(wire18) : $signed((~|wire6[(5'h10):(4'h8)])))))
        begin
          if ((($unsigned($signed(reg8)) ?
              (-$signed((reg8 ?
                  wire0 : wire6))) : (!$unsigned($signed(wire3)))) * wire7))
            begin
              reg19 <= (&(-$signed($signed(wire11[(2'h3):(2'h2)]))));
              reg20 <= $unsigned(($unsigned(wire2[(3'h6):(1'h1)]) ?
                  $unsigned(wire5[(3'h4):(1'h0)]) : ($signed((~&wire3)) ?
                      {(wire17 ~^ reg8)} : wire0[(2'h2):(1'h0)])));
            end
          else
            begin
              reg19 <= {(!(8'h9d))};
              reg20 <= {$signed((((reg19 & wire11) ?
                      $signed(reg13) : (wire1 ?
                          reg9 : reg15)) <<< $unsigned(wire7))),
                  (~|wire4)};
              reg21 <= (&$signed($unsigned((~(+reg9)))));
            end
          reg22 <= wire7;
          reg23 <= $signed(wire3);
          if ($unsigned($unsigned($signed(wire7))))
            begin
              reg24 <= {(~|($unsigned({wire7, wire11}) ?
                      (wire18[(4'ha):(3'h5)] && $signed(reg21)) : {$signed(reg14)})),
                  (($unsigned($unsigned(wire17)) & reg8[(1'h0):(1'h0)]) >= reg20[(2'h3):(2'h2)])};
              reg25 <= ({reg9,
                  $unsigned(reg14[(4'hc):(4'h8)])} + ({(wire17 & wire17)} ?
                  (^(!wire7)) : ((&(reg12 != reg15)) >>> $signed({wire11,
                      reg15}))));
            end
          else
            begin
              reg24 <= reg13[(2'h3):(2'h2)];
              reg25 <= ($unsigned((&((!wire6) ?
                      (wire7 <= reg22) : wire0[(2'h3):(1'h0)]))) ?
                  ({((+reg16) ? $unsigned(wire6) : $unsigned(reg22)),
                          $signed((&wire1))} ?
                      ({(wire7 ?
                              wire11 : reg8)} & reg20) : {($unsigned(wire11) == $unsigned(reg16)),
                          $signed((reg20 ^~ reg25))}) : ($unsigned($unsigned({(8'hbf),
                      wire18})) << wire0));
              reg26 <= {(~^(&($signed(wire10) >= reg13[(1'h1):(1'h1)])))};
            end
          reg27 <= reg8;
        end
      else
        begin
          reg19 <= reg21[(4'h8):(3'h6)];
        end
      reg28 <= reg8;
      reg29 <= (((($unsigned(wire3) || (^~reg15)) ?
              ((reg20 ^~ wire17) < reg28[(1'h1):(1'h1)]) : (~&reg13[(1'h0):(1'h0)])) ?
          {{(wire10 >>> wire0), (&reg8)},
              reg26[(2'h3):(1'h1)]} : {reg21}) || ((reg21 ^~ ((reg22 ?
              (8'h9f) : reg27) ?
          wire11[(1'h0):(1'h0)] : (reg16 == reg20))) - $unsigned(reg25)));
    end
  assign wire30 = $unsigned(((reg9[(4'h8):(3'h5)] ?
                      {$unsigned(reg9),
                          (8'had)} : wire18[(4'h8):(1'h1)]) == wire2));
endmodule
