module top
#(parameter param10 = (({(&((7'h42) ? (8'haa) : (7'h43)))} ? ((((8'hae) ^ (8'ha3)) == {(8'ha7)}) ? (~&{(8'ha8)}) : (((8'ha2) ? (8'haa) : (8'ha4)) + ((8'had) * (8'ha4)))) : {(((7'h40) ^~ (8'ha2)) ? {(8'hbf)} : (~(8'hb7))), {(8'ha1)}}) ? {({(~&(8'hbd)), ((8'hb4) >> (8'ha8))} ? (((7'h41) ? (8'hb9) : (8'hb2)) < {(7'h41)}) : ((&(8'h9f)) ? (8'had) : (~(8'h9c))))} : (({((8'hb1) ? (7'h40) : (8'hab))} * (((7'h40) ? (8'hbe) : (8'ha9)) <<< ((8'hbe) + (8'hb4)))) ? (8'hb1) : (((+(8'hb3)) && ((8'hb5) ? (8'hbf) : (8'ha0))) ^ (~^((8'h9e) >>> (7'h44)))))), 
parameter param11 = (~({((8'ha1) ? (param10 ? param10 : param10) : (param10 ? param10 : param10)), (~^param10)} >> (({param10, param10} >= (param10 ? param10 : param10)) ? (+(param10 ? param10 : param10)) : (8'ha5)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire9, wire6, wire5, reg8, reg7, (1'h0)};
  assign wire5 = (^~$signed(wire2));
  assign wire6 = (wire4 - (~{{wire2[(4'h9):(3'h5)]}}));
  always
    @(posedge clk) begin
      reg7 <= wire0;
      reg8 <= {{reg7[(3'h7):(3'h4)],
              (wire4[(2'h2):(2'h2)] ~^ wire2[(4'hd):(4'hb)])},
          wire5};
    end
  assign wire9 = (reg7 ?
                     $signed((wire5[(2'h3):(1'h0)] ?
                         $unsigned({wire5}) : $unsigned(reg8))) : (reg8 ?
                         wire0[(2'h2):(2'h2)] : {(~|wire3[(2'h2):(1'h1)])}));
endmodule
