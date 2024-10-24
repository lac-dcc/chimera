module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire8, wire7, wire6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire2[(1'h0):(1'h0)] ~^ $signed(((^~$unsigned((8'ha0))) ?
          wire3 : $signed((wire2 ? wire3 : (7'h40))))));
    end
  assign wire6 = ($signed((|(^~wire4))) ?
                     $signed((!$signed($unsigned(wire1)))) : (((~wire4) != $unsigned($signed(reg5))) ?
                         ($signed((wire4 == wire3)) & (~|wire1)) : (!(!$signed(reg5)))));
  assign wire7 = (+wire0);
  assign wire8 = $signed($signed({{(wire6 - wire3), (wire4 ? wire1 : wire0)},
                     {$signed(wire6)}}));
endmodule
