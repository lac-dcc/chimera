module top
#(parameter param19 = ((8'hac) ? (^(({(8'hbe), (8'ha1)} ? ((8'hbe) < (8'ha0)) : (~^(8'hb3))) ? (+((8'hbb) ? (8'hac) : (8'h9d))) : (^((8'hb0) ? (8'hb5) : (7'h42))))) : ({({(7'h42)} <<< ((7'h41) ? (8'hbb) : (8'ha7))), (&((8'hb3) ~^ (8'hbb)))} ? {(((8'ha0) ? (8'hbe) : (8'h9c)) ? ((8'haa) && (8'ha5)) : (~&(8'hb0))), {((8'hb0) | (7'h43)), {(8'hbe), (8'hab)}}} : (8'hb3))), 
parameter param20 = (^{(((~|param19) ? (param19 | param19) : (^param19)) + (~^(param19 ^ param19))), (param19 | param19)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = wire3[(4'h8):(3'h6)];
  assign wire5 = wire2[(3'h5):(3'h4)];
  assign wire6 = $signed(((wire4 ?
                         (~|wire3[(4'h8):(3'h7)]) : $unsigned(wire0[(1'h1):(1'h0)])) ?
                     ((|$signed(wire3)) ?
                         $signed($unsigned(wire2)) : $signed((wire0 >>> wire0))) : $signed($signed(((8'hac) <<< wire5)))));
  assign wire7 = $unsigned($unsigned(wire1[(4'he):(1'h1)]));
  assign wire8 = wire7;
  assign wire9 = $unsigned(wire0);
  assign wire10 = (wire3 ?
                      wire3[(3'h6):(3'h6)] : ((~&(8'hb8)) <= (^~((wire8 ?
                          wire8 : (8'hb6)) | $unsigned(wire9)))));
  assign wire11 = wire0[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= $unsigned($unsigned(($unsigned((wire2 != wire3)) ?
          (~|wire11) : (8'hb6))));
      reg13 <= (!{$unsigned(($unsigned((8'hb8)) - (+(8'h9d)))),
          (~|(wire10[(4'ha):(4'h8)] ?
              wire11[(4'hf):(4'hb)] : $unsigned(reg12)))});
      reg14 <= {wire7[(3'h5):(1'h1)],
          $signed((~&(!((8'hb8) ? wire9 : wire1))))};
    end
  assign wire15 = $unsigned((^(wire11[(3'h5):(1'h0)] || (8'hbd))));
  assign wire16 = {((+((!wire1) >> ((8'hb9) ? (8'ha5) : (7'h41)))) ?
                          (-wire11) : (|wire0[(1'h1):(1'h0)])),
                      (wire0[(1'h0):(1'h0)] ?
                          wire8[(3'h4):(3'h4)] : $unsigned(wire8[(4'h9):(2'h2)]))};
  assign wire17 = (~|reg12);
  assign wire18 = $signed($signed((wire0[(3'h4):(2'h2)] ?
                      ((8'ha3) >> ((8'hb6) != wire6)) : wire7[(2'h2):(2'h2)])));
endmodule
