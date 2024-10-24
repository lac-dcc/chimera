module top
#(parameter param10 = (-(-(((~&(8'hb7)) ? ((8'hbb) ? (8'hb7) : (8'haa)) : (+(8'ha9))) <<< {((8'hb4) != (8'ha2)), ((8'hb6) ? (8'ha1) : (8'hb5))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire8, wire5, reg7, reg6, (1'h0)};
  assign wire5 = ($unsigned({(^wire1[(4'ha):(3'h5)]),
                     {{wire2, wire1}}}) > $unsigned(wire0[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg6 <= wire0;
      reg7 <= (((^({wire0, (7'h44)} ? (~^wire4) : wire3)) + wire0) ?
          $signed(wire0) : ((wire1[(3'h7):(3'h4)] ?
              $signed($signed(wire5)) : ((wire1 >> wire3) > wire5[(4'he):(4'hd)])) < ($signed(reg6) >>> reg6)));
    end
  assign wire8 = $unsigned({wire1, (&wire1[(4'ha):(4'ha)])});
  assign wire9 = (~^$signed((8'ha6)));
endmodule
