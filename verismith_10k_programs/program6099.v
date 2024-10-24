module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned((wire2 ?
                     $signed(wire0) : (((^~wire2) ?
                         (wire2 ?
                             wire0 : wire0) : wire3[(3'h5):(3'h5)]) + (+((7'h41) >>> wire0)))));
  assign wire5 = $signed(wire1);
  assign wire6 = ((($signed((wire3 ^ (8'hac))) ?
                         (&wire0) : ($unsigned(wire0) <= $unsigned(wire5))) ?
                     $unsigned((!$signed(wire4))) : (|$unsigned(wire0[(1'h1):(1'h0)]))) < (!(((8'h9d) ^~ {wire0,
                         wire5}) ?
                     (((8'hbd) - wire4) ?
                         wire3[(2'h3):(1'h1)] : (|(8'hb9))) : $signed($signed(wire0)))));
  assign wire7 = $signed((((~&(^wire0)) ?
                     (7'h43) : (wire5 ?
                         (^wire6) : (&(8'hba)))) * wire5[(1'h1):(1'h0)]));
  assign wire8 = $unsigned(wire5[(2'h2):(2'h2)]);
  assign wire9 = {$signed(wire6[(3'h4):(2'h2)])};
  assign wire10 = (({(+(wire0 ? wire8 : wire2))} ?
                      (8'hbd) : (~($unsigned(wire4) ?
                          (wire9 ?
                              wire7 : wire6) : (&wire1)))) >> (wire9 >> $unsigned({$unsigned(wire8)})));
endmodule
