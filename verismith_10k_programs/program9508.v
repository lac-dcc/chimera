module top
#(parameter param12 = (^{((~|((8'h9c) ? (7'h44) : (8'ha7))) + (~&{(7'h43), (8'h9f)}))}), 
parameter param13 = (!{(8'hb1), ((~|(|param12)) >>> param12)}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire10, wire9, wire8, reg7, reg6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {(8'ha3),
          ($unsigned(($signed(wire3) ?
              (wire2 >>> wire0) : wire4)) ^~ $signed({((8'ha5) ?
                  wire4 : wire3)}))};
      reg6 <= wire1;
      reg7 <= ((!(!((wire2 ?
          wire1 : reg5) <<< (^~wire1)))) ^~ {(~^(~^$unsigned(wire3))),
          ($unsigned({wire0}) <= (wire0[(5'h11):(5'h11)] * (wire1 ?
              wire1 : wire2)))});
    end
  assign wire8 = $unsigned($unsigned((-(wire1[(3'h5):(2'h3)] >>> (wire2 ?
                     wire0 : wire2)))));
  assign wire9 = $signed(reg7[(5'h11):(3'h4)]);
  assign wire10 = $signed($unsigned((reg5 ? wire3 : wire1[(4'ha):(3'h7)])));
  assign wire11 = (8'h9f);
endmodule
