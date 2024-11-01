module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (((8'hb4) ? $signed((8'hb1)) : wire0) ?
                     $unsigned({wire3[(1'h0):(1'h0)]}) : (8'hb0));
  assign wire5 = ($unsigned(($unsigned($unsigned((8'hbb))) ?
                         $unsigned((~^wire2)) : wire4)) ?
                     ((wire3 ?
                         (^~wire1) : wire3) <= (^(~|(wire1 << wire2)))) : $signed(($unsigned((wire2 < (8'ha3))) ?
                         wire0 : wire2[(3'h7):(1'h1)])));
  assign wire6 = ($signed(wire5[(3'h5):(1'h0)]) ?
                     (&(&((-wire0) & (wire3 ?
                         wire5 : wire5)))) : wire2[(3'h6):(2'h3)]);
  assign wire7 = wire5;
  always
    @(posedge clk) begin
      reg8 <= {$signed(($unsigned((!wire5)) ~^ {(~&wire0), (wire1 ^ wire3)})),
          ($unsigned((((8'haa) > wire3) ?
              wire2[(4'hf):(4'ha)] : $signed(wire0))) || ((|(wire2 ?
                  wire3 : wire0)) ?
              (^wire5) : (+wire2)))};
      reg9 <= $signed((-$unsigned($unsigned(wire0))));
      reg10 <= wire2[(2'h2):(1'h1)];
      reg11 <= wire5;
      reg12 <= $signed(((!{(wire7 - reg10)}) != wire3));
    end
endmodule
