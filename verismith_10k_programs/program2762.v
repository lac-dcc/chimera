module top
#(parameter param10 = ({(~(((8'hb7) ? (8'hb3) : (8'hb5)) ? ((8'hb9) ? (8'hbc) : (8'hbf)) : ((8'ha1) > (8'hb9))))} ? (((~|(8'hab)) ^ ({(8'h9d)} ? (~|(8'hae)) : ((8'hb4) - (8'hb9)))) && ((((7'h40) >>> (8'hbb)) * ((8'hbe) ^~ (8'h9e))) ? ({(8'hb5), (8'h9e)} * (^(8'hae))) : (!(~^(8'ha7))))) : {((^~(|(8'hbe))) - (((8'haa) ? (8'h9f) : (7'h42)) | {(8'haa)})), ((~^((8'ha3) ? (8'ha8) : (8'hb4))) - ((8'hb8) & ((8'haf) || (8'hbc))))}), 
parameter param11 = ((~param10) ? param10 : param10))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(4'hc):(3'h6)];
  assign wire5 = $unsigned({(^wire2),
                     ((wire3[(4'hf):(1'h0)] == {wire1,
                         wire3}) >= $unsigned($unsigned(wire3)))});
  assign wire6 = wire3;
  assign wire7 = $signed((-{$signed((wire0 ? wire0 : wire2)),
                     $unsigned(((8'ha2) ^ wire5))}));
  assign wire8 = wire0;
  assign wire9 = (~&wire8);
endmodule
