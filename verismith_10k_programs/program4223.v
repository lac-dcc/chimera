module top
#(parameter param21 = ({(&(-((8'ha4) ? (8'ha0) : (8'haa)))), (((~&(8'hbf)) != ((8'hac) ^ (8'haf))) << (8'ha5))} - {({((8'hb1) << (7'h41)), {(8'haa)}} <= (((8'ha9) ^ (8'hb1)) >= (&(8'hb7)))), (8'hbb)}), 
parameter param22 = param21)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  assign y = {wire19,
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
                 wire4,
                 reg20,
                 (1'h0)};
  assign wire4 = {{(wire3[(4'hd):(4'ha)] ?
                             wire3[(4'h9):(3'h5)] : ({wire3} ?
                                 wire2 : $unsigned(wire2))),
                         wire0}};
  assign wire5 = wire2;
  assign wire6 = ($unsigned(((&(wire5 ~^ wire2)) ~^ wire2)) ? wire5 : wire5);
  assign wire7 = wire2[(1'h1):(1'h0)];
  assign wire8 = $unsigned(wire5[(3'h5):(3'h5)]);
  assign wire9 = wire6;
  assign wire10 = (|(^{$unsigned($unsigned(wire3))}));
  assign wire11 = (~{(!((wire1 << wire0) >> wire10))});
  assign wire12 = wire8[(4'ha):(3'h4)];
  assign wire13 = $unsigned(wire0[(2'h2):(1'h1)]);
  assign wire14 = ({((~&wire3[(3'h5):(3'h5)]) - $signed(wire7)),
                          wire4[(4'hd):(4'hd)]} ?
                      wire6[(3'h4):(1'h1)] : $unsigned((^~$signed((&wire13)))));
  assign wire15 = ((($unsigned(wire11) ?
                      (-wire2) : ($unsigned(wire14) ~^ wire9[(4'hd):(2'h3)])) * wire10[(4'ha):(3'h7)]) ~^ $unsigned((wire11[(2'h3):(2'h3)] ?
                      ((-wire9) ^ {wire11, wire14}) : wire13[(3'h5):(1'h1)])));
  assign wire16 = wire6[(1'h0):(1'h0)];
  assign wire17 = {$unsigned(($signed($unsigned((7'h43))) ?
                          $unsigned((wire2 != wire8)) : $unsigned((wire8 ?
                              wire3 : wire6)))),
                      wire12};
  assign wire18 = $unsigned(wire7[(3'h5):(3'h4)]);
  assign wire19 = $unsigned($unsigned(wire2));
  always
    @(posedge clk) begin
      reg20 <= {wire3};
    end
endmodule
