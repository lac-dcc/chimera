module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned((((wire1 ? wire1 : wire3) ?
                         $signed(wire3) : $signed(wire3)) ?
                     ((wire3 >> (8'h9c)) ?
                         wire0[(3'h5):(3'h5)] : wire3) : $unsigned($signed(wire1)))));
  assign wire5 = (wire3[(3'h6):(1'h1)] ~^ ({((wire4 ?
                             wire4 : (8'hac)) == wire2)} ?
                     wire1[(3'h7):(1'h1)] : $unsigned(wire0[(3'h6):(1'h0)])));
  assign wire6 = wire0;
  assign wire7 = {((wire0[(3'h4):(1'h0)] ?
                             $unsigned($unsigned(wire4)) : wire5) ?
                         $unsigned(((+wire5) - (wire4 > wire5))) : $signed((wire6[(4'h8):(3'h7)] ?
                             (~^wire3) : (wire5 ? wire5 : (8'h9f)))))};
  assign wire8 = ({(~^$unsigned(wire4))} ~^ wire7);
  assign wire9 = ({$unsigned(wire3)} ?
                     wire6 : ($signed($signed(wire6)) ?
                         wire5 : (wire4 << $unsigned((^~wire5)))));
endmodule
