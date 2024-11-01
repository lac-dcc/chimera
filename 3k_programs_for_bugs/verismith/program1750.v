module top
#(parameter param24 = (~^{(((~|(8'ha8)) ? (|(8'hb8)) : ((8'ha1) ? (8'ha6) : (8'hbb))) ? (&((8'ha6) == (8'ha9))) : (((8'hb4) ? (8'haa) : (8'hbc)) < ((8'hb8) >> (8'ha1)))), (({(8'hac)} ? ((8'hb7) ? (8'hb0) : (8'hbd)) : ((8'h9d) << (8'h9f))) ? (((8'haf) ? (8'ha4) : (8'hb3)) - (8'hb1)) : ({(8'hb0), (8'haf)} ? ((8'ha6) ? (8'hb5) : (8'hb9)) : ((8'ha4) * (7'h43))))}), 
parameter param25 = {{(-(8'ha7))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (($unsigned(((&wire1) & $signed(wire2))) ?
              $unsigned(wire3) : $signed((wire0[(3'h7):(3'h5)] ?
                  $unsigned(wire0) : $unsigned(wire0)))) ?
          (^wire1) : wire2);
      reg5 <= $signed(((&$signed($unsigned(wire3))) == $unsigned(($signed(wire0) >= ((8'ha8) != (8'hbe))))));
      reg6 <= reg4[(5'h13):(5'h10)];
      reg7 <= $unsigned({$signed((wire0 ? $signed(reg6) : {reg4, wire2}))});
    end
  always
    @(posedge clk) begin
      reg8 <= $unsigned((~&($signed((|wire0)) ?
          $signed(wire1) : (~&reg4[(1'h0):(1'h0)]))));
      reg9 <= reg7[(3'h7):(1'h0)];
      reg10 <= (~&wire1);
      reg11 <= (^reg4[(1'h1):(1'h0)]);
      reg12 <= (~&($unsigned(($signed(reg5) <= (reg9 ? (7'h43) : reg10))) ?
          wire1[(1'h0):(1'h0)] : (reg10 ?
              (((8'ha1) > reg10) == reg7[(3'h4):(1'h1)]) : wire2[(4'h8):(4'h8)])));
    end
  assign wire13 = (~^(($signed(reg11) + reg9) ?
                      $signed(reg10) : {((^wire0) ?
                              reg8[(3'h7):(2'h3)] : reg7[(3'h4):(2'h2)]),
                          ($signed((7'h43)) ?
                              (wire1 ? reg4 : wire3) : (wire3 ?
                                  reg9 : reg8))}));
  assign wire14 = (^~(|$signed($signed({reg10, wire0}))));
  assign wire15 = reg8;
  assign wire16 = $unsigned($unsigned({{(~&reg5)}, wire2[(2'h3):(1'h0)]}));
  assign wire17 = $signed(((wire1[(2'h2):(1'h0)] ?
                          (8'hb9) : $signed((-wire13))) ?
                      $unsigned($unsigned((wire13 >= reg9))) : wire1[(3'h7):(3'h7)]));
  assign wire18 = (8'ha3);
  assign wire19 = $unsigned(($unsigned($signed($unsigned(wire1))) ?
                      $signed(({wire15, reg11} * (reg9 && reg6))) : (^wire0)));
  assign wire20 = (&reg5);
  assign wire21 = (((~&$unsigned(reg12[(3'h6):(1'h1)])) ?
                          {$unsigned($unsigned(reg7)),
                              wire2} : (reg11 != (reg11[(2'h2):(1'h1)] ?
                              (|(8'ha2)) : ((8'ha5) || wire1)))) ?
                      wire3[(2'h3):(2'h2)] : (^~({$unsigned(reg12),
                              $signed(wire3)} ?
                          (+wire0[(2'h2):(1'h0)]) : (((8'h9f) ?
                                  (8'hb9) : wire1) ?
                              $unsigned(reg4) : wire18))));
  assign wire22 = reg6[(3'h5):(3'h5)];
  assign wire23 = $unsigned(reg9);
endmodule
