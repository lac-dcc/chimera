module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire9, wire6, wire5, reg8, reg7, (1'h0)};
  assign wire5 = wire2;
  assign wire6 = ($signed($signed($unsigned(wire5[(3'h5):(1'h1)]))) ?
                     ((^~(~^{wire2})) ?
                         ($unsigned((+wire1)) ?
                             (|wire0[(2'h2):(1'h0)]) : wire5[(1'h0):(1'h0)]) : wire2) : {wire2,
                         ($signed((~wire2)) <<< wire2[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      reg7 <= $unsigned($signed((~&$signed((wire1 ? wire6 : wire4)))));
      reg8 <= $unsigned((reg7 < ((wire1[(1'h1):(1'h0)] ?
          (~wire4) : (reg7 ? wire3 : wire6)) > $unsigned((wire2 || reg7)))));
    end
  assign wire9 = (~^(^~$unsigned((wire0[(3'h4):(3'h4)] ?
                     $unsigned(wire6) : wire5))));
  assign wire10 = (~$signed((reg7 ?
                      $signed((&(8'h9d))) : $unsigned(wire2[(2'h3):(2'h2)]))));
endmodule
