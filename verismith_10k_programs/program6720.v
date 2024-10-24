module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
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
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire1 ?
          (wire0[(2'h3):(1'h1)] + (+wire1[(4'hf):(4'hb)])) : (wire3 ?
              wire3[(4'hd):(4'hb)] : (wire3 ^~ ((wire0 << (8'hbd)) ?
                  wire2[(1'h1):(1'h0)] : (wire2 ? wire3 : wire1)))));
      reg5 <= {$unsigned((reg4 < ((wire0 || wire1) ?
              $signed(reg4) : $signed((8'ha4)))))};
      reg6 <= wire2[(3'h4):(2'h2)];
    end
  assign wire7 = wire2[(2'h3):(1'h1)];
  assign wire8 = reg6;
  assign wire9 = wire1;
  assign wire10 = $signed($unsigned(wire0));
  assign wire11 = {($signed($signed($signed(wire3))) ?
                          (+reg5[(2'h3):(1'h0)]) : $signed((reg5[(2'h2):(1'h1)] ?
                              reg5[(1'h1):(1'h0)] : wire0[(4'hd):(3'h5)]))),
                      (^~wire10)};
  assign wire12 = wire10;
  assign wire13 = wire11[(4'h9):(4'h9)];
  assign wire14 = (wire1 ~^ wire12);
  assign wire15 = wire11;
  assign wire16 = wire11;
  assign wire17 = ($unsigned(wire15[(3'h5):(2'h3)]) != wire0[(2'h3):(1'h1)]);
  assign wire18 = wire2;
  assign wire19 = (wire18 ?
                      (~|({(wire9 != wire14)} ?
                          (wire2[(3'h4):(3'h4)] ?
                              (~^(8'ha2)) : (8'hbd)) : {(&wire1),
                              wire11[(2'h3):(2'h2)]})) : (~|(8'hbd)));
  assign wire20 = wire8[(3'h4):(1'h0)];
  assign wire21 = wire17[(3'h5):(1'h0)];
  assign wire22 = wire17[(3'h4):(3'h4)];
  assign wire23 = ((~^(((^~wire10) ?
                          (reg5 ?
                              wire7 : wire18) : reg4[(3'h4):(3'h4)]) & $unsigned($unsigned((8'h9e))))) ?
                      $signed((wire10[(4'h9):(2'h2)] + (^{wire3,
                          reg6}))) : (wire7 >= (({wire22,
                              (8'ha8)} == $unsigned(wire3)) ?
                          (~&wire15[(3'h7):(3'h6)]) : (-(wire20 ^ wire13)))));
  assign wire24 = $unsigned(wire23[(4'h8):(3'h4)]);
  assign wire25 = ({((((8'ha3) ^ (8'hbc)) >>> wire22[(5'h10):(4'h9)]) ?
                          (~&(!reg5)) : wire23[(4'hb):(3'h7)])} & reg6[(1'h0):(1'h0)]);
  assign wire26 = {(~|wire20[(3'h6):(1'h1)])};
endmodule
