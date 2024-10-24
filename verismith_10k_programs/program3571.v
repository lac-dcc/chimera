module top
#(parameter param11 = {(-{{{(7'h40), (8'hb1)}}, (((8'ha7) ? (8'haa) : (8'hbf)) <= (^~(8'hb3)))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire9, wire8, wire6, wire5, reg7, (1'h0)};
  assign wire5 = wire1[(4'h8):(3'h5)];
  assign wire6 = wire5[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= (wire5 >> ((!$unsigned({wire0,
          wire4})) || $signed($signed((wire5 ? (8'hb4) : wire0)))));
    end
  assign wire8 = {(wire0[(4'h9):(4'h8)] ?
                         $unsigned({(!wire5),
                             wire1}) : (reg7[(5'h10):(3'h5)] != {$unsigned(wire6),
                             reg7[(4'h9):(2'h3)]})),
                     $unsigned((($signed(wire0) ?
                         wire0[(4'he):(4'ha)] : wire0) >> ({wire6, wire1} ?
                         {wire4} : {(7'h40), wire2})))};
  assign wire9 = (8'hb5);
  assign wire10 = (wire4[(3'h4):(1'h0)] ?
                      reg7[(3'h7):(2'h2)] : $signed(((~^(wire6 << (7'h44))) && wire3)));
endmodule
