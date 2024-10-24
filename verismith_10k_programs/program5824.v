module top
#(parameter param15 = (~(|((!{(8'hbc), (8'haa)}) << (^~(+(8'h9c)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  assign y = {wire14,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $signed((~|{wire1[(4'hd):(4'h9)]}));
  assign wire5 = (wire4[(2'h2):(2'h2)] != $signed({(!wire1)}));
  assign wire6 = (~|wire2);
  assign wire7 = wire0[(1'h0):(1'h0)];
  assign wire8 = $unsigned(({wire2[(3'h4):(1'h1)],
                     wire3[(1'h1):(1'h0)]} >= $unsigned(wire3)));
  assign wire9 = $unsigned($signed({$signed((wire4 * wire8)),
                     ({wire5, (8'hb9)} ? (wire0 * wire8) : $signed(wire4))}));
  always
    @(posedge clk) begin
      if (({(^~(^~$unsigned(wire4))), $signed({(wire0 ? wire7 : wire1)})} ?
          $signed(((~^{wire6, wire8}) ?
              $signed($unsigned((8'h9e))) : wire7)) : (wire8[(2'h2):(2'h2)] << {$unsigned((8'hbd))})))
        begin
          reg10 <= wire6[(5'h15):(4'ha)];
          if ((^~wire8))
            begin
              reg11 <= $signed((($unsigned((wire4 != (8'hb4))) ?
                  (-((7'h41) > wire7)) : wire2) > ((-$signed(wire0)) <= (reg10 ?
                  (wire6 ? wire3 : wire5) : (wire4 >> wire9)))));
              reg12 <= wire5[(3'h4):(3'h4)];
              reg13 <= ($signed(wire3[(2'h3):(1'h1)]) ^ (-wire1));
            end
          else
            begin
              reg11 <= ($signed(wire8[(1'h1):(1'h1)]) ?
                  wire2 : (wire6 ?
                      ((&$unsigned(wire9)) << (wire9 | $unsigned(wire9))) : {wire3[(1'h1):(1'h1)]}));
              reg12 <= $signed((^wire8[(1'h1):(1'h1)]));
              reg13 <= {wire5};
            end
        end
      else
        begin
          reg10 <= ($signed((wire3[(3'h6):(3'h5)] ?
                  (~reg11[(4'hc):(2'h2)]) : wire5)) ?
              $unsigned(wire4[(1'h1):(1'h0)]) : ($signed(((-reg11) || $unsigned(reg10))) ~^ wire0[(1'h0):(1'h0)]));
          reg11 <= $signed(($unsigned({wire3, $unsigned(wire0)}) ~^ (wire3 ?
              ((!wire3) >> (wire6 ?
                  wire5 : reg13)) : $signed(reg13[(1'h1):(1'h1)]))));
        end
    end
  assign wire14 = $unsigned($unsigned((wire1[(4'ha):(3'h5)] < (reg10[(2'h3):(2'h2)] < (reg13 ?
                      reg11 : reg11)))));
endmodule
