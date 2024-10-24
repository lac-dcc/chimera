module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire11, wire6, wire5, reg10, reg9, reg8, reg7, (1'h0)};
  assign wire5 = {(wire4 ?
                         (wire1 ^ ($unsigned(wire1) && wire4[(4'he):(3'h6)])) : (wire4[(4'hf):(2'h2)] < $unsigned($unsigned(wire4)))),
                     ($signed((~|(wire2 * wire4))) ?
                         ({(~^wire4), wire3[(1'h0):(1'h0)]} ^~ ((wire1 ?
                                 (8'hb1) : wire2) ?
                             $signed(wire2) : (wire2 ?
                                 wire0 : wire1))) : wire4)};
  assign wire6 = ((($signed((wire5 ? wire4 : (8'ha5))) ?
                             wire1[(3'h7):(3'h5)] : (((7'h40) ?
                                 wire1 : wire2) ~^ (wire5 && wire1))) ?
                         ($signed($signed((8'ha8))) ?
                             (~^$unsigned(wire4)) : {(wire4 <= wire5)}) : wire2) ?
                     wire5 : wire5[(4'hd):(1'h1)]);
  always
    @(posedge clk) begin
      reg7 <= $signed($unsigned({wire3, wire5[(4'hc):(2'h3)]}));
      reg8 <= $signed(((-(~|$unsigned(wire0))) ?
          ((wire1 == $unsigned((8'ha4))) == (&$unsigned((8'h9e)))) : $signed(wire6[(1'h0):(1'h0)])));
      reg9 <= (~|$unsigned(($unsigned((^~wire6)) ^ (wire6 > $signed(wire5)))));
      reg10 <= ((~^(~|(&{wire0, wire0}))) >= (~^({(&wire0),
              reg8[(3'h6):(2'h3)]} ?
          $signed((wire6 ? wire1 : wire4)) : wire5[(4'hb):(4'h8)])));
    end
  assign wire11 = wire2[(3'h6):(3'h4)];
endmodule
