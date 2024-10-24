module top
#(parameter param21 = ((((((8'h9e) ? (8'hb8) : (8'hbb)) == ((8'ha4) ? (8'hb7) : (8'hae))) & (((8'had) ? (8'hb5) : (8'hbd)) ? ((8'ha8) ? (8'hae) : (8'hb8)) : ((8'ha0) ? (8'hba) : (8'ha6)))) < (8'hb7)) * ((((^~(8'ha2)) ? ((8'ha6) < (8'hb9)) : (+(8'hb8))) ? (~^((8'hb5) ^~ (8'h9f))) : (~&((8'hb3) >>> (8'hb6)))) * ((((8'ha0) ? (8'ha7) : (8'hbb)) << (+(8'hb0))) ? (((7'h44) + (8'h9f)) > ((8'hae) ~^ (8'hb5))) : (~^{(8'ha6)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 reg16,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire2[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= ($signed($signed((wire3[(1'h1):(1'h0)] ^ (wire5 <<< wire0)))) ?
          $signed(({{wire5}} ?
              $unsigned((^(8'hae))) : {((8'hbf) ?
                      wire5 : wire1)})) : $unsigned(wire1[(2'h2):(2'h2)]));
      reg7 <= (~^$unsigned((&(!wire0[(4'h9):(2'h2)]))));
      reg8 <= wire4;
      reg9 <= (^~(8'h9c));
    end
  assign wire10 = ((-$unsigned(wire3)) == reg9);
  assign wire11 = $unsigned($unsigned({$unsigned((reg8 << (8'h9c))),
                      $signed((wire1 ? wire10 : wire5))}));
  assign wire12 = $unsigned($signed($unsigned((wire10[(4'hb):(2'h3)] != {wire2}))));
  assign wire13 = ((reg6[(1'h1):(1'h1)] ?
                      wire0 : $unsigned(((reg7 ?
                          (8'hbe) : wire10) << $unsigned(reg6)))) == wire1);
  assign wire14 = $signed((({{wire11}, wire10} ? (&$signed(wire12)) : reg7) ?
                      (reg8[(2'h2):(1'h1)] ?
                          $signed(((8'hb4) ?
                              wire4 : (7'h42))) : (~&(!wire4))) : (!$unsigned($unsigned(wire12)))));
  assign wire15 = (&wire14);
  always
    @(posedge clk) begin
      reg16 <= ({reg7[(3'h5):(2'h2)]} ?
          $signed((~^wire12[(4'hd):(1'h1)])) : $signed($unsigned((wire1[(1'h1):(1'h1)] ?
              wire4[(3'h6):(2'h2)] : (wire13 >= reg6)))));
    end
  assign wire17 = (reg8[(4'h9):(4'h9)] ? wire12 : wire4[(2'h3):(1'h0)]);
  assign wire18 = wire0[(4'hb):(4'h8)];
  assign wire19 = ($signed($signed((reg16 >= wire5[(3'h6):(2'h2)]))) - ($signed((((8'haa) <<< reg7) >= (wire4 ?
                      (8'h9e) : reg16))) >>> wire11[(1'h0):(1'h0)]));
  assign wire20 = $signed($unsigned($unsigned((wire18 >> $signed(wire5)))));
endmodule
