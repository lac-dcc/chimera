module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire40, wire39, wire38, wire36, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~&((~&($unsigned(wire3) > wire2)) ?
                     wire2[(4'he):(4'ha)] : $signed(wire3)));
  assign wire5 = (wire1[(3'h6):(3'h4)] ?
                     $unsigned(((wire4[(1'h0):(1'h0)] ? wire4 : wire2) ?
                         $unsigned($unsigned(wire4)) : $unsigned((wire1 < wire4)))) : $signed((wire0[(1'h0):(1'h0)] >= (~^(~&(8'ha6))))));
  assign wire6 = (((wire0[(1'h1):(1'h1)] < {(wire2 ^~ wire4)}) ?
                         wire2[(3'h7):(3'h6)] : (wire2[(3'h7):(2'h3)] ?
                             $signed(wire3) : wire5)) ?
                     wire2[(3'h4):(2'h3)] : wire4);
  module7 #() modinst37 (.wire11(wire4), .wire10(wire3), .clk(clk), .wire8(wire1), .wire9(wire2), .y(wire36));
  assign wire38 = $signed({$unsigned($unsigned(wire5)),
                      (wire2[(4'hd):(3'h6)] ?
                          {$signed(wire4)} : (~$unsigned(wire0)))});
  assign wire39 = {($signed(({wire38} ?
                          $signed(wire1) : wire5)) | $signed(($signed(wire3) ?
                          wire4[(1'h0):(1'h0)] : $unsigned(wire5)))),
                      $signed(($signed((wire38 ? (7'h43) : wire2)) ?
                          $signed($signed(wire6)) : wire5))};
  assign wire40 = $unsigned((wire4[(3'h4):(1'h0)] ?
                      wire0[(1'h1):(1'h1)] : ($signed(wire6) - wire6[(4'hf):(3'h6)])));
endmodule

module module7
#(parameter param34 = {(({((8'hb1) ? (8'ha6) : (8'h9c))} ? (((8'hb1) ? (7'h42) : (7'h44)) ? ((8'hb7) * (8'hb2)) : {(8'hbc), (8'had)}) : ((&(8'hb4)) ? (8'hab) : {(8'ha2), (8'hbf)})) ^~ (8'ha2)), ((^(((8'hbc) + (8'hb3)) ~^ ((8'hb3) ? (7'h44) : (8'ha5)))) + ((8'ha4) ? (((8'hb5) != (7'h42)) ? ((8'hbd) >= (8'hac)) : {(8'ha2)}) : {{(8'ha9)}}))}, 
parameter param35 = param34)
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire12 = (wire10[(4'h8):(4'h8)] * $signed($unsigned(({wire9,
                      wire8} + wire10))));
  assign wire13 = wire11[(5'h11):(2'h3)];
  assign wire14 = $signed(((~$signed((^wire9))) << wire10));
  assign wire15 = $signed($unsigned((wire12 ^~ $signed($signed(wire8)))));
  assign wire16 = (wire8 && $signed((wire12 ?
                      (8'hbc) : (~&(wire11 ? wire9 : (8'hbc))))));
  assign wire17 = (~(^(-wire13)));
  assign wire18 = ((^~wire16[(2'h3):(1'h1)]) || ($unsigned(wire9[(3'h7):(1'h1)]) && {((^wire8) ?
                          $unsigned(wire14) : wire11)}));
  always
    @(posedge clk) begin
      reg19 <= wire8;
      reg20 <= (~|($unsigned(wire12[(3'h6):(3'h5)]) ?
          $signed({wire18}) : (+$signed(wire15[(4'hc):(4'hb)]))));
      reg21 <= $signed($signed((~|{((7'h42) >= wire8)})));
    end
  always
    @(posedge clk) begin
      reg22 <= (|((!wire16) > $unsigned($signed((!wire18)))));
      reg23 <= reg22[(2'h3):(1'h0)];
      reg24 <= $signed(((wire10[(3'h5):(2'h3)] ?
          (reg22[(3'h6):(3'h4)] ?
              {wire9,
                  wire10} : (reg20 ~^ (8'had))) : (~&wire9[(1'h0):(1'h0)])) == wire17));
      reg25 <= (|$signed(((^~(+wire9)) >> $unsigned((~&wire18)))));
      reg26 <= ((&(7'h42)) & $unsigned(wire15));
    end
  assign wire27 = wire12;
  assign wire28 = wire15;
  always
    @(posedge clk) begin
      reg29 <= wire8[(1'h0):(1'h0)];
      reg30 <= (wire28 >>> (($unsigned(wire27) & (((8'ha9) ?
          (7'h43) : (8'hbb)) >>> wire18[(1'h1):(1'h0)])) != (~{$signed(wire9)})));
      reg31 <= reg26[(4'hc):(4'hb)];
      reg32 <= $unsigned((!(((reg25 < reg23) - reg30) ?
          (wire11[(4'hb):(2'h3)] || reg30[(2'h3):(1'h0)]) : ($unsigned(wire27) ?
              wire16 : (wire17 ? wire13 : reg23)))));
      reg33 <= ($signed($unsigned(reg22)) ?
          $signed((|(((8'hb4) <<< wire15) ?
              $signed(reg26) : wire8[(2'h2):(1'h1)]))) : reg21);
    end
endmodule
