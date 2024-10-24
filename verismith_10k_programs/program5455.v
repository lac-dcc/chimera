module top
#(parameter param15 = (&((~({(8'ha9), (8'ha4)} ? ((8'hbc) ^~ (8'ha1)) : ((7'h41) != (8'hbb)))) * (+{((8'hbb) ? (8'ha5) : (8'hb7))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  assign y = {wire14,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (($unsigned((~|$signed((8'hb3)))) > wire3) >>> $signed(({wire4} ?
                     wire1[(3'h5):(3'h4)] : wire0)));
  assign wire6 = wire5[(3'h7):(2'h3)];
  assign wire7 = wire3[(5'h13):(3'h7)];
  assign wire8 = {$signed({(~|{(8'ha1), wire0}), (!wire4)}),
                     (+$signed($signed((wire2 * wire2))))};
  assign wire9 = ((&$signed(($unsigned(wire3) == ((8'hae) + wire4)))) ?
                     $unsigned({$unsigned(wire5[(2'h3):(2'h3)]),
                         $signed((|wire2))}) : {{$signed({wire5, wire5})}});
  always
    @(posedge clk) begin
      reg10 <= $unsigned((wire8 <= ($signed(wire8) ?
          (wire5 ?
              $unsigned(wire3) : {wire8}) : (wire7 >>> $unsigned(wire4)))));
      reg11 <= ($unsigned((&{wire2, (^(8'hab))})) ?
          ($signed({{wire1}, (8'ha7)}) ?
              ($signed($signed(wire2)) ^ ((wire9 <<< wire4) && wire2)) : $unsigned((|$unsigned(wire0)))) : (8'ha1));
      reg12 <= wire8;
      reg13 <= wire3;
    end
  assign wire14 = (wire4[(5'h13):(3'h7)] > (~^(((^reg11) ?
                          $unsigned(wire1) : wire4[(1'h0):(1'h0)]) ?
                      (8'hac) : $unsigned((+(8'hac))))));
endmodule
