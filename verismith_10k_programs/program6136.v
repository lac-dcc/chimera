module top
#(parameter param10 = {(-{(!((8'hb6) ? (8'ha8) : (8'ha4))), {((8'hb8) ? (8'hbd) : (8'hb3))}})}, 
parameter param11 = (+{(^(8'hab)), param10}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0[(4'hd):(4'h8)];
  assign wire5 = (($unsigned(wire0[(1'h1):(1'h1)]) ?
                     wire4 : (|((~|wire0) ^~ {wire1,
                         wire0}))) != wire1[(3'h5):(2'h3)]);
  assign wire6 = (~&((wire1[(1'h0):(1'h0)] | $unsigned($signed((8'hb5)))) <<< $unsigned($signed($unsigned(wire2)))));
  assign wire7 = (^~wire0);
  assign wire8 = ((+{$unsigned(wire6)}) ?
                     {(~|wire0),
                         wire3[(4'hf):(3'h5)]} : $unsigned(($unsigned(wire0) ^~ $unsigned(wire0))));
  assign wire9 = $unsigned($unsigned({(wire0 ?
                         (wire0 ? wire1 : wire8) : {wire3}),
                     wire7}));
endmodule
