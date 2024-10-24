module top
#(parameter param11 = ({{((~^(8'hbb)) && ((8'ha5) + (8'hb7)))}} <= ({((8'h9d) ? ((8'ha2) ? (8'had) : (8'hb8)) : {(8'ha7)}), ((~^(8'hbc)) ? ((8'hb1) ? (8'hb8) : (8'h9f)) : (~|(8'ha7)))} <<< ((^((8'ha5) > (8'h9d))) >>> (~{(8'hb5), (8'hb5)})))), 
parameter param12 = (((param11 <= (-param11)) != (~|(param11 ? param11 : (^~param11)))) ? ((((~&(7'h42)) != param11) > (!param11)) < (param11 ? ((&param11) ? (param11 ? param11 : (8'hbf)) : (param11 >> param11)) : param11)) : (^~param11)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  assign y = {wire10, wire8, wire7, wire6, wire5, wire4, reg9, (1'h0)};
  assign wire4 = wire0[(4'he):(1'h0)];
  assign wire5 = {wire3[(3'h5):(2'h2)]};
  assign wire6 = {{($unsigned($signed(wire3)) && {(wire4 ? (8'hb0) : wire2),
                             ((8'ha9) ? wire2 : wire2)})}};
  assign wire7 = wire2;
  assign wire8 = (~&(~|wire0));
  always
    @(posedge clk) begin
      reg9 <= ($unsigned(($signed((~|(8'hb3))) ?
          (|((8'h9d) ? wire2 : wire2)) : wire2[(3'h6):(3'h4)])) >>> (({(wire2 ?
                  wire2 : wire1),
              (wire2 ~^ (8'ha7))} ?
          (wire6 << (&wire7)) : (+(~|wire4))) >= wire7));
    end
  assign wire10 = $signed({{wire3[(4'hf):(4'h8)]}, reg9[(4'h8):(1'h1)]});
endmodule
