module top
#(parameter param13 = (~|((((~|(8'ha8)) ? (-(8'hbe)) : ((8'hb5) ? (8'haa) : (8'ha0))) <<< (^~((8'had) ? (8'h9f) : (8'hbb)))) ? (&{((8'ha0) ? (8'haf) : (8'hb6)), ((8'hbc) ? (7'h41) : (8'hbf))}) : (&({(8'hab), (8'h9d)} ? ((8'ha7) < (8'hb2)) : (~|(7'h44)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire1[(3'h4):(3'h4)];
  assign wire6 = $signed($signed(wire1[(3'h6):(2'h2)]));
  assign wire7 = {$signed((~$signed((wire4 ? wire1 : wire0)))), wire1};
  assign wire8 = $unsigned($unsigned(wire7));
  assign wire9 = wire4;
  assign wire10 = $unsigned($signed((^$signed((|wire6)))));
  assign wire11 = wire2[(4'ha):(4'h8)];
  assign wire12 = ($signed($signed($signed(wire7[(5'h10):(4'hd)]))) ?
                      $signed((wire0[(2'h2):(1'h1)] ?
                          (-wire7[(4'h8):(2'h2)]) : $signed($signed(wire1)))) : wire1);
endmodule
