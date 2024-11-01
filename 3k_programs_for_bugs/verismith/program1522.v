module top
#(parameter param23 = (((~|(((8'ha5) ? (8'hb2) : (8'ha0)) ? ((8'ha6) ? (8'hb4) : (8'hb2)) : ((8'hb4) ? (8'hb6) : (8'h9f)))) ? {{((8'had) ? (8'ha8) : (8'ha0))}, (((8'hbe) <= (8'h9d)) ? ((8'ha8) ? (8'hb3) : (8'h9f)) : ((8'ha9) ? (8'ha2) : (8'ha0)))} : (({(8'hb8), (8'ha8)} ? ((7'h42) ? (8'ha4) : (8'ha1)) : ((7'h43) < (8'hb2))) | ((+(8'ha4)) ? (8'hbe) : (~&(8'had))))) <<< (~^((((8'haa) ^~ (8'ha4)) <<< ((7'h42) != (8'hab))) ? (^((8'hae) ? (7'h42) : (8'hb0))) : (((7'h41) ? (8'hab) : (8'hb6)) ? ((8'had) ? (8'ha3) : (8'hb0)) : (^(8'hbc)))))), 
parameter param24 = ({(param23 ? ((param23 ? param23 : param23) ? (param23 ? param23 : param23) : (param23 + param23)) : {param23}), ({(&(8'hbe)), (+param23)} ? (param23 >>> ((8'h9e) >> param23)) : ({param23} ? (-(8'hac)) : (~param23)))} >>> (!((+(param23 > param23)) ? ((!param23) ? param23 : {param23}) : {{param23, param23}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire22, wire21, wire20, wire18, wire5, (1'h0)};
  assign wire5 = ($signed($unsigned(($signed(wire2) && wire3[(5'h12):(3'h7)]))) ?
                     $signed($signed(($signed(wire2) ^ $unsigned(wire3)))) : (8'haa));
  module6 #() modinst19 (wire18, clk, wire2, wire3, wire1, wire5);
  assign wire20 = ((+$signed({(wire18 ^ (8'haa)),
                      $signed((8'ha2))})) > {{(wire18 ^ (~^(8'ha5))),
                          wire1[(3'h7):(2'h3)]}});
  assign wire21 = $signed((~$signed(wire18[(3'h6):(3'h6)])));
  assign wire22 = $unsigned(wire2[(3'h4):(2'h2)]);
endmodule

module module6
#(parameter param17 = ((~&{((^(8'hae)) <<< {(8'ha5)}), ((!(8'hba)) ? ((8'hac) >> (8'hbd)) : (^(8'hb4)))}) ? (8'hb3) : ((+((&(8'h9f)) > ((8'ha5) ? (8'ha2) : (8'hb7)))) && (((8'hb4) ? ((8'ha5) ? (8'ha7) : (8'hb7)) : (+(7'h42))) ? (8'hbb) : (~((8'h9d) >= (8'hbb)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $signed($signed(wire9));
  assign wire12 = ({$unsigned($signed(wire8[(3'h4):(2'h2)]))} >= $unsigned((|wire9[(3'h4):(2'h2)])));
  assign wire13 = $signed((&wire7[(4'h8):(4'h8)]));
  assign wire14 = ($unsigned({($signed(wire10) ?
                          (^wire9) : (wire10 ?
                              wire9 : wire8))}) ~^ (!wire7[(3'h4):(1'h1)]));
  assign wire15 = (wire13 << wire11[(3'h4):(2'h2)]);
  assign wire16 = (wire14[(3'h4):(2'h3)] ?
                      (wire7[(3'h5):(1'h1)] << $unsigned((^~(wire11 + wire10)))) : wire9);
endmodule
