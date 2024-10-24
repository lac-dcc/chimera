module top
#(parameter param24 = (|((8'had) ? {{(&(8'ha7))}} : (8'ha9))), 
parameter param25 = param24)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
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
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = (wire1 ?
                     wire1[(3'h6):(2'h3)] : ((^{wire1[(3'h6):(1'h1)],
                             (8'had)}) ?
                         $signed(wire1[(1'h1):(1'h0)]) : $unsigned(((&(8'hbf)) ?
                             wire3[(1'h1):(1'h1)] : (wire2 ? wire3 : wire0)))));
  assign wire5 = ($unsigned(((^~(wire2 ? wire0 : (8'hab))) ?
                     ($unsigned(wire1) ?
                         wire0 : wire1) : wire1[(3'h7):(3'h5)])) + wire0);
  assign wire6 = $signed($unsigned(wire4[(4'hf):(2'h2)]));
  assign wire7 = $signed($unsigned($unsigned($signed((~^wire5)))));
  assign wire8 = $signed($unsigned((wire1 < {wire3[(2'h3):(1'h0)],
                     $signed(wire2)})));
  assign wire9 = (+$unsigned((wire1 < (|((8'hbb) != wire1)))));
  always
    @(posedge clk) begin
      reg10 <= (wire5[(3'h7):(1'h0)] <= wire4[(4'hb):(3'h5)]);
      reg11 <= $unsigned(wire7);
      reg12 <= $unsigned($unsigned($signed((wire2 | (~wire7)))));
      reg13 <= ((({(wire1 ? wire5 : wire0), (^wire5)} + ((reg11 ?
                      (8'hbb) : wire6) ?
                  $unsigned(wire2) : {wire8, wire6})) ?
              (wire0[(3'h6):(3'h4)] ?
                  ((wire4 ? wire1 : (8'ha1)) ?
                      wire2 : $unsigned(wire1)) : wire1[(3'h6):(3'h6)]) : wire8[(1'h1):(1'h1)]) ?
          wire3[(2'h3):(1'h0)] : wire4);
    end
  assign wire14 = wire8;
  assign wire15 = {wire5[(3'h7):(2'h3)]};
  assign wire16 = $unsigned(reg12);
  assign wire17 = ((((reg10[(4'hb):(4'h8)] >> (wire14 * reg11)) ?
                          ($unsigned((8'hbc)) || wire0) : ({wire3} << reg12[(4'he):(2'h3)])) ?
                      $unsigned($unsigned((wire8 <<< (8'hbe)))) : (-wire6)) <= $signed((wire0[(4'hf):(3'h4)] ?
                      wire1 : ((~^wire1) ^ {wire8}))));
  assign wire18 = $unsigned(((^({wire7, reg11} ?
                      wire8[(2'h2):(1'h0)] : wire3)) ^ wire5));
  assign wire19 = $signed(($signed((~|{wire17, reg12})) >>> wire18));
  assign wire20 = (~($unsigned($signed($unsigned(wire17))) >> wire5));
  assign wire21 = {(wire18[(2'h3):(1'h1)] > wire2),
                      {{$unsigned(wire18[(3'h5):(3'h4)])},
                          wire9[(1'h1):(1'h1)]}};
  assign wire22 = $unsigned($unsigned($signed(wire21)));
  assign wire23 = wire1;
endmodule
