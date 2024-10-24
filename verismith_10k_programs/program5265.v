module top
#(parameter param11 = (~^(^~({(-(8'had)), (!(7'h43))} ? (((8'h9f) ? (8'hb3) : (8'ha8)) != ((8'hb1) + (8'ha2))) : (~(+(8'hb3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (&$signed($unsigned($unsigned((~(8'h9e))))));
    end
  assign wire6 = wire1[(2'h2):(2'h2)];
  assign wire7 = (wire3[(4'hf):(4'hc)] <= (^wire0));
  assign wire8 = wire6[(1'h1):(1'h1)];
  assign wire9 = wire3;
  assign wire10 = (wire7 ?
                      $unsigned($signed($signed(wire2[(2'h3):(2'h3)]))) : (7'h41));
endmodule
