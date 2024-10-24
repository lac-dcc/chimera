module top
#(parameter param15 = (({{((8'h9d) ? (8'haa) : (7'h43)), {(8'hae)}}, {((8'hab) ? (8'hba) : (7'h41)), (8'hb5)}} && (^({(8'hb0), (7'h40)} ~^ {(8'ha2)}))) ? ((~^(((8'hab) ? (8'hac) : (8'h9e)) + (~|(8'hb4)))) <= ((&(-(8'hb2))) & (((7'h42) ? (7'h42) : (8'haf)) ? ((8'hb7) ? (8'hbb) : (8'ha5)) : ((8'ha2) ? (8'haa) : (8'hb4))))) : (((8'ha8) == ({(7'h40)} << {(8'hbf)})) >> ({{(8'ha2)}} ? (^~(^~(8'hae))) : ({(7'h40)} ~^ {(8'hb4)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 reg6,
                 (1'h0)};
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      reg6 <= (^~wire4[(1'h1):(1'h0)]);
    end
  assign wire7 = wire3;
  assign wire8 = $unsigned(({(wire1[(3'h5):(2'h3)] << (~&reg6))} >> wire0));
  assign wire9 = (~^$signed(($signed(wire0[(4'he):(4'he)]) ?
                     (wire3 ?
                         $unsigned(wire4) : $signed(wire4)) : $signed(wire3[(3'h5):(3'h4)]))));
  assign wire10 = {(&$signed($signed($unsigned(wire4))))};
  assign wire11 = (wire2[(4'he):(4'hb)] + ($unsigned(wire2) - (&wire9)));
  assign wire12 = {$unsigned(($unsigned(wire0[(5'h13):(3'h7)]) + (!$unsigned(wire8))))};
  assign wire13 = wire11[(1'h1):(1'h0)];
  assign wire14 = (wire5[(4'h8):(2'h2)] ?
                      wire2[(4'he):(1'h0)] : wire0[(4'hb):(3'h4)]);
endmodule
