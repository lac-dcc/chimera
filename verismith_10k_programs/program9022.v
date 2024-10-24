module top
#(parameter param21 = ((~(~|{{(8'ha5)}, {(8'h9c)}})) != (((+((8'ha0) ? (7'h44) : (8'haf))) >>> ({(8'hb4), (8'hbf)} ? ((8'ha5) > (8'hbb)) : ((7'h44) - (8'ha7)))) | (({(7'h44), (8'hac)} * (~&(8'h9d))) == (~^((8'hac) <<< (8'hab)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 (1'h0)};
  assign wire5 = $signed($signed({((^wire0) ?
                         (wire1 ? wire3 : wire1) : $signed(wire1)),
                     $signed((wire3 >>> wire1))}));
  assign wire6 = (-(^~$unsigned(((wire3 ? wire0 : wire5) + (&(8'hb3))))));
  assign wire7 = (&((((~^(8'ha7)) ?
                         $signed(wire5) : $signed(wire1)) & wire6[(4'h8):(3'h7)]) ?
                     (|($unsigned((8'hac)) == (wire1 <= (8'hb1)))) : (^~(~^(wire0 <= wire5)))));
  assign wire8 = {$signed($unsigned((wire6[(2'h3):(2'h2)] & $signed(wire7)))),
                     $unsigned({$signed((wire4 ? wire4 : wire7))})};
  assign wire9 = ((-(wire0[(1'h0):(1'h0)] & (wire7[(4'h8):(2'h2)] ^ (wire0 >> wire4)))) ?
                     wire0 : $unsigned((+wire3)));
  assign wire10 = (wire4[(3'h5):(1'h1)] || wire6);
  assign wire11 = wire3[(5'h10):(4'h9)];
  assign wire12 = (-(~&wire0));
  assign wire13 = wire10;
  assign wire14 = $signed(($signed(wire3) * wire1[(3'h6):(2'h3)]));
  assign wire15 = wire0[(3'h4):(1'h0)];
  assign wire16 = $unsigned($signed((~|$unsigned($signed(wire11)))));
  assign wire17 = wire2;
  assign wire18 = (-wire4);
  assign wire19 = wire5[(3'h5):(3'h4)];
  assign wire20 = $signed($signed(wire13));
endmodule
