module top
#(parameter param13 = (({((8'hbb) ? ((8'hab) & (8'ha7)) : ((8'haf) ? (8'hba) : (8'hb4)))} ? (8'hab) : ((|(+(8'ha6))) ? ({(8'haf), (8'haf)} ? ((8'hb1) ? (8'ha4) : (8'h9f)) : ((8'ha9) ? (8'hb5) : (8'ha2))) : {((8'h9f) < (8'h9e)), ((8'ha7) ? (8'hac) : (8'hb6))})) ~^ (({((7'h43) ? (7'h44) : (7'h44)), (~^(8'hb4))} <<< ({(7'h41), (7'h42)} && (!(8'hb9)))) ? ({((8'hb5) <<< (7'h43)), {(7'h40), (8'had)}} >>> (~&(^(8'hbf)))) : (((8'hbf) ? (^~(8'h9c)) : ((7'h42) ? (8'hbc) : (8'hbc))) - (((8'hb1) <= (8'hae)) <<< (8'hb5))))), 
parameter param14 = {{(8'h9f)}, {((&(&param13)) ? ({param13} ? (8'h9d) : (!param13)) : (~(param13 ? param13 : param13)))}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire6, reg12, reg11, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (7'h41);
    end
  assign wire6 = $unsigned(((^((^~wire3) ?
                     (wire1 ? reg5 : wire4) : (~&wire3))) ^ (~^((wire2 ?
                         wire4 : (8'hb8)) ?
                     $signed(wire0) : reg5))));
  assign wire7 = wire3[(4'ha):(4'ha)];
  assign wire8 = $signed($signed($signed((&{wire6}))));
  assign wire9 = (($signed((wire3[(4'h8):(3'h7)] ?
                     (~&wire4) : (^wire0))) < (({wire4,
                     wire4} <<< (wire4 ^ reg5)) >> (^(^reg5)))) ^ reg5[(2'h3):(2'h2)]);
  assign wire10 = ($signed(($signed((wire1 <= (8'hb2))) ?
                          $signed($signed(wire1)) : wire4[(1'h0):(1'h0)])) ?
                      reg5 : (&({(8'hbc),
                          $signed((8'ha8))} << ($unsigned((8'ha1)) ?
                          $unsigned(wire1) : $signed(wire4)))));
  always
    @(posedge clk) begin
      reg11 <= (~(|reg5[(3'h4):(1'h0)]));
      reg12 <= ((!$unsigned((~^$unsigned(wire6)))) ^ wire8);
    end
endmodule
