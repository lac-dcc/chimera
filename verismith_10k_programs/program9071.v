module top #(parameter param10 = (7'h44)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire8, wire5, wire4, reg7, reg6, (1'h0)};
  assign wire4 = $signed($unsigned(wire0));
  assign wire5 = $unsigned(wire4[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg6 <= $signed({{($signed(wire4) ?
                  ((8'ha5) && wire2) : $unsigned(wire4))}});
      reg7 <= $signed((((~((8'haa) < wire3)) < $signed(wire2)) << {$unsigned($unsigned((8'hb1))),
          (~(8'hb0))}));
    end
  assign wire8 = wire0[(2'h2):(2'h2)];
  assign wire9 = wire3[(5'h13):(4'hf)];
endmodule
