module top
#(parameter param10 = (~|((((~(8'hbb)) || (|(8'hb3))) ? ({(8'haf)} >= ((8'ha7) ? (8'haa) : (8'ha5))) : ({(8'h9e), (8'ha0)} ? (!(8'hbb)) : (!(8'ha6)))) >= (^~{{(8'h9f)}, {(8'haa)}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg9, reg8, (1'h0)};
  assign wire5 = {(~&(~wire1))};
  assign wire6 = $signed(({$unsigned((wire3 ? wire2 : wire4))} <= {(^~((8'hb0) ?
                         wire5 : wire1)),
                     (^~((7'h43) ? wire3 : wire5))}));
  assign wire7 = (~$unsigned((+((&wire4) != ((8'hbd) ? (8'hbc) : (8'ha3))))));
  always
    @(posedge clk) begin
      reg8 <= (&wire4);
      reg9 <= $signed(wire5[(2'h2):(1'h0)]);
    end
endmodule
