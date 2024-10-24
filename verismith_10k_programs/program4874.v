module top
#(parameter param17 = {({{(^(8'hb1))}} * (({(8'haa)} >> (8'hbe)) ? ({(8'h9d), (8'ha1)} <<< ((8'ha6) ? (8'hb9) : (8'ha8))) : (((8'h9f) ? (8'ha1) : (8'ha1)) >= ((8'hbb) == (8'hb4)))))}, 
parameter param18 = ((~(&{{param17, param17}})) ? (((!(param17 >> param17)) == ({param17} ? (~^param17) : ((8'hb9) ? (8'hb1) : (7'h43)))) ? (~^param17) : param17) : (~(((!(8'hac)) ? param17 : ((8'ha2) ? (8'haa) : (8'hb1))) & param17))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire5 = (wire4 ?
                     ((wire2 ?
                         $unsigned(wire4) : wire4) & (!wire3)) : ((-((^~(8'hbb)) <= (wire2 != wire0))) ?
                         $signed($signed((wire4 & wire4))) : ((!wire1[(1'h0):(1'h0)]) || $unsigned(((8'h9c) <<< wire1)))));
  assign wire6 = wire5[(1'h0):(1'h0)];
  assign wire7 = {(^$unsigned((~(8'hb8))))};
  assign wire8 = (wire0[(4'hb):(1'h0)] ?
                     $signed((wire6 <= {wire5,
                         {wire0}})) : ($signed($unsigned((wire5 || wire6))) ^ $unsigned(wire4[(2'h3):(2'h2)])));
  assign wire9 = ((($unsigned((!wire6)) ^ wire7) ?
                     wire3 : $unsigned(((+wire7) ?
                         wire7[(3'h7):(3'h5)] : (wire8 ?
                             wire5 : (8'hbc))))) <<< (^~wire7[(3'h5):(3'h5)]));
  assign wire10 = wire3;
  assign wire11 = $unsigned(wire0[(4'hb):(3'h6)]);
  assign wire12 = wire10[(3'h5):(1'h0)];
  assign wire13 = $unsigned((!(wire5[(2'h2):(1'h0)] ?
                      (&wire1) : $unsigned((~|wire1)))));
  assign wire14 = (-((7'h41) ? $signed({(8'h9d)}) : (8'h9d)));
  always
    @(posedge clk) begin
      reg15 <= $unsigned({{wire13, $unsigned((!wire14))}});
      reg16 <= $signed($unsigned($signed((wire2[(4'hd):(4'hd)] <= wire1))));
    end
endmodule
