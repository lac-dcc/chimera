module top
#(parameter param9 = (8'hae), 
parameter param10 = {{param9}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg8, (1'h0)};
  assign wire5 = ($unsigned($unsigned($signed($unsigned(wire4)))) ?
                     wire2 : wire4[(3'h5):(2'h2)]);
  assign wire6 = ((^~(wire2[(2'h2):(2'h2)] ?
                         {(^~wire2), $unsigned(wire1)} : ($unsigned((7'h40)) ?
                             $signed(wire2) : wire3))) ?
                     wire2 : wire2);
  assign wire7 = ((|$unsigned((((8'ha4) ? wire5 : wire2) ?
                     (wire2 ?
                         wire6 : wire2) : $unsigned(wire2)))) <<< $unsigned((^((wire4 ?
                         wire5 : wire5) ?
                     $unsigned(wire1) : wire4[(4'he):(3'h7)]))));
  always
    @(posedge clk) begin
      reg8 <= $signed(({$signed(wire1[(2'h2):(1'h1)]),
          (wire3[(1'h1):(1'h0)] ?
              (wire7 ~^ wire1) : wire6)} & $unsigned($signed(wire4))));
    end
endmodule
