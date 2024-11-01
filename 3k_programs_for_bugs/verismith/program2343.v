module top
#(parameter param20 = (((-{((8'hb5) != (8'h9f)), ((7'h42) >> (8'hb7))}) ? ((((8'ha7) ? (8'hab) : (8'ha4)) ? ((8'haa) > (8'hb0)) : ((8'hb5) ? (8'ha3) : (7'h42))) ? (+{(8'h9e), (8'hb7)}) : ((~(8'ha2)) ? ((8'ha6) ? (8'hb9) : (8'h9f)) : ((8'haf) >>> (8'hb4)))) : {(((8'ha9) == (8'hbf)) ? (~(8'hb0)) : {(8'ha6), (8'ha8)})}) || ((({(8'ha9)} ? ((8'hae) > (8'haf)) : (&(7'h41))) ? (((8'hac) ^ (8'hb0)) >>> (-(8'ha1))) : (~|((8'ha3) ? (8'ha6) : (8'ha8)))) ? {(^~(&(8'hb0)))} : (+(((8'hac) ? (8'ha9) : (8'hbd)) ? ((8'hbf) ? (8'h9c) : (8'ha6)) : (~|(8'hb3)))))), 
parameter param21 = (((((param20 ^ param20) | (param20 && param20)) - param20) ^ ((param20 ? (param20 && param20) : param20) ? (((8'ha0) == param20) ? (param20 ? param20 : param20) : param20) : (!(param20 + (8'ha9))))) <= {param20}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = wire2;
  assign wire6 = (wire2 && {((^$signed((8'hb7))) <= wire5[(1'h0):(1'h0)])});
  assign wire7 = (wire5 ?
                     (8'h9d) : (wire5[(4'ha):(4'ha)] ?
                         {wire5[(5'h11):(2'h2)]} : ((wire5 + (wire6 ?
                             wire0 : (7'h40))) && ($signed(wire6) + (wire5 ?
                             wire4 : wire3)))));
  assign wire8 = ($signed($signed(wire6[(3'h7):(3'h5)])) ?
                     ($unsigned({$unsigned(wire1),
                         (^~wire2)}) ^~ ((|((8'hb6) && wire4)) ?
                         $signed(wire5[(4'hf):(2'h2)]) : ($signed(wire4) ?
                             (~&wire0) : $unsigned((7'h44))))) : ((8'ha3) >>> wire1));
  assign wire9 = ((wire8[(3'h4):(3'h4)] >> $signed(($unsigned((8'hb0)) ?
                     {(8'hbe)} : (wire0 ?
                         wire3 : wire5)))) <= (($signed(wire4[(3'h5):(2'h2)]) >> $signed((wire0 ?
                     wire1 : wire5))) ^~ (~(8'hb3))));
  always
    @(posedge clk) begin
      reg10 <= $signed((~$unsigned(wire0)));
      reg11 <= $unsigned(($unsigned($signed(wire8)) >= (reg10[(3'h6):(1'h1)] >>> $unsigned(wire6[(5'h10):(1'h1)]))));
    end
  assign wire12 = reg10;
  assign wire13 = reg11[(4'ha):(2'h2)];
  assign wire14 = ($unsigned(wire8[(3'h5):(3'h4)]) ~^ $signed($signed((((8'hac) ?
                          (8'ha0) : wire5) ?
                      (wire3 ^~ wire8) : $unsigned((8'hac))))));
  assign wire15 = $unsigned($unsigned(wire3[(2'h3):(2'h2)]));
  assign wire16 = $unsigned(((!($unsigned((8'haf)) ~^ ((8'hbb) ^~ reg10))) - (+wire15[(3'h5):(3'h5)])));
  assign wire17 = wire13;
  assign wire18 = wire6[(5'h13):(5'h12)];
  assign wire19 = ($unsigned(wire5) ^ ((&wire15) ?
                      {$signed($unsigned(wire14)),
                          $signed(((8'hb0) ?
                              (8'hbf) : wire5))} : wire6[(5'h12):(3'h4)]));
endmodule
