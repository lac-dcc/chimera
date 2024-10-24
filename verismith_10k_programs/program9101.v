module top
#(parameter param13 = {{{(((8'h9c) ? (8'ha3) : (8'hb8)) <= ((8'hb8) * (7'h44))), ({(8'had)} ~^ ((7'h44) < (7'h43)))}, ((~|{(8'hae)}) ? (((8'h9c) ? (7'h43) : (8'ha0)) ? ((8'hb5) ? (8'hbd) : (8'hbd)) : (~&(8'hba))) : (8'hbd))}, (-((-(^~(8'h9f))) ? (^(~^(8'ha1))) : ({(7'h42), (8'hac)} ? ((8'ha6) & (8'hb0)) : ((8'hb7) & (8'had)))))}, 
parameter param14 = param13)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ((~((~&$signed(wire1)) > $signed((wire2 ?
                     wire4 : wire1)))) || $unsigned($unsigned($signed($unsigned(wire4)))));
  assign wire6 = ($unsigned(wire4[(2'h3):(2'h3)]) ?
                     wire2 : $signed(wire3[(3'h5):(2'h3)]));
  assign wire7 = (|(|((&$unsigned(wire4)) ^~ wire2)));
  assign wire8 = (!$signed((8'hb0)));
  assign wire9 = ({(wire1[(2'h2):(1'h0)] > wire3[(1'h0):(1'h0)]),
                     wire8} >>> $signed($unsigned({wire7,
                     wire1[(3'h6):(2'h3)]})));
  assign wire10 = {$signed(($unsigned(wire2[(5'h10):(1'h0)]) - ((~&wire6) ?
                          (^wire7) : (~wire0))))};
  assign wire11 = ($unsigned($unsigned(wire1)) | wire5[(3'h5):(3'h4)]);
  assign wire12 = ($signed(wire1) - $unsigned($unsigned((wire3[(2'h2):(1'h0)] ?
                      ((8'ha3) ? wire6 : wire10) : (wire7 ? wire0 : wire4)))));
endmodule
