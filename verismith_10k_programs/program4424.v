module top
#(parameter param22 = (((({(8'hb1), (8'hb8)} >> ((8'ha1) >= (7'h43))) ? ({(8'ha2), (8'ha0)} || ((8'h9d) ? (8'hbc) : (7'h40))) : (~&((8'ha8) ? (7'h42) : (8'hbc)))) && (-(~|((8'haf) & (8'hb9))))) < (8'h9d)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire19;
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire21, wire6, wire7, wire19, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (~^((~^($unsigned(wire4) ?
              (wire1 || wire3) : (wire1 ? (8'hb1) : wire4))) ?
          (wire4[(5'h11):(3'h7)] ?
              (((8'hbc) ? wire1 : wire0) ?
                  $signed(wire3) : (~wire1)) : wire4) : (((wire0 ?
                  wire3 : wire3) ?
              wire1 : $unsigned((8'hbf))) != $signed((-wire3)))));
    end
  assign wire6 = wire0;
  assign wire7 = $unsigned({(&{$unsigned(wire3)}), wire3[(5'h10):(2'h3)]});
  module8 #() modinst20 (wire19, clk, wire1, wire2, wire6, reg5);
  assign wire21 = wire1[(3'h4):(2'h2)];
endmodule

module module8
#(parameter param17 = {{((~&{(8'h9e)}) ? {((8'ha4) ? (8'haf) : (8'ha6))} : (~&{(8'ha4)}))}}, 
parameter param18 = (((8'h9d) ? ((&param17) ~^ (^{param17})) : {(|(param17 < param17))}) ~^ param17))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  assign y = {wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = {($signed($unsigned((8'ha3))) * ($unsigned(wire10) ?
                          (^~wire11[(4'ha):(3'h5)]) : $unsigned((wire12 ?
                              wire10 : (8'ha7)))))};
  assign wire14 = $unsigned(wire9[(1'h0):(1'h0)]);
  assign wire15 = {(~wire10), $signed(wire9)};
  assign wire16 = (&((((wire10 ? (8'ha5) : wire15) ?
                          (wire9 && (8'hab)) : (~&wire12)) & (~|(wire11 - wire15))) ?
                      $unsigned($unsigned(((8'hae) ?
                          wire13 : wire12))) : (|({wire12} * $signed(wire12)))));
endmodule
