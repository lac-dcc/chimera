module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned((($signed($unsigned(wire0)) ?
                         wire1 : (&{wire1, wire0})) ?
                     wire0[(3'h6):(2'h3)] : $signed((!$signed(wire1)))));
  assign wire5 = ((+wire0) ?
                     wire1 : (wire2[(2'h2):(1'h1)] ? (~|wire2) : (8'hb7)));
  assign wire6 = $signed($signed($unsigned($unsigned((~&wire3)))));
  assign wire7 = $unsigned({$signed((+(^wire6))),
                     $signed((!(wire2 != wire5)))});
  assign wire8 = $signed((^~(~|((wire7 <= wire3) ?
                     (wire7 > wire0) : (~wire0)))));
  assign wire9 = ($signed((((wire5 || wire8) ?
                         {wire5, wire4} : $unsigned((8'h9c))) ?
                     $signed($signed(wire4)) : $unsigned({wire7}))) == $signed((({wire1,
                     wire6} == $unsigned(wire5)) | $unsigned(wire1))));
endmodule
