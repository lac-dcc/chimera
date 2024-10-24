module top
#(parameter param15 = ((({(~(8'ha6))} <<< (!{(8'h9f)})) ? {({(8'hb6)} ? ((8'hae) ? (8'hb5) : (7'h42)) : {(8'haf)})} : (8'hbf)) >>> {{(~|((8'hb6) ? (8'hb6) : (8'hae)))}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
                 reg5,
                 (1'h0)};
  assign wire4 = wire1[(4'hd):(3'h5)];
  always
    @(posedge clk) begin
      reg5 <= ($signed($unsigned(((wire4 ? wire3 : wire3) <= $signed(wire4)))) ?
          $signed(($unsigned((wire4 ? wire4 : (8'ha3))) ?
              (~|(~wire3)) : {$unsigned(wire2),
                  wire4})) : (^~$signed($unsigned((8'ha4)))));
    end
  assign wire6 = (~|wire0);
  assign wire7 = ((($signed($signed(wire2)) ?
                             ({wire2} ?
                                 wire4[(2'h3):(2'h2)] : {wire0,
                                     wire6}) : (reg5[(2'h3):(2'h3)] ?
                                 wire2 : (wire6 ? wire3 : wire0))) ?
                         $signed($unsigned((^wire4))) : {(wire2[(2'h2):(1'h1)] * (reg5 ?
                                 wire6 : wire1)),
                             (~^$signed(wire0))}) ?
                     (~wire1[(4'h9):(1'h1)]) : $signed((($unsigned(wire0) ?
                             $signed(wire0) : ((8'ha8) ? (7'h41) : wire3)) ?
                         ((reg5 ?
                             wire6 : reg5) && (wire0 < (8'hae))) : (!wire4[(1'h0):(1'h0)]))));
  assign wire8 = (wire2 >> $signed($signed(wire6)));
  assign wire9 = {$signed((~^wire8))};
  assign wire10 = $unsigned(((^$unsigned({wire4,
                      wire6})) || (^$signed(wire7))));
  assign wire11 = wire10[(3'h7):(3'h5)];
  assign wire12 = wire3[(3'h5):(1'h1)];
  assign wire13 = wire10[(1'h1):(1'h1)];
  assign wire14 = $signed($signed((($signed(wire0) ?
                      wire8[(3'h4):(2'h2)] : (wire7 ?
                          (8'hba) : reg5)) && $unsigned((wire9 ?
                      wire2 : wire10)))));
endmodule
