module top
#(parameter param11 = (({(!(~^(8'had)))} >= (~|((!(8'hbe)) * ((7'h44) == (8'haf))))) <= ((+{{(8'ha4)}}) ^ {(!(~(8'ha4)))})), 
parameter param12 = (8'hbf))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, reg6, reg5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire3))
        begin
          reg4 <= wire1[(3'h7):(3'h6)];
          reg5 <= $signed((wire0[(1'h0):(1'h0)] & wire2[(1'h1):(1'h0)]));
          reg6 <= wire0[(2'h2):(2'h2)];
        end
      else
        begin
          reg4 <= (^~$unsigned(($signed(wire1[(4'h8):(1'h1)]) == (reg6 ~^ $unsigned(reg6)))));
        end
    end
  assign wire7 = reg4;
  assign wire8 = reg4[(3'h7):(1'h0)];
  assign wire9 = (($unsigned((reg5[(4'hb):(3'h5)] ?
                         $signed(wire2) : (wire8 | wire8))) ?
                     (-$signed(wire7[(3'h4):(2'h2)])) : ($unsigned((&wire1)) ~^ (((8'hb0) * wire1) * $unsigned(wire1)))) ^ (8'hb0));
  assign wire10 = (|$signed(wire0[(1'h1):(1'h0)]));
endmodule
