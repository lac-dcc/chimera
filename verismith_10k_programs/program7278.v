module top
#(parameter param18 = (^((~&(((8'ha6) ? (8'hbf) : (8'hb8)) ? (~|(8'h9f)) : ((8'hb7) ? (8'had) : (7'h40)))) ? ((~|(^(8'hbc))) ? (((8'haf) || (8'h9e)) < ((8'ha9) ? (8'h9c) : (8'hb8))) : ((|(8'hb0)) <<< (^~(8'hab)))) : ((((8'hbd) ? (8'h9f) : (8'ha7)) + ((7'h40) >= (7'h40))) ^~ (~|((8'ha1) <<< (8'h9e)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (~|(((~(wire1 * wire1)) ?
                         ($signed((8'hb2)) ~^ wire1) : $signed((wire0 == wire3))) ?
                     (wire1[(2'h2):(1'h0)] > $unsigned({wire4})) : $unsigned((|wire3[(3'h7):(3'h6)]))));
  assign wire6 = wire3[(3'h6):(3'h6)];
  assign wire7 = ($unsigned((8'h9f)) ?
                     $signed($unsigned($signed($signed(wire2)))) : (&$signed(wire1[(1'h1):(1'h0)])));
  assign wire8 = wire2[(2'h2):(1'h1)];
  assign wire9 = (^$signed(wire4[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg10 <= {wire5};
      reg11 <= (8'hb2);
      reg12 <= (wire7 ?
          (wire3[(4'he):(3'h5)] ?
              (^((|wire5) ^ wire0)) : reg11) : (+($unsigned((~&wire1)) ?
              {$unsigned((8'ha2)), $unsigned(wire4)} : wire9)));
    end
  assign wire13 = reg12[(1'h0):(1'h0)];
  assign wire14 = $signed((wire5[(2'h3):(1'h1)] ?
                      reg10[(3'h4):(1'h1)] : ((|(reg10 ?
                          wire9 : wire9)) - ((wire6 ?
                          (8'hb4) : reg10) >>> (~wire8)))));
  assign wire15 = wire7;
  assign wire16 = $unsigned(wire5);
  assign wire17 = {(wire16 >> $unsigned((wire14 ?
                          ((8'hb4) << (8'hbb)) : (wire1 ? wire4 : wire1)))),
                      $signed({((~&reg12) ?
                              (wire9 ?
                                  (7'h43) : reg10) : wire4[(3'h4):(1'h1)])})};
endmodule
