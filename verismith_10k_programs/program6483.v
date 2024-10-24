module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire7,
                 wire6,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg5,
                 (1'h0)};
  assign wire4 = ((!(({wire2} ?
                     wire1[(1'h1):(1'h0)] : $unsigned(wire2)) ^~ wire3)) & (wire2 ?
                     (^~$unsigned($signed((7'h40)))) : $signed(($signed(wire3) ?
                         (^~wire1) : $unsigned(wire1)))));
  always
    @(posedge clk) begin
      reg5 <= (~|wire0[(1'h1):(1'h0)]);
    end
  assign wire6 = ((reg5[(2'h2):(1'h1)] || wire1[(1'h1):(1'h0)]) - (-$unsigned($unsigned($signed(reg5)))));
  assign wire7 = wire4;
  always
    @(posedge clk) begin
      reg8 <= $signed($signed((wire2 ? $signed(wire3) : wire3)));
      reg9 <= (-(+((|(-wire2)) ? wire2 : ({wire3, wire0} & wire3))));
      reg10 <= $unsigned({(((wire2 == wire4) && wire7[(3'h4):(1'h1)]) ?
              wire4[(4'he):(1'h0)] : $signed(wire7[(2'h2):(2'h2)])),
          (wire6 ? (reg8 ? $signed(wire7) : wire1[(2'h3):(2'h2)]) : reg9)});
      reg11 <= (((((reg9 & wire6) || reg9[(4'ha):(1'h1)]) <= $unsigned(wire0)) ?
              (reg9[(4'hc):(3'h5)] ?
                  {{wire2, (8'hab)},
                      $signed(reg8)} : ($signed(reg9) >>> {(8'haa),
                      (8'hb1)})) : {(wire6[(1'h0):(1'h0)] ?
                      $unsigned(wire0) : $signed(wire7))}) ?
          $signed($unsigned($signed((reg8 ~^ wire0)))) : $unsigned((($unsigned(reg8) ?
              (-wire3) : (^reg5)) && $signed(wire3[(3'h4):(1'h1)]))));
      reg12 <= (~&reg11[(4'ha):(4'h9)]);
    end
  assign wire13 = ($signed({($signed(wire3) * ((7'h43) == (8'hac))), reg8}) ?
                      ($signed($unsigned($unsigned(reg9))) ?
                          wire6[(3'h5):(3'h5)] : $signed(wire4[(3'h5):(2'h3)])) : (&(reg10 - (~^wire3[(3'h5):(1'h1)]))));
  assign wire14 = reg8;
endmodule
