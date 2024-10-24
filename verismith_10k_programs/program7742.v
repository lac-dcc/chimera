module top
#(parameter param9 = ((((((8'ha3) ^ (8'ha6)) ? ((8'ha9) <<< (8'hbe)) : ((8'h9d) >> (8'hb4))) ? ((&(8'hab)) * ((8'had) ? (8'hbe) : (7'h43))) : (((7'h43) ? (8'hb2) : (8'ha9)) ? (8'hac) : {(8'hb4), (8'hab)})) ? (((~^(8'hae)) ? ((8'hbc) < (8'hae)) : ((7'h41) ? (8'h9e) : (7'h41))) & ((+(8'had)) ? ((8'haf) - (8'hb8)) : (^~(8'hb5)))) : ((&(|(7'h43))) && (|((7'h40) ? (8'ha8) : (8'hb6))))) == {((((8'hb3) ? (8'hbc) : (8'hb2)) ? (+(8'hb0)) : ((8'hb6) << (7'h42))) ? (((8'ha5) ? (8'ha4) : (8'ha4)) ? (&(8'hbc)) : (!(8'hae))) : ((^(8'h9e)) ? ((7'h42) ? (8'hb2) : (8'ha7)) : ((8'hb3) > (8'hb0)))), (^~(((8'ha7) ? (8'h9e) : (8'h9e)) ? (~&(8'hbf)) : (~|(8'ha0))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire8, wire6, wire5, wire4, reg7, (1'h0)};
  assign wire4 = ((wire1 - {wire3}) > (wire3 ?
                     (-($signed(wire1) ?
                         (wire0 || wire3) : $signed(wire2))) : (!wire1)));
  assign wire5 = $signed((wire1 + wire0[(3'h6):(2'h3)]));
  assign wire6 = (($signed((-(wire1 ?
                     wire2 : wire3))) | $signed((wire2[(4'hc):(3'h7)] & (8'h9f)))) && (((~&wire0[(1'h0):(1'h0)]) <= (8'hb3)) ?
                     wire2 : (((wire0 <<< wire5) < (8'ha8)) ?
                         wire4 : $signed(wire4))));
  always
    @(posedge clk) begin
      reg7 <= ((~|$signed(wire3[(2'h3):(2'h2)])) ?
          $unsigned({((!wire0) ?
                  (wire3 << wire1) : $signed((8'hb3)))}) : (-$signed($unsigned((wire3 ?
              wire3 : wire3)))));
    end
  assign wire8 = (((!(8'h9f)) ?
                     $signed({(&wire4), (wire2 + wire2)}) : (((wire0 ?
                                 wire6 : wire6) ?
                             {wire4, reg7} : (wire2 | wire1)) ?
                         wire3 : $signed($unsigned((8'hb2))))) == $unsigned(wire5[(2'h3):(2'h3)]));
endmodule
