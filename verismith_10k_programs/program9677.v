module top
#(parameter param14 = ((~(((~(7'h40)) ? ((7'h44) ^~ (8'h9f)) : ((8'ha3) ^ (8'ha3))) ? (~^((8'hbb) * (8'ha7))) : (((8'h9f) ? (8'ha9) : (8'hb8)) & (^(8'ha4))))) + (^((((7'h44) ? (8'ha8) : (8'ha8)) ? ((8'hb3) ? (8'h9f) : (8'haa)) : ((8'haa) | (8'hbe))) | (~&((8'h9e) >= (8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = {(~|$unsigned(wire1[(3'h6):(1'h0)])),
                     ((!(wire3 ~^ wire0)) ?
                         wire0[(3'h4):(1'h0)] : (wire2 <= wire2))};
  assign wire5 = ($unsigned(wire0[(3'h4):(2'h3)]) ?
                     $signed($unsigned($unsigned((wire0 ?
                         wire4 : wire2)))) : ($unsigned((wire2[(4'hd):(3'h5)] ?
                             (wire4 & wire3) : $signed((8'haf)))) ?
                         {((wire2 ? wire0 : wire2) ?
                                 (!wire0) : $signed((8'hac))),
                             $unsigned($unsigned(wire4))} : (((wire1 ?
                                 wire3 : wire2) ?
                             $unsigned(wire1) : wire0[(1'h0):(1'h0)]) + (wire4 ~^ wire0))));
  assign wire6 = $unsigned(((^~wire5) ^ {((wire4 ? wire1 : wire4) ?
                         (wire3 >= (8'h9d)) : ((8'ha1) != wire5)),
                     {(^~wire5), wire2[(4'he):(4'hc)]}}));
  assign wire7 = {$signed((~&(&(|wire0)))),
                     ((({wire0, wire0} <<< $unsigned(wire1)) ?
                         $unsigned((+wire0)) : ({wire1} && wire4)) * ($unsigned((|wire3)) ?
                         ((8'hb5) ?
                             (!wire3) : $signed(wire2)) : $unsigned(wire0)))};
  assign wire8 = ({$unsigned((~&(wire4 - wire7)))} ?
                     $unsigned(wire1) : $unsigned(($signed((~&wire5)) > wire5)));
  assign wire9 = wire7[(3'h5):(2'h2)];
  assign wire10 = (~(7'h43));
  assign wire11 = (~^wire3[(3'h4):(3'h4)]);
  assign wire12 = (~wire9);
  assign wire13 = {(~(~wire0[(3'h5):(3'h4)])), wire3};
endmodule
