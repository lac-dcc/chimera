module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire6, wire5, wire4, reg9, reg8, reg7, (1'h0)};
  assign wire4 = $unsigned((^(|(&wire3))));
  assign wire5 = wire3[(3'h4):(3'h4)];
  assign wire6 = ($signed($signed($signed((+wire0)))) << wire5);
  always
    @(posedge clk) begin
      reg7 <= $signed(({$signed($signed((7'h44))),
          ($unsigned((7'h44)) ?
              (wire3 ? wire6 : wire2) : $unsigned(wire3))} <= (8'h9e)));
      reg8 <= wire4[(3'h7):(3'h5)];
      reg9 <= {$unsigned($unsigned($unsigned({reg7, wire0})))};
    end
  assign wire10 = wire2;
endmodule
