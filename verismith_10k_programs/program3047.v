module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire9, wire6, wire5, wire4, reg8, reg7, (1'h0)};
  assign wire4 = (wire2[(1'h1):(1'h0)] >= $signed((({wire3} ?
                     (wire0 == wire3) : {wire3}) | (~wire2))));
  assign wire5 = {((((&wire4) ? wire4 : $unsigned((8'h9f))) <<< ((~(8'hbb)) ?
                         wire3[(1'h1):(1'h0)] : (wire0 <<< wire1))) || $signed($unsigned(wire4))),
                     $unsigned(wire1)};
  assign wire6 = (+($signed($unsigned($unsigned(wire3))) >> {$unsigned({wire2,
                         wire3}),
                     $unsigned($signed((8'hbb)))}));
  always
    @(posedge clk) begin
      reg7 <= ((((wire0 && (^~wire6)) > {$signed(wire4), $signed((8'ha8))}) ?
              (($signed(wire2) ?
                  (~^wire1) : wire3[(3'h4):(2'h3)]) || (wire3 != wire3[(3'h4):(2'h3)])) : $signed(wire6)) ?
          wire4[(4'hb):(1'h0)] : ((^$unsigned((wire2 <<< (7'h44)))) ?
              wire0[(2'h3):(1'h0)] : {((wire2 ? wire0 : wire2) ?
                      wire0[(4'hd):(1'h0)] : ((8'hac) <<< wire4)),
                  (^~(wire4 ? wire2 : (8'hb8)))}));
      reg8 <= ($signed(wire1) <<< (&wire3));
    end
  assign wire9 = (^($signed(wire6[(4'h9):(2'h2)]) ^ $unsigned($signed(wire5[(4'hd):(3'h6)]))));
  assign wire10 = (wire3 >= $signed(({(wire1 | wire5),
                      $signed((8'ha9))} ~^ ((~|wire9) ?
                      (8'hbc) : $signed(wire5)))));
endmodule
