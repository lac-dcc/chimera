module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire21, wire19, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($signed({$unsigned((wire2 || (8'hbf)))}) >= wire0);
  assign wire5 = ((~&(~(&(8'h9e)))) == $unsigned(wire2[(3'h5):(1'h1)]));
  assign wire6 = $unsigned($signed($signed(((wire0 != wire4) ?
                     (wire4 <= wire5) : (wire1 ? wire3 : wire1)))));
  module7 #() modinst20 (wire19, clk, wire6, wire5, wire4, wire0);
  assign wire21 = {(&{wire4[(3'h6):(3'h5)], wire1})};
endmodule

module module7
#(parameter param18 = ({((((8'hb8) ? (7'h42) : (7'h40)) * ((8'haa) & (8'haa))) ? (|(~(7'h43))) : (^~((8'ha1) ? (8'ha2) : (8'hbc))))} ^~ (((~(8'ha2)) + ((^(8'ha7)) ? (&(8'ha0)) : (-(8'ha3)))) ? (&(~((8'h9d) ? (8'hb7) : (8'hbd)))) : (+{((8'hb1) ? (8'hb4) : (8'h9f))}))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire17, wire16, wire15, reg14, reg13, reg12, (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= ((($unsigned(wire8) ?
              $signed(wire8) : (wire8 ?
                  ((8'ha0) ^ wire9) : $unsigned(wire8))) < wire11) ?
          $signed($unsigned(((wire10 ? (8'ha4) : (8'ha8)) ^ wire8))) : (8'h9d));
      reg13 <= (wire8 ?
          $unsigned(((8'hae) <= ((~^wire9) | $signed(reg12)))) : ((((8'ha3) ?
                      reg12 : (wire11 ? wire10 : (8'ha3))) ?
                  ((reg12 < wire10) ?
                      (~^(8'had)) : wire11) : (reg12[(1'h0):(1'h0)] ?
                      (~reg12) : (wire11 ? wire11 : wire10))) ?
              $unsigned(((wire9 >>> wire8) ?
                  (&wire11) : wire8)) : wire10[(4'h8):(1'h0)]));
      reg14 <= (wire11 ?
          {wire11} : (~&(~(((8'ha8) || wire8) ? (wire9 - wire10) : wire11))));
    end
  assign wire15 = $signed(reg12[(3'h5):(1'h0)]);
  assign wire16 = $signed((~&((8'hb5) ?
                      $unsigned((wire9 ~^ (8'ha4))) : wire10[(2'h3):(2'h2)])));
  assign wire17 = ((reg12 << ({$unsigned(wire11)} < (^~(wire16 ?
                          reg14 : wire16)))) ?
                      $signed(wire9) : ((^($signed(wire15) ^ $signed(wire9))) ?
                          wire15[(2'h2):(2'h2)] : (7'h44)));
endmodule
