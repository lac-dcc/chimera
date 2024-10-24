module top
#(parameter param13 = ((8'ha4) * (((!((8'ha6) ? (8'hb7) : (8'had))) ? (&((8'hbc) ? (7'h44) : (7'h44))) : (((7'h42) ? (8'hbf) : (8'hb6)) >>> ((8'hb1) <<< (8'h9e)))) ? ({((8'h9c) >> (7'h41))} << ({(8'hb0), (8'hba)} <<< ((8'ha3) != (8'ha6)))) : ((((8'hb6) * (8'ha5)) < ((8'h9e) >= (8'h9c))) ? (~{(7'h43), (8'h9d)}) : (!((8'hae) ? (8'hb4) : (8'hb0)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed(wire3[(1'h1):(1'h1)]);
  assign wire6 = wire1[(4'hd):(3'h7)];
  assign wire7 = wire3;
  assign wire8 = (~|$signed($unsigned((((8'hb8) ? wire5 : wire5) ?
                     (wire2 ? wire4 : wire2) : $signed(wire0)))));
  assign wire9 = (~^{(wire2 ?
                         (|$unsigned((8'hae))) : $unsigned($unsigned((7'h44))))});
  assign wire10 = wire0;
  assign wire11 = (~&(wire6[(4'h8):(3'h6)] ?
                      {$signed({wire6}), (8'ha8)} : ({(wire4 >>> wire2)} ?
                          {(wire0 == wire5), wire10} : (&$signed(wire10)))));
  assign wire12 = (-((((wire5 ?
                      wire4 : wire8) & $unsigned(wire11)) << ((8'hb5) << ((8'hb8) != wire5))) - wire5));
endmodule
