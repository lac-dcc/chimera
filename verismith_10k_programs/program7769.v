module top
#(parameter param13 = ((!{{(^~(8'hb5))}}) >= (&{(^~(~&(8'ha3)))})), 
parameter param14 = param13)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire12, wire11, wire10, wire9, wire6, wire5, reg8, reg7, (1'h0)};
  assign wire5 = wire0[(2'h2):(2'h2)];
  assign wire6 = (((wire1 ?
                         ((wire0 ^~ wire0) != (^wire1)) : $unsigned($unsigned(wire5))) ?
                     wire1[(2'h3):(2'h3)] : wire4) >= ((($unsigned(wire0) ?
                             wire5[(3'h4):(1'h0)] : $signed(wire5)) ?
                         ((wire5 + wire1) * wire3[(2'h3):(2'h2)]) : $unsigned((wire4 ?
                             wire0 : wire2))) ?
                     wire2[(4'h9):(2'h3)] : wire4[(4'he):(4'hb)]));
  always
    @(posedge clk) begin
      reg7 <= (~^((^~wire0) ?
          ($signed({wire6}) != $signed(wire4[(4'hf):(3'h4)])) : $signed($signed(wire6[(1'h1):(1'h1)]))));
      reg8 <= (~^wire1);
    end
  assign wire9 = wire0[(4'he):(3'h6)];
  assign wire10 = $unsigned($unsigned($signed(wire6)));
  assign wire11 = wire4;
  assign wire12 = {($signed($signed(wire6)) != {$signed($signed((8'hbf)))}),
                      (&(+$unsigned((wire11 ? reg7 : (8'hb6)))))};
endmodule
