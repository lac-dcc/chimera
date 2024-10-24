module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  assign y = {wire9, wire8, wire7, wire6, wire5, reg12, reg11, reg10, (1'h0)};
  assign wire5 = $unsigned((wire4 >= wire1));
  assign wire6 = $unsigned($unsigned($unsigned(wire4)));
  assign wire7 = $signed(wire4[(3'h5):(1'h1)]);
  assign wire8 = wire2;
  assign wire9 = (~^($signed(wire7[(3'h4):(1'h1)]) >= $signed(wire4[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg10 <= {$unsigned((|wire0)),
          ($signed($unsigned((~^wire3))) ?
              wire1 : (wire3[(4'ha):(2'h3)] ?
                  {(~|(8'haf))} : ((wire8 ^ wire0) < wire1)))};
      reg11 <= (wire6 >> (((+(wire4 == (8'ha6))) || $signed((wire9 | wire8))) ?
          ($unsigned($unsigned(wire6)) ? (8'ha3) : wire9) : (!(8'ha0))));
      reg12 <= (~&((((wire1 <= wire9) | $unsigned(wire6)) - {{wire3,
              reg11}}) ^ wire8[(4'h8):(3'h6)]));
    end
endmodule
