module top
#(parameter param10 = ((8'hb6) * {{(^(~(7'h41))), (-((8'ha4) ^ (8'h9f)))}, (((~^(8'ha3)) ~^ {(8'hbc), (8'hb0)}) ? (&((8'ha9) >> (8'hbe))) : ({(8'ha0)} ? {(8'hbe)} : ((8'hb9) ~^ (8'ha5))))}), 
parameter param11 = param10)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = $unsigned(wire3);
  always
    @(posedge clk) begin
      reg6 <= ((|wire1[(3'h6):(2'h3)]) ^~ $unsigned($unsigned(((8'ha8) < (+wire5)))));
    end
  assign wire7 = $unsigned($signed(wire5[(1'h0):(1'h0)]));
  assign wire8 = $signed(({{wire3, $signed(wire0)}, {(wire4 ? wire5 : wire0)}} ?
                     $unsigned((~^(+wire7))) : (((wire2 ?
                         wire3 : wire4) <<< ((8'hb9) && wire0)) | (wire5[(3'h5):(3'h5)] <<< wire4[(3'h6):(1'h1)]))));
  assign wire9 = (~wire7);
endmodule
