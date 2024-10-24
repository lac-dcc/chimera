module top
#(parameter param13 = (~|({(((8'h9d) ? (8'hb0) : (8'hba)) ? ((7'h44) * (8'hb4)) : (~&(8'h9f)))} ? {(^~((8'haf) < (8'hbd))), {((7'h42) ^ (8'hb6)), (~^(8'ha6))}} : ((((8'hb0) >> (8'hbb)) ? ((8'ha1) ? (8'hb6) : (8'ha4)) : ((8'hbc) ? (8'haa) : (8'ha6))) ? {((8'h9f) ? (8'hb4) : (8'haa)), ((8'ha2) & (8'haf))} : {(^~(8'h9c))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = ($signed($signed($signed((wire3 == wire2)))) ?
                     (wire2[(4'ha):(1'h1)] ?
                         $signed(wire1[(1'h1):(1'h0)]) : (wire3[(5'h11):(4'he)] ?
                             ({wire0} ?
                                 $signed(wire1) : wire0[(3'h5):(2'h2)]) : ((wire2 >= wire2) ^~ (wire0 >>> wire2)))) : $signed($unsigned($unsigned($signed(wire1)))));
  assign wire5 = (^~wire0);
  assign wire6 = ($signed($unsigned($signed((wire4 ?
                     wire5 : wire1)))) ^ $unsigned((({wire0} && ((8'ha8) ^~ (8'hb6))) << {(wire3 ?
                         wire4 : wire5)})));
  assign wire7 = wire6[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg8 <= (({(-((8'ha7) ? wire0 : wire0))} ?
              $unsigned(($unsigned((8'h9f)) > (wire4 ?
                  wire6 : wire1))) : ($unsigned((wire2 ? wire5 : wire4)) ?
                  ((wire6 ? (8'hb3) : wire1) ?
                      wire4 : (~&wire6)) : {$unsigned(wire5)})) ?
          $signed($unsigned(wire3[(4'ha):(3'h6)])) : ((({wire4} ~^ (~&wire3)) ?
              (-$signed((8'ha9))) : ((wire3 ?
                  wire0 : wire3) + $signed(wire7))) >> (&wire0[(1'h0):(1'h0)])));
      reg9 <= (wire7 >= ($unsigned(wire1[(4'ha):(3'h5)]) ?
          $signed(wire0[(1'h1):(1'h0)]) : wire3[(4'hc):(2'h2)]));
    end
  assign wire10 = wire5;
  assign wire11 = $signed(wire5[(4'hc):(4'hc)]);
  assign wire12 = (~&$signed((-$unsigned($unsigned((8'ha9))))));
endmodule
