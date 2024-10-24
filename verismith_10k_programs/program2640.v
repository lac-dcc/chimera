module top
#(parameter param24 = (^~(&{(((8'ha4) >= (8'hb5)) || {(8'hb0)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
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
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed(({((wire2 - wire2) ?
                         wire1[(1'h1):(1'h0)] : wire0)} <<< ((!$unsigned(wire1)) != $unsigned(wire2))));
  assign wire6 = wire1[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= $unsigned({{$signed($unsigned(wire1))},
          $unsigned($unsigned((~&wire6)))});
      reg8 <= (~&(($unsigned(wire6[(4'h9):(2'h3)]) ?
          $signed((~|wire2)) : (reg7 ?
              (+reg7) : $unsigned(reg7))) * {$unsigned((8'hb2)), {(!wire2)}}));
      reg9 <= (~&wire1);
      reg10 <= (wire1 ?
          {wire0[(3'h5):(1'h0)],
              wire3} : ((reg9[(3'h4):(2'h3)] ^~ (((8'hbb) ~^ wire1) > {reg8,
              reg8})) != ($signed(wire0[(3'h4):(1'h0)]) ?
              (~^(wire6 ?
                  wire1 : reg7)) : ($unsigned(wire2) <= $signed(wire6)))));
    end
  assign wire11 = wire3[(1'h1):(1'h1)];
  assign wire12 = (8'hba);
  assign wire13 = wire0[(1'h0):(1'h0)];
  assign wire14 = (~|wire5);
  assign wire15 = ((^~wire3[(1'h0):(1'h0)]) || ({((&reg7) ?
                              (wire6 << (8'ha8)) : reg9[(4'h8):(1'h0)])} ?
                      (|wire13[(2'h3):(2'h3)]) : (8'h9e)));
  assign wire16 = $signed({{($signed((8'hb6)) | $unsigned(wire13))}});
  assign wire17 = reg7[(3'h7):(1'h1)];
  assign wire18 = ($signed((~^((~|wire5) == wire4))) ?
                      ($signed({(wire15 <= wire14)}) ?
                          $unsigned(wire12) : wire15) : (($unsigned($signed(reg7)) >> $signed($signed((8'ha9)))) << (~^(!(wire17 - wire4)))));
  assign wire19 = wire14[(1'h0):(1'h0)];
  assign wire20 = (wire5 ? wire6 : $signed((!wire19[(2'h2):(1'h0)])));
  assign wire21 = wire20[(3'h4):(3'h4)];
  assign wire22 = ($unsigned(((^$unsigned(wire16)) ?
                      ({wire13, wire14} ?
                          wire21 : $unsigned(wire15)) : wire14)) | (^~({(8'h9e),
                      (!wire6)} && (((8'hb1) ? wire20 : wire5) || (wire17 ?
                      (8'hbc) : wire5)))));
  assign wire23 = wire1[(3'h4):(1'h1)];
endmodule
