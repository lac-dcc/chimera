module top
#(parameter param17 = (((^~((~|(8'hb3)) & (~|(8'ha6)))) && {(8'ha2), (((8'hb1) ? (8'h9d) : (8'h9e)) ? ((8'ha4) ? (8'hbf) : (8'h9e)) : ((8'hac) & (8'hbb)))}) ? (^((~|(8'haa)) * {(+(8'ha3))})) : (^~(-(((8'hb3) + (7'h42)) >= ((8'hb7) > (8'hb8)))))), 
parameter param18 = (!(8'ha6)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
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
  assign wire4 = ($signed(wire1) ? wire2 : $unsigned(wire0[(2'h3):(1'h0)]));
  assign wire5 = (wire4[(3'h4):(2'h2)] ?
                     $unsigned(((8'haa) || (^(wire2 || (8'ha5))))) : ($unsigned((-wire1)) >>> {((8'ha5) ?
                             $unsigned(wire4) : (&wire1))}));
  assign wire6 = $signed($signed($signed(((wire0 >> wire2) || ((8'hb3) ?
                     wire3 : wire5)))));
  assign wire7 = ((+(&wire0)) - wire6);
  assign wire8 = {{{$signed((wire3 ? (8'hb3) : wire3))}},
                     $unsigned(((wire1[(5'h14):(3'h5)] + $signed(wire1)) ?
                         {(wire7 && wire2),
                             (&wire3)} : ($signed(wire5) <= wire3[(1'h1):(1'h0)])))};
  assign wire9 = ($signed($unsigned(($unsigned(wire8) ?
                         $unsigned((8'ha0)) : (^(7'h44))))) ?
                     ($signed(((&wire6) ? wire0 : $signed(wire5))) ?
                         wire2 : $signed((wire2[(3'h7):(3'h5)] < (wire5 - wire5)))) : $signed((((~|wire4) >= wire3[(4'hb):(4'ha)]) ?
                         $signed($unsigned(wire8)) : {wire1, $signed(wire3)})));
  assign wire10 = {$unsigned(((wire6[(3'h4):(2'h3)] >>> $unsigned(wire3)) == (^~wire4[(4'h8):(3'h5)])))};
  assign wire11 = wire10[(1'h0):(1'h0)];
  assign wire12 = (~$signed(wire8[(1'h0):(1'h0)]));
  assign wire13 = wire11;
  assign wire14 = {$signed($signed(((wire13 ?
                          (8'hb6) : wire4) + $signed((7'h43))))),
                      $unsigned($signed($unsigned(((8'hb1) >> wire7))))};
  assign wire15 = ($signed((^~$unsigned(wire7))) == wire8[(4'ha):(2'h2)]);
  assign wire16 = (~^{$signed({(8'ha7)})});
endmodule
